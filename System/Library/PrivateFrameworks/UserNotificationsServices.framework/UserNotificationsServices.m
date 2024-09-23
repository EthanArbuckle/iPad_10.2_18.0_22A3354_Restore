void sub_249B73D40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_249B73E10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

id UNSLogImageProvider()
{
  if (UNSLogImageProvider_onceToken != -1)
    dispatch_once(&UNSLogImageProvider_onceToken, &__block_literal_global_0);
  return (id)UNSLogImageProvider___logger;
}

id UNSLogCommunicationNotifications()
{
  if (UNSLogCommunicationNotifications_onceToken[0] != -1)
    dispatch_once(UNSLogCommunicationNotifications_onceToken, &__block_literal_global_3);
  return (id)UNSLogCommunicationNotifications___logger;
}

uint64_t UNSList.sections.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t UNSList.sections.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*UNSList.sections.modify())()
{
  return nullsub_1;
}

uint64_t UNSList.init(sections:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t UNSList.Section.groups.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t UNSList.Section.groups.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*UNSList.Section.groups.modify())()
{
  return nullsub_1;
}

uint64_t UNSList.Section.type.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(v1 + 8);
  v3 = *(_QWORD *)(v1 + 16);
  *a1 = v2;
  a1[1] = v3;
  return sub_249B77718(v2, v3);
}

uint64_t sub_249B77718(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 0xB)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t UNSList.Section.type.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  result = sub_249B7775C(*(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16));
  *(_QWORD *)(v1 + 8) = v2;
  *(_QWORD *)(v1 + 16) = v3;
  return result;
}

uint64_t sub_249B7775C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 0xB)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t (*UNSList.Section.type.modify())()
{
  return nullsub_1;
}

void UNSList.Section.id.getter()
{
  type metadata accessor for UNSList.Section.SectionType();
}

unint64_t sub_249B777AC()
{
  return UNSList.Section.SectionType.id.getter();
}

unint64_t UNSList.Section.SectionType.id.getter()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *v0;
  v2 = v0[1];
  v3 = 0x79726F74736968;
  switch(v2)
  {
    case 0uLL:
      break;
    case 1uLL:
    case 7uLL:
      v3 = 0xD000000000000011;
      break;
    case 2uLL:
      v3 = 0x676E696D6F636E69;
      break;
    case 3uLL:
    case 5uLL:
      v3 = 0x676E696D6F637075;
      break;
    case 4uLL:
      v3 = 0x44746E6572727563;
      break;
    case 6uLL:
      v3 = 0x6567694464616572;
      break;
    case 8uLL:
      v3 = 0xD000000000000010;
      break;
    case 9uLL:
      v3 = 0xD000000000000014;
      break;
    case 0xAuLL:
      v3 = 0x6867696C68676968;
      break;
    default:
      v3 = v1;
      break;
  }
  sub_249B77718(v1, v2);
  return v3;
}

void type metadata accessor for UNSList.Section.SectionType()
{
  JUMPOUT(0x24BCFFA44);
}

void UNSList.Section.isEmpty.getter()
{
  type metadata accessor for UNSList.Section.Group();
}

uint64_t sub_249B77970()
{
  uint64_t v0;

  v0 = sub_249B954B8();
  MEMORY[0x24BCFFA80](MEMORY[0x24BEE12E0], v0);
  return sub_249B954E8() & 1;
}

void type metadata accessor for UNSList.Section.Group()
{
  JUMPOUT(0x24BCFFA44);
}

uint64_t UNSList.Section.SectionType.init(id:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = a1 == 0x79726F74736968 && a2 == 0xE700000000000000;
  if (v4 || (v5 = a2, v6 = a1, (sub_249B95644() & 1) != 0))
  {
    result = swift_bridgeObjectRelease();
    v6 = 0;
    v5 = 0;
  }
  else if (v6 == 0xD000000000000011 && v5 == 0x8000000249B99880 || (sub_249B95644() & 1) != 0)
  {
    result = swift_bridgeObjectRelease();
    v6 = 0;
    v5 = 1;
  }
  else if (v6 == 0x676E696D6F636E69 && v5 == 0xE800000000000000 || (sub_249B95644() & 1) != 0)
  {
    result = swift_bridgeObjectRelease();
    v6 = 0;
    v5 = 2;
  }
  else if (v6 == 0x676E696D6F637075 && v5 == 0xEE0064657373694DLL || (sub_249B95644() & 1) != 0)
  {
    result = swift_bridgeObjectRelease();
    v6 = 0;
    v5 = 3;
  }
  else if (v6 == 0x44746E6572727563 && v5 == 0xED00007473656769 || (sub_249B95644() & 1) != 0)
  {
    result = swift_bridgeObjectRelease();
    v6 = 0;
    v5 = 4;
  }
  else if (v6 == 0x676E696D6F637075 && v5 == 0xEE00747365676944 || (sub_249B95644() & 1) != 0)
  {
    result = swift_bridgeObjectRelease();
    v6 = 0;
    v5 = 5;
  }
  else if (v6 == 0x6567694464616572 && v5 == 0xEA00000000007473 || (sub_249B95644() & 1) != 0)
  {
    result = swift_bridgeObjectRelease();
    v6 = 0;
    v5 = 6;
  }
  else if (v6 == 0xD000000000000011 && v5 == 0x8000000249B99860 || (sub_249B95644() & 1) != 0)
  {
    result = swift_bridgeObjectRelease();
    v6 = 0;
    v5 = 7;
  }
  else if (v6 == 0xD000000000000010 && v5 == 0x8000000249B99840 || (sub_249B95644() & 1) != 0)
  {
    result = swift_bridgeObjectRelease();
    v6 = 0;
    v5 = 8;
  }
  else if (v6 == 0xD000000000000014 && v5 == 0x8000000249B99820 || (sub_249B95644() & 1) != 0)
  {
    result = swift_bridgeObjectRelease();
    v6 = 0;
    v5 = 9;
  }
  else if (v6 == 0x6867696C68676968 && v5 == 0xEB00000000646574 || (result = sub_249B95644(), (result & 1) != 0))
  {
    result = swift_bridgeObjectRelease();
    v6 = 0;
    v5 = 10;
  }
  *a3 = v6;
  a3[1] = v5;
  return result;
}

uint64_t static UNSList.Section.SectionType.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  switch(v3)
  {
    case 0uLL:
      if (v5)
        goto LABEL_25;
      v3 = 0;
      v6 = 1;
      break;
    case 1uLL:
      if (v5 != 1)
        goto LABEL_25;
      v3 = 1;
      v6 = 1;
      break;
    case 2uLL:
      if (v5 != 2)
        goto LABEL_25;
      v6 = 1;
      v3 = 2;
      break;
    case 3uLL:
      if (v5 != 3)
        goto LABEL_25;
      v6 = 1;
      v3 = 3;
      break;
    case 4uLL:
      if (v5 != 4)
        goto LABEL_25;
      v6 = 1;
      v3 = 4;
      break;
    case 5uLL:
      if (v5 != 5)
        goto LABEL_25;
      v6 = 1;
      v3 = 5;
      break;
    case 6uLL:
      if (v5 != 6)
        goto LABEL_25;
      v6 = 1;
      v3 = 6;
      break;
    case 7uLL:
      if (v5 != 7)
        goto LABEL_25;
      v6 = 1;
      v3 = 7;
      break;
    case 8uLL:
      if (v5 != 8)
        goto LABEL_25;
      v6 = 1;
      v3 = 8;
      break;
    case 9uLL:
      if (v5 != 9)
        goto LABEL_25;
      v6 = 1;
      v3 = 9;
      break;
    case 0xAuLL:
      if (v5 != 10)
        goto LABEL_25;
      v6 = 1;
      v3 = 10;
      break;
    default:
      if (v5 >= 0xB)
      {
        if (v2 == v4 && v3 == v5)
          v6 = 1;
        else
          v6 = sub_249B95644();
      }
      else
      {
LABEL_25:
        v6 = 0;
      }
      sub_249B77718(v4, v5);
      sub_249B77718(v2, v3);
      break;
  }
  sub_249B7775C(v2, v3);
  sub_249B7775C(v4, v5);
  return v6 & 1;
}

uint64_t sub_249B78038()
{
  return 0;
}

uint64_t sub_249B78044@<X0>(_QWORD *a1@<X2>, _BYTE *a2@<X8>)
{
  return sub_249B78CD4(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))sub_249B78BDC, a2);
}

uint64_t sub_249B78050()
{
  return 0;
}

uint64_t sub_249B7805C@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_249B7DC70(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))sub_249B78BDC, a2);
}

uint64_t sub_249B78068(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B973D0, a1);
  return sub_249B956D4();
}

uint64_t sub_249B7809C(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B973D0, a1);
  return sub_249B956E0();
}

BOOL sub_249B780D0(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_249B780E0()
{
  return sub_249B95698();
}

uint64_t sub_249B78104(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x79726F74736968 && a2 == 0xE700000000000000;
  if (v2 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000249B99880 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x676E696D6F636E69 && a2 == 0xE800000000000000 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x676E696D6F637075 && a2 == 0xEE0064657373694DLL || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x44746E6572727563 && a2 == 0xED00007473656769 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x676E696D6F637075 && a2 == 0xEE00747365676944 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6567694464616572 && a2 == 0xEA00000000007473 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000249B99860 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000249B99840 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000249B99820 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6867696C68676968 && a2 == 0xEB00000000646574 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6669636570736E75 && a2 == 0xEB00000000646569)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    v6 = sub_249B95644();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 11;
    else
      return 12;
  }
}

uint64_t sub_249B78614(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_249B78648 + 4 * byte_249B95F56[a1]))(0x79726F74736968, 0xE700000000000000);
}

unint64_t sub_249B78648()
{
  return 0xD000000000000011;
}

unint64_t sub_249B78700()
{
  return 0xD000000000000010;
}

uint64_t sub_249B78738()
{
  return 0x6867696C68676968;
}

uint64_t sub_249B7875C()
{
  return 0x6669636570736E75;
}

uint64_t sub_249B7877C(unsigned __int8 *a1, unsigned __int8 *a2, _QWORD *a3, uint64_t a4)
{
  return sub_249B7C144(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_249B780D0);
}

uint64_t sub_249B7878C(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_249B7C18C(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_249B780E0);
}

uint64_t sub_249B78798(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_249B7C1AC(a1, a2, a3, (void (*)(_BYTE *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_249B780E0);
}

uint64_t sub_249B787A4(uint64_t a1, uint64_t a2)
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
    v3 = sub_249B95644();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_249B78810(_QWORD *a1, uint64_t a2)
{
  return sub_249B7C20C(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_249B78614);
}

uint64_t sub_249B7881C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_249B7CC14(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_249B78104, a4);
}

uint64_t sub_249B78828@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_249B7CC48(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))sub_249B7E57C, a2);
}

uint64_t sub_249B78834(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97150, a1);
  return sub_249B956D4();
}

uint64_t sub_249B78868(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97150, a1);
  return sub_249B956E0();
}

uint64_t sub_249B7889C(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B972E0, a1);
  return sub_249B956D4();
}

uint64_t sub_249B788D0(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B972E0, a1);
  return sub_249B956E0();
}

uint64_t sub_249B78904(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B974C0, a1);
  return sub_249B956D4();
}

uint64_t sub_249B78938(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B974C0, a1);
  return sub_249B956E0();
}

uint64_t sub_249B7896C(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B971A0, a1);
  return sub_249B956D4();
}

uint64_t sub_249B789A0(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B971A0, a1);
  return sub_249B956E0();
}

uint64_t sub_249B789D4(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97240, a1);
  return sub_249B956D4();
}

uint64_t sub_249B78A08(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97240, a1);
  return sub_249B956E0();
}

uint64_t sub_249B78A3C(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97470, a1);
  return sub_249B956D4();
}

uint64_t sub_249B78A70(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97470, a1);
  return sub_249B956E0();
}

uint64_t sub_249B78AA4(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97420, a1);
  return sub_249B956D4();
}

uint64_t sub_249B78AD8(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97420, a1);
  return sub_249B956E0();
}

uint64_t sub_249B78B0C(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B971F0, a1);
  return sub_249B956D4();
}

uint64_t sub_249B78B40(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B971F0, a1);
  return sub_249B956E0();
}

uint64_t sub_249B78B74(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97380, a1);
  return sub_249B956D4();
}

uint64_t sub_249B78BA8(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97380, a1);
  return sub_249B956E0();
}

uint64_t sub_249B78BDC()
{
  return 1;
}

uint64_t sub_249B78BEC()
{
  return 12383;
}

uint64_t sub_249B78BF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_249B7DC38(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_249B787A4, a4);
}

uint64_t sub_249B78C04(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97510, a1);
  return sub_249B956D4();
}

uint64_t sub_249B78C38(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97510, a1);
  return sub_249B956E0();
}

uint64_t sub_249B78C6C(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97330, a1);
  return sub_249B956D4();
}

uint64_t sub_249B78CA0(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97330, a1);
  return sub_249B956E0();
}

uint64_t sub_249B78CD4@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD, _QWORD, _QWORD, _QWORD)@<X4>, _BYTE *a3@<X8>)
{
  char v4;
  uint64_t result;

  v4 = a2(a1[2], a1[3], a1[4], a1[5]);
  result = swift_bridgeObjectRelease();
  *a3 = v4 & 1;
  return result;
}

uint64_t sub_249B78D20(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97290, a1);
  return sub_249B956D4();
}

uint64_t sub_249B78D54(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97290, a1);
  return sub_249B956E0();
}

void UNSList.Section.SectionType.encode(to:)()
{
  type metadata accessor for UNSList.Section.SectionType.UnspecifiedCodingKeys();
}

void sub_249B78DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v13 - 176) = MEMORY[0x24BCFFA80](&unk_249B97510, a1);
  *(_QWORD *)(v13 - 168) = a1;
  v15 = sub_249B95638();
  *(_QWORD *)(v13 - 152) = v15;
  *(_QWORD *)(v13 - 184) = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v13 - 160) = (char *)&a9 - v16;
  *(_QWORD *)(v13 - 120) = v9;
  *(_QWORD *)(v13 - 112) = v10;
  *(_QWORD *)(v13 - 104) = v11;
  *(_QWORD *)(v13 - 96) = v12;
  type metadata accessor for UNSList.Section.SectionType.HighlightedCodingKeys();
}

void sub_249B78E40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v13 - 200) = MEMORY[0x24BCFFA80](&unk_249B974C0, a1);
  *(_QWORD *)(v13 - 192) = a1;
  v15 = sub_249B95638();
  *(_QWORD *)(v13 - 216) = *(_QWORD *)(v15 - 8);
  *(_QWORD *)(v13 - 208) = v15;
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v13 - 224) = (char *)&a9 - v16;
  *(_QWORD *)(v13 - 120) = v9;
  *(_QWORD *)(v13 - 112) = v10;
  *(_QWORD *)(v13 - 104) = v11;
  *(_QWORD *)(v13 - 96) = v12;
  type metadata accessor for UNSList.Section.SectionType.InlineFeaturedDigestCodingKeys();
}

void sub_249B78EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v13 - 240) = MEMORY[0x24BCFFA80](&unk_249B97470, a1);
  *(_QWORD *)(v13 - 232) = a1;
  v15 = sub_249B95638();
  *(_QWORD *)(v13 - 256) = *(_QWORD *)(v15 - 8);
  *(_QWORD *)(v13 - 248) = v15;
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v13 - 264) = (char *)&a9 - v16;
  *(_QWORD *)(v13 - 120) = v9;
  *(_QWORD *)(v13 - 112) = v10;
  *(_QWORD *)(v13 - 104) = v11;
  *(_QWORD *)(v13 - 96) = v12;
  type metadata accessor for UNSList.Section.SectionType.OnboardingDigestCodingKeys();
}

void sub_249B78F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v15 = MEMORY[0x24BCFFA80](&unk_249B97420, a1);
  *(_QWORD *)(v13 - 272) = a1;
  *(_QWORD *)(v13 - 280) = v15;
  v16 = sub_249B95638();
  *(_QWORD *)(v13 - 288) = v16;
  *(_QWORD *)(v13 - 296) = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v13 - 304) = (char *)&a9 - v17;
  *(_QWORD *)(v13 - 120) = v9;
  *(_QWORD *)(v13 - 112) = v10;
  *(_QWORD *)(v13 - 104) = v11;
  *(_QWORD *)(v13 - 96) = v12;
  type metadata accessor for UNSList.Section.SectionType.ApplicationDigestCodingKeys();
}

void sub_249B78FA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v15 = MEMORY[0x24BCFFA80](&unk_249B973D0, a1);
  *(_QWORD *)(v13 - 312) = a1;
  *(_QWORD *)(v13 - 320) = v15;
  v16 = sub_249B95638();
  *(_QWORD *)(v13 - 328) = v16;
  *(_QWORD *)(v13 - 336) = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v13 - 344) = (char *)&a9 - v17;
  *(_QWORD *)(v13 - 120) = v9;
  *(_QWORD *)(v13 - 112) = v10;
  *(_QWORD *)(v13 - 104) = v11;
  *(_QWORD *)(v13 - 96) = v12;
  type metadata accessor for UNSList.Section.SectionType.ReadDigestCodingKeys();
}

void sub_249B7902C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v15 = MEMORY[0x24BCFFA80](&unk_249B97380, a1);
  *(_QWORD *)(v13 - 352) = a1;
  *(_QWORD *)(v13 - 360) = v15;
  v16 = sub_249B95638();
  *(_QWORD *)(v13 - 368) = v16;
  *(_QWORD *)(v13 - 376) = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v13 - 384) = (char *)&a9 - v17;
  *(_QWORD *)(v13 - 120) = v9;
  *(_QWORD *)(v13 - 112) = v10;
  *(_QWORD *)(v13 - 104) = v11;
  *(_QWORD *)(v13 - 96) = v12;
  type metadata accessor for UNSList.Section.SectionType.UpcomingDigestCodingKeys();
}

void sub_249B790B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v15 = MEMORY[0x24BCFFA80](&unk_249B97330, a1);
  *(_QWORD *)(v13 - 392) = a1;
  *(_QWORD *)(v13 - 400) = v15;
  v16 = sub_249B95638();
  *(_QWORD *)(v13 - 408) = v16;
  *(_QWORD *)(v13 - 416) = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v13 - 424) = (char *)&a9 - v17;
  *(_QWORD *)(v13 - 120) = v9;
  *(_QWORD *)(v13 - 112) = v10;
  *(_QWORD *)(v13 - 104) = v11;
  *(_QWORD *)(v13 - 96) = v12;
  type metadata accessor for UNSList.Section.SectionType.CurrentDigestCodingKeys();
}

void sub_249B7913C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v15 = MEMORY[0x24BCFFA80](&unk_249B972E0, a1);
  *(_QWORD *)(v13 - 432) = a1;
  *(_QWORD *)(v13 - 440) = v15;
  v16 = sub_249B95638();
  *(_QWORD *)(v13 - 448) = v16;
  *(_QWORD *)(v13 - 456) = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v13 - 464) = (char *)&a9 - v17;
  *(_QWORD *)(v13 - 120) = v9;
  *(_QWORD *)(v13 - 112) = v10;
  *(_QWORD *)(v13 - 104) = v11;
  *(_QWORD *)(v13 - 96) = v12;
  type metadata accessor for UNSList.Section.SectionType.UpcomingMissedCodingKeys();
}

void sub_249B791C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v15 = MEMORY[0x24BCFFA80](&unk_249B97290, a1);
  *(_QWORD *)(v13 - 472) = a1;
  *(_QWORD *)(v13 - 480) = v15;
  v16 = sub_249B95638();
  *(_QWORD *)(v13 - 488) = v16;
  *(_QWORD *)(v13 - 496) = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v13 - 504) = (char *)&a9 - v17;
  *(_QWORD *)(v13 - 120) = v9;
  *(_QWORD *)(v13 - 112) = v10;
  *(_QWORD *)(v13 - 104) = v11;
  *(_QWORD *)(v13 - 96) = v12;
  type metadata accessor for UNSList.Section.SectionType.IncomingCodingKeys();
}

void sub_249B7924C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v15 = MEMORY[0x24BCFFA80](&unk_249B97240, a1);
  *(_QWORD *)(v13 - 512) = a1;
  *(_QWORD *)(v13 - 520) = v15;
  v16 = sub_249B95638();
  *(_QWORD *)(v13 - 528) = v16;
  *(_QWORD *)(v13 - 536) = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v13 - 544) = (char *)&a9 - v17;
  *(_QWORD *)(v13 - 120) = v9;
  *(_QWORD *)(v13 - 112) = v10;
  *(_QWORD *)(v13 - 104) = v11;
  *(_QWORD *)(v13 - 96) = v12;
  type metadata accessor for UNSList.Section.SectionType.ProminentIncomingCodingKeys();
}

void sub_249B792D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(v13 - 552) = MEMORY[0x24BCFFA80](&unk_249B971F0, a1);
  v14 = sub_249B95638();
  *(_QWORD *)(v13 - 560) = v14;
  *(_QWORD *)(v13 - 568) = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v13 - 576) = (char *)&a9 - v15;
  *(_QWORD *)(v13 - 120) = v9;
  *(_QWORD *)(v13 - 112) = v10;
  *(_QWORD *)(v13 - 104) = v11;
  *(_QWORD *)(v13 - 96) = v12;
  type metadata accessor for UNSList.Section.SectionType.HistoryCodingKeys();
}

void sub_249B79354(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v5 - 584) = MEMORY[0x24BCFFA80](&unk_249B971A0, a1);
  v6 = sub_249B95638();
  *(_QWORD *)(v5 - 592) = v6;
  *(_QWORD *)(v5 - 600) = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v5 - 120) = v1;
  *(_QWORD *)(v5 - 112) = v2;
  *(_QWORD *)(v5 - 104) = v3;
  *(_QWORD *)(v5 - 96) = v4;
  type metadata accessor for UNSList.Section.SectionType.CodingKeys();
}

uint64_t sub_249B793CC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
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

  MEMORY[0x24BCFFA80](&unk_249B97150, a1);
  v4 = sub_249B95638();
  *(_QWORD *)(v3 - 144) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 - 136) = v4;
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v30 - v5;
  v7 = *(_QWORD **)(v3 - 72);
  v8 = v7[1];
  *(_QWORD *)(v3 - 608) = *v7;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  *(_QWORD *)(v3 - 72) = v6;
  sub_249B956C8();
  switch(v8)
  {
    case 0:
      *(_BYTE *)(v3 - 120) = 0;
      v9 = *(_QWORD *)(v3 - 136);
      v10 = *(_QWORD *)(v3 - 72);
      sub_249B955F0();
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 600) + 8))(v1, *(_QWORD *)(v3 - 592));
      goto LABEL_16;
    case 1:
      *(_BYTE *)(v3 - 120) = 1;
      v17 = *(_QWORD *)(v3 - 576);
      v18 = *(_QWORD *)(v3 - 136);
      v19 = *(_QWORD *)(v3 - 72);
      sub_249B955F0();
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 568) + 8))(v17, *(_QWORD *)(v3 - 560));
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 144) + 8))(v19, v18);
    case 2:
      *(_BYTE *)(v3 - 120) = 2;
      v20 = *(_QWORD *)(v3 - 544);
      v18 = *(_QWORD *)(v3 - 136);
      v19 = *(_QWORD *)(v3 - 72);
      sub_249B955F0();
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 536) + 8))(v20, *(_QWORD *)(v3 - 528));
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 144) + 8))(v19, v18);
    case 3:
      *(_BYTE *)(v3 - 120) = 3;
      v21 = *(_QWORD *)(v3 - 504);
      v18 = *(_QWORD *)(v3 - 136);
      v19 = *(_QWORD *)(v3 - 72);
      sub_249B955F0();
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 496) + 8))(v21, *(_QWORD *)(v3 - 488));
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 144) + 8))(v19, v18);
    case 4:
      *(_BYTE *)(v3 - 120) = 4;
      v22 = *(_QWORD *)(v3 - 464);
      v18 = *(_QWORD *)(v3 - 136);
      v19 = *(_QWORD *)(v3 - 72);
      sub_249B955F0();
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 456) + 8))(v22, *(_QWORD *)(v3 - 448));
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 144) + 8))(v19, v18);
    case 5:
      *(_BYTE *)(v3 - 120) = 5;
      v23 = *(_QWORD *)(v3 - 424);
      v18 = *(_QWORD *)(v3 - 136);
      v19 = *(_QWORD *)(v3 - 72);
      sub_249B955F0();
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 416) + 8))(v23, *(_QWORD *)(v3 - 408));
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 144) + 8))(v19, v18);
    case 6:
      *(_BYTE *)(v3 - 120) = 6;
      v24 = *(_QWORD *)(v3 - 384);
      v18 = *(_QWORD *)(v3 - 136);
      v19 = *(_QWORD *)(v3 - 72);
      sub_249B955F0();
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 376) + 8))(v24, *(_QWORD *)(v3 - 368));
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 144) + 8))(v19, v18);
    case 7:
      *(_BYTE *)(v3 - 120) = 7;
      v25 = *(_QWORD *)(v3 - 344);
      v18 = *(_QWORD *)(v3 - 136);
      v19 = *(_QWORD *)(v3 - 72);
      sub_249B955F0();
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 336) + 8))(v25, *(_QWORD *)(v3 - 328));
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 144) + 8))(v19, v18);
    case 8:
      *(_BYTE *)(v3 - 120) = 8;
      v26 = *(_QWORD *)(v3 - 304);
      v18 = *(_QWORD *)(v3 - 136);
      v19 = *(_QWORD *)(v3 - 72);
      sub_249B955F0();
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 296) + 8))(v26, *(_QWORD *)(v3 - 288));
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 144) + 8))(v19, v18);
    case 9:
      *(_BYTE *)(v3 - 120) = 9;
      v27 = *(_QWORD *)(v3 - 264);
      v9 = *(_QWORD *)(v3 - 136);
      v10 = *(_QWORD *)(v3 - 72);
      sub_249B955F0();
      v29 = *(_QWORD *)(v3 - 256);
      v28 = *(_QWORD *)(v3 - 248);
      goto LABEL_15;
    case 10:
      *(_BYTE *)(v3 - 120) = 10;
      v27 = *(_QWORD *)(v3 - 224);
      v9 = *(_QWORD *)(v3 - 136);
      v10 = *(_QWORD *)(v3 - 72);
      sub_249B955F0();
      v29 = *(_QWORD *)(v3 - 216);
      v28 = *(_QWORD *)(v3 - 208);
LABEL_15:
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v27, v28);
LABEL_16:
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 144) + 8))(v10, v9);
      break;
    default:
      v11 = *(_QWORD *)(v3 - 184);
      *(_BYTE *)(v3 - 120) = 11;
      v12 = *(_QWORD *)(v3 - 160);
      v13 = *(_QWORD *)(v3 - 136);
      v14 = *(_QWORD *)(v3 - 72);
      sub_249B955F0();
      v15 = *(_QWORD *)(v3 - 152);
      sub_249B95614();
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v15);
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 144) + 8))(v14, v13);
      break;
  }
  return result;
}

void type metadata accessor for UNSList.Section.SectionType.UnspecifiedCodingKeys()
{
  JUMPOUT(0x24BCFFA44);
}

void type metadata accessor for UNSList.Section.SectionType.HighlightedCodingKeys()
{
  JUMPOUT(0x24BCFFA44);
}

void type metadata accessor for UNSList.Section.SectionType.InlineFeaturedDigestCodingKeys()
{
  JUMPOUT(0x24BCFFA44);
}

void type metadata accessor for UNSList.Section.SectionType.OnboardingDigestCodingKeys()
{
  JUMPOUT(0x24BCFFA44);
}

void type metadata accessor for UNSList.Section.SectionType.ApplicationDigestCodingKeys()
{
  JUMPOUT(0x24BCFFA44);
}

void type metadata accessor for UNSList.Section.SectionType.ReadDigestCodingKeys()
{
  JUMPOUT(0x24BCFFA44);
}

void type metadata accessor for UNSList.Section.SectionType.UpcomingDigestCodingKeys()
{
  JUMPOUT(0x24BCFFA44);
}

void type metadata accessor for UNSList.Section.SectionType.CurrentDigestCodingKeys()
{
  JUMPOUT(0x24BCFFA44);
}

void type metadata accessor for UNSList.Section.SectionType.UpcomingMissedCodingKeys()
{
  JUMPOUT(0x24BCFFA44);
}

void type metadata accessor for UNSList.Section.SectionType.IncomingCodingKeys()
{
  JUMPOUT(0x24BCFFA44);
}

void type metadata accessor for UNSList.Section.SectionType.ProminentIncomingCodingKeys()
{
  JUMPOUT(0x24BCFFA44);
}

void type metadata accessor for UNSList.Section.SectionType.HistoryCodingKeys()
{
  JUMPOUT(0x24BCFFA44);
}

void type metadata accessor for UNSList.Section.SectionType.CodingKeys()
{
  JUMPOUT(0x24BCFFA44);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void UNSList.Section.SectionType.init(from:)()
{
  type metadata accessor for UNSList.Section.SectionType.UnspecifiedCodingKeys();
}

void sub_249B7A3B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 160) = 1;
  v3 = *(_QWORD *)(v2 - 496);
  v4 = *(_QWORD *)(v2 - 688);
  sub_249B95584();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 656) + 8))(v3, *(_QWORD *)(v2 - 648));
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 680) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 392);
    *v5 = 0;
    v5[1] = 1;
    JUMPOUT(0x249B7A388);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x249B7A380);
}

void sub_249B7A440()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 160) = 2;
  v3 = *(_QWORD *)(v2 - 472);
  v4 = *(_QWORD *)(v2 - 688);
  sub_249B95584();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 640) + 8))(v3, *(_QWORD *)(v2 - 632));
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 680) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 392);
    *v5 = 0;
    v5[1] = 2;
    JUMPOUT(0x249B7A388);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x249B7A380);
}

void sub_249B7A4CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 160) = 3;
  v3 = *(_QWORD *)(v2 - 456);
  v4 = *(_QWORD *)(v2 - 688);
  sub_249B95584();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 624) + 8))(v3, *(_QWORD *)(v2 - 616));
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 680) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 392);
    *v5 = 0;
    v5[1] = 3;
    JUMPOUT(0x249B7A388);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x249B7A380);
}

void sub_249B7A554()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 160) = 4;
  v3 = *(_QWORD *)(v2 - 448);
  v4 = *(_QWORD *)(v2 - 688);
  sub_249B95584();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 608) + 8))(v3, *(_QWORD *)(v2 - 600));
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 680) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 392);
    *v5 = 0;
    v5[1] = 4;
    JUMPOUT(0x249B7A388);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x249B7A380);
}

void sub_249B7A5DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 160) = 5;
  v3 = *(_QWORD *)(v2 - 440);
  v4 = *(_QWORD *)(v2 - 688);
  sub_249B95584();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 592) + 8))(v3, *(_QWORD *)(v2 - 584));
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 680) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 392);
    *v5 = 0;
    v5[1] = 5;
    JUMPOUT(0x249B7A388);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x249B7A380);
}

void sub_249B7A664()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 160) = 6;
  v3 = *(_QWORD *)(v2 - 432);
  v4 = *(_QWORD *)(v2 - 688);
  sub_249B95584();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 576) + 8))(v3, *(_QWORD *)(v2 - 568));
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 680) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 392);
    *v5 = 0;
    v5[1] = 6;
    JUMPOUT(0x249B7A388);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x249B7A380);
}

void sub_249B7A6EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 160) = 7;
  v3 = *(_QWORD *)(v2 - 424);
  v4 = *(_QWORD *)(v2 - 688);
  sub_249B95584();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 560) + 8))(v3, *(_QWORD *)(v2 - 552));
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 680) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 392);
    *v5 = 0;
    v5[1] = 7;
    JUMPOUT(0x249B7A388);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x249B7A380);
}

void sub_249B7A774()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 160) = 8;
  v3 = *(_QWORD *)(v2 - 416);
  v4 = *(_QWORD *)(v2 - 688);
  sub_249B95584();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 544) + 8))(v3, *(_QWORD *)(v2 - 536));
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 680) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 392);
    *v5 = 0;
    v5[1] = 8;
    JUMPOUT(0x249B7A388);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x249B7A380);
}

void sub_249B7A7FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *(_BYTE *)(v2 - 160) = 9;
  v3 = *(_QWORD *)(v2 - 408);
  v4 = *(_QWORD *)(v2 - 688);
  sub_249B95584();
  if (!v4)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 528) + 8))(v3, *(_QWORD *)(v2 - 520));
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 680) + 8))(v1, v0);
    v5 = *(_QWORD **)(v2 - 392);
    *v5 = 0;
    v5[1] = 9;
    JUMPOUT(0x249B7A388);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x249B7A380);
}

void sub_249B7A884()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  *(_BYTE *)(v4 - 160) = 10;
  v5 = *(_QWORD *)(v4 - 400);
  v6 = *(_QWORD *)(v4 - 688);
  sub_249B95584();
  if (!v6)
  {
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v0);
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 680) + 8))(v3, v1);
    v7 = *(_QWORD **)(v4 - 392);
    *v7 = 0;
    v7[1] = 10;
    JUMPOUT(0x249B7A388);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x249B7A380);
}

void sub_249B7A8FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v5 - 160) = 11;
  v6 = *(_QWORD *)(v5 - 688);
  sub_249B95584();
  if (v6)
    JUMPOUT(0x249B7A92CLL);
  sub_249B955B4();
  v7 = *(_QWORD *)(v5 - 680);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v1);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v4, v0);
  JUMPOUT(0x249B7A9C4);
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BCFFA68]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_249B7AA38()
{
  UNSList.Section.SectionType.init(from:)();
}

void sub_249B7AA58()
{
  UNSList.Section.SectionType.encode(to:)();
}

unint64_t sub_249B7AA70@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;
  unint64_t v3;

  result = UNSList.Section.SectionType.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

__n128 UNSList.Section.init(groups:type:)@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, uint64_t a3@<X8>)
{
  __n128 result;

  *(_QWORD *)a3 = a1;
  result = *a2;
  *(__n128 *)(a3 + 8) = *a2;
  return result;
}

void UNSList.Section.Group.GroupingMethod.init(from:)()
{
  type metadata accessor for UNSList.Section.Group.GroupingMethod.CodingKeys();
}

uint64_t sub_249B7AAE4(uint64_t a1)
{
  _QWORD *v1;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  MEMORY[0x24BCFFA80](&unk_249B97100, a1);
  v4 = sub_249B955E4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v20 - v6;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_249B956BC();
  if (!v2)
  {
    *(_BYTE *)(v3 - 112) = 0;
    v8 = sub_249B955B4();
    v10 = v9;
    *(_BYTE *)(v3 - 112) = 1;
    v11 = sub_249B955B4();
    v13 = v12;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (v10)
      v14 = v8;
    else
      v14 = v11;
    if (v10)
      v15 = v10;
    else
      v15 = v13;
    if (v10)
      v16 = v11;
    else
      v16 = 0;
    if (v10)
      v17 = v13;
    else
      v17 = 0;
    v18 = *(_QWORD *)(v3 - 72);
    *(_QWORD *)v18 = v14;
    *(_QWORD *)(v18 + 8) = v15;
    *(_QWORD *)(v18 + 16) = v16;
    *(_QWORD *)(v18 + 24) = v17;
    *(_BYTE *)(v18 + 32) = v10 == 0;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
}

void type metadata accessor for UNSList.Section.Group.GroupingMethod.CodingKeys()
{
  JUMPOUT(0x24BCFFA44);
}

void UNSList.Section.Group.GroupingMethod.encode(to:)()
{
  type metadata accessor for UNSList.Section.Group.GroupingMethod.CodingKeys();
}

uint64_t sub_249B7ACC4(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  MEMORY[0x24BCFFA80](&unk_249B97100, a1);
  v4 = sub_249B95638();
  v5 = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 - 128) = v4;
  *(_QWORD *)(v3 - 120) = v5;
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v13 - v6;
  v8 = *v1;
  *(_QWORD *)(v3 - 144) = v1[1];
  *(_QWORD *)(v3 - 136) = v8;
  *(_QWORD *)(v3 - 152) = v1[2];
  v9 = *((unsigned __int8 *)v1 + 32);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_249B956C8();
  if (!v9)
  {
    *(_BYTE *)(v3 - 112) = 0;
    v10 = *(_QWORD *)(v3 - 128);
    v11 = *(_QWORD *)(v3 - 72);
    sub_249B95614();
    if (v11)
      return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v3 - 120) + 8))(v7, v10);
    *(_BYTE *)(v3 - 112) = 1;
LABEL_6:
    sub_249B95614();
    return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v3 - 120) + 8))(v7, v10);
  }
  if (v9 == 1)
  {
    *(_BYTE *)(v3 - 112) = 1;
    v10 = *(_QWORD *)(v3 - 128);
    goto LABEL_6;
  }
  return (*(uint64_t (**)(char *, _QWORD))(*(_QWORD *)(v3 - 120) + 8))(v7, *(_QWORD *)(v3 - 128));
}

uint64_t UNSList.Section.Group.GroupingMethod.init(fromUniqueIdentifier:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    sub_249B9541C();
    swift_bridgeObjectRelease();
    sub_249B9541C();
    sub_249B7B11C();
    v5 = (_QWORD *)sub_249B95524();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = v5[2];
    if (v6 == 1)
    {
      v10 = 0;
      v9 = 0;
    }
    else
    {
      if (v6 != 2 || (swift_bridgeObjectRetain(), v7 = sub_249B953E0(), result = swift_bridgeObjectRelease(), v7 <= 0))
      {
LABEL_19:
        result = swift_bridgeObjectRelease();
        *(_OWORD *)a3 = 0u;
        *(_OWORD *)(a3 + 16) = 0u;
        v11 = -1;
        goto LABEL_20;
      }
      if (v5[2] < 2uLL)
      {
LABEL_24:
        __break(1u);
        return result;
      }
      v10 = v5[6];
      v9 = v5[7];
      swift_bridgeObjectRetain();
    }
    result = sub_249B9541C();
    if (v5[2])
    {
      swift_bridgeObjectRetain();
      v12 = sub_249B95428();
      swift_bridgeObjectRelease();
      if ((v12 & 1) != 0)
      {
        v13 = v5[4];
        v14 = v5[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v15 = sub_249B953E0();
        swift_bridgeObjectRelease();
        v16 = sub_249B7E584(v15, v13, v14);
        v18 = v17;
        v20 = v19;
        v22 = v21;
        swift_bridgeObjectRelease();
        v23 = MEMORY[0x24BCFF3B4](v16, v18, v20, v22);
        v25 = v24;
        swift_bridgeObjectRelease();
        result = sub_249B953E0();
        if (result >= 1)
        {
          if (v9)
          {
            *(_QWORD *)a3 = v10;
            *(_QWORD *)(a3 + 8) = v9;
            *(_QWORD *)(a3 + 16) = v23;
            *(_QWORD *)(a3 + 24) = v25;
            *(_BYTE *)(a3 + 32) = 0;
            return result;
          }
          *(_QWORD *)a3 = v23;
          *(_QWORD *)(a3 + 8) = v25;
          *(_QWORD *)(a3 + 16) = 0;
          *(_QWORD *)(a3 + 24) = 0;
          v11 = 1;
          goto LABEL_20;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
    __break(1u);
    goto LABEL_24;
  }
  result = swift_bridgeObjectRelease();
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  v11 = 2;
LABEL_20:
  *(_BYTE *)(a3 + 32) = v11;
  return result;
}

unint64_t sub_249B7B0E8()
{
  return 0xD000000000000010;
}

unint64_t sub_249B7B11C()
{
  unint64_t result;

  result = qword_2578C1AA0;
  if (!qword_2578C1AA0)
  {
    result = MEMORY[0x24BCFFA80](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2578C1AA0);
  }
  return result;
}

unint64_t UNSList.Section.Group.GroupingMethod.id.getter()
{
  uint64_t v0;

  if (!*(_BYTE *)(v0 + 32))
  {
    sub_249B9541C();
    sub_249B9541C();
    sub_249B9541C();
    sub_249B9541C();
    swift_bridgeObjectRelease();
LABEL_5:
    sub_249B9541C();
    sub_249B9541C();
    return 0xD000000000000010;
  }
  if (*(_BYTE *)(v0 + 32) == 1)
    goto LABEL_5;
  return 0;
}

uint64_t UNSList.Section.Group.GroupingMethod.bundleIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  if (*((_BYTE *)v0 + 32))
  {
    if (*((_BYTE *)v0 + 32) != 1)
      return 0;
  }
  else
  {
    v0 += 2;
  }
  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static UNSList.Section.Group.GroupingMethod.CodingError.== infix(_:_:)()
{
  return 1;
}

uint64_t UNSList.Section.Group.GroupingMethod.CodingError.hash(into:)()
{
  return sub_249B95698();
}

uint64_t UNSList.Section.Group.GroupingMethod.CodingError.hashValue.getter()
{
  sub_249B9568C();
  sub_249B95698();
  return sub_249B956B0();
}

uint64_t sub_249B7B348()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_249B95578();
  swift_bridgeObjectRelease();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t sub_249B7B398(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24BCFFA80](&unk_249B96D48, a3);
  return sub_249B95650();
}

uint64_t sub_249B7B3EC(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B96D48, a1);
  return sub_249B9547C();
}

uint64_t sub_249B7B438()
{
  MEMORY[0x24BCFFA80](&unk_249B96D48);
  return sub_249B95494();
}

uint64_t sub_249B7B488()
{
  MEMORY[0x24BCFFA80](&unk_249B96D48);
  return sub_249B95488();
}

uint64_t sub_249B7B4D8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_249B7B348();
  *a1 = result;
  return result;
}

unint64_t sub_249B7B510@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;
  unint64_t v3;

  result = sub_249B7B0E8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_249B7B544(_QWORD *a1, uint64_t a2)
{
  return sub_249B7CBF0(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_249B7B0E8);
}

uint64_t sub_249B7B550@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_249B7CC14(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_249B7B348, a4);
}

uint64_t sub_249B7B55C@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_249B7CC48(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))sub_249B7E7EC, a2);
}

uint64_t sub_249B7B568(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97100, a1);
  return sub_249B956D4();
}

uint64_t sub_249B7B59C(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97100, a1);
  return sub_249B956E0();
}

uint64_t static UNSList.Section.Group.GroupingMethod.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char v13;
  BOOL v14;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v3 = *(_QWORD *)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v6 = *(unsigned __int8 *)(a1 + 32);
  v8 = *(_QWORD *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v10 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a2 + 24);
  v11 = *(unsigned __int8 *)(a2 + 32);
  if (*(_BYTE *)(a1 + 32))
  {
    if (v6 == 1)
    {
      if (v11 == 1)
      {
        if (v3 == v8 && v2 == v7)
          v13 = 1;
        else
          v13 = sub_249B95644();
        sub_249B7E620(v8, v7, v10, v9, 1);
        sub_249B7E620(v3, v2, v5, v4, 1);
        sub_249B7E66C(v3, v2, v5, v4, 1);
        sub_249B7E66C(v8, v7, v10, v9, 1);
        return v13 & 1;
      }
    }
    else if (v11 == 2 && (v7 | v8 | v10 | v9) == 0)
    {
      sub_249B7E66C(*(_QWORD *)a1, v2, v5, v4, 2);
      sub_249B7E66C(0, 0, 0, 0, 2);
      v13 = 1;
      return v13 & 1;
    }
    goto LABEL_24;
  }
  if (*(_BYTE *)(a2 + 32))
  {
LABEL_24:
    sub_249B7E620(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), v10, v9, v11);
    sub_249B7E620(v3, v2, v5, v4, v6);
    sub_249B7E66C(v3, v2, v5, v4, v6);
    v17 = v8;
    v18 = v7;
    v19 = v10;
    v20 = v9;
    v21 = v11;
LABEL_25:
    sub_249B7E66C(v17, v18, v19, v20, v21);
    v13 = 0;
    return v13 & 1;
  }
  v14 = v3 == v8 && v2 == v7;
  if (!v14 && (sub_249B95644() & 1) == 0)
  {
    sub_249B7E620(v8, v7, v10, v9, 0);
    sub_249B7E620(v3, v2, v5, v4, 0);
    sub_249B7E66C(v3, v2, v5, v4, 0);
    v17 = v8;
    v18 = v7;
    v19 = v10;
    v20 = v9;
    v21 = 0;
    goto LABEL_25;
  }
  if (v5 == v10 && v4 == v9)
    v13 = 1;
  else
    v13 = sub_249B95644();
  sub_249B7E620(v8, v7, v10, v9, 0);
  sub_249B7E620(v3, v2, v5, v4, 0);
  sub_249B7E66C(v3, v2, v5, v4, 0);
  sub_249B7E66C(v8, v7, v10, v9, 0);
  return v13 & 1;
}

void sub_249B7B8A0()
{
  UNSList.Section.Group.GroupingMethod.init(from:)();
}

void sub_249B7B8C0()
{
  UNSList.Section.Group.GroupingMethod.encode(to:)();
}

unint64_t sub_249B7B8D8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;
  unint64_t v3;

  result = UNSList.Section.Group.GroupingMethod.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void UNSList.Section.Group.id.getter()
{
  type metadata accessor for UNSList.Section.Group.GroupingMethod();
}

unint64_t sub_249B7B934()
{
  return UNSList.Section.Group.GroupingMethod.id.getter();
}

uint64_t UNSList.Section.Group.notifications.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t UNSList.Section.Group.notifications.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*UNSList.Section.Group.notifications.modify())()
{
  return nullsub_1;
}

uint64_t UNSList.Section.Group.groupingMethod.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v2 = *(_QWORD *)(v1 + 8);
  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v5 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_BYTE *)(v1 + 40);
  *(_BYTE *)(a1 + 32) = v6;
  return sub_249B7E620(v2, v3, v4, v5, v6);
}

uint64_t UNSList.Section.Group.summary.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_249B7E6C4(v2 + *(int *)(a1 + 56), a2);
}

uint64_t UNSList.Section.Group.summary.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_249B7E70C(a1, v2 + *(int *)(a2 + 56));
}

uint64_t (*UNSList.Section.Group.summary.modify())()
{
  return nullsub_1;
}

uint64_t UNSList.Section.Group.isEmpty.getter()
{
  uint64_t v0;

  v0 = sub_249B954B8();
  MEMORY[0x24BCFFA80](MEMORY[0x24BEE12E0], v0);
  return sub_249B954E8() & 1;
}

uint64_t UNSList.Section.Group.bundleIdentifier.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  if (*(_BYTE *)(v0 + 40))
  {
    if (*(_BYTE *)(v0 + 40) != 1)
      return 0;
    v1 = (uint64_t *)(v0 + 8);
  }
  else
  {
    v1 = (uint64_t *)(v0 + 24);
  }
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

void UNSList.Section.Group.init(notifications:groupingMethod:)()
{
  type metadata accessor for UNSList.Section.Group();
}

__n128 sub_249B7BAD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  __n128 result;
  __n128 v9;

  v6 = v2 + *(int *)(a1 + 56);
  v7 = sub_249B95254();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(_QWORD *)v2 = v1;
  result = v9;
  *(__n128 *)(v2 + 8) = v9;
  *(_QWORD *)(v2 + 24) = v3;
  *(_QWORD *)(v2 + 32) = v4;
  *(_BYTE *)(v2 + 40) = v5;
  return result;
}

uint64_t static UNSList.Section.Group.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  char v27;
  __int128 v28;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD v42[2];
  char v43;
  __int128 v44;
  __int128 v45;
  char v46;

  v41 = a6;
  v37 = a4;
  v38 = a5;
  v9 = sub_249B95254();
  v39 = *(_QWORD *)(v9 - 8);
  v40 = v9;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v36 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C1AA8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
  v14 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v30 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v30 - v20;
  v22 = a1;
  v23 = a2;
  v24 = v41;
  if ((sub_249B954C4() & 1) != 0)
  {
    v31 = a3;
    v32 = v11;
    v33 = v19;
    v34 = v21;
    v30 = v16;
    v35 = v13;
    v25 = *(_BYTE *)(v22 + 40);
    v26 = *(_OWORD *)(v22 + 24);
    v44 = *(_OWORD *)(v22 + 8);
    v45 = v26;
    v46 = v25;
    v27 = *(_BYTE *)(v23 + 40);
    v28 = *(_OWORD *)(v23 + 24);
    v42[0] = *(_OWORD *)(v23 + 8);
    v42[1] = v28;
    v43 = v27;
    if ((static UNSList.Section.Group.GroupingMethod.== infix(_:_:)((uint64_t)&v44, (uint64_t)v42) & 1) != 0)
    {
      *(_QWORD *)&v44 = v31;
      *((_QWORD *)&v44 + 1) = v37;
      *(_QWORD *)&v45 = v38;
      *((_QWORD *)&v45 + 1) = v24;
      type metadata accessor for UNSList.Section.Group();
    }
  }
  return 0;
}

uint64_t sub_249B7BEE8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6163696669746F6ELL && a2 == 0xED0000736E6F6974;
  if (v2 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E6970756F7267 && a2 == 0xEE00646F6874654DLL || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7972616D6D7573 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_249B95644();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_249B7C084()
{
  sub_249B9568C();
  sub_249B95698();
  return sub_249B956B0();
}

uint64_t sub_249B7C0C8(char a1)
{
  if (!a1)
    return 0x6163696669746F6ELL;
  if (a1 == 1)
    return 0x676E6970756F7267;
  return 0x7972616D6D7573;
}

uint64_t sub_249B7C138(unsigned __int8 *a1, unsigned __int8 *a2, _QWORD *a3, uint64_t a4)
{
  return sub_249B7C144(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_249B80ED0);
}

uint64_t sub_249B7C144(unsigned __int8 *a1, unsigned __int8 *a2, _QWORD *a3, uint64_t a4, uint64_t (*a5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  return a5(*a1, *a2, a3[2], a3[3], a3[4], a3[5]);
}

uint64_t sub_249B7C160()
{
  return sub_249B7C084();
}

uint64_t sub_249B7C180(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_249B7C18C(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_249B80EC8);
}

uint64_t sub_249B7C18C(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t (*a4)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  unsigned __int8 *v4;

  return a4(a1, *v4, a2[2], a2[3], a2[4], a2[5]);
}

uint64_t sub_249B7C1A0(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_249B7C1AC(a1, a2, a3, (void (*)(_BYTE *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_249B80EC8);
}

uint64_t sub_249B7C1AC(uint64_t a1, _QWORD *a2, uint64_t a3, void (*a4)(_BYTE *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  unsigned __int8 *v4;
  _BYTE v8[72];

  sub_249B9568C();
  a4(v8, *v4, a2[2], a2[3], a2[4], a2[5]);
  return sub_249B956B0();
}

uint64_t sub_249B7C200(_QWORD *a1, uint64_t a2)
{
  return sub_249B7C20C(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_249B7C0C8);
}

uint64_t sub_249B7C20C(_QWORD *a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  unsigned __int8 *v3;

  return a3(*v3, a1[2], a1[3], a1[4], a1[5]);
}

uint64_t sub_249B7C220@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_249B7CC14(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_249B7BEE8, a4);
}

uint64_t sub_249B7C22C@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_249B7CC48(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))sub_249B7E7F4, a2);
}

uint64_t sub_249B7C238(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B970B0, a1);
  return sub_249B956D4();
}

uint64_t sub_249B7C26C(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B970B0, a1);
  return sub_249B956E0();
}

void UNSList.Section.Group.encode(to:)()
{
  type metadata accessor for UNSList.Section.Group.CodingKeys();
}

uint64_t sub_249B7C2F0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  MEMORY[0x24BCFFA80](&unk_249B970B0, a1);
  v4 = sub_249B95638();
  *(_QWORD *)(v3 - 200) = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v16 - v5;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  v8 = *(_QWORD *)(v3 - 192);
  v7 = *(_QWORD *)(v3 - 184);
  sub_249B956C8();
  *(_QWORD *)(v3 - 128) = *(_QWORD *)v7;
  *(_BYTE *)(v3 - 168) = 0;
  v9 = sub_249B954B8();
  *(_QWORD *)(v3 - 72) = v2;
  MEMORY[0x24BCFFA80](MEMORY[0x24BEE12A0], v9, v3 - 72);
  v10 = *(_QWORD *)(v3 - 176);
  sub_249B9562C();
  if (!v10)
  {
    v11 = *(_BYTE *)(v7 + 40);
    v12 = *(_OWORD *)(v7 + 24);
    *(_OWORD *)(v3 - 128) = *(_OWORD *)(v7 + 8);
    *(_OWORD *)(v3 - 112) = v12;
    *(_BYTE *)(v3 - 96) = v11;
    *(_BYTE *)(v3 - 129) = 1;
    v13 = *(_QWORD *)(v3 - 208);
    *(_QWORD *)(v3 - 168) = v8;
    *(_QWORD *)(v3 - 160) = v13;
    v14 = *(_QWORD *)(v3 - 216);
    *(_QWORD *)(v3 - 152) = v2;
    *(_QWORD *)(v3 - 144) = v14;
    type metadata accessor for UNSList.Section.Group.GroupingMethod();
  }
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v3 - 200) + 8))(v6, v4);
}

void UNSList.Section.Group.init(from:)(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v9;
  _QWORD v10[24];

  v10[3] = a5;
  __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
  MEMORY[0x24BDAC7A8]();
  v10[4] = (char *)v10 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[18] = a1;
  v10[19] = a2;
  v10[20] = a3;
  v10[21] = a4;
  type metadata accessor for UNSList.Section.Group.CodingKeys();
}

void sub_249B7C578(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  MEMORY[0x24BCFFA80](&unk_249B970B0, a1);
  v6 = sub_249B955E4();
  *(_QWORD *)(v5 - 192) = v6;
  *(_QWORD *)(v5 - 232) = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)(v5 - 208) = v2;
  *(_QWORD *)(v5 - 200) = v1;
  *(_QWORD *)(v5 - 128) = v2;
  *(_QWORD *)(v5 - 120) = v1;
  *(_QWORD *)(v5 - 224) = v4;
  *(_QWORD *)(v5 - 216) = v3;
  *(_QWORD *)(v5 - 112) = v4;
  *(_QWORD *)(v5 - 104) = v3;
  type metadata accessor for UNSList.Section.Group();
}

uint64_t sub_249B7C5EC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _BYTE *v7;
  uint64_t v8;
  void (*v9)(_BYTE *, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  _BYTE v18[96];

  *(_QWORD *)(v2 - 256) = *(_QWORD *)(a1 - 8);
  v4 = MEMORY[0x24BDAC7A8]();
  v6 = &v18[-v5];
  v7 = &v18[*(int *)(v4 + 56) - v5];
  v8 = sub_249B95254();
  v9 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
  *(_QWORD *)(v2 - 176) = v7;
  v9(v7, 1, 1, v8);
  v10 = v1[3];
  *(_QWORD *)(v2 - 184) = v1;
  __swift_project_boxed_opaque_existential_1(v1, v10);
  v11 = *(_QWORD *)(v2 - 168);
  sub_249B956BC();
  if (!v11)
  {
    *(_QWORD *)(v2 - 168) = v8;
    v12 = *(_QWORD *)(v2 - 224);
    v13 = *(_QWORD *)(v2 - 216);
    *(_QWORD *)(v2 - 264) = a1;
    v14 = sub_249B954B8();
    *(_BYTE *)(v2 - 160) = 0;
    *(_QWORD *)(v2 - 72) = *(_QWORD *)(v2 - 200);
    MEMORY[0x24BCFFA80](MEMORY[0x24BEE12D0], v14, v2 - 72);
    sub_249B955CC();
    *v6 = *(_QWORD *)(v2 - 128);
    v17 = *(_QWORD *)(v2 - 200);
    *(_QWORD *)(v2 - 160) = *(_QWORD *)(v2 - 208);
    *(_QWORD *)(v2 - 152) = v17;
    *(_QWORD *)(v2 - 144) = v12;
    *(_QWORD *)(v2 - 136) = v13;
    type metadata accessor for UNSList.Section.Group.GroupingMethod();
  }
  v15 = *(_QWORD *)(v2 - 176);
  __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v2 - 184));
  return sub_249B7E754(v15, qword_2544C2660);
}

void sub_249B7C77C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)(v5 - 160) = 1;
  MEMORY[0x24BCFFA80](&protocol conformance descriptor for UNSList<A>.Section.Group.GroupingMethod, a1);
  sub_249B955CC();
  if (!v2)
  {
    v6 = *(_BYTE *)(v5 - 96);
    v7 = *(_OWORD *)(v5 - 112);
    *(_OWORD *)(v3 + 8) = *(_OWORD *)(v5 - 128);
    *(_OWORD *)(v3 + 24) = v7;
    *(_BYTE *)(v3 + 40) = v6;
    *(_BYTE *)(v5 - 128) = 2;
    sub_249B80E4C(qword_2578C1AC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5D0]);
    v8 = *(_QWORD *)(v5 - 240);
    sub_249B955A8();
    v9 = *(_QWORD *)(v5 - 176);
    (*(void (**)(uint64_t, _QWORD))(v4 + 8))(v1, *(_QWORD *)(v5 - 192));
    sub_249B7E70C(v8, v9);
    v10 = *(_QWORD *)(v5 - 256);
    v11 = *(_QWORD *)(v5 - 264);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v10 + 16))(*(_QWORD *)(v5 - 248), v3, v11);
    __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v5 - 184));
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v3, v11);
    JUMPOUT(0x249B7C734);
  }
  (*(void (**)(uint64_t, _QWORD))(v4 + 8))(v1, *(_QWORD *)(v5 - 192));
  __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v5 - 184));
  swift_bridgeObjectRelease();
  JUMPOUT(0x249B7C724);
}

void sub_249B7C8D0(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  UNSList.Section.Group.init(from:)(a1[2], a1[3], a1[4], a1[5], a2);
}

void sub_249B7C8F0()
{
  UNSList.Section.Group.encode(to:)();
}

uint64_t sub_249B7C904(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return static UNSList.Section.Group.== infix(_:_:)(a1, a2, a3[2], a3[3], a3[4], a3[5]);
}

void sub_249B7C914()
{
  UNSList.Section.Group.id.getter();
}

uint64_t sub_249B7C928(uint64_t result, uint64_t a2)
{
  _QWORD *v2;

  *v2 = result;
  v2[1] = a2;
  return result;
}

void static UNSList.Section.== infix(_:_:)()
{
  type metadata accessor for UNSList.Section.Group();
}

uint64_t sub_249B7C978(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v7[2];
  uint64_t v8[14];

  MEMORY[0x24BCFFA80](&protocol conformance descriptor for UNSList<A>.Section.Group, a1);
  if ((sub_249B954C4() & 1) != 0)
  {
    v8[0] = v1;
    v8[1] = v2;
    v7[0] = v3;
    v7[1] = v4;
    v5 = static UNSList.Section.SectionType.== infix(_:_:)(v8, v7);
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

BOOL sub_249B7C9E0(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_249B7C9F0()
{
  return sub_249B95698();
}

uint64_t sub_249B7CA14(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7370756F7267 && a2 == 0xE600000000000000;
  if (v2 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701869940 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_249B95644();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_249B7CAEC()
{
  sub_249B9568C();
  sub_249B95698();
  return sub_249B956B0();
}

uint64_t sub_249B7CB30(char a1)
{
  if ((a1 & 1) != 0)
    return 1701869940;
  else
    return 0x7370756F7267;
}

BOOL sub_249B7CB5C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_249B7C9E0(*a1, *a2);
}

uint64_t sub_249B7CB74()
{
  return sub_249B7CAEC();
}

uint64_t sub_249B7CB88()
{
  return sub_249B7C9F0();
}

uint64_t sub_249B7CB9C()
{
  sub_249B9568C();
  sub_249B7C9F0();
  return sub_249B956B0();
}

uint64_t sub_249B7CBE4(_QWORD *a1, uint64_t a2)
{
  return sub_249B7CBF0(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_249B7CB30);
}

uint64_t sub_249B7CBF0(_QWORD *a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  unsigned __int8 *v3;

  return a3(*v3, a1[2], a1[3], a1[4], a1[5]);
}

uint64_t sub_249B7CC08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_249B7CC14(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_249B7CA14, a4);
}

uint64_t sub_249B7CC14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD)@<X4>, _BYTE *a5@<X8>)
{
  uint64_t result;

  result = a4(a1, a2, a3[2], a3[3], a3[4], a3[5]);
  *a5 = result;
  return result;
}

uint64_t sub_249B7CC48@<X0>(_QWORD *a1@<X1>, uint64_t (*a2)(_QWORD, _QWORD, _QWORD, _QWORD)@<X3>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = a2(a1[2], a1[3], a1[4], a1[5]);
  *a3 = result;
  return result;
}

uint64_t sub_249B7CC7C(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97060, a1);
  return sub_249B956D4();
}

uint64_t sub_249B7CCB0(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97060, a1);
  return sub_249B956E0();
}

void UNSList.Section.encode(to:)()
{
  type metadata accessor for UNSList.Section.CodingKeys();
}

void sub_249B7CD30(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  MEMORY[0x24BCFFA80](&unk_249B97060, a1);
  v4 = sub_249B95638();
  *(_QWORD *)(v3 - 152) = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = *v1;
  v5 = v1[1];
  *(_QWORD *)(v3 - 200) = v1[2];
  *(_QWORD *)(v3 - 192) = v5;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  v7 = *(_QWORD *)(v3 - 168);
  v8 = *(_QWORD *)(v3 - 184);
  v9 = *(_QWORD *)(v3 - 176);
  sub_249B956C8();
  *(_QWORD *)(v3 - 136) = v6;
  *(_BYTE *)(v3 - 65) = 0;
  *(_QWORD *)(v3 - 112) = v8;
  *(_QWORD *)(v3 - 104) = v7;
  v10 = *(_QWORD *)(v3 - 160);
  *(_QWORD *)(v3 - 96) = v9;
  *(_QWORD *)(v3 - 88) = v10;
  type metadata accessor for UNSList.Section.Group();
}

uint64_t sub_249B7CDF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v9 = sub_249B954B8();
  *(_QWORD *)(v7 - 120) = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UNSList<A>.Section.Group, a1);
  MEMORY[0x24BCFFA80](MEMORY[0x24BEE12A0], v9, v7 - 120);
  v10 = *(_QWORD *)(v7 - 144);
  sub_249B9562C();
  if (!v10)
  {
    v11 = *(_QWORD *)(v7 - 200);
    *(_QWORD *)(v7 - 136) = *(_QWORD *)(v7 - 192);
    *(_QWORD *)(v7 - 128) = v11;
    *(_BYTE *)(v7 - 65) = 1;
    *(_QWORD *)(v7 - 112) = v4;
    *(_QWORD *)(v7 - 104) = v5;
    *(_QWORD *)(v7 - 96) = v6;
    *(_QWORD *)(v7 - 88) = v2;
    type metadata accessor for UNSList.Section.SectionType();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 152) + 8))(v1, v3);
}

void UNSList.Section.init(from:)()
{
  type metadata accessor for UNSList.Section.CodingKeys();
}

uint64_t sub_249B7CF44(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  MEMORY[0x24BCFFA80](&unk_249B97060, a1);
  v5 = sub_249B955E4();
  *(_QWORD *)(v4 - 152) = v5;
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_249B956BC();
  if (!v3)
  {
    v6 = *(_QWORD *)(v4 - 144);
    *(_QWORD *)(v4 - 112) = v2;
    *(_QWORD *)(v4 - 104) = v6;
    v7 = *(_QWORD *)(v4 - 160);
    *(_QWORD *)(v4 - 96) = *(_QWORD *)(v4 - 136);
    *(_QWORD *)(v4 - 88) = v7;
    type metadata accessor for UNSList.Section.Group();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
}

void sub_249B7D0C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;

  *(_BYTE *)(v7 - 112) = 1;
  swift_bridgeObjectRetain();
  MEMORY[0x24BCFFA80](&protocol conformance descriptor for UNSList<A>.Section.SectionType, a1);
  sub_249B955CC();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (v2)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v1);
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = *(_QWORD *)(v7 - 128);
    v10 = *(_QWORD *)(v7 - 120);
    swift_bridgeObjectRetain();
    sub_249B77718(v9, v10);
    swift_bridgeObjectRelease();
    v11 = *(_QWORD **)(v7 - 168);
    *v11 = v3;
    v11[1] = v9;
    v11[2] = v10;
    __swift_destroy_boxed_opaque_existential_1(v1);
    swift_bridgeObjectRelease();
    sub_249B7775C(v9, v10);
  }
  JUMPOUT(0x249B7D084);
}

void sub_249B7D19C()
{
  UNSList.Section.init(from:)();
}

void sub_249B7D1BC()
{
  UNSList.Section.encode(to:)();
}

void sub_249B7D1D0()
{
  static UNSList.Section.== infix(_:_:)();
}

void sub_249B7D1E0()
{
  UNSList.Section.id.getter();
}

uint64_t sub_249B7D1F4(uint64_t result, uint64_t a2)
{
  _QWORD *v2;

  *v2 = result;
  v2[1] = a2;
  return result;
}

void UNSList.FlattenedGroup.group.getter()
{
  type metadata accessor for UNSList.Section.Group();
}

uint64_t sub_249B7D22C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t UNSList.FlattenedGroup.sectionID.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 52));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t static UNSList.FlattenedGroup.decode(uniqueIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v6;
  _QWORD *v7;
  uint64_t result;
  char v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
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
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unsigned __int8 v40;
  __int128 v41;
  __int128 v42;
  _OWORD v43[2];
  unsigned __int8 v44;
  __int128 v45;

  *(_QWORD *)&v43[0] = 44;
  *((_QWORD *)&v43[0] + 1) = 0xE100000000000000;
  sub_249B9541C();
  swift_bridgeObjectRelease();
  sub_249B9541C();
  v6 = v43[0];
  *(_QWORD *)&v43[0] = a1;
  *((_QWORD *)&v43[0] + 1) = a2;
  v45 = v6;
  sub_249B7B11C();
  v7 = (_QWORD *)sub_249B95524();
  swift_bridgeObjectRelease();
  if (v7[2] != 2)
    goto LABEL_15;
  *(_QWORD *)&v43[0] = 0x496E6F6974636573;
  *((_QWORD *)&v43[0] + 1) = 0xE900000000000044;
  result = sub_249B9541C();
  if (v7[2])
  {
    swift_bridgeObjectRetain();
    v9 = sub_249B95428();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
      goto LABEL_14;
    v10 = v7[4];
    v11 = v7[5];
    swift_bridgeObjectRetain();
    v12 = sub_249B953E0();
    swift_bridgeObjectRelease();
    v13 = sub_249B7E584(v12, v10, v11);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    swift_bridgeObjectRelease();
    v20 = MEMORY[0x24BCFF3B4](v13, v15, v17, v19);
    v22 = v21;
    swift_bridgeObjectRelease();
    result = sub_249B953E0();
    if (result < 1)
      goto LABEL_14;
    if (v7[2] >= 2uLL)
    {
      v23 = v7[6];
      v24 = v7[7];
      swift_bridgeObjectRetain();
      v25 = sub_249B7D604(v23, v24);
      v27 = v26;
      swift_bridgeObjectRelease();
      if (v27)
      {
        if (v25 == 93 && v27 == 0xE100000000000000)
        {
          swift_bridgeObjectRelease();
          goto LABEL_11;
        }
        v28 = sub_249B95644();
        swift_bridgeObjectRelease();
        if ((v28 & 1) != 0)
        {
LABEL_11:
          swift_bridgeObjectRetain();
          v29 = sub_249B953E0();
          swift_bridgeObjectRelease();
          if (v29 >= 2)
          {
            swift_bridgeObjectRetain();
            sub_249B95410();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            v30 = sub_249B95440();
            v32 = v31;
            v34 = v33;
            v36 = v35;
            swift_bridgeObjectRelease();
            v37 = MEMORY[0x24BCFF3B4](v30, v32, v34, v36);
            v39 = v38;
            swift_bridgeObjectRelease();
            result = UNSList.Section.Group.GroupingMethod.init(fromUniqueIdentifier:)(v37, v39, (uint64_t)v43);
            v40 = v44;
            if (v44 != 255)
            {
              v41 = v43[0];
              v42 = v43[1];
              *(_QWORD *)a3 = v20;
              *(_QWORD *)(a3 + 8) = v22;
              *(_OWORD *)(a3 + 16) = v41;
              *(_OWORD *)(a3 + 32) = v42;
              *(_BYTE *)(a3 + 48) = v40;
              return result;
            }
            goto LABEL_15;
          }
        }
      }
LABEL_14:
      swift_bridgeObjectRelease();
LABEL_15:
      result = swift_bridgeObjectRelease();
      *(_BYTE *)(a3 + 48) = 0;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)a3 = 0u;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_249B7D604(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return 0;
  sub_249B953F8();
  return sub_249B95434();
}

void sub_249B7D67C()
{
  type metadata accessor for UNSList.Section.Group();
}

void sub_249B7D6CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v2, v1, a1);
  type metadata accessor for UNSList.FlattenedGroup();
}

uint64_t sub_249B7D6F8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v4 = (_QWORD *)(v3 + *(int *)(result + 52));
  *v4 = v2;
  v4[1] = v1;
  return result;
}

void UNSList.flattenedGroups.getter()
{
  type metadata accessor for UNSList.FlattenedGroup();
}

void sub_249B7D758()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 56) = sub_249B95350();
  swift_bridgeObjectRetain();
  type metadata accessor for UNSList.Section();
}

uint64_t sub_249B7D790()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_249B954B8();
  MEMORY[0x24BCFFA80](MEMORY[0x24BEE12C8], v1);
  sub_249B95464();
  swift_bridgeObjectRelease();
  return *(_QWORD *)(v0 - 56);
}

void sub_249B7D7F4()
{
  swift_bridgeObjectRetain();
  type metadata accessor for UNSList.Section.Group();
}

uint64_t sub_249B7D858()
{
  uint64_t v0;

  v0 = sub_249B954B8();
  MEMORY[0x24BCFFA80](MEMORY[0x24BEE12C8], v0);
  sub_249B95464();
  return swift_bridgeObjectRelease();
}

void sub_249B7D8BC()
{
  type metadata accessor for UNSList.Section.Group();
}

void sub_249B7D914(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v5 - 112) = v3;
  *(_QWORD *)(v5 - 104) = v2;
  *(_QWORD *)(v5 - 96) = v1;
  *(_QWORD *)(v5 - 88) = v4;
  type metadata accessor for UNSList.FlattenedGroup();
}

void sub_249B7D954(uint64_t a1)
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

  *(_QWORD *)(v7 - 184) = *(_QWORD *)(a1 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  MEMORY[0x24BDAC7A8](v8);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v6, *(_QWORD *)(v7 - 176), v1);
  v9 = *(_QWORD *)(v7 - 160);
  *(_QWORD *)(v7 - 136) = *(_QWORD *)(v7 - 168);
  *(_QWORD *)(v7 - 128) = v9;
  *(_QWORD *)(v7 - 120) = *(_QWORD *)(v7 - 152);
  *(_QWORD *)(v7 - 112) = v4;
  v10 = *(_QWORD *)(v7 - 192);
  *(_QWORD *)(v7 - 104) = v3;
  *(_QWORD *)(v7 - 96) = v10;
  *(_QWORD *)(v7 - 88) = v5;
  type metadata accessor for UNSList.Section();
}

void sub_249B7D9E4()
{
  UNSList.Section.id.getter();
}

void sub_249B7D9EC()
{
  sub_249B7D67C();
}

uint64_t sub_249B7DA18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *(_QWORD *)(v3 - 184);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v0, v1, v2);
  sub_249B954B8();
  sub_249B954AC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
}

void static UNSList.== infix(_:_:)()
{
  type metadata accessor for UNSList.Section();
}

uint64_t sub_249B7DAB0(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&protocol conformance descriptor for UNSList<A>.Section, a1);
  return sub_249B954C4() & 1;
}

uint64_t sub_249B7DAF0(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x736E6F6974636573 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_249B95644();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_249B7DB74()
{
  sub_249B9568C();
  sub_249B95698();
  return sub_249B956B0();
}

uint64_t sub_249B7DBB4()
{
  return sub_249B95698();
}

uint64_t sub_249B7DBD8()
{
  sub_249B9568C();
  sub_249B95698();
  return sub_249B956B0();
}

uint64_t sub_249B7DC14()
{
  return 0x736E6F6974636573;
}

uint64_t sub_249B7DC2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_249B7DC38(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_249B7DAF0, a4);
}

uint64_t sub_249B7DC38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD)@<X4>, _BYTE *a5@<X8>)
{
  uint64_t result;

  result = a4(a1, a2, a3[2], a3[3], a3[4], a3[5]);
  *a5 = result & 1;
  return result;
}

uint64_t sub_249B7DC70@<X0>(_QWORD *a1@<X1>, uint64_t (*a2)(_QWORD, _QWORD, _QWORD, _QWORD)@<X3>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = a2(a1[2], a1[3], a1[4], a1[5]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_249B7DCA8(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97010, a1);
  return sub_249B956D4();
}

uint64_t sub_249B7DCDC(uint64_t a1)
{
  MEMORY[0x24BCFFA80](&unk_249B97010, a1);
  return sub_249B956E0();
}

void UNSList.encode(to:)()
{
  type metadata accessor for UNSList.CodingKeys();
}

void sub_249B7DD5C(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  MEMORY[0x24BCFFA80](&unk_249B97010, a1);
  v4 = sub_249B95638();
  *(_QWORD *)(v3 - 136) = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v5 = *v1;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_249B956C8();
  *(_QWORD *)(v3 - 72) = v5;
  v6 = *(_QWORD *)(v3 - 152);
  *(_QWORD *)(v3 - 112) = *(_QWORD *)(v3 - 144);
  *(_QWORD *)(v3 - 104) = v6;
  v7 = *(_QWORD *)(v3 - 168);
  *(_QWORD *)(v3 - 96) = *(_QWORD *)(v3 - 160);
  *(_QWORD *)(v3 - 88) = v7;
  type metadata accessor for UNSList.Section();
}

uint64_t sub_249B7DE10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v5 = sub_249B954B8();
  *(_QWORD *)(v3 - 120) = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UNSList<A>.Section, a1);
  MEMORY[0x24BCFFA80](MEMORY[0x24BEE12A0], v5, v3 - 120);
  sub_249B9562C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 136) + 8))(v2, v1);
}

void UNSList.init(from:)()
{
  type metadata accessor for UNSList.CodingKeys();
}

uint64_t sub_249B7DEEC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  MEMORY[0x24BCFFA80](&unk_249B97010, a1);
  v5 = sub_249B955E4();
  *(_QWORD *)(v4 - 128) = v5;
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_249B956BC();
  if (!v3)
  {
    v6 = *(_QWORD *)(v4 - 152);
    *(_QWORD *)(v4 - 112) = v2;
    *(_QWORD *)(v4 - 104) = v6;
    v7 = *(_QWORD *)(v4 - 136);
    *(_QWORD *)(v4 - 96) = *(_QWORD *)(v4 - 144);
    *(_QWORD *)(v4 - 88) = v7;
    type metadata accessor for UNSList.Section();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
}

void sub_249B7E060()
{
  UNSList.init(from:)();
}

void sub_249B7E080()
{
  UNSList.encode(to:)();
}

void sub_249B7E094()
{
  static UNSList.== infix(_:_:)();
}

uint64_t UNSList.FlattenedGroup<>.id.getter()
{
  uint64_t *v0;

  return _s25UserNotificationsServices7UNSListV14FlattenedGroupVAASSRszrlE2id4fromSSSaySSG_tFZ_0(*v0);
}

uint64_t sub_249B7E0B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t result;
  uint64_t v4;

  result = _s25UserNotificationsServices7UNSListV14FlattenedGroupVAASSRszrlE2id4fromSSSaySSG_tFZ_0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_249B7E0D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;

  v2 = sub_249B95320();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249B80E4C(&qword_2578C2360, v6, MEMORY[0x24BDC6300]);
  v7 = sub_249B95458();
  v38 = MEMORY[0x24BEE4AF8];
  sub_249B7E460(0, v7 & ~(v7 >> 63), 0);
  v8 = v38;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  result = sub_249B9544C();
  if ((v7 & 0x8000000000000000) == 0)
  {
    v10 = v37;
    if (v7)
    {
      v11 = *(_QWORD *)(v36 + 16);
      v34 = v36;
      *(_QWORD *)&v35 = v11;
      v33 = v36 + 32;
      v32 = xmmword_249B97570;
      v12 = v37;
      while ((_QWORD)v35 != v12)
      {
        if ((v10 & 0x8000000000000000) != 0)
          goto LABEL_21;
        if (v12 >= *(_QWORD *)(v34 + 16))
          goto LABEL_22;
        v13 = *(_BYTE *)(v33 + v12);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2368);
        v14 = swift_allocObject();
        *(_OWORD *)(v14 + 16) = v32;
        *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE1768];
        *(_QWORD *)(v14 + 64) = MEMORY[0x24BEE17F0];
        *(_QWORD *)(v14 + 32) = 2;
        *(_QWORD *)(v14 + 96) = MEMORY[0x24BEE4260];
        *(_QWORD *)(v14 + 104) = MEMORY[0x24BEE42B0];
        *(_BYTE *)(v14 + 72) = v13;
        result = sub_249B953A4();
        v15 = result;
        v17 = v16;
        v38 = v8;
        v19 = *(_QWORD *)(v8 + 16);
        v18 = *(_QWORD *)(v8 + 24);
        if (v19 >= v18 >> 1)
        {
          result = (uint64_t)sub_249B7E460((char *)(v18 > 1), v19 + 1, 1);
          v8 = v38;
        }
        *(_QWORD *)(v8 + 16) = v19 + 1;
        v20 = v8 + 16 * v19;
        *(_QWORD *)(v20 + 32) = v15;
        *(_QWORD *)(v20 + 40) = v17;
        ++v12;
        if (!--v7)
        {
          v37 = v12;
          goto LABEL_12;
        }
      }
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      __break(1u);
    }
    else
    {
      v12 = v37;
LABEL_12:
      v21 = v36;
      v22 = *(_QWORD *)(v36 + 16);
      if (v12 == v22)
      {
LABEL_13:
        swift_bridgeObjectRelease();
        return v8;
      }
      v35 = xmmword_249B97570;
      while (v12 < v22)
      {
        v23 = *(_BYTE *)(v21 + 32 + v12);
        v37 = v12 + 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2368);
        v24 = swift_allocObject();
        *(_OWORD *)(v24 + 16) = v35;
        *(_QWORD *)(v24 + 56) = MEMORY[0x24BEE1768];
        *(_QWORD *)(v24 + 64) = MEMORY[0x24BEE17F0];
        *(_QWORD *)(v24 + 32) = 2;
        *(_QWORD *)(v24 + 96) = MEMORY[0x24BEE4260];
        *(_QWORD *)(v24 + 104) = MEMORY[0x24BEE42B0];
        *(_BYTE *)(v24 + 72) = v23;
        result = sub_249B953A4();
        v25 = result;
        v27 = v26;
        v38 = v8;
        v29 = *(_QWORD *)(v8 + 16);
        v28 = *(_QWORD *)(v8 + 24);
        if (v29 >= v28 >> 1)
        {
          result = (uint64_t)sub_249B7E460((char *)(v28 > 1), v29 + 1, 1);
          v8 = v38;
        }
        *(_QWORD *)(v8 + 16) = v29 + 1;
        v30 = v8 + 16 * v29;
        *(_QWORD *)(v30 + 32) = v25;
        *(_QWORD *)(v30 + 40) = v27;
        v12 = v37;
        v22 = *(_QWORD *)(v21 + 16);
        if (v37 == v22)
          goto LABEL_13;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

BOOL sub_249B7E440(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void sub_249B7E454(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

char *sub_249B7E460(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_249B7E47C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_249B7E47C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2370);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_249B7E57C()
{
  return 12;
}

unint64_t sub_249B7E584(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

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
    result = sub_249B95404();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return sub_249B95440();
  }
  __break(1u);
  return result;
}

uint64_t sub_249B7E620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result;

  if (a5 != 1)
  {
    if (a5)
      return result;
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_249B7E66C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result;

  if (a5 != 1)
  {
    if (a5)
      return result;
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

void type metadata accessor for UNSList.Section.Group.GroupingMethod()
{
  JUMPOUT(0x24BCFFA44);
}

uint64_t sub_249B7E6C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_249B7E70C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_249B7E754(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void type metadata accessor for UNSList.Section.Group.CodingKeys()
{
  JUMPOUT(0x24BCFFA44);
}

void type metadata accessor for UNSList.Section.CodingKeys()
{
  JUMPOUT(0x24BCFFA44);
}

void type metadata accessor for UNSList.FlattenedGroup()
{
  JUMPOUT(0x24BCFFA44);
}

void sub_249B7E7B4()
{
  sub_249B7D7F4();
}

void type metadata accessor for UNSList.Section()
{
  JUMPOUT(0x24BCFFA44);
}

void type metadata accessor for UNSList.CodingKeys()
{
  JUMPOUT(0x24BCFFA44);
}

uint64_t sub_249B7E7EC()
{
  return 2;
}

uint64_t sub_249B7E7F4()
{
  return 3;
}

uint64_t _s25UserNotificationsServices7UNSListV14FlattenedGroupVAASSRszrlE2id4fromSSSaySSG_tFZ_0(uint64_t a1)
{
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = sub_249B95320();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_249B953BC();
  v7 = *(_QWORD *)(v6 - 8);
  v27 = v6;
  v28 = v7;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_249B95344();
  v10 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249B95338();
  v13 = *(_QWORD *)(a1 + 16);
  if (v13)
  {
    v21 = v10;
    v22 = v5;
    v23 = v3;
    v24 = v2;
    swift_bridgeObjectRetain();
    v20 = a1;
    v14 = a1 + 40;
    v26 = v12;
    v15 = v27;
    do
    {
      swift_bridgeObjectRetain();
      sub_249B953B0();
      sub_249B95398();
      v17 = v16;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v15);
      if (v17 >> 60 != 15)
        __asm { BR              X9 }
      v14 += 16;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease();
    v3 = v23;
    v2 = v24;
    v10 = v21;
    v5 = v22;
  }
  sub_249B9532C();
  v29 = sub_249B7E0D8((uint64_t)v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2348);
  sub_249B80D0C();
  v18 = sub_249B95368();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v25);
  return v18;
}

uint64_t sub_249B7ECDC()
{
  return MEMORY[0x24BEE0D10];
}

void sub_249B7ECE8()
{
  JUMPOUT(0x24BCFFA80);
}

uint64_t sub_249B7ECF8()
{
  return swift_allocateGenericValueMetadata();
}

void type metadata accessor for UNSList()
{
  JUMPOUT(0x24BCFFA44);
}

unint64_t sub_249B7ED10(uint64_t a1)
{
  unint64_t result;

  swift_bridgeObjectRelease();
  result = *(_QWORD *)(a1 + 16);
  if (result >= 0xB)
    return swift_bridgeObjectRelease();
  return result;
}

_QWORD *sub_249B7ED4C(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v3;
  unint64_t v4;

  *a1 = *a2;
  v3 = a2 + 1;
  v4 = a2[2];
  swift_bridgeObjectRetain();
  if (v4 >= 0xB)
  {
    a1[1] = *v3;
    a1[2] = v4;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *(_OWORD *)v3;
  }
  return a1;
}

_QWORD *sub_249B7EDB0(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[2];
  if (a1[2] >= 0xBuLL)
  {
    if (v4 >= 0xB)
    {
      a1[1] = a2[1];
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_249B7EE6C((uint64_t)(a1 + 1));
    goto LABEL_6;
  }
  if (v4 < 0xB)
  {
LABEL_6:
    *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
    return a1;
  }
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_249B7EE6C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE0D00] - 8) + 8))();
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

_QWORD *sub_249B7EEB4(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;
  unint64_t v5;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v4 = a2 + 1;
  if (a1[2] >= 0xBuLL)
  {
    v5 = a2[2];
    if (v5 >= 0xB)
    {
      a1[1] = *v4;
      a1[2] = v5;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_249B7EE6C((uint64_t)(a1 + 1));
  }
  *(_OWORD *)(a1 + 1) = *(_OWORD *)v4;
  return a1;
}

uint64_t sub_249B7EF30(uint64_t *a1, int a2)
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

uint64_t sub_249B7EF78(uint64_t result, int a2, int a3)
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

uint64_t sub_249B7EFB8()
{
  return swift_allocateGenericValueMetadata();
}

unint64_t sub_249B7EFC4(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_249B7EFDC(uint64_t a1, uint64_t a2)
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

_QWORD *sub_249B7F024(_QWORD *a1, _QWORD *a2)
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_249B7F0D0(uint64_t a1, uint64_t a2)
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

uint64_t sub_249B7F130(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFF4 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483637);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 10;
  if (v4 >= 0xC)
    return v5;
  else
    return 0;
}

uint64_t sub_249B7F188(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF5)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483637;
    if (a3 >= 0x7FFFFFF5)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFF5)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 10;
  }
  return result;
}

uint64_t sub_249B7F1D8(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_249B7F1F0(_QWORD *result, int a2)
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

uint64_t sub_249B7F210()
{
  return swift_allocateGenericValueMetadata();
}

void sub_249B7F218()
{
  unint64_t v0;

  sub_249B7F9CC();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_249B7F298(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    v8 = a2[1];
    v9 = a2[2];
    v10 = a2[3];
    v11 = a2[4];
    v12 = *((_BYTE *)a2 + 40);
    swift_bridgeObjectRetain();
    sub_249B7E620(v8, v9, v10, v11, v12);
    *(_QWORD *)(a1 + 8) = v8;
    *(_QWORD *)(a1 + 16) = v9;
    *(_QWORD *)(a1 + 24) = v10;
    *(_QWORD *)(a1 + 32) = v11;
    *(_BYTE *)(a1 + 40) = v12;
    v13 = *(int *)(a3 + 56);
    v14 = (void *)(a1 + v13);
    v15 = (char *)a2 + v13;
    v16 = sub_249B95254();
    v17 = *(_QWORD *)(v16 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
  }
  return a1;
}

uint64_t sub_249B7F3BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_bridgeObjectRelease();
  sub_249B7E66C(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  v4 = a1 + *(int *)(a2 + 56);
  v5 = sub_249B95254();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

uint64_t sub_249B7F448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 32);
  v10 = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain();
  sub_249B7E620(v6, v7, v8, v9, v10);
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 32) = v9;
  *(_BYTE *)(a1 + 40) = v10;
  v11 = *(int *)(a3 + 56);
  v12 = (void *)(a1 + v11);
  v13 = (const void *)(a2 + v11);
  v14 = sub_249B95254();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 16))(v12, v13, v14);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

uint64_t sub_249B7F548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void *, uint64_t, uint64_t);
  int v22;
  uint64_t v23;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 32);
  v10 = *(_BYTE *)(a2 + 40);
  sub_249B7E620(v6, v7, v8, v9, v10);
  v11 = *(_QWORD *)(a1 + 8);
  v12 = *(_QWORD *)(a1 + 16);
  v13 = *(_QWORD *)(a1 + 24);
  v14 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 32) = v9;
  v15 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v10;
  sub_249B7E66C(v11, v12, v13, v14, v15);
  v16 = *(int *)(a3 + 56);
  v17 = (void *)(a1 + v16);
  v18 = (void *)(a2 + v16);
  v19 = sub_249B95254();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  LODWORD(v7) = v21(v17, 1, v19);
  v22 = v21(v18, 1, v19);
  if (!(_DWORD)v7)
  {
    if (!v22)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 24))(v17, v18, v19);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    v23 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v17, v18, v19);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

uint64_t sub_249B7F6A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v4 = *(int *)(a3 + 56);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = sub_249B95254();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t sub_249B7F77C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v6 = *(_BYTE *)(a2 + 40);
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v11 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v6;
  sub_249B7E66C(v7, v8, v9, v10, v11);
  v12 = *(int *)(a3 + 56);
  v13 = (void *)(a1 + v12);
  v14 = (void *)(a2 + v12);
  v15 = sub_249B95254();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 40))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    v20 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t sub_249B7F8BC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_249B7F8C8(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 56)], a2, v8);
  }
}

uint64_t sub_249B7F948()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_249B7F954(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 56)], a2, a2, v7);
  }
  return result;
}

void sub_249B7F9CC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2544C2918)
  {
    sub_249B95254();
    v0 = sub_249B95518();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2544C2918);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for UserNotification.LegacyAction(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_249B7FA50(uint64_t a1)
{
  return sub_249B7E66C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t sub_249B7FA64(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_249B7E620(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t sub_249B7FAC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_249B7E620(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_249B7E66C(v8, v9, v10, v11, v12);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_249B7FB48(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  char v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_249B7E66C(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t sub_249B7FB90(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t sub_249B7FBD8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_249B7FC20(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 1u)
    return *(unsigned __int8 *)(a1 + 32);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_249B7FC38(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
  }
  *(_BYTE *)(result + 32) = a2;
  return result;
}

uint64_t sub_249B7FC64()
{
  return 0;
}

void type metadata accessor for UNSList.Section.Group.GroupingMethod.CodingError()
{
  JUMPOUT(0x24BCFFA44);
}

void sub_249B7FC78()
{
  type metadata accessor for UNSList.Section.Group();
}

uint64_t sub_249B7FCF4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) == 0)
  {
    v6 = a2[1];
    v7 = a2[2];
    v8 = a2[3];
    v9 = a2[4];
    v10 = *((_BYTE *)a2 + 40);
    swift_bridgeObjectRetain();
    sub_249B7E620(v6, v7, v8, v9, v10);
    *(_QWORD *)(a1 + 8) = v6;
    *(_QWORD *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 24) = v8;
    *(_QWORD *)(a1 + 32) = v9;
    *(_BYTE *)(a1 + 40) = v10;
    type metadata accessor for UNSList.Section.Group();
  }
  v11 = v5 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v11;
}

void sub_249B7FE4C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  sub_249B7E66C(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  type metadata accessor for UNSList.Section.Group();
}

uint64_t sub_249B7FE98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v1 + *(int *)(a1 + 56);
  v3 = sub_249B95254();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return swift_bridgeObjectRelease();
}

void sub_249B7FF00(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain();
  sub_249B7E620(v3, v4, v5, v6, v7);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_BYTE *)(a1 + 40) = v7;
  type metadata accessor for UNSList.Section.Group();
}

uint64_t sub_249B7FF78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v4 = *(int *)(a1 + 56);
  v5 = (void *)(v1 + v4);
  v6 = (const void *)(v2 + v4);
  v7 = sub_249B95254();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(v5, v6, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  v10 = *(int *)(v3 + 52);
  v11 = (_QWORD *)(v1 + v10);
  v12 = (_QWORD *)(v2 + v10);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  swift_bridgeObjectRetain();
  return v1;
}

void sub_249B80034(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_249B7E620(v4, v5, v6, v7, v8);
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  v12 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  v13 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v8;
  sub_249B7E66C(v9, v10, v11, v12, v13);
  type metadata accessor for UNSList.Section.Group();
}

uint64_t sub_249B800CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  v4 = *(int *)(a1 + 56);
  v5 = (void *)(v1 + v4);
  v6 = (void *)(v2 + v4);
  v7 = sub_249B95254();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(v5, 1, v7);
  v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v8 + 24))(v5, v6, v7);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v12 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
LABEL_7:
  v13 = *(int *)(v3 + 52);
  v14 = (_QWORD *)(v1 + v13);
  v15 = (_QWORD *)(v2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v1;
}

void sub_249B801E4(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  type metadata accessor for UNSList.Section.Group();
}

uint64_t sub_249B80240(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(int *)(a1 + 56);
  v5 = (void *)(v1 + v4);
  v6 = (const void *)(v2 + v4);
  v7 = sub_249B95254();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  *(_OWORD *)(v1 + *(int *)(v3 + 52)) = *(_OWORD *)(v2 + *(int *)(v3 + 52));
  return v1;
}

void sub_249B802F0(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v9 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v4;
  sub_249B7E66C(v5, v6, v7, v8, v9);
  type metadata accessor for UNSList.Section.Group();
}

uint64_t sub_249B80368(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = *(int *)(a1 + 56);
  v5 = (void *)(v1 + v4);
  v6 = (void *)(v2 + v4);
  v7 = sub_249B95254();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(v5, 1, v7);
  v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v8 + 40))(v5, v6, v7);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v12 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v8 + 32))(v5, v6, v7);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
LABEL_7:
  v13 = *(int *)(v3 + 52);
  v14 = (_QWORD *)(v1 + v13);
  v15 = (uint64_t *)(v2 + v13);
  v17 = *v15;
  v16 = v15[1];
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_249B80470()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_249B8047C()
{
  type metadata accessor for UNSList.Section.Group();
}

uint64_t sub_249B804B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;

  v4 = *(_QWORD *)(a1 - 8);
  if (*(_DWORD *)(v4 + 84) == (_DWORD)v2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v1, v2, a1);
  v6 = *(_QWORD *)(v1 + *(int *)(v3 + 52) + 8);
  if (v6 >= 0xFFFFFFFF)
    LODWORD(v6) = -1;
  return (v6 + 1);
}

uint64_t sub_249B80508()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_249B80514()
{
  type metadata accessor for UNSList.Section.Group();
}

uint64_t sub_249B8054C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  v5 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v5 + 84) == v4)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v2, v1, v1, result);
  *(_QWORD *)(v2 + *(int *)(v3 + 52) + 8) = (v1 - 1);
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_249B805B0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_249B805B8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

uint64_t _s25UserNotificationsServices16UserNotificationV19IncomingPersistenceOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_249B80654(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_249B806A0 + 4 * byte_249B95F8B[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_249B806D4 + 4 * byte_249B95F86[v4]))();
}

uint64_t sub_249B806D4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B806DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x249B806E4);
  return result;
}

uint64_t sub_249B806F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x249B806F8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_249B806FC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B80704(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTagSinglePayload for UserNotification.LegacyAction.Style(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t sub_249B807A0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_249B807EC + 4 * byte_249B95F95[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_249B80820 + 4 * byte_249B95F90[v4]))();
}

uint64_t sub_249B80820(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B80828(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x249B80830);
  return result;
}

uint64_t sub_249B8083C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x249B80844);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_249B80848(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B80850(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B8085C(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_249B808EC(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_249B80938 + 4 * byte_249B95F9F[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_249B8096C + 4 * byte_249B95F9A[v4]))();
}

uint64_t sub_249B8096C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B80974(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x249B8097CLL);
  return result;
}

uint64_t sub_249B80988(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x249B80990);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_249B80994(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B8099C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_249B809A8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

uint64_t sub_249B809B0(unsigned int *a1, int a2)
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

uint64_t sub_249B80A00(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_249B80A40 + 4 * byte_249B95FA4[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_249B80A60 + 4 * byte_249B95FA9[v4]))();
}

_BYTE *sub_249B80A40(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_249B80A60(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_249B80A68(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_249B80A70(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_249B80A78(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_249B80A80(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_249B80A8C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80A9C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80AAC()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80ABC()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80ACC()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80ADC()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80AEC()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80AFC()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80B0C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80B1C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80B2C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80B3C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80B4C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80B5C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80B6C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80B7C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80B8C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80B9C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80BAC()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80BBC()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80BCC()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80BDC()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80BEC()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80BFC()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80C0C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80C1C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80C2C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80C3C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80C4C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80C5C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80C6C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80C7C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80C8C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80C9C()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80CAC()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80CBC()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80CCC()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80CDC()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80CEC()
{
  JUMPOUT(0x24BCFFA80);
}

void sub_249B80CFC()
{
  JUMPOUT(0x24BCFFA80);
}

unint64_t sub_249B80D0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2578C2350;
  if (!qword_2578C2350)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2578C2348);
    result = MEMORY[0x24BCFFA80](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2578C2350);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BCFFA74](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_249B80D9C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_249B80DB0(a1, a2);
  return a1;
}

uint64_t sub_249B80DB0(uint64_t a1, unint64_t a2)
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

uint64_t sub_249B80DF4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_249B80E08(a1, a2);
  return a1;
}

uint64_t sub_249B80E08(uint64_t a1, unint64_t a2)
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

uint64_t sub_249B80E4C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24BCFFA80](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_249B80E90()
{
  sub_249B7D8BC();
}

UserNotificationsServices::UserNotificationDestinations __swiftcall UserNotificationDestinations.init(rawValue:)(UserNotificationsServices::UserNotificationDestinations rawValue)
{
  UserNotificationsServices::UserNotificationDestinations *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static UserNotificationDestinations.notices.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static UserNotificationDestinations.banner.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static UserNotificationDestinations.modalAlert.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static UserNotificationDestinations.lockScreen.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

void static UserNotificationDestinations.sound.getter(_QWORD *a1@<X8>)
{
  *a1 = 16;
}

void static UserNotificationDestinations.lockedBanner.getter(_QWORD *a1@<X8>)
{
  *a1 = 32;
}

void static UserNotificationDestinations.lockedModalAlert.getter(_QWORD *a1@<X8>)
{
  *a1 = 64;
}

void static UserNotificationDestinations.car.getter(_QWORD *a1@<X8>)
{
  *a1 = 128;
}

void static UserNotificationDestinations.spoken.getter(_QWORD *a1@<X8>)
{
  *a1 = 256;
}

void static UserNotificationDestinations.settings.getter(_QWORD *a1@<X8>)
{
  *a1 = 512;
}

void static UserNotificationDestinations.forwarding.getter(_QWORD *a1@<X8>)
{
  *a1 = 1024;
}

void static UserNotificationDestinations.display.getter(_QWORD *a1@<X8>)
{
  *a1 = 2048;
}

void static UserNotificationDestinations.spokenCar.getter(_QWORD *a1@<X8>)
{
  *a1 = 4096;
}

void static UserNotificationDestinations.digest.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x2000;
}

void static UserNotificationDestinations.remoteNotifications.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x4000;
}

void sub_249B80F94()
{
  qword_2578C2378 = 110;
}

uint64_t sub_249B80FE4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

_QWORD *static UserNotificationDestinations.interrupting.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_249B810C0(&qword_2578C1A88, &qword_2578C2378, a1);
}

uint64_t sub_249B81054()
{
  uint64_t result;

  if (qword_2578C1A88 != -1)
    result = swift_once();
  qword_2578C2380 = qword_2578C2378 | 0x7D91;
  return result;
}

_QWORD *static UserNotificationDestinations.all.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_249B810C0(&qword_2578C1A90, &qword_2578C2380, a1);
}

_QWORD *sub_249B810C0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (*result != -1)
    result = (_QWORD *)swift_once();
  *a3 = *a2;
  return result;
}

uint64_t UserNotificationDestinations.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

_QWORD *sub_249B81108@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_249B81114(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_249B8111C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_249B81130@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_249B81144@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_249B81158(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_249B81188@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_249B811B4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_249B811D8(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_249B811EC(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_249B81200(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_249B81214@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_249B81228(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_249B8123C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_249B81250(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_249B81264()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_249B81274()
{
  return sub_249B95548();
}

_QWORD *sub_249B8128C(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_249B812A0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t UserNotificationDestinations.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  char *v2;
  unint64_t v3;
  unint64_t v4;
  char *v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  unint64_t v45;
  unint64_t v46;
  char *v47;

  v1 = *v0;
  if ((*v0 & 1) == 0)
  {
    v2 = (char *)MEMORY[0x24BEE4AF8];
    if ((v1 & 2) == 0)
      goto LABEL_12;
    goto LABEL_7;
  }
  v2 = sub_249B81B14(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v4 = *((_QWORD *)v2 + 2);
  v3 = *((_QWORD *)v2 + 3);
  if (v4 >= v3 >> 1)
    v2 = sub_249B81B14((char *)(v3 > 1), v4 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v4 + 1;
  v5 = &v2[16 * v4];
  *((_QWORD *)v5 + 4) = 0x73656369746F6ELL;
  *((_QWORD *)v5 + 5) = 0xE700000000000000;
  if ((v1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_249B81B14(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
    v7 = *((_QWORD *)v2 + 2);
    v6 = *((_QWORD *)v2 + 3);
    if (v7 >= v6 >> 1)
      v2 = sub_249B81B14((char *)(v6 > 1), v7 + 1, 1, v2);
    *((_QWORD *)v2 + 2) = v7 + 1;
    v8 = &v2[16 * v7];
    *((_QWORD *)v8 + 4) = 0x72656E6E6162;
    *((_QWORD *)v8 + 5) = 0xE600000000000000;
  }
LABEL_12:
  if ((v1 & 4) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_249B81B14(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
    v10 = *((_QWORD *)v2 + 2);
    v9 = *((_QWORD *)v2 + 3);
    if (v10 >= v9 >> 1)
      v2 = sub_249B81B14((char *)(v9 > 1), v10 + 1, 1, v2);
    *((_QWORD *)v2 + 2) = v10 + 1;
    v11 = &v2[16 * v10];
    *((_QWORD *)v11 + 4) = 0x656C416C61646F6DLL;
    *((_QWORD *)v11 + 5) = 0xEA00000000007472;
    if ((v1 & 8) == 0)
    {
LABEL_14:
      if ((v1 & 0x10) == 0)
        goto LABEL_15;
      goto LABEL_27;
    }
  }
  else if ((v1 & 8) == 0)
  {
    goto LABEL_14;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_249B81B14(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v13 = *((_QWORD *)v2 + 2);
  v12 = *((_QWORD *)v2 + 3);
  if (v13 >= v12 >> 1)
    v2 = sub_249B81B14((char *)(v12 > 1), v13 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v13 + 1;
  v14 = &v2[16 * v13];
  *((_QWORD *)v14 + 4) = 0x657263536B636F6CLL;
  *((_QWORD *)v14 + 5) = 0xEA00000000006E65;
  if ((v1 & 0x10) == 0)
  {
LABEL_15:
    if ((v1 & 0x20) == 0)
      goto LABEL_37;
    goto LABEL_32;
  }
LABEL_27:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_249B81B14(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v16 = *((_QWORD *)v2 + 2);
  v15 = *((_QWORD *)v2 + 3);
  if (v16 >= v15 >> 1)
    v2 = sub_249B81B14((char *)(v15 > 1), v16 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v16 + 1;
  v17 = &v2[16 * v16];
  *((_QWORD *)v17 + 4) = 0x646E756F73;
  *((_QWORD *)v17 + 5) = 0xE500000000000000;
  if ((v1 & 0x20) != 0)
  {
LABEL_32:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_249B81B14(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
    v19 = *((_QWORD *)v2 + 2);
    v18 = *((_QWORD *)v2 + 3);
    if (v19 >= v18 >> 1)
      v2 = sub_249B81B14((char *)(v18 > 1), v19 + 1, 1, v2);
    *((_QWORD *)v2 + 2) = v19 + 1;
    v20 = &v2[16 * v19];
    strcpy(v20 + 32, "lockedBanner");
    v20[45] = 0;
    *((_WORD *)v20 + 23) = -5120;
  }
LABEL_37:
  if ((v1 & 0x40) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_249B81B14(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
    v22 = *((_QWORD *)v2 + 2);
    v21 = *((_QWORD *)v2 + 3);
    if (v22 >= v21 >> 1)
      v2 = sub_249B81B14((char *)(v21 > 1), v22 + 1, 1, v2);
    *((_QWORD *)v2 + 2) = v22 + 1;
    v23 = &v2[16 * v22];
    *((_QWORD *)v23 + 4) = 0xD000000000000010;
    *((_QWORD *)v23 + 5) = 0x8000000249B998F0;
    if ((v1 & 0x80) == 0)
    {
LABEL_39:
      if ((v1 & 0x100) == 0)
        goto LABEL_40;
      goto LABEL_57;
    }
  }
  else if ((v1 & 0x80) == 0)
  {
    goto LABEL_39;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_249B81B14(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v25 = *((_QWORD *)v2 + 2);
  v24 = *((_QWORD *)v2 + 3);
  if (v25 >= v24 >> 1)
    v2 = sub_249B81B14((char *)(v24 > 1), v25 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v25 + 1;
  v26 = &v2[16 * v25];
  *((_QWORD *)v26 + 4) = 7496035;
  *((_QWORD *)v26 + 5) = 0xE300000000000000;
  if ((v1 & 0x100) == 0)
  {
LABEL_40:
    if ((v1 & 0x200) == 0)
      goto LABEL_41;
    goto LABEL_62;
  }
LABEL_57:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_249B81B14(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v28 = *((_QWORD *)v2 + 2);
  v27 = *((_QWORD *)v2 + 3);
  if (v28 >= v27 >> 1)
    v2 = sub_249B81B14((char *)(v27 > 1), v28 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v28 + 1;
  v29 = &v2[16 * v28];
  *((_QWORD *)v29 + 4) = 0x6E656B6F7073;
  *((_QWORD *)v29 + 5) = 0xE600000000000000;
  if ((v1 & 0x200) == 0)
  {
LABEL_41:
    if ((v1 & 0x400) == 0)
      goto LABEL_42;
    goto LABEL_67;
  }
LABEL_62:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_249B81B14(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v31 = *((_QWORD *)v2 + 2);
  v30 = *((_QWORD *)v2 + 3);
  if (v31 >= v30 >> 1)
    v2 = sub_249B81B14((char *)(v30 > 1), v31 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v31 + 1;
  v32 = &v2[16 * v31];
  *((_QWORD *)v32 + 4) = 0x73676E6974746573;
  *((_QWORD *)v32 + 5) = 0xE800000000000000;
  if ((v1 & 0x400) == 0)
  {
LABEL_42:
    if ((v1 & 0x800) == 0)
      goto LABEL_43;
    goto LABEL_72;
  }
LABEL_67:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_249B81B14(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v34 = *((_QWORD *)v2 + 2);
  v33 = *((_QWORD *)v2 + 3);
  if (v34 >= v33 >> 1)
    v2 = sub_249B81B14((char *)(v33 > 1), v34 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v34 + 1;
  v35 = &v2[16 * v34];
  *((_QWORD *)v35 + 4) = 0x6964726177726F66;
  *((_QWORD *)v35 + 5) = 0xEA0000000000676ELL;
  if ((v1 & 0x800) == 0)
  {
LABEL_43:
    if ((v1 & 0x1000) == 0)
      goto LABEL_44;
    goto LABEL_77;
  }
LABEL_72:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_249B81B14(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v37 = *((_QWORD *)v2 + 2);
  v36 = *((_QWORD *)v2 + 3);
  if (v37 >= v36 >> 1)
    v2 = sub_249B81B14((char *)(v36 > 1), v37 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v37 + 1;
  v38 = &v2[16 * v37];
  *((_QWORD *)v38 + 4) = 0x79616C70736964;
  *((_QWORD *)v38 + 5) = 0xE700000000000000;
  if ((v1 & 0x1000) == 0)
  {
LABEL_44:
    if ((v1 & 0x2000) == 0)
      goto LABEL_45;
    goto LABEL_82;
  }
LABEL_77:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_249B81B14(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v40 = *((_QWORD *)v2 + 2);
  v39 = *((_QWORD *)v2 + 3);
  if (v40 >= v39 >> 1)
    v2 = sub_249B81B14((char *)(v39 > 1), v40 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v40 + 1;
  v41 = &v2[16 * v40];
  *((_QWORD *)v41 + 4) = 0x61436E656B6F7073;
  *((_QWORD *)v41 + 5) = 0xE900000000000072;
  if ((v1 & 0x2000) == 0)
  {
LABEL_45:
    if ((v1 & 0x4000) == 0)
      goto LABEL_92;
    goto LABEL_87;
  }
LABEL_82:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_249B81B14(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v43 = *((_QWORD *)v2 + 2);
  v42 = *((_QWORD *)v2 + 3);
  if (v43 >= v42 >> 1)
    v2 = sub_249B81B14((char *)(v42 > 1), v43 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v43 + 1;
  v44 = &v2[16 * v43];
  *((_QWORD *)v44 + 4) = 0x747365676964;
  *((_QWORD *)v44 + 5) = 0xE600000000000000;
  if ((v1 & 0x4000) != 0)
  {
LABEL_87:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_249B81B14(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
    v46 = *((_QWORD *)v2 + 2);
    v45 = *((_QWORD *)v2 + 3);
    if (v46 >= v45 >> 1)
      v2 = sub_249B81B14((char *)(v45 > 1), v46 + 1, 1, v2);
    *((_QWORD *)v2 + 2) = v46 + 1;
    v47 = &v2[16 * v46];
    *((_QWORD *)v47 + 4) = 0xD000000000000013;
    *((_QWORD *)v47 + 5) = 0x8000000249B998D0;
  }
LABEL_92:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2348);
  sub_249B80D0C();
  sub_249B95368();
  swift_bridgeObjectRelease();
  sub_249B9541C();
  swift_bridgeObjectRelease();
  sub_249B9541C();
  return 91;
}

char *sub_249B81B14(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2370);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_249B81C18()
{
  unint64_t result;

  result = qword_2578C2388;
  if (!qword_2578C2388)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotificationDestinations, &type metadata for UserNotificationDestinations);
    atomic_store(result, (unint64_t *)&qword_2578C2388);
  }
  return result;
}

unint64_t sub_249B81C60()
{
  unint64_t result;

  result = qword_2578C2390;
  if (!qword_2578C2390)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotificationDestinations, &type metadata for UserNotificationDestinations);
    atomic_store(result, (unint64_t *)&qword_2578C2390);
  }
  return result;
}

unint64_t sub_249B81CA8()
{
  unint64_t result;

  result = qword_2578C2398;
  if (!qword_2578C2398)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotificationDestinations, &type metadata for UserNotificationDestinations);
    atomic_store(result, (unint64_t *)&qword_2578C2398);
  }
  return result;
}

unint64_t sub_249B81CF0()
{
  unint64_t result;

  result = qword_2578C23A0;
  if (!qword_2578C23A0)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotificationDestinations, &type metadata for UserNotificationDestinations);
    atomic_store(result, (unint64_t *)&qword_2578C23A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for UserNotificationDestinations()
{
  return &type metadata for UserNotificationDestinations;
}

char *sub_249B81D44(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578C23A8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_249B81E48(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_249B81E98(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_249B81F14 + 4 * byte_249B97784[a2]))(0x736E6553656D6974);
}

uint64_t sub_249B81F14(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x736E6553656D6974 && v1 == 0xED00006576697469)
    v2 = 1;
  else
    v2 = sub_249B95644();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_249B81FD4(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_249B82040(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_249B820A0 + 4 * byte_249B9778C[a2]))(0xD000000000000011);
}

uint64_t sub_249B820A0(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0xD000000000000011 && v1 == 0x8000000249B997F0)
    v2 = 1;
  else
    v2 = sub_249B95644();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_249B82148(char a1)
{
  sub_249B9568C();
  __asm { BR              X10 }
}

uint64_t sub_249B82198()
{
  sub_249B953D4();
  swift_bridgeObjectRelease();
  return sub_249B956B0();
}

void sub_249B82220(char a1)
{
  sub_249B9568C();
  __asm { BR              X10 }
}

uint64_t sub_249B82280()
{
  sub_249B953D4();
  swift_bridgeObjectRelease();
  return sub_249B956B0();
}

void sub_249B822F8(uint64_t a1, char a2)
{
  sub_249B9568C();
  __asm { BR              X10 }
}

uint64_t sub_249B82354()
{
  sub_249B953D4();
  swift_bridgeObjectRelease();
  return sub_249B956B0();
}

void sub_249B823CC(uint64_t a1, char a2)
{
  sub_249B9568C();
  __asm { BR              X10 }
}

uint64_t sub_249B82418()
{
  sub_249B953D4();
  swift_bridgeObjectRelease();
  return sub_249B956B0();
}

uint64_t sub_249B824A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2)
  {
    v3 = a2;
    if (a1 != a2)
    {
      v4 = 0;
      v23 = a1;
      while (1)
      {
        v6 = *(unsigned __int8 *)(a1 + v4 + 48);
        v7 = *(unsigned __int8 *)(a1 + v4 + 49);
        v8 = *(_QWORD *)(a1 + v4 + 56);
        v9 = *(_QWORD *)(a1 + v4 + 64);
        v10 = *(_QWORD *)(a1 + v4 + 80);
        v28 = *(unsigned __int8 *)(a1 + v4 + 88);
        v11 = *(unsigned __int8 *)(v3 + v4 + 48);
        v12 = *(unsigned __int8 *)(v3 + v4 + 49);
        v14 = *(_QWORD *)(v3 + v4 + 56);
        v13 = *(_QWORD *)(v3 + v4 + 64);
        v15 = *(_QWORD *)(v3 + v4 + 80);
        v25 = *(_QWORD *)(v3 + v4 + 72);
        v26 = *(_QWORD *)(a1 + v4 + 72);
        v27 = *(unsigned __int8 *)(v3 + v4 + 88);
        if (*(_QWORD *)(a1 + v4 + 32) != *(_QWORD *)(v3 + v4 + 32))
          goto LABEL_13;
        if (*(_QWORD *)(a1 + v4 + 40) == *(_QWORD *)(v3 + v4 + 40))
        {
          result = 0;
          if (v6 != v11 || v7 != v12)
            return result;
        }
        else
        {
LABEL_13:
          v21 = *(_QWORD *)(v3 + v4 + 64);
          v22 = v2;
          v16 = *(_QWORD *)(v3 + v4 + 80);
          v17 = *(_QWORD *)(a1 + v4 + 80);
          v18 = *(_QWORD *)(a1 + v4 + 56);
          v19 = sub_249B95644();
          result = 0;
          if ((v19 & 1) == 0)
            return result;
          if (v6 != v11)
            return result;
          v8 = v18;
          v10 = v17;
          v15 = v16;
          v13 = v21;
          v2 = v22;
          if (v7 != v12)
            return result;
        }
        if (v9)
        {
          if (!v13 || (v8 != v14 || v9 != v13) && (sub_249B95644() & 1) == 0)
            return 0;
        }
        else if (v13)
        {
          return 0;
        }
        if (!v10)
          break;
        if (!v15)
          return 0;
        if (v26 != v25 || v10 != v15)
        {
          v20 = sub_249B95644();
          result = 0;
          if ((v20 & 1) == 0)
            return result;
          goto LABEL_6;
        }
        if (v28 != v27)
          return 0;
LABEL_7:
        v4 += 64;
        --v2;
        a1 = v23;
        v3 = a2;
        if (!v2)
          return 1;
      }
      result = 0;
      if (v15)
        return result;
LABEL_6:
      if (((v28 ^ v27) & 1) != 0)
        return result;
      goto LABEL_7;
    }
  }
  return 1;
}

id UserNotification.originalContent.getter()
{
  id *v0;

  return *v0;
}

void UserNotification.originalContent.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*UserNotification.originalContent.modify())()
{
  return nullsub_1;
}

void *UserNotification.originalCategory.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 8);
  v2 = v1;
  return v1;
}

void UserNotification.originalCategory.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = a1;
}

uint64_t (*UserNotification.originalCategory.modify())()
{
  return nullsub_1;
}

void UserNotification.origin.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

_BYTE *UserNotification.origin.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = *result;
  return result;
}

uint64_t (*UserNotification.origin.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.legacyContent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_249B871AC(type metadata accessor for UserNotification, &qword_2544C2928, a1);
}

uint64_t type metadata accessor for UserNotification(uint64_t a1)
{
  return sub_249B838C0(a1, (uint64_t *)&unk_2544C2900);
}

uint64_t UserNotification.legacyContent.setter(uint64_t a1)
{
  return sub_249B87208(a1, type metadata accessor for UserNotification, &qword_2544C2928);
}

uint64_t (*UserNotification.legacyContent.modify())()
{
  type metadata accessor for UserNotification(0);
  return nullsub_1;
}

uint64_t UserNotification.bundleIdentifier.getter()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v17;

  v1 = type metadata accessor for UserNotification.Identifier(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (uint64_t *)((char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = *v0;
  v5 = objc_msgSend(v4, sel_request);
  v6 = objc_msgSend(v5, sel_identifier);

  v7 = sub_249B9538C();
  v9 = v8;

  *v3 = v7;
  v3[1] = v9;
  v10 = objc_msgSend(v4, sel_date);
  sub_249B952A8();

  v11 = objc_msgSend(v4, sel_sourceIdentifier);
  v12 = sub_249B9538C();
  v14 = v13;

  v15 = (uint64_t *)((char *)v3 + *(int *)(v1 + 24));
  *v15 = v12;
  v15[1] = v14;
  swift_bridgeObjectRetain();
  sub_249B833D4((uint64_t)v3, type metadata accessor for UserNotification.Identifier);
  return v12;
}

uint64_t type metadata accessor for UserNotification.Identifier(uint64_t a1)
{
  return sub_249B838C0(a1, (uint64_t *)&unk_2544C2B50);
}

void UserNotification.id.getter(uint64_t *a1@<X8>)
{
  id *v1;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;

  v3 = *v1;
  v4 = objc_msgSend(v3, sel_request);
  v5 = objc_msgSend(v4, sel_identifier);

  v6 = sub_249B9538C();
  v8 = v7;

  *a1 = v6;
  a1[1] = v8;
  v9 = objc_msgSend(v3, sel_date);
  v10 = type metadata accessor for UserNotification.Identifier(0);
  sub_249B952A8();

  v11 = objc_msgSend(v3, sel_sourceIdentifier);
  v12 = sub_249B9538C();
  v14 = v13;

  v15 = (uint64_t *)((char *)a1 + *(int *)(v10 + 24));
  *v15 = v12;
  v15[1] = v14;
}

uint64_t UserNotification.requestIdentifier.getter()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v17;

  v1 = type metadata accessor for UserNotification.Identifier(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (uint64_t *)((char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = *v0;
  v5 = objc_msgSend(v4, sel_request);
  v6 = objc_msgSend(v5, sel_identifier);

  v7 = sub_249B9538C();
  v9 = v8;

  *v3 = v7;
  v3[1] = v9;
  v10 = objc_msgSend(v4, sel_date);
  sub_249B952A8();

  v11 = objc_msgSend(v4, sel_sourceIdentifier);
  v12 = sub_249B9538C();
  v14 = v13;

  v15 = (uint64_t *)((char *)v3 + *(int *)(v1 + 24));
  *v15 = v12;
  v15[1] = v14;
  swift_bridgeObjectRetain();
  sub_249B833D4((uint64_t)v3, type metadata accessor for UserNotification.Identifier);
  return v7;
}

id UserNotification.contentType.getter()
{
  id *v0;
  id v1;
  id v2;
  id v3;

  v1 = objc_msgSend(*v0, sel_request);
  v2 = objc_msgSend(v1, sel_content);

  v3 = objc_msgSend(v2, sel_contentType);
  return v3;
}

uint64_t UserNotification.threadIdentifier.getter()
{
  id *v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;

  v1 = objc_msgSend(*v0, sel_request);
  v2 = objc_msgSend(v1, sel_content);

  v3 = objc_msgSend(v2, sel_threadIdentifier);
  v4 = sub_249B9538C();

  return v4;
}

uint64_t UserNotification.localizedContent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UserNotification(0);
  return sub_249B8D868(v1 + *(int *)(v3 + 32), a1, &qword_2544C2938);
}

uint64_t UserNotification.localizedContent.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UserNotification(0);
  return sub_249B8D8AC(a1, v1 + *(int *)(v3 + 32), &qword_2544C2938);
}

uint64_t (*UserNotification.localizedContent.modify())()
{
  type metadata accessor for UserNotification(0);
  return nullsub_1;
}

id UserNotification.derivedBehavior.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  void *v5;

  v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for UserNotification(0) + 36));
  v4 = *v3;
  v5 = (void *)v3[1];
  *a1 = *v3;
  a1[1] = (uint64_t)v5;
  return sub_249B82D30(v4, v5);
}

id sub_249B82D30(uint64_t a1, void *a2)
{
  id result;

  if (a2 != (void *)1)
    return a2;
  return result;
}

void UserNotification.derivedBehavior.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a1;
  v3 = a1[1];
  v4 = v1 + *(int *)(type metadata accessor for UserNotification(0) + 36);
  sub_249B82D80(*(_QWORD *)v4, *(void **)(v4 + 8));
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = v3;
}

void sub_249B82D80(uint64_t a1, void *a2)
{
  if (a2 != (void *)1)

}

uint64_t (*UserNotification.derivedBehavior.modify())()
{
  type metadata accessor for UserNotification(0);
  return nullsub_1;
}

uint64_t UserNotification.allowsPrivateProperties.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for UserNotification(0) + 40));
}

uint64_t UserNotification.allowsPrivateProperties.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for UserNotification(0);
  *(_BYTE *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*UserNotification.allowsPrivateProperties.modify())()
{
  type metadata accessor for UserNotification(0);
  return nullsub_1;
}

uint64_t UserNotification.incomingPriority.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for UserNotification(0);
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 44));
  return result;
}

uint64_t UserNotification.incomingPriority.setter(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for UserNotification(0);
  *(_BYTE *)(v1 + *(int *)(result + 44)) = v2;
  return result;
}

uint64_t (*UserNotification.incomingPriority.modify())()
{
  type metadata accessor for UserNotification(0);
  return nullsub_1;
}

uint64_t UserNotification.incomingPersistence.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for UserNotification(0);
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 48));
  return result;
}

uint64_t UserNotification.incomingPersistence.setter(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for UserNotification(0);
  *(_BYTE *)(v1 + *(int *)(result + 48)) = v2;
  return result;
}

uint64_t (*UserNotification.incomingPersistence.modify())()
{
  type metadata accessor for UserNotification(0);
  return nullsub_1;
}

uint64_t UserNotification.destinations.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for UserNotification(0);
  *a1 = *(_QWORD *)(v1 + *(int *)(result + 52));
  return result;
}

uint64_t UserNotification.destinations.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for UserNotification(0);
  *(_QWORD *)(v1 + *(int *)(result + 52)) = v2;
  return result;
}

uint64_t (*UserNotification.destinations.modify())()
{
  type metadata accessor for UserNotification(0);
  return nullsub_1;
}

void *UserNotification.settings.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for UserNotification(0) + 56));
  v2 = v1;
  return v1;
}

void UserNotification.settings.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(type metadata accessor for UserNotification(0) + 56);

  *(_QWORD *)(v1 + v3) = a1;
}

uint64_t (*UserNotification.settings.modify())()
{
  type metadata accessor for UserNotification(0);
  return nullsub_1;
}

uint64_t UserNotification.sourceDeviceType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UserNotification(0);
  return sub_249B8D868(v1 + *(int *)(v3 + 60), a1, &qword_2544C2B48);
}

uint64_t UserNotification.sourceDeviceType.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UserNotification(0);
  return sub_249B8D8AC(a1, v1 + *(int *)(v3 + 60), &qword_2544C2B48);
}

uint64_t (*UserNotification.sourceDeviceType.modify())()
{
  type metadata accessor for UserNotification(0);
  return nullsub_1;
}

void *UserNotification.derivedCommunicationContext.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for UserNotification(0) + 64));
  v2 = v1;
  return v1;
}

void UserNotification.derivedCommunicationContext.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(type metadata accessor for UserNotification(0) + 64);

  *(_QWORD *)(v1 + v3) = a1;
}

uint64_t (*UserNotification.derivedCommunicationContext.modify())()
{
  type metadata accessor for UserNotification(0);
  return nullsub_1;
}

uint64_t UserNotification.secureAttachments.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for UserNotification(0);
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 68));
  return result;
}

uint64_t UserNotification.secureAttachments.setter(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for UserNotification(0);
  *(_BYTE *)(v1 + *(int *)(result + 68)) = v2;
  return result;
}

uint64_t (*UserNotification.secureAttachments.modify())()
{
  type metadata accessor for UserNotification(0);
  return nullsub_1;
}

uint64_t UserNotification.title.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v14;

  v1 = type metadata accessor for UserNotification(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (id *)((char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2938);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (uint64_t *)((char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_249B8D868(v0 + *(int *)(v1 + 32), (uint64_t)v6, &qword_2544C2938);
  v7 = type metadata accessor for UserNotification.LocalizedContent(0);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    sub_249B7E754((uint64_t)v6, &qword_2544C2938);
    sub_249B8D250(v0, (uint64_t)v3, type metadata accessor for UserNotification);
LABEL_4:
    v10 = objc_msgSend(*v3, sel_request);
    v11 = objc_msgSend(v10, sel_content);

    v12 = objc_msgSend(v11, sel_title);
    v8 = sub_249B9538C();

    goto LABEL_5;
  }
  v8 = *v6;
  v9 = v6[1];
  swift_bridgeObjectRetain();
  sub_249B833D4((uint64_t)v6, type metadata accessor for UserNotification.LocalizedContent);
  sub_249B8D250(v0, (uint64_t)v3, type metadata accessor for UserNotification);
  if (!v9)
    goto LABEL_4;
LABEL_5:
  sub_249B833D4((uint64_t)v3, type metadata accessor for UserNotification);
  return v8;
}

uint64_t type metadata accessor for UserNotification.LocalizedContent(uint64_t a1)
{
  return sub_249B838C0(a1, (uint64_t *)&unk_2544C28F0);
}

uint64_t sub_249B833D4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t UserNotification.subtitle.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v14;

  v1 = type metadata accessor for UserNotification(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (id *)((char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2938);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249B8D868(v0 + *(int *)(v1 + 32), (uint64_t)v6, &qword_2544C2938);
  v7 = type metadata accessor for UserNotification.LocalizedContent(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    sub_249B7E754((uint64_t)v6, &qword_2544C2938);
    sub_249B8D250(v0, (uint64_t)v3, type metadata accessor for UserNotification);
LABEL_4:
    v10 = objc_msgSend(*v3, sel_request);
    v11 = objc_msgSend(v10, sel_content);

    v12 = objc_msgSend(v11, sel_subtitle);
    v8 = sub_249B9538C();

    goto LABEL_5;
  }
  v8 = *((_QWORD *)v6 + 2);
  v9 = *((_QWORD *)v6 + 3);
  swift_bridgeObjectRetain();
  sub_249B833D4((uint64_t)v6, type metadata accessor for UserNotification.LocalizedContent);
  sub_249B8D250(v0, (uint64_t)v3, type metadata accessor for UserNotification);
  if (!v9)
    goto LABEL_4;
LABEL_5:
  sub_249B833D4((uint64_t)v3, type metadata accessor for UserNotification);
  return v8;
}

uint64_t UserNotification.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v14;

  v1 = type metadata accessor for UserNotification(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (id *)((char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2938);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249B8D868(v0 + *(int *)(v1 + 32), (uint64_t)v6, &qword_2544C2938);
  v7 = type metadata accessor for UserNotification.LocalizedContent(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    sub_249B7E754((uint64_t)v6, &qword_2544C2938);
    sub_249B8D250(v0, (uint64_t)v3, type metadata accessor for UserNotification);
LABEL_4:
    v10 = objc_msgSend(*v3, sel_request);
    v11 = objc_msgSend(v10, sel_content);

    v12 = objc_msgSend(v11, sel_body);
    v8 = sub_249B9538C();

    goto LABEL_5;
  }
  v8 = *((_QWORD *)v6 + 4);
  v9 = *((_QWORD *)v6 + 5);
  swift_bridgeObjectRetain();
  sub_249B833D4((uint64_t)v6, type metadata accessor for UserNotification.LocalizedContent);
  sub_249B8D250(v0, (uint64_t)v3, type metadata accessor for UserNotification);
  if (!v9)
    goto LABEL_4;
LABEL_5:
  sub_249B833D4((uint64_t)v3, type metadata accessor for UserNotification);
  return v8;
}

uint64_t UserNotification.attributedBody.getter()
{
  return 0;
}

uint64_t UserNotification.init(notification:category:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  *(_BYTE *)(a3 + 16) = 0;
  v6 = (int *)type metadata accessor for UserNotification(0);
  v7 = a3 + v6[7];
  v8 = type metadata accessor for UserNotification.LegacyContent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = a3 + v6[8];
  v10 = type metadata accessor for UserNotification.LocalizedContent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(_OWORD *)(a3 + v6[9]) = xmmword_249B99180;
  *(_BYTE *)(a3 + v6[10]) = 0;
  *(_BYTE *)(a3 + v6[11]) = 0;
  *(_BYTE *)(a3 + v6[12]) = 0;
  *(_QWORD *)(a3 + v6[13]) = 0;
  *(_QWORD *)(a3 + v6[14]) = 0;
  v11 = a3 + v6[15];
  v12 = sub_249B95308();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(_QWORD *)(a3 + v6[16]) = 0;
  *(_BYTE *)(a3 + v6[17]) = 1;
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  return result;
}

uint64_t type metadata accessor for UserNotification.LegacyContent(uint64_t a1)
{
  return sub_249B838C0(a1, (uint64_t *)&unk_2544C28E0);
}

uint64_t sub_249B838C0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t UserNotification.hash(into:)(uint64_t a1)
{
  id *v1;
  id *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v20;

  v2 = v1;
  v4 = sub_249B95308();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2B48);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v1;
  sub_249B9550C();

  v12 = v2[1];
  sub_249B956A4();
  if (v12)
  {
    v13 = v12;
    sub_249B9550C();

  }
  sub_249B95698();
  v14 = type metadata accessor for UserNotification(0);
  sub_249B8C314(a1);
  sub_249B8BFC0();
  v15 = (uint64_t *)((char *)v2 + *(int *)(v14 + 36));
  v16 = (void *)v15[1];
  if (v16 == (void *)1 || (v17 = *v15, sub_249B956A4(), sub_249B956A4(), sub_249B956A4(), sub_249B956A4(), !v16))
  {
    sub_249B956A4();
  }
  else
  {
    sub_249B956A4();
    v18 = v16;
    sub_249B9550C();
    sub_249B82D80(v17, v16);
  }
  sub_249B956A4();
  sub_249B95698();
  sub_249B95698();
  sub_249B8D868((uint64_t)v2 + *(int *)(v14 + 60), (uint64_t)v10, &qword_2544C2B48);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
    return sub_249B956A4();
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
  sub_249B956A4();
  sub_249B80E4C(&qword_2578C23B0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE63B8], MEMORY[0x24BEE63E0]);
  sub_249B9535C();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void UserNotification.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[2];
  id v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  void (*v77)(uint64_t, _QWORD, uint64_t, uint64_t);
  char *v78;
  void (*v79)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  unint64_t v94;
  char v95;

  v92 = a1;
  v73 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2938);
  MEMORY[0x24BDAC7A8](v2);
  v75 = (char *)v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2B48);
  MEMORY[0x24BDAC7A8](v4);
  v76 = (char *)v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2928);
  MEMORY[0x24BDAC7A8](v6);
  v78 = (char *)v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C23B8);
  v80 = *(_QWORD *)(v82 - 8);
  MEMORY[0x24BDAC7A8](v82);
  v9 = (char *)v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (int *)type metadata accessor for UserNotification(0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_QWORD *)v13 + 1) = 0;
  v13[16] = 0;
  v14 = &v13[*(int *)(v11 + 28)];
  v15 = type metadata accessor for UserNotification.LegacyContent(0);
  v16 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v87 = (uint64_t)v14;
  v81 = v15;
  v79 = v16;
  ((void (*)(char *, uint64_t, uint64_t))v16)(v14, 1, 1);
  v17 = (uint64_t)&v13[v10[8]];
  v18 = type metadata accessor for UserNotification.LocalizedContent(0);
  v19 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v91 = v17;
  v77 = v19;
  v19(v17, 1, 1, v18);
  v90 = &v13[v10[9]];
  *(_OWORD *)v90 = xmmword_249B99180;
  v74 = v10[10];
  v13[v74] = 0;
  v20 = v10[11];
  v13[v20] = 0;
  v21 = v10[12];
  v13[v21] = 0;
  *(_QWORD *)&v13[v10[13]] = 0;
  v85 = v10[14];
  *(_QWORD *)&v13[v85] = 0;
  v22 = (uint64_t)&v13[v10[15]];
  v23 = sub_249B95308();
  v24 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56);
  v89 = v22;
  v24(v22, 1, 1, v23);
  v84 = v10[16];
  *(_QWORD *)&v13[v84] = 0;
  v25 = v10[17];
  v86 = v13;
  v13[v25] = 1;
  __swift_project_boxed_opaque_existential_1(v92, v92[3]);
  sub_249B8CE60();
  v83 = v9;
  v26 = v88;
  sub_249B956BC();
  if (v26)
  {
    v37 = (uint64_t)v86;
    v38 = v87;
LABEL_4:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v92);
    v31 = v84;
    v30 = v85;

    sub_249B7E754(v38, &qword_2544C2928);
    sub_249B7E754(v91, &qword_2544C2938);
    sub_249B82D80(*(_QWORD *)v90, *((void **)v90 + 1));

    sub_249B7E754(v89, &qword_2544C2B48);
    return;
  }
  v27 = v81;
  v72 = v24;
  v88 = v18;
  v71 = v20;
  v70 = v21;
  v95 = 0;
  v28 = sub_249B8CEA4();
  v29 = v82;
  sub_249B955CC();
  v32 = v29;
  v69 = v28;
  v33 = v93;
  v34 = v94;
  v35 = sub_249B94C1C(0, &qword_2578C23D0);
  sub_249B94C1C(0, &qword_2578C23D8);
  v36 = (void *)sub_249B954F4();
  v37 = (uint64_t)v86;
  v38 = v87;
  v68 = v34;
  v65[1] = v35;
  if (!v36)
  {
    sub_249B8CEE8();
    swift_allocError();
    *v39 = 0;
    swift_willThrow();
    sub_249B80E08(v33, v68);
    (*(void (**)(char *, uint64_t))(v80 + 8))(v83, v32);
    goto LABEL_4;
  }
  v67 = v33;
  *v86 = v36;
  v95 = 1;
  v66 = v36;
  sub_249B955CC();
  v41 = v93;
  v40 = v94;
  sub_249B94C1C(0, &qword_2578C2428);
  v42 = v40;
  v43 = v27;
  v44 = sub_249B954F4();
  sub_249B80E08(v41, v42);
  v45 = v79;
  if (v44)
    *(_QWORD *)(v37 + 8) = v44;
  v46 = v82;
  v95 = 2;
  sub_249B8CF2C();
  sub_249B955CC();
  *(_BYTE *)(v37 + 16) = v93;
  LOBYTE(v93) = 3;
  sub_249B80E4C(&qword_2578C23F0, type metadata accessor for UserNotification.LegacyContent, (uint64_t)&protocol conformance descriptor for UserNotification.LegacyContent);
  v47 = (uint64_t)v78;
  sub_249B955CC();
  v45(v47, 0, 1, v43);
  sub_249B8D8AC(v47, v38, &qword_2544C2928);
  v48 = (uint64_t)v75;
  v49 = (uint64_t)v76;
  LOBYTE(v93) = 10;
  sub_249B80E4C(&qword_2578C23F8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE63B8], MEMORY[0x24BEE63F0]);
  sub_249B955CC();
  v72(v49, 0, 1, v23);
  sub_249B8D8AC(v49, v89, &qword_2544C2B48);
  LOBYTE(v93) = 4;
  sub_249B80E4C(&qword_2578C2400, type metadata accessor for UserNotification.LocalizedContent, (uint64_t)&protocol conformance descriptor for UserNotification.LocalizedContent);
  sub_249B955CC();
  v77(v48, 0, 1, v88);
  sub_249B8D8AC(v48, v91, &qword_2544C2938);
  v95 = 5;
  sub_249B8CF70();
  v50 = v83;
  sub_249B955CC();
  v51 = v94;
  v52 = 256;
  if (!BYTE1(v93))
    v52 = 0;
  v53 = v52 | v93;
  v54 = 0x10000;
  if (!BYTE2(v93))
    v54 = 0;
  v55 = v53 | v54;
  v56 = v90;
  sub_249B82D80(*(_QWORD *)v90, *((void **)v90 + 1));
  *v56 = v55;
  v56[1] = v51;
  LOBYTE(v93) = 6;
  *(_BYTE *)(v37 + v74) = sub_249B955C0() & 1;
  v95 = 7;
  sub_249B8CFB4();
  sub_249B955CC();
  v57 = v68;
  *(_BYTE *)(v37 + v71) = v93;
  v95 = 8;
  sub_249B8CFF8();
  sub_249B955CC();
  *(_BYTE *)(v37 + v70) = v93;
  v95 = 9;
  sub_249B955CC();
  v58 = v57;
  v60 = v93;
  v59 = v94;
  sub_249B94C1C(0, &qword_2578C2420);
  v61 = sub_249B954F4();
  v62 = v80;
  v63 = v61;
  if (v61)
  {
    (*(void (**)(char *, uint64_t))(v80 + 8))(v50, v46);
    sub_249B80E08(v67, v58);

    sub_249B80E08(v60, v59);
    v64 = v85;

    *(_QWORD *)(v37 + v64) = v63;
  }
  else
  {
    sub_249B80E08(v67, v58);
    sub_249B80E08(v60, v59);

    (*(void (**)(char *, uint64_t))(v62 + 8))(v50, v46);
  }
  sub_249B8D250(v37, v73, type metadata accessor for UserNotification);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v92);
  sub_249B833D4(v37, type metadata accessor for UserNotification);
}

void UserNotification.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
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
  char *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void (*v25)(char *, uint64_t);
  void *v26;
  _QWORD *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int *v41;
  uint64_t *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  _QWORD *v47;
  uint64_t v48;
  char *v49;
  int *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  void *v59;
  uint64_t v60;
  int *v61;
  unint64_t v62;
  uint64_t v63;
  id v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  _QWORD *v72;
  uint64_t v73;
  char v74;
  id v75;
  unint64_t v76;
  uint64_t v77;

  v3 = v1;
  v77 = *MEMORY[0x24BDAC8D0];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2B48);
  MEMORY[0x24BDAC7A8](v5);
  v71 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_249B95308();
  v66 = *(_QWORD *)(v7 - 8);
  v67 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v65 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2938);
  MEMORY[0x24BDAC7A8](v9);
  v69 = (uint64_t)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = type metadata accessor for UserNotification.LocalizedContent(0);
  v11 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v68 = (uint64_t)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2430);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249B8CE60();
  sub_249B956C8();
  v17 = (void *)objc_opt_self();
  v72 = v3;
  v18 = *v3;
  v75 = 0;
  v19 = objc_msgSend(v17, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v18, 1, &v75);
  v20 = v75;
  if (!v19)
  {
    v26 = v20;
    sub_249B9526C();

    swift_willThrow();
    v25 = *(void (**)(char *, uint64_t))(v14 + 8);
    goto LABEL_5;
  }
  v64 = v17;
  v73 = v14;
  v21 = (void *)sub_249B95278();
  v23 = v22;

  v75 = v21;
  v76 = v23;
  v74 = 0;
  v24 = sub_249B8D03C();
  sub_249B9562C();
  if (v2)
  {
    sub_249B80E08((uint64_t)v21, v23);
    v25 = *(void (**)(char *, uint64_t))(v73 + 8);
LABEL_5:
    v25(v16, v13);
    return;
  }
  v62 = v24;
  v63 = v13;
  sub_249B80E08((uint64_t)v21, v23);
  v27 = v72;
  v28 = (void *)v72[1];
  if (v28)
  {
    v75 = 0;
    v29 = v28;
    v30 = objc_msgSend(v64, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v29, 1, &v75);
    v31 = v75;
    if (!v30)
    {
      v35 = v31;
      sub_249B9526C();

      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v16, v63);
      return;
    }
    v32 = (void *)sub_249B95278();
    v34 = v33;

    v75 = v32;
    v76 = v34;
    v74 = 1;
    sub_249B9562C();
    sub_249B80E08((uint64_t)v32, v34);

  }
  LOBYTE(v75) = *((_BYTE *)v27 + 16);
  v74 = 2;
  sub_249B8D080();
  v36 = v63;
  sub_249B9562C();
  v37 = type metadata accessor for UserNotification(0);
  LOBYTE(v75) = 3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2928);
  sub_249B8D0C4();
  sub_249B9562C();
  v61 = (int *)v37;
  v38 = v69;
  sub_249B8D868((uint64_t)v27 + *(int *)(v37 + 32), v69, &qword_2544C2938);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v38, 1, v70) == 1)
  {
    sub_249B7E754(v38, &qword_2544C2938);
    v39 = (uint64_t)v71;
  }
  else
  {
    v40 = v68;
    sub_249B94C54(v38, v68, type metadata accessor for UserNotification.LocalizedContent);
    LOBYTE(v75) = 4;
    sub_249B80E4C(&qword_2578C2478, type metadata accessor for UserNotification.LocalizedContent, (uint64_t)&protocol conformance descriptor for UserNotification.LocalizedContent);
    sub_249B9562C();
    v39 = (uint64_t)v71;
    sub_249B833D4(v40, type metadata accessor for UserNotification.LocalizedContent);
  }
  v41 = v61;
  v42 = (_QWORD *)((char *)v27 + v61[9]);
  v43 = (void *)v42[1];
  if (v43 == (void *)1)
  {
    v44 = v66;
  }
  else
  {
    v45 = *v42;
    LOWORD(v75) = *v42 & 0x101;
    BYTE2(v75) = BYTE2(v45) & 1;
    v76 = (unint64_t)v43;
    v74 = 5;
    sub_249B8D1C8();
    v46 = v43;
    sub_249B9562C();
    sub_249B82D80(v45, v43);
    v44 = v66;
    v41 = v61;
  }
  v47 = v72;
  sub_249B8D868((uint64_t)v72 + v41[15], v39, &qword_2544C2B48);
  v48 = v67;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v39, 1, v67) == 1)
  {
    sub_249B7E754(v39, &qword_2544C2B48);
  }
  else
  {
    v49 = v65;
    (*(void (**)(char *, uint64_t, uint64_t))(v44 + 32))(v65, v39, v48);
    LOBYTE(v75) = 10;
    sub_249B80E4C(&qword_2578C2468, (uint64_t (*)(uint64_t))MEMORY[0x24BEE63B8], MEMORY[0x24BEE63D8]);
    sub_249B9562C();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v49, v48);
  }
  v50 = v61;
  LOBYTE(v75) = 6;
  sub_249B95620();
  LOBYTE(v75) = *((_BYTE *)v47 + v50[11]);
  v74 = 7;
  sub_249B8D140();
  sub_249B9562C();
  LOBYTE(v75) = *((_BYTE *)v47 + v50[12]);
  v74 = 8;
  sub_249B8D184();
  sub_249B9562C();
  v51 = *(void **)((char *)v47 + v50[14]);
  if (!v51)
    goto LABEL_11;
  v75 = 0;
  v52 = v51;
  v53 = objc_msgSend(v64, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v52, 1, &v75);
  v54 = v75;
  if (!v53)
  {
    v59 = v54;
    sub_249B9526C();

    swift_willThrow();
LABEL_11:
    (*(void (**)(char *, uint64_t))(v73 + 8))(v16, v36);
    return;
  }
  v55 = (void *)sub_249B95278();
  v56 = v36;
  v58 = v57;

  v75 = v55;
  v76 = v58;
  v74 = 9;
  sub_249B9562C();

  sub_249B80E08((uint64_t)v55, v58);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v16, v56);
}

uint64_t sub_249B84F80(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_249B84FC0 + 4 * byte_249B977A0[a1]))(0x6C616E696769726FLL, 0xEF746E65746E6F43);
}

unint64_t sub_249B84FC0()
{
  return 0xD000000000000010;
}

void sub_249B8508C()
{
  JUMPOUT(0x249B850A0);
}

uint64_t sub_249B850AC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_249B850EC + 4 * byte_249B977AB[a1]))(0x6C616E696769726FLL, 0xEF746E65746E6F43);
}

unint64_t sub_249B850EC()
{
  return 0xD000000000000010;
}

void sub_249B851B8()
{
  JUMPOUT(0x249B851CCLL);
}

uint64_t sub_249B851D8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_249B84F80(*a1);
  v5 = v4;
  if (v3 == sub_249B84F80(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_249B95644();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_249B85260()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_249B9568C();
  sub_249B84F80(v1);
  sub_249B953D4();
  swift_bridgeObjectRelease();
  return sub_249B956B0();
}

uint64_t sub_249B852C0()
{
  unsigned __int8 *v0;

  sub_249B84F80(*v0);
  sub_249B953D4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_249B85300()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_249B9568C();
  sub_249B84F80(v1);
  sub_249B953D4();
  swift_bridgeObjectRelease();
  return sub_249B956B0();
}

uint64_t sub_249B8535C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_249B93F00();
  *a1 = result;
  return result;
}

uint64_t sub_249B85388@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_249B84F80(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_249B853B0()
{
  unsigned __int8 *v0;

  return sub_249B850AC(*v0);
}

uint64_t sub_249B853B8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_249B93F00();
  *a1 = result;
  return result;
}

void sub_249B853DC(_BYTE *a1@<X8>)
{
  *a1 = 11;
}

uint64_t sub_249B853E8()
{
  sub_249B8CE60();
  return sub_249B956D4();
}

uint64_t sub_249B85410()
{
  sub_249B8CE60();
  return sub_249B956E0();
}

uint64_t UserNotification.hashValue.getter()
{
  return sub_249B87F0C((void (*)(_BYTE *))UserNotification.hash(into:));
}

void sub_249B8544C(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  UserNotification.init(from:)(a1, a2);
}

void sub_249B85460(_QWORD *a1)
{
  UserNotification.encode(to:)(a1);
}

uint64_t sub_249B85478(uint64_t a1, uint64_t a2)
{
  return sub_249B87F80(a1, a2, (void (*)(_BYTE *))UserNotification.hash(into:));
}

uint64_t sub_249B85488(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249B87FD0(a1, a2, a3, (void (*)(_BYTE *))UserNotification.hash(into:));
}

uint64_t UserNotification.Identifier.id.getter()
{
  swift_bridgeObjectRetain();
  sub_249B9541C();
  swift_bridgeObjectRelease();
  type metadata accessor for UserNotification.Identifier(0);
  sub_249B95284();
  sub_249B954D0();
  swift_bridgeObjectRetain();
  sub_249B9541C();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_249B85550(char a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;

  if ((a1 & 1) != 0)
  {
    v1 = (void *)sub_249B95380();
    v2 = objc_msgSend(v1, sel_un_logDigest);

    if (v2)
    {
      sub_249B9538C();

    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  sub_249B95554();
  swift_bridgeObjectRelease();
  sub_249B9541C();
  swift_bridgeObjectRelease();
  sub_249B9541C();
  v3 = (void *)sub_249B93F48();
  type metadata accessor for UserNotification.Identifier(0);
  v4 = (void *)sub_249B95290();
  v5 = objc_msgSend(v3, sel_stringFromDate_, v4);

  sub_249B9538C();
  sub_249B9541C();
  swift_bridgeObjectRelease();
  sub_249B9541C();
  swift_bridgeObjectRetain();
  sub_249B9541C();
  swift_bridgeObjectRelease();
  sub_249B9541C();
  return 1029990747;
}

uint64_t UserNotification.Identifier.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_249B953D4();
  swift_bridgeObjectRelease();
  type metadata accessor for UserNotification.Identifier(0);
  sub_249B952B4();
  sub_249B80E4C(&qword_2578C2480, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_249B9535C();
  swift_bridgeObjectRetain();
  sub_249B953D4();
  return swift_bridgeObjectRelease();
}

BOOL sub_249B857F0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_249B85804()
{
  return sub_249B95698();
}

unint64_t sub_249B8582C()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000010;
  if (*v0 == 1)
    v1 = 1702125924;
  if (*v0)
    return v1;
  else
    return 0xD000000000000011;
}

uint64_t sub_249B85884@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_249B9414C(a1, a2);
  *a3 = result;
  return result;
}

void sub_249B858A8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_249B858B4()
{
  sub_249B8D20C();
  return sub_249B956D4();
}

uint64_t sub_249B858DC()
{
  sub_249B8D20C();
  return sub_249B956E0();
}

uint64_t UserNotification.Identifier.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2488);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249B8D20C();
  sub_249B956C8();
  v8[15] = 0;
  sub_249B95614();
  if (!v1)
  {
    type metadata accessor for UserNotification.Identifier(0);
    v8[14] = 1;
    sub_249B952B4();
    sub_249B80E4C(&qword_2578C2498, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_249B9562C();
    v8[13] = 2;
    sub_249B95614();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t UserNotification.Identifier.hashValue.getter()
{
  sub_249B9568C();
  swift_bridgeObjectRetain();
  sub_249B953D4();
  swift_bridgeObjectRelease();
  type metadata accessor for UserNotification.Identifier(0);
  sub_249B952B4();
  sub_249B80E4C(&qword_2578C2480, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_249B9535C();
  swift_bridgeObjectRetain();
  sub_249B953D4();
  swift_bridgeObjectRelease();
  return sub_249B956B0();
}

uint64_t UserNotification.Identifier.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  _QWORD *v36;
  char v37;
  char v38;
  char v39;

  v31 = a2;
  v3 = sub_249B952B4();
  v32 = *(_QWORD *)(v3 - 8);
  v33 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C24A0);
  v6 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for UserNotification.Identifier(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249B8D20C();
  v35 = v8;
  v12 = (uint64_t)v36;
  sub_249B956BC();
  if (v12)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v13 = v5;
  v14 = v6;
  v36 = a1;
  v30 = v11;
  v15 = v32;
  v16 = v33;
  v39 = 0;
  v17 = v34;
  v18 = sub_249B955B4();
  v19 = v30;
  *v30 = v18;
  v19[1] = v20;
  v38 = 1;
  sub_249B80E4C(&qword_2578C24A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
  sub_249B955CC();
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))((char *)v30 + *(int *)(v9 + 20), v13, v16);
  v37 = 2;
  v21 = sub_249B955B4();
  v23 = v22;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v35, v17);
  v24 = *(int *)(v9 + 24);
  v26 = (uint64_t)v30;
  v25 = v31;
  v27 = (uint64_t *)((char *)v30 + v24);
  *v27 = v21;
  v27[1] = v23;
  sub_249B8D250(v26, v25, type metadata accessor for UserNotification.Identifier);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  return sub_249B833D4(v26, type metadata accessor for UserNotification.Identifier);
}

uint64_t sub_249B85E68@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  swift_bridgeObjectRetain();
  sub_249B9541C();
  swift_bridgeObjectRelease();
  sub_249B95284();
  sub_249B954D0();
  swift_bridgeObjectRetain();
  sub_249B9541C();
  result = swift_bridgeObjectRelease();
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  return result;
}

uint64_t sub_249B85F28()
{
  sub_249B9568C();
  swift_bridgeObjectRetain();
  sub_249B953D4();
  swift_bridgeObjectRelease();
  sub_249B952B4();
  sub_249B80E4C(&qword_2578C2480, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_249B9535C();
  swift_bridgeObjectRetain();
  sub_249B953D4();
  swift_bridgeObjectRelease();
  return sub_249B956B0();
}

uint64_t sub_249B86000()
{
  swift_bridgeObjectRetain();
  sub_249B953D4();
  swift_bridgeObjectRelease();
  sub_249B952B4();
  sub_249B80E4C(&qword_2578C2480, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_249B9535C();
  swift_bridgeObjectRetain();
  sub_249B953D4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_249B860C4()
{
  sub_249B9568C();
  swift_bridgeObjectRetain();
  sub_249B953D4();
  swift_bridgeObjectRelease();
  sub_249B952B4();
  sub_249B80E4C(&qword_2578C2480, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_249B9535C();
  swift_bridgeObjectRetain();
  sub_249B953D4();
  swift_bridgeObjectRelease();
  return sub_249B956B0();
}

uint64_t sub_249B86198@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return UserNotification.Identifier.init(from:)(a1, a2);
}

uint64_t sub_249B861AC(_QWORD *a1)
{
  return UserNotification.Identifier.encode(to:)(a1);
}

uint64_t UserNotification.Identifier.description.getter()
{
  return sub_249B85550(1);
}

uint64_t sub_249B861CC()
{
  return sub_249B85550(1);
}

uint64_t UserNotification.Identifier.debugDescription.getter()
{
  return sub_249B85550(0);
}

uint64_t sub_249B861DC()
{
  return sub_249B85550(0);
}

uint64_t UserNotification.description.getter()
{
  return sub_249B861F8(1);
}

uint64_t UserNotification.debugDescription.getter()
{
  return sub_249B861F8(0);
}

uint64_t sub_249B861F8(char a1)
{
  id *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v20;

  v3 = type metadata accessor for UserNotification.Identifier(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *v1;
  v7 = objc_msgSend(v6, sel_request);
  v8 = objc_msgSend(v7, sel_identifier);

  v9 = sub_249B9538C();
  v11 = v10;

  *v5 = v9;
  v5[1] = v11;
  v12 = objc_msgSend(v6, sel_date);
  sub_249B952A8();

  v13 = objc_msgSend(v6, sel_sourceIdentifier);
  v14 = sub_249B9538C();
  v16 = v15;

  v17 = (uint64_t *)((char *)v5 + *(int *)(v3 + 24));
  *v17 = v14;
  v17[1] = v16;
  v18 = sub_249B85550(a1);
  sub_249B833D4((uint64_t)v5, type metadata accessor for UserNotification.Identifier);
  return v18;
}

uint64_t UserNotification.spotlightIdentifier.getter()
{
  uint64_t v1;

  v1 = UserNotification.bundleIdentifier.getter();
  sub_249B9541C();
  UserNotification.requestIdentifier.getter();
  sub_249B9541C();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t static UserNotification.requestIdentifierFromSpotlightIdentifier(_:)(uint64_t a1, unint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  _QWORD v12[2];

  v12[0] = 58;
  v12[1] = 0xE100000000000000;
  v11[2] = v12;
  swift_bridgeObjectRetain();
  v4 = sub_249B8BA9C(1, 0, sub_249B8D294, (uint64_t)v11, a1, a2);
  if (*((_QWORD *)v4 + 2) == 2)
  {
    v5 = *((_QWORD *)v4 + 8);
    v6 = *((_QWORD *)v4 + 9);
    v7 = *((_QWORD *)v4 + 10);
    v8 = *((_QWORD *)v4 + 11);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v9 = MEMORY[0x24BCFF3B4](v5, v6, v7, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v9;
}

uint64_t static UserNotification.bundleIdentifierFromSpotlightIdentifier(_:)(uint64_t a1, unint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  _QWORD v12[2];

  v12[0] = 58;
  v12[1] = 0xE100000000000000;
  v11[2] = v12;
  swift_bridgeObjectRetain();
  v4 = sub_249B8BA9C(1, 0, sub_249B8D294, (uint64_t)v11, a1, a2);
  if (*((_QWORD *)v4 + 2) == 2)
  {
    v5 = *((_QWORD *)v4 + 4);
    v6 = *((_QWORD *)v4 + 5);
    v7 = *((_QWORD *)v4 + 6);
    v8 = *((_QWORD *)v4 + 7);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v9 = MEMORY[0x24BCFF3B4](v5, v6, v7, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v9;
}

uint64_t UserNotification.Behavior.critical.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t UserNotification.Behavior.critical.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*UserNotification.Behavior.critical.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.Behavior.timeSensitive.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t UserNotification.Behavior.timeSensitive.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = result;
  return result;
}

uint64_t (*UserNotification.Behavior.timeSensitive.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.Behavior.ignoreDoNotDisturb.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t UserNotification.Behavior.ignoreDoNotDisturb.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 2) = result;
  return result;
}

uint64_t (*UserNotification.Behavior.ignoreDoNotDisturb.modify())()
{
  return nullsub_1;
}

void *UserNotification.Behavior.dndBehavior.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 8);
  v2 = v1;
  return v1;
}

void UserNotification.Behavior.dndBehavior.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = a1;
}

uint64_t (*UserNotification.Behavior.dndBehavior.modify())()
{
  return nullsub_1;
}

void *UserNotification.Behavior.shouldDelayDelivery.getter()
{
  uint64_t v0;
  void *result;

  result = *(void **)(v0 + 8);
  if (result)
    return (void *)(objc_msgSend(result, sel_interruptionSuppression) == (id)2);
  return result;
}

uint64_t UserNotification.Behavior.init(critical:timeSensitive:ignoreDoNotDisturb:dndBehavior:)@<X0>(uint64_t result@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(_BYTE *)a5 = result;
  *(_BYTE *)(a5 + 1) = a2;
  *(_BYTE *)(a5 + 2) = a3;
  *(_QWORD *)(a5 + 8) = a4;
  return result;
}

void UserNotification.Behavior.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  char v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C24B0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249B8D300();
  sub_249B956BC();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    LOBYTE(v18) = 0;
    v9 = sub_249B955C0();
    LOBYTE(v18) = 1;
    v10 = sub_249B955C0();
    LOBYTE(v18) = 2;
    LOBYTE(v20) = sub_249B955C0() & 1;
    v20 = v20;
    v21 = 3;
    sub_249B8CEA4();
    sub_249B955CC();
    v16 = v10 & 1;
    v17 = v9 & 1;
    v11 = v18;
    v12 = v19;
    sub_249B94C1C(0, &qword_2578C23D0);
    sub_249B94C1C(0, &qword_2578C24C0);
    v13 = (void *)sub_249B954F4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_249B80E08(v11, v12);
    LOBYTE(v12) = v16;
    *(_BYTE *)a2 = v17;
    *(_BYTE *)(a2 + 1) = v12;
    *(_BYTE *)(a2 + 2) = v20;
    *(_QWORD *)(a2 + 8) = v13;
    v14 = v13;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);

  }
}

uint64_t UserNotification.Behavior.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  char v23;
  id v24[3];

  v24[2] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C24C8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(unsigned __int8 *)(v1 + 1);
  v21 = *(unsigned __int8 *)(v1 + 2);
  v22 = v8;
  v20 = *(void **)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249B8D300();
  v9 = v4;
  sub_249B956C8();
  LOBYTE(v24[0]) = 0;
  sub_249B95620();
  if (!v2)
  {
    v10 = v20;
    LOBYTE(v24[0]) = 1;
    sub_249B95620();
    LOBYTE(v24[0]) = 2;
    sub_249B95620();
    if (v10)
    {
      v12 = (void *)objc_opt_self();
      v24[0] = 0;
      v13 = v10;
      v14 = objc_msgSend(v12, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v13, 1, v24);
      v15 = v24[0];
      if (v14)
      {
        v16 = (void *)sub_249B95278();
        v18 = v17;

        v24[0] = v16;
        v24[1] = v18;
        v23 = 3;
        sub_249B8D03C();
        sub_249B9562C();

        sub_249B80E08((uint64_t)v16, (unint64_t)v18);
      }
      else
      {
        v19 = v15;
        sub_249B9526C();

        swift_willThrow();
      }
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v9);
}

void sub_249B86B78(char *a1)
{
  sub_249B81E48(*a1);
}

void sub_249B86B84()
{
  char *v0;

  sub_249B82148(*v0);
}

void sub_249B86B8C()
{
  __asm { BR              X10 }
}

uint64_t sub_249B86BC8()
{
  sub_249B953D4();
  return swift_bridgeObjectRelease();
}

void sub_249B86C3C(uint64_t a1)
{
  char *v1;

  sub_249B823CC(a1, *v1);
}

uint64_t sub_249B86C44@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_249B94288();
  *a1 = result;
  return result;
}

uint64_t sub_249B86C78()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_249B86CA8 + 4 * byte_249B977BA[*v0]))();
}

void sub_249B86CA8(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "timeSensitive");
  *(_WORD *)(a1 + 14) = -4864;
}

void sub_249B86CD0(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000012;
  a1[1] = 0x8000000249B997C0;
}

void sub_249B86CF0(_QWORD *a1@<X8>)
{
  *a1 = 0x7661686542646E64;
  a1[1] = 0xEB00000000726F69;
}

uint64_t sub_249B86D14()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_249B86D44 + 4 * byte_249B977BE[*v0]))(0x6C61636974697263, 0xE800000000000000);
}

uint64_t sub_249B86D44()
{
  return 0x736E6553656D6974;
}

unint64_t sub_249B86D68()
{
  return 0xD000000000000012;
}

uint64_t sub_249B86D84()
{
  return 0x7661686542646E64;
}

uint64_t sub_249B86DA4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_249B94288();
  *a1 = result;
  return result;
}

void sub_249B86DD0(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_249B86DDC()
{
  sub_249B8D300();
  return sub_249B956D4();
}

uint64_t sub_249B86E04()
{
  sub_249B8D300();
  return sub_249B956E0();
}

void UserNotification.Behavior.hash(into:)()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 8);
  sub_249B956A4();
  sub_249B956A4();
  sub_249B956A4();
  sub_249B956A4();
  if (v1)
  {
    v2 = v1;
    sub_249B9550C();

  }
}

uint64_t UserNotification.Behavior.hashValue.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 8);
  sub_249B9568C();
  sub_249B956A4();
  sub_249B956A4();
  sub_249B956A4();
  sub_249B956A4();
  if (v1)
  {
    v2 = v1;
    sub_249B9550C();

  }
  return sub_249B956B0();
}

void sub_249B86F70(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  UserNotification.Behavior.init(from:)(a1, a2);
}

uint64_t sub_249B86F84(_QWORD *a1)
{
  return UserNotification.Behavior.encode(to:)(a1);
}

uint64_t sub_249B86FA0()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 8);
  sub_249B9568C();
  sub_249B956A4();
  sub_249B956A4();
  sub_249B956A4();
  sub_249B956A4();
  if (v1)
  {
    v2 = v1;
    sub_249B9550C();

  }
  return sub_249B956B0();
}

uint64_t UserNotification.LocalizedContent.localizedTitle.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserNotification.LocalizedContent.localizedTitle.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*UserNotification.LocalizedContent.localizedTitle.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LocalizedContent.localizedSubtitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserNotification.LocalizedContent.localizedSubtitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*UserNotification.LocalizedContent.localizedSubtitle.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LocalizedContent.localizedBody.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserNotification.LocalizedContent.localizedBody.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*UserNotification.LocalizedContent.localizedBody.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LocalizedContent.summary.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_249B871AC(type metadata accessor for UserNotification.LocalizedContent, qword_2544C2660, a1);
}

uint64_t sub_249B871AC@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;

  v6 = a1(0);
  return sub_249B8D868(v3 + *(int *)(v6 + 28), a3, a2);
}

uint64_t UserNotification.LocalizedContent.summary.setter(uint64_t a1)
{
  return sub_249B87208(a1, type metadata accessor for UserNotification.LocalizedContent, qword_2544C2660);
}

uint64_t sub_249B87208(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;

  v6 = a2(0);
  return sub_249B8D8AC(a1, v3 + *(int *)(v6 + 28), a3);
}

uint64_t (*UserNotification.LocalizedContent.summary.modify())()
{
  type metadata accessor for UserNotification.LocalizedContent(0);
  return nullsub_1;
}

uint64_t UserNotification.LocalizedContent.isHighlight.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for UserNotification.LocalizedContent(0) + 32));
}

uint64_t UserNotification.LocalizedContent.isHighlight.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for UserNotification.LocalizedContent(0);
  *(_BYTE *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*UserNotification.LocalizedContent.isHighlight.modify())()
{
  type metadata accessor for UserNotification.LocalizedContent(0);
  return nullsub_1;
}

uint64_t UserNotification.LocalizedContent.init(localizedTitle:localizedSubtitle:localizedBody:summary:isHighlight:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, _QWORD *a9@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;

  v28 = a8;
  v26 = a5;
  v27 = a6;
  v25 = a4;
  v14 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for UserNotification.LocalizedContent(0);
  v18 = (uint64_t)a9 + *(int *)(v17 + 28);
  v19 = sub_249B95254();
  v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  result = v20(v18, 1, 1, v19);
  v22 = *(int *)(v17 + 32);
  *((_BYTE *)a9 + v22) = 2;
  *a9 = a1;
  a9[1] = a2;
  v23 = v25;
  a9[2] = a3;
  a9[3] = v23;
  v24 = v27;
  a9[4] = v26;
  a9[5] = v24;
  if (a7)
  {
    sub_249B95260();
    v20((uint64_t)v16, 0, 1, v19);
    result = sub_249B8D8AC((uint64_t)v16, v18, qword_2544C2660);
  }
  *((_BYTE *)a9 + v22) = v28;
  return result;
}

uint64_t UserNotification.LocalizedContent.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v29)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  char v39;
  char v40;

  v34 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
  MEMORY[0x24BDAC7A8](v4);
  v33 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C24D0);
  v36 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for UserNotification.LocalizedContent(0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_OWORD *)v11 + 1) = 0u;
  *((_OWORD *)v11 + 2) = 0u;
  *(_OWORD *)v11 = 0u;
  v12 = &v11[*(int *)(v9 + 28)];
  v13 = sub_249B95254();
  v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
  v35 = (uint64_t)v12;
  v14(v12, 1, 1, v13);
  v11[*(int *)(v8 + 32)] = 2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249B8D344();
  sub_249B956BC();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v29 = v14;
    v30 = v13;
    v31 = a1;
    v16 = v33;
    v15 = v34;
    v40 = 0;
    v17 = v32;
    v18 = v7;
    *(_QWORD *)v11 = sub_249B955B4();
    *((_QWORD *)v11 + 1) = v19;
    v20 = (uint64_t)v16;
    v39 = 1;
    v21 = sub_249B955B4();
    v22 = v36;
    *((_QWORD *)v11 + 2) = v21;
    *((_QWORD *)v11 + 3) = v23;
    v24 = v30;
    v38 = 2;
    v25 = v18;
    *((_QWORD *)v11 + 4) = sub_249B955B4();
    *((_QWORD *)v11 + 5) = v26;
    v27 = v35;
    v37 = 3;
    sub_249B80E4C(qword_2578C1AC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5D0]);
    sub_249B955CC();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v17);
    v29((char *)v20, 0, 1, v24);
    sub_249B8D8AC(v20, v27, qword_2544C2660);
    sub_249B8D250((uint64_t)v11, v15, type metadata accessor for UserNotification.LocalizedContent);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  }
  return sub_249B833D4((uint64_t)v11, type metadata accessor for UserNotification.LocalizedContent);
}

uint64_t UserNotification.LocalizedContent.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  char v25;
  char v26;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_249B95254();
  v21 = *(_QWORD *)(v8 - 8);
  v22 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v20 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C24E0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249B8D344();
  sub_249B956C8();
  if (!v3[1] || (v23 = 0, sub_249B95614(), !v2))
  {
    if (!v3[3] || (v24 = 1, sub_249B95614(), !v2))
    {
      if (!v3[5] || (v25 = 2, sub_249B95614(), !v2))
      {
        v14 = type metadata accessor for UserNotification.LocalizedContent(0);
        sub_249B8D868((uint64_t)v3 + *(int *)(v14 + 28), (uint64_t)v7, qword_2544C2660);
        v16 = v21;
        v15 = v22;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v7, 1, v22) == 1)
        {
          (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
          return sub_249B7E754((uint64_t)v7, qword_2544C2660);
        }
        v18 = v20;
        (*(void (**)(void))(v16 + 32))();
        v26 = 3;
        sub_249B80E4C(&qword_2578C1AB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5B8]);
        sub_249B9562C();
        (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      }
    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

void sub_249B87A00(char *a1)
{
  sub_249B81FD4(*a1);
}

void sub_249B87A0C()
{
  char *v0;

  sub_249B82220(*v0);
}

void sub_249B87A14()
{
  __asm { BR              X10 }
}

uint64_t sub_249B87A5C()
{
  sub_249B953D4();
  return swift_bridgeObjectRelease();
}

void sub_249B87AB8(uint64_t a1)
{
  char *v1;

  sub_249B822F8(a1, *v1);
}

uint64_t sub_249B87AC0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_249B94288();
  *a1 = result;
  return result;
}

uint64_t sub_249B87AF4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_249B87B30 + 4 * byte_249B977C6[*v0]))();
}

void sub_249B87B30(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x8000000249B997F0;
}

void sub_249B87B50(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
  a1[1] = 0xED000079646F4264;
}

void sub_249B87B68(_QWORD *a1@<X8>)
{
  *a1 = 0x7972616D6D7573;
  a1[1] = 0xE700000000000000;
}

uint64_t sub_249B87B84()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_249B87BC0 + 4 * byte_249B977CA[*v0]))(0x657A696C61636F6CLL, 0xEE00656C74695464);
}

unint64_t sub_249B87BC0()
{
  return 0xD000000000000011;
}

uint64_t sub_249B87BF0()
{
  return 0x7972616D6D7573;
}

uint64_t sub_249B87C08@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_249B94288();
  *a1 = result;
  return result;
}

uint64_t sub_249B87C34()
{
  sub_249B8D344();
  return sub_249B956D4();
}

uint64_t sub_249B87C5C()
{
  sub_249B8D344();
  return sub_249B956E0();
}

uint64_t UserNotification.LocalizedContent.hash(into:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v1 = sub_249B95254();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v0[1])
  {
    sub_249B956A4();
    swift_bridgeObjectRetain();
    sub_249B953D4();
    swift_bridgeObjectRelease();
    if (v0[3])
      goto LABEL_3;
LABEL_6:
    sub_249B956A4();
    if (v0[5])
      goto LABEL_4;
    goto LABEL_7;
  }
  sub_249B956A4();
  if (!v0[3])
    goto LABEL_6;
LABEL_3:
  sub_249B956A4();
  swift_bridgeObjectRetain();
  sub_249B953D4();
  swift_bridgeObjectRelease();
  if (v0[5])
  {
LABEL_4:
    sub_249B956A4();
    swift_bridgeObjectRetain();
    sub_249B953D4();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
LABEL_7:
  sub_249B956A4();
LABEL_8:
  v8 = type metadata accessor for UserNotification.LocalizedContent(0);
  sub_249B8D868((uint64_t)v0 + *(int *)(v8 + 28), (uint64_t)v7, qword_2544C2660);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) == 1)
  {
    sub_249B956A4();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_249B956A4();
    sub_249B80E4C(&qword_2578C24E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C0]);
    sub_249B9535C();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  if (*((_BYTE *)v0 + *(int *)(v8 + 32)) != 2)
    sub_249B956A4();
  return sub_249B956A4();
}

uint64_t UserNotification.LocalizedContent.hashValue.getter()
{
  return sub_249B87F0C((void (*)(_BYTE *))UserNotification.LocalizedContent.hash(into:));
}

uint64_t sub_249B87F0C(void (*a1)(_BYTE *))
{
  _BYTE v3[72];

  sub_249B9568C();
  a1(v3);
  return sub_249B956B0();
}

uint64_t sub_249B87F4C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return UserNotification.LocalizedContent.init(from:)(a1, a2);
}

uint64_t sub_249B87F60(_QWORD *a1)
{
  return UserNotification.LocalizedContent.encode(to:)(a1);
}

uint64_t sub_249B87F74(uint64_t a1, uint64_t a2)
{
  return sub_249B87F80(a1, a2, (void (*)(_BYTE *))UserNotification.LocalizedContent.hash(into:));
}

uint64_t sub_249B87F80(uint64_t a1, uint64_t a2, void (*a3)(_BYTE *))
{
  _BYTE v5[72];

  sub_249B9568C();
  a3(v5);
  return sub_249B956B0();
}

uint64_t sub_249B87FC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249B87FD0(a1, a2, a3, (void (*)(_BYTE *))UserNotification.LocalizedContent.hash(into:));
}

uint64_t sub_249B87FD0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_BYTE *))
{
  _BYTE v6[72];

  sub_249B9568C();
  a4(v6);
  return sub_249B956B0();
}

BOOL static UserNotification.IncomingPersistence.< infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

uint64_t sub_249B88024()
{
  sub_249B94BA4();
  return sub_249B954A0();
}

uint64_t sub_249B88080()
{
  sub_249B94BA4();
  return sub_249B95470();
}

BOOL sub_249B880CC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_249B880E0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_249B880F4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_249B88108(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

BOOL static UserNotification.IncomingPriority.< infix(_:_:)(char *a1, char *a2)
{
  return qword_249B99140[*a1] < qword_249B99140[*a2];
}

uint64_t UserNotification.IncomingPriority.rawValue.getter()
{
  char *v0;

  return qword_249B99140[*v0];
}

UserNotificationsServices::UserNotification::IncomingPriority_optional __swiftcall UserNotification.IncomingPriority.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  switch(rawValue)
  {
    case 300:
      *v1 = 2;
      break;
    case 301:
      *v1 = 3;
      break;
    case 302:
      *v1 = 4;
      break;
    case 303:
      *v1 = 5;
      break;
    case 304:
      *v1 = 6;
      break;
    default:
      if (rawValue == 200)
        v2 = 1;
      else
        v2 = 7;
      if (rawValue == 100)
        v2 = 0;
      *v1 = v2;
      break;
  }
  return (UserNotificationsServices::UserNotification::IncomingPriority_optional)rawValue;
}

BOOL sub_249B881D4(char *a1, char *a2)
{
  return qword_249B99140[*a1] == qword_249B99140[*a2];
}

UserNotificationsServices::UserNotification::IncomingPriority_optional sub_249B881F8(Swift::Int *a1)
{
  return UserNotification.IncomingPriority.init(rawValue:)(*a1);
}

void sub_249B88200(_QWORD *a1@<X8>)
{
  char *v1;

  *a1 = qword_249B99140[*v1];
}

uint64_t sub_249B88218()
{
  sub_249B9568C();
  sub_249B95698();
  return sub_249B956B0();
}

uint64_t sub_249B88264()
{
  return sub_249B95698();
}

uint64_t sub_249B88298()
{
  sub_249B9568C();
  sub_249B95698();
  return sub_249B956B0();
}

uint64_t sub_249B882E0()
{
  sub_249B94B60();
  return sub_249B954A0();
}

uint64_t sub_249B8833C()
{
  sub_249B94B60();
  return sub_249B95470();
}

BOOL sub_249B88388(char *a1, char *a2)
{
  return qword_249B99140[*a1] < qword_249B99140[*a2];
}

BOOL sub_249B883AC(char *a1, char *a2)
{
  return qword_249B99140[*a2] >= qword_249B99140[*a1];
}

BOOL sub_249B883D0(char *a1, char *a2)
{
  return qword_249B99140[*a1] >= qword_249B99140[*a2];
}

BOOL sub_249B883F4(char *a1, char *a2)
{
  return qword_249B99140[*a2] < qword_249B99140[*a1];
}

uint64_t sub_249B88418@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_249B88444(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_249B88450()
{
  sub_249B8D7AC();
  return sub_249B956D4();
}

uint64_t sub_249B88478()
{
  sub_249B8D7AC();
  return sub_249B956E0();
}

uint64_t UserNotification.SecureAttachments.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C24F0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249B8D7AC();
  sub_249B956C8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t UserNotification.SecureAttachments.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_249B88588(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_249B885AC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C24F0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249B8D7AC();
  sub_249B956C8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

UserNotificationsServices::UserNotification::Origin_optional __swiftcall UserNotification.Origin.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 6;
  if ((unint64_t)rawValue < 6)
    v2 = rawValue;
  *v1 = v2;
  return (UserNotificationsServices::UserNotification::Origin_optional)rawValue;
}

UserNotificationsServices::UserNotification::Origin_optional sub_249B88684(Swift::Int *a1)
{
  return UserNotification.Origin.init(rawValue:)(*a1);
}

uint64_t sub_249B8868C()
{
  sub_249B94B1C();
  return sub_249B954A0();
}

uint64_t sub_249B886E8()
{
  sub_249B94B1C();
  return sub_249B95470();
}

uint64_t UserNotification.LegacyContent.category.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  __int16 v8;

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 42);
  v8 = *(_WORD *)(v1 + 40);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_BYTE *)(a1 + 42) = v7;
  *(_WORD *)(a1 + 40) = v8;
  return sub_249B8D7F0(v2, v3);
}

__n128 UserNotification.LegacyContent.category.setter(__n128 *a1)
{
  __n128 *v1;
  unint64_t v2;
  unsigned __int16 v3;
  unsigned __int8 v4;
  __n128 result;
  __n128 v6;
  __n128 v7;

  v6 = a1[1];
  v7 = *a1;
  v2 = a1[2].n128_u64[0];
  v3 = a1[2].n128_u16[4];
  v4 = a1[2].n128_u8[10];
  sub_249B8D82C(v1->n128_u64[0], v1->n128_i64[1]);
  result = v6;
  *v1 = v7;
  v1[1] = v6;
  v1[2].n128_u64[0] = v2;
  v1[2].n128_u8[10] = v4;
  v1[2].n128_u16[4] = v3;
  return result;
}

uint64_t (*UserNotification.LegacyContent.category.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyContent.eventDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UserNotification.LegacyContent(0);
  return sub_249B8D868(v1 + *(int *)(v3 + 20), a1, &qword_2578C2500);
}

uint64_t UserNotification.LegacyContent.eventDate.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UserNotification.LegacyContent(0);
  return sub_249B8D8AC(a1, v1 + *(int *)(v3 + 20), &qword_2578C2500);
}

uint64_t (*UserNotification.LegacyContent.eventDate.modify())()
{
  type metadata accessor for UserNotification.LegacyContent(0);
  return nullsub_1;
}

uint64_t UserNotification.LegacyContent.duration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UserNotification.LegacyContent(0);
  return sub_249B8D868(v1 + *(int *)(v3 + 24), a1, &qword_2578C2508);
}

uint64_t UserNotification.LegacyContent.duration.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UserNotification.LegacyContent(0);
  return sub_249B8D8AC(a1, v1 + *(int *)(v3 + 24), &qword_2578C2508);
}

uint64_t (*UserNotification.LegacyContent.duration.modify())()
{
  type metadata accessor for UserNotification.LegacyContent(0);
  return nullsub_1;
}

uint64_t UserNotification.LegacyContent.isAllDayEvent.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for UserNotification.LegacyContent(0) + 28));
}

uint64_t UserNotification.LegacyContent.isAllDayEvent.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for UserNotification.LegacyContent(0);
  *(_BYTE *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*UserNotification.LegacyContent.isAllDayEvent.modify())()
{
  type metadata accessor for UserNotification.LegacyContent(0);
  return nullsub_1;
}

uint64_t UserNotification.LegacyContent.dismissAfterDuration.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for UserNotification.LegacyContent(0) + 32));
}

uint64_t UserNotification.LegacyContent.dismissAfterDuration.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for UserNotification.LegacyContent(0);
  *(_BYTE *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*UserNotification.LegacyContent.dismissAfterDuration.modify())()
{
  type metadata accessor for UserNotification.LegacyContent(0);
  return nullsub_1;
}

UserNotificationsServices::UserNotification::LegacyContent::IdentityImageStyle_optional __swiftcall UserNotification.LegacyContent.IdentityImageStyle.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3)
    v2 = rawValue;
  *v1 = v2;
  return (UserNotificationsServices::UserNotification::LegacyContent::IdentityImageStyle_optional)rawValue;
}

UserNotificationsServices::UserNotification::LegacyContent::IdentityImageStyle_optional sub_249B88A30(Swift::Int *a1)
{
  return UserNotification.LegacyContent.IdentityImageStyle.init(rawValue:)(*a1);
}

uint64_t sub_249B88A38()
{
  sub_249B94AD8();
  return sub_249B954A0();
}

uint64_t sub_249B88A94()
{
  sub_249B94AD8();
  return sub_249B95470();
}

uint64_t UserNotification.LegacyContent.init()@<X0>(_OWORD *a1@<X8>)
{
  int *v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;

  v2 = (int *)type metadata accessor for UserNotification.LegacyContent(0);
  *a1 = 0u;
  a1[1] = 0u;
  *(_OWORD *)((char *)a1 + 27) = 0u;
  v3 = (char *)a1 + v2[5];
  v4 = sub_249B952B4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = (char *)a1 + v2[6];
  v6 = sub_249B95248();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((_BYTE *)a1 + v2[7]) = 0;
  *((_BYTE *)a1 + v2[8]) = 0;
  return result;
}

uint64_t UserNotification.LegacyContent.isEmpty.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t (*v20)(_QWORD);
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  char v25;
  char v26;
  uint64_t v28;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (int *)type metadata accessor for UserNotification.LegacyContent(0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v28 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v28 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v28 - v17;
  v19 = *(_QWORD *)(v0 + 8);
  sub_249B8D250(v0, (uint64_t)&v28 - v17, v20);
  if (v19)
  {
    sub_249B833D4((uint64_t)v18, type metadata accessor for UserNotification.LegacyContent);
    sub_249B8D250(v0, (uint64_t)v16, type metadata accessor for UserNotification.LegacyContent);
LABEL_7:
    sub_249B833D4((uint64_t)v16, type metadata accessor for UserNotification.LegacyContent);
    sub_249B8D250(v0, (uint64_t)v13, type metadata accessor for UserNotification.LegacyContent);
    goto LABEL_8;
  }
  sub_249B8D868((uint64_t)&v18[v7[5]], (uint64_t)v6, &qword_2578C2500);
  sub_249B833D4((uint64_t)v18, type metadata accessor for UserNotification.LegacyContent);
  v21 = sub_249B952B4();
  v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 48))(v6, 1, v21);
  sub_249B7E754((uint64_t)v6, &qword_2578C2500);
  sub_249B8D250(v0, (uint64_t)v16, type metadata accessor for UserNotification.LegacyContent);
  if (v22 != 1)
    goto LABEL_7;
  sub_249B8D868((uint64_t)&v16[v7[6]], (uint64_t)v3, &qword_2578C2508);
  sub_249B833D4((uint64_t)v16, type metadata accessor for UserNotification.LegacyContent);
  v23 = sub_249B95248();
  v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 48))(v3, 1, v23);
  sub_249B7E754((uint64_t)v3, &qword_2578C2508);
  sub_249B8D250(v0, (uint64_t)v13, type metadata accessor for UserNotification.LegacyContent);
  if (v24 != 1)
  {
LABEL_8:
    sub_249B833D4((uint64_t)v13, type metadata accessor for UserNotification.LegacyContent);
    sub_249B8D250(v0, (uint64_t)v10, type metadata accessor for UserNotification.LegacyContent);
    goto LABEL_9;
  }
  v25 = v13[v7[7]];
  sub_249B833D4((uint64_t)v13, type metadata accessor for UserNotification.LegacyContent);
  sub_249B8D250(v0, (uint64_t)v10, type metadata accessor for UserNotification.LegacyContent);
  if ((v25 & 1) != 0)
  {
LABEL_9:
    v26 = 0;
    goto LABEL_10;
  }
  v26 = v10[v7[8]] ^ 1;
LABEL_10:
  sub_249B833D4((uint64_t)v10, type metadata accessor for UserNotification.LegacyContent);
  return v26 & 1;
}

uint64_t UserNotification.LegacyContent.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
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
  char *v14;
  uint64_t v15;
  char v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int16 v29;
  char v30;

  v3 = sub_249B95248();
  v24 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v23 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_249B952B4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v1[1];
  if (v15)
  {
    v16 = *((_BYTE *)v1 + 42);
    v17 = *((_WORD *)v1 + 20);
    v18 = v1[2];
    v25 = *v1;
    v26 = v15;
    v27 = v18;
    v28 = *(_OWORD *)(v1 + 3);
    v29 = v17 & 0x101;
    v30 = v16 & 1;
    sub_249B956A4();
    UserNotification.LegacyCategory.hash(into:)(a1);
  }
  else
  {
    sub_249B956A4();
  }
  v19 = type metadata accessor for UserNotification.LegacyContent(0);
  sub_249B8D868((uint64_t)v1 + *(int *)(v19 + 20), (uint64_t)v14, &qword_2578C2500);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8) == 1)
  {
    sub_249B956A4();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v14, v8);
    sub_249B956A4();
    sub_249B80E4C(&qword_2578C2480, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    sub_249B9535C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  v20 = v24;
  sub_249B8D868((uint64_t)v1 + *(int *)(v19 + 24), (uint64_t)v7, &qword_2578C2508);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v7, 1, v3) == 1)
  {
    sub_249B956A4();
  }
  else
  {
    v21 = v23;
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v23, v7, v3);
    sub_249B956A4();
    sub_249B80E4C(&qword_2578C2510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE08]);
    sub_249B9535C();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v3);
  }
  sub_249B956A4();
  return sub_249B956A4();
}

uint64_t sub_249B891A8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_249B891D8 + 4 * byte_249B977D3[*v0]))(0x79726F6765746163, 0xE800000000000000);
}

uint64_t sub_249B891D8()
{
  return 0x746144746E657665;
}

uint64_t sub_249B891F4()
{
  return 0x6E6F697461727564;
}

uint64_t sub_249B89208()
{
  return 0x7961446C6C417369;
}

unint64_t sub_249B8922C()
{
  return 0xD000000000000014;
}

uint64_t sub_249B89248@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_249B942CC(a1, a2);
  *a3 = result;
  return result;
}

void sub_249B8926C(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_249B89278()
{
  sub_249B8E128();
  return sub_249B956D4();
}

uint64_t sub_249B892A0()
{
  sub_249B8E128();
  return sub_249B956E0();
}

uint64_t UserNotification.LegacyContent.encode(to:)(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v2;
  __int128 *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  __int16 v10;
  char v11;
  __int128 v12;
  _BYTE v14[16];
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int16 v18;
  char v19;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2518);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249B8E128();
  sub_249B956C8();
  v9 = *((_QWORD *)v3 + 4);
  v10 = *((_WORD *)v3 + 20);
  v11 = *((_BYTE *)v3 + 42);
  v12 = v3[1];
  v15 = *v3;
  v16 = v12;
  v17 = v9;
  v19 = v11;
  v18 = v10;
  v14[15] = 0;
  sub_249B8E16C();
  sub_249B95608();
  if (!v2)
  {
    type metadata accessor for UserNotification.LegacyContent(0);
    LOBYTE(v15) = 1;
    sub_249B952B4();
    sub_249B80E4C(&qword_2578C2498, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_249B95608();
    LOBYTE(v15) = 2;
    sub_249B95248();
    sub_249B80E4C(&qword_2578C2530, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE00]);
    sub_249B95608();
    LOBYTE(v15) = 3;
    sub_249B95620();
    LOBYTE(v15) = 4;
    sub_249B95620();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t UserNotification.LegacyContent.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
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
  char v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[4];
  __int128 v22;
  __int16 v23;
  char v24;
  _BYTE v25[72];

  v1 = sub_249B95248();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v21[0] = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_249B952B4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249B9568C();
  v14 = *(_QWORD *)(v0 + 8);
  if (v14)
  {
    v15 = *(_BYTE *)(v0 + 42);
    v16 = *(_WORD *)(v0 + 40);
    v17 = *(_QWORD *)(v0 + 16);
    v21[1] = *(_QWORD *)v0;
    v21[2] = v14;
    v21[3] = v17;
    v22 = *(_OWORD *)(v0 + 24);
    v23 = v16 & 0x101;
    v24 = v15 & 1;
    sub_249B956A4();
    UserNotification.LegacyCategory.hash(into:)((uint64_t)v25);
  }
  else
  {
    sub_249B956A4();
  }
  v18 = type metadata accessor for UserNotification.LegacyContent(0);
  sub_249B8D868(v0 + *(int *)(v18 + 20), (uint64_t)v13, &qword_2578C2500);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7) == 1)
  {
    sub_249B956A4();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v13, v7);
    sub_249B956A4();
    sub_249B80E4C(&qword_2578C2480, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    sub_249B9535C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  sub_249B8D868(v0 + *(int *)(v18 + 24), (uint64_t)v6, &qword_2578C2508);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v6, 1, v1) == 1)
  {
    sub_249B956A4();
  }
  else
  {
    v19 = v21[0];
    (*(void (**)(_QWORD, char *, uint64_t))(v2 + 32))(v21[0], v6, v1);
    sub_249B956A4();
    sub_249B80E4C(&qword_2578C2510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE08]);
    sub_249B9535C();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v19, v1);
  }
  sub_249B956A4();
  sub_249B956A4();
  return sub_249B956B0();
}

uint64_t UserNotification.LegacyContent.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t, uint64_t);
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
  __int16 v29;
  char v30;
  __int128 v31;
  _OWORD *v32;
  char *v34;
  char v35;
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
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  _QWORD *v50;
  uint64_t v51;
  _OWORD *v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  __int16 v56;
  char v57;
  char v58;

  v42 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
  MEMORY[0x24BDAC7A8](v3);
  v47 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
  MEMORY[0x24BDAC7A8](v5);
  v46 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2538);
  v45 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (int *)type metadata accessor for UserNotification.LegacyContent(0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (_OWORD *)((char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(_OWORD *)((char *)v12 + 27) = 0u;
  *v12 = 0u;
  v12[1] = 0u;
  v13 = (char *)v12 + *(int *)(v10 + 20);
  v14 = sub_249B952B4();
  v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
  v44 = (uint64_t)v13;
  v15(v13, 1, 1, v14);
  v16 = (uint64_t)v12 + v9[6];
  v17 = sub_249B95248();
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v43 = v16;
  v18(v16, 1, 1, v17);
  v19 = v9[7];
  *((_BYTE *)v12 + v19) = 0;
  v20 = v9[8];
  v52 = v12;
  *((_BYTE *)v12 + v20) = 0;
  v21 = a1[3];
  v50 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v21);
  sub_249B8E128();
  v49 = v8;
  v22 = v51;
  sub_249B956BC();
  if (v22)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
    v38 = (uint64_t)v52;
  }
  else
  {
    v51 = v17;
    v40 = v20;
    v41 = v19;
    v23 = (uint64_t)v46;
    v24 = (uint64_t)v47;
    v25 = v44;
    v26 = v45;
    v58 = 0;
    sub_249B8E1B0();
    v27 = v48;
    sub_249B955A8();
    v28 = v55;
    v29 = v56;
    v30 = v57;
    v31 = v54;
    v32 = v52;
    *v52 = v53;
    v32[1] = v31;
    *((_QWORD *)v32 + 4) = v28;
    *((_BYTE *)v32 + 42) = v30;
    *((_WORD *)v32 + 20) = v29;
    LOBYTE(v53) = 1;
    sub_249B80E4C(&qword_2578C24A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    sub_249B955A8();
    sub_249B8D8AC(v23, v25, &qword_2578C2500);
    LOBYTE(v53) = 2;
    sub_249B80E4C(&qword_2578C2548, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE20]);
    sub_249B955A8();
    sub_249B8D8AC(v24, v43, &qword_2578C2508);
    LOBYTE(v53) = 3;
    v34 = v49;
    *((_BYTE *)v52 + v41) = sub_249B955C0() & 1;
    LOBYTE(v53) = 4;
    v35 = sub_249B955C0();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v34, v27);
    v36 = (uint64_t)v50;
    v37 = (uint64_t)v52;
    *((_BYTE *)v52 + v40) = v35 & 1;
    sub_249B8D250(v37, v42, type metadata accessor for UserNotification.LegacyContent);
    __swift_destroy_boxed_opaque_existential_1(v36);
    v38 = v37;
  }
  return sub_249B833D4(v38, type metadata accessor for UserNotification.LegacyContent);
}

uint64_t sub_249B89C40(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
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
  char v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int16 v30;
  char v31;

  v5 = sub_249B95248();
  v25 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v24 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_249B952B4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = v2[1];
  if (v17)
  {
    v18 = *((_BYTE *)v2 + 42);
    v19 = *((_WORD *)v2 + 20);
    v20 = v2[2];
    v26 = *v2;
    v27 = v17;
    v28 = v20;
    v29 = *(_OWORD *)(v2 + 3);
    v30 = v19 & 0x101;
    v31 = v18 & 1;
    sub_249B956A4();
    UserNotification.LegacyCategory.hash(into:)(a1);
  }
  else
  {
    sub_249B956A4();
  }
  sub_249B8D868((uint64_t)v2 + *(int *)(a2 + 20), (uint64_t)v16, &qword_2578C2500);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v16, 1, v10) == 1)
  {
    sub_249B956A4();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v16, v10);
    sub_249B956A4();
    sub_249B80E4C(&qword_2578C2480, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    sub_249B9535C();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  v21 = v25;
  sub_249B8D868((uint64_t)v2 + *(int *)(a2 + 24), (uint64_t)v9, &qword_2578C2508);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v9, 1, v5) == 1)
  {
    sub_249B956A4();
  }
  else
  {
    v22 = v24;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v24, v9, v5);
    sub_249B956A4();
    sub_249B80E4C(&qword_2578C2510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE08]);
    sub_249B9535C();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v22, v5);
  }
  sub_249B956A4();
  return sub_249B956A4();
}

uint64_t sub_249B89F48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
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
  char v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[4];
  __int128 v24;
  __int16 v25;
  char v26;
  _BYTE v27[72];

  v4 = sub_249B95248();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v23[0] = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_249B952B4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249B9568C();
  v17 = *(_QWORD *)(v2 + 8);
  if (v17)
  {
    v18 = *(_BYTE *)(v2 + 42);
    v19 = *(_WORD *)(v2 + 40);
    v20 = *(_QWORD *)(v2 + 16);
    v23[1] = *(_QWORD *)v2;
    v23[2] = v17;
    v23[3] = v20;
    v24 = *(_OWORD *)(v2 + 24);
    v25 = v19 & 0x101;
    v26 = v18 & 1;
    sub_249B956A4();
    UserNotification.LegacyCategory.hash(into:)((uint64_t)v27);
  }
  else
  {
    sub_249B956A4();
  }
  sub_249B8D868(v2 + *(int *)(a2 + 20), (uint64_t)v16, &qword_2578C2500);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v16, 1, v10) == 1)
  {
    sub_249B956A4();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v16, v10);
    sub_249B956A4();
    sub_249B80E4C(&qword_2578C2480, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    sub_249B9535C();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  sub_249B8D868(v2 + *(int *)(a2 + 24), (uint64_t)v9, &qword_2578C2508);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v9, 1, v4) == 1)
  {
    sub_249B956A4();
  }
  else
  {
    v21 = v23[0];
    (*(void (**)(_QWORD, char *, uint64_t))(v5 + 32))(v23[0], v9, v4);
    sub_249B956A4();
    sub_249B80E4C(&qword_2578C2510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE08]);
    sub_249B9535C();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v21, v4);
  }
  sub_249B956A4();
  sub_249B956A4();
  return sub_249B956B0();
}

uint64_t sub_249B8A258@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return UserNotification.LegacyContent.init(from:)(a1, a2);
}

uint64_t sub_249B8A26C(_QWORD *a1)
{
  return UserNotification.LegacyContent.encode(to:)(a1);
}

uint64_t UserNotification.LegacyCategory.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserNotification.LegacyCategory.identifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*UserNotification.LegacyCategory.identifier.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyCategory.actions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t UserNotification.LegacyCategory.actions.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*UserNotification.LegacyCategory.actions.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyCategory.actionsMenuTitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserNotification.LegacyCategory.actionsMenuTitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t (*UserNotification.LegacyCategory.actionsMenuTitle.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyCategory.showButtonsOnBanner.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t UserNotification.LegacyCategory.showButtonsOnBanner.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 40) = result;
  return result;
}

uint64_t (*UserNotification.LegacyCategory.showButtonsOnBanner.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyCategory.lockScreenOnly.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 41);
}

uint64_t UserNotification.LegacyCategory.lockScreenOnly.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 41) = result;
  return result;
}

uint64_t (*UserNotification.LegacyCategory.lockScreenOnly.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyCategory.alwaysShowAlternateActionMenu.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 42);
}

uint64_t UserNotification.LegacyCategory.alwaysShowAlternateActionMenu.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 42) = result;
  return result;
}

uint64_t (*UserNotification.LegacyCategory.alwaysShowAlternateActionMenu.modify())()
{
  return nullsub_1;
}

void __swiftcall UserNotification.LegacyCategory.init(identifier:)(UserNotificationsServices::UserNotification::LegacyCategory *__return_ptr retstr, Swift::String identifier)
{
  void *v2;

  retstr->identifier = identifier;
  v2 = (void *)MEMORY[0x24BEE4AF8];
  retstr->actionsMenuTitle.value._countAndFlagsBits = 0;
  retstr->actionsMenuTitle.value._object = 0;
  retstr->actions._rawValue = v2;
  *(_DWORD *)((char *)&retstr->actionsMenuTitle.value._object + 7) = 0;
}

uint64_t UserNotification.LegacyCategory.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(_QWORD *)(v2 + 32);
  swift_bridgeObjectRetain();
  sub_249B953D4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_249B8C700(a1, v4);
  swift_bridgeObjectRelease();
  sub_249B956A4();
  if (v5)
  {
    swift_bridgeObjectRetain();
    sub_249B953D4();
    swift_bridgeObjectRelease();
  }
  sub_249B956A4();
  sub_249B956A4();
  return sub_249B956A4();
}

uint64_t sub_249B8A508(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_249B8A540 + 4 * byte_249B977D8[a1]))(0x696669746E656469, 0xEA00000000007265);
}

uint64_t sub_249B8A540()
{
  return 0x736E6F69746361;
}

unint64_t sub_249B8A558()
{
  return 0xD000000000000010;
}

unint64_t sub_249B8A574()
{
  return 0xD000000000000013;
}

uint64_t sub_249B8A5D4()
{
  unsigned __int8 *v0;

  return sub_249B8A508(*v0);
}

uint64_t sub_249B8A5DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_249B94514(a1, a2);
  *a3 = result;
  return result;
}

void sub_249B8A600(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_249B8A60C()
{
  sub_249B8E1F4();
  return sub_249B956D4();
}

uint64_t sub_249B8A634()
{
  sub_249B8E1F4();
  return sub_249B956E0();
}

uint64_t UserNotification.LegacyCategory.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD v10[6];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2550);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v12 = *(_QWORD *)(v1 + 24);
  v13 = v7;
  v11 = *(_QWORD *)(v1 + 32);
  LODWORD(v7) = *(unsigned __int8 *)(v1 + 40);
  v10[4] = *(unsigned __int8 *)(v1 + 41);
  v10[5] = v7;
  v10[3] = *(unsigned __int8 *)(v1 + 42);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249B8E1F4();
  sub_249B956C8();
  v21 = 0;
  v8 = v14;
  sub_249B95614();
  if (!v8)
  {
    v15 = v13;
    v20 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2560);
    sub_249B8E27C(&qword_2578C2568, (uint64_t (*)(void))sub_249B8E238, MEMORY[0x24BEE12A0]);
    sub_249B9562C();
    v19 = 2;
    sub_249B955FC();
    v18 = 3;
    sub_249B95620();
    v17 = 4;
    sub_249B95620();
    v16 = 5;
    sub_249B95620();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t UserNotification.LegacyCategory.hashValue.getter()
{
  uint64_t *v0;
  char v1;
  char v2;
  char v3;
  _BYTE v5[72];
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  char v9;
  char v10;
  char v11;

  v1 = *((_BYTE *)v0 + 40);
  v2 = *((_BYTE *)v0 + 41);
  v3 = *((_BYTE *)v0 + 42);
  v6 = *v0;
  v7 = *(_OWORD *)(v0 + 1);
  v8 = *(_OWORD *)(v0 + 3);
  v9 = v1;
  v10 = v2;
  v11 = v3;
  sub_249B9568C();
  UserNotification.LegacyCategory.hash(into:)((uint64_t)v5);
  return sub_249B956B0();
}

uint64_t UserNotification.LegacyCategory.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2578);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249B8E1F4();
  sub_249B956BC();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v32 = 0;
    v10 = sub_249B955B4();
    v12 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2560);
    v31 = 1;
    sub_249B8E27C(&qword_2578C2580, (uint64_t (*)(void))sub_249B8E2E4, MEMORY[0x24BEE12D0]);
    swift_bridgeObjectRetain();
    sub_249B955CC();
    v24 = v10;
    v25 = a2;
    v13 = v26;
    v30 = 2;
    swift_bridgeObjectRetain();
    v14 = sub_249B9559C();
    v16 = v15;
    v23 = v14;
    v29 = 3;
    swift_bridgeObjectRetain();
    v22 = sub_249B955C0();
    v28 = 4;
    v21 = sub_249B955C0();
    v27 = 5;
    v17 = sub_249B955C0();
    v21 &= 1u;
    v22 &= 1u;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v18 = v25;
    *v25 = v24;
    v18[1] = v12;
    v19 = v23;
    v18[2] = v13;
    v18[3] = v19;
    v18[4] = v16;
    *((_BYTE *)v18 + 40) = v22;
    *((_BYTE *)v18 + 41) = v21;
    *((_BYTE *)v18 + 42) = v17 & 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_249B8AC4C()
{
  uint64_t *v0;
  char v1;
  char v2;
  char v3;
  _BYTE v5[72];
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  char v9;
  char v10;
  char v11;

  v1 = *((_BYTE *)v0 + 40);
  v2 = *((_BYTE *)v0 + 41);
  v3 = *((_BYTE *)v0 + 42);
  v6 = *v0;
  v7 = *(_OWORD *)(v0 + 1);
  v8 = *(_OWORD *)(v0 + 3);
  v9 = v1;
  v10 = v2;
  v11 = v3;
  sub_249B9568C();
  UserNotification.LegacyCategory.hash(into:)((uint64_t)v5);
  return sub_249B956B0();
}

uint64_t sub_249B8ACC0()
{
  uint64_t *v0;
  char v1;
  char v2;
  char v3;
  _BYTE v5[72];
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  char v9;
  char v10;
  char v11;

  v1 = *((_BYTE *)v0 + 40);
  v2 = *((_BYTE *)v0 + 41);
  v3 = *((_BYTE *)v0 + 42);
  v6 = *v0;
  v7 = *(_OWORD *)(v0 + 1);
  v8 = *(_OWORD *)(v0 + 3);
  v9 = v1;
  v10 = v2;
  v11 = v3;
  sub_249B9568C();
  UserNotification.LegacyCategory.hash(into:)((uint64_t)v5);
  return sub_249B956B0();
}

uint64_t sub_249B8AD2C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return UserNotification.LegacyCategory.init(from:)(a1, a2);
}

uint64_t sub_249B8AD40(_QWORD *a1)
{
  return UserNotification.LegacyCategory.encode(to:)(a1);
}

uint64_t UserNotification.LegacyAction.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserNotification.LegacyAction.identifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*UserNotification.LegacyAction.identifier.modify())()
{
  return nullsub_1;
}

void UserNotification.LegacyAction.style.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

_BYTE *UserNotification.LegacyAction.style.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = *result;
  return result;
}

uint64_t (*UserNotification.LegacyAction.style.modify())()
{
  return nullsub_1;
}

void UserNotification.LegacyAction.actionType.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 17);
}

_BYTE *UserNotification.LegacyAction.actionType.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 17) = *result;
  return result;
}

uint64_t (*UserNotification.LegacyAction.actionType.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyAction.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserNotification.LegacyAction.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t (*UserNotification.LegacyAction.title.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyAction.textPlaceholder.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t UserNotification.LegacyAction.textPlaceholder.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return result;
}

uint64_t (*UserNotification.LegacyAction.textPlaceholder.modify())()
{
  return nullsub_1;
}

uint64_t UserNotification.LegacyAction.substituteEmojiInTextInput.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t UserNotification.LegacyAction.substituteEmojiInTextInput.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 56) = result;
  return result;
}

uint64_t (*UserNotification.LegacyAction.substituteEmojiInTextInput.modify())()
{
  return nullsub_1;
}

UserNotificationsServices::UserNotification::LegacyAction::Style_optional __swiftcall UserNotification.LegacyAction.Style.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (UserNotificationsServices::UserNotification::LegacyAction::Style_optional)rawValue;
}

uint64_t UserNotification.LegacyAction.Style.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_249B8AF3C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

_QWORD *sub_249B8AF54@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_249B8AF74(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_249B8AF80()
{
  sub_249B9568C();
  sub_249B95698();
  return sub_249B956B0();
}

uint64_t sub_249B8AFC4()
{
  sub_249B9568C();
  sub_249B95698();
  return sub_249B956B0();
}

uint64_t sub_249B8B004()
{
  sub_249B94A94();
  return sub_249B954A0();
}

uint64_t sub_249B8B060()
{
  sub_249B94A94();
  return sub_249B95470();
}

UserNotificationsServices::UserNotification::LegacyAction::ActionType_optional __swiftcall UserNotification.LegacyAction.ActionType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 5;
  if ((unint64_t)rawValue < 5)
    v2 = rawValue;
  *v1 = v2;
  return (UserNotificationsServices::UserNotification::LegacyAction::ActionType_optional)rawValue;
}

uint64_t UserNotification.LegacyAction.ActionType.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

UserNotificationsServices::UserNotification::LegacyAction::ActionType_optional sub_249B8B0C8(Swift::Int *a1)
{
  return UserNotification.LegacyAction.ActionType.init(rawValue:)(*a1);
}

uint64_t sub_249B8B0D0()
{
  sub_249B94A50();
  return sub_249B954A0();
}

uint64_t sub_249B8B12C()
{
  sub_249B94A50();
  return sub_249B95470();
}

void __swiftcall UserNotification.LegacyAction.init(identifier:)(UserNotificationsServices::UserNotification::LegacyAction *__return_ptr retstr, Swift::String identifier)
{
  retstr->identifier = identifier;
  *(_WORD *)&retstr->style = 0;
  retstr->title = 0u;
  retstr->textPlaceholder = 0u;
  retstr->substituteEmojiInTextInput = 0;
}

uint64_t UserNotification.LegacyAction.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  sub_249B953D4();
  swift_bridgeObjectRelease();
  sub_249B95698();
  sub_249B95698();
  if (!v1)
  {
    sub_249B956A4();
    if (v2)
      goto LABEL_3;
LABEL_5:
    sub_249B956A4();
    return sub_249B956A4();
  }
  sub_249B956A4();
  swift_bridgeObjectRetain();
  sub_249B953D4();
  swift_bridgeObjectRelease();
  if (!v2)
    goto LABEL_5;
LABEL_3:
  sub_249B956A4();
  swift_bridgeObjectRetain();
  sub_249B953D4();
  swift_bridgeObjectRelease();
  return sub_249B956A4();
}

uint64_t sub_249B8B298()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_249B8B2D0 + 4 * byte_249B977DE[*v0]))(0x696669746E656469, 0xEA00000000007265);
}

uint64_t sub_249B8B2D0()
{
  return 0x656C797473;
}

uint64_t sub_249B8B2E4()
{
  return 0x79546E6F69746361;
}

uint64_t sub_249B8B300()
{
  return 0x656C746974;
}

uint64_t sub_249B8B314()
{
  return 0x63616C5074786574;
}

unint64_t sub_249B8B338()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_249B8B354@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_249B947AC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_249B8B378()
{
  sub_249B8E328();
  return sub_249B956D4();
}

uint64_t sub_249B8B3A0()
{
  sub_249B8E328();
  return sub_249B956E0();
}

uint64_t UserNotification.LegacyAction.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _DWORD v13[4];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2590);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(unsigned __int8 *)(v1 + 16);
  v18 = *(unsigned __int8 *)(v1 + 17);
  v19 = v7;
  v8 = *(_QWORD *)(v1 + 24);
  v16 = *(_QWORD *)(v1 + 32);
  v17 = v8;
  v9 = *(_QWORD *)(v1 + 48);
  v14 = *(_QWORD *)(v1 + 40);
  v15 = v9;
  v13[3] = *(unsigned __int8 *)(v1 + 56);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249B8E328();
  sub_249B956C8();
  v28 = 0;
  v10 = v20;
  sub_249B95614();
  if (!v10)
  {
    v11 = v18;
    v27 = v19;
    v26 = 1;
    sub_249B8E36C();
    sub_249B9562C();
    v25 = v11;
    v24 = 2;
    sub_249B8E3B0();
    sub_249B9562C();
    v23 = 3;
    sub_249B955FC();
    v22 = 4;
    sub_249B955FC();
    v21 = 5;
    sub_249B95620();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t UserNotification.LegacyAction.hashValue.getter()
{
  sub_249B9568C();
  UserNotification.LegacyAction.hash(into:)();
  return sub_249B956B0();
}

uint64_t UserNotification.LegacyAction.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  int v24;
  uint64_t v25;
  int v26;
  char v27;
  char v28;
  char v29;
  char v30;
  unsigned __int8 v31;
  char v32;
  unsigned __int8 v33;
  char v34;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C25B0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249B8E328();
  sub_249B956BC();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v34 = 0;
    v10 = sub_249B955B4();
    v12 = v11;
    v32 = 1;
    sub_249B8E3F4();
    swift_bridgeObjectRetain();
    sub_249B955CC();
    v26 = v33;
    v30 = 2;
    sub_249B8E438();
    sub_249B955CC();
    v25 = v10;
    v24 = v31;
    v29 = 3;
    v13 = sub_249B9559C();
    v15 = v14;
    v22 = v13;
    v23 = a2;
    v28 = 4;
    swift_bridgeObjectRetain();
    v16 = sub_249B9559C();
    v18 = v17;
    v21 = v16;
    v27 = 5;
    swift_bridgeObjectRetain();
    v19 = sub_249B955C0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v20 = v23;
    *v23 = v25;
    v20[1] = v12;
    *((_BYTE *)v20 + 16) = v26;
    *((_BYTE *)v20 + 17) = v24;
    v20[3] = v22;
    v20[4] = v15;
    v20[5] = v21;
    v20[6] = v18;
    *((_BYTE *)v20 + 56) = v19 & 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_249B8B990()
{
  sub_249B9568C();
  UserNotification.LegacyAction.hash(into:)();
  return sub_249B956B0();
}

uint64_t sub_249B8BA04()
{
  sub_249B9568C();
  UserNotification.LegacyAction.hash(into:)();
  return sub_249B956B0();
}

uint64_t sub_249B8BA70@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return UserNotification.LegacyAction.init(from:)(a1, a2);
}

uint64_t sub_249B8BA84(_QWORD *a1)
{
  return UserNotification.LegacyAction.encode(to:)(a1);
}

char *sub_249B8BA9C(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  unint64_t v44;
  _QWORD v46[4];

  v46[3] = a4;
  if (a1 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v11 = a5;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = MEMORY[0x24BEE4AF8];
  v43 = swift_allocObject();
  *(_QWORD *)(v43 + 16) = 15;
  v15 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v16 = HIBYTE(a6) & 0xF) : (v16 = v11 & 0xFFFFFFFFFFFFLL), !v16))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v15 = v11 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((v11 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_249B8BEB4(v30 | (v15 << 16), v43, a2 & 1, v14);
    swift_bridgeObjectRelease();
    v10 = *(char **)(v14 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_38;
  }
  v38 = a1;
  v39 = v14;
  v44 = 4 * v16;
  v10 = (char *)MEMORY[0x24BEE4AF8];
  v9 = 15;
  v8 = 15;
  v17 = 15;
  while (1)
  {
    v46[0] = sub_249B95434();
    v46[1] = v18;
    v19 = a3(v46);
    if (v7)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10;
    }
    v6 = v19;
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      break;
    v9 = sub_249B953EC();
LABEL_9:
    if (v44 == v9 >> 14)
      goto LABEL_29;
  }
  if (v8 >> 14 == v9 >> 14 && (a2 & 1) != 0)
  {
    v9 = sub_249B953EC();
    *(_QWORD *)(v43 + 16) = v9;
    v8 = v9;
    v17 = v9;
    goto LABEL_9;
  }
  if (v9 >> 14 < v8 >> 14)
  {
    __break(1u);
    goto LABEL_41;
  }
  v20 = sub_249B95440();
  v40 = v21;
  v41 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v10 = sub_249B81D44(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
  v27 = *((_QWORD *)v10 + 2);
  v26 = *((_QWORD *)v10 + 3);
  v6 = v27 + 1;
  if (v27 >= v26 >> 1)
    v10 = sub_249B81D44((char *)(v26 > 1), v27 + 1, 1, v10);
  *((_QWORD *)v10 + 2) = v6;
  v28 = &v10[32 * v27];
  *((_QWORD *)v28 + 4) = v41;
  *((_QWORD *)v28 + 5) = v23;
  *((_QWORD *)v28 + 6) = v25;
  *((_QWORD *)v28 + 7) = v40;
  *(_QWORD *)(v39 + 16) = v10;
  v29 = sub_249B953EC();
  v9 = v29;
  *(_QWORD *)(v43 + 16) = v29;
  if (*((_QWORD *)v10 + 2) != v38)
  {
    v8 = v29;
    v17 = v29;
    goto LABEL_9;
  }
  v17 = v29;
  v8 = v29;
LABEL_29:
  if (v44 == v8 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  if (v44 >= v17 >> 14)
  {
    v6 = sub_249B95440();
    v8 = v31;
    v9 = v32;
    v11 = v33;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      goto LABEL_43;
    goto LABEL_34;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  v10 = sub_249B81D44(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
LABEL_34:
  v35 = *((_QWORD *)v10 + 2);
  v34 = *((_QWORD *)v10 + 3);
  if (v35 >= v34 >> 1)
    v10 = sub_249B81D44((char *)(v34 > 1), v35 + 1, 1, v10);
  *((_QWORD *)v10 + 2) = v35 + 1;
  v36 = &v10[32 * v35];
  *((_QWORD *)v36 + 4) = v6;
  *((_QWORD *)v36 + 5) = v8;
  *((_QWORD *)v36 + 6) = v9;
  *((_QWORD *)v36 + 7) = v11;
  *(_QWORD *)(v39 + 16) = v10;
LABEL_37:
  swift_bridgeObjectRetain();
  swift_release();
LABEL_38:
  swift_release();
  return v10;
}

uint64_t sub_249B8BEB4(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  char *v18;

  v10 = *(_QWORD *)(a2 + 16) >> 14;
  v11 = (v10 == a1 >> 14) & a3;
  if (v11 == 1)
    return v11 ^ 1u;
  if (a1 >> 14 < v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  v4 = a4;
  v5 = sub_249B95440();
  v6 = v12;
  v7 = v13;
  v8 = v14;
  v9 = *(char **)(v4 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v4 + 16) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_9:
    v9 = sub_249B81D44(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    *(_QWORD *)(v4 + 16) = v9;
  }
  v17 = *((_QWORD *)v9 + 2);
  v16 = *((_QWORD *)v9 + 3);
  if (v17 >= v16 >> 1)
  {
    v9 = sub_249B81D44((char *)(v16 > 1), v17 + 1, 1, v9);
    *(_QWORD *)(v4 + 16) = v9;
  }
  *((_QWORD *)v9 + 2) = v17 + 1;
  v18 = &v9[32 * v17];
  *((_QWORD *)v18 + 4) = v5;
  *((_QWORD *)v18 + 5) = v6;
  *((_QWORD *)v18 + 6) = v7;
  *((_QWORD *)v18 + 7) = v8;
  return v11 ^ 1u;
}

uint64_t sub_249B8BFC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v15;
  uint64_t v16;
  char *v17;

  v1 = sub_249B95254();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v17 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for UserNotification.LocalizedContent(0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t *)((char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2938);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249B8D868(v0, (uint64_t)v13, &qword_2544C2938);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v13, 1, v7) == 1)
    return sub_249B956A4();
  sub_249B94C54((uint64_t)v13, (uint64_t)v10, type metadata accessor for UserNotification.LocalizedContent);
  sub_249B956A4();
  if (v10[1])
  {
    sub_249B956A4();
    swift_bridgeObjectRetain();
    sub_249B953D4();
    swift_bridgeObjectRelease();
    if (v10[3])
      goto LABEL_5;
LABEL_8:
    sub_249B956A4();
    if (v10[5])
      goto LABEL_6;
LABEL_9:
    sub_249B956A4();
    goto LABEL_10;
  }
  sub_249B956A4();
  if (!v10[3])
    goto LABEL_8;
LABEL_5:
  sub_249B956A4();
  swift_bridgeObjectRetain();
  sub_249B953D4();
  swift_bridgeObjectRelease();
  if (!v10[5])
    goto LABEL_9;
LABEL_6:
  sub_249B956A4();
  swift_bridgeObjectRetain();
  sub_249B953D4();
  swift_bridgeObjectRelease();
LABEL_10:
  sub_249B8D868((uint64_t)v10 + *(int *)(v7 + 28), (uint64_t)v6, qword_2544C2660);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v6, 1, v1) == 1)
  {
    sub_249B956A4();
  }
  else
  {
    v15 = v17;
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v17, v6, v1);
    sub_249B956A4();
    sub_249B80E4C(&qword_2578C24E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C0]);
    sub_249B9535C();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v15, v1);
  }
  if (*((_BYTE *)v10 + *(int *)(v7 + 32)) != 2)
    sub_249B956A4();
  sub_249B956A4();
  return sub_249B833D4((uint64_t)v10, type metadata accessor for UserNotification.LocalizedContent);
}

uint64_t sub_249B8C314(uint64_t a1)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v21;
  char v22;
  __int16 v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int16 v40;
  char v41;

  v3 = sub_249B95248();
  v34 = *(_QWORD *)(v3 - 8);
  v35 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v32 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
  MEMORY[0x24BDAC7A8](v5);
  v33 = (uint64_t)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_249B952B4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v31 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for UserNotification.LegacyContent(0);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2928);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249B8D868(v1, (uint64_t)v19, &qword_2544C2928);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v19, 1, v13) == 1)
    return sub_249B956A4();
  sub_249B94C54((uint64_t)v19, (uint64_t)v16, type metadata accessor for UserNotification.LegacyContent);
  sub_249B956A4();
  v21 = *((_QWORD *)v16 + 1);
  if (v21)
  {
    v22 = v16[42];
    v23 = *((_WORD *)v16 + 20);
    v24 = *((_QWORD *)v16 + 2);
    v36 = *(_QWORD *)v16;
    v37 = v21;
    v38 = v24;
    v39 = *(_OWORD *)(v16 + 24);
    v40 = v23 & 0x101;
    v41 = v22 & 1;
    sub_249B956A4();
    UserNotification.LegacyCategory.hash(into:)(a1);
  }
  else
  {
    sub_249B956A4();
  }
  sub_249B8D868((uint64_t)&v16[*(int *)(v13 + 20)], (uint64_t)v12, &qword_2578C2500);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v12, 1, v7) == 1)
  {
    sub_249B956A4();
  }
  else
  {
    v25 = v31;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v31, v12, v7);
    sub_249B956A4();
    sub_249B80E4C(&qword_2578C2480, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    sub_249B9535C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v25, v7);
  }
  v27 = v34;
  v26 = v35;
  v28 = v33;
  sub_249B8D868((uint64_t)&v16[*(int *)(v13 + 24)], v33, &qword_2578C2508);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v28, 1, v26) == 1)
  {
    sub_249B956A4();
  }
  else
  {
    v29 = v32;
    (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(v32, v28, v26);
    sub_249B956A4();
    sub_249B80E4C(&qword_2578C2510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE08]);
    sub_249B9535C();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
  }
  sub_249B956A4();
  sub_249B956A4();
  return sub_249B833D4((uint64_t)v16, type metadata accessor for UserNotification.LegacyContent);
}

uint64_t sub_249B8C700(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_249B95698();
  if (v3)
  {
    v5 = a2 + 88;
    do
    {
      v6 = *(_QWORD *)(v5 - 24);
      v7 = *(_QWORD *)(v5 - 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_249B953D4();
      sub_249B95698();
      sub_249B95698();
      if (v6)
      {
        sub_249B956A4();
        swift_bridgeObjectRetain();
        sub_249B953D4();
        swift_bridgeObjectRelease();
        if (!v7)
          goto LABEL_9;
      }
      else
      {
        sub_249B956A4();
        if (!v7)
        {
LABEL_9:
          sub_249B956A4();
          goto LABEL_4;
        }
      }
      sub_249B956A4();
      swift_bridgeObjectRetain();
      sub_249B953D4();
      swift_bridgeObjectRelease();
LABEL_4:
      v5 += 64;
      sub_249B956A4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t _s25UserNotificationsServices0A12NotificationV10IdentifierV2eeoiySbAE_AEtFZ_0(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  char v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_249B95644(), result = 0, (v5 & 1) != 0))
  {
    v7 = type metadata accessor for UserNotification.Identifier(0);
    if ((sub_249B9529C() & 1) != 0)
    {
      v8 = *(int *)(v7 + 24);
      v9 = *(_QWORD *)((char *)a1 + v8);
      v10 = *(_QWORD *)((char *)a1 + v8 + 8);
      v11 = (_QWORD *)((char *)a2 + v8);
      if (v9 == *v11 && v10 == v11[1])
        return 1;
      else
        return sub_249B95644();
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t _s25UserNotificationsServices0A12NotificationV12LegacyActionV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = *(unsigned __int8 *)(a1 + 17);
  v5 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v26 = *(unsigned __int8 *)(a1 + 56);
  v8 = *(unsigned __int8 *)(a2 + 16);
  v9 = *(unsigned __int8 *)(a2 + 17);
  v10 = *(_QWORD *)(a2 + 24);
  v11 = *(_QWORD *)(a2 + 32);
  v13 = *(_QWORD *)(a2 + 40);
  v12 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
  {
    result = 0;
    if (v2 != v8)
      return result;
    v25 = *(unsigned __int8 *)(a2 + 56);
    if (v3 != v9)
      return result;
  }
  else
  {
    v23 = *(_QWORD *)(a2 + 24);
    v24 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a2 + 48);
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 40);
    v25 = *(unsigned __int8 *)(a2 + 56);
    v18 = sub_249B95644();
    result = 0;
    if ((v18 & 1) == 0)
      return result;
    if (v2 != v8)
      return result;
    v6 = v17;
    v7 = v16;
    v12 = v15;
    v10 = v23;
    v4 = v24;
    if (v3 != v9)
      return result;
  }
  if (!v4)
  {
    if (v11)
      return 0;
    goto LABEL_16;
  }
  if (!v11)
    return 0;
  if (v5 == v10 && v4 == v11 || (v19 = v6, v20 = sub_249B95644(), v6 = v19, v21 = v20, result = 0, (v21 & 1) != 0))
  {
LABEL_16:
    if (v7)
    {
      if (v12)
      {
        if (v6 != v13 || v7 != v12)
        {
          v22 = sub_249B95644();
          result = 0;
          if ((v22 & 1) == 0)
            return result;
        }
        return v26 ^ v25 ^ 1u;
      }
    }
    else if (!v12)
    {
      return v26 ^ v25 ^ 1u;
    }
    return 0;
  }
  return result;
}

uint64_t _s25UserNotificationsServices0A12NotificationV14LegacyCategoryV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  char v12;
  uint64_t result;
  char v14;
  int v15;
  int v16;

  v2 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 40);
  v6 = *(unsigned __int8 *)(a1 + 41);
  v8 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 32);
  v10 = *(unsigned __int8 *)(a2 + 40);
  v11 = *(unsigned __int8 *)(a2 + 41);
  v15 = *(unsigned __int8 *)(a2 + 42);
  v16 = *(unsigned __int8 *)(a1 + 42);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8)
    || (v12 = sub_249B95644(), result = 0, (v12 & 1) != 0))
  {
    if ((sub_249B824A0(v2, v8) & 1) != 0)
    {
      if (v3)
      {
        if (v9)
        {
          if (v4 != v7 || v3 != v9)
          {
            v14 = sub_249B95644();
            result = 0;
            if ((v14 & 1) == 0 || ((v5 ^ v10) & 1) != 0)
              return result;
LABEL_16:
            if (((v6 ^ v11) & 1) == 0)
              return v16 ^ v15 ^ 1u;
            return result;
          }
LABEL_15:
          result = 0;
          if (v5 != v10)
            return result;
          goto LABEL_16;
        }
      }
      else if (!v9)
      {
        goto LABEL_15;
      }
    }
    return 0;
  }
  return result;
}

uint64_t _s25UserNotificationsServices0A12NotificationV8BehaviorV2eeoiySbAE_AEtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t result;
  void *v4;
  void *v5;
  id v6;
  id v7;
  char v8;

  result = 0;
  if (*a1 == *a2 && ((a1[1] ^ a2[1]) & 1) == 0 && ((a1[2] ^ a2[2]) & 1) == 0)
  {
    v4 = (void *)*((_QWORD *)a1 + 1);
    v5 = (void *)*((_QWORD *)a2 + 1);
    if (v4)
    {
      if (v5)
      {
        sub_249B94C1C(0, &qword_2578C24C0);
        v6 = v5;
        v7 = v4;
        v8 = sub_249B95500();

        if ((v8 & 1) != 0)
          return 1;
      }
    }
    else if (!v5)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t _s25UserNotificationsServices0A12NotificationV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  char v15;
  id v16;
  uint64_t v18;

  v4 = type metadata accessor for UserNotification(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v18 - v8;
  sub_249B94C1C(0, &qword_2578C2748);
  v10 = sub_249B95500();
  sub_249B8D250(a1, (uint64_t)v9, type metadata accessor for UserNotification);
  sub_249B8D250(a2, (uint64_t)v7, type metadata accessor for UserNotification);
  if ((v10 & 1) == 0)
  {
    sub_249B833D4((uint64_t)v7, type metadata accessor for UserNotification);
    sub_249B833D4((uint64_t)v9, type metadata accessor for UserNotification);
LABEL_10:
    v15 = 0;
    return v15 & 1;
  }
  v11 = (void *)*((_QWORD *)v9 + 1);
  v12 = (void *)*((_QWORD *)v7 + 1);
  if (!v11)
  {
    v16 = v12;
    sub_249B833D4((uint64_t)v7, type metadata accessor for UserNotification);
    sub_249B833D4((uint64_t)v9, type metadata accessor for UserNotification);
    if (!v12)
    {
      v15 = 1;
      return v15 & 1;
    }
    goto LABEL_9;
  }
  if (!v12)
  {
    v16 = v11;
    sub_249B833D4((uint64_t)v7, type metadata accessor for UserNotification);
    sub_249B833D4((uint64_t)v9, type metadata accessor for UserNotification);
LABEL_9:

    goto LABEL_10;
  }
  sub_249B94C1C(0, &qword_2578C2428);
  v13 = v12;
  v14 = v11;
  v15 = sub_249B95500();
  sub_249B833D4((uint64_t)v7, type metadata accessor for UserNotification);
  sub_249B833D4((uint64_t)v9, type metadata accessor for UserNotification);

  return v15 & 1;
}

unint64_t sub_249B8CE60()
{
  unint64_t result;

  result = qword_2578C23C0;
  if (!qword_2578C23C0)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B990EC, &type metadata for UserNotification.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C23C0);
  }
  return result;
}

unint64_t sub_249B8CEA4()
{
  unint64_t result;

  result = qword_2578C23C8;
  if (!qword_2578C23C8)
  {
    result = MEMORY[0x24BCFFA80](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2578C23C8);
  }
  return result;
}

unint64_t sub_249B8CEE8()
{
  unint64_t result;

  result = qword_2578C23E0;
  if (!qword_2578C23E0)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B990AC, &type metadata for UserNotification.CodingError);
    atomic_store(result, (unint64_t *)&qword_2578C23E0);
  }
  return result;
}

unint64_t sub_249B8CF2C()
{
  unint64_t result;

  result = qword_2578C23E8;
  if (!qword_2578C23E8)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.Origin, &type metadata for UserNotification.Origin);
    atomic_store(result, (unint64_t *)&qword_2578C23E8);
  }
  return result;
}

unint64_t sub_249B8CF70()
{
  unint64_t result;

  result = qword_2578C2408;
  if (!qword_2578C2408)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.Behavior, &type metadata for UserNotification.Behavior);
    atomic_store(result, (unint64_t *)&qword_2578C2408);
  }
  return result;
}

unint64_t sub_249B8CFB4()
{
  unint64_t result;

  result = qword_2578C2410;
  if (!qword_2578C2410)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.IncomingPriority, &type metadata for UserNotification.IncomingPriority);
    atomic_store(result, (unint64_t *)&qword_2578C2410);
  }
  return result;
}

unint64_t sub_249B8CFF8()
{
  unint64_t result;

  result = qword_2578C2418;
  if (!qword_2578C2418)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.IncomingPersistence, &type metadata for UserNotification.IncomingPersistence);
    atomic_store(result, (unint64_t *)&qword_2578C2418);
  }
  return result;
}

unint64_t sub_249B8D03C()
{
  unint64_t result;

  result = qword_2578C2438;
  if (!qword_2578C2438)
  {
    result = MEMORY[0x24BCFFA80](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2578C2438);
  }
  return result;
}

unint64_t sub_249B8D080()
{
  unint64_t result;

  result = qword_2578C2440;
  if (!qword_2578C2440)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.Origin, &type metadata for UserNotification.Origin);
    atomic_store(result, (unint64_t *)&qword_2578C2440);
  }
  return result;
}

unint64_t sub_249B8D0C4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2578C2448;
  if (!qword_2578C2448)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544C2928);
    v2 = sub_249B80E4C(&qword_2578C2450, type metadata accessor for UserNotification.LegacyContent, (uint64_t)&protocol conformance descriptor for UserNotification.LegacyContent);
    result = MEMORY[0x24BCFFA80](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2578C2448);
  }
  return result;
}

unint64_t sub_249B8D140()
{
  unint64_t result;

  result = qword_2578C2458;
  if (!qword_2578C2458)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.IncomingPriority, &type metadata for UserNotification.IncomingPriority);
    atomic_store(result, (unint64_t *)&qword_2578C2458);
  }
  return result;
}

unint64_t sub_249B8D184()
{
  unint64_t result;

  result = qword_2578C2460;
  if (!qword_2578C2460)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.IncomingPersistence, &type metadata for UserNotification.IncomingPersistence);
    atomic_store(result, (unint64_t *)&qword_2578C2460);
  }
  return result;
}

unint64_t sub_249B8D1C8()
{
  unint64_t result;

  result = qword_2578C2470;
  if (!qword_2578C2470)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.Behavior, &type metadata for UserNotification.Behavior);
    atomic_store(result, (unint64_t *)&qword_2578C2470);
  }
  return result;
}

unint64_t sub_249B8D20C()
{
  unint64_t result;

  result = qword_2578C2490;
  if (!qword_2578C2490)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B9905C, &type metadata for UserNotification.Identifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C2490);
  }
  return result;
}

uint64_t sub_249B8D250(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_249B8D294(_QWORD *a1)
{
  return sub_249B8D2AC(a1) & 1;
}

uint64_t sub_249B8D2AC(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_249B95644() & 1;
}

unint64_t sub_249B8D300()
{
  unint64_t result;

  result = qword_2578C24B8;
  if (!qword_2578C24B8)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B9900C, &type metadata for UserNotification.Behavior.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C24B8);
  }
  return result;
}

unint64_t sub_249B8D344()
{
  unint64_t result;

  result = qword_2578C24D8;
  if (!qword_2578C24D8)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98FBC, &type metadata for UserNotification.LocalizedContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C24D8);
  }
  return result;
}

uint64_t _s25UserNotificationsServices0A12NotificationV16LocalizedContentV2eeoiySbAE_AEtFZ_0(_QWORD *a1, _QWORD *a2)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int (*v34)(uint64_t, uint64_t, uint64_t);
  char v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  int v38;
  int v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v4 = sub_249B95254();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C1AA8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v41 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v41 - v18;
  v20 = a1[1];
  v21 = a2[1];
  if (!v20)
  {
    if (v21)
      return 0;
    goto LABEL_8;
  }
  if (!v21)
    return 0;
  if (*a1 == *a2 && v20 == v21 || (v22 = sub_249B95644(), result = 0, (v22 & 1) != 0))
  {
LABEL_8:
    v24 = a1[3];
    v25 = a2[3];
    if (v24)
    {
      if (!v25)
        return 0;
      if (a1[2] != a2[2] || v24 != v25)
      {
        v26 = sub_249B95644();
        result = 0;
        if ((v26 & 1) == 0)
          return result;
      }
    }
    else if (v25)
    {
      return 0;
    }
    v27 = a1[5];
    v28 = a2[5];
    if (v27)
    {
      if (!v28)
        return 0;
      if (a1[4] != a2[4] || v27 != v28)
      {
        v29 = sub_249B95644();
        result = 0;
        if ((v29 & 1) == 0)
          return result;
      }
    }
    else if (v28)
    {
      return 0;
    }
    v30 = type metadata accessor for UserNotification.LocalizedContent(0);
    v43 = v4;
    v31 = v30;
    sub_249B8D868((uint64_t)a1 + *(int *)(v30 + 28), (uint64_t)v19, qword_2544C2660);
    v42 = v31;
    sub_249B8D868((uint64_t)a2 + *(int *)(v31 + 28), (uint64_t)v17, qword_2544C2660);
    v32 = (uint64_t)&v10[*(int *)(v8 + 48)];
    sub_249B8D868((uint64_t)v19, (uint64_t)v10, qword_2544C2660);
    v44 = v32;
    v33 = v43;
    sub_249B8D868((uint64_t)v17, v32, qword_2544C2660);
    v34 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    if (v34((uint64_t)v10, 1, v33) == 1)
    {
      sub_249B7E754((uint64_t)v17, qword_2544C2660);
      sub_249B7E754((uint64_t)v19, qword_2544C2660);
      if (v34(v44, 1, v33) == 1)
      {
        sub_249B7E754((uint64_t)v10, qword_2544C2660);
        goto LABEL_29;
      }
      goto LABEL_27;
    }
    sub_249B8D868((uint64_t)v10, (uint64_t)v14, qword_2544C2660);
    if (v34(v44, 1, v33) == 1)
    {
      sub_249B7E754((uint64_t)v17, qword_2544C2660);
      sub_249B7E754((uint64_t)v19, qword_2544C2660);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v33);
LABEL_27:
      sub_249B7E754((uint64_t)v10, &qword_2578C1AA8);
      return 0;
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v44, v33);
    sub_249B80E4C(&qword_2578C1AB0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC5A8], MEMORY[0x24BDCC5C8]);
    v35 = sub_249B95374();
    v36 = *(void (**)(char *, uint64_t))(v5 + 8);
    v36(v7, v33);
    sub_249B7E754((uint64_t)v17, qword_2544C2660);
    sub_249B7E754((uint64_t)v19, qword_2544C2660);
    v36(v14, v33);
    sub_249B7E754((uint64_t)v10, qword_2544C2660);
    if ((v35 & 1) != 0)
    {
LABEL_29:
      v37 = *(int *)(v42 + 32);
      v38 = *((unsigned __int8 *)a1 + v37);
      v39 = *((unsigned __int8 *)a2 + v37);
      if (v38 == 2)
      {
        if (v39 != 2)
          return 0;
      }
      else
      {
        v40 = (v38 & 1) == 0;
        if (v39 == 2 || ((v40 ^ v39) & 1) == 0)
          return 0;
      }
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sub_249B8D7AC()
{
  unint64_t result;

  result = qword_2578C24F8;
  if (!qword_2578C24F8)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98F6C, &type metadata for UserNotification.SecureAttachments.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C24F8);
  }
  return result;
}

uint64_t sub_249B8D7F0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_249B8D82C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_249B8D868(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_249B8D8AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t _s25UserNotificationsServices0A12NotificationV13LegacyContentV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  unsigned int (*v58)(uint64_t, uint64_t, uint64_t);
  uint64_t v59;
  char v60;
  uint64_t v62;
  char *v63;
  char v64;
  uint64_t v65;
  char v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD v89[5];
  __int16 v90;
  char v91;
  _QWORD v92[5];
  __int16 v93;
  char v94;

  v75 = sub_249B95248();
  v74 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v70 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2728);
  MEMORY[0x24BDAC7A8](v73);
  v83 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v77 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v82 = (char *)&v68 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v76 = (char *)&v68 - v11;
  v80 = sub_249B952B4();
  v86 = *(_QWORD *)(v80 - 8);
  MEMORY[0x24BDAC7A8](v80);
  v72 = (char *)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2730);
  MEMORY[0x24BDAC7A8](v78);
  v79 = (uint64_t)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v85 = (uint64_t)&v68 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v84 = (uint64_t)&v68 - v19;
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD *)(a1 + 8);
  v22 = *(_QWORD *)(a1 + 16);
  v23 = *(_QWORD *)(a1 + 24);
  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(unsigned __int8 *)(a1 + 42);
  v87 = a1;
  v88 = v22;
  v26 = *(unsigned __int16 *)(a1 + 40) | (v25 << 16);
  v27 = *(_QWORD *)a2;
  v28 = *(_QWORD *)(a2 + 8);
  v29 = *(_QWORD *)(a2 + 16);
  v30 = *(_QWORD *)(a2 + 24);
  v31 = *(unsigned __int16 *)(a2 + 40) | (*(unsigned __int8 *)(a2 + 42) << 16);
  v81 = a2;
  v32 = *(_QWORD *)(a2 + 32);
  if (!v21)
  {
    v71 = v20;
    v69 = v18;
    if (!v28)
      goto LABEL_6;
LABEL_10:
    sub_249B8D7F0(v27, v28);
    sub_249B8D82C(v71, v21);
    sub_249B8D82C(v27, v28);
    goto LABEL_22;
  }
  v92[0] = v20;
  v92[1] = v21;
  v92[2] = v22;
  v92[3] = v23;
  v92[4] = v24;
  v93 = v26;
  v94 = BYTE2(v26);
  if (!v28)
  {
    v71 = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_10;
  }
  v69 = v18;
  v89[0] = v27;
  v89[1] = v28;
  v89[2] = v29;
  v89[3] = v30;
  v89[4] = v32;
  v90 = v31 & 0x101;
  v91 = BYTE2(v31) & 1;
  v33 = _s25UserNotificationsServices0A12NotificationV14LegacyCategoryV2eeoiySbAE_AEtFZ_0((uint64_t)v92, (uint64_t)v89);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v33 & 1) == 0)
    goto LABEL_22;
LABEL_6:
  v34 = type metadata accessor for UserNotification.LegacyContent(0);
  v35 = v84;
  sub_249B8D868(v87 + *(int *)(v34 + 20), v84, &qword_2578C2500);
  v36 = v81;
  v37 = v85;
  sub_249B8D868(v81 + *(int *)(v34 + 20), v85, &qword_2578C2500);
  v38 = v79;
  v39 = v79 + *(int *)(v78 + 48);
  sub_249B8D868(v35, v79, &qword_2578C2500);
  sub_249B8D868(v37, v39, &qword_2578C2500);
  v40 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v86 + 48);
  v41 = v80;
  if (v40(v38, 1, v80) == 1)
  {
    sub_249B7E754(v37, &qword_2578C2500);
    sub_249B7E754(v35, &qword_2578C2500);
    v42 = v40(v39, 1, v41);
    v44 = (uint64_t)v82;
    v43 = (uint64_t)v83;
    v45 = (uint64_t)v77;
    v46 = (uint64_t)v76;
    if (v42 == 1)
    {
      sub_249B7E754(v38, &qword_2578C2500);
      goto LABEL_15;
    }
LABEL_13:
    v50 = &qword_2578C2730;
    v51 = v38;
LABEL_21:
    sub_249B7E754(v51, v50);
    goto LABEL_22;
  }
  v47 = v69;
  sub_249B8D868(v38, v69, &qword_2578C2500);
  v48 = v40(v39, 1, v41);
  v49 = v41;
  v44 = (uint64_t)v82;
  v43 = (uint64_t)v83;
  if (v48 == 1)
  {
    sub_249B7E754(v85, &qword_2578C2500);
    sub_249B7E754(v35, &qword_2578C2500);
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v47, v49);
    goto LABEL_13;
  }
  v52 = v86;
  v53 = v72;
  (*(void (**)(char *, uint64_t, uint64_t))(v86 + 32))(v72, v39, v49);
  sub_249B80E4C(&qword_2578C2740, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
  LODWORD(v88) = sub_249B95374();
  v54 = v34;
  v55 = *(void (**)(char *, uint64_t))(v52 + 8);
  v55(v53, v49);
  sub_249B7E754(v85, &qword_2578C2500);
  sub_249B7E754(v84, &qword_2578C2500);
  v55((char *)v47, v49);
  v34 = v54;
  sub_249B7E754(v38, &qword_2578C2500);
  v45 = (uint64_t)v77;
  v46 = (uint64_t)v76;
  if ((v88 & 1) == 0)
    goto LABEL_22;
LABEL_15:
  sub_249B8D868(v87 + *(int *)(v34 + 24), v46, &qword_2578C2508);
  v88 = v34;
  sub_249B8D868(v36 + *(int *)(v34 + 24), v44, &qword_2578C2508);
  v56 = v43 + *(int *)(v73 + 48);
  sub_249B8D868(v46, v43, &qword_2578C2508);
  sub_249B8D868(v44, v56, &qword_2578C2508);
  v57 = v74;
  v58 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v74 + 48);
  v59 = v75;
  if (v58(v43, 1, v75) != 1)
  {
    sub_249B8D868(v43, v45, &qword_2578C2508);
    if (v58(v56, 1, v59) != 1)
    {
      v62 = v44;
      v63 = v70;
      (*(void (**)(char *, uint64_t, uint64_t))(v57 + 32))(v70, v56, v59);
      sub_249B80E4C(&qword_2578C2738, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE18]);
      v64 = sub_249B95374();
      v65 = v57;
      v66 = v64;
      v67 = *(void (**)(char *, uint64_t))(v65 + 8);
      v67(v63, v59);
      sub_249B7E754(v62, &qword_2578C2508);
      sub_249B7E754(v46, &qword_2578C2508);
      v67((char *)v45, v59);
      sub_249B7E754(v43, &qword_2578C2508);
      if ((v66 & 1) == 0)
        goto LABEL_22;
      goto LABEL_25;
    }
    sub_249B7E754(v44, &qword_2578C2508);
    sub_249B7E754(v46, &qword_2578C2508);
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v45, v59);
    goto LABEL_20;
  }
  sub_249B7E754(v44, &qword_2578C2508);
  sub_249B7E754(v46, &qword_2578C2508);
  if (v58(v56, 1, v59) != 1)
  {
LABEL_20:
    v50 = &qword_2578C2728;
    v51 = v43;
    goto LABEL_21;
  }
  sub_249B7E754(v43, &qword_2578C2508);
LABEL_25:
  if (*(unsigned __int8 *)(v87 + *(int *)(v88 + 28)) == *(unsigned __int8 *)(v36 + *(int *)(v88 + 28)))
  {
    v60 = *(_BYTE *)(v87 + *(int *)(v88 + 32)) ^ *(_BYTE *)(v36 + *(int *)(v88 + 32)) ^ 1;
    return v60 & 1;
  }
LABEL_22:
  v60 = 0;
  return v60 & 1;
}

unint64_t sub_249B8E128()
{
  unint64_t result;

  result = qword_2578C2520;
  if (!qword_2578C2520)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98F1C, &type metadata for UserNotification.LegacyContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C2520);
  }
  return result;
}

unint64_t sub_249B8E16C()
{
  unint64_t result;

  result = qword_2578C2528;
  if (!qword_2578C2528)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.LegacyCategory, &type metadata for UserNotification.LegacyCategory);
    atomic_store(result, (unint64_t *)&qword_2578C2528);
  }
  return result;
}

unint64_t sub_249B8E1B0()
{
  unint64_t result;

  result = qword_2578C2540;
  if (!qword_2578C2540)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.LegacyCategory, &type metadata for UserNotification.LegacyCategory);
    atomic_store(result, (unint64_t *)&qword_2578C2540);
  }
  return result;
}

unint64_t sub_249B8E1F4()
{
  unint64_t result;

  result = qword_2578C2558;
  if (!qword_2578C2558)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98ECC, &type metadata for UserNotification.LegacyCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C2558);
  }
  return result;
}

unint64_t sub_249B8E238()
{
  unint64_t result;

  result = qword_2578C2570;
  if (!qword_2578C2570)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.LegacyAction, &type metadata for UserNotification.LegacyAction);
    atomic_store(result, (unint64_t *)&qword_2578C2570);
  }
  return result;
}

uint64_t sub_249B8E27C(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2578C2560);
    v8 = a2();
    result = MEMORY[0x24BCFFA80](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_249B8E2E4()
{
  unint64_t result;

  result = qword_2578C2588;
  if (!qword_2578C2588)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.LegacyAction, &type metadata for UserNotification.LegacyAction);
    atomic_store(result, (unint64_t *)&qword_2578C2588);
  }
  return result;
}

unint64_t sub_249B8E328()
{
  unint64_t result;

  result = qword_2578C2598;
  if (!qword_2578C2598)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98E7C, &type metadata for UserNotification.LegacyAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C2598);
  }
  return result;
}

unint64_t sub_249B8E36C()
{
  unint64_t result;

  result = qword_2578C25A0;
  if (!qword_2578C25A0)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.LegacyAction.Style, &type metadata for UserNotification.LegacyAction.Style);
    atomic_store(result, (unint64_t *)&qword_2578C25A0);
  }
  return result;
}

unint64_t sub_249B8E3B0()
{
  unint64_t result;

  result = qword_2578C25A8;
  if (!qword_2578C25A8)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.LegacyAction.ActionType, &type metadata for UserNotification.LegacyAction.ActionType);
    atomic_store(result, (unint64_t *)&qword_2578C25A8);
  }
  return result;
}

unint64_t sub_249B8E3F4()
{
  unint64_t result;

  result = qword_2578C25B8;
  if (!qword_2578C25B8)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.LegacyAction.Style, &type metadata for UserNotification.LegacyAction.Style);
    atomic_store(result, (unint64_t *)&qword_2578C25B8);
  }
  return result;
}

unint64_t sub_249B8E438()
{
  unint64_t result;

  result = qword_2578C25C0;
  if (!qword_2578C25C0)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.LegacyAction.ActionType, &type metadata for UserNotification.LegacyAction.ActionType);
    atomic_store(result, (unint64_t *)&qword_2578C25C0);
  }
  return result;
}

uint64_t sub_249B8E47C()
{
  return sub_249B80E4C(&qword_2578C25C8, type metadata accessor for UserNotification, (uint64_t)&protocol conformance descriptor for UserNotification);
}

uint64_t sub_249B8E4A8()
{
  return sub_249B80E4C(&qword_2578C25D0, type metadata accessor for UserNotification.Identifier, (uint64_t)&protocol conformance descriptor for UserNotification.Identifier);
}

uint64_t sub_249B8E4D4()
{
  return sub_249B80E4C(&qword_2578C25D8, type metadata accessor for UserNotification.Identifier, (uint64_t)&protocol conformance descriptor for UserNotification.Identifier);
}

unint64_t sub_249B8E504()
{
  unint64_t result;

  result = qword_2578C25E0;
  if (!qword_2578C25E0)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.Behavior, &type metadata for UserNotification.Behavior);
    atomic_store(result, (unint64_t *)&qword_2578C25E0);
  }
  return result;
}

uint64_t sub_249B8E548()
{
  return sub_249B80E4C(&qword_2578C25E8, type metadata accessor for UserNotification.LocalizedContent, (uint64_t)&protocol conformance descriptor for UserNotification.LocalizedContent);
}

unint64_t sub_249B8E578()
{
  unint64_t result;

  result = qword_2578C25F0;
  if (!qword_2578C25F0)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.IncomingPersistence, &type metadata for UserNotification.IncomingPersistence);
    atomic_store(result, (unint64_t *)&qword_2578C25F0);
  }
  return result;
}

unint64_t sub_249B8E5C0()
{
  unint64_t result;

  result = qword_2578C25F8;
  if (!qword_2578C25F8)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.IncomingPriority, &type metadata for UserNotification.IncomingPriority);
    atomic_store(result, (unint64_t *)&qword_2578C25F8);
  }
  return result;
}

unint64_t sub_249B8E608()
{
  unint64_t result;

  result = qword_2578C2600;
  if (!qword_2578C2600)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.Origin, &type metadata for UserNotification.Origin);
    atomic_store(result, (unint64_t *)&qword_2578C2600);
  }
  return result;
}

unint64_t sub_249B8E650()
{
  unint64_t result;

  result = qword_2578C2608;
  if (!qword_2578C2608)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.LegacyContent.IdentityImageStyle, &type metadata for UserNotification.LegacyContent.IdentityImageStyle);
    atomic_store(result, (unint64_t *)&qword_2578C2608);
  }
  return result;
}

uint64_t sub_249B8E694()
{
  return sub_249B80E4C(&qword_2578C2610, type metadata accessor for UserNotification.LegacyContent, (uint64_t)&protocol conformance descriptor for UserNotification.LegacyContent);
}

unint64_t sub_249B8E6C4()
{
  unint64_t result;

  result = qword_2578C2618;
  if (!qword_2578C2618)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.LegacyCategory, &type metadata for UserNotification.LegacyCategory);
    atomic_store(result, (unint64_t *)&qword_2578C2618);
  }
  return result;
}

unint64_t sub_249B8E70C()
{
  unint64_t result;

  result = qword_2578C2620;
  if (!qword_2578C2620)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.LegacyAction.Style, &type metadata for UserNotification.LegacyAction.Style);
    atomic_store(result, (unint64_t *)&qword_2578C2620);
  }
  return result;
}

unint64_t sub_249B8E754()
{
  unint64_t result;

  result = qword_2578C2628;
  if (!qword_2578C2628)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.LegacyAction.ActionType, &type metadata for UserNotification.LegacyAction.ActionType);
    atomic_store(result, (unint64_t *)&qword_2578C2628);
  }
  return result;
}

unint64_t sub_249B8E79C()
{
  unint64_t result;

  result = qword_2578C2630;
  if (!qword_2578C2630)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.LegacyAction, &type metadata for UserNotification.LegacyAction);
    atomic_store(result, (unint64_t *)&qword_2578C2630);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for UserNotification(char *a1, char **a2, int *a3)
{
  int v3;
  char *v4;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  int *v12;
  uint64_t v13;
  unsigned int (*v14)(_QWORD *, uint64_t, int *);
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  _QWORD *v35;
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
  char *v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int (*v59)(char *, uint64_t, uint64_t);
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  uint64_t v67;
  char *__dst;
  uint64_t v69;
  unsigned int (*v70)(char *, uint64_t, uint64_t);
  uint64_t v71;
  char *v72;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a2[1];
    *((_QWORD *)a1 + 1) = v8;
    a1[16] = *((_BYTE *)a2 + 16);
    v9 = a3[7];
    v10 = &a1[v9];
    v11 = (char **)((char *)a2 + v9);
    v12 = (int *)type metadata accessor for UserNotification.LegacyContent(0);
    v13 = *((_QWORD *)v12 - 1);
    v14 = *(unsigned int (**)(_QWORD *, uint64_t, int *))(v13 + 48);
    v15 = v4;
    v16 = v8;
    if (v14(v11, 1, v12))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2928);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      v18 = v11[1];
      v71 = v13;
      if (v18)
      {
        *(_QWORD *)v10 = *v11;
        *((_QWORD *)v10 + 1) = v18;
        v19 = v11[3];
        *((_QWORD *)v10 + 2) = v11[2];
        *((_QWORD *)v10 + 3) = v19;
        *((_QWORD *)v10 + 4) = v11[4];
        v10[40] = *((_BYTE *)v11 + 40);
        *(_WORD *)(v10 + 41) = *(_WORD *)((char *)v11 + 41);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        v20 = *((_OWORD *)v11 + 1);
        *(_OWORD *)v10 = *(_OWORD *)v11;
        *((_OWORD *)v10 + 1) = v20;
        *(_OWORD *)(v10 + 27) = *(_OWORD *)((char *)v11 + 27);
      }
      v21 = v12[5];
      v22 = &v10[v21];
      v23 = (char *)v11 + v21;
      v24 = sub_249B952B4();
      v25 = *(_QWORD *)(v24 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
      {
        v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
        memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
      }
      v27 = v12[6];
      v28 = &v10[v27];
      v29 = (char *)v11 + v27;
      v30 = sub_249B95248();
      v31 = *(_QWORD *)(v30 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
      {
        v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
        memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v28, v29, v30);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
      }
      v10[v12[7]] = *((_BYTE *)v11 + v12[7]);
      v10[v12[8]] = *((_BYTE *)v11 + v12[8]);
      (*(void (**)(char *, _QWORD, uint64_t, int *))(v71 + 56))(v10, 0, 1, v12);
    }
    v33 = a3[8];
    v34 = &v7[v33];
    v35 = (char **)((char *)a2 + v33);
    v36 = type metadata accessor for UserNotification.LocalizedContent(0);
    v37 = *(_QWORD *)(v36 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
    {
      v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2938);
      memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    }
    else
    {
      v69 = v37;
      v39 = v35[1];
      *(_QWORD *)v34 = *v35;
      *((_QWORD *)v34 + 1) = v39;
      v40 = v35[3];
      *((_QWORD *)v34 + 2) = v35[2];
      *((_QWORD *)v34 + 3) = v40;
      v41 = v35[5];
      *((_QWORD *)v34 + 4) = v35[4];
      *((_QWORD *)v34 + 5) = v41;
      v42 = *(int *)(v36 + 28);
      __dst = &v34[v42];
      v72 = (char *)v35 + v42;
      v43 = sub_249B95254();
      v67 = *(_QWORD *)(v43 - 8);
      v70 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v67 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v70(v72, 1, v43))
      {
        v44 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
        memcpy(__dst, v72, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v67 + 16))(__dst, v72, v43);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v67 + 56))(__dst, 0, 1, v43);
      }
      v34[*(int *)(v36 + 32)] = *((_BYTE *)v35 + *(int *)(v36 + 32));
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v69 + 56))(v34, 0, 1, v36);
    }
    v45 = a3[9];
    v46 = &v7[v45];
    v47 = (uint64_t)a2 + v45;
    v48 = *(char **)((char *)a2 + v45 + 8);
    if (v48 == (void *)1)
    {
      *(_OWORD *)v46 = *(_OWORD *)v47;
    }
    else
    {
      *v46 = *(_BYTE *)v47;
      *(_WORD *)(v46 + 1) = *(_WORD *)(v47 + 1);
      *((_QWORD *)v46 + 1) = v48;
      v49 = v48;
    }
    v50 = a3[11];
    v7[a3[10]] = *((_BYTE *)a2 + a3[10]);
    v7[v50] = *((_BYTE *)a2 + v50);
    v51 = a3[13];
    v7[a3[12]] = *((_BYTE *)a2 + a3[12]);
    *(_QWORD *)&v7[v51] = *(char **)((char *)a2 + v51);
    v52 = a3[14];
    v53 = a3[15];
    v54 = *(char **)((char *)a2 + v52);
    *(_QWORD *)&v7[v52] = v54;
    v55 = &v7[v53];
    v56 = (char *)a2 + v53;
    v57 = sub_249B95308();
    v58 = *(_QWORD *)(v57 - 8);
    v59 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48);
    v60 = v54;
    if (v59(v56, 1, v57))
    {
      v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2B48);
      memcpy(v55, v56, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v55, v56, v57);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v58 + 56))(v55, 0, 1, v57);
    }
    v62 = a3[16];
    v63 = a3[17];
    v64 = *(char **)((char *)a2 + v62);
    *(_QWORD *)&v7[v62] = v64;
    v7[v63] = *((_BYTE *)a2 + v63);
    v65 = v64;
  }
  return v7;
}

void destroy for UserNotification(id *a1, int *a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = (char *)a1 + a2[7];
  v5 = type metadata accessor for UserNotification.LegacyContent(0);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
  {
    if (*((_QWORD *)v4 + 1))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v6 = &v4[*(int *)(v5 + 20)];
    v7 = sub_249B952B4();
    v8 = *(_QWORD *)(v7 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
      (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    v9 = &v4[*(int *)(v5 + 24)];
    v10 = sub_249B95248();
    v11 = *(_QWORD *)(v10 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  }
  v12 = (char *)a1 + a2[8];
  v13 = type metadata accessor for UserNotification.LocalizedContent(0);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(v12, 1, v13))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v14 = &v12[*(int *)(v13 + 28)];
    v15 = sub_249B95254();
    v16 = *(_QWORD *)(v15 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
      (*(void (**)(char *, uint64_t))(v16 + 8))(v14, v15);
  }
  v17 = *(id *)((char *)a1 + a2[9] + 8);
  if (v17 != (void *)1)

  v18 = (char *)a1 + a2[15];
  v19 = sub_249B95308();
  v20 = *(_QWORD *)(v19 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    (*(void (**)(char *, uint64_t))(v20 + 8))(v18, v19);

}

uint64_t initializeWithCopy for UserNotification(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  int *v11;
  uint64_t v12;
  unsigned int (*v13)(_QWORD *, uint64_t, int *);
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
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
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const void *v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int (*v58)(const void *, uint64_t, uint64_t);
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  uint64_t v66;
  unsigned int (*v67)(char *, uint64_t, uint64_t);
  char *v68;
  char *__dst;
  uint64_t v70;
  uint64_t v71;

  v6 = *(void **)a2;
  v7 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v8 = a3[7];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = (int *)type metadata accessor for UserNotification.LegacyContent(0);
  v12 = *((_QWORD *)v11 - 1);
  v13 = *(unsigned int (**)(_QWORD *, uint64_t, int *))(v12 + 48);
  v14 = v6;
  v15 = v7;
  if (v13(v10, 1, v11))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2928);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    v17 = v10[1];
    v70 = v12;
    if (v17)
    {
      *v9 = *v10;
      v9[1] = v17;
      v18 = v10[3];
      v9[2] = v10[2];
      v9[3] = v18;
      v9[4] = v10[4];
      *((_BYTE *)v9 + 40) = *((_BYTE *)v10 + 40);
      *(_WORD *)((char *)v9 + 41) = *(_WORD *)((char *)v10 + 41);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v19 = *((_OWORD *)v10 + 1);
      *(_OWORD *)v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v19;
      *(_OWORD *)((char *)v9 + 27) = *(_OWORD *)((char *)v10 + 27);
    }
    v20 = v11[5];
    v21 = (char *)v9 + v20;
    v22 = (char *)v10 + v20;
    v23 = sub_249B952B4();
    v24 = *(_QWORD *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    {
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
      memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
    v26 = v11[6];
    v27 = (char *)v9 + v26;
    v28 = (char *)v10 + v26;
    v29 = sub_249B95248();
    v30 = *(_QWORD *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
      memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
    *((_BYTE *)v9 + v11[7]) = *((_BYTE *)v10 + v11[7]);
    *((_BYTE *)v9 + v11[8]) = *((_BYTE *)v10 + v11[8]);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v70 + 56))(v9, 0, 1, v11);
  }
  v32 = a3[8];
  v33 = (_QWORD *)(a1 + v32);
  v34 = (_QWORD *)(a2 + v32);
  v35 = type metadata accessor for UserNotification.LocalizedContent(0);
  v36 = *(_QWORD *)(v35 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
  {
    v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2938);
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
  }
  else
  {
    v71 = v36;
    v38 = v34[1];
    *v33 = *v34;
    v33[1] = v38;
    v39 = v34[3];
    v33[2] = v34[2];
    v33[3] = v39;
    v40 = v34[5];
    v33[4] = v34[4];
    v33[5] = v40;
    v41 = *(int *)(v35 + 28);
    v68 = (char *)v34 + v41;
    __dst = (char *)v33 + v41;
    v42 = sub_249B95254();
    v66 = *(_QWORD *)(v42 - 8);
    v67 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v66 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v67(v68, 1, v42))
    {
      v43 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
      memcpy(__dst, v68, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v66 + 16))(__dst, v68, v42);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v66 + 56))(__dst, 0, 1, v42);
    }
    *((_BYTE *)v33 + *(int *)(v35 + 32)) = *((_BYTE *)v34 + *(int *)(v35 + 32));
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v71 + 56))(v33, 0, 1, v35);
  }
  v44 = a3[9];
  v45 = a1 + v44;
  v46 = a2 + v44;
  v47 = *(void **)(a2 + v44 + 8);
  if (v47 == (void *)1)
  {
    *(_OWORD *)v45 = *(_OWORD *)v46;
  }
  else
  {
    *(_BYTE *)v45 = *(_BYTE *)v46;
    *(_WORD *)(v45 + 1) = *(_WORD *)(v46 + 1);
    *(_QWORD *)(v45 + 8) = v47;
    v48 = v47;
  }
  v49 = a3[11];
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  *(_BYTE *)(a1 + v49) = *(_BYTE *)(a2 + v49);
  v50 = a3[13];
  *(_BYTE *)(a1 + a3[12]) = *(_BYTE *)(a2 + a3[12]);
  *(_QWORD *)(a1 + v50) = *(_QWORD *)(a2 + v50);
  v51 = a3[14];
  v52 = a3[15];
  v53 = *(void **)(a2 + v51);
  *(_QWORD *)(a1 + v51) = v53;
  v54 = (void *)(a1 + v52);
  v55 = (const void *)(a2 + v52);
  v56 = sub_249B95308();
  v57 = *(_QWORD *)(v56 - 8);
  v58 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v57 + 48);
  v59 = v53;
  if (v58(v55, 1, v56))
  {
    v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2B48);
    memcpy(v54, v55, *(_QWORD *)(*(_QWORD *)(v60 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v57 + 16))(v54, v55, v56);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v57 + 56))(v54, 0, 1, v56);
  }
  v61 = a3[16];
  v62 = a3[17];
  v63 = *(void **)(a2 + v61);
  *(_QWORD *)(a1 + v61) = v63;
  *(_BYTE *)(a1 + v62) = *(_BYTE *)(a2 + v62);
  v64 = v63;
  return a1;
}

uint64_t assignWithCopy for UserNotification(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  __int128 *v14;
  int *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, int *);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  void *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  void *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(void *, uint64_t, uint64_t);
  int v46;
  size_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t (*v54)(void *, uint64_t, uint64_t);
  int v55;
  size_t v56;
  void *v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t (*v63)(_QWORD *, uint64_t, uint64_t);
  int v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t (*v75)(char *, uint64_t, uint64_t);
  int v76;
  size_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  uint64_t v88;
  void *v89;
  void *v90;
  id v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t (*v97)(void *, uint64_t, uint64_t);
  int v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  id v104;
  uint64_t v106;
  unsigned int (*v107)(char *, uint64_t, uint64_t);
  void *v108;
  void *v109;
  char *v110;
  void *v111;
  char *__src;
  int *v113;
  int *v114;
  int *v115;
  int *v116;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  v9 = *(void **)(a1 + 8);
  v10 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v10;
  v11 = v10;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = (__int128 *)(a2 + v12);
  v15 = (int *)type metadata accessor for UserNotification.LegacyContent(0);
  v16 = *((_QWORD *)v15 - 1);
  v17 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17((uint64_t)v14, 1, v15);
  if (!v18)
  {
    if (v19)
    {
      sub_249B833D4(v13, type metadata accessor for UserNotification.LegacyContent);
      goto LABEL_7;
    }
    v21 = *((_QWORD *)v14 + 1);
    v114 = a3;
    if (*(_QWORD *)(v13 + 8))
    {
      if (v21)
      {
        *(_QWORD *)v13 = *(_QWORD *)v14;
        *(_QWORD *)(v13 + 8) = *((_QWORD *)v14 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_QWORD *)(v13 + 16) = *((_QWORD *)v14 + 2);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_QWORD *)(v13 + 24) = *((_QWORD *)v14 + 3);
        *(_QWORD *)(v13 + 32) = *((_QWORD *)v14 + 4);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(_BYTE *)(v13 + 40) = *((_BYTE *)v14 + 40);
        *(_BYTE *)(v13 + 41) = *((_BYTE *)v14 + 41);
        *(_BYTE *)(v13 + 42) = *((_BYTE *)v14 + 42);
      }
      else
      {
        sub_249B8FE00(v13);
        v36 = *(__int128 *)((char *)v14 + 27);
        v37 = v14[1];
        *(_OWORD *)v13 = *v14;
        *(_OWORD *)(v13 + 16) = v37;
        *(_OWORD *)(v13 + 27) = v36;
      }
    }
    else if (v21)
    {
      *(_QWORD *)v13 = *(_QWORD *)v14;
      *(_QWORD *)(v13 + 8) = *((_QWORD *)v14 + 1);
      *(_QWORD *)(v13 + 16) = *((_QWORD *)v14 + 2);
      *(_QWORD *)(v13 + 24) = *((_QWORD *)v14 + 3);
      *(_QWORD *)(v13 + 32) = *((_QWORD *)v14 + 4);
      *(_BYTE *)(v13 + 40) = *((_BYTE *)v14 + 40);
      *(_BYTE *)(v13 + 41) = *((_BYTE *)v14 + 41);
      *(_BYTE *)(v13 + 42) = *((_BYTE *)v14 + 42);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v38 = *v14;
      v39 = v14[1];
      *(_OWORD *)(v13 + 27) = *(__int128 *)((char *)v14 + 27);
      *(_OWORD *)v13 = v38;
      *(_OWORD *)(v13 + 16) = v39;
    }
    v40 = v15[5];
    v41 = (void *)(v13 + v40);
    v42 = (char *)v14 + v40;
    v43 = sub_249B952B4();
    v44 = *(_QWORD *)(v43 - 8);
    v45 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v44 + 48);
    v108 = v41;
    LODWORD(v41) = v45(v41, 1, v43);
    v46 = v45(v42, 1, v43);
    if ((_DWORD)v41)
    {
      if (v46)
      {
        v47 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500) - 8) + 64);
        v48 = v108;
LABEL_28:
        memcpy(v48, v42, v47);
        goto LABEL_31;
      }
      (*(void (**)(void *, char *, uint64_t))(v44 + 16))(v108, v42, v43);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v44 + 56))(v108, 0, 1, v43);
    }
    else
    {
      if (v46)
      {
        (*(void (**)(void *, uint64_t))(v44 + 8))(v108, v43);
        v47 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500) - 8) + 64);
        v48 = v108;
        goto LABEL_28;
      }
      (*(void (**)(void *, char *, uint64_t))(v44 + 24))(v108, v42, v43);
    }
LABEL_31:
    v49 = v15[6];
    v50 = (void *)(v13 + v49);
    v51 = (char *)v14 + v49;
    v52 = sub_249B95248();
    v53 = *(_QWORD *)(v52 - 8);
    v54 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v53 + 48);
    v109 = v50;
    LODWORD(v50) = v54(v50, 1, v52);
    v55 = v54(v51, 1, v52);
    if ((_DWORD)v50)
    {
      if (!v55)
      {
        (*(void (**)(void *, char *, uint64_t))(v53 + 16))(v109, v51, v52);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v53 + 56))(v109, 0, 1, v52);
        goto LABEL_39;
      }
      v56 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508) - 8) + 64);
      v57 = v109;
    }
    else
    {
      if (!v55)
      {
        (*(void (**)(void *, char *, uint64_t))(v53 + 24))(v109, v51, v52);
        goto LABEL_39;
      }
      (*(void (**)(void *, uint64_t))(v53 + 8))(v109, v52);
      v56 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508) - 8) + 64);
      v57 = v109;
    }
    memcpy(v57, v51, v56);
LABEL_39:
    *(_BYTE *)(v13 + v15[7]) = *((_BYTE *)v14 + v15[7]);
    *(_BYTE *)(v13 + v15[8]) = *((_BYTE *)v14 + v15[8]);
    a3 = v114;
    goto LABEL_40;
  }
  if (v19)
  {
LABEL_7:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2928);
    memcpy((void *)v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_40;
  }
  v113 = a3;
  if (*((_QWORD *)v14 + 1))
  {
    *(_QWORD *)v13 = *(_QWORD *)v14;
    *(_QWORD *)(v13 + 8) = *((_QWORD *)v14 + 1);
    *(_QWORD *)(v13 + 16) = *((_QWORD *)v14 + 2);
    *(_QWORD *)(v13 + 24) = *((_QWORD *)v14 + 3);
    *(_QWORD *)(v13 + 32) = *((_QWORD *)v14 + 4);
    *(_BYTE *)(v13 + 40) = *((_BYTE *)v14 + 40);
    *(_BYTE *)(v13 + 41) = *((_BYTE *)v14 + 41);
    *(_BYTE *)(v13 + 42) = *((_BYTE *)v14 + 42);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v22 = *v14;
    v23 = v14[1];
    *(_OWORD *)(v13 + 27) = *(__int128 *)((char *)v14 + 27);
    *(_OWORD *)v13 = v22;
    *(_OWORD *)(v13 + 16) = v23;
  }
  v24 = v15[5];
  v25 = (void *)(v13 + v24);
  v26 = (char *)v14 + v24;
  v27 = sub_249B952B4();
  v28 = *(_QWORD *)(v27 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, char *, uint64_t))(v28 + 16))(v25, v26, v27);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  v30 = v15[6];
  v31 = (void *)(v13 + v30);
  v32 = (char *)v14 + v30;
  v33 = sub_249B95248();
  v34 = *(_QWORD *)(v33 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
  {
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  a3 = v113;
  *(_BYTE *)(v13 + v15[7]) = *((_BYTE *)v14 + v15[7]);
  *(_BYTE *)(v13 + v15[8]) = *((_BYTE *)v14 + v15[8]);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v16 + 56))(v13, 0, 1, v15);
LABEL_40:
  v58 = a3[8];
  v59 = (_QWORD *)(a1 + v58);
  v60 = (_QWORD *)(a2 + v58);
  v61 = type metadata accessor for UserNotification.LocalizedContent(0);
  v62 = *(_QWORD *)(v61 - 8);
  v63 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v62 + 48);
  v64 = v63(v59, 1, v61);
  v65 = v63(v60, 1, v61);
  if (!v64)
  {
    if (v65)
    {
      sub_249B833D4((uint64_t)v59, type metadata accessor for UserNotification.LocalizedContent);
      goto LABEL_46;
    }
    v116 = a3;
    *v59 = *v60;
    v59[1] = v60[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v59[2] = v60[2];
    v59[3] = v60[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v59[4] = v60[4];
    v59[5] = v60[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v70 = *(int *)(v61 + 28);
    v71 = (char *)v59 + v70;
    v72 = (char *)v60 + v70;
    v73 = sub_249B95254();
    v74 = *(_QWORD *)(v73 - 8);
    v75 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v74 + 48);
    v111 = v71;
    LODWORD(v71) = v75(v71, 1, v73);
    v76 = v75(v72, 1, v73);
    if ((_DWORD)v71)
    {
      if (!v76)
      {
        (*(void (**)(void *, char *, uint64_t))(v74 + 16))(v111, v72, v73);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v74 + 56))(v111, 0, 1, v73);
        goto LABEL_57;
      }
      v77 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_2544C2660) - 8) + 64);
      v78 = v111;
    }
    else
    {
      if (!v76)
      {
        (*(void (**)(void *, char *, uint64_t))(v74 + 24))(v111, v72, v73);
        goto LABEL_57;
      }
      (*(void (**)(void *, uint64_t))(v74 + 8))(v111, v73);
      v77 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_2544C2660) - 8) + 64);
      v78 = v111;
    }
    memcpy(v78, v72, v77);
LABEL_57:
    *((_BYTE *)v59 + *(int *)(v61 + 32)) = *((_BYTE *)v60 + *(int *)(v61 + 32));
    a3 = v116;
    goto LABEL_58;
  }
  if (v65)
  {
LABEL_46:
    v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2938);
    memcpy(v59, v60, *(_QWORD *)(*(_QWORD *)(v69 - 8) + 64));
    goto LABEL_58;
  }
  *v59 = *v60;
  v59[1] = v60[1];
  v59[2] = v60[2];
  v59[3] = v60[3];
  v59[4] = v60[4];
  v59[5] = v60[5];
  v66 = *(int *)(v61 + 28);
  __src = (char *)v59 + v66;
  v115 = a3;
  v110 = (char *)v60 + v66;
  v67 = sub_249B95254();
  v106 = *(_QWORD *)(v67 - 8);
  v107 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v106 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v107(v110, 1, v67))
  {
    v68 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    memcpy(__src, v110, *(_QWORD *)(*(_QWORD *)(v68 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v106 + 16))(__src, v110, v67);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v106 + 56))(__src, 0, 1, v67);
  }
  a3 = v115;
  *((_BYTE *)v59 + *(int *)(v61 + 32)) = *((_BYTE *)v60 + *(int *)(v61 + 32));
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v62 + 56))(v59, 0, 1, v61);
LABEL_58:
  v79 = a3[9];
  v80 = a1 + v79;
  v81 = a2 + v79;
  v82 = *(void **)(a1 + v79 + 8);
  v83 = *(_QWORD *)(a2 + v79 + 8);
  if (v82 == (void *)1)
  {
    if (v83 != 1)
    {
      *(_BYTE *)v80 = *(_BYTE *)v81;
      *(_BYTE *)(v80 + 1) = *(_BYTE *)(v81 + 1);
      *(_BYTE *)(v80 + 2) = *(_BYTE *)(v81 + 2);
      v84 = *(void **)(v81 + 8);
      *(_QWORD *)(v80 + 8) = v84;
      v85 = v84;
      goto LABEL_65;
    }
    goto LABEL_63;
  }
  if (v83 == 1)
  {
    sub_249B8FE2C(v80);
LABEL_63:
    *(_OWORD *)v80 = *(_OWORD *)v81;
    goto LABEL_65;
  }
  *(_BYTE *)v80 = *(_BYTE *)v81;
  *(_BYTE *)(v80 + 1) = *(_BYTE *)(v81 + 1);
  *(_BYTE *)(v80 + 2) = *(_BYTE *)(v81 + 2);
  v86 = *(void **)(v81 + 8);
  *(_QWORD *)(v80 + 8) = v86;
  v87 = v86;

LABEL_65:
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  *(_BYTE *)(a1 + a3[12]) = *(_BYTE *)(a2 + a3[12]);
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  v88 = a3[14];
  v89 = *(void **)(a1 + v88);
  v90 = *(void **)(a2 + v88);
  *(_QWORD *)(a1 + v88) = v90;
  v91 = v90;

  v92 = a3[15];
  v93 = (void *)(a1 + v92);
  v94 = (void *)(a2 + v92);
  v95 = sub_249B95308();
  v96 = *(_QWORD *)(v95 - 8);
  v97 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v96 + 48);
  v98 = v97(v93, 1, v95);
  v99 = v97(v94, 1, v95);
  if (!v98)
  {
    if (!v99)
    {
      (*(void (**)(void *, void *, uint64_t))(v96 + 24))(v93, v94, v95);
      goto LABEL_71;
    }
    (*(void (**)(void *, uint64_t))(v96 + 8))(v93, v95);
    goto LABEL_70;
  }
  if (v99)
  {
LABEL_70:
    v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2B48);
    memcpy(v93, v94, *(_QWORD *)(*(_QWORD *)(v100 - 8) + 64));
    goto LABEL_71;
  }
  (*(void (**)(void *, void *, uint64_t))(v96 + 16))(v93, v94, v95);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v96 + 56))(v93, 0, 1, v95);
LABEL_71:
  v101 = a3[16];
  v102 = *(void **)(a1 + v101);
  v103 = *(void **)(a2 + v101);
  *(_QWORD *)(a1 + v101) = v103;
  v104 = v103;

  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  return a1;
}

uint64_t sub_249B8FE00(uint64_t a1)
{
  destroy for UserNotification.LegacyCategory();
  return a1;
}

uint64_t sub_249B8FE2C(uint64_t a1)
{

  return a1;
}

uint64_t initializeWithTake for UserNotification(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  _OWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *__dst;
  char *__dsta;
  char *__dstb;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = a3[7];
  v7 = (_OWORD *)(a1 + v6);
  v8 = (_OWORD *)(a2 + v6);
  v9 = (int *)type metadata accessor for UserNotification.LegacyContent(0);
  v10 = *((_QWORD *)v9 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2928);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    v12 = v8[1];
    *v7 = *v8;
    v7[1] = v12;
    *(_OWORD *)((char *)v7 + 27) = *(_OWORD *)((char *)v8 + 27);
    v13 = v9[5];
    __dst = (char *)v7 + v13;
    v14 = (char *)v8 + v13;
    v15 = sub_249B952B4();
    v16 = *(_QWORD *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
      memcpy(__dst, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(__dst, v14, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(__dst, 0, 1, v15);
    }
    v18 = v9[6];
    __dsta = (char *)v7 + v18;
    v19 = (char *)v8 + v18;
    v20 = sub_249B95248();
    v21 = *(_QWORD *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
      memcpy(__dsta, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 32))(__dsta, v19, v20);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(__dsta, 0, 1, v20);
    }
    *((_BYTE *)v7 + v9[7]) = *((_BYTE *)v8 + v9[7]);
    *((_BYTE *)v7 + v9[8]) = *((_BYTE *)v8 + v9[8]);
    (*(void (**)(_OWORD *, _QWORD, uint64_t, int *))(v10 + 56))(v7, 0, 1, v9);
  }
  v23 = a3[8];
  v24 = (_OWORD *)(a1 + v23);
  v25 = (_OWORD *)(a2 + v23);
  v26 = type metadata accessor for UserNotification.LocalizedContent(0);
  v27 = *(_QWORD *)(v26 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
  {
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2938);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
  }
  else
  {
    v29 = v25[1];
    *v24 = *v25;
    v24[1] = v29;
    v24[2] = v25[2];
    v30 = *(int *)(v26 + 28);
    __dstb = (char *)v24 + v30;
    v31 = (char *)v25 + v30;
    v32 = sub_249B95254();
    v33 = *(_QWORD *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
    {
      v34 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
      memcpy(__dstb, v31, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 32))(__dstb, v31, v32);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(__dstb, 0, 1, v32);
    }
    *((_BYTE *)v24 + *(int *)(v26 + 32)) = *((_BYTE *)v25 + *(int *)(v26 + 32));
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  }
  v35 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v35) = *(_BYTE *)(a2 + v35);
  v36 = a3[12];
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  *(_BYTE *)(a1 + v36) = *(_BYTE *)(a2 + v36);
  v37 = a3[14];
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  *(_QWORD *)(a1 + v37) = *(_QWORD *)(a2 + v37);
  v38 = a3[15];
  v39 = (void *)(a1 + v38);
  v40 = (const void *)(a2 + v38);
  v41 = sub_249B95308();
  v42 = *(_QWORD *)(v41 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41))
  {
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2B48);
    memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v42 + 32))(v39, v40, v41);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
  }
  v44 = a3[17];
  *(_QWORD *)(a1 + a3[16]) = *(_QWORD *)(a2 + a3[16]);
  *(_BYTE *)(a1 + v44) = *(_BYTE *)(a2 + v44);
  return a1;
}

uint64_t assignWithTake for UserNotification(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  int *v11;
  uint64_t v12;
  uint64_t (*v13)(_OWORD *, uint64_t, int *);
  int v14;
  int v15;
  __int128 v16;
  uint64_t v17;
  char *v18;
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
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t (*v35)(char *, uint64_t, uint64_t);
  int v36;
  size_t v37;
  void *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t (*v43)(char *, uint64_t, uint64_t);
  int v44;
  size_t v45;
  void *v46;
  uint64_t v47;
  _QWORD *v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(_QWORD *, uint64_t, uint64_t);
  int v53;
  int v54;
  __int128 v55;
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
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t (*v69)(char *, uint64_t, uint64_t);
  int v70;
  size_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t (*v87)(void *, uint64_t, uint64_t);
  int v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *__dst;
  char *__dsta;
  void *__dstb;
  void *__dstc;
  char *__dstd;
  void *__dste;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v7 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v8 = a3[7];
  v9 = (_OWORD *)(a1 + v8);
  v10 = (_OWORD *)(a2 + v8);
  v11 = (int *)type metadata accessor for UserNotification.LegacyContent(0);
  v12 = *((_QWORD *)v11 - 1);
  v13 = *(uint64_t (**)(_OWORD *, uint64_t, int *))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (v15)
    {
      sub_249B833D4((uint64_t)v9, type metadata accessor for UserNotification.LegacyContent);
      goto LABEL_7;
    }
    if (*((_QWORD *)v9 + 1))
    {
      v23 = *((_QWORD *)v10 + 1);
      if (v23)
      {
        *(_QWORD *)v9 = *(_QWORD *)v10;
        *((_QWORD *)v9 + 1) = v23;
        swift_bridgeObjectRelease();
        *((_QWORD *)v9 + 2) = *((_QWORD *)v10 + 2);
        swift_bridgeObjectRelease();
        v24 = *((_QWORD *)v10 + 4);
        *((_QWORD *)v9 + 3) = *((_QWORD *)v10 + 3);
        *((_QWORD *)v9 + 4) = v24;
        swift_bridgeObjectRelease();
        *((_BYTE *)v9 + 40) = *((_BYTE *)v10 + 40);
        *((_BYTE *)v9 + 41) = *((_BYTE *)v10 + 41);
        *((_BYTE *)v9 + 42) = *((_BYTE *)v10 + 42);
        goto LABEL_18;
      }
      sub_249B8FE00((uint64_t)v9);
    }
    v30 = v10[1];
    *v9 = *v10;
    v9[1] = v30;
    *(_OWORD *)((char *)v9 + 27) = *(_OWORD *)((char *)v10 + 27);
LABEL_18:
    v31 = v11[5];
    v32 = (char *)v9 + v31;
    v33 = (char *)v10 + v31;
    v34 = sub_249B952B4();
    v94 = *(_QWORD *)(v34 - 8);
    v35 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v94 + 48);
    __dstb = v32;
    LODWORD(v32) = v35(v32, 1, v34);
    v36 = v35(v33, 1, v34);
    if ((_DWORD)v32)
    {
      if (v36)
      {
        v37 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500) - 8) + 64);
        v38 = __dstb;
LABEL_23:
        memcpy(v38, v33, v37);
        goto LABEL_26;
      }
      (*(void (**)(void *, char *, uint64_t))(v94 + 32))(__dstb, v33, v34);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v94 + 56))(__dstb, 0, 1, v34);
    }
    else
    {
      if (v36)
      {
        (*(void (**)(void *, uint64_t))(v94 + 8))(__dstb, v34);
        v37 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500) - 8) + 64);
        v38 = __dstb;
        goto LABEL_23;
      }
      (*(void (**)(void *, char *, uint64_t))(v94 + 40))(__dstb, v33, v34);
    }
LABEL_26:
    v39 = v11[6];
    v40 = (char *)v9 + v39;
    v41 = (char *)v10 + v39;
    v42 = sub_249B95248();
    v95 = *(_QWORD *)(v42 - 8);
    v43 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v95 + 48);
    __dstc = v40;
    LODWORD(v40) = v43(v40, 1, v42);
    v44 = v43(v41, 1, v42);
    if ((_DWORD)v40)
    {
      if (!v44)
      {
        (*(void (**)(void *, char *, uint64_t))(v95 + 32))(__dstc, v41, v42);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v95 + 56))(__dstc, 0, 1, v42);
        goto LABEL_34;
      }
      v45 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508) - 8) + 64);
      v46 = __dstc;
    }
    else
    {
      if (!v44)
      {
        (*(void (**)(void *, char *, uint64_t))(v95 + 40))(__dstc, v41, v42);
        goto LABEL_34;
      }
      (*(void (**)(void *, uint64_t))(v95 + 8))(__dstc, v42);
      v45 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508) - 8) + 64);
      v46 = __dstc;
    }
    memcpy(v46, v41, v45);
LABEL_34:
    *((_BYTE *)v9 + v11[7]) = *((_BYTE *)v10 + v11[7]);
    *((_BYTE *)v9 + v11[8]) = *((_BYTE *)v10 + v11[8]);
    goto LABEL_35;
  }
  if (v15)
  {
LABEL_7:
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2928);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    goto LABEL_35;
  }
  v16 = v10[1];
  *v9 = *v10;
  v9[1] = v16;
  *(_OWORD *)((char *)v9 + 27) = *(_OWORD *)((char *)v10 + 27);
  v17 = v11[5];
  __dst = (char *)v9 + v17;
  v18 = (char *)v10 + v17;
  v19 = sub_249B952B4();
  v20 = *(_QWORD *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
    memcpy(__dst, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(__dst, v18, v19);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(__dst, 0, 1, v19);
  }
  v25 = v11[6];
  __dsta = (char *)v9 + v25;
  v26 = (char *)v10 + v25;
  v27 = sub_249B95248();
  v28 = *(_QWORD *)(v27 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
    memcpy(__dsta, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v28 + 32))(__dsta, v26, v27);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(__dsta, 0, 1, v27);
  }
  *((_BYTE *)v9 + v11[7]) = *((_BYTE *)v10 + v11[7]);
  *((_BYTE *)v9 + v11[8]) = *((_BYTE *)v10 + v11[8]);
  (*(void (**)(_OWORD *, _QWORD, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
LABEL_35:
  v47 = a3[8];
  v48 = (_QWORD *)(a1 + v47);
  v49 = (_QWORD *)(a2 + v47);
  v50 = type metadata accessor for UserNotification.LocalizedContent(0);
  v51 = *(_QWORD *)(v50 - 8);
  v52 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v51 + 48);
  v53 = v52(v48, 1, v50);
  v54 = v52(v49, 1, v50);
  if (!v53)
  {
    if (v54)
    {
      sub_249B833D4((uint64_t)v48, type metadata accessor for UserNotification.LocalizedContent);
      goto LABEL_41;
    }
    v62 = v49[1];
    *v48 = *v49;
    v48[1] = v62;
    swift_bridgeObjectRelease();
    v63 = v49[3];
    v48[2] = v49[2];
    v48[3] = v63;
    swift_bridgeObjectRelease();
    v64 = v49[5];
    v48[4] = v49[4];
    v48[5] = v64;
    swift_bridgeObjectRelease();
    v65 = *(int *)(v50 + 28);
    v66 = (char *)v48 + v65;
    v67 = (char *)v49 + v65;
    v68 = sub_249B95254();
    v96 = *(_QWORD *)(v68 - 8);
    v69 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v96 + 48);
    __dste = v66;
    LODWORD(v66) = v69(v66, 1, v68);
    v70 = v69(v67, 1, v68);
    if ((_DWORD)v66)
    {
      if (!v70)
      {
        (*(void (**)(void *, char *, uint64_t))(v96 + 32))(__dste, v67, v68);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v96 + 56))(__dste, 0, 1, v68);
        goto LABEL_52;
      }
      v71 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_2544C2660) - 8) + 64);
      v72 = __dste;
    }
    else
    {
      if (!v70)
      {
        (*(void (**)(void *, char *, uint64_t))(v96 + 40))(__dste, v67, v68);
        goto LABEL_52;
      }
      (*(void (**)(void *, uint64_t))(v96 + 8))(__dste, v68);
      v71 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(qword_2544C2660) - 8) + 64);
      v72 = __dste;
    }
    memcpy(v72, v67, v71);
LABEL_52:
    *((_BYTE *)v48 + *(int *)(v50 + 32)) = *((_BYTE *)v49 + *(int *)(v50 + 32));
    goto LABEL_53;
  }
  if (v54)
  {
LABEL_41:
    v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2938);
    memcpy(v48, v49, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
    goto LABEL_53;
  }
  v55 = *((_OWORD *)v49 + 1);
  *(_OWORD *)v48 = *(_OWORD *)v49;
  *((_OWORD *)v48 + 1) = v55;
  *((_OWORD *)v48 + 2) = *((_OWORD *)v49 + 2);
  v56 = *(int *)(v50 + 28);
  __dstd = (char *)v48 + v56;
  v57 = (char *)v49 + v56;
  v58 = sub_249B95254();
  v59 = *(_QWORD *)(v58 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48))(v57, 1, v58))
  {
    v60 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    memcpy(__dstd, v57, *(_QWORD *)(*(_QWORD *)(v60 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v59 + 32))(__dstd, v57, v58);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v59 + 56))(__dstd, 0, 1, v58);
  }
  *((_BYTE *)v48 + *(int *)(v50 + 32)) = *((_BYTE *)v49 + *(int *)(v50 + 32));
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v51 + 56))(v48, 0, 1, v50);
LABEL_53:
  v73 = a3[9];
  v74 = a1 + v73;
  v75 = a2 + v73;
  v76 = *(void **)(a1 + v73 + 8);
  if (v76 == (void *)1)
  {
LABEL_56:
    *(_OWORD *)v74 = *(_OWORD *)v75;
    goto LABEL_58;
  }
  v77 = *(_QWORD *)(v75 + 8);
  if (v77 == 1)
  {
    sub_249B8FE2C(v74);
    goto LABEL_56;
  }
  *(_BYTE *)v74 = *(_BYTE *)v75;
  *(_BYTE *)(v74 + 1) = *(_BYTE *)(v75 + 1);
  *(_BYTE *)(v74 + 2) = *(_BYTE *)(v75 + 2);
  *(_QWORD *)(v74 + 8) = v77;

LABEL_58:
  v78 = a3[11];
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  *(_BYTE *)(a1 + v78) = *(_BYTE *)(a2 + v78);
  v79 = a3[13];
  *(_BYTE *)(a1 + a3[12]) = *(_BYTE *)(a2 + a3[12]);
  *(_QWORD *)(a1 + v79) = *(_QWORD *)(a2 + v79);
  v80 = a3[14];
  v81 = *(void **)(a1 + v80);
  *(_QWORD *)(a1 + v80) = *(_QWORD *)(a2 + v80);

  v82 = a3[15];
  v83 = (void *)(a1 + v82);
  v84 = (void *)(a2 + v82);
  v85 = sub_249B95308();
  v86 = *(_QWORD *)(v85 - 8);
  v87 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v86 + 48);
  v88 = v87(v83, 1, v85);
  v89 = v87(v84, 1, v85);
  if (!v88)
  {
    if (!v89)
    {
      (*(void (**)(void *, void *, uint64_t))(v86 + 40))(v83, v84, v85);
      goto LABEL_64;
    }
    (*(void (**)(void *, uint64_t))(v86 + 8))(v83, v85);
    goto LABEL_63;
  }
  if (v89)
  {
LABEL_63:
    v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2B48);
    memcpy(v83, v84, *(_QWORD *)(*(_QWORD *)(v90 - 8) + 64));
    goto LABEL_64;
  }
  (*(void (**)(void *, void *, uint64_t))(v86 + 32))(v83, v84, v85);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v86 + 56))(v83, 0, 1, v85);
LABEL_64:
  v91 = a3[16];
  v92 = *(void **)(a1 + v91);
  *(_QWORD *)(a1 + v91) = *(_QWORD *)(a2 + v91);

  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserNotification()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_249B90B18(char *a1, uint64_t a2, int *a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2928);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = a3[7];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2938);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
      {
        v10 = v12;
        v11 = a3[8];
      }
      else
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2B48);
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a3[15];
      }
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(&a1[v11], a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for UserNotification()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_249B90BF4(char *result, uint64_t a2, int a3, int *a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2928);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = a4[7];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2938);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == a3)
      {
        v10 = v12;
        v11 = a4[8];
      }
      else
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2B48);
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a4[15];
      }
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

void sub_249B90CC0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_249B90DFC(319, &qword_2544C2930, (void (*)(uint64_t))type metadata accessor for UserNotification.LegacyContent);
  if (v0 <= 0x3F)
  {
    sub_249B90DFC(319, qword_2544C2940, (void (*)(uint64_t))type metadata accessor for UserNotification.LocalizedContent);
    if (v1 <= 0x3F)
    {
      sub_249B90DFC(319, &qword_2544C2B60, (void (*)(uint64_t))MEMORY[0x24BEE63B8]);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_249B90DFC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_249B95518();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for UserNotification.Identifier(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_249B952B4();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = *(int *)(a3 + 24);
    v14 = (uint64_t *)((char *)v4 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for UserNotification.Identifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_249B952B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for UserNotification.Identifier(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_249B952B4();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 24);
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for UserNotification.Identifier(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_249B952B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for UserNotification.Identifier(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_249B952B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *assignWithTake for UserNotification.Identifier(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_249B952B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserNotification.Identifier()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_249B911C8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_249B952B4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for UserNotification.Identifier()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_249B91250(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_249B952B4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_249B912C4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_249B952B4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void destroy for UserNotification.Behavior(uint64_t a1)
{

}

uint64_t _s25UserNotificationsServices16UserNotificationV8BehaviorVwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  v3 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v3;
  v4 = v3;
  return a1;
}

uint64_t assignWithCopy for UserNotification.Behavior(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  v3 = *(void **)(a1 + 8);
  v4 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v5 = v4;

  return a1;
}

uint64_t assignWithTake for UserNotification.Behavior(uint64_t a1, uint64_t a2)
{
  void *v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  v3 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for UserNotification.Behavior(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UserNotification.Behavior(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for UserNotification.Behavior()
{
  return &type metadata for UserNotification.Behavior;
}

_QWORD *initializeBufferWithCopyOfBuffer for UserNotification.LocalizedContent(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *__dst;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
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
    v10 = *(int *)(a3 + 28);
    __dst = (char *)a1 + v10;
    v11 = (char *)a2 + v10;
    a1[4] = a2[4];
    a1[5] = v9;
    v12 = sub_249B95254();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v14(v11, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
      memcpy(__dst, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    *((_BYTE *)v4 + *(int *)(a3 + 32)) = *((_BYTE *)a2 + *(int *)(a3 + 32));
  }
  return v4;
}

uint64_t destroy for UserNotification.LocalizedContent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_249B95254();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

_QWORD *initializeWithCopy for UserNotification.LocalizedContent(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;

  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  v7 = a2[5];
  v8 = *(int *)(a3 + 28);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  a1[4] = a2[4];
  a1[5] = v7;
  v11 = sub_249B95254();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v13(v10, 1, v11))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *((_BYTE *)a1 + *(int *)(a3 + 32)) = *((_BYTE *)a2 + *(int *)(a3 + 32));
  return a1;
}

_QWORD *assignWithCopy for UserNotification.LocalizedContent(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;

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
  v6 = *(int *)(a3 + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_249B95254();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *((_BYTE *)a1 + *(int *)(a3 + 32)) = *((_BYTE *)a2 + *(int *)(a3 + 32));
  return a1;
}

_OWORD *initializeWithTake for UserNotification.LocalizedContent(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = *(int *)(a3 + 28);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_249B95254();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *((_BYTE *)a1 + *(int *)(a3 + 32)) = *((_BYTE *)a2 + *(int *)(a3 + 32));
  return a1;
}

_QWORD *assignWithTake for UserNotification.LocalizedContent(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;

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
  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_249B95254();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  *((_BYTE *)a1 + *(int *)(a3 + 32)) = *((_BYTE *)a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t getEnumTagSinglePayload for UserNotification.LocalizedContent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_249B91B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for UserNotification.LocalizedContent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_249B91C00(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2544C2660);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

void sub_249B91C78()
{
  unint64_t v0;

  sub_249B90DFC(319, (unint64_t *)&qword_2544C2918, (void (*)(uint64_t))MEMORY[0x24BDCC5A8]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

ValueMetadata *type metadata accessor for UserNotification.IncomingPersistence()
{
  return &type metadata for UserNotification.IncomingPersistence;
}

uint64_t getEnumTagSinglePayload for UserNotification.IncomingPriority(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for UserNotification.IncomingPriority(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_249B91DFC + 4 * byte_249B977E9[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_249B91E30 + 4 * byte_249B977E4[v4]))();
}

uint64_t sub_249B91E30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B91E38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x249B91E40);
  return result;
}

uint64_t sub_249B91E4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x249B91E54);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_249B91E58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B91E60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UserNotification.IncomingPriority()
{
  return &type metadata for UserNotification.IncomingPriority;
}

ValueMetadata *type metadata accessor for UserNotification.SecureAttachments()
{
  return &type metadata for UserNotification.SecureAttachments;
}

ValueMetadata *type metadata accessor for UserNotification.Origin()
{
  return &type metadata for UserNotification.Origin;
}

uint64_t initializeBufferWithCopyOfBuffer for UserNotification.LegacyContent(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v9 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    if (v7)
    {
      *(_QWORD *)a1 = *a2;
      *(_QWORD *)(a1 + 8) = v7;
      v8 = a2[3];
      *(_QWORD *)(a1 + 16) = a2[2];
      *(_QWORD *)(a1 + 24) = v8;
      *(_QWORD *)(a1 + 32) = a2[4];
      *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
      *(_WORD *)(a1 + 41) = *(_WORD *)((char *)a2 + 41);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v10 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v10;
      *(_OWORD *)(a1 + 27) = *(_OWORD *)((char *)a2 + 27);
    }
    v11 = a3[5];
    v12 = (void *)(a1 + v11);
    v13 = (char *)a2 + v11;
    v14 = sub_249B952B4();
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
    v17 = a3[6];
    v18 = (void *)(a1 + v17);
    v19 = (char *)a2 + v17;
    v20 = sub_249B95248();
    v21 = *(_QWORD *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    v23 = a3[8];
    *(_BYTE *)(a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *(_BYTE *)(a1 + v23) = *((_BYTE *)a2 + v23);
  }
  return a1;
}

uint64_t destroy for UserNotification.LegacyContent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  if (*(_QWORD *)(a1 + 8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_249B952B4();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v7 = a1 + *(int *)(a2 + 24);
  v8 = sub_249B95248();
  v9 = *(_QWORD *)(v8 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  return result;
}

uint64_t initializeWithCopy for UserNotification.LegacyContent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = *(_QWORD *)(a2 + 8);
  if (v6)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v6;
    v7 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v7;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    *(_WORD *)(a1 + 41) = *(_WORD *)(a2 + 41);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    *(_OWORD *)(a1 + 27) = *(_OWORD *)(a2 + 27);
  }
  v9 = a3[5];
  v10 = (void *)(a1 + v9);
  v11 = (const void *)(a2 + v9);
  v12 = sub_249B952B4();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  v15 = a3[6];
  v16 = (void *)(a1 + v15);
  v17 = (const void *)(a2 + v15);
  v18 = sub_249B95248();
  v19 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v19 + 16))(v16, v17, v18);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  v21 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v21) = *(_BYTE *)(a2 + v21);
  return a1;
}

uint64_t assignWithCopy for UserNotification.LegacyContent(uint64_t a1, __int128 *a2, int *a3)
{
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void *, uint64_t, uint64_t);
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(void *, uint64_t, uint64_t);
  int v26;
  int v27;
  uint64_t v28;

  v6 = *((_QWORD *)a2 + 1);
  if (*(_QWORD *)(a1 + 8))
  {
    if (v6)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
      *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
      *(_BYTE *)(a1 + 41) = *((_BYTE *)a2 + 41);
      *(_BYTE *)(a1 + 42) = *((_BYTE *)a2 + 42);
    }
    else
    {
      sub_249B8FE00(a1);
      v7 = *(__int128 *)((char *)a2 + 27);
      v8 = a2[1];
      *(_OWORD *)a1 = *a2;
      *(_OWORD *)(a1 + 16) = v8;
      *(_OWORD *)(a1 + 27) = v7;
    }
  }
  else if (v6)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
    *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
    *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
    *(_BYTE *)(a1 + 41) = *((_BYTE *)a2 + 41);
    *(_BYTE *)(a1 + 42) = *((_BYTE *)a2 + 42);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v9 = *a2;
    v10 = a2[1];
    *(_OWORD *)(a1 + 27) = *(__int128 *)((char *)a2 + 27);
    *(_OWORD *)a1 = v9;
    *(_OWORD *)(a1 + 16) = v10;
  }
  v11 = a3[5];
  v12 = (void *)(a1 + v11);
  v13 = (char *)a2 + v11;
  v14 = sub_249B952B4();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  v17 = v16(v12, 1, v14);
  v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v18)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
LABEL_13:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(void *, char *, uint64_t))(v15 + 24))(v12, v13, v14);
LABEL_14:
  v20 = a3[6];
  v21 = (void *)(a1 + v20);
  v22 = (char *)a2 + v20;
  v23 = sub_249B95248();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v24 + 48);
  v26 = v25(v21, 1, v23);
  v27 = v25(v22, 1, v23);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(void *, char *, uint64_t))(v24 + 24))(v21, v22, v23);
      goto LABEL_20;
    }
    (*(void (**)(void *, uint64_t))(v24 + 8))(v21, v23);
    goto LABEL_19;
  }
  if (v27)
  {
LABEL_19:
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(void *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
LABEL_20:
  *(_BYTE *)(a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *(_BYTE *)(a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  return a1;
}

_OWORD *initializeWithTake for UserNotification.LegacyContent(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  *(_OWORD *)((char *)a1 + 27) = *(_OWORD *)((char *)a2 + 27);
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_249B952B4();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[6];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = sub_249B95248();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  v19 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *((_BYTE *)a1 + v19) = *((_BYTE *)a2 + v19);
  return a1;
}

uint64_t assignWithTake for UserNotification.LegacyContent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(void *, uint64_t, uint64_t);
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;

  if (*(_QWORD *)(a1 + 8))
  {
    v6 = *(_QWORD *)(a2 + 8);
    if (v6)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = v6;
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      swift_bridgeObjectRelease();
      v7 = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 32) = v7;
      swift_bridgeObjectRelease();
      *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
      *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
      *(_BYTE *)(a1 + 42) = *(_BYTE *)(a2 + 42);
      goto LABEL_6;
    }
    sub_249B8FE00(a1);
  }
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  *(_OWORD *)(a1 + 27) = *(_OWORD *)(a2 + 27);
LABEL_6:
  v9 = a3[5];
  v10 = (void *)(a1 + v9);
  v11 = (void *)(a2 + v9);
  v12 = sub_249B952B4();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 32))(v10, v11, v12);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v16)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
LABEL_11:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 40))(v10, v11, v12);
LABEL_12:
  v18 = a3[6];
  v19 = (void *)(a1 + v18);
  v20 = (void *)(a2 + v18);
  v21 = sub_249B95248();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v22 + 48);
  v24 = v23(v19, 1, v21);
  v25 = v23(v20, 1, v21);
  if (!v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 40))(v19, v20, v21);
      goto LABEL_18;
    }
    (*(void (**)(void *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_17;
  }
  if (v25)
  {
LABEL_17:
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_18;
  }
  (*(void (**)(void *, void *, uint64_t))(v22 + 32))(v19, v20, v21);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
LABEL_18:
  v27 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_BYTE *)(a1 + v27) = *(_BYTE *)(a2 + v27);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserNotification.LegacyContent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_249B929E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
    v10 = *(_QWORD *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
    {
      v11 = v9;
      v12 = *(int *)(a3 + 20);
    }
    else
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
      v10 = *(_QWORD *)(v11 - 8);
      v12 = *(int *)(a3 + 24);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for UserNotification.LegacyContent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_249B92AA0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2500);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C2508);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 24);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_249B92B44()
{
  unint64_t v0;
  unint64_t v1;

  sub_249B90DFC(319, &qword_2544C2920, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v0 <= 0x3F)
  {
    sub_249B90DFC(319, &qword_2544C2910, (void (*)(uint64_t))MEMORY[0x24BDCBDE0]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for UserNotification.LegacyContent.IdentityImageStyle()
{
  return &type metadata for UserNotification.LegacyContent.IdentityImageStyle;
}

uint64_t destroy for UserNotification.LegacyCategory()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserNotification.LegacyCategory(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_WORD *)(a1 + 41) = *(_WORD *)(a2 + 41);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UserNotification.LegacyCategory(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  *(_BYTE *)(a1 + 42) = *(_BYTE *)(a2 + 42);
  return a1;
}

__n128 __swift_memcpy43_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 27) = *(_OWORD *)(a2 + 27);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for UserNotification.LegacyCategory(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  *(_BYTE *)(a1 + 42) = *(_BYTE *)(a2 + 42);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserNotification.LegacyCategory(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 43))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UserNotification.LegacyCategory(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 42) = 0;
    *(_WORD *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 43) = 1;
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
    *(_BYTE *)(result + 43) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserNotification.LegacyCategory()
{
  return &type metadata for UserNotification.LegacyCategory;
}

uint64_t destroy for UserNotification.LegacyAction()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserNotification.LegacyAction(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UserNotification.LegacyAction(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for UserNotification.LegacyAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserNotification.LegacyAction(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 57))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UserNotification.LegacyAction(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 57) = 1;
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
    *(_BYTE *)(result + 57) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserNotification.LegacyAction()
{
  return &type metadata for UserNotification.LegacyAction;
}

uint64_t storeEnumTagSinglePayload for UserNotification.LegacyAction.Style(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_249B93124 + 4 * byte_249B977F3[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_249B93158 + 4 * byte_249B977EE[v4]))();
}

uint64_t sub_249B93158(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B93160(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x249B93168);
  return result;
}

uint64_t sub_249B93174(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x249B9317CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_249B93180(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B93188(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UserNotification.LegacyAction.Style()
{
  return &type metadata for UserNotification.LegacyAction.Style;
}

ValueMetadata *type metadata accessor for UserNotification.LegacyAction.ActionType()
{
  return &type metadata for UserNotification.LegacyAction.ActionType;
}

ValueMetadata *type metadata accessor for UserNotification.LegacyAction.CodingKeys()
{
  return &type metadata for UserNotification.LegacyAction.CodingKeys;
}

uint64_t _s25UserNotificationsServices16UserNotificationV6OriginOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s25UserNotificationsServices16UserNotificationV6OriginOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_249B932A8 + 4 * byte_249B977FD[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_249B932DC + 4 * byte_249B977F8[v4]))();
}

uint64_t sub_249B932DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B932E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x249B932ECLL);
  return result;
}

uint64_t sub_249B932F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x249B93300);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_249B93304(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B9330C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UserNotification.LegacyCategory.CodingKeys()
{
  return &type metadata for UserNotification.LegacyCategory.CodingKeys;
}

uint64_t _s25UserNotificationsServices16UserNotificationV12LegacyActionV10ActionTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s25UserNotificationsServices16UserNotificationV12LegacyActionV10ActionTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_249B93404 + 4 * byte_249B97807[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_249B93438 + 4 * byte_249B97802[v4]))();
}

uint64_t sub_249B93438(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B93440(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x249B93448);
  return result;
}

uint64_t sub_249B93454(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x249B9345CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_249B93460(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B93468(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UserNotification.LegacyContent.CodingKeys()
{
  return &type metadata for UserNotification.LegacyContent.CodingKeys;
}

ValueMetadata *type metadata accessor for UserNotification.SecureAttachments.CodingKeys()
{
  return &type metadata for UserNotification.SecureAttachments.CodingKeys;
}

ValueMetadata *type metadata accessor for UserNotification.LocalizedContent.CodingKeys()
{
  return &type metadata for UserNotification.LocalizedContent.CodingKeys;
}

ValueMetadata *type metadata accessor for UserNotification.Behavior.CodingKeys()
{
  return &type metadata for UserNotification.Behavior.CodingKeys;
}

uint64_t _s25UserNotificationsServices16UserNotificationV19IncomingPersistenceOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_249B93508 + 4 * byte_249B97811[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_249B9353C + 4 * byte_249B9780C[v4]))();
}

uint64_t sub_249B9353C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B93544(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x249B9354CLL);
  return result;
}

uint64_t sub_249B93558(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x249B93560);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_249B93564(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B9356C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UserNotification.Identifier.CodingKeys()
{
  return &type metadata for UserNotification.Identifier.CodingKeys;
}

uint64_t _s25UserNotificationsServices16UserNotificationV16LocalizedContentV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s25UserNotificationsServices16UserNotificationV16LocalizedContentV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_249B93664 + 4 * byte_249B9781B[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_249B93698 + 4 * byte_249B97816[v4]))();
}

uint64_t sub_249B93698(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B936A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x249B936A8);
  return result;
}

uint64_t sub_249B936B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x249B936BCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_249B936C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B936C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UserNotification.CodingError()
{
  return &type metadata for UserNotification.CodingError;
}

uint64_t getEnumTagSinglePayload for UserNotification.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 10;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 10;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 10;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for UserNotification.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_249B937C0 + 4 * byte_249B97825[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_249B937F4 + 4 * byte_249B97820[v4]))();
}

uint64_t sub_249B937F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B937FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x249B93804);
  return result;
}

uint64_t sub_249B93810(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x249B93818);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_249B9381C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249B93824(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UserNotification.CodingKeys()
{
  return &type metadata for UserNotification.CodingKeys;
}

unint64_t sub_249B93844()
{
  unint64_t result;

  result = qword_2578C2638;
  if (!qword_2578C2638)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B988DC, &type metadata for UserNotification.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C2638);
  }
  return result;
}

unint64_t sub_249B9388C()
{
  unint64_t result;

  result = qword_2578C2640;
  if (!qword_2578C2640)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98944, &type metadata for UserNotification.CodingError);
    atomic_store(result, (unint64_t *)&qword_2578C2640);
  }
  return result;
}

unint64_t sub_249B938D4()
{
  unint64_t result;

  result = qword_2578C2648;
  if (!qword_2578C2648)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B989FC, &type metadata for UserNotification.Identifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C2648);
  }
  return result;
}

unint64_t sub_249B9391C()
{
  unint64_t result;

  result = qword_2578C2650;
  if (!qword_2578C2650)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98AEC, &type metadata for UserNotification.Behavior.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C2650);
  }
  return result;
}

unint64_t sub_249B93964()
{
  unint64_t result;

  result = qword_2578C2658;
  if (!qword_2578C2658)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98BDC, &type metadata for UserNotification.LocalizedContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C2658);
  }
  return result;
}

unint64_t sub_249B939AC()
{
  unint64_t result;

  result = qword_2578C2660;
  if (!qword_2578C2660)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98CE4, &type metadata for UserNotification.LegacyContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C2660);
  }
  return result;
}

unint64_t sub_249B939F4()
{
  unint64_t result;

  result = qword_2578C2668;
  if (!qword_2578C2668)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98D9C, &type metadata for UserNotification.LegacyCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C2668);
  }
  return result;
}

unint64_t sub_249B93A3C()
{
  unint64_t result;

  result = qword_2578C2670;
  if (!qword_2578C2670)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98E54, &type metadata for UserNotification.LegacyAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C2670);
  }
  return result;
}

unint64_t sub_249B93A84()
{
  unint64_t result;

  result = qword_2578C2678;
  if (!qword_2578C2678)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98DC4, &type metadata for UserNotification.LegacyAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C2678);
  }
  return result;
}

unint64_t sub_249B93ACC()
{
  unint64_t result;

  result = qword_2578C2680;
  if (!qword_2578C2680)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98DEC, &type metadata for UserNotification.LegacyAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C2680);
  }
  return result;
}

unint64_t sub_249B93B14()
{
  unint64_t result;

  result = qword_2578C2688;
  if (!qword_2578C2688)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98D0C, &type metadata for UserNotification.LegacyCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C2688);
  }
  return result;
}

unint64_t sub_249B93B5C()
{
  unint64_t result;

  result = qword_2578C2690;
  if (!qword_2578C2690)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98D34, &type metadata for UserNotification.LegacyCategory.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C2690);
  }
  return result;
}

unint64_t sub_249B93BA4()
{
  unint64_t result;

  result = qword_2578C2698;
  if (!qword_2578C2698)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98C54, &type metadata for UserNotification.LegacyContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C2698);
  }
  return result;
}

unint64_t sub_249B93BEC()
{
  unint64_t result;

  result = qword_2578C26A0;
  if (!qword_2578C26A0)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98C7C, &type metadata for UserNotification.LegacyContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C26A0);
  }
  return result;
}

unint64_t sub_249B93C34()
{
  unint64_t result;

  result = qword_2578C26A8;
  if (!qword_2578C26A8)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98C04, &type metadata for UserNotification.SecureAttachments.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C26A8);
  }
  return result;
}

unint64_t sub_249B93C7C()
{
  unint64_t result;

  result = qword_2578C26B0;
  if (!qword_2578C26B0)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98C2C, &type metadata for UserNotification.SecureAttachments.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C26B0);
  }
  return result;
}

unint64_t sub_249B93CC4()
{
  unint64_t result;

  result = qword_2578C26B8;
  if (!qword_2578C26B8)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98B14, &type metadata for UserNotification.LocalizedContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C26B8);
  }
  return result;
}

unint64_t sub_249B93D0C()
{
  unint64_t result;

  result = qword_2578C26C0;
  if (!qword_2578C26C0)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98B3C, &type metadata for UserNotification.LocalizedContent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C26C0);
  }
  return result;
}

unint64_t sub_249B93D54()
{
  unint64_t result;

  result = qword_2578C26C8;
  if (!qword_2578C26C8)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98A24, &type metadata for UserNotification.Behavior.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C26C8);
  }
  return result;
}

unint64_t sub_249B93D9C()
{
  unint64_t result;

  result = qword_2578C26D0;
  if (!qword_2578C26D0)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98A4C, &type metadata for UserNotification.Behavior.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C26D0);
  }
  return result;
}

unint64_t sub_249B93DE4()
{
  unint64_t result;

  result = qword_2578C26D8;
  if (!qword_2578C26D8)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B9896C, &type metadata for UserNotification.Identifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C26D8);
  }
  return result;
}

unint64_t sub_249B93E2C()
{
  unint64_t result;

  result = qword_2578C26E0;
  if (!qword_2578C26E0)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98994, &type metadata for UserNotification.Identifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C26E0);
  }
  return result;
}

unint64_t sub_249B93E74()
{
  unint64_t result;

  result = qword_2578C26E8;
  if (!qword_2578C26E8)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B98814, &type metadata for UserNotification.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C26E8);
  }
  return result;
}

unint64_t sub_249B93EBC()
{
  unint64_t result;

  result = qword_2578C26F0;
  if (!qword_2578C26F0)
  {
    result = MEMORY[0x24BCFFA80](&unk_249B9883C, &type metadata for UserNotification.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578C26F0);
  }
  return result;
}

uint64_t sub_249B93F00()
{
  unint64_t v0;

  v0 = sub_249B95578();
  swift_bridgeObjectRelease();
  if (v0 >= 0xB)
    return 11;
  else
    return v0;
}

uint64_t sub_249B93F48()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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
  void *v13;
  uint64_t result;
  void *v15;
  uint64_t v16;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544C2B68);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_249B952FC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_249B952D8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  v12 = (void *)sub_249B95380();
  objc_msgSend(v11, sel_setDateFormat_, v12);

  sub_249B952C0();
  v13 = (void *)sub_249B952CC();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  objc_msgSend(v11, sel_setLocale_, v13);

  sub_249B952E4();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    v15 = (void *)sub_249B952F0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    objc_msgSend(v11, sel_setTimeZone_, v15);

    return (uint64_t)v11;
  }
  return result;
}

uint64_t sub_249B9414C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000011 && a2 == 0x8000000249B99910 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000249B996A0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_249B95644();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_249B94288()
{
  unint64_t v0;

  v0 = sub_249B95578();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_249B942CC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x79726F6765746163 && a2 == 0xE800000000000000;
  if (v2 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746144746E657665 && a2 == 0xE900000000000065 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7961446C6C417369 && a2 == 0xED0000746E657645 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000249B99930)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_249B95644();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_249B94514(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x736E6F69746361 && a2 == 0xE700000000000000 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000249B99950 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000249B99970 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x657263536B636F6CLL && a2 == 0xEE00796C6E4F6E65 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x8000000249B99990)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_249B95644();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_249B947AC(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C797473 && a2 == 0xE500000000000000 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x79546E6F69746361 && a2 == 0xEA00000000006570 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x63616C5074786574 && a2 == 0xEF7265646C6F6865 || (sub_249B95644() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000249B999B0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v5 = sub_249B95644();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

unint64_t sub_249B94A50()
{
  unint64_t result;

  result = qword_2578C26F8;
  if (!qword_2578C26F8)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.LegacyAction.ActionType, &type metadata for UserNotification.LegacyAction.ActionType);
    atomic_store(result, (unint64_t *)&qword_2578C26F8);
  }
  return result;
}

unint64_t sub_249B94A94()
{
  unint64_t result;

  result = qword_2578C2700;
  if (!qword_2578C2700)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.LegacyAction.Style, &type metadata for UserNotification.LegacyAction.Style);
    atomic_store(result, (unint64_t *)&qword_2578C2700);
  }
  return result;
}

unint64_t sub_249B94AD8()
{
  unint64_t result;

  result = qword_2578C2708;
  if (!qword_2578C2708)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.LegacyContent.IdentityImageStyle, &type metadata for UserNotification.LegacyContent.IdentityImageStyle);
    atomic_store(result, (unint64_t *)&qword_2578C2708);
  }
  return result;
}

unint64_t sub_249B94B1C()
{
  unint64_t result;

  result = qword_2578C2710;
  if (!qword_2578C2710)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.Origin, &type metadata for UserNotification.Origin);
    atomic_store(result, (unint64_t *)&qword_2578C2710);
  }
  return result;
}

unint64_t sub_249B94B60()
{
  unint64_t result;

  result = qword_2578C2718;
  if (!qword_2578C2718)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.IncomingPriority, &type metadata for UserNotification.IncomingPriority);
    atomic_store(result, (unint64_t *)&qword_2578C2718);
  }
  return result;
}

unint64_t sub_249B94BA4()
{
  unint64_t result;

  result = qword_2578C2720;
  if (!qword_2578C2720)
  {
    result = MEMORY[0x24BCFFA80](&protocol conformance descriptor for UserNotification.IncomingPersistence, &type metadata for UserNotification.IncomingPersistence);
    atomic_store(result, (unint64_t *)&qword_2578C2720);
  }
  return result;
}

uint64_t sub_249B94BE8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_249B94C0C()
{
  return swift_deallocObject();
}

uint64_t sub_249B94C1C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_249B94C54(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t UNSNotificationList.list.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_bridgeObjectRetain();
}

uint64_t UNSNotificationList.list.setter(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t result;

  v2 = *a1;
  result = swift_bridgeObjectRelease();
  *v1 = v2;
  return result;
}

uint64_t (*UNSNotificationList.list.modify())()
{
  return nullsub_1;
}

_QWORD *UNSNotificationList.init(list:)@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

unint64_t UNSNotificationList.debugDescription.getter()
{
  return 0xD000000000000015;
}

unint64_t sub_249B94D2C()
{
  return 0xD000000000000015;
}

ValueMetadata *type metadata accessor for UNSNotificationList()
{
  return &type metadata for UNSNotificationList;
}

uint64_t sub_249B95224()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_249B95230()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_249B9523C()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_249B95248()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_249B95254()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_249B95260()
{
  return MEMORY[0x24BDCC618]();
}

uint64_t sub_249B9526C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_249B95278()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_249B95284()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_249B95290()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_249B9529C()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_249B952A8()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_249B952B4()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_249B952C0()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_249B952CC()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_249B952D8()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_249B952E4()
{
  return MEMORY[0x24BDCF4C8]();
}

uint64_t sub_249B952F0()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_249B952FC()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_249B95308()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_249B95314()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_249B95320()
{
  return MEMORY[0x24BDC62F0]();
}

uint64_t sub_249B9532C()
{
  return MEMORY[0x24BDC6AD8]();
}

uint64_t sub_249B95338()
{
  return MEMORY[0x24BDC6AF0]();
}

uint64_t sub_249B95344()
{
  return MEMORY[0x24BDC6AF8]();
}

uint64_t sub_249B95350()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_249B9535C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_249B95368()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_249B95374()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_249B95380()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_249B9538C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_249B95398()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_249B953A4()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_249B953B0()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_249B953BC()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_249B953C8()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_249B953D4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_249B953E0()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_249B953EC()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_249B953F8()
{
  return MEMORY[0x24BEE0B78]();
}

uint64_t sub_249B95404()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_249B95410()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_249B9541C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_249B95428()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_249B95434()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_249B95440()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_249B9544C()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_249B95458()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_249B95464()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_249B95470()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_249B9547C()
{
  return MEMORY[0x24BEE1068]();
}

uint64_t sub_249B95488()
{
  return MEMORY[0x24BEE1070]();
}

uint64_t sub_249B95494()
{
  return MEMORY[0x24BEE1078]();
}

uint64_t sub_249B954A0()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_249B954AC()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_249B954B8()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_249B954C4()
{
  return MEMORY[0x24BEE1278]();
}

uint64_t sub_249B954D0()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_249B954DC()
{
  return MEMORY[0x24BEE1930]();
}

uint64_t sub_249B954E8()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_249B954F4()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_249B95500()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_249B9550C()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_249B95518()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_249B95524()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_249B95530()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_249B9553C()
{
  return MEMORY[0x24BEE2168]();
}

uint64_t sub_249B95548()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_249B95554()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_249B95560()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_249B9556C()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_249B95578()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_249B95584()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_249B95590()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_249B9559C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_249B955A8()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_249B955B4()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_249B955C0()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_249B955CC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_249B955D8()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_249B955E4()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_249B955F0()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_249B955FC()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_249B95608()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_249B95614()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_249B95620()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_249B9562C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_249B95638()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_249B95644()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_249B95650()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t sub_249B9565C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_249B95668()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_249B95674()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_249B95680()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_249B9568C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_249B95698()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_249B956A4()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_249B956B0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_249B956BC()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_249B956C8()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_249B956D4()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_249B956E0()
{
  return MEMORY[0x24BEE4A10]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x24BDAFC08]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

