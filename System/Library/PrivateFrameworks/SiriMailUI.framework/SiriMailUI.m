uint64_t sub_246896CAC@<X0>(uint64_t a1@<X8>)
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
  void *v15;
  id v16;
  char v17;
  int v18;
  double v19;
  id v20;
  char v21;
  id v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t KeyPath;
  uint64_t *v28;
  uint64_t result;
  _OWORD v31[2];
  uint64_t v32;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3868);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0();
  v5 = v4 - v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3870);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0();
  v8 = v7 - v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3878);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_2();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3880);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0();
  v14 = v13 - v12;
  sub_246896F50();
  v15 = *(void **)(v1 + 32);
  if (v15)
  {
    v16 = v15;
    v17 = sub_2468D63C4();

    v18 = v17 & 1;
    if (v18)
      v19 = 0.0;
    else
      v19 = 150.0;
    sub_2468D6268();
    sub_246896FEC(0.0, 1, 0.0, 1, 0.0, 1, v19, v18, v8, 0.0, 1, 0.0, 1);
    sub_246897AB0(v5, &qword_2575E3868);
    v20 = v16;
    v21 = sub_2468D63C4();

    if ((v21 & 1) != 0 && (v22 = v20, sub_2468D63D0(), v24 = v23, v22, v24 > 1.0))
      v25 = sub_2468D5F68();
    else
      v25 = sub_2468D5F5C();
    v26 = v25;
    KeyPath = swift_getKeyPath();
    sub_246897AE8(v8, v2, &qword_2575E3870);
    v28 = (uint64_t *)(v2 + *(int *)(v9 + 36));
    *v28 = KeyPath;
    v28[1] = v26;
    sub_246897AB0(v8, &qword_2575E3870);
    sub_2468978C4();
    memset(v31, 0, sizeof(v31));
    v32 = 0;
    sub_2468D6094();
    sub_246897AB0((uint64_t)v31, &qword_2575E38C0);
    sub_246897AB0(v2, &qword_2575E3878);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(a1, v14, v10);
  }
  else
  {
    sub_2468D6430();
    sub_2468971E4();
    result = sub_2468D5C80();
    __break(1u);
  }
  return result;
}

uint64_t sub_246896F50()
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E38C8);
  sub_2468D6208();
  sub_246897B28();
  return sub_2468D6298();
}

void *sub_246896FEC@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  uint64_t v24;
  _BYTE __src[112];

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_2468D6538();
    v23 = (void *)sub_2468D5ED8();
    sub_2468D5AAC();

  }
  sub_2468D5C44();
  sub_246897AE8(v13, a9, &qword_2575E3868);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3870);
  return memcpy((void *)(a9 + *(int *)(v24 + 36)), __src, 0x70uLL);
}

uint64_t sub_246897190()
{
  return sub_2468D60DC();
}

uint64_t sub_2468971A8@<X0>(uint64_t a1@<X8>)
{
  return sub_246896CAC(a1);
}

unint64_t sub_2468971E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2575E4990;
  if (!qword_2575E4990)
  {
    v1 = sub_2468D6430();
    result = MEMORY[0x249562024](MEMORY[0x24BEAE520], v1);
    atomic_store(result, (unint64_t *)&qword_2575E4990);
  }
  return result;
}

uint64_t variable initialization expression of MessageDetailView._isDeleted()
{
  return 0;
}

uint64_t sub_246897238()
{
  return sub_2468D5CA4();
}

uint64_t sub_246897258(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  sub_2468D5B78();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v1, a1);
  return sub_2468D5CB0();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24956200C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t _s10SiriMailUI23DisambiguateHandlesViewV8_context33_02655CCF3E182CF00522AF51F5675876LL05SwiftC017EnvironmentObjectVy07SnippetC07ContextCGvpfi_0()
{
  sub_2468D6430();
  sub_2468971E4();
  return sub_2468D5C8C();
}

uint64_t _s10SiriMailUI17MessageDetailViewV12_colorScheme33_BC78ACDBAA0B7BF762AE967D9842D200LL05SwiftC011EnvironmentVyAF05ColorH0OGvpfi_0@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  return swift_storeEnumTagMultiPayload();
}

uint64_t variable initialization expression of SiriMailModel._attachments()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of SiriMailModel._to()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of SiriMailModel._cc()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of SiriMailModel._bcc()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of SiriMailModel._focusedField@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_2468D5908();
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v2);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t variable initialization expression of SiriMailModel._state@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BE99BD8];
  v3 = sub_2468D5914();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t variable initialization expression of SiriMailModel.snippetService()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = sub_2468D5A04();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0();
  v4 = v3 - v2;
  sub_2468D5A34();
  if (qword_2575E3830 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)static ServiceName.mail);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_2468D5A28();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void type metadata accessor for VRXMode(uint64_t a1)
{
  sub_246897868(a1, &qword_2575E3858);
}

uint64_t initializeBufferWithCopyOfBuffer for BodyTextEditor(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for BodyTextEditor(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BodyTextEditor(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v6 = v5;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for BodyTextEditor(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a1[4];
  v5 = (void *)a2[4];
  a1[4] = v5;
  v6 = v5;

  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for BodyTextEditor(uint64_t a1, uint64_t a2)
{
  void *v4;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BodyTextEditor(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 64))
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

uint64_t storeEnumTagSinglePayload for BodyTextEditor(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BodyTextEditor()
{
  return &type metadata for BodyTextEditor;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24689780C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24689782C(uint64_t result, int a2, int a3)
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
  sub_246897868(a1, &qword_2575E3860);
}

void sub_246897868(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2468978AC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2468978C4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2575E3888;
  if (!qword_2575E3888)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E3878);
    v2 = sub_24689798C();
    sub_246897A74(&qword_2575E38B0, &qword_2575E38B8, MEMORY[0x24BDF1028]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2575E3888);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249562018](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_24689798C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2575E3890;
  if (!qword_2575E3890)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E3870);
    v2[0] = sub_2468979F8();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2575E3890);
  }
  return result;
}

unint64_t sub_2468979F8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_2575E3898;
  if (!qword_2575E3898)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E3868);
    sub_246897A74(&qword_2575E38A0, &qword_2575E38A8, MEMORY[0x24BDF53E0]);
    v3 = v2;
    result = MEMORY[0x249562024](MEMORY[0x24BDF3F50], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_2575E3898);
  }
  return result;
}

void sub_246897A74(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x249562024](a3, v5), a1);
  }
  OUTLINED_FUNCTION_3();
}

void sub_246897AB0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_3();
}

void sub_246897AE8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_3();
}

unint64_t sub_246897B28()
{
  unint64_t result;

  result = qword_2575E38D0;
  if (!qword_2575E38D0)
  {
    result = MEMORY[0x249562024](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2575E38D0);
  }
  return result;
}

uint64_t sub_246897B64()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E3878);
  sub_2468978C4();
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_5()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return 0;
}

void sub_246897C10(void *a1)
{
  void *v1;
  id v2;

  objc_msgSend(v1, sel_setBaseFont_, a1);
  v2 = objc_msgSend(v1, sel_labelView);
  objc_msgSend(v2, sel_setFont_, a1);

}

id sub_246897C7C()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id result;
  id v6;
  objc_super v7;

  v1 = v0;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE19148]), sel_init);
  sub_246897F84();
  v3 = (void *)sub_2468D6574();
  objc_msgSend(v2, sel_setLabelLeadingPadding_, v3);

  v4 = (void *)sub_2468D6574();
  objc_msgSend(v2, sel_setTrailingButtonMidlineInsetFromLayoutMargin_, v4);

  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for ComposeRecipientTextView();
  result = objc_msgSendSuper2(&v7, sel_initWithOptions_, v2);
  if (result)
  {
    v6 = result;

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_246897D68(double a1, double a2, double a3, double a4)
{
  void *v4;
  id v9;
  id v10;
  id v11;
  objc_super v12;

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for ComposeRecipientTextView();
  v9 = objc_msgSendSuper2(&v12, sel_initWithFrame_, a1, a2, a3, a4);
  v10 = objc_msgSend(v9, sel_labelView);
  objc_msgSend(v10, sel_setAdjustsFontForContentSizeCategory_, 1);

  v11 = objc_msgSend(v9, sel_textView);
  if (v11)
  {
    objc_msgSend(v11, sel_setAdjustsFontForContentSizeCategory_, 1);

  }
  else
  {
    __break(1u);
  }
}

void sub_246897E6C()
{
  static Logger.logAndCrash(_:file:line:)(0xD000000000000025, 0x80000002468DAA30, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriMail/SiriMailUI/iOS/ComposeRecipientTextView.swift", 92, 2, 54);
  __break(1u);
}

void sub_246897EB8()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_246897EF8()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_246897F34()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ComposeRecipientTextView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ComposeRecipientTextView()
{
  return objc_opt_self();
}

unint64_t sub_246897F84()
{
  unint64_t result;

  result = qword_2575E3900;
  if (!qword_2575E3900)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2575E3900);
  }
  return result;
}

void sub_246897FC0()
{
  qword_2575EBD80 = 0xC028000000000000;
}

void sub_246897FD0()
{
  qword_2575EBD88 = 0xC024000000000000;
}

uint64_t DisambiguateHandlesDataModel.init(contact:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = OUTLINED_FUNCTION_12();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, a1, v4);
  v6 = sub_2468D57D0();
  v7 = sub_246898078(v6);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  swift_bridgeObjectRelease();
  result = type metadata accessor for DisambiguateHandlesDataModel(0);
  *(_QWORD *)(a2 + *(int *)(result + 20)) = v7;
  return result;
}

uint64_t sub_246898078(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  void (*v20)(char *, char *, uint64_t);
  char *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v2 = type metadata accessor for IndexedHandle(0);
  v33 = *(_QWORD *)(v2 - 8);
  v34 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (uint64_t *)((char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3AB8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v32 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (uint64_t *)((char *)&v26 - v9);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (uint64_t *)((char *)&v26 - v11);
  v35 = MEMORY[0x24BEE4AF8];
  sub_2468B694C(0, 0, 0);
  v13 = v35;
  v14 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  v31 = v14;
  v26 = a1;
  if (v14)
  {
    v15 = sub_2468D57AC();
    v16 = 0;
    v17 = *(_QWORD *)(v15 - 8);
    v18 = (char *)(a1 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80)));
    v28 = *(_QWORD *)(v17 + 72);
    v29 = v17;
    v27 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
    v30 = v4;
    do
    {
      v19 = &v32[*(int *)(v5 + 48)];
      v20 = v27;
      v27(v19, v18, v15);
      v21 = (char *)v10 + *(int *)(v5 + 48);
      *v10 = v16;
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v21, v19, v15);
      sub_246899920((uint64_t)v10, (uint64_t)v12);
      v22 = *v12;
      v20((char *)v4 + *(int *)(v34 + 20), (char *)v12 + *(int *)(v5 + 48), v15);
      *v4 = v22;
      sub_246899968((uint64_t)v12);
      v13 = v35;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2468B694C(0, *(_QWORD *)(v13 + 16) + 1, 1);
        v13 = v35;
      }
      v24 = *(_QWORD *)(v13 + 16);
      v23 = *(_QWORD *)(v13 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_2468B694C(v23 > 1, v24 + 1, 1);
        v13 = v35;
      }
      ++v16;
      *(_QWORD *)(v13 + 16) = v24 + 1;
      v4 = v30;
      sub_2468998DC((uint64_t)v30, v13+ ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))+ *(_QWORD *)(v33 + 72) * v24);
      v18 += v28;
    }
    while (v31 != v16);
  }
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t type metadata accessor for DisambiguateHandlesDataModel(uint64_t a1)
{
  return sub_2468986FC(a1, qword_2575E39B0);
}

uint64_t sub_246898324(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x746361746E6F63 && a2 == 0xE700000000000000;
  if (v2 || (sub_2468D6784() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4864657865646E69 && a2 == 0xEE0073656C646E61)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_2468D6784();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_246898434(char a1)
{
  if ((a1 & 1) != 0)
    return 0x4864657865646E69;
  else
    return 0x746361746E6F63;
}

uint64_t sub_24689847C()
{
  char *v0;

  return sub_246898434(*v0);
}

uint64_t sub_246898484@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246898324(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2468984A8()
{
  sub_24689866C();
  return sub_2468D67D8();
}

uint64_t sub_2468984D0()
{
  sub_24689866C();
  return sub_2468D67E4();
}

void DisambiguateHandlesDataModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3908);
  OUTLINED_FUNCTION_8();
  MEMORY[0x24BDAC7A8](v3);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24689866C();
  OUTLINED_FUNCTION_4_0();
  sub_2468D57DC();
  sub_2468986A8(&qword_2575E3918, (uint64_t (*)(uint64_t))MEMORY[0x24BE93CC0], MEMORY[0x24BE93CD0]);
  OUTLINED_FUNCTION_3_0();
  if (!v1)
  {
    type metadata accessor for DisambiguateHandlesDataModel(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3920);
    sub_24689898C(&qword_2575E3928, &qword_2575E3930, (uint64_t)&unk_2468D7110, MEMORY[0x24BEE12A0]);
    OUTLINED_FUNCTION_3_0();
  }
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24689866C()
{
  unint64_t result;

  result = qword_2575E3910;
  if (!qword_2575E3910)
  {
    result = MEMORY[0x249562024](&unk_2468D7138, &type metadata for DisambiguateHandlesDataModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3910);
  }
  return result;
}

uint64_t sub_2468986A8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x249562024](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for IndexedHandle(uint64_t a1)
{
  return sub_2468986FC(a1, qword_2575E3A40);
}

uint64_t sub_2468986FC(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void DisambiguateHandlesDataModel.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v13 = sub_2468D57DC();
  v4 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_14();
  v11 = v5;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3938);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_0();
  type metadata accessor for DisambiguateHandlesDataModel(0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_0();
  v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24689866C();
  sub_2468D67C0();
  if (v14)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    sub_2468986A8(&qword_2575E3940, (uint64_t (*)(uint64_t))MEMORY[0x24BE93CC0], MEMORY[0x24BE93CE0]);
    sub_2468D66F4();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v9, v11, v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3920);
    sub_24689898C(&qword_2575E3948, &qword_2575E3950, (uint64_t)&unk_2468D70E8, MEMORY[0x24BEE12D0]);
    sub_2468D66F4();
    OUTLINED_FUNCTION_0_0();
    *(_QWORD *)(v9 + *(int *)(v2 + 20)) = v15;
    sub_246898A10(v9, a2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    sub_246898A54(v9);
  }
  OUTLINED_FUNCTION_2_0();
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

uint64_t sub_24689898C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E3920);
    v10 = sub_2468986A8(a2, type metadata accessor for IndexedHandle, a3);
    result = MEMORY[0x249562024](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_246898A10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DisambiguateHandlesDataModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246898A54(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DisambiguateHandlesDataModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_246898A90(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  DisambiguateHandlesDataModel.init(from:)(a1, a2);
}

void sub_246898AA4(_QWORD *a1)
{
  DisambiguateHandlesDataModel.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for DisambiguateHandlesDataModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    swift_retain();
  }
  else
  {
    v7 = sub_2468D57DC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for DisambiguateHandlesDataModel(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2468D57DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DisambiguateHandlesDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2468D57DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DisambiguateHandlesDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2468D57DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for DisambiguateHandlesDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2468D57DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for DisambiguateHandlesDataModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2468D57DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DisambiguateHandlesDataModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246898D20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = OUTLINED_FUNCTION_12();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for DisambiguateHandlesDataModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_246898DAC(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = OUTLINED_FUNCTION_12();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = OUTLINED_FUNCTION_10();
    return __swift_storeEnumTagSinglePayload(v9, v10, v11, v12);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_246898E10()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2468D57DC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_246898E84(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v8 = sub_2468D57AC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_246898F0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_2468D57AC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_QWORD *sub_246898F44(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2468D57AC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_QWORD *sub_246898FA0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2468D57AC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_QWORD *sub_246898FFC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2468D57AC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_246899058(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2468D57AC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_2468990B4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2468990C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_13();
  return __swift_getEnumTagSinglePayload(v2, a2, v4);
}

uint64_t sub_2468990F0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2468990FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_13();
  v0 = OUTLINED_FUNCTION_10();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

uint64_t sub_246899124()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2468D57AC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for DisambiguateHandlesDataModel.CodingKeys()
{
  return &type metadata for DisambiguateHandlesDataModel.CodingKeys;
}

unint64_t sub_2468991C8()
{
  unint64_t result;

  result = qword_2575E3A78;
  if (!qword_2575E3A78)
  {
    result = MEMORY[0x249562024](&unk_2468D7088, &type metadata for DisambiguateHandlesDataModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3A78);
  }
  return result;
}

uint64_t sub_246899204()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_246899210()
{
  type metadata accessor for IndexedHandle(0);
  return sub_2468D57A0();
}

BOOL sub_24689923C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_24689924C()
{
  return sub_2468D67A8();
}

uint64_t sub_246899270(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x7865646E69 && a2 == 0xE500000000000000;
  if (v2 || (sub_2468D6784() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C646E6168 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_2468D6784();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_24689934C()
{
  return 2;
}

void sub_246899354()
{
  sub_2468D679C();
  sub_2468D67A8();
  sub_2468D67B4();
  OUTLINED_FUNCTION_11();
}

uint64_t sub_246899390()
{
  return 0;
}

uint64_t sub_24689939C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x656C646E6168;
  else
    return 0x7865646E69;
}

void sub_2468993CC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3A90);
  OUTLINED_FUNCTION_8();
  MEMORY[0x24BDAC7A8](v3);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2468998A0();
  OUTLINED_FUNCTION_4_0();
  sub_2468D6748();
  if (!v1)
  {
    type metadata accessor for IndexedHandle(0);
    sub_2468D57AC();
    sub_2468986A8(&qword_2575E3AA0, (uint64_t (*)(uint64_t))MEMORY[0x24BE935E0], MEMORY[0x24BE935F0]);
    OUTLINED_FUNCTION_3_0();
  }
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0();
}

void sub_2468994E4(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = sub_2468D57AC();
  v12 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_14();
  v13 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3AA8);
  OUTLINED_FUNCTION_8();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_0();
  type metadata accessor for IndexedHandle(0);
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_0();
  v10 = (uint64_t *)(v9 - v8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2468998A0();
  sub_2468D67C0();
  if (!v3)
  {
    *v10 = sub_2468D66E8();
    sub_2468986A8(&qword_2575E3AB0, (uint64_t (*)(uint64_t))MEMORY[0x24BE935E0], MEMORY[0x24BE935F8]);
    sub_2468D66F4();
    OUTLINED_FUNCTION_7();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))((char *)v10 + *(int *)(v2 + 20), v13, v14);
    sub_2468998DC((uint64_t)v10, a2);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_2_0();
}

BOOL sub_2468996B4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24689923C(*a1, *a2);
}

void sub_2468996C0()
{
  sub_246899354();
}

uint64_t sub_2468996D8()
{
  return sub_24689924C();
}

void sub_2468996E0()
{
  sub_2468D679C();
  sub_2468D67A8();
  sub_2468D67B4();
  OUTLINED_FUNCTION_11();
}

uint64_t sub_246899718()
{
  char *v0;

  return sub_24689939C(*v0);
}

uint64_t sub_246899720@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246899270(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246899744()
{
  return sub_246899390();
}

uint64_t sub_246899760@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24689934C();
  *a1 = result;
  return result;
}

uint64_t sub_246899784()
{
  sub_2468998A0();
  return sub_2468D67D8();
}

uint64_t sub_2468997AC()
{
  sub_2468998A0();
  return sub_2468D67E4();
}

void sub_2468997D4(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  sub_2468994E4(a1, a2);
}

void sub_2468997E8(_QWORD *a1)
{
  sub_2468993CC(a1);
}

uint64_t sub_2468997FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_246899210();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_246899824()
{
  unint64_t result;

  result = qword_2575E3A80;
  if (!qword_2575E3A80)
  {
    result = MEMORY[0x249562024](&unk_2468D6FF8, &type metadata for DisambiguateHandlesDataModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3A80);
  }
  return result;
}

unint64_t sub_246899864()
{
  unint64_t result;

  result = qword_2575E3A88;
  if (!qword_2575E3A88)
  {
    result = MEMORY[0x249562024](&unk_2468D7020, &type metadata for DisambiguateHandlesDataModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3A88);
  }
  return result;
}

unint64_t sub_2468998A0()
{
  unint64_t result;

  result = qword_2575E3A98;
  if (!qword_2575E3A98)
  {
    result = MEMORY[0x249562024](&unk_2468D7240, &type metadata for IndexedHandle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3A98);
  }
  return result;
}

uint64_t sub_2468998DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IndexedHandle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246899920(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3AB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246899968(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3AB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getEnumTagSinglePayload for Features(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s10SiriMailUI28DisambiguateHandlesDataModelV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246899A7C + 4 * byte_2468D6F65[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246899AB0 + 4 * asc_2468D6F60[v4]))();
}

uint64_t sub_246899AB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246899AB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246899AC0);
  return result;
}

uint64_t sub_246899ACC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246899AD4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246899AD8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246899AE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246899AEC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_246899AF4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for IndexedHandle.CodingKeys()
{
  return &type metadata for IndexedHandle.CodingKeys;
}

unint64_t sub_246899B14()
{
  unint64_t result;

  result = qword_2575E3AC0;
  if (!qword_2575E3AC0)
  {
    result = MEMORY[0x249562024](&unk_2468D7218, &type metadata for IndexedHandle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3AC0);
  }
  return result;
}

unint64_t sub_246899B54()
{
  unint64_t result;

  result = qword_2575E3AC8;
  if (!qword_2575E3AC8)
  {
    result = MEMORY[0x249562024](&unk_2468D7188, &type metadata for IndexedHandle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3AC8);
  }
  return result;
}

unint64_t sub_246899B94()
{
  unint64_t result;

  result = qword_2575E3AD0;
  if (!qword_2575E3AD0)
  {
    result = MEMORY[0x249562024](&unk_2468D71B0, &type metadata for IndexedHandle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3AD0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return sub_2468D6754();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return sub_2468D67CC();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_10()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return sub_2468D57DC();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return sub_2468D57AC();
}

void DisambiguateHandlesView.init(model:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;

  v4 = (uint64_t *)(a2 + *(int *)(OUTLINED_FUNCTION_0_1() + 20));
  sub_2468D6430();
  sub_24689B12C(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  *v4 = sub_2468D5C8C();
  v4[1] = v5;
  if (qword_2575E3828 != -1)
    swift_once();
  v6 = sub_2468D5AD0();
  __swift_project_value_buffer(v6, (uint64_t)static Logger.siriMail);
  v7 = sub_2468D5AB8();
  v8 = sub_2468D6520();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_246894000, v7, v8, "Constructing DisambiguateHandlesView", v9, 2u);
    MEMORY[0x24956209C](v9, -1, -1);
  }

  sub_24689B268(a1, a2, type metadata accessor for DisambiguateHandlesDataModel);
  OUTLINED_FUNCTION_2_1();
}

uint64_t type metadata accessor for DisambiguateHandlesView()
{
  uint64_t result;

  result = qword_2575E3B40;
  if (!qword_2575E3B40)
    return swift_getSingletonMetadata();
  return result;
}

void DisambiguateHandlesView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OUTLINED_FUNCTION_0_1();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  sub_24689B160(v0, (uint64_t)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for DisambiguateHandlesView);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  sub_24689B268((uint64_t)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguateHandlesView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3AD8);
  sub_24689B0F8(&qword_2575E3AE0, &qword_2575E3AD8);
  sub_2468D62EC();
  OUTLINED_FUNCTION_2_1();
}

uint64_t sub_246899F20@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  char *v35;
  uint64_t v36;
  void (*v37)(uint64_t, char *, uint64_t);
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  void (*v46)(char *, uint64_t);
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61[5];
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v56 = a2;
  v3 = type metadata accessor for DisambiguateHandlesView();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3B88);
  v60 = *(_QWORD *)(v55 - 8);
  v6 = MEMORY[0x24BDAC7A8](v55);
  v54 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v58 = (char *)&v48 - v8;
  v9 = sub_2468D5740();
  MEMORY[0x24BDAC7A8](v9);
  v53 = sub_2468D6388();
  v59 = *(_QWORD *)(v53 - 8);
  v10 = MEMORY[0x24BDAC7A8](v53);
  v52 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v48 - v12;
  v51 = sub_2468D6310();
  v50 = *(_QWORD *)(v51 - 8);
  v14 = v50;
  v15 = MEMORY[0x24BDAC7A8](v51);
  v57 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v48 - v17;
  v49 = (char *)&v48 - v17;
  sub_2468D631C();
  v19 = sub_2468D57B8();
  v73 = MEMORY[0x24BEE0D00];
  v74 = MEMORY[0x24BEAE5B8];
  v71 = v19;
  v72 = v20;
  v70 = 0;
  v68 = 0u;
  v69 = 0u;
  v67 = 0;
  v65 = 0u;
  v66 = 0u;
  v64 = 0;
  v63 = 0u;
  v62 = 0u;
  sub_2468D57C4();
  sub_2468D5734();
  swift_bridgeObjectRelease();
  v61[3] = sub_2468D62D4();
  v61[4] = MEMORY[0x24BEADA30];
  __swift_allocate_boxed_opaque_existential_1(v61);
  sub_2468D62E0();
  v48 = v13;
  sub_2468D637C();
  *(_QWORD *)&v68 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for DisambiguateHandlesDataModel(0) + 20));
  sub_24689B160(a1, (uint64_t)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for DisambiguateHandlesView);
  v21 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v22 = swift_allocObject();
  sub_24689B268((uint64_t)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v21, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguateHandlesView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3920);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3B90);
  sub_24689B0F8(&qword_2575E3B98, &qword_2575E3920);
  v23 = sub_2468D63A0();
  sub_24689B12C(&qword_2575E3BA0, (void (*)(uint64_t))MEMORY[0x24BEAE190]);
  v71 = v23;
  v72 = v24;
  swift_getOpaqueTypeConformance2();
  sub_24689B12C(&qword_2575E3BA8, (void (*)(uint64_t))type metadata accessor for IndexedHandle);
  v25 = v58;
  sub_2468D6250();
  v26 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v27 = v57;
  v28 = v18;
  v29 = v51;
  v26(v57, v28, v51);
  v30 = *(void (**)(char *, char *, uint64_t))(v59 + 16);
  v31 = v52;
  v32 = v13;
  v33 = v53;
  v30(v52, v32, v53);
  v34 = *(void (**)(char *, char *, uint64_t))(v60 + 16);
  v35 = v54;
  v36 = v55;
  v34(v54, v25, v55);
  v37 = (void (*)(uint64_t, char *, uint64_t))v34;
  v38 = v56;
  v39 = v27;
  v40 = v29;
  v26(v56, v39, v29);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3BB0);
  v42 = v31;
  v30(&v38[*(int *)(v41 + 48)], v31, v33);
  v37((uint64_t)&v38[*(int *)(v41 + 64)], v35, v36);
  v43 = *(void (**)(char *, uint64_t))(v60 + 8);
  v44 = v36;
  v43(v58, v36);
  v45 = *(void (**)(char *, uint64_t))(v59 + 8);
  v45(v48, v33);
  v46 = *(void (**)(char *, uint64_t))(v50 + 8);
  v46(v49, v40);
  v43(v35, v44);
  v45(v42, v33);
  return ((uint64_t (*)(char *, uint64_t))v46)(v57, v40);
}

uint64_t sub_24689A4A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v28 = a2;
  v26 = a1;
  v32 = a3;
  v3 = type metadata accessor for IndexedHandle(0);
  v29 = *(_QWORD *)(v3 - 8);
  v4 = *(_QWORD *)(v29 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v5 = type metadata accessor for DisambiguateHandlesView();
  v27 = *(_QWORD *)(v5 - 8);
  v6 = *(_QWORD *)(v27 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2468D63A0();
  v9 = *(_QWORD *)(v8 - 8);
  v30 = v8;
  v31 = v9;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2468D57A0();
  v51 = MEMORY[0x24BEE0D00];
  v52 = MEMORY[0x24BEAE5B8];
  v49 = v12;
  v50 = v13;
  v48 = 0;
  v46 = 0u;
  v47 = 0u;
  sub_2468D5794();
  v14 = (void *)objc_opt_self();
  v15 = (void *)sub_2468D646C();
  v16 = objc_msgSend(v14, sel_localizedStringForLabel_, v15);

  v17 = sub_2468D6484();
  v19 = v18;
  swift_bridgeObjectRelease();

  v44 = MEMORY[0x24BEE0D00];
  v45 = MEMORY[0x24BEAE5B8];
  v42 = v17;
  v43 = v19;
  v41 = 0;
  v39 = 0u;
  v40 = 0u;
  v38 = 0;
  v36 = 0u;
  v37 = 0u;
  v35 = 0;
  v33 = 0u;
  v34 = 0u;
  sub_2468D6394();
  sub_24689B160(v28, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguateHandlesView);
  sub_24689B160(v26, (uint64_t)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for IndexedHandle);
  v20 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  v21 = (v6 + *(unsigned __int8 *)(v29 + 80) + v20) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  v22 = swift_allocObject();
  sub_24689B268((uint64_t)v7, v22 + v20, (uint64_t (*)(_QWORD))type metadata accessor for DisambiguateHandlesView);
  sub_24689B268((uint64_t)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v21, type metadata accessor for IndexedHandle);
  sub_24689B12C(&qword_2575E3BA0, (void (*)(uint64_t))MEMORY[0x24BEAE190]);
  v23 = v30;
  sub_2468D60AC();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v11, v23);
}

void sub_24689A784(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = type metadata accessor for IndexedHandle(0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (uint64_t *)((char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - v7;
  sub_24689A9D0();
  if (qword_2575E3828 != -1)
    swift_once();
  v9 = sub_2468D5AD0();
  __swift_project_value_buffer(v9, (uint64_t)static Logger.siriMail);
  sub_24689B160(a2, (uint64_t)v8, type metadata accessor for IndexedHandle);
  sub_24689B160(a2, (uint64_t)v6, type metadata accessor for IndexedHandle);
  v10 = sub_2468D5AB8();
  v11 = sub_2468D6520();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v18 = v13;
    *(_DWORD *)v12 = 136315394;
    v14 = sub_2468D57A0();
    v17 = sub_2468C21E8(v14, v15, &v18);
    sub_2468D658C();
    swift_bridgeObjectRelease();
    sub_24689B2F0((uint64_t)v8);
    *(_WORD *)(v12 + 12) = 2048;
    v16 = *v6;
    sub_24689B2F0((uint64_t)v6);
    v17 = v16;
    sub_2468D658C();
    _os_log_impl(&dword_246894000, v10, v11, "Tapped contact handle: %s at index=%ld", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24956209C](v13, -1, -1);
    MEMORY[0x24956209C](v12, -1, -1);
  }
  else
  {
    sub_24689B2F0((uint64_t)v6);
    sub_24689B2F0((uint64_t)v8);
  }

}

uint64_t sub_24689A9D0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t result;

  v1 = (void *)sub_2468D574C();
  v2 = *(void **)(v0 + *(int *)(OUTLINED_FUNCTION_0_1() + 20));
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v1, sel_identifier);
    sub_2468D6484();

    sub_24689DD38(v1);
    if (!v5)
      sub_2468D6448();
    sub_2468D6424();
    swift_bridgeObjectRelease();

    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_2468D6430();
    sub_24689B12C(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    result = sub_2468D5C80();
    __break(1u);
  }
  return result;
}

uint64_t sub_24689AAF0@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_8_0();
  return sub_246899F20(v1 + v3, a1);
}

uint64_t sub_24689AB1C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for DisambiguateHandlesView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2468D57DC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = type metadata accessor for DisambiguateHandlesDataModel(0);
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 20));
    v9 = *(int *)(a3 + 20);
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (char *)a2 + v9;
    v13 = *(void **)v11;
    v12 = *((_QWORD *)v11 + 1);
    *v10 = v13;
    v10[1] = v12;
    swift_bridgeObjectRetain();
    v14 = v13;
  }
  return a1;
}

void destroy for DisambiguateHandlesView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2468D57DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  type metadata accessor for DisambiguateHandlesDataModel(0);
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for DisambiguateHandlesView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v6 = sub_2468D57DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = type metadata accessor for DisambiguateHandlesDataModel(0);
  *(_QWORD *)(a1 + *(int *)(v7 + 20)) = *(_QWORD *)(a2 + *(int *)(v7 + 20));
  v8 = *(int *)(a3 + 20);
  v9 = (_QWORD *)(a1 + v8);
  v10 = a2 + v8;
  v12 = *(void **)v10;
  v11 = *(_QWORD *)(v10 + 8);
  *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRetain();
  v13 = v12;
  return a1;
}

uint64_t assignWithCopy for DisambiguateHandlesView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v6 = sub_2468D57DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = type metadata accessor for DisambiguateHandlesDataModel(0);
  *(_QWORD *)(a1 + *(int *)(v7 + 20)) = *(_QWORD *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 20);
  v9 = (_QWORD *)(a1 + v8);
  v10 = a2 + v8;
  v11 = *(void **)(a1 + v8);
  v12 = *(void **)v10;
  *v9 = *(_QWORD *)v10;
  v13 = v12;

  v9[1] = *(_QWORD *)(v10 + 8);
  return a1;
}

uint64_t initializeWithTake for DisambiguateHandlesView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2468D57DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = type metadata accessor for DisambiguateHandlesDataModel(0);
  *(_QWORD *)(a1 + *(int *)(v7 + 20)) = *(_QWORD *)(a2 + *(int *)(v7 + 20));
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for DisambiguateHandlesView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;

  v6 = sub_2468D57DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = type metadata accessor for DisambiguateHandlesDataModel(0);
  *(_QWORD *)(a1 + *(int *)(v7 + 20)) = *(_QWORD *)(a2 + *(int *)(v7 + 20));
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 20);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = *(void **)(a1 + v8);
  *v9 = *v10;

  v9[1] = v10[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for DisambiguateHandlesView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24689AE58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;
  int v9;

  v6 = OUTLINED_FUNCTION_5_1();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  v9 = v8 - 1;
  if (v9 < 0)
    v9 = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for DisambiguateHandlesView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24689AEE4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_5_1();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
  return result;
}

uint64_t sub_24689AF54()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for DisambiguateHandlesDataModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_24689AFC4()
{
  sub_24689B0F8(&qword_2575E3B78, &qword_2575E3B80);
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

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);

  v1 = OUTLINED_FUNCTION_0_1();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  sub_2468D57DC();
  OUTLINED_FUNCTION_3_1();
  v4(v3);
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_24689B0BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_8_0();
  return sub_24689A4A0(a1, v2 + v5, a2);
}

void sub_24689B0F8(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_7_0();
  }
  OUTLINED_FUNCTION_3();
}

void sub_24689B12C(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_7_0();
  }
  OUTLINED_FUNCTION_3();
}

void sub_24689B160(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_4_1(a1, a2, a3);
  OUTLINED_FUNCTION_6_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_3();
}

uint64_t sub_24689B18C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  unint64_t v10;
  void (*v11)(unint64_t);

  v1 = OUTLINED_FUNCTION_0_1();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = type metadata accessor for IndexedHandle(0);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  v7 = (v3 + v4 + v6) & ~v6;
  v8 = v0 + v3;
  sub_2468D57DC();
  OUTLINED_FUNCTION_3_1();
  v9(v8);
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();

  v10 = v0 + *(int *)(v5 + 20) + v7;
  sub_2468D57AC();
  OUTLINED_FUNCTION_3_1();
  v11(v10);
  return swift_deallocObject();
}

void sub_24689B268(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_4_1(a1, a2, a3);
  OUTLINED_FUNCTION_6_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_3();
}

void sub_24689B294()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_0_1() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for IndexedHandle(0) - 8) + 80);
  sub_24689A784(v0 + v2, v0 + ((v2 + v3 + v4) & ~v4));
}

uint64_t sub_24689B2F0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for IndexedHandle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return type metadata accessor for DisambiguateHandlesView();
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return type metadata accessor for DisambiguateHandlesDataModel(0);
}

uint64_t OUTLINED_FUNCTION_6_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

void OUTLINED_FUNCTION_7_0()
{
  JUMPOUT(0x249562024);
}

uint64_t sub_24689B398(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  void (*v20)(char *, char *, uint64_t);
  char *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v2 = type metadata accessor for IndexedContact();
  v33 = *(_QWORD *)(v2 - 8);
  v34 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (uint64_t *)((char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3CB8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v32 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (uint64_t *)((char *)&v26 - v9);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (uint64_t *)((char *)&v26 - v11);
  v35 = MEMORY[0x24BEE4AF8];
  sub_2468B6978(0, 0, 0);
  v13 = v35;
  v14 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  v31 = v14;
  v26 = a1;
  if (v14)
  {
    v15 = sub_2468D57DC();
    v16 = 0;
    v17 = *(_QWORD *)(v15 - 8);
    v18 = (char *)(a1 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80)));
    v28 = *(_QWORD *)(v17 + 72);
    v29 = v17;
    v27 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
    v30 = v4;
    do
    {
      v19 = &v32[*(int *)(v5 + 48)];
      v20 = v27;
      v27(v19, v18, v15);
      v21 = (char *)v10 + *(int *)(v5 + 48);
      *v10 = v16;
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v21, v19, v15);
      sub_24689C7AC((uint64_t)v10, (uint64_t)v12);
      v22 = *v12;
      v20((char *)v4 + *(int *)(v34 + 20), (char *)v12 + *(int *)(v5 + 48), v15);
      *v4 = v22;
      sub_24689C7F4((uint64_t)v12);
      v13 = v35;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2468B6978(0, *(_QWORD *)(v13 + 16) + 1, 1);
        v13 = v35;
      }
      v24 = *(_QWORD *)(v13 + 16);
      v23 = *(_QWORD *)(v13 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_2468B6978(v23 > 1, v24 + 1, 1);
        v13 = v35;
      }
      ++v16;
      *(_QWORD *)(v13 + 16) = v24 + 1;
      v4 = v30;
      sub_24689C768((uint64_t)v30, v13+ ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))+ *(_QWORD *)(v33 + 72) * v24);
      v18 += v28;
    }
    while (v31 != v16);
  }
  swift_bridgeObjectRelease();
  return v13;
}

SiriMailUI::DisambiguateRecipientsDataModel __swiftcall DisambiguateRecipientsDataModel.init(candidates:contactPickerButtonLabel:)(Swift::OpaquePointer candidates, Swift::String contactPickerButtonLabel)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SiriMailUI::DisambiguateRecipientsDataModel result;

  object = contactPickerButtonLabel._object;
  countAndFlagsBits = contactPickerButtonLabel._countAndFlagsBits;
  v4 = sub_24689B398((uint64_t)candidates._rawValue);
  swift_bridgeObjectRelease();
  v5 = (void *)v4;
  v6 = countAndFlagsBits;
  v7 = object;
  result.contactPickerButtonLabel._object = v7;
  result.contactPickerButtonLabel._countAndFlagsBits = v6;
  result.candidates._rawValue = v5;
  return result;
}

uint64_t sub_24689B688(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x74616469646E6163 && a2 == 0xEA00000000007365;
  if (v2 || (sub_2468D6784() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x80000002468DAAE0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2468D6784();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_24689B780(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000018;
  else
    return 0x74616469646E6163;
}

uint64_t sub_24689B7C0()
{
  char *v0;

  return sub_24689B780(*v0);
}

uint64_t sub_24689B7C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24689B688(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24689B7EC()
{
  sub_24689B980();
  return sub_2468D67D8();
}

uint64_t sub_24689B814()
{
  sub_24689B980();
  return sub_2468D67E4();
}

void DisambiguateRecipientsDataModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3BB8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24689B980();
  sub_2468D67CC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3BC8);
  sub_24689BB84(&qword_2575E3BD0, &qword_2575E3BD8, (uint64_t)&unk_2468D74E4, MEMORY[0x24BEE12A0]);
  sub_2468D6754();
  if (!v1)
    sub_2468D6730();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  OUTLINED_FUNCTION_2_0();
}

unint64_t sub_24689B980()
{
  unint64_t result;

  result = qword_2575E3BC0;
  if (!qword_2575E3BC0)
  {
    result = MEMORY[0x249562024](&unk_2468D750C, &type metadata for DisambiguateRecipientsDataModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3BC0);
  }
  return result;
}

uint64_t type metadata accessor for IndexedContact()
{
  uint64_t result;

  result = qword_2575E3C50;
  if (!qword_2575E3C50)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t DisambiguateRecipientsDataModel.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3BE0);
  OUTLINED_FUNCTION_8();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_4_2();
  v4 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  sub_24689B980();
  sub_2468D67C0();
  if (v1)
  {
    OUTLINED_FUNCTION_7_1();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3BC8);
    sub_24689BB84(&qword_2575E3BE8, qword_2575E3BF0, (uint64_t)&unk_2468D74BC, MEMORY[0x24BEE12D0]);
    sub_2468D66F4();
    v4 = v6;
    swift_bridgeObjectRetain();
    sub_2468D66D0();
    OUTLINED_FUNCTION_0_2();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_7_1();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_0();
  }
  return v4;
}

uint64_t sub_24689BB84(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E3BC8);
    v10 = sub_2468986A8(a2, (uint64_t (*)(uint64_t))type metadata accessor for IndexedContact, a3);
    result = MEMORY[0x249562024](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24689BC08@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = DisambiguateRecipientsDataModel.init(from:)(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

void sub_24689BC34(_QWORD *a1)
{
  DisambiguateRecipientsDataModel.encode(to:)(a1);
}

uint64_t destroy for DisambiguateRecipientsDataModel()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s10SiriMailUI31DisambiguateRecipientsDataModelVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for DisambiguateRecipientsDataModel(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_QWORD *assignWithTake for DisambiguateRecipientsDataModel(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DisambiguateRecipientsDataModel(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DisambiguateRecipientsDataModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DisambiguateRecipientsDataModel()
{
  return &type metadata for DisambiguateRecipientsDataModel;
}

uint64_t *sub_24689BE04(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v8 = sub_2468D57DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_24689BE8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_2468D57DC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_QWORD *sub_24689BEC4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2468D57DC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_QWORD *sub_24689BF20(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2468D57DC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_QWORD *sub_24689BF7C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2468D57DC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_24689BFD8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2468D57DC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_24689C034()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24689C040(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_6_2();
  return __swift_getEnumTagSinglePayload(v2, a2, v4);
}

uint64_t sub_24689C070()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24689C07C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_6_2();
  return __swift_storeEnumTagSinglePayload(v2, a2, a2, v4);
}

uint64_t sub_24689C0B0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2468D57DC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for DisambiguateRecipientsDataModel.CodingKeys()
{
  return &type metadata for DisambiguateRecipientsDataModel.CodingKeys;
}

unint64_t sub_24689C140()
{
  unint64_t result;

  result = qword_2575E3C88;
  if (!qword_2575E3C88)
  {
    result = MEMORY[0x249562024](&unk_2468D745C, &type metadata for DisambiguateRecipientsDataModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3C88);
  }
  return result;
}

uint64_t sub_24689C17C()
{
  type metadata accessor for IndexedContact();
  return sub_2468D57C4();
}

uint64_t sub_24689C1A8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x7865646E69 && a2 == 0xE500000000000000;
  if (v2 || (sub_2468D6784() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746361746E6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_2468D6784();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_24689C28C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x746361746E6F63;
  else
    return 0x7865646E69;
}

uint64_t sub_24689C2C0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3CA0);
  OUTLINED_FUNCTION_8();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_0();
  v8 = v7 - v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24689C72C();
  sub_2468D67CC();
  sub_2468D6748();
  if (!v1)
  {
    type metadata accessor for IndexedContact();
    sub_2468D57DC();
    sub_2468986A8(&qword_2575E3918, (uint64_t (*)(uint64_t))MEMORY[0x24BE93CC0], MEMORY[0x24BE93CD0]);
    sub_2468D6754();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v8, v4);
}

void sub_24689C404(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = sub_2468D57DC();
  v12 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_0();
  v13 = v5 - v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3CB0);
  OUTLINED_FUNCTION_8();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_0();
  v7 = type metadata accessor for IndexedContact();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_0();
  v10 = (uint64_t *)(v9 - v8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24689C72C();
  sub_2468D67C0();
  if (!v2)
  {
    *v10 = sub_2468D66E8();
    sub_2468986A8(&qword_2575E3940, (uint64_t (*)(uint64_t))MEMORY[0x24BE93CC0], MEMORY[0x24BE93CE0]);
    sub_2468D66F4();
    OUTLINED_FUNCTION_7();
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))((char *)v10 + *(int *)(v7 + 20), v13, v14);
    sub_24689C768((uint64_t)v10, a2);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_24689C5E4()
{
  char *v0;

  return sub_24689C28C(*v0);
}

uint64_t sub_24689C5EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24689C1A8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24689C610()
{
  sub_24689C72C();
  return sub_2468D67D8();
}

uint64_t sub_24689C638()
{
  sub_24689C72C();
  return sub_2468D67E4();
}

void sub_24689C660(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  sub_24689C404(a1, a2);
}

uint64_t sub_24689C674(_QWORD *a1)
{
  return sub_24689C2C0(a1);
}

uint64_t sub_24689C688@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_24689C17C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_24689C6B0()
{
  unint64_t result;

  result = qword_2575E3C90;
  if (!qword_2575E3C90)
  {
    result = MEMORY[0x249562024](&unk_2468D73CC, &type metadata for DisambiguateRecipientsDataModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3C90);
  }
  return result;
}

unint64_t sub_24689C6F0()
{
  unint64_t result;

  result = qword_2575E3C98;
  if (!qword_2575E3C98)
  {
    result = MEMORY[0x249562024](&unk_2468D73F4, &type metadata for DisambiguateRecipientsDataModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3C98);
  }
  return result;
}

unint64_t sub_24689C72C()
{
  unint64_t result;

  result = qword_2575E3CA8;
  if (!qword_2575E3CA8)
  {
    result = MEMORY[0x249562024](&unk_2468D7614, &type metadata for IndexedContact.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3CA8);
  }
  return result;
}

uint64_t sub_24689C768(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IndexedContact();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24689C7AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3CB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24689C7F4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3CB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s10SiriMailUI31DisambiguateRecipientsDataModelV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24689C880 + 4 * byte_2468D7335[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24689C8B4 + 4 * byte_2468D7330[v4]))();
}

uint64_t sub_24689C8B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24689C8BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24689C8C4);
  return result;
}

uint64_t sub_24689C8D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24689C8D8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24689C8DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24689C8E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IndexedContact.CodingKeys()
{
  return &type metadata for IndexedContact.CodingKeys;
}

unint64_t sub_24689C904()
{
  unint64_t result;

  result = qword_2575E3CC0;
  if (!qword_2575E3CC0)
  {
    result = MEMORY[0x249562024](&unk_2468D75EC, &type metadata for IndexedContact.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3CC0);
  }
  return result;
}

unint64_t sub_24689C944()
{
  unint64_t result;

  result = qword_2575E3CC8;
  if (!qword_2575E3CC8)
  {
    result = MEMORY[0x249562024](&unk_2468D755C, &type metadata for IndexedContact.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3CC8);
  }
  return result;
}

unint64_t sub_24689C984()
{
  unint64_t result;

  result = qword_2575E3CD0;
  if (!qword_2575E3CD0)
  {
    result = MEMORY[0x249562024](&unk_2468D7584, &type metadata for IndexedContact.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3CD0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return sub_2468D57DC();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_bridgeObjectRelease();
}

void DisambiguateRecipientView.init(model:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;

  sub_2468D6430();
  sub_24689B12C(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  v8 = sub_2468D5C8C();
  v10 = v9;
  if (qword_2575E3828 != -1)
    swift_once();
  v11 = sub_2468D5AD0();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.siriMail);
  v12 = sub_2468D5AB8();
  v13 = sub_2468D6520();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_246894000, v12, v13, "Constructing DisambiguateRecipientView", v14, 2u);
    MEMORY[0x24956209C](v14, -1, -1);
  }

  *a4 = a1;
  a4[1] = a2;
  a4[2] = a3;
  a4[3] = v8;
  a4[4] = v10;
}

uint64_t DisambiguateRecipientView.body.getter()
{
  uint64_t *v0;
  __int128 v1;
  uint64_t v2;
  __int128 v3;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  v1 = *(_OWORD *)(v0 + 1);
  v7 = *v0;
  v5 = *(_OWORD *)(v0 + 3);
  v6 = v1;
  v2 = swift_allocObject();
  v3 = *((_OWORD *)v0 + 1);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 48) = v0[4];
  sub_24689D8F0((uint64_t)&v7);
  sub_24689D918((uint64_t)&v6);
  sub_24689D940((id *)&v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3CD8);
  sub_24689B0F8(&qword_2575E3CE0, &qword_2575E3CD8);
  return sub_2468D62EC();
}

uint64_t sub_24689CC08@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  void (*v26)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v32 = a2;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3CF8);
  v3 = *(_QWORD *)(v30 - 8);
  v4 = MEMORY[0x24BDAC7A8](v30);
  v31 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v28 - v6;
  v8 = sub_2468D6310();
  v29 = *(_QWORD *)(v8 - 8);
  v9 = v29;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v28 - v13;
  sub_2468D631C();
  v15 = *(_OWORD *)(a1 + 1);
  v36 = *a1;
  v33 = v36;
  v34 = *(_OWORD *)(a1 + 3);
  v35 = v15;
  v16 = swift_allocObject();
  v17 = *((_OWORD *)a1 + 1);
  *(_OWORD *)(v16 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v16 + 32) = v17;
  *(_QWORD *)(v16 + 48) = a1[4];
  swift_bridgeObjectRetain();
  sub_24689D8F0((uint64_t)&v36);
  sub_24689D918((uint64_t)&v35);
  sub_24689D940((id *)&v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3BC8);
  sub_24689B0F8(&qword_2575E3D00, &qword_2575E3BC8);
  sub_24689B12C(&qword_2575E3D08, (void (*)(uint64_t))type metadata accessor for IndexedContact);
  sub_2468D6250();
  v18 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v18(v12, v14, v8);
  v19 = v3;
  v20 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v21 = v30;
  v22 = v31;
  v20(v31, v7, v30);
  v23 = v32;
  v18(v32, v12, v8);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3D10);
  v20(&v23[*(int *)(v24 + 48)], v22, v21);
  v25 = *(void (**)(char *, uint64_t))(v19 + 8);
  v25(v7, v21);
  v26 = *(void (**)(char *, uint64_t))(v29 + 8);
  v26(v14, v8);
  v25(v22, v21);
  return ((uint64_t (*)(char *, uint64_t))v26)(v12, v8);
}

uint64_t sub_24689CEC0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39[5];
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  _QWORD v52[6];
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;

  v38 = a3;
  v5 = type metadata accessor for IndexedContact();
  v31 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v32 = v6;
  v34 = (uint64_t)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2468D5740();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_2468D634C();
  v35 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3D18);
  v36 = *(_QWORD *)(v11 - 8);
  v37 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = a1;
  v14 = sub_2468D57B8();
  v15 = MEMORY[0x24BEE0D00];
  v16 = MEMORY[0x24BEAE5B8];
  v60 = MEMORY[0x24BEE0D00];
  v61 = MEMORY[0x24BEAE5B8];
  *(_QWORD *)&v59 = v14;
  *((_QWORD *)&v59 + 1) = v17;
  v18 = sub_24689D224();
  if (v19)
  {
    *((_QWORD *)&v57 + 1) = v15;
    v58 = v16;
    *(_QWORD *)&v56 = v18;
    *((_QWORD *)&v56 + 1) = v19;
  }
  else
  {
    v58 = 0;
    v56 = 0u;
    v57 = 0u;
  }
  v55 = 0;
  v53 = 0u;
  v54 = 0u;
  memset(v52, 0, 40);
  v51 = 0;
  v49 = 0u;
  v50 = 0u;
  v48 = 0;
  v46 = 0u;
  v47 = 0u;
  v45 = 0;
  v43 = 0u;
  v44 = 0u;
  v42 = 0;
  v40 = 0u;
  v41 = 0u;
  sub_2468D57C4();
  sub_2468D5734();
  swift_bridgeObjectRelease();
  v39[3] = sub_2468D62D4();
  v39[4] = MEMORY[0x24BEADA30];
  __swift_allocate_boxed_opaque_existential_1(v39);
  sub_2468D62E0();
  sub_2468D6340();
  v20 = *a2;
  v59 = *(_OWORD *)(a2 + 1);
  v52[0] = v20;
  v56 = *(_OWORD *)(a2 + 3);
  v21 = v34;
  sub_24689DBEC(v33, v34);
  v22 = (*(unsigned __int8 *)(v31 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  v23 = swift_allocObject();
  v24 = *((_OWORD *)a2 + 1);
  *(_OWORD *)(v23 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v23 + 32) = v24;
  *(_QWORD *)(v23 + 48) = a2[4];
  sub_24689C768(v21, v23 + v22);
  sub_24689D8F0((uint64_t)v52);
  sub_24689D918((uint64_t)&v59);
  sub_24689D940((id *)&v56);
  sub_24689B12C(&qword_2575E3D20, (void (*)(uint64_t))MEMORY[0x24BEADE90]);
  v26 = v25;
  sub_2468D60AC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v8);
  *(_QWORD *)&v53 = v8;
  *((_QWORD *)&v53 + 1) = v26;
  swift_getOpaqueTypeConformance2();
  v27 = v37;
  v28 = sub_2468D6064();
  result = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v13, v27);
  *v38 = v28;
  return result;
}

uint64_t sub_24689D224()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t, char *, uint64_t);
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3D28);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2468D577C();
  v38 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3_2();
  v37 = v4;
  MEMORY[0x24BDAC7A8](v5);
  v36 = (char *)&v30 - v6;
  v7 = sub_2468D57AC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_3_2();
  v35 = v9;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v30 - v11;
  result = sub_2468D57D0();
  v14 = MEMORY[0x24BEE4AF8];
  v43 = MEMORY[0x24BEE4AF8];
  v34 = *(_QWORD *)(result + 16);
  if (!v34)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v14 + 16) == 1)
    {
      sub_2468A7168(v14, (uint64_t)v2);
      swift_release();
      if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v7) != 1)
      {
        v29 = sub_2468D57A0();
        (*(void (**)(char *, uint64_t))(v8 + 8))(v2, v7);
        return v29;
      }
      sub_24689DD9C((uint64_t)v2);
    }
    else
    {
      swift_release();
    }
    return 0;
  }
  v30 = v2;
  v15 = 0;
  v32 = *MEMORY[0x24BE93578];
  v31 = v7;
  v33 = result;
  while (v15 < *(_QWORD *)(result + 16))
  {
    v16 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v39 = *(_QWORD *)(v8 + 72);
    v40 = v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v12, result + v16 + v39 * v15, v7);
    v17 = v36;
    sub_2468D5788();
    v18 = v38;
    v19 = v7;
    v20 = v37;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v38 + 104))(v37, v32, v3);
    sub_24689B12C(&qword_2575E3D30, (void (*)(uint64_t))MEMORY[0x24BE93590]);
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_2_2();
    v22 = v41;
    v21 = v42;
    v23 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v23(v20, v3);
    v23((uint64_t)v17, v3);
    if (v21 == v22)
    {
      v24 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
      v24((uint64_t)v35, v12, v19);
      v25 = v43;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2468B69A4(0, *(_QWORD *)(v25 + 16) + 1, 1);
        v25 = v43;
      }
      v27 = *(_QWORD *)(v25 + 16);
      v26 = *(_QWORD *)(v25 + 24);
      if (v27 >= v26 >> 1)
      {
        sub_2468B69A4(v26 > 1, v27 + 1, 1);
        v25 = v43;
      }
      *(_QWORD *)(v25 + 16) = v27 + 1;
      v28 = v25 + v40 + v27 * v39;
      v7 = v31;
      v24(v28, v35, v31);
      v43 = v25;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v19);
      v7 = v19;
    }
    ++v15;
    result = v33;
    if (v34 == v15)
    {
      v14 = v43;
      v2 = v30;
      goto LABEL_13;
    }
  }
  __break(1u);
  return result;
}

void sub_24689D598(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = type metadata accessor for IndexedContact();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (uint64_t *)((char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - v7;
  sub_24689D7D4();
  if (qword_2575E3828 != -1)
    swift_once();
  v9 = sub_2468D5AD0();
  __swift_project_value_buffer(v9, (uint64_t)static Logger.siriMail);
  sub_24689DBEC(a2, (uint64_t)v8);
  sub_24689DBEC(a2, (uint64_t)v6);
  v10 = sub_2468D5AB8();
  v11 = sub_2468D6520();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v18 = v13;
    *(_DWORD *)v12 = 136315394;
    v14 = sub_2468D57B8();
    v17 = sub_2468C21E8(v14, v15, &v18);
    sub_2468D658C();
    swift_bridgeObjectRelease();
    sub_24689DCFC((uint64_t)v8);
    *(_WORD *)(v12 + 12) = 2048;
    v16 = *v6;
    sub_24689DCFC((uint64_t)v6);
    v17 = v16;
    sub_2468D658C();
    _os_log_impl(&dword_246894000, v10, v11, "Tapped contact: %s at index=%ld", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24956209C](v13, -1, -1);
    MEMORY[0x24956209C](v12, -1, -1);
  }
  else
  {
    sub_24689DCFC((uint64_t)v6);
    sub_24689DCFC((uint64_t)v8);
  }

}

uint64_t sub_24689D7D4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t result;

  v1 = sub_2468D574C();
  v2 = *(void **)(v0 + 24);
  if (v2)
  {
    v3 = (void *)v1;
    v4 = v2;
    v5 = objc_msgSend(v3, sel_identifier);
    sub_2468D6484();

    sub_24689DD38(v3);
    if (!v6)
      sub_2468D6448();
    sub_2468D6424();
    swift_bridgeObjectRelease();

    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_2468D6430();
    sub_24689B12C(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    result = sub_2468D5C80();
    __break(1u);
  }
  return result;
}

uint64_t sub_24689D8E8@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_24689CC08((uint64_t *)(v1 + 16), a1);
}

uint64_t sub_24689D8F0(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24689D918(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

id *sub_24689D940(id *a1)
{
  id v2;

  v2 = *a1;
  return a1;
}

uint64_t sub_24689D968()
{
  return swift_getOpaqueTypeConformance2();
}

void destroy for DisambiguateRecipientView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

_QWORD *initializeWithCopy for DisambiguateRecipientView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

_QWORD *assignWithCopy for DisambiguateRecipientView(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a1[3];
  v5 = (void *)a2[3];
  a1[3] = v5;
  v6 = v5;

  a1[4] = a2[4];
  return a1;
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

uint64_t assignWithTake for DisambiguateRecipientView(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for DisambiguateRecipientView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DisambiguateRecipientView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DisambiguateRecipientView()
{
  return &type metadata for DisambiguateRecipientView;
}

void sub_24689DB80()
{
  sub_24689B0F8(&qword_2575E3CE8, &qword_2575E3CF0);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_24689DBE4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_24689CEC0(a1, (uint64_t *)(v2 + 16), a2);
}

uint64_t sub_24689DBEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IndexedContact();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24689DC30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for IndexedContact();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 56) & ~v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v4 = v0 + *(int *)(v1 + 20) + v3;
  v5 = sub_2468D57DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

void sub_24689DCCC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for IndexedContact() - 8) + 80);
  sub_24689D598(v0 + 16, v0 + ((v1 + 56) & ~v1));
}

uint64_t sub_24689DCFC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for IndexedContact();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_24689DD38(void *a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(a1, sel_userData);
  if (v1)
  {
    v2 = v1;
    sub_2468D643C();

  }
  OUTLINED_FUNCTION_3();
}

uint64_t sub_24689DD9C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3D28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_2468D64C0();
}

void MailPluginModel.asEncoreEvent.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  _QWORD v10[8];

  v1 = sub_2468D56D4();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3D48);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0();
  type metadata accessor for MailPluginModel();
  OUTLINED_FUNCTION_0_3();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v10[0] = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - v6;
  v8 = sub_2468D586C();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_0();
  sub_24689E218(v0, (uint64_t)v7);
  v9 = (char *)sub_24689DF34 + 4 * byte_2468D76F0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_24689DF34()
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
  uint64_t *boxed_opaque_existential_1;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  *(_QWORD *)(v9 - 136) = v8;
  v10 = sub_2468D59C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v6, v7, v10);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BE99A80], v5);
  *(_QWORD *)(v9 - 96) = v5;
  sub_24689FA94(&qword_2575E3D50, (uint64_t (*)(uint64_t))MEMORY[0x24BE99AC8], MEMORY[0x24BE99AD8]);
  *(_QWORD *)(v9 - 88) = v11;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v9 - 120));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 16))(boxed_opaque_existential_1, v6, v5);
  if (qword_2575E3830 != -1)
    swift_once();
  v13 = sub_2468D5A04();
  v14 = __swift_project_value_buffer(v13, (uint64_t)static ServiceName.mail);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v4, v14, v13);
  __swift_storeEnumTagSinglePayload(v4, 0, 1, v13);
  sub_2468D56C8();
  sub_2468D56BC();
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
  v15 = objc_allocWithZone((Class)sub_2468D59EC());
  v16 = sub_2468D59E0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v5);
  return v16;
}

uint64_t type metadata accessor for MailPluginModel()
{
  uint64_t result;

  result = qword_2575E3EB8;
  if (!qword_2575E3EB8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24689E218(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MailPluginModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *MailPluginModel.bundleName.unsafeMutableAddressor()
{
  return &static MailPluginModel.bundleName;
}

uint64_t static MailPluginModel.bundleName.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_24();
  v0 = static MailPluginModel.bundleName;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static MailPluginModel.bundleName.setter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_24();
  static MailPluginModel.bundleName = a1;
  qword_2575E3D40 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static MailPluginModel.bundleName.modify())()
{
  OUTLINED_FUNCTION_24();
  return j__swift_endAccess;
}

uint64_t MailPluginModel.snippetHidden(for:idiom:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int EnumCaseMultiPayload;
  char v9;

  v2 = sub_2468D5818();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0();
  v6 = v5 - v4;
  type metadata accessor for MailPluginModel();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_13_0();
  sub_24689E218(v0, v1);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  sub_24689F7E8(v1, (uint64_t (*)(_QWORD))type metadata accessor for MailPluginModel);
  if (EnumCaseMultiPayload > 1)
  {
    v9 = 0;
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BEA8968], v2);
    v9 = sub_2468D580C();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  }
  return v9 & 1;
}

BOOL sub_24689E458(char a1, char a2)
{
  return a1 == a2;
}

uint64_t _s10SiriMailUI0aB7MessageV5FieldO4hash4intoys6HasherVz_tF_0()
{
  return sub_2468D67A8();
}

uint64_t sub_24689E48C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v7;

  v2 = a1 == 0x7373654D646E6573 && a2 == 0xEB00000000656761;
  if (v2 || (sub_2468D6784() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x7373654D64616572 && a2 == 0xEC00000073656761;
    if (v6 || (sub_2468D6784() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000016 && a2 == 0x80000002468DAC80 || (sub_2468D6784() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0xD000000000000013 && a2 == 0x80000002468DACA0)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      v7 = sub_2468D6784();
      swift_bridgeObjectRelease();
      if ((v7 & 1) != 0)
        return 3;
      else
        return 4;
    }
  }
}

uint64_t sub_24689E668()
{
  return 4;
}

uint64_t sub_24689E670()
{
  sub_2468D679C();
  sub_2468D67A8();
  return sub_2468D67B4();
}

uint64_t sub_24689E6B4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24689E6F0 + 4 * byte_2468D76F4[a1]))(0x7373654D646E6573, 0xEB00000000656761);
}

uint64_t sub_24689E6F0()
{
  return 0x7373654D64616572;
}

unint64_t sub_24689E710()
{
  return 0xD000000000000016;
}

unint64_t sub_24689E730()
{
  return 0xD000000000000013;
}

uint64_t sub_24689E74C()
{
  return 1;
}

uint64_t sub_24689E754()
{
  return sub_2468D67A8();
}

uint64_t sub_24689E778(uint64_t a1, uint64_t a2)
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
    v3 = sub_2468D6784();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_24689E7E4()
{
  sub_2468D679C();
  OUTLINED_FUNCTION_21();
  sub_2468D67B4();
  OUTLINED_FUNCTION_11();
}

uint64_t sub_24689E814()
{
  return 12383;
}

BOOL sub_24689E820(char *a1, char *a2)
{
  return sub_24689E458(*a1, *a2);
}

uint64_t sub_24689E82C()
{
  return sub_24689E670();
}

uint64_t sub_24689E834()
{
  return _s10SiriMailUI0aB7MessageV5FieldO4hash4intoys6HasherVz_tF_0();
}

uint64_t sub_24689E83C()
{
  sub_2468D679C();
  sub_2468D67A8();
  return sub_2468D67B4();
}

uint64_t sub_24689E87C()
{
  unsigned __int8 *v0;

  return sub_24689E6B4(*v0);
}

uint64_t sub_24689E884@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24689E48C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24689E8A8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24689E668();
  *a1 = result;
  return result;
}

uint64_t sub_24689E8CC()
{
  sub_24689F770();
  return sub_2468D67D8();
}

uint64_t sub_24689E8F4()
{
  sub_24689F770();
  return sub_2468D67E4();
}

void sub_24689E920()
{
  sub_24689E7E4();
}

uint64_t sub_24689E940()
{
  sub_24689F7AC();
  return sub_2468D67D8();
}

uint64_t sub_24689E968()
{
  sub_24689F7AC();
  return sub_2468D67E4();
}

uint64_t sub_24689E990()
{
  sub_24689F820();
  return sub_2468D67D8();
}

uint64_t sub_24689E9B8()
{
  sub_24689F820();
  return sub_2468D67E4();
}

uint64_t sub_24689E9E0()
{
  sub_24689F898();
  return sub_2468D67D8();
}

uint64_t sub_24689EA08()
{
  sub_24689F898();
  return sub_2468D67E4();
}

void sub_24689EA30()
{
  sub_2468D679C();
  OUTLINED_FUNCTION_21();
  sub_2468D67B4();
  OUTLINED_FUNCTION_11();
}

uint64_t sub_24689EA5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24689E778(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24689EA84()
{
  return sub_246899390();
}

uint64_t sub_24689EA9C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24689E74C();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24689EAC4()
{
  sub_24689F8D4();
  return sub_2468D67D8();
}

uint64_t sub_24689EAEC()
{
  sub_24689F8D4();
  return sub_2468D67E4();
}

void MailPluginModel.encode(to:)(_QWORD *a1)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3D58);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_14();
  type metadata accessor for DisambiguateHandlesDataModel(0);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_9_1(v4, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3D60);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3D68);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3D70);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_0();
  sub_2468D59C8();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_0();
  type metadata accessor for MailPluginModel();
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0();
  v12 = v11 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3D78);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24689F770();
  sub_2468D67CC();
  sub_24689E218(v16, v12);
  v14 = (char *)sub_24689ED20 + 4 * byte_2468D76F8[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_24689ED20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  v5 = *(_QWORD *)(v4 - 248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v3, v0, v2);
  *(_BYTE *)(v4 - 112) = 0;
  sub_24689F8D4();
  v6 = *(_QWORD *)(v4 - 128);
  OUTLINED_FUNCTION_6_3();
  sub_24689FA94(&qword_2575E3DD0, (uint64_t (*)(uint64_t))MEMORY[0x24BE99CD0], MEMORY[0x24BE99CE0]);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_17(v1, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 240) + 8));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v2);
  v7 = OUTLINED_FUNCTION_11_0();
  v8(v7, v6);
  OUTLINED_FUNCTION_2_0();
}

void MailPluginModel.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  char *v20;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44[11];
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
  _QWORD *v56;
  uint64_t v57;

  v47 = a2;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3DD8);
  v51 = *(_QWORD *)(v54 - 8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_9_1(v5, v44[0]);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3DE0);
  v44[10] = *(_QWORD *)(v46 - 8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_14();
  v50 = v7;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3DE8);
  v44[9] = *(_QWORD *)(v45 - 8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_14();
  v49 = v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3DF0);
  v44[7] = *(_QWORD *)(v10 - 8);
  v44[8] = v10;
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_14();
  v48 = v12;
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3DF8);
  v52 = *(_QWORD *)(v55 - 8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_13_0();
  v53 = type metadata accessor for MailPluginModel();
  OUTLINED_FUNCTION_0_3();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)v44 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)v44 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)v44 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)v44 - v27;
  v29 = a1[3];
  v56 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v29);
  sub_24689F770();
  v30 = v57;
  sub_2468D67C0();
  if (!v30)
  {
    v44[3] = (uint64_t)v26;
    v44[1] = (uint64_t)v20;
    v44[2] = (uint64_t)v23;
    v44[4] = (uint64_t)v17;
    v44[5] = (uint64_t)v28;
    v31 = v53;
    v57 = v2;
    v32 = sub_2468D6700();
    v33 = *(_QWORD *)(v32 + 16);
    if (v33)
    {
      v44[6] = 0;
      v34 = *(unsigned __int8 *)(v32 + 32);
      sub_2468A07E0(1, v33, v32, v32 + 32, 0, (2 * v33) | 1);
      v36 = v35;
      v38 = v37;
      swift_bridgeObjectRelease();
      if (v36 == v38 >> 1)
        __asm { BR              X9 }
    }
    v39 = sub_2468D6610();
    swift_allocError();
    v41 = v40;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3E00);
    *v41 = v31;
    v42 = v55;
    v43 = v57;
    sub_2468D66AC();
    sub_2468D6604();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v39 - 8) + 104))(v41, *MEMORY[0x24BEE26D0], v39);
    swift_willThrow();
    OUTLINED_FUNCTION_3_3();
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v43, v42);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
  OUTLINED_FUNCTION_2_0();
}

void sub_24689F3BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_7_2();
  if (v0)
    JUMPOUT(0x24689F3E0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3DB0);
  sub_24689F98C(&qword_2575E3E18, &qword_2575E3E20, (uint64_t)&protocol conformance descriptor for WidgetMessage, MEMORY[0x24BEE12D0]);
  OUTLINED_FUNCTION_15();
  v3 = *(_QWORD *)(v2 - 152);
  *(_QWORD *)(v2 - 256) = 0;
  OUTLINED_FUNCTION_5_2(*(_QWORD *)(v2 - 232));
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_3(v1, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  **(_QWORD **)(v2 - 288) = *(_QWORD *)(v2 - 112);
  swift_storeEnumTagMultiPayload();
  JUMPOUT(0x24689F6BCLL);
}

void sub_24689F3F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_18();
  v1 = *(_QWORD *)(v0 - 72);
  v2 = *(_QWORD *)(v0 - 256);
  sub_2468D66A0();
  if (v2)
  {
    OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_4_3(v1, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 152) + 8));
    JUMPOUT(0x24689F3A8);
  }
  sub_24689F950();
  sub_2468D66F4();
  *(_QWORD *)(v0 - 256) = 0;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_3(v1, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 152) + 8));
  v3 = *(_QWORD *)(v0 - 96);
  v4 = *(_QWORD *)(v0 - 296);
  *(_OWORD *)v4 = *(_OWORD *)(v0 - 112);
  *(_QWORD *)(v4 + 16) = v3;
  JUMPOUT(0x24689F678);
}

void sub_24689F450()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_16();
  v1 = *(_QWORD *)(v0 - 256);
  sub_2468D66A0();
  if (v1)
  {
    OUTLINED_FUNCTION_3_3();
    JUMPOUT(0x24689F494);
  }
  type metadata accessor for DisambiguateHandlesDataModel(0);
  sub_24689FA94(&qword_2575E3E08, type metadata accessor for DisambiguateHandlesDataModel, (uint64_t)&protocol conformance descriptor for DisambiguateHandlesDataModel);
  sub_2468D66F4();
  v2 = *(_QWORD *)(v0 - 152);
  *(_QWORD *)(v0 - 256) = 0;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_3(*(_QWORD *)(v0 - 72), *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  JUMPOUT(0x24689F6ACLL);
}

uint64_t sub_24689F6F4()
{
  uint64_t v0;

  swift_beginAccess();
  v0 = static MailPluginModel.bundleName;
  swift_bridgeObjectRetain();
  return v0;
}

void sub_24689F748(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  MailPluginModel.init(from:)(a1, a2);
}

void sub_24689F75C(_QWORD *a1)
{
  MailPluginModel.encode(to:)(a1);
}

unint64_t sub_24689F770()
{
  unint64_t result;

  result = qword_2575E3D80;
  if (!qword_2575E3D80)
  {
    result = MEMORY[0x249562024](&unk_2468D7D98, &type metadata for MailPluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3D80);
  }
  return result;
}

unint64_t sub_24689F7AC()
{
  unint64_t result;

  result = qword_2575E3D88;
  if (!qword_2575E3D88)
  {
    result = MEMORY[0x249562024](&unk_2468D7D48, &type metadata for MailPluginModel.DisambiguateHandlesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3D88);
  }
  return result;
}

void sub_24689F7E8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_3();
}

unint64_t sub_24689F820()
{
  unint64_t result;

  result = qword_2575E3D98;
  if (!qword_2575E3D98)
  {
    result = MEMORY[0x249562024](&unk_2468D7CF8, &type metadata for MailPluginModel.DisambiguateRecipientsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3D98);
  }
  return result;
}

unint64_t sub_24689F85C()
{
  unint64_t result;

  result = qword_2575E3DA0;
  if (!qword_2575E3DA0)
  {
    result = MEMORY[0x249562024](&protocol conformance descriptor for DisambiguateRecipientsDataModel, &type metadata for DisambiguateRecipientsDataModel);
    atomic_store(result, (unint64_t *)&qword_2575E3DA0);
  }
  return result;
}

unint64_t sub_24689F898()
{
  unint64_t result;

  result = qword_2575E3DA8;
  if (!qword_2575E3DA8)
  {
    result = MEMORY[0x249562024](&unk_2468D7CA8, &type metadata for MailPluginModel.ReadMessagesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3DA8);
  }
  return result;
}

unint64_t sub_24689F8D4()
{
  unint64_t result;

  result = qword_2575E3DC8;
  if (!qword_2575E3DC8)
  {
    result = MEMORY[0x249562024](&unk_2468D7C58, &type metadata for MailPluginModel.SendMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3DC8);
  }
  return result;
}

void sub_24689F910(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  OUTLINED_FUNCTION_3();
}

unint64_t sub_24689F950()
{
  unint64_t result;

  result = qword_2575E3E10;
  if (!qword_2575E3E10)
  {
    result = MEMORY[0x249562024](&protocol conformance descriptor for DisambiguateRecipientsDataModel, &type metadata for DisambiguateRecipientsDataModel);
    atomic_store(result, (unint64_t *)&qword_2575E3E10);
  }
  return result;
}

uint64_t sub_24689F98C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E3DB0);
    sub_24689FA94(a2, (uint64_t (*)(uint64_t))type metadata accessor for WidgetMessage, a3);
    v11 = v10;
    result = MEMORY[0x249562024](a4, v9, &v11);
    atomic_store(result, a1);
  }
  return result;
}

void sub_24689FA10()
{
  sub_24689FA94(&qword_2575E3E30, (uint64_t (*)(uint64_t))type metadata accessor for MailPluginModel, (uint64_t)&protocol conformance descriptor for MailPluginModel);
}

void sub_24689FA3C()
{
  sub_24689FA94(&qword_2575E3E38, (uint64_t (*)(uint64_t))type metadata accessor for MailPluginModel, (uint64_t)&protocol conformance descriptor for MailPluginModel);
}

void sub_24689FA68()
{
  sub_24689FA94(&qword_2575E3E40, (uint64_t (*)(uint64_t))type metadata accessor for MailPluginModel, (uint64_t)&protocol conformance descriptor for MailPluginModel);
}

void sub_24689FA94(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x249562024](a3, v5), a1);
  }
  OUTLINED_FUNCTION_3();
}

uint64_t initializeBufferWithCopyOfBuffer for MailPluginModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_24689FB20 + 4 * byte_2468D7700[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for MailPluginModel(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      v3 = sub_2468D59C8();
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
    case 1:
      goto LABEL_5;
    case 2:
      swift_bridgeObjectRelease();
      goto LABEL_5;
    case 3:
      v4 = sub_2468D57DC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
      type metadata accessor for DisambiguateHandlesDataModel(0);
LABEL_5:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void initializeWithCopy for MailPluginModel()
{
  char *v0;

  v0 = (char *)sub_24689FD10 + 4 * byte_2468D7708[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_24689FD10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_2468D59C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v0, v1, v2);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithCopy for MailPluginModel(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_24689F7E8(result, (uint64_t (*)(_QWORD))type metadata accessor for MailPluginModel);
    v2 = (char *)&loc_24689FE40 + 4 * byte_2468D770C[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

char *initializeWithTake for MailPluginModel(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    v8 = sub_2468D57DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    v9 = type metadata accessor for DisambiguateHandlesDataModel(0);
    *(_QWORD *)&a1[*(int *)(v9 + 20)] = *(_QWORD *)&a2[*(int *)(v9 + 20)];
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      return a1;
    }
    v7 = sub_2468D59C8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *assignWithTake for MailPluginModel(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_24689F7E8((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for MailPluginModel);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      v8 = sub_2468D57DC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      v9 = type metadata accessor for DisambiguateHandlesDataModel(0);
      *(_QWORD *)&a1[*(int *)(v9 + 20)] = *(_QWORD *)&a2[*(int *)(v9 + 20)];
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        return a1;
      }
      v7 = sub_2468D59C8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2468A00E8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2468A00F8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_2468D59C8();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for DisambiguateHandlesDataModel(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MailPluginModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MailPluginModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2468A0264 + 4 * byte_2468D7715[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2468A0298 + 4 * byte_2468D7710[v4]))();
}

uint64_t sub_2468A0298(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468A02A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2468A02A8);
  return result;
}

uint64_t sub_2468A02B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2468A02BCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2468A02C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468A02C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2468A02D4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MailPluginModel.CodingKeys()
{
  return &type metadata for MailPluginModel.CodingKeys;
}

uint64_t sub_2468A02F8()
{
  return 0;
}

ValueMetadata *type metadata accessor for MailPluginModel.SendMessageCodingKeys()
{
  return &type metadata for MailPluginModel.SendMessageCodingKeys;
}

ValueMetadata *type metadata accessor for MailPluginModel.ReadMessagesCodingKeys()
{
  return &type metadata for MailPluginModel.ReadMessagesCodingKeys;
}

ValueMetadata *type metadata accessor for MailPluginModel.DisambiguateRecipientsCodingKeys()
{
  return &type metadata for MailPluginModel.DisambiguateRecipientsCodingKeys;
}

uint64_t _s10SiriMailUI15MailPluginModelO21SendMessageCodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s10SiriMailUI15MailPluginModelO21SendMessageCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2468A03C0 + 4 * byte_2468D771A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2468A03E0 + 4 * byte_2468D771F[v4]))();
}

_BYTE *sub_2468A03C0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2468A03E0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2468A03E8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2468A03F0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2468A03F8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2468A0400(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for MailPluginModel.DisambiguateHandlesCodingKeys()
{
  return &type metadata for MailPluginModel.DisambiguateHandlesCodingKeys;
}

unint64_t sub_2468A0420()
{
  unint64_t result;

  result = qword_2575E3EF0;
  if (!qword_2575E3EF0)
  {
    result = MEMORY[0x249562024](&unk_2468D7950, &type metadata for MailPluginModel.DisambiguateHandlesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3EF0);
  }
  return result;
}

unint64_t sub_2468A0460()
{
  unint64_t result;

  result = qword_2575E3EF8;
  if (!qword_2575E3EF8)
  {
    result = MEMORY[0x249562024](&unk_2468D7A08, &type metadata for MailPluginModel.DisambiguateRecipientsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3EF8);
  }
  return result;
}

unint64_t sub_2468A04A0()
{
  unint64_t result;

  result = qword_2575E3F00;
  if (!qword_2575E3F00)
  {
    result = MEMORY[0x249562024](&unk_2468D7AC0, &type metadata for MailPluginModel.ReadMessagesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3F00);
  }
  return result;
}

unint64_t sub_2468A04E0()
{
  unint64_t result;

  result = qword_2575E3F08;
  if (!qword_2575E3F08)
  {
    result = MEMORY[0x249562024](&unk_2468D7B78, &type metadata for MailPluginModel.SendMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3F08);
  }
  return result;
}

unint64_t sub_2468A0520()
{
  unint64_t result;

  result = qword_2575E3F10;
  if (!qword_2575E3F10)
  {
    result = MEMORY[0x249562024](&unk_2468D7C30, &type metadata for MailPluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3F10);
  }
  return result;
}

unint64_t sub_2468A0560()
{
  unint64_t result;

  result = qword_2575E3F18;
  if (!qword_2575E3F18)
  {
    result = MEMORY[0x249562024](&unk_2468D7AE8, &type metadata for MailPluginModel.SendMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3F18);
  }
  return result;
}

unint64_t sub_2468A05A0()
{
  unint64_t result;

  result = qword_2575E3F20;
  if (!qword_2575E3F20)
  {
    result = MEMORY[0x249562024](&unk_2468D7B10, &type metadata for MailPluginModel.SendMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3F20);
  }
  return result;
}

unint64_t sub_2468A05E0()
{
  unint64_t result;

  result = qword_2575E3F28;
  if (!qword_2575E3F28)
  {
    result = MEMORY[0x249562024](&unk_2468D7A30, &type metadata for MailPluginModel.ReadMessagesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3F28);
  }
  return result;
}

unint64_t sub_2468A0620()
{
  unint64_t result;

  result = qword_2575E3F30;
  if (!qword_2575E3F30)
  {
    result = MEMORY[0x249562024](&unk_2468D7A58, &type metadata for MailPluginModel.ReadMessagesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3F30);
  }
  return result;
}

unint64_t sub_2468A0660()
{
  unint64_t result;

  result = qword_2575E3F38;
  if (!qword_2575E3F38)
  {
    result = MEMORY[0x249562024](&unk_2468D7978, &type metadata for MailPluginModel.DisambiguateRecipientsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3F38);
  }
  return result;
}

unint64_t sub_2468A06A0()
{
  unint64_t result;

  result = qword_2575E3F40;
  if (!qword_2575E3F40)
  {
    result = MEMORY[0x249562024](&unk_2468D79A0, &type metadata for MailPluginModel.DisambiguateRecipientsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3F40);
  }
  return result;
}

unint64_t sub_2468A06E0()
{
  unint64_t result;

  result = qword_2575E3F48;
  if (!qword_2575E3F48)
  {
    result = MEMORY[0x249562024](&unk_2468D78C0, &type metadata for MailPluginModel.DisambiguateHandlesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3F48);
  }
  return result;
}

unint64_t sub_2468A0720()
{
  unint64_t result;

  result = qword_2575E3F50;
  if (!qword_2575E3F50)
  {
    result = MEMORY[0x249562024](&unk_2468D78E8, &type metadata for MailPluginModel.DisambiguateHandlesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3F50);
  }
  return result;
}

unint64_t sub_2468A0760()
{
  unint64_t result;

  result = qword_2575E3F58;
  if (!qword_2575E3F58)
  {
    result = MEMORY[0x249562024](&unk_2468D7BA0, &type metadata for MailPluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3F58);
  }
  return result;
}

unint64_t sub_2468A07A0()
{
  unint64_t result;

  result = qword_2575E3F60;
  if (!qword_2575E3F60)
  {
    result = MEMORY[0x249562024](&unk_2468D7BC8, &type metadata for MailPluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E3F60);
  }
  return result;
}

uint64_t sub_2468A07E0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
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

uint64_t OUTLINED_FUNCTION_3_3()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_3@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_5_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return sub_2468D670C();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return sub_2468D66A0();
}

void OUTLINED_FUNCTION_9_1(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 168) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 224) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return sub_2468D6754();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return sub_2468D66F4();
}

unint64_t OUTLINED_FUNCTION_16()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 112) = 3;
  return sub_24689F7AC();
}

uint64_t OUTLINED_FUNCTION_17@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

unint64_t OUTLINED_FUNCTION_18()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 112) = 2;
  return sub_24689F820();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return sub_2468D67A8();
}

unint64_t OUTLINED_FUNCTION_22()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 112) = 1;
  return sub_24689F898();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_beginAccess();
}

const char *sub_2468A0984(char a1)
{
  if ((a1 & 1) != 0)
    return "ResponseFramework";
  else
    return "SiriMail";
}

const char *sub_2468A09B0(char a1)
{
  if ((a1 & 1) != 0)
    return "SMART";
  else
    return "SceneHosting";
}

uint64_t sub_2468A09DC()
{
  sub_2468D679C();
  sub_2468D67A8();
  return sub_2468D67B4();
}

uint64_t sub_2468A0A20()
{
  return sub_2468A09DC();
}

const char *sub_2468A0A28()
{
  char *v0;

  return sub_2468A0984(*v0);
}

const char *sub_2468A0A30()
{
  char *v0;

  return sub_2468A09B0(*v0);
}

Swift::Bool __swiftcall MailUIFeatureFlags.isSceneHostingEnabled()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  unint64_t v7;
  char v8;
  char v9;
  char v10;
  char v11;
  void (*v12)(_BYTE *, uint64_t);
  _BYTE v15[24];
  ValueMetadata *v16;
  unint64_t v17;

  v0 = sub_2468D5818();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x24BDAC7A8](v2);
  v6 = &v15[-v5 - 8];
  v16 = &type metadata for Features;
  v7 = sub_2468A0BC8();
  v17 = v7;
  v15[0] = 1;
  v8 = sub_2468D5770();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  if ((v8 & 1) != 0)
  {
    v16 = &type metadata for Features;
    v17 = v7;
    v15[0] = 0;
    v9 = sub_2468D5770();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    v10 = 0;
    if ((v9 & 1) != 0)
    {
      sub_2468D5800();
      sub_2468D57F4();
      sub_2468D57E8();
      swift_release();
      sub_2468D5824();
      swift_release();
      (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BEA8968], v0);
      sub_2468A0C04();
      v11 = sub_2468D6460();
      v12 = *(void (**)(_BYTE *, uint64_t))(v1 + 8);
      v12(v4, v0);
      v12(v6, v0);
      v10 = v11 ^ 1;
    }
  }
  else
  {
    v10 = 0;
  }
  return v10 & 1;
}

unint64_t sub_2468A0BC8()
{
  unint64_t result;

  result = qword_2575E3F68;
  if (!qword_2575E3F68)
  {
    result = MEMORY[0x249562024](&unk_2468D7EB4, &type metadata for Features);
    atomic_store(result, (unint64_t *)&qword_2575E3F68);
  }
  return result;
}

unint64_t sub_2468A0C04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2575E3F70;
  if (!qword_2575E3F70)
  {
    v1 = sub_2468D5818();
    result = MEMORY[0x249562024](MEMORY[0x24BEA89B8], v1);
    atomic_store(result, (unint64_t *)&qword_2575E3F70);
  }
  return result;
}

Swift::Bool __swiftcall MailUIFeatureFlags.isSMARTEnabled()()
{
  char v0;
  char v2[24];
  ValueMetadata *v3;
  unint64_t v4;

  v3 = &type metadata for Features;
  v4 = sub_2468A0BC8();
  v2[0] = 1;
  v0 = sub_2468D5770();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  return v0 & 1;
}

ValueMetadata *type metadata accessor for MailUIFeatureFlags()
{
  return &type metadata for MailUIFeatureFlags;
}

uint64_t storeEnumTagSinglePayload for Features(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2468A0CF4 + 4 * byte_2468D7DF5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2468A0D28 + 4 * byte_2468D7DF0[v4]))();
}

uint64_t sub_2468A0D28(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468A0D30(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2468A0D38);
  return result;
}

uint64_t sub_2468A0D44(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2468A0D4CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2468A0D50(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468A0D58(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Features()
{
  return &type metadata for Features;
}

unint64_t sub_2468A0D78()
{
  unint64_t result;

  result = qword_2575E3F78;
  if (!qword_2575E3F78)
  {
    result = MEMORY[0x249562024](&unk_2468D7E8C, &type metadata for Features);
    atomic_store(result, (unint64_t *)&qword_2575E3F78);
  }
  return result;
}

uint64_t property wrapper backing initializer of MessageDetailView.isDeleted()
{
  unsigned __int8 v1;

  OUTLINED_FUNCTION_10_1();
  return v1;
}

void MessageDetailView.init(_:)(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  int *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  char v20;
  uint64_t v21;

  sub_2468D6430();
  sub_24689B12C(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  *(_QWORD *)a2 = sub_2468D5C8C();
  *(_QWORD *)(a2 + 8) = v4;
  OUTLINED_FUNCTION_10_1();
  *(_BYTE *)(a2 + 16) = v20;
  *(_QWORD *)(a2 + 24) = v21;
  v5 = (int *)OUTLINED_FUNCTION_2_3();
  v6 = (uint64_t *)(a2 + v5[10]);
  *v6 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  swift_storeEnumTagMultiPayload();
  sub_2468A2EC0((uint64_t)a1, a2 + v5[6], (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
  v7 = OUTLINED_FUNCTION_4_4();
  v8 = (uint64_t *)((char *)a1 + *(int *)(v7 + 72));
  v10 = *v8;
  v9 = v8[1];
  v11 = (_QWORD *)(a2 + v5[8]);
  *v11 = v10;
  v11[1] = v9;
  v12 = (uint64_t *)((char *)a1 + *(int *)(v7 + 76));
  v13 = *v12;
  v14 = v12[1];
  v15 = (_QWORD *)(a2 + v5[9]);
  *v15 = v13;
  v15[1] = v14;
  v16 = *a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  String.uniqueIdentifier.getter(v16);
  if (qword_2575E3818 != -1)
    swift_once();
  v17 = (void *)qword_2575E3F88;
  v18 = (void *)sub_2468D646C();
  v19 = objc_msgSend(v17, sel_messageForSearchableItemIdentifier_, v18);
  swift_bridgeObjectRelease();

  sub_2468A4F64((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
  *(_QWORD *)(a2 + v5[7]) = v19;
}

uint64_t type metadata accessor for MessageDetailView()
{
  uint64_t result;

  result = qword_2575E4010;
  if (!qword_2575E4010)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t String.uniqueIdentifier.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = sub_2468D5674();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_6_4();
  sub_246897B28();
  v4 = sub_2468D65A4();
  OUTLINED_FUNCTION_9_2(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  v5 = sub_2468A2E7C(v4);
  v7 = v6;
  swift_bridgeObjectRelease();
  if (v7)
    return v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t MessageDetailView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = OUTLINED_FUNCTION_2_3();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  *(_QWORD *)a1 = sub_2468D5E18();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3F90);
  sub_2468A2EC0(v1, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for MessageDetailView);
  v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v7 = swift_allocObject();
  sub_2468A2F04((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3F98);
  sub_24689B0F8(&qword_2575E3FA0, &qword_2575E3F98);
  return sub_2468D62EC();
}

uint64_t sub_2468A11CC@<X0>(char *a1@<X8>)
{
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
  char *v19;
  void (*v20)(char *, char *, uint64_t);
  void (*v21)(char *, char *, uint64_t);
  void (*v22)(char *, char *, uint64_t);
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  void (*v29)(char *, uint64_t);
  void (*v30)(char *, uint64_t);
  uint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;

  v39 = a1;
  v1 = sub_2468D6304();
  v40 = *(_QWORD *)(v1 - 8);
  v41 = v1;
  v2 = MEMORY[0x24BDAC7A8](v1);
  v38 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v32 - v4;
  v6 = sub_2468D634C();
  v36 = *(_QWORD *)(v6 - 8);
  v7 = v36;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v32 - v11;
  v35 = (char *)&v32 - v11;
  v13 = sub_2468D63B8();
  v37 = *(_QWORD *)(v13 - 8);
  v14 = v37;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v32 - v18;
  sub_2468A1430((uint64_t)&v32 - v18);
  sub_2468A1B18((uint64_t)v12);
  v33 = v5;
  sub_2468A1EAC();
  v20 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v20(v17, v19, v13);
  v21 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v34 = v10;
  v21(v10, v12, v6);
  v22 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  v23 = v38;
  v22(v38, v5, v41);
  v24 = v39;
  v20(v39, v17, v13);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4078);
  v21(&v24[*(int *)(v25 + 48)], v10, v6);
  v26 = &v24[*(int *)(v25 + 64)];
  v27 = v41;
  v22(v26, v23, v41);
  v28 = *(void (**)(char *, uint64_t))(v40 + 8);
  v28(v33, v27);
  v29 = *(void (**)(char *, uint64_t))(v36 + 8);
  v29(v35, v6);
  v30 = *(void (**)(char *, uint64_t))(v37 + 8);
  v30(v19, v13);
  v28(v23, v27);
  v29(v34, v6);
  return ((uint64_t (*)(char *, uint64_t))v30)(v17, v13);
}

uint64_t sub_2468A1430@<X0>(uint64_t a1@<X8>)
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
  uint64_t (*v16)(_QWORD);
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD v81[4];
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
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
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;

  v91 = a1;
  v2 = sub_2468D571C();
  v89 = *(_QWORD *)(v2 - 8);
  v90 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v88 = (char *)v81 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2468D5740();
  MEMORY[0x24BDAC7A8](v4);
  v81[3] = (char *)v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = sub_2468D62D4();
  v84 = *(_QWORD *)(v86 - 8);
  MEMORY[0x24BDAC7A8](v86);
  v82 = (char *)v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4110);
  v85 = *(_QWORD *)(v87 - 8);
  MEMORY[0x24BDAC7A8](v87);
  v83 = (char *)v81 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2468D5DDC();
  MEMORY[0x24BDAC7A8](v8);
  v9 = type metadata accessor for MessageDetailView();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v1 + *(int *)(v10 + 24);
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v13 + 24);
  v92 = v13;
  sub_2468A2EC0(v1, (uint64_t)v12, v16);
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    v18 = *(int *)(v9 + 24);
    v19 = &v12[v18 + *(int *)(type metadata accessor for WidgetMessage() + 116)];
    v14 = *(_QWORD *)v19;
    v17 = *((_QWORD *)v19 + 1);
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_2468A4F64((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for MessageDetailView);
  v119 = v14;
  v120 = v17;
  v81[1] = sub_246897B28();
  v20 = sub_2468D6058();
  v22 = v21;
  v24 = v23 & 1;
  sub_2468D5F8C();
  v25 = sub_2468D6010();
  v27 = v26;
  v29 = v28;
  v31 = v30;
  sub_2468A4F8C(v20, v22, v24);
  swift_bridgeObjectRelease();
  v121 = MEMORY[0x24BDF1FA8];
  v122 = MEMORY[0x24BEAD6A8];
  v32 = swift_allocObject();
  v119 = v32;
  *(_QWORD *)(v32 + 16) = v25;
  *(_QWORD *)(v32 + 24) = v27;
  *(_BYTE *)(v32 + 32) = v29 & 1;
  *(_QWORD *)(v32 + 40) = v31;
  sub_2468D5DD0();
  sub_2468D5DC4();
  v81[2] = type metadata accessor for WidgetMessage();
  sub_2468D5DB8();
  sub_2468D5DC4();
  sub_2468D5DF4();
  v33 = sub_2468D604C();
  v35 = v34;
  LOBYTE(v22) = v36;
  v38 = v37;
  v39 = MEMORY[0x24BDF1FA8];
  v117 = MEMORY[0x24BDF1FA8];
  v40 = MEMORY[0x24BEAD6A8];
  v118 = MEMORY[0x24BEAD6A8];
  v41 = swift_allocObject();
  v116 = v41;
  *(_QWORD *)(v41 + 16) = v33;
  *(_QWORD *)(v41 + 24) = v35;
  *(_BYTE *)(v41 + 32) = v22 & 1;
  *(_QWORD *)(v41 + 40) = v38;
  v115 = 0;
  v113 = 0u;
  v114 = 0u;
  sub_2468D5DE8();
  v42 = sub_2468D604C();
  v44 = v43;
  LOBYTE(v22) = v45;
  v47 = v46;
  v111 = v39;
  v112 = v40;
  v48 = swift_allocObject();
  v110 = v48;
  *(_QWORD *)(v48 + 16) = v42;
  *(_QWORD *)(v48 + 24) = v44;
  *(_BYTE *)(v48 + 32) = v22 & 1;
  *(_QWORD *)(v48 + 40) = v47;
  v109 = 0;
  v107 = 0u;
  v108 = 0u;
  v106 = 0;
  v104 = 0u;
  v105 = 0u;
  v103 = 0;
  v101 = 0u;
  v102 = 0u;
  v97 = sub_2468D0CD8();
  v98 = v49;
  v50 = sub_2468D6058();
  v52 = v51;
  LOBYTE(v47) = v53 & 1;
  v97 = sub_2468D613C();
  v54 = sub_2468D6028();
  v56 = v55;
  v58 = v57 & 1;
  sub_2468A4F8C(v50, v52, v47);
  swift_release();
  swift_bridgeObjectRelease();
  sub_2468D5FC8();
  v59 = sub_2468D6040();
  v61 = v60;
  LOBYTE(v47) = v62;
  swift_release();
  LOBYTE(v50) = v47 & 1;
  sub_2468A4F8C(v54, v56, v58);
  swift_bridgeObjectRelease();
  sub_2468D5F80();
  v63 = sub_2468D6010();
  v65 = v64;
  LOBYTE(v47) = v66;
  v68 = v67;
  sub_2468A4F8C(v59, v61, v50);
  swift_bridgeObjectRelease();
  v99 = MEMORY[0x24BDF1FA8];
  v100 = MEMORY[0x24BEAD6A8];
  v69 = swift_allocObject();
  v97 = v69;
  *(_QWORD *)(v69 + 16) = v63;
  *(_QWORD *)(v69 + 24) = v65;
  *(_BYTE *)(v69 + 32) = v47 & 1;
  *(_QWORD *)(v69 + 40) = v68;
  sub_2468D5734();
  v70 = v82;
  sub_2468D62E0();
  v72 = v88;
  v71 = v89;
  v73 = v90;
  (*(void (**)(char *, _QWORD, uint64_t))(v89 + 104))(v88, *MEMORY[0x24BEAAB78], v90);
  sub_24689B12C(&qword_2575E4118, (void (*)(uint64_t))MEMORY[0x24BEADA38]);
  v75 = v74;
  v76 = v83;
  v77 = v86;
  sub_2468D6088();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v72, v73);
  (*(void (**)(char *, uint64_t))(v84 + 8))(v70, v77);
  v93 = v77;
  v94 = v75;
  swift_getOpaqueTypeConformance2();
  v78 = v87;
  v79 = sub_2468D6064();
  (*(void (**)(char *, uint64_t))(v85 + 8))(v76, v78);
  v95 = MEMORY[0x24BDF4780];
  v96 = MEMORY[0x24BEAD938];
  v93 = v79;
  return sub_2468D63AC();
}

uint64_t sub_2468A1B18@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t v11;
  uint64_t (*v12)(_QWORD);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v42[2];
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  char v78;

  v2 = v1;
  v46 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40F0);
  v44 = *(_QWORD *)(v3 - 8);
  v45 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v43 = (char *)v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MessageDetailView();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v2 + *(int *)(v6 + 24);
  v10 = *(_QWORD *)(v9 + 32);
  v11 = *(_QWORD *)(v9 + 40);
  v42[1] = v2;
  sub_2468A2EC0(v2, (uint64_t)v8, v12);
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    v14 = *(int *)(v5 + 24);
    v15 = &v8[v14 + *(int *)(type metadata accessor for WidgetMessage() + 120)];
    v10 = *(_QWORD *)v15;
    v13 = *((_QWORD *)v15 + 1);
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_2468A4F64((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for MessageDetailView);
  v71 = v10;
  v72 = v13;
  sub_246897B28();
  v16 = sub_2468D6058();
  v18 = v17;
  v20 = v19 & 1;
  sub_2468D5FA4();
  v21 = sub_2468D6040();
  v23 = v22;
  v25 = v24;
  swift_release();
  sub_2468A4F8C(v16, v18, v20);
  swift_bridgeObjectRelease();
  sub_2468D5F74();
  v26 = sub_2468D6010();
  v28 = v27;
  v30 = v29;
  v32 = v31 & 1;
  sub_2468A4F8C(v21, v23, v25 & 1);
  swift_bridgeObjectRelease();
  v33 = sub_2468D5F08();
  v71 = v26;
  v72 = v28;
  v73 = v32;
  v74 = v30;
  LOBYTE(v75) = v33;
  v76 = 0u;
  v77 = 0u;
  v78 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40F8);
  sub_2468A4F9C();
  v34 = sub_2468D6064();
  sub_2468A4F8C(v26, v28, v32);
  v35 = swift_bridgeObjectRelease();
  v36 = MEMORY[0x24BDF4780];
  v37 = MEMORY[0x24BEAD938];
  v74 = MEMORY[0x24BDF4780];
  v75 = MEMORY[0x24BEAD938];
  v71 = v34;
  MEMORY[0x24BDAC7A8](v35);
  sub_2468D5EE4();
  v38 = v43;
  sub_2468D5B60();
  sub_24689B0F8(&qword_2575E4108, &qword_2575E40F0);
  v39 = v45;
  v40 = sub_2468D6064();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v38, v39);
  v69 = v36;
  v70 = v37;
  v68 = v40;
  v67 = 0;
  v65 = 0u;
  v66 = 0u;
  v64 = 0;
  v62 = 0u;
  v63 = 0u;
  v61 = 0;
  v59 = 0u;
  v60 = 0u;
  v58 = 0;
  v56 = 0u;
  v57 = 0u;
  v55 = 0;
  v53 = 0u;
  v54 = 0u;
  v52 = 0;
  v50 = 0u;
  v51 = 0u;
  v49 = 0;
  v47 = 0u;
  v48 = 0u;
  return sub_2468D6340();
}

uint64_t sub_2468A1EAC()
{
  sub_2468A2080();
  sub_2468A25D4();
  return sub_2468D62F8();
}

uint64_t sub_2468A1F10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_QWORD);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  _QWORD v28[4];

  v4 = type metadata accessor for MessageDetailView();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1 + *(int *)(v5 + 24);
  v10 = *(_QWORD *)(v8 + 48);
  v9 = *(_QWORD *)(v8 + 56);
  sub_2468A2EC0(a1, (uint64_t)v7, v11);
  if (v9)
  {
    v12 = v9;
  }
  else
  {
    v13 = *(int *)(v4 + 24);
    v14 = &v7[v13 + *(int *)(type metadata accessor for WidgetMessage() + 124)];
    v10 = *(_QWORD *)v14;
    v12 = *((_QWORD *)v14 + 1);
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_2468A4F64((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for MessageDetailView);
  v28[2] = v10;
  v28[3] = v12;
  sub_246897B28();
  v15 = sub_2468D6058();
  v17 = v16;
  v19 = v18 & 1;
  sub_2468D5FC8();
  v20 = sub_2468D6040();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  swift_release();
  sub_2468A4F8C(v15, v17, v19);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v20;
  *(_QWORD *)(a2 + 8) = v22;
  *(_BYTE *)(a2 + 16) = v24 & 1;
  *(_QWORD *)(a2 + 24) = v26;
  return result;
}

uint64_t sub_2468A2080()
{
  uint64_t v0;
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t KeyPath;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  unint64_t v62;
  unint64_t v63;
  _QWORD v64[3];

  v1 = v0;
  v2 = sub_2468D5C5C();
  v59 = *(_QWORD *)(v2 - 8);
  v60 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v58 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2468D6190();
  v56 = *(_QWORD *)(v4 - 8);
  v57 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v55 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_2468D62C8();
  v46 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MessageDetailView();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4080);
  v51 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4088);
  v53 = *(_QWORD *)(v13 - 8);
  v54 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v48 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4090);
  MEMORY[0x24BDAC7A8](v50);
  v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4098);
  MEMORY[0x24BDAC7A8](v52);
  v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = (uint64_t *)(v1 + *(int *)(v8 + 36));
  v20 = *v19;
  v21 = v19[1];
  sub_2468A2EC0(v1, (uint64_t)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for MessageDetailView);
  v22 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v23 = swift_allocObject();
  sub_2468A2F04((uint64_t)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22);
  v64[0] = v20;
  v64[1] = v21;
  v61 = v64;
  v62 = 0xD000000000000017;
  v63 = 0x80000002468DAD20;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40A0);
  sub_24689B0F8(&qword_2575E40A8, &qword_2575E40A0);
  sub_2468D61D8();
  swift_bridgeObjectRelease();
  v24 = v46;
  v25 = v47;
  (*(void (**)(char *, _QWORD, uint64_t))(v46 + 104))(v7, *MEMORY[0x24BEAD970], v47);
  v64[0] = sub_2468D6130();
  sub_2468D5BF0();
  v26 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemBackgroundColor);
  v64[0] = MEMORY[0x2495615B0](v26);
  sub_2468D5BF0();
  sub_24689B0F8(&qword_2575E40B0, &qword_2575E4080);
  v28 = v48;
  v27 = v49;
  sub_2468D6070();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v25);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v12, v27);
  v30 = v55;
  v29 = v56;
  v31 = v57;
  (*(void (**)(char *, _QWORD, uint64_t))(v56 + 104))(v55, *MEMORY[0x24BDF40B0], v57);
  KeyPath = swift_getKeyPath();
  v33 = (uint64_t *)&v16[*(int *)(v50 + 36)];
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40B8);
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))((char *)v33 + *(int *)(v34 + 28), v30, v31);
  *v33 = KeyPath;
  v36 = v53;
  v35 = v54;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v16, v28, v54);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v28, v35);
  v37 = v58;
  sub_2468D5C50();
  v38 = swift_getKeyPath();
  v39 = (uint64_t *)&v18[*(int *)(v52 + 36)];
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40C0);
  v42 = v59;
  v41 = v60;
  (*(void (**)(char *, char *, uint64_t))(v59 + 16))((char *)v39 + *(int *)(v40 + 28), v37, v60);
  *v39 = v38;
  sub_2468A4B8C((uint64_t)v16, (uint64_t)v18);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v37, v41);
  sub_2468A4D24((uint64_t)v16, &qword_2575E4090);
  sub_2468A4BD4();
  v43 = sub_2468D6064();
  sub_2468A4D24((uint64_t)v18, &qword_2575E4098);
  return v43;
}

uint64_t sub_2468A25D4()
{
  uint64_t v0;
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t KeyPath;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  unint64_t v63;
  _QWORD v64[3];

  v1 = v0;
  v2 = sub_2468D5C5C();
  v59 = *(_QWORD *)(v2 - 8);
  v60 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v58 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2468D6190();
  v56 = *(_QWORD *)(v4 - 8);
  v57 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v55 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_2468D62C8();
  v46 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MessageDetailView();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4080);
  v51 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4088);
  v53 = *(_QWORD *)(v13 - 8);
  v54 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v48 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4090);
  MEMORY[0x24BDAC7A8](v50);
  v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4098);
  MEMORY[0x24BDAC7A8](v52);
  v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = (uint64_t *)(v1 + *(int *)(v8 + 32));
  v20 = *v19;
  v21 = v19[1];
  sub_2468A2EC0(v1, (uint64_t)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for MessageDetailView);
  v22 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v23 = swift_allocObject();
  sub_2468A2F04((uint64_t)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22);
  v64[0] = v20;
  v64[1] = v21;
  v61 = v64;
  v62 = 0x6873617274;
  v63 = 0xE500000000000000;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40A0);
  sub_24689B0F8(&qword_2575E40A8, &qword_2575E40A0);
  sub_2468D61D8();
  swift_bridgeObjectRelease();
  v24 = v46;
  v25 = v47;
  (*(void (**)(char *, _QWORD, uint64_t))(v46 + 104))(v7, *MEMORY[0x24BEAD970], v47);
  v64[0] = sub_2468D6130();
  sub_2468D5BF0();
  v26 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemBackgroundColor);
  v64[0] = MEMORY[0x2495615B0](v26);
  sub_2468D5BF0();
  sub_24689B0F8(&qword_2575E40B0, &qword_2575E4080);
  v28 = v48;
  v27 = v49;
  sub_2468D6070();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v25);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v12, v27);
  v30 = v55;
  v29 = v56;
  v31 = v57;
  (*(void (**)(char *, _QWORD, uint64_t))(v56 + 104))(v55, *MEMORY[0x24BDF40B0], v57);
  KeyPath = swift_getKeyPath();
  v33 = (uint64_t *)&v16[*(int *)(v50 + 36)];
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40B8);
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))((char *)v33 + *(int *)(v34 + 28), v30, v31);
  *v33 = KeyPath;
  v36 = v53;
  v35 = v54;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v16, v28, v54);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v28, v35);
  v37 = v58;
  sub_2468D5C50();
  v38 = swift_getKeyPath();
  v39 = (uint64_t *)&v18[*(int *)(v52 + 36)];
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40C0);
  v42 = v59;
  v41 = v60;
  (*(void (**)(char *, char *, uint64_t))(v59 + 16))((char *)v39 + *(int *)(v40 + 28), v37, v60);
  *v39 = v38;
  sub_2468A4B8C((uint64_t)v16, (uint64_t)v18);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v37, v41);
  sub_2468A4D24((uint64_t)v16, &qword_2575E4090);
  sub_2468A4BD4();
  v43 = sub_2468D6064();
  sub_2468A4D24((uint64_t)v18, &qword_2575E4098);
  return v43;
}

uint64_t sub_2468A2B20(id *a1)
{
  id v2;
  uint64_t result;

  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40E8);
  sub_2468D61B4();
  sub_2468D61C0();
  swift_release();
  if (*a1)
  {
    v2 = *a1;
    sub_2468D6448();
    sub_2468D6424();

    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_2468D6430();
    sub_24689B12C(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    result = sub_2468D5C80();
    __break(1u);
  }
  return result;
}

uint64_t sub_2468A2C64(id *a1)
{
  id v1;
  uint64_t result;

  if (*a1)
  {
    v1 = *a1;
    sub_2468D6448();
    sub_2468D6424();

    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_2468D6430();
    sub_24689B12C(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    result = sub_2468D5C80();
    __break(1u);
  }
  return result;
}

id sub_2468A2D28()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2E3B8]), sel_init);
  qword_2575E3F80 = (uint64_t)result;
  return result;
}

id sub_2468A2D58()
{
  id result;

  if (qword_2575E3810 != -1)
    swift_once();
  result = objc_msgSend((id)qword_2575E3F80, sel_messageRepository);
  qword_2575E3F88 = (uint64_t)result;
  return result;
}

uint64_t String.mailMessageID.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = sub_2468D5674();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_6_4();
  sub_246897B28();
  v4 = sub_2468D65A4();
  OUTLINED_FUNCTION_9_2(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  if (*(_QWORD *)(v4 + 16))
  {
    a1 = *(_QWORD *)(v4 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2468A2E7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  v2 = *(_QWORD *)(a1 + 16 * v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

void sub_2468A2EC0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_3();
}

uint64_t sub_2468A2F04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MessageDetailView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2468A2F48@<X0>(char *a1@<X8>)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_3(v2);
  return sub_2468A11CC(a1);
}

uint64_t sub_2468A2F70()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for MessageDetailView(uint64_t a1, char **a2, int *a3)
{
  int v3;
  char *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  _QWORD *v48;
  _QWORD *v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  _QWORD *v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  _QWORD *v86;
  uint64_t v87;
  _QWORD *v88;
  id v89;
  uint64_t v90;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void (*v98)(char *, uint64_t, uint64_t);
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  _QWORD *v105;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v21 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    *(_QWORD *)(a1 + 24) = a2[3];
    v5 = a3[6];
    v6 = (_QWORD *)(a1 + v5);
    v7 = (uint64_t)a2 + v5;
    v8 = *(uint64_t *)((char *)a2 + v5 + 8);
    *v6 = *(char **)((char *)a2 + v5);
    v6[1] = v8;
    v9 = *(uint64_t *)((char *)a2 + v5 + 24);
    v6[2] = *(char **)((char *)a2 + v5 + 16);
    v6[3] = v9;
    v10 = *(uint64_t *)((char *)a2 + v5 + 40);
    v6[4] = *(char **)((char *)a2 + v5 + 32);
    v6[5] = v10;
    v11 = *(uint64_t *)((char *)a2 + v5 + 56);
    v6[6] = *(char **)((char *)a2 + v5 + 48);
    v6[7] = v11;
    v12 = (int *)type metadata accessor for WidgetMessage();
    v13 = v12[8];
    v100 = v7 + v13;
    v102 = (char *)v6 + v13;
    v14 = sub_2468D56B0();
    v98 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    v15 = v4;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v98(v102, v100, v14);
    *((_BYTE *)v6 + v12[9]) = *(_BYTE *)(v7 + v12[9]);
    *((_BYTE *)v6 + v12[10]) = *(_BYTE *)(v7 + v12[10]);
    *((_BYTE *)v6 + v12[11]) = *(_BYTE *)(v7 + v12[11]);
    *((_BYTE *)v6 + v12[12]) = *(_BYTE *)(v7 + v12[12]);
    v16 = v12[13];
    v17 = (char *)v6 + v16;
    v18 = (const void *)(v7 + v16);
    v19 = sub_2468D568C();
    if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19))
    {
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
      __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
    }
    *((_BYTE *)v6 + v12[14]) = *(_BYTE *)(v7 + v12[14]);
    v22 = v12[15];
    v23 = (_QWORD *)((char *)v6 + v22);
    v24 = (_QWORD *)(v7 + v22);
    v25 = v24[1];
    *v23 = *v24;
    v23[1] = v25;
    v26 = v12[16];
    v27 = (_QWORD *)((char *)v6 + v26);
    v28 = (_QWORD *)(v7 + v26);
    v103 = v28[1];
    *v27 = *v28;
    v27[1] = v103;
    *((_BYTE *)v6 + v12[17]) = *(_BYTE *)(v7 + v12[17]);
    v29 = v12[18];
    v30 = (_QWORD *)((char *)v6 + v29);
    v31 = (_QWORD *)(v7 + v29);
    v101 = v31[1];
    *v30 = *v31;
    v30[1] = v101;
    v32 = v12[19];
    v33 = (_QWORD *)((char *)v6 + v32);
    v34 = (_QWORD *)(v7 + v32);
    v99 = v34[1];
    *v33 = *v34;
    v33[1] = v99;
    v35 = v12[20];
    v36 = (_QWORD *)((char *)v6 + v35);
    v37 = (_QWORD *)(v7 + v35);
    v97 = v37[1];
    *v36 = *v37;
    v36[1] = v97;
    v38 = v12[21];
    v39 = (_QWORD *)((char *)v6 + v38);
    v40 = (_QWORD *)(v7 + v38);
    v96 = v40[1];
    *v39 = *v40;
    v39[1] = v96;
    v41 = v12[22];
    v42 = (_QWORD *)((char *)v6 + v41);
    v43 = (_QWORD *)(v7 + v41);
    v95 = v43[1];
    *v42 = *v43;
    v42[1] = v95;
    v44 = v12[23];
    v45 = (_QWORD *)((char *)v6 + v44);
    v46 = (_QWORD *)(v7 + v44);
    v94 = v46[1];
    *v45 = *v46;
    v45[1] = v94;
    v47 = v12[24];
    v48 = (_QWORD *)((char *)v6 + v47);
    v49 = (_QWORD *)(v7 + v47);
    v93 = v49[1];
    *v48 = *v49;
    v48[1] = v93;
    v50 = v12[25];
    v51 = (_QWORD *)((char *)v6 + v50);
    v52 = (_QWORD *)(v7 + v50);
    v92 = v52[1];
    *v51 = *v52;
    v51[1] = v92;
    v53 = v12[26];
    v54 = (_QWORD *)((char *)v6 + v53);
    v55 = (_QWORD *)(v7 + v53);
    v56 = v55[1];
    *v54 = *v55;
    v54[1] = v56;
    v57 = v12[27];
    v58 = (_QWORD *)((char *)v6 + v57);
    v59 = (_QWORD *)(v7 + v57);
    v60 = v59[1];
    *v58 = *v59;
    v58[1] = v60;
    v61 = v12[28];
    v62 = (_QWORD *)((char *)v6 + v61);
    v63 = (_QWORD *)(v7 + v61);
    v64 = v63[1];
    *v62 = *v63;
    v62[1] = v64;
    v65 = v12[29];
    v66 = (_QWORD *)((char *)v6 + v65);
    v67 = (_QWORD *)(v7 + v65);
    v68 = v67[1];
    *v66 = *v67;
    v66[1] = v68;
    v69 = v12[30];
    v70 = (_QWORD *)((char *)v6 + v69);
    v71 = (_QWORD *)(v7 + v69);
    v72 = v71[1];
    *v70 = *v71;
    v70[1] = v72;
    v73 = v12[31];
    v74 = (_QWORD *)((char *)v6 + v73);
    v75 = (_QWORD *)(v7 + v73);
    v76 = v75[1];
    *v74 = *v75;
    v74[1] = v76;
    v77 = a3[7];
    v78 = a3[8];
    v79 = *(char **)((char *)a2 + v77);
    *(_QWORD *)(a1 + v77) = v79;
    v80 = (_QWORD *)(a1 + v78);
    v81 = (char **)((char *)a2 + v78);
    v82 = v81[1];
    *v80 = *v81;
    v80[1] = v82;
    v83 = a3[9];
    v84 = a3[10];
    v85 = (_QWORD *)(a1 + v83);
    v86 = (char **)((char *)a2 + v83);
    v87 = v86[1];
    *v85 = *v86;
    v85[1] = v87;
    v105 = (_QWORD *)(a1 + v84);
    v88 = (char **)((char *)a2 + v84);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v89 = v79;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v90 = sub_2468D5B78();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v90 - 8) + 16))(v105, v88, v90);
    }
    else
    {
      *v105 = *v88;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    return (char *)a1;
  }
  return v21;
}

uint64_t destroy for MessageDetailView(id *a1, int *a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  swift_release();
  v4 = (char *)a1 + a2[6];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = type metadata accessor for WidgetMessage();
  v6 = &v4[*(int *)(v5 + 32)];
  v7 = sub_2468D56B0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (uint64_t)&v4[*(int *)(v5 + 52)];
  v9 = sub_2468D568C();
  if (!__swift_getEnumTagSinglePayload(v8, 1, v9))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = (char *)a1 + a2[10];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v11 = sub_2468D5B78();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
}

uint64_t initializeWithCopy for MessageDetailView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  char *v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  _QWORD *v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  _QWORD *v85;
  uint64_t v86;
  _QWORD *v87;
  id v88;
  uint64_t v89;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void (*v97)(char *, uint64_t, uint64_t);
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  _QWORD *v104;

  v4 = *(void **)a2;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v5 = a3[6];
  v6 = (_QWORD *)(a1 + v5);
  v7 = a2 + v5;
  v8 = *(_QWORD *)(a2 + v5 + 8);
  *v6 = *(_QWORD *)(a2 + v5);
  v6[1] = v8;
  v9 = *(_QWORD *)(a2 + v5 + 24);
  v6[2] = *(_QWORD *)(a2 + v5 + 16);
  v6[3] = v9;
  v10 = *(_QWORD *)(a2 + v5 + 40);
  v6[4] = *(_QWORD *)(a2 + v5 + 32);
  v6[5] = v10;
  v11 = *(_QWORD *)(a2 + v5 + 56);
  v6[6] = *(_QWORD *)(a2 + v5 + 48);
  v6[7] = v11;
  v12 = (int *)type metadata accessor for WidgetMessage();
  v13 = v12[8];
  v99 = v7 + v13;
  v101 = (char *)v6 + v13;
  v14 = sub_2468D56B0();
  v97 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  v15 = v4;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v97(v101, v99, v14);
  *((_BYTE *)v6 + v12[9]) = *(_BYTE *)(v7 + v12[9]);
  *((_BYTE *)v6 + v12[10]) = *(_BYTE *)(v7 + v12[10]);
  *((_BYTE *)v6 + v12[11]) = *(_BYTE *)(v7 + v12[11]);
  *((_BYTE *)v6 + v12[12]) = *(_BYTE *)(v7 + v12[12]);
  v16 = v12[13];
  v17 = (char *)v6 + v16;
  v18 = (const void *)(v7 + v16);
  v19 = sub_2468D568C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
  }
  *((_BYTE *)v6 + v12[14]) = *(_BYTE *)(v7 + v12[14]);
  v21 = v12[15];
  v22 = (_QWORD *)((char *)v6 + v21);
  v23 = (_QWORD *)(v7 + v21);
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  v25 = v12[16];
  v26 = (_QWORD *)((char *)v6 + v25);
  v27 = (_QWORD *)(v7 + v25);
  v102 = v27[1];
  *v26 = *v27;
  v26[1] = v102;
  *((_BYTE *)v6 + v12[17]) = *(_BYTE *)(v7 + v12[17]);
  v28 = v12[18];
  v29 = (_QWORD *)((char *)v6 + v28);
  v30 = (_QWORD *)(v7 + v28);
  v100 = v30[1];
  *v29 = *v30;
  v29[1] = v100;
  v31 = v12[19];
  v32 = (_QWORD *)((char *)v6 + v31);
  v33 = (_QWORD *)(v7 + v31);
  v98 = v33[1];
  *v32 = *v33;
  v32[1] = v98;
  v34 = v12[20];
  v35 = (_QWORD *)((char *)v6 + v34);
  v36 = (_QWORD *)(v7 + v34);
  v96 = v36[1];
  *v35 = *v36;
  v35[1] = v96;
  v37 = v12[21];
  v38 = (_QWORD *)((char *)v6 + v37);
  v39 = (_QWORD *)(v7 + v37);
  v95 = v39[1];
  *v38 = *v39;
  v38[1] = v95;
  v40 = v12[22];
  v41 = (_QWORD *)((char *)v6 + v40);
  v42 = (_QWORD *)(v7 + v40);
  v94 = v42[1];
  *v41 = *v42;
  v41[1] = v94;
  v43 = v12[23];
  v44 = (_QWORD *)((char *)v6 + v43);
  v45 = (_QWORD *)(v7 + v43);
  v93 = v45[1];
  *v44 = *v45;
  v44[1] = v93;
  v46 = v12[24];
  v47 = (_QWORD *)((char *)v6 + v46);
  v48 = (_QWORD *)(v7 + v46);
  v92 = v48[1];
  *v47 = *v48;
  v47[1] = v92;
  v49 = v12[25];
  v50 = (_QWORD *)((char *)v6 + v49);
  v51 = (_QWORD *)(v7 + v49);
  v91 = v51[1];
  *v50 = *v51;
  v50[1] = v91;
  v52 = v12[26];
  v53 = (_QWORD *)((char *)v6 + v52);
  v54 = (_QWORD *)(v7 + v52);
  v55 = v54[1];
  *v53 = *v54;
  v53[1] = v55;
  v56 = v12[27];
  v57 = (_QWORD *)((char *)v6 + v56);
  v58 = (_QWORD *)(v7 + v56);
  v59 = v58[1];
  *v57 = *v58;
  v57[1] = v59;
  v60 = v12[28];
  v61 = (_QWORD *)((char *)v6 + v60);
  v62 = (_QWORD *)(v7 + v60);
  v63 = v62[1];
  *v61 = *v62;
  v61[1] = v63;
  v64 = v12[29];
  v65 = (_QWORD *)((char *)v6 + v64);
  v66 = (_QWORD *)(v7 + v64);
  v67 = v66[1];
  *v65 = *v66;
  v65[1] = v67;
  v68 = v12[30];
  v69 = (_QWORD *)((char *)v6 + v68);
  v70 = (_QWORD *)(v7 + v68);
  v71 = v70[1];
  *v69 = *v70;
  v69[1] = v71;
  v72 = v12[31];
  v73 = (_QWORD *)((char *)v6 + v72);
  v74 = (_QWORD *)(v7 + v72);
  v75 = v74[1];
  *v73 = *v74;
  v73[1] = v75;
  v76 = a3[7];
  v77 = a3[8];
  v78 = *(void **)(a2 + v76);
  *(_QWORD *)(a1 + v76) = v78;
  v79 = (_QWORD *)(a1 + v77);
  v80 = (_QWORD *)(a2 + v77);
  v81 = v80[1];
  *v79 = *v80;
  v79[1] = v81;
  v82 = a3[9];
  v83 = a3[10];
  v84 = (_QWORD *)(a1 + v82);
  v85 = (_QWORD *)(a2 + v82);
  v86 = v85[1];
  *v84 = *v85;
  v84[1] = v86;
  v104 = (_QWORD *)(a1 + v83);
  v87 = (_QWORD *)(a2 + v83);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v88 = v78;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v89 = sub_2468D5B78();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v89 - 8) + 16))(v104, v87, v89);
  }
  else
  {
    *v104 = *v87;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for MessageDetailView(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  int EnumTagSinglePayload;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  _QWORD *v68;
  _QWORD *v69;
  uint64_t v70;
  _QWORD *v71;
  _QWORD *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  _QWORD *v78;
  _QWORD *v79;
  uint64_t v80;
  _QWORD *v81;
  _QWORD *v82;
  uint64_t v83;
  _QWORD *v84;
  _QWORD *v85;
  uint64_t v86;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  v9 = a3[6];
  v10 = (_QWORD *)(a1 + v9);
  v11 = (_QWORD *)(a2 + v9);
  *v10 = *(_QWORD *)(a2 + v9);
  v10[1] = *(_QWORD *)(a2 + v9 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[2] = v11[2];
  v10[3] = v11[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[4] = v11[4];
  v10[5] = v11[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[6] = v11[6];
  v10[7] = v11[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = (int *)type metadata accessor for WidgetMessage();
  v13 = v12[8];
  v14 = (char *)v10 + v13;
  v15 = (char *)v11 + v13;
  v16 = sub_2468D56B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  *((_BYTE *)v10 + v12[9]) = *((_BYTE *)v11 + v12[9]);
  *((_BYTE *)v10 + v12[10]) = *((_BYTE *)v11 + v12[10]);
  *((_BYTE *)v10 + v12[11]) = *((_BYTE *)v11 + v12[11]);
  *((_BYTE *)v10 + v12[12]) = *((_BYTE *)v11 + v12[12]);
  v17 = v12[13];
  v18 = (char *)v10 + v17;
  v19 = (char *)v11 + v17;
  v20 = sub_2468D568C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v18, 1, v20);
  v22 = __swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20);
  if (EnumTagSinglePayload)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v23 = *(_QWORD *)(v20 - 8);
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v18, v20);
LABEL_6:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 24))(v18, v19, v20);
LABEL_7:
  *((_BYTE *)v10 + v12[14]) = *((_BYTE *)v11 + v12[14]);
  v25 = v12[15];
  v26 = (_QWORD *)((char *)v10 + v25);
  v27 = (_QWORD *)((char *)v11 + v25);
  *v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v28 = v12[16];
  v29 = (_QWORD *)((char *)v10 + v28);
  v30 = (_QWORD *)((char *)v11 + v28);
  *v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)v10 + v12[17]) = *((_BYTE *)v11 + v12[17]);
  v31 = v12[18];
  v32 = (_QWORD *)((char *)v10 + v31);
  v33 = (_QWORD *)((char *)v11 + v31);
  *v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = v12[19];
  v35 = (_QWORD *)((char *)v10 + v34);
  v36 = (_QWORD *)((char *)v11 + v34);
  *v35 = *v36;
  v35[1] = v36[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v37 = v12[20];
  v38 = (_QWORD *)((char *)v10 + v37);
  v39 = (_QWORD *)((char *)v11 + v37);
  *v38 = *v39;
  v38[1] = v39[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v40 = v12[21];
  v41 = (_QWORD *)((char *)v10 + v40);
  v42 = (_QWORD *)((char *)v11 + v40);
  *v41 = *v42;
  v41[1] = v42[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v43 = v12[22];
  v44 = (_QWORD *)((char *)v10 + v43);
  v45 = (_QWORD *)((char *)v11 + v43);
  *v44 = *v45;
  v44[1] = v45[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v46 = v12[23];
  v47 = (_QWORD *)((char *)v10 + v46);
  v48 = (_QWORD *)((char *)v11 + v46);
  *v47 = *v48;
  v47[1] = v48[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v49 = v12[24];
  v50 = (_QWORD *)((char *)v10 + v49);
  v51 = (_QWORD *)((char *)v11 + v49);
  *v50 = *v51;
  v50[1] = v51[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v52 = v12[25];
  v53 = (_QWORD *)((char *)v10 + v52);
  v54 = (_QWORD *)((char *)v11 + v52);
  *v53 = *v54;
  v53[1] = v54[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v55 = v12[26];
  v56 = (_QWORD *)((char *)v10 + v55);
  v57 = (_QWORD *)((char *)v11 + v55);
  *v56 = *v57;
  v56[1] = v57[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v58 = v12[27];
  v59 = (_QWORD *)((char *)v10 + v58);
  v60 = (_QWORD *)((char *)v11 + v58);
  *v59 = *v60;
  v59[1] = v60[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v61 = v12[28];
  v62 = (_QWORD *)((char *)v10 + v61);
  v63 = (_QWORD *)((char *)v11 + v61);
  *v62 = *v63;
  v62[1] = v63[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v64 = v12[29];
  v65 = (_QWORD *)((char *)v10 + v64);
  v66 = (_QWORD *)((char *)v11 + v64);
  *v65 = *v66;
  v65[1] = v66[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v67 = v12[30];
  v68 = (_QWORD *)((char *)v10 + v67);
  v69 = (_QWORD *)((char *)v11 + v67);
  *v68 = *v69;
  v68[1] = v69[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v70 = v12[31];
  v71 = (_QWORD *)((char *)v10 + v70);
  v72 = (_QWORD *)((char *)v11 + v70);
  *v71 = *v72;
  v71[1] = v72[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v73 = a3[7];
  v74 = *(void **)(a2 + v73);
  v75 = *(void **)(a1 + v73);
  *(_QWORD *)(a1 + v73) = v74;
  v76 = v74;

  v77 = a3[8];
  v78 = (_QWORD *)(a1 + v77);
  v79 = (_QWORD *)(a2 + v77);
  *v78 = *v79;
  v78[1] = v79[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v80 = a3[9];
  v81 = (_QWORD *)(a1 + v80);
  v82 = (_QWORD *)(a2 + v80);
  *v81 = *v82;
  v81[1] = v82[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v83 = a3[10];
    v84 = (_QWORD *)(a1 + v83);
    v85 = (_QWORD *)(a2 + v83);
    sub_2468A4D24(a1 + v83, &qword_2575E3850);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v86 = sub_2468D5B78();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v86 - 8) + 16))(v84, v85, v86);
    }
    else
    {
      *v84 = *v85;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *initializeWithTake for MessageDetailView(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  _OWORD *v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[6];
  v8 = (_OWORD *)((char *)a1 + v7);
  v9 = (char *)a2 + v7;
  v10 = *(_OWORD *)((char *)a2 + v7 + 16);
  *v8 = *(_OWORD *)((char *)a2 + v7);
  v8[1] = v10;
  v11 = *(_OWORD *)((char *)a2 + v7 + 48);
  v8[2] = *(_OWORD *)((char *)a2 + v7 + 32);
  v8[3] = v11;
  v12 = (int *)type metadata accessor for WidgetMessage();
  v13 = v12[8];
  v14 = (char *)v8 + v13;
  v15 = &v9[v13];
  v16 = sub_2468D56B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  *((_BYTE *)v8 + v12[9]) = v9[v12[9]];
  *((_BYTE *)v8 + v12[10]) = v9[v12[10]];
  *((_BYTE *)v8 + v12[11]) = v9[v12[11]];
  *((_BYTE *)v8 + v12[12]) = v9[v12[12]];
  v17 = v12[13];
  v18 = (char *)v8 + v17;
  v19 = &v9[v17];
  v20 = sub_2468D568C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
  }
  *((_BYTE *)v8 + v12[14]) = v9[v12[14]];
  *(_OWORD *)((char *)v8 + v12[15]) = *(_OWORD *)&v9[v12[15]];
  *(_OWORD *)((char *)v8 + v12[16]) = *(_OWORD *)&v9[v12[16]];
  *((_BYTE *)v8 + v12[17]) = v9[v12[17]];
  *(_OWORD *)((char *)v8 + v12[18]) = *(_OWORD *)&v9[v12[18]];
  *(_OWORD *)((char *)v8 + v12[19]) = *(_OWORD *)&v9[v12[19]];
  *(_OWORD *)((char *)v8 + v12[20]) = *(_OWORD *)&v9[v12[20]];
  *(_OWORD *)((char *)v8 + v12[21]) = *(_OWORD *)&v9[v12[21]];
  *(_OWORD *)((char *)v8 + v12[22]) = *(_OWORD *)&v9[v12[22]];
  *(_OWORD *)((char *)v8 + v12[23]) = *(_OWORD *)&v9[v12[23]];
  *(_OWORD *)((char *)v8 + v12[24]) = *(_OWORD *)&v9[v12[24]];
  *(_OWORD *)((char *)v8 + v12[25]) = *(_OWORD *)&v9[v12[25]];
  *(_OWORD *)((char *)v8 + v12[26]) = *(_OWORD *)&v9[v12[26]];
  *(_OWORD *)((char *)v8 + v12[27]) = *(_OWORD *)&v9[v12[27]];
  *(_OWORD *)((char *)v8 + v12[28]) = *(_OWORD *)&v9[v12[28]];
  *(_OWORD *)((char *)v8 + v12[29]) = *(_OWORD *)&v9[v12[29]];
  *(_OWORD *)((char *)v8 + v12[30]) = *(_OWORD *)&v9[v12[30]];
  *(_OWORD *)((char *)v8 + v12[31]) = *(_OWORD *)&v9[v12[31]];
  v22 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v22) = *(_OWORD *)((char *)a2 + v22);
  v23 = a3[10];
  *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  v24 = (char *)a1 + v23;
  v25 = (char *)a2 + v23;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v27 = sub_2468D5B78();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v24, v25, v27);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for MessageDetailView(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  int EnumTagSinglePayload;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  _QWORD *v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  _QWORD *v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const void *v121;
  uint64_t v122;
  uint64_t v123;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  v7 = a3[6];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = *(_QWORD *)(a2 + v7 + 8);
  *v8 = *(_QWORD *)(a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v11 = v9[3];
  v8[2] = v9[2];
  v8[3] = v11;
  swift_bridgeObjectRelease();
  v12 = v9[5];
  v8[4] = v9[4];
  v8[5] = v12;
  swift_bridgeObjectRelease();
  v13 = v9[7];
  v8[6] = v9[6];
  v8[7] = v13;
  swift_bridgeObjectRelease();
  v14 = (int *)type metadata accessor for WidgetMessage();
  v15 = v14[8];
  v16 = (char *)v8 + v15;
  v17 = (char *)v9 + v15;
  v18 = sub_2468D56B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v16, v17, v18);
  *((_BYTE *)v8 + v14[9]) = *((_BYTE *)v9 + v14[9]);
  *((_BYTE *)v8 + v14[10]) = *((_BYTE *)v9 + v14[10]);
  *((_BYTE *)v8 + v14[11]) = *((_BYTE *)v9 + v14[11]);
  *((_BYTE *)v8 + v14[12]) = *((_BYTE *)v9 + v14[12]);
  v19 = v14[13];
  v20 = (char *)v8 + v19;
  v21 = (char *)v9 + v19;
  v22 = sub_2468D568C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v20, 1, v22);
  v24 = __swift_getEnumTagSinglePayload((uint64_t)v21, 1, v22);
  if (EnumTagSinglePayload)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
      __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, v22);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v25 = *(_QWORD *)(v22 - 8);
  if (v24)
  {
    (*(void (**)(char *, uint64_t))(v25 + 8))(v20, v22);
LABEL_6:
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v25 + 40))(v20, v21, v22);
LABEL_7:
  *((_BYTE *)v8 + v14[14]) = *((_BYTE *)v9 + v14[14]);
  v27 = v14[15];
  v28 = (_QWORD *)((char *)v8 + v27);
  v29 = (_QWORD *)((char *)v9 + v27);
  v31 = *v29;
  v30 = v29[1];
  *v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  v32 = v14[16];
  v33 = (_QWORD *)((char *)v8 + v32);
  v34 = (_QWORD *)((char *)v9 + v32);
  v36 = *v34;
  v35 = v34[1];
  *v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  *((_BYTE *)v8 + v14[17]) = *((_BYTE *)v9 + v14[17]);
  v37 = v14[18];
  v38 = (_QWORD *)((char *)v8 + v37);
  v39 = (_QWORD *)((char *)v9 + v37);
  v41 = *v39;
  v40 = v39[1];
  *v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease();
  v42 = v14[19];
  v43 = (_QWORD *)((char *)v8 + v42);
  v44 = (_QWORD *)((char *)v9 + v42);
  v46 = *v44;
  v45 = v44[1];
  *v43 = v46;
  v43[1] = v45;
  swift_bridgeObjectRelease();
  v47 = v14[20];
  v48 = (_QWORD *)((char *)v8 + v47);
  v49 = (_QWORD *)((char *)v9 + v47);
  v51 = *v49;
  v50 = v49[1];
  *v48 = v51;
  v48[1] = v50;
  swift_bridgeObjectRelease();
  v52 = v14[21];
  v53 = (_QWORD *)((char *)v8 + v52);
  v54 = (_QWORD *)((char *)v9 + v52);
  v56 = *v54;
  v55 = v54[1];
  *v53 = v56;
  v53[1] = v55;
  swift_bridgeObjectRelease();
  v57 = v14[22];
  v58 = (_QWORD *)((char *)v8 + v57);
  v59 = (_QWORD *)((char *)v9 + v57);
  v61 = *v59;
  v60 = v59[1];
  *v58 = v61;
  v58[1] = v60;
  swift_bridgeObjectRelease();
  v62 = v14[23];
  v63 = (_QWORD *)((char *)v8 + v62);
  v64 = (_QWORD *)((char *)v9 + v62);
  v66 = *v64;
  v65 = v64[1];
  *v63 = v66;
  v63[1] = v65;
  swift_bridgeObjectRelease();
  v67 = v14[24];
  v68 = (_QWORD *)((char *)v8 + v67);
  v69 = (_QWORD *)((char *)v9 + v67);
  v71 = *v69;
  v70 = v69[1];
  *v68 = v71;
  v68[1] = v70;
  swift_bridgeObjectRelease();
  v72 = v14[25];
  v73 = (_QWORD *)((char *)v8 + v72);
  v74 = (_QWORD *)((char *)v9 + v72);
  v76 = *v74;
  v75 = v74[1];
  *v73 = v76;
  v73[1] = v75;
  swift_bridgeObjectRelease();
  v77 = v14[26];
  v78 = (_QWORD *)((char *)v8 + v77);
  v79 = (_QWORD *)((char *)v9 + v77);
  v81 = *v79;
  v80 = v79[1];
  *v78 = v81;
  v78[1] = v80;
  swift_bridgeObjectRelease();
  v82 = v14[27];
  v83 = (_QWORD *)((char *)v8 + v82);
  v84 = (_QWORD *)((char *)v9 + v82);
  v86 = *v84;
  v85 = v84[1];
  *v83 = v86;
  v83[1] = v85;
  swift_bridgeObjectRelease();
  v87 = v14[28];
  v88 = (_QWORD *)((char *)v8 + v87);
  v89 = (_QWORD *)((char *)v9 + v87);
  v91 = *v89;
  v90 = v89[1];
  *v88 = v91;
  v88[1] = v90;
  swift_bridgeObjectRelease();
  v92 = v14[29];
  v93 = (_QWORD *)((char *)v8 + v92);
  v94 = (_QWORD *)((char *)v9 + v92);
  v96 = *v94;
  v95 = v94[1];
  *v93 = v96;
  v93[1] = v95;
  swift_bridgeObjectRelease();
  v97 = v14[30];
  v98 = (_QWORD *)((char *)v8 + v97);
  v99 = (_QWORD *)((char *)v9 + v97);
  v101 = *v99;
  v100 = v99[1];
  *v98 = v101;
  v98[1] = v100;
  swift_bridgeObjectRelease();
  v102 = v14[31];
  v103 = (_QWORD *)((char *)v8 + v102);
  v104 = (_QWORD *)((char *)v9 + v102);
  v106 = *v104;
  v105 = v104[1];
  *v103 = v106;
  v103[1] = v105;
  swift_bridgeObjectRelease();
  v107 = a3[7];
  v108 = *(void **)(a1 + v107);
  *(_QWORD *)(a1 + v107) = *(_QWORD *)(a2 + v107);

  v109 = a3[8];
  v110 = (_QWORD *)(a1 + v109);
  v111 = (uint64_t *)(a2 + v109);
  v113 = *v111;
  v112 = v111[1];
  *v110 = v113;
  v110[1] = v112;
  swift_bridgeObjectRelease();
  v114 = a3[9];
  v115 = (_QWORD *)(a1 + v114);
  v116 = (uint64_t *)(a2 + v114);
  v118 = *v116;
  v117 = v116[1];
  *v115 = v118;
  v115[1] = v117;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v119 = a3[10];
    v120 = (void *)(a1 + v119);
    v121 = (const void *)(a2 + v119);
    sub_2468A4D24(a1 + v119, &qword_2575E3850);
    v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v123 = sub_2468D5B78();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v123 - 8) + 32))(v120, v121, v123);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v120, v121, *(_QWORD *)(*(_QWORD *)(v122 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageDetailView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2468A4868(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v6 = OUTLINED_FUNCTION_4_4();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a3[6];
    return __swift_getEnumTagSinglePayload(a1 + v8, a2, v7);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FB0);
    v8 = a3[10];
    return __swift_getEnumTagSinglePayload(a1 + v8, a2, v7);
  }
  v9 = *(_QWORD *)(a1 + a3[7]);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageDetailView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2468A4910(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = OUTLINED_FUNCTION_4_4();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = a4[6];
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + a4[7]) = (a2 - 1);
      return result;
    }
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FB0);
    v10 = a4[10];
  }
  return __swift_storeEnumTagSinglePayload(a1 + v10, a2, a2, v9);
}

void sub_2468A49A8()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for WidgetMessage();
  if (v0 <= 0x3F)
  {
    sub_2468A4A50();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_2468A4A50()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2575E4020)
  {
    sub_2468D5B78();
    v0 = sub_2468D5B84();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2575E4020);
  }
}

void sub_2468A4AA4()
{
  sub_24689B0F8(&qword_2575E4068, &qword_2575E4070);
}

uint64_t sub_2468A4AD4()
{
  return sub_2468A4F3C((uint64_t (*)(uint64_t))sub_2468A2B20);
}

uint64_t sub_2468A4AE0()
{
  sub_246897B28();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_2468D619C();
}

uint64_t sub_2468A4B5C()
{
  return sub_2468A4AE0();
}

uint64_t sub_2468A4B70()
{
  return sub_2468A4B5C();
}

uint64_t sub_2468A4B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4090);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2468A4BD4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2575E40C8;
  if (!qword_2575E40C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4098);
    v2 = sub_2468A4C58();
    sub_24689B0F8(&qword_2575E40E0, &qword_2575E40C0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2575E40C8);
  }
  return result;
}

unint64_t sub_2468A4C58()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t OpaqueTypeConformance2;
  uint64_t v5;
  _QWORD v6[4];

  result = qword_2575E40D0;
  if (!qword_2575E40D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4090);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4080);
    sub_24689B0F8(&qword_2575E40B0, &qword_2575E4080);
    v6[2] = v2;
    v6[3] = v3;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_24689B0F8(&qword_2575E40D8, &qword_2575E40B8);
    v6[0] = OpaqueTypeConformance2;
    v6[1] = v5;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v6);
    atomic_store(result, (unint64_t *)&qword_2575E40D0);
  }
  return result;
}

void sub_2468A4D24(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1_0(v2);
  OUTLINED_FUNCTION_3();
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = OUTLINED_FUNCTION_2_3();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  swift_release();
  v4 = (char *)v3 + *(int *)(v1 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = OUTLINED_FUNCTION_4_4();
  v6 = &v4[*(int *)(v5 + 32)];
  v7 = sub_2468D56B0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (uint64_t)&v4[*(int *)(v5 + 52)];
  v9 = sub_2468D568C();
  if (!__swift_getEnumTagSinglePayload(v8, 1, v9))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_8_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_2468D5B78();
    OUTLINED_FUNCTION_1_0(v10);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_2468A4F30()
{
  return sub_2468A4F3C((uint64_t (*)(uint64_t))sub_2468A2C64);
}

uint64_t sub_2468A4F3C(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_2_3();
  v2 = OUTLINED_FUNCTION_5_3(v1);
  return a1(v2);
}

void sub_2468A4F64(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_1_0(v2);
  OUTLINED_FUNCTION_3();
}

uint64_t sub_2468A4F8C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_2468A4F9C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2575E4100;
  if (!qword_2575E4100)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E40F8);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2575E4100);
  }
  return result;
}

uint64_t sub_2468A5000@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2468A1F10(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_2468A5008()
{
  uint64_t v0;

  sub_2468A4F8C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return type metadata accessor for MessageDetailView();
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return type metadata accessor for WidgetMessage();
}

uint64_t OUTLINED_FUNCTION_5_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  return v1 + ((v2 + 16) & ~v2);
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return sub_2468D5668();
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_9_2@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return sub_2468D61A8();
}

uint64_t *sub_2468A50D0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t *v8;
  unint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v8 = a2 + 1;
    v9 = a2[2];
    swift_bridgeObjectRetain();
    v49 = a3;
    if (v9 >= 6)
    {
      a1[1] = *v8;
      a1[2] = v9;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_OWORD *)(a1 + 1) = *(_OWORD *)v8;
    }
    v10 = (int *)type metadata accessor for WidgetMailbox();
    v11 = v10[6];
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_2468D568C();
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
    }
    v16 = v10[7];
    v17 = (uint64_t *)((char *)a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v50 = v18[1];
    *v17 = *v18;
    v17[1] = v50;
    v19 = v10[8];
    v20 = (uint64_t *)((char *)a1 + v19);
    v21 = (uint64_t *)((char *)a2 + v19);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    v23 = v10[9];
    v24 = (uint64_t *)((char *)a1 + v23);
    v25 = (uint64_t *)((char *)a2 + v23);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    v27 = v10[10];
    v28 = (uint64_t *)((char *)a1 + v27);
    v29 = (uint64_t *)((char *)a2 + v27);
    v30 = v29[1];
    *v28 = *v29;
    v28[1] = v30;
    v31 = v10[11];
    v32 = (uint64_t *)((char *)a1 + v31);
    v33 = (uint64_t *)((char *)a2 + v31);
    v34 = v33[1];
    *v32 = *v33;
    v32[1] = v34;
    v35 = v10[12];
    v36 = (uint64_t *)((char *)a1 + v35);
    v37 = (uint64_t *)((char *)a2 + v35);
    v38 = v37[1];
    *v36 = *v37;
    v36[1] = v38;
    v39 = *(int *)(type metadata accessor for Snapshot() + 20);
    v40 = (char *)a1 + v39;
    v41 = (char *)a2 + v39;
    v42 = *(uint64_t *)((char *)a2 + v39);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v42 >= 2)
    {
      v43 = *((_QWORD *)v41 + 1);
      *(_QWORD *)v40 = v42;
      *((_QWORD *)v40 + 1) = v43;
      *((_WORD *)v40 + 8) = *((_WORD *)v41 + 8);
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_OWORD *)v40 = *(_OWORD *)v41;
      *((_WORD *)v40 + 8) = *((_WORD *)v41 + 8);
    }
    v44 = *(int *)(v49 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(v49 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v49 + 20));
    v45 = (uint64_t *)((char *)a1 + v44);
    v46 = (uint64_t *)((char *)a2 + v44);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v47 = sub_2468D5B78();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v47 - 8) + 16))(v45, v46, v47);
    }
    else
    {
      *v45 = *v46;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2468A5390(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 16) >= 6uLL)
    swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(type metadata accessor for WidgetMailbox() + 24);
  v5 = sub_2468D568C();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + *(int *)(type metadata accessor for Snapshot() + 20)) >= 2uLL)
    swift_bridgeObjectRelease();
  swift_release();
  v6 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v7 = sub_2468D5B78();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

_QWORD *sub_2468A5500(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v6;
  unint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;

  *a1 = *a2;
  v6 = a2 + 1;
  v7 = a2[2];
  swift_bridgeObjectRetain();
  v47 = a3;
  if (v7 >= 6)
  {
    a1[1] = *v6;
    a1[2] = v7;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *(_OWORD *)v6;
  }
  v8 = (int *)type metadata accessor for WidgetMailbox();
  v9 = v8[6];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_2468D568C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  }
  v14 = v8[7];
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  v48 = v16[1];
  *v15 = *v16;
  v15[1] = v48;
  v17 = v8[8];
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  v21 = v8[9];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  v25 = v8[10];
  v26 = (_QWORD *)((char *)a1 + v25);
  v27 = (_QWORD *)((char *)a2 + v25);
  v28 = v27[1];
  *v26 = *v27;
  v26[1] = v28;
  v29 = v8[11];
  v30 = (_QWORD *)((char *)a1 + v29);
  v31 = (_QWORD *)((char *)a2 + v29);
  v32 = v31[1];
  *v30 = *v31;
  v30[1] = v32;
  v33 = v8[12];
  v34 = (_QWORD *)((char *)a1 + v33);
  v35 = (_QWORD *)((char *)a2 + v33);
  v36 = v35[1];
  *v34 = *v35;
  v34[1] = v36;
  v37 = *(int *)(type metadata accessor for Snapshot() + 20);
  v38 = (char *)a1 + v37;
  v39 = (char *)a2 + v37;
  v40 = *(_QWORD *)((char *)a2 + v37);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v40 >= 2)
  {
    v41 = *((_QWORD *)v39 + 1);
    *(_QWORD *)v38 = v40;
    *((_QWORD *)v38 + 1) = v41;
    *((_WORD *)v38 + 8) = *((_WORD *)v39 + 8);
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)v38 = *(_OWORD *)v39;
    *((_WORD *)v38 + 8) = *((_WORD *)v39 + 8);
  }
  v42 = *(int *)(v47 + 24);
  *(_QWORD *)((char *)a1 + *(int *)(v47 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v47 + 20));
  v43 = (_QWORD *)((char *)a1 + v42);
  v44 = (_QWORD *)((char *)a2 + v42);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v45 = sub_2468D5B78();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v45 - 8) + 16))(v43, v44, v45);
  }
  else
  {
    *v43 = *v44;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *sub_2468A5794(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int EnumTagSinglePayload;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  unint64_t v37;
  __int128 v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a2[2];
  if (a1[2] < 6uLL)
  {
    if (v6 >= 6)
    {
      a1[1] = a2[1];
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v6 < 6)
  {
    sub_2468A4D24((uint64_t)(a1 + 1), &qword_2575E4128);
LABEL_6:
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
    goto LABEL_8;
  }
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  v7 = (int *)type metadata accessor for WidgetMailbox();
  v8 = v7[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_2468D568C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11);
  v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11);
  if (EnumTagSinglePayload)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v14 = *(_QWORD *)(v11 - 8);
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
LABEL_13:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v9, v10, v11);
LABEL_14:
  v16 = v7[7];
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = v7[8];
  v20 = (_QWORD *)((char *)a1 + v19);
  v21 = (_QWORD *)((char *)a2 + v19);
  *v20 = *v21;
  v20[1] = v21[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v22 = v7[9];
  v23 = (_QWORD *)((char *)a1 + v22);
  v24 = (_QWORD *)((char *)a2 + v22);
  *v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v25 = v7[10];
  v26 = (_QWORD *)((char *)a1 + v25);
  v27 = (_QWORD *)((char *)a2 + v25);
  *v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v28 = v7[11];
  v29 = (_QWORD *)((char *)a1 + v28);
  v30 = (_QWORD *)((char *)a2 + v28);
  *v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v31 = v7[12];
  v32 = (_QWORD *)((char *)a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  *v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = *(int *)(type metadata accessor for Snapshot() + 20);
  v35 = (char *)a1 + v34;
  v36 = (char *)a2 + v34;
  v37 = *(_QWORD *)((char *)a2 + v34);
  if (*(_QWORD *)((char *)a1 + v34) >= 2uLL)
  {
    if (v37 >= 2)
    {
      *(_QWORD *)v35 = v37;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v41 = *((_QWORD *)v36 + 1);
      v35[16] = v36[16];
      *((_QWORD *)v35 + 1) = v41;
      v35[17] = v36[17];
    }
    else
    {
      sub_2468A4D24((uint64_t)a1 + v34, qword_2575E4130);
      v39 = *((_WORD *)v36 + 8);
      *(_OWORD *)v35 = *(_OWORD *)v36;
      *((_WORD *)v35 + 8) = v39;
    }
  }
  else if (v37 >= 2)
  {
    *(_QWORD *)v35 = v37;
    v40 = *((_QWORD *)v36 + 1);
    v35[16] = v36[16];
    *((_QWORD *)v35 + 1) = v40;
    v35[17] = v36[17];
    swift_bridgeObjectRetain();
  }
  else
  {
    v38 = *(_OWORD *)v36;
    *((_WORD *)v35 + 8) = *((_WORD *)v36 + 8);
    *(_OWORD *)v35 = v38;
  }
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v42 = *(int *)(a3 + 24);
    v43 = (_QWORD *)((char *)a1 + v42);
    v44 = (_QWORD *)((char *)a2 + v42);
    sub_2468A4D24((uint64_t)a1 + v42, &qword_2575E3850);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v45 = sub_2468D5B78();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v45 - 8) + 16))(v43, v44, v45);
    }
    else
    {
      *v43 = *v44;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2468A5B9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = (int *)type metadata accessor for WidgetMailbox();
  v7 = v6[6];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_2468D568C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  *(_OWORD *)(a1 + v6[7]) = *(_OWORD *)(a2 + v6[7]);
  *(_OWORD *)(a1 + v6[8]) = *(_OWORD *)(a2 + v6[8]);
  *(_OWORD *)(a1 + v6[9]) = *(_OWORD *)(a2 + v6[9]);
  *(_OWORD *)(a1 + v6[10]) = *(_OWORD *)(a2 + v6[10]);
  *(_OWORD *)(a1 + v6[11]) = *(_OWORD *)(a2 + v6[11]);
  *(_OWORD *)(a1 + v6[12]) = *(_OWORD *)(a2 + v6[12]);
  v12 = *(int *)(type metadata accessor for Snapshot() + 20);
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_OWORD *)v13 = *(_OWORD *)v14;
  *(_WORD *)(v13 + 16) = *(_WORD *)(v14 + 16);
  v15 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v16 = (void *)(a1 + v15);
  v17 = (const void *)(a2 + v15);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v19 = sub_2468D5B78();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v16, v17, v19);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  return a1;
}

uint64_t sub_2468A5D60(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  _OWORD *v6;
  unint64_t v7;
  int *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  uint64_t v12;
  int EnumTagSinglePayload;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  void *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;

  *(_QWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = a2 + 1;
  if (*(_QWORD *)(a1 + 16) < 6uLL)
    goto LABEL_4;
  v7 = a2[2];
  if (v7 < 6)
  {
    sub_2468A4D24(a1 + 8, &qword_2575E4128);
LABEL_4:
    *(_OWORD *)(a1 + 8) = *v6;
    goto LABEL_6;
  }
  *(_QWORD *)(a1 + 8) = *(_QWORD *)v6;
  *(_QWORD *)(a1 + 16) = v7;
  swift_bridgeObjectRelease();
LABEL_6:
  v8 = (int *)type metadata accessor for WidgetMailbox();
  v9 = v8[6];
  v10 = (void *)(a1 + v9);
  v11 = (char *)a2 + v9;
  v12 = sub_2468D568C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (EnumTagSinglePayload)
  {
    if (!v14)
    {
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v15 = *(_QWORD *)(v12 - 8);
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v10, v12);
LABEL_11:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(void *, char *, uint64_t))(v15 + 40))(v10, v11, v12);
LABEL_12:
  v17 = v8[7];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  v21 = *v19;
  v20 = v19[1];
  *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  v22 = v8[8];
  v23 = (_QWORD *)(a1 + v22);
  v24 = (_QWORD *)((char *)a2 + v22);
  v26 = *v24;
  v25 = v24[1];
  *v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  v27 = v8[9];
  v28 = (_QWORD *)(a1 + v27);
  v29 = (_QWORD *)((char *)a2 + v27);
  v31 = *v29;
  v30 = v29[1];
  *v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  v32 = v8[10];
  v33 = (_QWORD *)(a1 + v32);
  v34 = (_QWORD *)((char *)a2 + v32);
  v36 = *v34;
  v35 = v34[1];
  *v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  v37 = v8[11];
  v38 = (_QWORD *)(a1 + v37);
  v39 = (_QWORD *)((char *)a2 + v37);
  v41 = *v39;
  v40 = v39[1];
  *v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease();
  v42 = v8[12];
  v43 = (_QWORD *)(a1 + v42);
  v44 = (_QWORD *)((char *)a2 + v42);
  v46 = *v44;
  v45 = v44[1];
  *v43 = v46;
  v43[1] = v45;
  swift_bridgeObjectRelease();
  v47 = *(int *)(type metadata accessor for Snapshot() + 20);
  v48 = a1 + v47;
  v49 = (char *)a2 + v47;
  if (*(_QWORD *)(a1 + v47) < 2uLL)
  {
LABEL_15:
    *(_OWORD *)v48 = *(_OWORD *)v49;
    *(_WORD *)(v48 + 16) = *((_WORD *)v49 + 8);
    goto LABEL_17;
  }
  if (*(_QWORD *)v49 < 2uLL)
  {
    sub_2468A4D24(v48, qword_2575E4130);
    goto LABEL_15;
  }
  *(_QWORD *)v48 = *(_QWORD *)v49;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v48 + 8) = *((_QWORD *)v49 + 1);
  *(_BYTE *)(v48 + 16) = v49[16];
  *(_BYTE *)(v48 + 17) = v49[17];
LABEL_17:
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_release();
  if ((_QWORD *)a1 != a2)
  {
    v50 = *(int *)(a3 + 24);
    v51 = (void *)(a1 + v50);
    v52 = (char *)a2 + v50;
    sub_2468A4D24(a1 + v50, &qword_2575E3850);
    v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v54 = sub_2468D5B78();
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v54 - 8) + 32))(v51, v52, v54);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v51, v52, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_2468A6084()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2468A6090(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v6 = OUTLINED_FUNCTION_4_5();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  if ((_DWORD)v3 != 0x7FFFFFFF)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FB0);
    v8 = v4 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v8, v3, v7);
  }
  v9 = *(_QWORD *)(v4 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_2468A6124()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2468A6130(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = OUTLINED_FUNCTION_4_5();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = v5;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(v5 + *(int *)(a4 + 20)) = (v4 - 1);
      return result;
    }
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FB0);
    v10 = v5 + *(int *)(a4 + 24);
  }
  return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

uint64_t type metadata accessor for MessageListHeaderView()
{
  uint64_t result;

  result = qword_2575E4190;
  if (!qword_2575E4190)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2468A61F8()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for Snapshot();
  if (v0 <= 0x3F)
  {
    sub_2468A4A50();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_2468A6288()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2468A6298()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  char v7;
  void (*v8)(char *, uint64_t);
  uint64_t v10;

  v0 = sub_2468D5B78();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v10 - v5;
  OUTLINED_FUNCTION_3_4();
  sub_2468BDF34((uint64_t)v6);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BDEB3F0], v0);
  v7 = sub_2468D5B6C();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  if ((v7 & 1) != 0)
    return sub_2468D6160();
  else
    return sub_2468D6148();
}

id sub_2468A6384()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16F0]), sel_init);
  objc_msgSend(v0, sel_setNumberStyle_, 1);
  result = objc_msgSend(v0, sel_setUsesSignificantDigits_, 0);
  qword_2575E4120 = (uint64_t)v0;
  return result;
}

void sub_2468A63E4(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  char *v12;
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
  unint64_t v24;
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

  v37 = a1;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E41D0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E41D8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_14();
  v36 = v6;
  v7 = OUTLINED_FUNCTION_3_4();
  v30 = *(_QWORD *)(v7 - 8);
  v8 = *(_QWORD *)(v30 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v31 = (uint64_t)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E41E0);
  v33 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_14();
  v32 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2468D568C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v29 - v18;
  v20 = type metadata accessor for WidgetMailbox();
  sub_246897AE8(v1 + *(int *)(v20 + 24), (uint64_t)v12, &qword_2575E3FA8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13) == 1)
  {
    sub_2468A4D24((uint64_t)v12, &qword_2575E3FA8);
    *(_QWORD *)v4 = sub_2468D5DA0();
    *((_QWORD *)v4 + 1) = 0x4018000000000000;
    v4[16] = 0;
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E41E8);
    sub_2468A680C(v1, (uint64_t)&v4[*(int *)(v21 + 44)]);
    sub_246897AE8((uint64_t)v4, v36, &qword_2575E41D0);
    swift_storeEnumTagMultiPayload();
    sub_246897A74(&qword_2575E41F0, &qword_2575E41E0, MEMORY[0x24BDF19E0]);
    sub_246897A74(&qword_2575E41F8, &qword_2575E41D0, MEMORY[0x24BDF4498]);
    sub_2468D5E3C();
    sub_2468A4D24((uint64_t)v4, &qword_2575E41D0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
    v22 = v1;
    v23 = v31;
    sub_2468A6D8C(v22, v31);
    v24 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
    v25 = swift_allocObject();
    sub_2468A6F2C(v23, v25 + v24);
    sub_246897A74(&qword_2575E41F8, &qword_2575E41D0, MEMORY[0x24BDF4498]);
    v26 = v32;
    sub_2468D6004();
    swift_release();
    v27 = v33;
    v28 = v35;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v36, v26, v35);
    swift_storeEnumTagMultiPayload();
    sub_246897A74(&qword_2575E41F0, &qword_2575E41E0, MEMORY[0x24BDF19E0]);
    sub_2468D5E3C();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
  }
}

uint64_t sub_2468A67C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  *(_QWORD *)a2 = sub_2468D5DA0();
  *(_QWORD *)(a2 + 8) = 0x4018000000000000;
  *(_BYTE *)(a2 + 16) = 0;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E41E8);
  return sub_2468A680C(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_2468A680C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t *v5;
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
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t KeyPath;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  int v43;
  _BYTE *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  char v54;
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE v61[12];
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _BYTE *v72;
  _BYTE *v73;
  uint64_t v74;
  _BYTE *v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _BYTE *v81;
  uint64_t v82;
  uint64_t v83;

  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4200);
  MEMORY[0x24BDAC7A8](v71);
  v5 = (uint64_t *)&v61[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v74 = sub_2468D5C74();
  v6 = *(_QWORD *)(v74 - 8);
  MEMORY[0x24BDAC7A8](v74);
  v73 = &v61[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v81 = (_BYTE *)__swift_instantiateConcreteTypeFromMangledName(&qword_2575E4208);
  MEMORY[0x24BDAC7A8](v81);
  v72 = &v61[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4210);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v75 = &v61[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v13 = &v61[-v12];
  v82 = sub_2468D0994();
  v83 = v14;
  sub_246897B28();
  v15 = sub_2468D6058();
  v79 = v16;
  v80 = v15;
  v76 = v17;
  v19 = v18;
  KeyPath = swift_getKeyPath();
  sub_2468D5F98();
  sub_2468D5F74();
  v78 = sub_2468D5FB0();
  swift_release();
  v21 = swift_getKeyPath();
  v77 = sub_2468A6298();
  v22 = a1 + *(int *)(type metadata accessor for Snapshot() + 20);
  v23 = 1;
  if (*(_QWORD *)v22 >= 2uLL && (*(_WORD *)(v22 + 16) & 1) == 0 && *(uint64_t *)(v22 + 8) >= 1)
  {
    v66 = v6;
    v67 = v5;
    v69 = KeyPath;
    v70 = v19;
    if (qword_2575E3820 != -1)
      swift_once();
    v24 = (void *)qword_2575E4120;
    v25 = (void *)sub_2468D6508();
    v26 = objc_msgSend(v24, sel_stringForObjectValue_, v25);

    if (v26)
    {
      v27 = sub_2468D6484();
      v29 = v28;

      v82 = v27;
      v83 = v29;
      v30 = sub_2468D6058();
      v32 = v31;
      LOBYTE(v29) = v33 & 1;
      type metadata accessor for MessageListHeaderView();
      v34 = sub_2468D6040();
      v63 = v35;
      v37 = v36 & 1;
      sub_2468A4F8C(v30, v32, v29);
      swift_bridgeObjectRelease();
      sub_2468D616C();
      v38 = v34;
      v39 = v63;
      v68 = sub_2468D601C();
      v65 = v40;
      LOBYTE(v27) = v41;
      v64 = v42;
      swift_release();
      v43 = v27 & 1;
      sub_2468A4F8C(v38, v39, v37);
      swift_bridgeObjectRelease();
      v44 = v73;
      sub_2468D5C68();
      v45 = swift_getKeyPath();
      v46 = v66;
      v47 = v67;
      v48 = v74;
      (*(void (**)(char *, _BYTE *, uint64_t))(v66 + 16))((char *)v67 + *(int *)(v71 + 28), v44, v74);
      *v47 = v45;
      v49 = (uint64_t)v72;
      sub_246897AE8((uint64_t)v47, (uint64_t)&v72[*((int *)v81 + 9)], &qword_2575E4200);
      v50 = v68;
      v51 = v65;
      *(_QWORD *)v49 = v68;
      *(_QWORD *)(v49 + 8) = v51;
      v52 = v43;
      v62 = v43;
      *(_BYTE *)(v49 + 16) = v43;
      *(_QWORD *)(v49 + 24) = v64;
      v53 = v51;
      sub_2468A7034(v50, v51, v52);
      swift_bridgeObjectRetain();
      sub_2468A4D24((uint64_t)v47, &qword_2575E4200);
      (*(void (**)(_BYTE *, uint64_t))(v46 + 8))(v44, v48);
      sub_2468A4F8C(v68, v53, v62);
      swift_bridgeObjectRelease();
      sub_2468A7068(v49, (uint64_t)v13);
      v23 = 0;
    }
    else
    {
      v23 = 1;
    }
    KeyPath = v69;
    v19 = v70;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v13, v23, 1, (uint64_t)v81);
  v54 = v76 & 1;
  v55 = v75;
  sub_246897AE8((uint64_t)v13, (uint64_t)v75, &qword_2575E4210);
  v57 = v79;
  v56 = v80;
  *(_QWORD *)a2 = v80;
  *(_QWORD *)(a2 + 8) = v57;
  *(_BYTE *)(a2 + 16) = v54;
  *(_QWORD *)(a2 + 24) = v19;
  *(_QWORD *)(a2 + 32) = KeyPath;
  *(_QWORD *)(a2 + 40) = 1;
  *(_BYTE *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = v21;
  v81 = v13;
  v58 = v77;
  *(_QWORD *)(a2 + 64) = v78;
  *(_QWORD *)(a2 + 72) = v58;
  *(_QWORD *)(a2 + 80) = 0x3FE999999999999ALL;
  *(_QWORD *)(a2 + 88) = 0;
  *(_BYTE *)(a2 + 96) = 1;
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4218);
  sub_246897AE8((uint64_t)v55, a2 + *(int *)(v59 + 64), &qword_2575E4210);
  sub_2468A7034(v56, v57, v54);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2468A4D24((uint64_t)v81, &qword_2575E4210);
  sub_2468A4D24((uint64_t)v55, &qword_2575E4210);
  sub_2468A4F8C(v56, v57, v54);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2468A6D8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MessageListHeaderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2468A6DD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_3_4() - 8) + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v2 + 16) >= 6uLL)
    swift_bridgeObjectRelease();
  v3 = v2 + *(int *)(type metadata accessor for WidgetMailbox() + 24);
  v4 = sub_2468D568C();
  if (!__swift_getEnumTagSinglePayload(v3, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_8_1();
  if (*(_QWORD *)(v2 + *(int *)(type metadata accessor for Snapshot() + 20)) >= 2uLL)
    swift_bridgeObjectRelease();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_2468D5B78();
    OUTLINED_FUNCTION_1_0(v5);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_2468A6F2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MessageListHeaderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2468A6F70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_3_4() - 8) + 80);
  return sub_2468A67C0(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_2468A6FA8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_2468D5C74();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2468D5D04();
}

uint64_t sub_2468A7034(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_2468A7044()
{
  return sub_2468D5CF8();
}

uint64_t sub_2468A7068(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4208);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2468A70B4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2575E4220;
  if (!qword_2575E4220)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4228);
    sub_246897A74(&qword_2575E41F0, &qword_2575E41E0, MEMORY[0x24BDF19E0]);
    v3 = v2;
    sub_246897A74(&qword_2575E41F8, &qword_2575E41D0, MEMORY[0x24BDF4498]);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x249562024](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2575E4220);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return type metadata accessor for MessageListHeaderView();
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return type metadata accessor for Snapshot();
}

uint64_t sub_2468A7168@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = sub_2468D57AC();
  v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)), v5);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  return OUTLINED_FUNCTION_10_2(a2, v7, 1, v6);
}

uint64_t sub_2468A71D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = type metadata accessor for WidgetMessage();
  v6 = v5;
  if (v4)
  {
    v7 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
    sub_24689B160(a1 + ((v7 + 32) & ~v7), a2, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v8, 1, v6);
}

void MessageListView.init(mode:messages:numberOfSummaryLines:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t *v42;
  int *v43;
  char v44;
  char v45;
  char v46;
  char *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  unint64_t v77;
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

  v80 = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4230);
  MEMORY[0x24BDAC7A8](v7);
  v88 = (uint64_t)&v79 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_6_5();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_8_2();
  v87 = v10;
  OUTLINED_FUNCTION_6_5();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_8_2();
  v86 = v12;
  OUTLINED_FUNCTION_6_5();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_8_2();
  v85 = v14;
  OUTLINED_FUNCTION_6_5();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_8_2();
  v84 = v16;
  OUTLINED_FUNCTION_6_5();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_8_2();
  v83 = v18;
  OUTLINED_FUNCTION_6_5();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_8_2();
  v82 = v20;
  OUTLINED_FUNCTION_6_5();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_8_2();
  v81 = v22;
  OUTLINED_FUNCTION_6_5();
  v24 = MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v79 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)&v79 - v28;
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)&v79 - v31;
  v33 = MEMORY[0x24BDAC7A8](v30);
  v35 = (char *)&v79 - v34;
  v36 = MEMORY[0x24BDAC7A8](v33);
  v38 = (char *)&v79 - v37;
  MEMORY[0x24BDAC7A8](v36);
  v40 = (char *)&v79 - v39;
  sub_2468D6430();
  sub_24689B12C(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  *(_QWORD *)a4 = sub_2468D5C8C();
  *(_QWORD *)(a4 + 8) = v41;
  v42 = (uint64_t *)(a4 + *(int *)(OUTLINED_FUNCTION_9_3() + 88));
  *v42 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)(a4 + 16) = a1;
  *(_QWORD *)(a4 + 24) = a2;
  OUTLINED_FUNCTION_1_1((uint64_t)v40);
  v43 = (int *)type metadata accessor for WidgetMessage();
  OUTLINED_FUNCTION_0_5((uint64_t)v40);
  if (v44)
  {
    swift_bridgeObjectRetain();
    sub_2468A4D24((uint64_t)v40, &qword_2575E4230);
    v45 = 0;
  }
  else
  {
    v45 = v40[v43[17]];
    swift_bridgeObjectRetain();
    sub_2468A4F64((uint64_t)v40, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
  }
  *(_BYTE *)(a4 + 32) = v45;
  OUTLINED_FUNCTION_1_1((uint64_t)v38);
  OUTLINED_FUNCTION_0_5((uint64_t)v38);
  if (v44)
  {
    sub_2468A4D24((uint64_t)v38, &qword_2575E4230);
    v46 = 0;
  }
  else
  {
    v46 = v38[v43[14]];
    sub_2468A4F64((uint64_t)v38, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
  }
  *(_BYTE *)(a4 + 33) = v46;
  *(_QWORD *)(a4 + 40) = v80;
  OUTLINED_FUNCTION_1_1((uint64_t)v35);
  OUTLINED_FUNCTION_0_5((uint64_t)v35);
  if (v44)
  {
    sub_2468A4D24((uint64_t)v35, &qword_2575E4230);
    v49 = 0;
    v48 = 0xE000000000000000;
  }
  else
  {
    v47 = &v35[v43[20]];
    v49 = *(_QWORD *)v47;
    v48 = *((_QWORD *)v47 + 1);
    swift_bridgeObjectRetain();
    sub_2468A4F64((uint64_t)v35, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
  }
  v50 = v81;
  *(_QWORD *)(a4 + 48) = v49;
  *(_QWORD *)(a4 + 56) = v48;
  OUTLINED_FUNCTION_1_1((uint64_t)v32);
  OUTLINED_FUNCTION_0_5((uint64_t)v32);
  if (v44)
  {
    sub_2468A4D24((uint64_t)v32, &qword_2575E4230);
    v53 = 0;
    v52 = 0xE000000000000000;
  }
  else
  {
    v51 = &v32[v43[21]];
    v53 = *(_QWORD *)v51;
    v52 = *((_QWORD *)v51 + 1);
    swift_bridgeObjectRetain();
    sub_2468A4F64((uint64_t)v32, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
  }
  v54 = v83;
  *(_QWORD *)(a4 + 64) = v53;
  *(_QWORD *)(a4 + 72) = v52;
  OUTLINED_FUNCTION_1_1((uint64_t)v29);
  v55 = OUTLINED_FUNCTION_0_5((uint64_t)v29);
  if (v44)
  {
    OUTLINED_FUNCTION_18_0(v55, &qword_2575E4230);
    v58 = 0;
    v57 = 0xE000000000000000;
  }
  else
  {
    v56 = &v29[v43[22]];
    v58 = *(_QWORD *)v56;
    v57 = *((_QWORD *)v56 + 1);
    v59 = swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_17_0(v59, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
  }
  v60 = v84;
  *(_QWORD *)(a4 + 80) = v58;
  *(_QWORD *)(a4 + 88) = v57;
  OUTLINED_FUNCTION_1_1((uint64_t)v26);
  OUTLINED_FUNCTION_0_5((uint64_t)v26);
  if (v44)
  {
    sub_2468A4D24((uint64_t)v26, &qword_2575E4230);
    v63 = 0;
    v62 = 0xE000000000000000;
  }
  else
  {
    v61 = &v26[v43[23]];
    v63 = *(_QWORD *)v61;
    v62 = *((_QWORD *)v61 + 1);
    swift_bridgeObjectRetain();
    sub_2468A4F64((uint64_t)v26, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
  }
  v64 = v85;
  *(_QWORD *)(a4 + 96) = v63;
  *(_QWORD *)(a4 + 104) = v62;
  OUTLINED_FUNCTION_1_1(v50);
  OUTLINED_FUNCTION_0_5(v50);
  if (v44)
  {
    sub_2468A4D24(v50, &qword_2575E4230);
    v67 = 0;
    v66 = 0xE000000000000000;
  }
  else
  {
    v65 = (uint64_t *)(v50 + v43[24]);
    v67 = *v65;
    v66 = v65[1];
    swift_bridgeObjectRetain();
    sub_2468A4F64(v50, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
  }
  v68 = v86;
  *(_QWORD *)(a4 + 112) = v67;
  *(_QWORD *)(a4 + 120) = v66;
  v69 = v82;
  OUTLINED_FUNCTION_1_1(v82);
  v70 = OUTLINED_FUNCTION_0_5(v69);
  if (v44)
  {
    OUTLINED_FUNCTION_18_0(v70, &qword_2575E4230);
    OUTLINED_FUNCTION_11_1();
  }
  else
  {
    v71 = OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_17_0(v71, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
  }
  v72 = v87;
  *(_QWORD *)(a4 + 128) = v66;
  *(_QWORD *)(a4 + 136) = v50;
  OUTLINED_FUNCTION_1_1(v54);
  OUTLINED_FUNCTION_0_5(v54);
  if (v44)
  {
    sub_2468A4D24(v54, &qword_2575E4230);
    OUTLINED_FUNCTION_11_1();
  }
  else
  {
    OUTLINED_FUNCTION_2_4();
    sub_2468A4F64(v54, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
  }
  *(_QWORD *)(a4 + 144) = v66;
  *(_QWORD *)(a4 + 152) = v50;
  OUTLINED_FUNCTION_1_1(v60);
  OUTLINED_FUNCTION_0_5(v60);
  if (v44)
  {
    sub_2468A4D24(v60, &qword_2575E4230);
    OUTLINED_FUNCTION_11_1();
  }
  else
  {
    OUTLINED_FUNCTION_2_4();
    sub_2468A4F64(v60, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
  }
  *(_QWORD *)(a4 + 160) = v66;
  *(_QWORD *)(a4 + 168) = v50;
  OUTLINED_FUNCTION_1_1(v64);
  OUTLINED_FUNCTION_0_5(v64);
  if (v44)
  {
    sub_2468A4D24(v64, &qword_2575E4230);
    OUTLINED_FUNCTION_11_1();
  }
  else
  {
    OUTLINED_FUNCTION_2_4();
    sub_2468A4F64(v64, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
  }
  *(_QWORD *)(a4 + 176) = v66;
  *(_QWORD *)(a4 + 184) = v50;
  OUTLINED_FUNCTION_1_1(v68);
  OUTLINED_FUNCTION_0_5(v68);
  if (v44)
  {
    sub_2468A4D24(v68, &qword_2575E4230);
    OUTLINED_FUNCTION_11_1();
  }
  else
  {
    OUTLINED_FUNCTION_2_4();
    sub_2468A4F64(v68, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
  }
  *(_QWORD *)(a4 + 192) = v66;
  *(_QWORD *)(a4 + 200) = v50;
  OUTLINED_FUNCTION_1_1(v72);
  v73 = OUTLINED_FUNCTION_0_5(v72);
  if (v44)
  {
    OUTLINED_FUNCTION_18_0(v73, &qword_2575E4230);
    OUTLINED_FUNCTION_11_1();
  }
  else
  {
    v74 = OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_17_0(v74, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
  }
  *(_QWORD *)(a4 + 208) = v66;
  *(_QWORD *)(a4 + 216) = v50;
  v75 = v88;
  OUTLINED_FUNCTION_1_1(v88);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_5(v75);
  if (v44)
  {
    sub_2468A4D24(v75, &qword_2575E4230);
    v78 = 0;
    v77 = 0xE000000000000000;
  }
  else
  {
    v76 = (uint64_t *)(v75 + v43[31]);
    v78 = *v76;
    v77 = v76[1];
    swift_bridgeObjectRetain();
    sub_2468A4F64(v75, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
  }
  *(_QWORD *)(a4 + 224) = v78;
  *(_QWORD *)(a4 + 232) = v77;
}

uint64_t type metadata accessor for MessageListView()
{
  uint64_t result;

  result = qword_2575E4298;
  if (!qword_2575E4298)
    return swift_getSingletonMetadata();
  return result;
}

void MessageListView.body.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)a1 = sub_2468D5E18();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4238);
  sub_2468A79B8(v1, a1 + *(int *)(v3 + 44));
  OUTLINED_FUNCTION_3();
}

void sub_2468A79B8(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int *v45;
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
  _QWORD *v60;
  _QWORD *v61;
  _QWORD *v62;
  _QWORD *v63;
  _QWORD *v64;
  _QWORD *v65;
  uint64_t v66;
  __int16 v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _OWORD *v79;
  __int128 v80;
  __int128 v81;
  unsigned __int8 v82;
  unsigned __int8 v83;
  unsigned __int8 v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t KeyPath;
  uint64_t v106;
  uint64_t *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  void (*v114)(char *, uint64_t);
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t *v121;
  char *v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char v129;
  unsigned __int8 v130;
  char v131;
  char v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t *v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void (*v168)(char *, char *, uint64_t);
  char *v169;
  uint64_t v170;
  int *v171;
  void (*v172)(char *, uint64_t);
  uint64_t v173;
  char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  char *v184;
  uint64_t v185;
  uint64_t v186;
  char *v187;
  uint64_t v188;
  uint64_t v189;
  char *v190;
  uint64_t v191;
  uint64_t v192;
  char *v193;
  uint64_t v194;
  uint64_t v195;
  char *v196;
  char *v197;
  char *v198;
  uint64_t v199;
  char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t *v211;
  char *v212;
  char *v213;
  uint64_t v214;
  char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  char *v226;
  uint64_t v227;
  uint64_t v228;
  char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238[5];
  __int128 v239;
  __int128 v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;

  v216 = a2;
  v3 = sub_2468D5740();
  MEMORY[0x24BDAC7A8](v3);
  v196 = (char *)&v173 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v208 = sub_2468D6334();
  v199 = *(_QWORD *)(v208 - 8);
  MEMORY[0x24BDAC7A8](v208);
  v198 = (char *)&v173 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v205 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4328);
  v201 = *(_QWORD *)(v205 - 8);
  v6 = MEMORY[0x24BDAC7A8](v205);
  v197 = (char *)&v173 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v200 = (char *)&v173 - v8;
  v209 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4330);
  MEMORY[0x24BDAC7A8](v209);
  v211 = (uint64_t *)((char *)&v173 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v203 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4338);
  MEMORY[0x24BDAC7A8](v203);
  v207 = (uint64_t)&v173 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v210 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4340);
  MEMORY[0x24BDAC7A8](v210);
  v204 = (char *)&v173 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v186 = sub_2468D6304();
  v185 = *(_QWORD *)(v186 - 8);
  MEMORY[0x24BDAC7A8](v186);
  v193 = (char *)&v173 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v195 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4348);
  v13 = MEMORY[0x24BDAC7A8](v195);
  v184 = (char *)&v173 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v183 = (uint64_t)&v173 - v15;
  v182 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4350);
  MEMORY[0x24BDAC7A8](v182);
  v192 = (uint64_t)&v173 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v181 = sub_2468D5C5C();
  v179 = *(_QWORD *)(v181 - 8);
  MEMORY[0x24BDAC7A8](v181);
  v180 = (char *)&v173 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v176 = sub_2468D62C8();
  v175 = *(_QWORD *)(v176 - 8);
  MEMORY[0x24BDAC7A8](v176);
  v174 = (char *)&v173 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v191 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4358);
  v189 = *(_QWORD *)(v191 - 8);
  MEMORY[0x24BDAC7A8](v191);
  v190 = (char *)&v173 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v178 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4360);
  v177 = *(_QWORD *)(v178 - 8);
  MEMORY[0x24BDAC7A8](v178);
  v187 = (char *)&v173 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v188 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4368);
  MEMORY[0x24BDAC7A8](v188);
  v202 = (uint64_t)&v173 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v206 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4370);
  MEMORY[0x24BDAC7A8](v206);
  v194 = (uint64_t)&v173 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4378);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v215 = (char *)&v173 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v213 = (char *)&v173 - v26;
  v27 = type metadata accessor for MessageListView();
  v220 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v221 = v28;
  v232 = (uint64_t)&v173 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v214 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4380);
  v231 = *(_QWORD *)(v214 - 8);
  v29 = MEMORY[0x24BDAC7A8](v214);
  v212 = (char *)&v173 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v234 = (char *)&v173 - v31;
  v219 = sub_2468D6238();
  v218 = *(_QWORD *)(v219 - 8);
  MEMORY[0x24BDAC7A8](v219);
  v226 = (char *)&v173 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v217 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4388);
  v33 = MEMORY[0x24BDAC7A8](v217);
  v230 = (uint64_t)&v173 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = MEMORY[0x24BDAC7A8](v33);
  v229 = (char *)&v173 - v36;
  MEMORY[0x24BDAC7A8](v35);
  v237 = (uint64_t)&v173 - v37;
  v222 = type metadata accessor for MessageListHeaderView();
  MEMORY[0x24BDAC7A8](v222);
  v39 = (uint64_t *)((char *)&v173 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0));
  v225 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4390);
  MEMORY[0x24BDAC7A8](v225);
  v223 = (uint64_t)&v173 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v227 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4398);
  MEMORY[0x24BDAC7A8](v227);
  v224 = (uint64_t)&v173 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v228 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E43A0);
  v42 = MEMORY[0x24BDAC7A8](v228);
  v236 = (uint64_t)&v173 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v42);
  v235 = (uint64_t)&v173 - v44;
  v45 = (int *)type metadata accessor for WidgetMailbox();
  v46 = (uint64_t)v39 + v45[6];
  v47 = sub_2468D568C();
  __swift_storeEnumTagSinglePayload(v46, 1, 1, v47);
  v48 = *(_QWORD *)(a1 + 96);
  v49 = *(_QWORD *)(a1 + 104);
  v50 = *(_QWORD *)(a1 + 112);
  v51 = *(_QWORD *)(a1 + 120);
  v52 = *(_QWORD *)(a1 + 128);
  v53 = *(_QWORD *)(a1 + 136);
  v54 = *(_QWORD *)(a1 + 144);
  v55 = *(_QWORD *)(a1 + 152);
  v56 = *(_QWORD *)(a1 + 160);
  v57 = *(_QWORD *)(a1 + 168);
  v58 = *(_QWORD *)(a1 + 176);
  v59 = *(_QWORD *)(a1 + 184);
  *v39 = 0;
  v39[1] = 0;
  v39[2] = 1;
  v60 = (_QWORD *)((char *)v39 + v45[7]);
  *v60 = v48;
  v60[1] = v49;
  v61 = (_QWORD *)((char *)v39 + v45[8]);
  *v61 = v50;
  v61[1] = v51;
  v62 = (_QWORD *)((char *)v39 + v45[9]);
  *v62 = v52;
  v62[1] = v53;
  v63 = (_QWORD *)((char *)v39 + v45[10]);
  *v63 = v54;
  v63[1] = v55;
  v64 = (_QWORD *)((char *)v39 + v45[11]);
  *v64 = v56;
  v64[1] = v57;
  v65 = (_QWORD *)((char *)v39 + v45[12]);
  *v65 = v58;
  v65[1] = v59;
  v66 = *(_QWORD *)(a1 + 24);
  v233 = a1;
  if (*(_BYTE *)(a1 + 33))
    v67 = 257;
  else
    v67 = 1;
  v68 = (char *)v39 + *(int *)(type metadata accessor for Snapshot() + 20);
  *(_QWORD *)v68 = v66;
  *((_QWORD *)v68 + 1) = 0;
  *((_WORD *)v68 + 8) = v67;
  v69 = v222;
  v70 = *(int *)(v222 + 20);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v71 = v226;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(_QWORD *)((char *)v39 + v70) = sub_2468D5FE0();
  v72 = (_QWORD *)((char *)v39 + *(int *)(v69 + 24));
  *v72 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  swift_storeEnumTagMultiPayload();
  LOBYTE(v72) = sub_2468D5F14();
  v73 = v223;
  sub_24689B160((uint64_t)v39, v223, (uint64_t (*)(_QWORD))type metadata accessor for MessageListHeaderView);
  v74 = v73 + *(int *)(v225 + 36);
  *(_BYTE *)v74 = (_BYTE)v72;
  *(_OWORD *)(v74 + 8) = 0u;
  *(_OWORD *)(v74 + 24) = 0u;
  *(_BYTE *)(v74 + 40) = 1;
  sub_2468A4F64((uint64_t)v39, (uint64_t (*)(_QWORD))type metadata accessor for MessageListHeaderView);
  v75 = sub_2468D5EFC();
  v76 = v224;
  sub_2468AB35C(v73, v224, &qword_2575E4390);
  v77 = v76 + *(int *)(v227 + 36);
  *(_BYTE *)v77 = v75;
  *(_OWORD *)(v77 + 8) = 0u;
  *(_OWORD *)(v77 + 24) = 0u;
  *(_BYTE *)(v77 + 40) = 1;
  sub_2468A4D24(v73, &qword_2575E4390);
  sub_2468D6280();
  sub_2468D5BE4();
  v78 = v236;
  sub_2468AB35C(v76, v236, &qword_2575E4398);
  v79 = (_OWORD *)(v78 + *(int *)(v228 + 36));
  v80 = v247;
  v81 = v248;
  *v79 = v246;
  v79[1] = v80;
  v79[2] = v81;
  sub_2468A4D24(v76, &qword_2575E4398);
  sub_2468AB388(v78, v235, &qword_2575E43A0);
  sub_2468D622C();
  v82 = sub_2468D5F14();
  v83 = sub_2468D5EFC();
  v84 = sub_2468D5F08();
  v85 = sub_2468D5F20();
  sub_2468D5F20();
  if (sub_2468D5F20() != v82)
    v85 = sub_2468D5F20();
  sub_2468D5F20();
  if (sub_2468D5F20() != v83)
    v85 = sub_2468D5F20();
  v86 = v233;
  v87 = v232;
  v88 = v220;
  v89 = v219;
  v90 = v218;
  v91 = v217;
  sub_2468D5F20();
  if (sub_2468D5F20() != v84)
    v85 = sub_2468D5F20();
  v92 = (uint64_t)v229;
  (*(void (**)(char *, char *, uint64_t))(v90 + 16))(v229, v71, v89);
  v93 = v92 + *(int *)(v91 + 36);
  *(_BYTE *)v93 = v85;
  *(_OWORD *)(v93 + 8) = 0u;
  *(_OWORD *)(v93 + 24) = 0u;
  *(_BYTE *)(v93 + 40) = 1;
  (*(void (**)(char *, uint64_t))(v90 + 8))(v71, v89);
  sub_2468AB388(v92, v237, &qword_2575E4388);
  sub_24689B160(v86, v87, (uint64_t (*)(_QWORD))type metadata accessor for MessageListView);
  v94 = (*(unsigned __int8 *)(v88 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80);
  v95 = swift_allocObject();
  sub_24689B268(v87, v95 + v94, (uint64_t (*)(_QWORD))type metadata accessor for MessageListView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E43A8);
  sub_2468AABA8(&qword_2575E43B0, &qword_2575E43A8, (uint64_t (*)(void))sub_2468AA9D0, MEMORY[0x24BDF4A08]);
  sub_2468D62EC();
  v96 = *(_QWORD *)(v86 + 16);
  if (v96 == 1)
  {
    v145 = *(_QWORD *)(v86 + 80);
    v144 = *(_QWORD *)(v86 + 88);
    v244 = MEMORY[0x24BEE0D00];
    v245 = MEMORY[0x24BEAE5B8];
    v242 = v145;
    v243 = v144;
    v241 = 0;
    v239 = 0u;
    v240 = 0u;
    swift_bridgeObjectRetain();
    sub_2468D5728();
    v238[3] = sub_2468D62D4();
    v238[4] = MEMORY[0x24BEADA30];
    __swift_allocate_boxed_opaque_existential_1(v238);
    sub_2468D62E0();
    v146 = v198;
    sub_2468D6328();
    sub_24689B160(v86, v87, (uint64_t (*)(_QWORD))type metadata accessor for MessageListView);
    v147 = swift_allocObject();
    sub_24689B268(v87, v147 + v94, (uint64_t (*)(_QWORD))type metadata accessor for MessageListView);
    sub_24689B12C(&qword_2575E4418, (void (*)(uint64_t))MEMORY[0x24BEADE00]);
    v149 = v148;
    v150 = v197;
    v151 = v208;
    sub_2468D60AC();
    swift_release();
    (*(void (**)(char *, uint64_t))(v199 + 8))(v146, v151);
    v152 = v201;
    v153 = v200;
    v154 = v205;
    (*(void (**)(char *, char *, uint64_t))(v201 + 32))(v200, v150, v205);
    (*(void (**)(uint64_t, char *, uint64_t))(v152 + 16))(v207, v153, v154);
    swift_storeEnumTagMultiPayload();
    sub_2468AABA8(&qword_2575E4400, &qword_2575E4370, (uint64_t (*)(void))sub_2468AAC0C, MEMORY[0x24BDF5578]);
    v242 = v151;
    v243 = v149;
    swift_getOpaqueTypeConformance2();
    v155 = (uint64_t)v204;
    sub_2468D5E3C();
    sub_2468AB35C(v155, (uint64_t)v211, &qword_2575E4340);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E43F0);
    sub_2468AAAD8();
    sub_24689B0F8(&qword_2575E4420, &qword_2575E43F0);
    v156 = (uint64_t)v213;
    sub_2468D5E3C();
    sub_2468A4D24(v155, &qword_2575E4340);
    (*(void (**)(char *, uint64_t))(v152 + 8))(v153, v154);
    v157 = v216;
    v158 = (uint64_t)v215;
    v159 = v214;
    v160 = v212;
  }
  else if (v96)
  {
    v161 = sub_2468D5DAC();
    v162 = v211;
    *v211 = v161;
    v162[1] = 0;
    *((_BYTE *)v162 + 16) = 1;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E43F0);
    sub_2468AAAD8();
    sub_24689B0F8(&qword_2575E4420, &qword_2575E43F0);
    v163 = v213;
    sub_2468D5E3C();
    v157 = v216;
    v158 = (uint64_t)v215;
    v159 = v214;
    v160 = v212;
    v156 = (uint64_t)v163;
  }
  else
  {
    if (*(_BYTE *)(v86 + 32) == 1)
    {
      v97 = *(_QWORD *)(v86 + 56);
      v242 = *(_QWORD *)(v86 + 48);
      v243 = v97;
      sub_24689B160(v86, v87, (uint64_t (*)(_QWORD))type metadata accessor for MessageListView);
      v98 = swift_allocObject();
      sub_24689B268(v87, v98 + v94, (uint64_t (*)(_QWORD))type metadata accessor for MessageListView);
      v229 = (char *)sub_246897B28();
      swift_bridgeObjectRetain();
      v99 = v190;
      sub_2468D61E4();
      v100 = v175;
      v101 = v174;
      v102 = v176;
      (*(void (**)(char *, _QWORD, uint64_t))(v175 + 104))(v174, *MEMORY[0x24BEAD978], v176);
      sub_24689B0F8(&qword_2575E4430, &qword_2575E4358);
      v103 = v191;
      sub_2468D607C();
      (*(void (**)(char *, uint64_t))(v100 + 8))(v101, v102);
      v228 = *(_QWORD *)(v189 + 8);
      ((void (*)(char *, uint64_t))v228)(v99, v103);
      v104 = v180;
      sub_2468D5C50();
      KeyPath = swift_getKeyPath();
      v106 = v202;
      v107 = (uint64_t *)(v202 + *(int *)(v188 + 36));
      v227 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40C0);
      v108 = (char *)v107 + *(int *)(v227 + 28);
      v109 = v179;
      v226 = *(char **)(v179 + 16);
      v110 = v181;
      ((void (*)(char *, char *, uint64_t))v226)(v108, v104, v181);
      *v107 = KeyPath;
      v111 = v177;
      v112 = v187;
      v113 = v178;
      (*(void (**)(uint64_t, char *, uint64_t))(v177 + 16))(v106, v187, v178);
      v114 = *(void (**)(char *, uint64_t))(v109 + 8);
      v114(v104, v110);
      (*(void (**)(char *, uint64_t))(v111 + 8))(v112, v113);
      v115 = *(_QWORD *)(v233 + 72);
      v242 = *(_QWORD *)(v233 + 64);
      v243 = v115;
      v116 = v232;
      sub_24689B160(v233, v232, (uint64_t (*)(_QWORD))type metadata accessor for MessageListView);
      v117 = swift_allocObject();
      sub_24689B268(v116, v117 + v94, (uint64_t (*)(_QWORD))type metadata accessor for MessageListView);
      swift_bridgeObjectRetain();
      v118 = v190;
      sub_2468D61E4();
      sub_2468D5C50();
      v119 = swift_getKeyPath();
      v120 = v192;
      v121 = (uint64_t *)(v192 + *(int *)(v182 + 36));
      ((void (*)(char *, char *, uint64_t))v226)((char *)v121 + *(int *)(v227 + 28), v104, v110);
      *v121 = v119;
      v122 = v118;
      v123 = v118;
      v124 = v191;
      (*(void (**)(uint64_t, char *, uint64_t))(v189 + 16))(v120, v123, v191);
      v114(v104, v110);
      ((void (*)(char *, uint64_t))v228)(v122, v124);
      sub_2468AAD74();
      v125 = sub_2468D6064();
      v126 = MEMORY[0x24BDF4780];
      v127 = MEMORY[0x24BEAD938];
      v244 = MEMORY[0x24BDF4780];
      v245 = MEMORY[0x24BEAD938];
      v242 = v125;
      sub_2468AAE40();
      v128 = sub_2468D6064();
      *((_QWORD *)&v240 + 1) = v126;
      v241 = v127;
      *(_QWORD *)&v239 = v128;
      sub_2468D62F8();
      LOBYTE(v120) = sub_2468D5F08();
      v129 = sub_2468D5F14();
      v130 = sub_2468D5F2C();
      v131 = sub_2468D5F20();
      sub_2468D5F20();
      if (sub_2468D5F20() != v120)
        v131 = sub_2468D5F20();
      sub_2468D5F20();
      v132 = sub_2468D5F20();
      v133 = v211;
      v134 = (uint64_t)v204;
      if (v132 != v129)
        v131 = sub_2468D5F20();
      sub_2468D5F20();
      if (sub_2468D5F20() != v130)
        v131 = sub_2468D5F20();
      v135 = v185;
      v136 = (uint64_t)v184;
      v137 = v193;
      v138 = v186;
      (*(void (**)(char *, char *, uint64_t))(v185 + 16))(v184, v193, v186);
      v139 = v195;
      v140 = v136 + *(int *)(v195 + 36);
      *(_BYTE *)v140 = v131;
      *(_OWORD *)(v140 + 8) = 0u;
      *(_OWORD *)(v140 + 24) = 0u;
      *(_BYTE *)(v140 + 40) = 1;
      (*(void (**)(char *, uint64_t))(v135 + 8))(v137, v138);
      sub_2468A4D24(v192, &qword_2575E4350);
      sub_2468A4D24(v202, &qword_2575E4368);
      v141 = v183;
      sub_2468AB388(v136, v183, &qword_2575E4348);
      v142 = v194;
      sub_2468AB388(v141, v194, &qword_2575E4348);
      v143 = 0;
    }
    else
    {
      v143 = 1;
      v133 = v211;
      v134 = (uint64_t)v204;
      v139 = v195;
      v142 = v194;
    }
    __swift_storeEnumTagSinglePayload(v142, v143, 1, v139);
    sub_2468AB35C(v142, v207, &qword_2575E4370);
    swift_storeEnumTagMultiPayload();
    sub_2468AABA8(&qword_2575E4400, &qword_2575E4370, (uint64_t (*)(void))sub_2468AAC0C, MEMORY[0x24BDF5578]);
    sub_24689B12C(&qword_2575E4418, (void (*)(uint64_t))MEMORY[0x24BEADE00]);
    v242 = v208;
    v243 = v164;
    swift_getOpaqueTypeConformance2();
    sub_2468D5E3C();
    sub_2468AB35C(v134, (uint64_t)v133, &qword_2575E4340);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E43F0);
    sub_2468AAAD8();
    sub_24689B0F8(&qword_2575E4420, &qword_2575E43F0);
    v156 = (uint64_t)v213;
    sub_2468D5E3C();
    sub_2468A4D24(v134, &qword_2575E4340);
    sub_2468A4D24(v142, &qword_2575E4370);
    v158 = (uint64_t)v215;
    v159 = v214;
    v160 = v212;
    v157 = v216;
  }
  v165 = v236;
  sub_2468AB35C(v235, v236, &qword_2575E43A0);
  v166 = v230;
  sub_2468AB35C(v237, v230, &qword_2575E4388);
  v167 = v231;
  v168 = *(void (**)(char *, char *, uint64_t))(v231 + 16);
  v169 = v234;
  v168(v160, v234, v159);
  sub_2468AB35C(v156, v158, &qword_2575E4378);
  sub_2468AB35C(v165, v157, &qword_2575E43A0);
  v170 = v157;
  v171 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2575E4428);
  sub_2468AB35C(v166, v170 + v171[12], &qword_2575E4388);
  v168((char *)(v170 + v171[16]), v160, v159);
  sub_2468AB35C(v158, v170 + v171[20], &qword_2575E4378);
  sub_2468A4D24(v156, &qword_2575E4378);
  v172 = *(void (**)(char *, uint64_t))(v167 + 8);
  v172(v169, v159);
  sub_2468A4D24(v237, &qword_2575E4388);
  sub_2468A4D24(v235, &qword_2575E43A0);
  sub_2468A4D24(v158, &qword_2575E4378);
  v172(v160, v159);
  sub_2468A4D24(v166, &qword_2575E4388);
  sub_2468A4D24(v236, &qword_2575E43A0);
}

uint64_t sub_2468A9258()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2468A9268(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v2 = type metadata accessor for MessageListView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = swift_bridgeObjectRetain();
  sub_2468AAEDC(v5);
  v7 = v6;
  swift_bridgeObjectRelease();
  v12[1] = v7;
  swift_getKeyPath();
  sub_24689B160(a1, (uint64_t)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for MessageListView);
  v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v9 = swift_allocObject();
  sub_24689B268((uint64_t)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8, (uint64_t (*)(_QWORD))type metadata accessor for MessageListView);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_2468AB2E0;
  *(_QWORD *)(v10 + 24) = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4448);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E43C0);
  sub_24689B0F8(&qword_2575E4450, &qword_2575E4448);
  sub_2468AA9D0();
  return sub_2468D6244();
}

void sub_2468A93F8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  unsigned __int8 v36;
  char v37;
  char v38;
  char v39;
  char *v40;
  uint64_t v41;
  char *v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  unsigned __int8 v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unsigned __int8 v55;
  char v56;
  unsigned __int8 v57;
  char v58;
  char v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
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

  v75 = a4;
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4460);
  MEMORY[0x24BDAC7A8](v72);
  v74 = (uint64_t)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E43D0);
  MEMORY[0x24BDAC7A8](v73);
  v70 = (uint64_t)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2468D6238();
  v66 = *(_QWORD *)(v9 - 8);
  v67 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v65 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4388);
  v11 = MEMORY[0x24BDAC7A8](v64);
  v68 = (uint64_t)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v63 = (char *)&v62 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v69 = (uint64_t)&v62 - v15;
  v16 = type metadata accessor for MessageView();
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v62 - v20;
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E43E0);
  v22 = MEMORY[0x24BDAC7A8](v71);
  v24 = (char *)&v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v62 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (char *)&v62 - v29;
  v31 = MEMORY[0x24BDAC7A8](v28);
  v33 = (char *)&v62 - v32;
  MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)&v62 - v34;
  if (*(_QWORD *)(*(_QWORD *)(a3 + 24) + 16) - 1 <= a1)
  {
    sub_2468A9AEC(a2, (uint64_t)v19);
    v55 = sub_2468D5F14();
    v56 = sub_2468D5F2C();
    v57 = sub_2468D5F08();
    v58 = sub_2468D5F20();
    sub_2468D5F20();
    if (sub_2468D5F20() != v55)
      v58 = sub_2468D5F20();
    sub_2468D5F20();
    v59 = sub_2468D5F20();
    v60 = v71;
    if (v59 != v56)
      v58 = sub_2468D5F20();
    sub_2468D5F20();
    if (sub_2468D5F20() != v57)
      v58 = sub_2468D5F20();
    sub_24689B160((uint64_t)v19, (uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for MessageView);
    v61 = &v24[*(int *)(v60 + 36)];
    *v61 = v58;
    *(_OWORD *)(v61 + 8) = 0u;
    *(_OWORD *)(v61 + 24) = 0u;
    v61[40] = 1;
    sub_2468A4F64((uint64_t)v19, (uint64_t (*)(_QWORD))type metadata accessor for MessageView);
    sub_2468AB388((uint64_t)v24, (uint64_t)v27, &qword_2575E43E0);
    sub_2468AB35C((uint64_t)v27, v74, &qword_2575E43E0);
    swift_storeEnumTagMultiPayload();
    sub_24689B0F8(&qword_2575E43C8, &qword_2575E43D0);
    sub_2468AAA54();
    sub_2468D5E3C();
    v35 = v27;
  }
  else
  {
    sub_2468A9AEC(a2, (uint64_t)v21);
    v36 = sub_2468D5F14();
    v37 = sub_2468D5F2C();
    v38 = sub_2468D5F20();
    sub_2468D5F20();
    if (sub_2468D5F20() != v36)
      v38 = sub_2468D5F20();
    sub_2468D5F20();
    v39 = sub_2468D5F20();
    v40 = v65;
    if (v39 != v37)
      v38 = sub_2468D5F20();
    v41 = v71;
    sub_24689B160((uint64_t)v21, (uint64_t)v33, (uint64_t (*)(_QWORD))type metadata accessor for MessageView);
    v42 = &v33[*(int *)(v41 + 36)];
    *v42 = v38;
    *(_OWORD *)(v42 + 8) = 0u;
    *(_OWORD *)(v42 + 24) = 0u;
    v42[40] = 1;
    sub_2468A4F64((uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for MessageView);
    sub_2468AB388((uint64_t)v33, (uint64_t)v35, &qword_2575E43E0);
    sub_2468D622C();
    v43 = sub_2468D5F14();
    v44 = sub_2468D5EFC();
    v45 = sub_2468D5F08();
    v46 = sub_2468D5F20();
    sub_2468D5F20();
    if (sub_2468D5F20() != v43)
      v46 = sub_2468D5F20();
    sub_2468D5F20();
    if (sub_2468D5F20() != v44)
      v46 = sub_2468D5F20();
    sub_2468D5F20();
    if (sub_2468D5F20() != v45)
      v46 = sub_2468D5F20();
    v48 = v66;
    v47 = v67;
    v49 = (uint64_t)v63;
    (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v63, v40, v67);
    v50 = v49 + *(int *)(v64 + 36);
    *(_BYTE *)v50 = v46;
    *(_OWORD *)(v50 + 8) = 0u;
    *(_OWORD *)(v50 + 24) = 0u;
    *(_BYTE *)(v50 + 40) = 1;
    (*(void (**)(char *, uint64_t))(v48 + 8))(v40, v47);
    v51 = v69;
    sub_2468AB388(v49, v69, &qword_2575E4388);
    sub_2468AB35C((uint64_t)v35, (uint64_t)v30, &qword_2575E43E0);
    v52 = v68;
    sub_2468AB35C(v51, v68, &qword_2575E4388);
    v53 = v70;
    sub_2468AB35C((uint64_t)v30, v70, &qword_2575E43E0);
    v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4468);
    sub_2468AB35C(v52, v53 + *(int *)(v54 + 48), &qword_2575E4388);
    sub_2468A4D24(v52, &qword_2575E4388);
    sub_2468A4D24((uint64_t)v30, &qword_2575E43E0);
    sub_2468AB35C(v53, v74, &qword_2575E43D0);
    swift_storeEnumTagMultiPayload();
    sub_24689B0F8(&qword_2575E43C8, &qword_2575E43D0);
    sub_2468AAA54();
    sub_2468D5E3C();
    sub_2468A4D24(v53, &qword_2575E43D0);
    sub_2468A4D24(v51, &qword_2575E4388);
  }
  sub_2468A4D24((uint64_t)v35, &qword_2575E43E0);
}

void sub_2468A9AEC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD);
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

  v18 = a2;
  v4 = type metadata accessor for WidgetMessage();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v2[2];
  sub_24689B160(a1, (uint64_t)v6, v8);
  v9 = v2[5];
  v10 = *(unsigned __int8 *)(a1 + *(int *)(v4 + 36));
  v11 = v2[24];
  v12 = v2[25];
  v13 = v2[26];
  v14 = v2[27];
  v16 = v2[28];
  v15 = v2[29];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2468AE9E0(v7, (uint64_t)v6, v9, v10, v11, v12, v13, v14, v16, v15, v17, v18, v19, v20, v21, v22, v23, v24, v25,
    v26,
    v27,
    v28);
}

uint64_t sub_2468A9BE4(char *a1, uint64_t (*a2)(uint64_t, char *))
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4458);
  return a2(v4, &a1[*(int *)(v5 + 48)]);
}

uint64_t sub_2468A9C40(id *a1)
{
  id v1;
  uint64_t result;

  if (*a1)
  {
    v1 = *a1;
    sub_2468D6448();
    sub_2468D6424();

    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_2468D6430();
    sub_24689B12C(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    result = sub_2468D5C80();
    __break(1u);
  }
  return result;
}

void sub_2468A9D00(id *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = sub_2468D5710();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_2();
  if (*a1)
  {
    v5 = *a1;
    sub_2468D5704();
    sub_2468D6418();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
    OUTLINED_FUNCTION_12_1();
  }
  else
  {
    sub_2468D6430();
    sub_24689B12C(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    sub_2468D5C80();
    __break(1u);
  }
}

char *initializeBufferWithCopyOfBuffer for MessageListView(char *a1, char **a2, uint64_t a3)
{
  int v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v21;
  _QWORD *v22;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    *((_QWORD *)a1 + 3) = a2[3];
    *((_WORD *)a1 + 16) = *((_WORD *)a2 + 16);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    v6 = a2[8];
    *((_QWORD *)a1 + 7) = a2[7];
    *((_QWORD *)a1 + 8) = v6;
    v7 = a2[10];
    *((_QWORD *)a1 + 9) = a2[9];
    *((_QWORD *)a1 + 10) = v7;
    v8 = a2[12];
    *((_QWORD *)a1 + 11) = a2[11];
    *((_QWORD *)a1 + 12) = v8;
    v9 = a2[14];
    *((_QWORD *)a1 + 13) = a2[13];
    *((_QWORD *)a1 + 14) = v9;
    v10 = a2[16];
    *((_QWORD *)a1 + 15) = a2[15];
    *((_QWORD *)a1 + 16) = v10;
    v11 = a2[18];
    *((_QWORD *)a1 + 17) = a2[17];
    *((_QWORD *)a1 + 18) = v11;
    v12 = a2[20];
    *((_QWORD *)a1 + 19) = a2[19];
    *((_QWORD *)a1 + 20) = v12;
    v13 = a2[22];
    *((_QWORD *)a1 + 21) = a2[21];
    *((_QWORD *)a1 + 22) = v13;
    v14 = a2[24];
    *((_QWORD *)a1 + 23) = a2[23];
    *((_QWORD *)a1 + 24) = v14;
    v15 = a2[26];
    *((_QWORD *)a1 + 25) = a2[25];
    *((_QWORD *)a1 + 26) = v15;
    v16 = a2[28];
    *((_QWORD *)a1 + 27) = a2[27];
    *((_QWORD *)a1 + 28) = v16;
    v17 = *(int *)(a3 + 88);
    v21 = &a1[v17];
    v22 = (char **)((char *)a2 + v17);
    *((_QWORD *)a1 + 29) = a2[29];
    v18 = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = sub_2468D5B78();
      (*(void (**)(char *, _QWORD *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v21, v22, v19);
    }
    else
    {
      *(_QWORD *)v21 = *v22;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for MessageListView(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = (char *)a1 + *(int *)(a2 + 88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = sub_2468D5B78();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for MessageListView(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  id v17;
  uint64_t v18;
  _QWORD *v20;
  _QWORD *v21;

  v4 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v5;
  v6 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v6;
  v7 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v7;
  v8 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v8;
  v9 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v9;
  v10 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v10;
  v11 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v11;
  v12 = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = v12;
  v13 = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = v13;
  v14 = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 208) = v14;
  v15 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = v15;
  v16 = *(int *)(a3 + 88);
  v21 = (_QWORD *)(a1 + v16);
  v20 = (_QWORD *)(a2 + v16);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  v17 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = sub_2468D5B78();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v21, v20, v18);
  }
  else
  {
    *v21 = *v20;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for MessageListView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v9 = *(int *)(a3 + 88);
    v10 = (_QWORD *)(a1 + v9);
    v11 = (_QWORD *)(a2 + v9);
    sub_2468A4D24(a1 + v9, &qword_2575E3850);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_2468D5B78();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for MessageListView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  v8 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v8;
  v9 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v9;
  v10 = *(_OWORD *)(a2 + 224);
  v11 = *(int *)(a3 + 88);
  v12 = (void *)(a1 + v11);
  v13 = (const void *)(a2 + v11);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 224) = v10;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = sub_2468D5B78();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for MessageListView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
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
  void *v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v13;
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v14;
  swift_bridgeObjectRelease();
  v15 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v15;
  swift_bridgeObjectRelease();
  v16 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v16;
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = v17;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v18 = *(int *)(a3 + 88);
    v19 = (void *)(a1 + v18);
    v20 = (const void *)(a2 + v18);
    sub_2468A4D24(a1 + v18, &qword_2575E3850);
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v22 = sub_2468D5B78();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageListView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2468AA7D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FB0);
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 88), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for MessageListView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_2468AA85C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 24) = (a2 - 1);
    OUTLINED_FUNCTION_12_1();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FB0);
    OUTLINED_FUNCTION_10_2(a1 + *(int *)(a4 + 88), a2, a2, v7);
  }
}

void sub_2468AA8BC()
{
  unint64_t v0;

  sub_2468A4A50();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_2468AA978()
{
  sub_24689B0F8(&qword_2575E4318, &qword_2575E4320);
}

uint64_t sub_2468AA9A8()
{
  uint64_t v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_9_3();
  v1 = OUTLINED_FUNCTION_5_3(v0);
  return sub_2468A9268(v1);
}

unint64_t sub_2468AA9D0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2575E43B8;
  if (!qword_2575E43B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E43C0);
    sub_24689B0F8(&qword_2575E43C8, &qword_2575E43D0);
    v3[0] = v2;
    v3[1] = sub_2468AAA54();
    result = MEMORY[0x249562024](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2575E43B8);
  }
  return result;
}

unint64_t sub_2468AAA54()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2575E43D8;
  if (!qword_2575E43D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E43E0);
    sub_24689B12C(&qword_2575E43E8, (void (*)(uint64_t))type metadata accessor for MessageView);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2575E43D8);
  }
  return result;
}

unint64_t sub_2468AAAD8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];

  result = qword_2575E43F8;
  if (!qword_2575E43F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4340);
    v2 = sub_2468AABA8(&qword_2575E4400, &qword_2575E4370, (uint64_t (*)(void))sub_2468AAC0C, MEMORY[0x24BDF5578]);
    v3 = sub_2468D6334();
    sub_24689B12C(&qword_2575E4418, (void (*)(uint64_t))MEMORY[0x24BEADE00]);
    v5[2] = v3;
    v5[3] = v4;
    v5[0] = v2;
    v5[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x249562024](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2575E43F8);
  }
  return result;
}

uint64_t sub_2468AABA8(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x249562024](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2468AAC0C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2575E4408;
  if (!qword_2575E4408)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4348);
    sub_24689B12C(&qword_2575E4410, (void (*)(uint64_t))MEMORY[0x24BEADCE0]);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2575E4408);
  }
  return result;
}

uint64_t sub_2468AAC9C()
{
  uint64_t v0;
  id *v1;

  v0 = OUTLINED_FUNCTION_9_3();
  v1 = (id *)OUTLINED_FUNCTION_5_3(v0);
  return sub_2468A9C40(v1);
}

void sub_2468AACB4()
{
  sub_2468D5D10();
  OUTLINED_FUNCTION_3();
}

void sub_2468AACD0()
{
  sub_2468D5D10();
  OUTLINED_FUNCTION_3();
}

void sub_2468AACEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = sub_2468D5C5C();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v1, a1);
  sub_2468D5D1C();
  OUTLINED_FUNCTION_12_1();
}

void sub_2468AAD58()
{
  uint64_t v0;
  id *v1;

  v0 = OUTLINED_FUNCTION_9_3();
  v1 = (id *)OUTLINED_FUNCTION_5_3(v0);
  sub_2468A9D00(v1);
}

unint64_t sub_2468AAD74()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t OpaqueTypeConformance2;
  uint64_t v5;
  _QWORD v6[4];

  result = qword_2575E4438;
  if (!qword_2575E4438)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4368);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4358);
    sub_24689B0F8(&qword_2575E4430, &qword_2575E4358);
    v6[2] = v2;
    v6[3] = v3;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_24689B0F8(&qword_2575E40E0, &qword_2575E40C0);
    v6[0] = OpaqueTypeConformance2;
    v6[1] = v5;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v6);
    atomic_store(result, (unint64_t *)&qword_2575E4438);
  }
  return result;
}

unint64_t sub_2468AAE40()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2575E4440;
  if (!qword_2575E4440)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4350);
    sub_24689B0F8(&qword_2575E4430, &qword_2575E4358);
    v3 = v2;
    sub_24689B0F8(&qword_2575E40E0, &qword_2575E40C0);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2575E4440);
  }
  return result;
}

void sub_2468AAEDC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  size_t v28;
  int64_t v29;
  uint64_t v31;
  char *v32;
  unint64_t v33;
  uint64_t v34;
  BOOL v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD v40[2];
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;

  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4458);
  v2 = MEMORY[0x24BDAC7A8](v48);
  v45 = (char *)v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v46 = (_QWORD *)((char *)v40 - v5);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v40 - v6;
  v47 = v8;
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v44 = v10;
  v40[0] = a1;
  if (v10)
  {
    v41 = (v9 + 32) & ~v9;
    v12 = MEMORY[0x24BEE4AF8] + v41;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)(type metadata accessor for WidgetMessage() - 8);
    v16 = a1 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    v42 = *(_QWORD *)(v15 + 72);
    v43 = v7;
    v40[1] = v9 | 7;
    v17 = v11;
    while (1)
    {
      v18 = v48;
      v19 = (uint64_t)&v45[*(int *)(v48 + 48)];
      sub_24689B160(v16, v19, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
      v20 = *(int *)(v18 + 48);
      v21 = (uint64_t)v46;
      v22 = (uint64_t)v46 + v20;
      *v46 = v13;
      sub_24689B268(v19, v22, (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
      sub_2468AB388(v21, (uint64_t)v7, &qword_2575E4458);
      if (v14)
      {
        v11 = v17;
      }
      else
      {
        v23 = v17[3];
        if ((uint64_t)((v23 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_34;
        v24 = v23 & 0xFFFFFFFFFFFFFFFELL;
        if (v24 <= 1)
          v25 = 1;
        else
          v25 = v24;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4470);
        v26 = *(_QWORD *)(v47 + 72);
        v27 = v41;
        v11 = (_QWORD *)swift_allocObject();
        v28 = _swift_stdlib_malloc_size(v11);
        if (!v26)
          goto LABEL_35;
        v29 = v28 - v27;
        if (v28 - v27 == 0x8000000000000000 && v26 == -1)
          goto LABEL_36;
        v31 = v29 / v26;
        v11[2] = v25;
        v11[3] = 2 * (v29 / v26);
        v32 = (char *)v11 + v27;
        v33 = v17[3];
        v34 = (v33 >> 1) * v26;
        if (v17[2])
        {
          if (v11 < v17 || v32 >= (char *)v17 + v41 + v34)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v11 != v17)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v17[2] = 0;
        }
        v12 = (uint64_t)&v32[v34];
        v14 = (v31 & 0x7FFFFFFFFFFFFFFFLL) - (v33 >> 1);
        swift_release();
      }
      v36 = __OFSUB__(v14--, 1);
      if (v36)
        break;
      ++v13;
      v7 = v43;
      sub_2468AB388((uint64_t)v43, v12, &qword_2575E4458);
      v12 += *(_QWORD *)(v47 + 72);
      v16 += v42;
      v17 = v11;
      if (v44 == v13)
        goto LABEL_29;
    }
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v14 = 0;
LABEL_29:
  swift_bridgeObjectRelease();
  v37 = v11[3];
  if (v37 >= 2)
  {
    v38 = v37 >> 1;
    v36 = __OFSUB__(v38, v14);
    v39 = v38 - v14;
    if (v36)
    {
LABEL_37:
      __break(1u);
      return;
    }
    v11[2] = v39;
  }
}

uint64_t objectdestroyTm_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_9_3() - 8) + 80);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_2468D5B78();
    OUTLINED_FUNCTION_1_0(v2);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

void sub_2468AB2E0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_9_3() - 8) + 80);
  sub_2468A93F8(a1, a2, v3 + ((v7 + 16) & ~v7), a3);
}

uint64_t sub_2468AB330()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2468AB354(char *a1)
{
  uint64_t v1;

  return sub_2468A9BE4(a1, *(uint64_t (**)(uint64_t, char *))(v1 + 16));
}

void sub_2468AB35C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_14_1(a1, a2, a3);
  OUTLINED_FUNCTION_6_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_3();
}

void sub_2468AB388(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_14_1(a1, a2, a3);
  OUTLINED_FUNCTION_6_1(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_3();
}

uint64_t OUTLINED_FUNCTION_0_5(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_1_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2468A71D8(v1, a1);
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return type metadata accessor for MessageListView();
}

uint64_t OUTLINED_FUNCTION_10_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_14_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

void OUTLINED_FUNCTION_17_0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_2468A4F64(v2, a2);
}

void OUTLINED_FUNCTION_18_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_2468A4D24(v2, a2);
}

uint64_t destroy for MessageStateView(uint64_t a1)
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for MessageStateView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v5 = *(void **)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  v6 = v5;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for MessageStateView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  v4 = *(void **)(a1 + 16);
  v5 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  v6 = v5;

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  return a1;
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

uint64_t assignWithTake for MessageStateView(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageStateView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 48))
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

uint64_t storeEnumTagSinglePayload for MessageStateView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageStateView()
{
  return &type metadata for MessageStateView;
}

uint64_t sub_2468AB670()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2468AB680(uint64_t a1@<X8>)
{
  __int128 *v1;
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
  int v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  _OWORD *v67;
  _BOOL8 v68;
  uint64_t KeyPath;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  _OWORD *v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t, _QWORD);
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t, _QWORD);
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void (*v106)(char *);
  uint64_t v107;
  uint64_t v108;
  void (*v109)(uint64_t);
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
  _BYTE v122[8];
  _QWORD v123[2];
  _BYTE v124[8];
  __int128 v125;
  uint64_t v126;
  uint64_t v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _BYTE v131[8];
  _BYTE v132[8];
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;

  v120 = a1;
  v2 = sub_2468D6358();
  OUTLINED_FUNCTION_8_3(v2, (uint64_t)v124);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3_5(v4);
  v5 = sub_2468D6370();
  OUTLINED_FUNCTION_8_3(v5, (uint64_t)&v136);
  v108 = v6;
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_4(v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4478);
  v10 = OUTLINED_FUNCTION_1_2(v9, (uint64_t)&v135);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_4(v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4480);
  v13 = OUTLINED_FUNCTION_1_2(v12, (uint64_t)&v133);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_4(v14);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4488);
  v16 = OUTLINED_FUNCTION_1_2(v15, (uint64_t)&v134);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3_5(v17);
  v18 = sub_2468D6304();
  OUTLINED_FUNCTION_8_3(v18, (uint64_t)&v129 + 8);
  v115 = v19;
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_4(v21);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4490);
  v23 = OUTLINED_FUNCTION_1_2(v22, (uint64_t)&v125);
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_4(v24);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4498);
  v26 = OUTLINED_FUNCTION_1_2(v25, (uint64_t)&v127);
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3_5(v27);
  v28 = sub_2468D5C5C();
  OUTLINED_FUNCTION_8_3(v28, (uint64_t)&v125 + 8);
  v105 = v29;
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3_5(v31);
  v32 = sub_2468D62C8();
  OUTLINED_FUNCTION_8_3(v32, (uint64_t)v122);
  v103 = v33;
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_0();
  v37 = v36 - v35;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4358);
  OUTLINED_FUNCTION_8_3(v38, (uint64_t)v132);
  v117 = v39;
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_4(v41);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4360);
  OUTLINED_FUNCTION_8_3(v42, (uint64_t)v123);
  v104 = v43;
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v44);
  OUTLINED_FUNCTION_0();
  v47 = v46 - v45;
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E44A0);
  v49 = OUTLINED_FUNCTION_1_2(v48, (uint64_t)&v120);
  MEMORY[0x24BDAC7A8](v49);
  OUTLINED_FUNCTION_0();
  v52 = v51 - v50;
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E44A8);
  v54 = OUTLINED_FUNCTION_1_2(v53, (uint64_t)v131);
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3_5(v55);
  v56 = sub_2468D5914();
  v57 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  OUTLINED_FUNCTION_0();
  v60 = v59 - v58;
  v130 = *v1;
  v61 = *((_QWORD *)&v130 + 1);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2468D5A88();
  swift_release();
  swift_release();
  sub_2468AC534((uint64_t)&v130);
  v62 = (*(uint64_t (**)(uint64_t, uint64_t))(v57 + 88))(v60, v56);
  if (v62 == *MEMORY[0x24BE99BD8])
  {
    v63 = (uint64_t *)(v61 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_sendLabel);
    OUTLINED_FUNCTION_4_6();
    v64 = *v63;
    v65 = v63[1];
    *(_QWORD *)&v125 = v64;
    *((_QWORD *)&v125 + 1) = v65;
    v66 = v1[1];
    v128 = v1[2];
    v129 = v66;
    v67 = (_OWORD *)OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_6_6(v67);
    OUTLINED_FUNCTION_19();
    sub_24689D940((id *)&v129);
    sub_2468AC61C((uint64_t)&v128);
    sub_246897B28();
    OUTLINED_FUNCTION_17_1();
    sub_2468D61E4();
    (*(void (**)(uint64_t, _QWORD))(v103 + 104))(v37, *MEMORY[0x24BEAD978]);
    sub_2468AC788(&qword_2575E4430, &qword_2575E4358);
    sub_2468D607C();
    (*(void (**)(uint64_t))(v103 + 8))(v37);
    v109 = *(void (**)(uint64_t))(v117 + 8);
    v109(v56);
    v68 = sub_2468AC2D8();
    KeyPath = swift_getKeyPath();
    v70 = OUTLINED_FUNCTION_13_1();
    *(_BYTE *)(v70 + 16) = v68;
    OUTLINED_FUNCTION_22_0(v52, v47, *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v104 + 16));
    v71 = (uint64_t *)(v52 + *(int *)(v102 + 36));
    *v71 = KeyPath;
    v71[1] = (uint64_t)sub_2468AC650;
    v71[2] = v70;
    (*(void (**)(uint64_t, _BOOL8))(v104 + 8))(v47, v68);
    sub_2468D5C50();
    v72 = swift_getKeyPath();
    v73 = (uint64_t *)(v112 + *(int *)(v118 + 36));
    v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40C0);
    v106 = *(void (**)(char *))(v105 + 16);
    v106((char *)v73 + *(int *)(v107 + 28));
    *v73 = v72;
    sub_246897AE8(v52, v112, &qword_2575E44A0);
    OUTLINED_FUNCTION_23_0();
    sub_246897AB0(v52, &qword_2575E44A0);
    v74 = (uint64_t *)(v61 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_cancelLabel);
    OUTLINED_FUNCTION_4_6();
    v75 = *v74;
    v76 = v74[1];
    *(_QWORD *)&v125 = v75;
    *((_QWORD *)&v125 + 1) = v76;
    v77 = (_OWORD *)OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_6_6(v77);
    sub_24689D940((id *)&v129);
    sub_2468AC61C((uint64_t)&v128);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_17_1();
    sub_2468D61E4();
    v125 = v128;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40E8);
    sub_2468D61B4();
    v78 = v121;
    v79 = swift_getKeyPath();
    v80 = OUTLINED_FUNCTION_13_1();
    *(_BYTE *)(v80 + 16) = v78;
    OUTLINED_FUNCTION_22_0(v111, v56, *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v117 + 16));
    v81 = (uint64_t *)(v111 + *(int *)(v110 + 36));
    *v81 = v79;
    v81[1] = (uint64_t)sub_2468AC954;
    v81[2] = v80;
    ((void (*)(uint64_t, uint64_t))v109)(v56, v105);
    sub_2468D5C50();
    v82 = swift_getKeyPath();
    v83 = (uint64_t *)(v114 + *(int *)(v113 + 36));
    v106((char *)v83 + *(int *)(v107 + 28));
    *v83 = v82;
    sub_246897AE8(v111, v114, &qword_2575E4490);
    OUTLINED_FUNCTION_23_0();
    sub_246897AB0(v111, &qword_2575E4490);
    sub_2468AC7B4(&qword_2575E44C0, &qword_2575E44A8);
    v84 = sub_2468D6064();
    v85 = MEMORY[0x24BDF4780];
    v86 = MEMORY[0x24BEAD938];
    v126 = MEMORY[0x24BDF4780];
    v127 = MEMORY[0x24BEAD938];
    *(_QWORD *)&v125 = v84;
    sub_2468AC7B4(&qword_2575E44E0, &qword_2575E4498);
    v87 = sub_2468D6064();
    v123[0] = v85;
    v123[1] = v86;
    v121 = v87;
    sub_2468D62F8();
    (*(void (**)())(v115 + 16))();
    OUTLINED_FUNCTION_15_0();
    sub_24689B12C(&qword_2575E4410, (void (*)(uint64_t))MEMORY[0x24BEADCE0]);
    sub_24689B12C(&qword_2575E44B8, (void (*)(uint64_t))MEMORY[0x24BEADFC0]);
    sub_2468D5E3C();
    sub_246897AE8(v116, v119, &qword_2575E4488);
    OUTLINED_FUNCTION_15_0();
    sub_2468AC55C();
    sub_2468D5E3C();
    sub_246897AB0(v116, &qword_2575E4488);
    (*(void (**)())(v115 + 8))();
    sub_246897AB0(v114, &qword_2575E4498);
    sub_246897AB0(v112, &qword_2575E44A8);
  }
  else if (v62 == *MEMORY[0x24BE99BE8] || v62 == *MEMORY[0x24BE99BD0])
  {
    v89 = (uint64_t *)(v61 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_sentLabel);
    OUTLINED_FUNCTION_4_6();
    v90 = *v89;
    v91 = v89[1];
    v126 = MEMORY[0x24BEE0D00];
    v127 = MEMORY[0x24BEAE5B8];
    *(_QWORD *)&v125 = v90;
    *((_QWORD *)&v125 + 1) = v91;
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_16_0(*(_QWORD *)(v92 - 256), v93, v94);
    OUTLINED_FUNCTION_19();
    sub_2468D6364();
    (*(void (**)())(v108 + 16))();
    swift_storeEnumTagMultiPayload();
    sub_24689B12C(&qword_2575E4410, (void (*)(uint64_t))MEMORY[0x24BEADCE0]);
    sub_24689B12C(&qword_2575E44B8, (void (*)(uint64_t))MEMORY[0x24BEADFC0]);
    OUTLINED_FUNCTION_17_1();
    sub_2468D5E3C();
    sub_246897AE8(v56, v119, &qword_2575E4488);
    swift_storeEnumTagMultiPayload();
    sub_2468AC55C();
    sub_2468D5E3C();
    sub_246897AB0(v56, &qword_2575E4488);
    (*(void (**)())(v108 + 8))();
  }
  else if (v62 == *MEMORY[0x24BE99BF8] || v62 == *MEMORY[0x24BE99BE0])
  {
    v96 = (uint64_t *)(v61 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_cancelledLabel);
    OUTLINED_FUNCTION_4_6();
    v97 = *v96;
    v98 = v96[1];
    v126 = MEMORY[0x24BEE0D00];
    v127 = MEMORY[0x24BEAE5B8];
    *(_QWORD *)&v125 = v97;
    *((_QWORD *)&v125 + 1) = v98;
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_16_0(*(_QWORD *)(v99 - 256), v100, v101);
    OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_17_1();
    sub_2468D6364();
    (*(void (**)(uint64_t, uint64_t))(v108 + 16))(v119, v56);
    swift_storeEnumTagMultiPayload();
    sub_2468AC55C();
    sub_24689B12C(&qword_2575E44B8, (void (*)(uint64_t))MEMORY[0x24BEADFC0]);
    sub_2468D5E3C();
    (*(void (**)(uint64_t))(v108 + 8))(v56);
  }
  else
  {
    sub_2468D6778();
    __break(1u);
  }
}

BOOL sub_2468AC2D8()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char v17;
  __int128 v18;

  v18 = v0[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40E8);
  sub_2468D61B4();
  if ((v17 & 1) != 0)
    return 1;
  v18 = *v0;
  OUTLINED_FUNCTION_10_3();
  v2 = SiriMailModel.to.getter();
  OUTLINED_FUNCTION_12_2(v2, v3);
  OUTLINED_FUNCTION_11_2();
  if (!v1)
  {
    OUTLINED_FUNCTION_10_3();
    v4 = SiriMailModel.cc.getter();
    OUTLINED_FUNCTION_12_2(v4, v5);
    OUTLINED_FUNCTION_11_2();
    OUTLINED_FUNCTION_10_3();
    v6 = SiriMailModel.bcc.getter();
    OUTLINED_FUNCTION_12_2(v6, v7);
    OUTLINED_FUNCTION_11_2();
    return 1;
  }
  OUTLINED_FUNCTION_10_3();
  v8 = SiriMailModel.subject.getter();
  v10 = v9;
  sub_2468AC534((uint64_t)&v18);
  swift_bridgeObjectRelease();
  v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0)
    v11 = v8 & 0xFFFFFFFFFFFFLL;
  if (!v11)
    return 1;
  OUTLINED_FUNCTION_10_3();
  v12 = SiriMailModel.body.getter();
  v14 = v13;
  sub_2468AC534((uint64_t)&v18);
  swift_bridgeObjectRelease();
  v15 = HIBYTE(v14) & 0xF;
  if ((v14 & 0x2000000000000000) == 0)
    v15 = v12 & 0xFFFFFFFFFFFFLL;
  return v15 == 0;
}

uint64_t sub_2468AC3E8(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  id v4;
  void *v5;
  id v6;
  uint64_t result;

  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    v4 = v2;
    v5 = (void *)a2();
    v6 = objc_msgSend(v5, sel_identifier);

    sub_2468D6484();
    sub_2468D6448();
    sub_2468D6424();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40E8);
    return sub_2468D61C0();
  }
  else
  {
    sub_2468D6430();
    sub_24689B12C(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    result = sub_2468D5C80();
    __break(1u);
  }
  return result;
}

uint64_t sub_2468AC534(uint64_t a1)
{
  swift_release();
  return a1;
}

unint64_t sub_2468AC55C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2575E44B0;
  if (!qword_2575E44B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4488);
    sub_24689B12C(&qword_2575E4410, (void (*)(uint64_t))MEMORY[0x24BEADCE0]);
    v3 = v2;
    sub_24689B12C(&qword_2575E44B8, (void (*)(uint64_t))MEMORY[0x24BEADFC0]);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x249562024](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2575E44B0);
  }
  return result;
}

uint64_t sub_2468AC5FC()
{
  uint64_t v0;

  return sub_2468AC3E8(v0 + 16, MEMORY[0x24BE97288]);
}

uint64_t sub_2468AC61C(uint64_t a1)
{
  swift_retain();
  return a1;
}

_BYTE *sub_2468AC650(_BYTE *a1)
{
  uint64_t v1;

  return sub_2468C0F60(a1, *(_BYTE *)(v1 + 16));
}

uint64_t objectdestroyTm_3()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2468AC698()
{
  uint64_t v0;

  return sub_2468AC3E8(v0 + 16, MEMORY[0x24BE97278]);
}

unint64_t sub_2468AC6BC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t OpaqueTypeConformance2;
  uint64_t v5;
  _QWORD v6[4];

  result = qword_2575E44C8;
  if (!qword_2575E44C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E44A0);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4358);
    sub_2468AC788(&qword_2575E4430, &qword_2575E4358);
    v6[2] = v2;
    v6[3] = v3;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_2468AC788(&qword_2575E44D0, &qword_2575E44D8);
    v6[0] = OpaqueTypeConformance2;
    v6[1] = v5;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v6);
    atomic_store(result, (unint64_t *)&qword_2575E44C8);
  }
  return result;
}

void sub_2468AC788(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    OUTLINED_FUNCTION_20(0, a2);
    OUTLINED_FUNCTION_7_0();
  }
  OUTLINED_FUNCTION_3();
}

uint64_t sub_2468AC7B4(unint64_t *a1, uint64_t *a2)
{
  uint64_t (*v2)(void);
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v5 = OUTLINED_FUNCTION_20(0, a2);
    v6 = v2();
    sub_2468AC788(&qword_2575E40E0, &qword_2575E40C0);
    v8[0] = v6;
    v8[1] = v7;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v5, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2468AC830()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2575E44E8;
  if (!qword_2575E44E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4490);
    sub_2468AC788(&qword_2575E4430, &qword_2575E4358);
    v3 = v2;
    sub_2468AC788(&qword_2575E44D0, &qword_2575E44D8);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2575E44E8);
  }
  return result;
}

unint64_t sub_2468AC8D0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2575E44F0;
  if (!qword_2575E44F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E44F8);
    v2 = sub_2468AC55C();
    sub_24689B12C(&qword_2575E44B8, (void (*)(uint64_t))MEMORY[0x24BEADFC0]);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x249562024](MEMORY[0x24BDEF3E0], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2575E44F0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_2@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_5@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_6_6(_OWORD *a1)
{
  _OWORD *v1;
  uint64_t v2;
  __int128 v3;

  v3 = v1[1];
  a1[1] = *v1;
  a1[2] = v3;
  a1[3] = v1[2];
  return sub_2468AC61C(v2 - 112);
}

uint64_t OUTLINED_FUNCTION_8_3@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

void OUTLINED_FUNCTION_9_4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_2(uint64_t a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  return sub_2468AC534((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_16_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, _QWORD)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, *(_QWORD *)(v3 - 488));
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_20(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
}

uint64_t OUTLINED_FUNCTION_22_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, _QWORD)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, *(_QWORD *)(v3 - 256));
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v0, v2);
}

char *sub_2468ACA54(char *a1, char **a2, int *a3)
{
  int v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  char *v16;
  uint64_t v17;
  char *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  _QWORD *v29;
  uint64_t v30;
  char *v31;
  _QWORD *v32;
  uint64_t v33;
  char *v34;
  _QWORD *v35;
  uint64_t v36;
  char *v37;
  _QWORD *v38;
  uint64_t v39;
  char *v40;
  _QWORD *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  char *v46;
  _QWORD *v47;
  uint64_t v48;
  char *v49;
  _QWORD *v50;
  uint64_t v51;
  char *v52;
  _QWORD *v53;
  uint64_t v54;
  char *v55;
  _QWORD *v56;
  uint64_t v57;
  char *v58;
  _QWORD *v59;
  uint64_t v60;
  char *v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  _QWORD *v80;
  uint64_t v81;
  char *v82;
  _QWORD *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  _QWORD *v94;
  uint64_t v95;
  char *v96;
  _QWORD *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  _QWORD *v102;
  uint64_t v103;
  char *v104;
  _QWORD *v105;
  uint64_t v106;
  char *v108;
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
  char *v121;
  uint64_t v122;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v22 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    v5 = a3[6];
    v6 = &a1[v5];
    v7 = (uint64_t)a2 + v5;
    v8 = *(uint64_t *)((char *)a2 + v5 + 8);
    *(_QWORD *)v6 = *(char **)((char *)a2 + v5);
    *((_QWORD *)v6 + 1) = v8;
    v9 = *(uint64_t *)((char *)a2 + v5 + 24);
    *((_QWORD *)v6 + 2) = *(char **)((char *)a2 + v5 + 16);
    *((_QWORD *)v6 + 3) = v9;
    v10 = *(uint64_t *)((char *)a2 + v5 + 40);
    *((_QWORD *)v6 + 4) = *(char **)((char *)a2 + v5 + 32);
    *((_QWORD *)v6 + 5) = v10;
    v11 = *(uint64_t *)((char *)a2 + v5 + 56);
    *((_QWORD *)v6 + 6) = *(char **)((char *)a2 + v5 + 48);
    *((_QWORD *)v6 + 7) = v11;
    v12 = (int *)type metadata accessor for WidgetMessage();
    v13 = v12[8];
    v119 = v7 + v13;
    v121 = &v6[v13];
    v14 = sub_2468D56B0();
    v15 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    v16 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v121, v119, v14);
    v6[v12[9]] = *(_BYTE *)(v7 + v12[9]);
    v6[v12[10]] = *(_BYTE *)(v7 + v12[10]);
    v6[v12[11]] = *(_BYTE *)(v7 + v12[11]);
    v6[v12[12]] = *(_BYTE *)(v7 + v12[12]);
    v17 = v12[13];
    v18 = &v6[v17];
    v19 = (const void *)(v7 + v17);
    v20 = sub_2468D568C();
    if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
    }
    v6[v12[14]] = *(_BYTE *)(v7 + v12[14]);
    v23 = v12[15];
    v24 = &v6[v23];
    v25 = (_QWORD *)(v7 + v23);
    v26 = v25[1];
    *(_QWORD *)v24 = *v25;
    *((_QWORD *)v24 + 1) = v26;
    v27 = v12[16];
    v28 = &v6[v27];
    v29 = (_QWORD *)(v7 + v27);
    v122 = v29[1];
    *(_QWORD *)v28 = *v29;
    *((_QWORD *)v28 + 1) = v122;
    v6[v12[17]] = *(_BYTE *)(v7 + v12[17]);
    v30 = v12[18];
    v31 = &v6[v30];
    v32 = (_QWORD *)(v7 + v30);
    v120 = v32[1];
    *(_QWORD *)v31 = *v32;
    *((_QWORD *)v31 + 1) = v120;
    v33 = v12[19];
    v34 = &v6[v33];
    v35 = (_QWORD *)(v7 + v33);
    v118 = v35[1];
    *(_QWORD *)v34 = *v35;
    *((_QWORD *)v34 + 1) = v118;
    v36 = v12[20];
    v37 = &v6[v36];
    v38 = (_QWORD *)(v7 + v36);
    v117 = v38[1];
    *(_QWORD *)v37 = *v38;
    *((_QWORD *)v37 + 1) = v117;
    v39 = v12[21];
    v40 = &v6[v39];
    v41 = (_QWORD *)(v7 + v39);
    v116 = v41[1];
    *(_QWORD *)v40 = *v41;
    *((_QWORD *)v40 + 1) = v116;
    v42 = v12[22];
    v43 = &v6[v42];
    v44 = (_QWORD *)(v7 + v42);
    v115 = v44[1];
    *(_QWORD *)v43 = *v44;
    *((_QWORD *)v43 + 1) = v115;
    v45 = v12[23];
    v46 = &v6[v45];
    v47 = (_QWORD *)(v7 + v45);
    v114 = v47[1];
    *(_QWORD *)v46 = *v47;
    *((_QWORD *)v46 + 1) = v114;
    v48 = v12[24];
    v49 = &v6[v48];
    v50 = (_QWORD *)(v7 + v48);
    v113 = v50[1];
    *(_QWORD *)v49 = *v50;
    *((_QWORD *)v49 + 1) = v113;
    v51 = v12[25];
    v52 = &v6[v51];
    v53 = (_QWORD *)(v7 + v51);
    v112 = v53[1];
    *(_QWORD *)v52 = *v53;
    *((_QWORD *)v52 + 1) = v112;
    v54 = v12[26];
    v55 = &v6[v54];
    v56 = (_QWORD *)(v7 + v54);
    v111 = v56[1];
    *(_QWORD *)v55 = *v56;
    *((_QWORD *)v55 + 1) = v111;
    v57 = v12[27];
    v58 = &v6[v57];
    v59 = (_QWORD *)(v7 + v57);
    v110 = v59[1];
    *(_QWORD *)v58 = *v59;
    *((_QWORD *)v58 + 1) = v110;
    v60 = v12[28];
    v61 = &v6[v60];
    v62 = (_QWORD *)(v7 + v60);
    v63 = v62[1];
    *(_QWORD *)v61 = *v62;
    *((_QWORD *)v61 + 1) = v63;
    v64 = v12[29];
    v65 = &v6[v64];
    v66 = (_QWORD *)(v7 + v64);
    v67 = v66[1];
    *(_QWORD *)v65 = *v66;
    *((_QWORD *)v65 + 1) = v67;
    v68 = v12[30];
    v69 = &v6[v68];
    v70 = (_QWORD *)(v7 + v68);
    v71 = v70[1];
    *(_QWORD *)v69 = *v70;
    *((_QWORD *)v69 + 1) = v71;
    v72 = v12[31];
    v73 = &v6[v72];
    v74 = (_QWORD *)(v7 + v72);
    v75 = v74[1];
    *(_QWORD *)v73 = *v74;
    *((_QWORD *)v73 + 1) = v75;
    v76 = a3[8];
    v22 = a1;
    *(_QWORD *)&a1[a3[7]] = *(char **)((char *)a2 + a3[7]);
    a1[v76] = *((_BYTE *)a2 + v76);
    v77 = a3[9];
    v78 = a3[10];
    v79 = &a1[v77];
    v80 = (char **)((char *)a2 + v77);
    v81 = v80[1];
    *(_QWORD *)v79 = *v80;
    *((_QWORD *)v79 + 1) = v81;
    v82 = &a1[v78];
    v83 = (char **)((char *)a2 + v78);
    v84 = v83[1];
    *(_QWORD *)v82 = *v83;
    *((_QWORD *)v82 + 1) = v84;
    v85 = a3[11];
    v86 = a3[12];
    v87 = &a1[v85];
    v88 = (char **)((char *)a2 + v85);
    v89 = v88[1];
    *(_QWORD *)v87 = *v88;
    *((_QWORD *)v87 + 1) = v89;
    v108 = &a1[v86];
    v109 = (uint64_t)a2 + v86;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4500);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v90 - 8) + 16))(v108, v109, v90);
    v91 = a3[13];
    v92 = a3[14];
    v93 = &a1[v91];
    v94 = (char **)((char *)a2 + v91);
    v95 = v94[1];
    *(_QWORD *)v93 = *v94;
    *((_QWORD *)v93 + 1) = v95;
    v96 = &a1[v92];
    v97 = (char **)((char *)a2 + v92);
    v98 = v97[1];
    *(_QWORD *)v96 = *v97;
    *((_QWORD *)v96 + 1) = v98;
    v99 = a3[15];
    v100 = a3[16];
    v101 = &a1[v99];
    v102 = (char **)((char *)a2 + v99);
    v103 = v102[1];
    *(_QWORD *)v101 = *v102;
    *((_QWORD *)v101 + 1) = v103;
    v104 = &a1[v100];
    v105 = (char **)((char *)a2 + v100);
    swift_retain();
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4508);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v106 = sub_2468D5E00();
      (*(void (**)(char *, _QWORD *, uint64_t))(*(_QWORD *)(v106 - 8) + 16))(v104, v105, v106);
    }
    else
    {
      *(_QWORD *)v104 = *v105;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v22;
}

uint64_t sub_2468ACF70(id *a1, int *a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;

  v4 = (char *)a1 + a2[6];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = type metadata accessor for WidgetMessage();
  v6 = &v4[*(int *)(v5 + 32)];
  v7 = sub_2468D56B0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (uint64_t)&v4[*(int *)(v5 + 52)];
  v9 = sub_2468D568C();
  if (!__swift_getEnumTagSinglePayload(v8, 1, v9))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = (char *)a1 + a2[12];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4500);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  swift_release();
  swift_release();
  swift_release();
  v12 = (char *)a1 + a2[16];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4508);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v13 = sub_2468D5E00();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
}

uint64_t sub_2468AD21C(uint64_t a1, uint64_t a2, int *a3)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  id v15;
  uint64_t v16;
  char *v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  _QWORD *v78;
  uint64_t v79;
  _QWORD *v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  _QWORD *v92;
  uint64_t v93;
  _QWORD *v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  _QWORD *v100;
  uint64_t v101;
  _QWORD *v102;
  _QWORD *v103;
  uint64_t v104;
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
  char *v119;
  uint64_t v120;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = a3[6];
  v5 = (_QWORD *)(a1 + v4);
  v6 = a2 + v4;
  v7 = *(_QWORD *)(a2 + v4 + 8);
  *v5 = *(_QWORD *)(a2 + v4);
  v5[1] = v7;
  v8 = *(_QWORD *)(a2 + v4 + 24);
  v5[2] = *(_QWORD *)(a2 + v4 + 16);
  v5[3] = v8;
  v9 = *(_QWORD *)(a2 + v4 + 40);
  v5[4] = *(_QWORD *)(a2 + v4 + 32);
  v5[5] = v9;
  v10 = *(_QWORD *)(a2 + v4 + 56);
  v5[6] = *(_QWORD *)(a2 + v4 + 48);
  v5[7] = v10;
  v11 = (int *)type metadata accessor for WidgetMessage();
  v12 = v11[8];
  v117 = v6 + v12;
  v119 = (char *)v5 + v12;
  v13 = sub_2468D56B0();
  v14 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  v15 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v119, v117, v13);
  *((_BYTE *)v5 + v11[9]) = *(_BYTE *)(v6 + v11[9]);
  *((_BYTE *)v5 + v11[10]) = *(_BYTE *)(v6 + v11[10]);
  *((_BYTE *)v5 + v11[11]) = *(_BYTE *)(v6 + v11[11]);
  *((_BYTE *)v5 + v11[12]) = *(_BYTE *)(v6 + v11[12]);
  v16 = v11[13];
  v17 = (char *)v5 + v16;
  v18 = (const void *)(v6 + v16);
  v19 = sub_2468D568C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
  }
  *((_BYTE *)v5 + v11[14]) = *(_BYTE *)(v6 + v11[14]);
  v21 = v11[15];
  v22 = (_QWORD *)((char *)v5 + v21);
  v23 = (_QWORD *)(v6 + v21);
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  v25 = v11[16];
  v26 = (_QWORD *)((char *)v5 + v25);
  v27 = (_QWORD *)(v6 + v25);
  v120 = v27[1];
  *v26 = *v27;
  v26[1] = v120;
  *((_BYTE *)v5 + v11[17]) = *(_BYTE *)(v6 + v11[17]);
  v28 = v11[18];
  v29 = (_QWORD *)((char *)v5 + v28);
  v30 = (_QWORD *)(v6 + v28);
  v118 = v30[1];
  *v29 = *v30;
  v29[1] = v118;
  v31 = v11[19];
  v32 = (_QWORD *)((char *)v5 + v31);
  v33 = (_QWORD *)(v6 + v31);
  v116 = v33[1];
  *v32 = *v33;
  v32[1] = v116;
  v34 = v11[20];
  v35 = (_QWORD *)((char *)v5 + v34);
  v36 = (_QWORD *)(v6 + v34);
  v115 = v36[1];
  *v35 = *v36;
  v35[1] = v115;
  v37 = v11[21];
  v38 = (_QWORD *)((char *)v5 + v37);
  v39 = (_QWORD *)(v6 + v37);
  v114 = v39[1];
  *v38 = *v39;
  v38[1] = v114;
  v40 = v11[22];
  v41 = (_QWORD *)((char *)v5 + v40);
  v42 = (_QWORD *)(v6 + v40);
  v113 = v42[1];
  *v41 = *v42;
  v41[1] = v113;
  v43 = v11[23];
  v44 = (_QWORD *)((char *)v5 + v43);
  v45 = (_QWORD *)(v6 + v43);
  v112 = v45[1];
  *v44 = *v45;
  v44[1] = v112;
  v46 = v11[24];
  v47 = (_QWORD *)((char *)v5 + v46);
  v48 = (_QWORD *)(v6 + v46);
  v111 = v48[1];
  *v47 = *v48;
  v47[1] = v111;
  v49 = v11[25];
  v50 = (_QWORD *)((char *)v5 + v49);
  v51 = (_QWORD *)(v6 + v49);
  v110 = v51[1];
  *v50 = *v51;
  v50[1] = v110;
  v52 = v11[26];
  v53 = (_QWORD *)((char *)v5 + v52);
  v54 = (_QWORD *)(v6 + v52);
  v109 = v54[1];
  *v53 = *v54;
  v53[1] = v109;
  v55 = v11[27];
  v56 = (_QWORD *)((char *)v5 + v55);
  v57 = (_QWORD *)(v6 + v55);
  v108 = v57[1];
  *v56 = *v57;
  v56[1] = v108;
  v58 = v11[28];
  v59 = (_QWORD *)((char *)v5 + v58);
  v60 = (_QWORD *)(v6 + v58);
  v61 = v60[1];
  *v59 = *v60;
  v59[1] = v61;
  v62 = v11[29];
  v63 = (_QWORD *)((char *)v5 + v62);
  v64 = (_QWORD *)(v6 + v62);
  v65 = v64[1];
  *v63 = *v64;
  v63[1] = v65;
  v66 = v11[30];
  v67 = (_QWORD *)((char *)v5 + v66);
  v68 = (_QWORD *)(v6 + v66);
  v69 = v68[1];
  *v67 = *v68;
  v67[1] = v69;
  v70 = v11[31];
  v71 = (_QWORD *)((char *)v5 + v70);
  v72 = (_QWORD *)(v6 + v70);
  v73 = v72[1];
  *v71 = *v72;
  v71[1] = v73;
  v74 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v74) = *(_BYTE *)(a2 + v74);
  v75 = a3[9];
  v76 = a3[10];
  v77 = (_QWORD *)(a1 + v75);
  v78 = (_QWORD *)(a2 + v75);
  v79 = v78[1];
  *v77 = *v78;
  v77[1] = v79;
  v80 = (_QWORD *)(a1 + v76);
  v81 = (_QWORD *)(a2 + v76);
  v82 = v81[1];
  *v80 = *v81;
  v80[1] = v82;
  v83 = a3[11];
  v84 = a3[12];
  v85 = (_QWORD *)(a1 + v83);
  v86 = (_QWORD *)(a2 + v83);
  v87 = v86[1];
  *v85 = *v86;
  v85[1] = v87;
  v106 = a1 + v84;
  v107 = a2 + v84;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4500);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v88 - 8) + 16))(v106, v107, v88);
  v89 = a3[13];
  v90 = a3[14];
  v91 = (_QWORD *)(a1 + v89);
  v92 = (_QWORD *)(a2 + v89);
  v93 = v92[1];
  *v91 = *v92;
  v91[1] = v93;
  v94 = (_QWORD *)(a1 + v90);
  v95 = (_QWORD *)(a2 + v90);
  v96 = v95[1];
  *v94 = *v95;
  v94[1] = v96;
  v97 = a3[15];
  v98 = a3[16];
  v99 = (_QWORD *)(a1 + v97);
  v100 = (_QWORD *)(a2 + v97);
  v101 = v100[1];
  *v99 = *v100;
  v99[1] = v101;
  v102 = (_QWORD *)(a1 + v98);
  v103 = (_QWORD *)(a2 + v98);
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4508);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v104 = sub_2468D5E00();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v104 - 8) + 16))(v102, v103, v104);
  }
  else
  {
    *v102 = *v103;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_2468AD708(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  int EnumTagSinglePayload;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  _QWORD *v68;
  _QWORD *v69;
  uint64_t v70;
  _QWORD *v71;
  _QWORD *v72;
  uint64_t v73;
  _QWORD *v74;
  _QWORD *v75;
  uint64_t v76;
  _QWORD *v77;
  _QWORD *v78;
  uint64_t v79;
  _QWORD *v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  _QWORD *v88;
  uint64_t v89;
  _QWORD *v90;
  _QWORD *v91;
  uint64_t v92;
  _QWORD *v93;
  _QWORD *v94;
  uint64_t v95;
  _QWORD *v96;
  _QWORD *v97;
  uint64_t v98;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v9 = a3[6];
  v10 = (_QWORD *)(a1 + v9);
  v11 = (_QWORD *)(a2 + v9);
  *v10 = *(_QWORD *)(a2 + v9);
  v10[1] = *(_QWORD *)(a2 + v9 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[2] = v11[2];
  v10[3] = v11[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[4] = v11[4];
  v10[5] = v11[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10[6] = v11[6];
  v10[7] = v11[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = (int *)type metadata accessor for WidgetMessage();
  v13 = v12[8];
  v14 = (char *)v10 + v13;
  v15 = (char *)v11 + v13;
  v16 = sub_2468D56B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  *((_BYTE *)v10 + v12[9]) = *((_BYTE *)v11 + v12[9]);
  *((_BYTE *)v10 + v12[10]) = *((_BYTE *)v11 + v12[10]);
  *((_BYTE *)v10 + v12[11]) = *((_BYTE *)v11 + v12[11]);
  *((_BYTE *)v10 + v12[12]) = *((_BYTE *)v11 + v12[12]);
  v17 = v12[13];
  v18 = (char *)v10 + v17;
  v19 = (char *)v11 + v17;
  v20 = sub_2468D568C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v18, 1, v20);
  v22 = __swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20);
  if (EnumTagSinglePayload)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v23 = *(_QWORD *)(v20 - 8);
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v18, v20);
LABEL_6:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 24))(v18, v19, v20);
LABEL_7:
  *((_BYTE *)v10 + v12[14]) = *((_BYTE *)v11 + v12[14]);
  v25 = v12[15];
  v26 = (_QWORD *)((char *)v10 + v25);
  v27 = (_QWORD *)((char *)v11 + v25);
  *v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v28 = v12[16];
  v29 = (_QWORD *)((char *)v10 + v28);
  v30 = (_QWORD *)((char *)v11 + v28);
  *v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)v10 + v12[17]) = *((_BYTE *)v11 + v12[17]);
  v31 = v12[18];
  v32 = (_QWORD *)((char *)v10 + v31);
  v33 = (_QWORD *)((char *)v11 + v31);
  *v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = v12[19];
  v35 = (_QWORD *)((char *)v10 + v34);
  v36 = (_QWORD *)((char *)v11 + v34);
  *v35 = *v36;
  v35[1] = v36[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v37 = v12[20];
  v38 = (_QWORD *)((char *)v10 + v37);
  v39 = (_QWORD *)((char *)v11 + v37);
  *v38 = *v39;
  v38[1] = v39[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v40 = v12[21];
  v41 = (_QWORD *)((char *)v10 + v40);
  v42 = (_QWORD *)((char *)v11 + v40);
  *v41 = *v42;
  v41[1] = v42[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v43 = v12[22];
  v44 = (_QWORD *)((char *)v10 + v43);
  v45 = (_QWORD *)((char *)v11 + v43);
  *v44 = *v45;
  v44[1] = v45[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v46 = v12[23];
  v47 = (_QWORD *)((char *)v10 + v46);
  v48 = (_QWORD *)((char *)v11 + v46);
  *v47 = *v48;
  v47[1] = v48[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v49 = v12[24];
  v50 = (_QWORD *)((char *)v10 + v49);
  v51 = (_QWORD *)((char *)v11 + v49);
  *v50 = *v51;
  v50[1] = v51[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v52 = v12[25];
  v53 = (_QWORD *)((char *)v10 + v52);
  v54 = (_QWORD *)((char *)v11 + v52);
  *v53 = *v54;
  v53[1] = v54[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v55 = v12[26];
  v56 = (_QWORD *)((char *)v10 + v55);
  v57 = (_QWORD *)((char *)v11 + v55);
  *v56 = *v57;
  v56[1] = v57[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v58 = v12[27];
  v59 = (_QWORD *)((char *)v10 + v58);
  v60 = (_QWORD *)((char *)v11 + v58);
  *v59 = *v60;
  v59[1] = v60[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v61 = v12[28];
  v62 = (_QWORD *)((char *)v10 + v61);
  v63 = (_QWORD *)((char *)v11 + v61);
  *v62 = *v63;
  v62[1] = v63[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v64 = v12[29];
  v65 = (_QWORD *)((char *)v10 + v64);
  v66 = (_QWORD *)((char *)v11 + v64);
  *v65 = *v66;
  v65[1] = v66[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v67 = v12[30];
  v68 = (_QWORD *)((char *)v10 + v67);
  v69 = (_QWORD *)((char *)v11 + v67);
  *v68 = *v69;
  v68[1] = v69[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v70 = v12[31];
  v71 = (_QWORD *)((char *)v10 + v70);
  v72 = (_QWORD *)((char *)v11 + v70);
  *v71 = *v72;
  v71[1] = v72[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  v73 = a3[9];
  v74 = (_QWORD *)(a1 + v73);
  v75 = (_QWORD *)(a2 + v73);
  *v74 = *v75;
  v74[1] = v75[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v76 = a3[10];
  v77 = (_QWORD *)(a1 + v76);
  v78 = (_QWORD *)(a2 + v76);
  *v77 = *v78;
  v77[1] = v78[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v79 = a3[11];
  v80 = (_QWORD *)(a1 + v79);
  v81 = (_QWORD *)(a2 + v79);
  *v80 = *v81;
  v80[1] = v81[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v82 = a3[12];
  v83 = a1 + v82;
  v84 = a2 + v82;
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4500);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v85 - 8) + 24))(v83, v84, v85);
  v86 = a3[13];
  v87 = (_QWORD *)(a1 + v86);
  v88 = (_QWORD *)(a2 + v86);
  *v87 = *v88;
  v87[1] = v88[1];
  swift_retain();
  swift_release();
  v89 = a3[14];
  v90 = (_QWORD *)(a1 + v89);
  v91 = (_QWORD *)(a2 + v89);
  *v90 = *v91;
  v90[1] = v91[1];
  swift_retain();
  swift_release();
  v92 = a3[15];
  v93 = (_QWORD *)(a1 + v92);
  v94 = (_QWORD *)(a2 + v92);
  *v93 = *v94;
  v93[1] = v94[1];
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v95 = a3[16];
    v96 = (_QWORD *)(a1 + v95);
    v97 = (_QWORD *)(a2 + v95);
    sub_2468A4D24(a1 + v95, &qword_2575E4508);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4508);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v98 = sub_2468D5E00();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v98 - 8) + 16))(v96, v97, v98);
    }
    else
    {
      *v96 = *v97;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2468ADDE0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  int *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  const void *v18;
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
  void *v29;
  const void *v30;
  uint64_t v31;
  uint64_t v32;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = a3[6];
  v7 = (_OWORD *)(a1 + v6);
  v8 = a2 + v6;
  v9 = *(_OWORD *)(a2 + v6 + 16);
  *v7 = *(_OWORD *)(a2 + v6);
  v7[1] = v9;
  v10 = *(_OWORD *)(a2 + v6 + 48);
  v7[2] = *(_OWORD *)(a2 + v6 + 32);
  v7[3] = v10;
  v11 = (int *)type metadata accessor for WidgetMessage();
  v12 = v11[8];
  v13 = (char *)v7 + v12;
  v14 = v8 + v12;
  v15 = sub_2468D56B0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  *((_BYTE *)v7 + v11[9]) = *(_BYTE *)(v8 + v11[9]);
  *((_BYTE *)v7 + v11[10]) = *(_BYTE *)(v8 + v11[10]);
  *((_BYTE *)v7 + v11[11]) = *(_BYTE *)(v8 + v11[11]);
  *((_BYTE *)v7 + v11[12]) = *(_BYTE *)(v8 + v11[12]);
  v16 = v11[13];
  v17 = (char *)v7 + v16;
  v18 = (const void *)(v8 + v16);
  v19 = sub_2468D568C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
  }
  *((_BYTE *)v7 + v11[14]) = *(_BYTE *)(v8 + v11[14]);
  *(_OWORD *)((char *)v7 + v11[15]) = *(_OWORD *)(v8 + v11[15]);
  *(_OWORD *)((char *)v7 + v11[16]) = *(_OWORD *)(v8 + v11[16]);
  *((_BYTE *)v7 + v11[17]) = *(_BYTE *)(v8 + v11[17]);
  *(_OWORD *)((char *)v7 + v11[18]) = *(_OWORD *)(v8 + v11[18]);
  *(_OWORD *)((char *)v7 + v11[19]) = *(_OWORD *)(v8 + v11[19]);
  *(_OWORD *)((char *)v7 + v11[20]) = *(_OWORD *)(v8 + v11[20]);
  *(_OWORD *)((char *)v7 + v11[21]) = *(_OWORD *)(v8 + v11[21]);
  *(_OWORD *)((char *)v7 + v11[22]) = *(_OWORD *)(v8 + v11[22]);
  *(_OWORD *)((char *)v7 + v11[23]) = *(_OWORD *)(v8 + v11[23]);
  *(_OWORD *)((char *)v7 + v11[24]) = *(_OWORD *)(v8 + v11[24]);
  *(_OWORD *)((char *)v7 + v11[25]) = *(_OWORD *)(v8 + v11[25]);
  *(_OWORD *)((char *)v7 + v11[26]) = *(_OWORD *)(v8 + v11[26]);
  *(_OWORD *)((char *)v7 + v11[27]) = *(_OWORD *)(v8 + v11[27]);
  *(_OWORD *)((char *)v7 + v11[28]) = *(_OWORD *)(v8 + v11[28]);
  *(_OWORD *)((char *)v7 + v11[29]) = *(_OWORD *)(v8 + v11[29]);
  *(_OWORD *)((char *)v7 + v11[30]) = *(_OWORD *)(v8 + v11[30]);
  *(_OWORD *)((char *)v7 + v11[31]) = *(_OWORD *)(v8 + v11[31]);
  v21 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v21) = *(_BYTE *)(a2 + v21);
  v22 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v22) = *(_OWORD *)(a2 + v22);
  v23 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  v24 = a1 + v23;
  v25 = a2 + v23;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4500);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v24, v25, v26);
  v27 = a3[14];
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  *(_OWORD *)(a1 + v27) = *(_OWORD *)(a2 + v27);
  v28 = a3[16];
  *(_OWORD *)(a1 + a3[15]) = *(_OWORD *)(a2 + a3[15]);
  v29 = (void *)(a1 + v28);
  v30 = (const void *)(a2 + v28);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4508);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v32 = sub_2468D5E00();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v32 - 8) + 32))(v29, v30, v32);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
  }
  return a1;
}

uint64_t sub_2468AE104(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  int EnumTagSinglePayload;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD *v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  _QWORD *v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _QWORD *v128;
  _QWORD *v129;
  uint64_t v130;
  _QWORD *v131;
  _QWORD *v132;
  uint64_t v133;
  _QWORD *v134;
  _QWORD *v135;
  uint64_t v136;
  void *v137;
  const void *v138;
  uint64_t v139;
  uint64_t v140;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v7 = a3[6];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = *(_QWORD *)(a2 + v7 + 8);
  *v8 = *(_QWORD *)(a2 + v7);
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v11 = v9[3];
  v8[2] = v9[2];
  v8[3] = v11;
  swift_bridgeObjectRelease();
  v12 = v9[5];
  v8[4] = v9[4];
  v8[5] = v12;
  swift_bridgeObjectRelease();
  v13 = v9[7];
  v8[6] = v9[6];
  v8[7] = v13;
  swift_bridgeObjectRelease();
  v14 = (int *)type metadata accessor for WidgetMessage();
  v15 = v14[8];
  v16 = (char *)v8 + v15;
  v17 = (char *)v9 + v15;
  v18 = sub_2468D56B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v16, v17, v18);
  *((_BYTE *)v8 + v14[9]) = *((_BYTE *)v9 + v14[9]);
  *((_BYTE *)v8 + v14[10]) = *((_BYTE *)v9 + v14[10]);
  *((_BYTE *)v8 + v14[11]) = *((_BYTE *)v9 + v14[11]);
  *((_BYTE *)v8 + v14[12]) = *((_BYTE *)v9 + v14[12]);
  v19 = v14[13];
  v20 = (char *)v8 + v19;
  v21 = (char *)v9 + v19;
  v22 = sub_2468D568C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v20, 1, v22);
  v24 = __swift_getEnumTagSinglePayload((uint64_t)v21, 1, v22);
  if (EnumTagSinglePayload)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
      __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, v22);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v25 = *(_QWORD *)(v22 - 8);
  if (v24)
  {
    (*(void (**)(char *, uint64_t))(v25 + 8))(v20, v22);
LABEL_6:
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v25 + 40))(v20, v21, v22);
LABEL_7:
  *((_BYTE *)v8 + v14[14]) = *((_BYTE *)v9 + v14[14]);
  v27 = v14[15];
  v28 = (_QWORD *)((char *)v8 + v27);
  v29 = (_QWORD *)((char *)v9 + v27);
  v31 = *v29;
  v30 = v29[1];
  *v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  v32 = v14[16];
  v33 = (_QWORD *)((char *)v8 + v32);
  v34 = (_QWORD *)((char *)v9 + v32);
  v36 = *v34;
  v35 = v34[1];
  *v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  *((_BYTE *)v8 + v14[17]) = *((_BYTE *)v9 + v14[17]);
  v37 = v14[18];
  v38 = (_QWORD *)((char *)v8 + v37);
  v39 = (_QWORD *)((char *)v9 + v37);
  v41 = *v39;
  v40 = v39[1];
  *v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease();
  v42 = v14[19];
  v43 = (_QWORD *)((char *)v8 + v42);
  v44 = (_QWORD *)((char *)v9 + v42);
  v46 = *v44;
  v45 = v44[1];
  *v43 = v46;
  v43[1] = v45;
  swift_bridgeObjectRelease();
  v47 = v14[20];
  v48 = (_QWORD *)((char *)v8 + v47);
  v49 = (_QWORD *)((char *)v9 + v47);
  v51 = *v49;
  v50 = v49[1];
  *v48 = v51;
  v48[1] = v50;
  swift_bridgeObjectRelease();
  v52 = v14[21];
  v53 = (_QWORD *)((char *)v8 + v52);
  v54 = (_QWORD *)((char *)v9 + v52);
  v56 = *v54;
  v55 = v54[1];
  *v53 = v56;
  v53[1] = v55;
  swift_bridgeObjectRelease();
  v57 = v14[22];
  v58 = (_QWORD *)((char *)v8 + v57);
  v59 = (_QWORD *)((char *)v9 + v57);
  v61 = *v59;
  v60 = v59[1];
  *v58 = v61;
  v58[1] = v60;
  swift_bridgeObjectRelease();
  v62 = v14[23];
  v63 = (_QWORD *)((char *)v8 + v62);
  v64 = (_QWORD *)((char *)v9 + v62);
  v66 = *v64;
  v65 = v64[1];
  *v63 = v66;
  v63[1] = v65;
  swift_bridgeObjectRelease();
  v67 = v14[24];
  v68 = (_QWORD *)((char *)v8 + v67);
  v69 = (_QWORD *)((char *)v9 + v67);
  v71 = *v69;
  v70 = v69[1];
  *v68 = v71;
  v68[1] = v70;
  swift_bridgeObjectRelease();
  v72 = v14[25];
  v73 = (_QWORD *)((char *)v8 + v72);
  v74 = (_QWORD *)((char *)v9 + v72);
  v76 = *v74;
  v75 = v74[1];
  *v73 = v76;
  v73[1] = v75;
  swift_bridgeObjectRelease();
  v77 = v14[26];
  v78 = (_QWORD *)((char *)v8 + v77);
  v79 = (_QWORD *)((char *)v9 + v77);
  v81 = *v79;
  v80 = v79[1];
  *v78 = v81;
  v78[1] = v80;
  swift_bridgeObjectRelease();
  v82 = v14[27];
  v83 = (_QWORD *)((char *)v8 + v82);
  v84 = (_QWORD *)((char *)v9 + v82);
  v86 = *v84;
  v85 = v84[1];
  *v83 = v86;
  v83[1] = v85;
  swift_bridgeObjectRelease();
  v87 = v14[28];
  v88 = (_QWORD *)((char *)v8 + v87);
  v89 = (_QWORD *)((char *)v9 + v87);
  v91 = *v89;
  v90 = v89[1];
  *v88 = v91;
  v88[1] = v90;
  swift_bridgeObjectRelease();
  v92 = v14[29];
  v93 = (_QWORD *)((char *)v8 + v92);
  v94 = (_QWORD *)((char *)v9 + v92);
  v96 = *v94;
  v95 = v94[1];
  *v93 = v96;
  v93[1] = v95;
  swift_bridgeObjectRelease();
  v97 = v14[30];
  v98 = (_QWORD *)((char *)v8 + v97);
  v99 = (_QWORD *)((char *)v9 + v97);
  v101 = *v99;
  v100 = v99[1];
  *v98 = v101;
  v98[1] = v100;
  swift_bridgeObjectRelease();
  v102 = v14[31];
  v103 = (_QWORD *)((char *)v8 + v102);
  v104 = (_QWORD *)((char *)v9 + v102);
  v106 = *v104;
  v105 = v104[1];
  *v103 = v106;
  v103[1] = v105;
  swift_bridgeObjectRelease();
  v107 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v107) = *(_BYTE *)(a2 + v107);
  v108 = a3[9];
  v109 = (_QWORD *)(a1 + v108);
  v110 = (uint64_t *)(a2 + v108);
  v112 = *v110;
  v111 = v110[1];
  *v109 = v112;
  v109[1] = v111;
  swift_bridgeObjectRelease();
  v113 = a3[10];
  v114 = (_QWORD *)(a1 + v113);
  v115 = (uint64_t *)(a2 + v113);
  v117 = *v115;
  v116 = v115[1];
  *v114 = v117;
  v114[1] = v116;
  swift_bridgeObjectRelease();
  v118 = a3[11];
  v119 = (_QWORD *)(a1 + v118);
  v120 = (uint64_t *)(a2 + v118);
  v122 = *v120;
  v121 = v120[1];
  *v119 = v122;
  v119[1] = v121;
  swift_bridgeObjectRelease();
  v123 = a3[12];
  v124 = a1 + v123;
  v125 = a2 + v123;
  v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4500);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v126 - 8) + 40))(v124, v125, v126);
  v127 = a3[13];
  v128 = (_QWORD *)(a1 + v127);
  v129 = (_QWORD *)(a2 + v127);
  *v128 = *v129;
  v128[1] = v129[1];
  swift_release();
  v130 = a3[14];
  v131 = (_QWORD *)(a1 + v130);
  v132 = (_QWORD *)(a2 + v130);
  *v131 = *v132;
  v131[1] = v132[1];
  swift_release();
  v133 = a3[15];
  v134 = (_QWORD *)(a1 + v133);
  v135 = (_QWORD *)(a2 + v133);
  *v134 = *v135;
  v134[1] = v135[1];
  swift_release();
  if (a1 != a2)
  {
    v136 = a3[16];
    v137 = (void *)(a1 + v136);
    v138 = (const void *)(a2 + v136);
    sub_2468A4D24(a1 + v136, &qword_2575E4508);
    v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4508);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v140 = sub_2468D5E00();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v140 - 8) + 32))(v137, v138, v140);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v137, v138, *(_QWORD *)(*(_QWORD *)(v139 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_2468AE648()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2468AE654(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;

  v6 = OUTLINED_FUNCTION_18_2();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = a3[6];
    return __swift_getEnumTagSinglePayload(v4 + v8, v3, v7);
  }
  if ((_DWORD)v3 != 0x7FFFFFFF)
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4500);
    if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == (_DWORD)v3)
    {
      v7 = v11;
      v8 = a3[12];
    }
    else
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4510);
      v8 = a3[16];
    }
    return __swift_getEnumTagSinglePayload(v4 + v8, v3, v7);
  }
  v9 = *(_QWORD *)(v4 + a3[9] + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_2468AE714()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_2468AE720(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = OUTLINED_FUNCTION_18_2();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a4[6];
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(v5 + a4[9] + 8) = (v4 - 1);
      OUTLINED_FUNCTION_12_1();
      return;
    }
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4500);
    if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
    {
      v9 = v11;
      v10 = a4[12];
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4510);
      v10 = a4[16];
    }
  }
  __swift_storeEnumTagSinglePayload(v5 + v10, v4, v4, v9);
}

uint64_t type metadata accessor for MessageView()
{
  uint64_t result;

  result = qword_2575E4570;
  if (!qword_2575E4570)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2468AE80C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  type metadata accessor for WidgetMessage();
  if (v0 <= 0x3F)
  {
    sub_2468AE8E8();
    if (v1 <= 0x3F)
    {
      sub_2468AE97C();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_2468AE8E8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2575E4580)
  {
    sub_2468AE940();
    v0 = sub_2468D5BB4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2575E4580);
  }
}

unint64_t sub_2468AE940()
{
  unint64_t result;

  result = qword_2575E4588;
  if (!qword_2575E4588)
  {
    result = MEMORY[0x249562024](MEMORY[0x24BEE50B8], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_2575E4588);
  }
  return result;
}

void sub_2468AE97C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2575E4590)
  {
    sub_2468D5E00();
    v0 = sub_2468D5B84();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2575E4590);
  }
}

uint64_t sub_2468AE9D0()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2468AE9E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  OUTLINED_FUNCTION_14_2();
  v49 = v22;
  v50 = v23;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v48 = v36;
  v37 = sub_2468D5FF8();
  v38 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_0();
  v41 = v40 - v39;
  sub_2468D6430();
  sub_2468971E4();
  *v35 = sub_2468D5C8C();
  v35[1] = v42;
  v35[2] = v33;
  v43 = (int *)OUTLINED_FUNCTION_17_2();
  sub_2468B26B8(v31, (uint64_t)v35 + v43[6], (uint64_t (*)(_QWORD))type metadata accessor for WidgetMessage);
  *(uint64_t *)((char *)v35 + v43[7]) = v29;
  *((_BYTE *)v35 + v43[8]) = v27;
  v44 = (uint64_t *)((char *)v35 + v43[9]);
  *v44 = v25;
  v44[1] = v48;
  v45 = (uint64_t *)((char *)v35 + v43[10]);
  *v45 = v49;
  v45[1] = v50;
  v46 = (uint64_t *)((char *)v35 + v43[11]);
  *v46 = a21;
  v46[1] = a22;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v38 + 104))(v41, *MEMORY[0x24BDF1860], v37);
  sub_2468AE940();
  sub_2468D5B9C();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_7_4();
  v47 = (uint64_t *)((char *)v35 + v43[16]);
  *v47 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4508);
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_3_6();
}

double sub_2468AEB94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  BOOL v7;
  void (*v8)(char *, uint64_t);
  double result;
  _QWORD v10[2];

  v0 = sub_2468D5E00();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v10 - v5;
  type metadata accessor for MessageView();
  sub_2468BDF64((uint64_t)v6);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BDEEE60], v0);
  v7 = sub_2468AECB0((uint64_t)v6, (uint64_t)v4);
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  result = 20.0;
  if (!v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4500);
    sub_2468D5BA8();
    return *(double *)&v10[1];
  }
  return result;
}

BOOL sub_2468AECB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t (*v12)(char *, uint64_t);
  int v13;
  unint64_t v14;
  _DWORD *v15;
  int v16;
  int v17;
  unint64_t v18;
  uint64_t v20;

  v4 = sub_2468D5E00();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v20 - v9;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)&v20 - v9, a2, v4);
  v12 = *(uint64_t (**)(char *, uint64_t))(v5 + 88);
  v13 = v12(v10, v4);
  v14 = 0;
  v15 = (_DWORD *)MEMORY[0x24BDEEE90];
  v16 = *MEMORY[0x24BDEEE58];
  if (v13 != *MEMORY[0x24BDEEE58])
  {
    if (v13 == *MEMORY[0x24BDEEE90])
    {
      v14 = 1;
      goto LABEL_24;
    }
    if (v13 == *MEMORY[0x24BDEEE98])
    {
      v14 = 2;
      goto LABEL_24;
    }
    if (v13 == *MEMORY[0x24BDEEE88])
      goto LABEL_7;
    if (v13 == *MEMORY[0x24BDEEE50])
    {
      v14 = 4;
    }
    else if (v13 == *MEMORY[0x24BDEEE60])
    {
      v14 = 5;
    }
    else if (v13 == *MEMORY[0x24BDEEE30])
    {
      v14 = 6;
    }
    else if (v13 == *MEMORY[0x24BDEEE70])
    {
      v14 = 7;
    }
    else if (v13 == *MEMORY[0x24BDEEE68])
    {
      v14 = 8;
    }
    else if (v13 == *MEMORY[0x24BDEEE78])
    {
      v14 = 9;
    }
    else if (v13 == *MEMORY[0x24BDEEE40])
    {
      v14 = 10;
    }
    else
    {
      if (v13 != *MEMORY[0x24BDEEE48])
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_7:
        v14 = 3;
        goto LABEL_24;
      }
      v14 = 11;
    }
  }
LABEL_24:
  v11(v8, a1, v4);
  v17 = v12(v8, v4);
  if (v17 == v16)
  {
    v18 = 0;
  }
  else if (v17 == *v15)
  {
    v18 = 1;
  }
  else if (v17 == *MEMORY[0x24BDEEE98])
  {
    v18 = 2;
  }
  else
  {
    if (v17 != *MEMORY[0x24BDEEE88])
    {
      if (v17 == *MEMORY[0x24BDEEE50])
      {
        v18 = 4;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE60])
      {
        v18 = 5;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE30])
      {
        v18 = 6;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE70])
      {
        v18 = 7;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE68])
      {
        v18 = 8;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE78])
      {
        v18 = 9;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE40])
      {
        v18 = 10;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE48])
      {
        v18 = 11;
        return v14 < v18;
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    v18 = 3;
  }
  return v14 < v18;
}

void sub_2468AF038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;

  OUTLINED_FUNCTION_14_2();
  a19 = v21;
  a20 = v22;
  v23 = OUTLINED_FUNCTION_17_2();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(_QWORD *)(v24 + 64);
  MEMORY[0x24BDAC7A8](v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E45F0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_13_2();
  *(_QWORD *)v20 = sub_2468D5DAC();
  *(_QWORD *)(v20 + 8) = 0;
  *(_BYTE *)(v20 + 16) = 1;
  v27 = v20 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2575E45F8) + 44);
  *(_QWORD *)v27 = sub_2468D5E18();
  *(_QWORD *)(v27 + 8) = 0x4008000000000000;
  *(_BYTE *)(v27 + 16) = 0;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4600);
  sub_2468AF198(v20, v27 + *(int *)(v28 + 44));
  sub_2468B1D24(v20, (uint64_t)&a9 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  v29 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  v30 = swift_allocObject();
  sub_2468B26B8((uint64_t)&a9 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0), v30 + v29, (uint64_t (*)(_QWORD))type metadata accessor for MessageView);
  sub_2468B2244(&qword_2575E4608, &qword_2575E45F0);
  sub_2468D60D0();
  swift_release();
  OUTLINED_FUNCTION_10_4(v20);
  OUTLINED_FUNCTION_3_6();
}

void sub_2468AF198(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t KeyPath;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)@<X0>(uint64_t *@<X8>);
  uint64_t v25;
  uint64_t (*v26)@<X0>(uint64_t *@<X8>);
  uint64_t (*v27)@<X0>(uint64_t *@<X8>);
  uint64_t (**v28)@<X0>(uint64_t *@<X8>);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)@<X0>(uint64_t *@<X8>);
  uint64_t v39;
  uint64_t (*v40)@<X0>(uint64_t *@<X8>);
  uint64_t (*v41)@<X0>(uint64_t *@<X8>);
  uint64_t v42;
  uint64_t (**v43)@<X0>(uint64_t *@<X8>);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48[2];
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

  v54 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4610);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4618);
  v6 = MEMORY[0x24BDAC7A8](v53);
  v51 = (uint64_t)v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v52 = (uint64_t)v48 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4620);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4628);
  v12 = MEMORY[0x24BDAC7A8](v50);
  v14 = (char *)v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v55 = (uint64_t)v48 - v15;
  *(_QWORD *)v11 = sub_2468D5DA0();
  *((_QWORD *)v11 + 1) = 0x4000000000000000;
  v11[16] = 0;
  v16 = (uint64_t)&v11[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2575E4630) + 44)];
  v48[0] = a1;
  sub_2468AF628(a1, v16);
  KeyPath = swift_getKeyPath();
  v49 = type metadata accessor for MessageView();
  v18 = (uint64_t *)(a1 + *(int *)(v49 + 52));
  v19 = *v18;
  v20 = v18[1];
  v56 = v19;
  v57 = v20;
  v48[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4638);
  sub_2468D61CC();
  v22 = v58;
  v21 = v59;
  v23 = v60;
  v24 = (uint64_t (*)@<X0>(uint64_t *@<X8>))swift_allocObject();
  *((_QWORD *)v24 + 2) = v22;
  *((_QWORD *)v24 + 3) = v21;
  *((_QWORD *)v24 + 4) = v23;
  *((_QWORD *)v24 + 5) = KeyPath;
  swift_retain();
  swift_retain();
  swift_retain();
  v25 = sub_2468D6274();
  v27 = v26;
  sub_2468B2684((uint64_t)v11, (uint64_t)v14, &qword_2575E4620);
  swift_release();
  swift_release();
  swift_release();
  v28 = (uint64_t (**)@<X0>(uint64_t *@<X8>))&v14[*(int *)(v50 + 36)];
  *v28 = sub_2468CFC0C;
  v28[1] = 0;
  v28[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))sub_2468B1FB0;
  v28[3] = v24;
  v28[4] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v25;
  v28[5] = v27;
  sub_2468A4D24((uint64_t)v11, &qword_2575E4620);
  sub_2468B24D0((uint64_t)v14, v55, &qword_2575E4628);
  *(_QWORD *)v5 = sub_2468D5DA0();
  *((_QWORD *)v5 + 1) = 0x4010000000000000;
  v5[16] = 0;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4640);
  v30 = v48[0];
  sub_2468B08BC(v48[0], (uint64_t)&v5[*(int *)(v29 + 44)]);
  v31 = swift_getKeyPath();
  v32 = (uint64_t *)(v30 + *(int *)(v49 + 56));
  v33 = *v32;
  v34 = v32[1];
  v56 = v33;
  v57 = v34;
  sub_2468D61CC();
  v35 = v58;
  v36 = v59;
  v37 = v60;
  v38 = (uint64_t (*)@<X0>(uint64_t *@<X8>))swift_allocObject();
  *((_QWORD *)v38 + 2) = v35;
  *((_QWORD *)v38 + 3) = v36;
  *((_QWORD *)v38 + 4) = v37;
  *((_QWORD *)v38 + 5) = v31;
  swift_retain();
  swift_retain();
  swift_retain();
  v39 = sub_2468D6274();
  v41 = v40;
  v42 = v51;
  sub_2468B2684((uint64_t)v5, v51, &qword_2575E4610);
  swift_release();
  swift_release();
  swift_release();
  v43 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v42 + *(int *)(v53 + 36));
  *v43 = sub_2468CFC0C;
  v43[1] = 0;
  v43[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))sub_2468B2788;
  v43[3] = v38;
  v43[4] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v39;
  v43[5] = v41;
  sub_2468A4D24((uint64_t)v5, &qword_2575E4610);
  v44 = v52;
  sub_2468B24D0(v42, v52, &qword_2575E4618);
  v45 = v55;
  sub_2468B2684(v55, (uint64_t)v14, &qword_2575E4628);
  sub_2468B2684(v44, v42, &qword_2575E4618);
  v46 = v54;
  sub_2468B2684((uint64_t)v14, v54, &qword_2575E4628);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4648);
  sub_2468B2684(v42, v46 + *(int *)(v47 + 48), &qword_2575E4618);
  sub_2468A4D24(v44, &qword_2575E4618);
  sub_2468A4D24(v45, &qword_2575E4628);
  sub_2468A4D24(v42, &qword_2575E4618);
  sub_2468A4D24((uint64_t)v14, &qword_2575E4628);
}

void sub_2468AF628(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
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
  uint64_t KeyPath;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v30 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4708);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&KeyPath - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&KeyPath - v7;
  *(_QWORD *)v8 = sub_2468D5DA0();
  *((_QWORD *)v8 + 1) = 0x4010000000000000;
  v8[16] = 0;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4710);
  sub_2468AF890(a1, (uint64_t)&v8[*(int *)(v9 + 44)]);
  type metadata accessor for MessageView();
  v31 = sub_2468D0CD8();
  v32 = v10;
  sub_246897B28();
  v11 = sub_2468D6058();
  v13 = v12;
  v28 = v14;
  v16 = v15 & 1;
  KeyPath = swift_getKeyPath();
  v17 = sub_2468D5FC8();
  v18 = swift_getKeyPath();
  v19 = sub_2468D616C();
  v20 = swift_getKeyPath();
  v29 = v6;
  sub_2468B2684((uint64_t)v8, (uint64_t)v6, &qword_2575E4708);
  v21 = (uint64_t)v6;
  v22 = v30;
  sub_2468B2684(v21, v30, &qword_2575E4708);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4718);
  v24 = v22 + *(int *)(v23 + 48);
  *(_QWORD *)v24 = 0;
  *(_BYTE *)(v24 + 8) = 1;
  v25 = v22 + *(int *)(v23 + 64);
  *(_QWORD *)v25 = v11;
  *(_QWORD *)(v25 + 8) = v13;
  *(_BYTE *)(v25 + 16) = v16;
  v26 = KeyPath;
  *(_QWORD *)(v25 + 24) = v28;
  *(_QWORD *)(v25 + 32) = 0x3FF0000000000000;
  *(_QWORD *)(v25 + 40) = v26;
  *(_QWORD *)(v25 + 48) = 1;
  *(_BYTE *)(v25 + 56) = 0;
  *(_QWORD *)(v25 + 64) = v18;
  *(_QWORD *)(v25 + 72) = v17;
  *(_QWORD *)(v25 + 80) = v20;
  *(_QWORD *)(v25 + 88) = v19;
  *(_QWORD *)(v25 + 96) = 0x3FE8000000000000;
  sub_2468A7034(v11, v13, v16);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2468A4D24((uint64_t)v8, &qword_2575E4708);
  sub_2468A4F8C(v11, v13, v16);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_2468A4D24((uint64_t)v29, &qword_2575E4708);
}

void sub_2468AF890(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  __int128 v33;
  uint64_t v34;
  char *v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD *v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
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
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t KeyPath;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[4];
  char v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;

  v71 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4658);
  MEMORY[0x24BDAC7A8](v3);
  v58 = (uint64_t)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4660);
  v5 = MEMORY[0x24BDAC7A8](KeyPath);
  v57 = (uint64_t)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v59 = (uint64_t)&v56 - v7;
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4720);
  MEMORY[0x24BDAC7A8](v65);
  v67 = (uint64_t)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4728);
  MEMORY[0x24BDAC7A8](v61);
  v62 = (uint64_t)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4730);
  MEMORY[0x24BDAC7A8](v66);
  v64 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4670);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4678);
  v14 = MEMORY[0x24BDAC7A8](v60);
  v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v63 = (uint64_t)&v56 - v17;
  v18 = type metadata accessor for MessageView();
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4738);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v70 = (uint64_t)&v56 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v56 - v24;
  v26 = a1 + *(int *)(v18 + 24);
  v27 = type metadata accessor for WidgetMessage();
  v28 = *(unsigned __int8 *)(v26 + *(int *)(v27 + 36));
  sub_2468B1D24(a1, (uint64_t)v20);
  if (v28 == 1)
  {
    v29 = v20[*(int *)(v18 + 32)];
    sub_2468B1FF8((uint64_t)v20);
    v30 = (uint64_t)v25;
    if ((v29 & 1) == 0)
    {
      v31 = a1;
      sub_2468B15B8();
      sub_2468AEB94();
      sub_2468D6274();
      sub_2468D5BE4();
      sub_2468B2684((uint64_t)v13, (uint64_t)v16, &qword_2575E4670);
      v32 = &v16[*(int *)(v60 + 36)];
      v33 = v75;
      *(_OWORD *)v32 = v74;
      *((_OWORD *)v32 + 1) = v33;
      *((_OWORD *)v32 + 2) = v76;
      sub_2468A4D24((uint64_t)v13, &qword_2575E4670);
      v34 = v63;
      sub_2468B24D0((uint64_t)v16, v63, &qword_2575E4678);
      sub_2468B2684(v34, v62, &qword_2575E4678);
      goto LABEL_7;
    }
  }
  else
  {
    sub_2468B1FF8((uint64_t)v20);
    v30 = (uint64_t)v25;
  }
  if (*(_BYTE *)(v26 + *(int *)(v27 + 40)) != 1)
  {
    v40 = v58;
    v31 = a1;
    sub_2468B0530(v58);
    sub_2468AEB94();
    sub_2468D625C();
    sub_2468D5BE4();
    v41 = v57;
    sub_2468B2684(v40, v57, &qword_2575E4658);
    v42 = (_OWORD *)(v41 + *(int *)(KeyPath + 36));
    v43 = v75;
    *v42 = v74;
    v42[1] = v43;
    v42[2] = v76;
    sub_2468A4D24(v40, &qword_2575E4658);
    v44 = v59;
    sub_2468B24D0(v41, v59, &qword_2575E4660);
    sub_2468B2684(v44, v67, &qword_2575E4660);
    swift_storeEnumTagMultiPayload();
    sub_2468B2620();
    sub_2468B2278();
    sub_2468D5E3C();
    v38 = v44;
    v39 = &qword_2575E4660;
    goto LABEL_9;
  }
  v31 = a1;
  sub_2468B005C((uint64_t)v13);
  sub_2468AEB94();
  sub_2468D6274();
  sub_2468D5BE4();
  sub_2468B2684((uint64_t)v13, (uint64_t)v16, &qword_2575E4670);
  v35 = &v16[*(int *)(v60 + 36)];
  v36 = v75;
  *(_OWORD *)v35 = v74;
  *((_OWORD *)v35 + 1) = v36;
  *((_OWORD *)v35 + 2) = v76;
  sub_2468A4D24((uint64_t)v13, &qword_2575E4670);
  v34 = v63;
  sub_2468B24D0((uint64_t)v16, v63, &qword_2575E4678);
  sub_2468B2684(v34, v62, &qword_2575E4678);
LABEL_7:
  swift_storeEnumTagMultiPayload();
  sub_2468B2034();
  v37 = (uint64_t)v64;
  sub_2468D5E3C();
  sub_2468B2684(v37, v67, &qword_2575E4730);
  swift_storeEnumTagMultiPayload();
  sub_2468B2620();
  sub_2468B2278();
  sub_2468D5E3C();
  sub_2468A4D24(v37, &qword_2575E4730);
  v38 = v34;
  v39 = &qword_2575E4678;
LABEL_9:
  sub_2468A4D24(v38, v39);
  v69 = v30;
  sub_2468B1B18(v31, (uint64_t)v72);
  v45 = v72[0];
  v46 = v72[1];
  v47 = v72[2];
  v48 = v72[3];
  v49 = v73;
  KeyPath = swift_getKeyPath();
  sub_2468D5FEC();
  sub_2468D5F8C();
  v50 = sub_2468D5FB0();
  swift_release();
  v51 = swift_getKeyPath();
  v52 = v30;
  v53 = v70;
  sub_2468B2684(v52, v70, &qword_2575E4738);
  v54 = v71;
  sub_2468B2684(v53, v71, &qword_2575E4738);
  v55 = v54 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2575E4748) + 48);
  *(_QWORD *)v55 = v45;
  *(_QWORD *)(v55 + 8) = v46;
  *(_QWORD *)(v55 + 16) = v47;
  *(_QWORD *)(v55 + 24) = v48;
  *(_BYTE *)(v55 + 32) = v49;
  *(_QWORD *)(v55 + 40) = KeyPath;
  *(_QWORD *)(v55 + 48) = 1;
  *(_BYTE *)(v55 + 56) = 0;
  *(_QWORD *)(v55 + 64) = v51;
  *(_QWORD *)(v55 + 72) = v50;
  sub_2468B2480(v45, v46, v47);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2468A4D24(v69, &qword_2575E4738);
  sub_2468B24A8(v45, v46, v47);
  swift_release();
  swift_release();
  swift_release();
  sub_2468A4D24(v53, &qword_2575E4738);
}

void sub_2468B005C(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
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
  uint64_t v54;

  v49 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4700);
  MEMORY[0x24BDAC7A8](v1);
  v48 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_2468D5FBC();
  v45 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v44 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = type metadata accessor for MessageView();
  MEMORY[0x24BDAC7A8](v50);
  v51 = (uint64_t)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40B8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (uint64_t *)((char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = sub_2468D6190();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E46C0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (uint64_t *)((char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E46B0);
  MEMORY[0x24BDAC7A8](v52);
  v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E46A0);
  MEMORY[0x24BDAC7A8](v53);
  v46 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2468D6184();
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BDF40B0], v8);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)v7 + *(int *)(v5 + 28), v11, v8);
  *v7 = KeyPath;
  sub_2468B2684((uint64_t)v7, (uint64_t)v14 + *(int *)(v12 + 36), &qword_2575E40B8);
  *v14 = v18;
  swift_retain();
  sub_2468A4D24((uint64_t)v7, &qword_2575E40B8);
  v20 = v8;
  v21 = v50;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v20);
  swift_release();
  v22 = v54;
  v23 = v54 + *(int *)(v21 + 24);
  LODWORD(v23) = *(unsigned __int8 *)(v23 + *(int *)(type metadata accessor for WidgetMessage() + 36));
  v24 = v22;
  v25 = v51;
  sub_2468B1D24(v24, v51);
  if ((_DWORD)v23 != 1)
  {
    sub_2468B1FF8(v25);
    v28 = (uint64_t)v48;
    v27 = v49;
    v30 = (uint64_t)v46;
    v29 = v47;
    v32 = v44;
    v31 = v45;
    goto LABEL_5;
  }
  v26 = *(_BYTE *)(v25 + *(int *)(v21 + 32));
  sub_2468B1FF8(v25);
  v28 = (uint64_t)v48;
  v27 = v49;
  v30 = (uint64_t)v46;
  v29 = v47;
  v32 = v44;
  v31 = v45;
  if ((v26 & 1) != 0)
  {
LABEL_5:
    sub_2468D5F50();
    goto LABEL_6;
  }
  sub_2468D5FE0();
LABEL_6:
  (*(void (**)(char *, _QWORD, uint64_t))(v31 + 104))(v32, *MEMORY[0x24BDF17C8], v29);
  v33 = sub_2468D5FD4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v29);
  v34 = swift_getKeyPath();
  sub_2468B2684((uint64_t)v14, (uint64_t)v16, &qword_2575E46C0);
  v35 = (uint64_t *)&v16[*(int *)(v52 + 36)];
  *v35 = v34;
  v35[1] = v33;
  sub_2468A4D24((uint64_t)v14, &qword_2575E46C0);
  v36 = sub_2468D6130();
  v37 = swift_getKeyPath();
  sub_2468B2684((uint64_t)v16, v30, &qword_2575E46B0);
  v38 = (uint64_t *)(v30 + *(int *)(v53 + 36));
  *v38 = v37;
  v38[1] = v36;
  sub_2468A4D24((uint64_t)v16, &qword_2575E46B0);
  sub_2468D5E24();
  v39 = sub_2468D5E30();
  __swift_storeEnumTagSinglePayload(v28, 0, 1, v39);
  v40 = swift_getKeyPath();
  v41 = (uint64_t *)(v27 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2575E4670) + 36));
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E46E0);
  sub_2468B2684(v28, (uint64_t)v41 + *(int *)(v42 + 28), &qword_2575E4700);
  *v41 = v40;
  sub_2468B2684(v30, v27, &qword_2575E46A0);
  sub_2468A4D24(v28, &qword_2575E4700);
  sub_2468A4D24(v30, &qword_2575E46A0);
}

void sub_2468B0530(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t KeyPath;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;

  v36 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4700);
  MEMORY[0x24BDAC7A8](v1);
  v35 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2468D5FBC();
  v33 = *(_QWORD *)(v3 - 8);
  v34 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40B8);
  MEMORY[0x24BDAC7A8](v31);
  v7 = (uint64_t *)((char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = sub_2468D6190();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E46C0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (uint64_t *)((char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E46B0);
  MEMORY[0x24BDAC7A8](v32);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_2468D6184();
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BDF40B0], v8);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)v7 + *(int *)(v31 + 28), v11, v8);
  *v7 = KeyPath;
  sub_2468B2684((uint64_t)v7, (uint64_t)v14 + *(int *)(v12 + 36), &qword_2575E40B8);
  *v14 = v17;
  swift_retain();
  sub_2468A4D24((uint64_t)v7, &qword_2575E40B8);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_release();
  sub_2468D5FE0();
  v20 = v33;
  v19 = v34;
  (*(void (**)(char *, _QWORD, uint64_t))(v33 + 104))(v5, *MEMORY[0x24BDF17C8], v34);
  v21 = sub_2468D5FD4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v19);
  v22 = swift_getKeyPath();
  sub_2468B2684((uint64_t)v14, (uint64_t)v16, &qword_2575E46C0);
  v23 = (uint64_t *)&v16[*(int *)(v32 + 36)];
  *v23 = v22;
  v23[1] = v21;
  sub_2468A4D24((uint64_t)v14, &qword_2575E46C0);
  v24 = (uint64_t)v35;
  sub_2468D5E24();
  v25 = sub_2468D5E30();
  __swift_storeEnumTagSinglePayload(v24, 0, 1, v25);
  v26 = swift_getKeyPath();
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4658);
  v28 = v36;
  v29 = (uint64_t *)(v36 + *(int *)(v27 + 36));
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E46E0);
  sub_2468B2684(v24, (uint64_t)v29 + *(int *)(v30 + 28), &qword_2575E4700);
  *v29 = v26;
  sub_2468B2684((uint64_t)v16, v28, &qword_2575E46B0);
  sub_2468A4D24(v24, &qword_2575E4700);
  sub_2468A4D24((uint64_t)v16, &qword_2575E46B0);
}

void sub_2468B08BC(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _OWORD *v46;
  __int128 v47;
  uint64_t *v48;
  uint64_t v49;
  char *v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t KeyPath;
  uint64_t v57;
  int *v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD v94[4];
  unsigned __int8 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;

  v85 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4650);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v91 = (uint64_t)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v90 = (uint64_t)&v76 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v92 = (uint64_t)&v76 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v89 = (uint64_t)&v76 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4658);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4660);
  v14 = MEMORY[0x24BDAC7A8](v82);
  v16 = (char *)&v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v79 = (uint64_t)&v76 - v17;
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4668);
  MEMORY[0x24BDAC7A8](v81);
  v87 = (uint64_t)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4670);
  MEMORY[0x24BDAC7A8](v84);
  v20 = (char *)&v76 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4678);
  v21 = MEMORY[0x24BDAC7A8](v80);
  v23 = (char *)&v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v76 - v24;
  v26 = type metadata accessor for MessageView();
  v27 = MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v76 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)&v76 - v30;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4680);
  v33 = MEMORY[0x24BDAC7A8](v32);
  v88 = (uint64_t)&v76 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v33);
  v93 = (uint64_t)&v76 - v35;
  v36 = a1 + *(int *)(v26 + 24);
  v86 = (int *)type metadata accessor for WidgetMessage();
  v37 = v86[9];
  v83 = v36;
  LODWORD(v36) = *(unsigned __int8 *)(v36 + v37);
  sub_2468B1D24(a1, (uint64_t)v31);
  if ((_DWORD)v36 != 1)
  {
    sub_2468B1FF8((uint64_t)v31);
    sub_2468B1D24(a1, (uint64_t)v29);
    v39 = a1;
    goto LABEL_6;
  }
  v76 = v23;
  v77 = v25;
  v38 = v31[*(int *)(v26 + 32)];
  sub_2468B1FF8((uint64_t)v31);
  sub_2468B1D24(a1, (uint64_t)v29);
  v39 = a1;
  if ((v38 & 1) != 0)
  {
LABEL_6:
    sub_2468B1FF8((uint64_t)v29);
    v41 = v82;
    goto LABEL_7;
  }
  v40 = v29[*(int *)(v26 + 24) + v86[10]];
  sub_2468B1FF8((uint64_t)v29);
  v41 = v82;
  v42 = v80;
  if ((v40 & 1) != 0)
  {
    v43 = (uint64_t)v20;
    sub_2468B005C((uint64_t)v20);
    sub_2468AEB94();
    sub_2468D6274();
    sub_2468D5BE4();
    v44 = (uint64_t)v20;
    v45 = (uint64_t)v76;
    sub_2468B2684(v44, (uint64_t)v76, &qword_2575E4670);
    v46 = (_OWORD *)(v45 + *(int *)(v42 + 36));
    v47 = v97;
    *v46 = v96;
    v46[1] = v47;
    v46[2] = v98;
    sub_2468A4D24(v43, &qword_2575E4670);
    v48 = &qword_2575E4678;
    v49 = (uint64_t)v77;
    sub_2468B24D0(v45, (uint64_t)v77, &qword_2575E4678);
    sub_2468B2684(v49, v87, &qword_2575E4678);
    goto LABEL_8;
  }
LABEL_7:
  sub_2468B0530((uint64_t)v13);
  sub_2468AEB94();
  sub_2468D625C();
  sub_2468D5BE4();
  sub_2468B2684((uint64_t)v13, (uint64_t)v16, &qword_2575E4658);
  v50 = &v16[*(int *)(v41 + 36)];
  v51 = v97;
  *(_OWORD *)v50 = v96;
  *((_OWORD *)v50 + 1) = v51;
  *((_OWORD *)v50 + 2) = v98;
  sub_2468A4D24((uint64_t)v13, &qword_2575E4658);
  v48 = &qword_2575E4660;
  v49 = v79;
  sub_2468B24D0((uint64_t)v16, v79, &qword_2575E4660);
  sub_2468B2684(v49, v87, &qword_2575E4660);
LABEL_8:
  swift_storeEnumTagMultiPayload();
  sub_2468B2034();
  sub_2468B2278();
  sub_2468D5E3C();
  sub_2468A4D24(v49, v48);
  sub_2468B1C1C(v39, (uint64_t)v94);
  v53 = v94[0];
  v52 = v94[1];
  v54 = v94[2];
  v55 = v94[3];
  LODWORD(v82) = v95;
  KeyPath = swift_getKeyPath();
  v81 = sub_2468D5F50();
  v57 = swift_getKeyPath();
  v58 = v86;
  v59 = v83;
  v60 = *(_BYTE *)(v83 + v86[11]) == 1;
  v61 = v89;
  v62 = v84;
  v87 = KeyPath;
  v80 = v57;
  v78 = v39;
  v79 = v55;
  if (v60)
  {
    sub_2468B116C(v89);
    v63 = 0;
  }
  else
  {
    v63 = 1;
  }
  v64 = 1;
  __swift_storeEnumTagSinglePayload(v61, v63, 1, v62);
  if (*(_BYTE *)(v59 + v58[12]) == 1)
  {
    sub_2468B15B8();
    v64 = 0;
  }
  v65 = v92;
  __swift_storeEnumTagSinglePayload(v92, v64, 1, v62);
  v66 = v88;
  sub_2468B2684(v93, v88, &qword_2575E4680);
  v67 = v90;
  sub_2468B2684(v61, v90, &qword_2575E4650);
  sub_2468B2684(v65, v91, &qword_2575E4650);
  v68 = v85;
  sub_2468B2684(v66, v85, &qword_2575E4680);
  v69 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2575E46F8);
  v70 = v68 + v69[12];
  *(_QWORD *)v70 = v53;
  *(_QWORD *)(v70 + 8) = v52;
  v71 = v79;
  *(_QWORD *)(v70 + 16) = v54;
  *(_QWORD *)(v70 + 24) = v71;
  *(_BYTE *)(v70 + 32) = v82;
  *(_QWORD *)(v70 + 40) = v87;
  *(_QWORD *)(v70 + 48) = 1;
  *(_BYTE *)(v70 + 56) = 0;
  v72 = v81;
  *(_QWORD *)(v70 + 64) = v80;
  *(_QWORD *)(v70 + 72) = v72;
  v73 = v68 + v69[16];
  *(_QWORD *)v73 = 0;
  *(_BYTE *)(v73 + 8) = 0;
  sub_2468B2684(v67, v68 + v69[20], &qword_2575E4650);
  v74 = v68 + v69[24];
  v75 = v91;
  sub_2468B2684(v91, v74, &qword_2575E4650);
  sub_2468B2480(v53, v52, v54);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2468B2480(v53, v52, v54);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2468A4D24(v92, &qword_2575E4650);
  sub_2468A4D24(v89, &qword_2575E4650);
  sub_2468B24A8(v53, v52, v54);
  swift_release();
  swift_release();
  swift_release();
  sub_2468A4D24(v93, &qword_2575E4680);
  sub_2468A4D24(v75, &qword_2575E4650);
  sub_2468A4D24(v90, &qword_2575E4650);
  sub_2468B24A8(v53, v52, v54);
  swift_release();
  swift_release();
  swift_release();
  sub_2468A4D24(v88, &qword_2575E4680);
}

void sub_2468B116C(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;

  v44 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4700);
  MEMORY[0x24BDAC7A8](v1);
  v43 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2468D5FBC();
  v41 = *(_QWORD *)(v3 - 8);
  v42 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40B8);
  MEMORY[0x24BDAC7A8](v37);
  v7 = (uint64_t *)((char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = sub_2468D6190();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E46C0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (uint64_t *)((char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E46B0);
  MEMORY[0x24BDAC7A8](v38);
  v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E46A0);
  MEMORY[0x24BDAC7A8](v40);
  v39 = (uint64_t)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2468D6184();
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BDF40B0], v8);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)v7 + *(int *)(v37 + 28), v11, v8);
  *v7 = KeyPath;
  sub_2468B2684((uint64_t)v7, (uint64_t)v14 + *(int *)(v12 + 36), &qword_2575E40B8);
  *v14 = v18;
  swift_retain();
  sub_2468A4D24((uint64_t)v7, &qword_2575E40B8);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_release();
  sub_2468D5FE0();
  v21 = v41;
  v20 = v42;
  (*(void (**)(char *, _QWORD, uint64_t))(v41 + 104))(v5, *MEMORY[0x24BDF17C8], v42);
  v22 = sub_2468D5FD4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v5, v20);
  v23 = swift_getKeyPath();
  sub_2468B2684((uint64_t)v14, (uint64_t)v16, &qword_2575E46C0);
  v24 = (uint64_t *)&v16[*(int *)(v38 + 36)];
  *v24 = v23;
  v24[1] = v22;
  sub_2468A4D24((uint64_t)v14, &qword_2575E46C0);
  v25 = objc_msgSend((id)objc_opt_self(), sel_tertiaryLabelColor);
  v26 = MEMORY[0x249561604](v25);
  v27 = swift_getKeyPath();
  v28 = v39;
  sub_2468B2684((uint64_t)v16, v39, &qword_2575E46B0);
  v29 = (uint64_t *)(v28 + *(int *)(v40 + 36));
  *v29 = v27;
  v29[1] = v26;
  sub_2468A4D24((uint64_t)v16, &qword_2575E46B0);
  v30 = (uint64_t)v43;
  sub_2468D5E24();
  v31 = sub_2468D5E30();
  __swift_storeEnumTagSinglePayload(v30, 0, 1, v31);
  v32 = swift_getKeyPath();
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4670);
  v34 = v44;
  v35 = (uint64_t *)(v44 + *(int *)(v33 + 36));
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E46E0);
  sub_2468B2684(v30, (uint64_t)v35 + *(int *)(v36 + 28), &qword_2575E4700);
  *v35 = v32;
  sub_2468B2684(v28, v34, &qword_2575E46A0);
  sub_2468A4D24(v30, &qword_2575E4700);
  sub_2468A4D24(v28, &qword_2575E46A0);
}

void sub_2468B15B8()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  uint64_t KeyPath;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t);
  uint64_t (*v47)(void);
  uint64_t v48;
  uint64_t v49;

  OUTLINED_FUNCTION_14_2();
  v46 = v1;
  v47 = v2;
  v49 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4700);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_14();
  v48 = v5;
  v6 = sub_2468D5FBC();
  v44 = *(_QWORD *)(v6 - 8);
  v45 = v6;
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_14();
  v43 = v7;
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40B8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_0();
  v11 = (uint64_t *)(v10 - v9);
  v12 = sub_2468D6190();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_13_2();
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E46C0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_0();
  v18 = (uint64_t *)(v17 - v16);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E46B0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_0();
  v22 = v21 - v20;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E46A0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_0();
  v26 = v25 - v24;
  v27 = sub_2468D6184();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v13 + 104))(v0, *MEMORY[0x24BDF40B0], v12);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)v11 + *(int *)(v40 + 28), v0, v12);
  *v11 = KeyPath;
  OUTLINED_FUNCTION_16_1((uint64_t)v11, (uint64_t)v18 + *(int *)(v14 + 36));
  *v18 = v27;
  swift_retain();
  OUTLINED_FUNCTION_10_4((uint64_t)v11);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v0, v12);
  v29 = swift_release();
  v46(v29);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v44 + 104))(v43, *MEMORY[0x24BDF17C8], v45);
  v30 = sub_2468D5FD4();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v43, v45);
  v31 = swift_getKeyPath();
  OUTLINED_FUNCTION_16_1((uint64_t)v18, v22);
  v32 = (uint64_t *)(v22 + *(int *)(v41 + 36));
  *v32 = v31;
  v32[1] = v30;
  OUTLINED_FUNCTION_10_4((uint64_t)v18);
  v33 = v47();
  v34 = swift_getKeyPath();
  OUTLINED_FUNCTION_16_1(v22, v26);
  v35 = (uint64_t *)(v26 + *(int *)(v42 + 36));
  *v35 = v34;
  v35[1] = v33;
  OUTLINED_FUNCTION_10_4(v22);
  sub_2468D5E24();
  v36 = sub_2468D5E30();
  __swift_storeEnumTagSinglePayload(v48, 0, 1, v36);
  v37 = swift_getKeyPath();
  v38 = (uint64_t *)(v49 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2575E4670) + 36));
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E46E0);
  OUTLINED_FUNCTION_16_1(v48, (uint64_t)v38 + *(int *)(v39 + 28));
  *v38 = v37;
  sub_2468B2684(v26, v49, &qword_2575E46A0);
  OUTLINED_FUNCTION_10_4(v48);
  sub_2468A4D24(v26, &qword_2575E46A0);
  OUTLINED_FUNCTION_3_6();
}

uint64_t sub_2468B193C(void **a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t result;
  uint64_t v15;

  v2 = sub_2468D5710();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (char *)a1 + *(int *)(type metadata accessor for MessageView() + 24);
  v10 = type metadata accessor for WidgetMessage();
  sub_2468B2684((uint64_t)&v9[*(int *)(v10 + 52)], (uint64_t)v8, &qword_2575E3FA8);
  v11 = sub_2468D568C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v11) == 1)
  {
    sub_2468A4D24((uint64_t)v8, &qword_2575E3FA8);
    v12 = *a1;
    if (*a1)
      goto LABEL_5;
  }
  else
  {
    sub_2468D5680();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v8, v11);
    v12 = *a1;
    if (*a1)
    {
LABEL_5:
      v13 = v12;
      sub_2468D5704();
      sub_2468D6418();

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }
  sub_2468D6430();
  sub_2468971E4();
  result = sub_2468D5C80();
  __break(1u);
  return result;
}

double sub_2468B1B18@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  double result;
  __int128 v7;
  __int128 v8;
  char v9;

  v4 = type metadata accessor for MessageView();
  v5 = a1 + *(int *)(v4 + 24);
  if (*(_QWORD *)(v5 + 24))
    v7 = *(_OWORD *)(v5 + 16);
  else
    v7 = *(_OWORD *)(a1 + *(int *)(v4 + 36));
  sub_246897B28();
  swift_bridgeObjectRetain();
  sub_2468D6058();
  sub_2468D5E3C();
  result = *(double *)&v7;
  *(_OWORD *)a2 = v7;
  *(_OWORD *)(a2 + 16) = v8;
  *(_BYTE *)(a2 + 32) = v9;
  return result;
}

double sub_2468B1C1C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  double result;
  __int128 v7;
  __int128 v8;
  char v9;

  v4 = type metadata accessor for MessageView();
  v5 = a1 + *(int *)(v4 + 24);
  if (*(_QWORD *)(v5 + 40))
    v7 = *(_OWORD *)(v5 + 32);
  else
    v7 = *(_OWORD *)(a1 + *(int *)(v4 + 40));
  sub_246897B28();
  swift_bridgeObjectRetain();
  sub_2468D6058();
  sub_2468D5E3C();
  result = *(double *)&v7;
  *(_OWORD *)a2 = v7;
  *(_OWORD *)(a2 + 16) = v8;
  *(_BYTE *)(a2 + 32) = v9;
  return result;
}

uint64_t sub_2468B1D24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MessageView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2468B1D68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_14_2();
  v1 = OUTLINED_FUNCTION_17_2();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  v4 = (char *)v3 + *(int *)(v1 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = type metadata accessor for WidgetMessage();
  v6 = &v4[*(int *)(v5 + 32)];
  v7 = sub_2468D56B0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (uint64_t)&v4[*(int *)(v5 + 52)];
  v9 = sub_2468D568C();
  if (!__swift_getEnumTagSinglePayload(v8, 1, v9))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_3();
  v10 = (char *)v3 + *(int *)(v1 + 48);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4500);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_11_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4508);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_2468D5E00();
    OUTLINED_FUNCTION_1_0(v12);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_2468B1F84()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_17_2() - 8) + 80);
  return sub_2468B193C((void **)(v0 + ((v1 + 16) & ~v1)));
}

uint64_t sub_2468B1FB0()
{
  return sub_2468CFC48();
}

uint64_t objectdestroy_2Tm()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2468B1FF8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MessageView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2468B2034()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2575E4688;
  if (!qword_2575E4688)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4678);
    v2[0] = sub_2468B22FC(&qword_2575E4690, &qword_2575E4670);
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2575E4688);
  }
  return result;
}

unint64_t sub_2468B20B8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2575E4698;
  if (!qword_2575E4698)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E46A0);
    v2 = sub_2468B213C();
    sub_2468B2244(&qword_2575E46C8, &qword_2575E46D0);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2575E4698);
  }
  return result;
}

unint64_t sub_2468B213C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2575E46A8;
  if (!qword_2575E46A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E46B0);
    v2 = sub_2468B21C0();
    sub_2468B2244(&qword_2575E38B0, &qword_2575E38B8);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2575E46A8);
  }
  return result;
}

unint64_t sub_2468B21C0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2575E46B8;
  if (!qword_2575E46B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E46C0);
    sub_2468B2244(&qword_2575E40D8, &qword_2575E40B8);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2575E46B8);
  }
  return result;
}

void sub_2468B2244(unint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;

  if (!*a1)
  {
    v4 = OUTLINED_FUNCTION_20(0, a2);
    atomic_store(MEMORY[0x249562024](v2, v4), a1);
  }
  OUTLINED_FUNCTION_3();
}

unint64_t sub_2468B2278()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2575E46E8;
  if (!qword_2575E46E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4660);
    v2[0] = sub_2468B22FC(&qword_2575E46F0, &qword_2575E4658);
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2575E46E8);
  }
  return result;
}

uint64_t sub_2468B22FC(unint64_t *a1, uint64_t *a2)
{
  uint64_t (*v2)(void);
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v5 = OUTLINED_FUNCTION_20(0, a2);
    v6 = v2();
    sub_2468B2244(&qword_2575E46D8, &qword_2575E46E0);
    v8[0] = v6;
    v8[1] = v7;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v5, v8);
    atomic_store(result, a1);
  }
  return result;
}

void sub_2468B2378()
{
  sub_2468D5C98();
  OUTLINED_FUNCTION_3();
}

void sub_2468B2394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2468B23A8(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDF40C0], MEMORY[0x24BDEDE98]);
}

void sub_2468B23A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD), void (*a6)(char *))
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v8 = a5(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v12 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v12 - v9, a1);
  a6(v10);
  OUTLINED_FUNCTION_12_1();
}

void sub_2468B241C(uint64_t a1@<X8>)
{
  char v2;

  *(_QWORD *)a1 = sub_2468D5D70();
  *(_BYTE *)(a1 + 8) = v2 & 1;
  OUTLINED_FUNCTION_3();
}

void sub_2468B244C()
{
  sub_2468D5D7C();
  OUTLINED_FUNCTION_3();
}

uint64_t sub_2468B2480(uint64_t a1, uint64_t a2, char a3)
{
  sub_2468A7034(a1, a2, a3 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2468B24A8(uint64_t a1, uint64_t a2, char a3)
{
  sub_2468A4F8C(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease();
}

void sub_2468B24D0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_14_1(a1, a2, a3);
  OUTLINED_FUNCTION_8_4(v3);
  OUTLINED_FUNCTION_3();
}

void sub_2468B24F0()
{
  sub_2468D5C98();
  OUTLINED_FUNCTION_3();
}

void sub_2468B250C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2468B23A8(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDF40C0], MEMORY[0x24BDEDE98]);
}

void sub_2468B2530(uint64_t *a1@<X8>)
{
  *a1 = sub_2468D5CE0();
  OUTLINED_FUNCTION_3();
}

uint64_t sub_2468B2554()
{
  swift_retain();
  return sub_2468D5CEC();
}

void sub_2468B2580()
{
  sub_2468D5D28();
  OUTLINED_FUNCTION_3();
}

uint64_t sub_2468B259C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4700);
  MEMORY[0x24BDAC7A8](v2);
  sub_2468B2684(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2575E4700);
  return sub_2468D5D34();
}

unint64_t sub_2468B2620()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2575E4740;
  if (!qword_2575E4740)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4730);
    v2[0] = sub_2468B2034();
    v2[1] = v2[0];
    result = MEMORY[0x249562024](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2575E4740);
  }
  return result;
}

void sub_2468B2684(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_14_1(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void sub_2468B26B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_8_4(v3);
  OUTLINED_FUNCTION_3();
}

void sub_2468B26E4()
{
  sub_2468D5CBC();
  OUTLINED_FUNCTION_3();
}

void sub_2468B2700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2468B23A8(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDEEEA0], MEMORY[0x24BDEDF98]);
}

uint64_t sub_2468B2724()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E45F0);
  sub_2468B2244(&qword_2575E4608, &qword_2575E45F0);
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 104) = 0;
  return sub_2468D61A8();
}

double OUTLINED_FUNCTION_7_4()
{
  uint64_t v0;
  uint64_t v1;
  double result;
  uint64_t v3;

  result = *(double *)(v1 - 96);
  v3 = *(_QWORD *)(v1 - 88);
  *(double *)v0 = result;
  *(_QWORD *)(v0 + 8) = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_8_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v1, v2, a1);
}

void OUTLINED_FUNCTION_10_4(uint64_t a1)
{
  uint64_t *v1;

  sub_2468A4D24(a1, v1);
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return swift_release();
}

void OUTLINED_FUNCTION_16_1(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_2468B2684(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_17_2()
{
  return type metadata accessor for MessageView();
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return type metadata accessor for WidgetMessage();
}

void destroy for RecipientTextView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for RecipientTextView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  v7 = *(void **)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v7;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v8 = v7;
  return a1;
}

uint64_t assignWithCopy for RecipientTextView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 88);
  v5 = *(void **)(a2 + 88);
  *(_QWORD *)(a1 + 88) = v5;
  v6 = v5;

  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  return a1;
}

void *__swift_memcpy104_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x68uLL);
}

uint64_t assignWithTake for RecipientTextView(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  swift_release();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_release();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 88);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);

  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for RecipientTextView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 104))
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

uint64_t storeEnumTagSinglePayload for RecipientTextView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 104) = 1;
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
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for RecipientTextView()
{
  return &type metadata for RecipientTextView;
}

uint64_t sub_2468B2BF8()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_2468B2C04()
{
  _QWORD *v0;
  id v1;

  v1 = objc_allocWithZone((Class)type metadata accessor for RecipientViewController_Phone());
  sub_2468B32FC((uint64_t)v0);
  return sub_2468B3BB4(v0);
}

uint64_t sub_2468B2C40(void *a1)
{
  const void *v1;
  const void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_2468D62A4();
  v21 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2468D62BC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2575E3828 != -1)
    swift_once();
  v11 = sub_2468D5AD0();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.siriMail);
  v12 = sub_2468D5AB8();
  v13 = sub_2468D6544();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_246894000, v12, v13, "RecipientTextView.updateUIViewController(_:context:)", v14, 2u);
    MEMORY[0x24956209C](v14, -1, -1);
  }

  sub_2468B3230();
  v15 = (void *)sub_2468D6550();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a1;
  memcpy((void *)(v16 + 24), v2, 0x68uLL);
  aBlock[4] = sub_2468B32D8;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2468B2FBC;
  aBlock[3] = &block_descriptor;
  v17 = _Block_copy(aBlock);
  v18 = a1;
  sub_2468B32FC((uint64_t)v2);
  swift_release();
  sub_2468D62B0();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_2468986A8((unint64_t *)&unk_2575E49E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4760);
  sub_2468B3394();
  sub_2468D65BC();
  MEMORY[0x2495619E8](0, v10, v6, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_2468B2EF4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v0 = sub_2468B3734();
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4768);
  MEMORY[0x24956167C](&v3);
  v2 = sub_2468B34F4(v0, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v2 & 1) == 0)
  {
    MEMORY[0x24956167C](&v3, v1);
    sub_2468B37A4(v3);
  }
}

uint64_t sub_2468B2FBC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2468B2FE8()
{
  const void *v0;
  _BYTE __dst[104];

  memcpy(__dst, v0, sizeof(__dst));
  return sub_2468B2C04();
}

uint64_t sub_2468B3020(void *a1)
{
  const void *v1;
  _BYTE __dst[104];

  memcpy(__dst, v1, sizeof(__dst));
  return sub_2468B2C40(a1);
}

uint64_t sub_2468B306C()
{
  return sub_2468D5E84();
}

uint64_t sub_2468B30A4()
{
  sub_2468B3678();
  return sub_2468D5EC0();
}

uint64_t sub_2468B30F4()
{
  sub_2468B3678();
  return sub_2468D5E90();
}

void sub_2468B3144()
{
  sub_2468B3678();
  sub_2468D5EB4();
  __break(1u);
}

unint64_t sub_2468B316C()
{
  unint64_t result;

  result = qword_2575E4750;
  if (!qword_2575E4750)
  {
    result = MEMORY[0x249562024](&unk_2468D8574, &type metadata for RecipientTextView);
    atomic_store(result, (unint64_t *)&qword_2575E4750);
  }
  return result;
}

uint64_t sub_2468B31A8()
{
  void *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend((id)objc_opt_self(), sel_stringFromContact_style_, v0, 0);
  if (!v1)
    v1 = objc_msgSend(v0, sel_givenName);
  v2 = sub_2468D6484();

  return v2;
}

unint64_t sub_2468B3230()
{
  unint64_t result;

  result = qword_2575E4758;
  if (!qword_2575E4758)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2575E4758);
  }
  return result;
}

uint64_t sub_2468B326C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_2468B32D8()
{
  sub_2468B2EF4();
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

uint64_t sub_2468B32FC(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 88);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_2468B3394()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2575E49F0;
  if (!qword_2575E49F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4760);
    result = MEMORY[0x249562024](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2575E49F0);
  }
  return result;
}

uint64_t sub_2468B33D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  BOOL v17;
  uint64_t v19;

  v4 = type metadata accessor for WidgetMessage();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (uint64_t *)((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v5);
  v10 = (uint64_t *)((char *)&v19 - v9);
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v15 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v13 = *(_QWORD *)(v8 + 72);
      v14 = v11 - 1;
      do
      {
        sub_2468B36B4(a1 + v12, (uint64_t)v10);
        sub_2468B36B4(a2 + v12, (uint64_t)v7);
        v15 = static WidgetMessage.__derived_struct_equals(_:_:)(v10, v7);
        sub_2468B36F8((uint64_t)v7);
        sub_2468B36F8((uint64_t)v10);
        v17 = v14-- != 0;
        if ((v15 & 1) == 0)
          break;
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_2468B34F4(uint64_t a1, uint64_t a2)
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

  v4 = sub_2468D595C();
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
        sub_2468986A8(&qword_2575E4770, (uint64_t (*)(uint64_t))MEMORY[0x24BE99C60], MEMORY[0x24BE99C78]);
        v17 = sub_2468D6460();
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

unint64_t sub_2468B3678()
{
  unint64_t result;

  result = qword_2575E4778;
  if (!qword_2575E4778)
  {
    result = MEMORY[0x249562024](&unk_2468D85C4, &type metadata for RecipientTextView);
    atomic_store(result, (unint64_t *)&qword_2575E4778);
  }
  return result;
}

uint64_t sub_2468B36B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WidgetMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2468B36F8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for WidgetMessage();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2468B3734()
{
  uint64_t v0;
  uint64_t result;
  unint64_t v2;
  size_t v3;

  result = sub_2468B6ED4(*(void **)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView));
  if (result)
  {
    v2 = sub_2468B640C(result);
    swift_bridgeObjectRelease();
    v3 = sub_2468B39F8(v2);
    OUTLINED_FUNCTION_8_5();
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2468B37A4(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  int64_t v4;
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
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView);
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v21 = *(void **)(v1 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView);
    v24 = MEMORY[0x24BEE4AF8];
    sub_2468B69FC(0, v4, 0);
    v5 = v24;
    sub_2468D595C();
    OUTLINED_FUNCTION_26();
    v7 = a1 + v6;
    v9 = *(_QWORD *)(v8 + 72);
    while (1)
    {
      v10 = sub_2468D5950();
      v12 = v11;
      v13 = sub_2468D5944();
      v15 = v14;
      v16 = objc_allocWithZone(MEMORY[0x24BE19158]);
      v17 = OUTLINED_FUNCTION_37(0, v10, v12, v13, v15);
      if (!v17)
        break;
      v18 = v17;
      v23 = sub_2468B72FC(0, &qword_2575E4978);
      v24 = v5;
      *(_QWORD *)&v22 = v18;
      v20 = *(_QWORD *)(v5 + 16);
      v19 = *(_QWORD *)(v5 + 24);
      if (v20 >= v19 >> 1)
      {
        sub_2468B69FC((char *)(v19 > 1), v20 + 1, 1);
        v5 = v24;
      }
      *(_QWORD *)(v5 + 16) = v20 + 1;
      sub_2468B6A18(&v22, (_OWORD *)(v5 + 32 * v20 + 32));
      v7 += v9;
      if (!--v4)
      {
        swift_bridgeObjectRelease();
        v3 = v21;
        goto LABEL_9;
      }
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v5 = MEMORY[0x24BEE4AF8];
LABEL_9:
    sub_2468B7154(v5, v3, MEMORY[0x24BEE4AD8] + 8, (SEL *)&selRef_setRecipients_);
  }
}

uint64_t sub_2468B3950(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t result;
  uint64_t v5;

  v2 = OUTLINED_FUNCTION_33(a1, sel_contact);
  if (v2)
  {
    v3 = v2;
    sub_2468B31A8();

  }
  else
  {
    sub_2468B6F2C(v1, (SEL *)&selRef_displayString);
  }
  result = sub_2468B6F2C(v1, (SEL *)&selRef_address);
  if (v5)
    return sub_2468D5938();
  __break(1u);
  return result;
}

size_t sub_2468B39F8(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  size_t result;
  uint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  unint64_t v14;
  _QWORD v15[2];
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v17 = sub_2468D595C();
  v4 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_15;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v8 = MEMORY[0x24BEE4AF8];
    if (!v7)
      return v8;
    v18 = MEMORY[0x24BEE4AF8];
    result = sub_2468B69D0(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0)
      break;
    v10 = 0;
    v8 = v18;
    v15[1] = v2;
    v16 = a1 & 0xC000000000000001;
    v11 = a1;
    while (v7 != v10)
    {
      if (v16)
        v12 = (id)MEMORY[0x249561A84](v10, a1);
      else
        v12 = *(id *)(a1 + 8 * v10 + 32);
      v13 = v12;
      sub_2468B3950((uint64_t)v12);

      v18 = v8;
      v2 = *(_QWORD *)(v8 + 16);
      v14 = *(_QWORD *)(v8 + 24);
      if (v2 >= v14 >> 1)
      {
        sub_2468B69D0(v14 > 1, v2 + 1, 1);
        v8 = v18;
      }
      ++v10;
      *(_QWORD *)(v8 + 16) = v2 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72) * v2, v6, v17);
      a1 = v11;
      if (v7 == v10)
        return v8;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v7 = sub_2468D667C();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_2468B3BB4(_QWORD *a1)
{
  char *v1;
  char *v2;
  objc_class *v4;
  uint64_t v5;
  id v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char *v12;
  void *v13;
  char *v14;
  void *v15;
  id v16;
  uint64_t result;
  objc_super v18;

  v2 = v1;
  v4 = (objc_class *)OUTLINED_FUNCTION_23_1();
  v5 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView;
  v6 = objc_allocWithZone((Class)OUTLINED_FUNCTION_27());
  v7 = v2;
  *(_QWORD *)&v2[v5] = objc_msgSend(v6, sel_init);
  *(_QWORD *)&v7[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeViewHeightConstraint] = 0;
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_2468D667C())
    v8 = sub_2468B6C4C(MEMORY[0x24BEE4AF8]);
  else
    v8 = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v7[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_cancellables] = v8;
  v9 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewController;
  *(_QWORD *)&v7[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE19138]), sel_init);
  v10 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView;
  *(_QWORD *)&v7[v10] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD9F0]), sel_init);
  *(_QWORD *)&v7[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewHeightConstraint] = 0;
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE19150]), sel_initWithAutocompleteSearchType_, 0);
  if (v11)
  {
    *(_QWORD *)&v7[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_searchManager] = v11;
    v7[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_foundSearchResults] = 0;
    *(_QWORD *)&v7[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_currentSearchTaskID] = 0;
    memcpy(&v7[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container], a1, 0x68uLL);
    sub_2468B32FC((uint64_t)a1);

    v18.receiver = v7;
    v18.super_class = v4;
    v12 = (char *)objc_msgSendSuper2(&v18, sel_initWithNibName_bundle_, 0, 0);
    v13 = *(void **)&v12[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_searchManager];
    v14 = v12;
    objc_msgSend(v13, sel_setSearchTypes_, 2);
    v15 = (void *)a1[11];
    if (v15)
    {
      v16 = v15;
      sub_2468D6400();

      OUTLINED_FUNCTION_13_1();
      swift_unknownObjectWeakInit();
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_41(&qword_2575E49A0);
      sub_2468D5B0C();
      swift_release();
      swift_release();
      swift_beginAccess();
      sub_2468D5ADC();
      swift_endAccess();
      sub_2468B6FF0((uint64_t)a1);
      OUTLINED_FUNCTION_34();

      return (uint64_t)v14;
    }
  }
  else
  {
    __break(1u);
  }
  OUTLINED_FUNCTION_11_4();
  sub_2468B71E0(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  result = OUTLINED_FUNCTION_0_6();
  __break(1u);
  return result;
}

void sub_2468B3E78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;

  v4 = sub_2468D640C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (uint64_t *)((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  if ((*(unsigned int (**)(_QWORD *, uint64_t))(v5 + 88))(v7, v4) == *MEMORY[0x24BEAE4E0])
  {
    (*(void (**)(_QWORD *, uint64_t))(v5 + 96))(v7, v4);
    if (*v7 == 4)
    {
      swift_beginAccess();
      v8 = MEMORY[0x2495620FC](a2 + 16);
      if (v8)
      {
        v9 = (void *)v8;
        v10 = *(id *)(v8 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView);

        objc_msgSend(v10, sel_resignFirstResponder);
      }
    }
  }
  else
  {
    (*(void (**)(_QWORD *, uint64_t))(v5 + 8))(v7, v4);
  }
}

void sub_2468B3FA4()
{
  _BYTE *v0;
  uint64_t v1;
  id v2;
  uint64_t i;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v1 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView;
  v2 = objc_allocWithZone((Class)OUTLINED_FUNCTION_27());
  *(_QWORD *)&v0[v1] = OUTLINED_FUNCTION_29(v2);
  *(_QWORD *)&v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeViewHeightConstraint] = 0;
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0)
    goto LABEL_5;
LABEL_2:
  for (i = MEMORY[0x24BEE4B08]; ; i = sub_2468B6C4C(MEMORY[0x24BEE4AF8]))
  {
    *(_QWORD *)&v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_cancellables] = i;
    v4 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewController;
    *(_QWORD *)&v0[v4] = OUTLINED_FUNCTION_29(objc_allocWithZone(MEMORY[0x24BE19138]));
    v5 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView;
    *(_QWORD *)&v0[v5] = OUTLINED_FUNCTION_29(objc_allocWithZone(MEMORY[0x24BEBD9F0]));
    *(_QWORD *)&v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewHeightConstraint] = 0;
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE19150]), sel_initWithAutocompleteSearchType_, 0);
    if (v6)
      break;
    __break(1u);
LABEL_5:
    if (!sub_2468D667C())
      goto LABEL_2;
  }
  *(_QWORD *)&v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_searchManager] = v6;
  v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_foundSearchResults] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_currentSearchTaskID] = 0;

  static Logger.logAndCrash(_:file:line:)(0xD000000000000025, 0x80000002468DAA30, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriMail/SiriMailUI/View/SendMail/Interactive/RecipientTextView/RecipientViewController_Phone.swift", 137, 2, 78);
  __break(1u);
}

void sub_2468B40FC()
{
  char *v0;
  char *v1;
  void *v2;
  char **v3;
  char *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
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
  id v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *ObjCClassFromMetadata;
  id v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  void *v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  id v73;
  id v74;
  void *v75;
  id v76;
  uint64_t v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  char *v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  uint64_t v107;
  __int128 v108;
  uint64_t v109;
  objc_super v110;

  v1 = v0;
  v110.receiver = v0;
  v110.super_class = (Class)OUTLINED_FUNCTION_23_1();
  objc_msgSendSuper2(&v110, sel_viewDidLoad);
  v2 = *(void **)&v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView];
  v3 = &off_2517E5000;
  OUTLINED_FUNCTION_14_3(v2, sel_setDelegate_);
  v4 = &v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container];
  v5 = (void *)sub_2468D646C();
  OUTLINED_FUNCTION_14_3(v2, sel_setLabel_);

  v6 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE220]);
  sub_246897C10(v6);
  objc_msgSend(v2, sel_setSeparatorHidden_, 1);
  objc_msgSend(v2, sel_setBackgroundColor_, 0);
  v107 = *((_QWORD *)v4 + 8);
  v108 = *(_OWORD *)(v4 + 72);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4768);
  MEMORY[0x24956167C](&v105, v7);
  v8 = v105;
  v9 = *(_QWORD *)(v105 + 16);
  if (v9)
  {
    v102 = v2;
    v103 = v1;
    *(_QWORD *)&v105 = MEMORY[0x24BEE4AF8];
    sub_2468B69FC(0, v9, 0);
    v10 = v105;
    sub_2468D595C();
    OUTLINED_FUNCTION_26();
    v12 = v8 + v11;
    v14 = *(_QWORD *)(v13 + 72);
    while (1)
    {
      v15 = sub_2468D5950();
      v17 = v16;
      v18 = sub_2468D5944();
      v20 = v19;
      v21 = objc_allocWithZone(MEMORY[0x24BE19158]);
      v22 = OUTLINED_FUNCTION_37(0, v15, v17, v18, v20);
      if (!v22)
        break;
      v23 = (uint64_t)v22;
      v109 = sub_2468B72FC(0, &qword_2575E4978);
      v107 = v23;
      *(_QWORD *)&v105 = v10;
      v25 = *(_QWORD *)(v10 + 16);
      v24 = *(_QWORD *)(v10 + 24);
      if (v25 >= v24 >> 1)
      {
        sub_2468B69FC((char *)(v24 > 1), v25 + 1, 1);
        v10 = v105;
      }
      *(_QWORD *)(v10 + 16) = v25 + 1;
      sub_2468B6A18(&v107, (_OWORD *)(v10 + 32 * v25 + 32));
      v12 += v14;
      if (!--v9)
      {
        swift_bridgeObjectRelease();
        v2 = v102;
        v1 = v103;
        v3 = &off_2517E5000;
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  swift_bridgeObjectRelease();
  v10 = MEMORY[0x24BEE4AF8];
LABEL_9:
  sub_2468B7154(v10, v2, MEMORY[0x24BEE4AD8] + 8, (SEL *)&selRef_setRecipients_);
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v26 = OUTLINED_FUNCTION_19_0();
  if (!v26)
    goto LABEL_24;
  v27 = v26;
  objc_msgSend(v26, sel_addSubview_, v2);

  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewController], v3[376], v1);
  v28 = OUTLINED_FUNCTION_14_3(v1, sel_addChildViewController_);
  v29 = OUTLINED_FUNCTION_33((uint64_t)v28, sel_tableView);
  if (!v29)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v30 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView;
  v31 = *(void **)&v1[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView] = v29;

  v32 = *(void **)&v1[v30];
  objc_opt_self();
  v33 = v32;
  v34 = OUTLINED_FUNCTION_33((uint64_t)v33, sel_clearColor);
  OUTLINED_FUNCTION_14_3(v33, sel_setBackgroundColor_);

  objc_msgSend(*(id *)&v1[v30], sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(*(id *)&v1[v30], sel_setKeyboardDismissMode_, 1);
  OUTLINED_FUNCTION_36(*(id *)&v1[v30], sel_setEstimatedRowHeight_);
  OUTLINED_FUNCTION_36(*(id *)&v1[v30], sel_setEstimatedSectionHeaderHeight_);
  OUTLINED_FUNCTION_36(*(id *)&v1[v30], sel_setEstimatedSectionFooterHeight_);
  objc_msgSend(*(id *)&v1[v30], sel_setHidden_, 1);
  v35 = OUTLINED_FUNCTION_19_0();
  if (!v35)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v36 = v35;
  objc_msgSend(v35, sel_addSubview_, *(_QWORD *)&v1[v30]);

  OUTLINED_FUNCTION_6_7(v37, &qword_2575E4A10);
  v109 = OUTLINED_FUNCTION_27();
  v107 = (uint64_t)v2;
  OUTLINED_FUNCTION_6_7(v109, &qword_2575E4A18);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v105 = 0u;
  v106 = 0u;
  v39 = v2;
  objc_msgSend(ObjCClassFromMetadata, sel_preferredHeight);
  v43 = OUTLINED_FUNCTION_22_1(&v107, 1.0, v42, v40, v41, &v105);
  v44 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeViewHeightConstraint;
  v45 = *(void **)&v1[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeViewHeightConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeViewHeightConstraint] = v43;

  v46 = *(void **)&v1[v30];
  v109 = OUTLINED_FUNCTION_6_7(v47, &qword_2575E4A20);
  v107 = (uint64_t)v46;
  v105 = 0u;
  v106 = 0u;
  v48 = v46;
  v51 = OUTLINED_FUNCTION_22_1(&v107, 1.0, 0.0, v49, v50, &v105);
  v52 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewHeightConstraint;
  v53 = *(void **)&v1[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewHeightConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewHeightConstraint] = v51;

  v55 = *(void **)&v1[v44];
  if (!v55)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  LODWORD(v54) = 1144750080;
  objc_msgSend(v55, sel_setPriority_, v54);
  v104 = v52;
  v57 = *(void **)&v1[v52];
  if (!v57)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  LODWORD(v56) = 1132068864;
  objc_msgSend(v57, sel_setPriority_, v56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4A28);
  v58 = OUTLINED_FUNCTION_13_1();
  *(_OWORD *)(v58 + 16) = xmmword_2468D8640;
  v59 = OUTLINED_FUNCTION_17_3(v58, sel_topAnchor);
  v60 = OUTLINED_FUNCTION_19_0();
  if (!v60)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v61 = v60;
  v62 = objc_msgSend(v60, sel_topAnchor);
  OUTLINED_FUNCTION_25();
  v64 = OUTLINED_FUNCTION_12_3(v63, sel_constraintEqualToAnchor_);
  OUTLINED_FUNCTION_2_6();

  *(_QWORD *)(v58 + 32) = v61;
  v66 = OUTLINED_FUNCTION_17_3(v65, sel_leadingAnchor);
  v67 = OUTLINED_FUNCTION_1_4((uint64_t)v66, sel_view);
  if (!v67)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v68 = v67;
  v69 = OUTLINED_FUNCTION_42(v67);
  OUTLINED_FUNCTION_25();
  v71 = OUTLINED_FUNCTION_12_3(v70, sel_constraintEqualToAnchor_);
  OUTLINED_FUNCTION_2_6();

  *(_QWORD *)(v58 + 40) = v68;
  v73 = OUTLINED_FUNCTION_17_3(v72, sel_trailingAnchor);
  v74 = OUTLINED_FUNCTION_1_4((uint64_t)v73, sel_view);
  if (!v74)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v75 = v74;
  v76 = objc_msgSend(v74, sel_trailingAnchor);
  OUTLINED_FUNCTION_25();
  v78 = OUTLINED_FUNCTION_12_3(v77, sel_constraintEqualToAnchor_);
  OUTLINED_FUNCTION_2_6();

  *(_QWORD *)(v58 + 48) = v75;
  v79 = *(void **)&v1[v44];
  if (!v79)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  *(_QWORD *)(v58 + 56) = v79;
  v80 = *(void **)&v1[v30];
  v81 = v79;
  v82 = objc_msgSend(v80, sel_topAnchor);
  v83 = OUTLINED_FUNCTION_17_3((uint64_t)v82, sel_bottomAnchor);
  v84 = objc_msgSend(v82, sel_constraintEqualToAnchor_, v83);
  OUTLINED_FUNCTION_2_6();

  *(_QWORD *)(v58 + 64) = v75;
  v85 = OUTLINED_FUNCTION_42(*(void **)&v1[v30]);
  v86 = OUTLINED_FUNCTION_1_4((uint64_t)v85, sel_view);
  if (!v86)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v87 = v86;
  v88 = OUTLINED_FUNCTION_42(v86);
  OUTLINED_FUNCTION_2_6();
  v89 = OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_43();

  *(_QWORD *)(v58 + 72) = v87;
  v90 = OUTLINED_FUNCTION_1_4((uint64_t)objc_msgSend(*(id *)&v1[v30], sel_trailingAnchor), sel_view);
  if (!v90)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v91 = v90;
  v92 = objc_msgSend(v90, sel_trailingAnchor);
  OUTLINED_FUNCTION_2_6();
  v93 = OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_43();

  *(_QWORD *)(v58 + 80) = v91;
  v94 = OUTLINED_FUNCTION_1_4((uint64_t)objc_msgSend(*(id *)&v1[v30], sel_bottomAnchor), sel_view);
  if (!v94)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v95 = v94;
  v96 = objc_msgSend(v94, sel_bottomAnchor);
  OUTLINED_FUNCTION_2_6();
  v97 = OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_43();

  *(_QWORD *)(v58 + 88) = v95;
  v98 = *(void **)&v1[v104];
  if (v98)
  {
    v99 = (void *)objc_opt_self();
    *(_QWORD *)(v58 + 96) = v98;
    v107 = v58;
    sub_2468D64FC();
    v100 = v98;
    v101 = (void *)sub_2468D64E4();
    OUTLINED_FUNCTION_8_5();
    objc_msgSend(v99, sel_activateConstraints_, v101);

    return;
  }
LABEL_36:
  __break(1u);
}

id sub_2468B496C(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, double a6, double a7)
{
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  id v23;
  uint64_t v25;
  uint64_t v26;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v14 = sub_2468D676C();
  v15 = a4[3];
  if (v15)
  {
    v16 = __swift_project_boxed_opaque_existential_1(a4, a4[3]);
    v25 = a5;
    v26 = a2;
    v17 = a3;
    v18 = *(_QWORD *)(v15 - 8);
    MEMORY[0x24BDAC7A8](v16);
    v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v18 + 16))(v20);
    v21 = sub_2468D676C();
    v22 = *(void (**)(char *, uint64_t))(v18 + 8);
    a3 = v17;
    v22(v20, v15);
    a5 = v25;
    a2 = v26;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a4);
  }
  else
  {
    v21 = 0;
  }
  v23 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_, v14, a2, a3, v21, a5, a6, a7);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v23;
}

id sub_2468B4B14()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_23_1();
  objc_msgSendSuper2(&v2, sel_viewDidLayoutSubviews);
  return sub_2468B4B48();
}

id sub_2468B4B48()
{
  void *v0;
  id result;
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double Width;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;

  result = objc_msgSend(v0, sel_view);
  if (result)
  {
    v2 = result;
    objc_msgSend(result, sel_bounds);
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;

    v17.origin.x = v4;
    v17.origin.y = v6;
    v17.size.width = v8;
    v17.size.height = v10;
    Width = CGRectGetWidth(v17);
    result = objc_msgSend(v0, sel_view);
    if (result)
    {
      v12 = result;
      objc_msgSend(result, sel_systemLayoutSizeFittingSize_, Width, *(double *)(MEMORY[0x24BEBE588] + 8));
      v14 = v13;
      v16 = v15;

      return objc_msgSend(v0, sel_setPreferredContentSize_, v14, v16);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_2468B4C64(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  void *v11;
  id v12;

  v3 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView);
  if (a1 >> 62)
  {
    v12 = v4;
    swift_bridgeObjectRetain();
    v5 = sub_2468D667C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = v4;
  }
  objc_msgSend(v4, sel_setHidden_, v5 == 0);

  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView), sel_setSeparatorHidden_, objc_msgSend(*(id *)(v1 + v3), sel_isHidden));
  sub_2468B7088(a1, *(void **)(v1 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewController));
  v7 = *(void **)(v1 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewHeightConstraint);
  if (v7)
  {
    v8 = *(void **)(v1 + v3);
    v9 = v7;
    objc_msgSend(v8, sel_contentSize);
    objc_msgSend(v9, sel_setConstant_, v10);

    objc_msgSend(*(id *)(v1 + v3), sel_setNeedsUpdateConstraints);
    v11 = *(void **)(v1 + v3);
    swift_retain();
    swift_retain();
    objc_msgSend(v11, sel_isHidden);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E49C0);
    sub_2468D61FC();
    swift_release();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

void sub_2468B4E0C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_2468B4E5C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_23_1();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for RecipientViewController_Phone()
{
  return objc_opt_self();
}

void sub_2468B4FAC()
{
  char *v0;
  char *v1;
  void *v2;
  id v3;

  v1 = &v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container];
  OUTLINED_FUNCTION_32();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E49C0);
  OUTLINED_FUNCTION_4_7();
  v2 = (void *)*((_QWORD *)v1 + 11);
  if (v2)
  {
    v3 = v2;
    OUTLINED_FUNCTION_38();

  }
  else
  {
    OUTLINED_FUNCTION_11_4();
    sub_2468B71E0(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    OUTLINED_FUNCTION_0_6();
    __break(1u);
  }
}

void sub_2468B5084()
{
  char *v0;
  char *v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  v1 = &v0[OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container];
  OUTLINED_FUNCTION_32();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E49C0);
  OUTLINED_FUNCTION_4_7();
  v2 = (void *)*((_QWORD *)v1 + 11);
  if (!v2)
    goto LABEL_14;
  v3 = v2;
  OUTLINED_FUNCTION_38();

  v5 = OUTLINED_FUNCTION_1_4(v4, sel_emailAddresses);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4A08);
  v6 = sub_2468D64F0();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v11 = sub_2468D667C();
    OUTLINED_FUNCTION_8_5();
    if (v11)
      goto LABEL_4;
LABEL_10:
    OUTLINED_FUNCTION_8_5();
LABEL_11:
    OUTLINED_FUNCTION_16_2();
    return;
  }
  if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_10;
LABEL_4:
  if ((v6 & 0xC000000000000001) != 0)
  {
    v7 = (id)MEMORY[0x249561A84](0, v6);
LABEL_7:
    v8 = v7;
    v9 = OUTLINED_FUNCTION_8_5();
    v10 = OUTLINED_FUNCTION_17_3(v9, sel_value);

    if (v10)
    {
      sub_2468D6478();

    }
    goto LABEL_11;
  }
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(id *)(v6 + 32);
    goto LABEL_7;
  }
  __break(1u);
LABEL_14:
  OUTLINED_FUNCTION_11_4();
  sub_2468B71E0(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
  OUTLINED_FUNCTION_0_6();
  __break(1u);
}

void sub_2468B52B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v13[2];
  _QWORD v14[2];
  char v15;
  uint64_t v16;

  v1 = v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container + 48);
  v3 = *(_BYTE *)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container + 56);
  v14[0] = *(_QWORD *)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container + 40);
  v14[1] = v2;
  v15 = v3;
  LOBYTE(v13[0]) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E49C0);
  sub_2468D61FC();
  v4 = *(void **)(v1 + 88);
  if (v4)
  {
    v5 = v4;
    OUTLINED_FUNCTION_38();

    if (OUTLINED_FUNCTION_1_4(v6, sel_value))
    {
      sub_2468D65B0();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v13, 0, sizeof(v13));
    }
    sub_2468B7274((uint64_t)v13, (uint64_t)v14);
    if (v16)
    {
      v7 = swift_dynamicCast();
      if ((v7 & 1) != 0)
      {
        v8 = OUTLINED_FUNCTION_1_4(v7, sel_contact);
        v9 = objc_allocWithZone(MEMORY[0x24BE19158]);
        v10 = sub_2468B6504(v8, v11, v12, 0);
        OUTLINED_FUNCTION_13_3((uint64_t)v10, sel_addRecipient_);

      }
    }
    else
    {
      sub_2468B72BC((uint64_t)v14);
    }
  }
  else
  {
    OUTLINED_FUNCTION_11_4();
    sub_2468B71E0(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    OUTLINED_FUNCTION_0_6();
    __break(1u);
  }
}

void sub_2468B54B0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeViewHeightConstraint);
  if (v1)
  {
    v2 = *(void **)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView);
    v3 = v1;
    v4 = OUTLINED_FUNCTION_1_4((uint64_t)v3, sel_textView);
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, sel_contentSize);
      v7 = v6;

      objc_msgSend(v3, sel_setConstant_, v7);
      objc_msgSend(v2, sel_setNeedsUpdateConstraints);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_2468B5618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v10 = sub_2468D62A4();
  v11 = OUTLINED_FUNCTION_24_0(v10);
  MEMORY[0x24BDAC7A8](v11);
  v18 = OUTLINED_FUNCTION_3_7();
  v12 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_7_3();
  OUTLINED_FUNCTION_6_7(v13, (unint64_t *)&qword_2575E4758);
  v14 = (void *)sub_2468D6550();
  v15 = OUTLINED_FUNCTION_13_1();
  *(_QWORD *)(v15 + 16) = v5;
  aBlock[4] = a4;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2468B2FBC;
  aBlock[3] = a5;
  v16 = _Block_copy(aBlock);
  v17 = v5;
  OUTLINED_FUNCTION_34();
  sub_2468D62B0();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_2468B71E0((uint64_t *)&unk_2575E49E0, (void (*)(uint64_t))MEMORY[0x24BEE5458]);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_41(&qword_2575E49F0);
  sub_2468D65BC();
  MEMORY[0x2495619E8](0, v7, v6, v16);
  _Block_release(v16);

  OUTLINED_FUNCTION_15_1();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v7, v18);
  OUTLINED_FUNCTION_3_6();
}

void sub_2468B5824(id a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  if (a1)
  {
    if (a3)
      a3 = sub_2468D646C();
    v4 = (void *)a3;
    objc_msgSend(a1, sel_addAddress_);
    OUTLINED_FUNCTION_7_5(v4);
  }
  else
  {
    __break(1u);
  }
}

id sub_2468B58F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  v5 = objc_allocWithZone(MEMORY[0x24BE19158]);
  swift_bridgeObjectRetain();
  return sub_2468B6504(0, a2, a3, 0);
}

void sub_2468B59C4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD aBlock[6];

  v6 = v3;
  v9 = sub_2468D62A4();
  v10 = OUTLINED_FUNCTION_24_0(v9);
  MEMORY[0x24BDAC7A8](v10);
  v11 = OUTLINED_FUNCTION_3_7();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_7_3();
  if (a3)
  {
    sub_2468B5B84(a2, a3);
    OUTLINED_FUNCTION_6_7(v13, (unint64_t *)&qword_2575E4758);
    v14 = (void *)sub_2468D6550();
    v15 = OUTLINED_FUNCTION_13_1();
    *(_QWORD *)(v15 + 16) = v6;
    aBlock[4] = sub_2468B71B0;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2468B2FBC;
    aBlock[3] = &block_descriptor_0;
    v16 = _Block_copy(aBlock);
    v17 = v6;
    OUTLINED_FUNCTION_34();
    sub_2468D62B0();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_2468B71E0((uint64_t *)&unk_2575E49E0, (void (*)(uint64_t))MEMORY[0x24BEE5458]);
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_41(&qword_2575E49F0);
    sub_2468D65BC();
    MEMORY[0x2495619E8](0, v5, v4, v16);
    _Block_release(v16);

    OUTLINED_FUNCTION_15_1();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v5, v11);
    OUTLINED_FUNCTION_3_6();
  }
  else
  {
    __break(1u);
  }
}

void sub_2468B5B84(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  *(_BYTE *)(v2 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_foundSearchResults) = 0;
  v5 = *(void **)(v2 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_searchManager);
  v6 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_currentSearchTaskID;
  if (*(_QWORD *)(v2 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_currentSearchTaskID))
  {
    objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_searchManager), sel_cancelTaskWithID_);
    v7 = *(void **)(v2 + v6);
    *(_QWORD *)(v2 + v6) = 0;

  }
  v8 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v8 = a1 & 0xFFFFFFFFFFFFLL;
  if (v8)
  {
    v9 = sub_2468B70F0(a1, a2, 0, v2, v5);
    v10 = *(void **)(v2 + v6);
    *(_QWORD *)(v2 + v6) = v9;

  }
  else
  {
    sub_2468B4C64(MEMORY[0x24BEE4AF8]);
  }
}

uint64_t sub_2468B5C48()
{
  sub_2468B3734();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4768);
  return sub_2468D61FC();
}

void sub_2468B5D74(uint64_t a1, void (*a2)(void))
{
  uint64_t v2;
  void *v3;
  id v5;

  v3 = *(void **)(v2 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_container + 88);
  if (v3)
  {
    v5 = v3;
    a2();
    OUTLINED_FUNCTION_7_5(v5);
  }
  else
  {
    OUTLINED_FUNCTION_11_4();
    sub_2468B71E0(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    OUTLINED_FUNCTION_0_6();
    __break(1u);
  }
}

void sub_2468B5E3C()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E49C0);
  OUTLINED_FUNCTION_4_7();
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBAE78]), sel_init);
  objc_msgSend(v2, sel_setDelegate_, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E49C8);
  v3 = OUTLINED_FUNCTION_13_1();
  *(_OWORD *)(v3 + 16) = xmmword_2468D8650;
  *(_QWORD *)(v3 + 32) = sub_2468D6484();
  *(_QWORD *)(v3 + 40) = v4;
  sub_2468B7154(v3, v2, MEMORY[0x24BEE0D00], (SEL *)&selRef_setDisplayedPropertyKeys_);
  OUTLINED_FUNCTION_6_7(v5, (unint64_t *)&unk_2575E49D0);
  v6 = (void *)OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_30((uint64_t)v6, sel_setPredicateForEnablingContact_);

  v7 = (void *)OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_30((uint64_t)v7, sel_setPredicateForSelectionOfContact_);

  v8 = (void *)OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_14_3(v2, sel_setPredicateForSelectionOfProperty_);

  objc_msgSend(v1, sel_presentViewController_animated_completion_, v2, 1, 0);
  OUTLINED_FUNCTION_16_2();
}

uint64_t sub_2468B6030(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  *(_BYTE *)(v1 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_foundSearchResults) = 1;
  if (a1 && (v2 = sub_2468B6088(a1)) != 0)
  {
    v3 = v2;
  }
  else
  {
    swift_bridgeObjectRelease();
    v3 = MEMORY[0x24BEE4AF8];
  }
  sub_2468B4C64(v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2468B6088(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  _BYTE v5[32];
  uint64_t v6;

  v6 = MEMORY[0x24BEE4AF8];
  v2 = *(_QWORD *)(a1 + 16);
  sub_2468D6640();
  if (!v2)
    return v6;
  for (i = a1 + 32; ; i += 32)
  {
    sub_2468B6F88(i, (uint64_t)v5);
    sub_2468B72FC(0, &qword_2575E4978);
    if (!swift_dynamicCast())
      break;
    sub_2468D6628();
    sub_2468D664C();
    sub_2468D6658();
    sub_2468D6634();
    if (!--v2)
      return v6;
  }
  swift_release();

  return 0;
}

void sub_2468B6210()
{
  uint64_t v0;
  void *v1;

  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_foundSearchResults) & 1) == 0)
    sub_2468B4C64(MEMORY[0x24BEE4AF8]);
  v1 = *(void **)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_currentSearchTaskID);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_currentSearchTaskID) = 0;

}

void sub_2468B6280()
{
  uint64_t v0;

  OUTLINED_FUNCTION_13_3((uint64_t)objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_composeView), sel_clearText), sel_addRecipient_);
  sub_2468B4C64(MEMORY[0x24BEE4AF8]);
}

void sub_2468B6390()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  double v5;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableViewHeightConstraint);
  if (v1)
  {
    v2 = OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView;
    v3 = *(void **)(v0 + OBJC_IVAR____TtC10SiriMailUI29RecipientViewController_Phone_resultsTableView);
    v4 = v1;
    objc_msgSend(v3, sel_contentSize);
    objc_msgSend(v4, sel_setConstant_, v5);

    objc_msgSend(*(id *)(v0 + v2), sel_setNeedsUpdateConstraints);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2468B640C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v6 = MEMORY[0x24BEE4AF8];
    sub_2468D6640();
    v4 = a1 + 32;
    do
    {
      sub_2468B6F88(v4, (uint64_t)&v5);
      sub_2468B72FC(0, &qword_2575E4978);
      swift_dynamicCast();
      sub_2468D6628();
      sub_2468D664C();
      sub_2468D6658();
      sub_2468D6634();
      v4 += 32;
      --v2;
    }
    while (v2);
    return v6;
  }
  return result;
}

id sub_2468B6504(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  void *v8;
  id v9;

  v5 = v4;
  if (a3)
  {
    v8 = (void *)sub_2468D646C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v5, sel_initWithContact_address_kind_, a1, v8, a4);

  return v9;
}

id sub_2468B658C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  void *v7;
  void *v11;
  void *v12;
  id v13;

  v7 = v6;
  if (!a3)
  {
    v11 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v11 = (void *)sub_2468D646C();
  swift_bridgeObjectRelease();
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v12 = (void *)sub_2468D646C();
  swift_bridgeObjectRelease();
LABEL_6:
  v13 = objc_msgSend(v7, sel_initWithContact_address_displayString_kind_, a1, v11, v12, a6);

  return v13;
}

uint64_t sub_2468B6650(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD))
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_10_5();
    result = OUTLINED_FUNCTION_40();
    __break(1u);
  }
  else if (a3 < a1
         || (result = ((uint64_t (*)(_QWORD))a4)(0),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    a4(0);
    OUTLINED_FUNCTION_39();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_39();
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_2468B6724(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2468D6688();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

uint64_t sub_2468B67A8(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a4(0) - 8) + 72) * a2;
    v7 = a3 + v6;
    v8 = a1 + v6;
    if (v7 <= a1 || v8 <= a3)
      return swift_arrayInitWithCopy();
  }
  OUTLINED_FUNCTION_10_5();
  result = OUTLINED_FUNCTION_40();
  __break(1u);
  return result;
}

uint64_t sub_2468B687C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 32 * a2 <= a1 || a1 + 32 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_2468D6688();
  __break(1u);
  return result;
}

size_t sub_2468B694C(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_2468B6A28(a1, a2, a3, *v3, (uint64_t *)&unk_2575E4A40, (void (*)(_QWORD))type metadata accessor for IndexedHandle);
  *v3 = result;
  return result;
}

size_t sub_2468B6978(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_2468B6A28(a1, a2, a3, *v3, &qword_2575E4A38, (void (*)(_QWORD))type metadata accessor for IndexedContact);
  *v3 = result;
  return result;
}

size_t sub_2468B69A4(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_2468B6A28(a1, a2, a3, *v3, &qword_2575E4A30, (void (*)(_QWORD))MEMORY[0x24BE935E0]);
  *v3 = result;
  return result;
}

size_t sub_2468B69D0(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_2468B6A28(a1, a2, a3, *v3, &qword_2575E4988, (void (*)(_QWORD))MEMORY[0x24BE99C60]);
  *v3 = result;
  return result;
}

char *sub_2468B69FC(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_2468B6B6C(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

_OWORD *sub_2468B6A18(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

size_t sub_2468B6A28(size_t result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD))
{
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v8 = result;
  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(((uint64_t (*)(_QWORD))a6)(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_24;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  v18 = *(unsigned __int8 *)(*(_QWORD *)(((uint64_t (*)(_QWORD))a6)(0) - 8) + 80);
  v19 = (v18 + 32) & ~v18;
  v20 = (unint64_t)v16 + v19;
  v21 = a4 + v19;
  if ((v8 & 1) != 0)
  {
    sub_2468B6650(v21, v11, v20, a6);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2468B67A8(v21, v11, v20, (uint64_t (*)(_QWORD))a6);
  }
  swift_release();
  return (size_t)v16;
}

char *sub_2468B6B6C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4980);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_2468B6724(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2468B687C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_2468B6C4C(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
    goto LABEL_24;
  if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_25;
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E49A8);
  v3 = sub_2468D65C8();
  if (v2)
  {
    while (1)
    {
      swift_bridgeObjectRetain();
      v2 = sub_2468D667C();
      swift_bridgeObjectRelease();
      if (!v2)
        break;
LABEL_5:
      v4 = 0;
      v5 = v3 + 56;
      v21 = v1;
      v22 = v1 & 0xC000000000000001;
      v19 = v1 & 0xFFFFFFFFFFFFFF8;
      v6 = (void (*)(uint64_t))MEMORY[0x24BDB9B60];
      v20 = v2;
      while (1)
      {
        if (v22)
        {
          v7 = MEMORY[0x249561A84](v4, v21);
        }
        else
        {
          if (v4 >= *(_QWORD *)(v19 + 16))
            goto LABEL_23;
          v7 = swift_retain();
        }
        v8 = __OFADD__(v4++, 1);
        if (v8)
          break;
        v23 = v7;
        sub_2468D5AE8();
        sub_2468B71E0(&qword_2575E49B0, v6);
        v9 = sub_2468D6454();
        v10 = -1 << *(_BYTE *)(v3 + 32);
        v1 = v9 & ~v10;
        v11 = v1 >> 6;
        v12 = *(_QWORD *)(v5 + 8 * (v1 >> 6));
        v13 = 1 << v1;
        if (((1 << v1) & v12) != 0)
        {
          v14 = ~v10;
          sub_2468B71E0(&qword_2575E49B8, v6);
          while ((sub_2468D6460() & 1) == 0)
          {
            v1 = (v1 + 1) & v14;
            v11 = v1 >> 6;
            v12 = *(_QWORD *)(v5 + 8 * (v1 >> 6));
            v13 = 1 << v1;
            if ((v12 & (1 << v1)) == 0)
            {
              v2 = v20;
              goto LABEL_16;
            }
          }
          swift_release();
          v2 = v20;
        }
        else
        {
LABEL_16:
          *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
          *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v1) = v23;
          v15 = *(_QWORD *)(v3 + 16);
          v8 = __OFADD__(v15, 1);
          v16 = v15 + 1;
          if (v8)
            goto LABEL_22;
          *(_QWORD *)(v3 + 16) = v16;
        }
        v6 = (void (*)(uint64_t))MEMORY[0x24BDB9B60];
        if (v4 == v2)
          goto LABEL_27;
      }
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      swift_bridgeObjectRetain();
      v17 = sub_2468D667C();
      swift_bridgeObjectRelease();
      if (v17)
        goto LABEL_3;
LABEL_25:
      v3 = MEMORY[0x24BEE4B08];
      if (!v2)
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v2)
      goto LABEL_5;
  }
LABEL_27:
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_2468B6ED4(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_recipients);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2468D64F0();

  return v3;
}

uint64_t sub_2468B6F2C(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_2468D6484();

  return v4;
}

uint64_t sub_2468B6F88(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2468B6FC4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_2468B6FE8(uint64_t a1)
{
  uint64_t v1;

  sub_2468B3E78(a1, v1);
}

uint64_t sub_2468B6FF0(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 88);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return a1;
}

void sub_2468B7088(uint64_t a1, void *a2)
{
  id v3;

  sub_2468B72FC(0, &qword_2575E4978);
  v3 = (id)sub_2468D64E4();
  objc_msgSend(a2, sel_setRecipients_, v3);

}

id sub_2468B70F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;
  id v9;

  v8 = (void *)sub_2468D646C();
  v9 = objc_msgSend(a5, sel_searchForText_withAutocompleteFetchContext_consumer_, v8, a3, a4);

  return v9;
}

void sub_2468B7154(uint64_t a1, void *a2, uint64_t a3, SEL *a4)
{
  id v6;

  v6 = (id)sub_2468D64E4();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, *a4, v6);

}

uint64_t sub_2468B71B0()
{
  return sub_2468B5C48();
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

uint64_t sub_2468B71E0(uint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    a2(255);
    OUTLINED_FUNCTION_7_0();
  }
  return result;
}

uint64_t sub_2468B7218(uint64_t *a1, uint64_t *a2)
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_7_0();
  }
  return result;
}

uint64_t sub_2468B7250()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2468B7274(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4A00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2468B72BC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4A00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2468B72FC(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_0_6()
{
  return sub_2468D5C80();
}

id OUTLINED_FUNCTION_1_4(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void OUTLINED_FUNCTION_2_6()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return sub_2468D62BC();
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return sub_2468D61FC();
}

id OUTLINED_FUNCTION_5_5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(v0, (SEL)(v2 + 3918), v1);
}

uint64_t OUTLINED_FUNCTION_6_7(uint64_t a1, unint64_t *a2)
{
  return sub_2468B72FC(0, a2);
}

void OUTLINED_FUNCTION_7_5(id a1)
{

}

uint64_t OUTLINED_FUNCTION_8_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return sub_2468D6430();
}

id OUTLINED_FUNCTION_12_3(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

id OUTLINED_FUNCTION_13_3(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

id OUTLINED_FUNCTION_14_3(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 136) + 8))(v1, v0);
}

id OUTLINED_FUNCTION_17_3(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void OUTLINED_FUNCTION_18_3(uint64_t a1@<X8>)
{
  uint64_t v1;

}

id OUTLINED_FUNCTION_19_0()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 328));
}

id OUTLINED_FUNCTION_22_1(_QWORD *a1, double a2, double a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  return sub_2468B496C(a1, 8, 0, a6, 0, a2, a3);
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_24_0(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = *(_QWORD *)(result - 8);
  return result;
}

void OUTLINED_FUNCTION_25()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_27()
{
  return type metadata accessor for ComposeRecipientTextView();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_2468D6514();
}

id OUTLINED_FUNCTION_29(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

id OUTLINED_FUNCTION_30(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

id OUTLINED_FUNCTION_33(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_35()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

id OUTLINED_FUNCTION_36(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 0.0);
}

id OUTLINED_FUNCTION_37(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2468B658C(a1, a2, a3, a4, a5, 0);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return sub_2468D63DC();
}

uint64_t OUTLINED_FUNCTION_39()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return sub_2468D6688();
}

uint64_t OUTLINED_FUNCTION_41(uint64_t *a1)
{
  uint64_t *v1;

  return sub_2468B7218(a1, v1);
}

id OUTLINED_FUNCTION_42(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 310));
}

void OUTLINED_FUNCTION_43()
{
  void *v0;

}

_QWORD *sub_2468B7540(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  _QWORD *v25;
  id v26;
  uint64_t v27;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v6;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    *(_QWORD *)(a1 + 40) = a2[5];
    *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
    *(_QWORD *)(a1 + 56) = a2[7];
    *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
    v7 = a3[9];
    v8 = (char *)(a1 + v7);
    v9 = (char *)a2 + v7;
    *(_QWORD *)(a1 + 72) = a2[9];
    v10 = sub_2468D5908();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
    }
    v13 = __swift_instantiateConcreteTypeFromMangledName(qword_2575E4B18);
    *(_QWORD *)&v8[*(int *)(v13 + 36)] = *(_QWORD *)&v9[*(int *)(v13 + 36)];
    v14 = *(int *)(v13 + 40);
    v15 = &v8[v14];
    v16 = &v9[v14];
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v10))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v15, v16, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v10);
    }
    v18 = a3[10];
    v19 = a3[11];
    v20 = (_QWORD *)((char *)v4 + v18);
    v21 = (uint64_t)a2 + v18;
    v23 = *(void **)v21;
    v22 = *(_QWORD *)(v21 + 8);
    *v20 = v23;
    v20[1] = v22;
    v24 = (_QWORD *)((char *)v4 + v19);
    v25 = (uint64_t *)((char *)a2 + v19);
    v26 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v27 = sub_2468D5B78();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v24, v25, v27);
    }
    else
    {
      *v24 = *v25;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t sub_2468B77CC(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v4 = a1 + a2[9];
  v5 = sub_2468D5908();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2575E4B18);
  swift_release();
  v7 = v4 + *(int *)(v6 + 40);
  if (!__swift_getEnumTagSinglePayload(v7, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v7, v5);

  v8 = a1 + a2[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v9 = sub_2468D5B78();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

uint64_t sub_2468B7910(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;

  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v6 = a3[9];
  v7 = (char *)(a1 + v6);
  v8 = (char *)(a2 + v6);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v9 = sub_2468D5908();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(qword_2575E4B18);
  *(_QWORD *)&v7[*(int *)(v11 + 36)] = *(_QWORD *)&v8[*(int *)(v11 + 36)];
  v12 = *(int *)(v11 + 40);
  v13 = &v7[v12];
  v14 = &v8[v12];
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v9))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v13, v14, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v9);
  }
  v16 = a3[10];
  v17 = a3[11];
  v18 = (_QWORD *)(a1 + v16);
  v19 = a2 + v16;
  v21 = *(void **)v19;
  v20 = *(_QWORD *)(v19 + 8);
  *v18 = v21;
  v18[1] = v20;
  v22 = (_QWORD *)(a1 + v17);
  v23 = (_QWORD *)(a2 + v17);
  v24 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v25 = sub_2468D5B78();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v22, v23, v25);
  }
  else
  {
    *v22 = *v23;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_2468B7B68(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  v6 = a3[9];
  v7 = (char *)(a1 + v6);
  v8 = (char *)(a2 + v6);
  v9 = sub_2468D5908();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v12 = *(_QWORD *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  v14 = __swift_instantiateConcreteTypeFromMangledName(qword_2575E4B18);
  *(_QWORD *)&v7[*(int *)(v14 + 36)] = *(_QWORD *)&v8[*(int *)(v14 + 36)];
  swift_retain();
  swift_release();
  v15 = *(int *)(v14 + 40);
  v16 = &v7[v15];
  v17 = &v8[v15];
  LODWORD(v14) = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, v9);
  v18 = __swift_getEnumTagSinglePayload((uint64_t)v17, 1, v9);
  if ((_DWORD)v14)
  {
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v16, v17, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v19 = *(_QWORD *)(v9 - 8);
  if (v18)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v9);
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v16, v17, v9);
LABEL_13:
  v21 = a3[10];
  v22 = (_QWORD *)(a1 + v21);
  v23 = a2 + v21;
  v24 = *(void **)(a1 + v21);
  v25 = *(void **)(a2 + v21);
  *v22 = v25;
  v26 = v25;

  v22[1] = *(_QWORD *)(v23 + 8);
  if (a1 != a2)
  {
    v27 = a3[11];
    v28 = (_QWORD *)(a1 + v27);
    v29 = (_QWORD *)(a2 + v27);
    sub_2468A4D24(a1 + v27, &qword_2575E3850);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v30 = sub_2468D5B78();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v28, v29, v30);
    }
    else
    {
      *v28 = *v29;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_2468B7EA4(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  v8 = a3[9];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_2468D5908();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  v13 = __swift_instantiateConcreteTypeFromMangledName(qword_2575E4B18);
  *(_QWORD *)&v9[*(int *)(v13 + 36)] = *(_QWORD *)&v10[*(int *)(v13 + 36)];
  v14 = *(int *)(v13 + 40);
  v15 = &v9[v14];
  v16 = &v10[v14];
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v11))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v15, v16, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v11);
  }
  v18 = a3[11];
  *(_OWORD *)((char *)a1 + a3[10]) = *(_OWORD *)((char *)a2 + a3[10]);
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v22 = sub_2468D5B78();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v19, v20, v22);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  return a1;
}

uint64_t sub_2468B8078(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int EnumTagSinglePayload;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const void *v28;
  uint64_t v29;
  uint64_t v30;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_release();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  v7 = a3[9];
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = sub_2468D5908();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v13 = *(_QWORD *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v8, v9, v10);
LABEL_7:
  v15 = __swift_instantiateConcreteTypeFromMangledName(qword_2575E4B18);
  *(_QWORD *)&v8[*(int *)(v15 + 36)] = *(_QWORD *)&v9[*(int *)(v15 + 36)];
  swift_release();
  v16 = *(int *)(v15 + 40);
  v17 = &v8[v16];
  v18 = &v9[v16];
  LODWORD(v15) = __swift_getEnumTagSinglePayload((uint64_t)v17, 1, v10);
  v19 = __swift_getEnumTagSinglePayload((uint64_t)v18, 1, v10);
  if ((_DWORD)v15)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v17, v18, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v20 = *(_QWORD *)(v10 - 8);
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v17, v10);
LABEL_12:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v17, v18, v10);
LABEL_13:
  v22 = a3[10];
  v23 = (_QWORD *)(a1 + v22);
  v24 = (_QWORD *)(a2 + v22);
  v25 = *(void **)(a1 + v22);
  *v23 = *v24;

  v23[1] = v24[1];
  if (a1 != a2)
  {
    v26 = a3[11];
    v27 = (void *)(a1 + v26);
    v28 = (const void *)(a2 + v26);
    sub_2468A4D24(a1 + v26, &qword_2575E3850);
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v30 = sub_2468D5B78();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v30 - 8) + 32))(v27, v28, v30);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_2468B837C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2468B8388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2575E4B18);
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == (_DWORD)a2)
    {
      v9 = v8;
      v10 = *(int *)(a3 + 36);
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FB0);
      v10 = *(int *)(a3 + 44);
    }
    return __swift_getEnumTagSinglePayload(a1 + v10, a2, v9);
  }
}

uint64_t sub_2468B8428()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_2468B8434(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 8) = (a2 - 1);
    OUTLINED_FUNCTION_12_1();
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2575E4B18);
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = *(int *)(a4 + 36);
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FB0);
      v10 = *(int *)(a4 + 44);
    }
    __swift_storeEnumTagSinglePayload(a1 + v10, a2, a2, v9);
  }
}

uint64_t type metadata accessor for SceneClientView()
{
  uint64_t result;

  result = qword_2575E4B78;
  if (!qword_2575E4B78)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2468B8500()
{
  unint64_t v0;
  unint64_t v1;

  sub_2468B85A0();
  if (v0 <= 0x3F)
  {
    sub_2468A4A50();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_2468B85A0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2575E4B88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4B10);
    sub_2468BCBB0((uint64_t)&unk_2575E4B90);
    v0 = sub_2468D5B54();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2575E4B88);
  }
}

uint64_t sub_2468B8624()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2468B8634()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4768);
  sub_2468BCF04((uint64_t)&unk_2575E4D38);
  sub_2468D6214();
  sub_2468D6220();
  return 1;
}

uint64_t sub_2468B86F0()
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
  int v9;
  uint64_t v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unsigned __int8 v17;

  v1 = v0;
  v2 = type metadata accessor for SceneClientView();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v14 - v6;
  v8 = *(_QWORD *)(v0 + 24);
  v15 = *(_BYTE *)(v0 + 16);
  v16 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40E8);
  sub_2468D61B4();
  v9 = v17;
  sub_2468BC9F8(v1, (uint64_t)v7);
  if (v9 == 1)
  {
    v10 = *((_QWORD *)v7 + 5);
    v15 = v7[32];
    v16 = v10;
    sub_2468D61B4();
    sub_2468BCE0C((uint64_t)v7);
    v11 = v17;
    sub_2468BC9F8(v1, (uint64_t)v5);
    if ((v11 & 1) != 0)
    {
      v12 = *((_QWORD *)v5 + 7);
      v15 = v5[48];
      v16 = v12;
      sub_2468D61B4();
      sub_2468BCE0C((uint64_t)v5);
      return v17;
    }
  }
  else
  {
    sub_2468BCE0C((uint64_t)v7);
    sub_2468BC9F8(v1, (uint64_t)v5);
  }
  sub_2468BCE0C((uint64_t)v5);
  return 0;
}

uint64_t sub_2468B8844@<X0>(uint64_t a1@<X8>)
{
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t result;
  uint64_t v15;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_23_2();
  *(_BYTE *)(a1 + 16) = v2;
  *(_QWORD *)(a1 + 24) = v3;
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_23_2();
  *(_BYTE *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_23_2();
  *(_BYTE *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 56) = v7;
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_23_2();
  *(_BYTE *)(a1 + 64) = v8;
  *(_QWORD *)(a1 + 72) = v9;
  v10 = OUTLINED_FUNCTION_11_5();
  OUTLINED_FUNCTION_12_4();
  sub_2468BD46C((uint64_t)&unk_2575E4B98);
  sub_2468D5B48();
  v11 = (uint64_t *)(a1 + *(int *)(v10 + 40));
  sub_2468D6430();
  sub_2468BD46C((uint64_t)&qword_2575E4990);
  *v11 = sub_2468D5C8C();
  v11[1] = v12;
  v13 = (uint64_t *)(a1 + *(int *)(v10 + 44));
  *v13 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  swift_storeEnumTagMultiPayload();
  type metadata accessor for SiriMailModel();
  sub_2468BD46C((uint64_t)&qword_2575E4C28);
  result = sub_2468D5C20();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v15;
  return result;
}

void sub_2468B89CC(uint64_t a1@<X8>)
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
  char *v22;
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
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (**v44)(uint64_t);
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (**v50)(uint64_t);
  uint64_t v51;
  void (**v52)();
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  void (*v68)(char *, uint64_t);
  uint64_t v69;
  _QWORD v70[2];
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
  char *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;

  v98 = a1;
  v2 = sub_2468D5914();
  v96 = *(_QWORD *)(v2 - 8);
  v97 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v95 = (char *)v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v94 = (char *)v70 - v5;
  v6 = OUTLINED_FUNCTION_11_5();
  v7 = *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64);
  v91 = *(_QWORD *)(v6 - 8);
  v92 = v7;
  MEMORY[0x24BDAC7A8](v6);
  v90 = (uint64_t)v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0();
  v12 = v11 - v10;
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4BE0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_14();
  v79 = v14;
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4BE8);
  v75 = *(_QWORD *)(v84 - 8);
  v15 = *(_QWORD *)(v75 + 64);
  MEMORY[0x24BDAC7A8](v84);
  OUTLINED_FUNCTION_9_4((uint64_t)v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_9_4((uint64_t)v70 - v17);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4BF0);
  v18 = *(_QWORD *)(v72 - 8);
  v80 = *(_QWORD *)(v18 + 64);
  v81 = v18;
  MEMORY[0x24BDAC7A8](v72);
  OUTLINED_FUNCTION_9_4((uint64_t)v70 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)v70 - v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4BF8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_0();
  v26 = v25 - v24;
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4C00);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_9_4(v28);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4C08);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_14();
  v99 = v30;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4C10);
  v88 = *(_QWORD *)(v31 - 8);
  v89 = v31;
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_14();
  v85 = v32;
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4C18);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_14();
  v86 = v34;
  *(_QWORD *)v26 = sub_2468D5E18();
  *(_QWORD *)(v26 + 8) = 0;
  *(_BYTE *)(v26 + 16) = 0;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4C20);
  sub_2468B9220(v1, v26 + *(int *)(v35 + 44));
  v71 = v1;
  type metadata accessor for SiriMailModel();
  sub_2468BD46C((uint64_t)&unk_2575E4C28);
  sub_2468D5C2C();
  swift_getKeyPath();
  sub_2468D5C38();
  swift_release();
  swift_release();
  v70[1] = v1 + *(int *)(v6 + 36);
  v70[0] = __swift_instantiateConcreteTypeFromMangledName(qword_2575E4B18);
  v36 = v73;
  sub_2468D5B30();
  v37 = (uint64_t)v22;
  MEMORY[0x24956167C](v72);
  v38 = v74;
  OUTLINED_FUNCTION_16_3(v36, v74);
  v39 = (*(unsigned __int8 *)(v75 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80);
  v40 = swift_allocObject();
  sub_2468AB388(v38, v40 + v39, &qword_2575E4BE8);
  v41 = v79;
  v42 = v79 + *(int *)(v82 + 36);
  OUTLINED_FUNCTION_16_3(v12, v42);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4C30);
  v44 = (void (**)(uint64_t))(v42 + *(int *)(v43 + 36));
  *v44 = sub_2468BC890;
  v44[1] = (void (*)(uint64_t))v40;
  sub_2468AB35C(v26, v41, &qword_2575E4BF8);
  sub_2468A4D24(v12, &qword_2575E4B10);
  sub_2468D5B3C();
  v45 = v78;
  sub_2468AB35C(v37, v78, &qword_2575E4BF0);
  v46 = (*(unsigned __int8 *)(v81 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80);
  v47 = swift_allocObject();
  sub_2468AB388(v45, v47 + v46, &qword_2575E4BF0);
  v48 = v76;
  v49 = v76 + *(int *)(v77 + 36);
  sub_2468AB35C(v12, v49, &qword_2575E4B10);
  v50 = (void (**)(uint64_t))(v49 + *(int *)(v43 + 36));
  *v50 = sub_2468BC9A0;
  v50[1] = (void (*)(uint64_t))v47;
  sub_2468AB35C(v41, v48, &qword_2575E4BE0);
  sub_2468A4D24(v12, &qword_2575E4B10);
  sub_2468A4D24(v41, &qword_2575E4BE0);
  sub_2468A4D24(v36, &qword_2575E4BE8);
  sub_2468A4D24(v37, &qword_2575E4BF0);
  sub_2468A4D24(v26, &qword_2575E4BF8);
  v51 = v99;
  sub_2468AB35C(v48, v99, &qword_2575E4C00);
  v52 = (void (**)())(v51 + *(int *)(v83 + 36));
  *v52 = sub_2468BBF58;
  v52[1] = 0;
  v52[2] = 0;
  v52[3] = 0;
  sub_2468A4D24(v48, &qword_2575E4C00);
  sub_2468D5B24();
  v53 = v71;
  v54 = v90;
  sub_2468BC9F8(v71, v90);
  v55 = OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_15_2(v55);
  sub_2468BCDA8((uint64_t)&unk_2575E4C38);
  sub_2468BCBB0((uint64_t)&qword_2575E4C60);
  v56 = v85;
  v57 = v99;
  sub_2468D6118();
  swift_release();
  sub_2468A4D24(v12, &qword_2575E4B10);
  sub_2468A4D24(v57, &qword_2575E4C08);
  sub_2468BC9F8(v53, v54);
  v58 = OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_15_2(v58);
  v60 = v88;
  v59 = v89;
  v61 = v86;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v88 + 16))(v86, v56, v89);
  v62 = (_QWORD *)(v61 + *(int *)(v87 + 36));
  *v62 = 0;
  v62[1] = 0;
  v62[2] = sub_2468BCD60;
  v62[3] = v58;
  (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v56, v59);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  v63 = v94;
  sub_2468D5A88();
  swift_release();
  swift_release();
  swift_release();
  v64 = v95;
  v65 = v96;
  v66 = v97;
  (*(void (**)(char *, _QWORD, uint64_t))(v96 + 104))(v95, *MEMORY[0x24BE99BD8], v97);
  v67 = v64;
  LOBYTE(v64) = sub_2468BDE90();
  v68 = *(void (**)(char *, uint64_t))(v65 + 8);
  v68(v67, v66);
  v68(v63, v66);
  v69 = v98;
  sub_2468AB35C(v61, v98, &qword_2575E4C18);
  *(_BYTE *)(v69 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2575E4C70) + 36)) = v64 & 1;
  sub_2468A4D24(v61, &qword_2575E4C18);
}

void sub_2468B9220(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v57;
  uint64_t v58;
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
  char v88;
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
  unint64_t v105;
  unint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  id v110;
  char v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  _OWORD *v116;
  __int128 v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  char v124;
  uint64_t v125;
  uint64_t v126;
  id *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  id v145;
  char v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  _OWORD *v150;
  __int128 v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  _QWORD *v160;
  uint64_t v161;
  void *v162;
  uint64_t v163;
  id v164;
  uint64_t v165;
  uint64_t v166;
  int v167;
  uint64_t v168;
  uint64_t v169;
  char v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  char v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  id *v187;
  id v188;
  char v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t *v196;
  uint64_t v197;
  id v198;
  char v199;
  uint64_t v200;
  void *v201;
  uint64_t v202;
  id v203;
  double v204;
  double v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t KeyPath;
  uint64_t v212;
  uint64_t *v213;
  uint64_t *v214;
  unsigned __int8 v215;
  unsigned __int8 v216;
  char v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  unint64_t v224;
  unint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  char *v233;
  uint64_t *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  unint64_t v241;
  char *v242;
  uint64_t v243;
  char *v244;
  void *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  char v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  uint64_t v260;
  id v261;
  id v262;
  _QWORD *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  uint64_t v269;
  uint64_t v270;
  id v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  _QWORD *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  int *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  char *v289;
  uint64_t v290;
  _OWORD *v291;
  __int128 v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  _QWORD *v301;
  void *v302;
  char *v303;
  uint64_t v304;
  id v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  char *v311;
  char v312;
  void (*v313)(char *, uint64_t);
  uint64_t v314;
  char *v315;
  char v316;
  void (*v317)(char *, uint64_t);
  __int128 v318;
  uint64_t v319;
  uint64_t v320;
  int v321;
  char *v322;
  __int128 v323;
  uint64_t v324;
  uint64_t v325;
  char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  char *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  char *v336;
  char *v337;
  uint64_t v338;
  uint64_t v339;
  void (*v340)(char *, char *, uint64_t);
  unint64_t v341;
  char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  char *v346;
  char *v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  __int128 v359;
  uint64_t v360;
  unint64_t v361;
  char *v362;
  uint64_t v363;
  char *v364;
  uint64_t v365;
  char *v366;
  uint64_t *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  char *v371;
  uint64_t v372;
  char *v373;
  uint64_t v374;
  uint64_t v375;
  id *v376;
  uint64_t v377;
  __int128 v378;
  uint64_t v379;
  _QWORD *v380;
  uint64_t v381;
  char *v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  char *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  char v396;
  _BYTE v397[24];
  char *v398;
  void *v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  __int128 v404;
  void *v405;
  uint64_t v406;
  char v407;
  char v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;

  v372 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4C80);
  v343 = *(_QWORD *)(v3 - 8);
  v344 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v342 = (char *)&v318 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4C88);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v346 = (char *)&v318 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v345 = (uint64_t)&v318 - v8;
  v391 = sub_2468D5908();
  v375 = *(_QWORD *)(v391 - 8);
  MEMORY[0x24BDAC7A8](v391);
  v326 = (char *)&v318 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v339 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4C90);
  v10 = MEMORY[0x24BDAC7A8](v339);
  v328 = (uint64_t)&v318 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v352 = (char *)&v318 - v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4C98);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v355 = (uint64_t *)((char *)&v318 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v14);
  v354 = (uint64_t)&v318 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4CA0);
  MEMORY[0x24BDAC7A8](v17);
  v367 = (uint64_t *)((char *)&v318 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v349 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4CA8);
  MEMORY[0x24BDAC7A8](v349);
  v368 = (uint64_t)&v318 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v351 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4CB0);
  v20 = MEMORY[0x24BDAC7A8](v351);
  v353 = (uint64_t)&v318 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v350 = (uint64_t)&v318 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v369 = (uint64_t)&v318 - v24;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4CB8);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v371 = (char *)&v318 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v381 = (uint64_t)&v318 - v28;
  v394 = type metadata accessor for SceneClientView();
  v29 = MEMORY[0x24BDAC7A8](v394);
  v358 = (uint64_t)&v318 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = MEMORY[0x24BDAC7A8](v29);
  v357 = (uint64_t)&v318 - v32;
  v33 = MEMORY[0x24BDAC7A8](v31);
  v348 = (uint64_t)&v318 - v34;
  MEMORY[0x24BDAC7A8](v33);
  v366 = (char *)&v318 - v35;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4CC0);
  v37 = MEMORY[0x24BDAC7A8](v36);
  v370 = (uint64_t)&v318 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = MEMORY[0x24BDAC7A8](v37);
  v390 = (uint64_t)&v318 - v40;
  v41 = MEMORY[0x24BDAC7A8](v39);
  v380 = (_QWORD *)((char *)&v318 - v42);
  MEMORY[0x24BDAC7A8](v41);
  v389 = (uint64_t)&v318 - v43;
  v383 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
  v44 = MEMORY[0x24BDAC7A8](v383);
  v325 = (uint64_t)&v318 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = MEMORY[0x24BDAC7A8](v44);
  v332 = (uint64_t)&v318 - v47;
  v48 = MEMORY[0x24BDAC7A8](v46);
  v333 = (uint64_t)&v318 - v49;
  v50 = MEMORY[0x24BDAC7A8](v48);
  v327 = (uint64_t)&v318 - v51;
  v52 = MEMORY[0x24BDAC7A8](v50);
  v356 = (uint64_t)&v318 - v53;
  v54 = MEMORY[0x24BDAC7A8](v52);
  v338 = (uint64_t)&v318 - v55;
  MEMORY[0x24BDAC7A8](v54);
  v57 = (char *)&v318 - v56;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4BE8);
  MEMORY[0x24BDAC7A8](v58);
  v382 = (char *)&v318 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  v379 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4CC8);
  v365 = *(_QWORD *)(v379 - 8);
  v60 = MEMORY[0x24BDAC7A8](v379);
  v337 = (char *)&v318 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = MEMORY[0x24BDAC7A8](v60);
  v347 = (char *)&v318 - v63;
  MEMORY[0x24BDAC7A8](v62);
  v388 = (char *)&v318 - v64;
  *(_QWORD *)&v378 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4CD0);
  v65 = MEMORY[0x24BDAC7A8](v378);
  v330 = (char *)&v318 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = MEMORY[0x24BDAC7A8](v65);
  v336 = (char *)&v318 - v68;
  MEMORY[0x24BDAC7A8](v67);
  v364 = (char *)&v318 - v69;
  v377 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4CD8);
  v70 = MEMORY[0x24BDAC7A8](v377);
  v329 = (uint64_t)&v318 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = MEMORY[0x24BDAC7A8](v70);
  v331 = (uint64_t)&v318 - v73;
  v74 = MEMORY[0x24BDAC7A8](v72);
  v393 = (uint64_t)&v318 - v75;
  v76 = MEMORY[0x24BDAC7A8](v74);
  v334 = (uint64_t)&v318 - v77;
  v78 = MEMORY[0x24BDAC7A8](v76);
  v335 = (uint64_t)&v318 - v79;
  v80 = MEMORY[0x24BDAC7A8](v78);
  v363 = (uint64_t)&v318 - v81;
  MEMORY[0x24BDAC7A8](v80);
  v395 = (uint64_t)&v318 - v82;
  v83 = *(_QWORD *)(a1 + 8);
  v84 = *(_QWORD *)(v83 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_toLabel + 8);
  v376 = *(id **)(v83 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_toLabel);
  v85 = *(_QWORD *)(a1 + 24);
  LOBYTE(v415) = *(_BYTE *)(a1 + 16);
  *((_QWORD *)&v415 + 1) = v85;
  swift_bridgeObjectRetain();
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40E8);
  sub_2468D61CC();
  v373 = *(char **)&v397[8];
  v374 = *(_QWORD *)v397;
  LODWORD(v362) = v397[16];
  v87 = *(_QWORD *)(a1 + 72);
  LOBYTE(v415) = *(_BYTE *)(a1 + 64);
  *((_QWORD *)&v415 + 1) = v87;
  sub_2468D61CC();
  v360 = *(_QWORD *)&v397[8];
  v361 = *(_QWORD *)v397;
  v88 = v397[16];
  v89 = type metadata accessor for SiriMailModel();
  sub_2468BD46C((uint64_t)&unk_2575E4C28);
  v91 = v90;
  v387 = v89;
  sub_2468D5C2C();
  swift_getKeyPath();
  v386 = v91;
  sub_2468D5C38();
  swift_release();
  swift_release();
  v92 = *(_QWORD *)v397;
  v93 = sub_2468D6430();
  sub_2468BD46C((uint64_t)&qword_2575E4990);
  v359 = *(_OWORD *)&v397[8];
  v384 = v93;
  v392 = v94;
  v95 = sub_2468D5C8C();
  v97 = v96;
  v98 = *(_QWORD *)(a1 + 24);
  v397[0] = *(_BYTE *)(a1 + 16);
  *(_QWORD *)&v397[8] = v98;
  v385 = v86;
  sub_2468D61B4();
  *(_QWORD *)v397 = v376;
  *(_QWORD *)&v397[8] = v84;
  *(_QWORD *)&v397[16] = v374;
  v398 = v373;
  LOBYTE(v399) = (_BYTE)v362;
  v400 = v361;
  v401 = v360;
  LOBYTE(v402) = v88;
  v403 = v92;
  v404 = v359;
  v405 = (void *)v95;
  v406 = v97;
  v407 = 0;
  v408 = v415;
  v99 = a1 + *(int *)(v394 + 36);
  v100 = __swift_instantiateConcreteTypeFromMangledName(qword_2575E4B18);
  v101 = (uint64_t)v382;
  v374 = v100;
  v360 = v99;
  sub_2468D5B30();
  v102 = *MEMORY[0x24BE99B90];
  v103 = v391;
  v373 = *(char **)(v375 + 104);
  ((void (*)(char *, uint64_t, uint64_t))v373)(v57, v102, v391);
  __swift_storeEnumTagSinglePayload((uint64_t)v57, 0, 1, v103);
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4CE0);
  v105 = sub_2468BCDA8((uint64_t)&unk_2575E4CE8);
  v106 = sub_2468BCBB0((uint64_t)&unk_2575E4B90);
  *(_QWORD *)&v359 = v104;
  v341 = v105;
  v361 = v106;
  sub_2468D6100();
  v362 = v57;
  sub_2468A4D24((uint64_t)v57, &qword_2575E4B10);
  sub_2468A4D24(v101, &qword_2575E4BE8);
  v107 = v405;
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v108 = a1;
  swift_release();
  swift_release();
  swift_release();

  v109 = *(void **)(a1 + *(int *)(v394 + 40));
  if (!v109)
    goto LABEL_67;
  v376 = (id *)(a1 + *(int *)(v394 + 40));
  v110 = v109;
  v111 = sub_2468D63C4();

  if ((v111 & 1) != 0)
    sub_2468D6280();
  else
    sub_2468D6274();
  sub_2468D5BE4();
  v113 = (uint64_t)v364;
  v112 = v365;
  v114 = v388;
  v115 = v379;
  v340 = *(void (**)(char *, char *, uint64_t))(v365 + 16);
  v340(v364, v388, v379);
  v116 = (_OWORD *)(v113 + *(int *)(v378 + 36));
  v117 = v410;
  *v116 = v409;
  v116[1] = v117;
  v116[2] = v411;
  v388 = *(char **)(v112 + 8);
  ((void (*)(char *, uint64_t))v388)(v114, v115);
  v118 = sub_2468D5C8C();
  v120 = v119;
  v121 = v363;
  sub_2468AB35C(v113, v363, &qword_2575E4CD0);
  v122 = (uint64_t *)(v121 + *(int *)(v377 + 36));
  *v122 = v118;
  v122[1] = v120;
  sub_2468A4D24(v113, &qword_2575E4CD0);
  sub_2468AB388(v121, v395, &qword_2575E4CD8);
  v123 = *(_QWORD *)(a1 + 24);
  v397[0] = *(_BYTE *)(a1 + 16);
  *(_QWORD *)&v397[8] = v123;
  sub_2468D61B4();
  if (v415 != 1)
    goto LABEL_7;
  sub_2468D5C2C();
  swift_getKeyPath();
  sub_2468D5C38();
  swift_release();
  swift_release();
  v124 = sub_2468B8634();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if ((v124 & 1) == 0)
  {
    v128 = sub_2468D5C8C();
    v363 = v129;
    v364 = (char *)v128;
    v130 = *(_QWORD *)(a1 + 8);
    v131 = *(_QWORD *)(v130 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_ccLabel + 8);
    v324 = *(_QWORD *)(v130 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_ccLabel);
    v132 = *(_QWORD *)(a1 + 40);
    LOBYTE(v415) = *(_BYTE *)(a1 + 32);
    *((_QWORD *)&v415 + 1) = v132;
    swift_bridgeObjectRetain();
    sub_2468D61CC();
    v322 = *(char **)&v397[8];
    *(_QWORD *)&v323 = *(_QWORD *)v397;
    v321 = v397[16];
    v133 = *(_QWORD *)(a1 + 72);
    LOBYTE(v415) = *(_BYTE *)(a1 + 64);
    *((_QWORD *)&v415 + 1) = v133;
    sub_2468D61CC();
    v319 = *(_QWORD *)&v397[8];
    v320 = *(_QWORD *)v397;
    v134 = v397[16];
    sub_2468D5C2C();
    swift_getKeyPath();
    sub_2468D5C38();
    swift_release();
    swift_release();
    v135 = *(_QWORD *)v397;
    v318 = *(_OWORD *)&v397[8];
    v136 = sub_2468D5C8C();
    v138 = v137;
    v139 = *(_BYTE *)(v108 + 32);
    v365 = v108;
    v140 = *(_QWORD *)(v108 + 40);
    v397[0] = v139;
    *(_QWORD *)&v397[8] = v140;
    sub_2468D61B4();
    *(_QWORD *)v397 = v324;
    *(_QWORD *)&v397[8] = v131;
    *(_QWORD *)&v397[16] = v323;
    v398 = v322;
    LOBYTE(v399) = v321;
    v400 = v320;
    v401 = v319;
    LOBYTE(v402) = v134;
    v403 = v135;
    v404 = v318;
    v405 = (void *)v136;
    v406 = v138;
    v407 = 0;
    v408 = v415;
    v141 = (uint64_t)v382;
    sub_2468D5B30();
    v142 = (uint64_t)v362;
    v143 = v391;
    ((void (*)(char *, _QWORD, uint64_t))v373)(v362, *MEMORY[0x24BE99B88], v391);
    __swift_storeEnumTagSinglePayload(v142, 0, 1, v143);
    sub_2468D6100();
    sub_2468A4D24(v142, &qword_2575E4B10);
    sub_2468A4D24(v141, &qword_2575E4BE8);
    v144 = v405;
    swift_bridgeObjectRelease();
    swift_release();
    v127 = v376;
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();

    if (!*v127)
      goto LABEL_67;
    v145 = *v127;
    v146 = sub_2468D63C4();

    if ((v146 & 1) != 0)
      sub_2468D6280();
    else
      sub_2468D6274();
    v108 = v365;
    sub_2468D5BE4();
    v147 = (uint64_t)v336;
    v148 = v347;
    v149 = v379;
    v340(v336, v347, v379);
    v150 = (_OWORD *)(v147 + *(int *)(v378 + 36));
    v151 = v413;
    *v150 = v412;
    v150[1] = v151;
    v150[2] = v414;
    ((void (*)(char *, uint64_t))v388)(v148, v149);
    v152 = sub_2468D5C8C();
    v154 = v153;
    v155 = v334;
    sub_2468AB35C(v147, v334, &qword_2575E4CD0);
    v156 = (uint64_t *)(v155 + *(int *)(v377 + 36));
    *v156 = v152;
    v156[1] = v154;
    sub_2468A4D24(v147, &qword_2575E4CD0);
    v157 = v155;
    v158 = v335;
    sub_2468AB388(v157, v335, &qword_2575E4CD8);
    v159 = v393;
    sub_2468AB35C(v158, v393, &qword_2575E4CD8);
    v160 = v380;
    v161 = v363;
    v162 = v364;
    *v380 = v364;
    v160[1] = v161;
    v163 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4D30);
    sub_2468AB35C(v159, (uint64_t)v160 + *(int *)(v163 + 48), &qword_2575E4CD8);
    v164 = v162;
    sub_2468A4D24(v158, &qword_2575E4CD8);
    sub_2468A4D24(v159, &qword_2575E4CD8);

    v165 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4CF0);
    __swift_storeEnumTagSinglePayload((uint64_t)v160, 0, 1, v165);
    sub_2468AB388((uint64_t)v160, v389, &qword_2575E4CC0);
    v126 = v381;
  }
  else
  {
LABEL_7:
    v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4CF0);
    __swift_storeEnumTagSinglePayload(v389, 1, 1, v125);
    v126 = v381;
    v127 = v376;
  }
  v166 = *(_QWORD *)(v108 + 24);
  v397[0] = *(_BYTE *)(v108 + 16);
  *(_QWORD *)&v397[8] = v166;
  sub_2468D61B4();
  v167 = v415;
  v168 = (uint64_t)v366;
  sub_2468BC9F8(v108, (uint64_t)v366);
  if (v167 != 1)
  {
    sub_2468BCE0C(v168);
LABEL_20:
    v190 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4CF0);
    __swift_storeEnumTagSinglePayload(v390, 1, 1, v190);
    goto LABEL_21;
  }
  v169 = *(_QWORD *)(v168 + 40);
  v397[0] = *(_BYTE *)(v168 + 32);
  *(_QWORD *)&v397[8] = v169;
  sub_2468D61B4();
  sub_2468BCE0C(v168);
  if ((v415 & 1) == 0)
    goto LABEL_20;
  sub_2468D5C2C();
  swift_getKeyPath();
  sub_2468D5C38();
  swift_release();
  swift_release();
  v170 = sub_2468B8634();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if ((v170 & 1) != 0)
    goto LABEL_20;
  v366 = (char *)sub_2468D5C8C();
  v364 = v171;
  v172 = *(_QWORD *)(v108 + 8);
  v173 = *(_QWORD *)(v172 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_bccLabel + 8);
  v363 = *(_QWORD *)(v172 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_bccLabel);
  v174 = *(_QWORD *)(v108 + 56);
  LOBYTE(v415) = *(_BYTE *)(v108 + 48);
  *((_QWORD *)&v415 + 1) = v174;
  swift_bridgeObjectRetain();
  sub_2468D61CC();
  v347 = *(char **)v397;
  v336 = *(char **)&v397[8];
  LODWORD(v335) = v397[16];
  v175 = *(_QWORD *)(v108 + 72);
  LOBYTE(v415) = *(_BYTE *)(v108 + 64);
  *((_QWORD *)&v415 + 1) = v175;
  sub_2468D61CC();
  v334 = *(_QWORD *)v397;
  v176 = *(_QWORD *)&v397[8];
  LODWORD(v324) = v397[16];
  sub_2468D5C2C();
  swift_getKeyPath();
  sub_2468D5C38();
  swift_release();
  swift_release();
  v177 = *(_QWORD *)v397;
  v323 = *(_OWORD *)&v397[8];
  v178 = sub_2468D5C8C();
  v180 = v179;
  v181 = *(_BYTE *)(v108 + 48);
  v365 = v108;
  v182 = *(_QWORD *)(v108 + 56);
  v397[0] = v181;
  *(_QWORD *)&v397[8] = v182;
  sub_2468D61B4();
  *(_QWORD *)v397 = v363;
  *(_QWORD *)&v397[8] = v173;
  *(_QWORD *)&v397[16] = v347;
  v398 = v336;
  LOBYTE(v399) = v335;
  v400 = v334;
  v401 = v176;
  LOBYTE(v402) = v324;
  v403 = v177;
  v404 = v323;
  v405 = (void *)v178;
  v406 = v180;
  v407 = 0;
  v408 = v415;
  v183 = (uint64_t)v382;
  sub_2468D5B30();
  v184 = (uint64_t)v362;
  v185 = v391;
  ((void (*)(char *, _QWORD, uint64_t))v373)(v362, *MEMORY[0x24BE99B98], v391);
  __swift_storeEnumTagSinglePayload(v184, 0, 1, v185);
  sub_2468D6100();
  sub_2468A4D24(v184, &qword_2575E4B10);
  sub_2468A4D24(v183, &qword_2575E4BE8);
  v186 = v405;
  swift_bridgeObjectRelease();
  swift_release();
  v187 = v376;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  if (!*v187)
    goto LABEL_67;
  v188 = *v187;
  v189 = sub_2468D63C4();

  if ((v189 & 1) != 0)
    sub_2468D6280();
  else
    sub_2468D6274();
  v126 = v381;
  v108 = v365;
  sub_2468D5BE4();
  v288 = (uint64_t)v330;
  v289 = v337;
  v290 = v379;
  v340(v330, v337, v379);
  v291 = (_OWORD *)(v288 + *(int *)(v378 + 36));
  v292 = v416;
  *v291 = v415;
  v291[1] = v292;
  v291[2] = v417;
  ((void (*)(char *, uint64_t))v388)(v289, v290);
  v293 = sub_2468D5C8C();
  v295 = v294;
  v296 = v329;
  sub_2468AB35C(v288, v329, &qword_2575E4CD0);
  v297 = (uint64_t *)(v296 + *(int *)(v377 + 36));
  *v297 = v293;
  v297[1] = v295;
  sub_2468A4D24(v288, &qword_2575E4CD0);
  v298 = v296;
  v299 = v331;
  sub_2468AB388(v298, v331, &qword_2575E4CD8);
  v300 = v393;
  sub_2468AB35C(v299, v393, &qword_2575E4CD8);
  v301 = v380;
  v302 = v366;
  v303 = v364;
  *v380 = v366;
  v301[1] = v303;
  v304 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4D30);
  sub_2468AB35C(v300, (uint64_t)v301 + *(int *)(v304 + 48), &qword_2575E4CD8);
  v305 = v302;
  sub_2468A4D24(v299, &qword_2575E4CD8);
  sub_2468A4D24(v300, &qword_2575E4CD8);

  v306 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4CF0);
  __swift_storeEnumTagSinglePayload((uint64_t)v301, 0, 1, v306);
  sub_2468AB388((uint64_t)v301, v390, &qword_2575E4CC0);
  v127 = v376;
LABEL_21:
  if ((sub_2468B86F0() & 1) != 0)
  {
    v191 = sub_2468D5C8C();
    v193 = v192;
    v194 = sub_2468D5DA0();
    if (qword_2575E3800 != -1)
      swift_once();
    v195 = qword_2575EBD80;
    v196 = v367;
    *v367 = v194;
    v196[1] = v195;
    *((_BYTE *)v196 + 16) = 0;
    v197 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4D08);
    sub_2468BB698(v108, (uint64_t *)((char *)v196 + *(int *)(v197 + 44)));
    if (*v127)
    {
      v198 = *v127;
      v199 = sub_2468D63C4();

      v200 = v348;
      sub_2468BC9F8(v108, v348);
      v388 = (char *)v191;
      v385 = v193;
      if ((v199 & 1) == 0)
      {
        sub_2468BCE0C(v200);
        goto LABEL_31;
      }
      v201 = *(void **)(v200 + *(int *)(v394 + 40));
      if (v201)
      {
        v202 = v200;
        v203 = v201;
        sub_2468D63D0();
        v205 = v204;

        sub_2468BCE0C(v202);
        if (v205 > 1.0)
        {
          v206 = sub_2468D5F68();
          goto LABEL_32;
        }
LABEL_31:
        v206 = sub_2468D5F50();
LABEL_32:
        v210 = v206;
        KeyPath = swift_getKeyPath();
        v213 = v367;
        v212 = v368;
        sub_2468AB35C((uint64_t)v367, v368, &qword_2575E4CA0);
        v214 = (uint64_t *)(v212 + *(int *)(v349 + 36));
        *v214 = KeyPath;
        v214[1] = v210;
        sub_2468A4D24((uint64_t)v213, &qword_2575E4CA0);
        LOBYTE(v213) = sub_2468D5F14();
        v215 = sub_2468D5EFC();
        v216 = sub_2468D5F08();
        v217 = sub_2468D5F20();
        sub_2468D5F20();
        if (sub_2468D5F20() != v213)
          v217 = sub_2468D5F20();
        sub_2468D5F20();
        if (sub_2468D5F20() != v215)
          v217 = sub_2468D5F20();
        v218 = (uint64_t)v352;
        v219 = v356;
        sub_2468D5F20();
        if (sub_2468D5F20() != v216)
          v217 = sub_2468D5F20();
        v220 = v368;
        v221 = v350;
        sub_2468AB35C(v368, v350, &qword_2575E4CA8);
        v222 = v221 + *(int *)(v351 + 36);
        *(_BYTE *)v222 = v217;
        *(_OWORD *)(v222 + 8) = 0u;
        *(_OWORD *)(v222 + 24) = 0u;
        *(_BYTE *)(v222 + 40) = 1;
        sub_2468A4D24(v220, &qword_2575E4CA8);
        sub_2468AB388(v221, v369, &qword_2575E4CB0);
        swift_retain();
        v223 = SiriMailModel.subject.getter();
        v225 = v224;
        swift_release();
        swift_bridgeObjectRelease();
        if ((v225 & 0x2000000000000000) != 0)
          v226 = HIBYTE(v225) & 0xF;
        else
          v226 = v223 & 0xFFFFFFFFFFFFLL;
        v227 = v357;
        sub_2468BC9F8(v108, v357);
        if (v226)
        {
          sub_2468BCE0C(v227);
          v228 = v391;
          v229 = v358;
LABEL_43:
          sub_2468BC9F8(v108, v229);
LABEL_44:
          sub_2468BCE0C(v229);
          v230 = *MEMORY[0x24BE99BA0];
LABEL_45:
          v379 = sub_2468D5C8C();
          v394 = v231;
          sub_2468D5C2C();
          swift_getKeyPath();
          sub_2468D5C38();
          swift_release();
          swift_release();
          v378 = *(_OWORD *)v397;
          v232 = *(_QWORD *)&v397[16];
          v233 = v398;
          v234 = (uint64_t *)(*(_QWORD *)(v108 + 8) + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_messageLabel);
          swift_beginAccess();
          v236 = *v234;
          v235 = v234[1];
          swift_bridgeObjectRetain();
          v237 = sub_2468D5C8C();
          *(_OWORD *)v397 = v378;
          *(_QWORD *)&v397[16] = v232;
          v398 = v233;
          v399 = (void *)v237;
          v400 = v238;
          v401 = v236;
          v402 = v235;
          v239 = (uint64_t)v382;
          sub_2468D5B30();
          v240 = (uint64_t)v362;
          ((void (*)(char *, uint64_t, uint64_t))v373)(v362, v230, v228);
          __swift_storeEnumTagSinglePayload(v240, 0, 1, v228);
          v241 = sub_2468BCEB0();
          v242 = v342;
          v243 = v383;
          v244 = (char *)v361;
          sub_2468D6100();
          sub_2468A4D24(v240, &qword_2575E4B10);
          sub_2468A4D24(v239, &qword_2575E4BE8);
          v245 = v399;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_release();

          *(_QWORD *)v397 = &type metadata for BodyTextEditor;
          *(_QWORD *)&v397[8] = v243;
          *(_QWORD *)&v397[16] = v241;
          v398 = v244;
          swift_getOpaqueTypeConformance2();
          v246 = (uint64_t)v346;
          v247 = v344;
          sub_2468D60F4();
          (*(void (**)(char *, uint64_t))(v343 + 8))(v242, v247);
          v248 = v345;
          sub_2468AB388(v246, v345, &qword_2575E4C88);
          swift_retain();
          v391 = sub_2468D5C20();
          v250 = v249;
          v387 = sub_2468D5C8C();
          v392 = v251;
          v396 = 0;
          sub_2468D61A8();
          v252 = v397[0];
          v253 = *(_QWORD *)&v397[8];
          sub_2468AB35C(v248, v246, &qword_2575E4C88);
          v254 = (uint64_t)v355;
          v255 = (void *)v379;
          v256 = v394;
          *v355 = v379;
          *(_QWORD *)(v254 + 8) = v256;
          v257 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4D28);
          sub_2468AB35C(v246, v254 + *(int *)(v257 + 48), &qword_2575E4C88);
          v258 = v254 + *(int *)(v257 + 64);
          *(_QWORD *)v258 = v391;
          *(_QWORD *)(v258 + 8) = v250;
          v259 = (void *)v387;
          v260 = v392;
          *(_QWORD *)(v258 + 16) = v387;
          *(_QWORD *)(v258 + 24) = v260;
          *(_BYTE *)(v258 + 32) = v252;
          *(_QWORD *)(v258 + 40) = v253;
          swift_retain();
          v261 = v255;
          swift_retain();
          v262 = v259;
          sub_2468A4D24(v248, &qword_2575E4C88);
          v263 = v371;
          swift_release();

          swift_release();
          sub_2468A4D24(v246, &qword_2575E4C88);

          v264 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4D10);
          __swift_storeEnumTagSinglePayload(v254, 0, 1, v264);
          v265 = v354;
          sub_2468AB388(v254, v354, &qword_2575E4C98);
LABEL_46:
          v266 = v369;
          v267 = v353;
          sub_2468AB35C(v369, v353, &qword_2575E4CB0);
          sub_2468AB35C(v265, v254, &qword_2575E4C98);
          v268 = v388;
          v269 = v385;
          *v263 = v388;
          v263[1] = v269;
          v270 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4D18);
          sub_2468AB35C(v267, (uint64_t)v263 + *(int *)(v270 + 48), &qword_2575E4CB0);
          sub_2468AB35C(v254, (uint64_t)v263 + *(int *)(v270 + 64), &qword_2575E4C98);
          v271 = v268;
          sub_2468A4D24(v265, &qword_2575E4C98);
          sub_2468A4D24(v266, &qword_2575E4CB0);

          sub_2468A4D24(v254, &qword_2575E4C98);
          sub_2468A4D24(v267, &qword_2575E4CB0);

          v272 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4CF8);
          __swift_storeEnumTagSinglePayload((uint64_t)v263, 0, 1, v272);
          v208 = v381;
          sub_2468AB388((uint64_t)v263, v381, &qword_2575E4CB8);
          v209 = (uint64_t)v263;
          goto LABEL_47;
        }
        v281 = v338;
        sub_2468D5B24();
        v228 = v391;
        ((void (*)(uint64_t, _QWORD, uint64_t))v373)(v219, *MEMORY[0x24BE99BA8], v391);
        __swift_storeEnumTagSinglePayload(v219, 0, 1, v228);
        v282 = v218 + *(int *)(v339 + 48);
        sub_2468AB35C(v281, v218, &qword_2575E4B10);
        sub_2468AB35C(v219, v282, &qword_2575E4B10);
        if (__swift_getEnumTagSinglePayload(v218, 1, v228) == 1)
        {
          sub_2468A4D24(v219, &qword_2575E4B10);
          sub_2468A4D24(v281, &qword_2575E4B10);
          sub_2468BCE0C(v227);
          if (__swift_getEnumTagSinglePayload(v282, 1, v228) == 1)
          {
            sub_2468A4D24(v218, &qword_2575E4B10);
            v229 = v358;
            goto LABEL_43;
          }
        }
        else
        {
          v283 = v327;
          sub_2468AB35C(v218, v327, &qword_2575E4B10);
          if (__swift_getEnumTagSinglePayload(v282, 1, v228) != 1)
          {
            v309 = v375;
            v310 = v218;
            v311 = v326;
            (*(void (**)(char *, uint64_t, uint64_t))(v375 + 32))(v326, v282, v228);
            sub_2468BD46C((uint64_t)&unk_2575E4C68);
            v312 = sub_2468D6460();
            v313 = *(void (**)(char *, uint64_t))(v309 + 8);
            v313(v311, v391);
            sub_2468A4D24(v356, &qword_2575E4B10);
            sub_2468A4D24(v338, &qword_2575E4B10);
            sub_2468BCE0C(v357);
            v313((char *)v283, v391);
            v228 = v391;
            v284 = v333;
            sub_2468A4D24(v310, &qword_2575E4B10);
            v229 = v358;
            sub_2468BC9F8(v108, v358);
            if ((v312 & 1) != 0)
              goto LABEL_44;
LABEL_54:
            sub_2468D5B24();
            v230 = *MEMORY[0x24BE99BA0];
            v285 = v332;
            ((void (*)(uint64_t, uint64_t, uint64_t))v373)(v332, v230, v228);
            __swift_storeEnumTagSinglePayload(v285, 0, 1, v228);
            v286 = v328;
            v287 = v328 + *(int *)(v339 + 48);
            sub_2468AB35C(v284, v328, &qword_2575E4B10);
            sub_2468AB35C(v285, v287, &qword_2575E4B10);
            if (__swift_getEnumTagSinglePayload(v286, 1, v228) == 1)
            {
              sub_2468A4D24(v285, &qword_2575E4B10);
              sub_2468A4D24(v284, &qword_2575E4B10);
              sub_2468BCE0C(v358);
              if (__swift_getEnumTagSinglePayload(v287, 1, v228) == 1)
              {
                sub_2468A4D24(v286, &qword_2575E4B10);
                goto LABEL_45;
              }
            }
            else
            {
              v307 = v325;
              sub_2468AB35C(v286, v325, &qword_2575E4B10);
              if (__swift_getEnumTagSinglePayload(v287, 1, v228) != 1)
              {
                v314 = v375;
                v315 = v326;
                (*(void (**)(char *, uint64_t, uint64_t))(v375 + 32))(v326, v287, v228);
                sub_2468BD46C((uint64_t)&unk_2575E4C68);
                v316 = sub_2468D6460();
                v317 = *(void (**)(char *, uint64_t))(v314 + 8);
                v317(v315, v391);
                sub_2468A4D24(v332, &qword_2575E4B10);
                sub_2468A4D24(v333, &qword_2575E4B10);
                sub_2468BCE0C(v358);
                v317((char *)v307, v391);
                v228 = v391;
                sub_2468A4D24(v286, &qword_2575E4B10);
                if ((v316 & 1) != 0)
                  goto LABEL_45;
LABEL_62:
                v308 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4D10);
                v265 = v354;
                __swift_storeEnumTagSinglePayload(v354, 1, 1, v308);
                v254 = (uint64_t)v355;
                v263 = v371;
                goto LABEL_46;
              }
              sub_2468A4D24(v332, &qword_2575E4B10);
              sub_2468A4D24(v333, &qword_2575E4B10);
              sub_2468BCE0C(v358);
              (*(void (**)(uint64_t, uint64_t))(v375 + 8))(v307, v228);
            }
            sub_2468A4D24(v286, &qword_2575E4C90);
            goto LABEL_62;
          }
          sub_2468A4D24(v356, &qword_2575E4B10);
          sub_2468A4D24(v338, &qword_2575E4B10);
          sub_2468BCE0C(v357);
          (*(void (**)(uint64_t, uint64_t))(v375 + 8))(v283, v228);
        }
        sub_2468A4D24(v218, &qword_2575E4C90);
        sub_2468BC9F8(v108, v358);
        v284 = v333;
        goto LABEL_54;
      }
    }
    while (1)
    {
LABEL_67:
      sub_2468D5C80();
      __break(1u);
    }
  }
  v207 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4CF8);
  __swift_storeEnumTagSinglePayload(v126, 1, 1, v207);
  v208 = v126;
  v209 = (uint64_t)v371;
LABEL_47:
  v273 = v393;
  sub_2468AB35C(v395, v393, &qword_2575E4CD8);
  v274 = v389;
  v275 = v380;
  sub_2468AB35C(v389, (uint64_t)v380, &qword_2575E4CC0);
  v276 = v390;
  v277 = v370;
  sub_2468AB35C(v390, v370, &qword_2575E4CC0);
  sub_2468AB35C(v208, v209, &qword_2575E4CB8);
  v278 = v372;
  sub_2468AB35C(v273, v372, &qword_2575E4CD8);
  v279 = v208;
  v280 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2575E4D00);
  sub_2468AB35C((uint64_t)v275, v278 + v280[12], &qword_2575E4CC0);
  sub_2468AB35C(v277, v278 + v280[16], &qword_2575E4CC0);
  sub_2468AB35C(v209, v278 + v280[20], &qword_2575E4CB8);
  sub_2468A4D24(v279, &qword_2575E4CB8);
  sub_2468A4D24(v276, &qword_2575E4CC0);
  sub_2468A4D24(v274, &qword_2575E4CC0);
  sub_2468A4D24(v395, &qword_2575E4CD8);
  sub_2468A4D24(v209, &qword_2575E4CB8);
  sub_2468A4D24(v277, &qword_2575E4CC0);
  sub_2468A4D24((uint64_t)v275, &qword_2575E4CC0);
  sub_2468A4D24(v393, &qword_2575E4CD8);
}

uint64_t sub_2468BB698@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t OpaqueTypeConformance2;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
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
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;

  v95 = a2;
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
  MEMORY[0x24BDAC7A8](v88);
  v81 = (char *)&v70 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4BE8);
  MEMORY[0x24BDAC7A8](v4);
  v79 = (char *)&v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = sub_2468D5E54();
  v77 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v7 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E38A8);
  v75 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  v9 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4D48);
  v82 = *(_QWORD *)(v80 - 8);
  MEMORY[0x24BDAC7A8](v80);
  v71 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4D50);
  v84 = *(_QWORD *)(v83 - 8);
  MEMORY[0x24BDAC7A8](v83);
  v78 = (char *)&v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4D58);
  v91 = *(_QWORD *)(v92 - 8);
  MEMORY[0x24BDAC7A8](v92);
  v73 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4D60);
  MEMORY[0x24BDAC7A8](v90);
  v89 = (char *)&v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4D68);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v94 = (char *)&v70 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v93 = (uint64_t)&v70 - v17;
  v70 = a1;
  v18 = (uint64_t *)(*(_QWORD *)(a1 + 8) + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_subjectLabel);
  swift_beginAccess();
  v19 = *v18;
  v20 = v18[1];
  *(_QWORD *)&v100 = v19;
  *((_QWORD *)&v100 + 1) = v20;
  sub_246897B28();
  swift_bridgeObjectRetain();
  v21 = sub_2468D6058();
  v23 = v22;
  v25 = v24 & 1;
  LODWORD(v100) = sub_2468D5E60();
  v86 = sub_2468D6028();
  v85 = v26;
  v74 = v27;
  v87 = v28;
  sub_2468A4F8C(v21, v23, v25);
  swift_bridgeObjectRelease();
  sub_2468D5DE8();
  type metadata accessor for SiriMailModel();
  sub_2468BD46C((uint64_t)&unk_2575E4C28);
  sub_2468D5C2C();
  swift_getKeyPath();
  sub_2468D5C38();
  swift_release();
  swift_release();
  sub_2468D628C();
  sub_2468D5E48();
  sub_2468BCF04((uint64_t)&qword_2575E38A0);
  v30 = v29;
  sub_2468BD46C((uint64_t)&unk_2575E4D70);
  v32 = v31;
  v33 = v71;
  v34 = v72;
  v35 = v76;
  sub_2468D60E8();
  v36 = v35;
  (*(void (**)(char *, uint64_t))(v77 + 8))(v7, v35);
  (*(void (**)(char *, uint64_t))(v75 + 8))(v9, v34);
  type metadata accessor for SceneClientView();
  __swift_instantiateConcreteTypeFromMangledName(qword_2575E4B18);
  v37 = v79;
  sub_2468D5B30();
  v38 = *MEMORY[0x24BE99BA8];
  v39 = sub_2468D5908();
  v40 = (uint64_t)v81;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 104))(v81, v38, v39);
  __swift_storeEnumTagSinglePayload(v40, 0, 1, v39);
  *(_QWORD *)&v100 = v34;
  *((_QWORD *)&v100 + 1) = v36;
  *(_QWORD *)&v101 = v30;
  *((_QWORD *)&v101 + 1) = v32;
  v41 = v73;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v43 = sub_2468BCBB0((uint64_t)&unk_2575E4B90);
  v44 = v78;
  v45 = (uint64_t)v37;
  v46 = v80;
  v47 = v88;
  sub_2468D6100();
  sub_2468A4D24(v40, &qword_2575E4B10);
  sub_2468A4D24(v45, &qword_2575E4BE8);
  (*(void (**)(char *, uint64_t))(v82 + 8))(v33, v46);
  v102 = 0;
  v100 = 0u;
  v101 = 0u;
  v96 = v46;
  v97 = v47;
  v98 = OpaqueTypeConformance2;
  v99 = v43;
  swift_getOpaqueTypeConformance2();
  v48 = v83;
  sub_2468D6094();
  sub_2468A4D24((uint64_t)&v100, &qword_2575E38C0);
  (*(void (**)(char *, uint64_t))(v84 + 8))(v44, v48);
  v49 = sub_2468D5F38();
  if (qword_2575E3808 != -1)
    swift_once();
  v50 = v74 & 1;
  sub_2468D5B18();
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v59 = v91;
  v60 = (uint64_t)v89;
  v61 = v92;
  (*(void (**)(char *, char *, uint64_t))(v91 + 16))(v89, v41, v92);
  v62 = v60 + *(int *)(v90 + 36);
  *(_BYTE *)v62 = v49;
  *(_QWORD *)(v62 + 8) = v52;
  *(_QWORD *)(v62 + 16) = v54;
  *(_QWORD *)(v62 + 24) = v56;
  *(_QWORD *)(v62 + 32) = v58;
  *(_BYTE *)(v62 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v59 + 8))(v41, v61);
  sub_2468BCF34();
  v63 = (uint64_t)v94;
  sub_2468D60F4();
  sub_2468A4D24(v60, &qword_2575E4D60);
  v64 = v93;
  sub_2468AB388(v63, v93, &qword_2575E4D68);
  sub_2468AB35C(v64, v63, &qword_2575E4D68);
  v65 = v95;
  v66 = v86;
  v67 = v85;
  *v95 = v86;
  v65[1] = v67;
  *((_BYTE *)v65 + 16) = v50;
  v65[3] = v87;
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4D80);
  sub_2468AB35C(v63, (uint64_t)v65 + *(int *)(v68 + 48), &qword_2575E4D68);
  sub_2468A7034(v66, v67, v50);
  swift_bridgeObjectRetain();
  sub_2468A4D24(v64, &qword_2575E4D68);
  sub_2468A4D24(v63, &qword_2575E4D68);
  sub_2468A4F8C(v66, v67, v50);
  return swift_bridgeObjectRelease();
}

void sub_2468BBF58()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (qword_2575E3828 != -1)
    swift_once();
  v0 = sub_2468D5AD0();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.siriMail);
  oslog = sub_2468D5AB8();
  v1 = sub_2468D6520();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_246894000, oslog, v1, "View did appear", v2, 2u);
    MEMORY[0x24956209C](v2, -1, -1);
  }

}

void sub_2468BC024(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  int EnumTagSinglePayload;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;

  v2 = sub_2468D5A1C();
  v30 = *(_QWORD *)(v2 - 8);
  v31 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2468D5914();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v29 - v13;
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))((char *)&v29 - v13, *MEMORY[0x24BE99BD8], v8);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2468D5A88();
  swift_release();
  swift_release();
  swift_release();
  v15 = sub_2468BDE90();
  v16 = *(void (**)(char *, uint64_t))(v9 + 8);
  v16(v12, v8);
  v16(v14, v8);
  if ((v15 & 1) != 0)
  {
    v17 = type metadata accessor for SceneClientView();
    __swift_instantiateConcreteTypeFromMangledName(qword_2575E4B18);
    sub_2468D5B24();
    v18 = sub_2468D5908();
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v18);
    sub_2468A4D24((uint64_t)v7, &qword_2575E4B10);
    if (EnumTagSinglePayload == 1)
    {
      v20 = *(_QWORD *)(a1 + 72);
      v32 = *(_BYTE *)(a1 + 64);
      v33 = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40E8);
      sub_2468D61B4();
      if (v34 == 1)
      {
        if (qword_2575E3828 != -1)
          swift_once();
        v21 = sub_2468D5AD0();
        __swift_project_value_buffer(v21, (uint64_t)static Logger.siriMail);
        v22 = sub_2468D5AB8();
        v23 = sub_2468D6520();
        if (os_log_type_enabled(v22, v23))
        {
          v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_246894000, v22, v23, "Got nil focus field, sending .returnedToVoiceMode Direct Invocation", v24, 2u);
          MEMORY[0x24956209C](v24, -1, -1);
        }

        v26 = v30;
        v25 = v31;
        (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v4, *MEMORY[0x24BE2E868], v31);
        sub_2468D5A10();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v4, v25);
        v27 = *(void **)(a1 + *(int *)(v17 + 40));
        if (v27)
        {
          v28 = v27;
          sub_2468D6424();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

        }
        else
        {
          sub_2468D6430();
          sub_2468BD46C((uint64_t)&qword_2575E4990);
          sub_2468D5C80();
          __break(1u);
        }
      }
    }
  }
}

uint64_t sub_2468BC3D0()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  if (qword_2575E3828 != -1)
    swift_once();
  v0 = sub_2468D5AD0();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.siriMail);
  v1 = sub_2468D5AB8();
  v2 = sub_2468D6520();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_246894000, v1, v2, "View will disappear", v3, 2u);
    MEMORY[0x24956209C](v3, -1, -1);
  }

  type metadata accessor for SiriMailModel();
  sub_2468BD46C((uint64_t)&unk_2575E4C78);
  swift_retain();
  sub_2468D5A40();
  return swift_release();
}

void sub_2468BC69C(void *a1@<X0>, uint64_t a2@<X8>)
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
  id v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;

  v4 = sub_2468D6238();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_0();
  v8 = v7 - v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4388);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_0();
  v13 = v12 - v11;
  sub_2468D622C();
  if (a1)
  {
    v14 = a1;
    v15 = sub_2468D63C4();

    if ((v15 & 1) != 0)
      v16 = sub_2468D5F2C();
    else
      v16 = sub_2468D5F14();
    v17 = v16;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v13, v8, v4);
    v18 = v13 + *(int *)(v9 + 36);
    *(_BYTE *)v18 = v17;
    *(_OWORD *)(v18 + 8) = 0u;
    *(_OWORD *)(v18 + 24) = 0u;
    *(_BYTE *)(v18 + 40) = 1;
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v4);
    sub_2468AB388(v13, a2, &qword_2575E4388);
  }
  else
  {
    sub_2468D6430();
    sub_2468BD46C((uint64_t)&qword_2575E4990);
    sub_2468D5C80();
    __break(1u);
  }
}

void sub_2468BC804(uint64_t a1@<X8>)
{
  void **v1;

  sub_2468BC69C(*v1, a1);
}

uint64_t sub_2468BC818()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4BE8);
  OUTLINED_FUNCTION_10_6();
  swift_release();
  swift_release();
  v2 = v0 + v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2575E4BF0) + 32);
  OUTLINED_FUNCTION_12_4();
  if (!OUTLINED_FUNCTION_5_6(v2))
    OUTLINED_FUNCTION_6_8();
  return OUTLINED_FUNCTION_4_8();
}

void sub_2468BC890(uint64_t a1)
{
  sub_2468BC9B4(a1, &qword_2575E4BE8, MEMORY[0x24BDEB0C8]);
}

uint64_t sub_2468BC8A4(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_0();
  v10 = v9 - v8;
  OUTLINED_FUNCTION_16_3(a1, v9 - v8);
  v11 = __swift_instantiateConcreteTypeFromMangledName(a3);
  return a4(v10, v11);
}

uint64_t sub_2468BC930()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4BF0);
  OUTLINED_FUNCTION_10_6();
  swift_release();
  swift_release();
  v3 = v0 + v1 + *(int *)(v2 + 32);
  OUTLINED_FUNCTION_12_4();
  if (!OUTLINED_FUNCTION_5_6(v3))
    OUTLINED_FUNCTION_6_8();
  return OUTLINED_FUNCTION_4_8();
}

void sub_2468BC9A0(uint64_t a1)
{
  sub_2468BC9B4(a1, &qword_2575E4BF0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDF47B8]);
}

void sub_2468BC9B4(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_8_0();
  sub_2468BC8A4(a1, v3 + v7, a2, a3);
  OUTLINED_FUNCTION_12_1();
}

uint64_t sub_2468BC9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SceneClientView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2468BCA40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SceneClientView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2468BCA84()
{
  return sub_2468BCD6C((uint64_t (*)(uint64_t))sub_2468BC024);
}

unint64_t sub_2468BCA90()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2575E4C40;
  if (!qword_2575E4C40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4C00);
    v2 = sub_2468BCB14();
    sub_2468BCF04((uint64_t)&unk_2575E4C58);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2575E4C40);
  }
  return result;
}

unint64_t sub_2468BCB14()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2575E4C48;
  if (!qword_2575E4C48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4BE0);
    sub_2468BCF04((uint64_t)&unk_2575E4C50);
    v3 = v2;
    sub_2468BCF04((uint64_t)&unk_2575E4C58);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2575E4C48);
  }
  return result;
}

unint64_t sub_2468BCBB0(uint64_t a1)
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

  result = OUTLINED_FUNCTION_14_4(a1);
  if (!result)
  {
    v5 = v4;
    v6 = v3;
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4B10);
    sub_2468BD46C(v6);
    v9 = v8;
    result = MEMORY[0x249562024](v5, v7, &v9);
    atomic_store(result, v1);
  }
  return result;
}

uint64_t objectdestroy_5Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OUTLINED_FUNCTION_11_5();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v4 = v3 + *(int *)(v1 + 36);
  OUTLINED_FUNCTION_12_4();
  if (!OUTLINED_FUNCTION_5_6(v4))
    OUTLINED_FUNCTION_7_6();
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_2575E4B18);
  swift_release();
  if (!OUTLINED_FUNCTION_5_6(v4 + *(int *)(v5 + 40)))
    OUTLINED_FUNCTION_7_6();

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_2468D5B78();
    OUTLINED_FUNCTION_1_0(v6);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_2468BCD60()
{
  return sub_2468BCD6C((uint64_t (*)(uint64_t))sub_2468BC3D0);
}

uint64_t sub_2468BCD6C(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_11_5();
  OUTLINED_FUNCTION_8_0();
  return a1(v1 + v2);
}

unint64_t sub_2468BCDA8(uint64_t a1)
{
  unint64_t *v1;
  unint64_t result;
  uint64_t *v3;
  uint64_t (*v4)(void);
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  uint64_t v8;
  _QWORD v9[2];

  result = OUTLINED_FUNCTION_14_4(a1);
  if (!result)
  {
    v6 = v5;
    v7 = v4;
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v9[0] = v7();
    v9[1] = v6;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_2468BCE0C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SceneClientView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2468BCE48()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_3();
}

void sub_2468BCE64()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_3();
}

void sub_2468BCE80()
{
  swift_retain();
  sub_2468D5D4C();
  OUTLINED_FUNCTION_3();
}

unint64_t sub_2468BCEB0()
{
  unint64_t result;

  result = qword_2575E4D20;
  if (!qword_2575E4D20)
  {
    result = MEMORY[0x249562024](&unk_2468D6EB8, &type metadata for BodyTextEditor);
    atomic_store(result, (unint64_t *)&qword_2575E4D20);
  }
  return result;
}

void sub_2468BCF04(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_14_4(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v1);
    OUTLINED_FUNCTION_7_0();
  }
  OUTLINED_FUNCTION_3();
}

unint64_t sub_2468BCF34()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[6];

  result = qword_2575E4D78;
  if (!qword_2575E4D78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4D60);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4D50);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4D48);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4B10);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E38A8);
    sub_2468D5E54();
    sub_2468BCF04((uint64_t)&qword_2575E38A0);
    sub_2468BD46C((uint64_t)&unk_2575E4D70);
    v3[4] = swift_getOpaqueTypeConformance2();
    v3[5] = sub_2468BCBB0((uint64_t)&unk_2575E4B90);
    v3[2] = v2;
    v3[3] = swift_getOpaqueTypeConformance2();
    v3[0] = swift_getOpaqueTypeConformance2();
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2575E4D78);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for SceneClientView.SendMessageDivider(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  return a1;
}

void destroy for SceneClientView.SendMessageDivider(id *a1)
{

}

uint64_t assignWithCopy for SceneClientView.SendMessageDivider(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for SceneClientView.SendMessageDivider(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneClientView.SendMessageDivider(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
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

uint64_t storeEnumTagSinglePayload for SceneClientView.SendMessageDivider(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneClientView.SendMessageDivider()
{
  return &type metadata for SceneClientView.SendMessageDivider;
}

unint64_t sub_2468BD230()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2575E4D88;
  if (!qword_2575E4D88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4C70);
    v2[0] = sub_2468BD29C();
    v2[1] = sub_2468BD398();
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2575E4D88);
  }
  return result;
}

unint64_t sub_2468BD29C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[6];

  result = qword_2575E4D90;
  if (!qword_2575E4D90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4C18);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4C08);
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4B10);
    v4 = MEMORY[0x24BDF0910];
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = sub_2468BCDA8((uint64_t)&unk_2575E4C38);
    v5[5] = sub_2468BCBB0((uint64_t)&qword_2575E4C60);
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = v4;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2575E4D90);
  }
  return result;
}

unint64_t sub_2468BD398()
{
  unint64_t result;

  result = qword_2575E4D98;
  if (!qword_2575E4D98)
  {
    result = MEMORY[0x249562024](MEMORY[0x24BDF08F0], MEMORY[0x24BDF0900]);
    atomic_store(result, (unint64_t *)&qword_2575E4D98);
  }
  return result;
}

uint64_t sub_2468BD3D4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2468BD3E8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2575E4DA0;
  if (!qword_2575E4DA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4388);
    sub_2468BD46C((uint64_t)&unk_2575E4DA8);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2575E4DA0);
  }
  return result;
}

void sub_2468BD46C(uint64_t a1)
{
  void (*v1)(uint64_t);

  if (!OUTLINED_FUNCTION_14_4(a1))
  {
    v1(255);
    OUTLINED_FUNCTION_7_0();
  }
  OUTLINED_FUNCTION_3();
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return sub_2468D61A8();
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_5_6(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_6_8()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_11_5()
{
  return type metadata accessor for SceneClientView();
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return sub_2468D5908();
}

uint64_t OUTLINED_FUNCTION_14_4(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_15_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_2468BCA40(v2, a1 + v1);
}

void OUTLINED_FUNCTION_16_3(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_2468AB35C(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_18_4()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return sub_2468D5D40();
}

uint64_t sub_2468BD564(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v16 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    v9 = (void *)a2[2];
    v8 = a2[3];
    *(_QWORD *)(a1 + 16) = v9;
    *(_QWORD *)(a1 + 24) = v8;
    v10 = a2[4];
    *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
    v11 = *(int *)(a3 + 28);
    v12 = (_QWORD *)(a1 + v11);
    v13 = (uint64_t *)((char *)a2 + v11);
    *(_QWORD *)(a1 + 32) = v10;
    swift_retain();
    v14 = v9;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_2468D5B78();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v12, v13, v15);
    }
    else
    {
      *v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v17 = *(int *)(a3 + 32);
    v18 = a1 + v17;
    v19 = (uint64_t)a2 + v17;
    *(_BYTE *)v18 = *(_BYTE *)v19;
    *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_2468BD690(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();

  swift_release();
  v4 = a1 + *(int *)(a2 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_2468D5B78();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  return swift_release();
}

uint64_t sub_2468BD72C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v8 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v7;
  v9 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v10 = *(int *)(a3 + 28);
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *(_QWORD *)(a1 + 32) = v9;
  swift_retain();
  v13 = v8;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_2468D5B78();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v11, v12, v14);
  }
  else
  {
    *v11 = *v12;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v15 = *(int *)(a3 + 32);
  v16 = a1 + v15;
  v17 = a2 + v15;
  *(_BYTE *)v16 = *(_BYTE *)v17;
  *(_QWORD *)(v16 + 8) = *(_QWORD *)(v17 + 8);
  swift_retain();
  return a1;
}

uint64_t sub_2468BD830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  v6 = *(void **)(a1 + 16);
  v7 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v7;
  v8 = v7;

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v9 = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = v9;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v10 = *(int *)(a3 + 28);
    v11 = (_QWORD *)(a1 + v10);
    v12 = (_QWORD *)(a2 + v10);
    sub_246897AB0(a1 + v10, &qword_2575E3850);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_2468D5B78();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v14 = *(int *)(a3 + 32);
  v15 = a1 + v14;
  v16 = a2 + v14;
  *(_BYTE *)v15 = *(_BYTE *)v16;
  *(_QWORD *)(v15 + 8) = *(_QWORD *)(v16 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2468BD97C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v7 = *(int *)(a3 + 28);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_2468D5B78();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 32)) = *(_OWORD *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t sub_2468BDA50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_release();
  v7 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  v8 = *(_BYTE *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = v8;
  swift_release();
  if (a1 != a2)
  {
    v9 = *(int *)(a3 + 28);
    v10 = (void *)(a1 + v9);
    v11 = (const void *)(a2 + v9);
    sub_246897AB0(a1 + v9, &qword_2575E3850);
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_2468D5B78();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v10, v11, v13);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
  }
  v14 = *(int *)(a3 + 32);
  v15 = a1 + v14;
  v16 = a2 + v14;
  *(_BYTE *)v15 = *(_BYTE *)v16;
  *(_QWORD *)(v15 + 8) = *(_QWORD *)(v16 + 8);
  swift_release();
  return a1;
}

uint64_t sub_2468BDB74()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_2468BDB80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_12_1();
  }
  else
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FB0);
    __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 28), a2, v6);
  }
}

uint64_t sub_2468BDBF0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2468BDBFC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FB0);
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for SceneHostView()
{
  uint64_t result;

  result = qword_2575E4E08;
  if (!qword_2575E4E08)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2468BDCA4()
{
  unint64_t v0;

  sub_2468A4A50();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_2468BDD2C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2468BDD3C(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x6C65636E6163;
  else
    v3 = 1684956531;
  if (v2)
    v4 = 0xE400000000000000;
  else
    v4 = 0xE600000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x6C65636E6163;
  else
    v5 = 1684956531;
  if ((a2 & 1) != 0)
    v6 = 0xE600000000000000;
  else
    v6 = 0xE400000000000000;
  if (v3 != v5 || v4 != v6)
    OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_18_5();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_12_1();
}

void sub_2468BDDB4(unsigned __int8 a1, char a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = 0x7466617264;
  v3 = a1;
  if (a1)
  {
    if (a1 == 1)
      v4 = 1953391987;
    else
      v4 = 0x656C6C65636E6163;
    if (v3 == 1)
      v5 = 0xE400000000000000;
    else
      v5 = 0xE900000000000064;
  }
  else
  {
    v5 = 0xE500000000000000;
    v4 = 0x7466617264;
  }
  if (a2)
  {
    if (a2 == 1)
      v2 = 1953391987;
    else
      v2 = 0x656C6C65636E6163;
    if (a2 == 1)
      v6 = 0xE400000000000000;
    else
      v6 = 0xE900000000000064;
  }
  else
  {
    v6 = 0xE500000000000000;
  }
  if (v4 != v2 || v5 != v6)
    OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_18_5();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_12_1();
}

uint64_t sub_2468BDE90()
{
  char v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_2468D5914();
  sub_24689B12C(&qword_2575E4EA0, (void (*)(uint64_t))MEMORY[0x24BE99C00]);
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_14_5();
  if (v5 == v3 && v6 == v4)
    v1 = 1;
  else
    v1 = OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_18_5();
  OUTLINED_FUNCTION_8_5();
  return v1 & 1;
}

void sub_2468BDF34(uint64_t a1@<X8>)
{
  sub_2468BDF90(&qword_2575E3850, (uint64_t (*)(_QWORD))MEMORY[0x24BDEB418], 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

void sub_2468BDF64(uint64_t a1@<X8>)
{
  sub_2468BDF90(&qword_2575E4508, (uint64_t (*)(_QWORD))MEMORY[0x24BDEEEA0], 0xD000000000000013, 0x80000002468DB1E0, a1);
}

void sub_2468BDF90(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
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
  os_log_type_t v21;
  NSObject *v22;
  uint8_t *v23;
  uint64_t v25;

  v9 = v5;
  v11 = sub_2468D5D94();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_0();
  v15 = v14 - v13;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_0();
  v19 = v18 - v17;
  sub_2468AB35C(v9, v18 - v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v20 = a2(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(a5, v19, v20);
  }
  else
  {
    v21 = sub_2468D6538();
    v22 = sub_2468D5ED8();
    if (os_log_type_enabled(v22, v21))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      *(_DWORD *)v23 = 136315138;
      sub_2468C21E8(a3, a4, &v25);
      sub_2468D658C();
      _os_log_impl(&dword_246894000, v22, v21, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v23, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_21_0();
    }

    sub_2468D5D88();
    swift_getAtKeyPath();
    OUTLINED_FUNCTION_26_0();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v11);
  }
  OUTLINED_FUNCTION_3_6();
}

uint64_t sub_2468BE18C(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v4 = sub_2468D5D94();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    v8 = sub_2468D6538();
    v9 = sub_2468D5ED8();
    v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v15 = v12;
      *(_DWORD *)v11 = 136315138;
      v14 = sub_2468C21E8(0xD000000000000015, 0x80000002468DB1C0, &v15);
      sub_2468D658C();
      _os_log_impl(&dword_246894000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24956209C](v12, -1, -1);
      MEMORY[0x24956209C](v11, -1, -1);
    }

    sub_2468D5D88();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v15;
  }
  return a1;
}

uint64_t sub_2468BE348()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
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
  char v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v21[16];
  uint64_t v22;
  unsigned __int8 v23;

  v1 = v0;
  v2 = OUTLINED_FUNCTION_6_9();
  OUTLINED_FUNCTION_0_3();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = &v21[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = &v21[-v8];
  MEMORY[0x24BDAC7A8](v7);
  v11 = &v21[-v10];
  v12 = *(_QWORD *)(v0 + 8);
  OUTLINED_FUNCTION_10_3();
  SiriMailModel.subject.getter();
  OUTLINED_FUNCTION_34();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_25_1();
  sub_2468C0950(v1, (uint64_t)v11);
  if (!v12)
  {
    sub_2468C0F9C((uint64_t)v11);
    OUTLINED_FUNCTION_15_3();
    goto LABEL_6;
  }
  v13 = *((_QWORD *)v11 + 1);
  OUTLINED_FUNCTION_10_3();
  SiriMailModel.body.getter();
  OUTLINED_FUNCTION_34();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_25_1();
  sub_2468C0F9C((uint64_t)v11);
  OUTLINED_FUNCTION_15_3();
  if (!v13)
  {
LABEL_6:
    sub_2468C0F9C((uint64_t)v9);
    OUTLINED_FUNCTION_16_4();
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_10_3();
  v14 = SiriMailModel.to.getter();
  OUTLINED_FUNCTION_34();
  v15 = *(_QWORD *)(v14 + 16);
  swift_bridgeObjectRelease();
  sub_2468C0F9C((uint64_t)v9);
  OUTLINED_FUNCTION_16_4();
  if (!v15)
  {
LABEL_7:
    v19 = 1;
    goto LABEL_8;
  }
  v16 = &v6[*(int *)(v2 + 32)];
  v17 = *v16;
  v18 = *((_QWORD *)v16 + 1);
  v21[8] = v17;
  v22 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40E8);
  sub_2468D61B4();
  v19 = v23;
LABEL_8:
  sub_2468C0F9C((uint64_t)v6);
  return v19;
}

void sub_2468BE4E4(uint64_t a1@<X8>)
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
  char *v13;
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
  uint64_t (**v34)();
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;

  v71 = a1;
  v2 = sub_2468D5914();
  v3 = *(_QWORD *)(v2 - 8);
  v74 = v2;
  v75 = v3;
  OUTLINED_FUNCTION_0_3();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v70 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v65 = (char *)&v55 - v7;
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_14();
  v60 = v9;
  v10 = OUTLINED_FUNCTION_6_9();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4E50);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_0();
  v17 = v16 - v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4E58);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_0();
  v22 = v21 - v20;
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4E60);
  v67 = *(_QWORD *)(v63 - 8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_14();
  v73 = v24;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4E68);
  v68 = *(_QWORD *)(v25 - 8);
  v69 = v25;
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_14();
  v62 = v27;
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4E70);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_14();
  v64 = v29;
  *(_QWORD *)v17 = sub_2468D5E18();
  *(_QWORD *)(v17 + 8) = 0;
  *(_BYTE *)(v17 + 16) = 0;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4E78);
  sub_2468BEB04(v1, v17 + *(int *)(v30 + 44));
  sub_2468C0950(v1, (uint64_t)v13);
  v31 = *(unsigned __int8 *)(v11 + 80);
  v32 = (v31 + 16) & ~v31;
  v72 = v31 | 7;
  v59 = v32 + v12;
  v33 = swift_allocObject();
  v58 = v32;
  sub_2468C0998((uint64_t)v13, v33 + v32);
  sub_2468AB35C(v17, v22, &qword_2575E4E50);
  v57 = v18;
  v34 = (uint64_t (**)())(v22 + *(int *)(v18 + 36));
  *v34 = sub_2468C09DC;
  v34[1] = (uint64_t (*)())v33;
  v34[2] = 0;
  v34[3] = 0;
  sub_246897AB0(v17, &qword_2575E4E50);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  v35 = v60;
  sub_2468D5A88();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_23_3();
  sub_2468C0950(v1, (uint64_t)v13);
  v36 = swift_allocObject() + v32;
  sub_2468C0998((uint64_t)v13, v36);
  v56 = sub_2468C0A00();
  v37 = sub_2468C0A84();
  v38 = v61;
  sub_2468D610C();
  OUTLINED_FUNCTION_23_3();
  sub_246897AB0(v35, &qword_2575E4B10);
  sub_246897AB0(v22, &qword_2575E4E58);
  swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_10_3();
  v39 = v65;
  sub_2468D5A88();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_26_0();
  v40 = v1;
  sub_2468C0950(v1, (uint64_t)v13);
  v41 = swift_allocObject();
  OUTLINED_FUNCTION_22_2(v41);
  v76 = v57;
  v77 = v38;
  v78 = v56;
  v79 = v37;
  swift_getOpaqueTypeConformance2();
  sub_24689B12C(&qword_2575E4E90, (void (*)(uint64_t))MEMORY[0x24BE99C00]);
  v43 = v62;
  v42 = v63;
  v44 = v74;
  v45 = v73;
  sub_2468D610C();
  OUTLINED_FUNCTION_26_0();
  v46 = *(void (**)(char *, uint64_t))(v75 + 8);
  v46(v39, v44);
  (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v45, v42);
  sub_2468C0950(v40, (uint64_t)v13);
  v47 = swift_allocObject();
  OUTLINED_FUNCTION_22_2(v47);
  v49 = v68;
  v48 = v69;
  v50 = v64;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v68 + 16))(v64, v43, v69);
  v51 = (_QWORD *)(v50 + *(int *)(v66 + 36));
  *v51 = 0;
  v51[1] = 0;
  v51[2] = sub_2468C0B68;
  v51[3] = v47;
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v43, v48);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2468D5A88();
  swift_release();
  OUTLINED_FUNCTION_34();
  swift_release();
  v52 = v74;
  v53 = v70;
  (*(void (**)(char *, _QWORD, uint64_t))(v75 + 104))(v70, *MEMORY[0x24BE99BD8], v74);
  LOBYTE(v47) = sub_2468BDE90();
  v46(v53, v52);
  v46(v39, v52);
  v54 = v71;
  sub_2468AB35C(v50, v71, &qword_2575E4E70);
  *(_BYTE *)(v54 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2575E4E98) + 36)) = v47 & 1;
  sub_246897AB0(v50, &qword_2575E4E70);
  OUTLINED_FUNCTION_3_6();
}

void sub_2468BEB04(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  int v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  v74 = a2;
  v59 = sub_2468D6358();
  v58 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59);
  v60 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2468D5914();
  v67 = *(_QWORD *)(v4 - 8);
  v68 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v66 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = sub_2468D59C8();
  v65 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v64 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4EC0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v73 = (uint64_t)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v62 = (char *)&v58 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4EC8);
  MEMORY[0x24BDAC7A8](v11);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4ED0);
  v70 = *(_QWORD *)(v72 - 8);
  v12 = MEMORY[0x24BDAC7A8](v72);
  v71 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v58 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4ED8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4EE0);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v69 = (uint64_t)&v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v58 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v58 - v25;
  *(_QWORD *)v18 = sub_2468D5DAC();
  *((_QWORD *)v18 + 1) = 0;
  v27 = 1;
  v18[16] = 1;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4EE8);
  sub_2468BF190(a1, &v18[*(int *)(v28 + 44)]);
  v29 = sub_2468D5EF0();
  sub_2468AB35C((uint64_t)v18, (uint64_t)v24, &qword_2575E4ED8);
  v30 = &v24[*(int *)(v19 + 36)];
  *v30 = v29;
  *(_OWORD *)(v30 + 8) = 0u;
  *(_OWORD *)(v30 + 24) = 0u;
  v30[40] = 1;
  sub_246897AB0((uint64_t)v18, &qword_2575E4ED8);
  v31 = (uint64_t)v26;
  sub_2468AB388((uint64_t)v24, (uint64_t)v26, &qword_2575E4EE0);
  type metadata accessor for SiriMailModel();
  sub_24689B12C(&qword_2575E4C28, (void (*)(uint64_t))type metadata accessor for SiriMailModel);
  v32 = (uint64_t)v62;
  sub_2468D5C2C();
  swift_getKeyPath();
  sub_2468D5C38();
  swift_release();
  swift_release();
  v33 = (void (*)(uint64_t))MEMORY[0x24BE99CD0];
  sub_24689B12C(&qword_2575E3E28, (void (*)(uint64_t))MEMORY[0x24BE99CD0]);
  sub_24689B12C(&qword_2575E3DD0, v33);
  sub_24689B12C(&qword_2575E4EF0, v33);
  v34 = v15;
  v35 = v63;
  sub_2468D5830();
  swift_retain();
  v36 = v64;
  sub_2468CB910();
  swift_release();
  v37 = v66;
  sub_2468D5920();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v36, v35);
  v38 = v67;
  v39 = v37;
  v40 = v37;
  v41 = v68;
  v42 = (*(uint64_t (**)(char *, uint64_t))(v67 + 88))(v39, v68);
  LODWORD(v36) = *MEMORY[0x24BE99BD0];
  (*(void (**)(char *, uint64_t))(v38 + 8))(v40, v41);
  if (v42 == (_DWORD)v36)
  {
    v43 = (uint64_t *)(*(_QWORD *)(a1 + 8) + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_sentLabel);
    swift_beginAccess();
    v44 = *v43;
    v45 = v43[1];
    v77 = MEMORY[0x24BEE0D00];
    v78 = MEMORY[0x24BEAE5B8];
    v75 = v44;
    v76 = v45;
    (*(void (**)(char *, _QWORD, uint64_t))(v58 + 104))(v60, *MEMORY[0x24BEADF78], v59);
    swift_bridgeObjectRetain();
    sub_2468D6364();
    v27 = 0;
  }
  v46 = sub_2468D6370();
  __swift_storeEnumTagSinglePayload(v32, v27, 1, v46);
  v61 = v31;
  v47 = v69;
  sub_2468AB35C(v31, v69, &qword_2575E4EE0);
  v48 = v70;
  v49 = v71;
  v50 = *(void (**)(char *, char *, uint64_t))(v70 + 16);
  v51 = v34;
  v52 = v34;
  v53 = v72;
  v50(v71, v52, v72);
  v54 = v73;
  sub_2468AB35C(v32, v73, &qword_2575E4EC0);
  v55 = v74;
  sub_2468AB35C(v47, v74, &qword_2575E4EE0);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4EF8);
  v50((char *)(v55 + *(int *)(v56 + 48)), v49, v53);
  sub_2468AB35C(v54, v55 + *(int *)(v56 + 64), &qword_2575E4EC0);
  sub_246897AB0(v32, &qword_2575E4EC0);
  v57 = *(void (**)(char *, uint64_t))(v48 + 8);
  v57(v51, v53);
  sub_246897AB0(v61, &qword_2575E4EE0);
  sub_246897AB0(v54, &qword_2575E4EC0);
  v57(v49, v53);
  sub_246897AB0(v47, &qword_2575E4EE0);
}

uint64_t sub_2468BF190@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  char v18;
  uint64_t v19;
  __int128 v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t KeyPath;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  void (*v40)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  __int128 v53;
  char v54;
  __int128 v55;
  char v56;
  uint64_t v57;

  v51 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4F00);
  v49 = *(_QWORD *)(v3 - 8);
  v50 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v45 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4F08);
  v5 = MEMORY[0x24BDAC7A8](v48);
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v47 = (uint64_t)&v42 - v8;
  v9 = type metadata accessor for SceneHostView();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4F10);
  v46 = *(_QWORD *)(v43 - 8);
  v13 = MEMORY[0x24BDAC7A8](v43);
  v44 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v42 - v15;
  v17 = sub_2468D5E0C();
  sub_2468BF5B4((uint64_t)&v53);
  v18 = v54;
  v19 = v55;
  v20 = v53;
  v53 = (unint64_t)v17;
  v54 = 1;
  v55 = v20;
  v56 = v18;
  v57 = v19;
  sub_2468C0950(a1, (uint64_t)v12);
  v21 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v22 = swift_allocObject();
  sub_2468C0998((uint64_t)v12, v22 + v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4F18);
  sub_24689B0F8(&qword_2575E4F20, &qword_2575E4F18);
  sub_2468D60D0();
  swift_release();
  sub_2468A4F8C(v55, *((uint64_t *)&v55 + 1), v56);
  swift_bridgeObjectRelease();
  sub_2468C0950(a1, (uint64_t)v12);
  v23 = swift_allocObject();
  sub_2468C0998((uint64_t)v12, v23 + v21);
  v52 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4F28);
  sub_2468C0D00();
  v24 = v45;
  sub_2468D61D8();
  LOBYTE(a1) = sub_2468BE348();
  KeyPath = swift_getKeyPath();
  v26 = swift_allocObject();
  *(_BYTE *)(v26 + 16) = a1 & 1;
  v28 = v49;
  v27 = v50;
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v7, v24, v50);
  v29 = (uint64_t *)&v7[*(int *)(v48 + 36)];
  *v29 = KeyPath;
  v29[1] = (uint64_t)sub_2468C0F84;
  v29[2] = v26;
  (*(void (**)(char *, uint64_t))(v28 + 8))(v24, v27);
  v30 = v47;
  sub_2468AB388((uint64_t)v7, v47, &qword_2575E4F08);
  v31 = v46;
  v32 = *(void (**)(char *, char *, uint64_t))(v46 + 16);
  v33 = v44;
  v34 = v16;
  v35 = v16;
  v36 = v43;
  v32(v44, v35, v43);
  sub_2468AB35C(v30, (uint64_t)v7, &qword_2575E4F08);
  v37 = v51;
  v32(v51, v33, v36);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4F98);
  v39 = &v37[*(int *)(v38 + 48)];
  *(_QWORD *)v39 = 0;
  v39[8] = 1;
  sub_2468AB35C((uint64_t)v7, (uint64_t)&v37[*(int *)(v38 + 64)], &qword_2575E4F08);
  sub_246897AB0(v30, &qword_2575E4F08);
  v40 = *(void (**)(char *, uint64_t))(v31 + 8);
  v40(v34, v36);
  sub_246897AB0((uint64_t)v7, &qword_2575E4F08);
  return ((uint64_t (*)(char *, uint64_t))v40)(v33, v36);
}

uint64_t sub_2468BF5B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;

  swift_retain();
  v2 = SiriMailModel.subject.getter();
  v4 = v3;
  swift_release();
  swift_bridgeObjectRelease();
  v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v5 = v2 & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    swift_retain();
    SiriMailModel.subject.getter();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  sub_246897B28();
  v6 = sub_2468D6058();
  v8 = v7;
  v10 = v9 & 1;
  sub_2468D5F44();
  v11 = sub_2468D6040();
  v13 = v12;
  v15 = v14;
  swift_release();
  sub_2468A4F8C(v6, v8, v10);
  swift_bridgeObjectRelease();
  v16 = sub_2468D6034();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  sub_2468A4F8C(v11, v13, v15 & 1);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v16;
  *(_QWORD *)(a1 + 8) = v18;
  *(_BYTE *)(a1 + 16) = v20 & 1;
  *(_QWORD *)(a1 + 24) = v22;
  return result;
}

uint64_t sub_2468BF738(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  uint64_t result;
  uint64_t v9;

  v2 = sub_2468D5710();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void **)(a1 + 16);
  if (v6)
  {
    v7 = v6;
    sub_2468D5704();
    sub_2468D6418();

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    sub_2468D6430();
    sub_24689B12C(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    result = sub_2468D5C80();
    __break(1u);
  }
  return result;
}

void sub_2468BF838(uint64_t a1)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_1;
  void *v9;
  id v10;
  void *v11;
  id v12;
  char *v13;
  char v14;
  uint64_t v15;
  id v16;
  uint64_t v17[6];

  v2 = *(_BYTE *)(a1 + 40);
  v3 = swift_retain();
  sub_2468BE18C(v3, v2);
  swift_release();
  v4 = sub_2468D59D4();
  v5 = (void (*)(uint64_t))MEMORY[0x24BE99D00];
  v17[3] = v4;
  sub_24689B12C(&qword_2575E4EA8, (void (*)(uint64_t))MEMORY[0x24BE99D00]);
  v17[4] = v6;
  sub_24689B12C(&qword_2575E4EB0, v5);
  v17[5] = v7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v17);
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x24BE99CF8], v4);
  sub_2468D583C();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  v9 = *(void **)(a1 + 16);
  if (v9)
  {
    v10 = v9;
    v11 = (void *)sub_2468D5758();
    v12 = objc_msgSend(v11, sel_identifier);

    sub_2468D6484();
    sub_2468D6448();
    sub_2468D6424();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v13 = (char *)(a1 + *(int *)(type metadata accessor for SceneHostView() + 32));
    v14 = *v13;
    v15 = *((_QWORD *)v13 + 1);
    LOBYTE(v17[0]) = v14;
    v17[1] = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40E8);
    sub_2468D61C0();
    v16 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
    objc_msgSend(v16, sel_sendAction_to_from_forEvent_, sel_resignFirstResponder, 0, 0, 0);

  }
  else
  {
    sub_2468D6430();
    sub_24689B12C(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    sub_2468D5C80();
    __break(1u);
  }
}

uint64_t sub_2468BFA88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
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
  uint64_t v14;
  uint64_t result;

  v2 = sub_2468D6184();
  v3 = sub_2468D5EF0();
  sub_2468D5B18();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = sub_2468D6160();
  if ((sub_2468BE348() & 1) != 0)
    v13 = sub_2468D613C();
  else
    v13 = sub_2468D6130();
  v14 = v13;
  result = sub_2468D5EF0();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v9;
  *(_QWORD *)(a1 + 40) = v11;
  *(_BYTE *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = v12;
  *(_QWORD *)(a1 + 64) = v14;
  *(_BYTE *)(a1 + 72) = result;
  *(_WORD *)(a1 + 73) = 256;
  return result;
}

void sub_2468BFB4C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = sub_2468D59C8();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  sub_2468CBE94((uint64_t)v4);
}

void sub_2468BFBCC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  void (*v17)(char *, uint64_t);
  void *v18;
  char **v19;
  id v20;
  void *v21;
  uint64_t v22;

  v2 = sub_2468D5B78();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v22 - v7;
  if (qword_2575E3828 != -1)
    swift_once();
  v9 = sub_2468D5AD0();
  __swift_project_value_buffer(v9, (uint64_t)static Logger.siriMail);
  v10 = sub_2468D5AB8();
  v11 = sub_2468D6520();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_246894000, v10, v11, "#SceneHostView View did appear", v12, 2u);
    MEMORY[0x24956209C](v12, -1, -1);
  }

  v13 = *(void **)(a1 + 16);
  if (v13)
  {
    v14 = v13;
    v15 = (void *)sub_2468D63F4();

    if (v15)
    {
      if ((objc_msgSend(v15, sel_respondsToSelector_, sel_informHostOfBackgroundColor_) & 1) != 0)
      {
        type metadata accessor for SceneHostView();
        sub_2468BDF90(&qword_2575E3850, (uint64_t (*)(_QWORD))MEMORY[0x24BDEB418], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v8);
        (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BDEB3F0], v2);
        v16 = sub_2468D5B6C();
        v17 = *(void (**)(char *, uint64_t))(v3 + 8);
        v17(v6, v2);
        v17(v8, v2);
        v18 = (void *)objc_opt_self();
        v19 = &selRef_systemBlackColor;
        if ((v16 & 1) == 0)
          v19 = &selRef_systemWhiteColor;
        v20 = objc_msgSend(v18, *v19);
        sub_2468C0B74();
        MEMORY[0x249561604](v20);
        v21 = (void *)sub_2468D6568();
        objc_msgSend(v15, sel_informHostOfBackgroundColor_, v21);

        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    sub_2468D6430();
    sub_24689B12C(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    sub_2468D5C80();
    __break(1u);
  }
}

void sub_2468BFEA0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  char *v16;
  uint64_t (*v17)(char *, uint64_t);
  int v18;
  int v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  const char *v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int EnumTagSinglePayload;
  uint64_t v32;
  int v33;
  int v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;

  v38 = a1;
  v39 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v38 - v8;
  v10 = sub_2468D5914();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v38 - v15;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2468D5A88();
  swift_release();
  swift_release();
  swift_release();
  v17 = *(uint64_t (**)(char *, uint64_t))(v11 + 88);
  v18 = v17(v16, v10);
  v19 = *MEMORY[0x24BE99BD0];
  v20 = *(void (**)(char *, uint64_t))(v11 + 8);
  v20(v16, v10);
  if (v18 == v19)
  {
    if (qword_2575E3828 != -1)
      swift_once();
    v21 = sub_2468D5AD0();
    __swift_project_value_buffer(v21, (uint64_t)static Logger.siriMail);
    v22 = sub_2468D5AB8();
    v23 = sub_2468D6544();
    if (!os_log_type_enabled(v22, v23))
      goto LABEL_12;
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    v25 = "#SceneHostView focus changed, but we're already sending the email: do nothing";
LABEL_11:
    _os_log_impl(&dword_246894000, v22, v23, v25, v24, 2u);
    MEMORY[0x24956209C](v24, -1, -1);
LABEL_12:

    return;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2468D5A88();
  swift_release();
  swift_release();
  swift_release();
  v26 = v17(v14, v10);
  v27 = *MEMORY[0x24BE99BF8];
  v20(v14, v10);
  if (v26 == v27)
  {
    if (qword_2575E3828 != -1)
      swift_once();
    v28 = sub_2468D5AD0();
    __swift_project_value_buffer(v28, (uint64_t)static Logger.siriMail);
    v22 = sub_2468D5AB8();
    v23 = sub_2468D6544();
    if (!os_log_type_enabled(v22, v23))
      goto LABEL_12;
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    v25 = "#SceneHostView focus changed, but we've already cancelled the email: do nothing";
    goto LABEL_11;
  }
  v29 = sub_2468D5908();
  v30 = v38;
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v38, 1, v29);
  v32 = v39;
  sub_2468AB35C(v39, (uint64_t)v9, &qword_2575E4B10);
  if (EnumTagSinglePayload == 1 && __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v29) != 1)
  {
    sub_246897AB0((uint64_t)v9, &qword_2575E4B10);
    v37 = *(void **)(a3 + 16);
    if (v37)
    {
      v36 = v37;
      sub_2468D63E8();
      goto LABEL_23;
    }
LABEL_24:
    sub_2468D6430();
    sub_24689B12C(&qword_2575E4990, (void (*)(uint64_t))MEMORY[0x24BEAE580]);
    sub_2468D5C80();
    __break(1u);
    return;
  }
  sub_246897AB0((uint64_t)v9, &qword_2575E4B10);
  v33 = __swift_getEnumTagSinglePayload(v30, 1, v29);
  sub_2468AB35C(v32, (uint64_t)v7, &qword_2575E4B10);
  if (v33 == 1)
  {
    sub_246897AB0((uint64_t)v7, &qword_2575E4B10);
    return;
  }
  v34 = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v29);
  sub_246897AB0((uint64_t)v7, &qword_2575E4B10);
  if (v34 == 1)
  {
    v35 = *(void **)(a3 + 16);
    if (v35)
    {
      v36 = v35;
      sub_2468D63DC();
LABEL_23:

      return;
    }
    goto LABEL_24;
  }
}

uint64_t sub_2468C0338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t result;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;

  v5 = sub_2468D5914();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2575E3828 != -1)
    swift_once();
  v9 = sub_2468D5AD0();
  __swift_project_value_buffer(v9, (uint64_t)static Logger.siriMail);
  v10 = sub_2468D5AB8();
  v11 = sub_2468D6520();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_246894000, v10, v11, "#SceneHostView View did change", v12, 2u);
    MEMORY[0x24956209C](v12, -1, -1);
  }

  sub_24689B12C(&qword_2575E4E90, (void (*)(uint64_t))MEMORY[0x24BE99C00]);
  result = sub_2468D6460();
  if ((result & 1) == 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
    v14 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v8, v5);
    v15 = *MEMORY[0x24BE99BD0];
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    if (v14 == v15)
    {
      v16 = a3 + *(int *)(type metadata accessor for SceneHostView() + 32);
      v17 = *(_QWORD *)(v16 + 8);
      LOBYTE(v30) = *(_BYTE *)v16;
      v31 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575E40E8);
      result = sub_2468D61B4();
      if ((v35 & 1) == 0)
      {
        v18 = sub_2468D5AB8();
        v19 = sub_2468D6544();
        if (os_log_type_enabled(v18, v19))
        {
          v20 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_246894000, v18, v19, "#SceneHostView model state changed to .sent, view sending action", v20, 2u);
          MEMORY[0x24956209C](v20, -1, -1);
        }

        v21 = *(_BYTE *)(a3 + 40);
        v22 = swift_retain();
        sub_2468BE18C(v22, v21);
        swift_release();
        v23 = sub_2468D59D4();
        v24 = (void (*)(uint64_t))MEMORY[0x24BE99D00];
        v32 = v23;
        sub_24689B12C(&qword_2575E4EA8, (void (*)(uint64_t))MEMORY[0x24BE99D00]);
        v33 = v25;
        sub_24689B12C(&qword_2575E4EB0, v24);
        v34 = v26;
        v27 = __swift_allocate_boxed_opaque_existential_1(&v30);
        (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v27, *MEMORY[0x24BE99CF8], v23);
        sub_2468D583C();
        swift_release();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v30);
        v28 = *(_QWORD *)(v16 + 8);
        LOBYTE(v30) = *(_BYTE *)v16;
        v31 = v28;
        v35 = 1;
        return sub_2468D61C0();
      }
    }
  }
  return result;
}

uint64_t sub_2468C0680()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  if (qword_2575E3828 != -1)
    swift_once();
  v0 = sub_2468D5AD0();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.siriMail);
  v1 = sub_2468D5AB8();
  v2 = sub_2468D6520();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_246894000, v1, v2, "#SceneHostView View will disappear", v3, 2u);
    MEMORY[0x24956209C](v3, -1, -1);
  }

  type metadata accessor for SiriMailModel();
  sub_24689B12C(&qword_2575E4C78, (void (*)(uint64_t))type metadata accessor for SiriMailModel);
  swift_retain();
  sub_2468D5A40();
  return swift_release();
}

uint64_t sub_2468C0950(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SceneHostView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2468C0998(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SceneHostView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2468C09DC()
{
  return sub_2468C0CCC((uint64_t (*)(uint64_t))sub_2468BFBCC);
}

uint64_t sub_2468C09F4(uint64_t a1, uint64_t a2)
{
  return sub_2468C0B18(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2468BFEA0);
}

unint64_t sub_2468C0A00()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2575E4E80;
  if (!qword_2575E4E80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4E58);
    sub_24689B0F8(&qword_2575E4E88, &qword_2575E4E50);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2575E4E80);
  }
  return result;
}

unint64_t sub_2468C0A84()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_2575E4C60;
  if (!qword_2575E4C60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4B10);
    sub_24689B12C(&qword_2575E4C68, (void (*)(uint64_t))MEMORY[0x24BE99BB0]);
    v3 = v2;
    result = MEMORY[0x249562024](MEMORY[0x24BEE4AB8], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_2575E4C60);
  }
  return result;
}

uint64_t sub_2468C0B0C(uint64_t a1, uint64_t a2)
{
  return sub_2468C0B18(a1, a2, sub_2468C0338);
}

uint64_t sub_2468C0B18(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v6;

  OUTLINED_FUNCTION_6_9();
  OUTLINED_FUNCTION_8_0();
  return a3(a1, a2, v3 + v6);
}

uint64_t sub_2468C0B68()
{
  return sub_2468C0CCC((uint64_t (*)(uint64_t))sub_2468C0680);
}

unint64_t sub_2468C0B74()
{
  unint64_t result;

  result = qword_2575E4EB8;
  if (!qword_2575E4EB8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2575E4EB8);
  }
  return result;
}

void sub_2468C0BB0()
{
  sub_2468CB910();
  OUTLINED_FUNCTION_3();
}

uint64_t sub_2468C0BD4()
{
  return sub_2468C0CCC(sub_2468BF738);
}

uint64_t objectdestroyTm_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_6_9();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();

  swift_release();
  v4 = v3 + *(int *)(v1 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_2468D5B78();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2468C0CC0()
{
  return sub_2468C0CCC((uint64_t (*)(uint64_t))sub_2468BF838);
}

uint64_t sub_2468C0CCC(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_6_9();
  OUTLINED_FUNCTION_8_0();
  return a1(v1 + v2);
}

uint64_t sub_2468C0CF8@<X0>(uint64_t a1@<X8>)
{
  return sub_2468BFA88(a1);
}

unint64_t sub_2468C0D00()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2575E4F30;
  if (!qword_2575E4F30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4F28);
    v2 = sub_2468C0D84();
    sub_24689B0F8(&qword_2575E4F88, &qword_2575E4F90);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2575E4F30);
  }
  return result;
}

unint64_t sub_2468C0D84()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2575E4F38;
  if (!qword_2575E4F38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4F40);
    v2 = sub_2468C0E08();
    sub_24689B0F8(&qword_2575E4F78, &qword_2575E4F80);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2575E4F38);
  }
  return result;
}

unint64_t sub_2468C0E08()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_2575E4F48;
  if (!qword_2575E4F48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4F50);
    v2 = sub_2468C0E8C();
    sub_24689B0F8(&qword_2575E4F68, &qword_2575E4F70);
    v4[0] = v2;
    v4[1] = v3;
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2575E4F48);
  }
  return result;
}

unint64_t sub_2468C0E8C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2575E4F58;
  if (!qword_2575E4F58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4F60);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2575E4F58);
  }
  return result;
}

void sub_2468C0EF0()
{
  _BYTE *v0;

  *v0 = OUTLINED_FUNCTION_13_4() & 1;
  OUTLINED_FUNCTION_3();
}

void sub_2468C0F10()
{
  _BYTE *v0;

  *v0 = OUTLINED_FUNCTION_13_4() & 1;
  OUTLINED_FUNCTION_3();
}

void sub_2468C0F30()
{
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_3();
}

void sub_2468C0F48()
{
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_3();
}

_BYTE *sub_2468C0F60(_BYTE *result, char a2)
{
  *result &= a2 ^ 1;
  return result;
}

uint64_t sub_2468C0F74()
{
  return swift_deallocObject();
}

_BYTE *sub_2468C0F84(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_2468C0F9C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SceneHostView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2468C0FDC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2575E4FA0;
  if (!qword_2575E4FA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4E98);
    v2[0] = sub_2468C1048();
    v2[1] = sub_2468BD398();
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2575E4FA0);
  }
  return result;
}

unint64_t sub_2468C1048()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t OpaqueTypeConformance2;
  uint64_t v6;
  _QWORD v7[6];

  result = qword_2575E4FA8;
  if (!qword_2575E4FA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4E70);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4E60);
    v3 = sub_2468D5914();
    v4 = (void (*)(uint64_t))MEMORY[0x24BE99C00];
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4E58);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4B10);
    sub_2468C0A00();
    sub_2468C0A84();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_24689B12C(&qword_2575E4E90, v4);
    v7[2] = v2;
    v7[3] = v3;
    v7[4] = OpaqueTypeConformance2;
    v7[5] = v6;
    v7[0] = swift_getOpaqueTypeConformance2();
    v7[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v7);
    atomic_store(result, (unint64_t *)&qword_2575E4FA8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_8()
{
  return sub_2468D6784();
}

uint64_t OUTLINED_FUNCTION_6_9()
{
  return type metadata accessor for SceneHostView();
}

uint64_t OUTLINED_FUNCTION_13_4()
{
  return sub_2468D5D58();
}

uint64_t OUTLINED_FUNCTION_14_5()
{
  return sub_2468D64C0();
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2468C0950(v0, v1);
}

uint64_t OUTLINED_FUNCTION_16_4()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2468C0950(v1, v0);
}

uint64_t OUTLINED_FUNCTION_18_5()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_21_0()
{
  JUMPOUT(0x24956209CLL);
}

uint64_t OUTLINED_FUNCTION_22_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_2468C0998(v2, a1 + v1);
}

uint64_t OUTLINED_FUNCTION_23_3()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return sub_2468D5D64();
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return swift_release();
}

uint64_t SendMessageView.message.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_0_7();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t SendMessageView.init(message:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;

  v4 = OUTLINED_FUNCTION_0_7();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_4_9(a2);
  OUTLINED_FUNCTION_4_9((uint64_t)v7);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, v7, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  result = type metadata accessor for SendMessageView();
  v11 = a2 + *(int *)(result + 20);
  *(_QWORD *)v11 = sub_2468C1414;
  *(_QWORD *)(v11 + 8) = v9;
  *(_BYTE *)(v11 + 16) = 0;
  return result;
}

uint64_t sub_2468C132C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_2468D59C8();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  type metadata accessor for SiriMailModel();
  swift_allocObject();
  return SiriMailModel.init(message:)((uint64_t)v4);
}

uint64_t sub_2468C13B8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_0_7();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_2468C1414()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_0_7() - 8) + 80);
  return sub_2468C132C(v0 + ((v1 + 16) & ~v1));
}

uint64_t type metadata accessor for SendMessageView()
{
  uint64_t result;

  result = qword_2575E5020;
  if (!qword_2575E5020)
    return swift_getSingletonMetadata();
  return result;
}

void SendMessageView.body.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  Swift::Bool v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t (*v18)();
  uint64_t v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;

  v22 = a1;
  v23 = type metadata accessor for SceneClientView();
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4FB0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v4);
  v21 = type metadata accessor for SceneHostView();
  OUTLINED_FUNCTION_1();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v20 - v9;
  v11 = MailUIFeatureFlags.isSceneHostingEnabled()();
  type metadata accessor for SendMessageView();
  type metadata accessor for SiriMailModel();
  sub_24689FA94(&qword_2575E4C28, (uint64_t (*)(uint64_t))type metadata accessor for SiriMailModel, (uint64_t)&protocol conformance descriptor for SiriMailModel);
  sub_2468D5B90();
  if (v11)
  {
    *(_QWORD *)v8 = sub_2468D5C20();
    *((_QWORD *)v8 + 1) = v12;
    sub_2468D6430();
    sub_24689FA94((unint64_t *)&qword_2575E4990, (uint64_t (*)(uint64_t))MEMORY[0x24BEAE580], MEMORY[0x24BEAE520]);
    *((_QWORD *)v8 + 2) = sub_2468D5C8C();
    *((_QWORD *)v8 + 3) = v13;
    *((_QWORD *)v8 + 4) = swift_getKeyPath();
    v8[40] = 0;
    v14 = v21;
    v15 = (uint64_t *)&v8[*(int *)(v21 + 28)];
    *v15 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3850);
    swift_storeEnumTagMultiPayload();
    v16 = &v8[*(int *)(v14 + 32)];
    v24 = 0;
    sub_2468D61A8();
    v17 = v26;
    *v16 = v25;
    *((_QWORD *)v16 + 1) = v17;
    sub_2468C0998((uint64_t)v8, (uint64_t)v10);
    v18 = type metadata accessor for SceneHostView;
    OUTLINED_FUNCTION_2_9((uint64_t)v10);
    swift_storeEnumTagMultiPayload();
    sub_24689FA94(&qword_2575E4FB8, (uint64_t (*)(uint64_t))type metadata accessor for SceneHostView, (uint64_t)&unk_2468D8998);
    sub_24689FA94(&qword_2575E4FC0, (uint64_t (*)(uint64_t))type metadata accessor for SceneClientView, (uint64_t)&unk_2468D86E0);
    sub_2468D5E3C();
    v19 = (uint64_t)v10;
  }
  else
  {
    sub_2468B8844((uint64_t)v3);
    v18 = type metadata accessor for SceneClientView;
    OUTLINED_FUNCTION_2_9((uint64_t)v3);
    swift_storeEnumTagMultiPayload();
    sub_24689FA94(&qword_2575E4FB8, (uint64_t (*)(uint64_t))type metadata accessor for SceneHostView, (uint64_t)&unk_2468D8998);
    sub_24689FA94(&qword_2575E4FC0, (uint64_t (*)(uint64_t))type metadata accessor for SceneClientView, (uint64_t)&unk_2468D86E0);
    sub_2468D5E3C();
    v19 = (uint64_t)v3;
  }
  sub_24689F7E8(v19, (uint64_t (*)(_QWORD))v18);
}

uint64_t sub_2468C17A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2468D5CC8();
  *a1 = result;
  return result;
}

uint64_t sub_2468C17C8()
{
  swift_retain();
  return sub_2468D5CD4();
}

uint64_t sub_2468C17FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for SendMessageView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2468D59C8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = *(_QWORD *)v10;
    v12 = *((_QWORD *)v10 + 1);
    v13 = v10[16];
    sub_2468C18BC();
    *(_QWORD *)v9 = v11;
    *((_QWORD *)v9 + 1) = v12;
    v9[16] = v13;
  }
  return a1;
}

uint64_t sub_2468C18BC()
{
  return swift_retain();
}

uint64_t destroy for SendMessageView(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2468D59C8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return sub_2468C1910();
}

uint64_t sub_2468C1910()
{
  return swift_release();
}

uint64_t initializeWithCopy for SendMessageView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v6 = sub_2468D59C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (uint64_t *)(a2 + v7);
  v10 = *v9;
  v11 = v9[1];
  v12 = *((_BYTE *)v9 + 16);
  sub_2468C18BC();
  *(_QWORD *)v8 = v10;
  *(_QWORD *)(v8 + 8) = v11;
  *(_BYTE *)(v8 + 16) = v12;
  return a1;
}

uint64_t assignWithCopy for SendMessageView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v6 = sub_2468D59C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (uint64_t *)(a2 + v7);
  v10 = *v9;
  v11 = v9[1];
  v12 = *((_BYTE *)v9 + 16);
  sub_2468C18BC();
  *(_QWORD *)v8 = v10;
  *(_QWORD *)(v8 + 8) = v11;
  *(_BYTE *)(v8 + 16) = v12;
  sub_2468C1910();
  return a1;
}

uint64_t initializeWithTake for SendMessageView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_2468D59C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
  return a1;
}

uint64_t assignWithTake for SendMessageView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v6 = sub_2468D59C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_BYTE *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_BYTE *)(v8 + 16) = v10;
  sub_2468C1910();
  return a1;
}

uint64_t getEnumTagSinglePayload for SendMessageView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2468C1B1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int v8;

  v6 = OUTLINED_FUNCTION_0_7();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 16);
  if (v8 > 1)
    return (v8 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SendMessageView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2468C1B9C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_0_7();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20) + 16) = -(char)a2;
  return result;
}

uint64_t sub_2468C1C10()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2468D59C8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_2468C1C84()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2575E5058;
  if (!qword_2575E5058)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E5060);
    sub_24689FA94(&qword_2575E4FB8, (uint64_t (*)(uint64_t))type metadata accessor for SceneHostView, (uint64_t)&unk_2468D8998);
    v3 = v2;
    sub_24689FA94(&qword_2575E4FC0, (uint64_t (*)(uint64_t))type metadata accessor for SceneClientView, (uint64_t)&unk_2468D86E0);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x249562024](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2575E5058);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return sub_2468D59C8();
}

void OUTLINED_FUNCTION_2_9(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_2468A2EC0(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_4_9(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v1, v2);
}

uint64_t static Logger.logAndCrash(_:file:line:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v32 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5068);
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v26 - v14;
  if (qword_2575E3828 != -1)
    swift_once();
  v16 = OUTLINED_FUNCTION_0_8();
  v17 = __swift_project_value_buffer(v16, (uint64_t)static Logger.siriMail);
  v18 = *(_QWORD *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v15, v17, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v16);
  sub_2468C20F4((uint64_t)v15, (uint64_t)v13);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v16) == 1)
  {
    sub_2468C213C((uint64_t)v13);
  }
  else
  {
    swift_bridgeObjectRetain_n();
    v19 = sub_2468D5AB8();
    v20 = sub_2468D652C();
    v29 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc();
      v30 = a6;
      v22 = v21;
      v27 = swift_slowAlloc();
      v34 = v27;
      *(_DWORD *)v22 = 136315650;
      v31 = a3;
      v23 = sub_2468D65EC();
      v33 = sub_2468C21E8(v23, v24, &v34);
      v28 = a5;
      sub_2468D658C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2048;
      v33 = v30;
      sub_2468D658C();
      *(_WORD *)(v22 + 22) = 2080;
      swift_bridgeObjectRetain();
      v33 = sub_2468C21E8(a1, a2, &v34);
      sub_2468D658C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_246894000, v19, (os_log_type_t)v29, "FatalError at %s:%lu - %s", (uint8_t *)v22, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_21_0();
    }
    swift_bridgeObjectRelease_n();

    (*(void (**)(char *, uint64_t))(v18 + 8))(v13, v16);
  }
  sub_2468D5764();
  result = sub_2468D6670();
  __break(1u);
  return result;
}

uint64_t Logger.siriMail.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_2575E3828 != -1)
    swift_once();
  v0 = OUTLINED_FUNCTION_0_8();
  return __swift_project_value_buffer(v0, (uint64_t)static Logger.siriMail);
}

uint64_t sub_2468C2084()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_0_8();
  __swift_allocate_value_buffer(v0, static Logger.siriMail);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.siriMail);
  return sub_2468D5AC4();
}

uint64_t sub_2468C20F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5068);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2468C213C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5068);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static Logger.siriMail.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2575E3828 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_0_8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.siriMail);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2468C21E8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_2468C22C8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2468B6F88((uint64_t)v12, *a3);
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
      sub_2468B6F88((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

uint64_t sub_2468C22C8(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_2468C241C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2468D6598();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_2468C24E0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2468D661C();
    if (!v8)
    {
      result = sub_2468D6664();
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

void *sub_2468C241C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2468D6688();
  __break(1u);
  return result;
}

uint64_t sub_2468C24E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2468C2574(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_2468C2748(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_2468C2748((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2468C2574(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_2468D64B4();
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
  v3 = sub_2468C26E4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_2468D65E0();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_2468D6688();
  __break(1u);
LABEL_14:
  result = sub_2468D6664();
  __break(1u);
  return result;
}

_QWORD *sub_2468C26E4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5070);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2468C2748(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5070);
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
    sub_2468C28E0(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2468C281C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2468C281C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2468D6688();
  __break(1u);
  return result;
}

char *sub_2468C28E0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2468D6688();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
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

uint64_t OUTLINED_FUNCTION_0_8()
{
  return sub_2468D5AD0();
}

uint64_t ServiceName.mail.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_2575E3830 != -1)
    swift_once();
  v0 = OUTLINED_FUNCTION_91();
  return __swift_project_value_buffer(v0, (uint64_t)static ServiceName.mail);
}

void sub_2468C29EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = OUTLINED_FUNCTION_91();
  __swift_allocate_value_buffer(v0, static ServiceName.mail);
  v1 = OUTLINED_FUNCTION_19_1();
  __swift_project_value_buffer(v1, v2);
  sub_2468D59F8();
  OUTLINED_FUNCTION_3();
}

uint64_t static ServiceName.mail.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2575E3830 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_91();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static ServiceName.mail);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

void SiriMailMessage.Account.name.getter()
{
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_3();
}

void SiriMailMessage.Account.address.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_3();
}

uint64_t SiriMailMessage.Account.init(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_2468D5644();
  sub_2468D5650();
  v3 = sub_2468D565C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return v2;
}

uint64_t static SiriMailMessage.Account.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v13;
  uint64_t result;

  if (!a2)
  {
    if (!a6)
    {
LABEL_11:
      if (a3 == a7 && a4 == a8)
        return 1;
      else
        return sub_2468D6784();
    }
    return 0;
  }
  if (!a6)
    return 0;
  if (a1 == a5 && a2 == a6)
    goto LABEL_11;
  v13 = sub_2468D6784();
  result = 0;
  if ((v13 & 1) != 0)
    goto LABEL_11;
  return result;
}

uint64_t sub_2468C2C18(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_2468D6784() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73736572646461 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_2468D6784();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2468C2CF4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x73736572646461;
  else
    return 1701667182;
}

uint64_t sub_2468C2D24()
{
  char *v0;

  return sub_2468C2CF4(*v0);
}

uint64_t sub_2468C2D2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2468C2C18(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2468C2D50()
{
  sub_2468C2EA4();
  return sub_2468D67D8();
}

uint64_t sub_2468C2D78()
{
  sub_2468C2EA4();
  return sub_2468D67E4();
}

void SiriMailMessage.Account.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_22_3();
  v2 = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5078);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_0();
  v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_2468C2EA4();
  sub_2468D67CC();
  sub_2468D6718();
  if (!v0)
    sub_2468D6730();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
  OUTLINED_FUNCTION_2_0();
}

unint64_t sub_2468C2EA4()
{
  unint64_t result;

  result = qword_2575E5080;
  if (!qword_2575E5080)
  {
    result = MEMORY[0x249562024](&unk_2468DA13C, &type metadata for SiriMailMessage.Account.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5080);
  }
  return result;
}

uint64_t SiriMailMessage.Account.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_22_3();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5088);
  OUTLINED_FUNCTION_69();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_13_0();
  v6 = v4[4];
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_2468C2EA4();
  sub_2468D67C0();
  if (v0)
  {
    OUTLINED_FUNCTION_78();
  }
  else
  {
    v6 = sub_2468D66B8();
    OUTLINED_FUNCTION_55();
    sub_2468D66D0();
    OUTLINED_FUNCTION_33_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_78();
    OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_57();
  }
  return v6;
}

uint64_t sub_2468C3040@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = SiriMailMessage.Account.init(from:)();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v4;
    a1[2] = v5;
    a1[3] = v6;
  }
  return result;
}

void sub_2468C306C()
{
  SiriMailMessage.Account.encode(to:)();
}

uint64_t sub_2468C3088(uint64_t *a1, uint64_t *a2)
{
  return static SiriMailMessage.Account.__derived_struct_equals(_:_:)(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

SiriMailUI::SiriMailMessage::State_optional __swiftcall SiriMailMessage.State.init(rawValue:)(Swift::String rawValue)
{
  SiriMailUI::SiriMailMessage::State_optional result;

  sub_2468D6694();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_3();
  return result;
}

uint64_t SiriMailMessage.State.rawValue.getter(char a1)
{
  if (!a1)
    return 0x7466617264;
  if (a1 == 1)
    return 1953391987;
  return 0x656C6C65636E6163;
}

void sub_2468C3130(unsigned __int8 *a1, char *a2)
{
  sub_2468BDDB4(*a1, *a2);
}

uint64_t sub_2468C313C()
{
  return sub_2468C3144();
}

uint64_t sub_2468C3144()
{
  return sub_2468C3228();
}

uint64_t sub_2468C3150()
{
  return sub_2468C32BC();
}

uint64_t sub_2468C315C()
{
  return sub_2468C31B0();
}

uint64_t sub_2468C3164()
{
  sub_2468D649C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2468C31B0()
{
  sub_2468D649C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2468C3220()
{
  return sub_2468C3228();
}

uint64_t sub_2468C3228()
{
  sub_2468D679C();
  sub_2468D649C();
  swift_bridgeObjectRelease();
  return sub_2468D67B4();
}

uint64_t sub_2468C32BC()
{
  sub_2468D679C();
  sub_2468D649C();
  swift_bridgeObjectRelease();
  return sub_2468D67B4();
}

SiriMailUI::SiriMailMessage::State_optional sub_2468C332C@<W0>(Swift::String *a1@<X0>, SiriMailUI::SiriMailMessage::State_optional *a2@<X8>)
{
  SiriMailUI::SiriMailMessage::State_optional result;

  result.value = SiriMailMessage.State.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

void sub_2468C3358(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t v3;

  *a1 = SiriMailMessage.State.rawValue.getter(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_3();
}

uint64_t sub_2468C337C()
{
  sub_2468CA1A0();
  return sub_2468D64D8();
}

uint64_t sub_2468C33D8()
{
  sub_2468CA1A0();
  return sub_2468D64CC();
}

BOOL static SiriMailMessage.Field.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_2468C3434()
{
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_2468C3450(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v10;

  v2 = a1 == 28532 && a2 == 0xE200000000000000;
  if (v2 || (sub_2468D6784() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 25443 && a2 == 0xE200000000000000;
    if (v6 || (sub_2468D6784() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 6513506 && a2 == 0xE300000000000000;
      if (v7 || (sub_2468D6784() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x7463656A627573 && a2 == 0xE700000000000000;
        if (v8 || (sub_2468D6784() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 2036625250 && a2 == 0xE400000000000000)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v10 = sub_2468D6784();
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

uint64_t sub_2468C3614()
{
  return 5;
}

uint64_t sub_2468C361C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2468C3644 + 4 * byte_2468D8BC0[a1]))(28532, 0xE200000000000000);
}

uint64_t sub_2468C3644()
{
  return 25443;
}

uint64_t sub_2468C364C()
{
  return 6513506;
}

uint64_t sub_2468C365C()
{
  return 0x7463656A627573;
}

uint64_t sub_2468C3674()
{
  return 2036625250;
}

uint64_t sub_2468C3688()
{
  sub_2468C3C14();
  return sub_2468D67D8();
}

uint64_t sub_2468C36B0()
{
  sub_2468C3C14();
  return sub_2468D67E4();
}

uint64_t sub_2468C36D8()
{
  sub_2468C3B9C();
  return sub_2468D67D8();
}

uint64_t sub_2468C3700()
{
  sub_2468C3B9C();
  return sub_2468D67E4();
}

uint64_t sub_2468C3728@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2468C3434();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2468C3750()
{
  sub_2468C3C50();
  return sub_2468D67D8();
}

uint64_t sub_2468C3778()
{
  sub_2468C3C50();
  return sub_2468D67E4();
}

uint64_t sub_2468C37A4()
{
  unsigned __int8 *v0;

  return sub_2468C361C(*v0);
}

uint64_t sub_2468C37AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2468C3450(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2468C37D0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2468C3614();
  *a1 = result;
  return result;
}

uint64_t sub_2468C37F4()
{
  sub_2468C3B60();
  return sub_2468D67D8();
}

uint64_t sub_2468C381C()
{
  sub_2468C3B60();
  return sub_2468D67E4();
}

uint64_t sub_2468C3844()
{
  sub_2468C3BD8();
  return sub_2468D67D8();
}

uint64_t sub_2468C386C()
{
  sub_2468C3BD8();
  return sub_2468D67E4();
}

uint64_t sub_2468C3894()
{
  sub_2468C3C8C();
  return sub_2468D67D8();
}

uint64_t sub_2468C38BC()
{
  sub_2468C3C8C();
  return sub_2468D67E4();
}

void SiriMailMessage.Field.encode(to:)()
{
  char v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  OUTLINED_FUNCTION_22_3();
  v11 = v0;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5090);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_46(v4, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5098);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E50A0);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E50A8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_61();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E50B0);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E50B8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_7_3();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_2468C3B60();
  sub_2468D67CC();
  __asm { BR              X10 }
}

void sub_2468C3A6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v4 - 69) = 0;
  sub_2468C3C8C();
  OUTLINED_FUNCTION_10_7();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v3);
  OUTLINED_FUNCTION_4_3(v1, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 88) + 8));
  OUTLINED_FUNCTION_2_0();
}

unint64_t sub_2468C3B60()
{
  unint64_t result;

  result = qword_2575E50C0;
  if (!qword_2575E50C0)
  {
    result = MEMORY[0x249562024](&unk_2468DA0EC, &type metadata for SiriMailMessage.Field.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E50C0);
  }
  return result;
}

unint64_t sub_2468C3B9C()
{
  unint64_t result;

  result = qword_2575E50C8;
  if (!qword_2575E50C8)
  {
    result = MEMORY[0x249562024](&unk_2468DA09C, &type metadata for SiriMailMessage.Field.BodyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E50C8);
  }
  return result;
}

unint64_t sub_2468C3BD8()
{
  unint64_t result;

  result = qword_2575E50D0;
  if (!qword_2575E50D0)
  {
    result = MEMORY[0x249562024](&unk_2468DA04C, &type metadata for SiriMailMessage.Field.SubjectCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E50D0);
  }
  return result;
}

unint64_t sub_2468C3C14()
{
  unint64_t result;

  result = qword_2575E50D8;
  if (!qword_2575E50D8)
  {
    result = MEMORY[0x249562024](&unk_2468D9FFC, &type metadata for SiriMailMessage.Field.BccCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E50D8);
  }
  return result;
}

unint64_t sub_2468C3C50()
{
  unint64_t result;

  result = qword_2575E50E0;
  if (!qword_2575E50E0)
  {
    result = MEMORY[0x249562024](&unk_2468D9FAC, &type metadata for SiriMailMessage.Field.CcCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E50E0);
  }
  return result;
}

unint64_t sub_2468C3C8C()
{
  unint64_t result;

  result = qword_2575E50E8;
  if (!qword_2575E50E8)
  {
    result = MEMORY[0x249562024](&unk_2468D9F5C, &type metadata for SiriMailMessage.Field.ToCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E50E8);
  }
  return result;
}

unint64_t SiriMailMessage.Field.init(from:)()
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
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v24;
  uint64_t v25;

  OUTLINED_FUNCTION_22_3();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E50F0);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E50F8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5100);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_46(v8, v24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5108);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_14();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5110);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_13_0();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5118);
  OUTLINED_FUNCTION_69();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_60();
  v13 = v4[4];
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_2468C3B60();
  sub_2468D67C0();
  if (!v0)
  {
    v25 = v1;
    v14 = sub_2468D6700();
    v15 = *(_QWORD *)(v14 + 16);
    if (v15)
    {
      v16 = *(unsigned __int8 *)(v14 + 32);
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))sub_2468A07DC)(1, v15, v14, v14 + 32, 0, (2 * v15) | 1);
      v18 = v17;
      v13 = v19;
      OUTLINED_FUNCTION_51();
      if (v18 == v13 >> 1)
        __asm { BR              X9 }
    }
    v20 = sub_2468D6610();
    OUTLINED_FUNCTION_77();
    v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3E00);
    *v22 = &type metadata for SiriMailMessage.Field;
    sub_2468D66AC();
    OUTLINED_FUNCTION_64();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, *MEMORY[0x24BEE26D0], v20);
    swift_willThrow();
    OUTLINED_FUNCTION_3_3();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v25, v11);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return v13;
}

void sub_2468C3FEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_88();
  OUTLINED_FUNCTION_11_6();
  if (v1)
  {
    OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_33_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    JUMPOUT(0x2468C3FC0);
  }
  JUMPOUT(0x2468C40D4);
}

void sub_2468C401C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_11_6();
  if (!v1)
    JUMPOUT(0x2468C4048);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_33_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  JUMPOUT(0x2468C3FC0);
}

void sub_2468C4054()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);

  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_11_6();
  if (!v1)
  {
    v4 = OUTLINED_FUNCTION_68();
    v5(v4);
    OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_33_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v3 - 96));
    JUMPOUT(0x2468C3FC4);
  }
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_33_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  JUMPOUT(0x2468C3FC0);
}

void sub_2468C4084()
{
  uint64_t v0;

  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_11_6();
  if (v0)
    JUMPOUT(0x2468C40ACLL);
  JUMPOUT(0x2468C40D4);
}

BOOL sub_2468C40F8(char *a1, char *a2)
{
  return static SiriMailMessage.Field.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_2468C4104()
{
  unsigned __int8 *v0;

  return sub_2468C6708(*v0);
}

unint64_t sub_2468C410C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  unint64_t result;

  result = SiriMailMessage.Field.init(from:)();
  if (!v1)
    *a1 = result;
  return result;
}

void sub_2468C4134()
{
  SiriMailMessage.Field.encode(to:)();
}

SiriMailUI::SiriMailMessage::Action_optional __swiftcall SiriMailMessage.Action.init(rawValue:)(Swift::String rawValue)
{
  SiriMailUI::SiriMailMessage::Action_optional result;

  sub_2468D6694();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_3();
  return result;
}

uint64_t SiriMailMessage.Action.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6C65636E6163;
  else
    return 1684956531;
}

uint64_t sub_2468C41BC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  char v14;

  v2 = a1 == 0x6470556C65646F6DLL && a2 == 0xEB00000000657461;
  if (v2 || (sub_2468D6784() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x7463656A627573 && a2 == 0xE700000000000000;
    if (v6 || (sub_2468D6784() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 2036625250 && a2 == 0xE400000000000000;
      if (v7 || (sub_2468D6784() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 28532 && a2 == 0xE200000000000000;
        if (v8 || (sub_2468D6784() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 25443 && a2 == 0xE200000000000000;
          if (v9 || (sub_2468D6784() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 6513506 && a2 == 0xE300000000000000;
            if (v10 || (sub_2468D6784() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              v11 = a1 == 0x4664657375636F66 && a2 == 0xEC000000646C6569;
              if (v11 || (sub_2468D6784() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                v12 = a1 == 0x6E6F69746361 && a2 == 0xE600000000000000;
                if (v12 || (sub_2468D6784() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
                {
                  swift_bridgeObjectRelease();
                  return 8;
                }
                else
                {
                  v14 = sub_2468D6784();
                  swift_bridgeObjectRelease();
                  if ((v14 & 1) != 0)
                    return 8;
                  else
                    return 9;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_2468C4520()
{
  return 9;
}

uint64_t sub_2468C4528(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2468C4564 + 4 * byte_2468D8BCF[a1]))(0x6470556C65646F6DLL, 0xEB00000000657461);
}

uint64_t sub_2468C4564()
{
  return 0x7463656A627573;
}

uint64_t sub_2468C457C()
{
  return 2036625250;
}

uint64_t sub_2468C458C()
{
  return 28532;
}

uint64_t sub_2468C4598()
{
  return 25443;
}

uint64_t sub_2468C45A4()
{
  return 6513506;
}

uint64_t sub_2468C45B4()
{
  return 0x4664657375636F66;
}

uint64_t sub_2468C45D4()
{
  return 0x6E6F69746361;
}

uint64_t sub_2468C45E8()
{
  return 0x6574617473;
}

void sub_2468C45FC(uint64_t a1, uint64_t a2)
{
  if (a1 != 12383 || a2 != 0xE200000000000000)
    sub_2468D6784();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3();
}

void sub_2468C4664()
{
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_11();
}

void sub_2468C4688(char *a1, char *a2)
{
  sub_2468BDD3C(*a1, *a2);
}

uint64_t sub_2468C4694()
{
  return sub_2468C3150();
}

uint64_t sub_2468C469C()
{
  return sub_2468C3164();
}

uint64_t sub_2468C46A4()
{
  return sub_2468C32BC();
}

SiriMailUI::SiriMailMessage::Action_optional sub_2468C46AC@<W0>(Swift::String *a1@<X0>, SiriMailUI::SiriMailMessage::Action_optional *a2@<X8>)
{
  SiriMailUI::SiriMailMessage::Action_optional result;

  result.value = SiriMailMessage.Action.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

void sub_2468C46D8(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t v3;

  *a1 = SiriMailMessage.Action.rawValue.getter(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_3();
}

uint64_t sub_2468C46FC()
{
  sub_2468CA164();
  return sub_2468D64D8();
}

uint64_t sub_2468C4758()
{
  sub_2468CA164();
  return sub_2468D64CC();
}

void sub_2468C47A4()
{
  sub_2468C4664();
}

uint64_t sub_2468C47BC()
{
  sub_2468C764C();
  return sub_2468D67D8();
}

uint64_t sub_2468C47E4()
{
  sub_2468C764C();
  return sub_2468D67E4();
}

uint64_t sub_2468C480C()
{
  sub_2468C777C();
  return sub_2468D67D8();
}

uint64_t sub_2468C4834()
{
  sub_2468C777C();
  return sub_2468D67E4();
}

uint64_t sub_2468C485C()
{
  sub_2468C786C();
  return sub_2468D67D8();
}

uint64_t sub_2468C4884()
{
  sub_2468C786C();
  return sub_2468D67E4();
}

uint64_t sub_2468C48AC()
{
  sub_2468C77F4();
  return sub_2468D67D8();
}

uint64_t sub_2468C48D4()
{
  sub_2468C77F4();
  return sub_2468D67E4();
}

uint64_t sub_2468C48FC()
{
  unsigned __int8 *v0;

  return sub_2468C4528(*v0);
}

uint64_t sub_2468C4904@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2468C41BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2468C4928@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2468C4520();
  *a1 = result;
  return result;
}

uint64_t sub_2468C494C()
{
  sub_2468C7578();
  return sub_2468D67D8();
}

uint64_t sub_2468C4974()
{
  sub_2468C7578();
  return sub_2468D67E4();
}

uint64_t sub_2468C499C()
{
  sub_2468C76C4();
  return sub_2468D67D8();
}

uint64_t sub_2468C49C4()
{
  sub_2468C76C4();
  return sub_2468D67E4();
}

uint64_t sub_2468C49EC()
{
  sub_2468C78F4();
  return sub_2468D67D8();
}

uint64_t sub_2468C4A14()
{
  sub_2468C78F4();
  return sub_2468D67E4();
}

void sub_2468C4A3C(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v4;

  sub_2468C45FC(a1, a2);
  *a3 = v4 & 1;
}

uint64_t sub_2468C4A64()
{
  sub_2468C75D4();
  return sub_2468D67D8();
}

uint64_t sub_2468C4A8C()
{
  sub_2468C75D4();
  return sub_2468D67E4();
}

uint64_t sub_2468C4AB4()
{
  sub_2468C78B8();
  return sub_2468D67D8();
}

uint64_t sub_2468C4ADC()
{
  sub_2468C78B8();
  return sub_2468D67E4();
}

void sub_2468C4B04()
{
  sub_2468D679C();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_11();
}

uint64_t sub_2468C4B2C()
{
  sub_2468C7830();
  return sub_2468D67D8();
}

uint64_t sub_2468C4B54()
{
  sub_2468C7830();
  return sub_2468D67E4();
}

void SiriMailMessage.StateChange.encode(to:)()
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
  char *v11;
  _BYTE v12[440];

  OUTLINED_FUNCTION_22_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5120);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5128);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5130);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5138);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5140);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5148);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5150);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5158);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5160);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_61();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5168);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_82();
  sub_2468D67CC();
  sub_2468C75B4(v0, v12);
  v11 = (char *)sub_2468C4DE4 + 4 * byte_2468D8BD8[sub_2468C75C8((uint64_t)v12)];
  __asm { BR              X10 }
}

void sub_2468C4DE4()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v2 = (const void *)OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_66((void *)(v0 + 648), v2);
  *(_BYTE *)(v0 + 232) = 0;
  sub_2468C78F4();
  v3 = *(_QWORD *)(v0 + 216);
  v4 = *(_QWORD *)(v0 + 200);
  sub_2468D670C();
  OUTLINED_FUNCTION_66((void *)(v0 + 232), (const void *)(v0 + 648));
  sub_2468C7930();
  sub_2468D6754();
  v5 = OUTLINED_FUNCTION_68();
  v6(v5, v1);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 192) + 8))(v4, v3);
  OUTLINED_FUNCTION_2_0();
}

void SiriMailMessage.StateChange.init(from:)()
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;

  OUTLINED_FUNCTION_22_3();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5208);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5210);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5218);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5220);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5228);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5230);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5238);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5240);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5248);
  OUTLINED_FUNCTION_69();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_7_3();
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5250);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_82();
  sub_2468D67C0();
  if (!v0)
  {
    v26 = v13;
    v25 = v1;
    v15 = sub_2468D6700();
    v16 = *(_QWORD *)(v15 + 16);
    if (v16)
    {
      v17 = *(unsigned __int8 *)(v15 + 32);
      sub_2468A07DC(1, v16, v15, v15 + 32, 0, (2 * v16) | 1);
      v19 = v18;
      v21 = v20;
      OUTLINED_FUNCTION_74();
      if (v19 == v21 >> 1)
        __asm { BR              X9 }
    }
    v22 = sub_2468D6610();
    OUTLINED_FUNCTION_77();
    v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3E00);
    *v24 = &type metadata for SiriMailMessage.StateChange;
    sub_2468D66AC();
    OUTLINED_FUNCTION_64();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v24, *MEMORY[0x24BEE26D0], v22);
    swift_willThrow();
    OUTLINED_FUNCTION_7_7();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v25, v26);
  }
  __swift_destroy_boxed_opaque_existential_1(v3);
  OUTLINED_FUNCTION_2_0();
}

void sub_2468C5640()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v0 + 472) = 1;
  sub_2468C78B8();
  v2 = *(_QWORD *)(v0 + 40);
  OUTLINED_FUNCTION_26_1();
  if (v1)
  {
    OUTLINED_FUNCTION_7_7();
    OUTLINED_FUNCTION_40_0();
    JUMPOUT(0x2468C5624);
  }
  v3 = sub_2468D66D0();
  v5 = v4;
  OUTLINED_FUNCTION_24_2(*(_QWORD *)(v0 + 48));
  OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_33_0(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 32) + 8));
  *(_QWORD *)(v0 + 472) = v3;
  *(_QWORD *)(v0 + 480) = v5;
  sub_2468C7B50(v0 + 472);
  JUMPOUT(0x2468C5BF4);
}

void sub_2468C5690()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v0 + 472) = 2;
  sub_2468C786C();
  OUTLINED_FUNCTION_65();
  v2 = *(_QWORD *)(v0 + 40);
  OUTLINED_FUNCTION_26_1();
  if (v1)
  {
    OUTLINED_FUNCTION_7_7();
    OUTLINED_FUNCTION_4_3(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 32) + 8));
    JUMPOUT(0x2468C562CLL);
  }
  v3 = sub_2468D66D0();
  v5 = v4;
  OUTLINED_FUNCTION_24_2(*(_QWORD *)(v0 + 56));
  OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_4_3(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 32) + 8));
  *(_QWORD *)(v0 + 472) = v3;
  *(_QWORD *)(v0 + 480) = v5;
  sub_2468C7B3C(v0 + 472);
  JUMPOUT(0x2468C5BF4);
}

void sub_2468C56EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v0 + 472) = 3;
  sub_2468C7830();
  OUTLINED_FUNCTION_5_7();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E51C0);
    sub_2468C7A5C(&qword_2575E5270, (uint64_t (*)(void))sub_2468C7AC4, MEMORY[0x24BEE12D0]);
    OUTLINED_FUNCTION_59();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_50();
    OUTLINED_FUNCTION_8_6(*(_QWORD *)(v0 + 64));
    OUTLINED_FUNCTION_7_7();
    OUTLINED_FUNCTION_15_4();
    v2 = OUTLINED_FUNCTION_73();
    sub_2468C7B28(v2);
    JUMPOUT(0x2468C5BF4);
  }
  OUTLINED_FUNCTION_7_7();
  JUMPOUT(0x2468C5908);
}

void sub_2468C5918()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v0 + 472) = 8;
  sub_2468C75D4();
  OUTLINED_FUNCTION_65();
  v2 = *(_QWORD *)(v0 + 40);
  OUTLINED_FUNCTION_26_1();
  if (v1)
  {
    OUTLINED_FUNCTION_7_7();
    OUTLINED_FUNCTION_4_3(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 32) + 8));
    JUMPOUT(0x2468C562CLL);
  }
  sub_2468C796C();
  sub_2468D66F4();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_4_3(v2, MEMORY[8]);
  v3 = OUTLINED_FUNCTION_71();
  sub_2468C79A8(v3);
  sub_2468C75B4((void *)(v0 + 472), (void *)(v0 + 680));
  JUMPOUT(0x2468C5BFCLL);
}

void sub_2468C5C48(void *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  SiriMailMessage.StateChange.init(from:)();
  if (!v1)
    sub_2468C75B4(&v3, a1);
}

void sub_2468C5C8C()
{
  void *v0;
  uint64_t v1;

  sub_2468C75B4(v0, &v1);
  SiriMailMessage.StateChange.encode(to:)();
}

uint64_t SiriMailMessage.to.getter()
{
  return swift_bridgeObjectRetain();
}

void SiriMailMessage.to.setter(uint64_t a1)
{
  _QWORD *v1;

  swift_bridgeObjectRelease();
  *v1 = a1;
  OUTLINED_FUNCTION_3();
}

uint64_t (*SiriMailMessage.to.modify())()
{
  return nullsub_1;
}

void SiriMailMessage.subject.getter()
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailMessage.subject.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_37_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = v2;
  *(_QWORD *)(v1 + 16) = v0;
  OUTLINED_FUNCTION_12_1();
}

uint64_t (*SiriMailMessage.subject.modify())()
{
  return nullsub_1;
}

void SiriMailMessage.body.getter()
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailMessage.body.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_37_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = v2;
  *(_QWORD *)(v1 + 32) = v0;
  OUTLINED_FUNCTION_12_1();
}

uint64_t (*SiriMailMessage.body.modify())()
{
  return nullsub_1;
}

uint64_t SiriMailMessage.cc.getter()
{
  return swift_bridgeObjectRetain();
}

void SiriMailMessage.cc.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 40) = a1;
  OUTLINED_FUNCTION_3();
}

uint64_t (*SiriMailMessage.cc.modify())()
{
  return nullsub_1;
}

uint64_t SiriMailMessage.bcc.getter()
{
  return swift_bridgeObjectRetain();
}

void SiriMailMessage.bcc.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = a1;
  OUTLINED_FUNCTION_3();
}

uint64_t (*SiriMailMessage.bcc.modify())()
{
  return nullsub_1;
}

void SiriMailMessage.toLabel.getter()
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailMessage.ccLabel.getter()
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailMessage.bccLabel.getter()
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailMessage.subjectLabel.getter()
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailMessage.subjectLabel.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_37_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 104) = v2;
  *(_QWORD *)(v1 + 112) = v0;
  OUTLINED_FUNCTION_12_1();
}

uint64_t (*SiriMailMessage.subjectLabel.modify())()
{
  return nullsub_1;
}

void SiriMailMessage.cancelLabel.getter()
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailMessage.cancelLabel.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_37_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 120) = v2;
  *(_QWORD *)(v1 + 128) = v0;
  OUTLINED_FUNCTION_12_1();
}

uint64_t (*SiriMailMessage.cancelLabel.modify())()
{
  return nullsub_1;
}

void SiriMailMessage.cancelledLabel.getter()
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailMessage.cancelledLabel.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_37_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 136) = v2;
  *(_QWORD *)(v1 + 144) = v0;
  OUTLINED_FUNCTION_12_1();
}

uint64_t (*SiriMailMessage.cancelledLabel.modify())()
{
  return nullsub_1;
}

void SiriMailMessage.sendLabel.getter()
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailMessage.sendLabel.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_37_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 152) = v2;
  *(_QWORD *)(v1 + 160) = v0;
  OUTLINED_FUNCTION_12_1();
}

uint64_t (*SiriMailMessage.sendLabel.modify())()
{
  return nullsub_1;
}

void SiriMailMessage.sentLabel.getter()
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailMessage.sentLabel.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_37_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 168) = v2;
  *(_QWORD *)(v1 + 176) = v0;
  OUTLINED_FUNCTION_12_1();
}

uint64_t (*SiriMailMessage.sentLabel.modify())()
{
  return nullsub_1;
}

void SiriMailMessage.messageLabel.getter()
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailMessage.messageLabel.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_37_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 184) = v2;
  *(_QWORD *)(v1 + 192) = v0;
  OUTLINED_FUNCTION_12_1();
}

uint64_t (*SiriMailMessage.messageLabel.modify())()
{
  return nullsub_1;
}

uint64_t SiriMailMessage.state.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 200);
}

uint64_t SiriMailMessage.state.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 200) = result;
  return result;
}

uint64_t (*SiriMailMessage.state.modify())()
{
  return nullsub_1;
}

__n128 SiriMailMessage.init(toLabel:ccLabel:bccLabel:subjectLabel:cancelLabel:cancelledLabel:sendLabel:sentLabel:messageLabel:to:cc:bcc:subject:body:state:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, __int128 a11, __int128 a12, __n128 a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  __n128 result;

  result = a13;
  *(_QWORD *)a9 = a16;
  *(_QWORD *)(a9 + 8) = a19;
  *(_QWORD *)(a9 + 16) = a20;
  *(_QWORD *)(a9 + 24) = a21;
  *(_QWORD *)(a9 + 32) = a22;
  *(_QWORD *)(a9 + 40) = a17;
  *(_QWORD *)(a9 + 48) = a18;
  *(_QWORD *)(a9 + 56) = a1;
  *(_QWORD *)(a9 + 64) = a2;
  *(_QWORD *)(a9 + 72) = a3;
  *(_QWORD *)(a9 + 80) = a4;
  *(_QWORD *)(a9 + 88) = a5;
  *(_QWORD *)(a9 + 96) = a6;
  *(_QWORD *)(a9 + 104) = a7;
  *(_QWORD *)(a9 + 112) = a8;
  *(_OWORD *)(a9 + 120) = a10;
  *(_OWORD *)(a9 + 136) = a11;
  *(_OWORD *)(a9 + 152) = a12;
  *(__n128 *)(a9 + 168) = a13;
  *(_QWORD *)(a9 + 184) = a14;
  *(_QWORD *)(a9 + 192) = a15;
  *(_BYTE *)(a9 + 200) = a23;
  return result;
}

uint64_t sub_2468C6130(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  char v20;

  v2 = a1 == 28532 && a2 == 0xE200000000000000;
  if (v2 || (sub_2468D6784() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x7463656A627573 && a2 == 0xE700000000000000;
    if (v6 || (sub_2468D6784() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 2036625250 && a2 == 0xE400000000000000;
      if (v7 || (sub_2468D6784() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 25443 && a2 == 0xE200000000000000;
        if (v8 || (sub_2468D6784() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 6513506 && a2 == 0xE300000000000000;
          if (v9 || (sub_2468D6784() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 0x6C6562614C6F74 && a2 == 0xE700000000000000;
            if (v10 || (sub_2468D6784() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              v11 = a1 == 0x6C6562614C6363 && a2 == 0xE700000000000000;
              if (v11 || (sub_2468D6784() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                v12 = a1 == 0x6C6562614C636362 && a2 == 0xE800000000000000;
                if (v12 || (sub_2468D6784() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else
                {
                  v13 = a1 == 0x4C7463656A627573 && a2 == 0xEC0000006C656261;
                  if (v13 || (sub_2468D6784() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 8;
                  }
                  else
                  {
                    v14 = a1 == 0x614C6C65636E6163 && a2 == 0xEB000000006C6562;
                    if (v14 || (sub_2468D6784() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 9;
                    }
                    else
                    {
                      v15 = a1 == 0x656C6C65636E6163 && a2 == 0xEE006C6562614C64;
                      if (v15 || (sub_2468D6784() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 10;
                      }
                      else
                      {
                        v16 = a1 == 0x6562614C646E6573 && a2 == 0xE90000000000006CLL;
                        if (v16 || (sub_2468D6784() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 11;
                        }
                        else
                        {
                          v17 = a1 == 0x6562614C746E6573 && a2 == 0xE90000000000006CLL;
                          if (v17 || (sub_2468D6784() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 12;
                          }
                          else
                          {
                            v18 = a1 == 0x4C6567617373656DLL && a2 == 0xEC0000006C656261;
                            if (v18 || (sub_2468D6784() & 1) != 0)
                            {
                              swift_bridgeObjectRelease();
                              return 13;
                            }
                            else if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
                            {
                              swift_bridgeObjectRelease();
                              return 14;
                            }
                            else
                            {
                              v20 = sub_2468D6784();
                              swift_bridgeObjectRelease();
                              if ((v20 & 1) != 0)
                                return 14;
                              else
                                return 15;
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
    }
  }
}

uint64_t sub_2468C6700()
{
  return 15;
}

void _s10SiriMailUI0aB7MessageV5FieldO9hashValueSivg_0()
{
  OUTLINED_FUNCTION_87();
  sub_2468D67A8();
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_11();
}

uint64_t sub_2468C673C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2468C6764 + 4 * byte_2468D8BEA[a1]))(28532, 0xE200000000000000);
}

uint64_t sub_2468C6764()
{
  return 0x7463656A627573;
}

uint64_t sub_2468C677C()
{
  return 2036625250;
}

uint64_t sub_2468C678C()
{
  return 25443;
}

uint64_t sub_2468C6794()
{
  return 6513506;
}

uint64_t sub_2468C67A4()
{
  return 0x6C6562614C6F74;
}

uint64_t sub_2468C67C0()
{
  return 0x6C6562614C6363;
}

uint64_t sub_2468C67D8()
{
  return 0x6C6562614C636362;
}

uint64_t sub_2468C67F0()
{
  return 0x4C7463656A627573;
}

uint64_t sub_2468C6890()
{
  return 0x6574617473;
}

void sub_2468C68A4()
{
  _s10SiriMailUI0aB7MessageV5FieldO9hashValueSivg_0();
}

void sub_2468C68BC()
{
  sub_2468D679C();
  sub_2468D67A8();
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_11();
}

uint64_t sub_2468C68F0()
{
  unsigned __int8 *v0;

  return sub_2468C673C(*v0);
}

uint64_t sub_2468C68F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2468C6130(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2468C691C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2468C6700();
  *a1 = result;
  return result;
}

uint64_t sub_2468C6940()
{
  sub_2468C7BB0();
  return sub_2468D67D8();
}

uint64_t sub_2468C6968()
{
  sub_2468C7BB0();
  return sub_2468D67E4();
}

uint64_t SiriMailMessage.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  _BYTE v10[8];
  _BYTE v11[8];

  v4 = v1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5288);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_60();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2468C7BB0();
  sub_2468D67CC();
  v9 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E51C0);
  sub_2468C7A5C(&qword_2575E51C8, (uint64_t (*)(void))sub_2468C77B8, MEMORY[0x24BEE12A0]);
  OUTLINED_FUNCTION_81();
  if (!v2)
  {
    OUTLINED_FUNCTION_45(1);
    OUTLINED_FUNCTION_45(2);
    OUTLINED_FUNCTION_70((uint64_t)(v4 + 5), (uint64_t)v11);
    OUTLINED_FUNCTION_70((uint64_t)v11, (uint64_t)&v9);
    OUTLINED_FUNCTION_27_0(3);
    OUTLINED_FUNCTION_70((uint64_t)(v4 + 6), (uint64_t)v10);
    OUTLINED_FUNCTION_70((uint64_t)v10, (uint64_t)&v9);
    OUTLINED_FUNCTION_27_0(4);
    OUTLINED_FUNCTION_2_10(5);
    OUTLINED_FUNCTION_2_10(6);
    OUTLINED_FUNCTION_2_10(7);
    OUTLINED_FUNCTION_2_10(8);
    OUTLINED_FUNCTION_2_10(9);
    OUTLINED_FUNCTION_2_10(10);
    OUTLINED_FUNCTION_2_10(11);
    OUTLINED_FUNCTION_2_10(12);
    OUTLINED_FUNCTION_2_10(13);
    LOBYTE(v9) = *((_BYTE *)v4 + 200);
    sub_2468C7610();
    OUTLINED_FUNCTION_81();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v3, v6);
}

void SiriMailMessage.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
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
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[25];
  char v63;
  _QWORD v64[25];
  char v65;

  OUTLINED_FUNCTION_22_3();
  v15 = v14;
  v17 = v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5298);
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_0();
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  sub_2468C7BB0();
  sub_2468D67C0();
  if (v13)
  {
    OUTLINED_FUNCTION_80();
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_17_4();
    OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_29_0();
  }
  else
  {
    v58 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E51C0);
    sub_2468C7A5C(&qword_2575E5270, (uint64_t (*)(void))sub_2468C7AC4, MEMORY[0x24BEE12D0]);
    sub_2468D66F4();
    swift_bridgeObjectRetain();
    v55 = v64[0];
    v57 = OUTLINED_FUNCTION_67();
    LOBYTE(v64[0]) = 2;
    v20 = v19;
    swift_bridgeObjectRetain();
    v59 = v20;
    v46 = OUTLINED_FUNCTION_67();
    v22 = v21;
    OUTLINED_FUNCTION_55();
    OUTLINED_FUNCTION_31();
    LOBYTE(v62[0]) = 4;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_31();
    v61 = v64[0];
    swift_bridgeObjectRetain();
    v60 = v64[0];
    v23 = OUTLINED_FUNCTION_13_5();
    v25 = v24;
    v45 = v23;
    OUTLINED_FUNCTION_55();
    v54 = v25;
    v44 = OUTLINED_FUNCTION_13_5();
    v53 = v26;
    swift_bridgeObjectRetain();
    v43 = OUTLINED_FUNCTION_13_5();
    v52 = v27;
    swift_bridgeObjectRetain();
    v42 = OUTLINED_FUNCTION_13_5();
    v51 = v28;
    OUTLINED_FUNCTION_55();
    v29 = OUTLINED_FUNCTION_13_5();
    v56 = v30;
    v31 = v29;
    swift_bridgeObjectRetain();
    v32 = OUTLINED_FUNCTION_12_5();
    v50 = v33;
    v34 = v32;
    swift_bridgeObjectRetain();
    v35 = OUTLINED_FUNCTION_12_5();
    v49 = v36;
    v37 = v35;
    swift_bridgeObjectRetain();
    v41 = OUTLINED_FUNCTION_12_5();
    v48 = v38;
    LOBYTE(v64[0]) = 13;
    swift_bridgeObjectRetain();
    v40 = OUTLINED_FUNCTION_12_5();
    v47 = v39;
    sub_2468C796C();
    swift_bridgeObjectRetain();
    sub_2468D66F4();
    OUTLINED_FUNCTION_1_5();
    v62[0] = v55;
    v62[1] = v57;
    v62[2] = v59;
    v62[3] = v46;
    v62[4] = v22;
    v62[5] = v61;
    v62[6] = v60;
    v62[7] = v45;
    v62[8] = v54;
    v62[9] = v44;
    v62[10] = v53;
    v62[11] = v43;
    v62[12] = v52;
    v62[13] = v42;
    v62[14] = v51;
    v62[15] = v31;
    v62[16] = v56;
    v62[17] = v34;
    v62[18] = v50;
    v62[19] = v37;
    v62[20] = v49;
    v62[21] = v41;
    v62[22] = v48;
    v62[23] = v40;
    v62[24] = v47;
    v63 = a13;
    sub_2468C7BEC((uint64_t)v62);
    OUTLINED_FUNCTION_57();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_23_4();
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_23_4();
    OUTLINED_FUNCTION_57();
    OUTLINED_FUNCTION_9_0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_74();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_80();
    v64[0] = v55;
    v64[1] = v57;
    v64[2] = v59;
    v64[3] = v46;
    v64[4] = v22;
    v64[5] = v61;
    v64[6] = v60;
    v64[7] = v45;
    v64[8] = v54;
    v64[9] = v44;
    v64[10] = v53;
    v64[11] = v43;
    v64[12] = v52;
    v64[13] = v42;
    v64[14] = v51;
    v64[15] = v31;
    v64[16] = v56;
    v64[17] = v34;
    v64[18] = v50;
    v64[19] = v37;
    v64[20] = v49;
    v64[21] = v41;
    v64[22] = v48;
    v64[23] = v40;
    v64[24] = v47;
    v65 = a13;
    sub_2468C7CDC((uint64_t)v64);
    OUTLINED_FUNCTION_66(v58, v62);
  }
  OUTLINED_FUNCTION_2_0();
}

void sub_2468C74E0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  uint64_t v9;
  uint64_t v11[26];

  SiriMailMessage.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, v11[0], v11[1], SWORD2(v11[1]), SBYTE6(v11[1]), SHIBYTE(v11[1]));
  if (!v9)
    memcpy(a9, v11, 0xC9uLL);
}

uint64_t sub_2468C7528(_QWORD *a1)
{
  const void *v1;
  _BYTE v4[201];

  memcpy(v4, v1, sizeof(v4));
  return SiriMailMessage.encode(to:)(a1);
}

unint64_t sub_2468C7578()
{
  unint64_t result;

  result = qword_2575E5170;
  if (!qword_2575E5170)
  {
    result = MEMORY[0x249562024](&unk_2468D9F0C, &type metadata for SiriMailMessage.StateChange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5170);
  }
  return result;
}

void *sub_2468C75B4(void *__src, void *__dst)
{
  return memcpy(__dst, __src, 0xC9uLL);
}

uint64_t sub_2468C75C8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 200) >> 4;
}

unint64_t sub_2468C75D4()
{
  unint64_t result;

  result = qword_2575E5178;
  if (!qword_2575E5178)
  {
    result = MEMORY[0x249562024](&unk_2468D9EBC, &type metadata for SiriMailMessage.StateChange.StateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5178);
  }
  return result;
}

unint64_t sub_2468C7610()
{
  unint64_t result;

  result = qword_2575E5180;
  if (!qword_2575E5180)
  {
    result = MEMORY[0x249562024](&protocol conformance descriptor for SiriMailMessage.State, &type metadata for SiriMailMessage.State);
    atomic_store(result, (unint64_t *)&qword_2575E5180);
  }
  return result;
}

unint64_t sub_2468C764C()
{
  unint64_t result;

  result = qword_2575E5188;
  if (!qword_2575E5188)
  {
    result = MEMORY[0x249562024](&unk_2468D9E6C, &type metadata for SiriMailMessage.StateChange.ActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5188);
  }
  return result;
}

unint64_t sub_2468C7688()
{
  unint64_t result;

  result = qword_2575E5190;
  if (!qword_2575E5190)
  {
    result = MEMORY[0x249562024](&protocol conformance descriptor for SiriMailMessage.Action, &type metadata for SiriMailMessage.Action);
    atomic_store(result, (unint64_t *)&qword_2575E5190);
  }
  return result;
}

unint64_t sub_2468C76C4()
{
  unint64_t result;

  result = qword_2575E51A0;
  if (!qword_2575E51A0)
  {
    result = MEMORY[0x249562024](&unk_2468D9E1C, &type metadata for SiriMailMessage.StateChange.FocusedFieldCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E51A0);
  }
  return result;
}

unint64_t sub_2468C7700()
{
  unint64_t result;

  result = qword_2575E51A8;
  if (!qword_2575E51A8)
  {
    result = MEMORY[0x249562024](&protocol conformance descriptor for SiriMailMessage.Field, &type metadata for SiriMailMessage.Field);
    atomic_store(result, (unint64_t *)&qword_2575E51A8);
  }
  return result;
}

uint64_t sub_2468C773C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a3);
  v4 = OUTLINED_FUNCTION_19_1();
  v5(v4);
  return a2;
}

unint64_t sub_2468C777C()
{
  unint64_t result;

  result = qword_2575E51B8;
  if (!qword_2575E51B8)
  {
    result = MEMORY[0x249562024](&unk_2468D9DCC, &type metadata for SiriMailMessage.StateChange.BccCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E51B8);
  }
  return result;
}

unint64_t sub_2468C77B8()
{
  unint64_t result;

  result = qword_2575E51D0;
  if (!qword_2575E51D0)
  {
    result = MEMORY[0x249562024](&protocol conformance descriptor for SiriMailMessage.Account, &type metadata for SiriMailMessage.Account);
    atomic_store(result, (unint64_t *)&qword_2575E51D0);
  }
  return result;
}

unint64_t sub_2468C77F4()
{
  unint64_t result;

  result = qword_2575E51D8;
  if (!qword_2575E51D8)
  {
    result = MEMORY[0x249562024](&unk_2468D9D7C, &type metadata for SiriMailMessage.StateChange.CcCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E51D8);
  }
  return result;
}

unint64_t sub_2468C7830()
{
  unint64_t result;

  result = qword_2575E51E0;
  if (!qword_2575E51E0)
  {
    result = MEMORY[0x249562024](&unk_2468D9D2C, &type metadata for SiriMailMessage.StateChange.ToCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E51E0);
  }
  return result;
}

unint64_t sub_2468C786C()
{
  unint64_t result;

  result = qword_2575E51E8;
  if (!qword_2575E51E8)
  {
    result = MEMORY[0x249562024](&unk_2468D9CDC, &type metadata for SiriMailMessage.StateChange.BodyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E51E8);
  }
  return result;
}

uint64_t sub_2468C78A8(uint64_t result)
{
  *(_BYTE *)(result + 200) &= 0xFu;
  return result;
}

unint64_t sub_2468C78B8()
{
  unint64_t result;

  result = qword_2575E51F0;
  if (!qword_2575E51F0)
  {
    result = MEMORY[0x249562024](&unk_2468D9C8C, &type metadata for SiriMailMessage.StateChange.SubjectCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E51F0);
  }
  return result;
}

unint64_t sub_2468C78F4()
{
  unint64_t result;

  result = qword_2575E51F8;
  if (!qword_2575E51F8)
  {
    result = MEMORY[0x249562024](&unk_2468D9C3C, &type metadata for SiriMailMessage.StateChange.ModelUpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E51F8);
  }
  return result;
}

unint64_t sub_2468C7930()
{
  unint64_t result;

  result = qword_2575E5200;
  if (!qword_2575E5200)
  {
    result = MEMORY[0x249562024](&protocol conformance descriptor for SiriMailMessage, &type metadata for SiriMailMessage);
    atomic_store(result, (unint64_t *)&qword_2575E5200);
  }
  return result;
}

unint64_t sub_2468C796C()
{
  unint64_t result;

  result = qword_2575E5258;
  if (!qword_2575E5258)
  {
    result = MEMORY[0x249562024](&protocol conformance descriptor for SiriMailMessage.State, &type metadata for SiriMailMessage.State);
    atomic_store(result, (unint64_t *)&qword_2575E5258);
  }
  return result;
}

uint64_t sub_2468C79A8(uint64_t result)
{
  *(_BYTE *)(result + 200) = *(_BYTE *)(result + 200) & 3 | 0x80;
  return result;
}

unint64_t sub_2468C79BC()
{
  unint64_t result;

  result = qword_2575E5260;
  if (!qword_2575E5260)
  {
    result = MEMORY[0x249562024](&protocol conformance descriptor for SiriMailMessage.Action, &type metadata for SiriMailMessage.Action);
    atomic_store(result, (unint64_t *)&qword_2575E5260);
  }
  return result;
}

uint64_t sub_2468C79F8(uint64_t result)
{
  *(_BYTE *)(result + 200) = *(_BYTE *)(result + 200) & 3 | 0x70;
  return result;
}

unint64_t sub_2468C7A0C()
{
  unint64_t result;

  result = qword_2575E5268;
  if (!qword_2575E5268)
  {
    result = MEMORY[0x249562024](&protocol conformance descriptor for SiriMailMessage.Field, &type metadata for SiriMailMessage.Field);
    atomic_store(result, (unint64_t *)&qword_2575E5268);
  }
  return result;
}

uint64_t sub_2468C7A48(uint64_t result)
{
  *(_BYTE *)(result + 200) = *(_BYTE *)(result + 200) & 3 | 0x60;
  return result;
}

uint64_t sub_2468C7A5C(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E51C0);
    v8 = a2();
    result = MEMORY[0x249562024](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2468C7AC4()
{
  unint64_t result;

  result = qword_2575E5278;
  if (!qword_2575E5278)
  {
    result = MEMORY[0x249562024](&protocol conformance descriptor for SiriMailMessage.Account, &type metadata for SiriMailMessage.Account);
    atomic_store(result, (unint64_t *)&qword_2575E5278);
  }
  return result;
}

uint64_t sub_2468C7B00(uint64_t result)
{
  *(_BYTE *)(result + 200) = *(_BYTE *)(result + 200) & 3 | 0x50;
  return result;
}

uint64_t sub_2468C7B14(uint64_t result)
{
  *(_BYTE *)(result + 200) = *(_BYTE *)(result + 200) & 3 | 0x40;
  return result;
}

uint64_t sub_2468C7B28(uint64_t result)
{
  *(_BYTE *)(result + 200) = *(_BYTE *)(result + 200) & 3 | 0x30;
  return result;
}

uint64_t sub_2468C7B3C(uint64_t result)
{
  *(_BYTE *)(result + 200) = *(_BYTE *)(result + 200) & 3 | 0x20;
  return result;
}

uint64_t sub_2468C7B50(uint64_t result)
{
  *(_BYTE *)(result + 200) = *(_BYTE *)(result + 200) & 3 | 0x10;
  return result;
}

unint64_t sub_2468C7B64()
{
  unint64_t result;

  result = qword_2575E5280;
  if (!qword_2575E5280)
  {
    result = MEMORY[0x249562024](&protocol conformance descriptor for SiriMailMessage, &type metadata for SiriMailMessage);
    atomic_store(result, (unint64_t *)&qword_2575E5280);
  }
  return result;
}

uint64_t sub_2468C7BA0(uint64_t result)
{
  *(_BYTE *)(result + 200) &= 3u;
  return result;
}

unint64_t sub_2468C7BB0()
{
  unint64_t result;

  result = qword_2575E5290;
  if (!qword_2575E5290)
  {
    result = MEMORY[0x249562024](&unk_2468D9BEC, &type metadata for SiriMailMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5290);
  }
  return result;
}

uint64_t sub_2468C7BEC(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2468C7CDC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_2468C7DD4()
{
  unint64_t result;

  result = qword_2575E52A0;
  if (!qword_2575E52A0)
  {
    result = MEMORY[0x249562024](&protocol conformance descriptor for SiriMailMessage.State, &type metadata for SiriMailMessage.State);
    atomic_store(result, (unint64_t *)&qword_2575E52A0);
  }
  return result;
}

unint64_t sub_2468C7E14()
{
  unint64_t result;

  result = qword_2575E52A8;
  if (!qword_2575E52A8)
  {
    result = MEMORY[0x249562024](&protocol conformance descriptor for SiriMailMessage.Field, &type metadata for SiriMailMessage.Field);
    atomic_store(result, (unint64_t *)&qword_2575E52A8);
  }
  return result;
}

unint64_t sub_2468C7E54()
{
  unint64_t result;

  result = qword_2575E52B0;
  if (!qword_2575E52B0)
  {
    result = MEMORY[0x249562024](&protocol conformance descriptor for SiriMailMessage.Action, &type metadata for SiriMailMessage.Action);
    atomic_store(result, (unint64_t *)&qword_2575E52B0);
  }
  return result;
}

uint64_t destroy for SiriMailMessage()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SiriMailMessage(uint64_t a1, uint64_t a2)
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

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v8;
  v9 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v9;
  v10 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v10;
  v11 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v11;
  v12 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v12;
  v13 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v13;
  v14 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v14;
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_BYTE *)(a1 + 200) = *(_BYTE *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SiriMailMessage(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 200) = *(_BYTE *)(a2 + 200);
  return a1;
}

void *__swift_memcpy201_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xC9uLL);
}

uint64_t assignWithTake for SiriMailMessage(uint64_t a1, uint64_t a2)
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

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = v13;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 200) = *(_BYTE *)(a2 + 200);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriMailMessage(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 201))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriMailMessage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 200) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 201) = 1;
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
    *(_BYTE *)(result + 201) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for SiriMailMessage()
{
  OUTLINED_FUNCTION_44();
}

uint64_t destroy for SiriMailMessage.Account()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for SiriMailMessage.Account(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for SiriMailMessage.Account(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for SiriMailMessage.Account(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for SiriMailMessage.Account(uint64_t a1, int a2)
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
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for SiriMailMessage.Account(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for SiriMailMessage.Account()
{
  OUTLINED_FUNCTION_44();
}

uint64_t getEnumTagSinglePayload for SiriMailMessage.State(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SiriMailMessage.State(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2468C867C + 4 * byte_2468D8BFE[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2468C86B0 + 4 * byte_2468D8BF9[v4]))();
}

uint64_t sub_2468C86B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468C86B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2468C86C0);
  return result;
}

uint64_t sub_2468C86CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2468C86D4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2468C86D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468C86E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for SiriMailMessage.State()
{
  OUTLINED_FUNCTION_44();
}

void type metadata accessor for SiriMailMessage.Field()
{
  OUTLINED_FUNCTION_44();
}

void type metadata accessor for SiriMailMessage.Action()
{
  OUTLINED_FUNCTION_44();
}

uint64_t sub_2468C871C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,unsigned __int8 a26)
{
  uint64_t result;

  switch(a26 >> 4)
  {
    case 0:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_3;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
LABEL_3:
      result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for SiriMailMessage.StateChange(uint64_t a1)
{
  return sub_2468C88BC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
           *(_QWORD *)(a1 + 152),
           *(_QWORD *)(a1 + 160),
           *(_QWORD *)(a1 + 168),
           *(_QWORD *)(a1 + 176),
           *(_QWORD *)(a1 + 184),
           *(_QWORD *)(a1 + 192),
           *(_BYTE *)(a1 + 200));
}

uint64_t sub_2468C88BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,unsigned __int8 a26)
{
  uint64_t result;

  switch(a26 >> 4)
  {
    case 0:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_3;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
LABEL_3:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for SiriMailMessage.StateChange(uint64_t a1, uint64_t a2)
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
  unsigned __int8 v29;

  v3 = *(_QWORD *)(a2 + 56);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_QWORD *)(a2 + 80);
  v15 = *(_QWORD *)(a2 + 88);
  v16 = *(_QWORD *)(a2 + 96);
  v17 = *(_QWORD *)(a2 + 104);
  v18 = *(_QWORD *)(a2 + 112);
  v19 = *(_QWORD *)(a2 + 120);
  v20 = *(_QWORD *)(a2 + 128);
  v21 = *(_QWORD *)(a2 + 136);
  v22 = *(_QWORD *)(a2 + 144);
  v23 = *(_QWORD *)(a2 + 152);
  v24 = *(_QWORD *)(a2 + 160);
  v25 = *(_QWORD *)(a2 + 168);
  v26 = *(_QWORD *)(a2 + 176);
  v27 = *(_QWORD *)(a2 + 184);
  v28 = *(_QWORD *)(a2 + 192);
  v29 = *(_BYTE *)(a2 + 200);
  v4 = *(_QWORD *)(a2 + 64);
  v5 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a2 + 40);
  v11 = *(_QWORD *)(a2 + 48);
  sub_2468C871C(*(_QWORD *)a2, v6, v7, v8, v9, v10, v11, v3, v4, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29);
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 32) = v9;
  *(_QWORD *)(a1 + 40) = v10;
  *(_QWORD *)(a1 + 48) = v11;
  *(_QWORD *)(a1 + 56) = v3;
  *(_QWORD *)(a1 + 64) = v4;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_QWORD *)(a1 + 88) = v15;
  *(_QWORD *)(a1 + 96) = v16;
  *(_QWORD *)(a1 + 104) = v17;
  *(_QWORD *)(a1 + 112) = v18;
  *(_QWORD *)(a1 + 120) = v19;
  *(_QWORD *)(a1 + 128) = v20;
  *(_QWORD *)(a1 + 136) = v21;
  *(_QWORD *)(a1 + 144) = v22;
  *(_QWORD *)(a1 + 152) = v23;
  *(_QWORD *)(a1 + 160) = v24;
  *(_QWORD *)(a1 + 168) = v25;
  *(_QWORD *)(a1 + 176) = v26;
  *(_QWORD *)(a1 + 184) = v27;
  *(_QWORD *)(a1 + 192) = v28;
  *(_BYTE *)(a1 + 200) = v29;
  return a1;
}

uint64_t assignWithCopy for SiriMailMessage.StateChange(uint64_t a1, uint64_t a2)
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
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unsigned __int8 v29;
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
  unsigned __int8 v47;

  v3 = *(_QWORD *)(a2 + 56);
  v31 = *(_QWORD *)(a2 + 72);
  v32 = *(_QWORD *)(a2 + 80);
  v33 = *(_QWORD *)(a2 + 88);
  v34 = *(_QWORD *)(a2 + 96);
  v35 = *(_QWORD *)(a2 + 104);
  v36 = *(_QWORD *)(a2 + 112);
  v37 = *(_QWORD *)(a2 + 120);
  v38 = *(_QWORD *)(a2 + 128);
  v39 = *(_QWORD *)(a2 + 136);
  v40 = *(_QWORD *)(a2 + 144);
  v41 = *(_QWORD *)(a2 + 152);
  v42 = *(_QWORD *)(a2 + 160);
  v43 = *(_QWORD *)(a2 + 168);
  v44 = *(_QWORD *)(a2 + 176);
  v45 = *(_QWORD *)(a2 + 184);
  v46 = *(_QWORD *)(a2 + 192);
  v47 = *(_BYTE *)(a2 + 200);
  v4 = *(_QWORD *)(a2 + 64);
  v5 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a2 + 40);
  v11 = *(_QWORD *)(a2 + 48);
  sub_2468C871C(*(_QWORD *)a2, v6, v7, v8, v9, v10, v11, v3, v4, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v6;
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = v9;
  *(_QWORD *)(a1 + 40) = v10;
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v11;
  *(_QWORD *)(a1 + 56) = v3;
  v20 = *(_OWORD *)(a1 + 64);
  v21 = *(_OWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 64) = v4;
  *(_QWORD *)(a1 + 72) = v31;
  *(_QWORD *)(a1 + 80) = v32;
  *(_QWORD *)(a1 + 88) = v33;
  v22 = *(_OWORD *)(a1 + 96);
  v23 = *(_OWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 96) = v34;
  *(_QWORD *)(a1 + 104) = v35;
  *(_QWORD *)(a1 + 112) = v36;
  *(_QWORD *)(a1 + 120) = v37;
  v24 = *(_OWORD *)(a1 + 128);
  v25 = *(_OWORD *)(a1 + 144);
  *(_QWORD *)(a1 + 128) = v38;
  *(_QWORD *)(a1 + 136) = v39;
  *(_QWORD *)(a1 + 144) = v40;
  *(_QWORD *)(a1 + 152) = v41;
  v26 = *(_OWORD *)(a1 + 160);
  v27 = *(_OWORD *)(a1 + 176);
  *(_QWORD *)(a1 + 160) = v42;
  *(_QWORD *)(a1 + 168) = v43;
  *(_QWORD *)(a1 + 176) = v44;
  *(_QWORD *)(a1 + 184) = v45;
  v28 = *(_QWORD *)(a1 + 192);
  *(_QWORD *)(a1 + 192) = v46;
  v29 = *(_BYTE *)(a1 + 200);
  *(_BYTE *)(a1 + 200) = v47;
  sub_2468C88BC(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, *((uint64_t *)&v23 + 1), v24, *((uint64_t *)&v24 + 1), v25,
    *((uint64_t *)&v25 + 1),
    v26,
    *((uint64_t *)&v26 + 1),
    v27,
    *((uint64_t *)&v27 + 1),
    v28,
    v29);
  return a1;
}

uint64_t assignWithTake for SiriMailMessage.StateChange(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  unsigned __int8 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v3 = *(_QWORD *)(a2 + 192);
  v4 = *(_BYTE *)(a2 + 200);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(_OWORD *)(a1 + 64);
  v14 = *(_OWORD *)(a1 + 80);
  v15 = *(_OWORD *)(a1 + 96);
  v16 = *(_OWORD *)(a1 + 112);
  v17 = *(_OWORD *)(a1 + 128);
  v18 = *(_OWORD *)(a1 + 144);
  v19 = *(_OWORD *)(a1 + 160);
  v20 = *(_OWORD *)(a1 + 176);
  v21 = *(_QWORD *)(a1 + 192);
  v22 = *(_BYTE *)(a1 + 200);
  v23 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v23;
  v24 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v24;
  v25 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v25;
  v26 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v26;
  v27 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v27;
  v28 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v28;
  *(_QWORD *)(a1 + 192) = v3;
  *(_BYTE *)(a1 + 200) = v4;
  sub_2468C88BC(v5, v7, v6, v8, v9, v10, v11, v12, v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v17, *((uint64_t *)&v17 + 1), v18,
    *((uint64_t *)&v18 + 1),
    v19,
    *((uint64_t *)&v19 + 1),
    v20,
    *((uint64_t *)&v20 + 1),
    v21,
    v22);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriMailMessage.StateChange(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x38 && *(_BYTE *)(a1 + 201))
    {
      v2 = *(_DWORD *)a1 + 55;
    }
    else
    {
      v2 = ((*(unsigned __int8 *)(a1 + 200) >> 4) & 0xFFFFFFCF | (16 * ((*(unsigned __int8 *)(a1 + 200) >> 2) & 3))) ^ 0x3F;
      if (v2 >= 0x37)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

void storeEnumTagSinglePayload for SiriMailMessage.StateChange(char *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v4;

  if (a2 > 0x37)
  {
    *(_OWORD *)(a1 + 184) = 0u;
    *(_OWORD *)(a1 + 168) = 0u;
    *(_OWORD *)(a1 + 152) = 0u;
    *(_OWORD *)(a1 + 136) = 0u;
    *(_OWORD *)(a1 + 120) = 0u;
    *(_OWORD *)(a1 + 104) = 0u;
    *(_OWORD *)(a1 + 88) = 0u;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    a1[200] = 0;
    *(_QWORD *)a1 = a2 - 56;
    if (a3 >= 0x38)
      a1[201] = 1;
  }
  else
  {
    if (a3 >= 0x38)
      a1[201] = 0;
    if (a2)
    {
      v4 = 4 * (((-a2 >> 4) & 3) - 4 * a2);
      bzero(a1, 0xC8uLL);
      a1[200] = v4;
    }
  }
}

uint64_t sub_2468C8ECC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 200) = *(_BYTE *)(result + 200) & 3 | (16 * a2);
  return result;
}

void type metadata accessor for SiriMailMessage.StateChange()
{
  OUTLINED_FUNCTION_44();
}

uint64_t getEnumTagSinglePayload for SiriMailMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF2)
  {
    if (a2 + 14 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 14) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 15;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xF;
  v5 = v6 - 15;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriMailMessage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 14 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 14) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF2)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF1)
    return ((uint64_t (*)(void))((char *)&loc_2468C8FC0 + 4 * byte_2468D8C14[v4]))();
  *a1 = a2 + 14;
  return ((uint64_t (*)(void))((char *)sub_2468C8FF4 + 4 * byte_2468D8C0F[v4]))();
}

uint64_t sub_2468C8FF4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468C8FFC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2468C9004);
  return result;
}

uint64_t sub_2468C9010(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2468C9018);
  *(_BYTE *)result = a2 + 14;
  return result;
}

uint64_t sub_2468C901C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468C9024(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriMailMessage.CodingKeys()
{
  return &type metadata for SiriMailMessage.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SiriMailMessage.StateChange.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF8)
  {
    if (a2 + 8 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 8) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v5 = v6 - 9;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriMailMessage.StateChange.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_2468C9114 + 4 * byte_2468D8C1E[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_2468C9148 + 4 * byte_2468D8C19[v4]))();
}

uint64_t sub_2468C9148(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468C9150(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2468C9158);
  return result;
}

uint64_t sub_2468C9164(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2468C916CLL);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_2468C9170(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468C9178(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriMailMessage.StateChange.CodingKeys()
{
  return &type metadata for SiriMailMessage.StateChange.CodingKeys;
}

ValueMetadata *type metadata accessor for SiriMailMessage.StateChange.ModelUpdateCodingKeys()
{
  return &type metadata for SiriMailMessage.StateChange.ModelUpdateCodingKeys;
}

ValueMetadata *type metadata accessor for SiriMailMessage.StateChange.SubjectCodingKeys()
{
  return &type metadata for SiriMailMessage.StateChange.SubjectCodingKeys;
}

ValueMetadata *type metadata accessor for SiriMailMessage.StateChange.BodyCodingKeys()
{
  return &type metadata for SiriMailMessage.StateChange.BodyCodingKeys;
}

ValueMetadata *type metadata accessor for SiriMailMessage.StateChange.ToCodingKeys()
{
  return &type metadata for SiriMailMessage.StateChange.ToCodingKeys;
}

ValueMetadata *type metadata accessor for SiriMailMessage.StateChange.CcCodingKeys()
{
  return &type metadata for SiriMailMessage.StateChange.CcCodingKeys;
}

ValueMetadata *type metadata accessor for SiriMailMessage.StateChange.BccCodingKeys()
{
  return &type metadata for SiriMailMessage.StateChange.BccCodingKeys;
}

ValueMetadata *type metadata accessor for SiriMailMessage.StateChange.FocusedFieldCodingKeys()
{
  return &type metadata for SiriMailMessage.StateChange.FocusedFieldCodingKeys;
}

ValueMetadata *type metadata accessor for SiriMailMessage.StateChange.ActionCodingKeys()
{
  return &type metadata for SiriMailMessage.StateChange.ActionCodingKeys;
}

uint64_t _s10SiriMailUI15SiriMailMessageV11StateChangeO21ModelUpdateCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2468C9258 + 4 * byte_2468D8C23[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2468C9278 + 4 * byte_2468D8C28[v4]))();
}

_BYTE *sub_2468C9258(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2468C9278(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2468C9280(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2468C9288(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2468C9290(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2468C9298(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SiriMailMessage.StateChange.StateCodingKeys()
{
  return &type metadata for SiriMailMessage.StateChange.StateCodingKeys;
}

uint64_t _s10SiriMailUI15SiriMailMessageV5FieldOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s10SiriMailUI15SiriMailMessageV5FieldOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2468C9388 + 4 * byte_2468D8C32[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2468C93BC + 4 * byte_2468D8C2D[v4]))();
}

uint64_t sub_2468C93BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468C93C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2468C93CCLL);
  return result;
}

uint64_t sub_2468C93D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2468C93E0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2468C93E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468C93EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriMailMessage.Field.CodingKeys()
{
  return &type metadata for SiriMailMessage.Field.CodingKeys;
}

ValueMetadata *type metadata accessor for SiriMailMessage.Field.ToCodingKeys()
{
  return &type metadata for SiriMailMessage.Field.ToCodingKeys;
}

ValueMetadata *type metadata accessor for SiriMailMessage.Field.CcCodingKeys()
{
  return &type metadata for SiriMailMessage.Field.CcCodingKeys;
}

ValueMetadata *type metadata accessor for SiriMailMessage.Field.BccCodingKeys()
{
  return &type metadata for SiriMailMessage.Field.BccCodingKeys;
}

ValueMetadata *type metadata accessor for SiriMailMessage.Field.SubjectCodingKeys()
{
  return &type metadata for SiriMailMessage.Field.SubjectCodingKeys;
}

ValueMetadata *type metadata accessor for SiriMailMessage.Field.BodyCodingKeys()
{
  return &type metadata for SiriMailMessage.Field.BodyCodingKeys;
}

uint64_t _s10SiriMailUI15SiriMailMessageV6ActionOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2468C94A4 + 4 * byte_2468D8C3C[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2468C94D8 + 4 * byte_2468D8C37[v4]))();
}

uint64_t sub_2468C94D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468C94E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2468C94E8);
  return result;
}

uint64_t sub_2468C94F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2468C94FCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2468C9500(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468C9508(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriMailMessage.Account.CodingKeys()
{
  return &type metadata for SiriMailMessage.Account.CodingKeys;
}

unint64_t sub_2468C9528()
{
  unint64_t result;

  result = qword_2575E52B8;
  if (!qword_2575E52B8)
  {
    result = MEMORY[0x249562024](&unk_2468D9194, &type metadata for SiriMailMessage.Account.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E52B8);
  }
  return result;
}

unint64_t sub_2468C9568()
{
  unint64_t result;

  result = qword_2575E52C0;
  if (!qword_2575E52C0)
  {
    result = MEMORY[0x249562024](&unk_2468D93DC, &type metadata for SiriMailMessage.Field.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E52C0);
  }
  return result;
}

unint64_t sub_2468C95A8()
{
  unint64_t result;

  result = qword_2575E52C8;
  if (!qword_2575E52C8)
  {
    result = MEMORY[0x249562024](&unk_2468D9494, &type metadata for SiriMailMessage.StateChange.StateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E52C8);
  }
  return result;
}

unint64_t sub_2468C95E8()
{
  unint64_t result;

  result = qword_2575E52D0;
  if (!qword_2575E52D0)
  {
    result = MEMORY[0x249562024](&unk_2468D954C, &type metadata for SiriMailMessage.StateChange.ActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E52D0);
  }
  return result;
}

unint64_t sub_2468C9628()
{
  unint64_t result;

  result = qword_2575E52D8;
  if (!qword_2575E52D8)
  {
    result = MEMORY[0x249562024](&unk_2468D9604, &type metadata for SiriMailMessage.StateChange.FocusedFieldCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E52D8);
  }
  return result;
}

unint64_t sub_2468C9668()
{
  unint64_t result;

  result = qword_2575E52E0;
  if (!qword_2575E52E0)
  {
    result = MEMORY[0x249562024](&unk_2468D96BC, &type metadata for SiriMailMessage.StateChange.BccCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E52E0);
  }
  return result;
}

unint64_t sub_2468C96A8()
{
  unint64_t result;

  result = qword_2575E52E8;
  if (!qword_2575E52E8)
  {
    result = MEMORY[0x249562024](&unk_2468D9774, &type metadata for SiriMailMessage.StateChange.CcCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E52E8);
  }
  return result;
}

unint64_t sub_2468C96E8()
{
  unint64_t result;

  result = qword_2575E52F0;
  if (!qword_2575E52F0)
  {
    result = MEMORY[0x249562024](&unk_2468D982C, &type metadata for SiriMailMessage.StateChange.ToCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E52F0);
  }
  return result;
}

unint64_t sub_2468C9728()
{
  unint64_t result;

  result = qword_2575E52F8;
  if (!qword_2575E52F8)
  {
    result = MEMORY[0x249562024](&unk_2468D98E4, &type metadata for SiriMailMessage.StateChange.BodyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E52F8);
  }
  return result;
}

unint64_t sub_2468C9768()
{
  unint64_t result;

  result = qword_2575E5300;
  if (!qword_2575E5300)
  {
    result = MEMORY[0x249562024](&unk_2468D999C, &type metadata for SiriMailMessage.StateChange.SubjectCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5300);
  }
  return result;
}

unint64_t sub_2468C97A8()
{
  unint64_t result;

  result = qword_2575E5308;
  if (!qword_2575E5308)
  {
    result = MEMORY[0x249562024](&unk_2468D9A54, &type metadata for SiriMailMessage.StateChange.ModelUpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5308);
  }
  return result;
}

unint64_t sub_2468C97E8()
{
  unint64_t result;

  result = qword_2575E5310;
  if (!qword_2575E5310)
  {
    result = MEMORY[0x249562024](&unk_2468D9B0C, &type metadata for SiriMailMessage.StateChange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5310);
  }
  return result;
}

unint64_t sub_2468C9828()
{
  unint64_t result;

  result = qword_2575E5318;
  if (!qword_2575E5318)
  {
    result = MEMORY[0x249562024](&unk_2468D9BC4, &type metadata for SiriMailMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5318);
  }
  return result;
}

unint64_t sub_2468C9868()
{
  unint64_t result;

  result = qword_2575E5320;
  if (!qword_2575E5320)
  {
    result = MEMORY[0x249562024](&unk_2468D9B34, &type metadata for SiriMailMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5320);
  }
  return result;
}

unint64_t sub_2468C98A8()
{
  unint64_t result;

  result = qword_2575E5328;
  if (!qword_2575E5328)
  {
    result = MEMORY[0x249562024](&unk_2468D9B5C, &type metadata for SiriMailMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5328);
  }
  return result;
}

unint64_t sub_2468C98E8()
{
  unint64_t result;

  result = qword_2575E5330;
  if (!qword_2575E5330)
  {
    result = MEMORY[0x249562024](&unk_2468D99C4, &type metadata for SiriMailMessage.StateChange.ModelUpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5330);
  }
  return result;
}

unint64_t sub_2468C9928()
{
  unint64_t result;

  result = qword_2575E5338;
  if (!qword_2575E5338)
  {
    result = MEMORY[0x249562024](&unk_2468D99EC, &type metadata for SiriMailMessage.StateChange.ModelUpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5338);
  }
  return result;
}

unint64_t sub_2468C9968()
{
  unint64_t result;

  result = qword_2575E5340;
  if (!qword_2575E5340)
  {
    result = MEMORY[0x249562024](&unk_2468D990C, &type metadata for SiriMailMessage.StateChange.SubjectCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5340);
  }
  return result;
}

unint64_t sub_2468C99A8()
{
  unint64_t result;

  result = qword_2575E5348;
  if (!qword_2575E5348)
  {
    result = MEMORY[0x249562024](&unk_2468D9934, &type metadata for SiriMailMessage.StateChange.SubjectCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5348);
  }
  return result;
}

unint64_t sub_2468C99E8()
{
  unint64_t result;

  result = qword_2575E5350;
  if (!qword_2575E5350)
  {
    result = MEMORY[0x249562024](&unk_2468D9854, &type metadata for SiriMailMessage.StateChange.BodyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5350);
  }
  return result;
}

unint64_t sub_2468C9A28()
{
  unint64_t result;

  result = qword_2575E5358;
  if (!qword_2575E5358)
  {
    result = MEMORY[0x249562024](&unk_2468D987C, &type metadata for SiriMailMessage.StateChange.BodyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5358);
  }
  return result;
}

unint64_t sub_2468C9A68()
{
  unint64_t result;

  result = qword_2575E5360;
  if (!qword_2575E5360)
  {
    result = MEMORY[0x249562024](&unk_2468D979C, &type metadata for SiriMailMessage.StateChange.ToCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5360);
  }
  return result;
}

unint64_t sub_2468C9AA8()
{
  unint64_t result;

  result = qword_2575E5368;
  if (!qword_2575E5368)
  {
    result = MEMORY[0x249562024](&unk_2468D97C4, &type metadata for SiriMailMessage.StateChange.ToCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5368);
  }
  return result;
}

unint64_t sub_2468C9AE8()
{
  unint64_t result;

  result = qword_2575E5370;
  if (!qword_2575E5370)
  {
    result = MEMORY[0x249562024](&unk_2468D96E4, &type metadata for SiriMailMessage.StateChange.CcCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5370);
  }
  return result;
}

unint64_t sub_2468C9B28()
{
  unint64_t result;

  result = qword_2575E5378;
  if (!qword_2575E5378)
  {
    result = MEMORY[0x249562024](&unk_2468D970C, &type metadata for SiriMailMessage.StateChange.CcCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5378);
  }
  return result;
}

unint64_t sub_2468C9B68()
{
  unint64_t result;

  result = qword_2575E5380;
  if (!qword_2575E5380)
  {
    result = MEMORY[0x249562024](&unk_2468D962C, &type metadata for SiriMailMessage.StateChange.BccCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5380);
  }
  return result;
}

unint64_t sub_2468C9BA8()
{
  unint64_t result;

  result = qword_2575E5388;
  if (!qword_2575E5388)
  {
    result = MEMORY[0x249562024](&unk_2468D9654, &type metadata for SiriMailMessage.StateChange.BccCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5388);
  }
  return result;
}

unint64_t sub_2468C9BE8()
{
  unint64_t result;

  result = qword_2575E5390;
  if (!qword_2575E5390)
  {
    result = MEMORY[0x249562024](&unk_2468D9574, &type metadata for SiriMailMessage.StateChange.FocusedFieldCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5390);
  }
  return result;
}

unint64_t sub_2468C9C28()
{
  unint64_t result;

  result = qword_2575E5398;
  if (!qword_2575E5398)
  {
    result = MEMORY[0x249562024](&unk_2468D959C, &type metadata for SiriMailMessage.StateChange.FocusedFieldCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5398);
  }
  return result;
}

unint64_t sub_2468C9C68()
{
  unint64_t result;

  result = qword_2575E53A0;
  if (!qword_2575E53A0)
  {
    result = MEMORY[0x249562024](&unk_2468D94BC, &type metadata for SiriMailMessage.StateChange.ActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E53A0);
  }
  return result;
}

unint64_t sub_2468C9CA8()
{
  unint64_t result;

  result = qword_2575E53A8;
  if (!qword_2575E53A8)
  {
    result = MEMORY[0x249562024](&unk_2468D94E4, &type metadata for SiriMailMessage.StateChange.ActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E53A8);
  }
  return result;
}

unint64_t sub_2468C9CE8()
{
  unint64_t result;

  result = qword_2575E53B0;
  if (!qword_2575E53B0)
  {
    result = MEMORY[0x249562024](&unk_2468D9404, &type metadata for SiriMailMessage.StateChange.StateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E53B0);
  }
  return result;
}

unint64_t sub_2468C9D28()
{
  unint64_t result;

  result = qword_2575E53B8;
  if (!qword_2575E53B8)
  {
    result = MEMORY[0x249562024](&unk_2468D942C, &type metadata for SiriMailMessage.StateChange.StateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E53B8);
  }
  return result;
}

unint64_t sub_2468C9D68()
{
  unint64_t result;

  result = qword_2575E53C0;
  if (!qword_2575E53C0)
  {
    result = MEMORY[0x249562024](&unk_2468D9A7C, &type metadata for SiriMailMessage.StateChange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E53C0);
  }
  return result;
}

unint64_t sub_2468C9DA8()
{
  unint64_t result;

  result = qword_2575E53C8;
  if (!qword_2575E53C8)
  {
    result = MEMORY[0x249562024](&unk_2468D9AA4, &type metadata for SiriMailMessage.StateChange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E53C8);
  }
  return result;
}

unint64_t sub_2468C9DE8()
{
  unint64_t result;

  result = qword_2575E53D0;
  if (!qword_2575E53D0)
  {
    result = MEMORY[0x249562024](&unk_2468D92FC, &type metadata for SiriMailMessage.Field.ToCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E53D0);
  }
  return result;
}

unint64_t sub_2468C9E28()
{
  unint64_t result;

  result = qword_2575E53D8;
  if (!qword_2575E53D8)
  {
    result = MEMORY[0x249562024](&unk_2468D9324, &type metadata for SiriMailMessage.Field.ToCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E53D8);
  }
  return result;
}

unint64_t sub_2468C9E68()
{
  unint64_t result;

  result = qword_2575E53E0;
  if (!qword_2575E53E0)
  {
    result = MEMORY[0x249562024](&unk_2468D92AC, &type metadata for SiriMailMessage.Field.CcCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E53E0);
  }
  return result;
}

unint64_t sub_2468C9EA8()
{
  unint64_t result;

  result = qword_2575E53E8;
  if (!qword_2575E53E8)
  {
    result = MEMORY[0x249562024](&unk_2468D92D4, &type metadata for SiriMailMessage.Field.CcCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E53E8);
  }
  return result;
}

unint64_t sub_2468C9EE8()
{
  unint64_t result;

  result = qword_2575E53F0;
  if (!qword_2575E53F0)
  {
    result = MEMORY[0x249562024](&unk_2468D925C, &type metadata for SiriMailMessage.Field.BccCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E53F0);
  }
  return result;
}

unint64_t sub_2468C9F28()
{
  unint64_t result;

  result = qword_2575E53F8;
  if (!qword_2575E53F8)
  {
    result = MEMORY[0x249562024](&unk_2468D9284, &type metadata for SiriMailMessage.Field.BccCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E53F8);
  }
  return result;
}

unint64_t sub_2468C9F68()
{
  unint64_t result;

  result = qword_2575E5400;
  if (!qword_2575E5400)
  {
    result = MEMORY[0x249562024](&unk_2468D920C, &type metadata for SiriMailMessage.Field.SubjectCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5400);
  }
  return result;
}

unint64_t sub_2468C9FA8()
{
  unint64_t result;

  result = qword_2575E5408;
  if (!qword_2575E5408)
  {
    result = MEMORY[0x249562024](&unk_2468D9234, &type metadata for SiriMailMessage.Field.SubjectCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5408);
  }
  return result;
}

unint64_t sub_2468C9FE8()
{
  unint64_t result;

  result = qword_2575E5410;
  if (!qword_2575E5410)
  {
    result = MEMORY[0x249562024](&unk_2468D91BC, &type metadata for SiriMailMessage.Field.BodyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5410);
  }
  return result;
}

unint64_t sub_2468CA028()
{
  unint64_t result;

  result = qword_2575E5418;
  if (!qword_2575E5418)
  {
    result = MEMORY[0x249562024](&unk_2468D91E4, &type metadata for SiriMailMessage.Field.BodyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5418);
  }
  return result;
}

unint64_t sub_2468CA068()
{
  unint64_t result;

  result = qword_2575E5420;
  if (!qword_2575E5420)
  {
    result = MEMORY[0x249562024](&unk_2468D934C, &type metadata for SiriMailMessage.Field.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5420);
  }
  return result;
}

unint64_t sub_2468CA0A8()
{
  unint64_t result;

  result = qword_2575E5428;
  if (!qword_2575E5428)
  {
    result = MEMORY[0x249562024](&unk_2468D9374, &type metadata for SiriMailMessage.Field.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5428);
  }
  return result;
}

unint64_t sub_2468CA0E8()
{
  unint64_t result;

  result = qword_2575E5430;
  if (!qword_2575E5430)
  {
    result = MEMORY[0x249562024](&unk_2468D9104, &type metadata for SiriMailMessage.Account.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5430);
  }
  return result;
}

unint64_t sub_2468CA128()
{
  unint64_t result;

  result = qword_2575E5438;
  if (!qword_2575E5438)
  {
    result = MEMORY[0x249562024](&unk_2468D912C, &type metadata for SiriMailMessage.Account.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5438);
  }
  return result;
}

unint64_t sub_2468CA164()
{
  unint64_t result;

  result = qword_2575E5440;
  if (!qword_2575E5440)
  {
    result = MEMORY[0x249562024](&protocol conformance descriptor for SiriMailMessage.Action, &type metadata for SiriMailMessage.Action);
    atomic_store(result, (unint64_t *)&qword_2575E5440);
  }
  return result;
}

unint64_t sub_2468CA1A0()
{
  unint64_t result;

  result = qword_2575E5448;
  if (!qword_2575E5448)
  {
    result = MEMORY[0x249562024](&protocol conformance descriptor for SiriMailMessage.State, &type metadata for SiriMailMessage.State);
    atomic_store(result, (unint64_t *)&qword_2575E5448);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_2_10@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 88) = a1;
  return sub_2468D6730();
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  return sub_2468D670C();
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  return sub_2468D66A0();
}

uint64_t OUTLINED_FUNCTION_7_7()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8_6@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_10_7()
{
  return sub_2468D670C();
}

uint64_t OUTLINED_FUNCTION_11_6()
{
  return sub_2468D66A0();
}

uint64_t OUTLINED_FUNCTION_12_5()
{
  return sub_2468D66D0();
}

uint64_t OUTLINED_FUNCTION_13_5()
{
  return sub_2468D66D0();
}

uint64_t OUTLINED_FUNCTION_15_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_17_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_23_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_24_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_25_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return sub_2468D66A0();
}

uint64_t OUTLINED_FUNCTION_27_0@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 89) = a1;
  return sub_2468D6724();
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return sub_2468D66C4();
}

uint64_t OUTLINED_FUNCTION_33_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return sub_2468D670C();
}

uint64_t OUTLINED_FUNCTION_42_0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_2468C773C(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_45@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 88) = a1;
  return sub_2468D6718();
}

void OUTLINED_FUNCTION_46(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_47()
{
  return sub_2468D66C4();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_49()
{
  return sub_2468D66F4();
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_52()
{
  uint64_t v0;

  return sub_2468C78A8(v0 + 440);
}

uint64_t OUTLINED_FUNCTION_53()
{
  return sub_2468D6724();
}

uint64_t OUTLINED_FUNCTION_54()
{
  return sub_2468D6754();
}

uint64_t OUTLINED_FUNCTION_55()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_56()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_57()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 104) + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_59()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_63()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_64()
{
  return sub_2468D6604();
}

void *OUTLINED_FUNCTION_66(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xC9uLL);
}

uint64_t OUTLINED_FUNCTION_67()
{
  return sub_2468D66B8();
}

uint64_t OUTLINED_FUNCTION_68()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_70(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_2468C773C(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_71()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 472) = *(_BYTE *)(v0 + 264);
  return v0 + 472;
}

uint64_t OUTLINED_FUNCTION_72()
{
  return sub_2468D67B4();
}

uint64_t OUTLINED_FUNCTION_73()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 472) = *(_QWORD *)(v0 + 264);
  return v0 + 472;
}

uint64_t OUTLINED_FUNCTION_74()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_75()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_76()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_77()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_78()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_80()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v0 + 184));
}

uint64_t OUTLINED_FUNCTION_81()
{
  return sub_2468D6754();
}

unint64_t OUTLINED_FUNCTION_82()
{
  _QWORD *v0;
  uint64_t v1;

  __swift_project_boxed_opaque_existential_1(v0, v1);
  return sub_2468C7578();
}

uint64_t OUTLINED_FUNCTION_83()
{
  return swift_bridgeObjectRelease();
}

unint64_t OUTLINED_FUNCTION_85()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 4;
  return sub_2468C3B9C();
}

uint64_t OUTLINED_FUNCTION_87()
{
  return sub_2468D679C();
}

unint64_t OUTLINED_FUNCTION_88()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 1;
  return sub_2468C3C50();
}

unint64_t OUTLINED_FUNCTION_89()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 3;
  return sub_2468C3BD8();
}

unint64_t OUTLINED_FUNCTION_90()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 2;
  return sub_2468C3C14();
}

uint64_t OUTLINED_FUNCTION_91()
{
  return sub_2468D5A04();
}

void sub_2468CA634(uint64_t *a1@<X8>)
{
  *a1 = SiriMailModel.to.getter();
  OUTLINED_FUNCTION_3();
}

void sub_2468CA658()
{
  OUTLINED_FUNCTION_46_0();
  SiriMailModel.to.setter();
  OUTLINED_FUNCTION_3();
}

void sub_2468CA674(uint64_t *a1@<X8>)
{
  *a1 = SiriMailModel.cc.getter();
  OUTLINED_FUNCTION_3();
}

void sub_2468CA698()
{
  OUTLINED_FUNCTION_46_0();
  SiriMailModel.cc.setter();
  OUTLINED_FUNCTION_3();
}

void sub_2468CA6B4(uint64_t *a1@<X8>)
{
  *a1 = SiriMailModel.bcc.getter();
  OUTLINED_FUNCTION_3();
}

void sub_2468CA6D8()
{
  OUTLINED_FUNCTION_46_0();
  SiriMailModel.bcc.setter();
  OUTLINED_FUNCTION_3();
}

void sub_2468CA6F4(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = SiriMailModel.subject.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_3();
}

void sub_2468CA718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2468CA754(a1, a2, a3, a4, (void (*)(uint64_t))SiriMailModel.subject.setter);
}

void sub_2468CA724(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = SiriMailModel.body.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_3();
}

void sub_2468CA748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2468CA754(a1, a2, a3, a4, (void (*)(uint64_t))SiriMailModel.body.setter);
}

void sub_2468CA754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v6;

  swift_bridgeObjectRetain();
  v6 = OUTLINED_FUNCTION_73_0();
  a5(v6);
  OUTLINED_FUNCTION_12_1();
}

void sub_2468CA788()
{
  SiriMailModel.focusedField.getter();
  OUTLINED_FUNCTION_3();
}

void sub_2468CA7A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_72_0(a1);
  SiriMailModel.focusedField.setter(v1);
  OUTLINED_FUNCTION_12_1();
}

uint64_t SiriMailModel.__allocating_init(message:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  SiriMailModel.init(message:)(a1);
  return v2;
}

void property wrapper backing initializer of SiriMailModel.subject(uint64_t a1, uint64_t a2)
{
  sub_2468CA8E8(a1, a2, (uint64_t)&unk_2517E4180, (uint64_t)sub_2468CCC3C);
}

uint64_t SiriMailModel.subject.getter()
{
  return sub_2468CA9B0();
}

void SiriMailModel.subject.setter()
{
  sub_2468CAA18();
}

void SiriMailModel.subject.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_11_7();
  OUTLINED_FUNCTION_29_1((uint64_t)v1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_30_1(KeyPath);
  v3 = swift_getKeyPath();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_3_9(v3);
  OUTLINED_FUNCTION_12_1();
}

void property wrapper backing initializer of SiriMailModel.body(uint64_t a1, uint64_t a2)
{
  sub_2468CA8E8(a1, a2, (uint64_t)&unk_2517E41A8, (uint64_t)sub_2468CCD18);
}

void sub_2468CA8E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_5_8();
  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = 0;
  OUTLINED_FUNCTION_22_4();
  sub_2468986A8(&qword_2575E4C78, (uint64_t (*)(uint64_t))type metadata accessor for SiriMailModel, (uint64_t)&protocol conformance descriptor for SiriMailModel);
  OUTLINED_FUNCTION_59_0();
  sub_2468D5A64();
  OUTLINED_FUNCTION_26_2();
}

uint64_t sub_2468CA968@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  *a3 = a1;
  a3[1] = a2;
  v3 = OUTLINED_FUNCTION_50_0();
  OUTLINED_FUNCTION_32_0(v3);
  return OUTLINED_FUNCTION_38_0();
}

uint64_t SiriMailModel.body.getter()
{
  return sub_2468CA9B0();
}

uint64_t sub_2468CA9B0()
{
  uint64_t v1;

  swift_getKeyPath();
  OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_53_0();
  OUTLINED_FUNCTION_74_0();
  swift_release();
  return v1;
}

void SiriMailModel.body.setter()
{
  sub_2468CAA18();
}

void sub_2468CAA18()
{
  swift_getKeyPath();
  OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_10_3();
  sub_2468D5A94();
  OUTLINED_FUNCTION_20_1();
}

void SiriMailModel.body.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_11_7();
  OUTLINED_FUNCTION_29_1((uint64_t)v1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_30_1(KeyPath);
  v3 = swift_getKeyPath();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_3_9(v3);
  OUTLINED_FUNCTION_12_1();
}

void property wrapper backing initializer of SiriMailModel.attachments()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_5_8();
  *(_QWORD *)(v0 + 16) = sub_2468CCD74;
  *(_QWORD *)(v0 + 24) = 0;
  OUTLINED_FUNCTION_22_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5460);
  sub_2468986A8(&qword_2575E4C78, (uint64_t (*)(uint64_t))type metadata accessor for SiriMailModel, (uint64_t)&protocol conformance descriptor for SiriMailModel);
  sub_2468CCDB0();
  sub_2468D5A64();
  OUTLINED_FUNCTION_20_1();
}

uint64_t SiriMailModel.attachments.getter()
{
  return sub_2468CAE1C();
}

void sub_2468CAB80()
{
  swift_bridgeObjectRetain();
  SiriMailModel.attachments.setter();
}

void SiriMailModel.attachments.setter()
{
  sub_2468CAE84();
}

void SiriMailModel.attachments.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_11_7();
  OUTLINED_FUNCTION_29_1((uint64_t)v1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_30_1(KeyPath);
  v3 = swift_getKeyPath();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_3_9(v3);
  OUTLINED_FUNCTION_12_1();
}

void property wrapper backing initializer of SiriMailModel.to(uint64_t a1)
{
  sub_2468CACB4(a1, (uint64_t)&unk_2517E41F8, (uint64_t)sub_2468CCE54);
}

uint64_t SiriMailModel.to.getter()
{
  return sub_2468CAE1C();
}

void SiriMailModel.to.setter()
{
  sub_2468CAE84();
}

void SiriMailModel.to.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_11_7();
  OUTLINED_FUNCTION_29_1((uint64_t)v1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_30_1(KeyPath);
  v3 = swift_getKeyPath();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_3_9(v3);
  OUTLINED_FUNCTION_12_1();
}

void property wrapper backing initializer of SiriMailModel.cc(uint64_t a1)
{
  sub_2468CACB4(a1, (uint64_t)&unk_2517E4220, (uint64_t)sub_2468CCF14);
}

void sub_2468CACB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_5_8();
  *(_QWORD *)(v4 + 16) = a3;
  *(_QWORD *)(v4 + 24) = 0;
  OUTLINED_FUNCTION_22_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4D40);
  sub_2468986A8(&qword_2575E4C78, (uint64_t (*)(uint64_t))type metadata accessor for SiriMailModel, (uint64_t)&protocol conformance descriptor for SiriMailModel);
  sub_2468CCE70();
  OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_69_0();
  OUTLINED_FUNCTION_20_1();
}

uint64_t SiriMailModel.cc.getter()
{
  return sub_2468CAE1C();
}

void SiriMailModel.cc.setter()
{
  sub_2468CAE84();
}

void SiriMailModel.cc.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_11_7();
  OUTLINED_FUNCTION_29_1((uint64_t)v1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_30_1(KeyPath);
  v3 = swift_getKeyPath();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_3_9(v3);
  OUTLINED_FUNCTION_12_1();
}

void property wrapper backing initializer of SiriMailModel.bcc(uint64_t a1)
{
  sub_2468CACB4(a1, (uint64_t)&unk_2517E4248, (uint64_t)sub_2468CCF58);
}

uint64_t sub_2468CADD4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  *a2 = a1;
  v2 = OUTLINED_FUNCTION_50_0();
  OUTLINED_FUNCTION_32_0(v2);
  return OUTLINED_FUNCTION_38_0();
}

uint64_t SiriMailModel.bcc.getter()
{
  return sub_2468CAE1C();
}

uint64_t sub_2468CAE1C()
{
  uint64_t v1;

  swift_getKeyPath();
  OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_53_0();
  OUTLINED_FUNCTION_74_0();
  swift_release();
  return v1;
}

void SiriMailModel.bcc.setter()
{
  sub_2468CAE84();
}

void sub_2468CAE84()
{
  swift_getKeyPath();
  OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_10_3();
  sub_2468D5A94();
  OUTLINED_FUNCTION_26_2();
}

void SiriMailModel.bcc.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_11_7();
  OUTLINED_FUNCTION_29_1((uint64_t)v1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_30_1(KeyPath);
  v3 = swift_getKeyPath();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_3_9(v3);
  OUTLINED_FUNCTION_12_1();
}

void property wrapper backing initializer of SiriMailModel.focusedField(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_60();
  sub_2468CCF9C(a1, v1);
  OUTLINED_FUNCTION_22_4();
  sub_2468986A8(&qword_2575E4C78, (uint64_t (*)(uint64_t))type metadata accessor for SiriMailModel, (uint64_t)&protocol conformance descriptor for SiriMailModel);
  sub_2468C0A84();
  sub_2468D5A64();
  OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_2_1();
}

uint64_t sub_2468CAFD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  sub_2468CCF9C(a1, a2);
  v3 = *MEMORY[0x24BE99A88];
  v4 = sub_2468D586C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(a2, v3, v4);
}

uint64_t SiriMailModel.focusedField.getter()
{
  return sub_2468CB264();
}

void SiriMailModel.focusedField.setter(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_2();
  swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_72_0(a1);
  OUTLINED_FUNCTION_10_3();
  sub_2468D5A94();
  OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_2_1();
}

void SiriMailModel.focusedField.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_11_7();
  OUTLINED_FUNCTION_29_1((uint64_t)v1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_30_1(KeyPath);
  v3 = swift_getKeyPath();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_3_9(v3);
  OUTLINED_FUNCTION_12_1();
}

void property wrapper backing initializer of SiriMailModel.state(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);

  v3 = OUTLINED_FUNCTION_27_1();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BE99C00];
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_7_3();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v1, a1, v3);
  OUTLINED_FUNCTION_22_4();
  sub_2468986A8(&qword_2575E4C78, (uint64_t (*)(uint64_t))type metadata accessor for SiriMailModel, (uint64_t)&protocol conformance descriptor for SiriMailModel);
  sub_2468986A8(&qword_2575E4E90, v4, MEMORY[0x24BE99C10]);
  sub_2468D5A64();
  v6 = OUTLINED_FUNCTION_19_1();
  v7(v6);
  OUTLINED_FUNCTION_21_2();
}

uint64_t sub_2468CB1E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_2468D5914();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  v5 = *MEMORY[0x24BE99AB0];
  v6 = sub_2468D586C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(a2, v5, v6);
}

uint64_t SiriMailModel.state.getter()
{
  return sub_2468CB264();
}

uint64_t sub_2468CB264()
{
  swift_getKeyPath();
  OUTLINED_FUNCTION_42_1();
  sub_2468D5A88();
  swift_release();
  return swift_release();
}

void sub_2468CB2BC()
{
  SiriMailModel.state.getter();
  OUTLINED_FUNCTION_3();
}

void sub_2468CB2D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = OUTLINED_FUNCTION_27_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_2();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v1, a1);
  SiriMailModel.state.setter(v1);
  OUTLINED_FUNCTION_12_1();
}

void SiriMailModel.state.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = OUTLINED_FUNCTION_27_1();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_60();
  swift_getKeyPath();
  swift_getKeyPath();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, a1, v3);
  OUTLINED_FUNCTION_10_3();
  sub_2468D5A94();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  OUTLINED_FUNCTION_21_2();
}

void SiriMailModel.state.modify()
{
  uint64_t v0;
  void *v1;
  uint64_t KeyPath;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_11_7();
  OUTLINED_FUNCTION_29_1((uint64_t)v1);
  KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_30_1(KeyPath);
  v3 = swift_getKeyPath();
  *(_QWORD *)(v0 + 48) = OUTLINED_FUNCTION_3_9(v3);
  OUTLINED_FUNCTION_12_1();
}

void sub_2468CB430(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_74_0();
  free(v1);
}

id SiriMailModel.snippetService.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_snippetService);
}

uint64_t SiriMailModel.subscription.getter()
{
  OUTLINED_FUNCTION_24();
  return swift_retain();
}

uint64_t SiriMailModel.subscription.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_subscription);
  OUTLINED_FUNCTION_24();
  *v3 = a1;
  return swift_release();
}

void SiriMailModel.subscription.modify()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3();
}

void SiriMailModel.toLabel.getter()
{
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailModel.ccLabel.getter()
{
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailModel.bccLabel.getter()
{
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

uint64_t SiriMailModel.subjectLabel.getter()
{
  return sub_2468CB754(&OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_subjectLabel);
}

uint64_t SiriMailModel.subjectLabel.setter(uint64_t a1, uint64_t a2)
{
  return sub_2468CB7AC(a1, a2, &OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_subjectLabel);
}

void SiriMailModel.subjectLabel.modify()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3();
}

uint64_t SiriMailModel.cancelLabel.getter()
{
  return sub_2468CB754(&OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_cancelLabel);
}

uint64_t SiriMailModel.cancelLabel.setter(uint64_t a1, uint64_t a2)
{
  return sub_2468CB7AC(a1, a2, &OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_cancelLabel);
}

void SiriMailModel.cancelLabel.modify()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3();
}

uint64_t SiriMailModel.cancelledLabel.getter()
{
  return sub_2468CB754(&OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_cancelledLabel);
}

uint64_t SiriMailModel.cancelledLabel.setter(uint64_t a1, uint64_t a2)
{
  return sub_2468CB7AC(a1, a2, &OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_cancelledLabel);
}

void SiriMailModel.cancelledLabel.modify()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3();
}

uint64_t SiriMailModel.sendLabel.getter()
{
  return sub_2468CB754(&OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_sendLabel);
}

uint64_t SiriMailModel.sendLabel.setter(uint64_t a1, uint64_t a2)
{
  return sub_2468CB7AC(a1, a2, &OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_sendLabel);
}

void SiriMailModel.sendLabel.modify()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3();
}

uint64_t SiriMailModel.sentLabel.getter()
{
  return sub_2468CB754(&OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_sentLabel);
}

uint64_t SiriMailModel.sentLabel.setter(uint64_t a1, uint64_t a2)
{
  return sub_2468CB7AC(a1, a2, &OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_sentLabel);
}

void SiriMailModel.sentLabel.modify()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3();
}

uint64_t SiriMailModel.messageLabel.getter()
{
  return sub_2468CB754(&OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_messageLabel);
}

uint64_t sub_2468CB754(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *a1);
  OUTLINED_FUNCTION_24();
  v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t SiriMailModel.messageLabel.setter(uint64_t a1, uint64_t a2)
{
  return sub_2468CB7AC(a1, a2, &OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_messageLabel);
}

uint64_t sub_2468CB7AC(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)(v3 + *a3);
  OUTLINED_FUNCTION_24();
  *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

void SiriMailModel.messageLabel.modify()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3();
}

void SiriMailModel.deleteLabel.getter()
{
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailModel.replyLabel.getter()
{
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailModel.nextLabel.getter()
{
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailModel.seeAllLabel.getter()
{
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailModel.moreInMailLabel.getter()
{
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void SiriMailModel.newMessageLabel.getter()
{
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void sub_2468CB910()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_37_1(v1, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_36_1(v3, v5);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_24();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_62();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  SiriMailModel.to.getter();
  SiriMailModel.cc.getter();
  SiriMailModel.bcc.getter();
  SiriMailModel.subject.getter();
  SiriMailModel.body.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2468D5A88();
  swift_release();
  swift_release();
  SiriMailModel.attachments.getter();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2468D5A88();
  swift_release();
  swift_release();
  sub_2468D5980();
  OUTLINED_FUNCTION_3_6();
}

void sub_2468CBE94(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_7_3();
  sub_2468D58E4();
  SiriMailModel.to.setter();
  sub_2468D58D8();
  SiriMailModel.cc.setter();
  sub_2468D58F0();
  SiriMailModel.bcc.setter();
  sub_2468D5920();
  SiriMailModel.state.setter(v1);
  sub_2468D5974();
  SiriMailModel.subject.setter();
  sub_2468D58FC();
  SiriMailModel.body.setter();
  sub_2468D58A8();
  SiriMailModel.focusedField.setter((uint64_t)v5);
  sub_2468D5878();
  SiriMailModel.attachments.setter();
  v7 = OUTLINED_FUNCTION_0_7();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
  OUTLINED_FUNCTION_2_1();
}

uint64_t SiriMailModel.init(message:)(uint64_t a1)
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void (*v47)(uint64_t, char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  void (*v61)(uint64_t, char *, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t);
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
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
  uint64_t v128;
  void (*v129)(char *, uint64_t);
  void (*v130)(uint64_t, char *, uint64_t);
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
  unint64_t v141;
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
  uint64_t v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  unint64_t v164;
  uint64_t v165;
  unint64_t v166;
  char v167[8];
  uint64_t v168;

  v2 = v1;
  v142 = a1;
  v3 = sub_2468D5A04();
  v147 = *(_QWORD *)(v3 - 8);
  v148 = v3;
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_14();
  v146 = v5;
  v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E54B0);
  v158 = *(_QWORD *)(v161 - 8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_37_1(v7, v128);
  v162 = OUTLINED_FUNCTION_27_1();
  v131 = *(_QWORD *)(v162 - 8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_3_2();
  v154 = v9;
  OUTLINED_FUNCTION_6_5();
  MEMORY[0x24BDAC7A8](v10);
  v156 = (char *)&v128 - v11;
  v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E54B8);
  v157 = *(_QWORD *)(v160 - 8);
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_36_1(v13, v128);
  v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_3_2();
  v153 = v15;
  OUTLINED_FUNCTION_6_5();
  MEMORY[0x24BDAC7A8](v16);
  v155 = (uint64_t)&v128 - v17;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E54C0);
  v151 = *(_QWORD *)(v18 - 8);
  v152 = v18;
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v128 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E54C8);
  v149 = *(_QWORD *)(v22 - 8);
  v150 = v22;
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_14();
  v145 = v24;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E54D0);
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)&v128 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = v2 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel__subject;
  v165 = 0;
  v166 = 0xE000000000000000;
  v30 = OUTLINED_FUNCTION_5_8();
  *(_QWORD *)(v30 + 16) = sub_2468CCC3C;
  *(_QWORD *)(v30 + 24) = 0;
  v31 = OUTLINED_FUNCTION_22_4();
  v32 = sub_2468986A8(&qword_2575E4C78, (uint64_t (*)(uint64_t))type metadata accessor for SiriMailModel, (uint64_t)&protocol conformance descriptor for SiriMailModel);
  OUTLINED_FUNCTION_69_0();
  v132 = v26;
  v33 = *(void (**)(uint64_t, char *, uint64_t))(v26 + 32);
  v137 = v29;
  v33(v29, v28, v25);
  v34 = v2 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel__body;
  v165 = 0;
  v166 = 0xE000000000000000;
  v35 = OUTLINED_FUNCTION_5_8();
  *(_QWORD *)(v35 + 16) = sub_2468CCD18;
  *(_QWORD *)(v35 + 24) = 0;
  sub_2468D5A64();
  v135 = v34;
  v143 = v25;
  v33(v34, v28, v25);
  v36 = v2 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel__attachments;
  v37 = MEMORY[0x24BEE4AF8];
  v165 = MEMORY[0x24BEE4AF8];
  v38 = OUTLINED_FUNCTION_5_8();
  *(_QWORD *)(v38 + 16) = sub_2468CCD74;
  *(_QWORD *)(v38 + 24) = 0;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5460);
  v40 = sub_2468CCDB0();
  v41 = v145;
  v133 = v39;
  OUTLINED_FUNCTION_75_0((uint64_t)&v165, (uint64_t)sub_2468CE320, v38, v31, v39, v32, v40);
  v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v149 + 32);
  v139 = v36;
  v42(v36, v41, v150);
  v43 = v2 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel__to;
  v165 = v37;
  v44 = OUTLINED_FUNCTION_5_8();
  *(_QWORD *)(v44 + 16) = sub_2468CCE54;
  *(_QWORD *)(v44 + 24) = 0;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4D40);
  v46 = sub_2468CCE70();
  OUTLINED_FUNCTION_40_1();
  v47 = *(void (**)(uint64_t, char *, uint64_t))(v151 + 32);
  v138 = v43;
  v47(v43, v21, v152);
  v165 = v37;
  v48 = OUTLINED_FUNCTION_5_8();
  *(_QWORD *)(v48 + 16) = sub_2468CCF14;
  *(_QWORD *)(v48 + 24) = 0;
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_43_0((uint64_t)v167);
  v165 = v37;
  v49 = OUTLINED_FUNCTION_5_8();
  *(_QWORD *)(v49 + 16) = sub_2468CCF58;
  *(_QWORD *)(v49 + 24) = 0;
  v145 = v45;
  v141 = v46;
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_43_0((uint64_t)&v168);
  v50 = v2 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel__focusedField;
  v51 = sub_2468D5908();
  v52 = v155;
  __swift_storeEnumTagSinglePayload(v155, 1, 1, v51);
  v53 = v153;
  sub_2468CCF9C(v52, v153);
  v54 = sub_2468C0A84();
  v55 = v136;
  OUTLINED_FUNCTION_75_0(v53, (uint64_t)sub_2468CCFE4, 0, v31, v159, v32, v54);
  sub_2468CCFE8(v52);
  v56 = *(void (**)(uint64_t, uint64_t, uint64_t))(v157 + 32);
  v144 = v50;
  v56(v50, v55, v160);
  v57 = v2 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel__state;
  v58 = v131;
  v59 = v156;
  v60 = v162;
  (*(void (**)(char *, _QWORD, uint64_t))(v131 + 104))(v156, *MEMORY[0x24BE99BD8], v162);
  v61 = *(void (**)(uint64_t, char *, uint64_t))(v58 + 16);
  v62 = v58;
  v63 = v154;
  v64 = v60;
  v130 = v61;
  v61(v154, v59, v60);
  v65 = sub_2468986A8(&qword_2575E4E90, (uint64_t (*)(uint64_t))MEMORY[0x24BE99C00], MEMORY[0x24BE99C10]);
  v66 = v140;
  v134 = v31;
  v136 = v32;
  OUTLINED_FUNCTION_75_0(v63, (uint64_t)sub_2468CD048, 0, v31, v64, v32, v65);
  v129 = *(void (**)(char *, uint64_t))(v62 + 8);
  v129(v59, v64);
  v67 = *(void (**)(uint64_t, uint64_t, uint64_t))(v158 + 32);
  v131 = v57;
  v67(v57, v66, v161);
  v68 = OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_snippetService;
  sub_2468D5A34();
  if (qword_2575E3830 != -1)
    swift_once();
  v69 = v148;
  v70 = __swift_project_value_buffer(v148, (uint64_t)static ServiceName.mail);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v147 + 16))(v146, v70, v69);
  *(_QWORD *)(v2 + v68) = sub_2468D5A28();
  *(_QWORD *)(v2 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_subscription) = 0;
  v71 = v142;
  v72 = sub_2468D5974();
  if (v73)
    v74 = v72;
  else
    v74 = 0;
  v75 = 0xE000000000000000;
  if (v73)
    v76 = v73;
  else
    v76 = 0xE000000000000000;
  v77 = v137;
  OUTLINED_FUNCTION_1_6();
  v78 = *(void (**)(uint64_t, uint64_t))(v132 + 8);
  v78(v77, v143);
  v163 = v74;
  v164 = v76;
  v79 = OUTLINED_FUNCTION_5_8();
  *(_QWORD *)(v79 + 16) = sub_2468CCC3C;
  *(_QWORD *)(v79 + 24) = 0;
  sub_2468D5A64();
  OUTLINED_FUNCTION_24_3();
  v80 = sub_2468D58FC();
  if (v81)
    v82 = v80;
  else
    v82 = 0;
  if (v81)
    v75 = v81;
  OUTLINED_FUNCTION_1_6();
  v83 = OUTLINED_FUNCTION_73_0();
  ((void (*)(uint64_t))v78)(v83);
  v163 = v82;
  v164 = v75;
  v84 = OUTLINED_FUNCTION_5_8();
  *(_QWORD *)(v84 + 16) = sub_2468CCD18;
  *(_QWORD *)(v84 + 24) = 0;
  sub_2468D5A64();
  OUTLINED_FUNCTION_24_3();
  sub_2468D5878();
  OUTLINED_FUNCTION_70_0();
  v85 = v139;
  OUTLINED_FUNCTION_1_6();
  (*(void (**)(uint64_t, uint64_t))(v149 + 8))(v85, v150);
  v163 = v71;
  v86 = OUTLINED_FUNCTION_5_8();
  *(_QWORD *)(v86 + 16) = sub_2468CCD74;
  *(_QWORD *)(v86 + 24) = 0;
  OUTLINED_FUNCTION_67_0();
  OUTLINED_FUNCTION_24_3();
  sub_2468D58E4();
  OUTLINED_FUNCTION_70_0();
  v87 = v138;
  OUTLINED_FUNCTION_1_6();
  (*(void (**)(uint64_t, uint64_t))(v151 + 8))(v87, v152);
  v163 = v71;
  v88 = OUTLINED_FUNCTION_5_8();
  *(_QWORD *)(v88 + 16) = sub_2468CCE54;
  *(_QWORD *)(v88 + 24) = 0;
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_24_3();
  sub_2468D58D8();
  OUTLINED_FUNCTION_70_0();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_60_0();
  v163 = v71;
  v89 = OUTLINED_FUNCTION_5_8();
  *(_QWORD *)(v89 + 16) = sub_2468CCF14;
  *(_QWORD *)(v89 + 24) = 0;
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_24_3();
  sub_2468D58F0();
  OUTLINED_FUNCTION_70_0();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_60_0();
  v163 = v71;
  v90 = OUTLINED_FUNCTION_5_8();
  *(_QWORD *)(v90 + 16) = sub_2468CCF58;
  *(_QWORD *)(v90 + 24) = 0;
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_24_3();
  v91 = v156;
  sub_2468D5920();
  v92 = v131;
  OUTLINED_FUNCTION_1_6();
  (*(void (**)(uint64_t, uint64_t))(v158 + 8))(v92, v161);
  v93 = v162;
  v130(v154, v91, v162);
  OUTLINED_FUNCTION_67_0();
  v129(v91, v93);
  OUTLINED_FUNCTION_24_3();
  v94 = v155;
  sub_2468D58A8();
  v95 = v144;
  OUTLINED_FUNCTION_1_6();
  (*(void (**)(uint64_t, uint64_t))(v157 + 8))(v95, v160);
  sub_2468CCF9C(v94, v153);
  OUTLINED_FUNCTION_67_0();
  sub_2468CCFE8(v94);
  OUTLINED_FUNCTION_24_3();
  v96 = sub_2468D598C();
  OUTLINED_FUNCTION_14_6(v96, v97, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_toLabel);
  v98 = sub_2468D5968();
  OUTLINED_FUNCTION_14_6(v98, v99, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_ccLabel);
  v100 = sub_2468D5998();
  OUTLINED_FUNCTION_14_6(v100, v101, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_bccLabel);
  v102 = sub_2468D58C0();
  OUTLINED_FUNCTION_14_6(v102, v103, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_subjectLabel);
  v104 = sub_2468D5884();
  OUTLINED_FUNCTION_14_6(v104, v105, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_cancelLabel);
  v106 = sub_2468D58CC();
  OUTLINED_FUNCTION_14_6(v106, v107, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_cancelledLabel);
  v108 = sub_2468D59B0();
  OUTLINED_FUNCTION_14_6(v108, v109, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_sendLabel);
  v110 = sub_2468D59BC();
  OUTLINED_FUNCTION_14_6(v110, v111, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_sentLabel);
  v112 = sub_2468D58B4();
  OUTLINED_FUNCTION_14_6(v112, v113, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_messageLabel);
  v114 = sub_2468D5890();
  OUTLINED_FUNCTION_14_6(v114, v115, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_deleteLabel);
  v116 = sub_2468D5860();
  OUTLINED_FUNCTION_14_6(v116, v117, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_replyLabel);
  v118 = sub_2468D59A4();
  OUTLINED_FUNCTION_14_6(v118, v119, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_nextLabel);
  v120 = sub_2468D589C();
  OUTLINED_FUNCTION_14_6(v120, v121, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_seeAllLabel);
  v122 = sub_2468D5854();
  OUTLINED_FUNCTION_14_6(v122, v123, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_moreInMailLabel);
  v124 = sub_2468D5848();
  OUTLINED_FUNCTION_14_6(v124, v125, OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_newMessageLabel);
  swift_allocObject();
  swift_weakInit();
  sub_2468D5A4C();
  swift_release();
  v126 = OUTLINED_FUNCTION_0_7();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v126 - 8) + 8))(v71, v126);
  return v2;
}

uint64_t sub_2468CCC3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_2468CA968(a1, a2, a3);
}

uint64_t sub_2468CCC58()
{
  swift_release();
  return swift_deallocObject();
}

void sub_2468CCC7C(_QWORD *a1)
{
  uint64_t v1;

  (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*a1, a1[1]);
  OUTLINED_FUNCTION_3();
}

uint64_t type metadata accessor for SiriMailModel()
{
  uint64_t result;

  result = qword_2575E5508;
  if (!qword_2575E5508)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2468CCCD8(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = SiriMailModel.subject.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_3();
}

void sub_2468CCCFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2468CA754(a1, a2, a3, a4, (void (*)(uint64_t))SiriMailModel.subject.setter);
}

uint64_t sub_2468CCD18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_2468CA968(a1, a2, a3);
}

void sub_2468CCD34(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = SiriMailModel.body.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_3();
}

void sub_2468CCD58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2468CA754(a1, a2, a3, a4, (void (*)(uint64_t))SiriMailModel.body.setter);
}

uint64_t sub_2468CCD74@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2468CADD4(a1, a2);
}

void sub_2468CCD90(_QWORD *a1)
{
  uint64_t v1;

  (*(void (**)(_QWORD))(v1 + 16))(*a1);
  OUTLINED_FUNCTION_3();
}

unint64_t sub_2468CCDB0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2575E5468;
  if (!qword_2575E5468)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E5460);
    v2 = sub_2468986A8(&qword_2575E5470, MEMORY[0x24BE99A58], MEMORY[0x24BE99A68]);
    result = MEMORY[0x249562024](MEMORY[0x24BEE12C0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2575E5468);
  }
  return result;
}

void sub_2468CCE2C(uint64_t *a1@<X8>)
{
  *a1 = SiriMailModel.attachments.getter();
  OUTLINED_FUNCTION_3();
}

uint64_t sub_2468CCE54@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2468CADD4(a1, a2);
}

unint64_t sub_2468CCE70()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2575E5480;
  if (!qword_2575E5480)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E4D40);
    v2 = sub_2468986A8(&qword_2575E4770, (uint64_t (*)(uint64_t))MEMORY[0x24BE99C60], MEMORY[0x24BE99C78]);
    result = MEMORY[0x249562024](MEMORY[0x24BEE12C0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2575E5480);
  }
  return result;
}

void sub_2468CCEEC(uint64_t *a1@<X8>)
{
  *a1 = SiriMailModel.to.getter();
  OUTLINED_FUNCTION_3();
}

uint64_t sub_2468CCF14@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2468CADD4(a1, a2);
}

void sub_2468CCF30(uint64_t *a1@<X8>)
{
  *a1 = SiriMailModel.cc.getter();
  OUTLINED_FUNCTION_3();
}

uint64_t sub_2468CCF58@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2468CADD4(a1, a2);
}

void sub_2468CCF74(uint64_t *a1@<X8>)
{
  *a1 = SiriMailModel.bcc.getter();
  OUTLINED_FUNCTION_3();
}

uint64_t sub_2468CCF9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2468CCFE8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2468CD028()
{
  SiriMailModel.focusedField.getter();
  OUTLINED_FUNCTION_3();
}

void sub_2468CD04C()
{
  SiriMailModel.state.getter();
  OUTLINED_FUNCTION_3();
}

uint64_t sub_2468CD06C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2468CD090(uint64_t a1)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_2468CD310(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_2468CD0EC(uint64_t a1)
{
  return sub_2468CD090(a1);
}

void SiriMailModel.post(action:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;

  OUTLINED_FUNCTION_50_0();
  OUTLINED_FUNCTION_66_0();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2468D592C();
  v5 = OUTLINED_FUNCTION_73_0();
  v6(v5);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BE99AB8], v0);
  OUTLINED_FUNCTION_22_4();
  sub_2468986A8(&qword_2575E4C78, (uint64_t (*)(uint64_t))type metadata accessor for SiriMailModel, (uint64_t)&protocol conformance descriptor for SiriMailModel);
  OUTLINED_FUNCTION_73_0();
  sub_2468D5A58();
  OUTLINED_FUNCTION_56_0();
  OUTLINED_FUNCTION_21_2();
}

void sub_2468CD310(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  os_log_type_t isCancelled;
  void (**v4)(uint64_t, uint64_t);
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
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  _QWORD *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t *v39;
  int v40;
  uint64_t v41;
  void (**v42)(uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  _QWORD v59[2];
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (**v65)(uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  void (*v69)(char *, uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73[3];

  v5 = v2;
  v70 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_3_2();
  v63 = v7;
  OUTLINED_FUNCTION_6_5();
  MEMORY[0x24BDAC7A8](v8);
  v64 = (uint64_t)v59 - v9;
  v10 = OUTLINED_FUNCTION_27_1();
  v61 = *(_QWORD *)(v10 - 8);
  v62 = v10;
  OUTLINED_FUNCTION_0_3();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_3_2();
  v60 = v12;
  OUTLINED_FUNCTION_6_5();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v59 - v14;
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_66_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_14();
  v67 = v17;
  v18 = OUTLINED_FUNCTION_50_0();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_3_2();
  v68 = v20;
  OUTLINED_FUNCTION_6_5();
  v22 = MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)v59 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)v59 - v25;
  v27 = (_QWORD *)(v2 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_subscription);
  OUTLINED_FUNCTION_24();
  if (*v27)
  {
    OUTLINED_FUNCTION_10_3();
    isCancelled = swift_task_isCancelled();
    OUTLINED_FUNCTION_34();
    if ((isCancelled & 1) != 0)
    {
      if (qword_2575E3828 != -1)
        swift_once();
      v28 = OUTLINED_FUNCTION_0_8();
      __swift_project_value_buffer(v28, (uint64_t)static Logger.siriMail);
      v29 = sub_2468D5AB8();
      v30 = sub_2468D6520();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = (uint8_t *)OUTLINED_FUNCTION_31_0();
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_246894000, v29, v30, "Skipping update since this SiriMailModel has been cancelled", v31, 2u);
        OUTLINED_FUNCTION_21_0();
      }

      goto LABEL_30;
    }
  }
  if (qword_2575E3828 != -1)
    swift_once();
  v65 = v4;
  v66 = v1;
  v32 = OUTLINED_FUNCTION_0_8();
  __swift_project_value_buffer(v32, (uint64_t)static Logger.siriMail);
  v69 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v69(v26, v70, v18);
  v33 = sub_2468D5AB8();
  v34 = sub_2468D6520();
  if (OUTLINED_FUNCTION_48_0(v34))
  {
    v35 = (uint8_t *)OUTLINED_FUNCTION_31_0();
    v36 = OUTLINED_FUNCTION_31_0();
    v59[1] = v5;
    v73[0] = v36;
    v59[0] = v15;
    *(_DWORD *)v35 = 136315138;
    v69(v24, (uint64_t)v26, v18);
    v37 = sub_2468D6490();
    v71 = sub_2468C21E8(v37, v38, v73);
    sub_2468D658C();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_57_0();
    OUTLINED_FUNCTION_63_0(&dword_246894000, v33, isCancelled, "Got change: %s", v35);
    OUTLINED_FUNCTION_52_0();
    OUTLINED_FUNCTION_21_0();
  }
  OUTLINED_FUNCTION_57_0();

  OUTLINED_FUNCTION_22_4();
  sub_2468986A8(&qword_2575E4C28, (uint64_t (*)(uint64_t))type metadata accessor for SiriMailModel, (uint64_t)&protocol conformance descriptor for SiriMailModel);
  sub_2468D5AF4();
  sub_2468D5B00();
  OUTLINED_FUNCTION_34();
  v39 = v68;
  v69((char *)v68, v70, v18);
  v40 = (*(uint64_t (**)(uint64_t *, uint64_t))(v19 + 88))(v39, v18);
  if (v40 == *MEMORY[0x24BE99A80])
  {
    OUTLINED_FUNCTION_6_10();
    v42 = v65;
    v41 = v66;
    v43 = v67;
    ((void (*)(uint64_t, uint64_t *, uint64_t))v65[4])(v67, v39, v66);
    v44 = sub_2468D5974();
    if (v45)
      v46 = v44;
    else
      v46 = 0;
    if (v45)
      v47 = v45;
    else
      v47 = 0xE000000000000000;
    v71 = v46;
    v72 = v47;
    OUTLINED_FUNCTION_0_9();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E54D0);
    OUTLINED_FUNCTION_76_0();
    OUTLINED_FUNCTION_17_5();
    v48 = sub_2468D58FC();
    if (v49)
      v50 = v48;
    else
      v50 = 0;
    if (v49)
      v51 = v49;
    else
      v51 = 0xE000000000000000;
    v71 = v50;
    v72 = v51;
    OUTLINED_FUNCTION_0_9();
    OUTLINED_FUNCTION_76_0();
    OUTLINED_FUNCTION_17_5();
    v71 = sub_2468D58E4();
    OUTLINED_FUNCTION_0_9();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E54C0);
    OUTLINED_FUNCTION_47_0();
    OUTLINED_FUNCTION_17_5();
    v71 = sub_2468D58D8();
    OUTLINED_FUNCTION_0_9();
    OUTLINED_FUNCTION_47_0();
    OUTLINED_FUNCTION_17_5();
    v71 = sub_2468D58F0();
    OUTLINED_FUNCTION_0_9();
    OUTLINED_FUNCTION_47_0();
    OUTLINED_FUNCTION_17_5();
    v71 = sub_2468D5878();
    OUTLINED_FUNCTION_0_9();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E54C8);
    OUTLINED_FUNCTION_58_0();
    OUTLINED_FUNCTION_17_5();
    sub_2468D5920();
    OUTLINED_FUNCTION_0_9();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E54B0);
    sub_2468D5A70();
    OUTLINED_FUNCTION_17_5();
    v42[1](v43, v41);
    goto LABEL_30;
  }
  if (v40 == *MEMORY[0x24BE99AC0] || v40 == *MEMORY[0x24BE99AA8])
  {
    OUTLINED_FUNCTION_6_10();
    v52 = v39[1];
    v71 = *v39;
    v72 = v52;
    OUTLINED_FUNCTION_0_9();
    v53 = &qword_2575E54D0;
LABEL_29:
    __swift_instantiateConcreteTypeFromMangledName(v53);
    OUTLINED_FUNCTION_58_0();
    OUTLINED_FUNCTION_17_5();
LABEL_30:
    OUTLINED_FUNCTION_3_6();
    return;
  }
  if (v40 == *MEMORY[0x24BE99A78])
  {
    OUTLINED_FUNCTION_6_10();
    OUTLINED_FUNCTION_71_0();
    OUTLINED_FUNCTION_0_9();
    v53 = &qword_2575E54C8;
    goto LABEL_29;
  }
  if (v40 == *MEMORY[0x24BE99A98] || v40 == *MEMORY[0x24BE99A90] || v40 == *MEMORY[0x24BE99AA0])
  {
    OUTLINED_FUNCTION_6_10();
    OUTLINED_FUNCTION_71_0();
    OUTLINED_FUNCTION_0_9();
    v53 = &qword_2575E54C0;
    goto LABEL_29;
  }
  if (v40 == *MEMORY[0x24BE99A88])
  {
    OUTLINED_FUNCTION_6_10();
    v54 = (uint64_t)v39;
    v55 = v64;
    sub_2468CE2D8(v54, v64);
    OUTLINED_FUNCTION_72_0(v55);
    OUTLINED_FUNCTION_0_9();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E54B8);
    sub_2468D5A70();
    OUTLINED_FUNCTION_17_5();
    OUTLINED_FUNCTION_65_0();
    goto LABEL_30;
  }
  if (v40 == *MEMORY[0x24BE99AB8])
  {
    ((void (*)(uint64_t *, uint64_t))v4)(v39, v18);
    goto LABEL_30;
  }
  if (v40 == *MEMORY[0x24BE99AB0])
  {
    OUTLINED_FUNCTION_6_10();
    v56 = v61;
    v57 = v39;
    v58 = v62;
    (*(void (**)(char *, uint64_t *, uint64_t))(v61 + 32))(v15, v57, v62);
    (*(void (**)(uint64_t, char *, uint64_t))(v56 + 16))(v60, v15, v58);
    OUTLINED_FUNCTION_0_9();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575E54B0);
    sub_2468D5A70();
    OUTLINED_FUNCTION_17_5();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v15, v58);
    goto LABEL_30;
  }
  sub_2468D6778();
  __break(1u);
}

uint64_t SiriMailModel.deinit()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v2 = v0;
  if (qword_2575E3828 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_0_8();
  __swift_project_value_buffer(v3, (uint64_t)static Logger.siriMail);
  swift_retain_n();
  v4 = sub_2468D5AB8();
  v5 = sub_2468D6520();
  if (OUTLINED_FUNCTION_48_0(v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_31_0();
    v15 = OUTLINED_FUNCTION_31_0();
    *(_DWORD *)v6 = 136315138;
    v7 = sub_2468D6490();
    sub_2468C21E8(v7, v8, &v15);
    sub_2468D658C();
    OUTLINED_FUNCTION_64_0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_63_0(&dword_246894000, v4, v1, "SiriMailModel.deinit on instance %s", v6);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_21_0();
  }

  OUTLINED_FUNCTION_64_0();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E54D0);
  OUTLINED_FUNCTION_33_1(v9);
  OUTLINED_FUNCTION_41_1(OBJC_IVAR____TtC10SiriMailUI13SiriMailModel__body);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E54C8);
  OUTLINED_FUNCTION_18_6(v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E54C0);
  OUTLINED_FUNCTION_33_1(v11);
  OUTLINED_FUNCTION_41_1(OBJC_IVAR____TtC10SiriMailUI13SiriMailModel__cc);
  OUTLINED_FUNCTION_41_1(OBJC_IVAR____TtC10SiriMailUI13SiriMailModel__bcc);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E54B8);
  OUTLINED_FUNCTION_18_6(v12);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E54B0);
  OUTLINED_FUNCTION_18_6(v13);

  swift_release();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_4_10();
  return v2;
}

uint64_t SiriMailModel.__deallocating_deinit()
{
  SiriMailModel.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2468CDDB0()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_2468CDDF8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_subscription);
  swift_beginAccess();
  *v3 = a1;
  return swift_release();
}

uint64_t (*sub_2468CDE48())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_2468CDE8C()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC10SiriMailUI13SiriMailModel_snippetService);
}

uint64_t sub_2468CDE9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for SiriMailModel();
  result = sub_2468D5AF4();
  *a1 = result;
  return result;
}

uint64_t sub_2468CDED8()
{
  return sub_2468986A8(&qword_2575E4C28, (uint64_t (*)(uint64_t))type metadata accessor for SiriMailModel, (uint64_t)&protocol conformance descriptor for SiriMailModel);
}

uint64_t sub_2468CDF04()
{
  return sub_2468986A8(&qword_2575E54D8, (uint64_t (*)(uint64_t))MEMORY[0x24BE99AC8], MEMORY[0x24BE99AE0]);
}

uint64_t sub_2468CDF30()
{
  return sub_2468986A8(&qword_2575E3D50, (uint64_t (*)(uint64_t))MEMORY[0x24BE99AC8], MEMORY[0x24BE99AD8]);
}

uint64_t sub_2468CDF5C()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t OUTLINED_FUNCTION_22_4()
{
  return type metadata accessor for SiriMailModel();
}

void sub_2468CDF70()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_2468CE0D0();
  if (v0 <= 0x3F)
  {
    sub_2468CE164(319, &qword_2575E5520, &qword_2575E5460, (void (*)(void))sub_2468CCDB0);
    if (v1 <= 0x3F)
    {
      sub_2468CE164(319, &qword_2575E5528, &qword_2575E4D40, (void (*)(void))sub_2468CCE70);
      if (v2 <= 0x3F)
      {
        sub_2468CE164(319, &qword_2575E5530, &qword_2575E4B10, (void (*)(void))sub_2468C0A84);
        if (v3 <= 0x3F)
        {
          sub_2468CE210();
          if (v4 <= 0x3F)
            swift_updateClassMetadata2();
        }
      }
    }
  }
}

void sub_2468CE0D0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2575E5518)
  {
    type metadata accessor for SiriMailModel();
    sub_2468986A8(&qword_2575E4C78, (uint64_t (*)(uint64_t))type metadata accessor for SiriMailModel, (uint64_t)&protocol conformance descriptor for SiriMailModel);
    v0 = sub_2468D5AA0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2575E5518);
  }
}

void sub_2468CE164(uint64_t a1, unint64_t *a2, uint64_t *a3, void (*a4)(void))
{
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    type metadata accessor for SiriMailModel();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    sub_2468986A8(&qword_2575E4C78, (uint64_t (*)(uint64_t))type metadata accessor for SiriMailModel, (uint64_t)&protocol conformance descriptor for SiriMailModel);
    a4();
    v7 = sub_2468D5AA0();
    if (!v8)
      atomic_store(v7, a2);
  }
}

void sub_2468CE210()
{
  uint64_t (*v0)(uint64_t);
  unint64_t v1;
  uint64_t v2;

  if (!qword_2575E5538[0])
  {
    type metadata accessor for SiriMailModel();
    sub_2468D5914();
    v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BE99C00];
    sub_2468986A8(&qword_2575E4C78, (uint64_t (*)(uint64_t))type metadata accessor for SiriMailModel, (uint64_t)&protocol conformance descriptor for SiriMailModel);
    sub_2468986A8(&qword_2575E4E90, v0, MEMORY[0x24BE99C10]);
    v1 = sub_2468D5AA0();
    if (!v2)
      atomic_store(v1, qword_2575E5538);
  }
}

uint64_t sub_2468CE2D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_9()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_9(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = a1;
  return sub_2468D5A7C();
}

uint64_t OUTLINED_FUNCTION_4_10()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5_8()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_6_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 96))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_7_8()
{
  return swift_bridgeObjectRetain();
}

void *OUTLINED_FUNCTION_11_7()
{
  return malloc(0x38uLL);
}

uint64_t OUTLINED_FUNCTION_14_6@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  _QWORD *v4;

  v4 = (_QWORD *)(v3 + a3);
  *v4 = result;
  v4[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_17_5()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_18_6(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_24_3()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return sub_2468D5914();
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  return sub_2468D5A64();
}

uint64_t OUTLINED_FUNCTION_29_1(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_30_1(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_32_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 104))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_33_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

void OUTLINED_FUNCTION_36_1(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 368) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_37_1(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 328) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_39_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_40_1()
{
  return sub_2468D5A64();
}

uint64_t OUTLINED_FUNCTION_41_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);

  return v3(v1 + a1, v2);
}

uint64_t OUTLINED_FUNCTION_42_1()
{
  return swift_getKeyPath();
}

uint64_t OUTLINED_FUNCTION_43_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(a1 - 256) = v3;
  return v2(v3, v1, v4);
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return sub_2468D5A70();
}

BOOL OUTLINED_FUNCTION_48_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_50_0()
{
  return sub_2468D586C();
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_53_0()
{
  return sub_2468D5A88();
}

uint64_t OUTLINED_FUNCTION_56_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_57_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_58_0()
{
  return sub_2468D5A70();
}

uint64_t OUTLINED_FUNCTION_60_0()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_62()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_63_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_64_0()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_65_0()
{
  uint64_t v0;

  return sub_2468CCFE8(v0);
}

uint64_t OUTLINED_FUNCTION_67_0()
{
  return sub_2468D5A64();
}

uint64_t OUTLINED_FUNCTION_69_0()
{
  return sub_2468D5A64();
}

void OUTLINED_FUNCTION_71_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 152) = *v0;
}

uint64_t OUTLINED_FUNCTION_72_0(uint64_t a1)
{
  uint64_t v1;

  return sub_2468CCF9C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_73_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_74_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_75_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  *(_QWORD *)(v7 - 256) = a7;
  return sub_2468D5A64();
}

uint64_t OUTLINED_FUNCTION_76_0()
{
  return sub_2468D5A70();
}

uint64_t *sub_2468CE680(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t *v8;
  unint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v8 = a2 + 1;
    v9 = a2[2];
    swift_bridgeObjectRetain();
    if (v9 >= 6)
    {
      a1[1] = *v8;
      a1[2] = v9;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_OWORD *)(a1 + 1) = *(_OWORD *)v8;
    }
    v10 = (int *)type metadata accessor for WidgetMailbox();
    v11 = v10[6];
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_2468D568C();
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
    }
    v16 = v10[7];
    v17 = (uint64_t *)((char *)a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v20 = v10[8];
    v21 = (uint64_t *)((char *)a1 + v20);
    v22 = (uint64_t *)((char *)a2 + v20);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    v24 = v10[9];
    v25 = (uint64_t *)((char *)a1 + v24);
    v26 = (uint64_t *)((char *)a2 + v24);
    v27 = v26[1];
    *v25 = *v26;
    v25[1] = v27;
    v28 = v10[10];
    v29 = (uint64_t *)((char *)a1 + v28);
    v30 = (uint64_t *)((char *)a2 + v28);
    v31 = v30[1];
    *v29 = *v30;
    v29[1] = v31;
    v32 = v10[11];
    v33 = (uint64_t *)((char *)a1 + v32);
    v34 = (uint64_t *)((char *)a2 + v32);
    v35 = v34[1];
    *v33 = *v34;
    v33[1] = v35;
    v36 = v10[12];
    v37 = (uint64_t *)((char *)a1 + v36);
    v38 = (uint64_t *)((char *)a2 + v36);
    v39 = v38[1];
    *v37 = *v38;
    v37[1] = v39;
    v40 = *(int *)(a3 + 20);
    v41 = (char *)a1 + v40;
    v42 = (char *)a2 + v40;
    v43 = *(uint64_t *)((char *)a2 + v40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v43 >= 2)
    {
      v44 = *((_QWORD *)v42 + 1);
      *(_QWORD *)v41 = v43;
      *((_QWORD *)v41 + 1) = v44;
      *((_WORD *)v41 + 8) = *((_WORD *)v42 + 8);
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_OWORD *)v41 = *(_OWORD *)v42;
      *((_WORD *)v41 + 8) = *((_WORD *)v42 + 8);
    }
  }
  return a1;
}

unint64_t sub_2468CE898(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t result;

  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 16) >= 6uLL)
    swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(type metadata accessor for WidgetMailbox() + 24);
  v5 = sub_2468D568C();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = *(_QWORD *)(a1 + *(int *)(a2 + 20));
  if (result >= 2)
    return swift_bridgeObjectRelease();
  return result;
}

_QWORD *sub_2468CE9AC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v6;
  unint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  unint64_t v41;
  uint64_t v42;

  *a1 = *a2;
  v6 = a2 + 1;
  v7 = a2[2];
  swift_bridgeObjectRetain();
  if (v7 >= 6)
  {
    a1[1] = *v6;
    a1[2] = v7;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *(_OWORD *)v6;
  }
  v8 = (int *)type metadata accessor for WidgetMailbox();
  v9 = v8[6];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_2468D568C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  }
  v14 = v8[7];
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  v18 = v8[8];
  v19 = (_QWORD *)((char *)a1 + v18);
  v20 = (_QWORD *)((char *)a2 + v18);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  v22 = v8[9];
  v23 = (_QWORD *)((char *)a1 + v22);
  v24 = (_QWORD *)((char *)a2 + v22);
  v25 = v24[1];
  *v23 = *v24;
  v23[1] = v25;
  v26 = v8[10];
  v27 = (_QWORD *)((char *)a1 + v26);
  v28 = (_QWORD *)((char *)a2 + v26);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  v30 = v8[11];
  v31 = (_QWORD *)((char *)a1 + v30);
  v32 = (_QWORD *)((char *)a2 + v30);
  v33 = v32[1];
  *v31 = *v32;
  v31[1] = v33;
  v34 = v8[12];
  v35 = (_QWORD *)((char *)a1 + v34);
  v36 = (_QWORD *)((char *)a2 + v34);
  v37 = v36[1];
  *v35 = *v36;
  v35[1] = v37;
  v38 = *(int *)(a3 + 20);
  v39 = (char *)a1 + v38;
  v40 = (char *)a2 + v38;
  v41 = *(_QWORD *)((char *)a2 + v38);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v41 >= 2)
  {
    v42 = *((_QWORD *)v40 + 1);
    *(_QWORD *)v39 = v41;
    *((_QWORD *)v39 + 1) = v42;
    *((_WORD *)v39 + 8) = *((_WORD *)v40 + 8);
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)v39 = *(_OWORD *)v40;
    *((_WORD *)v39 + 8) = *((_WORD *)v40 + 8);
  }
  return a1;
}

_QWORD *sub_2468CEBA0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int EnumTagSinglePayload;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  unint64_t v37;
  __int128 v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a2[2];
  if (a1[2] < 6uLL)
  {
    if (v6 >= 6)
    {
      a1[1] = a2[1];
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v6 < 6)
  {
    sub_2468CEEF8((uint64_t)(a1 + 1), &qword_2575E4128);
LABEL_6:
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
    goto LABEL_8;
  }
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  v7 = (int *)type metadata accessor for WidgetMailbox();
  v8 = v7[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_2468D568C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11);
  v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11);
  if (EnumTagSinglePayload)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v14 = *(_QWORD *)(v11 - 8);
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
LABEL_13:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v9, v10, v11);
LABEL_14:
  v16 = v7[7];
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = v7[8];
  v20 = (_QWORD *)((char *)a1 + v19);
  v21 = (_QWORD *)((char *)a2 + v19);
  *v20 = *v21;
  v20[1] = v21[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v22 = v7[9];
  v23 = (_QWORD *)((char *)a1 + v22);
  v24 = (_QWORD *)((char *)a2 + v22);
  *v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v25 = v7[10];
  v26 = (_QWORD *)((char *)a1 + v25);
  v27 = (_QWORD *)((char *)a2 + v25);
  *v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v28 = v7[11];
  v29 = (_QWORD *)((char *)a1 + v28);
  v30 = (_QWORD *)((char *)a2 + v28);
  *v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v31 = v7[12];
  v32 = (_QWORD *)((char *)a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  *v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = *(int *)(a3 + 20);
  v35 = (char *)a1 + v34;
  v36 = (char *)a2 + v34;
  v37 = *(_QWORD *)((char *)a2 + v34);
  if (*(_QWORD *)((char *)a1 + v34) >= 2uLL)
  {
    if (v37 >= 2)
    {
      *(_QWORD *)v35 = v37;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v41 = *((_QWORD *)v36 + 1);
      v35[16] = v36[16];
      *((_QWORD *)v35 + 1) = v41;
      v35[17] = v36[17];
    }
    else
    {
      sub_2468CEEF8((uint64_t)a1 + v34, qword_2575E4130);
      v39 = *((_WORD *)v36 + 8);
      *(_OWORD *)v35 = *(_OWORD *)v36;
      *((_WORD *)v35 + 8) = v39;
    }
  }
  else if (v37 >= 2)
  {
    *(_QWORD *)v35 = v37;
    v40 = *((_QWORD *)v36 + 1);
    v35[16] = v36[16];
    *((_QWORD *)v35 + 1) = v40;
    v35[17] = v36[17];
    swift_bridgeObjectRetain();
  }
  else
  {
    v38 = *(_OWORD *)v36;
    *((_WORD *)v35 + 8) = *((_WORD *)v36 + 8);
    *(_OWORD *)v35 = v38;
  }
  return a1;
}

uint64_t sub_2468CEEF8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2468CEF34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = (int *)type metadata accessor for WidgetMailbox();
  v7 = v6[6];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_2468D568C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  *(_OWORD *)(a1 + v6[7]) = *(_OWORD *)(a2 + v6[7]);
  *(_OWORD *)(a1 + v6[8]) = *(_OWORD *)(a2 + v6[8]);
  *(_OWORD *)(a1 + v6[9]) = *(_OWORD *)(a2 + v6[9]);
  *(_OWORD *)(a1 + v6[10]) = *(_OWORD *)(a2 + v6[10]);
  *(_OWORD *)(a1 + v6[11]) = *(_OWORD *)(a2 + v6[11]);
  *(_OWORD *)(a1 + v6[12]) = *(_OWORD *)(a2 + v6[12]);
  v12 = *(int *)(a3 + 20);
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_OWORD *)v13 = *(_OWORD *)v14;
  *(_WORD *)(v13 + 16) = *(_WORD *)(v14 + 16);
  return a1;
}

uint64_t sub_2468CF070(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  _OWORD *v6;
  unint64_t v7;
  int *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  uint64_t v12;
  int EnumTagSinglePayload;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;

  *(_QWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = a2 + 1;
  if (*(_QWORD *)(a1 + 16) < 6uLL)
    goto LABEL_4;
  v7 = a2[2];
  if (v7 < 6)
  {
    sub_2468CEEF8(a1 + 8, &qword_2575E4128);
LABEL_4:
    *(_OWORD *)(a1 + 8) = *v6;
    goto LABEL_6;
  }
  *(_QWORD *)(a1 + 8) = *(_QWORD *)v6;
  *(_QWORD *)(a1 + 16) = v7;
  swift_bridgeObjectRelease();
LABEL_6:
  v8 = (int *)type metadata accessor for WidgetMailbox();
  v9 = v8[6];
  v10 = (void *)(a1 + v9);
  v11 = (char *)a2 + v9;
  v12 = sub_2468D568C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (EnumTagSinglePayload)
  {
    if (!v14)
    {
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v15 = *(_QWORD *)(v12 - 8);
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v10, v12);
LABEL_11:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(void *, char *, uint64_t))(v15 + 40))(v10, v11, v12);
LABEL_12:
  v17 = v8[7];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  v21 = *v19;
  v20 = v19[1];
  *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  v22 = v8[8];
  v23 = (_QWORD *)(a1 + v22);
  v24 = (_QWORD *)((char *)a2 + v22);
  v26 = *v24;
  v25 = v24[1];
  *v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  v27 = v8[9];
  v28 = (_QWORD *)(a1 + v27);
  v29 = (_QWORD *)((char *)a2 + v27);
  v31 = *v29;
  v30 = v29[1];
  *v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  v32 = v8[10];
  v33 = (_QWORD *)(a1 + v32);
  v34 = (_QWORD *)((char *)a2 + v32);
  v36 = *v34;
  v35 = v34[1];
  *v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  v37 = v8[11];
  v38 = (_QWORD *)(a1 + v37);
  v39 = (_QWORD *)((char *)a2 + v37);
  v41 = *v39;
  v40 = v39[1];
  *v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease();
  v42 = v8[12];
  v43 = (_QWORD *)(a1 + v42);
  v44 = (_QWORD *)((char *)a2 + v42);
  v46 = *v44;
  v45 = v44[1];
  *v43 = v46;
  v43[1] = v45;
  swift_bridgeObjectRelease();
  v47 = *(int *)(a3 + 20);
  v48 = a1 + v47;
  v49 = (char *)a2 + v47;
  if (*(_QWORD *)(a1 + v47) >= 2uLL)
  {
    if (*(_QWORD *)v49 >= 2uLL)
    {
      *(_QWORD *)v48 = *(_QWORD *)v49;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v48 + 8) = *((_QWORD *)v49 + 1);
      *(_BYTE *)(v48 + 16) = v49[16];
      *(_BYTE *)(v48 + 17) = v49[17];
      return a1;
    }
    sub_2468CEEF8(v48, qword_2575E4130);
  }
  *(_OWORD *)v48 = *(_OWORD *)v49;
  *(_WORD *)(v48 + 16) = *((_WORD *)v49 + 8);
  return a1;
}

uint64_t sub_2468CF2E8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_2468CF2F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for WidgetMailbox();
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == (_DWORD)a2)
    __swift_getEnumTagSinglePayload(a1, a2, v4);
  else
    OUTLINED_FUNCTION_12_1();
}

uint64_t sub_2468CF370()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2468CF37C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = type metadata accessor for WidgetMailbox();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 + 1);
  return result;
}

uint64_t type metadata accessor for Snapshot()
{
  uint64_t result;

  result = qword_2575E5860;
  if (!qword_2575E5860)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2468CF428()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for WidgetMailbox();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t destroy for Snapshot.State(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s10SiriMailUI8SnapshotV5StateOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  }
  else
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for Snapshot.State(uint64_t a1, __int128 *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)a2;
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *(_QWORD *)a1 = v5;
      v7 = *((_QWORD *)a2 + 1);
      *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
      *(_QWORD *)(a1 + 8) = v7;
      *(_BYTE *)(a1 + 17) = *((_BYTE *)a2 + 17);
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    v8 = *a2;
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    *(_OWORD *)a1 = v8;
    return a1;
  }
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *(_QWORD *)a1 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *((_QWORD *)a2 + 1);
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 17) = *((_BYTE *)a2 + 17);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Snapshot.State(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)a1 < 0xFFFFFFFFuLL)
    goto LABEL_5;
  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for Snapshot.State(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 18))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Snapshot.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_WORD *)(result + 16) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 18) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 18) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t sub_2468CF710(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t sub_2468CF728(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)(result + 8) = 0;
  }
  else
  {
    if (!a2)
      return result;
    v2 = (a2 - 1);
  }
  *(_QWORD *)result = v2;
  return result;
}

ValueMetadata *type metadata accessor for Snapshot.State()
{
  return &type metadata for Snapshot.State;
}

void sub_2468CF75C(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a1 > 1 && a4 >= 2)
  {
    sub_2468B33D8(a1, a4);
    OUTLINED_FUNCTION_12_1();
  }
}

void sub_2468CF7F8(uint64_t a1, unint64_t *a2)
{
  sub_2468CF75C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(unsigned __int16 *)(a1 + 16), *a2);
}

ValueMetadata *type metadata accessor for AmbientDrawable()
{
  return &type metadata for AmbientDrawable;
}

uint64_t sub_2468CF824()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2468CF834@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  char v12;
  id v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t result;
  uint64_t v25;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E5898);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E58A0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E58A8);
  sub_2468CFA2C();
  sub_2468D60A0();
  if (a1)
  {
    v11 = a1;
    v12 = sub_2468D63C4();

    if ((v12 & 1) != 0)
    {
      v13 = v11;
      sub_2468D63D0();

    }
    v14 = sub_2468D5EF0();
    sub_2468D5B18();
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v10, v7, v4);
    v23 = &v10[*(int *)(v8 + 36)];
    *v23 = v14;
    *((_QWORD *)v23 + 1) = v16;
    *((_QWORD *)v23 + 2) = v18;
    *((_QWORD *)v23 + 3) = v20;
    *((_QWORD *)v23 + 4) = v22;
    v23[40] = 0;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return sub_2468CFA70((uint64_t)v10, a2);
  }
  else
  {
    sub_2468D6430();
    sub_2468971E4();
    result = sub_2468D5C80();
    __break(1u);
  }
  return result;
}

uint64_t sub_2468CFA0C()
{
  return sub_2468D5BD8();
}

uint64_t sub_2468CFA24@<X0>(uint64_t a1@<X8>)
{
  void **v1;

  return sub_2468CF834(*v1, a1);
}

unint64_t sub_2468CFA2C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2575E58B0;
  if (!qword_2575E58B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E58A8);
    result = MEMORY[0x249562024](MEMORY[0x24BDEFB78], v1);
    atomic_store(result, (unint64_t *)&qword_2575E58B0);
  }
  return result;
}

uint64_t sub_2468CFA70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E58A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2468CFABC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_2575E58B8;
  if (!qword_2575E58B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E58A0);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575E58A8);
    v2[3] = sub_2468CFA2C();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x249562024](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2575E58B8);
  }
  return result;
}

void sub_2468CFB50()
{
  qword_2575E58C0 = 0;
  *(_QWORD *)algn_2575E58C8 = 0;
}

uint64_t *sub_2468CFB60()
{
  if (qword_2575E3838 != -1)
    swift_once();
  return &qword_2575E58C0;
}

double sub_2468CFBA0(_OWORD *a1, void (*a2)(__int128 *__return_ptr))
{
  double result;
  __int128 v4;

  a2(&v4);
  result = *(double *)&v4;
  *a1 = v4;
  return result;
}

__n128 sub_2468CFBD8@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v2;
  __n128 result;

  v2 = (__n128 *)sub_2468CFB60();
  result = *v2;
  *a1 = *v2;
  return result;
}

uint64_t sub_2468CFC0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_2468D6154();
  result = sub_2468D5BFC();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

uint64_t sub_2468CFC48()
{
  swift_retain();
  swift_retain();
  swift_getAtKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E58D0);
  sub_2468D61FC();
  swift_release();
  return swift_release();
}

ValueMetadata *type metadata accessor for SyncedSizePreferenceKey()
{
  return &type metadata for SyncedSizePreferenceKey;
}

uint64_t *sub_2468CFCF0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v4;
  uint64_t v5;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;

  v4 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v8 = a2 + 1;
    v9 = a2[2];
    swift_bridgeObjectRetain();
    if (v9 >= 6)
    {
      a1[1] = *v8;
      a1[2] = v9;
      swift_bridgeObjectRetain();
    }
    else
    {
      *(_OWORD *)(a1 + 1) = *(_OWORD *)v8;
    }
    v10 = a3[6];
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_2468D568C();
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
    }
    v15 = a3[7];
    v16 = a3[8];
    v17 = (uint64_t *)((char *)a1 + v15);
    v18 = (uint64_t *)((char *)a2 + v15);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v20 = (uint64_t *)((char *)a1 + v16);
    v21 = (uint64_t *)((char *)a2 + v16);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    v23 = a3[9];
    v24 = a3[10];
    v25 = (uint64_t *)((char *)a1 + v23);
    v26 = (uint64_t *)((char *)a2 + v23);
    v27 = v26[1];
    *v25 = *v26;
    v25[1] = v27;
    v28 = (uint64_t *)((char *)a1 + v24);
    v29 = (uint64_t *)((char *)a2 + v24);
    v30 = v29[1];
    *v28 = *v29;
    v28[1] = v30;
    v31 = a3[11];
    v32 = a3[12];
    v33 = (uint64_t *)((char *)a1 + v31);
    v34 = (uint64_t *)((char *)a2 + v31);
    v35 = v34[1];
    *v33 = *v34;
    v33[1] = v35;
    v36 = (uint64_t *)((char *)a1 + v32);
    v37 = (uint64_t *)((char *)a2 + v32);
    v38 = v37[1];
    *v36 = *v37;
    v36[1] = v38;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2468CFE9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 16) >= 6uLL)
    swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_2468D568C();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_2468CFF74(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;

  *a1 = *a2;
  v6 = a2 + 1;
  v7 = a2[2];
  swift_bridgeObjectRetain();
  if (v7 >= 6)
  {
    a1[1] = *v6;
    a1[2] = v7;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *(_OWORD *)v6;
  }
  v8 = a3[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_2468D568C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  v13 = a3[7];
  v14 = a3[8];
  v15 = (_QWORD *)((char *)a1 + v13);
  v16 = (_QWORD *)((char *)a2 + v13);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  v18 = (_QWORD *)((char *)a1 + v14);
  v19 = (_QWORD *)((char *)a2 + v14);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  v21 = a3[9];
  v22 = a3[10];
  v23 = (_QWORD *)((char *)a1 + v21);
  v24 = (_QWORD *)((char *)a2 + v21);
  v25 = v24[1];
  *v23 = *v24;
  v23[1] = v25;
  v26 = (_QWORD *)((char *)a1 + v22);
  v27 = (_QWORD *)((char *)a2 + v22);
  v28 = v27[1];
  *v26 = *v27;
  v26[1] = v28;
  v29 = a3[11];
  v30 = a3[12];
  v31 = (_QWORD *)((char *)a1 + v29);
  v32 = (_QWORD *)((char *)a2 + v29);
  v33 = v32[1];
  *v31 = *v32;
  v31[1] = v33;
  v34 = (_QWORD *)((char *)a1 + v30);
  v35 = (_QWORD *)((char *)a2 + v30);
  v36 = v35[1];
  *v34 = *v35;
  v34[1] = v36;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_2468D00FC(_QWORD *a1, _QWORD *a2, int *a3)
{
  unint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int EnumTagSinglePayload;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a2[2];
  if (a1[2] < 6uLL)
  {
    if (v6 >= 6)
    {
      a1[1] = a2[1];
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v6 < 6)
  {
    sub_2468D0390((uint64_t)(a1 + 1));
LABEL_6:
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
    goto LABEL_8;
  }
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2468D568C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    v13 = *(_QWORD *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v8, v9, v10);
      goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_13;
  }
  if (v12)
  {
LABEL_13:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_14:
  v15 = a3[7];
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = a3[8];
  v19 = (_QWORD *)((char *)a1 + v18);
  v20 = (_QWORD *)((char *)a2 + v18);
  *v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21 = a3[9];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v24 = a3[10];
  v25 = (_QWORD *)((char *)a1 + v24);
  v26 = (_QWORD *)((char *)a2 + v24);
  *v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v27 = a3[11];
  v28 = (_QWORD *)((char *)a1 + v27);
  v29 = (_QWORD *)((char *)a2 + v27);
  *v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30 = a3[12];
  v31 = (_QWORD *)((char *)a1 + v30);
  v32 = (_QWORD *)((char *)a2 + v30);
  *v31 = *v32;
  v31[1] = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2468D0390(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E4128);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2468D03D0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_2468D568C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  v12 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  v13 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  return a1;
}

uint64_t sub_2468D04D0(uint64_t a1, _QWORD *a2, int *a3)
{
  _OWORD *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  char *v10;
  uint64_t v11;
  int EnumTagSinglePayload;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  *(_QWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = a2 + 1;
  if (*(_QWORD *)(a1 + 16) < 6uLL)
    goto LABEL_4;
  v7 = a2[2];
  if (v7 < 6)
  {
    sub_2468D0390(a1 + 8);
LABEL_4:
    *(_OWORD *)(a1 + 8) = *v6;
    goto LABEL_6;
  }
  *(_QWORD *)(a1 + 8) = *(_QWORD *)v6;
  *(_QWORD *)(a1 + 16) = v7;
  swift_bridgeObjectRelease();
LABEL_6:
  v8 = a3[6];
  v9 = (void *)(a1 + v8);
  v10 = (char *)a2 + v8;
  v11 = sub_2468D568C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11);
  v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11);
  if (!EnumTagSinglePayload)
  {
    v14 = *(_QWORD *)(v11 - 8);
    if (!v13)
    {
      (*(void (**)(void *, char *, uint64_t))(v14 + 40))(v9, v10, v11);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v9, v11);
    goto LABEL_11;
  }
  if (v13)
  {
LABEL_11:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
LABEL_12:
  v16 = a3[7];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = a3[8];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  v26 = a3[9];
  v27 = (_QWORD *)(a1 + v26);
  v28 = (_QWORD *)((char *)a2 + v26);
  v30 = *v28;
  v29 = v28[1];
  *v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease();
  v31 = a3[10];
  v32 = (_QWORD *)(a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  v35 = *v33;
  v34 = v33[1];
  *v32 = v35;
  v32[1] = v34;
  swift_bridgeObjectRelease();
  v36 = a3[11];
  v37 = (_QWORD *)(a1 + v36);
  v38 = (_QWORD *)((char *)a2 + v36);
  v40 = *v38;
  v39 = v38[1];
  *v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  v41 = a3[12];
  v42 = (_QWORD *)(a1 + v41);
  v43 = (_QWORD *)((char *)a2 + v41);
  v45 = *v43;
  v44 = v43[1];
  *v42 = v45;
  v42[1] = v44;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2468D06CC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2468D06D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 24), a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 28) + 8);
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t sub_2468D075C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2468D0768(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1 + *(int *)(a4 + 24), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for WidgetMailbox()
{
  uint64_t result;

  result = qword_2575E5930;
  if (!qword_2575E5930)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2468D0820()
{
  unint64_t v0;

  sub_2468D08B0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_2468D08B0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2575E5940)
  {
    sub_2468D568C();
    v0 = sub_2468D6580();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2575E5940);
  }
}

uint64_t sub_2468D0904(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a2)
  {
    case 0:
      return !a4;
    case 1:
      return a4 == 1;
    case 2:
      return a4 == 2;
    case 3:
      return a4 == 3;
    case 4:
      return a4 == 4;
    case 5:
      return a4 == 5;
    default:
      if (a4 < 6)
        return 0;
      if (a1 == a3 && a2 == a4)
        return 1;
      else
        return sub_2468D6784();
  }
}

uint64_t sub_2468D0994()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 16);
  switch(v2)
  {
    case 0uLL:
      v3 = *(int *)(OUTLINED_FUNCTION_0_10() + 32);
      goto LABEL_9;
    case 1uLL:
      v3 = *(int *)(OUTLINED_FUNCTION_0_10() + 36);
      goto LABEL_9;
    case 2uLL:
      v3 = *(int *)(OUTLINED_FUNCTION_0_10() + 40);
      goto LABEL_9;
    case 3uLL:
      v3 = *(int *)(OUTLINED_FUNCTION_0_10() + 44);
      goto LABEL_9;
    case 4uLL:
      v3 = *(int *)(OUTLINED_FUNCTION_0_10() + 28);
      goto LABEL_9;
    case 5uLL:
      v3 = *(int *)(OUTLINED_FUNCTION_0_10() + 48);
LABEL_9:
      v4 = *(_QWORD *)(v0 + v3);
      swift_bridgeObjectRetain();
      break;
    default:
      v4 = *(_QWORD *)(v0 + 8);
      break;
  }
  sub_2468D0A54(v1, v2);
  return v4;
}

uint64_t sub_2468D0A54(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 6)
    return swift_bridgeObjectRetain();
  return result;
}

unint64_t destroy for WidgetMailbox.Configuration(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s10SiriMailUI13WidgetMailboxV13ConfigurationOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for WidgetMailbox.Configuration(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for WidgetMailbox.Configuration(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetMailbox.Configuration(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFF9 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483642);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 5;
  if (v4 >= 7)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for WidgetMailbox.Configuration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFA)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483642;
    if (a3 >= 0x7FFFFFFA)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFA)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 5;
  }
  return result;
}

uint64_t sub_2468D0C74(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_2468D0C8C(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetMailbox.Configuration()
{
  return &type metadata for WidgetMailbox.Configuration;
}

uint64_t sub_2468D0CBC(uint64_t *a1, uint64_t a2)
{
  return sub_2468D0904(*a1, a1[1], *(_QWORD *)a2, *(_QWORD *)(a2 + 8));
}

uint64_t OUTLINED_FUNCTION_0_10()
{
  return type metadata accessor for WidgetMailbox();
}

uint64_t sub_2468D0CD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  v0 = sub_2468D56F8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_0();
  v4 = v3 - v2;
  sub_2468D56EC();
  OUTLINED_FUNCTION_4_4();
  v5 = sub_2468D56E0();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
  if ((v5 & 1) != 0)
  {
    if (qword_2575E3848 != -1)
      swift_once();
    v6 = (void *)qword_2575E5998;
  }
  else
  {
    if (qword_2575E3840 != -1)
      swift_once();
    v6 = (void *)qword_2575E5990;
  }
  v7 = (void *)sub_2468D5698();
  v8 = objc_msgSend(v6, sel_stringFromDate_, v7);

  v9 = sub_2468D6484();
  return v9;
}

uint64_t WidgetMessage.debugDescription.getter()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0();
  v5 = v4 - v3;
  sub_2468D65D4();
  sub_2468D64A8();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_57();
  sub_2468D64A8();
  OUTLINED_FUNCTION_39_1(v1[3], v1[2]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E59A0);
  OUTLINED_FUNCTION_28_2();
  sub_2468D64A8();
  OUTLINED_FUNCTION_57();
  sub_2468D64A8();
  OUTLINED_FUNCTION_39_1(v1[5], v1[4]);
  OUTLINED_FUNCTION_28_2();
  sub_2468D64A8();
  OUTLINED_FUNCTION_57();
  sub_2468D64A8();
  OUTLINED_FUNCTION_39_1(v1[7], v1[6]);
  OUTLINED_FUNCTION_28_2();
  sub_2468D64A8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_42_2();
  v6 = (int *)OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_32_1();
  sub_2468986A8(&qword_2575E59A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
  sub_2468D6760();
  sub_2468D64A8();
  OUTLINED_FUNCTION_57();
  sub_2468D64A8();
  OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_57();
  sub_2468D64A8();
  OUTLINED_FUNCTION_27_2(v6[10]);
  OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_57();
  sub_2468D64A8();
  OUTLINED_FUNCTION_27_2(v6[11]);
  OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_57();
  sub_2468D64A8();
  sub_2468D65D4();
  sub_2468D64A8();
  OUTLINED_FUNCTION_27_2(v6[12]);
  sub_2468D64A8();
  swift_bridgeObjectRelease();
  sub_2468D64A8();
  sub_2468D1260((uint64_t)v0 + v6[13], v5);
  sub_2468D6490();
  sub_2468D64A8();
  OUTLINED_FUNCTION_33_2();
  sub_2468D64A8();
  OUTLINED_FUNCTION_27_2(v6[14]);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_33_2();
  sub_2468D64A8();
  swift_bridgeObjectRetain();
  sub_2468D64A8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_42_2();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_33_2();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_33_2();
  return 0;
}

uint64_t type metadata accessor for WidgetMessage()
{
  uint64_t result;

  result = qword_2575E5A50;
  if (!qword_2575E5A50)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2468D1260(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void WidgetMessage.id.getter()
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.sender.getter()
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.subject.getter()
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.summary.getter()
{
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

uint64_t WidgetMessage.dateReceived.getter()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_32_1();
  v0 = OUTLINED_FUNCTION_19_1();
  return v1(v0);
}

uint64_t WidgetMessage.isVIP.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_4_4() + 36));
}

uint64_t WidgetMessage.isUnread.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_4_4() + 40));
}

uint64_t WidgetMessage.hasAttachments.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_4_4() + 44));
}

uint64_t WidgetMessage.isBlocked.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_4_4() + 48));
}

uint64_t WidgetMessage.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_4_4() + 52);
  return sub_2468D1260(v3, a1);
}

uint64_t WidgetMessage.isSpearfish.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_4_4() + 56));
}

void WidgetMessage.contactId.getter()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.contactId.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_38_1();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_12_1();
}

uint64_t (*WidgetMessage.contactId.modify())()
{
  OUTLINED_FUNCTION_4_4();
  return nullsub_1;
}

void WidgetMessage.toRecipients.getter()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.toRecipients.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_38_1();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_12_1();
}

uint64_t (*WidgetMessage.toRecipients.modify())()
{
  OUTLINED_FUNCTION_4_4();
  return nullsub_1;
}

uint64_t WidgetMessage.hasNextWindow.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_4_4() + 68));
}

void WidgetMessage.deleteLabel.getter()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.replyLabel.getter()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.nextLabel.getter()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.seeAllLabel.getter()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.moreInMailLabel.getter()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.vipLabel.getter()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.inboxesLabel.getter()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.inboxLabel.getter()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.flaggedLabel.getter()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.unreadLabel.getter()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.todayLabel.getter()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.emptySender.getter()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.emptySubject.getter()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

void WidgetMessage.emptyBody.getter()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3();
}

uint64_t WidgetMessage.init(id:sender:subject:summary:dateReceived:isVIP:isUnread:hasAttachments:isBlocked:url:isSpearfish:contactId:toRecipients:hasNextWindow:deleteLabel:replyLabel:nextLabel:seeAllLabel:moreInMailLabel:vipLabel:inboxesLabel:inboxLabel:flaggedLabel:unreadLabel:todayLabel:emptySender:emptySubject:emptyBody:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, char a11, char a12, char a13, char a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  int *v50;
  char *v51;
  uint64_t v52;
  uint64_t result;
  _QWORD *v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD *v62;
  _QWORD *v63;
  _QWORD *v64;
  _QWORD *v65;
  _QWORD *v66;
  _QWORD *v67;
  _QWORD *v68;
  _QWORD *v69;

  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  v50 = (int *)OUTLINED_FUNCTION_4_4();
  v51 = (char *)a9 + v50[8];
  v52 = OUTLINED_FUNCTION_32_1();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 32))(v51, a10, v52);
  *((_BYTE *)a9 + v50[9]) = a11;
  *((_BYTE *)a9 + v50[10]) = a12;
  *((_BYTE *)a9 + v50[11]) = a13;
  *((_BYTE *)a9 + v50[12]) = a14;
  result = sub_2468D1A38(a15, (uint64_t)a9 + v50[13]);
  *((_BYTE *)a9 + v50[14]) = a16;
  v54 = (_QWORD *)((char *)a9 + v50[15]);
  *v54 = a17;
  v54[1] = a18;
  v55 = (_QWORD *)((char *)a9 + v50[16]);
  *v55 = a19;
  v55[1] = a20;
  *((_BYTE *)a9 + v50[17]) = a21;
  v56 = (_QWORD *)((char *)a9 + v50[18]);
  *v56 = a22;
  v56[1] = a23;
  v57 = (_QWORD *)((char *)a9 + v50[19]);
  *v57 = a24;
  v57[1] = a25;
  v58 = (_QWORD *)((char *)a9 + v50[20]);
  *v58 = a26;
  v58[1] = a27;
  v59 = (_QWORD *)((char *)a9 + v50[21]);
  *v59 = a28;
  v59[1] = a29;
  v60 = (_QWORD *)((char *)a9 + v50[22]);
  *v60 = a30;
  v60[1] = a31;
  v61 = (_QWORD *)((char *)a9 + v50[23]);
  *v61 = a32;
  v61[1] = a33;
  v62 = (_QWORD *)((char *)a9 + v50[24]);
  *v62 = a34;
  v62[1] = a35;
  v63 = (_QWORD *)((char *)a9 + v50[25]);
  *v63 = a36;
  v63[1] = a37;
  v64 = (_QWORD *)((char *)a9 + v50[26]);
  *v64 = a38;
  v64[1] = a39;
  v65 = (_QWORD *)((char *)a9 + v50[27]);
  *v65 = a40;
  v65[1] = a41;
  v66 = (_QWORD *)((char *)a9 + v50[28]);
  *v66 = a42;
  v66[1] = a43;
  v67 = (_QWORD *)((char *)a9 + v50[29]);
  *v67 = a44;
  v67[1] = a45;
  v68 = (_QWORD *)((char *)a9 + v50[30]);
  *v68 = a46;
  v68[1] = a47;
  v69 = (_QWORD *)((char *)a9 + v50[31]);
  *v69 = a48;
  v69[1] = a49;
  return result;
}

uint64_t sub_2468D1A38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static WidgetMessage.__derived_struct_equals(_:_:)(_QWORD *a1, _QWORD *a2)
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  BOOL v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v44;
  uint64_t v45;
  uint64_t v46;
  char v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  BOOL v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  BOOL v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  BOOL v94;
  char v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  BOOL v99;
  char v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  BOOL v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  BOOL v109;
  char v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  BOOL v114;
  char v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v119;
  uint64_t v120;

  v6 = sub_2468D568C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_4_2();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E59B0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_7_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
  OUTLINED_FUNCTION_1();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v119 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v119 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v119 - v17;
  v19 = *a1 == *a2 && a1[1] == a2[1];
  if (!v19)
  {
    OUTLINED_FUNCTION_10_8();
    v20 = OUTLINED_FUNCTION_13_6();
    if ((v21 & 1) == 0)
      return v20 & 1;
  }
  v22 = a1[3];
  v23 = a2[3];
  if (v22)
  {
    if (!v23)
      goto LABEL_65;
    if (a1[2] != a2[2] || v22 != v23)
    {
      OUTLINED_FUNCTION_10_8();
      v20 = OUTLINED_FUNCTION_13_6();
      if ((v25 & 1) == 0)
        return v20 & 1;
    }
  }
  else if (v23)
  {
    goto LABEL_65;
  }
  v26 = a1[5];
  v27 = a2[5];
  if (v26)
  {
    if (!v27)
      goto LABEL_65;
    if (a1[4] != a2[4] || v26 != v27)
    {
      OUTLINED_FUNCTION_10_8();
      v20 = OUTLINED_FUNCTION_13_6();
      if ((v29 & 1) == 0)
        return v20 & 1;
    }
  }
  else if (v27)
  {
    goto LABEL_65;
  }
  v30 = a1[7];
  v31 = a2[7];
  if (v30)
  {
    if (!v31)
      goto LABEL_65;
    if (a1[6] != a2[6] || v30 != v31)
    {
      OUTLINED_FUNCTION_10_8();
      v20 = OUTLINED_FUNCTION_13_6();
      if ((v33 & 1) == 0)
        return v20 & 1;
    }
  }
  else if (v31)
  {
    goto LABEL_65;
  }
  v120 = OUTLINED_FUNCTION_4_4();
  if ((sub_2468D56A4() & 1) == 0)
    goto LABEL_65;
  OUTLINED_FUNCTION_19_2();
  if (!v19)
    goto LABEL_65;
  OUTLINED_FUNCTION_19_2();
  if (!v19)
    goto LABEL_65;
  OUTLINED_FUNCTION_19_2();
  if (!v19)
    goto LABEL_65;
  OUTLINED_FUNCTION_19_2();
  if (!v19)
    goto LABEL_65;
  sub_2468D1260((uint64_t)a1 + *(int *)(v34 + 52), (uint64_t)v18);
  sub_2468D1260((uint64_t)a2 + *(int *)(v120 + 52), (uint64_t)v16);
  v35 = v2 + *(int *)(v8 + 48);
  sub_2468D1260((uint64_t)v18, v2);
  sub_2468D1260((uint64_t)v16, v35);
  OUTLINED_FUNCTION_35_1(v2);
  if (v19)
  {
    OUTLINED_FUNCTION_30_2((uint64_t)v16);
    OUTLINED_FUNCTION_30_2((uint64_t)v18);
    OUTLINED_FUNCTION_35_1(v35);
    if (v19)
    {
      sub_2468CEEF8(v2, &qword_2575E3FA8);
      goto LABEL_52;
    }
LABEL_50:
    sub_2468CEEF8(v2, &qword_2575E59B0);
    goto LABEL_65;
  }
  sub_2468D1260(v2, (uint64_t)v13);
  OUTLINED_FUNCTION_35_1(v35);
  if (v36)
  {
    sub_2468CEEF8((uint64_t)v16, &qword_2575E3FA8);
    sub_2468CEEF8((uint64_t)v18, &qword_2575E3FA8);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_50;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v3, v35, v6);
  sub_2468986A8(&qword_2575E59B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB00]);
  v37 = sub_2468D6460();
  v38 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v38(v3, v6);
  OUTLINED_FUNCTION_30_2((uint64_t)v16);
  OUTLINED_FUNCTION_30_2((uint64_t)v18);
  v38((uint64_t)v13, v6);
  OUTLINED_FUNCTION_30_2(v2);
  if ((v37 & 1) == 0)
    goto LABEL_65;
LABEL_52:
  OUTLINED_FUNCTION_19_2();
  if (!v19)
    goto LABEL_65;
  OUTLINED_FUNCTION_2_11(*(int *)(v39 + 60));
  if (!v19 || v40 != v41)
  {
    OUTLINED_FUNCTION_10_8();
    v20 = OUTLINED_FUNCTION_7_9();
    if ((v44 & 1) == 0)
      return v20 & 1;
  }
  OUTLINED_FUNCTION_2_11(*(int *)(v42 + 64));
  if (!v19 || v45 != v46)
  {
    OUTLINED_FUNCTION_10_8();
    v20 = OUTLINED_FUNCTION_7_9();
    if ((v48 & 1) == 0)
      return v20 & 1;
  }
  OUTLINED_FUNCTION_19_2();
  if (!v19)
  {
LABEL_65:
    v20 = 0;
    return v20 & 1;
  }
  OUTLINED_FUNCTION_2_11(*(int *)(v49 + 72));
  v54 = v19 && v51 == v52;
  if (v54 || (OUTLINED_FUNCTION_10_8(), v20 = OUTLINED_FUNCTION_7_9(), (v55 & 1) != 0))
  {
    OUTLINED_FUNCTION_2_11(*(int *)(v53 + 76));
    v59 = v19 && v56 == v57;
    if (v59 || (OUTLINED_FUNCTION_10_8(), v20 = OUTLINED_FUNCTION_7_9(), (v60 & 1) != 0))
    {
      OUTLINED_FUNCTION_2_11(*(int *)(v58 + 80));
      v64 = v19 && v61 == v62;
      if (v64 || (OUTLINED_FUNCTION_10_8(), v20 = OUTLINED_FUNCTION_7_9(), (v65 & 1) != 0))
      {
        OUTLINED_FUNCTION_2_11(*(int *)(v63 + 84));
        v69 = v19 && v66 == v67;
        if (v69 || (OUTLINED_FUNCTION_10_8(), v20 = OUTLINED_FUNCTION_7_9(), (v70 & 1) != 0))
        {
          OUTLINED_FUNCTION_2_11(*(int *)(v68 + 88));
          v74 = v19 && v71 == v72;
          if (v74 || (OUTLINED_FUNCTION_10_8(), v20 = OUTLINED_FUNCTION_7_9(), (v75 & 1) != 0))
          {
            OUTLINED_FUNCTION_2_11(*(int *)(v73 + 92));
            v79 = v19 && v76 == v77;
            if (v79 || (OUTLINED_FUNCTION_10_8(), v20 = OUTLINED_FUNCTION_7_9(), (v80 & 1) != 0))
            {
              OUTLINED_FUNCTION_2_11(*(int *)(v78 + 96));
              v84 = v19 && v81 == v82;
              if (v84 || (OUTLINED_FUNCTION_10_8(), v20 = OUTLINED_FUNCTION_7_9(), (v85 & 1) != 0))
              {
                OUTLINED_FUNCTION_2_11(*(int *)(v83 + 100));
                v89 = v19 && v86 == v87;
                if (v89 || (OUTLINED_FUNCTION_10_8(), v20 = OUTLINED_FUNCTION_7_9(), (v90 & 1) != 0))
                {
                  OUTLINED_FUNCTION_2_11(*(int *)(v88 + 104));
                  v94 = v19 && v91 == v92;
                  if (v94 || (OUTLINED_FUNCTION_10_8(), v20 = OUTLINED_FUNCTION_7_9(), (v95 & 1) != 0))
                  {
                    OUTLINED_FUNCTION_2_11(*(int *)(v93 + 108));
                    v99 = v19 && v96 == v97;
                    if (v99 || (OUTLINED_FUNCTION_10_8(), v20 = OUTLINED_FUNCTION_7_9(), (v100 & 1) != 0))
                    {
                      OUTLINED_FUNCTION_2_11(*(int *)(v98 + 112));
                      v104 = v19 && v101 == v102;
                      if (v104 || (OUTLINED_FUNCTION_10_8(), v20 = OUTLINED_FUNCTION_7_9(), (v105 & 1) != 0))
                      {
                        OUTLINED_FUNCTION_2_11(*(int *)(v103 + 116));
                        v109 = v19 && v106 == v107;
                        if (v109 || (OUTLINED_FUNCTION_10_8(), v20 = OUTLINED_FUNCTION_7_9(), (v110 & 1) != 0))
                        {
                          OUTLINED_FUNCTION_2_11(*(int *)(v108 + 120));
                          v114 = v19 && v111 == v112;
                          if (v114 || (OUTLINED_FUNCTION_10_8(), v20 = OUTLINED_FUNCTION_7_9(), (v115 & 1) != 0))
                          {
                            OUTLINED_FUNCTION_2_11(*(int *)(v113 + 124));
                            if (v19 && v116 == v117)
                              v20 = 1;
                            else
                              v20 = OUTLINED_FUNCTION_10_8();
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
  }
  return v20 & 1;
}

uint64_t sub_2468D1FE8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;
  BOOL v31;
  char v33;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_2468D6784() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x7265646E6573 && a2 == 0xE600000000000000;
    if (v6 || (sub_2468D6784() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x7463656A627573 && a2 == 0xE700000000000000;
      if (v7 || (sub_2468D6784() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x7972616D6D7573 && a2 == 0xE700000000000000;
        if (v8 || (sub_2468D6784() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x6563655265746164 && a2 == 0xEC00000064657669;
          if (v9 || (sub_2468D6784() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 0x5049567369 && a2 == 0xE500000000000000;
            if (v10 || (sub_2468D6784() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              v11 = a1 == 0x646165726E557369 && a2 == 0xE800000000000000;
              if (v11 || (sub_2468D6784() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                v12 = a1 == 0x6361747441736168 && a2 == 0xEE0073746E656D68;
                if (v12 || (sub_2468D6784() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else
                {
                  v13 = a1 == 0x656B636F6C427369 && a2 == 0xE900000000000064;
                  if (v13 || (sub_2468D6784() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 8;
                  }
                  else
                  {
                    v14 = a1 == 7107189 && a2 == 0xE300000000000000;
                    if (v14 || (sub_2468D6784() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 9;
                    }
                    else
                    {
                      v15 = a1 == 0x6672616570537369 && a2 == 0xEB00000000687369;
                      if (v15 || (sub_2468D6784() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 10;
                      }
                      else
                      {
                        v16 = a1 == 0x49746361746E6F63 && a2 == 0xE900000000000064;
                        if (v16 || (sub_2468D6784() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 11;
                        }
                        else
                        {
                          v17 = a1 == 0x6970696365526F74 && a2 == 0xEC00000073746E65;
                          if (v17 || (sub_2468D6784() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 12;
                          }
                          else
                          {
                            v18 = a1 == 0x577478654E736168 && a2 == 0xED0000776F646E69;
                            if (v18 || (sub_2468D6784() & 1) != 0)
                            {
                              swift_bridgeObjectRelease();
                              return 13;
                            }
                            else
                            {
                              v19 = a1 == 0x614C6574656C6564 && a2 == 0xEB000000006C6562;
                              if (v19 || (sub_2468D6784() & 1) != 0)
                              {
                                swift_bridgeObjectRelease();
                                return 14;
                              }
                              else
                              {
                                v20 = a1 == 0x62614C796C706572 && a2 == 0xEA00000000006C65;
                                if (v20 || (sub_2468D6784() & 1) != 0)
                                {
                                  swift_bridgeObjectRelease();
                                  return 15;
                                }
                                else
                                {
                                  v21 = a1 == 0x6562614C7478656ELL && a2 == 0xE90000000000006CLL;
                                  if (v21 || (sub_2468D6784() & 1) != 0)
                                  {
                                    swift_bridgeObjectRelease();
                                    return 16;
                                  }
                                  else
                                  {
                                    v22 = a1 == 0x614C6C6C41656573 && a2 == 0xEB000000006C6562;
                                    if (v22 || (sub_2468D6784() & 1) != 0)
                                    {
                                      swift_bridgeObjectRelease();
                                      return 17;
                                    }
                                    else
                                    {
                                      v23 = a1 == 0x614D6E4965726F6DLL && a2 == 0xEF6C6562614C6C69;
                                      if (v23 || (sub_2468D6784() & 1) != 0)
                                      {
                                        swift_bridgeObjectRelease();
                                        return 18;
                                      }
                                      else
                                      {
                                        v24 = a1 == 0x6C6562614C706976 && a2 == 0xE800000000000000;
                                        if (v24 || (sub_2468D6784() & 1) != 0)
                                        {
                                          swift_bridgeObjectRelease();
                                          return 19;
                                        }
                                        else
                                        {
                                          v25 = a1 == 0x4C7365786F626E69 && a2 == 0xEC0000006C656261;
                                          if (v25 || (sub_2468D6784() & 1) != 0)
                                          {
                                            swift_bridgeObjectRelease();
                                            return 20;
                                          }
                                          else
                                          {
                                            v26 = a1 == 0x62614C786F626E69 && a2 == 0xEA00000000006C65;
                                            if (v26 || (sub_2468D6784() & 1) != 0)
                                            {
                                              swift_bridgeObjectRelease();
                                              return 21;
                                            }
                                            else
                                            {
                                              v27 = a1 == 0x4C64656767616C66 && a2 == 0xEC0000006C656261;
                                              if (v27 || (sub_2468D6784() & 1) != 0)
                                              {
                                                swift_bridgeObjectRelease();
                                                return 22;
                                              }
                                              else
                                              {
                                                v28 = a1 == 0x614C646165726E75 && a2 == 0xEB000000006C6562;
                                                if (v28 || (sub_2468D6784() & 1) != 0)
                                                {
                                                  swift_bridgeObjectRelease();
                                                  return 23;
                                                }
                                                else
                                                {
                                                  v29 = a1 == 0x62614C7961646F74 && a2 == 0xEA00000000006C65;
                                                  if (v29 || (sub_2468D6784() & 1) != 0)
                                                  {
                                                    swift_bridgeObjectRelease();
                                                    return 24;
                                                  }
                                                  else
                                                  {
                                                    v30 = a1 == 0x6E65537974706D65 && a2 == 0xEB00000000726564;
                                                    if (v30 || (sub_2468D6784() & 1) != 0)
                                                    {
                                                      swift_bridgeObjectRelease();
                                                      return 25;
                                                    }
                                                    else
                                                    {
                                                      v31 = a1 == 0x6275537974706D65 && a2 == 0xEC0000007463656ALL;
                                                      if (v31 || (sub_2468D6784() & 1) != 0)
                                                      {
                                                        swift_bridgeObjectRelease();
                                                        return 26;
                                                      }
                                                      else if (a1 == 0x646F427974706D65 && a2 == 0xE900000000000079)
                                                      {
                                                        swift_bridgeObjectRelease();
                                                        return 27;
                                                      }
                                                      else
                                                      {
                                                        v33 = sub_2468D6784();
                                                        swift_bridgeObjectRelease();
                                                        if ((v33 & 1) != 0)
                                                          return 27;
                                                        else
                                                          return 28;
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
      }
    }
  }
}

uint64_t sub_2468D2BC0()
{
  return 28;
}

uint64_t sub_2468D2BC8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2468D2BF0 + 4 * byte_2468DA670[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_2468D2BF0()
{
  return 0x7265646E6573;
}

uint64_t sub_2468D2C04()
{
  return 0x7463656A627573;
}

uint64_t sub_2468D2C1C()
{
  return 0x7972616D6D7573;
}

uint64_t sub_2468D2C34()
{
  return 0x6563655265746164;
}

uint64_t sub_2468D2C54()
{
  return 0x5049567369;
}

uint64_t sub_2468D2C68()
{
  return 0x646165726E557369;
}

uint64_t sub_2468D2C80()
{
  return 0x6361747441736168;
}

uint64_t sub_2468D2CA4()
{
  return 0x656B636F6C427369;
}

uint64_t sub_2468D2D04()
{
  return 0x6970696365526F74;
}

uint64_t sub_2468D2D24()
{
  return 0x577478654E736168;
}

uint64_t sub_2468D2D48()
{
  return 0x614C6574656C6564;
}

uint64_t sub_2468D2E50()
{
  return 0x6E65537974706D65;
}

uint64_t sub_2468D2E70()
{
  return 0x6275537974706D65;
}

uint64_t sub_2468D2E90()
{
  return 0x646F427974706D65;
}

uint64_t sub_2468D2EB0()
{
  unsigned __int8 *v0;

  return sub_2468D2BC8(*v0);
}

uint64_t sub_2468D2EB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2468D1FE8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2468D2EDC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2468D2BC0();
  *a1 = result;
  return result;
}

uint64_t sub_2468D2F00()
{
  sub_2468D3314();
  return sub_2468D67D8();
}

uint64_t sub_2468D2F28()
{
  sub_2468D3314();
  return sub_2468D67E4();
}

uint64_t WidgetMessage.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E59C0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_7_3();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2468D3314();
  sub_2468D67CC();
  sub_2468D6730();
  if (!v1)
  {
    OUTLINED_FUNCTION_18_7(1);
    OUTLINED_FUNCTION_18_7(2);
    OUTLINED_FUNCTION_18_7(3);
    v6 = (int *)type metadata accessor for WidgetMessage();
    sub_2468D56B0();
    sub_2468986A8(&qword_2575E59D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    OUTLINED_FUNCTION_26_3();
    sub_2468D6754();
    OUTLINED_FUNCTION_8_7(5);
    OUTLINED_FUNCTION_8_7(6);
    OUTLINED_FUNCTION_8_7(7);
    OUTLINED_FUNCTION_8_7(8);
    sub_2468D568C();
    sub_2468986A8(&qword_2575E59D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
    OUTLINED_FUNCTION_26_3();
    sub_2468D6724();
    OUTLINED_FUNCTION_8_7(10);
    OUTLINED_FUNCTION_16_5(v6[15]);
    OUTLINED_FUNCTION_0_11(11);
    OUTLINED_FUNCTION_16_5(v6[16]);
    OUTLINED_FUNCTION_0_11(12);
    OUTLINED_FUNCTION_8_7(13);
    OUTLINED_FUNCTION_16_5(v6[18]);
    OUTLINED_FUNCTION_0_11(14);
    OUTLINED_FUNCTION_16_5(v6[19]);
    OUTLINED_FUNCTION_0_11(15);
    OUTLINED_FUNCTION_16_5(v6[20]);
    OUTLINED_FUNCTION_0_11(16);
    OUTLINED_FUNCTION_16_5(v6[21]);
    OUTLINED_FUNCTION_0_11(17);
    OUTLINED_FUNCTION_16_5(v6[22]);
    OUTLINED_FUNCTION_0_11(18);
    OUTLINED_FUNCTION_16_5(v6[23]);
    OUTLINED_FUNCTION_0_11(19);
    OUTLINED_FUNCTION_16_5(v6[24]);
    OUTLINED_FUNCTION_0_11(20);
    OUTLINED_FUNCTION_16_5(v6[25]);
    OUTLINED_FUNCTION_0_11(21);
    OUTLINED_FUNCTION_16_5(v6[26]);
    OUTLINED_FUNCTION_0_11(22);
    OUTLINED_FUNCTION_16_5(v6[27]);
    OUTLINED_FUNCTION_0_11(23);
    OUTLINED_FUNCTION_16_5(v6[28]);
    OUTLINED_FUNCTION_0_11(24);
    OUTLINED_FUNCTION_16_5(v6[29]);
    OUTLINED_FUNCTION_0_11(25);
    OUTLINED_FUNCTION_16_5(v6[30]);
    OUTLINED_FUNCTION_0_11(26);
    OUTLINED_FUNCTION_16_5(v6[31]);
    OUTLINED_FUNCTION_0_11(27);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

unint64_t sub_2468D3314()
{
  unint64_t result;

  result = qword_2575E59C8;
  if (!qword_2575E59C8)
  {
    result = MEMORY[0x249562024](&unk_2468DA894, &type metadata for WidgetMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E59C8);
  }
  return result;
}

uint64_t WidgetMessage.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t *v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  int *v62;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_0();
  v9 = v8 - v7;
  v10 = sub_2468D56B0();
  v57 = *(_QWORD *)(v10 - 8);
  v58 = v10;
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_4_2();
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E59E0);
  MEMORY[0x24BDAC7A8](v60);
  OUTLINED_FUNCTION_0();
  v62 = (int *)type metadata accessor for WidgetMessage();
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_0();
  v61 = (uint64_t *)(v13 - v12);
  v59 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2468D3314();
  sub_2468D67C0();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *v61 = sub_2468D66D0();
  v61[1] = v14;
  v61[2] = OUTLINED_FUNCTION_25_3(1);
  v61[3] = v15;
  v61[4] = OUTLINED_FUNCTION_25_3(2);
  v61[5] = v16;
  v61[6] = OUTLINED_FUNCTION_25_3(3);
  v61[7] = v17;
  sub_2468986A8(&qword_2575E59E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
  sub_2468D66F4();
  (*(void (**)(char *, uint64_t, uint64_t))(v57 + 32))((char *)v61 + v62[8], v3, v58);
  v18 = sub_2468D66DC();
  OUTLINED_FUNCTION_41_2(v18, v62[9]);
  v19 = OUTLINED_FUNCTION_24_4(6);
  OUTLINED_FUNCTION_41_2(v19, v62[10]);
  v20 = OUTLINED_FUNCTION_24_4(7);
  OUTLINED_FUNCTION_41_2(v20, v62[11]);
  v21 = OUTLINED_FUNCTION_24_4(8);
  OUTLINED_FUNCTION_41_2(v21, v62[12]);
  sub_2468D568C();
  sub_2468986A8(&qword_2575E59F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
  sub_2468D66C4();
  sub_2468D1A38(v9, (uint64_t)v61 + v62[13]);
  *((_BYTE *)v61 + v62[14]) = OUTLINED_FUNCTION_29_2(10) & 1;
  v22 = OUTLINED_FUNCTION_1_7(11);
  OUTLINED_FUNCTION_17_6(v22, v23, v62[15]);
  v24 = OUTLINED_FUNCTION_1_7(12);
  OUTLINED_FUNCTION_17_6(v24, v25, v62[16]);
  *((_BYTE *)v61 + v62[17]) = OUTLINED_FUNCTION_29_2(13) & 1;
  v26 = OUTLINED_FUNCTION_1_7(14);
  OUTLINED_FUNCTION_17_6(v26, v27, v62[18]);
  v28 = OUTLINED_FUNCTION_1_7(15);
  OUTLINED_FUNCTION_17_6(v28, v29, v62[19]);
  v30 = OUTLINED_FUNCTION_1_7(16);
  OUTLINED_FUNCTION_17_6(v30, v31, v62[20]);
  v32 = OUTLINED_FUNCTION_1_7(17);
  OUTLINED_FUNCTION_17_6(v32, v33, v62[21]);
  v34 = OUTLINED_FUNCTION_1_7(18);
  OUTLINED_FUNCTION_17_6(v34, v35, v62[22]);
  v36 = OUTLINED_FUNCTION_1_7(19);
  OUTLINED_FUNCTION_17_6(v36, v37, v62[23]);
  v38 = OUTLINED_FUNCTION_1_7(20);
  OUTLINED_FUNCTION_17_6(v38, v39, v62[24]);
  v40 = OUTLINED_FUNCTION_1_7(21);
  OUTLINED_FUNCTION_17_6(v40, v41, v62[25]);
  v42 = OUTLINED_FUNCTION_1_7(22);
  OUTLINED_FUNCTION_17_6(v42, v43, v62[26]);
  v44 = OUTLINED_FUNCTION_1_7(23);
  OUTLINED_FUNCTION_17_6(v44, v45, v62[27]);
  v46 = OUTLINED_FUNCTION_1_7(24);
  OUTLINED_FUNCTION_17_6(v46, v47, v62[28]);
  v48 = OUTLINED_FUNCTION_1_7(25);
  OUTLINED_FUNCTION_17_6(v48, v49, v62[29]);
  v50 = OUTLINED_FUNCTION_1_7(26);
  OUTLINED_FUNCTION_17_6(v50, v51, v62[30]);
  v52 = OUTLINED_FUNCTION_1_7(27);
  v54 = v53;
  OUTLINED_FUNCTION_3_10();
  v55 = (uint64_t *)((char *)v61 + v62[31]);
  *v55 = v52;
  v55[1] = v54;
  sub_2468B36B4((uint64_t)v61, a2);
  __swift_destroy_boxed_opaque_existential_1(v59);
  return sub_2468B36F8((uint64_t)v61);
}

uint64_t sub_2468D3CFC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return WidgetMessage.init(from:)(a1, a2);
}

uint64_t sub_2468D3D10(_QWORD *a1)
{
  return WidgetMessage.encode(to:)(a1);
}

uint64_t sub_2468D3D28@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

_QWORD *initializeBufferWithCopyOfBuffer for WidgetMessage(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  _QWORD *v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  _QWORD *v69;
  uint64_t v70;
  _QWORD *v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  _QWORD *v77;
  uint64_t v78;
  _QWORD *v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v22 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    v10 = a2[7];
    v11 = a3[8];
    v88 = (char *)a1 + v11;
    v12 = (char *)a2 + v11;
    a1[6] = a2[6];
    a1[7] = v10;
    v13 = sub_2468D56B0();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v88, v12, v13);
    v15 = a3[10];
    *((_BYTE *)v4 + a3[9]) = *((_BYTE *)a2 + a3[9]);
    *((_BYTE *)v4 + v15) = *((_BYTE *)a2 + v15);
    v16 = a3[12];
    *((_BYTE *)v4 + a3[11]) = *((_BYTE *)a2 + a3[11]);
    *((_BYTE *)v4 + v16) = *((_BYTE *)a2 + v16);
    v17 = a3[13];
    v18 = (char *)v4 + v17;
    v19 = (char *)a2 + v17;
    v20 = sub_2468D568C();
    if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
    }
    v23 = a3[15];
    *((_BYTE *)v4 + a3[14]) = *((_BYTE *)a2 + a3[14]);
    v24 = (_QWORD *)((char *)v4 + v23);
    v25 = (_QWORD *)((char *)a2 + v23);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    v27 = a3[16];
    v28 = a3[17];
    v29 = (_QWORD *)((char *)v4 + v27);
    v30 = (_QWORD *)((char *)a2 + v27);
    v89 = v30[1];
    *v29 = *v30;
    v29[1] = v89;
    *((_BYTE *)v4 + v28) = *((_BYTE *)a2 + v28);
    v31 = a3[18];
    v32 = a3[19];
    v33 = (_QWORD *)((char *)v4 + v31);
    v34 = (_QWORD *)((char *)a2 + v31);
    v86 = v34[1];
    *v33 = *v34;
    v33[1] = v86;
    v35 = (_QWORD *)((char *)v4 + v32);
    v36 = (_QWORD *)((char *)a2 + v32);
    v87 = v36[1];
    *v35 = *v36;
    v35[1] = v87;
    v37 = a3[20];
    v38 = a3[21];
    v39 = (_QWORD *)((char *)v4 + v37);
    v40 = (_QWORD *)((char *)a2 + v37);
    v84 = v40[1];
    *v39 = *v40;
    v39[1] = v84;
    v41 = (_QWORD *)((char *)v4 + v38);
    v42 = (_QWORD *)((char *)a2 + v38);
    v85 = v42[1];
    *v41 = *v42;
    v41[1] = v85;
    v43 = a3[22];
    v44 = a3[23];
    v45 = (_QWORD *)((char *)v4 + v43);
    v46 = (_QWORD *)((char *)a2 + v43);
    v47 = v46[1];
    *v45 = *v46;
    v45[1] = v47;
    v48 = (_QWORD *)((char *)v4 + v44);
    v49 = (_QWORD *)((char *)a2 + v44);
    v83 = v49[1];
    *v48 = *v49;
    v48[1] = v83;
    v50 = a3[24];
    v51 = a3[25];
    v52 = (_QWORD *)((char *)v4 + v50);
    v53 = (_QWORD *)((char *)a2 + v50);
    v54 = v53[1];
    *v52 = *v53;
    v52[1] = v54;
    v55 = (_QWORD *)((char *)v4 + v51);
    v56 = (_QWORD *)((char *)a2 + v51);
    v57 = v56[1];
    *v55 = *v56;
    v55[1] = v57;
    v58 = a3[26];
    v59 = a3[27];
    v60 = (_QWORD *)((char *)v4 + v58);
    v61 = (_QWORD *)((char *)a2 + v58);
    v62 = v61[1];
    *v60 = *v61;
    v60[1] = v62;
    v63 = (_QWORD *)((char *)v4 + v59);
    v64 = (_QWORD *)((char *)a2 + v59);
    v65 = v64[1];
    *v63 = *v64;
    v63[1] = v65;
    v66 = a3[28];
    v67 = a3[29];
    v68 = (_QWORD *)((char *)v4 + v66);
    v69 = (_QWORD *)((char *)a2 + v66);
    v70 = v69[1];
    *v68 = *v69;
    v68[1] = v70;
    v71 = (_QWORD *)((char *)v4 + v67);
    v72 = (_QWORD *)((char *)a2 + v67);
    v73 = v72[1];
    *v71 = *v72;
    v71[1] = v73;
    v74 = a3[30];
    v75 = a3[31];
    v76 = (_QWORD *)((char *)v4 + v74);
    v77 = (_QWORD *)((char *)a2 + v74);
    v78 = v77[1];
    *v76 = *v77;
    v76[1] = v78;
    v79 = (_QWORD *)((char *)v4 + v75);
    v80 = (_QWORD *)((char *)a2 + v75);
    v81 = v80[1];
    *v79 = *v80;
    v79[1] = v81;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for WidgetMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = sub_2468D56B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + *(int *)(a2 + 52);
  v7 = sub_2468D568C();
  if (!__swift_getEnumTagSinglePayload(v6, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for WidgetMessage(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  _QWORD *v59;
  uint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  uint64_t v68;
  _QWORD *v69;
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  _QWORD *v75;
  uint64_t v76;
  _QWORD *v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  v9 = a2[7];
  v10 = a3[8];
  v86 = (char *)a1 + v10;
  v11 = (char *)a2 + v10;
  a1[6] = a2[6];
  a1[7] = v9;
  v12 = sub_2468D56B0();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v86, v11, v12);
  v14 = a3[10];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *((_BYTE *)a1 + v14) = *((_BYTE *)a2 + v14);
  v15 = a3[12];
  *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  *((_BYTE *)a1 + v15) = *((_BYTE *)a2 + v15);
  v16 = a3[13];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = sub_2468D568C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
  }
  v21 = a3[15];
  *((_BYTE *)a1 + a3[14]) = *((_BYTE *)a2 + a3[14]);
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  v25 = a3[16];
  v26 = a3[17];
  v27 = (_QWORD *)((char *)a1 + v25);
  v28 = (_QWORD *)((char *)a2 + v25);
  v87 = v28[1];
  *v27 = *v28;
  v27[1] = v87;
  *((_BYTE *)a1 + v26) = *((_BYTE *)a2 + v26);
  v29 = a3[18];
  v30 = a3[19];
  v31 = (_QWORD *)((char *)a1 + v29);
  v32 = (_QWORD *)((char *)a2 + v29);
  v84 = v32[1];
  *v31 = *v32;
  v31[1] = v84;
  v33 = (_QWORD *)((char *)a1 + v30);
  v34 = (_QWORD *)((char *)a2 + v30);
  v85 = v34[1];
  *v33 = *v34;
  v33[1] = v85;
  v35 = a3[20];
  v36 = a3[21];
  v37 = (_QWORD *)((char *)a1 + v35);
  v38 = (_QWORD *)((char *)a2 + v35);
  v82 = v38[1];
  *v37 = *v38;
  v37[1] = v82;
  v39 = (_QWORD *)((char *)a1 + v36);
  v40 = (_QWORD *)((char *)a2 + v36);
  v83 = v40[1];
  *v39 = *v40;
  v39[1] = v83;
  v41 = a3[22];
  v42 = a3[23];
  v43 = (_QWORD *)((char *)a1 + v41);
  v44 = (_QWORD *)((char *)a2 + v41);
  v45 = v44[1];
  *v43 = *v44;
  v43[1] = v45;
  v46 = (_QWORD *)((char *)a1 + v42);
  v47 = (_QWORD *)((char *)a2 + v42);
  v81 = v47[1];
  *v46 = *v47;
  v46[1] = v81;
  v48 = a3[24];
  v49 = a3[25];
  v50 = (_QWORD *)((char *)a1 + v48);
  v51 = (_QWORD *)((char *)a2 + v48);
  v52 = v51[1];
  *v50 = *v51;
  v50[1] = v52;
  v53 = (_QWORD *)((char *)a1 + v49);
  v54 = (_QWORD *)((char *)a2 + v49);
  v55 = v54[1];
  *v53 = *v54;
  v53[1] = v55;
  v56 = a3[26];
  v57 = a3[27];
  v58 = (_QWORD *)((char *)a1 + v56);
  v59 = (_QWORD *)((char *)a2 + v56);
  v60 = v59[1];
  *v58 = *v59;
  v58[1] = v60;
  v61 = (_QWORD *)((char *)a1 + v57);
  v62 = (_QWORD *)((char *)a2 + v57);
  v63 = v62[1];
  *v61 = *v62;
  v61[1] = v63;
  v64 = a3[28];
  v65 = a3[29];
  v66 = (_QWORD *)((char *)a1 + v64);
  v67 = (_QWORD *)((char *)a2 + v64);
  v68 = v67[1];
  *v66 = *v67;
  v66[1] = v68;
  v69 = (_QWORD *)((char *)a1 + v65);
  v70 = (_QWORD *)((char *)a2 + v65);
  v71 = v70[1];
  *v69 = *v70;
  v69[1] = v71;
  v72 = a3[30];
  v73 = a3[31];
  v74 = (_QWORD *)((char *)a1 + v72);
  v75 = (_QWORD *)((char *)a2 + v72);
  v76 = v75[1];
  *v74 = *v75;
  v74[1] = v76;
  v77 = (_QWORD *)((char *)a1 + v73);
  v78 = (_QWORD *)((char *)a2 + v73);
  v79 = v78[1];
  *v77 = *v78;
  v77[1] = v79;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for WidgetMessage(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  int EnumTagSinglePayload;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  _QWORD *v58;
  _QWORD *v59;
  uint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  _QWORD *v64;
  _QWORD *v65;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[8];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2468D56B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *((_BYTE *)a1 + a3[10]) = *((_BYTE *)a2 + a3[10]);
  *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  *((_BYTE *)a1 + a3[12]) = *((_BYTE *)a2 + a3[12]);
  v10 = a3[13];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_2468D568C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v13);
  v15 = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13);
  if (!EnumTagSinglePayload)
  {
    v16 = *(_QWORD *)(v13 - 8);
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
LABEL_7:
  *((_BYTE *)a1 + a3[14]) = *((_BYTE *)a2 + a3[14]);
  v18 = a3[15];
  v19 = (_QWORD *)((char *)a1 + v18);
  v20 = (_QWORD *)((char *)a2 + v18);
  *v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21 = a3[16];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + a3[17]) = *((_BYTE *)a2 + a3[17]);
  v24 = a3[18];
  v25 = (_QWORD *)((char *)a1 + v24);
  v26 = (_QWORD *)((char *)a2 + v24);
  *v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v27 = a3[19];
  v28 = (_QWORD *)((char *)a1 + v27);
  v29 = (_QWORD *)((char *)a2 + v27);
  *v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30 = a3[20];
  v31 = (_QWORD *)((char *)a1 + v30);
  v32 = (_QWORD *)((char *)a2 + v30);
  *v31 = *v32;
  v31[1] = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v33 = a3[21];
  v34 = (_QWORD *)((char *)a1 + v33);
  v35 = (_QWORD *)((char *)a2 + v33);
  *v34 = *v35;
  v34[1] = v35[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v36 = a3[22];
  v37 = (_QWORD *)((char *)a1 + v36);
  v38 = (_QWORD *)((char *)a2 + v36);
  *v37 = *v38;
  v37[1] = v38[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v39 = a3[23];
  v40 = (_QWORD *)((char *)a1 + v39);
  v41 = (_QWORD *)((char *)a2 + v39);
  *v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v42 = a3[24];
  v43 = (_QWORD *)((char *)a1 + v42);
  v44 = (_QWORD *)((char *)a2 + v42);
  *v43 = *v44;
  v43[1] = v44[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v45 = a3[25];
  v46 = (_QWORD *)((char *)a1 + v45);
  v47 = (_QWORD *)((char *)a2 + v45);
  *v46 = *v47;
  v46[1] = v47[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v48 = a3[26];
  v49 = (_QWORD *)((char *)a1 + v48);
  v50 = (_QWORD *)((char *)a2 + v48);
  *v49 = *v50;
  v49[1] = v50[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v51 = a3[27];
  v52 = (_QWORD *)((char *)a1 + v51);
  v53 = (_QWORD *)((char *)a2 + v51);
  *v52 = *v53;
  v52[1] = v53[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v54 = a3[28];
  v55 = (_QWORD *)((char *)a1 + v54);
  v56 = (_QWORD *)((char *)a2 + v54);
  *v55 = *v56;
  v55[1] = v56[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v57 = a3[29];
  v58 = (_QWORD *)((char *)a1 + v57);
  v59 = (_QWORD *)((char *)a2 + v57);
  *v58 = *v59;
  v58[1] = v59[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v60 = a3[30];
  v61 = (_QWORD *)((char *)a1 + v60);
  v62 = (_QWORD *)((char *)a2 + v60);
  *v61 = *v62;
  v61[1] = v62[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v63 = a3[31];
  v64 = (_QWORD *)((char *)a1 + v63);
  v65 = (_QWORD *)((char *)a2 + v63);
  *v64 = *v65;
  v64[1] = v65[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for WidgetMessage(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
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

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a3[8];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_2468D56B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = a3[10];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *((_BYTE *)a1 + v12) = *((_BYTE *)a2 + v12);
  v13 = a3[12];
  *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  *((_BYTE *)a1 + v13) = *((_BYTE *)a2 + v13);
  v14 = a3[13];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = sub_2468D568C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
  }
  v19 = a3[15];
  *((_BYTE *)a1 + a3[14]) = *((_BYTE *)a2 + a3[14]);
  *(_OWORD *)((char *)a1 + v19) = *(_OWORD *)((char *)a2 + v19);
  v20 = a3[17];
  *(_OWORD *)((char *)a1 + a3[16]) = *(_OWORD *)((char *)a2 + a3[16]);
  *((_BYTE *)a1 + v20) = *((_BYTE *)a2 + v20);
  v21 = a3[19];
  *(_OWORD *)((char *)a1 + a3[18]) = *(_OWORD *)((char *)a2 + a3[18]);
  *(_OWORD *)((char *)a1 + v21) = *(_OWORD *)((char *)a2 + v21);
  v22 = a3[21];
  *(_OWORD *)((char *)a1 + a3[20]) = *(_OWORD *)((char *)a2 + a3[20]);
  *(_OWORD *)((char *)a1 + v22) = *(_OWORD *)((char *)a2 + v22);
  v23 = a3[23];
  *(_OWORD *)((char *)a1 + a3[22]) = *(_OWORD *)((char *)a2 + a3[22]);
  *(_OWORD *)((char *)a1 + v23) = *(_OWORD *)((char *)a2 + v23);
  v24 = a3[25];
  *(_OWORD *)((char *)a1 + a3[24]) = *(_OWORD *)((char *)a2 + a3[24]);
  *(_OWORD *)((char *)a1 + v24) = *(_OWORD *)((char *)a2 + v24);
  v25 = a3[27];
  *(_OWORD *)((char *)a1 + a3[26]) = *(_OWORD *)((char *)a2 + a3[26]);
  *(_OWORD *)((char *)a1 + v25) = *(_OWORD *)((char *)a2 + v25);
  v26 = a3[29];
  *(_OWORD *)((char *)a1 + a3[28]) = *(_OWORD *)((char *)a2 + a3[28]);
  *(_OWORD *)((char *)a1 + v26) = *(_OWORD *)((char *)a2 + v26);
  v27 = a3[31];
  *(_OWORD *)((char *)a1 + a3[30]) = *(_OWORD *)((char *)a2 + a3[30]);
  *(_OWORD *)((char *)a1 + v27) = *(_OWORD *)((char *)a2 + v27);
  return a1;
}

_QWORD *assignWithTake for WidgetMessage(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  int EnumTagSinglePayload;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD *v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  v10 = a3[8];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_2468D56B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = a3[10];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *((_BYTE *)a1 + v14) = *((_BYTE *)a2 + v14);
  v15 = a3[12];
  *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  *((_BYTE *)a1 + v15) = *((_BYTE *)a2 + v15);
  v16 = a3[13];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = sub_2468D568C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v17, 1, v19);
  v21 = __swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19);
  if (!EnumTagSinglePayload)
  {
    v22 = *(_QWORD *)(v19 - 8);
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 40))(v17, v18, v19);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v17, v19);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
LABEL_7:
  v24 = a3[15];
  *((_BYTE *)a1 + a3[14]) = *((_BYTE *)a2 + a3[14]);
  v25 = (_QWORD *)((char *)a1 + v24);
  v26 = (_QWORD *)((char *)a2 + v24);
  v28 = *v26;
  v27 = v26[1];
  *v25 = v28;
  v25[1] = v27;
  swift_bridgeObjectRelease();
  v29 = a3[16];
  v30 = (_QWORD *)((char *)a1 + v29);
  v31 = (_QWORD *)((char *)a2 + v29);
  v33 = *v31;
  v32 = v31[1];
  *v30 = v33;
  v30[1] = v32;
  swift_bridgeObjectRelease();
  v34 = a3[18];
  *((_BYTE *)a1 + a3[17]) = *((_BYTE *)a2 + a3[17]);
  v35 = (_QWORD *)((char *)a1 + v34);
  v36 = (_QWORD *)((char *)a2 + v34);
  v38 = *v36;
  v37 = v36[1];
  *v35 = v38;
  v35[1] = v37;
  swift_bridgeObjectRelease();
  v39 = a3[19];
  v40 = (_QWORD *)((char *)a1 + v39);
  v41 = (_QWORD *)((char *)a2 + v39);
  v43 = *v41;
  v42 = v41[1];
  *v40 = v43;
  v40[1] = v42;
  swift_bridgeObjectRelease();
  v44 = a3[20];
  v45 = (_QWORD *)((char *)a1 + v44);
  v46 = (_QWORD *)((char *)a2 + v44);
  v48 = *v46;
  v47 = v46[1];
  *v45 = v48;
  v45[1] = v47;
  swift_bridgeObjectRelease();
  v49 = a3[21];
  v50 = (_QWORD *)((char *)a1 + v49);
  v51 = (_QWORD *)((char *)a2 + v49);
  v53 = *v51;
  v52 = v51[1];
  *v50 = v53;
  v50[1] = v52;
  swift_bridgeObjectRelease();
  v54 = a3[22];
  v55 = (_QWORD *)((char *)a1 + v54);
  v56 = (_QWORD *)((char *)a2 + v54);
  v58 = *v56;
  v57 = v56[1];
  *v55 = v58;
  v55[1] = v57;
  swift_bridgeObjectRelease();
  v59 = a3[23];
  v60 = (_QWORD *)((char *)a1 + v59);
  v61 = (_QWORD *)((char *)a2 + v59);
  v63 = *v61;
  v62 = v61[1];
  *v60 = v63;
  v60[1] = v62;
  swift_bridgeObjectRelease();
  v64 = a3[24];
  v65 = (_QWORD *)((char *)a1 + v64);
  v66 = (_QWORD *)((char *)a2 + v64);
  v68 = *v66;
  v67 = v66[1];
  *v65 = v68;
  v65[1] = v67;
  swift_bridgeObjectRelease();
  v69 = a3[25];
  v70 = (_QWORD *)((char *)a1 + v69);
  v71 = (_QWORD *)((char *)a2 + v69);
  v73 = *v71;
  v72 = v71[1];
  *v70 = v73;
  v70[1] = v72;
  swift_bridgeObjectRelease();
  v74 = a3[26];
  v75 = (_QWORD *)((char *)a1 + v74);
  v76 = (_QWORD *)((char *)a2 + v74);
  v78 = *v76;
  v77 = v76[1];
  *v75 = v78;
  v75[1] = v77;
  swift_bridgeObjectRelease();
  v79 = a3[27];
  v80 = (_QWORD *)((char *)a1 + v79);
  v81 = (_QWORD *)((char *)a2 + v79);
  v83 = *v81;
  v82 = v81[1];
  *v80 = v83;
  v80[1] = v82;
  swift_bridgeObjectRelease();
  v84 = a3[28];
  v85 = (_QWORD *)((char *)a1 + v84);
  v86 = (_QWORD *)((char *)a2 + v84);
  v88 = *v86;
  v87 = v86[1];
  *v85 = v88;
  v85[1] = v87;
  swift_bridgeObjectRelease();
  v89 = a3[29];
  v90 = (_QWORD *)((char *)a1 + v89);
  v91 = (_QWORD *)((char *)a2 + v89);
  v93 = *v91;
  v92 = v91[1];
  *v90 = v93;
  v90[1] = v92;
  swift_bridgeObjectRelease();
  v94 = a3[30];
  v95 = (_QWORD *)((char *)a1 + v94);
  v96 = (_QWORD *)((char *)a2 + v94);
  v98 = *v96;
  v97 = v96[1];
  *v95 = v98;
  v95[1] = v97;
  swift_bridgeObjectRelease();
  v99 = a3[31];
  v100 = (_QWORD *)((char *)a1 + v99);
  v101 = (_QWORD *)((char *)a2 + v99);
  v103 = *v101;
  v102 = v101[1];
  *v100 = v103;
  v100[1] = v102;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WidgetMessage()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2468D4F60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = OUTLINED_FUNCTION_32_1();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == (_DWORD)a2)
    {
      v9 = v8;
      v10 = *(int *)(a3 + 32);
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
      v10 = *(int *)(a3 + 52);
    }
    return __swift_getEnumTagSinglePayload(a1 + v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for WidgetMessage()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_2468D5004(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 8) = (a2 - 1);
    OUTLINED_FUNCTION_12_1();
  }
  else
  {
    v8 = OUTLINED_FUNCTION_32_1();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = *(int *)(a4 + 32);
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575E3FA8);
      v10 = *(int *)(a4 + 52);
    }
    __swift_storeEnumTagSinglePayload(a1 + v10, a2, a2, v9);
  }
}

void sub_2468D5090()
{
  unint64_t v0;
  unint64_t v1;

  sub_2468D56B0();
  if (v0 <= 0x3F)
  {
    sub_2468D08B0();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t getEnumTagSinglePayload for WidgetMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xE5)
  {
    if (a2 + 27 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 27) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 28;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x1C;
  v5 = v6 - 28;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for WidgetMessage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 27 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 27) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE4)
    return ((uint64_t (*)(void))((char *)&loc_2468D523C + 4 * byte_2468DA691[v4]))();
  *a1 = a2 + 27;
  return ((uint64_t (*)(void))((char *)sub_2468D5270 + 4 * byte_2468DA68C[v4]))();
}

uint64_t sub_2468D5270(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468D5278(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2468D5280);
  return result;
}

uint64_t sub_2468D528C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2468D5294);
  *(_BYTE *)result = a2 + 27;
  return result;
}

uint64_t sub_2468D5298(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468D52A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WidgetMessage.CodingKeys()
{
  return &type metadata for WidgetMessage.CodingKeys;
}

unint64_t sub_2468D52C0()
{
  unint64_t result;

  result = qword_2575E5AF0;
  if (!qword_2575E5AF0)
  {
    result = MEMORY[0x249562024](&unk_2468DA86C, &type metadata for WidgetMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5AF0);
  }
  return result;
}

unint64_t sub_2468D5300()
{
  unint64_t result;

  result = qword_2575E5AF8;
  if (!qword_2575E5AF8)
  {
    result = MEMORY[0x249562024](&unk_2468DA7DC, &type metadata for WidgetMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5AF8);
  }
  return result;
}

unint64_t sub_2468D5340()
{
  unint64_t result;

  result = qword_2575E5B00;
  if (!qword_2575E5B00)
  {
    result = MEMORY[0x249562024](&unk_2468DA804, &type metadata for WidgetMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575E5B00);
  }
  return result;
}

id sub_2468D537C()
{
  id result;

  result = sub_2468D5398();
  qword_2575E5990 = (uint64_t)result;
  return result;
}

id sub_2468D5398()
{
  id v0;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 1);
  objc_msgSend(v0, sel_setTimeStyle_, 0);
  objc_msgSend(v0, sel_setDoesRelativeDateFormatting_, 1);
  return v0;
}

id sub_2468D5408()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 0);
  result = objc_msgSend(v0, sel_setTimeStyle_, 1);
  qword_2575E5998 = (uint64_t)v0;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_11@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = a1;
  return sub_2468D6730();
}

uint64_t OUTLINED_FUNCTION_1_7@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = a1;
  return sub_2468D66D0();
}

uint64_t OUTLINED_FUNCTION_2_11@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_3_10()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v1 - 128), *(_QWORD *)(v1 - 112));
}

uint64_t OUTLINED_FUNCTION_7_9()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_8_7@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = a1;
  return sub_2468D673C();
}

uint64_t OUTLINED_FUNCTION_10_8()
{
  return sub_2468D6784();
}

uint64_t OUTLINED_FUNCTION_13_6()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_14_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_15_5@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_16_5@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_17_6@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  _QWORD *v4;

  v4 = (_QWORD *)(v3 + a3);
  *v4 = result;
  v4[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_18_7@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = a1;
  return sub_2468D6718();
}

void OUTLINED_FUNCTION_20_2()
{
  uint64_t v0;

  *(_DWORD *)(v0 - 112) = 0;
}

uint64_t OUTLINED_FUNCTION_24_4@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = a1;
  return sub_2468D66DC();
}

uint64_t OUTLINED_FUNCTION_25_3@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = a1;
  return sub_2468D66B8();
}

uint64_t OUTLINED_FUNCTION_26_3()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_27_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (*(_BYTE *)(v1 + a1))
    return v2;
  else
    return v3;
}

uint64_t OUTLINED_FUNCTION_28_2()
{
  return sub_2468D6490();
}

uint64_t OUTLINED_FUNCTION_29_2@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = a1;
  return sub_2468D66DC();
}

uint64_t OUTLINED_FUNCTION_30_2(uint64_t a1)
{
  uint64_t *v1;

  return sub_2468CEEF8(a1, v1);
}

uint64_t OUTLINED_FUNCTION_32_1()
{
  return sub_2468D56B0();
}

uint64_t OUTLINED_FUNCTION_33_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_34_1()
{
  return sub_2468D64A8();
}

uint64_t OUTLINED_FUNCTION_35_1(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_39_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = a2;
  *(_QWORD *)(v2 - 104) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_40_2()
{
  return sub_2468D64A8();
}

uint64_t OUTLINED_FUNCTION_41_2@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_BYTE *)(v2 + a2) = result & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_42_2()
{
  return sub_2468D64A8();
}

uint64_t sub_2468D5644()
{
  return MEMORY[0x24BDB5F90]();
}

uint64_t sub_2468D5650()
{
  return MEMORY[0x24BDB5FA8]();
}

uint64_t sub_2468D565C()
{
  return MEMORY[0x24BDB5FD0]();
}

uint64_t sub_2468D5668()
{
  return MEMORY[0x24BDCB630]();
}

uint64_t sub_2468D5674()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_2468D5680()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_2468D568C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2468D5698()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2468D56A4()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_2468D56B0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2468D56BC()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2468D56C8()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2468D56D4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2468D56E0()
{
  return MEMORY[0x24BDCF008]();
}

uint64_t sub_2468D56EC()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_2468D56F8()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_2468D5704()
{
  return MEMORY[0x24BEAA6A8]();
}

uint64_t sub_2468D5710()
{
  return MEMORY[0x24BEAA6D8]();
}

uint64_t sub_2468D571C()
{
  return MEMORY[0x24BEAAC48]();
}

uint64_t sub_2468D5728()
{
  return MEMORY[0x24BEAD2C8]();
}

uint64_t sub_2468D5734()
{
  return MEMORY[0x24BEAD2D0]();
}

uint64_t sub_2468D5740()
{
  return MEMORY[0x24BEAD2E8]();
}

uint64_t sub_2468D574C()
{
  return MEMORY[0x24BE97260]();
}

uint64_t sub_2468D5758()
{
  return MEMORY[0x24BE97288]();
}

uint64_t sub_2468D5764()
{
  return MEMORY[0x24BE973B0]();
}

uint64_t sub_2468D5770()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_2468D577C()
{
  return MEMORY[0x24BE93590]();
}

uint64_t sub_2468D5788()
{
  return MEMORY[0x24BE935C8]();
}

uint64_t sub_2468D5794()
{
  return MEMORY[0x24BE935D0]();
}

uint64_t sub_2468D57A0()
{
  return MEMORY[0x24BE935D8]();
}

uint64_t sub_2468D57AC()
{
  return MEMORY[0x24BE935E0]();
}

uint64_t sub_2468D57B8()
{
  return MEMORY[0x24BE93BE0]();
}

uint64_t sub_2468D57C4()
{
  return MEMORY[0x24BE93C58]();
}

uint64_t sub_2468D57D0()
{
  return MEMORY[0x24BE93C88]();
}

uint64_t sub_2468D57DC()
{
  return MEMORY[0x24BE93CC0]();
}

uint64_t sub_2468D57E8()
{
  return MEMORY[0x24BEA87E8]();
}

uint64_t sub_2468D57F4()
{
  return MEMORY[0x24BEA8808]();
}

uint64_t sub_2468D5800()
{
  return MEMORY[0x24BEA8810]();
}

uint64_t sub_2468D580C()
{
  return MEMORY[0x24BEA8958]();
}

uint64_t sub_2468D5818()
{
  return MEMORY[0x24BEA89B0]();
}

uint64_t sub_2468D5824()
{
  return MEMORY[0x24BEA8B28]();
}

uint64_t sub_2468D5830()
{
  return MEMORY[0x24BE95F18]();
}

uint64_t sub_2468D583C()
{
  return MEMORY[0x24BE95F28]();
}

uint64_t sub_2468D5848()
{
  return MEMORY[0x24BE99A48]();
}

uint64_t sub_2468D5854()
{
  return MEMORY[0x24BE99A50]();
}

uint64_t sub_2468D5860()
{
  return MEMORY[0x24BE99A70]();
}

uint64_t sub_2468D586C()
{
  return MEMORY[0x24BE99AC8]();
}

uint64_t sub_2468D5878()
{
  return MEMORY[0x24BE99AE8]();
}

uint64_t sub_2468D5884()
{
  return MEMORY[0x24BE99AF8]();
}

uint64_t sub_2468D5890()
{
  return MEMORY[0x24BE99B00]();
}

uint64_t sub_2468D589C()
{
  return MEMORY[0x24BE99B08]();
}

uint64_t sub_2468D58A8()
{
  return MEMORY[0x24BE99B10]();
}

uint64_t sub_2468D58B4()
{
  return MEMORY[0x24BE99B18]();
}

uint64_t sub_2468D58C0()
{
  return MEMORY[0x24BE99B20]();
}

uint64_t sub_2468D58CC()
{
  return MEMORY[0x24BE99B28]();
}

uint64_t sub_2468D58D8()
{
  return MEMORY[0x24BE99B40]();
}

uint64_t sub_2468D58E4()
{
  return MEMORY[0x24BE99B58]();
}

uint64_t sub_2468D58F0()
{
  return MEMORY[0x24BE99B68]();
}

uint64_t sub_2468D58FC()
{
  return MEMORY[0x24BE99B78]();
}

uint64_t sub_2468D5908()
{
  return MEMORY[0x24BE99BB0]();
}

uint64_t sub_2468D5914()
{
  return MEMORY[0x24BE99C00]();
}

uint64_t sub_2468D5920()
{
  return MEMORY[0x24BE99C20]();
}

uint64_t sub_2468D592C()
{
  return MEMORY[0x24BE99C40]();
}

uint64_t sub_2468D5938()
{
  return MEMORY[0x24BE99C48]();
}

uint64_t sub_2468D5944()
{
  return MEMORY[0x24BE99C50]();
}

uint64_t sub_2468D5950()
{
  return MEMORY[0x24BE99C58]();
}

uint64_t sub_2468D595C()
{
  return MEMORY[0x24BE99C60]();
}

uint64_t sub_2468D5968()
{
  return MEMORY[0x24BE99C88]();
}

uint64_t sub_2468D5974()
{
  return MEMORY[0x24BE99C90]();
}

uint64_t sub_2468D5980()
{
  return MEMORY[0x24BE99CA0]();
}

uint64_t sub_2468D598C()
{
  return MEMORY[0x24BE99CA8]();
}

uint64_t sub_2468D5998()
{
  return MEMORY[0x24BE99CB0]();
}

uint64_t sub_2468D59A4()
{
  return MEMORY[0x24BE99CB8]();
}

uint64_t sub_2468D59B0()
{
  return MEMORY[0x24BE99CC0]();
}

uint64_t sub_2468D59BC()
{
  return MEMORY[0x24BE99CC8]();
}

uint64_t sub_2468D59C8()
{
  return MEMORY[0x24BE99CD0]();
}

uint64_t sub_2468D59D4()
{
  return MEMORY[0x24BE99D00]();
}

uint64_t sub_2468D59E0()
{
  return MEMORY[0x24BE2E838]();
}

uint64_t sub_2468D59EC()
{
  return MEMORY[0x24BE2E840]();
}

uint64_t sub_2468D59F8()
{
  return MEMORY[0x24BE2E848]();
}

uint64_t sub_2468D5A04()
{
  return MEMORY[0x24BE2E850]();
}

uint64_t sub_2468D5A10()
{
  return MEMORY[0x24BE2E860]();
}

uint64_t sub_2468D5A1C()
{
  return MEMORY[0x24BE2E870]();
}

uint64_t sub_2468D5A28()
{
  return MEMORY[0x24BE2E878]();
}

uint64_t sub_2468D5A34()
{
  return MEMORY[0x24BE2E880]();
}

uint64_t sub_2468D5A40()
{
  return MEMORY[0x24BE2E890]();
}

uint64_t sub_2468D5A4C()
{
  return MEMORY[0x24BE2E898]();
}

uint64_t sub_2468D5A58()
{
  return MEMORY[0x24BE2E8A0]();
}

uint64_t sub_2468D5A64()
{
  return MEMORY[0x24BE2E8A8]();
}

uint64_t sub_2468D5A70()
{
  return MEMORY[0x24BE2E8B0]();
}

uint64_t sub_2468D5A7C()
{
  return MEMORY[0x24BE2E8B8]();
}

uint64_t sub_2468D5A88()
{
  return MEMORY[0x24BE2E8C0]();
}

uint64_t sub_2468D5A94()
{
  return MEMORY[0x24BE2E8C8]();
}

uint64_t sub_2468D5AA0()
{
  return MEMORY[0x24BE2E8D0]();
}

uint64_t sub_2468D5AAC()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_2468D5AB8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2468D5AC4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2468D5AD0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2468D5ADC()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_2468D5AE8()
{
  return MEMORY[0x24BDB9B60]();
}

uint64_t sub_2468D5AF4()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_2468D5B00()
{
  return MEMORY[0x24BDB9D68]();
}

uint64_t sub_2468D5B0C()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_2468D5B18()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_2468D5B24()
{
  return MEMORY[0x24BDEB0A8]();
}

uint64_t sub_2468D5B30()
{
  return MEMORY[0x24BDEB0B8]();
}

uint64_t sub_2468D5B3C()
{
  return MEMORY[0x24BDEB0C0]();
}

uint64_t sub_2468D5B48()
{
  return MEMORY[0x24BDEB0E8]();
}

uint64_t sub_2468D5B54()
{
  return MEMORY[0x24BDEB0F0]();
}

uint64_t sub_2468D5B60()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_2468D5B6C()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_2468D5B78()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_2468D5B84()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_2468D5B90()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_2468D5B9C()
{
  return MEMORY[0x24BDEBC10]();
}

uint64_t sub_2468D5BA8()
{
  return MEMORY[0x24BDEBC38]();
}

uint64_t sub_2468D5BB4()
{
  return MEMORY[0x24BDEBC40]();
}

uint64_t sub_2468D5BC0()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_2468D5BCC()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_2468D5BD8()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_2468D5BE4()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_2468D5BF0()
{
  return MEMORY[0x24BDEBF88]();
}

uint64_t sub_2468D5BFC()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_2468D5C08()
{
  return MEMORY[0x24BDEC348]();
}

uint64_t sub_2468D5C14()
{
  return MEMORY[0x24BDEC358]();
}

uint64_t sub_2468D5C20()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_2468D5C2C()
{
  return MEMORY[0x24BDEC9A0]();
}

uint64_t sub_2468D5C38()
{
  return MEMORY[0x24BDEC9B0]();
}

uint64_t sub_2468D5C44()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_2468D5C50()
{
  return MEMORY[0x24BDEDC80]();
}

uint64_t sub_2468D5C5C()
{
  return MEMORY[0x24BDEDCA8]();
}

uint64_t sub_2468D5C68()
{
  return MEMORY[0x24BDEDD58]();
}

uint64_t sub_2468D5C74()
{
  return MEMORY[0x24BDEDDD8]();
}

uint64_t sub_2468D5C80()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t sub_2468D5C8C()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_2468D5C98()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_2468D5CA4()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_2468D5CB0()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_2468D5CBC()
{
  return MEMORY[0x24BDEDF90]();
}

uint64_t sub_2468D5CC8()
{
  return MEMORY[0x24BE95F38]();
}

uint64_t sub_2468D5CD4()
{
  return MEMORY[0x24BE95F40]();
}

uint64_t sub_2468D5CE0()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_2468D5CEC()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_2468D5CF8()
{
  return MEMORY[0x24BDEE100]();
}

uint64_t sub_2468D5D04()
{
  return MEMORY[0x24BDEE108]();
}

uint64_t sub_2468D5D10()
{
  return MEMORY[0x24BDEE138]();
}

uint64_t sub_2468D5D1C()
{
  return MEMORY[0x24BDEE140]();
}

uint64_t sub_2468D5D28()
{
  return MEMORY[0x24BDEE1F0]();
}

uint64_t sub_2468D5D34()
{
  return MEMORY[0x24BDEE1F8]();
}

uint64_t sub_2468D5D40()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_2468D5D4C()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_2468D5D58()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_2468D5D64()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_2468D5D70()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_2468D5D7C()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_2468D5D88()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_2468D5D94()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_2468D5DA0()
{
  return MEMORY[0x24BDEE700]();
}

uint64_t sub_2468D5DAC()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_2468D5DB8()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_2468D5DC4()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_2468D5DD0()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_2468D5DDC()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_2468D5DE8()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_2468D5DF4()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_2468D5E00()
{
  return MEMORY[0x24BDEEEA0]();
}

uint64_t sub_2468D5E0C()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_2468D5E18()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_2468D5E24()
{
  return MEMORY[0x24BDEF0B0]();
}

uint64_t sub_2468D5E30()
{
  return MEMORY[0x24BDEF0E8]();
}

uint64_t sub_2468D5E3C()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_2468D5E48()
{
  return MEMORY[0x24BDEF930]();
}

uint64_t sub_2468D5E54()
{
  return MEMORY[0x24BDEF938]();
}

uint64_t sub_2468D5E60()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_2468D5E6C()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_2468D5E78()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_2468D5E84()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_2468D5E90()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_2468D5E9C()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_2468D5EA8()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_2468D5EB4()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_2468D5EC0()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_2468D5ECC()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_2468D5ED8()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_2468D5EE4()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_2468D5EF0()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_2468D5EFC()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_2468D5F08()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_2468D5F14()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_2468D5F20()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_2468D5F2C()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_2468D5F38()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_2468D5F44()
{
  return MEMORY[0x24BDF1560]();
}

uint64_t sub_2468D5F50()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_2468D5F5C()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_2468D5F68()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t sub_2468D5F74()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_2468D5F80()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_2468D5F8C()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_2468D5F98()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_2468D5FA4()
{
  return MEMORY[0x24BDF1790]();
}

uint64_t sub_2468D5FB0()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_2468D5FBC()
{
  return MEMORY[0x24BDF17D8]();
}

uint64_t sub_2468D5FC8()
{
  return MEMORY[0x24BDF17E8]();
}

uint64_t sub_2468D5FD4()
{
  return MEMORY[0x24BDF1818]();
}

uint64_t sub_2468D5FE0()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_2468D5FEC()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_2468D5FF8()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_2468D6004()
{
  return MEMORY[0x24BDF19B0]();
}

uint64_t sub_2468D6010()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_2468D601C()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_2468D6028()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_2468D6034()
{
  return MEMORY[0x24BDF1DB8]();
}

uint64_t sub_2468D6040()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_2468D604C()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_2468D6058()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_2468D6064()
{
  return MEMORY[0x24BEAD6D0]();
}

uint64_t sub_2468D6070()
{
  return MEMORY[0x24BEAD6E0]();
}

uint64_t sub_2468D607C()
{
  return MEMORY[0x24BEAD708]();
}

uint64_t sub_2468D6088()
{
  return MEMORY[0x24BEAD740]();
}

uint64_t sub_2468D6094()
{
  return MEMORY[0x24BEAD780]();
}

uint64_t sub_2468D60A0()
{
  return MEMORY[0x24BEAD7B0]();
}

uint64_t sub_2468D60AC()
{
  return MEMORY[0x24BEAD7C0]();
}

uint64_t sub_2468D60B8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2468D60C4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2468D60D0()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_2468D60DC()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2468D60E8()
{
  return MEMORY[0x24BDF2790]();
}

uint64_t sub_2468D60F4()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_2468D6100()
{
  return MEMORY[0x24BDF3740]();
}

uint64_t sub_2468D610C()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_2468D6118()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_2468D6124()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_2468D6130()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_2468D613C()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_2468D6148()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_2468D6154()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_2468D6160()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_2468D616C()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_2468D6178()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_2468D6184()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_2468D6190()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_2468D619C()
{
  return MEMORY[0x24BDF4170]();
}

uint64_t sub_2468D61A8()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_2468D61B4()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_2468D61C0()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_2468D61CC()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_2468D61D8()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_2468D61E4()
{
  return MEMORY[0x24BDF4380]();
}

uint64_t sub_2468D61F0()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_2468D61FC()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_2468D6208()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_2468D6214()
{
  return MEMORY[0x24BDF4818]();
}

uint64_t sub_2468D6220()
{
  return MEMORY[0x24BDF4830]();
}

uint64_t sub_2468D622C()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_2468D6238()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_2468D6244()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_2468D6250()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_2468D625C()
{
  return MEMORY[0x24BDF4EC0]();
}

uint64_t sub_2468D6268()
{
  return MEMORY[0x24BDF4EF0]();
}

uint64_t sub_2468D6274()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_2468D6280()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_2468D628C()
{
  return MEMORY[0x24BDF5380]();
}

uint64_t sub_2468D6298()
{
  return MEMORY[0x24BDF5390]();
}

uint64_t sub_2468D62A4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2468D62B0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2468D62BC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2468D62C8()
{
  return MEMORY[0x24BEAD990]();
}

uint64_t sub_2468D62D4()
{
  return MEMORY[0x24BEADA38]();
}

uint64_t sub_2468D62E0()
{
  return MEMORY[0x24BEADA60]();
}

uint64_t sub_2468D62EC()
{
  return MEMORY[0x24BEADBD0]();
}

uint64_t sub_2468D62F8()
{
  return MEMORY[0x24BEADCD0]();
}

uint64_t sub_2468D6304()
{
  return MEMORY[0x24BEADCE0]();
}

uint64_t sub_2468D6310()
{
  return MEMORY[0x24BEADDA0]();
}

uint64_t sub_2468D631C()
{
  return MEMORY[0x24BEADDC0]();
}

uint64_t sub_2468D6328()
{
  return MEMORY[0x24BEADDF8]();
}

uint64_t sub_2468D6334()
{
  return MEMORY[0x24BEADE00]();
}

uint64_t sub_2468D6340()
{
  return MEMORY[0x24BEADE88]();
}

uint64_t sub_2468D634C()
{
  return MEMORY[0x24BEADE90]();
}

uint64_t sub_2468D6358()
{
  return MEMORY[0x24BEADF98]();
}

uint64_t sub_2468D6364()
{
  return MEMORY[0x24BEADFB0]();
}

uint64_t sub_2468D6370()
{
  return MEMORY[0x24BEADFC0]();
}

uint64_t sub_2468D637C()
{
  return MEMORY[0x24BEAE038]();
}

uint64_t sub_2468D6388()
{
  return MEMORY[0x24BEAE050]();
}

uint64_t sub_2468D6394()
{
  return MEMORY[0x24BEAE178]();
}

uint64_t sub_2468D63A0()
{
  return MEMORY[0x24BEAE190]();
}

uint64_t sub_2468D63AC()
{
  return MEMORY[0x24BEAE3B8]();
}

uint64_t sub_2468D63B8()
{
  return MEMORY[0x24BEAE3C0]();
}

uint64_t sub_2468D63C4()
{
  return MEMORY[0x24BEAE438]();
}

uint64_t sub_2468D63D0()
{
  return MEMORY[0x24BEAE448]();
}

uint64_t sub_2468D63DC()
{
  return MEMORY[0x24BEAE480]();
}

uint64_t sub_2468D63E8()
{
  return MEMORY[0x24BEAE498]();
}

uint64_t sub_2468D63F4()
{
  return MEMORY[0x24BEAE4A0]();
}

uint64_t sub_2468D6400()
{
  return MEMORY[0x24BEAE4D0]();
}

uint64_t sub_2468D640C()
{
  return MEMORY[0x24BEAE4F8]();
}

uint64_t sub_2468D6418()
{
  return MEMORY[0x24BEAE550]();
}

uint64_t sub_2468D6424()
{
  return MEMORY[0x24BEAE568]();
}

uint64_t sub_2468D6430()
{
  return MEMORY[0x24BEAE580]();
}

uint64_t sub_2468D643C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2468D6448()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2468D6454()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2468D6460()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2468D646C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2468D6478()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2468D6484()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2468D6490()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2468D649C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2468D64A8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2468D64B4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2468D64C0()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_2468D64CC()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_2468D64D8()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_2468D64E4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2468D64F0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2468D64FC()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2468D6508()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_2468D6514()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_2468D6520()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2468D652C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2468D6538()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2468D6544()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2468D6550()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2468D655C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2468D6568()
{
  return MEMORY[0x24BDF5540]();
}

uint64_t sub_2468D6574()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_2468D6580()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2468D658C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2468D6598()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2468D65A4()
{
  return MEMORY[0x24BDD04B8]();
}

uint64_t sub_2468D65B0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2468D65BC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2468D65C8()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2468D65D4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2468D65E0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2468D65EC()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t sub_2468D65F8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2468D6604()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_2468D6610()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_2468D661C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2468D6628()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2468D6634()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2468D6640()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2468D664C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2468D6658()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2468D6664()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2468D6670()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2468D667C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2468D6688()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2468D6694()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2468D66A0()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_2468D66AC()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_2468D66B8()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2468D66C4()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2468D66D0()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2468D66DC()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_2468D66E8()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_2468D66F4()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2468D6700()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_2468D670C()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_2468D6718()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_2468D6724()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2468D6730()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2468D673C()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2468D6748()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_2468D6754()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2468D6760()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2468D676C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2468D6778()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_2468D6784()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2468D6790()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2468D679C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2468D67A8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2468D67B4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2468D67C0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2468D67CC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2468D67D8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2468D67E4()
{
  return MEMORY[0x24BEE4A10]();
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x24BEE7248]();
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

