uint64_t sub_213CBB87C()
{
  uint64_t result;
  double v1;
  uint64_t v2;
  uint64_t v3;

  userInterface()();
  sub_213CBBBF4();
  sub_213CE62C8();
  result = sub_213CE62C8();
  v1 = 20.0;
  if (v3 != v2)
  {
    userInterface()();
    sub_213CE62C8();
    result = sub_213CE62C8();
    v1 = 16.0;
  }
  qword_253F0BE30 = *(_QWORD *)&v1;
  return result;
}

uint64_t *sub_213CBB950()
{
  if (qword_253F0BE38 != -1)
    swift_once();
  return &qword_253F0BE30;
}

double static SheetConstants.horizontalSheetPadding.getter()
{
  return sub_213CBBA10(&qword_253F0BE38, (uint64_t)&qword_253F0BE30);
}

double sub_213CBB9AC()
{
  double result;

  if (qword_253F0BE38 != -1)
    swift_once();
  result = *(double *)&qword_253F0BE30;
  qword_253F0BE50 = qword_253F0BE30;
  return result;
}

double static SheetConstants.horizontalHeaderPadding.getter()
{
  return sub_213CBBA10(qword_253F0BE58, (uint64_t)&qword_253F0BE50);
}

double sub_213CBBA10(_QWORD *a1, uint64_t a2)
{
  if (*a1 != -1)
    swift_once();
  return *(double *)a2;
}

void *sub_213CBBA48()
{
  return &unk_213CE6A38;
}

double static SheetConstants.paymentItemCornerRadius.getter()
{
  return 12.0;
}

void sub_213CBBA5C()
{
  id v0;
  void *v1;
  char pearlIDCapability;

  v0 = (id)MobileGestalt_get_current_device();
  if (v0)
  {
    v1 = v0;
    pearlIDCapability = MobileGestalt_get_pearlIDCapability();

    byte_253F0BE40 = pearlIDCapability;
  }
  else
  {
    __break(1u);
  }
}

char *sub_213CBBAA0()
{
  if (qword_253F0BE48 != -1)
    swift_once();
  return &byte_253F0BE40;
}

uint64_t static SheetConstants.pearlIsAvailable.getter()
{
  return sub_213CBBBAC(&qword_253F0BE48, (unsigned __int8 *)&byte_253F0BE40);
}

void sub_213CBBAFC()
{
  id v0;
  void *v1;
  int homeButtonType;

  v0 = (id)MobileGestalt_get_current_device();
  if (v0)
  {
    v1 = v0;
    homeButtonType = MobileGestalt_get_homeButtonType();

    if ((homeButtonType & 0x80000000) == 0)
    {
      byte_254D36078 = homeButtonType != 2;
      return;
    }
    __break(1u);
  }
  __break(1u);
}

char *sub_213CBBB50()
{
  if (qword_254D36070 != -1)
    swift_once();
  return &byte_254D36078;
}

uint64_t static SheetConstants.homeButtonIsAvailable.getter()
{
  return sub_213CBBBAC(&qword_254D36070, (unsigned __int8 *)&byte_254D36078);
}

uint64_t sub_213CBBBAC(_QWORD *a1, unsigned __int8 *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

ValueMetadata *type metadata accessor for SheetConstants()
{
  return &type metadata for SheetConstants;
}

unint64_t sub_213CBBBF4()
{
  unint64_t result;

  result = qword_253F0B8C8;
  if (!qword_253F0B8C8)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for UserInterfaceType, &type metadata for UserInterfaceType);
    atomic_store(result, (unint64_t *)&qword_253F0B8C8);
  }
  return result;
}

uint64_t sub_213CBBC38(uint64_t a1)
{
  return sub_213CBC574(a1, 0x6F6C2F726F6C6F63, 0xEA00000000006F67, &qword_254D36088);
}

uint64_t static Color.logoColor.getter()
{
  return sub_213CBBCF8(&qword_254D36080);
}

uint64_t sub_213CBBC78(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD000000000000018, 0x8000000213CED320, &qword_254D36098);
}

uint64_t *sub_213CBBC9C()
{
  if (qword_254D36090 != -1)
    swift_once();
  return &qword_254D36098;
}

uint64_t static Color.itemIconBackground.getter()
{
  return sub_213CBBCF8(&qword_254D36090);
}

uint64_t sub_213CBBCF8(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_213CBBD30(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD000000000000018, 0x8000000213CED300, &qword_254D360A8);
}

uint64_t *sub_213CBBD54()
{
  if (qword_254D360A0 != -1)
    swift_once();
  return &qword_254D360A8;
}

uint64_t static Color.itemIconForeground.getter()
{
  return sub_213CBBCF8(&qword_254D360A0);
}

uint64_t sub_213CBBDB0(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD000000000000017, 0x8000000213CED2E0, &qword_253F0CA40);
}

uint64_t static Color.overlayBackground.getter()
{
  return sub_213CBBCF8(&qword_253F0CA48);
}

uint64_t sub_213CBBDF0(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD000000000000015, 0x8000000213CED2C0, &qword_254D360B8);
}

uint64_t *sub_213CBBE14()
{
  if (qword_254D360B0 != -1)
    swift_once();
  return &qword_254D360B8;
}

uint64_t static Color.sheetBackground.getter()
{
  return sub_213CBBCF8(&qword_254D360B0);
}

uint64_t sub_213CBBE70(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD00000000000001CLL, 0x8000000213CED2A0, &qword_254D360C8);
}

uint64_t static Color.shippingIconBackground.getter()
{
  return sub_213CBBCF8(&qword_254D360C0);
}

uint64_t sub_213CBBEB0(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD00000000000001CLL, 0x8000000213CED280, &qword_254D360D8);
}

uint64_t static Color.shippingIconForeground.getter()
{
  return sub_213CBBCF8(&qword_254D360D0);
}

uint64_t sub_213CBBEF0(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD00000000000001ALL, 0x8000000213CED260, &qword_254D360E8);
}

uint64_t static Color.meCardHomeBackground.getter()
{
  return sub_213CBBCF8(&qword_254D360E0);
}

uint64_t sub_213CBBF30(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD00000000000001ALL, 0x8000000213CED240, &qword_254D360F8);
}

uint64_t static Color.meCardWorkBackground.getter()
{
  return sub_213CBBCF8(&qword_254D360F0);
}

uint64_t sub_213CBBF70(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD00000000000001CLL, 0x8000000213CED220, &qword_254D36108);
}

uint64_t static Color.meCardSchoolBackground.getter()
{
  return sub_213CBBCF8(&qword_254D36100);
}

uint64_t sub_213CBBFB0(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD00000000000001BLL, 0x8000000213CED200, &qword_254D36118);
}

uint64_t static Color.addressIconBackground.getter()
{
  return sub_213CBBCF8(&qword_254D36110);
}

uint64_t sub_213CBBFF0(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD000000000000014, 0x8000000213CED1E0, &qword_253F0CA30);
}

uint64_t *sub_213CBC014()
{
  if (qword_253F0CA38 != -1)
    swift_once();
  return &qword_253F0CA30;
}

uint64_t static Color.itemBackground.getter()
{
  return sub_213CBBCF8(&qword_253F0CA38);
}

uint64_t sub_213CBC070(uint64_t a1)
{
  return sub_213CBC424(a1, &qword_254D36128);
}

uint64_t static Color.itemBorder.getter()
{
  return sub_213CBBCF8(&qword_254D36120);
}

uint64_t sub_213CBC0A0(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD000000000000014, 0x8000000213CED1C0, &qword_254D36138);
}

uint64_t static Color.boxBorderColor.getter()
{
  return sub_213CBBCF8(&qword_254D36130);
}

uint64_t sub_213CBC0E0(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD000000000000015, 0x8000000213CED1A0, &qword_254D36148);
}

uint64_t static Color.itemImageShadow.getter()
{
  return sub_213CBBCF8(&qword_254D36140);
}

uint64_t sub_213CBC120()
{
  uint64_t result;

  result = sub_213CE60DC();
  qword_253F0CA10 = result;
  return result;
}

uint64_t *sub_213CBC13C()
{
  if (qword_253F0CA18 != -1)
    swift_once();
  return &qword_253F0CA10;
}

uint64_t static Color.primaryText.getter()
{
  return sub_213CBBCF8(&qword_253F0CA18);
}

uint64_t sub_213CBC198()
{
  uint64_t result;

  result = sub_213CE60E8();
  qword_253F0CA20 = result;
  return result;
}

uint64_t *sub_213CBC1B4()
{
  if (qword_253F0CA28 != -1)
    swift_once();
  return &qword_253F0CA20;
}

uint64_t static Color.secondaryText.getter()
{
  return sub_213CBBCF8(&qword_253F0CA28);
}

uint64_t sub_213CBC210(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD000000000000015, 0x8000000213CED180, &qword_254D36158);
}

uint64_t *sub_213CBC234()
{
  if (qword_254D36150 != -1)
    swift_once();
  return &qword_254D36158;
}

uint64_t static Color.errorForeground.getter()
{
  return sub_213CBBCF8(&qword_254D36150);
}

uint64_t sub_213CBC290(uint64_t a1)
{
  return sub_213CBC620(a1, (SEL *)&selRef_tertiarySystemGroupedBackgroundColor, &qword_254D36168);
}

uint64_t static Color.appleCashBalanceBackground.getter()
{
  return sub_213CBBCF8(&qword_254D36160);
}

uint64_t sub_213CBC2C0(uint64_t a1)
{
  return sub_213CBC620(a1, (SEL *)&selRef_tertiarySystemFillColor, &qword_254D36178);
}

uint64_t static Color.tertiarySystemFill.getter()
{
  return sub_213CBBCF8(&qword_254D36170);
}

uint64_t sub_213CBC2F0(uint64_t a1)
{
  return sub_213CBC620(a1, (SEL *)&selRef_systemBackgroundColor, &qword_254D36188);
}

uint64_t static Color.systemBackground.getter()
{
  return sub_213CBBCF8(&qword_254D36180);
}

uint64_t sub_213CBC320(uint64_t a1)
{
  return sub_213CBC620(a1, (SEL *)&selRef_tertiaryLabelColor, &qword_254D36198);
}

uint64_t *sub_213CBC334()
{
  if (qword_254D36190 != -1)
    swift_once();
  return &qword_254D36198;
}

uint64_t static Color.tertiaryLabel.getter()
{
  return sub_213CBBCF8(&qword_254D36190);
}

uint64_t sub_213CBC390(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD000000000000027, 0x8000000213CED150, &qword_254D361A8);
}

uint64_t static Color.appleCashInsufficientBalanceBackground.getter()
{
  return sub_213CBBCF8(&qword_254D361A0);
}

uint64_t sub_213CBC3D0(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD000000000000017, 0x8000000213CED130, &qword_254D361B8);
}

uint64_t static Color.webIconBackground.getter()
{
  return sub_213CBBCF8(&qword_254D361B0);
}

uint64_t sub_213CBC410(uint64_t a1)
{
  return sub_213CBC424(a1, &qword_254D361C8);
}

uint64_t sub_213CBC424(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = sub_213CE60C4();
  MEMORY[0x24BDAC7A8](v3);
  (*(void (**)(char *, _QWORD))(v5 + 104))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x24BDF3C28]);
  result = sub_213CE60F4();
  *a2 = result;
  return result;
}

uint64_t static Color.bannerBackground.getter()
{
  return sub_213CBBCF8(&qword_254D361C0);
}

uint64_t sub_213CBC4D0(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD000000000000024, 0x8000000213CED100, &qword_254D361D8);
}

uint64_t static Color.thumbnailPlaceholderBackground.getter()
{
  return sub_213CBBCF8(&qword_254D361D0);
}

uint64_t sub_213CBC510(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD000000000000024, 0x8000000213CED0D0, &qword_254D361E8);
}

uint64_t static Color.thumbnailPlaceholderForeground.getter()
{
  return sub_213CBBCF8(&qword_254D361E0);
}

uint64_t sub_213CBC550(uint64_t a1)
{
  return sub_213CBC574(a1, 0xD00000000000001ALL, 0x8000000213CED0B0, &qword_254D361F8);
}

uint64_t sub_213CBC574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  id v5;
  uint64_t result;

  v5 = (id)*sub_213CC98BC();
  result = sub_213CE6100();
  *a4 = result;
  return result;
}

uint64_t static Color.deviceIconBackground.getter()
{
  return sub_213CBBCF8(&qword_254D361F0);
}

uint64_t sub_213CBC5DC(uint64_t a1)
{
  return sub_213CBC620(a1, (SEL *)&selRef_secondarySystemGroupedBackgroundColor, qword_254D36208);
}

uint64_t static Color.secondarySystemGroupedBackground.getter()
{
  return sub_213CBBCF8(&qword_254D36200);
}

uint64_t sub_213CBC60C(uint64_t a1)
{
  return sub_213CBC620(a1, (SEL *)&selRef_secondarySystemBackgroundColor, &qword_253F0CA50);
}

uint64_t sub_213CBC620(uint64_t a1, SEL *a2, uint64_t *a3)
{
  id v4;
  uint64_t result;

  v4 = objc_msgSend((id)objc_opt_self(), *a2);
  result = MEMORY[0x2199C1710](v4);
  *a3 = result;
  return result;
}

uint64_t static Color.secondarySystemBackground.getter()
{
  return sub_213CBBCF8(&qword_253F0CA58);
}

uint64_t FooterViewType.hash(into:)()
{
  return sub_213CE643C();
}

BOOL static FooterViewType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t FooterViewType.hashValue.getter()
{
  sub_213CE6430();
  sub_213CE643C();
  return sub_213CE6448();
}

uint64_t sub_213CBC700()
{
  sub_213CE6430();
  sub_213CE643C();
  return sub_213CE6448();
}

uint64_t sub_213CBC744()
{
  return sub_213CE643C();
}

uint64_t sub_213CBC76C()
{
  sub_213CE6430();
  sub_213CE643C();
  return sub_213CE6448();
}

BOOL sub_213CBC7AC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t static BaseAuthenticatorModel.defaultHasPearl.getter()
{
  return *sub_213CBBAA0();
}

uint64_t sub_213CBC7D8@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 216))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_213CBC80C(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 224))(*a1);
}

uint64_t sub_213CBC838()
{
  return sub_213CBF0A8();
}

uint64_t sub_213CBC84C()
{
  return sub_213CBF124();
}

uint64_t (*sub_213CBC860(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CBC8DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 240))();
}

uint64_t sub_213CBC904(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 248))(v6);
}

uint64_t sub_213CBC990()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__authenticating, &qword_253F0B988);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199C1E90]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_213CBC9E4(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_253F0B940, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__authenticating, &qword_253F0B988);
}

uint64_t (*sub_213CBCA00(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__authenticating;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

uint64_t sub_213CBCACC@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 264))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_213CBCB00(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 272))(*a1);
}

uint64_t sub_213CBCB2C()
{
  return sub_213CBF0A8();
}

uint64_t sub_213CBCB40()
{
  return sub_213CBF124();
}

uint64_t (*sub_213CBCB54(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CBCBCC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 288))();
}

uint64_t sub_213CBCBF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 296))(v6);
}

uint64_t sub_213CBCC80()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__bypassAuthenticator, &qword_253F0B988);
}

uint64_t sub_213CBCC94(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_253F0B940, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__bypassAuthenticator, &qword_253F0B988);
}

uint64_t (*sub_213CBCCB0(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__bypassAuthenticator;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

uint64_t sub_213CBCD78@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 312))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_213CBCDAC(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 320))(*a1);
}

uint64_t sub_213CBCDD8()
{
  return sub_213CBF0A8();
}

uint64_t sub_213CBCDEC()
{
  return sub_213CBF124();
}

uint64_t (*sub_213CBCE00(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CBCE78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 336))();
}

uint64_t sub_213CBCEA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 344))(v6);
}

uint64_t sub_213CBCF2C()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isInBioLockout, &qword_253F0B988);
}

uint64_t sub_213CBCF40(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_253F0B940, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isInBioLockout, &qword_253F0B988);
}

uint64_t (*sub_213CBCF5C(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isInBioLockout;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

uint64_t sub_213CBD024@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 360))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_213CBD058(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 368))(*a1);
}

uint64_t sub_213CBD084()
{
  return sub_213CBF0A8();
}

uint64_t sub_213CBD098()
{
  return sub_213CBF124();
}

uint64_t (*sub_213CBD0AC(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CBD124(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 384))();
}

uint64_t sub_213CBD14C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 392))(v6);
}

uint64_t sub_213CBD1D8()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disablePasscodeFallback, &qword_253F0B988);
}

uint64_t sub_213CBD1EC(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_253F0B940, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disablePasscodeFallback, &qword_253F0B988);
}

uint64_t (*sub_213CBD208(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disablePasscodeFallback;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

uint64_t sub_213CBD2D0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_213CE5A64();
  swift_release();
  return swift_release();
}

_QWORD *sub_213CBD334@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  _QWORD *result;
  uint64_t v4;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))(**(_QWORD **)a1 + 408))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_213CBD374()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_213CE5A70();
}

uint64_t sub_213CBD3E4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_213CE5A70();
}

uint64_t sub_213CBD450()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__footerViewType, &qword_253F0B958);
}

uint64_t sub_213CBD464(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_253F0B920, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__footerViewType, &qword_253F0B958);
}

uint64_t sub_213CBD480@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 456))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_213CBD4B4(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 464))(*a1);
}

uint64_t sub_213CBD4E0()
{
  return sub_213CBF0A8();
}

uint64_t sub_213CBD4F4()
{
  return sub_213CBF124();
}

uint64_t (*sub_213CBD508(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CBD580(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 480))();
}

uint64_t sub_213CBD5A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 488))(v6);
}

uint64_t sub_213CBD634()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__showEnterPasswordButton, &qword_253F0B988);
}

uint64_t sub_213CBD648(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_253F0B940, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__showEnterPasswordButton, &qword_253F0B988);
}

uint64_t (*sub_213CBD664(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__showEnterPasswordButton;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

double sub_213CBD72C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  double result;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  (*(void (**)(_OWORD *__return_ptr))(**(_QWORD **)a1 + 504))(v6);
  v3 = v7;
  result = *(double *)v6;
  v5 = v6[1];
  *(_OWORD *)a2 = v6[0];
  *(_OWORD *)(a2 + 16) = v5;
  *(_QWORD *)(a2 + 32) = v3;
  return result;
}

uint64_t sub_213CBD774(uint64_t a1, uint64_t *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)(void **);
  void *v9[5];

  v2 = *(void **)(a1 + 8);
  v3 = *(void **)(a1 + 16);
  v4 = *(void **)(a1 + 24);
  v5 = *(void **)(a1 + 32);
  v6 = *a2;
  v9[0] = *(void **)a1;
  v9[1] = v2;
  v9[2] = v3;
  v9[3] = v4;
  v9[4] = v5;
  v7 = *(uint64_t (**)(void **))(*(_QWORD *)v6 + 512);
  sub_213CC0B6C(v9[0], (uint64_t)v2, (uint64_t)v3, (uint64_t)v4);
  return v7(v9);
}

uint64_t sub_213CBD7CC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_213CE5A64();
  swift_release();
  return swift_release();
}

uint64_t sub_213CBD830()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_213CE5A70();
}

uint64_t (*sub_213CBD8B8(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CBD930(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 528))();
}

uint64_t sub_213CBD958(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35630);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 536))(v6);
}

uint64_t sub_213CBD9E4()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__passcodeEntry, &qword_253F0B968);
}

uint64_t sub_213CBD9F8(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_254D35630, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__passcodeEntry, &qword_253F0B968);
}

uint64_t (*sub_213CBDA14(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35630);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__passcodeEntry;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B968);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

uint64_t sub_213CBDADC@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 552))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_213CBDB10(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 560))(*a1);
}

uint64_t sub_213CBDB3C()
{
  return sub_213CBF0A8();
}

uint64_t sub_213CBDB50()
{
  return sub_213CBF124();
}

uint64_t (*sub_213CBDB64(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CBDBDC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 576))();
}

uint64_t sub_213CBDC04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 584))(v6);
}

uint64_t sub_213CBDC90()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disableInteractivity, &qword_253F0B988);
}

uint64_t sub_213CBDCA4(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_253F0B940, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disableInteractivity, &qword_253F0B988);
}

uint64_t (*sub_213CBDCC0(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disableInteractivity;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

_QWORD *sub_213CBDD88@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *result;
  uint64_t v4;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))(**(_QWORD **)a1 + 600))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_213CBDDC8(id *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t (*v3)(id *);
  id v4;
  id v6;

  v2 = *a2;
  v6 = *a1;
  v3 = *(uint64_t (**)(id *))(*(_QWORD *)v2 + 608);
  v4 = v6;
  return v3(&v6);
}

uint64_t sub_213CBDE08()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_213CE5A64();
  swift_release();
  return swift_release();
}

uint64_t sub_213CBDE6C(void **a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v5;

  v2 = *a1;
  (*(void (**)(id *__return_ptr))(*(_QWORD *)v1 + 600))(&v5);
  v3 = v5;
  if (v5)
  {
    if (!v2)
      objc_msgSend(v5, sel_resignFirstResponder);

  }
  swift_getKeyPath();
  swift_getKeyPath();
  v5 = v2;
  swift_retain();
  return sub_213CE5A70();
}

void (*sub_213CBDF08(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 16) = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_213CE5A64();
  swift_release();
  swift_release();
  return sub_213CBDF80;
}

void sub_213CBDF80(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  v3 = *(id *)a1;
  v4 = *(_QWORD *)(a1 + 16);
  if ((a2 & 1) != 0)
  {
    (*(void (**)(id *__return_ptr, id))(*(_QWORD *)v4 + 600))(&v7, v3);
    v5 = v7;
    if (v7)
    {
      if (!v3)
        objc_msgSend(v7, sel_resignFirstResponder);

    }
    swift_getKeyPath();
    swift_getKeyPath();
    *(_QWORD *)(a1 + 8) = v3;
    swift_retain();
    sub_213CE5A70();

  }
  else
  {
    (*(void (**)(id *__return_ptr))(*(_QWORD *)v4 + 600))(&v7);
    v6 = v7;
    if (v7)
    {
      if (!v3)
        objc_msgSend(v7, sel_resignFirstResponder);

    }
    swift_getKeyPath();
    swift_getKeyPath();
    *(_QWORD *)(a1 + 8) = v3;
    swift_retain();
    sub_213CE5A70();
  }
}

uint64_t sub_213CBE0C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 624))();
}

uint64_t sub_213CBE0F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35638);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 632))(v6);
}

uint64_t sub_213CBE17C()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__externalPasswordEntry, &qword_253F0B978);
}

uint64_t sub_213CBE190(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_254D35638, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__externalPasswordEntry, &qword_253F0B978);
}

uint64_t (*sub_213CBE1AC(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35638);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__externalPasswordEntry;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B978);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

uint64_t sub_213CBE274@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 648))();
  *a2 = result;
  return result;
}

uint64_t sub_213CBE2A4(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 656))(*a1);
}

uint64_t sub_213CBE2D0()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_213CE5A64();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_213CBE340()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_213CE5A70();
}

uint64_t (*sub_213CBE3AC(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CBE424(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 672))();
}

uint64_t sub_213CBE44C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B930);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 680))(v6);
}

uint64_t sub_213CBE4D8()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isAuthenticationDetached, &qword_253F0B990);
}

uint64_t sub_213CBE4EC(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_253F0B930, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isAuthenticationDetached, &qword_253F0B990);
}

uint64_t (*sub_213CBE508(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B930);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isAuthenticationDetached;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B990);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

uint64_t sub_213CBE5D0@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 696))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_213CBE604(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 704))(*a1);
}

uint64_t sub_213CBE630()
{
  return sub_213CBF0A8();
}

uint64_t sub_213CBE644()
{
  return sub_213CBF124();
}

uint64_t (*sub_213CBE658(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CBE6D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 720))();
}

uint64_t sub_213CBE6F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 728))(v6);
}

uint64_t sub_213CBE784()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isSheetFullHeightOverrideEnabled, &qword_253F0B988);
}

uint64_t sub_213CBE798(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_253F0B940, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isSheetFullHeightOverrideEnabled, &qword_253F0B988);
}

uint64_t (*sub_213CBE7B4(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isSheetFullHeightOverrideEnabled;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

uint64_t sub_213CBE87C@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 744))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_213CBE8B0(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 752))(*a1);
}

uint64_t sub_213CBE8DC()
{
  return sub_213CBF0A8();
}

uint64_t sub_213CBE8F0()
{
  return sub_213CBF124();
}

uint64_t (*sub_213CBE904(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CBE97C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 768))();
}

uint64_t sub_213CBE9A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 776))(v6);
}

uint64_t sub_213CBEA30()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__shouldDisplaySheetFullHeight, &qword_253F0B988);
}

uint64_t sub_213CBEA44(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_253F0B940, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__shouldDisplaySheetFullHeight, &qword_253F0B988);
}

uint64_t (*sub_213CBEA60(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__shouldDisplaySheetFullHeight;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

uint64_t sub_213CBEB28@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 792))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_213CBEB5C(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 800))(*a1);
}

uint64_t sub_213CBEB88()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_hasPearl);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_213CBEBCC(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_hasPearl);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_213CBEC14())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_213CBEC58@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 816))();
  *a2 = result;
  return result;
}

uint64_t sub_213CBEC88(unsigned int *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 824))(*a1);
}

uint64_t sub_213CBECB4()
{
  uint64_t v0;
  unsigned int *v1;

  v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_physicalButtonEdge);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_213CBECF8(int a1)
{
  uint64_t v1;
  _DWORD *v3;
  uint64_t result;

  v3 = (_DWORD *)(v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_physicalButtonEdge);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_213CBED40())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_213CBED88@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 840))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_213CBEDBC(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 848))(*a1);
}

uint64_t sub_213CBEDE8()
{
  return sub_213CBF0A8();
}

uint64_t sub_213CBEDFC()
{
  return sub_213CBF124();
}

uint64_t (*sub_213CBEE10(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CBEE88(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 864))();
}

uint64_t sub_213CBEEB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 872))(v6);
}

uint64_t sub_213CBEF3C()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isEvaluationPaused, &qword_253F0B988);
}

uint64_t sub_213CBEF50(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_253F0B940, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isEvaluationPaused, &qword_253F0B988);
}

uint64_t (*sub_213CBEF6C(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isEvaluationPaused;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

uint64_t sub_213CBF034@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 888))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_213CBF068(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 896))(*a1);
}

uint64_t sub_213CBF094()
{
  return sub_213CBF0A8();
}

uint64_t sub_213CBF0A8()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_213CE5A64();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_213CBF110()
{
  return sub_213CBF124();
}

uint64_t sub_213CBF124()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_213CE5A70();
}

uint64_t (*sub_213CBF18C(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

void sub_213CBF204(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_213CBF250(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 912))();
}

uint64_t sub_213CBF278(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 920))(v6);
}

uint64_t sub_213CBF304()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isDetachedAuthenticationSheetPresented, &qword_253F0B988);
}

uint64_t sub_213CBF318(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_213CE5A40();
  return swift_endAccess();
}

uint64_t sub_213CBF37C(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_253F0B940, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isDetachedAuthenticationSheetPresented, &qword_253F0B988);
}

uint64_t sub_213CBF398(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_213CE5A4C();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_213CBF470(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isDetachedAuthenticationSheetPresented;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

void sub_213CBF538(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_213CE5A4C();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_213CE5A4C();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

uint64_t sub_213CBF650@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 936))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_213CBF684(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 944))(*a1);
}

uint64_t sub_213CBF6B0()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_alwaysHidePhysicalButton);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_213CBF6F4(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_alwaysHidePhysicalButton);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_213CBF73C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t BaseAuthenticatorModel.__allocating_init(hasPearl:)(unsigned __int8 a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  BaseAuthenticatorModel.init(hasPearl:)(a1);
  return v2;
}

uint64_t BaseAuthenticatorModel.init(hasPearl:)(unsigned __int8 a1)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(uint64_t, char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v45 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B990);
  v43 = *(_QWORD *)(v2 - 8);
  v44 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v42 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B978);
  v40 = *(_QWORD *)(v4 - 8);
  v41 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B968);
  v37 = *(_QWORD *)(v6 - 8);
  v38 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B958);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__authenticating;
  LOBYTE(v46) = 0;
  sub_213CE5A34();
  v18 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 32);
  v18(v17, v16, v13);
  v19 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__bypassAuthenticator;
  LOBYTE(v46) = 0;
  sub_213CE5A34();
  v18(v19, v16, v13);
  v20 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isInBioLockout;
  LOBYTE(v46) = 0;
  sub_213CE5A34();
  v18(v20, v16, v13);
  v21 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disablePasscodeFallback;
  LOBYTE(v46) = 0;
  sub_213CE5A34();
  v18(v21, v16, v13);
  v22 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__footerViewType;
  LOBYTE(v46) = 0;
  sub_213CE5A34();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v22, v12, v9);
  v23 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__showEnterPasswordButton;
  LOBYTE(v46) = 0;
  sub_213CE5A34();
  v18(v23, v16, v13);
  v24 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__passcodeEntry;
  v48 = 0;
  v46 = 0u;
  v47 = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B8D8);
  sub_213CE5A34();
  (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v24, v8, v38);
  v25 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disableInteractivity;
  LOBYTE(v46) = 1;
  sub_213CE5A34();
  v18(v25, v16, v13);
  v26 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__externalPasswordEntry;
  *(_QWORD *)&v46 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B8E0);
  v27 = v39;
  sub_213CE5A34();
  (*(void (**)(uint64_t, char *, uint64_t))(v40 + 32))(v26, v27, v41);
  v28 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isAuthenticationDetached;
  LOBYTE(v46) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BAB0);
  v29 = v42;
  sub_213CE5A34();
  (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))(v28, v29, v44);
  v30 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isSheetFullHeightOverrideEnabled;
  LOBYTE(v46) = 0;
  sub_213CE5A34();
  v18(v30, v16, v13);
  v31 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__shouldDisplaySheetFullHeight;
  LOBYTE(v46) = 0;
  sub_213CE5A34();
  v18(v31, v16, v13);
  *(_DWORD *)(v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_physicalButtonEdge) = 1;
  v32 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isEvaluationPaused;
  LOBYTE(v46) = 0;
  sub_213CE5A34();
  v18(v32, v16, v13);
  v33 = v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isDetachedAuthenticationSheetPresented;
  LOBYTE(v46) = 0;
  sub_213CE5A34();
  v18(v33, v16, v13);
  if (v45 == 2)
    v34 = *sub_213CBBAA0();
  else
    v34 = v45 & 1;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_hasPearl) = v34;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel_alwaysHidePhysicalButton) = 0;
  sub_213CBFC7C();
  return v1;
}

uint64_t sub_213CBFC7C()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(_BYTE *, _QWORD);
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[32];

  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B920);
  MEMORY[0x24BDAC7A8](v32);
  v28 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  v2 = MEMORY[0x24BDAC7A8](v31);
  v25 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B930);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B900);
  MEMORY[0x24BDAC7A8](v26);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B8F0);
  v27 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B910);
  v11 = *(_QWORD *)(v10 - 8);
  v29 = v10;
  v30 = v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t))(*(_QWORD *)v0 + 672))(v12);
  sub_213CC0B2C(&qword_253F0B928, &qword_253F0B930, MEMORY[0x24BDB9EE8]);
  sub_213CE5A88();
  v15 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 864))(v15);
  v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 240))(v16);
  (*(void (**)(uint64_t))(*(_QWORD *)v0 + 432))(v17);
  sub_213CC0B2C(&qword_253F0B8F8, &qword_253F0B900, MEMORY[0x24BDB94C8]);
  v18 = MEMORY[0x24BDB9EE8];
  sub_213CC0B2C(&qword_253F0B938, &qword_253F0B940, MEMORY[0x24BDB9EE8]);
  sub_213CC0B2C(&qword_253F0B918, &qword_253F0B920, v18);
  sub_213CE5A1C();
  sub_213CC0B2C(&qword_253F0B8E8, &qword_253F0B8F0, MEMORY[0x24BDB9490]);
  v19 = v24;
  sub_213CE5A88();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v19);
  v20 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v0 + 928))(v33);
  sub_213CC0B2C(&qword_253F0B908, &qword_253F0B910, MEMORY[0x24BDB94C8]);
  v21 = v29;
  sub_213CE5A94();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v14, v21);
  return v20(v33, 0);
}

_BYTE *sub_213CC004C@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_BYTE *sub_213CC0058@<X0>(_BYTE *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;
  char v4;

  if (result[2])
    v2 = 1;
  else
    v2 = 2;
  if (result[1])
    v3 = 0;
  else
    v3 = v2;
  if (*result)
    v4 = v3;
  else
    v4 = 0;
  *a2 = v4;
  return result;
}

uint64_t BaseAuthenticatorModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__authenticating;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__bypassAuthenticator, v2);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isInBioLockout, v2);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disablePasscodeFallback, v2);
  v4 = v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__footerViewType;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B958);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__showEnterPasswordButton, v2);
  v6 = v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__passcodeEntry;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B968);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__disableInteractivity, v2);
  v8 = v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__externalPasswordEntry;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B978);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isAuthenticationDetached;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B990);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isSheetFullHeightOverrideEnabled, v2);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__shouldDisplaySheetFullHeight, v2);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isEvaluationPaused, v2);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase22BaseAuthenticatorModel__isDetachedAuthenticationSheetPresented, v2);
  return v0;
}

uint64_t BaseAuthenticatorModel.__deallocating_deinit()
{
  BaseAuthenticatorModel.deinit();
  return swift_deallocClassInstance();
}

unint64_t sub_213CC0268()
{
  unint64_t result;

  result = qword_254D35640;
  if (!qword_254D35640)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for FooterViewType, &type metadata for FooterViewType);
    atomic_store(result, (unint64_t *)&qword_254D35640);
  }
  return result;
}

uint64_t sub_213CC02AC()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_213CC02B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for BaseAuthenticatorModel();
  result = sub_213CE5A28();
  *a1 = result;
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FooterViewType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FooterViewType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_213CC03E0 + 4 * byte_213CE6A75[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_213CC0414 + 4 * byte_213CE6A70[v4]))();
}

uint64_t sub_213CC0414(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213CC041C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213CC0424);
  return result;
}

uint64_t sub_213CC0430(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213CC0438);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_213CC043C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213CC0444(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213CC0450(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_213CC045C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FooterViewType()
{
  return &type metadata for FooterViewType;
}

uint64_t sub_213CC0474()
{
  return type metadata accessor for BaseAuthenticatorModel();
}

uint64_t type metadata accessor for BaseAuthenticatorModel()
{
  uint64_t result;

  result = qword_253F0C720;
  if (!qword_253F0C720)
    return swift_getSingletonMetadata();
  return result;
}

void sub_213CC04B8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_213CC0AE8(319, (unint64_t *)&qword_253F0B338, MEMORY[0x24BEE1328], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDB9EF0]);
  if (v0 <= 0x3F)
  {
    sub_213CC0AE8(319, &qword_253F0B960, (uint64_t)&type metadata for FooterViewType, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDB9EF0]);
    if (v1 <= 0x3F)
    {
      sub_213CC0A80(319, &qword_253F0B970, &qword_253F0B8D8);
      if (v2 <= 0x3F)
      {
        sub_213CC0A80(319, &qword_253F0B980, &qword_253F0B8E0);
        if (v3 <= 0x3F)
        {
          sub_213CC0A80(319, (unint64_t *)&unk_253F0B998, &qword_253F0BAB0);
          if (v4 <= 0x3F)
            swift_updateClassMetadata2();
        }
      }
    }
  }
}

uint64_t method lookup function for BaseAuthenticatorModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.authenticating.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.authenticating.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.authenticating.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$authenticating.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$authenticating.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$authenticating.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.bypassAuthenticator.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.bypassAuthenticator.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.bypassAuthenticator.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$bypassAuthenticator.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$bypassAuthenticator.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$bypassAuthenticator.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isInBioLockout.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isInBioLockout.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isInBioLockout.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isInBioLockout.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isInBioLockout.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isInBioLockout.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.disablePasscodeFallback.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.disablePasscodeFallback.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.disablePasscodeFallback.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$disablePasscodeFallback.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$disablePasscodeFallback.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$disablePasscodeFallback.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.showEnterPasswordButton.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 456))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.showEnterPasswordButton.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 464))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.showEnterPasswordButton.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 472))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$showEnterPasswordButton.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 480))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$showEnterPasswordButton.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 488))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$showEnterPasswordButton.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 496))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.passcodeEntry.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 504))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.passcodeEntry.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 512))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.passcodeEntry.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 520))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$passcodeEntry.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 528))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$passcodeEntry.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 536))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$passcodeEntry.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 544))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.disableInteractivity.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 552))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.disableInteractivity.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 560))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.disableInteractivity.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 568))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$disableInteractivity.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 576))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$disableInteractivity.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 584))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$disableInteractivity.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 592))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.externalPasswordEntry.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 600))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.externalPasswordEntry.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 608))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.externalPasswordEntry.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 616))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$externalPasswordEntry.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 624))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$externalPasswordEntry.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 632))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$externalPasswordEntry.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 640))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isAuthenticationDetached.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 648))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isAuthenticationDetached.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 656))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isAuthenticationDetached.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 664))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isAuthenticationDetached.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 672))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isAuthenticationDetached.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 680))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isAuthenticationDetached.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 688))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isSheetFullHeightOverrideEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 696))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isSheetFullHeightOverrideEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 704))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isSheetFullHeightOverrideEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 712))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isSheetFullHeightOverrideEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 720))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isSheetFullHeightOverrideEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 728))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isSheetFullHeightOverrideEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 736))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.shouldDisplaySheetFullHeight.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 744))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.shouldDisplaySheetFullHeight.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 752))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.shouldDisplaySheetFullHeight.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 760))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$shouldDisplaySheetFullHeight.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 768))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$shouldDisplaySheetFullHeight.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 776))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$shouldDisplaySheetFullHeight.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 784))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.hasPearl.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 792))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.hasPearl.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 800))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.hasPearl.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 808))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.physicalButtonEdge.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 816))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.physicalButtonEdge.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 824))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.physicalButtonEdge.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 832))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isEvaluationPaused.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 840))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isEvaluationPaused.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 848))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isEvaluationPaused.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 856))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isEvaluationPaused.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 864))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isEvaluationPaused.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 872))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isEvaluationPaused.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 880))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isDetachedAuthenticationSheetPresented.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 888))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isDetachedAuthenticationSheetPresented.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 896))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.isDetachedAuthenticationSheetPresented.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 904))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isDetachedAuthenticationSheetPresented.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 912))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isDetachedAuthenticationSheetPresented.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 920))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.$isDetachedAuthenticationSheetPresented.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 928))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.alwaysHidePhysicalButton.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 936))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.alwaysHidePhysicalButton.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 944))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.alwaysHidePhysicalButton.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 952))();
}

uint64_t dispatch thunk of BaseAuthenticatorModel.__allocating_init(hasPearl:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 960))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199C1E9C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_213CC0A80(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_213CE5A7C();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void type metadata accessor for CGRectEdge(uint64_t a1)
{
  sub_213CC0AE8(a1, &qword_253F0BAB8, (uint64_t)&unk_24D0E6038, MEMORY[0x24BEE4D40]);
}

void sub_213CC0AE8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

uint64_t sub_213CC0B2C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199C1EA8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void *sub_213CC0B6C(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;

  if (result)
  {
    v5 = result;
    swift_retain();
    return (void *)sub_213CC0BB4(a4);
  }
  return result;
}

uint64_t sub_213CC0BB4(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t PaymentItemPrimaryLabel.init(title:subtextView:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  int *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v11 = (int *)type metadata accessor for PaymentItemPrimaryLabel(0, a5, a6, a4);
  v12 = (_QWORD *)((char *)a7 + v11[10]);
  v13 = *sub_213CBC1B4();
  v14 = MEMORY[0x24BDF3E18];
  v12[3] = MEMORY[0x24BDF3E48];
  v12[4] = v14;
  *v12 = v13;
  v15 = (char *)a7 + v11[11];
  *(_QWORD *)v15 = 0;
  v15[8] = 1;
  v16 = v11[12];
  swift_retain();
  *(_QWORD *)((char *)a7 + v16) = *sub_213CD42B4();
  *a7 = a1;
  a7[1] = a2;
  v17 = swift_retain();
  return a3(v17);
}

uint64_t type metadata accessor for PaymentItemPrimaryLabel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PaymentItemPrimaryLabel);
}

uint64_t PaymentItemPrimaryLabel.body.getter@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  void (*v15)(_BYTE *, _BYTE *, uint64_t);
  void (*v16)(_BYTE *, uint64_t);
  _BYTE v18[16];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35648);
  v5 = *(_QWORD *)(a1 + 16);
  swift_getTupleTypeMetadata2();
  v6 = sub_213CE6214();
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v6);
  v7 = sub_213CE6190();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9);
  v13 = &v18[-v12];
  sub_213CE5D4C();
  v14 = *(_QWORD *)(a1 + 24);
  v19 = v5;
  v20 = v14;
  v21 = v2;
  sub_213CE6184();
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF4700], v7);
  v15 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16);
  v15(v13, v11, v7);
  v16 = *(void (**)(_BYTE *, uint64_t))(v8 + 8);
  v16(v11, v7);
  v15(a2, v13, v7);
  return ((uint64_t (*)(_BYTE *, uint64_t))v16)(v13, v7);
}

uint64_t sub_213CC0E10@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v6;
  uint64_t v8;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t KeyPath;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, char *, uint64_t);
  char *v47;
  void (*v48)(char *, uint64_t);
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  unint64_t v69;
  uint64_t v70;
  _QWORD v71[3];

  v6 = a1;
  v8 = *(_QWORD *)(a2 - 8);
  v9 = MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v60 = (char *)&v50 - v12;
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35648);
  v13 = MEMORY[0x24BDAC7A8](v61);
  v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v62 = (char *)&v50 - v17;
  v18 = (char *)v6[1];
  if (v18)
  {
    v19 = *v6;
    v20 = type metadata accessor for PaymentItemPrimaryLabel(0, a2, a3, v16);
    v21 = *(int *)(v20 + 40);
    v53 = v20;
    v51 = *(uint64_t *)((char *)v6 + v21 + 24);
    v52 = *(uint64_t *)((char *)v6 + v21 + 32);
    v50 = __swift_project_boxed_opaque_existential_1((uint64_t *)((char *)v6 + v21), v51);
    v63 = (char *)v19;
    v64 = v18;
    sub_213CC1814();
    swift_bridgeObjectRetain();
    v22 = sub_213CE5FD4();
    v24 = v23;
    v57 = a4;
    v58 = v8;
    v26 = v25 & 1;
    v27 = sub_213CE5FB0();
    v55 = v15;
    v56 = a3;
    v28 = v27;
    v59 = v11;
    v30 = v29;
    v54 = v6;
    v32 = v31 & 1;
    sub_213CC1858(v22, v24, v26);
    swift_bridgeObjectRelease();
    v33 = sub_213CE5FA4();
    v35 = v34;
    v37 = v36;
    v39 = v38 & 1;
    sub_213CC1858(v28, v30, v32);
    v15 = v55;
    swift_bridgeObjectRelease();
    KeyPath = swift_getKeyPath();
    v63 = (char *)v33;
    v64 = (char *)v35;
    v65 = v39;
    v66 = v37;
    v67 = KeyPath;
    v68 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D357B0);
    sub_213CC37C8(&qword_254D357A8, &qword_254D357B0, &qword_254D35698, &qword_254D356A0);
    v41 = (uint64_t)v62;
    a3 = v56;
    sub_213CE6040();
    v6 = v54;
    sub_213CC1858(v33, v35, v39);
    v11 = v59;
    swift_release();
    v8 = v58;
    swift_bridgeObjectRelease();
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35790);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v41, 0, 1, v42);
    v43 = v53;
  }
  else
  {
    v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35790);
    v41 = (uint64_t)v62;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v62, 1, 1, v44);
    v43 = type metadata accessor for PaymentItemPrimaryLabel(0, a2, a3, v45);
  }
  v46 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v47 = v60;
  v46(v60, (char *)v6 + *(int *)(v43 + 36), a2);
  sub_213CC3694(v41, (uint64_t)v15, &qword_254D35648);
  v63 = v15;
  v46(v11, v47, a2);
  v64 = v11;
  v71[0] = v61;
  v71[1] = a2;
  v69 = sub_213CC36D8();
  v70 = a3;
  sub_213CC121C((uint64_t *)&v63, 2uLL, (uint64_t)v71);
  v48 = *(void (**)(char *, uint64_t))(v8 + 8);
  v48(v47, a2);
  sub_213CC3848(v41, &qword_254D35648);
  v48(v11, a2);
  return sub_213CC3848((uint64_t)v15, &qword_254D35648);
}

uint64_t sub_213CC1210@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_213CC0E10(*(uint64_t **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_213CC121C(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t TupleTypeMetadata;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v4 = a1;
  v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    TupleTypeMetadata = *v5;
    MEMORY[0x24BDAC7A8](a1);
    v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
LABEL_12:
    v22 = 32;
    v23 = a2;
    do
    {
      if (a2 == 1)
        v24 = 0;
      else
        v24 = *(_DWORD *)(TupleTypeMetadata + v22);
      v26 = *v5++;
      v25 = v26;
      v27 = *v4++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(&v8[v24], v27);
      v22 += 16;
      --v23;
    }
    while (v23);
    return sub_213CE6220();
  }
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v11 = 0;
    if (a2 < 4)
      goto LABEL_9;
    if ((unint64_t)(v10 - (char *)v5) < 0x20)
      goto LABEL_9;
    v11 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    v12 = (__int128 *)(v5 + 2);
    v13 = v10 + 16;
    v14 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 4;
    }
    while (v14);
    if (v11 != a2)
    {
LABEL_9:
      v16 = a2 - v11;
      v17 = v11;
      v18 = &v10[8 * v11];
      v19 = &v5[v17];
      do
      {
        v20 = *v19++;
        *(_QWORD *)v18 = v20;
        v18 += 8;
        --v16;
      }
      while (v16);
    }
  }
  TupleTypeMetadata = swift_getTupleTypeMetadata();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata);
  v8 = (char *)&v29 - v21;
  if (a2)
    goto LABEL_12;
  return sub_213CE6220();
}

uint64_t sub_213CC13D8()
{
  return sub_213CE6010();
}

uint64_t SubtextView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t KeyPath;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  char v44;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35650);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35658);
  MEMORY[0x24BDAC7A8](v6);
  v8 = v1[1];
  if (v8)
  {
    v37 = *v1;
    v38 = v8;
    v33 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_213CC1814();
    swift_bridgeObjectRetain();
    v9 = sub_213CE5FD4();
    v11 = v10;
    v36 = a1;
    v13 = v12 & 1;
    v14 = sub_213CE5FB0();
    v34 = v3;
    v35 = v6;
    v15 = v14;
    v17 = v16;
    v32 = v5;
    v19 = v18 & 1;
    sub_213CC1858(v9, v11, v13);
    swift_bridgeObjectRelease();
    v20 = sub_213CE5F98();
    v22 = v21;
    v24 = v23;
    v26 = v25 & 1;
    sub_213CC1858(v15, v17, v19);
    swift_bridgeObjectRelease();
    KeyPath = swift_getKeyPath();
    v28 = swift_getKeyPath();
    v37 = v20;
    v38 = v22;
    v39 = v26;
    v40 = v24;
    v41 = KeyPath;
    v42 = 1;
    v43 = v28;
    v44 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D35670);
    sub_213CC1728();
    v29 = (uint64_t)v33;
    sub_213CE6040();
    sub_213CC1858(v20, v22, v26);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    sub_213CC3694(v29, (uint64_t)v32, &qword_254D35658);
    swift_storeEnumTagMultiPayload();
    sub_213CC16BC();
    sub_213CE5E0C();
    return sub_213CC3848(v29, &qword_254D35658);
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_213CC16BC();
    return sub_213CE5E0C();
  }
}

unint64_t sub_213CC16BC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35660;
  if (!qword_254D35660)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35658);
    v2[0] = sub_213CC1728();
    v2[1] = sub_213CC17CC();
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35660);
  }
  return result;
}

unint64_t sub_213CC1728()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35668;
  if (!qword_254D35668)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35670);
    v2[0] = sub_213CC37C8(&qword_254D35678, &qword_254D35680, &qword_254D35688, &qword_254D35690);
    v2[1] = sub_213CC0B2C(&qword_254D35698, &qword_254D356A0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35668);
  }
  return result;
}

unint64_t sub_213CC17CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D356A8;
  if (!qword_254D356A8)
  {
    v1 = sub_213CE5EC0();
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDF1078], v1);
    atomic_store(result, (unint64_t *)&qword_254D356A8);
  }
  return result;
}

unint64_t sub_213CC1814()
{
  unint64_t result;

  result = qword_253F0BA90;
  if (!qword_253F0BA90)
  {
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_253F0BA90);
  }
  return result;
}

uint64_t sub_213CC1858(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t AttributedSubtextView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  char *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t KeyPath;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  char v44;

  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35650);
  MEMORY[0x24BDAC7A8](v36);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35658);
  MEMORY[0x24BDAC7A8](v5);
  v35 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D356B0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_213CE598C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v29 - v15;
  sub_213CC3694(v1, (uint64_t)v9, &qword_254D356B0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_213CC3848((uint64_t)v9, &qword_254D356B0);
    swift_storeEnumTagMultiPayload();
    sub_213CC16BC();
    return sub_213CE5E0C();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
    v18 = sub_213CE5FC8();
    v30 = v18;
    v31 = v19;
    v21 = v20;
    v22 = v19;
    v34 = a1;
    v24 = v23 & 1;
    KeyPath = swift_getKeyPath();
    v32 = v4;
    v26 = KeyPath;
    v27 = swift_getKeyPath();
    v33 = v5;
    v37 = v18;
    v38 = v21;
    v39 = v24;
    v40 = v22;
    v41 = v26;
    v42 = 1;
    v43 = v27;
    v44 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D35670);
    sub_213CC1728();
    v28 = (uint64_t)v35;
    sub_213CE6040();
    sub_213CC1858(v30, v21, v24);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    sub_213CC3694(v28, (uint64_t)v32, &qword_254D35658);
    swift_storeEnumTagMultiPayload();
    sub_213CC16BC();
    sub_213CE5E0C();
    sub_213CC3848(v28, &qword_254D35658);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  }
}

uint64_t PaymentItemPrimaryLabel<>.init(title:text:textColor:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  v12 = *sub_213CBC1B4();
  v13 = MEMORY[0x24BDF3E18];
  *(_QWORD *)(a6 + 72) = MEMORY[0x24BDF3E48];
  *(_QWORD *)(a6 + 80) = v13;
  *(_QWORD *)(a6 + 48) = v12;
  *(_QWORD *)(a6 + 88) = 0;
  *(_BYTE *)(a6 + 96) = 1;
  swift_retain();
  *(_QWORD *)(a6 + 104) = *sub_213CD42B4();
  *(_QWORD *)a6 = a1;
  *(_QWORD *)(a6 + 8) = a2;
  swift_retain();
  result = sub_213CE5F38();
  *(_QWORD *)(a6 + 16) = a3;
  *(_QWORD *)(a6 + 24) = a4;
  *(_QWORD *)(a6 + 32) = a5;
  *(_QWORD *)(a6 + 40) = result;
  return result;
}

uint64_t PaymentItemPrimaryLabel<>.init(title:attributedText:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  int *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;

  v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254D356B8);
  v9 = (_QWORD *)((char *)a4 + v8[10]);
  v10 = *sub_213CBC1B4();
  v11 = MEMORY[0x24BDF3E18];
  v9[3] = MEMORY[0x24BDF3E48];
  v9[4] = v11;
  *v9 = v10;
  v12 = (char *)a4 + v8[11];
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  v13 = v8[12];
  swift_retain();
  *(_QWORD *)((char *)a4 + v13) = *sub_213CD42B4();
  *a4 = a1;
  a4[1] = a2;
  sub_213CC21F4(a3, (uint64_t)a4 + v8[9]);
  return swift_retain();
}

uint64_t sub_213CC1CDC@<X0>(uint64_t a1@<X8>)
{
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int *v37;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v43[112];
  _BYTE v44[112];
  __int128 v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  _QWORD v56[12];
  char v57;
  uint64_t v58;

  v42 = a1;
  v1 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254D356B8);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v41 = (uint64_t)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v40 = (uint64_t)&v39 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v39 - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (_QWORD *)((char *)&v39 - v10);
  v12 = (char *)&v39 + *(int *)(v9 + 36) - v10;
  v13 = sub_213CE598C();
  v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
  v14(v12, 1, 1, v13);
  v15 = (_QWORD *)((char *)v11 + v1[10]);
  v16 = sub_213CBC1B4();
  v17 = *v16;
  v18 = MEMORY[0x24BDF3E18];
  v15[3] = MEMORY[0x24BDF3E48];
  v15[4] = v18;
  *v15 = v17;
  v19 = (char *)v11 + v1[11];
  *(_QWORD *)v19 = 0;
  v19[8] = 1;
  v20 = v1[12];
  swift_retain();
  v21 = sub_213CD42B4();
  v22 = *v21;
  *(_QWORD *)((char *)v11 + v20) = *v21;
  *v11 = 0;
  v11[1] = 0;
  v14(&v8[v1[9]], 1, 1, v13);
  v23 = (uint64_t *)&v8[v1[10]];
  v24 = *v16;
  v25 = MEMORY[0x24BDF3E48];
  v23[3] = MEMORY[0x24BDF3E48];
  v26 = MEMORY[0x24BDF3E18];
  v23[4] = MEMORY[0x24BDF3E18];
  *v23 = v24;
  v27 = &v8[v1[11]];
  *(_QWORD *)v27 = 0;
  v27[8] = 1;
  *(_QWORD *)&v8[v1[12]] = v22;
  v39 = xmmword_213CE6FA0;
  *(_OWORD *)v8 = xmmword_213CE6FA0;
  swift_retain_n();
  swift_retain();
  v28 = static Color.primaryText.getter();
  v29 = *v16;
  v56[9] = v25;
  v56[10] = v26;
  v56[6] = v29;
  v56[11] = 0;
  v57 = 1;
  v58 = *v21;
  v56[0] = 0;
  v56[1] = 0;
  swift_retain();
  swift_retain();
  v30 = sub_213CE5F38();
  v56[2] = 0xD00000000000001ALL;
  v56[3] = 0x8000000213CED560;
  v56[4] = v28;
  v56[5] = v30;
  v31 = static Color.primaryText.getter();
  v32 = *v16;
  v51 = v25;
  v52 = v26;
  v50 = v32;
  v53 = 0;
  v54 = 1;
  v55 = *v21;
  v45 = v39;
  swift_retain();
  swift_retain();
  v33 = sub_213CE5F38();
  v46 = 0xD000000000000014;
  v47 = 0x8000000213CED580;
  v48 = v31;
  v49 = v33;
  v34 = v40;
  sub_213CC3694((uint64_t)v11, v40, &qword_254D356B8);
  v35 = v41;
  sub_213CC3694((uint64_t)v8, v41, &qword_254D356B8);
  sub_213CC3694((uint64_t)v56, (uint64_t)v44, &qword_254D35780);
  sub_213CC3694((uint64_t)&v45, (uint64_t)v43, &qword_254D35780);
  v36 = v42;
  sub_213CC3694(v34, v42, &qword_254D356B8);
  v37 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254D35788);
  sub_213CC3694(v35, v36 + v37[12], &qword_254D356B8);
  sub_213CC3694((uint64_t)v44, v36 + v37[16], &qword_254D35780);
  sub_213CC3694((uint64_t)v43, v36 + v37[20], &qword_254D35780);
  sub_213CC3848((uint64_t)&v45, &qword_254D35780);
  sub_213CC3848((uint64_t)v56, &qword_254D35780);
  sub_213CC3848((uint64_t)v8, &qword_254D356B8);
  sub_213CC3848((uint64_t)v11, &qword_254D356B8);
  sub_213CC3848((uint64_t)v43, &qword_254D35780);
  sub_213CC3848((uint64_t)v44, &qword_254D35780);
  sub_213CC3848(v35, &qword_254D356B8);
  return sub_213CC3848(v34, &qword_254D356B8);
}

uint64_t sub_213CC20A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  *(_QWORD *)a1 = sub_213CE5D40();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D356C0);
  return sub_213CC1CDC(a1 + *(int *)(v2 + 44));
}

uint64_t sub_213CC20E8()
{
  sub_213CC3650();
  return sub_213CE5B84();
}

uint64_t sub_213CC2120()
{
  sub_213CC3650();
  return sub_213CE5B78();
}

uint64_t sub_213CC2158@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_213CE5C74();
  *a1 = result;
  return result;
}

uint64_t sub_213CC2180()
{
  return sub_213CE5C80();
}

uint64_t sub_213CC21A4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_213CE5C38();
  *a1 = result & 1;
  return result;
}

uint64_t sub_213CC21D0()
{
  return sub_213CE5C44();
}

uint64_t sub_213CC21F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D356B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_213CC223C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213CC2270()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213CC2280()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_213CC2294()
{
  unint64_t result;

  result = qword_254D356C8;
  if (!qword_254D356C8)
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE7158, &type metadata for PaymentItemPrimaryLabel_Previews);
    atomic_store(result, (unint64_t *)&qword_254D356C8);
  }
  return result;
}

uint64_t sub_213CC22D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213CC22E8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_213CC22F0()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_213CC2388(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64) + 7;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
  }
  else
  {
    v11 = a2[1];
    *a1 = *a2;
    a1[1] = v11;
    v12 = ((unint64_t)a1 + v6 + 16) & ~v6;
    v13 = ((unint64_t)a2 + v6 + 16) & ~v6;
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v14(v12, v13, v4);
    v15 = (v7 + v12) & 0xFFFFFFFFFFFFFFF8;
    v16 = (v7 + v13) & 0xFFFFFFFFFFFFFFF8;
    v17 = *(_QWORD *)(v16 + 24);
    *(_QWORD *)(v15 + 24) = v17;
    *(_QWORD *)(v15 + 32) = *(_QWORD *)(v16 + 32);
    (**(void (***)(unint64_t, unint64_t))(v17 - 8))(v15, v16);
    v18 = (v15 + 47) & 0xFFFFFFFFFFFFFFF8;
    v19 = (v16 + 47) & 0xFFFFFFFFFFFFFFF8;
    v20 = *(_QWORD *)v19;
    *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
    *(_QWORD *)v18 = v20;
    *(_QWORD *)((v15 + 63) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v16 + 63) & 0xFFFFFFFFFFFFF8);
  }
  swift_retain();
  return a1;
}

uint64_t sub_213CC24C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v5 = (a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v5);
  __swift_destroy_boxed_opaque_existential_1((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
  return swift_release();
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

_QWORD *sub_213CC2560(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  swift_bridgeObjectRetain();
  v10(v8, v9, v5);
  v11 = *(_QWORD *)(v6 + 64) + 7;
  v12 = (v11 + v8) & 0xFFFFFFFFFFFFFFF8;
  v13 = (v11 + v9) & 0xFFFFFFFFFFFFFFF8;
  v14 = *(_QWORD *)(v13 + 24);
  *(_QWORD *)(v12 + 24) = v14;
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v13 + 32);
  (**(void (***)(unint64_t, unint64_t))(v14 - 8))(v12, v13);
  v15 = (v12 + 47) & 0xFFFFFFFFFFFFFFF8;
  v16 = (v13 + 47) & 0xFFFFFFFFFFFFFFF8;
  v17 = *(_QWORD *)v16;
  *(_BYTE *)(v15 + 8) = *(_BYTE *)(v16 + 8);
  *(_QWORD *)v15 = v17;
  *(_QWORD *)((v12 + 63) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v13 + 63) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

_QWORD *sub_213CC2648(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v8, v9);
  v10 = *(_QWORD *)(v6 + 64) + 7;
  v11 = (uint64_t *)((v10 + v8) & 0xFFFFFFFFFFFFFFF8);
  v12 = (uint64_t *)((v10 + v9) & 0xFFFFFFFFFFFFFFF8);
  __swift_assign_boxed_opaque_existential_1(v11, v12);
  v13 = ((unint64_t)v11 + 47) & 0xFFFFFFFFFFFFFFF8;
  v14 = ((unint64_t)v12 + 47) & 0xFFFFFFFFFFFFFFF8;
  v15 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  *(_QWORD *)v13 = v15;
  *(_QWORD *)(((unint64_t)v11 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v12 + 63) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

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
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
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
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

_OWORD *sub_213CC289C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = ((unint64_t)a1 + v5 + 16) & ~v5;
  v7 = ((unint64_t)a2 + v5 + 16) & ~v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v6, v7);
  v8 = *(_QWORD *)(v4 + 64) + 7;
  v9 = (v8 + v6) & 0xFFFFFFFFFFFFFFF8;
  v10 = (v8 + v7) & 0xFFFFFFFFFFFFFFF8;
  v11 = *(_OWORD *)v10;
  v12 = *(_OWORD *)(v10 + 16);
  *(_QWORD *)(v9 + 32) = *(_QWORD *)(v10 + 32);
  *(_OWORD *)v9 = v11;
  *(_OWORD *)(v9 + 16) = v12;
  v13 = (v9 + 47) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v10 + 47) & 0xFFFFFFFFFFFFFFF8;
  v15 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  *(_QWORD *)v13 = v15;
  *(_QWORD *)((v9 + 63) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v10 + 63) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_213CC295C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v9, v10);
  v11 = *(_QWORD *)(v7 + 64) + 7;
  v12 = (v11 + v9) & 0xFFFFFFFFFFFFFFF8;
  v13 = (v11 + v10) & 0xFFFFFFFFFFFFFFF8;
  __swift_destroy_boxed_opaque_existential_1(v12);
  v14 = *(_OWORD *)v13;
  v15 = *(_OWORD *)(v13 + 16);
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v13 + 32);
  *(_OWORD *)v12 = v14;
  *(_OWORD *)(v12 + 16) = v15;
  v16 = (v12 + 47) & 0xFFFFFFFFFFFFFFF8;
  v17 = (v13 + 47) & 0xFFFFFFFFFFFFFFF8;
  v18 = *(_QWORD *)v17;
  *(_BYTE *)(v16 + 8) = *(_BYTE *)(v17 + 8);
  *(_QWORD *)v16 = v18;
  *(_QWORD *)((v12 + 63) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((v13 + 63) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_213CC2A3C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = *(_QWORD *)(v4 + 64) + 7;
  if (v6 >= a2)
  {
    v13 = (a1 + v7 + 16) & ~v7;
    if (v5 < 0x7FFFFFFF)
    {
      v14 = *(_QWORD *)(((v8 + v13) & 0xFFFFFFFFFFFFF8) + 0x18);
      if (v14 >= 0xFFFFFFFF)
        LODWORD(v14) = -1;
      return (v14 + 1);
    }
    else
    {
      return (*(uint64_t (**)(uint64_t))(v4 + 48))(v13);
    }
  }
  else
  {
    if (((((((v8 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v6 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    return ((uint64_t (*)(void))((char *)&loc_213CC2AD0 + 4 * byte_213CE6FB0[v11]))();
  }
}

void sub_213CC2B60(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 >= a3)
  {
    v10 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7 + (((_DWORD)v7 + 16) & ~(_DWORD)v7)) & 0xFFFFFFF8) + 63) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v8 = a3 - v6 + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X14 }
  }
  if (((((*(_DWORD *)(v5 + 64) + 7 + (((_DWORD)v7 + 16) & ~(_DWORD)v7)) & 0xFFFFFFF8) + 63) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v11 = ~v6 + a2;
    bzero(a1, ((((*(_QWORD *)(v5 + 64) + 7 + ((v7 + 16) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 63) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v11;
  }
  __asm { BR              X10 }
}

void sub_213CC2C70()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x213CC2CF8);
}

void sub_213CC2C78(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x213CC2C80);
  JUMPOUT(0x213CC2CF8);
}

void sub_213CC2CC8()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x213CC2CF8);
}

void sub_213CC2CD0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x213CC2CF8);
}

uint64_t sub_213CC2CD8@<X0>(int a1@<W1>, unsigned int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_WORD *)(v8 + v9) = 0;
  if (!a1)
    goto LABEL_6;
  v3 = (v8 + v7 + 16) & a3;
  if (a2 < 0x7FFFFFFF)
  {
    if (a1 < 0)
      JUMPOUT(0x213CC2CE4);
    *(_QWORD *)(((v6 + v3) & 0xFFFFFFFFFFFFFFF8) + 24) = (a1 - 1);
LABEL_6:
    JUMPOUT(0x213CC2CF8);
  }
  return (*(uint64_t (**)(uint64_t))(v5 + 56))(v3);
}

uint64_t initializeBufferWithCopyOfBuffer for SubtextView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SubtextView()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for SubtextView(_QWORD *a1, _QWORD *a2)
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
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for SubtextView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for SubtextView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SubtextView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SubtextView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SubtextView()
{
  return &type metadata for SubtextView;
}

uint64_t *initializeBufferWithCopyOfBuffer for AttributedSubtextView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D356B0) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = sub_213CE598C();
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      memcpy(a1, a2, *(_QWORD *)(v4 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  return a1;
}

uint64_t destroy for AttributedSubtextView(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = sub_213CE598C();
  v3 = *(_QWORD *)(v2 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return result;
}

void *initializeWithCopy for AttributedSubtextView(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_213CE598C();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D356B0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithCopy for AttributedSubtextView(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;

  v4 = sub_213CE598C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D356B0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

void *initializeWithTake for AttributedSubtextView(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_213CE598C();
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D356B0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithTake for AttributedSubtextView(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;

  v4 = sub_213CE598C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D356B0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AttributedSubtextView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_213CC33A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D356B0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AttributedSubtextView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_213CC33EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D356B0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AttributedSubtextView()
{
  uint64_t result;

  result = qword_254D36770;
  if (!qword_254D36770)
    return swift_getSingletonMetadata();
  return result;
}

void sub_213CC346C()
{
  unint64_t v0;

  sub_213CC34D4();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_213CC34D4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254D35728[0])
  {
    sub_213CE598C();
    v0 = sub_213CE6334();
    if (!v1)
      atomic_store(v0, qword_254D35728);
  }
}

ValueMetadata *type metadata accessor for PaymentItemPrimaryLabel_Previews()
{
  return &type metadata for PaymentItemPrimaryLabel_Previews;
}

void sub_213CC3538()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35648);
  swift_getTupleTypeMetadata2();
  v0 = sub_213CE6214();
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v0);
  sub_213CE6190();
  JUMPOUT(0x2199C1EA8);
}

unint64_t sub_213CC35B8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35758;
  if (!qword_254D35758)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35760);
    v2[0] = sub_213CC16BC();
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35758);
  }
  return result;
}

uint64_t sub_213CC3624()
{
  return sub_213CC0B2C(&qword_254D35768, &qword_254D35770, MEMORY[0x24BDF4700]);
}

unint64_t sub_213CC3650()
{
  unint64_t result;

  result = qword_254D35778;
  if (!qword_254D35778)
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE7110, &type metadata for PaymentItemPrimaryLabel_Previews);
    atomic_store(result, (unint64_t *)&qword_254D35778);
  }
  return result;
}

uint64_t sub_213CC3694(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_213CC36D8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_254D35798;
  if (!qword_254D35798)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35648);
    v2 = sub_213CC373C();
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254D35798);
  }
  return result;
}

unint64_t sub_213CC373C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D357A0;
  if (!qword_254D357A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35790);
    v2[0] = sub_213CC37C8(&qword_254D357A8, &qword_254D357B0, &qword_254D35698, &qword_254D356A0);
    v2[1] = sub_213CC17CC();
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D357A0);
  }
  return result;
}

uint64_t sub_213CC37C8(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = sub_213CC0B2C(a3, a4, MEMORY[0x24BDF1028]);
    v10[0] = MEMORY[0x24BDF1F80];
    v10[1] = v9;
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v8, v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_213CC3848(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2199C1E0C](a1, v6, a5);
}

uint64_t PhysicalButtonView.init(glyph:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = swift_getKeyPath();
  *(_BYTE *)(a2 + 8) = 0;
  return sub_213CC3980(a1, a2 + 16);
}

uint64_t sub_213CC3914@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.userInterfaceType.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_213CC394C()
{
  return EnvironmentValues.userInterfaceType.setter();
}

uint64_t sub_213CC3980(__int128 *a1, uint64_t a2)
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

id PhysicalButtonView.makeUIView(context:)()
{
  id v0;
  void *v1;
  id v2;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE60878]), sel_initWithStyle_, 1);
  if (v0)
  {
    v1 = v0;
    sub_213CC3A40(v0);
    v2 = objc_allocWithZone((Class)type metadata accessor for PhysicalButtonContainerView());
    return sub_213CC445C(v1);
  }
  else
  {
    result = (id)sub_213CE63C4();
    __break(1u);
  }
  return result;
}

id sub_213CC3A40(void *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  char v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v23[16];
  _QWORD v24[3];
  uint64_t v25;
  uint64_t v26;

  v2 = (uint64_t)v1;
  v4 = *v1;
  v5 = *(_BYTE *)(v2 + 8);
  sub_213CC5008(v4, v5);
  sub_213CC4680(v4, v5, v23);
  sub_213CC5044(v4, v5);
  if (!UserInterfaceType.isPad.getter() || (*sub_213CBBAA0() & 1) != 0)
  {
    sub_213CC4850(v2, (uint64_t)v23);
LABEL_4:
    v6 = 0;
    goto LABEL_5;
  }
  v14 = *sub_213CBBB50();
  sub_213CC4850(v2, (uint64_t)v23);
  if ((v14 & 1) != 0)
    goto LABEL_4;
  v15 = v25;
  v16 = v26;
  __swift_project_boxed_opaque_existential_1(v24, v25);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 56))(v15, v16) ^ 1;
LABEL_5:
  sub_213CC48B8((uint64_t)v23);
  v7 = (_QWORD *)(v2 + 16);
  v8 = *(_QWORD *)(v2 + 40);
  v9 = *(_QWORD *)(v2 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 16), v8);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v9 + 24))(v8, v9) & 1) == 0)
  {
    v10 = objc_msgSend(a1, sel_setAnimationStyle_, 0);
    if ((v6 & 1) != 0)
      goto LABEL_9;
LABEL_13:
    v17 = *(_QWORD *)(v2 + 40);
    v18 = *(_QWORD *)(v2 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 16), v17);
    (*(void (**)(uint64_t, uint64_t))(v18 + 32))(v17, v18);
    goto LABEL_14;
  }
  if ((v6 & 1) == 0)
  {
    objc_msgSend(a1, sel_setAnimationStyle_, 1);
    goto LABEL_13;
  }
  v10 = objc_msgSend(a1, sel_setAnimationStyle_, 2);
LABEL_9:
  v11 = nullsub_1(v10);
  v12 = (void *)sub_213CD7954(v11);
  PaymentUIBaseLocalizedString(for:table:bundle:)(0xD000000000000010, 0x8000000213CED920, v13, v12);

LABEL_14:
  v19 = (void *)sub_213CE628C();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setInstruction_, v19);

  v21 = *(_QWORD *)(v2 + 40);
  v20 = *(_QWORD *)(v2 + 48);
  __swift_project_boxed_opaque_existential_1(v7, v21);
  return objc_msgSend(a1, sel_setAnimating_, (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 24))(v21, v20) & 1);
}

id sub_213CC3C58(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return sub_213CC445C(a1);
}

uint64_t type metadata accessor for PhysicalButtonContainerView()
{
  return objc_opt_self();
}

uint64_t PhysicalButtonView.updateUIView(_:context:)(char *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char *v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[2];
  _QWORD v29[3];
  uint64_t v30;
  uint64_t v31;

  v3 = sub_213CE5A10();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_213CCBB5C();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  sub_213CC4850(v1, (uint64_t)aBlock);
  v8 = sub_213CE59F8();
  v9 = sub_213CE6310();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v25 = a1;
    v11 = (uint8_t *)v10;
    v23 = swift_slowAlloc();
    v27 = v23;
    *(_DWORD *)v11 = 136315138;
    v24 = v3;
    v13 = v30;
    v12 = v31;
    __swift_project_boxed_opaque_existential_1(v29, v30);
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v12 + 24))(v13, v12) & 1) != 0)
      v14 = 2003789907;
    else
      v14 = 1701079368;
    v26 = sub_213CC4974(v14, 0xE400000000000000, &v27);
    sub_213CE6340();
    swift_bridgeObjectRelease();
    sub_213CC48B8((uint64_t)aBlock);
    _os_log_impl(&dword_213CB9000, v8, v9, "Update button view: %s", v11, 0xCu);
    v15 = v23;
    swift_arrayDestroy();
    MEMORY[0x2199C1F38](v15, -1, -1);
    v16 = v11;
    a1 = v25;
    MEMORY[0x2199C1F38](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v24);
  }
  else
  {
    sub_213CC48B8((uint64_t)aBlock);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_213CC3A40(*(void **)&a1[OBJC_IVAR____TtC13PaymentUIBase27PhysicalButtonContainerView_buttonView]);
  v17 = (void *)objc_opt_self();
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a1;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = sub_213CC4910;
  *(_QWORD *)(v19 + 24) = v18;
  v29[2] = sub_213CC493C;
  v30 = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  v29[0] = sub_213CC3FE0;
  v29[1] = &block_descriptor;
  v20 = _Block_copy(aBlock);
  v21 = a1;
  swift_retain();
  swift_release();
  objc_msgSend(v17, sel_performWithoutAnimation_, v20);
  _Block_release(v20);
  LOBYTE(v20) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v20 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_213CC3FE0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t static PhysicalButtonView.physicalButtonEdge()()
{
  double v0;
  CGFloat v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  double x;
  double y;
  double width;
  double height;
  double MinX;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  _BOOL4 v31;
  double MidY;
  double v34;
  CGFloat v35;
  CGFloat v36;
  double MinY;
  double v38;
  double v39;
  CGFloat rect;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  LAUIPhysicalButtonNormalizedFrame();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v36 = v4;
  rect = v6;
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_mainScreen);
  v9 = objc_msgSend(v8, sel_coordinateSpace);

  v10 = objc_msgSend(v7, sel_mainScreen);
  v11 = objc_msgSend(v10, sel_fixedCoordinateSpace);

  objc_msgSend(v11, sel_bounds);
  x = v41.origin.x;
  y = v41.origin.y;
  width = v41.size.width;
  height = v41.size.height;
  MinX = CGRectGetMinX(v41);
  v42.origin.x = v1;
  v42.origin.y = v3;
  v42.size.width = v5;
  v42.size.height = rect;
  v17 = CGRectGetMinX(v42);
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  v39 = MinX + v17 * CGRectGetWidth(v43);
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  MinY = CGRectGetMinY(v44);
  v45.origin.x = v1;
  v35 = v1;
  v45.origin.y = v3;
  v45.size.width = v36;
  v45.size.height = rect;
  v34 = CGRectGetMinY(v45);
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v38 = MinY + v34 * CGRectGetHeight(v46);
  v47.origin.x = v1;
  v47.origin.y = v3;
  v47.size.width = v36;
  v47.size.height = rect;
  v18 = CGRectGetWidth(v47);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  v19 = v18 * CGRectGetWidth(v48);
  v49.origin.x = v35;
  v49.origin.y = v3;
  v49.size.width = v36;
  v49.size.height = rect;
  v20 = CGRectGetHeight(v49);
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  objc_msgSend(v9, sel_convertRect_toCoordinateSpace_, v11, v39, v38, v19, v20 * CGRectGetHeight(v50));
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_msgSend(v9, sel_convertRect_fromCoordinateSpace_, v11, x, y, width, height);
  if (v26 <= 0.0)
  {
    MidY = CGRectGetMidY(*(CGRect *)&v27);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    if (MidY > v24)
      return 1;
    else
      return 3;
  }
  else
  {
    v31 = CGRectGetMidX(*(CGRect *)&v27) <= v22;
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return (2 * v31);
  }
}

id sub_213CC429C()
{
  id v0;
  void *v1;
  id v2;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE60878]), sel_initWithStyle_, 1);
  if (v0)
  {
    v1 = v0;
    sub_213CC3A40(v0);
    v2 = objc_allocWithZone((Class)type metadata accessor for PhysicalButtonContainerView());
    return sub_213CC445C(v1);
  }
  else
  {
    result = (id)sub_213CE63C4();
    __break(1u);
  }
  return result;
}

uint64_t sub_213CC4358()
{
  return sub_213CE5D7C();
}

uint64_t sub_213CC4398()
{
  sub_213CC523C();
  return sub_213CE5DDC();
}

uint64_t sub_213CC43E8()
{
  sub_213CC523C();
  return sub_213CE5D88();
}

void sub_213CC4438()
{
  sub_213CC523C();
  sub_213CE5DD0();
  __break(1u);
}

id sub_213CC445C(void *a1)
{
  char *v1;
  id v2;
  char *v3;
  void *v4;
  id v5;
  objc_super v7;

  *(_QWORD *)&v1[OBJC_IVAR____TtC13PaymentUIBase27PhysicalButtonContainerView_buttonView] = a1;
  v2 = a1;
  v3 = v1;
  v4 = (void *)sub_213CE628C();
  objc_msgSend(v2, sel_setAccessibilityIdentifier_, v4);

  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for PhysicalButtonContainerView();
  v5 = objc_msgSendSuper2(&v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v5, sel_addSubview_, v2);

  return v5;
}

id PhysicalButtonContainerView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void PhysicalButtonContainerView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PhysicalButtonContainerView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhysicalButtonContainerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_213CC4680@<X0>(uint64_t a1@<X0>, char a2@<W1>, _BYTE *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  os_log_type_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[3];
  uint64_t v18;

  v6 = sub_213CE5CC8();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    *a3 = a1;
  }
  else
  {
    sub_213CC5008(a1, 0);
    v11 = sub_213CE6304();
    v12 = sub_213CE5ECC();
    v13 = v11;
    if (os_log_type_enabled(v12, v11))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v17[1] = a3;
      v16 = v15;
      v18 = v15;
      *(_DWORD *)v14 = 136315138;
      v17[2] = sub_213CC4974(0xD000000000000011, 0x8000000213CED940, &v18);
      sub_213CE6340();
      _os_log_impl(&dword_213CB9000, v12, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C1F38](v16, -1, -1);
      MEMORY[0x2199C1F38](v14, -1, -1);
    }

    sub_213CE5CBC();
    swift_getAtKeyPath();
    sub_213CC5044(a1, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return result;
}

uint64_t sub_213CC4850(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  __int128 v6;

  v4 = *(_QWORD *)a1;
  v5 = *(_BYTE *)(a1 + 8);
  sub_213CC5008(*(_QWORD *)a1, v5);
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v5;
  v6 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 40) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a2 + 16, a1 + 16);
  return a2;
}

uint64_t sub_213CC48B8(uint64_t a1)
{
  sub_213CC5044(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  return a1;
}

uint64_t sub_213CC48EC()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_213CC4910()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC13PaymentUIBase27PhysicalButtonContainerView_buttonView), sel_updateFrame);
}

uint64_t sub_213CC492C()
{
  return swift_deallocObject();
}

uint64_t sub_213CC493C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_213CC4974(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_213CC4A44(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_213CC5280((uint64_t)v12, *a3);
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
      sub_213CC5280((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_213CC4A44(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_213CE634C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_213CC4BFC(a5, a6);
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
  v8 = sub_213CE6388();
  if (!v8)
  {
    sub_213CE63B8();
    __break(1u);
LABEL_17:
    result = sub_213CE6400();
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

uint64_t sub_213CC4BFC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_213CC4C90(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_213CC4E68(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_213CC4E68(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_213CC4C90(uint64_t a1, unint64_t a2)
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
      v3 = sub_213CC4E04(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_213CE6370();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_213CE63B8();
      __break(1u);
LABEL_10:
      v2 = sub_213CE62B0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_213CE6400();
    __break(1u);
LABEL_14:
    result = sub_213CE63B8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_213CC4E04(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D357F8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_213CC4E68(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D357F8);
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
  result = sub_213CE6400();
  __break(1u);
  return result;
}

unint64_t sub_213CC4FB8()
{
  unint64_t result;

  result = qword_254D357C0;
  if (!qword_254D357C0)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for PhysicalButtonView, &type metadata for PhysicalButtonView);
    atomic_store(result, (unint64_t *)&qword_254D357C0);
  }
  return result;
}

uint64_t sub_213CC4FFC()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_213CC5008(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t destroy for PhysicalButtonView(uint64_t a1)
{
  sub_213CC5044(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return __swift_destroy_boxed_opaque_existential_1(a1 + 16);
}

uint64_t sub_213CC5044(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t initializeWithCopy for PhysicalButtonView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  __int128 v6;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_213CC5008(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 16, a2 + 16);
  return a1;
}

uint64_t assignWithCopy for PhysicalButtonView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_213CC5008(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_213CC5044(v6, v7);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PhysicalButtonView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  __int128 v8;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_213CC5044(v6, v7);
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v8 = *((_OWORD *)a2 + 2);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  *(_OWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 48) = a2[6];
  return a1;
}

uint64_t getEnumTagSinglePayload for PhysicalButtonView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PhysicalButtonView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PhysicalButtonView()
{
  return &type metadata for PhysicalButtonView;
}

uint64_t method lookup function for PhysicalButtonContainerView()
{
  return swift_lookUpClassMethod();
}

unint64_t sub_213CC523C()
{
  unint64_t result;

  result = qword_254D357F0;
  if (!qword_254D357F0)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for PhysicalButtonView, &type metadata for PhysicalButtonView);
    atomic_store(result, (unint64_t *)&qword_254D357F0);
  }
  return result;
}

uint64_t sub_213CC5280(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

BOOL static ChevronStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ChevronStyle.hash(into:)()
{
  return sub_213CE643C();
}

uint64_t ChevronStyle.hashValue.getter()
{
  sub_213CE6430();
  sub_213CE643C();
  return sub_213CE6448();
}

void ChevronView.style.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t ChevronView.init(style:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3;
  uint64_t result;

  v3 = *a1;
  result = swift_getKeyPath();
  *(_BYTE *)a2 = v3;
  *(_QWORD *)(a2 + 8) = result;
  *(_BYTE *)(a2 + 16) = 0;
  return result;
}

uint64_t sub_213CC5384@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_213CE5BF0();
  *a1 = v3;
  return result;
}

uint64_t ChevronView.body.getter@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t KeyPath;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE *v35;
  _BYTE *v36;
  _BYTE v38[12];
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  _BYTE *v46;
  uint64_t v47;

  v47 = a1;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35800);
  MEMORY[0x24BDAC7A8](v41);
  v3 = (uint64_t *)&v38[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_213CE6118();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v38[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35808);
  MEMORY[0x24BDAC7A8](v40);
  v9 = (uint64_t *)&v38[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35810);
  MEMORY[0x24BDAC7A8](v42);
  v11 = &v38[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35818);
  MEMORY[0x24BDAC7A8](v43);
  v46 = &v38[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35820);
  MEMORY[0x24BDAC7A8](v44);
  v45 = &v38[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v39 = *v1;
  v14 = *((_QWORD *)v1 + 1);
  v15 = v1[16];
  v16 = sub_213CE610C();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF40B0], v4);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, _BYTE *, uint64_t))(v5 + 16))((char *)v3 + *(int *)(v41 + 28), v7, v4);
  *v3 = KeyPath;
  sub_213CC3694((uint64_t)v3, (uint64_t)v9 + *(int *)(v40 + 36), &qword_254D35800);
  *v9 = v16;
  swift_retain();
  sub_213CC3848((uint64_t)v3, &qword_254D35800);
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  swift_release();
  sub_213CE5F38();
  sub_213CE5F5C();
  v18 = sub_213CE5F74();
  swift_release();
  v19 = swift_getKeyPath();
  sub_213CC3694((uint64_t)v9, (uint64_t)v11, &qword_254D35808);
  v20 = (uint64_t *)&v11[*(int *)(v42 + 36)];
  *v20 = v19;
  v20[1] = v18;
  sub_213CC3848((uint64_t)v9, &qword_254D35808);
  if (v39 == 3)
  {
    sub_213CC5008(v14, v15);
    v22 = sub_213CBC234();
LABEL_6:
    v21 = *v22;
    swift_retain();
    sub_213CC5044(v14, v15);
    goto LABEL_7;
  }
  if (v39 != 2)
  {
    sub_213CC5008(v14, v15);
    v22 = sub_213CBC334();
    goto LABEL_6;
  }
  v21 = sub_213CE60B8();
LABEL_7:
  v23 = swift_getKeyPath();
  v24 = v46;
  sub_213CC3694((uint64_t)v11, (uint64_t)v46, &qword_254D35810);
  v25 = (uint64_t *)&v24[*(int *)(v43 + 36)];
  *v25 = v23;
  v25[1] = v21;
  sub_213CC3848((uint64_t)v11, &qword_254D35810);
  v26 = sub_213CE5EFC();
  sub_213CC5008(v14, v15);
  sub_213CC59F0(v14, v15);
  sub_213CC5044(v14, v15);
  sub_213CE5AA0();
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v35 = v45;
  sub_213CC3694((uint64_t)v24, (uint64_t)v45, &qword_254D35818);
  v36 = &v35[*(int *)(v44 + 36)];
  *v36 = v26;
  *((_QWORD *)v36 + 1) = v28;
  *((_QWORD *)v36 + 2) = v30;
  *((_QWORD *)v36 + 3) = v32;
  *((_QWORD *)v36 + 4) = v34;
  v36[40] = 0;
  sub_213CC3848((uint64_t)v24, &qword_254D35818);
  return sub_213CC5CC0((uint64_t)v35, v47);
}

uint64_t sub_213CC57E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  KeyPath = swift_getKeyPath();
  v3 = swift_getKeyPath();
  v4 = swift_getKeyPath();
  v5 = swift_getKeyPath();
  *(_BYTE *)a1 = 2;
  *(_QWORD *)(a1 + 8) = KeyPath;
  *(_BYTE *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = 3;
  *(_QWORD *)(a1 + 32) = v3;
  *(_BYTE *)(a1 + 40) = 0;
  *(_BYTE *)(a1 + 48) = 1;
  *(_QWORD *)(a1 + 56) = v4;
  *(_BYTE *)(a1 + 64) = 0;
  *(_BYTE *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = v5;
  *(_BYTE *)(a1 + 88) = 0;
  sub_213CC5008(KeyPath, 0);
  sub_213CC5008(v3, 0);
  sub_213CC5008(v4, 0);
  sub_213CC5008(v5, 0);
  sub_213CC5044(v5, 0);
  sub_213CC5044(v4, 0);
  sub_213CC5044(v3, 0);
  return sub_213CC5044(KeyPath, 0);
}

uint64_t sub_213CC58E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t result;
  char v14;
  _BYTE v15[8];
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  char v26;

  v2 = sub_213CE5D40();
  sub_213CC57E4((uint64_t)v15);
  v3 = v15[0];
  v4 = v16;
  v5 = v17;
  v6 = v18;
  v7 = v19;
  v8 = v20;
  v9 = v21;
  v10 = v22;
  v11 = v23;
  v12 = v24;
  result = v25;
  v14 = v26;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_BYTE *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = v4;
  *(_BYTE *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 56) = v7;
  *(_BYTE *)(a1 + 64) = v8;
  *(_BYTE *)(a1 + 72) = v9;
  *(_QWORD *)(a1 + 80) = v10;
  *(_BYTE *)(a1 + 88) = v11;
  *(_BYTE *)(a1 + 96) = v12;
  *(_QWORD *)(a1 + 104) = result;
  *(_BYTE *)(a1 + 112) = v14;
  return result;
}

uint64_t sub_213CC5980()
{
  sub_213CC62F8();
  return sub_213CE5B84();
}

uint64_t sub_213CC59B8()
{
  sub_213CC62F8();
  return sub_213CE5B78();
}

double sub_213CC59F0(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  double v14;

  v4 = sub_213CE5CC8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return *(double *)&a1;
  swift_retain();
  v8 = sub_213CE6304();
  v9 = sub_213CE5ECC();
  if (os_log_type_enabled(v9, v8))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v14 = *(double *)&v11;
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = sub_213CC4974(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v14);
    _os_log_impl(&dword_213CB9000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C1F38](v11, -1, -1);
    MEMORY[0x2199C1F38](v10, -1, -1);
  }

  sub_213CE5CBC();
  swift_getAtKeyPath();
  sub_213CC5044(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_213CC5B84()
{
  return sub_213CE5BCC();
}

uint64_t sub_213CC5BA4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_213CE6118();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_213CE5BD8();
}

uint64_t sub_213CC5C20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_213CE5C8C();
  *a1 = result;
  return result;
}

uint64_t sub_213CC5C48()
{
  swift_retain();
  return sub_213CE5C98();
}

uint64_t sub_213CC5C70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_213CE5C14();
  *a1 = result;
  return result;
}

uint64_t sub_213CC5C98()
{
  swift_retain();
  return sub_213CE5C20();
}

uint64_t sub_213CC5CC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35820);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_213CC5D0C()
{
  unint64_t result;

  result = qword_254D35828;
  if (!qword_254D35828)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for ChevronStyle, &type metadata for ChevronStyle);
    atomic_store(result, (unint64_t *)&qword_254D35828);
  }
  return result;
}

uint64_t sub_213CC5D50()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_213CC5D64()
{
  unint64_t result;

  result = qword_254D35830;
  if (!qword_254D35830)
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE75A0, &type metadata for PaymentItemChevron_Previews);
    atomic_store(result, (unint64_t *)&qword_254D35830);
  }
  return result;
}

uint64_t sub_213CC5DA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for ChevronStyle(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ChevronStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_213CC5E94 + 4 * byte_213CE73D5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_213CC5EC8 + 4 * byte_213CE73D0[v4]))();
}

uint64_t sub_213CC5EC8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213CC5ED0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213CC5ED8);
  return result;
}

uint64_t sub_213CC5EE4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213CC5EECLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_213CC5EF0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213CC5EF8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ChevronStyle()
{
  return &type metadata for ChevronStyle;
}

uint64_t destroy for ChevronView(uint64_t a1)
{
  return sub_213CC5044(*(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s13PaymentUIBase11ChevronViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_BYTE *)(a2 + 16);
  sub_213CC5008(v3, v4);
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithCopy for ChevronView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_BYTE *)(a2 + 16);
  sub_213CC5008(v3, v4);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  sub_213CC5044(v5, v6);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ChevronView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  sub_213CC5044(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ChevronView(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ChevronView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ChevronView()
{
  return &type metadata for ChevronView;
}

ValueMetadata *type metadata accessor for PaymentItemChevron_Previews()
{
  return &type metadata for PaymentItemChevron_Previews;
}

unint64_t sub_213CC60D4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35838;
  if (!qword_254D35838)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35820);
    v2[0] = sub_213CC6140();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35838);
  }
  return result;
}

unint64_t sub_213CC6140()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35840;
  if (!qword_254D35840)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35818);
    v2[0] = sub_213CC61C4();
    v2[1] = sub_213CC0B2C(&qword_254D35870, &qword_254D35878, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35840);
  }
  return result;
}

unint64_t sub_213CC61C4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35848;
  if (!qword_254D35848)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35810);
    v2[0] = sub_213CC6248();
    v2[1] = sub_213CC0B2C(&qword_254D35860, &qword_254D35868, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35848);
  }
  return result;
}

unint64_t sub_213CC6248()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254D35850;
  if (!qword_254D35850)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35808);
    v2 = sub_213CC0B2C(&qword_254D35858, &qword_254D35800, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254D35850);
  }
  return result;
}

uint64_t sub_213CC62CC()
{
  return sub_213CC0B2C(&qword_254D35880, &qword_254D35888, MEMORY[0x24BDF4700]);
}

unint64_t sub_213CC62F8()
{
  unint64_t result;

  result = qword_254D35890;
  if (!qword_254D35890)
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE7558, &type metadata for PaymentItemChevron_Previews);
    atomic_store(result, (unint64_t *)&qword_254D35890);
  }
  return result;
}

uint64_t AuthorizationViewHostingControllerContext.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  AuthorizationViewHostingControllerContext.init()();
  return v0;
}

uint64_t AuthorizationViewHostingControllerContext.init()()
{
  uint64_t v0;
  uint64_t v1;
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
  char *v13;
  uint64_t v14;
  void (*v15)(uint64_t, char *, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F0B9C0);
  v26 = *(_QWORD *)(v1 - 8);
  v27 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v25 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F0B9A8);
  v23 = *(_QWORD *)(v3 - 8);
  v24 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F0B9E0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isPresented;
  LOBYTE(v28) = 0;
  sub_213CE5A34();
  v15 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
  v15(v14, v13, v10);
  v16 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isArmable;
  LOBYTE(v28) = 1;
  sub_213CE5A34();
  v15(v16, v13, v10);
  v17 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__armableObserverError;
  v28 = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F0BAD0);
  sub_213CE5A34();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v17, v9, v6);
  v18 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__physicalButtonEdge;
  LODWORD(v28) = 1;
  type metadata accessor for CGRectEdge(0);
  sub_213CE5A34();
  (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v18, v5, v24);
  v19 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isAnimating;
  LOBYTE(v28) = 0;
  sub_213CE5A34();
  v15(v19, v13, v10);
  v20 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__screen;
  v28 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BAC8);
  v21 = v25;
  sub_213CE5A34();
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v20, v21, v27);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext_animationDuration) = 0x3FD3333333333333;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext_springAnimationDuration) = 0x3FE199999999999ALL;
  return v0;
}

uint64_t sub_213CC6638@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 152))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_213CC666C(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 160))(*a1);
}

uint64_t sub_213CC6698()
{
  return sub_213CBF0A8();
}

uint64_t sub_213CC66AC()
{
  return sub_213CBF124();
}

uint64_t (*sub_213CC66C0(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CC6738(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 176))();
}

uint64_t sub_213CC6760(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 184))(v6);
}

uint64_t sub_213CC67EC()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isPresented, &qword_253F0B988);
}

uint64_t sub_213CC6800(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_253F0B940, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isPresented, &qword_253F0B988);
}

uint64_t (*sub_213CC681C(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isPresented;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

uint64_t sub_213CC68E4@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 200))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_213CC6918(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 208))(*a1);
}

uint64_t sub_213CC6944()
{
  return sub_213CBF0A8();
}

uint64_t sub_213CC6958()
{
  return sub_213CBF124();
}

uint64_t (*sub_213CC696C(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CC69E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 224))();
}

uint64_t sub_213CC6A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 232))(v6);
}

uint64_t sub_213CC6A98()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isArmable, &qword_253F0B988);
}

uint64_t sub_213CC6AAC(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_253F0B940, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isArmable, &qword_253F0B988);
}

uint64_t (*sub_213CC6AC8(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isArmable;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

uint64_t sub_213CC6B90@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 248))();
  *a2 = result;
  return result;
}

uint64_t sub_213CC6BC0(id *a1, uint64_t a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))(**(_QWORD **)a2 + 256);
  v4 = *a1;
  return v3(v2);
}

uint64_t sub_213CC6C00()
{
  return sub_213CC74D4();
}

uint64_t sub_213CC6C14()
{
  return sub_213CC7550();
}

uint64_t (*sub_213CC6C28(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CC6CA0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 272))();
}

uint64_t sub_213CC6CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35898);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 280))(v6);
}

uint64_t sub_213CC6D54()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__armableObserverError, (uint64_t *)&unk_253F0B9E0);
}

uint64_t sub_213CC6D68(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_254D35898, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__armableObserverError, (uint64_t *)&unk_253F0B9E0);
}

uint64_t (*sub_213CC6D84(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35898);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__armableObserverError;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F0B9E0);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

uint64_t sub_213CC6E4C@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 296))();
  *a2 = result;
  return result;
}

uint64_t sub_213CC6E7C(unsigned int *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 304))(*a1);
}

uint64_t sub_213CC6EA8()
{
  unsigned int v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_213CE5A64();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_213CC6F18()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_213CE5A70();
}

uint64_t (*sub_213CC6F84(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CC6FFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 320))();
}

uint64_t sub_213CC7024(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D358A0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 328))(v6);
}

uint64_t sub_213CC70B0()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__physicalButtonEdge, (uint64_t *)&unk_253F0B9A8);
}

uint64_t sub_213CC70C4(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_254D358A0, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__physicalButtonEdge, (uint64_t *)&unk_253F0B9A8);
}

uint64_t (*sub_213CC70E0(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D358A0);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__physicalButtonEdge;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F0B9A8);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

uint64_t sub_213CC71A8@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 344))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_213CC71DC(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 352))(*a1);
}

uint64_t sub_213CC7208()
{
  return sub_213CBF0A8();
}

uint64_t sub_213CC721C()
{
  return sub_213CBF124();
}

uint64_t (*sub_213CC7230(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CC72A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 368))();
}

uint64_t sub_213CC72D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 376))(v6);
}

uint64_t sub_213CC735C()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isAnimating, &qword_253F0B988);
}

uint64_t sub_213CC7370(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_253F0B940, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isAnimating, &qword_253F0B988);
}

uint64_t (*sub_213CC738C(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isAnimating;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

uint64_t sub_213CC7454@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 392))();
  *a2 = result;
  return result;
}

uint64_t sub_213CC7484(id *a1, uint64_t a2)
{
  id v2;
  uint64_t (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(uint64_t (**)(id))(**(_QWORD **)a2 + 400);
  v4 = *a1;
  return v3(v2);
}

uint64_t sub_213CC74C0()
{
  return sub_213CC74D4();
}

uint64_t sub_213CC74D4()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_213CE5A64();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_213CC753C()
{
  return sub_213CC7550();
}

uint64_t sub_213CC7550()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_213CE5A70();
}

uint64_t (*sub_213CC75B8(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CC7630(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 416))();
}

uint64_t sub_213CC7658(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D358A8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 424))(v6);
}

uint64_t sub_213CC76E4()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__screen, (uint64_t *)&unk_253F0B9C0);
}

uint64_t sub_213CC76F8(uint64_t a1)
{
  return sub_213CBF398(a1, (uint64_t *)&unk_254D358A8, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__screen, (uint64_t *)&unk_253F0B9C0);
}

uint64_t (*sub_213CC7714(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D358A8);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__screen;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F0B9C0);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

double AuthorizationViewHostingControllerContext.animationDuration.getter()
{
  return 0.3;
}

double AuthorizationViewHostingControllerContext.springAnimationDuration.getter()
{
  return 0.55;
}

uint64_t AuthorizationViewHostingControllerContext.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isPresented;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isArmable, v2);
  v4 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__armableObserverError;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F0B9E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__physicalButtonEdge;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F0B9A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isAnimating, v2);
  v8 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__screen;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F0B9C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  return v0;
}

uint64_t AuthorizationViewHostingControllerContext.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isPresented;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isArmable, v2);
  v4 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__armableObserverError;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F0B9E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__physicalButtonEdge;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F0B9A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v3(v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__isAnimating, v2);
  v8 = v0 + OBJC_IVAR____TtC13PaymentUIBase41AuthorizationViewHostingControllerContext__screen;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F0B9C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  return swift_deallocClassInstance();
}

uint64_t sub_213CC7A04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AuthorizationViewHostingControllerContext();
  result = sub_213CE5A28();
  *a1 = result;
  return result;
}

id AuthorizationViewHostingController.__allocating_init(rootView:context:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  objc_class *v3;
  id v6;
  id v7;

  v3 = v2;
  v6 = objc_allocWithZone(v2);
  v7 = sub_213CC8C48(a1, a2);
  swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)((char *)v3
                                                          + class metadata base offset for AuthorizationViewHostingController)
                                              - 8)
                                  + 8))(a1);
  return v7;
}

id AuthorizationViewHostingController.init(rootView:context:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x24BEE4EA0] & *v2;
  v5 = sub_213CC8C48(a1, a2);
  swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v4
                                                          + class metadata base offset for AuthorizationViewHostingController)
                                              - 8)
                                  + 8))(a1);
  return v5;
}

void sub_213CC7B1C(void *a1)
{
  void *v1;

  userInterface()();
  sub_213CE63C4();
  __break(1u);
}

void sub_213CC7BA8(uint64_t a1, uint64_t a2, void *a3)
{
  sub_213CC7B1C(a3);
}

uint64_t sub_213CC7BC0(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  v2 = sub_213CC7BF0();

  return v2;
}

uint64_t sub_213CC7BF0()
{
  if (UserInterfaceType.isPad.getter())
    return 30;
  else
    return 2;
}

uint64_t sub_213CC7C54()
{
  return 1;
}

void sub_213CC7C5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v5 = (objc_class *)type metadata accessor for AuthorizationViewHostingController(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4)+ class metadata base offset for AuthorizationViewHostingController), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4)+ class metadata base offset for AuthorizationViewHostingController+ 8), a4);
  v9.receiver = v4;
  v9.super_class = v5;
  objc_msgSendSuper2(&v9, sel_viewDidLoad);
  v6 = objc_msgSend(v4, sel_view);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v7, sel_setBackgroundColor_, v8);

  }
  else
  {
    __break(1u);
  }
}

void sub_213CC7D20(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v4 = a1;
  sub_213CC7C5C((uint64_t)v4, v1, v2, v3);

}

id sub_213CC7D54(char a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  id result;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  objc_super v13;

  v2 = v1;
  v4 = *MEMORY[0x24BEE4EA0] & *v1;
  v5 = *(_QWORD *)((char *)v1 + *(_QWORD *)(class metadata base offset for AuthorizationViewHostingController + v4 + 24));
  result = objc_msgSend(v2, sel_view);
  if (result)
  {
    v7 = result;
    v8 = objc_msgSend(result, sel_window);

    if (v8)
    {
      v9 = objc_msgSend(v8, sel_screen);

    }
    else
    {
      v9 = 0;
    }
    (*(void (**)(id))(*(_QWORD *)v5 + 400))(v9);
    v10 = static PhysicalButtonView.physicalButtonEdge()();
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 304))(v10);
    v12 = (objc_class *)type metadata accessor for AuthorizationViewHostingController(0, *(_QWORD *)(v4 + class metadata base offset for AuthorizationViewHostingController), *(_QWORD *)(v4 + class metadata base offset for AuthorizationViewHostingController + 8), v11);
    v13.receiver = v2;
    v13.super_class = v12;
    return objc_msgSendSuper2(&v13, sel_viewDidAppear_, a1 & 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_213CC7E74(void *a1, uint64_t a2, char a3)
{
  id v4;

  v4 = a1;
  sub_213CC7D54(a3);

}

id sub_213CC7EB4(void *a1, double a2, double a3)
{
  _QWORD *v3;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  objc_class *v12;
  objc_super v14;
  _QWORD aBlock[6];

  v7 = *MEMORY[0x24BEE4EA0] & *v3;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v3;
  aBlock[4] = sub_213CC8D98;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213CC7FD4;
  aBlock[3] = &block_descriptor_0;
  v9 = _Block_copy(aBlock);
  v10 = v3;
  swift_release();
  objc_msgSend(a1, sel_animateAlongsideTransition_completion_, 0, v9);
  _Block_release(v9);
  v12 = (objc_class *)type metadata accessor for AuthorizationViewHostingController(0, *(_QWORD *)(v7 + class metadata base offset for AuthorizationViewHostingController), *(_QWORD *)(v7 + class metadata base offset for AuthorizationViewHostingController + 8), v11);
  v14.receiver = v10;
  v14.super_class = v12;
  return objc_msgSendSuper2(&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, a1, a2, a3);
}

uint64_t sub_213CC7FD4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_213CC801C(void *a1, double a2, double a3, uint64_t a4, void *a5)
{
  id v9;

  swift_unknownObjectRetain();
  v9 = a1;
  sub_213CC7EB4(a5, a2, a3);
  swift_unknownObjectRelease();

}

uint64_t sub_213CC8088()
{
  sub_213CC8E04(0);
  return swift_unknownObjectRetain();
}

_QWORD *sub_213CC80A0(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD *v6;

  v4 = a3;
  v5 = a1;
  v6 = sub_213CC8E04(0);
  swift_unknownObjectRetain();

  return v6;
}

uint64_t sub_213CC80F0()
{
  sub_213CC8E04(1);
  return swift_unknownObjectRetain();
}

_QWORD *sub_213CC8108(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a1;
  v12 = sub_213CC8E04(1);
  swift_unknownObjectRetain();

  return v12;
}

double sub_213CC8180()
{
  return 0.3;
}

double sub_213CC8190()
{
  return 0.3;
}

id sub_213CC81A0(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  uint64_t v22;
  id v23;
  id result;
  _QWORD *v25;
  void *v26;
  id v27;
  void *v28;
  void (*v29)(_QWORD);
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void *v33;
  char *v34;
  char *v35;
  void *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  void (*v43)(_QWORD);
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  id v47;
  uint64_t v48;
  _QWORD *v49;
  char *v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t);
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  char *v59;
  uint64_t v60;
  void (*v61)(_QWORD *, uint64_t);
  void (*v62)(_QWORD *, _QWORD, uint64_t);
  unsigned int v63;
  unint64_t v64;
  void (*v65)(char *, uint64_t);
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  _QWORD *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  id v79;
  uint64_t aBlock;
  uint64_t v81;
  uint64_t (*v82)(uint64_t);
  void *v83;
  void *v84;
  _QWORD *v85;

  v70 = *v1;
  v69 = *MEMORY[0x24BEE4EA0];
  v3 = sub_213CE5A10();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = (_QWORD *)sub_213CE6238();
  v68 = *(v73 - 1);
  MEMORY[0x24BDAC7A8](v73);
  v72 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = sub_213CE6250();
  v67 = *(_QWORD *)(v77 - 8);
  MEMORY[0x24BDAC7A8](v77);
  v71 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = sub_213CE622C();
  v9 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v11 = (char **)((char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v76 = sub_213CE6268();
  v12 = *(_QWORD *)(v76 - 8);
  v13 = MEMORY[0x24BDAC7A8](v76);
  v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v59 - v16;
  v79 = objc_msgSend(a1, sel_containerView);
  v18 = objc_msgSend(a1, sel_viewControllerForKey_, *MEMORY[0x24BEBE9B0]);
  if (v18)
  {
    v74 = v18;
    v19 = objc_msgSend(a1, sel_viewControllerForKey_, *MEMORY[0x24BEBE9A0]);
    if (v19)
    {
      v20 = v19;
      v21 = (*(uint64_t (**)(void))(**(_QWORD **)((char *)v78
                                               + *(_QWORD *)(class metadata base offset for AuthorizationViewHostingController
                                                           + (*MEMORY[0x24BEE4EA0] & *v78)
                                                           + 24))
                                 + 152))();
      v22 = MEMORY[0x24BEE4AF8];
      v66 = v20;
      if ((v21 & 1) != 0)
      {
        v23 = v74;
        result = objc_msgSend(v74, sel_view);
        v25 = v73;
        if (result)
        {
          v26 = result;
          v27 = v79;
          objc_msgSend(v79, sel_bounds);
          objc_msgSend(v26, sel_setFrame_);

          result = objc_msgSend(v23, sel_view);
          if (result)
          {
            v28 = result;
            objc_msgSend(v27, sel_addSubview_, result);

            v64 = sub_213CC8E78();
            v60 = sub_213CE6328();
            sub_213CE625C();
            *v11 = 300;
            v29 = *(void (**)(_QWORD))(v9 + 104);
            v63 = *MEMORY[0x24BEE5410];
            v30 = v75;
            v62 = (void (*)(_QWORD *, _QWORD, uint64_t))v29;
            v29(v11);
            MEMORY[0x2199C18D8](v15, v11);
            v61 = *(void (**)(_QWORD *, uint64_t))(v9 + 8);
            v61(v11, v30);
            v31 = v17;
            v65 = *(void (**)(char *, uint64_t))(v12 + 8);
            v65(v15, v76);
            v32 = swift_allocObject();
            *(_QWORD *)(v32 + 16) = a1;
            v84 = sub_213CC90E0;
            v85 = (_QWORD *)v32;
            aBlock = MEMORY[0x24BDAC760];
            v81 = 1107296256;
            v82 = sub_213CC8A70;
            v83 = &block_descriptor_43;
            v33 = _Block_copy(&aBlock);
            swift_unknownObjectRetain();
            swift_release();
            v34 = v71;
            sub_213CE6244();
            aBlock = MEMORY[0x24BEE4AF8];
            sub_213CC8F48();
            __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BAA0);
            sub_213CC8F90();
            v35 = v72;
            v36 = (void *)v60;
            sub_213CE6358();
            v37 = v31;
            v38 = v31;
LABEL_12:
            MEMORY[0x2199C1980](v38, v34, v35, v33);
            v48 = v69 & v70;
            _Block_release(v33);

            v73 = *(_QWORD **)(v68 + 8);
            ((void (*)(char *, _QWORD *))v73)(v35, v25);
            v49 = v25;
            v72 = *(char **)(v67 + 8);
            v50 = v34;
            ((void (*)(char *, uint64_t))v72)(v34, v77);
            v51 = v76;
            v52 = v65;
            v65(v37, v76);
            sub_213CC8E78();
            v71 = (char *)sub_213CE6328();
            sub_213CE625C();
            *v11 = 550;
            v53 = v75;
            v62(v11, v63, v75);
            MEMORY[0x2199C18D8](v15, v11);
            v61(v11, v53);
            v52(v15, v51);
            v54 = swift_allocObject();
            swift_unknownObjectWeakInit();
            v55 = (_QWORD *)swift_allocObject();
            v56 = v48 + class metadata base offset for AuthorizationViewHostingController;
            v55[2] = *(_QWORD *)(v48 + class metadata base offset for AuthorizationViewHostingController);
            v55[3] = *(_QWORD *)(v56 + 8);
            v55[4] = v54;
            v84 = sub_213CC9024;
            v85 = v55;
            aBlock = MEMORY[0x24BDAC760];
            v81 = 1107296256;
            v82 = sub_213CC8A70;
            v83 = &block_descriptor_37;
            v57 = _Block_copy(&aBlock);
            swift_release();
            sub_213CE6244();
            aBlock = MEMORY[0x24BEE4AF8];
            sub_213CC8F48();
            __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BAA0);
            sub_213CC8F90();
            sub_213CE6358();
            v58 = v71;
            MEMORY[0x2199C1980](v37, v50, v35, v57);

            _Block_release(v57);
            ((void (*)(char *, _QWORD *))v73)(v35, v49);
            ((void (*)(char *, uint64_t))v72)(v50, v77);
            return (id)((uint64_t (*)(char *, uint64_t))v52)(v37, v51);
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        return result;
      }
      v64 = sub_213CC8E78();
      v60 = sub_213CE6328();
      sub_213CE625C();
      *v11 = 300;
      v43 = *(void (**)(_QWORD))(v9 + 104);
      v63 = *MEMORY[0x24BEE5410];
      v44 = v75;
      v62 = (void (*)(_QWORD *, _QWORD, uint64_t))v43;
      v43(v11);
      MEMORY[0x2199C18D8](v15, v11);
      v61 = *(void (**)(_QWORD *, uint64_t))(v9 + 8);
      v61(v11, v44);
      v45 = *(void (**)(char *, uint64_t))(v12 + 8);
      v59 = v17;
      v65 = v45;
      v45(v15, v76);
      v46 = swift_allocObject();
      *(_QWORD *)(v46 + 16) = a1;
      *(_QWORD *)(v46 + 24) = v20;
      v84 = sub_213CC8EE0;
      v85 = (_QWORD *)v46;
      aBlock = MEMORY[0x24BDAC760];
      v81 = 1107296256;
      v82 = sub_213CC8A70;
      v83 = &block_descriptor_28;
      v33 = _Block_copy(&aBlock);
      swift_unknownObjectRetain();
      v47 = v20;
      swift_release();
      v34 = v71;
      sub_213CE6244();
      aBlock = v22;
      sub_213CC8F48();
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BAA0);
      sub_213CC8F90();
      v35 = v72;
      v25 = v73;
      v36 = (void *)v60;
      sub_213CE6358();
      v38 = v59;
      v37 = v59;
      goto LABEL_12;
    }

  }
  v39 = sub_213CCBB5C();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v39, v3);
  v40 = sub_213CE59F8();
  v41 = sub_213CE62F8();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v42 = 0;
    _os_log_impl(&dword_213CB9000, v40, v41, "No transitioning view controllers were found", v42, 2u);
    MEMORY[0x2199C1F38](v42, -1, -1);
  }

  return (id)(*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_213CC8A70(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_213CC8A9C(void *a1, uint64_t a2, void *a3)
{
  id v5;

  swift_unknownObjectRetain();
  v5 = a1;
  sub_213CC81A0(a3);
  swift_unknownObjectRelease();

}

void AuthorizationViewHostingController.__allocating_init(rootView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void AuthorizationViewHostingController.init(rootView:)()
{
  sub_213CC90F4();
}

void AuthorizationViewHostingController.__allocating_init(coder:rootView:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void AuthorizationViewHostingController.init(coder:rootView:)()
{
  sub_213CC9120();
}

uint64_t sub_213CC8B98()
{
  return swift_release();
}

id AuthorizationViewHostingController.__deallocating_deinit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for AuthorizationViewHostingController(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4)+ class metadata base offset for AuthorizationViewHostingController), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4)+ class metadata base offset for AuthorizationViewHostingController+ 8), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_213CC8C1C()
{
  return swift_release();
}

id sub_213CC8C48(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  id v12;
  uint64_t v14;

  v5 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v6 = (uint64_t *)((*MEMORY[0x24BEE4EA0] & *v2) + class metadata base offset for AuthorizationViewHostingController);
  v7 = *v6;
  v8 = *(_QWORD *)(*v6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v14 - v9;
  v11 = v2;
  userInterface()();
  *(_QWORD *)((char *)v11
            + *(_QWORD *)(class metadata base offset for AuthorizationViewHostingController + (*v5 & *v11) + 24)) = a2;
  swift_retain();

  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  v12 = (id)sub_213CE5D58();
  objc_msgSend(v12, sel_setTransitioningDelegate_, v12);
  objc_msgSend(v12, sel_setModalPresentationStyle_, 0);

  return v12;
}

uint64_t type metadata accessor for AuthorizationViewHostingController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AuthorizationViewHostingController);
}

uint64_t sub_213CC8D74()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_213CC8D98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16)
                 + *(_QWORD *)(class metadata base offset for AuthorizationViewHostingController
                             + (*MEMORY[0x24BEE4EA0] & **(_QWORD **)(v0 + 16))
                             + 24));
  v2 = static PhysicalButtonView.physicalButtonEdge()();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 304))(v2);
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

_QWORD *sub_213CC8E04(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = v1;
  v4 = *(_QWORD *)((char *)v1
                 + *(_QWORD *)(class metadata base offset for AuthorizationViewHostingController
                             + (*MEMORY[0x24BEE4EA0] & *v1)
                             + 24));
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 352))(1);
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 160))(a1);
  return v3;
}

unint64_t sub_213CC8E78()
{
  unint64_t result;

  result = qword_253F0BAC0;
  if (!qword_253F0BAC0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253F0BAC0);
  }
  return result;
}

uint64_t sub_213CC8EB4()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

void sub_213CC8EE0()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(v0 + 24);
  objc_msgSend(*(id *)(v0 + 16), sel_completeTransition_, 1);
  v2 = objc_msgSend(v1, sel_view);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, sel_removeFromSuperview);

  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_213CC8F48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F0BA88;
  if (!qword_253F0BA88)
  {
    v1 = sub_213CE6238();
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_253F0BA88);
  }
  return result;
}

unint64_t sub_213CC8F90()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F0BAA8;
  if (!qword_253F0BAA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0BAA0);
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_253F0BAA8);
  }
  return result;
}

uint64_t sub_213CC8FDC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_213CC9000()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_213CC9024()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *result;
  void *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 32) + 16;
  swift_beginAccess();
  result = (_QWORD *)MEMORY[0x2199C1F8C](v1);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)((char *)result
                   + *(_QWORD *)(class metadata base offset for AuthorizationViewHostingController
                               + (*MEMORY[0x24BEE4EA0] & *result)
                               + 24));
    swift_retain();

    (*(void (**)(_QWORD))(*(_QWORD *)v4 + 352))(0);
    return (_QWORD *)swift_release();
  }
  return result;
}

uint64_t sub_213CC90BC()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

id sub_213CC90E0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_completeTransition_, 1);
}

void sub_213CC90F4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_213CC9120()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_213CC914C()
{
  return type metadata accessor for AuthorizationViewHostingControllerContext();
}

uint64_t type metadata accessor for AuthorizationViewHostingControllerContext()
{
  uint64_t result;

  result = qword_253F0BAE0;
  if (!qword_253F0BAE0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_213CC9190()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_213CC0AE8(319, (unint64_t *)&qword_253F0B338, MEMORY[0x24BEE1328], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDB9EF0]);
  if (v0 <= 0x3F)
  {
    sub_213CC0A80(319, &qword_253F0B9F0, (uint64_t *)&unk_253F0BAD0);
    if (v1 <= 0x3F)
    {
      sub_213CC9458();
      if (v2 <= 0x3F)
      {
        sub_213CC0A80(319, (unint64_t *)&unk_253F0B9D0, &qword_253F0BAC8);
        if (v3 <= 0x3F)
          swift_updateClassMetadata2();
      }
    }
  }
}

uint64_t method lookup function for AuthorizationViewHostingControllerContext()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isPresented.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isPresented.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isPresented.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isPresented.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isPresented.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isPresented.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isArmable.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isArmable.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isArmable.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isArmable.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isArmable.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isArmable.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.armableObserverError.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.armableObserverError.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.armableObserverError.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$armableObserverError.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$armableObserverError.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$armableObserverError.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.physicalButtonEdge.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.physicalButtonEdge.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.physicalButtonEdge.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$physicalButtonEdge.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$physicalButtonEdge.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$physicalButtonEdge.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isAnimating.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isAnimating.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.isAnimating.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isAnimating.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isAnimating.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$isAnimating.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.screen.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.screen.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.screen.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$screen.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$screen.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of AuthorizationViewHostingControllerContext.$screen.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

void sub_213CC9458()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253F0B9B8)
  {
    type metadata accessor for CGRectEdge(255);
    v0 = sub_213CE5A7C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253F0B9B8);
  }
}

uint64_t sub_213CC94B0()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for AuthorizationViewHostingController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AuthorizationViewHostingController.__allocating_init(rootView:context:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(class metadata base offset for AuthorizationViewHostingController + v0 + 32))();
}

uint64_t dispatch thunk of AuthorizationViewHostingController.animationController(forDismissed:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for AuthorizationViewHostingController
                              + (*MEMORY[0x24BEE4EA0] & *v0)
                              + 40))();
}

uint64_t dispatch thunk of AuthorizationViewHostingController.animationController(forPresented:presenting:source:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for AuthorizationViewHostingController
                              + (*MEMORY[0x24BEE4EA0] & *v0)
                              + 48))();
}

uint64_t dispatch thunk of AuthorizationViewHostingController.transitionDuration(using:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for AuthorizationViewHostingController
                              + (*MEMORY[0x24BEE4EA0] & *v0)
                              + 56))();
}

uint64_t dispatch thunk of AuthorizationViewHostingController.animateTransition(using:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))(class metadata base offset for AuthorizationViewHostingController
                              + (*MEMORY[0x24BEE4EA0] & *v0)
                              + 64))();
}

void sub_213CC95E0()
{
  uint64_t v0;

  sub_213CC95FC();
  qword_253F0CA98 = v0;
}

void sub_213CC95FC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v0 = sub_213CE5998();
  v27 = *(_QWORD *)(v0 - 8);
  v28 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_213CE59D4();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v27 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v27 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v27 - v14;
  v16 = (void *)objc_opt_self();
  v17 = (void *)sub_213CE628C();
  v18 = (void *)sub_213CE628C();
  v19 = objc_msgSend(v16, sel__bundleWithIdentifier_andLibraryName_, v17, v18);

  if (v19)
  {
    v20 = objc_msgSend(v19, sel_bundleURL);

    sub_213CE59BC();
    sub_213CE59B0();
    v21 = *(void (**)(char *, uint64_t))(v4 + 8);
    v21(v10, v3);
    sub_213CE59B0();
    v21(v13, v3);
    v29 = 0xD000000000000025;
    v30 = 0x8000000213CEDC80;
    v23 = v27;
    v22 = v28;
    (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v2, *MEMORY[0x24BDCD7A0], v28);
    sub_213CC1814();
    sub_213CE59C8();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v2, v22);
    swift_bridgeObjectRelease();
    v24 = objc_allocWithZone(MEMORY[0x24BDD1488]);
    v25 = (void *)sub_213CE59A4();
    v26 = objc_msgSend(v24, sel_initWithURL_, v25);

    if (v26)
    {
      v21(v7, v3);
      v21(v15, v3);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t *sub_213CC98BC()
{
  if (qword_253F0CA60 != -1)
    swift_once();
  return &qword_253F0CA98;
}

uint64_t *ItemImageView.init(symbol:foregroundColor:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t *result;

  result = sub_213CBBD54();
  *a4 = a1;
  a4[1] = a2;
  a4[2] = a3;
  a4[3] = 0x4042000000000000;
  return result;
}

uint64_t ItemImageView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t KeyPath;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned __int8 v41;
  uint64_t v42;
  unsigned __int8 v43;
  uint64_t v44;
  uint64_t v45;

  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35A40);
  MEMORY[0x24BDAC7A8](v39);
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_213CE5BB4();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (_OWORD *)((char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35A48);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  v38 = sub_213CE610C();
  v12 = sub_213CE5F44();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  v37 = sub_213CE5F68();
  sub_213CC3848((uint64_t)v10, &qword_254D35A48);
  KeyPath = swift_getKeyPath();
  v14 = swift_getKeyPath();
  swift_retain();
  sub_213CE61FC();
  sub_213CE5AF4();
  v36 = v40;
  v35 = v41;
  v34 = v42;
  v33 = v43;
  v31 = v45;
  v32 = v44;
  v15 = *sub_213CBBC9C();
  swift_retain();
  v16 = sub_213CE5EF0();
  v17 = (char *)v7 + *(int *)(v5 + 20);
  v18 = *MEMORY[0x24BDEEB68];
  v19 = sub_213CE5D10();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v17, v18, v19);
  __asm { FMOV            V0.2D, #6.0 }
  *v7 = _Q0;
  sub_213CC9EB8((uint64_t)v7, (uint64_t)v4);
  *(_WORD *)&v4[*(int *)(v39 + 36)] = 256;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35A50);
  sub_213CC9EFC((uint64_t)v4, a1 + *(int *)(v25 + 36));
  v26 = v37;
  *(_QWORD *)a1 = v38;
  *(_QWORD *)(a1 + 8) = KeyPath;
  *(_QWORD *)(a1 + 16) = v26;
  *(_QWORD *)(a1 + 24) = v14;
  v27 = v36;
  *(_QWORD *)(a1 + 32) = v11;
  *(_QWORD *)(a1 + 40) = v27;
  *(_BYTE *)(a1 + 48) = v35;
  *(_QWORD *)(a1 + 56) = v34;
  *(_BYTE *)(a1 + 64) = v33;
  v28 = v31;
  *(_QWORD *)(a1 + 72) = v32;
  *(_QWORD *)(a1 + 80) = v28;
  *(_QWORD *)(a1 + 88) = v15;
  *(_BYTE *)(a1 + 96) = v16;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_213CC3848((uint64_t)v4, &qword_254D35A40);
  sub_213CC9F44((uint64_t)v7);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_213CC9C5C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = static Color.itemIconForeground.getter();
  sub_213CBBD54();
  v3 = static Color.itemIconForeground.getter();
  v4 = static Color.itemIconForeground.getter();
  v5 = static Color.itemIconForeground.getter();
  *a1 = 0x662E6E6F73726570;
  a1[1] = 0xEB000000006C6C69;
  a1[2] = v2;
  a1[3] = 0x4042000000000000;
  a1[4] = 0xD000000000000010;
  a1[5] = 0x8000000213CEDCB0;
  a1[6] = v3;
  a1[7] = 0x4042000000000000;
  a1[8] = 0x69662E6573756F68;
  a1[9] = 0xEA00000000006C6CLL;
  a1[10] = v4;
  a1[11] = 0x4042000000000000;
  a1[12] = 0xD000000000000012;
  a1[13] = 0x8000000213CEDCD0;
  a1[14] = v5;
  a1[15] = 0x4042000000000000;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

double sub_213CC9D90@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  double result;
  __int128 v7;
  _OWORD v8[8];
  _BYTE v9[135];

  v2 = sub_213CE5D40();
  sub_213CC9C5C(v8);
  *(_OWORD *)&v9[71] = v8[4];
  *(_OWORD *)&v9[87] = v8[5];
  *(_OWORD *)&v9[103] = v8[6];
  *(_OWORD *)&v9[119] = v8[7];
  *(_OWORD *)&v9[7] = v8[0];
  *(_OWORD *)&v9[23] = v8[1];
  *(_OWORD *)&v9[39] = v8[2];
  *(_OWORD *)&v9[55] = v8[3];
  v3 = *(_OWORD *)&v9[64];
  *(_OWORD *)(a1 + 97) = *(_OWORD *)&v9[80];
  v4 = *(_OWORD *)&v9[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v9[96];
  *(_OWORD *)(a1 + 129) = v4;
  v5 = *(_OWORD *)v9;
  *(_OWORD *)(a1 + 33) = *(_OWORD *)&v9[16];
  result = *(double *)&v9[32];
  v7 = *(_OWORD *)&v9[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v9[32];
  *(_OWORD *)(a1 + 65) = v7;
  *(_OWORD *)(a1 + 81) = v3;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 144) = *(_QWORD *)&v9[127];
  *(_OWORD *)(a1 + 17) = v5;
  return result;
}

uint64_t sub_213CC9E48()
{
  sub_213CCA458();
  return sub_213CE5B84();
}

uint64_t sub_213CC9E80()
{
  sub_213CCA458();
  return sub_213CE5B78();
}

uint64_t sub_213CC9EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_213CE5BB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_213CC9EFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35A40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_213CC9F44(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_213CE5BB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_213CC9F80()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_213CC9F94()
{
  unint64_t result;

  result = qword_254D35A58;
  if (!qword_254D35A58)
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE79A8, &type metadata for ItemImageView_Previews);
    atomic_store(result, (unint64_t *)&qword_254D35A58);
  }
  return result;
}

uint64_t sub_213CC9FD8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for ItemImageView()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

_QWORD *initializeWithCopy for ItemImageView(_QWORD *a1, _QWORD *a2)
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
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for ItemImageView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for ItemImageView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for ItemImageView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ItemImageView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ItemImageView()
{
  return &type metadata for ItemImageView;
}

ValueMetadata *type metadata accessor for ItemImageView_Previews()
{
  return &type metadata for ItemImageView_Previews;
}

unint64_t sub_213CCA1B0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35A60;
  if (!qword_254D35A60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35A50);
    v2[0] = sub_213CCA234();
    v2[1] = sub_213CC0B2C(&qword_254D35AA8, &qword_254D35A40, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35A60);
  }
  return result;
}

unint64_t sub_213CCA234()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35A68;
  if (!qword_254D35A68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35A70);
    v2[0] = sub_213CCA2B8();
    v2[1] = sub_213CC0B2C(&qword_253F0BA28, &qword_253F0BA30, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35A68);
  }
  return result;
}

unint64_t sub_213CCA2B8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35A78;
  if (!qword_254D35A78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35A80);
    v2[0] = sub_213CCA324();
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35A78);
  }
  return result;
}

unint64_t sub_213CCA324()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35A88;
  if (!qword_254D35A88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35A90);
    v2[0] = sub_213CCA3A8();
    v2[1] = sub_213CC0B2C(&qword_254D35870, &qword_254D35878, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35A88);
  }
  return result;
}

unint64_t sub_213CCA3A8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_254D35A98;
  if (!qword_254D35A98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35AA0);
    v2 = sub_213CC0B2C(&qword_254D35860, &qword_254D35868, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254D35A98);
  }
  return result;
}

uint64_t sub_213CCA42C()
{
  return sub_213CC0B2C(&qword_254D35AB0, &qword_254D35AB8, MEMORY[0x24BDF4700]);
}

unint64_t sub_213CCA458()
{
  unint64_t result;

  result = qword_254D35AC0;
  if (!qword_254D35AC0)
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE7960, &type metadata for ItemImageView_Previews);
    atomic_store(result, (unint64_t *)&qword_254D35AC0);
  }
  return result;
}

uint64_t PaymentSheetItemsContainer.init(items:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t KeyPath;
  uint64_t result;

  KeyPath = swift_getKeyPath();
  result = swift_getKeyPath();
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  *(_QWORD *)(a3 + 16) = KeyPath;
  *(_BYTE *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 32) = result;
  *(_BYTE *)(a3 + 40) = 0;
  *(_QWORD *)(a3 + 48) = 0x4020000000000000;
  return result;
}

uint64_t sub_213CCA500()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_BYTE *)(v0 + 24);
  sub_213CC5008(v1, v2);
  v3 = sub_213CCA554(v1, v2);
  sub_213CC5044(v1, v2);
  return v3 & 1;
}

uint64_t sub_213CCA554(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unsigned __int8 v14;

  v4 = sub_213CE5CC8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  swift_retain();
  v8 = sub_213CE6304();
  v9 = sub_213CE5ECC();
  if (os_log_type_enabled(v9, v8))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v13 = v11;
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = sub_213CC4974(1819242306, 0xE400000000000000, &v13);
    _os_log_impl(&dword_213CB9000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C1F38](v11, -1, -1);
    MEMORY[0x2199C1F38](v10, -1, -1);
  }

  sub_213CE5CBC();
  swift_getAtKeyPath();
  sub_213CC5044(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_213CCA6E0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.isCompactLayout.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_213CCA70C(unsigned __int8 *a1)
{
  return EnvironmentValues.isCompactLayout.setter(*a1);
}

uint64_t sub_213CCA730()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_BYTE *)(v0 + 40);
  sub_213CC5008(v1, v2);
  v3 = sub_213CCA554(v1, v2);
  sub_213CC5044(v1, v2);
  return v3 & 1;
}

uint64_t sub_213CCA784@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.shouldUseAccessibleLayout.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_213CCA7B0()
{
  return EnvironmentValues.shouldUseAccessibleLayout.setter();
}

uint64_t PaymentSheetItemsContainer.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  __int128 *v2;
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
  char *v19;
  __int128 v20;
  void (*v21)(char *, char *, uint64_t);
  void (*v22)(char *, uint64_t);
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 *v28;
  _QWORD v29[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v25 = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0BA60);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  sub_213CE6190();
  swift_getTupleTypeMetadata2();
  v6 = sub_213CE6214();
  v7 = MEMORY[0x24BDF5428];
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v6);
  v8 = sub_213CE6190();
  v9 = sub_213CE5B60();
  v10 = MEMORY[0x24BDF4700];
  v29[0] = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4700], v8);
  v29[1] = MEMORY[0x24BDECC60];
  v11 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v9, v29);
  *(_QWORD *)&v30 = v9;
  *((_QWORD *)&v30 + 1) = MEMORY[0x24BDF3E48];
  *(_QWORD *)&v31 = v11;
  *((_QWORD *)&v31 + 1) = MEMORY[0x24BDF3E20];
  MEMORY[0x2199C1E48](255, &v30, &opaque type descriptor for <<opaque return type of View.paymentItemBackground<A>(_:)>>, 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0BA40);
  sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0BA00);
  swift_getTupleTypeMetadata2();
  v12 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v7, v12);
  v13 = sub_213CE6190();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v24 - v18;
  v20 = v2[1];
  v30 = *v2;
  v31 = v20;
  v32 = v2[2];
  v33 = *((_QWORD *)v2 + 6);
  v26 = v4;
  v27 = v5;
  v28 = &v30;
  sub_213CE5D40();
  sub_213CE6184();
  MEMORY[0x2199C1EA8](v10, v13);
  v21 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v21(v19, v17, v13);
  v22 = *(void (**)(char *, uint64_t))(v14 + 8);
  v22(v17, v13);
  v21(v25, v19, v13);
  return ((uint64_t (*)(char *, uint64_t))v22)(v19, v13);
}

uint64_t sub_213CCAA68@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  __int128 v27;
  uint64_t v28;
  char v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t OpaqueTypeConformance2;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  _QWORD v54[3];
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  _QWORD v70[2];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76[2];
  _QWORD v77[2];
  _QWORD v78[3];
  char v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t v83;

  v67 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BA70);
  MEMORY[0x24BDAC7A8](v7);
  v66 = (char *)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0BA60);
  v56 = a2;
  v57 = a3;
  sub_213CE6190();
  swift_getTupleTypeMetadata2();
  v9 = sub_213CE6214();
  v10 = MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v9);
  v54[2] = v9;
  v54[1] = v10;
  v11 = sub_213CE6190();
  v55 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v54 - v12;
  v14 = sub_213CE5B60();
  v58 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v54 - v15;
  v54[0] = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4700], v11);
  v78[0] = v54[0];
  v78[1] = MEMORY[0x24BDECC60];
  v17 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v14, v78);
  *(_QWORD *)&v71 = v14;
  *((_QWORD *)&v71 + 1) = MEMORY[0x24BDF3E48];
  v59 = v17;
  *(_QWORD *)&v72 = v17;
  *((_QWORD *)&v72 + 1) = MEMORY[0x24BDF3E20];
  v18 = MEMORY[0x2199C1E48](0, &v71, &opaque type descriptor for <<opaque return type of View.paymentItemBackground<A>(_:)>>, 0);
  v61 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v54 - v19;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0BA40);
  v60 = v18;
  v64 = sub_213CE5B60();
  v62 = *(_QWORD *)(v64 - 8);
  v21 = MEMORY[0x24BDAC7A8](v64);
  v65 = (char *)v54 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)v54 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v63 = (char *)v54 - v26;
  v27 = a1[1];
  v71 = *a1;
  v72 = v27;
  v73 = a1[2];
  v74 = *((_QWORD *)a1 + 6);
  v28 = sub_213CCA500();
  if ((v28 & 1) != 0)
  {
    v29 = 1;
  }
  else
  {
    v30 = a1[1];
    v71 = *a1;
    v72 = v30;
    v73 = a1[2];
    v74 = *((_QWORD *)a1 + 6);
    v28 = sub_213CCA730();
    v29 = v28;
  }
  MEMORY[0x24BDAC7A8](v28);
  v31 = v57;
  v54[-4] = v56;
  v54[-3] = v31;
  LOBYTE(v54[-2]) = v29 & 1;
  v54[-1] = a1;
  sub_213CE5D40();
  sub_213CE6184();
  sub_213CE5EE4();
  if ((v29 & 1) != 0)
  {
    sub_213CE607C();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v13, v11);
    v32 = 0;
  }
  else
  {
    sub_213CBB950();
    sub_213CE607C();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v13, v11);
    v32 = sub_213CE60D0();
  }
  *(_QWORD *)&v71 = v32;
  v33 = v20;
  v34 = MEMORY[0x24BDF3E48];
  v35 = v59;
  v36 = MEMORY[0x24BDF3E20];
  View.paymentItemBackground<A>(_:)((uint64_t)&v71, v14, MEMORY[0x24BDF3E48], v59, MEMORY[0x24BDF3E20]);
  swift_release();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v16, v14);
  swift_getKeyPath();
  v37 = sub_213CE61F0();
  v38 = (uint64_t)v66;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v66, 1, 1, v37);
  *(_QWORD *)&v71 = v14;
  *((_QWORD *)&v71 + 1) = v34;
  *(_QWORD *)&v72 = v35;
  *((_QWORD *)&v72 + 1) = v36;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v40 = v60;
  sub_213CE6004();
  swift_release();
  sub_213CC3848(v38, &qword_253F0BA70);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v33, v40);
  v41 = sub_213CCB974();
  v77[0] = OpaqueTypeConformance2;
  v77[1] = v41;
  v42 = v64;
  v61 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v64, v77);
  v43 = v62;
  v44 = *(void (**)(char *, char *, uint64_t))(v62 + 16);
  v45 = v63;
  v44(v63, v25, v42);
  v66 = *(char **)(v43 + 8);
  ((void (*)(char *, uint64_t))v66)(v25, v42);
  sub_213CE61FC();
  sub_213CE5AF4();
  v46 = v78[2];
  LOBYTE(v33) = v79;
  v47 = v80;
  v48 = v81;
  v49 = v82;
  v50 = v83;
  v51 = (uint64_t)v65;
  v44(v65, v45, v42);
  *(_QWORD *)&v71 = 0;
  BYTE8(v71) = 1;
  *(_QWORD *)&v72 = v46;
  BYTE8(v72) = (_BYTE)v33;
  *(_QWORD *)&v73 = v47;
  BYTE8(v73) = v48;
  v74 = v49;
  v75 = v50;
  v76[0] = v51;
  v76[1] = (uint64_t)&v71;
  v70[0] = v42;
  v70[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BA00);
  v68 = v61;
  v69 = sub_213CCB9C0();
  sub_213CC121C(v76, 2uLL, (uint64_t)v70);
  v52 = v66;
  ((void (*)(char *, uint64_t))v66)(v45, v42);
  return ((uint64_t (*)(uint64_t, uint64_t))v52)(v51, v42);
}

uint64_t sub_213CCB10C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_213CCAA68(*(__int128 **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_213CCB118@<X0>(char a1@<W0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  _QWORD v36[2];
  uint64_t v37[2];

  v33 = a4;
  v7 = sub_213CE6190();
  v31 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v32 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v30 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v30 - v13;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BA60);
  v15 = MEMORY[0x24BDAC7A8](v30);
  v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v30 - v18;
  if ((a1 & 1) != 0)
  {
    sub_213CE61CC();
    v20 = sub_213CE61D8();
    v21 = (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 0, 1, v20);
  }
  else
  {
    v22 = sub_213CE61D8();
    v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v19, 1, 1, v22);
  }
  MEMORY[0x24BDAC7A8](v21);
  *(&v30 - 4) = a2;
  *(&v30 - 3) = a3;
  *(&v30 - 2) = v23;
  sub_213CE5D40();
  sub_213CE6184();
  v24 = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4700], v7);
  v25 = v31;
  v26 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  v26(v14, v12, v7);
  v27 = *(void (**)(char *, uint64_t))(v25 + 8);
  v27(v12, v7);
  sub_213CC3694((uint64_t)v19, (uint64_t)v17, &qword_253F0BA60);
  v37[0] = (uint64_t)v17;
  v28 = (uint64_t)v32;
  v26(v32, v14, v7);
  v37[1] = v28;
  v36[0] = v30;
  v36[1] = v7;
  v34 = sub_213CCBA30();
  v35 = v24;
  sub_213CC121C(v37, 2uLL, (uint64_t)v36);
  v27(v14, v7);
  sub_213CC3848((uint64_t)v19, &qword_253F0BA60);
  v27((char *)v28, v7);
  return sub_213CC3848((uint64_t)v17, &qword_253F0BA60);
}

uint64_t sub_213CCB3C4@<X0>(uint64_t a1@<X1>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (**v8)(void);
  uint64_t v9;
  char *v10;
  void (*v11)(char *, char *, uint64_t);
  void (*v12)(char *, uint64_t);
  uint64_t v14;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (void (**)(void))MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v14 - v9;
  (*v8)();
  v11 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v11(v10, v7, a1);
  v12 = *(void (**)(char *, uint64_t))(v4 + 8);
  v12(v7, a1);
  v11(a2, v10, a1);
  return ((uint64_t (*)(char *, uint64_t))v12)(v10, a1);
}

uint64_t sub_213CCB48C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213CCB4C0()
{
  return sub_213CE5C50();
}

uint64_t sub_213CCB4E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BA70);
  MEMORY[0x24BDAC7A8](v2);
  sub_213CC3694(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_253F0BA70);
  return sub_213CE5C5C();
}

uint64_t sub_213CCB564()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_213CCB56C(uint64_t a1)
{
  swift_release();
  sub_213CC5044(*(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
  return sub_213CC5044(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
}

uint64_t sub_213CCB5A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  swift_retain();
  sub_213CC5008(v5, v6);
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_213CC5008(v7, v8);
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t sub_213CCB61C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_213CC5008(v5, v6);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = *(_BYTE *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  sub_213CC5044(v7, v8);
  v9 = *(_QWORD *)(a2 + 32);
  v10 = *(_BYTE *)(a2 + 40);
  sub_213CC5008(v9, v10);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_BYTE *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = v9;
  *(_BYTE *)(a1 + 40) = v10;
  sub_213CC5044(v11, v12);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t sub_213CCB6B8(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  char v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_BYTE *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = v4;
  sub_213CC5044(v5, v6);
  v7 = *(_BYTE *)(a2 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_BYTE *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = v7;
  sub_213CC5044(v8, v9);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t sub_213CCB72C(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_213CCB774(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for PaymentSheetItemsContainer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PaymentSheetItemsContainer);
}

uint64_t sub_213CCB7CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[4];
  _QWORD v10[2];

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0BA60);
  sub_213CE6190();
  swift_getTupleTypeMetadata2();
  v0 = sub_213CE6214();
  v1 = MEMORY[0x24BDF5428];
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v0);
  v2 = sub_213CE6190();
  v3 = sub_213CE5B60();
  v4 = MEMORY[0x24BDF4700];
  v10[0] = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4700], v2);
  v10[1] = MEMORY[0x24BDECC60];
  v5 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v3, v10);
  v9[0] = v3;
  v9[1] = MEMORY[0x24BDF3E48];
  v9[2] = v5;
  v9[3] = MEMORY[0x24BDF3E20];
  MEMORY[0x2199C1E48](255, v9, &opaque type descriptor for <<opaque return type of View.paymentItemBackground<A>(_:)>>, 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0BA40);
  sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0BA00);
  swift_getTupleTypeMetadata2();
  v6 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v1, v6);
  v7 = sub_213CE6190();
  return MEMORY[0x2199C1EA8](v4, v7);
}

uint64_t sub_213CCB964@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_213CCB118(*(_BYTE *)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_213CCB974()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F0BA38;
  if (!qword_253F0BA38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0BA40);
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_253F0BA38);
  }
  return result;
}

unint64_t sub_213CCB9C0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_253F0B9F8;
  if (!qword_253F0B9F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0BA00);
    v2[0] = MEMORY[0x24BDF4610];
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_253F0B9F8);
  }
  return result;
}

uint64_t sub_213CCBA24@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_213CCB3C4(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_213CCBA30()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_253F0BA68;
  if (!qword_253F0BA68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0BA60);
    v2 = sub_213CCBA94();
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_253F0BA68);
  }
  return result;
}

unint64_t sub_213CCBA94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D35AC8;
  if (!qword_254D35AC8)
  {
    v1 = sub_213CE61D8();
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4900], v1);
    atomic_store(result, (unint64_t *)&qword_254D35AC8);
  }
  return result;
}

uint64_t sub_213CCBADC()
{
  uint64_t v0;

  v0 = sub_213CE5A10();
  __swift_allocate_value_buffer(v0, qword_254D36B40);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D36B40);
  return sub_213CE5A04();
}

uint64_t sub_213CCBB5C()
{
  uint64_t v0;

  if (qword_254D36B38 != -1)
    swift_once();
  v0 = sub_213CE5A10();
  return __swift_project_value_buffer(v0, (uint64_t)qword_254D36B40);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static Logger.paymentUIBase.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_254D36B38 != -1)
    swift_once();
  v2 = sub_213CE5A10();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_254D36B40);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
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

uint64_t View.errorAlert(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _BYTE v9[56];

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16))(&v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8], v2, a2);
  sub_213CC3694(a1, (uint64_t)v9, &qword_253F0BA58);
  return sub_213CE5B54();
}

uint64_t sub_213CCBD18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v3 = v2;
  v35 = a2;
  v36 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BA58);
  MEMORY[0x2199C180C](&v37);
  v5 = *((_QWORD *)&v38 + 1);
  if (*((_QWORD *)&v38 + 1))
  {
    v6 = v39;
    v7 = __swift_project_boxed_opaque_existential_1(&v37, *((uint64_t *)&v38 + 1));
    v8 = *(_QWORD *)(v5 - 8);
    MEMORY[0x24BDAC7A8](v7);
    v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    sub_213CC3848((uint64_t)&v37, &qword_253F0B8C0);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24))(v5, v6);
    v13 = v12;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v5);
  }
  else
  {
    sub_213CC3848((uint64_t)&v37, &qword_253F0B8C0);
    v11 = 0;
    v13 = 0xE000000000000000;
  }
  *(_QWORD *)&v37 = v11;
  *((_QWORD *)&v37 + 1) = v13;
  sub_213CC1814();
  v14 = sub_213CE5FD4();
  v33 = v15;
  v34 = v14;
  v32 = v16;
  v31 = v17 & 1;
  sub_213CCC08C(v3, (uint64_t)&v37);
  sub_213CE62EC();
  v18 = sub_213CE62E0();
  v19 = swift_allocObject();
  v20 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v19 + 16) = v18;
  *(_QWORD *)(v19 + 24) = v20;
  v21 = v38;
  *(_OWORD *)(v19 + 32) = v37;
  *(_OWORD *)(v19 + 48) = v21;
  *(_OWORD *)(v19 + 64) = v39;
  *(_QWORD *)(v19 + 80) = v40;
  sub_213CCC08C(v3, (uint64_t)&v37);
  v22 = sub_213CE62E0();
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v22;
  *(_QWORD *)(v23 + 24) = v20;
  v24 = v38;
  *(_OWORD *)(v23 + 32) = v37;
  *(_OWORD *)(v23 + 48) = v24;
  *(_OWORD *)(v23 + 64) = v39;
  *(_QWORD *)(v23 + 80) = v40;
  sub_213CE61C0();
  v30 = v38;
  v25 = MEMORY[0x2199C180C](&v37, v4);
  MEMORY[0x24BDAC7A8](v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BA10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BA80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BA48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B8B8);
  sub_213CC0B2C(&qword_253F0BA08, &qword_253F0BA10, MEMORY[0x24BDEFB78]);
  sub_213CC0B2C(&qword_253F0BA78, &qword_253F0BA80, MEMORY[0x24BDF5428]);
  sub_213CCC930();
  v26 = v34;
  v27 = v33;
  v28 = v31;
  sub_213CE604C();
  swift_release();
  swift_release();
  sub_213CC1858(v26, v27, v28);
  swift_bridgeObjectRelease();
  return sub_213CC3848((uint64_t)&v37, &qword_253F0B8C0);
}

uint64_t sub_213CCC08C(_QWORD *a1, uint64_t a2)
{
  return initializeWithCopy for ErrorAlertModifier(a2, a1);
}

uint64_t sub_213CCC0A0@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  BOOL v3;
  uint64_t result;
  _QWORD v5[5];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BA58);
  MEMORY[0x2199C180C](v5, v2);
  v3 = v5[3] != 0;
  result = sub_213CC3848((uint64_t)v5, &qword_253F0B8C0);
  *a1 = v3;
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  if (*(_QWORD *)(v0 + 72))
    __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  return swift_deallocObject();
}

_BYTE *sub_213CCC144(_BYTE *result)
{
  _BYTE v1[40];
  _OWORD v2[2];
  uint64_t v3;

  if ((*result & 1) == 0)
  {
    v3 = 0;
    memset(v2, 0, sizeof(v2));
    sub_213CC3694((uint64_t)v2, (uint64_t)v1, &qword_253F0B8C0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BA58);
    sub_213CE61B4();
    return (_BYTE *)sub_213CC3848((uint64_t)v2, &qword_253F0B8C0);
  }
  return result;
}

uint64_t sub_213CCC1B8@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  unint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  void (*v45)(uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t);
  char *v62;
  char *v63;
  char *v64;
  unint64_t v65;
  uint64_t v66;
  __int128 v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  char *v75;
  void (*v76)(char *, char *, uint64_t);
  uint64_t v77;
  void (*v78)(char *, uint64_t);
  _QWORD v80[3];
  char *v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  char *v86;
  char *v87;
  char *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  _QWORD *v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;

  v94 = a1;
  v88 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35AD8);
  MEMORY[0x24BDAC7A8](v2);
  v90 = (char *)v80 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = sub_213CE59D4();
  v95 = *(_QWORD *)(v89 - 8);
  v4 = MEMORY[0x24BDAC7A8](v89);
  v83 = (char *)v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = v5;
  MEMORY[0x24BDAC7A8](v4);
  v84 = (char *)v80 - v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35AE0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v87 = (char *)v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v86 = (char *)v80 - v10;
  v11 = sub_213CE5BA8();
  v92 = *(_QWORD *)(v11 - 8);
  v93 = (char *)v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35AE8);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v80 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35AF0);
  v18 = *(char **)(v91 - 8);
  v19 = MEMORY[0x24BDAC7A8](v91);
  v21 = (char *)v80 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)v80 - v23;
  v25 = nullsub_1(v22);
  v26 = (void *)sub_213CD7954(v25);
  v28 = PaymentUIBaseLocalizedString(for:table:bundle:)(0x5F544E454D594150, 0xEA00000000004B4FLL, v27, v26);
  v30 = v29;

  *(_QWORD *)&v96 = v28;
  *((_QWORD *)&v96 + 1) = v30;
  v31 = v18;
  v32 = sub_213CC1814();
  sub_213CE6154();
  sub_213CE5B9C();
  sub_213CC0B2C(&qword_254D35AF8, &qword_254D35AE8, MEMORY[0x24BDF43B0]);
  sub_213CE601C();
  (*(void (**)(char *, char *))(v92 + 8))(v13, v93);
  v85 = v15;
  v33 = *(void (**)(char *, uint64_t))(v15 + 8);
  v81 = v17;
  v92 = v14;
  v34 = v14;
  v35 = v91;
  v33(v17, v34);
  v36 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v18 + 4);
  v93 = v24;
  v36(v24, v21, v35);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BA58);
  v38 = v94;
  MEMORY[0x2199C180C](&v96);
  v39 = *((_QWORD *)&v97 + 1);
  if (!*((_QWORD *)&v97 + 1))
  {
    sub_213CC3848((uint64_t)&v96, &qword_253F0B8C0);
    v47 = (uint64_t)v90;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v95 + 56))(v90, 1, 1, v89);
    goto LABEL_7;
  }
  v80[2] = v32;
  v40 = v98;
  v41 = __swift_project_boxed_opaque_existential_1(&v96, *((uint64_t *)&v97 + 1));
  v42 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v44 = (char *)v80 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v42 + 16))(v44);
  sub_213CC3848((uint64_t)&v96, &qword_253F0B8C0);
  v45 = *(void (**)(uint64_t, uint64_t))(v40 + 88);
  v46 = v40;
  v47 = (uint64_t)v90;
  v45(v39, v46);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v39);
  v48 = v95;
  v49 = v89;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v95 + 48))(v47, 1, v89) == 1)
  {
LABEL_7:
    sub_213CC3848(v47, &qword_254D35AD8);
LABEL_10:
    v72 = 1;
    v74 = (uint64_t)v87;
    v73 = v88;
    v69 = v85;
    v70 = (uint64_t)v86;
    v71 = v92;
    v75 = v93;
    goto LABEL_11;
  }
  v50 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 32);
  v50(v84, v47, v49);
  MEMORY[0x2199C180C](&v96, v37);
  v51 = *((_QWORD *)&v97 + 1);
  if (!*((_QWORD *)&v97 + 1))
  {
    sub_213CC3848((uint64_t)&v96, &qword_253F0B8C0);
    goto LABEL_9;
  }
  v80[0] = v50;
  v52 = v98;
  v53 = __swift_project_boxed_opaque_existential_1(&v96, *((uint64_t *)&v97 + 1));
  v80[1] = v80;
  v54 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v90 = v31;
  v56 = v49;
  v57 = (char *)v80 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v54 + 16))(v57);
  sub_213CC3848((uint64_t)&v96, &qword_253F0B8C0);
  v58 = (*(uint64_t (**)(uint64_t, uint64_t))(v52 + 80))(v51, v52);
  v60 = v59;
  v61 = *(void (**)(char *, uint64_t))(v54 + 8);
  v48 = v95;
  v62 = v57;
  v49 = v56;
  v31 = v90;
  v61(v62, v51);
  if (!v60)
  {
LABEL_9:
    (*(void (**)(char *, uint64_t))(v48 + 8))(v84, v49);
    goto LABEL_10;
  }
  v100 = v58;
  v101 = v60;
  sub_213CCC08C(v38, (uint64_t)&v96);
  v63 = v83;
  v64 = v84;
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v83, v84, v49);
  v65 = (*(unsigned __int8 *)(v48 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
  v66 = swift_allocObject();
  v67 = v97;
  *(_OWORD *)(v66 + 16) = v96;
  *(_OWORD *)(v66 + 32) = v67;
  *(_OWORD *)(v66 + 48) = v98;
  *(_QWORD *)(v66 + 64) = v99;
  ((void (*)(unint64_t, char *, uint64_t))v80[0])(v66 + v65, v63, v49);
  v68 = v81;
  sub_213CE6154();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v64, v49);
  v69 = v85;
  v70 = (uint64_t)v86;
  v71 = v92;
  (*(void (**)(char *, char *, uint64_t))(v85 + 32))(v86, v68, v92);
  v72 = 0;
  v74 = (uint64_t)v87;
  v73 = v88;
  v75 = v93;
LABEL_11:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 56))(v70, v72, 1, v71);
  v76 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v31 + 2);
  v76(v21, v75, v35);
  sub_213CC3694(v70, v74, &qword_254D35AE0);
  v76(v73, v21, v35);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35B00);
  sub_213CC3694(v74, (uint64_t)&v73[*(int *)(v77 + 48)], &qword_254D35AE0);
  sub_213CC3848(v70, &qword_254D35AE0);
  v78 = (void (*)(char *, uint64_t))*((_QWORD *)v31 + 1);
  v78(v75, v35);
  sub_213CC3848(v74, &qword_254D35AE0);
  return ((uint64_t (*)(char *, uint64_t))v78)(v21, v35);
}

uint64_t sub_213CCC8A0@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_213CCC1B8(*(_QWORD **)(v1 + 16), a1);
}

uint64_t sub_213CCC8A8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v3 = a1[3];
  v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v3, v4);
  if (v5)
  {
    sub_213CC1814();
    result = sub_213CE5FD4();
    v9 = v8 & 1;
  }
  else
  {
    result = 0;
    v9 = 0;
    v7 = 0;
  }
  *a2 = result;
  a2[1] = v5;
  a2[2] = v9;
  a2[3] = v7;
  return result;
}

unint64_t sub_213CCC930()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_253F0BA50;
  if (!qword_253F0BA50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0BA48);
    v2 = MEMORY[0x24BDF1F80];
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_253F0BA50);
  }
  return result;
}

uint64_t sub_213CCC98C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213CCC9A4()
{
  return sub_213CE5AE8();
}

uint64_t dispatch thunk of AlertError.localizedTitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AlertError.localizedDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AlertError.requiresUserAcknowledgement.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of AlertError.clientFailure.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of AlertError.paymentOffersError.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of AlertError.init(error:localizedTitle:localizedDescription:requiresUserAcknowledgement:clientFailure:paymentOffersError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(void))(a10 + 64))();
}

uint64_t dispatch thunk of AlertError.init(displayableError:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of AlertError.localizedRecoveryActionName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of AlertError.recoveryActionUrl.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t destroy for ErrorAlertModifier(uint64_t a1)
{
  uint64_t result;

  swift_release();
  result = swift_release();
  if (*(_QWORD *)(a1 + 40))
    return __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  return result;
}

uint64_t initializeWithCopy for ErrorAlertModifier(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  _OWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;

  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = (_OWORD *)(a1 + 16);
  v6 = a2 + 2;
  v7 = a2[5];
  swift_retain();
  swift_retain();
  if (v7)
  {
    v8 = a2[6];
    *(_QWORD *)(a1 + 40) = v7;
    *(_QWORD *)(a1 + 48) = v8;
    (**(void (***)(uint64_t, _QWORD *, uint64_t))(v7 - 8))(a1 + 16, v6, v7);
  }
  else
  {
    v9 = *((_OWORD *)v6 + 1);
    *v5 = *(_OWORD *)v6;
    *(_OWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 48) = v6[4];
  }
  return a1;
}

uint64_t assignWithCopy for ErrorAlertModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  v4 = *(_QWORD *)(a2 + 40);
  if (!*(_QWORD *)(a1 + 40))
  {
    if (v4)
    {
      *(_QWORD *)(a1 + 40) = v4;
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
      return a1;
    }
LABEL_7:
    v5 = *(_OWORD *)(a2 + 16);
    v6 = *(_OWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 16) = v5;
    *(_OWORD *)(a1 + 32) = v6;
    return a1;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  return a1;
}

uint64_t assignWithTake for ErrorAlertModifier(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  if (*(_QWORD *)(a1 + 40))
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for ErrorAlertModifier(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ErrorAlertModifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ErrorAlertModifier()
{
  return &type metadata for ErrorAlertModifier;
}

uint64_t sub_213CCCCB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_213CE5B60();
  v4[0] = v1;
  v4[1] = sub_213CCCD0C();
  return MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_213CCCD0C()
{
  unint64_t result;

  result = qword_254D35AD0;
  if (!qword_254D35AD0)
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE7B50, &type metadata for ErrorAlertModifier);
    atomic_store(result, (unint64_t *)&qword_254D35AD0);
  }
  return result;
}

uint64_t sub_213CCCD50()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0BA10);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0BA80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0BA48);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0B8B8);
  sub_213CC0B2C(&qword_253F0BA08, &qword_253F0BA10, MEMORY[0x24BDEFB78]);
  sub_213CC0B2C(&qword_253F0BA78, &qword_253F0BA80, MEMORY[0x24BDF5428]);
  sub_213CCC930();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213CCCE28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_213CE59D4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  swift_release();
  swift_release();
  if (*(_QWORD *)(v0 + 56))
    __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + ((v3 + 72) & ~v3), v1);
  return swift_deallocObject();
}

void sub_213CCCEB4()
{
  void *v0;
  id v1;

  sub_213CE59D4();
  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (v1)
  {
    v0 = (void *)sub_213CE59A4();
    objc_msgSend(v1, sel_openSensitiveURL_withOptions_, v0, 0);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_213CCCF44()
{
  return 0;
}

uint64_t ClientViewSource.secondaryContent.getter()
{
  return 0;
}

uint64_t ClientViewSource.secondaryFooter.getter()
{
  return 0;
}

uint64_t sub_213CCCF68()
{
  return 0;
}

uint64_t KeyPathView.init(path:source:shouldSuspendStateMachine:analyticsTag:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;

  v10 = sub_213CE59EC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)a5 = swift_getKeyPath();
  *(_BYTE *)(a5 + 8) = 0;
  *(_OWORD *)(a5 + 48) = 0u;
  *(_BYTE *)(a5 + 64) = 0;
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)(a5 + 88) = 0u;
  *(_OWORD *)(a5 + 72) = 0u;
  *(_QWORD *)(a5 + 16) = a1;
  *(_QWORD *)(a5 + 24) = 0;
  swift_retain();
  sub_213CCD688(a2, a5 + 32);
  *(_BYTE *)(a5 + 64) = a3;
  sub_213CCD688(a4, a5 + 72);
  sub_213CE59E0();
  swift_release();
  sub_213CC3848(a4, &qword_254D35B08);
  sub_213CC3848(a2, &qword_254D35B08);
  v14 = type metadata accessor for KeyPathView();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a5 + *(int *)(v14 + 40), v13, v10);
}

uint64_t sub_213CCD0A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v20 = a5;
  v13 = sub_213CE59EC();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)a7 = swift_getKeyPath();
  *(_BYTE *)(a7 + 8) = 0;
  *(_QWORD *)(a7 + 16) = 0;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 72) = 0u;
  *(_OWORD *)(a7 + 88) = 0u;
  v21 = a1;
  v22 = a2;
  a3 &= 1u;
  v23 = a3;
  v24 = a4;
  sub_213CD02B8(a1, a2, a3);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a7 + 24) = sub_213CE619C();
  *(_BYTE *)(a7 + 64) = v20;
  sub_213CCD688(a6, a7 + 72);
  sub_213CE59E0();
  sub_213CC3848(a6, &qword_254D35B08);
  sub_213CC1858(a1, a2, a3);
  swift_bridgeObjectRelease();
  v17 = type metadata accessor for KeyPathView();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a7 + *(int *)(v17 + 40), v16, v13);
}

uint64_t sub_213CCD20C@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v8 = sub_213CE59EC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)a4 = swift_getKeyPath();
  *(_BYTE *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 88) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  v14[1] = a1;
  swift_retain();
  *(_QWORD *)(a4 + 24) = sub_213CE619C();
  *(_BYTE *)(a4 + 64) = a2;
  sub_213CCD688(a3, a4 + 72);
  sub_213CE59E0();
  sub_213CC3848(a3, &qword_254D35B08);
  swift_release();
  v12 = type metadata accessor for KeyPathView();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4 + *(int *)(v12 + 40), v11, v8);
}

uint64_t KeyPathView.init<A>(view:shouldSuspendStateMachine:analyticsTag:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v20;
  int v21;

  v20 = a5;
  v21 = a2;
  v10 = sub_213CE59EC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)a6 = swift_getKeyPath();
  *(_BYTE *)(a6 + 8) = 0;
  *(_QWORD *)(a6 + 16) = 0;
  *(_OWORD *)(a6 + 32) = 0u;
  *(_OWORD *)(a6 + 48) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  *(_OWORD *)(a6 + 72) = 0u;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, a4);
  *(_QWORD *)(a6 + 24) = sub_213CE619C();
  *(_BYTE *)(a6 + 64) = v21;
  sub_213CCD688(a3, a6 + 72);
  sub_213CE59E0();
  sub_213CC3848(a3, &qword_254D35B08);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a1, a4);
  v18 = type metadata accessor for KeyPathView();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a6 + *(int *)(v18 + 40), v14, v10);
}

uint64_t sub_213CCD49C(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v4 = sub_213CE5CC8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_retain();
    v8 = sub_213CE6304();
    v9 = sub_213CE5ECC();
    if (os_log_type_enabled(v9, v8))
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v14 = v11;
      *(_DWORD *)v10 = 136315138;
      *(_QWORD *)(v10 + 4) = sub_213CC4974(0xD00000000000001FLL, 0x8000000213CEDD10, &v14);
      _os_log_impl(&dword_213CB9000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C1F38](v11, -1, -1);
      MEMORY[0x2199C1F38](v10, -1, -1);
    }

    sub_213CE5CBC();
    swift_getAtKeyPath();
    sub_213CCD718(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

uint64_t sub_213CCD638@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.availableSheetItems.getter();
  *a1 = result;
  return result;
}

uint64_t sub_213CCD660()
{
  swift_bridgeObjectRetain();
  return EnvironmentValues.availableSheetItems.setter();
}

uint64_t sub_213CCD688(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for KeyPathView()
{
  uint64_t result;

  result = qword_254D36D80;
  if (!qword_254D36D80)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_213CCD70C(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return swift_bridgeObjectRetain();
  else
    return swift_retain();
}

uint64_t sub_213CCD718(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return swift_bridgeObjectRelease();
  else
    return swift_release();
}

uint64_t KeyPathView.source.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_213CC3694(v1 + 32, a1, &qword_254D35B08);
}

uint64_t KeyPathView.source.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_213CCD750(a1, v1 + 32);
}

uint64_t sub_213CCD750(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*KeyPathView.source.modify())()
{
  return nullsub_1;
}

uint64_t KeyPathView.shouldSuspendStateMachine.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t KeyPathView.shouldSuspendStateMachine.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 64) = result;
  return result;
}

uint64_t (*KeyPathView.shouldSuspendStateMachine.modify())()
{
  return nullsub_1;
}

uint64_t KeyPathView.analyticsTag.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_213CC3694(v1 + 72, a1, &qword_254D35B08);
}

uint64_t KeyPathView.analyticsTag.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_213CCD750(a1, v1 + 72);
}

uint64_t (*KeyPathView.analyticsTag.modify())()
{
  return nullsub_1;
}

uint64_t KeyPathView.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for KeyPathView() + 40);
  v4 = sub_213CE59EC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t KeyPathView.id.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for KeyPathView() + 40);
  v4 = sub_213CE59EC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*KeyPathView.id.modify())(_QWORD)
{
  type metadata accessor for KeyPathView();
  return nullsub_1;
}

uint64_t sub_213CCD8BC()
{
  uint64_t v0;
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
  __int128 *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  _OWORD v22[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35C48);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for KeyPathView();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v18 - v9;
  if (!*(_QWORD *)(v0 + 16))
    return 0;
  memset(v22, 0, sizeof(v22));
  sub_213CC3694(v0 + 32, (uint64_t)&v18, &qword_254D35B08);
  if (v19)
  {
    sub_213CD0F70(&v18, &v20);
    swift_retain();
    swift_getAtAnyKeyPath();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
    sub_213CC3848((uint64_t)v22, &qword_254D35B08);
    v11 = &v18;
  }
  else
  {
    swift_retain();
    sub_213CC3848((uint64_t)&v18, &qword_254D35B08);
    v12 = *(_QWORD *)v0;
    v13 = *(_BYTE *)(v0 + 8);
    sub_213CCD70C(v12, v13);
    v14 = sub_213CCD49C(v12, v13);
    sub_213CCD718(v12, v13);
    *(_QWORD *)&v18 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D35C60);
    swift_getAtAnyKeyPath();
    swift_bridgeObjectRelease();
    sub_213CC3848((uint64_t)v22, &qword_254D35B08);
    v11 = &v20;
  }
  sub_213CD0F28((uint64_t)v11, (uint64_t)v22);
  sub_213CC3694((uint64_t)v22, (uint64_t)&v20, &qword_254D35B08);
  if (!v21)
  {
    sub_213CC3848((uint64_t)&v20, &qword_254D35B08);
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    sub_213CC3694((uint64_t)v22, (uint64_t)&v20, &qword_254D35B08);
    if (v21)
    {
      v16 = swift_dynamicCast();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, v16 ^ 1u, 1, v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) != 1)
      {
        sub_213CD0194((uint64_t)v3, (uint64_t)v10);
        sub_213CD03F0((uint64_t)v10, (uint64_t)v8);
        sub_213CD0344((unint64_t *)&qword_254D35C58, (uint64_t (*)(uint64_t))type metadata accessor for KeyPathView, (uint64_t)&protocol conformance descriptor for KeyPathView);
        v15 = sub_213CE619C();
        swift_release();
        sub_213CD0434((uint64_t)v10);
        goto LABEL_12;
      }
    }
    else
    {
      sub_213CC3848((uint64_t)&v20, &qword_254D35B08);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    }
    swift_release();
    sub_213CC3848((uint64_t)v22, &qword_254D35B08);
    sub_213CC3848((uint64_t)v3, &qword_254D35C48);
    return 0;
  }
  swift_release();
  v15 = v18;
LABEL_12:
  sub_213CC3848((uint64_t)v22, &qword_254D35B08);
  return v15;
}

uint64_t KeyPathView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;

  v3 = sub_213CE5D40();
  if (*(_QWORD *)(v1 + 24))
  {
    swift_retain();
  }
  else
  {
    result = sub_213CCD8BC();
    if (!result)
    {
      v5 = 0;
      v6 = -1;
      goto LABEL_5;
    }
  }
  result = sub_213CE5E0C();
  v5 = v7;
  v6 = v8;
LABEL_5:
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  return result;
}

uint64_t sub_213CCDCD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  if (*(_QWORD *)(a1 + 24))
  {
    swift_retain();
  }
  else
  {
    result = sub_213CCD8BC();
    if (!result)
    {
      v4 = 0;
      v5 = -1;
      goto LABEL_5;
    }
  }
  result = sub_213CE5E0C();
  v4 = v6;
  v5 = v7;
LABEL_5:
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_213CCDD64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;

  v3 = sub_213CE5D40();
  result = sub_213CCDCD0(v1, (uint64_t)&v7);
  v5 = v7;
  v6 = v8;
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  return result;
}

uint64_t sub_213CCDDC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 40);
  v5 = sub_213CE59EC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_213CCDE00()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v8;
  char v9;
  _BYTE v10[24];
  uint64_t v11;
  __int128 v12;
  char v13;
  uint64_t v14;

  v0 = sub_213CE5D40();
  sub_213CCDEC0((uint64_t)&v8);
  v1 = v9;
  v2 = *(_QWORD *)v10;
  v3 = v11;
  v4 = v12;
  v5 = v8;
  v6 = *(_OWORD *)&v10[8];
  v8 = (unint64_t)v0;
  v9 = 1;
  *(_OWORD *)v10 = v5;
  v10[16] = v1;
  v11 = v2;
  v12 = v6;
  v13 = v3;
  v14 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35B10);
  sub_213CCDFF4();
  return sub_213CE619C();
}

uint64_t sub_213CCDEC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;

  sub_213CC1814();
  swift_bridgeObjectRetain();
  v2 = sub_213CE5FD4();
  v4 = v3;
  v6 = v5;
  v8 = v7 & 1;
  swift_bridgeObjectRetain();
  v9 = sub_213CE5FD4();
  v11 = v10;
  v13 = v12 & 1;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v9;
  *(_QWORD *)(a1 + 40) = v10;
  *(_BYTE *)(a1 + 48) = v12 & 1;
  *(_QWORD *)(a1 + 56) = v14;
  sub_213CD02B8(v2, v4, v8);
  swift_bridgeObjectRetain();
  sub_213CD02B8(v9, v11, v13);
  swift_bridgeObjectRetain();
  sub_213CC1858(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_213CC1858(v2, v4, v8);
  return swift_bridgeObjectRelease();
}

unint64_t sub_213CCDFF4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_254D35B18;
  if (!qword_254D35B18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35B10);
    v2 = sub_213CC0B2C(&qword_254D35B20, &qword_254D35B28, MEMORY[0x24BDF4700]);
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254D35B18);
  }
  return result;
}

unint64_t sub_213CCE070()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  _OWORD v11[3];

  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35B38);
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35B40);
  v1 = *(unsigned __int8 *)(*(_QWORD *)(v0 - 8) + 80);
  v2 = (v1 + 32) & ~v1;
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_213CE7BE0;
  v4 = (_QWORD *)(v3 + v2);
  v5 = v3 + v2 + *(int *)(v0 + 48);
  *v4 = 0x7473726966;
  v4[1] = 0xE500000000000000;
  sub_213CE5D04();
  v6 = sub_213CE5FBC();
  memset(v11, 0, 32);
  sub_213CCD0A4(v6, v8, v7 & 1, v9, 0, (uint64_t)v11, v5);
  result = sub_213CCE16C(v3);
  qword_254D37F88 = result;
  return result;
}

unint64_t sub_213CCE16C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  _QWORD v25[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35B40);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (_QWORD *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35C40);
  v6 = sub_213CE63F4();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = (uint64_t)v5 + *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_213CC3694(v12, (uint64_t)v5, &qword_254D35B40);
    v14 = *v5;
    v15 = v5[1];
    result = sub_213CD0130(*v5, v15);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = (uint64_t *)(v7[6] + 16 * result);
    *v19 = v14;
    v19[1] = v15;
    v20 = v7[7];
    v21 = type metadata accessor for KeyPathView();
    result = sub_213CD0194(v9, v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v18);
    v22 = v7[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_11;
    v7[2] = v24;
    v12 += v13;
    if (!--v8)
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

uint64_t static KeyPathView_Previews.previews.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t *v26;
  __int128 v28;
  _BYTE v29[32];
  uint64_t v30;
  __int128 v31;
  char v32;
  uint64_t v33;
  _OWORD v34[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35B30);
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v29[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
  sub_213CCE5A8((uint64_t)v4);
  KeyPath = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35B38);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35B40);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 72);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_213CE7BF0;
  v11 = (_QWORD *)(v10 + v9);
  v12 = v10 + v9 + *(int *)(v6 + 48);
  *v11 = 0x4977656976657270;
  v11[1] = 0xEB000000006D6574;
  v13 = swift_getKeyPath();
  *(_QWORD *)&v29[8] = &type metadata for KeyPathView_Previews.MySource;
  v14 = (_QWORD *)swift_allocObject();
  *(_QWORD *)&v28 = v14;
  v14[2] = 0x3120656C746954;
  v14[3] = 0xE700000000000000;
  v14[4] = 0x3220656C746954;
  v14[5] = 0xE700000000000000;
  memset(v34, 0, sizeof(v34));
  KeyPathView.init(path:source:shouldSuspendStateMachine:analyticsTag:)(v13, (uint64_t)&v28, 0, (uint64_t)v34, v12);
  v15 = (_QWORD *)((char *)v11 + v8);
  v16 = (uint64_t)v11 + v8 + *(int *)(v6 + 48);
  *v15 = 0x3277656976657270;
  v15[1] = 0xE800000000000000;
  v17 = sub_213CE5D40();
  sub_213CCDEC0((uint64_t)&v28);
  v18 = v29[0];
  v19 = *(_QWORD *)&v29[8];
  v20 = v30;
  v21 = v31;
  v22 = v28;
  v23 = *(_OWORD *)&v29[16];
  v28 = (unint64_t)v17;
  v29[0] = 1;
  *(_OWORD *)&v29[8] = v22;
  v29[24] = v18;
  v30 = v19;
  v31 = v23;
  v32 = v20;
  v33 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35B10);
  sub_213CCDFF4();
  v24 = sub_213CE619C();
  v28 = 0u;
  *(_OWORD *)v29 = 0u;
  sub_213CCD20C(v24, 0, (uint64_t)&v28, v16);
  v25 = sub_213CCE16C(v10);
  sub_213CC3694((uint64_t)v4, a1, &qword_254D35B30);
  v26 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D35B48) + 36));
  *v26 = KeyPath;
  v26[1] = v25;
  return sub_213CC3848((uint64_t)v4, &qword_254D35B30);
}

uint64_t sub_213CCE5A8@<X0>(uint64_t a1@<X8>)
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
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t KeyPath;
  _QWORD *v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  void (*v52)(char *, char *, uint64_t);
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, char *, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, char *, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(uint64_t, char *, uint64_t);
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
  int *v85;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t *v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;

  v101 = a1;
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35C48);
  v1 = MEMORY[0x24BDAC7A8](v91);
  v90 = (uint64_t)&v87 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v92 = (uint64_t)&v87 - v3;
  v4 = sub_213CE59EC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for KeyPathView();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = v8;
  v88 = v8;
  v87 = v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v100 = (uint64_t)&v87 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v99 = (uint64_t)&v87 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v98 = (uint64_t)&v87 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v97 = (uint64_t)&v87 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v96 = (uint64_t)&v87 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v104 = (uint64_t)&v87 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v95 = (uint64_t *)((char *)&v87 - v24);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v94 = (uint64_t *)((char *)&v87 - v26);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v93 = (uint64_t *)((char *)&v87 - v28);
  v29 = MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)&v87 - v30;
  v32 = MEMORY[0x24BDAC7A8](v29);
  v105 = (uint64_t)&v87 - v33;
  v34 = MEMORY[0x24BDAC7A8](v32);
  v36 = (char *)&v87 - v35;
  MEMORY[0x24BDAC7A8](v34);
  v38 = (char *)&v87 - v37;
  KeyPath = swift_getKeyPath();
  *((_QWORD *)&v109 + 1) = &type metadata for KeyPathView_Previews.MySource;
  v40 = (_QWORD *)swift_allocObject();
  *(_QWORD *)&v108 = v40;
  v40[2] = 0x3120656C746954;
  v40[3] = 0xE700000000000000;
  v40[4] = 0x3220656C746954;
  v40[5] = 0xE700000000000000;
  v106 = 0u;
  v107 = 0u;
  *(_QWORD *)v38 = swift_getKeyPath();
  v38[8] = 0;
  *((_OWORD *)v38 + 3) = 0u;
  v38[64] = 0;
  *((_OWORD *)v38 + 2) = 0u;
  *(_OWORD *)(v38 + 88) = 0u;
  *(_OWORD *)(v38 + 72) = 0u;
  *((_QWORD *)v38 + 2) = KeyPath;
  *((_QWORD *)v38 + 3) = 0;
  swift_retain();
  sub_213CCD688((uint64_t)&v108, (uint64_t)(v38 + 32));
  v38[64] = 0;
  sub_213CCD688((uint64_t)&v106, (uint64_t)(v38 + 72));
  sub_213CE59E0();
  swift_release();
  sub_213CC3848((uint64_t)&v106, &qword_254D35B08);
  sub_213CC3848((uint64_t)&v108, &qword_254D35B08);
  v41 = *(int *)(v10 + 40);
  v102 = v38;
  v42 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v42(&v38[v41], v7, v4);
  sub_213CE5D04();
  v43 = sub_213CE5FBC();
  v45 = v44;
  v47 = v46;
  LOBYTE(v5) = v48 & 1;
  v108 = 0u;
  v109 = 0u;
  *(_QWORD *)v36 = swift_getKeyPath();
  v36[8] = 0;
  *((_QWORD *)v36 + 2) = 0;
  *((_OWORD *)v36 + 2) = 0u;
  *((_OWORD *)v36 + 3) = 0u;
  *(_OWORD *)(v36 + 88) = 0u;
  *(_OWORD *)(v36 + 72) = 0u;
  *(_QWORD *)&v106 = v43;
  *((_QWORD *)&v106 + 1) = v45;
  LOBYTE(v107) = v5;
  *((_QWORD *)&v107 + 1) = v47;
  sub_213CD02B8(v43, v45, v5);
  swift_bridgeObjectRetain();
  *((_QWORD *)v36 + 3) = sub_213CE619C();
  v36[64] = 0;
  sub_213CCD688((uint64_t)&v108, (uint64_t)(v36 + 72));
  sub_213CE59E0();
  sub_213CC3848((uint64_t)&v108, &qword_254D35B08);
  sub_213CC1858(v43, v45, v5);
  swift_bridgeObjectRelease();
  v49 = v88;
  v50 = *(int *)(v88 + 40);
  v103 = v36;
  v89 = v7;
  v51 = v7;
  v52 = v42;
  v42(&v36[v50], v51, v4);
  if (qword_254D36B60 != -1)
    swift_once();
  swift_beginAccess();
  v53 = qword_254D37F88;
  if (!*(_QWORD *)(qword_254D37F88 + 16))
  {
    v58 = 1;
    v55 = v92;
LABEL_8:
    v57 = v87;
    goto LABEL_9;
  }
  v54 = sub_213CD0130(0x7473726966, 0xE500000000000000);
  v55 = v92;
  if ((v56 & 1) == 0)
  {
    v58 = 1;
    goto LABEL_8;
  }
  v57 = v87;
  sub_213CD03F0(*(_QWORD *)(v53 + 56) + *(_QWORD *)(v87 + 72) * v54, v92);
  v58 = 0;
LABEL_9:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v57 + 56))(v55, v58, 1, v49);
  swift_endAccess();
  v108 = 0u;
  v109 = 0u;
  *(_QWORD *)v31 = swift_getKeyPath();
  v31[8] = 0;
  *((_QWORD *)v31 + 2) = 0;
  *((_OWORD *)v31 + 2) = 0u;
  *((_OWORD *)v31 + 3) = 0u;
  *(_OWORD *)(v31 + 88) = 0u;
  *(_OWORD *)(v31 + 72) = 0u;
  sub_213CC3694(v55, v90, &qword_254D35C48);
  sub_213CD02C8();
  *((_QWORD *)v31 + 3) = sub_213CE619C();
  v31[64] = 0;
  sub_213CCD688((uint64_t)&v108, (uint64_t)(v31 + 72));
  v59 = v89;
  sub_213CE59E0();
  sub_213CC3848((uint64_t)&v108, &qword_254D35B08);
  sub_213CC3848(v55, &qword_254D35C48);
  v60 = v49;
  v61 = (uint64_t (*)(uint64_t, char *, uint64_t))v52;
  v52(&v31[*(int *)(v49 + 40)], v59, v4);
  v62 = sub_213CD0194((uint64_t)v31, v105);
  MEMORY[0x24BDAC7A8](v62);
  v63 = swift_getKeyPath();
  v64 = qword_254D37F88;
  *((_QWORD *)&v109 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35C60);
  *(_QWORD *)&v108 = v64;
  v106 = 0u;
  v107 = 0u;
  v65 = swift_getKeyPath();
  v66 = (uint64_t)v93;
  *v93 = v65;
  *(_BYTE *)(v66 + 8) = 0;
  *(_OWORD *)(v66 + 48) = 0u;
  *(_BYTE *)(v66 + 64) = 0;
  *(_OWORD *)(v66 + 32) = 0u;
  *(_OWORD *)(v66 + 88) = 0u;
  *(_OWORD *)(v66 + 72) = 0u;
  *(_QWORD *)(v66 + 16) = v63;
  *(_QWORD *)(v66 + 24) = 0;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_213CCD688((uint64_t)&v108, v66 + 32);
  *(_BYTE *)(v66 + 64) = 0;
  sub_213CCD688((uint64_t)&v106, v66 + 72);
  sub_213CE59E0();
  swift_release();
  sub_213CC3848((uint64_t)&v106, &qword_254D35B08);
  sub_213CC3848((uint64_t)&v108, &qword_254D35B08);
  v67 = v61;
  v68 = v61(v66 + *(int *)(v60 + 40), v59, v4);
  MEMORY[0x24BDAC7A8](v68);
  v69 = swift_getKeyPath();
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v70 = swift_getKeyPath();
  v71 = (uint64_t)v94;
  *v94 = v70;
  *(_BYTE *)(v71 + 8) = 0;
  *(_OWORD *)(v71 + 48) = 0u;
  *(_BYTE *)(v71 + 64) = 0;
  *(_OWORD *)(v71 + 32) = 0u;
  *(_OWORD *)(v71 + 88) = 0u;
  *(_OWORD *)(v71 + 72) = 0u;
  *(_QWORD *)(v71 + 16) = v69;
  *(_QWORD *)(v71 + 24) = 0;
  swift_retain();
  sub_213CCD688((uint64_t)&v108, v71 + 32);
  *(_BYTE *)(v71 + 64) = 0;
  sub_213CCD688((uint64_t)&v106, v71 + 72);
  sub_213CE59E0();
  swift_release();
  sub_213CC3848((uint64_t)&v106, &qword_254D35B08);
  sub_213CC3848((uint64_t)&v108, &qword_254D35B08);
  v72 = v60;
  v73 = v67(v71 + *(int *)(v60 + 40), v59, v4);
  v74 = (void (*)(uint64_t, char *, uint64_t))v67;
  MEMORY[0x24BDAC7A8](v73);
  v75 = swift_getKeyPath();
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v76 = swift_getKeyPath();
  v77 = (uint64_t)v95;
  *v95 = v76;
  *(_BYTE *)(v77 + 8) = 0;
  *(_OWORD *)(v77 + 48) = 0u;
  *(_BYTE *)(v77 + 64) = 0;
  *(_OWORD *)(v77 + 32) = 0u;
  *(_OWORD *)(v77 + 88) = 0u;
  *(_OWORD *)(v77 + 72) = 0u;
  *(_QWORD *)(v77 + 16) = v75;
  *(_QWORD *)(v77 + 24) = 0;
  swift_retain();
  sub_213CCD688((uint64_t)&v108, v77 + 32);
  *(_BYTE *)(v77 + 64) = 0;
  sub_213CCD688((uint64_t)&v106, v77 + 72);
  sub_213CE59E0();
  swift_release();
  sub_213CC3848((uint64_t)&v106, &qword_254D35B08);
  sub_213CC3848((uint64_t)&v108, &qword_254D35B08);
  v74(v77 + *(int *)(v72 + 40), v59, v4);
  v78 = v104;
  sub_213CD03F0((uint64_t)v102, v104);
  v79 = v96;
  sub_213CD03F0((uint64_t)v103, v96);
  v80 = v97;
  sub_213CD03F0(v105, v97);
  v81 = v98;
  sub_213CD03F0(v66, v98);
  v82 = v99;
  sub_213CD03F0(v71, v99);
  v83 = v100;
  sub_213CD03F0(v77, v100);
  v84 = v101;
  sub_213CD03F0(v78, v101);
  v85 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254D35C68);
  sub_213CD03F0(v79, v84 + v85[12]);
  sub_213CD03F0(v80, v84 + v85[16]);
  sub_213CD03F0(v81, v84 + v85[20]);
  sub_213CD03F0(v82, v84 + v85[24]);
  sub_213CD03F0(v83, v84 + v85[28]);
  sub_213CD0434(v77);
  sub_213CD0434(v71);
  sub_213CD0434(v66);
  sub_213CD0434(v105);
  sub_213CD0434((uint64_t)v103);
  sub_213CD0434((uint64_t)v102);
  sub_213CD0434(v83);
  sub_213CD0434(v82);
  sub_213CD0434(v81);
  sub_213CD0434(v80);
  sub_213CD0434(v79);
  return sub_213CD0434(v104);
}

uint64_t sub_213CCF09C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t result;
  __int128 v10;
  char v11;
  _BYTE v12[24];
  uint64_t v13;
  __int128 v14;
  char v15;
  uint64_t v16;

  v2 = sub_213CE5D40();
  sub_213CCDEC0((uint64_t)&v10);
  v3 = v11;
  v4 = *(_QWORD *)v12;
  v5 = v13;
  v6 = v14;
  v7 = v10;
  v8 = *(_OWORD *)&v12[8];
  v10 = (unint64_t)v2;
  v11 = 1;
  *(_OWORD *)v12 = v7;
  v12[16] = v3;
  v13 = v4;
  v14 = v8;
  v15 = v5;
  v16 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35B10);
  sub_213CCDFF4();
  result = sub_213CE619C();
  *a1 = result;
  return result;
}

uint64_t sub_213CCF15C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_213CCF188@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (*(_QWORD *)(a3 + 16) && (v6 = sub_213CD0130(a1, a2), (v7 & 1) != 0))
  {
    v8 = v6;
    v9 = *(_QWORD *)(a3 + 56);
    v10 = type metadata accessor for KeyPathView();
    v11 = *(_QWORD *)(v10 - 8);
    sub_213CD03F0(v9 + *(_QWORD *)(v11 + 72) * v8, a4);
    v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v13 = a4;
    v14 = 0;
    v15 = v10;
  }
  else
  {
    v15 = type metadata accessor for KeyPathView();
    v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
    v13 = a4;
    v14 = 1;
  }
  return v12(v13, v14, 1, v15);
}

uint64_t sub_213CCF228(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  if (v3 == *a1 && v4 == a1[1])
    return 1;
  else
    return sub_213CE6418();
}

uint64_t sub_213CCF250()
{
  return sub_213CE62BC();
}

uint64_t sub_213CCF25C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a1;
  v5 = *a2;
  v6 = a2[1];
  swift_bridgeObjectRetain();
  sub_213CCF188(v5, v6, v4, a3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_213CCF2A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35C48);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a3;
  v8 = a3[1];
  sub_213CC3694(a1, (uint64_t)v7, &qword_254D35C48);
  swift_bridgeObjectRetain();
  return sub_213CCF348((uint64_t)v7, v9, v8);
}

uint64_t sub_213CCF348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35C48);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for KeyPathView();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_213CC3848(a1, &qword_254D35C48);
    sub_213CD0470(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_213CC3848((uint64_t)v10, &qword_254D35C48);
  }
  else
  {
    sub_213CD0194(a1, (uint64_t)v13);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v4;
    *v4 = 0x8000000000000000;
    sub_213CD0AFC((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_213CCF4A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213CCF4B8()
{
  return sub_213CD0344(&qword_254D35B50, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

unint64_t sub_213CCF4E8()
{
  unint64_t result;

  result = qword_254D35B58;
  if (!qword_254D35B58)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for KeyPathView_Previews, &type metadata for KeyPathView_Previews);
    atomic_store(result, (unint64_t *)&qword_254D35B58);
  }
  return result;
}

uint64_t sub_213CCF52C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213CCF540()
{
  sub_213CD00EC();
  return sub_213CE5B84();
}

uint64_t sub_213CCF578()
{
  sub_213CD00EC();
  return sub_213CE5B78();
}

uint64_t dispatch thunk of ClientViewSource.init(context:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ClientViewSource.header.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ClientViewSource.content.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ClientViewSource.footer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ClientViewSource.secondaryContent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ClientViewSource.secondaryFooter.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

unint64_t initializeBufferWithCopyOfBuffer for KeyPathView(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v11 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = *(_QWORD *)a2;
    v8 = *(_BYTE *)(a2 + 8);
    sub_213CCD70C(*(_QWORD *)a2, v8);
    *(_QWORD *)a1 = v7;
    *(_BYTE *)(a1 + 8) = v8;
    v9 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v9;
    v10 = *(_QWORD *)(a2 + 56);
    swift_retain();
    swift_retain();
    if (v10)
    {
      *(_QWORD *)(a1 + 56) = v10;
      (**(void (***)(uint64_t, uint64_t, uint64_t))(v10 - 8))(a1 + 32, a2 + 32, v10);
    }
    else
    {
      v12 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 48) = v12;
    }
    *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
    v13 = (_OWORD *)(a1 + 72);
    v14 = (_OWORD *)(a2 + 72);
    v15 = *(_QWORD *)(a2 + 96);
    if (v15)
    {
      *(_QWORD *)(a1 + 96) = v15;
      (**(void (***)(_OWORD *, _OWORD *))(v15 - 8))(v13, v14);
    }
    else
    {
      v16 = *(_OWORD *)(a2 + 88);
      *v13 = *v14;
      *(_OWORD *)(a1 + 88) = v16;
    }
    v17 = *(int *)(a3 + 40);
    v18 = a1 + v17;
    v19 = a2 + v17;
    v20 = sub_213CE59EC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return a1;
}

uint64_t destroy for KeyPathView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_213CCD718(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  swift_release();
  swift_release();
  if (*(_QWORD *)(a1 + 56))
    __swift_destroy_boxed_opaque_existential_1(a1 + 32);
  if (*(_QWORD *)(a1 + 96))
    __swift_destroy_boxed_opaque_existential_1(a1 + 72);
  v4 = a1 + *(int *)(a2 + 40);
  v5 = sub_213CE59EC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for KeyPathView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  _OWORD *v11;
  _OWORD *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_213CCD70C(*(_QWORD *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v8;
  v9 = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_retain();
  if (v9)
  {
    *(_QWORD *)(a1 + 56) = v9;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8))(a1 + 32, a2 + 32, v9);
  }
  else
  {
    v10 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v10;
  }
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v11 = (_OWORD *)(a1 + 72);
  v12 = (_OWORD *)(a2 + 72);
  v13 = *(_QWORD *)(a2 + 96);
  if (v13)
  {
    *(_QWORD *)(a1 + 96) = v13;
    (**(void (***)(_OWORD *, _OWORD *))(v13 - 8))(v11, v12);
  }
  else
  {
    v14 = *(_OWORD *)(a2 + 88);
    *v11 = *v12;
    *(_OWORD *)(a1 + 88) = v14;
  }
  v15 = *(int *)(a3 + 40);
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = sub_213CE59EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  return a1;
}

uint64_t assignWithCopy for KeyPathView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_213CCD70C(*(_QWORD *)a2, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_213CCD718(v8, v9);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  v10 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(a1 + 56))
  {
    if (v10)
    {
      __swift_assign_boxed_opaque_existential_0((uint64_t *)(a1 + 32), (uint64_t *)(a2 + 32));
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 32);
  }
  else if (v10)
  {
    *(_QWORD *)(a1 + 56) = v10;
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 32, a2 + 32);
    goto LABEL_8;
  }
  v11 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v11;
LABEL_8:
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v12 = *(_QWORD *)(a2 + 96);
  if (!*(_QWORD *)(a1 + 96))
  {
    if (v12)
    {
      *(_QWORD *)(a1 + 96) = v12;
      (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 72, a2 + 72);
      goto LABEL_15;
    }
LABEL_14:
    v13 = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 88) = v13;
    goto LABEL_15;
  }
  if (!v12)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 72);
    goto LABEL_14;
  }
  __swift_assign_boxed_opaque_existential_0((uint64_t *)(a1 + 72), (uint64_t *)(a2 + 72));
LABEL_15:
  v14 = *(int *)(a3 + 40);
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = sub_213CE59EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

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
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

uint64_t initializeWithTake for KeyPathView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  v5 = *(int *)(a3 + 40);
  v6 = a1 + v5;
  v7 = a2 + v5;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  v8 = sub_213CE59EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for KeyPathView(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_213CCD718(v8, v9);
  *(_QWORD *)(a1 + 16) = a2[2];
  swift_release();
  *(_QWORD *)(a1 + 24) = a2[3];
  swift_release();
  if (*(_QWORD *)(a1 + 56))
    __swift_destroy_boxed_opaque_existential_1(a1 + 32);
  v10 = *((_OWORD *)a2 + 3);
  *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
  *(_OWORD *)(a1 + 48) = v10;
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
  if (*(_QWORD *)(a1 + 96))
    __swift_destroy_boxed_opaque_existential_1(a1 + 72);
  v11 = *(_OWORD *)(a2 + 11);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 9);
  *(_OWORD *)(a1 + 88) = v11;
  v12 = *(int *)(a3 + 40);
  v13 = a1 + v12;
  v14 = (uint64_t)a2 + v12;
  v15 = sub_213CE59EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for KeyPathView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_213CCFCEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_213CE59EC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 40), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for KeyPathView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_213CCFD80(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 16) = a2;
  }
  else
  {
    v7 = sub_213CE59EC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }
  return result;
}

uint64_t sub_213CCFDF4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_213CE59EC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for KeyPathView_Previews()
{
  return &type metadata for KeyPathView_Previews;
}

uint64_t destroy for KeyPathView_Previews.MySource()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for KeyPathView_Previews.MySource(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for KeyPathView_Previews.MySource(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for KeyPathView_Previews.MySource(_QWORD *a1, _QWORD *a2)
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

ValueMetadata *type metadata accessor for KeyPathView_Previews.MySource()
{
  return &type metadata for KeyPathView_Previews.MySource;
}

uint64_t sub_213CCFFBC()
{
  return sub_213CC0B2C(&qword_254D35BF8, &qword_254D35C00, MEMORY[0x24BDF4700]);
}

unint64_t sub_213CCFFEC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35C08;
  if (!qword_254D35C08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35B48);
    v2[0] = sub_213CD0070();
    v2[1] = sub_213CC0B2C(&qword_254D35C28, &qword_254D35C30, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35C08);
  }
  return result;
}

unint64_t sub_213CD0070()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_254D35C10;
  if (!qword_254D35C10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35B30);
    v2 = sub_213CC0B2C(&qword_254D35C18, &qword_254D35C20, MEMORY[0x24BDF5428]);
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254D35C10);
  }
  return result;
}

unint64_t sub_213CD00EC()
{
  unint64_t result;

  result = qword_254D35C38;
  if (!qword_254D35C38)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for KeyPathView_Previews, &type metadata for KeyPathView_Previews);
    atomic_store(result, (unint64_t *)&qword_254D35C38);
  }
  return result;
}

unint64_t sub_213CD0130(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_213CE6430();
  sub_213CE62A4();
  v4 = sub_213CE6448();
  return sub_213CD01D8(a1, a2, v4);
}

uint64_t sub_213CD0194(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for KeyPathView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_213CD01D8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_213CE6418() & 1) == 0)
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
      while (!v14 && (sub_213CE6418() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_213CD02B8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

unint64_t sub_213CD02C8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_254D35C50;
  if (!qword_254D35C50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35C48);
    v2 = sub_213CD0344((unint64_t *)&qword_254D35C58, (uint64_t (*)(uint64_t))type metadata accessor for KeyPathView, (uint64_t)&protocol conformance descriptor for KeyPathView);
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254D35C50);
  }
  return result;
}

uint64_t sub_213CD0344(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2199C1EA8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_213CD0384()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_213CD0390()
{
  return 16;
}

uint64_t sub_213CD039C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_213CD03A8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE0D00] - 8) + 16))(a2, a1);
  return a2;
}

__n128 sub_213CD03E4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_213CD03F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for KeyPathView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_213CD0434(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for KeyPathView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_213CD0470@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_213CD0130(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v17 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_213CD0CB8();
      v11 = v17;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = type metadata accessor for KeyPathView();
    v14 = *(_QWORD *)(v13 - 8);
    sub_213CD0194(v12 + *(_QWORD *)(v14 + 72) * v8, a3);
    sub_213CD0900(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v16 = type metadata accessor for KeyPathView();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
}

uint64_t sub_213CD0598(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t v42;
  int v43;

  v3 = v2;
  v5 = type metadata accessor for KeyPathView();
  v42 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35C40);
  v43 = a2;
  v9 = sub_213CE63E8();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v41 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v39 = v2;
  v40 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain();
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v40)
      break;
    v23 = v41;
    v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v40)
        goto LABEL_34;
      v24 = v41[v17];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          v3 = v39;
          if ((v43 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            v17 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v17 >= v40)
              goto LABEL_34;
            v24 = v41[v17];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v17 = v25;
      }
    }
LABEL_21:
    v14 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    v26 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(v42 + 72);
    v30 = *(_QWORD *)(v8 + 56) + v29 * v21;
    if ((v43 & 1) != 0)
    {
      sub_213CD0194(v30, (uint64_t)v7);
    }
    else
    {
      sub_213CD03F0(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_213CE6430();
    sub_213CE62A4();
    result = sub_213CE6448();
    v31 = -1 << *(_BYTE *)(v10 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v36 = v33 == v35;
        if (v33 == v35)
          v33 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    result = sub_213CD0194((uint64_t)v7, *(_QWORD *)(v10 + 56) + v29 * v18);
    ++*(_QWORD *)(v10 + 16);
  }
  swift_release();
  v3 = v39;
  v23 = v41;
  if ((v43 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v38 = 1 << *(_BYTE *)(v8 + 32);
  if (v38 >= 64)
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v38;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

unint64_t sub_213CD0900(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_213CE6364();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_213CE6430();
        swift_bridgeObjectRetain();
        sub_213CE62A4();
        v9 = sub_213CE6448();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v10 < v8)
          goto LABEL_11;
LABEL_12:
        v11 = *(_QWORD *)(a2 + 48);
        v12 = (_OWORD *)(v11 + 16 * v3);
        v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1)
          *v12 = *v13;
        v14 = *(_QWORD *)(a2 + 56);
        v15 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for KeyPathView() - 8) + 72);
        v16 = v15 * v3;
        result = v14 + v15 * v3;
        v17 = v15 * v6;
        v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v16 == v17)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v10 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v10)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_213CD0AFC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_213CD0130(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7];
        v20 = v19 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for KeyPathView() - 8) + 72) * v12;
        return sub_213CD0EE4(a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_213CD0CB8();
      goto LABEL_7;
    }
    sub_213CD0598(v15, a4 & 1);
    v22 = sub_213CD0130(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_213CD0C30(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_213CE6424();
  __break(1u);
  return result;
}

uint64_t sub_213CD0C30(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = type metadata accessor for KeyPathView();
  result = sub_213CD0194(a4, v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

void *sub_213CD0CB8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0;
  v2 = type metadata accessor for KeyPathView();
  v30 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35C40);
  v5 = *v0;
  v6 = sub_213CE63DC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v7;
    return result;
  }
  v28 = v1;
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v29 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v24);
    ++v11;
    if (!v25)
    {
      v11 = v24 + 1;
      if (v24 + 1 >= v15)
        goto LABEL_26;
      v25 = *(_QWORD *)(v29 + 8 * v11);
      if (!v25)
        break;
    }
LABEL_25:
    v14 = (v25 - 1) & v25;
    v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v30 + 72) * v17;
    sub_213CD03F0(*(_QWORD *)(v5 + 56) + v22, (uint64_t)v4);
    v23 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v23 = v21;
    v23[1] = v20;
    sub_213CD0194((uint64_t)v4, *(_QWORD *)(v7 + 56) + v22);
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v28;
    goto LABEL_28;
  }
  v25 = *(_QWORD *)(v29 + 8 * v26);
  if (v25)
  {
    v11 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v11 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v11);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_213CD0EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for KeyPathView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_213CD0F28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_213CD0F70(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t PlaceholderActionItem.init(viewTag:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;

  result = swift_getKeyPath();
  *(_QWORD *)a3 = result;
  *(_BYTE *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = a1;
  *(_QWORD *)(a3 + 24) = a2;
  return result;
}

uint64_t PlaceholderActionItem.viewTag.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PlaceholderActionItem.viewTag.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*PlaceholderActionItem.viewTag.modify())()
{
  return nullsub_1;
}

uint64_t PlaceholderActionItem.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35C70);
  MEMORY[0x24BDAC7A8](v3);
  v39 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35C78);
  MEMORY[0x24BDAC7A8](v42);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35C48);
  v7 = MEMORY[0x24BDAC7A8](v43);
  v38 = (uint64_t)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v40 = (uint64_t)&v35 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v35 - v11;
  v13 = *(_QWORD *)v1;
  v14 = *(_BYTE *)(v1 + 8);
  v15 = *(_QWORD *)(v1 + 16);
  v16 = *(_QWORD *)(v1 + 24);
  sub_213CCD70C(*(_QWORD *)v1, v14);
  swift_bridgeObjectRetain();
  sub_213CCD70C(v13, v14);
  v17 = sub_213CCD49C(v13, v14);
  sub_213CCD718(v13, v14);
  sub_213CCD718(v13, v14);
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)(v17 + 16);
  v41 = v15;
  if (v18)
  {
    swift_bridgeObjectRetain();
    v19 = sub_213CD0130(v15, v16);
    if ((v20 & 1) != 0)
    {
      v21 = v19;
      v36 = v6;
      v22 = *(_QWORD *)(v17 + 56);
      v23 = type metadata accessor for KeyPathView();
      v37 = a1;
      v24 = *(_QWORD *)(v23 - 8);
      v25 = v22 + *(_QWORD *)(v24 + 72) * v21;
      v6 = v36;
      sub_213CD03F0(v25, (uint64_t)v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v12, 0, 1, v23);
    }
    else
    {
      v23 = type metadata accessor for KeyPathView();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v12, 1, 1, v23);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v23 = type metadata accessor for KeyPathView();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v12, 1, 1, v23);
  }
  swift_bridgeObjectRelease();
  type metadata accessor for KeyPathView();
  v26 = *(_QWORD *)(v23 - 8);
  v27 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48))(v12, 1, v23);
  v28 = sub_213CC3848((uint64_t)v12, &qword_254D35C48);
  if (v27 == 1)
  {
    MEMORY[0x24BDAC7A8](v28);
    sub_213CE3E78(&v44);
    PaymentItem<>.init(icon:primaryLabel:secondaryLabel:chevronStyle:)();
  }
  sub_213CCD70C(v13, v14);
  swift_bridgeObjectRetain();
  sub_213CCD70C(v13, v14);
  v29 = sub_213CCD49C(v13, v14);
  sub_213CCD718(v13, v14);
  sub_213CCD718(v13, v14);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v29 + 16))
  {
    swift_bridgeObjectRetain();
    v30 = sub_213CD0130(v41, v16);
    v31 = v38;
    if ((v32 & 1) != 0)
    {
      sub_213CD03F0(*(_QWORD *)(v29 + 56) + *(_QWORD *)(v26 + 72) * v30, v38);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v26 + 56))(v31, 0, 1, v23);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56))(v38, 1, 1, v23);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v31 = v38;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56))(v38, 1, 1, v23);
  }
  swift_bridgeObjectRelease();
  v33 = v40;
  sub_213CD1BDC(v31, v40);
  sub_213CC3694(v33, (uint64_t)v6, &qword_254D35C48);
  swift_storeEnumTagMultiPayload();
  sub_213CD2070((unint64_t *)&qword_254D35C50, &qword_254D35C48, (uint64_t (*)(void))sub_213CD1B94, MEMORY[0x24BDF5578]);
  sub_213CC0B2C(&qword_254D35C80, &qword_254D35C70, (uint64_t)&protocol conformance descriptor for PaymentItem<A, B, C, D>);
  sub_213CE5E0C();
  return sub_213CC3848(v33, &qword_254D35C48);
}

uint64_t sub_213CD1588@<X0>(uint64_t a1@<X8>)
{
  return sub_213CD19A8(a1);
}

uint64_t static PlaceholderActionItem_Previews.previews.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  uint64_t *v16;
  _OWORD v18[2];
  _QWORD v19[4];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35C88);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = &unk_24D0E6DE0;
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35C90);
  sub_213CC0B2C(&qword_254D35C98, &qword_254D35C90, MEMORY[0x24BEE12D8]);
  sub_213CD1C24();
  sub_213CE61E4();
  KeyPath = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35B38);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35B40);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80);
  v9 = (v8 + 32) & ~v8;
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_213CE7BE0;
  v11 = (_QWORD *)(v10 + v9);
  v12 = v10 + v9 + *(int *)(v7 + 48);
  *v11 = 0x4977656976657270;
  v11[1] = 0xEB000000006D6574;
  v13 = swift_getKeyPath();
  v19[3] = &type metadata for PreviewItem;
  memset(v18, 0, sizeof(v18));
  v14 = sub_213CCCF68();
  KeyPathView.init(path:source:shouldSuspendStateMachine:analyticsTag:)(v13, (uint64_t)v19, v14 & 1, (uint64_t)v18, v12);
  v15 = sub_213CCE16C(v10);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  v16 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D35CA8) + 36));
  *v16 = KeyPath;
  v16[1] = v15;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_213CD17C4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v4 = *a1;
  v3 = a1[1];
  *(_QWORD *)a2 = swift_getKeyPath();
  *(_BYTE *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = v4;
  *(_QWORD *)(a2 + 24) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t PreviewItem.asAnyView.getter()
{
  sub_213CD1C68();
  return sub_213CE619C();
}

uint64_t sub_213CD1828@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  sub_213CD1C68();
  result = sub_213CE619C();
  *a1 = result;
  return result;
}

uint64_t sub_213CD1860()
{
  sub_213CD2100();
  return sub_213CE5B84();
}

uint64_t sub_213CD1898()
{
  sub_213CD2100();
  return sub_213CE5B78();
}

void PreviewItem.body.getter()
{
  char v0;

  sub_213CE3E78(&v0);
  PaymentItem<>.init(icon:primaryLabel:secondaryLabel:chevronStyle:)();
}

uint64_t sub_213CD1984@<X0>(uint64_t a1@<X8>)
{
  return sub_213CD19A8(a1);
}

uint64_t sub_213CD19A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_213CE5D04();
  result = sub_213CE5FBC();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_213CD1A04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_213CE5D04();
  result = sub_213CE5FBC();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4 & 1;
  a1[3] = v5;
  return result;
}

void sub_213CD1A7C()
{
  char v0;

  sub_213CE3E78(&v0);
  PaymentItem<>.init(icon:primaryLabel:secondaryLabel:chevronStyle:)();
}

uint64_t sub_213CD1B30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_213CC1814();
  swift_bridgeObjectRetain();
  result = sub_213CE5FD4();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4 & 1;
  a1[3] = v5;
  return result;
}

unint64_t sub_213CD1B94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D35C58;
  if (!qword_254D35C58)
  {
    v1 = type metadata accessor for KeyPathView();
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for KeyPathView, v1);
    atomic_store(result, (unint64_t *)&qword_254D35C58);
  }
  return result;
}

uint64_t sub_213CD1BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35C48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_213CD1C24()
{
  unint64_t result;

  result = qword_254D35CA0;
  if (!qword_254D35CA0)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for PlaceholderActionItem, &type metadata for PlaceholderActionItem);
    atomic_store(result, (unint64_t *)&qword_254D35CA0);
  }
  return result;
}

unint64_t sub_213CD1C68()
{
  unint64_t result;

  result = qword_254D35CB0;
  if (!qword_254D35CB0)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for PreviewItem, &type metadata for PreviewItem);
    atomic_store(result, (unint64_t *)&qword_254D35CB0);
  }
  return result;
}

uint64_t sub_213CD1CAC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_213CD1CC0()
{
  unint64_t result;

  result = qword_254D35CB8;
  if (!qword_254D35CB8)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for PlaceholderActionItem_Previews, &type metadata for PlaceholderActionItem_Previews);
    atomic_store(result, (unint64_t *)&qword_254D35CB8);
  }
  return result;
}

uint64_t sub_213CD1D04()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213CD1D14()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for PlaceholderActionItem(uint64_t a1)
{
  sub_213CCD718(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PlaceholderActionItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_213CCD70C(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PlaceholderActionItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_213CCD70C(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_213CCD718(v6, v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PlaceholderActionItem(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_213CCD718(v6, v7);
  v8 = a2[3];
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PlaceholderActionItem(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PlaceholderActionItem(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PlaceholderActionItem()
{
  return &type metadata for PlaceholderActionItem;
}

ValueMetadata *type metadata accessor for PlaceholderActionItem_Previews()
{
  return &type metadata for PlaceholderActionItem_Previews;
}

ValueMetadata *type metadata accessor for PreviewItem()
{
  return &type metadata for PreviewItem;
}

unint64_t sub_213CD1F24()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35CC0;
  if (!qword_254D35CC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35CC8);
    v2[0] = sub_213CD2070((unint64_t *)&qword_254D35C50, &qword_254D35C48, (uint64_t (*)(void))sub_213CD1B94, MEMORY[0x24BDF5578]);
    v2[1] = sub_213CC0B2C(&qword_254D35C80, &qword_254D35C70, (uint64_t)&protocol conformance descriptor for PaymentItem<A, B, C, D>);
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35CC0);
  }
  return result;
}

unint64_t sub_213CD1FCC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35CD0;
  if (!qword_254D35CD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35CA8);
    v2[0] = sub_213CD2070(&qword_254D35CD8, &qword_254D35C88, (uint64_t (*)(void))sub_213CD1C24, MEMORY[0x24BDF4A08]);
    v2[1] = sub_213CC0B2C(&qword_254D35C28, &qword_254D35C30, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35CD0);
  }
  return result;
}

uint64_t sub_213CD2070(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x2199C1EA8](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_213CD20D4()
{
  return sub_213CC0B2C(&qword_254D35C80, &qword_254D35C70, (uint64_t)&protocol conformance descriptor for PaymentItem<A, B, C, D>);
}

unint64_t sub_213CD2100()
{
  unint64_t result;

  result = qword_254D35CE0;
  if (!qword_254D35CE0)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for PlaceholderActionItem_Previews, &type metadata for PlaceholderActionItem_Previews);
    atomic_store(result, (unint64_t *)&qword_254D35CE0);
  }
  return result;
}

BOOL static PaymentDetailSheet.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void PaymentDetailSheet.id.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t PaymentDetailSheet.hash(into:)()
{
  return sub_213CE643C();
}

uint64_t PaymentDetailSheet.hashValue.getter()
{
  sub_213CE6430();
  sub_213CE643C();
  return sub_213CE6448();
}

void sub_213CD21D0(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

BOOL PaymentDetailSheet.shouldSuspendStateMachine.getter()
{
  unsigned __int8 *v0;

  return *v0 != 2;
}

unint64_t sub_213CD21F0()
{
  unint64_t result;

  result = qword_254D35CE8;
  if (!qword_254D35CE8)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for PaymentDetailSheet, &type metadata for PaymentDetailSheet);
    atomic_store(result, (unint64_t *)&qword_254D35CE8);
  }
  return result;
}

unint64_t sub_213CD2238()
{
  unint64_t result;

  result = qword_254D35CF0;
  if (!qword_254D35CF0)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for PaymentDetailSheet, &type metadata for PaymentDetailSheet);
    atomic_store(result, (unint64_t *)&qword_254D35CF0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PaymentDetailSheet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF0)
    goto LABEL_17;
  if (a2 + 16 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 16) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 16;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 16;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 16;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x11;
  v8 = v6 - 17;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PaymentDetailSheet(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 16 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 16) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF0)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEF)
    return ((uint64_t (*)(void))((char *)&loc_213CD2358 + 4 * byte_213CE8045[v4]))();
  *a1 = a2 + 16;
  return ((uint64_t (*)(void))((char *)sub_213CD238C + 4 * asc_213CE8040[v4]))();
}

uint64_t sub_213CD238C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213CD2394(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213CD239CLL);
  return result;
}

uint64_t sub_213CD23A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213CD23B0);
  *(_BYTE *)result = a2 + 16;
  return result;
}

uint64_t sub_213CD23B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213CD23BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PaymentDetailSheet()
{
  return &type metadata for PaymentDetailSheet;
}

void sub_213CD23D8(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_213CD2404()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 56))(v0, 1, 6, v1);
}

uint64_t AccessoryView.init(style:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_213CD30E0(a1, a2);
}

void AccessoryView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t (*v5)(_QWORD);
  uint64_t v6;
  char *v7;
  _BYTE v8[96];

  v1 = type metadata accessor for AccessoryViewStyle(0);
  v2 = MEMORY[0x24BDAC7A8](v1);
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v8[-v3];
  sub_213CD4218(v0, (uint64_t)&v8[-v3], v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  v7 = (char *)sub_213CD257C
     + 4
     * byte_213CE8154[(*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v4, 6, v6)];
  __asm { BR              X10 }
}

__n128 sub_213CD257C()
{
  __n128 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  unsigned int v6;
  char v7;
  uint64_t v8;
  char v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  BOOL v13;
  __n128 result;
  int v15;
  unsigned __int8 v16;

  sub_213CD4218(v2, v1, type metadata accessor for AccessoryViewStyle);
  v6 = v4(v1, 6, v3) - 2;
  if (v6 >= 3)
  {
    sub_213CD425C(v1, type metadata accessor for AccessoryViewStyle);
    v7 = 0;
  }
  else
  {
    v7 = v6 + 1;
  }
  *(_BYTE *)(v5 - 128) = v7;
  ChevronView.init(style:)((char *)(v5 - 128), v5 - 96);
  v8 = *(_QWORD *)(v5 - 88);
  v9 = *(_BYTE *)(v5 - 80);
  *(_QWORD *)(v5 - 96) = *(unsigned __int8 *)(v5 - 96);
  *(_QWORD *)(v5 - 88) = v8;
  *(_BYTE *)(v5 - 80) = v9;
  *(_BYTE *)(v5 - 79) = 1;
  sub_213CC5008(v8, v9);
  sub_213CD3258();
  sub_213CE5E0C();
  v10 = *(unsigned __int8 *)(v5 - 112);
  if (*(_BYTE *)(v5 - 111))
    v11 = 256;
  else
    v11 = 0;
  *(_OWORD *)(v5 - 96) = *(_OWORD *)(v5 - 128);
  *(_WORD *)(v5 - 80) = v11 | v10;
  *(_BYTE *)(v5 - 78) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35D18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35D28);
  sub_213CD3190();
  sub_213CD31EC();
  sub_213CE5E0C();
  v12 = *(_WORD *)(v5 - 144);
  v13 = *(_BYTE *)(v5 - 142) != 0;
  *(_OWORD *)(v5 - 128) = *(_OWORD *)(v5 - 160);
  *(_WORD *)(v5 - 112) = v12;
  *(_BYTE *)(v5 - 110) = v13;
  *(_BYTE *)(v5 - 109) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35D00);
  sub_213CD3124();
  sub_213CE5E0C();
  sub_213CC5044(v8, v9);
  result = *(__n128 *)(v5 - 96);
  v15 = *(unsigned __int16 *)(v5 - 80) | (*(unsigned __int8 *)(v5 - 78) << 16);
  v16 = *(_BYTE *)(v5 - 77);
  *v0 = result;
  v0[1].n128_u16[0] = v15;
  v0[1].n128_u8[2] = BYTE2(v15);
  v0[1].n128_u8[3] = v16;
  return result;
}

uint64_t sub_213CD29C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
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
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int *v29;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;

  v2 = type metadata accessor for AccessoryView(0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v34 = (uint64_t)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v33 = (uint64_t)&v31 - v6;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v31 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v31 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v31 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v31 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v31 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v31 - v22;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56);
  v25(v23, 3, 6, v24);
  v25(v21, 4, 6, v24);
  v25(v18, 2, 6, v24);
  v25(v15, 1, 6, v24);
  v26 = (uint64_t)v12;
  v32 = v12;
  sub_213CD4218((uint64_t)v23, (uint64_t)v12, type metadata accessor for AccessoryView);
  v31 = v9;
  sub_213CD4218((uint64_t)v21, (uint64_t)v9, type metadata accessor for AccessoryView);
  v27 = v33;
  sub_213CD4218((uint64_t)v18, v33, type metadata accessor for AccessoryView);
  v28 = v34;
  sub_213CD4218((uint64_t)v15, v34, type metadata accessor for AccessoryView);
  sub_213CD4218(v26, a1, type metadata accessor for AccessoryView);
  v29 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254D35E60);
  sub_213CD4218((uint64_t)v9, a1 + v29[12], type metadata accessor for AccessoryView);
  sub_213CD4218(v27, a1 + v29[16], type metadata accessor for AccessoryView);
  sub_213CD4218(v28, a1 + v29[20], type metadata accessor for AccessoryView);
  sub_213CD425C((uint64_t)v15, type metadata accessor for AccessoryView);
  sub_213CD425C((uint64_t)v18, type metadata accessor for AccessoryView);
  sub_213CD425C((uint64_t)v21, type metadata accessor for AccessoryView);
  sub_213CD425C((uint64_t)v23, type metadata accessor for AccessoryView);
  sub_213CD425C(v28, type metadata accessor for AccessoryView);
  sub_213CD425C(v27, type metadata accessor for AccessoryView);
  sub_213CD425C((uint64_t)v31, type metadata accessor for AccessoryView);
  return sub_213CD425C((uint64_t)v32, type metadata accessor for AccessoryView);
}

uint64_t sub_213CD2C90@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  *(_QWORD *)a1 = sub_213CE5D40();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35D38);
  return sub_213CD29C8(a1 + *(int *)(v2 + 44));
}

uint64_t sub_213CD2CD4()
{
  sub_213CD41D4();
  return sub_213CE5B84();
}

uint64_t sub_213CD2D0C()
{
  sub_213CD41D4();
  return sub_213CE5B78();
}

void _s13PaymentUIBase18AccessoryViewStyleO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
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

  v4 = sub_213CE5F8C();
  v5 = MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v5);
  v6 = type metadata accessor for AccessoryViewStyle(0);
  MEMORY[0x24BDAC7A8](v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35E68);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_213CD4218(a1, (uint64_t)v10, type metadata accessor for AccessoryViewStyle);
  sub_213CD4218(a2, v11, type metadata accessor for AccessoryViewStyle);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  v13 = (char *)sub_213CD2EA0
      + 4
      * byte_213CE815B[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v10, 6, v12)];
  __asm { BR              X10 }
}

uint64_t sub_213CD2EA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  _QWORD *v6;
  unsigned int (*v7)(uint64_t *, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char v13;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v18)(uint64_t, char *, uint64_t);
  char v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t, uint64_t);

  sub_213CD4218(v0, (uint64_t)v6, type metadata accessor for AccessoryViewStyle);
  v10 = v6[1];
  *(_QWORD *)(v9 - 96) = *v6;
  *(_QWORD *)(v9 - 88) = v10;
  v11 = *(int *)(v5 + 48);
  v12 = (char *)v6 + v11;
  if (!v7(v4, 6, v5))
  {
    v16 = *v4;
    v15 = v4[1];
    v17 = (char *)v4 + v11;
    v18 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
    v18(v2, v12, v1);
    v18(v3, v17, v1);
    if (*(_QWORD *)(v9 - 96) == v16 && *(_QWORD *)(v9 - 88) == v15)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v20 = sub_213CE6418();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0)
      {
        v21 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
        v21(v3, v1);
        v21(v2, v1);
        sub_213CD425C(v0, type metadata accessor for AccessoryViewStyle);
        goto LABEL_3;
      }
    }
    v13 = MEMORY[0x2199C15E4](v2, v3);
    v22 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v22(v3, v1);
    v22(v2, v1);
    sub_213CD425C(v0, type metadata accessor for AccessoryViewStyle);
    return v13 & 1;
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v1);
  swift_bridgeObjectRelease();
  sub_213CC3848(v0, &qword_254D35E68);
LABEL_3:
  v13 = 0;
  return v13 & 1;
}

uint64_t type metadata accessor for AccessoryViewStyle(uint64_t a1)
{
  return sub_213CD4068(a1, (uint64_t *)&unk_254D37330);
}

uint64_t sub_213CD30E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AccessoryViewStyle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_213CD3124()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35D08;
  if (!qword_254D35D08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35D00);
    v2[0] = sub_213CD3190();
    v2[1] = sub_213CD31EC();
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35D08);
  }
  return result;
}

unint64_t sub_213CD3190()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35D10;
  if (!qword_254D35D10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35D18);
    v2[0] = MEMORY[0x24BDF5138];
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35D10);
  }
  return result;
}

unint64_t sub_213CD31EC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_254D35D20;
  if (!qword_254D35D20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35D28);
    v2 = sub_213CD3258();
    v3[0] = MEMORY[0x24BDF5138];
    v3[1] = v2;
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254D35D20);
  }
  return result;
}

unint64_t sub_213CD3258()
{
  unint64_t result;

  result = qword_254D35D30;
  if (!qword_254D35D30)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for ChevronView, &type metadata for ChevronView);
    atomic_store(result, (unint64_t *)&qword_254D35D30);
  }
  return result;
}

uint64_t sub_213CD329C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_213CD32B0()
{
  unint64_t result;

  result = qword_254D35D40;
  if (!qword_254D35D40)
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE8224, &type metadata for AccessoryView_Previews);
    atomic_store(result, (unint64_t *)&qword_254D35D40);
  }
  return result;
}

uint64_t sub_213CD32F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for AccessoryViewStyle(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 6, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      v11 = *(int *)(v7 + 48);
      v12 = (char *)a1 + v11;
      v13 = (char *)a2 + v11;
      v14 = sub_213CE5F8C();
      v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
      swift_bridgeObjectRetain();
      v15(v12, v13, v14);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 6, v7);
    }
  }
  return a1;
}

uint64_t destroy for AccessoryViewStyle(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 6, v2);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    v4 = a1 + *(int *)(v2 + 48);
    v5 = sub_213CE5F8C();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  return result;
}

_QWORD *initializeWithCopy for AccessoryViewStyle(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 6, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    v9 = *(int *)(v6 + 48);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_213CE5F8C();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 6, v6);
  }
  return a1;
}

_QWORD *assignWithCopy for AccessoryViewStyle(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 6, v6);
  v10 = v8(a2, 6, v6);
  if (!v9)
  {
    if (!v10)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v17 = *(int *)(v6 + 48);
      v18 = (char *)a1 + v17;
      v19 = (char *)a2 + v17;
      v20 = sub_213CE5F8C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 24))(v18, v19, v20);
      return a1;
    }
    sub_213CC3848((uint64_t)a1, &qword_254D35CF8);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  v11 = *(int *)(v6 + 48);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_213CE5F8C();
  v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 6, v6);
  return a1;
}

_OWORD *initializeWithTake for AccessoryViewStyle(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 6, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v8 = *(int *)(v6 + 48);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_213CE5F8C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 6, v6);
  }
  return a1;
}

_QWORD *assignWithTake for AccessoryViewStyle(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 6, v6);
  v10 = v8(a2, 6, v6);
  if (!v9)
  {
    if (!v10)
    {
      v16 = a2[1];
      *a1 = *a2;
      a1[1] = v16;
      swift_bridgeObjectRelease();
      v17 = *(int *)(v6 + 48);
      v18 = (char *)a1 + v17;
      v19 = (char *)a2 + v17;
      v20 = sub_213CE5F8C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
      return a1;
    }
    sub_213CC3848((uint64_t)a1, &qword_254D35CF8);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v11 = *(int *)(v6 + 48);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_213CE5F8C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 6, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AccessoryViewStyle()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_213CD38CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 7)
    return v5 - 6;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AccessoryViewStyle()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_213CD3928(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 6);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_213CD3980(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 6, v2);
}

uint64_t sub_213CD39BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 6, v4);
}

uint64_t sub_213CD3A00()
{
  uint64_t result;
  unint64_t v1;

  result = sub_213CE5F8C();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AccessoryView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);

  v4 = *(_QWORD *)(type metadata accessor for AccessoryViewStyle(0) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v7 + 48))(a2, 6, v6))
    {
      memcpy(a1, a2, *(_QWORD *)(v4 + 64));
    }
    else
    {
      v9 = a2[1];
      *a1 = *a2;
      a1[1] = v9;
      v10 = *(int *)(v6 + 48);
      v11 = (char *)a1 + v10;
      v12 = (char *)a2 + v10;
      v13 = sub_213CE5F8C();
      v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
      swift_bridgeObjectRetain();
      v14(v11, v12, v13);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 6, v6);
    }
  }
  return a1;
}

_QWORD *initializeWithCopy for AccessoryView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v5 + 48))(a2, 6, v4))
  {
    v6 = type metadata accessor for AccessoryViewStyle(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(v4 + 48);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_213CE5F8C();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 6, v4);
  }
  return a1;
}

_QWORD *assignWithCopy for AccessoryView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 6, v4);
  v8 = v6(a2, 6, v4);
  if (!v7)
  {
    if (!v8)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v16 = *(int *)(v4 + 48);
      v17 = (char *)a1 + v16;
      v18 = (char *)a2 + v16;
      v19 = sub_213CE5F8C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
      return a1;
    }
    sub_213CC3848((uint64_t)a1, &qword_254D35CF8);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v14 = type metadata accessor for AccessoryViewStyle(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  v9 = *(int *)(v4 + 48);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_213CE5F8C();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 6, v4);
  return a1;
}

_OWORD *initializeWithTake for AccessoryView(_OWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  v5 = *(_QWORD *)(v4 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v5 + 48))(a2, 6, v4))
  {
    v6 = type metadata accessor for AccessoryViewStyle(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v7 = *(int *)(v4 + 48);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_213CE5F8C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 6, v4);
  }
  return a1;
}

_QWORD *assignWithTake for AccessoryView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 6, v4);
  v8 = v6(a2, 6, v4);
  if (!v7)
  {
    if (!v8)
    {
      v15 = a2[1];
      *a1 = *a2;
      a1[1] = v15;
      swift_bridgeObjectRelease();
      v16 = *(int *)(v4 + 48);
      v17 = (char *)a1 + v16;
      v18 = (char *)a2 + v16;
      v19 = sub_213CE5F8C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
      return a1;
    }
    sub_213CC3848((uint64_t)a1, &qword_254D35CF8);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v13 = type metadata accessor for AccessoryViewStyle(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    return a1;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v9 = *(int *)(v4 + 48);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_213CE5F8C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 6, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for AccessoryView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_213CD3FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AccessoryViewStyle(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AccessoryView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_213CD4014(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AccessoryViewStyle(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AccessoryView(uint64_t a1)
{
  return sub_213CD4068(a1, (uint64_t *)&unk_254D37340);
}

uint64_t sub_213CD4068(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_213CD409C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for AccessoryViewStyle(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessoryView_Previews()
{
  return &type metadata for AccessoryView_Previews;
}

unint64_t sub_213CD4118()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35E38;
  if (!qword_254D35E38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35E40);
    v2[0] = sub_213CD3124();
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35E38);
  }
  return result;
}

unint64_t sub_213CD4188()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D35E48;
  if (!qword_254D35E48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35E50);
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_254D35E48);
  }
  return result;
}

unint64_t sub_213CD41D4()
{
  unint64_t result;

  result = qword_254D35E58;
  if (!qword_254D35E58)
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE81DC, &type metadata for AccessoryView_Previews);
    atomic_store(result, (unint64_t *)&qword_254D35E58);
  }
  return result;
}

uint64_t sub_213CD4218(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_213CD425C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_213CD4298()
{
  uint64_t result;

  result = sub_213CE5F2C();
  qword_254D37358 = result;
  return result;
}

uint64_t *sub_213CD42B4()
{
  if (qword_254D37350 != -1)
    swift_once();
  return &qword_254D37358;
}

uint64_t static Font.paymentItemSecondary.getter()
{
  return sub_213CBBCF8(&qword_254D37350);
}

uint64_t sub_213CD4310()
{
  uint64_t result;

  result = sub_213CE5F2C();
  qword_254D37368 = result;
  return result;
}

uint64_t static Font.paymentItemSecondaryError.getter()
{
  return sub_213CBBCF8(&qword_254D37360);
}

uint64_t sub_213CD4348()
{
  uint64_t result;

  result = sub_213CE5F2C();
  qword_254D37378 = result;
  return result;
}

uint64_t static Font.chinItemSecondary.getter()
{
  return sub_213CBBCF8(&qword_254D37370);
}

uint64_t sub_213CD4380()
{
  uint64_t result;

  result = sub_213CE5F2C();
  qword_254D37388 = result;
  return result;
}

uint64_t static Font.detailSheetRowSecondary.getter()
{
  return sub_213CBBCF8(&qword_254D37380);
}

uint64_t sub_213CD43B8()
{
  uint64_t v0;
  uint64_t result;

  sub_213CE5F38();
  sub_213CE5F50();
  v0 = sub_213CE5F74();
  result = swift_release();
  qword_254D37398 = v0;
  return result;
}

uint64_t static Font.detailSheetRowAccessory.getter()
{
  return sub_213CBBCF8(&qword_254D37390);
}

BOOL static CheckmarkStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CheckmarkStyle.hash(into:)()
{
  return sub_213CE643C();
}

uint64_t CheckmarkStyle.hashValue.getter()
{
  sub_213CE6430();
  sub_213CE643C();
  return sub_213CE6448();
}

void MenuContainerView.init(limitWidth:selection:icon:content:)()
{
  type metadata accessor for MenuContainerView();
}

uint64_t sub_213CD44F4(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t (*v2)(void);
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v8 = v4 + *(int *)(a1 + 60);
  *(_QWORD *)v8 = v6;
  *(_BYTE *)(v8 + 8) = (v3 & 1) == 0;
  v9 = v2();
  result = v1(v9);
  *(_BYTE *)(v4 + *(int *)(a1 + 56)) = v5;
  return result;
}

void type metadata accessor for MenuContainerView()
{
  JUMPOUT(0x2199C1E0CLL);
}

uint64_t MenuContainerView.body.getter@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  void (*v27)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];

  v46 = a2;
  v3 = sub_213CE5E48();
  v44 = *(_QWORD *)(v3 - 8);
  v45 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v43 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35E70);
  v5 = a1[2];
  v35 = a1[3];
  v40 = v5;
  v38 = a1;
  v6 = sub_213CE5B60();
  v37 = a1[4];
  v55[0] = v37;
  v55[1] = MEMORY[0x24BDEBEE0];
  v7 = MEMORY[0x24BDED308];
  MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v6, v55);
  sub_213CE6190();
  swift_getTupleTypeMetadata3();
  v34 = sub_213CE6214();
  v33 = MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v34);
  v8 = sub_213CE6178();
  v36 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v29 - v9;
  v11 = sub_213CE5B60();
  v39 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v29 - v12;
  v14 = sub_213CE5B60();
  v41 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v29 - v15;
  v54[0] = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4498], v8);
  v54[1] = MEMORY[0x24BDECC60];
  v30 = MEMORY[0x2199C1EA8](v7, v11, v54);
  v53[0] = v30;
  v53[1] = MEMORY[0x24BDEDBB8];
  v31 = MEMORY[0x2199C1EA8](v7, v14, v53);
  v52[0] = v14;
  v52[1] = v31;
  v17 = MEMORY[0x2199C1E48](0, v52, MEMORY[0x24BDF2F10], 0);
  v32 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v29 - v21;
  v47 = v40;
  v48 = v35;
  v23 = v38[5];
  v49 = v37;
  v50 = v23;
  v51 = v42;
  sub_213CE5CF8();
  sub_213CE616C();
  sub_213CE5EF0();
  sub_213CE607C();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v10, v8);
  sub_213CE6208();
  sub_213CE6064();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v11);
  v24 = v43;
  sub_213CE5E3C();
  sub_213CE6028();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v24, v45);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v16, v14);
  v25 = v32;
  v26 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
  v26(v22, v20, v17);
  v27 = *(void (**)(char *, uint64_t))(v25 + 8);
  v27(v20, v17);
  v26(v46, v22, v17);
  return ((uint64_t (*)(char *, uint64_t))v27)(v22, v17);
}

void sub_213CD49F0(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
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
  _QWORD v18[4];
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[3];

  v26 = a4;
  v24 = a5;
  v22 = sub_213CE5B60();
  v31[0] = a3;
  v31[1] = MEMORY[0x24BDEBEE0];
  v21 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v22, v31);
  v8 = sub_213CE6190();
  v23 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v18[3] = (char *)v18 - v11;
  v18[2] = *(_QWORD *)(a2 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v20 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v18[1] = (char *)v18 - v14;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35E70);
  v15 = MEMORY[0x24BDAC7A8](v19);
  v25 = (char *)v18 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18[0] = (char *)v18 - v17;
  v27 = a1;
  v28 = a2;
  v29 = a3;
  v30 = v26;
  type metadata accessor for MenuContainerView();
}

uint64_t sub_213CD4BCC(uint64_t a1)
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
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);

  sub_213CD4D98(a1, v8);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v12(v4, v2, v1);
  sub_213CE5D4C();
  *(_QWORD *)(v11 - 224) = v7;
  *(_QWORD *)(v11 - 216) = v1;
  *(_QWORD *)(v11 - 208) = v3;
  *(_QWORD *)(v11 - 200) = v9;
  *(_QWORD *)(v11 - 192) = v2;
  sub_213CE6184();
  *(_QWORD *)(v11 - 280) = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4700], v5);
  v13 = *(_QWORD *)(v11 - 272);
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  v15 = *(_QWORD *)(v11 - 312);
  v14(v15, v6, v5);
  v16 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  v16(v6, v5);
  v17 = *(_QWORD *)(v11 - 336);
  v18 = *(_QWORD *)(v11 - 256);
  sub_213CC3694(v17, v18, &qword_254D35E70);
  *(_QWORD *)(v11 - 136) = v18;
  v19 = *(_QWORD *)(v11 - 296);
  v20 = *(_QWORD *)(v11 - 328);
  v12(v19, v20, v1);
  *(_QWORD *)(v11 - 128) = v19;
  v14(v6, v15, v5);
  *(_QWORD *)(v11 - 120) = v6;
  *(_QWORD *)(v11 - 160) = *(_QWORD *)(v11 - 304);
  *(_QWORD *)(v11 - 152) = v1;
  *(_QWORD *)(v11 - 144) = v5;
  v21 = sub_213CD5CFC();
  v22 = *(_QWORD *)(v11 - 248);
  *(_QWORD *)(v11 - 184) = v21;
  *(_QWORD *)(v11 - 176) = v22;
  *(_QWORD *)(v11 - 168) = *(_QWORD *)(v11 - 280);
  sub_213CC121C((uint64_t *)(v11 - 136), 3uLL, v11 - 160);
  v16(v15, v5);
  v23 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 320) + 8);
  v23(v20, v1);
  sub_213CC3848(v17, &qword_254D35E70);
  v16(v6, v5);
  v23(v19, v1);
  return sub_213CC3848(*(_QWORD *)(v11 - 256), &qword_254D35E70);
}

uint64_t sub_213CD4D8C()
{
  return sub_213CD5CE8((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_213CD49F0);
}

uint64_t sub_213CD4D98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t KeyPath;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
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

  v5 = sub_213CE5D28();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35EA0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35E90);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v19 = (char *)&v33 - v18;
  v20 = *(int *)(a1 + 56);
  if (!*(_BYTE *)(v2 + v20))
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 56))(a2, 1, 1);
  v38 = v16;
  v39 = v17;
  v21 = sub_213CE610C();
  v35 = v5;
  v22 = v21;
  sub_213CE5F38();
  v34 = v6;
  sub_213CE5F50();
  v23 = sub_213CE5F74();
  v37 = a2;
  v24 = v23;
  swift_release();
  KeyPath = swift_getKeyPath();
  v26 = sub_213CE60B8();
  v36 = v2;
  v27 = v26;
  v28 = swift_getKeyPath();
  v40 = v22;
  v41 = KeyPath;
  v42 = v24;
  v43 = v28;
  v44 = v27;
  sub_213CE5D1C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35A90);
  sub_213CCA324();
  sub_213CE6034();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v8, v35);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (*(_BYTE *)(v36 + v20) == 2)
    v29 = 1.0;
  else
    v29 = 0.0;
  sub_213CC3694((uint64_t)v11, (uint64_t)v15, &qword_254D35EA0);
  v30 = v38;
  *(double *)&v15[*(int *)(v38 + 36)] = v29;
  sub_213CC3848((uint64_t)v11, &qword_254D35EA0);
  sub_213CD5E38((uint64_t)v15, (uint64_t)v19);
  v31 = v37;
  sub_213CD5E38((uint64_t)v19, v37);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v39 + 56))(v31, 0, 1, v30);
}

void sub_213CD5060()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_213CE5B60();
  v1 = MEMORY[0x24BDAC7A8](v0);
  MEMORY[0x24BDAC7A8](v1);
  type metadata accessor for MenuContainerView();
}

uint64_t sub_213CD5108()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  void (*v8)(uint64_t, uint64_t);

  sub_213CE61FC();
  sub_213CE6058();
  v6 = MEMORY[0x24BDEBEE0];
  *(_QWORD *)(v5 - 128) = v3;
  *(_QWORD *)(v5 - 120) = v6;
  MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v5 - 128);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 16);
  v7(v2, v4, v1);
  v8 = *(void (**)(uint64_t, uint64_t))(v0 + 8);
  v8(v4, v1);
  v7(*(_QWORD *)(v5 - 136), v2, v1);
  return ((uint64_t (*)(uint64_t, uint64_t))v8)(v2, v1);
}

void MenuContainerView<>.init(limitWidth:selection:content:)(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  type metadata accessor for MenuContainerView();
}

uint64_t sub_213CD5228(uint64_t result)
{
  char v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v2 + *(int *)(result + 56)) = v3;
  v4 = 0x4069000000000000;
  if ((v1 & 1) == 0)
    v4 = 0;
  v5 = v2 + *(int *)(result + 60);
  *(_QWORD *)v5 = v4;
  *(_BYTE *)(v5 + 8) = (v1 & 1) == 0;
  return result;
}

unint64_t sub_213CD5270()
{
  unint64_t result;

  result = qword_254D35E78;
  if (!qword_254D35E78)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for CheckmarkStyle, &type metadata for CheckmarkStyle);
    atomic_store(result, (unint64_t *)&qword_254D35E78);
  }
  return result;
}

uint64_t sub_213CD52B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t storeEnumTagSinglePayload for CheckmarkStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_213CD5334 + 4 * byte_213CE82E5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_213CD5368 + 4 * asc_213CE82E0[v4]))();
}

uint64_t sub_213CD5368(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213CD5370(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213CD5378);
  return result;
}

uint64_t sub_213CD5384(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213CD538CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_213CD5390(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213CD5398(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CheckmarkStyle()
{
  return &type metadata for CheckmarkStyle;
}

uint64_t sub_213CD53B4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_213CD53BC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_213CD545C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = *(_QWORD *)(v7 + 64);
  v11 = v8 | *(_DWORD *)(v6 + 80) & 0xF8;
  if (v11 > 7
    || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) != 0
    || (((v9 & ~v8) + v10) & 0xFFFFFFFFFFFFFFF8) + 17 > 0x18)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + (((v11 | 7) + 16) & ~(unint64_t)(v11 | 7)));
    swift_retain();
  }
  else
  {
    v15 = ~v8;
    (*(void (**)(uint64_t *, uint64_t *))(v6 + 16))(a1, a2);
    v16 = ((unint64_t)v4 + v9) & v15;
    v17 = ((unint64_t)a2 + v9) & v15;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(v16, v17, v5);
    *(_BYTE *)(v16 + v10) = *(_BYTE *)(v17 + v10);
    v18 = (v16 + v10) & 0xFFFFFFFFFFFFFFF8;
    v19 = (v17 + v10) & 0xFFFFFFFFFFFFFFF8;
    v20 = *(_QWORD *)(v19 + 8);
    *(_BYTE *)(v18 + 16) = *(_BYTE *)(v19 + 16);
    *(_QWORD *)(v18 + 8) = v20;
  }
  return v4;
}

uint64_t sub_213CD5574(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 24) - 8);
  (*(void (**)(void))(v4 + 8))();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((*(_QWORD *)(v4 + 64) + a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

uint64_t sub_213CD55CC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  char v16;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v11, v12);
  v13 = *(_QWORD *)(v8 + 64);
  v14 = v11 + v13;
  v15 = v12 + v13;
  *(_BYTE *)v14 = *(_BYTE *)v15;
  v14 &= 0xFFFFFFFFFFFFFFF8;
  v15 &= 0xFFFFFFFFFFFFFFF8;
  v16 = *(_BYTE *)(v15 + 16);
  *(_QWORD *)(v14 + 8) = *(_QWORD *)(v15 + 8);
  *(_BYTE *)(v14 + 16) = v16;
  return a1;
}

uint64_t sub_213CD566C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  char v16;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v11, v12);
  v13 = *(_QWORD *)(v8 + 64);
  v14 = v11 + v13;
  v15 = v12 + v13;
  *(_BYTE *)v14 = *(_BYTE *)v15;
  v14 &= 0xFFFFFFFFFFFFFFF8;
  v15 &= 0xFFFFFFFFFFFFFFF8;
  v16 = *(_BYTE *)(v15 + 16);
  *(_QWORD *)(v14 + 8) = *(_QWORD *)(v15 + 8);
  *(_BYTE *)(v14 + 16) = v16;
  return a1;
}

uint64_t sub_213CD570C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  char v16;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v11, v12);
  v13 = *(_QWORD *)(v8 + 64);
  v14 = v11 + v13;
  v15 = v12 + v13;
  *(_BYTE *)v14 = *(_BYTE *)v15;
  v14 &= 0xFFFFFFFFFFFFFFF8;
  v15 &= 0xFFFFFFFFFFFFFFF8;
  v16 = *(_BYTE *)(v15 + 16);
  *(_QWORD *)(v14 + 8) = *(_QWORD *)(v15 + 8);
  *(_BYTE *)(v14 + 16) = v16;
  return a1;
}

uint64_t sub_213CD57AC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  char v16;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v11, v12);
  v13 = *(_QWORD *)(v8 + 64);
  v14 = v11 + v13;
  v15 = v12 + v13;
  *(_BYTE *)v14 = *(_BYTE *)v15;
  v14 &= 0xFFFFFFFFFFFFFFF8;
  v15 &= 0xFFFFFFFFFFFFFFF8;
  v16 = *(_BYTE *)(v15 + 16);
  *(_QWORD *)(v14 + 8) = *(_QWORD *)(v15 + 8);
  *(_BYTE *)(v14 + 16) = v16;
  return a1;
}

uint64_t sub_213CD584C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v19;
  unsigned int v20;

  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 84);
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8 <= v6)
    v9 = *(_DWORD *)(v5 + 84);
  else
    v9 = *(_DWORD *)(v7 + 84);
  if (v9 <= 0xFD)
    v9 = 253;
  if (!a2)
    return 0;
  v10 = *(unsigned __int8 *)(v7 + 80);
  v11 = *(_QWORD *)(v5 + 64) + v10;
  v12 = *(_QWORD *)(v7 + 64);
  if (v9 >= a2)
  {
    if (v6 == v9)
    {
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v5 + 48))(a1, *(unsigned int *)(v5 + 84), v4);
    }
    else
    {
      v19 = (v11 + a1) & ~v10;
      if (v8 == v9)
      {
        return (*(uint64_t (**)(uint64_t))(v7 + 48))(v19);
      }
      else
      {
        v20 = *(unsigned __int8 *)(v19 + v12);
        if (v20 >= 3)
          return v20 - 2;
        else
          return 0;
      }
    }
  }
  else
  {
    v13 = (((v11 & ~(_DWORD)v10) + v12) & 0xFFFFFFF8) + 17;
    v14 = (a2 - v9 + 255) >> (8 * v13);
    if (v13 < 4)
      v15 = v14 + 1;
    else
      v15 = 2;
    if (v15 >= 0x10000)
      v16 = 4;
    else
      v16 = 2;
    if (v15 < 0x100)
      v16 = 1;
    if (v15 >= 2)
      v17 = v16;
    else
      v17 = 0;
    return ((uint64_t (*)(void))((char *)&loc_213CD58F4 + 4 * byte_213CE82EA[v17]))();
  }
}

void sub_213CD5998(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0xFD)
    v7 = 253;
  v8 = ((((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
       + *(_QWORD *)(v6 + 64)) & 0xFFFFFFFFFFFFFFF8)
     + 17;
  if (v7 >= a3)
  {
    v11 = 0;
    if (v7 >= a2)
      goto LABEL_19;
  }
  else
  {
    if (v8 <= 3)
      v9 = ((a3 - v7 + 255) >> (8 * v8)) + 1;
    else
      v9 = 2;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    if (v7 >= a2)
LABEL_19:
      __asm { BR              X0 }
  }
  if (v8 >= 4)
    v12 = ~v7 + a2;
  else
    v12 = (~(_BYTE)v7 + a2);
  bzero(a1, v8);
  if ((_DWORD)v8 == 1)
    *a1 = v12;
  else
    *(_DWORD *)a1 = v12;
  __asm { BR              X10 }
}

void sub_213CD5AD8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x213CD5B50);
}

void sub_213CD5AE0(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x213CD5AE8);
  JUMPOUT(0x213CD5B50);
}

void sub_213CD5B2C()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x213CD5B50);
}

void sub_213CD5B34()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x213CD5B50);
}

uint64_t sub_213CD5B3C(uint64_t a1, int a2, int a3)
{
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_WORD *)(v12 + v13) = 0;
  if (!a2)
    JUMPOUT(0x213CD5B50);
  if (v6 == v10)
  {
    v3 = *(uint64_t (**)(uint64_t))(v9 + 56);
    v4 = v12;
  }
  else
  {
    v4 = (v11 + v12) & v7;
    if (a3 != v10)
      JUMPOUT(0x213CD5B48);
    v3 = *(uint64_t (**)(uint64_t))(v8 + 56);
  }
  return v3(v4);
}

uint64_t sub_213CD5B68(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];

  v1 = *(_QWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35E70);
  v2 = sub_213CE5B60();
  v11[0] = v1;
  v11[1] = MEMORY[0x24BDEBEE0];
  v3 = MEMORY[0x24BDED308];
  MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v2, v11);
  sub_213CE6190();
  swift_getTupleTypeMetadata3();
  v4 = sub_213CE6214();
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v4);
  v5 = sub_213CE6178();
  v6 = sub_213CE5B60();
  v7 = sub_213CE5B60();
  v10[0] = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4498], v5);
  v10[1] = MEMORY[0x24BDECC60];
  v9[0] = MEMORY[0x2199C1EA8](v3, v6, v10);
  v9[1] = MEMORY[0x24BDEDBB8];
  MEMORY[0x2199C1EA8](v3, v7, v9);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213CD5CDC()
{
  return sub_213CD5CE8((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_213CD5060);
}

uint64_t sub_213CD5CE8(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[6], v1[2], v1[3], v1[4], v1[5]);
}

unint64_t sub_213CD5CFC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_254D35E80;
  if (!qword_254D35E80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35E70);
    v2 = sub_213CD5D60();
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254D35E80);
  }
  return result;
}

unint64_t sub_213CD5D60()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35E88;
  if (!qword_254D35E88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35E90);
    v2[0] = sub_213CD5DCC();
    v2[1] = MEMORY[0x24BDECC38];
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35E88);
  }
  return result;
}

unint64_t sub_213CD5DCC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35E98;
  if (!qword_254D35E98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35EA0);
    v2[0] = sub_213CCA324();
    v2[1] = sub_213CC17CC();
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35E98);
  }
  return result;
}

uint64_t sub_213CD5E38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35E90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t BaseAuthenticatorModel.ExternalPasswordEntry.id.getter()
{
  return 0x4449656C707061;
}

BOOL static BaseAuthenticatorModel.ExternalPasswordEntry.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v4 = *a2;
  v5 = v2;
  return static AppleIDSignInView.== infix(_:_:)(&v5, &v4);
}

uint64_t sub_213CD5ECC()
{
  return MEMORY[0x24BEE0D10];
}

void sub_213CD5ED8(_QWORD *a1@<X8>)
{
  *a1 = 0x4449656C707061;
  a1[1] = 0xE700000000000000;
}

BOOL sub_213CD5EF4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v4 = *a2;
  v5 = v2;
  return static AppleIDSignInView.== infix(_:_:)(&v5, &v4);
}

void **_s21ExternalPasswordEntryOwCP(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void _s21ExternalPasswordEntryOwxx(id *a1)
{

}

void **_s21ExternalPasswordEntryOwca(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a2;
  v4 = *a1;
  *a1 = *a2;
  v5 = v3;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **_s21ExternalPasswordEntryOwta(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t _s21ExternalPasswordEntryOwet(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 8))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s21ExternalPasswordEntryOwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 8) = 1;
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
    *(_BYTE *)(result + 8) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BaseAuthenticatorModel.ExternalPasswordEntry()
{
  return &type metadata for BaseAuthenticatorModel.ExternalPasswordEntry;
}

uint64_t PaymentItemBackground.body.getter@<X0>(uint64_t *a1@<X8>)
{
  *a1 = *sub_213CBC014();
  return swift_retain();
}

uint64_t sub_213CD6090@<X0>(uint64_t *a1@<X8>)
{
  *a1 = *sub_213CBC014();
  return swift_retain();
}

uint64_t sub_213CD60B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v4 = *sub_213CBC014();
  swift_retain();
  v5 = sub_213CE5EF0();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35EA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a2, a1, v6);
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35EB0);
  v8 = a2 + *(int *)(result + 36);
  *(_QWORD *)v8 = v4;
  *(_BYTE *)(v8 + 8) = v5;
  return result;
}

uint64_t sub_213CD6138@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  void (*v40)(char *, uint64_t);
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[3];

  v58 = a1;
  v61 = a3;
  MEMORY[0x2199C1EA8](&unk_213CE85F0);
  v4 = sub_213CE5E24();
  v5 = sub_213CE5B60();
  v54 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v56 = (char *)&v52 - v9;
  v10 = *(_QWORD *)(a2 + 16);
  v52 = *(_QWORD *)(a2 + 24);
  v63 = sub_213CE5DF4();
  v64 = v4;
  v11 = sub_213CE5B60();
  v53 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v55 = (char *)&v52 - v15;
  v16 = sub_213CE6334();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v52 - v19;
  v21 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v52 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_213CE5E18();
  v59 = *(_QWORD *)(v24 - 8);
  v60 = v24;
  MEMORY[0x24BDAC7A8](v24);
  v62 = (char *)&v52 - v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, v57, v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v20, 1, v10) == 1)
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
    v26 = v64;
    v27 = MEMORY[0x2199C1EA8](MEMORY[0x24BDEFB78], v64);
    MEMORY[0x2199C16EC](v27, v26, &type metadata for PaymentItemDefaultBackgroundModifier, v27);
    v28 = sub_213CD671C();
    v71[0] = v27;
    v71[1] = v28;
    v29 = MEMORY[0x24BDED308];
    MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v5, v71);
    v30 = v54;
    v31 = *(void (**)(char *, char *, uint64_t))(v54 + 16);
    v32 = v56;
    v31(v56, v8, v5);
    v33 = *(void (**)(char *, uint64_t))(v30 + 8);
    v33(v8, v5);
    v31(v8, v32, v5);
    v34 = MEMORY[0x2199C1EA8](MEMORY[0x24BDEF370], v63);
    v70[0] = v27;
    v70[1] = v34;
    MEMORY[0x2199C1EA8](v29, v11, v70);
    sub_213CD6760((uint64_t)v8, v11, v5);
    v33(v8, v5);
    v33(v32, v5);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v23, v20, v10);
    sub_213CE61FC();
    v35 = MEMORY[0x2199C1EA8](MEMORY[0x24BDEFB78], v64);
    sub_213CE5FF8();
    v36 = MEMORY[0x2199C1EA8](MEMORY[0x24BDEF370], v63);
    v66[0] = v35;
    v66[1] = v36;
    v58 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v11, v66);
    v37 = v53;
    v38 = *(void (**)(char *, char *, uint64_t))(v53 + 16);
    v39 = v55;
    v38(v55, v14, v11);
    v40 = *(void (**)(char *, uint64_t))(v37 + 8);
    v40(v14, v11);
    v38(v14, v39, v11);
    v41 = sub_213CD671C();
    v65[0] = v35;
    v65[1] = v41;
    MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v5, v65);
    sub_213CD6658((uint64_t)v14, v11);
    v40(v14, v11);
    v40(v39, v11);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v10);
  }
  v42 = MEMORY[0x2199C1EA8](MEMORY[0x24BDEFB78], v64);
  v43 = MEMORY[0x2199C1EA8](MEMORY[0x24BDEF370], v63);
  v69[0] = v42;
  v69[1] = v43;
  v44 = MEMORY[0x24BDED308];
  v45 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v11, v69);
  v46 = sub_213CD671C();
  v68[0] = v42;
  v68[1] = v46;
  v47 = MEMORY[0x2199C1EA8](v44, v5, v68);
  v67[0] = v45;
  v67[1] = v47;
  v48 = v60;
  MEMORY[0x2199C1EA8](MEMORY[0x24BDEF3E0], v60, v67);
  v49 = v59;
  v50 = v62;
  (*(void (**)(uint64_t, char *, uint64_t))(v59 + 16))(v61, v62, v48);
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v50, v48);
}

uint64_t sub_213CD6658(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_213CE5E00();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_213CE5E0C();
}

unint64_t sub_213CD671C()
{
  unint64_t result;

  result = qword_254D35EB8;
  if (!qword_254D35EB8)
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE85A0, &type metadata for PaymentItemDefaultBackgroundModifier);
    atomic_store(result, (unint64_t *)&qword_254D35EB8);
  }
  return result;
}

uint64_t sub_213CD6760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_213CE5E00();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_213CE5E0C();
}

void View.paymentItemBackground()()
{
  JUMPOUT(0x2199C16ECLL);
}

uint64_t View.paymentItemBackground<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v20;

  v10 = sub_213CE6334();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v20 - v12;
  v15 = type metadata accessor for PaymentItemViewBackgroundModifier(0, a3, a5, v14);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v20 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v18, v13, v10);
  MEMORY[0x2199C16EC](v18, a2, v15, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

uint64_t type metadata accessor for PaymentItemViewBackgroundModifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PaymentItemViewBackgroundModifier);
}

uint64_t sub_213CD696C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213CD697C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213CD698C()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for PaymentItemBackground()
{
  return &type metadata for PaymentItemBackground;
}

ValueMetadata *type metadata accessor for PaymentItemDefaultBackgroundModifier()
{
  return &type metadata for PaymentItemDefaultBackgroundModifier;
}

uint64_t sub_213CD69E0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_213CD69E8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_213CE6334();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_213CD6A54(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84))
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if (*(_DWORD *)(v6 + 80) > 7u || (v7 & 0x100000) != 0 || v8 > 0x18)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v7 + 16) & ~(unint64_t)v7));
    swift_retain();
  }
  else if ((*(unsigned int (**)(uint64_t *, uint64_t, _QWORD))(v6 + 48))(a2, 1, *(_QWORD *)(a3 + 16)))
  {
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_213CD6B2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return result;
}

void *sub_213CD6B88(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84))
      v7 = *(_QWORD *)(v6 + 64);
    else
      v7 = *(_QWORD *)(v6 + 64) + 1;
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_213CD6C20(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
  return a1;
}

void *sub_213CD6D00(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84))
      v7 = *(_QWORD *)(v6 + 64);
    else
      v7 = *(_QWORD *)(v6 + 64) + 1;
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *sub_213CD6D98(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
  return a1;
}

uint64_t sub_213CD6E78(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  char v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = v5 - 1;
  if (!v5)
    v6 = 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v7;
  if (!a2)
    return 0;
  v8 = a2 - v6;
  if (a2 > v6)
  {
    v9 = 8 * v7;
    if (v7 > 3)
      goto LABEL_8;
    v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      v10 = *(_DWORD *)(a1 + v7);
      if (v10)
        goto LABEL_15;
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2)
          goto LABEL_24;
LABEL_8:
        v10 = *(unsigned __int8 *)(a1 + v7);
        if (!*(_BYTE *)(a1 + v7))
          goto LABEL_24;
LABEL_15:
        v12 = (v10 - 1) << v9;
        if (v7 > 3)
          v12 = 0;
        if ((_DWORD)v7)
        {
          if (v7 <= 3)
            v13 = v7;
          else
            v13 = 4;
          __asm { BR              X12 }
        }
        return v6 + v12 + 1;
      }
      v10 = *(unsigned __int16 *)(a1 + v7);
      if (*(_WORD *)(a1 + v7))
        goto LABEL_15;
    }
  }
LABEL_24:
  if (v5 < 2)
    return 0;
  v14 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v14 >= 2)
    return v14 - 1;
  else
    return 0;
}

void sub_213CD6FB8(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  size_t v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = v8 - 1;
  if (v8)
  {
    v10 = *(_QWORD *)(v7 + 64);
  }
  else
  {
    v9 = 0;
    v10 = *(_QWORD *)(v7 + 64) + 1;
  }
  v11 = a3 >= v9;
  v12 = a3 - v9;
  if (v12 != 0 && v11)
  {
    if (v10 > 3)
    {
      v6 = 1u;
      if (v9 < a2)
        goto LABEL_14;
      goto LABEL_21;
    }
    v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v13))
    {
      v6 = 4u;
      if (v9 < a2)
      {
LABEL_14:
        v14 = ~v9 + a2;
        if (v10 < 4)
        {
          if ((_DWORD)v10)
          {
            v15 = v14 & ~(-1 << (8 * v10));
            bzero(a1, v10);
            if ((_DWORD)v10 == 3)
            {
              *a1 = v15;
              *((_BYTE *)a1 + 2) = BYTE2(v15);
            }
            else if ((_DWORD)v10 == 2)
            {
              *a1 = v15;
            }
            else
            {
              *(_BYTE *)a1 = v15;
            }
          }
        }
        else
        {
          bzero(a1, v10);
          *(_DWORD *)a1 = v14;
        }
        __asm { BR              X10 }
      }
LABEL_21:
      __asm { BR              X11 }
    }
    if (v13 >= 0x100)
      v6 = 2;
    else
      v6 = v13 > 1;
  }
  if (v9 < a2)
    goto LABEL_14;
  goto LABEL_21;
}

void sub_213CD7160()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_213CD7168()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

uint64_t sub_213CD718C()
{
  return MEMORY[0x24BDF3E20];
}

unint64_t sub_213CD719C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35EC0;
  if (!qword_254D35EC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35EB0);
    v2[0] = sub_213CC0B2C(&qword_254D35EC8, &qword_254D35EA8, MEMORY[0x24BDEFB78]);
    v2[1] = sub_213CC0B2C(&qword_253F0BA28, &qword_253F0BA30, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35EC0);
  }
  return result;
}

uint64_t sub_213CD7238(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];

  v4 = type metadata accessor for PaymentItemViewBackgroundModifier(255, *a1, a1[1], a4);
  MEMORY[0x2199C1EA8](&unk_213CE85F0, v4);
  v5 = sub_213CE5E24();
  v6 = sub_213CE5DF4();
  v7 = sub_213CE5B60();
  v8 = sub_213CE5B60();
  v9 = sub_213CE5E18();
  v10 = MEMORY[0x2199C1EA8](MEMORY[0x24BDEFB78], v5);
  v16[0] = v10;
  v16[1] = MEMORY[0x2199C1EA8](MEMORY[0x24BDEF370], v6);
  v11 = MEMORY[0x24BDED308];
  v12 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v7, v16);
  v15[0] = v10;
  v15[1] = sub_213CD671C();
  v14[0] = v12;
  v14[1] = MEMORY[0x2199C1EA8](v11, v8, v15);
  return MEMORY[0x2199C1EA8](MEMORY[0x24BDEF3E0], v9, v14);
}

uint64_t sub_213CD736C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_213CE5B60();
  v4[0] = v1;
  v4[1] = sub_213CD671C();
  return MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v2, v4);
}

uint64_t sub_213CD73C0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  v4 = a1[2];
  v5 = type metadata accessor for PaymentItemViewBackgroundModifier(255, a1[1], a1[3], a4);
  v6 = sub_213CE5B60();
  v8[0] = v4;
  v8[1] = MEMORY[0x2199C1EA8](&unk_213CE85F0, v5);
  return MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v6, v8);
}

_QWORD *BaseAuthenticatorModel.PasscodeEntry.init(view:completion:viewPresented:)@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  *a6 = *result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

id BaseAuthenticatorModel.PasscodeEntry.view.getter@<X0>(void **a1@<X8>)
{
  void **v1;
  void *v2;

  v2 = *v1;
  *a1 = *v1;
  return v2;
}

uint64_t BaseAuthenticatorModel.PasscodeEntry.completion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_retain();
  return v1;
}

uint64_t BaseAuthenticatorModel.PasscodeEntry.viewPresented.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  sub_213CC0BB4(v1);
  return v1;
}

uint64_t BaseAuthenticatorModel.PasscodeEntry.id.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void sub_213CD74C0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t BaseAuthenticatorModel.PasscodeView.init(controller:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

id BaseAuthenticatorModel.PasscodeView.makeUIViewController(context:)()
{
  id *v0;

  return *v0;
}

uint64_t sub_213CD74E0()
{
  return MEMORY[0x24BEE0948];
}

unint64_t sub_213CD74F0()
{
  unint64_t result;

  result = qword_254D35ED0;
  if (!qword_254D35ED0)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for BaseAuthenticatorModel.PasscodeView, &type metadata for BaseAuthenticatorModel.PasscodeView);
    atomic_store(result, (unint64_t *)&qword_254D35ED0);
  }
  return result;
}

id sub_213CD7534()
{
  id *v0;

  return *v0;
}

uint64_t sub_213CD7548()
{
  return sub_213CE5E6C();
}

uint64_t sub_213CD7580()
{
  sub_213CD7910();
  return sub_213CE5EA8();
}

uint64_t sub_213CD75D0()
{
  sub_213CD7910();
  return sub_213CE5E78();
}

void sub_213CD7620()
{
  sub_213CD7910();
  sub_213CE5E9C();
  __break(1u);
}

uint64_t _s13PasscodeEntryVwxx(uint64_t a1)
{
  uint64_t result;

  result = swift_release();
  if (*(_QWORD *)(a1 + 24))
    return swift_release();
  return result;
}

uint64_t _s13PasscodeEntryVwcp(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  _OWORD *v7;
  id v8;
  uint64_t v9;

  v4 = *((_QWORD *)a2 + 2);
  v5 = *a2;
  *(_OWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 16) = v4;
  v7 = (__int128 *)((char *)a2 + 24);
  v6 = *((_QWORD *)a2 + 3);
  v8 = (id)v5;
  swift_retain();
  if (v6)
  {
    v9 = *((_QWORD *)a2 + 4);
    *(_QWORD *)(a1 + 24) = v6;
    *(_QWORD *)(a1 + 32) = v9;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 24) = *v7;
  }
  return a1;
}

uint64_t _s13PasscodeEntryVwca(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
  v8 = *(_QWORD *)(a2 + 24);
  if (!*(_QWORD *)(a1 + 24))
  {
    if (v8)
    {
      v10 = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 24) = v8;
      *(_QWORD *)(a1 + 32) = v10;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    return a1;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_7;
  }
  v9 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 32) = v9;
  swift_retain();
  swift_release();
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

uint64_t _s13PasscodeEntryVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v4;
  swift_release();
  v5 = *(_QWORD *)(a2 + 24);
  if (!*(_QWORD *)(a1 + 24))
  {
    if (v5)
    {
      v7 = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 24) = v5;
      *(_QWORD *)(a1 + 32) = v7;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  v6 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  swift_release();
  return a1;
}

uint64_t _s13PasscodeEntryVwet(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s13PasscodeEntryVwst(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BaseAuthenticatorModel.PasscodeEntry()
{
  return &type metadata for BaseAuthenticatorModel.PasscodeEntry;
}

ValueMetadata *type metadata accessor for BaseAuthenticatorModel.PasscodeView()
{
  return &type metadata for BaseAuthenticatorModel.PasscodeView;
}

unint64_t sub_213CD7910()
{
  unint64_t result;

  result = qword_254D35ED8;
  if (!qword_254D35ED8)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for BaseAuthenticatorModel.PasscodeView, &type metadata for BaseAuthenticatorModel.PasscodeView);
    atomic_store(result, (unint64_t *)&qword_254D35ED8);
  }
  return result;
}

id static NSBundle.PaymentUIBaseBundle.getter()
{
  if (qword_254D378B0 != -1)
    swift_once();
  return (id)qword_254D378B8;
}

uint64_t PaymentUIBaseLocalizedString(for:table:bundle:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  v5 = (void *)sub_213CE628C();
  v6 = (void *)sub_213CE628C();
  v7 = (void *)sub_213CE628C();
  v8 = objc_msgSend(a4, sel_localizedStringForKey_value_table_, v5, v6, v7);

  v9 = sub_213CE6298();
  return v9;
}

unint64_t LocalizedStringTable.rawValue.getter()
{
  return 0xD00000000000001FLL;
}

id sub_213CD7A60()
{
  if (qword_254D378B0 != -1)
    swift_once();
  return (id)qword_254D378B8;
}

uint64_t PaymentUIBaseLocalizedString(for:table:bundle:localization:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  v5 = (void *)sub_213CE628C();
  v6 = (void *)sub_213CE628C();
  v7 = (void *)sub_213CE628C();
  v8 = (void *)sub_213CE628C();
  v9 = objc_msgSend(a4, sel_localizedStringForKey_value_table_localization_, v5, v6, v7, v8);

  v10 = sub_213CE6298();
  return v10;
}

void sub_213CD7B74()
{
  void *v0;
  id v1;

  v0 = (void *)sub_213CE628C();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v0);

  if (v1)
    qword_254D378B8 = (uint64_t)v1;
  else
    __break(1u);
}

char *PaymentUIBaseLocalizedString(formatKey:table:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v5;

  swift_bridgeObjectRetain();
  v5 = sub_213CD7DD0(a4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t LocalizedStringTable.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_213CE640C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_213CD7C98()
{
  return 1;
}

uint64_t sub_213CD7CA0()
{
  sub_213CE6430();
  sub_213CE62A4();
  return sub_213CE6448();
}

uint64_t sub_213CD7CF4()
{
  return sub_213CE62A4();
}

uint64_t sub_213CD7D10()
{
  sub_213CE6430();
  sub_213CE62A4();
  return sub_213CE6448();
}

uint64_t sub_213CD7D60@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_213CE640C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_213CD7DB0(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000001FLL;
  a1[1] = 0x8000000213CEDD50;
}

char *sub_213CD7DD0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *result;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  _QWORD v30[4];

  sub_213CE63AC();
  v2 = (_QWORD *)swift_allocObject();
  v2[2] = 8;
  v2[3] = 0;
  v3 = v2 + 3;
  v2[4] = 0;
  v2[5] = 0;
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v5 = 0;
    v6 = a1 + 32;
    while (1)
    {
      sub_213CD81F8(v6 + 40 * v5, (uint64_t)v30);
      v7 = (uint64_t)__swift_project_boxed_opaque_existential_1(v30, v30[3]);
      v8 = sub_213CE6454();
      v9 = *v3;
      v10 = *(_QWORD *)(v8 + 16);
      v11 = __OFADD__(*v3, v10);
      v12 = *v3 + v10;
      if (v11)
        goto LABEL_28;
      v13 = v8;
      v7 = v2[4];
      if (v7 >= v12)
        goto LABEL_18;
      if (v7 + 0x4000000000000000 < 0)
        goto LABEL_29;
      v14 = (char *)v2[5];
      if (2 * v7 > v12)
        v12 = 2 * v7;
      v2[4] = v12;
      if ((unint64_t)(v12 - 0x1000000000000000) >> 61 != 7)
        goto LABEL_30;
      result = (char *)swift_slowAlloc();
      v2[5] = result;
      if (v14)
        break;
LABEL_19:
      if (!result)
      {
        __break(1u);
        return result;
      }
      v17 = *(_QWORD *)(v13 + 16);
      if (v17)
      {
        v18 = (uint64_t *)(v13 + 32);
        v19 = *v3;
        while (1)
        {
          v20 = *v18++;
          *(_QWORD *)&result[8 * v19] = v20;
          v19 = *v3 + 1;
          if (__OFADD__(*v3, 1))
            break;
          *v3 = v19;
          if (!--v17)
            goto LABEL_3;
        }
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
LABEL_3:
      ++v5;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
      if (v5 == v4)
        goto LABEL_25;
    }
    if (result != v14 || result >= &v14[8 * v9])
      memmove(result, v14, 8 * v9);
    v7 = (uint64_t)v2;
    sub_213CE6394();
LABEL_18:
    result = (char *)v2[5];
    goto LABEL_19;
  }
LABEL_25:
  v7 = sub_213CE63A0();
  if (qword_254D378B0 != -1)
LABEL_31:
    swift_once();
  v21 = (id)qword_254D378B8;
  v22 = (void *)sub_213CE628C();
  v23 = (void *)sub_213CE628C();
  v24 = (void *)sub_213CE628C();
  v25 = objc_msgSend(v21, sel_localizedStringForKey_value_table_, v22, v23, v24);

  sub_213CE6298();
  v26 = objc_allocWithZone(MEMORY[0x24BDD17C8]);
  v27 = (void *)sub_213CE628C();
  swift_bridgeObjectRelease();
  v28 = objc_msgSend(v26, sel_initWithFormat_arguments_, v27, v7);

  v29 = sub_213CE6298();
  swift_release();

  return (char *)v29;
}

unint64_t sub_213CD80C4()
{
  unint64_t result;

  result = qword_254D35EE0;
  if (!qword_254D35EE0)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for LocalizedStringTable, &type metadata for LocalizedStringTable);
    atomic_store(result, (unint64_t *)&qword_254D35EE0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for LocalizedStringTable(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LocalizedStringTable(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_213CD819C + 4 * asc_213CE8800[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_213CD81BC + 4 * byte_213CE8805[v4]))();
}

_BYTE *sub_213CD819C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_213CD81BC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_213CD81C4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_213CD81CC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_213CD81D4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_213CD81DC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LocalizedStringTable()
{
  return &type metadata for LocalizedStringTable;
}

uint64_t sub_213CD81F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

BOOL UserInterfaceType.isPad.getter()
{
  unsigned __int8 *v0;

  return *v0 == 4;
}

PaymentUIBase::UserInterfaceType_optional __swiftcall UserInterfaceType.init(rawValue:)(Swift::UInt rawValue)
{
  char *v1;
  char v2;

  v2 = 7;
  if (rawValue < 7)
    v2 = rawValue;
  *v1 = v2;
  return (PaymentUIBase::UserInterfaceType_optional)rawValue;
}

uint64_t UserInterfaceType.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

PaymentUIBase::UserInterfaceType_optional sub_213CD8268(Swift::UInt *a1)
{
  return UserInterfaceType.init(rawValue:)(*a1);
}

void sub_213CD8270(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

PaymentUIBase::UserInterfaceType __swiftcall userInterface()()
{
  _BYTE *v0;
  _BYTE *v1;
  id v2;
  id v3;
  PaymentUIBase::UserInterfaceType result;
  unint64_t v5;

  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v3 = objc_msgSend(v2, sel_userInterfaceIdiom);

  v5 = 0x10000020403uLL >> (8 * v3);
  if ((unint64_t)v3 >= 6)
    LOBYTE(v5) = 0;
  *v1 = v5;
  return result;
}

uint64_t sub_213CD82F8()
{
  return userInterface()();
}

uint64_t sub_213CD8304@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  if (qword_253F0BE70 != -1)
    result = swift_once();
  *a1 = byte_253F0BE68;
  return result;
}

uint64_t sub_213CD8354()
{
  sub_213CD93A4();
  return sub_213CE5B24();
}

Swift::Bool __swiftcall forceUserInterfaceIdiomPad()()
{
  return 0;
}

void sub_213CD83AC()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v1 = objc_msgSend(v0, sel_userInterfaceIdiom);

  byte_254D37A48 = v1 == (id)1;
}

uint64_t sub_213CD840C@<X0>(_BYTE *a1@<X8>)
{
  return sub_213CD8F54(qword_253F0BD90, byte_254D37A48, a1);
}

uint64_t sub_213CD8428()
{
  return sub_213CE5B24();
}

void sub_213CD8434()
{
  void *v0;
  id v1;
  id v2;
  BOOL v3;
  id v4;
  id v5;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_currentDevice);
  v2 = objc_msgSend(v1, sel_userInterfaceIdiom);

  if (v2 == (id)1)
  {
    v3 = 1;
  }
  else
  {
    v4 = objc_msgSend(v0, sel_currentDevice);
    v5 = objc_msgSend(v4, sel_userInterfaceIdiom);

    v3 = v5 == (id)5;
  }
  byte_254D37A58 = v3;
}

uint64_t sub_213CD84E0@<X0>(_BYTE *a1@<X8>)
{
  return sub_213CD8F54(qword_253F0BCF0, byte_254D37A58, a1);
}

uint64_t EnvironmentValues.userInterfaceType.getter()
{
  sub_213CD8530();
  return sub_213CE5CD4();
}

unint64_t sub_213CD8530()
{
  unint64_t result;

  result = qword_253F0BF00[0];
  if (!qword_253F0BF00[0])
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE8B5C, &type metadata for UserInterfaceKey);
    atomic_store(result, qword_253F0BF00);
  }
  return result;
}

uint64_t EnvironmentValues.userInterfaceType.setter()
{
  sub_213CD8530();
  return sub_213CE5CE0();
}

uint64_t (*EnvironmentValues.userInterfaceType.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;

  *a1 = v1;
  a1[1] = sub_213CD8530();
  sub_213CE5CD4();
  return sub_213CD8608;
}

uint64_t sub_213CD8608(uint64_t a1)
{
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a1 + 16);
  return sub_213CE5CE0();
}

uint64_t EnvironmentValues.isPadIdiom.getter()
{
  return sub_213CD8FAC((void (*)(void))sub_213CD8650);
}

unint64_t sub_213CD8650()
{
  unint64_t result;

  result = qword_253F0BE28;
  if (!qword_253F0BE28)
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE8B24, &type metadata for IsPadIdiomKey);
    atomic_store(result, (unint64_t *)&qword_253F0BE28);
  }
  return result;
}

uint64_t sub_213CD8694@<X0>(_BYTE *a1@<X8>)
{
  return sub_213CD9030((void (*)(void))sub_213CD8650, a1);
}

uint64_t sub_213CD86A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213CD9084(a1, a2, a3, a4, (void (*)(void))sub_213CD8650);
}

uint64_t EnvironmentValues.isPadIdiom.setter(uint64_t a1)
{
  return sub_213CD90E0(a1, (void (*)(void))sub_213CD8650);
}

uint64_t (*EnvironmentValues.isPadIdiom.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = sub_213CD8650();
  sub_213CE5CD4();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a1 + 17);
  return sub_213CD8730;
}

uint64_t sub_213CD8730(uint64_t a1)
{
  return sub_213CD918C(a1);
}

uint64_t EnvironmentValues.isLargeUI.getter()
{
  return sub_213CD8FAC((void (*)(void))sub_213CD8750);
}

unint64_t sub_213CD8750()
{
  unint64_t result;

  result = qword_253F0BD80;
  if (!qword_253F0BD80)
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE8AEC, &type metadata for IsLargeUIKey);
    atomic_store(result, (unint64_t *)&qword_253F0BD80);
  }
  return result;
}

uint64_t sub_213CD8794@<X0>(_BYTE *a1@<X8>)
{
  return sub_213CD9030((void (*)(void))sub_213CD8750, a1);
}

uint64_t sub_213CD87A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213CD9084(a1, a2, a3, a4, (void (*)(void))sub_213CD8750);
}

uint64_t EnvironmentValues.isLargeUI.setter(uint64_t a1)
{
  return sub_213CD90E0(a1, (void (*)(void))sub_213CD8750);
}

uint64_t (*EnvironmentValues.isLargeUI.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = sub_213CD8750();
  sub_213CE5CD4();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a1 + 17);
  return sub_213CD8830;
}

uint64_t sub_213CD8830(uint64_t a1)
{
  return sub_213CD918C(a1);
}

void sub_213CD883C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_213CD8848()
{
  sub_213CD95A4();
  return sub_213CE5B24();
}

uint64_t EnvironmentValues.shouldUseAccessibleLayout.getter()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int (*v28)(uint64_t, uint64_t, uint64_t);
  char v29;
  uint64_t v30;
  void (*v32)(char *, uint64_t, uint64_t);
  char *v33;
  void (*v34)(char *, uint64_t);
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;

  v38 = sub_213CE5E30();
  v41 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v36 = (char *)&v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BA20);
  MEMORY[0x24BDAC7A8](v39);
  v40 = (uint64_t)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BA18);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v37 = (uint64_t)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v35 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v35 - v9;
  v11 = sub_213CE5CC8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_213CE5B3C();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213CD8CD4();
  v19 = v0;
  sub_213CE5CD4();
  if (v42 != 2)
  {
    v29 = v42 & 1;
    return v29 & 1;
  }
  v35 = v8;
  v20 = v41;
  sub_213CE5C08();
  v21 = sub_213CE5B30();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v19, v11);
  v22 = v14;
  if ((v21 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
LABEL_11:
    v29 = 0;
    return v29 & 1;
  }
  sub_213CE5C68();
  v23 = (_QWORD *)v20;
  v24 = (uint64_t)v35;
  v25 = v38;
  (*(void (**)(char *, _QWORD, uint64_t))(v20 + 104))(v35, *MEMORY[0x24BDEFEE8], v38);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v20 + 56))(v24, 0, 1, v25);
  v26 = v40;
  v27 = v40 + *(int *)(v39 + 48);
  sub_213CD8D18((uint64_t)v10, v40);
  sub_213CD8D18(v24, v27);
  v28 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v23[6];
  if (v28(v26, 1, v25) != 1)
  {
    v30 = v37;
    sub_213CD8D18(v26, v37);
    if (v28(v27, 1, v25) != 1)
    {
      v32 = (void (*)(char *, uint64_t, uint64_t))v23[4];
      v39 = (uint64_t)v22;
      v33 = v36;
      v32(v36, v27, v25);
      sub_213CD8D60();
      v29 = sub_213CE6280();
      v34 = (void (*)(char *, uint64_t))v23[1];
      v34(v33, v25);
      sub_213CC3848((uint64_t)v35, &qword_253F0BA18);
      sub_213CC3848((uint64_t)v10, &qword_253F0BA18);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v39, v11);
      v34((char *)v30, v25);
      sub_213CC3848(v26, &qword_253F0BA18);
      return v29 & 1;
    }
    sub_213CC3848((uint64_t)v35, &qword_253F0BA18);
    sub_213CC3848((uint64_t)v10, &qword_253F0BA18);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v22, v11);
    ((void (*)(uint64_t, uint64_t))v23[1])(v30, v25);
    goto LABEL_10;
  }
  sub_213CC3848(v24, &qword_253F0BA18);
  sub_213CC3848((uint64_t)v10, &qword_253F0BA18);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v22, v11);
  if (v28(v27, 1, v25) != 1)
  {
LABEL_10:
    sub_213CC3848(v26, &qword_253F0BA20);
    goto LABEL_11;
  }
  sub_213CC3848(v26, &qword_253F0BA18);
  v29 = 1;
  return v29 & 1;
}

unint64_t sub_213CD8CD4()
{
  unint64_t result;

  result = qword_253F0C8B8[0];
  if (!qword_253F0C8B8[0])
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE8AB4, &type metadata for ShouldUseAccessibleLayoutKey);
    atomic_store(result, qword_253F0C8B8);
  }
  return result;
}

uint64_t sub_213CD8D18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0BA18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_213CD8D60()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D35EE8;
  if (!qword_254D35EE8)
  {
    v1 = sub_213CE5E30();
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDEFF08], v1);
    atomic_store(result, (unint64_t *)&qword_254D35EE8);
  }
  return result;
}

uint64_t EnvironmentValues.shouldUseAccessibleLayout.setter()
{
  sub_213CD8CD4();
  return sub_213CE5CE0();
}

uint64_t (*EnvironmentValues.shouldUseAccessibleLayout.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = EnvironmentValues.shouldUseAccessibleLayout.getter() & 1;
  return sub_213CD8E18;
}

uint64_t sub_213CD8E18(uint64_t a1)
{
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a1 + 8);
  sub_213CD8CD4();
  return sub_213CE5CE0();
}

uint64_t sub_213CD8E5C()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  v1 = objc_msgSend(v0, sel_fixedCoordinateSpace);

  objc_msgSend(v1, sel_bounds);
  v3 = v2;
  result = swift_unknownObjectRelease();
  qword_253F0C2B8 = v3;
  return result;
}

uint64_t sub_213CD8EE0()
{
  uint64_t result;

  if (qword_253F0C2C0 != -1)
    result = swift_once();
  byte_254D37A68 = *(double *)&qword_253F0C2B8 <= 320.0;
  return result;
}

uint64_t sub_213CD8F38@<X0>(_BYTE *a1@<X8>)
{
  return sub_213CD8F54(&qword_253F0C2B0, &byte_254D37A68, a1);
}

uint64_t sub_213CD8F54@<X0>(_QWORD *a1@<X2>, _BYTE *a2@<X3>, _BYTE *a3@<X8>)
{
  uint64_t result;

  if (*a1 != -1)
    result = swift_once();
  *a3 = *a2;
  return result;
}

uint64_t EnvironmentValues.isCompactLayout.getter()
{
  return sub_213CD8FAC((void (*)(void))sub_213CD8FEC);
}

uint64_t sub_213CD8FAC(void (*a1)(void))
{
  unsigned __int8 v2;

  a1();
  sub_213CE5CD4();
  return v2;
}

unint64_t sub_213CD8FEC()
{
  unint64_t result;

  result = qword_253F0C350[0];
  if (!qword_253F0C350[0])
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE8A7C, &type metadata for IsCompactLayoutKey);
    atomic_store(result, qword_253F0C350);
  }
  return result;
}

uint64_t sub_213CD9030@<X0>(void (*a1)(void)@<X3>, _BYTE *a2@<X8>)
{
  uint64_t result;
  char v4;

  a1();
  result = sub_213CE5CD4();
  *a2 = v4;
  return result;
}

uint64_t sub_213CD9084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  a5();
  return sub_213CE5CE0();
}

uint64_t EnvironmentValues.isCompactLayout.setter(uint64_t a1)
{
  return sub_213CD90E0(a1, (void (*)(void))sub_213CD8FEC);
}

uint64_t sub_213CD90E0(uint64_t a1, void (*a2)(void))
{
  a2();
  return sub_213CE5CE0();
}

uint64_t (*EnvironmentValues.isCompactLayout.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = sub_213CD8FEC();
  sub_213CE5CD4();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a1 + 17);
  return sub_213CD9180;
}

uint64_t sub_213CD9180(uint64_t a1)
{
  return sub_213CD918C(a1);
}

uint64_t sub_213CD918C(uint64_t a1)
{
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a1 + 16);
  return sub_213CE5CE0();
}

void sub_213CD91B8()
{
  qword_254D37A78 = MEMORY[0x24BEE4B00];
}

uint64_t sub_213CD91CC@<X0>(_QWORD *a1@<X8>)
{
  if (qword_254D37A70 != -1)
    swift_once();
  *a1 = qword_254D37A78;
  return swift_bridgeObjectRetain();
}

uint64_t EnvironmentValues.availableSheetItems.getter()
{
  uint64_t v1;

  sub_213CD9258();
  sub_213CE5CD4();
  return v1;
}

unint64_t sub_213CD9258()
{
  unint64_t result;

  result = qword_254D37A88[0];
  if (!qword_254D37A88[0])
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE8A44, &type metadata for AvailableSheetItems);
    atomic_store(result, qword_254D37A88);
  }
  return result;
}

uint64_t EnvironmentValues.availableSheetItems.setter()
{
  sub_213CD9258();
  return sub_213CE5CE0();
}

uint64_t (*EnvironmentValues.availableSheetItems.modify(uint64_t a1))(_QWORD *a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 16) = v1;
  *(_QWORD *)(a1 + 24) = sub_213CD9258();
  sub_213CE5CD4();
  return sub_213CD9320;
}

uint64_t sub_213CD9320(_QWORD *a1, char a2)
{
  a1[1] = *a1;
  if ((a2 & 1) == 0)
    return sub_213CE5CE0();
  swift_bridgeObjectRetain();
  sub_213CE5CE0();
  return swift_bridgeObjectRelease();
}

unint64_t sub_213CD93A4()
{
  unint64_t result;

  result = qword_254D35EF0;
  if (!qword_254D35EF0)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for UserInterfaceType, &type metadata for UserInterfaceType);
    atomic_store(result, (unint64_t *)&qword_254D35EF0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for UserInterfaceType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for UserInterfaceType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_213CD94C4 + 4 * byte_213CE88D5[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_213CD94F8 + 4 * asc_213CE88D0[v4]))();
}

uint64_t sub_213CD94F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213CD9500(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213CD9508);
  return result;
}

uint64_t sub_213CD9514(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213CD951CLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_213CD9520(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213CD9528(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UserInterfaceType()
{
  return &type metadata for UserInterfaceType;
}

ValueMetadata *type metadata accessor for AvailableSheetItems()
{
  return &type metadata for AvailableSheetItems;
}

ValueMetadata *type metadata accessor for IsCompactLayoutKey()
{
  return &type metadata for IsCompactLayoutKey;
}

ValueMetadata *type metadata accessor for ShouldUseAccessibleLayoutKey()
{
  return &type metadata for ShouldUseAccessibleLayoutKey;
}

ValueMetadata *type metadata accessor for IsLargeUIKey()
{
  return &type metadata for IsLargeUIKey;
}

ValueMetadata *type metadata accessor for IsPadIdiomKey()
{
  return &type metadata for IsPadIdiomKey;
}

ValueMetadata *type metadata accessor for UserInterfaceKey()
{
  return &type metadata for UserInterfaceKey;
}

unint64_t sub_213CD95A4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_254D35EF8;
  if (!qword_254D35EF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0BAB0);
    v2 = MEMORY[0x24BEE1340];
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254D35EF8);
  }
  return result;
}

uint64_t dispatch thunk of AuthorizationStateProtocol.start()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.stop()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.pause()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.resume()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.didBecomeActive()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.didResignActive()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.sidecarDidBecomeActive()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.cancel(withCallback:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.startAuthenticatorEvaluation()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.didEncounterAuthenticationEvent(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of AuthorizationStateProtocol.authenticatorModel.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t sub_213CD9658()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D36030);
  return sub_213CE613C();
}

uint64_t sub_213CD96AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;

  v2 = v1 + *(int *)(a1 + 116);
  v3 = *(_QWORD *)v2;
  v4 = *(_BYTE *)(v2 + 8);
  sub_213CC5008(*(_QWORD *)v2, v4);
  v5 = sub_213CCA554(v3, v4);
  sub_213CC5044(v3, v4);
  return v5 & 1;
}

uint64_t sub_213CD9708(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;

  v2 = v1 + *(int *)(a1 + 120);
  v3 = *(_QWORD *)v2;
  v4 = *(_BYTE *)(v2 + 8);
  sub_213CC5008(*(_QWORD *)v2, v4);
  v5 = sub_213CCA554(v3, v4);
  sub_213CC5044(v3, v4);
  return v5 & 1;
}

uint64_t sub_213CD9764()
{
  return sub_213CE5BE4();
}

uint64_t sub_213CD9784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213CE0238(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDEB418], MEMORY[0x24BDEDEF8]);
}

void PaymentItem.init(icon:primaryLabel:secondaryLabel:chevronStyle:secondaryContent:secondaryContentStyle:alwaysCenterIconVertically:mainContentAction:)()
{
  type metadata accessor for PaymentItem();
}

uint64_t sub_213CD9830(int *a1)
{
  uint64_t v1;
  char v2;
  void (*v3)(uint64_t);
  uint64_t (*v4)(uint64_t);
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  _QWORD *v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(void);
  _QWORD v23[22];

  v8 = (_QWORD *)(v1 + a1[28]);
  *(_QWORD *)(v6 - 96) = 0;
  sub_213CE6124();
  v9 = v23[1];
  *v8 = v23[0];
  v8[1] = v9;
  v10 = v1 + a1[29];
  *(_QWORD *)v10 = swift_getKeyPath();
  *(_BYTE *)(v10 + 8) = 0;
  v11 = v1 + a1[30];
  *(_QWORD *)v11 = swift_getKeyPath();
  *(_BYTE *)(v11 + 8) = 0;
  v12 = (uint64_t *)(v1 + a1[31]);
  *v12 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35F00);
  v13 = swift_storeEnumTagMultiPayload();
  *(_QWORD *)(v1 + a1[32]) = 0x4052800000000000;
  *(_QWORD *)(v1 + a1[33]) = 0x402C000000000000;
  *(_QWORD *)(v1 + a1[34]) = 0x4044000000000000;
  v14 = v5(v13);
  v15 = v4(v14);
  v3(v15);
  LOBYTE(v23[0]) = v2;
  sub_213CD23D8((uint64_t)v23);
  result = v22();
  *(_BYTE *)(v1 + a1[25]) = v18;
  *(_BYTE *)(v1 + a1[26]) = v19;
  v17 = (_QWORD *)(v1 + a1[27]);
  *v17 = v20;
  v17[1] = v21;
  return result;
}

void type metadata accessor for PaymentItem()
{
  JUMPOUT(0x2199C1E0CLL);
}

void PaymentItem.init(icon:primaryLabel:secondaryLabel:accessoryViewStyle:secondaryContent:secondaryContentStyle:alwaysCenterIconVertically:mainContentAction:)()
{
  uint64_t v0;

  v0 = sub_213CE6334();
  MEMORY[0x24BDAC7A8](v0);
  type metadata accessor for PaymentItem();
}

uint64_t sub_213CD9A80(int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _QWORD *v18;
  uint64_t v19;

  v8 = (_QWORD *)(v1 + a1[28]);
  *(_QWORD *)(v6 - 96) = 0;
  sub_213CE6124();
  v9 = *(_QWORD *)(v6 - 152);
  *v8 = *(_QWORD *)(v6 - 160);
  v8[1] = v9;
  v10 = v1 + a1[29];
  *(_QWORD *)v10 = swift_getKeyPath();
  *(_BYTE *)(v10 + 8) = 0;
  v11 = v1 + a1[30];
  *(_QWORD *)v11 = swift_getKeyPath();
  *(_BYTE *)(v11 + 8) = 0;
  v12 = (uint64_t *)(v1 + a1[31]);
  *v12 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35F00);
  v13 = swift_storeEnumTagMultiPayload();
  *(_QWORD *)(v1 + a1[32]) = 0x4052800000000000;
  *(_QWORD *)(v1 + a1[33]) = 0x402C000000000000;
  *(_QWORD *)(v1 + a1[34]) = 0x4044000000000000;
  v14 = (*(uint64_t (**)(uint64_t))(v6 - 248))(v13);
  v15 = (*(uint64_t (**)(uint64_t))(v6 - 232))(v14);
  (*(void (**)(uint64_t))(v6 - 200))(v15);
  v16 = sub_213CD4218(v2, v1 + a1[23], type metadata accessor for AccessoryViewStyle);
  (*(void (**)(uint64_t))(v6 - 192))(v16);
  sub_213CD425C(v2, type metadata accessor for AccessoryViewStyle);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v1 + a1[24], v4, v3);
  *(_BYTE *)(v1 + a1[25]) = *(_DWORD *)(v6 - 220);
  *(_BYTE *)(v1 + a1[26]) = *(_DWORD *)(v6 - 180);
  v18 = (_QWORD *)(v1 + a1[27]);
  v19 = *(_QWORD *)(v6 - 168);
  *v18 = *(_QWORD *)(v6 - 176);
  v18[1] = v19;
  return result;
}

uint64_t sub_213CD9C10@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v25;
  uint64_t v26;
  uint64_t OpaqueTypeConformance2;
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
  char *v38;
  uint64_t v39;
  char *v40;
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
  void (*v51)(char *, char *, uint64_t);
  void (*v52)(char *, uint64_t);
  void (*v53)(char *, char *, uint64_t);
  char *v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  uint64_t v78;
  uint64_t v79;
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];

  v71 = a2;
  v66 = a1[2];
  sub_213CE5B60();
  sub_213CE5EC0();
  sub_213CE5B60();
  v65 = a1[3];
  sub_213CE5B60();
  swift_getTupleTypeMetadata2();
  v3 = sub_213CE6214();
  v4 = MEMORY[0x24BDF5428];
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v3);
  sub_213CE6178();
  v64 = a1[4];
  sub_213CE6334();
  type metadata accessor for AccessoryView(255);
  swift_getTupleTypeMetadata2();
  v5 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v4, v5);
  sub_213CE6178();
  sub_213CE6334();
  swift_getTupleTypeMetadata2();
  v6 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v4, v6);
  sub_213CE6178();
  sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35F08);
  v69 = a1;
  v63 = a1[5];
  v7 = sub_213CE5B60();
  v8 = sub_213CE5B60();
  v9 = sub_213CE5B60();
  v10 = sub_213CE5B60();
  v62 = a1[9];
  v83[0] = v62;
  v83[1] = MEMORY[0x24BDEDBB8];
  v11 = MEMORY[0x24BDED308];
  v12 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v7, v83);
  v13 = MEMORY[0x24BDECC60];
  v82[0] = v12;
  v82[1] = MEMORY[0x24BDECC60];
  v81[0] = MEMORY[0x2199C1EA8](v11, v8, v82);
  v81[1] = v13;
  v80[0] = MEMORY[0x2199C1EA8](v11, v9, v81);
  v80[1] = v13;
  v78 = v10;
  v79 = MEMORY[0x2199C1EA8](v11, v10, v80);
  v14 = MEMORY[0x24BDF2F10];
  MEMORY[0x2199C1E48](255, &v78, MEMORY[0x24BDF2F10], 0);
  sub_213CE5B60();
  swift_getTupleTypeMetadata2();
  sub_213CE6214();
  sub_213CE6334();
  swift_getTupleTypeMetadata2();
  v15 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v4, v15);
  v16 = sub_213CE6190();
  v17 = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4700], v16);
  v78 = v16;
  v79 = v17;
  MEMORY[0x2199C1E48](255, &v78, v14, 0);
  v18 = sub_213CE5B60();
  v19 = sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35F10);
  v20 = sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35A40);
  v21 = sub_213CE5B60();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v60 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v61 = (char *)&v60 - v26;
  v78 = v16;
  v79 = v17;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v28 = sub_213CD0344((unint64_t *)&qword_254D356A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  v77[0] = OpaqueTypeConformance2;
  v77[1] = v28;
  v76[0] = MEMORY[0x2199C1EA8](v11, v18, v77);
  v76[1] = MEMORY[0x24BDEDBB8];
  v29 = MEMORY[0x2199C1EA8](v11, v19, v76);
  v30 = sub_213CC0B2C(&qword_254D35F18, &qword_254D35F10, MEMORY[0x24BDEF370]);
  v75[0] = v29;
  v75[1] = v30;
  v31 = MEMORY[0x2199C1EA8](v11, v20, v75);
  v32 = sub_213CC0B2C(&qword_254D35AA8, &qword_254D35A40, MEMORY[0x24BDEB950]);
  v74[0] = v31;
  v74[1] = v32;
  v33 = MEMORY[0x2199C1EA8](v11, v21, v74);
  v34 = sub_213CE6160();
  v35 = *(_QWORD *)(v34 - 8);
  v36 = MEMORY[0x24BDAC7A8](v34);
  v38 = (char *)&v60 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v36);
  v40 = (char *)&v60 - v39;
  v41 = sub_213CE5E18();
  v42 = v70;
  v68 = v41;
  v67 = *(_QWORD *)(v41 - 8);
  v43 = MEMORY[0x24BDAC7A8](v69);
  v72 = (char *)&v60 - v44;
  v45 = *(_QWORD *)(v42 + *(int *)(v43 + 108));
  if (v45)
  {
    v61 = (char *)&v60;
    v46 = MEMORY[0x24BDAC7A8](v43);
    v47 = v65;
    *(&v60 - 10) = v66;
    *(&v60 - 9) = v47;
    v48 = v63;
    *(&v60 - 8) = v64;
    *(&v60 - 7) = v48;
    *((_OWORD *)&v60 - 3) = *(_OWORD *)(v46 + 48);
    v49 = v62;
    *(&v60 - 4) = *(_QWORD *)(v46 + 64);
    *(&v60 - 3) = v49;
    *(&v60 - 2) = v42;
    swift_retain_n();
    sub_213CE6148();
    MEMORY[0x2199C1EA8](MEMORY[0x24BDF43B0], v34);
    v50 = v33;
    v51 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
    v51(v40, v38, v34);
    v52 = *(void (**)(char *, uint64_t))(v35 + 8);
    v52(v38, v34);
    v51(v38, v40, v34);
    v33 = v50;
    sub_213CD6658((uint64_t)v38, v34);
    sub_213CDB5E0(v45);
    v52(v38, v34);
    v52(v40, v34);
  }
  else
  {
    sub_213CDAA28((_QWORD *)v43, v25);
    v53 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
    v54 = v61;
    v53(v61, v25, v21);
    v55 = *(void (**)(char *, uint64_t))(v22 + 8);
    v55(v25, v21);
    v53(v25, v54, v21);
    MEMORY[0x2199C1EA8](MEMORY[0x24BDF43B0], v34);
    sub_213CD6760((uint64_t)v25, v34, v21);
    v55(v25, v21);
    v55(v54, v21);
  }
  v73[0] = MEMORY[0x2199C1EA8](MEMORY[0x24BDF43B0], v34);
  v73[1] = v33;
  v56 = v68;
  MEMORY[0x2199C1EA8](MEMORY[0x24BDEF3E0], v68, v73);
  v57 = v67;
  v58 = v72;
  (*(void (**)(uint64_t, char *, uint64_t))(v67 + 16))(v71, v72, v56);
  return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v58, v56);
}

void sub_213CDA42C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];

  sub_213CE5B60();
  sub_213CE5EC0();
  sub_213CE5B60();
  sub_213CE5B60();
  swift_getTupleTypeMetadata2();
  v9 = sub_213CE6214();
  v10 = MEMORY[0x24BDF5428];
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v9);
  sub_213CE6178();
  sub_213CE6334();
  type metadata accessor for AccessoryView(255);
  swift_getTupleTypeMetadata2();
  v11 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v10, v11);
  sub_213CE6178();
  sub_213CE6334();
  swift_getTupleTypeMetadata2();
  v12 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v10, v12);
  sub_213CE6178();
  sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35F08);
  v13 = sub_213CE5B60();
  v14 = sub_213CE5B60();
  v15 = sub_213CE5B60();
  v16 = sub_213CE5B60();
  v44[0] = a9;
  v44[1] = MEMORY[0x24BDEDBB8];
  v17 = MEMORY[0x24BDED308];
  v18 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v13, v44);
  v19 = MEMORY[0x24BDECC60];
  v43[0] = v18;
  v43[1] = MEMORY[0x24BDECC60];
  v42[0] = MEMORY[0x2199C1EA8](v17, v14, v43);
  v42[1] = v19;
  v41[0] = MEMORY[0x2199C1EA8](v17, v15, v42);
  v41[1] = v19;
  v33 = v16;
  v34 = MEMORY[0x2199C1EA8](v17, v16, v41);
  v20 = MEMORY[0x24BDF2F10];
  MEMORY[0x2199C1E48](255, &v33, MEMORY[0x24BDF2F10], 0);
  sub_213CE5B60();
  swift_getTupleTypeMetadata2();
  sub_213CE6214();
  sub_213CE6334();
  swift_getTupleTypeMetadata2();
  v21 = sub_213CE6214();
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v21);
  v22 = sub_213CE6190();
  v23 = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4700], v22);
  v33 = v22;
  v34 = v23;
  MEMORY[0x2199C1E48](255, &v33, v20, 0);
  sub_213CE5B60();
  sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35F10);
  sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35A40);
  v24 = sub_213CE5B60();
  v25 = MEMORY[0x24BDAC7A8](v24);
  MEMORY[0x24BDAC7A8](v25);
  v33 = a2;
  v34 = a3;
  v35 = a4;
  v36 = a5;
  v37 = a6;
  v38 = a7;
  v39 = a8;
  v40 = a9;
  type metadata accessor for PaymentItem();
}

uint64_t sub_213CDA8C0(_QWORD *a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t OpaqueTypeConformance2;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  void (*v20)(char *, uint64_t);

  sub_213CDAA28(a1, v5);
  *(_QWORD *)(v10 - 216) = v6;
  *(_QWORD *)(v10 - 208) = v8;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v12 = sub_213CD0344((unint64_t *)&qword_254D356A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  *(_QWORD *)(v10 - 232) = OpaqueTypeConformance2;
  *(_QWORD *)(v10 - 224) = v12;
  v13 = MEMORY[0x24BDED308];
  *(_QWORD *)(v10 - 248) = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v4, v10 - 232);
  *(_QWORD *)(v10 - 240) = MEMORY[0x24BDEDBB8];
  v14 = v13;
  v15 = MEMORY[0x2199C1EA8](v13, v9, v10 - 248);
  v16 = sub_213CC0B2C(&qword_254D35F18, &qword_254D35F10, MEMORY[0x24BDEF370]);
  *(_QWORD *)(v10 - 264) = v15;
  *(_QWORD *)(v10 - 256) = v16;
  v17 = MEMORY[0x2199C1EA8](v14, v7, v10 - 264);
  v18 = sub_213CC0B2C(&qword_254D35AA8, &qword_254D35A40, MEMORY[0x24BDEB950]);
  *(_QWORD *)(v10 - 280) = v17;
  *(_QWORD *)(v10 - 272) = v18;
  MEMORY[0x2199C1EA8](v14, v1, v10 - 280);
  v19 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v19(v2, v5, v1);
  v20 = *(void (**)(char *, uint64_t))(v3 + 8);
  v20(v5, v1);
  v19(*(char **)(v10 - 288), v2, v1);
  return ((uint64_t (*)(char *, uint64_t))v20)(v2, v1);
}

uint64_t sub_213CDAA28@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  char *v40;
  uint64_t OpaqueTypeConformance2;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  _QWORD *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(void);
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, char *, uint64_t);
  char *v73;
  void (*v74)(char *, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  _QWORD *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  char *v105;
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
  _QWORD v120[2];
  _QWORD v121[2];
  _QWORD v122[2];
  _QWORD v123[2];
  void (*v124)();
  _QWORD *v125;
  _QWORD v126[2];
  _QWORD v127[2];
  _QWORD v128[2];
  _QWORD v129[2];

  v105 = a2;
  v104 = sub_213CE5BB4();
  v3 = MEMORY[0x24BDAC7A8](v104);
  v103 = (char *)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = *(a1 - 1);
  v102 = *(_QWORD *)(v101 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v100 = (char *)&v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v98 = sub_213CE5E48();
  v97 = *(_QWORD *)(v98 - 8);
  MEMORY[0x24BDAC7A8](v98);
  v96 = (char *)&v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = a1[2];
  sub_213CE5B60();
  sub_213CE5EC0();
  sub_213CE5B60();
  v109 = a1[3];
  sub_213CE5B60();
  swift_getTupleTypeMetadata2();
  v7 = sub_213CE6214();
  v8 = MEMORY[0x24BDF5428];
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v7);
  sub_213CE6178();
  v108 = a1[4];
  sub_213CE6334();
  type metadata accessor for AccessoryView(255);
  swift_getTupleTypeMetadata2();
  v9 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v8, v9);
  sub_213CE6178();
  sub_213CE6334();
  swift_getTupleTypeMetadata2();
  v10 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v8, v10);
  sub_213CE6178();
  sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35F08);
  v88 = a1;
  v107 = a1[5];
  v11 = sub_213CE5B60();
  v12 = sub_213CE5B60();
  v13 = sub_213CE5B60();
  v14 = sub_213CE5B60();
  v106 = a1[9];
  v129[0] = v106;
  v129[1] = MEMORY[0x24BDEDBB8];
  v15 = MEMORY[0x24BDED308];
  v16 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v11, v129);
  v17 = MEMORY[0x24BDECC60];
  v128[0] = v16;
  v128[1] = MEMORY[0x24BDECC60];
  v127[0] = MEMORY[0x2199C1EA8](v15, v12, v128);
  v127[1] = v17;
  v126[0] = MEMORY[0x2199C1EA8](v15, v13, v127);
  v126[1] = v17;
  v18 = MEMORY[0x2199C1EA8](v15, v14, v126);
  v124 = (void (*)())v14;
  v125 = (_QWORD *)v18;
  v19 = MEMORY[0x24BDF2F10];
  MEMORY[0x2199C1E48](255, &v124, MEMORY[0x24BDF2F10], 0);
  sub_213CE5B60();
  swift_getTupleTypeMetadata2();
  sub_213CE6214();
  sub_213CE6334();
  swift_getTupleTypeMetadata2();
  v20 = sub_213CE6214();
  v81 = MEMORY[0x2199C1EA8](v8, v20);
  v21 = sub_213CE6190();
  v84 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v77 - v22;
  v24 = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4700], v21);
  v124 = (void (*)())v21;
  v125 = (_QWORD *)v24;
  v25 = MEMORY[0x2199C1E48](0, &v124, v19, 0);
  v83 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v77 - v26;
  v28 = sub_213CE5B60();
  v85 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)&v77 - v29;
  v31 = sub_213CE5B60();
  v89 = *(_QWORD *)(v31 - 8);
  v86 = v31;
  MEMORY[0x24BDAC7A8](v31);
  v82 = (char *)&v77 - v32;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35F10);
  v33 = sub_213CE5B60();
  v95 = *(_QWORD *)(v33 - 8);
  v91 = v33;
  MEMORY[0x24BDAC7A8](v33);
  v87 = (char *)&v77 - v34;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35A40);
  v93 = sub_213CE5B60();
  v94 = *(_QWORD *)(v93 - 8);
  v35 = MEMORY[0x24BDAC7A8](v93);
  v90 = (char *)&v77 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v35);
  v92 = (char *)&v77 - v37;
  sub_213CE5D4C();
  v111 = v110;
  v112 = v109;
  v113 = v108;
  v114 = v107;
  v38 = v88;
  v79 = v88[6];
  v80 = v88[7];
  v115 = v79;
  v116 = v80;
  v78 = v88[8];
  v117 = v78;
  v118 = v106;
  v39 = v99;
  v119 = v99;
  sub_213CE6184();
  v40 = v96;
  sub_213CE5E3C();
  sub_213CE6028();
  (*(void (**)(char *, uint64_t))(v97 + 8))(v40, v98);
  (*(void (**)(char *, uint64_t))(v84 + 8))(v23, v21);
  v124 = (void (*)())v21;
  v125 = (_QWORD *)v24;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_213CE6040();
  (*(void (**)(char *, uint64_t))(v83 + 8))(v27, v25);
  sub_213CE61FC();
  v42 = sub_213CD0344((unint64_t *)&qword_254D356A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  v123[0] = OpaqueTypeConformance2;
  v123[1] = v42;
  v76 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v28, v123);
  v43 = v82;
  sub_213CE6064();
  (*(void (**)(char *, uint64_t))(v85 + 8))(v30, v28);
  v44 = v101;
  v45 = v100;
  (*(void (**)(char *, uint64_t, _QWORD *))(v101 + 16))(v100, v39, v38);
  v46 = v44;
  v47 = (*(unsigned __int8 *)(v44 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
  v48 = (char *)swift_allocObject();
  v49 = v109;
  *((_QWORD *)v48 + 2) = v110;
  *((_QWORD *)v48 + 3) = v49;
  v50 = v107;
  *((_QWORD *)v48 + 4) = v108;
  *((_QWORD *)v48 + 5) = v50;
  v51 = v80;
  *((_QWORD *)v48 + 6) = v79;
  *((_QWORD *)v48 + 7) = v51;
  v52 = v106;
  *((_QWORD *)v48 + 8) = v78;
  *((_QWORD *)v48 + 9) = v52;
  (*(void (**)(char *, char *, _QWORD *))(v46 + 32))(&v48[v47], v45, v38);
  v124 = sub_213CDD67C;
  v125 = v48;
  sub_213CE61FC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35F20);
  v122[0] = v76;
  v122[1] = MEMORY[0x24BDEDBB8];
  v53 = MEMORY[0x24BDED308];
  v54 = v86;
  v55 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v86, v122);
  sub_213CC0B2C(&qword_254D35F28, &qword_254D35F20, MEMORY[0x24BDEC6F8]);
  v56 = v87;
  sub_213CE5FF8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v89 + 8))(v43, v54);
  v57 = *(_QWORD *)sub_213CBBA48();
  v58 = v103;
  v59 = &v103[*(int *)(v104 + 20)];
  v60 = *MEMORY[0x24BDEEB68];
  v61 = sub_213CE5D10();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 104))(v59, v60, v61);
  *v58 = v57;
  v58[1] = v57;
  v62 = sub_213CC0B2C(&qword_254D35F18, &qword_254D35F10, MEMORY[0x24BDEF370]);
  v121[0] = v55;
  v121[1] = v62;
  v63 = v53;
  v64 = v53;
  v65 = v91;
  v66 = MEMORY[0x2199C1EA8](v64, v91, v121);
  v67 = MEMORY[0x24BDED998];
  sub_213CD0344(&qword_254D35F30, (uint64_t (*)(uint64_t))MEMORY[0x24BDED998], MEMORY[0x24BDED990]);
  v68 = v90;
  sub_213CE60A0();
  sub_213CD425C((uint64_t)v58, (uint64_t (*)(_QWORD))v67);
  (*(void (**)(char *, uint64_t))(v95 + 8))(v56, v65);
  v69 = sub_213CC0B2C(&qword_254D35AA8, &qword_254D35A40, MEMORY[0x24BDEB950]);
  v120[0] = v66;
  v120[1] = v69;
  v70 = v93;
  MEMORY[0x2199C1EA8](v63, v93, v120);
  v71 = v94;
  v72 = *(void (**)(char *, char *, uint64_t))(v94 + 16);
  v73 = v92;
  v72(v92, v68, v70);
  v74 = *(void (**)(char *, uint64_t))(v71 + 8);
  v74(v68, v70);
  v72(v105, v73, v70);
  return ((uint64_t (*)(char *, uint64_t))v74)(v73, v70);
}

void sub_213CDB5D4()
{
  sub_213CE3E3C((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_213CDA42C);
}

uint64_t sub_213CDB5E0(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

void sub_213CDB5F0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
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
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  void (**v64)(char *, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(_QWORD, _QWORD, _QWORD);
  _QWORD v70[3];
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  void (*v105)(_QWORD, _QWORD, _QWORD);
  uint64_t v106;
  uint64_t v107;
  void (*v108)(char *, uint64_t);
  uint64_t v109;
  void (**v110)(char *, uint64_t);
  char *v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
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
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  _QWORD v143[2];
  _QWORD v144[2];
  _QWORD v145[2];
  _QWORD v146[2];
  _QWORD v147[3];

  v123 = a8;
  v124 = a6;
  v125 = a7;
  v106 = a1;
  v119 = a9;
  v122 = a10;
  v14 = sub_213CE5E48();
  v97 = *(_QWORD *)(v14 - 8);
  v98 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v96 = (char *)v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_213CE5B60();
  v84 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v80 = (char *)v70 - v17;
  v18 = sub_213CE5B60();
  v85 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v81 = (char *)v70 - v19;
  v20 = sub_213CE5B60();
  v87 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v83 = (char *)v70 - v21;
  v22 = sub_213CE5B60();
  v92 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v86 = (char *)v70 - v23;
  v147[0] = a10;
  v147[1] = MEMORY[0x24BDEDBB8];
  v24 = MEMORY[0x24BDED308];
  v88 = v16;
  v71 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v16, v147);
  v146[0] = v71;
  v146[1] = MEMORY[0x24BDECC60];
  v25 = MEMORY[0x24BDECC60];
  v89 = v18;
  v72 = MEMORY[0x2199C1EA8](v24, v18, v146);
  v145[0] = v72;
  v145[1] = v25;
  v90 = v20;
  v73 = MEMORY[0x2199C1EA8](v24, v20, v145);
  v144[0] = v73;
  v144[1] = v25;
  v26 = MEMORY[0x2199C1EA8](v24, v22, v144);
  v93 = v22;
  v135 = v22;
  v74 = v26;
  v136 = v26;
  v27 = MEMORY[0x2199C1E48](0, &v135, MEMORY[0x24BDF2F10], 0);
  v76 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v75 = (char *)v70 - v28;
  sub_213CE5EC0();
  v78 = v27;
  v29 = sub_213CE5B60();
  v79 = *(_QWORD *)(v29 - 8);
  v30 = MEMORY[0x24BDAC7A8](v29);
  v94 = (char *)v70 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v91 = (char *)v70 - v32;
  v33 = sub_213CE61D8();
  v70[1] = *(_QWORD *)(v33 - 8);
  v70[2] = v33;
  MEMORY[0x24BDAC7A8](v33);
  v70[0] = (char *)v70 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35F08);
  v36 = MEMORY[0x24BDAC7A8](v35);
  v82 = (char *)v70 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v36);
  v77 = (char *)v70 - v38;
  v120 = a5;
  v39 = sub_213CE6334();
  v40 = *(_QWORD *)(v39 - 8);
  v103 = v39;
  v104 = v40;
  v41 = MEMORY[0x24BDAC7A8](v39);
  v102 = (char *)v70 - v42;
  v121 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v112 = (char *)v70 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = v35;
  v95 = v29;
  swift_getTupleTypeMetadata2();
  v115 = sub_213CE6214();
  v118 = sub_213CE6334();
  v114 = *(_QWORD *)(v118 - 8);
  v44 = MEMORY[0x24BDAC7A8](v118);
  v117 = (char *)v70 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v44);
  v116 = (char *)v70 - v46;
  v47 = a2;
  v100 = a2;
  sub_213CE5B60();
  sub_213CE5B60();
  v48 = a3;
  v99 = a3;
  sub_213CE5B60();
  swift_getTupleTypeMetadata2();
  v49 = sub_213CE6214();
  v50 = MEMORY[0x24BDF5428];
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v49);
  sub_213CE6178();
  v51 = a4;
  v101 = a4;
  sub_213CE6334();
  type metadata accessor for AccessoryView(255);
  swift_getTupleTypeMetadata2();
  v52 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v50, v52);
  sub_213CE6178();
  sub_213CE6334();
  swift_getTupleTypeMetadata2();
  v53 = sub_213CE6214();
  v108 = (void (*)(char *, uint64_t))MEMORY[0x2199C1EA8](v50, v53);
  v54 = sub_213CE6178();
  v110 = *(void (***)(char *, uint64_t))(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v56 = (char *)v70 - v55;
  v57 = sub_213CE5B60();
  v109 = *(_QWORD *)(v57 - 8);
  v58 = MEMORY[0x24BDAC7A8](v57);
  v111 = (char *)v70 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = MEMORY[0x24BDAC7A8](v58);
  v62 = (char *)v70 - v61;
  MEMORY[0x24BDAC7A8](v60);
  v64 = (void (**)(char *, uint64_t))((char *)v70 - v63);
  v126 = v47;
  v127 = v48;
  v65 = v120;
  v128 = v51;
  v129 = v120;
  v130 = v124;
  v131 = v125;
  v66 = v122;
  v132 = v123;
  v133 = v122;
  v134 = v106;
  sub_213CE5CF8();
  sub_213CE616C();
  v67 = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4498], v54);
  sub_213CE6070();
  v110[1](v56, v54);
  v143[0] = v67;
  v143[1] = MEMORY[0x24BDECC60];
  v107 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v57, v143);
  v68 = v109;
  v69 = *(void (**)(_QWORD, _QWORD, _QWORD))(v109 + 16);
  v110 = v64;
  v105 = v69;
  v69(v64, v62, v57);
  v108 = *(void (**)(char *, uint64_t))(v68 + 8);
  v109 = v57;
  v108(v62, v57);
  v135 = v100;
  v136 = v99;
  v137 = v101;
  v138 = v65;
  v139 = v124;
  v140 = v125;
  v141 = v123;
  v142 = v66;
  type metadata accessor for PaymentItem();
}

uint64_t sub_213CDBDEC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
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
  uint64_t OpaqueTypeConformance2;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t);

  v7 = v1[36];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v4, v3 + *(int *)(a1 + 96), v5);
  v8 = v1[53];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v2) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v4, v5);
    v9 = v1[47];
    v10 = v1[49];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v10, 1, 1, v9);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v1[44], v4, v2);
    v1[57] = qword_213CE8FC8[*(char *)(v3 + *(int *)(a1 + 100))];
    v11 = *v1;
    sub_213CE61CC();
    v12 = sub_213CE5F08();
    sub_213CE5AA0();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v1[1];
    v21 = v1[2];
    v23 = v1[14];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v23, v11, v21);
    v24 = v23 + *(int *)(v1[45] + 36);
    *(_BYTE *)v24 = v12;
    *(_QWORD *)(v24 + 8) = v14;
    *(_QWORD *)(v24 + 16) = v16;
    *(_QWORD *)(v24 + 24) = v18;
    *(_QWORD *)(v24 + 32) = v20;
    *(_BYTE *)(v24 + 40) = 0;
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v11, v21);
    v25 = v1[9];
    sub_213CE3D5C(v23, v25, &qword_254D35F08);
    sub_213CE6208();
    v26 = v1[12];
    sub_213CE6064();
    sub_213CE5F20();
    v27 = v1[13];
    v28 = v1[20];
    sub_213CE607C();
    (*(void (**)(uint64_t, uint64_t))(v1[16] + 8))(v26, v28);
    sub_213CE5F08();
    v29 = v1[15];
    v30 = v1[21];
    sub_213CE607C();
    (*(void (**)(uint64_t, uint64_t))(v1[17] + 8))(v27, v30);
    sub_213CE5F14();
    v31 = v1[18];
    v32 = v1[22];
    sub_213CE607C();
    (*(void (**)(uint64_t, uint64_t))(v1[19] + 8))(v29, v32);
    v33 = v1[28];
    sub_213CE5E3C();
    v35 = v1[6];
    v34 = v1[7];
    v36 = v1[25];
    sub_213CE6028();
    (*(void (**)(uint64_t, uint64_t))(v1[29] + 8))(v33, v1[30]);
    (*(void (**)(uint64_t, uint64_t))(v1[24] + 8))(v31, v36);
    v1[77] = v36;
    v1[78] = v35;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v38 = v1[26];
    v39 = v1[10];
    sub_213CE6040();
    (*(void (**)(uint64_t, uint64_t))(v1[8] + 8))(v34, v39);
    v40 = sub_213CD0344((unint64_t *)&qword_254D356A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    v1[70] = OpaqueTypeConformance2;
    v1[71] = v40;
    v41 = v1[27];
    v42 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v41, v1 + 70);
    v43 = v1[11];
    v44 = *(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 16);
    v45 = v1[23];
    v44(v45, v38, v41);
    v46 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
    v46(v38, v41);
    sub_213CC3694(v25, v23, &qword_254D35F08);
    v1[77] = v23;
    v44(v38, v45, v41);
    v1[78] = v38;
    v1[75] = v1[45];
    v1[76] = v41;
    v1[73] = sub_213CE3DA0();
    v1[74] = v42;
    v10 = v1[49];
    sub_213CC121C(v1 + 77, 2uLL, (uint64_t)(v1 + 75));
    v46(v45, v41);
    sub_213CC3848(v25, &qword_254D35F08);
    (*(void (**)(uint64_t, uint64_t))(v1[53] + 8))(v1[44], v1[52]);
    v46(v38, v41);
    sub_213CC3848(v23, &qword_254D35F08);
    v9 = v1[47];
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v10, 0, 1, v9);
  }
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v9);
  v47 = v1[46];
  v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16);
  v49 = v1[48];
  v50 = v1[50];
  v48(v49, v10, v50);
  v51 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
  v51(v10, v50);
  v53 = v1[42];
  v52 = v1[43];
  v54 = v1[41];
  ((void (*)(uint64_t, uint64_t, uint64_t))v1[37])(v52, v53, v54);
  v1[77] = v52;
  v48(v10, v49, v50);
  v1[78] = v10;
  v1[75] = v54;
  v1[76] = v50;
  v1[73] = v1[39];
  v1[72] = MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v9);
  v1[74] = MEMORY[0x2199C1EA8](MEMORY[0x24BDF5578], v50, v1 + 72);
  sub_213CC121C(v1 + 77, 2uLL, (uint64_t)(v1 + 75));
  v51(v49, v50);
  v55 = (void (*)(uint64_t, uint64_t))v1[40];
  v55(v53, v54);
  v51(v10, v50);
  return ((uint64_t (*)(uint64_t, uint64_t))v55)(v52, v54);
}

void sub_213CDC360()
{
  sub_213CE3E3C((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_213CDB5F0);
}

void sub_213CDC36C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
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

  v50 = a1;
  v43 = a9;
  v17 = sub_213CE6334();
  type metadata accessor for AccessoryView(255);
  swift_getTupleTypeMetadata2();
  v32 = sub_213CE6214();
  v30 = MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v32);
  v18 = sub_213CE6178();
  v42 = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v31 = (char *)&v28 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v33 = (char *)&v28 - v21;
  v29 = type metadata accessor for AccessoryViewStyle(0);
  v22 = MEMORY[0x24BDAC7A8](v29);
  v28 = (char *)&v28 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = v17;
  v39 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v38 = (char *)&v28 - v24;
  v37 = v18;
  v36 = sub_213CE6334();
  v41 = *(_QWORD *)(v36 - 8);
  v25 = MEMORY[0x24BDAC7A8](v36);
  v35 = (char *)&v28 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v34 = (char *)&v28 - v27;
  v51 = a2;
  v52 = a3;
  v46 = a4;
  v47 = a5;
  v53 = a4;
  v54 = a5;
  v48 = a6;
  v55 = a6;
  v56 = a7;
  v44 = a7;
  v49 = a8;
  v57 = a8;
  v58 = a10;
  v45 = a10;
  type metadata accessor for PaymentItem();
}

uint64_t sub_213CDC5C8(int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  void (*v24)(_BYTE *, uint64_t, int *);
  int v25;
  void (*v26)(_BYTE *, int *);
  uint64_t v27;
  uint64_t v28;
  void (*v29)(_BYTE *, int *);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, _BYTE *, uint64_t);
  uint64_t v36;
  void (*v37)(_BYTE *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  _BYTE *v42;
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
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t, uint64_t);
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t);
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t, uint64_t);
  void (*v62)(uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t);
  _BYTE v67[112];

  v5 = *((_QWORD *)a1 - 1);
  v6 = MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v3 - 336) = &v67[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v67[-v8];
  *(_QWORD *)(v3 - 280) = v1;
  sub_213CE5B60();
  sub_213CE5EC0();
  sub_213CE5B60();
  *(_QWORD *)(v3 - 272) = v2;
  sub_213CE5B60();
  swift_getTupleTypeMetadata2();
  v10 = sub_213CE6214();
  *(_QWORD *)(v3 - 360) = MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v10);
  v11 = sub_213CE6178();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  *(_QWORD *)(v3 - 320) = &v67[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = &v67[-v16];
  MEMORY[0x24BDAC7A8](v15);
  *(_QWORD *)(v3 - 224) = &v67[-v18];
  v19 = *(_QWORD *)(v3 - 216);
  v20 = (uint64_t *)(v19 + a1[28]);
  v21 = *v20;
  v22 = v20[1];
  *(_QWORD *)(v3 - 168) = v21;
  *(_QWORD *)(v3 - 160) = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D36030);
  sub_213CE6130();
  v23 = *(double *)(v3 - 184);
  v24 = *(void (**)(_BYTE *, uint64_t, int *))(v5 + 16);
  v24(v9, v19, a1);
  if (v23 <= 74.0)
  {
    v29 = *(void (**)(_BYTE *, int *))(v5 + 8);
    *(_QWORD *)(v3 - 416) = v29;
    v29(v9, a1);
    v27 = *(_QWORD *)(v3 - 288);
    v28 = sub_213CE5CF8();
  }
  else
  {
    v25 = v9[a1[26]];
    v26 = *(void (**)(_BYTE *, int *))(v5 + 8);
    *(_QWORD *)(v3 - 416) = v26;
    v26(v9, a1);
    v27 = *(_QWORD *)(v3 - 288);
    if (v25 == 1)
      v28 = sub_213CE5CF8();
    else
      v28 = sub_213CE5CEC();
  }
  v30 = *(_QWORD *)(v3 - 216);
  MEMORY[0x24BDAC7A8](v28);
  v31 = *(_QWORD *)(v3 - 272);
  *(_QWORD *)&v67[-80] = *(_QWORD *)(v3 - 280);
  *(_QWORD *)&v67[-72] = v31;
  v33 = *(_QWORD *)(v3 - 256);
  v32 = *(_QWORD *)(v3 - 248);
  *(_QWORD *)&v67[-64] = v33;
  *(_QWORD *)&v67[-56] = v32;
  *(_QWORD *)&v67[-48] = *(_QWORD *)(v3 - 240);
  *(_QWORD *)&v67[-40] = v27;
  v34 = *(_QWORD *)(v3 - 264);
  *(_QWORD *)&v67[-32] = *(_QWORD *)(v3 - 232);
  *(_QWORD *)&v67[-24] = v34;
  *(_QWORD *)&v67[-16] = v30;
  sub_213CE616C();
  *(_QWORD *)(v3 - 368) = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4498], v11);
  v35 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v12 + 16);
  v36 = *(_QWORD *)(v3 - 224);
  *(_QWORD *)(v3 - 376) = v35;
  v35(v36, v17, v11);
  v37 = *(void (**)(_BYTE *, uint64_t))(v12 + 8);
  *(_QWORD *)(v3 - 360) = v37;
  v37(v17, v11);
  v38 = *(_QWORD *)(v3 - 344);
  v39 = *(_QWORD *)(v3 - 352);
  v40 = *(_QWORD *)(v3 - 328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v39, v30 + a1[22], v40);
  v41 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 48))(v39, 1, v33);
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v40);
  v42 = *(_BYTE **)(v3 - 336);
  v24(v42, v30, a1);
  if (v41 != 1)
  {
    v46 = (*(uint64_t (**)(_BYTE *, int *))(v3 - 416))(v42, a1);
    v47 = *(_QWORD *)(v3 - 384);
    v48 = *(_QWORD *)(v3 - 392);
    v49 = *(_QWORD *)(v3 - 400);
    v50 = *(_QWORD *)(v3 - 408);
    goto LABEL_10;
  }
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  v44 = *(_QWORD *)(v3 - 464);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v44, 1, 6, v43);
  sub_213CD0344(&qword_254D36040, type metadata accessor for AccessoryViewStyle, (uint64_t)&protocol conformance descriptor for AccessoryViewStyle);
  v45 = sub_213CE6280();
  sub_213CD425C(v44, type metadata accessor for AccessoryViewStyle);
  v46 = (*(uint64_t (**)(_BYTE *, int *))(v3 - 416))(v42, a1);
  v47 = *(_QWORD *)(v3 - 384);
  v48 = *(_QWORD *)(v3 - 392);
  v49 = *(_QWORD *)(v3 - 400);
  v50 = *(_QWORD *)(v3 - 408);
  if ((v45 & 1) == 0)
  {
LABEL_10:
    MEMORY[0x24BDAC7A8](v46);
    v51 = *(_QWORD *)(v3 - 272);
    *(_QWORD *)&v67[-80] = *(_QWORD *)(v3 - 280);
    *(_QWORD *)&v67[-72] = v51;
    v52 = *(_QWORD *)(v3 - 248);
    *(_QWORD *)&v67[-64] = *(_QWORD *)(v3 - 256);
    *(_QWORD *)&v67[-56] = v52;
    v53 = *(_QWORD *)(v3 - 288);
    *(_QWORD *)&v67[-48] = *(_QWORD *)(v3 - 240);
    *(_QWORD *)&v67[-40] = v53;
    v54 = *(_QWORD *)(v3 - 264);
    *(_QWORD *)&v67[-32] = *(_QWORD *)(v3 - 232);
    *(_QWORD *)&v67[-24] = v54;
    *(_QWORD *)&v67[-16] = *(_QWORD *)(v3 - 216);
    sub_213CE5CF8();
    v55 = *(_QWORD *)(v3 - 440);
    sub_213CE616C();
    MEMORY[0x2199C1EA8](MEMORY[0x24BDF4498], v47);
    v56 = *(_QWORD *)(v3 - 304);
    v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 16);
    v58 = *(_QWORD *)(v3 - 424);
    v57(v58, v55, v47);
    v59 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
    v59(v55, v47);
    v57(v49, v58, v47);
    v59(v58, v47);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v56 + 56))(v49, 0, 1, v47);
    goto LABEL_11;
  }
  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v3 - 304) + 56))(*(_QWORD *)(v3 - 400), 1, 1, *(_QWORD *)(v3 - 384));
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF4498], v47);
LABEL_11:
  v60 = *(_QWORD *)(v3 - 312);
  v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 16);
  v61(v50, v49, v48);
  v62 = *(void (**)(uint64_t, uint64_t))(v60 + 8);
  v62(v49, v48);
  v63 = *(_QWORD *)(v3 - 320);
  v64 = *(_QWORD *)(v3 - 224);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 - 376))(v63, v64, v11);
  *(_QWORD *)(v3 - 168) = v63;
  v61(v49, v50, v48);
  *(_QWORD *)(v3 - 160) = v49;
  *(_QWORD *)(v3 - 184) = v11;
  *(_QWORD *)(v3 - 176) = v48;
  *(_QWORD *)(v3 - 200) = *(_QWORD *)(v3 - 368);
  *(_QWORD *)(v3 - 208) = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4498], v47);
  *(_QWORD *)(v3 - 192) = MEMORY[0x2199C1EA8](MEMORY[0x24BDF5578], v48, v3 - 208);
  sub_213CC121C((uint64_t *)(v3 - 168), 2uLL, v3 - 184);
  v62(v50, v48);
  v65 = *(void (**)(uint64_t, uint64_t))(v3 - 360);
  v65(v64, v11);
  v62(v49, v48);
  return ((uint64_t (*)(uint64_t, uint64_t))v65)(v63, v11);
}

void sub_213CDCCA8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v24 = a8;
  v25 = a7;
  v23 = a6;
  v22 = a5;
  v21[0] = a4;
  v31 = a9;
  v32 = a1;
  v27 = a3;
  v13 = sub_213CE5B60();
  v30 = *(_QWORD *)(v13 - 8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v28 = (char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v29 = (char *)v21 - v16;
  v17 = sub_213CE5B60();
  v26 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  sub_213CE5EC0();
  v18 = sub_213CE5B60();
  v19 = MEMORY[0x24BDAC7A8](v18);
  MEMORY[0x24BDAC7A8](v19);
  v21[1] = (char *)v21 - v20;
  v33 = a2;
  v34 = a3;
  v35 = v21[0];
  v36 = v22;
  v37 = v23;
  v38 = a7;
  v39 = v24;
  v40 = a10;
  type metadata accessor for PaymentItem();
}

uint64_t sub_213CDCE70(uint64_t a1)
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
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t, uint64_t);

  *(_QWORD *)(v8 - 320) = a1;
  sub_213CE61FC();
  sub_213CE6058();
  v9 = MEMORY[0x24BDEBEE0];
  *(_QWORD *)(v8 - 168) = v3;
  *(_QWORD *)(v8 - 160) = v9;
  v10 = MEMORY[0x24BDED308];
  v11 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v7, v8 - 168);
  sub_213CE6040();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 288) + 8))(v4, v7);
  v12 = sub_213CD0344((unint64_t *)&qword_254D356A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  *(_QWORD *)(v8 - 184) = v11;
  *(_QWORD *)(v8 - 176) = v12;
  v13 = v10;
  *(_QWORD *)(v8 - 304) = MEMORY[0x2199C1EA8](v10, v5, v8 - 184);
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v15 = *(_QWORD *)(v8 - 328);
  v14(v15, v6, v5);
  v16 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  *(_QWORD *)(v8 - 288) = v16;
  v16(v6, v5);
  sub_213CE6208();
  v17 = *(_QWORD *)(v8 - 296);
  v18 = *(_QWORD *)(v8 - 272);
  sub_213CE6064();
  v19 = MEMORY[0x24BDEDBB8];
  *(_QWORD *)(v8 - 200) = v17;
  *(_QWORD *)(v8 - 192) = v19;
  v20 = MEMORY[0x2199C1EA8](v13, v1, v8 - 200);
  v21 = *(_QWORD *)(v8 - 256);
  v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16);
  v23 = *(_QWORD *)(v8 - 264);
  v22(v23, v18, v1);
  v24 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  v24(v18, v1);
  v14(v6, v15, v5);
  *(_QWORD *)(v8 - 152) = v6;
  v22(v18, v23, v1);
  *(_QWORD *)(v8 - 144) = v18;
  *(_QWORD *)(v8 - 216) = v5;
  *(_QWORD *)(v8 - 208) = v1;
  *(_QWORD *)(v8 - 232) = *(_QWORD *)(v8 - 304);
  *(_QWORD *)(v8 - 224) = v20;
  sub_213CC121C((uint64_t *)(v8 - 152), 2uLL, v8 - 216);
  v24(v23, v1);
  v25 = *(void (**)(uint64_t, uint64_t))(v8 - 288);
  v25(v15, v5);
  v24(v18, v1);
  return ((uint64_t (*)(uint64_t, uint64_t))v25)(v6, v5);
}

void sub_213CDD0F8(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v19 = a5;
  v20 = a6;
  v17 = a2;
  v18 = a4;
  v16 = a1;
  v23 = a8;
  v11 = type metadata accessor for AccessoryViewStyle(0);
  MEMORY[0x24BDAC7A8](v11);
  v22 = type metadata accessor for AccessoryView(0);
  v12 = MEMORY[0x24BDAC7A8](v22);
  v21 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = sub_213CE6334();
  v15 = MEMORY[0x24BDAC7A8](v14);
  MEMORY[0x24BDAC7A8](v15);
  v24 = v16;
  v25 = v17;
  v26 = a3;
  v27 = v18;
  v28 = v19;
  v29 = v20;
  v30 = a7;
  v31 = a9;
  type metadata accessor for PaymentItem();
}

uint64_t sub_213CDD24C(uint64_t a1)
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
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);

  v11 = v6 + *(int *)(a1 + 88);
  *(_QWORD *)(v9 - 160) = v1;
  *(_QWORD *)(v9 - 224) = MEMORY[0x2199C1EA8](MEMORY[0x24BDF5578], v3, v9 - 160);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v12(v8, v11, v3);
  sub_213CD4218(v6 + *(int *)(a1 + 92), v7, type metadata accessor for AccessoryViewStyle);
  AccessoryView.init(style:)(v7, v4);
  v12(v5, v8, v3);
  *(_QWORD *)(v9 - 152) = v5;
  v13 = *(_QWORD *)(v9 - 216);
  sub_213CD4218(v4, v13, type metadata accessor for AccessoryView);
  *(_QWORD *)(v9 - 144) = v13;
  v14 = *(_QWORD *)(v9 - 208);
  *(_QWORD *)(v9 - 176) = v3;
  *(_QWORD *)(v9 - 168) = v14;
  *(_QWORD *)(v9 - 192) = *(_QWORD *)(v9 - 224);
  *(_QWORD *)(v9 - 184) = sub_213CD0344(&qword_254D36048, type metadata accessor for AccessoryView, (uint64_t)&protocol conformance descriptor for AccessoryView);
  sub_213CC121C((uint64_t *)(v9 - 152), 2uLL, v9 - 176);
  sub_213CD425C(v4, type metadata accessor for AccessoryView);
  v15 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v15(v8, v3);
  sub_213CD425C(v13, type metadata accessor for AccessoryView);
  return ((uint64_t (*)(uint64_t, uint64_t))v15)(v5, v3);
}

void sub_213CDD378(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v17;
  _QWORD v18[3];
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

  v28 = a7;
  v29 = a8;
  v26 = a5;
  v27 = a6;
  v24 = a3;
  v25 = a4;
  v30 = a2;
  v21 = a9;
  v20 = a11;
  v22 = a10;
  v23 = a1;
  v19 = sub_213CE5B0C();
  v17 = *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64);
  MEMORY[0x24BDAC7A8](v19);
  v18[1] = (char *)v18 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = a3;
  v32 = a4;
  v33 = a5;
  v34 = a6;
  v35 = a7;
  v36 = a8;
  v37 = a10;
  v38 = a11;
  type metadata accessor for PaymentItem();
}

uint64_t sub_213CDD430(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, _QWORD, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v26 - v6;
  *(_QWORD *)(v2 - 264) = *sub_213CBC014();
  v8 = *(void (**)(char *, _QWORD, uint64_t))(v4 + 16);
  *(_QWORD *)(v2 - 248) = v8;
  swift_retain();
  v8(v7, *(_QWORD *)(v2 - 168), a1);
  v9 = *(_QWORD *)(v2 - 296);
  v10 = *(_QWORD *)(v2 - 280);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 16))(v9, *(_QWORD *)(v2 - 224), v10);
  v11 = *(unsigned __int8 *)(v4 + 80);
  v12 = (v11 + 80) & ~v11;
  *(_QWORD *)(v2 - 272) = v12 + v5;
  *(_QWORD *)(v2 - 288) = v11 | 7;
  v13 = (v12 + v5 + *(unsigned __int8 *)(v1 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v14 = (char *)swift_allocObject();
  v15 = *(_QWORD *)(v2 - 208);
  *((_QWORD *)v14 + 2) = *(_QWORD *)(v2 - 216);
  *((_QWORD *)v14 + 3) = v15;
  v16 = *(_QWORD *)(v2 - 192);
  *((_QWORD *)v14 + 4) = *(_QWORD *)(v2 - 200);
  *((_QWORD *)v14 + 5) = v16;
  v17 = *(_QWORD *)(v2 - 176);
  *((_QWORD *)v14 + 6) = *(_QWORD *)(v2 - 184);
  *((_QWORD *)v14 + 7) = v17;
  v18 = *(_QWORD *)(v2 - 256);
  *((_QWORD *)v14 + 8) = *(_QWORD *)(v2 - 232);
  *((_QWORD *)v14 + 9) = v18;
  v19 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v19(&v14[v12], v7, a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(&v14[v13], v9, v10);
  *(_QWORD *)(v2 - 152) = *(_QWORD *)(v2 - 264);
  *(_QWORD *)(v2 - 144) = sub_213CE38CC;
  *(_QWORD *)(v2 - 128) = 0;
  *(_QWORD *)(v2 - 120) = 0;
  *(_QWORD *)(v2 - 136) = v14;
  sub_213CE5B00();
  *(_QWORD *)(v2 - 160) = v20;
  (*(void (**)(char *, _QWORD, uint64_t))(v2 - 248))(v7, *(_QWORD *)(v2 - 168), a1);
  v21 = (char *)swift_allocObject();
  v22 = *(_QWORD *)(v2 - 208);
  *((_QWORD *)v21 + 2) = *(_QWORD *)(v2 - 216);
  *((_QWORD *)v21 + 3) = v22;
  v23 = *(_QWORD *)(v2 - 192);
  *((_QWORD *)v21 + 4) = *(_QWORD *)(v2 - 200);
  *((_QWORD *)v21 + 5) = v23;
  v24 = *(_QWORD *)(v2 - 176);
  *((_QWORD *)v21 + 6) = *(_QWORD *)(v2 - 184);
  *((_QWORD *)v21 + 7) = v24;
  *((_QWORD *)v21 + 8) = *(_QWORD *)(v2 - 232);
  *((_QWORD *)v21 + 9) = v18;
  v19(&v21[v12], v7, a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D36018);
  sub_213CE3CA8();
  sub_213CE3D0C();
  sub_213CE6094();
  swift_release();
  swift_release();
  sub_213CDB5E0(*(_QWORD *)(v2 - 144));
  return sub_213CDB5E0(*(_QWORD *)(v2 - 128));
}

void sub_213CDD67C()
{
  type metadata accessor for PaymentItem();
}

#error "213CDD708: call analysis failed (funcsize=15)"

uint64_t PaymentItem.body.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, char *, uint64_t);
  char *v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t);
  char *v55;
  void (*v56)(uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  uint64_t v90;
  uint64_t v91;
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];

  v81 = a2;
  v73 = a1[2];
  sub_213CE5B60();
  sub_213CE5EC0();
  sub_213CE5B60();
  v72 = a1[3];
  sub_213CE5B60();
  swift_getTupleTypeMetadata2();
  v3 = sub_213CE6214();
  v4 = MEMORY[0x24BDF5428];
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v3);
  sub_213CE6178();
  v71 = a1[4];
  sub_213CE6334();
  type metadata accessor for AccessoryView(255);
  swift_getTupleTypeMetadata2();
  v5 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v4, v5);
  sub_213CE6178();
  sub_213CE6334();
  swift_getTupleTypeMetadata2();
  v6 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v4, v6);
  sub_213CE6178();
  sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35F08);
  v74 = a1;
  v70 = a1[5];
  v7 = sub_213CE5B60();
  v8 = sub_213CE5B60();
  v9 = sub_213CE5B60();
  v10 = sub_213CE5B60();
  v69 = a1[9];
  v95[0] = v69;
  v95[1] = MEMORY[0x24BDEDBB8];
  v11 = MEMORY[0x24BDED308];
  v12 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v7, v95);
  v13 = MEMORY[0x24BDECC60];
  v94[0] = v12;
  v94[1] = MEMORY[0x24BDECC60];
  v93[0] = MEMORY[0x2199C1EA8](v11, v8, v94);
  v93[1] = v13;
  v92[0] = MEMORY[0x2199C1EA8](v11, v9, v93);
  v92[1] = v13;
  v90 = v10;
  v91 = MEMORY[0x2199C1EA8](v11, v10, v92);
  v14 = MEMORY[0x24BDF2F10];
  MEMORY[0x2199C1E48](255, &v90, MEMORY[0x24BDF2F10], 0);
  sub_213CE5B60();
  swift_getTupleTypeMetadata2();
  sub_213CE6214();
  sub_213CE6334();
  swift_getTupleTypeMetadata2();
  v15 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v4, v15);
  v16 = sub_213CE6190();
  v17 = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4700], v16);
  v90 = v16;
  v91 = v17;
  MEMORY[0x2199C1E48](255, &v90, v14, 0);
  v18 = sub_213CE5B60();
  v19 = sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35F10);
  v20 = sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35A40);
  v21 = sub_213CE5B60();
  v90 = v16;
  v91 = v17;
  v89[0] = swift_getOpaqueTypeConformance2();
  v89[1] = sub_213CD0344((unint64_t *)&qword_254D356A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  v88[0] = MEMORY[0x2199C1EA8](v11, v18, v89);
  v88[1] = MEMORY[0x24BDEDBB8];
  v87[0] = MEMORY[0x2199C1EA8](v11, v19, v88);
  v87[1] = sub_213CC0B2C(&qword_254D35F18, &qword_254D35F10, MEMORY[0x24BDEF370]);
  v86[0] = MEMORY[0x2199C1EA8](v11, v20, v87);
  v86[1] = sub_213CC0B2C(&qword_254D35AA8, &qword_254D35A40, MEMORY[0x24BDEB950]);
  v79 = MEMORY[0x2199C1EA8](v11, v21, v86);
  v78 = sub_213CE6160();
  v22 = sub_213CE5E18();
  v63 = *(_QWORD *)(v22 - 8);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v65 = (uint64_t)&v63 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v64 = (char *)&v63 - v25;
  sub_213CE61D8();
  swift_getTupleTypeMetadata2();
  v26 = sub_213CE6214();
  v66 = MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v26);
  v27 = sub_213CE6190();
  v67 = *(_QWORD *)(v27 - 8);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v63 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = MEMORY[0x24BDAC7A8](v28);
  v68 = (char *)&v63 - v32;
  v33 = (uint64_t)v74;
  v34 = *(v74 - 1);
  MEMORY[0x24BDAC7A8](v31);
  v36 = (char *)&v63 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = sub_213CE5E18();
  v76 = *(_QWORD *)(v77 - 8);
  MEMORY[0x24BDAC7A8](v77);
  v75 = (char *)&v63 - v37;
  v38 = v80;
  LOBYTE(v14) = sub_213CD96AC(v33);
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v36, v38, v33);
  if ((v14 & 1) != 0)
  {
    v39 = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v36, v33);
  }
  else
  {
    v40 = sub_213CD9708(v33);
    v39 = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v36, v33);
    if ((v40 & 1) == 0)
    {
      v51 = v65;
      sub_213CD9C10((_QWORD *)v33, v65);
      v48 = v78;
      v52 = MEMORY[0x2199C1EA8](MEMORY[0x24BDF43B0], v78);
      v49 = v79;
      v85[0] = v52;
      v85[1] = v79;
      MEMORY[0x2199C1EA8](MEMORY[0x24BDEF3E0], v22, v85);
      v53 = v63;
      v54 = *(void (**)(char *, uint64_t, uint64_t))(v63 + 16);
      v55 = v64;
      v54(v64, v51, v22);
      v56 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
      v56(v51, v22);
      v54((char *)v51, (uint64_t)v55, v22);
      MEMORY[0x2199C1EA8](MEMORY[0x24BDF4700], v27);
      v50 = v75;
      sub_213CD6760(v51, v27, v22);
      v56(v51, v22);
      v56((uint64_t)v55, v22);
      goto LABEL_6;
    }
  }
  MEMORY[0x24BDAC7A8](v39);
  v41 = v72;
  *(&v63 - 10) = v73;
  *(&v63 - 9) = v41;
  v42 = v70;
  *(&v63 - 8) = v71;
  *(&v63 - 7) = v42;
  *((_OWORD *)&v63 - 3) = *(_OWORD *)(v33 + 48);
  v43 = v69;
  *(&v63 - 4) = *(_QWORD *)(v33 + 64);
  *(&v63 - 3) = v43;
  *(&v63 - 2) = v38;
  sub_213CE5D40();
  sub_213CE6184();
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF4700], v27);
  v44 = v67;
  v45 = *(void (**)(char *, char *, uint64_t))(v67 + 16);
  v46 = v68;
  v45(v68, v30, v27);
  v47 = *(void (**)(char *, uint64_t))(v44 + 8);
  v47(v30, v27);
  v45(v30, v46, v27);
  v48 = v78;
  v82[0] = MEMORY[0x2199C1EA8](MEMORY[0x24BDF43B0], v78);
  v49 = v79;
  v82[1] = v79;
  MEMORY[0x2199C1EA8](MEMORY[0x24BDEF3E0], v22, v82);
  v50 = v75;
  sub_213CD6658((uint64_t)v30, v27);
  v47(v30, v27);
  v47(v46, v27);
LABEL_6:
  v57 = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4700], v27);
  v84[0] = MEMORY[0x2199C1EA8](MEMORY[0x24BDF43B0], v48);
  v84[1] = v49;
  v58 = MEMORY[0x24BDEF3E0];
  v59 = MEMORY[0x2199C1EA8](MEMORY[0x24BDEF3E0], v22, v84);
  v83[0] = v57;
  v83[1] = v59;
  v60 = v77;
  MEMORY[0x2199C1EA8](v58, v77, v83);
  v61 = v76;
  (*(void (**)(uint64_t, char *, uint64_t))(v76 + 16))(v81, v50, v60);
  return (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v50, v60);
}

void sub_213CDE124(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
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
  uint64_t OpaqueTypeConformance2;
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
  char *v51;
  char *v52;
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
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];

  v49 = a8;
  v48 = a7;
  v47 = a6;
  v43 = a5;
  v44 = a4;
  v45 = a3;
  v46 = a2;
  v50 = a1;
  v55 = a9;
  v42 = a10;
  v54 = sub_213CE61D8();
  v53 = *(_QWORD *)(v54 - 8);
  v10 = MEMORY[0x24BDAC7A8](v54);
  v52 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v51 = (char *)&v41 - v12;
  sub_213CE5B60();
  sub_213CE5EC0();
  sub_213CE5B60();
  sub_213CE5B60();
  swift_getTupleTypeMetadata2();
  v13 = sub_213CE6214();
  v14 = MEMORY[0x24BDF5428];
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v13);
  sub_213CE6178();
  sub_213CE6334();
  type metadata accessor for AccessoryView(255);
  swift_getTupleTypeMetadata2();
  v15 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v14, v15);
  sub_213CE6178();
  sub_213CE6334();
  swift_getTupleTypeMetadata2();
  v16 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v14, v16);
  sub_213CE6178();
  sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35F08);
  v17 = sub_213CE5B60();
  v18 = sub_213CE5B60();
  v19 = sub_213CE5B60();
  v20 = sub_213CE5B60();
  v71[0] = a10;
  v71[1] = MEMORY[0x24BDEDBB8];
  v21 = MEMORY[0x24BDED308];
  v22 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v17, v71);
  v23 = MEMORY[0x24BDECC60];
  v70[0] = v22;
  v70[1] = MEMORY[0x24BDECC60];
  v69[0] = MEMORY[0x2199C1EA8](v21, v18, v70);
  v69[1] = v23;
  v68[0] = MEMORY[0x2199C1EA8](v21, v19, v69);
  v68[1] = v23;
  v24 = MEMORY[0x2199C1EA8](v21, v20, v68);
  v56 = v20;
  v57 = v24;
  v25 = MEMORY[0x24BDF2F10];
  MEMORY[0x2199C1E48](255, &v56, MEMORY[0x24BDF2F10], 0);
  sub_213CE5B60();
  swift_getTupleTypeMetadata2();
  sub_213CE6214();
  sub_213CE6334();
  swift_getTupleTypeMetadata2();
  v26 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v14, v26);
  v27 = sub_213CE6190();
  v28 = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4700], v27);
  v56 = v27;
  v57 = v28;
  MEMORY[0x2199C1E48](255, &v56, v25, 0);
  v29 = sub_213CE5B60();
  v30 = sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35F10);
  v31 = sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35A40);
  v32 = sub_213CE5B60();
  v56 = v27;
  v57 = v28;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v34 = sub_213CD0344((unint64_t *)&qword_254D356A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  v67[0] = OpaqueTypeConformance2;
  v67[1] = v34;
  v66[0] = MEMORY[0x2199C1EA8](v21, v29, v67);
  v66[1] = MEMORY[0x24BDEDBB8];
  v35 = MEMORY[0x2199C1EA8](v21, v30, v66);
  v36 = sub_213CC0B2C(&qword_254D35F18, &qword_254D35F10, MEMORY[0x24BDEF370]);
  v65[0] = v35;
  v65[1] = v36;
  v37 = MEMORY[0x2199C1EA8](v21, v31, v65);
  v38 = sub_213CC0B2C(&qword_254D35AA8, &qword_254D35A40, MEMORY[0x24BDEB950]);
  v64[0] = v37;
  v64[1] = v38;
  MEMORY[0x2199C1EA8](v21, v32, v64);
  sub_213CE6160();
  v39 = sub_213CE5E18();
  v40 = MEMORY[0x24BDAC7A8](v39);
  MEMORY[0x24BDAC7A8](v40);
  v56 = v46;
  v57 = v45;
  v58 = v44;
  v59 = v43;
  v60 = v47;
  v61 = v48;
  v62 = v49;
  v63 = v42;
  type metadata accessor for PaymentItem();
}

uint64_t sub_213CDE760(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);

  sub_213CD9C10(a1, v4);
  *(_QWORD *)(v7 - 296) = MEMORY[0x2199C1EA8](MEMORY[0x24BDF43B0], v1);
  *(_QWORD *)(v7 - 288) = v6;
  v8 = MEMORY[0x2199C1EA8](MEMORY[0x24BDEF3E0], v5, v7 - 296);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v9(v2, v4, v5);
  v10 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v10(v4, v5);
  v11 = *(_QWORD *)(v7 - 368);
  sub_213CE61CC();
  v9(v4, v2, v5);
  *(_QWORD *)(v7 - 280) = v4;
  v12 = *(_QWORD *)(v7 - 352);
  v13 = *(_QWORD *)(v7 - 360);
  v14 = *(_QWORD *)(v7 - 344);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v13, v11, v14);
  *(_QWORD *)(v7 - 272) = v13;
  *(_QWORD *)(v7 - 312) = v5;
  *(_QWORD *)(v7 - 304) = v14;
  *(_QWORD *)(v7 - 328) = v8;
  *(_QWORD *)(v7 - 320) = sub_213CD0344((unint64_t *)&qword_254D35AC8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF4918], MEMORY[0x24BDF4900]);
  sub_213CC121C((uint64_t *)(v7 - 280), 2uLL, v7 - 312);
  v15 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  v15(v11, v14);
  v10(v2, v5);
  v15(v13, v14);
  return ((uint64_t (*)(uint64_t, uint64_t))v10)(v4, v5);
}

void sub_213CDE8D4()
{
  sub_213CE3E3C((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_213CDE124);
}

BOOL static PaymentItemContentStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PaymentItemContentStyle.hash(into:)()
{
  return sub_213CE643C();
}

uint64_t PaymentItemContentStyle.hashValue.getter()
{
  sub_213CE6430();
  sub_213CE643C();
  return sub_213CE6448();
}

void PaymentItem<>.init(icon:primaryLabel:secondaryLabel:chevronStyle:)()
{
  PaymentItem.init(icon:primaryLabel:secondaryLabel:chevronStyle:secondaryContent:secondaryContentStyle:alwaysCenterIconVertically:mainContentAction:)();
}

void PaymentItem<>.init(icon:primaryLabel:secondaryLabel:accessoryViewStyle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 a11)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD);
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  v17 = a5;
  v18 = a6;
  v16 = a4;
  v15 = a11;
  v12 = type metadata accessor for AccessoryViewStyle(0);
  MEMORY[0x24BDAC7A8](v12);
  sub_213CD4218(a7, (uint64_t)&v15 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
  v19 = 0;
  PaymentItem.init(icon:primaryLabel:secondaryLabel:accessoryViewStyle:secondaryContent:secondaryContentStyle:alwaysCenterIconVertically:mainContentAction:)();
}

uint64_t sub_213CDEAD0()
{
  uint64_t v0;

  return sub_213CD425C(v0, type metadata accessor for AccessoryViewStyle);
}

void PaymentItem<>.init(icon:primaryLabel:chevronStyle:)()
{
  PaymentItem.init(icon:primaryLabel:secondaryLabel:chevronStyle:secondaryContent:secondaryContentStyle:alwaysCenterIconVertically:mainContentAction:)();
}

void sub_213CDEB78(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

void PaymentItem<>.init(icon:primaryLabel:accessoryStyle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD);
  uint64_t v9;
  char v10;

  v9 = a4;
  v6 = type metadata accessor for AccessoryViewStyle(0);
  MEMORY[0x24BDAC7A8](v6);
  sub_213CD4218(a5, (uint64_t)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  v10 = 0;
  PaymentItem.init(icon:primaryLabel:secondaryLabel:accessoryViewStyle:secondaryContent:secondaryContentStyle:alwaysCenterIconVertically:mainContentAction:)();
}

uint64_t sub_213CDEC7C()
{
  uint64_t v0;

  return sub_213CD425C(v0, type metadata accessor for AccessoryViewStyle);
}

void sub_213CDECB0(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void PaymentItem<>.init(icon:primaryLabel:accessoryViewStyle:secondaryContent:secondaryContentStyle:alwaysCenterIconVertically:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8, uint64_t a9, uint64_t a10, uint64_t a11, __int128 a12)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(_QWORD);
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  v20 = a7;
  v21 = a4;
  v22 = a6;
  v18 = a2;
  v19 = a3;
  v17 = a12;
  v14 = type metadata accessor for AccessoryViewStyle(0);
  MEMORY[0x24BDAC7A8](v14);
  LOBYTE(a8) = *a8;
  sub_213CD4218(a5, (uint64_t)&v17 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v16);
  v23 = (char)a8;
  PaymentItem.init(icon:primaryLabel:secondaryLabel:accessoryViewStyle:secondaryContent:secondaryContentStyle:alwaysCenterIconVertically:mainContentAction:)();
}

uint64_t sub_213CDEDC0()
{
  uint64_t v0;

  return sub_213CD425C(v0, type metadata accessor for AccessoryViewStyle);
}

uint64_t sub_213CDEDF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t, uint64_t);
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  int *v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t KeyPath;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int *v98;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void (*v109)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  __int128 v118;
  uint64_t v119;
  uint64_t v120;

  v108 = a1;
  v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35FF8);
  v1 = MEMORY[0x24BDAC7A8](v105);
  v104 = (char *)&v100 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v106 = (uint64_t)&v100 - v4;
  MEMORY[0x24BDAC7A8](v3);
  v107 = (uint64_t)&v100 - v5;
  v6 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254D36000);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v100 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v112 = (uint64_t)&v100 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v113 = (uint64_t)&v100 - v12;
  v13 = type metadata accessor for AccessoryViewStyle(0);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v100 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v100 - v17;
  v19 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254D36008);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v100 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v100 - v24;
  v26 = MEMORY[0x24BDAC7A8](v23);
  v115 = (uint64_t)&v100 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v116 = (uint64_t)&v100 - v28;
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  v109 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v114 - 8) + 56);
  v109(v18, 1, 6, v114);
  sub_213CD4218((uint64_t)v18, (uint64_t)v16, type metadata accessor for AccessoryViewStyle);
  v29 = &v25[v19[28]];
  v120 = 0;
  sub_213CE6124();
  v30 = v118;
  *(_QWORD *)v29 = v117;
  *((_QWORD *)v29 + 1) = v30;
  v31 = &v25[v19[29]];
  *(_QWORD *)v31 = swift_getKeyPath();
  v31[8] = 0;
  v32 = &v25[v19[30]];
  *(_QWORD *)v32 = swift_getKeyPath();
  v32[8] = 0;
  v33 = (uint64_t *)&v25[v19[31]];
  *v33 = swift_getKeyPath();
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35F00);
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)&v25[v19[32]] = 0x4052800000000000;
  *(_QWORD *)&v25[v19[33]] = 0x402C000000000000;
  *(_QWORD *)&v25[v19[34]] = 0x4044000000000000;
  v34 = j___s7SwiftUI5ColorV13PaymentUIBaseE18itemIconForegroundACvgZ();
  ItemImageView.init(symbol:foregroundColor:)(0xD000000000000010, 0x8000000213CEDCB0, v34, &v117);
  v35 = v119;
  v36 = v118;
  *(_QWORD *)v25 = v117;
  *(_OWORD *)(v25 + 8) = v36;
  *((_QWORD *)v25 + 3) = v35;
  v37 = j___s7SwiftUI5ColorV13PaymentUIBaseE11primaryTextACvgZ();
  PaymentItemPrimaryLabel<>.init(title:text:textColor:)(0x6F742070696853, 0xE700000000000000, 0xD000000000000030, 0x8000000213CEDD90, v37, (uint64_t)(v25 + 32));
  v25[144] = 1;
  sub_213CD30E0((uint64_t)v16, (uint64_t)&v25[v19[23]]);
  v25[v19[24]] = 1;
  v25[v19[25]] = 0;
  v25[v19[26]] = 0;
  v38 = &v25[v19[27]];
  *(_QWORD *)v38 = 0;
  *((_QWORD *)v38 + 1) = 0;
  v39 = v115;
  sub_213CE3D5C((uint64_t)v25, v115, &qword_254D36008);
  sub_213CD425C((uint64_t)v18, type metadata accessor for AccessoryViewStyle);
  sub_213CE3D5C(v39, v116, &qword_254D36008);
  v40 = (uint64_t)v18;
  v41 = v109;
  v109(v18, 1, 6, v114);
  sub_213CD4218((uint64_t)v18, (uint64_t)v16, type metadata accessor for AccessoryViewStyle);
  v42 = &v22[v19[28]];
  v120 = 0;
  sub_213CE6124();
  v43 = v118;
  *(_QWORD *)v42 = v117;
  *((_QWORD *)v42 + 1) = v43;
  v44 = &v22[v19[29]];
  *(_QWORD *)v44 = swift_getKeyPath();
  v44[8] = 0;
  v45 = &v22[v19[30]];
  *(_QWORD *)v45 = swift_getKeyPath();
  v45[8] = 0;
  v46 = (uint64_t *)&v22[v19[31]];
  *v46 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)&v22[v19[32]] = 0x4052800000000000;
  *(_QWORD *)&v22[v19[33]] = 0x402C000000000000;
  *(_QWORD *)&v22[v19[34]] = 0x4044000000000000;
  v47 = j___s7SwiftUI5ColorV13PaymentUIBaseE18itemIconForegroundACvgZ();
  ItemImageView.init(symbol:foregroundColor:)(0x662E6E6F73726570, 0xEB000000006C6C69, v47, &v117);
  v48 = v119;
  v49 = v118;
  *(_QWORD *)v22 = v117;
  *(_OWORD *)(v22 + 8) = v49;
  *((_QWORD *)v22 + 3) = v48;
  v50 = j___s7SwiftUI5ColorV13PaymentUIBaseE11primaryTextACvgZ();
  PaymentItemPrimaryLabel<>.init(title:text:textColor:)(0x746361746E6F43, 0xE700000000000000, 0xD000000000000016, 0x8000000213CEDDD0, v50, (uint64_t)(v22 + 32));
  v22[144] = 1;
  sub_213CD30E0((uint64_t)v16, (uint64_t)&v22[v19[23]]);
  v51 = v19[24];
  v111 = v22;
  v22[v51] = 1;
  v22[v19[25]] = 0;
  v22[v19[26]] = 0;
  v52 = &v22[v19[27]];
  *(_QWORD *)v52 = 0;
  *((_QWORD *)v52 + 1) = 0;
  sub_213CE3D5C((uint64_t)v22, (uint64_t)v25, &qword_254D36008);
  sub_213CD425C((uint64_t)v18, type metadata accessor for AccessoryViewStyle);
  sub_213CE3D5C((uint64_t)v25, v115, &qword_254D36008);
  v41(v18, 1, 6, v114);
  sub_213CD4218((uint64_t)v18, (uint64_t)v16, type metadata accessor for AccessoryViewStyle);
  v53 = &v9[v6[28]];
  v120 = 0;
  sub_213CE6124();
  v54 = v118;
  *(_QWORD *)v53 = v117;
  *((_QWORD *)v53 + 1) = v54;
  v55 = &v9[v6[29]];
  *(_QWORD *)v55 = swift_getKeyPath();
  v55[8] = 0;
  v56 = &v9[v6[30]];
  *(_QWORD *)v56 = swift_getKeyPath();
  v56[8] = 0;
  v57 = (uint64_t *)&v9[v6[31]];
  *v57 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)&v9[v6[32]] = 0x4052800000000000;
  *(_QWORD *)&v9[v6[33]] = 0x402C000000000000;
  *(_QWORD *)&v9[v6[34]] = 0x4044000000000000;
  v58 = j___s7SwiftUI5ColorV13PaymentUIBaseE18itemIconForegroundACvgZ();
  v102 = 0xD000000000000012;
  ItemImageView.init(symbol:foregroundColor:)(0xD000000000000012, 0x8000000213CEDCD0, v58, &v117);
  v59 = v119;
  v60 = v118;
  *(_QWORD *)v9 = v117;
  *(_OWORD *)(v9 + 8) = v60;
  *((_QWORD *)v9 + 3) = v59;
  v61 = j___s7SwiftUI5ColorV13PaymentUIBaseE11primaryTextACvgZ();
  PaymentItemPrimaryLabel<>.init(title:text:textColor:)(0xD000000000000011, 0x8000000213CEDDF0, 0x78696C6674654ELL, 0xE700000000000000, v61, (uint64_t)(v9 + 32));
  v9[144] = 1;
  sub_213CD30E0((uint64_t)v16, (uint64_t)&v9[v6[23]]);
  v62 = &v9[v6[24]];
  *(_QWORD *)v62 = 0xD00000000000001BLL;
  *((_QWORD *)v62 + 1) = 0x8000000213CEDE10;
  v63 = MEMORY[0x24BEE4AF8];
  *((_QWORD *)v62 + 2) = 0;
  *((_QWORD *)v62 + 3) = v63;
  v9[v6[25]] = 0;
  v9[v6[26]] = 0;
  v64 = &v9[v6[27]];
  *(_QWORD *)v64 = 0;
  *((_QWORD *)v64 + 1) = 0;
  v65 = v112;
  sub_213CE3D5C((uint64_t)v9, v112, &qword_254D36000);
  sub_213CD425C((uint64_t)v18, type metadata accessor for AccessoryViewStyle);
  sub_213CE3D5C(v65, v113, &qword_254D36000);
  v103 = v18;
  v109(v18, 1, 6, v114);
  v66 = (uint64_t)v16;
  v101 = v16;
  sub_213CD4218(v40, (uint64_t)v16, type metadata accessor for AccessoryViewStyle);
  v67 = (uint64_t)v104;
  v68 = (int *)v105;
  v69 = &v104[*(int *)(v105 + 112)];
  v120 = 0;
  sub_213CE6124();
  v70 = v118;
  *(_QWORD *)v69 = v117;
  *((_QWORD *)v69 + 1) = v70;
  v71 = v67 + v68[29];
  *(_QWORD *)v71 = swift_getKeyPath();
  *(_BYTE *)(v71 + 8) = 0;
  v72 = v67 + v68[30];
  *(_QWORD *)v72 = swift_getKeyPath();
  *(_BYTE *)(v72 + 8) = 0;
  v73 = (uint64_t *)(v67 + v68[31]);
  *v73 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  v74 = v68;
  *(_QWORD *)(v67 + v68[32]) = 0x4052800000000000;
  *(_QWORD *)(v67 + v68[33]) = 0x402C000000000000;
  *(_QWORD *)(v67 + v68[34]) = 0x4044000000000000;
  v75 = j___s7SwiftUI5ColorV13PaymentUIBaseE18itemIconForegroundACvgZ();
  ItemImageView.init(symbol:foregroundColor:)(v102, 0x8000000213CEDCD0, v75, &v117);
  v76 = v119;
  v77 = v118;
  *(_QWORD *)v67 = v117;
  *(_OWORD *)(v67 + 8) = v77;
  *(_QWORD *)(v67 + 24) = v76;
  v78 = j___s7SwiftUI5ColorV13PaymentUIBaseE11primaryTextACvgZ();
  PaymentItemPrimaryLabel<>.init(title:text:textColor:)(0xD000000000000011, 0x8000000213CEDDF0, 0x78696C6674654ELL, 0xE700000000000000, v78, v67 + 32);
  *(_BYTE *)(v67 + 144) = 1;
  sub_213CD4218(v66, v67 + v68[23], type metadata accessor for AccessoryViewStyle);
  sub_213CE5F2C();
  v114 = sub_213CE5FB0();
  v80 = v79;
  LOBYTE(v46) = v81;
  v83 = v82;
  swift_release();
  v84 = v46 & 1;
  KeyPath = swift_getKeyPath();
  v86 = *sub_213CBC13C();
  v87 = swift_getKeyPath();
  v88 = swift_getKeyPath();
  swift_retain();
  sub_213CD425C((uint64_t)v101, type metadata accessor for AccessoryViewStyle);
  v89 = v67 + v74[24];
  *(_QWORD *)v89 = v114;
  *(_QWORD *)(v89 + 8) = v80;
  *(_QWORD *)(v89 + 16) = v84;
  *(_QWORD *)(v89 + 24) = v83;
  *(_QWORD *)(v89 + 32) = KeyPath;
  *(_QWORD *)(v89 + 40) = 0;
  *(_QWORD *)(v89 + 48) = v87;
  *(_QWORD *)(v89 + 56) = v86;
  *(_QWORD *)(v89 + 64) = v88;
  *(_QWORD *)(v89 + 72) = 4;
  *(_BYTE *)(v89 + 80) = 0;
  *(_BYTE *)(v67 + v74[25]) = 1;
  *(_BYTE *)(v67 + v74[26]) = 0;
  v90 = (_QWORD *)(v67 + v74[27]);
  *v90 = 0;
  v90[1] = 0;
  v91 = v106;
  sub_213CE3D5C(v67, v106, &qword_254D35FF8);
  sub_213CD425C((uint64_t)v103, type metadata accessor for AccessoryViewStyle);
  v92 = v107;
  sub_213CE3D5C(v91, v107, &qword_254D35FF8);
  sub_213CC3694(v116, (uint64_t)v25, &qword_254D36008);
  v93 = v115;
  v94 = (uint64_t)v111;
  sub_213CC3694(v115, (uint64_t)v111, &qword_254D36008);
  v96 = v112;
  v95 = v113;
  sub_213CC3694(v113, v112, &qword_254D36000);
  sub_213CC3694(v92, v91, &qword_254D35FF8);
  v97 = v108;
  sub_213CC3694((uint64_t)v25, v108, &qword_254D36008);
  v98 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_254D36010);
  sub_213CC3694(v94, v97 + v98[12], &qword_254D36008);
  sub_213CC3694(v96, v97 + v98[16], &qword_254D36000);
  sub_213CC3694(v91, v97 + v98[20], &qword_254D35FF8);
  sub_213CC3848(v92, &qword_254D35FF8);
  sub_213CC3848(v95, &qword_254D36000);
  sub_213CC3848(v93, &qword_254D36008);
  sub_213CC3848(v116, &qword_254D36008);
  sub_213CC3848(v91, &qword_254D35FF8);
  sub_213CC3848(v96, &qword_254D36000);
  sub_213CC3848((uint64_t)v111, &qword_254D36008);
  return sub_213CC3848((uint64_t)v25, &qword_254D36008);
}

uint64_t sub_213CDFA00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char v12;
  char *v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v27 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35F40);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35F48);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35F50);
  MEMORY[0x24BDAC7A8](v25);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35F58);
  MEMORY[0x24BDAC7A8](v26);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213CE5ED8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35F60);
  sub_213CC0B2C(&qword_254D35F68, &qword_254D35F60, MEMORY[0x24BDF4700]);
  sub_213CE5AAC();
  v12 = sub_213CE5EF0();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v7, v4, v1);
  v13 = &v7[*(int *)(v5 + 36)];
  *v13 = v12;
  *(_OWORD *)(v13 + 8) = 0u;
  *(_OWORD *)(v13 + 24) = 0u;
  v13[40] = 1;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_213CE61FC();
  sub_213CE5BC0();
  sub_213CC3694((uint64_t)v7, (uint64_t)v9, &qword_254D35F48);
  v14 = &v9[*(int *)(v25 + 36)];
  v15 = v33;
  *((_OWORD *)v14 + 4) = v32;
  *((_OWORD *)v14 + 5) = v15;
  *((_OWORD *)v14 + 6) = v34;
  v16 = v29;
  *(_OWORD *)v14 = v28;
  *((_OWORD *)v14 + 1) = v16;
  v17 = v31;
  *((_OWORD *)v14 + 2) = v30;
  *((_OWORD *)v14 + 3) = v17;
  sub_213CC3848((uint64_t)v7, &qword_254D35F48);
  v18 = *sub_213CBBE14();
  swift_retain();
  LOBYTE(v4) = sub_213CE5EF0();
  sub_213CC3694((uint64_t)v9, (uint64_t)v11, &qword_254D35F50);
  v19 = &v11[*(int *)(v26 + 36)];
  *(_QWORD *)v19 = v18;
  v19[8] = (char)v4;
  sub_213CC3848((uint64_t)v9, &qword_254D35F50);
  v20 = sub_213CE5B90();
  LOBYTE(v4) = sub_213CE5EF0();
  v21 = v27;
  sub_213CC3694((uint64_t)v11, v27, &qword_254D35F58);
  v22 = v21 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D35F70) + 36);
  *(_QWORD *)v22 = v20;
  *(_BYTE *)(v22 + 8) = (_BYTE)v4;
  return sub_213CC3848((uint64_t)v11, &qword_254D35F58);
}

uint64_t sub_213CDFD18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  *(_QWORD *)a1 = sub_213CE5D40();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35FC8);
  return sub_213CDFD5C(a1 + *(int *)(v2 + 44));
}

uint64_t sub_213CDFD5C@<X0>(uint64_t a1@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t KeyPath;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v47 = a1;
  v1 = sub_213CE5D34();
  v44 = *(_QWORD *)(v1 - 8);
  v45 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v43 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35FD0);
  v3 = MEMORY[0x24BDAC7A8](v42);
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v46 = (uint64_t)&v40 - v6;
  v7 = sub_213CE5B48();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35FD8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v41 = (uint64_t)&v40 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35F90);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v40 - v20;
  *(_QWORD *)v21 = sub_213CE5D40();
  *((_QWORD *)v21 + 1) = 0;
  v21[16] = 1;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35F38);
  sub_213CDEDF4((uint64_t)&v21[*(int *)(v22 + 44)]);
  *(_QWORD *)v19 = sub_213CE5D40();
  *((_QWORD *)v19 + 1) = 0;
  v19[16] = 1;
  sub_213CDEDF4((uint64_t)&v19[*(int *)(v22 + 44)]);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BDED118], v7);
  v24 = (uint64_t *)&v14[*(int *)(v11 + 36)];
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35FE0);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v24 + *(int *)(v25 + 28), v10, v7);
  *v24 = KeyPath;
  v40 = v14;
  sub_213CC3694((uint64_t)v19, (uint64_t)v14, &qword_254D35F90);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_213CC3848((uint64_t)v19, &qword_254D35F90);
  v26 = v41;
  sub_213CE3D5C((uint64_t)v14, v41, &qword_254D35FD8);
  *(_QWORD *)v19 = sub_213CE5D40();
  *((_QWORD *)v19 + 1) = 0;
  v19[16] = 1;
  sub_213CDEDF4((uint64_t)&v19[*(int *)(v22 + 44)]);
  v27 = swift_getKeyPath();
  v29 = v43;
  v28 = v44;
  v30 = v45;
  (*(void (**)(char *, _QWORD, uint64_t))(v44 + 104))(v43, *MEMORY[0x24BDEEE30], v45);
  v31 = (uint64_t *)&v5[*(int *)(v42 + 36)];
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35FE8);
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))((char *)v31 + *(int *)(v32 + 28), v29, v30);
  *v31 = v27;
  sub_213CC3694((uint64_t)v19, (uint64_t)v5, &qword_254D35F90);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v30);
  sub_213CC3848((uint64_t)v19, &qword_254D35F90);
  v33 = v46;
  sub_213CE3D5C((uint64_t)v5, v46, &qword_254D35FD0);
  sub_213CC3694((uint64_t)v21, (uint64_t)v19, &qword_254D35F90);
  v34 = v26;
  v35 = v26;
  v36 = (uint64_t)v40;
  sub_213CC3694(v35, (uint64_t)v40, &qword_254D35FD8);
  sub_213CC3694(v33, (uint64_t)v5, &qword_254D35FD0);
  v37 = v47;
  sub_213CC3694((uint64_t)v19, v47, &qword_254D35F90);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35FF0);
  sub_213CC3694(v36, v37 + *(int *)(v38 + 48), &qword_254D35FD8);
  sub_213CC3694((uint64_t)v5, v37 + *(int *)(v38 + 64), &qword_254D35FD0);
  sub_213CC3848(v33, &qword_254D35FD0);
  sub_213CC3848(v34, &qword_254D35FD8);
  sub_213CC3848((uint64_t)v21, &qword_254D35F90);
  sub_213CC3848((uint64_t)v5, &qword_254D35FD0);
  sub_213CC3848(v36, &qword_254D35FD8);
  return sub_213CC3848((uint64_t)v19, &qword_254D35F90);
}

uint64_t sub_213CE01D0()
{
  return sub_213CE5C2C();
}

uint64_t sub_213CE01F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213CE0238(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDED130], MEMORY[0x24BDEE080]);
}

uint64_t sub_213CE0204()
{
  return sub_213CE5BFC();
}

uint64_t sub_213CE0224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_213CE0238(a1, a2, a3, a4, (uint64_t (*)(_QWORD))MEMORY[0x24BDEEEA0], MEMORY[0x24BDEDF98]);
}

uint64_t sub_213CE0238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD), uint64_t (*a6)(char *))
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  v8 = a5(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v13 - v9, a1);
  return a6(v10);
}

uint64_t sub_213CE02B4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_213CE02F4()
{
  unint64_t result;

  result = qword_254D35F78;
  if (!qword_254D35F78)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for PaymentItemContentStyle, &type metadata for PaymentItemContentStyle);
    atomic_store(result, (unint64_t *)&qword_254D35F78);
  }
  return result;
}

unint64_t sub_213CE033C()
{
  unint64_t result;

  result = qword_254D35F80;
  if (!qword_254D35F80)
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE8DA8, &type metadata for PaymentItem_Previews);
    atomic_store(result, (unint64_t *)&qword_254D35F80);
  }
  return result;
}

uint64_t sub_213CE0380()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213CE0394()
{
  sub_213CE3598();
  return sub_213CE5B84();
}

uint64_t sub_213CE03CC()
{
  sub_213CE3598();
  return sub_213CE5B78();
}

uint64_t sub_213CE0404()
{
  return swift_allocateGenericValueMetadata();
}

void sub_213CE040C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    swift_checkMetadataState();
    if (v1 <= 0x3F)
    {
      sub_213CE6334();
      if (v2 <= 0x3F)
      {
        type metadata accessor for AccessoryViewStyle(319);
        if (v3 <= 0x3F)
        {
          sub_213CE6334();
          if (v4 <= 0x3F)
          {
            sub_213CE2C90();
            if (v5 <= 0x3F)
              swift_initStructMetadata();
          }
        }
      }
    }
  }
}

uint64_t *sub_213CE054C(uint64_t *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  size_t v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  size_t v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  int v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  char *v35;
  size_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  unint64_t v41;
  _QWORD *v42;
  unint64_t v43;
  uint64_t v44;
  void (*v45)(unint64_t, unint64_t, uint64_t);
  char *v46;
  const void *v47;
  size_t v48;
  char *v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  char v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  char v62;
  _QWORD *v63;
  _QWORD *v64;
  unsigned int v65;
  uint64_t v66;
  char v67;
  _QWORD *v68;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD *v71;
  uint64_t v73;
  uint64_t v74;
  size_t __n;
  size_t v76;
  size_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v96;
  uint64_t v97;

  v84 = a3[2];
  v4 = *(_QWORD *)(v84 - 8);
  v93 = *(_QWORD *)(v4 + 64);
  v86 = a3[3];
  v5 = *(_QWORD *)(v86 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v96 = v6;
  v85 = v5;
  v97 = *(_QWORD *)(v5 + 64);
  v87 = a3[4];
  v7 = *(_QWORD *)(v87 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  LODWORD(v5) = *(_DWORD *)(v7 + 84);
  v83 = v7;
  v9 = *(_QWORD *)(v7 + 64);
  if ((_DWORD)v5)
    v10 = v9;
  else
    v10 = v9 + 1;
  v11 = sub_213CE5F8C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_DWORD *)(v12 + 80);
  v88 = *(_DWORD *)(v12 + 84);
  v81 = v12;
  v82 = v11;
  v91 = *(_QWORD *)(v12 + 64);
  v90 = a3[5];
  v14 = *(_QWORD *)(v90 - 8);
  v15 = *(_DWORD *)(v14 + 80);
  LODWORD(v12) = *(_DWORD *)(v14 + 84);
  v16 = v15;
  v89 = v14;
  v17 = *(_QWORD *)(v14 + 64);
  if ((_DWORD)v12)
    v18 = v17;
  else
    v18 = v17 + 1;
  v19 = sub_213CE5AB8();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(_DWORD *)(v20 + 80);
  v22 = v21 & 0xF8;
  if (*(_QWORD *)(v20 + 64) <= 8uLL)
    v23 = 8;
  else
    v23 = *(_QWORD *)(v20 + 64);
  v24 = v6 | *(_DWORD *)(v4 + 80) & 0xF8 | v22 | v8 | v13 | v15;
  v25 = (v8 | v6 | v13 | v15 | v21 | *(_DWORD *)(v4 + 80)) & 0x100000;
  v26 = v24 <= 7 && v25 == 0;
  if (!v26
    || (v27 = v93 + v6,
        v28 = v13 | 7,
        v74 = v13 + 16,
        ((((((v23
            + 8
            + ((v22
              + 16
              + (((((((((v74 & ~(unint64_t)v13)
                      + v91
                      + v16
                      + ((v28
                        + v10
                        + ((v97 + v8 + ((v93 + v96) & ~v96)) & ~(unint64_t)v8)) & ~v28)) & ~v16)
                    + v18
                    + 9) & 0xFFFFFFFFFFFFFFF8)
                  + 23) & 0xFFFFFFFFFFFFFFF8)
                + 39) & 0xFFFFFFFFFFFFFFF8)) & ~v22 & 0xFFFFFFFFFFFFFFF8)) & 0xFFFFFFFFFFFFFFF8)
          + 15) & 0xFFFFFFFFFFFFFFF8)
        + 15) & 0xFFFFFFFFFFFFFFF8)
      + 8 > 0x18))
  {
    v37 = *a2;
    *a1 = *a2;
    v38 = v37 + (((v24 | 7) + 16) & ~(unint64_t)(v24 | 7));
    swift_retain();
    return (uint64_t *)v38;
  }
  v29 = v4;
  __n = v10;
  v76 = ((v13 + 16) & ~(unint64_t)v13) + v91;
  v30 = v16;
  v77 = v18;
  v78 = v22 + 16;
  v79 = ~v22 & 0xFFFFFFFFFFFFFFF8;
  v80 = v23 + 8;
  v92 = *(_QWORD *)(v19 - 8);
  v73 = v19;
  v94 = v23;
  v31 = ~v28;
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v29 + 16))(a1, a2, v84);
  v32 = ((unint64_t)a1 + v27) & ~v96;
  v33 = ((unint64_t)a2 + v27) & ~v96;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v85 + 16))(v32, v33, v86);
  v34 = (void *)((v32 + v97 + v8) & ~(unint64_t)v8);
  v35 = (char *)((v33 + v97 + v8) & ~(unint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v83 + 48))(v35, 1, v87))
  {
    v36 = __n;
    memcpy(v34, v35, __n);
  }
  else
  {
    (*(void (**)(void *, char *, uint64_t))(v83 + 16))(v34, v35, v87);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v83 + 56))(v34, 0, 1, v87);
    v36 = __n;
  }
  v39 = ~(unint64_t)v13;
  v40 = (_QWORD *)(((unint64_t)v34 + v36 + v28) & v31);
  v41 = (unint64_t)&v35[v36 + v28];
  v42 = (_QWORD *)(v41 & v31);
  if ((v88 & 0x80000000) == 0)
  {
    v43 = *(_QWORD *)((v41 & v31) + 8);
    if (v43 >= 0xFFFFFFFF)
      LODWORD(v43) = -1;
    v44 = ~v30;
    if ((_DWORD)v43 != -1)
      goto LABEL_24;
LABEL_26:
    *v40 = *v42;
    v40[1] = v42[1];
    v45 = *(void (**)(unint64_t, unint64_t, uint64_t))(v81 + 16);
    swift_bridgeObjectRetain();
    v45(((unint64_t)v40 + v74) & v39, ((unint64_t)v42 + v74) & v39, v82);
    goto LABEL_27;
  }
  v44 = ~v30;
  if (!(*(unsigned int (**)(unint64_t))(v81 + 48))(((unint64_t)v42 + v74) & v39))
    goto LABEL_26;
LABEL_24:
  memcpy(v40, v42, v76);
LABEL_27:
  v46 = (char *)(((unint64_t)v40 + v76 + v30) & v44);
  v47 = (const void *)(((unint64_t)v42 + v76 + v30) & v44);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v89 + 48))(v47, 1, v90))
  {
    v48 = v77;
    memcpy(v46, v47, v77);
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v89 + 16))(v46, v47, v90);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v89 + 56))(v46, 0, 1, v90);
    v48 = v77;
  }
  v49 = &v46[v48];
  *v49 = *((_BYTE *)v47 + v48);
  v49[1] = *((_BYTE *)v47 + v48 + 1);
  v50 = (unint64_t)&v46[v48 + 9] & 0xFFFFFFFFFFFFFFF8;
  v51 = ((unint64_t)v47 + v48 + 9) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v51 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v50 = *(_OWORD *)v51;
  }
  else
  {
    v52 = *(_QWORD *)(v51 + 8);
    *(_QWORD *)v50 = *(_QWORD *)v51;
    *(_QWORD *)(v50 + 8) = v52;
    swift_retain();
  }
  v53 = (_QWORD *)((v50 + 23) & 0xFFFFFFFFFFFFFFF8);
  v54 = (_QWORD *)((v51 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v53 = *v54;
  v53[1] = v54[1];
  v55 = ((unint64_t)v53 + 23) & 0xFFFFFFFFFFFFFFF8;
  v56 = ((unint64_t)v54 + 23) & 0xFFFFFFFFFFFFFFF8;
  v57 = *(_QWORD *)v56;
  v58 = *(_BYTE *)(v56 + 8);
  swift_retain();
  sub_213CC5008(v57, v58);
  *(_QWORD *)v55 = v57;
  *(_BYTE *)(v55 + 8) = v58;
  v59 = ((unint64_t)v53 + 39) & 0xFFFFFFFFFFFFFFF8;
  v60 = ((unint64_t)v54 + 39) & 0xFFFFFFFFFFFFFFF8;
  v61 = *(_QWORD *)v60;
  v62 = *(_BYTE *)(v60 + 8);
  sub_213CC5008(*(_QWORD *)v60, v62);
  *(_QWORD *)v59 = v61;
  *(_BYTE *)(v59 + 8) = v62;
  v63 = (_QWORD *)((v78 + v59) & v79);
  v64 = (_QWORD *)((v78 + v60) & v79);
  v65 = *((unsigned __int8 *)v64 + v94);
  if (v65 >= 2)
  {
    if (v94 <= 3)
      v66 = v94;
    else
      v66 = 4;
    __asm { BR              X12 }
  }
  if (v65 == 1)
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v92 + 16))((v78 + v59) & v79, (v78 + v60) & v79, v73);
    v67 = 1;
  }
  else
  {
    *v63 = *v64;
    swift_retain();
    v67 = 0;
  }
  *((_BYTE *)v63 + v94) = v67;
  v68 = (_QWORD *)(((unint64_t)v63 + v80) & 0xFFFFFFFFFFFFFFF8);
  v69 = (_QWORD *)(((unint64_t)v64 + v80) & 0xFFFFFFFFFFFFFFF8);
  *v68 = *v69;
  v70 = (_QWORD *)(((unint64_t)v68 + 15) & 0xFFFFFFFFFFFFF8);
  v71 = (_QWORD *)(((unint64_t)v69 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v70 = *v71;
  *(_QWORD *)(((unint64_t)v70 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v71 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_213CE0B70(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
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
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unsigned int v39;
  uint64_t v40;

  v4 = *(_QWORD *)(a2[2] - 8);
  (*(void (**)(void))(v4 + 8))();
  v5 = *(_QWORD *)(v4 + 64) + a1;
  v6 = *(_QWORD *)(a2[3] - 8);
  v7 = (v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t))(v6 + 8))(v7);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a2[4];
  v10 = *(_QWORD *)(v9 - 8);
  v11 = (v7 + v8 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9))
    (*(void (**)(unint64_t, uint64_t))(v10 + 8))(v11, v9);
  v12 = *(_DWORD *)(v10 + 84);
  v13 = *(_QWORD *)(v10 + 64);
  v14 = sub_213CE5F8C();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(unsigned __int8 *)(v15 + 80);
  v17 = v16 | 7;
  v18 = v13 + v11;
  if (!v12)
    ++v18;
  v19 = v18 + v17;
  v20 = v19 & ~v17;
  v21 = ~v16;
  v22 = v16 + 16;
  v23 = (v16 + 16) & ~v16;
  v24 = *(_QWORD *)(v15 + 64);
  if ((*(_DWORD *)(v15 + 84) & 0x80000000) != 0)
  {
    v26 = v23 + v24;
    if (!(*(unsigned int (**)(uint64_t))(v15 + 48))((v22 + v20) & v21))
    {
LABEL_9:
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))((v22 + v20) & v21, v14);
    }
  }
  else
  {
    v25 = *(_QWORD *)((v19 & ~v17) + 8);
    if (v25 >= 0xFFFFFFFF)
      LODWORD(v25) = -1;
    v26 = v23 + v24;
    if ((_DWORD)v25 == -1)
      goto LABEL_9;
  }
  v27 = v26 + v20;
  v28 = a2[5];
  v29 = *(_QWORD *)(v28 - 8);
  v30 = (v27 + *(unsigned __int8 *)(v29 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v29 + 48))(v30, 1, v28))
    (*(void (**)(unint64_t, uint64_t))(v29 + 8))(v30, v28);
  v31 = v30 + *(_QWORD *)(v29 + 64);
  if (!*(_DWORD *)(v29 + 84))
    ++v31;
  v32 = (_QWORD *)((v31 + 9) & 0xFFFFFFFFFFFFFFF8);
  if (*v32 >= 0xFFFFFFFFuLL)
    swift_release();
  v33 = ((unint64_t)v32 + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  sub_213CC5044(*(_QWORD *)((v33 + 23) & 0xFFFFFFFFFFFFFFF8), *(_BYTE *)(((v33 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
  v34 = (v33 + 39) & 0xFFFFFFFFFFFFFFF8;
  sub_213CC5044(*(_QWORD *)v34, *(_BYTE *)(v34 + 8));
  v35 = *(_QWORD *)(sub_213CE5AB8() - 8);
  v36 = *(_DWORD *)(v35 + 80) & 0xF8 | 7;
  v37 = (v34 + v36 + 9) & ~v36;
  v38 = *(_QWORD *)(v35 + 64);
  if (v38 <= 8)
    v38 = 8;
  v39 = *(unsigned __int8 *)(v37 + v38);
  if (v39 >= 2)
  {
    if (v38 <= 3)
      v40 = v38;
    else
      v40 = 4;
    __asm { BR              X14 }
  }
  if (v39 == 1)
    return (*(uint64_t (**)(void))(v35 + 8))();
  else
    return swift_release();
}

uint64_t sub_213CE0E44(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  void *v17;
  char *v18;
  int v19;
  uint64_t v20;
  size_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  size_t v34;
  void (*v35)(unint64_t, unint64_t, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  int v42;
  size_t v43;
  size_t v44;
  size_t v45;
  char *v46;
  char *v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  char v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  _QWORD *v67;
  _QWORD *v68;
  uint64_t v69;
  unsigned int v70;
  uint64_t v71;
  char v72;
  _QWORD *v73;
  _QWORD *v74;
  _QWORD *v75;
  _QWORD *v76;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = a3[4];
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(unsigned __int8 *)(v14 + 80);
  v16 = v12 + v15;
  v17 = (void *)((v16 + v10) & ~v15);
  v18 = (char *)((v16 + v11) & ~v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v18, 1, v13))
  {
    v19 = *(_DWORD *)(v14 + 84);
    v20 = *(_QWORD *)(v14 + 64);
    if (v19)
      v21 = *(_QWORD *)(v14 + 64);
    else
      v21 = v20 + 1;
    memcpy(v17, v18, v21);
  }
  else
  {
    (*(void (**)(void *, char *, uint64_t))(v14 + 16))(v17, v18, v13);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
    v19 = *(_DWORD *)(v14 + 84);
    v20 = *(_QWORD *)(v14 + 64);
  }
  if (!v19)
    ++v20;
  v22 = sub_213CE5F8C();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(unsigned __int8 *)(v23 + 80);
  v25 = (v24 | 7) + v20;
  v26 = (_QWORD *)(((unint64_t)v17 + v25) & ~(v24 | 7));
  v27 = (unint64_t)&v18[v25];
  v28 = (_QWORD *)(v27 & ~(v24 | 7));
  v29 = ~v24;
  v30 = v24 + 16;
  v31 = (v24 + 16) & ~v24;
  v32 = *(_QWORD *)(v23 + 64);
  if ((*(_DWORD *)(v23 + 84) & 0x80000000) != 0)
  {
    v34 = v31 + v32;
    if ((*(unsigned int (**)(unint64_t))(v23 + 48))(((unint64_t)v28 + v30) & v29))
    {
LABEL_13:
      memcpy(v26, v28, v34);
      goto LABEL_16;
    }
  }
  else
  {
    v33 = *(_QWORD *)((v27 & ~(v24 | 7)) + 8);
    if (v33 >= 0xFFFFFFFF)
      LODWORD(v33) = -1;
    v34 = v31 + v32;
    if ((_DWORD)v33 != -1)
      goto LABEL_13;
  }
  *v26 = *v28;
  v26[1] = v28[1];
  v35 = *(void (**)(unint64_t, unint64_t, uint64_t))(v23 + 16);
  swift_bridgeObjectRetain();
  v35(((unint64_t)v26 + v30) & v29, ((unint64_t)v28 + v30) & v29, v22);
LABEL_16:
  v36 = (char *)v28 + v34;
  v37 = a3[5];
  v38 = *(_QWORD *)(v37 - 8);
  v39 = *(unsigned __int8 *)(v38 + 80);
  v40 = (char *)(((unint64_t)v26 + v34 + v39) & ~v39);
  v41 = (char *)((unint64_t)&v36[v39] & ~v39);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v41, 1, v37))
  {
    v42 = *(_DWORD *)(v38 + 84);
    v43 = *(_QWORD *)(v38 + 64);
    if (v42)
      v44 = v43;
    else
      v44 = v43 + 1;
    memcpy(v40, v41, v44);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v40, v41, v37);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v40, 0, 1, v37);
    v42 = *(_DWORD *)(v38 + 84);
    v43 = *(_QWORD *)(v38 + 64);
  }
  if (v42)
    v45 = v43;
  else
    v45 = v43 + 1;
  v46 = &v40[v45];
  v47 = &v41[v45];
  *v46 = *v47;
  v46[1] = v47[1];
  v48 = (unint64_t)(v46 + 9) & 0xFFFFFFFFFFFFFFF8;
  v49 = (unint64_t)(v47 + 9) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v49 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v48 = *(_OWORD *)v49;
  }
  else
  {
    v50 = *(_QWORD *)(v49 + 8);
    *(_QWORD *)v48 = *(_QWORD *)v49;
    *(_QWORD *)(v48 + 8) = v50;
    swift_retain();
  }
  v51 = (_QWORD *)((v48 + 23) & 0xFFFFFFFFFFFFFFF8);
  v52 = (_QWORD *)((v49 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v51 = *v52;
  v51[1] = v52[1];
  v53 = ((unint64_t)v51 + 23) & 0xFFFFFFFFFFFFFFF8;
  v54 = ((unint64_t)v52 + 23) & 0xFFFFFFFFFFFFFFF8;
  v55 = *(_QWORD *)v54;
  v56 = *(_BYTE *)(v54 + 8);
  swift_retain();
  sub_213CC5008(v55, v56);
  *(_QWORD *)v53 = v55;
  *(_BYTE *)(v53 + 8) = v56;
  v57 = ((unint64_t)v51 + 39) & 0xFFFFFFFFFFFFFFF8;
  v58 = ((unint64_t)v52 + 39) & 0xFFFFFFFFFFFFFFF8;
  v59 = *(_QWORD *)v58;
  v60 = *(_BYTE *)(v58 + 8);
  sub_213CC5008(*(_QWORD *)v58, v60);
  *(_QWORD *)v57 = v59;
  *(_BYTE *)(v57 + 8) = v60;
  v61 = sub_213CE5AB8();
  v62 = *(_QWORD *)(v61 - 8);
  v63 = *(_DWORD *)(v62 + 80) & 0xF8;
  v64 = v63 + 16;
  v65 = v63 + 16 + v57;
  v66 = ~v63 & 0xFFFFFFFFFFFFFFF8;
  v67 = (_QWORD *)(v65 & v66);
  v68 = (_QWORD *)((v64 + v58) & v66);
  if (*(_QWORD *)(v62 + 64) <= 8uLL)
    v69 = 8;
  else
    v69 = *(_QWORD *)(v62 + 64);
  v70 = *((unsigned __int8 *)v68 + v69);
  if (v70 >= 2)
  {
    if (v69 <= 3)
      v71 = v69;
    else
      v71 = 4;
    __asm { BR              X13 }
  }
  if (v70 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v62 + 16))(v67, v68, v61);
    v72 = 1;
  }
  else
  {
    *v67 = *v68;
    swift_retain();
    v72 = 0;
  }
  *((_BYTE *)v67 + v69) = v72;
  v73 = (_QWORD *)(((unint64_t)v67 + v69 + 8) & 0xFFFFFFFFFFFFFFF8);
  v74 = (_QWORD *)(((unint64_t)v68 + v69 + 8) & 0xFFFFFFFFFFFFFFF8);
  *v73 = *v74;
  v75 = (_QWORD *)(((unint64_t)v73 + 15) & 0xFFFFFFFFFFFFFFF8);
  v76 = (_QWORD *)(((unint64_t)v74 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v75 = *v76;
  *(_QWORD *)(((unint64_t)v75 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v76 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_213CE12B8(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  void *v17;
  void *v18;
  uint64_t (*v19)(void *, uint64_t, uint64_t);
  int v20;
  size_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  size_t v32;
  unint64_t v33;
  int v34;
  uint64_t (*v35)(unint64_t, uint64_t, uint64_t);
  int v36;
  unint64_t v37;
  unint64_t v38;
  void (*v39)(unint64_t, unint64_t, uint64_t);
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t (*v46)(char *, uint64_t, uint64_t);
  int v47;
  int v48;
  size_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  _QWORD *v53;
  unint64_t *v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  _QWORD *v58;
  _QWORD *v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  char v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unsigned int v82;
  uint64_t v83;
  unsigned int v84;
  uint64_t v85;
  _QWORD *v86;
  _QWORD *v87;
  _QWORD *v88;
  _QWORD *v89;
  _QWORD *v91;
  uint64_t v92;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(a3[3] - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v11, v12);
  v91 = a3;
  v13 = a3[4];
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(unsigned __int8 *)(v14 + 80);
  v16 = *(_QWORD *)(v8 + 64) + v15;
  v17 = (void *)((v16 + v11) & ~v15);
  v18 = (void *)((v16 + v12) & ~v15);
  v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  LODWORD(v12) = v19(v17, 1, v13);
  v20 = v19(v18, 1, v13);
  if ((_DWORD)v12)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v17, v18, v13);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 24))(v17, v18, v13);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v17, v13);
  }
  if (*(_DWORD *)(v14 + 84))
    v21 = *(_QWORD *)(v14 + 64);
  else
    v21 = *(_QWORD *)(v14 + 64) + 1;
  memcpy(v17, v18, v21);
LABEL_10:
  v92 = a1;
  if (*(_DWORD *)(v14 + 84))
    v22 = *(_QWORD *)(v14 + 64);
  else
    v22 = *(_QWORD *)(v14 + 64) + 1;
  v23 = sub_213CE5F8C();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(unsigned __int8 *)(v24 + 80);
  v26 = (v25 | 7) + v22;
  v27 = (_QWORD *)(((unint64_t)v17 + v26) & ~(v25 | 7));
  v28 = (_QWORD *)(((unint64_t)v18 + v26) & ~(v25 | 7));
  v29 = *(unsigned int *)(v24 + 84);
  v30 = ~v25;
  v31 = v25 + 16;
  v32 = ((v25 + 16) & ~v25) + *(_QWORD *)(v24 + 64);
  if ((v29 & 0x80000000) == 0)
  {
    v33 = v28[1];
    if (v33 >= 0xFFFFFFFF)
      LODWORD(v33) = -1;
    v34 = v33 + 1;
    if (v27[1] > 0xFFFFFFFEuLL)
      goto LABEL_17;
LABEL_20:
    if (v34)
      goto LABEL_21;
    *v27 = *v28;
    v27[1] = v28[1];
    v37 = ((unint64_t)v27 + v31) & v30;
    v38 = ((unint64_t)v28 + v31) & v30;
    v39 = *(void (**)(unint64_t, unint64_t, uint64_t))(v24 + 16);
    swift_bridgeObjectRetain();
    v39(v37, v38, v23);
    goto LABEL_24;
  }
  v35 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v24 + 48);
  v36 = v35(((unint64_t)v27 + v31) & v30, *(unsigned int *)(v24 + 84), v23);
  v34 = v35(((unint64_t)v28 + v31) & v30, v29, v23);
  if (v36)
    goto LABEL_20;
LABEL_17:
  if (v34)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(unint64_t, uint64_t))(v24 + 8))(((unint64_t)v27 + v31) & v30, v23);
LABEL_21:
    memcpy(v27, v28, v32);
    goto LABEL_24;
  }
  *v27 = *v28;
  v27[1] = v28[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v24 + 24))(((unint64_t)v27 + v31) & v30, ((unint64_t)v28 + v31) & v30, v23);
LABEL_24:
  v40 = (char *)v28 + v32;
  v41 = v91[5];
  v42 = *(_QWORD *)(v41 - 8);
  v43 = *(unsigned __int8 *)(v42 + 80);
  v44 = (char *)(((unint64_t)v27 + v32 + v43) & ~v43);
  v45 = (char *)((unint64_t)&v40[v43] & ~v43);
  v46 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v42 + 48);
  v47 = v46(v44, 1, v41);
  v48 = v46(v45, 1, v41);
  if (v47)
  {
    if (!v48)
    {
      (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v44, v45, v41);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v44, 0, 1, v41);
      goto LABEL_33;
    }
  }
  else
  {
    if (!v48)
    {
      (*(void (**)(char *, char *, uint64_t))(v42 + 24))(v44, v45, v41);
      goto LABEL_33;
    }
    (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v41);
  }
  if (*(_DWORD *)(v42 + 84))
    v49 = *(_QWORD *)(v42 + 64);
  else
    v49 = *(_QWORD *)(v42 + 64) + 1;
  memcpy(v44, v45, v49);
LABEL_33:
  if (*(_DWORD *)(v42 + 84))
    v50 = *(_QWORD *)(v42 + 64);
  else
    v50 = *(_QWORD *)(v42 + 64) + 1;
  v51 = &v44[v50];
  v52 = &v45[v50];
  *v51 = *v52;
  v51[1] = v52[1];
  v53 = (_QWORD *)((unint64_t)(v51 + 9) & 0xFFFFFFFFFFFFFFF8);
  v54 = (unint64_t *)((unint64_t)(v52 + 9) & 0xFFFFFFFFFFFFFFF8);
  v55 = *v54;
  if (*v53 < 0xFFFFFFFFuLL)
  {
    if (v55 >= 0xFFFFFFFF)
    {
      v57 = v54[1];
      *v53 = v55;
      v53[1] = v57;
      swift_retain();
      goto LABEL_43;
    }
  }
  else
  {
    if (v55 >= 0xFFFFFFFF)
    {
      v56 = v54[1];
      *v53 = v55;
      v53[1] = v56;
      swift_retain();
      swift_release();
      goto LABEL_43;
    }
    swift_release();
  }
  *(_OWORD *)v53 = *(_OWORD *)v54;
LABEL_43:
  v58 = (_QWORD *)(((unint64_t)v53 + 23) & 0xFFFFFFFFFFFFFFF8);
  v59 = (_QWORD *)(((unint64_t)v54 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v58 = *v59;
  v58[1] = v59[1];
  swift_retain();
  swift_release();
  v60 = ((unint64_t)v58 + 23) & 0xFFFFFFFFFFFFFFF8;
  v61 = ((unint64_t)v59 + 23) & 0xFFFFFFFFFFFFFFF8;
  v62 = *(_QWORD *)v61;
  v63 = *(_BYTE *)(v61 + 8);
  sub_213CC5008(*(_QWORD *)v61, v63);
  v64 = *(_QWORD *)v60;
  v65 = *(_BYTE *)(v60 + 8);
  *(_QWORD *)v60 = v62;
  *(_BYTE *)(v60 + 8) = v63;
  sub_213CC5044(v64, v65);
  v66 = ((unint64_t)v58 + 39) & 0xFFFFFFFFFFFFFFF8;
  v67 = ((unint64_t)v59 + 39) & 0xFFFFFFFFFFFFFFF8;
  v68 = *(_QWORD *)v67;
  v69 = *(_BYTE *)(v67 + 8);
  sub_213CC5008(*(_QWORD *)v67, v69);
  v70 = *(_QWORD *)v66;
  v71 = *(_BYTE *)(v66 + 8);
  *(_QWORD *)v66 = v68;
  *(_BYTE *)(v66 + 8) = v69;
  sub_213CC5044(v70, v71);
  v72 = sub_213CE5AB8();
  v73 = *(_QWORD *)(v72 - 8);
  v74 = *(_DWORD *)(v73 + 80) & 0xF8;
  v75 = v74 + 16;
  v76 = v74 + 16 + v66;
  v77 = ~v74 & 0xFFFFFFFFFFFFFFF8;
  v78 = v76 & v77;
  v79 = (v75 + v67) & v77;
  if (*(_QWORD *)(v73 + 64) <= 8uLL)
    v80 = 8;
  else
    v80 = *(_QWORD *)(v73 + 64);
  if (v78 != v79)
  {
    v81 = v72;
    v82 = *(unsigned __int8 *)(v78 + v80);
    if (v82 >= 2)
    {
      if (v80 <= 3)
        v83 = v80;
      else
        v83 = 4;
      __asm { BR              X12 }
    }
    if (v82 == 1)
      (*(void (**)(unint64_t, uint64_t))(v73 + 8))(v78, v72);
    else
      swift_release();
    v84 = *(unsigned __int8 *)(v79 + v80);
    if (v84 >= 2)
    {
      if (v80 <= 3)
        v85 = v80;
      else
        v85 = 4;
      __asm { BR              X12 }
    }
    if (v84 == 1)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v73 + 16))(v78, v79, v81);
      *(_BYTE *)(v78 + v80) = 1;
    }
    else
    {
      *(_QWORD *)v78 = *(_QWORD *)v79;
      *(_BYTE *)(v78 + v80) = 0;
      swift_retain();
    }
  }
  v86 = (_QWORD *)(((v78 | 7) + v80 + 1) & 0xFFFFFFFFFFFFFFF8);
  v87 = (_QWORD *)(((v79 | 7) + v80 + 1) & 0xFFFFFFFFFFFFFFF8);
  *v86 = *v87;
  v88 = (_QWORD *)(((unint64_t)v86 + 15) & 0xFFFFFFFFFFFFF8);
  v89 = (_QWORD *)(((unint64_t)v87 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v88 = *v89;
  *(_QWORD *)(((unint64_t)v88 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v89 + 15) & 0xFFFFFFFFFFFFF8);
  return v92;
}

uint64_t sub_213CE1960(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  void *v17;
  char *v18;
  int v19;
  uint64_t v20;
  size_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  unint64_t v27;
  _OWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  size_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  int v41;
  size_t v42;
  size_t v43;
  size_t v44;
  char *v45;
  char *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  _OWORD *v50;
  _OWORD *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  _QWORD *v64;
  _QWORD *v65;
  uint64_t v66;
  unsigned int v67;
  uint64_t v68;
  char v69;
  _QWORD *v70;
  _QWORD *v71;
  _QWORD *v72;
  _QWORD *v73;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = a3[4];
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(unsigned __int8 *)(v14 + 80);
  v16 = v12 + v15;
  v17 = (void *)((v16 + v10) & ~v15);
  v18 = (char *)((v16 + v11) & ~v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v18, 1, v13))
  {
    v19 = *(_DWORD *)(v14 + 84);
    v20 = *(_QWORD *)(v14 + 64);
    if (v19)
      v21 = *(_QWORD *)(v14 + 64);
    else
      v21 = v20 + 1;
    memcpy(v17, v18, v21);
  }
  else
  {
    (*(void (**)(void *, char *, uint64_t))(v14 + 32))(v17, v18, v13);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
    v19 = *(_DWORD *)(v14 + 84);
    v20 = *(_QWORD *)(v14 + 64);
  }
  if (!v19)
    ++v20;
  v22 = sub_213CE5F8C();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(unsigned __int8 *)(v23 + 80);
  v25 = (v24 | 7) + v20;
  v26 = (_OWORD *)(((unint64_t)v17 + v25) & ~(v24 | 7));
  v27 = (unint64_t)&v18[v25];
  v28 = (_OWORD *)(v27 & ~(v24 | 7));
  v29 = ~v24;
  v30 = v24 + 16;
  v31 = (v24 + 16) & ~v24;
  v32 = *(_QWORD *)(v23 + 64);
  if ((*(_DWORD *)(v23 + 84) & 0x80000000) != 0)
  {
    v34 = v31 + v32;
    if ((*(unsigned int (**)(unint64_t))(v23 + 48))(((unint64_t)v28 + v30) & v29))
    {
LABEL_13:
      memcpy(v26, v28, v34);
      goto LABEL_16;
    }
  }
  else
  {
    v33 = *(_QWORD *)((v27 & ~(v24 | 7)) + 8);
    if (v33 >= 0xFFFFFFFF)
      LODWORD(v33) = -1;
    v34 = v31 + v32;
    if ((_DWORD)v33 != -1)
      goto LABEL_13;
  }
  *v26 = *v28;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v23 + 32))(((unint64_t)v26 + v30) & v29, ((unint64_t)v28 + v30) & v29, v22);
LABEL_16:
  v35 = (char *)v28 + v34;
  v36 = a3[5];
  v37 = *(_QWORD *)(v36 - 8);
  v38 = *(unsigned __int8 *)(v37 + 80);
  v39 = (char *)(((unint64_t)v26 + v34 + v38) & ~v38);
  v40 = (char *)((unint64_t)&v35[v38] & ~v38);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v40, 1, v36))
  {
    v41 = *(_DWORD *)(v37 + 84);
    v42 = *(_QWORD *)(v37 + 64);
    if (v41)
      v43 = v42;
    else
      v43 = v42 + 1;
    memcpy(v39, v40, v43);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v39, v40, v36);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v39, 0, 1, v36);
    v41 = *(_DWORD *)(v37 + 84);
    v42 = *(_QWORD *)(v37 + 64);
  }
  if (v41)
    v44 = v42;
  else
    v44 = v42 + 1;
  v45 = &v39[v44];
  v46 = &v40[v44];
  *v45 = v40[v44];
  v45[1] = v40[v44 + 1];
  v47 = (unint64_t)&v39[v44 + 9] & 0xFFFFFFFFFFFFFFF8;
  v48 = (unint64_t)(v46 + 9) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v48 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v47 = *(_OWORD *)v48;
  }
  else
  {
    v49 = *(_QWORD *)(v48 + 8);
    *(_QWORD *)v47 = *(_QWORD *)v48;
    *(_QWORD *)(v47 + 8) = v49;
  }
  v50 = (_OWORD *)((v47 + 23) & 0xFFFFFFFFFFFFFFF8);
  v51 = (_OWORD *)((v48 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v50 = *v51;
  v52 = ((unint64_t)v50 + 23) & 0xFFFFFFFFFFFFFFF8;
  v53 = ((unint64_t)v51 + 23) & 0xFFFFFFFFFFFFFFF8;
  v54 = *(_QWORD *)v53;
  *(_BYTE *)(v52 + 8) = *(_BYTE *)(v53 + 8);
  *(_QWORD *)v52 = v54;
  v55 = ((unint64_t)v50 + 39) & 0xFFFFFFFFFFFFFFF8;
  v56 = ((unint64_t)v51 + 39) & 0xFFFFFFFFFFFFFFF8;
  v57 = *(_QWORD *)v56;
  *(_BYTE *)(v55 + 8) = *(_BYTE *)(v56 + 8);
  *(_QWORD *)v55 = v57;
  v58 = sub_213CE5AB8();
  v59 = *(_QWORD *)(v58 - 8);
  v60 = *(_DWORD *)(v59 + 80) & 0xF8;
  v61 = v60 + 16;
  v62 = v60 + 16 + v55;
  v63 = ~v60 & 0xFFFFFFFFFFFFFFF8;
  v64 = (_QWORD *)(v62 & v63);
  v65 = (_QWORD *)((v61 + v56) & v63);
  if (*(_QWORD *)(v59 + 64) <= 8uLL)
    v66 = 8;
  else
    v66 = *(_QWORD *)(v59 + 64);
  v67 = *((unsigned __int8 *)v65 + v66);
  if (v67 >= 2)
  {
    if (v66 <= 3)
      v68 = v66;
    else
      v68 = 4;
    __asm { BR              X13 }
  }
  if (v67 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v59 + 32))(v64, v65, v58);
    v69 = 1;
  }
  else
  {
    v69 = 0;
    *v64 = *v65;
  }
  *((_BYTE *)v64 + v66) = v69;
  v70 = (_QWORD *)(((unint64_t)v64 + v66 + 8) & 0xFFFFFFFFFFFFFFF8);
  v71 = (_QWORD *)(((unint64_t)v65 + v66 + 8) & 0xFFFFFFFFFFFFFFF8);
  *v70 = *v71;
  v72 = (_QWORD *)(((unint64_t)v70 + 15) & 0xFFFFFFFFFFFFFFF8);
  v73 = (_QWORD *)(((unint64_t)v71 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v72 = *v73;
  *(_QWORD *)(((unint64_t)v72 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v73 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_213CE1D94(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  void *v17;
  void *v18;
  uint64_t (*v19)(void *, uint64_t, uint64_t);
  int v20;
  size_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  size_t v32;
  unint64_t v33;
  int v34;
  uint64_t (*v35)(unint64_t, uint64_t, uint64_t);
  int v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t (*v43)(char *, uint64_t, uint64_t);
  int v44;
  int v45;
  size_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  _QWORD *v50;
  unint64_t *v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  unint64_t v62;
  unint64_t v63;
  char v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unsigned int v77;
  uint64_t v78;
  unsigned int v79;
  uint64_t v80;
  char v81;
  _QWORD *v82;
  _QWORD *v83;
  _QWORD *v84;
  _QWORD *v85;
  _QWORD *v87;
  uint64_t v88;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(a3[3] - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v11, v12);
  v87 = a3;
  v13 = a3[4];
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(unsigned __int8 *)(v14 + 80);
  v16 = *(_QWORD *)(v8 + 64) + v15;
  v17 = (void *)((v16 + v11) & ~v15);
  v18 = (void *)((v16 + v12) & ~v15);
  v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  LODWORD(v12) = v19(v17, 1, v13);
  v20 = v19(v18, 1, v13);
  if ((_DWORD)v12)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 32))(v17, v18, v13);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v17, 0, 1, v13);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 40))(v17, v18, v13);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v17, v13);
  }
  if (*(_DWORD *)(v14 + 84))
    v21 = *(_QWORD *)(v14 + 64);
  else
    v21 = *(_QWORD *)(v14 + 64) + 1;
  memcpy(v17, v18, v21);
LABEL_10:
  v88 = a1;
  if (*(_DWORD *)(v14 + 84))
    v22 = *(_QWORD *)(v14 + 64);
  else
    v22 = *(_QWORD *)(v14 + 64) + 1;
  v23 = sub_213CE5F8C();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(unsigned __int8 *)(v24 + 80);
  v26 = (v25 | 7) + v22;
  v27 = (_QWORD *)(((unint64_t)v17 + v26) & ~(v25 | 7));
  v28 = (_QWORD *)(((unint64_t)v18 + v26) & ~(v25 | 7));
  v29 = *(unsigned int *)(v24 + 84);
  v30 = ~v25;
  v31 = v25 + 16;
  v32 = ((v25 + 16) & ~v25) + *(_QWORD *)(v24 + 64);
  if ((v29 & 0x80000000) == 0)
  {
    v33 = v28[1];
    if (v33 >= 0xFFFFFFFF)
      LODWORD(v33) = -1;
    v34 = v33 + 1;
    if (v27[1] > 0xFFFFFFFEuLL)
      goto LABEL_17;
LABEL_20:
    if (v34)
      goto LABEL_21;
    *(_OWORD *)v27 = *(_OWORD *)v28;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v24 + 32))(((unint64_t)v27 + v31) & v30, ((unint64_t)v28 + v31) & v30, v23);
    goto LABEL_24;
  }
  v35 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v24 + 48);
  v36 = v35(((unint64_t)v27 + v31) & v30, *(unsigned int *)(v24 + 84), v23);
  v34 = v35(((unint64_t)v28 + v31) & v30, v29, v23);
  if (v36)
    goto LABEL_20;
LABEL_17:
  if (v34)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(unint64_t, uint64_t))(v24 + 8))(((unint64_t)v27 + v31) & v30, v23);
LABEL_21:
    memcpy(v27, v28, v32);
    goto LABEL_24;
  }
  *v27 = *v28;
  v27[1] = v28[1];
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v24 + 40))(((unint64_t)v27 + v31) & v30, ((unint64_t)v28 + v31) & v30, v23);
LABEL_24:
  v37 = (char *)v28 + v32;
  v38 = v87[5];
  v39 = *(_QWORD *)(v38 - 8);
  v40 = *(unsigned __int8 *)(v39 + 80);
  v41 = (char *)(((unint64_t)v27 + v32 + v40) & ~v40);
  v42 = (char *)((unint64_t)&v37[v40] & ~v40);
  v43 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v39 + 48);
  v44 = v43(v41, 1, v38);
  v45 = v43(v42, 1, v38);
  if (v44)
  {
    if (!v45)
    {
      (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v41, v42, v38);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v41, 0, 1, v38);
      goto LABEL_33;
    }
  }
  else
  {
    if (!v45)
    {
      (*(void (**)(char *, char *, uint64_t))(v39 + 40))(v41, v42, v38);
      goto LABEL_33;
    }
    (*(void (**)(char *, uint64_t))(v39 + 8))(v41, v38);
  }
  if (*(_DWORD *)(v39 + 84))
    v46 = *(_QWORD *)(v39 + 64);
  else
    v46 = *(_QWORD *)(v39 + 64) + 1;
  memcpy(v41, v42, v46);
LABEL_33:
  if (*(_DWORD *)(v39 + 84))
    v47 = *(_QWORD *)(v39 + 64);
  else
    v47 = *(_QWORD *)(v39 + 64) + 1;
  v48 = &v41[v47];
  v49 = &v42[v47];
  *v48 = *v49;
  v48[1] = v49[1];
  v50 = (_QWORD *)((unint64_t)(v48 + 9) & 0xFFFFFFFFFFFFFFF8);
  v51 = (unint64_t *)((unint64_t)(v49 + 9) & 0xFFFFFFFFFFFFFFF8);
  v52 = *v51;
  if (*v50 < 0xFFFFFFFFuLL)
  {
    if (v52 >= 0xFFFFFFFF)
    {
      v54 = v51[1];
      *v50 = v52;
      v50[1] = v54;
      goto LABEL_43;
    }
  }
  else
  {
    if (v52 >= 0xFFFFFFFF)
    {
      v53 = v51[1];
      *v50 = v52;
      v50[1] = v53;
      swift_release();
      goto LABEL_43;
    }
    swift_release();
  }
  *(_OWORD *)v50 = *(_OWORD *)v51;
LABEL_43:
  v55 = (_QWORD *)(((unint64_t)v50 + 23) & 0xFFFFFFFFFFFFFFF8);
  v56 = (_QWORD *)(((unint64_t)v51 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v55 = *v56;
  v55[1] = v56[1];
  swift_release();
  v57 = ((unint64_t)v55 + 23) & 0xFFFFFFFFFFFFFFF8;
  v58 = ((unint64_t)v56 + 23) & 0xFFFFFFFFFFFFFFF8;
  v59 = *(_QWORD *)v58;
  LOBYTE(v58) = *(_BYTE *)(v58 + 8);
  v60 = *(_QWORD *)v57;
  v61 = *(_BYTE *)(v57 + 8);
  *(_QWORD *)v57 = v59;
  *(_BYTE *)(v57 + 8) = v58;
  sub_213CC5044(v60, v61);
  v62 = ((unint64_t)v55 + 39) & 0xFFFFFFFFFFFFFFF8;
  v63 = ((unint64_t)v56 + 39) & 0xFFFFFFFFFFFFFFF8;
  v64 = *(_BYTE *)(v63 + 8);
  v65 = *(_QWORD *)v62;
  v66 = *(_BYTE *)(v62 + 8);
  *(_QWORD *)v62 = *(_QWORD *)v63;
  *(_BYTE *)(v62 + 8) = v64;
  sub_213CC5044(v65, v66);
  v67 = sub_213CE5AB8();
  v68 = *(_QWORD *)(v67 - 8);
  v69 = *(_DWORD *)(v68 + 80) & 0xF8;
  v70 = v69 + 16;
  v71 = v69 + 16 + v62;
  v72 = ~v69 & 0xFFFFFFFFFFFFFFF8;
  v73 = v71 & v72;
  v74 = (v70 + v63) & v72;
  if (*(_QWORD *)(v68 + 64) <= 8uLL)
    v75 = 8;
  else
    v75 = *(_QWORD *)(v68 + 64);
  if (v73 != v74)
  {
    v76 = v67;
    v77 = *(unsigned __int8 *)(v73 + v75);
    if (v77 >= 2)
    {
      if (v75 <= 3)
        v78 = v75;
      else
        v78 = 4;
      __asm { BR              X12 }
    }
    if (v77 == 1)
      (*(void (**)(unint64_t, uint64_t))(v68 + 8))(v73, v67);
    else
      swift_release();
    v79 = *(unsigned __int8 *)(v74 + v75);
    if (v79 >= 2)
    {
      if (v75 <= 3)
        v80 = v75;
      else
        v80 = 4;
      __asm { BR              X12 }
    }
    if (v79 == 1)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v68 + 32))(v73, v74, v76);
      v81 = 1;
    }
    else
    {
      v81 = 0;
      *(_QWORD *)v73 = *(_QWORD *)v74;
    }
    *(_BYTE *)(v73 + v75) = v81;
  }
  v82 = (_QWORD *)(((v73 | 7) + v75 + 1) & 0xFFFFFFFFFFFFFFF8);
  v83 = (_QWORD *)(((v74 | 7) + v75 + 1) & 0xFFFFFFFFFFFFFFF8);
  *v82 = *v83;
  v84 = (_QWORD *)(((unint64_t)v82 + 15) & 0xFFFFFFFFFFFFF8);
  v85 = (_QWORD *)(((unint64_t)v83 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v84 = *v85;
  *(_QWORD *)(((unint64_t)v84 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v85 + 15) & 0xFFFFFFFFFFFFF8);
  return v88;
}

uint64_t sub_213CE23E8(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
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
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  BOOL v49;
  uint64_t v50;
  unint64_t v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  uint64_t v56;
  unsigned int v57;
  uint64_t v58;

  v58 = a3[2];
  v5 = *(_QWORD *)(v58 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v56 = a3[3];
  v7 = *(_QWORD *)(v56 - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v57 = v8;
  if (v8 <= v6)
    v8 = *(_DWORD *)(v5 + 84);
  v9 = *(_QWORD *)(a3[4] - 8);
  v10 = *(_DWORD *)(v9 + 84);
  v11 = v10 - 1;
  if (!v10)
    v11 = 0;
  v55 = v11;
  if (v11 <= v8)
    v12 = v8;
  else
    v12 = v11;
  v13 = *(_QWORD *)(sub_213CE5F8C() - 8);
  v53 = *(_DWORD *)(v13 + 84);
  if (v53 <= 0x7FFFFFFF)
    v14 = 0x7FFFFFFF;
  else
    v14 = *(_DWORD *)(v13 + 84);
  v15 = v14 - 6;
  v54 = v15;
  if (v15 <= v12)
    v15 = v12;
  v16 = *(_QWORD *)(a3[5] - 8);
  v17 = *(_DWORD *)(v16 + 84);
  v18 = v17 - 1;
  if (!v17)
    v18 = 0;
  v52 = v18;
  if (v18 > v15)
    v15 = v18;
  if (v15 <= 0x7FFFFFFE)
    v19 = 2147483646;
  else
    v19 = v15;
  v20 = *(_QWORD *)(sub_213CE5AB8() - 8);
  if (*(_QWORD *)(v20 + 64) <= 8uLL)
    v21 = 8;
  else
    v21 = *(_QWORD *)(v20 + 64);
  v22 = *(_QWORD *)(v9 + 64);
  if (!v10)
    ++v22;
  if (v17)
    v23 = *(_QWORD *)(v16 + 64);
  else
    v23 = *(_QWORD *)(v16 + 64) + 1;
  if (!a2)
    return 0;
  v24 = v10;
  v25 = *(unsigned __int8 *)(v7 + 80);
  v26 = *(_QWORD *)(v5 + 64) + v25;
  v27 = *(_QWORD *)(v7 + 64);
  v28 = *(unsigned __int8 *)(v9 + 80);
  v29 = *(unsigned __int8 *)(v13 + 80);
  v30 = v29 | 7;
  v31 = *(unsigned __int8 *)(v16 + 80);
  v32 = ((v29 + 16) & ~v29) + *(_QWORD *)(v13 + 64) + v31;
  v33 = v23 + 9;
  v34 = a1;
  if (v19 < a2)
  {
    v35 = *(_DWORD *)(v20 + 80) & 0xF8 | 7;
    if (((((((((v21
               + ((v35
                 + ((((((v33 + ((v32 + ((v30 + v22 + ((v27 + v28 + (v26 & ~v25)) & ~v28)) & ~v30)) & ~v31)) & 0xFFFFFFFFFFFFFFF8)
                     + 23) & 0xFFFFFFFFFFFFFFF8)
                   + 39) & 0xFFFFFFFFFFFFFFF8)
                 + 9) & ~v35)
               + 8) & 0xFFFFFFFFFFFFFFF8)
             + 15) & 0xFFFFFFFFFFFFFFF8)
           + 15) & 0xFFFFFFFFFFFFFFF8)
         + 8) & 0xFFFFFFF8) != 0)
      v36 = 2;
    else
      v36 = a2 - v19 + 1;
    if (v36 >= 0x10000)
      v37 = 4;
    else
      v37 = 2;
    if (v36 < 0x100)
      v37 = 1;
    if (v36 >= 2)
      v38 = v37;
    else
      v38 = 0;
    __asm { BR              X5 }
  }
  if ((_DWORD)v6 == v19)
  {
    v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    v40 = v6;
    v41 = v58;
    return v39(v34, v40, v41);
  }
  v34 = (v26 + a1) & ~v25;
  if (v57 == v19)
  {
    v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v40 = v57;
    v41 = v56;
    return v39(v34, v40, v41);
  }
  v43 = (v34 + v27 + v28) & ~v28;
  if (v55 == v19)
  {
    if (v24 < 2)
      return 0;
    v47 = (*(uint64_t (**)(uint64_t))(v9 + 48))(v43);
    goto LABEL_56;
  }
  v44 = (v43 + v22 + v30) & ~v30;
  if (v54 == v19)
  {
    if ((v53 & 0x80000000) != 0)
    {
      v46 = (*(uint64_t (**)(uint64_t))(v13 + 48))((v29 + 16 + v44) & ~v29);
    }
    else
    {
      v45 = *(_QWORD *)(v44 + 8);
      if (v45 >= 0xFFFFFFFF)
        LODWORD(v45) = -1;
      v46 = v45 + 1;
    }
    v48 = v46 - 6;
    v49 = v46 >= 7;
    goto LABEL_67;
  }
  v50 = (v32 + v44) & ~v31;
  if (v52 == v19)
  {
    if (v17 < 2)
      return 0;
    v47 = (*(uint64_t (**)(uint64_t))(v16 + 48))(v50);
LABEL_56:
    v48 = v47 - 1;
    v49 = v47 >= 2;
LABEL_67:
    if (v49)
      return v48;
    else
      return 0;
  }
  v51 = *(_QWORD *)((v33 + v50) & 0xFFFFFFFFFFFFF8);
  if (v51 >= 0xFFFFFFFF)
    LODWORD(v51) = -1;
  if ((v51 + 1) >= 2)
    return v51;
  else
    return 0;
}

void sub_213CE27C0(_DWORD *a1, unsigned int a2, unsigned int a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  size_t v27;
  unsigned int v28;
  int v29;

  v6 = *(_QWORD *)(a4[2] - 8);
  v7 = *(_QWORD *)(a4[3] - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8 <= *(_DWORD *)(v6 + 84))
    v8 = *(_DWORD *)(v6 + 84);
  v9 = *(_QWORD *)(a4[4] - 8);
  v10 = *(_DWORD *)(v9 + 84);
  v11 = v10 - 1;
  if (!v10)
    v11 = 0;
  if (v11 <= v8)
    v12 = v8;
  else
    v12 = v11;
  v13 = *(_QWORD *)(sub_213CE5F8C() - 8);
  if (*(_DWORD *)(v13 + 84) <= 0x7FFFFFFFu)
    v14 = 0x7FFFFFFF;
  else
    v14 = *(_DWORD *)(v13 + 84);
  v15 = v14 - 6;
  if (v15 <= v12)
    v15 = v12;
  v16 = *(_QWORD *)(a4[5] - 8);
  v17 = *(_DWORD *)(v16 + 84);
  v18 = v17 - 1;
  if (!v17)
    v18 = 0;
  if (v18 > v15)
    v15 = v18;
  if (v15 <= 0x7FFFFFFE)
    v19 = 2147483646;
  else
    v19 = v15;
  v20 = 0;
  v21 = *(_QWORD *)(sub_213CE5AB8() - 8);
  if (*(_QWORD *)(v21 + 64) <= 8uLL)
    v22 = 8;
  else
    v22 = *(_QWORD *)(v21 + 64);
  v23 = *(_QWORD *)(v9 + 64);
  if (!v10)
    ++v23;
  v25 = *(_QWORD *)(v16 + 64);
  if (!v17)
    ++v25;
  v26 = *(_DWORD *)(v21 + 80) & 0xF8 | 7;
  v24 = *(unsigned __int8 *)(v13 + 80);
  v27 = ((((((v22
            + ((v26
              + ((((((v25
                    + 9
                    + ((((v24 + 16) & ~v24)
                      + *(_QWORD *)(v13 + 64)
                      + *(unsigned __int8 *)(v16 + 80)
                      + (((v24 | 7)
                        + v23
                        + ((*(_QWORD *)(v7 + 64)
                          + *(unsigned __int8 *)(v9 + 80)
                          + ((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))) & ~(v24 | 7))) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))) & 0xFFFFFFFFFFFFFFF8)
                  + 23) & 0xFFFFFFFFFFFFFFF8)
                + 39) & 0xFFFFFFFFFFFFFFF8)
              + 9) & ~v26)
            + 8) & 0xFFFFFFFFFFFFFFF8)
          + 15) & 0xFFFFFFFFFFFFFFF8)
        + 15) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v19 < a3)
  {
    if ((((((((_DWORD)v22
             + (((_DWORD)v26
               + (((((((_DWORD)v25
                     + 9
                     + (((((_DWORD)v24 + 16) & ~(_DWORD)v24)
                       + *(_DWORD *)(v13 + 64)
                       + *(unsigned __int8 *)(v16 + 80)
                       + (((v24 | 7)
                         + (_DWORD)v23
                         + ((*(_DWORD *)(v7 + 64)
                           + *(unsigned __int8 *)(v9 + 80)
                           + ((*(_DWORD *)(v6 + 64) + *(unsigned __int8 *)(v7 + 80)) & ~*(unsigned __int8 *)(v7 + 80))) & ~*(unsigned __int8 *)(v9 + 80))) & ~(v24 | 7))) & ~*(unsigned __int8 *)(v16 + 80))) & 0xFFFFFFF8)
                   + 23) & 0xFFFFFFF8)
                 + 39) & 0xFFFFFFF8)
               + 9) & ~(_DWORD)v26)
             + 8) & 0xFFFFFFF8)
           + 15) & 0xFFFFFFF8)
         + 15) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v28 = a3 - v19 + 1;
    else
      v28 = 2;
    if (v28 >= 0x10000)
      v29 = 4;
    else
      v29 = 2;
    if (v28 < 0x100)
      v29 = 1;
    if (v28 >= 2)
      v20 = v29;
    else
      v20 = 0;
  }
  if (a2 > v19)
  {
    if ((_DWORD)v27)
    {
      bzero(a1, v27);
      *a1 = ~v19 + a2;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X6 }
}

uint64_t sub_213CE2A50@<X0>(size_t a1@<X1>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
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
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  _QWORD *v25;
  int v26;
  _QWORD *v27;
  int v28;
  int v29;
  unsigned int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;

  result = v35;
  *(_BYTE *)(v35 + v18) = 0;
  if ((_DWORD)v21)
  {
    if (v34 == v17)
    {
      v23 = *(uint64_t (**)(uint64_t, uint64_t))(v19 + 56);
      result = v35;
      v24 = v21;
      return v23(result, v24);
    }
    result = (v9 + v35) & a3;
    if (v33 == v17)
    {
      v23 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 56);
      v24 = v21;
      return v23(result, v24);
    }
    result = (result + v6 + v5) & a2;
    if (v32 == v17)
    {
      v24 = (v21 + 1);
      v23 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 56);
      return v23(result, v24);
    }
    v25 = (_QWORD *)((result + a4 + v7) & v11);
    if (v31 == v17)
    {
      if ((int)v21 + 6 <= v30)
      {
        if ((_DWORD)v21 != -6)
        {
          if (v28 < 0)
          {
            result = ((unint64_t)v25 + v4) & v15;
            v23 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 56);
            v24 = (v21 + 6);
            return v23(result, v24);
          }
          if ((_DWORD)v21 + 6 < 0)
          {
            *v25 = (v21 - 2147483642);
            *(_QWORD *)(((result + a4 + v7) & v11) + 8) = 0;
          }
          else
          {
            *(_QWORD *)(((result + a4 + v7) & v11) + 8) = (v21 + 5);
          }
        }
      }
      else if ((_DWORD)a1)
      {
        if (a1 <= 3)
          v26 = a1;
        else
          v26 = 4;
        bzero(v25, a1);
        __asm { BR              X10 }
      }
    }
    else
    {
      result = ((unint64_t)v25 + v10) & v12;
      if (v29 == v17)
      {
        v24 = (v21 + 1);
        v23 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 56);
        return v23(result, v24);
      }
      v27 = (_QWORD *)((v8 + result) & 0xFFFFFFFFFFFFFFF8);
      if (v21 > 0x7FFFFFFE)
      {
        *v27 = 0;
        v27[1] = 0;
        *(_DWORD *)v27 = v21 - 0x7FFFFFFF;
      }
      else
      {
        *v27 = v21;
      }
    }
  }
  return result;
}

void sub_213CE2ACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  int v21;

  *(_WORD *)(a20 + v20) = 0;
  if (!v21)
    JUMPOUT(0x213CE2AD8);
  JUMPOUT(0x213CE2A84);
}

void sub_213CE2BA4()
{
  char v0;
  _BYTE *v1;

  *v1 = v0;
}

void sub_213CE2C58()
{
  __int16 v0;
  _WORD *v1;

  *v1 = v0;
}

void sub_213CE2C60()
{
  int v0;
  uint64_t v1;

  *(_WORD *)v1 = v0;
  *(_BYTE *)(v1 + 2) = BYTE2(v0);
}

void sub_213CE2C70()
{
  int v0;
  _DWORD *v1;

  *v1 = v0;
}

void sub_213CE2C90()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254D35F88)
  {
    sub_213CE5AB8();
    v0 = sub_213CE5AC4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254D35F88);
  }
}

uint64_t storeEnumTagSinglePayload for PaymentItemContentStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_213CE2D30 + 4 * byte_213CE8C20[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_213CE2D64 + 4 * byte_213CE8C1B[v4]))();
}

uint64_t sub_213CE2D64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213CE2D6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213CE2D74);
  return result;
}

uint64_t sub_213CE2D80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213CE2D88);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_213CE2D8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213CE2D94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PaymentItemContentStyle()
{
  return &type metadata for PaymentItemContentStyle;
}

ValueMetadata *type metadata accessor for PaymentItem_Previews()
{
  return &type metadata for PaymentItem_Previews;
}

uint64_t sub_213CE2DC0(uint64_t a1)
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
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];

  v21 = *(_QWORD *)(a1 + 56);
  sub_213CE5B60();
  sub_213CE5EC0();
  sub_213CE5B60();
  sub_213CE5B60();
  swift_getTupleTypeMetadata2();
  v1 = sub_213CE6214();
  v2 = MEMORY[0x24BDF5428];
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v1);
  sub_213CE6178();
  sub_213CE6334();
  type metadata accessor for AccessoryView(255);
  swift_getTupleTypeMetadata2();
  v3 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v2, v3);
  sub_213CE6178();
  sub_213CE6334();
  swift_getTupleTypeMetadata2();
  v4 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v2, v4);
  sub_213CE6178();
  sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35F08);
  v5 = sub_213CE5B60();
  v6 = sub_213CE5B60();
  v7 = sub_213CE5B60();
  v8 = sub_213CE5B60();
  v31[0] = v21;
  v31[1] = MEMORY[0x24BDEDBB8];
  v9 = MEMORY[0x24BDED308];
  v10 = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v5, v31);
  v11 = MEMORY[0x24BDECC60];
  v30[0] = v10;
  v30[1] = MEMORY[0x24BDECC60];
  v29[0] = MEMORY[0x2199C1EA8](v9, v6, v30);
  v29[1] = v11;
  v28[0] = MEMORY[0x2199C1EA8](v9, v7, v29);
  v28[1] = v11;
  v26 = v8;
  v27 = MEMORY[0x2199C1EA8](v9, v8, v28);
  v12 = MEMORY[0x24BDF2F10];
  MEMORY[0x2199C1E48](255, &v26, MEMORY[0x24BDF2F10], 0);
  sub_213CE5B60();
  swift_getTupleTypeMetadata2();
  sub_213CE6214();
  sub_213CE6334();
  swift_getTupleTypeMetadata2();
  v13 = sub_213CE6214();
  MEMORY[0x2199C1EA8](v2, v13);
  v14 = sub_213CE6190();
  v15 = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4700], v14);
  v26 = v14;
  v27 = v15;
  MEMORY[0x2199C1E48](255, &v26, v12, 0);
  v16 = sub_213CE5B60();
  v17 = sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35F10);
  v18 = sub_213CE5B60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35A40);
  v19 = sub_213CE5B60();
  v26 = v14;
  v27 = v15;
  v25[0] = swift_getOpaqueTypeConformance2();
  v25[1] = sub_213CD0344((unint64_t *)&qword_254D356A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
  v24[0] = MEMORY[0x2199C1EA8](v9, v16, v25);
  v24[1] = MEMORY[0x24BDEDBB8];
  v23[0] = MEMORY[0x2199C1EA8](v9, v17, v24);
  v23[1] = sub_213CC0B2C(&qword_254D35F18, &qword_254D35F10, MEMORY[0x24BDEF370]);
  v22[0] = MEMORY[0x2199C1EA8](v9, v18, v23);
  v22[1] = sub_213CC0B2C(&qword_254D35AA8, &qword_254D35A40, MEMORY[0x24BDEB950]);
  return MEMORY[0x2199C1EA8](v9, v19, v22);
}

uint64_t sub_213CE324C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t OpaqueTypeConformance2;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v20 = *a1;
  v1 = v20;
  v21 = v2;
  v22 = v3;
  v23 = v4;
  v24 = v5;
  v25 = v6;
  v26 = v7;
  v27 = v8;
  MEMORY[0x2199C1E48](255, &v20, &unk_213CEA548, 0);
  v20 = v1;
  v21 = v2;
  v22 = v3;
  v23 = v4;
  v24 = v5;
  v25 = v6;
  v26 = v7;
  v27 = v8;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v10 = sub_213CE6160();
  v11 = sub_213CE5E18();
  sub_213CE61D8();
  swift_getTupleTypeMetadata2();
  v12 = sub_213CE6214();
  MEMORY[0x2199C1EA8](MEMORY[0x24BDF5428], v12);
  v13 = sub_213CE6190();
  v14 = sub_213CE5E18();
  v15 = MEMORY[0x2199C1EA8](MEMORY[0x24BDF4700], v13);
  v19[0] = MEMORY[0x2199C1EA8](MEMORY[0x24BDF43B0], v10);
  v19[1] = OpaqueTypeConformance2;
  v16 = MEMORY[0x24BDEF3E0];
  v18[0] = v15;
  v18[1] = MEMORY[0x2199C1EA8](MEMORY[0x24BDEF3E0], v11, v19);
  return MEMORY[0x2199C1EA8](v16, v14, v18);
}

uint64_t sub_213CE33D4()
{
  return sub_213CE34AC(&qword_254D35F98, &qword_254D35F70, (uint64_t (*)(void))sub_213CE3408, MEMORY[0x24BDF1050]);
}

unint64_t sub_213CE3408()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35FA0;
  if (!qword_254D35FA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35F58);
    v2[0] = sub_213CE34AC(&qword_254D35FA8, &qword_254D35F50, (uint64_t (*)(void))sub_213CE3514, MEMORY[0x24BDEDBB8]);
    v2[1] = sub_213CC0B2C(&qword_253F0BA28, &qword_253F0BA30, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35FA0);
  }
  return result;
}

uint64_t sub_213CE34AC(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_213CE3514()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D35FB0;
  if (!qword_254D35FB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35F48);
    v2[0] = sub_213CC0B2C(&qword_254D35FB8, &qword_254D35F40, MEMORY[0x24BDEB238]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D35FB0);
  }
  return result;
}

unint64_t sub_213CE3598()
{
  unint64_t result;

  result = qword_254D35FC0;
  if (!qword_254D35FC0)
  {
    result = MEMORY[0x2199C1EA8](&unk_213CE8D60, &type metadata for PaymentItem_Previews);
    atomic_store(result, (unint64_t *)&qword_254D35FC0);
  }
  return result;
}

uint64_t sub_213CE35DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_213CE5CA4();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_213CE360C()
{
  return sub_213CE5CB0();
}

void sub_213CE3638()
{
  type metadata accessor for PaymentItem();
}

uint64_t sub_213CE3690(int *a1)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;

  v6 = *((_QWORD *)a1 - 1);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v23 = *(_QWORD *)(v6 + 64);
  v8 = sub_213CE5B0C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = v1 + ((v7 + 80) & ~v7);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v11, v3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v11 + a1[21], v4);
  v12 = v11 + a1[22];
  v13 = *(_QWORD *)(v2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v12, 1, v2))
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v2);
  v14 = v11 + a1[23];
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 48))(v14, 6, v15))
  {
    swift_bridgeObjectRelease();
    v16 = v14 + *(int *)(v15 + 48);
    v17 = sub_213CE5F8C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
  }
  v18 = v11 + a1[24];
  v19 = *(_QWORD *)(v24 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v19 + 48))(v18, 1))
    (*(void (**)(uint64_t))(v19 + 8))(v18);
  if (*(_QWORD *)(v11 + a1[27]))
    swift_release();
  swift_release();
  sub_213CC5044(*(_QWORD *)(v11 + a1[29]), *(_BYTE *)(v11 + a1[29] + 8));
  sub_213CC5044(*(_QWORD *)(v11 + a1[30]), *(_BYTE *)(v11 + a1[30] + 8));
  v20 = v11 + a1[31];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35F00);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v21 = sub_213CE5AB8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v20, v21);
  }
  else
  {
    swift_release();
  }
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1 + ((((v7 + 80) & ~v7) + v23 + v10) & ~v10), v8);
  return swift_deallocObject();
}

void sub_213CE38CC()
{
  type metadata accessor for PaymentItem();
}

void sub_213CE3920()
{
  sub_213CE5B0C();
  sub_213CE5B00();
  type metadata accessor for PaymentItem();
}

uint64_t sub_213CE3980()
{
  return sub_213CD9658();
}

void objectdestroyTm_0()
{
  type metadata accessor for PaymentItem();
}

uint64_t sub_213CE3A0C(int *a1)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v6 = *(unsigned __int8 *)(*((_QWORD *)a1 - 1) + 80);
  v7 = v1 + ((v6 + 80) & ~v6);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v7, v3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v7 + a1[21], v4);
  v8 = v7 + a1[22];
  v9 = *(_QWORD *)(v2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v8, 1, v2))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v2);
  v10 = v7 + a1[23];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D35CF8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v10, 6, v11))
  {
    swift_bridgeObjectRelease();
    v12 = v10 + *(int *)(v11 + 48);
    v13 = sub_213CE5F8C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  }
  v14 = v7 + a1[24];
  v15 = *(_QWORD *)(v19 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v15 + 48))(v14, 1))
    (*(void (**)(uint64_t))(v15 + 8))(v14);
  if (*(_QWORD *)(v7 + a1[27]))
    swift_release();
  swift_release();
  sub_213CC5044(*(_QWORD *)(v7 + a1[29]), *(_BYTE *)(v7 + a1[29] + 8));
  sub_213CC5044(*(_QWORD *)(v7 + a1[30]), *(_BYTE *)(v7 + a1[30] + 8));
  v16 = v7 + a1[31];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D35F00);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v17 = sub_213CE5AB8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

void sub_213CE3BF4()
{
  type metadata accessor for PaymentItem();
}

void sub_213CE3C48()
{
  type metadata accessor for PaymentItem();
}

uint64_t sub_213CE3C7C()
{
  return sub_213CD9658();
}

unint64_t sub_213CE3CA8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D36020;
  if (!qword_254D36020)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D36018);
    v2[0] = MEMORY[0x24BDF3E20];
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D36020);
  }
  return result;
}

unint64_t sub_213CE3D0C()
{
  unint64_t result;

  result = qword_254D36028;
  if (!qword_254D36028)
  {
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BEE50E0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_254D36028);
  }
  return result;
}

void sub_213CE3D50()
{
  sub_213CE3E3C((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_213CDC36C);
}

uint64_t sub_213CE3D5C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_213CE3DA0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D36038;
  if (!qword_254D36038)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D35F08);
    v2[0] = sub_213CD0344((unint64_t *)&qword_254D35AC8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF4918], MEMORY[0x24BDF4900]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2199C1EA8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D36038);
  }
  return result;
}

void sub_213CE3E24()
{
  sub_213CE3E3C((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_213CDCCA8);
}

void sub_213CE3E30()
{
  sub_213CE3E3C((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_213CDD0F8);
}

void sub_213CE3E3C(void (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  a1(v1[10], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9]);
  JUMPOUT(0x213CE3E68);
}

PaymentUIBase::AuthenticationEvent_optional __swiftcall AuthenticationEvent.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  PaymentUIBase::AuthenticationEvent_optional result;
  char v5;

  v2 = v1;
  v3 = sub_213CE640C();
  result.value = swift_bridgeObjectRelease();
  v5 = 12;
  if (v3 < 0xC)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t AuthenticationEvent.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_213CE3F04 + 4 * byte_213CE9000[*v0]))(0x6E776F6E6B6E75, 0xE700000000000000);
}

unint64_t sub_213CE3F04()
{
  return 0xD000000000000010;
}

unint64_t sub_213CE3F8C()
{
  return 0xD000000000000014;
}

unint64_t sub_213CE3FA4()
{
  return 0xD000000000000016;
}

unint64_t sub_213CE3FBC()
{
  return 0xD000000000000011;
}

uint64_t sub_213CE3FD4()
{
  return 0x4370556570697773;
}

void sub_213CE3FF8()
{
  JUMPOUT(0x213CE400CLL);
}

uint64_t sub_213CE4018()
{
  return sub_213CE406C();
}

unint64_t sub_213CE4028()
{
  unint64_t result;

  result = qword_253F0B8D0;
  if (!qword_253F0B8D0)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for AuthenticationEvent, &type metadata for AuthenticationEvent);
    atomic_store(result, (unint64_t *)&qword_253F0B8D0);
  }
  return result;
}

uint64_t sub_213CE406C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = AuthenticationEvent.rawValue.getter();
  v2 = v1;
  if (v0 == AuthenticationEvent.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_213CE6418();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_213CE4100()
{
  sub_213CE6430();
  AuthenticationEvent.rawValue.getter();
  sub_213CE62A4();
  swift_bridgeObjectRelease();
  return sub_213CE6448();
}

uint64_t sub_213CE4164()
{
  AuthenticationEvent.rawValue.getter();
  sub_213CE62A4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_213CE41B4()
{
  sub_213CE6430();
  AuthenticationEvent.rawValue.getter();
  sub_213CE62A4();
  swift_bridgeObjectRelease();
  return sub_213CE6448();
}

PaymentUIBase::AuthenticationEvent_optional sub_213CE4214(Swift::String *a1)
{
  return AuthenticationEvent.init(rawValue:)(*a1);
}

uint64_t sub_213CE4220@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = AuthenticationEvent.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AuthenticationEvent(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AuthenticationEvent(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_213CE4320 + 4 * byte_213CE9011[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_213CE4354 + 4 * byte_213CE900C[v4]))();
}

uint64_t sub_213CE4354(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_213CE435C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x213CE4364);
  return result;
}

uint64_t sub_213CE4370(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x213CE4378);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_213CE437C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_213CE4384(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AuthenticationEvent()
{
  return &type metadata for AuthenticationEvent;
}

void AppleIDSignInView.init(inAppContext:delegate:)(void *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  id v6;

  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0AE48]), sel_init);
  objc_msgSend(a1, sel_setPresentingViewController_, v6);
  objc_msgSend(v6, sel_setContext_, a1);
  objc_msgSend(v6, sel_setDelegate_, a2);

  swift_unknownObjectRelease();
  *a3 = v6;
}

id AppleIDSignInView.makeUIViewController(context:)()
{
  id *v0;

  return *v0;
}

void AppleIDSignInView.updateUIViewController(_:context:)(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(a1, sel_view);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v2, sel_setBackgroundColor_, v3);

  }
  else
  {
    __break(1u);
  }
}

void AppleIDSignInView.sizeThatFits(_:uiViewController:context:)(uint64_t a1, char a2, uint64_t a3, char a4, id a5)
{
  id v9;
  void *v10;
  id v11;
  unint64_t v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;

  v9 = objc_msgSend(a5, sel_view);
  if (!v9)
    goto LABEL_16;
  v10 = v9;
  v11 = objc_msgSend(v9, sel_subviews);

  sub_213CE463C();
  v12 = sub_213CE62D4();

  if (!(v12 >> 62))
  {
    if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_4;
LABEL_13:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v19 = sub_213CE63D0();
  swift_bridgeObjectRelease();
  if (!v19)
    goto LABEL_13;
LABEL_4:
  if ((v12 & 0xC000000000000001) != 0)
  {
LABEL_14:
    v13 = (id)MEMORY[0x2199C19E0](0, v12);
    goto LABEL_7;
  }
  if (!*(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  v13 = *(id *)(v12 + 32);
LABEL_7:
  v14 = v13;
  swift_bridgeObjectRelease();
  v16 = *(double *)&a1;
  v17 = 10.0;
  if ((a2 & 1) != 0)
    v16 = 10.0;
  HIDWORD(v18) = HIDWORD(a3);
  if ((a4 & 1) == 0)
    v17 = *(double *)&a3;
  LODWORD(v18) = 1148846080;
  LODWORD(v15) = 1112014848;
  objc_msgSend(v14, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, v16, v17, v18, v15);

}

unint64_t sub_213CE463C()
{
  unint64_t result;

  result = qword_254D36050;
  if (!qword_254D36050)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D36050);
  }
  return result;
}

BOOL static AppleIDSignInView.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

unint64_t sub_213CE4690()
{
  unint64_t result;

  result = qword_254D36058;
  if (!qword_254D36058)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for AppleIDSignInView, &type metadata for AppleIDSignInView);
    atomic_store(result, (unint64_t *)&qword_254D36058);
  }
  return result;
}

void sub_213CE46D4(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(a1, sel_view);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v2, sel_setBackgroundColor_, v3);

  }
  else
  {
    __break(1u);
  }
}

void sub_213CE4754(uint64_t a1, char a2, uint64_t a3, char a4, void *a5)
{
  AppleIDSignInView.sizeThatFits(_:uiViewController:context:)(a1, a2 & 1, a3, a4 & 1, a5);
}

BOOL sub_213CE4784(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_213CE4798()
{
  sub_213CE486C();
  return sub_213CE5EA8();
}

uint64_t sub_213CE47E8()
{
  sub_213CE486C();
  return sub_213CE5E78();
}

void sub_213CE4838()
{
  sub_213CE486C();
  sub_213CE5E9C();
  __break(1u);
}

ValueMetadata *type metadata accessor for AppleIDSignInView()
{
  return &type metadata for AppleIDSignInView;
}

unint64_t sub_213CE486C()
{
  unint64_t result;

  result = qword_254D36060;
  if (!qword_254D36060)
  {
    result = MEMORY[0x2199C1EA8](&protocol conformance descriptor for AppleIDSignInView, &type metadata for AppleIDSignInView);
    atomic_store(result, (unint64_t *)&qword_254D36060);
  }
  return result;
}

uint64_t AuthorizationModel.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  AuthorizationModel.init()();
  return v0;
}

uint64_t AuthorizationModel.init()()
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
  _BYTE v13[40];
  _OWORD v14[2];
  uint64_t v15;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v13[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B948);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0;
  v9 = v0 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__authorizationError;
  v15 = 0;
  memset(v14, 0, sizeof(v14));
  sub_213CE4A34((uint64_t)v14, (uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B8C0);
  sub_213CE5A34();
  sub_213CE4A7C((uint64_t)v14);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  v10 = v0 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__canShowDetailSheet;
  LOBYTE(v14[0]) = 1;
  sub_213CE5A34();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v10, v4, v1);
  return v0;
}

uint64_t sub_213CE4A34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B8C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_213CE4A7C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B8C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t AuthorizationModel.__allocating_init(headerTitle:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v12[40];
  _OWORD v13[2];
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B948);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 24) = 0;
  *(_QWORD *)(v8 + 16) = 0;
  v9 = v8 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__authorizationError;
  v14 = 0;
  memset(v13, 0, sizeof(v13));
  sub_213CE4A34((uint64_t)v13, (uint64_t)v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B8C0);
  sub_213CE5A34();
  sub_213CE4A7C((uint64_t)v13);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v9, v7, v4);
  LOBYTE(v13[0]) = 1;
  sub_213CE5A34();
  swift_beginAccess();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t AuthorizationModel.init(headerTitle:)(uint64_t a1, uint64_t a2)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  _BYTE v16[40];
  _OWORD v17[2];
  uint64_t v18;

  v15 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B948);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  *(_QWORD *)(v2 + 24) = 0;
  *(_QWORD *)(v2 + 16) = 0;
  v12 = v2 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__authorizationError;
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  sub_213CE4A34((uint64_t)v17, (uint64_t)v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B8C0);
  sub_213CE5A34();
  sub_213CE4A7C((uint64_t)v17);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  v13 = v2 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__canShowDetailSheet;
  LOBYTE(v17[0]) = 1;
  sub_213CE5A34();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v13, v7, v4);
  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v15;
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_213CE4D94@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 120))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_213CE4DC4(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 128);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_213CE4E08()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_213CE4E50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_213CE4EA0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_213CE4EDC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 160))();
}

uint64_t sub_213CE4F04(uint64_t a1, uint64_t a2)
{
  _BYTE v4[40];

  sub_213CE4A34(a1, (uint64_t)v4);
  return (*(uint64_t (**)(_BYTE *))(**(_QWORD **)a2 + 168))(v4);
}

uint64_t sub_213CE4F44()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_213CE5A64();
  swift_release();
  return swift_release();
}

uint64_t sub_213CE4FA8(uint64_t a1)
{
  _BYTE v3[40];

  swift_getKeyPath();
  swift_getKeyPath();
  sub_213CE4A34(a1, (uint64_t)v3);
  swift_retain();
  sub_213CE5A70();
  return sub_213CE4A7C(a1);
}

uint64_t (*sub_213CE5024(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CE509C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 184))();
}

uint64_t sub_213CE50C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D36068);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 192))(v6);
}

uint64_t sub_213CE5150()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__authorizationError, &qword_253F0B948);
}

uint64_t sub_213CE5164(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_254D36068, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__authorizationError, &qword_253F0B948);
}

uint64_t (*sub_213CE5180(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D36068);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__authorizationError;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B948);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

uint64_t sub_213CE5248@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 208))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_213CE527C(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 216))(*a1);
}

uint64_t sub_213CE52A8()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_213CE5A64();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_213CE5318()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_213CE5A70();
}

uint64_t (*sub_213CE5384(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_213CE5A58();
  return sub_213CBC8D8;
}

uint64_t sub_213CE53FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 232))();
}

uint64_t sub_213CE5424(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 240))(v6);
}

uint64_t sub_213CE54B0()
{
  return sub_213CBF318((uint64_t)&OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__canShowDetailSheet, &qword_253F0B988);
}

uint64_t sub_213CE54C4(uint64_t a1)
{
  return sub_213CBF398(a1, &qword_253F0B940, (uint64_t)&OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__canShowDetailSheet, &qword_253F0B988);
}

uint64_t (*sub_213CE54E0(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B940);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__canShowDetailSheet;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  sub_213CE5A40();
  swift_endAccess();
  return sub_213CBCAC8;
}

uint64_t AuthorizationModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__authorizationError;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B948);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__canShowDetailSheet;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t AuthorizationModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__authorizationError;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B948);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC13PaymentUIBase18AuthorizationModel__canShowDetailSheet;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0B988);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_213CE56AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AuthorizationModel();
  result = sub_213CE5A28();
  *a1 = result;
  return result;
}

uint64_t sub_213CE56E8()
{
  return type metadata accessor for AuthorizationModel();
}

uint64_t type metadata accessor for AuthorizationModel()
{
  uint64_t result;

  result = qword_253F0C220;
  if (!qword_253F0C220)
    return swift_getSingletonMetadata();
  return result;
}

void sub_213CE572C()
{
  unint64_t v0;
  unint64_t v1;

  sub_213CE58A8();
  if (v0 <= 0x3F)
  {
    sub_213CE5900();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AuthorizationModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AuthorizationModel.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of AuthorizationModel.__allocating_init(headerTitle:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of AuthorizationModel.headerTitle.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of AuthorizationModel.headerTitle.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of AuthorizationModel.headerTitle.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of AuthorizationModel.showPaymentSheetFooter.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of AuthorizationModel.showPaymentSheetFooterAmount.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of AuthorizationModel.authorizationError.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of AuthorizationModel.authorizationError.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of AuthorizationModel.authorizationError.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of AuthorizationModel.$authorizationError.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of AuthorizationModel.$authorizationError.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of AuthorizationModel.$authorizationError.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of AuthorizationModel.canShowDetailSheet.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of AuthorizationModel.canShowDetailSheet.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of AuthorizationModel.canShowDetailSheet.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of AuthorizationModel.$canShowDetailSheet.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of AuthorizationModel.$canShowDetailSheet.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of AuthorizationModel.$canShowDetailSheet.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

void sub_213CE58A8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253F0B950)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F0B8C0);
    v0 = sub_213CE5A7C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253F0B950);
  }
}

void sub_213CE5900()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253F0B338)
  {
    v0 = sub_213CE5A7C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253F0B338);
  }
}

uint64_t dispatch thunk of AuthenticatorGlyph.localizedTitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AuthenticatorGlyph.symbol.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AuthenticatorGlyph.showsPhysicalButtonHint.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AuthenticatorGlyph.physicalButtonConfirmationTitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AuthenticatorGlyph.physicalButtonEdge.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of AuthenticatorGlyph.stateTransitionCompletionHandler.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of AuthenticatorGlyph.needUserIntent.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_213CE598C()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_213CE5998()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_213CE59A4()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_213CE59B0()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_213CE59BC()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_213CE59C8()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_213CE59D4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_213CE59E0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_213CE59EC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_213CE59F8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_213CE5A04()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_213CE5A10()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_213CE5A1C()
{
  return MEMORY[0x24BDB9488]();
}

uint64_t sub_213CE5A28()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_213CE5A34()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_213CE5A40()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_213CE5A4C()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_213CE5A58()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_213CE5A64()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_213CE5A70()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_213CE5A7C()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_213CE5A88()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_213CE5A94()
{
  return MEMORY[0x24BDBA120]();
}

uint64_t sub_213CE5AA0()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_213CE5AAC()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_213CE5AB8()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_213CE5AC4()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_213CE5AD0()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_213CE5ADC()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_213CE5AE8()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_213CE5AF4()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_213CE5B00()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_213CE5B0C()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_213CE5B18()
{
  return MEMORY[0x24BDEC638]();
}

uint64_t sub_213CE5B24()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_213CE5B30()
{
  return MEMORY[0x24BDECE88]();
}

uint64_t sub_213CE5B3C()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_213CE5B48()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_213CE5B54()
{
  return MEMORY[0x24BDED198]();
}

uint64_t sub_213CE5B60()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_213CE5B6C()
{
  return MEMORY[0x24BDED388]();
}

uint64_t sub_213CE5B78()
{
  return MEMORY[0x24BDED398]();
}

uint64_t sub_213CE5B84()
{
  return MEMORY[0x24BDED3A8]();
}

uint64_t sub_213CE5B90()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_213CE5B9C()
{
  return MEMORY[0x24BDED6C8]();
}

uint64_t sub_213CE5BA8()
{
  return MEMORY[0x24BDED6D0]();
}

uint64_t sub_213CE5BB4()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_213CE5BC0()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_213CE5BCC()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_213CE5BD8()
{
  return MEMORY[0x24BDEDE98]();
}

uint64_t sub_213CE5BE4()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_213CE5BF0()
{
  return MEMORY[0x24BDEDF38]();
}

uint64_t sub_213CE5BFC()
{
  return MEMORY[0x24BDEDF90]();
}

uint64_t sub_213CE5C08()
{
  return MEMORY[0x24BDEE020]();
}

uint64_t sub_213CE5C14()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_213CE5C20()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_213CE5C2C()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_213CE5C38()
{
  return MEMORY[0x24BDEE0A0]();
}

uint64_t sub_213CE5C44()
{
  return MEMORY[0x24BDEE0A8]();
}

uint64_t sub_213CE5C50()
{
  return MEMORY[0x24BDEE148]();
}

uint64_t sub_213CE5C5C()
{
  return MEMORY[0x24BDEE150]();
}

uint64_t sub_213CE5C68()
{
  return MEMORY[0x24BDEE1D8]();
}

uint64_t sub_213CE5C74()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_213CE5C80()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_213CE5C8C()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_213CE5C98()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_213CE5CA4()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_213CE5CB0()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_213CE5CBC()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_213CE5CC8()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_213CE5CD4()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_213CE5CE0()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_213CE5CEC()
{
  return MEMORY[0x24BDEE718]();
}

uint64_t sub_213CE5CF8()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_213CE5D04()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_213CE5D10()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_213CE5D1C()
{
  return MEMORY[0x24BDEECF8]();
}

uint64_t sub_213CE5D28()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_213CE5D34()
{
  return MEMORY[0x24BDEEEA0]();
}

uint64_t sub_213CE5D40()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_213CE5D4C()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_213CE5D58()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_213CE5D64()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_213CE5D70()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_213CE5D7C()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_213CE5D88()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_213CE5D94()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_213CE5DA0()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_213CE5DAC()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_213CE5DB8()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_213CE5DC4()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_213CE5DD0()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_213CE5DDC()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_213CE5DE8()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_213CE5DF4()
{
  return MEMORY[0x24BDEF358]();
}

uint64_t sub_213CE5E00()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_213CE5E0C()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_213CE5E18()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_213CE5E24()
{
  return MEMORY[0x24BDEFB50]();
}

uint64_t sub_213CE5E30()
{
  return MEMORY[0x24BDEFEF8]();
}

uint64_t sub_213CE5E3C()
{
  return MEMORY[0x24BDF0A10]();
}

uint64_t sub_213CE5E48()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_213CE5E54()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_213CE5E60()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_213CE5E6C()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_213CE5E78()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_213CE5E84()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_213CE5E90()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_213CE5E9C()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_213CE5EA8()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_213CE5EB4()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_213CE5EC0()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_213CE5ECC()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_213CE5ED8()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_213CE5EE4()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_213CE5EF0()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_213CE5EFC()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_213CE5F08()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_213CE5F14()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_213CE5F20()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_213CE5F2C()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_213CE5F38()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_213CE5F44()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_213CE5F50()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_213CE5F5C()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_213CE5F68()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_213CE5F74()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_213CE5F80()
{
  return MEMORY[0x24BDF1868]();
}

uint64_t sub_213CE5F8C()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_213CE5F98()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_213CE5FA4()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_213CE5FB0()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_213CE5FBC()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_213CE5FC8()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_213CE5FD4()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_213CE5FE0()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_213CE5FEC()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_213CE5FF8()
{
  return MEMORY[0x24BDF2100]();
}

uint64_t sub_213CE6004()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_213CE6010()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_213CE601C()
{
  return MEMORY[0x24BDF2968]();
}

uint64_t sub_213CE6028()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_213CE6034()
{
  return MEMORY[0x24BDF30D8]();
}

uint64_t sub_213CE6040()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_213CE604C()
{
  return MEMORY[0x24BDF3540]();
}

uint64_t sub_213CE6058()
{
  return MEMORY[0x24BDF3628]();
}

uint64_t sub_213CE6064()
{
  return MEMORY[0x24BDF3630]();
}

uint64_t sub_213CE6070()
{
  return MEMORY[0x24BDF37D8]();
}

uint64_t sub_213CE607C()
{
  return MEMORY[0x24BDF37E0]();
}

uint64_t sub_213CE6088()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_213CE6094()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_213CE60A0()
{
  return MEMORY[0x24BDF3980]();
}

uint64_t sub_213CE60AC()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_213CE60B8()
{
  return MEMORY[0x24BDF3BF8]();
}

uint64_t sub_213CE60C4()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_213CE60D0()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_213CE60DC()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_213CE60E8()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_213CE60F4()
{
  return MEMORY[0x24BDF3E78]();
}

uint64_t sub_213CE6100()
{
  return MEMORY[0x24BDF3E88]();
}

uint64_t sub_213CE610C()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_213CE6118()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_213CE6124()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_213CE6130()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_213CE613C()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_213CE6148()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_213CE6154()
{
  return MEMORY[0x24BDF4380]();
}

uint64_t sub_213CE6160()
{
  return MEMORY[0x24BDF4398]();
}

uint64_t sub_213CE616C()
{
  return MEMORY[0x24BDF4470]();
}

uint64_t sub_213CE6178()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_213CE6184()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_213CE6190()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_213CE619C()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_213CE61A8()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_213CE61B4()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_213CE61C0()
{
  return MEMORY[0x24BDF47F8]();
}

uint64_t sub_213CE61CC()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_213CE61D8()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_213CE61E4()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_213CE61F0()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_213CE61FC()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_213CE6208()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_213CE6214()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_213CE6220()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_213CE622C()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_213CE6238()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_213CE6244()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_213CE6250()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_213CE625C()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_213CE6268()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_213CE6274()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_213CE6280()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_213CE628C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_213CE6298()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_213CE62A4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_213CE62B0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_213CE62BC()
{
  return MEMORY[0x24BEE0CD8]();
}

uint64_t sub_213CE62C8()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_213CE62D4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_213CE62E0()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_213CE62EC()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_213CE62F8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_213CE6304()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_213CE6310()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_213CE631C()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_213CE6328()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_213CE6334()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_213CE6340()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_213CE634C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_213CE6358()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_213CE6364()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_213CE6370()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_213CE637C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_213CE6388()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_213CE6394()
{
  return MEMORY[0x24BEE2BC0]();
}

uint64_t sub_213CE63A0()
{
  return MEMORY[0x24BEE2BC8]();
}

uint64_t sub_213CE63AC()
{
  return MEMORY[0x24BEE2BD0]();
}

uint64_t sub_213CE63B8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_213CE63C4()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_213CE63D0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_213CE63DC()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_213CE63E8()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_213CE63F4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_213CE6400()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_213CE640C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_213CE6418()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_213CE6424()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_213CE6430()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_213CE643C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_213CE6448()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_213CE6454()
{
  return MEMORY[0x24BEE45D8]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t LAUIPhysicalButtonNormalizedFrame()
{
  return MEMORY[0x24BE60850]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
}

uint64_t MobileGestalt_get_homeButtonType()
{
  return MEMORY[0x24BED8600]();
}

uint64_t MobileGestalt_get_pearlIDCapability()
{
  return MEMORY[0x24BED8660]();
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAtAnyKeyPath()
{
  return MEMORY[0x24BEE4CE0]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

