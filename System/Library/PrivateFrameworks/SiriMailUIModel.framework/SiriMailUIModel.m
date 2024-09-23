uint64_t sub_2468E906C()
{
  uint64_t v0;

  v0 = sub_2468F4BC4();
  __swift_allocate_value_buffer(v0, qword_2575EBE58);
  __swift_project_value_buffer(v0, (uint64_t)qword_2575EBE58);
  return sub_2468F4BB8();
}

uint64_t static Logger.siriMail.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2575EBE50 != -1)
    swift_once();
  v2 = sub_2468F4BC4();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2575EBE58);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
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

uint64_t SiriMailAction.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2468F4C0C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t SiriMailAction.rawValue.getter()
{
  return 1684956531;
}

unint64_t sub_2468E9224()
{
  unint64_t result;

  result = qword_2575EBE78;
  if (!qword_2575EBE78)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for SiriMailAction, &type metadata for SiriMailAction);
    atomic_store(result, (unint64_t *)&qword_2575EBE78);
  }
  return result;
}

uint64_t sub_2468E926C@<X0>(BOOL *a1@<X8>)
{
  return SiriMailAction.init(rawValue:)(a1);
}

void sub_2468E9278(_QWORD *a1@<X8>)
{
  *a1 = 1684956531;
  a1[1] = 0xE400000000000000;
}

uint64_t sub_2468E928C()
{
  sub_2468E9434();
  return sub_2468F4BE8();
}

uint64_t sub_2468E92E8()
{
  sub_2468E9434();
  return sub_2468F4BDC();
}

uint64_t getEnumTagSinglePayload for SiriMailAction(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SiriMailAction(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2468E93CC + 4 * asc_2468F4E38[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2468E93EC + 4 * byte_2468F4E3D[v4]))();
}

_BYTE *sub_2468E93CC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2468E93EC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2468E93F4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2468E93FC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2468E9404(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2468E940C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2468E9418()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriMailAction()
{
  return &type metadata for SiriMailAction;
}

unint64_t sub_2468E9434()
{
  unint64_t result;

  result = qword_2575EBE80;
  if (!qword_2575EBE80)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for SiriMailAction, &type metadata for SiriMailAction);
    atomic_store(result, (unint64_t *)&qword_2575EBE80);
  }
  return result;
}

void sub_2468E9470(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_2468E94A8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2468E9508 + 4 * byte_2468F4F55[a2]))(25443);
}

uint64_t sub_2468E9508(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v4;

  if (a1 == 25443 && v1 == v2)
    v4 = 1;
  else
    v4 = sub_2468F4CA8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

void sub_2468E9594(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_2468E95DC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2468E9650 + 4 * byte_2468F4F5F[a2]))(0x676E69646E6573);
}

uint64_t sub_2468E9650(uint64_t a1)
{
  uint64_t v1;
  char v3;

  if (a1 == 0x676E69646E6573 && v1 == 0xE700000000000000)
    v3 = 1;
  else
    v3 = sub_2468F4CA8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_2468E96F4(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v8;

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
  if (v3 == v5 && v4 == v6)
    v8 = 1;
  else
    v8 = sub_2468F4CA8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2468E9788()
{
  return 1;
}

void sub_2468E9790()
{
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_79();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_27();
}

void sub_2468E97B4()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_102(v0);
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_27();
}

uint64_t sub_2468E97E0()
{
  return sub_2468E99A4();
}

uint64_t sub_2468E97EC()
{
  return sub_2468F4BD0();
}

uint64_t sub_2468E97FC()
{
  sub_2468F4BD0();
  return swift_bridgeObjectRelease();
}

void sub_2468E9848(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2468E9884()
{
  sub_2468F4BD0();
  return swift_bridgeObjectRelease();
}

void sub_2468E98F0(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2468E9924()
{
  sub_2468F4BD0();
  return swift_bridgeObjectRelease();
}

void sub_2468E9978()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_102(v0);
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_27();
}

uint64_t sub_2468E99A4()
{
  sub_2468F4CB4();
  sub_2468F4BD0();
  swift_bridgeObjectRelease();
  return sub_2468F4CD8();
}

void sub_2468E9A14()
{
  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_79();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_27();
}

uint64_t sub_2468E9A38()
{
  uint64_t v0;

  v0 = sub_2468F4BAC();
  __swift_allocate_value_buffer(v0, qword_2575EBE88);
  __swift_project_value_buffer(v0, (uint64_t)qword_2575EBE88);
  return sub_2468F4BA0();
}

uint64_t static ServiceName.mail.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2575EBE70 != -1)
    swift_once();
  v2 = sub_2468F4BAC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2575EBE88);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

void _SiriMailMessage.Account.name.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.Account.address.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

SiriMailUIModel::_SiriMailMessage::Account __swiftcall _SiriMailMessage.Account.init(name:address:)(Swift::String_optional name, Swift::String address)
{
  Swift::String_optional *v2;
  SiriMailUIModel::_SiriMailMessage::Account result;

  *v2 = name;
  v2[1].value = address;
  result.address = address;
  result.name = name;
  return result;
}

uint64_t _SiriMailMessage.Account.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v4 = sub_2468F4B4C();
  v6 = v5;
  v7 = sub_2468F4B58();
  v9 = v8;
  v10 = sub_2468F4B64();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
  *a2 = v4;
  a2[1] = v6;
  a2[2] = v7;
  a2[3] = v9;
  return result;
}

uint64_t static _SiriMailMessage.Account.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  char v11;

  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v6 = a2[1];
  v7 = a2[2];
  v8 = a2[3];
  if (!v3)
  {
    if (!v6)
    {
LABEL_11:
      if (v4 == v7 && v5 == v8)
        return 1;
      OUTLINED_FUNCTION_8();
      return sub_2468F4CA8();
    }
    return 0;
  }
  if (!v6)
    return 0;
  if (*a1 == *a2 && v3 == v6)
    goto LABEL_11;
  OUTLINED_FUNCTION_11();
  result = OUTLINED_FUNCTION_14();
  if ((v11 & 1) != 0)
    goto LABEL_11;
  return result;
}

uint64_t _SiriMailMessage.Account.hash(into:)()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8))
  {
    sub_2468F4CCC();
    OUTLINED_FUNCTION_81();
    sub_2468F4BD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2468F4CCC();
  }
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_90();
  return swift_bridgeObjectRelease();
}

BOOL sub_2468E9CE4(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2468E9CF4()
{
  return sub_2468F4CC0();
}

uint64_t sub_2468E9D18(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_2468F4CA8() & 1) != 0)
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
    v7 = sub_2468F4CA8();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2468E9DF4()
{
  return 2;
}

uint64_t sub_2468E9DFC()
{
  sub_2468F4CB4();
  sub_2468F4CC0();
  return sub_2468F4CD8();
}

uint64_t sub_2468E9E40(char a1)
{
  if ((a1 & 1) != 0)
    return 0x73736572646461;
  else
    return 1701667182;
}

BOOL sub_2468E9E70(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2468E9CE4(*a1, *a2);
}

uint64_t sub_2468E9E7C()
{
  return sub_2468E9DFC();
}

uint64_t sub_2468E9E84()
{
  return sub_2468E9CF4();
}

uint64_t sub_2468E9E8C()
{
  sub_2468F4CB4();
  sub_2468F4CC0();
  return sub_2468F4CD8();
}

uint64_t sub_2468E9ECC()
{
  char *v0;

  return sub_2468E9E40(*v0);
}

uint64_t sub_2468E9ED4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2468E9D18(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2468E9EF8()
{
  return sub_2468EA7BC();
}

uint64_t sub_2468E9F14@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2468E9DF4();
  *a1 = result;
  return result;
}

uint64_t sub_2468E9F38()
{
  sub_2468EA0EC();
  return sub_2468F4CFC();
}

uint64_t sub_2468E9F60()
{
  sub_2468EA0EC();
  return sub_2468F4D08();
}

void _SiriMailMessage.Account.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_37();
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBEA0);
  v5 = *(_QWORD *)(v4 - 8);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_36();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2468EA0EC();
  sub_2468F4CF0();
  OUTLINED_FUNCTION_100();
  sub_2468F4C78();
  if (!v0)
    sub_2468F4C90();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v4);
  OUTLINED_FUNCTION_4();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24956236C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

unint64_t sub_2468EA0EC()
{
  unint64_t result;

  result = qword_2575EBEA8;
  if (!qword_2575EBEA8)
  {
    result = MEMORY[0x249562384](&unk_2468F6504, &type metadata for _SiriMailMessage.Account.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EBEA8);
  }
  return result;
}

uint64_t _SiriMailMessage.Account.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  OUTLINED_FUNCTION_48();
  sub_2468F4CCC();
  if (v1)
  {
    OUTLINED_FUNCTION_81();
    sub_2468F4BD0();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_88();
  return OUTLINED_FUNCTION_47();
}

void _SiriMailMessage.Account.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;

  OUTLINED_FUNCTION_37();
  v2 = v1;
  v4 = v3;
  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2575EBEB0) - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_53();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_2468EA0EC();
  sub_2468F4CE4();
  if (v0)
  {
    OUTLINED_FUNCTION_71();
  }
  else
  {
    v6 = sub_2468F4C30();
    v8 = v7;
    OUTLINED_FUNCTION_58();
    v9 = sub_2468F4C48();
    v11 = v10;
    v12 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    v13 = v9;
    OUTLINED_FUNCTION_38(v12);
    *v4 = v6;
    v4[1] = v8;
    v4[2] = v13;
    v4[3] = v11;
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_75();
    OUTLINED_FUNCTION_77();
  }
  OUTLINED_FUNCTION_4();
}

void sub_2468EA2F0()
{
  _SiriMailMessage.Account.init(from:)();
}

void sub_2468EA304()
{
  _SiriMailMessage.Account.encode(to:)();
}

uint64_t sub_2468EA324()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_2468F4CB4();
  sub_2468F4CCC();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_2468F4BD0();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  sub_2468F4BD0();
  swift_bridgeObjectRelease();
  return sub_2468F4CD8();
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

void _SiriMailMessage.MailAttachment.data.getter()
{
  uint64_t v0;
  unint64_t v1;

  v0 = OUTLINED_FUNCTION_8();
  sub_2468EA40C(v0, v1);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

uint64_t sub_2468EA40C(uint64_t a1, unint64_t a2)
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

void _SiriMailMessage.MailAttachment.mimeType.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.MailAttachment.filename.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.MailAttachment.contentID.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

uint64_t _SiriMailMessage.MailAttachment.init(data:mimeType:filename:contentID:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

uint64_t static _SiriMailMessage.MailAttachment.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
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
  BOOL v12;
  uint64_t result;
  char v14;
  BOOL v15;
  char v16;
  uint64_t v18;
  uint64_t v19;

  v2 = a1[2];
  v3 = a1[3];
  v4 = a1[4];
  v5 = a1[5];
  v18 = a1[7];
  v19 = a1[6];
  v6 = a2[2];
  v7 = a2[3];
  v8 = a2[4];
  v9 = a2[5];
  v10 = a2[6];
  v11 = a2[7];
  if ((MEMORY[0x249562198](*a1, a1[1], *a2, a2[1]) & 1) == 0)
    return 0;
  v12 = v2 == v6 && v3 == v7;
  if (v12 || (OUTLINED_FUNCTION_100(), OUTLINED_FUNCTION_11(), result = OUTLINED_FUNCTION_14(), (v14 & 1) != 0))
  {
    v15 = v4 == v8 && v5 == v9;
    if (v15 || (OUTLINED_FUNCTION_11(), result = OUTLINED_FUNCTION_14(), (v16 & 1) != 0))
    {
      if (v19 == v10 && v18 == v11)
        return 1;
      else
        return sub_2468F4CA8();
    }
  }
  return result;
}

BOOL sub_2468EA5D0(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_2468EA5E0()
{
  return sub_2468F4CC0();
}

uint64_t sub_2468EA604(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  char v9;

  v2 = a1 == 1635017060 && a2 == 0xE400000000000000;
  if (v2 || (sub_2468F4CA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x65707954656D696DLL && a2 == 0xE800000000000000;
    if (v6 || (sub_2468F4CA8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x656D616E656C6966 && a2 == 0xE800000000000000;
      if (v7 || (sub_2468F4CA8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x49746E65746E6F63 && a2 == 0xE900000000000044)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v9 = sub_2468F4CA8();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t sub_2468EA7B4()
{
  return 4;
}

uint64_t sub_2468EA7BC()
{
  return 0;
}

uint64_t sub_2468EA7C8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2468EA7F4 + 4 * byte_2468F4F6E[a1]))(1635017060, 0xE400000000000000);
}

uint64_t sub_2468EA7F4()
{
  return 0x65707954656D696DLL;
}

uint64_t sub_2468EA80C()
{
  return 0x656D616E656C6966;
}

uint64_t sub_2468EA824()
{
  return 0x49746E65746E6F63;
}

BOOL sub_2468EA840(char *a1, char *a2)
{
  return sub_2468EA5D0(*a1, *a2);
}

void sub_2468EA84C()
{
  sub_2468EFAB0();
}

uint64_t sub_2468EA864()
{
  return sub_2468EA5E0();
}

uint64_t sub_2468EA870()
{
  unsigned __int8 *v0;

  return sub_2468EA7C8(*v0);
}

uint64_t sub_2468EA878@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2468EA604(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2468EA89C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2468EA7B4();
  *a1 = result;
  return result;
}

uint64_t sub_2468EA8C0()
{
  sub_2468EAA64();
  return sub_2468F4CFC();
}

uint64_t sub_2468EA8E8()
{
  sub_2468EAA64();
  return sub_2468F4D08();
}

void _SiriMailMessage.MailAttachment.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_37();
  v3 = v2;
  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2575EBEB8) - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_36();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2468EAA64();
  sub_2468F4CF0();
  sub_2468EAAA0();
  OUTLINED_FUNCTION_97();
  if (!v0)
  {
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_100();
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_64();
  }
  OUTLINED_FUNCTION_49(v1, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_4();
}

unint64_t sub_2468EAA64()
{
  unint64_t result;

  result = qword_2575EBEC0;
  if (!qword_2575EBEC0)
  {
    result = MEMORY[0x249562384](&unk_2468F64B4, &type metadata for _SiriMailMessage.MailAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EBEC0);
  }
  return result;
}

unint64_t sub_2468EAAA0()
{
  unint64_t result;

  result = qword_2575EBEC8;
  if (!qword_2575EBEC8)
  {
    result = MEMORY[0x249562384](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2575EBEC8);
  }
  return result;
}

void _SiriMailMessage.MailAttachment.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t *v4;
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
  unint64_t v21;

  OUTLINED_FUNCTION_37();
  v2 = v1;
  v4 = v3;
  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2575EBED0) - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_73();
  v8 = v7 - v6;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_2468EAA64();
  sub_2468F4CE4();
  if (v0)
  {
    OUTLINED_FUNCTION_71();
  }
  else
  {
    sub_2468EAD50();
    sub_2468F4C54();
    sub_2468EA40C(v20, v21);
    v9 = OUTLINED_FUNCTION_76();
    v19 = v10;
    v17 = v9;
    OUTLINED_FUNCTION_58();
    v16 = sub_2468F4C48();
    v12 = v11;
    OUTLINED_FUNCTION_58();
    v13 = OUTLINED_FUNCTION_76();
    v15 = v14;
    v18 = v13;
    OUTLINED_FUNCTION_28(v8, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
    sub_2468EA40C(v20, v21);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_99();
    *v4 = v20;
    v4[1] = v21;
    v4[2] = v17;
    v4[3] = v19;
    v4[4] = v16;
    v4[5] = v12;
    v4[6] = v18;
    v4[7] = v15;
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_99();
    OUTLINED_FUNCTION_75();
    OUTLINED_FUNCTION_69();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_4();
}

unint64_t sub_2468EAD50()
{
  unint64_t result;

  result = qword_2575EBED8;
  if (!qword_2575EBED8)
  {
    result = MEMORY[0x249562384](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2575EBED8);
  }
  return result;
}

uint64_t sub_2468EAD8C(uint64_t a1, unint64_t a2)
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

void sub_2468EADD0()
{
  _SiriMailMessage.MailAttachment.init(from:)();
}

void sub_2468EADE4()
{
  _SiriMailMessage.MailAttachment.encode(to:)();
}

SiriMailUIModel::_SiriMailMessage::State_optional __swiftcall _SiriMailMessage.State.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  SiriMailUIModel::_SiriMailMessage::State_optional result;

  sub_2468EAFC4(v1);
  return result;
}

uint64_t _SiriMailMessage.State.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2468EAE34 + 4 * byte_2468F4F72[*v0]))(0x7466617264, 0xE500000000000000);
}

uint64_t sub_2468EAE34()
{
  return 0x676E69646E6573;
}

uint64_t sub_2468EAE4C()
{
  return 1953391987;
}

uint64_t sub_2468EAE5C()
{
  return 0x656C6C65636E6163;
}

uint64_t sub_2468EAE78()
{
  return 0x64656C696166;
}

void sub_2468EAE8C(char *a1)
{
  sub_2468E9594(*a1);
}

void sub_2468EAE98()
{
  sub_2468E97B4();
}

void sub_2468EAEB8(uint64_t a1)
{
  char *v1;

  sub_2468E9848(a1, *v1);
}

void sub_2468EAEC0()
{
  sub_2468E9978();
}

SiriMailUIModel::_SiriMailMessage::State_optional sub_2468EAEE0(Swift::String *a1)
{
  return _SiriMailMessage.State.init(rawValue:)(*a1);
}

uint64_t sub_2468EAEEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = _SiriMailMessage.State.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2468EAF10()
{
  sub_2468F45AC();
  return sub_2468F4BE8();
}

uint64_t sub_2468EAF6C()
{
  sub_2468F45AC();
  return sub_2468F4BDC();
}

SiriMailUIModel::_SiriMailMessage::Field_optional __swiftcall _SiriMailMessage.Field.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  SiriMailUIModel::_SiriMailMessage::Field_optional result;

  sub_2468EAFC4(v1);
  return result;
}

void sub_2468EAFC4(char *a1@<X8>)
{
  unint64_t v2;
  char v3;

  v2 = sub_2468F4C0C();
  OUTLINED_FUNCTION_88();
  v3 = 5;
  if (v2 < 5)
    v3 = v2;
  *a1 = v3;
  OUTLINED_FUNCTION_13();
}

uint64_t _SiriMailMessage.Field.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2468EB030 + 4 * byte_2468F4F77[*v0]))(28532, 0xE200000000000000);
}

uint64_t sub_2468EB030()
{
  return 25443;
}

uint64_t sub_2468EB038()
{
  return 6513506;
}

uint64_t sub_2468EB048()
{
  return 0x7463656A627573;
}

uint64_t sub_2468EB060()
{
  return 2036625250;
}

void sub_2468EB070(char *a1)
{
  sub_2468E9470(*a1);
}

void sub_2468EB07C()
{
  sub_2468E97B4();
}

void sub_2468EB09C(uint64_t a1)
{
  char *v1;

  sub_2468E98F0(a1, *v1);
}

void sub_2468EB0A4()
{
  sub_2468E9978();
}

SiriMailUIModel::_SiriMailMessage::Field_optional sub_2468EB0C4(Swift::String *a1)
{
  return _SiriMailMessage.Field.init(rawValue:)(*a1);
}

uint64_t sub_2468EB0D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = _SiriMailMessage.Field.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2468EB0F4()
{
  sub_2468F4570();
  return sub_2468F4BE8();
}

uint64_t sub_2468EB150()
{
  sub_2468F4570();
  return sub_2468F4BDC();
}

SiriMailUIModel::_SiriMailMessage::Action_optional __swiftcall _SiriMailMessage.Action.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  char v4;
  SiriMailUIModel::_SiriMailMessage::Action_optional result;

  v2 = v1;
  v3 = sub_2468F4C0C();
  OUTLINED_FUNCTION_88();
  if (v3 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v3)
    v4 = 0;
  *v2 = v4;
  OUTLINED_FUNCTION_13();
  return result;
}

uint64_t _SiriMailMessage.Action.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6C65636E6163;
  else
    return 1684956531;
}

uint64_t sub_2468EB220(uint64_t a1, uint64_t a2)
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
  char v15;

  v2 = a1 == 0x6470556C65646F6DLL && a2 == 0xEB00000000657461;
  if (v2 || (sub_2468F4CA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x7463656A627573 && a2 == 0xE700000000000000;
    if (v6 || (sub_2468F4CA8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 2036625250 && a2 == 0xE400000000000000;
      if (v7 || (sub_2468F4CA8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x656D686361747461 && a2 == 0xEB0000000073746ELL;
        if (v8 || (sub_2468F4CA8() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 28532 && a2 == 0xE200000000000000;
          if (v9 || (sub_2468F4CA8() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 25443 && a2 == 0xE200000000000000;
            if (v10 || (sub_2468F4CA8() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              v11 = a1 == 6513506 && a2 == 0xE300000000000000;
              if (v11 || (sub_2468F4CA8() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                v12 = a1 == 0x4664657375636F66 && a2 == 0xEC000000646C6569;
                if (v12 || (sub_2468F4CA8() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else
                {
                  v13 = a1 == 0x6E6F69746361 && a2 == 0xE600000000000000;
                  if (v13 || (sub_2468F4CA8() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 8;
                  }
                  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
                  {
                    swift_bridgeObjectRelease();
                    return 9;
                  }
                  else
                  {
                    v15 = sub_2468F4CA8();
                    swift_bridgeObjectRelease();
                    if ((v15 & 1) != 0)
                      return 9;
                    else
                      return 10;
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

uint64_t sub_2468EB5FC()
{
  return 10;
}

uint64_t sub_2468EB604(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2468EB640 + 4 * byte_2468F4F7C[a1]))(0x6470556C65646F6DLL, 0xEB00000000657461);
}

uint64_t sub_2468EB640()
{
  return 0x7463656A627573;
}

uint64_t sub_2468EB658()
{
  return 2036625250;
}

uint64_t sub_2468EB668()
{
  return 0x656D686361747461;
}

uint64_t sub_2468EB688()
{
  return 28532;
}

uint64_t sub_2468EB694()
{
  return 25443;
}

uint64_t sub_2468EB6A0()
{
  return 6513506;
}

uint64_t sub_2468EB6B0()
{
  return 0x4664657375636F66;
}

uint64_t sub_2468EB6D0()
{
  return 0x6E6F69746361;
}

uint64_t sub_2468EB6E4()
{
  return 0x6574617473;
}

uint64_t sub_2468EB6F8()
{
  return sub_2468F4CC0();
}

uint64_t sub_2468EB71C()
{
  return 12383;
}

uint64_t sub_2468EB728(uint64_t a1, uint64_t a2)
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
    v3 = OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_88();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_2468EB78C()
{
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_27();
}

uint64_t sub_2468EB7B0(char *a1, char *a2)
{
  return sub_2468E96F4(*a1, *a2);
}

uint64_t sub_2468EB7BC()
{
  return sub_2468E97E0();
}

uint64_t sub_2468EB7C4()
{
  return sub_2468E97FC();
}

uint64_t sub_2468EB7CC()
{
  return sub_2468E99A4();
}

SiriMailUIModel::_SiriMailMessage::Action_optional sub_2468EB7D4(Swift::String *a1)
{
  return _SiriMailMessage.Action.init(rawValue:)(*a1);
}

uint64_t sub_2468EB7E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = _SiriMailMessage.Action.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2468EB804()
{
  sub_2468F4534();
  return sub_2468F4BE8();
}

uint64_t sub_2468EB860()
{
  sub_2468F4534();
  return sub_2468F4BDC();
}

void sub_2468EB8AC()
{
  sub_2468EB78C();
}

uint64_t sub_2468EB8CC()
{
  sub_2468EC540();
  return sub_2468F4CFC();
}

uint64_t sub_2468EB8F4()
{
  sub_2468EC540();
  return sub_2468F4D08();
}

uint64_t sub_2468EB91C()
{
  sub_2468EC764();
  return sub_2468F4CFC();
}

uint64_t sub_2468EB944()
{
  sub_2468EC764();
  return sub_2468F4D08();
}

uint64_t sub_2468EB96C()
{
  sub_2468EC630();
  return sub_2468F4CFC();
}

uint64_t sub_2468EB994()
{
  sub_2468EC630();
  return sub_2468F4D08();
}

uint64_t sub_2468EB9BC()
{
  sub_2468EC7DC();
  return sub_2468F4CFC();
}

uint64_t sub_2468EB9E4()
{
  sub_2468EC7DC();
  return sub_2468F4D08();
}

uint64_t sub_2468EBA0C()
{
  sub_2468EC6EC();
  return sub_2468F4CFC();
}

uint64_t sub_2468EBA34()
{
  sub_2468EC6EC();
  return sub_2468F4D08();
}

uint64_t sub_2468EBA5C()
{
  unsigned __int8 *v0;

  return sub_2468EB604(*v0);
}

uint64_t sub_2468EBA64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2468EB220(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2468EBA88@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2468EB5FC();
  *a1 = result;
  return result;
}

uint64_t sub_2468EBAAC()
{
  sub_2468EC480();
  return sub_2468F4CFC();
}

uint64_t sub_2468EBAD4()
{
  sub_2468EC480();
  return sub_2468F4D08();
}

uint64_t sub_2468EBAFC()
{
  sub_2468EC5B8();
  return sub_2468F4CFC();
}

uint64_t sub_2468EBB24()
{
  sub_2468EC5B8();
  return sub_2468F4D08();
}

uint64_t sub_2468EBB4C()
{
  sub_2468EC864();
  return sub_2468F4CFC();
}

uint64_t sub_2468EBB74()
{
  sub_2468EC864();
  return sub_2468F4D08();
}

uint64_t sub_2468EBB9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2468EB728(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2468EBBC4()
{
  return sub_2468EA7BC();
}

uint64_t sub_2468EBBDC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2468E9788();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2468EBC04()
{
  sub_2468EC4C8();
  return sub_2468F4CFC();
}

uint64_t sub_2468EBC2C()
{
  sub_2468EC4C8();
  return sub_2468F4D08();
}

uint64_t sub_2468EBC54()
{
  sub_2468EC828();
  return sub_2468F4CFC();
}

uint64_t sub_2468EBC7C()
{
  sub_2468EC828();
  return sub_2468F4D08();
}

void sub_2468EBCA4()
{
  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_27();
}

uint64_t sub_2468EBCC8()
{
  sub_2468EC728();
  return sub_2468F4CFC();
}

uint64_t sub_2468EBCF0()
{
  sub_2468EC728();
  return sub_2468F4D08();
}

void _SiriMailMessage.StateChange.encode(to:)()
{
  void *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  _BYTE v4[328];
  _BYTE v5[336];

  OUTLINED_FUNCTION_37();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBEE0);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_78(v1, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBEE8);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBEF0);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBEF8);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBF00);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBF08);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBF10);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBF18);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBF20);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_36();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBF28);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_53();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBF30);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_73();
  sub_2468EC46C(v0, v4);
  OUTLINED_FUNCTION_96();
  sub_2468F4CF0();
  sub_2468EC46C(v4, v5);
  v2 = (char *)sub_2468EBFAC + 4 * word_2468F4F86[sub_2468EC4BC((uint64_t)v5)];
  __asm { BR              X10 }
}

void sub_2468EBFAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void *v6;

  v6 = (const void *)OUTLINED_FUNCTION_93();
  *(_BYTE *)(v0 + 240) = 0;
  sub_2468EC864();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_91((void *)(v0 + 240), v6);
  sub_2468EC8A0();
  OUTLINED_FUNCTION_56();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 216) + 8))(v2, v1);
  OUTLINED_FUNCTION_4();
}

void *sub_2468EC46C(void *__src, void *__dst)
{
  return memcpy(__dst, __src, 0x142uLL);
}

unint64_t sub_2468EC480()
{
  unint64_t result;

  result = qword_2575EBF38;
  if (!qword_2575EBF38)
  {
    result = MEMORY[0x249562384](&unk_2468F6464, &type metadata for _SiriMailMessage.StateChange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EBF38);
  }
  return result;
}

uint64_t sub_2468EC4BC(uint64_t a1)
{
  return *(_WORD *)(a1 + 320) >> 4;
}

unint64_t sub_2468EC4C8()
{
  unint64_t result;

  result = qword_2575EBF40;
  if (!qword_2575EBF40)
  {
    result = MEMORY[0x249562384](&unk_2468F6414, &type metadata for _SiriMailMessage.StateChange.StateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EBF40);
  }
  return result;
}

unint64_t sub_2468EC504()
{
  unint64_t result;

  result = qword_2575EBF48;
  if (!qword_2575EBF48)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage.State, &type metadata for _SiriMailMessage.State);
    atomic_store(result, (unint64_t *)&qword_2575EBF48);
  }
  return result;
}

unint64_t sub_2468EC540()
{
  unint64_t result;

  result = qword_2575EBF50;
  if (!qword_2575EBF50)
  {
    result = MEMORY[0x249562384](&unk_2468F63C4, &type metadata for _SiriMailMessage.StateChange.ActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EBF50);
  }
  return result;
}

unint64_t sub_2468EC57C()
{
  unint64_t result;

  result = qword_2575EBF58;
  if (!qword_2575EBF58)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage.Action, &type metadata for _SiriMailMessage.Action);
    atomic_store(result, (unint64_t *)&qword_2575EBF58);
  }
  return result;
}

unint64_t sub_2468EC5B8()
{
  unint64_t result;

  result = qword_2575EBF60;
  if (!qword_2575EBF60)
  {
    result = MEMORY[0x249562384](&unk_2468F6374, &type metadata for _SiriMailMessage.StateChange.FocusedFieldCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EBF60);
  }
  return result;
}

unint64_t sub_2468EC5F4()
{
  unint64_t result;

  result = qword_2575EBF68;
  if (!qword_2575EBF68)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage.Field, &type metadata for _SiriMailMessage.Field);
    atomic_store(result, (unint64_t *)&qword_2575EBF68);
  }
  return result;
}

unint64_t sub_2468EC630()
{
  unint64_t result;

  result = qword_2575EBF70;
  if (!qword_2575EBF70)
  {
    result = MEMORY[0x249562384](&unk_2468F6324, &type metadata for _SiriMailMessage.StateChange.BccCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EBF70);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249562378](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2468EC6B0()
{
  unint64_t result;

  result = qword_2575EBF88;
  if (!qword_2575EBF88)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage.Account, &type metadata for _SiriMailMessage.Account);
    atomic_store(result, (unint64_t *)&qword_2575EBF88);
  }
  return result;
}

unint64_t sub_2468EC6EC()
{
  unint64_t result;

  result = qword_2575EBF90;
  if (!qword_2575EBF90)
  {
    result = MEMORY[0x249562384](&unk_2468F62D4, &type metadata for _SiriMailMessage.StateChange.CcCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EBF90);
  }
  return result;
}

unint64_t sub_2468EC728()
{
  unint64_t result;

  result = qword_2575EBF98;
  if (!qword_2575EBF98)
  {
    result = MEMORY[0x249562384](&unk_2468F6284, &type metadata for _SiriMailMessage.StateChange.ToCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EBF98);
  }
  return result;
}

unint64_t sub_2468EC764()
{
  unint64_t result;

  result = qword_2575EBFA0;
  if (!qword_2575EBFA0)
  {
    result = MEMORY[0x249562384](&unk_2468F6234, &type metadata for _SiriMailMessage.StateChange.AttachmentsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EBFA0);
  }
  return result;
}

unint64_t sub_2468EC7A0()
{
  unint64_t result;

  result = qword_2575EBFB8;
  if (!qword_2575EBFB8)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage.MailAttachment, &type metadata for _SiriMailMessage.MailAttachment);
    atomic_store(result, (unint64_t *)&qword_2575EBFB8);
  }
  return result;
}

unint64_t sub_2468EC7DC()
{
  unint64_t result;

  result = qword_2575EBFC0;
  if (!qword_2575EBFC0)
  {
    result = MEMORY[0x249562384](&unk_2468F61E4, &type metadata for _SiriMailMessage.StateChange.BodyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EBFC0);
  }
  return result;
}

uint64_t sub_2468EC818(uint64_t result)
{
  *(_WORD *)(result + 320) &= 0xFF0Fu;
  return result;
}

unint64_t sub_2468EC828()
{
  unint64_t result;

  result = qword_2575EBFC8;
  if (!qword_2575EBFC8)
  {
    result = MEMORY[0x249562384](&unk_2468F6194, &type metadata for _SiriMailMessage.StateChange.SubjectCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EBFC8);
  }
  return result;
}

unint64_t sub_2468EC864()
{
  unint64_t result;

  result = qword_2575EBFD0;
  if (!qword_2575EBFD0)
  {
    result = MEMORY[0x249562384](&unk_2468F6144, &type metadata for _SiriMailMessage.StateChange.ModelUpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EBFD0);
  }
  return result;
}

unint64_t sub_2468EC8A0()
{
  unint64_t result;

  result = qword_2575EBFD8;
  if (!qword_2575EBFD8)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage, &type metadata for _SiriMailMessage);
    atomic_store(result, (unint64_t *)&qword_2575EBFD8);
  }
  return result;
}

void _SiriMailMessage.StateChange.init(from:)()
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
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  OUTLINED_FUNCTION_37();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBFE0);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBFE8);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBFF0);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBFF8);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EC000);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EC008);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EC010);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EC018);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_78(v3, v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EC020);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EC028);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_53();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575EC030);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_73();
  v8 = v7 - v6;
  OUTLINED_FUNCTION_96();
  sub_2468F4CE4();
  if (!v0)
  {
    v20 = v5;
    v21 = v4;
    v9 = sub_2468F4C60();
    v10 = *(_QWORD *)(v9 + 16);
    if (v10)
    {
      v11 = *(unsigned __int8 *)(v9 + 32);
      sub_2468F1384(1, v10, v9, v9 + 32, 0, (2 * v10) | 1);
      v13 = v12;
      v15 = v14;
      OUTLINED_FUNCTION_30();
      if (v13 == v15 >> 1)
        __asm { BR              X9 }
    }
    v16 = sub_2468F4C00();
    swift_allocError();
    v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575EC038);
    *v18 = &type metadata for _SiriMailMessage.StateChange;
    sub_2468F4C24();
    sub_2468F4BF4();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x24BEE26D0], v16);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v8, v21);
  }
  __swift_destroy_boxed_opaque_existential_1(v2);
  OUTLINED_FUNCTION_4();
}

void sub_2468ECD48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  *(_BYTE *)(v0 + 600) = 1;
  sub_2468EC828();
  v4 = *(_QWORD *)(v3 - 72);
  OUTLINED_FUNCTION_6();
  if (v1)
  {
    OUTLINED_FUNCTION_80();
    JUMPOUT(0x2468ECD28);
  }
  *(_QWORD *)(v0 + 256) = OUTLINED_FUNCTION_94();
  v5 = *(_QWORD *)(v0 + 24);
  OUTLINED_FUNCTION_40(*(_QWORD *)(v0 + 40));
  OUTLINED_FUNCTION_61();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  v6 = OUTLINED_FUNCTION_95();
  sub_2468F1634((uint64_t)v6);
  JUMPOUT(0x2468ED380);
}

void sub_2468ECD90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  *(_BYTE *)(v0 + 600) = 2;
  sub_2468EC7DC();
  OUTLINED_FUNCTION_6();
  if (!v1)
  {
    *(_QWORD *)(v0 + 256) = OUTLINED_FUNCTION_94();
    v3 = *(_QWORD *)(v0 + 24);
    OUTLINED_FUNCTION_40(*(_QWORD *)(v0 + 48));
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_49(v2, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    v4 = OUTLINED_FUNCTION_95();
    sub_2468F1620((uint64_t)v4);
    JUMPOUT(0x2468ED380);
  }
  OUTLINED_FUNCTION_80();
  JUMPOUT(0x2468ECD2CLL);
}

void sub_2468ECE00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v0 + 600) = 3;
  sub_2468EC764();
  OUTLINED_FUNCTION_6();
  if (!v1)
  {
    OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_42(&qword_2575EC068, v2, (uint64_t (*)(void))sub_2468F15D0, MEMORY[0x24BEE12D0]);
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_31(*(_QWORD *)(v0 + 56));
    OUTLINED_FUNCTION_61();
    OUTLINED_FUNCTION_41();
    v3 = OUTLINED_FUNCTION_68();
    sub_2468F160C(v3);
    JUMPOUT(0x2468ED380);
  }
  OUTLINED_FUNCTION_80();
  JUMPOUT(0x2468ED168);
}

void sub_2468ECE84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v0 + 600) = 4;
  sub_2468EC728();
  OUTLINED_FUNCTION_6();
  if (!v1)
  {
    OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_42(&qword_2575EC058, v2, (uint64_t (*)(void))sub_2468F14F0, MEMORY[0x24BEE12D0]);
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_31(*(_QWORD *)(v0 + 64));
    OUTLINED_FUNCTION_61();
    OUTLINED_FUNCTION_41();
    v3 = OUTLINED_FUNCTION_68();
    sub_2468F1558(v3);
    JUMPOUT(0x2468ED380);
  }
  OUTLINED_FUNCTION_80();
  JUMPOUT(0x2468ED168);
}

void sub_2468ECF08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v0 + 600) = 5;
  sub_2468EC6EC();
  OUTLINED_FUNCTION_6();
  if (!v1)
  {
    OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_42(&qword_2575EC058, v2, (uint64_t (*)(void))sub_2468F14F0, MEMORY[0x24BEE12D0]);
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_31(*(_QWORD *)(v0 + 72));
    OUTLINED_FUNCTION_61();
    OUTLINED_FUNCTION_41();
    v3 = OUTLINED_FUNCTION_68();
    sub_2468F1540(v3);
    JUMPOUT(0x2468ED380);
  }
  OUTLINED_FUNCTION_80();
  JUMPOUT(0x2468ED168);
}

void sub_2468ECF88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v0 + 600) = 6;
  sub_2468EC630();
  OUTLINED_FUNCTION_6();
  if (v1)
    JUMPOUT(0x2468ECFC0);
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_42(&qword_2575EC058, v2, (uint64_t (*)(void))sub_2468F14F0, MEMORY[0x24BEE12D0]);
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_31(*(_QWORD *)(v0 + 80));
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_41();
  v3 = OUTLINED_FUNCTION_68();
  sub_2468F152C(v3);
  JUMPOUT(0x2468ED380);
}

void sub_2468ECFD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v0 + 600) = 7;
  sub_2468EC5B8();
  OUTLINED_FUNCTION_6();
  if (!v1)
  {
    sub_2468F14A0();
    sub_2468F4C3C();
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_38(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 88) + 8));
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_63();
    v2 = OUTLINED_FUNCTION_83();
    sub_2468F14DC(v2);
    JUMPOUT(0x2468ED380);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x2468ECD2CLL);
}

void sub_2468ED3A0()
{
  _SiriMailMessage.StateChange.init(from:)();
}

void sub_2468ED3B4()
{
  _SiriMailMessage.StateChange.encode(to:)();
}

uint64_t _SiriMailMessage.to.getter()
{
  return swift_bridgeObjectRetain();
}

void _SiriMailMessage.to.setter(uint64_t a1)
{
  _QWORD *v1;

  swift_bridgeObjectRelease();
  *v1 = a1;
  OUTLINED_FUNCTION_10();
}

uint64_t (*_SiriMailMessage.to.modify())()
{
  return nullsub_1;
}

void _SiriMailMessage.subject.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.subject.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = v2;
  *(_QWORD *)(v1 + 16) = v0;
  OUTLINED_FUNCTION_13();
}

uint64_t (*_SiriMailMessage.subject.modify())()
{
  return nullsub_1;
}

void _SiriMailMessage.body.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.body.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = v2;
  *(_QWORD *)(v1 + 32) = v0;
  OUTLINED_FUNCTION_13();
}

uint64_t (*_SiriMailMessage.body.modify())()
{
  return nullsub_1;
}

uint64_t _SiriMailMessage.cc.getter()
{
  return swift_bridgeObjectRetain();
}

void _SiriMailMessage.cc.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 40) = a1;
  OUTLINED_FUNCTION_10();
}

uint64_t (*_SiriMailMessage.cc.modify())()
{
  return nullsub_1;
}

uint64_t _SiriMailMessage.bcc.getter()
{
  return swift_bridgeObjectRetain();
}

void _SiriMailMessage.bcc.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = a1;
  OUTLINED_FUNCTION_10();
}

uint64_t (*_SiriMailMessage.bcc.modify())()
{
  return nullsub_1;
}

uint64_t _SiriMailMessage.attachments.getter()
{
  return swift_bridgeObjectRetain();
}

void _SiriMailMessage.attachments.setter(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 56) = a1;
  OUTLINED_FUNCTION_10();
}

uint64_t (*_SiriMailMessage.attachments.modify())()
{
  return nullsub_1;
}

void _SiriMailMessage.replyReference.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.replyReference.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 64) = v2;
  *(_QWORD *)(v1 + 72) = v0;
  OUTLINED_FUNCTION_13();
}

uint64_t (*_SiriMailMessage.replyReference.modify())()
{
  return nullsub_1;
}

void _SiriMailMessage.toLabel.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.ccLabel.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.bccLabel.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.subjectLabel.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.subjectLabel.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 128) = v2;
  *(_QWORD *)(v1 + 136) = v0;
  OUTLINED_FUNCTION_13();
}

uint64_t (*_SiriMailMessage.subjectLabel.modify())()
{
  return nullsub_1;
}

void _SiriMailMessage.cancelLabel.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.cancelLabel.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 144) = v2;
  *(_QWORD *)(v1 + 152) = v0;
  OUTLINED_FUNCTION_13();
}

uint64_t (*_SiriMailMessage.cancelLabel.modify())()
{
  return nullsub_1;
}

void _SiriMailMessage.cancelledLabel.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.cancelledLabel.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 160) = v2;
  *(_QWORD *)(v1 + 168) = v0;
  OUTLINED_FUNCTION_13();
}

uint64_t (*_SiriMailMessage.cancelledLabel.modify())()
{
  return nullsub_1;
}

void _SiriMailMessage.sendLabel.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.sendLabel.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 176) = v2;
  *(_QWORD *)(v1 + 184) = v0;
  OUTLINED_FUNCTION_13();
}

uint64_t (*_SiriMailMessage.sendLabel.modify())()
{
  return nullsub_1;
}

void _SiriMailMessage.sentLabel.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.sentLabel.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 192) = v2;
  *(_QWORD *)(v1 + 200) = v0;
  OUTLINED_FUNCTION_13();
}

uint64_t (*_SiriMailMessage.sentLabel.modify())()
{
  return nullsub_1;
}

void _SiriMailMessage.messageLabel.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.messageLabel.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 208) = v2;
  *(_QWORD *)(v1 + 216) = v0;
  OUTLINED_FUNCTION_13();
}

uint64_t (*_SiriMailMessage.messageLabel.modify())()
{
  return nullsub_1;
}

void _SiriMailMessage.deleteLabel.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.replyLabel.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.nextLabel.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.seeAllLabel.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.moreInMailLabel.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.newMessageLabel.getter()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10();
}

void _SiriMailMessage.state.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 320);
}

_BYTE *_SiriMailMessage.state.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 320) = *result;
  return result;
}

uint64_t (*_SiriMailMessage.state.modify())()
{
  return nullsub_1;
}

void _SiriMailMessage.focusedField.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 321);
}

_BYTE *_SiriMailMessage.focusedField.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 321) = *result;
  return result;
}

uint64_t (*_SiriMailMessage.focusedField.modify())()
{
  return nullsub_1;
}

void __swiftcall _SiriMailMessage.init(toLabel:ccLabel:bccLabel:subjectLabel:cancelLabel:cancelledLabel:sendLabel:sentLabel:messageLabel:deleteLabel:replyLabel:nextLabel:seeAllLabel:moreInMailLabel:newMessageLabel:to:cc:bcc:subject:body:focusedField:attachments:state:replyReference:)(SiriMailUIModel::_SiriMailMessage *__return_ptr retstr, Swift::String toLabel, Swift::String ccLabel, Swift::String bccLabel, Swift::String subjectLabel, Swift::String cancelLabel, Swift::String cancelledLabel, Swift::String sendLabel, Swift::String sentLabel, Swift::String messageLabel, Swift::String deleteLabel, Swift::String replyLabel, Swift::String nextLabel, Swift::String seeAllLabel, Swift::String moreInMailLabel, Swift::String newMessageLabel, Swift::OpaquePointer to, Swift::OpaquePointer cc, Swift::OpaquePointer bcc, Swift::String_optional subject,Swift::String_optional body,SiriMailUIModel::_SiriMailMessage::Field_optional focusedField,Swift::OpaquePointer attachments,SiriMailUIModel::_SiriMailMessage::State state,Swift::String_optional replyReference)
{
  SiriMailUIModel::_SiriMailMessage::Field v25;
  SiriMailUIModel::_SiriMailMessage::State v26;

  v25 = *(_BYTE *)focusedField.value;
  v26 = *(_BYTE *)state;
  retstr->to = to;
  retstr->subject = subject;
  retstr->body = body;
  retstr->cc = cc;
  retstr->bcc = bcc;
  retstr->attachments = attachments;
  retstr->replyReference = replyReference;
  retstr->toLabel = toLabel;
  retstr->ccLabel = ccLabel;
  retstr->bccLabel = bccLabel;
  retstr->subjectLabel = subjectLabel;
  retstr->cancelLabel = cancelLabel;
  retstr->cancelledLabel = cancelledLabel;
  retstr->sendLabel = sendLabel;
  retstr->sentLabel = sentLabel;
  retstr->messageLabel = messageLabel;
  retstr->deleteLabel = deleteLabel;
  retstr->replyLabel = replyLabel;
  retstr->nextLabel = nextLabel;
  retstr->seeAllLabel = seeAllLabel;
  retstr->moreInMailLabel = moreInMailLabel;
  retstr->newMessageLabel = newMessageLabel;
  retstr->state = v26;
  retstr->focusedField.value = v25;
}

void __swiftcall _SiriMailMessage.init(to:cc:bcc:subject:body:focusedField:attachments:state:replyReference:newMessageLabel:)(SiriMailUIModel::_SiriMailMessage *__return_ptr retstr, Swift::OpaquePointer to, Swift::OpaquePointer cc, Swift::OpaquePointer bcc, Swift::String_optional subject, Swift::String_optional body, SiriMailUIModel::_SiriMailMessage::Field_optional focusedField, Swift::OpaquePointer attachments, SiriMailUIModel::_SiriMailMessage::State state, Swift::String_optional replyReference, Swift::String newMessageLabel)
{
  SiriMailUIModel::_SiriMailMessage::Field v11;
  SiriMailUIModel::_SiriMailMessage::State v12;

  v11 = *(_BYTE *)focusedField.value;
  v12 = *(_BYTE *)state;
  retstr->to = to;
  retstr->subject = subject;
  retstr->body = body;
  retstr->cc = cc;
  retstr->bcc = bcc;
  retstr->attachments = attachments;
  retstr->replyReference = replyReference;
  retstr->toLabel._countAndFlagsBits = 0;
  retstr->toLabel._object = (void *)0xE000000000000000;
  retstr->ccLabel._countAndFlagsBits = 0;
  retstr->ccLabel._object = (void *)0xE000000000000000;
  retstr->bccLabel._countAndFlagsBits = 0;
  retstr->bccLabel._object = (void *)0xE000000000000000;
  retstr->subjectLabel._countAndFlagsBits = 0;
  retstr->subjectLabel._object = (void *)0xE000000000000000;
  retstr->cancelLabel._countAndFlagsBits = 0;
  retstr->cancelLabel._object = (void *)0xE000000000000000;
  retstr->cancelledLabel._countAndFlagsBits = 0;
  retstr->cancelledLabel._object = (void *)0xE000000000000000;
  retstr->sendLabel._countAndFlagsBits = 0;
  retstr->sendLabel._object = (void *)0xE000000000000000;
  retstr->sentLabel._countAndFlagsBits = 0;
  retstr->sentLabel._object = (void *)0xE000000000000000;
  retstr->messageLabel._countAndFlagsBits = 0;
  retstr->messageLabel._object = (void *)0xE000000000000000;
  retstr->deleteLabel._countAndFlagsBits = 0;
  retstr->deleteLabel._object = (void *)0xE000000000000000;
  retstr->replyLabel._countAndFlagsBits = 0;
  retstr->replyLabel._object = (void *)0xE000000000000000;
  retstr->nextLabel._countAndFlagsBits = 0;
  retstr->nextLabel._object = (void *)0xE000000000000000;
  retstr->seeAllLabel._countAndFlagsBits = 0;
  retstr->seeAllLabel._object = (void *)0xE000000000000000;
  retstr->moreInMailLabel._countAndFlagsBits = 0;
  retstr->moreInMailLabel._object = (void *)0xE000000000000000;
  retstr->newMessageLabel = newMessageLabel;
  retstr->state = v12;
  retstr->focusedField.value = v11;
}

uint64_t static _SiriMailMessage.== infix(_:_:)(uint64_t a1, uint64_t a2)
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
  BOOL v12;
  uint64_t result;
  char v14;
  char v16;
  char v18;
  char v20;
  char v22;
  char v24;
  char v26;
  char v28;
  char v30;
  char v32;
  char v34;
  char v36;
  char v38;
  char v40;
  char v42;
  char v44;
  char v46;
  char v48;
  char v49;
  char v50;
  int v51;
  int v52;
  char v53;
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

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v120 = *(_QWORD *)(a1 + 48);
  v121 = *(_QWORD *)(a1 + 40);
  v119 = *(_QWORD *)(a1 + 56);
  v111 = *(_QWORD *)(a1 + 64);
  v117 = *(_QWORD *)(a1 + 72);
  v114 = *(_QWORD *)(a1 + 88);
  v115 = *(_QWORD *)(a1 + 80);
  v108 = *(_QWORD *)(a1 + 104);
  v109 = *(_QWORD *)(a1 + 96);
  v104 = *(_QWORD *)(a1 + 120);
  v105 = *(_QWORD *)(a1 + 112);
  v101 = *(_QWORD *)(a1 + 128);
  v100 = *(_QWORD *)(a1 + 136);
  v96 = *(_QWORD *)(a1 + 152);
  v97 = *(_QWORD *)(a1 + 144);
  v92 = *(_QWORD *)(a1 + 168);
  v93 = *(_QWORD *)(a1 + 160);
  v88 = *(_QWORD *)(a1 + 184);
  v89 = *(_QWORD *)(a1 + 176);
  v84 = *(_QWORD *)(a1 + 200);
  v85 = *(_QWORD *)(a1 + 192);
  v80 = *(_QWORD *)(a1 + 216);
  v81 = *(_QWORD *)(a1 + 208);
  v76 = *(_QWORD *)(a1 + 232);
  v77 = *(_QWORD *)(a1 + 224);
  v72 = *(_QWORD *)(a1 + 248);
  v73 = *(_QWORD *)(a1 + 240);
  v68 = *(_QWORD *)(a1 + 264);
  v69 = *(_QWORD *)(a1 + 256);
  v64 = *(_QWORD *)(a1 + 280);
  v65 = *(_QWORD *)(a1 + 272);
  v60 = *(_QWORD *)(a1 + 296);
  v61 = *(_QWORD *)(a1 + 288);
  v56 = *(_QWORD *)(a1 + 312);
  v57 = *(_QWORD *)(a1 + 304);
  v53 = *(_BYTE *)(a1 + 320);
  v52 = *(unsigned __int8 *)(a1 + 321);
  v6 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a2 + 40);
  v11 = *(_QWORD *)(a2 + 48);
  v118 = *(_QWORD *)(a2 + 56);
  v110 = *(_QWORD *)(a2 + 64);
  v116 = *(_QWORD *)(a2 + 72);
  v112 = *(_QWORD *)(a2 + 88);
  v113 = *(_QWORD *)(a2 + 80);
  v106 = *(_QWORD *)(a2 + 104);
  v107 = *(_QWORD *)(a2 + 96);
  v102 = *(_QWORD *)(a2 + 120);
  v103 = *(_QWORD *)(a2 + 112);
  v98 = *(_QWORD *)(a2 + 136);
  v99 = *(_QWORD *)(a2 + 128);
  v94 = *(_QWORD *)(a2 + 152);
  v95 = *(_QWORD *)(a2 + 144);
  v90 = *(_QWORD *)(a2 + 168);
  v91 = *(_QWORD *)(a2 + 160);
  v86 = *(_QWORD *)(a2 + 184);
  v87 = *(_QWORD *)(a2 + 176);
  v82 = *(_QWORD *)(a2 + 200);
  v83 = *(_QWORD *)(a2 + 192);
  v78 = *(_QWORD *)(a2 + 216);
  v79 = *(_QWORD *)(a2 + 208);
  v74 = *(_QWORD *)(a2 + 232);
  v75 = *(_QWORD *)(a2 + 224);
  v70 = *(_QWORD *)(a2 + 248);
  v71 = *(_QWORD *)(a2 + 240);
  v66 = *(_QWORD *)(a2 + 264);
  v67 = *(_QWORD *)(a2 + 256);
  v62 = *(_QWORD *)(a2 + 280);
  v63 = *(_QWORD *)(a2 + 272);
  v58 = *(_QWORD *)(a2 + 296);
  v59 = *(_QWORD *)(a2 + 288);
  v54 = *(_QWORD *)(a2 + 312);
  v55 = *(_QWORD *)(a2 + 304);
  v51 = *(unsigned __int8 *)(a2 + 321);
  if ((sub_2468EE07C(*(_QWORD *)a1, *(_QWORD *)a2) & 1) == 0)
    return 0;
  if (!v2)
  {
    if (v8)
      return 0;
    goto LABEL_11;
  }
  if (!v8)
    return 0;
  v12 = v3 == v6 && v2 == v8;
  if (v12 || (OUTLINED_FUNCTION_11(), result = OUTLINED_FUNCTION_14(), (v14 & 1) != 0))
  {
LABEL_11:
    if (v5)
    {
      if (!v9)
        return 0;
      if (v4 != v7 || v5 != v9)
      {
        OUTLINED_FUNCTION_11();
        result = OUTLINED_FUNCTION_14();
        if ((v16 & 1) == 0)
          return result;
      }
    }
    else if (v9)
    {
      return 0;
    }
    if ((sub_2468EE07C(v121, v10) & 1) == 0
      || (sub_2468EE07C(v120, v11) & 1) == 0
      || (sub_2468EE154(v119, v118) & 1) == 0)
    {
      return 0;
    }
    if (v117)
    {
      if (!v116)
        return 0;
      if (v111 != v110 || v117 != v116)
      {
        OUTLINED_FUNCTION_11();
        result = OUTLINED_FUNCTION_14();
        if ((v18 & 1) == 0)
          return result;
      }
    }
    else if (v116)
    {
      return 0;
    }
    if (v115 != v113 || v114 != v112)
    {
      OUTLINED_FUNCTION_11();
      result = OUTLINED_FUNCTION_14();
      if ((v20 & 1) == 0)
        return result;
    }
    if (v109 != v107 || v108 != v106)
    {
      OUTLINED_FUNCTION_11();
      result = OUTLINED_FUNCTION_14();
      if ((v22 & 1) == 0)
        return result;
    }
    if (v105 != v103 || v104 != v102)
    {
      OUTLINED_FUNCTION_11();
      result = OUTLINED_FUNCTION_14();
      if ((v24 & 1) == 0)
        return result;
    }
    if (v101 != v99 || v100 != v98)
    {
      OUTLINED_FUNCTION_11();
      result = OUTLINED_FUNCTION_14();
      if ((v26 & 1) == 0)
        return result;
    }
    if (v97 != v95 || v96 != v94)
    {
      OUTLINED_FUNCTION_11();
      result = OUTLINED_FUNCTION_14();
      if ((v28 & 1) == 0)
        return result;
    }
    if (v93 != v91 || v92 != v90)
    {
      OUTLINED_FUNCTION_11();
      result = OUTLINED_FUNCTION_14();
      if ((v30 & 1) == 0)
        return result;
    }
    if (v89 != v87 || v88 != v86)
    {
      OUTLINED_FUNCTION_11();
      result = OUTLINED_FUNCTION_14();
      if ((v32 & 1) == 0)
        return result;
    }
    if (v85 != v83 || v84 != v82)
    {
      OUTLINED_FUNCTION_11();
      result = OUTLINED_FUNCTION_14();
      if ((v34 & 1) == 0)
        return result;
    }
    if (v81 != v79 || v80 != v78)
    {
      OUTLINED_FUNCTION_11();
      result = OUTLINED_FUNCTION_14();
      if ((v36 & 1) == 0)
        return result;
    }
    if (v77 != v75 || v76 != v74)
    {
      OUTLINED_FUNCTION_11();
      result = OUTLINED_FUNCTION_14();
      if ((v38 & 1) == 0)
        return result;
    }
    if (v73 != v71 || v72 != v70)
    {
      OUTLINED_FUNCTION_11();
      result = OUTLINED_FUNCTION_14();
      if ((v40 & 1) == 0)
        return result;
    }
    if (v69 != v67 || v68 != v66)
    {
      OUTLINED_FUNCTION_11();
      result = OUTLINED_FUNCTION_14();
      if ((v42 & 1) == 0)
        return result;
    }
    if (v65 != v63 || v64 != v62)
    {
      OUTLINED_FUNCTION_11();
      result = OUTLINED_FUNCTION_14();
      if ((v44 & 1) == 0)
        return result;
    }
    if (v61 != v59 || v60 != v58)
    {
      OUTLINED_FUNCTION_11();
      result = OUTLINED_FUNCTION_14();
      if ((v46 & 1) == 0)
        return result;
    }
    if (v57 != v55 || v56 != v54)
    {
      OUTLINED_FUNCTION_11();
      result = OUTLINED_FUNCTION_14();
      if ((v48 & 1) == 0)
        return result;
    }
    sub_2468E9594(v53);
    if ((v49 & 1) != 0)
    {
      if (v52 == 5)
      {
        if (v51 == 5)
          return 1;
      }
      else if (v51 != 5)
      {
        sub_2468E9470(v52);
        if ((v50 & 1) != 0)
          return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_2468EE07C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v3 = (uint64_t *)(a2 + 56);
    v4 = (uint64_t *)(a1 + 56);
    do
    {
      v5 = *(v4 - 2);
      v6 = *(v4 - 1);
      v7 = *v4;
      v8 = *(v3 - 2);
      v9 = *(v3 - 1);
      v10 = *v3;
      if (v5)
      {
        if (!v8)
          return 0;
        v11 = *(v4 - 3) == *(v3 - 3) && v5 == v8;
        if (!v11 && (sub_2468F4CA8() & 1) == 0)
          return 0;
      }
      else if (v8)
      {
        return 0;
      }
      v12 = v6 == v9 && v7 == v10;
      if (!v12 && (sub_2468F4CA8() & 1) == 0)
        return 0;
      v3 += 4;
      v4 += 4;
      --v2;
    }
    while (v2);
  }
  return 1;
}

uint64_t sub_2468EE154(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2)
  {
    if (a1 != a2)
      __asm { BR              X11 }
  }
  return 1;
}

uint64_t sub_2468EF0D4(uint64_t a1, uint64_t a2)
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
  char v29;

  v2 = a1 == 28532 && a2 == 0xE200000000000000;
  if (v2 || (sub_2468F4CA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x7463656A627573 && a2 == 0xE700000000000000;
    if (v6 || (sub_2468F4CA8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 2036625250 && a2 == 0xE400000000000000;
      if (v7 || (sub_2468F4CA8() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 25443 && a2 == 0xE200000000000000;
        if (v8 || (sub_2468F4CA8() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 6513506 && a2 == 0xE300000000000000;
          if (v9 || (sub_2468F4CA8() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 0x656D686361747461 && a2 == 0xEB0000000073746ELL;
            if (v10 || (sub_2468F4CA8() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              v11 = a1 == 0x666552796C706572 && a2 == 0xEE0065636E657265;
              if (v11 || (sub_2468F4CA8() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                v12 = a1 == 0x6C6562614C6F74 && a2 == 0xE700000000000000;
                if (v12 || (sub_2468F4CA8() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else
                {
                  v13 = a1 == 0x6C6562614C6363 && a2 == 0xE700000000000000;
                  if (v13 || (sub_2468F4CA8() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 8;
                  }
                  else
                  {
                    v14 = a1 == 0x6C6562614C636362 && a2 == 0xE800000000000000;
                    if (v14 || (sub_2468F4CA8() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 9;
                    }
                    else
                    {
                      v15 = a1 == 0x4C7463656A627573 && a2 == 0xEC0000006C656261;
                      if (v15 || (sub_2468F4CA8() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 10;
                      }
                      else
                      {
                        v16 = a1 == 0x614C6C65636E6163 && a2 == 0xEB000000006C6562;
                        if (v16 || (sub_2468F4CA8() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 11;
                        }
                        else
                        {
                          v17 = a1 == 0x656C6C65636E6163 && a2 == 0xEE006C6562614C64;
                          if (v17 || (sub_2468F4CA8() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 12;
                          }
                          else
                          {
                            v18 = a1 == 0x6562614C646E6573 && a2 == 0xE90000000000006CLL;
                            if (v18 || (sub_2468F4CA8() & 1) != 0)
                            {
                              swift_bridgeObjectRelease();
                              return 13;
                            }
                            else
                            {
                              v19 = a1 == 0x6562614C746E6573 && a2 == 0xE90000000000006CLL;
                              if (v19 || (sub_2468F4CA8() & 1) != 0)
                              {
                                swift_bridgeObjectRelease();
                                return 14;
                              }
                              else
                              {
                                v20 = a1 == 0x4C6567617373656DLL && a2 == 0xEC0000006C656261;
                                if (v20 || (sub_2468F4CA8() & 1) != 0)
                                {
                                  swift_bridgeObjectRelease();
                                  return 15;
                                }
                                else
                                {
                                  v21 = a1 == 0x614C6574656C6564 && a2 == 0xEB000000006C6562;
                                  if (v21 || (sub_2468F4CA8() & 1) != 0)
                                  {
                                    swift_bridgeObjectRelease();
                                    return 16;
                                  }
                                  else
                                  {
                                    v22 = a1 == 0x62614C796C706572 && a2 == 0xEA00000000006C65;
                                    if (v22 || (sub_2468F4CA8() & 1) != 0)
                                    {
                                      swift_bridgeObjectRelease();
                                      return 17;
                                    }
                                    else
                                    {
                                      v23 = a1 == 0x6562614C7478656ELL && a2 == 0xE90000000000006CLL;
                                      if (v23 || (sub_2468F4CA8() & 1) != 0)
                                      {
                                        swift_bridgeObjectRelease();
                                        return 18;
                                      }
                                      else
                                      {
                                        v24 = a1 == 0x614C6C6C41656573 && a2 == 0xEB000000006C6562;
                                        if (v24 || (sub_2468F4CA8() & 1) != 0)
                                        {
                                          swift_bridgeObjectRelease();
                                          return 19;
                                        }
                                        else
                                        {
                                          v25 = a1 == 0x614D6E4965726F6DLL && a2 == 0xEF6C6562614C6C69;
                                          if (v25 || (sub_2468F4CA8() & 1) != 0)
                                          {
                                            swift_bridgeObjectRelease();
                                            return 20;
                                          }
                                          else
                                          {
                                            v26 = a1 == 0x617373654D77656ELL && a2 == 0xEF6C6562614C6567;
                                            if (v26 || (sub_2468F4CA8() & 1) != 0)
                                            {
                                              swift_bridgeObjectRelease();
                                              return 21;
                                            }
                                            else
                                            {
                                              v27 = a1 == 0x6574617473 && a2 == 0xE500000000000000;
                                              if (v27 || (sub_2468F4CA8() & 1) != 0)
                                              {
                                                swift_bridgeObjectRelease();
                                                return 22;
                                              }
                                              else if (a1 == 0x4664657375636F66 && a2 == 0xEC000000646C6569)
                                              {
                                                swift_bridgeObjectRelease();
                                                return 23;
                                              }
                                              else
                                              {
                                                v29 = sub_2468F4CA8();
                                                swift_bridgeObjectRelease();
                                                if ((v29 & 1) != 0)
                                                  return 23;
                                                else
                                                  return 24;
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

uint64_t sub_2468EFAA8()
{
  return 24;
}

void sub_2468EFAB0()
{
  OUTLINED_FUNCTION_48();
  sub_2468F4CC0();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_27();
}

uint64_t sub_2468EFAE0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2468EFB08 + 4 * byte_2468F4FAE[a1]))(28532, 0xE200000000000000);
}

uint64_t sub_2468EFB08()
{
  return 0x7463656A627573;
}

uint64_t sub_2468EFB20()
{
  return 2036625250;
}

uint64_t sub_2468EFB30()
{
  return 25443;
}

uint64_t sub_2468EFB38()
{
  return 6513506;
}

uint64_t sub_2468EFB48()
{
  return 0x656D686361747461;
}

uint64_t sub_2468EFB68()
{
  return 0x666552796C706572;
}

uint64_t sub_2468EFB8C()
{
  return 0x6C6562614C6F74;
}

uint64_t sub_2468EFBA8()
{
  return 0x6C6562614C6363;
}

uint64_t sub_2468EFBC0()
{
  return 0x6C6562614C636362;
}

uint64_t sub_2468EFBD8()
{
  return 0x4C7463656A627573;
}

uint64_t sub_2468EFC58()
{
  return 0x614C6574656C6564;
}

uint64_t sub_2468EFC68()
{
  return 0x62614C796C706572;
}

uint64_t sub_2468EFCC0()
{
  return 0x614D6E4965726F6DLL;
}

uint64_t sub_2468EFCE8()
{
  return 0x617373654D77656ELL;
}

uint64_t sub_2468EFD0C()
{
  return 0x6574617473;
}

uint64_t sub_2468EFD20()
{
  return 0x4664657375636F66;
}

void sub_2468EFD40()
{
  OUTLINED_FUNCTION_89();
  sub_2468F4CC0();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_27();
}

uint64_t sub_2468EFD70()
{
  unsigned __int8 *v0;

  return sub_2468EFAE0(*v0);
}

uint64_t sub_2468EFD78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2468EF0D4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2468EFD9C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2468EFAA8();
  *a1 = result;
  return result;
}

uint64_t sub_2468EFDC0()
{
  sub_2468F1694();
  return sub_2468F4CFC();
}

uint64_t sub_2468EFDE8()
{
  sub_2468F1694();
  return sub_2468F4D08();
}

void _SiriMailMessage.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_37();
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575EC080);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_36();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2468F1694();
  sub_2468F4CF0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBF78);
  sub_2468F156C((unint64_t *)&qword_2575EBF80, &qword_2575EBF78, (uint64_t (*)(void))sub_2468EC6B0, MEMORY[0x24BEE12A0]);
  OUTLINED_FUNCTION_97();
  if (!v0)
  {
    OUTLINED_FUNCTION_21(1);
    OUTLINED_FUNCTION_59();
    OUTLINED_FUNCTION_21(2);
    OUTLINED_FUNCTION_100();
    OUTLINED_FUNCTION_59();
    OUTLINED_FUNCTION_46(3);
    OUTLINED_FUNCTION_46(4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575EBFA8);
    sub_2468F156C((unint64_t *)&qword_2575EBFB0, &qword_2575EBFA8, (uint64_t (*)(void))sub_2468EC7A0, MEMORY[0x24BEE12A0]);
    sub_2468F4C9C();
    OUTLINED_FUNCTION_21(6);
    OUTLINED_FUNCTION_59();
    OUTLINED_FUNCTION_21(7);
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_21(8);
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_21(9);
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_21(10);
    sub_2468F4C90();
    OUTLINED_FUNCTION_21(11);
    sub_2468F4C90();
    OUTLINED_FUNCTION_21(12);
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_21(13);
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_21(14);
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_21(15);
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_21(16);
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_21(17);
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_21(18);
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_21(19);
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_21(20);
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_21(21);
    OUTLINED_FUNCTION_2();
    sub_2468EC504();
    OUTLINED_FUNCTION_85();
    sub_2468F4C9C();
    sub_2468EC5F4();
    OUTLINED_FUNCTION_85();
    sub_2468F4C84();
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v4);
  OUTLINED_FUNCTION_4();
}

void _SiriMailMessage.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unsigned int v19;
  int v20;
  int v21;
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
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD v94[40];
  char v95;
  char v96;
  _QWORD v97[40];
  char v98;
  char v99;

  OUTLINED_FUNCTION_37();
  v15 = v14;
  v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575EC090);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_73();
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  sub_2468F1694();
  sub_2468F4CE4();
  if (v13)
  {
    v19 = 70;
  }
  else
  {
    v90 = v17;
    OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_42(&qword_2575EC058, v18, (uint64_t (*)(void))sub_2468F14F0, MEMORY[0x24BEE12D0]);
    sub_2468F4C54();
    v89 = (uint64_t)v15;
    swift_bridgeObjectRetain();
    v70 = v97[0];
    v22 = OUTLINED_FUNCTION_57();
    v24 = v23;
    v88 = v22;
    LOBYTE(v97[0]) = 2;
    OUTLINED_FUNCTION_58();
    v92 = v24;
    v87 = OUTLINED_FUNCTION_57();
    v93 = v25;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_52();
    LOBYTE(v94[0]) = 4;
    OUTLINED_FUNCTION_81();
    OUTLINED_FUNCTION_52();
    v69 = v97[0];
    OUTLINED_FUNCTION_43();
    LOBYTE(v94[0]) = 5;
    v27 = OUTLINED_FUNCTION_42(&qword_2575EC068, v26, (uint64_t (*)(void))sub_2468F15D0, MEMORY[0x24BEE12D0]);
    OUTLINED_FUNCTION_81();
    OUTLINED_FUNCTION_54();
    v68 = v97[0];
    if (!v27)
    {
      swift_bridgeObjectRetain();
      v67 = v97[0];
      v86 = OUTLINED_FUNCTION_57();
      v29 = v28;
      OUTLINED_FUNCTION_58();
      v91 = v29;
      v85 = OUTLINED_FUNCTION_26();
      v31 = v30;
      OUTLINED_FUNCTION_58();
      v84 = OUTLINED_FUNCTION_26();
      v66 = v31;
      v65 = v32;
      OUTLINED_FUNCTION_58();
      v33 = OUTLINED_FUNCTION_26();
      v80 = v34;
      v35 = v33;
      swift_bridgeObjectRetain();
      v36 = OUTLINED_FUNCTION_5();
      v79 = v37;
      v38 = v36;
      swift_bridgeObjectRetain();
      v39 = OUTLINED_FUNCTION_5();
      v78 = v40;
      v41 = v39;
      swift_bridgeObjectRetain();
      v42 = OUTLINED_FUNCTION_5();
      v77 = v43;
      v44 = v42;
      swift_bridgeObjectRetain();
      v45 = OUTLINED_FUNCTION_5();
      v76 = v46;
      v47 = v45;
      swift_bridgeObjectRetain();
      v48 = OUTLINED_FUNCTION_5();
      v75 = v49;
      v50 = v48;
      swift_bridgeObjectRetain();
      v83 = OUTLINED_FUNCTION_5();
      v74 = v51;
      swift_bridgeObjectRetain();
      v82 = OUTLINED_FUNCTION_5();
      v73 = v52;
      swift_bridgeObjectRetain();
      v81 = OUTLINED_FUNCTION_5();
      v72 = v53;
      swift_bridgeObjectRetain();
      v61 = OUTLINED_FUNCTION_5();
      v71 = v54;
      swift_bridgeObjectRetain();
      v60 = OUTLINED_FUNCTION_5();
      v64 = v55;
      swift_bridgeObjectRetain();
      v59 = OUTLINED_FUNCTION_5();
      v63 = v56;
      LOBYTE(v97[0]) = 21;
      swift_bridgeObjectRetain();
      v58 = OUTLINED_FUNCTION_5();
      v62 = v57;
      LOBYTE(v94[0]) = 22;
      sub_2468F13FC();
      swift_bridgeObjectRetain();
      sub_2468F4C54();
      sub_2468F14A0();
      sub_2468F4C3C();
      OUTLINED_FUNCTION_0();
      v94[0] = v70;
      v94[1] = v88;
      v94[2] = v92;
      v94[3] = v87;
      v94[4] = v93;
      v94[5] = v69;
      v94[6] = v68;
      v94[7] = v67;
      v94[8] = v86;
      v94[9] = v91;
      v94[10] = v85;
      v94[11] = v66;
      v94[12] = v84;
      v94[13] = v65;
      v94[14] = v35;
      v94[15] = v80;
      v94[16] = v38;
      v94[17] = v79;
      v94[18] = v41;
      v94[19] = v78;
      v94[20] = v44;
      v94[21] = v77;
      v94[22] = v47;
      v94[23] = v76;
      v94[24] = v50;
      v94[25] = v75;
      v94[26] = v83;
      v94[27] = v74;
      v94[28] = v82;
      v94[29] = v73;
      v94[30] = v81;
      v94[31] = v72;
      v94[32] = v61;
      v94[33] = v71;
      v94[34] = v60;
      v94[35] = v64;
      v94[36] = v59;
      v94[37] = v63;
      v94[38] = v58;
      v94[39] = v62;
      v95 = 21;
      v96 = a13;
      sub_2468F16D0((uint64_t)v94);
      OUTLINED_FUNCTION_69();
      OUTLINED_FUNCTION_75();
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_25();
      OUTLINED_FUNCTION_24();
      OUTLINED_FUNCTION_29();
      OUTLINED_FUNCTION_32();
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_39();
      OUTLINED_FUNCTION_44();
      OUTLINED_FUNCTION_66();
      OUTLINED_FUNCTION_77();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_84();
      OUTLINED_FUNCTION_30();
      OUTLINED_FUNCTION_69();
      OUTLINED_FUNCTION_75();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_91(v90, v94);
      __swift_destroy_boxed_opaque_existential_1(v89);
      v97[0] = v70;
      v97[1] = v88;
      v97[2] = v92;
      v97[3] = v87;
      v97[4] = v93;
      v97[5] = v69;
      v97[6] = v68;
      v97[7] = v67;
      v97[8] = v86;
      v97[9] = v91;
      v97[10] = v85;
      v97[11] = v66;
      v97[12] = v84;
      v97[13] = v65;
      v97[14] = v35;
      v97[15] = v80;
      v97[16] = v38;
      v97[17] = v79;
      v97[18] = v41;
      v97[19] = v78;
      v97[20] = v44;
      v97[21] = v77;
      v97[22] = v47;
      v97[23] = v76;
      v97[24] = v50;
      v97[25] = v75;
      v97[26] = v83;
      v97[27] = v74;
      v97[28] = v82;
      v97[29] = v73;
      v97[30] = v81;
      v97[31] = v72;
      v97[32] = v61;
      v97[33] = v71;
      v97[34] = v60;
      v97[35] = v64;
      v97[36] = v59;
      v97[37] = v63;
      v97[38] = v58;
      v97[39] = v62;
      v98 = 21;
      v99 = a13;
      sub_2468F1834((uint64_t)v97);
      goto LABEL_36;
    }
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_66();
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_30();
    v19 = 95;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  v20 = (v19 >> 4) & 1;
  v21 = (v19 >> 5) & 1;
  if ((v19 & 1) != 0)
    swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_12();
  if (((v19 >> 3) & 1) != 0)
  {
    OUTLINED_FUNCTION_16();
    if (!v20)
      goto LABEL_8;
LABEL_34:
    OUTLINED_FUNCTION_15();
    if (!v21)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (v20)
    goto LABEL_34;
LABEL_8:
  if (v21)
LABEL_9:
    OUTLINED_FUNCTION_18();
LABEL_10:
  OUTLINED_FUNCTION_20();
  if (((v19 >> 7) & 1) != 0)
    OUTLINED_FUNCTION_25();
  if (((v19 >> 8) & 1) != 0)
    OUTLINED_FUNCTION_24();
  if (((v19 >> 9) & 1) != 0)
    OUTLINED_FUNCTION_30();
  if (((v19 >> 10) & 1) != 0)
    OUTLINED_FUNCTION_69();
  if (((v19 >> 11) & 1) != 0)
    swift_bridgeObjectRelease();
  if (((v19 >> 12) & 1) != 0)
    OUTLINED_FUNCTION_30();
  if (((v19 >> 13) & 1) != 0)
    OUTLINED_FUNCTION_77();
  if (((v19 >> 14) & 1) != 0)
    swift_bridgeObjectRelease();
  if (((v19 >> 15) & 1) != 0)
    OUTLINED_FUNCTION_30();
  if ((v19 & 0x10000) != 0)
    swift_bridgeObjectRelease();
  if (((v19 >> 17) & 1) != 0)
    swift_bridgeObjectRelease();
LABEL_36:
  OUTLINED_FUNCTION_4();
}

void sub_2468F1358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;
  uint64_t vars8;

  _SiriMailMessage.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8, SWORD2(vars8), SBYTE6(vars8), SHIBYTE(vars8));
}

void sub_2468F136C()
{
  _SiriMailMessage.encode(to:)();
}

uint64_t sub_2468F1384(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
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

unint64_t sub_2468F13FC()
{
  unint64_t result;

  result = qword_2575EC040;
  if (!qword_2575EC040)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage.State, &type metadata for _SiriMailMessage.State);
    atomic_store(result, (unint64_t *)&qword_2575EC040);
  }
  return result;
}

uint64_t sub_2468F1438(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x90;
  return result;
}

unint64_t sub_2468F1450()
{
  unint64_t result;

  result = qword_2575EC048;
  if (!qword_2575EC048)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage.Action, &type metadata for _SiriMailMessage.Action);
    atomic_store(result, (unint64_t *)&qword_2575EC048);
  }
  return result;
}

uint64_t sub_2468F148C(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x80;
  return result;
}

unint64_t sub_2468F14A0()
{
  unint64_t result;

  result = qword_2575EC050;
  if (!qword_2575EC050)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage.Field, &type metadata for _SiriMailMessage.Field);
    atomic_store(result, (unint64_t *)&qword_2575EC050);
  }
  return result;
}

uint64_t sub_2468F14DC(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x70;
  return result;
}

unint64_t sub_2468F14F0()
{
  unint64_t result;

  result = qword_2575EC060;
  if (!qword_2575EC060)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage.Account, &type metadata for _SiriMailMessage.Account);
    atomic_store(result, (unint64_t *)&qword_2575EC060);
  }
  return result;
}

uint64_t sub_2468F152C(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x60;
  return result;
}

uint64_t sub_2468F1540(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x50;
  return result;
}

uint64_t sub_2468F1558(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x40;
  return result;
}

uint64_t sub_2468F156C(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x249562384](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2468F15D0()
{
  unint64_t result;

  result = qword_2575EC070;
  if (!qword_2575EC070)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage.MailAttachment, &type metadata for _SiriMailMessage.MailAttachment);
    atomic_store(result, (unint64_t *)&qword_2575EC070);
  }
  return result;
}

uint64_t sub_2468F160C(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x30;
  return result;
}

uint64_t sub_2468F1620(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x20;
  return result;
}

uint64_t sub_2468F1634(uint64_t result)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | 0x10;
  return result;
}

unint64_t sub_2468F1648()
{
  unint64_t result;

  result = qword_2575EC078;
  if (!qword_2575EC078)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage, &type metadata for _SiriMailMessage);
    atomic_store(result, (unint64_t *)&qword_2575EC078);
  }
  return result;
}

uint64_t sub_2468F1684(uint64_t result)
{
  *(_WORD *)(result + 320) &= 0xFF07u;
  return result;
}

unint64_t sub_2468F1694()
{
  unint64_t result;

  result = qword_2575EC088;
  if (!qword_2575EC088)
  {
    result = MEMORY[0x249562384](&unk_2468F60F4, &type metadata for _SiriMailMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC088);
  }
  return result;
}

uint64_t sub_2468F16D0(uint64_t a1)
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

uint64_t sub_2468F1834(uint64_t a1)
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

unint64_t sub_2468F199C()
{
  unint64_t result;

  result = qword_2575EC098;
  if (!qword_2575EC098)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage.Account, &type metadata for _SiriMailMessage.Account);
    atomic_store(result, (unint64_t *)&qword_2575EC098);
  }
  return result;
}

unint64_t sub_2468F19DC()
{
  unint64_t result;

  result = qword_2575EC0A0;
  if (!qword_2575EC0A0)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage.State, &type metadata for _SiriMailMessage.State);
    atomic_store(result, (unint64_t *)&qword_2575EC0A0);
  }
  return result;
}

unint64_t sub_2468F1A1C()
{
  unint64_t result;

  result = qword_2575EC0A8;
  if (!qword_2575EC0A8)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage.Field, &type metadata for _SiriMailMessage.Field);
    atomic_store(result, (unint64_t *)&qword_2575EC0A8);
  }
  return result;
}

unint64_t sub_2468F1A5C()
{
  unint64_t result;

  result = qword_2575EC0B0;
  if (!qword_2575EC0B0)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage.Action, &type metadata for _SiriMailMessage.Action);
    atomic_store(result, (unint64_t *)&qword_2575EC0B0);
  }
  return result;
}

uint64_t destroy for _SiriMailMessage()
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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for _SiriMailMessage(uint64_t a1, uint64_t a2)
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
  v15 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v15;
  v16 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v16;
  v17 = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = v17;
  v18 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v18;
  v19 = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v19;
  v20 = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = v20;
  v21 = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = v21;
  v22 = *(_QWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = v22;
  *(_BYTE *)(a1 + 320) = *(_BYTE *)(a2 + 320);
  *(_BYTE *)(a1 + 321) = *(_BYTE *)(a2 + 321);
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for _SiriMailMessage(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 320) = *(_BYTE *)(a2 + 320);
  *(_BYTE *)(a1 + 321) = *(_BYTE *)(a2 + 321);
  return a1;
}

void *__swift_memcpy322_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x142uLL);
}

uint64_t assignWithTake for _SiriMailMessage(uint64_t a1, uint64_t a2)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v12;
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v13;
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v14;
  swift_bridgeObjectRelease();
  v15 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v15;
  swift_bridgeObjectRelease();
  v16 = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = v16;
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v17;
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v18;
  swift_bridgeObjectRelease();
  v19 = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = v19;
  swift_bridgeObjectRelease();
  v20 = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = v20;
  swift_bridgeObjectRelease();
  v21 = *(_QWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = v21;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 320) = *(_WORD *)(a2 + 320);
  return a1;
}

uint64_t getEnumTagSinglePayload for _SiriMailMessage(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 322))
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

uint64_t storeEnumTagSinglePayload for _SiriMailMessage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 312) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
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
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_WORD *)(result + 320) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 322) = 1;
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
    *(_BYTE *)(result + 322) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for _SiriMailMessage()
{
  OUTLINED_FUNCTION_55();
}

uint64_t destroy for _SiriMailMessage.Account()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for _SiriMailMessage.Account(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for _SiriMailMessage.Account(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for _SiriMailMessage.Account(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for _SiriMailMessage.Account(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for _SiriMailMessage.Account(uint64_t result, int a2, int a3)
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

void type metadata accessor for _SiriMailMessage.Account()
{
  OUTLINED_FUNCTION_55();
}

uint64_t initializeBufferWithCopyOfBuffer for _SiriMailMessage.MailAttachment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for _SiriMailMessage.MailAttachment(uint64_t a1)
{
  sub_2468EAD8C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t *initializeWithCopy for _SiriMailMessage.MailAttachment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a2;
  v5 = a2[1];
  sub_2468EA40C(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  v8 = a2[6];
  v9 = a2[7];
  a1[6] = v8;
  a1[7] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for _SiriMailMessage.MailAttachment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  sub_2468EA40C(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_2468EAD8C(v6, v7);
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

uint64_t *assignWithTake for _SiriMailMessage.MailAttachment(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *a1;
  v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_2468EAD8C(v4, v5);
  v6 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 40);
  a1[4] = *(_QWORD *)(a2 + 32);
  a1[5] = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 56);
  a1[6] = *(_QWORD *)(a2 + 48);
  a1[7] = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for _SiriMailMessage.MailAttachment(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for _SiriMailMessage.MailAttachment(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for _SiriMailMessage.MailAttachment()
{
  OUTLINED_FUNCTION_55();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

void type metadata accessor for _SiriMailMessage.State()
{
  OUTLINED_FUNCTION_55();
}

uint64_t _s15SiriMailUIModel16_SiriMailMessageV5StateOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s15SiriMailUIModel16_SiriMailMessageV5StateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2468F27C0 + 4 * byte_2468F4FCB[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2468F27F4 + 4 * byte_2468F4FC6[v4]))();
}

uint64_t sub_2468F27F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468F27FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2468F2804);
  return result;
}

uint64_t sub_2468F2810(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2468F2818);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2468F281C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468F2824(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for _SiriMailMessage.Field()
{
  OUTLINED_FUNCTION_55();
}

uint64_t sub_2468F2844(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2468F284C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void type metadata accessor for _SiriMailMessage.Action()
{
  OUTLINED_FUNCTION_55();
}

uint64_t sub_2468F2864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,unsigned __int8 a41)
{
  uint64_t result;

  switch(a41 >> 4)
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
    case 6:
LABEL_3:
      result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for _SiriMailMessage.StateChange(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v5 = *(_OWORD *)(a1 + 272);
  v6 = *(_OWORD *)(a1 + 288);
  v3 = *(_OWORD *)(a1 + 240);
  v4 = *(_OWORD *)(a1 + 256);
  v2 = *(_OWORD *)(a1 + 208);
  return sub_2468F2AAC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
           *(_QWORD *)(a1 + 152),
           *(_QWORD *)(a1 + 160),
           *(_QWORD *)(a1 + 168),
           *(_QWORD *)(a1 + 176),
           *(_QWORD *)(a1 + 184),
           *(_QWORD *)(a1 + 192),
           *(_QWORD *)(a1 + 200),
           v2,
           *((uint64_t *)&v2 + 1),
           *(_QWORD *)(a1 + 224),
           *(_QWORD *)(a1 + 232),
           v3,
           *((uint64_t *)&v3 + 1),
           v4,
           *((uint64_t *)&v4 + 1),
           v5,
           *((uint64_t *)&v5 + 1),
           v6,
           *((uint64_t *)&v6 + 1),
           *(_QWORD *)(a1 + 304),
           *(_QWORD *)(a1 + 312),
           *(_WORD *)(a1 + 320));
}

uint64_t sub_2468F2AAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,unsigned __int8 a41)
{
  uint64_t result;

  switch(a41 >> 4)
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
    case 6:
LABEL_3:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for _SiriMailMessage.StateChange(uint64_t a1, uint64_t a2)
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
  __int16 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v43 = *(_QWORD *)(a2 + 72);
  v44 = *(_QWORD *)(a2 + 64);
  v41 = *(_QWORD *)(a2 + 88);
  v42 = *(_QWORD *)(a2 + 80);
  v40 = *(_QWORD *)(a2 + 96);
  v13 = *(_QWORD *)(a2 + 104);
  v14 = *(_QWORD *)(a2 + 112);
  v15 = *(_QWORD *)(a2 + 120);
  v16 = *(_QWORD *)(a2 + 128);
  v17 = *(_QWORD *)(a2 + 136);
  v18 = *(_QWORD *)(a2 + 144);
  v19 = *(_QWORD *)(a2 + 152);
  v20 = *(_QWORD *)(a2 + 160);
  v21 = *(_QWORD *)(a2 + 168);
  v22 = *(_QWORD *)(a2 + 176);
  v3 = *(_QWORD *)(a2 + 200);
  v23 = *(_QWORD *)(a2 + 184);
  v24 = *(_QWORD *)(a2 + 192);
  v25 = *(_QWORD *)(a2 + 208);
  v26 = *(_QWORD *)(a2 + 216);
  v27 = *(_QWORD *)(a2 + 224);
  v28 = *(_QWORD *)(a2 + 232);
  v29 = *(_QWORD *)(a2 + 240);
  v30 = *(_QWORD *)(a2 + 248);
  v31 = *(_QWORD *)(a2 + 256);
  v32 = *(_QWORD *)(a2 + 264);
  v33 = *(_QWORD *)(a2 + 272);
  v34 = *(_QWORD *)(a2 + 280);
  v35 = *(_QWORD *)(a2 + 288);
  v36 = *(_QWORD *)(a2 + 296);
  v37 = *(_QWORD *)(a2 + 304);
  v38 = *(_QWORD *)(a2 + 312);
  v39 = *(_WORD *)(a2 + 320);
  v5 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v7 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 32);
  v11 = *(_QWORD *)(a2 + 56);
  v10 = *(_QWORD *)(a2 + 48);
  sub_2468F2864(*(_QWORD *)a2, v5, v6, v7, v8, v9, v10, v11, v44, v43, v42, v41, v40, v13, v14, v15, v16, v17, v18,
    v19,
    v20,
    v21,
    v22,
    v23,
    v24,
    v3,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = v10;
  *(_QWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 64) = v44;
  *(_QWORD *)(a1 + 72) = v43;
  *(_QWORD *)(a1 + 80) = v42;
  *(_QWORD *)(a1 + 88) = v41;
  *(_QWORD *)(a1 + 96) = v40;
  *(_QWORD *)(a1 + 104) = v13;
  *(_QWORD *)(a1 + 112) = v14;
  *(_QWORD *)(a1 + 120) = v15;
  *(_QWORD *)(a1 + 128) = v16;
  *(_QWORD *)(a1 + 136) = v17;
  *(_QWORD *)(a1 + 144) = v18;
  *(_QWORD *)(a1 + 152) = v19;
  *(_QWORD *)(a1 + 160) = v20;
  *(_QWORD *)(a1 + 168) = v21;
  *(_QWORD *)(a1 + 176) = v22;
  *(_QWORD *)(a1 + 184) = v23;
  *(_QWORD *)(a1 + 192) = v24;
  *(_QWORD *)(a1 + 200) = v3;
  *(_QWORD *)(a1 + 208) = v25;
  *(_QWORD *)(a1 + 216) = v26;
  *(_QWORD *)(a1 + 224) = v27;
  *(_QWORD *)(a1 + 232) = v28;
  *(_QWORD *)(a1 + 240) = v29;
  *(_QWORD *)(a1 + 248) = v30;
  *(_QWORD *)(a1 + 256) = v31;
  *(_QWORD *)(a1 + 264) = v32;
  *(_QWORD *)(a1 + 272) = v33;
  *(_QWORD *)(a1 + 280) = v34;
  *(_QWORD *)(a1 + 288) = v35;
  *(_QWORD *)(a1 + 296) = v36;
  *(_QWORD *)(a1 + 304) = v37;
  *(_QWORD *)(a1 + 312) = v38;
  *(_WORD *)(a1 + 320) = v39;
  return a1;
}

uint64_t assignWithCopy for _SiriMailMessage.StateChange(uint64_t a1, uint64_t a2)
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
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  __int16 v37;
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
  __int16 v57;
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

  v69 = *(_QWORD *)a2;
  v70 = *(_QWORD *)(a2 + 8);
  v67 = *(_QWORD *)(a2 + 24);
  v68 = *(_QWORD *)(a2 + 16);
  v65 = *(_QWORD *)(a2 + 40);
  v66 = *(_QWORD *)(a2 + 32);
  v63 = *(_QWORD *)(a2 + 56);
  v64 = *(_QWORD *)(a2 + 48);
  v61 = *(_QWORD *)(a2 + 72);
  v62 = *(_QWORD *)(a2 + 64);
  v59 = *(_QWORD *)(a2 + 88);
  v60 = *(_QWORD *)(a2 + 80);
  v58 = *(_QWORD *)(a2 + 96);
  v39 = *(_QWORD *)(a2 + 104);
  v40 = *(_QWORD *)(a2 + 112);
  v3 = *(_QWORD *)(a2 + 136);
  v41 = *(_QWORD *)(a2 + 120);
  v42 = *(_QWORD *)(a2 + 128);
  v4 = *(_QWORD *)(a2 + 144);
  v5 = *(_QWORD *)(a2 + 152);
  v6 = *(_QWORD *)(a2 + 160);
  v7 = *(_QWORD *)(a2 + 168);
  v8 = *(_QWORD *)(a2 + 176);
  v9 = *(_QWORD *)(a2 + 184);
  v10 = *(_QWORD *)(a2 + 192);
  v11 = *(_QWORD *)(a2 + 200);
  v43 = *(_QWORD *)(a2 + 208);
  v44 = *(_QWORD *)(a2 + 216);
  v45 = *(_QWORD *)(a2 + 224);
  v46 = *(_QWORD *)(a2 + 232);
  v47 = *(_QWORD *)(a2 + 240);
  v48 = *(_QWORD *)(a2 + 248);
  v49 = *(_QWORD *)(a2 + 256);
  v50 = *(_QWORD *)(a2 + 264);
  v51 = *(_QWORD *)(a2 + 272);
  v52 = *(_QWORD *)(a2 + 280);
  v53 = *(_QWORD *)(a2 + 288);
  v54 = *(_QWORD *)(a2 + 296);
  v55 = *(_QWORD *)(a2 + 304);
  v56 = *(_QWORD *)(a2 + 312);
  v57 = *(_WORD *)(a2 + 320);
  sub_2468F2864(*(_QWORD *)a2, v70, v68, v67, v66, v65, v64, v63, v62, v61, v60, v59, v58, v39, v40, v41, v42, v3, v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
    v53,
    v54,
    v55,
    v56,
    v57);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v69;
  *(_QWORD *)(a1 + 8) = v70;
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v68;
  *(_QWORD *)(a1 + 24) = v67;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = v66;
  *(_QWORD *)(a1 + 40) = v65;
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v64;
  *(_QWORD *)(a1 + 56) = v63;
  v20 = *(_OWORD *)(a1 + 64);
  v21 = *(_OWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 64) = v62;
  *(_QWORD *)(a1 + 72) = v61;
  *(_QWORD *)(a1 + 80) = v60;
  *(_QWORD *)(a1 + 88) = v59;
  v22 = *(_OWORD *)(a1 + 96);
  v23 = *(_OWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 96) = v58;
  *(_QWORD *)(a1 + 104) = v39;
  *(_QWORD *)(a1 + 112) = v40;
  *(_QWORD *)(a1 + 120) = v41;
  v24 = *(_OWORD *)(a1 + 128);
  v25 = *(_OWORD *)(a1 + 144);
  *(_QWORD *)(a1 + 128) = v42;
  *(_QWORD *)(a1 + 136) = v3;
  *(_QWORD *)(a1 + 144) = v4;
  *(_QWORD *)(a1 + 152) = v5;
  v26 = *(_OWORD *)(a1 + 160);
  v27 = *(_OWORD *)(a1 + 176);
  *(_QWORD *)(a1 + 160) = v6;
  *(_QWORD *)(a1 + 168) = v7;
  *(_QWORD *)(a1 + 176) = v8;
  *(_QWORD *)(a1 + 184) = v9;
  v28 = *(_OWORD *)(a1 + 192);
  v29 = *(_OWORD *)(a1 + 208);
  *(_QWORD *)(a1 + 192) = v10;
  *(_QWORD *)(a1 + 200) = v11;
  *(_QWORD *)(a1 + 208) = v43;
  *(_QWORD *)(a1 + 216) = v44;
  v30 = *(_OWORD *)(a1 + 224);
  v31 = *(_OWORD *)(a1 + 240);
  *(_QWORD *)(a1 + 224) = v45;
  *(_QWORD *)(a1 + 232) = v46;
  *(_QWORD *)(a1 + 240) = v47;
  *(_QWORD *)(a1 + 248) = v48;
  v32 = *(_OWORD *)(a1 + 256);
  v33 = *(_OWORD *)(a1 + 272);
  *(_QWORD *)(a1 + 256) = v49;
  *(_QWORD *)(a1 + 264) = v50;
  *(_QWORD *)(a1 + 272) = v51;
  *(_QWORD *)(a1 + 280) = v52;
  v34 = *(_OWORD *)(a1 + 288);
  *(_QWORD *)(a1 + 288) = v53;
  *(_QWORD *)(a1 + 296) = v54;
  v35 = *(_QWORD *)(a1 + 304);
  v36 = *(_QWORD *)(a1 + 312);
  *(_QWORD *)(a1 + 304) = v55;
  *(_QWORD *)(a1 + 312) = v56;
  v37 = *(_WORD *)(a1 + 320);
  *(_WORD *)(a1 + 320) = v57;
  sub_2468F2AAC(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, *((uint64_t *)&v23 + 1), v24, *((uint64_t *)&v24 + 1), v25,
    *((uint64_t *)&v25 + 1),
    v26,
    *((uint64_t *)&v26 + 1),
    v27,
    *((uint64_t *)&v27 + 1),
    v28,
    *((uint64_t *)&v28 + 1),
    v29,
    *((uint64_t *)&v29 + 1),
    v30,
    *((uint64_t *)&v30 + 1),
    v31,
    *((uint64_t *)&v31 + 1),
    v32,
    *((uint64_t *)&v32 + 1),
    v33,
    *((uint64_t *)&v33 + 1),
    v34,
    *((uint64_t *)&v34 + 1),
    v35,
    v36,
    v37);
  return a1;
}

uint64_t assignWithTake for _SiriMailMessage.StateChange(uint64_t a1, uint64_t a2)
{
  __int16 v4;
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
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  __int16 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;

  v4 = *(_WORD *)(a2 + 320);
  v5 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
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
  v21 = *(_OWORD *)(a1 + 192);
  v22 = *(_OWORD *)(a1 + 208);
  v23 = *(_OWORD *)(a1 + 224);
  v24 = *(_OWORD *)(a1 + 240);
  v25 = *(_OWORD *)(a1 + 256);
  v26 = *(_OWORD *)(a1 + 272);
  v27 = *(_OWORD *)(a1 + 288);
  v28 = *(_QWORD *)(a1 + 304);
  v29 = *(_QWORD *)(a1 + 312);
  v30 = *(_WORD *)(a1 + 320);
  v31 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v31;
  v32 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v32;
  v33 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v33;
  v34 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v34;
  v35 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v35;
  v36 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v36;
  v37 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v37;
  v38 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v38;
  v39 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v39;
  v40 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 304) = v40;
  *(_WORD *)(a1 + 320) = v4;
  sub_2468F2AAC(v5, v6, v7, v8, v9, v10, v11, v12, v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v17, *((uint64_t *)&v17 + 1), v18,
    *((uint64_t *)&v18 + 1),
    v19,
    *((uint64_t *)&v19 + 1),
    v20,
    *((uint64_t *)&v20 + 1),
    v21,
    *((uint64_t *)&v21 + 1),
    v22,
    *((uint64_t *)&v22 + 1),
    v23,
    *((uint64_t *)&v23 + 1),
    v24,
    *((uint64_t *)&v24 + 1),
    v25,
    *((uint64_t *)&v25 + 1),
    v26,
    *((uint64_t *)&v26 + 1),
    v27,
    *((uint64_t *)&v27 + 1),
    v28,
    v29,
    v30);
  return a1;
}

uint64_t getEnumTagSinglePayload for _SiriMailMessage.StateChange(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x17 && *(_BYTE *)(a1 + 322))
    {
      v2 = *(_DWORD *)a1 + 22;
    }
    else
    {
      v2 = ((2 * *(unsigned __int16 *)(a1 + 320)) & 0x10 | (*(_WORD *)(a1 + 320) >> 4)) ^ 0x1F;
      if (v2 >= 0x16)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

void storeEnumTagSinglePayload for _SiriMailMessage.StateChange(char *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v4;

  if (a2 > 0x16)
  {
    *((_QWORD *)a1 + 39) = 0;
    *(_OWORD *)(a1 + 248) = 0u;
    *(_OWORD *)(a1 + 232) = 0u;
    *(_OWORD *)(a1 + 216) = 0u;
    *(_OWORD *)(a1 + 200) = 0u;
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
    *(_OWORD *)(a1 + 296) = 0u;
    *(_OWORD *)(a1 + 280) = 0u;
    *(_OWORD *)(a1 + 264) = 0u;
    *((_WORD *)a1 + 160) = 0;
    *(_QWORD *)a1 = a2 - 23;
    if (a3 >= 0x17)
      a1[322] = 1;
  }
  else
  {
    if (a3 >= 0x17)
      a1[322] = 0;
    if (a2)
    {
      v4 = 8 * ((((-a2 >> 4) & 1) - 2 * a2) & 0x1F);
      bzero(a1, 0x140uLL);
      *((_WORD *)a1 + 160) = v4;
    }
  }
}

uint64_t sub_2468F3404(uint64_t result, char a2)
{
  *(_WORD *)(result + 320) = *(_WORD *)(result + 320) & 0xFF07 | (16 * (a2 & 0xF));
  return result;
}

void type metadata accessor for _SiriMailMessage.StateChange()
{
  OUTLINED_FUNCTION_55();
}

uint64_t getEnumTagSinglePayload for _SiriMailMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xE9)
  {
    if (a2 + 23 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 23) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 24;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x18;
  v5 = v6 - 24;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for _SiriMailMessage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 23 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 23) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE8)
    return ((uint64_t (*)(void))((char *)&loc_2468F34FC + 4 * byte_2468F4FE3[v4]))();
  *a1 = a2 + 23;
  return ((uint64_t (*)(void))((char *)sub_2468F3530 + 4 * byte_2468F4FDE[v4]))();
}

uint64_t sub_2468F3530(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468F3538(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2468F3540);
  return result;
}

uint64_t sub_2468F354C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2468F3554);
  *(_BYTE *)result = a2 + 23;
  return result;
}

uint64_t sub_2468F3558(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468F3560(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.CodingKeys()
{
  return &type metadata for _SiriMailMessage.CodingKeys;
}

uint64_t getEnumTagSinglePayload for _SiriMailMessage.StateChange.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for _SiriMailMessage.StateChange.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2468F3650 + 4 * byte_2468F4FED[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_2468F3684 + 4 * byte_2468F4FE8[v4]))();
}

uint64_t sub_2468F3684(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468F368C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2468F3694);
  return result;
}

uint64_t sub_2468F36A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2468F36A8);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_2468F36AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468F36B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.CodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.CodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.ModelUpdateCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.ModelUpdateCodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.SubjectCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.SubjectCodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.BodyCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.BodyCodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.AttachmentsCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.AttachmentsCodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.ToCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.ToCodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.CcCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.CcCodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.BccCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.BccCodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.FocusedFieldCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.FocusedFieldCodingKeys;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.ActionCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.ActionCodingKeys;
}

uint64_t _s15SiriMailUIModel16_SiriMailMessageV11StateChangeO21ModelUpdateCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2468F37A8 + 4 * byte_2468F4FF2[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2468F37C8 + 4 * byte_2468F4FF7[v4]))();
}

_BYTE *sub_2468F37A8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2468F37C8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2468F37D0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2468F37D8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2468F37E0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2468F37E8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.StateChange.StateCodingKeys()
{
  return &type metadata for _SiriMailMessage.StateChange.StateCodingKeys;
}

uint64_t getEnumTagSinglePayload for _SiriMailMessage.MailAttachment.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for _SiriMailMessage.MailAttachment.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2468F38D8 + 4 * byte_2468F5001[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2468F390C + 4 * byte_2468F4FFC[v4]))();
}

uint64_t sub_2468F390C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468F3914(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2468F391CLL);
  return result;
}

uint64_t sub_2468F3928(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2468F3930);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2468F3934(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468F393C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2468F3948(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.MailAttachment.CodingKeys()
{
  return &type metadata for _SiriMailMessage.MailAttachment.CodingKeys;
}

uint64_t _s15SiriMailUIModel16_SiriMailMessageV6ActionOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s15SiriMailUIModel16_SiriMailMessageV6ActionOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2468F3A34 + 4 * byte_2468F500B[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2468F3A68 + 4 * byte_2468F5006[v4]))();
}

uint64_t sub_2468F3A68(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468F3A70(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2468F3A78);
  return result;
}

uint64_t sub_2468F3A84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2468F3A8CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2468F3A90(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2468F3A98(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for _SiriMailMessage.Account.CodingKeys()
{
  return &type metadata for _SiriMailMessage.Account.CodingKeys;
}

unint64_t sub_2468F3AB8()
{
  unint64_t result;

  result = qword_2575EC0B8;
  if (!qword_2575EC0B8)
  {
    result = MEMORY[0x249562384](&unk_2468F5774, &type metadata for _SiriMailMessage.Account.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC0B8);
  }
  return result;
}

unint64_t sub_2468F3AF8()
{
  unint64_t result;

  result = qword_2575EC0C0;
  if (!qword_2575EC0C0)
  {
    result = MEMORY[0x249562384](&unk_2468F582C, &type metadata for _SiriMailMessage.MailAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC0C0);
  }
  return result;
}

unint64_t sub_2468F3B38()
{
  unint64_t result;

  result = qword_2575EC0C8;
  if (!qword_2575EC0C8)
  {
    result = MEMORY[0x249562384](&unk_2468F58E4, &type metadata for _SiriMailMessage.StateChange.StateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC0C8);
  }
  return result;
}

unint64_t sub_2468F3B78()
{
  unint64_t result;

  result = qword_2575EC0D0;
  if (!qword_2575EC0D0)
  {
    result = MEMORY[0x249562384](&unk_2468F599C, &type metadata for _SiriMailMessage.StateChange.ActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC0D0);
  }
  return result;
}

unint64_t sub_2468F3BB8()
{
  unint64_t result;

  result = qword_2575EC0D8;
  if (!qword_2575EC0D8)
  {
    result = MEMORY[0x249562384](&unk_2468F5A54, &type metadata for _SiriMailMessage.StateChange.FocusedFieldCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC0D8);
  }
  return result;
}

unint64_t sub_2468F3BF8()
{
  unint64_t result;

  result = qword_2575EC0E0;
  if (!qword_2575EC0E0)
  {
    result = MEMORY[0x249562384](&unk_2468F5B0C, &type metadata for _SiriMailMessage.StateChange.BccCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC0E0);
  }
  return result;
}

unint64_t sub_2468F3C38()
{
  unint64_t result;

  result = qword_2575EC0E8;
  if (!qword_2575EC0E8)
  {
    result = MEMORY[0x249562384](&unk_2468F5BC4, &type metadata for _SiriMailMessage.StateChange.CcCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC0E8);
  }
  return result;
}

unint64_t sub_2468F3C78()
{
  unint64_t result;

  result = qword_2575EC0F0;
  if (!qword_2575EC0F0)
  {
    result = MEMORY[0x249562384](&unk_2468F5C7C, &type metadata for _SiriMailMessage.StateChange.ToCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC0F0);
  }
  return result;
}

unint64_t sub_2468F3CB8()
{
  unint64_t result;

  result = qword_2575EC0F8;
  if (!qword_2575EC0F8)
  {
    result = MEMORY[0x249562384](&unk_2468F5D34, &type metadata for _SiriMailMessage.StateChange.AttachmentsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC0F8);
  }
  return result;
}

unint64_t sub_2468F3CF8()
{
  unint64_t result;

  result = qword_2575EC100;
  if (!qword_2575EC100)
  {
    result = MEMORY[0x249562384](&unk_2468F5DEC, &type metadata for _SiriMailMessage.StateChange.BodyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC100);
  }
  return result;
}

unint64_t sub_2468F3D38()
{
  unint64_t result;

  result = qword_2575EC108;
  if (!qword_2575EC108)
  {
    result = MEMORY[0x249562384](&unk_2468F5EA4, &type metadata for _SiriMailMessage.StateChange.SubjectCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC108);
  }
  return result;
}

unint64_t sub_2468F3D78()
{
  unint64_t result;

  result = qword_2575EC110;
  if (!qword_2575EC110)
  {
    result = MEMORY[0x249562384](&unk_2468F5F5C, &type metadata for _SiriMailMessage.StateChange.ModelUpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC110);
  }
  return result;
}

unint64_t sub_2468F3DB8()
{
  unint64_t result;

  result = qword_2575EC118;
  if (!qword_2575EC118)
  {
    result = MEMORY[0x249562384](&unk_2468F6014, &type metadata for _SiriMailMessage.StateChange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC118);
  }
  return result;
}

unint64_t sub_2468F3DF8()
{
  unint64_t result;

  result = qword_2575EC120;
  if (!qword_2575EC120)
  {
    result = MEMORY[0x249562384](&unk_2468F60CC, &type metadata for _SiriMailMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC120);
  }
  return result;
}

unint64_t sub_2468F3E38()
{
  unint64_t result;

  result = qword_2575EC128;
  if (!qword_2575EC128)
  {
    result = MEMORY[0x249562384](&unk_2468F603C, &type metadata for _SiriMailMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC128);
  }
  return result;
}

unint64_t sub_2468F3E78()
{
  unint64_t result;

  result = qword_2575EC130;
  if (!qword_2575EC130)
  {
    result = MEMORY[0x249562384](&unk_2468F6064, &type metadata for _SiriMailMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC130);
  }
  return result;
}

unint64_t sub_2468F3EB8()
{
  unint64_t result;

  result = qword_2575EC138;
  if (!qword_2575EC138)
  {
    result = MEMORY[0x249562384](&unk_2468F5ECC, &type metadata for _SiriMailMessage.StateChange.ModelUpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC138);
  }
  return result;
}

unint64_t sub_2468F3EF8()
{
  unint64_t result;

  result = qword_2575EC140;
  if (!qword_2575EC140)
  {
    result = MEMORY[0x249562384](&unk_2468F5EF4, &type metadata for _SiriMailMessage.StateChange.ModelUpdateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC140);
  }
  return result;
}

unint64_t sub_2468F3F38()
{
  unint64_t result;

  result = qword_2575EC148;
  if (!qword_2575EC148)
  {
    result = MEMORY[0x249562384](&unk_2468F5E14, &type metadata for _SiriMailMessage.StateChange.SubjectCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC148);
  }
  return result;
}

unint64_t sub_2468F3F78()
{
  unint64_t result;

  result = qword_2575EC150;
  if (!qword_2575EC150)
  {
    result = MEMORY[0x249562384](&unk_2468F5E3C, &type metadata for _SiriMailMessage.StateChange.SubjectCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC150);
  }
  return result;
}

unint64_t sub_2468F3FB8()
{
  unint64_t result;

  result = qword_2575EC158;
  if (!qword_2575EC158)
  {
    result = MEMORY[0x249562384](&unk_2468F5D5C, &type metadata for _SiriMailMessage.StateChange.BodyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC158);
  }
  return result;
}

unint64_t sub_2468F3FF8()
{
  unint64_t result;

  result = qword_2575EC160;
  if (!qword_2575EC160)
  {
    result = MEMORY[0x249562384](&unk_2468F5D84, &type metadata for _SiriMailMessage.StateChange.BodyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC160);
  }
  return result;
}

unint64_t sub_2468F4038()
{
  unint64_t result;

  result = qword_2575EC168;
  if (!qword_2575EC168)
  {
    result = MEMORY[0x249562384](&unk_2468F5CA4, &type metadata for _SiriMailMessage.StateChange.AttachmentsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC168);
  }
  return result;
}

unint64_t sub_2468F4078()
{
  unint64_t result;

  result = qword_2575EC170;
  if (!qword_2575EC170)
  {
    result = MEMORY[0x249562384](&unk_2468F5CCC, &type metadata for _SiriMailMessage.StateChange.AttachmentsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC170);
  }
  return result;
}

unint64_t sub_2468F40B8()
{
  unint64_t result;

  result = qword_2575EC178;
  if (!qword_2575EC178)
  {
    result = MEMORY[0x249562384](&unk_2468F5BEC, &type metadata for _SiriMailMessage.StateChange.ToCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC178);
  }
  return result;
}

unint64_t sub_2468F40F8()
{
  unint64_t result;

  result = qword_2575EC180;
  if (!qword_2575EC180)
  {
    result = MEMORY[0x249562384](&unk_2468F5C14, &type metadata for _SiriMailMessage.StateChange.ToCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC180);
  }
  return result;
}

unint64_t sub_2468F4138()
{
  unint64_t result;

  result = qword_2575EC188;
  if (!qword_2575EC188)
  {
    result = MEMORY[0x249562384](&unk_2468F5B34, &type metadata for _SiriMailMessage.StateChange.CcCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC188);
  }
  return result;
}

unint64_t sub_2468F4178()
{
  unint64_t result;

  result = qword_2575EC190;
  if (!qword_2575EC190)
  {
    result = MEMORY[0x249562384](&unk_2468F5B5C, &type metadata for _SiriMailMessage.StateChange.CcCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC190);
  }
  return result;
}

unint64_t sub_2468F41B8()
{
  unint64_t result;

  result = qword_2575EC198;
  if (!qword_2575EC198)
  {
    result = MEMORY[0x249562384](&unk_2468F5A7C, &type metadata for _SiriMailMessage.StateChange.BccCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC198);
  }
  return result;
}

unint64_t sub_2468F41F8()
{
  unint64_t result;

  result = qword_2575EC1A0;
  if (!qword_2575EC1A0)
  {
    result = MEMORY[0x249562384](&unk_2468F5AA4, &type metadata for _SiriMailMessage.StateChange.BccCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC1A0);
  }
  return result;
}

unint64_t sub_2468F4238()
{
  unint64_t result;

  result = qword_2575EC1A8;
  if (!qword_2575EC1A8)
  {
    result = MEMORY[0x249562384](&unk_2468F59C4, &type metadata for _SiriMailMessage.StateChange.FocusedFieldCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC1A8);
  }
  return result;
}

unint64_t sub_2468F4278()
{
  unint64_t result;

  result = qword_2575EC1B0;
  if (!qword_2575EC1B0)
  {
    result = MEMORY[0x249562384](&unk_2468F59EC, &type metadata for _SiriMailMessage.StateChange.FocusedFieldCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC1B0);
  }
  return result;
}

unint64_t sub_2468F42B8()
{
  unint64_t result;

  result = qword_2575EC1B8;
  if (!qword_2575EC1B8)
  {
    result = MEMORY[0x249562384](&unk_2468F590C, &type metadata for _SiriMailMessage.StateChange.ActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC1B8);
  }
  return result;
}

unint64_t sub_2468F42F8()
{
  unint64_t result;

  result = qword_2575EC1C0;
  if (!qword_2575EC1C0)
  {
    result = MEMORY[0x249562384](&unk_2468F5934, &type metadata for _SiriMailMessage.StateChange.ActionCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC1C0);
  }
  return result;
}

unint64_t sub_2468F4338()
{
  unint64_t result;

  result = qword_2575EC1C8;
  if (!qword_2575EC1C8)
  {
    result = MEMORY[0x249562384](&unk_2468F5854, &type metadata for _SiriMailMessage.StateChange.StateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC1C8);
  }
  return result;
}

unint64_t sub_2468F4378()
{
  unint64_t result;

  result = qword_2575EC1D0;
  if (!qword_2575EC1D0)
  {
    result = MEMORY[0x249562384](&unk_2468F587C, &type metadata for _SiriMailMessage.StateChange.StateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC1D0);
  }
  return result;
}

unint64_t sub_2468F43B8()
{
  unint64_t result;

  result = qword_2575EC1D8;
  if (!qword_2575EC1D8)
  {
    result = MEMORY[0x249562384](&unk_2468F5F84, &type metadata for _SiriMailMessage.StateChange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC1D8);
  }
  return result;
}

unint64_t sub_2468F43F8()
{
  unint64_t result;

  result = qword_2575EC1E0;
  if (!qword_2575EC1E0)
  {
    result = MEMORY[0x249562384](&unk_2468F5FAC, &type metadata for _SiriMailMessage.StateChange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC1E0);
  }
  return result;
}

unint64_t sub_2468F4438()
{
  unint64_t result;

  result = qword_2575EC1E8;
  if (!qword_2575EC1E8)
  {
    result = MEMORY[0x249562384](&unk_2468F579C, &type metadata for _SiriMailMessage.MailAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC1E8);
  }
  return result;
}

unint64_t sub_2468F4478()
{
  unint64_t result;

  result = qword_2575EC1F0;
  if (!qword_2575EC1F0)
  {
    result = MEMORY[0x249562384](&unk_2468F57C4, &type metadata for _SiriMailMessage.MailAttachment.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC1F0);
  }
  return result;
}

unint64_t sub_2468F44B8()
{
  unint64_t result;

  result = qword_2575EC1F8;
  if (!qword_2575EC1F8)
  {
    result = MEMORY[0x249562384](&unk_2468F56E4, &type metadata for _SiriMailMessage.Account.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC1F8);
  }
  return result;
}

unint64_t sub_2468F44F8()
{
  unint64_t result;

  result = qword_2575EC200;
  if (!qword_2575EC200)
  {
    result = MEMORY[0x249562384](&unk_2468F570C, &type metadata for _SiriMailMessage.Account.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575EC200);
  }
  return result;
}

unint64_t sub_2468F4534()
{
  unint64_t result;

  result = qword_2575EC208;
  if (!qword_2575EC208)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage.Action, &type metadata for _SiriMailMessage.Action);
    atomic_store(result, (unint64_t *)&qword_2575EC208);
  }
  return result;
}

unint64_t sub_2468F4570()
{
  unint64_t result;

  result = qword_2575EC210;
  if (!qword_2575EC210)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage.Field, &type metadata for _SiriMailMessage.Field);
    atomic_store(result, (unint64_t *)&qword_2575EC210);
  }
  return result;
}

unint64_t sub_2468F45AC()
{
  unint64_t result;

  result = qword_2575EC218;
  if (!qword_2575EC218)
  {
    result = MEMORY[0x249562384](&protocol conformance descriptor for _SiriMailMessage.State, &type metadata for _SiriMailMessage.State);
    atomic_store(result, (unint64_t *)&qword_2575EC218);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 328) + 8))(v1, *(_QWORD *)(v0 + 336));
}

uint64_t OUTLINED_FUNCTION_2()
{
  return sub_2468F4C90();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return sub_2468F4C6C();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return sub_2468F4C48();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return sub_2468F4C18();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_8()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v0 + 344) = v1;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
}

uint64_t OUTLINED_FUNCTION_11()
{
  return sub_2468F4CA8();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_21(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 72) = a1;
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_2468F4C48();
}

uint64_t OUTLINED_FUNCTION_28@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_31@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return sub_2468F4C54();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return sub_2468F4C9C();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_38@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_39()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_41()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_42(unint64_t *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t *v4;

  return sub_2468F156C(a1, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_43()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_44()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_45@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_46@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 89) = a1;
  return sub_2468F4C9C();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return sub_2468F4CD8();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return sub_2468F4CB4();
}

uint64_t OUTLINED_FUNCTION_49@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_50()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_52()
{
  return sub_2468F4C54();
}

uint64_t OUTLINED_FUNCTION_54()
{
  return sub_2468F4C54();
}

uint64_t OUTLINED_FUNCTION_56()
{
  return sub_2468F4C9C();
}

uint64_t OUTLINED_FUNCTION_57()
{
  return sub_2468F4C30();
}

uint64_t OUTLINED_FUNCTION_58()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_59()
{
  return sub_2468F4C78();
}

uint64_t OUTLINED_FUNCTION_60()
{
  return sub_2468F4C90();
}

uint64_t OUTLINED_FUNCTION_61()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_62()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2468EAD8C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_63()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_64()
{
  return sub_2468F4C90();
}

uint64_t OUTLINED_FUNCTION_65()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_66()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_68()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 600) = *(_QWORD *)(v0 + 272);
  return v0 + 600;
}

uint64_t OUTLINED_FUNCTION_69()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_71()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_72()
{
  uint64_t v0;

  return v0;
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
  return sub_2468F4C48();
}

uint64_t OUTLINED_FUNCTION_77()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_78(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 192) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_79()
{
  return sub_2468F4BD0();
}

uint64_t OUTLINED_FUNCTION_80()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_81()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_82()
{
  uint64_t v0;

  return sub_2468EC818(v0 + 896);
}

uint64_t OUTLINED_FUNCTION_83()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 600) = *(_BYTE *)(v0 + 272);
  return v0 + 600;
}

uint64_t OUTLINED_FUNCTION_84()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_85()
{
  uint64_t v0;

  return v0 - 72;
}

uint64_t OUTLINED_FUNCTION_86()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_88()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_89()
{
  return sub_2468F4CB4();
}

uint64_t OUTLINED_FUNCTION_90()
{
  return sub_2468F4BD0();
}

void *OUTLINED_FUNCTION_91(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x142uLL);
}

uint64_t OUTLINED_FUNCTION_92()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_93()
{
  uint64_t v0;

  return sub_2468EC818(v0 + 896);
}

uint64_t OUTLINED_FUNCTION_94()
{
  return sub_2468F4C48();
}

_QWORD *OUTLINED_FUNCTION_95()
{
  _QWORD *v0;
  uint64_t v1;

  v0[75] = v0[32];
  v0[76] = v1;
  return v0 + 75;
}

unint64_t OUTLINED_FUNCTION_96()
{
  _QWORD *v0;
  uint64_t v1;

  __swift_project_boxed_opaque_existential_1(v0, v1);
  return sub_2468EC480();
}

uint64_t OUTLINED_FUNCTION_97()
{
  return sub_2468F4C9C();
}

uint64_t OUTLINED_FUNCTION_98()
{
  uint64_t v0;

  return v0 + 240;
}

uint64_t OUTLINED_FUNCTION_99()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2468EAD8C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_100()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_101()
{
  return sub_2468F4CC0();
}

uint64_t OUTLINED_FUNCTION_102(uint64_t a1, ...)
{
  uint64_t (*v1)(char *, uint64_t);
  uint64_t v2;
  va_list va;

  va_start(va, a1);
  return v1(va, v2);
}

uint64_t OUTLINED_FUNCTION_103()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2468F4B4C()
{
  return MEMORY[0x24BDB5F90]();
}

uint64_t sub_2468F4B58()
{
  return MEMORY[0x24BDB5FA8]();
}

uint64_t sub_2468F4B64()
{
  return MEMORY[0x24BDB5FD0]();
}

uint64_t sub_2468F4B70()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2468F4B7C()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2468F4B88()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2468F4B94()
{
  return MEMORY[0x24BDCDCC8]();
}

uint64_t sub_2468F4BA0()
{
  return MEMORY[0x24BE2E848]();
}

uint64_t sub_2468F4BAC()
{
  return MEMORY[0x24BE2E850]();
}

uint64_t sub_2468F4BB8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2468F4BC4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2468F4BD0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2468F4BDC()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_2468F4BE8()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_2468F4BF4()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_2468F4C00()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_2468F4C0C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2468F4C18()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_2468F4C24()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_2468F4C30()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2468F4C3C()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2468F4C48()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2468F4C54()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2468F4C60()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_2468F4C6C()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_2468F4C78()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_2468F4C84()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2468F4C90()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2468F4C9C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2468F4CA8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2468F4CB4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2468F4CC0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2468F4CCC()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2468F4CD8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2468F4CE4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2468F4CF0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2468F4CFC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2468F4D08()
{
  return MEMORY[0x24BEE4A10]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

