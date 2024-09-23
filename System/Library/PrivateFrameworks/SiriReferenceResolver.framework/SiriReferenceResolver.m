uint64_t dispatch thunk of RRLinkSystemEntityHandling.systemEntityProtocolIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_2129E3A6C@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for MessageConversationStructuredDataHandler()
{
  return &type metadata for MessageConversationStructuredDataHandler;
}

uint64_t sub_2129E3AA4()
{
  return 0x475F6E6F6D6D6F63;
}

uint64_t sub_2129E3AC4()
{
  return 11;
}

unint64_t sub_2129E3ACC()
{
  return 0xD000000000000020;
}

uint64_t sub_2129E3AE8()
{
  return 0;
}

uint64_t sub_2129E3AF4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v2 = sub_212A04E54();
  v4 = sub_2129E3B90(a1, v2, v3);
  swift_bridgeObjectRelease();
  v5 = sub_2129ED90C(0, 0, 0, 0, v4, 0, 0, 0, 0xF000000000000000);
  swift_release();
  return v5;
}

unint64_t sub_2129E3B90(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unint64_t result;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = sub_212A0492C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_212A04A04();
  swift_allocObject();
  v10 = sub_212A049F8();
  sub_2129E3DE8(a1);
  if (v11)
  {
    sub_212A049EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_212A049EC();
  }
  v12 = objc_msgSend(a1, sel_messageConversationIdentifier);
  sub_212A04FB0();

  swift_bridgeObjectRetain();
  sub_212A04908();
  sub_212A04890();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  result = sub_2129E3E48(a1);
  if (!result)
    goto LABEL_16;
  v14 = result;
  if (!(result >> 62))
  {
    v15 = *(_QWORD *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v15)
      goto LABEL_7;
LABEL_15:
    swift_bridgeObjectRelease();
LABEL_16:
    v19 = MEMORY[0x212BF66C4](v10);
    swift_release();
    return v19;
  }
  result = sub_212A05250();
  v15 = result;
  if (!result)
    goto LABEL_15;
LABEL_7:
  if (v15 >= 1)
  {
    for (i = 0; i != v15; ++i)
    {
      if ((v14 & 0xC000000000000001) != 0)
        v17 = (id)MEMORY[0x212BF6F58](i, v14);
      else
        v17 = *(id *)(v14 + 8 * i + 32);
      v18 = v17;
      if (sub_212A01FE8(a2, a3, v17))
      {
        swift_retain();
        sub_212A049E0();
        swift_release_n();
      }

    }
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

unint64_t sub_2129E3DB4()
{
  sub_2129E3ACC();
  return 0xD000000000000020;
}

uint64_t sub_2129E3DD0(void **a1)
{
  return sub_2129E3AF4(*a1);
}

uint64_t sub_2129E3DE8(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_groupName);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_212A04FB0();

  return v3;
}

uint64_t sub_2129E3E48(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_recipients);
  if (!v1)
    return 0;
  v2 = v1;
  sub_2129E3EA4();
  v3 = sub_212A050AC();

  return v3;
}

unint64_t sub_2129E3EA4()
{
  unint64_t result;

  result = qword_254B5E390;
  if (!qword_254B5E390)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254B5E390);
  }
  return result;
}

uint64_t sub_2129E3EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_2129E3EE8()
{
  uint64_t v0;
  uint64_t result;

  OUTLINED_FUNCTION_27();
  v0 = OUTLINED_FUNCTION_51();
  result = sub_2129E5DA8();
  qword_253EFEF70 = v0;
  return result;
}

uint64_t sub_2129E3F18()
{
  uint64_t result;

  result = sub_2129E3F48(0x2E217D7B5D5B2928, 0xE800000000000000);
  qword_254B5E858 = result;
  return result;
}

uint64_t sub_2129E3F48(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[6];
  uint64_t v13;

  sub_212A04FF8();
  v4 = sub_212A05100();
  v13 = v4;
  v5 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v5 = a1 & 0xFFFFFFFFFFFFLL;
  v12[2] = a1;
  v12[3] = a2;
  v12[4] = 0;
  v12[5] = v5;
  v6 = sub_212A0501C();
  if (v7)
  {
    v8 = v6;
    v9 = v7;
    do
    {
      sub_2129E6DC0(v12, v8, v9);
      swift_bridgeObjectRelease();
      v8 = sub_212A0501C();
      v9 = v10;
    }
    while (v10);
    v4 = v13;
  }
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2129E4004(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  char v17;

  v5 = sub_212A04DE8();
  v6 = sub_2129E4360(v5, a2, a3);
  OUTLINED_FUNCTION_24();
  if ((v6 & 1) == 0)
  {
    v7 = sub_212A04DF4();
    if (!v7 || (v8 = v7, OUTLINED_FUNCTION_41(), v9 = sub_2129E41C0(v8), OUTLINED_FUNCTION_0(), (v9 & 1) == 0))
    {
      sub_212A04DE8();
      v11 = sub_212A04CF8();
      v13 = v12;
      swift_release();
      if (v11 == 0x505F6E6F6D6D6F63 && v13 == 0xED00006E6F737265)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v15 = OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_0();
        v10 = 0;
        if ((v15 & 1) == 0)
          return v10 & 1;
      }
      if (sub_212A04CF8() == 0xD000000000000012 && v16 == 0x8000000212A06890)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v17 = OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_0();
        v10 = 0;
        if ((v17 & 1) == 0)
          return v10 & 1;
      }
      v10 = a3;
      return v10 & 1;
    }
  }
  v10 = 1;
  return v10 & 1;
}

uint64_t sub_2129E41C0(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v11;

  if (a1 >> 62)
    goto LABEL_18;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; v2 = sub_212A05250())
  {
    v3 = 4;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
        MEMORY[0x212BF6F58](v3 - 4, a1);
      else
        swift_retain();
      v4 = v3 - 3;
      if (__OFADD__(v3 - 4, 1))
        break;
      v5 = sub_212A04CF8();
      v7 = v6;
      if (v5 == sub_212A04CF8() && v7 == v8)
      {
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        v11 = 1;
        goto LABEL_20;
      }
      v10 = sub_212A052B0();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v10 & 1) != 0)
      {
        swift_release();
        v11 = 1;
        goto LABEL_20;
      }
      ++v3;
      if (v4 == v2)
        goto LABEL_19;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
LABEL_19:
  swift_release();
  v11 = 0;
LABEL_20:
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_2129E4360(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  v4 = sub_212A04CF8();
  v6 = v5;
  v7 = sub_212A04CF8();
  v9 = v8;
  v10 = v4 == 0x535F6E6F6D6D6F63 && v6 == 0xEE00676E69747465;
  if (v10 || (OUTLINED_FUNCTION_49(), (OUTLINED_FUNCTION_1() & 1) != 0))
  {
    v11 = v7 == 0x535F6E6F6D6D6F63 && v9 == 0xEE00676E69747465;
    if (v11 || (OUTLINED_FUNCTION_1() & 1) != 0)
    {
      OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_2();
      return 1;
    }
  }
  v13 = v4 == v7 && v6 == v9;
  if (v13
    || (OUTLINED_FUNCTION_49(), (OUTLINED_FUNCTION_1() & 1) != 0)
    || (v4 == 0x6E456F4E5F6F7375 ? (v18 = v6 == 0xEC00000079746974) : (v18 = 0),
        v18 || (OUTLINED_FUNCTION_49(), (OUTLINED_FUNCTION_1() & 1) != 0)))
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  v19 = sub_2129F1F0C(v7, v9, *(_QWORD *)(v3 + OBJC_IVAR____TtC21SiriReferenceResolver16BaseQueryMatcher_equivalentTypesForEntityType));
  if (v19)
  {
    v20 = (_QWORD *)v19;
    v21 = OUTLINED_FUNCTION_49();
    v23 = sub_2129E92E4(v21, v22, v20);
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_0();
    if ((v23 & 1) == 0)
      goto LABEL_29;
LABEL_18:
    v14 = sub_212A04CE0();
    v15 = sub_212A04CE0();
    sub_2129E45A4(v14, v15, v7, v9, a3 & 1);
    v17 = v16;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_2();
    return v17 & 1;
  }
  OUTLINED_FUNCTION_2();
LABEL_29:
  swift_bridgeObjectRelease();
  return 0;
}

void sub_2129E45A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  int v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  BOOL v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  NSObject *v30;
  os_log_type_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v54;
  unint64_t v55;
  char v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  unint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v77;
  uint64_t v78;
  int64_t v79;

  v6 = a4;
  v7 = a3;
  v78 = a2 + 64;
  v9 = 1 << *(_BYTE *)(a2 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(a2 + 64);
  v71 = OBJC_IVAR____TtC21SiriReferenceResolver16BaseQueryMatcher_equivalentTypesForEntityType;
  v79 = (unint64_t)(v9 + 63) >> 6;
  v12 = a3 == 0xD000000000000015 && a4 == 0x8000000212A06540;
  v13 = v12;
  v75 = v13;
  swift_bridgeObjectRetain();
  v14 = 0;
  OUTLINED_FUNCTION_17();
  v72 = v15;
  v73 = v16;
  v74 = v7;
  while (1)
  {
    while (1)
    {
      while (1)
      {
        while (1)
        {
          if (v11)
          {
            v17 = __clz(__rbit64(v11));
            v11 &= v11 - 1;
            v18 = v17 | (v14 << 6);
          }
          else
          {
            v19 = v14 + 1;
            if (__OFADD__(v14, 1))
            {
              __break(1u);
LABEL_112:
              __break(1u);
LABEL_113:
              __break(1u);
LABEL_114:
              __break(1u);
              return;
            }
            if (v19 >= v79)
              goto LABEL_110;
            v20 = *(_QWORD *)(v78 + 8 * v19);
            ++v14;
            if (!v20)
            {
              v14 = v19 + 1;
              if (v19 + 1 >= v79)
                goto LABEL_110;
              v20 = *(_QWORD *)(v78 + 8 * v14);
              if (!v20)
              {
                v14 = v19 + 2;
                if (v19 + 2 >= v79)
                  goto LABEL_110;
                v20 = *(_QWORD *)(v78 + 8 * v14);
                if (!v20)
                {
                  v21 = v19 + 3;
                  if (v21 >= v79)
                    goto LABEL_110;
                  v20 = *(_QWORD *)(v78 + 8 * v21);
                  if (!v20)
                  {
                    while (1)
                    {
                      v14 = v21 + 1;
                      if (__OFADD__(v21, 1))
                        goto LABEL_112;
                      if (v14 >= v79)
                        goto LABEL_110;
                      v20 = *(_QWORD *)(v78 + 8 * v14);
                      ++v21;
                      if (v20)
                        goto LABEL_25;
                    }
                  }
                  v14 = v21;
                }
              }
            }
LABEL_25:
            v11 = (v20 - 1) & v20;
            v18 = __clz(__rbit64(v20)) + (v14 << 6);
          }
          v22 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v18);
          v23 = *v22;
          v24 = v22[1];
          v25 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v18);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if ((sub_212A05070() & 1) == 0)
            break;
          OUTLINED_FUNCTION_9();
          OUTLINED_FUNCTION_16();
        }
        if ((a5 & 1) != 0)
        {
          v26 = v23 == 0x6C6562616CLL && v24 == 0xE500000000000000;
          if (v26 || (OUTLINED_FUNCTION_39(), (OUTLINED_FUNCTION_1() & 1) != 0))
          {
            if (v75 || (OUTLINED_FUNCTION_48(), (OUTLINED_FUNCTION_1() & 1) != 0))
            {
              OUTLINED_FUNCTION_9();
LABEL_37:
              OUTLINED_FUNCTION_9();
              v27 = sub_212A04D88();
              v28 = sub_212A0510C();
              if (!OUTLINED_FUNCTION_32(v28))
                goto LABEL_65;
              v29 = (uint8_t *)OUTLINED_FUNCTION_40();
              *(_WORD *)v29 = 0;
              v30 = v27;
              v31 = v23;
              v32 = "Disable label matching qualified";
              goto LABEL_64;
            }
            v33 = *(_QWORD *)(v77 + v71);
            if (*(_QWORD *)(v33 + 16))
            {
              swift_bridgeObjectRetain();
              v34 = OUTLINED_FUNCTION_48();
              v36 = sub_2129F3ED0(v34, v35);
              if ((v37 & 1) != 0)
              {
                v70 = a5;
                v38 = *(_QWORD *)(*(_QWORD *)(v33 + 56) + 8 * v36);
                OUTLINED_FUNCTION_8();
                OUTLINED_FUNCTION_12();
                v39 = *(_QWORD *)(v38 + 16);
                if (v39)
                {
                  OUTLINED_FUNCTION_31();
                  if (v12 && (OUTLINED_FUNCTION_34(), v12) || (OUTLINED_FUNCTION_1() & 1) != 0)
                  {
LABEL_46:
                    OUTLINED_FUNCTION_16();
                    OUTLINED_FUNCTION_0();
                    a5 = v70;
                    goto LABEL_37;
                  }
                  if (v39 != 1)
                  {
                    OUTLINED_FUNCTION_31();
                    if (v12)
                    {
                      OUTLINED_FUNCTION_34();
                      if (v12)
                        goto LABEL_46;
                    }
                    if ((OUTLINED_FUNCTION_1() & 1) != 0)
                      goto LABEL_46;
                    if (v39 != 2)
                    {
                      v65 = v38 + 72;
                      v66 = 2;
                      while (!__OFADD__(v66, 1))
                      {
                        v67 = v66 + 1;
                        v68 = v66;
                        v69 = v65;
                        OUTLINED_FUNCTION_31();
                        if (v12)
                        {
                          OUTLINED_FUNCTION_34();
                          if (v12)
                            goto LABEL_46;
                        }
                        if ((OUTLINED_FUNCTION_1() & 1) != 0)
                          goto LABEL_46;
                        v65 = v69 + 16;
                        v66 = v68 + 1;
                        if (v67 == v39)
                          goto LABEL_49;
                      }
                      goto LABEL_114;
                    }
                  }
                }
LABEL_49:
                OUTLINED_FUNCTION_0();
                a5 = v70;
              }
              else
              {
                OUTLINED_FUNCTION_12();
              }
            }
          }
        }
        if (v23 != 1701869940 || v24 != 0xE400000000000000)
        {
          OUTLINED_FUNCTION_39();
          if ((OUTLINED_FUNCTION_1() & 1) == 0)
            break;
        }
        if (qword_253EFEE28 != -1)
          swift_once();
        if (qword_253EFEFA8 != v7 || unk_253EFEFB0 != v6)
        {
          OUTLINED_FUNCTION_48();
          if ((OUTLINED_FUNCTION_1() & 1) == 0)
            break;
        }
        OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_9();
        v27 = sub_212A04D88();
        v42 = sub_212A0510C();
        if (!OUTLINED_FUNCTION_32(v42))
          goto LABEL_65;
        v29 = (uint8_t *)OUTLINED_FUNCTION_40();
        *(_WORD *)v29 = 0;
        v30 = v27;
        v31 = v23;
        v32 = "Skip matching common_Calendar.type.common_CalendarEventType";
LABEL_64:
        _os_log_impl(&dword_2129E2000, v30, v31, v32, v29, 2u);
        MEMORY[0x212BF7480](v29, -1, -1);
LABEL_65:

      }
      if (!*(_QWORD *)(a1 + 16))
      {
        OUTLINED_FUNCTION_9();
LABEL_107:
        OUTLINED_FUNCTION_13();
LABEL_109:
        swift_bridgeObjectRelease();
        return;
      }
      swift_bridgeObjectRetain();
      v43 = OUTLINED_FUNCTION_39();
      v45 = sub_2129F3ED0(v43, v44);
      if ((v46 & 1) == 0)
      {
        OUTLINED_FUNCTION_13();
        swift_bridgeObjectRelease_n();
        goto LABEL_109;
      }
      v47 = a5;
      v48 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v45);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_9();
      v49 = v6;
      v50 = v47;
      v51 = v7;
      v52 = v49;
      LOBYTE(v47) = sub_2129E4CF4(v48, v25, v51, v49, v23, v24, v47 & 1);
      OUTLINED_FUNCTION_26();
      if ((v47 & 1) == 0)
        break;
      OUTLINED_FUNCTION_9();
      OUTLINED_FUNCTION_16();
      a5 = v50;
      v6 = v52;
      v7 = v74;
    }
    if (v23 != 1701667182 || v24 != 0xE400000000000000)
      break;
    swift_bridgeObjectRelease();
    a5 = v50;
LABEL_77:
    if (!*(_QWORD *)(a1 + 16))
      goto LABEL_107;
    v55 = sub_2129F3ED0(0xD000000000000018, v73);
    if ((v56 & 1) == 0)
      goto LABEL_107;
    v57 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v55);
    if (v57 >> 62)
    {
      swift_bridgeObjectRetain_n();
      v58 = sub_212A05250();
      OUTLINED_FUNCTION_0();
    }
    else
    {
      v58 = *(_QWORD *)((v57 & 0xFFFFFFFFFFFFF8) + 0x10);
      OUTLINED_FUNCTION_8();
    }
    v6 = v52;
    v7 = v74;
    if (!v58)
      goto LABEL_105;
    if ((v57 & 0xC000000000000001) != 0)
      OUTLINED_FUNCTION_10();
    if (!*(_QWORD *)((v57 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_113;
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_0();
    v59 = sub_212A04CBC();
    OUTLINED_FUNCTION_15();
    if (!v59)
      goto LABEL_107;
    v60 = sub_212A04CE0();
    swift_release();
    if (!*(_QWORD *)(v60 + 16) || (v61 = sub_2129F3ED0(0x6C6562616CLL, 0xE500000000000000), (v62 & 1) == 0))
    {
LABEL_105:
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_16();
      goto LABEL_109;
    }
    v63 = *(_QWORD *)(*(_QWORD *)(v60 + 56) + 8 * v61);
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_0();
    v64 = sub_2129E4CF4(v63, v25, 0xD000000000000012, v72, 0x6C6562616CLL, 0xE500000000000000, a5 & 1);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_11();
    if ((v64 & 1) == 0)
      goto LABEL_110;
  }
  OUTLINED_FUNCTION_39();
  v54 = OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  a5 = v50;
  if ((v54 & 1) != 0)
    goto LABEL_77;
  OUTLINED_FUNCTION_16();
LABEL_110:
  OUTLINED_FUNCTION_13();
}

uint64_t sub_2129E4CF4(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v19;

  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    v15 = sub_212A05250();
    OUTLINED_FUNCTION_47();
  }
  else
  {
    v15 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v16 = sub_212A05250();
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v16 >= v15)
  {
    v19 = MEMORY[0x24BEE4B08];
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_46();
    v17 = sub_2129E4E3C(a2, v7, a1, &v19, a3, a4, a5, a6, a7 & 1);
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0;
  }
  return v17 & 1;
}

uint64_t sub_2129E4E3C(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  if (a1 >> 62)
    goto LABEL_12;
  v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v10; v10 = sub_212A05250())
  {
    v11 = 4;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v12 = MEMORY[0x212BF6F58](v11 - 4, a1);
      }
      else
      {
        v12 = *(_QWORD *)(a1 + 8 * v11);
        swift_retain();
      }
      v13 = v11 - 3;
      if (__OFADD__(v11 - 4, 1))
        break;
      v14 = sub_2129E4F88(v12, a3, a4, a5, a6, a7, a8, a9 & 1);
      swift_release();
      if ((v14 & 1) != 0)
      {
        ++v11;
        if (v13 != v10)
          continue;
      }
      goto LABEL_14;
    }
    __break(1u);
LABEL_12:
    swift_bridgeObjectRetain();
  }
  v14 = 1;
LABEL_14:
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14 & 1;
}

uint64_t sub_2129E4F88(uint64_t a1, unint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v22;

  if (a2 >> 62)
    goto LABEL_22;
  v11 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_30();
  for (; v11; v11 = sub_212A05250())
  {
    v12 = 0;
    a3 = (uint64_t *)*a3;
    v13 = a3 + 7;
    a8 &= 1u;
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        MEMORY[0x212BF6F58](v12, a2);
      }
      else
      {
        if (v12 >= *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_21;
        OUTLINED_FUNCTION_41();
      }
      v14 = v12 + 1;
      if (__OFADD__(v12, 1))
        break;
      if (a3[2])
      {
        v15 = sub_212A05310();
        v16 = -1 << *((_BYTE *)a3 + 32);
        v17 = v15 & ~v16;
        if (((*(unint64_t *)((char *)v13 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8)) >> v17) & 1) != 0)
        {
          v18 = a3[6];
          if (*(_QWORD *)(v18 + 8 * v17) == v12)
            goto LABEL_17;
          v19 = ~v16;
          while (1)
          {
            v17 = (v17 + 1) & v19;
            if (((*(unint64_t *)((char *)v13 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8)) >> v17) & 1) == 0)
              break;
            if (*(_QWORD *)(v18 + 8 * v17) == v12)
              goto LABEL_17;
          }
        }
      }
      sub_2129E5284();
      if ((v20 & 1) != 0)
      {
        OUTLINED_FUNCTION_11();
        sub_2129E6F4C(&v22, v12);
        OUTLINED_FUNCTION_42();
        return 1;
      }
LABEL_17:
      OUTLINED_FUNCTION_42();
      ++v12;
      if (v14 == v11)
        goto LABEL_18;
    }
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    OUTLINED_FUNCTION_30();
  }
LABEL_18:
  OUTLINED_FUNCTION_11();
  return 0;
}

uint64_t sub_2129E5150(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_212A0531C();
    sub_212A04F8C();
    v6 = sub_212A05334();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_212A052B0() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_212A052B0() & 1) != 0)
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

void sub_2129E5284()
{
  char v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  OUTLINED_FUNCTION_18();
  v1 = v0;
  v3 = v2;
  sub_212A04C98();
  if (v4)
  {
    OUTLINED_FUNCTION_27();
    sub_2129E537C();
    OUTLINED_FUNCTION_26();
  }
  else
  {
    v5 = sub_212A04CA4();
    if ((v6 & 1) != 0)
    {
      v7 = sub_212A04CBC();
      if (v7)
      {
        sub_2129E58E8(v3, v7, v1 & 1);
      }
      else
      {
        if (!sub_212A04CC8())
          goto LABEL_10;
        sub_2129E5940();
      }
      swift_release();
      goto LABEL_10;
    }
    sub_2129E58B8(v3, v5);
  }
LABEL_10:
  OUTLINED_FUNCTION_3();
}

void sub_2129E537C()
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
  BOOL v9;
  BOOL v10;
  char v11;
  BOOL v12;
  uint64_t v13;
  char v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  OUTLINED_FUNCTION_18();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  sub_212A04C98();
  if (!v8)
    goto LABEL_49;
  if (v1)
  {
    v9 = v3 == 1701667182 && v1 == 0xE400000000000000;
    if (v9 || (OUTLINED_FUNCTION_1() & 1) != 0)
    {
      OUTLINED_FUNCTION_33();
      sub_2129E5690();
LABEL_48:
      OUTLINED_FUNCTION_2();
      goto LABEL_49;
    }
    v10 = v3 == 0x6C6562616CLL && v1 == 0xE500000000000000;
    if (v10 || (OUTLINED_FUNCTION_1() & 1) != 0)
    {
      if (!v5)
        goto LABEL_50;
      if (v7 == 0xD000000000000012 && v5 == 0x8000000212A06890
        || (OUTLINED_FUNCTION_1() & 1) != 0
        || v7 == 0xD000000000000013 && v5 == 0x8000000212A068B0
        || (OUTLINED_FUNCTION_1() & 1) != 0)
      {
        goto LABEL_47;
      }
LABEL_28:
      v11 = OUTLINED_FUNCTION_1();
      if (!v1 || (v11 & 1) == 0)
        goto LABEL_36;
      goto LABEL_30;
    }
  }
  if (!v5)
    goto LABEL_50;
  if (v7 != 0xD000000000000012 || v5 != 0x8000000212A06890)
    goto LABEL_28;
  if (v1)
  {
LABEL_30:
    OUTLINED_FUNCTION_37();
    v12 = v9 && v1 == 0xE500000000000000;
    if (v12 || (OUTLINED_FUNCTION_1() & 1) != 0)
    {
      sub_2129E5708();
      goto LABEL_48;
    }
LABEL_36:
    if (v7 == 0xD000000000000014)
    {
      OUTLINED_FUNCTION_17();
      if (v5 == v13)
      {
        if (!v1)
          goto LABEL_50;
LABEL_42:
        OUTLINED_FUNCTION_37();
        v15 = v9 && v1 == 0xE500000000000000;
        if (v15 || (OUTLINED_FUNCTION_1() & 1) != 0)
        {
LABEL_47:
          OUTLINED_FUNCTION_33();
          sub_2129E5810();
          goto LABEL_48;
        }
        goto LABEL_50;
      }
    }
  }
  v14 = OUTLINED_FUNCTION_1();
  if (v1 && (v14 & 1) != 0)
    goto LABEL_42;
LABEL_50:
  v16 = sub_212A04FC8();
  v18 = v17;
  OUTLINED_FUNCTION_2();
  if (v16 == sub_212A04FC8() && v18 == v19)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2();
  }
LABEL_49:
  OUTLINED_FUNCTION_3();
}

uint64_t sub_2129E5690()
{
  char v0;

  sub_2129E5AA0();
  sub_2129E5AA0();
  OUTLINED_FUNCTION_54();
  v0 = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_2();
  return v0 & 1;
}

uint64_t sub_2129E5708()
{
  id v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  char v4;

  sub_2129E89D8();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_48();
  v0 = sub_2129E5C20();
  sub_2129E8F8C(v0);
  if (v1)
  {
    OUTLINED_FUNCTION_30();
    v2 = sub_2129E5C20();
    sub_2129E8F8C(v2);
    if (v3)
    {
      OUTLINED_FUNCTION_54();
      v4 = OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_2();
    }
    else
    {
      sub_2129E6D84();
      v4 = OUTLINED_FUNCTION_4();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2129E6D84();
    v4 = OUTLINED_FUNCTION_4();
  }
  return v4 & 1;
}

uint64_t sub_2129E5810()
{
  char v0;

  sub_2129E5AA0();
  sub_2129E5AA0();
  OUTLINED_FUNCTION_54();
  if ((OUTLINED_FUNCTION_19() & 1) != 0)
  {
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_2();
    v0 = 1;
  }
  else
  {
    v0 = OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_2();
  }
  return v0 & 1;
}

BOOL sub_2129E58B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;

  v3 = sub_212A04CA4();
  return (v4 & 1) == 0 && v3 == a2;
}

void sub_2129E58E8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5;

  v5 = sub_212A04CBC();
  if (v5)
  {
    sub_2129E4360(a2, v5, a3 & 1);
    OUTLINED_FUNCTION_15();
  }
  OUTLINED_FUNCTION_7();
}

void sub_2129E5940()
{
  if (sub_212A04CC8())
  {
    sub_2129E5988();
    OUTLINED_FUNCTION_15();
  }
  OUTLINED_FUNCTION_22();
}

void sub_2129E5988()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = sub_212A048C0();
  v2 = v1;
  v3 = sub_212A048C0();
  if (v2)
  {
    if (!v4)
    {
      OUTLINED_FUNCTION_12();
      goto LABEL_18;
    }
    if (v0 != v3 || v2 != v4)
    {
      v6 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_12();
      if ((v6 & 1) == 0)
        goto LABEL_18;
      goto LABEL_13;
    }
    OUTLINED_FUNCTION_0();
  }
  swift_bridgeObjectRelease();
LABEL_13:
  v7 = sub_212A048B4();
  v8 = sub_212A048B4();
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
      OUTLINED_FUNCTION_41();
      sub_2129E5284(v9, v7, 0, 0, 0, 0, 0);
      OUTLINED_FUNCTION_15();
      swift_release_n();
    }
    else
    {
      OUTLINED_FUNCTION_42();
    }
  }
  else
  {
    OUTLINED_FUNCTION_15();
  }
LABEL_18:
  OUTLINED_FUNCTION_7();
}

uint64_t sub_2129E5AA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRetain();
  v0 = sub_212A0501C();
  if (v1)
  {
    v2 = v0;
    v3 = v1;
    do
    {
      if (qword_254B5DE18 != -1)
        swift_once();
      if ((sub_2129E5150(v2, v3, qword_254B5E858) & 1) == 0)
        MEMORY[0x212BF6D78](v2, v3);
      OUTLINED_FUNCTION_11();
      v2 = sub_212A0501C();
      v3 = v4;
    }
    while (v4);
  }
  swift_bridgeObjectRelease();
  sub_2129E6D84();
  sub_212A05178();
  OUTLINED_FUNCTION_2();
  v5 = sub_212A04FC8();
  OUTLINED_FUNCTION_11();
  return v5;
}

id sub_2129E5C20()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_212A04FA4();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithStringValue_, v1);

  return v2;
}

uint64_t sub_2129E5C90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC21SiriReferenceResolver16BaseQueryMatcher_logger;
  v2 = sub_212A04DA0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return type metadata accessor for BaseQueryMatcher();
}

uint64_t type metadata accessor for BaseQueryMatcher()
{
  uint64_t result;

  result = qword_253EFEDE8;
  if (!qword_253EFEDE8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2129E5D30()
{
  uint64_t result;
  unint64_t v1;

  result = sub_212A04DA0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_2129E5DA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_27();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253EFEDF8);
  sub_212A04FBC();
  sub_212A04D94();
  v1 = OBJC_IVAR____TtC21SiriReferenceResolver16BaseQueryMatcher_equivalentTypesForEntityType;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEF20);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212A05860;
  strcpy((char *)(inited + 32), "common_Group");
  *(_BYTE *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(_QWORD *)(inited + 48) = &unk_24CE6FB48;
  *(_QWORD *)(inited + 56) = 0xD000000000000013;
  OUTLINED_FUNCTION_17();
  *(_QWORD *)(v3 + 64) = v4;
  *(_QWORD *)(v3 + 72) = &unk_24CE6FB78;
  OUTLINED_FUNCTION_17();
  v5[10] = v7;
  v5[11] = v6;
  v5[12] = &unk_24CE6FBA8;
  v5[13] = 0xD000000000000010;
  OUTLINED_FUNCTION_17();
  *(_QWORD *)(v8 + 112) = v9;
  *(_QWORD *)(v8 + 120) = &unk_24CE6FBD8;
  strcpy((char *)(v8 + 128), "common_Message");
  *(_BYTE *)(v8 + 143) = -18;
  *(_QWORD *)(v8 + 144) = &unk_24CE6FC08;
  strcpy((char *)(v8 + 152), "common_Email");
  *(_BYTE *)(v8 + 165) = 0;
  *(_WORD *)(v8 + 166) = -5120;
  *(_QWORD *)(v8 + 168) = &unk_24CE6FC38;
  OUTLINED_FUNCTION_17();
  v10[22] = 0xD000000000000010;
  v10[23] = v11;
  v10[24] = &unk_24CE6FC68;
  v10[25] = v12;
  v10[26] = 0x8000000212A06870;
  v10[27] = &unk_24CE6FC98;
  OUTLINED_FUNCTION_17();
  v13[28] = v15;
  v13[29] = v14;
  v13[30] = &unk_24CE6FCC8;
  v13[31] = v16;
  v13[32] = 0x8000000212A068B0;
  v13[33] = &unk_24CE6FCF8;
  v13[34] = 0xD000000000000016;
  v13[35] = 0x8000000212A06980;
  v13[36] = &unk_24CE6FD28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEEF0);
  *(_QWORD *)(v0 + v1) = sub_212A04F74();
  return v0;
}

uint64_t sub_2129E5FF4(uint64_t a1, uint64_t a2, char a3)
{
  return sub_2129E4004(a1, a2, a3) & 1;
}

uint64_t sub_2129E6018()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for AttachmentQueryMatcher();
  v0 = swift_allocObject();
  result = sub_2129E6430();
  qword_253EFF000 = v0;
  return result;
}

uint64_t sub_2129E6050()
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
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  uint64_t v24;

  v1 = v0;
  OUTLINED_FUNCTION_20();
  v2 = sub_2129E6278();
  OUTLINED_FUNCTION_24();
  if (!v2)
    goto LABEL_30;
  v3 = sub_212A04CF8();
  v5 = v4;
  OUTLINED_FUNCTION_21();
  v6 = *(_QWORD *)(v1 + 16);
  OUTLINED_FUNCTION_8();
  v7 = sub_2129F1F48(v3, v5, v6);
  v9 = v8;
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_0();
  v10 = sub_212A04CF8();
  if (v9)
  {
    if (v10 == v7 && v9 == v11)
    {
      OUTLINED_FUNCTION_12();
LABEL_25:
      swift_bridgeObjectRelease();
      return 1;
    }
    v13 = OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_0();
    if ((v13 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
    OUTLINED_FUNCTION_0();
  }
  v14 = OUTLINED_FUNCTION_43();
  v15 = sub_2129F1F0C(0xD000000000000018, 0x8000000212A06850, v14);
  OUTLINED_FUNCTION_47();
  if (!v15)
    goto LABEL_28;
  OUTLINED_FUNCTION_44();
  if (!v17)
  {
    if (*(_QWORD *)(v16 + 16))
      goto LABEL_13;
LABEL_27:
    OUTLINED_FUNCTION_0();
    goto LABEL_28;
  }
  OUTLINED_FUNCTION_8();
  v24 = sub_212A05250();
  OUTLINED_FUNCTION_0();
  if (!v24)
    goto LABEL_27;
LABEL_13:
  OUTLINED_FUNCTION_5();
  if ((v15 & 0xC000000000000001) != 0)
    OUTLINED_FUNCTION_10();
  swift_retain();
  OUTLINED_FUNCTION_0();
  v18 = sub_212A04CBC();
  swift_release();
  if (!v18)
  {
LABEL_28:
    if (!v9)
      return 1;
    goto LABEL_29;
  }
  v19 = sub_212A04CF8();
  v21 = v20;
  OUTLINED_FUNCTION_35();
  if (!v9)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
  if (v19 == v7 && v9 == v21)
  {
    OUTLINED_FUNCTION_0();
    goto LABEL_25;
  }
  v23 = OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  if ((v23 & 1) != 0)
    return 1;
LABEL_30:
  if (qword_253EFEDE0 != -1)
    swift_once();
  return OUTLINED_FUNCTION_28() & 1;
}

void sub_2129E6270()
{
  JUMPOUT(0x2129E6158);
}

uint64_t sub_2129E6278()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v0 = OUTLINED_FUNCTION_50();
  v1 = sub_2129F1F0C(1701869940, 0xE400000000000000, v0);
  v2 = OUTLINED_FUNCTION_0();
  if (!v1)
    return 0;
  if (!(v1 >> 62))
  {
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_4;
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
  OUTLINED_FUNCTION_46();
  v10 = sub_212A05250();
  v2 = OUTLINED_FUNCTION_2();
  if (!v10)
    goto LABEL_13;
LABEL_4:
  OUTLINED_FUNCTION_52(v2, (v1 & 0xC000000000000001) == 0);
  if ((v1 & 0xC000000000000001) != 0)
    OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_2();
  v3 = sub_212A04CBC();
  OUTLINED_FUNCTION_21();
  if (!v3)
    return 0;
  v4 = OUTLINED_FUNCTION_43();
  v5 = sub_2129F1F0C(0x5664656E69666564, 0xEC00000065756C61, v4);
  OUTLINED_FUNCTION_11();
  if (!v5)
  {
    OUTLINED_FUNCTION_13();
    return 0;
  }
  OUTLINED_FUNCTION_44();
  if (v7)
  {
    OUTLINED_FUNCTION_8();
    v11 = sub_212A05250();
    OUTLINED_FUNCTION_0();
    if (v11)
      goto LABEL_9;
    goto LABEL_17;
  }
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_17:
    OUTLINED_FUNCTION_13();
    goto LABEL_13;
  }
LABEL_9:
  OUTLINED_FUNCTION_5();
  if ((v5 & 0xC000000000000001) != 0)
    OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_0();
  v8 = sub_212A04CBC();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_13();
  return v8;
}

void sub_2129E63E4()
{
  JUMPOUT(0x2129E6344);
}

uint64_t sub_2129E63EC()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AttachmentQueryMatcher()
{
  return objc_opt_self();
}

uint64_t sub_2129E6430()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t inited;
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
  _BYTE v27[208];
  uint64_t v28;
  uint64_t v29;

  OUTLINED_FUNCTION_18();
  v28 = v1;
  v29 = v2;
  v3 = v0;
  v4 = sub_212A04B18();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = &v27[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = &v27[-v9];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v27[-v11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEF18);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212A05870;
  OUTLINED_FUNCTION_45((uint64_t)v12, *MEMORY[0x24BEA1A70]);
  v14 = sub_212A04B0C();
  v16 = v15;
  OUTLINED_FUNCTION_55((uint64_t)v12);
  *(_QWORD *)(inited + 32) = v14;
  *(_QWORD *)(inited + 40) = v16;
  if (qword_253EFEE48 != -1)
    swift_once();
  v17 = unk_253EFEFD0;
  *(_QWORD *)(inited + 48) = qword_253EFEFC8;
  *(_QWORD *)(inited + 56) = v17;
  OUTLINED_FUNCTION_45((uint64_t)v10, *MEMORY[0x24BEA1AB8]);
  OUTLINED_FUNCTION_8();
  v18 = sub_212A04B0C();
  v20 = v19;
  OUTLINED_FUNCTION_55((uint64_t)v10);
  *(_QWORD *)(inited + 64) = v18;
  *(_QWORD *)(inited + 72) = v20;
  if (qword_253EFEE50 != -1)
    swift_once();
  v21 = unk_253EFEFE0;
  *(_QWORD *)(inited + 80) = qword_253EFEFD8;
  *(_QWORD *)(inited + 88) = v21;
  OUTLINED_FUNCTION_45((uint64_t)v7, *MEMORY[0x24BEA1B18]);
  OUTLINED_FUNCTION_8();
  v22 = sub_212A04B0C();
  v24 = v23;
  OUTLINED_FUNCTION_55((uint64_t)v7);
  *(_QWORD *)(inited + 96) = v22;
  *(_QWORD *)(inited + 104) = v24;
  if (qword_253EFEE58 != -1)
    swift_once();
  v25 = *(_QWORD *)algn_253EFEFF0;
  *(_QWORD *)(inited + 112) = qword_253EFEFE8;
  *(_QWORD *)(inited + 120) = v25;
  swift_bridgeObjectRetain();
  *(_QWORD *)(v3 + 16) = sub_212A04F74();
  return v3;
}

uint64_t sub_2129E666C()
{
  return sub_2129E6050() & 1;
}

void sub_2129E6690()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_20();
  v2 = OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_21();
  v3 = sub_2129F1F0C(0xD000000000000018, 0x8000000212A06850, v2);
  OUTLINED_FUNCTION_12();
  if (!v3)
  {
LABEL_9:
    v10 = 0;
    LOBYTE(v6) = 0;
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_44();
  if (!v5)
  {
    v6 = *(_QWORD *)(v4 + 16);
    if (v6)
      goto LABEL_4;
LABEL_11:
    OUTLINED_FUNCTION_0();
    v10 = 0;
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_8();
  v6 = sub_212A05250();
  OUTLINED_FUNCTION_0();
  if (!v6)
    goto LABEL_11;
LABEL_4:
  OUTLINED_FUNCTION_5();
  if ((v3 & 0xC000000000000001) != 0)
    OUTLINED_FUNCTION_10();
  swift_retain();
  OUTLINED_FUNCTION_0();
  v7 = sub_212A04CBC();
  swift_release();
  if (!v7)
    goto LABEL_9;
  if (qword_253EFEDE0 != -1)
    swift_once();
  sub_212A04E00();
  OUTLINED_FUNCTION_51();
  swift_retain();
  v8 = sub_212A04DDC();
  LOBYTE(v6) = sub_2129E4004(v8, v0, v1 & 1);
  swift_release();
  type metadata accessor for PersonQueryMatcher();
  sub_2129E6964(v0, v7);
  v10 = v9;
  OUTLINED_FUNCTION_35();
LABEL_12:
  v11 = OUTLINED_FUNCTION_43();
  v12 = sub_2129F1F0C(0xD000000000000018, 0x8000000212A06850, v11);
  OUTLINED_FUNCTION_26();
  if (!v12)
    goto LABEL_22;
  OUTLINED_FUNCTION_44();
  if (v14)
  {
    OUTLINED_FUNCTION_8();
    v18 = sub_212A05250();
    OUTLINED_FUNCTION_0();
    if (v18)
      goto LABEL_15;
LABEL_21:
    OUTLINED_FUNCTION_0();
    goto LABEL_22;
  }
  if (!*(_QWORD *)(v13 + 16))
    goto LABEL_21;
LABEL_15:
  OUTLINED_FUNCTION_5();
  if ((v12 & 0xC000000000000001) != 0)
    OUTLINED_FUNCTION_10();
  swift_retain();
  OUTLINED_FUNCTION_0();
  v15 = sub_212A04CBC();
  OUTLINED_FUNCTION_35();
  if (v15)
  {
    if ((v10 & 1) != 0)
    {
      OUTLINED_FUNCTION_24();
      v10 = 1;
    }
    else
    {
      type metadata accessor for PersonQueryMatcher();
      v16 = OUTLINED_FUNCTION_38();
      sub_2129E6964(v16, v15);
      v10 = v17;
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_24();
    }
  }
LABEL_22:
  type metadata accessor for PersonQueryMatcher();
  v19 = OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_6(v19);
  v21 = v20;
  OUTLINED_FUNCTION_24();
  if (v21)
  {
    OUTLINED_FUNCTION_0();
    v22 = OUTLINED_FUNCTION_38();
    sub_2129E69F0(v22, v0);
    v24 = v23;
    OUTLINED_FUNCTION_21();
    if (v6 & 1 | (((v24 | v10) & 1) == 0))
      goto LABEL_30;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_30;
  }
  if (qword_253EFEDE0 != -1)
    swift_once();
  OUTLINED_FUNCTION_28();
LABEL_30:
  OUTLINED_FUNCTION_3();
}

void sub_2129E6964(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(a1);
  if (v3)
  {
    sub_2129E6A70(a2, 0x6C6562616CLL, 0xE500000000000000);
    if (v4)
    {
      OUTLINED_FUNCTION_27();
      OUTLINED_FUNCTION_14();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_22();
}

unint64_t OUTLINED_FUNCTION_6(uint64_t a1)
{
  return sub_2129E6A70(a1, 1701667182, 0xE400000000000000);
}

void sub_2129E69F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(a1);
  if (v3)
  {
    OUTLINED_FUNCTION_6(a2);
    if (v4)
    {
      OUTLINED_FUNCTION_27();
      OUTLINED_FUNCTION_14();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_22();
}

unint64_t sub_2129E6A5C(uint64_t a1)
{
  return sub_2129E6A70(a1, 0x6C6562616CLL, 0xE500000000000000);
}

unint64_t sub_2129E6A70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = OUTLINED_FUNCTION_50();
  v6 = sub_2129F1F0C(a2, a3, v5);
  v7 = OUTLINED_FUNCTION_0();
  if (!v6)
    return v6;
  if (v6 >> 62)
  {
    OUTLINED_FUNCTION_46();
    v8 = sub_212A05250();
    v7 = OUTLINED_FUNCTION_2();
    if (v8)
      goto LABEL_4;
LABEL_7:
    OUTLINED_FUNCTION_2();
    return 0;
  }
  if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_7;
LABEL_4:
  OUTLINED_FUNCTION_52(v7, (v6 & 0xC000000000000001) == 0);
  if ((v6 & 0xC000000000000001) != 0)
    OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_2();
  v6 = sub_212A04C98();
  OUTLINED_FUNCTION_21();
  return v6;
}

void sub_2129E6B34()
{
  JUMPOUT(0x2129E6AD4);
}

uint64_t sub_2129E6B3C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PersonQueryMatcher()
{
  return objc_opt_self();
}

uint64_t sub_2129E6B6C()
{
  char v0;

  sub_2129E6690();
  return v0 & 1;
}

void sub_2129E6B84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v4;

  v0 = OUTLINED_FUNCTION_25();
  v2 = v1;
  if (qword_254B5DE70 != -1)
    swift_once();
  if (v0 == qword_254B5E8A8 && v2 == unk_254B5E8B0)
  {
    OUTLINED_FUNCTION_23();
  }
  else
  {
    v4 = OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_23();
    if ((v4 & 1) == 0)
    {
      if (qword_253EFEDE0 != -1)
        swift_once();
      OUTLINED_FUNCTION_29();
    }
  }
  OUTLINED_FUNCTION_7();
}

uint64_t type metadata accessor for CalendarEventQueryMatcher()
{
  return objc_opt_self();
}

uint64_t sub_2129E6C68()
{
  char v0;

  sub_2129E6B84();
  return v0 & 1;
}

void sub_2129E6C80()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v1 = OUTLINED_FUNCTION_25();
  v3 = v2;
  if (qword_253EFEE08 != -1)
    swift_once();
  if (v1 == qword_253EFEF78 && v3 == unk_253EFEF80)
  {
    OUTLINED_FUNCTION_23();
    if ((v0 & 1) != 0)
      goto LABEL_14;
  }
  else
  {
    v5 = OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_23();
    if ((v5 & 1) != 0 && (v0 & 1) != 0)
      goto LABEL_14;
  }
  if (qword_253EFEDE0 != -1)
    swift_once();
  OUTLINED_FUNCTION_29();
LABEL_14:
  OUTLINED_FUNCTION_7();
}

uint64_t type metadata accessor for ApplicationQueryMatcher()
{
  return objc_opt_self();
}

uint64_t sub_2129E6D6C()
{
  char v0;

  sub_2129E6C80();
  return v0 & 1;
}

unint64_t sub_2129E6D84()
{
  unint64_t result;

  result = qword_254B5E0A0;
  if (!qword_254B5E0A0)
  {
    result = MEMORY[0x212BF73E4](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254B5E0A0);
  }
  return result;
}

uint64_t sub_2129E6DC0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  BOOL v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  BOOL v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;

  v4 = v3;
  v8 = *v3;
  sub_212A0531C();
  sub_212A04F8C();
  v9 = sub_212A05334();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  v11 = v9 & ~v10;
  v12 = v8 + 56;
  if (((*(_QWORD *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
  {
    v13 = *(_QWORD *)(v8 + 48);
    v14 = (_QWORD *)(v13 + 16 * v11);
    v15 = *v14 == a2 && v14[1] == a3;
    if (v15 || (sub_212A052B0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      v16 = (uint64_t *)(*(_QWORD *)(*v4 + 48) + 16 * v11);
      v17 = v16[1];
      *a1 = *v16;
      a1[1] = v17;
      swift_bridgeObjectRetain();
      return 0;
    }
    v19 = ~v10;
    while (1)
    {
      v11 = (v11 + 1) & v19;
      if (((*(_QWORD *)(v12 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
        break;
      v20 = (_QWORD *)(v13 + 16 * v11);
      v21 = *v20 == a2 && v20[1] == a3;
      if (v21 || (sub_212A052B0() & 1) != 0)
        goto LABEL_7;
    }
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v23 = *v4;
  *v4 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2129E7B20(a2, a3, v11, isUniquelyReferenced_nonNull_native);
  *v4 = v23;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2129E6F4C(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;

  v3 = v2;
  v6 = *v2;
  v7 = sub_212A05310();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    *v3 = 0x8000000000000000;
    sub_2129E7CB8(a2, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v14;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v10 = *(_QWORD *)(v6 + 48);
  if (*(_QWORD *)(v10 + 8 * v9) != a2)
  {
    v11 = ~v8;
    do
    {
      v9 = (v9 + 1) & v11;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v10 + 8 * v9) != a2);
  }
  result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

void sub_2129E7044()
{
  uint64_t *v0;
  uint64_t *v1;
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  char *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;

  OUTLINED_FUNCTION_18();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v6 = sub_212A04DD0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v0;
  sub_2129E8FF8(&qword_253EFEEB8, MEMORY[0x24BEA55C8]);
  swift_bridgeObjectRetain();
  v29 = v3;
  v11 = sub_212A04F80();
  v12 = -1 << *(_BYTE *)(v10 + 32);
  v13 = v11 & ~v12;
  v14 = v10;
  v15 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v25 = v0;
    v26 = v5;
    v27 = ~v12;
    v16 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v28 = v16;
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v16 + 16);
    while (1)
    {
      v19 = v14;
      v20 = v18;
      v18(v9, *(_QWORD *)(v14 + 48) + v17 * v13, v6);
      sub_2129E8FF8(&qword_254B5E0C0, MEMORY[0x24BEA55D0]);
      v21 = sub_212A04F98();
      v22 = *(void (**)(char *, uint64_t))(v28 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v13 = (v13 + 1) & v27;
      v14 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v15 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v1 = v25;
        v5 = v26;
        v7 = v28;
        goto LABEL_7;
      }
    }
    OUTLINED_FUNCTION_9();
    v22(v29, v6);
    v20(v26, *(_QWORD *)(*v25 + 48) + v17 * v13, v6);
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v24 = v29;
    v18(v9, v29, v6);
    v30 = *v1;
    *v1 = 0x8000000000000000;
    sub_2129E7DD8((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *v1 = v30;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v5, v24, v6);
  }
  OUTLINED_FUNCTION_3();
}

uint64_t sub_2129E7278()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E0A8);
  result = sub_212A051C0();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = *(_QWORD *)(v2 + 56);
    v30 = (_QWORD *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & v6;
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    if ((v8 & v6) == 0)
      goto LABEL_7;
LABEL_6:
    v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (i = v12 | (v5 << 6); ; i = __clz(__rbit64(v15)) + (v5 << 6))
    {
      v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
      v18 = *v17;
      v19 = v17[1];
      sub_212A0531C();
      sub_212A04F8C();
      result = sub_212A05334();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) == 0)
      {
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
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
      *v28 = v18;
      v28[1] = v19;
      ++*(_QWORD *)(v4 + 16);
      if (v9)
        goto LABEL_6;
LABEL_7:
      v14 = v5 + 1;
      if (__OFADD__(v5, 1))
        goto LABEL_38;
      if (v14 >= v10)
        goto LABEL_32;
      v15 = v30[v14];
      ++v5;
      if (!v15)
      {
        v5 = v14 + 1;
        if (v14 + 1 >= v10)
          goto LABEL_32;
        v15 = v30[v5];
        if (!v15)
        {
          v5 = v14 + 2;
          if (v14 + 2 >= v10)
            goto LABEL_32;
          v15 = v30[v5];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v10)
            {
LABEL_32:
              v29 = 1 << *(_BYTE *)(v2 + 32);
              if (v29 > 63)
                sub_2129E7FCC(0, (unint64_t)(v29 + 63) >> 6, v30);
              else
                *v30 = -1 << v29;
              v1 = v0;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                v5 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_39;
                if (v5 >= v10)
                  goto LABEL_32;
                v15 = v30[v5];
                ++v16;
                if (v15)
                  goto LABEL_20;
              }
            }
            v5 = v16;
          }
        }
      }
LABEL_20:
      v9 = (v15 - 1) & v15;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_2129E7540()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
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
  uint64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E0B8);
  result = sub_212A051C0();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v7 = (uint64_t *)(v2 + 56);
    v6 = *(_QWORD *)(v2 + 56);
    v8 = 1 << *(_BYTE *)(v2 + 32);
    v27 = -1 << v8;
    v28 = v1;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & v6;
    v29 = 1 << *(_BYTE *)(v2 + 32);
    v11 = (unint64_t)(v8 + 63) >> 6;
    v12 = result + 56;
    if ((v9 & v6) == 0)
      goto LABEL_7;
LABEL_6:
    v13 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (i = v13 | (v5 << 6); ; i = __clz(__rbit64(v16)) + (v5 << 6))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
      result = sub_212A05310();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) == 0)
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          v25 = v21 == v24;
          if (v21 == v24)
            v21 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v21);
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
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v22) = v18;
      ++*(_QWORD *)(v4 + 16);
      if (v10)
        goto LABEL_6;
LABEL_7:
      v15 = v5 + 1;
      if (__OFADD__(v5, 1))
        goto LABEL_38;
      if (v15 >= v11)
        goto LABEL_32;
      v16 = v7[v15];
      ++v5;
      if (!v16)
      {
        v5 = v15 + 1;
        if (v15 + 1 >= v11)
          goto LABEL_32;
        v16 = v7[v5];
        if (!v16)
        {
          v5 = v15 + 2;
          if (v15 + 2 >= v11)
            goto LABEL_32;
          v16 = v7[v5];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= v11)
            {
LABEL_32:
              if (v29 > 63)
                sub_2129E7FCC(0, v11, (_QWORD *)(v2 + 56));
              else
                *v7 = v27;
              v1 = v28;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v16 = v7[v17];
            if (!v16)
            {
              while (1)
              {
                v5 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_39;
                if (v5 >= v11)
                  goto LABEL_32;
                v16 = v7[v5];
                ++v17;
                if (v16)
                  goto LABEL_20;
              }
            }
            v5 = v17;
          }
        }
      }
LABEL_20:
      v10 = (v16 - 1) & v16;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_2129E77C0()
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
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void (*v23)(char *, unint64_t, uint64_t);
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
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_212A04DD0();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E0C8);
  v6 = sub_212A051C0();
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
    if (!v11)
      goto LABEL_7;
LABEL_6:
    v15 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    for (i = v15 | (v14 << 6); ; i = __clz(__rbit64(v18)) + (v14 << 6))
    {
      v20 = v5;
      v21 = *(_QWORD *)(v36 + 72);
      v22 = *(_QWORD *)(v5 + 48) + v21 * i;
      v23 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v23(v4, v22, v2);
      sub_2129E8FF8(&qword_253EFEEB8, MEMORY[0x24BEA55C8]);
      result = sub_212A04F80();
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
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v27 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v12 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v23)(*(_QWORD *)(v7 + 48) + v27 * v21, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v20;
      if (v11)
        goto LABEL_6;
LABEL_7:
      v17 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_38;
      if (v17 >= v34)
        goto LABEL_32;
      v18 = v35[v17];
      ++v14;
      if (!v18)
      {
        v14 = v17 + 1;
        if (v17 + 1 >= v34)
          goto LABEL_32;
        v18 = v35[v14];
        if (!v18)
        {
          v14 = v17 + 2;
          if (v17 + 2 >= v34)
            goto LABEL_32;
          v18 = v35[v14];
          if (!v18)
          {
            v19 = v17 + 3;
            if (v19 >= v34)
            {
LABEL_32:
              swift_release();
              v1 = v33;
              v32 = 1 << *(_BYTE *)(v5 + 32);
              if (v32 > 63)
                sub_2129E7FCC(0, (unint64_t)(v32 + 63) >> 6, v35);
              else
                *v35 = -1 << v32;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v18 = v35[v19];
            if (!v18)
            {
              while (1)
              {
                v14 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_39;
                if (v14 >= v34)
                  goto LABEL_32;
                v18 = v35[v14];
                ++v19;
                if (v18)
                  goto LABEL_20;
              }
            }
            v14 = v19;
          }
        }
      }
LABEL_20:
      v11 = (v18 - 1) & v18;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_2129E7B20(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2129E7278();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_2129E7FE8();
      goto LABEL_22;
    }
    sub_2129E8700();
  }
  v11 = *v4;
  sub_212A0531C();
  sub_212A04F8C();
  result = sub_212A05334();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_212A052B0(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_212A052BC();
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
          result = sub_212A052B0();
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

uint64_t sub_2129E7CB8(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_2129E7540();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_2129E8198();
      goto LABEL_14;
    }
    sub_2129E8A14();
  }
  v8 = *v3;
  result = sub_212A05310();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      result = sub_212A052BC();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

uint64_t sub_2129E7DD8(uint64_t a1, unint64_t a2, char a3)
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
  v6 = sub_212A04DD0();
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
    sub_2129E77C0();
  }
  else
  {
    if (v11 > v10)
    {
      sub_2129E832C();
      goto LABEL_12;
    }
    sub_2129E8C70();
  }
  v12 = *v3;
  sub_2129E8FF8(&qword_253EFEEB8, MEMORY[0x24BEA55C8]);
  v13 = sub_212A04F80();
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
      sub_2129E8FF8(&qword_254B5E0C0, MEMORY[0x24BEA55D0]);
      v18 = sub_212A04F98();
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
  result = sub_212A052BC();
  __break(1u);
  return result;
}

uint64_t sub_2129E7FCC(uint64_t result, uint64_t a2, _QWORD *a3)
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

void *sub_2129E7FE8()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E0A8);
  v2 = *v0;
  v3 = sub_212A051B4();
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

void *sub_2129E8198()
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
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E0B8);
  v2 = *v0;
  v3 = sub_212A051B4();
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
  if (!v12)
    goto LABEL_12;
LABEL_11:
  v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v14 | (v9 << 6); ; i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * i) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
    if (v12)
      goto LABEL_11;
LABEL_12:
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_25:
    v12 = (v17 - 1) & v17;
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2129E832C()
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
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t i;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = sub_212A04DD0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E0C8);
  v6 = *v0;
  v7 = sub_212A051B4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v26 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = *(_QWORD *)(v6 + 56);
  v16 = -1;
  if (v14 < 64)
    v16 = ~(-1 << v14);
  v17 = v16 & v15;
  v18 = (unint64_t)(v14 + 63) >> 6;
  if ((v16 & v15) == 0)
    goto LABEL_12;
LABEL_11:
  v19 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (i = v19 | (v13 << 6); ; i = __clz(__rbit64(v22)) + (v13 << 6))
  {
    v24 = *(_QWORD *)(v3 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v24, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v24, v5, v2);
    if (v17)
      goto LABEL_11;
LABEL_12:
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v18)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v18)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v18)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_25:
    v17 = (v22 - 1) & v22;
  }
  v23 = v21 + 3;
  if (v23 >= v18)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v26;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v18)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_2129E8554()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEEF8);
  v2 = *v0;
  v3 = sub_212A051B4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)OUTLINED_FUNCTION_15();
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

uint64_t sub_2129E8700()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  _QWORD *v27;
  int64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E0A8);
  result = sub_212A051C0();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = v2 + 56;
    v7 = 1 << *(_BYTE *)(v2 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v28 = (unint64_t)(v7 + 63) >> 6;
    v10 = result + 56;
    if (!v9)
      goto LABEL_7;
LABEL_6:
    v11 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (i = v11 | (v5 << 6); ; i = __clz(__rbit64(v14)) + (v5 << 6))
    {
      v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
      v18 = *v16;
      v17 = v16[1];
      sub_212A0531C();
      sub_212A04F8C();
      result = sub_212A05334();
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
            goto LABEL_29;
          }
        }
        __break(1u);
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_29:
      *(_QWORD *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      v27 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v22);
      *v27 = v18;
      v27[1] = v17;
      ++*(_QWORD *)(v4 + 16);
      result = swift_bridgeObjectRetain();
      if (v9)
        goto LABEL_6;
LABEL_7:
      v13 = v5 + 1;
      if (__OFADD__(v5, 1))
        goto LABEL_35;
      if (v13 >= v28)
        goto LABEL_31;
      v14 = *(_QWORD *)(v6 + 8 * v13);
      ++v5;
      if (!v14)
      {
        v5 = v13 + 1;
        if (v13 + 1 >= v28)
          goto LABEL_31;
        v14 = *(_QWORD *)(v6 + 8 * v5);
        if (!v14)
        {
          v5 = v13 + 2;
          if (v13 + 2 >= v28)
            goto LABEL_31;
          v14 = *(_QWORD *)(v6 + 8 * v5);
          if (!v14)
          {
            v15 = v13 + 3;
            if (v15 >= v28)
            {
LABEL_31:
              result = swift_release();
              v1 = v0;
              goto LABEL_33;
            }
            v14 = *(_QWORD *)(v6 + 8 * v15);
            v5 = v15;
            if (!v14)
              break;
          }
        }
      }
LABEL_19:
      v9 = (v14 - 1) & v14;
    }
    while (1)
    {
      v5 = v15 + 1;
      if (__OFADD__(v15, 1))
        break;
      if (v5 >= v28)
        goto LABEL_31;
      v14 = *(_QWORD *)(v6 + 8 * v5);
      ++v15;
      if (v14)
        goto LABEL_19;
    }
LABEL_36:
    __break(1u);
  }
  else
  {
    result = swift_release();
LABEL_33:
    *v1 = v4;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BF73CC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2129E89D8()
{
  unint64_t result;

  result = qword_254B5E0B0;
  if (!qword_254B5E0B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254B5E0B0);
  }
  return result;
}

uint64_t sub_2129E8A14()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E0B8);
  result = sub_212A051C0();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
    *v1 = v4;
    return result;
  }
  v26 = v1;
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  if (!v9)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (i = v12 | (v5 << 6); ; i = __clz(__rbit64(v15)) + (v5 << 6))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
    result = sub_212A05310();
    v18 = -1 << *(_BYTE *)(v4 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6))) == 0)
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        v24 = v20 == v23;
        if (v20 == v23)
          v20 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v20);
        if (v25 != -1)
        {
          v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v21) = v17;
    ++*(_QWORD *)(v4 + 16);
    if (v9)
      goto LABEL_6;
LABEL_7:
    v14 = v5 + 1;
    if (__OFADD__(v5, 1))
      goto LABEL_36;
    if (v14 >= v10)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      v5 = v14 + 1;
      if (v14 + 1 >= v10)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v5);
      if (!v15)
      {
        v5 = v14 + 2;
        if (v14 + 2 >= v10)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v5);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v9 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v10)
  {
LABEL_32:
    result = swift_release();
    v1 = v26;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v5 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v5 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v5 >= v10)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v5);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2129E8C70()
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
  unint64_t i;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
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
  v2 = sub_212A04DD0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E0C8);
  v7 = sub_212A051C0();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_34:
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
  if (!v12)
    goto LABEL_7;
LABEL_6:
  v16 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v16 | (v15 << 6); ; i = __clz(__rbit64(v19)) + (v15 << 6))
  {
    v21 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v21 * i, v2);
    sub_2129E8FF8(&qword_253EFEEB8, MEMORY[0x24BEA55C8]);
    result = sub_212A04F80();
    v22 = -1 << *(_BYTE *)(v8 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6))) == 0)
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        v28 = v24 == v27;
        if (v24 == v27)
          v24 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v24);
        if (v29 != -1)
        {
          v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v13 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v25 * v21, v5, v2);
    ++*(_QWORD *)(v8 + 16);
    if (v12)
      goto LABEL_6;
LABEL_7:
    v18 = v15 + 1;
    if (__OFADD__(v15, 1))
      goto LABEL_36;
    if (v18 >= v33)
      goto LABEL_32;
    v19 = *(_QWORD *)(v32 + 8 * v18);
    ++v15;
    if (!v19)
    {
      v15 = v18 + 1;
      if (v18 + 1 >= v33)
        goto LABEL_32;
      v19 = *(_QWORD *)(v32 + 8 * v15);
      if (!v19)
      {
        v15 = v18 + 2;
        if (v18 + 2 >= v33)
          goto LABEL_32;
        v19 = *(_QWORD *)(v32 + 8 * v15);
        if (!v19)
          break;
      }
    }
LABEL_20:
    v12 = (v19 - 1) & v19;
  }
  v20 = v18 + 3;
  if (v20 >= v33)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_34;
  }
  v19 = *(_QWORD *)(v32 + 8 * v20);
  if (v19)
  {
    v15 = v20;
    goto LABEL_20;
  }
  while (1)
  {
    v15 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v15 >= v33)
      goto LABEL_32;
    v19 = *(_QWORD *)(v32 + 8 * v15);
    ++v20;
    if (v19)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2129E8F8C(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_unformattedInternationalStringValue);

  if (!v2)
    return 0;
  v3 = sub_212A04FB0();

  return v3;
}

uint64_t sub_2129E8FF8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_212A04DD0();
    result = MEMORY[0x212BF73E4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return sub_212A052B0();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return sub_212A05190();
}

uint64_t OUTLINED_FUNCTION_5()
{
  char v0;
  uint64_t v1;
  uint64_t v2;

  if (v0)
    v2 = 1;
  else
    v2 = 0;
  return sub_2129F7390(0, v2, v1);
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_10()
{
  JUMPOUT(0x212BF6F58);
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_2129E5690();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return sub_212A05190();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return sub_212A04DE8();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return sub_212A04CF8();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_28()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  return sub_2129E4004(v2, v0, v1 & 1);
}

uint64_t OUTLINED_FUNCTION_29()
{
  char v0;
  uint64_t v1;
  uint64_t v2;

  return sub_2129E4004(v1, v2, v0 & 1);
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_bridgeObjectRetain();
}

BOOL OUTLINED_FUNCTION_32(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_33()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_38()
{
  return sub_212A04DE8();
}

uint64_t OUTLINED_FUNCTION_39()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_41()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_42()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return sub_212A04CE0();
}

uint64_t OUTLINED_FUNCTION_45(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_48()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_49()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_50()
{
  return sub_212A04CE0();
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_52(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2129F7390(0, a2, v2);
}

void OUTLINED_FUNCTION_53()
{
  JUMPOUT(0x212BF6F58);
}

unint64_t OUTLINED_FUNCTION_54()
{
  return sub_2129E6D84();
}

uint64_t OUTLINED_FUNCTION_55(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_56()
{
  return swift_retain();
}

uint64_t sub_2129E92E4(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = OUTLINED_FUNCTION_1();
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
    if (v12 || (OUTLINED_FUNCTION_1() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

double sub_2129E93A0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;

  if (*(_QWORD *)(a1 + 16))
  {
    sub_2129ED19C(a1 + 32, a2);
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

void sub_2129E93D8()
{
  qword_254B5E0D0 = (uint64_t)&unk_24CE6FD58;
}

_QWORD *sub_2129E93EC()
{
  _QWORD *result;

  type metadata accessor for RRLinkMatcher();
  swift_allocObject();
  result = sub_2129E9D1C();
  qword_254B5E860 = (uint64_t)result;
  return result;
}

void *sub_2129E9428()
{
  void *result;

  type metadata accessor for RRLinkMatcher();
  result = (void *)sub_2129E9458();
  off_254B5E0D8 = result;
  return result;
}

uint64_t sub_2129E9458()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E2F8);
  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 56) = &type metadata for PersonStructuredDataHandler;
  *(_QWORD *)(v0 + 64) = &off_254B5E788;
  *(_QWORD *)(v0 + 96) = &type metadata for TimerStructuredDataHandler;
  *(_QWORD *)(v0 + 104) = &off_254B5E7C0;
  *(_QWORD *)(v0 + 136) = &type metadata for TaskStructuredDataHandler;
  *(_QWORD *)(v0 + 144) = &off_254B5E7F8;
  *(_QWORD *)(v0 + 176) = &type metadata for TaskListStructuredDataHandler;
  *(_QWORD *)(v0 + 184) = &off_254B5E828;
  *(_OWORD *)(v0 + 16) = xmmword_212A059A0;
  *(_QWORD *)(v0 + 216) = type metadata accessor for MediaItemStructuredDataHandler();
  *(_QWORD *)(v0 + 224) = &off_254B5E628;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 192));
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E350);
  sub_212A04FBC();
  sub_212A04D94();
  *(_QWORD *)(v0 + 256) = &type metadata for MessageConversationStructuredDataHandler;
  *(_QWORD *)(v0 + 264) = &off_254B5E070;
  *(_QWORD *)(v0 + 296) = &type metadata for ApplicationStructuredDataHandler;
  *(_QWORD *)(v0 + 304) = &off_254B5E730;
  *(_QWORD *)(v0 + 272) = 0;
  *(_QWORD *)(v0 + 280) = 0;
  *(_QWORD *)(v0 + 336) = &type metadata for EnvironmentStructuredDataHandler;
  *(_QWORD *)(v0 + 344) = &off_254B5E3C0;
  *(_QWORD *)(v0 + 312) = 0;
  *(_QWORD *)(v0 + 320) = 0;
  return v0;
}

void sub_2129E95AC()
{
  uint64_t v0;

  if (!*(_QWORD *)(v0 + 24))
  {
    *(_QWORD *)(v0 + 24) = sub_2129E95FC();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_11();
  }
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_22();
}

uint64_t sub_2129E95FC()
{
  uint64_t v0;
  char *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t result;
  __int128 v20[2];
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;

  if (qword_254B5DE38 != -1)
LABEL_18:
    swift_once();
  v0 = *((_QWORD *)off_254B5E0D8 + 2);
  if (v0)
  {
    v1 = (char *)off_254B5E0D8 + 32;
    swift_bridgeObjectRetain();
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    while (1)
    {
      sub_2129ED19C((uint64_t)v1, (uint64_t)v21);
      v3 = v22;
      v4 = v23;
      __swift_project_boxed_opaque_existential_1(v21, v22);
      v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v3, v4);
      v7 = v6;
      sub_2129ED19C((uint64_t)v21, (uint64_t)v20);
      swift_isUniquelyReferenced_nonNull_native();
      v8 = sub_2129F3ED0(v5, v7);
      if (__OFADD__(v2[2], (v9 & 1) == 0))
      {
        __break(1u);
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      v10 = v8;
      v11 = v9;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E348);
      if ((sub_212A05238() & 1) != 0)
      {
        v12 = sub_2129F3ED0(v5, v7);
        if ((v11 & 1) != (v13 & 1))
        {
          result = sub_212A052C8();
          __break(1u);
          return result;
        }
        v10 = v12;
      }
      if ((v11 & 1) != 0)
      {
        v14 = v2[7] + 40 * v10;
        __swift_destroy_boxed_opaque_existential_1Tm(v14);
        sub_2129ED068(v20, v14);
      }
      else
      {
        v2[(v10 >> 6) + 8] |= 1 << v10;
        v15 = (uint64_t *)(v2[6] + 16 * v10);
        *v15 = v5;
        v15[1] = v7;
        sub_2129ED068(v20, v2[7] + 40 * v10);
        v16 = v2[2];
        v17 = __OFADD__(v16, 1);
        v18 = v16 + 1;
        if (v17)
          goto LABEL_17;
        v2[2] = v18;
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);
      v1 += 40;
      if (!--v0)
        goto LABEL_15;
    }
  }
  swift_bridgeObjectRetain();
  v2 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_15:
  swift_bridgeObjectRelease();
  return (uint64_t)v2;
}

void sub_2129E982C()
{
  uint64_t v0;

  if (!*(_QWORD *)(v0 + 32))
  {
    *(_QWORD *)(v0 + 32) = sub_2129E987C();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_11();
  }
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_22();
}

uint64_t sub_2129E987C()
{
  uint64_t v0;
  char *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t result;
  __int128 v21[2];
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;

  if (qword_254B5DE38 != -1)
LABEL_20:
    swift_once();
  v0 = *((_QWORD *)off_254B5E0D8 + 2);
  if (v0)
  {
    v1 = (char *)off_254B5E0D8 + 32;
    swift_bridgeObjectRetain();
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    while (1)
    {
      sub_2129ED19C((uint64_t)v1, (uint64_t)v22);
      v3 = v23;
      v4 = v24;
      __swift_project_boxed_opaque_existential_1(v22, v23);
      v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 24))(v3, v4);
      if (v6)
      {
        v7 = v5;
        v8 = v6;
        sub_2129ED19C((uint64_t)v22, (uint64_t)v21);
        swift_isUniquelyReferenced_nonNull_native();
        v9 = sub_2129F3ED0(v7, v8);
        if (__OFADD__(v2[2], (v10 & 1) == 0))
        {
          __break(1u);
LABEL_19:
          __break(1u);
          goto LABEL_20;
        }
        v11 = v9;
        v12 = v10;
        __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E348);
        if ((sub_212A05238() & 1) != 0)
        {
          v13 = sub_2129F3ED0(v7, v8);
          if ((v12 & 1) != (v14 & 1))
          {
            result = sub_212A052C8();
            __break(1u);
            return result;
          }
          v11 = v13;
        }
        if ((v12 & 1) != 0)
        {
          v15 = v2[7] + 40 * v11;
          __swift_destroy_boxed_opaque_existential_1Tm(v15);
          sub_2129ED068(v21, v15);
        }
        else
        {
          v2[(v11 >> 6) + 8] |= 1 << v11;
          v16 = (uint64_t *)(v2[6] + 16 * v11);
          *v16 = v7;
          v16[1] = v8;
          sub_2129ED068(v21, v2[7] + 40 * v11);
          v17 = v2[2];
          v18 = __OFADD__(v17, 1);
          v19 = v17 + 1;
          if (v18)
            goto LABEL_19;
          v2[2] = v19;
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
      v1 += 40;
      if (!--v0)
        goto LABEL_17;
    }
  }
  swift_bridgeObjectRetain();
  v2 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_17:
  swift_bridgeObjectRelease();
  return (uint64_t)v2;
}

uint64_t sub_2129E9AB0()
{
  uint64_t result;

  result = sub_2129E9ACC();
  qword_254B5E868 = result;
  return result;
}

uint64_t sub_2129E9ACC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;

  sub_212A04A04();
  swift_allocObject();
  sub_212A049F8();
  v0 = MEMORY[0x212BF66C4]();
  if (!v0)
    goto LABEL_8;
  v1 = v0;
  sub_212A04A94();
  swift_allocObject();
  sub_212A04A88();
  v2 = MEMORY[0x212BF66C4]();
  if (!v2)
  {
    swift_release();
    swift_release();
LABEL_8:
    swift_release();
    return 0;
  }
  v3 = v2;
  sub_212A04884();
  swift_allocObject();
  sub_212A04878();
  v4 = MEMORY[0x212BF66C4]();
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E360);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_212A059B0;
    strcpy((char *)(inited + 32), "common_Person");
    *(_WORD *)(inited + 46) = -4864;
    *(_QWORD *)(inited + 48) = v1;
    strcpy((char *)(inited + 56), "common_Agent");
    *(_BYTE *)(inited + 69) = 0;
    *(_WORD *)(inited + 70) = -5120;
    *(_QWORD *)(inited + 72) = v3;
    *(_QWORD *)(inited + 80) = 0xD000000000000013;
    *(_QWORD *)(inited + 88) = 0x8000000212A06900;
    *(_QWORD *)(inited + 96) = v3;
    *(_QWORD *)(inited + 104) = 0xD000000000000014;
    *(_QWORD *)(inited + 112) = 0x8000000212A06920;
    *(_QWORD *)(inited + 120) = v3;
    strcpy((char *)(inited + 128), "common_Setting");
    *(_BYTE *)(inited + 143) = -18;
    *(_QWORD *)(inited + 144) = v4;
    sub_212A04D04();
    swift_retain_n();
    swift_retain();
    v4 = sub_212A04F74();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v4;
}

uint64_t sub_2129E9CE8()
{
  uint64_t result;

  type metadata accessor for SiriReferenceResolverDefaults();
  result = sub_2129F9C0C();
  byte_253EFF018 = result & 1;
  return result;
}

_QWORD *sub_2129E9D1C()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = MEMORY[0x24BEE4B00];
  v0[3] = 0;
  v0[4] = 0;
  v0[2] = v1;
  type metadata accessor for RRLinkMatcher();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E368);
  sub_212A04FBC();
  sub_212A04D94();
  return v0;
}

void *sub_2129E9DA8(void *a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint8_t *v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _WORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  char v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  os_log_type_t v40;
  _WORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  os_log_type_t v63;
  _WORD *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  os_log_type_t v68;
  _WORD *v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  _QWORD *v78;
  void *v79;
  void *v80;
  os_log_type_t v81;
  _WORD *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  _QWORD *v94;
  uint64_t v95;
  void *v96;
  os_log_type_t v97;
  _WORD *v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  NSObject *v103;
  os_log_type_t v104;
  uint8_t *v105;
  uint64_t v106;
  id v107;
  NSObject *v108;
  os_log_type_t v109;
  uint8_t *v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *v118;
  NSObject *v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  void (*v124)(char *, uint64_t);
  char v125;
  id v126;
  id v127;
  NSObject *v128;
  os_log_type_t v129;
  int v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  unint64_t v135;
  uint64_t v136;
  unint64_t v137;
  id v138;
  uint64_t v139;
  unint64_t v140;
  os_log_type_t v141;
  _WORD *v142;
  NSObject *v143;
  os_log_type_t v144;
  uint8_t *v145;
  id v146;
  NSObject *v148;
  _QWORD v149[2];
  id v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  id v160;
  __int128 v161;
  __int128 v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  __int128 v166;
  uint64_t v167;
  uint64_t v168;
  char v169[8];

  v4 = v3;
  LODWORD(v158) = a3;
  v159 = a2;
  v6 = sub_212A04F50();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v156 = (char *)v149 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v157 = (char *)v149 - v10;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = 0;
  if (qword_253EFEDB8 != -1)
    swift_once();
  v12 = (uint8_t *)byte_253EFF018;
  v13 = v3 + OBJC_IVAR____TtC21SiriReferenceResolver13RRLinkMatcher_logger;
  v14 = OUTLINED_FUNCTION_5_0();
  v15 = sub_212A0510C();
  v16 = os_log_type_enabled(v14, v15);
  if ((_DWORD)v12 != 1)
  {
    if (v16)
    {
      v22 = (_WORD *)OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_12_0(v22);
      _os_log_impl(&dword_2129E2000, v14, v15, "Link matching is off.", v12, 2u);
      OUTLINED_FUNCTION_0_0();
    }
    OUTLINED_FUNCTION_15_0();

    return 0;
  }
  v155 = v4;
  if (v16)
  {
    v17 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_2129E2000, v14, v15, "Link matching is on.", v17, 2u);
    OUTLINED_FUNCTION_48_0();
    OUTLINED_FUNCTION_0_0();
  }
  v154 = v7;

  v18 = v159;
  v19 = sub_212A04CF8();
  v21 = v20;
  if (v19 == 0xD000000000000011 && v20 == (_QWORD *)0x8000000212A06B50)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_9_0();
    if ((v18 & 1) == 0)
      goto LABEL_23;
  }
  if ((v158 & 1) == 0)
  {
LABEL_23:
    v30 = v4;
    sub_2129EBB7C((uint64_t)&v166);
    if (!v167)
    {
      sub_2129ED104((uint64_t)&v166, &qword_254B5E2F0);
      OUTLINED_FUNCTION_5_0();
      v40 = OUTLINED_FUNCTION_25_0();
      if (OUTLINED_FUNCTION_2_0(v40))
      {
        v41 = (_WORD *)OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_12_0(v41);
        OUTLINED_FUNCTION_4_0(&dword_2129E2000, v42, v43, "No data handler available");
        OUTLINED_FUNCTION_0_0();
      }
      OUTLINED_FUNCTION_15_0();

      return 0;
    }
    v153 = v6;
    sub_2129ED068(&v166, (uint64_t)v169);
    sub_2129ED19C((uint64_t)v169, (uint64_t)&v166);
    v31 = OUTLINED_FUNCTION_5_0();
    v32 = sub_212A05118();
    v33 = os_log_type_enabled(v31, v32);
    v151 = v11 + 16;
    if (v33)
    {
      v34 = (uint8_t *)OUTLINED_FUNCTION_3_0();
      *(_QWORD *)&v161 = OUTLINED_FUNCTION_3_0();
      *(_DWORD *)v34 = 136315138;
      v152 = v11;
      v150 = v34 + 4;
      v35 = v167;
      v36 = v168;
      OUTLINED_FUNCTION_42_0();
      v164 = (*(uint64_t (**)(uint64_t, uint64_t))(v36 + 24))(v35, v36);
      v165 = v37;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E330);
      v38 = sub_212A04FBC();
      v164 = sub_2129F37AC(v38, v39, (uint64_t *)&v161);
      sub_212A05160();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_18_0();
      OUTLINED_FUNCTION_20_0(&dword_2129E2000, v31, v32, "using handler for %s", v34);
      OUTLINED_FUNCTION_31_0();
      OUTLINED_FUNCTION_0_0();
    }

    OUTLINED_FUNCTION_18_0();
    v44 = v154;
    if (qword_254B5DE28 != -1)
      swift_once();
    v45 = qword_254B5E0D0;
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_52_0();
    v46 = OUTLINED_FUNCTION_22_0();
    v48 = v47;
    OUTLINED_FUNCTION_21();
    sub_2129E92E4(v46, v48, v45);
    OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_23();
    if ((v30 & 1) != 0)
    {
      v152 = v13;
      v49 = a1;
      v50 = sub_212A04E90();
      v52 = v51;
      v53 = (_QWORD *)sub_212A04E54();
      v55 = v54;

      OUTLINED_FUNCTION_41_0();
      v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E300);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E308);
      v57 = OUTLINED_FUNCTION_11_0();
      v58 = MEMORY[0x24BEE4B00];
      v150 = v53;
      if ((v57 & 1) != 0)
      {
        v149[1] = v56;
        OUTLINED_FUNCTION_37_0();
        v59 = *(_QWORD *)(*(_QWORD *)(v155 + 16) + 16);
        OUTLINED_FUNCTION_44_0();
        OUTLINED_FUNCTION_30();
        OUTLINED_FUNCTION_8();
        if (v59 && (sub_2129F3F20(v50, v52, (uint64_t)v53, v55), (v60 & 1) != 0))
        {
          v61 = v50;
          OUTLINED_FUNCTION_33_0();
          v62 = v55;
          OUTLINED_FUNCTION_11();
          OUTLINED_FUNCTION_47();
          OUTLINED_FUNCTION_0();
        }
        else
        {
          OUTLINED_FUNCTION_40_0();
          v73 = (_QWORD *)OUTLINED_FUNCTION_21_0();
          OUTLINED_FUNCTION_0();
          v73[5] = v55;
          v73[6] = v58;
          v61 = v50;
          v73[2] = v50;
          v73[3] = v52;
          v73[4] = v53;
          v62 = v55;
        }
        v74 = v167;
        v75 = v168;
        OUTLINED_FUNCTION_42_0();
        v76 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v75 + 16))(v74, v75);
        v77 = sub_212A04FB0();
        v53 = v78;

        OUTLINED_FUNCTION_10_0();
        OUTLINED_FUNCTION_8();
        swift_release();
        OUTLINED_FUNCTION_46_0(v77);
        a1 = v79;
        OUTLINED_FUNCTION_23();
        OUTLINED_FUNCTION_0();
        if (a1)
        {
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_47();
          v80 = (void *)sub_212A04D88();
          v81 = sub_212A05118();
          if (OUTLINED_FUNCTION_2_0(v81))
          {
            v82 = (_WORD *)OUTLINED_FUNCTION_3_0();
            OUTLINED_FUNCTION_12_0(v82);
            v85 = "Using cached system entity handler result";
            goto LABEL_58;
          }
LABEL_59:

          OUTLINED_FUNCTION_29_0();
          OUTLINED_FUNCTION_18_0();
LABEL_79:
          OUTLINED_FUNCTION_15_0();
          return a1;
        }
        OUTLINED_FUNCTION_18_0();
        OUTLINED_FUNCTION_48_0();
        v55 = v62;
        v50 = v61;
        v44 = v154;
      }
      else
      {
        v163 = 0;
        v161 = 0u;
        v162 = 0u;
        sub_2129ED104((uint64_t)&v161, &qword_254B5E310);
        OUTLINED_FUNCTION_48_0();
      }
      OUTLINED_FUNCTION_41_0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E318);
      if ((OUTLINED_FUNCTION_11_0() & 1) != 0)
      {
        OUTLINED_FUNCTION_37_0();
        v86 = v50;
        v87 = v55;
        v88 = v167;
        v89 = v168;
        __swift_project_boxed_opaque_existential_1(&v166, v167);
        (*(void (**)(uint64_t, uint64_t))(v89 + 16))(v88, v89);
        v90 = (id)LNIntentsValueTypeIdentifierAsString();
        v91 = sub_212A04FB0();

        v92 = *(_QWORD *)(v53[2] + 16);
        OUTLINED_FUNCTION_44_0();
        OUTLINED_FUNCTION_30();
        OUTLINED_FUNCTION_8();
        if (v92 && (sub_2129F3F20(v86, v52, (uint64_t)v150, v87), (v93 & 1) != 0))
        {
          OUTLINED_FUNCTION_33_0();
          OUTLINED_FUNCTION_13_0();
          OUTLINED_FUNCTION_13_0();
          OUTLINED_FUNCTION_0();
        }
        else
        {
          OUTLINED_FUNCTION_40_0();
          v94 = (_QWORD *)OUTLINED_FUNCTION_21_0();
          OUTLINED_FUNCTION_11();
          OUTLINED_FUNCTION_47();
          OUTLINED_FUNCTION_0();
          v95 = MEMORY[0x24BEE4B00];
          v94[5] = v87;
          v94[6] = v95;
          v94[2] = v86;
          v94[3] = v52;
          v94[4] = v150;
        }
        OUTLINED_FUNCTION_36_0();
        OUTLINED_FUNCTION_10_0();
        OUTLINED_FUNCTION_8();
        swift_release();
        OUTLINED_FUNCTION_46_0(v91);
        a1 = v96;
        OUTLINED_FUNCTION_23();
        OUTLINED_FUNCTION_0();
        v44 = v154;
        if (a1)
        {
          v80 = (void *)OUTLINED_FUNCTION_5_0();
          v97 = sub_212A05118();
          if (OUTLINED_FUNCTION_2_0(v97))
          {
            v98 = (_WORD *)OUTLINED_FUNCTION_3_0();
            OUTLINED_FUNCTION_12_0(v98);
            v85 = "Using cached structured data handler result";
LABEL_58:
            OUTLINED_FUNCTION_4_0(&dword_2129E2000, v83, v84, v85);
            OUTLINED_FUNCTION_0_0();
          }
          goto LABEL_59;
        }
        v150 = v49;
        OUTLINED_FUNCTION_18_0();
      }
      else
      {
        v150 = v49;
        v163 = 0;
        v161 = 0u;
        v162 = 0u;
        OUTLINED_FUNCTION_11();
        OUTLINED_FUNCTION_47();
        sub_2129ED104((uint64_t)&v161, &qword_254B5E320);
        OUTLINED_FUNCTION_36_0();
      }
      type metadata accessor for SiriReferenceResolverDefaults();
      v99 = sub_2129F9D38();
      if (v100)
      {
        v101 = v99;
        v102 = v100;
        swift_bridgeObjectRetain();
        v103 = OUTLINED_FUNCTION_5_0();
        v104 = sub_212A0510C();
        if (os_log_type_enabled(v103, v104))
        {
          v105 = (uint8_t *)OUTLINED_FUNCTION_3_0();
          *(_QWORD *)&v166 = OUTLINED_FUNCTION_3_0();
          *(_DWORD *)v105 = 136315138;
          OUTLINED_FUNCTION_46();
          v106 = sub_2129F37AC(v101, v102, (uint64_t *)&v166);
          OUTLINED_FUNCTION_47_0(v106);
          OUTLINED_FUNCTION_36_0();
          sub_212A05160();
          swift_bridgeObjectRelease_n();
          OUTLINED_FUNCTION_20_0(&dword_2129E2000, v103, v104, "About to execute fetchStructuredData with mockDataType: %s.", v105);
          OUTLINED_FUNCTION_31_0();
          OUTLINED_FUNCTION_0_0();
        }
        OUTLINED_FUNCTION_13_0();

      }
      else
      {
        v107 = v150;
        v108 = OUTLINED_FUNCTION_5_0();
        v109 = sub_212A0510C();
        if (os_log_type_enabled(v108, v109))
        {
          v110 = (uint8_t *)OUTLINED_FUNCTION_3_0();
          *(_QWORD *)&v166 = OUTLINED_FUNCTION_3_0();
          *(_DWORD *)v110 = 136315138;
          v111 = sub_212A04E90();
          v113 = OUTLINED_FUNCTION_23_0(v111, v112);
          OUTLINED_FUNCTION_47_0(v113);
          OUTLINED_FUNCTION_36_0();
          sub_212A05160();

          OUTLINED_FUNCTION_0();
          OUTLINED_FUNCTION_20_0(&dword_2129E2000, v108, v109, "About to execute Link SPI for entity with id %s.", v110);
          OUTLINED_FUNCTION_31_0();
          OUTLINED_FUNCTION_0_0();
        }

      }
      v114 = v153;
      v115 = v150;
      sub_212A04E30();
      v116 = v155;
      v117 = sub_2129EADEC();
      v45 = v118;
      swift_release();
      if (v45)
      {
        v119 = dispatch_semaphore_create(0);
        swift_retain();
        sub_2129EB22C(v115, v159, (uint64_t)v169, v117, (uint64_t)v45, v158 & 1, v116, v11, v119);

        swift_bridgeObjectRelease();
        v120 = v156;
        sub_212A04F44();
        if (qword_254B5DE50 != -1)
          swift_once();
        v121 = sub_212A04F38();
        v122 = __swift_project_value_buffer(v121, (uint64_t)qword_254B5E878);
        v123 = v157;
        MEMORY[0x212BF6CD0](v120, v122);
        v124 = *(void (**)(char *, uint64_t))(v44 + 8);
        v124(v120, v114);
        v125 = sub_212A05130();
        v124(v123, v114);
        if ((v125 & 1) == 0)
        {
          v126 = v115;
          swift_retain_n();
          v127 = v126;
          v128 = OUTLINED_FUNCTION_5_0();
          v129 = sub_212A0510C();
          v130 = v129;
          if (os_log_type_enabled(v128, v129))
          {
            v131 = OUTLINED_FUNCTION_3_0();
            v158 = OUTLINED_FUNCTION_3_0();
            *(_QWORD *)&v166 = v158;
            *(_DWORD *)v131 = 136315650;
            LODWORD(v157) = v130;
            sub_212A04E30();
            v132 = OUTLINED_FUNCTION_22_0();
            v133 = v11;
            v135 = v134;
            swift_retain();
            OUTLINED_FUNCTION_21();
            v164 = sub_2129F37AC(v132, v135, (uint64_t *)&v166);
            OUTLINED_FUNCTION_32_0();

            swift_bridgeObjectRelease();
            *(_WORD *)(v131 + 12) = 2080;
            v136 = sub_212A04CF8();
            v164 = OUTLINED_FUNCTION_23_0(v136, v137);
            OUTLINED_FUNCTION_32_0();
            OUTLINED_FUNCTION_27_0();
            OUTLINED_FUNCTION_0();
            *(_WORD *)(v131 + 22) = 2080;
            OUTLINED_FUNCTION_10_0();
            v160 = *(id *)(v133 + 16);
            v138 = v160;
            __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E328);
            v139 = sub_212A04FBC();
            v160 = (id)OUTLINED_FUNCTION_23_0(v139, v140);
            sub_212A05160();
            swift_release();
            OUTLINED_FUNCTION_0();
            _os_log_impl(&dword_2129E2000, v128, (os_log_type_t)v157, "linkEntity(%s, matches: %s) -> %s", (uint8_t *)v131, 0x20u);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_0_0();
          }

          OUTLINED_FUNCTION_27_0();
          OUTLINED_FUNCTION_29_0();
          OUTLINED_FUNCTION_10_0();
          a1 = *(void **)(v11 + 16);
          v146 = a1;
          goto LABEL_79;
        }
        v143 = OUTLINED_FUNCTION_5_0();
        v144 = sub_212A05124();
        if (OUTLINED_FUNCTION_2_0(v144))
        {
          v145 = (uint8_t *)OUTLINED_FUNCTION_3_0();
          *(_DWORD *)v145 = 134217984;
          *(_QWORD *)&v166 = 1000;
          sub_212A05160();
          OUTLINED_FUNCTION_20_0(&dword_2129E2000, v143, (os_log_type_t)v119, "FetchStructuredData timed out after %ldms", v145);
          OUTLINED_FUNCTION_0_0();
        }
        v148 = v143;
        v45 = v119;

        goto LABEL_82;
      }
      OUTLINED_FUNCTION_5_0();
      v141 = OUTLINED_FUNCTION_25_0();
      if (OUTLINED_FUNCTION_2_0(v141))
      {
        v142 = (_WORD *)OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_12_0(v142);
        v67 = "Couldn't get app entity item type";
LABEL_38:
        OUTLINED_FUNCTION_4_0(&dword_2129E2000, v65, v66, v67);
        OUTLINED_FUNCTION_0_0();
      }
    }
    else
    {
      OUTLINED_FUNCTION_5_0();
      v63 = OUTLINED_FUNCTION_25_0();
      if (OUTLINED_FUNCTION_2_0(v63))
      {
        v64 = (_WORD *)OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_12_0(v64);
        v67 = "Pool entity is not in supported types";
        goto LABEL_38;
      }
    }
LABEL_82:

    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_15_0();
    return 0;
  }
  v23 = v6;
  if (qword_254B5DE28 != -1)
    swift_once();
  v21 = (_QWORD *)qword_254B5E0D0;
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_52_0();
  v24 = OUTLINED_FUNCTION_22_0();
  v26 = v25;
  OUTLINED_FUNCTION_21();
  sub_2129E92E4(v24, v26, v21);
  OUTLINED_FUNCTION_9_0();
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0)
  {
    LOBYTE(v4) = OUTLINED_FUNCTION_52_0();
    v27 = OUTLINED_FUNCTION_22_0();
    v21 = v28;
    swift_release();
    if (v27 == 0x415F6E6F6D6D6F63 && v21 == (_QWORD *)0xEA00000000007070)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_9_0();
      v6 = v23;
      OUTLINED_FUNCTION_48_0();
      if ((v27 & 1) == 0)
        goto LABEL_23;
    }
  }
  OUTLINED_FUNCTION_5_0();
  v68 = OUTLINED_FUNCTION_25_0();
  if (OUTLINED_FUNCTION_2_0(v68))
  {
    v69 = (_WORD *)OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_12_0(v69);
    OUTLINED_FUNCTION_4_0(&dword_2129E2000, v70, v71, "Link query is common_Attachment, proposed entity was found by Marrs identifier, and entity type is acceptable. Returning entity without Structured Data Conversion and caching");
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_15_0();

  v72 = a1;
  return a1;
}

uint64_t sub_2129EAD90(void *a1, uint64_t a2)
{
  void *v4;
  id v5;

  swift_beginAccess();
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = a1;
  v5 = a1;

  return sub_212A0513C();
}

uint64_t sub_2129EADEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11[3];
  uint64_t v12;
  _BYTE v13[32];

  v0 = sub_212A04980();
  OUTLINED_FUNCTION_38_0(v0, v1);
  if (v12)
  {
    sub_212A0486C();
    v2 = OUTLINED_FUNCTION_11_0();
    if ((v2 & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    sub_2129ED104((uint64_t)v11, (uint64_t *)&unk_253EFEF38);
  }
  OUTLINED_FUNCTION_38_0(v2, v3);
  if (v12)
  {
    sub_212A04A58();
    if ((OUTLINED_FUNCTION_11_0() & 1) != 0)
    {
LABEL_7:
      swift_release();
      v4 = sub_2129EB000();
      sub_2129ED104((uint64_t)v13, (uint64_t *)&unk_253EFEF38);
      return v4;
    }
  }
  else
  {
    sub_2129ED104((uint64_t)v11, (uint64_t *)&unk_253EFEF38);
  }
  swift_retain_n();
  v5 = sub_212A04D88();
  v6 = sub_212A05124();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    v11[0] = OUTLINED_FUNCTION_3_0();
    *(_DWORD *)v7 = 136315138;
    v8 = sub_212A04CF8();
    sub_2129F37AC(v8, v9, v11);
    sub_212A05160();
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_20_0(&dword_2129E2000, v5, v6, "Pool entity %s wasn't convertible to supported entity types, returning nil", v7);
    OUTLINED_FUNCTION_31_0();
    OUTLINED_FUNCTION_0_0();
  }

  OUTLINED_FUNCTION_27_0();
  sub_2129ED104((uint64_t)v13, (uint64_t *)&unk_253EFEF38);
  return 0;
}

uint64_t sub_2129EB000()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, unint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];

  v1 = OUTLINED_FUNCTION_28_0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_26_0();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED88);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_212A04CEC();
  v7 = *(_QWORD *)(v6 + 16);
  if (!v7)
  {
    v15 = 1;
    goto LABEL_14;
  }
  v18[0] = v5;
  v18[1] = v6;
  v8 = v6 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v9 = *(_QWORD *)(v2 + 72);
  v10 = *(void (**)(uint64_t, unint64_t, uint64_t))(v2 + 16);
  OUTLINED_FUNCTION_44_0();
  while (1)
  {
    v10(v0, v8, v1);
    v11 = sub_212A04920();
    if (!v12)
      goto LABEL_9;
    if (v11 == 0x69746E655F707061 && v12 == 0xEF657079745F7974)
      break;
    v14 = OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_0();
    if ((v14 & 1) != 0)
      goto LABEL_13;
LABEL_9:
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
    v8 += v9;
    if (!--v7)
    {
      OUTLINED_FUNCTION_47();
      v15 = 1;
      v5 = (char *)v18[0];
      goto LABEL_14;
    }
  }
  OUTLINED_FUNCTION_47();
LABEL_13:
  swift_bridgeObjectRelease();
  v5 = (char *)v18[0];
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v2 + 32))(v18[0], v0, v1);
  v15 = 0;
LABEL_14:
  __swift_storeEnumTagSinglePayload((uint64_t)v5, v15, 1, v1);
  OUTLINED_FUNCTION_47();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v1) == 1)
  {
    sub_2129ED104((uint64_t)v5, &qword_253EFED88);
    return 0;
  }
  else
  {
    v16 = sub_212A04914();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  return v16;
}

void sub_2129EB22C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29[2];
  uint64_t v30;
  __int128 v31[2];
  _QWORD v32[4];

  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a8;
  *(_QWORD *)(v15 + 24) = a9;
  swift_retain();
  v16 = a9;
  v28 = sub_212A04E90();
  v18 = v17;
  v27 = sub_212A04E54();
  v20 = v19;
  sub_2129ED19C(a3, (uint64_t)v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E300);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E318);
  if (swift_dynamicCast())
  {
    sub_2129ED068(v29, (uint64_t)v32);
    v26 = v16;
    __swift_project_boxed_opaque_existential_1(v32, v32[3]);
    sub_2129ED19C((uint64_t)v32, (uint64_t)v31);
    v21 = a4;
    v22 = (_QWORD *)swift_allocObject();
    v22[2] = a7;
    v22[3] = sub_2129ED194;
    v22[4] = v15;
    sub_2129ED068(v31, (uint64_t)(v22 + 5));
    v22[10] = a1;
    swift_retain();
    swift_retain();
    v23 = a1;
    v24 = v21;
    v16 = v26;
    sub_2129EDF2C(v28, v18, v27, v20, v24, a5, (void (*)(_QWORD))sub_2129ED218);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
  }
  else
  {
    v30 = 0;
    memset(v29, 0, sizeof(v29));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2129ED104((uint64_t)v29, &qword_254B5E320);
    swift_beginAccess();
    v25 = *(void **)(a8 + 16);
    *(_QWORD *)(a8 + 16) = 0;

    sub_212A0513C();
  }
  swift_release();
  swift_release();

}

void sub_2129EB44C(void *a1, char a2, uint64_t a3, void (*a4)(id), uint64_t a5, _QWORD *a6, void *a7)
{
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  uint8_t *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t *boxed_opaque_existential_1;
  id v44;
  uint8_t *v45;
  uint64_t v46;
  void (*v47)(id);
  uint64_t v48[3];
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _OWORD v52[2];

  v13 = sub_212A04D88();
  v14 = sub_212A0510C();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_2129E2000, v13, v14, "FetchStructuredData Link SPI completed", v15, 2u);
    MEMORY[0x212BF7480](v15, -1, -1);
  }

  if ((a2 & 1) != 0)
  {
    sub_2129ED230(a1);
    v19 = a1;
    v20 = a1;
    v21 = sub_212A04D88();
    v22 = sub_212A05124();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v48[0] = v24;
      *(_DWORD *)v23 = 136315138;
      *(_QWORD *)&v52[0] = a1;
      v25 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E338);
      v26 = sub_212A04FBC();
      *(_QWORD *)&v52[0] = sub_2129F37AC(v26, v27, v48);
      sub_212A05160();
      swift_bridgeObjectRelease();
      sub_2129ED23C(a1);
      sub_2129ED23C(a1);
      _os_log_impl(&dword_2129E2000, v21, v22, "Error occured in fetchStructuredData: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BF7480](v24, -1, -1);
      MEMORY[0x212BF7480](v23, -1, -1);

    }
    else
    {

      sub_2129ED23C(a1);
      sub_2129ED23C(a1);
    }
    a4(0);
    sub_2129ED23C(a1);
  }
  else if (a1)
  {
    v16 = objc_msgSend(a1, sel_value);
    sub_212A0519C();
    swift_unknownObjectRelease();
    sub_2129ED248(v48, v52);
    v17 = a6[3];
    v18 = a6[4];
    __swift_project_boxed_opaque_existential_1(a6, v17);
    v31 = (id)(*(uint64_t (**)(_OWORD *, void *, uint64_t, uint64_t))(*(_QWORD *)(v18 + 8) + 40))(v52, a7, MEMORY[0x24BEE4AD8] + 8, v17);
    v32 = sub_212A04D88();
    v33 = sub_212A05118();
    v34 = os_log_type_enabled(v32, v33);
    v47 = a4;
    if (v34)
    {
      v35 = (uint8_t *)swift_slowAlloc();
      v46 = swift_slowAlloc();
      v48[0] = v46;
      v45 = v35;
      *(_DWORD *)v35 = 136315138;
      sub_212A04E30();
      v36 = sub_212A04CF8();
      v38 = v37;
      swift_release();
      v51 = sub_2129F37AC(v36, v38, v48);
      sub_212A05160();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2129E2000, v32, v33, "Returning and caching annotated %s entity", v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BF7480](v46, -1, -1);
      MEMORY[0x212BF7480](v45, -1, -1);
    }
    else
    {

    }
    v39 = a6[3];
    v40 = a6[4];
    v41 = __swift_project_boxed_opaque_existential_1(a6, v39);
    v49 = v39;
    v42 = *(_QWORD *)(v40 + 8);
    v50 = v42;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v48);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v39 - 8) + 16))(boxed_opaque_existential_1, v41, v39);
    sub_2129ED48C(v31, a7, (uint64_t)boxed_opaque_existential_1, a3, v39, v42);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v48);
    v44 = v31;
    v47(v31);

    sub_2129ED23C(a1);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v52);
  }
  else
  {
    v28 = sub_212A04D88();
    v29 = sub_212A05124();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_2129E2000, v28, v29, "Retrieved Link data is nil", v30, 2u);
      MEMORY[0x212BF7480](v30, -1, -1);
    }

    a4(0);
    sub_2129ED23C(0);
  }
}

double sub_2129EBB7C@<D0>(uint64_t a1@<X8>)
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
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double result;
  __int128 v31;
  uint64_t v32;
  __int128 v33[2];

  v2 = OUTLINED_FUNCTION_22_0();
  v4 = v3;
  sub_2129E95AC();
  sub_2129F1FE4(v2, v4, v5, (uint64_t)&v31);
  OUTLINED_FUNCTION_47();
  v6 = OUTLINED_FUNCTION_0();
  if (!v32)
  {
    OUTLINED_FUNCTION_16_0(v6, &qword_254B5E2F0, v7, v8, v9, v10, v11, v12, v31);
    v13 = sub_2129EBD00((uint64_t)&v31);
    if (!v32)
    {
      OUTLINED_FUNCTION_16_0(v13, &qword_254B5E2F0, v14, v15, v16, v17, v18, v19, v31);
      if (sub_212A04CF8() == 0x6E456F4E5F6F7375 && v20 == 0xEC00000079746974)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v22 = OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_0();
        if ((v22 & 1) == 0)
          goto LABEL_14;
      }
      sub_212A04E30();
      sub_2129EBD00((uint64_t)&v31);
      v23 = swift_release();
      if (!v32)
      {
        OUTLINED_FUNCTION_16_0(v23, &qword_254B5E2F0, v24, v25, v26, v27, v28, v29, v31);
LABEL_14:
        *(_QWORD *)(a1 + 32) = 0;
        result = 0.0;
        *(_OWORD *)a1 = 0u;
        *(_OWORD *)(a1 + 16) = 0u;
        return result;
      }
    }
  }
  sub_2129ED068(&v31, (uint64_t)v33);
  sub_2129ED068(v33, a1);
  return result;
}

uint64_t sub_2129EBD00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, unint64_t, uint64_t);
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  uint64_t v23;
  uint64_t v24;

  v3 = OUTLINED_FUNCTION_28_0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_26_0();
  v5 = sub_212A04CEC();
  v6 = *(_QWORD *)(v5 + 16);
  if (!v6)
  {
    swift_bridgeObjectRelease();
    v10 = (char *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  v23 = a1;
  v7 = v5 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v8 = *(_QWORD *)(v4 + 72);
  v9 = *(void (**)(uint64_t, unint64_t, uint64_t))(v4 + 16);
  swift_bridgeObjectRetain();
  v10 = (char *)MEMORY[0x24BEE4AF8];
  v24 = v8;
  do
  {
    v9(v1, v7, v3);
    v11 = sub_212A04920();
    if (!v12)
    {
LABEL_9:
      OUTLINED_FUNCTION_30_0();
      goto LABEL_16;
    }
    if (v11 == 0x6C6F636F746F7270 && v12 == 0xE800000000000000)
    {
      OUTLINED_FUNCTION_0();
    }
    else
    {
      v14 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_0();
      if ((v14 & 1) == 0)
        goto LABEL_9;
    }
    v15 = sub_212A04914();
    v17 = v16;
    OUTLINED_FUNCTION_30_0();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v10 = OUTLINED_FUNCTION_49_0(0, *((_QWORD *)v10 + 2) + 1);
    v19 = *((_QWORD *)v10 + 2);
    v18 = *((_QWORD *)v10 + 3);
    if (v19 >= v18 >> 1)
      v10 = OUTLINED_FUNCTION_49_0((char *)(v18 > 1), v19 + 1);
    *((_QWORD *)v10 + 2) = v19 + 1;
    v20 = &v10[16 * v19];
    *((_QWORD *)v20 + 4) = v15;
    *((_QWORD *)v20 + 5) = v17;
    v8 = v24;
LABEL_16:
    v7 += v8;
    --v6;
  }
  while (v6);
  OUTLINED_FUNCTION_13_0();
  a1 = v23;
LABEL_19:
  swift_retain();
  v21 = sub_2129EBEEC((uint64_t)v10);
  OUTLINED_FUNCTION_47();
  sub_2129E93A0((uint64_t)v21, a1);
  return OUTLINED_FUNCTION_0();
}

char *sub_2129EBEEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v9;
  uint64_t v10;
  __int128 v11[2];
  uint64_t v12[2];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v3 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    v4 = (char *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      v5 = *v3;
      v12[0] = *(v3 - 1);
      v12[1] = v5;
      swift_bridgeObjectRetain();
      sub_2129EC08C(v12, (uint64_t)&v9);
      if (v1)
        break;
      swift_bridgeObjectRelease();
      if (v10)
      {
        sub_2129ED068(&v9, (uint64_t)v11);
        sub_2129ED068(v11, (uint64_t)&v9);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v4 = sub_2129EC9A4(0, *((_QWORD *)v4 + 2) + 1, 1, (uint64_t)v4);
        v7 = *((_QWORD *)v4 + 2);
        v6 = *((_QWORD *)v4 + 3);
        if (v7 >= v6 >> 1)
          v4 = sub_2129EC9A4((char *)(v6 > 1), v7 + 1, 1, (uint64_t)v4);
        *((_QWORD *)v4 + 2) = v7 + 1;
        sub_2129ED068(&v9, (uint64_t)&v4[40 * v7 + 32]);
      }
      else
      {
        sub_2129ED104((uint64_t)&v9, &qword_254B5E2F0);
      }
      v3 += 2;
      if (!--v2)
      {
        swift_release();
        swift_bridgeObjectRelease();
        return v4;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  return v4;
}

void sub_2129EC08C(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16[2];
  uint64_t v17;

  v4 = *a1;
  v3 = a1[1];
  swift_bridgeObjectRetain();
  sub_2129E982C();
  sub_2129F1FE4(v4, v3, v5, (uint64_t)&v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
  {
    sub_2129ED068(&v14, (uint64_t)v16);
    swift_bridgeObjectRetain_n();
    v6 = sub_212A04D88();
    v7 = sub_212A05118();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      *(_QWORD *)&v14 = v9;
      *(_DWORD *)v8 = 136315138;
      swift_bridgeObjectRetain();
      v17 = sub_2129F37AC(v4, v3, (uint64_t *)&v14);
      sub_212A05160();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2129E2000, v6, v7, "Chosen protocol for handler: %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BF7480](v9, -1, -1);
      MEMORY[0x212BF7480](v8, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    sub_2129ED068(v16, a2);
  }
  else
  {
    sub_2129ED104((uint64_t)&v14, &qword_254B5E2F0);
    swift_bridgeObjectRetain_n();
    v10 = sub_212A04D88();
    v11 = sub_212A05118();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      *(_QWORD *)&v16[0] = v13;
      *(_DWORD *)v12 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v14 = sub_2129F37AC(v4, v3, (uint64_t *)v16);
      sub_212A05160();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2129E2000, v10, v11, "Ignored protocol: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BF7480](v13, -1, -1);
      MEMORY[0x212BF7480](v12, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    *(_QWORD *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
}

void sub_2129EC3B4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v0 = sub_212A04DA0();
  OUTLINED_FUNCTION_24_0(v0);
  OUTLINED_FUNCTION_39_0();
}

uint64_t sub_2129EC3FC()
{
  sub_2129EC3B4();
  return swift_deallocClassInstance();
}

uint64_t sub_2129EC420()
{
  return type metadata accessor for RRLinkMatcher();
}

uint64_t type metadata accessor for RRLinkMatcher()
{
  uint64_t result;

  result = qword_254B5E108;
  if (!qword_254B5E108)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2129EC460()
{
  uint64_t result;
  unint64_t v1;

  result = sub_212A04DA0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_2129EC4E8()
{
  swift_bridgeObjectRetain();
  sub_212A04F8C();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_46();
  sub_212A04F8C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2129EC558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v12;
  char v13;
  uint64_t result;

  v12 = a1 == a5 && a2 == a6;
  if (v12 || (v13 = OUTLINED_FUNCTION_1(), result = 0, (v13 & 1) != 0))
  {
    if (a3 == a7 && a4 == a8)
      return 1;
    else
      return sub_212A052B0();
  }
  return result;
}

uint64_t sub_2129EC5E0()
{
  sub_212A0531C();
  swift_bridgeObjectRetain();
  sub_212A04F8C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_212A04F8C();
  swift_bridgeObjectRelease();
  return sub_212A05334();
}

uint64_t sub_2129EC66C()
{
  return sub_2129EC5E0();
}

uint64_t sub_2129EC678()
{
  return sub_2129EC4E8();
}

uint64_t sub_2129EC684()
{
  sub_212A0531C();
  OUTLINED_FUNCTION_30();
  sub_212A04F8C();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8();
  sub_212A04F8C();
  OUTLINED_FUNCTION_0();
  return sub_212A05334();
}

uint64_t sub_2129EC6F4(uint64_t *a1, uint64_t *a2)
{
  return sub_2129EC558(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t sub_2129EC710()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2129EC748()
{
  sub_2129EC710();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CachedEntityInfo()
{
  return objc_opt_self();
}

uint64_t initializeBufferWithCopyOfBuffer for CachedEntityKey(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CachedEntityKey()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for CachedEntityKey(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CachedEntityKey(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

_QWORD *assignWithTake for CachedEntityKey(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CachedEntityKey(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CachedEntityKey(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CachedEntityKey()
{
  return &type metadata for CachedEntityKey;
}

unint64_t sub_2129EC968()
{
  unint64_t result;

  result = qword_254B5E2E8;
  if (!qword_254B5E2E8)
  {
    result = MEMORY[0x212BF73E4](&unk_212A05A84, &type metadata for CachedEntityKey);
    atomic_store(result, (unint64_t *)&qword_254B5E2E8);
  }
  return result;
}

char *sub_2129EC9A4(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E2F8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_2129F744C((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2129ECD34(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_2129ECA98(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEF08);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_2129F74AC((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2129ECE50(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_2129ECB84(char a1, int64_t a2, char a3, uint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E358);
  v10 = *(_QWORD *)(OUTLINED_FUNCTION_28_0() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_24:
    OUTLINED_FUNCTION_43_0();
    result = sub_212A05244();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_28_0() - 8) + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    sub_2129F7508(a4 + v17, v8, v18);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2129ECF44(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_2129ECD34(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E300);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_212A0525C();
  __break(1u);
  return result;
}

uint64_t sub_2129ECE50(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_212A0525C();
  __break(1u);
  return result;
}

uint64_t sub_2129ECF44(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_212A0492C() - 8);
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
  result = sub_212A0525C();
  __break(1u);
  return result;
}

uint64_t sub_2129ED068(__int128 *a1, uint64_t a2)
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

uint64_t sub_2129ED080(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253EFEF38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_2129ED0E0()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2129ED104(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_24_0(v2);
  OUTLINED_FUNCTION_39_0();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2129ED168()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2129ED194(void *a1)
{
  uint64_t v1;

  return sub_2129EAD90(a1, *(_QWORD *)(v1 + 16));
}

void sub_2129ED19C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  OUTLINED_FUNCTION_39_0();
}

uint64_t sub_2129ED1DC()
{
  uint64_t v0;

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 40);

  return swift_deallocObject();
}

void sub_2129ED218(void *a1, char a2)
{
  uint64_t v2;

  sub_2129EB44C(a1, a2 & 1, *(_QWORD *)(v2 + 16), *(void (**)(id))(v2 + 24), *(_QWORD *)(v2 + 32), (_QWORD *)(v2 + 40), *(void **)(v2 + 80));
}

id sub_2129ED230(id a1)
{
  return a1;
}

void sub_2129ED23C(id a1)
{

}

_OWORD *sub_2129ED248(_OWORD *a1, _OWORD *a2)
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

uint64_t sub_2129ED2B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_2129ED330(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

void sub_2129ED330(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_2129F3ED0(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E340);
  if ((sub_212A05238() & 1) == 0)
    goto LABEL_5;
  v13 = sub_2129F3ED0(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    sub_212A052C8();
    __break(1u);
    return;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];

    *(_QWORD *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_2129ED444(v11, a2, a3, a1, v15);
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_2129ED444(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

uint64_t sub_2129ED48C(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t *boxed_opaque_existential_1;
  id v12;
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
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  _QWORD v56[3];
  uint64_t v57;
  uint64_t v58[5];

  v58[3] = a5;
  v58[4] = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v58);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 16))(boxed_opaque_existential_1, a3, a5);
  v12 = a2;
  v13 = sub_212A04E90();
  v15 = v14;
  v16 = sub_212A04E54();
  v18 = v17;

  OUTLINED_FUNCTION_45_0(v19, v20, v21, v22, v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E300);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E308);
  v24 = OUTLINED_FUNCTION_11_0();
  if ((_DWORD)v24)
  {
    sub_2129ED068(&v53, (uint64_t)v56);
    __swift_project_boxed_opaque_existential_1(v56, v57);
    v31 = (id)OUTLINED_FUNCTION_17_0();
  }
  else
  {
    v55 = 0;
    v53 = 0u;
    v54 = 0u;
    OUTLINED_FUNCTION_16_0(v24, &qword_254B5E310, v25, v26, v27, v28, v29, v30, 0);
    OUTLINED_FUNCTION_45_0(v32, v33, v34, v35, v36);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E318);
    if ((OUTLINED_FUNCTION_11_0() & 1) == 0)
    {
      v55 = 0;
      v53 = 0u;
      v54 = 0u;
      OUTLINED_FUNCTION_23();
      v45 = OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_16_0(v45, &qword_254B5E320, v46, v47, v48, v49, v50, v51, 0);
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v58);
    }
    sub_2129ED068(&v53, (uint64_t)v56);
    __swift_project_boxed_opaque_existential_1(v56, v57);
    OUTLINED_FUNCTION_17_0();
    v31 = (id)LNIntentsValueTypeIdentifierAsString();
  }
  v37 = v31;
  v38 = sub_212A04FB0();
  v40 = v39;

  v41 = *(_QWORD *)(*(_QWORD *)(a4 + 16) + 16);
  OUTLINED_FUNCTION_30();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_8();
  if (v41 && (sub_2129F3F20(v13, v15, v16, v18), (v42 & 1) != 0))
  {
    swift_retain();
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {
    OUTLINED_FUNCTION_40_0();
    v43 = (_QWORD *)OUTLINED_FUNCTION_21_0();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_0();
    v44 = MEMORY[0x24BEE4B00];
    v43[5] = v18;
    v43[6] = v44;
    v43[2] = v13;
    v43[3] = v15;
    v43[4] = v16;
  }
  swift_beginAccess();
  sub_2129ED2B4((uint64_t)a1, v38, v40);
  swift_endAccess();
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v56);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v58);
}

void OUTLINED_FUNCTION_0_0()
{
  JUMPOUT(0x212BF7480);
}

BOOL OUTLINED_FUNCTION_2_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_212A04D88();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return swift_dynamicCast();
}

_WORD *OUTLINED_FUNCTION_12_0(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_16_0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_2129ED104((uint64_t)&a9, a2);
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1Tm(v0 - 168);
}

void OUTLINED_FUNCTION_20_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return sub_212A04CF8();
}

uint64_t OUTLINED_FUNCTION_23_0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_2129F37AC(a1, a2, (uint64_t *)(v2 - 168));
}

uint64_t OUTLINED_FUNCTION_24_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return sub_212A0510C();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return sub_212A0492C();
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1Tm(v0 - 128);
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return sub_212A05160();
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  uint64_t v0;

  return sub_2129ED068((__int128 *)(v0 - 256), v0 - 168);
}

uint64_t OUTLINED_FUNCTION_38_0(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  return sub_2129ED080((uint64_t)va1, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  return type metadata accessor for CachedEntityInfo();
}

void OUTLINED_FUNCTION_41_0()
{
  uint64_t v0;

  sub_2129ED19C(v0 - 128, v0 - 208);
}

_QWORD *OUTLINED_FUNCTION_42_0()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 - 168), v0);
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_45_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  va_list va;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a5);
  va_start(va, a5);
  v5 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  sub_2129ED19C((uint64_t)va1, (uint64_t)va);
}

void OUTLINED_FUNCTION_46_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_2129F1FE8(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_47_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 208) = a1;
  return v1 - 208;
}

char *OUTLINED_FUNCTION_49_0(char *a1, int64_t a2)
{
  uint64_t v2;

  return sub_2129ECA98(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  return sub_212A04E30();
}

uint64_t dispatch thunk of RRLinkStructuredDataHandling.typeId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RRLinkStructuredDataHandling.intentTypeName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_2129ED90C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  id v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED68);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEED0);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8]();
  if (!a2)
    sub_212A04E90();
  swift_bridgeObjectRetain();
  if (!a4)
    sub_212A04E54();
  swift_bridgeObjectRetain();
  if (!a5)
    sub_212A04E30();
  swift_retain();
  if (!a7)
    sub_212A04ED8();
  swift_bridgeObjectRetain();
  if (a9 >> 60 == 15)
    sub_212A04E9C();
  sub_2129EF668(a8, a9);
  sub_212A04EA8();
  sub_212A04EE4();
  sub_212A04EB4();
  sub_212A04E60();
  sub_212A04E48();
  sub_212A04ECC();
  v14 = objc_allocWithZone((Class)sub_212A04EF0());
  return sub_212A04E84();
}

char *sub_2129EDB18(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_0_1(a1, a2, a4, (uint64_t)&off_24CE6FFE0, a3);
}

char *sub_2129EDB38(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *boxed_opaque_existential_1;
  void *v19;
  id v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  _OWORD v49[2];
  __int128 v50;
  uint64_t v51;
  uint64_t v52;

  v43 = a2;
  v46 = a5;
  v42 = *(_QWORD *)(a5 + 8);
  v52 = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = sub_212A05154();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)&v41 - v11;
  v45 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v47 = (char *)&v41 - v17;
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_7_0();
  v51 = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v50);
  OUTLINED_FUNCTION_11_1((uint64_t)boxed_opaque_existential_1);
  OUTLINED_FUNCTION_11_1(v5);
  sub_2129EF530(0, &qword_254B5E3A0);
  if ((OUTLINED_FUNCTION_11_0() & 1) != 0)
  {
    v19 = *(void **)&v49[0];
    v20 = objc_msgSend(*(id *)&v49[0], sel_value);
    sub_212A0519C();

    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_12_1();
    sub_2129ED248(v49, &v50);
  }
  v21 = v48;
  v22 = v52;
  sub_2129EF568((uint64_t)&v50, (uint64_t)v49);
  if (OUTLINED_FUNCTION_11_0())
  {
    OUTLINED_FUNCTION_15_1((uint64_t)v12, 0);
    v23 = v45;
    v24 = v47;
    (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v47, v12, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v15, v24, AssociatedTypeWitness);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E3B0);
    if (OUTLINED_FUNCTION_11_0())
    {
      v25 = *(char **)&v49[0];
      swift_getObjectType();
      v12 = v25;
      v26 = v44;
      v27 = sub_2129EE5D0();
      if (v26)
      {
        OUTLINED_FUNCTION_14_0();
        (*(void (**)(char *, uint64_t))(v23 + 8))(v47, AssociatedTypeWitness);
      }
      else
      {
        v34 = v27;
        v35 = v28;
        v36 = v52;
        v37 = (void *)(*(uint64_t (**)(char *, id, uint64_t))(v42 + 32))(v47, v43, v52);
        v38 = (*(uint64_t (**)(uint64_t))(v46 + 24))(v36);
        v40 = v39;
        sub_2129EF624(v34, v35);
        v12 = (char *)sub_2129ED90C(0, 0, 0, 0, 0, v38, v40, v34, v35);
        OUTLINED_FUNCTION_4_1();
        OUTLINED_FUNCTION_14_0();

        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_4_1();
        OUTLINED_FUNCTION_5_1();
      }
    }
    else
    {
      sub_2129EF5A4();
      OUTLINED_FUNCTION_17_1();
      *v32 = 1;
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v24, AssociatedTypeWitness);
    }
  }
  else
  {
    OUTLINED_FUNCTION_15_1((uint64_t)v12, 1);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    v12 = v21;
    (*(void (**)(uint64_t))(v46 + 24))(v22);
    v30 = v29;
    swift_bridgeObjectRelease();
    if (v30)
    {
      sub_2129EF5A4();
      OUTLINED_FUNCTION_17_1();
      *v31 = 0;
      swift_willThrow();
    }
    else
    {
      v12 = (char *)v43;
    }
  }
  OUTLINED_FUNCTION_12_1();
  return v12;
}

void sub_2129EDF2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(_QWORD))
{
  uint64_t v10;
  unint64_t v11;
  void *v12;
  char v13;
  char v14;

  type metadata accessor for SiriReferenceResolverDefaults();
  v10 = sub_2129F9D38();
  if (v11)
  {
    v12 = (void *)sub_2129EDFDC(v10, v11, a3, a4, v10, v11);
    v14 = v13;
    swift_bridgeObjectRelease();
    ((void (*)(void *, _QWORD))a7)(v12, v14 & 1);
    sub_2129ED23C(v12);
  }
  else
  {
    a7(0);
  }
}

uint64_t sub_2129EDFDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unsigned __int8 v17;
  char v18;
  char v19;
  uint64_t v20;
  unsigned __int8 v21;
  uint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  char *v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  unsigned __int8 v54;
  uint64_t v55;
  char v56;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E370);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_7_0();
  v10 = HIBYTE(a6) & 0xF;
  v11 = a5 & 0xFFFFFFFFFFFFLL;
  if ((a6 & 0x2000000000000000) != 0)
    v12 = HIBYTE(a6) & 0xF;
  else
    v12 = a5 & 0xFFFFFFFFFFFFLL;
  if (!v12)
    goto LABEL_49;
  if ((a6 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v14 = (uint64_t)sub_2129EECD4(a5, a6, 10);
    LOBYTE(a5) = v56;
    swift_bridgeObjectRelease();
    goto LABEL_46;
  }
  if ((a6 & 0x2000000000000000) != 0)
  {
    if (a5 == 43)
    {
      if (!v10)
        goto LABEL_70;
      if (v10 == 1)
        goto LABEL_32;
      OUTLINED_FUNCTION_3_1();
      if (!v19 & v18)
        goto LABEL_32;
      v14 = v21;
      if (v20 != 2)
      {
        OUTLINED_FUNCTION_3_1();
        if (!v19 & v18)
          goto LABEL_32;
        v14 = 10 * v14 + v23;
        if (v22 != 3)
        {
          while (1)
          {
            OUTLINED_FUNCTION_6_0();
            if (!v19 & v18)
              goto LABEL_32;
            OUTLINED_FUNCTION_2_1();
            if (!v19)
              goto LABEL_32;
            v14 = v25 + v24;
            if (__OFADD__(v25, v24))
              goto LABEL_32;
            OUTLINED_FUNCTION_9_1();
            if (v19)
              goto LABEL_46;
          }
        }
      }
    }
    else
    {
      if (a5 == 45)
      {
        if (v10)
        {
          if (v10 != 1)
          {
            OUTLINED_FUNCTION_3_1();
            if (!(!v19 & v18))
            {
              if (v16 == 2)
              {
                LOBYTE(a5) = 0;
                v14 = -(uint64_t)v17;
                goto LABEL_46;
              }
              if ((BYTE2(a5) - 48) <= 9u)
              {
                v14 = -10 * v17 - (BYTE2(a5) - 48);
                if (v16 == 3)
                  goto LABEL_45;
                while (1)
                {
                  OUTLINED_FUNCTION_6_0();
                  if (!v19 & v18)
                    break;
                  OUTLINED_FUNCTION_2_1();
                  if (!v19)
                    break;
                  v14 = v55 - v54;
                  if (__OFSUB__(v55, v54))
                    break;
                  OUTLINED_FUNCTION_9_1();
                  if (v19)
                    goto LABEL_46;
                }
              }
            }
          }
LABEL_32:
          v14 = 0;
          LOBYTE(a5) = 1;
          goto LABEL_46;
        }
        __break(1u);
LABEL_70:
        __break(1u);
        JUMPOUT(0x2129EE5A0);
      }
      if (!v10 || (a5 - 48) > 9u)
        goto LABEL_32;
      v14 = (a5 - 48);
      if (v10 != 1)
      {
        OUTLINED_FUNCTION_3_1();
        if (!v19 & v18)
          goto LABEL_32;
        v14 = 10 * (a5 - 48) + v27;
        if (v26 != 2)
        {
          while (1)
          {
            OUTLINED_FUNCTION_6_0();
            if (!v19 & v18)
              goto LABEL_32;
            OUTLINED_FUNCTION_2_1();
            if (!v19)
              goto LABEL_32;
            v14 = v29 + v28;
            if (__OFADD__(v29, v28))
              goto LABEL_32;
            OUTLINED_FUNCTION_9_1();
            if (v19)
              goto LABEL_46;
          }
        }
      }
    }
LABEL_45:
    LOBYTE(a5) = 0;
    goto LABEL_46;
  }
  if ((a5 & 0x1000000000000000) != 0)
    v13 = (unsigned __int8 *)((a6 & 0xFFFFFFFFFFFFFFFLL) + 32);
  else
    v13 = (unsigned __int8 *)sub_212A051FC();
  v14 = (uint64_t)sub_2129EEDF4(v13, v11, 10);
  LOBYTE(a5) = v15 & 1;
LABEL_46:
  if ((a5 & 1) != 0)
  {
LABEL_49:
    v30 = 4;
    goto LABEL_53;
  }
  v30 = 3;
  switch(v14)
  {
    case 0:
      objc_opt_self();
      v31 = swift_bridgeObjectRetain();
      v32 = OUTLINED_FUNCTION_18_1(v31, sel_applicationValueType);
      goto LABEL_51;
    case 2:
      v32 = objc_msgSend((id)objc_opt_self(), sel_environmentValueType);
LABEL_51:
      v33 = v32;
      v34 = objc_allocWithZone(MEMORY[0x24BE5FE00]);
      v35 = (uint64_t)OUTLINED_FUNCTION_1_0();
      if (!v35)
        goto LABEL_52;
      return v35;
    case 3:
      v37 = objc_allocWithZone(MEMORY[0x24BDD9F38]);
      v38 = sub_2129EE808(0xD000000000000013, 0x8000000212A06C00, 1);
      v39 = sub_212A0483C();
      __swift_storeEnumTagSinglePayload(v6, 1, 1, v39);
      objc_allocWithZone(MEMORY[0x24BDD9F30]);
      v40 = v38;
      v41 = sub_2129EE870(v40, v6, 6644289, 0xE300000000000000, 0, 0, 0, 0, 0);
      sub_2129EF530(0, (unint64_t *)&qword_254B5E390);
      v42 = (void *)objc_opt_self();
      v43 = v41;
      v44 = objc_msgSend(v42, sel_personValueType);
      v45 = objc_allocWithZone(MEMORY[0x24BE5FE00]);
      v35 = (uint64_t)OUTLINED_FUNCTION_1_0();

      goto LABEL_58;
    case 9:
      v46 = objc_allocWithZone(MEMORY[0x24BDD9E50]);
      v47 = sub_2129EEA48(0xD000000000000024, 0x8000000212A06BD0, 0, 0xE000000000000000, 1, 0, 0, 0xE000000000000000);
      OUTLINED_FUNCTION_13_1((uint64_t)v47, &qword_254B5E388);
      objc_opt_self();
      v40 = v47;
      v48 = OUTLINED_FUNCTION_18_1((uint64_t)v40, sel_mediaItemValueType);
      goto LABEL_57;
    case 11:
      v49 = objc_allocWithZone(MEMORY[0x24BE5FCF8]);
      v50 = sub_2129EEB40(875770417, 0xE400000000000000, 0x2079656B73696877, 0xEC00000062756C63, 0);
      OUTLINED_FUNCTION_13_1((uint64_t)v50, &qword_254B5E380);
      objc_opt_self();
      v40 = v50;
      v48 = OUTLINED_FUNCTION_18_1((uint64_t)v40, sel_messageConversationValueType);
LABEL_57:
      v51 = v48;
      v52 = objc_allocWithZone(MEMORY[0x24BE5FE00]);
      v35 = (uint64_t)OUTLINED_FUNCTION_1_0();
LABEL_58:

      if (v35)
        return v35;
LABEL_52:
      v30 = 3;
      break;
    default:
      break;
  }
LABEL_53:
  sub_2129EEDB8();
  v35 = swift_allocError();
  *v36 = v30;
  return v35;
}

uint64_t sub_2129EE5D0()
{
  return sub_212A04F14();
}

uint64_t sub_2129EE5EC()
{
  unint64_t v0;

  v0 = sub_212A05268();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_2129EE634(char a1)
{
  if (!a1)
    return 0x707954676E6F7277;
  if (a1 == 1)
    return 0x6169726553746F6ELL;
  return 0xD000000000000012;
}

uint64_t sub_2129EE6A0(char *a1, char *a2)
{
  return sub_212A0158C(*a1, *a2);
}

void sub_2129EE6AC()
{
  char *v0;

  sub_212A01674(*v0);
}

uint64_t sub_2129EE6B4(uint64_t a1)
{
  char *v1;

  return sub_212A017A0(a1, *v1);
}

void sub_2129EE6BC(uint64_t a1)
{
  char *v1;

  sub_212A017E8(a1, *v1);
}

uint64_t sub_2129EE6C4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2129EE5EC();
  *a1 = result;
  return result;
}

uint64_t sub_2129EE6F0@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2129EE634(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

char *sub_2129EE728(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_0_1(a1, a2, a4, (uint64_t)&off_24CE70338, a3);
}

char *sub_2129EE748(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_0_1(a1, a2, a4, (uint64_t)&off_24CE703E0, a3);
}

char *sub_2129EE768(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_0_1(a1, a2, a4, (uint64_t)&off_24CE70490, a3);
}

char *sub_2129EE788(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_0_1(a1, a2, a4, (uint64_t)&off_24CE70760, a3);
}

char *sub_2129EE7A8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_0_1(a1, a2, a4, (uint64_t)&off_24CE707B0, a3);
}

char *sub_2129EE7C8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_0_1(a1, a2, a4, (uint64_t)&off_24CE70828, a3);
}

char *sub_2129EE7E8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_0_1(a1, a2, a4, (uint64_t)&off_24CE70878, a3);
}

id sub_2129EE808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;

  if (a2)
  {
    v5 = (void *)sub_212A04FA4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(v3, sel_initWithValue_type_, v5, a3);

  return v6;
}

id sub_2129EE870(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v10 = v9;
  v16 = sub_212A0483C();
  v17 = 0;
  if (__swift_getEnumTagSinglePayload(a2, 1, v16) != 1)
  {
    v17 = (void *)sub_212A04830();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a2, v16);
  }
  if (a4)
  {
    v18 = (void *)sub_212A04FA4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v18 = 0;
  }
  if (!a7)
  {
    v19 = 0;
    if (a9)
      goto LABEL_8;
LABEL_10:
    v20 = 0;
    goto LABEL_11;
  }
  v19 = (void *)sub_212A04FA4();
  swift_bridgeObjectRelease();
  if (!a9)
    goto LABEL_10;
LABEL_8:
  v20 = (void *)sub_212A04FA4();
  swift_bridgeObjectRelease();
LABEL_11:
  v21 = objc_msgSend(v10, sel_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_, a1, v17, v18, a5, v19, v20);

  return v21;
}

id sub_2129EE9D4(_QWORD *a1, void *a2)
{
  void *v2;
  id v5;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v5 = objc_msgSend(v2, sel_initWithValue_valueType_, sub_212A05298(), a2);
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return v5;
}

id sub_2129EEA48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  void *v9;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v9 = v8;
  if (a2)
  {
    v14 = (void *)sub_212A04FA4();
    swift_bridgeObjectRelease();
    if (a4)
      goto LABEL_3;
LABEL_6:
    v15 = 0;
    if (a8)
      goto LABEL_4;
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  v14 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v15 = (void *)sub_212A04FA4();
  swift_bridgeObjectRelease();
  if (!a8)
    goto LABEL_7;
LABEL_4:
  v16 = (void *)sub_212A04FA4();
  swift_bridgeObjectRelease();
LABEL_8:
  v17 = objc_msgSend(v9, sel_initWithIdentifier_title_type_artwork_artist_, v14, v15, a5, a6, v16);

  return v17;
}

id sub_2129EEB40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v8 = (void *)sub_212A04FA4();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    v9 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v9 = (void *)sub_212A04FA4();
  swift_bridgeObjectRelease();
  if (!a5)
    goto LABEL_5;
LABEL_3:
  sub_2129EF530(0, (unint64_t *)&qword_254B5E390);
  v10 = (void *)sub_212A050A0();
  swift_bridgeObjectRelease();
LABEL_6:
  v11 = objc_msgSend(v5, sel_initWithMessageConversationIdentifier_groupName_recipients_, v8, v9, v10);

  return v11;
}

_QWORD *sub_2129EEC18(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEF28);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2129EEC7C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v6 = sub_212A05064();
    OUTLINED_FUNCTION_10_1(v6);
    return v7 | 4;
  }
  else
  {
    v3 = MEMORY[0x212BF6DB4](15, a1 >> 16);
    OUTLINED_FUNCTION_10_1(v3);
    return v4 | 8;
  }
}

unsigned __int8 *sub_2129EECD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_212A0507C();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_2129EF070();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_212A051FC();
  }
LABEL_7:
  v11 = sub_2129EEDF4(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_2129EEDB8()
{
  unint64_t result;

  result = qword_254B5E378;
  if (!qword_254B5E378)
  {
    result = MEMORY[0x212BF73E4](&protocol conformance descriptor for LinkError, &type metadata for LinkError);
    atomic_store(result, (unint64_t *)&qword_254B5E378);
  }
  return result;
}

unsigned __int8 *sub_2129EEDF4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 *v19;
  unsigned int v20;
  char v21;
  uint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;

  v3 = a2;
  v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      v15 = a2 - 1;
      if (a2 != 1)
      {
        v16 = a3 + 48;
        v17 = a3 + 55;
        v18 = a3 + 87;
        if (a3 > 10)
        {
          v16 = 58;
        }
        else
        {
          v18 = 97;
          v17 = 65;
        }
        if (result)
        {
          v9 = 0;
          v19 = result + 1;
          do
          {
            v20 = *v19;
            if (v20 < 0x30 || v20 >= v16)
            {
              if (v20 < 0x41 || v20 >= v17)
              {
                v13 = 0;
                if (v20 < 0x61 || v20 >= v18)
                  return (unsigned __int8 *)v13;
                v21 = -87;
              }
              else
              {
                v21 = -55;
              }
            }
            else
            {
              v21 = -48;
            }
            v22 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
              return 0;
            v9 = v22 + (v20 + v21);
            if (__OFADD__(v22, (v20 + v21)))
              return 0;
            ++v19;
            --v15;
          }
          while (v15);
          return (unsigned __int8 *)v9;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
      if (a2)
      {
        v23 = a3 + 48;
        v24 = a3 + 55;
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v23 = 58;
        }
        else
        {
          v25 = 97;
          v24 = 65;
        }
        if (result)
        {
          v26 = 0;
          do
          {
            v27 = *result;
            if (v27 < 0x30 || v27 >= v23)
            {
              if (v27 < 0x41 || v27 >= v24)
              {
                v13 = 0;
                if (v27 < 0x61 || v27 >= v25)
                  return (unsigned __int8 *)v13;
                v28 = -87;
              }
              else
              {
                v28 = -55;
              }
            }
            else
            {
              v28 = -48;
            }
            v29 = v26 * a3;
            if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63)
              return 0;
            v26 = v29 + (v27 + v28);
            if (__OFADD__(v29, (v27 + v28)))
              return 0;
            ++result;
            --v3;
          }
          while (v3);
          return (unsigned __int8 *)(v29 + (v27 + v28));
        }
        return 0;
      }
      return 0;
    }
    if (a2 >= 1)
    {
      v5 = a2 - 1;
      if (a2 != 1)
      {
        v6 = a3 + 48;
        v7 = a3 + 55;
        v8 = a3 + 87;
        if (a3 > 10)
        {
          v6 = 58;
        }
        else
        {
          v8 = 97;
          v7 = 65;
        }
        if (result)
        {
          v9 = 0;
          for (i = result + 1; ; ++i)
          {
            v11 = *i;
            if (v11 < 0x30 || v11 >= v6)
            {
              if (v11 < 0x41 || v11 >= v7)
              {
                v13 = 0;
                if (v11 < 0x61 || v11 >= v8)
                  return (unsigned __int8 *)v13;
                v12 = -87;
              }
              else
              {
                v12 = -55;
              }
            }
            else
            {
              v12 = -48;
            }
            v14 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
              return 0;
            v9 = v14 - (v11 + v12);
            if (__OFSUB__(v14, (v11 + v12)))
              return 0;
            if (!--v5)
              return (unsigned __int8 *)v9;
          }
        }
        return 0;
      }
      return 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2129EF070()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_2129EF0CC();
  v4 = sub_2129EF100(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2129EF0CC()
{
  return sub_212A05088();
}

uint64_t sub_2129EF100(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_2129EF244(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_2129EEC18(v9, 0);
      v12 = sub_2129EF330((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x212BF6D54](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x212BF6D54);
LABEL_9:
      sub_212A051FC();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x212BF6D54]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_2129EF244(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_2129EEC7C(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_2129EEC7C(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_212A0504C();
  }
  __break(1u);
  return result;
}

unint64_t sub_2129EF330(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
    goto LABEL_38;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_35:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    result = v12;
    if ((v12 & 0xC) == v15)
      result = sub_2129EEC7C(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_212A05058();
      v19 = result;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_212A051FC();
        v19 = *(_BYTE *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      result = sub_2129EEC7C(v12, a6, a7);
      v12 = result;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v23 <= v12 >> 16)
      goto LABEL_37;
    v12 = sub_212A05034();
LABEL_31:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_35;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_35;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_2129EF530(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2129EF568(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2129EF5A4()
{
  unint64_t result;

  result = qword_254B5E3A8;
  if (!qword_254B5E3A8)
  {
    result = MEMORY[0x212BF73E4](&unk_212A05C1C, &type metadata for StructuredDataHandlingError);
    atomic_store(result, (unint64_t *)&qword_254B5E3A8);
  }
  return result;
}

uint64_t sub_2129EF5E0(uint64_t a1, unint64_t a2)
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

uint64_t sub_2129EF624(uint64_t a1, unint64_t a2)
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

uint64_t sub_2129EF668(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2129EF624(a1, a2);
  return a1;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for StructuredDataHandlingError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for StructuredDataHandlingError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2129EF760 + 4 * byte_212A05B05[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2129EF794 + 4 * byte_212A05B00[v4]))();
}

uint64_t sub_2129EF794(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2129EF79C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2129EF7A4);
  return result;
}

uint64_t sub_2129EF7B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2129EF7B8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2129EF7BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2129EF7C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2129EF7D0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2129EF7DC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for StructuredDataHandlingError()
{
  return &type metadata for StructuredDataHandlingError;
}

unint64_t sub_2129EF7F8()
{
  unint64_t result;

  result = qword_254B5E3B8;
  if (!qword_254B5E3B8)
  {
    result = MEMORY[0x212BF73E4](&unk_212A05BF4, &type metadata for StructuredDataHandlingError);
    atomic_store(result, (unint64_t *)&qword_254B5E3B8);
  }
  return result;
}

char *OUTLINED_FUNCTION_0_1@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_2129EDB38(a1, a2, a3, a5, a4);
}

id OUTLINED_FUNCTION_1_0()
{
  void *v0;
  uint64_t v1;

  return sub_2129EE9D4((_QWORD *)(v1 - 88), v0);
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2129EF5E0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v1 + 8))(*(_QWORD *)(v2 - 160), v0);
}

unint64_t OUTLINED_FUNCTION_10_1(uint64_t a1)
{
  char v1;

  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t OUTLINED_FUNCTION_11_1(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1Tm(v0 - 112);
}

uint64_t OUTLINED_FUNCTION_13_1(uint64_t a1, unint64_t *a2)
{
  return sub_2129EF530(0, a2);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_15_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return swift_allocError();
}

id OUTLINED_FUNCTION_18_1(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

_QWORD *initializeBufferWithCopyOfBuffer for EnvironmentStructuredDataHandler(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for EnvironmentStructuredDataHandler()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for EnvironmentStructuredDataHandler(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
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

_QWORD *assignWithTake for EnvironmentStructuredDataHandler(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EnvironmentStructuredDataHandler(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for EnvironmentStructuredDataHandler(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for EnvironmentStructuredDataHandler()
{
  return &type metadata for EnvironmentStructuredDataHandler;
}

unint64_t sub_2129EFA9C()
{
  return 0xD000000000000011;
}

uint64_t sub_2129EFAB8()
{
  return 2;
}

unint64_t sub_2129EFAC0()
{
  return 0xD000000000000018;
}

uint64_t sub_2129EFADC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v16[4];

  v6 = sub_212A0492C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_212A04974();
  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRetain();
  v10 = MEMORY[0x212BF66DC](a1, a2);
  swift_bridgeObjectRetain();
  sub_212A04908();
  sub_212A04890();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_212A04884();
  OUTLINED_FUNCTION_51();
  v11 = sub_212A04878();
  v16[3] = v10;
  v12 = v11;
  sub_212A04938();
  v13 = MEMORY[0x212BF66C4](v11);
  if (v13)
  {
    v12 = (uint64_t)a3;
    sub_2129ED90C(0, 0, 0, 0, v13, 0, 0, 0, 0xF000000000000000);
    OUTLINED_FUNCTION_0_2();
    swift_release();
  }
  else
  {
    v14 = a3;
    OUTLINED_FUNCTION_0_2();
  }
  swift_release();
  return v12;
}

uint64_t sub_2129EFCA4()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_2129EFCD0()
{
  sub_2129EFA9C();
  return 0xD000000000000011;
}

unint64_t sub_2129EFCEC()
{
  sub_2129EFAC0();
  return 0xD000000000000018;
}

uint64_t sub_2129EFD08(uint64_t *a1, void *a2)
{
  return sub_2129EFADC(*a1, a1[1], a2);
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return swift_release();
}

Swift::String_optional __swiftcall CNContactStore.retriveContactName(identifier:)(Swift::String identifier)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  Swift::String_optional result;
  id v19[2];

  v19[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = HIBYTE(identifier._object) & 0xF;
  if (((uint64_t)identifier._object & 0x2000000000000000) == 0)
    v2 = identifier._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  if (!v2)
    goto LABEL_9;
  v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEF30);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_212A05CD0;
  *(_QWORD *)(v4 + 32) = objc_msgSend((id)objc_opt_self(), sel_descriptorForRequiredKeysForStyle_, 0);
  sub_212A050C4();
  v5 = (void *)sub_212A04FA4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E3F8);
  v6 = (void *)sub_212A050A0();
  swift_bridgeObjectRelease();
  v19[0] = 0;
  v7 = objc_msgSend(v3, sel_unifiedContactWithIdentifier_keysToFetch_error_, v5, v6, v19);

  if (!v7)
  {
    v14 = v19[0];
    v15 = (void *)sub_212A04848();

    swift_willThrow();
LABEL_9:
    v11 = 0;
    v13 = 0;
    goto LABEL_10;
  }
  v8 = v19[0];
  v9 = objc_msgSend(v7, sel_fullName);
  if (!v9)
  {

    goto LABEL_9;
  }
  v10 = v9;
  v11 = sub_212A04FB0();
  v13 = v12;

LABEL_10:
  v16 = v11;
  v17 = v13;
  result.value._object = v17;
  result.value._countAndFlagsBits = v16;
  return result;
}

uint64_t sub_2129EFEF8(uint64_t a1, uint64_t a2)
{
  return CNContactStore.retriveContactName(identifier:)(*(Swift::String *)&a1).value._countAndFlagsBits;
}

uint64_t dispatch thunk of ContactStoring.retriveContactName(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

void sub_2129EFF20(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  os_log_type_t v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  os_log_type_t v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  char v32;
  char v33;
  id v34;
  void *v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED68);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_2_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEED0);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_2_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED70);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_2();
  v55 = v5;
  v6 = sub_2129F0610(a1);
  swift_bridgeObjectRetain_n();
  v7 = (void *)sub_212A04D88();
  v8 = sub_212A0510C();
  if (OUTLINED_FUNCTION_5_2(v8))
  {
    v9 = (_DWORD *)OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
    *v9 = 136315138;
    v10 = OUTLINED_FUNCTION_13_2();
    v11 = MEMORY[0x212BF6E50](v6, v10);
    v13 = OUTLINED_FUNCTION_11_2(v11, v12);
    OUTLINED_FUNCTION_10_2(v13);
    sub_212A05160();
    OUTLINED_FUNCTION_13_0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_2(&dword_2129E2000, v14, v15, "[postResolveProcessing] pureMatchFilteredEntities: %s");
    OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_13_0();

  sub_212A04DE8();
  v16 = sub_2129F0ACC(v6);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  v17 = (void *)sub_212A04D88();
  v18 = sub_212A0510C();
  if (OUTLINED_FUNCTION_5_2(v18))
  {
    v19 = (_DWORD *)OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_0();
    *v19 = 136315138;
    v20 = OUTLINED_FUNCTION_13_2();
    v21 = MEMORY[0x212BF6E50](v16, v20);
    v23 = OUTLINED_FUNCTION_11_2(v21, v22);
    OUTLINED_FUNCTION_10_2(v23);
    sub_212A05160();
    OUTLINED_FUNCTION_13_0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_2(&dword_2129E2000, v24, v25, "[postResolveProcessing] selectExactValueMatchedCandidatesFrom: %s");
    OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_13_0();

  v56 = MEMORY[0x24BEE4AF8];
  if (!(v16 >> 62))
  {
    v26 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v26)
      goto LABEL_7;
LABEL_22:
    OUTLINED_FUNCTION_9();
    return;
  }
  swift_bridgeObjectRetain();
  v26 = sub_212A05250();
  OUTLINED_FUNCTION_9();
  if (!v26)
    goto LABEL_22;
LABEL_7:
  if (v26 >= 1)
  {
    v27 = 0;
    v28 = v16 & 0xC000000000000001;
    OUTLINED_FUNCTION_12_2();
    v53 = v16;
    v52 = v26;
    v51 = v16 & 0xC000000000000001;
    do
    {
      if (v28)
        v29 = (id)MEMORY[0x212BF6F58](v27, v16);
      else
        v29 = *(id *)(v16 + 8 * v27 + 32);
      v30 = v29;
      sub_212A04E90();
      v31 = sub_212A04860();
      __swift_storeEnumTagSinglePayload(v55, 1, 1, v31);
      sub_2129E6D84();
      sub_212A05184();
      v33 = v32;
      sub_2129F1D28(v55);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v34 = v30;
      v35 = v34;
      if ((v33 & 1) != 0)
      {
        MEMORY[0x212BF6E08]();
        if (*(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          OUTLINED_FUNCTION_7_1();
        sub_212A050F4();
        sub_212A050C4();
      }
      else
      {
        v54 = v34;
        v36 = v34;
        v37 = sub_212A04D88();
        v38 = sub_212A0510C();
        if (os_log_type_enabled(v37, v38))
        {
          v39 = (uint8_t *)OUTLINED_FUNCTION_3_0();
          OUTLINED_FUNCTION_3_0();
          *(_DWORD *)v39 = 136315138;
          v40 = sub_212A04E90();
          OUTLINED_FUNCTION_11_2(v40, v41);
          sub_212A05160();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2129E2000, v37, v38, "[postResolveProcessing] Modifying entityId: %s", v39, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_0_0();
        }

        sub_212A04E90();
        v42 = sub_212A05088();
        v44 = v43;
        v46 = v45;
        v48 = v47;
        swift_bridgeObjectRelease();
        MEMORY[0x212BF6D48](v42, v44, v46, v48);
        swift_bridgeObjectRelease();
        sub_212A04E54();
        sub_212A04E30();
        sub_212A04ED8();
        sub_212A04E9C();
        sub_212A04EA8();
        sub_212A04EE4();
        sub_212A04EB4();
        sub_212A04E60();
        sub_212A04E6C();
        sub_212A04E48();
        sub_212A04ECC();
        v49 = objc_allocWithZone((Class)OUTLINED_FUNCTION_13_2());
        v50 = (id)sub_212A04E84();
        MEMORY[0x212BF6E08]();
        if (*(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          OUTLINED_FUNCTION_7_1();
        sub_212A050F4();
        sub_212A050C4();

        v16 = v53;
        v26 = v52;
        v28 = v51;
        OUTLINED_FUNCTION_12_2();
        v35 = v54;
      }
      ++v27;

    }
    while (v26 != v27);
    goto LABEL_22;
  }
  __break(1u);
}

unint64_t sub_2129F0610(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void (*v19)(char *, unint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v25;
  void (*v26)(char *, uint64_t);
  void (*v27)(char *, uint64_t);
  id v28;
  void (*v29)(char *, uint64_t);
  unint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  id v43;
  unint64_t v44;
  const char *v45;
  unint64_t v46;
  unint64_t v47;

  v2 = sub_212A0492C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v36 - v7;
  v47 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_36;
  v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v9)
  {
    v10 = 0;
    v40 = a1;
    v41 = a1 & 0xC000000000000001;
    v37 = a1 + 32;
    v38 = a1 & 0xFFFFFFFFFFFFFF8;
    v45 = "common_ReminderList";
    v46 = 0x8000000212A06CC0;
    v39 = v9;
    while (1)
    {
      if (v41)
      {
        v11 = (id)MEMORY[0x212BF6F58](v10, a1);
      }
      else
      {
        if (v10 >= *(_QWORD *)(v38 + 16))
          goto LABEL_35;
        v11 = *(id *)(v37 + 8 * v10);
      }
      v12 = v11;
      if (__OFADD__(v10++, 1))
        break;
      sub_212A04E30();
      v14 = sub_212A04CEC();
      swift_release();
      v15 = v14;
      v16 = *(_QWORD *)(v14 + 16);
      if (!v16)
      {
        swift_bridgeObjectRelease();
LABEL_27:
        v28 = v12;
        MEMORY[0x212BF6E08]();
        if (*(_QWORD *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_212A050D0();
        sub_212A050F4();
        sub_212A050C4();

        goto LABEL_32;
      }
      v43 = v12;
      v44 = v10;
      v17 = v15 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
      v42 = v15;
      swift_bridgeObjectRetain();
      v18 = *(_QWORD *)(v3 + 72);
      v19 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
      while (1)
      {
        v19(v8, v17, v2);
        v20 = sub_212A04920();
        if (!v21)
        {
          v19(v6, (unint64_t)v8, v2);
LABEL_23:
          v27 = *(void (**)(char *, uint64_t))(v3 + 8);
          v27(v6, v2);
          v27(v8, v2);
          goto LABEL_24;
        }
        if (v20 == 0xD000000000000013 && v21 == v46)
        {
          swift_bridgeObjectRelease();
          v19(v6, (unint64_t)v8, v2);
        }
        else
        {
          v22 = sub_212A052B0();
          swift_bridgeObjectRelease();
          v19(v6, (unint64_t)v8, v2);
          if ((v22 & 1) == 0)
            goto LABEL_23;
        }
        if (sub_212A04914() == 0x65747265766E6F63 && v23 == 0xE900000000000064)
          break;
        v25 = sub_212A052B0();
        swift_bridgeObjectRelease();
        v26 = *(void (**)(char *, uint64_t))(v3 + 8);
        v26(v6, v2);
        v26(v8, v2);
        if ((v25 & 1) != 0)
          goto LABEL_31;
LABEL_24:
        v17 += v18;
        if (!--v16)
        {
          swift_bridgeObjectRelease_n();
          v9 = v39;
          a1 = v40;
          v12 = v43;
          v10 = v44;
          goto LABEL_27;
        }
      }
      swift_bridgeObjectRelease();
      v29 = *(void (**)(char *, uint64_t))(v3 + 8);
      v29(v6, v2);
      v29(v8, v2);
LABEL_31:

      swift_bridgeObjectRelease_n();
      v9 = v39;
      a1 = v40;
      v10 = v44;
LABEL_32:
      if (v10 == v9)
      {
        swift_bridgeObjectRelease();
        v30 = v47;
        goto LABEL_38;
      }
    }
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    v9 = sub_212A05250();
  }
  swift_bridgeObjectRelease();
  v30 = MEMORY[0x24BEE4AF8];
LABEL_38:
  if (v30 >> 62)
  {
    swift_bridgeObjectRetain();
    v34 = sub_212A05250();
    swift_bridgeObjectRelease();
    if (v34)
      goto LABEL_40;
LABEL_44:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    return a1;
  }
  if (!*(_QWORD *)((v30 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_44;
LABEL_40:
  v31 = sub_212A04D88();
  v32 = sub_212A0510C();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_2129E2000, v31, v32, "Filtered out flexible matched entities and only returning pure matches", v33, 2u);
    MEMORY[0x212BF7480](v33, -1, -1);
  }

  return v30;
}

unint64_t sub_2129F0ACC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  BOOL v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  BOOL v20;
  BOOL v21;
  uint64_t v22;

  v2 = sub_2129F0D98();
  if (!v3)
    goto LABEL_31;
  v6 = v2;
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = sub_212A04D88();
  v11 = sub_212A0510C();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2129E2000, v10, v11, "Try to filter for exact match candidates only", v12, 2u);
    MEMORY[0x212BF7480](v12, -1, -1);
  }

  v13 = v6 == 1701667182 && v7 == 0xE400000000000000;
  if (v13 || (sub_212A052B0() & 1) != 0)
  {
    v14 = swift_bridgeObjectRetain();
    v15 = sub_2129F134C;
LABEL_10:
    v16 = (unint64_t)sub_2129F167C(v14, v6, v7, v8, v9, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v15);
    goto LABEL_11;
  }
  v20 = v6 == 0x6C6562616CLL && v7 == 0xE500000000000000;
  if (v20 || (sub_212A052B0() & 1) != 0)
  {
    v14 = swift_bridgeObjectRetain();
    v15 = sub_2129F184C;
    goto LABEL_10;
  }
  v21 = v6 == 0x65756C6176 && v7 == 0xE500000000000000;
  if (v21 || (sub_212A052B0() & 1) != 0)
  {
    v14 = swift_bridgeObjectRetain();
    v15 = sub_2129F1AE8;
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v16 = MEMORY[0x24BEE4AF8];
LABEL_11:
  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    v22 = sub_212A05250();
    swift_bridgeObjectRelease();
    if (v22)
      goto LABEL_13;
    goto LABEL_30;
  }
  if (!*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_30:
    swift_bridgeObjectRelease();
LABEL_31:
    swift_bridgeObjectRetain();
    return a1;
  }
LABEL_13:
  v17 = sub_212A04D88();
  v18 = sub_212A0510C();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_2129E2000, v17, v18, "We did filter to exact match candidates only", v19, 2u);
    MEMORY[0x212BF7480](v19, -1, -1);
  }

  return v16;
}

uint64_t sub_2129F0D98()
{
  uint64_t v0;
  char v2;
  uint64_t v3;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (sub_212A04CF8() == 0x505F6E6F6D6D6F63 && v0 == 0xED00006E6F737265)
    goto LABEL_13;
  v2 = sub_212A052B0();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
    goto LABEL_14;
  if (sub_212A04CF8() == 0x525F6E6F6D6D6F63 && v3 == 0xEF7265646E696D65)
    goto LABEL_13;
  v5 = sub_212A052B0();
  swift_bridgeObjectRelease();
  if ((v5 & 1) != 0)
    goto LABEL_14;
  if (sub_212A04CF8() == 0xD000000000000013 && v6 == 0x8000000212A06CA0)
  {
LABEL_13:
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = sub_212A052B0();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0)
      goto LABEL_25;
  }
LABEL_14:
  v7 = 1701667182;
  v8 = sub_212A04CE0();
  v9 = sub_2129F1F0C(1701667182, 0xE400000000000000, v8);
  swift_bridgeObjectRelease();
  if (!v9)
    goto LABEL_25;
  if (!(v9 >> 62))
  {
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_17;
LABEL_24:
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  v13 = sub_212A05250();
  swift_bridgeObjectRelease();
  if (!v13)
    goto LABEL_24;
LABEL_17:
  sub_2129F7390(0, (v9 & 0xC000000000000001) == 0, v9);
  if ((v9 & 0xC000000000000001) != 0)
    MEMORY[0x212BF6F58](0, v9);
  else
    swift_retain();
  swift_bridgeObjectRelease();
  sub_212A04C98();
  v11 = v10;
  swift_release();
  if (!v11)
  {
LABEL_25:
    v14 = sub_212A04CE0();
    v15 = sub_2129F1F0C(0xD000000000000018, 0x8000000212A06850, v14);
    swift_bridgeObjectRelease();
    if (!v15)
      goto LABEL_46;
    if (v15 >> 62)
    {
      swift_bridgeObjectRetain();
      v21 = sub_212A05250();
      swift_bridgeObjectRelease();
      if (!v21)
        goto LABEL_45;
    }
    else if (!*(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_45;
    }
    sub_2129F7390(0, (v15 & 0xC000000000000001) == 0, v15);
    if ((v15 & 0xC000000000000001) != 0)
      MEMORY[0x212BF6F58](0, v15);
    else
      swift_retain();
    swift_bridgeObjectRelease();
    v16 = sub_212A04CBC();
    swift_release();
    if (!v16)
      goto LABEL_46;
    v7 = 0x6C6562616CLL;
    v17 = sub_212A04CE0();
    v18 = sub_2129F1F0C(0x6C6562616CLL, 0xE500000000000000, v17);
    swift_bridgeObjectRelease();
    if (!v18)
    {
      swift_release();
      goto LABEL_46;
    }
    if (v18 >> 62)
    {
      swift_bridgeObjectRetain();
      v22 = sub_212A05250();
      swift_bridgeObjectRelease();
      if (v22)
      {
LABEL_34:
        sub_2129F7390(0, (v18 & 0xC000000000000001) == 0, v18);
        if ((v18 & 0xC000000000000001) != 0)
          MEMORY[0x212BF6F58](0, v18);
        else
          swift_retain();
        swift_bridgeObjectRelease();
        sub_212A04C98();
        v20 = v19;
        swift_release();
        swift_release();
        if (v20)
          return v7;
LABEL_46:
        if (sub_212A04CF8() == 0xD000000000000014 && v23 == 0x8000000212A06870)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          v24 = sub_212A052B0();
          swift_bridgeObjectRelease();
          if ((v24 & 1) == 0)
            return 0;
        }
        v7 = 0x65756C6176;
        v25 = sub_212A04CE0();
        v26 = sub_2129F1F0C(0x65756C6176, 0xE500000000000000, v25);
        swift_bridgeObjectRelease();
        if (v26)
        {
          if (v26 >> 62)
          {
            swift_bridgeObjectRetain();
            v29 = sub_212A05250();
            swift_bridgeObjectRelease();
            if (v29)
              goto LABEL_53;
          }
          else if (*(_QWORD *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
LABEL_53:
            sub_2129F7390(0, (v26 & 0xC000000000000001) == 0, v26);
            if ((v26 & 0xC000000000000001) != 0)
              MEMORY[0x212BF6F58](0, v26);
            else
              swift_retain();
            swift_bridgeObjectRelease();
            sub_212A04C98();
            v28 = v27;
            swift_release();
            if (!v28)
              return 0;
            return v7;
          }
          swift_bridgeObjectRelease();
          return 0;
        }
        return 0;
      }
    }
    else if (*(_QWORD *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_34;
    }
    swift_release();
LABEL_45:
    swift_bridgeObjectRelease();
    goto LABEL_46;
  }
  return v7;
}

uint64_t sub_2129F134C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t result;
  BOOL v15;
  char v16;
  uint64_t v17;

  sub_212A04E30();
  v0 = sub_212A04CF8();
  v2 = v1;
  swift_release();
  v3 = v0 == 0x505F6E6F6D6D6F63 && v2 == 0xED00006E6F737265;
  if (v3
    || (sub_212A052B0() & 1) != 0
    || (v0 == 0x525F6E6F6D6D6F63 ? (v15 = v2 == 0xEF7265646E696D65) : (v15 = 0),
        v15 || (sub_212A052B0() & 1) != 0 || v0 == 0xD000000000000013 && v2 == 0x8000000212A06CA0))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = sub_212A052B0();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v16 & 1) == 0)
      return result;
  }
  sub_212A04E30();
  v4 = sub_212A04CE0();
  swift_release();
  v5 = sub_2129F1F0C(1701667182, 0xE400000000000000, v4);
  swift_bridgeObjectRelease();
  if (!v5)
    return 0;
  if (!(v5 >> 62))
  {
    if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_10;
    goto LABEL_30;
  }
  swift_bridgeObjectRetain();
  v17 = sub_212A05250();
  swift_bridgeObjectRelease();
  if (!v17)
  {
LABEL_30:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_10:
  sub_2129F7390(0, (v5 & 0xC000000000000001) == 0, v5);
  if ((v5 & 0xC000000000000001) != 0)
    MEMORY[0x212BF6F58](0, v5);
  else
    swift_retain();
  swift_bridgeObjectRelease();
  sub_212A04C98();
  v7 = v6;
  swift_release();
  if (!v7)
    return 0;
  type metadata accessor for BaseQueryMatcher();
  v8 = sub_2129E5AA0();
  v10 = v9;
  swift_bridgeObjectRelease();
  if (v8 == sub_2129E5AA0() && v10 == v11)
  {
    swift_bridgeObjectRelease_n();
    return 1;
  }
  else
  {
    v13 = sub_212A052B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v13 & 1;
  }
}

uint64_t (*sub_2129F167C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD)))(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD)
{
  uint64_t v6;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  unint64_t v16;
  char v17;
  uint64_t (*v19)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v25;
  uint64_t (*v26)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);

  v11 = a1;
  v26 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_18;
  v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v12)
  {
    while (1)
    {
      v13 = 0;
      v22 = v11 & 0xFFFFFFFFFFFFFF8;
      v23 = v11 & 0xC000000000000001;
      v20 = v11;
      v21 = v12;
      v19 = a6;
      while (v23)
      {
        v14 = (id)MEMORY[0x212BF6F58](v13, v11);
LABEL_7:
        v15 = v14;
        v16 = v13 + 1;
        if (__OFADD__(v13, 1))
          goto LABEL_17;
        v25 = v14;
        v17 = a6(&v25, a2, a3, a4, a5);
        if (v6)
        {
          swift_bridgeObjectRelease();

          swift_release();
          goto LABEL_21;
        }
        if ((v17 & 1) != 0)
        {
          sub_212A05208();
          sub_212A05220();
          sub_212A0522C();
          sub_212A05214();
          a6 = v19;
          v11 = v20;
        }
        else
        {

        }
        ++v13;
        if (v16 == v21)
        {
          a6 = v26;
          goto LABEL_20;
        }
      }
      if (v13 < *(_QWORD *)(v22 + 16))
        break;
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      v12 = sub_212A05250();
      if (!v12)
        goto LABEL_19;
    }
    v14 = *(id *)(v11 + 8 * v13 + 32);
    goto LABEL_7;
  }
LABEL_19:
  a6 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x24BEE4AF8];
LABEL_20:
  swift_bridgeObjectRelease();
LABEL_21:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a6;
}

unint64_t sub_2129F184C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  sub_212A04E30();
  v0 = sub_212A04CE0();
  swift_release();
  v1 = sub_2129F1F0C(0xD000000000000018, 0x8000000212A06850, v0);
  swift_bridgeObjectRelease();
  if (v1)
  {
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      v11 = sub_212A05250();
      swift_bridgeObjectRelease();
      if (!v11)
        goto LABEL_27;
    }
    else if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_27;
    }
    sub_2129F7390(0, (v1 & 0xC000000000000001) == 0, v1);
    if ((v1 & 0xC000000000000001) != 0)
      MEMORY[0x212BF6F58](0, v1);
    else
      swift_retain();
    swift_bridgeObjectRelease();
    v2 = sub_212A04CBC();
    swift_release();
    if (!v2)
      goto LABEL_28;
    v3 = sub_212A04CE0();
    v1 = sub_2129F1F0C(0x6C6562616CLL, 0xE500000000000000, v3);
    swift_bridgeObjectRelease();
    if (!v1)
    {
LABEL_21:
      swift_release();
      return v1 & 1;
    }
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      v12 = sub_212A05250();
      swift_bridgeObjectRelease();
      if (v12)
        goto LABEL_10;
    }
    else if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_10:
      sub_2129F7390(0, (v1 & 0xC000000000000001) == 0, v1);
      if ((v1 & 0xC000000000000001) != 0)
        MEMORY[0x212BF6F58](0, v1);
      else
        swift_retain();
      swift_bridgeObjectRelease();
      sub_212A04C98();
      v5 = v4;
      swift_release();
      if (v5)
      {
        type metadata accessor for BaseQueryMatcher();
        v6 = sub_2129E5AA0();
        v8 = v7;
        swift_bridgeObjectRelease();
        if (v6 == sub_2129E5AA0() && v8 == v9)
          LOBYTE(v1) = 1;
        else
          LOBYTE(v1) = sub_212A052B0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_21;
      }
      swift_release();
LABEL_28:
      LOBYTE(v1) = 0;
      return v1 & 1;
    }
    swift_release();
LABEL_27:
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
  return v1 & 1;
}

uint64_t sub_2129F1AE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;

  sub_212A04E30();
  v0 = sub_212A04CF8();
  v2 = v1;
  swift_release();
  if (v0 == 0xD000000000000014 && v2 == 0x8000000212A06870)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = sub_212A052B0();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v3 & 1) == 0)
      return result;
  }
  sub_212A04E30();
  v5 = sub_212A04CE0();
  swift_release();
  v6 = sub_2129F1F0C(0x65756C6176, 0xE500000000000000, v5);
  swift_bridgeObjectRelease();
  if (!v6)
    return 0;
  if (!(v6 >> 62))
  {
    if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_8;
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  v15 = sub_212A05250();
  swift_bridgeObjectRelease();
  if (!v15)
    goto LABEL_18;
LABEL_8:
  sub_2129F7390(0, (v6 & 0xC000000000000001) == 0, v6);
  if ((v6 & 0xC000000000000001) != 0)
    MEMORY[0x212BF6F58](0, v6);
  else
    swift_retain();
  swift_bridgeObjectRelease();
  sub_212A04C98();
  v8 = v7;
  swift_release();
  if (!v8)
    return 0;
  type metadata accessor for BaseQueryMatcher();
  v9 = sub_2129E5AA0();
  v11 = v10;
  swift_bridgeObjectRelease();
  if (v9 == sub_2129E5AA0() && v11 == v12)
  {
    swift_bridgeObjectRelease_n();
    return 1;
  }
  else
  {
    v14 = sub_212A052B0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v14 & 1;
  }
}

uint64_t sub_2129F1D28(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

BOOL OUTLINED_FUNCTION_5_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_212A050D0();
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_10_2(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 144) = a1;
  return v1 - 144;
}

uint64_t OUTLINED_FUNCTION_11_2(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_2129F37AC(a1, a2, (uint64_t *)(v2 - 128));
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return sub_212A04EF0();
}

uint64_t sub_2129F1DF8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_2129F1E1C()
{
  sub_2129F1DF8();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LinkAppConnectionPool()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for RRConstants()
{
  return &type metadata for RRConstants;
}

uint64_t sub_2129F1E6C()
{
  uint64_t v0;

  v0 = sub_212A04F38();
  __swift_allocate_value_buffer(v0, qword_254B5E878);
  *(_QWORD *)__swift_project_value_buffer(v0, (uint64_t)qword_254B5E878) = 1000;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 - 8) + 104))();
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

void sub_2129F1F10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16))
  {
    OUTLINED_FUNCTION_25_1(a1, a2);
    if ((v3 & 1) != 0)
      swift_bridgeObjectRetain();
  }
  OUTLINED_FUNCTION_39_0();
}

uint64_t sub_2129F1F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;

  if (!*(_QWORD *)(a3 + 16))
    return 0;
  v4 = OUTLINED_FUNCTION_25_1(a1, a2);
  if ((v5 & 1) == 0)
    return 0;
  v6 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

double sub_2129F1F98@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v4;
  unint64_t v6;
  char v7;
  double result;

  if (*(_QWORD *)(a3 + 16) && (v6 = OUTLINED_FUNCTION_25_1(a1, a2), (v7 & 1) != 0))
  {
    sub_2129EF568(*(_QWORD *)(v4 + 56) + 32 * v6, (uint64_t)a4);
  }
  else
  {
    result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

void sub_2129F1FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  id v6;

  if (*(_QWORD *)(a3 + 16))
  {
    v4 = OUTLINED_FUNCTION_25_1(a1, a2);
    if ((v5 & 1) != 0)
      v6 = *(id *)(*(_QWORD *)(v3 + 56) + 8 * v4);
  }
  OUTLINED_FUNCTION_39_0();
}

uint64_t sub_2129F2024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16) && (sub_2129F3ED0(a1, a2), (v3 & 1) != 0))
    return swift_retain();
  else
    return 0;
}

double sub_2129F2064@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  unint64_t v6;
  char v7;
  double result;

  if (*(_QWORD *)(a3 + 16) && (v6 = OUTLINED_FUNCTION_25_1(a1, a2), (v7 & 1) != 0))
  {
    sub_2129ED19C(*(_QWORD *)(v4 + 56) + 40 * v6, a4);
  }
  else
  {
    *(_QWORD *)(a4 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }
  return result;
}

uint64_t sub_2129F20B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5;
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_2129F3FB8(a1), (v6 & 1) != 0))
  {
    v7 = v5;
    v8 = *(_QWORD *)(a2 + 56);
    v9 = sub_212A0492C();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a3, v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v7, v9);
    v10 = a3;
    v11 = 0;
    v12 = v9;
  }
  else
  {
    v12 = sub_212A0492C();
    v10 = a3;
    v11 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v10, v11, 1, v12);
}

uint64_t sub_2129F2148()
{
  uint64_t v0;

  v0 = sub_212A04DA0();
  __swift_allocate_value_buffer(v0, qword_253EFF020);
  __swift_project_value_buffer(v0, (uint64_t)qword_253EFF020);
  type metadata accessor for RRResolver();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED98);
  sub_212A04FBC();
  return sub_212A04D94();
}

uint64_t sub_2129F21E0()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t Matcher;
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
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEF10);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212A05DD0;
  if (qword_253EFEE10 != -1)
    swift_once();
  v1 = unk_253EFEF90;
  *(_QWORD *)(inited + 32) = qword_253EFEF88;
  *(_QWORD *)(inited + 40) = v1;
  Matcher = type metadata accessor for PersonQueryMatcher();
  swift_bridgeObjectRetain();
  v3 = swift_initStaticObject();
  *(_QWORD *)(inited + 72) = Matcher;
  *(_QWORD *)(inited + 80) = &off_24CE70030;
  *(_QWORD *)(inited + 48) = v3;
  if (qword_253EFEE38 != -1)
    swift_once();
  v4 = unk_253EFEFC0;
  *(_QWORD *)(inited + 88) = qword_253EFEFB8;
  *(_QWORD *)(inited + 96) = v4;
  v5 = qword_253EFEE80;
  swift_bridgeObjectRetain();
  if (v5 != -1)
    swift_once();
  v6 = qword_253EFF000;
  *(_QWORD *)(inited + 128) = type metadata accessor for AttachmentQueryMatcher();
  *(_QWORD *)(inited + 136) = &off_24CE70040;
  *(_QWORD *)(inited + 104) = v6;
  v7 = qword_253EFEE28;
  swift_retain();
  if (v7 != -1)
    swift_once();
  v8 = unk_253EFEFB0;
  *(_QWORD *)(inited + 144) = qword_253EFEFA8;
  *(_QWORD *)(inited + 152) = v8;
  v9 = type metadata accessor for CalendarEventQueryMatcher();
  swift_bridgeObjectRetain();
  v10 = swift_initStaticObject();
  *(_QWORD *)(inited + 184) = v9;
  *(_QWORD *)(inited + 192) = &off_24CE70020;
  *(_QWORD *)(inited + 160) = v10;
  if (qword_253EFEE20 != -1)
    swift_once();
  v11 = unk_253EFEFA0;
  *(_QWORD *)(inited + 200) = qword_253EFEF98;
  *(_QWORD *)(inited + 208) = v11;
  v12 = type metadata accessor for ApplicationQueryMatcher();
  swift_bridgeObjectRetain();
  v13 = swift_initStaticObject();
  *(_QWORD *)(inited + 240) = v12;
  *(_QWORD *)(inited + 248) = &off_24CE70010;
  *(_QWORD *)(inited + 216) = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEDA0);
  result = sub_212A04F74();
  qword_253EFEDC0 = result;
  return result;
}

void static RREntityMatcher.entity(_:matches:entityFoundByMarrsIdentifier:)()
{
  int v0;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  int EnumTagSinglePayload;
  uint64_t v27;
  void (*v28)(char *);
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _UNKNOWN **v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  char v54;
  void *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v75;
  uint64_t v76;
  char v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  _QWORD v87[3];
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  uint64_t v97;
  _QWORD v98[3];
  uint64_t Matcher;
  _UNKNOWN **v100;

  OUTLINED_FUNCTION_36_1();
  v93 = v0;
  v94 = v1;
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED68);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_2();
  v89 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEED0);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_2_2();
  v88 = v7;
  sub_212A04D4C();
  OUTLINED_FUNCTION_30_1();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_212A04DA0();
  v95 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_51_0();
  v90 = v10;
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x24BDAC7A8](v11);
  v87[0] = (char *)v87 - v12;
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x24BDAC7A8](v13);
  v87[1] = (char *)v87 - v14;
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v87 - v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEEE0);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_51_0();
  v87[2] = v19;
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)v87 - v21;
  v23 = sub_212A04F2C();
  v92 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)v87 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_253EFEDB8 != -1)
    swift_once();
  if (byte_253EFF018 != 1 || !sub_2129F2DB0(v3, v94, v93 & 1))
  {
    sub_212A04E3C();
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v22, 1, v23);
    v91 = (void *)v9;
    if (EnumTagSinglePayload == 1)
    {
      sub_2129F36B0((uint64_t)v22, &qword_253EFEEE0);
    }
    else
    {
      v27 = (*(uint64_t (**)(char *, char *, uint64_t))(v92 + 32))(v25, v22, v23);
      if (qword_253EFEF48 != -1)
        v27 = swift_once();
      OUTLINED_FUNCTION_6_1(v27, (uint64_t)qword_253EFF020);
      v28(v17);
      v29 = sub_212A04D88();
      v30 = sub_212A05118();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = (uint8_t *)OUTLINED_FUNCTION_3_0();
        *(_WORD *)v31 = 0;
        OUTLINED_FUNCTION_17_2(&dword_2129E2000, v29, v30, "rrEntity.typedValue conversion", v31);
        OUTLINED_FUNCTION_0_0();
      }

      (*(void (**)(char *, uint64_t))(v95 + 8))(v17, v9);
      sub_212A04CF8();
      v32 = sub_212A0498C();
      swift_bridgeObjectRelease();
      if (v32)
      {
        v97 = v23;
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v96);
        (*(void (**)(uint64_t *, char *, uint64_t))(v92 + 16))(boxed_opaque_existential_1, v25, v23);
        sub_212A04D40();
        sub_212A04D28();
        sub_212A04D34();
        OUTLINED_FUNCTION_35_0();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v96);
        sub_2129ED080((uint64_t)v98, (uint64_t)&v96);
        if (v97)
        {
          sub_212A048A8();
          if ((swift_dynamicCast() & 1) != 0)
          {
            v95 = sub_212A0489C();
            OUTLINED_FUNCTION_21();
            v94 = sub_212A04E90();
            sub_212A04E54();
            sub_212A04E3C();
            v34 = sub_212A04E24();
            OUTLINED_FUNCTION_57(v88, v35, v36, v34);
            sub_212A04EB4();
            v37 = sub_212A04854();
            OUTLINED_FUNCTION_57(v89, v38, v39, v37);
            sub_212A04EFC();
            sub_212A04F74();
            v40 = objc_allocWithZone((Class)sub_212A04EF0());
            sub_212A04E78();
            sub_2129F36B0((uint64_t)v98, (uint64_t *)&unk_253EFEF38);
            OUTLINED_FUNCTION_21_1();
            goto LABEL_73;
          }
        }
        else
        {
          sub_2129F36B0((uint64_t)&v96, (uint64_t *)&unk_253EFEF38);
        }
        sub_2129F36B0((uint64_t)v98, (uint64_t *)&unk_253EFEF38);
      }
      OUTLINED_FUNCTION_21_1();
    }
    if (qword_253EFEDD0 != -1)
      swift_once();
    v41 = qword_253EFEDC0;
    v42 = OUTLINED_FUNCTION_49_1();
    sub_2129F2064(v42, v43, v41, (uint64_t)&v96);
    swift_bridgeObjectRelease();
    if (v97)
    {
      sub_2129ED068(&v96, (uint64_t)v98);
    }
    else
    {
      if (qword_253EFEDE0 != -1)
        swift_once();
      v44 = qword_253EFEF70;
      Matcher = type metadata accessor for BaseQueryMatcher();
      v100 = &off_24CE70050;
      v98[0] = v44;
      swift_retain();
      sub_2129F36B0((uint64_t)&v96, (uint64_t *)&unk_253EFEDA8);
    }
    v45 = Matcher;
    v46 = v100;
    __swift_project_boxed_opaque_existential_1(v98, Matcher);
    sub_212A04E00();
    swift_allocObject();
    swift_retain();
    v47 = sub_212A04DDC();
    v48 = OUTLINED_FUNCTION_54_0();
    LOBYTE(v45) = ((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, _UNKNOWN **))v46[1])(v47, v48, v93 & 1, v45, v46);
    swift_release();
    v49 = swift_release();
    if ((v45 & 1) != 0)
    {
      OUTLINED_FUNCTION_49_1();
      v51 = v50;
      if (qword_253EFEE10 != -1)
        swift_once();
      OUTLINED_FUNCTION_56_0();
      v53 = v53 && v51 == v52;
      if (v53)
      {
        OUTLINED_FUNCTION_2();
      }
      else
      {
        v54 = OUTLINED_FUNCTION_7_2();
        OUTLINED_FUNCTION_2();
        if ((v54 & 1) == 0)
          goto LABEL_51;
      }
      OUTLINED_FUNCTION_54_0();
      OUTLINED_FUNCTION_41_1();
      OUTLINED_FUNCTION_28_1();
      OUTLINED_FUNCTION_56_0();
      if (v53 && v51 == v61)
      {
        OUTLINED_FUNCTION_2();
      }
      else
      {
        v63 = OUTLINED_FUNCTION_7_2();
        v64 = OUTLINED_FUNCTION_2();
        if ((v63 & 1) == 0)
        {
          if (qword_253EFEF48 != -1)
            v64 = swift_once();
          v65 = v91;
          OUTLINED_FUNCTION_6_1(v64, (uint64_t)qword_253EFF020);
          OUTLINED_FUNCTION_22_1(v66, v67);
          OUTLINED_FUNCTION_58();
          v68 = OUTLINED_FUNCTION_40_1();
          if (OUTLINED_FUNCTION_2_0(v68))
          {
            *(_WORD *)OUTLINED_FUNCTION_3_0() = 0;
            OUTLINED_FUNCTION_4_0(&dword_2129E2000, v69, v70, "convertRREntityToPersonAnnotatedEntity conversion");
            OUTLINED_FUNCTION_0_0();
          }

          OUTLINED_FUNCTION_9_2();
          static RREntityMatcher.convertRREntityToPersonAnnotatedEntity(rrEntity:)();
          goto LABEL_70;
        }
      }
LABEL_51:
      OUTLINED_FUNCTION_49_1();
      v72 = v71;
      if (qword_253EFEE28 != -1)
        swift_once();
      OUTLINED_FUNCTION_56_0();
      if (v53 && v72 == v73)
      {
        OUTLINED_FUNCTION_2();
      }
      else
      {
        v75 = OUTLINED_FUNCTION_7_2();
        OUTLINED_FUNCTION_2();
        if ((v75 & 1) == 0)
          goto LABEL_72;
      }
      OUTLINED_FUNCTION_54_0();
      OUTLINED_FUNCTION_41_1();
      OUTLINED_FUNCTION_28_1();
      OUTLINED_FUNCTION_56_0();
      if (v53 && v72 == v76)
      {
        OUTLINED_FUNCTION_2();
      }
      else
      {
        v78 = OUTLINED_FUNCTION_7_2();
        v79 = OUTLINED_FUNCTION_2();
        if ((v78 & 1) == 0)
        {
          if (qword_253EFEF48 != -1)
            v79 = swift_once();
          v80 = v91;
          OUTLINED_FUNCTION_6_1(v79, (uint64_t)qword_253EFF020);
          OUTLINED_FUNCTION_22_1(v81, v82);
          OUTLINED_FUNCTION_58();
          v83 = OUTLINED_FUNCTION_40_1();
          if (OUTLINED_FUNCTION_2_0(v83))
          {
            *(_WORD *)OUTLINED_FUNCTION_3_0() = 0;
            OUTLINED_FUNCTION_4_0(&dword_2129E2000, v84, v85, "convertRREntityToCalendarEventAnnotatedEntity conversion");
            OUTLINED_FUNCTION_0_0();
          }

          OUTLINED_FUNCTION_9_2();
          static RREntityMatcher.convertRREntityToCalendarEventAnnotatedEntity(rrEntity:)();
LABEL_70:
          OUTLINED_FUNCTION_50_0();
          goto LABEL_73;
        }
      }
LABEL_72:
      OUTLINED_FUNCTION_50_0();
      v86 = v3;
      goto LABEL_73;
    }
    if (qword_253EFEF48 != -1)
      v49 = swift_once();
    v55 = v91;
    OUTLINED_FUNCTION_6_1(v49, (uint64_t)qword_253EFF020);
    OUTLINED_FUNCTION_22_1(v56, v57);
    OUTLINED_FUNCTION_58();
    v58 = OUTLINED_FUNCTION_40_1();
    if (OUTLINED_FUNCTION_2_0(v58))
    {
      *(_WORD *)OUTLINED_FUNCTION_3_0() = 0;
      OUTLINED_FUNCTION_4_0(&dword_2129E2000, v59, v60, "queryMatcher.match returned nil");
      OUTLINED_FUNCTION_0_0();
    }

    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_50_0();
  }
LABEL_73:
  OUTLINED_FUNCTION_2_3();
}

void *sub_2129F2DB0(void *a1, uint64_t a2, char a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (qword_254B5DE58 != -1)
    swift_once();
  swift_retain();
  v6 = sub_2129E9DA8(a1, a2, a3 & 1);
  swift_release();
  if (!v6)
  {
    if (qword_254B5DE40 != -1)
      swift_once();
    swift_beginAccess();
    v7 = qword_254B5E868;
    if (qword_254B5E868)
    {
      v8 = sub_212A04CF8();
      v10 = sub_2129F2024(v8, v9, v7);
      swift_endAccess();
      swift_bridgeObjectRelease();
      if (v10)
      {
        swift_retain();
        v6 = sub_2129E9DA8(a1, v10, 0);
        swift_release();
        swift_release();
        return v6;
      }
    }
    else
    {
      swift_endAccess();
    }
    return 0;
  }
  return v6;
}

void static RREntityMatcher.convertRREntityToPersonAnnotatedEntity(rrEntity:)()
{
  os_log_type_t v0;
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
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27[3];
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;

  OUTLINED_FUNCTION_36_1();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED68);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_20_1(v4, v27[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEED0);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_30_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_18_2(v8, v27[0]);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v27 - v10;
  if (qword_253EFEF48 != -1)
    swift_once();
  __swift_project_value_buffer(v6, (uint64_t)qword_253EFF020);
  OUTLINED_FUNCTION_13_3((uint64_t)v11);
  v12 = sub_212A04D88();
  v13 = sub_212A0510C();
  if (OUTLINED_FUNCTION_29_1(v13))
  {
    v14 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    *(_WORD *)v14 = 0;
    OUTLINED_FUNCTION_17_2(&dword_2129E2000, v12, v0, "common_Person query matched with a basic contact address RREntity. Converting matched RREntity to common_Person", v14);
    OUTLINED_FUNCTION_0_0();
  }

  OUTLINED_FUNCTION_23_1();
  if (qword_254B5DE60 != -1)
    swift_once();
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E548);
  __swift_project_value_buffer(v15, (uint64_t)qword_254B5E890);
  OUTLINED_FUNCTION_31_1();
  v16 = OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_14_1(v16);
  if (v12)
  {
    swift_release();
    OUTLINED_FUNCTION_15_0();
    v17 = v28;
    OUTLINED_FUNCTION_13_3(v28);
    v29 = v2;
    v18 = sub_212A04D88();
    v19 = sub_212A05124();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)OUTLINED_FUNCTION_3_0();
      v31 = OUTLINED_FUNCTION_3_0();
      *(_DWORD *)v20 = 136315138;
      v27[1] = (uint64_t)(v20 + 4);
      sub_212A04E30();
      v21 = sub_212A04CD4();
      v23 = v22;
      OUTLINED_FUNCTION_21();
      v30 = sub_2129F37AC(v21, v23, &v31);
      sub_212A05160();
      OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_11_3();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2129E2000, v18, v19, "Failed to transform the matched entity %s into common_Person. Returning orignal matched entity", v20, 0xCu);
      OUTLINED_FUNCTION_31_0();
      OUTLINED_FUNCTION_0_0();
    }
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_11_3();

    OUTLINED_FUNCTION_53_0(v17);
    OUTLINED_FUNCTION_5_3(v29);
  }
  else
  {
    swift_release();
    OUTLINED_FUNCTION_15_0();
    v24 = OUTLINED_FUNCTION_45_1();
    OUTLINED_FUNCTION_44_1(v24);
    OUTLINED_FUNCTION_34_0();
    sub_212A0489C();
    OUTLINED_FUNCTION_46_1();
    OUTLINED_FUNCTION_42_1();
    sub_212A04EE4();
    sub_212A04EB4();
    v25 = OUTLINED_FUNCTION_39_1();
    OUTLINED_FUNCTION_26_1(v25);
    v26 = objc_allocWithZone((Class)OUTLINED_FUNCTION_38_1());
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_33_1();
    OUTLINED_FUNCTION_2_3();
  }
}

void static RREntityMatcher.convertRREntityToCalendarEventAnnotatedEntity(rrEntity:)()
{
  os_log_type_t v0;
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
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;

  OUTLINED_FUNCTION_36_1();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED68);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_20_1(v4, v30);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEED0);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_30_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_18_2(v8, v30);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v30 - v10;
  if (qword_253EFEF48 != -1)
    swift_once();
  __swift_project_value_buffer(v6, (uint64_t)qword_253EFF020);
  OUTLINED_FUNCTION_13_3((uint64_t)v11);
  v12 = sub_212A04D88();
  v13 = sub_212A0510C();
  if (OUTLINED_FUNCTION_29_1(v13))
  {
    v14 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    *(_WORD *)v14 = 0;
    OUTLINED_FUNCTION_17_2(&dword_2129E2000, v12, v0, "common_CalendarEvent query matched with DateTimeRange entity. Converting matched RREntity to common_CalendarEvent", v14);
    OUTLINED_FUNCTION_0_0();
  }

  OUTLINED_FUNCTION_23_1();
  if (qword_254B5DE80 != -1)
    swift_once();
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E550);
  __swift_project_value_buffer(v15, (uint64_t)qword_254B5E8C0);
  OUTLINED_FUNCTION_31_1();
  v16 = OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_14_1(v16);
  if (v12)
  {
    swift_release();
    OUTLINED_FUNCTION_15_0();
    v17 = v32;
    OUTLINED_FUNCTION_13_3(v32);
    v18 = v2;
    OUTLINED_FUNCTION_47_1();
    v33 = v18;
    OUTLINED_FUNCTION_47_1();
    v19 = sub_212A04D88();
    v20 = sub_212A05124();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = OUTLINED_FUNCTION_3_0();
      v22 = (_QWORD *)OUTLINED_FUNCTION_3_0();
      v31 = OUTLINED_FUNCTION_3_0();
      v35 = v31;
      *(_DWORD *)v21 = 136315394;
      sub_212A04E30();
      v23 = sub_212A04CD4();
      v25 = v24;
      OUTLINED_FUNCTION_21();
      v34 = sub_2129F37AC(v23, v25, &v35);
      sub_212A05160();
      OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_11_3();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2112;
      OUTLINED_FUNCTION_47_1();
      v26 = _swift_stdlib_bridgeErrorToNSError();
      v34 = v26;
      sub_212A05160();
      *v22 = v26;
      OUTLINED_FUNCTION_8_2();
      OUTLINED_FUNCTION_8_2();
      _os_log_impl(&dword_2129E2000, v19, v20, "Failed to transform the matched entity %s into common_CalendarEvent, with error: %@ Returning original matched entity", (uint8_t *)v21, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E558);
      OUTLINED_FUNCTION_31_0();
      OUTLINED_FUNCTION_0_0();
    }

    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_53_0(v17);
    OUTLINED_FUNCTION_5_3(v33);
  }
  else
  {
    swift_release();
    OUTLINED_FUNCTION_15_0();
    v27 = OUTLINED_FUNCTION_45_1();
    OUTLINED_FUNCTION_44_1(v27);
    OUTLINED_FUNCTION_34_0();
    sub_212A0489C();
    OUTLINED_FUNCTION_46_1();
    OUTLINED_FUNCTION_42_1();
    sub_212A04EE4();
    sub_212A04EB4();
    v28 = OUTLINED_FUNCTION_39_1();
    OUTLINED_FUNCTION_26_1(v28);
    v29 = objc_allocWithZone((Class)OUTLINED_FUNCTION_38_1());
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_33_1();
    OUTLINED_FUNCTION_2_3();
  }
}

uint64_t static RREntityMatcher.entity(_:matches:lastProposedEntityType:)(uint64_t a1, uint64_t a2)
{
  if (qword_253EFEDE0 != -1)
    swift_once();
  return sub_2129E4360(a2, a1, 0) & 1;
}

uint64_t sub_2129F3658()
{
  if (qword_254B5DE30 != -1)
    swift_once();
  qword_254B5E540 = qword_254B5E860;
  return swift_retain();
}

uint64_t sub_2129F36A0(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

void sub_2129F36B0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_39_0();
}

uint64_t sub_2129F36E8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2129F371C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2129F373C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_2129F37AC(v6, v7, a3);
  v8 = *a1 + 8;
  sub_212A05160();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2129F37AC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_2129F387C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2129EF568((uint64_t)v12, *a3);
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
      sub_2129EF568((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_2129F387C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_2129F39D0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_212A0516C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_2129F3A94(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_212A051FC();
    if (!v8)
    {
      result = sub_212A05244();
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

void *sub_2129F39D0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_212A0525C();
  __break(1u);
  return result;
}

uint64_t sub_2129F3A94(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2129F3B28(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_2129F3C98(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_2129F3C98((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2129F3B28(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_212A05028();
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
  v3 = sub_2129EEC18(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_212A051D8();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_212A0525C();
  __break(1u);
LABEL_14:
  result = sub_212A05244();
  __break(1u);
  return result;
}

char *sub_2129F3C98(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEF28);
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
    sub_2129F3E30(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2129F3D6C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2129F3D6C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_212A0525C();
  __break(1u);
  return result;
}

char *sub_2129F3E30(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_212A0525C();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

_BYTE **sub_2129F3EB0(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

ValueMetadata *type metadata accessor for RREntityMatcher()
{
  return &type metadata for RREntityMatcher;
}

unint64_t sub_2129F3ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  OUTLINED_FUNCTION_43_1();
  OUTLINED_FUNCTION_37_1();
  v4 = sub_212A05334();
  return sub_2129F401C(a1, a2, v4);
}

unint64_t sub_2129F3F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  OUTLINED_FUNCTION_43_1();
  swift_bridgeObjectRetain();
  sub_212A04F8C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_37_1();
  swift_bridgeObjectRelease();
  v8 = sub_212A05334();
  return sub_2129F40FC(a1, a2, a3, a4, v8);
}

unint64_t sub_2129F3FB8(uint64_t a1)
{
  uint64_t v2;

  sub_212A04DD0();
  sub_2129F432C(&qword_253EFEEB8, MEMORY[0x24BEA55C8]);
  v2 = sub_212A04F80();
  return sub_2129F41F4(a1, v2);
}

unint64_t sub_2129F401C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_212A052B0() & 1) == 0)
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
      while (!v14 && (sub_212A052B0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2129F40FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  BOOL v19;

  v6 = v5 + 64;
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = a5 & ~v7;
  if (((*(_QWORD *)(v5 + 64 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
  {
    v13 = ~v7;
    v14 = *(_QWORD *)(v5 + 48);
    do
    {
      v15 = (_QWORD *)(v14 + 32 * v8);
      v16 = v15[2];
      v17 = v15[3];
      v18 = *v15 == a1 && v15[1] == a2;
      if (v18 || (sub_212A052B0() & 1) != 0)
      {
        v19 = v16 == a3 && v17 == a4;
        if (v19 || (sub_212A052B0() & 1) != 0)
          break;
      }
      v8 = (v8 + 1) & v13;
    }
    while (((*(_QWORD *)(v6 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  return v8;
}

unint64_t sub_2129F41F4(uint64_t a1, uint64_t a2)
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
  v5 = sub_212A04DD0();
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
      sub_2129F432C(&qword_254B5E0C0, MEMORY[0x24BEA55D0]);
      v14 = sub_212A04F98();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

void sub_2129F432C(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = sub_212A04DD0();
    atomic_store(MEMORY[0x212BF73E4](a2, v4), a1);
  }
  OUTLINED_FUNCTION_39_0();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return sub_212A04E84();
}

id OUTLINED_FUNCTION_5_3(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_6_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_project_value_buffer(v2, a2);
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return sub_212A052B0();
}

void OUTLINED_FUNCTION_8_2()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_9_2()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 208) + 8))(v0, *(_QWORD *)(v1 - 240));
}

void OUTLINED_FUNCTION_11_3()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_13_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v3, v1);
}

uint64_t OUTLINED_FUNCTION_14_1(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = a1;
  return v1(v2 - 104);
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return sub_212A04DA0();
}

void OUTLINED_FUNCTION_17_2(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

void OUTLINED_FUNCTION_18_2(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_20_1(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 232) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_22_1@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v3, a1, v2);
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
  *(_QWORD *)(v3 - 144) = v4;
  return v4(v1, v0);
}

unint64_t OUTLINED_FUNCTION_25_1(uint64_t a1, uint64_t a2)
{
  return sub_2129F3ED0(a1, a2);
}

uint64_t OUTLINED_FUNCTION_26_1(uint64_t a1)
{
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(*(_QWORD *)(v1 - 128), 1, 1, a1);
  return sub_212A04E48();
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return sub_212A04E30();
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  return swift_release();
}

BOOL OUTLINED_FUNCTION_29_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_31_1()
{
  return sub_212A04D1C();
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_37_1()
{
  return sub_212A04F8C();
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  return sub_212A04EF0();
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return sub_212A04854();
}

uint64_t OUTLINED_FUNCTION_40_1()
{
  return sub_212A05118();
}

uint64_t OUTLINED_FUNCTION_41_1()
{
  return sub_212A04CF8();
}

uint64_t OUTLINED_FUNCTION_42_1()
{
  return sub_212A04EA8();
}

uint64_t OUTLINED_FUNCTION_43_1()
{
  return sub_212A0531C();
}

uint64_t OUTLINED_FUNCTION_44_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = a1;
  return sub_212A04E54();
}

uint64_t OUTLINED_FUNCTION_45_1()
{
  return sub_212A04E90();
}

uint64_t OUTLINED_FUNCTION_46_1()
{
  return swift_release();
}

id OUTLINED_FUNCTION_47_1()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_49_1()
{
  return sub_212A04CF8();
}

uint64_t OUTLINED_FUNCTION_50_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1Tm(v0 - 144);
}

uint64_t OUTLINED_FUNCTION_53_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 144))(a1, v1);
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return sub_212A04E30();
}

uint64_t OUTLINED_FUNCTION_57(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_58()
{
  return sub_212A04D88();
}

uint64_t sub_2129F46B0()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E548);
  __swift_allocate_value_buffer(v0, qword_254B5E890);
  __swift_project_value_buffer(v0, (uint64_t)qword_254B5E890);
  sub_212A04D04();
  sub_212A04944();
  return sub_212A04D10();
}

uint64_t sub_2129F4728@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
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
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, unint64_t, uint64_t);
  uint64_t v22;
  unint64_t *v23;
  unint64_t *v24;
  unint64_t v25;
  const char *v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t result;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;

  v42 = a1;
  v2 = sub_212A0492C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v41 - v7;
  sub_212A04A94();
  swift_allocObject();
  v9 = sub_212A04A88();
  v10 = sub_212A04CF8();
  v12 = v11;
  if (qword_253EFEE48 != -1)
    swift_once();
  v13 = qword_253EFEFC8 == v10 && unk_253EFEFD0 == v12;
  v44 = v6;
  if (!v13 && (sub_212A052B0() & 1) == 0)
  {
    if (qword_253EFEE50 != -1)
      swift_once();
    v27 = qword_253EFEFD8 == v10 && unk_253EFEFE0 == v12;
    if (v27 || (sub_212A052B0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      sub_212A04A28();
      sub_212A04998();
      if (v45)
      {
        v43 = v1;
        sub_212A04BE4();
        swift_allocObject();
        sub_212A04BD8();
        sub_212A049BC();
        if (v28)
        {
          sub_212A04B54();
          swift_bridgeObjectRelease();
        }
        sub_212A049C8();
        if (v29)
        {
          sub_212A04B9C();
          swift_bridgeObjectRelease();
        }
        goto LABEL_13;
      }
      v22 = sub_212A04D58();
      sub_2129F4E94();
      swift_allocError();
      v24 = v23;
      v25 = 0xD000000000000032;
      v26 = "failed to convert to UsoEntity_common_EmailAddress";
    }
    else
    {
      if (qword_253EFEE58 != -1)
        swift_once();
      v43 = v1;
      if (qword_253EFEFE8 == v10 && *(_QWORD *)algn_253EFEFF0 == v12)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v38 = sub_212A052B0();
        swift_bridgeObjectRelease();
        if ((v38 & 1) == 0)
        {
          v22 = sub_212A04D58();
          sub_2129F4E94();
          swift_allocError();
          v24 = v23;
          v25 = 0xD000000000000023;
          v26 = "transformer called for invalid type";
          goto LABEL_55;
        }
      }
      sub_212A04AE8();
      sub_212A04998();
      if (v45)
      {
        sub_212A04C8C();
        swift_allocObject();
        sub_212A04C80();
        sub_212A04AD0();
        if (v39)
        {
          sub_212A04C68();
          swift_bridgeObjectRelease();
        }
        sub_212A04ADC();
        if (v40)
        {
          sub_212A049E0();
          swift_bridgeObjectRelease();
        }
        goto LABEL_13;
      }
      v22 = sub_212A04D58();
      sub_2129F4E94();
      swift_allocError();
      v24 = v23;
      v25 = 0xD000000000000033;
      v26 = "failed to convert to UsoEntity_common_PostalAddress";
    }
LABEL_55:
    *v23 = v25;
    v23[1] = (unint64_t)(v26 - 32) | 0x8000000000000000;
    (*(void (**)(unint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v24, *MEMORY[0x24BEA8DC0], v22);
    swift_willThrow();
    return swift_release();
  }
  swift_bridgeObjectRelease();
  sub_212A049D4();
  sub_212A04998();
  if (!v45)
  {
    v22 = sub_212A04D58();
    sub_2129F4E94();
    swift_allocError();
    v24 = v23;
    v25 = 0xD000000000000031;
    v26 = "failed to convert to UsoEntity_common_PhoneNumber";
    goto LABEL_55;
  }
  v43 = v1;
  sub_212A04BB4();
  swift_allocObject();
  sub_212A04BA8();
  sub_212A049BC();
  if (v14)
  {
    sub_212A04B54();
    swift_bridgeObjectRelease();
  }
  sub_212A049C8();
  if (v15)
  {
    sub_212A04B9C();
    swift_bridgeObjectRelease();
  }
LABEL_13:
  swift_retain();
  sub_212A04A64();
  swift_release();
  swift_release_n();
  v16 = sub_212A04CEC();
  v17 = *(_QWORD *)(v16 + 16);
  if (v17)
  {
    v18 = v16 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v19 = *(_QWORD *)(v3 + 72);
    v20 = v9;
    v21 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
    do
    {
      v21(v8, v18, v2);
      sub_212A04890();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      v18 += v19;
      --v17;
    }
    while (v17);
    swift_bridgeObjectRelease();
    v9 = v20;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v30 = v44;
  sub_212A04908();
  sub_212A04890();
  if (MEMORY[0x212BF66C4](v9))
  {
    sub_212A04944();
    sub_212A04998();
    v31 = v45;
    if (v45)
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v30, v2);
      swift_release();
      result = swift_release();
      *v42 = v31;
      return result;
    }
    v35 = sub_212A04D58();
    sub_2129F4E94();
    swift_allocError();
    *v36 = 0xD00000000000002ALL;
    v36[1] = 0x8000000212A07030;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v35 - 8) + 104))(v36, *MEMORY[0x24BEA8DC0], v35);
    swift_willThrow();
    swift_release();
  }
  else
  {
    v33 = sub_212A04D58();
    sub_2129F4E94();
    swift_allocError();
    *v34 = 0xD00000000000002DLL;
    v34[1] = 0x8000000212A07000;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v34, *MEMORY[0x24BEA8DC0], v33);
    swift_willThrow();
  }
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v30, v2);
}

unint64_t sub_2129F4E94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254B5E560;
  if (!qword_254B5E560)
  {
    v1 = sub_212A04D58();
    result = MEMORY[0x212BF73E4](MEMORY[0x24BEA8DD0], v1);
    atomic_store(result, (unint64_t *)&qword_254B5E560);
  }
  return result;
}

uint64_t sub_2129F4ED4()
{
  return 0x65747265766E6F63;
}

void sub_2129F4EF0()
{
  sub_212A04BB4();
  OUTLINED_FUNCTION_51();
  sub_212A04BA8();
  OUTLINED_FUNCTION_4_2();
}

void sub_2129F4F18()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_1_2();
  if (v2)
  {
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_28_1();
  }
  else
  {
    v0 = 0x8000000212A06890;
    v1 = 0xD000000000000012;
  }
  qword_253EFEFC8 = v1;
  unk_253EFEFD0 = v0;
  OUTLINED_FUNCTION_22();
}

void sub_2129F4F58()
{
  sub_212A04BE4();
  OUTLINED_FUNCTION_51();
  sub_212A04BD8();
  OUTLINED_FUNCTION_4_2();
}

void sub_2129F4F80()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_1_2();
  if (v2)
  {
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_28_1();
  }
  else
  {
    v0 = 0x8000000212A068B0;
    v1 = 0xD000000000000013;
  }
  qword_253EFEFD8 = v1;
  unk_253EFEFE0 = v0;
  OUTLINED_FUNCTION_22();
}

void sub_2129F4FC0()
{
  sub_212A04C8C();
  OUTLINED_FUNCTION_51();
  sub_212A04C80();
  OUTLINED_FUNCTION_4_2();
}

void sub_2129F4FE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_1_2();
  if (v2)
  {
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_28_1();
  }
  else
  {
    OUTLINED_FUNCTION_6_2();
  }
  qword_253EFEFE8 = v1;
  *(_QWORD *)algn_253EFEFF0 = v0;
  OUTLINED_FUNCTION_22();
}

void sub_2129F501C()
{
  sub_212A04A94();
  OUTLINED_FUNCTION_51();
  sub_212A04A88();
  OUTLINED_FUNCTION_4_2();
}

void sub_2129F5044()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_1_2();
  if (v2)
  {
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_28_1();
  }
  else
  {
    v0 = 0xED00006E6F737265;
    OUTLINED_FUNCTION_7_3();
    v1 = v1 & 0xFFFFFFFFFFFFLL | 0x505F000000000000;
  }
  qword_253EFEF88 = v1;
  unk_253EFEF90 = v0;
  OUTLINED_FUNCTION_22();
}

void sub_2129F5084()
{
  sub_212A04B84();
  OUTLINED_FUNCTION_51();
  sub_212A04B78();
  OUTLINED_FUNCTION_4_2();
}

void sub_2129F50AC()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_1_2();
  if (v2)
  {
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_28_1();
  }
  else
  {
    v0 = 0x8000000212A06B50;
    v1 = 0xD000000000000011;
  }
  qword_253EFEFB8 = v1;
  unk_253EFEFC0 = v0;
  OUTLINED_FUNCTION_22();
}

void sub_2129F50EC()
{
  sub_212A04C38();
  OUTLINED_FUNCTION_51();
  sub_212A04C2C();
  OUTLINED_FUNCTION_4_2();
}

void sub_2129F5114()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_1_2();
  if (v2)
  {
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_28_1();
  }
  else
  {
    OUTLINED_FUNCTION_6_2();
  }
  qword_254B5E8A8 = v1;
  unk_254B5E8B0 = v0;
  OUTLINED_FUNCTION_22();
}

void sub_2129F5148()
{
  sub_212A04C08();
  OUTLINED_FUNCTION_51();
  sub_212A04BFC();
  OUTLINED_FUNCTION_4_2();
}

void sub_2129F5170()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_1_2();
  if (v2)
  {
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_28_1();
  }
  else
  {
    OUTLINED_FUNCTION_6_2();
  }
  qword_253EFEFA8 = v1;
  unk_253EFEFB0 = v0;
  OUTLINED_FUNCTION_22();
}

void sub_2129F51A4()
{
  sub_212A049B0();
  OUTLINED_FUNCTION_51();
  sub_212A049A4();
  OUTLINED_FUNCTION_4_2();
}

void sub_2129F51CC()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_1_2();
  if (v2)
  {
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_28_1();
  }
  else
  {
    v0 = 0xEA00000000007070;
    OUTLINED_FUNCTION_7_3();
    v1 = v1 & 0xFFFFFFFFFFFFLL | 0x415F000000000000;
  }
  qword_253EFEF98 = v1;
  unk_253EFEFA0 = v0;
  OUTLINED_FUNCTION_22();
}

void sub_2129F5204()
{
  sub_212A04AAC();
  OUTLINED_FUNCTION_51();
  sub_212A04AA0();
  OUTLINED_FUNCTION_4_2();
}

void sub_2129F522C()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_1_2();
  if (v2)
  {
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_28_1();
  }
  else
  {
    v0 = 0xED0000776F646E69;
    OUTLINED_FUNCTION_7_3();
    v1 = v1 & 0xFFFFFFFFFFFFLL | 0x575F000000000000;
  }
  qword_253EFEF78 = v1;
  unk_253EFEF80 = v0;
  OUTLINED_FUNCTION_22();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_release();
}

void OUTLINED_FUNCTION_4_2()
{
  JUMPOUT(0x212BF66C4);
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return sub_212A04CF8();
}

uint64_t sub_2129F52AC(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v11 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_15;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_8_3();
  for (; v2; v2 = OUTLINED_FUNCTION_19_1())
  {
    v3 = 4;
    while (1)
    {
      v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x212BF6F58](v3 - 4, a1) : *(id *)(a1 + 8 * v3);
      v5 = v4;
      v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1))
        break;
      static RREntityMatcher.entity(_:matches:entityFoundByMarrsIdentifier:)();
      v8 = v7;

      if (v8)
      {
        MEMORY[0x212BF6E08]();
        if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_212A050D0();
        sub_212A050F4();
        sub_212A050C4();
      }
      ++v3;
      if (v6 == v2)
      {
        OUTLINED_FUNCTION_12();
        v9 = v11;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_15:
    OUTLINED_FUNCTION_8_3();
  }
  OUTLINED_FUNCTION_12();
  v9 = MEMORY[0x24BEE4AF8];
LABEL_17:
  swift_release();
  return v9;
}

uint64_t sub_2129F541C()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return sub_2129F5488(v0);
}

uint64_t sub_2129F5444()
{
  OUTLINED_FUNCTION_44_2();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2129F5488(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC21SiriReferenceResolver10RRResolver_entities);
  OUTLINED_FUNCTION_44_2();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2129F54D4())()
{
  OUTLINED_FUNCTION_44_2();
  return j__swift_endAccess;
}

void RRResolver.__allocating_init(entities:)(uint64_t a1)
{
  swift_allocObject();
  RRResolver.init(entities:)(a1);
  OUTLINED_FUNCTION_39_0();
}

uint64_t RRResolver.init(entities:)(uint64_t a1)
{
  uint64_t v1;

  type metadata accessor for RRResolver();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED98);
  sub_212A04FBC();
  sub_212A04D94();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC21SiriReferenceResolver10RRResolver_entities) = a1;
  return v1;
}

uint64_t type metadata accessor for RRResolver()
{
  uint64_t result;

  result = qword_253EFE8F8;
  if (!qword_253EFE8F8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_2129F561C(uint8_t *a1, unint64_t a2, os_log_type_t a3)
{
  NSObject *v3;
  uint64_t *v4;
  NSObject *v5;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  void *v20;
  double v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  NSObject *v33;
  unint64_t result;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37[3];

  v5 = v3;
  v9 = (uint64_t)v3 + OBJC_IVAR____TtC21SiriReferenceResolver10RRResolver_logger;
  OUTLINED_FUNCTION_57_0();
  v10 = sub_212A04D88();
  v11 = sub_212A05118();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    v37[0] = OUTLINED_FUNCTION_3_0();
    *(_DWORD *)v12 = 136315138;
    sub_212A04D04();
    swift_retain();
    v13 = sub_212A04FBC();
    sub_2129F37AC(v13, v14, v37);
    OUTLINED_FUNCTION_38_2();
    sub_212A05160();
    OUTLINED_FUNCTION_56_1();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2129E2000, v10, v11, "Find annotated entities with EntityUSO. %s", v12, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_56_1();

  v15 = v5;
  if (!sub_212A00ACC())
  {
    swift_retain();
    v15 = sub_212A04D88();
    a3 = sub_212A05118();
    if (!os_log_type_enabled(v15, a3))
    {
      OUTLINED_FUNCTION_28_2();

      return sub_212A00EE4(a1);
    }
    v9 = OUTLINED_FUNCTION_3_0();
    *(_DWORD *)v9 = 134217984;
    OUTLINED_FUNCTION_22_2();
    if (!((unint64_t)*v4 >> 62))
    {
LABEL_23:
      sub_212A05160();
      OUTLINED_FUNCTION_28_2();
      _os_log_impl(&dword_2129E2000, v15, a3, "total entity count in pool: %ld", (uint8_t *)v9, 0xCu);
      OUTLINED_FUNCTION_0_0();
    }
LABEL_51:
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_19_1();
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_22_2();
    v9 = *v4;
    v36 = MEMORY[0x24BEE4AF8];
    if ((unint64_t)*v4 >> 62)
    {
      OUTLINED_FUNCTION_8_3();
      v23 = OUTLINED_FUNCTION_19_1();
      if (v23)
        goto LABEL_26;
    }
    else
    {
      v23 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
      OUTLINED_FUNCTION_8_3();
      if (v23)
      {
LABEL_26:
        if (v23 < 1)
        {
LABEL_50:
          __break(1u);
          goto LABEL_51;
        }
        v24 = 0;
        while (1)
        {
          if ((v9 & 0xC000000000000001) != 0)
            v25 = (id)MEMORY[0x212BF6F58](v24, v9);
          else
            v25 = *(id *)(v9 + 8 * v24 + 32);
          v26 = v25;
          sub_212A04E30();
          v27 = sub_212A04CF8();
          v29 = v28;
          swift_release();
          if (v27 == 0xD000000000000010 && v29 == 0x8000000212A06580)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            v30 = sub_212A052B0();
            swift_bridgeObjectRelease();
            if ((v30 & 1) == 0)
            {

              goto LABEL_37;
            }
          }
          sub_212A05208();
          sub_212A05220();
          sub_212A0522C();
          sub_212A05214();
LABEL_37:
          if (v23 == ++v24)
          {
            OUTLINED_FUNCTION_12();
            v31 = v36;
            goto LABEL_43;
          }
        }
      }
    }
    OUTLINED_FUNCTION_12();
    v31 = MEMORY[0x24BEE4AF8];
LABEL_43:
    swift_retain();
    v32 = sub_2129F52AC(v31);
    goto LABEL_47;
  }
  if (a2 >> 62)
  {
    sub_2129F87B8((id)a2, 0);
    sub_2129F77E0(a2);
    v15 = v33;
  }
  else
  {
    v15 = (a2 & 0xFFFFFFFFFFFFFF8);
    sub_2129F87B8((id)a2, 0);
    OUTLINED_FUNCTION_36_2();
  }
  v37[0] = (uint64_t)v15;
  sub_2129F70C8(v37);
  if (!v4)
  {
    v16 = v37[0];
    v37[0] = MEMORY[0x24BEE4AF8];
    if (v16 < 0 || (v16 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      v17 = sub_212A05250();
      OUTLINED_FUNCTION_28_2();
      if (v17)
        goto LABEL_11;
    }
    else
    {
      v17 = *(_QWORD *)(v16 + 16);
      if (v17)
      {
LABEL_11:
        v35 = a2;
        if (v17 >= 1)
        {
          for (i = 0; i != v17; ++i)
          {
            if ((v16 & 0xC000000000000001) != 0)
              v19 = (id)MEMORY[0x212BF6F58](i, v16);
            else
              v19 = *(id *)(v16 + 8 * i + 32);
            v20 = v19;
            sub_212A04EB4();
            if (v21 >= 0.0025)
            {
              sub_212A05208();
              sub_212A05220();
              sub_212A0522C();
              sub_212A05214();
            }
            else
            {

            }
          }
          OUTLINED_FUNCTION_28_2();
          v22 = v37[0];
          a2 = v35;
          goto LABEL_46;
        }
        __break(1u);
        goto LABEL_50;
      }
    }
    OUTLINED_FUNCTION_28_2();
    v22 = MEMORY[0x24BEE4AF8];
LABEL_46:
    swift_retain();
    v32 = sub_2129F52AC(v22);
    sub_2129F8BB8((void *)a2, a3);
LABEL_47:
    swift_release();
    swift_release();
    return v32;
  }
  result = swift_release();
  __break(1u);
  return result;
}

void *sub_2129F5BFC(uint8_t *a1)
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
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint8_t *v16;
  unint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEED8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v36 = (uint64_t)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v35 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED90);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2129FB254((uint64_t)a1);
  if (v12 >> 62)
  {
    OUTLINED_FUNCTION_36_2();
    v13 = OUTLINED_FUNCTION_40_2();
    OUTLINED_FUNCTION_9();
  }
  else
  {
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v13)
    goto LABEL_6;
  sub_212A0486C();
  sub_212A04998();
  v14 = v37;
  swift_release();
  if (!v14)
    goto LABEL_6;
  OUTLINED_FUNCTION_36_2();
  v15 = sub_2129F561C(a1, v12, OS_LOG_TYPE_DEFAULT);
  OUTLINED_FUNCTION_9();
  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    v34 = OUTLINED_FUNCTION_40_2();
    OUTLINED_FUNCTION_26();
    if (v34)
      goto LABEL_9;
    goto LABEL_23;
  }
  if (!*(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_23:
    OUTLINED_FUNCTION_26();
LABEL_6:
    v15 = v12;
    goto LABEL_10;
  }
LABEL_9:
  OUTLINED_FUNCTION_9();
LABEL_10:
  OUTLINED_FUNCTION_31_2();
  v16 = (uint8_t *)swift_retain();
  v17 = sub_2129F561C(v16, 0, (os_log_type_t)0xFFu);
  swift_release();
  swift_release();
  if (sub_2129F6310((uint64_t)a1))
  {
    sub_212A04A34();
    v18 = sub_212A02818((uint64_t)v11);
    v20 = v19;
    sub_2129ED104((uint64_t)v11, &qword_253EFED90);
    if ((v20 & 1) != 0)
    {
      OUTLINED_FUNCTION_15();
      v22 = 0;
    }
    else
    {
      v21 = sub_212A04F08();
      v22 = 1;
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v21);
      v23 = v36;
      sub_2129F8C0C((uint64_t)v8, v36);
      OUTLINED_FUNCTION_31_2();
      sub_2129F87B8((id)v17, 0);
      sub_2129ED104((uint64_t)v8, &qword_253EFEED8);
      v24 = sub_212A02D6C(v17, v23, v2, v18);
      sub_2129ED104(v23, &qword_253EFEED8);
      OUTLINED_FUNCTION_15();
      swift_release();
      OUTLINED_FUNCTION_4_3((void *)v17);
      OUTLINED_FUNCTION_4_3((void *)v17);
      v17 = v24;
    }
  }
  else
  {
    v22 = 0;
  }
  v25 = sub_212A04D88();
  v26 = sub_212A0510C();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_2129E2000, v25, v26, "Sorting resolved candidates with saliency score", v27, 2u);
    OUTLINED_FUNCTION_0_0();
  }

  if (v17 >> 62)
  {
    v32 = OUTLINED_FUNCTION_36_2();
    sub_2129F77E0(v32);
    v28 = v33;
  }
  else
  {
    v28 = v17 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n();
  }
  v37 = v28;
  sub_2129F70C8((uint64_t *)&v37);
  OUTLINED_FUNCTION_4_3((void *)v17);
  v29 = (void *)v37;
  v30 = sub_2129F6158(v15, v37, 0, v22);
  sub_2129F87C4(v29, 0);
  OUTLINED_FUNCTION_26();
  sub_2129F87C4((id)v17, 0);
  return v30;
}

void *sub_2129F6158(unint64_t a1, unint64_t a2, char a3, char a4)
{
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;

  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_8_3();
    v10 = OUTLINED_FUNCTION_19_1();
    OUTLINED_FUNCTION_12();
    if (v10)
    {
LABEL_3:
      OUTLINED_FUNCTION_8_3();
      v8 = 0;
      v9 = (void *)a1;
      if ((a4 & 1) == 0)
        return v9;
      goto LABEL_7;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v8 = a3 & 1;
  sub_2129F87B8((id)a2, a3 & 1);
  v9 = (void *)a2;
  if ((a4 & 1) == 0)
    return v9;
LABEL_7:
  if ((a3 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E338);
    swift_willThrowTypedImpl();
    return v9;
  }
  if (!(a2 >> 62))
  {
    v11 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_46();
    if (v11)
      goto LABEL_11;
LABEL_16:
    OUTLINED_FUNCTION_4_3((void *)a2);
    return v9;
  }
  OUTLINED_FUNCTION_46();
  if (!OUTLINED_FUNCTION_60())
    goto LABEL_16;
LABEL_11:
  v12 = sub_2129F7140(a2, a1);
  OUTLINED_FUNCTION_4_3((void *)a2);
  if ((v12 & 1) != 0)
    return v9;
  v13 = sub_212A04D88();
  v14 = sub_212A0510C();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_2129E2000, v13, v14, "Resolver ordinal match results are diffrent from Marrs results. Returning ordinal match results", v15, 2u);
    OUTLINED_FUNCTION_0_0();
  }
  sub_2129F87C4(v9, v8);

  OUTLINED_FUNCTION_46();
  return (void *)a2;
}

uint64_t sub_2129F6310(uint64_t a1)
{
  uint64_t inited;
  unint64_t v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t i;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEF30);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212A05CD0;
  *(_QWORD *)(inited + 32) = a1;
  v36 = inited;
  sub_212A050C4();
  v3 = v36;
  if (v36 >> 62)
    goto LABEL_80;
  v4 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_31_2();
  if (!v4)
    goto LABEL_81;
  while (1)
  {
    v5 = MEMORY[0x24BEE4AF8];
LABEL_4:
    if (v3 >> 62)
    {
      OUTLINED_FUNCTION_8();
      v8 = OUTLINED_FUNCTION_33_2();
      result = OUTLINED_FUNCTION_0();
      if (!v8)
      {
        __break(1u);
        return result;
      }
      OUTLINED_FUNCTION_8();
      v10 = OUTLINED_FUNCTION_33_2();
      OUTLINED_FUNCTION_0();
      if (!v10)
        goto LABEL_76;
    }
    else if (!*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
      goto LABEL_79;
    }
    if ((v3 & 0xC000000000000001) != 0)
      OUTLINED_FUNCTION_35_1();
    if (!*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_77;
    v6 = *(_QWORD *)(v3 + 32);
    swift_retain();
    if (v3 >> 62)
    {
      OUTLINED_FUNCTION_8();
      v7 = OUTLINED_FUNCTION_19_1();
      OUTLINED_FUNCTION_0();
    }
    else
    {
      v7 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    if (!v7)
      goto LABEL_78;
    sub_2129F8954(0, 1);
    v11 = sub_212A04CE0();
    v3 = sub_2129F1F0C(0x507473694C6F7375, 0xEF6E6F697469736FLL, v11);
    swift_bridgeObjectRelease();
    if (!v3)
      goto LABEL_26;
    if (v3 >> 62)
    {
      OUTLINED_FUNCTION_8();
      v13 = OUTLINED_FUNCTION_19_1();
      OUTLINED_FUNCTION_0();
      if (!v13)
      {
LABEL_25:
        OUTLINED_FUNCTION_0();
        goto LABEL_26;
      }
    }
    else if (!*(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_25;
    }
    if ((v3 & 0xC000000000000001) != 0)
      OUTLINED_FUNCTION_35_1();
    if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
      break;
LABEL_79:
    __break(1u);
LABEL_80:
    OUTLINED_FUNCTION_31_2();
    OUTLINED_FUNCTION_8();
    v31 = OUTLINED_FUNCTION_19_1();
    OUTLINED_FUNCTION_0();
    if (!v31)
      goto LABEL_81;
  }
  swift_retain();
  OUTLINED_FUNCTION_0();
  v12 = sub_212A04CBC();
  OUTLINED_FUNCTION_15();
  if (v12)
  {
    sub_212A04A4C();
    swift_retain();
    sub_212A04998();
    OUTLINED_FUNCTION_27_0();
    v3 = v35;
    if (v35)
    {
LABEL_73:
      swift_release();
      swift_bridgeObjectRelease();
      return v3;
    }
  }
LABEL_26:
  v3 = v6;
  v14 = sub_212A04CE0();
  v15 = 0;
  v16 = *(_QWORD *)(v14 + 64);
  v32 = v14 + 64;
  v17 = 1 << *(_BYTE *)(v14 + 32);
  if (v17 < 64)
    v18 = ~(-1 << v17);
  else
    v18 = -1;
  v19 = v18 & v16;
  v33 = (unint64_t)(v17 + 63) >> 6;
  v34 = v14;
  if ((v18 & v16) != 0)
  {
LABEL_30:
    v20 = __clz(__rbit64(v19));
    v19 &= v19 - 1;
    v21 = v20 | (v15 << 6);
    goto LABEL_45;
  }
  while (2)
  {
    v22 = v15 + 1;
    if (__OFADD__(v15, 1))
      goto LABEL_72;
    if (v22 >= v33)
      goto LABEL_65;
    v23 = *(_QWORD *)(v32 + 8 * v22);
    ++v15;
    if (v23)
      goto LABEL_44;
    v15 = v22 + 1;
    if (v22 + 1 >= v33)
      goto LABEL_65;
    v23 = *(_QWORD *)(v32 + 8 * v15);
    if (v23)
      goto LABEL_44;
    v15 = v22 + 2;
    if (v22 + 2 >= v33)
      goto LABEL_65;
    v23 = *(_QWORD *)(v32 + 8 * v15);
    if (v23)
    {
LABEL_44:
      v19 = (v23 - 1) & v23;
      v21 = __clz(__rbit64(v23)) + (v15 << 6);
LABEL_45:
      v25 = *(_QWORD *)(*(_QWORD *)(v34 + 56) + 8 * v21);
      v35 = v5;
      if ((unint64_t)v25 >> 62)
      {
        if (v25 < 0)
          v3 = *(_QWORD *)(*(_QWORD *)(v34 + 56) + 8 * v21);
        else
          v3 = v25 & 0xFFFFFFFFFFFFFF8;
        OUTLINED_FUNCTION_48_1();
        v6 = OUTLINED_FUNCTION_40_2();
        if (v6)
          goto LABEL_47;
      }
      else
      {
        OUTLINED_FUNCTION_61();
        OUTLINED_FUNCTION_48_1();
        if (v6)
        {
LABEL_47:
          if (v6 < 1)
          {
            __break(1u);
LABEL_72:
            __break(1u);
            goto LABEL_73;
          }
          v26 = v5;
          for (i = 0; i != v6; ++i)
          {
            if ((v25 & 0xC000000000000001) != 0)
              MEMORY[0x212BF6F58](i, v25);
            else
              swift_retain();
            v28 = sub_212A04CBC();
            v29 = swift_release();
            if (v28)
            {
              MEMORY[0x212BF6E08](v29);
              if (*(_QWORD *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                sub_212A050D0();
              sub_212A050F4();
              sub_212A050C4();
            }
          }
          OUTLINED_FUNCTION_23();
          v6 = v35;
          v5 = v26;
          goto LABEL_63;
        }
      }
      OUTLINED_FUNCTION_23();
      v6 = v5;
LABEL_63:
      OUTLINED_FUNCTION_23();
      v3 = (unint64_t)&v36;
      sub_2129F6850(v6);
      if (v19)
        goto LABEL_30;
      continue;
    }
    break;
  }
  v24 = v22 + 3;
  if (v24 < v33)
  {
    v23 = *(_QWORD *)(v32 + 8 * v24);
    if (!v23)
    {
      while (1)
      {
        v15 = v24 + 1;
        if (__OFADD__(v24, 1))
          break;
        if (v15 >= v33)
          goto LABEL_65;
        v23 = *(_QWORD *)(v32 + 8 * v15);
        ++v24;
        if (v23)
          goto LABEL_44;
      }
      __break(1u);
      goto LABEL_75;
    }
    v15 = v24;
    goto LABEL_44;
  }
LABEL_65:
  swift_release();
  swift_release();
  v3 = v36;
  if (v36 >> 62)
  {
    OUTLINED_FUNCTION_8();
    v30 = OUTLINED_FUNCTION_33_2();
    OUTLINED_FUNCTION_0();
    if (v30)
      goto LABEL_4;
  }
  else if (*(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_4;
  }
LABEL_81:
  OUTLINED_FUNCTION_0();
  return 0;
}

uint64_t sub_2129F6850(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
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
    OUTLINED_FUNCTION_46();
    v4 = OUTLINED_FUNCTION_19_1();
    OUTLINED_FUNCTION_2();
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v5 = *v1;
  if (*v1 >> 62)
  {
    OUTLINED_FUNCTION_10_3();
    v2 = OUTLINED_FUNCTION_59();
    OUTLINED_FUNCTION_23();
  }
  else
  {
    OUTLINED_FUNCTION_61();
  }
  v6 = v2 + v4;
  if (__OFADD__(v2, v4))
  {
    __break(1u);
    goto LABEL_24;
  }
  v5 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v5;
  v2 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    v8 = v5 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_16;
    v2 = 1;
  }
  if (v5 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    OUTLINED_FUNCTION_12_3();
    v5 = MEMORY[0x212BF6F64](v2, v9, 1, v5);
    swift_bridgeObjectRelease();
    *v1 = v5;
    v8 = v5 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    result = sub_2129F84E0(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v4)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    OUTLINED_FUNCTION_12_3();
    v9 = OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_23();
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
    return sub_212A050C4();
  }
  __break(1u);
  return result;
}

void sub_2129F69CC()
{
  NSObject *v0;
  os_log_type_t v1;
  uint8_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint8_t *v5;
  void *v6;
  char v7;
  char v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  void *v22;
  double v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;

  OUTLINED_FUNCTION_57_0();
  v0 = OUTLINED_FUNCTION_47_2();
  v1 = sub_212A0510C();
  if (os_log_type_enabled(v0, v1))
  {
    v2 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    v33 = OUTLINED_FUNCTION_3_0();
    *(_DWORD *)v2 = 136315138;
    sub_212A04E00();
    sub_2129F87D0();
    v3 = sub_212A0528C();
    sub_2129F37AC(v3, v4, &v33);
    sub_212A05160();
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_20_0(&dword_2129E2000, v0, v1, "Resolver call with ResolveQuery: %s", v2);
    OUTLINED_FUNCTION_31_0();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_27_0();

  v5 = (uint8_t *)sub_212A04DE8();
  v6 = sub_2129F5BFC(v5);
  v8 = v7;
  OUTLINED_FUNCTION_15();
  if ((v8 & 1) == 0)
  {
    sub_2129F87B8(v6, 0);
    sub_2129F87B8(v6, 0);
    OUTLINED_FUNCTION_12_3();
    v9 = OUTLINED_FUNCTION_47_2();
    v10 = sub_212A05118();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)OUTLINED_FUNCTION_3_0();
      v33 = OUTLINED_FUNCTION_3_0();
      *(_DWORD *)v11 = 136315138;
      v12 = OUTLINED_FUNCTION_13_2();
      v13 = OUTLINED_FUNCTION_12_3();
      v14 = MEMORY[0x212BF6E2C](v13, v12);
      v16 = v15;
      OUTLINED_FUNCTION_4_3(v6);
      sub_2129F37AC(v14, v16, &v33);
      OUTLINED_FUNCTION_38_2();
      sub_212A05160();
      swift_bridgeObjectRelease();
      sub_2129F87C4(v6, 0);
      OUTLINED_FUNCTION_4_3(v6);
      OUTLINED_FUNCTION_20_0(&dword_2129E2000, v9, v10, "Resolved candicates BEFORE post-processing and thresholding: %s", v11);
      OUTLINED_FUNCTION_31_0();
      OUTLINED_FUNCTION_0_0();
    }

    sub_2129F87C4(v6, 0);
    OUTLINED_FUNCTION_4_3(v6);
    sub_2129EFF20((unint64_t)v6);
    v18 = v17;
    OUTLINED_FUNCTION_4_3(v6);
    v33 = MEMORY[0x24BEE4AF8];
    if (v18 >> 62)
    {
      OUTLINED_FUNCTION_8_3();
      v19 = OUTLINED_FUNCTION_33_2();
      OUTLINED_FUNCTION_12();
      if (v19)
        goto LABEL_8;
    }
    else
    {
      v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v19)
      {
LABEL_8:
        if (v19 < 1)
        {
          __break(1u);
          return;
        }
        for (i = 0; i != v19; ++i)
        {
          if ((v18 & 0xC000000000000001) != 0)
            v21 = (id)MEMORY[0x212BF6F58](i, v18);
          else
            v21 = *(id *)(v18 + 8 * i + 32);
          v22 = v21;
          sub_212A04EB4();
          if (v23 >= 0.0025)
          {
            sub_212A05208();
            sub_212A05220();
            sub_212A0522C();
            sub_212A05214();
          }
          else
          {

          }
        }
      }
    }
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_57_0();
    v24 = OUTLINED_FUNCTION_47_2();
    v25 = sub_212A05118();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = OUTLINED_FUNCTION_3_0();
      v27 = OUTLINED_FUNCTION_3_0();
      *(_DWORD *)v26 = 134218242;
      v33 = v27;
      sub_212A05160();
      *(_WORD *)(v26 + 12) = 2080;
      v28 = OUTLINED_FUNCTION_13_2();
      v29 = swift_retain();
      v30 = MEMORY[0x212BF6E2C](v29, v28);
      v32 = v31;
      swift_release();
      sub_2129F37AC(v30, v32, &v33);
      sub_212A05160();
      OUTLINED_FUNCTION_27_0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2129E2000, v24, v25, "Resolved candicates AFTER post-processing and thresholding (>=%f): %s", (uint8_t *)v26, 0x16u);
      OUTLINED_FUNCTION_31_0();
      OUTLINED_FUNCTION_0_0();
    }
    OUTLINED_FUNCTION_4_3(v6);
    OUTLINED_FUNCTION_27_0();

  }
}

uint64_t sub_2129F6F0C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v10;

  v2 = sub_212A04F20();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  if ((*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v5, v2) == *MEMORY[0x24BEA59D0])
  {
    OUTLINED_FUNCTION_50_1(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 96));
    sub_212A04E00();
    swift_allocObject();
    swift_retain();
    sub_212A04DDC();
    sub_2129F69CC();
    v7 = v6;
    OUTLINED_FUNCTION_15();
    swift_release();
  }
  else
  {
    OUTLINED_FUNCTION_50_1(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    sub_2129F8810();
    v7 = swift_allocError();
    *v8 = 0;
  }
  return v7;
}

void RRResolver.deinit()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_45_2();
  OUTLINED_FUNCTION_24_0(v0);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_39_0();
}

uint64_t RRResolver.__deallocating_deinit()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_45_2();
  OUTLINED_FUNCTION_24_0(v0);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2129F70C8(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_2129F8940();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_2129F78AC(v6);
  return sub_212A05214();
}

id sub_2129F7140(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id result;
  id v11;
  void *v12;
  char v13;
  char v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;

  v4 = (void *)((unint64_t)a1 >> 62);
  if ((unint64_t)a1 >> 62)
  {
LABEL_40:
    swift_bridgeObjectRetain();
    v5 = sub_212A05250();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_212A05250();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v5 != v6)
    goto LABEL_25;
  if (!v5)
    goto LABEL_24;
  v7 = a1 & 0xFFFFFFFFFFFFFF8;
  if (a1 < 0)
    v7 = a1;
  if (!v4)
    v7 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
  v8 = a2 & 0xFFFFFFFFFFFFFF8;
  v9 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0)
    v8 = a2;
  if ((unint64_t)a2 >> 62)
    v9 = v8;
  if (v7 == v9)
  {
LABEL_24:
    v14 = 1;
    return (id)(v14 & 1);
  }
  if (v5 < 0)
    goto LABEL_43;
  v20 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
LABEL_44:
    result = (id)MEMORY[0x212BF6F58](0, a1);
  else
    result = *(id *)(a1 + 32);
  v4 = result;
  if ((a2 & 0xC000000000000001) != 0)
  {
    v11 = (id)MEMORY[0x212BF6F58](0, a2);
LABEL_22:
    v12 = v11;
    sub_212A04EF0();
    v13 = sub_212A05148();

    if ((v13 & 1) != 0)
    {
      if (v5 != 1)
      {
        v15 = 5;
        while (1)
        {
          if (v15 - 4 >= v5)
          {
            __break(1u);
            goto LABEL_40;
          }
          if (v20)
            v16 = (id)MEMORY[0x212BF6F58](v15 - 4, a1);
          else
            v16 = *(id *)(a1 + 8 * v15);
          v4 = v16;
          if ((a2 & 0xC000000000000001) != 0)
          {
            v17 = (id)MEMORY[0x212BF6F58](v15 - 4, a2);
          }
          else
          {
            if ((unint64_t)(v15 - 4) >= *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
LABEL_43:
              __break(1u);
              goto LABEL_44;
            }
            v17 = *(id *)(a2 + 8 * v15);
          }
          v18 = v17;
          v14 = sub_212A05148();

          if ((v14 & 1) != 0)
          {
            v19 = 2 - v5 + v15++;
            if (v19 != 5)
              continue;
          }
          return (id)(v14 & 1);
        }
      }
      goto LABEL_24;
    }
LABEL_25:
    v14 = 0;
    return (id)(v14 & 1);
  }
  if (*(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v11 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

unint64_t sub_2129F7394(unint64_t result, char a2, uint64_t a3)
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

uint64_t sub_2129F73B8(uint64_t a1)
{
  uint64_t result;

  if (a1 < 0)
  {
    OUTLINED_FUNCTION_43_0();
    result = sub_212A05244();
    __break(1u);
  }
  else if (a1)
  {
    OUTLINED_FUNCTION_13_2();
    result = sub_212A050E8();
    *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10) = a1;
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

char *sub_2129F744C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_43_0();
    result = (char *)OUTLINED_FUNCTION_3_3();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_4(a3, result);
  }
  return result;
}

char *sub_2129F74AC(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_43_0();
    result = (char *)OUTLINED_FUNCTION_3_3();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_4(a3, result);
  }
  return result;
}

uint64_t sub_2129F7508(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_43_0();
    result = OUTLINED_FUNCTION_3_3();
    __break(1u);
  }
  else if (a3 < a1 || (result = OUTLINED_FUNCTION_28_0(), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    OUTLINED_FUNCTION_28_0();
    OUTLINED_FUNCTION_34_1();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_34_1();
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_2129F75D4(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_43_0();
    result = (char *)OUTLINED_FUNCTION_3_3();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_4(a3, result);
  }
  return result;
}

uint64_t sub_2129F762C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  BOOL v9;
  uint64_t result;

  if (a2 < 0
    || ((v5 = *(_QWORD *)(*(_QWORD *)(OUTLINED_FUNCTION_28_0() - 8) + 72) * a2, v6 = a3 + v5, v7 = a1 + v5, v6 > a1)
      ? (v8 = v7 >= a3, v9 = v7 == a3)
      : (v8 = 0, v9 = 0),
        !v9 && v8))
  {
    OUTLINED_FUNCTION_43_0();
    result = OUTLINED_FUNCTION_5_5();
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_51_1();
    return OUTLINED_FUNCTION_14_2();
  }
  return result;
}

uint64_t sub_2129F76E4(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD))
{
  unint64_t v4;
  BOOL v5;
  BOOL v6;
  uint64_t result;

  if (a2 < 0 || ((v4 = a1 + 8 * a2, a3 + 8 * a2 > a1) ? (v5 = v4 >= a3, v6 = v4 == a3) : (v5 = 0, v6 = 0), !v6 && v5))
  {
    OUTLINED_FUNCTION_43_0();
    result = OUTLINED_FUNCTION_5_5();
    __break(1u);
  }
  else
  {
    a4(0);
    OUTLINED_FUNCTION_51_1();
    return OUTLINED_FUNCTION_14_2();
  }
  return result;
}

uint64_t sub_2129F7794()
{
  return sub_212A05160();
}

uint64_t sub_2129F77B8@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

void sub_2129F77E0(unint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  size_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1 >> 62)
    goto LABEL_7;
  v1 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v1)
  {
    if (v1 > 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEF30);
      v2 = (_QWORD *)OUTLINED_FUNCTION_41_2();
      v3 = _swift_stdlib_malloc_size(v2);
      v2[2] = v1;
      v2[3] = (2 * ((uint64_t)(v3 - 32) / 8)) | 1;
    }
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_34_1();
    sub_2129F8348(v4, v5, v6);
    v8 = v7;
    swift_bridgeObjectRelease();
    if (v8 == v1)
      break;
    __break(1u);
LABEL_7:
    OUTLINED_FUNCTION_46();
    v1 = OUTLINED_FUNCTION_40_2();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_22();
}

void sub_2129F78AC(uint64_t *a1)
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
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  _QWORD *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  unint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  uint64_t v78;
  char v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  uint64_t *v98;
  _QWORD *v99;
  uint64_t v100;
  _QWORD *v101;
  _QWORD *v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  _QWORD *v106;
  _QWORD *v107;
  _QWORD *v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  unint64_t v115;
  uint64_t v116;
  _QWORD *v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;

  v2 = v1;
  v4 = a1[1];
  v5 = sub_212A05280();
  if (v5 >= v4)
  {
    if ((v4 & 0x8000000000000000) == 0)
    {
      if (v4)
        sub_2129F7F5C(0, v4, 1, a1);
      return;
    }
    goto LABEL_130;
  }
  v6 = v5;
  v7 = sub_2129F73B8(v4 / 2);
  v124 = v8;
  v127 = v7;
  v121 = v4;
  v119 = a1;
  if (v4 <= 0)
  {
LABEL_94:
    v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v53 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_95:
    v108 = v11;
    if (v53 < 2)
    {
LABEL_106:
      swift_bridgeObjectRelease();
      if (v4 >= -1)
        goto LABEL_107;
      goto LABEL_134;
    }
    v109 = *v119;
    while (1)
    {
      v110 = v53 - 2;
      if (v53 < 2)
        break;
      if (!v109)
        goto LABEL_138;
      v4 = v53 - 1;
      v111 = (uint64_t)v108;
      v112 = v108[2 * v110 + 4];
      v113 = v108[2 * v53 + 3];
      sub_2129F802C((char *)(v109 + 8 * v112), (char *)(v109 + 8 * v108[2 * v53 + 2]), v109 + 8 * v113, v124);
      if (v2)
        goto LABEL_92;
      if (v113 < v112)
        goto LABEL_125;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2129F8314(v111);
        v111 = v116;
      }
      if (v110 >= *(_QWORD *)(v111 + 16))
        goto LABEL_126;
      v114 = (_QWORD *)(v111 + 32 + 16 * v110);
      *v114 = v112;
      v114[1] = v113;
      v115 = *(_QWORD *)(v111 + 16);
      if (v53 > v115)
        goto LABEL_127;
      memmove((void *)(v111 + 32 + 16 * v4), (const void *)(v111 + 32 + 16 * v53), 16 * (v115 - v53));
      v108 = (_QWORD *)v111;
      *(_QWORD *)(v111 + 16) = v115 - 1;
      v53 = v115 - 1;
      v4 = v121;
      if (v115 <= 2)
        goto LABEL_106;
    }
LABEL_124:
    __break(1u);
LABEL_125:
    __break(1u);
LABEL_126:
    __break(1u);
LABEL_127:
    __break(1u);
LABEL_128:
    __break(1u);
LABEL_129:
    __break(1u);
LABEL_130:
    __break(1u);
LABEL_131:
    __break(1u);
LABEL_132:
    __break(1u);
LABEL_133:
    __break(1u);
LABEL_134:
    __break(1u);
LABEL_135:
    __break(1u);
LABEL_136:
    __break(1u);
LABEL_137:
    __break(1u);
LABEL_138:
    __break(1u);
    return;
  }
  v120 = v6;
  v9 = 0;
  v10 = *a1;
  v118 = *a1 - 8;
  v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v12 = v9++;
    v122 = v12;
    if (v9 < v4)
    {
      v13 = v11;
      v14 = v2;
      v15 = *(void **)(v10 + 8 * v12);
      v16 = *(id *)(v10 + 8 * v9);
      v17 = v15;
      OUTLINED_FUNCTION_23_2();
      v19 = v18;
      OUTLINED_FUNCTION_42_2();
      v21 = v20;

      v9 = v12 + 2;
      if (v12 + 2 < v4)
      {
        v22 = v12;
        while (1)
        {
          v23 = v10 + 8 * v22;
          v24 = *(void **)(v23 + 8);
          v25 = *(id *)(v23 + 16);
          v26 = v24;
          OUTLINED_FUNCTION_23_2();
          v28 = v27;
          OUTLINED_FUNCTION_42_2();
          v30 = v29;

          if (v21 < v19 == v30 >= v28)
            break;
          v31 = v22 + 3;
          ++v22;
          if (v31 >= v4)
          {
            v9 = v4;
            goto LABEL_11;
          }
        }
        v9 = v22 + 2;
      }
LABEL_11:
      v2 = v14;
      if (v21 >= v19)
      {
        v11 = v13;
      }
      else
      {
        if (v9 < v12)
          goto LABEL_131;
        v11 = v13;
        if (v12 < v9)
        {
          v32 = (uint64_t *)(v118 + 8 * v9);
          v33 = v9;
          v34 = v12;
          v35 = (uint64_t *)(v10 + 8 * v12);
          do
          {
            if (v34 != --v33)
            {
              if (!v10)
                goto LABEL_137;
              v36 = *v35;
              *v35 = *v32;
              *v32 = v36;
            }
            ++v34;
            --v32;
            ++v35;
          }
          while (v34 < v33);
        }
      }
    }
    if (v9 < v4)
    {
      if (__OFSUB__(v9, v12))
        goto LABEL_129;
      if (v9 - v12 < v120)
      {
        if (__OFADD__(v12, v120))
          goto LABEL_132;
        if (v12 + v120 >= v4)
          v37 = (char *)v4;
        else
          v37 = (char *)(v12 + v120);
        if ((uint64_t)v37 < v12)
          goto LABEL_133;
        if ((char *)v9 != v37)
        {
          v117 = v11;
          v125 = v2;
          v38 = v118 + 8 * v9;
          do
          {
            v39 = v37;
            v40 = *(void **)(v10 + 8 * v9);
            v41 = v12;
            v42 = v38;
            do
            {
              v43 = *(void **)v42;
              v44 = v40;
              v45 = v43;
              OUTLINED_FUNCTION_23_2();
              v47 = v46;
              OUTLINED_FUNCTION_42_2();
              v49 = v48;

              if (v49 >= v47)
                break;
              if (!v10)
                goto LABEL_135;
              v50 = *(void **)v42;
              v40 = *(void **)(v42 + 8);
              *(_QWORD *)v42 = v40;
              *(_QWORD *)(v42 + 8) = v50;
              v42 -= 8;
              ++v41;
            }
            while (v9 != v41);
            ++v9;
            v38 += 8;
            v37 = v39;
            v12 = v122;
          }
          while ((char *)v9 != v39);
          v9 = (uint64_t)v39;
          v2 = v125;
          v11 = v117;
        }
      }
    }
    if (v9 < v12)
      goto LABEL_128;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_53_1(0, v11[2] + 1);
      v11 = v106;
    }
    v52 = v11[2];
    v51 = v11[3];
    v53 = v52 + 1;
    v126 = v2;
    if (v52 >= v51 >> 1)
    {
      OUTLINED_FUNCTION_53_1(v51 > 1, v52 + 1);
      v11 = v107;
    }
    v11[2] = v53;
    v54 = v11 + 4;
    v55 = &v11[2 * v52 + 4];
    *v55 = v12;
    v55[1] = v9;
    if (v52)
      break;
    v53 = 1;
LABEL_86:
    v4 = v121;
    v2 = v126;
    if (v9 >= v121)
      goto LABEL_95;
  }
  v123 = v9;
  while (1)
  {
    v56 = v53 - 1;
    if (v53 >= 4)
    {
      v61 = &v54[2 * v53];
      v62 = *(v61 - 8);
      v63 = *(v61 - 7);
      v67 = __OFSUB__(v63, v62);
      v64 = v63 - v62;
      if (v67)
        goto LABEL_113;
      v66 = *(v61 - 6);
      v65 = *(v61 - 5);
      v67 = __OFSUB__(v65, v66);
      v59 = v65 - v66;
      v60 = v67;
      if (v67)
        goto LABEL_114;
      v68 = v53 - 2;
      v69 = &v54[2 * v53 - 4];
      v71 = *v69;
      v70 = v69[1];
      v67 = __OFSUB__(v70, v71);
      v72 = v70 - v71;
      if (v67)
        goto LABEL_115;
      v67 = __OFADD__(v59, v72);
      v73 = v59 + v72;
      if (v67)
        goto LABEL_117;
      if (v73 >= v64)
      {
        v91 = &v54[2 * v56];
        v93 = *v91;
        v92 = v91[1];
        v67 = __OFSUB__(v92, v93);
        v94 = v92 - v93;
        if (v67)
          goto LABEL_123;
        v84 = v59 < v94;
        goto LABEL_75;
      }
    }
    else
    {
      if (v53 != 3)
      {
        v85 = v11[4];
        v86 = v11[5];
        v67 = __OFSUB__(v86, v85);
        v78 = v86 - v85;
        v79 = v67;
        goto LABEL_69;
      }
      v58 = v11[4];
      v57 = v11[5];
      v67 = __OFSUB__(v57, v58);
      v59 = v57 - v58;
      v60 = v67;
    }
    if ((v60 & 1) != 0)
      goto LABEL_116;
    v68 = v53 - 2;
    v74 = &v54[2 * v53 - 4];
    v76 = *v74;
    v75 = v74[1];
    v77 = __OFSUB__(v75, v76);
    v78 = v75 - v76;
    v79 = v77;
    if (v77)
      goto LABEL_118;
    v80 = &v54[2 * v56];
    v82 = *v80;
    v81 = v80[1];
    v67 = __OFSUB__(v81, v82);
    v83 = v81 - v82;
    if (v67)
      goto LABEL_120;
    if (__OFADD__(v78, v83))
      goto LABEL_122;
    if (v78 + v83 >= v59)
    {
      v84 = v59 < v83;
LABEL_75:
      if (v84)
        v56 = v68;
      goto LABEL_77;
    }
LABEL_69:
    if ((v79 & 1) != 0)
      goto LABEL_119;
    v87 = &v54[2 * v56];
    v89 = *v87;
    v88 = v87[1];
    v67 = __OFSUB__(v88, v89);
    v90 = v88 - v89;
    if (v67)
      goto LABEL_121;
    if (v90 < v78)
      goto LABEL_86;
LABEL_77:
    v95 = v56 - 1;
    if (v56 - 1 >= v53)
    {
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
LABEL_118:
      __break(1u);
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      __break(1u);
LABEL_122:
      __break(1u);
LABEL_123:
      __break(1u);
      goto LABEL_124;
    }
    v96 = v10;
    if (!v10)
      goto LABEL_136;
    v97 = v11;
    v98 = &v54[2 * v95];
    v99 = v54;
    v100 = *v98;
    v101 = v99;
    v4 = v56;
    v102 = &v99[2 * v56];
    v103 = v102[1];
    v104 = v96;
    sub_2129F802C((char *)(v96 + 8 * *v98), (char *)(v96 + 8 * *v102), v96 + 8 * v103, v124);
    if (v126)
      break;
    if (v103 < v100)
      goto LABEL_110;
    if ((unint64_t)v4 > v97[2])
      goto LABEL_111;
    *v98 = v100;
    v101[2 * v95 + 1] = v103;
    v105 = v97[2];
    if (v4 >= v105)
      goto LABEL_112;
    v54 = v101;
    v11 = v97;
    v53 = v105 - 1;
    memmove(v102, v102 + 2, 16 * (v105 - 1 - v4));
    v97[2] = v105 - 1;
    v10 = v104;
    v9 = v123;
    if (v105 <= 2)
      goto LABEL_86;
  }
  v2 = v126;
LABEL_92:
  OUTLINED_FUNCTION_12();
  if (v121 < -1)
  {
    __break(1u);
    goto LABEL_94;
  }
LABEL_107:
  *(_QWORD *)((v127 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
  sub_212A050C4();
  swift_bridgeObjectRelease();
}

void sub_2129F7F5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  void *v4;
  double v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  double v16;
  double v17;
  void *v18;

  if (a3 != a2)
  {
    v6 = a3;
    v8 = *a4;
    v9 = *a4 + 8 * a3 - 8;
    while (2)
    {
      v10 = *(void **)(v8 + 8 * v6);
      v11 = a1;
      v12 = v9;
      do
      {
        v13 = *(void **)v12;
        v14 = v10;
        v15 = v13;
        OUTLINED_FUNCTION_58_0();
        OUTLINED_FUNCTION_43_2();
        v17 = v16;

        if (v17 >= v5)
          break;
        if (!v8)
        {
          __break(1u);
          return;
        }
        v18 = *(void **)v12;
        v10 = *(void **)(v12 + 8);
        *(_QWORD *)v12 = v10;
        *(_QWORD *)(v12 + 8) = v18;
        v12 -= 8;
        ++v11;
      }
      while (v6 != v11);
      ++v6;
      v9 += 8;
      if (v6 != a2)
        continue;
      break;
    }
  }
}

uint64_t sub_2129F802C(char *a1, char *a2, unint64_t a3, char *a4)
{
  double v4;
  char *v5;
  id *v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id *v22;
  BOOL v23;
  id *v26;
  void *v27;
  id *v28;
  unint64_t v29;
  void *v30;
  id *v31;
  id v32;
  id v33;
  double v34;
  double v35;
  BOOL v36;
  char *v39;
  id *v40;

  v5 = a4;
  v7 = (id *)a2;
  v8 = (id *)a1;
  v9 = a2 - a1;
  v10 = (a2 - a1) / 8;
  v11 = a3 - (_QWORD)a2;
  v12 = (uint64_t)(a3 - (_QWORD)a2) / 8;
  if (v10 >= v12)
  {
    sub_2129F75D4(a2, (uint64_t)(a3 - (_QWORD)a2) / 8, a4);
    if (v8 >= v7 || v11 < 8)
    {
      v13 = &v5[8 * v12];
    }
    else
    {
      v26 = (id *)(a3 - 8);
      v13 = &v5[8 * v12];
      v39 = v5;
      do
      {
        v40 = v26 + 1;
        v28 = (id *)(v13 - 8);
        v27 = (void *)*((_QWORD *)v13 - 1);
        v29 = (unint64_t)v13;
        v31 = v7 - 1;
        v30 = *(v7 - 1);
        v32 = v27;
        v33 = v30;
        OUTLINED_FUNCTION_58_0();
        OUTLINED_FUNCTION_43_2();
        v35 = v34;

        if (v35 >= v4)
        {
          v36 = v40 != (id *)v29 || (unint64_t)v26 >= v29;
          v31 = v28;
          v29 = (unint64_t)v28;
        }
        else
        {
          v36 = v40 != v7 || v26 >= v7;
          --v7;
        }
        v5 = v39;
        if (v36)
          *v26 = *v31;
        --v26;
        v13 = (char *)v29;
      }
      while (v7 > v8 && v29 > (unint64_t)v39);
    }
  }
  else
  {
    sub_2129F75D4(a1, (a2 - a1) / 8, a4);
    v13 = &v5[8 * v10];
    if ((unint64_t)v7 < a3 && v9 >= 8)
    {
      while (1)
      {
        v15 = *(void **)v5;
        v16 = *v7;
        v17 = v15;
        sub_212A04EB4();
        v19 = v18;
        sub_212A04EB4();
        v21 = v20;

        if (v21 < v19)
          break;
        v22 = (id *)v5;
        v23 = v8 == (id *)v5;
        v5 += 8;
        if (!v23)
          goto LABEL_11;
LABEL_12:
        ++v8;
        if (v5 >= v13 || (unint64_t)v7 >= a3)
          goto LABEL_17;
      }
      v22 = v7;
      v23 = v8 == v7++;
      if (v23)
        goto LABEL_12;
LABEL_11:
      *v8 = *v22;
      goto LABEL_12;
    }
LABEL_17:
    v7 = v8;
  }
  sub_2129F75D4(v5, (v13 - v5) / 8, (char *)v7);
  return 1;
}

void sub_2129F8234(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
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
    __swift_instantiateConcreteTypeFromMangledName(qword_254B5E590);
    v10 = (char *)OUTLINED_FUNCTION_41_2();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22();
}

void sub_2129F8314(uint64_t a1)
{
  sub_2129F8234(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_2129F8328(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[16 * a2] <= a3)
    return (char *)OUTLINED_FUNCTION_2_4(a3, result);
  return result;
}

uint64_t sub_2129F8348(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void (*v10)(uint64_t *, _QWORD);
  void (*v11)(uint64_t *, _QWORD);
  id *v12;
  id v13;
  uint64_t v14;

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_212A05250();
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
      v8 = sub_212A05250();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_2129F8BD0(&qword_254B5E588, &qword_254B5E580);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E580);
            sub_2129F86B4();
            v11 = v10;
            v13 = *v12;
            v11(&v14, 0);
            *(_QWORD *)(v5 + 8 * i) = v13;
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
        sub_2129F76E4((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5, (void (*)(_QWORD))MEMORY[0x24BEA57F8]);
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

uint64_t sub_2129F84E0(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void (*v10)(uint64_t *, _QWORD);
  void (*v11)(uint64_t *, _QWORD);
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_212A05250();
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
      v8 = sub_212A05250();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_2129F8BD0(&qword_254B5E578, &qword_254B5E570);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E570);
            sub_2129F8678();
            v11 = v10;
            v13 = *v12;
            swift_retain();
            v11(&v14, 0);
            *(_QWORD *)(v5 + 8 * i) = v13;
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
        sub_2129F76E4((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5, (void (*)(_QWORD))MEMORY[0x24BEA3820]);
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

void sub_2129F8678()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_24_1();
  *v0 = v1;
  OUTLINED_FUNCTION_34_1();
  sub_2129F8718(v2, v3, v4);
  v1[4] = v5;
  OUTLINED_FUNCTION_22();
}

void sub_2129F86B4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_24_1();
  *v0 = v1;
  OUTLINED_FUNCTION_34_1();
  sub_2129F8768(v2, v3, v4);
  v1[4] = v5;
  OUTLINED_FUNCTION_22();
}

void sub_2129F86EC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void sub_2129F8718(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_16_1(a1, a2, a3);
  if (v4)
    OUTLINED_FUNCTION_35_1();
  *v3 = swift_retain();
  OUTLINED_FUNCTION_22();
}

uint64_t sub_2129F8760()
{
  return swift_release();
}

void sub_2129F8768(uint64_t a1, unint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_16_1(a1, a2, a3);
  if (v6)
    OUTLINED_FUNCTION_35_1();
  *v3 = *(id *)(v4 + 8 * v5 + 32);
  OUTLINED_FUNCTION_22();
}

void sub_2129F87B0(id *a1)
{

}

id sub_2129F87B8(id a1, char a2)
{
  if ((a2 & 1) != 0)
    return a1;
  else
    return (id)swift_bridgeObjectRetain();
}

void sub_2129F87C4(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

unint64_t sub_2129F87D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253EFEEC0;
  if (!qword_253EFEEC0)
  {
    v1 = sub_212A04E00();
    result = MEMORY[0x212BF73E4](MEMORY[0x24BEA5638], v1);
    atomic_store(result, (unint64_t *)&qword_253EFEEC0);
  }
  return result;
}

unint64_t sub_2129F8810()
{
  unint64_t result;

  result = qword_254B5E568;
  if (!qword_254B5E568)
  {
    result = MEMORY[0x212BF73E4](&protocol conformance descriptor for ResolutionError, &type metadata for ResolutionError);
    atomic_store(result, (unint64_t *)&qword_254B5E568);
  }
  return result;
}

uint64_t sub_2129F884C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2129F5444();
  *a1 = result;
  return result;
}

void sub_2129F8878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(a3 + 8))();
  OUTLINED_FUNCTION_39_2();
}

void sub_2129F8898(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(a3 + 16))();
  OUTLINED_FUNCTION_39_2();
}

uint64_t sub_2129F88B8()
{
  return type metadata accessor for RRResolver();
}

uint64_t method lookup function for RRResolver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RRResolver.entities.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of RRResolver.entities.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of RRResolver.entities.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of RRResolver.__allocating_init(entities:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

void dispatch thunk of RRResolver.resolve(query:)()
{
  uint64_t v0;

  (*(void (**)(void))(*(_QWORD *)v0 + 160))();
  OUTLINED_FUNCTION_39_2();
}

{
  uint64_t v0;

  (*(void (**)(void))(*(_QWORD *)v0 + 168))();
  OUTLINED_FUNCTION_39_2();
}

void sub_2129F8940()
{
  JUMPOUT(0x212BF6FE8);
}

uint64_t sub_2129F8954(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
  uint64_t v16;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    if (!(*v3 >> 62))
    {
      OUTLINED_FUNCTION_61();
      goto LABEL_4;
    }
  }
  OUTLINED_FUNCTION_10_3();
  v5 = OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_23();
LABEL_4:
  if (v5 < v2)
  {
    __break(1u);
    goto LABEL_32;
  }
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v6 = v4 - v2;
  if (__OFSUB__(0, v2 - v4))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (!(*v3 >> 62))
  {
    v7 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_9;
  }
LABEL_34:
  OUTLINED_FUNCTION_8_3();
  v7 = OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_12();
LABEL_9:
  v8 = v7 + v6;
  if (__OFADD__(v7, v6))
  {
    __break(1u);
LABEL_36:
    OUTLINED_FUNCTION_8_3();
    v12 = sub_212A05250();
    OUTLINED_FUNCTION_12();
    v9 = *v3;
    goto LABEL_17;
  }
  v9 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v9;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_20;
    v7 = 1;
  }
  if (v9 >> 62)
    goto LABEL_36;
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_17:
  if (v12 <= v8)
    v12 = v8;
  OUTLINED_FUNCTION_8_3();
  *v3 = MEMORY[0x212BF6F64](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_20:
  v13 = v11 + 32;
  v14 = (char *)(v11 + 32 + 8 * v4);
  sub_212A04D04();
  swift_arrayDestroy();
  if (!v6)
    return sub_212A050C4();
  if (*v3 >> 62)
  {
    OUTLINED_FUNCTION_10_3();
    v9 = OUTLINED_FUNCTION_59();
    OUTLINED_FUNCTION_23();
  }
  else
  {
    OUTLINED_FUNCTION_61();
  }
  if (__OFSUB__(v9, v2))
  {
    __break(1u);
  }
  else
  {
    result = (uint64_t)sub_2129F75D4((char *)(v13 + 8 * v2), v9 - v2, v14);
    if (!(*v3 >> 62))
    {
      v16 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_26;
    }
  }
  OUTLINED_FUNCTION_46();
  v16 = OUTLINED_FUNCTION_19_1();
  result = OUTLINED_FUNCTION_2();
LABEL_26:
  if (!__OFADD__(v16, v6))
  {
    *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v16 + v6;
    return sub_212A050C4();
  }
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BF73D8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_2129F8BB8(void *a1, unsigned __int8 a2)
{
  if (a2 != 255)
    sub_2129F87C4(a1, a2 & 1);
}

void sub_2129F8BD0(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x212BF73E4](MEMORY[0x24BEE12E0], v3), a1);
  }
  OUTLINED_FUNCTION_39_0();
}

uint64_t sub_2129F8C0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEED8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *OUTLINED_FUNCTION_2_4@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  size_t v2;

  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_212A0525C();
}

void OUTLINED_FUNCTION_4_3(void *a1)
{
  sub_2129F87C4(a1, 0);
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return sub_212A0525C();
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return swift_arrayInitWithCopy();
}

unint64_t OUTLINED_FUNCTION_16_1(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_2129F7394(a2, (a3 & 0xC000000000000001) == 0, a3);
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return sub_212A05250();
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_23_2()
{
  return sub_212A04EB4();
}

void *OUTLINED_FUNCTION_24_1()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_28_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_31_2()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_33_2()
{
  return sub_212A05250();
}

void OUTLINED_FUNCTION_35_1()
{
  JUMPOUT(0x212BF6F58);
}

uint64_t OUTLINED_FUNCTION_36_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_40_2()
{
  return sub_212A05250();
}

uint64_t OUTLINED_FUNCTION_41_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_42_2()
{
  return sub_212A04EB4();
}

uint64_t OUTLINED_FUNCTION_43_2()
{
  return sub_212A04EB4();
}

uint64_t OUTLINED_FUNCTION_44_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_45_2()
{
  return sub_212A04DA0();
}

uint64_t OUTLINED_FUNCTION_47_2()
{
  return sub_212A04D88();
}

uint64_t OUTLINED_FUNCTION_48_1()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_50_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_51_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_53_1(char a1, int64_t a2)
{
  char *v2;

  sub_2129F8234(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_56_1()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_57_0()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_58_0()
{
  return sub_212A04EB4();
}

uint64_t OUTLINED_FUNCTION_59()
{
  return sub_212A05250();
}

uint64_t OUTLINED_FUNCTION_60()
{
  return sub_212A05250();
}

uint64_t sub_2129F8E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_212A04DA0();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_2129F8E68(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_212A04DA0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_2129F8E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_212A04DA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_2129F8EE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_212A04DA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_2129F8F24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_212A04DA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_2129F8F68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_212A04DA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_2129F8FAC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2129F8FB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_9_3();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t sub_2129F8FE0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2129F8FEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_9_3();
  return __swift_storeEnumTagSinglePayload(v1, v0, v0, v2);
}

uint64_t type metadata accessor for MediaItemStructuredDataHandler()
{
  uint64_t result;

  result = qword_254B5E5F0;
  if (!qword_254B5E5F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2129F9050()
{
  uint64_t result;
  unint64_t v1;

  result = sub_212A04DA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_2129F90B8()
{
  return 0xD000000000000010;
}

uint64_t sub_2129F90D4()
{
  return 9;
}

unint64_t sub_2129F90DC()
{
  return 0xD000000000000016;
}

uint64_t sub_2129F90F8()
{
  return 0x49616964654D4E49;
}

uint64_t sub_2129F9118(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v3 = sub_212A04E54();
  v5 = sub_2129F91D8(v3, v4, a1);
  if (v1)
    return swift_bridgeObjectRelease();
  v7 = v5;
  swift_bridgeObjectRelease();
  v8 = sub_2129ED90C(0, 0, 0, 0, v7, 0, 0, 0, 0xF000000000000000);
  swift_release();
  return v8;
}

uint64_t sub_2129F91D8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  unsigned int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v20 = sub_212A04AC4();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_4_4();
  v7 = sub_212A0492C();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_4_4();
  v10 = v9 - v8;
  sub_212A04B6C();
  swift_allocObject();
  v21 = sub_212A04B60();
  sub_2129F9A00(a3, (SEL *)&selRef_title);
  if (v11)
  {
    OUTLINED_FUNCTION_7_4();
    sub_212A04B54();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_21();
  }
  sub_2129F95F0(a1, a2, (uint64_t)&v21, a3);
  if (v3)
  {
    OUTLINED_FUNCTION_21();
  }
  else
  {
    sub_2129F9A00(a3, (SEL *)&selRef_identifier);
    if (v12)
    {
      OUTLINED_FUNCTION_7_4();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_3_4();
      sub_212A04908();
      sub_212A04890();
      OUTLINED_FUNCTION_21();
      OUTLINED_FUNCTION_6_3();
    }
    v13 = a3;
    sub_2129F9A00(a3, (SEL *)&selRef_identifier);
    if (v14)
    {
      swift_bridgeObjectRetain();
      swift_retain();
      OUTLINED_FUNCTION_3_4();
      sub_212A04908();
      sub_212A04890();
      v13 = a3;
      swift_release();
      OUTLINED_FUNCTION_6_3();
    }
    sub_212A04C5C();
    OUTLINED_FUNCTION_51();
    sub_212A04C50();
    v15 = objc_msgSend(v13, sel_type);
    switch((unint64_t)v15)
    {
      case 1uLL:
        OUTLINED_FUNCTION_1_3((uint64_t)v15, *MEMORY[0x24BEA1680]);
        OUTLINED_FUNCTION_11_4();
        OUTLINED_FUNCTION_8_4();
        goto LABEL_26;
      case 2uLL:
        v16 = (unsigned int *)MEMORY[0x24BEA1688];
        goto LABEL_25;
      case 3uLL:
        v16 = (unsigned int *)MEMORY[0x24BEA16B0];
        goto LABEL_25;
      case 4uLL:
        v16 = (unsigned int *)MEMORY[0x24BEA1690];
        goto LABEL_25;
      case 5uLL:
        v16 = (unsigned int *)MEMORY[0x24BEA1700];
        goto LABEL_25;
      case 6uLL:
      case 7uLL:
      case 8uLL:
        v16 = (unsigned int *)MEMORY[0x24BEA16F0];
        goto LABEL_25;
      case 9uLL:
      case 0x11uLL:
        v16 = (unsigned int *)MEMORY[0x24BEA16F8];
        goto LABEL_25;
      case 0xAuLL:
        v16 = (unsigned int *)MEMORY[0x24BEA1618];
        goto LABEL_25;
      case 0xBuLL:
        v16 = (unsigned int *)MEMORY[0x24BEA1698];
        goto LABEL_25;
      case 0xCuLL:
      case 0xDuLL:
        v16 = (unsigned int *)MEMORY[0x24BEA16A8];
        goto LABEL_25;
      case 0xEuLL:
        v16 = (unsigned int *)MEMORY[0x24BEA1628];
        goto LABEL_25;
      case 0xFuLL:
        v16 = (unsigned int *)MEMORY[0x24BEA1648];
        goto LABEL_25;
      case 0x10uLL:
      case 0x13uLL:
        v16 = (unsigned int *)MEMORY[0x24BEA1638];
        goto LABEL_25;
      case 0x12uLL:
        v16 = (unsigned int *)MEMORY[0x24BEA16A0];
        goto LABEL_25;
      case 0x14uLL:
        v16 = (unsigned int *)MEMORY[0x24BEA1670];
LABEL_25:
        OUTLINED_FUNCTION_1_3((uint64_t)v15, *v16);
        OUTLINED_FUNCTION_11_4();
        OUTLINED_FUNCTION_8_4();
LABEL_26:
        swift_retain();
        swift_retain();
        sub_212A04B48();
        OUTLINED_FUNCTION_21();
        swift_release();
        break;
      default:
        break;
    }
    sub_2129F9A00(v13, (SEL *)&selRef_artist);
    if (v17)
    {
      OUTLINED_FUNCTION_51();
      sub_212A04B60();
      sub_212A04B54();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_7_4();
      swift_retain();
      sub_212A04B3C();
      OUTLINED_FUNCTION_21();
      swift_release_n();
    }
    v18 = OUTLINED_FUNCTION_7_4();
    v10 = MEMORY[0x212BF66C4](v18);
    swift_release();
    swift_release_n();
  }
  return v10;
}

uint64_t sub_2129F95F0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char *v15;
  BOOL v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  void (*v26)(char *, uint64_t);
  _QWORD v27[4];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v27[1] = a3;
  v8 = sub_212A0492C();
  v27[2] = *(_QWORD *)(v8 - 8);
  v27[3] = v8;
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_4_4();
  v9 = sub_212A04D64();
  v10 = *(_QWORD *)(v9 - 8);
  v28 = v9;
  v29 = v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (_QWORD *)((char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v27 - v14;
  v16 = a1 == 0x6C7070612E6D6F63 && a2 == 0xEF636973754D2E65;
  if (v16
    || (sub_212A052B0() & 1) != 0
    || OUTLINED_FUNCTION_0_3() == (id)1
    || OUTLINED_FUNCTION_0_3() == (id)2
    || OUTLINED_FUNCTION_0_3() == (id)5
    || (result = (uint64_t)OUTLINED_FUNCTION_0_3(), result == 14))
  {
    result = sub_2129F9A00(a4, (SEL *)&selRef_identifier);
    if (v18)
    {
      sub_212A04D7C();
      result = swift_bridgeObjectRelease();
      if (!v4)
      {
        v20 = v28;
        v19 = v29;
        (*(void (**)(uint64_t *, char *, uint64_t))(v29 + 16))(v13, v15, v28);
        v21 = (*(uint64_t (**)(uint64_t *, uint64_t))(v19 + 88))(v13, v20);
        if (v21 == *MEMORY[0x24BE697F8])
        {
          OUTLINED_FUNCTION_10_4();
          v27[0] = v13[1];
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_212A04908();
          sub_212A04890();
          OUTLINED_FUNCTION_5_6();
          return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v15, v20);
        }
        else if (v21 == *MEMORY[0x24BE69800])
        {
          OUTLINED_FUNCTION_10_4();
          v22 = *v13;
          swift_bridgeObjectRelease();
          v27[0] = (char *)v13 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254B5E658) + 64);
          v30 = v22;
          sub_212A0528C();
          swift_bridgeObjectRetain();
          sub_212A04908();
          sub_212A04890();
          OUTLINED_FUNCTION_5_6();
          (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v20);
          v23 = sub_212A04D70();
          return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v27[0], v23);
        }
        else
        {
          v24 = sub_212A04D58();
          sub_2129F4E94();
          swift_allocError();
          *v25 = 0xD000000000000026;
          v25[1] = 0x8000000212A071B0;
          (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v25, *MEMORY[0x24BEA8DC0], v24);
          swift_willThrow();
          v26 = *(void (**)(char *, uint64_t))(v19 + 8);
          v26(v15, v20);
          return ((uint64_t (*)(uint64_t *, uint64_t))v26)(v13, v20);
        }
      }
    }
  }
  return result;
}

unint64_t sub_2129F99B0()
{
  sub_2129F90B8();
  return 0xD000000000000010;
}

unint64_t sub_2129F99CC()
{
  sub_2129F90DC();
  return 0xD000000000000016;
}

uint64_t sub_2129F99E8(void **a1)
{
  return sub_2129F9118(*a1);
}

uint64_t sub_2129F9A00(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_212A04FB0();

  return v4;
}

id OUTLINED_FUNCTION_0_3()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 72));
}

uint64_t OUTLINED_FUNCTION_1_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v2 - 104) + 104))(*(_QWORD *)(v2 - 96), a2, *(_QWORD *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 112) + 8))(v0, *(_QWORD *)(v1 - 104));
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return sub_212A04DA0();
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 96))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return sub_212A04C44();
}

uint64_t sub_2129F9B10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC21SiriReferenceResolver15RRReaderMatcher_logger;
  v2 = sub_212A04DA0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_2129F9B60()
{
  return type metadata accessor for RRReaderMatcher();
}

uint64_t type metadata accessor for RRReaderMatcher()
{
  uint64_t result;

  result = qword_254B5E688;
  if (!qword_254B5E688)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2129F9BA0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_212A04DA0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_2129F9C0C()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  unsigned __int8 v5;
  __int128 v6;
  __int128 v7;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCF50]), sel_init);
  v1 = (void *)sub_212A04FA4();
  v2 = OUTLINED_FUNCTION_1_4((uint64_t)v1, sel_persistentDomainForName_);

  if (!v2 || (v3 = sub_212A04F68(), v2, !v3))
  {
    v6 = 0u;
    v7 = 0u;
    goto LABEL_8;
  }
  sub_2129F1F98(0xD000000000000012, 0x8000000212A072B0, v3, &v6);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v7 + 1))
  {
LABEL_8:
    sub_2129F9ECC((uint64_t)&v6);
    return 2;
  }
  if (OUTLINED_FUNCTION_0_4())
    return v5;
  else
    return 2;
}

uint64_t sub_2129F9D38()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCF50]), sel_init);
  v1 = (void *)sub_212A04FA4();
  v2 = OUTLINED_FUNCTION_1_4((uint64_t)v1, sel_persistentDomainForName_);

  if (!v2 || (v3 = sub_212A04F68(), v2, !v3))
  {
    v6 = 0u;
    v7 = 0u;
    goto LABEL_9;
  }
  sub_2129F1F98(0x617461446B636F6DLL, 0xEC00000065707954, v3, &v6);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v7 + 1))
  {
LABEL_9:
    sub_2129F9ECC((uint64_t)&v6);
    return 0;
  }
  if (OUTLINED_FUNCTION_0_4())
    return v5;
  else
    return 0;
}

uint64_t sub_2129F9E68(char a1)
{
  if ((a1 & 1) != 0)
    return 0x617461446B636F6DLL;
  else
    return 0xD000000000000012;
}

uint64_t type metadata accessor for SiriReferenceResolverDefaults()
{
  return objc_opt_self();
}

uint64_t sub_2129F9ECC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253EFEF38);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return swift_dynamicCast();
}

id OUTLINED_FUNCTION_1_4(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_2129F9F24()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E550);
  __swift_allocate_value_buffer(v0, qword_254B5E8C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_254B5E8C0);
  sub_212A04D04();
  sub_212A04AB8();
  return sub_212A04D10();
}

uint64_t sub_2129F9F9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  const char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;

  v41 = a1;
  v2 = sub_212A0492C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v43 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v35 - v6;
  v8 = sub_212A04DA0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E550);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E728);
  sub_212A04FBC();
  v42 = "common_EmailAddress";
  v44 = v11;
  sub_212A04D94();
  sub_212A04C38();
  swift_allocObject();
  v45 = sub_212A04C2C();
  v12 = sub_212A04CE0();
  v13 = sub_2129F1F0C(0x7472617473, 0xE500000000000000, v12);
  swift_bridgeObjectRelease();
  if (!v13)
    goto LABEL_24;
  if (!(v13 >> 62))
  {
    if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_4;
    goto LABEL_23;
  }
  swift_bridgeObjectRetain();
  v32 = sub_212A05250();
  swift_bridgeObjectRelease();
  if (!v32)
  {
LABEL_23:
    swift_bridgeObjectRelease();
LABEL_24:
    v33 = sub_212A04D58();
    sub_2129F4E94();
    swift_allocError();
    *v34 = 0xD000000000000020;
    v34[1] = 0x8000000212A072D0;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v34, *MEMORY[0x24BEA8DC0], v33);
    swift_willThrow();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v44, v8);
  }
LABEL_4:
  sub_2129F7390(0, (v13 & 0xC000000000000001) == 0, v13);
  if ((v13 & 0xC000000000000001) != 0)
    MEMORY[0x212BF6F58](0, v13);
  else
    swift_retain();
  swift_bridgeObjectRelease();
  v14 = sub_212A04CBC();
  swift_release();
  if (!v14)
    goto LABEL_24;
  v40 = v9;
  v37 = v1;
  sub_212A04B30();
  swift_allocObject();
  v15 = sub_212A04B24();
  v39 = v14;
  sub_212A0495C();
  swift_retain();
  sub_212A04B54();
  v38 = v15;
  swift_release();
  if (sub_2129FA634())
  {
    v16 = sub_212A04D88();
    v17 = sub_212A05118();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_2129E2000, v16, v17, "Adding end node since it contains at least one valid int", v18, 2u);
      MEMORY[0x212BF7480](v18, -1, -1);
    }

    swift_retain();
    sub_212A04C14();
    swift_release_n();
  }
  sub_212A04C08();
  swift_allocObject();
  v19 = sub_212A04BFC();
  swift_retain();
  sub_212A04BF0();
  swift_release();
  v20 = sub_212A04CEC();
  v21 = *(_QWORD *)(v20 + 16);
  if (v21)
  {
    v35[1] = v20;
    v36 = v8;
    v22 = v20 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v23 = *(_QWORD *)(v3 + 72);
    v24 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
    do
    {
      v24(v7, v22, v2);
      sub_212A04890();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
      v22 += v23;
      --v21;
    }
    while (v21);
    swift_bridgeObjectRelease();
    v8 = v36;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v25 = v43;
  sub_212A04908();
  sub_212A04890();
  if (MEMORY[0x212BF66C4](v19))
  {
    sub_212A04AB8();
    sub_212A04998();
    v26 = v46;
    if (v46)
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v25, v2);
      result = (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v44, v8);
      *v41 = v26;
      return result;
    }
    v30 = sub_212A04D58();
    sub_2129F4E94();
    swift_allocError();
    *v31 = 0xD00000000000002ALL;
    v31[1] = 0x8000000212A07030;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v31, *MEMORY[0x24BEA8DC0], v30);
    swift_willThrow();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    v28 = sub_212A04D58();
    sub_2129F4E94();
    swift_allocError();
    *v29 = 0xD00000000000002DLL;
    v29[1] = 0x8000000212A07000;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v29, *MEMORY[0x24BEA8DC0], v28);
    swift_willThrow();
    swift_release();
    swift_release();
    swift_release();
  }
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v25, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v44, v8);
}

unint64_t sub_2129FA634()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
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
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _DWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v1 = sub_212A04DA0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E550);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E728);
  sub_212A04FBC();
  sub_212A04D94();
  v5 = sub_212A04CE0();
  v6 = sub_2129F1F0C(6581861, 0xE300000000000000, v5);
  swift_bridgeObjectRelease();
  if (!v6)
    goto LABEL_75;
  if (v6 >> 62)
  {
    OUTLINED_FUNCTION_8();
    v32 = sub_212A05250();
    OUTLINED_FUNCTION_0();
    if (!v32)
      goto LABEL_73;
  }
  else if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_73:
    OUTLINED_FUNCTION_0();
    goto LABEL_74;
  }
  OUTLINED_FUNCTION_5();
  if ((v6 & 0xC000000000000001) != 0)
    OUTLINED_FUNCTION_10();
  swift_retain();
  OUTLINED_FUNCTION_0();
  v7 = sub_212A04CBC();
  OUTLINED_FUNCTION_14_3();
  if (!v7)
    goto LABEL_74;
  v8 = sub_212A04CE0();
  v6 = sub_2129F1F0C(1702125924, 0xE400000000000000, v8);
  swift_bridgeObjectRelease();
  if (!v6)
    goto LABEL_59;
  if (v6 >> 62)
    goto LABEL_65;
  if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_72:
    OUTLINED_FUNCTION_42();
    goto LABEL_73;
  }
  while (1)
  {
    OUTLINED_FUNCTION_5();
    if ((v6 & 0xC000000000000001) != 0)
      OUTLINED_FUNCTION_10();
    swift_retain();
    OUTLINED_FUNCTION_0();
    v9 = sub_212A04CBC();
    swift_release();
    if (!v9)
      goto LABEL_57;
    v10 = sub_212A04CE0();
    v6 = sub_2129F1F0C(1701669236, 0xE400000000000000, v10);
    swift_bridgeObjectRelease();
    if (!v6)
    {
LABEL_58:
      swift_release();
LABEL_59:
      OUTLINED_FUNCTION_42();
      goto LABEL_75;
    }
    if (!(v6 >> 62))
    {
      if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_14;
LABEL_71:
      OUTLINED_FUNCTION_14_3();
      goto LABEL_72;
    }
LABEL_70:
    OUTLINED_FUNCTION_8();
    v34 = sub_212A05250();
    OUTLINED_FUNCTION_0();
    if (!v34)
      goto LABEL_71;
LABEL_14:
    v38 = v9;
    OUTLINED_FUNCTION_5();
    if ((v6 & 0xC000000000000001) != 0)
      OUTLINED_FUNCTION_10();
    v11 = *(_QWORD *)(v6 + 32);
    swift_retain();
    OUTLINED_FUNCTION_0();
    v9 = sub_212A04CBC();
    OUTLINED_FUNCTION_28_2();
    v37 = v9;
    if (!v9)
      break;
    v12 = sub_212A04CE0();
    OUTLINED_FUNCTION_1_5(v12);
    while (1)
    {
      OUTLINED_FUNCTION_12_4();
      v6 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v13);
      if (v6 >> 62)
      {
        OUTLINED_FUNCTION_2_5();
        if (!OUTLINED_FUNCTION_10_5())
          goto LABEL_31;
      }
      else
      {
        v14 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
        OUTLINED_FUNCTION_8();
        if (!v14)
          goto LABEL_31;
      }
      if ((v6 & 0xC000000000000001) != 0)
        OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_17_3();
      if (!v15)
        break;
      OUTLINED_FUNCTION_7_5();
      OUTLINED_FUNCTION_0();
      sub_212A04CBC();
      OUTLINED_FUNCTION_15_3();
      v16 = sub_212A04CE0();
      OUTLINED_FUNCTION_21();
      if (*(_QWORD *)(v16 + 16) && (v17 = OUTLINED_FUNCTION_5_7(), (v18 & 1) != 0))
      {
        v6 = *(_QWORD *)(*(_QWORD *)(v16 + 56) + 8 * v17);
        OUTLINED_FUNCTION_8();
        OUTLINED_FUNCTION_26();
        if (v6 >> 62)
        {
          OUTLINED_FUNCTION_2_5();
          v21 = OUTLINED_FUNCTION_10_5();
          OUTLINED_FUNCTION_0();
          if (!v21)
            goto LABEL_31;
LABEL_25:
          if ((v6 & 0xC000000000000001) != 0)
            OUTLINED_FUNCTION_10();
          OUTLINED_FUNCTION_17_3();
          if (!v19)
          {
            __break(1u);
LABEL_69:
            __break(1u);
            goto LABEL_70;
          }
          OUTLINED_FUNCTION_7_5();
          OUTLINED_FUNCTION_0();
          sub_212A04CA4();
          OUTLINED_FUNCTION_9_4();
          if ((v0 & 1) == 0)
          {
            v36[1] = 0;
            OUTLINED_FUNCTION_28_2();
            v22 = sub_212A04CE0();
            OUTLINED_FUNCTION_1_5(v22);
            while (1)
            {
              OUTLINED_FUNCTION_12_4();
              v6 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v23);
              if (v6 >> 62)
              {
                OUTLINED_FUNCTION_2_5();
                if (!OUTLINED_FUNCTION_10_5())
                  goto LABEL_51;
              }
              else
              {
                v24 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
                OUTLINED_FUNCTION_8();
                if (!v24)
                  goto LABEL_51;
              }
              if ((v6 & 0xC000000000000001) != 0)
                OUTLINED_FUNCTION_10();
              OUTLINED_FUNCTION_17_3();
              if (!v25)
                goto LABEL_64;
              OUTLINED_FUNCTION_7_5();
              OUTLINED_FUNCTION_0();
              sub_212A04CBC();
              OUTLINED_FUNCTION_15_3();
              v26 = sub_212A04CE0();
              OUTLINED_FUNCTION_21();
              if (*(_QWORD *)(v26 + 16) && (v27 = OUTLINED_FUNCTION_5_7(), (v28 & 1) != 0))
              {
                v6 = *(_QWORD *)(*(_QWORD *)(v26 + 56) + 8 * v27);
                OUTLINED_FUNCTION_8();
                OUTLINED_FUNCTION_26();
                if (v6 >> 62)
                {
                  OUTLINED_FUNCTION_2_5();
                  v31 = OUTLINED_FUNCTION_10_5();
                  OUTLINED_FUNCTION_0();
                  if (v31)
                    goto LABEL_45;
LABEL_51:
                  OUTLINED_FUNCTION_0();
                }
                else
                {
                  if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
                    goto LABEL_51;
LABEL_45:
                  if ((v6 & 0xC000000000000001) != 0)
                    OUTLINED_FUNCTION_10();
                  OUTLINED_FUNCTION_17_3();
                  if (!v29)
                    goto LABEL_69;
                  OUTLINED_FUNCTION_7_5();
                  OUTLINED_FUNCTION_0();
                  sub_212A04CA4();
                  OUTLINED_FUNCTION_9_4();
                  if ((v0 & 1) == 0)
                  {
                    OUTLINED_FUNCTION_28_2();
                    sub_212A04B30();
                    swift_allocObject();
                    v6 = sub_212A04B24();
                    sub_212A0495C();
                    swift_release();
                    goto LABEL_58;
                  }
                }
              }
              else
              {
                OUTLINED_FUNCTION_26();
              }
            }
          }
        }
        else
        {
          if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_25;
LABEL_31:
          OUTLINED_FUNCTION_0();
        }
      }
      else
      {
        OUTLINED_FUNCTION_26();
      }
    }
    __break(1u);
LABEL_64:
    __break(1u);
    __break(1u);
    __break(1u);
LABEL_65:
    OUTLINED_FUNCTION_8();
    v33 = sub_212A05250();
    OUTLINED_FUNCTION_0();
    if (!v33)
      goto LABEL_72;
  }
  OUTLINED_FUNCTION_21();
LABEL_57:
  swift_release();
LABEL_74:
  v6 = 0;
LABEL_75:
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v6;
}

void sub_2129FADEC()
{
  JUMPOUT(0x2129FA828);
}

uint64_t OUTLINED_FUNCTION_1_5(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = result + 64;
  *(_QWORD *)(v1 - 96) = (unint64_t)((1 << *(_BYTE *)(result + 32)) + 63) >> 6;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return swift_bridgeObjectRetain();
}

unint64_t OUTLINED_FUNCTION_5_7()
{
  return sub_2129F3ED0(0x5672656765746E69, 0xEC00000065756C61);
}

uint64_t OUTLINED_FUNCTION_7_5()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_10_5()
{
  return sub_212A05250();
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for ApplicationStructuredDataHandler()
{
  return &type metadata for ApplicationStructuredDataHandler;
}

uint64_t sub_2129FAEDC()
{
  return 0x415F6E6F6D6D6F63;
}

uint64_t sub_2129FAEF8()
{
  return 0;
}

unint64_t sub_2129FAF00()
{
  return 0xD000000000000018;
}

id sub_2129FAF1C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v14;

  v6 = sub_212A0492C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_212A049B0();
  swift_allocObject();
  v10 = sub_212A049A4();
  swift_bridgeObjectRetain();
  sub_212A04908();
  sub_212A04890();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v11 = MEMORY[0x212BF66C4](v10);
  if (v11)
  {
    v12 = (id)sub_2129ED90C(a1, a2, a1, a2, v11, 0, 0, 0, 0xF000000000000000);
    swift_release();
  }
  else
  {
    v12 = a3;
  }
  swift_release();
  return v12;
}

unint64_t sub_2129FB094()
{
  sub_2129FAF00();
  return 0xD000000000000018;
}

id sub_2129FB0B0(uint64_t *a1, void *a2)
{
  return sub_2129FAF1C(*a1, a1[1], a2);
}

uint64_t sub_2129FB0D0(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v11 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_15;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; v2 = sub_212A05250())
  {
    v3 = 4;
    while (1)
    {
      v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x212BF6F58](v3 - 4, a1) : *(id *)(a1 + 8 * v3);
      v5 = v4;
      v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1))
        break;
      static RREntityMatcher.entity(_:matches:entityFoundByMarrsIdentifier:)();
      v8 = v7;

      if (v8)
      {
        MEMORY[0x212BF6E08]();
        if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_212A050D0();
        sub_212A050F4();
        sub_212A050C4();
      }
      ++v3;
      if (v6 == v2)
      {
        swift_bridgeObjectRelease();
        v9 = v11;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  v9 = MEMORY[0x24BEE4AF8];
LABEL_17:
  swift_release();
  return v9;
}

uint64_t sub_2129FB254(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  os_log_type_t v7;
  _DWORD *v8;
  uint64_t v9;
  BOOL v10;
  char v11;
  uint64_t v12;
  os_log_type_t v13;
  _DWORD *v14;
  uint64_t v15;
  os_log_type_t v16;
  _DWORD *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v36;
  uint64_t v37[4];
  uint64_t v38;

  v38 = MEMORY[0x24BEE4AF8];
  v2 = sub_2129FB91C(a1);
  if (v2)
  {
    v3 = v2;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_12_5();
    v4 = OUTLINED_FUNCTION_10_6();
    if (os_log_type_enabled(v1, v4))
    {
      v5 = (uint8_t *)OUTLINED_FUNCTION_3_0();
      *(_DWORD *)v5 = 134217984;
      v37[0] = *(_QWORD *)(v3 + 16);
      sub_212A05160();
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_20_0(&dword_2129E2000, v1, v4, "extractUsoIdentifiersFromReferenceNodes count: %ld", v5);
      OUTLINED_FUNCTION_0_0();
    }
    OUTLINED_FUNCTION_2();

    v10 = sub_212A04CF8() == 0x6E456F4E5F6F7375 && v9 == 0xEC00000079746974;
    v36 = v3;
    if (v10)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = sub_212A052B0();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
        goto LABEL_16;
    }
    if ((sub_2129FD168(v3) & 1) == 0)
    {
      v15 = sub_2129FD4CC(v3);
      OUTLINED_FUNCTION_14_4();
      v38 = v15;
      OUTLINED_FUNCTION_12_5();
      v16 = OUTLINED_FUNCTION_10_6();
      if (OUTLINED_FUNCTION_4_5(v16))
      {
        v17 = (_DWORD *)OUTLINED_FUNCTION_3_0();
        v37[0] = OUTLINED_FUNCTION_3_0();
        *v17 = 136315138;
        OUTLINED_FUNCTION_1_6();
        OUTLINED_FUNCTION_5_8();
        OUTLINED_FUNCTION_8_3();
        OUTLINED_FUNCTION_16_2();
      }
      goto LABEL_20;
    }
LABEL_16:
    v12 = sub_2129FD960(v3);
    OUTLINED_FUNCTION_14_4();
    v38 = v12;
    OUTLINED_FUNCTION_12_5();
    v13 = OUTLINED_FUNCTION_10_6();
    if (OUTLINED_FUNCTION_4_5(v13))
    {
      v14 = (_DWORD *)OUTLINED_FUNCTION_3_0();
      v37[0] = OUTLINED_FUNCTION_3_0();
      *v14 = 136315138;
      OUTLINED_FUNCTION_1_6();
      OUTLINED_FUNCTION_5_8();
      OUTLINED_FUNCTION_8_3();
      OUTLINED_FUNCTION_16_2();
    }
LABEL_20:

    goto LABEL_21;
  }
  v6 = sub_2129FDCB8();
  if (v6)
  {
    v36 = v6;
    v38 = sub_2129FD960(v6);
    v1 = ((char *)v1 + OBJC_IVAR____TtC21SiriReferenceResolver10RRResolver_logger);
    sub_212A04D88();
    v7 = OUTLINED_FUNCTION_10_6();
    if (OUTLINED_FUNCTION_4_5(v7))
    {
      v8 = (_DWORD *)OUTLINED_FUNCTION_3_0();
      v37[0] = OUTLINED_FUNCTION_3_0();
      *v8 = 136315138;
      OUTLINED_FUNCTION_1_6();
      OUTLINED_FUNCTION_5_8();
      OUTLINED_FUNCTION_8_3();
      OUTLINED_FUNCTION_16_2();
    }
    goto LABEL_20;
  }
  v36 = MEMORY[0x24BEE4AF8];
LABEL_21:
  OUTLINED_FUNCTION_12_5();
  v18 = OUTLINED_FUNCTION_10_6();
  if (os_log_type_enabled(v1, v18))
  {
    v19 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    v37[0] = OUTLINED_FUNCTION_3_0();
    *(_DWORD *)v19 = 136315138;
    swift_beginAccess();
    v20 = OUTLINED_FUNCTION_5_8();
    v21 = OUTLINED_FUNCTION_8_3();
    v22 = MEMORY[0x212BF6E2C](v21, v20);
    v24 = v23;
    OUTLINED_FUNCTION_12();
    sub_2129F37AC(v22, v24, v37);
    OUTLINED_FUNCTION_13_4();
    sub_212A05160();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_20_0(&dword_2129E2000, v1, v18, "entities before mapping: %s", v19);
    OUTLINED_FUNCTION_31_0();
    OUTLINED_FUNCTION_0_0();
  }

  swift_retain();
  v25 = OUTLINED_FUNCTION_8_3();
  v26 = sub_2129FB0D0(v25);
  OUTLINED_FUNCTION_12();
  swift_beginAccess();
  OUTLINED_FUNCTION_14_4();
  v38 = v26;
  sub_2129FE304((unint64_t *)&v38, v36);
  swift_endAccess();
  OUTLINED_FUNCTION_2();
  v27 = OUTLINED_FUNCTION_12_5();
  v28 = sub_212A05118();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    v37[0] = OUTLINED_FUNCTION_3_0();
    *(_DWORD *)v29 = 136315138;
    v30 = sub_212A04EF0();
    v31 = swift_bridgeObjectRetain();
    v32 = MEMORY[0x212BF6E2C](v31, v30);
    v34 = v33;
    swift_bridgeObjectRelease();
    sub_2129F37AC(v32, v34, v37);
    OUTLINED_FUNCTION_13_4();
    sub_212A05160();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_20_0(&dword_2129E2000, v27, v28, "filterByMarrsIdentifiersResults: %s", v29);
    OUTLINED_FUNCTION_31_0();
    OUTLINED_FUNCTION_0_0();
  }

  return v38;
}

uint64_t sub_2129FB91C(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t inited;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  int64_t v39;
  unint64_t v40;
  int64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  _BOOL8 v50;
  char v51;
  unint64_t v52;
  char v53;
  _QWORD *v54;
  uint64_t *v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  int64_t v78;
  __int128 v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  int64_t v83;
  unint64_t v84;
  int64_t v85;
  uint64_t *v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  NSObject *v91;
  os_log_type_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  char v110;
  void (*v111)(uint64_t, uint64_t);
  char *v112;
  void (*v113)(char *, char *, unint64_t);
  uint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int64_t v119;
  int64_t v120;
  int v121;
  uint64_t v122;
  int64_t v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  void (*v134)(char *, unint64_t, unint64_t);
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void (*v141)(char *, unint64_t, uint64_t);
  char *v142;
  uint64_t v143;
  char v144;
  void (*v145)(char *, uint64_t);
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  unint64_t v149;
  _QWORD *v150;
  char *v151;
  char *v152;
  uint64_t v153;
  NSObject *v154;
  os_log_type_t v155;
  uint8_t *v156;
  uint64_t result;
  _QWORD v158[2];
  __int128 v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  int64_t v163;
  char *v164;
  uint64_t v165;
  char *v166;
  char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  char *v172;
  char *v173;
  _QWORD *v174;
  uint64_t v175;
  char *v176;
  char *v177;
  uint64_t i;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  int64_t v182;
  uint64_t v183;
  char *v184;
  void (*v185)(char *, unint64_t, unint64_t);
  uint64_t v186;
  uint64_t v187;
  unint64_t v188;
  unint64_t v189;
  uint64_t v190;
  uint64_t v191;
  unint64_t v192;
  unint64_t v193;

  v175 = sub_212A04DD0();
  v174 = *(_QWORD **)(v175 - 8);
  v2 = MEMORY[0x24BDAC7A8](v175);
  v160 = (char *)v158 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v173 = (char *)v158 - v5;
  MEMORY[0x24BDAC7A8](v4);
  v176 = (char *)v158 - v6;
  v186 = sub_212A048E4();
  v183 = *(_QWORD *)(v186 - 8);
  MEMORY[0x24BDAC7A8](v186);
  v167 = (char *)v158 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v179 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED80);
  MEMORY[0x24BDAC7A8](v179);
  v9 = (uint64_t)v158 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED78);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v171 = (uint64_t)v158 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v158 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v185 = (void (*)(char *, unint64_t, unint64_t))((char *)v158 - v16);
  isUniquelyReferenced_nonNull_native = sub_212A0492C();
  v18 = *(_QWORD *)(isUniquelyReferenced_nonNull_native - 8);
  v19 = MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native);
  v164 = (char *)v158 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v166 = (char *)v158 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v177 = (char *)v158 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v184 = (char *)v158 - v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEF30);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212A05CD0;
  *(_QWORD *)(inited + 32) = a1;
  v189 = inited;
  sub_212A050C4();
  v27 = v189;
  v193 = v189;
  v165 = a1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEEE8);
  v28 = MEMORY[0x24BEE4AF8];
  v29 = sub_212A04F74();
  v30 = sub_212A0045C((uint64_t)&unk_24CE6FE00);
  v192 = v30;
  v31 = *(_QWORD *)(v30 + 16);
  v188 = isUniquelyReferenced_nonNull_native;
  v170 = v18;
  v180 = v9;
  v172 = v15;
  if (!v31)
    goto LABEL_116;
  if (v27 >> 62)
    goto LABEL_115;
  if (!*(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_116;
  while (1)
  {
LABEL_4:
    v15 = (char *)(v27 >> 62);
    v169 = v29;
    if (v27 >> 62)
    {
      swift_bridgeObjectRetain();
      v29 = sub_212A05250();
      swift_bridgeObjectRelease();
      if (!v29)
        goto LABEL_224;
      swift_bridgeObjectRetain();
      v32 = sub_212A05250();
      swift_bridgeObjectRelease();
      if (!v32)
        goto LABEL_112;
    }
    else if (!*(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
      goto LABEL_114;
    }
    sub_2129F7390(0, (v27 & 0xC000000000000001) == 0, v27);
    if ((v27 & 0xC000000000000001) != 0)
    {
      v187 = MEMORY[0x212BF6F58](0, v27);
      if (!v15)
      {
LABEL_8:
        v29 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_14;
      }
    }
    else
    {
      v187 = *(_QWORD *)(v27 + 32);
      swift_retain();
      if (!v15)
        goto LABEL_8;
    }
    swift_bridgeObjectRetain();
    v29 = sub_212A05250();
    swift_bridgeObjectRelease();
LABEL_14:
    if (v29)
      break;
LABEL_114:
    __break(1u);
LABEL_115:
    swift_bridgeObjectRetain();
    v73 = sub_212A05250();
    swift_bridgeObjectRelease();
    if (!v73)
      goto LABEL_116;
  }
  v27 = (unint64_t)&v193;
  sub_2129F8954(0, 1);
  v33 = *(_QWORD *)(v30 + 56);
  v181 = v30 + 56;
  v34 = 1 << *(_BYTE *)(v30 + 32);
  if (v34 < 64)
    v35 = ~(-1 << v34);
  else
    v35 = -1;
  v36 = v35 & v33;
  v182 = (unint64_t)(v34 + 63) >> 6;
  swift_bridgeObjectRetain();
  v18 = 0;
  for (i = v30; ; v30 = i)
  {
LABEL_19:
    if (v36)
    {
      v37 = __clz(__rbit64(v36));
      v36 &= v36 - 1;
      v38 = v37 | (v18 << 6);
      goto LABEL_35;
    }
    v39 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
      goto LABEL_111;
    }
    if (v39 >= v182)
      goto LABEL_53;
    v40 = *(_QWORD *)(v181 + 8 * v39);
    ++v18;
    if (!v40)
    {
      v18 = v39 + 1;
      if (v39 + 1 >= v182)
        goto LABEL_53;
      v40 = *(_QWORD *)(v181 + 8 * v18);
      if (!v40)
      {
        v18 = v39 + 2;
        if (v39 + 2 >= v182)
          goto LABEL_53;
        v40 = *(_QWORD *)(v181 + 8 * v18);
        if (!v40)
          break;
      }
    }
LABEL_34:
    v36 = (v40 - 1) & v40;
    v38 = __clz(__rbit64(v40)) + (v18 << 6);
LABEL_35:
    v42 = (uint64_t *)(*(_QWORD *)(v30 + 48) + 16 * v38);
    v43 = *v42;
    v15 = (char *)v42[1];
    swift_bridgeObjectRetain();
    v44 = sub_212A04CE0();
    if (*(_QWORD *)(v44 + 16))
    {
      swift_bridgeObjectRetain();
      v45 = sub_2129F3ED0(v43, (uint64_t)v15);
      v29 = v28;
      if ((v46 & 1) != 0)
      {
        v29 = *(_QWORD *)(*(_QWORD *)(v44 + 56) + 8 * v45);
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v29 = v28;
    }
    swift_bridgeObjectRelease();
    if ((unint64_t)v29 >> 62)
    {
      swift_bridgeObjectRetain();
      v27 = sub_212A05250();
      swift_bridgeObjectRelease();
      if (!v27)
      {
LABEL_42:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
    }
    else
    {
      v27 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v27)
        goto LABEL_42;
    }
    sub_212A00628(v43, (uint64_t)v15);
    swift_bridgeObjectRelease();
    v27 = v169;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v189 = v27;
    v47 = sub_2129F3ED0(v43, (uint64_t)v15);
    v49 = *(_QWORD *)(v27 + 16);
    v50 = (v48 & 1) == 0;
    v9 = v49 + v50;
    if (__OFADD__(v49, v50))
      goto LABEL_109;
    v30 = v47;
    v28 = v48;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEF00);
    v27 = (unint64_t)&v189;
    v51 = sub_212A05238();
    isUniquelyReferenced_nonNull_native = v188;
    v9 = v180;
    if ((v51 & 1) != 0)
    {
      v27 = v189;
      v52 = sub_2129F3ED0(v43, (uint64_t)v15);
      if ((v28 & 1) != (v53 & 1))
        goto LABEL_226;
      v30 = v52;
    }
    v54 = (_QWORD *)v189;
    v169 = v189;
    if ((v28 & 1) != 0)
    {
      v27 = *(_QWORD *)(v189 + 56);
      swift_bridgeObjectRelease();
      *(_QWORD *)(v27 + 8 * v30) = v29;
    }
    else
    {
      *(_QWORD *)(v189 + 8 * (v30 >> 6) + 64) |= 1 << v30;
      v55 = (uint64_t *)(v54[6] + 16 * v30);
      *v55 = v43;
      v55[1] = (uint64_t)v15;
      *(_QWORD *)(v54[7] + 8 * v30) = v29;
      v56 = v54[2];
      v57 = __OFADD__(v56, 1);
      v58 = v56 + 1;
      if (v57)
        goto LABEL_113;
      v54[2] = v58;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v28 = MEMORY[0x24BEE4AF8];
  }
  v41 = v39 + 3;
  if (v41 < v182)
  {
    v40 = *(_QWORD *)(v181 + 8 * v41);
    if (!v40)
    {
      while (1)
      {
        v18 = v41 + 1;
        if (__OFADD__(v41, 1))
          goto LABEL_108;
        if (v18 >= v182)
          goto LABEL_53;
        v40 = *(_QWORD *)(v181 + 8 * v18);
        ++v41;
        if (v40)
          goto LABEL_34;
      }
    }
    v18 = v41;
    goto LABEL_34;
  }
LABEL_53:
  swift_release();
  v30 = v192;
  if (*(_QWORD *)(v192 + 16))
  {
    v27 = v187;
    v59 = sub_212A04CE0();
    v18 = 0;
    v60 = *(_QWORD *)(v59 + 64);
    i = v59 + 64;
    v61 = 1 << *(_BYTE *)(v59 + 32);
    if (v61 < 64)
      v62 = ~(-1 << v61);
    else
      v62 = -1;
    v9 = v62 & v60;
    v181 = (unint64_t)(v61 + 63) >> 6;
    v182 = v59;
    if ((v62 & v60) != 0)
    {
LABEL_58:
      v63 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v64 = v63 | (v18 << 6);
      goto LABEL_75;
    }
    while (2)
    {
      v65 = v18 + 1;
      if (__OFADD__(v18, 1))
        goto LABEL_107;
      if (v65 >= v181)
      {
        swift_release();
        swift_release();
        isUniquelyReferenced_nonNull_native = v188;
        v9 = v180;
        goto LABEL_99;
      }
      v66 = *(_QWORD *)(i + 8 * v65);
      ++v18;
      isUniquelyReferenced_nonNull_native = v188;
      v9 = v180;
      if (!v66)
      {
        v18 = v65 + 1;
        if (v65 + 1 >= v181)
          goto LABEL_97;
        v66 = *(_QWORD *)(i + 8 * v18);
        if (!v66)
        {
          v18 = v65 + 2;
          if (v65 + 2 >= v181)
            goto LABEL_97;
          v66 = *(_QWORD *)(i + 8 * v18);
          if (!v66)
          {
            v18 = v65 + 3;
            if (v65 + 3 >= v181)
              goto LABEL_97;
            v66 = *(_QWORD *)(i + 8 * v18);
            if (!v66)
            {
              v67 = v65 + 4;
              if (v67 >= v181)
              {
LABEL_97:
                swift_release();
                break;
              }
              v66 = *(_QWORD *)(i + 8 * v67);
              if (!v66)
              {
                while (1)
                {
                  v18 = v67 + 1;
                  if (__OFADD__(v67, 1))
                    goto LABEL_110;
                  if (v18 >= v181)
                    goto LABEL_97;
                  v66 = *(_QWORD *)(i + 8 * v18);
                  ++v67;
                  if (v66)
                    goto LABEL_74;
                }
              }
              v18 = v67;
            }
          }
        }
      }
LABEL_74:
      v9 = (v66 - 1) & v66;
      v64 = __clz(__rbit64(v66)) + (v18 << 6);
LABEL_75:
      v29 = *(_QWORD *)(*(_QWORD *)(v182 + 56) + 8 * v64);
      v189 = v28;
      if ((unint64_t)v29 >> 62)
      {
        if (v29 < 0)
          v27 = v29;
        else
          v27 = v29 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain_n();
        v68 = sub_212A05250();
        if (!v68)
          goto LABEL_92;
LABEL_77:
        if (v68 < 1)
        {
          __break(1u);
          goto LABEL_106;
        }
        v15 = (char *)v30;
        for (j = 0; j != v68; ++j)
        {
          if ((v29 & 0xC000000000000001) != 0)
            MEMORY[0x212BF6F58](j, v29);
          else
            swift_retain();
          v70 = sub_212A04CBC();
          v71 = swift_release();
          if (v70)
          {
            MEMORY[0x212BF6E08](v71);
            isUniquelyReferenced_nonNull_native = *(_QWORD *)((v189 & 0xFFFFFFFFFFFFFF8) + 0x10);
            if (isUniquelyReferenced_nonNull_native >= *(_QWORD *)((v189 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_212A050D0();
            sub_212A050F4();
            sub_212A050C4();
          }
        }
        swift_bridgeObjectRelease();
        v28 = v189;
        v30 = (unint64_t)v15;
      }
      else
      {
        v68 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain_n();
        if (v68)
          goto LABEL_77;
LABEL_92:
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      v27 = (unint64_t)&v193;
      sub_2129F6850(v28);
      v28 = MEMORY[0x24BEE4AF8];
      if (v9)
        goto LABEL_58;
      continue;
    }
  }
  swift_release();
LABEL_99:
  v18 = v170;
  v15 = v172;
  v29 = v169;
  if (*(_QWORD *)(v30 + 16))
  {
    v27 = v193;
    if (v193 >> 62)
    {
      swift_bridgeObjectRetain();
      v72 = sub_212A05250();
      swift_bridgeObjectRelease();
      v29 = v169;
      if (v72)
        goto LABEL_4;
    }
    else if (*(_QWORD *)((v193 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_4;
    }
  }
LABEL_116:
  if (!*(_QWORD *)(v29 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  v74 = *(_QWORD *)(v29 + 64);
  v162 = v29 + 64;
  v191 = MEMORY[0x24BEE4B08];
  v75 = 1 << *(_BYTE *)(v29 + 32);
  v76 = -1;
  if (v75 < 64)
    v76 = ~(-1 << v75);
  v77 = v76 & v74;
  v161 = v168 + OBJC_IVAR____TtC21SiriReferenceResolver10RRResolver_logger;
  v163 = (unint64_t)(v75 + 63) >> 6;
  LODWORD(v182) = *MEMORY[0x24BE9F918];
  v169 = v29;
  swift_bridgeObjectRetain();
  v78 = 0;
  *(_QWORD *)&v79 = 134218242;
  v159 = v79;
  v158[1] = MEMORY[0x24BEE4AD8] + 8;
  v80 = v28;
  while (2)
  {
    v181 = v80;
    if (v77)
    {
      v168 = (v77 - 1) & v77;
      v81 = __clz(__rbit64(v77)) | (v78 << 6);
      v82 = v169;
    }
    else
    {
      v83 = v78 + 1;
      v82 = v169;
      if (__OFADD__(v78, 1))
        goto LABEL_222;
      if (v83 >= v163)
        goto LABEL_193;
      v84 = *(_QWORD *)(v162 + 8 * v83);
      ++v78;
      if (!v84)
      {
        v78 = v83 + 1;
        if (v83 + 1 >= v163)
          goto LABEL_193;
        v84 = *(_QWORD *)(v162 + 8 * v78);
        if (!v84)
        {
          v78 = v83 + 2;
          if (v83 + 2 >= v163)
            goto LABEL_193;
          v84 = *(_QWORD *)(v162 + 8 * v78);
          if (!v84)
          {
            v85 = v83 + 3;
            if (v85 >= v163)
              goto LABEL_193;
            v84 = *(_QWORD *)(v162 + 8 * v85);
            if (!v84)
            {
              while (1)
              {
                v78 = v85 + 1;
                if (__OFADD__(v85, 1))
                  goto LABEL_223;
                if (v78 >= v163)
                  break;
                v84 = *(_QWORD *)(v162 + 8 * v78);
                ++v85;
                if (v84)
                  goto LABEL_135;
              }
LABEL_193:
              swift_release();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v190 = v28;
              v131 = v181;
              v184 = *(char **)(v181 + 16);
              if (!v184)
              {
LABEL_210:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v153 = v190;
                swift_bridgeObjectRetain();
                v154 = sub_212A04D88();
                v155 = sub_212A05118();
                if (os_log_type_enabled(v154, v155))
                {
                  v156 = (uint8_t *)swift_slowAlloc();
                  *(_DWORD *)v156 = 134217984;
                  v189 = *(_QWORD *)(v153 + 16);
                  sub_212A05160();
                  swift_bridgeObjectRelease();
                  _os_log_impl(&dword_2129E2000, v154, v155, "Found %ld marrs identifier(s) total", v156, 0xCu);
                  MEMORY[0x212BF7480](v156, -1, -1);

                }
                else
                {

                  swift_bridgeObjectRelease();
                }
                swift_bridgeObjectRelease();
                swift_beginAccess();
                return v190;
              }
              v132 = 0;
              v182 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
              v183 = v181 + v182;
              while (2)
              {
                if (v132 >= *(_QWORD *)(v131 + 16))
                  goto LABEL_220;
                v133 = *(_QWORD *)(v18 + 72);
                v134 = *(void (**)(char *, unint64_t, unint64_t))(v18 + 16);
                v134(v166, v183 + v133 * v132, isUniquelyReferenced_nonNull_native);
                sub_212A048CC();
                sub_212A04914();
                sub_212A04DAC();
                v135 = v191;
                if (*(_QWORD *)(v191 + 16))
                {
                  v185 = v134;
                  v186 = v133;
                  v187 = v132;
                  sub_212A009F0(&qword_253EFEEB8, (uint64_t (*)(uint64_t))MEMORY[0x24BEA55B8], MEMORY[0x24BEA55C8]);
                  swift_bridgeObjectRetain();
                  v136 = sub_212A04F80();
                  v137 = -1 << *(_BYTE *)(v135 + 32);
                  v138 = v136 & ~v137;
                  if (((*(_QWORD *)(v135 + 56 + ((v138 >> 3) & 0xFFFFFFFFFFFFF8)) >> v138) & 1) != 0)
                  {
                    v139 = ~v137;
                    v140 = v174[9];
                    v141 = (void (*)(char *, unint64_t, uint64_t))v174[2];
                    while (1)
                    {
                      v142 = v173;
                      v143 = v175;
                      v141(v173, *(_QWORD *)(v135 + 48) + v140 * v138, v175);
                      sub_212A009F0(&qword_254B5E0C0, (uint64_t (*)(uint64_t))MEMORY[0x24BEA55B8], MEMORY[0x24BEA55D0]);
                      v144 = sub_212A04F98();
                      v145 = (void (*)(char *, uint64_t))v174[1];
                      v145(v142, v143);
                      if ((v144 & 1) != 0)
                        break;
                      v138 = (v138 + 1) & v139;
                      if (((*(_QWORD *)(v135 + 56 + ((v138 >> 3) & 0xFFFFFFFFFFFFF8)) >> v138) & 1) == 0)
                        goto LABEL_201;
                    }
                    swift_bridgeObjectRelease();
                    v147 = v175;
                    v151 = v176;
                    v132 = v187;
                    isUniquelyReferenced_nonNull_native = v188;
                    v18 = v170;
LABEL_207:
                    ++v132;
                    v145(v151, v147);
                    (*(void (**)(char *, unint64_t))(v18 + 8))(v166, isUniquelyReferenced_nonNull_native);
                    v131 = v181;
                    if ((char *)v132 == v184)
                      goto LABEL_210;
                    continue;
                  }
LABEL_201:
                  swift_bridgeObjectRelease();
                  v132 = v187;
                  isUniquelyReferenced_nonNull_native = v188;
                  v18 = v170;
                  v134 = v185;
                  v133 = v186;
                }
                break;
              }
              v134(v164, (unint64_t)v166, isUniquelyReferenced_nonNull_native);
              v146 = v190;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v146 = sub_2129ECB84(0, *(_QWORD *)(v146 + 16) + 1, 1, v146);
              v147 = v175;
              v149 = *(_QWORD *)(v146 + 16);
              v148 = *(_QWORD *)(v146 + 24);
              if (v149 >= v148 >> 1)
                v146 = sub_2129ECB84(v148 > 1, v149 + 1, 1, v146);
              *(_QWORD *)(v146 + 16) = v149 + 1;
              (*(void (**)(unint64_t, char *, unint64_t))(v18 + 32))(v146 + v182 + v149 * v133, v164, isUniquelyReferenced_nonNull_native);
              v190 = v146;
              v150 = v174;
              v151 = v176;
              ((void (*)(char *, char *, uint64_t))v174[2])(v160, v176, v147);
              v152 = v173;
              sub_2129E7044();
              v145 = (void (*)(char *, uint64_t))v150[1];
              v145(v152, v147);
              goto LABEL_207;
            }
            v78 = v85;
          }
        }
      }
LABEL_135:
      v168 = (v84 - 1) & v84;
      v81 = __clz(__rbit64(v84)) + (v78 << 6);
    }
    i = v78;
    v86 = (uint64_t *)(*(_QWORD *)(v82 + 48) + 16 * v81);
    v88 = *v86;
    v87 = v86[1];
    v89 = *(_QWORD *)(*(_QWORD *)(v82 + 56) + 8 * v81);
    if (v89 >> 62)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v90 = sub_212A05250();
      swift_bridgeObjectRelease();
    }
    else
    {
      v90 = *(_QWORD *)((v89 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    if (v90 < 2)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v91 = sub_212A04D88();
      v92 = sub_212A05124();
      if (os_log_type_enabled(v91, v92))
      {
        v93 = swift_slowAlloc();
        v94 = swift_slowAlloc();
        v189 = v94;
        *(_DWORD *)v93 = v159;
        swift_bridgeObjectRelease();
        *(_QWORD *)(v93 + 4) = v90;
        swift_bridgeObjectRelease();
        *(_WORD *)(v93 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v93 + 14) = sub_2129F37AC(v88, v87, (uint64_t *)&v189);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2129E2000, v91, v92, "Input uso entity has %ld child nodes for edge %s, but SRR only expects exact 1 from MARRS", (uint8_t *)v93, 0x16u);
        swift_arrayDestroy();
        v95 = v94;
        v28 = MEMORY[0x24BEE4AF8];
        MEMORY[0x212BF7480](v95, -1, -1);
        v96 = v93;
        v15 = v172;
        MEMORY[0x212BF7480](v96, -1, -1);

      }
      else
      {
        swift_bridgeObjectRelease_n();

        swift_bridgeObjectRelease_n();
      }
    }
    if ((v89 & 0xC000000000000001) != 0)
    {
      MEMORY[0x212BF6F58](0, v89);
    }
    else
    {
      if (!*(_QWORD *)((v89 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_216;
      swift_retain();
    }
    swift_bridgeObjectRelease();
    v97 = sub_212A04CB0();
    swift_release();
    if (sub_212A04CF8() == 0x6E456F4E5F6F7375 && v98 == 0xEC00000079746974)
    {
      swift_bridgeObjectRelease();
      goto LABEL_172;
    }
    v100 = sub_212A052B0();
    swift_bridgeObjectRelease();
    if ((v100 & 1) != 0)
    {
LABEL_172:
      v118 = *(_QWORD *)(v97 + 16);
      v119 = *(_QWORD *)(v181 + 16);
      v120 = v119 + v118;
      if (__OFADD__(v119, v118))
        goto LABEL_217;
      v121 = swift_isUniquelyReferenced_nonNull_native();
      v122 = v181;
      if (!v121 || v120 > *(_QWORD *)(v181 + 24) >> 1)
      {
        if (v119 <= v120)
          v123 = v119 + v118;
        else
          v123 = v119;
        v122 = sub_2129ECB84(v121, v123, 1, v181);
      }
      if (*(_QWORD *)(v97 + 16))
      {
        v124 = *(_QWORD *)(v122 + 16);
        if ((*(_QWORD *)(v122 + 24) >> 1) - v124 < v118)
          goto LABEL_219;
        v125 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
        v126 = *(_QWORD *)(v18 + 72);
        v127 = v122 + v125 + v126 * v124;
        if (v97 + v125 < v127 + v126 * v118 && v127 < v97 + v125 + v126 * v118)
          goto LABEL_225;
        v80 = v122;
        swift_arrayInitWithCopy();
        if (v118)
        {
          v129 = *(_QWORD *)(v80 + 16);
          v57 = __OFADD__(v129, v118);
          v130 = v129 + v118;
          if (v57)
            goto LABEL_221;
          *(_QWORD *)(v80 + 16) = v130;
        }
      }
      else
      {
        v80 = v122;
        if (v118)
          goto LABEL_218;
      }
      swift_bridgeObjectRelease();
      isUniquelyReferenced_nonNull_native = v188;
      v78 = i;
      v77 = v168;
      continue;
    }
    break;
  }
  v189 = v28;
  v187 = *(_QWORD *)(v97 + 16);
  if (!v187)
  {
    v117 = v28;
LABEL_171:
    swift_bridgeObjectRelease();
    v97 = v117;
    goto LABEL_172;
  }
  v101 = 0;
  while (v101 < *(_QWORD *)(v97 + 16))
  {
    v102 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    v103 = *(_QWORD *)(v18 + 72);
    (*(void (**)(char *, unint64_t, unint64_t))(v18 + 16))(v184, v97 + v102 + v103 * v101, v188);
    v104 = (uint64_t)v185;
    sub_212A048F0();
    v105 = v186;
    (*(void (**)(char *, _QWORD, uint64_t))(v183 + 104))(v15, v182, v186);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v105);
    v106 = v9 + *(int *)(v179 + 48);
    sub_212A0096C(v104, v9);
    sub_212A0096C((uint64_t)v15, v106);
    if (__swift_getEnumTagSinglePayload(v9, 1, v105) == 1)
    {
      if (__swift_getEnumTagSinglePayload(v106, 1, v105) == 1)
      {
        sub_212A009B4(v9, &qword_253EFED78);
        sub_212A009B4((uint64_t)v15, &qword_253EFED78);
        sub_212A009B4((uint64_t)v185, &qword_253EFED78);
LABEL_162:
        v113 = *(void (**)(char *, char *, unint64_t))(v18 + 32);
        v113(v177, v184, v188);
        v114 = v189;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2129FED44(0, *(_QWORD *)(v114 + 16) + 1, 1);
          v114 = v189;
        }
        v116 = *(_QWORD *)(v114 + 16);
        v115 = *(_QWORD *)(v114 + 24);
        if (v116 >= v115 >> 1)
        {
          sub_2129FED44(v115 > 1, v116 + 1, 1);
          v114 = v189;
        }
        *(_QWORD *)(v114 + 16) = v116 + 1;
        v113((char *)(v114 + v102 + v116 * v103), v177, v188);
        v189 = v114;
        v18 = v170;
        v9 = v180;
        goto LABEL_167;
      }
      goto LABEL_159;
    }
    v107 = v171;
    sub_212A0096C(v9, v171);
    if (__swift_getEnumTagSinglePayload(v106, 1, v105) == 1)
    {
      (*(void (**)(uint64_t, uint64_t))(v183 + 8))(v107, v105);
      v15 = v172;
LABEL_159:
      sub_212A009B4(v9, &qword_253EFED80);
      sub_212A009B4((uint64_t)v15, &qword_253EFED78);
      sub_212A009B4((uint64_t)v185, &qword_253EFED78);
      goto LABEL_160;
    }
    v108 = v183;
    v109 = v167;
    (*(void (**)(char *, uint64_t, uint64_t))(v183 + 32))(v167, v106, v105);
    sub_212A009F0(&qword_254B5E760, (uint64_t (*)(uint64_t))MEMORY[0x24BE9F928], MEMORY[0x24BE9F938]);
    v110 = sub_212A04F98();
    v111 = *(void (**)(uint64_t, uint64_t))(v108 + 8);
    v111(v107, v186);
    v112 = v109;
    v9 = v180;
    v111((uint64_t)v112, v186);
    sub_212A009B4(v9, &qword_253EFED78);
    v15 = v172;
    sub_212A009B4((uint64_t)v172, &qword_253EFED78);
    sub_212A009B4((uint64_t)v185, &qword_253EFED78);
    if ((v110 & 1) != 0)
      goto LABEL_162;
LABEL_160:
    (*(void (**)(char *, unint64_t))(v18 + 8))(v184, v188);
LABEL_167:
    if (v187 == ++v101)
    {
      v117 = v189;
      v28 = MEMORY[0x24BEE4AF8];
      goto LABEL_171;
    }
  }
  __break(1u);
LABEL_216:
  __break(1u);
LABEL_217:
  __break(1u);
LABEL_218:
  __break(1u);
LABEL_219:
  __break(1u);
LABEL_220:
  __break(1u);
LABEL_221:
  __break(1u);
LABEL_222:
  __break(1u);
LABEL_223:
  __break(1u);
LABEL_224:
  __break(1u);
LABEL_225:
  sub_212A0525C();
  __break(1u);
LABEL_226:
  result = sub_212A052C8();
  __break(1u);
  return result;
}

uint64_t sub_2129FD168(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v24;
  char *v25;
  int v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;

  v2 = sub_212A048E4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v25 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED80);
  MEMORY[0x24BDAC7A8](v29);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED78);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v24 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v24 - v14;
  v16 = *(_QWORD *)(a1 + 16);
  if (!v16)
    return v16;
  v17 = *(_QWORD *)(sub_212A0492C() - 8);
  v18 = a1 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
  v28 = *MEMORY[0x24BE9F918];
  v27 = *(_QWORD *)(v17 + 72);
  v24 = a1;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_212A048F0();
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v13, v28, v2);
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v2);
    v19 = (uint64_t)&v6[*(int *)(v29 + 48)];
    sub_212A0096C((uint64_t)v15, (uint64_t)v6);
    sub_212A0096C((uint64_t)v13, v19);
    if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v2) == 1)
      break;
    sub_212A0096C((uint64_t)v6, (uint64_t)v10);
    if (__swift_getEnumTagSinglePayload(v19, 1, v2) == 1)
    {
      sub_212A009B4((uint64_t)v13, &qword_253EFED78);
      sub_212A009B4((uint64_t)v15, &qword_253EFED78);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v10, v2);
      goto LABEL_8;
    }
    v20 = v25;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v25, v19, v2);
    sub_212A009F0(&qword_254B5E760, (uint64_t (*)(uint64_t))MEMORY[0x24BE9F928], MEMORY[0x24BE9F938]);
    v26 = sub_212A04F98();
    v21 = v3;
    v22 = *(void (**)(char *, uint64_t))(v3 + 8);
    v22(v20, v2);
    sub_212A009B4((uint64_t)v13, &qword_253EFED78);
    sub_212A009B4((uint64_t)v15, &qword_253EFED78);
    v22(v10, v2);
    v3 = v21;
    sub_212A009B4((uint64_t)v6, &qword_253EFED78);
    if ((v26 & 1) != 0)
      goto LABEL_12;
LABEL_10:
    v18 += v27;
    if (!--v16)
      goto LABEL_13;
  }
  sub_212A009B4((uint64_t)v13, &qword_253EFED78);
  sub_212A009B4((uint64_t)v15, &qword_253EFED78);
  if (__swift_getEnumTagSinglePayload(v19, 1, v2) != 1)
  {
LABEL_8:
    sub_212A009B4((uint64_t)v6, &qword_253EFED80);
    goto LABEL_10;
  }
  sub_212A009B4((uint64_t)v6, &qword_253EFED78);
LABEL_12:
  v16 = 1;
LABEL_13:
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_2129FD4CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t i;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED78);
  MEMORY[0x24BDAC7A8](v3);
  v44 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_212A0492C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v38 - v10;
  v39 = v1;
  v12 = sub_212A04D88();
  v13 = sub_212A0510C();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_2129E2000, v12, v13, "Query with UsoNoEntity pathway", v14, 2u);
    MEMORY[0x212BF7480](v14, -1, -1);
  }

  v15 = *(_QWORD *)(a1 + 16);
  if (v15)
  {
    v41 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v16 = a1 + v41;
    v40 = *(_QWORD *)(v6 + 72);
    swift_bridgeObjectRetain();
    v42 = v6;
    v43 = v5;
    do
    {
      v49 = v15;
      v50 = sub_212A04914();
      v51 = v17;
      swift_bridgeObjectRetain();
      sub_212A05010();
      swift_bridgeObjectRelease();
      v47 = v51;
      v48 = v50;
      v18 = sub_212A048CC();
      v45 = v19;
      v46 = v18;
      sub_212A04920();
      sub_212A048D8();
      sub_212A048F0();
      v21 = v42;
      v20 = v43;
      sub_212A048FC();
      v22 = v20;
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v9, v11, v20);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        a1 = sub_2129ECB84(0, *(_QWORD *)(a1 + 16) + 1, 1, a1);
      v24 = *(_QWORD *)(a1 + 16);
      v23 = *(_QWORD *)(a1 + 24);
      if (v24 >= v23 >> 1)
        a1 = sub_2129ECB84(v23 > 1, v24 + 1, 1, a1);
      *(_QWORD *)(a1 + 16) = v24 + 1;
      v25 = v40;
      (*(void (**)(unint64_t, char *, uint64_t))(v21 + 32))(a1 + v41 + v24 * v40, v9, v22);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v22);
      v16 += v25;
      v15 = v49 - 1;
    }
    while (v49 != 1);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  v26 = swift_bridgeObjectRetain();
  v27 = sub_2129FD960(v26);
  result = swift_bridgeObjectRelease();
  v50 = MEMORY[0x24BEE4AF8];
  if (!(v27 >> 62))
  {
    v29 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v29)
      goto LABEL_14;
LABEL_28:
    swift_bridgeObjectRelease();
    v37 = MEMORY[0x24BEE4AF8];
LABEL_29:
    swift_bridgeObjectRelease();
    return v37;
  }
  swift_bridgeObjectRetain();
  v29 = sub_212A05250();
  result = swift_bridgeObjectRelease();
  if (!v29)
    goto LABEL_28;
LABEL_14:
  if (v29 >= 1)
  {
    v49 = a1;
    for (i = 0; i != v29; ++i)
    {
      if ((v27 & 0xC000000000000001) != 0)
        v31 = (id)MEMORY[0x212BF6F58](i, v27);
      else
        v31 = *(id *)(v27 + 8 * i + 32);
      v32 = v31;
      sub_212A04E30();
      v33 = sub_212A04CF8();
      v35 = v34;
      swift_release();
      if (v33 == 0xD000000000000011 && v35 == 0x8000000212A06B50)
      {

        swift_bridgeObjectRelease();
      }
      else
      {
        v36 = sub_212A052B0();
        swift_bridgeObjectRelease();
        if ((v36 & 1) != 0)
        {

        }
        else
        {
          sub_212A05208();
          sub_212A05220();
          sub_212A0522C();
          sub_212A05214();
        }
      }
    }
    swift_bridgeObjectRelease();
    v37 = v50;
    goto LABEL_29;
  }
  __break(1u);
  return result;
}

uint64_t sub_2129FD960(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  _QWORD v25[3];
  uint64_t v26[3];
  uint64_t v27;

  v2 = sub_212A04DD0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BEE4AF8];
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    v7 = *(_QWORD *)(sub_212A0492C() - 8);
    v8 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    v9 = *(_QWORD *)(v7 + 72);
    v25[1] = a1;
    swift_bridgeObjectRetain();
    do
    {
      sub_212A048CC();
      sub_212A04914();
      sub_212A04DAC();
      v10 = sub_2129FE700((uint64_t)v5);
      if (v10)
      {
        v11 = v10;
        MEMORY[0x212BF6E08]();
        if (*(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_212A050D0();
        sub_212A050F4();
        sub_212A050C4();

      }
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v8 += v9;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    v12 = sub_212A04D88();
    v13 = sub_212A05118();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v26[0] = v15;
      *(_DWORD *)v14 = 136315138;
      swift_beginAccess();
      v16 = sub_212A04EF0();
      v17 = swift_bridgeObjectRetain();
      v18 = MEMORY[0x212BF6E2C](v17, v16);
      v20 = v19;
      swift_bridgeObjectRelease();
      v25[2] = sub_2129F37AC(v18, v20, v26);
      sub_212A05160();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2129E2000, v12, v13, "queryByMARRSSpans entities: %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BF7480](v15, -1, -1);
      MEMORY[0x212BF7480](v14, -1, -1);
    }

    swift_beginAccess();
    return v27;
  }
  else
  {
    v22 = sub_212A04D88();
    v23 = sub_212A05118();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_2129E2000, v22, v23, "usoIdentifiers are empty", v24, 2u);
      MEMORY[0x212BF7480](v24, -1, -1);
    }

    return MEMORY[0x24BEE4AF8];
  }
}

uint64_t sub_2129FDCB8()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, uint64_t);
  char *v31;
  void (*v32)(char *, char *, uint64_t);
  unint64_t v33;
  unint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  _QWORD v39[3];
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;

  v1 = v0;
  v2 = sub_212A048E4();
  v48 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v40 = (char *)v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED80);
  MEMORY[0x24BDAC7A8](v47);
  v5 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED78);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v41 = (char *)v39 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v50 = (uint64_t)v39 - v12;
  v51 = sub_212A0492C();
  v13 = *(_QWORD *)(v51 - 8);
  v14 = MEMORY[0x24BDAC7A8](v51);
  v42 = (char *)v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v49 = (char *)v39 - v16;
  v17 = sub_212A04CE0();
  v18 = sub_2129F1F0C(1701667182, 0xE400000000000000, v17);
  swift_bridgeObjectRelease();
  if (!v18)
    return 0;
  if (v18 >> 62)
    goto LABEL_30;
  v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v19)
  {
LABEL_31:
    swift_bridgeObjectRelease();
    return v19;
  }
LABEL_4:
  v39[2] = v1;
  sub_2129F7390(0, (v18 & 0xC000000000000001) == 0, v18);
  if ((v18 & 0xC000000000000001) != 0)
  {
    v20 = MEMORY[0x212BF6F58](0, v18);
  }
  else
  {
    v20 = *(_QWORD *)(v18 + 32);
    swift_retain();
  }
  swift_bridgeObjectRelease();
  v39[1] = v20;
  v18 = v20;
  v21 = sub_212A04CB0();
  v19 = MEMORY[0x24BEE4AF8];
  v52 = MEMORY[0x24BEE4AF8];
  v46 = *(_QWORD *)(v21 + 16);
  if (v46)
  {
    v1 = 0;
    v44 = *MEMORY[0x24BE9F8F8];
    v43 = v9;
    v22 = (uint64_t)v41;
    v45 = v21;
    while (1)
    {
      if (v1 >= *(_QWORD *)(v21 + 16))
      {
        __break(1u);
LABEL_30:
        swift_bridgeObjectRetain();
        v19 = sub_212A05250();
        swift_bridgeObjectRelease();
        if (!v19)
          goto LABEL_31;
        goto LABEL_4;
      }
      v23 = (uint64_t)v9;
      v24 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
      v25 = *(_QWORD *)(v13 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v49, v21 + v24 + v25 * v1, v51);
      v26 = v50;
      sub_212A048F0();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v48 + 104))(v22, v44, v2);
      __swift_storeEnumTagSinglePayload(v22, 0, 1, v2);
      v27 = (uint64_t)&v5[*(int *)(v47 + 48)];
      sub_212A0096C(v26, (uint64_t)v5);
      sub_212A0096C(v22, v27);
      if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v2) == 1)
        break;
      v9 = (char *)v23;
      sub_212A0096C((uint64_t)v5, v23);
      if (__swift_getEnumTagSinglePayload(v27, 1, v2) == 1)
      {
        (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v23, v2);
LABEL_14:
        sub_212A009B4((uint64_t)v5, &qword_253EFED80);
        v18 = (unint64_t)&qword_253EFED78;
        sub_212A009B4(v22, &qword_253EFED78);
        sub_212A009B4(v50, &qword_253EFED78);
        goto LABEL_21;
      }
      v28 = v48;
      v29 = v40;
      (*(void (**)(char *, uint64_t, uint64_t))(v48 + 32))(v40, v27, v2);
      sub_212A009F0(&qword_254B5E760, (uint64_t (*)(uint64_t))MEMORY[0x24BE9F928], MEMORY[0x24BE9F938]);
      v18 = sub_212A04F98();
      v30 = *(void (**)(char *, uint64_t))(v28 + 8);
      v30(v43, v2);
      v31 = v29;
      v22 = (uint64_t)v41;
      v30(v31, v2);
      v9 = v43;
      sub_212A009B4((uint64_t)v5, &qword_253EFED78);
      sub_212A009B4(v22, &qword_253EFED78);
      sub_212A009B4(v50, &qword_253EFED78);
      if ((v18 & 1) != 0)
        goto LABEL_16;
LABEL_21:
      (*(void (**)(char *, uint64_t))(v13 + 8))(v49, v51);
LABEL_22:
      ++v1;
      v21 = v45;
      if (v46 == v1)
      {
        v19 = v52;
        goto LABEL_25;
      }
    }
    v9 = (char *)v23;
    if (__swift_getEnumTagSinglePayload(v27, 1, v2) == 1)
    {
      sub_212A009B4((uint64_t)v5, &qword_253EFED78);
      sub_212A009B4(v22, &qword_253EFED78);
      sub_212A009B4(v50, &qword_253EFED78);
LABEL_16:
      v32 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
      v32(v42, v49, v51);
      v18 = v52;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2129FED44(0, *(_QWORD *)(v18 + 16) + 1, 1);
        v18 = v52;
      }
      v34 = *(_QWORD *)(v18 + 16);
      v33 = *(_QWORD *)(v18 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_2129FED44(v33 > 1, v34 + 1, 1);
        v18 = v52;
      }
      *(_QWORD *)(v18 + 16) = v34 + 1;
      v32((char *)(v18 + v24 + v34 * v25), v42, v51);
      v52 = v18;
      v9 = v43;
      v22 = (uint64_t)v41;
      goto LABEL_22;
    }
    goto LABEL_14;
  }
LABEL_25:
  swift_bridgeObjectRelease();
  swift_retain();
  v35 = sub_212A04D88();
  v36 = sub_212A05118();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v37 = 134217984;
    v52 = *(_QWORD *)(v19 + 16);
    sub_212A05160();
    swift_release();
    _os_log_impl(&dword_2129E2000, v35, v36, "Found %ld csm uso identifier(s).", v37, 0xCu);
    MEMORY[0x212BF7480](v37, -1, -1);
  }
  else
  {
    swift_release();
  }

  swift_release();
  return v19;
}

uint64_t sub_2129FE304(unint64_t *a1, uint64_t a2)
{
  _QWORD *v4;
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
  NSObject *v15;
  os_log_type_t v16;
  char *v17;
  uint8_t *v18;
  uint8_t *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  void (*v25)(uint64_t, char *, uint64_t);
  uint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t result;
  uint64_t v43;
  unint64_t *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, char *, uint64_t);
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v53 = sub_212A04DD0();
  v4 = *(_QWORD **)(v53 - 8);
  v5 = MEMORY[0x24BDAC7A8](v53);
  v49 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v43 - v7;
  v9 = sub_212A0492C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v52 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v43 - v13;
  v15 = sub_212A04D88();
  v16 = sub_212A0510C();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = v14;
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_2129E2000, v15, v16, "Sorting Marrs results with marrs and then saliency scores", v18, 2u);
    v19 = v18;
    v14 = v17;
    MEMORY[0x212BF7480](v19, -1, -1);
  }

  sub_212A009F0(&qword_253EFEEB8, (uint64_t (*)(uint64_t))MEMORY[0x24BEA55B8], MEMORY[0x24BEA55C8]);
  v55 = sub_212A04F74();
  v20 = *(_QWORD *)(a2 + 16);
  if (v20)
  {
    v43 = a2;
    v44 = a1;
    v21 = (char *)(a2 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)));
    v22 = *(_QWORD *)(v10 + 72);
    v48 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
    swift_bridgeObjectRetain();
    v23 = v49;
    v46 = v22;
    v47 = v10;
    v45 = v14;
    while (1)
    {
      v50 = v21;
      v51 = v20;
      v24 = v48;
      v48(v14, v21, v9);
      sub_212A048CC();
      sub_212A04914();
      sub_212A04DAC();
      v25 = (void (*)(uint64_t, char *, uint64_t))v4[2];
      v25(v23, v8, v53);
      v24(v52, v14, v9);
      v26 = v55;
      swift_isUniquelyReferenced_nonNull_native();
      v54 = v26;
      v55 = 0x8000000000000000;
      v27 = sub_2129F3FB8(v23);
      if (__OFADD__(*(_QWORD *)(v26 + 16), (v28 & 1) == 0))
        break;
      v29 = v27;
      v30 = v28;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E768);
      v31 = sub_212A05238();
      v23 = v49;
      v32 = v47;
      if ((v31 & 1) != 0)
      {
        v33 = sub_2129F3FB8(v49);
        if ((v30 & 1) != (v34 & 1))
          goto LABEL_18;
        v29 = v33;
      }
      v35 = (_QWORD *)v54;
      if ((v30 & 1) != 0)
      {
        v36 = v46;
        (*(void (**)(unint64_t, char *, uint64_t))(v32 + 40))(*(_QWORD *)(v54 + 56) + v29 * v46, v52, v9);
      }
      else
      {
        *(_QWORD *)(v54 + 8 * (v29 >> 6) + 64) |= 1 << v29;
        v25(v35[6] + v4[9] * v29, (char *)v23, v53);
        v36 = v46;
        (*(void (**)(unint64_t, char *, uint64_t))(v32 + 32))(v35[7] + v29 * v46, v52, v9);
        v37 = v35[2];
        v38 = __OFADD__(v37, 1);
        v39 = v37 + 1;
        if (v38)
          goto LABEL_17;
        v35[2] = v39;
      }
      v55 = v54;
      swift_bridgeObjectRelease();
      v40 = (void (*)(uint64_t, uint64_t))v4[1];
      v41 = v53;
      v40(v23, v53);
      v40((uint64_t)v8, v41);
      v14 = v45;
      (*(void (**)(char *, uint64_t))(v32 + 8))(v45, v9);
      v21 = &v50[v36];
      v20 = v51 - 1;
      if (v51 == 1)
      {
        swift_bridgeObjectRelease();
        a1 = v44;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    result = sub_212A052C8();
    __break(1u);
  }
  else
  {
LABEL_15:
    sub_2129FECB8(a1, &v55);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_2129FE700(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v3 = sub_212A04DD0();
  v29 = *(_QWORD *)(v3 - 8);
  v30 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (uint64_t *)(v1 + OBJC_IVAR____TtC21SiriReferenceResolver10RRResolver_entities);
  swift_beginAccess();
  v7 = *v6;
  if ((unint64_t)*v6 >> 62)
  {
LABEL_26:
    swift_bridgeObjectRetain();
    v8 = sub_212A05250();
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      v28 = v7 & 0xC000000000000001;
      v9 = 4;
      do
      {
        if (v28)
          v10 = (id)MEMORY[0x212BF6F58](v9 - 4, v7);
        else
          v10 = *(id *)(v7 + 8 * v9);
        v11 = v10;
        v12 = v9 - 3;
        if (__OFADD__(v9 - 4, 1))
        {
          __break(1u);
          goto LABEL_26;
        }
        v13 = sub_212A04DB8();
        v14 = a1;
        v16 = v15;
        if (v13 == sub_212A04E54() && v16 == v17)
        {
          swift_bridgeObjectRelease_n();
          (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v5, v14, v30);
          a1 = v14;
        }
        else
        {
          v19 = sub_212A052B0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v5, v14, v30);
          a1 = v14;
          if ((v19 & 1) == 0)
          {
            (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v30);
            goto LABEL_20;
          }
        }
        v20 = a1;
        v21 = sub_212A04DC4();
        v23 = v22;
        if (v21 == sub_212A04E90() && v23 == v24)
        {
          swift_bridgeObjectRelease_n();
          (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v30);
LABEL_23:
          swift_bridgeObjectRelease();
          return v11;
        }
        v26 = sub_212A052B0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v30);
        a1 = v20;
        if ((v26 & 1) != 0)
          goto LABEL_23;
LABEL_20:

        ++v9;
      }
      while (v12 != v8);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

BOOL sub_2129FE98C(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  char v24;
  char v25;
  uint64_t v26;
  double v27;
  char v28;
  char v29;
  double v30;
  double v31;
  _BOOL8 v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v6 = sub_212A0492C();
  v37 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED88);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v36 - v13;
  v15 = sub_212A04DD0();
  v40 = *(_QWORD *)(v15 - 8);
  v41 = v15;
  v16 = MEMORY[0x24BDAC7A8](v15);
  v39 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v36 - v18;
  v20 = *a1;
  v42 = *a2;
  sub_212A04E54();
  v36 = v20;
  sub_212A04E90();
  sub_212A04DAC();
  v38 = a3;
  sub_2129F20B4((uint64_t)v19, *a3, (uint64_t)v14);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v6))
  {
    sub_212A009B4((uint64_t)v14, &qword_253EFED88);
    v21 = 0.0;
    v22 = v37;
  }
  else
  {
    v22 = v37;
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v8, v14, v6);
    sub_212A009B4((uint64_t)v14, &qword_253EFED88);
    v23 = COERCE_DOUBLE(sub_212A048D8());
    v25 = v24;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v6);
    if ((v25 & 1) != 0)
      v21 = 0.0;
    else
      v21 = v23;
  }
  sub_212A04E54();
  sub_212A04E90();
  v26 = (uint64_t)v39;
  sub_212A04DAC();
  sub_2129F20B4(v26, *v38, (uint64_t)v12);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v6))
  {
    sub_212A009B4((uint64_t)v12, &qword_253EFED88);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v8, v12, v6);
    sub_212A009B4((uint64_t)v12, &qword_253EFED88);
    v27 = COERCE_DOUBLE(sub_212A048D8());
    v29 = v28;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v6);
    if ((v29 & 1) == 0)
    {
      v30 = v27;
      if (v21 != v27)
        goto LABEL_14;
      goto LABEL_12;
    }
  }
  if (v21 != 0.0)
  {
    v30 = 0.0;
    goto LABEL_14;
  }
LABEL_12:
  sub_212A04EB4();
  v21 = v31;
  sub_212A04EB4();
LABEL_14:
  v32 = v30 < v21;
  v33 = v41;
  v34 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
  v34(v26, v41);
  v34((uint64_t)v19, v33);
  return v32;
}

uint64_t sub_2129FECB8(unint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v6;
  uint64_t v8[2];

  v4 = *a1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v4;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v4 & 0x8000000000000000) != 0
    || (v4 & 0x4000000000000000) != 0)
  {
    sub_212A045B0(v4);
  }
  v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v8[0] = (v4 & 0xFFFFFFFFFFFFFF8) + 32;
  v8[1] = v6;
  sub_2129FEEA0(v8, a2);
  return sub_212A050C4();
}

size_t sub_2129FED44(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_2129FED60(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

size_t sub_2129FED60(size_t result, int64_t a2, char a3, uint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E358);
  v10 = *(_QWORD *)(sub_212A0492C() - 8);
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
  v15 = *(unsigned __int8 *)(*(_QWORD *)(sub_212A0492C() - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = (unint64_t)v13 + v16;
  v18 = a4 + v16;
  if ((v5 & 1) != 0)
  {
    sub_2129F7508(v18, v8, v17);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2129F762C(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

void sub_2129FEEA0(uint64_t *a1, uint64_t *a2)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  uint64_t v52;
  char *v53;
  double v54;
  char v55;
  char v56;
  char *v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  double v67;
  char v68;
  char v69;
  char *v70;
  double v71;
  char *v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  _BOOL4 v78;
  uint64_t v79;
  void (*v80)(char *, uint64_t);
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  id v92;
  id v93;
  uint64_t v94;
  unint64_t v95;
  char v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  double v106;
  char v107;
  char v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  char v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  double v121;
  char v122;
  char v123;
  void (*v124)(char *, uint64_t);
  char *v125;
  uint64_t v126;
  double v127;
  double v128;
  BOOL v129;
  void (*v130)(uint64_t, uint64_t);
  uint64_t v131;
  uint64_t v132;
  id v133;
  void *v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t *v140;
  unint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  BOOL v152;
  unint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t *v159;
  uint64_t v160;
  uint64_t v161;
  BOOL v162;
  uint64_t v163;
  char v164;
  uint64_t *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  BOOL v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  unint64_t v180;
  uint64_t v181;
  char *v182;
  uint64_t v183;
  uint64_t *v184;
  uint64_t v185;
  uint64_t v186;
  unint64_t v187;
  _QWORD *v188;
  uint64_t v189;
  uint64_t v190;
  unint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  unint64_t v196;
  uint64_t v197;
  uint64_t v198;
  _QWORD *v199;
  unint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  char *v208;
  char *v209;
  uint64_t v210;
  uint64_t v211;
  id v212;
  char *v213;
  char *v214;
  char *v215;
  uint64_t v216;
  char *v217;
  uint64_t v218;
  char *v219;
  uint64_t v220;
  uint64_t v221;
  id v222;
  char *v223;
  uint64_t v224;
  char *v225;
  uint64_t v226;
  uint64_t *v227;
  uint64_t v228;
  void *v229;
  void *v230;
  uint64_t v231;

  v227 = a2;
  v226 = sub_212A0492C();
  v224 = *(_QWORD *)(v226 - 8);
  MEMORY[0x24BDAC7A8](v226);
  v217 = (char *)&v202 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED88);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v219 = (char *)&v202 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v228 = (uint64_t)&v202 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v209 = (char *)&v202 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v208 = (char *)&v202 - v11;
  v12 = sub_212A04DD0();
  v220 = *(_QWORD *)(v12 - 8);
  v221 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v202 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v202 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v202 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v202 - v22;
  v24 = a1[1];
  v25 = sub_212A05280();
  if (v25 >= v24)
  {
    if (v24 < 0)
      goto LABEL_180;
    if (v24)
      sub_2129FFD3C(0, v24, 1, a1, v227);
    return;
  }
  v26 = v25;
  v27 = sub_2129F73B8(v24 / 2);
  v214 = v28;
  v231 = v27;
  v210 = v24;
  v204 = a1;
  if (v24 <= 0)
    goto LABEL_142;
  v205 = v26;
  v29 = 0;
  v30 = *a1;
  v203 = *a1 - 8;
  v31 = MEMORY[0x24BEE4AF8];
  v223 = v15;
  v215 = v23;
  v218 = v30;
  v225 = v18;
  v213 = v21;
  while (1)
  {
    v32 = v29 + 1;
    v211 = v29;
    if (v29 + 1 >= v24)
      goto LABEL_44;
    v33 = *(void **)(v30 + 8 * v32);
    v229 = *(void **)(v30 + 8 * v29);
    v34 = v229;
    v230 = v33;
    v35 = v29;
    v36 = v33;
    v37 = v34;
    v38 = v216;
    LODWORD(v207) = sub_2129FE98C((uint64_t *)&v230, (uint64_t *)&v229, v227);
    v216 = v38;
    if (v38)
    {
      swift_bridgeObjectRelease();

LABEL_140:
      if (v210 >= -1)
      {
LABEL_157:
        *(_QWORD *)((v231 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
        sub_212A050C4();
        swift_bridgeObjectRelease();
        return;
      }
      __break(1u);
LABEL_142:
      v31 = MEMORY[0x24BEE4AF8];
      v137 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_143:
      if (v137 >= 2)
      {
        v194 = *v204;
        v195 = v216;
        do
        {
          v196 = v137 - 2;
          if (v137 < 2)
            goto LABEL_175;
          if (!v194)
            goto LABEL_189;
          v197 = *(_QWORD *)(v31 + 32 + 16 * v196);
          v198 = *(_QWORD *)(v31 + 32 + 16 * (v137 - 1) + 8);
          sub_212A001B4((char *)(v194 + 8 * v197), (char *)(v194 + 8 * *(_QWORD *)(v31 + 32 + 16 * (v137 - 1))), v194 + 8 * v198, v214, v227);
          if (v195)
            goto LABEL_139;
          if (v198 < v197)
            goto LABEL_176;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_2129F8314(v31);
            v31 = v201;
          }
          if (v196 >= *(_QWORD *)(v31 + 16))
            goto LABEL_177;
          v199 = (_QWORD *)(v31 + 32 + 16 * v196);
          *v199 = v197;
          v199[1] = v198;
          v200 = *(_QWORD *)(v31 + 16);
          if (v137 > v200)
            goto LABEL_178;
          memmove((void *)(v31 + 32 + 16 * (v137 - 1)), (const void *)(v31 + 32 + 16 * v137), 16 * (v200 - v137));
          *(_QWORD *)(v31 + 16) = v200 - 1;
          v137 = v200 - 1;
        }
        while (v200 > 2);
      }
      swift_bridgeObjectRelease();
      if (v210 < -1)
        goto LABEL_185;
      goto LABEL_157;
    }

    v39 = v35;
    v32 = v35 + 2;
    v206 = v31;
    if (v32 >= v210)
      goto LABEL_33;
    while (1)
    {
      v40 = v30 + 8 * v39;
      v41 = *(void **)(v40 + 8);
      v42 = *(id *)(v40 + 16);
      v222 = v41;
      sub_212A04E54();
      sub_212A04E90();
      sub_212A04DAC();
      v43 = *v227;
      v44 = *(_QWORD *)(*v227 + 16);
      v212 = v42;
      if (!v44)
        goto LABEL_10;
      v45 = sub_2129F3FB8((uint64_t)v23);
      if ((v46 & 1) != 0)
      {
        v47 = *(_QWORD *)(v43 + 56) + *(_QWORD *)(v224 + 72) * v45;
        v48 = (uint64_t)v208;
        (*(void (**)(char *, unint64_t, uint64_t))(v224 + 16))(v208, v47, v226);
        v49 = 0;
      }
      else
      {
LABEL_10:
        v49 = 1;
        v48 = (uint64_t)v208;
      }
      v50 = v226;
      __swift_storeEnumTagSinglePayload(v48, v49, 1, v226);
      if (__swift_getEnumTagSinglePayload(v48, 1, v50))
      {
        sub_212A009B4(v48, &qword_253EFED88);
        v51 = 0.0;
      }
      else
      {
        v52 = v224;
        v53 = v217;
        (*(void (**)(char *, uint64_t, uint64_t))(v224 + 16))(v217, v48, v50);
        sub_212A009B4(v48, &qword_253EFED88);
        v54 = COERCE_DOUBLE(sub_212A048D8());
        v56 = v55;
        v57 = v53;
        v23 = v215;
        (*(void (**)(char *, uint64_t))(v52 + 8))(v57, v50);
        v51 = (v56 & 1) != 0 ? 0.0 : v54;
      }
      sub_212A04E54();
      sub_212A04E90();
      sub_212A04DAC();
      v58 = *v227;
      if (*(_QWORD *)(*v227 + 16) && (v59 = sub_2129F3FB8((uint64_t)v21), (v60 & 1) != 0))
      {
        v61 = *(_QWORD *)(v58 + 56) + *(_QWORD *)(v224 + 72) * v59;
        v62 = (uint64_t)v209;
        (*(void (**)(char *, unint64_t, uint64_t))(v224 + 16))(v209, v61, v226);
        v63 = 0;
      }
      else
      {
        v63 = 1;
        v62 = (uint64_t)v209;
      }
      v64 = v226;
      __swift_storeEnumTagSinglePayload(v62, v63, 1, v226);
      if (__swift_getEnumTagSinglePayload(v62, 1, v64))
      {
        sub_212A009B4(v62, &qword_253EFED88);
        v30 = v218;
      }
      else
      {
        v65 = v224;
        v66 = v217;
        (*(void (**)(char *, uint64_t, uint64_t))(v224 + 16))(v217, v62, v64);
        sub_212A009B4(v62, &qword_253EFED88);
        v67 = COERCE_DOUBLE(sub_212A048D8());
        v69 = v68;
        v70 = v66;
        v23 = v215;
        (*(void (**)(char *, uint64_t))(v65 + 8))(v70, v64);
        v30 = v218;
        if ((v69 & 1) == 0)
        {
          v71 = v67;
          if (v51 == v67)
            goto LABEL_26;
          v72 = v23;
          goto LABEL_28;
        }
      }
      if (v51 == 0.0)
      {
LABEL_26:
        v72 = v23;
        v73 = v212;
        sub_212A04EB4();
        v75 = v74;
        v76 = v222;
        sub_212A04EB4();
        v78 = v77 < v75;
        goto LABEL_29;
      }
      v72 = v23;
      v71 = 0.0;
LABEL_28:
      v78 = v71 < v51;
      v73 = v212;
      v76 = v222;
LABEL_29:
      v79 = v221;
      v80 = *(void (**)(char *, uint64_t))(v220 + 8);
      v80(v213, v221);
      v80(v72, v79);

      if (((v207 ^ v78) & 1) != 0)
        break;
      v81 = v39 + 3;
      ++v39;
      v23 = v72;
      v21 = v213;
      v31 = v206;
      if (v81 >= v210)
      {
        v32 = v210;
        goto LABEL_33;
      }
    }
    v32 = v39 + 2;
    v23 = v72;
    v21 = v213;
    v31 = v206;
LABEL_33:
    if ((v207 & 1) == 0)
    {
      v24 = v210;
      goto LABEL_43;
    }
    v29 = v211;
    if (v32 < v211)
      goto LABEL_184;
    v24 = v210;
    if (v211 < v32)
    {
      v82 = (uint64_t *)(v203 + 8 * v32);
      v83 = v32;
      v84 = v211;
      v85 = (uint64_t *)(v30 + 8 * v211);
      do
      {
        if (v84 != --v83)
        {
          if (!v30)
            goto LABEL_188;
          v86 = *v85;
          *v85 = *v82;
          *v82 = v86;
        }
        ++v84;
        --v82;
        ++v85;
      }
      while (v84 < v83);
LABEL_43:
      v29 = v211;
    }
LABEL_44:
    if (v32 >= v24)
      goto LABEL_86;
    if (__OFSUB__(v32, v29))
      goto LABEL_181;
    if (v32 - v29 < v205)
      break;
    v29 = v211;
LABEL_86:
    if (v32 < v29)
      goto LABEL_179;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2129F8234(0, *(_QWORD *)(v31 + 16) + 1, 1, (char *)v31);
      v31 = v192;
    }
    v136 = *(_QWORD *)(v31 + 16);
    v135 = *(_QWORD *)(v31 + 24);
    v137 = v136 + 1;
    v138 = v211;
    if (v136 >= v135 >> 1)
    {
      sub_2129F8234(v135 > 1, v136 + 1, 1, (char *)v31);
      v138 = v211;
      v31 = v193;
    }
    *(_QWORD *)(v31 + 16) = v137;
    v139 = v31 + 32;
    v140 = (uint64_t *)(v31 + 32 + 16 * v136);
    *v140 = v138;
    v140[1] = v32;
    v222 = (id)v32;
    if (v136)
    {
      while (1)
      {
        v141 = v137 - 1;
        if (v137 >= 4)
        {
          v146 = v139 + 16 * v137;
          v147 = *(_QWORD *)(v146 - 64);
          v148 = *(_QWORD *)(v146 - 56);
          v152 = __OFSUB__(v148, v147);
          v149 = v148 - v147;
          if (v152)
            goto LABEL_164;
          v151 = *(_QWORD *)(v146 - 48);
          v150 = *(_QWORD *)(v146 - 40);
          v152 = __OFSUB__(v150, v151);
          v144 = v150 - v151;
          v145 = v152;
          if (v152)
            goto LABEL_165;
          v153 = v137 - 2;
          v154 = (uint64_t *)(v139 + 16 * (v137 - 2));
          v156 = *v154;
          v155 = v154[1];
          v152 = __OFSUB__(v155, v156);
          v157 = v155 - v156;
          if (v152)
            goto LABEL_166;
          v152 = __OFADD__(v144, v157);
          v158 = v144 + v157;
          if (v152)
            goto LABEL_168;
          if (v158 >= v149)
          {
            v176 = (uint64_t *)(v139 + 16 * v141);
            v178 = *v176;
            v177 = v176[1];
            v152 = __OFSUB__(v177, v178);
            v179 = v177 - v178;
            if (v152)
              goto LABEL_174;
            v169 = v144 < v179;
            goto LABEL_123;
          }
        }
        else
        {
          if (v137 != 3)
          {
            v170 = *(_QWORD *)(v31 + 32);
            v171 = *(_QWORD *)(v31 + 40);
            v152 = __OFSUB__(v171, v170);
            v163 = v171 - v170;
            v164 = v152;
            goto LABEL_117;
          }
          v143 = *(_QWORD *)(v31 + 32);
          v142 = *(_QWORD *)(v31 + 40);
          v152 = __OFSUB__(v142, v143);
          v144 = v142 - v143;
          v145 = v152;
        }
        if ((v145 & 1) != 0)
          goto LABEL_167;
        v153 = v137 - 2;
        v159 = (uint64_t *)(v139 + 16 * (v137 - 2));
        v161 = *v159;
        v160 = v159[1];
        v162 = __OFSUB__(v160, v161);
        v163 = v160 - v161;
        v164 = v162;
        if (v162)
          goto LABEL_169;
        v165 = (uint64_t *)(v139 + 16 * v141);
        v167 = *v165;
        v166 = v165[1];
        v152 = __OFSUB__(v166, v167);
        v168 = v166 - v167;
        if (v152)
          goto LABEL_171;
        if (__OFADD__(v163, v168))
          goto LABEL_173;
        if (v163 + v168 >= v144)
        {
          v169 = v144 < v168;
LABEL_123:
          if (v169)
            v141 = v153;
          goto LABEL_125;
        }
LABEL_117:
        if ((v164 & 1) != 0)
          goto LABEL_170;
        v172 = (uint64_t *)(v139 + 16 * v141);
        v174 = *v172;
        v173 = v172[1];
        v152 = __OFSUB__(v173, v174);
        v175 = v173 - v174;
        if (v152)
          goto LABEL_172;
        if (v175 < v163)
          goto LABEL_134;
LABEL_125:
        v180 = v141 - 1;
        if (v141 - 1 >= v137)
        {
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
LABEL_180:
          __break(1u);
LABEL_181:
          __break(1u);
LABEL_182:
          __break(1u);
          goto LABEL_183;
        }
        v181 = v30;
        if (!v30)
          goto LABEL_187;
        v182 = v21;
        v183 = v31;
        v184 = (uint64_t *)(v139 + 16 * v180);
        v185 = *v184;
        v186 = v139;
        v187 = v141;
        v188 = (_QWORD *)(v139 + 16 * v141);
        v189 = v188[1];
        v190 = v216;
        sub_212A001B4((char *)(v181 + 8 * *v184), (char *)(v181 + 8 * *v188), v181 + 8 * v189, v214, v227);
        v216 = v190;
        if (v190)
        {
LABEL_139:
          swift_bridgeObjectRelease();
          goto LABEL_140;
        }
        if (v189 < v185)
          goto LABEL_161;
        if (v187 > *(_QWORD *)(v183 + 16))
          goto LABEL_162;
        *v184 = v185;
        *(_QWORD *)(v186 + 16 * v180 + 8) = v189;
        v191 = *(_QWORD *)(v183 + 16);
        if (v187 >= v191)
          goto LABEL_163;
        v31 = v183;
        v137 = v191 - 1;
        memmove(v188, v188 + 2, 16 * (v191 - 1 - v187));
        v139 = v186;
        *(_QWORD *)(v183 + 16) = v191 - 1;
        v169 = v191 > 2;
        v21 = v182;
        v23 = v215;
        v30 = v218;
        v18 = v225;
        if (!v169)
          goto LABEL_134;
      }
    }
    v137 = 1;
LABEL_134:
    v24 = v210;
    v29 = (uint64_t)v222;
    if ((uint64_t)v222 >= v210)
      goto LABEL_143;
  }
  v29 = v211;
  if (__OFADD__(v211, v205))
    goto LABEL_182;
  if (v211 + v205 >= v24)
    v87 = v24;
  else
    v87 = v211 + v205;
  if (v87 >= v211)
  {
    if (v32 == v87)
      goto LABEL_86;
    v206 = v31;
    v88 = v203 + 8 * v32;
    v207 = v87;
    while (1)
    {
      v89 = *(void **)(v30 + 8 * v32);
      v90 = v29;
      v212 = (id)v88;
      v222 = (id)v32;
      while (1)
      {
        v91 = *(void **)v88;
        v92 = v89;
        v93 = v91;
        sub_212A04E54();
        sub_212A04E90();
        sub_212A04DAC();
        v94 = *v227;
        if (!*(_QWORD *)(*v227 + 16))
          goto LABEL_58;
        v95 = sub_2129F3FB8((uint64_t)v18);
        if ((v96 & 1) != 0)
        {
          v97 = *(_QWORD *)(v94 + 56) + *(_QWORD *)(v224 + 72) * v95;
          v98 = v226;
          (*(void (**)(uint64_t, unint64_t, uint64_t))(v224 + 16))(v228, v97, v226);
          v99 = 0;
        }
        else
        {
LABEL_58:
          v99 = 1;
          v98 = v226;
        }
        v100 = v228;
        __swift_storeEnumTagSinglePayload(v228, v99, 1, v98);
        if (__swift_getEnumTagSinglePayload(v100, 1, v98))
        {
          sub_212A009B4(v228, &qword_253EFED88);
          v101 = 0.0;
        }
        else
        {
          v102 = v224;
          v103 = v98;
          v104 = v217;
          v105 = v228;
          (*(void (**)(char *, uint64_t, uint64_t))(v224 + 16))(v217, v228, v103);
          sub_212A009B4(v105, &qword_253EFED88);
          v106 = COERCE_DOUBLE(sub_212A048D8());
          v108 = v107;
          v109 = v103;
          v30 = v218;
          (*(void (**)(char *, uint64_t))(v102 + 8))(v104, v109);
          v101 = (v108 & 1) != 0 ? 0.0 : v106;
        }
        sub_212A04E54();
        sub_212A04E90();
        v110 = (uint64_t)v223;
        sub_212A04DAC();
        v111 = *v227;
        if (*(_QWORD *)(*v227 + 16))
        {
          v112 = sub_2129F3FB8(v110);
          v113 = (uint64_t)v219;
          if ((v114 & 1) != 0)
          {
            v115 = *(_QWORD *)(v111 + 56) + *(_QWORD *)(v224 + 72) * v112;
            v116 = v226;
            (*(void (**)(char *, unint64_t, uint64_t))(v224 + 16))(v219, v115, v226);
            v117 = 0;
            v18 = v225;
            goto LABEL_70;
          }
          v117 = 1;
        }
        else
        {
          v117 = 1;
          v113 = (uint64_t)v219;
        }
        v18 = v225;
        v116 = v226;
LABEL_70:
        __swift_storeEnumTagSinglePayload(v113, v117, 1, v116);
        if (__swift_getEnumTagSinglePayload(v113, 1, v116))
        {
          sub_212A009B4(v113, &qword_253EFED88);
        }
        else
        {
          v118 = v224;
          v119 = v217;
          (*(void (**)(char *, uint64_t, uint64_t))(v224 + 16))(v217, v113, v116);
          sub_212A009B4(v113, &qword_253EFED88);
          v120 = v116;
          v121 = COERCE_DOUBLE(sub_212A048D8());
          v123 = v122;
          v124 = *(void (**)(char *, uint64_t))(v118 + 8);
          v110 = (uint64_t)v223;
          v125 = v119;
          v18 = v225;
          v126 = v120;
          v30 = v218;
          v124(v125, v126);
          if ((v123 & 1) == 0)
          {
            v127 = v121;
            if (v101 == v121)
              goto LABEL_76;
            goto LABEL_78;
          }
        }
        if (v101 == 0.0)
        {
LABEL_76:
          sub_212A04EB4();
          v101 = v128;
          sub_212A04EB4();
          goto LABEL_78;
        }
        v127 = 0.0;
LABEL_78:
        v129 = v127 < v101;
        v130 = *(void (**)(uint64_t, uint64_t))(v220 + 8);
        v131 = v110;
        v132 = v221;
        v130(v131, v221);
        v130((uint64_t)v18, v132);

        if (!v129)
          break;
        v133 = v222;
        if (!v30)
          goto LABEL_186;
        v134 = *(void **)v88;
        v89 = *(void **)(v88 + 8);
        *(_QWORD *)v88 = v89;
        *(_QWORD *)(v88 + 8) = v134;
        v88 -= 8;
        if (v133 == (id)++v90)
          goto LABEL_83;
      }
      v133 = v222;
LABEL_83:
      v32 = (uint64_t)v133 + 1;
      v88 = (uint64_t)v212 + 8;
      v29 = v211;
      if (v32 == v207)
      {
        v32 = v207;
        v31 = v206;
        v21 = v213;
        v23 = v215;
        goto LABEL_86;
      }
    }
  }
LABEL_183:
  __break(1u);
LABEL_184:
  __break(1u);
LABEL_185:
  __break(1u);
LABEL_186:
  __break(1u);
LABEL_187:
  __break(1u);
LABEL_188:
  __break(1u);
LABEL_189:
  __break(1u);
}

void sub_2129FFD3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
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
  char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  double v34;
  char v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  double v46;
  char v47;
  char v48;
  void (*v49)(char *, uint64_t);
  char *v50;
  double v51;
  double v52;
  BOOL v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;

  v72 = a5;
  v61 = a1;
  v8 = sub_212A0492C();
  v71 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v63 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED88);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v66 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v73 = (uint64_t)&v59 - v13;
  v14 = sub_212A04DD0();
  v64 = *(_QWORD *)(v14 - 8);
  v65 = v14;
  v15 = MEMORY[0x24BDAC7A8](v14);
  v70 = (char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v59 - v17;
  v60 = a2;
  if (a3 == a2)
    return;
  v67 = *a4;
  v19 = v67 + 8 * a3 - 8;
  v69 = (char *)&v59 - v17;
  while (2)
  {
    v20 = *(void **)(v67 + 8 * a3);
    v21 = v61;
    v62 = v19;
    v68 = a3;
    do
    {
      v22 = *(void **)v19;
      v23 = v20;
      v24 = v22;
      sub_212A04E54();
      sub_212A04E90();
      sub_212A04DAC();
      v25 = *v72;
      if (*(_QWORD *)(*v72 + 16) && (v26 = sub_2129F3FB8((uint64_t)v18), (v27 & 1) != 0))
      {
        (*(void (**)(uint64_t, unint64_t, uint64_t))(v71 + 16))(v73, *(_QWORD *)(v25 + 56) + *(_QWORD *)(v71 + 72) * v26, v8);
        v28 = 0;
      }
      else
      {
        v28 = 1;
      }
      v29 = v73;
      __swift_storeEnumTagSinglePayload(v73, v28, 1, v8);
      if (__swift_getEnumTagSinglePayload(v29, 1, v8))
      {
        sub_212A009B4(v73, &qword_253EFED88);
        v30 = 0.0;
      }
      else
      {
        v31 = v71;
        v32 = v63;
        v33 = v73;
        (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v63, v73, v8);
        sub_212A009B4(v33, &qword_253EFED88);
        v34 = COERCE_DOUBLE(sub_212A048D8());
        v36 = v35;
        (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v8);
        if ((v36 & 1) != 0)
          v30 = 0.0;
        else
          v30 = v34;
      }
      sub_212A04E54();
      sub_212A04E90();
      v37 = (uint64_t)v70;
      sub_212A04DAC();
      v38 = *v72;
      if (*(_QWORD *)(*v72 + 16))
      {
        v39 = sub_2129F3FB8(v37);
        v18 = v69;
        if ((v40 & 1) != 0)
        {
          v41 = *(_QWORD *)(v38 + 56) + *(_QWORD *)(v71 + 72) * v39;
          v42 = (uint64_t)v66;
          (*(void (**)(char *, unint64_t, uint64_t))(v71 + 16))(v66, v41, v8);
          v43 = 0;
        }
        else
        {
          v43 = 1;
          v42 = (uint64_t)v66;
        }
      }
      else
      {
        v43 = 1;
        v42 = (uint64_t)v66;
        v18 = v69;
      }
      __swift_storeEnumTagSinglePayload(v42, v43, 1, v8);
      if (__swift_getEnumTagSinglePayload(v42, 1, v8))
      {
        sub_212A009B4(v42, &qword_253EFED88);
      }
      else
      {
        v44 = v71;
        v45 = v63;
        (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v63, v42, v8);
        sub_212A009B4(v42, &qword_253EFED88);
        v46 = COERCE_DOUBLE(sub_212A048D8());
        v48 = v47;
        v49 = *(void (**)(char *, uint64_t))(v44 + 8);
        v50 = v45;
        v18 = v69;
        v37 = (uint64_t)v70;
        v49(v50, v8);
        if ((v48 & 1) == 0)
        {
          v51 = v46;
          if (v30 != v46)
            goto LABEL_26;
          goto LABEL_24;
        }
      }
      if (v30 != 0.0)
      {
        v51 = 0.0;
        goto LABEL_26;
      }
LABEL_24:
      sub_212A04EB4();
      v30 = v52;
      sub_212A04EB4();
LABEL_26:
      v53 = v51 < v30;
      v54 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
      v55 = v37;
      v56 = v65;
      v54(v55, v65);
      v54((uint64_t)v18, v56);

      v57 = v68;
      if (!v53)
        break;
      if (!v67)
      {
        __break(1u);
        return;
      }
      v58 = *(void **)v19;
      v20 = *(void **)(v19 + 8);
      *(_QWORD *)v19 = v20;
      *(_QWORD *)(v19 + 8) = v58;
      v19 -= 8;
      ++v21;
    }
    while (v57 != v21);
    a3 = v57 + 1;
    v19 = v62 + 8;
    if (a3 != v60)
      continue;
    break;
  }
}

uint64_t sub_212A001B4(char *a1, char *a2, unint64_t a3, char *a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v15;
  char *v17;
  char *v20;
  unint64_t v21;
  char *v22;
  char *v23;
  void *v24;
  char *v25;
  id v26;
  id v27;
  BOOL v28;
  BOOL v29;
  char *v30;
  BOOL v31;
  BOOL v32;
  id *v33;
  unint64_t v34;
  id *v35;
  void *v36;
  id v37;
  id v38;
  BOOL v39;
  BOOL v40;
  char *v41;
  BOOL v42;
  char *v44;
  char *v45;
  void *v47;
  id v48;

  v6 = v5;
  v7 = a4;
  v9 = a1;
  v10 = a2 - a1;
  v11 = (a2 - a1) / 8;
  v12 = a3 - (_QWORD)a2;
  v13 = (uint64_t)(a3 - (_QWORD)a2) / 8;
  if (v11 >= v13)
  {
    sub_2129F7504(a2, (uint64_t)(a3 - (_QWORD)a2) / 8, a4);
    v17 = a2;
    v15 = &v7[8 * v13];
    if (v9 >= a2 || v12 < 8)
    {
LABEL_41:
      sub_2129F7504(v7, (v15 - v7) / 8, v17);
      return 1;
    }
    v45 = v7;
    v20 = (char *)(a3 - 8);
    v44 = v9;
    while (1)
    {
      v21 = (unint64_t)v15;
      v22 = v15 - 8;
      v48 = (id)*((_QWORD *)v15 - 1);
      v23 = v17;
      v25 = v17 - 8;
      v47 = (void *)*((_QWORD *)v17 - 1);
      v24 = v47;
      v26 = v48;
      v27 = v24;
      v28 = sub_2129FE98C((uint64_t *)&v48, (uint64_t *)&v47, a5);
      if (v5)
      {

        sub_2129F7504(v45, (uint64_t)(v21 - (_QWORD)v45) / 8, v23);
        return 1;
      }
      v29 = v28;
      v30 = v20 + 8;

      if (v29)
      {
        v31 = v30 != v23 || v20 >= v23;
        v17 = v25;
        v15 = (char *)v21;
        if (v31)
          goto LABEL_25;
      }
      else
      {
        v32 = v30 != (char *)v21 || (unint64_t)v20 >= v21;
        v25 = v22;
        v15 = v22;
        v17 = v23;
        if (v32)
LABEL_25:
          *(_QWORD *)v20 = *(_QWORD *)v25;
      }
      if (v17 <= v44)
      {
        v7 = v45;
        goto LABEL_41;
      }
      v20 -= 8;
      v7 = v45;
      if (v15 <= v45)
        goto LABEL_41;
    }
  }
  sub_2129F7504(a1, (a2 - a1) / 8, a4);
  v15 = &v7[8 * v11];
  if ((unint64_t)a2 >= a3 || v10 < 8)
  {
LABEL_7:
    v17 = v9;
    goto LABEL_41;
  }
  v33 = (id *)a2;
  while (1)
  {
    v34 = (unint64_t)v15;
    v35 = v33;
    v48 = *v33;
    v47 = *(void **)v7;
    v36 = v47;
    v37 = v48;
    v38 = v36;
    v39 = sub_2129FE98C((uint64_t *)&v48, (uint64_t *)&v47, a5);
    if (v6)
      break;
    v40 = v39;

    if (v40)
    {
      v41 = (char *)v35;
      v33 = v35 + 1;
      v42 = v9 == (char *)v35;
    }
    else
    {
      v41 = v7;
      v42 = v9 == v7;
      v7 += 8;
      v33 = v35;
    }
    v15 = (char *)v34;
    if (!v42)
      *(_QWORD *)v9 = *(_QWORD *)v41;
    v9 += 8;
    v6 = 0;
    if ((unint64_t)v7 >= v34 || (unint64_t)v33 >= a3)
      goto LABEL_7;
  }

  sub_2129F7504(v7, (uint64_t)(v34 - (_QWORD)v7) / 8, v9);
  return 1;
}

uint64_t sub_212A0045C(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = MEMORY[0x24BEE4B08];
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEEF8);
  result = sub_212A051CC();
  v3 = result;
  v24 = *(_QWORD *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return v3;
  }
  v4 = 0;
  v5 = result + 56;
  while (v4 < *(_QWORD *)(a1 + 16))
  {
    v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    v8 = *v6;
    v7 = v6[1];
    sub_212A0531C();
    swift_bridgeObjectRetain();
    sub_212A04F8C();
    result = sub_212A05334();
    v9 = -1 << *(_BYTE *)(v3 + 32);
    v10 = result & ~v9;
    v11 = v10 >> 6;
    v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
    v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      v14 = *(_QWORD *)(v3 + 48);
      v15 = (_QWORD *)(v14 + 16 * v10);
      v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (result = sub_212A052B0(), (result & 1) != 0))
      {
LABEL_11:
        result = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      v17 = ~v9;
      while (1)
      {
        v10 = (v10 + 1) & v17;
        v11 = v10 >> 6;
        v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
        v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          result = sub_212A052B0();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_11;
      }
    }
    *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
    v20 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    *v20 = v8;
    v20[1] = v7;
    v21 = *(_QWORD *)(v3 + 16);
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_27;
    *(_QWORD *)(v3 + 16) = v23;
LABEL_22:
    if (++v4 == v24)
      goto LABEL_25;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_212A00628(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v19;

  v5 = *v2;
  sub_212A0531C();
  swift_bridgeObjectRetain();
  sub_212A04F8C();
  v6 = sub_212A05334();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = *(_QWORD *)(v5 + 48);
  v10 = (_QWORD *)(v9 + 16 * v8);
  v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_212A052B0() & 1) == 0)
  {
    v15 = ~v7;
    do
    {
      v8 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_18;
      v16 = (_QWORD *)(v9 + 16 * v8);
      v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_212A052B0() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v2;
  v19 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2129E8554();
    v13 = v19;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v8);
  sub_212A007B4(v8);
  *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_212A007B4(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  BOOL v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_212A051A8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_212A0531C();
        swift_bridgeObjectRetain();
        sub_212A04F8C();
        v10 = sub_212A05334();
        swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 >= v9 && v2 >= (uint64_t)v11)
          {
LABEL_15:
            v14 = *(_QWORD *)(v3 + 48);
            v15 = (_OWORD *)(v14 + 16 * v2);
            v16 = (_OWORD *)(v14 + 16 * v6);
            v17 = v2 != v6 || v15 >= v16 + 1;
            v2 = v6;
            if (v17)
            {
              *v15 = *v16;
              v2 = v6;
            }
          }
        }
        else if (v11 >= v9 || v2 >= (uint64_t)v11)
        {
          goto LABEL_15;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v18 = *(_QWORD *)(v3 + 16);
  v19 = __OFSUB__(v18, 1);
  v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_212A0096C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_212A009B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_212A009F0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x212BF73E4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_3_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

BOOL OUTLINED_FUNCTION_4_5(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_5_8()
{
  return sub_212A04EF0();
}

uint64_t OUTLINED_FUNCTION_10_6()
{
  return sub_212A05118();
}

uint64_t OUTLINED_FUNCTION_12_5()
{
  return sub_212A04D88();
}

uint64_t OUTLINED_FUNCTION_14_4()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_16_2()
{
  JUMPOUT(0x212BF6E2CLL);
}

uint64_t sub_212A00ACC()
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
  unint64_t v10;
  uint64_t v11;
  void (*v12)(char *, unint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  _QWORD v24[2];
  char *v25;
  uint64_t v26;

  v0 = sub_212A0492C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED88);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_212A0486C();
  sub_212A04998();
  v7 = v26;
  swift_release();
  if (!v7)
    return 0;
  v8 = sub_212A04CEC();
  v9 = *(_QWORD *)(v8 + 16);
  if (!v9)
  {
    v17 = 1;
    goto LABEL_15;
  }
  v24[1] = v8;
  v25 = v6;
  v10 = v8 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  v11 = *(_QWORD *)(v1 + 72);
  v12 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
  swift_bridgeObjectRetain();
  while (1)
  {
    v12(v3, v10, v0);
    v13 = sub_212A04920();
    if (!v14)
      goto LABEL_10;
    v15 = v13 == 0x6C6F636F746F7270 && v14 == 0xE800000000000000;
    if (v15)
      break;
    v16 = sub_212A052B0();
    OUTLINED_FUNCTION_0();
    if ((v16 & 1) != 0)
      goto LABEL_14;
LABEL_10:
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    v10 += v11;
    if (!--v9)
    {
      OUTLINED_FUNCTION_12_6();
      v17 = 1;
      v6 = v25;
      goto LABEL_15;
    }
  }
  OUTLINED_FUNCTION_12_6();
LABEL_14:
  swift_bridgeObjectRelease();
  v6 = v25;
  (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v25, v3, v0);
  v17 = 0;
LABEL_15:
  __swift_storeEnumTagSinglePayload((uint64_t)v6, v17, 1, v0);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v0) == 1)
  {
    sub_212A0133C((uint64_t)v6);
    return 0;
  }
  v19 = sub_212A04914();
  v21 = v20;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  if (v19 == 0xD000000000000016 && (OUTLINED_FUNCTION_4_6(), v15) || (OUTLINED_FUNCTION_0_5() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_212A04B6C();
    OUTLINED_FUNCTION_51();
    sub_212A04B60();
    goto LABEL_24;
  }
  if (v19 == 0xD000000000000013 && (OUTLINED_FUNCTION_4_6(), v15) || (OUTLINED_FUNCTION_0_5() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_212A04A94();
    OUTLINED_FUNCTION_51();
    sub_212A04A88();
    goto LABEL_24;
  }
  if (v19 == 0xD000000000000020 && (OUTLINED_FUNCTION_4_6(), v15) || (OUTLINED_FUNCTION_0_5() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_212A04A04();
    OUTLINED_FUNCTION_51();
    sub_212A049F8();
    goto LABEL_24;
  }
  if (v19 == 0xD000000000000018 && v21 == 0x8000000212A07300 || (OUTLINED_FUNCTION_0_5() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_212A049B0();
    OUTLINED_FUNCTION_51();
    sub_212A049A4();
    goto LABEL_24;
  }
  if (v19 != 0xD000000000000018 || v21 != 0x8000000212A06C60)
  {
    v23 = OUTLINED_FUNCTION_0_5();
    OUTLINED_FUNCTION_0();
    if ((v23 & 1) != 0)
      goto LABEL_46;
    return 0;
  }
  swift_bridgeObjectRelease();
LABEL_46:
  sub_212A04B00();
  OUTLINED_FUNCTION_51();
  sub_212A04AF4();
LABEL_24:
  v18 = MEMORY[0x212BF66C4]();
  swift_release();
  return v18;
}

unint64_t sub_212A00EE4(uint8_t *a1)
{
  NSObject *v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30[3];
  unint64_t v31;

  v31 = MEMORY[0x24BEE4AF8];
  v3 = (uint64_t *)((char *)v1 + OBJC_IVAR____TtC21SiriReferenceResolver10RRResolver_entities);
  OUTLINED_FUNCTION_10_0();
  v4 = *v3;
  if ((unint64_t)*v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_212A05250();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v6 = &OBJC_IVAR____TtC21SiriReferenceResolver10RRResolver_logger;
  if (v5)
  {
    if (v5 < 1)
    {
      __break(1u);
      goto LABEL_29;
    }
    v7 = 0;
    v8 = v4 & 0xC000000000000001;
    v29 = v4;
    v28 = v5;
    v27 = v4 & 0xC000000000000001;
    do
    {
      if (v8)
        v9 = (id)MEMORY[0x212BF6F58](v7, v4);
      else
        v9 = *(id *)(v4 + 8 * v7 + 32);
      v10 = v9;
      static RREntityMatcher.entity(_:matches:entityFoundByMarrsIdentifier:)();
      if (v11)
      {
        v12 = v11;
        sub_212A04E30();
        v13 = sub_212A00ACC();
        swift_release();
        if (!v13)
        {
          v21 = v12;
          OUTLINED_FUNCTION_5_9();
        }
        static RREntityMatcher.entity(_:matches:entityFoundByMarrsIdentifier:)();
        if (!v14)
        {
          v22 = v12;
          OUTLINED_FUNCTION_5_9();
        }
        v15 = v14;
        v16 = sub_212A04D88();
        v17 = sub_212A05118();
        if (os_log_type_enabled(v16, v17))
        {
          v18 = OUTLINED_FUNCTION_3_0();
          v30[0] = OUTLINED_FUNCTION_3_0();
          *(_DWORD *)v18 = 136315138;
          sub_212A04E30();
          sub_212A04D04();
          v19 = sub_212A04FBC();
          *(_QWORD *)(v18 + 4) = sub_2129F37AC(v19, v20, v30);

          OUTLINED_FUNCTION_0();
          _os_log_impl(&dword_2129E2000, v16, v17, "RREntityMatcher found a new match: %s. Replacing common_AppEntity", (uint8_t *)v18, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_0_0();
        }

        v4 = v29;
        v23 = v15;
        MEMORY[0x212BF6E08]();
        v5 = v28;
        if (*(_QWORD *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          OUTLINED_FUNCTION_7_1();
        sub_212A050F4();
        sub_212A050C4();

        swift_release();
        v10 = v23;
        v8 = v27;
      }
      ++v7;

    }
    while (v5 != v7);
    swift_bridgeObjectRelease();
    v24 = v31;
  }
  else
  {
    swift_bridgeObjectRelease();
    v24 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain_n();
  v1 = sub_212A04D88();
  LOBYTE(v6) = sub_212A05118();
  if (os_log_type_enabled(v1, (os_log_type_t)v6))
  {
    a1 = (uint8_t *)OUTLINED_FUNCTION_3_0();
    *(_DWORD *)a1 = 134217984;
    if (!(v24 >> 62))
    {
      v25 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_25;
    }
LABEL_29:
    swift_bridgeObjectRetain();
    v25 = sub_212A05250();
    OUTLINED_FUNCTION_2();
LABEL_25:
    OUTLINED_FUNCTION_2();
    v30[0] = v25;
    sub_212A05160();
    OUTLINED_FUNCTION_2();
    _os_log_impl(&dword_2129E2000, v1, (os_log_type_t)v6, "result entity count: %ld", a1, 0xCu);
    OUTLINED_FUNCTION_0_0();
  }

  swift_bridgeObjectRelease_n();
  OUTLINED_FUNCTION_10_0();
  return v31;
}

uint64_t sub_212A0133C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return sub_212A052B0();
}

void OUTLINED_FUNCTION_5_9()
{
  JUMPOUT(0x212BF6E08);
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return sub_212A050F4();
}

uint64_t OUTLINED_FUNCTION_12_6()
{
  return swift_bridgeObjectRelease();
}

void sub_212A013D4(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_212A01448(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_212A014D0 + 4 * byte_212A06015[a2]))(0x74754F64656D6974);
}

uint64_t sub_212A014D0(uint64_t a1)
{
  uint64_t v1;
  char v3;

  if (a1 == 0x74754F64656D6974 && v1 == 0xED0000726F727245)
    v3 = 1;
  else
    v3 = sub_212A052B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_212A0158C(char a1, char a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v16;

  v2 = 0xE900000000000065;
  v3 = 0x707954676E6F7277;
  if (a1)
  {
    OUTLINED_FUNCTION_1_7();
    if (v5 == 1)
      v8 = v6;
    else
      v8 = 0xD000000000000012;
    if (v5 == 1)
      v9 = v7;
    else
      v9 = (v4 - 32) | 0x8000000000000000;
  }
  else
  {
    v8 = 0x707954676E6F7277;
    v9 = 0xE900000000000065;
  }
  if (a2)
  {
    OUTLINED_FUNCTION_1_7();
    v14 = (v13 - 32) | 0x8000000000000000;
    if (v10 == 1)
      v3 = v11;
    else
      v3 = 0xD000000000000012;
    if (v10 == 1)
      v2 = v12;
    else
      v2 = v14;
  }
  if (v8 == v3 && v9 == v2)
    v16 = 1;
  else
    v16 = sub_212A052B0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2();
  return v16 & 1;
}

void sub_212A01674(char a1)
{
  sub_212A017E8(0, a1);
}

uint64_t sub_212A01680(char a1)
{
  _BYTE v3[72];

  sub_212A0531C();
  sub_212A016C4((uint64_t)v3, a1);
  return sub_212A05334();
}

void sub_212A016C4(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_212A0170C()
{
  sub_212A04F8C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_212A017A0(uint64_t a1, char a2)
{
  if (a2)
  {
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_2_6();
  }
  else
  {
    OUTLINED_FUNCTION_3_6();
  }
  sub_212A04F8C();
  return swift_bridgeObjectRelease();
}

void sub_212A017E8(uint64_t a1, char a2)
{
  sub_212A0531C();
  if (a2)
  {
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_2_6();
  }
  else
  {
    OUTLINED_FUNCTION_3_6();
  }
  sub_212A04F8C();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_212A01844(uint64_t a1, char a2)
{
  _BYTE v4[72];

  sub_212A0531C();
  sub_212A016C4((uint64_t)v4, a2);
  return sub_212A05334();
}

BOOL static ResolutionError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ResolutionError.hash(into:)()
{
  return sub_212A05328();
}

unint64_t ResolutionError.errorDescription.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000061;
  else
    return 0xD000000000000050;
}

SiriReferenceResolver::LinkError_optional __swiftcall LinkError.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriReferenceResolver::LinkError_optional result;
  char v5;

  v2 = v1;
  v3 = sub_212A05268();
  result.value = OUTLINED_FUNCTION_2();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t LinkError.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_212A019B4 + 4 * byte_212A0601F[*v0]))(0x456E776F6E6B6E75, 0xEC000000726F7272);
}

uint64_t sub_212A019B4()
{
  return 0x74754F64656D6974;
}

uint64_t sub_212A019D8()
{
  return 0x617461446B6E696CLL;
}

unint64_t sub_212A019F8()
{
  return 0xD00000000000001DLL;
}

unint64_t sub_212A01A14()
{
  return 0xD00000000000001ELL;
}

void sub_212A01A34(char *a1)
{
  sub_212A013D4(*a1);
}

uint64_t sub_212A01A40()
{
  char *v0;

  return sub_212A01680(*v0);
}

void sub_212A01A48(uint64_t a1)
{
  char *v1;

  sub_212A016C4(a1, *v1);
}

uint64_t sub_212A01A50(uint64_t a1)
{
  char *v1;

  return sub_212A01844(a1, *v1);
}

SiriReferenceResolver::LinkError_optional sub_212A01A58(Swift::String *a1)
{
  return LinkError.init(rawValue:)(*a1);
}

uint64_t sub_212A01A64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = LinkError.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void _s21SiriReferenceResolver15ResolutionErrorO9hashValueSivg_0()
{
  sub_212A0531C();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_4_7();
}

void sub_212A01ABC()
{
  sub_212A0531C();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_4_7();
}

unint64_t sub_212A01AEC()
{
  unint64_t result;

  result = qword_254B5E770;
  if (!qword_254B5E770)
  {
    result = MEMORY[0x212BF73E4](&protocol conformance descriptor for ResolutionError, &type metadata for ResolutionError);
    atomic_store(result, (unint64_t *)&qword_254B5E770);
  }
  return result;
}

unint64_t sub_212A01B30()
{
  unint64_t result;

  result = qword_254B5E778;
  if (!qword_254B5E778)
  {
    result = MEMORY[0x212BF73E4](&protocol conformance descriptor for LinkError, &type metadata for LinkError);
    atomic_store(result, (unint64_t *)&qword_254B5E778);
  }
  return result;
}

unint64_t sub_212A01B70()
{
  unint64_t result;

  result = qword_254B5E780;
  if (!qword_254B5E780)
  {
    result = MEMORY[0x212BF73E4](&protocol conformance descriptor for TransformerError, &type metadata for TransformerError);
    atomic_store(result, (unint64_t *)&qword_254B5E780);
  }
  return result;
}

_BYTE *sub_212A01BB4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void type metadata accessor for ResolutionError()
{
  OUTLINED_FUNCTION_6_4();
}

uint64_t getEnumTagSinglePayload for LinkError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LinkError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_212A01CA0 + 4 * byte_212A06029[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_212A01CD4 + 4 * byte_212A06024[v4]))();
}

uint64_t sub_212A01CD4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_212A01CDC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x212A01CE4);
  return result;
}

uint64_t sub_212A01CF0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x212A01CF8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_212A01CFC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_212A01D04(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for LinkError()
{
  OUTLINED_FUNCTION_6_4();
}

uint64_t _s21SiriReferenceResolver15ResolutionErrorOwet_0(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFF)
  {
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
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s21SiriReferenceResolver15ResolutionErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_212A01DF0 + 4 * byte_212A06033[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_212A01E24 + 4 * byte_212A0602E[v4]))();
}

uint64_t sub_212A01E24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_212A01E2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x212A01E34);
  return result;
}

uint64_t sub_212A01E40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x212A01E48);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_212A01E4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_212A01E54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for TransformerError()
{
  OUTLINED_FUNCTION_6_4();
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  return sub_212A05334();
}

uint64_t OUTLINED_FUNCTION_8_5()
{
  return sub_212A05328();
}

uint64_t dispatch thunk of RRLinkHandling.queryType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RRLinkHandling.linkDataProtocol.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of RRLinkHandling.createAnnotatedEntity(inObject:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of RRLinkHandling.checkDataAndBuildEntity<A>(linkData:poolEntity:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t static RRResolverLog.logger<A>(_:)()
{
  swift_getMetatypeMetadata();
  sub_212A04FBC();
  return sub_212A04D94();
}

ValueMetadata *type metadata accessor for RRResolverLog()
{
  return &type metadata for RRResolverLog;
}

ValueMetadata *type metadata accessor for PersonStructuredDataHandler()
{
  return &type metadata for PersonStructuredDataHandler;
}

uint64_t sub_212A01FE8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = sub_212A0492C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_212A04A94();
  OUTLINED_FUNCTION_51();
  v8 = sub_212A04A88();
  v9 = objc_msgSend(a3, sel_displayName);
  sub_212A04FB0();

  sub_212A04A7C();
  OUTLINED_FUNCTION_9();
  v10 = OUTLINED_FUNCTION_1_8();
  if (!v10)
    goto LABEL_8;
  v11 = v10;
  v12 = objc_msgSend(v10, sel_type);

  if (!v12)
    goto LABEL_8;
  if (v12 != (id)2)
  {
    if (v12 == (id)1)
    {
      sub_212A04BE4();
      OUTLINED_FUNCTION_51();
      sub_212A04BD8();
      v13 = OUTLINED_FUNCTION_1_8();
      if (v13)
      {
        sub_212A024A4(v13);
        if (v14)
          goto LABEL_13;
      }
      goto LABEL_12;
    }
LABEL_8:
    swift_release();
    return 0;
  }
  sub_212A04BB4();
  OUTLINED_FUNCTION_51();
  sub_212A04BA8();
  v16 = OUTLINED_FUNCTION_1_8();
  if (v16)
  {
    sub_212A024A4(v16);
    if (v17)
      goto LABEL_13;
  }
LABEL_12:
  swift_bridgeObjectRelease();
LABEL_13:
  sub_212A04B9C();
  OUTLINED_FUNCTION_9();
  swift_retain();
  sub_212A04A64();
  swift_release_n();
  sub_2129F9A00(a3, (SEL *)&selRef_contactIdentifier);
  if (v18)
  {
    if (sub_212A04A70())
      goto LABEL_18;
    goto LABEL_19;
  }
  sub_2129F9A00(a3, (SEL *)&selRef_customIdentifier);
  if (v19)
  {
    if (sub_212A04A70())
    {
LABEL_18:
      OUTLINED_FUNCTION_3_7();
      sub_212A04908();
      sub_212A04890();
      swift_release();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return v8;
    }
LABEL_19:
    swift_bridgeObjectRelease();
  }
  return v8;
}

uint64_t sub_212A022C8()
{
  return 0x505F6E6F6D6D6F63;
}

uint64_t sub_212A022EC()
{
  return 3;
}

unint64_t sub_212A022F4()
{
  return 0xD000000000000013;
}

uint64_t sub_212A02310()
{
  return 0x6E6F737265504E49;
}

uint64_t sub_212A02328(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v8;
  _BYTE *v9;

  v2 = sub_212A04E54();
  v4 = sub_212A01FE8(v2, v3, a1);
  swift_bridgeObjectRelease();
  if (v4)
  {
    v5 = MEMORY[0x212BF66C4](v4);
    if (v5)
    {
      v6 = sub_2129ED90C(0, 0, 0, 0, v5, 0, 0, 0, 0xF000000000000000);
      swift_release();
      swift_release();
      return v6;
    }
    else
    {
      sub_212A02468();
      OUTLINED_FUNCTION_17_1();
      *v9 = 1;
      swift_willThrow();
      return swift_release();
    }
  }
  else
  {
    sub_212A02468();
    OUTLINED_FUNCTION_17_1();
    *v8 = 0;
    return swift_willThrow();
  }
}

unint64_t sub_212A02434()
{
  sub_212A022F4();
  return 0xD000000000000013;
}

uint64_t sub_212A02450(void **a1)
{
  return sub_212A02328(*a1);
}

unint64_t sub_212A02468()
{
  unint64_t result;

  result = qword_254B5E7B8;
  if (!qword_254B5E7B8)
  {
    result = MEMORY[0x212BF73E4](&protocol conformance descriptor for TransformerError, &type metadata for TransformerError);
    atomic_store(result, (unint64_t *)&qword_254B5E7B8);
  }
  return result;
}

uint64_t sub_212A024A4(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_value);

  if (!v2)
    return 0;
  v3 = sub_212A04FB0();

  return v3;
}

id OUTLINED_FUNCTION_1_8()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 2103));
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for TimerStructuredDataHandler()
{
  return &type metadata for TimerStructuredDataHandler;
}

uint64_t sub_212A02538()
{
  return 0x646E696B656D6F73;
}

uint64_t sub_212A0255C()
{
  return 6;
}

uint64_t sub_212A02564()
{
  return 0x72656D69544E49;
}

uint64_t sub_212A0257C()
{
  return sub_2129ED90C(0, 0, 0, 0, 0, 0, 0, 0, 0xF000000000000000);
}

uint64_t sub_212A025D4()
{
  return sub_212A0257C();
}

uint64_t sub_212A025E8(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  int64_t v6;
  unint64_t v7;
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  uint64_t v20;

  v20 = MEMORY[0x24BEE4AF8];
  sub_212A04604(a3, v19);
  v5 = v19[0];
  v6 = v19[3];
  v7 = v19[4];
  v15 = v19[1];
  v16 = (unint64_t)(v19[2] + 64) >> 6;
  result = swift_bridgeObjectRetain();
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v6 << 6);
      goto LABEL_15;
    }
    v11 = v6 + 1;
    if (__OFADD__(v6, 1))
      break;
    if (v11 >= v16)
      goto LABEL_27;
    v12 = *(_QWORD *)(v15 + 8 * v11);
    if (!v12)
    {
      v13 = v6 + 2;
      if (v6 + 2 >= v16)
        goto LABEL_27;
      v12 = *(_QWORD *)(v15 + 8 * v13);
      if (v12)
        goto LABEL_13;
      v13 = v6 + 3;
      if (v6 + 3 >= v16)
        goto LABEL_27;
      v12 = *(_QWORD *)(v15 + 8 * v13);
      if (v12)
        goto LABEL_13;
      v13 = v6 + 4;
      if (v6 + 4 >= v16)
        goto LABEL_27;
      v12 = *(_QWORD *)(v15 + 8 * v13);
      if (v12)
      {
LABEL_13:
        v11 = v13;
      }
      else
      {
        v11 = v6 + 5;
        if (v6 + 5 >= v16)
          goto LABEL_27;
        v12 = *(_QWORD *)(v15 + 8 * v11);
        if (!v12)
        {
          v14 = v6 + 6;
          while (v14 < v16)
          {
            v12 = *(_QWORD *)(v15 + 8 * v14++);
            if (v12)
            {
              v11 = v14 - 1;
              goto LABEL_14;
            }
          }
LABEL_27:
          swift_release();
          return v20;
        }
      }
    }
LABEL_14:
    v7 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v11 << 6);
    v6 = v11;
LABEL_15:
    v18 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    a1(&v17, &v18);
    if (v3)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    result = swift_bridgeObjectRelease();
    if (v17)
    {
      MEMORY[0x212BF6E08](result);
      if (*(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_212A050D0();
      sub_212A050F4();
      result = sub_212A050C4();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_212A02818(uint64_t a1)
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
  int v11;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFED90);
  OUTLINED_FUNCTION_8_0();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v13 - v6;
  sub_212A046F8(a1, (uint64_t)&v13 - v6, &qword_253EFED90);
  v8 = sub_212A04A40();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
  {
    v9 = 0;
  }
  else
  {
    sub_212A046F8((uint64_t)v7, (uint64_t)v5, &qword_253EFED90);
    v10 = *(_QWORD *)(v8 - 8);
    v11 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v5, v8);
    if (v11 == *MEMORY[0x24BEA1210])
    {
      v9 = 4;
    }
    else if (v11 == *MEMORY[0x24BEA1220])
    {
      v9 = 2;
    }
    else
    {
      if (v11 == *MEMORY[0x24BEA1140])
        goto LABEL_8;
      if (v11 == *MEMORY[0x24BEA11B0])
      {
        v9 = 24;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA1180])
      {
        v9 = 17;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA1208])
      {
        v9 = 8;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA1188])
      {
        v9 = -3;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA11F0])
      {
        v9 = 6;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA1170])
      {
        v9 = 19;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA1190])
      {
        v9 = 25;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA11E8])
      {
        v9 = 9;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA1240])
      {
        v9 = 11;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA11C0])
        goto LABEL_28;
      if (v11 == *MEMORY[0x24BEA1168])
      {
        v9 = 14;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA11A8])
      {
        v9 = -2;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA1198])
      {
        v9 = 21;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA1178])
      {
        v9 = 13;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA11C8])
      {
LABEL_28:
        v9 = -1;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA11B8])
      {
        v9 = 22;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA1148])
      {
        v9 = 15;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA1158])
      {
        v9 = 20;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA11D8])
      {
        v9 = 5;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA1150])
      {
        v9 = 16;
        goto LABEL_62;
      }
      if (v11 == *MEMORY[0x24BEA11E0])
      {
LABEL_8:
        v9 = 1;
      }
      else if (v11 == *MEMORY[0x24BEA1230])
      {
        v9 = 7;
      }
      else if (v11 == *MEMORY[0x24BEA1160])
      {
        v9 = 18;
      }
      else if (v11 == *MEMORY[0x24BEA11A0])
      {
        v9 = 23;
      }
      else if (v11 == *MEMORY[0x24BEA1238])
      {
        v9 = 12;
      }
      else if (v11 == *MEMORY[0x24BEA1200])
      {
        v9 = 3;
      }
      else if (v11 == *MEMORY[0x24BEA11F8])
      {
        v9 = 10;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v8);
        v9 = 0;
      }
    }
  }
LABEL_62:
  sub_212A009B4((uint64_t)v7, &qword_253EFED90);
  return v9;
}

uint64_t sub_212A02CD0(unint64_t *a1, uint64_t (*a2)(id, id))
{
  unint64_t v4;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v6;
  uint64_t v8[2];

  v4 = *a1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v4;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v4 & 0x8000000000000000) != 0
    || (v4 & 0x4000000000000000) != 0)
  {
    sub_212A045B0(v4);
  }
  v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v8[0] = (v4 & 0xFFFFFFFFFFFFFF8) + 32;
  v8[1] = v6;
  sub_212A03B20(v8, a2);
  return sub_212A050C4();
}

uint64_t sub_212A02D6C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  unint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  void *v21;
  uint64_t v22;
  int EnumTagSinglePayload;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL8 v39;
  char v40;
  unint64_t v41;
  char v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t result;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  unint64_t v59;
  char *v60;
  uint64_t v61;
  unint64_t v62;

  v53 = a3;
  v54 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEED0);
  OUTLINED_FUNCTION_8_0();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v57 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t)&v52 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEED8);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_212A04F08();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (unint64_t)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_212A046F8(a2, (uint64_t)v13, &qword_253EFEED8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14) == 1)
  {
    (*(void (**)(unint64_t, _QWORD, uint64_t))(v15 + 104))(v17, *MEMORY[0x24BEA5878], v14);
    sub_212A009B4((uint64_t)v13, &qword_253EFEED8);
  }
  else
  {
    (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v17, v13, v14);
  }
  v62 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_46;
  v18 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    v60 = (char *)v17;
    v56 = v15;
    if (v18)
    {
      if (v18 < 1)
      {
        __break(1u);
LABEL_51:
        result = sub_212A052C8();
        __break(1u);
        return result;
      }
      for (i = 0; i != v18; ++i)
      {
        if ((a1 & 0xC000000000000001) != 0)
          v20 = (id)MEMORY[0x212BF6F58](i, a1);
        else
          v20 = *(id *)(a1 + 8 * i + 32);
        v21 = v20;
        sub_212A04EA8();
        v22 = sub_212A04E24();
        EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v10, 1, v22);
        sub_212A009B4(v10, &qword_253EFEED0);
        if (EnumTagSinglePayload == 1)
        {

        }
        else
        {
          sub_212A05208();
          sub_212A05220();
          v17 = (unint64_t)v60;
          sub_212A0522C();
          sub_212A05214();
        }
      }
      OUTLINED_FUNCTION_2();
      v24 = v62;
      v15 = v56;
    }
    else
    {
      OUTLINED_FUNCTION_2();
      v24 = MEMORY[0x24BEE4AF8];
    }
    v25 = (uint64_t)v57;
    if ((v24 & 0x8000000000000000) != 0 || (v24 & 0x4000000000000000) != 0)
      break;
    v26 = *(_QWORD *)(v24 + 16);
    swift_retain();
    if (!v26)
      goto LABEL_48;
LABEL_21:
    v59 = v24 & 0xC000000000000001;
    a1 = MEMORY[0x24BEE4B00];
    v10 = 4;
    v55 = v14;
    v58 = v26;
    while (1)
    {
      v27 = v59 ? (id)MEMORY[0x212BF6F58](v10 - 4, v24) : *(id *)(v24 + 8 * v10);
      v28 = v27;
      if (__OFADD__(v10 - 4, 1))
        break;
      v61 = v10 - 3;
      v29 = v24;
      sub_212A04EA8();
      v30 = sub_212A04E24();
      if (__swift_getEnumTagSinglePayload(v25, 1, v30) == 1)
      {
        sub_212A009B4(v25, &qword_253EFEED0);

        v24 = v29;
        v31 = v58;
      }
      else
      {
        v15 = sub_212A04E0C();
        v32 = v25;
        v34 = v33;
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 8))(v32, v30);
        v35 = v28;
        swift_isUniquelyReferenced_nonNull_native();
        v62 = a1;
        v36 = sub_2129F3ED0(v15, v34);
        v38 = *(_QWORD *)(a1 + 16);
        v39 = (v37 & 1) == 0;
        a1 = v38 + v39;
        if (__OFADD__(v38, v39))
          goto LABEL_44;
        v17 = v36;
        v14 = v37;
        __swift_instantiateConcreteTypeFromMangledName(&qword_254B5E7F0);
        v40 = sub_212A05238();
        v24 = v29;
        v31 = v58;
        if ((v40 & 1) != 0)
        {
          v41 = sub_2129F3ED0(v15, v34);
          if ((v14 & 1) != (v42 & 1))
            goto LABEL_51;
          v17 = v41;
        }
        a1 = v62;
        swift_bridgeObjectRelease();
        if ((v14 & 1) == 0)
        {
          *(_QWORD *)(a1 + 8 * (v17 >> 6) + 64) |= 1 << v17;
          v43 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v17);
          *v43 = v15;
          v43[1] = v34;
          *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v17) = MEMORY[0x24BEE4AF8];
          v44 = *(_QWORD *)(a1 + 16);
          v45 = v44 + 1;
          v15 = __OFADD__(v44, 1);
          swift_bridgeObjectRetain();
          if ((v15 & 1) != 0)
            goto LABEL_45;
          *(_QWORD *)(a1 + 16) = v45;
        }
        swift_bridgeObjectRetain();
        v46 = *(_QWORD *)(a1 + 56);
        v47 = OUTLINED_FUNCTION_2();
        MEMORY[0x212BF6E08](v47);
        if (*(_QWORD *)((*(_QWORD *)(v46 + 8 * v17) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v46 + 8 * v17) & 0xFFFFFFFFFFFFFF8)
                                                                                                 + 0x18) >> 1)
          sub_212A050D0();
        sub_212A050F4();
        sub_212A050C4();

        swift_bridgeObjectRelease();
        v14 = v55;
        v15 = v56;
        v25 = (uint64_t)v57;
        v17 = (unint64_t)v60;
      }
      ++v10;
      if (v61 == v31)
        goto LABEL_49;
    }
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    OUTLINED_FUNCTION_0_7();
    v18 = sub_212A05250();
  }
  swift_retain();
  swift_bridgeObjectRetain();
  v26 = sub_212A05250();
  swift_release();
  if (v26)
    goto LABEL_21;
LABEL_48:
  a1 = MEMORY[0x24BEE4B00];
LABEL_49:
  v48 = swift_release_n();
  MEMORY[0x24BDAC7A8](v48);
  v49 = v54;
  *(&v52 - 4) = v53;
  *(&v52 - 3) = v49;
  *(&v52 - 2) = v17;
  v50 = sub_212A025E8((void (*)(uint64_t *__return_ptr, uint64_t *))sub_212A04594, (uint64_t)(&v52 - 6), a1);
  OUTLINED_FUNCTION_2();
  (*(void (**)(unint64_t, uint64_t))(v15 + 8))(v17, v14);
  return v50;
}

void sub_212A03310(unint64_t *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  void *v4;
  uint64_t v5;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  uint64_t *v28;
  unint64_t v29;

  v5 = a2;
  v7 = sub_212A035B4(*a1, a2, a3);
  if (v4)
  {

    v8 = 0;
LABEL_37:
    *a4 = v8;
    return;
  }
  v9 = v7;
  v10 = v7 >> 62;
  if (!(v7 >> 62))
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
      goto LABEL_5;
LABEL_36:
    swift_bridgeObjectRelease_n();
    goto LABEL_37;
  }
  swift_bridgeObjectRetain();
  v8 = sub_212A05250();
  if (!v8)
    goto LABEL_36;
LABEL_5:
  v28 = a4;
  v29 = v10;
  v11 = v9 & 0xC000000000000001;
  sub_2129F7390(0, (v9 & 0xC000000000000001) == 0, v9);
  if ((v9 & 0xC000000000000001) != 0)
    v12 = (id)MEMORY[0x212BF6F58](0, v9);
  else
    v12 = *(id *)(v9 + 32);
  v13 = v12;
  v14 = v8 - 1;
  if (v8 != 1)
  {
    if (v8 < 2)
      goto LABEL_40;
    sub_2129F7390(1, v11 == 0, v9);
    sub_2129F7390(v14, v11 == 0, v9);
    v15 = 0;
    do
    {
      if (v11)
        v16 = (id)MEMORY[0x212BF6F58](v15 + 1, v9);
      else
        v16 = *(id *)(v9 + 8 * v15 + 40);
      v17 = v16;
      sub_212A04EB4();
      v19 = v18;
      sub_212A04EB4();
      if (v19 >= v20)
        v21 = v17;
      else
        v21 = v13;
      if (v19 < v20)
        v13 = v17;

      ++v15;
    }
    while (v14 != v15);
  }
  swift_bridgeObjectRelease();
  sub_212A04EB4();

  if (v5 < 0)
  {
    v22 = __OFSUB__(0, v5);
    v5 = -v5;
    if (v22)
      goto LABEL_41;
  }
  v22 = __OFSUB__(v5, 1);
  v23 = v5 - 1;
  if (!v22)
  {
    if (v29)
    {
      swift_bridgeObjectRetain();
      v24 = sub_212A05250();
      swift_bridgeObjectRelease();
    }
    else
    {
      v24 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    if (v23 >= v24)
    {
      swift_bridgeObjectRelease();
      v8 = 0;
    }
    else
    {
      sub_2129F7390(v23, v11 == 0, v9);
      if (v11)
        v25 = (id)MEMORY[0x212BF6F58](v23, v9);
      else
        v25 = *(id *)(v9 + 8 * v23 + 32);
      v26 = v25;
      sub_212A04EC0();

      if (v11)
        v27 = (id)MEMORY[0x212BF6F58](v23, v9);
      else
        v27 = *(id *)(v9 + 8 * v23 + 32);
      v8 = (uint64_t)v27;
      swift_bridgeObjectRelease();
    }
    a4 = v28;
    goto LABEL_37;
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
}

uint64_t sub_212A035B4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v7 = sub_212A04F08();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v27 = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v7);
  v10 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v11 + v10, (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  swift_bridgeObjectRetain();
  sub_212A02CD0(&v27, (uint64_t (*)(id, id))sub_212A0469C);
  if (v3)
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_willThrow();
    return v11;
  }
  result = swift_release();
  v11 = v27;
  if ((a2 & 0x8000000000000000) == 0)
    return v11;
  if (v27 >> 62)
    goto LABEL_31;
  v13 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v13)
    return v11;
LABEL_7:
  if (!__OFSUB__(v13, 1))
  {
    if (v13 - 1 < 1)
      return v11;
    v14 = 0;
    v15 = v13 + 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      v16 = v13 - 1;
      v11 = v27;
      if ((v27 & 0xC000000000000001) != 0)
      {
        v19 = MEMORY[0x212BF6F58](v14, v27);
        v20 = (id)MEMORY[0x212BF6F58](v13 - 1, v11);
      }
      else
      {
        v17 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v14 >= v17)
        {
          __break(1u);
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
LABEL_31:
          swift_bridgeObjectRetain();
          v25 = sub_212A05250();
          swift_bridgeObjectRelease();
          if (v25)
          {
            swift_bridgeObjectRetain();
            v13 = sub_212A05250();
            result = swift_bridgeObjectRelease();
            goto LABEL_7;
          }
          return v11;
        }
        v18 = *(id *)(v27 + 8 * v14 + 32);
        if (v16 >= v17)
          goto LABEL_28;
        v19 = (uint64_t)v18;
        v20 = *(id *)(v11 + 8 * v13 + 24);
      }
      v21 = v20;
      if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
        || (v11 & 0x8000000000000000) != 0
        || (v11 & 0x4000000000000000) != 0)
      {
        sub_212A045B0(v11);
      }
      v22 = *(void **)((v11 & 0xFFFFFFFFFFFFFF8) + 8 * v14 + 0x20);
      *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 8 * v14 + 0x20) = v21;

      sub_212A050C4();
      v11 = v27;
      if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
        || (v11 & 0x8000000000000000) != 0
        || (v11 & 0x4000000000000000) != 0)
      {
        sub_212A045B0(v11);
      }
      if (v16 >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_29;
      v23 = *(void **)((v11 & 0xFFFFFFFFFFFFFF8) + 8 * v13 + 0x18);
      *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 8 * v13 + 0x18) = v19;

      v11 = (unint64_t)&v27;
      sub_212A050C4();
      if (v15 == v14)
        goto LABEL_30;
      ++v14;
      v24 = v13 - 2;
      --v13;
      if (v14 >= v24)
        return v27;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_212A0389C(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  void (*v14)(char *, uint64_t);
  _BYTE *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  BOOL v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = a3;
  v3 = sub_212A04F08();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFEED0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v22 - v11;
  sub_212A04EA8();
  v13 = sub_212A04E24();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13) == 1)
    goto LABEL_4;
  v23 = v3;
  v22 = sub_212A04E18();
  v14 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8);
  v14(v12, v13);
  sub_212A04EA8();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v13) == 1)
  {
    v12 = v10;
LABEL_4:
    sub_212A009B4((uint64_t)v12, &qword_253EFEED0);
    sub_2129F8810();
    swift_allocError();
    *v15 = 1;
    swift_willThrow();
    return v16 & 1;
  }
  v17 = sub_212A04E18();
  v14(v10, v13);
  v18 = v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v24, v23);
  v19 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v18);
  if (v19 == *MEMORY[0x24BEA5878])
    goto LABEL_6;
  if (v19 == *MEMORY[0x24BEA5888])
  {
LABEL_8:
    v20 = v17 < v22;
LABEL_9:
    v16 = v20;
    return v16 & 1;
  }
  if (v19 == *MEMORY[0x24BEA5868])
    goto LABEL_6;
  if (v19 == *MEMORY[0x24BEA5890])
    goto LABEL_8;
  if (v19 == *MEMORY[0x24BEA5880])
  {
LABEL_6:
    v20 = v22 < v17;
    goto LABEL_9;
  }
  if (v19 == *MEMORY[0x24BEA5870])
    goto LABEL_8;
  result = sub_212A052A4();
  __break(1u);
  return result;
}

void sub_212A03B20(uint64_t *a1, uint64_t (*a2)(id, id))
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;
  int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  unint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  char v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  char v86;
  char v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v111;

  v5 = a1[1];
  v6 = sub_212A05280();
  if (v6 >= v5)
  {
    if (v5 < 0)
      goto LABEL_135;
    if (v5)
      sub_212A04204(0, v5, 1, a1, a2);
    return;
  }
  v7 = v6;
  v8 = sub_2129F73B8(v5 / 2);
  v109 = v9;
  v111 = v8;
  v107 = v5;
  v101 = a1;
  if (v5 <= 0)
  {
    v12 = MEMORY[0x24BEE4AF8];
    v31 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_94:
    if (v31 >= 2)
    {
      v91 = *v101;
      do
      {
        v92 = v31 - 2;
        if (v31 < 2)
          goto LABEL_129;
        if (!v91)
          goto LABEL_143;
        v93 = *(_QWORD *)(v12 + 32 + 16 * v92);
        v94 = *(_QWORD *)(v12 + 32 + 16 * (v31 - 1) + 8);
        sub_212A042F4((char *)(v91 + 8 * v93), (char *)(v91 + 8 * *(_QWORD *)(v12 + 32 + 16 * (v31 - 1))), v91 + 8 * v94, v109, a2);
        if (v2)
          goto LABEL_106;
        if (v94 < v93)
          goto LABEL_130;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2129F8314(v12);
          v12 = v97;
        }
        if (v92 >= *(_QWORD *)(v12 + 16))
          goto LABEL_131;
        v95 = (_QWORD *)(v12 + 32 + 16 * v92);
        *v95 = v93;
        v95[1] = v94;
        v96 = *(_QWORD *)(v12 + 16);
        if (v31 > v96)
          goto LABEL_132;
        memmove((void *)(v12 + 32 + 16 * (v31 - 1)), (const void *)(v12 + 32 + 16 * v31), 16 * (v96 - v31));
        *(_QWORD *)(v12 + 16) = v96 - 1;
        v31 = v96 - 1;
      }
      while (v96 > 2);
    }
    swift_bridgeObjectRelease();
    if (v107 >= -1)
    {
LABEL_113:
      *(_QWORD *)((v111 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_212A050C4();
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
LABEL_109:
    swift_bridgeObjectRelease();

LABEL_111:
LABEL_112:
    if (v107 < -1)
      goto LABEL_136;
    goto LABEL_113;
  }
  v102 = v7;
  v10 = 0;
  v11 = *a1;
  v100 = v11 - 8;
  v12 = MEMORY[0x24BEE4AF8];
  v108 = v11;
  while (1)
  {
    v13 = v10 + 1;
    if (v10 + 1 >= v5)
      goto LABEL_21;
    v14 = *(void **)(v11 + 8 * v10);
    v15 = *(id *)(v11 + 8 * v13);
    v3 = v14;
    v16 = a2(v15, v3);
    if (v2)
    {
      swift_bridgeObjectRelease();

      goto LABEL_111;
    }
    v17 = v16;

    v103 = v10;
    v5 = v107;
    v13 = v10 + 2;
    if (v10 + 2 >= v107)
      goto LABEL_10;
    do
    {
      v18 = v11 + 8 * v10;
      v19 = *(void **)(v18 + 8);
      v20 = *(id *)(v18 + 16);
      v3 = v19;
      v21 = a2(v20, v3);

      v5 = v107;
      if (((v17 ^ v21) & 1) != 0)
      {
        v13 = v10 + 2;
        if ((v17 & 1) != 0)
          goto LABEL_11;
LABEL_20:
        v10 = v103;
        goto LABEL_21;
      }
      v22 = v10 + 3;
      ++v10;
    }
    while (v22 < v107);
    v13 = v107;
LABEL_10:
    if ((v17 & 1) == 0)
      goto LABEL_20;
LABEL_11:
    v10 = v103;
    if (v13 < v103)
      goto LABEL_140;
    if (v103 < v13)
    {
      v23 = (uint64_t *)(v100 + 8 * v13);
      v24 = v13;
      v25 = v103;
      v26 = (uint64_t *)(v11 + 8 * v103);
      do
      {
        if (v25 != --v24)
        {
          if (!v11)
            goto LABEL_144;
          v27 = *v26;
          *v26 = *v23;
          *v23 = v27;
        }
        ++v25;
        --v23;
        ++v26;
      }
      while (v25 < v24);
    }
LABEL_21:
    if (v13 < v5)
    {
      if (__OFSUB__(v13, v10))
        goto LABEL_137;
      if (v13 - v10 < v102)
        break;
    }
LABEL_30:
    if (v13 < v10)
      goto LABEL_134;
    v105 = v13;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2129F8234(0, *(_QWORD *)(v12 + 16) + 1, 1, (char *)v12);
      v12 = v89;
    }
    v30 = *(_QWORD *)(v12 + 16);
    v29 = *(_QWORD *)(v12 + 24);
    v31 = v30 + 1;
    if (v30 >= v29 >> 1)
    {
      sub_2129F8234(v29 > 1, v30 + 1, 1, (char *)v12);
      v12 = v90;
    }
    *(_QWORD *)(v12 + 16) = v31;
    v32 = v12 + 32;
    v33 = (uint64_t *)(v12 + 32 + 16 * v30);
    *v33 = v10;
    v33[1] = v13;
    if (v30)
    {
      while (1)
      {
        v34 = v31 - 1;
        if (v31 >= 4)
        {
          v39 = v32 + 16 * v31;
          v40 = *(_QWORD *)(v39 - 64);
          v41 = *(_QWORD *)(v39 - 56);
          v45 = __OFSUB__(v41, v40);
          v42 = v41 - v40;
          if (v45)
            goto LABEL_119;
          v44 = *(_QWORD *)(v39 - 48);
          v43 = *(_QWORD *)(v39 - 40);
          v45 = __OFSUB__(v43, v44);
          v37 = v43 - v44;
          v38 = v45;
          if (v45)
            goto LABEL_120;
          v46 = v31 - 2;
          v47 = (uint64_t *)(v32 + 16 * (v31 - 2));
          v49 = *v47;
          v48 = v47[1];
          v45 = __OFSUB__(v48, v49);
          v50 = v48 - v49;
          if (v45)
            goto LABEL_121;
          v45 = __OFADD__(v37, v50);
          v51 = v37 + v50;
          if (v45)
            goto LABEL_123;
          if (v51 >= v42)
          {
            v69 = (uint64_t *)(v32 + 16 * v34);
            v71 = *v69;
            v70 = v69[1];
            v45 = __OFSUB__(v70, v71);
            v72 = v70 - v71;
            if (v45)
              goto LABEL_133;
            v62 = v37 < v72;
            goto LABEL_67;
          }
        }
        else
        {
          if (v31 != 3)
          {
            v63 = *(_QWORD *)(v12 + 32);
            v64 = *(_QWORD *)(v12 + 40);
            v45 = __OFSUB__(v64, v63);
            v56 = v64 - v63;
            v57 = v45;
            goto LABEL_61;
          }
          v36 = *(_QWORD *)(v12 + 32);
          v35 = *(_QWORD *)(v12 + 40);
          v45 = __OFSUB__(v35, v36);
          v37 = v35 - v36;
          v38 = v45;
        }
        if ((v38 & 1) != 0)
          goto LABEL_122;
        v46 = v31 - 2;
        v52 = (uint64_t *)(v32 + 16 * (v31 - 2));
        v54 = *v52;
        v53 = v52[1];
        v55 = __OFSUB__(v53, v54);
        v56 = v53 - v54;
        v57 = v55;
        if (v55)
          goto LABEL_124;
        v58 = (uint64_t *)(v32 + 16 * v34);
        v60 = *v58;
        v59 = v58[1];
        v45 = __OFSUB__(v59, v60);
        v61 = v59 - v60;
        if (v45)
          goto LABEL_126;
        if (__OFADD__(v56, v61))
          goto LABEL_128;
        if (v56 + v61 >= v37)
        {
          v62 = v37 < v61;
LABEL_67:
          if (v62)
            v34 = v46;
          goto LABEL_69;
        }
LABEL_61:
        if ((v57 & 1) != 0)
          goto LABEL_125;
        v65 = (uint64_t *)(v32 + 16 * v34);
        v67 = *v65;
        v66 = v65[1];
        v45 = __OFSUB__(v66, v67);
        v68 = v66 - v67;
        if (v45)
          goto LABEL_127;
        if (v68 < v56)
          goto LABEL_78;
LABEL_69:
        v73 = v34 - 1;
        if (v34 - 1 >= v31)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v11)
          goto LABEL_141;
        v74 = v11;
        v75 = v32;
        v76 = (uint64_t *)(v32 + 16 * v73);
        v77 = *v76;
        v78 = v75;
        v79 = v34;
        v3 = (_QWORD *)(v75 + 16 * v34);
        v80 = v3[1];
        sub_212A042F4((char *)(v74 + 8 * *v76), (char *)(v74 + 8 * *v3), v74 + 8 * v80, v109, a2);
        if (v2)
        {
LABEL_106:
          swift_bridgeObjectRelease();
          goto LABEL_112;
        }
        if (v80 < v77)
          goto LABEL_116;
        if (v79 > *(_QWORD *)(v12 + 16))
          goto LABEL_117;
        *v76 = v77;
        *(_QWORD *)(v78 + 16 * v73 + 8) = v80;
        v81 = *(_QWORD *)(v12 + 16);
        if (v79 >= v81)
          goto LABEL_118;
        v32 = v78;
        v31 = v81 - 1;
        memmove(v3, v3 + 2, 16 * (v81 - 1 - v79));
        *(_QWORD *)(v12 + 16) = v81 - 1;
        v62 = v81 > 2;
        v11 = v108;
        if (!v62)
          goto LABEL_78;
      }
    }
    v31 = 1;
LABEL_78:
    v10 = v105;
    v5 = v107;
    if (v105 >= v107)
      goto LABEL_94;
  }
  if (__OFADD__(v10, v102))
    goto LABEL_138;
  if (v10 + v102 >= v5)
    v28 = v5;
  else
    v28 = v10 + v102;
  if (v28 >= v10)
  {
    if (v13 != v28)
    {
      v98 = v12;
      v99 = v28;
      v82 = v100 + 8 * v13;
      v104 = v10;
      do
      {
        v83 = *(void **)(v11 + 8 * v13);
        v106 = v82;
        while (1)
        {
          v84 = v13;
          v85 = *(void **)v82;
          v31 = v83;
          v3 = v85;
          v86 = a2((id)v31, v3);
          if (v2)
            goto LABEL_109;
          v87 = v86;

          if ((v87 & 1) == 0)
            break;
          if (!v11)
            goto LABEL_142;
          v13 = v84;
          v88 = *(void **)v82;
          v83 = *(void **)(v82 + 8);
          *(_QWORD *)v82 = v83;
          *(_QWORD *)(v82 + 8) = v88;
          v82 -= 8;
          if (v84 == ++v10)
            goto LABEL_88;
        }
        v13 = v84;
LABEL_88:
        ++v13;
        v10 = v104;
        v82 = v106 + 8;
      }
      while (v13 != v99);
      v13 = v99;
      v12 = v98;
    }
    goto LABEL_30;
  }
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
}

void sub_212A04204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(id, id))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  void *v15;
  uint64_t v18;

  if (a3 != a2)
  {
    v6 = a3;
    v7 = a1;
    v8 = *a4;
    v9 = *a4 + 8 * a3 - 8;
LABEL_4:
    v10 = *(void **)(v8 + 8 * v6);
    v18 = v9;
    while (1)
    {
      v11 = *(void **)v9;
      v12 = v10;
      v13 = v11;
      v14 = a5(v12, v13);

      if (v5)
        break;
      if ((v14 & 1) != 0)
      {
        if (!v8)
        {
          __break(1u);
          return;
        }
        v15 = *(void **)v9;
        v10 = *(void **)(v9 + 8);
        *(_QWORD *)v9 = v10;
        *(_QWORD *)(v9 + 8) = v15;
        v9 -= 8;
        if (v6 != ++v7)
          continue;
      }
      ++v6;
      v9 = v18 + 8;
      v7 = a1;
      if (v6 != a2)
        goto LABEL_4;
      return;
    }
  }
}

uint64_t sub_212A042F4(char *a1, char *a2, unint64_t a3, char *a4, uint64_t (*a5)(id, id))
{
  void **v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v13;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  char v27;
  char v28;
  void **v29;
  _QWORD *v30;
  BOOL v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  void *v36;
  char *v37;
  id v38;
  id v39;
  char v40;
  char v41;
  char *v42;
  BOOL v43;
  char *v44;
  unint64_t v45;
  uint64_t v47;
  char *v48;

  v5 = (void **)a4;
  v6 = a3;
  v7 = a2;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 8;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 8;
  v48 = a1;
  if (v9 >= v11)
  {
    sub_2129F7504(a2, (uint64_t)(a3 - (_QWORD)a2) / 8, a4);
    v13 = &v5[v11];
    if (v48 >= v7 || v10 < 8)
      goto LABEL_13;
    v33 = (char *)(v6 - 8);
    v44 = (char *)v5;
    while (1)
    {
      v45 = (unint64_t)v13;
      v34 = (char *)(v13 - 1);
      v35 = v7;
      v37 = v7 - 8;
      v36 = (void *)*((_QWORD *)v7 - 1);
      v38 = *(v13 - 1);
      v39 = v36;
      v40 = a5(v38, v39);
      if (v47)
        break;
      v41 = v40;
      v42 = v33 + 8;

      if ((v41 & 1) != 0)
      {
        v43 = v42 != v35 || v33 >= v35;
        v7 = v37;
        v13 = (void **)v45;
      }
      else
      {
        v43 = v42 != (char *)v45 || (unint64_t)v33 >= v45;
        v37 = v34;
        v13 = (void **)v34;
        v7 = v35;
      }
      if (v43)
        *(_QWORD *)v33 = *(_QWORD *)v37;
      v5 = (void **)v44;
      if (v7 > v48)
      {
        v33 -= 8;
        if (v13 > (void **)v44)
          continue;
      }
      goto LABEL_13;
    }

    sub_2129F7504(v44, (uint64_t)(v45 - (_QWORD)v44) / 8, v7);
  }
  else
  {
    sub_2129F7504(a1, (a2 - a1) / 8, a4);
    v13 = &v5[v9];
    if ((unint64_t)v7 < v6 && v8 >= 8)
    {
      v20 = v47;
      while (1)
      {
        v21 = v6;
        v22 = v7;
        v23 = v20;
        v24 = *v5;
        v25 = *(id *)v7;
        v26 = v24;
        v27 = a5(v25, v26);
        v20 = v23;
        if (v23)
        {

          v16 = v13 - v5;
          v17 = (char *)v5;
          v18 = v48;
          goto LABEL_14;
        }
        v28 = v27;

        if ((v28 & 1) == 0)
          break;
        v29 = (void **)v22;
        v7 = v22 + 8;
        v30 = v48;
        if (v48 != v22)
          goto LABEL_21;
LABEL_22:
        v32 = (char *)(v30 + 1);
        if (v5 >= v13)
        {
          v7 = v32;
          goto LABEL_13;
        }
        v48 = v32;
        v6 = v21;
        if ((unint64_t)v7 >= v21)
        {
          v7 = v32;
          goto LABEL_13;
        }
      }
      v29 = v5;
      v30 = v48;
      v31 = v48 == (char *)v5++;
      v7 = v22;
      if (v31)
        goto LABEL_22;
LABEL_21:
      *v30 = *v29;
      goto LABEL_22;
    }
    v7 = a1;
LABEL_13:
    v16 = v13 - v5;
    v17 = (char *)v5;
    v18 = v7;
LABEL_14:
    sub_2129F7504(v17, v16, v18);
  }
  return 1;
}

void sub_212A04594(unint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  sub_212A03310(a1, *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), a2);
}

void sub_212A045B0(unint64_t a1)
{
  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_0_7();
    sub_212A05250();
    OUTLINED_FUNCTION_2();
  }
  JUMPOUT(0x212BF6F64);
}

uint64_t sub_212A04604@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_212A0463C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_212A04F08();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_212A0469C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_212A04F08() - 8) + 80);
  return sub_212A0389C(a1, a2, v2 + ((v5 + 16) & ~v5)) & 1;
}

uint64_t sub_212A046F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for TaskStructuredDataHandler()
{
  return &type metadata for TaskStructuredDataHandler;
}

uint64_t sub_212A04760()
{
  return 0x646E696B656D6F73;
}

uint64_t sub_212A04784()
{
  return 7;
}

uint64_t sub_212A0478C()
{
  return 0x6B7361544E49;
}

ValueMetadata *type metadata accessor for TaskListStructuredDataHandler()
{
  return &type metadata for TaskListStructuredDataHandler;
}

unint64_t sub_212A047B0()
{
  return 0xD000000000000012;
}

uint64_t sub_212A047CC()
{
  return 8;
}

uint64_t sub_212A047D4()
{
  return 0x694C6B7361544E49;
}

unint64_t sub_212A047F0()
{
  sub_212A047B0();
  return 0xD000000000000012;
}

uint64_t sub_212A0480C()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_212A04818()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_212A04824()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_212A04830()
{
  return MEMORY[0x24BDCCBB0]();
}

uint64_t sub_212A0483C()
{
  return MEMORY[0x24BDCCC10]();
}

uint64_t sub_212A04848()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_212A04854()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_212A04860()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_212A0486C()
{
  return MEMORY[0x24BE9EB50]();
}

uint64_t sub_212A04878()
{
  return MEMORY[0x24BE9EDA8]();
}

uint64_t sub_212A04884()
{
  return MEMORY[0x24BE9EDB0]();
}

uint64_t sub_212A04890()
{
  return MEMORY[0x24BE9F730]();
}

uint64_t sub_212A0489C()
{
  return MEMORY[0x24BE9F768]();
}

uint64_t sub_212A048A8()
{
  return MEMORY[0x24BE9F770]();
}

uint64_t sub_212A048B4()
{
  return MEMORY[0x24BE9F8D0]();
}

uint64_t sub_212A048C0()
{
  return MEMORY[0x24BE9F8D8]();
}

uint64_t sub_212A048CC()
{
  return MEMORY[0x24BE9F8E8]();
}

uint64_t sub_212A048D8()
{
  return MEMORY[0x24BE9F8F0]();
}

uint64_t sub_212A048E4()
{
  return MEMORY[0x24BE9F928]();
}

uint64_t sub_212A048F0()
{
  return MEMORY[0x24BE9F948]();
}

uint64_t sub_212A048FC()
{
  return MEMORY[0x24BE9F978]();
}

uint64_t sub_212A04908()
{
  return MEMORY[0x24BE9F988]();
}

uint64_t sub_212A04914()
{
  return MEMORY[0x24BE9F990]();
}

uint64_t sub_212A04920()
{
  return MEMORY[0x24BE9F998]();
}

uint64_t sub_212A0492C()
{
  return MEMORY[0x24BE9F9A0]();
}

uint64_t sub_212A04938()
{
  return MEMORY[0x24BE9FEB0]();
}

uint64_t sub_212A04944()
{
  return MEMORY[0x24BEA04E8]();
}

uint64_t sub_212A04950()
{
  return MEMORY[0x24BEA06B0]();
}

uint64_t sub_212A0495C()
{
  return MEMORY[0x24BEA06B8]();
}

uint64_t sub_212A04968()
{
  return MEMORY[0x24BEA0898]();
}

uint64_t sub_212A04974()
{
  return MEMORY[0x24BEA08A8]();
}

uint64_t sub_212A04980()
{
  return MEMORY[0x24BEA0980]();
}

uint64_t sub_212A0498C()
{
  return MEMORY[0x24BEA0988]();
}

uint64_t sub_212A04998()
{
  return MEMORY[0x24BEA0990]();
}

uint64_t sub_212A049A4()
{
  return MEMORY[0x24BEA0B50]();
}

uint64_t sub_212A049B0()
{
  return MEMORY[0x24BEA0B58]();
}

uint64_t sub_212A049BC()
{
  return MEMORY[0x24BEA0EB8]();
}

uint64_t sub_212A049C8()
{
  return MEMORY[0x24BEA0EC0]();
}

uint64_t sub_212A049D4()
{
  return MEMORY[0x24BEA0EC8]();
}

uint64_t sub_212A049E0()
{
  return MEMORY[0x24BEA1038]();
}

uint64_t sub_212A049EC()
{
  return MEMORY[0x24BEA1048]();
}

uint64_t sub_212A049F8()
{
  return MEMORY[0x24BEA1058]();
}

uint64_t sub_212A04A04()
{
  return MEMORY[0x24BEA1060]();
}

uint64_t sub_212A04A10()
{
  return MEMORY[0x24BEA1088]();
}

uint64_t sub_212A04A1C()
{
  return MEMORY[0x24BEA1090]();
}

uint64_t sub_212A04A28()
{
  return MEMORY[0x24BEA1098]();
}

uint64_t sub_212A04A34()
{
  return MEMORY[0x24BEA1138]();
}

uint64_t sub_212A04A40()
{
  return MEMORY[0x24BEA1250]();
}

uint64_t sub_212A04A4C()
{
  return MEMORY[0x24BEA1280]();
}

uint64_t sub_212A04A58()
{
  return MEMORY[0x24BEA12F0]();
}

uint64_t sub_212A04A64()
{
  return MEMORY[0x24BEA14D0]();
}

uint64_t sub_212A04A70()
{
  return MEMORY[0x24BEA14D8]();
}

uint64_t sub_212A04A7C()
{
  return MEMORY[0x24BEA14E0]();
}

uint64_t sub_212A04A88()
{
  return MEMORY[0x24BEA1508]();
}

uint64_t sub_212A04A94()
{
  return MEMORY[0x24BEA1510]();
}

uint64_t sub_212A04AA0()
{
  return MEMORY[0x24BEA1520]();
}

uint64_t sub_212A04AAC()
{
  return MEMORY[0x24BEA1528]();
}

uint64_t sub_212A04AB8()
{
  return MEMORY[0x24BEA1568]();
}

uint64_t sub_212A04AC4()
{
  return MEMORY[0x24BEA1720]();
}

uint64_t sub_212A04AD0()
{
  return MEMORY[0x24BEA17C0]();
}

uint64_t sub_212A04ADC()
{
  return MEMORY[0x24BEA17C8]();
}

uint64_t sub_212A04AE8()
{
  return MEMORY[0x24BEA17E0]();
}

uint64_t sub_212A04AF4()
{
  return MEMORY[0x24BEA1A10]();
}

uint64_t sub_212A04B00()
{
  return MEMORY[0x24BEA1A18]();
}

uint64_t sub_212A04B0C()
{
  return MEMORY[0x24BEA1B28]();
}

uint64_t sub_212A04B18()
{
  return MEMORY[0x24BEA1B30]();
}

uint64_t sub_212A04B24()
{
  return MEMORY[0x24BEA1D20]();
}

uint64_t sub_212A04B30()
{
  return MEMORY[0x24BEA1D28]();
}

uint64_t sub_212A04B3C()
{
  return MEMORY[0x24BEA20D0]();
}

uint64_t sub_212A04B48()
{
  return MEMORY[0x24BEA20D8]();
}

uint64_t sub_212A04B54()
{
  return MEMORY[0x24BEA20F0]();
}

uint64_t sub_212A04B60()
{
  return MEMORY[0x24BEA2100]();
}

uint64_t sub_212A04B6C()
{
  return MEMORY[0x24BEA2108]();
}

uint64_t sub_212A04B78()
{
  return MEMORY[0x24BEA2360]();
}

uint64_t sub_212A04B84()
{
  return MEMORY[0x24BEA2368]();
}

uint64_t sub_212A04B90()
{
  return MEMORY[0x24BEA25D8]();
}

uint64_t sub_212A04B9C()
{
  return MEMORY[0x24BEA25E0]();
}

uint64_t sub_212A04BA8()
{
  return MEMORY[0x24BEA25F8]();
}

uint64_t sub_212A04BB4()
{
  return MEMORY[0x24BEA2600]();
}

uint64_t sub_212A04BC0()
{
  return MEMORY[0x24BEA27B8]();
}

uint64_t sub_212A04BCC()
{
  return MEMORY[0x24BEA27C0]();
}

uint64_t sub_212A04BD8()
{
  return MEMORY[0x24BEA27D8]();
}

uint64_t sub_212A04BE4()
{
  return MEMORY[0x24BEA27E0]();
}

uint64_t sub_212A04BF0()
{
  return MEMORY[0x24BEA2A80]();
}

uint64_t sub_212A04BFC()
{
  return MEMORY[0x24BEA2AB8]();
}

uint64_t sub_212A04C08()
{
  return MEMORY[0x24BEA2AC0]();
}

uint64_t sub_212A04C14()
{
  return MEMORY[0x24BEA2AF8]();
}

uint64_t sub_212A04C20()
{
  return MEMORY[0x24BEA2B00]();
}

uint64_t sub_212A04C2C()
{
  return MEMORY[0x24BEA2B10]();
}

uint64_t sub_212A04C38()
{
  return MEMORY[0x24BEA2B18]();
}

uint64_t sub_212A04C44()
{
  return MEMORY[0x24BEA2B38]();
}

uint64_t sub_212A04C50()
{
  return MEMORY[0x24BEA2B48]();
}

uint64_t sub_212A04C5C()
{
  return MEMORY[0x24BEA2B50]();
}

uint64_t sub_212A04C68()
{
  return MEMORY[0x24BEA2B98]();
}

uint64_t sub_212A04C74()
{
  return MEMORY[0x24BEA2BA0]();
}

uint64_t sub_212A04C80()
{
  return MEMORY[0x24BEA2BB8]();
}

uint64_t sub_212A04C8C()
{
  return MEMORY[0x24BEA2BC0]();
}

uint64_t sub_212A04C98()
{
  return MEMORY[0x24BEA3728]();
}

uint64_t sub_212A04CA4()
{
  return MEMORY[0x24BEA3730]();
}

uint64_t sub_212A04CB0()
{
  return MEMORY[0x24BEA3738]();
}

uint64_t sub_212A04CBC()
{
  return MEMORY[0x24BEA3740]();
}

uint64_t sub_212A04CC8()
{
  return MEMORY[0x24BEA3750]();
}

uint64_t sub_212A04CD4()
{
  return MEMORY[0x24BEA5508]();
}

uint64_t sub_212A04CE0()
{
  return MEMORY[0x24BEA3800]();
}

uint64_t sub_212A04CEC()
{
  return MEMORY[0x24BEA3810]();
}

uint64_t sub_212A04CF8()
{
  return MEMORY[0x24BEA3818]();
}

uint64_t sub_212A04D04()
{
  return MEMORY[0x24BEA3820]();
}

uint64_t sub_212A04D10()
{
  return MEMORY[0x24BEA8A80]();
}

uint64_t sub_212A04D1C()
{
  return MEMORY[0x24BEA8A88]();
}

uint64_t sub_212A04D28()
{
  return MEMORY[0x24BEA8BE8]();
}

uint64_t sub_212A04D34()
{
  return MEMORY[0x24BEA8BF8]();
}

uint64_t sub_212A04D40()
{
  return MEMORY[0x24BEA8C00]();
}

uint64_t sub_212A04D4C()
{
  return MEMORY[0x24BEA8C10]();
}

uint64_t sub_212A04D58()
{
  return MEMORY[0x24BEA8DC8]();
}

uint64_t sub_212A04D64()
{
  return MEMORY[0x24BE69808]();
}

uint64_t sub_212A04D70()
{
  return MEMORY[0x24BE698C8]();
}

uint64_t sub_212A04D7C()
{
  return MEMORY[0x24BE698D8]();
}

uint64_t sub_212A04D88()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_212A04D94()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_212A04DA0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_212A04DAC()
{
  return MEMORY[0x24BEA5598]();
}

uint64_t sub_212A04DB8()
{
  return MEMORY[0x24BEA55A0]();
}

uint64_t sub_212A04DC4()
{
  return MEMORY[0x24BEA55B0]();
}

uint64_t sub_212A04DD0()
{
  return MEMORY[0x24BEA55B8]();
}

uint64_t sub_212A04DDC()
{
  return MEMORY[0x24BEA5608]();
}

uint64_t sub_212A04DE8()
{
  return MEMORY[0x24BEA5610]();
}

uint64_t sub_212A04DF4()
{
  return MEMORY[0x24BEA5620]();
}

uint64_t sub_212A04E00()
{
  return MEMORY[0x24BEA5628]();
}

uint64_t sub_212A04E0C()
{
  return MEMORY[0x24BEA5670]();
}

uint64_t sub_212A04E18()
{
  return MEMORY[0x24BEA5678]();
}

uint64_t sub_212A04E24()
{
  return MEMORY[0x24BEA5680]();
}

uint64_t sub_212A04E30()
{
  return MEMORY[0x24BEA56D8]();
}

uint64_t sub_212A04E3C()
{
  return MEMORY[0x24BEA56F0]();
}

uint64_t sub_212A04E48()
{
  return MEMORY[0x24BEA56F8]();
}

uint64_t sub_212A04E54()
{
  return MEMORY[0x24BEA5700]();
}

uint64_t sub_212A04E60()
{
  return MEMORY[0x24BEA5748]();
}

uint64_t sub_212A04E6C()
{
  return MEMORY[0x24BEA5770]();
}

uint64_t sub_212A04E78()
{
  return MEMORY[0x24BEA5788]();
}

uint64_t sub_212A04E84()
{
  return MEMORY[0x24BEA5790]();
}

uint64_t sub_212A04E90()
{
  return MEMORY[0x24BEA5798]();
}

uint64_t sub_212A04E9C()
{
  return MEMORY[0x24BEA57A8]();
}

uint64_t sub_212A04EA8()
{
  return MEMORY[0x24BEA57B0]();
}

uint64_t sub_212A04EB4()
{
  return MEMORY[0x24BEA57B8]();
}

uint64_t sub_212A04EC0()
{
  return MEMORY[0x24BEA57C0]();
}

uint64_t sub_212A04ECC()
{
  return MEMORY[0x24BEA57C8]();
}

uint64_t sub_212A04ED8()
{
  return MEMORY[0x24BEA57D0]();
}

uint64_t sub_212A04EE4()
{
  return MEMORY[0x24BEA57E0]();
}

uint64_t sub_212A04EF0()
{
  return MEMORY[0x24BEA57F8]();
}

uint64_t sub_212A04EFC()
{
  return MEMORY[0x24BEA5820]();
}

uint64_t sub_212A04F08()
{
  return MEMORY[0x24BEA5898]();
}

uint64_t sub_212A04F14()
{
  return MEMORY[0x24BEA59C8]();
}

uint64_t sub_212A04F20()
{
  return MEMORY[0x24BEA59D8]();
}

uint64_t sub_212A04F2C()
{
  return MEMORY[0x24BEB9A18]();
}

uint64_t sub_212A04F38()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_212A04F44()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_212A04F50()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_212A04F5C()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_212A04F68()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_212A04F74()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_212A04F80()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_212A04F8C()
{
  return MEMORY[0x24BEE06E0]();
}

uint64_t sub_212A04F98()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_212A04FA4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_212A04FB0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_212A04FBC()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_212A04FC8()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_212A04FD4()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_212A04FE0()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_212A04FEC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_212A04FF8()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_212A05004()
{
  return MEMORY[0x24BEE0BB8]();
}

uint64_t sub_212A05010()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_212A0501C()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_212A05028()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_212A05034()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_212A05040()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_212A0504C()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_212A05058()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_212A05064()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_212A05070()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_212A0507C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_212A05088()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_212A05094()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_212A050A0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_212A050AC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_212A050B8()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_212A050C4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_212A050D0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_212A050DC()
{
  return MEMORY[0x24BEE1168]();
}

uint64_t sub_212A050E8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_212A050F4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_212A05100()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_212A0510C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_212A05118()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_212A05124()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_212A05130()
{
  return MEMORY[0x24BEE5918]();
}

uint64_t sub_212A0513C()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_212A05148()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_212A05154()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_212A05160()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_212A0516C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_212A05178()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_212A05184()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_212A05190()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_212A0519C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_212A051A8()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_212A051B4()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_212A051C0()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_212A051CC()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_212A051D8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_212A051E4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_212A051F0()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_212A051FC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_212A05208()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_212A05214()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_212A05220()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_212A0522C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_212A05238()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_212A05244()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_212A05250()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_212A0525C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_212A05268()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_212A05274()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_212A05280()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_212A0528C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_212A05298()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_212A052A4()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_212A052B0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_212A052BC()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_212A052C8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_212A052D4()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_212A052E0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_212A052EC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_212A052F8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_212A05304()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_212A05310()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_212A0531C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_212A05328()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_212A05334()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t LNIntentsValueTypeIdentifierAsString()
{
  return MEMORY[0x24BE5F918]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

