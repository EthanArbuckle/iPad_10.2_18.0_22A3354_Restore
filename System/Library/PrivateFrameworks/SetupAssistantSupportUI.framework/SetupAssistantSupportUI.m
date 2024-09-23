void *sub_245DD018C()
{
  return &unk_2516FE9B8;
}

uint64_t sub_245DD0198(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_245DD01C4 + 4 * byte_245DDBD40[a1]))(1869373768, 0xE400000000000000);
}

uint64_t sub_245DD01C4()
{
  return 0x756F72676B636142;
}

unint64_t sub_245DD01E8()
{
  return 0xD000000000000010;
}

uint64_t sub_245DD0204()
{
  return 0x73756F6E696D754CLL;
}

void sub_245DD0228(char *a1)
{
  sub_245DD0234(*a1);
}

void sub_245DD0234(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_245DD0274(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_245DD02F4 + 4 * byte_245DDBD48[a2]))(0x756F72676B636142);
}

uint64_t sub_245DD02F4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x756F72676B636142 && v1 == 0xEF7478655420646ELL)
    v2 = 1;
  else
    v2 = sub_245DDB7E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_245DD03B8()
{
  char *v0;

  sub_245DD03C0(*v0);
}

void sub_245DD03C0(char a1)
{
  sub_245DDB7F8();
  __asm { BR              X10 }
}

uint64_t sub_245DD0408()
{
  sub_245DDB744();
  swift_bridgeObjectRelease();
  return sub_245DDB804();
}

void sub_245DD0494()
{
  __asm { BR              X10 }
}

uint64_t sub_245DD04C8()
{
  sub_245DDB744();
  return swift_bridgeObjectRelease();
}

void sub_245DD0540(uint64_t a1)
{
  char *v1;

  sub_245DD0548(a1, *v1);
}

void sub_245DD0548(uint64_t a1, char a2)
{
  sub_245DDB7F8();
  __asm { BR              X10 }
}

uint64_t sub_245DD058C()
{
  sub_245DDB744();
  swift_bridgeObjectRelease();
  return sub_245DDB804();
}

uint64_t sub_245DD0618@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_245DD36F4();
  *a1 = result;
  return result;
}

uint64_t sub_245DD0644()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_245DD066C + 4 * byte_245DDBD58[*v0]))();
}

void sub_245DD066C(_QWORD *a1@<X8>)
{
  *a1 = 0x756F72676B636142;
  a1[1] = 0xEF7478655420646ELL;
}

void sub_245DD0694(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000010;
  a1[1] = 0x8000000245DDC6A0;
}

void sub_245DD06B4(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "Luminous Text");
  *(_WORD *)(a1 + 14) = -4864;
}

void sub_245DD06DC(_QWORD *a1@<X8>)
{
  *a1 = &unk_2516FE9E0;
}

void *sub_245DD06EC()
{
  return &unk_245DDBD78;
}

double sub_245DD06F8()
{
  return -0.5;
}

void *sub_245DD0700()
{
  return &unk_245DDBD80;
}

double sub_245DD070C()
{
  return 3.9;
}

void *sub_245DD071C()
{
  return &unk_245DDBD88;
}

double sub_245DD0728()
{
  return 0.48;
}

void sub_245DD0734()
{
  qword_25751E690 = 0;
}

uint64_t *sub_245DD0740()
{
  if (qword_25751DEB0 != -1)
    swift_once();
  return &qword_25751E690;
}

double sub_245DD0780()
{
  return sub_245DD17D0(&qword_25751DEB0, (uint64_t)&qword_25751E690);
}

void sub_245DD079C()
{
  qword_25751E698 = 0x4034000000000000;
}

uint64_t *sub_245DD07AC()
{
  if (qword_25751DEB8 != -1)
    swift_once();
  return &qword_25751E698;
}

double sub_245DD07EC()
{
  return sub_245DD17D0(&qword_25751DEB8, (uint64_t)&qword_25751E698);
}

void sub_245DD0808()
{
  qword_25751E6A0 = 0x4043800000000000;
}

uint64_t *sub_245DD081C()
{
  if (qword_25751DEC0 != -1)
    swift_once();
  return &qword_25751E6A0;
}

double sub_245DD085C()
{
  return sub_245DD17D0(&qword_25751DEC0, (uint64_t)&qword_25751E6A0);
}

void *sub_245DD0878()
{
  return &unk_245DDBD90;
}

double sub_245DD0884()
{
  return 1.1;
}

void *sub_245DD0890()
{
  return &unk_245DDBD98;
}

double sub_245DD089C()
{
  return 2.0;
}

void *sub_245DD08A4()
{
  return &unk_245DDBDA0;
}

double sub_245DD08B0()
{
  return 0.2;
}

void sub_245DD08BC()
{
  qword_25751E6A8 = 0x4040000000000000;
}

uint64_t *sub_245DD08CC()
{
  if (qword_25751DEC8 != -1)
    swift_once();
  return &qword_25751E6A8;
}

double sub_245DD090C()
{
  return sub_245DD17D0(&qword_25751DEC8, (uint64_t)&qword_25751E6A8);
}

void sub_245DD0928()
{
  qword_25751E6B0 = 0x4059000000000000;
}

uint64_t *sub_245DD0938()
{
  if (qword_25751DED0 != -1)
    swift_once();
  return &qword_25751E6B0;
}

double sub_245DD0978()
{
  return sub_245DD17D0(qword_25751DED0, (uint64_t)&qword_25751E6B0);
}

void *sub_245DD0994()
{
  return &unk_245DDBDA8;
}

double sub_245DD09A0()
{
  return 0.04;
}

void *sub_245DD09AC()
{
  return &unk_245DDBDB0;
}

double sub_245DD09B8()
{
  return 0.1;
}

void *sub_245DD09C4()
{
  return &unk_245DDBDB8;
}

double sub_245DD09D0()
{
  return 0.15;
}

void *sub_245DD09E0()
{
  return &unk_245DDBDC0;
}

double sub_245DD09EC()
{
  return 1.4;
}

double sub_245DD09FC()
{
  return 50.0;
}

double sub_245DD0A08()
{
  return 0.6;
}

uint64_t sub_245DD0A18()
{
  return sub_245DDB2DC();
}

double sub_245DD0A44()
{
  double v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_245DDB30C();
  swift_release();
  swift_release();
  return v1;
}

void sub_245DD0AB4(uint64_t a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))(**(_QWORD **)a1 + 232))();
}

uint64_t sub_245DD0AE4(double *a1, uint64_t a2)
{
  return (*(uint64_t (**)(double))(**(_QWORD **)a2 + 240))(*a1);
}

uint64_t sub_245DD0B10()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_245DDB318();
}

void (*sub_245DD0B84(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_245DDB300();
  return sub_245DD0BFC;
}

void sub_245DD0BFC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_245DD0C48()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751D7F0);
  sub_245DDB2E8();
  return swift_endAccess();
}

uint64_t sub_245DD0CA8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751D7F8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751D7F0);
  sub_245DDB2F4();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_245DD0D7C(_QWORD *a1))(uint64_t a1, char a2)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751D7F8);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel__animationTime;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_25751D7F0);
  sub_245DDB2E8();
  swift_endAccess();
  return sub_245DD0E44;
}

void sub_245DD0E44(uint64_t a1, char a2)
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
    sub_245DDB2F4();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_245DDB2F4();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

id sub_245DD0F5C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v1 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___displayLinkManager;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___displayLinkManager);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___displayLinkManager);
  }
  else
  {
    v4 = v0;
    type metadata accessor for DisplayLinkManager();
    v5 = swift_allocObject();
    swift_weakInit();
    v6 = sub_245DDAE60((uint64_t)sub_245DD3E5C, v5);
    v7 = *(void **)(v0 + v1);
    *(_QWORD *)(v4 + v1) = v6;
    v3 = v6;

    v2 = 0;
  }
  v8 = v2;
  return v3;
}

uint64_t sub_245DD0FF8()
{
  return 0;
}

uint64_t sub_245DD1000()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_text);
  swift_bridgeObjectRetain();
  return v1;
}

double sub_245DD1038()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_luminousTextIntensity;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_245DD107C(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_luminousTextIntensity);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_245DD10CC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_245DD1110()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_luminousTextRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_245DD1154(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_luminousTextRadius);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_245DD11A4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_245DD11E8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousOffset;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_245DD122C(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousOffset);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_245DD127C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_245DD12C0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousForwardFade;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_245DD1304(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousForwardFade);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_245DD1354())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_245DD1398()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousSize;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_245DD13DC(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousSize);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_245DD142C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_245DD1470()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloTextShineAffectedRadius;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_245DD14B4(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloTextShineAffectedRadius);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_245DD1504())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_245DD1548()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloTextShineIntensity;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_245DD158C(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloTextShineIntensity);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_245DD15DC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_245DD1620()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloGlowIntensity;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_245DD1664(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloGlowIntensity);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_245DD16B4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_245DD16F8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloBlur;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_245DD173C(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloBlur);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_245DD178C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_245DD17D0(_QWORD *a1, uint64_t a2)
{
  if (*a1 != -1)
    swift_once();
  return *(double *)a2;
}

double sub_245DD1808()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloPadding;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_245DD184C(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloPadding);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_245DD189C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_245DD18E0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloOffset;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_245DD1924(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloOffset);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_245DD1974())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_245DD19BC()
{
  return sub_245DD377C((uint64_t)&unk_2516FEA08);
}

uint64_t sub_245DD19C8()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_245DD1A10(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_visibleLayers);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_245DD1A60())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

BOOL sub_245DD1AA4()
{
  uint64_t v0;
  double v1;

  type metadata accessor for ColorProducer();
  v1 = (*(double (**)(void))(*(_QWORD *)v0 + 232))();
  return sub_245DD4DFC(v1) >= 1.0;
}

uint64_t sub_245DD1AE8()
{
  return 0;
}

uint64_t sub_245DD1AF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___textGradientEntries;
  if (*(_QWORD *)(v0
                 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___textGradientEntries))
  {
    v2 = *(_QWORD *)(v0
                   + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___textGradientEntries);
  }
  else
  {
    v3 = v0;
    type metadata accessor for ColorProducer();
    v2 = sub_245DD477C();
    *(_QWORD *)(v3 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_245DD1B68(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1
            + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___textGradientEntries) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_245DD1B80(uint64_t *a1))(_QWORD *a1)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_245DD1AF0();
  return sub_245DD1BB4;
}

uint64_t sub_245DD1BB4(_QWORD *a1)
{
  *(_QWORD *)(a1[1]
            + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___textGradientEntries) = *a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_245DD1BCC()
{
  return swift_retain();
}

uint64_t sub_245DD1BDC(double a1)
{
  uint64_t v1;
  double v2;
  void (*v3)(_BYTE *, _QWORD);
  double *v4;
  double v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  uint64_t result;
  _BYTE v9[32];

  v2 = a1 * 1.4 * 1.2;
  v3 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v1 + 248))(v9);
  *v4 = v2 + *v4;
  v3(v9, 0);
  type metadata accessor for ColorProducer();
  v5 = (*(double (**)(void))(*(_QWORD *)v1 + 232))();
  if (sub_245DD4DFC(v5) >= 0.7
    && (*(_BYTE *)(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_didNotify) & 1) == 0)
  {
    v7 = *(uint64_t (**)(void))(v1 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_onFinishHandler);
    if (v7)
      v6 = v7();
  }
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 592))(v6);
  if ((result & 1) != 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)v1 + 696))();
  return result;
}

uint64_t sub_245DD1CE0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0;
  (*(void (**)(void))(*(_QWORD *)v0 + 672))();
  v2 = sub_245DD0F5C();
  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v2) + 0x98))();

  return (*(uint64_t (**)(double))(*(_QWORD *)v1 + 240))(-0.5);
}

void sub_245DD1D3C()
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
  id v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char *v22;
  void *v23;
  char *v24;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  _QWORD aBlock[7];

  v1 = sub_245DDB6CC();
  v37 = *(_QWORD *)(v1 - 8);
  v38 = v1;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v36 = (char *)v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_245DDB6E4();
  v34 = *(_QWORD *)(v3 - 8);
  v35 = v3;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v33 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_245DDB6FC();
  v31 = *(_QWORD *)(v5 - 8);
  v32 = v5;
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v30 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v29 = (char *)v26 - v9;
  if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 680))(v8) & 1) == 0)
    return;
  if (((*(uint64_t (**)(void))(*(_QWORD *)v0 + 688))() & 1) != 0)
    return;
  v10 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v10, sel_brightness);
  v12 = v11;

  if (v12 <= 0.7)
    return;
  v13 = (v12 + -0.7) * 100.0;
  if ((~*(_QWORD *)&v13 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v13 <= -9.22337204e18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v13 >= 9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v14 = (uint64_t)v13;
  v15 = swift_allocObject();
  v27 = v14;
  v28 = v15;
  *(double *)(v15 + 16) = v12;
  if (v14 < 1)
  {
LABEL_18:
    __break(1u);
    return;
  }
  v26[1] = sub_245DD37FC();
  v16 = 1;
  v17 = v29;
  v19 = v32;
  v18 = v33;
  v20 = v38;
  while (1)
  {
    v21 = (void *)sub_245DDB780();
    v22 = v30;
    sub_245DDB6F0();
    MEMORY[0x2495484C0](v22, (double)v16 * 0.01);
    v39 = *(void (**)(char *, uint64_t))(v31 + 8);
    v39(v22, v19);
    aBlock[4] = sub_245DD3838;
    aBlock[5] = v28;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_245DD2118;
    aBlock[3] = &block_descriptor;
    v23 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_245DDB6D8();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_245DD3A54(&qword_25751D808, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751D810);
    sub_245DD39D8(&qword_25751D818, &qword_25751D810, MEMORY[0x24BEE12C8]);
    v24 = v36;
    sub_245DDB78C();
    MEMORY[0x24954852C](v17, v18, v24, v23);
    _Block_release(v23);

    (*(void (**)(char *, uint64_t))(v37 + 8))(v24, v20);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v18, v35);
    v39(v17, v19);
    if (v27 == v16)
      break;
    if (__OFADD__(v16++, 1))
    {
      __break(1u);
      break;
    }
  }
  swift_release();
}

uint64_t sub_245DD2118(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

BOOL sub_245DD2144()
{
  id v0;
  double v1;
  double v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v0, sel_potentialEDRHeadroom);
  v2 = v1;

  return v2 > 2.0;
}

BOOL sub_245DD21A8()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_currentTraitCollection);
  v1 = objc_msgSend(v0, sel_userInterfaceStyle);

  return v1 == (id)2;
}

void sub_245DD2200()
{
  _QWORD *v0;

  v0 = sub_245DD0F5C();
  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();

}

uint64_t sub_245DD224C()
{
  uint64_t v0;

  *(_BYTE *)(v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_didNotify) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 664))();
}

uint64_t sub_245DD2264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;

  v10 = swift_allocObject();
  sub_245DD22D0(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t sub_245DD22D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
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
  _QWORD *v22;
  _QWORD *v23;
  _QWORD v25[2];

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751D7F0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel__animationTime;
  v25[1] = 0xBFE0000000000000;
  sub_245DDB2DC();
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v15, v14, v11);
  *(_QWORD *)(v5
            + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___displayLinkManager) = 0;
  *(_QWORD *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_luminousTextIntensity) = 0x400F333333333333;
  *(_QWORD *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_luminousTextRadius) = 0x3FDEB851EB851EB8;
  v16 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousOffset;
  if (qword_25751DEB0 != -1)
    swift_once();
  *(_QWORD *)(v5 + v16) = qword_25751E690;
  v17 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousForwardFade;
  if (qword_25751DEB8 != -1)
    swift_once();
  *(_QWORD *)(v5 + v17) = qword_25751E698;
  v18 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_textLuminousSize;
  if (qword_25751DEC0 != -1)
    swift_once();
  *(_QWORD *)(v5 + v18) = qword_25751E6A0;
  *(_QWORD *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloTextShineAffectedRadius) = 0x3FF199999999999ALL;
  *(_QWORD *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloTextShineIntensity) = 0x4000000000000000;
  *(_QWORD *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloGlowIntensity) = 0x3FC999999999999ALL;
  v19 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloBlur;
  if (qword_25751DEC8 != -1)
    swift_once();
  *(_QWORD *)(v5 + v19) = qword_25751E6A8;
  v20 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloPadding;
  if (qword_25751DED0[0] != -1)
    swift_once();
  *(_QWORD *)(v5 + v20) = qword_25751E6B0;
  *(_QWORD *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_haloOffset) = 0x3FA47AE147AE147BLL;
  v21 = OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_visibleLayers;
  *(_QWORD *)(v5 + v21) = sub_245DD377C((uint64_t)&unk_2516FEA30);
  *(_BYTE *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_didNotify) = 0;
  *(_QWORD *)(v5
            + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___textGradientEntries) = 0;
  v22 = (_QWORD *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_text);
  *v22 = a1;
  v22[1] = a2;
  *(_QWORD *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_finalColor) = a3;
  v23 = (_QWORD *)(v5 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_onFinishHandler);
  *v23 = a4;
  v23[1] = a5;
  return v5;
}

uint64_t sub_245DD25C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel__animationTime;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751D7F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___displayLinkManager));
  swift_bridgeObjectRelease();
  sub_245DD3954(*(_QWORD *)(v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_onFinishHandler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_245DD2670()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel__animationTime;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751D7F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel____lazy_storage___displayLinkManager));
  swift_bridgeObjectRelease();
  sub_245DD3954(*(_QWORD *)(v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI24WelcomeToDeviceViewModel_onFinishHandler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_245DD272C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t sub_245DD2738()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t sub_245DD2744()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t sub_245DD2750()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t sub_245DD275C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t sub_245DD2768()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t sub_245DD2774()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t sub_245DD2780()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t sub_245DD278C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 472))();
}

uint64_t sub_245DD2798()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 496))();
}

uint64_t sub_245DD27A4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 520))();
}

uint64_t sub_245DD27B0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 544))();
}

uint64_t sub_245DD27BC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 632))();
}

uint64_t sub_245DD27C8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 568))();
}

uint64_t sub_245DD27D4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 664))();
}

uint64_t sub_245DD27E0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 696))();
}

uint64_t sub_245DD27EC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 704))();
}

uint64_t sub_245DD27F8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 712))();
}

uint64_t sub_245DD2800@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for WelcomeToDeviceViewModel();
  result = sub_245DDB2D0();
  *a1 = result;
  return result;
}

void sub_245DD283C(uint64_t a1, char a2)
{
  sub_245DDB7F8();
  __asm { BR              X10 }
}

uint64_t sub_245DD28A0()
{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  uint64_t *v5;
  _BYTE *v6;
  uint64_t v7;

  swift_bridgeObjectRetain();
  sub_245DDB744();
  swift_bridgeObjectRelease();
  v2 = sub_245DDB804() & ~(-1 << *(_BYTE *)(v1 + 32));
  if (((*(_QWORD *)(v1 + 56 + ((v2 >> 3) & 0xFFFFFFFFFFFFF8)) >> v2) & 1) != 0)
    __asm { BR              X9 }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v5;
  *v5 = 0x8000000000000000;
  sub_245DD2ED0(v0, v2, isUniquelyReferenced_nonNull_native);
  *v5 = v7;
  swift_bridgeObjectRelease();
  result = 1;
  *v6 = (_BYTE)v0;
  return result;
}

uint64_t sub_245DD2B74()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751DB68);
  v3 = sub_245DDB7A4();
  if (!*(_QWORD *)(v2 + 16))
    goto LABEL_25;
  v4 = 1 << *(_BYTE *)(v2 + 32);
  v5 = (_QWORD *)(v2 + 56);
  if (v4 < 64)
    v6 = ~(-1 << v4);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v8 = (unint64_t)(v4 + 63) >> 6;
  swift_retain();
  if (v7)
  {
    v9 = __clz(__rbit64(v7));
    goto LABEL_20;
  }
  if (v8 > 1)
  {
    v10 = *(_QWORD *)(v2 + 64);
    v11 = 1;
    if (v10)
      goto LABEL_19;
    v11 = 2;
    if (v8 > 2)
    {
      v10 = *(_QWORD *)(v2 + 72);
      if (v10)
        goto LABEL_19;
      v11 = 3;
      if (v8 > 3)
      {
        v10 = *(_QWORD *)(v2 + 80);
        if (!v10)
        {
          v12 = 4;
          if (v8 > 4)
          {
            v10 = *(_QWORD *)(v2 + 88);
            if (v10)
            {
              v11 = 4;
              goto LABEL_19;
            }
            while (1)
            {
              v11 = v12 + 1;
              if (__OFADD__(v12, 1))
              {
                __break(1u);
                JUMPOUT(0x245DD2EC0);
              }
              if (v11 >= v8)
                break;
              v10 = v5[v11];
              ++v12;
              if (v10)
                goto LABEL_19;
            }
          }
          goto LABEL_21;
        }
LABEL_19:
        v9 = __clz(__rbit64(v10)) + (v11 << 6);
LABEL_20:
        v13 = *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + v9);
        sub_245DDB7F8();
        __asm { BR              X8 }
      }
    }
  }
LABEL_21:
  swift_release();
  v1 = v0;
  v14 = 1 << *(_BYTE *)(v2 + 32);
  if (v14 > 63)
    bzero((void *)(v2 + 56), ((unint64_t)(v14 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v5 = -1 << v14;
  *(_QWORD *)(v2 + 16) = 0;
LABEL_25:
  result = swift_release();
  *v1 = v3;
  return result;
}

void *sub_245DD2ED0(void *result, unint64_t a2, char a3)
{
  uint64_t v3;
  char v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  char v13;

  v5 = (char)result;
  v6 = *(_QWORD *)(*(_QWORD *)v3 + 16);
  v7 = *(_QWORD *)(*(_QWORD *)v3 + 24);
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if ((a3 & 1) != 0)
    {
      sub_245DD2B74();
      goto LABEL_8;
    }
    if (v7 <= v6)
    {
      sub_245DD33CC();
LABEL_8:
      sub_245DDB7F8();
      __asm { BR              X10 }
    }
    result = sub_245DD323C();
  }
  v8 = *v12;
  *(_QWORD *)(*v12 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_BYTE *)(*(_QWORD *)(v8 + 48) + a2) = v13;
  v9 = *(_QWORD *)(v8 + 16);
  v10 = __OFADD__(v9, 1);
  v11 = v9 + 1;
  if (v10)
  {
    __break(1u);
    JUMPOUT(0x245DD31F0);
  }
  *(_QWORD *)(v8 + 16) = v11;
  return result;
}

void *sub_245DD323C()
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
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751DB68);
  v2 = *v0;
  v3 = sub_245DDB798();
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
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
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
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
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
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_245DD33CC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751DB68);
  v3 = sub_245DDB7A4();
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
    goto LABEL_23;
  }
  v4 = 1 << *(_BYTE *)(v2 + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(v2 + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  swift_retain();
  if (v6)
  {
    v8 = __clz(__rbit64(v6));
    goto LABEL_20;
  }
  if (v7 > 1)
  {
    v9 = *(_QWORD *)(v2 + 64);
    v10 = 1;
    if (v9)
      goto LABEL_19;
    v10 = 2;
    if (v7 > 2)
    {
      v9 = *(_QWORD *)(v2 + 72);
      if (v9)
        goto LABEL_19;
      v10 = 3;
      if (v7 > 3)
      {
        v9 = *(_QWORD *)(v2 + 80);
        if (!v9)
        {
          v11 = 4;
          if (v7 > 4)
          {
            v9 = *(_QWORD *)(v2 + 88);
            if (v9)
            {
              v10 = 4;
              goto LABEL_19;
            }
            while (1)
            {
              v10 = v11 + 1;
              if (__OFADD__(v11, 1))
              {
                __break(1u);
                JUMPOUT(0x245DD36E4);
              }
              if (v10 >= v7)
                break;
              v9 = *(_QWORD *)(v2 + 56 + 8 * v10);
              ++v11;
              if (v9)
                goto LABEL_19;
            }
          }
          goto LABEL_21;
        }
LABEL_19:
        v8 = __clz(__rbit64(v9)) + (v10 << 6);
LABEL_20:
        v12 = *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + v8);
        sub_245DDB7F8();
        __asm { BR              X8 }
      }
    }
  }
LABEL_21:
  result = swift_release_n();
  v1 = v0;
LABEL_23:
  *v1 = v3;
  return result;
}

uint64_t sub_245DD36F4()
{
  unint64_t v0;

  v0 = sub_245DDB7D4();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495488F8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_245DD377C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  char *v4;
  char v5;
  char v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  sub_245DD3EC8();
  result = sub_245DDB75C();
  v7 = result;
  if (v2)
  {
    v4 = (char *)(a1 + 32);
    do
    {
      v5 = *v4++;
      sub_245DD283C((uint64_t)&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_245DD37EC()
{
  return swift_deallocObject();
}

unint64_t sub_245DD37FC()
{
  unint64_t result;

  result = qword_25751D800;
  if (!qword_25751D800)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25751D800);
  }
  return result;
}

void sub_245DD3838()
{
  uint64_t v0;
  double v1;
  id v2;

  swift_beginAccess();
  v1 = *(double *)(v0 + 16) + -0.01;
  swift_beginAccess();
  *(double *)(v0 + 16) = v1;
  v2 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  swift_beginAccess();
  objc_msgSend(v2, sel_setBrightness_, *(double *)(v0 + 16));

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
    result = MEMORY[0x249548904](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_245DD3954(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

unint64_t sub_245DD3968()
{
  unint64_t result;

  result = qword_25751D820;
  if (!qword_25751D820)
  {
    result = MEMORY[0x249548910](&unk_245DDBE10, &type metadata for VisibleLayer);
    atomic_store(result, (unint64_t *)&qword_25751D820);
  }
  return result;
}

uint64_t sub_245DD39AC()
{
  return sub_245DD39D8(&qword_25751D828, &qword_25751D830, MEMORY[0x24BEE12E0]);
}

uint64_t sub_245DD39D8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x249548910](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_245DD3A18(uint64_t a1)
{
  uint64_t result;

  result = sub_245DD3A54((unint64_t *)&qword_25751D838, (uint64_t (*)(uint64_t))type metadata accessor for WelcomeToDeviceViewModel, (uint64_t)&unk_245DDBF04);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_245DD3A54(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x249548910](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for WelcomeToDeviceViewModel()
{
  uint64_t result;

  result = qword_25751E210;
  if (!qword_25751E210)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_245DD3AD0()
{
  return MEMORY[0x24BDB9D70];
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for VisibleLayer(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for VisibleLayer(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245DD3BC8 + 4 * byte_245DDBD6D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_245DD3BFC + 4 * byte_245DDBD68[v4]))();
}

uint64_t sub_245DD3BFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245DD3C04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245DD3C0CLL);
  return result;
}

uint64_t sub_245DD3C18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245DD3C20);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_245DD3C24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245DD3C2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245DD3C38(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_245DD3C44(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for VisibleLayer()
{
  return &type metadata for VisibleLayer;
}

ValueMetadata *type metadata accessor for AnimationDefaults()
{
  return &type metadata for AnimationDefaults;
}

uint64_t sub_245DD3C6C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_245DD3C74(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_245DD3C7C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_245DD3C84(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_245DD3C8C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_245DD3C94(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_245DD3C9C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t sub_245DD3CA4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t sub_245DD3CAC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t sub_245DD3CB4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t sub_245DD3CBC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t sub_245DD3CC4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t sub_245DD3CCC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t sub_245DD3CD4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
}

uint64_t sub_245DD3CDC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t sub_245DD3CE4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t sub_245DD3CEC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 144))();
}

uint64_t sub_245DD3CF4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t sub_245DD3CFC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 160))();
}

uint64_t sub_245DD3D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 168))();
}

uint64_t sub_245DD3D0C()
{
  return type metadata accessor for WelcomeToDeviceViewModel();
}

void sub_245DD3D14()
{
  unint64_t v0;

  sub_245DD3DE4();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_245DD3DE4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25751D868[0])
  {
    v0 = sub_245DDB324();
    if (!v1)
      atomic_store(v0, qword_25751D868);
  }
}

uint64_t sub_245DD3E38()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_245DD3E5C(double a1)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    (*(void (**)(uint64_t, double))(*(_QWORD *)result + 656))(result, a1);
    return swift_release();
  }
  return result;
}

unint64_t sub_245DD3EC8()
{
  unint64_t result;

  result = qword_25751DB60;
  if (!qword_25751DB60)
  {
    result = MEMORY[0x249548910](&unk_245DDBE38, &type metadata for VisibleLayer);
    atomic_store(result, (unint64_t *)&qword_25751DB60);
  }
  return result;
}

void sub_245DD3F0C()
{
  swift_deletedMethodError();
  __break(1u);
}

void sub_245DD3F20(uint64_t (**a1)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  *a1 = sub_245DD3F30;
  a1[1] = 0;
}

uint64_t sub_245DD3F30@<X0>(uint64_t *a1@<X8>)
{
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  v2 = sub_245DDB4A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_245DDB588();
  sub_245DDB4B0();
  sub_245DDB360();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *a1 = v6;
  a1[1] = v8;
  a1[2] = v10;
  a1[3] = v12;
  a1[4] = v14;
  return result;
}

uint64_t sub_245DD4004()
{
  return sub_245DDB564();
}

double sub_245DD401C()
{
  double result;

  result = 0.0;
  xmmword_25751E730 = 0u;
  *(_OWORD *)&qword_25751E740 = 0u;
  return result;
}

__int128 *sub_245DD4030()
{
  if (qword_25751E220 != -1)
    swift_once();
  return &xmmword_25751E730;
}

double sub_245DD4070()
{
  if (qword_25751E220 != -1)
    swift_once();
  swift_beginAccess();
  return *(double *)&xmmword_25751E730;
}

uint64_t sub_245DD40DC(double a1, double a2, double a3, double a4)
{
  uint64_t result;

  if (qword_25751E220 != -1)
    swift_once();
  result = swift_beginAccess();
  *(double *)&xmmword_25751E730 = a1;
  *((double *)&xmmword_25751E730 + 1) = a2;
  qword_25751E740 = *(_QWORD *)&a3;
  unk_25751E748 = *(_QWORD *)&a4;
  return result;
}

uint64_t (*sub_245DD4168())()
{
  if (qword_25751E220 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_245DD41D4(uint64_t a1, double (*a2)(void))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(double *)a1 = a2();
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
}

uint64_t sub_245DD4200()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_245DD4210@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  if (qword_25751E220 != -1)
    swift_once();
  swift_beginAccess();
  result = *(double *)&xmmword_25751E730;
  v3 = *(_OWORD *)&qword_25751E740;
  *a1 = xmmword_25751E730;
  a1[1] = v3;
  return result;
}

double sub_245DD4280(_OWORD *a1, void (*a2)(_OWORD *__return_ptr))
{
  double result;
  __int128 v4;
  _OWORD v5[2];

  a2(v5);
  result = *(double *)v5;
  v4 = v5[1];
  *a1 = v5[0];
  a1[1] = v4;
  return result;
}

ValueMetadata *type metadata accessor for ViewGeometry()
{
  return &type metadata for ViewGeometry;
}

ValueMetadata *type metadata accessor for ViewSizeKey()
{
  return &type metadata for ViewSizeKey;
}

unint64_t sub_245DD42E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25751DB70;
  if (!qword_25751DB70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25751DB78);
    result = MEMORY[0x249548910](MEMORY[0x24BDEC6F8], v1);
    atomic_store(result, (unint64_t *)&qword_25751DB70);
  }
  return result;
}

uint64_t sub_245DD4330(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t sub_245DD436C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_245DD438C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_245DD4448(a1, &qword_25751DB80);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_245DD43D8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_245DD43F8(uint64_t result, int a2, int a3)
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
  sub_245DD4448(a1, &qword_25751DB88);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_245DD4448(a1, &qword_25751DB90);
}

void sub_245DD4448(uint64_t a1, unint64_t *a2)
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

uint64_t sub_245DD4494(uint64_t a1)
{
  return sub_245DD4678(0.890196078, 0.678431373, 0.380392157, a1, &qword_25751E750);
}

uint64_t *sub_245DD44BC()
{
  if (qword_25751E330 != -1)
    swift_once();
  return &qword_25751E750;
}

uint64_t sub_245DD44FC()
{
  return sub_245DD459C(&qword_25751E330);
}

uint64_t sub_245DD4518(uint64_t a1)
{
  return sub_245DD4678(0.941176471, 0.560784314, 0.635294118, a1, &qword_25751E758);
}

uint64_t *sub_245DD4540()
{
  if (qword_25751E338 != -1)
    swift_once();
  return &qword_25751E758;
}

uint64_t sub_245DD4580()
{
  return sub_245DD459C(&qword_25751E338);
}

uint64_t sub_245DD459C(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_245DD45D4(uint64_t a1)
{
  return sub_245DD4678(0.784313725, 0.654901961, 0.956862745, a1, &qword_25751E760);
}

uint64_t *sub_245DD45F8()
{
  if (qword_25751E340 != -1)
    swift_once();
  return &qword_25751E760;
}

uint64_t sub_245DD4638()
{
  return sub_245DD459C(&qword_25751E340);
}

uint64_t sub_245DD4654(uint64_t a1)
{
  return sub_245DD4678(0.462745098, 0.729411765, 0.964705882, a1, &qword_25751E768);
}

uint64_t sub_245DD4678(double a1, double a2, double a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  sub_245DDB57C();
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD))(v11 + 104))(v10, *MEMORY[0x24BDF3C28]);
  result = MEMORY[0x249548364](v10, a1, a2, a3, 1.0);
  *a5 = result;
  return result;
}

uint64_t *sub_245DD4720()
{
  if (qword_25751E348 != -1)
    swift_once();
  return &qword_25751E768;
}

uint64_t sub_245DD4760()
{
  return sub_245DD459C(&qword_25751E348);
}

uint64_t sub_245DD477C()
{
  uint64_t inited;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  double *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  unint64_t v28;
  unint64_t v29;
  double *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  double v43;
  double *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  unint64_t v48;
  unint64_t v49;
  double *v50;
  uint64_t result;
  double v52;
  uint64_t v53;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25751DB98);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_245DDC1E0;
  *(_QWORD *)(inited + 32) = sub_245DDB588() | 0x8000000000000000;
  *(_QWORD *)(inited + 40) = 0xC00B333333333333;
  if (qword_25751E348 != -1)
    goto LABEL_59;
  while (1)
  {
    v1 = qword_25751E768 | 0x8000000000000000;
    *(_QWORD *)(inited + 48) = qword_25751E768 | 0x8000000000000000;
    *(_QWORD *)(inited + 56) = 0xBFC3333333333333;
    *(_QWORD *)(inited + 64) = v1;
    *(_QWORD *)(inited + 72) = 0xBFE6666666666666;
    v2 = qword_25751E340;
    swift_retain_n();
    if (v2 != -1)
      swift_once();
    v3 = qword_25751E760 | 0x8000000000000000;
    *(_QWORD *)(inited + 80) = qword_25751E760 | 0x8000000000000000;
    *(_QWORD *)(inited + 88) = 0xBFC999999999999ALL;
    *(_QWORD *)(inited + 96) = v3;
    *(_QWORD *)(inited + 104) = 0xBFD999999999999ALL;
    v4 = qword_25751E338;
    swift_retain_n();
    if (v4 != -1)
      swift_once();
    v5 = qword_25751E758 | 0x8000000000000000;
    *(_QWORD *)(inited + 112) = qword_25751E758 | 0x8000000000000000;
    *(_QWORD *)(inited + 120) = 0xBFD0000000000000;
    *(_QWORD *)(inited + 128) = v5;
    *(_QWORD *)(inited + 136) = 0xBFD3333333333333;
    v6 = qword_25751E330;
    swift_retain_n();
    if (v6 != -1)
      swift_once();
    v7 = qword_25751E750;
    *(_QWORD *)(inited + 144) = qword_25751E750 | 0x8000000000000000;
    *(_QWORD *)(inited + 152) = 0xBFD3333333333333;
    swift_retain_n();
    v8 = *(_QWORD *)sub_245DD09AC();
    *(_QWORD *)(inited + 160) = v7;
    *(_QWORD *)(inited + 168) = v8;
    v9 = sub_245DDB588();
    v10 = *(_QWORD *)sub_245DD09C4();
    *(_QWORD *)(inited + 176) = v9 | 0x8000000000000000;
    *(_QWORD *)(inited + 184) = v10;
    v11 = *(_QWORD *)(inited + 16);
    if (!v11)
      break;
    swift_bridgeObjectRetain();
    v12 = 0.0;
    v13 = 0;
    v14 = 0;
    *(_QWORD *)&v52 = v11 - 1;
    v53 = inited;
    v15 = inited + 40;
    v16 = 1;
    v17 = 0xF000000000000007;
LABEL_10:
    v18 = (double *)(v15 + 16 * v14);
    inited = v14;
    do
    {
      v19 = *((_QWORD *)v18 - 1);
      v14 = inited + 1;
      if ((v19 & 0x8000000000000000) == 0)
      {
        v20 = *v18;
        swift_retain();
        sub_245DD55BC(v17);
        v16 = 0;
        v17 = v19;
        v12 = v20;
        v13 = inited;
        if (*(_QWORD *)&v52 != inited)
          goto LABEL_10;
        v21 = v53;
        swift_bridgeObjectRelease();
        v12 = v20;
        goto LABEL_18;
      }
      v18 += 2;
      ++inited;
    }
    while (v11 != v14);
    swift_bridgeObjectRelease();
    if ((v16 & 1) != 0)
    {
      sub_245DD55BC(v17);
      break;
    }
    v19 = v17;
    inited = v13;
    v21 = v53;
LABEL_18:
    if ((~v19 & 0xF000000000000007) == 0)
      break;
    if (inited < 0)
    {
      __break(1u);
    }
    else
    {
      v52 = v12;
      if (inited)
      {
        *(_QWORD *)&v22 = *(_QWORD *)&v12 ^ 0x8000000000000000;
        swift_bridgeObjectRetain();
        sub_245DD55D0(v19);
        v23 = (double *)(v21 + 16 * inited + 24);
        v24 = (_QWORD *)MEMORY[0x24BEE4AF8];
        v25 = inited;
        while (inited >= v25)
        {
          if (--v25 >= v11)
            goto LABEL_31;
          v26 = *((_QWORD *)v23 - 1);
          v27 = *v23;
          sub_245DD5434();
          sub_245DD5434();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v24 = sub_245DD5178(0, v24[2] + 1, 1, v24);
          v29 = v24[2];
          v28 = v24[3];
          if (v29 >= v28 >> 1)
            v24 = sub_245DD5178((_QWORD *)(v28 > 1), v29 + 1, 1, v24);
          v22 = v22 + v27;
          v24[2] = v29 + 1;
          v30 = (double *)&v24[2 * v29];
          *((_QWORD *)v30 + 4) = v26 & 0x7FFFFFFFFFFFFFFFLL;
          v30[5] = v22;
          sub_245DD5448();
          v23 -= 2;
          if (!v25)
            goto LABEL_32;
        }
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        v21 = v53;
        swift_bridgeObjectRelease();
        v31 = v24[2];
        if (!v31)
          goto LABEL_43;
LABEL_33:
        v32 = v31 - 1;
        if (v31 != 1)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v24 = sub_245DD53B4(v24);
          v33 = &v24[2 * v31 + 2];
          v34 = v24 + 5;
          v35 = 1;
          do
          {
            if (v35 - 1 != v32)
            {
              v37 = v24[2];
              if (v35 - 1 >= v37)
                goto LABEL_57;
              if (v32 >= v37)
                goto LABEL_58;
              v38 = *v34;
              v39 = *(v34 - 1);
              v40 = v33[1];
              *(v34 - 1) = *v33;
              *v34 = v40;
              *v33 = v39;
              v33[1] = v38;
              swift_retain();
              swift_release();
            }
            --v32;
            v33 -= 2;
            v34 += 2;
          }
          while (v35++ < (uint64_t)v32);
          v21 = v53;
        }
        goto LABEL_43;
      }
    }
    sub_245DD5434();
    v24 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v31 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    if (v31)
      goto LABEL_33;
LABEL_43:
    sub_245DD55D0(v19);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v24 = sub_245DD5178(0, v24[2] + 1, 1, v24);
    v42 = v24[2];
    v41 = v24[3];
    if (v42 >= v41 >> 1)
      v24 = sub_245DD5178((_QWORD *)(v41 > 1), v42 + 1, 1, v24);
    v43 = -v52;
    v24[2] = v42 + 1;
    v44 = (double *)&v24[2 * v42];
    *((_QWORD *)v44 + 4) = v19 & 0x7FFFFFFFFFFFFFFFLL;
    v44[5] = -v52;
    if (inited >= v11 || inited + 1 == v11)
    {
LABEL_55:
      sub_245DD55BC(v19);
      sub_245DD55BC(v19);
      swift_setDeallocating();
      swift_arrayDestroy();
      return (uint64_t)v24;
    }
    swift_bridgeObjectRetain();
    v45 = ~inited + v11;
    inited = v21 + 16 * inited + 56;
    while (v45)
    {
      v46 = *(_QWORD *)(inited - 8);
      v47 = *(double *)inited;
      sub_245DD5434();
      sub_245DD5434();
      v49 = v24[2];
      v48 = v24[3];
      if (v49 >= v48 >> 1)
        v24 = sub_245DD5178((_QWORD *)(v48 > 1), v49 + 1, 1, v24);
      v43 = v43 + v47;
      v24[2] = v49 + 1;
      v50 = (double *)&v24[2 * v49];
      *((_QWORD *)v50 + 4) = v46 & 0x7FFFFFFFFFFFFFFFLL;
      v50[5] = v43;
      sub_245DD5448();
      inited += 16;
      if (!--v45)
      {
        swift_bridgeObjectRelease();
        goto LABEL_55;
      }
    }
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
LABEL_59:
    swift_once();
  }
  result = sub_245DDB7C8();
  __break(1u);
  return result;
}

double sub_245DD4DFC(double a1)
{
  double result;
  double v3;

  result = 0.0;
  if (a1 >= 1.5)
  {
    v3 = fmin((a1 + -1.5) / 3.6, 1.0);
    return v3 * v3 * (3.0 - (v3 + v3));
  }
  return result;
}

double sub_245DD4E44@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  char v21;
  void (*v22)(char *, uint64_t);
  char v23;
  double result;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v6 = sub_245DDB3F0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = MEMORY[0x24BEE4AF8];
  if (v10)
  {
    v26 = a2;
    *(_QWORD *)&v27 = MEMORY[0x24BEE4AF8];
    sub_245DD5298(0, v10, 0);
    v11 = v27;
    v12 = a1 + 40;
    do
    {
      swift_retain();
      v13 = sub_245DDB684();
      v15 = v14;
      *(_QWORD *)&v27 = v11;
      v17 = *(_QWORD *)(v11 + 16);
      v16 = *(_QWORD *)(v11 + 24);
      if (v17 >= v16 >> 1)
      {
        sub_245DD5298((char *)(v16 > 1), v17 + 1, 1);
        v11 = v27;
      }
      *(_QWORD *)(v11 + 16) = v17 + 1;
      v18 = v11 + 16 * v17;
      *(_QWORD *)(v18 + 32) = v13;
      *(_QWORD *)(v18 + 40) = v15;
      v12 += 16;
      --v10;
    }
    while (v10);
  }
  v19 = *MEMORY[0x24BDED100];
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 104);
  v20(v9, v19, v6);
  v21 = sub_245DDB3E4();
  v22 = *(void (**)(char *, uint64_t))(v7 + 8);
  v22(v9, v6);
  if ((v21 & 1) != 0)
    sub_245DDB6B4();
  else
    sub_245DDB6C0();
  v20(v9, v19, v6);
  v23 = sub_245DDB3E4();
  v22(v9, v6);
  if ((v23 & 1) != 0)
    sub_245DDB6C0();
  else
    sub_245DDB6B4();
  MEMORY[0x249548448](v11);
  sub_245DDB3A8();
  result = *(double *)&v27;
  v25 = v28;
  *(_OWORD *)a3 = v27;
  *(_OWORD *)(a3 + 16) = v25;
  *(_QWORD *)(a3 + 32) = v29;
  return result;
}

double sub_245DD5054()
{
  return 0.0;
}

uint64_t sub_245DD505C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_245DDB3F0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDED100], v0);
  sub_245DDB3E4();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_245DD5160()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_245DD5168()
{
  return swift_deallocClassInstance();
}

_QWORD *sub_245DD5178(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751DC40);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751DC48);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_245DD5298(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_245DD52B4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_245DD52B4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751DC38);
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

_QWORD *sub_245DD53B4(_QWORD *a1)
{
  return sub_245DD5178(0, a1[2], 0, a1);
}

ValueMetadata *type metadata accessor for SiriColorProfile()
{
  return &type metadata for SiriColorProfile;
}

uint64_t type metadata accessor for ColorProducer()
{
  return objc_opt_self();
}

_QWORD *initializeBufferWithCopyOfBuffer for ColorTracker(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  sub_245DD5434();
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t sub_245DD5434()
{
  return swift_retain();
}

uint64_t destroy for ColorTracker()
{
  return sub_245DD5448();
}

uint64_t sub_245DD5448()
{
  return swift_release();
}

_QWORD *assignWithCopy for ColorTracker(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  sub_245DD5434();
  *a1 = v3;
  a1[1] = v4;
  sub_245DD5448();
  return a1;
}

_OWORD *assignWithTake for ColorTracker(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  sub_245DD5448();
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorTracker(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7F && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 127);
  v3 = (((*(_QWORD *)a1 >> 57) >> 6) | (2 * ((*(_QWORD *)a1 >> 57) & 0x38 | *(_QWORD *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7E)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ColorTracker(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7E)
  {
    *(_QWORD *)result = a2 - 127;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
    {
      v3 = (-a2 >> 1) & 0x3F | ((-a2 & 0x7F) << 6);
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
      *(_QWORD *)(result + 8) = 0;
    }
  }
  return result;
}

uint64_t sub_245DD5578(_QWORD *a1)
{
  return *a1 >> 63;
}

_QWORD *sub_245DD5584(_QWORD *result)
{
  *result &= ~0x8000000000000000;
  return result;
}

uint64_t *sub_245DD5594(uint64_t *result, uint64_t a2)
{
  *result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 63);
  return result;
}

ValueMetadata *type metadata accessor for ColorTracker()
{
  return &type metadata for ColorTracker;
}

uint64_t sub_245DD55BC(uint64_t result)
{
  if ((~result & 0xF000000000000007) != 0)
    return sub_245DD5448();
  return result;
}

uint64_t sub_245DD55D0(uint64_t result)
{
  if ((~result & 0xF000000000000007) != 0)
    return sub_245DD5434();
  return result;
}

id sub_245DD5630()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewController);
  swift_beginAccess();
  return *v1;
}

void sub_245DD56D0(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewController);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

id sub_245DD5720(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];

  v8 = (void *)sub_245DDB72C();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v12[4] = a4;
    v12[5] = a5;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 1107296256;
    v12[2] = sub_245DD2118;
    v12[3] = &block_descriptor_0;
    v9 = _Block_copy(v12);
    swift_release();
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithText_finalTextColor_onAnimationCompleteHandler_, v8, a3, v9);

  _Block_release(v9);
  return v10;
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

id sub_245DD5818(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v7;

  v7 = sub_245DD5AB4(a1, a2, a3, a4, a5);
  sub_245DD3954(a4);

  return v7;
}

Swift::Void __swiftcall SASWelcomeToDeviceViewControllerProvider.startAnimation()()
{
  uint64_t v0;

  (*(void (**)(void))(**(_QWORD **)(v0 + OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewModel) + 664))();
}

Swift::Void __swiftcall SASWelcomeToDeviceViewControllerProvider.stopAnimation()()
{
  uint64_t v0;

  (*(void (**)(void))(**(_QWORD **)(v0 + OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewModel) + 696))();
}

void __swiftcall SASWelcomeToDeviceViewControllerProvider.init()(SASWelcomeToDeviceViewControllerProvider *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void SASWelcomeToDeviceViewControllerProvider.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_245DD5AB4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  objc_super v24;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DC88);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (uint64_t *)((char *)&v24 - v15);
  v17 = type metadata accessor for WelcomeToDeviceViewModel();
  v18 = v5;
  v19 = MEMORY[0x249548328](a3);
  sub_245DD5CA0(a4);
  *(_QWORD *)&v18[OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewModel] = sub_245DD2264(a1, a2, v19, a4, a5);
  v20 = sub_245DD5CB0();
  swift_retain();
  sub_245DD64F0(v17, v20, v16);
  sub_245DD5CF8((uint64_t)v16, (uint64_t)v14);
  v21 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_25751DC98));
  v22 = sub_245DDB498();
  sub_245DD5D40((uint64_t)v16);
  *(_QWORD *)&v18[OBJC_IVAR___SASWelcomeToDeviceViewControllerProvider_viewController] = v22;

  v24.receiver = v18;
  v24.super_class = (Class)SASWelcomeToDeviceViewControllerProvider;
  return objc_msgSendSuper2(&v24, sel_init);
}

unint64_t type metadata accessor for SASWelcomeToDeviceViewControllerProvider()
{
  unint64_t result;

  result = qword_25751E350[0];
  if (!qword_25751E350[0])
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, qword_25751E350);
  }
  return result;
}

uint64_t sub_245DD5C70()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_245DD5C94()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_245DD5CA0(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

unint64_t sub_245DD5CB0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25751DC90;
  if (!qword_25751DC90)
  {
    v1 = type metadata accessor for WelcomeToDeviceViewModel();
    result = MEMORY[0x249548910](&unk_245DDBEE8, v1);
    atomic_store(result, (unint64_t *)&qword_25751DC90);
  }
  return result;
}

uint64_t sub_245DD5CF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DC88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_245DD5D40(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DC88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_245DD5D84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = sub_245DDB48C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCA0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245DDAD84(v2, (uint64_t)v10, &qword_25751DCA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_245DDB3F0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_245DDB768();
    v14 = sub_245DDB4BC();
    if (os_log_type_enabled(v14, v13))
    {
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v18 = v16;
      *(_DWORD *)v15 = 136315138;
      *(_QWORD *)(v15 + 4) = sub_245DD9688(0x694474756F79614CLL, 0xEF6E6F6974636572, &v18);
      _os_log_impl(&dword_245DCE000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249548994](v16, -1, -1);
      MEMORY[0x249548994](v15, -1, -1);
    }

    sub_245DDB480();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_245DD5F9C@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCA0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_245DD5FE0()
{
  return sub_245DDB420();
}

uint64_t sub_245DD6000(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_245DDB3F0();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_245DDB42C();
}

uint64_t sub_245DD607C()
{
  return sub_245DDB3B4();
}

uint64_t sub_245DD6084(uint64_t a1)
{
  sub_245DD9BB4(a1);
  return swift_unknownObjectRetain();
}

uint64_t sub_245DD6098(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t result;

  v4 = v2 + *(int *)(a2 + 36);
  result = swift_unknownObjectRelease();
  *(_QWORD *)(v4 + 8) = a1;
  return result;
}

uint64_t (*sub_245DD60C8())()
{
  return nullsub_1;
}

uint64_t sub_245DD60E0()
{
  return sub_245DDB3C0();
}

double sub_245DD60FC@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  type metadata accessor for CGRect(0);
  sub_245DDB618();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  return result;
}

double sub_245DD6150()
{
  double v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCA8);
  sub_245DDB624();
  return v1;
}

uint64_t sub_245DD61A8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCA8);
  return sub_245DDB630();
}

void (*sub_245DD6204(_QWORD *a1, uint64_t a2))(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = malloc(0x98uLL);
  *a1 = v5;
  v6 = (uint64_t *)(v2 + *(int *)(a2 + 40));
  v7 = *v6;
  v8 = v6[1];
  v5[13] = *v6;
  v5[14] = v8;
  v9 = v6[2];
  v10 = v6[3];
  v5[15] = v9;
  v5[16] = v10;
  v11 = v6[4];
  v5[17] = v11;
  *v5 = v7;
  v5[1] = v8;
  v5[2] = v9;
  v5[3] = v10;
  v5[4] = v11;
  swift_retain();
  v5[18] = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCA8);
  sub_245DDB624();
  return sub_245DD6298;
}

void sub_245DD6298(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  __int128 v3;

  v1 = *(_OWORD **)a1;
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 136);
  v3 = *(_OWORD *)(*(_QWORD *)a1 + 120);
  *v1 = *(_OWORD *)(*(_QWORD *)a1 + 104);
  v1[1] = v3;
  *((_QWORD *)v1 + 4) = v2;
  *(_OWORD *)((char *)v1 + 72) = *(_OWORD *)((char *)v1 + 40);
  *(_OWORD *)((char *)v1 + 88) = *(_OWORD *)((char *)v1 + 56);
  sub_245DDB630();
  swift_release();
  free(v1);
}

double sub_245DD62EC()
{
  return 0.0;
}

__n128 sub_245DD6300@<Q0>(uint64_t a1@<X8>)
{
  __n128 result;
  uint64_t v3;
  uint64_t v4;
  __n128 v5;
  __int128 v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCA8);
  sub_245DDB63C();
  result = v5;
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(__n128 *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 32) = v6;
  return result;
}

double sub_245DD6364(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  double (*v3)(uint64_t, uint64_t);
  double v4;

  v2 = *(_QWORD *)(a1 + 16);
  v1 = *(_QWORD *)(a1 + 24);
  v3 = *(double (**)(uint64_t, uint64_t))(v1 + 104);
  swift_unknownObjectRetain();
  v4 = v3(v2, v1);
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_245DD63C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t ObjCClassFromMetadata;
  id v7;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCA0);
  swift_storeEnumTagMultiPayload();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DC88);
  v3 = (char *)a1 + *(int *)(v2 + 40);
  type metadata accessor for CGRect(0);
  sub_245DDB618();
  *(_OWORD *)v3 = v9;
  *((_OWORD *)v3 + 1) = v10;
  *((_QWORD *)v3 + 4) = v11;
  v4 = (uint64_t *)((char *)a1 + *(int *)(v2 + 36));
  type metadata accessor for WelcomeToDeviceViewModel();
  sub_245DDA75C();
  swift_retain();
  *v4 = sub_245DDB3B4();
  v4[1] = v5;
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata, 0, 0, 0, 0);
  sub_245DDB390();

  return swift_release();
}

uint64_t sub_245DD64F0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t ObjCClassFromMetadata;
  id v12;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  *a3 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCA0);
  swift_storeEnumTagMultiPayload();
  v7 = type metadata accessor for WelcomeToDeviceView(0, a1, a2, v6);
  v8 = (char *)a3 + *(int *)(v7 + 40);
  type metadata accessor for CGRect(0);
  sub_245DDB618();
  *(_OWORD *)v8 = v14;
  *((_OWORD *)v8 + 1) = v15;
  *((_QWORD *)v8 + 4) = v16;
  v9 = (uint64_t *)((char *)a3 + *(int *)(v7 + 36));
  swift_unknownObjectRetain();
  *v9 = sub_245DDB3B4();
  v9[1] = v10;
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v12 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata, 0, 0, 0, 0);
  sub_245DDB390();

  return swift_unknownObjectRelease();
}

uint64_t sub_245DD6618@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t KeyPath;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v19;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCB0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCB8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v11 = sub_245DDB69C();
  v11[1] = v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCC0);
  sub_245DD6794(v3, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), (uint64_t *)((char *)v11 + *(int *)(v13 + 44)));
  sub_245DDB5B8();
  v14 = sub_245DDB5C4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v8, 0, 1, v14);
  KeyPath = swift_getKeyPath();
  v16 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25751DCC8) + 36));
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCD0);
  sub_245DDAD84((uint64_t)v8, (uint64_t)v16 + *(int *)(v17 + 28), &qword_25751DCB0);
  *v16 = KeyPath;
  sub_245DDAD84((uint64_t)v11, a2, &qword_25751DCB8);
  sub_245DDAD04((uint64_t)v8, &qword_25751DCB0);
  return sub_245DDAD04((uint64_t)v11, &qword_25751DCB8);
}

uint64_t sub_245DD6794@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t (*v34)(CGFloat *, uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  void (*v42)(uint64_t, _QWORD *);
  void (*v43)(uint64_t, _QWORD *);
  void (*v44)(uint64_t, _QWORD *);
  uint64_t v45;
  void (*v46)(uint64_t, _QWORD *);
  _QWORD *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  uint64_t v70;
  double v71;
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
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t (*v89)(CGFloat *, uint64_t, uint64_t, uint64_t);
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD v96[2];
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t (*v102)(CGFloat *, uint64_t, uint64_t, uint64_t);
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  __int128 v109;
  uint64_t v110;
  __int128 v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _QWORD *v125;
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
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint64_t v142;
  char v143;
  uint64_t v144;
  char v145;
  uint64_t v146;
  char v147;
  __int128 v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;

  v118 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DD38);
  MEMORY[0x24BDAC7A8](v7);
  v117 = (_QWORD *)((char *)v96 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DD40);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v119 = (uint64_t)v96 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v124 = (uint64_t)v96 - v12;
  v98 = sub_245DDB3F0();
  v101 = *(_QWORD *)(v98 - 8);
  MEMORY[0x24BDAC7A8](v98);
  v100 = (uint64_t)v96 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = sub_245DDB3D8();
  v103 = *(_QWORD *)(v106 - 8);
  MEMORY[0x24BDAC7A8](v106);
  v121 = (char *)v96 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = sub_245DDB678();
  v107 = *(_QWORD *)(v108 - 8);
  MEMORY[0x24BDAC7A8](v108);
  v105 = (char *)v96 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DD48);
  *(_QWORD *)&v111 = *(_QWORD *)(v112 - 8);
  MEMORY[0x24BDAC7A8](v112);
  *(_QWORD *)&v109 = (char *)v96 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DD50);
  MEMORY[0x24BDAC7A8](v104);
  v113 = (char *)v96 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DD58);
  MEMORY[0x24BDAC7A8](v110);
  v116 = (uint64_t)v96 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DD60);
  v19 = MEMORY[0x24BDAC7A8](v115);
  v123 = (uint64_t)v96 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v114 = (uint64_t)v96 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v122 = (uint64_t)v96 - v23;
  v24 = a2;
  v125 = (_QWORD *)a3;
  v26 = type metadata accessor for WelcomeToDeviceView(0, a2, a3, v25);
  v27 = *(_QWORD *)(v26 - 8);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)v96 - v29;
  v31 = v28;
  v149.origin.x = sub_245DD6150();
  v154.origin.x = 0.0;
  v154.origin.y = 0.0;
  v154.size.width = 0.0;
  v154.size.height = 0.0;
  v32 = CGRectEqualToRect(v149, v154);
  v33 = 0;
  v120 = 0;
  v126 = 0;
  v131 = 0;
  v130 = 0;
  v129 = 0;
  v128 = 0;
  v127 = 0;
  v134 = 0;
  v133 = 0;
  v34 = 0;
  v132 = 0;
  if (v32)
  {
    v35 = sub_245DD74F8(v31, (uint64_t)&v135);
    v33 = v135;
    v120 = v136;
    v126 = v137;
    v131 = v138;
    v129 = *((_QWORD *)&v139 + 1);
    v130 = v139;
    v128 = v140;
    v127 = BYTE8(v140);
    nullsub_1(v35);
    v134 = sub_245DDB69C();
    v133 = v36;
    (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v30, a1, v31);
    v37 = (*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
    v38 = swift_allocObject();
    v39 = v125;
    *(_QWORD *)(v38 + 16) = v24;
    *(_QWORD *)(v38 + 24) = v39;
    v132 = v38;
    (*(void (**)(unint64_t, char *, uint64_t))(v27 + 32))(v38 + v37, v30, v31);
    v34 = sub_245DDAA1C;
  }
  v99 = v33;
  v102 = v34;
  v40 = v31;
  v150.origin.x = sub_245DD6150();
  CGRectGetWidth(v150);
  v151.origin.x = sub_245DD6150();
  CGRectGetHeight(v151);
  sub_245DD6364(v31);
  sub_245DDB69C();
  sub_245DDB354();
  v135 = v144;
  LOBYTE(v136) = v145;
  v137 = v146;
  LOBYTE(v138) = v147;
  v139 = v148;
  sub_245DDB384();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751DD68);
  sub_245DDB66C();
  v97 = swift_allocObject();
  *(_OWORD *)(v97 + 16) = xmmword_245DDC250;
  type metadata accessor for ColorProducer();
  v41 = v125;
  v42 = (void (*)(uint64_t, _QWORD *))v125[15];
  swift_unknownObjectRetain();
  v42(v24, v41);
  swift_unknownObjectRelease();
  v152.origin.x = sub_245DD6150();
  CGRectGetWidth(v152);
  v43 = (void (*)(uint64_t, _QWORD *))v41[14];
  swift_unknownObjectRetain();
  v43(v24, v41);
  swift_unknownObjectRelease();
  v44 = (void (*)(uint64_t, _QWORD *))v41[2];
  swift_unknownObjectRetain();
  v44(v24, v41);
  swift_unknownObjectRelease();
  v45 = v100;
  sub_245DD5D84(v100);
  sub_245DD505C();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v45, v98);
  v153.origin.x = sub_245DD6150();
  CGRectGetHeight(v153);
  sub_245DD6364(v40);
  sub_245DDB660();
  sub_245DDB648();
  v46 = (void (*)(uint64_t, _QWORD *))v41[11];
  swift_unknownObjectRetain();
  v46(v24, v41);
  swift_unknownObjectRelease();
  sub_245DDB654();
  v96[1] = v40;
  swift_unknownObjectRetain();
  v47 = v41;
  sub_245DD0A08();
  swift_unknownObjectRelease();
  sub_245DDB654();
  v48 = v105;
  v49 = v121;
  sub_245DDB3CC();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v103 + 8))(v49, v106);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751DD70);
  sub_245DDA7A4();
  v50 = v109;
  sub_245DDB54C();
  (*(void (**)(char *, uint64_t))(v107 + 8))(v48, v108);
  v96[0] = a1;
  swift_unknownObjectRetain();
  v51 = sub_245DD09FC();
  swift_unknownObjectRelease();
  v52 = v111;
  v53 = (uint64_t)v113;
  v54 = v112;
  (*(void (**)(char *, uint64_t, uint64_t))(v111 + 16))(v113, v50, v112);
  v55 = v53 + *(int *)(v104 + 36);
  *(double *)v55 = v51;
  *(_BYTE *)(v55 + 8) = 0;
  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v50, v54);
  v121 = (char *)sub_245DDB69C();
  v112 = v56;
  sub_245DD7680(v24, v47, (uint64_t)&v135);
  v57 = v135;
  LOBYTE(v47) = v136;
  v58 = v137;
  v59 = v138;
  v60 = *((_QWORD *)&v139 + 1);
  v61 = v139;
  v111 = v140;
  v109 = v141;
  v62 = v142;
  LOBYTE(v40) = v143;
  v63 = v116;
  sub_245DDAD84(v53, v116, &qword_25751DD50);
  v64 = v63 + *(int *)(v110 + 36);
  v65 = v112;
  *(_QWORD *)v64 = v121;
  *(_QWORD *)(v64 + 8) = v65;
  *(_QWORD *)(v64 + 16) = v57;
  *(_BYTE *)(v64 + 24) = (_BYTE)v47;
  *(_QWORD *)(v64 + 32) = v58;
  *(_BYTE *)(v64 + 40) = v59;
  *(_QWORD *)(v64 + 48) = v61;
  *(_QWORD *)(v64 + 56) = v60;
  v66 = v109;
  *(_OWORD *)(v64 + 64) = v111;
  *(_OWORD *)(v64 + 80) = v66;
  *(_QWORD *)(v64 + 96) = v62;
  *(_BYTE *)(v64 + 104) = v40;
  sub_245DDAD04(v53, &qword_25751DD50);
  v67 = v96[0];
  v68 = (uint64_t)v125;
  v69 = (uint64_t (*)(uint64_t, uint64_t))v125[16];
  swift_unknownObjectRetain();
  v70 = v69(v24, v68);
  swift_unknownObjectRelease();
  LOBYTE(v60) = sub_245DD7950(0, v70);
  swift_bridgeObjectRelease();
  if ((v60 & 1) != 0)
    v71 = 1.0;
  else
    v71 = 0.0;
  v72 = v114;
  sub_245DDAD84(v63, v114, &qword_25751DD58);
  *(double *)(v72 + *(int *)(v115 + 36)) = v71;
  sub_245DDAD04(v63, &qword_25751DD58);
  v73 = v122;
  sub_245DDAD40(v72, v122, &qword_25751DD60);
  v74 = sub_245DDB69C();
  v75 = (uint64_t)v117;
  *v117 = v74;
  *(_QWORD *)(v75 + 8) = v76;
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DD88);
  sub_245DD7A38(v67, v24, v68, v75 + *(int *)(v77 + 44));
  v78 = v119;
  sub_245DDAD84(v75, v119, &qword_25751DD38);
  sub_245DDAD04(v75, &qword_25751DD38);
  v79 = v124;
  sub_245DDAD40(v78, v124, &qword_25751DD40);
  v80 = v73;
  v81 = v123;
  sub_245DDAD84(v80, v123, &qword_25751DD60);
  sub_245DDAD84(v79, v78, &qword_25751DD40);
  v82 = v118;
  v83 = v99;
  v84 = v120;
  *v118 = v99;
  v82[1] = v84;
  v85 = v131;
  v82[2] = v126;
  v82[3] = v85;
  v86 = v129;
  v82[4] = v130;
  v82[5] = v86;
  v87 = v127;
  v82[6] = v128;
  v82[7] = v87;
  v88 = v134;
  v82[8] = 0;
  v82[9] = v88;
  v134 = v88;
  v89 = v102;
  v82[10] = v133;
  v82[11] = (uint64_t)v89;
  v90 = v132;
  v82[12] = v132;
  v132 = v90;
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DD90);
  sub_245DDAD84(v81, (uint64_t)v82 + *(int *)(v91 + 48), &qword_25751DD60);
  sub_245DDAD84(v78, (uint64_t)v82 + *(int *)(v91 + 64), &qword_25751DD40);
  v92 = v84;
  v93 = v84;
  LOBYTE(v84) = v126;
  v94 = v131;
  sub_245DDA854(v83, v93, v126, v131);
  sub_245DDAD04(v124, &qword_25751DD40);
  sub_245DDAD04(v122, &qword_25751DD60);
  sub_245DDAD04(v78, &qword_25751DD40);
  sub_245DDAD04(v123, &qword_25751DD60);
  return sub_245DDA8C0(v83, v92, v84, v94);
}

uint64_t sub_245DD74F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t KeyPath;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 24);
  swift_unknownObjectRetain();
  v5(v4, v3);
  swift_unknownObjectRelease();
  sub_245DDAAB0();
  v6 = sub_245DDB528();
  v8 = v7;
  LOBYTE(v5) = v9 & 1;
  sub_245DDB4C8();
  v10 = sub_245DDB51C();
  v12 = v11;
  v14 = v13;
  swift_release();
  sub_245DDA91C(v6, v8, (char)v5);
  swift_bridgeObjectRelease();
  sub_245DDB4D4();
  v15 = sub_245DDB510();
  v17 = v16;
  LOBYTE(v4) = v18;
  v20 = v19;
  sub_245DDA91C(v10, v12, v14 & 1);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  result = swift_getKeyPath();
  *(_QWORD *)a2 = v15;
  *(_QWORD *)(a2 + 8) = v17;
  *(_BYTE *)(a2 + 16) = v4 & 1;
  *(_QWORD *)(a2 + 24) = v20;
  *(_QWORD *)(a2 + 32) = KeyPath;
  *(_QWORD *)(a2 + 40) = 0x3F847AE147AE147BLL;
  *(_QWORD *)(a2 + 48) = result;
  *(_BYTE *)(a2 + 56) = 1;
  return result;
}

uint64_t sub_245DD7680@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD *);
  void (*v12)(uint64_t, _QWORD *);
  void (*v13)(uint64_t, _QWORD *);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double Height;
  double v18;
  CGFloat Width;
  double (*v20)(uint64_t, _QWORD *);
  CGFloat v21;
  double v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int8 v34;
  uint64_t v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v26 = sub_245DDB3F0();
  v6 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for WelcomeToDeviceView(0, a1, (uint64_t)a2, v9);
  v39.origin.x = sub_245DD6150();
  CGRectGetWidth(v39);
  v40.origin.x = sub_245DD6150();
  CGRectGetHeight(v40);
  sub_245DDB69C();
  sub_245DDB354();
  v32 = v33;
  v31 = v34;
  v30 = v35;
  v29 = v36;
  v27 = v38;
  v28 = v37;
  v25 = type metadata accessor for ColorProducer();
  v11 = (void (*)(uint64_t, _QWORD *))a2[15];
  swift_unknownObjectRetain();
  v11(a1, a2);
  swift_unknownObjectRelease();
  v41.origin.x = sub_245DD6150();
  CGRectGetWidth(v41);
  v12 = (void (*)(uint64_t, _QWORD *))a2[14];
  swift_unknownObjectRetain();
  v12(a1, a2);
  swift_unknownObjectRelease();
  v13 = (void (*)(uint64_t, _QWORD *))a2[2];
  swift_unknownObjectRetain();
  v13(a1, a2);
  swift_unknownObjectRelease();
  v14 = v26;
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDED100], v26);
  sub_245DD505C();
  v16 = v15;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v14);
  v42.origin.x = sub_245DD6150();
  Height = CGRectGetHeight(v42);
  v18 = (Height + sub_245DD6364(v10)) * 0.5;
  v43.origin.x = sub_245DD6150();
  Width = CGRectGetWidth(v43);
  v20 = (double (*)(uint64_t, _QWORD *))a2[12];
  v21 = Width / -3.0;
  swift_unknownObjectRetain();
  v22 = v20(a1, a2);
  result = swift_unknownObjectRelease();
  *(_QWORD *)a3 = v32;
  *(_BYTE *)(a3 + 8) = v31;
  *(_QWORD *)(a3 + 16) = v30;
  *(_BYTE *)(a3 + 24) = v29;
  v24 = v27;
  *(_QWORD *)(a3 + 32) = v28;
  *(_QWORD *)(a3 + 40) = v24;
  *(_QWORD *)(a3 + 48) = v16;
  *(double *)(a3 + 56) = v18;
  *(CGFloat *)(a3 + 64) = v21;
  *(_QWORD *)(a3 + 72) = 0;
  *(double *)(a3 + 80) = v22;
  *(_BYTE *)(a3 + 88) = 0;
  return result;
}

uint64_t sub_245DD7950(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;

  if (*(_QWORD *)(a2 + 16)
    && (sub_245DD3EC8(),
        v3 = sub_245DDB714(),
        v4 = -1 << *(_BYTE *)(a2 + 32),
        v5 = v3 & ~v4,
        ((*(_QWORD *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0))
  {
    v6 = ~v4;
    sub_245DD3968();
    do
    {
      v7 = sub_245DDB720();
      if ((v7 & 1) != 0)
        break;
      v5 = (v5 + 1) & v6;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  else
  {
    v7 = 0;
  }
  return v7 & 1;
}

uint64_t sub_245DD7A38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(void);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t KeyPath;
  double v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t (*v79)(uint64_t, _QWORD *);
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(uint64_t, _QWORD *);
  void (*v88)(uint64_t, _QWORD *);
  char *v89;
  char *v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void (*v96)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v97;
  uint64_t v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  unsigned __int8 v102;
  uint64_t v103;
  char *v104;
  unsigned __int8 v105;
  uint64_t v106;
  _QWORD *v107;
  void (*v108)(uint64_t, _QWORD *);
  uint64_t v109;
  void (*v110)(uint64_t, _QWORD *);
  void (*v111)(uint64_t, _QWORD *);
  uint64_t v112;
  void (*v113)(uint64_t, _QWORD *);
  void (*v114)(uint64_t, _QWORD *);
  char *v115;
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
  __int128 v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  int v132;
  void (*v133)(uint64_t, uint64_t);
  __int128 v134;
  __int128 v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  char *v139;
  _QWORD *v140;
  char *v141;
  char *v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  unsigned __int8 v172;
  __int128 v173;
  uint64_t v174;
  char *v175;
  unsigned __int8 v176;
  uint64_t v177;
  __int128 v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  __int128 v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  __int128 v186;
  uint64_t v187;
  uint64_t v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;

  v156 = a4;
  v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DDA0);
  v158 = *(_QWORD *)(v159 - 8);
  MEMORY[0x24BDAC7A8](v159);
  v143 = (char *)&v127 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DDA8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v155 = (uint64_t)&v127 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v160 = (char *)&v127 - v11;
  v150 = sub_245DDB3D8();
  v149 = *(_QWORD *)(v150 - 8);
  MEMORY[0x24BDAC7A8](v150);
  v163 = (char *)&v127 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v153 = sub_245DDB678();
  v152 = *(_QWORD *)(v153 - 8);
  MEMORY[0x24BDAC7A8](v153);
  v151 = (char *)&v127 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DDB0);
  v145 = *(_QWORD *)(v146 - 8);
  MEMORY[0x24BDAC7A8](v146);
  v142 = (char *)&v127 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DDB8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v154 = (uint64_t)&v127 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v165 = (uint64_t)&v127 - v18;
  v19 = sub_245DDB3FC();
  MEMORY[0x24BDAC7A8](v19);
  v141 = (char *)&v127 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v140 = (_QWORD *)sub_245DDB6A8();
  v139 = (char *)*(v140 - 1);
  MEMORY[0x24BDAC7A8](v140);
  v138 = (char *)&v127 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_245DDB3F0();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v127 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DDC0);
  v26 = MEMORY[0x24BDAC7A8](v137);
  v28 = (char *)&v127 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v144 = (uint64_t)&v127 - v29;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DDC8);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v164 = (uint64_t)&v127 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v162 = (uint64_t)&v127 - v33;
  v166 = type metadata accessor for WelcomeToDeviceView(0, a2, a3, v34);
  v167 = a1;
  v35 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 128);
  swift_unknownObjectRetain();
  v169 = a2;
  v168 = a3;
  v161 = (uint64_t)v35;
  v36 = v35(a2, a3);
  swift_unknownObjectRelease();
  LOBYTE(a1) = sub_245DD7950(1, v36);
  swift_bridgeObjectRelease();
  v157 = v22;
  v147 = v25;
  v148 = v23;
  if ((a1 & 1) != 0)
  {
    sub_245DD74F8(v166, (uint64_t)&v170);
    v128 = v170;
    *(_QWORD *)&v135 = v171;
    LODWORD(v134) = v172;
    v130 = *((_QWORD *)&v173 + 1);
    v131 = v173;
    v37 = v174;
    v129 = v175;
    v132 = v176;
    v136 = type metadata accessor for ColorProducer();
    v38 = v168;
    v39 = *(uint64_t (**)(void))(v168 + 120);
    swift_unknownObjectRetain();
    v40 = v23;
    v41 = v169;
    v42 = v39();
    swift_unknownObjectRelease();
    sub_245DD6150();
    v133 = *(void (**)(uint64_t, uint64_t))(v38 + 16);
    v43 = v133;
    swift_unknownObjectRetain();
    v43(v41, v38);
    swift_unknownObjectRelease();
    sub_245DD5D84((uint64_t)v25);
    sub_245DD4E44(v42, (uint64_t)v25, (uint64_t)&v181);
    v44 = v181;
    v127 = v182;
    v45 = v183;
    v46 = v184;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v25, v157);
    v47 = v139;
    v48 = v138;
    v49 = v140;
    (*((void (**)(char *, _QWORD, _QWORD *))v139 + 13))(v138, *MEMORY[0x24BDF5080], v140);
    v50 = (uint64_t)v141;
    (*((void (**)(char *, char *, _QWORD *))v47 + 2))(v141, v48, v49);
    sub_245DDAC84(v50, (uint64_t)&v28[*(int *)(v137 + 36)]);
    v51 = v128;
    v52 = v135;
    *(_QWORD *)v28 = v128;
    *((_QWORD *)v28 + 1) = v52;
    v53 = v134;
    v28[16] = v134;
    v54 = v130;
    *((_QWORD *)v28 + 3) = v131;
    *((_QWORD *)v28 + 4) = v54;
    *((_QWORD *)v28 + 5) = v37;
    *((_QWORD *)v28 + 6) = v129;
    v28[56] = v132;
    *((_QWORD *)v28 + 8) = v44;
    *(_OWORD *)(v28 + 72) = v127;
    *((_QWORD *)v28 + 11) = v45;
    *((_QWORD *)v28 + 12) = v46;
    sub_245DDA8B0(v51, v52, v53);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_245DDACC8(v50);
    (*((void (**)(char *, _QWORD *))v47 + 1))(v48, v49);
    sub_245DDA91C(v51, v135, v134);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    v55 = v144;
    sub_245DDAD40((uint64_t)v28, v144, &qword_25751DDC0);
    sub_245DD74F8(v166, (uint64_t)&v170);
    v137 = v170;
    *(_QWORD *)&v135 = v171;
    LOBYTE(v49) = v172;
    v139 = (char *)*((_QWORD *)&v173 + 1);
    v140 = (_QWORD *)v173;
    v56 = v174;
    v138 = v175;
    LODWORD(v141) = v176;
    v57 = v168;
    v58 = *(uint64_t (**)(uint64_t, uint64_t))(v168 + 136);
    swift_unknownObjectRetain();
    v59 = v169;
    v60 = v58(v169, v57);
    swift_unknownObjectRelease();
    KeyPath = swift_getKeyPath();
    swift_unknownObjectRetain();
    v62 = ((double (*)(uint64_t, uint64_t))v133)(v59, v57);
    swift_unknownObjectRelease();
    v63 = sub_245DD4DFC(v62);
    sub_245DDAD84(v55, (uint64_t)v28, &qword_25751DDC0);
    v64 = v164;
    sub_245DDAD84((uint64_t)v28, v164, &qword_25751DDC0);
    v65 = v64 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25751DE60) + 48);
    v66 = v137;
    v67 = v135;
    *(_QWORD *)v65 = v137;
    *(_QWORD *)(v65 + 8) = v67;
    *(_BYTE *)(v65 + 16) = (_BYTE)v49;
    v68 = v139;
    *(_QWORD *)(v65 + 24) = v140;
    *(_QWORD *)(v65 + 32) = v68;
    *(_QWORD *)(v65 + 40) = v56;
    *(_QWORD *)(v65 + 48) = v138;
    *(_BYTE *)(v65 + 56) = (_BYTE)v141;
    *(_QWORD *)(v65 + 64) = KeyPath;
    *(_QWORD *)(v65 + 72) = v60;
    *(double *)(v65 + 80) = v63;
    sub_245DDA8B0(v66, v67, (char)v49);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_245DDAD04(v144, &qword_25751DDC0);
    sub_245DDA91C(v66, v67, (char)v49);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    sub_245DDAD04((uint64_t)v28, &qword_25751DDC0);
    v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DDD0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 56))(v64, 0, 1, v69);
    sub_245DDAD40(v64, v162, &qword_25751DDC8);
    v70 = v64;
  }
  else
  {
    v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DDD0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v71 - 8) + 56))(v162, 1, 1, v71);
    v70 = v164;
  }
  swift_unknownObjectRetain();
  v72 = v169;
  v73 = ((uint64_t (*)(uint64_t, uint64_t))v161)(v169, v168);
  swift_unknownObjectRelease();
  v74 = sub_245DD7950(2, v73);
  swift_bridgeObjectRelease();
  if ((v74 & 1) != 0)
  {
    v75 = v166;
    sub_245DD74F8(v166, (uint64_t)&v170);
    v137 = v170;
    v76 = v171;
    LODWORD(v136) = v172;
    v77 = v174;
    v139 = v175;
    LODWORD(v138) = v176;
    v144 = type metadata accessor for ColorProducer();
    v78 = (_QWORD *)v168;
    v79 = *(uint64_t (**)(uint64_t, _QWORD *))(v168 + 120);
    swift_unknownObjectRetain();
    v80 = v79(v72, v78);
    swift_unknownObjectRelease();
    v135 = v173;
    sub_245DD6150();
    v141 = (char *)v78[2];
    v81 = v141;
    swift_unknownObjectRetain();
    ((void (*)(uint64_t, _QWORD *))v81)(v169, v78);
    swift_unknownObjectRelease();
    v82 = (uint64_t)v147;
    sub_245DD5D84((uint64_t)v147);
    sub_245DD4E44(v80, v82, (uint64_t)&v185);
    v83 = v185;
    v134 = v186;
    v84 = v187;
    v85 = v188;
    swift_bridgeObjectRelease();
    v140 = *(_QWORD **)(v148 + 8);
    v86 = v157;
    ((void (*)(uint64_t, uint64_t))v140)(v82, v157);
    v170 = v137;
    v171 = v76;
    v172 = v136;
    v173 = v135;
    v174 = v77;
    v175 = v139;
    v176 = v138;
    v177 = v83;
    v178 = v134;
    v179 = v84;
    v180 = v85;
    sub_245DDB384();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751DD68);
    sub_245DDB66C();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_245DDC250;
    swift_unknownObjectRetain();
    v79(v169, v78);
    swift_unknownObjectRelease();
    v189.origin.x = sub_245DD6150();
    CGRectGetWidth(v189);
    swift_unknownObjectRetain();
    ((void (*)(uint64_t, _QWORD *))v141)(v169, v78);
    swift_unknownObjectRelease();
    sub_245DD5D84(v82);
    sub_245DD5054();
    sub_245DD505C();
    swift_bridgeObjectRelease();
    ((void (*)(uint64_t, uint64_t))v140)(v82, v86);
    v190.origin.x = sub_245DD6150();
    CGRectGetHeight(v190);
    sub_245DD6364(v75);
    sub_245DDB660();
    sub_245DDB648();
    v87 = (void (*)(uint64_t, _QWORD *))v78[10];
    swift_unknownObjectRetain();
    v87(v169, v78);
    v72 = v169;
    swift_unknownObjectRelease();
    sub_245DDB654();
    v88 = (void (*)(uint64_t, _QWORD *))v78[9];
    swift_unknownObjectRetain();
    v88(v72, v78);
    swift_unknownObjectRelease();
    sub_245DDB654();
    v89 = v151;
    v90 = v163;
    sub_245DDB3CC();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v149 + 8))(v90, v150);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751DE40);
    sub_245DDAAF4(&qword_25751DE48, &qword_25751DE40, &qword_25751DE50, &qword_25751DE58);
    v91 = v142;
    sub_245DDB558();
    (*(void (**)(char *, uint64_t))(v152 + 8))(v89, v153);
    sub_245DDA91C(v170, v171, v172);
    v70 = v164;
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    v92 = v145;
    v93 = v165;
    v94 = v146;
    (*(void (**)(uint64_t, char *, uint64_t))(v145 + 32))(v165, v91, v146);
    v95 = 0;
  }
  else
  {
    v95 = 1;
    v93 = v165;
    v94 = v146;
    v92 = v145;
  }
  v96 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v92 + 56);
  v97 = 1;
  v96(v93, v95, 1, v94);
  swift_unknownObjectRetain();
  v98 = ((uint64_t (*)(uint64_t, uint64_t))v161)(v72, v168);
  swift_unknownObjectRelease();
  v99 = sub_245DD7950(3, v98);
  swift_bridgeObjectRelease();
  if ((v99 & 1) != 0)
  {
    sub_245DD74F8(v166, (uint64_t)&v170);
    v100 = v170;
    v101 = v171;
    v102 = v172;
    v103 = v174;
    v104 = v175;
    v105 = v176;
    v106 = sub_245DDB594();
    v170 = v100;
    v171 = v101;
    v172 = v102;
    v174 = v103;
    v175 = v104;
    v176 = v105;
    v177 = v106;
    sub_245DDB384();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751DD68);
    sub_245DDB66C();
    v161 = swift_allocObject();
    *(_OWORD *)(v161 + 16) = xmmword_245DDC250;
    type metadata accessor for ColorProducer();
    v107 = (_QWORD *)v168;
    v108 = *(void (**)(uint64_t, _QWORD *))(v168 + 120);
    swift_unknownObjectRetain();
    v108(v72, v107);
    swift_unknownObjectRelease();
    v191.origin.x = sub_245DD6150();
    CGRectGetWidth(v191);
    v109 = v72;
    v110 = (void (*)(uint64_t, _QWORD *))v107[6];
    swift_unknownObjectRetain();
    v110(v109, v107);
    swift_unknownObjectRelease();
    v111 = (void (*)(uint64_t, _QWORD *))v107[2];
    swift_unknownObjectRetain();
    v111(v109, v107);
    swift_unknownObjectRelease();
    v112 = (uint64_t)v147;
    sub_245DD5D84((uint64_t)v147);
    sub_245DD505C();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v148 + 8))(v112, v157);
    v192.origin.x = sub_245DD6150();
    CGRectGetHeight(v192);
    sub_245DDB660();
    sub_245DDB648();
    v113 = (void (*)(uint64_t, _QWORD *))v107[4];
    swift_unknownObjectRetain();
    v113(v109, v107);
    swift_unknownObjectRelease();
    sub_245DDB654();
    v114 = (void (*)(uint64_t, _QWORD *))v107[5];
    swift_unknownObjectRetain();
    v114(v109, v107);
    swift_unknownObjectRelease();
    sub_245DDB654();
    v115 = v151;
    v116 = v163;
    sub_245DDB3CC();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v149 + 8))(v116, v150);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751DDE0);
    sub_245DDAAF4(&qword_25751DDE8, &qword_25751DDE0, &qword_25751DE30, &qword_25751DE38);
    v117 = v143;
    sub_245DDB558();
    (*(void (**)(char *, uint64_t))(v152 + 8))(v115, v153);
    sub_245DDA91C(v170, v171, v172);
    v70 = v164;
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v158 + 32))(v160, v117, v159);
    v97 = 0;
  }
  v118 = (uint64_t)v160;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v158 + 56))(v160, v97, 1, v159);
  v119 = v162;
  sub_245DDAD84(v162, v70, &qword_25751DDC8);
  v120 = v165;
  v121 = v154;
  sub_245DDAD84(v165, v154, &qword_25751DDB8);
  v122 = v155;
  sub_245DDAD84(v118, v155, &qword_25751DDA8);
  v123 = v156;
  sub_245DDAD84(v70, v156, &qword_25751DDC8);
  v124 = v70;
  v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DDD8);
  sub_245DDAD84(v121, v123 + *(int *)(v125 + 48), &qword_25751DDB8);
  sub_245DDAD84(v122, v123 + *(int *)(v125 + 64), &qword_25751DDA8);
  sub_245DDAD04(v118, &qword_25751DDA8);
  sub_245DDAD04(v120, &qword_25751DDB8);
  sub_245DDAD04(v119, &qword_25751DDC8);
  sub_245DDAD04(v122, &qword_25751DDA8);
  sub_245DDAD04(v121, &qword_25751DDB8);
  return sub_245DDAD04(v124, &qword_25751DDC8);
}

double sub_245DD909C@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  double result;
  __int128 v11;
  __int128 v12;
  char v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  CGRectGetMinX(*(CGRect *)&a2);
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  CGRectGetMidY(v14);
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  CGRectGetMaxX(v15);
  v16.origin.x = a2;
  v16.origin.y = a3;
  v16.size.width = a4;
  v16.size.height = a5;
  CGRectGetMinY(v16);
  v17.origin.x = a2;
  v17.origin.y = a3;
  v17.size.width = a4;
  v17.size.height = a5;
  CGRectGetMaxX(v17);
  v18.origin.x = a2;
  v18.origin.y = a3;
  v18.size.width = a4;
  v18.size.height = a5;
  CGRectGetMidY(v18);
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  CGRectGetMaxX(v19);
  v20.origin.x = a2;
  v20.origin.y = a3;
  v20.size.width = a4;
  v20.size.height = a5;
  CGRectGetMaxY(v20);
  sub_245DDB504();
  result = *(double *)&v11;
  *(_OWORD *)a1 = v11;
  *(_OWORD *)(a1 + 16) = v12;
  *(_BYTE *)(a1 + 32) = v13;
  return result;
}

uint64_t sub_245DD91F8(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  sub_245DDB4EC();
  v13.origin.x = a5;
  v13.origin.y = a6;
  v13.size.width = a7;
  v13.size.height = a8;
  CGRectGetMaxX(v13);
  v14.origin.x = a5;
  v14.origin.y = a6;
  v14.size.width = a7;
  v14.size.height = a8;
  CGRectGetMinY(v14);
  sub_245DDB4E0();
  v15.origin.x = a5;
  v15.origin.y = a6;
  v15.size.width = a7;
  v15.size.height = a8;
  CGRectGetMaxX(v15);
  v16.origin.x = a5;
  v16.origin.y = a6;
  v16.size.width = a7;
  v16.size.height = a8;
  CGRectGetMinY(v16);
  sub_245DDB4E0();
  v17.origin.x = a5;
  v17.origin.y = a6;
  v17.size.width = a7;
  v17.size.height = a8;
  CGRectGetMaxX(v17);
  v18.origin.x = a5;
  v18.origin.y = a6;
  v18.size.width = a7;
  v18.size.height = a8;
  CGRectGetMaxY(v18);
  sub_245DDB4E0();
  return sub_245DDB4F8();
}

uint64_t sub_245DD9358()
{
  return sub_245DDB5D0();
}

void (*sub_245DD9370(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_245DDB330();
  return sub_245DD93CC;
}

void sub_245DD93CC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_245DD93FC()
{
  sub_245DDA6A0();
  return sub_245DDB60C();
}

uint64_t sub_245DD944C()
{
  sub_245DDA6A0();
  return sub_245DDB5DC();
}

uint64_t sub_245DD949C()
{
  sub_245DDA6A0();
  return sub_245DDB5F4();
}

unint64_t sub_245DD94D4()
{
  return 0xD000000000000031;
}

uint64_t sub_245DD94F0()
{
  return 160;
}

uint64_t sub_245DD94F8()
{
  return 1;
}

uint64_t sub_245DD9500()
{
  return sub_245DDB2C4();
}

uint64_t sub_245DD9540@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t *boxed_opaque_existential_1;

  type metadata accessor for WelcomeToDeviceViewModel();
  v2 = sub_245DDB5A0();
  sub_245DD2264(0x656D6F636C6557, 0xE700000000000000, v2, (uint64_t)nullsub_1, 0);
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DC88);
  a1[4] = sub_245DD39D8(&qword_25751DD30, &qword_25751DC88, (uint64_t)&unk_245DDC2C0);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
  return sub_245DD63C4(boxed_opaque_existential_1);
}

uint64_t sub_245DD95E8()
{
  return sub_245DDB450();
}

uint64_t sub_245DD9608(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCB0);
  MEMORY[0x24BDAC7A8](v2);
  sub_245DDAD84(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_25751DCB0);
  return sub_245DDB45C();
}

unint64_t sub_245DD9688(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_245DD9758(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_245DDADE8((uint64_t)v12, *a3);
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
      sub_245DDADE8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_245DD9758(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  unint64_t result;
  uint64_t v10;
  unint64_t v11;
  _QWORD v12[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          result = 0;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_245DD9854(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_245DDB7BC();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_245DD9854(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_245DD98E8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_245DD99E4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_245DD99E4((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_245DD98E8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  char v5;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_245DD9980(v2, 0);
      result = sub_245DDB7B0();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_245DDB750();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_245DD9980(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751DE68);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_245DD99E4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751DE68);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_245DD9ACC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_245DDB438();
  *a1 = v3;
  return result;
}

uint64_t sub_245DD9AF4()
{
  return sub_245DDB444();
}

uint64_t sub_245DD9B18@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_245DDB468();
  *a1 = result;
  return result;
}

uint64_t sub_245DD9B40()
{
  return sub_245DDB474();
}

uint64_t sub_245DD9B64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_245DDB408();
  *a1 = result;
  return result;
}

uint64_t sub_245DD9B8C()
{
  swift_retain();
  return sub_245DDB414();
}

uint64_t sub_245DD9BB4(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 36) + 8);
}

uint64_t type metadata accessor for WelcomeToDeviceView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WelcomeToDeviceView);
}

uint64_t sub_245DD9BD4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_245DD9C0C()
{
  unint64_t result;

  result = qword_25751DCD8;
  if (!qword_25751DCD8)
  {
    result = MEMORY[0x249548910](&unk_245DDC360, &type metadata for HaloShape);
    atomic_store(result, (unint64_t *)&qword_25751DCD8);
  }
  return result;
}

unint64_t sub_245DD9C54()
{
  unint64_t result;

  result = qword_25751DCE0;
  if (!qword_25751DCE0)
  {
    result = MEMORY[0x249548910](&unk_245DDC3B0, &type metadata for HaloShape);
    atomic_store(result, (unint64_t *)&qword_25751DCE0);
  }
  return result;
}

unint64_t sub_245DD9C9C()
{
  unint64_t result;

  result = qword_25751DCE8;
  if (!qword_25751DCE8)
  {
    result = MEMORY[0x249548910](MEMORY[0x24BDEEF18], MEMORY[0x24BDEEF38]);
    atomic_store(result, (unint64_t *)&qword_25751DCE8);
  }
  return result;
}

uint64_t sub_245DD9CE0()
{
  return sub_245DD39D8(&qword_25751DCF0, &qword_25751DCF8, MEMORY[0x24BDEB358]);
}

uint64_t sub_245DD9D0C()
{
  return swift_allocateGenericValueMetadata();
}

void sub_245DD9D14()
{
  unint64_t v0;
  unint64_t v1;

  sub_245DDA58C();
  if (v0 <= 0x3F)
  {
    sub_245DDB39C();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *sub_245DD9DAC(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  __int128 v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_245DDB3F0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[9];
    v10 = a3[10];
    v11 = (uint64_t *)((char *)a1 + v9);
    v12 = (uint64_t *)((char *)a2 + v9);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    v14 = (char *)a1 + v10;
    v15 = (char *)a2 + v10;
    v16 = *((_OWORD *)v15 + 1);
    *(_OWORD *)v14 = *(_OWORD *)v15;
    *((_OWORD *)v14 + 1) = v16;
    *((_QWORD *)v14 + 4) = *((_QWORD *)v15 + 4);
    v17 = a3[11];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = sub_245DDB39C();
    v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
    swift_unknownObjectRetain();
    swift_retain();
    v21(v18, v19, v20);
  }
  return a1;
}

uint64_t sub_245DD9EF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_245DDB3F0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_unknownObjectRelease();
  swift_release();
  v5 = a1 + *(int *)(a2 + 44);
  v6 = sub_245DDB39C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

_QWORD *sub_245DD9F9C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  __int128 v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_245DDB3F0();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[9];
  v8 = a3[10];
  v9 = (_QWORD *)((char *)a1 + v7);
  v10 = (_QWORD *)((char *)a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (char *)a1 + v8;
  v13 = (char *)a2 + v8;
  v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  *((_QWORD *)v12 + 4) = *((_QWORD *)v13 + 4);
  v15 = a3[11];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = sub_245DDB39C();
  v19 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
  swift_unknownObjectRetain();
  swift_retain();
  v19(v16, v17, v18);
  return a1;
}

_QWORD *sub_245DDA0B8(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  if (a1 != a2)
  {
    sub_245DDAD04((uint64_t)a1, &qword_25751DCA0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_245DDB3F0();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = a3[9];
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v10 = a3[10];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  v11[2] = v12[2];
  v11[3] = v12[3];
  v11[4] = v12[4];
  swift_retain();
  swift_release();
  v13 = a3[11];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = sub_245DDB39C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

char *sub_245DDA20C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  __int128 v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_245DDB3F0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = *((_OWORD *)v10 + 1);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *((_OWORD *)v9 + 1) = v11;
  *((_QWORD *)v9 + 4) = *((_QWORD *)v10 + 4);
  v12 = a3[11];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_245DDB39C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  return a1;
}

char *sub_245DDA2F8(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  __int128 v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;

  if (a1 != a2)
  {
    sub_245DDAD04((uint64_t)a1, &qword_25751DCA0);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_245DDB3F0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[9];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v12 = *(_QWORD *)v10;
  v11 = *((_QWORD *)v10 + 1);
  *(_QWORD *)v9 = v12;
  *((_QWORD *)v9 + 1) = v11;
  swift_unknownObjectRelease();
  v13 = a3[10];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = *((_OWORD *)v15 + 1);
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *((_OWORD *)v14 + 1) = v16;
  *((_QWORD *)v14 + 4) = *((_QWORD *)v15 + 4);
  swift_release();
  v17 = a3[11];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = sub_245DDB39C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
  return a1;
}

uint64_t sub_245DDA418()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_245DDA424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DD00);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = sub_245DDB39C();
    v10 = a1 + *(int *)(a3 + 44);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 36) + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_245DDA4D4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_245DDA4E0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_25751DD00);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 36) + 8) = (a2 - 1);
      return result;
    }
    v10 = sub_245DDB39C();
    v12 = a1 + *(int *)(a4 + 44);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_245DDA58C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25751DD08)
  {
    sub_245DDB3F0();
    v0 = sub_245DDB348();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25751DD08);
  }
}

ValueMetadata *type metadata accessor for HaloShape()
{
  return &type metadata for HaloShape;
}

ValueMetadata *type metadata accessor for $s23SetupAssistantSupportUI0030WelcomeToDeviceViewswift_eDAEifMX159_0_33_BC0DD2D37507743ABA0B33D4935926D6Ll7PreviewfMf_15PreviewRegistryfMu_()
{
  return &type metadata for $s23SetupAssistantSupportUI0030WelcomeToDeviceViewswift_eDAEifMX159_0_33_BC0DD2D37507743ABA0B33D4935926D67PreviewfMf_15PreviewRegistryfMu_;
}

unint64_t sub_245DDA604()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25751DD10;
  if (!qword_25751DD10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25751DCC8);
    v2[0] = sub_245DD39D8(&qword_25751DD18, &qword_25751DCB8, MEMORY[0x24BDF4750]);
    v2[1] = sub_245DD39D8(&qword_25751DD20, &qword_25751DCD0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x249548910](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25751DD10);
  }
  return result;
}

unint64_t sub_245DDA6A0()
{
  unint64_t result;

  result = qword_25751DD28;
  if (!qword_25751DD28)
  {
    result = MEMORY[0x249548910](&unk_245DDC310, &type metadata for HaloShape);
    atomic_store(result, (unint64_t *)&qword_25751DD28);
  }
  return result;
}

uint64_t sub_245DDA6E4()
{
  double *v0;

  return sub_245DD91F8(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7], v0[8], v0[9]);
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

unint64_t sub_245DDA75C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25751D838;
  if (!qword_25751D838)
  {
    v1 = type metadata accessor for WelcomeToDeviceViewModel();
    result = MEMORY[0x249548910](&unk_245DDBF04, v1);
    atomic_store(result, (unint64_t *)&qword_25751D838);
  }
  return result;
}

unint64_t sub_245DDA7A4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25751DD78;
  if (!qword_25751DD78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25751DD70);
    v2[0] = sub_245DDA810();
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x249548910](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25751DD78);
  }
  return result;
}

unint64_t sub_245DDA810()
{
  unint64_t result;

  result = qword_25751DD80;
  if (!qword_25751DD80)
  {
    result = MEMORY[0x249548910](MEMORY[0x24BDF52D0], MEMORY[0x24BDF52F8]);
    atomic_store(result, (unint64_t *)&qword_25751DD80);
  }
  return result;
}

uint64_t sub_245DDA854(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_245DDA8B0(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_245DDA8B0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_245DDA8C0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_245DDA91C(result, a2, a3 & 1);
    swift_release();
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_245DDA91C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_245DDA92C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = type metadata accessor for WelcomeToDeviceView(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  v7 = (v6 + 32) & ~v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751DCA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_245DDB3F0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v4 + v7, v8);
  }
  else
  {
    swift_release();
  }
  swift_unknownObjectRelease();
  swift_release();
  v9 = v4 + v7 + *(int *)(v5 + 44);
  v10 = sub_245DDB39C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  return swift_deallocObject();
}

uint64_t sub_245DDAA1C(CGFloat *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  uint64_t result;
  CGRect v11;
  CGRect v12;

  type metadata accessor for WelcomeToDeviceView(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v6 = *a1;
  v7 = a1[1];
  v8 = a1[2];
  v9 = a1[3];
  v11.origin.x = sub_245DD6150();
  v12.origin.x = v6;
  v12.origin.y = v7;
  v12.size.width = v8;
  v12.size.height = v9;
  result = CGRectEqualToRect(v11, v12);
  if ((result & 1) == 0)
    return sub_245DD61A8();
  return result;
}

unint64_t sub_245DDAAB0()
{
  unint64_t result;

  result = qword_25751DD98;
  if (!qword_25751DD98)
  {
    result = MEMORY[0x249548910](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25751DD98);
  }
  return result;
}

uint64_t sub_245DDAAF4(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = sub_245DDAB7C();
    v9[1] = sub_245DD39D8(a3, a4, MEMORY[0x24BDF0710]);
    result = MEMORY[0x249548910](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_245DDAB7C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25751DDF0;
  if (!qword_25751DDF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25751DDF8);
    v2[0] = sub_245DDAC00();
    v2[1] = sub_245DD39D8(&qword_25751DE20, &qword_25751DE28, MEMORY[0x24BDF1028]);
    result = MEMORY[0x249548910](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25751DDF0);
  }
  return result;
}

unint64_t sub_245DDAC00()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25751DE00;
  if (!qword_25751DE00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25751DE08);
    v2 = sub_245DD39D8(&qword_25751DE10, &qword_25751DE18, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x249548910](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25751DE00);
  }
  return result;
}

uint64_t sub_245DDAC84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245DDB3FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_245DDACC8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_245DDB3FC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_245DDAD04(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_245DDAD40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_245DDAD84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
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

uint64_t sub_245DDADE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2495488A4](a1, v6, a5);
}

uint64_t sub_245DDAE54()
{
  return 0;
}

id sub_245DDAE60(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  uint64_t *v6;
  id v7;
  objc_super v9;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_displayLink] = 0;
  v6 = (uint64_t *)&v5[OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_frameUpdateBlock];
  *v6 = a1;
  v6[1] = a2;
  sub_245DD5CA0(a1);
  sub_245DD3954(0);
  v9.receiver = v5;
  v9.super_class = v2;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  sub_245DD3954(a1);
  return v7;
}

id sub_245DDAEF8(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t *v4;
  id v5;
  objc_super v7;

  *(_QWORD *)&v2[OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_displayLink] = 0;
  v4 = (uint64_t *)&v2[OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_frameUpdateBlock];
  *v4 = a1;
  v4[1] = a2;
  sub_245DD5CA0(a1);
  sub_245DD3954(0);
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for DisplayLinkManager();
  v5 = objc_msgSendSuper2(&v7, sel_init);
  sub_245DD3954(a1);
  return v5;
}

uint64_t type metadata accessor for DisplayLinkManager()
{
  return objc_opt_self();
}

void sub_245DDAFA0()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v1 = OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_displayLink;
  if (!*(_QWORD *)(v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_displayLink))
  {
    v2 = objc_msgSend((id)objc_opt_self(), sel_displayLinkWithTarget_selector_, v0, sel_frameWithDisplayLink_);
    v3 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v2;

    v4 = *(void **)(v0 + v1);
    if (v4)
    {
      v5 = (void *)objc_opt_self();
      v6 = v4;
      v7 = objc_msgSend(v5, sel_currentRunLoop);
      objc_msgSend(v6, sel_addToRunLoop_forMode_, v7, *MEMORY[0x24BDBCA90]);

    }
  }
}

void sub_245DDB08C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;

  v1 = OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_displayLink;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC23SetupAssistantSupportUI18DisplayLinkManager_displayLink);
  if (v2)
  {
    v3 = (void *)objc_opt_self();
    v4 = v2;
    v5 = objc_msgSend(v3, sel_currentRunLoop);
    objc_msgSend(v4, sel_removeFromRunLoop_forMode_, v5, *MEMORY[0x24BDBCA90]);

    v6 = *(void **)(v0 + v1);
  }
  else
  {
    v6 = 0;
  }
  *(_QWORD *)(v0 + v1) = 0;

}

id sub_245DDB1D4()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void sub_245DDB1F4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_245DDB24C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DisplayLinkManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_245DDB2B8()
{
  return MEMORY[0x24BDC6DC8]();
}

uint64_t sub_245DDB2C4()
{
  return MEMORY[0x24BDEADC8]();
}

uint64_t sub_245DDB2D0()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_245DDB2DC()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_245DDB2E8()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_245DDB2F4()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_245DDB300()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_245DDB30C()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_245DDB318()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_245DDB324()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_245DDB330()
{
  return MEMORY[0x24BDEAE98]();
}

uint64_t sub_245DDB33C()
{
  return MEMORY[0x24BDEAEB0]();
}

uint64_t sub_245DDB348()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_245DDB354()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_245DDB360()
{
  return MEMORY[0x24BDEC138]();
}

uint64_t sub_245DDB36C()
{
  return MEMORY[0x24BDEC348]();
}

uint64_t sub_245DDB378()
{
  return MEMORY[0x24BDEC358]();
}

uint64_t sub_245DDB384()
{
  return MEMORY[0x24BDEC398]();
}

uint64_t sub_245DDB390()
{
  return MEMORY[0x24BDEC3A0]();
}

uint64_t sub_245DDB39C()
{
  return MEMORY[0x24BDEC3A8]();
}

uint64_t sub_245DDB3A8()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_245DDB3B4()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_245DDB3C0()
{
  return MEMORY[0x24BDEC9A0]();
}

uint64_t sub_245DDB3CC()
{
  return MEMORY[0x24BDECAF0]();
}

uint64_t sub_245DDB3D8()
{
  return MEMORY[0x24BDECAF8]();
}

uint64_t sub_245DDB3E4()
{
  return MEMORY[0x24BDED128]();
}

uint64_t sub_245DDB3F0()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_245DDB3FC()
{
  return MEMORY[0x24BDEDB60]();
}

uint64_t sub_245DDB408()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_245DDB414()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_245DDB420()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_245DDB42C()
{
  return MEMORY[0x24BDEE080]();
}

uint64_t sub_245DDB438()
{
  return MEMORY[0x24BDEE190]();
}

uint64_t sub_245DDB444()
{
  return MEMORY[0x24BDEE198]();
}

uint64_t sub_245DDB450()
{
  return MEMORY[0x24BDEE1A8]();
}

uint64_t sub_245DDB45C()
{
  return MEMORY[0x24BDEE1B0]();
}

uint64_t sub_245DDB468()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_245DDB474()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_245DDB480()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_245DDB48C()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_245DDB498()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_245DDB4A4()
{
  return MEMORY[0x24BDEF950]();
}

uint64_t sub_245DDB4B0()
{
  return MEMORY[0x24BDF0158]();
}

uint64_t sub_245DDB4BC()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_245DDB4C8()
{
  return MEMORY[0x24BDF1560]();
}

uint64_t sub_245DDB4D4()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_245DDB4E0()
{
  return MEMORY[0x24BDF1AB8]();
}

uint64_t sub_245DDB4EC()
{
  return MEMORY[0x24BDF1AF0]();
}

uint64_t sub_245DDB4F8()
{
  return MEMORY[0x24BDF1B30]();
}

uint64_t sub_245DDB504()
{
  return MEMORY[0x24BDF1BD0]();
}

uint64_t sub_245DDB510()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_245DDB51C()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_245DDB528()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_245DDB534()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_245DDB540()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_245DDB54C()
{
  return MEMORY[0x24BDF22E8]();
}

uint64_t sub_245DDB558()
{
  return MEMORY[0x24BDF2388]();
}

uint64_t sub_245DDB564()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_245DDB570()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_245DDB57C()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_245DDB588()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_245DDB594()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_245DDB5A0()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_245DDB5AC()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_245DDB5B8()
{
  return MEMORY[0x24BDF3FA8]();
}

uint64_t sub_245DDB5C4()
{
  return MEMORY[0x24BDF3FB0]();
}

uint64_t sub_245DDB5D0()
{
  return MEMORY[0x24BDF4208]();
}

uint64_t sub_245DDB5DC()
{
  return MEMORY[0x24BDF4218]();
}

uint64_t sub_245DDB5E8()
{
  return MEMORY[0x24BDF4230]();
}

uint64_t sub_245DDB5F4()
{
  return MEMORY[0x24BDF4238]();
}

uint64_t sub_245DDB600()
{
  return MEMORY[0x24BDF4248]();
}

uint64_t sub_245DDB60C()
{
  return MEMORY[0x24BDF4278]();
}

uint64_t sub_245DDB618()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_245DDB624()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_245DDB630()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_245DDB63C()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_245DDB648()
{
  return MEMORY[0x24BDF4580]();
}

uint64_t sub_245DDB654()
{
  return MEMORY[0x24BDF4588]();
}

uint64_t sub_245DDB660()
{
  return MEMORY[0x24BDF4590]();
}

uint64_t sub_245DDB66C()
{
  return MEMORY[0x24BDF4598]();
}

uint64_t sub_245DDB678()
{
  return MEMORY[0x24BDF45A8]();
}

uint64_t sub_245DDB684()
{
  return MEMORY[0x24BDF4CE0]();
}

uint64_t sub_245DDB690()
{
  return MEMORY[0x24BDF4D00]();
}

uint64_t sub_245DDB69C()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_245DDB6A8()
{
  return MEMORY[0x24BDF5118]();
}

uint64_t sub_245DDB6B4()
{
  return MEMORY[0x24BDF54A8]();
}

uint64_t sub_245DDB6C0()
{
  return MEMORY[0x24BDF54B0]();
}

uint64_t sub_245DDB6CC()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_245DDB6D8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_245DDB6E4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_245DDB6F0()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_245DDB6FC()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_245DDB708()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_245DDB714()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_245DDB720()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_245DDB72C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_245DDB738()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_245DDB744()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_245DDB750()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_245DDB75C()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_245DDB768()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_245DDB774()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_245DDB780()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_245DDB78C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_245DDB798()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_245DDB7A4()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_245DDB7B0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_245DDB7BC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_245DDB7C8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_245DDB7D4()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_245DDB7E0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_245DDB7EC()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_245DDB7F8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_245DDB804()
{
  return MEMORY[0x24BEE4328]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
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

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

