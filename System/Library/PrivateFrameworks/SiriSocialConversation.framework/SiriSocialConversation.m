uint64_t static SocialConversationIntent.supportsSecureCoding.getter()
{
  return 1;
}

unint64_t static SiriSocialConversationDataModels.bundleName.getter()
{
  return 0xD00000000000001ELL;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.init(label:directInvocation:userData:link:separated:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, char a6@<W7>, uint64_t a7@<X8>)
{
  int *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t result;

  sub_230ADF330();
  v9 = (int *)OUTLINED_FUNCTION_11();
  v10 = (_QWORD *)(a7 + v9[5]);
  *v10 = 0;
  v10[1] = 0xE000000000000000;
  v11 = v9[6];
  *(_QWORD *)(a7 + v11) = sub_230ADF390();
  v12 = (_QWORD *)(a7 + v9[8]);
  *v12 = 0;
  v12[1] = 0xE000000000000000;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F380);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a7, v13);
  sub_230ADF330();
  swift_bridgeObjectRelease();
  *v10 = a1;
  v10[1] = a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a7 + v11) = a3;
  *(_BYTE *)(a7 + v9[7]) = a6;
  result = swift_bridgeObjectRelease();
  *v12 = a4;
  v12[1] = a5;
  return result;
}

uint64_t type metadata accessor for SiriSocialConversationDataModels.ButtonModel(uint64_t a1)
{
  return sub_230ADCD7C(a1, (uint64_t *)&unk_255E9F560);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348BDB1C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.label.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F380);
  return sub_230ADF354();
}

uint64_t SiriSocialConversationDataModels.ButtonModel.label.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F380);
  sub_230ADF348();
  return v1;
}

uint64_t sub_230ADA640()
{
  swift_bridgeObjectRetain();
  return SiriSocialConversationDataModels.ButtonModel.label.setter();
}

void SiriSocialConversationDataModels.ButtonModel.label.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_33();
  *v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F380);
  v1[4] = OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_6();
}

uint64_t SiriSocialConversationDataModels.ButtonModel.directInvocation.getter()
{
  return sub_230ADB7E4((void (*)(_QWORD))type metadata accessor for SiriSocialConversationDataModels.ButtonModel);
}

void SiriSocialConversationDataModels.ButtonModel.directInvocation.setter(uint64_t a1, uint64_t a2)
{
  sub_230ADB820(a1, a2, (void (*)(_QWORD))type metadata accessor for SiriSocialConversationDataModels.ButtonModel);
}

uint64_t (*SiriSocialConversationDataModels.ButtonModel.directInvocation.modify())()
{
  OUTLINED_FUNCTION_11();
  return nullsub_1;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.userData.getter()
{
  type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0);
  return swift_bridgeObjectRetain();
}

void SiriSocialConversationDataModels.ButtonModel.userData.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(OUTLINED_FUNCTION_11() + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  OUTLINED_FUNCTION_6();
}

uint64_t (*SiriSocialConversationDataModels.ButtonModel.userData.modify())()
{
  type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0);
  return nullsub_1;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.separated.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0
                            + *(int *)(type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0) + 28));
}

void SiriSocialConversationDataModels.ButtonModel.separated.setter(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + *(int *)(type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0) + 28)) = a1;
  OUTLINED_FUNCTION_28();
}

uint64_t (*SiriSocialConversationDataModels.ButtonModel.separated.modify())()
{
  type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0);
  return nullsub_1;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.link.getter()
{
  type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0);
  OUTLINED_FUNCTION_27();
  return OUTLINED_FUNCTION_26();
}

void SiriSocialConversationDataModels.ButtonModel.link.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0);
  OUTLINED_FUNCTION_37();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_6();
}

uint64_t (*SiriSocialConversationDataModels.ButtonModel.link.modify())()
{
  type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0);
  return nullsub_1;
}

uint64_t SiriSocialConversationDataModels.ButtonModel.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F380);
  sub_230ADA948();
  sub_230ADF39C();
  OUTLINED_FUNCTION_11();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_26();
  sub_230ADF3C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v0 = OUTLINED_FUNCTION_26();
  sub_230ADC86C(v0, v1);
  swift_bridgeObjectRelease();
  sub_230ADF480();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_26();
  sub_230ADF3C0();
  return swift_bridgeObjectRelease();
}

unint64_t sub_230ADA948()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255E9F388;
  if (!qword_255E9F388)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E9F380);
    v2 = MEMORY[0x24BEE0D10];
    result = MEMORY[0x2348BDB34](MEMORY[0x24BEAD378], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255E9F388);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348BDB28](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void static SiriSocialConversationDataModels.ButtonModel.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  if ((sub_230ADF360() & 1) != 0
    && ((v4 = (int *)OUTLINED_FUNCTION_11(), OUTLINED_FUNCTION_18(v4[5]), v7) ? (v7 = v5 == v6) : (v7 = 0),
        (v7 || (sub_230ADF45C() & 1) != 0)
     && (sub_230ADAAA4(*(_QWORD *)(a1 + v4[6]), *(_QWORD *)(a2 + v4[6])) & 1) != 0
     && *(unsigned __int8 *)(a1 + v4[7]) == *(unsigned __int8 *)(a2 + v4[7])
     && ((OUTLINED_FUNCTION_18(v4[8]), v7) ? (v10 = v8 == v9) : (v10 = 0), !v10)))
  {
    sub_230ADF45C();
  }
  else
  {
    OUTLINED_FUNCTION_6();
  }
}

uint64_t sub_230ADAAA4(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  char v22;
  _QWORD *v23;
  char v25;
  int64_t v26;

  if (result == a2)
    return 1;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = 0;
  v5 = result + 64;
  v6 = 1 << *(_BYTE *)(result + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(result + 64);
  v26 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v10 = v9 | (v4 << 6);
      goto LABEL_24;
    }
    v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v11 >= v26)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v11);
    ++v4;
    if (!v12)
    {
      v4 = v11 + 1;
      if (v11 + 1 >= v26)
        return 1;
      v12 = *(_QWORD *)(v5 + 8 * v4);
      if (!v12)
      {
        v4 = v11 + 2;
        if (v11 + 2 >= v26)
          return 1;
        v12 = *(_QWORD *)(v5 + 8 * v4);
        if (!v12)
        {
          v4 = v11 + 3;
          if (v11 + 3 >= v26)
            return 1;
          v12 = *(_QWORD *)(v5 + 8 * v4);
          if (!v12)
            break;
        }
      }
    }
LABEL_23:
    v8 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_24:
    v14 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v15 = *v14;
    v16 = v14[1];
    v17 = (uint64_t *)(*(_QWORD *)(v3 + 56) + 16 * v10);
    v19 = *v17;
    v18 = v17[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v20 = sub_230ADC728(v15, v16);
    v22 = v21;
    swift_bridgeObjectRelease();
    if ((v22 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    v23 = (_QWORD *)(*(_QWORD *)(a2 + 56) + 16 * v20);
    if (*v23 == v19 && v23[1] == v18)
    {
      result = swift_bridgeObjectRelease();
    }
    else
    {
      v25 = sub_230ADF45C();
      result = swift_bridgeObjectRelease();
      if ((v25 & 1) == 0)
        return 0;
    }
  }
  v13 = v11 + 4;
  if (v13 >= v26)
    return 1;
  v12 = *(_QWORD *)(v5 + 8 * v13);
  if (v12)
  {
    v4 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    v4 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v4 >= v26)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v4);
    ++v13;
    if (v12)
      goto LABEL_23;
  }
LABEL_36:
  __break(1u);
  return result;
}

BOOL sub_230ADACBC(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_230ADACCC()
{
  return sub_230ADF474();
}

uint64_t sub_230ADACF0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  char v9;

  v2 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_230ADF45C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000230AE0050 || (sub_230ADF45C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = a1 == 0x6174614472657375 && a2 == 0xE800000000000000;
    if (v6 || (sub_230ADF45C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = a1 == 0x6574617261706573 && a2 == 0xE900000000000064;
      if (v7 || (sub_230ADF45C() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 1802398060 && a2 == 0xE400000000000000)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        v9 = sub_230ADF45C();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 4;
        else
          return 5;
      }
    }
  }
}

uint64_t sub_230ADAEEC()
{
  return 5;
}

uint64_t sub_230ADAEF4()
{
  return 0;
}

uint64_t sub_230ADAF00(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_230ADAF30 + 4 * byte_230ADF760[a1]))(0x6C6562616CLL, 0xE500000000000000);
}

unint64_t sub_230ADAF30()
{
  return 0xD000000000000010;
}

uint64_t sub_230ADAF4C()
{
  return 0x6174614472657375;
}

uint64_t sub_230ADAF64()
{
  return 0x6574617261706573;
}

uint64_t sub_230ADAF80()
{
  return 1802398060;
}

BOOL sub_230ADAF90(char *a1, char *a2)
{
  return sub_230ADACBC(*a1, *a2);
}

void sub_230ADAF9C()
{
  sub_230ADBA28();
}

uint64_t sub_230ADAFB4()
{
  return sub_230ADACCC();
}

uint64_t sub_230ADAFC0()
{
  unsigned __int8 *v0;

  return sub_230ADAF00(*v0);
}

uint64_t sub_230ADAFC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_230ADACF0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_230ADAFEC()
{
  return sub_230ADAEF4();
}

uint64_t sub_230ADB008@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_230ADAEEC();
  *a1 = result;
  return result;
}

uint64_t sub_230ADB02C()
{
  sub_230ADCA54();
  return sub_230ADF4B0();
}

uint64_t sub_230ADB054()
{
  sub_230ADCA54();
  return sub_230ADF4BC();
}

void SiriSocialConversationDataModels.ButtonModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F390);
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8]();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_230ADCA54();
  OUTLINED_FUNCTION_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F380);
  sub_230ADCAB0((uint64_t)&unk_255E9F3A0);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_10();
  if (!v1)
  {
    type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0);
    OUTLINED_FUNCTION_3();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3A8);
    sub_230ADCAB0((uint64_t)&unk_255E9F3B0);
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_20();
    sub_230ADF438();
  }
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_16();
}

void SiriSocialConversationDataModels.ButtonModel.hashValue.getter()
{
  OUTLINED_FUNCTION_15();
  SiriSocialConversationDataModels.ButtonModel.hash(into:)();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4();
}

void SiriSocialConversationDataModels.ButtonModel.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;

  OUTLINED_FUNCTION_21();
  v3 = v2;
  v16 = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F380);
  v21 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v17 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3B8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_7();
  v7 = (int *)type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_2();
  v24 = 0;
  sub_230ADF330();
  v8 = (uint64_t *)(v1 + v7[5]);
  *v8 = 0;
  v8[1] = 0xE000000000000000;
  v23 = v8;
  v22 = v7[6];
  *(_QWORD *)(v1 + v22) = sub_230ADF390();
  v9 = (uint64_t *)(v1 + v7[8]);
  *v9 = 0;
  v9[1] = 0xE000000000000000;
  v19 = v9;
  v20 = (uint64_t)v3;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_230ADCA54();
  sub_230ADF498();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v1, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    LOBYTE(v24) = 0;
    sub_230ADCAB0((uint64_t)&unk_255E9F3C0);
    sub_230ADF414();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 40))(v1, v17, v5);
    v10 = OUTLINED_FUNCTION_17(1);
    v12 = v11;
    v18 = v10;
    swift_bridgeObjectRelease();
    *v23 = v18;
    v23[1] = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3A8);
    sub_230ADCB04();
    sub_230ADF414();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v1 + v22) = v24;
    *(_BYTE *)(v1 + v7[7]) = sub_230ADF408() & 1;
    v13 = OUTLINED_FUNCTION_17(4);
    v15 = v14;
    OUTLINED_FUNCTION_1();
    swift_bridgeObjectRelease();
    *v19 = v13;
    v19[1] = v15;
    sub_230ADCD3C(v1, v16, type metadata accessor for SiriSocialConversationDataModels.ButtonModel);
    __swift_destroy_boxed_opaque_existential_1(v20);
    sub_230ADCC68(v1, type metadata accessor for SiriSocialConversationDataModels.ButtonModel);
  }
  OUTLINED_FUNCTION_0();
}

void sub_230ADB5B0()
{
  SiriSocialConversationDataModels.ButtonModel.init(from:)();
}

void sub_230ADB5C4(_QWORD *a1)
{
  SiriSocialConversationDataModels.ButtonModel.encode(to:)(a1);
}

uint64_t sub_230ADB5E0()
{
  sub_230ADF468();
  SiriSocialConversationDataModels.ButtonModel.hash(into:)();
  return sub_230ADF48C();
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.init(buttons:text:sash:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X8>)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D0);
  sub_230ADF330();
  v8 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
  v9 = (_QWORD *)(a4 + *(int *)(v8 + 20));
  *v9 = 0;
  v9[1] = 0xE000000000000000;
  v10 = *(int *)(v8 + 24);
  *(_BYTE *)(a4 + v10) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
  result = sub_230ADF354();
  *v9 = a1;
  v9[1] = a2;
  *(_BYTE *)(a4 + v10) = a3;
  return result;
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.buttons.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
  return sub_230ADF354();
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.buttons.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
  sub_230ADF348();
  return v1;
}

uint64_t sub_230ADB740()
{
  swift_bridgeObjectRetain();
  return SiriSocialConversationDataModels.ButtonStackModel.buttons.setter();
}

void SiriSocialConversationDataModels.ButtonStackModel.buttons.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_33();
  *v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
  v1[4] = OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_6();
}

void sub_230ADB7A8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.text.getter()
{
  return sub_230ADB7E4((void (*)(_QWORD))type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel);
}

uint64_t sub_230ADB7E4(void (*a1)(_QWORD))
{
  a1(0);
  OUTLINED_FUNCTION_27();
  return OUTLINED_FUNCTION_26();
}

void SiriSocialConversationDataModels.ButtonStackModel.text.setter(uint64_t a1, uint64_t a2)
{
  sub_230ADB820(a1, a2, (void (*)(_QWORD))type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel);
}

void sub_230ADB820(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  _QWORD *v3;

  a3(0);
  OUTLINED_FUNCTION_37();
  *v3 = a1;
  v3[1] = a2;
  OUTLINED_FUNCTION_6();
}

uint64_t (*SiriSocialConversationDataModels.ButtonStackModel.text.modify())()
{
  type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
  return nullsub_1;
}

uint64_t SiriSocialConversationDataModels.ButtonStackModel.sash.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0
                            + *(int *)(type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0)
                                     + 24));
}

void SiriSocialConversationDataModels.ButtonStackModel.sash.setter(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + *(int *)(type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0) + 24)) = a1;
  OUTLINED_FUNCTION_28();
}

uint64_t (*SiriSocialConversationDataModels.ButtonStackModel.sash.modify())()
{
  type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
  return nullsub_1;
}

uint64_t sub_230ADB8EC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v8;

  v2 = a1 == 0x736E6F74747562 && a2 == 0xE700000000000000;
  if (v2 || (sub_230ADF45C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 1954047348 && a2 == 0xE400000000000000;
    if (v6 || (sub_230ADF45C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 1752392051 && a2 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = sub_230ADF45C();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_230ADBA20()
{
  return 3;
}

void sub_230ADBA28()
{
  OUTLINED_FUNCTION_15();
  sub_230ADF474();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_230ADBA58(char a1)
{
  if (!a1)
    return 0x736E6F74747562;
  if (a1 == 1)
    return 1954047348;
  return 1752392051;
}

void sub_230ADBAA0()
{
  sub_230ADF468();
  sub_230ADF474();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_230ADBAD4()
{
  char *v0;

  return sub_230ADBA58(*v0);
}

uint64_t sub_230ADBADC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_230ADB8EC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_230ADBB00@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_230ADBA20();
  *a1 = result;
  return result;
}

uint64_t sub_230ADBB24()
{
  sub_230ADCB74();
  return sub_230ADF4B0();
}

uint64_t sub_230ADBB4C()
{
  sub_230ADCB74();
  return sub_230ADF4BC();
}

void SiriSocialConversationDataModels.ButtonStackModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3E0);
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8]();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_230ADCB74();
  OUTLINED_FUNCTION_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
  sub_230ADCCA0((uint64_t)&unk_255E9F3F0);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_10();
  if (!v1)
  {
    type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_20();
  }
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_16();
}

void SiriSocialConversationDataModels.ButtonStackModel.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_21();
  v3 = v2;
  v13 = v4;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
  v14 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v16 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F418);
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_7();
  v6 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D0);
  sub_230ADF330();
  v7 = (uint64_t *)(v1 + *(int *)(v6 + 20));
  *v7 = 0;
  v7[1] = 0xE000000000000000;
  v8 = *(int *)(v6 + 24);
  *(_BYTE *)(v1 + v8) = 1;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_230ADCB74();
  sub_230ADF498();
  if (!v0)
  {
    v12 = v8;
    sub_230ADCCA0((uint64_t)&unk_255E9F420);
    sub_230ADF414();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 40))(v1, v16, v15);
    v9 = sub_230ADF3FC();
    v11 = v10;
    swift_bridgeObjectRelease();
    *v7 = v9;
    v7[1] = v11;
    LOBYTE(v9) = sub_230ADF408();
    OUTLINED_FUNCTION_9();
    *(_BYTE *)(v1 + v12) = v9 & 1;
    sub_230ADCD3C(v1, v13, type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  sub_230ADCC68(v1, type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel);
  OUTLINED_FUNCTION_0();
}

uint64_t sub_230ADBECC(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_230ADF45C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_230ADBF38()
{
  return 12383;
}

uint64_t sub_230ADBF44()
{
  return 1;
}

uint64_t sub_230ADBF4C()
{
  return sub_230ADF474();
}

uint64_t sub_230ADBF70(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x74536E6F74747562 && a2 == 0xEF776569566B6361)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_230ADF45C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_230ADC018()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_230ADC03C()
{
  return 0x74536E6F74747562;
}

void sub_230ADC060()
{
  SiriSocialConversationDataModels.ButtonStackModel.init(from:)();
}

void sub_230ADC074(_QWORD *a1)
{
  SiriSocialConversationDataModels.ButtonStackModel.encode(to:)(a1);
}

void sub_230ADC08C()
{
  sub_230ADC018();
}

uint64_t sub_230ADC0AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_230ADBECC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_230ADC0D4()
{
  sub_230ADCDE8();
  return sub_230ADF4B0();
}

uint64_t sub_230ADC0FC()
{
  sub_230ADCDE8();
  return sub_230ADF4BC();
}

void sub_230ADC124()
{
  sub_230ADF468();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_230ADC150@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_230ADBF70(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_230ADC178()
{
  return sub_230ADAEF4();
}

uint64_t sub_230ADC190@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_230ADBF44();
  *a1 = result & 1;
  return result;
}

uint64_t sub_230ADC1B8()
{
  sub_230ADCDAC();
  return sub_230ADF4B0();
}

uint64_t sub_230ADC1E0()
{
  sub_230ADCDAC();
  return sub_230ADF4BC();
}

void SiriSocialConversationDataModels.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
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
  uint64_t v15;

  OUTLINED_FUNCTION_21();
  v13 = v1;
  v4 = v3;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F428);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_2();
  type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_7();
  v7 = v6 - v5;
  type metadata accessor for SiriSocialConversationDataModels(0);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_7();
  v10 = v9 - v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F430);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_22();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_230ADCDAC();
  sub_230ADF4A4();
  sub_230ADCD3C(v13, v10, type metadata accessor for SiriSocialConversationDataModels);
  sub_230ADCE9C(v10, v7, type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel);
  sub_230ADCDE8();
  sub_230ADF42C();
  sub_230ADCC30((uint64_t)&unk_255E9F448);
  sub_230ADF450();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v2, v14);
  sub_230ADCC68(v7, type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v0, v11);
  OUTLINED_FUNCTION_0();
}

void SiriSocialConversationDataModels.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
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
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  OUTLINED_FUNCTION_21();
  v3 = v2;
  v19 = v4;
  v21 = type metadata accessor for SiriSocialConversationDataModels(0);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v20 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F450);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_22();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F458);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_2();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_230ADCDAC();
  v8 = (uint64_t)v3;
  sub_230ADF498();
  if (!v0)
  {
    v9 = sub_230ADF420();
    v10 = *(_QWORD *)(v9 + 16);
    v11 = v6;
    if (v10
      && (sub_230ADCE24(1, v10, v9, v9 + 32, 0, (2 * v10) | 1),
          v13 = v12,
          v15 = v14,
          swift_bridgeObjectRelease(),
          v13 == v15 >> 1))
    {
      sub_230ADCDE8();
      sub_230ADF3E4();
      type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
      sub_230ADCC30((uint64_t)&unk_255E9F468);
      sub_230ADF414();
      v8 = (uint64_t)v3;
      OUTLINED_FUNCTION_14();
      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v6);
      sub_230ADCE9C(v20, v19, type metadata accessor for SiriSocialConversationDataModels);
    }
    else
    {
      v16 = sub_230ADF3D8();
      swift_allocError();
      v18 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F460);
      *v18 = v21;
      sub_230ADF3F0();
      sub_230ADF3CC();
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x24BEE26D0], v16);
      swift_willThrow();
      v8 = (uint64_t)v3;
      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v11);
    }
  }
  __swift_destroy_boxed_opaque_existential_1(v8);
  OUTLINED_FUNCTION_0();
}

unint64_t sub_230ADC6E0()
{
  static SiriSocialConversationDataModels.bundleName.getter();
  return 0xD00000000000001ELL;
}

void sub_230ADC700()
{
  SiriSocialConversationDataModels.init(from:)();
}

void sub_230ADC714()
{
  SiriSocialConversationDataModels.encode(to:)();
}

unint64_t sub_230ADC728(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_230ADF468();
  sub_230ADF3C0();
  v4 = sub_230ADF48C();
  return sub_230ADC78C(a1, a2, v4);
}

unint64_t sub_230ADC78C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_230ADF45C() & 1) == 0)
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
      while (!v14 && (sub_230ADF45C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_230ADC86C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;

  v12 = a2 + 64;
  v2 = 1 << *(_BYTE *)(a2 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a2 + 64);
  v5 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  v8 = 0;
  if (!v4)
    goto LABEL_5;
LABEL_4:
  for (v4 &= v4 - 1; ; v4 = (v10 - 1) & v10)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_230ADF3C0();
    swift_bridgeObjectRelease();
    sub_230ADF3C0();
    swift_bridgeObjectRelease();
    result = sub_230ADF48C();
    v7 ^= result;
    if (v4)
      goto LABEL_4;
LABEL_5:
    v9 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v9 >= v5)
      goto LABEL_19;
    v10 = *(_QWORD *)(v12 + 8 * v9);
    ++v8;
    if (!v10)
    {
      v8 = v9 + 1;
      if (v9 + 1 >= v5)
        goto LABEL_19;
      v10 = *(_QWORD *)(v12 + 8 * v8);
      if (!v10)
        break;
    }
LABEL_16:
    ;
  }
  v11 = v9 + 2;
  if (v11 >= v5)
  {
LABEL_19:
    swift_release();
    return sub_230ADF474();
  }
  v10 = *(_QWORD *)(v12 + 8 * v11);
  if (v10)
  {
    v8 = v11;
    goto LABEL_16;
  }
  while (1)
  {
    v8 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v8 >= v5)
      goto LABEL_19;
    v10 = *(_QWORD *)(v12 + 8 * v8);
    ++v11;
    if (v10)
      goto LABEL_16;
  }
LABEL_21:
  __break(1u);
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_230ADCA54()
{
  unint64_t result;

  result = qword_255E9F398;
  if (!qword_255E9F398)
  {
    result = MEMORY[0x2348BDB34](&unk_230ADFE1C, &type metadata for SiriSocialConversationDataModels.ButtonModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E9F398);
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

void sub_230ADCAB0(uint64_t a1)
{
  unint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  if (!OUTLINED_FUNCTION_34(a1))
  {
    v5 = v4;
    v6 = v3;
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(v2);
    v8[0] = v6;
    v8[1] = MEMORY[0x24BEE0D08];
    atomic_store(MEMORY[0x2348BDB34](v5, v7, v8), v1);
  }
  OUTLINED_FUNCTION_19();
}

unint64_t sub_230ADCB04()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255E9F3C8;
  if (!qword_255E9F3C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E9F3A8);
    v2[0] = MEMORY[0x24BEE0D38];
    v2[1] = MEMORY[0x24BEE0D38];
    result = MEMORY[0x2348BDB34](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255E9F3C8);
  }
  return result;
}

uint64_t type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1)
{
  return sub_230ADCD7C(a1, (uint64_t *)&unk_255E9F608);
}

unint64_t sub_230ADCB74()
{
  unint64_t result;

  result = qword_255E9F3E8;
  if (!qword_255E9F3E8)
  {
    result = MEMORY[0x2348BDB34](&unk_230ADFDCC, &type metadata for SiriSocialConversationDataModels.ButtonStackModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E9F3E8);
  }
  return result;
}

unint64_t sub_230ADCBB0(uint64_t a1)
{
  unint64_t *v1;
  unint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = OUTLINED_FUNCTION_34(a1);
  if (!result)
  {
    v5 = v4;
    v6 = v3;
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E9F3D0);
    sub_230ADCC30(v6);
    v9 = v8;
    result = MEMORY[0x2348BDB34](v5, v7, &v9);
    atomic_store(result, v1);
  }
  return result;
}

void sub_230ADCC30(uint64_t a1)
{
  unint64_t *v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!OUTLINED_FUNCTION_34(a1))
  {
    v4 = v3;
    v5 = v2(255);
    atomic_store(MEMORY[0x2348BDB34](v4, v5), v1);
  }
  OUTLINED_FUNCTION_28();
}

void sub_230ADCC68(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_28();
}

void sub_230ADCCA0(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  if (!OUTLINED_FUNCTION_34(a1))
  {
    v3 = v2;
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E9F3D8);
    v5[0] = sub_230ADCBB0((uint64_t)&unk_255E9F3F8);
    v5[1] = sub_230ADCBB0((uint64_t)&unk_255E9F408);
    atomic_store(MEMORY[0x2348BDB34](v3, v4, v5), v1);
  }
  OUTLINED_FUNCTION_19();
}

void sub_230ADCD3C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_25(a1, a2, a3);
  OUTLINED_FUNCTION_38(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_28();
}

uint64_t type metadata accessor for SiriSocialConversationDataModels(uint64_t a1)
{
  return sub_230ADCD7C(a1, (uint64_t *)&unk_255E9F4F8);
}

uint64_t sub_230ADCD7C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_230ADCDAC()
{
  unint64_t result;

  result = qword_255E9F438;
  if (!qword_255E9F438)
  {
    result = MEMORY[0x2348BDB34](&unk_230ADFD7C, &type metadata for SiriSocialConversationDataModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E9F438);
  }
  return result;
}

unint64_t sub_230ADCDE8()
{
  unint64_t result;

  result = qword_255E9F440;
  if (!qword_255E9F440)
  {
    result = MEMORY[0x2348BDB34](&unk_230ADFD2C, &type metadata for SiriSocialConversationDataModels.ButtonStackViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E9F440);
  }
  return result;
}

uint64_t sub_230ADCE24(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2)
    goto LABEL_10;
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0)
    return swift_unknownObjectRetain();
LABEL_12:
  __break(1u);
  return result;
}

void sub_230ADCE9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_25(a1, a2, a3);
  OUTLINED_FUNCTION_38(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_28();
}

void sub_230ADCEC8()
{
  sub_230ADCC30((uint64_t)&unk_255E9F470);
}

void sub_230ADCEF4()
{
  sub_230ADCC30((uint64_t)&unk_255E9F468);
}

void sub_230ADCF20()
{
  sub_230ADCC30((uint64_t)&unk_255E9F448);
}

void sub_230ADCF4C()
{
  sub_230ADCC30((uint64_t)&unk_255E9F478);
}

void sub_230ADCF78()
{
  sub_230ADCC30((uint64_t)&unk_255E9F480);
}

void sub_230ADCFA4(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = SiriSocialConversationDataModels.ButtonModel.label.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_28();
}

void sub_230ADCFCC(uint64_t *a1@<X8>)
{
  *a1 = SiriSocialConversationDataModels.ButtonStackModel.buttons.getter();
  OUTLINED_FUNCTION_28();
}

_QWORD *initializeBufferWithCopyOfBuffer for SiriSocialConversationDataModels(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    v7 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
    v8 = *(int *)(v7 + 20);
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    v12 = *v10;
    v11 = v10[1];
    *v9 = v12;
    v9[1] = v11;
    *((_BYTE *)a1 + *(int *)(v7 + 24)) = *((_BYTE *)a2 + *(int *)(v7 + 24));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for SiriSocialConversationDataModels(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriSocialConversationDataModels(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  v5 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
  v6 = *(int *)(v5 + 20);
  v7 = (_QWORD *)(a1 + v6);
  v8 = (uint64_t *)(a2 + v6);
  v10 = *v8;
  v9 = v8[1];
  *v7 = v10;
  v7[1] = v9;
  *(_BYTE *)(a1 + *(int *)(v5 + 24)) = *(_BYTE *)(a2 + *(int *)(v5 + 24));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriSocialConversationDataModels(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  v5 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
  v6 = *(int *)(v5 + 20);
  v7 = (_QWORD *)(a1 + v6);
  v8 = (_QWORD *)(a2 + v6);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + *(int *)(v5 + 24)) = *(_BYTE *)(a2 + *(int *)(v5 + 24));
  return a1;
}

uint64_t initializeWithTake for SiriSocialConversationDataModels(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  v5 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
  *(_OWORD *)(a1 + *(int *)(v5 + 20)) = *(_OWORD *)(a2 + *(int *)(v5 + 20));
  *(_BYTE *)(a1 + *(int *)(v5 + 24)) = *(_BYTE *)(a2 + *(int *)(v5 + 24));
  return a1;
}

uint64_t assignWithTake for SiriSocialConversationDataModels(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  v5 = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
  v6 = *(int *)(v5 + 20);
  v7 = (_QWORD *)(a1 + v6);
  v8 = (uint64_t *)(a2 + v6);
  v10 = *v8;
  v9 = v8[1];
  *v7 = v10;
  v7[1] = v9;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + *(int *)(v5 + 24)) = *(_BYTE *)(a2 + *(int *)(v5 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriSocialConversationDataModels()
{
  type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_230ADD31C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &qword_255E9F3D8);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for SiriSocialConversationDataModels()
{
  type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(0);
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_230ADD380(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, &qword_255E9F3D8);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_230ADD398()
{
  return 0;
}

uint64_t sub_230ADD3A0(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8);
    swift_initEnumMetadataSingleCase();
    result = 0;
    *(_DWORD *)(*(_QWORD *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for SiriSocialConversationDataModels.ButtonModel(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F380);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (_QWORD *)((char *)a1 + v8);
    v11 = (_QWORD *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    *(_QWORD *)((char *)a1 + v9) = *(_QWORD *)((char *)a2 + v9);
    v13 = a3[8];
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    v14 = (_QWORD *)((char *)a1 + v13);
    v15 = (_QWORD *)((char *)a2 + v13);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for SiriSocialConversationDataModels.ButtonModel(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F380);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriSocialConversationDataModels.ButtonModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v12 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v13 = (_QWORD *)(a1 + v12);
  v14 = (_QWORD *)(a2 + v12);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriSocialConversationDataModels.ButtonModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v10 = a3[8];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for SiriSocialConversationDataModels.ButtonModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  return a1;
}

uint64_t assignWithTake for SiriSocialConversationDataModels.ButtonModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_bridgeObjectRelease();
  v12 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_230ADD7D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &qword_255E9F380);
}

uint64_t storeEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_230ADD7EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, &qword_255E9F380);
}

void sub_230ADD7F8()
{
  unint64_t v0;

  sub_230ADD884();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_230ADD884()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255E9F570)
  {
    v0 = sub_230ADF36C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255E9F570);
  }
}

_QWORD *initializeBufferWithCopyOfBuffer for SiriSocialConversationDataModels.ButtonStackModel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = (_QWORD *)((char *)a1 + v8);
    v11 = (_QWORD *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    *((_BYTE *)a1 + v9) = *((_BYTE *)a2 + v9);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for SiriSocialConversationDataModels.ButtonStackModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E9F3D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonStackModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_230ADDBA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &qword_255E9F3D8);
}

void __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    __swift_getEnumTagSinglePayload(a1, a2, v6);
  else
    OUTLINED_FUNCTION_6();
}

uint64_t storeEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonStackModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_230ADDC34(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, &qword_255E9F3D8);
}

void __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v9);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
    OUTLINED_FUNCTION_6();
  }
}

void sub_230ADDCB0()
{
  unint64_t v0;

  sub_230ADDD2C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_230ADDD2C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255E9F618[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E9F3D0);
    v0 = sub_230ADF36C();
    if (!v1)
      atomic_store(v0, qword_255E9F618);
  }
}

ValueMetadata *type metadata accessor for SiriSocialConversationDataModels.CodingKeys()
{
  return &type metadata for SiriSocialConversationDataModels.CodingKeys;
}

uint64_t _s22SiriSocialConversation32SiriSocialConversationDataModelsO10CodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s22SiriSocialConversation32SiriSocialConversationDataModelsO10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_230ADDE34 + 4 * byte_230ADF765[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_230ADDE54 + 4 * byte_230ADF76A[v4]))();
}

_BYTE *sub_230ADDE34(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_230ADDE54(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_230ADDE5C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_230ADDE64(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_230ADDE6C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_230ADDE74(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SiriSocialConversationDataModels.ButtonStackViewCodingKeys()
{
  return &type metadata for SiriSocialConversationDataModels.ButtonStackViewCodingKeys;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonStackModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonStackModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_230ADDF70 + 4 * byte_230ADF774[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_230ADDFA4 + 4 * byte_230ADF76F[v4]))();
}

uint64_t sub_230ADDFA4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230ADDFAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230ADDFB4);
  return result;
}

uint64_t sub_230ADDFC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x230ADDFC8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_230ADDFCC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230ADDFD4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriSocialConversationDataModels.ButtonStackModel.CodingKeys()
{
  return &type metadata for SiriSocialConversationDataModels.ButtonStackModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SiriSocialConversationDataModels.ButtonModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_230ADE0C4 + 4 * byte_230ADF77E[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_230ADE0F8 + 4 * byte_230ADF779[v4]))();
}

uint64_t sub_230ADE0F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230ADE100(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230ADE108);
  return result;
}

uint64_t sub_230ADE114(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x230ADE11CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_230ADE120(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230ADE128(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230ADE134(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_230ADE13C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriSocialConversationDataModels.ButtonModel.CodingKeys()
{
  return &type metadata for SiriSocialConversationDataModels.ButtonModel.CodingKeys;
}

unint64_t sub_230ADE158()
{
  unint64_t result;

  result = qword_255E9F650;
  if (!qword_255E9F650)
  {
    result = MEMORY[0x2348BDB34](&unk_230ADFADC, &type metadata for SiriSocialConversationDataModels.ButtonModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E9F650);
  }
  return result;
}

unint64_t sub_230ADE198()
{
  unint64_t result;

  result = qword_255E9F658;
  if (!qword_255E9F658)
  {
    result = MEMORY[0x2348BDB34](&unk_230ADFB94, &type metadata for SiriSocialConversationDataModels.ButtonStackModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E9F658);
  }
  return result;
}

unint64_t sub_230ADE1D8()
{
  unint64_t result;

  result = qword_255E9F660;
  if (!qword_255E9F660)
  {
    result = MEMORY[0x2348BDB34](&unk_230ADFC4C, &type metadata for SiriSocialConversationDataModels.ButtonStackViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E9F660);
  }
  return result;
}

unint64_t sub_230ADE218()
{
  unint64_t result;

  result = qword_255E9F668;
  if (!qword_255E9F668)
  {
    result = MEMORY[0x2348BDB34](&unk_230ADFD04, &type metadata for SiriSocialConversationDataModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E9F668);
  }
  return result;
}

unint64_t sub_230ADE258()
{
  unint64_t result;

  result = qword_255E9F670;
  if (!qword_255E9F670)
  {
    result = MEMORY[0x2348BDB34](&unk_230ADFBBC, &type metadata for SiriSocialConversationDataModels.ButtonStackViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E9F670);
  }
  return result;
}

unint64_t sub_230ADE298()
{
  unint64_t result;

  result = qword_255E9F678;
  if (!qword_255E9F678)
  {
    result = MEMORY[0x2348BDB34](&unk_230ADFBE4, &type metadata for SiriSocialConversationDataModels.ButtonStackViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E9F678);
  }
  return result;
}

unint64_t sub_230ADE2D8()
{
  unint64_t result;

  result = qword_255E9F680;
  if (!qword_255E9F680)
  {
    result = MEMORY[0x2348BDB34](&unk_230ADFC74, &type metadata for SiriSocialConversationDataModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E9F680);
  }
  return result;
}

unint64_t sub_230ADE318()
{
  unint64_t result;

  result = qword_255E9F688;
  if (!qword_255E9F688)
  {
    result = MEMORY[0x2348BDB34](&unk_230ADFC9C, &type metadata for SiriSocialConversationDataModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E9F688);
  }
  return result;
}

unint64_t sub_230ADE358()
{
  unint64_t result;

  result = qword_255E9F690;
  if (!qword_255E9F690)
  {
    result = MEMORY[0x2348BDB34](&unk_230ADFB04, &type metadata for SiriSocialConversationDataModels.ButtonStackModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E9F690);
  }
  return result;
}

unint64_t sub_230ADE398()
{
  unint64_t result;

  result = qword_255E9F698;
  if (!qword_255E9F698)
  {
    result = MEMORY[0x2348BDB34](&unk_230ADFB2C, &type metadata for SiriSocialConversationDataModels.ButtonStackModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E9F698);
  }
  return result;
}

unint64_t sub_230ADE3D8()
{
  unint64_t result;

  result = qword_255E9F6A0;
  if (!qword_255E9F6A0)
  {
    result = MEMORY[0x2348BDB34](&unk_230ADFA4C, &type metadata for SiriSocialConversationDataModels.ButtonModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E9F6A0);
  }
  return result;
}

unint64_t sub_230ADE418()
{
  unint64_t result;

  result = qword_255E9F6A8;
  if (!qword_255E9F6A8)
  {
    result = MEMORY[0x2348BDB34](&unk_230ADFA74, &type metadata for SiriSocialConversationDataModels.ButtonModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255E9F6A8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 120) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_3()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return sub_230ADF438();
}

uint64_t OUTLINED_FUNCTION_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return sub_230ADF450();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return type metadata accessor for SiriSocialConversationDataModels.ButtonModel(0);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return sub_230ADF48C();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return sub_230ADF4A4();
}

uint64_t OUTLINED_FUNCTION_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 128) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_15()
{
  return sub_230ADF468();
}

uint64_t OUTLINED_FUNCTION_17@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 96) = a1;
  return sub_230ADF3FC();
}

uint64_t OUTLINED_FUNCTION_18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return sub_230ADF444();
}

uint64_t OUTLINED_FUNCTION_24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_25(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_26()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return sub_230ADF33C();
}

void *OUTLINED_FUNCTION_33()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_34(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_35()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_36()
{
  return sub_230ADF474();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_38@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

void sub_230ADE6D4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_intentType);
  if (v3)
  {
    v4 = v3;
    v5 = sub_230ADF3B4();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_230ADE738(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_230ADF3A8();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setIntentType_);

}

id SocialConversationIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SocialConversationIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SocialConversationIntent()
{
  return objc_opt_self();
}

void SocialConversationIntent.init(coder:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for SocialConversationIntent();
  OUTLINED_FUNCTION_1_0((uint64_t)v7.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
}

void SocialConversationIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_230ADF3A8();
    OUTLINED_FUNCTION_7_0();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  OUTLINED_FUNCTION_6();
}

void SocialConversationIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v5;
  objc_super v6;

  if (a2)
  {
    v5 = (void *)sub_230ADF3A8();
    OUTLINED_FUNCTION_7_0();
  }
  else
  {
    v5 = 0;
  }
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for SocialConversationIntent();
  objc_msgSendSuper2(&v6, sel_initWithIdentifier_backingStore_, v5, a3);

  OUTLINED_FUNCTION_19();
}

uint64_t SocialConversationIntent.__allocating_init(domain:verb:parametersByName:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_14_0();
  if (v3)
  {
    v4 = (void *)sub_230ADF378();
    OUTLINED_FUNCTION_7_0();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(OUTLINED_FUNCTION_2_0(), sel_initWithDomain_verb_parametersByName_, v0, v2, v4);
  OUTLINED_FUNCTION_0_0();

  return v1;
}

void *SocialConversationIntent.init(domain:verb:parametersByName:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_14_0();
  if (v3)
  {
    v4 = (void *)sub_230ADF378();
    OUTLINED_FUNCTION_7_0();
  }
  else
  {
    v4 = 0;
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for SocialConversationIntent();
  objc_msgSendSuper2(&v6, sel_initWithDomain_verb_parametersByName_, v0, v2, v4);
  OUTLINED_FUNCTION_0_0();

  return v1;
}

id SocialConversationIntent.__deallocating_deinit()
{
  return sub_230ADF188(type metadata accessor for SocialConversationIntent);
}

unint64_t SocialConversationIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result > 6)
    return 0;
  return result;
}

BOOL sub_230ADEB94(uint64_t *a1, uint64_t *a2)
{
  return sub_230ADEBA0(*a1, *a2);
}

BOOL sub_230ADEBA0(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_230ADEBAC()
{
  return sub_230ADEBB4();
}

uint64_t sub_230ADEBB4()
{
  sub_230ADF468();
  sub_230ADF474();
  return sub_230ADF48C();
}

uint64_t sub_230ADEBF8()
{
  return sub_230ADEC00();
}

uint64_t sub_230ADEC00()
{
  return sub_230ADF474();
}

uint64_t sub_230ADEC24()
{
  return sub_230ADEC2C();
}

uint64_t sub_230ADEC2C()
{
  sub_230ADF468();
  sub_230ADF474();
  return sub_230ADF48C();
}

unint64_t sub_230ADEC6C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = SocialConversationIntentResponseCode.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_230ADEC9C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_230ADECC8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SocialConversationIntentResponse_code;
  OUTLINED_FUNCTION_9_0();
  return *(_QWORD *)v1;
}

uint64_t sub_230ADED2C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___SocialConversationIntentResponse_code);
  result = OUTLINED_FUNCTION_9_0();
  *v3 = a1;
  return result;
}

void SocialConversationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_2_0();
  SocialConversationIntentResponse.init(code:userActivity:)(a1, a2);
  OUTLINED_FUNCTION_6();
}

char *SocialConversationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___SocialConversationIntentResponse_code];
  OUTLINED_FUNCTION_9_0();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SocialConversationIntentResponse.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_2_0(), sel_init);
}

id SocialConversationIntentResponse.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_8_0(OBJC_IVAR___SocialConversationIntentResponse_code);
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SocialConversationIntentResponse()
{
  return objc_opt_self();
}

uint64_t SocialConversationIntentResponse.__allocating_init(coder:)()
{
  uint64_t v0;
  id v1;

  v1 = OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11_0(v1, sel_initWithCoder_);
  OUTLINED_FUNCTION_0_0();
  return v0;
}

void SocialConversationIntentResponse.init(coder:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)OUTLINED_FUNCTION_8_0(OBJC_IVAR___SocialConversationIntentResponse_code);
  OUTLINED_FUNCTION_1_0((uint64_t)v7.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
}

uint64_t SocialConversationIntentResponse.__allocating_init(backingStore:)()
{
  uint64_t v0;
  id v1;

  v1 = OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11_0(v1, sel_initWithBackingStore_);
  OUTLINED_FUNCTION_0_0();
  return v0;
}

void SocialConversationIntentResponse.init(backingStore:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)OUTLINED_FUNCTION_8_0(OBJC_IVAR___SocialConversationIntentResponse_code);
  OUTLINED_FUNCTION_1_0((uint64_t)v7.super_class, sel_initWithBackingStore_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
}

void SocialConversationIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  id v1;

  if (a1)
  {
    sub_230ADF378();
    OUTLINED_FUNCTION_13_0();
  }
  v1 = OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11_0(v1, sel_initWithPropertiesByName_);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6();
}

void SocialConversationIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  objc_super v9;

  *(_QWORD *)&v1[OBJC_IVAR___SocialConversationIntentResponse_code] = 0;
  if (a1)
  {
    sub_230ADF378();
    OUTLINED_FUNCTION_13_0();
  }
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for SocialConversationIntentResponse();
  v8 = OUTLINED_FUNCTION_1_0((uint64_t)v9.super_class, sel_initWithPropertiesByName_, v2, v3, v4, v5, v6, v7, v9);
  OUTLINED_FUNCTION_0_0();
  if (v1)

  OUTLINED_FUNCTION_19();
}

id SocialConversationIntentResponse.__deallocating_deinit()
{
  return sub_230ADF188(type metadata accessor for SocialConversationIntentResponse);
}

id sub_230ADF188(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_230ADF1BC()
{
  unint64_t result;

  result = qword_255E9F6B8;
  if (!qword_255E9F6B8)
  {
    result = MEMORY[0x2348BDB34](&protocol conformance descriptor for SocialConversationIntentResponseCode, &type metadata for SocialConversationIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_255E9F6B8);
  }
  return result;
}

char *keypath_get_selector_intentType()
{
  return sel_intentType;
}

uint64_t sub_230ADF20C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_230ADECC8();
  *a1 = result;
  return result;
}

uint64_t sub_230ADF234(uint64_t *a1)
{
  return sub_230ADED2C(*a1);
}

ValueMetadata *type metadata accessor for SocialConversationIntentResponseCode()
{
  return &type metadata for SocialConversationIntentResponseCode;
}

uint64_t method lookup function for SocialConversationIntentResponse()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SocialConversationIntentResponse.code.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

void OUTLINED_FUNCTION_0_0()
{
  void *v0;

}

id OUTLINED_FUNCTION_1_0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v9;

  return objc_msgSendSuper2(&a9, a2, v9);
}

id OUTLINED_FUNCTION_2_0()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_230ADF3A8();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + a1) = 0;
  return type metadata accessor for SocialConversationIntentResponse();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_230ADF3A8();
}

id OUTLINED_FUNCTION_11_0(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_230ADF324()
{
  return MEMORY[0x24BEAA5D8]();
}

uint64_t sub_230ADF330()
{
  return MEMORY[0x24BEAD338]();
}

uint64_t sub_230ADF33C()
{
  return MEMORY[0x24BEAD340]();
}

uint64_t sub_230ADF348()
{
  return MEMORY[0x24BEAD348]();
}

uint64_t sub_230ADF354()
{
  return MEMORY[0x24BEAD350]();
}

uint64_t sub_230ADF360()
{
  return MEMORY[0x24BEAD358]();
}

uint64_t sub_230ADF36C()
{
  return MEMORY[0x24BEAD360]();
}

uint64_t sub_230ADF378()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_230ADF384()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_230ADF390()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_230ADF39C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_230ADF3A8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_230ADF3B4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_230ADF3C0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_230ADF3CC()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_230ADF3D8()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_230ADF3E4()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_230ADF3F0()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_230ADF3FC()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_230ADF408()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_230ADF414()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_230ADF420()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_230ADF42C()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_230ADF438()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_230ADF444()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_230ADF450()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_230ADF45C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_230ADF468()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_230ADF474()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_230ADF480()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_230ADF48C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_230ADF498()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_230ADF4A4()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_230ADF4B0()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_230ADF4BC()
{
  return MEMORY[0x24BEE4A10]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x24BEE4E38]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

