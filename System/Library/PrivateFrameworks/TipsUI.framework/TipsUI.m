id static TPSUIAppController.shared.getter()
{
  if (qword_253EC63F8 != -1)
    swift_once();
  return (id)qword_253EC63F0;
}

uint64_t getEnumTagSinglePayload for VideoPlayerView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_20CF8257C(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t type metadata accessor for RemoteImageView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RemoteImageView);
}

uint64_t type metadata accessor for ContentLoadState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ContentLoadState);
}

ValueMetadata *type metadata accessor for RemoteVideoView()
{
  return &type metadata for RemoteVideoView;
}

uint64_t getEnumTagSinglePayload for RemoteVideoView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 89))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_20CF82600@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20CF89C14(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t type metadata accessor for TipsContentModel()
{
  uint64_t result;

  result = qword_253EC5F88;
  if (!qword_253EC5F88)
    return swift_getSingletonMetadata();
  return result;
}

void type metadata accessor for TimeControlStatus(uint64_t a1)
{
  sub_20CF8265C(a1, &qword_253EC5F20);
}

void sub_20CF8265C(uint64_t a1, unint64_t *a2)
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

ValueMetadata *type metadata accessor for VideoPlayerViewRepresentable()
{
  return &type metadata for VideoPlayerViewRepresentable;
}

void sub_20CF826B0(uint64_t a1)
{
  sub_20CF87D98(a1);
}

uint64_t type metadata accessor for RemoteImageLoader()
{
  uint64_t result;

  result = qword_253EC6290;
  if (!qword_253EC6290)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata accessor for RemoteFileLoader()
{
  uint64_t result;

  result = qword_253EC6130;
  if (!qword_253EC6130)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t storeEnumTagSinglePayload for VideoPlayerView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
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
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoPlayerView()
{
  return &type metadata for VideoPlayerView;
}

uint64_t dispatch thunk of TipNavigationViewModel.$tips.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t sub_20CF827BC()
{
  return sub_20CF83BB4((uint64_t)&OBJC_IVAR___TipNavigationViewModel__tips, &qword_253EC68A0);
}

uint64_t sub_20CF827D0@<X0>(_BYTE *a1@<X8>)
{
  return sub_20CF85298(a1);
}

uint64_t dispatch thunk of DocumentAssetViewModel.$player.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t sub_20CF827F0()
{
  return sub_20CF83BB4((uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__player, &qword_253EC68D0);
}

uint64_t sub_20CF82804()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_20CF8280C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t storeEnumTagSinglePayload for RemoteVideoView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 88) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 89) = 1;
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
    *(_BYTE *)(result + 89) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_20CF8286C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_20CF828B4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253EC5F60)
  {
    sub_20CFCC47C();
    v0 = sub_20CFCD334();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253EC5F60);
  }
}

id sub_20CF82908()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TPSUIAppController()), sel_init);
  qword_253EC63F0 = (uint64_t)result;
  return result;
}

uint64_t sub_20CF82934(uint64_t a1, unint64_t *a2)
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

_QWORD *sub_20CF8296C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  v5 = (_QWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v6 = (_QWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v5 = *v6;
  v5[1] = v6[1];
  v7 = (_QWORD *)(((unint64_t)v5 + 23) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)(((unint64_t)v6 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 24))(((unint64_t)v7 + *(unsigned __int8 *)(v9 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v9 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

uint64_t sub_20CF82A20@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_20CF82A6C();
  result = sub_20CFCC8CC();
  *a1 = v3;
  return result;
}

unint64_t sub_20CF82A6C()
{
  unint64_t result;

  result = qword_253EC6400;
  if (!qword_253EC6400)
  {
    result = MEMORY[0x212B9AA54](&protocol conformance descriptor for AssetContentModeKey, &type metadata for AssetContentModeKey);
    atomic_store(result, (unint64_t *)&qword_253EC6400);
  }
  return result;
}

unint64_t sub_20CF82AEC()
{
  unint64_t result;

  result = qword_253EC5F10;
  if (!qword_253EC5F10)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253EC5F10);
  }
  return result;
}

uint64_t sub_20CF82B28()
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

uint64_t sub_20CF82BBC(uint64_t a1, char a2)
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

  v4 = sub_20CFCC8C0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  swift_retain();
  v8 = sub_20CFCD244();
  v9 = sub_20CFCCA34();
  if (os_log_type_enabled(v9, v8))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v13 = v11;
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = sub_20CFB6058(0x4D746E65746E6F43, 0xEB0000000065646FLL, &v13);
    _os_log_impl(&dword_20CF80000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212B9AAFC](v11, -1, -1);
    MEMORY[0x212B9AAFC](v10, -1, -1);
  }

  sub_20CFCC8B4();
  swift_getAtKeyPath();
  sub_20CF8257C(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

unint64_t sub_20CF82D58()
{
  unint64_t result;

  result = qword_253EC6970;
  if (!qword_253EC6970)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253EC6970);
  }
  return result;
}

unint64_t sub_20CF82D94()
{
  unint64_t result;

  result = qword_253EC5F18;
  if (!qword_253EC5F18)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253EC5F18);
  }
  return result;
}

uint64_t sub_20CF82DD0()
{
  return sub_20CFCC938();
}

unint64_t sub_20CF82E00()
{
  unint64_t result;

  result = qword_253EC6960;
  if (!qword_253EC6960)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253EC6960);
  }
  return result;
}

uint64_t sub_20CF82E3C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x212B9AA54](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id static TPSUIAppController.sharedInstance()()
{
  if (qword_253EC63F8 != -1)
    swift_once();
  return (id)swift_dynamicCastClassUnconditional();
}

void sub_20CF82F40()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_20CF83054(319, (unint64_t *)&qword_253EC6888, &qword_253EC6118);
  if (v0 <= 0x3F)
  {
    sub_20CF83054(319, &qword_253EC68D8, &qword_253EC6978);
    if (v1 <= 0x3F)
    {
      sub_20CF8B89C();
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

void sub_20CF83054(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_20CFCC680();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_20CF830A0()
{
  unint64_t v0;
  unint64_t v1;

  sub_20CF83054(319, &qword_253EC68C8, &qword_253EC6968);
  if (v0 <= 0x3F)
  {
    sub_20CF83054(319, &qword_253EC68A8, &qword_253EC6948);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t sub_20CF831B8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(_QWORD *)(a2 + 40))
  {
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5EF8);
    sub_20CFCCD04();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_20CF83248()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_20CF832B8()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_20CFCC674();
}

unint64_t sub_20CF83320()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_253EC5E78;
  if (!qword_253EC5E78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC5E80);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC5EF0);
    v2[3] = sub_20CF89064();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_20CF82E3C(&qword_253EC5ED8, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_253EC5E78);
  }
  return result;
}

uint64_t sub_20CF83454()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5EF8);
  return sub_20CFCCD04();
}

uint64_t sub_20CF834A8()
{
  _QWORD *v0;
  uint64_t (*v1)();
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v5)();
  _QWORD *v6;
  _BYTE v8[32];

  v1 = sub_20CF8BC14();
  v2 = MEMORY[0x24BEE4B00];
  if (*v0)
  {
    v3 = v0;
    swift_bridgeObjectRelease();
    *v3 = v2;
  }
  ((void (*)(_BYTE *, _QWORD))v1)(v8, 0);
  v5 = sub_20CF8BBC8();
  if (*v4)
  {
    v6 = v4;
    swift_bridgeObjectRelease();
    *v6 = v2;
  }
  return ((uint64_t (*)(_BYTE *, _QWORD))v5)(v8, 0);
}

uint64_t sub_20CF83538(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x212B9AA54](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t View.assetContentMode(_:)()
{
  swift_getKeyPath();
  sub_20CFCCB48();
  return swift_release();
}

uint64_t sub_20CF835E8()
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

uint64_t sub_20CF83670()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_20CFCC674();
}

uint64_t sub_20CF836DC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_20CFCC728();
  if (v1 <= 0x3F)
  {
    result = sub_20CFCC554();
    if (v2 <= 0x3F)
      return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t sub_20CF837C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[2];
  char v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6880);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = v3 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader__state;
  v16[1] = 0;
  v17 = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6118);
  sub_20CFCC638();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v11, v10, v7);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_urlSessionItem) = 0;
  v12 = (_QWORD *)(v3 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_identifier);
  *v12 = 0;
  v12[1] = 0;
  v13 = v3 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_url;
  v14 = sub_20CFCC47C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  *v12 = a1;
  v12[1] = a2;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_20CF8286C(a3, v13);
  swift_endAccess();
  return v3;
}

UIImage_optional __swiftcall UIImage.init(systemImageName:)(Swift::String systemImageName)
{
  void *ObjCClassFromMetadata;
  void *v2;
  objc_class *v3;
  Swift::Bool v4;
  objc_class *v5;
  UIImage_optional result;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v2 = (void *)sub_20CFCD0F4();
  swift_bridgeObjectRelease();
  v3 = (objc_class *)objc_msgSend(ObjCClassFromMetadata, sel__systemImageNamed_, v2);

  v5 = v3;
  result.value.super.isa = v5;
  result.is_nil = v4;
  return result;
}

uint64_t sub_20CF83988()
{
  uint64_t result;
  uint64_t v1;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    swift_retain();
    sub_20CF85310();
    swift_release();
    swift_retain();
    sub_20CF84F98();
    swift_release();
    *(_BYTE *)(v1 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) = 0;
    return swift_release();
  }
  return result;
}

void sub_20CF83A24()
{
  id v0;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  objc_msgSend(v0, sel_play);

}

id sub_20CF83AA8@<X0>(_QWORD *a1@<X8>)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  id result;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;

  v2 = objc_allocWithZone(MEMORY[0x24BDB2610]);
  v3 = (void *)sub_20CFCC440();
  v4 = objc_msgSend(v2, sel_initWithURL_, v3);

  v5 = *MEMORY[0x24BDC0D88];
  v6 = *(_DWORD *)(MEMORY[0x24BDC0D88] + 8);
  v7 = *(_DWORD *)(MEMORY[0x24BDC0D88] + 12);
  v16 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v17 = v5;
  v18 = v6;
  v19 = v7;
  v20 = v16;
  v12 = v16;
  v13 = v5;
  v14 = v6;
  v15 = v7;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v4, sel_seekToTime_toleranceBefore_toleranceAfter_, &v17, &v13, &v9);
  result = objc_msgSend(v4, sel_setMuted_, 1);
  *a1 = v4;
  return result;
}

uint64_t sub_20CF83BB4(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_20CFCC644();
  return swift_endAccess();
}

uint64_t sub_20CF83C18(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void (*v22)(uint64_t, uint64_t, __int128 *, void *, unint64_t, uint64_t, uint64_t, uint64_t, void *);
  __int128 v23;
  __int128 v24;

  v22 = *(void (**)(uint64_t, uint64_t, __int128 *, void *, unint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    v12 = sub_20CFCD118();
    v14 = v13;
    if (a3)
    {
LABEL_3:
      *((_QWORD *)&v24 + 1) = swift_getObjectType();
      *(_QWORD *)&v23 = a3;
      goto LABEL_6;
    }
  }
  else
  {
    v12 = 0;
    v14 = 0;
    if (a3)
      goto LABEL_3;
  }
  v23 = 0u;
  v24 = 0u;
LABEL_6:
  swift_retain();
  swift_unknownObjectRetain();
  if (!a4)
  {
    v17 = 0xF000000000000000;
    if (a6)
      goto LABEL_8;
LABEL_10:
    v18 = 0;
    goto LABEL_11;
  }
  v15 = a4;
  a4 = (void *)sub_20CFCC488();
  v17 = v16;

  if (!a6)
    goto LABEL_10;
LABEL_8:
  v18 = sub_20CFCD118();
  a6 = v19;
LABEL_11:
  v20 = a7;
  v22(v12, v14, &v23, a4, v17, a5, v18, a6, a7);

  swift_bridgeObjectRelease();
  sub_20CF8BF90((uint64_t)a4, v17);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_20CF8658C((uint64_t)&v23, &qword_253EC6988);
}

id *sub_20CF83D74(id *__dst, void **__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  id v16;
  unsigned int v17;

  if (__dst == __src)
    return __dst;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if (*(_QWORD *)(v6 + 64) <= 8uLL)
    v7 = 8;
  else
    v7 = *(_QWORD *)(v6 + 64);
  if (v7 > 3)
    goto LABEL_6;
  v9 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v9 > 0xFFFD)
  {
    v8 = *(_DWORD *)((char *)__dst + v7);
  }
  else
  {
    if (v9 <= 0xFD)
    {
LABEL_6:
      v8 = *((unsigned __int8 *)__dst + v7);
      goto LABEL_11;
    }
    v8 = *(unsigned __int16 *)((char *)__dst + v7);
  }
LABEL_11:
  if (v8 >= 2)
  {
    if (v7 <= 3)
      v10 = v7;
    else
      v10 = 4;
    __asm { BR              X12 }
  }
  if (v8 == 1)
  {

    if (v7 > 3)
      goto LABEL_22;
  }
  else
  {
    (*(void (**)(id *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
    if (v7 > 3)
      goto LABEL_22;
  }
  v11 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v11 <= 0xFFFD)
  {
    if (v11 > 0xFD)
    {
      v12 = *(unsigned __int16 *)((char *)__src + v7);
      if (v12 < 2)
        goto LABEL_31;
      goto LABEL_27;
    }
LABEL_22:
    v12 = *((unsigned __int8 *)__src + v7);
    if (v12 < 2)
      goto LABEL_31;
LABEL_27:
    if (v7 <= 3)
      v13 = v7;
    else
      v13 = 4;
    __asm { BR              X12 }
  }
  v12 = *(_DWORD *)((char *)__src + v7);
  if (v12 >= 2)
    goto LABEL_27;
LABEL_31:
  if (v12 == 1)
  {
    v15 = *__src;
    v16 = v15;
    *__dst = v15;
    if (v7 > 3)
      goto LABEL_37;
    v17 = ((1 << (8 * v7)) + 1) >> (8 * v7);
    if (v17 > 0xFFFD)
    {
      *(_DWORD *)((char *)__dst + v7) = 1;
      return __dst;
    }
    if (v17 <= 0xFD)
LABEL_37:
      *((_BYTE *)__dst + v7) = 1;
    else
      *(_WORD *)((char *)__dst + v7) = 1;
  }
  else
  {
    (*(void (**)(id *, void **, uint64_t))(v6 + 16))(__dst, __src, v5);
    if (v7 <= 3)
    {
      v14 = ((1 << (8 * v7)) + 1) >> (8 * v7);
      if (v14 > 0xFFFD)
      {
        *(_DWORD *)((char *)__dst + v7) = 0;
        return __dst;
      }
      if (v14 > 0xFD)
      {
        *(_WORD *)((char *)__dst + v7) = 0;
        return __dst;
      }
    }
    *((_BYTE *)__dst + v7) = 0;
  }
  return __dst;
}

uint64_t sub_20CF840A8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void (*v22)(uint64_t, uint64_t, __int128 *, void *, unint64_t, uint64_t, uint64_t, uint64_t, void *);
  __int128 v23;
  __int128 v24;

  v22 = *(void (**)(uint64_t, uint64_t, __int128 *, void *, unint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  v12 = sub_20CFCD118();
  v14 = v13;
  if (a3)
  {
    *((_QWORD *)&v24 + 1) = swift_getObjectType();
    *(_QWORD *)&v23 = a3;
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  if (!a4)
  {
    v17 = 0xF000000000000000;
    if (a6)
      goto LABEL_6;
LABEL_8:
    v18 = 0;
    goto LABEL_9;
  }
  v15 = a4;
  a4 = (void *)sub_20CFCC488();
  v17 = v16;

  if (!a6)
    goto LABEL_8;
LABEL_6:
  v18 = sub_20CFCD118();
  a6 = v19;
LABEL_9:
  v20 = a7;
  v22(v12, v14, &v23, a4, v17, a5, v18, a6, a7);

  swift_bridgeObjectRelease();
  sub_20CF8BF90((uint64_t)a4, v17);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_20CF8658C((uint64_t)&v23, &qword_253EC6988);
}

uint64_t sub_20CF841F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
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
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v22 = a2;
  v23 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6890);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6120);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v21 - v13;
  v15 = v3 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader__state;
  swift_storeEnumTagMultiPayload();
  sub_20CF865C8((uint64_t)v14, (uint64_t)v12, &qword_253EC6120);
  sub_20CFCC638();
  sub_20CF8658C((uint64_t)v14, &qword_253EC6120);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v15, v8, v5);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_urlSessionItem) = 0;
  v16 = (_QWORD *)(v3 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_identifier);
  *v16 = 0;
  v16[1] = 0;
  v17 = v3 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_url;
  v18 = sub_20CFCC47C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = v22;
  *v16 = a1;
  v16[1] = v19;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_20CF8286C(v23, v17);
  swift_endAccess();
  return v3;
}

uint64_t sub_20CF843B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[6];

  v1 = v0;
  *(_BYTE *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) = 0;
  v2 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_prefetchTimer;
  if (!*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_prefetchTimer))
  {
    v3 = *(void **)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_document);
    objc_opt_self();
    v4 = swift_dynamicCastObjCClass();
    if (v4)
    {
      v5 = v4;
      v6 = (void *)objc_opt_self();
      v7 = swift_allocObject();
      *(_QWORD *)(v7 + 16) = v1;
      *(_QWORD *)(v7 + 24) = v5;
      v13[4] = sub_20CF9C1D4;
      v13[5] = v7;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 1107296256;
      v13[2] = sub_20CF9B698;
      v13[3] = &block_descriptor;
      v8 = _Block_copy(v13);
      v9 = v3;
      swift_retain();
      swift_release();
      v10 = objc_msgSend(v6, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v8, 0.75);
      _Block_release(v8);
      v11 = *(void **)(v1 + v2);
      *(_QWORD *)(v1 + v2) = v10;

    }
  }
  swift_retain();
  sub_20CF85310();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v13[0]) = 1;
  swift_retain();
  return sub_20CFCC674();
}

uint64_t sub_20CF84564(uint64_t result)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  char v5;
  __int128 v6;

  v6 = *(_OWORD *)(result + 32);
  if (*(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v6 + 1) + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_imageLoader)
                 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_identifier
                 + 8))
  {
    v1 = (void *)objc_opt_self();
    sub_20CF8B830((uint64_t)&v6);
    swift_retain();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    v3 = objc_msgSend(v1, sel_dataCacheForIdentifier_, v2);

    if (v3)
    {

      swift_getKeyPath();
      swift_getKeyPath();
      sub_20CFCC668();
      swift_release();
      swift_release();
      if (v5)
      {
        sub_20CF8AC84(v4, v5);
      }
      else
      {
        sub_20CF8AC84(v4, 0);
        sub_20CF85428();
      }
    }
    swift_release();
    return sub_20CF8AD0C((uint64_t)&v6);
  }
  return result;
}

void sub_20CF8469C(char *a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  _QWORD *v9;
  id v10;

  v4 = OBJC_IVAR____TtC6TipsUI11_PlayerView_player;
  v5 = *(void **)&a1[OBJC_IVAR____TtC6TipsUI11_PlayerView_player];
  *(_QWORD *)&a1[OBJC_IVAR____TtC6TipsUI11_PlayerView_player] = a3;
  v6 = a3;

  v10 = objc_msgSend(a1, sel_layer);
  objc_opt_self();
  v7 = (void *)swift_dynamicCastObjCClassUnconditional();
  objc_msgSend(v7, sel_setPlayer_, *(_QWORD *)&a1[v4]);
  v8 = (unint64_t)objc_msgSend(a1, sel_contentMode);
  if (v8 > 2)
    v9 = (_QWORD *)MEMORY[0x24BDB1C78];
  else
    v9 = (_QWORD *)qword_24C5DEE98[v8];
  objc_msgSend(v7, sel_setVideoGravity_, *v9);

}

uint64_t sub_20CF84788(void **a1)
{
  void *v1;
  id v2;
  uint64_t result;

  v1 = *a1;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v2 = v1;
    sub_20CFCC674();
  }
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    *(_QWORD *)(result + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoLoaderCancellable) = 0;
    swift_release();
    return swift_release();
  }
  return result;
}

id sub_20CF848B0()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  id result;
  void *v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  id v15;
  char *v16;
  _QWORD v17[2];
  _QWORD aBlock[6];
  objc_super v19;

  v1 = sub_20CFCCDAC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20CFCCDD0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for TPSUIAppController();
  v19.receiver = v0;
  v19.super_class = v9;
  result = objc_msgSendSuper2(&v19, sel_contentWillUpdate);
  v11 = *(void **)&v0[OBJC_IVAR___TPSUIAppController_syncQueue];
  if (v11)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v0;
    aBlock[4] = sub_20CF8BC0C;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20CF8B674;
    aBlock[3] = &block_descriptor_6;
    v13 = _Block_copy(aBlock);
    v17[0] = v2;
    v14 = v13;
    v15 = v11;
    v16 = v0;
    sub_20CFCCDC4();
    v17[1] = MEMORY[0x24BEE4AF8];
    sub_20CF82E3C((unint64_t *)&qword_253EC6920, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6928);
    sub_20CF83538((unint64_t *)&qword_253EC6930, &qword_253EC6928);
    sub_20CFCD34C();
    MEMORY[0x212B9A220](0, v8, v4, v14);
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v17[0] + 8))(v4, v1);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return (id)swift_release();
  }
  return result;
}

void sub_20CF84ABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t Strong;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  unint64_t v31;

  v12 = sub_20CFCCE48();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v17 = Strong;
    v18 = *(_QWORD *)(Strong + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_identifier + 8);
    if (v18)
    {
      v19 = *(_QWORD *)(Strong + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_identifier) == a1 && v18 == a2;
      if (v19 || (sub_20CFCD430() & 1) != 0)
      {
        if (a9)
        {
          swift_getKeyPath();
          swift_getKeyPath();
          v27 = a9;
          LOBYTE(v28) = 1;
          v20 = a9;
          swift_retain();
        }
        else
        {
          sub_20CF865C8(a3, (uint64_t)&v27, &qword_253EC6988);
          if (v29)
          {
            sub_20CF82D58();
            if ((swift_dynamicCast() & 1) != 0)
            {
              v21 = v30;
              v22 = _s7SwiftUI5ImageV04TipsB0E03tpsC0ACSo7UIImageC_tcfC_0();
              swift_getKeyPath();
              swift_getKeyPath();
              v27 = (void *)v22;
              LOBYTE(v28) = 0;
              swift_retain();
              sub_20CFCC674();

LABEL_20:
              v25 = *(void **)(v17 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_urlSessionItem);
              *(_QWORD *)(v17 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_urlSessionItem) = 0;
              swift_release();

              return;
            }
          }
          else
          {
            sub_20CF8658C((uint64_t)&v27, &qword_253EC6988);
          }
          sub_20CF9E8C8();
          v23 = swift_allocError();
          *v24 = 2;
          swift_getKeyPath();
          swift_getKeyPath();
          v27 = (void *)v23;
          LOBYTE(v28) = 1;
          swift_retain();
        }
        sub_20CFCC674();
        goto LABEL_20;
      }
    }
    swift_release();
  }
  sub_20CFCCE24();
  v27 = 0;
  v28 = 0xE000000000000000;
  sub_20CFCD370();
  v30 = v27;
  v31 = v28;
  sub_20CFCD154();
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_bridgeObjectRetain();
    swift_release();
  }
  sub_20CFCD154();
  swift_bridgeObjectRelease();
  sub_20CFCD154();
  sub_20CFCD154();
  sub_20CFCD058();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

char *sub_20CF84E40(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  id v7;
  uint64_t v8;
  objc_class *v9;
  char *v10;
  char *v11;
  void *v12;
  id v13;
  char *v14;
  void *v15;
  char *v16;
  id v17;
  objc_super v19;

  v7 = a2;
  a4 &= 1u;
  sub_20CF87C98(a3, a4);
  sub_20CF82BBC(a3, a4);
  sub_20CF8257C(a3, a4);
  if ((sub_20CFCC734() & 1) != 0)
    v8 = 1;
  else
    v8 = 2;
  v9 = (objc_class *)type metadata accessor for _PlayerView();
  v10 = (char *)objc_allocWithZone(v9);
  *(_QWORD *)&v10[OBJC_IVAR____TtC6TipsUI11_PlayerView_player] = 0;
  v19.receiver = v10;
  v19.super_class = v9;
  v11 = (char *)objc_msgSendSuper2(&v19, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v12 = *(void **)&v11[OBJC_IVAR____TtC6TipsUI11_PlayerView_player];
  *(_QWORD *)&v11[OBJC_IVAR____TtC6TipsUI11_PlayerView_player] = a2;
  v13 = v7;
  v14 = v11;

  objc_msgSend(v14, sel_setContentMode_, v8);
  v15 = (void *)objc_opt_self();
  v16 = v14;
  v17 = objc_msgSend(v15, sel_clearColor);
  objc_msgSend(v16, sel_setBackgroundColor_, v17);

  return v16;
}

uint64_t sub_20CF84F98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t result;
  uint64_t v14;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6120);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)&v14 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v14 - v8;
  v10 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v11 = OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_urlSessionItem;
  objc_msgSend(v10, sel_cancelSessionItem_, *(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_urlSessionItem));

  v12 = *(void **)(v0 + v11);
  *(_QWORD *)(v0 + v11) = 0;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  LODWORD(v10) = swift_getEnumCaseMultiPayload();
  result = sub_20CF8658C((uint64_t)v9, &qword_253EC6120);
  if ((_DWORD)v10)
  {
    swift_storeEnumTagMultiPayload();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_20CF865C8((uint64_t)v7, (uint64_t)v4, &qword_253EC6120);
    swift_retain();
    sub_20CFCC674();
    return sub_20CF8658C((uint64_t)v7, &qword_253EC6120);
  }
  return result;
}

uint64_t sub_20CF85298@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

void sub_20CF85310()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v2 = OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_urlSessionItem;
  objc_msgSend(v1, sel_cancelSessionItem_, *(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_urlSessionItem));

  v3 = *(void **)(v0 + v2);
  *(_QWORD *)(v0 + v2) = 0;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  if (v5)
  {
    sub_20CF8AC84(v4, v5);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_20CFCC674();
  }
  else
  {
    sub_20CF8AC84(v4, 0);
  }
}

void sub_20CF85428()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  double v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t aBlock;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, void *);
  void *v30;
  void (*v31)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *);
  uint64_t v32;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_20CFCC47C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v1 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_url;
  swift_beginAccess();
  sub_20CF865C8(v8, (uint64_t)v3, &qword_253EC5F58);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_20CF8658C((uint64_t)v3, &qword_253EC5F58);
LABEL_7:
    sub_20CF9E8C8();
    v10 = swift_allocError();
    *v11 = 1;
    swift_getKeyPath();
    swift_getKeyPath();
    aBlock = v10;
    LOBYTE(v28) = 1;
    swift_retain();
    sub_20CFCC674();
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  if (!*(_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_identifier + 8))
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    goto LABEL_7;
  }
  v9 = OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_urlSessionItem;
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_urlSessionItem))
  {
LABEL_5:
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_20CFCC668();
  swift_release();
  swift_release();
  v12 = (void *)aBlock;
  if (!(_BYTE)v28)
  {
    swift_bridgeObjectRelease();
    sub_20CF8AC84(v12, 0);
    goto LABEL_5;
  }
  sub_20CF8AC84((void *)aBlock, v28);
  v13 = (void *)objc_opt_self();
  v14 = (void *)sub_20CFCD0F4();
  v15 = objc_msgSend(v13, sel_imageFromMemoryCacheForIdentifier_, v14);

  if (v15)
  {
    swift_bridgeObjectRelease();
    v16 = v15;
    v17 = _s7SwiftUI5ImageV04TipsB0E03tpsC0ACSo7UIImageC_tcfC_0();
    swift_getKeyPath();
    swift_getKeyPath();
    aBlock = v17;
    LOBYTE(v28) = 0;
    swift_retain();
    sub_20CFCC674();

    goto LABEL_5;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  aBlock = 1;
  LOBYTE(v28) = 2;
  swift_retain();
  sub_20CFCC674();
  sub_20CFCC434();
  v18 = (void *)sub_20CFCD0F4();
  swift_bridgeObjectRelease();
  v19 = (void *)sub_20CFCD0F4();
  swift_bridgeObjectRelease();
  v20 = *MEMORY[0x24BDD1350];
  v21 = swift_allocObject();
  swift_weakInit();
  v31 = sub_20CF8BD28;
  v32 = v21;
  aBlock = MEMORY[0x24BDAC760];
  v28 = 1107296256;
  v29 = sub_20CF840A8;
  v30 = &block_descriptor_2;
  v22 = _Block_copy(&aBlock);
  swift_release();
  LODWORD(v23) = v20;
  v24 = objc_msgSend(v13, sel_formattedDataForPath_identifier_priority_completionHandler_, v18, v19, v22, v23);
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v25 = *(void **)(v1 + v9);
  *(_QWORD *)(v1 + v9) = v24;

}

char *TPSUIAppController.init()()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  void *v9;
  char *v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  _QWORD v27[2];
  _QWORD aBlock[6];
  objc_super v29;

  v1 = sub_20CFCD268();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20CFCD250();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_20CFCCDD0();
  MEMORY[0x24BDAC7A8](v6);
  v0[OBJC_IVAR___TPSUIAppController_viewNavigationCollapsed] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___TPSUIAppController_syncQueue] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___TPSUIAppController_attributedStringCache] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___TPSUIAppController_footnoteAttributedStringCache] = 0;
  v7 = (objc_class *)type metadata accessor for TPSUIAppController();
  v29.receiver = v0;
  v29.super_class = v7;
  v8 = objc_msgSendSuper2(&v29, sel_init);
  v9 = (void *)objc_opt_self();
  v10 = (char *)v8;
  v11 = objc_msgSend(v9, sel_sharedInstance);
  v12 = v10;
  if (v11)
  {
    v13 = v11;
    v14 = objc_msgSend(v11, sel_tipsAccessAllowed);

    v12 = v10;
    if (v14)
    {
      v27[1] = sub_20CF82E00();
      sub_20CFCCDC4();
      aBlock[0] = MEMORY[0x24BEE4AF8];
      sub_20CF82E3C(&qword_253EC6958, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6938);
      sub_20CF83538(&qword_253EC6940, &qword_253EC6938);
      sub_20CFCD34C();
      (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5750], v1);
      v15 = sub_20CFCD28C();
      v16 = *(void **)&v10[OBJC_IVAR___TPSUIAppController_syncQueue];
      *(_QWORD *)&v10[OBJC_IVAR___TPSUIAppController_syncQueue] = v15;

      v17 = MEMORY[0x24BEE4AF8];
      v18 = sub_20CF85F1C(MEMORY[0x24BEE4AF8]);
      v19 = (unint64_t *)&v10[OBJC_IVAR___TPSUIAppController_attributedStringCache];
      swift_beginAccess();
      *v19 = v18;
      swift_bridgeObjectRelease();
      v20 = sub_20CF85F1C(v17);
      v21 = (unint64_t *)&v10[OBJC_IVAR___TPSUIAppController_footnoteAttributedStringCache];
      swift_beginAccess();
      *v21 = v20;
      swift_bridgeObjectRelease();
      v12 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
      v22 = *MEMORY[0x24BEBE088];
      v23 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = sub_20CF9F048;
      aBlock[5] = v23;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_20CF9F050;
      aBlock[3] = &block_descriptor_1;
      v24 = _Block_copy(aBlock);
      swift_release();
      v25 = objc_msgSend(v12, sel_addObserverForName_object_queue_usingBlock_, v22, 0, 0, v24);

      _Block_release(v24);
      swift_unknownObjectRelease();
    }
  }

  return v10;
}

unint64_t sub_20CF85E08(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_20CFCD400();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (void **)(a1 + 48);
  while (1)
  {
    v6 = (uint64_t)*(v5 - 2);
    v7 = (uint64_t)*(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    v9 = v8;
    result = sub_20CFA6D2C(v6, v7);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v3[6] + 16 * result);
    *v12 = v6;
    v12[1] = v7;
    *(_QWORD *)(v3[7] + 8 * result) = v9;
    v13 = v3[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v3[2] = v15;
    v5 += 3;
    if (!--v4)
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

unint64_t sub_20CF85F1C(uint64_t a1)
{
  return sub_20CF85E08(a1, &qword_253EC6B78);
}

id TipNavigationViewModel.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  objc_class *v12;
  uint64_t v14;
  objc_super v15;
  uint64_t v16;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68A0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68C0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = &v0[OBJC_IVAR___TipNavigationViewModel__currentTip];
  v16 = 0;
  v10 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6968);
  sub_20CFCC638();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  v11 = &v10[OBJC_IVAR___TipNavigationViewModel__tips];
  v16 = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6948);
  sub_20CFCC638();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v11, v4, v1);

  v12 = (objc_class *)type metadata accessor for TipNavigationViewModel();
  v15.receiver = v10;
  v15.super_class = v12;
  return objc_msgSendSuper2(&v15, sel_init);
}

uint64_t type metadata accessor for TipNavigationViewModel()
{
  uint64_t result;

  result = qword_253EC6820;
  if (!qword_253EC6820)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20CF860EC@<X0>(uint64_t a1@<X8>)
{
  void **v1;
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
  void *v15;
  id v16;
  char v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  float *(**v22)(float *);
  id v23;
  void *v24;
  id v25;
  char *v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (**v33)(uint64_t);
  char *v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (**v41)(uint64_t);
  uint64_t v43;
  uint64_t KeyPath;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v2 = (uint64_t)v1;
  v56 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F38);
  v54 = *(_QWORD *)(v3 - 8);
  v55 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v53 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20CFCD2B0();
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v48 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F30);
  v7 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5EB0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5EA8);
  MEMORY[0x24BDAC7A8](v47);
  v46 = (uint64_t)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5EC0);
  MEMORY[0x24BDAC7A8](v50);
  v49 = (uint64_t)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v1;
  KeyPath = swift_getKeyPath();
  v16 = v15;
  v43 = sub_20CFCCBF0();
  v17 = sub_20CFCCA40();
  swift_getKeyPath();
  sub_20CFCC428();
  swift_release();
  v18 = swift_allocObject();
  v19 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v18 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v18 + 32) = v19;
  *(_OWORD *)(v18 + 48) = *(_OWORD *)(v2 + 32);
  *(_BYTE *)(v18 + 64) = *(_BYTE *)(v2 + 48);
  v20 = v45;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(&v12[*(int *)(v10 + 52)], v9, v45);
  v21 = KeyPath;
  *(_QWORD *)v12 = v15;
  *((_QWORD *)v12 + 1) = v21;
  v12[16] = 0;
  *((_QWORD *)v12 + 3) = v43;
  v12[32] = v17;
  v22 = (float *(**)(float *))&v12[*(int *)(v10 + 56)];
  *v22 = sub_20CF8BE14;
  v22[1] = (float *(*)(float *))v18;
  sub_20CF8AEC8(v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v20);
  v23 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v24 = (void *)sub_20CFCD0F4();
  v25 = objc_msgSend(v16, sel_currentItem);
  v26 = v48;
  sub_20CFCD2BC();

  v27 = swift_allocObject();
  v28 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v27 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v27 + 32) = v28;
  *(_OWORD *)(v27 + 48) = *(_OWORD *)(v2 + 32);
  *(_BYTE *)(v27 + 64) = *(_BYTE *)(v2 + 48);
  v29 = v46;
  sub_20CF865C8((uint64_t)v12, v46, &qword_253EC5EB0);
  v30 = v47;
  v32 = v51;
  v31 = v52;
  (*(void (**)(uint64_t, char *, uint64_t))(v51 + 16))(v29 + *(int *)(v47 + 52), v26, v52);
  v33 = (uint64_t (**)(uint64_t))(v29 + *(int *)(v30 + 56));
  *v33 = sub_20CF9C4A0;
  v33[1] = (uint64_t (*)(uint64_t))v27;
  sub_20CF8AEC8(v2);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v26, v31);
  sub_20CF8658C((uint64_t)v12, &qword_253EC5EB0);
  swift_getKeyPath();
  v34 = v53;
  sub_20CFCC428();
  swift_release();
  v35 = swift_allocObject();
  v36 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v35 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v35 + 32) = v36;
  *(_OWORD *)(v35 + 48) = *(_OWORD *)(v2 + 32);
  *(_BYTE *)(v35 + 64) = *(_BYTE *)(v2 + 48);
  v37 = v49;
  sub_20CF865C8(v29, v49, &qword_253EC5EA8);
  v38 = v50;
  v40 = v54;
  v39 = v55;
  (*(void (**)(uint64_t, char *, uint64_t))(v54 + 16))(v37 + *(int *)(v50 + 52), v34, v55);
  v41 = (uint64_t (**)(uint64_t))(v37 + *(int *)(v38 + 56));
  *v41 = sub_20CF8BE0C;
  v41[1] = (uint64_t (*)(uint64_t))v35;
  sub_20CF8AEC8(v2);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v34, v39);
  sub_20CF8658C(v29, &qword_253EC5EA8);
  return sub_20CF9C4DC(v37, v56);
}

uint64_t sub_20CF8658C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_20CF865C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t assignWithCopy for VideoPlayerView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  char v15;
  __int128 v16;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = (_OWORD *)(a1 + 8);
  v8 = (_OWORD *)(a2 + 8);
  v9 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v9)
    {
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
      swift_retain();
      swift_release();
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      swift_retain();
      swift_release();
      *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
    }
    else
    {
      sub_20CF8658C(a1 + 8, &qword_253EC5EF8);
      v10 = *(_BYTE *)(a2 + 24);
      *v7 = *v8;
      *(_BYTE *)(a1 + 24) = v10;
    }
  }
  else if (v9)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
    swift_retain();
    swift_retain();
  }
  else
  {
    v11 = *v8;
    *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
    *v7 = v11;
  }
  v12 = (_OWORD *)(a1 + 32);
  v13 = (_OWORD *)(a2 + 32);
  v14 = *(_QWORD *)(a2 + 40);
  if (*(_QWORD *)(a1 + 40))
  {
    if (v14)
    {
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      swift_retain();
      swift_release();
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      swift_retain();
      swift_release();
      *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    }
    else
    {
      sub_20CF8658C(a1 + 32, &qword_253EC5EF8);
      v15 = *(_BYTE *)(a2 + 48);
      *v12 = *v13;
      *(_BYTE *)(a1 + 48) = v15;
    }
  }
  else if (v14)
  {
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    swift_retain();
    swift_retain();
  }
  else
  {
    v16 = *v13;
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    *v12 = v16;
  }
  return a1;
}

uint64_t type metadata accessor for _PlayerView()
{
  return objc_opt_self();
}

uint64_t assignWithCopy for RemoteVideoView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_20CF87C98(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_20CF8257C(v6, v7);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_BYTE *)(a2 + 24);
  sub_20CF87C98(v8, v9);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_BYTE *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v8;
  *(_BYTE *)(a1 + 24) = v9;
  sub_20CF8257C(v10, v11);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  return a1;
}

char *sub_20CF8696C()
{
  _BYTE *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  char *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  objc_super v24;

  v1 = &v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme];
  v2 = *MEMORY[0x24BDEB400];
  v3 = sub_20CFCC728();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v1, v2, v3);
  v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__loading] = 0;
  v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__hasLoaded] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__collections] = MEMORY[0x24BEE4AF8];
  v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__contentMessageType] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentCollection] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentTip] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__featuredCollection] = 0;
  v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__isSharedVariant] = 0;
  v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel__shouldDisplaySharedVariant] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel_sharedVariantTip] = 0;
  v4 = &v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel_pendingSharedVariantID];
  *v4 = 0;
  v4[1] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC6TipsUI16TipsContentModel_currentTipList] = 0;
  v5 = OBJC_IVAR____TtC6TipsUI16TipsContentModel_prefetchingManager;
  v6 = objc_allocWithZone((Class)TPSTipsAssetPrefetchingManager);
  v7 = v0;
  *(_QWORD *)&v0[v5] = objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController;
  *(_QWORD *)&v7[v8] = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  *(_QWORD *)&v7[OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController] = 0;
  v9 = OBJC_IVAR____TtC6TipsUI16TipsContentModel_contentDidUpdate;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6858);
  swift_allocObject();
  *(_QWORD *)&v7[v9] = sub_20CFCC5FC();
  v10 = OBJC_IVAR____TtC6TipsUI16TipsContentModel_savedTipsContentDidUpdate;
  swift_allocObject();
  *(_QWORD *)&v7[v10] = sub_20CFCC5FC();
  v11 = OBJC_IVAR____TtC6TipsUI16TipsContentModel_networkDidChangeToReachable;
  swift_allocObject();
  *(_QWORD *)&v7[v11] = sub_20CFCC5FC();
  sub_20CFCC548();

  v24.receiver = v7;
  v24.super_class = (Class)type metadata accessor for TipsContentModel();
  v12 = objc_msgSendSuper2(&v24, sel_init);
  v13 = (void *)objc_opt_self();
  v14 = (char *)v12;
  v15 = objc_msgSend(v13, sel_sharedInstance);
  v16 = (void *)objc_opt_self();
  v17 = objc_msgSend(v16, sel_defaultManager);
  objc_msgSend(v17, sel_setDelegate_, v15);

  v18 = objc_msgSend(v16, sel_defaultManager);
  objc_msgSend(v18, sel_setDefaultSessionDelegate_, v15);

  if (objc_msgSend((id)objc_opt_self(), sel_isInternalDevice))
  {
    v19 = objc_msgSend((id)objc_opt_self(), sel_defaultContext);
    v20 = objc_msgSend(v16, sel_defaultManager);
    v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB7DB8]), sel_initWithAuthenticationContext_, v19);
    objc_msgSend(v20, sel_setAuthenticationHandler_, v21);

  }
  v22 = *(id *)&v14[OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController];
  objc_msgSend(v22, sel_addDelegate_, v14);

  return v14;
}

uint64_t destroy for VideoPlayerViewRepresentable(uint64_t a1)
{

  return sub_20CF8257C(*(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_20CF8710C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char *a9)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
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
  uint64_t Strong;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE *v42;
  void *v43;
  char *v44;
  uint64_t *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;

  v47 = a3;
  v50 = a1;
  v10 = sub_20CFCCE48();
  v48 = *(_QWORD *)(v10 - 8);
  v49 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_20CFCC47C();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v44 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6120);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v46 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v45 = (uint64_t *)((char *)&v44 - v23);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v44 - v24;
  *(char **)((char *)&v44 - v24) = a9;
  swift_storeEnumTagMultiPayload();
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v27 = Strong;
    v28 = *(_QWORD *)(Strong + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_identifier + 8);
    if (v28
      && a2
      && (*(_QWORD *)(Strong + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_identifier) == v50 && v28 == a2
       || (sub_20CFCD430() & 1) != 0))
    {
      sub_20CF865C8(v47, (uint64_t)&v51, &qword_253EC6988);
      v29 = v53;
      v30 = a9;
      if (v29)
      {
        v31 = swift_dynamicCast();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v15, v31 ^ 1u, 1, v16);
        v32 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16);
        v34 = v45;
        v33 = (uint64_t)v46;
        if (v32 != 1)
        {
          sub_20CF8658C((uint64_t)v25, &qword_253EC6120);
          v35 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
          v36 = v44;
          v35(v44, v15, v16);
          v35(v25, v36, v16);
          swift_storeEnumTagMultiPayload();
LABEL_17:
          sub_20CF865C8((uint64_t)v25, (uint64_t)v34, &qword_253EC6120);
          swift_getKeyPath();
          swift_getKeyPath();
          sub_20CF865C8((uint64_t)v34, v33, &qword_253EC6120);
          swift_retain();
          sub_20CFCC674();
          sub_20CF8658C((uint64_t)v34, &qword_253EC6120);
          sub_20CF8658C((uint64_t)v25, &qword_253EC6120);
          v43 = *(void **)(v27 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_urlSessionItem);
          *(_QWORD *)(v27 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_urlSessionItem) = 0;
          swift_release();

          return;
        }
      }
      else
      {
        sub_20CF8658C((uint64_t)&v51, &qword_253EC6988);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
        v34 = v45;
        v33 = (uint64_t)v46;
      }
      sub_20CF8658C((uint64_t)v15, &qword_253EC5F58);
      sub_20CF9E8C8();
      v41 = swift_allocError();
      *v42 = 2;
      sub_20CF8658C((uint64_t)v25, &qword_253EC6120);
      *v34 = v41;
      swift_storeEnumTagMultiPayload();
      sub_20CF9E930((uint64_t)v34, (uint64_t)v25);
      goto LABEL_17;
    }
    v37 = a9;
    swift_release();
  }
  else
  {
    v38 = a9;
  }
  v40 = v48;
  v39 = v49;
  sub_20CFCCE24();
  v51 = 0;
  v52 = 0xE000000000000000;
  sub_20CFCD370();
  v54 = v51;
  v55 = v52;
  sub_20CFCD154();
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_bridgeObjectRetain();
    swift_release();
  }
  sub_20CFCD154();
  swift_bridgeObjectRelease();
  sub_20CFCD154();
  swift_bridgeObjectRetain();
  sub_20CFCD154();
  swift_bridgeObjectRelease();
  sub_20CFCD058();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v12, v39);
  sub_20CF8658C((uint64_t)v25, &qword_253EC6120);
}

void sub_20CF87650()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
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
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  char *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  double v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  _QWORD aBlock[6];

  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6120);
  v1 = MEMORY[0x24BDAC7A8](v39);
  v3 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v1);
  v6 = (uint64_t *)((char *)&v35 - v5);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v35 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_20CFCC47C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = v0 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_url;
  swift_beginAccess();
  v17 = v16;
  v18 = v12;
  sub_20CF865C8(v17, (uint64_t)v11, &qword_253EC5F58);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_20CF8658C((uint64_t)v11, &qword_253EC5F58);
LABEL_7:
    sub_20CF9E8C8();
    v20 = swift_allocError();
    *v21 = 1;
    *v6 = v20;
    swift_storeEnumTagMultiPayload();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_20CF865C8((uint64_t)v6, (uint64_t)v3, &qword_253EC6120);
    swift_retain();
    sub_20CFCC674();
    v22 = (uint64_t)v6;
LABEL_8:
    sub_20CF8658C(v22, &qword_253EC6120);
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  if (!*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_identifier + 8))
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    goto LABEL_7;
  }
  v19 = OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_urlSessionItem;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_urlSessionItem))
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v18);
    return;
  }
  v37 = *(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_identifier);
  v38 = v15;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_20CFCC668();
  swift_release();
  swift_release();
  if (!swift_getEnumCaseMultiPayload())
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v38, v18);
    swift_bridgeObjectRelease();
    v22 = (uint64_t)v8;
    goto LABEL_8;
  }
  v36 = v19;
  sub_20CF8658C((uint64_t)v8, &qword_253EC6120);
  swift_storeEnumTagMultiPayload();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CF865C8((uint64_t)v6, (uint64_t)v3, &qword_253EC6120);
  swift_retain();
  sub_20CFCC674();
  sub_20CF8658C((uint64_t)v6, &qword_253EC6120);
  sub_20CF82D94();
  v23 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  v24 = v0;
  if (v23)
  {
    v25 = v23;
    v26 = v38;
    sub_20CFCC434();
    v27 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    v28 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    v29 = *MEMORY[0x24BDD1350];
    v30 = swift_allocObject();
    swift_weakInit();
    aBlock[4] = sub_20CF8BDE8;
    aBlock[5] = v30;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20CF83C18;
    aBlock[3] = &block_descriptor_0;
    v31 = _Block_copy(aBlock);
    swift_release();
    LODWORD(v32) = v29;
    v33 = objc_msgSend(v25, sel_formattedDataForPath_identifier_attributionIdentifier_priority_completionHandler_, v27, v28, 0, v31, v32);
    _Block_release(v31);

    (*(void (**)(char *, uint64_t))(v13 + 8))(v26, v18);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v38, v18);
    swift_bridgeObjectRelease();
    v33 = 0;
  }
  v34 = *(void **)(v24 + v36);
  *(_QWORD *)(v24 + v36) = v33;

}

void sub_20CF87B64(id *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 8)
    v3 = 8;
  if (v3 > 3)
    goto LABEL_4;
  v5 = ((1 << (8 * v3)) + 1) >> (8 * v3);
  if (v5 > 0xFFFD)
  {
    v4 = *(_DWORD *)((char *)a1 + v3);
  }
  else
  {
    if (v5 <= 0xFD)
    {
LABEL_4:
      v4 = *((unsigned __int8 *)a1 + v3);
      goto LABEL_9;
    }
    v4 = *(unsigned __int16 *)((char *)a1 + v3);
  }
LABEL_9:
  if (v4 < 2)
  {
    if (v4 == 1)

    else
      (*(void (**)(void))(v2 + 8))();
  }
  else
  {
    if (v3 <= 3)
      v6 = v3;
    else
      v6 = 4;
    ((void (*)(void))((char *)&loc_20CF87BEC + 4 * byte_20CFCF825[v6]))();
  }
}

uint64_t _s6TipsUI28VideoPlayerViewRepresentableVwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  char v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 16);
  v6 = v3;
  sub_20CF87C98(v4, v5);
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_20CF87C98(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_20CF87CA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6120);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CF87F14(a1, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_20CF8658C((uint64_t)v6, &qword_253EC6120);
    v7 = sub_20CFCC47C();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(a2, 1, 1, v7);
  }
  else
  {
    v9 = sub_20CFCC47C();
    v10 = *(_QWORD *)(v9 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a2, v6, v9);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 56))(a2, 0, 1, v9);
  }
}

void sub_20CF87D98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6120);
  MEMORY[0x24BDAC7A8](v2);
  sub_20CF87F14(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (char *)sub_20CF87E28 + 4 * byte_20CFCF9A0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_20CF87E28()
{
  uint64_t v0;

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_20CF843B8();
    swift_release();
  }
  return sub_20CF8658C(v0, &qword_253EC6120);
}

uint64_t sub_20CF87F14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_20CF87F5C(char *__dst, id *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  id v10;
  id v11;
  unsigned int v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  if (v5 > 3)
    goto LABEL_5;
  v7 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  if (v7 > 0xFFFD)
  {
    v6 = *(_DWORD *)((char *)a2 + v5);
  }
  else
  {
    if (v7 <= 0xFD)
    {
LABEL_5:
      v6 = *((unsigned __int8 *)a2 + v5);
      goto LABEL_10;
    }
    v6 = *(unsigned __int16 *)((char *)a2 + v5);
  }
LABEL_10:
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v8 = v5;
    else
      v8 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    v10 = *a2;
    v11 = *a2;
    *(_QWORD *)__dst = v10;
    if (v5 > 3)
      goto LABEL_21;
    v12 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v12 > 0xFFFD)
    {
      *(_DWORD *)&__dst[v5] = 1;
      return __dst;
    }
    if (v12 <= 0xFD)
LABEL_21:
      __dst[v5] = 1;
    else
      *(_WORD *)&__dst[v5] = 1;
  }
  else
  {
    (*(void (**)(char *))(v4 + 16))(__dst);
    if (v5 <= 3)
    {
      v9 = ((1 << (8 * v5)) + 1) >> (8 * v5);
      if (v9 > 0xFFFD)
      {
        *(_DWORD *)&__dst[v5] = 0;
        return __dst;
      }
      if (v9 > 0xFD)
      {
        *(_WORD *)&__dst[v5] = 0;
        return __dst;
      }
    }
    __dst[v5] = 0;
  }
  return __dst;
}

uint64_t destroy for VideoPlayerView(uint64_t a1)
{
  uint64_t result;

  if (*(_QWORD *)(a1 + 16))
  {
    swift_release();
    swift_release();
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

void sub_20CF881AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6878);
  v19 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E08);
  v20 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5DD8);
  v21 = *(_QWORD *)(v8 - 8);
  v22 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5DE8);
  v23 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_20CFCC668();
    swift_release();
    swift_release();
    v14 = v24;

    if (!v14)
    {
      v18[1] = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoFileLoader;
      swift_beginAccess();
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6890);
      sub_20CFCC644();
      swift_endAccess();
      swift_release();
      swift_allocObject();
      swift_weakInit();
      swift_allocObject();
      v18[0] = v11;
      swift_weakInit();
      sub_20CF88608(&qword_253EC6870, &qword_253EC6878, MEMORY[0x24BDB9EE8]);
      swift_retain();
      sub_20CFCC6A4();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v2);
      swift_release();
      sub_20CFCC47C();
      sub_20CF88608(&qword_253EC5E00, &qword_253EC5E08, MEMORY[0x24BDB9568]);
      sub_20CFCC698();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v5);
      sub_20CF82934(0, &qword_253EC5F28);
      v15 = v22;
      sub_20CFCC5D8();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v15);
      swift_allocObject();
      swift_weakInit();
      sub_20CF88608(&qword_253EC5DE0, &qword_253EC5DE8, MEMORY[0x24BDB94C8]);
      v16 = v18[0];
      v17 = sub_20CFCC6E0();
      swift_release();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v16);
      *(_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoLoaderCancellable) = v17;
      swift_release();
      swift_retain();
      sub_20CF85428();
      swift_release();
      swift_retain();
      sub_20CF87650();
      swift_release();
    }
  }
}

uint64_t sub_20CF88608(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x212B9AA54](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t initializeWithCopy for VideoPlayerView(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;

  v4 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = a1 + 8;
  v6 = *(_QWORD *)(a2 + 16);
  v7 = v4;
  if (!v6)
  {
    *(_OWORD *)v5 = *(_OWORD *)(a2 + 8);
    *(_BYTE *)(v5 + 16) = *(_BYTE *)(a2 + 24);
    v8 = *(_QWORD *)(a2 + 40);
    if (v8)
      goto LABEL_3;
LABEL_5:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    return a1;
  }
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_retain();
  swift_retain();
  v8 = *(_QWORD *)(a2 + 40);
  if (!v8)
    goto LABEL_5;
LABEL_3:
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_20CF88704(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = (((a1 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((v3 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_OWORD *sub_20CF88754(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  _OWORD *v4;
  _OWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);

  *a1 = *a2;
  v4 = (_OWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v5 = (_OWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v4 = *v5;
  v6 = (_QWORD *)(((unint64_t)v4 + 23) & 0xFFFFFFFFFFFFFFF8);
  v7 = (_QWORD *)(((unint64_t)v5 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v6 = *v7;
  v8 = *(_QWORD *)(a3 + 16);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = ((unint64_t)v6 + v10 + 8) & ~v10;
  v12 = ((unint64_t)v7 + v10 + 8) & ~v10;
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  swift_bridgeObjectRetain();
  v13(v11, v12, v8);
  return a1;
}

uint64_t RemoteVideoView.body.getter@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  unint64_t v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD *v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t (**v37)();
  _QWORD v39[2];
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _OWORD v52[8];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _OWORD v57[2];
  _OWORD v58[13];

  v47 = a1;
  v2 = sub_20CFCC908();
  v42 = *(_QWORD *)(v2 - 8);
  v43 = v2;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39[0] = sub_20CFCCA28();
  v5 = *(_QWORD *)(v39[0] - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5EE0);
  v41 = *(_QWORD *)(v8 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E80);
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v13 = (char *)v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v40 = (char *)v39 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v46 = (char *)v39 - v16;
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E90);
  MEMORY[0x24BDAC7A8](v44);
  v45 = (uint64_t)v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = v1[3];
  v55 = v1[2];
  v56 = v18;
  v57[0] = v1[4];
  *(_OWORD *)((char *)v57 + 9) = *(__int128 *)((char *)v1 + 73);
  v19 = v1[1];
  v53 = *v1;
  v54 = v19;
  v20 = sub_20CFCCD4C();
  v22 = v21;
  sub_20CF89140((uint64_t)&v53, (uint64_t)&v49);
  *(_QWORD *)&v48 = v20;
  *((_QWORD *)&v48 + 1) = v22;
  sub_20CFCCA1C();
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5EF0);
  v24 = sub_20CF89064();
  sub_20CFCCB90();
  (*(void (**)(char *, _QWORD))(v5 + 8))(v7, v39[0]);
  v58[8] = v52[4];
  v58[9] = v52[5];
  v58[10] = v52[6];
  v58[11] = v52[7];
  v58[4] = v52[0];
  v58[5] = v52[1];
  v58[6] = v52[2];
  v58[7] = v52[3];
  v58[0] = v48;
  v58[1] = v49;
  v58[2] = v50;
  v58[3] = v51;
  sub_20CF93DDC((uint64_t)v58);
  sub_20CFCC8FC();
  *(_QWORD *)&v48 = v23;
  *((_QWORD *)&v48 + 1) = v24;
  swift_getOpaqueTypeConformance2();
  sub_20CFCCB9C();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v4, v43);
  v25 = v8;
  v26 = (uint64_t)v40;
  (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v25);
  v50 = v55;
  v51 = v56;
  v52[0] = v57[0];
  *(_OWORD *)((char *)v52 + 9) = *(_OWORD *)((char *)v57 + 9);
  v48 = v53;
  v49 = v54;
  v27 = sub_20CF88CC8();
  if (v28)
    v29 = v27;
  else
    v29 = 0;
  if (v28)
    v30 = v28;
  else
    v30 = 0xE000000000000000;
  *(_QWORD *)&v48 = v29;
  *((_QWORD *)&v48 + 1) = v30;
  sub_20CF89020();
  sub_20CFCC7F4();
  swift_bridgeObjectRelease();
  sub_20CF88C1C((uint64_t)v13);
  v50 = v55;
  v51 = v56;
  v52[0] = v57[0];
  *(_OWORD *)((char *)v52 + 9) = *(_OWORD *)((char *)v57 + 9);
  v48 = v53;
  v49 = v54;
  sub_20CF88CC8();
  if (v31)
    swift_bridgeObjectRelease();
  v32 = (uint64_t)v46;
  sub_20CFCC800();
  sub_20CF88C1C(v26);
  v33 = (_OWORD *)swift_allocObject();
  v34 = v56;
  v33[3] = v55;
  v33[4] = v34;
  v33[5] = v57[0];
  *(_OWORD *)((char *)v33 + 89) = *(_OWORD *)((char *)v57 + 9);
  v35 = v54;
  v33[1] = v53;
  v33[2] = v35;
  v36 = v45;
  sub_20CF890F8(v32, v45);
  v37 = (uint64_t (**)())(v36 + *(int *)(v44 + 36));
  *v37 = sub_20CF8BF30;
  v37[1] = (uint64_t (*)())v33;
  v37[2] = 0;
  v37[3] = 0;
  sub_20CF89574((uint64_t)&v53);
  sub_20CF88C1C(v32);
  return sub_20CF890B0(v36, v47);
}

uint64_t sub_20CF88C1C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20CF88C5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t result;

  result = swift_release();
  if ((a8 & 1) == 0)
  {
    sub_20CF88FE0(a4);
    return sub_20CF88FE0(a6);
  }
  return result;
}

id sub_20CF88CC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  char *v4;
  id *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char *v10;
  id *v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v1 = *(_QWORD *)(v0 + 40);
  objc_opt_self();
  v2 = swift_dynamicCastObjCClass();
  v3 = *(void **)(v1 + 16);
  if (v2)
  {
    swift_getKeyPath();
    sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
    v4 = v3;
    sub_20CFCC524();
    swift_release();
    v5 = (id *)&v4[OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentTip];
    swift_beginAccess();
    v6 = *v5;
    v7 = *v5;

    if (v6)
    {
      v8 = objc_msgSend(v7, sel_fullContent);

      if (v8)
      {
        v9 = objc_msgSend(v8, sel_assets);

        if (!v9)
          return v9;
        goto LABEL_9;
      }
    }
    return 0;
  }
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  v10 = v3;
  sub_20CFCC524();
  swift_release();
  v11 = (id *)&v10[OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentCollection];
  swift_beginAccess();
  v12 = *v11;
  v13 = *v11;

  if (!v12)
    return 0;
  v14 = objc_msgSend(v13, sel_featuredContent);

  if (!v14)
    return 0;
  v9 = objc_msgSend(v14, sel_assets);

  if (!v9)
    return v9;
LABEL_9:
  v15 = objc_msgSend(v9, sel_alt);

  if (!v15)
    return 0;
  v9 = (id)sub_20CFCD118();

  return v9;
}

uint64_t sub_20CF88F48(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t result;

  if (a3)
  {

    sub_20CF88FF0(a4, a5);
    sub_20CF88FF0(a7, a8);
    sub_20CF88FE0(a10);
    return sub_20CF88FE0(a12);
  }
  return result;
}

uint64_t sub_20CF88FE0(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_20CF88FF0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_20CF89020()
{
  unint64_t result;

  result = qword_253EC5F00;
  if (!qword_253EC5F00)
  {
    result = MEMORY[0x212B9AA54](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_253EC5F00);
  }
  return result;
}

unint64_t sub_20CF89064()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253EC5EE8;
  if (!qword_253EC5EE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC5EF0);
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDF4750], v1);
    atomic_store(result, (unint64_t *)&qword_253EC5EE8);
  }
  return result;
}

uint64_t sub_20CF890B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20CF890F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20CF89140@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  uint64_t v5;
  char v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  uint64_t (*v18)();
  uint64_t v19;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
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
  unsigned __int8 v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;

  sub_20CF8A970(a1, (uint64_t)&v37);
  v32 = v39;
  v33 = (uint64_t)v37;
  v30 = v41;
  v31 = v40;
  v29 = v42;
  v27 = v38;
  v28 = v43;
  v25 = v44;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_20CFCC668();
  swift_release();
  swift_release();
  swift_release();
  v4 = v37;

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 16);
    v6 = *(_BYTE *)(a1 + 24);
    sub_20CF89574(a1);
    sub_20CF87C98(v5, v6);
    v7 = sub_20CF8AD34(v5, v6);
    sub_20CF8257C(v5, v6);
    sub_20CF8A810(a1);
  }
  else
  {
    v7 = 1.0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_20CFCC668();
  swift_release();
  swift_release();
  swift_release();
  v8 = v37;
  if (v37)
  {
    v9 = sub_20CFCCD4C();
    v23 = v10;
    v24 = v9;
    sub_20CF89574(a1);
    type metadata accessor for DocumentAssetViewModel();
    sub_20CF82E3C((unint64_t *)&qword_253EC5DA8, (uint64_t (*)(uint64_t))type metadata accessor for DocumentAssetViewModel, (uint64_t)&protocol conformance descriptor for DocumentAssetViewModel);
    v21 = v8;
    sub_20CFCC7D0();
    sub_20CF8A810(a1);
    swift_getKeyPath();
    sub_20CFCC7DC();
    swift_release();
    swift_release();
    v11 = v38;
    v26 = (uint64_t)v37;
    v12 = v39;
    sub_20CF89574(a1);
    sub_20CFCC7D0();
    sub_20CF8A810(a1);
    swift_getKeyPath();
    sub_20CFCC7DC();
    swift_release();
    swift_release();
    v13 = v34;
    v14 = v35;
    v22 = v36;
    objc_msgSend(v21, sel_setMuted_, 1);
    v15 = (_OWORD *)swift_allocObject();
    v16 = *(_OWORD *)(a1 + 48);
    v15[3] = *(_OWORD *)(a1 + 32);
    v15[4] = v16;
    v15[5] = *(_OWORD *)(a1 + 64);
    *(_OWORD *)((char *)v15 + 89) = *(_OWORD *)(a1 + 73);
    v17 = *(_OWORD *)(a1 + 16);
    v15[1] = *(_OWORD *)a1;
    v15[2] = v17;
    sub_20CF89574(a1);

    v18 = sub_20CF8BF38;
  }
  else
  {
    v23 = 0;
    v24 = 0;
    v26 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v22 = 0;
    v18 = 0;
    v15 = 0;
  }
  LOBYTE(v37) = v25;
  *(_QWORD *)a2 = v33;
  *(_QWORD *)(a2 + 8) = v27;
  *(_QWORD *)(a2 + 16) = v32;
  *(_QWORD *)(a2 + 24) = v31;
  *(_QWORD *)(a2 + 32) = v30;
  *(_QWORD *)(a2 + 40) = v29;
  *(_QWORD *)(a2 + 48) = v28;
  *(_BYTE *)(a2 + 56) = v25;
  *(double *)(a2 + 64) = v7;
  *(_QWORD *)(a2 + 72) = v24;
  *(_QWORD *)(a2 + 80) = v23;
  *(_QWORD *)(a2 + 88) = v8;
  *(_QWORD *)(a2 + 96) = v26;
  *(_QWORD *)(a2 + 104) = v11;
  *(_QWORD *)(a2 + 112) = v12;
  *(_QWORD *)(a2 + 120) = v13;
  *(_QWORD *)(a2 + 128) = v14;
  *(_QWORD *)(a2 + 136) = v22;
  *(_QWORD *)(a2 + 144) = v18;
  *(_QWORD *)(a2 + 160) = 0;
  *(_QWORD *)(a2 + 168) = 0;
  *(_QWORD *)(a2 + 152) = v15;
  v19 = (uint64_t)v18;
  sub_20CF8A904(v33, v27, v32, v31, v30, v29, v28, v25);
  sub_20CF8AF38(v24, v23, v8, v26, v11, v12, v13, v14, v22, v19, (uint64_t)v15, 0);
  sub_20CF88F48(v24, v23, v8, v26, v11, v12, v13, v14, v22, v19, (uint64_t)v15, 0);
  return sub_20CF88C5C(v33, v27, v32, v31, v30, v29, v28, v25);
}

uint64_t sub_20CF89574(uint64_t a1)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_BYTE *)(a1 + 24);
  sub_20CF87C98(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  sub_20CF87C98(v2, v3);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t initializeWithCopy for RemoteVideoView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_20CF87C98(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_BYTE *)(a2 + 24);
  sub_20CF87C98(v6, v7);
  *(_QWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 24) = v7;
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v10 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v10;
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void sub_20CF896B8(void *a1)
{
  id v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (!a1)
    return;
  v13 = MEMORY[0x24BEE4AF8];
  v1 = a1;
  v2 = objc_msgSend(v1, sel_stops);
  sub_20CF89BD8();
  v3 = sub_20CFCD190();

  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_4;
LABEL_17:

    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v4 = sub_20CFCD3D0();
  swift_bridgeObjectRelease();
  if (!v4)
    goto LABEL_17;
LABEL_4:
  if (v4 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x212B9A340](i, v3);
      else
        v6 = *(id *)(v3 + 8 * i + 32);
      v7 = v6;
      v8 = objc_msgSend(v6, sel_colorString);
      if (v8)
      {
        v9 = v8;
        sub_20CFCD118();

        _sSo7UIColorC6TipsUIE25colorForSystemColorStringyABSSFZ_0();
        v11 = v10;
        swift_bridgeObjectRelease();
        MEMORY[0x212B99BE4](v11);
        v12 = swift_retain();
        MEMORY[0x212B9A118](v12);
        if (*(_QWORD *)(v13 + 16) >= *(_QWORD *)(v13 + 24) >> 1)
          sub_20CFCD1A8();
        sub_20CFCD1B4();
        sub_20CFCD19C();

        swift_release();
      }
      else
      {

      }
    }

    swift_bridgeObjectRelease();
  }
}

uint64_t type metadata accessor for TPSUIAppController()
{
  return objc_opt_self();
}

void _sSo7UIColorC6TipsUIE25colorForSystemColorStringyABSSFZ_0()
{
  char *v0;

  if ((sub_20CFCD16C() & 1) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_20CFCD154();
  }
  v0 = (char *)&loc_20CF89950 + dword_20CF9C224[sub_20CF89B90()];
  __asm { BR              X10 }
}

id sub_20CF89960()
{
  return objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
}

uint64_t sub_20CF89B90()
{
  unint64_t v0;

  v0 = sub_20CFCD418();
  swift_bridgeObjectRelease();
  if (v0 >= 0x10)
    return 16;
  else
    return v0;
}

unint64_t sub_20CF89BD8()
{
  unint64_t result;

  result = qword_253EC6950;
  if (!qword_253EC6950)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253EC6950);
  }
  return result;
}

uint64_t sub_20CF89C14@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  _OWORD v42[2];
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v35 = a2;
  v34 = a1;
  v40 = a3;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6918);
  MEMORY[0x24BDAC7A8](v38);
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_20CFCCD64();
  v5 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6908);
  MEMORY[0x24BDAC7A8](v31);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68F0);
  MEMORY[0x24BDAC7A8](v30);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_20CFCC758();
  v12 = sub_20CFCC80C();
  v39 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v33 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v36 = (uint64_t)&v30 - v15;
  v16 = swift_bridgeObjectRetain();
  MEMORY[0x212B99CD4](v16);
  sub_20CFCC7B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6980);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_20CFD00F0;
  sub_20CFCCBFC();
  v18 = sub_20CFCCC14();
  swift_release();
  *(_QWORD *)(v17 + 32) = v18;
  sub_20CFCCBFC();
  v19 = sub_20CFCCC14();
  swift_release();
  *(_QWORD *)(v17 + 40) = v19;
  *(_QWORD *)&v44 = v17;
  sub_20CFCD19C();
  MEMORY[0x212B99CD4](v44);
  sub_20CFCC7B8();
  v20 = v32;
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF5098], v32);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(&v9[*(int *)(v31 + 36)], v7, v20);
  v21 = v45;
  *(_OWORD *)v9 = v44;
  *((_OWORD *)v9 + 1) = v21;
  *((_QWORD *)v9 + 4) = v46;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v20);
  LOBYTE(v20) = sub_20CFCCA40();
  sub_20CF865C8((uint64_t)v9, (uint64_t)v4, &qword_253EC6908);
  v4[*(int *)(v38 + 36)] = v20;
  sub_20CF865C8((uint64_t)v4, (uint64_t)&v11[*(int *)(v30 + 36)], &qword_253EC6918);
  v22 = v42[1];
  *(_OWORD *)v11 = v42[0];
  *((_OWORD *)v11 + 1) = v22;
  *((_QWORD *)v11 + 4) = v43;
  swift_bridgeObjectRetain();
  sub_20CF8658C((uint64_t)v4, &qword_253EC6918);
  sub_20CF8658C((uint64_t)v9, &qword_253EC6908);
  sub_20CF8A3B0((uint64_t)v42);
  type metadata accessor for TipGradientView(0, v34, v35, v23);
  v24 = sub_20CF8A13C();
  v25 = (uint64_t)v33;
  sub_20CFCCBA8();
  sub_20CF8658C((uint64_t)v11, &qword_253EC68F0);
  v26 = MEMORY[0x212B9AA54](MEMORY[0x24BDEB9D0], v37);
  v41[0] = v24;
  v41[1] = v26;
  MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v12, v41);
  v27 = v36;
  sub_20CF8A1A8(v25, v12, v36);
  v28 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
  v28(v25, v12);
  sub_20CF8A734(v27, v12, v40);
  return ((uint64_t (*)(uint64_t, uint64_t))v28)(v27, v12);
}

void TipGradientView.init(_:startPoint:endPoint:gradientView:)(void *a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>, double a8@<D2>, double a9@<D3>)
{
  uint64_t v17;
  uint64_t v18;

  sub_20CF896B8(a1);
  *(_QWORD *)(a5 + 32) = v17;
  *(double *)a5 = a6;
  *(double *)(a5 + 8) = a7;
  *(double *)(a5 + 16) = a8;
  *(double *)(a5 + 24) = a9;
  type metadata accessor for TipGradientView(0, a3, a4, v18);
  a2();

}

uint64_t type metadata accessor for TipGradientView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TipGradientView);
}

unint64_t sub_20CF8A13C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_253EC68E8;
  if (!qword_253EC68E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC68F0);
    v2[0] = sub_20CF8B858();
    v2[1] = sub_20CF8B6EC();
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_253EC68E8);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  sub_20CF8257C(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
  sub_20CF8257C(*(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 32))
  {
    swift_release();
    swift_release();
  }
  if (*(_QWORD *)(v0 + 56))
  {
    swift_release();
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58) - 8) + 80);
  v2 = (v1 + 32) & ~v1;
  swift_bridgeObjectRelease();
  v3 = sub_20CFCC47C();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  return swift_deallocObject();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212B9AA3C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x212B9A9E8](a1, v6, a5);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212B9AA48](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_20CF8A3B0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t TipGradientView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];
  _QWORD v40[2];

  v38 = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC68F0);
  v4 = *(_QWORD *)(a1 + 16);
  v37 = *(_QWORD *)(a1 + 24);
  v5 = sub_20CFCC758();
  v6 = sub_20CFCC80C();
  v40[0] = sub_20CF8A13C();
  v40[1] = MEMORY[0x212B9AA54](MEMORY[0x24BDEB9D0], v5);
  v35 = v6;
  v33 = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v6, v40);
  v7 = sub_20CFCCCF8();
  v34 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v31 - v12;
  v32 = *(_QWORD *)(v4 - 8);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v31 - v17;
  v19 = sub_20CFCC9C8();
  v36 = *(_QWORD *)(v19 - 8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v31 - v22;
  if (*(_QWORD *)(*(_QWORD *)(v2 + 32) + 16))
  {
    MEMORY[0x24BDAC7A8](v20);
    v24 = v37;
    *(&v31 - 4) = v4;
    *(&v31 - 3) = v24;
    *(&v31 - 2) = v25;
    sub_20CFCCD4C();
    sub_20CFCCCEC();
    MEMORY[0x212B9AA54](MEMORY[0x24BDF4750], v7);
    sub_20CF8A1A8((uint64_t)v10, v7, (uint64_t)v13);
    v26 = *(void (**)(char *, uint64_t))(v34 + 8);
    v26(v10, v7);
    sub_20CF8A734((uint64_t)v13, v7, (uint64_t)v10);
    sub_20CF8A74C((uint64_t)v10, v4, v7);
    v26(v10, v7);
    v26(v13, v7);
  }
  else
  {
    v27 = v21 + *(int *)(a1 + 44);
    v24 = v37;
    sub_20CF8A1A8(v27, v4, (uint64_t)v18);
    sub_20CF8A734((uint64_t)v18, v4, (uint64_t)v16);
    MEMORY[0x212B9AA54](MEMORY[0x24BDF4750], v7);
    sub_20CFA01AC((uint64_t)v16, v4);
    v28 = *(void (**)(char *, uint64_t))(v32 + 8);
    v28(v16, v4);
    v28(v18, v4);
  }
  v29 = MEMORY[0x212B9AA54](MEMORY[0x24BDF4750], v7);
  v39[0] = v24;
  v39[1] = v29;
  MEMORY[0x212B9AA54](MEMORY[0x24BDEF3E0], v19, v39);
  sub_20CF8A734((uint64_t)v23, v19, v38);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v23, v19);
}

uint64_t sub_20CF8A734@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t sub_20CF8A74C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_20CFCC9B0();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_20CFCC9BC();
}

uint64_t sub_20CF8A810(uint64_t a1)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_BYTE *)(a1 + 24);
  sub_20CF8257C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  sub_20CF8257C(v2, v3);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t destroy for RemoteVideoView(uint64_t a1)
{
  sub_20CF8257C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  sub_20CF8257C(*(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_20CF8A8F4(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_20CF8A904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t result;

  result = swift_retain();
  if ((a8 & 1) == 0)
  {
    sub_20CF8A8F4(a4);
    return sub_20CF8A8F4(a6);
  }
  return result;
}

double sub_20CF8A970@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  _OWORD *v13;
  __int128 v14;
  __int128 v15;
  double result;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  char v30;
  __int128 v31;

  v4 = sub_20CFCCC68();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = *(_OWORD *)(a1 + 32);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_20CFCC668();
  swift_release();
  swift_release();
  sub_20CF8AD0C((uint64_t)&v31);
  v8 = (void *)v26;
  if (BYTE8(v26))
  {
    sub_20CF8AC84((void *)v26, SBYTE8(v26));
    v21 = sub_20CFCCBF0();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5EA0);
    sub_20CF8ACA0((unint64_t *)&qword_253EC5E98, &qword_253EC5EA0, (uint64_t (*)(void))sub_20CF8B7CC);
    sub_20CFCC9BC();
  }
  else
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF3FD0], v4);
    swift_retain();
    v9 = sub_20CFCCC8C();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v10 = *(_QWORD *)a1;
    v11 = *(_BYTE *)(a1 + 8);
    sub_20CF89574(a1);
    sub_20CF87C98(v10, v11);
    v12 = sub_20CF82BBC(v10, v11);
    sub_20CF8257C(v10, v11);
    sub_20CF8A810(a1);
    v13 = (_OWORD *)swift_allocObject();
    v14 = *(_OWORD *)(a1 + 48);
    v13[3] = *(_OWORD *)(a1 + 32);
    v13[4] = v14;
    v13[5] = *(_OWORD *)(a1 + 64);
    *(_OWORD *)((char *)v13 + 89) = *(_OWORD *)(a1 + 73);
    v15 = *(_OWORD *)(a1 + 16);
    v13[1] = *(_OWORD *)a1;
    v13[2] = v15;
    v21 = v9;
    *(_QWORD *)&v22 = 0;
    *((_QWORD *)&v22 + 1) = ((unint64_t)(v12 & 1) << 8) | 1;
    *(_QWORD *)&v23 = sub_20CF8BF38;
    v24 = 0uLL;
    *((_QWORD *)&v23 + 1) = v13;
    v25 = 0;
    swift_retain();
    swift_retain();
    sub_20CF89574(a1);
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5EA0);
    sub_20CF8ACA0((unint64_t *)&qword_253EC5E98, &qword_253EC5EA0, (uint64_t (*)(void))sub_20CF8B7CC);
    sub_20CFCC9BC();
    sub_20CF8AC84(v8, 0);
    sub_20CF8AC84(v8, 0);
    swift_release_n();
    swift_release_n();
  }
  result = *(double *)&v26;
  v17 = v27;
  v18 = v28;
  v19 = v29;
  v20 = v30;
  *(_OWORD *)a2 = v26;
  *(_OWORD *)(a2 + 16) = v17;
  *(_OWORD *)(a2 + 32) = v18;
  *(_QWORD *)(a2 + 48) = v19;
  *(_BYTE *)(a2 + 56) = v20;
  return result;
}

void sub_20CF8AC84(void *a1, char a2)
{
  if (a2 == 1)
  {

  }
  else if (!a2)
  {
    swift_release();
  }
}

uint64_t sub_20CF8ACA0(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20CF8AD0C(uint64_t a1)
{
  swift_release();
  return a1;
}

double sub_20CF8AD34(uint64_t a1, char a2)
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

  v4 = sub_20CFCC8C0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return *(double *)&a1;
  swift_retain();
  v8 = sub_20CFCD244();
  v9 = sub_20CFCCA34();
  if (os_log_type_enabled(v9, v8))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v14 = *(double *)&v11;
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = sub_20CFB6058(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v14);
    _os_log_impl(&dword_20CF80000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212B9AAFC](v11, -1, -1);
    MEMORY[0x212B9AAFC](v10, -1, -1);
  }

  sub_20CFCC8B4();
  swift_getAtKeyPath();
  sub_20CF8257C(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_20CF8AEC8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)a1;
  sub_20CF8AFD0(v2, v3);
  sub_20CF8AFD0(v4, v5);
  return a1;
}

uint64_t sub_20CF8AF38(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  id v16;
  uint64_t result;

  if (a3)
  {
    v16 = a3;
    sub_20CF8AFD0(a4, a5);
    sub_20CF8AFD0(a7, a8);
    sub_20CF8A8F4(a10);
    return sub_20CF8A8F4(a12);
  }
  return result;
}

uint64_t sub_20CF8AFD0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t RemoteVideoView.init(viewModel:showReplayButtonAtVideoEnd:isImageLoaded:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X4>, uint64_t a5@<X5>, char a6@<W6>, uint64_t a7@<X8>)
{
  uint64_t KeyPath;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  char v18;
  uint64_t v21;
  uint64_t v22;
  char v23;

  KeyPath = swift_getKeyPath();
  v13 = swift_getKeyPath();
  type metadata accessor for DocumentAssetViewModel();
  sub_20CF82E3C((unint64_t *)&qword_253EC5DA8, (uint64_t (*)(uint64_t))type metadata accessor for DocumentAssetViewModel, (uint64_t)&protocol conformance descriptor for DocumentAssetViewModel);
  swift_retain();
  v14 = sub_20CFCC7C4();
  v16 = v15;
  if (a5)
  {
    result = swift_release();
    v18 = a6 & 1;
  }
  else
  {
    sub_20CFCCD10();
    result = swift_release();
    a4 = v21;
    a5 = v22;
    v18 = v23;
  }
  *(_QWORD *)a7 = KeyPath;
  *(_BYTE *)(a7 + 8) = 0;
  *(_QWORD *)(a7 + 16) = v13;
  *(_BYTE *)(a7 + 24) = 0;
  *(_QWORD *)(a7 + 32) = v14;
  *(_QWORD *)(a7 + 40) = v16;
  *(_QWORD *)(a7 + 48) = a4;
  *(_QWORD *)(a7 + 56) = a5;
  *(_BYTE *)(a7 + 64) = v18;
  *(_QWORD *)(a7 + 72) = a1;
  *(_QWORD *)(a7 + 80) = a2;
  *(_BYTE *)(a7 + 88) = a3 & 1;
  return result;
}

uint64_t sub_20CF8B130@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for DocumentAssetViewModel();
  result = sub_20CFCC5F0();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for DocumentAssetViewModel()
{
  uint64_t result;

  result = qword_253EC6468;
  if (!qword_253EC6468)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_20CF8B1A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253EC5DA8;
  if (!qword_253EC5DA8)
  {
    v1 = type metadata accessor for DocumentAssetViewModel();
    result = MEMORY[0x212B9AA54](&protocol conformance descriptor for DocumentAssetViewModel, v1);
    atomic_store(result, (unint64_t *)&qword_253EC5DA8);
  }
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

char *keypath_get_selector_timeControlStatus()
{
  return sel_timeControlStatus;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

char *keypath_get_selector_rate()
{
  return sel_rate;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

__n128 __swift_memcpy89_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t sub_20CF8B674(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

unint64_t sub_20CF8B6A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253EC5EC8;
  if (!qword_253EC5EC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC5ED0);
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_253EC5EC8);
  }
  return result;
}

unint64_t sub_20CF8B6EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253EC6910;
  if (!qword_253EC6910)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC6918);
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDEFB18], v1);
    atomic_store(result, (unint64_t *)&qword_253EC6910);
  }
  return result;
}

uint64_t sub_20CF8B738()
{
  sub_20CF82A6C();
  return sub_20CFCC8D8();
}

unint64_t sub_20CF8B780()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253EC5EB8;
  if (!qword_253EC5EB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC5EC0);
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDEDA68], v1);
    atomic_store(result, (unint64_t *)&qword_253EC5EB8);
  }
  return result;
}

unint64_t sub_20CF8B7CC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_253EC68F8;
  if (!qword_253EC68F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC6900);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_253EC68F8);
  }
  return result;
}

uint64_t sub_20CF8B830(uint64_t a1)
{
  swift_retain();
  return a1;
}

unint64_t sub_20CF8B858()
{
  unint64_t result;

  result = qword_253EC68E0;
  if (!qword_253EC68E0)
  {
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDEC7C0], MEMORY[0x24BDEC7D0]);
    atomic_store(result, (unint64_t *)&qword_253EC68E0);
  }
  return result;
}

void sub_20CF8B89C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253EC68B8)
  {
    v0 = sub_20CFCC680();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253EC68B8);
  }
}

void sub_20CF8B8F0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253EC6898)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC6120);
    v0 = sub_20CFCC680();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253EC6898);
  }
}

void sub_20CF8B948()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253EC6888)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC6118);
    v0 = sub_20CFCC680();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253EC6888);
  }
}

unint64_t sub_20CF8B9A0()
{
  unint64_t result;

  result = qword_253EC5DC0;
  if (!qword_253EC5DC0)
  {
    result = MEMORY[0x212B9AA54](&unk_20CFCFFE0, &type metadata for VideoPlayerViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_253EC5DC0);
  }
  return result;
}

unint64_t sub_20CF8B9E4()
{
  unint64_t result;

  result = qword_253EC5DB8;
  if (!qword_253EC5DB8)
  {
    result = MEMORY[0x212B9AA54](&unk_20CFD0030, &type metadata for VideoPlayerViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_253EC5DB8);
  }
  return result;
}

uint64_t sub_20CF8BA28()
{
  sub_20CF8B9E4();
  return sub_20CFCC944();
}

uint64_t sub_20CF8BA78()
{
  sub_20CF8B9E4();
  return sub_20CFCC998();
}

void sub_20CF8BACC(char *a1, uint64_t a2)
{
  void **v2;

  sub_20CF8469C(a1, a2, *v2);
}

char *sub_20CF8BAD4(uint64_t a1)
{
  uint64_t v1;

  return sub_20CF84E40(a1, *(void **)v1, *(_QWORD *)(v1 + 8), *(_BYTE *)(v1 + 16));
}

unint64_t sub_20CF8BAE8()
{
  unint64_t result;

  result = qword_253EC5DB0;
  if (!qword_253EC5DB0)
  {
    result = MEMORY[0x212B9AA54](&unk_20CFD130C, &type metadata for BackgroundViewOpacityKey);
    atomic_store(result, (unint64_t *)&qword_253EC5DB0);
  }
  return result;
}

void sub_20CF8BB2C(_QWORD *a1@<X8>)
{
  *a1 = 0x3FF0000000000000;
}

uint64_t dispatch thunk of TipNavigationViewModel.tips.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.playVideo()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 816))();
}

uint64_t sub_20CF8BB60()
{
  return sub_20CF83670();
}

uint64_t sub_20CF8BB74()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_20CF8BB80()
{
  return sub_20CF83988();
}

uint64_t sub_20CF8BB88(void **a1)
{
  return sub_20CF84788(a1);
}

uint64_t dispatch thunk of DocumentAssetViewModel.load()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 744))();
}

void sub_20CF8BB9C(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t (*sub_20CF8BBC8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CF8BC0C()
{
  return sub_20CF834A8();
}

uint64_t (*sub_20CF8BC14())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_20CF8BC8C()
{
  unint64_t v0;
  unint64_t v1;

  sub_20CF8B948();
  if (v0 <= 0x3F)
  {
    sub_20CF828B4();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_20CF8BD28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  sub_20CF84ABC(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

void sub_20CF8BD4C()
{
  unint64_t v0;
  unint64_t v1;

  sub_20CF8B8F0();
  if (v0 <= 0x3F)
  {
    sub_20CF828B4();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_20CF8BDE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char *a9)
{
  sub_20CF8710C(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_20CF8BE0C(uint64_t a1)
{
  uint64_t v1;

  return sub_20CF831B8(a1, v1 + 16);
}

float *sub_20CF8BE14(float *a1)
{
  uint64_t v1;

  return sub_20CF8BE1C(a1, v1 + 16);
}

float *sub_20CF8BE1C(float *result, uint64_t a2)
{
  if (*result > 0.0)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      swift_retain();
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5EF8);
      sub_20CFCCD04();
      swift_release();
      return (float *)swift_release();
    }
  }
  return result;
}

uint64_t sub_20CF8BEAC@<X0>(uint64_t a1@<X8>)
{
  return sub_20CF860EC(a1);
}

uint64_t sub_20CF8BEEC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20CF8BEFC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20CF8BF30()
{
  uint64_t v0;

  return sub_20CF84564(v0 + 16);
}

uint64_t sub_20CF8BF40()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20CF8BF50()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_20CF8BF90(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_20CFA0D08(a1, a2);
  return a1;
}

void sub_20CF8C4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CF8C714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20CF8DB44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  uint64_t v11;

  objc_destroyWeak(location);
  objc_destroyWeak(v10);
  _Block_object_dispose((const void *)(v11 - 160), 8);
  objc_destroyWeak((id *)(v11 - 112));
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

void sub_20CF8ED80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20CF8F9C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20CF909B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_20CF91AE4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_20CF9230C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20CF925DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
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

void static Array.colorsFromGradient(_:)(void *a1)
{
  id v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (!a1)
    return;
  v13 = MEMORY[0x24BEE4AF8];
  v1 = a1;
  v2 = objc_msgSend(v1, sel_stops);
  sub_20CF89BD8();
  v3 = sub_20CFCD190();

  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_4;
LABEL_17:

    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v4 = sub_20CFCD3D0();
  swift_bridgeObjectRelease();
  if (!v4)
    goto LABEL_17;
LABEL_4:
  if (v4 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x212B9A340](i, v3);
      else
        v6 = *(id *)(v3 + 8 * i + 32);
      v7 = v6;
      v8 = objc_msgSend(v6, sel_colorString);
      if (v8)
      {
        v9 = v8;
        sub_20CFCD118();

        _sSo7UIColorC6TipsUIE25colorForSystemColorStringyABSSFZ_0();
        v11 = v10;
        swift_bridgeObjectRelease();
        MEMORY[0x212B99BE4](v11);
        v12 = swift_retain();
        MEMORY[0x212B9A118](v12);
        if (*(_QWORD *)(v13 + 16) >= *(_QWORD *)(v13 + 24) >> 1)
          sub_20CFCD1A8();
        sub_20CFCD1B4();
        sub_20CFCD19C();

        swift_release();
      }
      else
      {

      }
    }

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_20CF92F08(uint64_t a1, uint64_t a2)
{
  return sub_20CF935F0(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_20CF92F28()
{
  return sub_20CFCC560();
}

uint64_t sub_20CF92F30(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v6 = 0;
  v7 = 1;
  result = MEMORY[0x212B9950C](a1, &v6);
  v4 = v7;
  v5 = v6;
  if (v7)
    v5 = 0;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v4;
  return result;
}

uint64_t sub_20CF92F80(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v7;
  char v8;

  v7 = 0;
  v8 = 1;
  v3 = MEMORY[0x212B99518](a1, &v7);
  v4 = v8;
  v5 = v7;
  if (v8)
    v5 = 0;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v4;
  return v3 & 1;
}

void sub_20CF92FD4(double *a1@<X8>)
{
  *a1 = MEMORY[0x212B99524]();
}

uint64_t sub_20CF92FF8(uint64_t a1)
{
  MEMORY[0x212B9AA54](&unk_20CFCEDF0, a1);
  return sub_20CFCC5A8();
}

uint64_t sub_20CF93034()
{
  MEMORY[0x212B9AA54](&unk_20CFCEDF0);
  return sub_20CFCC59C();
}

uint64_t sub_20CF9307C(uint64_t a1, uint64_t a2)
{
  sub_20CFCD4B4();
  MEMORY[0x212B9AA54](&unk_20CFCEDF0, a2);
  sub_20CFCC59C();
  return sub_20CFCD4D8();
}

void sub_20CF930D4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_20CF930E0(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_20CFCD100();
  *a2 = 0;
  return result;
}

uint64_t sub_20CF93154(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_20CFCD10C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_20CF931D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_20CFCD118();
  v2 = sub_20CFCD0F4();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_20CF93218()
{
  sub_20CF82E3C((unint64_t *)&qword_25499DCE8, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_20CFCF0B4);
  sub_20CF82E3C(&qword_25499DCF0, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_20CFCECC4);
  return sub_20CFCD40C();
}

uint64_t sub_20CF9329C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x212B9AA54](&unk_20CFCEDF0, a3);
  return sub_20CFCC590();
}

uint64_t sub_20CF932E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_20CFCD118();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20CF93310()
{
  sub_20CF82E3C(&qword_25499DD28, (uint64_t (*)(uint64_t))type metadata accessor for TextStyle, (uint64_t)&unk_20CFCF3D0);
  sub_20CF82E3C(&qword_25499DD30, (uint64_t (*)(uint64_t))type metadata accessor for TextStyle, (uint64_t)&unk_20CFCF370);
  return sub_20CFCD40C();
}

_QWORD *sub_20CF93394@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

double sub_20CF933A4@<D0>(_QWORD *a1@<X8>)
{
  double *v1;
  double result;

  result = *v1;
  *a1 = *(_QWORD *)v1;
  return result;
}

uint64_t sub_20CF933B0()
{
  sub_20CF82E3C(&qword_25499DCD0, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_20CFCEEE4);
  sub_20CF82E3C(&qword_25499DCD8, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_20CFCEE84);
  sub_20CF93A68();
  return sub_20CFCD40C();
}

uint64_t sub_20CF93450()
{
  sub_20CF82E3C(&qword_25499DCC0, (uint64_t (*)(uint64_t))type metadata accessor for TPSAnimationSource, (uint64_t)&unk_20CFCF02C);
  sub_20CF82E3C(&qword_25499DCC8, (uint64_t (*)(uint64_t))type metadata accessor for TPSAnimationSource, (uint64_t)&unk_20CFCEFD4);
  return sub_20CFCD40C();
}

uint64_t sub_20CF934D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_20CFCD0F4();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_20CF93518()
{
  sub_20CF82E3C(&qword_253EC6B28, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_20CFCF460);
  sub_20CF82E3C(&qword_25499DD38, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_20CFCF25C);
  return sub_20CFCD40C();
}

uint64_t sub_20CF9359C(uint64_t a1, uint64_t a2)
{
  return sub_20CF935F0(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_20CF935A8()
{
  return sub_20CFCD238();
}

uint64_t sub_20CF935B0()
{
  return sub_20CFCD4CC();
}

uint64_t sub_20CF935E0()
{
  return sub_20CFCD4A8();
}

uint64_t sub_20CF935F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_20CFCD118();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_20CF9362C()
{
  sub_20CFCD118();
  sub_20CFCD13C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CF9366C()
{
  uint64_t v0;

  sub_20CFCD118();
  sub_20CFCD4B4();
  sub_20CFCD13C();
  v0 = sub_20CFCD4D8();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_20CF936DC(double *a1, double *a2)
{
  return *a1 == *a2;
}

uint64_t sub_20CF936F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_20CFCD118();
  v2 = v1;
  if (v0 == sub_20CFCD118() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_20CFCD430();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void type metadata accessor for SymbolScale(uint64_t a1)
{
  sub_20CF8265C(a1, &qword_253EC6B20);
}

void type metadata accessor for NSLineBreakMode(uint64_t a1)
{
  sub_20CF8265C(a1, &qword_253EC6B08);
}

void type metadata accessor for NSTextAlignment(uint64_t a1)
{
  sub_20CF8265C(a1, &qword_253EC6B10);
}

void type metadata accessor for TPSAnimationSource(uint64_t a1)
{
  sub_20CF8265C(a1, &qword_25499DC48);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_20CF8265C(a1, &qword_253EC6B68);
}

uint64_t sub_20CF937EC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_20CF9380C(uint64_t result, int a2, int a3)
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
  sub_20CF8265C(a1, &qword_253EC7118);
}

void type metadata accessor for Weight(uint64_t a1)
{
  sub_20CF8265C(a1, &qword_25499DC50);
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_20CF8265C(a1, &qword_25499DC58);
}

void type metadata accessor for AttributeName(uint64_t a1)
{
  sub_20CF8265C(a1, &qword_25499DC60);
}

uint64_t sub_20CF93884()
{
  return sub_20CF82E3C(&qword_25499DC68, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_20CFCEC88);
}

uint64_t sub_20CF938B0()
{
  return sub_20CF82E3C(&qword_25499DC70, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_20CFCEC5C);
}

uint64_t sub_20CF938DC()
{
  return sub_20CF82E3C(&qword_25499DC78, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_20CFCED80);
}

uint64_t sub_20CF93908()
{
  return sub_20CF82E3C(&qword_25499DC80, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_20CFCEDAC);
}

uint64_t sub_20CF93934()
{
  return sub_20CF82E3C(&qword_25499DC88, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_20CFCEE48);
}

uint64_t sub_20CF93960()
{
  return sub_20CF82E3C(&qword_25499DC90, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_20CFCEE1C);
}

uint64_t sub_20CF9398C()
{
  return sub_20CF82E3C(&qword_25499DC98, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_20CFCEEB8);
}

uint64_t sub_20CF939B8()
{
  return sub_20CF82E3C(&qword_25499DCA0, (uint64_t (*)(uint64_t))type metadata accessor for TPSAnimationSource, (uint64_t)&unk_20CFCEF9C);
}

uint64_t sub_20CF939E4()
{
  return sub_20CF82E3C(&qword_25499DCA8, (uint64_t (*)(uint64_t))type metadata accessor for TPSAnimationSource, (uint64_t)&unk_20CFCEF74);
}

uint64_t sub_20CF93A10()
{
  return sub_20CF82E3C(&qword_25499DCB0, (uint64_t (*)(uint64_t))type metadata accessor for TPSAnimationSource, (uint64_t)&unk_20CFCF004);
}

uint64_t sub_20CF93A3C()
{
  return sub_20CF82E3C(&qword_25499DCB8, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_20CFCECF8);
}

unint64_t sub_20CF93A68()
{
  unint64_t result;

  result = qword_25499DCE0;
  if (!qword_25499DCE0)
  {
    result = MEMORY[0x212B9AA54](MEMORY[0x24BEE50D0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_25499DCE0);
  }
  return result;
}

void type metadata accessor for TextStyle(uint64_t a1)
{
  sub_20CF8265C(a1, &qword_253EC6B18);
}

void type metadata accessor for TPSConstellationContentParserPersonalizedTextProviderType(uint64_t a1)
{
  sub_20CF8265C(a1, &qword_25499DCF8);
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_20CF8265C(a1, &qword_253EC6B38);
}

uint64_t sub_20CF93AE8()
{
  return sub_20CF82E3C(&qword_25499DD00, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_20CFCF220);
}

uint64_t sub_20CF93B14()
{
  return sub_20CF82E3C(&qword_25499DD08, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_20CFCF1F4);
}

uint64_t sub_20CF93B40()
{
  return sub_20CF82E3C(&qword_25499DD10, (uint64_t (*)(uint64_t))type metadata accessor for TextStyle, (uint64_t)&unk_20CFCF334);
}

uint64_t sub_20CF93B6C()
{
  return sub_20CF82E3C(&qword_25499DD18, (uint64_t (*)(uint64_t))type metadata accessor for TextStyle, (uint64_t)&unk_20CFCF308);
}

uint64_t sub_20CF93B98()
{
  return sub_20CF82E3C(&qword_25499DD20, (uint64_t (*)(uint64_t))type metadata accessor for TextStyle, (uint64_t)&unk_20CFCF3A4);
}

uint64_t sub_20CF93BC4()
{
  return sub_20CF82E3C(&qword_253EC6B30, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_20CFCF290);
}

uint64_t sub_20CF93C08()
{
  return sub_20CFCCB60();
}

uint64_t sub_20CF93C20@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_20CF82A6C();
  result = sub_20CFCC8CC();
  *a1 = v3;
  return result;
}

uint64_t sub_20CF93C6C()
{
  sub_20CF82A6C();
  return sub_20CFCC8D8();
}

double sub_20CF93CB4@<D0>(double *a1@<X8>)
{
  double result;
  double v3;

  sub_20CF8BAE8();
  sub_20CFCC8CC();
  result = v3;
  *a1 = v3;
  return result;
}

double sub_20CF93D00@<D0>(double *a1@<X8>)
{
  double result;
  double v3;

  sub_20CF8BAE8();
  sub_20CFCC8CC();
  result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_20CF93D4C()
{
  sub_20CF8BAE8();
  return sub_20CFCC8D8();
}

uint64_t sub_20CF93D94()
{
  sub_20CF8BAE8();
  return sub_20CFCC8D8();
}

uint64_t sub_20CF93DDC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;

  v2 = *(_QWORD *)(a1 + 88);
  v3 = *(_QWORD *)(a1 + 96);
  v4 = *(void **)(a1 + 104);
  v5 = *(_QWORD *)(a1 + 112);
  v6 = *(_QWORD *)(a1 + 120);
  v7 = *(_QWORD *)(a1 + 128);
  v8 = *(_QWORD *)(a1 + 136);
  v9 = *(_QWORD *)(a1 + 144);
  v11 = *(_OWORD *)(a1 + 168);
  v12 = *(_OWORD *)(a1 + 152);
  sub_20CF88C5C(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_BYTE *)(a1 + 72));
  sub_20CF88F48(v2, v3, v4, v5, v6, v7, v8, v9, v12, *((uint64_t *)&v12 + 1), v11, *((uint64_t *)&v11 + 1));
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for RemoteVideoView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t assignWithTake for RemoteVideoView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  char v10;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_20CF8257C(v6, v7);
  v8 = *((_BYTE *)a2 + 24);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(_BYTE *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_BYTE *)(a1 + 24) = v8;
  sub_20CF8257C(v9, v10);
  *(_QWORD *)(a1 + 32) = a2[4];
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
  swift_release();
  *(_QWORD *)(a1 + 56) = a2[7];
  swift_release();
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
  swift_release();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 9);
  swift_release();
  *(_BYTE *)(a1 + 88) = *((_BYTE *)a2 + 88);
  return a1;
}

uint64_t sub_20CF93F78()
{
  return sub_20CF8ACA0(&qword_253EC5E88, &qword_253EC5E90, (uint64_t (*)(void))sub_20CF83320);
}

_QWORD *sub_20CF93FC4@<X0>(_QWORD *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *(_BYTE *)(*result + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_didPlayToEndTime);
  return result;
}

uint64_t sub_20CF93FE0(unsigned __int8 *a1)
{
  return sub_20CF998E4(*a1);
}

id static TPSAnalyticsEventContentViewed.analyticsViewMode(forTraitCollection:)(void *a1)
{
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_analyticsViewModeForInterfaceStyle_, objc_msgSend(a1, sel_userInterfaceStyle));
}

id sub_20CF9406C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(a1, sel_analyticsViewModeForInterfaceStyle_, objc_msgSend(v4, sel_userInterfaceStyle));

  return v5;
}

id static TPSAnalyticsEventContentViewed.analyticsViewMode(forInterfaceStyle:)(uint64_t a1)
{
  id *v1;
  id *v2;

  v1 = (id *)MEMORY[0x24BEB7E00];
  v2 = (id *)MEMORY[0x24BEB7DF8];
  if (a1 != 2)
    v2 = (id *)MEMORY[0x24BEB7E08];
  if (a1 != 1)
    v1 = v2;
  return *v1;
}

id sub_20CF940F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *v3;
  id *v4;

  v3 = (id *)MEMORY[0x24BEB7E00];
  v4 = (id *)MEMORY[0x24BEB7DF8];
  if (a3 != 2)
    v4 = (id *)MEMORY[0x24BEB7E08];
  if (a3 != 1)
    v3 = v4;
  return *v3;
}

uint64_t TPSAppSearchQuery.Origin.description.getter(unint64_t a1)
{
  uint64_t result;

  if (a1 < 3)
    return sub_20CFCD118();
  result = sub_20CFCD454();
  __break(1u);
  return result;
}

unint64_t TPSAppSearchQuery.Origin.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

BOOL sub_20CF9418C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_20CF941A0()
{
  sub_20CFCD4B4();
  sub_20CFCD4C0();
  return sub_20CFCD4D8();
}

uint64_t sub_20CF941E4()
{
  return sub_20CFCD4C0();
}

uint64_t sub_20CF9420C()
{
  sub_20CFCD4B4();
  sub_20CFCD4C0();
  return sub_20CFCD4D8();
}

uint64_t *sub_20CF9424C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_20CF94268()
{
  _QWORD *v0;
  uint64_t result;

  if (*v0 < 3uLL)
    return sub_20CFCD118();
  result = sub_20CFCD454();
  __break(1u);
  return result;
}

uint64_t TPSAppSearchQuery.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___TPSAppSearchQuery_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_20CF94420()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = sub_20CFCD04C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v0 + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  v6 = sub_20CFCD034();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v6;
}

uint64_t sub_20CF94564()
{
  swift_beginAccess();
  sub_20CFCD040();
  return swift_endAccess();
}

uint64_t sub_20CF945C8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v4 = sub_20CFCD04C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1 + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = sub_20CFCD034();
  v11 = v10;
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *a2 = v9;
  a2[1] = v11;
  return result;
}

uint64_t sub_20CF94690()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_20CFCD040();
  return swift_endAccess();
}

void (*sub_20CF94700(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x40uLL);
  *a1 = v2;
  swift_beginAccess();
  v2[7] = sub_20CFCD028();
  return sub_20CF94768;
}

void sub_20CF94768(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 56))(*a1, 0);
  swift_endAccess();
  free(v1);
}

uint64_t sub_20CF947E8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___TPSAppSearchQuery_origin;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_20CF94874(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___TPSAppSearchQuery_origin);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_20CF948BC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id TPSAppSearchQuery.__allocating_init(searchTerm:origin:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  id v11;

  v11 = objc_allocWithZone(v5);
  return TPSAppSearchQuery.init(searchTerm:origin:identifier:)(a1, a2, a3, a4, a5);
}

id TPSAppSearchQuery.init(searchTerm:origin:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  objc_class *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v27;

  v25 = a4;
  v26 = a3;
  v7 = sub_20CFCC4DC();
  v23 = *(_QWORD *)(v7 - 8);
  v24 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_20CFCD04C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = &v5[OBJC_IVAR___TPSAppSearchQuery__searchTerm];
  v15 = v5;
  sub_20CFCD01C();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v13, v10);
  v16 = &v15[OBJC_IVAR___TPSAppSearchQuery_origin];
  *(_QWORD *)&v15[OBJC_IVAR___TPSAppSearchQuery_origin] = 0;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  sub_20CFCD01C();
  swift_endAccess();
  swift_beginAccess();
  *(_QWORD *)v16 = v26;
  if (a5)
  {
    v17 = v25;
  }
  else
  {
    sub_20CFCC4D0();
    v17 = sub_20CFCC4C4();
    a5 = v18;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
  }
  v19 = (uint64_t *)&v15[OBJC_IVAR___TPSAppSearchQuery_identifier];
  *v19 = v17;
  v19[1] = a5;

  v20 = (objc_class *)type metadata accessor for TPSAppSearchQuery();
  v27.receiver = v15;
  v27.super_class = v20;
  return objc_msgSendSuper2(&v27, sel_init);
}

uint64_t type metadata accessor for TPSAppSearchQuery()
{
  uint64_t result;

  result = qword_253EC5D68;
  if (!qword_253EC5D68)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20CF94C18()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[187] = v0;
  v2 = sub_20CFCD04C();
  v1[193] = v2;
  v1[199] = *(_QWORD *)(v2 - 8);
  v1[205] = swift_task_alloc();
  v3 = sub_20CFCC4DC();
  v1[211] = v3;
  v1[212] = *(_QWORD *)(v3 - 8);
  v1[213] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20CF94CA0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  char *v18;
  id v19;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t, char *, uint64_t);
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;

  v1 = v0[213];
  v2 = v0[212];
  v3 = v0[211];
  v4 = v0[205];
  v5 = v0[199];
  v6 = v0[193];
  v7 = (char *)v0[187];
  v24 = v3;
  sub_20CFCC4D0();
  sub_20CFCC4C4();
  v23 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v23(v1, v3);
  v8 = &v7[OBJC_IVAR___TPSAppSearchQuery__searchTerm];
  swift_beginAccess();
  v22 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 16);
  v22(v4, v8, v6);
  sub_20CFCD034();
  v21 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v21(v4, v6);
  v9 = (objc_class *)sub_20CFCCE84();
  v10 = objc_allocWithZone(v9);
  v11 = (void *)sub_20CFCCE60();
  v0[214] = v11;
  sub_20CFCC4D0();
  sub_20CFCC4C4();
  v23(v1, v24);
  v22(v4, v8, v6);
  sub_20CFCD034();
  v21(v4, v6);
  v12 = objc_allocWithZone(v9);
  v13 = (void *)sub_20CFCCE60();
  v0[215] = v13;
  v14 = swift_allocObject();
  v0[216] = v14;
  *(_QWORD *)(v14 + 16) = v7;
  *(_QWORD *)(v14 + 24) = v11;
  v15 = v7;
  v16 = v11;
  swift_retain();
  sub_20CFCCF08();
  swift_asyncLet_begin();
  v17 = swift_allocObject();
  v0[217] = v17;
  *(_QWORD *)(v17 + 16) = v15;
  *(_QWORD *)(v17 + 24) = v13;
  v18 = v15;
  v19 = v13;
  swift_retain();
  swift_asyncLet_begin();
  return swift_asyncLet_get_throwing();
}

uint64_t sub_20CF94F44()
{
  uint64_t v0;
  _QWORD *v1;
  void *v3;
  id v4;

  v1[218] = v0;
  if (v0)
    return swift_asyncLet_finish();
  v3 = (void *)v1[175];
  v1[219] = v3;
  v4 = v3;
  return swift_asyncLet_get_throwing();
}

uint64_t sub_20CF94FCC()
{
  uint64_t v0;
  _QWORD *v1;
  void *v3;
  id v4;

  v1[220] = v0;
  if (v0)
    return swift_task_switch();
  v3 = (void *)v1[181];
  v1[221] = v3;
  v4 = v3;
  return swift_asyncLet_finish();
}

uint64_t sub_20CF95050()
{
  return swift_task_switch();
}

uint64_t sub_20CF95064()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_20CF950B8()
{
  return swift_task_switch();
}

uint64_t sub_20CF950CC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 1720);

  swift_release_n();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 1752), *(_QWORD *)(v0 + 1768));
}

uint64_t sub_20CF95154()
{
  return swift_task_switch();
}

uint64_t sub_20CF95168()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_20CF951BC()
{
  return swift_task_switch();
}

uint64_t sub_20CF951D0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 1720);

  swift_release_n();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20CF95250()
{
  uint64_t v0;

  return swift_asyncLet_finish();
}

uint64_t sub_20CF952A4()
{
  return swift_task_switch();
}

uint64_t sub_20CF952B8()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_20CF9530C()
{
  return swift_task_switch();
}

uint64_t sub_20CF95320()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 1720);

  swift_release_n();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20CF953A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;

  *(_QWORD *)(v3 + 16) = a1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v5;
  *v5 = v3;
  v5[1] = sub_20CF953F0;
  return sub_20CF9640C(a3);
}

uint64_t sub_20CF953F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  *(_QWORD *)(v4 + 32) = a1;
  return swift_task_switch();
}

uint64_t sub_20CF9546C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;

  *(_QWORD *)(v3 + 16) = a1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v5;
  *v5 = v3;
  v5[1] = sub_20CF954BC;
  return sub_20CF9640C(a3);
}

uint64_t sub_20CF954BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  *(_QWORD *)(v4 + 32) = a1;
  return swift_task_switch();
}

uint64_t sub_20CF95538()
{
  uint64_t v0;

  **(_QWORD **)(v0 + 16) = *(_QWORD *)(v0 + 32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20CF9566C(const void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_20CF956CC;
  return sub_20CF94C18();
}

uint64_t sub_20CF956CC(void *a1, void *a2)
{
  void *v2;
  uint64_t *v3;
  void *v4;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const void *v10;
  void *v11;

  v4 = v2;
  v7 = *(_QWORD *)(*v3 + 24);
  v8 = *(void **)(*v3 + 16);
  v9 = *v3;
  swift_task_dealloc();

  v10 = *(const void **)(v9 + 24);
  if (v4)
  {
    v11 = (void *)sub_20CFCC41C();

    (*(void (**)(const void *, _QWORD, _QWORD, void *))(v7 + 16))(v10, 0, 0, v11);
    _Block_release(v10);
  }
  else
  {
    (*(void (**)(const void *, void *, void *, _QWORD))(v7 + 16))(v10, a1, a2, 0);
    _Block_release(v10);

  }
  return (*(uint64_t (**)(void))(v9 + 8))();
}

id TPSAppSearchQuery.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void TPSAppSearchQuery.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TPSAppSearchQuery.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPSAppSearchQuery();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_20CF958A0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_20CF96A5C;
  return v6();
}

uint64_t sub_20CF958F4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_20CF96A5C;
  return v7();
}

uint64_t sub_20CF95948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_20CFCD214();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_20CFCD208();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_20CF96338(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_20CFCD1C0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_20CF95A8C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_20CF95AF0;
  return v6(a1);
}

uint64_t sub_20CF95AF0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

id _s6TipsUI17TPSAppSearchQueryC04makeE04with6originACXDSS_AC6OriginOtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_class *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  _QWORD v21[2];
  uint64_t v22;
  objc_super v23;

  v21[1] = a1;
  v22 = a3;
  v3 = sub_20CFCC4DC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20CFCD04C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (objc_class *)type metadata accessor for TPSAppSearchQuery();
  v12 = (char *)objc_allocWithZone(v11);
  v13 = &v12[OBJC_IVAR___TPSAppSearchQuery__searchTerm];
  swift_bridgeObjectRetain();
  v14 = v12;
  sub_20CFCD01C();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v10, v7);
  v15 = &v14[OBJC_IVAR___TPSAppSearchQuery_origin];
  *(_QWORD *)&v14[OBJC_IVAR___TPSAppSearchQuery_origin] = 0;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  sub_20CFCD01C();
  swift_endAccess();
  swift_beginAccess();
  *(_QWORD *)v15 = v22;
  sub_20CFCC4D0();
  v16 = sub_20CFCC4C4();
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v19 = (uint64_t *)&v14[OBJC_IVAR___TPSAppSearchQuery_identifier];
  *v19 = v16;
  v19[1] = v18;

  v23.receiver = v14;
  v23.super_class = v11;
  return objc_msgSendSuper2(&v23, sel_init);
}

uint64_t sub_20CF95D00()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_20CF95D2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(v1 + 24);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20CF96A5C;
  v5[2] = a1;
  v6 = (_QWORD *)swift_task_alloc();
  v5[3] = v6;
  *v6 = v5;
  v6[1] = sub_20CF953F0;
  return sub_20CF9640C(v4);
}

uint64_t sub_20CF95DA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(v1 + 24);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20CF95E24;
  v5[2] = a1;
  v6 = (_QWORD *)swift_task_alloc();
  v5[3] = v6;
  *v6 = v5;
  v6[1] = sub_20CF954BC;
  return sub_20CF9640C(v4);
}

uint64_t sub_20CF95E24()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_20CF95E70()
{
  unint64_t result;

  result = qword_25499DD70;
  if (!qword_25499DD70)
  {
    result = MEMORY[0x212B9AA54](&protocol conformance descriptor for TPSAppSearchQuery.Origin, &type metadata for TPSAppSearchQuery.Origin);
    atomic_store(result, (unint64_t *)&qword_25499DD70);
  }
  return result;
}

uint64_t sub_20CF95EBC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___TPSAppSearchQuery_origin);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_20CF95F0C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___TPSAppSearchQuery_origin);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_20CF95F58()
{
  return type metadata accessor for TPSAppSearchQuery();
}

uint64_t sub_20CF95F60()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20CFCD04C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for TPSAppSearchQuery()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TPSAppSearchQuery.searchTerm.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of TPSAppSearchQuery.searchTerm.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of TPSAppSearchQuery.searchTerm.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of TPSAppSearchQuery.origin.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of TPSAppSearchQuery.origin.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of TPSAppSearchQuery.origin.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of TPSAppSearchQuery.__allocating_init(searchTerm:origin:identifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of TPSAppSearchQuery.execute()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_20CF96108;
  return v5();
}

uint64_t sub_20CF96108(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

ValueMetadata *type metadata accessor for TPSAppSearchQuery.Origin()
{
  return &type metadata for TPSAppSearchQuery.Origin;
}

uint64_t sub_20CF96178()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_20CF961A4()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_20CF95E24;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_25499DD88 + dword_25499DD88))(v2, v3);
}

uint64_t sub_20CF9620C()
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
  v5[1] = sub_20CF96A5C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_25499DD98 + dword_25499DD98))(v2, v3, v4);
}

uint64_t objectdestroy_23Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20CF962B4(uint64_t a1)
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
  v7[1] = sub_20CF96A5C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_25499DDA8 + dword_25499DDA8))(a1, v4, v5, v6);
}

uint64_t sub_20CF96338(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DD80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20CF96378()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20CF9639C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20CF96A5C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25499DDB8 + dword_25499DDB8))(a1, v4);
}

uint64_t sub_20CF9640C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[4] = a1;
  v2 = sub_20CFCD1E4();
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20CF9647C()
{
  _QWORD *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB7D88]), sel_init);
  v0[9] = v1;
  sub_20CFCD22C();
  v2 = v0[4];
  v3 = swift_task_alloc();
  v0[10] = v3;
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  v0[11] = v4;
  sub_20CFCCF08();
  *v4 = v0;
  v4[1] = sub_20CF96698;
  return sub_20CFCD448();
}

uint64_t sub_20CF96698()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20CF96704()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v1 = *(void **)(v0 + 96);
  v2 = *(void **)(v0 + 24);
  sub_20CFCD22C();
  if (v1)
  {
    v3 = v1;

    *(_QWORD *)(v0 + 16) = v1;
    v4 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25499DDD0);
    v5 = swift_dynamicCast();
    v6 = *(void **)(v0 + 72);
    if ((v5 & 1) != 0)
    {
      v8 = *(_QWORD *)(v0 + 56);
      v7 = *(_QWORD *)(v0 + 64);
      v9 = *(_QWORD *)(v0 + 40);
      v10 = *(_QWORD *)(v0 + 48);

      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v8, v7, v9);
      sub_20CFCCE6C();
      v11 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
      objc_msgSend(v6, sel_cancelQueryWithIdentifier_, v11);

      sub_20CF96A0C();
      swift_allocError();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v12, v8, v9);
      swift_willThrow();

      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }
    else
    {

    }
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {

    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void *))(v0 + 8))(v2);
  }
}

uint64_t sub_20CF968B0()
{
  uint64_t v0;
  void *v1;
  id v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  swift_task_dealloc();
  v1 = *(void **)(v0 + 96);
  *(_QWORD *)(v0 + 16) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499DDD0);
  v3 = swift_dynamicCast();
  v4 = *(void **)(v0 + 72);
  if (v3)
  {
    v6 = *(_QWORD *)(v0 + 56);
    v5 = *(_QWORD *)(v0 + 64);
    v7 = *(_QWORD *)(v0 + 40);
    v8 = *(_QWORD *)(v0 + 48);

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v6, v5, v7);
    sub_20CFCCE6C();
    v9 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_cancelQueryWithIdentifier_, v9);

    sub_20CF96A0C();
    swift_allocError();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v10, v6, v7);
    swift_willThrow();

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  else
  {

  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_20CF96A0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25499DDD8;
  if (!qword_25499DDD8)
  {
    v1 = sub_20CFCD1E4();
    result = MEMORY[0x212B9AA54](MEMORY[0x24BEE6848], v1);
    atomic_store(result, (unint64_t *)&qword_25499DDD8);
  }
  return result;
}

void sub_20CF96A54(uint64_t a1)
{
  uint64_t v1;

  sub_20CFA0EC0(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

double static UIFont.defaultHyphenationFactor.getter()
{
  return 0.2;
}

double static UIFont.widgetTitleScaleFactor.getter()
{
  return 0.65;
}

double static UIFont.widgetBodyScaleFactor.getter()
{
  return 0.7;
}

uint64_t static TipsWorkspace.execute(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t result;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void (*v22)(char *, char *, uint64_t);
  int v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v43 - v4;
  v6 = sub_20CFCC47C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v43 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v43 - v14;
  result = (uint64_t)objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (result)
  {
    v46 = (id)result;
    v17 = objc_allocWithZone(MEMORY[0x24BEB7DA8]);
    v18 = (void *)sub_20CFCC440();
    v19 = objc_msgSend(v17, sel_initWithURL_, v18);

    if (v19)
    {
      switch((unint64_t)objc_msgSend(v19, sel_actionType))
      {
        case 1uLL:
          v27 = objc_msgSend(v19, sel_bundleID);
          if (v27)
          {
            v28 = v27;
            v29 = v46;
            objc_msgSend(v46, sel_openApplicationWithBundleID_, v27);

            goto LABEL_10;
          }

          goto LABEL_16;
        case 2uLL:
        case 4uLL:
          v20 = objc_msgSend(v19, sel_URL);
          if (v20)
          {
            v21 = v20;
            sub_20CFCC44C();

            v22 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
            v22(v5, v13, v6);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
            v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
            v24 = v46;
            if (v23 != 1)
            {
              v22(v15, v5, v6);
              v25 = (void *)sub_20CFCC440();
              sub_20CF97020(MEMORY[0x24BEE4AF8]);
              v26 = (void *)sub_20CFCD0B8();
              swift_bridgeObjectRelease();
              objc_msgSend(v24, sel_openSensitiveURL_withOptions_, v25, v26);

              (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v6);
              goto LABEL_26;
            }
          }
          else
          {
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
            v24 = v46;
          }

          v35 = (uint64_t)v5;
          goto LABEL_24;
        case 9uLL:
          v32 = objc_msgSend(v19, sel_bundleID);
          if (v32)
          {
            v33 = v32;
            v44 = sub_20CFCD118();
            v45 = v34;

          }
          else
          {
            v44 = 0;
            v45 = 0;
          }
          v36 = objc_msgSend(v19, sel_identifier);
          if (v36)
          {
            v37 = v36;
            sub_20CFCD118();

          }
          v38 = objc_msgSend((id)objc_opt_self(), sel_mainBundleIdentifier);
          if (v38)
          {
            v39 = v38;
            sub_20CFCD118();

          }
          sub_20CFCD0AC();
          sub_20CFCD088();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v3, 1, v6) == 1)
          {

            v35 = (uint64_t)v3;
LABEL_24:
            sub_20CF97154(v35);
            result = 0;
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v3, v6);
            v40 = (void *)sub_20CFCC440();
            sub_20CF97020(MEMORY[0x24BEE4AF8]);
            v41 = (void *)sub_20CFCD0B8();
            swift_bridgeObjectRelease();
            v42 = v46;
            objc_msgSend(v46, sel_openSensitiveURL_withOptions_, v40, v41);

            (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
LABEL_26:
            result = 1;
          }
          break;
        default:
          v30 = (void *)sub_20CFCC440();
          sub_20CF97020(MEMORY[0x24BEE4AF8]);
          v31 = (void *)sub_20CFCD0B8();
          swift_bridgeObjectRelease();
          v29 = v46;
          objc_msgSend(v46, sel_openURL_withOptions_, v30, v31);

LABEL_10:
          goto LABEL_26;
      }
    }
    else
    {
LABEL_16:

      return 0;
    }
  }
  return result;
}

unint64_t sub_20CF97020(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25499EAF0);
  v2 = sub_20CFCD400();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_20CF865C8(v6, (uint64_t)&v15, &qword_25499DDF8);
    v7 = v15;
    v8 = v16;
    result = sub_20CFA6D2C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_20CF97650(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

uint64_t sub_20CF97154(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_20CF97194(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499DDF0);
  v2 = (_QWORD *)sub_20CFCD400();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    result = sub_20CFA6E10((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
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

unint64_t sub_20CF9729C(uint64_t a1)
{
  return sub_20CF85E08(a1, &qword_25499DDE8);
}

unint64_t sub_20CF972A8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499DDE0);
  v2 = (_QWORD *)sub_20CFCD400();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_20CFA6D2C(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
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

unint64_t sub_20CF973B8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6B80);
  v2 = sub_20CFCD400();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_20CF865C8(v6, (uint64_t)&v13, &qword_253EC6B40);
    v7 = v13;
    result = sub_20CFA6D90(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_20CF97650(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
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

void static TipsWorkspace.openApplication(withBundleID:)()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (v0)
  {
    v1 = v0;
    v2 = (id)sub_20CFCD0F4();
    objc_msgSend(v1, sel_openApplicationWithBundleID_, v2);

  }
}

void static TipsWorkspace.openSensitive(_:)()
{
  id v0;
  void *v1;
  id v2;
  id v3;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (v0)
  {
    v1 = v0;
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC15A0]), sel_init);
    objc_msgSend(v2, sel_setSensitive_, 1);
    v3 = (id)sub_20CFCC440();
    objc_msgSend(v1, sel_openURL_configuration_completionHandler_, v3, v2, 0);

  }
}

ValueMetadata *type metadata accessor for TipsWorkspace()
{
  return &type metadata for TipsWorkspace;
}

_OWORD *sub_20CF97650(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id *sub_20CF97660(id *__dst, id *a2, uint64_t a3)
{
  id *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  int v8;
  unsigned int v10;
  unsigned int v11;
  char *v14;
  uint64_t v15;
  unsigned int v16;
  id v17;
  id v18;
  unsigned int v19;

  v3 = __dst;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  if (v5 > 3)
  {
    v6 = v5 + 1;
    v7 = *(_DWORD *)(v4 + 80);
    v8 = v7 & 0x1000F8;
    goto LABEL_6;
  }
  v11 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  v7 = *(_DWORD *)(v4 + 80);
  if (v11 > 0xFFFD)
  {
    if ((unint64_t)(v5 + 4) > 0x18 || (v7 & 0x1000F8) != 0)
      goto LABEL_27;
    v10 = *(_DWORD *)((char *)a2 + v5);
    if (v10 < 2)
      goto LABEL_33;
    goto LABEL_29;
  }
  v8 = v7 & 0x1000F8;
  if (v11 > 0xFD)
  {
    if ((unint64_t)(v5 + 2) > 0x18 || v8 != 0)
      goto LABEL_27;
    v10 = *(unsigned __int16 *)((char *)a2 + v5);
    if (v10 < 2)
      goto LABEL_33;
LABEL_29:
    if (v5 <= 3)
      v15 = v5;
    else
      v15 = 4;
    __asm { BR              X13 }
  }
  v6 = v5 + 1;
LABEL_6:
  if (v6 > 0x18 || v8 != 0)
  {
LABEL_27:
    v14 = (char *)*a2;
    *v3 = *a2;
    v3 = (id *)&v14[((v7 & 0xF8 | 7u) + 16) & ~(unint64_t)(v7 & 0xF8 | 7u)];
    swift_retain();
    return v3;
  }
  v10 = *((unsigned __int8 *)a2 + v5);
  if (v10 >= 2)
    goto LABEL_29;
LABEL_33:
  if (v10 == 1)
  {
    v17 = *a2;
    v18 = *a2;
    *v3 = v17;
    if (v5 > 3)
      goto LABEL_39;
    v19 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v19 > 0xFFFD)
    {
      *(_DWORD *)((char *)v3 + v5) = 1;
      return v3;
    }
    if (v19 <= 0xFD)
LABEL_39:
      *((_BYTE *)v3 + v5) = 1;
    else
      *(_WORD *)((char *)v3 + v5) = 1;
  }
  else
  {
    (*(void (**)(id *))(v4 + 16))(__dst);
    if (v5 <= 3)
    {
      v16 = ((1 << (8 * v5)) + 1) >> (8 * v5);
      if (v16 > 0xFFFD)
      {
        *(_DWORD *)((char *)v3 + v5) = 0;
        return v3;
      }
      if (v16 > 0xFD)
      {
        *(_WORD *)((char *)v3 + v5) = 0;
        return v3;
      }
    }
    *((_BYTE *)v3 + v5) = 0;
  }
  return v3;
}

char *sub_20CF978DC(char *__dst, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  if (v5 > 3)
    goto LABEL_5;
  v7 = ((1 << (8 * v5)) + 1) >> (8 * v5);
  if (v7 > 0xFFFD)
  {
    v6 = *(_DWORD *)((char *)a2 + v5);
  }
  else
  {
    if (v7 <= 0xFD)
    {
LABEL_5:
      v6 = *((unsigned __int8 *)a2 + v5);
      goto LABEL_10;
    }
    v6 = *(unsigned __int16 *)((char *)a2 + v5);
  }
LABEL_10:
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v8 = v5;
    else
      v8 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    *(_QWORD *)__dst = *a2;
    if (v5 > 3)
      goto LABEL_21;
    v10 = ((1 << (8 * v5)) + 1) >> (8 * v5);
    if (v10 > 0xFFFD)
    {
      *(_DWORD *)&__dst[v5] = 1;
      return __dst;
    }
    if (v10 <= 0xFD)
LABEL_21:
      __dst[v5] = 1;
    else
      *(_WORD *)&__dst[v5] = 1;
  }
  else
  {
    (*(void (**)(char *))(v4 + 32))(__dst);
    if (v5 <= 3)
    {
      v9 = ((1 << (8 * v5)) + 1) >> (8 * v5);
      if (v9 > 0xFFFD)
      {
        *(_DWORD *)&__dst[v5] = 0;
        return __dst;
      }
      if (v9 > 0xFD)
      {
        *(_WORD *)&__dst[v5] = 0;
        return __dst;
      }
    }
    __dst[v5] = 0;
  }
  return __dst;
}

id *sub_20CF97AC0(id *__dst, id *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;

  if (__dst == __src)
    return __dst;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if (*(_QWORD *)(v6 + 64) <= 8uLL)
    v7 = 8;
  else
    v7 = *(_QWORD *)(v6 + 64);
  if (v7 > 3)
    goto LABEL_6;
  v9 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v9 > 0xFFFD)
  {
    v8 = *(_DWORD *)((char *)__dst + v7);
  }
  else
  {
    if (v9 <= 0xFD)
    {
LABEL_6:
      v8 = *((unsigned __int8 *)__dst + v7);
      goto LABEL_11;
    }
    v8 = *(unsigned __int16 *)((char *)__dst + v7);
  }
LABEL_11:
  if (v8 >= 2)
  {
    if (v7 <= 3)
      v10 = v7;
    else
      v10 = 4;
    __asm { BR              X12 }
  }
  if (v8 == 1)
  {

    if (v7 > 3)
      goto LABEL_22;
  }
  else
  {
    (*(void (**)(id *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
    if (v7 > 3)
      goto LABEL_22;
  }
  v11 = ((1 << (8 * v7)) + 1) >> (8 * v7);
  if (v11 <= 0xFFFD)
  {
    if (v11 > 0xFD)
    {
      v12 = *(unsigned __int16 *)((char *)__src + v7);
      if (v12 < 2)
        goto LABEL_31;
      goto LABEL_27;
    }
LABEL_22:
    v12 = *((unsigned __int8 *)__src + v7);
    if (v12 < 2)
      goto LABEL_31;
LABEL_27:
    if (v7 <= 3)
      v13 = v7;
    else
      v13 = 4;
    __asm { BR              X12 }
  }
  v12 = *(_DWORD *)((char *)__src + v7);
  if (v12 >= 2)
    goto LABEL_27;
LABEL_31:
  if (v12 == 1)
  {
    *__dst = *__src;
    if (v7 > 3)
      goto LABEL_37;
    v15 = ((1 << (8 * v7)) + 1) >> (8 * v7);
    if (v15 > 0xFFFD)
    {
      *(_DWORD *)((char *)__dst + v7) = 1;
      return __dst;
    }
    if (v15 <= 0xFD)
LABEL_37:
      *((_BYTE *)__dst + v7) = 1;
    else
      *(_WORD *)((char *)__dst + v7) = 1;
  }
  else
  {
    (*(void (**)(id *, id *, uint64_t))(v6 + 32))(__dst, __src, v5);
    if (v7 <= 3)
    {
      v14 = ((1 << (8 * v7)) + 1) >> (8 * v7);
      if (v14 > 0xFFFD)
      {
        *(_DWORD *)((char *)__dst + v7) = 0;
        return __dst;
      }
      if (v14 > 0xFD)
      {
        *(_WORD *)((char *)__dst + v7) = 0;
        return __dst;
      }
    }
    *((_BYTE *)__dst + v7) = 0;
  }
  return __dst;
}

uint64_t sub_20CF97DBC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3;
  int v4;
  unsigned int v5;
  char v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  int v12;
  unsigned int v13;
  int v14;
  int v16;
  unsigned int v17;
  unsigned int v18;
  char v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  unsigned int v24;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (v3 <= 8)
    v3 = 8;
  if (v3 > 3)
  {
    v4 = 3;
LABEL_7:
    v6 = 8;
    goto LABEL_8;
  }
  v5 = ((1 << (8 * v3)) + 1) >> (8 * v3);
  if (v5 > 0xFFFD)
    goto LABEL_11;
  v4 = v5 + 2;
  if (v5 <= 0xFD)
    goto LABEL_7;
  v6 = 16;
LABEL_8:
  v7 = (1 << v6) - v4;
  if ((v7 & 0x80000000) == 0)
  {
    if (v3 > 3)
      goto LABEL_15;
LABEL_12:
    v8 = ((1 << (8 * v3)) + 1) >> (8 * v3);
    v9 = 2;
    if (v8 > 0xFFFD)
      v9 = 4;
    if (v8 > 0xFD)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_11:
  v7 = 0x7FFFFFFF;
  if (v3 <= 3)
    goto LABEL_12;
LABEL_15:
  v9 = 1;
LABEL_16:
  if (!a2)
    return 0;
  if (a2 <= v7)
    goto LABEL_34;
  v10 = v9 + v3;
  v11 = 8 * v10;
  if (v10 <= 3)
  {
    v13 = ((a2 - v7 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v13))
    {
      v12 = *(_DWORD *)(a1 + v10);
      if (!v12)
        goto LABEL_34;
      goto LABEL_27;
    }
    if (v13 > 0xFF)
    {
      v12 = *(unsigned __int16 *)(a1 + v10);
      if (!*(_WORD *)(a1 + v10))
        goto LABEL_34;
      goto LABEL_27;
    }
    if (v13 < 2)
    {
LABEL_34:
      if (v7)
      {
        if (v3 <= 3)
        {
          v21 = ((1 << (8 * v3)) + 1) >> (8 * v3);
          if (v21 > 0xFFFD)
          {
            v17 = *(_DWORD *)(a1 + v3);
            v18 = ~v17;
LABEL_44:
            v24 = 0x7FFFFFFF;
LABEL_45:
            if (v24 > v18)
              return -v17;
            else
              return 0;
          }
          v20 = v21 + 2;
          if (v21 > 0xFD)
          {
            v23 = *(unsigned __int16 *)(a1 + v3);
            v17 = v23 | 0xFFFF0000;
            v18 = v23 ^ 0xFFFF;
            v19 = 16;
          }
          else
          {
            v22 = *(unsigned __int8 *)(a1 + v3);
            v17 = v22 | 0xFFFFFF00;
            v18 = v22 ^ 0xFF;
            v19 = 8;
          }
        }
        else
        {
          v16 = *(unsigned __int8 *)(a1 + v3);
          v17 = v16 | 0xFFFFFF00;
          v18 = v16 ^ 0xFF;
          v19 = 8;
          v20 = 3;
        }
        v24 = (1 << v19) - v20;
        if ((v24 & 0x80000000) == 0)
          goto LABEL_45;
        goto LABEL_44;
      }
      return 0;
    }
  }
  v12 = *(unsigned __int8 *)(a1 + v10);
  if (!*(_BYTE *)(a1 + v10))
    goto LABEL_34;
LABEL_27:
  v14 = (v12 - 1) << v11;
  if (v10 > 3)
    v14 = 0;
  if (!(_DWORD)v10)
    return v7 + v14 + 1;
  if (v10 > 3)
    LODWORD(v10) = 4;
  return ((uint64_t (*)(void))((char *)&loc_20CF97F18 + 4 * byte_20CFCF848[(v10 - 1)]))();
}

void sub_20CF97FFC(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  char v6;
  int v7;
  char v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  size_t v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  int v17;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 8)
    v5 = 8;
  v6 = 8 * v5;
  if (v5 <= 3)
  {
    v10 = ((1 << v6) + 1) >> v6;
    if (v10 > 0xFFFD)
      goto LABEL_12;
    v7 = v10 + 2;
    if (v10 > 0xFD)
    {
      v8 = 16;
LABEL_6:
      v9 = (1 << v8) - v7;
      if ((v9 & 0x80000000) == 0)
      {
        if (v5 > 3)
          goto LABEL_16;
LABEL_13:
        v11 = ((1 << v6) + 1) >> v6;
        v12 = 2;
        if (v11 > 0xFFFD)
          v12 = 4;
        if (v11 > 0xFD)
        {
LABEL_17:
          v13 = v12 + v5;
          if (a3 <= v9)
          {
            v14 = 0;
          }
          else if (v13 <= 3)
          {
            v16 = ((a3 - v9 + ~(-1 << (8 * v13))) >> (8 * v13)) + 1;
            if (HIWORD(v16))
            {
              v14 = 4u;
            }
            else if (v16 >= 0x100)
            {
              v14 = 2;
            }
            else
            {
              v14 = v16 > 1;
            }
          }
          else
          {
            v14 = 1u;
          }
          if (v9 < a2)
          {
            v15 = ~v9 + a2;
            if (v13 < 4)
            {
              if ((_DWORD)v13)
              {
                v17 = v15 & ~(-1 << (8 * v13));
                bzero(a1, v13);
                if ((_DWORD)v13 == 3)
                {
                  *a1 = v17;
                  *((_BYTE *)a1 + 2) = BYTE2(v17);
                }
                else if ((_DWORD)v13 == 2)
                {
                  *a1 = v17;
                }
                else
                {
                  *(_BYTE *)a1 = v17;
                }
              }
            }
            else
            {
              bzero(a1, v13);
              *(_DWORD *)a1 = v15;
            }
            __asm { BR              X10 }
          }
          __asm { BR              X12 }
        }
LABEL_16:
        v12 = 1;
        goto LABEL_17;
      }
LABEL_12:
      v9 = 0x7FFFFFFF;
      if (v5 > 3)
        goto LABEL_16;
      goto LABEL_13;
    }
  }
  else
  {
    v7 = 3;
  }
  v8 = 8;
  goto LABEL_6;
}

uint64_t sub_20CF9827C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = 8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) > 8uLL)
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (v2 > 3)
    goto LABEL_4;
  v4 = ((1 << (8 * v2)) + 1) >> (8 * v2);
  if (v4 > 0xFFFD)
  {
    v3 = *(unsigned int *)(a1 + v2);
  }
  else
  {
    if (v4 <= 0xFD)
    {
LABEL_4:
      v3 = *(unsigned __int8 *)(a1 + v2);
      goto LABEL_9;
    }
    v3 = *(unsigned __int16 *)(a1 + v2);
  }
LABEL_9:
  if (v3 < 2)
    return v3;
  if (v2 <= 3)
    v5 = v2;
  else
    v5 = 4;
  return ((uint64_t (*)(void))((char *)&loc_20CF98304 + 4 * byte_20CFCF856[v5]))();
}

_BYTE *sub_20CF98350(_BYTE *result, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  int v9;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 8uLL)
    v4 = 8;
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 > 1)
  {
    if (v4 < 4)
    {
      v6 = ((a2 - 2) >> (8 * v4)) + 2;
      v7 = (unsigned int *)&result[v4];
      v8 = ((1 << (8 * v4)) + 1) >> (8 * v4);
      if (v8 > 0xFFFD)
      {
        *v7 = v6;
      }
      else if (v8 > 0xFD)
      {
        *(_WORD *)v7 = v6;
      }
      else
      {
        *(_BYTE *)v7 = v6;
      }
    }
    else
    {
      result[v4] = 2;
    }
    if (v4 <= 3)
      v9 = v4;
    else
      v9 = 4;
    bzero(result, v4);
    __asm { BR              X10 }
  }
  if (v4 > 3)
    goto LABEL_6;
  v5 = ((1 << (8 * v4)) + 1) >> (8 * v4);
  if (v5 > 0xFFFD)
  {
    *(_DWORD *)&result[v4] = a2;
  }
  else
  {
    if (v5 <= 0xFD)
    {
LABEL_6:
      result[v4] = a2;
      return result;
    }
    *(_WORD *)&result[v4] = a2;
  }
  return result;
}

BOOL sub_20CF984A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_20CF984B8()
{
  sub_20CFCD4B4();
  sub_20CFCD4C0();
  return sub_20CFCD4D8();
}

uint64_t sub_20CF984FC()
{
  return sub_20CFCD4C0();
}

uint64_t sub_20CF98524()
{
  sub_20CFCD4B4();
  sub_20CFCD4C0();
  return sub_20CFCD4D8();
}

uint64_t sub_20CF98574()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD00000000000001BLL;
  if (*v0 != 1)
    v1 = 0xD000000000000025;
  if (*v0)
    return v1;
  else
    return 0x6620776F6E6B6E55;
}

uint64_t getEnumTagSinglePayload for ContentLoadError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ContentLoadError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20CF986BC + 4 * byte_20CFCF864[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_20CF986F0 + 4 * byte_20CFCF85F[v4]))();
}

uint64_t sub_20CF986F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CF986F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20CF98700);
  return result;
}

uint64_t sub_20CF9870C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20CF98714);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_20CF98718(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CF98720(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CF9872C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_20CF98734(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ContentLoadError()
{
  return &type metadata for ContentLoadError;
}

unint64_t sub_20CF98750()
{
  unint64_t result;

  result = qword_25499DE00;
  if (!qword_25499DE00)
  {
    result = MEMORY[0x212B9AA54](&unk_20CFCF934, &type metadata for ContentLoadError);
    atomic_store(result, (unint64_t *)&qword_25499DE00);
  }
  return result;
}

id sub_20CF98798(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  id v19;
  uint64_t v21;
  id v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;

  v8 = sub_20CFCD118();
  if (!*(_QWORD *)(a1 + 16) || (v10 = sub_20CFA6D2C(v8, v9), (v11 & 1) == 0))
  {
    v30 = 0u;
    v31 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_20CF98B2C(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)&v30);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v31 + 1))
  {
LABEL_11:
    sub_20CF98AEC((uint64_t)&v30);
    return 0;
  }
  if ((swift_dynamicCast() & 1) != 0)
  {
    v12 = (void *)objc_opt_self();
    v13 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v12, sel__systemImageNamed_, v13);

    if (v14)
    {
      if ((a4 & 1) != 0)
      {
        v15 = sub_20CFCD118();
        if (*(_QWORD *)(a1 + 16) && (v17 = sub_20CFA6D2C(v15, v16), (v18 & 1) != 0))
        {
          sub_20CF98B2C(*(_QWORD *)(a1 + 56) + 32 * v17, (uint64_t)&v30);
        }
        else
        {
          v30 = 0u;
          v31 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((_QWORD *)&v31 + 1))
        {
          if ((swift_dynamicCast() & 1) != 0)
          {
            if (sub_20CFCD118() == v28 && v21 == v29)
            {
              swift_bridgeObjectRelease_n();
              a3 = 1;
            }
            else
            {
              v23 = sub_20CFCD430();
              swift_bridgeObjectRelease();
              if ((v23 & 1) != 0)
              {
                swift_bridgeObjectRelease();
                a3 = 1;
              }
              else if (sub_20CFCD118() == v28 && v24 == v29)
              {
                swift_bridgeObjectRelease_n();
                a3 = 3;
              }
              else
              {
                v25 = sub_20CFCD430();
                swift_bridgeObjectRelease();
                if ((v25 & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  a3 = 3;
                }
                else if (sub_20CFCD118() == v28 && v26 == v29)
                {
                  swift_bridgeObjectRelease_n();
                  a3 = -1;
                }
                else
                {
                  v27 = sub_20CFCD430();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  a3 = v27 << 63 >> 63;
                }
              }
            }
            goto LABEL_22;
          }
        }
        else
        {
          sub_20CF98AEC((uint64_t)&v30);
        }
        a3 = 2;
      }
LABEL_22:
      v22 = objc_msgSend((id)objc_opt_self(), sel_configurationWithTextStyle_scale_, a2, a3);
      v19 = objc_msgSend(v14, sel_imageByApplyingSymbolConfiguration_, v22);

      return v19;
    }
  }
  return 0;
}

uint64_t sub_20CF98AEC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6988);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20CF98B2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_20CF98B68()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20CF98BDC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_20CF98C58(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  v2 = v1;
  swift_retain();
  return sub_20CFCC674();
}

uint64_t sub_20CF98CCC()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20CF98D44()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_20CFCC674();
}

uint64_t (*sub_20CF98DB0(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20CFCC65C();
  return sub_20CF98E28;
}

uint64_t sub_20CF98E2C(uint64_t a1)
{
  return sub_20CF9961C(a1, &qword_25499DE08, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__player, &qword_253EC68D0);
}

uint64_t (*sub_20CF98E48(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE08);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__player;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68D0);
  sub_20CFCC644();
  swift_endAccess();
  return sub_20CF98F10;
}

uint64_t sub_20CF98F14@<X0>(_BYTE *a1@<X8>)
{
  return sub_20CF85298(a1);
}

uint64_t sub_20CF98F28()
{
  return sub_20CF83670();
}

uint64_t sub_20CF98F3C()
{
  return sub_20CF992B8();
}

uint64_t sub_20CF98F58()
{
  return sub_20CF9933C();
}

uint64_t (*sub_20CF98F6C(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20CFCC65C();
  return sub_20CF98E28;
}

uint64_t sub_20CF98FE4()
{
  return sub_20CF83BB4((uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isAssetLoaded, &qword_253EC68B0);
}

uint64_t sub_20CF98FF8(uint64_t a1)
{
  return sub_20CF9961C(a1, &qword_25499DE10, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isAssetLoaded, &qword_253EC68B0);
}

uint64_t (*sub_20CF99014(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE10);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isAssetLoaded;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68B0);
  sub_20CFCC644();
  swift_endAccess();
  return sub_20CF98F10;
}

uint64_t sub_20CF990DC()
{
  return sub_20CF992B8();
}

uint64_t sub_20CF990F8()
{
  return sub_20CF9933C();
}

uint64_t (*sub_20CF9910C(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20CFCC65C();
  return sub_20CF98E28;
}

uint64_t sub_20CF99184()
{
  return sub_20CF83BB4((uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isPlaying, &qword_253EC68B0);
}

uint64_t sub_20CF99198(uint64_t a1)
{
  return sub_20CF9961C(a1, &qword_25499DE10, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isPlaying, &qword_253EC68B0);
}

uint64_t (*sub_20CF991B4(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE10);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isPlaying;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68B0);
  sub_20CFCC644();
  swift_endAccess();
  return sub_20CF98F10;
}

uint64_t sub_20CF9927C@<X0>(_BYTE *a1@<X8>)
{
  return sub_20CF85298(a1);
}

uint64_t sub_20CF99290()
{
  return sub_20CF83670();
}

uint64_t sub_20CF992A4()
{
  return sub_20CF992B8();
}

uint64_t sub_20CF992B8()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20CF99328()
{
  return sub_20CF9933C();
}

uint64_t sub_20CF9933C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_20CFCC674();
}

uint64_t (*sub_20CF993A4(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20CFCC65C();
  return sub_20CF98E28;
}

void sub_20CF9941C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_20CF99468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_20CFCC644();
  return swift_endAccess();
}

uint64_t sub_20CF994D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v18 - v14;
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_20CFCC650();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_20CF995EC()
{
  return sub_20CF83BB4((uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isVideoLoaded, &qword_253EC68B0);
}

uint64_t sub_20CF99600(uint64_t a1)
{
  return sub_20CF9961C(a1, &qword_25499DE10, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isVideoLoaded, &qword_253EC68B0);
}

uint64_t sub_20CF9961C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
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
  sub_20CFCC650();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_20CF996F4(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE10);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isVideoLoaded;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68B0);
  sub_20CFCC644();
  swift_endAccess();
  return sub_20CF98F10;
}

void sub_20CF997BC(uint64_t a1, char a2)
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
    sub_20CFCC650();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_20CFCC650();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

uint64_t sub_20CF998D4()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_didPlayToEndTime);
}

uint64_t sub_20CF998E4(uint64_t result)
{
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;

  v2 = result;
  v3 = result & 1;
  v4 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_didPlayToEndTime;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_didPlayToEndTime) != (result & 1))
  {
    type metadata accessor for DocumentAssetViewModel();
    sub_20CF8B1A8();
    sub_20CFCC5F0();
    sub_20CFCC620();
    result = swift_release();
  }
  *(_BYTE *)(v1 + v4) = v3;
  if ((v2 & 1) != 0)
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6858);
    sub_20CF88608((unint64_t *)&qword_25499EA70, &qword_253EC6858, MEMORY[0x24BDB9CA8]);
    sub_20CFCC62C();
    return swift_release();
  }
  return result;
}

uint64_t DocumentAssetViewModel.__allocating_init(document:assetsInfo:contentModel:)(void *a1, void *a2, char *a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  DocumentAssetViewModel.init(document:assetsInfo:contentModel:)(a1, a2, a3);
  return v6;
}

uint64_t DocumentAssetViewModel.init(document:assetsInfo:contentModel:)(void *a1, void *a2, char *a3)
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(uint64_t, char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  unsigned int v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v68[2];
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  char v92;

  v4 = v3;
  v77 = a3;
  v90 = a2;
  v69 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6878);
  v85 = *(_QWORD *)(v5 - 8);
  v86 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v84 = (char *)v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6848);
  v88 = *(_QWORD *)(v7 - 8);
  v89 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v87 = (char *)v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6838);
  v82 = *(_QWORD *)(v9 - 8);
  v83 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v81 = (char *)v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6868);
  v72 = *(_QWORD *)(v78 - 8);
  v11 = MEMORY[0x24BDAC7A8](v78);
  v73 = (char *)v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v74 = (char *)v68 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v76 = (char *)v68 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  MEMORY[0x24BDAC7A8](v16);
  v68[0] = (char *)v68 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68B0);
  v80 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v68 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68D0);
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)v68 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6880);
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)v68 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__imageState;
  v91 = 0;
  v92 = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6118);
  sub_20CFCC638();
  v30 = *(void (**)(uint64_t, char *, uint64_t))(v26 + 32);
  v70 = v29;
  v71 = v25;
  v30(v29, v28, v25);
  v31 = v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__player;
  v91 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6978);
  sub_20CFCC638();
  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v31, v24, v21);
  v32 = v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isAssetLoaded;
  LOBYTE(v91) = 0;
  sub_20CFCC638();
  v33 = *(void (**)(uint64_t, char *, uint64_t))(v80 + 32);
  v33(v32, v20, v18);
  v34 = v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isPlaying;
  LOBYTE(v91) = 0;
  sub_20CFCC638();
  v33(v34, v20, v18);
  v35 = v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isVideoLoaded;
  LOBYTE(v91) = 0;
  sub_20CFCC638();
  v33(v35, v20, v18);
  v36 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_playerDidFinishSubject;
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6858);
  swift_allocObject();
  *(_QWORD *)(v4 + v36) = sub_20CFCC5FC();
  v80 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_networkIsReachableCancellable;
  *(_QWORD *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_networkIsReachableCancellable) = 0;
  *(_QWORD *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoLoaderCancellable) = 0;
  v75 = v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_cancellables;
  *(_QWORD *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_cancellables) = MEMORY[0x24BEE4B08];
  *(_BYTE *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) = 0;
  *(_QWORD *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_prefetchTimer) = 0;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_didPlayToEndTime) = 0;
  v37 = v69;
  *(_QWORD *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_document) = v69;
  v38 = v77;
  *(_QWORD *)(v4 + 16) = v77;
  v39 = v37;
  v77 = v38;
  v40 = sub_20CFCCF2C();
  v42 = v41;
  v43 = v68[0];
  sub_20CFCCF44();
  type metadata accessor for RemoteFileLoader();
  swift_allocObject();
  v44 = sub_20CF841F4(v40, v42, v43);
  v68[1] = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoFileLoader;
  *(_QWORD *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoFileLoader) = v44;
  v45 = sub_20CFCCF14();
  v47 = v46;
  sub_20CFCCF38();
  type metadata accessor for RemoteImageLoader();
  swift_allocObject();
  *(_QWORD *)(v4 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_imageLoader) = sub_20CF837C8(v45, v47, v43);
  v48 = (void *)objc_opt_self();
  if (objc_msgSend(v48, sel_isVisionUI))
  {
    v49 = objc_msgSend(v39, sel_identifier);
    if (!v49)
    {
      sub_20CFCD118();
      v49 = (id)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
    }
    v50 = objc_msgSend(v48, sel_isSavedTipsCollectionIdentifier_, v49);

    if (v50)
      sub_20CF9B0DC();
  }
  swift_beginAccess();
  swift_retain();
  v51 = v76;
  sub_20CFCC644();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  v52 = v74;
  sub_20CFCC644();
  swift_endAccess();
  sub_20CF88608(&qword_253EC6860, &qword_253EC6868, MEMORY[0x24BDB9EE8]);
  v69 = v39;
  v53 = v78;
  sub_20CFCC6EC();
  v54 = v72;
  v55 = *(void (**)(char *, uint64_t))(v72 + 8);
  v55(v51, v53);
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v73, v52, v53);
  swift_beginAccess();
  sub_20CFCC650();
  swift_endAccess();
  v55(v52, v53);
  swift_beginAccess();
  swift_retain();
  sub_20CFCC644();
  swift_endAccess();
  swift_release();
  swift_allocObject();
  swift_weakInit();
  v56 = v81;
  sub_20CFCC698();
  swift_release();
  v55(v51, v53);
  swift_allocObject();
  swift_weakInit();
  v57 = MEMORY[0x24BDB94C8];
  sub_20CF88608(&qword_253EC6830, &qword_253EC6838, MEMORY[0x24BDB94C8]);
  v58 = v83;
  sub_20CFCC6E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v56, v58);
  swift_beginAccess();
  sub_20CFCC5E4();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6890);
  v59 = v84;
  sub_20CFCC644();
  swift_endAccess();
  swift_release();
  sub_20CF88608(&qword_253EC6870, &qword_253EC6878, MEMORY[0x24BDB9EE8]);
  v61 = v86;
  v60 = v87;
  sub_20CFCC698();
  (*(void (**)(char *, uint64_t))(v85 + 8))(v59, v61);
  swift_allocObject();
  swift_weakInit();
  sub_20CF88608(&qword_253EC6840, &qword_253EC6848, v57);
  v62 = v89;
  sub_20CFCC6E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v88 + 8))(v60, v62);
  swift_beginAccess();
  sub_20CFCC5E4();
  swift_endAccess();
  swift_release();
  v63 = v77;
  v91 = *(_QWORD *)&v77[OBJC_IVAR____TtC6TipsUI16TipsContentModel_networkDidChangeToReachable];
  v64 = swift_allocObject();
  swift_weakInit();
  v65 = swift_allocObject();
  *(_QWORD *)(v65 + 16) = sub_20CF9BAE8;
  *(_QWORD *)(v65 + 24) = v64;
  sub_20CF88608(&qword_253EC6850, &qword_253EC6858, MEMORY[0x24BDB9CB0]);
  swift_retain();
  v66 = sub_20CFCC6E0();
  swift_release();

  swift_release();
  *(_QWORD *)(v4 + v80) = v66;
  swift_release();
  return v4;
}

uint64_t sub_20CF9A4A0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  char v8;
  int EnumCaseMultiPayload;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6120);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned __int8 *)(a1 + 8) < 2u)
    goto LABEL_2;
  if (*(_QWORD *)a1)
    goto LABEL_4;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
    goto LABEL_4;
  swift_retain();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  swift_release();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  result = sub_20CF8658C((uint64_t)v7, &qword_253EC6120);
  if (EnumCaseMultiPayload)
LABEL_4:
    v8 = 0;
  else
LABEL_2:
    v8 = 1;
  *a2 = v8;
  return result;
}

uint64_t sub_20CF9A5F4@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6120);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CF87F14(a1, (uint64_t)v6);
  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
  {
    *a2 = 1;
  }
  else
  {
    if ((_DWORD)result)
      *a2 = 0;
    else
      *a2 = 1;
    return sub_20CF8658C((uint64_t)v6, &qword_253EC6120);
  }
  return result;
}

uint64_t sub_20CF9A6AC()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    return sub_20CFCC674();
  }
  return result;
}

uint64_t sub_20CF9A734()
{
  uint64_t Strong;
  uint64_t result;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(_BYTE *)(Strong + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) = 0;
    swift_release();
  }
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_20CF881AC();
    return swift_release();
  }
  return result;
}

uint64_t DocumentAssetViewModel.deinit()
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

  v1 = v0;
  swift_retain();
  sub_20CF85310();
  swift_release();
  swift_retain();
  sub_20CF84F98();
  swift_release();
  *(_BYTE *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) = 0;

  v2 = v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__imageState;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6880);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  v4 = v1 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__player;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = v1 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isAssetLoaded;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68B0);
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(v1 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isPlaying, v7);
  v8(v1 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isVideoLoaded, v7);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return v1;
}

uint64_t DocumentAssetViewModel.__deallocating_deinit()
{
  DocumentAssetViewModel.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_20CF9A980()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F40);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE18);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20CFCD328();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE20);
  v12 = *(_QWORD *)(v11 - 8);
  v19 = v11;
  v20 = v12;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = *(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_playerDidFinishSubject);
  swift_retain();
  sub_20CFCD31C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  v21 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
  v15 = sub_20CFCD304();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v3, 1, 1, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6858);
  sub_20CF82934(0, &qword_253EC5F50);
  sub_20CF88608(&qword_253EC6850, &qword_253EC6858, MEMORY[0x24BDB9CB0]);
  sub_20CF9BB34();
  sub_20CFCC6C8();
  sub_20CF8658C((uint64_t)v3, &qword_253EC5F40);

  sub_20CF8658C((uint64_t)v6, &qword_25499DE18);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release();
  sub_20CF88608(&qword_25499DE28, &qword_25499DE20, MEMORY[0x24BDB9758]);
  v16 = v19;
  v17 = sub_20CFCC68C();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v14, v16);
  return v17;
}

void sub_20CF9AC38()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  char v5;

  if (*(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_imageLoader)
                 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_identifier
                 + 8))
  {
    v1 = (void *)objc_opt_self();
    swift_retain();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    v3 = objc_msgSend(v1, sel_dataCacheForIdentifier_, v2);

    if (v3)
    {

      swift_getKeyPath();
      swift_getKeyPath();
      sub_20CFCC668();
      swift_release();
      swift_release();
      if (v5)
      {
        sub_20CF8AC84(v4, v5);
      }
      else
      {
        sub_20CF8AC84(v4, 0);
        sub_20CF85428();
      }
    }
    swift_release();
  }
}

id sub_20CF9AD6C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_document), sel_assetFileInfoManager);
}

void sub_20CF9AD98(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[4];
  int v28;
  uint64_t v29;

  v3 = v2;
  v28 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v27[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6120);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = &v27[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v27[-v11];
  v13 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoFileLoader;
  v14 = (uint64_t *)(*(_QWORD *)(v2 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoFileLoader)
                  + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_identifier);
  v16 = *v14;
  v15 = v14[1];
  swift_bridgeObjectRetain();
  v17 = sub_20CFCCF2C();
  if (!v15)
  {
    if (!v18)
      goto LABEL_13;
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if (!v18)
    goto LABEL_10;
  if (v16 != v17 || v15 != v18)
  {
    v20 = sub_20CFCD430();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v20 & 1) != 0)
      goto LABEL_13;
LABEL_11:
    swift_retain();
    sub_20CF84F98();
    swift_storeEnumTagMultiPayload();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_20CF87F14((uint64_t)v12, (uint64_t)v10);
    swift_retain();
    sub_20CFCC674();
    sub_20CF8658C((uint64_t)v12, &qword_253EC6120);
    swift_release();
    v21 = *(_QWORD *)(v2 + v13);
    swift_retain();
    v22 = sub_20CFCCF2C();
    v23 = (uint64_t *)(v21 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_identifier);
    *v23 = v22;
    v23[1] = v24;
    swift_release();
    swift_bridgeObjectRelease();
    v25 = *(_QWORD *)(v2 + v13);
    swift_retain();
    sub_20CFCCF44();
    v26 = v25 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_url;
    swift_beginAccess();
    sub_20CF8286C((uint64_t)v6, v26);
    swift_endAccess();
    swift_release();
    sub_20CF9B374();
    *(_BYTE *)(v3 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) = 0;
    swift_getKeyPath();
    swift_getKeyPath();
    v29 = 0;
    swift_retain();
    sub_20CFCC674();
    goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_13:
  if (!*(_QWORD *)(*(_QWORD *)(v2 + v13) + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_identifier + 8)
    && *(_QWORD *)(*(_QWORD *)(v2 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_imageLoader)
                 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_identifier
                 + 8))
  {
    sub_20CF9B374();
  }
LABEL_16:
  if ((v28 & 1) != 0)
    sub_20CF881AC();
}

uint64_t sub_20CF9B0DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void (*v16)(char *, char *, uint64_t);
  void (*v17)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v21[0] = (char *)v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v21 - v3;
  v5 = sub_20CFCC47C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v21 - v10;
  v12 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v13 = (void *)sub_20CFCD0F4();
  v14 = (void *)sub_20CFCD0F4();
  v15 = objc_msgSend(v12, sel_URLForResource_withExtension_, v13, v14);

  if (v15)
  {
    sub_20CFCC44C();

    v16 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v16(v4, v9, v5);
    v17 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56);
    v17(v4, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
    {
      v16(v11, v4, v5);
      v18 = v21[0];
      (*(void (**)(_QWORD, char *, uint64_t))(v6 + 16))(v21[0], v11, v5);
      v17((char *)v18, 0, 1, v5);
      type metadata accessor for RemoteFileLoader();
      swift_allocObject();
      v19 = sub_20CF841F4(0xD00000000000001CLL, 0x800000020CFD1EA0, v18);
      *(_QWORD *)(v21[1] + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_videoFileLoader) = v19;
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  }
  return sub_20CF8658C((uint64_t)v4, &qword_253EC5F58);
}

uint64_t sub_20CF9B374()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];
  char v13;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_imageLoader;
  swift_retain();
  sub_20CF85310();
  swift_getKeyPath();
  swift_getKeyPath();
  v12[1] = 0;
  v13 = 2;
  sub_20CFCC674();
  v5 = *(_QWORD *)(v0 + v4);
  swift_retain();
  v6 = sub_20CFCCF14();
  v7 = (uint64_t *)(v5 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_identifier);
  *v7 = v6;
  v7[1] = v8;
  swift_release();
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(v0 + v4);
  swift_retain();
  sub_20CFCCF38();
  v10 = v9 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_url;
  swift_beginAccess();
  sub_20CF8286C((uint64_t)v3, v10);
  swift_endAccess();
  return swift_release();
}

void sub_20CF9B4CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char v16;
  void (*v17)(_BYTE *, uint64_t);
  void *v18;
  id v19;
  void *v20;
  _BYTE v21[24];

  v5 = sub_20CFCC728();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = &v21[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7);
  v11 = &v21[-v10];
  v12 = *(char **)(a2 + 16);
  v13 = &v12[OBJC_IVAR____TtC6TipsUI16TipsContentModel_currentTipList];
  swift_beginAccess();
  if (*(_QWORD *)v13)
  {
    v14 = &v12[OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme];
    swift_beginAccess();
    (*(void (**)(_BYTE *, char *, uint64_t))(v6 + 16))(v11, v14, v5);
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x24BDEB400], v5);
    v15 = v12;
    swift_bridgeObjectRetain();
    v16 = sub_20CFCC71C();
    v17 = *(void (**)(_BYTE *, uint64_t))(v6 + 8);
    v17(v9, v5);
    v17(v11, v5);
    v18 = *(void **)&v15[OBJC_IVAR____TtC6TipsUI16TipsContentModel_prefetchingManager];
    sub_20CF82934(0, (unint64_t *)&qword_253EC6B50);
    v19 = v18;
    v20 = (void *)sub_20CFCD184();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_prefetchAssetsFromTip_tips_assetUserInterfaceStyle_, a3, v20, (v16 & 1) == 0);

  }
}

void sub_20CF9B698(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_20CF9B6E8()
{
  uint64_t v0;
  uint64_t result;

  swift_retain();
  sub_20CF85310();
  swift_release();
  swift_retain();
  sub_20CF84F98();
  result = swift_release();
  *(_BYTE *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_isLoading) = 0;
  return result;
}

void sub_20CF9B750()
{
  id v0;
  char v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  if (v1 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_20CFCC668();
    swift_release();
    swift_release();
    objc_msgSend(v0, sel_pause);

  }
}

uint64_t sub_20CF9B824()
{
  uint64_t v0;
  int v1;
  id v3;

  v1 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel_didPlayToEndTime);
  if ((v1 & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_20CFCC668();
    swift_release();
    swift_release();
    objc_msgSend(v3, sel_play);

  }
  return v1 ^ 1u;
}

void sub_20CF9B8BC()
{
  id v0;
  void *v1;
  int v2;
  int v3;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  id v12;
  int v13;
  int v14;
  uint64_t v15;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  objc_msgSend(v12, sel_pause);

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  v0 = v12;
  if (v12)
  {
    v1 = (void *)*MEMORY[0x24BDC0D88];
    v2 = *(_DWORD *)(MEMORY[0x24BDC0D88] + 8);
    v3 = *(_DWORD *)(MEMORY[0x24BDC0D88] + 12);
    v11 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    v12 = v1;
    v13 = v2;
    v14 = v3;
    v15 = v11;
    v7 = v11;
    v8 = v1;
    v9 = v2;
    v10 = v3;
    v4 = v1;
    v5 = v2;
    v6 = v3;
    objc_msgSend(v0, sel_seekToTime_toleranceBefore_toleranceAfter_, &v12, &v8, &v4);

  }
}

void sub_20CF9B9E4()
{
  id v0;

  sub_20CF9B8BC();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  objc_msgSend(v0, sel_play);

}

uint64_t sub_20CF9BA6C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_20CF9BA90@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_20CF9A4A0(a1, a2);
}

uint64_t sub_20CF9BA98()
{
  return sub_20CF9A6AC();
}

uint64_t sub_20CF9BAC0()
{
  return sub_20CF9A6AC();
}

uint64_t sub_20CF9BAE8()
{
  return sub_20CF9A734();
}

uint64_t sub_20CF9BAF0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20CF9BB14()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_20CF9BB34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253EC5F48;
  if (!qword_253EC5F48)
  {
    v1 = sub_20CF82934(255, &qword_253EC5F50);
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDD0408], v1);
    atomic_store(result, (unint64_t *)&qword_253EC5F48);
  }
  return result;
}

uint64_t sub_20CF9BB8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  result = swift_release();
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_20CF9BC10(uint64_t a1)
{
  return sub_20CF9BE18(a1);
}

uint64_t sub_20CF9BC24()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  return swift_release();
}

uint64_t sub_20CF9BC8C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6120);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - v6;
  sub_20CF87F14(a1, (uint64_t)&v9 - v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CF87F14((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  sub_20CFCC674();
  return sub_20CF8658C((uint64_t)v7, &qword_253EC6120);
}

uint64_t sub_20CF9BD7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  result = swift_release();
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_20CF9BE04(uint64_t a1)
{
  return sub_20CF9BE18(a1);
}

uint64_t sub_20CF9BE18(uint64_t a1)
{
  void *v1;
  char v2;

  v1 = *(void **)a1;
  v2 = *(_BYTE *)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CF9C204(v1, v2);
  swift_retain();
  return sub_20CFCC674();
}

uint64_t sub_20CF9BEA0(uint64_t a1)
{
  return sub_20CF9BE18(a1);
}

uint64_t sub_20CF9BECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CF99468(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__player, &qword_253EC68D0);
}

uint64_t sub_20CF9BEF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CF994D4(a1, a2, a3, a4, &qword_25499DE08, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__player, &qword_253EC68D0);
}

uint64_t sub_20CF9BF1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CF99468(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isAssetLoaded, &qword_253EC68B0);
}

uint64_t sub_20CF9BF40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CF994D4(a1, a2, a3, a4, &qword_25499DE10, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isAssetLoaded, &qword_253EC68B0);
}

uint64_t sub_20CF9BF6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CF99468(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isPlaying, &qword_253EC68B0);
}

uint64_t sub_20CF9BF90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CF994D4(a1, a2, a3, a4, &qword_25499DE10, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isPlaying, &qword_253EC68B0);
}

uint64_t sub_20CF9BFBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CF99468(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isVideoLoaded, &qword_253EC68B0);
}

uint64_t sub_20CF9BFE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CF994D4(a1, a2, a3, a4, &qword_25499DE10, (uint64_t)&OBJC_IVAR____TtC6TipsUI22DocumentAssetViewModel__isVideoLoaded, &qword_253EC68B0);
}

uint64_t sub_20CF9C00C()
{
  return type metadata accessor for DocumentAssetViewModel();
}

uint64_t method lookup function for DocumentAssetViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DocumentAssetViewModel.player.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.player.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.player.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$player.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$player.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isAssetLoaded.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isAssetLoaded.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isAssetLoaded.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isAssetLoaded.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isAssetLoaded.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isAssetLoaded.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isPlaying.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isPlaying.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isPlaying.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isPlaying.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isPlaying.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isPlaying.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isVideoLoaded.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isVideoLoaded.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.isVideoLoaded.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isVideoLoaded.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isVideoLoaded.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 456))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.$isVideoLoaded.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 464))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.__allocating_init(document:assetsInfo:contentModel:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 712))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.playerDidFinishPublisher(withDelay:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 720))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.loadImageCacheIfAvailable()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 728))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.assetFileInfoManager.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 736))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.updateWithTipAssetInfo(_:shouldReload:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 752))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.cancel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 808))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.pauseVideoIfPlaying()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 824))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.resumeVideoIfPaused()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 832))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.resetVideo()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 840))();
}

uint64_t dispatch thunk of DocumentAssetViewModel.replayVideo()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 848))();
}

uint64_t sub_20CF9C1A8()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_20CF9C1D4(uint64_t a1)
{
  uint64_t v1;

  sub_20CF9B4CC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_20CF9C1E0(uint64_t a1)
{
  return sub_20CF9BE18(a1);
}

id sub_20CF9C204(id result, char a2)
{
  if (a2 == 1)
    return result;
  if (!a2)
    return (id)swift_retain();
  return result;
}

unint64_t sub_20CF9C268()
{
  unint64_t result;

  result = qword_253EC6B70;
  if (!qword_253EC6B70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253EC6B70);
  }
  return result;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for VideoPlayerView(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  if (*(_QWORD *)(a1 + 16))
  {
    v5 = *(_QWORD *)(a2 + 16);
    if (v5)
    {
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
      swift_release();
      *(_QWORD *)(a1 + 16) = v5;
      swift_release();
      *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
      goto LABEL_6;
    }
    sub_20CF8658C(a1 + 8, &qword_253EC5EF8);
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
LABEL_6:
  if (!*(_QWORD *)(a1 + 40))
  {
LABEL_10:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
    return a1;
  }
  v6 = *(_QWORD *)(a2 + 40);
  if (!v6)
  {
    sub_20CF8658C(a1 + 32, &qword_253EC5EF8);
    goto LABEL_10;
  }
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  *(_QWORD *)(a1 + 40) = v6;
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t sub_20CF9C3C4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(_QWORD *)(a2 + 16))
  {
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5EF8);
    sub_20CFCCD04();
    swift_release();
    return swift_release();
  }
  return result;
}

id sub_20CF9C454@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;
  int v4;

  result = objc_msgSend(*a1, sel_rate);
  *a2 = v4;
  return result;
}

id sub_20CF9C484(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setRate_, a3);
}

uint64_t sub_20CF9C4A0(uint64_t a1)
{
  uint64_t v1;

  return sub_20CF9C3C4(a1, v1 + 16);
}

id sub_20CF9C4A8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_timeControlStatus);
  *a2 = result;
  return result;
}

uint64_t sub_20CF9C4DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5EC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id static UIFont.fontWithStyle(_:size:)(uint64_t a1, double a2)
{
  id v3;
  id v4;

  v3 = objc_msgSend((id)objc_opt_self(), sel_preferredFontDescriptorWithTextStyle_, a1);
  v4 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v3, a2);

  return v4;
}

id static UIFont.fontWithStyle(_:weight:)(uint64_t a1, double a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t inited;
  void *v7;
  id v8;
  unint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  id v11;
  void *v12;
  id v13;
  id v14;
  _OWORD v16[2];
  __int128 v17;
  uint64_t v18;

  v3 = objc_msgSend((id)objc_opt_self(), sel_preferredFontDescriptorWithTextStyle_, a1);
  v4 = objc_msgSend(v3, sel_fontAttributes);
  type metadata accessor for AttributeName(0);
  sub_20CF9C7D8();
  sub_20CFCD0C4();

  sub_20CFCD118();
  v5 = (void *)sub_20CFCD0F4();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE30);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20CFCFD50;
  v7 = (void *)*MEMORY[0x24BDC4E80];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDC4E80];
  *(double *)(inited + 40) = a2;
  v8 = v7;
  v9 = sub_20CF97194(inited);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE38);
  *(_QWORD *)&v17 = v9;
  sub_20CF97650(&v17, v16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_20CF9C8EC(v16, v5, isUniquelyReferenced_nonNull_native, (uint64_t (*)(void *))sub_20CFA6D90, (void (*)(void))sub_20CFA7EC4, (void (*)(void))sub_20CFA722C, type metadata accessor for AttributeName);

  swift_bridgeObjectRelease();
  v11 = objc_allocWithZone(MEMORY[0x24BEBB528]);
  v12 = (void *)sub_20CFCD0B8();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_initWithFontAttributes_, v12);

  v14 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v13, 0.0);
  return v14;
}

unint64_t sub_20CF9C7D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25499DCE8;
  if (!qword_25499DCE8)
  {
    type metadata accessor for AttributeName(255);
    result = MEMORY[0x212B9AA54](&unk_20CFCF0B4, v1);
    atomic_store(result, (unint64_t *)&qword_25499DCE8);
  }
  return result;
}

uint64_t static UIFont.defaultFont.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v5;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for ConstellationContentAttributes(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  sub_20CF9CC1C((uint64_t)v2);
  sub_20CF9CD14((uint64_t)v2);
  return sub_20CFCCAC4();
}

void sub_20CF9C8B4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_20CF9CA48(a1, a2, a3, a4, (void (*)(void))sub_20CFA7ED0, (void (*)(void))sub_20CFA7564);
}

_OWORD *sub_20CF9C8C8(_OWORD *a1, void *a2, char a3)
{
  return sub_20CF9C8EC(a1, a2, a3, (uint64_t (*)(void *))sub_20CFA6D90, (void (*)(void))sub_20CFA857C, (void (*)(void))sub_20CFA7878, type metadata accessor for Key);
}

_OWORD *sub_20CF9C8EC(_OWORD *a1, void *a2, char a3, uint64_t (*a4)(void *), void (*a5)(void), void (*a6)(void), void (*a7)(_QWORD))
{
  _QWORD *v7;
  _QWORD **v12;
  _QWORD *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  _OWORD *v24;
  _OWORD *result;
  uint64_t v26;
  char v27;

  v12 = (_QWORD **)v7;
  v15 = (_QWORD *)*v7;
  v17 = a4(a2);
  v18 = v15[2];
  v19 = (v16 & 1) == 0;
  v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
  }
  else
  {
    v21 = v16;
    v22 = v15[3];
    if (v22 >= v20 && (a3 & 1) != 0)
    {
LABEL_7:
      v23 = *v12;
      if ((v21 & 1) != 0)
      {
LABEL_8:
        v24 = (_OWORD *)(v23[7] + 32 * v17);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v24);
        return sub_20CF97650(a1, v24);
      }
      goto LABEL_11;
    }
    if (v22 >= v20 && (a3 & 1) == 0)
    {
      a5();
      goto LABEL_7;
    }
    a6();
    v26 = a4(a2);
    if ((v21 & 1) == (v27 & 1))
    {
      v17 = v26;
      v23 = *v12;
      if ((v21 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_20CF9CBB8(v17, (uint64_t)a2, a1, v23);
      return a2;
    }
  }
  a7(0);
  result = (_OWORD *)sub_20CFCD460();
  __break(1u);
  return result;
}

void sub_20CF9CA34(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_20CF9CA48(a1, a2, a3, a4, (void (*)(void))sub_20CFA8744, (void (*)(void))sub_20CFA7BB0);
}

void sub_20CF9CA48(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), void (*a6)(void))
{
  _QWORD *v6;
  _QWORD *v9;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v9 = v6;
  v14 = *v6;
  v16 = sub_20CFA6D2C(a2, a3);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v20 = v15;
  v21 = *(_QWORD *)(v14 + 24);
  if (v21 >= v19 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v21 >= v19 && (a4 & 1) == 0)
  {
    a5();
LABEL_7:
    v22 = (_QWORD *)*v9;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      v23 = v22[7];

      *(_QWORD *)(v23 + 8 * v16) = a1;
      return;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    v26 = (uint64_t *)(v22[6] + 16 * v16);
    *v26 = a2;
    v26[1] = a3;
    *(_QWORD *)(v22[7] + 8 * v16) = a1;
    v27 = v22[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v22[2] = v29;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  a6();
  v24 = sub_20CFA6D2C(a2, a3);
  if ((v20 & 1) == (v25 & 1))
  {
    v16 = v24;
    v22 = (_QWORD *)*v9;
    if ((v20 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_20CFCD460();
  __break(1u);
}

_OWORD *sub_20CF9CBB8(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  _OWORD *result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  result = sub_20CF97650(a3, (_OWORD *)(a4[7] + 32 * a1));
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

id sub_20CF9CC1C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (id *)((char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_20CF9CD74(a1, (uint64_t)v4);
  v5 = type metadata accessor for ConstellationContentAttributes(0);
  if ((*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5) == 1)
  {
    sub_20CF9CD14((uint64_t)v4);
  }
  else
  {
    v6 = *v4;
    v7 = *v4;
    sub_20CF9CDBC((uint64_t)v4);
    if (v6)
      return v7;
  }
  return objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE1D0]);
}

uint64_t sub_20CF9CD14(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t sub_20CF9CD74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20CF9CDBC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ConstellationContentAttributes(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20CF9CDF8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v1 = *(_QWORD *)v0;
  v2 = *(_BYTE *)(v0 + 8);
  sub_20CF87C98(v1, v2);
  v3 = sub_20CF82BBC(v1, v2) & 1;
  sub_20CF8257C(v1, v2);
  return v3;
}

uint64_t sub_20CF9CE4C()
{
  type metadata accessor for RemoteImageLoader();
  sub_20CF9E63C();
  return sub_20CFCC74C();
}

uint64_t sub_20CF9CE98()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5EF8);
  return sub_20CFCCD04();
}

uint64_t RemoteImageView.init(identifier:url:isLoaded:placeholder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, void (*a7)(uint64_t)@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  char v44;

  v36 = a8;
  v37 = a7;
  v34 = a1;
  v35 = a2;
  v16 = *(_QWORD *)(a10 - 8);
  v39 = a11;
  v40 = v16;
  MEMORY[0x24BDAC7A8](a1);
  v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(_QWORD *)(v20 + 64);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)a9 = swift_getKeyPath();
  *(_BYTE *)(a9 + 8) = 0;
  *(_QWORD *)(a9 + 64) = 0;
  v38 = a3;
  sub_20CF9DAEC(a3, (uint64_t)v22);
  v23 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v24 = swift_allocObject();
  v25 = v35;
  *(_QWORD *)(v24 + 16) = v34;
  *(_QWORD *)(v24 + 24) = v25;
  sub_20CF9DB38((uint64_t)v22, v24 + v23);
  *(_QWORD *)(a9 + 16) = sub_20CF9DB80;
  *(_QWORD *)(a9 + 24) = v24;
  *(_BYTE *)(a9 + 32) = 0;
  if (a5)
  {
    v26 = a6 & 1;
    v27 = a5;
    v28 = a4;
  }
  else
  {
    v41 = 0;
    sub_20CFCCD10();
    v28 = v42;
    v27 = v43;
    v26 = v44;
  }
  *(_QWORD *)(a9 + 40) = v28;
  *(_QWORD *)(a9 + 48) = v27;
  *(_BYTE *)(a9 + 56) = v26;
  v29 = sub_20CF8AFD0(a4, a5);
  v37(v29);
  sub_20CF88FF0(a4, a5);
  sub_20CF97154(v38);
  v31 = type metadata accessor for RemoteImageView(0, a10, v39, v30);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v40 + 32))(a9 + *(int *)(v31 + 48), v18, a10);
}

uint64_t sub_20CF9D0C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CF9DAEC(a3, (uint64_t)v8);
  type metadata accessor for RemoteImageLoader();
  swift_allocObject();
  swift_bridgeObjectRetain();
  return sub_20CF837C8(a1, a2, (uint64_t)v8);
}

uint64_t RemoteImageView.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
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
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void (*v24)(unint64_t, char *, uint64_t);
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  void (*v40)(char *, uint64_t);
  char *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[3];

  v56 = a2;
  v4 = *(_QWORD *)(a1 - 8);
  v50 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v47 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC5EA0);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = sub_20CFCC9C8();
  v8 = sub_20CF9DB84();
  v9 = *(_QWORD *)(a1 + 24);
  v63[0] = v8;
  v63[1] = v9;
  v10 = v9;
  MEMORY[0x212B9AA54](MEMORY[0x24BDEF3E0], v7, v63);
  v11 = sub_20CFCCCE0();
  v49 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v42 = (char *)&v42 - v12;
  v13 = sub_20CFCC80C();
  v55 = *(_QWORD *)(v13 - 8);
  v51 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v57 = (char *)&v42 - v14;
  v15 = sub_20CFCC80C();
  v16 = *(_QWORD *)(v15 - 8);
  v53 = v15;
  v54 = v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v48 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v52 = (char *)&v42 - v19;
  v44 = v6;
  v58 = v6;
  v59 = v10;
  v43 = v10;
  v46 = v2;
  v60 = v2;
  sub_20CFCC8E4();
  sub_20CFCCCD4();
  v45 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v20 = v47;
  v45(v47, v2, a1);
  v21 = v4;
  v22 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v6;
  *(_QWORD *)(v23 + 24) = v10;
  v24 = *(void (**)(unint64_t, char *, uint64_t))(v21 + 32);
  v24(v23 + v22, v20, a1);
  v25 = MEMORY[0x212B9AA54](MEMORY[0x24BDF4498], v11);
  v26 = v42;
  sub_20CFCCBB4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v26, v11);
  v45(v20, v46, a1);
  v27 = swift_allocObject();
  v28 = v43;
  *(_QWORD *)(v27 + 16) = v44;
  *(_QWORD *)(v27 + 24) = v28;
  v24(v27 + v22, v20, a1);
  v29 = MEMORY[0x24BDF0910];
  v62[0] = v25;
  v62[1] = MEMORY[0x24BDF0910];
  v30 = MEMORY[0x24BDED308];
  v31 = v51;
  v32 = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v51, v62);
  v33 = v48;
  v34 = v57;
  sub_20CFCCB54();
  swift_release();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v34, v31);
  v61[0] = v32;
  v61[1] = v29;
  v35 = v30;
  v36 = v53;
  MEMORY[0x212B9AA54](v35, v53, v61);
  v37 = v54;
  v38 = *(void (**)(char *, char *, uint64_t))(v54 + 16);
  v39 = v52;
  v38(v52, v33, v36);
  v40 = *(void (**)(char *, uint64_t))(v37 + 8);
  v40(v33, v36);
  v38(v56, v39, v36);
  return ((uint64_t (*)(char *, uint64_t))v40)(v39, v36);
}

uint64_t sub_20CF9D564@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  char *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  void *v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  char v50;
  char v51;
  uint64_t (*v52)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[3];

  v47 = a3;
  v41 = *(_QWORD *)(a2 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v36 - v8;
  v46 = v10;
  v13 = type metadata accessor for RemoteImageView(0, v11, v10, v12);
  v40 = *(_QWORD *)(v13 - 8);
  v38 = *(_QWORD *)(v40 + 64);
  MEMORY[0x24BDAC7A8](v13);
  v39 = (char *)&v36 - v14;
  v37 = sub_20CFCCC68();
  v15 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC5EA0);
  v18 = sub_20CFCC9C8();
  v44 = *(_QWORD *)(v18 - 8);
  v45 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v43 = (char *)&v36 - v19;
  sub_20CF9CE4C();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  swift_release();
  v20 = v48;
  if ((_BYTE)v49)
  {
    sub_20CF8AC84(v48, v49);
    v21 = a1 + *(int *)(v13 + 48);
    v22 = v41;
    v23 = *(void (**)(char *, uint64_t, uint64_t))(v41 + 16);
    v23(v9, v21, a2);
    v23(v7, (uint64_t)v9, a2);
    sub_20CF9DB84();
    v24 = v43;
    v25 = v46;
    sub_20CF8A74C((uint64_t)v7, v42, a2);
    v26 = *(void (**)(char *, uint64_t))(v22 + 8);
    v26(v7, a2);
    v26(v9, a2);
  }
  else
  {
    v27 = v37;
    (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v17, *MEMORY[0x24BDF3FD0], v37);
    swift_retain();
    v28 = (void *)sub_20CFCCC8C();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v27);
    LOBYTE(v27) = sub_20CF9CDF8();
    v30 = v39;
    v29 = v40;
    (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v39, a1, v13);
    v31 = (*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
    v32 = swift_allocObject();
    v25 = v46;
    *(_QWORD *)(v32 + 16) = a2;
    *(_QWORD *)(v32 + 24) = v25;
    (*(void (**)(unint64_t, char *, uint64_t))(v29 + 32))(v32 + v31, v30, v13);
    v48 = v28;
    v49 = 0;
    v50 = 1;
    v51 = v27;
    v52 = sub_20CF9E740;
    v53 = v32;
    v54 = 0;
    v55 = 0;
    sub_20CF9DB84();
    swift_retain();
    swift_retain();
    v24 = v43;
    sub_20CFA01AC((uint64_t)&v48, v42);
    sub_20CF8AC84(v20, 0);
    sub_20CF8AC84(v20, 0);
    swift_release_n();
    swift_release_n();
  }
  v56[0] = sub_20CF9DB84();
  v56[1] = v25;
  v33 = v45;
  MEMORY[0x212B9AA54](MEMORY[0x24BDEF3E0], v45, v56);
  v34 = v44;
  (*(void (**)(uint64_t, char *, uint64_t))(v44 + 16))(v47, v24, v33);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v24, v33);
}

uint64_t sub_20CF9D92C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  type metadata accessor for RemoteImageView(0, a2, a3, (uint64_t)a4);
  sub_20CF9CE4C();
  a4();
  return swift_release();
}

uint64_t RemoteImageView<>.init(identifier:url:isLoaded:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t KeyPath;
  unint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  _BYTE v26[4];
  int v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;

  v27 = a6;
  v28 = a4;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v16 = &v26[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v15);
  v18 = &v26[-v17];
  sub_20CF9DAEC(a3, (uint64_t)&v26[-v17]);
  KeyPath = swift_getKeyPath();
  sub_20CF9DAEC((uint64_t)v18, (uint64_t)v16);
  v20 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = a1;
  *(_QWORD *)(v21 + 24) = a2;
  sub_20CF9DB38((uint64_t)v16, v21 + v20);
  if (a5)
  {
    v22 = v27 & 1;
    v23 = v28;
  }
  else
  {
    v29 = 0;
    sub_20CFCCD10();
    v23 = v30;
    a5 = v31;
    v22 = v32;
  }
  v24 = sub_20CFCCBF0();
  sub_20CF97154((uint64_t)v18);
  result = sub_20CF97154(a3);
  *(_QWORD *)a7 = KeyPath;
  *(_BYTE *)(a7 + 8) = 0;
  *(_QWORD *)(a7 + 16) = sub_20CF9DB80;
  *(_QWORD *)(a7 + 24) = v21;
  *(_BYTE *)(a7 + 32) = 0;
  *(_QWORD *)(a7 + 40) = v23;
  *(_QWORD *)(a7 + 48) = a5;
  *(_BYTE *)(a7 + 56) = v22;
  *(_QWORD *)(a7 + 64) = 0;
  *(_QWORD *)(a7 + 72) = v24;
  return result;
}

uint64_t sub_20CF9DAEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20CF9DB38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_20CF9DB84()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_253EC5E98;
  if (!qword_253EC5E98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC5EA0);
    v2[0] = sub_20CF8B7CC();
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_253EC5E98);
  }
  return result;
}

uint64_t sub_20CF9DBF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20CF9D564(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_20CF9DC00()
{
  return swift_release();
}

uint64_t sub_20CF9DC08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CF9DC24(sub_20CF85428, a2, a3, a4);
}

uint64_t sub_20CF9DC18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CF9DC24(sub_20CF85310, a2, a3, a4);
}

uint64_t sub_20CF9DC24(void (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_QWORD *)(v4 + 16);
  v7 = *(_QWORD *)(v4 + 24);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for RemoteImageView(0, v6, v7, a4) - 8) + 80);
  return sub_20CF9D92C(v4 + ((v8 + 32) & ~v8), v6, v7, a1);
}

uint64_t sub_20CF9DC84()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58) - 8) + 80);
  return sub_20CF9D0C0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v0 + ((v1 + 32) & ~v1));
}

uint64_t sub_20CF9DCB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20CF9DCEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(unint64_t, unint64_t, uint64_t);

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (v7 > 7
    || (*(_DWORD *)(v6 + 80) & 0x100000) != 0
    || ((v7 + 72) & (unint64_t)~v7) + *(_QWORD *)(v6 + 64) > 0x18)
  {
    v10 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v10 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16));
    swift_retain();
  }
  else
  {
    v11 = *(_QWORD *)a2;
    v12 = *(_BYTE *)(a2 + 8);
    sub_20CF87C98(*(_QWORD *)a2, v12);
    *(_QWORD *)a1 = v11;
    *(_BYTE *)(a1 + 8) = v12;
    v13 = a1 & 0xFFFFFFFFFFFFFFF8;
    v14 = a2 & 0xFFFFFFFFFFFFFFF8;
    v15 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 16);
    v16 = *(_QWORD *)(v14 + 24);
    v17 = *(_BYTE *)(v14 + 32);
    sub_20CF9DE30();
    *(_QWORD *)(v13 + 16) = v15;
    *(_QWORD *)(v13 + 24) = v16;
    *(_BYTE *)(v13 + 32) = v17;
    *(_QWORD *)(v13 + 40) = *(_QWORD *)(v14 + 40);
    *(_QWORD *)(v13 + 48) = *(_QWORD *)(v14 + 48);
    *(_BYTE *)(v13 + 56) = *(_BYTE *)(v14 + 56);
    *(_QWORD *)(v13 + 64) = *(_QWORD *)(v14 + 64);
    v18 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    v18(((a1 & 0xFFFFFFFFFFFFFFF8) + v7 + 72) & ~v7, (v14 + v7 + 72) & ~v7, v5);
  }
  return a1;
}

uint64_t sub_20CF9DE30()
{
  return swift_retain();
}

uint64_t sub_20CF9DE38(uint64_t a1, uint64_t a2)
{
  sub_20CF8257C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  sub_20CF9DC00();
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))(((a1 & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

uint64_t sub_20CF9DEA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void (*v18)(unint64_t, uint64_t, uint64_t);

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_20CF87C98(*(_QWORD *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = a1 & 0xFFFFFFFFFFFFFFF8;
  v9 = a2 & 0xFFFFFFFFFFFFFFF8;
  v10 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 16);
  v11 = *(_QWORD *)(v9 + 24);
  v12 = *(_BYTE *)(v9 + 32);
  sub_20CF9DE30();
  *(_QWORD *)(v8 + 16) = v10;
  *(_QWORD *)(v8 + 24) = v11;
  *(_BYTE *)(v8 + 32) = v12;
  *(_QWORD *)(v8 + 40) = *(_QWORD *)(v9 + 40);
  *(_QWORD *)(v8 + 48) = *(_QWORD *)(v9 + 48);
  *(_BYTE *)(v8 + 56) = *(_BYTE *)(v9 + 56);
  *(_QWORD *)(v8 + 64) = *(_QWORD *)(v9 + 64);
  v13 = *(_QWORD *)(a3 + 16);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(unsigned __int8 *)(v14 + 80);
  v16 = (v15 + 72 + (a1 & 0xFFFFFFFFFFFFFFF8)) & ~v15;
  v17 = (v15 + 72 + v9) & ~v15;
  v18 = *(void (**)(unint64_t, uint64_t, uint64_t))(v14 + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  v18(v16, v17, v13);
  return a1;
}

uint64_t sub_20CF9DF94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v6 = *(_QWORD *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_20CF87C98(*(_QWORD *)a2, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_20CF8257C(v8, v9);
  v10 = a1 & 0xFFFFFFFFFFFFFFF8;
  v11 = a2 & 0xFFFFFFFFFFFFFFF8;
  v12 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 16);
  v13 = *(_QWORD *)(v11 + 24);
  v14 = *(_BYTE *)(v11 + 32);
  sub_20CF9DE30();
  *(_QWORD *)(v10 + 16) = v12;
  *(_QWORD *)(v10 + 24) = v13;
  *(_BYTE *)(v10 + 32) = v14;
  sub_20CF9DC00();
  *(_QWORD *)(v10 + 40) = *(_QWORD *)(v11 + 40);
  swift_retain();
  swift_release();
  *(_QWORD *)(v10 + 48) = *(_QWORD *)(v11 + 48);
  swift_retain();
  swift_release();
  *(_BYTE *)(v10 + 56) = *(_BYTE *)(v11 + 56);
  *(_QWORD *)(v10 + 64) = *(_QWORD *)(v11 + 64);
  swift_retain();
  swift_release();
  v15 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v15 + 24))((*(unsigned __int8 *)(v15 + 80) + 72 + (a1 & 0xFFFFFFFFFFFFFFF8)) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80), (*(unsigned __int8 *)(v15 + 80) + 72 + v11) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  return a1;
}

uint64_t sub_20CF9E0A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = a1 & 0xFFFFFFFFFFFFFFF8;
  v5 = *(_OWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 16);
  *(_BYTE *)(v4 + 32) = *(_BYTE *)((a2 & 0xFFFFFFFFFFFFFFF8) + 32);
  *(_OWORD *)(v4 + 16) = v5;
  v6 = *(_OWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 40);
  *(_BYTE *)(v4 + 56) = *(_BYTE *)((a2 & 0xFFFFFFFFFFFFFFF8) + 56);
  *(_OWORD *)(v4 + 40) = v6;
  *(_QWORD *)(v4 + 64) = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFFF8) + 64);
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 32))((*(unsigned __int8 *)(v7 + 80) + 72 + (a1 & 0xFFFFFFFFFFFFFFF8)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(unsigned __int8 *)(v7 + 80) + 72 + (a2 & 0xFFFFFFFFFFFFFFF8)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_20CF9E130(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  char v11;
  uint64_t v12;

  v4 = a2;
  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  v8 = *(_QWORD *)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_20CF8257C(v8, v9);
  v10 = a1 & 0xFFFFFFFFFFFFFFF8;
  v4 = (uint64_t *)((unint64_t)v4 & 0xFFFFFFFFFFFFFFF8);
  v11 = *((_BYTE *)v4 + 32);
  *(_OWORD *)(v10 + 16) = *((_OWORD *)v4 + 1);
  *(_BYTE *)(v10 + 32) = v11;
  sub_20CF9DC00();
  *(_QWORD *)(v10 + 40) = v4[5];
  swift_release();
  *(_QWORD *)(v10 + 48) = v4[6];
  swift_release();
  *(_BYTE *)(v10 + 56) = *((_BYTE *)v4 + 56);
  *(_QWORD *)(v10 + 64) = v4[8];
  swift_release();
  v12 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v12 + 40))((*(unsigned __int8 *)(v12 + 80) + 72 + (a1 & 0xFFFFFFFFFFFFFFF8)) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80), ((unint64_t)v4 + *(unsigned __int8 *)(v12 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  return a1;
}

uint64_t sub_20CF9E200(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  unsigned int v13;
  int v14;
  unint64_t v15;
  unint64_t v16;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_22;
  v9 = ((v7 + 72) & ~v7) + *(_QWORD *)(v4 + 64);
  v10 = 8 * v9;
  if (v9 <= 3)
  {
    v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      v11 = *(_DWORD *)(a1 + v9);
      if (!v11)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      v11 = *(unsigned __int16 *)(a1 + v9);
      if (!*(_WORD *)(a1 + v9))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_22:
      v15 = a1 & 0xFFFFFFFFFFFFFFF8;
      if ((v5 & 0x80000000) != 0)
        return (*(uint64_t (**)(unint64_t))(v4 + 48))((v15 + v7 + 72) & ~v7);
      v16 = *(_QWORD *)(v15 + 48);
      if (v16 >= 0xFFFFFFFF)
        LODWORD(v16) = -1;
      return (v16 + 1);
    }
  }
  v11 = *(unsigned __int8 *)(a1 + v9);
  if (!*(_BYTE *)(a1 + v9))
    goto LABEL_22;
LABEL_15:
  v14 = (v11 - 1) << v10;
  if (v9 > 3)
    v14 = 0;
  if (!(_DWORD)v9)
    return v6 + v14 + 1;
  if (v9 > 3)
    LODWORD(v9) = 4;
  return ((uint64_t (*)(void))((char *)&loc_20CF9E2D4 + 4 * byte_20CFCFD60[(v9 - 1)]))();
}

void sub_20CF9E348(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + *(_QWORD *)(v5 + 64);
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v10 = ((a3 - v6 + ~(-1 << (8 * v7))) >> (8 * v7)) + 1;
      if (HIWORD(v10))
      {
        v8 = 4u;
      }
      else if (v10 >= 0x100)
      {
        v8 = 2;
      }
      else
      {
        v8 = v10 > 1;
      }
    }
    else
    {
      v8 = 1u;
    }
  }
  else
  {
    v8 = 0;
  }
  if (v6 < a2)
  {
    v9 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        v11 = v9 & ~(-1 << (8 * v7));
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v11;
          *((_BYTE *)a1 + 2) = BYTE2(v11);
        }
        else if ((_DWORD)v7 == 2)
        {
          *a1 = v11;
        }
        else
        {
          *(_BYTE *)a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v7);
      *(_DWORD *)a1 = v9;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t sub_20CF9E548(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC5EA0);
  v2 = sub_20CFCC9C8();
  v12[0] = sub_20CF9DB84();
  v12[1] = v1;
  MEMORY[0x212B9AA54](MEMORY[0x24BDEF3E0], v2, v12);
  v3 = sub_20CFCCCE0();
  v4 = sub_20CFCC80C();
  v5 = sub_20CFCC80C();
  v6 = MEMORY[0x212B9AA54](MEMORY[0x24BDF4498], v3);
  v7 = MEMORY[0x24BDF0910];
  v11[0] = v6;
  v11[1] = MEMORY[0x24BDF0910];
  v8 = MEMORY[0x24BDED308];
  v10[0] = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v4, v11);
  v10[1] = v7;
  return MEMORY[0x212B9AA54](v8, v5, v10);
}

unint64_t sub_20CF9E63C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253EC6A00;
  if (!qword_253EC6A00)
  {
    v1 = type metadata accessor for RemoteImageLoader();
    result = MEMORY[0x212B9AA54](&unk_20CFD01F8, v1);
    atomic_store(result, (unint64_t *)&qword_253EC6A00);
  }
  return result;
}

uint64_t objectdestroy_2Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for RemoteImageView(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = v4 + ((v7 + 32) & ~v7);
  sub_20CF8257C(*(_QWORD *)v8, *(_BYTE *)(v8 + 8));
  sub_20CF9DC00();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v8 + *(int *)(v6 + 48), v5);
  return swift_deallocObject();
}

uint64_t sub_20CF9E740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for RemoteImageView(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  return sub_20CF9CE98();
}

uint64_t sub_20CF9E784()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  return swift_release();
}

uint64_t sub_20CF9E7E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_20CF84F98();
  v1 = v0 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader__state;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6890);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  sub_20CF8658C(v0 + OBJC_IVAR____TtC6TipsUI16RemoteFileLoader_url, &qword_253EC5F58);
  return swift_deallocClassInstance();
}

uint64_t sub_20CF9E87C()
{
  return type metadata accessor for RemoteFileLoader();
}

uint64_t sub_20CF9E884@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for RemoteFileLoader();
  result = sub_20CFCC5F0();
  *a1 = result;
  return result;
}

unint64_t sub_20CF9E8C8()
{
  unint64_t result;

  result = qword_253EC5D58;
  if (!qword_253EC5D58)
  {
    result = MEMORY[0x212B9AA54](&unk_20CFCF95C, &type metadata for ContentLoadError);
    atomic_store(result, (unint64_t *)&qword_253EC5D58);
  }
  return result;
}

uint64_t sub_20CF9E90C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_20CF9E930(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_20CF9E984()
{
  sub_20CF8B9E4();
  sub_20CFCC98C();
  __break(1u);
}

id _PlayerView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void _PlayerView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id _PlayerView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _PlayerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t static _PlayerView.layerClass.getter()
{
  return sub_20CF82AEC();
}

Swift::Void __swiftcall _PlayerView.layoutSubviews()()
{
  void *v0;
  id v1;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _PlayerView();
  objc_msgSendSuper2(&v2, sel_layoutSubviews);
  v1 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v1, sel_setBounds_);

}

uint64_t method lookup function for _PlayerView()
{
  return swift_lookUpClassMethod();
}

uint64_t assignWithCopy for VideoPlayerViewRepresentable(uint64_t a1, void **a2)
{
  void **v2;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v2 = a2;
  v4 = *(void **)a1;
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  v6 = v5;

  v7 = (uint64_t)v2[1];
  LOBYTE(v2) = *((_BYTE *)v2 + 16);
  sub_20CF87C98(v7, (char)v2);
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = (_BYTE)v2;
  sub_20CF8257C(v8, v9);
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

uint64_t assignWithTake for VideoPlayerViewRepresentable(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  uint64_t v6;
  char v7;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(_BYTE *)(a2 + 16);
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = v5;
  sub_20CF8257C(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoPlayerViewRepresentable(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 17))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for VideoPlayerViewRepresentable(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_20CF9ECF0()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_20CF9ECFC()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___TPSUIAppController_viewNavigationCollapsed);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_20CF9ED40(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___TPSUIAppController_viewNavigationCollapsed);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_20CF9ED88())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id TPSUIAppController.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t sub_20CF9EDEC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_20CF9EE10(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v3 = sub_20CFCCDAC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20CFCCDD0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v11 = (char *)MEMORY[0x212B9AB8C](a2 + 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(void **)&v11[OBJC_IVAR___TPSUIAppController_syncQueue];
    if (v13)
    {
      v14 = swift_allocObject();
      *(_QWORD *)(v14 + 16) = v12;
      aBlock[4] = sub_20CFA01A0;
      aBlock[5] = v14;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_20CF8B674;
      aBlock[3] = &block_descriptor_51;
      v15 = _Block_copy(aBlock);
      v18 = v4;
      v16 = v15;
      v17 = v13;
      v19 = v12;
      sub_20CFCCDC4();
      v20 = MEMORY[0x24BEE4AF8];
      sub_20CF82E3C((unint64_t *)&qword_253EC6920, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6928);
      sub_20CF83538((unint64_t *)&qword_253EC6930, &qword_253EC6928);
      sub_20CFCD34C();
      MEMORY[0x212B9A220](0, v10, v6, v16);
      _Block_release(v16);

      (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v3);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

      swift_release();
    }
    else
    {

    }
  }
}

void sub_20CF9F048(uint64_t a1)
{
  uint64_t v1;

  sub_20CF9EE10(a1, v1);
}

uint64_t sub_20CF9F050(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_20CFCC404();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_20CFCC3F8();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

id sub_20CF9F0F4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_20CF9FE00(a1, a2, a3, a5, a6);
}

uint64_t sub_20CF9F1B0(uint64_t a1, uint64_t a2)
{
  char *v2;
  void *v3;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  char *v10;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  void (*v13)();
  uint64_t v14;
  _QWORD aBlock[6];
  uint64_t v16;

  v16 = 0;
  v3 = *(void **)&v2[OBJC_IVAR___TPSUIAppController_syncQueue];
  if (!v3)
  {
    v14 = 0;
    v13 = 0;
    goto LABEL_5;
  }
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = &v16;
  v6[3] = v2;
  v6[4] = a1;
  v6[5] = a2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_20CF9FEAC;
  *(_QWORD *)(v7 + 24) = v6;
  aBlock[4] = sub_20CF9BB14;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20CF9F34C;
  aBlock[3] = &block_descriptor_15;
  v8 = _Block_copy(aBlock);
  v9 = v3;
  v10 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v9, v8);

  _Block_release(v8);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    v13 = sub_20CF9FEAC;
    v14 = v16;
LABEL_5:
    sub_20CF88FE0((uint64_t)v13);
    return v14;
  }
  __break(1u);
  return result;
}

uint64_t sub_20CF9F32C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_20CF9F34C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_20CF9F378(uint64_t a1, uint64_t a2)
{
  char *v2;
  void *v3;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  char *v10;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  void (*v13)();
  uint64_t v14;
  _QWORD aBlock[6];
  uint64_t v16;

  v16 = 0;
  v3 = *(void **)&v2[OBJC_IVAR___TPSUIAppController_syncQueue];
  if (!v3)
  {
    v14 = 0;
    v13 = 0;
    goto LABEL_5;
  }
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = &v16;
  v6[3] = v2;
  v6[4] = a1;
  v6[5] = a2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_20CF9FF10;
  *(_QWORD *)(v7 + 24) = v6;
  aBlock[4] = sub_20CFA016C;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20CF9F34C;
  aBlock[3] = &block_descriptor_25;
  v8 = _Block_copy(aBlock);
  v9 = v3;
  v10 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v9, v8);

  _Block_release(v8);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    v13 = sub_20CF9FF10;
    v14 = v16;
LABEL_5:
    sub_20CF88FE0((uint64_t)v13);
    return v14;
  }
  __break(1u);
  return result;
}

void sub_20CF9F4F4(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  void *v12;
  id v13;
  void *v14;

  v8 = (uint64_t *)(a2 + *a5);
  swift_beginAccess();
  v9 = *v8;
  if (v9 && *(_QWORD *)(v9 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10 = sub_20CFA6D2C(a3, a4);
    if ((v11 & 1) != 0)
    {
      v12 = *(void **)(*(_QWORD *)(v9 + 56) + 8 * v10);
      v13 = v12;
    }
    else
    {
      v12 = 0;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v14 = *a1;
  *a1 = v12;

}

id sub_20CF9F5B8(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;

  v6 = sub_20CFCD118();
  v8 = v7;
  v9 = a1;
  v10 = (void *)a4(v6, v8);

  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_20CF9F618(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_20CF9F65C(a1, a2, a3, (uint64_t)&unk_24C5DF100, (uint64_t)sub_20CF9FF48, (uint64_t)&block_descriptor_31);
}

uint64_t sub_20CF9F640(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_20CF9F65C(a1, a2, a3, (uint64_t)&unk_24C5DF150, (uint64_t)sub_20CF9FFA4, (uint64_t)&block_descriptor_37);
}

uint64_t sub_20CF9F65C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  id v22;
  id v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];

  v28 = a6;
  v11 = sub_20CFCCDAC();
  v29 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_20CFCCDD0();
  result = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(void **)&v6[OBJC_IVAR___TPSUIAppController_syncQueue];
  if (v19)
  {
    v26 = v16;
    v27 = result;
    v20 = (_QWORD *)swift_allocObject();
    v20[2] = v6;
    v20[3] = a2;
    v20[4] = a3;
    v20[5] = a1;
    aBlock[4] = a5;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20CF8B674;
    aBlock[3] = v28;
    v21 = _Block_copy(aBlock);
    v22 = a1;
    v23 = v19;
    v24 = v6;
    swift_bridgeObjectRetain();
    sub_20CFCCDC4();
    v30 = MEMORY[0x24BEE4AF8];
    sub_20CF82E3C((unint64_t *)&qword_253EC6920, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6928);
    sub_20CF83538((unint64_t *)&qword_253EC6930, &qword_253EC6928);
    sub_20CFCD34C();
    MEMORY[0x212B9A220](0, v18, v13, v21);
    _Block_release(v21);

    (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v11);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v18, v27);
    return swift_release();
  }
  return result;
}

uint64_t sub_20CF9F868(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(_BYTE *))
{
  uint64_t *v8;
  uint64_t (*v9)(_BYTE *, _QWORD);
  uint64_t *v10;
  id v11;
  char isUniquelyReferenced_nonNull_native;
  void *v13;
  uint64_t v15;
  _BYTE v16[32];

  v9 = (uint64_t (*)(_BYTE *, _QWORD))a5(v16);
  if (*v8)
  {
    v10 = v8;
    swift_bridgeObjectRetain();
    if (a4)
    {
      v11 = a4;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v15 = *v10;
      *v10 = 0x8000000000000000;
      sub_20CF9C8B4((uint64_t)v11, a2, a3, isUniquelyReferenced_nonNull_native);
      *v10 = v15;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v13 = (void *)sub_20CFAF934(a2, a3);
      swift_bridgeObjectRelease();

    }
  }
  return v9(v16, 0);
}

uint64_t sub_20CF9F960(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(void *, uint64_t, uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v8 = sub_20CFCD118();
  v10 = v9;
  v11 = a3;
  v12 = a1;
  a5(a3, v8, v10);

  return swift_bridgeObjectRelease();
}

uint64_t sub_20CF9F9D4()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  id v14;
  char *v15;
  _QWORD v16[2];
  _QWORD aBlock[6];

  v1 = sub_20CFCCDAC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20CFCCDD0();
  v6 = *(_QWORD *)(v5 - 8);
  result = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void **)&v0[OBJC_IVAR___TPSUIAppController_syncQueue];
  if (v10)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v0;
    aBlock[4] = sub_20CFA01A0;
    aBlock[5] = v11;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20CF8B674;
    aBlock[3] = &block_descriptor_44;
    v12 = _Block_copy(aBlock);
    v16[0] = v2;
    v13 = v12;
    v14 = v10;
    v15 = v0;
    sub_20CFCCDC4();
    v16[1] = MEMORY[0x24BEE4AF8];
    sub_20CF82E3C((unint64_t *)&qword_253EC6920, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6928);
    sub_20CF83538((unint64_t *)&qword_253EC6930, &qword_253EC6928);
    sub_20CFCD34C();
    MEMORY[0x212B9A220](0, v9, v4, v13);
    _Block_release(v13);

    (*(void (**)(char *, uint64_t))(v16[0] + 8))(v4, v1);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    return swift_release();
  }
  return result;
}

uint64_t sub_20CF9FBC8()
{
  uint64_t v0;

  return swift_deallocObject();
}

id TPSUIAppController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPSUIAppController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void TPSUIAppController.overrideWidget(with:)(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  type metadata accessor for TipsContentModel();
  v4 = static TipsContentModel.shared()();
  if (objc_msgSend((id)objc_opt_self(), sel_isInternalBuild))
  {
    v2 = sub_20CFBFE98();
    objc_msgSend(v2, sel_attemptWidgetUpdateWith_, a1);

    v3 = v2;
  }
  else
  {
    v3 = v4;
  }

}

id sub_20CF9FE00(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  id v6;
  id v9;
  void *v10;

  v6 = 0;
  if (a1 && a3)
  {
    v9 = a1;
    v10 = (void *)sub_20CFCD0F4();
    v6 = objc_msgSend(v5, sel_assetConfigurationForAssets_language_userInterfaceStyle_assetFileInfoManager_, v9, v10, a4 != 1, a5);

  }
  return v6;
}

void sub_20CF9FEAC()
{
  uint64_t v0;

  sub_20CF9F4F4(*(void ***)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), &OBJC_IVAR___TPSUIAppController_attributedStringCache);
}

uint64_t sub_20CF9FED0()
{
  return swift_deallocObject();
}

uint64_t objectdestroy_8Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_20CF9FF10()
{
  uint64_t v0;

  sub_20CF9F4F4(*(void ***)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), &OBJC_IVAR___TPSUIAppController_footnoteAttributedStringCache);
}

uint64_t sub_20CF9FF34()
{
  return swift_deallocObject();
}

uint64_t sub_20CF9FF48()
{
  uint64_t v0;

  return sub_20CF9F868(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40), (uint64_t (*)(_BYTE *))sub_20CF8BC14);
}

uint64_t objectdestroy_27Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20CF9FFA4()
{
  uint64_t v0;

  return sub_20CF9F868(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40), (uint64_t (*)(_BYTE *))sub_20CF8BBC8);
}

uint64_t sub_20CF9FFC8@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR___TPSUIAppController_viewNavigationCollapsed);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_20CFA0018(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR___TPSUIAppController_viewNavigationCollapsed);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t method lookup function for TPSUIAppController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TPSUIAppController.viewNavigationCollapsed.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of TPSUIAppController.viewNavigationCollapsed.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of TPSUIAppController.viewNavigationCollapsed.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of TPSUIAppController.assetConfiguration(assets:language:sizeClass:style:assetFileInfoManager:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of TPSUIAppController.attributedStringForIdentifier(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of TPSUIAppController.footNoteAttributedStringForIdentifier(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of TPSUIAppController.updateAttributedString(_:forIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of TPSUIAppController.updateFootnoteAttributedString(_:forIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of TPSUIAppController.resetAttributedStringCache()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t sub_20CFA01AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_20CFCC9B0();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_20CFCC9BC();
}

uint64_t *sub_20CFA0270(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);

  v3 = a1;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 40) & (unint64_t)~v6) + *(_QWORD *)(v5 + 64) > 0x18)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v10 = (_OWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
    v11 = (_OWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
    *v10 = *v11;
    v12 = (_QWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
    v13 = (_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
    *v12 = *v13;
    v14 = ((unint64_t)v12 + v6 + 8) & ~v6;
    v15 = ((unint64_t)v13 + v6 + 8) & ~v6;
    v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v16(v14, v15, v4);
  }
  return v3;
}

_OWORD *sub_20CFA035C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  _OWORD *v4;
  _OWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  *a1 = *a2;
  v4 = (_OWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v5 = (_OWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v4 = *v5;
  v6 = (_QWORD *)(((unint64_t)v4 + 23) & 0xFFFFFFFFFFFFFFF8);
  v7 = (_QWORD *)(((unint64_t)v5 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v6 = *v7;
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 32))(((unint64_t)v6 + *(unsigned __int8 *)(v8 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), ((unint64_t)v7 + *(unsigned __int8 *)(v8 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

_OWORD *sub_20CFA03D4(_OWORD *a1, __int128 *a2, uint64_t a3)
{
  unint64_t v5;
  __int128 v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = *a2;
  v5 = (unint64_t)a2 + 23;
  *a1 = v6;
  v7 = (_QWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *(_QWORD *)(v5 & 0xFFFFFFFFFFFFFFF8);
  v7[1] = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFFF8) + 8);
  v8 = (_QWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  v9 = (_QWORD *)(((v5 & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8);
  *v8 = *v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v10 + 40))(((unint64_t)v8 + *(unsigned __int8 *)(v10 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), ((unint64_t)v9 + *(unsigned __int8 *)(v10 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  return a1;
}

uint64_t sub_20CFA046C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char v10;
  int v11;
  unsigned int v13;
  int v14;
  unint64_t *v15;
  unint64_t v16;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  v8 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_22;
  v9 = ((v7 + 40) & ~v7) + *(_QWORD *)(v4 + 64);
  v10 = 8 * v9;
  if (v9 <= 3)
  {
    v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      v11 = *(_DWORD *)(a1 + v9);
      if (!v11)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      v11 = *(unsigned __int16 *)(a1 + v9);
      if (!*(_WORD *)(a1 + v9))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_22:
      v15 = (unint64_t *)((((a1 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8);
      if ((v5 & 0x80000000) != 0)
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)v15 + v7 + 8) & ~v7);
      v16 = *v15;
      if (v16 >= 0xFFFFFFFF)
        LODWORD(v16) = -1;
      return (v16 + 1);
    }
  }
  v11 = *(unsigned __int8 *)(a1 + v9);
  if (!*(_BYTE *)(a1 + v9))
    goto LABEL_22;
LABEL_15:
  v14 = (v11 - 1) << v10;
  if (v9 > 3)
    v14 = 0;
  if (!(_DWORD)v9)
    return v6 + v14 + 1;
  if (v9 > 3)
    LODWORD(v9) = 4;
  return ((uint64_t (*)(void))((char *)&loc_20CFA0540 + 4 * byte_20CFD0100[(v9 - 1)]))();
}

void sub_20CFA05C0(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + *(_QWORD *)(v5 + 64);
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v10 = ((a3 - v6 + ~(-1 << (8 * v7))) >> (8 * v7)) + 1;
      if (HIWORD(v10))
      {
        v8 = 4u;
      }
      else if (v10 >= 0x100)
      {
        v8 = 2;
      }
      else
      {
        v8 = v10 > 1;
      }
    }
    else
    {
      v8 = 1u;
    }
  }
  else
  {
    v8 = 0;
  }
  if (v6 < a2)
  {
    v9 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        v11 = v9 & ~(-1 << (8 * v7));
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v11;
          *((_BYTE *)a1 + 2) = BYTE2(v11);
        }
        else if ((_DWORD)v7 == 2)
        {
          *a1 = v11;
        }
        else
        {
          *(_BYTE *)a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v7);
      *(_DWORD *)a1 = v9;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t sub_20CFA07C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];
  _QWORD v8[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC68F0);
  v2 = sub_20CFCC758();
  v3 = sub_20CFCC80C();
  v8[0] = sub_20CF8A13C();
  v8[1] = MEMORY[0x212B9AA54](MEMORY[0x24BDEB9D0], v2);
  MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v3, v8);
  v4 = sub_20CFCCCF8();
  v5 = sub_20CFCC9C8();
  v7[0] = v1;
  v7[1] = MEMORY[0x212B9AA54](MEMORY[0x24BDF4750], v4);
  return MEMORY[0x212B9AA54](MEMORY[0x24BDEF3E0], v5, v7);
}

uint64_t View.modify<A>(_:)(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;

  return a1(v1);
}

uint64_t View.when<A>(_:_:)@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  char v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v31;
  void (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];

  v37 = a8;
  v38 = a7;
  v36 = a6;
  v31 = a3;
  v32 = a2;
  v10 = a1;
  v33 = *(_QWORD *)(a4 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v31 - v15;
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v14);
  v21 = (char *)&v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v31 - v22;
  v24 = sub_20CFCC9C8();
  v35 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v31 - v25;
  if ((v10 & 1) != 0)
  {
    v32(v34);
    sub_20CF8A1A8((uint64_t)v21, a5, (uint64_t)v23);
    v27 = *(void (**)(char *, uint64_t))(v18 + 8);
    v27(v21, a5);
    sub_20CF8A734((uint64_t)v23, a5, (uint64_t)v21);
    v28 = v36;
    sub_20CFA01AC((uint64_t)v21, a5);
    v27(v21, a5);
    v27(v23, a5);
  }
  else
  {
    v28 = v36;
    sub_20CF8A1A8(v34, a4, (uint64_t)v16);
    sub_20CF8A734((uint64_t)v16, a4, (uint64_t)v13);
    sub_20CF8A74C((uint64_t)v13, a5, a4);
    v29 = *(void (**)(char *, uint64_t))(v33 + 8);
    v29(v13, a4);
    v29(v16, a4);
  }
  v39[0] = v38;
  v39[1] = v28;
  MEMORY[0x212B9AA54](MEMORY[0x24BDEF3E0], v24, v39);
  sub_20CF8A734((uint64_t)v26, v24, v37);
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v26, v24);
}

uint64_t sub_20CFA0B40(int8x16_t *a1)
{
  uint64_t v2;
  int8x16_t v4;

  v2 = sub_20CFCC9C8();
  v4 = vextq_s8(a1[1], a1[1], 8uLL);
  return MEMORY[0x212B9AA54](MEMORY[0x24BDEF3E0], v2, &v4);
}

uint64_t sub_20CFA0B90()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20CFA0C04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_20CF85310();
  v1 = v0 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader__state;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6880);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  sub_20CF8658C(v0 + OBJC_IVAR____TtC6TipsUI17RemoteImageLoader_url, &qword_253EC5F58);
  return swift_deallocClassInstance();
}

uint64_t sub_20CFA0C98()
{
  return type metadata accessor for RemoteImageLoader();
}

uint64_t sub_20CFA0CA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for RemoteImageLoader();
  result = sub_20CFCC5F0();
  *a1 = result;
  return result;
}

uint64_t sub_20CFA0CE4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_20CFA0D08(uint64_t a1, unint64_t a2)
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

uint64_t TPSSearchQueryClient.performQuery(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t sub_20CFA0D64()
{
  uint64_t v0;
  int8x16_t *v1;
  _QWORD *v2;

  v1 = (int8x16_t *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  v1[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  sub_20CFCCF08();
  *v2 = v0;
  v2[1] = sub_20CFA0E14;
  return sub_20CFCD448();
}

uint64_t sub_20CFA0E14()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20CFA0E80()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_20CFA0E8C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_20CFA0EC0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE70);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_20CFA112C;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20CFA117C;
  aBlock[3] = &block_descriptor_3;
  v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_performQuery_completion_, a3, v11);
  _Block_release(v11);
}

uint64_t sub_20CFA0FF8(void *a1, id a2)
{
  id v2;
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (a1)
  {
    v2 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE70);
    return sub_20CFCD1D8();
  }
  else
  {
    if (!a2)
    {
      v5 = sub_20CFCCE54();
      sub_20CFA11F0();
      swift_allocError();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(v6, *MEMORY[0x24BEB7A20], v5);
    }
    v7 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE70);
    return sub_20CFCD1CC();
  }
}

uint64_t sub_20CFA10C8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE70);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_20CFA112C(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE70);
  return sub_20CFA0FF8(a1, a2);
}

void sub_20CFA117C(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

unint64_t sub_20CFA11F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25499DE78;
  if (!qword_25499DE78)
  {
    v1 = sub_20CFCCE54();
    result = MEMORY[0x212B9AA54](MEMORY[0x24BEB7A30], v1);
    atomic_store(result, (unint64_t *)&qword_25499DE78);
  }
  return result;
}

char *sub_20CFA1238(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v7;
  uint64_t v8;
  void **v9;
  void **v10;
  int *v11;
  uint64_t v12;
  unsigned int (*v13)(void **, uint64_t, int *);
  char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v32;
  char *__dst;
  unsigned int (*v34)(char *, uint64_t, uint64_t);
  void *v35;
  uint64_t v36;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
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
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    a1[24] = *((_BYTE *)a2 + 24);
    v8 = *(int *)(a3 + 28);
    v9 = (void **)&a1[v8];
    v10 = (void **)((char *)a2 + v8);
    v11 = (int *)type metadata accessor for ConstellationContentAttributes(0);
    v12 = *((_QWORD *)v11 - 1);
    v13 = *(unsigned int (**)(void **, uint64_t, int *))(v12 + 48);
    v14 = v4;
    if (v13(v10, 1, v11))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      v16 = *v10;
      v17 = v10[1];
      *v9 = *v10;
      v9[1] = v17;
      v35 = v10[3];
      v36 = v12;
      v9[2] = v10[2];
      v9[3] = v35;
      v18 = *((_OWORD *)v10 + 3);
      *((_OWORD *)v9 + 2) = *((_OWORD *)v10 + 2);
      *((_OWORD *)v9 + 3) = v18;
      *((_OWORD *)v9 + 4) = *((_OWORD *)v10 + 4);
      *((_BYTE *)v9 + 80) = *((_BYTE *)v10 + 80);
      *((_BYTE *)v9 + 81) = *((_BYTE *)v10 + 81);
      *((_BYTE *)v9 + 82) = *((_BYTE *)v10 + 82);
      *(_OWORD *)(v9 + 11) = *(_OWORD *)(v10 + 11);
      v19 = v11[15];
      __dst = (char *)v9 + v19;
      v20 = (char *)v10 + v19;
      v21 = sub_20CFCC500();
      v32 = *(_QWORD *)(v21 - 8);
      v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48);
      v22 = v16;
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      if (v34(v20, 1, v21))
      {
        v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC69E8);
        memcpy(__dst, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v32 + 16))(__dst, v20, v21);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(__dst, 0, 1, v21);
      }
      v24 = v11[16];
      v25 = (char *)v9 + v24;
      v26 = (char *)v10 + v24;
      *(_QWORD *)v25 = *(_QWORD *)v26;
      v25[8] = v26[8];
      *((_BYTE *)v9 + v11[17]) = *((_BYTE *)v10 + v11[17]);
      (*(void (**)(void **, _QWORD, uint64_t, int *))(v36 + 56))(v9, 0, 1, v11);
    }
    v27 = *(int *)(a3 + 32);
    v28 = &v7[v27];
    v29 = (char **)((char *)a2 + v27);
    if (*v29)
    {
      v30 = v29[1];
      *(_QWORD *)v28 = *v29;
      *((_QWORD *)v28 + 1) = v30;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v28 = *(_OWORD *)v29;
    }
  }
  return v7;
}

uint64_t sub_20CFA1490(id *a1, uint64_t a2)
{
  id *v4;
  uint64_t v5;
  uint64_t result;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = (id *)((char *)a1 + *(int *)(a2 + 28));
  v5 = type metadata accessor for ConstellationContentAttributes(0);
  result = (*(uint64_t (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5);
  if (!(_DWORD)result)
  {

    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    v7 = (char *)v4 + *(int *)(v5 + 60);
    v8 = sub_20CFCC500();
    v9 = *(_QWORD *)(v8 - 8);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
    if (!(_DWORD)result)
      result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v7, v8);
  }
  if (*(id *)((char *)a1 + *(int *)(a2 + 32)))
    return swift_release();
  return result;
}

uint64_t sub_20CFA1580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v6;
  uint64_t v7;
  void **v8;
  void **v9;
  int *v10;
  uint64_t v11;
  unsigned int (*v12)(void **, uint64_t, int *);
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v32;
  unsigned int (*v33)(char *, uint64_t, uint64_t);
  char *__dst;
  uint64_t v35;
  uint64_t v36;

  v3 = a3;
  v6 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = *(int *)(a3 + 28);
  v8 = (void **)(a1 + v7);
  v9 = (void **)(a2 + v7);
  v10 = (int *)type metadata accessor for ConstellationContentAttributes(0);
  v11 = *((_QWORD *)v10 - 1);
  v12 = *(unsigned int (**)(void **, uint64_t, int *))(v11 + 48);
  v13 = v6;
  if (v12(v9, 1, v10))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    v35 = v11;
    v36 = v3;
    v15 = *v9;
    v16 = v9[1];
    *v8 = *v9;
    v8[1] = v16;
    v17 = v9[3];
    v8[2] = v9[2];
    v8[3] = v17;
    v18 = *((_OWORD *)v9 + 3);
    *((_OWORD *)v8 + 2) = *((_OWORD *)v9 + 2);
    *((_OWORD *)v8 + 3) = v18;
    *((_OWORD *)v8 + 4) = *((_OWORD *)v9 + 4);
    *((_BYTE *)v8 + 80) = *((_BYTE *)v9 + 80);
    *((_BYTE *)v8 + 81) = *((_BYTE *)v9 + 81);
    *((_BYTE *)v8 + 82) = *((_BYTE *)v9 + 82);
    *(_OWORD *)(v8 + 11) = *(_OWORD *)(v9 + 11);
    v19 = v10[15];
    __dst = (char *)v8 + v19;
    v20 = (char *)v9 + v19;
    v21 = sub_20CFCC500();
    v32 = *(_QWORD *)(v21 - 8);
    v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48);
    v22 = v15;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    if (v33(v20, 1, v21))
    {
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC69E8);
      memcpy(__dst, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v32 + 16))(__dst, v20, v21);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(__dst, 0, 1, v21);
    }
    v24 = v10[16];
    v25 = (char *)v8 + v24;
    v26 = (char *)v9 + v24;
    *(_QWORD *)v25 = *(_QWORD *)v26;
    v25[8] = v26[8];
    *((_BYTE *)v8 + v10[17]) = *((_BYTE *)v9 + v10[17]);
    (*(void (**)(void **, _QWORD, uint64_t, int *))(v35 + 56))(v8, 0, 1, v10);
    v3 = v36;
  }
  v27 = *(int *)(v3 + 32);
  v28 = (_QWORD *)(a1 + v27);
  v29 = (_QWORD *)(a2 + v27);
  if (*v29)
  {
    v30 = v29[1];
    *v28 = *v29;
    v28[1] = v30;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v28 = *(_OWORD *)v29;
  }
  return a1;
}

uint64_t sub_20CFA17BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, int *);
  int v15;
  int v16;
  void *v17;
  uint64_t v18;
  const void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(void *, uint64_t, uint64_t);
  int v33;
  size_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  unsigned int (*v53)(const void *, uint64_t, uint64_t);
  void *v54;
  void *__dst;
  uint64_t v56;
  uint64_t v57;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v9 = *(int *)(a3 + 28);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = (int *)type metadata accessor for ConstellationContentAttributes(0);
  v13 = *((_QWORD *)v12 - 1);
  v14 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (v16)
    {
      sub_20CF9CDBC(v10);
      goto LABEL_7;
    }
    v57 = a3;
    v24 = *(void **)v10;
    v25 = *(void **)v11;
    *(_QWORD *)v10 = *(_QWORD *)v11;
    v26 = v25;

    *(_QWORD *)(v10 + 8) = *(_QWORD *)(v11 + 8);
    swift_retain();
    swift_release();
    *(_QWORD *)(v10 + 16) = *(_QWORD *)(v11 + 16);
    swift_retain();
    swift_release();
    *(_QWORD *)(v10 + 24) = *(_QWORD *)(v11 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v10 + 32) = *(_QWORD *)(v11 + 32);
    *(_QWORD *)(v10 + 40) = *(_QWORD *)(v11 + 40);
    *(_QWORD *)(v10 + 48) = *(_QWORD *)(v11 + 48);
    *(_QWORD *)(v10 + 56) = *(_QWORD *)(v11 + 56);
    *(_QWORD *)(v10 + 64) = *(_QWORD *)(v11 + 64);
    *(_QWORD *)(v10 + 72) = *(_QWORD *)(v11 + 72);
    *(_BYTE *)(v10 + 80) = *(_BYTE *)(v11 + 80);
    *(_BYTE *)(v10 + 81) = *(_BYTE *)(v11 + 81);
    *(_BYTE *)(v10 + 82) = *(_BYTE *)(v11 + 82);
    *(_QWORD *)(v10 + 88) = *(_QWORD *)(v11 + 88);
    *(_QWORD *)(v10 + 96) = *(_QWORD *)(v11 + 96);
    v27 = v12[15];
    v28 = (void *)(v10 + v27);
    v29 = (void *)(v11 + v27);
    v30 = sub_20CFCC500();
    v31 = *(_QWORD *)(v30 - 8);
    v32 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v31 + 48);
    v54 = v28;
    LODWORD(v28) = v32(v28, 1, v30);
    v33 = v32(v29, 1, v30);
    if ((_DWORD)v28)
    {
      if (!v33)
      {
        (*(void (**)(void *, void *, uint64_t))(v31 + 16))(v54, v29, v30);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v54, 0, 1, v30);
        goto LABEL_18;
      }
      v34 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253EC69E8) - 8) + 64);
      v35 = v54;
    }
    else
    {
      if (!v33)
      {
        (*(void (**)(void *, void *, uint64_t))(v31 + 24))(v54, v29, v30);
        goto LABEL_18;
      }
      (*(void (**)(void *, uint64_t))(v31 + 8))(v54, v30);
      v34 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253EC69E8) - 8) + 64);
      v35 = v54;
    }
    memcpy(v35, v29, v34);
LABEL_18:
    v40 = v12[16];
    v41 = v10 + v40;
    v42 = (uint64_t *)(v11 + v40);
    v43 = *v42;
    *(_BYTE *)(v41 + 8) = *((_BYTE *)v42 + 8);
    *(_QWORD *)v41 = v43;
    *(_BYTE *)(v10 + v12[17]) = *(_BYTE *)(v11 + v12[17]);
    a3 = v57;
    goto LABEL_19;
  }
  if (v16)
  {
LABEL_7:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
    memcpy((void *)v10, (const void *)v11, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_19;
  }
  v56 = a3;
  v17 = *(void **)v11;
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *(_QWORD *)(v10 + 8) = *(_QWORD *)(v11 + 8);
  *(_QWORD *)(v10 + 16) = *(_QWORD *)(v11 + 16);
  *(_QWORD *)(v10 + 24) = *(_QWORD *)(v11 + 24);
  *(_OWORD *)(v10 + 32) = *(_OWORD *)(v11 + 32);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(v11 + 48);
  *(_QWORD *)(v10 + 64) = *(_QWORD *)(v11 + 64);
  *(_QWORD *)(v10 + 72) = *(_QWORD *)(v11 + 72);
  *(_BYTE *)(v10 + 80) = *(_BYTE *)(v11 + 80);
  *(_BYTE *)(v10 + 81) = *(_BYTE *)(v11 + 81);
  *(_BYTE *)(v10 + 82) = *(_BYTE *)(v11 + 82);
  *(_QWORD *)(v10 + 88) = *(_QWORD *)(v11 + 88);
  *(_QWORD *)(v10 + 96) = *(_QWORD *)(v11 + 96);
  v18 = v12[15];
  __dst = (void *)(v10 + v18);
  v19 = (const void *)(v11 + v18);
  v20 = sub_20CFCC500();
  v52 = *(_QWORD *)(v20 - 8);
  v53 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v52 + 48);
  v21 = v17;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  if (v53(v19, 1, v20))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC69E8);
    memcpy(__dst, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v52 + 16))(__dst, v19, v20);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v52 + 56))(__dst, 0, 1, v20);
  }
  a3 = v56;
  v36 = v12[16];
  v37 = v10 + v36;
  v38 = (uint64_t *)(v11 + v36);
  v39 = *v38;
  *(_BYTE *)(v37 + 8) = *((_BYTE *)v38 + 8);
  *(_QWORD *)v37 = v39;
  *(_BYTE *)(v10 + v12[17]) = *(_BYTE *)(v11 + v12[17]);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v13 + 56))(v10, 0, 1, v12);
LABEL_19:
  v44 = *(int *)(a3 + 32);
  v45 = (_QWORD *)(a1 + v44);
  v46 = (uint64_t *)(a2 + v44);
  v47 = *(_QWORD *)(a1 + v44);
  v48 = *v46;
  if (!v47)
  {
    if (v48)
    {
      v50 = v46[1];
      *v45 = v48;
      v45[1] = v50;
      swift_retain();
      return a1;
    }
LABEL_25:
    *(_OWORD *)v45 = *(_OWORD *)v46;
    return a1;
  }
  if (!v48)
  {
    swift_release();
    goto LABEL_25;
  }
  v49 = v46[1];
  *v45 = v48;
  v45[1] = v49;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_20CFA1C54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *__dst;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v6 = *(int *)(a3 + 28);
  v7 = (_OWORD *)(a1 + v6);
  v8 = (_OWORD *)(a2 + v6);
  v9 = (int *)type metadata accessor for ConstellationContentAttributes(0);
  v10 = *((_QWORD *)v9 - 1);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, int *))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    *v7 = *v8;
    *((_QWORD *)v7 + 2) = *((_QWORD *)v8 + 2);
    *(_OWORD *)((char *)v7 + 24) = *(_OWORD *)((char *)v8 + 24);
    *(_OWORD *)((char *)v7 + 40) = *(_OWORD *)((char *)v8 + 40);
    *((_QWORD *)v7 + 7) = *((_QWORD *)v8 + 7);
    v7[4] = v8[4];
    *((_BYTE *)v7 + 80) = *((_BYTE *)v8 + 80);
    *(_WORD *)((char *)v7 + 81) = *(_WORD *)((char *)v8 + 81);
    *(_OWORD *)((char *)v7 + 88) = *(_OWORD *)((char *)v8 + 88);
    v12 = v9[15];
    __dst = (char *)v7 + v12;
    v13 = (char *)v8 + v12;
    v14 = sub_20CFCC500();
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC69E8);
      memcpy(__dst, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(__dst, v13, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(__dst, 0, 1, v14);
    }
    v17 = v9[16];
    v18 = (char *)v7 + v17;
    v19 = (char *)v8 + v17;
    *(_QWORD *)v18 = *(_QWORD *)v19;
    v18[8] = v19[8];
    *((_BYTE *)v7 + v9[17]) = *((_BYTE *)v8 + v9[17]);
    (*(void (**)(_OWORD *, _QWORD, uint64_t, int *))(v10 + 56))(v7, 0, 1, v9);
  }
  v20 = *(int *)(a3 + 32);
  v21 = (_QWORD *)(a1 + v20);
  v22 = (uint64_t *)(a2 + v20);
  v23 = *v22;
  if (*v22)
  {
    v24 = v22[1];
    *v21 = v23;
    v21[1] = v24;
  }
  else
  {
    *(_OWORD *)v21 = *(_OWORD *)v22;
  }
  return a1;
}

uint64_t sub_20CFA1E4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, int *);
  int v13;
  int v14;
  uint64_t v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t (*v27)(void *, uint64_t, uint64_t);
  int v28;
  size_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  void *__dst;
  void *__dsta;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = *(int *)(a3 + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = (int *)type metadata accessor for ConstellationContentAttributes(0);
  v11 = *((_QWORD *)v10 - 1);
  v12 = *(uint64_t (**)(uint64_t, uint64_t, int *))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_20CF9CDBC(v8);
      goto LABEL_7;
    }
    v21 = *(void **)v8;
    *(_QWORD *)v8 = *(_QWORD *)v9;

    *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
    swift_release();
    *(_QWORD *)(v8 + 16) = *(_QWORD *)(v9 + 16);
    swift_release();
    *(_QWORD *)(v8 + 24) = *(_QWORD *)(v9 + 24);
    swift_bridgeObjectRelease();
    v22 = *(_OWORD *)(v9 + 48);
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v9 + 32);
    *(_OWORD *)(v8 + 48) = v22;
    *(_QWORD *)(v8 + 64) = *(_QWORD *)(v9 + 64);
    *(_QWORD *)(v8 + 72) = *(_QWORD *)(v9 + 72);
    *(_BYTE *)(v8 + 80) = *(_BYTE *)(v9 + 80);
    *(_BYTE *)(v8 + 81) = *(_BYTE *)(v9 + 81);
    *(_BYTE *)(v8 + 82) = *(_BYTE *)(v9 + 82);
    *(_OWORD *)(v8 + 88) = *(_OWORD *)(v9 + 88);
    v23 = v10[15];
    v24 = (void *)(v8 + v23);
    v25 = (void *)(v9 + v23);
    v26 = sub_20CFCC500();
    v45 = *(_QWORD *)(v26 - 8);
    v27 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v45 + 48);
    __dsta = v24;
    LODWORD(v24) = v27(v24, 1, v26);
    v28 = v27(v25, 1, v26);
    if ((_DWORD)v24)
    {
      if (!v28)
      {
        (*(void (**)(void *, void *, uint64_t))(v45 + 32))(__dsta, v25, v26);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v45 + 56))(__dsta, 0, 1, v26);
        goto LABEL_18;
      }
      v29 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253EC69E8) - 8) + 64);
      v30 = __dsta;
    }
    else
    {
      if (!v28)
      {
        (*(void (**)(void *, void *, uint64_t))(v45 + 40))(__dsta, v25, v26);
        goto LABEL_18;
      }
      (*(void (**)(void *, uint64_t))(v45 + 8))(__dsta, v26);
      v29 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253EC69E8) - 8) + 64);
      v30 = __dsta;
    }
    memcpy(v30, v25, v29);
LABEL_18:
    v34 = v10[16];
    v35 = v8 + v34;
    v36 = v9 + v34;
    *(_QWORD *)v35 = *(_QWORD *)v36;
    *(_BYTE *)(v35 + 8) = *(_BYTE *)(v36 + 8);
    *(_BYTE *)(v8 + v10[17]) = *(_BYTE *)(v9 + v10[17]);
    goto LABEL_19;
  }
  if (v14)
  {
LABEL_7:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
    memcpy((void *)v8, (const void *)v9, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_19;
  }
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v9 + 16);
  *(_OWORD *)(v8 + 24) = *(_OWORD *)(v9 + 24);
  *(_OWORD *)(v8 + 40) = *(_OWORD *)(v9 + 40);
  *(_QWORD *)(v8 + 56) = *(_QWORD *)(v9 + 56);
  *(_OWORD *)(v8 + 64) = *(_OWORD *)(v9 + 64);
  *(_BYTE *)(v8 + 80) = *(_BYTE *)(v9 + 80);
  *(_WORD *)(v8 + 81) = *(_WORD *)(v9 + 81);
  *(_OWORD *)(v8 + 88) = *(_OWORD *)(v9 + 88);
  v15 = v10[15];
  __dst = (void *)(v8 + v15);
  v16 = (const void *)(v9 + v15);
  v17 = sub_20CFCC500();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC69E8);
    memcpy(__dst, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v18 + 32))(__dst, v16, v17);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v18 + 56))(__dst, 0, 1, v17);
  }
  v31 = v10[16];
  v32 = v8 + v31;
  v33 = v9 + v31;
  *(_QWORD *)v32 = *(_QWORD *)v33;
  *(_BYTE *)(v32 + 8) = *(_BYTE *)(v33 + 8);
  *(_BYTE *)(v8 + v10[17]) = *(_BYTE *)(v9 + v10[17]);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
LABEL_19:
  v37 = *(int *)(a3 + 32);
  v38 = (_QWORD *)(a1 + v37);
  v39 = (uint64_t *)(a2 + v37);
  v40 = *(_QWORD *)(a1 + v37);
  v41 = *v39;
  if (!v40)
  {
    if (v41)
    {
      v43 = v39[1];
      *v38 = v41;
      v38[1] = v43;
      return a1;
    }
LABEL_25:
    *(_OWORD *)v38 = *(_OWORD *)v39;
    return a1;
  }
  if (!v41)
  {
    swift_release();
    goto LABEL_25;
  }
  v42 = v39[1];
  *v38 = v41;
  v38[1] = v42;
  swift_release();
  return a1;
}

uint64_t sub_20CFA2238()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CFA2244(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 28)], a2, v8);
  }
}

uint64_t sub_20CFA22C4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_20CFA22D0(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 28)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for AttributedTextView()
{
  uint64_t result;

  result = qword_253EC6A20;
  if (!qword_253EC6A20)
    return swift_getSingletonMetadata();
  return result;
}

void sub_20CFA2384()
{
  unint64_t v0;

  sub_20CFA2418();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_20CFA2418()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253EC6A90)
  {
    type metadata accessor for ConstellationContentAttributes(255);
    v0 = sub_20CFCD334();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253EC6A90);
  }
}

uint64_t sub_20CFA246C()
{
  return sub_20CF82E3C(&qword_253EC6A10, (uint64_t (*)(uint64_t))type metadata accessor for AttributedTextView, (uint64_t)&unk_20CFD0370);
}

id sub_20CFA2498()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v19 - v5;
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  LODWORD(v8) = 1132068864;
  objc_msgSend(v7, sel_setContentCompressionResistancePriority_forAxis_, 0, v8);
  LODWORD(v9) = 1144750080;
  objc_msgSend(v7, sel_setContentHuggingPriority_forAxis_, 1, v9);
  v10 = (void *)objc_opt_self();
  v11 = v7;
  v12 = objc_msgSend(v10, sel_clearColor);
  objc_msgSend(v11, sel_setBackgroundColor_, v12);

  v13 = v0 + *(int *)(type metadata accessor for AttributedTextView() + 28);
  sub_20CF865C8(v13, (uint64_t)v6, &qword_253EC6A88);
  v14 = type metadata accessor for ConstellationContentAttributes(0);
  v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48);
  if (v15(v6, 1, v14) == 1)
  {
    sub_20CF8658C((uint64_t)v6, &qword_253EC6A88);
    v16 = 0;
  }
  else
  {
    v16 = *((_QWORD *)v6 + 11);
    sub_20CF9CDBC((uint64_t)v6);
  }
  sub_20CF865C8(v13, (uint64_t)v4, &qword_253EC6A88);
  if (v15(v4, 1, v14) == 1)
  {
    sub_20CF8658C((uint64_t)v4, &qword_253EC6A88);
    v17 = 0;
  }
  else
  {
    v17 = *((_QWORD *)v4 + 12);
    sub_20CF9CDBC((uint64_t)v4);
  }
  objc_msgSend(v11, sel_setNumberOfLines_, v16);
  objc_msgSend(v11, sel_setLineBreakMode_, v17);
  return v11;
}

id sub_20CFA26C4(void *a1)
{
  uint64_t v1;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  double Width;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int (*v31)(char *, uint64_t, uint64_t);
  char *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
  void (*v47)(char *, char *, uint64_t);
  void (*v48)(char *, char *, uint64_t);
  void (*v49)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  CGRect v57;
  CGRect v58;

  v53 = sub_20CFCC5CC();
  MEMORY[0x24BDAC7A8](v53);
  v52 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC69F8);
  MEMORY[0x24BDAC7A8](v54);
  v55 = (uint64_t)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC69E8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v51 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v50 = (uint64_t)&v47 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v47 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v47 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v47 - v19;
  v21 = sub_20CFCC500();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v47 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v56 = (char *)&v47 - v26;
  objc_msgSend(a1, sel_frame);
  if (CGRectGetWidth(v57) == 0.0)
  {
    Width = *(double *)(v1 + 8);
  }
  else
  {
    objc_msgSend(a1, sel_frame);
    Width = CGRectGetWidth(v58);
  }
  v28 = a1;
  v29 = type metadata accessor for AttributedTextView();
  sub_20CF865C8(v1 + *(int *)(v29 + 28), (uint64_t)v7, &qword_253EC6A88);
  v30 = type metadata accessor for ConstellationContentAttributes(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 48))(v7, 1, v30) != 1)
  {
    sub_20CF865C8((uint64_t)&v7[*(int *)(v30 + 60)], (uint64_t)v20, &qword_253EC69E8);
    sub_20CF9CDBC((uint64_t)v7);
    v31 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
    if (v31(v20, 1, v21) == 1)
      goto LABEL_7;
    v33 = v56;
    v47 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
    v47(v56, v20, v21);
    v34 = objc_msgSend(v28, sel_traitCollection);
    MEMORY[0x212B9A244]();

    v48 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
    v48(v15, v33, v21);
    v49 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56);
    v49(v15, 0, 1, v21);
    v35 = v55;
    v36 = v55 + *(int *)(v54 + 48);
    sub_20CF865C8((uint64_t)v18, v55, &qword_253EC69E8);
    v37 = v35;
    sub_20CF865C8((uint64_t)v15, v36, &qword_253EC69E8);
    if (v31((char *)v35, 1, v21) == 1)
    {
      sub_20CF8658C((uint64_t)v15, &qword_253EC69E8);
      v37 = v55;
      sub_20CF8658C((uint64_t)v18, &qword_253EC69E8);
      if (v31((char *)v36, 1, v21) == 1)
      {
        sub_20CF8658C(v37, &qword_253EC69E8);
        (*(void (**)(char *, uint64_t))(v22 + 8))(v56, v21);
        return objc_msgSend(v28, sel_setPreferredMaxLayoutWidth_, Width);
      }
    }
    else
    {
      v38 = v35;
      v39 = v50;
      sub_20CF865C8(v38, v50, &qword_253EC69E8);
      if (v31((char *)v36, 1, v21) != 1)
      {
        v47(v25, (char *)v36, v21);
        sub_20CF82E3C(&qword_25499DE80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEE28], MEMORY[0x24BDCEE40]);
        v40 = sub_20CFCD0D0();
        v41 = v39;
        v42 = *(void (**)(char *, uint64_t))(v22 + 8);
        v42(v25, v21);
        sub_20CF8658C((uint64_t)v15, &qword_253EC69E8);
        sub_20CF8658C((uint64_t)v18, &qword_253EC69E8);
        v42((char *)v41, v21);
        sub_20CF8658C(v55, &qword_253EC69E8);
        if ((v40 & 1) != 0)
        {
          v42(v56, v21);
          return objc_msgSend(v28, sel_setPreferredMaxLayoutWidth_, Width);
        }
LABEL_17:
        v43 = v51;
        v44 = v56;
        v48(v51, v56, v21);
        v45 = ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v49)(v43, 0, 1, v21);
        v46 = v52;
        MEMORY[0x212B9A274](v45);
        sub_20CFCC5C0();
        MEMORY[0x212B9A280](v46);
        (*(void (**)(char *, uint64_t))(v22 + 8))(v44, v21);
        return objc_msgSend(v28, sel_setPreferredMaxLayoutWidth_, Width);
      }
      sub_20CF8658C((uint64_t)v15, &qword_253EC69E8);
      sub_20CF8658C((uint64_t)v18, &qword_253EC69E8);
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v39, v21);
    }
    sub_20CF8658C(v37, &qword_253EC69F8);
    goto LABEL_17;
  }
  sub_20CF8658C((uint64_t)v7, &qword_253EC6A88);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v20, 1, 1, v21);
LABEL_7:
  sub_20CF8658C((uint64_t)v20, &qword_253EC69E8);
  return objc_msgSend(v28, sel_setPreferredMaxLayoutWidth_, Width);
}

id sub_20CFA2C9C(void *a1)
{
  _QWORD *v1;

  objc_msgSend(a1, sel_setAttributedText_, *v1);
  return sub_20CFA26C4(a1);
}

uint64_t sub_20CFA2CCC()
{
  sub_20CF82E3C(&qword_253EC6A18, (uint64_t (*)(uint64_t))type metadata accessor for AttributedTextView, (uint64_t)&unk_20CFD02E0);
  return sub_20CFCC998();
}

uint64_t sub_20CFA2D34()
{
  sub_20CF82E3C(&qword_253EC6A18, (uint64_t (*)(uint64_t))type metadata accessor for AttributedTextView, (uint64_t)&unk_20CFD02E0);
  return sub_20CFCC944();
}

void sub_20CFA2D9C()
{
  sub_20CF82E3C(&qword_253EC6A18, (uint64_t (*)(uint64_t))type metadata accessor for AttributedTextView, (uint64_t)&unk_20CFD02E0);
  sub_20CFCC98C();
  __break(1u);
}

uint64_t ContentMessageView.init(with:maxWidth:additionalContext:)@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  unint64_t v20;
  const char *v21;

  v10 = sub_20CFCC50C();
  MEMORY[0x24BDAC7A8](v10);
  v11 = sub_20CFCD0E8();
  MEMORY[0x24BDAC7A8](v11);
  v12 = *a1;
  v13 = objc_msgSend((id)objc_opt_self(), sel_tipsUIFrameworkBundle);
  sub_20CFCD0DC();
  v14 = v13;
  sub_20CFCC4E8();
  v15 = sub_20CFCD124();
  v17 = v16;
  sub_20CFCD0DC();
  sub_20CFCC4E8();
  result = sub_20CFCD124();
  if (v12 == 2)
  {
    v20 = 0xD000000000000014;
    v21 = "bolt.horizontal.fill";
  }
  else
  {
    v20 = 0xD00000000000002BLL;
    v21 = "exclamationmark.arrow.triangle.2.circlepath";
  }
  *(_BYTE *)a4 = v12;
  *(_QWORD *)(a4 + 8) = v15;
  *(_QWORD *)(a4 + 16) = v17;
  *(_QWORD *)(a4 + 24) = result;
  *(_QWORD *)(a4 + 32) = v19;
  *(_QWORD *)(a4 + 40) = a2;
  *(_QWORD *)(a4 + 48) = a3;
  *(_QWORD *)(a4 + 56) = v20;
  *(_QWORD *)(a4 + 64) = (unint64_t)(v21 - 32) | 0x8000000000000000;
  *(double *)(a4 + 72) = a5;
  *(_QWORD *)(a4 + 80) = v13;
  return result;
}

uint64_t ContentMessageView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  __int128 v7;
  __int128 v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  _BYTE v14[16];
  _OWORD *v15;
  _OWORD *v16;
  _OWORD *v17;
  _OWORD v18[4];
  __int128 v19;
  uint64_t v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE88);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = *(_OWORD *)(v1 + 48);
  v18[2] = *(_OWORD *)(v1 + 32);
  v18[3] = v7;
  v19 = *(_OWORD *)(v1 + 64);
  v20 = *(_QWORD *)(v1 + 80);
  v8 = *(_OWORD *)(v1 + 16);
  v18[0] = *(_OWORD *)v1;
  v18[1] = v8;
  v17 = v18;
  v16 = v18;
  v15 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE98);
  sub_20CF88608(&qword_25499DEA0, &qword_25499DE90, MEMORY[0x24BDF41A8]);
  sub_20CFA35E8();
  sub_20CFCC9E0();
  v9 = *((double *)&v19 + 1);
  v10 = sub_20CFCCD4C();
  v12 = sub_20CFA36AC(0.0, 1, 0.0, 1, v9, 0, 0.0, 1, a1, 0.0, 1, INFINITY, 0, v10, v11, &qword_25499DE88, &qword_25499DEB8);
  return (*(uint64_t (**)(_BYTE *, uint64_t, __n128))(v4 + 8))(v6, v3, v12);
}

uint64_t sub_20CFA3228()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499DED8);
  sub_20CFA3DD4();
  return sub_20CFCCC98();
}

uint64_t sub_20CFA32A0()
{
  return sub_20CFA3228();
}

uint64_t sub_20CFA32A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  sub_20CF89020();
  swift_bridgeObjectRetain();
  v2 = sub_20CFCCB18();
  v4 = v3;
  v6 = v5 & 1;
  sub_20CFCCA64();
  v7 = sub_20CFCCB0C();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_release();
  sub_20CFA3DB4(v2, v4, v6);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v7;
  *(_QWORD *)(a1 + 8) = v9;
  *(_BYTE *)(a1 + 16) = v11 & 1;
  *(_QWORD *)(a1 + 24) = v13;
  return result;
}

uint64_t sub_20CFA3384@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t KeyPath;
  uint64_t v13;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DEF0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (uint64_t *)((char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_20CFCCC80();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CFA3E58(a1);
  swift_bridgeObjectRetain();
  v11 = sub_20CFCCC5C();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BDF40A8], v7);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v6 + *(int *)(v4 + 28), v10, v7);
  *v6 = KeyPath;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DED8);
  sub_20CFA3F5C((uint64_t)v6, (uint64_t)a2 + *(int *)(v13 + 36));
  *a2 = v11;
  swift_retain();
  sub_20CFA3FA4((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release();
  return sub_20CFA3FE4(a1);
}

uint64_t sub_20CFA34F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  sub_20CF89020();
  swift_bridgeObjectRetain();
  v2 = sub_20CFCCB18();
  v4 = v3;
  v6 = v5 & 1;
  v7 = sub_20CFCCB0C();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  sub_20CFA3DB4(v2, v4, v6);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v7;
  *(_QWORD *)(a1 + 8) = v9;
  *(_BYTE *)(a1 + 16) = v11 & 1;
  *(_QWORD *)(a1 + 24) = v13;
  return result;
}

uint64_t sub_20CFA35C8@<X0>(uint64_t a1@<X8>)
{
  return sub_20CFA34F8(a1);
}

void sub_20CFA35D0(BOOL *a1@<X8>)
{
  uint64_t v1;

  *a1 = **(_BYTE **)(v1 + 16) != 2;
}

unint64_t sub_20CFA35E8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_25499DEA8;
  if (!qword_25499DEA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499DE98);
    v2 = MEMORY[0x24BDF5138];
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25499DEA8);
  }
  return result;
}

uint64_t sub_20CFA3644()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_20CFA3654@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_20CFA36AC(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_25499DEC8, &qword_25499DED0).n128_u64[0];
  return result;
}

__n128 sub_20CFA36AC@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v17;
  uint64_t *v19;
  void *v28;
  uint64_t v29;
  _OWORD *v30;
  __n128 result;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __n128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v19 = a16;
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
    sub_20CFCD244();
    v28 = (void *)sub_20CFCCA34();
    sub_20CFCC5B4();

    v19 = a16;
  }
  sub_20CFCC830();
  v29 = __swift_instantiateConcreteTypeFromMangledName(v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(a9, v17, v29);
  v30 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(a17) + 36));
  v30[4] = v36;
  v30[5] = v37;
  v30[6] = v38;
  *v30 = v32;
  v30[1] = v33;
  result = v35;
  v30[2] = v34;
  v30[3] = v35;
  return result;
}

uint64_t sub_20CFA3888@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  __int128 v7;
  __int128 v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  _BYTE v14[16];
  _OWORD *v15;
  _OWORD *v16;
  _OWORD *v17;
  _OWORD v18[4];
  __int128 v19;
  uint64_t v20;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE88);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = *(_OWORD *)(v1 + 48);
  v18[2] = *(_OWORD *)(v1 + 32);
  v18[3] = v7;
  v19 = *(_OWORD *)(v1 + 64);
  v20 = *(_QWORD *)(v1 + 80);
  v8 = *(_OWORD *)(v1 + 16);
  v18[0] = *(_OWORD *)v1;
  v18[1] = v8;
  v17 = v18;
  v16 = v18;
  v15 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499DE98);
  sub_20CF88608(&qword_25499DEA0, &qword_25499DE90, MEMORY[0x24BDF41A8]);
  sub_20CFA35E8();
  sub_20CFCC9E0();
  v9 = *((double *)&v19 + 1);
  v10 = sub_20CFCCD4C();
  v12 = sub_20CFA36AC(0.0, 1, 0.0, 1, v9, 0, 0.0, 1, a1, 0.0, 1, INFINITY, 0, v10, v11, &qword_25499DE88, &qword_25499DEB8);
  return (*(uint64_t (**)(_BYTE *, uint64_t, __n128))(v4 + 8))(v6, v3, v12);
}

void destroy for ContentMessageView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for ContentMessageView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  v7 = *(void **)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = v7;
  return a1;
}

uint64_t assignWithCopy for ContentMessageView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v4 = *(void **)(a2 + 80);
  v5 = *(void **)(a1 + 80);
  *(_QWORD *)(a1 + 80) = v4;
  v6 = v4;

  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for ContentMessageView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v8 = *(void **)(a1 + 80);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);

  return a1;
}

uint64_t getEnumTagSinglePayload for ContentMessageView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContentMessageView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
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
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContentMessageView()
{
  return &type metadata for ContentMessageView;
}

unint64_t sub_20CFA3D30()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25499DEB0;
  if (!qword_25499DEB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499DEB8);
    v2[0] = sub_20CF88608(&qword_25499DEC0, &qword_25499DE88, MEMORY[0x24BDEFC28]);
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25499DEB0);
  }
  return result;
}

uint64_t sub_20CFA3DB4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_20CFA3DC4@<X0>(uint64_t a1@<X8>)
{
  return sub_20CFA32A8(a1);
}

uint64_t sub_20CFA3DCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_20CFA3384(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_20CFA3DD4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25499DEE0;
  if (!qword_25499DEE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499DED8);
    v2 = sub_20CF88608(&qword_25499DEE8, &qword_25499DEF0, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25499DEE0);
  }
  return result;
}

uint64_t sub_20CFA3E58(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20CFA3EBC()
{
  return sub_20CFCC854();
}

uint64_t sub_20CFA3EDC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_20CFCCC80();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_20CFCC860();
}

uint64_t sub_20CFA3F5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DEF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20CFA3FA4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DEF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20CFA3FE4(uint64_t a1)
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

BOOL static ContentMessageType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ContentMessageType.hash(into:)()
{
  return sub_20CFCD4C0();
}

uint64_t ContentMessageType.hashValue.getter()
{
  sub_20CFCD4B4();
  sub_20CFCD4C0();
  return sub_20CFCD4D8();
}

unint64_t sub_20CFA40DC()
{
  unint64_t result;

  result = qword_25499DEF8;
  if (!qword_25499DEF8)
  {
    result = MEMORY[0x212B9AA54](&protocol conformance descriptor for ContentMessageType, &type metadata for ContentMessageType);
    atomic_store(result, (unint64_t *)&qword_25499DEF8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ContentMessageType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ContentMessageType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20CFA41FC + 4 * byte_20CFD0475[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_20CFA4230 + 4 * byte_20CFD0470[v4]))();
}

uint64_t sub_20CFA4230(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CFA4238(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20CFA4240);
  return result;
}

uint64_t sub_20CFA424C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20CFA4254);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_20CFA4258(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CFA4260(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ContentMessageType()
{
  return &type metadata for ContentMessageType;
}

uint64_t ConstellationContentView.init(rawContent:language:assetsBaseURL:assetFileInfoManager:attributes:size:maxWidth:textIsSelectable:delegate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t *a9@<X8>, double a10@<D0>, double a11@<D1>, unsigned __int8 a12, uint64_t a13, uint64_t a14)
{
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  uint64_t result;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t *v47;

  v46 = a8;
  v40 = a6;
  v47 = a9;
  v44 = a7;
  v45 = a13;
  v43 = a14;
  v42 = a12;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v39 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ConstellationContentParser(0);
  swift_allocObject();
  sub_20CFAF3A4();
  sub_20CF82E3C(&qword_253EC6A60, type metadata accessor for ConstellationContentParser, (uint64_t)&unk_20CFD0958);
  v41 = sub_20CFCC7C4();
  v28 = v27;
  v29 = (_QWORD *)(v27 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_language);
  *v29 = a2;
  v29[1] = a3;
  swift_retain();
  swift_bridgeObjectRelease();
  sub_20CF865C8(a4, (uint64_t)v26, &qword_253EC5F58);
  v30 = v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetsBaseURL;
  swift_beginAccess();
  swift_retain();
  sub_20CFA46A8((uint64_t)v26, v30, &qword_253EC5F58);
  swift_endAccess();
  swift_release();
  v31 = *(void **)(v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetFileInfoManager);
  *(_QWORD *)(v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetFileInfoManager) = a5;
  v32 = a5;

  v33 = v40;
  sub_20CF865C8(v40, (uint64_t)v23, &qword_253EC6A88);
  v34 = v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes;
  swift_beginAccess();
  swift_retain();
  sub_20CFA46A8((uint64_t)v23, v34, &qword_253EC6A88);
  swift_endAccess();
  swift_release();
  v35 = (double *)(v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_viewSize);
  *v35 = a10;
  v35[1] = a11;
  v36 = v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_maxWidth;
  *(_QWORD *)v36 = v44;
  *(_BYTE *)(v36 + 8) = v46 & 1;
  *(_BYTE *)(v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_textIsSelectable) = v42;
  *(_QWORD *)(v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_delegate + 8) = v43;
  swift_unknownObjectWeakAssign();
  *(_QWORD *)(v28 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_rawContent) = a1;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_20CFAA6B8();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release_n();
  sub_20CF8658C(v33, &qword_253EC6A88);
  result = sub_20CF8658C(a4, &qword_253EC5F58);
  v38 = v47;
  *v47 = v41;
  v38[1] = v28;
  return result;
}

uint64_t ConstellationContentView.body.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_20CFCC668();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_20CFA4634()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_20CFCC668();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_20CFA46A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_20CFA46EC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  return swift_release();
}

uint64_t sub_20CFA4758(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v2 = type metadata accessor for AttributedTextView();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - v6;
  sub_20CFA49C4(a1, (uint64_t)&v9 - v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFA49C4((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  sub_20CFCC674();
  return sub_20CFA4A08((uint64_t)v7);
}

uint64_t sub_20CFA4840()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t dispatch thunk of ConstellationContentDelegate.constellationContentPersonalizedStringForID(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ConstellationContentDelegate.constellationContentLinkActivated(url:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

_QWORD *initializeBufferWithCopyOfBuffer for ConstellationContentView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for ConstellationContentView()
{
  return swift_release();
}

_QWORD *assignWithCopy for ConstellationContentView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for ConstellationContentView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ConstellationContentView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ConstellationContentView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ConstellationContentView()
{
  return &type metadata for ConstellationContentView;
}

uint64_t sub_20CFA4998()
{
  return sub_20CF82E3C(&qword_253EC6A10, (uint64_t (*)(uint64_t))type metadata accessor for AttributedTextView, (uint64_t)&unk_20CFD0370);
}

uint64_t sub_20CFA49C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AttributedTextView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20CFA4A08(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AttributedTextView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20CFA4A48()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_identifier);
  v2 = sub_20CFCD118();
  v4 = v3;

  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_contentModel);
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  v6 = (id *)(v5 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentTip);
  swift_beginAccess();
  if (*v6)
  {
    v7 = objc_msgSend(*v6, sel_identifier);
    v8 = sub_20CFCD118();
    v10 = v9;

    if (v2 == v8 && v4 == v10)
      v12 = 1;
    else
      v12 = sub_20CFCD430();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  swift_bridgeObjectRelease();
  return v12 & 1;
}

void sub_20CFA4BAC(void **a1, uint64_t *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;
  v5 = v2;

}

id sub_20CFA4C00()
{
  uint64_t v0;

  swift_beginAccess();
  return *(id *)(v0 + 16);
}

void sub_20CFA4C30(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;

}

uint64_t (*sub_20CFA4C74())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id TipViewModel.collection.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 24);
}

uint64_t sub_20CFA4CB8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_colorScheme;
  swift_beginAccess();
  v4 = sub_20CFCC728();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_20CFA4D20(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_20CFCC728();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = *a2 + OBJC_IVAR____TtC6TipsUI12TipViewModel_colorScheme;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_20CFA4DE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_colorScheme;
  swift_beginAccess();
  v4 = sub_20CFCC728();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_20CFA4E48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_colorScheme;
  swift_beginAccess();
  v4 = sub_20CFCC728();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_20CFA4EB4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id TipViewModel.contentModel.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_contentModel);
}

uint64_t sub_20CFA4F08()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_currentlyVisible);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_20CFA4F4C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_currentlyVisible);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_20CFA4F94())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFA4FD8()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_isPosterLoaded);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_20CFA501C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_isPosterLoaded);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_20CFA5064())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFA50A8()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_shouldLogAnimationFinished);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_20CFA50EC(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_shouldLogAnimationFinished);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_20CFA5134())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id TipViewModel.tip.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip);
}

uint64_t TipViewModel.__allocating_init(collection:tip:assetsInfo:contentModel:onNextHandler:)(void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;

  v12 = swift_allocObject();
  TipViewModel.init(collection:tip:assetsInfo:contentModel:onNextHandler:)(a1, a2, a3, a4, a5, a6);
  return v12;
}

uint64_t TipViewModel.init(collection:tip:assetsInfo:contentModel:onNextHandler:)(void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  id v24;
  id v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char isUniquelyReferenced_nonNull_native;
  char v34;
  unint64_t v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t v38;
  char v39;
  unint64_t v40;
  char v41;
  uint64_t *v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  uint64_t result;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;

  v7 = v6;
  v13 = (void *)*MEMORY[0x24BEB7E10];
  *(_QWORD *)(v7 + 16) = *MEMORY[0x24BEB7E10];
  v14 = v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_colorScheme;
  v15 = *MEMORY[0x24BDEB400];
  v16 = sub_20CFCC728();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v14, v15, v16);
  *(_BYTE *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_currentlyVisible) = 0;
  *(_BYTE *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_isPosterLoaded) = 0;
  *(_BYTE *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_shouldLogAnimationFinished) = 1;
  *(_QWORD *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tipIdentifiableIndexMap) = MEMORY[0x24BEE4B00];
  v17 = OBJC_IVAR____TtC6TipsUI12TipViewModel_assetsInfo;
  *(_QWORD *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_assetsInfo) = 0;
  *(_QWORD *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel____lazy_storage___assetViewModel) = 0;
  v18 = v13;
  sub_20CFCC548();
  *(_QWORD *)(v7 + 24) = a1;
  *(_QWORD *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip) = a2;
  v19 = *(void **)(v7 + v17);
  *(_QWORD *)(v7 + v17) = a3;
  v20 = a1;
  v21 = a2;
  v22 = a3;

  v23 = (uint64_t *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_onNextHandler);
  *v23 = a5;
  v23[1] = a6;
  *(_QWORD *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_contentModel) = a4;
  v51 = a5;
  sub_20CF8A8F4(a5);
  v24 = a4;
  v25 = objc_msgSend(v20, sel_tipIdentifiers);
  v26 = sub_20CFCD190();

  v27 = (_QWORD *)sub_20CF972A8(MEMORY[0x24BEE4AF8]);
  v28 = *(_QWORD *)(v26 + 16);
  if (!v28)
  {
LABEL_17:
    sub_20CF88FE0(v51);
    swift_bridgeObjectRelease();

    *(_QWORD *)(v7 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tipIdentifiableIndexMap) = v27;
    swift_bridgeObjectRelease();
    return v7;
  }
  v47 = v24;
  v48 = v22;
  v49 = v21;
  v50 = v20;
  swift_bridgeObjectRetain();
  v29 = (uint64_t *)(v26 + 40);
  while (1)
  {
    v30 = *(v29 - 1);
    v31 = *v29;
    v32 = v27[2];
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v35 = sub_20CFA6D2C(v30, v31);
    v36 = v27[2];
    v37 = (v34 & 1) == 0;
    v38 = v36 + v37;
    if (__OFADD__(v36, v37))
      break;
    v39 = v34;
    if (v27[3] >= v38)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v34 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        sub_20CFA7EDC();
        if ((v39 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_20CFA7570(v38, isUniquelyReferenced_nonNull_native);
      v40 = sub_20CFA6D2C(v30, v31);
      if ((v39 & 1) != (v41 & 1))
        goto LABEL_20;
      v35 = v40;
      if ((v39 & 1) != 0)
      {
LABEL_3:
        *(_QWORD *)(v27[7] + 8 * v35) = v32;
        goto LABEL_4;
      }
    }
    v27[(v35 >> 6) + 8] |= 1 << v35;
    v42 = (uint64_t *)(v27[6] + 16 * v35);
    *v42 = v30;
    v42[1] = v31;
    *(_QWORD *)(v27[7] + 8 * v35) = v32;
    v43 = v27[2];
    v44 = __OFADD__(v43, 1);
    v45 = v43 + 1;
    if (v44)
      goto LABEL_19;
    v27[2] = v45;
    swift_bridgeObjectRetain();
LABEL_4:
    v29 += 2;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!--v28)
    {
      swift_bridgeObjectRelease();
      v21 = v49;
      v20 = v50;
      v24 = v47;
      v22 = v48;
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  result = sub_20CFCD460();
  __break(1u);
  return result;
}

uint64_t sub_20CFA5574()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v1 = OBJC_IVAR____TtC6TipsUI12TipViewModel____lazy_storage___assetViewModel;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel____lazy_storage___assetViewModel))
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel____lazy_storage___assetViewModel);
  }
  else
  {
    v3 = v0;
    v4 = *(void **)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip);
    v5 = *(void **)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_assetsInfo);
    v6 = v4;
    if (v5)
      v7 = v5;
    else
      v7 = (void *)sub_20CFA57B0();
    v8 = *(void **)(v3 + OBJC_IVAR____TtC6TipsUI12TipViewModel_contentModel);
    type metadata accessor for DocumentAssetViewModel();
    swift_allocObject();
    v9 = v5;
    v2 = DocumentAssetViewModel.init(document:assetsInfo:contentModel:)(v4, v7, (char *)v8);
    *(_QWORD *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_20CFA565C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel____lazy_storage___assetViewModel) = a1;
  return swift_release();
}

uint64_t (*sub_20CFA5674(uint64_t *a1))(_QWORD *a1)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_20CFA5574();
  return sub_20CFA56A8;
}

uint64_t sub_20CFA56A8(_QWORD *a1)
{
  *(_QWORD *)(a1[1] + OBJC_IVAR____TtC6TipsUI12TipViewModel____lazy_storage___assetViewModel) = *a1;
  return swift_release();
}

id sub_20CFA56C0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id result;
  void *v5;
  void *v6;
  id v7;

  v0 = (void *)sub_20CFA57B0();
  sub_20CFCCF14();
  if (!v1)
  {
    sub_20CFCCF2C();
    v3 = v2;
    if (!v2)
      goto LABEL_6;
  }
  sub_20CF82934(0, (unint64_t *)&qword_253EC5F18);
  result = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  if (result)
  {
    v5 = result;
    v6 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    v7 = objc_msgSend(v5, sel_dataCacheForIdentifier_, v6);

    if (!v7)
      return 0;
    v3 = 1;
    v0 = v7;
LABEL_6:

    return (id)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_20CFA57B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v15;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25499EA60);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(void **)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip);
  v5 = objc_msgSend(v4, sel_fullContentAssets);
  v6 = sub_20CFCC728();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v3, 1, 1, v6);
  v7 = objc_msgSend(v4, sel_language);
  v8 = sub_20CFCD118();
  v10 = v9;

  v11 = objc_msgSend(v4, sel_assetFileInfoManager);
  v12 = sub_20CFC0954((uint64_t)v5, (uint64_t)v3, v8, v10, (uint64_t)v11);
  swift_bridgeObjectRelease();

  sub_20CFA8A34((uint64_t)v3);
  v13 = sub_20CFC2198(v12, 0);

  return v13;
}

void sub_20CFA590C(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  void (*v10)(_BYTE *, uint64_t, uint64_t);
  uint64_t v11;
  void (*v12)(uint64_t, _BYTE *, uint64_t);
  uint64_t v13;
  char v14;
  void *v15;
  _BYTE v16[24];

  v5 = sub_20CFCC728();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = *(_QWORD *)(v2 + OBJC_IVAR____TtC6TipsUI12TipViewModel_contentModel);
  v10 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16);
  v10(v8, a1, v5);
  v11 = v9 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
  swift_beginAccess();
  v12 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v6 + 40);
  v12(v11, v8, v5);
  swift_endAccess();
  v13 = v2 + OBJC_IVAR____TtC6TipsUI12TipViewModel_colorScheme;
  swift_beginAccess();
  v10(v8, v13, v5);
  v14 = sub_20CFCC71C();
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  if ((v14 & 1) == 0 || (a2 & 1) != 0)
  {
    v10(v8, a1, v5);
    swift_beginAccess();
    v12(v13, v8, v5);
    swift_endAccess();
    sub_20CFA5574();
    v15 = (void *)sub_20CFA57B0();
    sub_20CF9AD98((uint64_t)v15, a2 & 1);
    swift_release();

  }
}

uint64_t sub_20CFA5AA8()
{
  return sub_20CFA64F4((SEL *)&selRef_identifier);
}

uint64_t sub_20CFA5AB4()
{
  return sub_20CFA5F28((SEL *)&selRef_title);
}

id sub_20CFA5AC0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_isIntro);
}

id sub_20CFA5AE8()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_isOutro);
}

uint64_t sub_20CFA5B10()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_identifier);
  v2 = sub_20CFCD118();
  v4 = v3;

  v5 = (id *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_contentModel)
            + OBJC_IVAR____TtC6TipsUI16TipsContentModel_sharedVariantTip);
  swift_beginAccess();
  if (*v5)
  {
    v6 = objc_msgSend(*v5, sel_identifier);
    v7 = sub_20CFCD118();
    v9 = v8;

    if (v2 == v7 && v4 == v9)
      v11 = 1;
    else
      v11 = sub_20CFCD430();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_20CFA5C24()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*(id *)(v0 + 24), sel_identifier);
  v2 = sub_20CFCD118();

  return v2;
}

uint64_t sub_20CFA5C78()
{
  return sub_20CFA5C90((SEL *)&selRef_correlationID);
}

uint64_t sub_20CFA5C84()
{
  return sub_20CFA5C90((SEL *)&selRef_clientConditionID);
}

uint64_t sub_20CFA5C90(SEL *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), *a1);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_20CFCD118();

  return v4;
}

id sub_20CFA5CFC()
{
  uint64_t v0;
  id result;
  void *v2;
  id v3;

  result = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_fullContent);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, sel_labelStyle);

    return v3;
  }
  return result;
}

uint64_t sub_20CFA5D54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;

  v1 = sub_20CFCC50C();
  MEMORY[0x24BDAC7A8](v1);
  v2 = sub_20CFCD0E8();
  MEMORY[0x24BDAC7A8](v2);
  v3 = *(void **)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip);
  v4 = objc_msgSend(v3, sel_eyebrowText);
  if (v4)
  {

  }
  else if (objc_msgSend(v3, sel_isSiriSuggestion))
  {
    sub_20CFCD0DC();
    v5 = objc_msgSend((id)objc_opt_self(), sel_tipsUIFrameworkBundle);
    sub_20CFCC4E8();
    return sub_20CFCD124();
  }
  v7 = objc_msgSend(v3, sel_eyebrowText);
  if (!v7)
    return 0;
  v8 = v7;
  v6 = sub_20CFCD118();

  return v6;
}

id sub_20CFA5EF0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_assetFileInfoManager);
}

uint64_t sub_20CFA5F1C()
{
  return sub_20CFA5F28((SEL *)&selRef_bodyText);
}

uint64_t sub_20CFA5F28(SEL *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), *a1);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_20CFCD118();

  return v4;
}

uint64_t sub_20CFA5F94()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_bodyContent);
  if (!v1
    || (v2 = v1,
        __swift_instantiateConcreteTypeFromMangledName(&qword_25499DF28),
        v3 = sub_20CFCD190(),
        v2,
        v4 = sub_20CFA6050(v3),
        swift_bridgeObjectRelease(),
        !v4))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6B90);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_20CFCFD50;
    *(_QWORD *)(v4 + 32) = sub_20CF97020(MEMORY[0x24BEE4AF8]);
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_20CFA6050(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 16);
  v9 = MEMORY[0x24BEE4AF8];
  sub_20CFA88F8(0, v2, 0);
  v3 = v9;
  if (v2)
  {
    for (i = a1 + 32; ; i += 8)
    {
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25499DF28);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25499E228);
      if (!swift_dynamicCast())
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_20CFA88F8(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v9;
      }
      v6 = *(_QWORD *)(v3 + 16);
      v5 = *(_QWORD *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_20CFA88F8((_QWORD *)(v5 > 1), v6 + 1, 1);
        v3 = v9;
      }
      *(_QWORD *)(v3 + 16) = v6 + 1;
      *(_QWORD *)(v3 + 8 * v6 + 32) = v8;
      if (!--v2)
        return v3;
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_20CFA619C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip);
  v2 = objc_msgSend(v1, sel_bodyContent);
  if (v2)
  {

    return sub_20CFA5F94();
  }
  else
  {
    v4 = objc_msgSend(v1, sel_bodyText);
    if (v4)
    {
      v5 = v4;
      sub_20CFCD118();

    }
    v6 = (void *)objc_opt_self();
    v7 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    v8 = objc_msgSend(v6, sel_textContentWithText_, v7);

    __swift_instantiateConcreteTypeFromMangledName(&qword_25499DF30);
    v9 = sub_20CFCD190();

    v10 = sub_20CFA62CC(v9, &qword_25499DF30);
    swift_bridgeObjectRelease();
    return v10;
  }
}

uint64_t sub_20CFA62C0(uint64_t a1)
{
  return sub_20CFA62CC(a1, &qword_25499E220);
}

uint64_t sub_20CFA62CC(uint64_t a1, uint64_t *a2)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v11 = MEMORY[0x24BEE4AF8];
    sub_20CFA88F8(0, v2, 0);
    v6 = a1 + 32;
    v3 = v11;
    do
    {
      swift_bridgeObjectRetain_n();
      __swift_instantiateConcreteTypeFromMangledName(a2);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25499E228);
      swift_dynamicCast();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_20CFA88F8(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v11;
      }
      v8 = *(_QWORD *)(v3 + 16);
      v7 = *(_QWORD *)(v3 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_20CFA88F8((_QWORD *)(v7 > 1), v8 + 1, 1);
        v3 = v11;
      }
      *(_QWORD *)(v3 + 16) = v8 + 1;
      *(_QWORD *)(v3 + 8 * v8 + 32) = v10;
      v6 += 8;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_20CFA640C()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_fullContent);
  if (!v1)
    goto LABEL_4;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_footnoteContent);

  if (!v3
    || (__swift_instantiateConcreteTypeFromMangledName(&qword_25499DF28),
        v4 = sub_20CFCD190(),
        v3,
        v5 = sub_20CFA6050(v4),
        swift_bridgeObjectRelease(),
        !v5))
  {
LABEL_4:
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6B90);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_20CFCFD50;
    *(_QWORD *)(v5 + 32) = sub_20CF97020(MEMORY[0x24BEE4AF8]);
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t sub_20CFA64E8()
{
  return sub_20CFA64F4((SEL *)&selRef_language);
}

uint64_t sub_20CFA64F4(SEL *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), *a1);
  v3 = sub_20CFCD118();

  return v3;
}

uint64_t sub_20CFA6550@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_fullContentAssets);
  v4 = objc_msgSend(v3, sel_baseURL);

  if (v4)
  {
    sub_20CFCC44C();

    v5 = sub_20CFCC47C();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 0;
  }
  else
  {
    v5 = sub_20CFCC47C();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

uint64_t sub_20CFA6608()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_actions);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  v2 = v1;
  sub_20CF82934(0, &qword_25499DF38);
  v3 = sub_20CFCD190();

  return v3;
}

uint64_t sub_20CFA6684()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t result;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_identifier);
  v2 = sub_20CFCD118();
  v4 = v3;

  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tipIdentifiableIndexMap);
  if (*(_QWORD *)(v5 + 16))
  {
    swift_bridgeObjectRetain();
    v6 = sub_20CFA6D2C(v2, v4);
    if ((v7 & 1) != 0)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v8 = 0;
LABEL_7:
  result = v8 + 1;
  if (__OFADD__(v8, 1))
    __break(1u);
  return result;
}

uint64_t sub_20CFA6748()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tipIdentifiableIndexMap) + 16);
}

BOOL sub_20CFA675C()
{
  return sub_20CFA6774((SEL *)&selRef_bodyContent);
}

BOOL sub_20CFA6768()
{
  return sub_20CFA6774((SEL *)&selRef_footnoteContent);
}

BOOL sub_20CFA6774(SEL *a1)
{
  uint64_t v1;
  id v2;
  id v3;

  v2 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), *a1);
  v3 = v2;
  if (v2)

  return v3 != 0;
}

BOOL sub_20CFA67C0()
{
  uint64_t v0;

  return sub_20CFA6684() < *(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tipIdentifiableIndexMap)
                                     + 16);
}

void sub_20CFA67EC()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;

  v1 = *(void (**)(uint64_t))(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_onNextHandler);
  if (v1)
  {
    v2 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_identifier);
    v3 = sub_20CFCD118();
    v5 = v4;

    v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tipIdentifiableIndexMap);
    if (*(_QWORD *)(v6 + 16))
    {
      swift_bridgeObjectRetain();
      v7 = sub_20CFA6D2C(v3, v5);
      if ((v8 & 1) != 0)
      {
        v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    v9 = 0;
LABEL_8:
    if (__OFADD__(v9, 1))
      __break(1u);
    else
      v1(v9 + 1);
  }
}

uint64_t TipViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_colorScheme;
  v2 = sub_20CFCC728();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  sub_20CF88FE0(*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_onNextHandler));
  swift_bridgeObjectRelease();

  swift_release();
  v3 = v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel___observationRegistrar;
  v4 = sub_20CFCC554();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t TipViewModel.__deallocating_deinit()
{
  TipViewModel.deinit();
  return swift_deallocClassInstance();
}

void sub_20CFA69DC(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*(id *)(*v1 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip), sel_identifier);
  v4 = sub_20CFCD118();
  v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

Swift::String_optional __swiftcall TipViewModel.constellationContentPersonalizedStringForID(_:)(Swift::Int a1)
{
  uint64_t v1;
  void *v2;
  Swift::String_optional result;

  v1 = 0;
  v2 = 0;
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

void TipViewModel.constellationContentLinkActivated(url:)()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC6TipsUI12TipViewModel_tip);
  v2 = objc_msgSend(v1, sel_identifier);
  if (!v2)
  {
    sub_20CFCD118();
    v2 = (id)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
  }
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(*(id *)(v0 + 24), sel_identifier);
  sub_20CFCD118();

  v5 = (void *)sub_20CFCD0F4();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v1, sel_correlationID);
  v7 = objc_msgSend(v1, sel_clientConditionID);
  v8 = (void *)sub_20CFCC440();
  v9 = objc_msgSend(v3, sel_eventWithContentID_collectionID_correlationID_clientConditionID_url_, v2, v5, v6, v7, v8);

  objc_msgSend(v9, "log");
}

uint64_t sub_20CFA6BB4()
{
  return 0;
}

id sub_20CFA6BC4@<X0>(uint64_t *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3;
  void **v4;
  void *v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  v4 = (void **)(v3 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentTip);
  swift_beginAccess();
  v5 = *v4;
  *a2 = *v4;
  return v5;
}

void sub_20CFA6C70(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  v2 = v1;
  sub_20CFCC518();
  swift_release();

}

unint64_t sub_20CFA6D2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_20CFCD4B4();
  sub_20CFCD13C();
  v4 = sub_20CFCD4D8();
  return sub_20CFA6E98(a1, a2, v4);
}

unint64_t sub_20CFA6D90(uint64_t a1)
{
  uint64_t v2;

  sub_20CFCD118();
  sub_20CFCD4B4();
  sub_20CFCD13C();
  v2 = sub_20CFCD4D8();
  swift_bridgeObjectRelease();
  return sub_20CFA6F78(a1, v2);
}

unint64_t sub_20CFA6E10(uint64_t a1)
{
  uint64_t v2;

  sub_20CFCD4B4();
  type metadata accessor for CFString(0);
  sub_20CF82E3C(&qword_25499E238, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_20CFCEDF0);
  sub_20CFCC59C();
  v2 = sub_20CFCD4D8();
  return sub_20CFA70EC(a1, v2);
}

unint64_t sub_20CFA6E98(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_20CFCD430() & 1) == 0)
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
      while (!v14 && (sub_20CFCD430() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_20CFA6F78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_20CFCD118();
    v8 = v7;
    if (v6 == sub_20CFCD118() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_20CFCD430();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_20CFCD118();
          v15 = v14;
          if (v13 == sub_20CFCD118() && v15 == v16)
            break;
          v18 = sub_20CFCD430();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_20CFA70EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    type metadata accessor for CFString(0);
    v6 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * i);
    sub_20CF82E3C(&qword_25499E238, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_20CFCEDF0);
    v7 = v6;
    v8 = sub_20CFCC590();

    if ((v8 & 1) == 0)
    {
      v9 = ~v4;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v11 = sub_20CFCC590();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_20CFA722C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  _QWORD *v18;
  unint64_t v19;
  int64_t v20;
  void *v21;
  _OWORD *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  char v35;
  _OWORD v36[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499E230);
  v35 = a2;
  v6 = sub_20CFCD3F4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v34 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v33 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v16 = v15 | (v13 << 6);
      goto LABEL_22;
    }
    v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v17 >= v33)
      break;
    v18 = (_QWORD *)(v5 + 64);
    v19 = *(_QWORD *)(v34 + 8 * v17);
    ++v13;
    if (!v19)
    {
      v13 = v17 + 1;
      if (v17 + 1 >= v33)
        goto LABEL_34;
      v19 = *(_QWORD *)(v34 + 8 * v13);
      if (!v19)
      {
        v20 = v17 + 2;
        if (v20 >= v33)
        {
LABEL_34:
          swift_release();
          if ((v35 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v19 = *(_QWORD *)(v34 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            v13 = v20 + 1;
            if (__OFADD__(v20, 1))
              goto LABEL_43;
            if (v13 >= v33)
              goto LABEL_34;
            v19 = *(_QWORD *)(v34 + 8 * v13);
            ++v20;
            if (v19)
              goto LABEL_21;
          }
        }
        v13 = v20;
      }
    }
LABEL_21:
    v10 = (v19 - 1) & v19;
    v16 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_22:
    v21 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v16);
    v22 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v16);
    if ((v35 & 1) != 0)
    {
      sub_20CF97650(v22, v36);
    }
    else
    {
      sub_20CF98B2C((uint64_t)v22, (uint64_t)v36);
      v23 = v21;
    }
    sub_20CFCD118();
    sub_20CFCD4B4();
    sub_20CFCD13C();
    v24 = sub_20CFCD4D8();
    result = swift_bridgeObjectRelease();
    v25 = -1 << *(_BYTE *)(v7 + 32);
    v26 = v24 & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v30 = v27 == v29;
        if (v27 == v29)
          v27 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v11 + 8 * v27);
      }
      while (v31 == -1);
      v14 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v14) = v21;
    result = (uint64_t)sub_20CF97650(v36, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v18 = (_QWORD *)(v5 + 64);
  if ((v35 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v32 = 1 << *(_BYTE *)(v5 + 32);
  if (v32 >= 64)
    bzero(v18, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v18 = -1 << v32;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_20CFA7564(uint64_t a1, char a2)
{
  return sub_20CFA7BBC(a1, a2, &qword_253EC6B78);
}

uint64_t sub_20CFA7570(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499DDE0);
  v37 = a2;
  v6 = sub_20CFCD3F4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_20CFCD4B4();
    sub_20CFCD13C();
    result = sub_20CFCD4D8();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_20CFA7878(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  _QWORD *v18;
  unint64_t v19;
  int64_t v20;
  void *v21;
  _OWORD *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  char v35;
  _OWORD v36[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6B80);
  v35 = a2;
  v6 = sub_20CFCD3F4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v34 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v33 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v16 = v15 | (v13 << 6);
      goto LABEL_22;
    }
    v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v17 >= v33)
      break;
    v18 = (_QWORD *)(v5 + 64);
    v19 = *(_QWORD *)(v34 + 8 * v17);
    ++v13;
    if (!v19)
    {
      v13 = v17 + 1;
      if (v17 + 1 >= v33)
        goto LABEL_34;
      v19 = *(_QWORD *)(v34 + 8 * v13);
      if (!v19)
      {
        v20 = v17 + 2;
        if (v20 >= v33)
        {
LABEL_34:
          swift_release();
          if ((v35 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v19 = *(_QWORD *)(v34 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            v13 = v20 + 1;
            if (__OFADD__(v20, 1))
              goto LABEL_43;
            if (v13 >= v33)
              goto LABEL_34;
            v19 = *(_QWORD *)(v34 + 8 * v13);
            ++v20;
            if (v19)
              goto LABEL_21;
          }
        }
        v13 = v20;
      }
    }
LABEL_21:
    v10 = (v19 - 1) & v19;
    v16 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_22:
    v21 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v16);
    v22 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v16);
    if ((v35 & 1) != 0)
    {
      sub_20CF97650(v22, v36);
    }
    else
    {
      sub_20CF98B2C((uint64_t)v22, (uint64_t)v36);
      v23 = v21;
    }
    sub_20CFCD118();
    sub_20CFCD4B4();
    sub_20CFCD13C();
    v24 = sub_20CFCD4D8();
    result = swift_bridgeObjectRelease();
    v25 = -1 << *(_BYTE *)(v7 + 32);
    v26 = v24 & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v30 = v27 == v29;
        if (v27 == v29)
          v27 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v11 + 8 * v27);
      }
      while (v31 == -1);
      v14 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v14) = v21;
    result = (uint64_t)sub_20CF97650(v36, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v18 = (_QWORD *)(v5 + 64);
  if ((v35 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v32 = 1 << *(_BYTE *)(v5 + 32);
  if (v32 >= 64)
    bzero(v18, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v18 = -1 << v32;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_20CFA7BB0(uint64_t a1, char a2)
{
  return sub_20CFA7BBC(a1, a2, &qword_25499DDE8);
}

uint64_t sub_20CFA7BBC(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v39 = a2;
  v7 = sub_20CFCD3F4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v38 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_33;
      v24 = *(_QWORD *)(v38 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          v4 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v37)
              goto LABEL_33;
            v24 = *(_QWORD *)(v38 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(void **)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v34 = v33;
    }
    sub_20CFCD4B4();
    sub_20CFCD13C();
    result = sub_20CFCD4D8();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v4 = v36;
  v23 = (_QWORD *)(v6 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v6 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

id sub_20CFA7EC4()
{
  return sub_20CFA8588(&qword_25499E230);
}

id sub_20CFA7ED0()
{
  return sub_20CFA8750(&qword_253EC6B78);
}

void *sub_20CFA7EDC()
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
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499DDE0);
  v2 = *v0;
  v3 = sub_20CFCD3E8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = v19;
    v22[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_20CFA8088()
{
  return MEMORY[0x24BEE0D10];
}

id sub_20CFA8094@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(void **)(v3 + 16);
  *a2 = v4;
  return v4;
}

uint64_t sub_20CFA80E4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_5Tm(a1, &OBJC_IVAR____TtC6TipsUI12TipViewModel_currentlyVisible, a2);
}

uint64_t sub_20CFA80F0(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC6TipsUI12TipViewModel_currentlyVisible);
}

uint64_t sub_20CFA80FC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_5Tm(a1, &OBJC_IVAR____TtC6TipsUI12TipViewModel_isPosterLoaded, a2);
}

uint64_t sub_20CFA8108(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC6TipsUI12TipViewModel_isPosterLoaded);
}

uint64_t sub_20CFA8114@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return keypath_get_5Tm(a1, &OBJC_IVAR____TtC6TipsUI12TipViewModel_shouldLogAnimationFinished, a2);
}

uint64_t keypath_get_5Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _BYTE *a3@<X8>)
{
  _BYTE *v4;
  uint64_t result;

  v4 = (_BYTE *)(*a1 + *a2);
  result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_20CFA816C(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_6Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC6TipsUI12TipViewModel_shouldLogAnimationFinished);
}

uint64_t keypath_set_6Tm(char *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  char v5;
  _BYTE *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_BYTE *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

uint64_t sub_20CFA81C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_20CFA5574();
  *a1 = result;
  return result;
}

uint64_t sub_20CFA81E8(_QWORD *a1, _QWORD *a2)
{
  *(_QWORD *)(*a2 + OBJC_IVAR____TtC6TipsUI12TipViewModel____lazy_storage___assetViewModel) = *a1;
  swift_retain();
  return swift_release();
}

uint64_t sub_20CFA8220()
{
  return type metadata accessor for TipViewModel();
}

uint64_t type metadata accessor for TipViewModel()
{
  uint64_t result;

  result = qword_25499DF68;
  if (!qword_25499DF68)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20CFA8264()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_20CFCC728();
  if (v1 <= 0x3F)
  {
    result = sub_20CFCC554();
    if (v2 <= 0x3F)
      return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t method lookup function for TipViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TipViewModel.isCurrentTip.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of TipViewModel.animationSource.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of TipViewModel.animationSource.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of TipViewModel.animationSource.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of TipViewModel.colorScheme.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of TipViewModel.colorScheme.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of TipViewModel.colorScheme.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of TipViewModel.currentlyVisible.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of TipViewModel.currentlyVisible.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of TipViewModel.currentlyVisible.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of TipViewModel.isPosterLoaded.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of TipViewModel.isPosterLoaded.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of TipViewModel.isPosterLoaded.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of TipViewModel.shouldLogAnimationFinished.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of TipViewModel.shouldLogAnimationFinished.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of TipViewModel.shouldLogAnimationFinished.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of TipViewModel.__allocating_init(collection:tip:assetsInfo:contentModel:onNextHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 360))();
}

uint64_t dispatch thunk of TipViewModel.assetViewModel.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of TipViewModel.assetViewModel.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of TipViewModel.assetViewModel.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of TipViewModel.assetCacheAvailable()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of TipViewModel.colorSchemeUpdated(_:shouldReload:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of TipViewModel.id.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of TipViewModel.title.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of TipViewModel.isIntro.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of TipViewModel.isOutro.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of TipViewModel.isShowingSharedVariant.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t dispatch thunk of TipViewModel.identifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 456))();
}

uint64_t dispatch thunk of TipViewModel.collectionIdentifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 472))();
}

uint64_t dispatch thunk of TipViewModel.correlationID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 480))();
}

uint64_t dispatch thunk of TipViewModel.clientConditionID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 488))();
}

uint64_t dispatch thunk of TipViewModel.labelStyle.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 496))();
}

uint64_t dispatch thunk of TipViewModel.eyebrowText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 504))();
}

uint64_t dispatch thunk of TipViewModel.assetFileInfoManager.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 512))();
}

uint64_t dispatch thunk of TipViewModel.bodyText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 520))();
}

uint64_t dispatch thunk of TipViewModel.bodyContent.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 528))();
}

uint64_t dispatch thunk of TipViewModel.bodyContentOrText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 536))();
}

uint64_t dispatch thunk of TipViewModel.plainBodyContentOrText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 544))();
}

uint64_t dispatch thunk of TipViewModel.footnoteContent.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 552))();
}

uint64_t dispatch thunk of TipViewModel.language.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 560))();
}

uint64_t dispatch thunk of TipViewModel.assetsBaseURL.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 568))();
}

uint64_t dispatch thunk of TipViewModel.actions.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 576))();
}

uint64_t dispatch thunk of TipViewModel.currentPage.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 592))();
}

uint64_t dispatch thunk of TipViewModel.totalPageCount.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 600))();
}

uint64_t dispatch thunk of TipViewModel.hasBodyContent.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 608))();
}

uint64_t dispatch thunk of TipViewModel.hasFootnoteContent.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 616))();
}

uint64_t dispatch thunk of TipViewModel.hasMoreTips.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 624))();
}

uint64_t dispatch thunk of TipViewModel.selectNextTip()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 632))();
}

id sub_20CFA857C()
{
  return sub_20CFA8588(&qword_253EC6B80);
}

id sub_20CFA8588(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  _OWORD v23[2];

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_20CFCD3E8();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v20 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v14)
      goto LABEL_26;
    v21 = *(_QWORD *)(v7 + 8 * v20);
    ++v10;
    if (!v21)
    {
      v10 = v20 + 1;
      if (v20 + 1 >= v14)
        goto LABEL_26;
      v21 = *(_QWORD *)(v7 + 8 * v10);
      if (!v21)
        break;
    }
LABEL_25:
    v13 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(void **)(*(_QWORD *)(v3 + 48) + 8 * v16);
    v19 = 32 * v16;
    sub_20CF98B2C(*(_QWORD *)(v3 + 56) + 32 * v16, (uint64_t)v23);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    sub_20CF97650(v23, (_OWORD *)(*(_QWORD *)(v5 + 56) + v19));
    result = v18;
  }
  v22 = v20 + 2;
  if (v22 >= v14)
    goto LABEL_26;
  v21 = *(_QWORD *)(v7 + 8 * v22);
  if (v21)
  {
    v10 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v21 = *(_QWORD *)(v7 + 8 * v10);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_20CFA8744()
{
  return sub_20CFA8750(&qword_25499DDE8);
}

id sub_20CFA8750(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_20CFCD3E8();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(void **)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = v21;
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

_QWORD *sub_20CFA88F8(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_20CFA8914(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_20CFA8914(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6B90);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25499E228);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_20CFA8A34(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25499EA60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_20CFA8A74()
{
  uint64_t v0;

  sub_20CFBEDE4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

double sub_20CFA8A8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double result;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v0 = sub_20CFCCBD8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499E330);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_20CFD0730;
  v5 = *MEMORY[0x24BDF3C28];
  v6 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, v5, v0);
  MEMORY[0x212B99BCC](v3, 1.0, 0.8, 0.0, 1.0);
  *(_QWORD *)(v4 + 32) = sub_20CFCCD1C();
  *(_QWORD *)(v4 + 40) = v7;
  v6(v3, v5, v0);
  MEMORY[0x212B99BCC](v3, 1.0, 0.8, 0.0, 1.0);
  *(_QWORD *)(v4 + 48) = sub_20CFCCD1C();
  *(_QWORD *)(v4 + 56) = v8;
  v6(v3, v5, v0);
  MEMORY[0x212B99BCC](v3, 1.0, 0.658823529, 0.0, 1.0);
  *(_QWORD *)(v4 + 64) = sub_20CFCCD1C();
  *(_QWORD *)(v4 + 72) = v9;
  MEMORY[0x212B99CC8](v4);
  sub_20CFCCD88();
  sub_20CFCCD7C();
  sub_20CFCC7B8();
  result = *(double *)&v12;
  xmmword_25499E240 = v12;
  *(_OWORD *)algn_25499E250 = v13;
  qword_25499E260 = v14;
  return result;
}

uint64_t static AppGradient.tipHeroGradient.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_25499DBD8 != -1)
    swift_once();
  *(_QWORD *)a1 = xmmword_25499E240;
  *(_OWORD *)(a1 + 8) = *(__int128 *)((char *)&xmmword_25499E240 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)&algn_25499E250[8];
  return swift_bridgeObjectRetain();
}

double sub_20CFA8CA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t, uint64_t);
  double result;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v0 = sub_20CFCCBD8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6980);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_20CFD00F0;
  v5 = *MEMORY[0x24BDF3C28];
  v6 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, v5, v0);
  *(_QWORD *)(v4 + 32) = MEMORY[0x212B99BCC](v3, 1.0, 1.0, 0.22745098, 1.0);
  v6(v3, v5, v0);
  *(_QWORD *)(v4 + 40) = MEMORY[0x212B99BCC](v3, 1.0, 1.0, 0.776470588, 1.0);
  *(_QWORD *)&v9 = v4;
  sub_20CFCD19C();
  MEMORY[0x212B99CD4](v9);
  sub_20CFCCD70();
  sub_20CFCCD94();
  sub_20CFCC7B8();
  result = *(double *)&v9;
  xmmword_25499E268 = v9;
  unk_25499E278 = v10;
  qword_25499E288 = v11;
  return result;
}

uint64_t static AppGradient.tipCountGradient.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_25499DBE0 != -1)
    swift_once();
  *(_QWORD *)a1 = xmmword_25499E268;
  *(_OWORD *)(a1 + 8) = *(__int128 *)((char *)&xmmword_25499E268 + 8);
  *(_OWORD *)(a1 + 24) = unk_25499E280;
  return swift_bridgeObjectRetain();
}

double sub_20CFA8E74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double result;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v0 = sub_20CFCCBD8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499E330);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_20CFD0730;
  v5 = *MEMORY[0x24BDF3C28];
  v6 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, v5, v0);
  MEMORY[0x212B99BCC](v3, 0.670588235, 0.392156863, 0.0, 1.0);
  *(_QWORD *)(v4 + 32) = sub_20CFCCD1C();
  *(_QWORD *)(v4 + 40) = v7;
  v6(v3, v5, v0);
  MEMORY[0x212B99BCC](v3, 0.670588235, 0.392156863, 0.0, 1.0);
  *(_QWORD *)(v4 + 48) = sub_20CFCCD1C();
  *(_QWORD *)(v4 + 56) = v8;
  v6(v3, v5, v0);
  MEMORY[0x212B99BCC](v3, 1.0, 0.8, 0.0, 1.0);
  *(_QWORD *)(v4 + 64) = sub_20CFCCD1C();
  *(_QWORD *)(v4 + 72) = v9;
  MEMORY[0x212B99CC8](v4);
  sub_20CFCCD88();
  sub_20CFCCD7C();
  sub_20CFCC7B8();
  result = *(double *)&v12;
  xmmword_25499E290 = v12;
  unk_25499E2A0 = v13;
  qword_25499E2B0 = v14;
  return result;
}

uint64_t static AppGradient.tipHeroIncreaseContrastGradient.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_25499DBE8 != -1)
    swift_once();
  *(_QWORD *)a1 = xmmword_25499E290;
  *(_OWORD *)(a1 + 8) = *(__int128 *)((char *)&xmmword_25499E290 + 8);
  *(_OWORD *)(a1 + 24) = unk_25499E2A8;
  return swift_bridgeObjectRetain();
}

double sub_20CFA9098()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  double result;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v0 = sub_20CFCCBD8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499E330);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_20CFD00F0;
  v5 = *MEMORY[0x24BDF3C28];
  v6 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, v5, v0);
  MEMORY[0x212B99BCC](v3, 1.0, 1.0, 1.0, 1.0);
  *(_QWORD *)(v4 + 32) = sub_20CFCCD1C();
  *(_QWORD *)(v4 + 40) = v7;
  v6(v3, v5, v0);
  MEMORY[0x212B99BCC](v3, 1.0, 1.0, 1.0, 0.1);
  *(_QWORD *)(v4 + 48) = sub_20CFCCD1C();
  *(_QWORD *)(v4 + 56) = v8;
  MEMORY[0x212B99CC8](v4);
  sub_20CFCCD88();
  sub_20CFCCD7C();
  sub_20CFCC7B8();
  result = *(double *)&v11;
  xmmword_25499E2B8 = v11;
  unk_25499E2C8 = v12;
  qword_25499E2D8 = v13;
  return result;
}

uint64_t static AppGradient.translucentBlendingGradient.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_25499DBF0 != -1)
    swift_once();
  *(_QWORD *)a1 = xmmword_25499E2B8;
  *(_OWORD *)(a1 + 8) = *(__int128 *)((char *)&xmmword_25499E2B8 + 8);
  *(_OWORD *)(a1 + 24) = unk_25499E2D0;
  return swift_bridgeObjectRetain();
}

double sub_20CFA926C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t, uint64_t);
  double result;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v0 = sub_20CFCCBD8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6980);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_20CFD00F0;
  v5 = *MEMORY[0x24BDF3C28];
  v6 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, v5, v0);
  *(_QWORD *)(v4 + 32) = MEMORY[0x212B99BCC](v3, 0.0, 0.478431373, 1.0, 1.0);
  v6(v3, v5, v0);
  *(_QWORD *)(v4 + 40) = MEMORY[0x212B99BCC](v3, 1.0, 0.176470588, 0.333333333, 1.0);
  *(_QWORD *)&v9 = v4;
  sub_20CFCD19C();
  MEMORY[0x212B99CD4](v9);
  sub_20CFCCD88();
  sub_20CFCCD7C();
  sub_20CFCC7B8();
  result = *(double *)&v9;
  xmmword_25499E2E0 = v9;
  *(_OWORD *)algn_25499E2F0 = v10;
  qword_25499E300 = v11;
  return result;
}

uint64_t static AppGradient.eyebrowGradientLayer1.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_25499DBF8 != -1)
    swift_once();
  *(_QWORD *)a1 = xmmword_25499E2E0;
  *(_OWORD *)(a1 + 8) = *(__int128 *)((char *)&xmmword_25499E2E0 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)&algn_25499E2F0[8];
  return swift_bridgeObjectRetain();
}

double sub_20CFA9440()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t, uint64_t);
  double result;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v0 = sub_20CFCCBD8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6980);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_20CFD00F0;
  v5 = *MEMORY[0x24BDF3C28];
  v6 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v6(v3, v5, v0);
  *(_QWORD *)(v4 + 32) = sub_20CFCCC38();
  v6(v3, v5, v0);
  *(_QWORD *)(v4 + 40) = sub_20CFCCC38();
  *(_QWORD *)&v9 = v4;
  sub_20CFCD19C();
  MEMORY[0x212B99CD4](v9);
  sub_20CFCCD70();
  sub_20CFCCDA0();
  sub_20CFCC7B8();
  result = *(double *)&v9;
  xmmword_25499E308 = v9;
  unk_25499E318 = v10;
  qword_25499E328 = v11;
  return result;
}

uint64_t static AppGradient.eyebrowGradientLayer2.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_25499DC00 != -1)
    swift_once();
  *(_QWORD *)a1 = xmmword_25499E308;
  *(_OWORD *)(a1 + 8) = *(__int128 *)((char *)&xmmword_25499E308 + 8);
  *(_OWORD *)(a1 + 24) = unk_25499E320;
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for AppGradient()
{
  return &type metadata for AppGradient;
}

double defaultParagraphSpacing.getter()
{
  return 10.0;
}

BOOL static ConstellationContentParagraphStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ConstellationContentParagraphStyle.hash(into:)()
{
  return sub_20CFCD4C0();
}

uint64_t ConstellationContentParagraphStyle.hashValue.getter()
{
  sub_20CFCD4B4();
  sub_20CFCD4C0();
  return sub_20CFCD4D8();
}

BOOL sub_20CFA9698(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ConstellationContentAttributes.init(font:foregroundColor:accentColor:titleGradientStyle:textAlignment:paragraphSpacing:paragraphStyle:numberOfLines:lineBreakMode:symbolScale:useForegroundColorForSymbol:displayLinkStyle:typeSettingLanguage:supportsLinks:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, uint64_t a11, char a12, char a13, char a14, uint64_t a15, char a16)
{
  char v21;
  int *v22;
  uint64_t result;
  uint64_t v24;

  v21 = *a6;
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  sub_20CFAFDF8(a4, a9 + 24, &qword_253EC6AC8);
  *(_QWORD *)(a9 + 64) = a5;
  *(double *)(a9 + 72) = a10;
  *(_BYTE *)(a9 + 80) = v21;
  *(_QWORD *)(a9 + 88) = a7;
  *(_QWORD *)(a9 + 96) = a8;
  v22 = (int *)type metadata accessor for ConstellationContentAttributes(0);
  result = sub_20CFAFDF8(a15, a9 + v22[15], &qword_253EC69E8);
  v24 = a9 + v22[16];
  *(_QWORD *)v24 = a11;
  *(_BYTE *)(v24 + 8) = a12 & 1;
  *(_BYTE *)(a9 + v22[17]) = a13;
  *(_BYTE *)(a9 + 81) = a14;
  *(_BYTE *)(a9 + 82) = a16;
  return result;
}

uint64_t type metadata accessor for ConstellationContentAttributes(uint64_t a1)
{
  return sub_20CFAA534(a1, (uint64_t *)&unk_253EC6A78);
}

unint64_t sub_20CFA97BC()
{
  unint64_t result;

  result = qword_25499E338;
  if (!qword_25499E338)
  {
    result = MEMORY[0x212B9AA54](&protocol conformance descriptor for ConstellationContentParagraphStyle, &type metadata for ConstellationContentParagraphStyle);
    atomic_store(result, (unint64_t *)&qword_25499E338);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ConstellationContentParagraphStyle(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ConstellationContentParagraphStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20CFA98DC + 4 * byte_20CFD07A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20CFA9910 + 4 * asc_20CFD07A0[v4]))();
}

uint64_t sub_20CFA9910(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CFA9918(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20CFA9920);
  return result;
}

uint64_t sub_20CFA992C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20CFA9934);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20CFA9938(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CFA9940(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_20CFA994C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ConstellationContentParagraphStyle()
{
  return &type metadata for ConstellationContentParagraphStyle;
}

char *initializeBufferWithCopyOfBuffer for ConstellationContentAttributes(char *a1, char **a2, int *a3)
{
  int v3;
  char *v4;
  char *v7;
  char *v8;
  __int128 v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  char *__dst;

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
    v8 = a2[2];
    *((_QWORD *)a1 + 1) = a2[1];
    *((_QWORD *)a1 + 2) = v8;
    *((_QWORD *)a1 + 3) = a2[3];
    v9 = *((_OWORD *)a2 + 3);
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    *((_OWORD *)a1 + 3) = v9;
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
    a1[80] = *((_BYTE *)a2 + 80);
    *(_WORD *)(a1 + 81) = *(_WORD *)((char *)a2 + 81);
    v10 = a3[15];
    __dst = &a1[v10];
    v11 = (char *)a2 + v10;
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 11);
    v12 = sub_20CFCC500();
    v13 = *(_QWORD *)(v12 - 8);
    v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    v14 = v4;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    if (v21(v11, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC69E8);
      memcpy(__dst, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    v16 = a3[16];
    v17 = a3[17];
    v18 = &v7[v16];
    v19 = (uint64_t)a2 + v16;
    *(_QWORD *)v18 = *(_QWORD *)v19;
    v18[8] = *(_BYTE *)(v19 + 8);
    v7[v17] = *((_BYTE *)a2 + v17);
  }
  return v7;
}

uint64_t destroy for ConstellationContentAttributes(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v4 = (char *)a1 + *(int *)(a2 + 60);
  v5 = sub_20CFCC500();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

uint64_t initializeWithCopy for ConstellationContentAttributes(uint64_t a1, uint64_t a2, int *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *__dst;

  v5 = *(void **)a2;
  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v8;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_BYTE *)(a1 + 81) = *(_BYTE *)(a2 + 81);
  *(_BYTE *)(a1 + 82) = *(_BYTE *)(a2 + 82);
  v9 = a3[15];
  __dst = (void *)(a1 + v9);
  v10 = (const void *)(a2 + v9);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  v11 = sub_20CFCC500();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v5;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  if (v13(v10, 1, v11))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC69E8);
    memcpy(__dst, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(__dst, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
  }
  v16 = a3[16];
  v17 = a3[17];
  v18 = a1 + v16;
  v19 = a2 + v16;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  *(_BYTE *)(a1 + v17) = *(_BYTE *)(a2 + v17);
  return a1;
}

uint64_t assignWithCopy for ConstellationContentAttributes(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
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
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_BYTE *)(a1 + 81) = *(_BYTE *)(a2 + 81);
  *(_BYTE *)(a1 + 82) = *(_BYTE *)(a2 + 82);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v9 = a3[15];
  v10 = (void *)(a1 + v9);
  v11 = (void *)(a2 + v9);
  v12 = sub_20CFCC500();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 24))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC69E8);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  v18 = a3[16];
  v19 = a1 + v18;
  v20 = (uint64_t *)(a2 + v18);
  v21 = *v20;
  *(_BYTE *)(v19 + 8) = *((_BYTE *)v20 + 8);
  *(_QWORD *)v19 = v21;
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  return a1;
}

uint64_t initializeWithTake for ConstellationContentAttributes(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_WORD *)(a1 + 81) = *(_WORD *)(a2 + 81);
  v6 = a3[15];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  v9 = sub_20CFCC500();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC69E8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[16];
  v13 = a3[17];
  v14 = a1 + v12;
  v15 = a2 + v12;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *(_BYTE *)(v14 + 8) = *(_BYTE *)(v15 + 8);
  *(_BYTE *)(a1 + v13) = *(_BYTE *)(a2 + v13);
  return a1;
}

uint64_t assignWithTake for ConstellationContentAttributes(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_BYTE *)(a1 + 81) = *(_BYTE *)(a2 + 81);
  *(_BYTE *)(a1 + 82) = *(_BYTE *)(a2 + 82);
  v8 = a3[15];
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  v11 = sub_20CFCC500();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC69E8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  v17 = a3[16];
  v18 = a3[17];
  v19 = a1 + v17;
  v20 = a2 + v17;
  *(_QWORD *)v19 = *(_QWORD *)v20;
  *(_BYTE *)(v19 + 8) = *(_BYTE *)(v20 + 8);
  *(_BYTE *)(a1 + v18) = *(_BYTE *)(a2 + v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for ConstellationContentAttributes()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CFAA1BC(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC69E8);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 60)], a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for ConstellationContentAttributes()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_20CFAA254(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC69E8);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 60)], a2, a2, v7);
  }
  return result;
}

void sub_20CFAA2CC()
{
  unint64_t v0;

  sub_20CFAEBB0(319, &qword_253EC69F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEE28], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_20CFAA39C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  return swift_release();
}

uint64_t sub_20CFAA400()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_20CFAA8E8();
  v1 = v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser__bodyText;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A98);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  sub_20CF8658C(v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetsBaseURL, &qword_253EC5F58);
  sub_20CF8658C(v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes, &qword_253EC6A88);

  swift_bridgeObjectRelease();
  sub_20CFAFD60(v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_20CFAA4F4()
{
  sub_20CFAA400();
  return swift_deallocClassInstance();
}

uint64_t sub_20CFAA518()
{
  return type metadata accessor for ConstellationContentParser(0);
}

uint64_t type metadata accessor for ConstellationContentParser(uint64_t a1)
{
  return sub_20CFAA534(a1, (uint64_t *)&unk_253EC6A68);
}

uint64_t sub_20CFAA534(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_20CFAA568()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_20CFAEBB0(319, &qword_253EC6AA0, (uint64_t (*)(uint64_t))type metadata accessor for AttributedTextView, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  if (v0 <= 0x3F)
  {
    sub_20CFAEBB0(319, (unint64_t *)&qword_253EC5F60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    if (v1 <= 0x3F)
    {
      sub_20CFAEBB0(319, (unint64_t *)&qword_253EC6A90, type metadata accessor for ConstellationContentAttributes, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

void sub_20CFAA6B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t (**v20)(uint64_t);
  id v21;
  uint64_t v22;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for AttributedTextView();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v22 - v8;
  v10 = swift_bridgeObjectRetain();
  v11 = sub_20CFAAAC4(v10);
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_viewSize);
  v13 = *(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_viewSize + 8);
  v14 = *(_BYTE *)(v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_textIsSelectable);
  v15 = v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes;
  swift_beginAccess();
  sub_20CF865C8(v15, (uint64_t)v3, &qword_253EC6A88);
  v16 = v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_delegate;
  v17 = (uint64_t (*)(uint64_t))MEMORY[0x212B9AB8C](v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_delegate);
  if (v17)
  {
    v18 = *(_QWORD *)(v16 + 8);
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = v17;
    *(_QWORD *)(v19 + 24) = v18;
    v17 = sub_20CFAFDB0;
  }
  else
  {
    v19 = 0;
  }
  *(_QWORD *)v9 = v11;
  *((_QWORD *)v9 + 1) = v12;
  *((_QWORD *)v9 + 2) = v13;
  v9[24] = v14;
  sub_20CFAFDF8((uint64_t)v3, (uint64_t)&v9[*(int *)(v4 + 28)], &qword_253EC6A88);
  v20 = (uint64_t (**)(uint64_t))&v9[*(int *)(v4 + 32)];
  *v20 = v17;
  v20[1] = (uint64_t (*)(uint64_t))v19;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFAFE3C((uint64_t)v9, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for AttributedTextView);
  v21 = v11;
  swift_retain();
  sub_20CFCC674();
  sub_20CFAFE80((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for AttributedTextView);

}

void sub_20CFAA8E8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetsSessionItemMap);
  swift_beginAccess();
  v2 = *v1;
  *v1 = MEMORY[0x24BEE4B00];
  v3 = v2 + 64;
  v4 = 1 << *(_BYTE *)(v2 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(v2 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v13 >= v7)
      goto LABEL_25;
    v14 = *(_QWORD *)(v3 + 8 * v13);
    ++v8;
    if (!v14)
    {
      v8 = v13 + 1;
      if (v13 + 1 >= v7)
        goto LABEL_25;
      v14 = *(_QWORD *)(v3 + 8 * v8);
      if (!v14)
      {
        v8 = v13 + 2;
        if (v13 + 2 >= v7)
          goto LABEL_25;
        v14 = *(_QWORD *)(v3 + 8 * v8);
        if (!v14)
        {
          v8 = v13 + 3;
          if (v13 + 3 >= v7)
            goto LABEL_25;
          v14 = *(_QWORD *)(v3 + 8 * v8);
          if (!v14)
          {
            v8 = v13 + 4;
            if (v13 + 4 >= v7)
              goto LABEL_25;
            v14 = *(_QWORD *)(v3 + 8 * v8);
            if (!v14)
              break;
          }
        }
      }
    }
LABEL_24:
    v6 = (v14 - 1) & v14;
    v10 = __clz(__rbit64(v14)) + (v8 << 6);
LABEL_5:
    v11 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v10);
    v12 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    objc_msgSend(v12, sel_cancelSessionItem_, v11);

  }
  v15 = v13 + 5;
  if (v15 >= v7)
  {
LABEL_25:
    swift_release();
    swift_bridgeObjectRelease();
    return;
  }
  v14 = *(_QWORD *)(v3 + 8 * v15);
  if (v14)
  {
    v8 = v15;
    goto LABEL_24;
  }
  while (1)
  {
    v8 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v8 >= v7)
      goto LABEL_25;
    v14 = *(_QWORD *)(v3 + 8 * v8);
    ++v15;
    if (v14)
      goto LABEL_24;
  }
LABEL_27:
  __break(1u);
}

void *sub_20CFAAAC4(uint64_t a1)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  double v23;
  uint64_t v24;
  void *v25;
  char v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  id v30;
  uint64_t v32;
  uint64_t v33;
  id v34;

  v3 = type metadata accessor for ConstellationContentAttributes(0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v33 = (uint64_t)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v32 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v32 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - v16;
  v18 = OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_numberOfParagraphTags;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_numberOfParagraphTags) = 0;
  v34 = sub_20CFAAEC4(a1);
  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBB490]), sel_init);
  v20 = v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes;
  swift_beginAccess();
  sub_20CF865C8(v20, (uint64_t)v17, &qword_253EC6A88);
  v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48);
  if (v21(v17, 1, v3))
  {
    sub_20CF8658C((uint64_t)v17, &qword_253EC6A88);
    v22 = 4;
  }
  else
  {
    sub_20CFAFE3C((uint64_t)v17, (uint64_t)v6, type metadata accessor for ConstellationContentAttributes);
    sub_20CF8658C((uint64_t)v17, &qword_253EC6A88);
    v22 = *((_QWORD *)v6 + 8);
    sub_20CFAFE80((uint64_t)v6, type metadata accessor for ConstellationContentAttributes);
  }
  objc_msgSend(v19, sel_setAlignment_, v22);
  LODWORD(v23) = 1045220557;
  objc_msgSend(v19, sel_setHyphenationFactor_, v23);
  sub_20CF865C8(v20, (uint64_t)v15, &qword_253EC6A88);
  if (v21(v15, 1, v3))
  {
    sub_20CF8658C((uint64_t)v15, &qword_253EC6A88);
  }
  else
  {
    sub_20CFAFE3C((uint64_t)v15, (uint64_t)v6, type metadata accessor for ConstellationContentAttributes);
    sub_20CF8658C((uint64_t)v15, &qword_253EC6A88);
    v24 = *((_QWORD *)v6 + 12);
    sub_20CFAFE80((uint64_t)v6, type metadata accessor for ConstellationContentAttributes);
    objc_msgSend(v19, sel_setLineBreakMode_, v24);
  }
  v25 = v34;
  if (*(_QWORD *)(v1 + v18))
  {
    sub_20CF865C8(v20, (uint64_t)v12, &qword_253EC6A88);
    if (v21(v12, 1, v3))
    {
      sub_20CF8658C((uint64_t)v12, &qword_253EC6A88);
    }
    else
    {
      sub_20CFAFE3C((uint64_t)v12, (uint64_t)v6, type metadata accessor for ConstellationContentAttributes);
      sub_20CF8658C((uint64_t)v12, &qword_253EC6A88);
      v26 = v6[80];
      sub_20CFAFE80((uint64_t)v6, type metadata accessor for ConstellationContentAttributes);
      if ((v26 & 1) != 0)
        goto LABEL_15;
    }
    v27 = v33;
    sub_20CF865C8(v20, v33, &qword_253EC6A88);
    if (v21((char *)v27, 1, v3))
    {
      sub_20CF8658C(v27, &qword_253EC6A88);
      v28 = 10.0;
    }
    else
    {
      sub_20CFAFE3C(v27, (uint64_t)v6, type metadata accessor for ConstellationContentAttributes);
      sub_20CF8658C(v27, &qword_253EC6A88);
      v28 = *((double *)v6 + 9);
      sub_20CFAFE80((uint64_t)v6, type metadata accessor for ConstellationContentAttributes);
    }
    objc_msgSend(v19, sel_setParagraphSpacing_, v28);
  }
LABEL_15:
  v29 = *MEMORY[0x24BEBB3A8];
  v30 = v19;
  objc_msgSend(v25, sel_addAttribute_value_range_, v29, v30, 0, objc_msgSend(v25, sel_length));

  return v25;
}

id sub_20CFAAEC4(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v2 = objc_allocWithZone(MEMORY[0x24BDD1688]);
  v3 = (void *)sub_20CFCD0F4();
  v4 = objc_msgSend(v2, sel_initWithString_attributes_, v3, 0);

  objc_msgSend(v4, sel_beginEditing);
  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    v6 = (void *)objc_opt_self();
    swift_bridgeObjectRetain();
    v7 = 0;
    v8 = v5 - 1;
    while (2)
    {
      v9 = *(_QWORD *)(a1 + 8 * v7 + 32);
      v10 = swift_bridgeObjectRetain();
      sub_20CFAB0D8(v10);
      v11 = (void *)sub_20CFCD0B8();
      swift_bridgeObjectRelease();
      v12 = objc_msgSend(v6, sel_contentTypeForContentDictionary_, v11);

      switch((unint64_t)v12)
      {
        case 0uLL:
          sub_20CFAB84C(v9);
          v14 = v13;
          if (v13)
            goto LABEL_11;
          goto LABEL_14;
        case 1uLL:
          sub_20CFAB458(v9);
          v14 = v15;
          if (!v15)
            goto LABEL_14;
          goto LABEL_11;
        case 2uLL:
          v14 = sub_20CFAC094(v9);
          if (!v14)
            goto LABEL_14;
          goto LABEL_11;
        case 3uLL:
          sub_20CFAC9F4(v9);
          v14 = v16;
          if (v16)
            goto LABEL_11;
          goto LABEL_14;
        case 4uLL:
          v14 = sub_20CFAD4A8(v9);
          if (!v14)
            goto LABEL_14;
LABEL_11:
          objc_msgSend(v4, sel_appendAttributedString_, v14);
          swift_bridgeObjectRelease();

          if (v8 == v7)
            goto LABEL_18;
          goto LABEL_15;
        default:
LABEL_14:
          swift_bridgeObjectRelease();
          if (v8 == v7)
            goto LABEL_18;
LABEL_15:
          if (!__OFADD__(++v7, 1))
            continue;
          __break(1u);
LABEL_18:
          swift_bridgeObjectRelease();
          break;
      }
      break;
    }
  }
  objc_msgSend(v4, sel_endEditing);
  return v4;
}

uint64_t sub_20CFAB0D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  _OWORD v31[2];
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[3];
  _OWORD v37[2];
  __int128 v38;
  _OWORD v39[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6B88);
    v2 = sub_20CFCD400();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v26 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  if (v3 < 64)
    v4 = ~(-1 << v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(v3 + 63) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_26;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v13 >= v27)
      goto LABEL_35;
    v14 = *(_QWORD *)(v26 + 8 * v13);
    ++v8;
    if (!v14)
    {
      v8 = v13 + 1;
      if (v13 + 1 >= v27)
        goto LABEL_35;
      v14 = *(_QWORD *)(v26 + 8 * v8);
      if (!v14)
      {
        v8 = v13 + 2;
        if (v13 + 2 >= v27)
          goto LABEL_35;
        v14 = *(_QWORD *)(v26 + 8 * v8);
        if (!v14)
          break;
      }
    }
LABEL_25:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v8 << 6);
LABEL_26:
    v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v18 = *v16;
    v17 = v16[1];
    sub_20CF98B2C(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v39);
    *(_QWORD *)&v38 = v18;
    *((_QWORD *)&v38 + 1) = v17;
    v36[2] = v38;
    v37[0] = v39[0];
    v37[1] = v39[1];
    *(_QWORD *)&v36[0] = v18;
    *((_QWORD *)&v36[0] + 1) = v17;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_20CF97650(v37, v31);
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_20CF97650(v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_20CF97650(v35, v36);
    sub_20CF97650(v36, &v32);
    result = sub_20CFCD364();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(_QWORD *)(v10 + 32) = v30;
    result = (uint64_t)sub_20CF97650(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v15 = v13 + 3;
  if (v15 >= v27)
  {
LABEL_35:
    swift_release();
    swift_release();
    return v2;
  }
  v14 = *(_QWORD *)(v26 + 8 * v15);
  if (v14)
  {
    v8 = v15;
    goto LABEL_25;
  }
  while (1)
  {
    v8 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v8 >= v27)
      goto LABEL_35;
    v14 = *(_QWORD *)(v26 + 8 * v8);
    ++v15;
    if (v14)
      goto LABEL_25;
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_20CFAB458(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t inited;
  void **v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  BOOL v31;
  uint64_t v32;
  void *v33;
  id v34;
  _BYTE v35[72];
  uint64_t v36;
  __int128 v37;
  __int128 v38;

  v2 = v1;
  v4 = type metadata accessor for ConstellationContentAttributes(0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v35[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v35[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = sub_20CFCD118();
  if (!*(_QWORD *)(a1 + 16) || (v13 = sub_20CFA6D2C(v11, v12), (v14 & 1) == 0))
  {
    v37 = 0u;
    v38 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_20CF98B2C(*(_QWORD *)(a1 + 56) + 32 * v13, (uint64_t)&v37);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v38 + 1))
  {
LABEL_9:
    sub_20CF8658C((uint64_t)&v37, &qword_253EC6988);
    return;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6B00);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v15 = v36;
    v16 = OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_numberOfParagraphTags;
    v17 = *(_QWORD *)(v2 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_numberOfParagraphTags);
    if (v17)
    {
      v18 = v2 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes;
      swift_beginAccess();
      sub_20CF865C8(v18, (uint64_t)v10, &qword_253EC6A88);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4))
      {
        sub_20CF8658C((uint64_t)v10, &qword_253EC6A88);
      }
      else
      {
        sub_20CFAFE3C((uint64_t)v10, (uint64_t)v7, type metadata accessor for ConstellationContentAttributes);
        sub_20CF8658C((uint64_t)v10, &qword_253EC6A88);
        sub_20CFAFE80((uint64_t)v7, type metadata accessor for ConstellationContentAttributes);
      }
      v20 = sub_20CFABE4C();
      __swift_instantiateConcreteTypeFromMangledName(qword_253EC6B98);
      inited = swift_initStackObject();
      v22 = (void **)MEMORY[0x24BEBB360];
      *(_OWORD *)(inited + 16) = xmmword_20CFCFD50;
      v23 = *v22;
      *(_QWORD *)(inited + 32) = *v22;
      v24 = (void *)objc_opt_self();
      v25 = v23;
      v26 = objc_msgSend(v24, sel_preferredFontForTextStyle_, v20);
      *(_QWORD *)(inited + 64) = sub_20CF82934(0, &qword_253EC6B58);
      *(_QWORD *)(inited + 40) = v26;
      sub_20CF973B8(inited);
      v27 = objc_allocWithZone(MEMORY[0x24BDD1458]);
      v28 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
      type metadata accessor for Key(0);
      sub_20CF82E3C(&qword_253EC6B28, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_20CFCF460);
      v29 = (void *)sub_20CFCD0B8();
      swift_bridgeObjectRelease();
      v30 = objc_msgSend(v27, sel_initWithString_attributes_, v28, v29);

      v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1688]), sel_initWithAttributedString_, v30);
      v17 = *(_QWORD *)(v2 + v16);
    }
    else
    {
      v19 = 0;
    }
    v31 = __OFADD__(v17, 1);
    v32 = v17 + 1;
    if (v31)
    {
      __break(1u);
    }
    else
    {
      *(_QWORD *)(v2 + v16) = v32;
      v33 = (void *)sub_20CFAAEC4(v15);
      swift_bridgeObjectRelease();
      if (objc_msgSend(v33, sel_length))
      {
        if (v19)
        {
          v34 = v19;
          objc_msgSend(v34, sel_appendAttributedString_, v33);

        }
      }
      else
      {

      }
    }
  }
}

void sub_20CFAB84C(uint64_t a1)
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
  char *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int (*v24)(char *, uint64_t, uint64_t);
  uint64_t *v25;
  __int128 *v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;

  v2 = type metadata accessor for ConstellationContentAttributes(0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v46 - v10;
  v12 = (void *)objc_opt_self();
  sub_20CFAB0D8(a1);
  v13 = (void *)sub_20CFCD0B8();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_textForContentNode_, v13);

  if (!v14)
    return;
  v46 = sub_20CFCD118();
  v47 = v15;

  v16 = sub_20CFCD118();
  if (!*(_QWORD *)(a1 + 16) || (v18 = sub_20CFA6D2C(v16, v17), (v19 & 1) == 0))
  {
    v50 = 0u;
    v51 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_20CF98B2C(*(_QWORD *)(a1 + 56) + 32 * v18, (uint64_t)&v50);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v51 + 1))
  {
LABEL_9:
    sub_20CF8658C((uint64_t)&v50, &qword_253EC6988);
    v20 = 0;
    goto LABEL_10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6B00);
  if (swift_dynamicCast())
    v20 = v49;
  else
    v20 = 0;
LABEL_10:
  v21 = v48;
  v22 = sub_20CFADA80(v20);
  v23 = v21 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes;
  swift_beginAccess();
  sub_20CF865C8(v23, (uint64_t)v11, &qword_253EC6A88);
  v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  if (v24(v11, 1, v2))
  {
    v25 = &qword_253EC6A88;
    v26 = (__int128 *)v11;
LABEL_12:
    sub_20CF8658C((uint64_t)v26, v25);
    goto LABEL_14;
  }
  sub_20CFAFE3C((uint64_t)v11, (uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
  sub_20CF8658C((uint64_t)v11, &qword_253EC6A88);
  v27 = v5[82];
  sub_20CFAFE80((uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
  if ((v27 & 1) == 0)
  {
    if (*(_QWORD *)(v22 + 16))
    {
      v36 = (id)*MEMORY[0x24BEBB388];
      v37 = sub_20CFA6D90((uint64_t)v36);
      if ((v38 & 1) != 0)
      {
        sub_20CF98B2C(*(_QWORD *)(v22 + 56) + 32 * v37, (uint64_t)&v50);
      }
      else
      {
        v50 = 0u;
        v51 = 0u;
      }

      if (*((_QWORD *)&v51 + 1))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_20CF8658C((uint64_t)&v50, &qword_253EC6988);
        return;
      }
    }
    else
    {
      v50 = 0u;
      v51 = 0u;
    }
    v25 = &qword_253EC6988;
    v26 = &v50;
    goto LABEL_12;
  }
LABEL_14:
  sub_20CF865C8(v23, (uint64_t)v9, &qword_253EC6A88);
  if (v24(v9, 1, v2))
  {
    sub_20CF8658C((uint64_t)v9, &qword_253EC6A88);
LABEL_16:
    swift_bridgeObjectRelease();
LABEL_17:
    v28 = objc_allocWithZone(MEMORY[0x24BDD1458]);
    v29 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_20CF82E3C(&qword_253EC6B28, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_20CFCF460);
    v30 = (void *)sub_20CFCD0B8();
    swift_bridgeObjectRelease();
    objc_msgSend(v28, sel_initWithString_attributes_, v29, v30);

    return;
  }
  sub_20CFAFE3C((uint64_t)v9, (uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
  sub_20CF8658C((uint64_t)v9, &qword_253EC6A88);
  v31 = *((_QWORD *)v5 + 3);
  swift_bridgeObjectRetain();
  sub_20CFAFE80((uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
  if (!v31)
    goto LABEL_16;
  swift_bridgeObjectRelease();
  if (!v20)
    goto LABEL_33;
  v32 = *(_QWORD *)(v20 + 16);
  if (!v32)
  {
    swift_bridgeObjectRelease();
LABEL_33:
    swift_bridgeObjectRelease();
LABEL_34:
    v39 = v47;
    v40 = (uint64_t *)(v48 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_gradientTitle);
    *v40 = v46;
    v40[1] = v39;
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v33 = swift_bridgeObjectRetain();
  sub_20CFAB0D8(v33);
  swift_bridgeObjectRelease();
  v34 = (void *)sub_20CFCD0B8();
  swift_bridgeObjectRelease();
  v35 = objc_msgSend(v12, sel_markTypeForMarkDictionary_, v34);

  if (v35 == (id)3)
  {
LABEL_22:
    swift_bridgeObjectRelease_n();
    goto LABEL_17;
  }
  if (v32 == 1)
  {
LABEL_41:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    goto LABEL_34;
  }
  v41 = 5;
  while (1)
  {
    v42 = v41 - 3;
    if (__OFADD__(v41 - 4, 1))
      break;
    v43 = swift_bridgeObjectRetain();
    sub_20CFAB0D8(v43);
    swift_bridgeObjectRelease();
    v44 = (void *)sub_20CFCD0B8();
    swift_bridgeObjectRelease();
    v45 = objc_msgSend(v12, sel_markTypeForMarkDictionary_, v44);

    if (v45 == (id)3)
      goto LABEL_22;
    ++v41;
    if (v42 == v32)
      goto LABEL_41;
  }
  __break(1u);
}

id sub_20CFABE4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _OWORD v17[2];
  __int128 v18;
  __int128 v19;

  v1 = type metadata accessor for ConstellationContentAttributes(0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (id *)((char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (void *)*MEMORY[0x24BEBE1D0];
  v9 = v0 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes;
  swift_beginAccess();
  sub_20CF865C8(v9, (uint64_t)v7, &qword_253EC6A88);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1))
  {
    v10 = v8;
    sub_20CF8658C((uint64_t)v7, &qword_253EC6A88);
LABEL_3:
    v18 = 0u;
    v19 = 0u;
LABEL_4:
    sub_20CF8658C((uint64_t)&v18, &qword_253EC6988);
    return v8;
  }
  sub_20CFAFE3C((uint64_t)v7, (uint64_t)v4, type metadata accessor for ConstellationContentAttributes);
  v12 = v8;
  sub_20CF8658C((uint64_t)v7, &qword_253EC6A88);
  v13 = *v4;
  v14 = *v4;
  sub_20CFAFE80((uint64_t)v4, type metadata accessor for ConstellationContentAttributes);
  if (!v13)
    goto LABEL_3;
  v15 = objc_msgSend(v14, sel_fontDescriptor);

  v16 = objc_msgSend(v15, sel_objectForKey_, *MEMORY[0x24BEBB588]);
  if (v16)
  {
    sub_20CFCD340();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v17, 0, sizeof(v17));
  }
  sub_20CFAFDF8((uint64_t)v17, (uint64_t)&v18, &qword_253EC6988);
  if (!*((_QWORD *)&v19 + 1))
    goto LABEL_4;
  type metadata accessor for TextStyle(0);
  if ((swift_dynamicCast() & 1) == 0)
    return v12;

  return *(id *)&v17[0];
}

id sub_20CFAC094(uint64_t a1)
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  id v27;
  char *v29;
  id v30;
  void *v31;
  unsigned int v32;
  id v33;
  id v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  char v40;
  __int128 v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  void *v60;
  unint64_t v61;
  unsigned int v62;
  void *v63;
  char v64;
  char v65;
  id v66;
  unint64_t v67;
  char v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  char isUniquelyReferenced_nonNull_native;
  id v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  uint64_t v79;
  id v80;
  unsigned int (*v81)(char *, uint64_t, uint64_t);
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  unint64_t v85;
  _OWORD v86[2];
  __int128 v87;
  __int128 v88;

  v2 = type metadata accessor for ConstellationContentAttributes(0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v79 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v79 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v79 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v79 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v79 - v16;
  v18 = sub_20CFCD118();
  if (!*(_QWORD *)(a1 + 16) || (v20 = sub_20CFA6D2C(v18, v19), (v21 & 1) == 0))
  {
    v87 = 0u;
    v88 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_20CF98B2C(*(_QWORD *)(a1 + 56) + 32 * v20, (uint64_t)&v87);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v88 + 1))
  {
LABEL_8:
    sub_20CF8658C((uint64_t)&v87, &qword_253EC6988);
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499E228);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v83 = *(_QWORD **)&v86[0];
    v22 = v84;
    v23 = sub_20CFABE4C();
    v24 = v22 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes;
    swift_beginAccess();
    v82 = v24;
    sub_20CF865C8(v24, (uint64_t)v17, &qword_253EC6A88);
    v81 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
    if (v81(v17, 1, v2))
    {
      sub_20CF8658C((uint64_t)v17, &qword_253EC6A88);
      v25 = 0;
      v26 = 1;
    }
    else
    {
      sub_20CFAFE3C((uint64_t)v17, (uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
      sub_20CF8658C((uint64_t)v17, &qword_253EC6A88);
      v29 = &v5[*(int *)(v2 + 64)];
      v25 = *(_QWORD *)v29;
      v26 = v29[8];
      sub_20CFAFE80((uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
    }
    v30 = sub_20CF98798((uint64_t)v83, (uint64_t)v23, v25, v26);
    if (v30)
    {
      v31 = v30;
      sub_20CF865C8(v82, (uint64_t)v15, &qword_253EC6A88);
      v32 = v81(v15, 1, v2);
      v80 = v23;
      if (v32)
      {
        v33 = v31;
        sub_20CF8658C((uint64_t)v15, &qword_253EC6A88);
      }
      else
      {
        sub_20CFAFE3C((uint64_t)v15, (uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
        v34 = v31;
        sub_20CF8658C((uint64_t)v15, &qword_253EC6A88);
        v35 = v5[*(int *)(v2 + 68)];
        sub_20CFAFE80((uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
        if ((v35 & 1) != 0)
          goto LABEL_27;
      }
      v36 = sub_20CFCD118();
      v38 = v83;
      if (v83[2] && (v39 = sub_20CFA6D2C(v36, v37), (v40 & 1) != 0))
      {
        sub_20CF98B2C(v38[7] + 32 * v39, (uint64_t)&v87);
      }
      else
      {
        v87 = 0u;
        v88 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v88 + 1))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v41 = v86[0];
          if ((_QWORD)v41 == sub_20CFCD118() && *((_QWORD *)&v41 + 1) == v42)
          {
            swift_bridgeObjectRelease_n();
          }
          else
          {
            v79 = v41;
            v64 = sub_20CFCD430();
            swift_bridgeObjectRelease();
            if ((v64 & 1) == 0)
            {
              _sSo7UIColorC6TipsUIE25colorForSystemColorStringyABSSFZ_0();
              v45 = v78;
              swift_bridgeObjectRelease();
              goto LABEL_33;
            }
            swift_bridgeObjectRelease();
          }
        }
      }
      else
      {
        sub_20CF8658C((uint64_t)&v87, &qword_253EC6988);
      }
LABEL_27:
      sub_20CF865C8(v82, (uint64_t)v12, &qword_253EC6A88);
      if (v81(v12, 1, v2))
      {
        sub_20CF8658C((uint64_t)v12, &qword_253EC6A88);
      }
      else
      {
        sub_20CFAFE3C((uint64_t)v12, (uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
        sub_20CF8658C((uint64_t)v12, &qword_253EC6A88);
        v44 = *((_QWORD *)v5 + 1);
        swift_retain();
        sub_20CFAFE80((uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
        if (v44)
        {
          sub_20CF82934(0, (unint64_t *)&qword_253EC6B70);
          v43 = (id)sub_20CFCD2EC();
          goto LABEL_32;
        }
      }
      v43 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
LABEL_32:
      v45 = v43;
      v38 = v83;
LABEL_33:
      v83 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBB4B8]), sel_init);
      v46 = sub_20CFAFC80((uint64_t)v38);
      v48 = v47;
      swift_bridgeObjectRelease();
      if (v46 == 32 && v48 == 0xE100000000000000)
        v49 = 1;
      else
        v49 = sub_20CFCD430();
      v50 = v45;
      v51 = objc_msgSend(v31, sel_imageWithTintColor_renderingMode_, v45, 1);

      v52 = v51;
      v53 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
      v54 = v83;
      objc_msgSend(v83, sel_setAccessibilityLabel_, v53);

      objc_msgSend(v54, sel_setAccessibilityElementsHidden_, v49 & 1);
      objc_msgSend(v54, sel_setImage_, v52);

      v55 = sub_20CF973B8(MEMORY[0x24BEE4AF8]);
      v56 = sub_20CFCD118();
      if (*(_QWORD *)(a1 + 16) && (v58 = sub_20CFA6D2C(v56, v57), (v59 & 1) != 0))
      {
        sub_20CF98B2C(*(_QWORD *)(a1 + 56) + 32 * v58, (uint64_t)&v87);
      }
      else
      {
        v87 = 0u;
        v88 = 0u;
      }
      v60 = v50;
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v88 + 1))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6B00);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v61 = sub_20CFADA80(*(uint64_t *)&v86[0]);
          swift_bridgeObjectRelease();
          sub_20CF865C8(v82, (uint64_t)v9, &qword_253EC6A88);
          v62 = v81(v9, 1, v2);
          v63 = v80;
          if (v62)
          {
            sub_20CF8658C((uint64_t)v9, &qword_253EC6A88);
          }
          else
          {
            sub_20CFAFE3C((uint64_t)v9, (uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
            sub_20CF8658C((uint64_t)v9, &qword_253EC6A88);
            v65 = v5[82];
            sub_20CFAFE80((uint64_t)v5, type metadata accessor for ConstellationContentAttributes);
            if ((v65 & 1) != 0)
              goto LABEL_58;
          }
          if (*(_QWORD *)(v61 + 16))
          {
            v66 = (id)*MEMORY[0x24BEBB388];
            v67 = sub_20CFA6D90((uint64_t)v66);
            if ((v68 & 1) != 0)
            {
              sub_20CF98B2C(*(_QWORD *)(v61 + 56) + 32 * v67, (uint64_t)&v87);
            }
            else
            {
              v87 = 0u;
              v88 = 0u;
            }

            if (*((_QWORD *)&v88 + 1))
            {
              sub_20CF8658C((uint64_t)&v87, &qword_253EC6988);
              swift_bridgeObjectRelease();
              v61 = v55;
              goto LABEL_59;
            }
          }
          else
          {
            v87 = 0u;
            v88 = 0u;
          }
          sub_20CF8658C((uint64_t)&v87, &qword_253EC6988);
LABEL_58:
          swift_bridgeObjectRelease();
          goto LABEL_59;
        }
        v61 = v55;
        v63 = v80;
      }
      else
      {
        sub_20CF8658C((uint64_t)&v87, &qword_253EC6988);
        v61 = v55;
        v63 = v80;
      }
LABEL_59:
      v69 = (void *)*MEMORY[0x24BEBB360];
      v70 = (void *)objc_opt_self();
      v71 = v69;
      v72 = objc_msgSend(v70, sel_preferredFontForTextStyle_, v63);
      *((_QWORD *)&v88 + 1) = sub_20CF82934(0, &qword_253EC6B58);
      *(_QWORD *)&v87 = v72;
      sub_20CF97650(&v87, v86);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v85 = v61;
      sub_20CF9C8C8(v86, v71, isUniquelyReferenced_nonNull_native);

      swift_bridgeObjectRelease();
      v74 = objc_allocWithZone(MEMORY[0x24BDD1458]);
      type metadata accessor for Key(0);
      sub_20CF82E3C(&qword_253EC6B28, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_20CFCF460);
      v75 = (void *)sub_20CFCD0B8();
      swift_bridgeObjectRelease();
      v76 = v74;
      v77 = v83;
      v27 = objc_msgSend(v76, sel_initWithAttachment_attributes_, v83, v75);

      return v27;
    }
    swift_bridgeObjectRelease();

  }
  return 0;
}

void sub_20CFAC9F4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  double v46;
  double v47;
  id v48;
  double v49;
  double v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  double v55;
  double v56;
  double v57;
  double v58;
  id v59;
  void *v60;
  char *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  double v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  id v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  id v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;

  v2 = sub_20CFCCE48();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v92 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_20CFCC47C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v92 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_20CFCD118();
  if (!*(_QWORD *)(a1 + 16) || (v18 = sub_20CFA6D2C(v16, v17), (v19 & 1) == 0))
  {
    v105 = 0u;
    v106 = 0u;
    goto LABEL_9;
  }
  sub_20CF98B2C(*(_QWORD *)(a1 + 56) + 32 * v18, (uint64_t)&v105);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v106 + 1))
  {
LABEL_10:
    v25 = &qword_253EC6988;
    v26 = (char *)&v105;
LABEL_11:
    sub_20CF8658C((uint64_t)v26, v25);
    goto LABEL_12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499E228);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    sub_20CFCCE24();
    sub_20CFCD064();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return;
  }
  v101 = v15;
  v20 = v103;
  v21 = sub_20CFCD118();
  if (*(_QWORD *)(v20 + 16) && (v23 = sub_20CFA6D2C(v21, v22), (v24 & 1) != 0))
  {
    sub_20CF98B2C(*(_QWORD *)(v20 + 56) + 32 * v23, (uint64_t)&v105);
  }
  else
  {
    v105 = 0u;
    v106 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v106 + 1))
  {
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v27 = v104;
  v100 = v103;
  v28 = v102 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetsBaseURL;
  swift_beginAccess();
  sub_20CF865C8(v28, (uint64_t)v11, &qword_253EC5F58);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v25 = &qword_253EC5F58;
    v26 = v11;
    goto LABEL_11;
  }
  v98 = v20;
  v99 = v27;
  v29 = v101;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v101, v11, v12);
  v30 = *(_QWORD *)(v102 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_language + 8);
  if (!v30)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v29, v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v31 = *(_QWORD *)(v102 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_language);
  v32 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v33 = objc_msgSend(v32, sel_mainScreen);
  objc_msgSend(v33, sel_scale);
  v35 = v34;

  v36 = *(void **)(v102 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetFileInfoManager);
  if (!v36)
    goto LABEL_30;
  v94 = OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetFileInfoManager;
  v95 = v31;
  v97 = v30;
  v96 = v36;
  v37 = (void *)sub_20CFCD0F4();
  v93 = v32;
  v38 = objc_msgSend(v32, sel_mainScreen);
  v39 = objc_msgSend(v38, sel_traitCollection);

  v40 = objc_msgSend(v39, sel_userInterfaceStyle);
  if ((~*(_QWORD *)&v35 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_61;
  }
  if (v35 <= -9.22337204e18)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  if (v35 >= 9.22337204e18)
  {
LABEL_62:
    __break(1u);
    return;
  }
  v41 = v96;
  v42 = objc_msgSend(v96, sel_fileInfoWithMainIdentifier_userInterfaceStyle_scale_, v37, v40 != (id)1, (uint64_t)v35);

  if (!v42)
  {
LABEL_30:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_33:
    swift_bridgeObjectRelease();
    v51 = v101;
    sub_20CFCCE24();
    sub_20CFCD064();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v51, v12);
    return;
  }
  v43 = objc_msgSend(v42, sel_size);
  if (!v43)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_33;
  }
  v44 = v43;
  v45 = objc_msgSend(v43, sel_width);
  objc_msgSend(v45, sel_doubleValue);
  v47 = v46;

  v48 = objc_msgSend(v44, sel_height);
  objc_msgSend(v48, sel_doubleValue);
  v50 = v49;

  if (__CGSizeEqualToSize(v47, v50))
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v101, v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  else
  {
    v96 = v42;
    v52 = v102;
    v53 = v102 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes;
    swift_beginAccess();
    sub_20CF865C8(v53, (uint64_t)v8, &qword_253EC6A88);
    v54 = sub_20CF9CC1C((uint64_t)v8);
    sub_20CF8658C((uint64_t)v8, &qword_253EC6A88);
    objc_msgSend(v54, sel_pointSize);
    v56 = v55;

    v57 = v56 / 17.0;
    v92 = v44;
    if (v47 <= 200.0)
      v58 = v47 * v57;
    else
      v58 = v57 * 200.0;
    if (v50 > 40.0)
      v50 = 40.0;
    v59 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB7D00]), sel_init);
    v60 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    objc_msgSend(v59, sel_setImageId_, v60);

    v61 = v101;
    v62 = (void *)sub_20CFCC440();
    objc_msgSend(v59, sel_setBaseURL_, v62);

    v63 = v59;
    v64 = objc_msgSend(v93, sel_mainScreen);
    v65 = objc_msgSend(v64, sel_traitCollection);

    v66 = objc_msgSend(v65, sel_userInterfaceStyle);
    v67 = *(void **)(v52 + v94);
    v68 = objc_allocWithZone(MEMORY[0x24BEB7D08]);
    v69 = v67;
    v70 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    v71 = objc_msgSend(v68, sel_initWithAssets_language_userInterfaceStyle_assetFileInfoManager_, v63, v70, v66 != (id)1, v69);

    v72 = objc_msgSend(v71, sel_cacheIdentifierForType_, 0);
    if (v72)
    {
      v73 = v72;
      v74 = sub_20CFCD118();
      v76 = v75;
      v77 = objc_msgSend((id)objc_opt_self(), sel_getImageForIdentifier_, v73);

      if (v77)
      {
        v78 = v57 * v50;
        swift_bridgeObjectRelease();
        v79 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBB4B8]), sel_init);
        v80 = sub_20CFAFC80(v98);
        v82 = v81;
        swift_bridgeObjectRelease();
        if (v80 == 32 && v82 == 0xE100000000000000)
          v83 = 1;
        else
          v83 = sub_20CFCD430();
        v86 = (void *)sub_20CFCD0F4();
        swift_bridgeObjectRelease();
        objc_msgSend(v79, sel_setAccessibilityLabel_, v86);

        objc_msgSend(v79, sel_setAccessibilityElementsHidden_, v83 & 1);
        objc_msgSend(v77, sel_size);
        if (v87 == 0.0)
          v87 = 19.0;
        if (v58 == 0.0)
          v89 = v87;
        else
          v89 = v58;
        if (v88 == 0.0)
          v90 = 19.0;
        else
          v90 = v88;
        if (v78 == 0.0)
          v91 = v90;
        else
          v91 = v78;
        objc_msgSend(v79, sel_setBounds_, 0.0, -2.0, v89, v91, v92);
        objc_msgSend(v79, sel_setImage_, v77);
        objc_msgSend((id)objc_opt_self(), sel_attributedStringWithAttachment_, v79);

      }
      else
      {
        swift_bridgeObjectRelease();
        sub_20CFAE658(v71, v74, v76);
        swift_bridgeObjectRelease();
        v84 = objc_allocWithZone(MEMORY[0x24BDD1458]);
        v85 = (void *)sub_20CFCD0F4();
        objc_msgSend(v84, sel_initWithString_, v85);

      }
      (*(void (**)(char *, uint64_t))(v13 + 8))(v101, v12);
    }
    else
    {

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v61, v12);
    }
  }
}

id sub_20CFAD4A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t ObjectType;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;

  v2 = v1;
  v4 = sub_20CFCCE48();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_20CFCD118();
  if (!*(_QWORD *)(a1 + 16) || (v10 = sub_20CFA6D2C(v8, v9), (v11 & 1) == 0))
  {
    v45 = 0u;
    v46 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_20CF98B2C(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)&v45);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v46 + 1))
  {
LABEL_9:
    sub_20CF8658C((uint64_t)&v45, &qword_253EC6988);
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499E228);
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v12 = v43;
  v13 = sub_20CFCD118();
  if (*(_QWORD *)(a1 + 16) && (v15 = sub_20CFA6D2C(v13, v14), (v16 & 1) != 0))
  {
    sub_20CF98B2C(*(_QWORD *)(a1 + 56) + 32 * v15, (uint64_t)&v45);
  }
  else
  {
    v45 = 0u;
    v46 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v46 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6B00);
    if (swift_dynamicCast())
      v19 = v43;
    else
      v19 = 0;
  }
  else
  {
    sub_20CF8658C((uint64_t)&v45, &qword_253EC6988);
    v19 = 0;
  }
  sub_20CFADA80(v19);
  swift_bridgeObjectRelease();
  v20 = sub_20CFCD118();
  if (*(_QWORD *)(v12 + 16) && (v22 = sub_20CFA6D2C(v20, v21), (v23 & 1) != 0))
  {
    sub_20CF98B2C(*(_QWORD *)(v12 + 56) + 32 * v22, (uint64_t)&v45);
  }
  else
  {
    v45 = 0u;
    v46 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v46 + 1))
    goto LABEL_36;
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_37;
  v24 = v43;
  v25 = sub_20CFCD118();
  if (*(_QWORD *)(v12 + 16) && (v27 = sub_20CFA6D2C(v25, v26), (v28 & 1) != 0))
  {
    sub_20CF98B2C(*(_QWORD *)(v12 + 56) + 32 * v27, (uint64_t)&v45);
  }
  else
  {
    v45 = 0u;
    v46 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v46 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (v24 == 1)
      {
        sub_20CFCCE24();
        *(_QWORD *)&v45 = 0;
        *((_QWORD *)&v45 + 1) = 0xE000000000000000;
        sub_20CFCD370();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v45 = 0xD000000000000012;
        *((_QWORD *)&v45 + 1) = 0x800000020CFD2790;
        v43 = 1;
        LOBYTE(v44) = 0;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25499E340);
        sub_20CFCD130();
      }
      else
      {
        if (!v24)
        {
          v29 = v43;
          v30 = v2 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_delegate;
          if (MEMORY[0x212B9AB8C](v2 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_delegate))
          {
            v31 = *(_QWORD *)(v30 + 8);
            ObjectType = swift_getObjectType();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 8))(v29, ObjectType, v31);
            v34 = v33;
            swift_unknownObjectRelease();
            if (v34)
            {
              swift_bridgeObjectRetain();
              v35 = sub_20CFCD148();
              swift_bridgeObjectRelease();
              if (v35)
                goto LABEL_43;
            }
          }
          goto LABEL_37;
        }
        sub_20CFCCE24();
        *(_QWORD *)&v45 = 0;
        *((_QWORD *)&v45 + 1) = 0xE000000000000000;
        sub_20CFCD370();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v45 = 0xD000000000000027;
        *((_QWORD *)&v45 + 1) = 0x800000020CFD2760;
        v43 = v24;
        sub_20CFCD424();
      }
      sub_20CFCD154();
      swift_bridgeObjectRelease();
      sub_20CFCD064();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
  else
  {
LABEL_36:
    sub_20CF8658C((uint64_t)&v45, &qword_253EC6988);
  }
LABEL_37:
  v36 = sub_20CFCD118();
  if (*(_QWORD *)(v12 + 16) && (v38 = sub_20CFA6D2C(v36, v37), (v39 & 1) != 0))
  {
    sub_20CF98B2C(*(_QWORD *)(v12 + 56) + 32 * v38, (uint64_t)&v45);
  }
  else
  {
    v45 = 0u;
    v46 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v46 + 1))
  {
    if (swift_dynamicCast())
    {
LABEL_43:
      swift_bridgeObjectRelease();
      v40 = objc_allocWithZone(MEMORY[0x24BDD1458]);
      swift_bridgeObjectRetain();
      v41 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
      type metadata accessor for Key(0);
      sub_20CF82E3C(&qword_253EC6B28, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_20CFCF460);
      v42 = (void *)sub_20CFCD0B8();
      swift_bridgeObjectRelease();
      v17 = objc_msgSend(v40, sel_initWithString_attributes_, v41, v42);
      swift_bridgeObjectRelease();

      return v17;
    }
  }
  else
  {
    sub_20CF8658C((uint64_t)&v45, &qword_253EC6988);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t sub_20CFADA80(uint64_t a1)
{
  uint64_t v1;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  id v21;
  uint64_t inited;
  void *v23;
  unint64_t v24;
  void *v25;
  unsigned int (*v26)(uint64_t, uint64_t, uint64_t);
  unsigned int v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  char isUniquelyReferenced_nonNull_native;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  void *v58;
  id v59;
  uint64_t v60;
  char *v61;
  uint64_t *boxed_opaque_existential_0;
  id v63;
  unint64_t v64;
  char v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  id v75;
  id v76;
  id v77;
  id v78;
  double v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  char v84;
  id v86;
  void *v87;
  uint64_t v88;
  id v89;
  char *v90;
  char *v91;
  int v92;
  char *v93;
  uint64_t v94;
  int v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  unsigned int (*v103)(uint64_t, uint64_t, uint64_t);
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t v110;
  _OWORD v111[2];
  __int128 v112;
  uint64_t v113;

  v101 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  MEMORY[0x24BDAC7A8](v2);
  v93 = (char *)&v86 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = sub_20CFCC47C();
  v4 = *(_QWORD *)(v100 - 8);
  MEMORY[0x24BDAC7A8](v100);
  v90 = (char *)&v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ConstellationContentAttributes(0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v86 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v99 = (uint64_t)&v86 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v98 = (uint64_t)&v86 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v86 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v86 - v18;
  v20 = v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes;
  swift_beginAccess();
  sub_20CF865C8(v20, (uint64_t)v19, &qword_253EC6A88);
  v21 = sub_20CF9CC1C((uint64_t)v19);
  sub_20CF8658C((uint64_t)v19, &qword_253EC6A88);
  __swift_instantiateConcreteTypeFromMangledName(qword_253EC6B98);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20CFCFD50;
  v23 = (void *)*MEMORY[0x24BEBB360];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB360];
  v88 = sub_20CF82934(0, &qword_253EC6B58);
  *(_QWORD *)(inited + 64) = v88;
  *(_QWORD *)(inited + 40) = v21;
  v89 = v23;
  v96 = v21;
  v24 = sub_20CF973B8(inited);
  v25 = (void *)*MEMORY[0x24BEBB368];
  v104 = v20;
  sub_20CF865C8(v20, (uint64_t)v17, &qword_253EC6A88);
  v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  v105 = v6;
  v103 = v26;
  v27 = v26((uint64_t)v17, 1, v6);
  v102 = v25;
  if (v27)
  {
    v28 = v25;
    sub_20CF8658C((uint64_t)v17, &qword_253EC6A88);
LABEL_3:
    v29 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
    goto LABEL_6;
  }
  sub_20CFAFE3C((uint64_t)v17, (uint64_t)v9, type metadata accessor for ConstellationContentAttributes);
  v30 = v25;
  sub_20CF8658C((uint64_t)v17, &qword_253EC6A88);
  v31 = *((_QWORD *)v9 + 1);
  swift_retain();
  sub_20CFAFE80((uint64_t)v9, type metadata accessor for ConstellationContentAttributes);
  if (!v31)
    goto LABEL_3;
  sub_20CF82934(0, (unint64_t *)&qword_253EC6B70);
  v29 = (id)sub_20CFCD2EC();
LABEL_6:
  v32 = v29;
  v33 = v101;
  v97 = sub_20CF82934(0, (unint64_t *)&qword_253EC6B70);
  v113 = v97;
  *(_QWORD *)&v112 = v32;
  sub_20CF97650(&v112, v111);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v110 = v24;
  v35 = v102;
  sub_20CF9C8C8(v111, v102, isUniquelyReferenced_nonNull_native);
  v36 = v110;

  swift_bridgeObjectRelease();
  if (!v33 || (v37 = *(_QWORD *)(v33 + 16)) == 0)
  {

    return v36;
  }
  v91 = v9;
  v94 = v4;
  v106 = v36;
  v38 = (void *)objc_opt_self();
  v108 = v33 + 32;
  v86 = (id)*MEMORY[0x24BEBB388];
  swift_bridgeObjectRetain();
  v39 = 0;
  v95 = 0;
  v92 = 0;
  v109 = v37 - 1;
  v40 = v33 + 40;
  v107 = MEMORY[0x24BEE4AD8] + 8;
  v41 = v37;
  v87 = v38;
  while (1)
  {
    v42 = *(_QWORD *)(v108 + 8 * v39);
    v43 = v39 + 1;
    v44 = swift_bridgeObjectRetain();
    sub_20CFAB0D8(v44);
    v45 = (void *)sub_20CFCD0B8();
    swift_bridgeObjectRelease();
    v46 = objc_msgSend(v38, sel_markTypeForMarkDictionary_, v45);

    switch((unint64_t)v46)
    {
      case 0uLL:
        goto LABEL_18;
      case 1uLL:
        goto LABEL_29;
      case 2uLL:
        swift_bridgeObjectRelease();
        if (v43 == v37)
          goto LABEL_43;
        break;
      case 3uLL:
        goto LABEL_38;
      default:
        goto LABEL_11;
    }
    while (1)
    {
      if (v41 - 1 == v39)
        goto LABEL_57;
      v42 = *(_QWORD *)(v40 + 8 * v39);
      v51 = swift_bridgeObjectRetain();
      sub_20CFAB0D8(v51);
      v52 = (void *)sub_20CFCD0B8();
      swift_bridgeObjectRelease();
      v53 = objc_msgSend(v38, sel_markTypeForMarkDictionary_, v52);

      if (v53 != (id)2)
        break;
      swift_bridgeObjectRelease();
      if (v109 == ++v39)
      {
LABEL_43:
        swift_bridgeObjectRelease();
        v75 = v96;
        v36 = v106;
        if ((v95 & 1) != 0)
        {
LABEL_50:
          v76 = objc_msgSend(v75, sel_fontDescriptor);
          v77 = objc_msgSend(v76, sel_fontDescriptorWithSymbolicTraits_, 3);
          goto LABEL_52;
        }
LABEL_47:
        v76 = objc_msgSend(v75, sel_fontDescriptor);
        v77 = objc_msgSend(v76, sel_fontDescriptorWithSymbolicTraits_, 1);
        goto LABEL_52;
      }
    }
    v43 = v39 + 2;
    if (!v53)
      break;
    if (v53 == (id)3)
    {
      v92 = 1;
LABEL_38:
      swift_bridgeObjectRelease();
      v66 = v98;
      sub_20CF865C8(v104, v98, &qword_253EC6A88);
      if (v103(v66, 1, v105))
      {
        sub_20CF8658C(v66, &qword_253EC6A88);
        v67 = v102;
        goto LABEL_40;
      }
      v68 = (uint64_t)v91;
      sub_20CFAFE3C(v66, (uint64_t)v91, type metadata accessor for ConstellationContentAttributes);
      sub_20CF8658C(v66, &qword_253EC6A88);
      v69 = *(_QWORD *)(v68 + 16);
      swift_retain();
      sub_20CFAFE80(v68, type metadata accessor for ConstellationContentAttributes);
      v67 = v102;
      if (!v69)
LABEL_40:
        sub_20CFCCBCC();
      v70 = v67;
      swift_retain();
      v71 = v97;
      v72 = sub_20CFCD2EC();
      v113 = v71;
      *(_QWORD *)&v112 = v72;
      sub_20CF97650(&v112, v111);
      v73 = v106;
      v74 = swift_isUniquelyReferenced_nonNull_native();
      v110 = v73;
      sub_20CF9C8C8(v111, v70, v74);
      v106 = v110;
      swift_release();

      goto LABEL_11;
    }
    if (v53 != (id)1)
    {
      v92 = 1;
LABEL_11:
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    v92 = 1;
LABEL_29:
    swift_bridgeObjectRelease();
    if (v43 == v37)
    {
      swift_bridgeObjectRelease();
      goto LABEL_49;
    }
    v95 = 1;
LABEL_13:
    v39 = v43;
    if (v43 <= v37)
      v41 = v37;
    else
      v41 = v43;
    if (v43 >= v37)
    {
LABEL_57:
      __break(1u);
      JUMPOUT(0x20CFAE648);
    }
  }
  v92 = 1;
LABEL_18:
  v47 = v99;
  sub_20CF865C8(v104, v99, &qword_253EC6A88);
  v48 = v103(v47, 1, v105);
  v49 = v100;
  v50 = v94;
  if (v48)
  {
    sub_20CF8658C(v47, &qword_253EC6A88);
  }
  else
  {
    v54 = (uint64_t)v91;
    v55 = v100;
    v56 = v94;
    sub_20CFAFE3C(v47, (uint64_t)v91, type metadata accessor for ConstellationContentAttributes);
    sub_20CF8658C(v47, &qword_253EC6A88);
    v57 = *(unsigned __int8 *)(v54 + 81);
    v50 = v56;
    v49 = v55;
    v38 = v87;
    sub_20CFAFE80(v54, type metadata accessor for ConstellationContentAttributes);
    if (v57 != 1)
      goto LABEL_11;
  }
  sub_20CFAB0D8(v42);
  swift_bridgeObjectRelease();
  v58 = (void *)sub_20CFCD0B8();
  swift_bridgeObjectRelease();
  v59 = objc_msgSend(v38, sel_hrefForLinkMark_, v58);

  if (v59)
  {
    sub_20CFCD118();

    v60 = (uint64_t)v93;
    sub_20CFCC458();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v50 + 48))(v60, 1, v49) == 1)
    {
      sub_20CF8658C(v60, &qword_253EC5F58);
    }
    else
    {
      v61 = v90;
      (*(void (**)(char *, uint64_t, uint64_t))(v50 + 32))(v90, v60, v49);
      v113 = v49;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v112);
      (*(void (**)(uint64_t *, char *, uint64_t))(v50 + 16))(boxed_opaque_existential_0, v61, v49);
      sub_20CF97650(&v112, v111);
      v63 = v86;
      v64 = v106;
      v65 = swift_isUniquelyReferenced_nonNull_native();
      v110 = v64;
      sub_20CF9C8C8(v111, v63, v65);
      v106 = v110;

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v61, v49);
    }
  }
LABEL_12:
  if (v43 != v37)
    goto LABEL_13;
  swift_bridgeObjectRelease();
  if ((v95 & 1) == 0)
  {
    v75 = v96;
    v36 = v106;
    if ((v92 & 1) == 0)
      goto LABEL_55;
    goto LABEL_47;
  }
LABEL_49:
  v75 = v96;
  v36 = v106;
  if ((v92 & 1) != 0)
    goto LABEL_50;
  v76 = objc_msgSend(v96, sel_fontDescriptor);
  v77 = objc_msgSend(v76, sel_fontDescriptorWithSymbolicTraits_, 2);
LABEL_52:
  v78 = v77;

  if (v78)
  {
    objc_msgSend(v75, sel_pointSize);
    v80 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v78, v79);

    if (v80)
    {
      v113 = v88;
      *(_QWORD *)&v112 = v80;
      sub_20CF97650(&v112, v111);
      v81 = v80;
      v82 = v75;
      v83 = v89;
      v84 = swift_isUniquelyReferenced_nonNull_native();
      v110 = v36;
      sub_20CF9C8C8(v111, v83, v84);
      v36 = v110;

      swift_bridgeObjectRelease();
      return v36;
    }
  }
LABEL_55:

  return v36;
}

void sub_20CFAE658(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  _QWORD *v25;
  void *v26;
  id v27;
  double v28;
  id v29;
  id v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD *v35;
  void *v36;
  id v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t aBlock;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD *v54;

  v4 = v3;
  v8 = sub_20CFCCDAC();
  v47 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v46 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_20CFCCDD0();
  v44 = *(_QWORD *)(v10 - 8);
  v45 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v43 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = (char *)OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_syncQueue;
  v12 = *(void **)(v4 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_syncQueue);
  v13 = swift_allocObject();
  swift_weakInit();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v13;
  v14[3] = a2;
  v14[4] = a3;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = sub_20CFAF868;
  *(_QWORD *)(v15 + 24) = v14;
  v53 = sub_20CFAF884;
  v54 = (_QWORD *)v15;
  aBlock = MEMORY[0x24BDAC760];
  v50 = 1107296256;
  v51 = sub_20CF9F34C;
  v52 = &block_descriptor_4;
  v16 = _Block_copy(&aBlock);
  v17 = v12;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v17, v16);

  _Block_release(v16);
  LOBYTE(v17) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v17 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v18 = objc_msgSend((id)objc_opt_self(), sel_assetPathFromAssetConfiguration_type_, a1, 0);
    if (!v18)
    {
LABEL_7:
      swift_release();
      return;
    }
    v19 = v18;
    sub_20CF82934(0, (unint64_t *)&qword_253EC5F18);
    v20 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
    if (!v20)
    {
      swift_release();

      return;
    }
    v21 = v20;
    v41 = v8;
    v22 = (void *)sub_20CFCD0F4();
    v23 = *MEMORY[0x24BDD1350];
    v24 = swift_allocObject();
    swift_weakInit();
    v25 = (_QWORD *)swift_allocObject();
    v25[2] = a1;
    v25[3] = v24;
    v25[4] = a2;
    v25[5] = a3;
    v53 = sub_20CFAF8C0;
    v54 = v25;
    aBlock = MEMORY[0x24BDAC760];
    v50 = 1107296256;
    v51 = sub_20CF83C18;
    v52 = &block_descriptor_13;
    v26 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    v27 = a1;
    swift_release();
    LODWORD(v28) = v23;
    v29 = objc_msgSend(v21, sel_formattedDataForPath_identifier_attributionIdentifier_priority_completionHandler_, v19, v22, 0, v26, v28);
    _Block_release(v26);

    if (!v29)
    {
      swift_release();

      return;
    }
    v30 = objc_msgSend(v29, sel_sessionTask);
    if (v30)
    {
      v32 = v30;
      LODWORD(v31) = v23;
      objc_msgSend(v30, sel_setPriority_, v31);

      v33 = *(void **)&v42[v4];
      v34 = swift_allocObject();
      swift_weakInit();
      v35 = (_QWORD *)swift_allocObject();
      v35[2] = v34;
      v35[3] = a2;
      v35[4] = a3;
      v35[5] = v29;
      v53 = sub_20CFAF928;
      v54 = v35;
      aBlock = MEMORY[0x24BDAC760];
      v50 = 1107296256;
      v51 = sub_20CF8B674;
      v52 = &block_descriptor_20;
      v36 = _Block_copy(&aBlock);
      swift_bridgeObjectRetain();
      v37 = v33;
      swift_retain();
      v42 = (char *)v29;
      v38 = v43;
      sub_20CFCCDC4();
      v48 = MEMORY[0x24BEE4AF8];
      sub_20CF82E3C((unint64_t *)&qword_253EC6920, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6928);
      sub_20CF83538((unint64_t *)&qword_253EC6930, &qword_253EC6928);
      v39 = v46;
      v40 = v41;
      sub_20CFCD34C();
      MEMORY[0x212B9A220](0, v38, v39, v36);
      _Block_release(v36);

      (*(void (**)(char *, uint64_t))(v47 + 8))(v39, v40);
      (*(void (**)(char *, uint64_t))(v44 + 8))(v38, v45);
      swift_release();
      swift_release();
      goto LABEL_7;
    }
  }
  __break(1u);
}

void sub_20CFAEBB0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

void sub_20CFAEC08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t Strong;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  id v10;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v6 = (uint64_t *)(Strong + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetsSessionItemMap);
    swift_beginAccess();
    v7 = *v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_release();
    if (*(_QWORD *)(v7 + 16) && (v8 = sub_20CFA6D2C(a2, a3), (v9 & 1) != 0))
      v10 = *(id *)(*(_QWORD *)(v7 + 56) + 8 * v8);
    else
      v10 = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
}

void sub_20CFAECE0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t Strong;
  id v32;
  _QWORD *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t aBlock;
  unint64_t v40;
  uint64_t (*v41)(uint64_t);
  void *v42;
  void *v43;
  uint64_t v44;

  v13 = sub_20CFCCDAC();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_20CFCCDD0();
  v36 = *(_QWORD *)(v17 - 8);
  v37 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_20CFCCE48();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v35 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a9)
  {
    v35 = v22;
    v25 = a9;
    sub_20CFCCE24();
    aBlock = 0;
    v40 = 0xE000000000000000;
    sub_20CFCD370();
    swift_bridgeObjectRelease();
    aBlock = 0xD000000000000020;
    v40 = 0x800000020CFD2730;
    swift_getErrorValue();
    sub_20CFCD46C();
    sub_20CFCD154();
    swift_bridgeObjectRelease();
    sub_20CFCD064();
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v35);
    goto LABEL_6;
  }
  v26 = objc_msgSend(a10, sel_cacheIdentifierForType_, 0);
  if (v26)
  {
    v27 = v26;
    v28 = objc_msgSend((id)objc_opt_self(), sel_getImageForIdentifier_, v26);

    if (v28)
    {
      sub_20CF82934(0, (unint64_t *)&qword_253EC6960);
      v29 = (void *)sub_20CFCD274();
      v43 = sub_20CFAFBEC;
      v44 = a11;
      aBlock = MEMORY[0x24BDAC760];
      v40 = 1107296256;
      v41 = sub_20CF8B674;
      v42 = &block_descriptor_23;
      v30 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      sub_20CFCCDC4();
      aBlock = MEMORY[0x24BEE4AF8];
      sub_20CF82E3C((unint64_t *)&qword_253EC6920, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6928);
      sub_20CF83538((unint64_t *)&qword_253EC6930, &qword_253EC6928);
      sub_20CFCD34C();
      MEMORY[0x212B9A220](0, v19, v16, v30);
      _Block_release(v30);

      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v19, v37);
LABEL_6:
      swift_beginAccess();
      Strong = swift_weakLoadStrong();
      if (Strong)
      {
        v32 = *(id *)(Strong + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_syncQueue);
        swift_release();
        v33 = (_QWORD *)swift_allocObject();
        v33[2] = a11;
        v33[3] = a12;
        v33[4] = a13;
        v43 = sub_20CFAFC24;
        v44 = (uint64_t)v33;
        aBlock = MEMORY[0x24BDAC760];
        v40 = 1107296256;
        v41 = sub_20CF8B674;
        v42 = &block_descriptor_29;
        v34 = _Block_copy(&aBlock);
        swift_retain();
        swift_bridgeObjectRetain();
        sub_20CFCCDC4();
        v38 = MEMORY[0x24BEE4AF8];
        sub_20CF82E3C((unint64_t *)&qword_253EC6920, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6928);
        sub_20CF83538((unint64_t *)&qword_253EC6930, &qword_253EC6928);
        sub_20CFCD34C();
        MEMORY[0x212B9A220](0, v19, v16, v34);
        _Block_release(v34);

        (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
        (*(void (**)(char *, uint64_t))(v36 + 8))(v19, v37);
        swift_release();
      }
    }
  }
}

uint64_t sub_20CFAF1B8()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_20CFAA6B8();
    return swift_release();
  }
  return result;
}

void sub_20CFAF20C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_beginAccess();
    v5 = (void *)sub_20CFAF940(a2, a3, (void (*)(void))sub_20CFA8744);
    swift_endAccess();
    swift_release();

  }
}

uint64_t sub_20CFAF2B4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result;
  uint64_t *v8;
  id v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v11;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v8 = (uint64_t *)(result + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetsSessionItemMap);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v9 = a4;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v8;
    *v8 = 0x8000000000000000;
    sub_20CF9CA34((uint64_t)v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *v8 = v11;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    return swift_release();
  }
  return result;
}

uint64_t sub_20CFAF3A4()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  char *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = v0;
  v2 = sub_20CFCD268();
  v40 = *(_QWORD *)(v2 - 8);
  v41 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v39 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = sub_20CFCD250();
  MEMORY[0x24BDAC7A8](v38);
  v37 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20CFCCDD0();
  MEMORY[0x24BDAC7A8](v5);
  v36 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A98);
  v34 = *(_QWORD *)(v7 - 8);
  v35 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for AttributedTextView();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v33 - v14;
  v33 = v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser__bodyText;
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1458]), sel_init);
  v17 = &v15[*(int *)(v10 + 28)];
  v18 = type metadata accessor for ConstellationContentAttributes(0);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v17, 1, 1, v18);
  *((_QWORD *)v15 + 1) = 0;
  *((_QWORD *)v15 + 2) = 0;
  *(_QWORD *)v15 = v16;
  v15[24] = 1;
  v20 = &v15[*(int *)(v10 + 32)];
  *(_QWORD *)v20 = 0;
  *((_QWORD *)v20 + 1) = 0;
  sub_20CFAFE3C((uint64_t)v15, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for AttributedTextView);
  sub_20CFCC638();
  sub_20CFAFE80((uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for AttributedTextView);
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v33, v9, v35);
  v21 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_language);
  *v21 = 0;
  v21[1] = 0;
  v22 = v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetsBaseURL;
  v23 = sub_20CFCC47C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v22, 1, 1, v23);
  v19((char *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_attributes), 1, 1, v18);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetFileInfoManager) = 0;
  v24 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_viewSize);
  *v24 = 0;
  v24[1] = 0;
  *(_BYTE *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_textIsSelectable) = 1;
  v25 = v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_maxWidth;
  *(_QWORD *)v25 = 0;
  *(_BYTE *)(v25 + 8) = 1;
  v26 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_gradientTitle);
  *v26 = 0;
  v26[1] = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_delegate + 8) = 0;
  swift_unknownObjectWeakInit();
  v27 = OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_rawContent;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6B90);
  v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_20CFCFD50;
  v29 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v28 + 32) = sub_20CF97020(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v1 + v27) = v28;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_numberOfParagraphTags) = 0;
  v30 = OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_assetsSessionItemMap;
  *(_QWORD *)(v1 + v30) = sub_20CF9729C(v29);
  v31 = OBJC_IVAR____TtC6TipsUI26ConstellationContentParser_syncQueue;
  sub_20CF82934(0, (unint64_t *)&qword_253EC6960);
  sub_20CFCCDC4();
  v42 = v29;
  sub_20CF82E3C(&qword_253EC6958, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6938);
  sub_20CF83538(&qword_253EC6940, &qword_253EC6938);
  sub_20CFCD34C();
  (*(void (**)(char *, _QWORD, uint64_t))(v40 + 104))(v39, *MEMORY[0x24BEE5750], v41);
  *(_QWORD *)(v1 + v31) = sub_20CFCD28C();
  return v1;
}

uint64_t sub_20CFAF804@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for ConstellationContentParser(0);
  result = sub_20CFCC5F0();
  *a1 = result;
  return result;
}

uint64_t sub_20CFAF840()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_20CFAF868()
{
  uint64_t *v0;

  sub_20CFAEC08(v0[2], v0[3], v0[4]);
}

uint64_t sub_20CFAF874()
{
  return swift_deallocObject();
}

uint64_t sub_20CFAF884()
{
  uint64_t v0;

  return sub_20CF9F32C(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_20CFAF88C()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_20CFAF8C0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  uint64_t v9;

  sub_20CFAECE0(a1, a2, a3, a4, a5, a6, a7, a8, a9, *(id *)(v9 + 16), *(_QWORD *)(v9 + 24), *(_QWORD *)(v9 + 32), *(_QWORD *)(v9 + 40));
}

uint64_t sub_20CFAF8F4()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_20CFAF928()
{
  uint64_t v0;

  return sub_20CFAF2B4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_20CFAF934(uint64_t a1, uint64_t a2)
{
  return sub_20CFAF940(a1, a2, (void (*)(void))sub_20CFA7ED0);
}

uint64_t sub_20CFAF940(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t *v3;
  uint64_t *v5;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_20CFA6D2C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v5;
  v14 = *v5;
  *v5 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    a3();
    v11 = v14;
  }
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v8);
  sub_20CFAFA18(v8, v11);
  *v5 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_20CFAFA18(unint64_t result, uint64_t a2)
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
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_20CFCD358();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_20CFCD4B4();
        swift_bridgeObjectRetain();
        sub_20CFCD13C();
        v9 = sub_20CFCD4D8();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_20CFAFBEC()
{
  return sub_20CFAF1B8();
}

uint64_t objectdestroy_2Tm_0()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_20CFAFC24()
{
  uint64_t *v0;

  sub_20CFAF20C(v0[2], v0[3], v0[4]);
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
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

BOOL __CGSizeEqualToSize(double a1, double a2)
{
  return a2 == 0.0 && a1 == 0.0;
}

uint64_t sub_20CFAFC80(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;

  v2 = sub_20CFCD118();
  if (!*(_QWORD *)(a1 + 16) || (v4 = sub_20CFA6D2C(v2, v3), (v5 & 1) == 0))
  {
    v10 = 0u;
    v11 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  sub_20CF98B2C(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)&v10);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v11 + 1))
  {
LABEL_10:
    sub_20CF8658C((uint64_t)&v10, &qword_253EC6988);
    return 32;
  }
  if ((swift_dynamicCast() & 1) == 0)
    return 32;
  result = v8;
  v7 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0)
    v7 = v8 & 0xFFFFFFFFFFFFLL;
  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 32;
  }
  return result;
}

uint64_t sub_20CFAFD60(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_20CFAFD8C()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20CFAFDB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(v1 + 24);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(a1, ObjectType, v3);
}

uint64_t sub_20CFAFDF8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_20CFAFE3C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_20CFAFE80(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t static AssetContentModeKey.defaultValue.getter()
{
  return 0;
}

uint64_t sub_20CFAFEE4()
{
  sub_20CFB00BC();
  return sub_20CFCC7AC();
}

uint64_t EnvironmentValues.assetContentMode.getter()
{
  unsigned __int8 v1;

  sub_20CF82A6C();
  sub_20CFCC8CC();
  return v1;
}

uint64_t EnvironmentValues.assetContentMode.setter()
{
  sub_20CF82A6C();
  return sub_20CFCC8D8();
}

uint64_t (*EnvironmentValues.assetContentMode.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = sub_20CF82A6C();
  sub_20CFCC8CC();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a1 + 17);
  return sub_20CFB0008;
}

uint64_t sub_20CFB0008(uint64_t a1)
{
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a1 + 16);
  return sub_20CFCC8D8();
}

ValueMetadata *type metadata accessor for AssetContentModeKey()
{
  return &type metadata for AssetContentModeKey;
}

uint64_t sub_20CFB005C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC5ED0);
  v2 = sub_20CFCC80C();
  v4[0] = v1;
  v4[1] = sub_20CF8B6A0();
  return MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_20CFB00BC()
{
  unint64_t result;

  result = qword_253EC5E70;
  if (!qword_253EC5E70)
  {
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDEB468], MEMORY[0x24BDEB460]);
    atomic_store(result, (unint64_t *)&qword_253EC5E70);
  }
  return result;
}

uint64_t TipSpotlightView.assetConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TipSpotlightView() + 48);
  v4 = sub_20CFCCFEC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for TipSpotlightView()
{
  uint64_t result;

  result = qword_253EC7048;
  if (!qword_253EC7048)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t TipSpotlightView.assetConfiguration.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TipSpotlightView() + 48);
  v4 = sub_20CFCCFEC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*TipSpotlightView.assetConfiguration.modify())()
{
  type metadata accessor for TipSpotlightView();
  return nullsub_1;
}

uint64_t TipSpotlightView.bodyContent.getter()
{
  type metadata accessor for TipSpotlightView();
  return swift_bridgeObjectRetain();
}

uint64_t TipSpotlightView.bodyContent.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for TipSpotlightView() + 52);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*TipSpotlightView.bodyContent.modify())()
{
  type metadata accessor for TipSpotlightView();
  return nullsub_1;
}

uint64_t TipSpotlightView.init()@<X0>(uint64_t a1@<X8>)
{
  int *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;

  *(_QWORD *)a1 = swift_getKeyPath();
  *(_BYTE *)(a1 + 8) = 0;
  v2 = (int *)type metadata accessor for TipSpotlightView();
  v3 = (uint64_t *)(a1 + v2[5]);
  *v3 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC70E0);
  swift_storeEnumTagMultiPayload();
  v4 = (uint64_t *)(a1 + v2[6]);
  *v4 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC70D0);
  swift_storeEnumTagMultiPayload();
  v5 = v2[7];
  sub_20CFCCCA4();
  *(_OWORD *)(a1 + v5) = v10;
  v6 = v2[8];
  sub_20CFCCCA4();
  *(_OWORD *)(a1 + v6) = v10;
  v7 = a1 + v2[9];
  type metadata accessor for CGSize(0);
  sub_20CFCCCA4();
  *(_OWORD *)v7 = v10;
  *(_QWORD *)(v7 + 16) = v11;
  v8 = a1 + v2[10];
  sub_20CFCCCA4();
  *(_OWORD *)v8 = v10;
  *(_QWORD *)(v8 + 16) = v11;
  sub_20CFCCAE8();
  *(_QWORD *)(a1 + v2[13]) = 0;
  return sub_20CFCCFD4();
}

uint64_t TipSpotlightView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  __int128 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E380);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CFB0514((uint64_t)v5);
  v6 = (__int128 *)(v1 + *(int *)(type metadata accessor for TipSpotlightView() + 40));
  v7 = *((_QWORD *)v6 + 2);
  v17 = *v6;
  v18 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499E388);
  sub_20CFCCCC8();
  v8 = v19;
  v9 = v20;
  v10 = v21;
  v11 = v22;
  v12 = sub_20CFCCD40();
  v14 = v13;
  sub_20CF865C8((uint64_t)v5, a1, &qword_25499E380);
  v15 = (_QWORD *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25499E390) + 36));
  *v15 = v8;
  v15[1] = v9;
  v15[2] = v10;
  v15[3] = v11;
  v15[4] = v12;
  v15[5] = v14;
  return sub_20CF8658C((uint64_t)v5, &qword_25499E380);
}

uint64_t sub_20CFB0514@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  int v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v54 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DED0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E400);
  v4 = MEMORY[0x24BDAC7A8](v53);
  v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v49 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E3F0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E3E0);
  v12 = MEMORY[0x24BDAC7A8](v50);
  v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v49 = (uint64_t)&v49 - v15;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E490);
  MEMORY[0x24BDAC7A8](v51);
  v17 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E498);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E3D0);
  MEMORY[0x24BDAC7A8](v52);
  v22 = (char *)&v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_20CFB0A9C();
  if (v23)
  {
    if (v23 == 1)
    {
      *(_QWORD *)v11 = sub_20CFCC8E4();
      *((_QWORD *)v11 + 1) = 0x4028000000000000;
      v11[16] = 0;
      v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E4A0);
      sub_20CFB0ED0((uint64_t)&v11[*(int *)(v24 + 44)]);
      v25 = sub_20CFCCA40();
      sub_20CFCC704();
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;
      sub_20CF865C8((uint64_t)v11, (uint64_t)v14, &qword_25499E3F0);
      v34 = &v14[*(int *)(v50 + 36)];
      *v34 = v25;
      *((_QWORD *)v34 + 1) = v27;
      *((_QWORD *)v34 + 2) = v29;
      *((_QWORD *)v34 + 3) = v31;
      *((_QWORD *)v34 + 4) = v33;
      v34[40] = 0;
      sub_20CF8658C((uint64_t)v11, &qword_25499E3F0);
      v35 = &qword_25499E3E0;
      v36 = v49;
      sub_20CFAFDF8((uint64_t)v14, v49, &qword_25499E3E0);
      sub_20CF865C8(v36, (uint64_t)v20, &qword_25499E3E0);
      swift_storeEnumTagMultiPayload();
      sub_20CFB6C48(&qword_25499E3D8, &qword_25499E3E0, &qword_25499E3E8, &qword_25499E3F0);
      sub_20CFCC9BC();
      sub_20CF865C8((uint64_t)v22, (uint64_t)v17, &qword_25499E3D0);
      swift_storeEnumTagMultiPayload();
      sub_20CFB587C();
      sub_20CFB5A58(&qword_25499E3F8, &qword_25499E400, (uint64_t (*)(void))sub_20CFB5908, MEMORY[0x24BDECC60]);
      sub_20CFCC9BC();
      sub_20CF8658C((uint64_t)v22, &qword_25499E3D0);
      v37 = v36;
    }
    else
    {
      sub_20CFB16DC((uint64_t)v3);
      v38 = sub_20CFCCA40();
      sub_20CFCC704();
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v46 = v45;
      sub_20CF865C8((uint64_t)v3, (uint64_t)v6, &qword_25499DED0);
      v47 = &v6[*(int *)(v53 + 36)];
      *v47 = v38;
      *((_QWORD *)v47 + 1) = v40;
      *((_QWORD *)v47 + 2) = v42;
      *((_QWORD *)v47 + 3) = v44;
      *((_QWORD *)v47 + 4) = v46;
      v47[40] = 0;
      sub_20CF8658C((uint64_t)v3, &qword_25499DED0);
      v35 = &qword_25499E400;
      sub_20CFAFDF8((uint64_t)v6, (uint64_t)v8, &qword_25499E400);
      sub_20CF865C8((uint64_t)v8, (uint64_t)v17, &qword_25499E400);
      swift_storeEnumTagMultiPayload();
      sub_20CFB587C();
      sub_20CFB5A58(&qword_25499E3F8, &qword_25499E400, (uint64_t (*)(void))sub_20CFB5908, MEMORY[0x24BDECC60]);
      sub_20CFCC9BC();
      v37 = (uint64_t)v8;
    }
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_20CFB6C48(&qword_25499E3D8, &qword_25499E3E0, &qword_25499E3E8, &qword_25499E3F0);
    sub_20CFCC9BC();
    v35 = &qword_25499E3D0;
    sub_20CF865C8((uint64_t)v22, (uint64_t)v17, &qword_25499E3D0);
    swift_storeEnumTagMultiPayload();
    sub_20CFB587C();
    sub_20CFB5A58(&qword_25499E3F8, &qword_25499E400, (uint64_t (*)(void))sub_20CFB5908, MEMORY[0x24BDECC60]);
    sub_20CFCC9BC();
    v37 = (uint64_t)v22;
  }
  return sub_20CF8658C(v37, v35);
}

uint64_t sub_20CFB0A9C()
{
  uint64_t v0;
  void *v1;
  char v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v11;
  char v12;

  v1 = *(void **)v0;
  v2 = *(_BYTE *)(v0 + 8);
  sub_20CFB4908(v1, v2);
  v3 = sub_20CFB40EC(v1, v2);
  sub_20CFB4A78(v1, v2);
  v4 = (uint64_t)objc_msgSend(v3, sel_contentType);

  if (v4)
  {
    v5 = sub_20CFCD118();
    v7 = v6;

    sub_20CF82934(0, (unint64_t *)&qword_253EC6B50);
    if (v5 == sub_20CFCD2C8() && v7 == v8)
    {
      swift_bridgeObjectRelease_n();
      return 1;
    }
    else
    {
      v10 = sub_20CFCD430();
      swift_bridgeObjectRelease();
      if ((v10 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 1;
      }
      else
      {
        sub_20CFCCFBC();
        if (v5 == sub_20CFCCF8C() && v7 == v11)
        {
          v4 = 2;
          swift_bridgeObjectRelease_n();
        }
        else
        {
          v12 = sub_20CFCD430();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v12 & 1) != 0)
            return 2;
          else
            return 0;
        }
      }
    }
  }
  return v4;
}

uint64_t sub_20CFB0C18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 48);
  v5 = sub_20CFCCFEC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_20CFB0C58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 48);
  v5 = sub_20CFCCFEC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_20CFB0C98())()
{
  return nullsub_1;
}

uint64_t sub_20CFB0CAC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_20CFB0CB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t result;

  v4 = *(int *)(a2 + 52);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + v4) = a1;
  return result;
}

uint64_t (*sub_20CFB0CEC())()
{
  return nullsub_1;
}

uint64_t sub_20CFB0D00()
{
  sub_20CF82E3C(&qword_253EC70B8, (uint64_t (*)(uint64_t))type metadata accessor for TipSpotlightView, (uint64_t)&protocol conformance descriptor for TipSpotlightView);
  return sub_20CFCCFF8();
}

uint64_t sub_20CFB0D64()
{
  sub_20CF82E3C(&qword_253EC70B8, (uint64_t (*)(uint64_t))type metadata accessor for TipSpotlightView, (uint64_t)&protocol conformance descriptor for TipSpotlightView);
  return sub_20CFCD004();
}

uint64_t sub_20CFB0DC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E380);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CFB0514((uint64_t)v7);
  v8 = (__int128 *)(v2 + *(int *)(a1 + 40));
  v9 = *((_QWORD *)v8 + 2);
  v19 = *v8;
  v20 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499E388);
  sub_20CFCCCC8();
  v10 = v21;
  v11 = v22;
  v12 = v23;
  v13 = v24;
  v14 = sub_20CFCCD40();
  v16 = v15;
  sub_20CF865C8((uint64_t)v7, a2, &qword_25499E380);
  v17 = (_QWORD *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25499E390) + 36));
  *v17 = v10;
  v17[1] = v11;
  v17[2] = v12;
  v17[3] = v13;
  v17[4] = v14;
  v17[5] = v16;
  return sub_20CF8658C((uint64_t)v7, &qword_25499E380);
}

uint64_t sub_20CFB0ED0@<X0>(uint64_t a1@<X8>)
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
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DED0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v16 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E4A8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v16 - v12;
  sub_20CFB104C((uint64_t)&v16 - v12);
  sub_20CFB16DC((uint64_t)v7);
  sub_20CF865C8((uint64_t)v13, (uint64_t)v11, &qword_25499E4A8);
  sub_20CF865C8((uint64_t)v7, (uint64_t)v5, &qword_25499DED0);
  sub_20CF865C8((uint64_t)v11, a1, &qword_25499E4A8);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E4B0);
  sub_20CF865C8((uint64_t)v5, a1 + *(int *)(v14 + 48), &qword_25499DED0);
  sub_20CF8658C((uint64_t)v7, &qword_25499DED0);
  sub_20CF8658C((uint64_t)v13, &qword_25499E4A8);
  sub_20CF8658C((uint64_t)v5, &qword_25499DED0);
  return sub_20CF8658C((uint64_t)v11, &qword_25499E4A8);
}

uint64_t sub_20CFB104C@<X0>(uint64_t a1@<X8>)
{
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  _OWORD *v44;
  __int128 v45;
  _OWORD *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(void);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;

  v79 = a1;
  v74 = sub_20CFCC818();
  MEMORY[0x24BDAC7A8](v74);
  v75 = (char *)&v63 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E4B8);
  MEMORY[0x24BDAC7A8](v3);
  v68 = (uint64_t)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E4C0);
  v66 = *(_QWORD *)(v5 - 8);
  v67 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E4C8);
  MEMORY[0x24BDAC7A8](v64);
  v9 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E4D0);
  MEMORY[0x24BDAC7A8](v65);
  v11 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E4D8);
  MEMORY[0x24BDAC7A8](v69);
  v70 = (uint64_t)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E4E0);
  MEMORY[0x24BDAC7A8](v71);
  v73 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E4E8);
  v15 = *(_QWORD *)(v14 - 8);
  v77 = v14;
  v78 = v15;
  MEMORY[0x24BDAC7A8](v14);
  v72 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v63 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v63 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v63 - v24;
  v26 = sub_20CFCC47C();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v63 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = v1;
  sub_20CFB23C4((uint64_t)v25);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26) == 1)
  {
    sub_20CF8658C((uint64_t)v25, &qword_253EC5F58);
    v30 = 1;
    v31 = v79;
    v32 = v77;
  }
  else
  {
    v33 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
    v63 = v29;
    v33(v29, v25, v26);
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v23, v29, v26);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v23, 0, 1, v26);
    sub_20CF865C8((uint64_t)v23, (uint64_t)v20, &qword_253EC5F58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25499E4F0);
    sub_20CFB659C();
    sub_20CFCC6F8();
    sub_20CF8658C((uint64_t)v23, &qword_253EC5F58);
    v35 = v66;
    v34 = v67;
    (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v9, v7, v67);
    v36 = &v9[*(int *)(v64 + 36)];
    *(_QWORD *)v36 = 0;
    *((_WORD *)v36 + 4) = 257;
    (*(void (**)(char *, uint64_t))(v35 + 8))(v7, v34);
    v37 = v68;
    sub_20CFB3298(v68);
    v38 = sub_20CFCCD4C();
    v40 = v39;
    v41 = (uint64_t)&v11[*(int *)(v65 + 36)];
    sub_20CF865C8(v37, v41, &qword_25499E4B8);
    v42 = (uint64_t *)(v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25499E510) + 36));
    *v42 = v38;
    v42[1] = v40;
    sub_20CF865C8((uint64_t)v9, (uint64_t)v11, &qword_25499E4C8);
    sub_20CF8658C(v37, &qword_25499E4B8);
    sub_20CF8658C((uint64_t)v9, &qword_25499E4C8);
    type metadata accessor for TipSpotlightView();
    sub_20CFCCFC8();
    sub_20CFCCD4C();
    sub_20CFCC770();
    v43 = v70;
    sub_20CF865C8((uint64_t)v11, v70, &qword_25499E4D0);
    v44 = (_OWORD *)(v43 + *(int *)(v69 + 36));
    v45 = v81;
    *v44 = v80;
    v44[1] = v45;
    v44[2] = v82;
    sub_20CF8658C((uint64_t)v11, &qword_25499E4D0);
    v46 = v75;
    v47 = &v75[*(int *)(v74 + 20)];
    v48 = *MEMORY[0x24BDEEB68];
    v49 = sub_20CFCC8F0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 104))(v47, v48, v49);
    __asm { FMOV            V0.2D, #10.0 }
    *v46 = _Q0;
    v55 = (uint64_t)v73;
    v56 = (uint64_t)&v73[*(int *)(v71 + 36)];
    v57 = MEMORY[0x24BDED998];
    sub_20CFAFE3C((uint64_t)v46, v56, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
    *(_WORD *)(v56 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25499E518) + 36)) = 256;
    sub_20CF865C8(v43, v55, &qword_25499E4D8);
    sub_20CFAFE80((uint64_t)v46, (uint64_t (*)(_QWORD))v57);
    sub_20CF8658C(v43, &qword_25499E4D8);
    v58 = v77;
    v59 = (uint64_t)v72;
    sub_20CFB42B0(&qword_253EC70E0, (uint64_t (*)(_QWORD))MEMORY[0x24BDEB418], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)&v72[*(int *)(v77 + 52)]);
    sub_20CFAFDF8(v55, v59, &qword_25499E4E0);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v63, v26);
    v60 = v59;
    v61 = v79;
    sub_20CFAFDF8(v60, v79, &qword_25499E4E8);
    v30 = 0;
    v31 = v61;
    v32 = v58;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v78 + 56))(v31, v30, 1, v32);
}

uint64_t sub_20CFB16DC@<X0>(uint64_t a1@<X8>)
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _OWORD *v23;
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
  char v36;
  void (*v37)(char *, uint64_t);
  unsigned int *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(void);
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)@<X0>(uint64_t *@<X8>);
  uint64_t (*v58)@<X0>(uint64_t *@<X8>);
  uint64_t v59;
  uint64_t (**v60)@<X0>(uint64_t *@<X8>);
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t OpaqueTypeConformance2;
  char *v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  char *v102;
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
  char *v113;
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
  _OWORD v125[14];
  char v126;
  __int128 v127;
  _OWORD v128[14];
  _OWORD v129[13];
  uint64_t v130;

  v116 = a1;
  v2 = sub_20CFCC500();
  v114 = *(_QWORD *)(v2 - 8);
  v115 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v113 = (char *)&v88 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_20CFCC710();
  v5 = *(_QWORD *)(v4 - 8);
  v111 = v4;
  v112 = v5;
  MEMORY[0x24BDAC7A8](v4);
  v110 = (uint64_t)&v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E448);
  MEMORY[0x24BDAC7A8](v100);
  v99 = (uint64_t)&v88 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = type metadata accessor for TipSpotlightView();
  v8 = *(_QWORD *)(*(_QWORD *)(v120 - 8) + 64);
  v96 = *(_QWORD *)(v120 - 8);
  v97 = v8;
  MEMORY[0x24BDAC7A8](v120);
  v95 = (uint64_t)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_20CFCC824();
  MEMORY[0x24BDAC7A8](v10);
  v92 = (char *)&v88 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_20CFCC728();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v88 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v88 - v17;
  v90 = sub_20CFCCD64();
  v19 = *(_QWORD *)(v90 - 8);
  MEMORY[0x24BDAC7A8](v90);
  v21 = (char *)&v88 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E458);
  MEMORY[0x24BDAC7A8](v91);
  v23 = (_OWORD *)((char *)&v88 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E438);
  MEMORY[0x24BDAC7A8](v94);
  v93 = (uint64_t)&v88 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E420);
  MEMORY[0x24BDAC7A8](v119);
  v118 = (uint64_t)&v88 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E418);
  v27 = *(_QWORD *)(v26 - 8);
  v103 = v26;
  v104 = v27;
  MEMORY[0x24BDAC7A8](v26);
  v98 = (char *)&v88 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E410);
  v30 = *(_QWORD *)(v29 - 8);
  v106 = v29;
  v107 = v30;
  MEMORY[0x24BDAC7A8](v29);
  v101 = (char *)&v88 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DEC8);
  v108 = *(_QWORD *)(v32 - 8);
  v109 = v32;
  MEMORY[0x24BDAC7A8](v32);
  v102 = (char *)&v88 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DED0);
  MEMORY[0x24BDAC7A8](v34);
  v105 = (uint64_t)&v88 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = sub_20CFCC914();
  v117 = v1;
  sub_20CFB36B8(v1, (uint64_t)v129);
  sub_20CFB42B0(&qword_253EC70E0, (uint64_t (*)(_QWORD))MEMORY[0x24BDEB418], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v18);
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v16, *MEMORY[0x24BDEB3F0], v12);
  v36 = sub_20CFCC71C();
  v37 = *(void (**)(char *, uint64_t))(v13 + 8);
  v37(v16, v12);
  v37(v18, v12);
  v38 = (unsigned int *)MEMORY[0x24BDF5098];
  if ((v36 & 1) == 0)
    v38 = (unsigned int *)MEMORY[0x24BDF5080];
  v39 = v90;
  (*(void (**)(char *, _QWORD, uint64_t))(v19 + 104))(v21, *v38, v90);
  *(_OWORD *)((char *)&v125[10] + 7) = v129[10];
  *(_OWORD *)((char *)&v125[11] + 7) = v129[11];
  *(_OWORD *)((char *)&v125[12] + 7) = v129[12];
  *(_QWORD *)((char *)&v125[13] + 7) = v130;
  *(_OWORD *)((char *)&v125[6] + 7) = v129[6];
  *(_OWORD *)((char *)&v125[7] + 7) = v129[7];
  *(_OWORD *)((char *)&v125[8] + 7) = v129[8];
  *(_OWORD *)((char *)&v125[9] + 7) = v129[9];
  *(_OWORD *)((char *)&v125[2] + 7) = v129[2];
  *(_OWORD *)((char *)&v125[3] + 7) = v129[3];
  *(_OWORD *)((char *)&v125[4] + 7) = v129[4];
  *(_OWORD *)((char *)&v125[5] + 7) = v129[5];
  *(_OWORD *)((char *)v125 + 7) = v129[0];
  *(_OWORD *)((char *)&v125[1] + 7) = v129[1];
  *(_OWORD *)((char *)&v128[10] + 1) = v125[10];
  *(_OWORD *)((char *)&v128[11] + 1) = v125[11];
  *(_OWORD *)((char *)&v128[12] + 1) = v125[12];
  v128[13] = *(_OWORD *)((char *)&v125[12] + 15);
  *(_OWORD *)((char *)&v128[6] + 1) = v125[6];
  *(_OWORD *)((char *)&v128[7] + 1) = v125[7];
  *(_OWORD *)((char *)&v128[8] + 1) = v125[8];
  *(_OWORD *)((char *)&v128[9] + 1) = v125[9];
  *(_OWORD *)((char *)&v128[2] + 1) = v125[2];
  *(_OWORD *)((char *)&v128[3] + 1) = v125[3];
  *(_OWORD *)((char *)&v128[4] + 1) = v125[4];
  *(_OWORD *)((char *)&v128[5] + 1) = v125[5];
  *(_OWORD *)((char *)v128 + 1) = v125[0];
  v126 = 0;
  *(_QWORD *)&v127 = v89;
  *((_QWORD *)&v127 + 1) = 0x4008000000000000;
  LOBYTE(v128[0]) = 0;
  *(_OWORD *)((char *)&v128[1] + 1) = v125[1];
  v40 = v92;
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v92, v21, v39);
  v41 = (uint64_t)v40;
  v42 = (uint64_t)v40;
  v43 = MEMORY[0x24BDEDB60];
  sub_20CFAFE3C(v41, (uint64_t)v23 + *(int *)(v91 + 36), (uint64_t (*)(_QWORD))MEMORY[0x24BDEDB60]);
  v44 = v128[12];
  v23[12] = v128[11];
  v23[13] = v44;
  v23[14] = v128[13];
  v45 = v128[8];
  v23[8] = v128[7];
  v23[9] = v45;
  v46 = v128[10];
  v23[10] = v128[9];
  v23[11] = v46;
  v47 = v128[4];
  v23[4] = v128[3];
  v23[5] = v47;
  v48 = v128[6];
  v23[6] = v128[5];
  v23[7] = v48;
  v49 = v128[0];
  *v23 = v127;
  v23[1] = v49;
  v50 = v128[2];
  v23[2] = v128[1];
  v23[3] = v50;
  sub_20CFB6684((uint64_t)&v127);
  sub_20CFAFE80(v42, (uint64_t (*)(_QWORD))v43);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v39);
  sub_20CFB67C0((uint64_t)v129);
  v51 = v117;
  v52 = v95;
  sub_20CFAFE3C(v117, v95, (uint64_t (*)(_QWORD))type metadata accessor for TipSpotlightView);
  v53 = *(unsigned __int8 *)(v96 + 80);
  v54 = (v53 + 16) & ~v53;
  v92 = (char *)v54;
  v96 = v53 | 7;
  v97 += v54;
  v55 = swift_allocObject();
  sub_20CFB68F0(v52, v55 + v54);
  v56 = sub_20CFCCD4C();
  v58 = v57;
  v59 = v99;
  sub_20CF865C8((uint64_t)v23, v99, &qword_25499E458);
  v60 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v59 + *(int *)(v100 + 36));
  *v60 = sub_20CFBBA18;
  v60[1] = 0;
  v60[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v56;
  v60[3] = v58;
  v61 = swift_allocObject();
  *(_QWORD *)(v61 + 16) = sub_20CFB6934;
  *(_QWORD *)(v61 + 24) = v55;
  v62 = v93;
  sub_20CF865C8(v59, v93, &qword_25499E448);
  v63 = (_QWORD *)(v62 + *(int *)(v94 + 36));
  *v63 = sub_20CFB6CD0;
  v63[1] = v61;
  sub_20CF8658C(v59, &qword_25499E448);
  sub_20CF8658C((uint64_t)v23, &qword_25499E458);
  sub_20CFAFE3C(v51, v52, (uint64_t (*)(_QWORD))type metadata accessor for TipSpotlightView);
  v64 = swift_allocObject();
  v65 = v92;
  sub_20CFB68F0(v52, (uint64_t)&v92[v64]);
  v66 = v118;
  sub_20CF865C8(v62, v118, &qword_25499E438);
  v67 = (_QWORD *)(v66 + *(int *)(v119 + 36));
  *v67 = sub_20CFB697C;
  v67[1] = v64;
  v67[2] = 0;
  v67[3] = 0;
  sub_20CF8658C(v62, &qword_25499E438);
  v68 = v110;
  v69 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEB1F0];
  sub_20CFB42B0(&qword_253EC70D0, (uint64_t (*)(_QWORD))MEMORY[0x24BDEB1F0], 0x616850656E656353, 0xEA00000000006573, v110);
  sub_20CFAFE3C(v51, v52, (uint64_t (*)(_QWORD))type metadata accessor for TipSpotlightView);
  v70 = swift_allocObject();
  sub_20CFB68F0(v52, (uint64_t)&v65[v70]);
  v71 = sub_20CFB5A58(&qword_25499E428, &qword_25499E420, (uint64_t (*)(void))sub_20CFB5AC0, MEMORY[0x24BDF0910]);
  v72 = sub_20CF82E3C(&qword_25499E470, v69, MEMORY[0x24BDEB200]);
  v73 = v98;
  v74 = v118;
  v75 = v119;
  v76 = v111;
  sub_20CFCCBC0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v68, v76);
  sub_20CF8658C(v74, &qword_25499E420);
  v121 = v75;
  v122 = v76;
  v123 = v71;
  v124 = v72;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v78 = v101;
  v79 = v103;
  sub_20CFCCB6C();
  (*(void (**)(char *, uint64_t))(v104 + 8))(v73, v79);
  sub_20CFCCFE0();
  v80 = v113;
  sub_20CFCC4F4();
  v121 = v79;
  v122 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v81 = v102;
  v82 = v106;
  sub_20CFCCB84();
  (*(void (**)(char *, uint64_t))(v114 + 8))(v80, v115);
  (*(void (**)(char *, uint64_t))(v107 + 8))(v78, v82);
  v83 = sub_20CFCCD58();
  v84 = v105;
  v86 = sub_20CFA3654(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v105, 0.0, 1, INFINITY, 0, v83, v85);
  (*(void (**)(char *, uint64_t, double))(v108 + 8))(v81, v109, v86);
  return sub_20CFAFDF8(v84, v116, &qword_25499DED0);
}

uint64_t sub_20CFB2168@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t KeyPath;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;

  v10 = sub_20CFCCC74();
  v11 = sub_20CFCCA94();
  KeyPath = swift_getKeyPath();
  v13 = sub_20CFCCC08();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a1;
  *(_QWORD *)(v14 + 24) = a2;
  *(double *)(v14 + 32) = a4;
  *(double *)(v14 + 40) = a5;
  swift_retain();
  swift_retain();
  v15 = sub_20CFCCD4C();
  v17 = v16;
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = sub_20CFB6518;
  *(_QWORD *)(result + 24) = v14;
  *(_QWORD *)a3 = 0;
  *(_BYTE *)(a3 + 8) = 1;
  *(_QWORD *)(a3 + 16) = v10;
  *(_QWORD *)(a3 + 24) = KeyPath;
  *(_QWORD *)(a3 + 32) = v11;
  *(_QWORD *)(a3 + 40) = v13;
  *(_QWORD *)(a3 + 48) = sub_20CFBBA18;
  *(_QWORD *)(a3 + 56) = 0;
  *(_QWORD *)(a3 + 64) = v15;
  *(_QWORD *)(a3 + 72) = v17;
  *(_QWORD *)(a3 + 80) = sub_20CFB6594;
  *(_QWORD *)(a3 + 88) = result;
  return result;
}

uint64_t sub_20CFB2280@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
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
  uint64_t result;
  char v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  char v39;
  char v40;
  char v41;

  v3 = *v1;
  v4 = v1[1];
  v5 = *((double *)v1 + 2);
  v6 = *((double *)v1 + 3);
  v7 = sub_20CFCC8E4();
  sub_20CFB2168(v3, v4, (uint64_t)&v31, v5, v6);
  v8 = v31;
  LOBYTE(v4) = v32;
  v9 = v34;
  v10 = v37;
  v27 = v33;
  v28 = v35;
  v29 = v38;
  v30 = v36;
  LOBYTE(v3) = sub_20CFCCA4C();
  sub_20CFCC704();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v41 = 1;
  v40 = v4;
  v39 = 0;
  LOBYTE(v4) = sub_20CFCCA58();
  result = sub_20CFCC704();
  v20 = v41;
  v21 = v40;
  v22 = v39;
  LOBYTE(v31) = 0;
  *(_QWORD *)a1 = v7;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = v20;
  *(_QWORD *)(a1 + 24) = v8;
  *(_BYTE *)(a1 + 32) = v21;
  *(_OWORD *)(a1 + 40) = v27;
  *(_QWORD *)(a1 + 56) = v9;
  *(_OWORD *)(a1 + 64) = v28;
  *(_OWORD *)(a1 + 80) = v30;
  *(_QWORD *)(a1 + 96) = v10;
  *(_OWORD *)(a1 + 104) = v29;
  *(_BYTE *)(a1 + 120) = v3;
  *(_QWORD *)(a1 + 128) = v12;
  *(_QWORD *)(a1 + 136) = v14;
  *(_QWORD *)(a1 + 144) = v16;
  *(_QWORD *)(a1 + 152) = v18;
  *(_BYTE *)(a1 + 160) = v22;
  *(_BYTE *)(a1 + 168) = v4;
  *(_QWORD *)(a1 + 176) = v23;
  *(_QWORD *)(a1 + 184) = v24;
  *(_QWORD *)(a1 + 192) = v25;
  *(_QWORD *)(a1 + 200) = v26;
  *(_BYTE *)(a1 + 208) = v31;
  return result;
}

uint64_t sub_20CFB23C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(void);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t);
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v28 - v8;
  v10 = sub_20CFCC728();
  v11 = MEMORY[0x24BDEB418];
  v12 = *(_QWORD *)(v10 - 8);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v28 - v16;
  type metadata accessor for TipSpotlightView();
  sub_20CFB42B0(&qword_253EC70E0, (uint64_t (*)(_QWORD))v11, 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v15, *MEMORY[0x24BDEB400], v10);
  LOBYTE(v11) = sub_20CFCC71C();
  v18 = *(void (**)(char *, uint64_t))(v12 + 8);
  v18(v15, v10);
  v18(v17, v10);
  v19 = *(void **)v2;
  LOBYTE(v2) = *(_BYTE *)(v2 + 8);
  sub_20CFB4908(v19, v2);
  v20 = sub_20CFB40EC(v19, v2);
  sub_20CFB4A78(v19, v2);
  if ((v11 & 1) != 0)
  {
    v21 = objc_msgSend(v20, sel_thumbnailURL);

    if (v21)
    {
      sub_20CFCC44C();

      v22 = sub_20CFCC47C();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v9, 0, 1, v22);
    }
    else
    {
      v25 = sub_20CFCC47C();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v9, 1, 1, v25);
    }
  }
  else
  {
    v23 = objc_msgSend(v20, sel_darkThumbnailURL);

    if (v23)
    {
      sub_20CFCC44C();

      v24 = sub_20CFCC47C();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v7, 0, 1, v24);
    }
    else
    {
      v26 = sub_20CFCC47C();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v7, 1, 1, v26);
    }
    v9 = v7;
  }
  return sub_20CFAFDF8((uint64_t)v9, a1, &qword_253EC5F58);
}

uint64_t sub_20CFB2680(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[32];
  __int128 v34;
  _OWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  __int128 v38;

  v27 = *(_QWORD *)(a1 + 16);
  if (v27)
  {
    v1 = a1 + 32;
    swift_bridgeObjectRetain();
    v2 = 0;
    v26 = v1;
LABEL_4:
    v3 = *(_QWORD *)(v1 + 8 * v2);
    v28 = v2 + 1;
    v29 = v3 + 64;
    v4 = 1 << *(_BYTE *)(v3 + 32);
    if (v4 < 64)
      v5 = ~(-1 << v4);
    else
      v5 = -1;
    v6 = v5 & *(_QWORD *)(v3 + 64);
    v30 = (unint64_t)(v4 + 63) >> 6;
    result = swift_bridgeObjectRetain();
    v8 = 0;
    while (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
LABEL_11:
      v11 = *(_QWORD *)(v3 + 56);
      v12 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v10);
      v13 = v12[1];
      *(_QWORD *)&v34 = *v12;
      *((_QWORD *)&v34 + 1) = v13;
      sub_20CF98B2C(v11 + 32 * v10, (uint64_t)v35);
      swift_bridgeObjectRetain();
LABEL_30:
      sub_20CFAFDF8((uint64_t)&v34, (uint64_t)&v36, &qword_25499E570);
      v17 = v37;
      if (!v37)
      {
        swift_release();
        v2 = v28;
        v1 = v26;
        if (v28 != v27)
          goto LABEL_4;
        swift_bridgeObjectRelease();
        return 1;
      }
      v18 = v36;
      sub_20CF97650(&v38, &v34);
      if (sub_20CFCD118() == v18 && v19 == v17)
      {
        swift_bridgeObjectRelease();
        goto LABEL_35;
      }
      v20 = sub_20CFCD430();
      swift_bridgeObjectRelease();
      if ((v20 & 1) != 0)
      {
LABEL_35:
        swift_bridgeObjectRelease();
        sub_20CF98B2C((uint64_t)&v34, (uint64_t)v33);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25499E578);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25499E580);
        if ((swift_dynamicCast() & 1) == 0)
          goto LABEL_8;
        v21 = ((uint64_t (*)())sub_20CFB2680)();
        swift_bridgeObjectRelease();
        result = __swift_destroy_boxed_opaque_existential_0((uint64_t)&v34);
        if ((v21 & 1) == 0)
          goto LABEL_48;
      }
      else
      {
        if (sub_20CFCD118() == v18 && v22 == v17)
        {
          swift_bridgeObjectRelease_n();
        }
        else
        {
          v23 = sub_20CFCD430();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v23 & 1) == 0)
            goto LABEL_8;
        }
        sub_20CF98B2C((uint64_t)&v34, (uint64_t)v33);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25499E578);
        if ((swift_dynamicCast() & 1) != 0)
        {
          if (v31 == sub_20CFCD118() && v32 == v24)
          {
            swift_bridgeObjectRelease_n();
            __swift_destroy_boxed_opaque_existential_0((uint64_t)&v34);
LABEL_48:
            swift_bridgeObjectRelease();
            swift_release();
            return 0;
          }
          v25 = sub_20CFCD430();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          result = __swift_destroy_boxed_opaque_existential_0((uint64_t)&v34);
          if ((v25 & 1) != 0)
            goto LABEL_48;
        }
        else
        {
LABEL_8:
          result = __swift_destroy_boxed_opaque_existential_0((uint64_t)&v34);
        }
      }
    }
    v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_53:
      __break(1u);
      return result;
    }
    if (v14 >= v30)
    {
LABEL_29:
      v6 = 0;
      memset(v35, 0, sizeof(v35));
      v34 = 0u;
      goto LABEL_30;
    }
    v15 = *(_QWORD *)(v29 + 8 * v14);
    if (!v15)
    {
      v16 = v8 + 2;
      ++v8;
      if (v14 + 1 >= v30)
        goto LABEL_29;
      v15 = *(_QWORD *)(v29 + 8 * v16);
      if (!v15)
      {
        v8 = v14 + 1;
        if (v14 + 2 >= v30)
          goto LABEL_29;
        v15 = *(_QWORD *)(v29 + 8 * (v14 + 2));
        if (v15)
        {
          v14 += 2;
          goto LABEL_15;
        }
        v16 = v14 + 3;
        v8 = v14 + 2;
        if (v14 + 3 >= v30)
          goto LABEL_29;
        v15 = *(_QWORD *)(v29 + 8 * v16);
        if (!v15)
        {
          while (1)
          {
            v14 = v16 + 1;
            if (__OFADD__(v16, 1))
              goto LABEL_53;
            if (v14 >= v30)
            {
              v8 = v30 - 1;
              goto LABEL_29;
            }
            v15 = *(_QWORD *)(v29 + 8 * v14);
            ++v16;
            if (v15)
              goto LABEL_15;
          }
        }
      }
      v14 = v16;
    }
LABEL_15:
    v6 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v14 << 6);
    v8 = v14;
    goto LABEL_11;
  }
  return 1;
}

uint64_t sub_20CFB2AEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  char v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  char v42;
  id v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t result;
  __int128 v61;
  __int128 v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[2];
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  __int128 v76;
  __int128 v77;
  char v78;

  v2 = v1;
  v71 = a1;
  v3 = (int *)type metadata accessor for TipSpotlightView();
  MEMORY[0x24BDAC7A8](v3);
  v70 = (uint64_t)v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6A88);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (int *)type metadata accessor for ConstellationContentAttributes(0);
  v12 = *((_QWORD *)v11 - 1);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v3[13];
  v16 = *(_QWORD *)(v1 + v15);
  if (v16 && (sub_20CFB2680(*(_QWORD *)(v1 + v15)) & 1) != 0)
  {
    v69 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE220]);
    v68 = sub_20CFCCC20();
    v76 = *(_OWORD *)(v1 + v3[8]);
    v66[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E558);
    sub_20CFCCCB0();
    v67 = v72;
    v17 = &v14[v11[15]];
    sub_20CFCCFE0();
    sub_20CFCC4F4();
    v18 = sub_20CFCC500();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 0, 1, v18);
    v19 = v68;
    *(_QWORD *)v14 = v69;
    *((_QWORD *)v14 + 1) = v19;
    *((_OWORD *)v14 + 1) = 0u;
    *((_OWORD *)v14 + 2) = 0u;
    *((_OWORD *)v14 + 3) = 0u;
    *((_QWORD *)v14 + 8) = 4;
    *((_QWORD *)v14 + 9) = 0x4024000000000000;
    v14[80] = 1;
    *((_QWORD *)v14 + 11) = v67;
    *((_QWORD *)v14 + 12) = 4;
    v20 = &v14[v11[16]];
    *(_QWORD *)v20 = 1;
    v20[8] = 0;
    v14[v11[17]] = 1;
    *(_WORD *)(v14 + 81) = 257;
    v69 = (id)sub_20CFA62C0(v16);
    v21 = sub_20CFCCFE0();
    v23 = v22;
    v24 = sub_20CFCC47C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v10, 1, 1, v24);
    sub_20CFAFE3C((uint64_t)v14, (uint64_t)v7, type metadata accessor for ConstellationContentAttributes);
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v12 + 56))(v7, 0, 1, v11);
    v25 = (_QWORD *)(v1 + v3[9]);
    v27 = v25[1];
    v28 = v25[2];
    *(_QWORD *)&v76 = *v25;
    v26 = v76;
    *((_QWORD *)&v76 + 1) = v27;
    *(_QWORD *)&v77 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25499E388);
    sub_20CFCCCB0();
    v29 = v72;
    *(_QWORD *)&v76 = v26;
    *((_QWORD *)&v76 + 1) = v27;
    *(_QWORD *)&v77 = v28;
    sub_20CFCCCB0();
    ConstellationContentView.init(rawContent:language:assetsBaseURL:assetFileInfoManager:attributes:size:maxWidth:textIsSelectable:delegate:)((uint64_t)v69, v21, v23, (uint64_t)v10, 0, (uint64_t)v7, v72, 0, (uint64_t *)&v76, *(double *)&v29, *((double *)&v29 + 1), 1u, 0, 0);
    v30 = v76;
    v31 = *(void **)v1;
    v32 = *(_BYTE *)(v1 + 8);
    sub_20CFB4908(*(id *)v2, *(_BYTE *)(v2 + 8));
    v33 = sub_20CFB40EC(v31, v32);
    sub_20CFB4A78(v31, v32);
    v34 = objc_msgSend(v33, sel_uniqueIdentifier);

    if (v34)
    {
      v35 = sub_20CFCD118();
      v37 = v36;

      v38 = v2;
      v39 = v70;
      sub_20CFAFE3C(v38, v70, (uint64_t (*)(_QWORD))type metadata accessor for TipSpotlightView);
      v40 = v71;
      if (v37)
      {
LABEL_14:
        sub_20CFAFE80(v39, (uint64_t (*)(_QWORD))type metadata accessor for TipSpotlightView);
        v72 = v30;
        v73 = v35;
        v74 = v37;
        v75 = 0;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25499E560);
        sub_20CF88608(&qword_25499E568, &qword_25499E560, MEMORY[0x24BDF44C8]);
        sub_20CFCC9BC();
        result = sub_20CFAFE80((uint64_t)v14, type metadata accessor for ConstellationContentAttributes);
        v61 = v76;
        v62 = v77;
        v63 = v78;
        goto LABEL_15;
      }
    }
    else
    {
      v64 = v2;
      v39 = v70;
      sub_20CFAFE3C(v64, v70, (uint64_t (*)(_QWORD))type metadata accessor for TipSpotlightView);
      v40 = v71;
    }
    v72 = *(_OWORD *)(v39 + v3[8]);
    sub_20CFCCCB0();
    v35 = sub_20CFCD424();
    v37 = v65;
    goto LABEL_14;
  }
  v41 = *(void **)v1;
  v42 = *(_BYTE *)(v1 + 8);
  sub_20CFB4908(*(id *)v2, *(_BYTE *)(v2 + 8));
  v43 = sub_20CFB40EC(v41, v42);
  sub_20CFB4A78(v41, v42);
  v44 = objc_msgSend(v43, sel_contentDescription);

  if (v44)
  {
    v45 = sub_20CFCD118();
    v47 = v46;

  }
  else
  {
    v45 = 0;
    v47 = 0xE000000000000000;
  }
  *(_QWORD *)&v76 = v45;
  *((_QWORD *)&v76 + 1) = v47;
  sub_20CF89020();
  v48 = sub_20CFCCB18();
  v50 = v49;
  v52 = v51;
  if (qword_25499DC10 != -1)
    swift_once();
  v53 = sub_20CFCCB0C();
  v55 = v54;
  v57 = v56;
  v59 = v58 & 1;
  sub_20CFA3DB4(v48, v50, v52 & 1);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v72 = v53;
  *((_QWORD *)&v72 + 1) = v55;
  v73 = v59;
  v74 = v57;
  v75 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499E560);
  sub_20CF88608(&qword_25499E568, &qword_25499E560, MEMORY[0x24BDF44C8]);
  result = sub_20CFCC9BC();
  v61 = v76;
  v62 = v77;
  v63 = v78;
  v40 = v71;
LABEL_15:
  *(_OWORD *)v40 = v61;
  *(_OWORD *)(v40 + 16) = v62;
  *(_BYTE *)(v40 + 32) = v63;
  return result;
}

uint64_t sub_20CFB3144(SEL *a1, _QWORD *a2)
{
  uint64_t v2;
  void *v5;
  char v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;

  v5 = *(void **)v2;
  v6 = *(_BYTE *)(v2 + 8);
  sub_20CFB4908(v5, v6);
  v7 = sub_20CFB40EC(v5, v6);
  sub_20CFB4A78(v5, v6);
  v8 = objc_msgSend(v7, *a1);

  if (v8)
  {
    sub_20CFCD118();

  }
  sub_20CF89020();
  v9 = sub_20CFCCB18();
  v11 = v10;
  v13 = v12;
  if (*a2 != -1)
    swift_once();
  v14 = sub_20CFCCB0C();
  sub_20CFA3DB4(v9, v11, v13 & 1);
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_20CFB3298@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t (*v23)(void);
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v31 = a1;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E528);
  MEMORY[0x24BDAC7A8](v29);
  v30 = (uint64_t)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_20CFCC824();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20CFCCD64();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E530);
  v9 = MEMORY[0x24BDAC7A8](v28);
  v11 = (uint64_t *)((char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v27 = (uint64_t)&v26 - v12;
  v13 = sub_20CFCC728();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v26 - v18;
  type metadata accessor for TipSpotlightView();
  sub_20CFB42B0(&qword_253EC70E0, (uint64_t (*)(_QWORD))MEMORY[0x24BDEB418], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v19);
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v17, *MEMORY[0x24BDEB400], v13);
  v20 = sub_20CFCC71C();
  v21 = *(void (**)(char *, uint64_t))(v14 + 8);
  v21(v17, v13);
  v21(v19, v13);
  if ((v20 & 1) != 0)
  {
    sub_20CFCCBE4();
    v22 = sub_20CFCCC14();
    swift_release();
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDF5080], v5);
  }
  else
  {
    sub_20CFCCBFC();
    v22 = sub_20CFCCC14();
    swift_release();
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDF5098], v5);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v4, v8, v5);
  v23 = MEMORY[0x24BDEDB60];
  sub_20CFAFE3C((uint64_t)v4, (uint64_t)v11 + *(int *)(v28 + 36), (uint64_t (*)(_QWORD))MEMORY[0x24BDEDB60]);
  *v11 = v22;
  swift_retain();
  sub_20CFAFE80((uint64_t)v4, (uint64_t (*)(_QWORD))v23);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_release();
  v24 = v27;
  sub_20CFAFDF8((uint64_t)v11, v27, &qword_25499E530);
  sub_20CF865C8(v24, v30, &qword_25499E530);
  swift_storeEnumTagMultiPayload();
  sub_20CFB6620();
  sub_20CFCC9BC();
  return sub_20CF8658C(v24, &qword_25499E530);
}

uint64_t sub_20CFB36B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  __int128 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
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
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  int v46;
  int v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t KeyPath;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  __int128 v64;

  v4 = sub_20CFB3144((SEL *)&selRef_displayName, &qword_25499DC08);
  v58 = v5;
  v49 = v6;
  v8 = v7;
  v53 = sub_20CFCCA58();
  v9 = (int *)type metadata accessor for TipSpotlightView();
  v10 = (__int128 *)(a1 + v9[10]);
  v11 = *((_QWORD *)v10 + 2);
  v60 = *v10;
  v61 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499E388);
  sub_20CFCCCB0();
  sub_20CFCC704();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v60 = *(_OWORD *)(a1 + v9[7]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499E558);
  sub_20CFCCCB0();
  v48 = v64;
  KeyPath = swift_getKeyPath();
  v47 = sub_20CFCC9EC();
  sub_20CFB2AEC((uint64_t)&v60);
  v51 = *((_QWORD *)&v60 + 1);
  v52 = v60;
  v50 = v61;
  v45 = v62;
  v20 = v63;
  v64 = *(_OWORD *)(a1 + v9[8]);
  sub_20CFCCCB0();
  v56 = swift_getKeyPath();
  v46 = sub_20CFCCA04();
  v21 = sub_20CFB0A9C();
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v54 = v4;
  v55 = v8;
  if (v21 == 2)
  {
    v26 = sub_20CFB3144((SEL *)&selRef_kind, &qword_25499DC18);
    v28 = v27;
    v30 = v29 & 1;
    LODWORD(v60) = sub_20CFCC9F8();
    v31 = sub_20CFCCB00();
    v33 = v32;
    v35 = v34;
    v37 = v36 & 1;
    v38 = v28;
    v8 = v55;
    sub_20CFA3DB4(v26, v38, v30);
    swift_bridgeObjectRelease();
    v24 = v37;
    v25 = v35;
    v23 = v33;
    v22 = v31;
  }
  LOBYTE(v60) = v49 & 1;
  LOBYTE(v64) = 0;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v58;
  *(_BYTE *)(a2 + 16) = v49 & 1;
  *(_QWORD *)(a2 + 24) = v8;
  *(_BYTE *)(a2 + 32) = v53;
  *(_QWORD *)(a2 + 40) = v13;
  *(_QWORD *)(a2 + 48) = v15;
  *(_QWORD *)(a2 + 56) = v17;
  *(_QWORD *)(a2 + 64) = v19;
  *(_BYTE *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 80) = KeyPath;
  *(_QWORD *)(a2 + 88) = v48;
  *(_BYTE *)(a2 + 96) = 0;
  *(_DWORD *)(a2 + 100) = v47;
  *(_WORD *)(a2 + 104) = 256;
  *(_QWORD *)(a2 + 112) = v52;
  *(_QWORD *)(a2 + 120) = v51;
  *(_QWORD *)(a2 + 128) = v50;
  *(_QWORD *)(a2 + 136) = v45;
  *(_BYTE *)(a2 + 144) = v20;
  *(_QWORD *)(a2 + 152) = v56;
  *(_QWORD *)(a2 + 160) = v59;
  *(_BYTE *)(a2 + 168) = 0;
  *(_DWORD *)(a2 + 172) = v46;
  *(_WORD *)(a2 + 176) = 256;
  *(_QWORD *)(a2 + 184) = v22;
  *(_QWORD *)(a2 + 192) = v23;
  *(_QWORD *)(a2 + 200) = v24;
  *(_QWORD *)(a2 + 208) = v25;
  v39 = v4;
  v40 = v23;
  v41 = v24;
  v42 = v22;
  v43 = v25;
  sub_20CFB6748(v39, v58, v49 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_20CFB6758(v52, v51, v50, v45, v20);
  swift_retain();
  sub_20CFB6790(v42, v40, v41, v43);
  sub_20CFB68BC(v42, v40, v41, v43);
  sub_20CFB6884(v52, v51, v50, v45, v20);
  swift_release();
  sub_20CFA3DB4(v54, v58, v49 & 1);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFB3A90(double a1, double a2)
{
  type metadata accessor for TipSpotlightView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499E388);
  sub_20CFCCCBC();
  sub_20CFCCCB0();
  return sub_20CFB3B3C(a1, a2);
}

uint64_t sub_20CFB3B3C(double a1, double a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t, uint64_t);
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 *v17;
  uint64_t v18;
  char v19;
  char v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E550);
  result = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 != 0.0 || a2 != 0.0)
  {
    v9 = type metadata accessor for TipSpotlightView();
    if (qword_25499DC20 != -1)
      swift_once();
    v10 = sub_20CFCCAD0();
    v11 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
    v11(v8, 1, 1, v10);
    sub_20CFCCADC();
    v13 = v12;
    sub_20CF8658C((uint64_t)v8, &qword_25499E550);
    v14 = sub_20CFB3144((SEL *)&selRef_displayName, &qword_25499DC08);
    v16 = v15;
    v26 = v9;
    v17 = (__int128 *)(v2 + *(int *)(v9 + 40));
    v18 = *((_QWORD *)v17 + 2);
    v20 = v19 & 1;
    v27 = *v17;
    v28 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25499E388);
    sub_20CFCCCB0();
    v11(v8, 1, 1, v10);
    sub_20CFCCADC();
    v22 = v21;
    sub_20CFA3DB4(v14, v16, v20);
    swift_bridgeObjectRelease();
    result = sub_20CF8658C((uint64_t)v8, &qword_25499E550);
    v23 = round(v22 / v13);
    if ((~*(_QWORD *)&v23 & 0x7FF0000000000000) != 0)
    {
      if (v23 > -9.22337204e18)
      {
        if (v23 < 9.22337204e18)
        {
          v24 = (uint64_t)v23;
          if ((uint64_t)v23 >= 4)
          {
            v25 = v26;
            v27 = *(_OWORD *)(v2 + *(int *)(v26 + 32));
            v29 = 1;
            __swift_instantiateConcreteTypeFromMangledName(&qword_25499E558);
            sub_20CFCCCBC();
            v24 = 4;
            goto LABEL_12;
          }
          v25 = v26;
          if (!__OFSUB__(4, v24))
          {
            v27 = *(_OWORD *)(v2 + *(int *)(v26 + 32));
            v29 = 4 - v24;
            __swift_instantiateConcreteTypeFromMangledName(&qword_25499E558);
            sub_20CFCCCBC();
LABEL_12:
            v27 = *(_OWORD *)(v2 + *(int *)(v25 + 28));
            v29 = v24;
            __swift_instantiateConcreteTypeFromMangledName(&qword_25499E558);
            return sub_20CFCCCBC();
          }
LABEL_17:
          __break(1u);
          return result;
        }
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_20CFB3E6C()
{
  double v1;
  double v2;

  type metadata accessor for TipSpotlightView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499E388);
  sub_20CFCCCB0();
  return sub_20CFB3B3C(v1, v2);
}

uint64_t sub_20CFB3ED4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v0 = sub_20CFCCAA0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CFCCA7C();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDF17C8], v0);
  sub_20CFCCAAC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v4 = sub_20CFCCA88();
  result = swift_release();
  qword_25499E348 = v4;
  return result;
}

uint64_t sub_20CFB3FA0()
{
  uint64_t result;

  result = sub_20CFCCA70();
  qword_25499E350 = result;
  return result;
}

uint64_t sub_20CFB3FBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v0 = sub_20CFCCAA0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CFCCAB8();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDF17C8], v0);
  v4 = sub_20CFCCAAC();
  swift_release();
  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_25499E358 = v4;
  return result;
}

uint64_t sub_20CFB4074()
{
  uint64_t result;
  uint64_t v1;
  char v2;
  uint64_t v3;

  if (qword_25499DC08 != -1)
    swift_once();
  result = sub_20CFCCB0C();
  qword_25499E360 = result;
  *(_QWORD *)algn_25499E368 = v1;
  byte_25499E370 = v2 & 1;
  qword_25499E378 = v3;
  return result;
}

id sub_20CFB40EC(void *a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  os_log_type_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v15;
  uint64_t v16;

  v15 = a1;
  v3 = sub_20CFCC8C0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return v15;
  swift_retain();
  v7 = sub_20CFCD244();
  v8 = sub_20CFCCA34();
  v9 = v7;
  if (os_log_type_enabled(v8, v7))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v16 = v11;
    *(_DWORD *)v10 = 136315138;
    sub_20CF82934(0, &qword_25499E548);
    v12 = sub_20CFCD4E4();
    *(_QWORD *)(v10 + 4) = sub_20CFB6058(v12, v13, &v16);
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20CF80000, v8, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212B9AAFC](v11, -1, -1);
    MEMORY[0x212B9AAFC](v10, -1, -1);
  }

  sub_20CFCC8B4();
  swift_getAtKeyPath();
  sub_20CFB4A78(v15, 0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (id)v16;
}

uint64_t sub_20CFB42B0@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  os_log_type_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;

  v24 = a4;
  v9 = v5;
  v11 = sub_20CFCC8C0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CF865C8(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    v20 = sub_20CFCD244();
    v21 = sub_20CFCCA34();
    if (os_log_type_enabled(v21, v20))
    {
      v22 = swift_slowAlloc();
      v23 = swift_slowAlloc();
      v25 = v23;
      *(_DWORD *)v22 = 136315138;
      *(_QWORD *)(v22 + 4) = sub_20CFB6058(a3, v24, &v25);
      _os_log_impl(&dword_20CF80000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212B9AAFC](v23, -1, -1);
      MEMORY[0x212B9AAFC](v22, -1, -1);
    }

    sub_20CFCC8B4();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_20CFB44B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_20CFCC83C();
  *a1 = result;
  return result;
}

uint64_t sub_20CFB44E0(id *a1)
{
  id v1;

  v1 = *a1;
  return sub_20CFCC848();
}

uint64_t sub_20CFB4508()
{
  return sub_20CFCC878();
}

uint64_t sub_20CFB4528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CFB456C(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDEB418], MEMORY[0x24BDEDEF8]);
}

uint64_t sub_20CFB454C()
{
  return sub_20CFCC86C();
}

uint64_t sub_20CFB456C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(char *))
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  a5(0);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_20CFB45E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CFB456C(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDEB1F0], MEMORY[0x24BDEDEC8]);
}

uint64_t sub_20CFB460C()
{
  return sub_20CF82E3C(&qword_253EC70C8, (uint64_t (*)(uint64_t))type metadata accessor for TipSpotlightView, (uint64_t)&protocol conformance descriptor for TipSpotlightView);
}

uint64_t sub_20CFB4638()
{
  return sub_20CF82E3C(&qword_253EC70C0, (uint64_t (*)(uint64_t))type metadata accessor for TipSpotlightView, (uint64_t)&protocol conformance descriptor for TipSpotlightView);
}

uint64_t sub_20CFB4664()
{
  return sub_20CF82E3C(&qword_253EC70B0, (uint64_t (*)(uint64_t))type metadata accessor for TipSpotlightView, (uint64_t)&protocol conformance descriptor for TipSpotlightView);
}

uint64_t sub_20CFB4690()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for TipSpotlightView(char *a1, char **a2, int *a3)
{
  int v5;
  char *v7;
  char v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _QWORD *v21;
  uint64_t v22;
  char *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v41;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v13[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    v7 = *a2;
    v8 = *((_BYTE *)a2 + 8);
    sub_20CFB4908(*a2, v8);
    *(_QWORD *)a1 = v7;
    a1[8] = v8;
    v9 = a3[5];
    v10 = &a1[v9];
    v11 = (char **)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC70E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_20CFCC728();
      (*(void (**)(char *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *(_QWORD *)v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v14 = a3[6];
    v15 = &a1[v14];
    v16 = (char **)((char *)a2 + v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC70D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v17 = sub_20CFCC710();
      (*(void (**)(char *, _QWORD *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *(_QWORD *)v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v18 = a3[7];
    v19 = a3[8];
    v20 = &a1[v18];
    v21 = (char **)((char *)a2 + v18);
    v22 = v21[1];
    *(_QWORD *)v20 = *v21;
    *((_QWORD *)v20 + 1) = v22;
    v23 = &a1[v19];
    v24 = (char **)((char *)a2 + v19);
    v25 = v24[1];
    *(_QWORD *)v23 = *v24;
    *((_QWORD *)v23 + 1) = v25;
    v26 = a3[9];
    v27 = a3[10];
    v28 = &a1[v26];
    v29 = (uint64_t)a2 + v26;
    *(_OWORD *)v28 = *(_OWORD *)v29;
    *((_QWORD *)v28 + 2) = *(_QWORD *)(v29 + 16);
    v30 = &a1[v27];
    v31 = (uint64_t)a2 + v27;
    *(_OWORD *)v30 = *(_OWORD *)v31;
    *((_QWORD *)v30 + 2) = *(_QWORD *)(v31 + 16);
    v32 = a3[11];
    v41 = &a1[v32];
    v33 = (uint64_t)a2 + v32;
    v34 = sub_20CFCCAF4();
    v35 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v35(v41, v33, v34);
    v36 = a3[12];
    v37 = &a1[v36];
    v38 = (uint64_t)a2 + v36;
    v39 = sub_20CFCCFEC();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 16))(v37, v38, v39);
    *(_QWORD *)&a1[a3[13]] = *(char **)((char *)a2 + a3[13]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

id sub_20CFB4908(id a1, char a2)
{
  if ((a2 & 1) != 0)
    return a1;
  else
    return (id)swift_retain();
}

uint64_t destroy for TipSpotlightView(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_20CFB4A78(*(id *)a1, *(_BYTE *)(a1 + 8));
  v4 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC70E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_20CFCC728();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  v6 = a1 + a2[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC70D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_20CFCC710();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v8 = a1 + a2[11];
  v9 = sub_20CFCCAF4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = a1 + a2[12];
  v11 = sub_20CFCCFEC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  return swift_bridgeObjectRelease();
}

void sub_20CFB4A78(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_release();
}

uint64_t initializeWithCopy for TipSpotlightView(uint64_t a1, uint64_t a2, int *a3)
{
  id v6;
  char v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
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
  void (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;

  v6 = *(id *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_20CFB4908(*(id *)a2, v7);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  v8 = a3[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC70E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_20CFCC728();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    *v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v12 = a3[6];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (_QWORD *)(a2 + v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC70D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = sub_20CFCC710();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  }
  else
  {
    *v13 = *v14;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v16 = a3[7];
  v17 = a3[8];
  v18 = (_QWORD *)(a1 + v16);
  v19 = (_QWORD *)(a2 + v16);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  v21 = (_QWORD *)(a1 + v17);
  v22 = (_QWORD *)(a2 + v17);
  v23 = v22[1];
  *v21 = *v22;
  v21[1] = v23;
  v24 = a3[9];
  v25 = a3[10];
  v26 = a1 + v24;
  v27 = a2 + v24;
  *(_OWORD *)v26 = *(_OWORD *)v27;
  *(_QWORD *)(v26 + 16) = *(_QWORD *)(v27 + 16);
  v28 = a1 + v25;
  v29 = a2 + v25;
  *(_OWORD *)v28 = *(_OWORD *)v29;
  *(_QWORD *)(v28 + 16) = *(_QWORD *)(v29 + 16);
  v30 = a3[11];
  v39 = a1 + v30;
  v31 = a2 + v30;
  v32 = sub_20CFCCAF4();
  v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v33(v39, v31, v32);
  v34 = a3[12];
  v35 = a1 + v34;
  v36 = a2 + v34;
  v37 = sub_20CFCCFEC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 16))(v35, v36, v37);
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TipSpotlightView(uint64_t a1, uint64_t a2, int *a3)
{
  id v6;
  char v7;
  void *v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v6 = *(id *)a2;
  v7 = *(_BYTE *)(a2 + 8);
  sub_20CFB4908(*(id *)a2, v7);
  v8 = *(void **)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_20CFB4A78(v8, v9);
  if (a1 != a2)
  {
    v10 = a3[5];
    v11 = (_QWORD *)(a1 + v10);
    v12 = (_QWORD *)(a2 + v10);
    sub_20CF8658C(a1 + v10, &qword_253EC70E0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC70E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_20CFCC728();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v14 = a3[6];
    v15 = (_QWORD *)(a1 + v14);
    v16 = (_QWORD *)(a2 + v14);
    sub_20CF8658C(a1 + v14, &qword_253EC70D0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC70D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v17 = sub_20CFCC710();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v18 = a3[7];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (_QWORD *)(a2 + v18);
  *v19 = *v20;
  v19[1] = v20[1];
  swift_retain();
  swift_release();
  v21 = a3[8];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (_QWORD *)(a2 + v21);
  *v22 = *v23;
  v22[1] = v23[1];
  swift_retain();
  swift_release();
  v24 = a3[9];
  v25 = (_QWORD *)(a1 + v24);
  v26 = (_QWORD *)(a2 + v24);
  *v25 = *v26;
  v25[1] = v26[1];
  v25[2] = v26[2];
  swift_retain();
  swift_release();
  v27 = a3[10];
  v28 = (_QWORD *)(a1 + v27);
  v29 = (_QWORD *)(a2 + v27);
  *v28 = *v29;
  v28[1] = v29[1];
  v28[2] = v29[2];
  swift_retain();
  swift_release();
  v30 = a3[11];
  v31 = a1 + v30;
  v32 = a2 + v30;
  v33 = sub_20CFCCAF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 24))(v31, v32, v33);
  v34 = a3[12];
  v35 = a1 + v34;
  v36 = a2 + v34;
  v37 = sub_20CFCCFEC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 24))(v35, v36, v37);
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for TipSpotlightView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 *v20;
  __int128 v21;
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

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = a3[5];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC70E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_20CFCC728();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = a3[6];
  v12 = (void *)(a1 + v11);
  v13 = (const void *)(a2 + v11);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC70D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = sub_20CFCC710();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  v16 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v16) = *(_OWORD *)(a2 + v16);
  v17 = a3[9];
  v18 = a3[10];
  v19 = a1 + v17;
  v20 = (__int128 *)(a2 + v17);
  v21 = *v20;
  *(_QWORD *)(v19 + 16) = *((_QWORD *)v20 + 2);
  *(_OWORD *)v19 = v21;
  v22 = a1 + v18;
  v23 = a2 + v18;
  *(_OWORD *)v22 = *(_OWORD *)v23;
  *(_QWORD *)(v22 + 16) = *(_QWORD *)(v23 + 16);
  v24 = a3[11];
  v25 = a1 + v24;
  v26 = a2 + v24;
  v27 = sub_20CFCCAF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v25, v26, v27);
  v28 = a3[12];
  v29 = a1 + v28;
  v30 = a2 + v28;
  v31 = sub_20CFCCFEC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v29, v30, v31);
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  return a1;
}

uint64_t assignWithTake for TipSpotlightView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  char v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
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

  v6 = *a2;
  v7 = *((_BYTE *)a2 + 8);
  v8 = *(void **)a1;
  v9 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v6;
  *(_BYTE *)(a1 + 8) = v7;
  sub_20CFB4A78(v8, v9);
  if ((uint64_t *)a1 != a2)
  {
    v10 = a3[5];
    v11 = (void *)(a1 + v10);
    v12 = (char *)a2 + v10;
    sub_20CF8658C(a1 + v10, &qword_253EC70E0);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC70E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v14 = sub_20CFCC728();
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    v15 = a3[6];
    v16 = (void *)(a1 + v15);
    v17 = (char *)a2 + v15;
    sub_20CF8658C(a1 + v15, &qword_253EC70D0);
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC70D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = sub_20CFCC710();
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v16, v17, v19);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
  }
  v20 = a3[7];
  v21 = (_QWORD *)(a1 + v20);
  v22 = (uint64_t *)((char *)a2 + v20);
  v24 = *v22;
  v23 = v22[1];
  *v21 = v24;
  v21[1] = v23;
  swift_release();
  v25 = a3[8];
  v26 = (_QWORD *)(a1 + v25);
  v27 = (uint64_t *)((char *)a2 + v25);
  v29 = *v27;
  v28 = v27[1];
  *v26 = v29;
  v26[1] = v28;
  swift_release();
  v30 = a3[9];
  v31 = a1 + v30;
  v32 = (uint64_t)a2 + v30;
  *(_OWORD *)v31 = *(_OWORD *)v32;
  *(_QWORD *)(v31 + 16) = *(_QWORD *)(v32 + 16);
  swift_release();
  v33 = a3[10];
  v34 = a1 + v33;
  v35 = (uint64_t)a2 + v33;
  *(_OWORD *)v34 = *(_OWORD *)v35;
  *(_QWORD *)(v34 + 16) = *(_QWORD *)(v35 + 16);
  swift_release();
  v36 = a3[11];
  v37 = a1 + v36;
  v38 = (uint64_t)a2 + v36;
  v39 = sub_20CFCCAF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 40))(v37, v38, v39);
  v40 = a3[12];
  v41 = a1 + v40;
  v42 = (uint64_t)a2 + v40;
  v43 = sub_20CFCCFEC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 40))(v41, v42, v43);
  *(_QWORD *)(a1 + a3[13]) = *(uint64_t *)((char *)a2 + a3[13]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TipSpotlightView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CFB53AC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E398);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E3A0);
  v7 = *(_QWORD *)(v10 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v10;
    v9 = a3[6];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    v14 = sub_20CFCCAF4();
    v7 = *(_QWORD *)(v14 - 8);
    if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    {
      v8 = v14;
      v9 = a3[11];
    }
    else
    {
      v8 = sub_20CFCCFEC();
      v7 = *(_QWORD *)(v8 - 8);
      v9 = a3[12];
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + a3[7] + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  v12 = v11 - 1;
  if (v12 < 0)
    v12 = -1;
  return (v12 + 1);
}

uint64_t storeEnumTagSinglePayload for TipSpotlightView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20CFB54BC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E398);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = a4[5];
  }
  else
  {
    result = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E3A0);
    v9 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = result;
      v11 = a4[6];
    }
    else
    {
      if (a3 == 2147483646)
      {
        *(_QWORD *)(a1 + a4[7] + 8) = a2;
        return result;
      }
      v13 = sub_20CFCCAF4();
      v9 = *(_QWORD *)(v13 - 8);
      if (*(_DWORD *)(v9 + 84) == a3)
      {
        v10 = v13;
        v11 = a4[11];
      }
      else
      {
        v10 = sub_20CFCCFEC();
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a4[12];
      }
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
}

void sub_20CFB55B0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_20CFB56B8(319, &qword_253EC70E8, (void (*)(uint64_t))MEMORY[0x24BDEB418]);
  if (v0 <= 0x3F)
  {
    sub_20CFB56B8(319, &qword_253EC70D8, (void (*)(uint64_t))MEMORY[0x24BDEB1F0]);
    if (v1 <= 0x3F)
    {
      sub_20CFCCAF4();
      if (v2 <= 0x3F)
      {
        sub_20CFCCFEC();
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

void sub_20CFB56B8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_20CFCC740();
    if (!v5)
      atomic_store(v4, a2);
  }
}

unint64_t sub_20CFB5708()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25499E3A8;
  if (!qword_25499E3A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499E390);
    v2[0] = sub_20CFB578C();
    v2[1] = sub_20CF88608(&qword_25499E478, &qword_25499E480, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25499E3A8);
  }
  return result;
}

unint64_t sub_20CFB578C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_25499E3B0;
  if (!qword_25499E3B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499E380);
    v2 = sub_20CFB57F0();
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25499E3B0);
  }
  return result;
}

unint64_t sub_20CFB57F0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25499E3B8;
  if (!qword_25499E3B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499E3C0);
    v2[0] = sub_20CFB587C();
    v2[1] = sub_20CFB5A58(&qword_25499E3F8, &qword_25499E400, (uint64_t (*)(void))sub_20CFB5908, MEMORY[0x24BDECC60]);
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25499E3B8);
  }
  return result;
}

unint64_t sub_20CFB587C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25499E3C8;
  if (!qword_25499E3C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499E3D0);
    v2 = sub_20CFB6C48(&qword_25499E3D8, &qword_25499E3E0, &qword_25499E3E8, &qword_25499E3F0);
    v3[0] = MEMORY[0x24BDF5138];
    v3[1] = v2;
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25499E3C8);
  }
  return result;
}

unint64_t sub_20CFB5908()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  _QWORD v4[6];

  result = qword_25499E408;
  if (!qword_25499E408)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499DED0);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499E410);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499E418);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499E420);
    sub_20CFCC710();
    v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEB1F0];
    v4[4] = sub_20CFB5A58(&qword_25499E428, &qword_25499E420, (uint64_t (*)(void))sub_20CFB5AC0, MEMORY[0x24BDF0910]);
    v4[5] = sub_20CF82E3C(&qword_25499E470, v3, MEMORY[0x24BDEB200]);
    swift_getOpaqueTypeConformance2();
    v4[2] = v2;
    v4[3] = swift_getOpaqueTypeConformance2();
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_25499E408);
  }
  return result;
}

uint64_t sub_20CFB5A58(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
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
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_20CFB5AC0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25499E430;
  if (!qword_25499E430)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499E438);
    v2[0] = sub_20CFB5B44();
    v2[1] = sub_20CF88608(&qword_253EC6AF0, &qword_253EC6AF8, MEMORY[0x24BDF09B0]);
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25499E430);
  }
  return result;
}

unint64_t sub_20CFB5B44()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25499E440;
  if (!qword_25499E440)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499E448);
    v2[0] = sub_20CFB5BC8();
    v2[1] = sub_20CF88608(&qword_253EC6AE0, &qword_253EC6AE8, MEMORY[0x24BDEF370]);
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25499E440);
  }
  return result;
}

unint64_t sub_20CFB5BC8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25499E450;
  if (!qword_25499E450)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499E458);
    v2[0] = sub_20CF88608(&qword_25499E460, &qword_25499E468, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDEDB58];
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25499E450);
  }
  return result;
}

uint64_t destroy for TipSpotlightView.AttributionView()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for TipSpotlightView.AttributionView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for TipSpotlightView.AttributionView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
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

_OWORD *assignWithTake for TipSpotlightView.AttributionView(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for TipSpotlightView.AttributionView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TipSpotlightView.AttributionView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TipSpotlightView.AttributionView()
{
  return &type metadata for TipSpotlightView.AttributionView;
}

uint64_t sub_20CFB5E04()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20CFB5E14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E508);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499E540);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (uint64_t *)((char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_20CFCCC68();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_20CFCC7E8())
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BDF3FD0], v7);
    v11 = sub_20CFCCC8C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    *v6 = v11;
    swift_storeEnumTagMultiPayload();
    sub_20CF88608(&qword_25499E500, &qword_25499E508, MEMORY[0x24BDEBC00]);
    swift_retain_n();
    sub_20CFCC9BC();
    swift_release_n();
    return swift_release();
  }
  else
  {
    sub_20CFCC764();
    (*(void (**)(uint64_t *, char *, uint64_t))(v1 + 16))(v6, v3, v0);
    swift_storeEnumTagMultiPayload();
    sub_20CF88608(&qword_25499E500, &qword_25499E508, MEMORY[0x24BDEBC00]);
    sub_20CFCC9BC();
    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
}

unint64_t sub_20CFB6058(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_20CFB6128(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_20CF98B2C((uint64_t)v12, *a3);
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
      sub_20CF98B2C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_20CFB6128(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_20CFB6224(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_20CFCD3B8();
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

uint64_t sub_20CFB6224(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_20CFB62B8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_20CFB63B4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_20CFB63B4((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_20CFB62B8(uint64_t a1, unint64_t a2)
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
      v3 = sub_20CFB6350(v2, 0);
      result = sub_20CFCD37C();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_20CFCD160();
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

_QWORD *sub_20CFB6350(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499E520);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_20CFB63B4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25499E520);
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

uint64_t sub_20CFB649C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_20CFCC884();
  *a1 = result;
  return result;
}

uint64_t sub_20CFB64C4()
{
  swift_retain();
  return sub_20CFCC890();
}

uint64_t sub_20CFB64EC()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20CFB6518()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499E488);
  return sub_20CFCCD04();
}

uint64_t sub_20CFB6570()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20CFB6594(double *a1)
{
  uint64_t v1;

  return sub_20CFBBA54(a1, *(uint64_t (**)(double, double))(v1 + 16));
}

unint64_t sub_20CFB659C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25499E4F8;
  if (!qword_25499E4F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499E4F0);
    v2 = sub_20CF88608(&qword_25499E500, &qword_25499E508, MEMORY[0x24BDEBC00]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25499E4F8);
  }
  return result;
}

unint64_t sub_20CFB6620()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25499E538;
  if (!qword_25499E538)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499E530);
    v2[0] = MEMORY[0x24BDF3E20];
    v2[1] = MEMORY[0x24BDEDB58];
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25499E538);
  }
  return result;
}

uint64_t sub_20CFB6684(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 136);
  v3 = *(_QWORD *)(a1 + 144);
  v4 = *(_QWORD *)(a1 + 152);
  v5 = *(_QWORD *)(a1 + 160);
  v6 = *(_BYTE *)(a1 + 168);
  v7 = *(_QWORD *)(a1 + 208);
  v10 = *(_QWORD *)(a1 + 224);
  v11 = *(_QWORD *)(a1 + 216);
  v9 = *(_QWORD *)(a1 + 232);
  sub_20CFB6748(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_20CFB6758(v2, v3, v4, v5, v6);
  swift_retain();
  sub_20CFB6790(v7, v11, v10, v9);
  return a1;
}

uint64_t sub_20CFB6748(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_20CFB6758(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0)
    sub_20CFB6748(a1, a2, a3 & 1);
  else
    swift_retain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_20CFB6790(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_20CFB6748(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_20CFB67C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 112);
  v3 = *(_QWORD *)(a1 + 120);
  v4 = *(_QWORD *)(a1 + 128);
  v5 = *(_QWORD *)(a1 + 136);
  v6 = *(_BYTE *)(a1 + 144);
  v7 = *(_QWORD *)(a1 + 184);
  v10 = *(_QWORD *)(a1 + 200);
  v11 = *(_QWORD *)(a1 + 192);
  v9 = *(_QWORD *)(a1 + 208);
  sub_20CFA3DB4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release();
  swift_bridgeObjectRelease();
  sub_20CFB6884(v2, v3, v4, v5, v6);
  swift_release();
  sub_20CFB68BC(v7, v11, v10, v9);
  return a1;
}

uint64_t sub_20CFB6884(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0)
    sub_20CFA3DB4(a1, a2, a3 & 1);
  else
    swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFB68BC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_20CFA3DB4(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_20CFB68F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TipSpotlightView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20CFB6934(double a1, double a2)
{
  type metadata accessor for TipSpotlightView();
  return sub_20CFB3A90(a1, a2);
}

uint64_t objectdestroy_18Tm()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = (int *)type metadata accessor for TipSpotlightView();
  v2 = v0
     + ((*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80));
  sub_20CFB4A78(*(id *)v2, *(_BYTE *)(v2 + 8));
  v3 = v2 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC70E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_20CFCC728();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  }
  else
  {
    swift_release();
  }
  v5 = v2 + v1[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC70D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20CFCC710();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v7 = v2 + v1[11];
  v8 = sub_20CFCCAF4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = v2 + v1[12];
  v10 = sub_20CFCCFEC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20CFB6B2C()
{
  type metadata accessor for TipSpotlightView();
  return sub_20CFB3E6C();
}

uint64_t sub_20CFB6B5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_20CFCC89C();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_20CFB6B8C()
{
  return sub_20CFCC8A8();
}

unint64_t sub_20CFB6BBC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25499E588;
  if (!qword_25499E588)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499E590);
    v2[0] = sub_20CFB6C48(&qword_25499E598, &qword_25499E5A0, &qword_25499E5A8, &qword_25499E5B0);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25499E588);
  }
  return result;
}

uint64_t sub_20CFB6C48(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = sub_20CF88608(a3, a4, MEMORY[0x24BDF4498]);
    v9[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t static CollectionsViewModel.userGuideIdentifier.getter()
{
  return 0x6469754772657355;
}

uint64_t static CollectionsViewModel.searchIdentifier.getter()
{
  return 0x686372616553;
}

uint64_t (*sub_20CFB6D04())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_20CFB6D40@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v4 = *(void **)(v3 + 16);
  *a2 = v4;
  return v4;
}

void sub_20CFB6DE0(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  v2 = v1;
  sub_20CFCC518();
  swift_release();

}

id sub_20CFB6E94()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  return *(id *)(v0 + 16);
}

uint64_t type metadata accessor for CollectionsViewModel()
{
  uint64_t result;

  result = qword_25499E5F8;
  if (!qword_25499E5F8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_20CFB6F70(void *a1)
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC518();
  swift_release();

}

void sub_20CFB7018(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  swift_beginAccess();
  v4 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2;
  v5 = a2;

}

void sub_20CFB7074()
{
  uint64_t v0;

  sub_20CFB7018(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void (*sub_20CFB708C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20CFCC53C();
  swift_release();
  v4[7] = sub_20CFB6D04();
  return sub_20CFB7174;
}

void sub_20CFB7174(_QWORD *a1)
{
  sub_20CFB8C00(a1);
}

uint64_t sub_20CFB7180()
{
  uint64_t v0;
  void *v1;
  char *v2;
  char *v3;
  uint64_t v4;

  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v1 = *(void **)(v0 + 16);
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  v2 = v1;
  sub_20CFCC524();
  swift_release();
  v3 = &v2[OBJC_IVAR____TtC6TipsUI16TipsContentModel__collections];
  swift_beginAccess();
  v4 = *(_QWORD *)v3;
  swift_bridgeObjectRetain();

  return v4;
}

uint64_t (*sub_20CFB72AC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFB72E8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 32);
  *a2 = *(_QWORD *)(v3 + 24);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20CFB738C()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  swift_bridgeObjectRetain();
  sub_20CFCC518();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFB7448()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_20CFB74F0()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC518();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFB75A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 24) = a2;
  *(_QWORD *)(a1 + 32) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_20CFB760C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20CFCC53C();
  swift_release();
  v4[7] = sub_20CFB72AC();
  return sub_20CFB76F4;
}

void sub_20CFB76F4(_QWORD *a1)
{
  sub_20CFB8C00(a1);
}

uint64_t (*sub_20CFB7700())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_20CFB773C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v4 = *(void **)(v3 + 40);
  *a2 = v4;
  return v4;
}

void sub_20CFB77DC(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  v2 = v1;
  sub_20CFCC518();
  swift_release();

}

void *sub_20CFB7890()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v1 = *(void **)(v0 + 40);
  v2 = v1;
  return v1;
}

void sub_20CFB7930(void *a1)
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC518();
  swift_release();

}

void sub_20CFB79D8(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  swift_beginAccess();
  v4 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = a2;
  v5 = a2;

}

void (*sub_20CFB7A34(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20CFCC53C();
  swift_release();
  v4[7] = sub_20CFB7700();
  return sub_20CFB7B1C;
}

void sub_20CFB7B1C(_QWORD *a1)
{
  sub_20CFB8C00(a1);
}

uint64_t (*sub_20CFB7B28())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_20CFB7B64@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v4 = *(void **)(v3 + 48);
  *a2 = v4;
  return v4;
}

void sub_20CFB7C04(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  v2 = v1;
  sub_20CFCC518();
  swift_release();

}

void *sub_20CFB7CB8()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v1 = *(void **)(v0 + 48);
  v2 = v1;
  return v1;
}

void sub_20CFB7D58(void *a1)
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC518();
  swift_release();

}

void sub_20CFB7E00(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  swift_beginAccess();
  v4 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = a2;
  v5 = a2;

}

void (*sub_20CFB7E5C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20CFCC53C();
  swift_release();
  v4[7] = sub_20CFB7B28();
  return sub_20CFB7F44;
}

void sub_20CFB7F44(_QWORD *a1)
{
  sub_20CFB8C00(a1);
}

uint64_t sub_20CFB7F50()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;

  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v1 = *(id *)(v0 + 16);
  sub_20CFC0138();
  v3 = v2;

  return v3;
}

uint64_t sub_20CFB8000()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char *v3;
  char *v4;
  char v5;
  void *v6;
  char *v7;
  char *v8;

  v1 = v0;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v2 = *(void **)(v0 + 16);
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  v3 = v2;
  sub_20CFCC524();
  swift_release();
  v4 = &v3[OBJC_IVAR____TtC6TipsUI16TipsContentModel__loading];
  swift_beginAccess();
  LOBYTE(v4) = *v4;

  if ((v4 & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    swift_getKeyPath();
    sub_20CFCC524();
    swift_release();
    v6 = *(void **)(v1 + 16);
    swift_getKeyPath();
    v7 = v6;
    sub_20CFCC524();
    swift_release();
    v8 = &v7[OBJC_IVAR____TtC6TipsUI16TipsContentModel__hasLoaded];
    swift_beginAccess();
    LOBYTE(v8) = *v8;

    v5 = v8 ^ 1;
  }
  return v5 & 1;
}

BOOL sub_20CFB81E4()
{
  uint64_t v0;
  void *v1;
  char *v2;
  char *v3;
  unint64_t v4;
  uint64_t v5;

  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v1 = *(void **)(v0 + 16);
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  v2 = v1;
  sub_20CFCC524();
  swift_release();
  v3 = &v2[OBJC_IVAR____TtC6TipsUI16TipsContentModel__collections];
  swift_beginAccess();
  v4 = *(_QWORD *)v3;
  swift_bridgeObjectRetain();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_20CFCD3D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v5 == 0;
}

uint64_t (*sub_20CFB8358())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFB8394@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 64);
  *a2 = *(_QWORD *)(v3 + 56);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20CFB8438()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  swift_bridgeObjectRetain();
  sub_20CFCC518();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFB84F4()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_20CFB859C()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC518();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFB8650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 56) = a2;
  *(_QWORD *)(a1 + 64) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_20CFB86B8(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20CFCC53C();
  swift_release();
  v4[7] = sub_20CFB8358();
  return sub_20CFB87A0;
}

void sub_20CFB87A0(_QWORD *a1)
{
  sub_20CFB8C00(a1);
}

uint64_t (*sub_20CFB87AC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFB87E8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 80);
  *a2 = *(_QWORD *)(v3 + 72);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20CFB888C()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  swift_bridgeObjectRetain();
  sub_20CFCC518();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFB8948()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_20CFB89F0()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC518();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFB8AA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 72) = a2;
  *(_QWORD *)(a1 + 80) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_20CFB8B0C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20CFCC53C();
  swift_release();
  v4[7] = sub_20CFB87AC();
  return sub_20CFB8BF4;
}

void sub_20CFB8BF4(_QWORD *a1)
{
  sub_20CFB8C00(a1);
}

void sub_20CFB8C00(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 56))(*a1, 0);
  *v1 = v1[4];
  swift_getKeyPath();
  sub_20CFCC530();
  swift_release();
  free(v1);
}

uint64_t CollectionsViewModel.__allocating_init(contentModel:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  sub_20CFCC548();
  *(_QWORD *)(v2 + 16) = a1;
  return v2;
}

uint64_t CollectionsViewModel.init(contentModel:)(uint64_t a1)
{
  uint64_t v1;

  *(_OWORD *)(v1 + 72) = 0u;
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  sub_20CFCC548();
  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_20CFB8D14(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v24;
  void *v25;
  char *v26;
  id v27;
  void *v28;
  id v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  BOOL v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t KeyPath;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char **v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  char *v50;
  id v51;
  char *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  id v70;
  char *v71;
  char *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  uint64_t v80;
  void *v81;
  id v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  char *v88;
  void *v89;
  void *v90;
  void *v91;
  char v92;
  char *v93;
  uint64_t v94;
  char *v95;
  char *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  _QWORD v101[2];
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void (*v105)(char *, uint64_t);
  uint64_t v106;
  _QWORD *v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  _QWORD *v119;
  unint64_t v120;
  _QWORD *v121;
  unint64_t v122;
  _QWORD *v123;
  _QWORD *v124;
  unint64_t v125;

  v2 = v1;
  v4 = sub_20CFCC464();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (_QWORD *)((char *)v101 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v118 = sub_20CFCCE48();
  v116 = *(_QWORD *)(v118 - 8);
  v8 = MEMORY[0x24BDAC7A8](v118);
  v114 = (char *)v101 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v113 = (char *)v101 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v112 = (char *)v101 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v101 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)v101 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_20CFCC47C();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)v101 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CF9DAEC(a1, (uint64_t)v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
    return sub_20CF97154((uint64_t)v18);
  v108 = v20;
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v22, v18, v19);
  sub_20CFCCE3C();
  v124 = 0;
  v125 = 0xE000000000000000;
  sub_20CFCD370();
  v121 = v124;
  v122 = v125;
  sub_20CFCD154();
  sub_20CF82E3C(&qword_25499E5C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
  v110 = v19;
  sub_20CFCD424();
  sub_20CFCD154();
  swift_bridgeObjectRelease();
  sub_20CFCD154();
  swift_getKeyPath();
  v24 = (uint64_t)v2 + OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  v124 = v2;
  v115 = sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  v117 = v24;
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v25 = (void *)v2[5];
  v26 = v22;
  if (v25)
  {
    v27 = objc_msgSend(v25, sel_identifier);
    sub_20CFCD118();

  }
  sub_20CFCD154();
  swift_bridgeObjectRelease();
  sub_20CFCD154();
  swift_getKeyPath();
  v123 = v2;
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v28 = (void *)v2[6];
  v107 = v2;
  if (v28)
  {
    v29 = objc_msgSend(v28, sel_identifier);
    sub_20CFCD118();

  }
  sub_20CFCD154();
  swift_bridgeObjectRelease();
  sub_20CFCD058();
  swift_bridgeObjectRelease();
  v30 = *(void (**)(char *, uint64_t))(v116 + 8);
  v30(v15, v118);
  v31 = sub_20CFCD118();
  v33 = v32;
  sub_20CFCC470();
  v34 = (*(uint64_t (**)(uint64_t *, uint64_t))(v5 + 88))(v7, v4);
  v35 = v34 == *MEMORY[0x24BEB79E0];
  v109 = v26;
  if (v35)
  {
    v105 = v30;
    v103 = v31;
    v106 = v33;
    (*(void (**)(uint64_t *, uint64_t))(v5 + 96))(v7, v4);
    v37 = *v7;
    v36 = (char *)v7[1];
    v38 = v7[3];
    v116 = v7[2];
    v39 = v7[5];
    v102 = v7[4];
    v104 = v39;
    sub_20CFBB078(v102, v39);
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    v41 = v107;
    v101[-4] = v107;
    v101[-3] = v37;
    v111 = v37;
    v101[-2] = v36;
    v121 = v41;
    swift_bridgeObjectRetain();
    sub_20CFCC518();
    swift_release();
    v114 = v36;
    swift_bridgeObjectRelease();
    v42 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v42);
    v43 = v116;
    v101[-4] = v41;
    v101[-3] = v43;
    v101[-2] = v38;
    v121 = v41;
    swift_bridgeObjectRetain();
    sub_20CFCC518();
    v101[1] = 0;
    v44 = v38;
    swift_release();
    swift_bridgeObjectRelease();
    v45 = &off_24C5E3000;
    if (v38)
    {
      v46 = (void *)objc_opt_self();
      swift_bridgeObjectRetain();
      v47 = objc_msgSend(v46, sel_sharedInstance);
      v48 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
      v49 = objc_msgSend(v47, sel_tipForCorrelationIdentifier_, v48);

      if (v49)
      {
        v50 = v112;
        sub_20CFCCE3C();
        v121 = 0;
        v122 = 0xE000000000000000;
        sub_20CFCD370();
        sub_20CFCD154();
        v51 = objc_msgSend(v49, sel_identifier);
        sub_20CFCD118();

        sub_20CFCD154();
        swift_bridgeObjectRelease();
        sub_20CFCD154();
        sub_20CFCD058();
        swift_bridgeObjectRelease();
        v52 = v50;
        v45 = &off_24C5E3000;
        v105(v52, v118);
        v53 = objc_msgSend(v49, sel_identifier);
        v54 = sub_20CFCD118();
        v56 = v55;

        v57 = swift_getKeyPath();
        MEMORY[0x24BDAC7A8](v57);
        v101[-4] = v41;
        v101[-3] = v54;
        v101[-2] = v56;
        v121 = v41;
        sub_20CFCC518();

        swift_release();
        swift_bridgeObjectRelease();
      }
    }
    swift_getKeyPath();
    v121 = v41;
    sub_20CFCC524();
    swift_release();
    swift_beginAccess();
    v58 = v41[10];
    if (v58)
    {
      v116 = v41[9];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v44 = v58;
    }
    if ((sub_20CFB9E4C() & 1) == 0)
      goto LABEL_35;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    v119 = v41;
    sub_20CFCC524();
    swift_release();
    v59 = (void *)v41[5];
    if (v59)
    {
      v60 = objc_msgSend(v59, v45[369]);
      v111 = sub_20CFCD118();
      v114 = v61;

    }
    else
    {
      v111 = 0;
      v114 = 0;
    }
    swift_getKeyPath();
    v119 = v41;
    sub_20CFCC524();
    swift_release();
    v78 = (void *)v41[6];
    if (v78)
    {
      v79 = objc_msgSend(v78, v45[369]);
      v116 = sub_20CFCD118();
      v44 = v80;

    }
    else
    {
      v116 = 0;
      v44 = 0;
    }
    swift_getKeyPath();
    v119 = v41;
    sub_20CFCC524();
    swift_release();
    v81 = (void *)v41[6];
    if (v81)
    {
      v82 = objc_msgSend(v81, sel_correlationID);
      v83 = v104;
      if (v82)
      {
        v84 = v82;
        v117 = sub_20CFCD118();
        v68 = v85;

        if (!v83)
        {
LABEL_34:
          swift_bridgeObjectRetain();
LABEL_37:
          v86 = v113;
          sub_20CFCCE3C();
          v119 = 0;
          v120 = 0xE000000000000000;
          sub_20CFCD370();
          sub_20CFCD154();
          sub_20CFCD154();
          swift_bridgeObjectRelease();
          sub_20CFCD154();
          swift_bridgeObjectRetain();
          sub_20CFCD154();
          swift_bridgeObjectRelease();
          sub_20CFCD154();
          swift_bridgeObjectRetain();
          sub_20CFCD154();
          swift_bridgeObjectRelease();
          sub_20CFCD154();
          swift_bridgeObjectRetain();
          sub_20CFCD154();
          swift_bridgeObjectRelease();
          sub_20CFCD010();
          swift_bridgeObjectRelease();
          v105(v86, v118);
          goto LABEL_38;
        }
      }
      else
      {
        v117 = 0;
        v68 = 0;
        if (!v104)
          goto LABEL_34;
      }
    }
    else
    {
LABEL_35:
      v117 = 0;
      v68 = 0;
      if (!v104)
        goto LABEL_34;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  if (v34 != *MEMORY[0x24BEB79E8])
  {
    (*(void (**)(uint64_t *, uint64_t))(v5 + 8))(v7, v4);
    v116 = 0;
    v117 = 0;
    v68 = 0;
    v111 = 0;
    v114 = 0;
    v44 = 0;
LABEL_38:
    v87 = v108;
    goto LABEL_39;
  }
  v103 = v31;
  v106 = v33;
  (*(void (**)(uint64_t *, uint64_t))(v5 + 96))(v7, v4);
  v62 = v7[1];
  v116 = *v7;
  v64 = (char *)v7[2];
  v63 = v7[3];
  v66 = v7[4];
  v65 = v7[5];
  v67 = v7[7];
  sub_20CFBB078(v7[6], v67);
  if (!(v62 | v63))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v108 + 8))(v109, v110);
  }
  v111 = v66;
  v112 = v64;
  v105 = v30;
  swift_getKeyPath();
  v69 = v107;
  v121 = v107;
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v70 = (id)v69[2];
  sub_20CFC0138();
  v72 = v71;

  v73 = v110;
  v113 = v72;
  if (!v72)
  {
    if (!v62)
      goto LABEL_53;
    v74 = 0;
    goto LABEL_59;
  }
  v74 = v72;
  v75 = sub_20CFCD07C();
  v77 = v76;

  if (!v62)
  {
    if (!v77)
      goto LABEL_52;
LABEL_59:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v97 = v108;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return (*(uint64_t (**)(char *, uint64_t))(v97 + 8))(v109, v73);
  }
  if (!v77)
    goto LABEL_59;
  if (v116 != v75 || v62 != v77)
  {
    v92 = sub_20CFCD430();
    swift_bridgeObjectRelease();
    if ((v92 & 1) != 0)
      goto LABEL_52;
    goto LABEL_59;
  }
  swift_bridgeObjectRelease();
LABEL_52:
  swift_bridgeObjectRetain();
  v93 = v74;
  sub_20CFCD094();

LABEL_53:
  v94 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v94);
  v101[-4] = v69;
  *(_OWORD *)&v101[-3] = xmmword_20CFD0D90;
  v119 = v69;
  sub_20CFCC518();
  swift_release();
  if (v65 && v113)
  {
    v95 = v113;
    swift_bridgeObjectRetain();
    sub_20CFCD0A0();

  }
  v87 = v108;
  v104 = v65;
  if (v67)
    swift_bridgeObjectRelease();
  v96 = v114;
  sub_20CFCCE30();
  v119 = 0;
  v120 = 0xE000000000000000;
  sub_20CFCD370();
  sub_20CFCD154();
  sub_20CFCD154();
  swift_bridgeObjectRelease();
  sub_20CFCD154();
  sub_20CFCD154();
  swift_bridgeObjectRelease();
  sub_20CFCD154();
  sub_20CFCD154();
  swift_bridgeObjectRelease();
  sub_20CFCD154();
  swift_bridgeObjectRetain();
  sub_20CFCD154();
  swift_bridgeObjectRelease();
  sub_20CFCD010();
  swift_bridgeObjectRelease();

  v105(v96, v118);
  v116 = 0;
  v117 = 0;
  v68 = 0;
  v111 = 0;
  v114 = 0;
  v44 = 0;
LABEL_39:
  if (qword_25499DC30 == -1)
  {
    v88 = v114;
    if (v44)
      goto LABEL_41;
  }
  else
  {
    swift_once();
    v88 = v114;
    if (v44)
    {
LABEL_41:
      v89 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
      if (v88)
        goto LABEL_42;
LABEL_62:
      v90 = 0;
      if (v68)
        goto LABEL_43;
LABEL_63:
      v91 = 0;
      goto LABEL_64;
    }
  }
  v89 = 0;
  if (!v88)
    goto LABEL_62;
LABEL_42:
  v90 = (void *)sub_20CFCD0F4();
  swift_bridgeObjectRelease();
  if (!v68)
    goto LABEL_63;
LABEL_43:
  v91 = (void *)sub_20CFCD0F4();
  swift_bridgeObjectRelease();
LABEL_64:
  v98 = (void *)objc_opt_self();
  v99 = (void *)sub_20CFCD0F4();
  swift_bridgeObjectRelease();
  v100 = objc_msgSend(v98, sel_eventWithContentID_collectionID_correlationID_launchType_, v89, v90, v91, v99);

  objc_msgSend(v100, "log");
  return (*(uint64_t (**)(char *, uint64_t))(v87 + 8))(v109, v110);
}

uint64_t sub_20CFB9E4C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char *v11;
  void *v12;
  char *v13;
  void *v14;
  id v15;
  unint64_t v16;
  id v17;
  id v18;
  unint64_t v19;
  void *v20;
  uint64_t KeyPath;
  id v22;
  char *v23;
  void *v24;
  char *v25;
  void *v26;
  id v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  void *v34;
  id v35;
  char *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  char *v47;
  id v48;
  void *v49;
  void *v50;
  _QWORD v51[2];
  void *v52;
  id v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v1 = v0;
  swift_getKeyPath();
  v62 = v0;
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v3 = *(void **)(v0 + 56);
  v2 = *(void **)(v0 + 64);
  swift_getKeyPath();
  v61 = v0;
  swift_bridgeObjectRetain();
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v5 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 80);
  if (!v2)
  {
    if (!v4)
      return 0;
    swift_getKeyPath();
    v60 = v0;
    swift_bridgeObjectRetain();
    sub_20CFCC524();
    swift_release();
    swift_beginAccess();
    v18 = *(id *)(v0 + 16);
    v19 = sub_20CFC1264();
    swift_bridgeObjectRetain();
    v20 = sub_20CFBB33C(v19, v5, v4);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    KeyPath = swift_getKeyPath();
    v56 = v5;
    MEMORY[0x24BDAC7A8](KeyPath);
    v52 = (void *)v1;
    v53 = v20;
    v59 = v1;
    v22 = v20;
    v54 = MEMORY[0x24BEE4AE0] + 8;
    sub_20CFCC518();
    swift_release();
    v55 = v22;

    if (v20)
    {
      swift_getKeyPath();
      v59 = v1;
      sub_20CFCC524();
      swift_release();
      v23 = *(char **)(v1 + 16);
      v24 = *(void **)&v23[OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController];
      v25 = v23;
      v26 = (void *)sub_20CFCD0F4();
      v17 = objc_msgSend(v24, sel_tipForIdentifier_, v26, v54, v55, v56);

    }
    else
    {
      v17 = 0;
    }
    v33 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v33);
    v52 = (void *)v1;
    v53 = v17;
    v59 = v1;
    sub_20CFCC518();
    swift_bridgeObjectRelease();

    goto LABEL_14;
  }
  swift_getKeyPath();
  if (v4)
  {
    v56 = v5;
    v60 = v0;
    swift_bridgeObjectRetain();
    sub_20CFCC524();
    swift_release();
    swift_beginAccess();
    v6 = *(id *)(v0 + 16);
    v55 = v3;
    v7 = sub_20CFC1264();
    MEMORY[0x24BDAC7A8](v7);
    v52 = v8;
    v53 = v2;
    v9 = sub_20CFBAF58(sub_20CFBB7EC, (uint64_t)v51, v7);

    swift_bridgeObjectRelease();
    v10 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v10);
    v52 = (void *)v1;
    v53 = v9;
    v59 = v1;
    sub_20CFCC518();
    swift_release();

    swift_getKeyPath();
    v59 = v1;
    sub_20CFCC524();
    swift_release();
    v11 = *(char **)(v1 + 16);
    v12 = *(void **)&v11[OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController];
    v13 = v11;
    v14 = (void *)sub_20CFCD0F4();
    v15 = objc_msgSend(v12, sel_tipsForCollectionIdentifier_, v14);

    if (v15)
    {
      sub_20CFBB55C();
      v16 = sub_20CFCD190();

      swift_bridgeObjectRetain();
      v17 = sub_20CFBB19C(v16, v56, v4);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {

      v17 = 0;
    }
    v31 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v31);
    v52 = (void *)v1;
    v53 = v17;
    v59 = v1;
    sub_20CFCC518();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_14:
    swift_release();

    goto LABEL_15;
  }
  v60 = v0;
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v27 = *(id *)(v0 + 16);
  v28 = sub_20CFC1264();
  MEMORY[0x24BDAC7A8](v28);
  v52 = v3;
  v53 = v2;
  v29 = sub_20CFBAF58(sub_20CFBB540, (uint64_t)v51, v28);

  swift_bridgeObjectRelease();
  v30 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v30);
  v52 = (void *)v1;
  v53 = v29;
  v59 = v1;
  sub_20CFCC518();
  swift_bridgeObjectRelease();
  swift_release();

LABEL_15:
  swift_getKeyPath();
  v59 = v1;
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v34 = *(void **)(v1 + 40);
  if (v34)
  {
    swift_getKeyPath();
    v58 = v1;
    v35 = v34;
    sub_20CFCC524();
    swift_release();
    swift_beginAccess();
    v36 = (char *)*(id *)(v1 + 16);
    v37 = objc_msgSend(v35, sel_identifier);
    sub_20CFCD118();

    v38 = *(void **)&v36[OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController];
    v39 = (void *)sub_20CFCD0F4();
    objc_msgSend(v38, sel_removeNotificationForIdentifier_, v39);

    swift_bridgeObjectRelease();
    v40 = objc_msgSend(v35, sel_identifier);
    v41 = sub_20CFCD118();
    v43 = v42;

    v44 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v44);
    v51[0] = v1;
    v51[1] = v41;
    v52 = v43;
    v58 = v1;
    sub_20CFCC518();

    swift_release();
    swift_bridgeObjectRelease();
  }
  swift_getKeyPath();
  v58 = v1;
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  v45 = *(void **)(v1 + 48);
  if (v45)
  {
    swift_getKeyPath();
    v57 = v1;
    v46 = v45;
    sub_20CFCC524();
    swift_release();
    swift_beginAccess();
    v47 = (char *)*(id *)(v1 + 16);
    v48 = objc_msgSend(v46, sel_identifier);
    sub_20CFCD118();

    v49 = *(void **)&v47[OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController];
    v50 = (void *)sub_20CFCD0F4();
    objc_msgSend(v49, sel_removeNotificationForIdentifier_, v50);

    swift_bridgeObjectRelease();
  }
  return 1;
}

uint64_t sub_20CFBA80C()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_25499E5C0, (uint64_t (*)(uint64_t))type metadata accessor for CollectionsViewModel, (uint64_t)&protocol conformance descriptor for CollectionsViewModel);
  sub_20CFCC518();
  swift_release();
  swift_getKeyPath();
  sub_20CFCC518();
  swift_release();
  swift_getKeyPath();
  sub_20CFCC518();
  swift_release();
  swift_getKeyPath();
  sub_20CFCC518();
  swift_release();
  swift_getKeyPath();
  sub_20CFCC518();
  return swift_release();
}

id *CollectionsViewModel.deinit()
{
  id *v0;
  char *v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = (char *)v0 + OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  v2 = sub_20CFCC554();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t CollectionsViewModel.__deallocating_deinit()
{
  id *v0;
  char *v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = (char *)v0 + OBJC_IVAR____TtC6TipsUI20CollectionsViewModel___observationRegistrar;
  v2 = sub_20CFCC554();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_20CFBAAC4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_20CFBAB94(a1, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__loading, a2);
}

uint64_t sub_20CFBAAD8()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC518();
  return swift_release();
}

uint64_t sub_20CFBAB80@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_20CFBAB94(a1, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__hasLoaded, a2);
}

uint64_t sub_20CFBAB94@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X4>, _BYTE *a3@<X8>)
{
  uint64_t v5;
  _BYTE *v6;
  uint64_t result;

  v5 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  v6 = (_BYTE *)(v5 + *a2);
  result = swift_beginAccess();
  *a3 = *v6;
  return result;
}

uint64_t sub_20CFBAC44()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC518();
  return swift_release();
}

uint64_t sub_20CFBACEC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  v4 = (_QWORD *)(v3 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__collections);
  swift_beginAccess();
  *a2 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20CFBAD9C()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  swift_bridgeObjectRetain();
  sub_20CFCC518();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFBAE64()
{
  uint64_t *v0;

  return sub_20CFB75A4(v0[2], v0[3], v0[4]);
}

void sub_20CFBAE88()
{
  uint64_t v0;

  sub_20CFB79D8(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_20CFBAEA8()
{
  uint64_t v0;

  sub_20CFB7E00(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_20CFBAEC0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_20CFBAB94(a1, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__loading, a2);
}

uint64_t sub_20CFBAEE8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_20CFBAB94(a1, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__hasLoaded, a2);
}

uint64_t sub_20CFBAF18()
{
  uint64_t *v0;

  return sub_20CFB8650(v0[2], v0[3], v0[4]);
}

uint64_t sub_20CFBAF3C()
{
  uint64_t *v0;

  return sub_20CFB8AA4(v0[2], v0[3], v0[4]);
}

void *sub_20CFBAF58(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v13;

  if (a3 >> 62)
    goto LABEL_16;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_20CFCD3D0())
  {
    v7 = 4;
    while (1)
    {
      v8 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x212B9A340](v7 - 4, a3) : *(id *)(a3 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v13 = v8;
      v11 = a1(&v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v9;
      }
      if ((v11 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6)
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

void sub_20CFBB078(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;

  if (!a2)
    a1 = sub_20CFCD118();
  v3 = a2;
  v4 = qword_25499DC30;
  swift_bridgeObjectRetain();
  if (v4 != -1)
    swift_once();
  v5 = off_25499E830;
  swift_beginAccess();
  v5[7] = a1;
  v5[8] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v5[9] = a1;
  v5[10] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (void *)objc_opt_self();
  v7 = (void *)sub_20CFCD0F4();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setAppReferrer_, v7);

}

void *sub_20CFBB19C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;

  if (a1 >> 62)
    goto LABEL_21;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_20CFCD3D0())
  {
    v6 = 4;
    while (1)
    {
      v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x212B9A340](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      v8 = v7;
      v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
        break;
      v10 = objc_msgSend(v7, sel_identifier);
      v11 = sub_20CFCD118();
      v13 = v12;

      if (a3)
      {
        if (v11 == a2 && v13 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_19:
          swift_bridgeObjectRelease();
          return v8;
        }
        v15 = sub_20CFCD430();
        swift_bridgeObjectRelease();
        if ((v15 & 1) != 0)
          goto LABEL_19;

      }
      else
      {

        swift_bridgeObjectRelease();
      }
      ++v6;
      if (v9 == v5)
        goto LABEL_22;
    }
    __break(1u);
LABEL_21:
    swift_bridgeObjectRetain();
  }
LABEL_22:
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_20CFBB33C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char **v9;
  id v10;
  void *v11;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v5 = a1;
  if (a1 >> 62)
    goto LABEL_30;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_20CFCD3D0())
  {
    v7 = 0;
    v8 = v5 & 0xC000000000000001;
    v21 = v5 + 32;
    v9 = &selRef_setTranslatesAutoresizingMaskIntoConstraints_;
    v22 = v5 & 0xC000000000000001;
    v23 = v5;
    while (1)
    {
      v10 = v8 ? (id)MEMORY[0x212B9A340](v7, v5) : *(id *)(v21 + 8 * v7);
      v11 = v10;
      if (__OFADD__(v7++, 1))
        break;
      v13 = objc_msgSend(v10, v9[227]);
      v14 = (_QWORD *)sub_20CFCD190();

      v15 = v14[2];
      if (v15)
      {
        v16 = v14[4] == a2 && v14[5] == a3;
        if (v16 || (sub_20CFCD430() & 1) != 0)
        {
LABEL_27:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v11;
        }
        if (v15 != 1)
        {
          v17 = v14 + 7;
          v18 = 1;
          while (1)
          {
            v5 = v18 + 1;
            if (__OFADD__(v18, 1))
              break;
            v19 = *(v17 - 1) == a2 && *v17 == a3;
            if (v19 || (sub_20CFCD430() & 1) != 0)
              goto LABEL_27;
            v17 += 2;
            ++v18;
            if (v5 == v15)
              goto LABEL_4;
          }
          __break(1u);
          break;
        }
LABEL_4:

        swift_bridgeObjectRelease();
        v8 = v22;
        v5 = v23;
        v9 = &selRef_setTranslatesAutoresizingMaskIntoConstraints_;
        if (v7 == v6)
          goto LABEL_31;
      }
      else
      {

        swift_bridgeObjectRelease();
        if (v7 == v6)
          goto LABEL_31;
      }
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_20CFBB540(id *a1)
{
  uint64_t v1;

  return sub_20CFC0F24(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24)) & 1;
}

unint64_t sub_20CFBB55C()
{
  unint64_t result;

  result = qword_253EC6B50;
  if (!qword_253EC6B50)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253EC6B50);
  }
  return result;
}

uint64_t sub_20CFBB598()
{
  return type metadata accessor for CollectionsViewModel();
}

uint64_t sub_20CFBB5A0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20CFCC554();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for CollectionsViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CollectionsViewModel.contentModel.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of CollectionsViewModel.contentModel.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of CollectionsViewModel.contentModel.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of CollectionsViewModel.collections.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedTOCIdentifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedTOCIdentifier.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedTOCIdentifier.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedCollection.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedCollection.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedCollection.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedTip.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedTip.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of CollectionsViewModel.selectedTip.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of CollectionsViewModel.mainUserGuide.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of CollectionsViewModel.isLoading.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of CollectionsViewModel.isCollectionEmpty.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of CollectionsViewModel.preferredCollectionIdentifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of CollectionsViewModel.preferredCollectionIdentifier.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of CollectionsViewModel.preferredCollectionIdentifier.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of CollectionsViewModel.preferredTipIdentifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of CollectionsViewModel.preferredTipIdentifier.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of CollectionsViewModel.preferredTipIdentifier.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t dispatch thunk of CollectionsViewModel.__allocating_init(contentModel:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 456))();
}

uint64_t dispatch thunk of CollectionsViewModel.parseDeepLink(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 464))();
}

uint64_t dispatch thunk of CollectionsViewModel.loadPreferredContent()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 472))();
}

uint64_t dispatch thunk of CollectionsViewModel.resetSelection()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 480))();
}

uint64_t sub_20CFBB774()
{
  uint64_t v0;

  return sub_20CFBE148(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_20CFBB790()
{
  uint64_t v0;

  return sub_20CFBDE9C(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_20CFBB7AC()
{
  uint64_t v0;

  return sub_20CFBE444(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_20CFBB7C4()
{
  sub_20CFBAE88();
}

void sub_20CFBB7D8()
{
  sub_20CFBAEA8();
}

uint64_t sub_20CFBB7EC(id *a1)
{
  return sub_20CFBB540(a1) & 1;
}

void sub_20CFBB804()
{
  sub_20CFB7074();
}

uint64_t sub_20CFBB818()
{
  return sub_20CFBAE64();
}

uint64_t sub_20CFBB82C()
{
  return sub_20CFBAF18();
}

uint64_t sub_20CFBB840()
{
  return sub_20CFBAF3C();
}

uint64_t View.readSize(onChange:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];

  v13 = a1;
  v15 = a4;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC6AE8);
  v6 = sub_20CFCC80C();
  v14 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - v7;
  v16[2] = sub_20CFBBA18;
  v16[3] = 0;
  sub_20CFCCD4C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6AC0);
  sub_20CF88608(&qword_253EC6AB8, &qword_253EC6AC0, MEMORY[0x24BDEC6F8]);
  sub_20CFCCB3C();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v13;
  *(_QWORD *)(v9 + 24) = a2;
  v10 = sub_20CF88608(&qword_253EC6AE0, &qword_253EC6AE8, MEMORY[0x24BDEF370]);
  v16[0] = a3;
  v16[1] = v10;
  swift_retain();
  MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v6, v16);
  sub_20CFBBAC0();
  sub_20CFBBB04();
  sub_20CFCCB78();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v8, v6);
}

uint64_t sub_20CFBBA18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_20CFCCBF0();
  result = sub_20CFCC77C();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

uint64_t sub_20CFBBA54(double *a1, uint64_t (*a2)(double, double))
{
  return a2(*a1, a1[1]);
}

uint64_t sub_20CFBBA78()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20CFBBA9C(double *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(double, double))(v1 + 16))(*a1, a1[1]);
}

unint64_t sub_20CFBBAC0()
{
  unint64_t result;

  result = qword_253EC6A08;
  if (!qword_253EC6A08)
  {
    result = MEMORY[0x212B9AA54](&unk_20CFD0FD4, &type metadata for SizePreferenceKey);
    atomic_store(result, (unint64_t *)&qword_253EC6A08);
  }
  return result;
}

unint64_t sub_20CFBBB04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253EC6B48;
  if (!qword_253EC6B48)
  {
    type metadata accessor for CGSize(255);
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDBD858], v1);
    atomic_store(result, (unint64_t *)&qword_253EC6B48);
  }
  return result;
}

uint64_t sub_20CFBBB4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC6AE8);
  v2 = sub_20CFCC80C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC6AF8);
  v3 = sub_20CFCC80C();
  v7[0] = v1;
  v7[1] = sub_20CF88608(&qword_253EC6AE0, &qword_253EC6AE8, MEMORY[0x24BDEF370]);
  v4 = MEMORY[0x24BDED308];
  v6[0] = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v2, v7);
  v6[1] = sub_20CF88608(&qword_253EC6AF0, &qword_253EC6AF8, MEMORY[0x24BDF09B0]);
  return MEMORY[0x212B9AA54](v4, v3, v6);
}

ValueMetadata *type metadata accessor for SizePreferenceKey()
{
  return &type metadata for SizePreferenceKey;
}

void sub_20CFBBC3C()
{
  xmmword_25499E820 = 0uLL;
}

double sub_20CFBBC4C@<D0>(_OWORD *a1@<X8>)
{
  double result;

  if (qword_25499DC28 != -1)
    swift_once();
  result = *(double *)&xmmword_25499E820;
  *a1 = xmmword_25499E820;
  return result;
}

double sub_20CFBBCA8()
{
  uint64_t v0;
  uint64_t v1;
  double result;

  type metadata accessor for TipsAnalyticsHelper();
  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = sub_20CFCD118();
  *(_QWORD *)(v0 + 32) = v1;
  *(_OWORD *)(v0 + 40) = xmmword_20CFD1020;
  *(_QWORD *)(v0 + 56) = 0;
  *(_QWORD *)(v0 + 64) = 0xE000000000000000;
  *(_QWORD *)(v0 + 72) = 0;
  *(_QWORD *)(v0 + 80) = 0xE000000000000000;
  result = 0.0;
  *(_OWORD *)(v0 + 88) = 0u;
  *(_OWORD *)(v0 + 104) = 0u;
  *(_QWORD *)(v0 + 120) = 0;
  off_25499E830 = (_UNKNOWN *)v0;
  return result;
}

uint64_t static TipsAnalyticsHelper.shared.getter()
{
  if (qword_25499DC30 != -1)
    swift_once();
  return swift_retain();
}

id sub_20CFBBD5C()
{
  id result;

  type metadata accessor for TipsContentModel();
  result = static TipsContentModel.shared()();
  qword_25499E838 = (uint64_t)result;
  return result;
}

id static TipsAnalyticsHelper.contentModel.getter()
{
  if (qword_25499DC38 != -1)
    swift_once();
  swift_beginAccess();
  return (id)qword_25499E838;
}

void static TipsAnalyticsHelper.contentModel.setter(uint64_t a1)
{
  void *v2;

  if (qword_25499DC38 != -1)
    swift_once();
  swift_beginAccess();
  v2 = (void *)qword_25499E838;
  qword_25499E838 = a1;

}

uint64_t (*static TipsAnalyticsHelper.contentModel.modify())()
{
  if (qword_25499DC38 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_20CFBBED4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 40) = v3;
  *(_QWORD *)(v4 + 48) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFBBF30()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_20CFBBF78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFBBFC8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 56) = v3;
  *(_QWORD *)(v4 + 64) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFBC024()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_20CFBC06C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFBC0BC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 72) = v3;
  *(_QWORD *)(v4 + 80) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFBC118()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_20CFBC160(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFBC1B0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 88) = v3;
  *(_QWORD *)(v4 + 96) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFBC20C()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_20CFBC254(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 88) = a1;
  *(_QWORD *)(v2 + 96) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_20CFBC2A4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t TipsAnalyticsHelper.deinit()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
  {
    swift_retain();
    sub_20CFCCE00();
    swift_release();
  }
  *(_QWORD *)(v0 + 16) = 0;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t TipsAnalyticsHelper.__deallocating_deinit()
{
  TipsAnalyticsHelper.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_20CFBC390(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v1;
  if (*(_QWORD *)(v1 + 16))
  {
    swift_retain();
    sub_20CFCCE00();
    swift_release();
  }
  *(_QWORD *)(v1 + 16) = 0;
  swift_release();
  if (a1)
  {
    v4 = objc_msgSend(a1, sel_identifier);
    v5 = sub_20CFCD118();
    v7 = v6;

  }
  else
  {
    v5 = sub_20CFCD118();
    v7 = v8;
  }
  *(_QWORD *)(v2 + 24) = v5;
  *(_QWORD *)(v2 + 32) = v7;
  return swift_bridgeObjectRelease();
}

void sub_20CFBC43C(void *a1)
{
  uint64_t v1;
  _QWORD *v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = (_QWORD *)v1;
  if (*(_QWORD *)(v1 + 16))
  {
    swift_retain();
    sub_20CFCCE00();
    swift_release();
  }
  *(_QWORD *)(v1 + 16) = 0;
  swift_release();
  if (!a1)
  {
    swift_beginAccess();
    *(_OWORD *)(v1 + 40) = xmmword_20CFD1020;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v4 = objc_msgSend(a1, sel_identifier);
  v5 = sub_20CFCD118();
  v7 = v6;

  swift_beginAccess();
  v2[5] = v5;
  v2[6] = v7;
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(a1, sel_correlationID);
  if (!v8)
  {
LABEL_7:
    v10 = 0;
    v12 = 0;
    goto LABEL_8;
  }
  v9 = v8;
  v10 = sub_20CFCD118();
  v12 = v11;

LABEL_8:
  swift_beginAccess();
  v2[11] = v10;
  v2[12] = v12;
  swift_bridgeObjectRelease();
  if (a1 && (v13 = objc_msgSend(a1, sel_clientConditionID)) != 0)
  {
    v14 = v13;
    v15 = sub_20CFCD118();
    v17 = v16;

  }
  else
  {
    v15 = 0;
    v17 = 0;
  }
  v2[13] = v15;
  v2[14] = v17;
  swift_bridgeObjectRelease();
  sub_20CFBD2F0(a1);
}

void sub_20CFBC5D0()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  swift_beginAccess();
  if (v0[6])
  {
    swift_bridgeObjectRetain();
    v1 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    if (v0[4])
    {
LABEL_3:
      swift_bridgeObjectRetain();
      v2 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    v1 = 0;
    if (v0[4])
      goto LABEL_3;
  }
  v2 = 0;
LABEL_6:
  swift_beginAccess();
  if (v0[12])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_20CFCD0F4();
  v6 = objc_msgSend(v4, sel_eventWithContentID_collectionID_correlationID_launchType_, v1, v2, v3, v5);

  objc_msgSend(v6, "log");
}

void sub_20CFBC750(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  char *v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD aBlock[6];

  v3 = v2;
  v38 = a1;
  v5 = sub_20CFCCDE8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v32 - v10;
  v12 = sub_20CFCCDAC();
  MEMORY[0x24BDAC7A8](v12);
  swift_beginAccess();
  if (v3[6] && v3[4])
  {
    v36 = a2;
    v32 = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v35 = sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    v13 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    if (v3[12])
    {
      swift_bridgeObjectRetain();
      v14 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
    }
    else
    {
      v14 = 0;
    }
    v15 = v3[14];
    v34 = v5;
    v33 = v11;
    v37 = v9;
    if (v15)
    {
      swift_bridgeObjectRetain();
      v16 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
    }
    else
    {
      v16 = 0;
    }
    v17 = objc_opt_self();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v18 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    v19 = (void *)sub_20CFCD0F4();
    v20 = (void *)v17;
    v21 = (void *)v35;
    v22 = objc_msgSend(v20, sel_eventWithContentID_collectionID_correlationID_clientConditionID_viewMethod_viewMode_, v35, v13, v14, v16, v18, v19);

    if (v3[2])
    {
      swift_retain();
      sub_20CFCCE00();
      swift_release();
    }
    v23 = v37;
    v3[2] = 0;
    swift_release();
    v24 = swift_allocObject();
    swift_weakInit();
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = v24;
    *(_QWORD *)(v25 + 24) = v22;
    aBlock[4] = sub_20CFBD61C;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20CF8B674;
    aBlock[3] = &block_descriptor_5;
    _Block_copy(aBlock);
    v39 = MEMORY[0x24BEE4AF8];
    sub_20CFBD624();
    swift_retain();
    v26 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6928);
    sub_20CFBD66C();
    sub_20CFCD34C();
    sub_20CFCCE0C();
    swift_allocObject();
    v27 = sub_20CFCCDF4();
    swift_release();
    swift_release();
    v3[2] = v27;
    swift_release();
    if (v3[2])
    {
      sub_20CF82E00();
      swift_retain();
      v28 = (void *)sub_20CFCD274();
      sub_20CFCCDDC();
      v29 = v33;
      MEMORY[0x212B99DB8](v23, *MEMORY[0x24BEB7EB0]);
      v30 = *(void (**)(char *, uint64_t))(v32 + 8);
      v31 = v34;
      v30(v23, v34);
      sub_20CFCD25C();

      swift_release();
      v30(v29, v31);
    }
    else
    {

    }
  }
}

uint64_t sub_20CFBCBC4(uint64_t a1, void *a2)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_20CFBD184(a2);
    return swift_release();
  }
  return result;
}

void sub_20CFBCC20(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  swift_beginAccess();
  if (v2[6] && v2[4])
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v5 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    v6 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    if (v2[12])
    {
      swift_bridgeObjectRetain();
      v7 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
    }
    else
    {
      v7 = 0;
    }
    v8 = objc_msgSend((id)objc_opt_self(), sel_eventWithTipID_animationFinished_animationSource_collectionID_correlationID_, v5, a2 & 1, a1, v6, v7);

    objc_msgSend(v8, "log");
  }
}

void sub_20CFBCD70()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  swift_beginAccess();
  if (v0[6] && v0[4])
  {
    swift_beginAccess();
    if (v0[12])
    {
      v1 = (void *)objc_opt_self();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v2 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
      v3 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
      v4 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
      v5 = objc_msgSend(v1, sel_eventWithTipID_collectionID_correlationID_, v2, v3, v4);

      objc_msgSend(v5, "log");
    }
  }
}

void sub_20CFBCEB0(char a1)
{
  _QWORD *v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  swift_beginAccess();
  if (v1[6] && v1[4])
  {
    swift_beginAccess();
    if (v1[12])
    {
      v3 = (void *)objc_opt_self();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v4 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
      v5 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
      v6 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
      v7 = objc_msgSend(v3, sel_eventWithTipID_saved_correlationID_collectionID_, v4, a1 & 1, v5, v6);

      objc_msgSend(v7, "log");
    }
  }
}

void sub_20CFBCFF8()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(), sel_event);
  objc_msgSend(v0, "log");

}

void sub_20CFBD044()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v6 = (id)objc_opt_self();
  v0 = (void *)sub_20CFCD0F4();
  v1 = (void *)sub_20CFCD0F4();
  v2 = (void *)sub_20CFCD0F4();
  v3 = (void *)sub_20CFCD0F4();
  v4 = (void *)sub_20CFCD0F4();
  v5 = (void *)sub_20CFCD0F4();
  v7 = objc_msgSend(v6, sel_eventWithTopicID_topicTitle_source_interfaceStyle_fromTopicID_externalURLString_, v0, v1, v2, v3, v4, v5);

  objc_msgSend(v7, "log");
}

void sub_20CFBD184(void *a1)
{
  _QWORD *v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  swift_beginAccess();
  v3 = v1[6];
  if (v3 && v1[4])
  {
    v4 = v1[5];
    swift_bridgeObjectRetain();
    objc_msgSend(a1, "log");
    v5 = HIBYTE(v3) & 0xF;
    if ((v3 & 0x2000000000000000) == 0)
      v5 = v4 & 0xFFFFFFFFFFFFLL;
    if (v5)
      objc_msgSend((id)objc_opt_self(), sel_incrementTipsViewedCount);
    if (qword_25499DC38 != -1)
      swift_once();
    swift_beginAccess();
    v6 = (void *)qword_25499E838;
    v7 = v1[4];
    v8 = *(void **)(qword_25499E838 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
    swift_bridgeObjectRetain();
    v9 = v6;
    v10 = (void *)sub_20CFCD0F4();
    if (v7)
      v11 = (void *)sub_20CFCD0F4();
    else
      v11 = 0;
    objc_msgSend(v8, sel_tipViewed_collectionIdentifier_, v10, v11);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
}

void sub_20CFBD2F0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void (*v18)(char *, char *, uint64_t);
  double v19;
  double v20;
  void (*v21)(char *, uint64_t);
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25499EA48);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20CFCC4B8();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v29 - v12;
  v14 = *(void **)(v2 + 120);
  if (!v14)
  {
LABEL_5:
    if (!a1)
      goto LABEL_13;
    goto LABEL_9;
  }
  v15 = v14;
  v16 = objc_msgSend(v15, sel_date);
  if (v16)
  {
    v17 = v16;
    sub_20CFCC4A0();

    v18 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v18(v6, v11, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
    {
      v18(v13, v6, v7);
      sub_20CFCC4AC();
      sub_20CFCC494();
      v20 = v19;
      v21 = *(void (**)(char *, uint64_t))(v8 + 8);
      v21(v11, v7);
      objc_msgSend(v15, sel_setTimeSpent_, v20);
      objc_msgSend(v15, "log");

      v21(v13, v7);
      goto LABEL_5;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  }

  sub_20CFBDA88((uint64_t)v6);
  if (!a1)
  {
LABEL_13:
    v28 = *(void **)(v2 + 120);
    *(_QWORD *)(v2 + 120) = 0;
    goto LABEL_14;
  }
LABEL_9:
  if (!*(_QWORD *)(v2 + 32))
    goto LABEL_13;
  v22 = a1;
  swift_bridgeObjectRetain();
  v23 = objc_msgSend(v22, sel_identifier);
  if (!v23)
  {
    sub_20CFCD118();
    v23 = (id)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
  }
  v24 = (void *)objc_opt_self();
  v25 = (void *)sub_20CFCD0F4();
  swift_bridgeObjectRelease();
  v26 = objc_msgSend(v22, sel_correlationID);
  v27 = objc_msgSend(v24, sel_eventWithTipID_collectionID_correlationID_, v23, v25, v26);

  v28 = *(void **)(v2 + 120);
  *(_QWORD *)(v2 + 120) = v27;

LABEL_14:
}

uint64_t sub_20CFBD5CC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_20CFBD5F0()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_20CFBD61C()
{
  uint64_t v0;

  return sub_20CFBCBC4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_20CFBD624()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253EC6920;
  if (!qword_253EC6920)
  {
    v1 = sub_20CFCCDAC();
    result = MEMORY[0x212B9AA54](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_253EC6920);
  }
  return result;
}

unint64_t sub_20CFBD66C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253EC6930;
  if (!qword_253EC6930)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC6928);
    result = MEMORY[0x212B9AA54](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_253EC6930);
  }
  return result;
}

void sub_20CFBD6B8()
{
  sub_20CFBD2F0(0);
}

void sub_20CFBD6C0()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  swift_beginAccess();
  v1 = v0[6];
  if (v1)
  {
    v2 = HIBYTE(v1) & 0xF;
    if ((v1 & 0x2000000000000000) == 0)
      v2 = v0[5] & 0xFFFFFFFFFFFFLL;
    if (v2)
    {
      v3 = objc_allocWithZone(MEMORY[0x24BEB7D98]);
      swift_bridgeObjectRetain();
      v4 = objc_msgSend(v3, sel_init);
      v5 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_setIdentifier_, v5);

      swift_beginAccess();
      if (v0[12])
      {
        v6 = v4;
        swift_bridgeObjectRetain();
        v7 = (void *)sub_20CFCD0F4();
        swift_bridgeObjectRelease();
      }
      else
      {
        v8 = v4;
        v7 = 0;
      }
      objc_msgSend(v4, sel_setCorrelationID_, v7);

      v9 = v4;
      sub_20CFBD2F0(v4);

    }
  }
}

uint64_t sub_20CFBD808@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 48);
  *a2 = *(_QWORD *)(v3 + 40);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20CFBD854@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 64);
  *a2 = *(_QWORD *)(v3 + 56);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20CFBD8A0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 80);
  *a2 = *(_QWORD *)(v3 + 72);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20CFBD8EC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 96);
  *a2 = *(_QWORD *)(v3 + 88);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for TipsAnalyticsHelper()
{
  return objc_opt_self();
}

uint64_t method lookup function for TipsAnalyticsHelper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentTipID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentTipID.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentTipID.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentContentViewedMethod.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentContentViewedMethod.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentContentViewedMethod.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentLaunchedMethod.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentLaunchedMethod.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentLaunchedMethod.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentCorrelationID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentCorrelationID.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.currentCorrelationID.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.setCurrentCollection(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.setCurrentTip(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.logAppLaunched(source:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.logContentViewed(viewMode:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.logAnimationFinished(source:animationFinished:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.logReplayButtonTapped()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.logTipSaved(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.logUserGuideSearchUsed()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.logUserGuideContentViewed(topicID:topicTitle:source:interfaceStyle:fromTopicID:externURLString:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.pauseTipsTimeTracking()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of TipsAnalyticsHelper.resumeTipsTimeTracking()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t sub_20CFBDA88(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25499EA48);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id static TipsContentModel.shared()()
{
  objc_class *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v1 = (void *)qword_253EC5D40;
  if (!qword_253EC5D40)
  {
    v2 = objc_msgSend(objc_allocWithZone(v0), sel_init);
    v3 = (void *)qword_253EC5D40;
    qword_253EC5D40 = (uint64_t)v2;

    v1 = (void *)qword_253EC5D40;
    if (!qword_253EC5D40)
      return objc_msgSend(objc_allocWithZone(v0), sel_init);
  }
  v4 = swift_dynamicCastClass();
  if (!v4)
    return objc_msgSend(objc_allocWithZone(v0), sel_init);
  v5 = v4;
  v6 = v1;
  return (id)v5;
}

uint64_t sub_20CFBDB5C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
  swift_beginAccess();
  v4 = sub_20CFCC728();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_20CFBDBC4(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_20CFCC728();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = *a2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_20CFBDC88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
  swift_beginAccess();
  v4 = sub_20CFCC728();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_20CFBDCEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
  swift_beginAccess();
  v4 = sub_20CFCC728();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_20CFBDD58())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t (*sub_20CFBDD9C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFBDDE0()
{
  return sub_20CFBE004((uint64_t)&unk_20CFD10A0, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__loading);
}

uint64_t sub_20CFBDDF4()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC518();
  return swift_release();
}

uint64_t sub_20CFBDE9C(uint64_t a1, char a2)
{
  return sub_20CFBE164(a1, a2, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__loading);
}

void (*sub_20CFBDEB8(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20CFCC53C();
  swift_release();
  v4[7] = sub_20CFBDD9C();
  return sub_20CFBDFA0;
}

void sub_20CFBDFA0(_QWORD *a1)
{
  sub_20CFB8C00(a1);
}

uint64_t (*sub_20CFBDFAC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_20CFBDFF0()
{
  return sub_20CFBE004((uint64_t)&unk_20CFD10C8, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__hasLoaded);
}

uint64_t sub_20CFBE004(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  unsigned __int8 *v4;

  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  v4 = (unsigned __int8 *)(v2 + *a2);
  swift_beginAccess();
  return *v4;
}

uint64_t sub_20CFBE0A0()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC518();
  return swift_release();
}

uint64_t sub_20CFBE148(uint64_t a1, char a2)
{
  return sub_20CFBE164(a1, a2, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__hasLoaded);
}

uint64_t sub_20CFBE164(uint64_t a1, char a2, _QWORD *a3)
{
  _BYTE *v4;
  uint64_t result;

  v4 = (_BYTE *)(a1 + *a3);
  result = swift_beginAccess();
  *v4 = a2;
  return result;
}

void (*sub_20CFBE1B8(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20CFCC53C();
  swift_release();
  v4[7] = sub_20CFBDFAC();
  return sub_20CFBE2A0;
}

void sub_20CFBE2A0(_QWORD *a1)
{
  sub_20CFB8C00(a1);
}

uint64_t (*sub_20CFBE2AC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFBE2F0()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_20CFBE398()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC518();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFBE444(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  v3 = (_QWORD *)(a1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__collections);
  swift_beginAccess();
  *v3 = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_20CFBE4B0(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20CFCC53C();
  swift_release();
  v4[7] = sub_20CFBE2AC();
  return sub_20CFBE598;
}

void sub_20CFBE598(_QWORD *a1)
{
  sub_20CFB8C00(a1);
}

uint64_t (*sub_20CFBE5A4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFBE5E8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  v4 = (_BYTE *)(v3 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__contentMessageType);
  result = swift_beginAccess();
  *a2 = *v4;
  return result;
}

uint64_t sub_20CFBE694()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC518();
  return swift_release();
}

uint64_t sub_20CFBE73C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__contentMessageType);
  result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t sub_20CFBE7E8()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC518();
  return swift_release();
}

void (*sub_20CFBE890(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20CFCC53C();
  swift_release();
  v4[7] = sub_20CFBE5A4();
  return sub_20CFBE978;
}

void sub_20CFBE978(_QWORD *a1)
{
  sub_20CFB8C00(a1);
}

uint64_t (*sub_20CFBE984())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_20CFBE9C8@<X0>(uint64_t *a1@<X0>, void **a2@<X8>)
{
  return sub_20CFBEF4C(a1, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentCollection, a2);
}

void sub_20CFBE9DC(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  v2 = v1;
  sub_20CFCC518();
  swift_release();

}

void *sub_20CFBEA90()
{
  return sub_20CFBEC98((uint64_t)&unk_20CFD1140, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentCollection);
}

void sub_20CFBEAA4(void *a1)
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC518();
  swift_release();

}

void (*sub_20CFBEB4C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20CFCC53C();
  swift_release();
  v4[7] = sub_20CFBE984();
  return sub_20CFBEC34;
}

void sub_20CFBEC34(_QWORD *a1)
{
  sub_20CFB8C00(a1);
}

uint64_t (*sub_20CFBEC40())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_20CFBEC84()
{
  return sub_20CFBEC98((uint64_t)&unk_20CFD1168, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentTip);
}

void *sub_20CFBEC98(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;
  id v6;

  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  v5 = *v4;
  v6 = v5;
  return v5;
}

void sub_20CFBED3C(void *a1)
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC518();
  swift_release();

}

void sub_20CFBEDE4(uint64_t a1, void *a2)
{
  sub_20CFBF16C(a1, a2, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentTip);
}

void (*sub_20CFBEE00(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20CFCC53C();
  swift_release();
  v4[7] = sub_20CFBEC40();
  return sub_20CFBEEE8;
}

void sub_20CFBEEE8(_QWORD *a1)
{
  sub_20CFB8C00(a1);
}

uint64_t (*sub_20CFBEEF4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_20CFBEF38@<X0>(uint64_t *a1@<X0>, void **a2@<X8>)
{
  return sub_20CFBEF4C(a1, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__featuredCollection, a2);
}

id sub_20CFBEF4C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X4>, void **a3@<X8>)
{
  uint64_t v5;
  void **v6;
  void *v7;

  v5 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  v6 = (void **)(v5 + *a2);
  swift_beginAccess();
  v7 = *v6;
  *a3 = *v6;
  return v7;
}

void sub_20CFBEFFC(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  v2 = v1;
  sub_20CFCC518();
  swift_release();

}

void *sub_20CFBF0B0()
{
  return sub_20CFBEC98((uint64_t)&unk_20CFD1190, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__featuredCollection);
}

void sub_20CFBF0C4(void *a1)
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC518();
  swift_release();

}

void sub_20CFBF16C(uint64_t a1, void *a2, _QWORD *a3)
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)(a1 + *a3);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a2;
  v6 = a2;

}

void (*sub_20CFBF1CC(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20CFCC53C();
  swift_release();
  v4[7] = sub_20CFBEEF4();
  return sub_20CFBF2B4;
}

void sub_20CFBF2B4(_QWORD *a1)
{
  sub_20CFB8C00(a1);
}

uint64_t (*sub_20CFBF2C0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFBF304@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_20CFBF5C8(a1, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__isSharedVariant, a2);
}

uint64_t sub_20CFBF318()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC518();
  return swift_release();
}

uint64_t sub_20CFBF3C0()
{
  return sub_20CFBE004((uint64_t)&unk_20CFD11B8, &OBJC_IVAR____TtC6TipsUI16TipsContentModel__isSharedVariant);
}

uint64_t sub_20CFBF3D4()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC518();
  return swift_release();
}

void (*sub_20CFBF47C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20CFCC53C();
  swift_release();
  v4[7] = sub_20CFBF2C0();
  return sub_20CFBF564;
}

void sub_20CFBF564(_QWORD *a1)
{
  sub_20CFB8C00(a1);
}

uint64_t (*sub_20CFBF570())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFBF5B4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_20CFBF5C8(a1, OBJC_IVAR____TtC6TipsUI16TipsContentModel__shouldDisplaySharedVariant, a2);
}

uint64_t sub_20CFBF5C8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X4>, _BYTE *a3@<X8>)
{
  uint64_t v5;
  _BYTE *v6;
  uint64_t result;

  v5 = *a1;
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  v6 = (_BYTE *)(v5 + *a2);
  result = swift_beginAccess();
  *a3 = *v6;
  return result;
}

uint64_t sub_20CFBF678()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC518();
  return swift_release();
}

uint64_t sub_20CFBF720()
{
  return sub_20CFBE004((uint64_t)&unk_20CFD11E0, OBJC_IVAR____TtC6TipsUI16TipsContentModel__shouldDisplaySharedVariant);
}

uint64_t sub_20CFBF734()
{
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC518();
  return swift_release();
}

void (*sub_20CFBF7DC(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC6TipsUI16TipsContentModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20CFCC53C();
  swift_release();
  v4[7] = sub_20CFBF570();
  return sub_20CFBF8C4;
}

void sub_20CFBF8C4(_QWORD *a1)
{
  sub_20CFB8C00(a1);
}

void sub_20CFBF8D0(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_sharedVariantTip);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

  sub_20CFBF940();
}

uint64_t sub_20CFBF940()
{
  swift_beginAccess();
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC518();
  swift_release();
  swift_getKeyPath();
  sub_20CFCC524();
  swift_release();
  swift_beginAccess();
  swift_getKeyPath();
  sub_20CFCC518();
  return swift_release();
}

void *sub_20CFBFABC()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_sharedVariantTip);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_20CFBFB08(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;

  v3 = (void **)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_sharedVariantTip);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  sub_20CFBF940();
}

uint64_t (*sub_20CFBFB70(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_20CFBFBB8;
}

uint64_t sub_20CFBFBB8(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return sub_20CFBF940();
  return result;
}

uint64_t sub_20CFBFBE8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_pendingSharedVariantID);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFBFC50()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_pendingSharedVariantID);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_20CFBFCA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_pendingSharedVariantID);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_20CFBFD00())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFBFD44(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_currentTipList);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20CFBFDAC()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_20CFBFDF4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_currentTipList);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_20CFBFE44())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id TipsContentModel.appController.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
}

id sub_20CFBFE98()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB7DD0]), sel_init);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

uint64_t sub_20CFBFF10()
{
  return sub_20CFC2E1C(&OBJC_IVAR____TtC6TipsUI16TipsContentModel__loading);
}

uint64_t sub_20CFBFF34()
{
  return sub_20CFC2E1C(&OBJC_IVAR____TtC6TipsUI16TipsContentModel__hasLoaded);
}

uint64_t sub_20CFBFF60()
{
  return sub_20CFC2E74();
}

void sub_20CFBFF7C()
{
  uint64_t v0;

  sub_20CFBF16C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), &OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentCollection);
}

void sub_20CFBFFA4()
{
  uint64_t v0;

  sub_20CFBF16C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), &OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentTip);
}

void sub_20CFBFFCC()
{
  uint64_t v0;

  sub_20CFBF16C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), &OBJC_IVAR____TtC6TipsUI16TipsContentModel__featuredCollection);
}

uint64_t sub_20CFBFFF4()
{
  return sub_20CFC2E1C(&OBJC_IVAR____TtC6TipsUI16TipsContentModel__isSharedVariant);
}

uint64_t sub_20CFC0018()
{
  return sub_20CFC2E1C(OBJC_IVAR____TtC6TipsUI16TipsContentModel__shouldDisplaySharedVariant);
}

void sub_20CFC0034(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController) = a1;

}

void (*sub_20CFC0048(id *a1))(uint64_t *a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_20CFBFE98();
  return sub_20CFC007C;
}

void sub_20CFC007C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *a1;
  v1 = a1[1];
  v3 = *(void **)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController) = v2;

}

uint64_t TipsContentModel.contentDidUpdate.getter()
{
  return swift_retain();
}

uint64_t TipsContentModel.savedTipsContentDidUpdate.getter()
{
  return swift_retain();
}

uint64_t TipsContentModel.networkDidChangeToReachable.getter()
{
  return swift_retain();
}

void static TipsContentModel.appActive()()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v1 = objc_msgSend(v0, sel_fullTipContentManager);

  objc_msgSend(v1, sel_tipsAppActive);
}

void sub_20CFC0138()
{
  uint64_t v0;
  id v1;
  unint64_t v2;
  id v3;
  uint64_t v4;

  v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController), sel_userGuides));
  if (v1)
  {
    sub_20CFCD0AC();
    v2 = sub_20CFCD190();

    if (v2 >> 62)
    {
      swift_bridgeObjectRetain();
      v4 = sub_20CFCD3D0();
      swift_bridgeObjectRelease();
      if (v4)
      {
LABEL_4:
        if ((v2 & 0xC000000000000001) != 0)
        {
          MEMORY[0x212B9A340](0, v2);
        }
        else
        {
          if (!*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return;
          }
          v3 = *(id *)(v2 + 32);
        }
      }
    }
    else if (*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_4;
    }
    swift_bridgeObjectRelease();
  }
}

id sub_20CFC0218()
{
  uint64_t v0;

  return objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                               + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController), sel_savedTipsCollection));
}

id sub_20CFC0244()
{
  uint64_t v0;
  id *v1;
  id v2;
  void *v3;
  id v4;

  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  v1 = (id *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__currentCollection);
  swift_beginAccess();
  if (*v1)
  {
    v2 = objc_msgSend(*v1, sel_identifier);
    sub_20CFCD118();

    v3 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend((id)objc_opt_self(), sel_isSavedTipsCollectionIdentifier_, v3);

  return v4;
}

id sub_20CFC035C()
{
  uint64_t v0;

  return objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                               + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController), sel_assetSizes));
}

id sub_20CFC0388(char a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
  objc_msgSend(v2, sel_setAlwaysShowIntro_, a1 & 1);
  return objc_msgSend(v2, sel_updateContent);
}

id sub_20CFC03CC()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController), sel_updateSavedTipsContent);
}

void sub_20CFC03E4(void *a1, uint64_t a2, void (*a3)(_QWORD, id), uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  char *v21;
  _QWORD aBlock[6];

  v9 = sub_20CFCC3EC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void **)(v4 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
  v14 = objc_msgSend(a1, sel_fullContentAssets);
  v15 = objc_msgSend(a1, sel_language);
  if (!v15)
  {
    sub_20CFCD118();
    v21 = v12;
    v15 = (id)sub_20CFCD0F4();
    v12 = v21;
    swift_bridgeObjectRelease();
  }
  v16 = objc_msgSend(a1, sel_assetFileInfoManager);
  v17 = objc_msgSend(v13, sel_assetConfigurationForAssets_language_userInterfaceStyle_assetFileInfoManager_, v14, v15, a2, v16);

  if (v17)
  {
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = a3;
    *(_QWORD *)(v18 + 24) = a4;
    aBlock[4] = sub_20CF9BB14;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20CFA117C;
    aBlock[3] = &block_descriptor_6;
    v19 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_fetchAssetsWithAssetsConfiguration_completionHandler_, v17, v19);
    _Block_release(v19);
  }
  else
  {
    LODWORD(aBlock[0]) = 22;
    sub_20CFC1E98(MEMORY[0x24BEE4AF8]);
    sub_20CF82E3C(&qword_25499EA58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAFE0], MEMORY[0x24BDCAFD8]);
    sub_20CFCC410();
    v17 = (id)sub_20CFCC3E0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    a3(0, v17);
  }

}

void sub_20CFC0670(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  _QWORD *v10;
  uint64_t v11;
  void (*v12)(_BYTE *, uint64_t);
  void *v13;
  id v14;
  void *v15;
  _BYTE v16[24];

  v3 = sub_20CFCC728();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v16[-v8];
  v10 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_currentTipList);
  swift_beginAccess();
  if (*v10)
  {
    v11 = v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
    swift_beginAccess();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v9, v11, v3);
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v7, *MEMORY[0x24BDEB400], v3);
    swift_bridgeObjectRetain();
    LOBYTE(v11) = sub_20CFCC71C();
    v12 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
    v12(v7, v3);
    v12(v9, v3);
    v13 = *(void **)(v1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_prefetchingManager);
    sub_20CF82934(0, (unint64_t *)&qword_253EC6B50);
    v14 = v13;
    v15 = (void *)sub_20CFCD184();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_prefetchAssetsFromTip_tips_assetUserInterfaceStyle_, a1, v15, (v11 & 1) == 0);

  }
}

id sub_20CFC0820()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_prefetchingManager), sel_cancel);
}

id sub_20CFC0838(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25499EA60);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20CFCC728();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = objc_msgSend(a1, sel_language);
  v9 = sub_20CFCD118();
  v11 = v10;

  v12 = objc_msgSend(a1, sel_assetFileInfoManager);
  v13 = sub_20CFC0954(a2, (uint64_t)v6, v9, v11, (uint64_t)v12);
  swift_bridgeObjectRelease();

  sub_20CF8658C((uint64_t)v6, (uint64_t *)&unk_25499EA60);
  return v13;
}

id sub_20CFC0954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
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
  void (*v22)(char *, uint64_t);
  void *v23;
  void *v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v28 = a1;
  v29 = a5;
  v27 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25499EA60);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_20CFCC728();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v27 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v27 - v18;
  sub_20CF865C8(a2, (uint64_t)v9, (uint64_t *)&unk_25499EA60);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_20CF8658C((uint64_t)v9, (uint64_t *)&unk_25499EA60);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v19, v9, v10);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v17, v19, v10);
    v20 = v5 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 40))(v20, v17, v10);
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v19, v10);
  }
  v21 = v5 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_colorScheme;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v17, v21, v10);
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v14, *MEMORY[0x24BDEB400], v10);
  LOBYTE(v21) = sub_20CFCC71C();
  v22 = *(void (**)(char *, uint64_t))(v11 + 8);
  v22(v14, v10);
  v22(v17, v10);
  v23 = *(void **)(v5 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
  v24 = (void *)sub_20CFCD0F4();
  v25 = objc_msgSend(v23, sel_assetConfigurationForAssets_language_userInterfaceStyle_assetFileInfoManager_, v28, v24, (v21 & 1) == 0, v29, v27);

  return v25;
}

uint64_t sub_20CFC0BD0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;

  if (a1)
  {
    v6 = (void *)objc_opt_self();
    v7 = a1;
    v8 = objc_msgSend(v6, sel_assetPathFromAssetConfiguration_type_, v7, a2);
    if (v8)
    {
      v9 = v8;
      sub_20CFCD118();

      sub_20CFCC458();
      return swift_bridgeObjectRelease();
    }

  }
  v11 = sub_20CFCC47C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(a3, 1, 1, v11);
}

id sub_20CFC0CA8(uint64_t a1, uint64_t a2)
{
  return sub_20CFC1058(a1, a2, (SEL *)&selRef_tipForIdentifier_);
}

void *sub_20CFC0CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;

  if (!a4)
    return 0;
  v7 = *(void **)(v4 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
  v8 = (void *)sub_20CFCD0F4();
  v9 = objc_msgSend(v7, sel_tipsForCollectionIdentifier_, v8);

  if (!v9)
    return 0;
  sub_20CF82934(0, (unint64_t *)&qword_253EC6B50);
  v10 = sub_20CFCD190();

  swift_bridgeObjectRetain();
  v11 = sub_20CFBB19C(v10, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_20CFC0D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  if (!a2)
    return 0;
  v3 = *(void **)(v2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
  v4 = (void *)sub_20CFCD0F4();
  v5 = objc_msgSend(v3, sel_tipsForCollectionIdentifier_, v4);

  if (!v5)
    return 0;
  sub_20CF82934(0, (unint64_t *)&qword_253EC6B50);
  v6 = sub_20CFCD190();

  return v6;
}

void sub_20CFC0E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v6 = *(void **)(v4 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
  if (!a2)
  {
    v7 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v7 = (void *)sub_20CFCD0F4();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v8 = sub_20CFCD0F4();
LABEL_6:
  v9 = (id)v8;
  objc_msgSend(v6, sel_tipViewed_collectionIdentifier_, v7);

}

void *sub_20CFC0EB8(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  void *v5;

  v4 = sub_20CFC1264();
  swift_bridgeObjectRetain();
  v5 = sub_20CFBB19C(v4, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_20CFC0F24(id *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend(*a1, sel_identifier);
  v6 = sub_20CFCD118();
  v8 = v7;

  if (a3)
  {
    if (v6 == a2 && v8 == a3)
      LOBYTE(a3) = 1;
    else
      LOBYTE(a3) = sub_20CFCD430();
  }
  swift_bridgeObjectRelease();
  return a3 & 1;
}

void *sub_20CFC0FC8(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  void *v5;

  if (!a2)
    return 0;
  v4 = sub_20CFC1264();
  swift_bridgeObjectRetain();
  v5 = sub_20CFBB33C(v4, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

void sub_20CFC1040(uint64_t a1, uint64_t a2)
{
  sub_20CFC10CC(a1, a2, (SEL *)&selRef_collectionIdentifierViewed_);
}

id sub_20CFC104C(uint64_t a1, uint64_t a2)
{
  return sub_20CFC1058(a1, a2, (SEL *)&selRef_userGuideWithIdentifier_);
}

id sub_20CFC1058(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v5 = *(void **)(v3 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
  if (a2)
    v6 = (void *)sub_20CFCD0F4();
  else
    v6 = 0;
  v7 = objc_msgSend(v5, *a3, v6);

  return v7;
}

void sub_20CFC10C0(uint64_t a1, uint64_t a2)
{
  sub_20CFC10CC(a1, a2, (SEL *)&selRef_removeNotificationForIdentifier_);
}

void sub_20CFC10CC(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  id v7;

  v5 = *(void **)(v3 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController);
  if (a2)
    v6 = sub_20CFCD0F4();
  else
    v6 = 0;
  v7 = (id)v6;
  objc_msgSend(v5, *a3);

}

uint64_t sub_20CFC1124(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25499EA60);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_20CFCC728();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = objc_msgSend(a1, sel_language);
  v11 = sub_20CFCD118();
  v13 = v12;

  v14 = objc_msgSend(a1, sel_assetFileInfoManager);
  v15 = sub_20CFC0954(a2, (uint64_t)v8, v11, v13, (uint64_t)v14);
  swift_bridgeObjectRelease();

  sub_20CF8658C((uint64_t)v8, (uint64_t *)&unk_25499EA60);
  v16 = sub_20CFC2198(v15, a3);

  return v16;
}

uint64_t sub_20CFC1264()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  uint64_t *v4;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v9;

  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  v1 = (void **)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__featuredCollection);
  swift_beginAccess();
  v2 = *v1;
  if (*v1)
  {
    swift_getKeyPath();
    v3 = v2;
    sub_20CFCC524();
    swift_release();
    v4 = (uint64_t *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__collections);
    swift_beginAccess();
    v9 = *v4;
    swift_bridgeObjectRetain_n();
    v5 = v3;
    MEMORY[0x212B9A118]();
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_20CFCD1A8();
    sub_20CFCD1B4();
    sub_20CFCD19C();
    v6 = v9;

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_getKeyPath();
    sub_20CFCC524();
    swift_release();
    v7 = (uint64_t *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__collections);
    swift_beginAccess();
    v6 = *v7;
    swift_bridgeObjectRetain();
  }
  return v6;
}

id sub_20CFC1448()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC518();
  swift_release();
  swift_getKeyPath();
  sub_20CFCC518();
  swift_release();
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_appController), sel_removeAllContent);
}

id TipsContentModel.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipsContentModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall TipsContentModel.appControllerContentUpdated(_:)(TPSAppController *a1)
{
  NSArray *v2;
  NSArray *v3;
  uint64_t KeyPath;
  TPSCollection *v5;
  uint64_t v6;

  v2 = -[TPSAppController collections](a1, sel_collections);
  if (v2)
  {
    v3 = v2;
    sub_20CF82934(0, (unint64_t *)&unk_25499EA78);
    sub_20CFCD190();

  }
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC518();
  swift_release();
  swift_bridgeObjectRelease();
  v5 = -[TPSAppController featuredCollection](a1, sel_featuredCollection);
  v6 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v6);
  sub_20CFCC518();
  swift_release();

  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6858);
  sub_20CFC24F4();
  sub_20CFCC62C();
}

Swift::Void __swiftcall TipsContentModel.appController(_:loadingContent:)(TPSAppController *_, Swift::Bool loadingContent)
{
  uint64_t v2;
  uint64_t KeyPath;
  NSError *v5;
  NSError *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;

  if (loadingContent)
  {
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
    sub_20CFCC518();
LABEL_7:
    swift_release();
    goto LABEL_8;
  }
  v5 = -[TPSAppController lastFetchError](_, sel_lastFetchError);
  if (v5)
  {
    v6 = v5;
    sub_20CFCCF74();
    if ((sub_20CFCCF5C() & 1) == 0)
      sub_20CFCCF68();
    v7 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v7);
    sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
    sub_20CFCC518();

    goto LABEL_7;
  }
LABEL_8:
  swift_getKeyPath();
  sub_20CF82E3C(&qword_253EC5D50, (uint64_t (*)(uint64_t))type metadata accessor for TipsContentModel, (uint64_t)&protocol conformance descriptor for TipsContentModel);
  sub_20CFCC524();
  swift_release();
  v8 = (_BYTE *)(v2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel__loading);
  swift_beginAccess();
  if (*v8 == 1 && !loadingContent)
  {
    v9 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v9);
    sub_20CFCC518();
    swift_release();
  }
  v10 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v10);
  sub_20CFCC518();
  swift_release();
}

Swift::Void __swiftcall TipsContentModel.appControllerNetworkStateDidChange(toReachable:)(TPSAppController *toReachable)
{
  sub_20CFC1D70();
}

Swift::Void __swiftcall TipsContentModel.appControllerUserUpdatedSavedTips(_:)(TPSAppController *a1)
{
  sub_20CFC1D70();
}

uint64_t sub_20CFC1D70()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6858);
  sub_20CFC24F4();
  return sub_20CFCC62C();
}

void sub_20CFC1DBC(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6858);
  sub_20CFC24F4();
  sub_20CFCC62C();

}

void _s6TipsUI0A12ContentModelC14overrideWidget4withySo6TPSTipC_tF_0(uint64_t a1)
{
  id v2;

  if (objc_msgSend((id)objc_opt_self(), sel_isInternalBuild))
  {
    v2 = sub_20CFBFE98();
    objc_msgSend(v2, sel_attemptWidgetUpdateWith_, a1);

  }
}

unint64_t sub_20CFC1E98(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25499EAF0);
  v2 = sub_20CFCD400();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_20CF865C8(v6, (uint64_t)&v15, &qword_25499DDF8);
    v7 = v15;
    v8 = v16;
    result = sub_20CFC1FF0(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_20CF97650(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

uint64_t sub_20CFC1FCC()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_20CFC1FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_20CFCD4B4();
  sub_20CFCD13C();
  v4 = sub_20CFCD4D8();
  return sub_20CFC2054(a1, a2, v4);
}

unint64_t sub_20CFC2054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_20CFCD430() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_20CFCD430() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_20CFCD430() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_20CFC2198(void *a1, uint64_t a2)
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
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F58);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v36 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v36 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v36 - v14;
  v39 = v7;
  if (a1)
  {
    v16 = objc_msgSend(a1, sel_cacheIdentifierForType_, 1);
    if (v16)
    {
      v17 = v16;
      v37 = sub_20CFCD118();
      v38 = v18;

    }
    else
    {
      v37 = 0;
      v38 = 0;
    }
    v20 = (void *)objc_opt_self();
    v21 = a1;
    v22 = objc_msgSend(v20, sel_assetPathFromAssetConfiguration_type_, v21, 1);
    if (v22)
    {
      v23 = v22;
      sub_20CFCD118();

      sub_20CFCC458();
      swift_bridgeObjectRelease();
      v24 = 2 * (a2 == 2);
      goto LABEL_11;
    }

    v19 = v38;
    v7 = v39;
  }
  else
  {
    v19 = 0;
    v37 = 0;
  }
  v25 = sub_20CFCC47C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v15, 1, 1, v25);
  if (!a1)
  {
LABEL_16:
    v32 = sub_20CFCC47C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v13, 1, 1, v32);
    goto LABEL_17;
  }
  v38 = v19;
  v24 = 2 * (a2 == 2);
  v21 = a1;
LABEL_11:
  v26 = objc_msgSend(v21, sel_cacheIdentifierForType_, v24);
  if (v26)
  {
    v27 = v26;
    sub_20CFCD118();

  }
  v28 = (void *)objc_opt_self();
  v29 = v21;
  v30 = objc_msgSend(v28, (SEL)&stru_24C5E3088.imp + 1, v29, v24);
  if (!v30)
  {

    v7 = v39;
    goto LABEL_16;
  }
  v31 = v30;
  sub_20CFCD118();

  sub_20CFCC458();
  swift_bridgeObjectRelease();
  v7 = v39;
LABEL_17:
  sub_20CF865C8((uint64_t)v15, (uint64_t)v10, &qword_253EC5F58);
  sub_20CF865C8((uint64_t)v13, (uint64_t)v7, &qword_253EC5F58);
  v33 = objc_allocWithZone((Class)sub_20CFCCF50());
  v34 = sub_20CFCCF20();
  sub_20CF8658C((uint64_t)v13, &qword_253EC5F58);
  sub_20CF8658C((uint64_t)v15, &qword_253EC5F58);
  return v34;
}

unint64_t sub_20CFC24F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25499EA70;
  if (!qword_25499EA70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC6858);
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDB9CA8], v1);
    atomic_store(result, (unint64_t *)&qword_25499EA70);
  }
  return result;
}

id sub_20CFC2568@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_sharedVariantTip);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_20CFC25BC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_pendingSharedVariantID);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20CFC2614@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC6TipsUI16TipsContentModel_currentTipList);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

id sub_20CFC266C@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_20CFBFE98();
  *a1 = result;
  return result;
}

void sub_20CFC2694(void **a1, _QWORD *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *a1;
  v4 = *(id *)(*a2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController);
  *(_QWORD *)(*a2 + OBJC_IVAR____TtC6TipsUI16TipsContentModel____lazy_storage___featuredTipController) = *a1;
  v3 = v2;

}

uint64_t sub_20CFC26D0()
{
  return type metadata accessor for TipsContentModel();
}

uint64_t method lookup function for TipsContentModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TipsContentModel.colorScheme.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of TipsContentModel.colorScheme.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of TipsContentModel.colorScheme.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of TipsContentModel.loading.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of TipsContentModel.loading.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of TipsContentModel.loading.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of TipsContentModel.hasLoaded.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of TipsContentModel.hasLoaded.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of TipsContentModel.hasLoaded.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of TipsContentModel.collections.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of TipsContentModel.collections.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of TipsContentModel.collections.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of TipsContentModel.contentMessageType.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of TipsContentModel.contentMessageType.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of TipsContentModel.contentMessageType.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of TipsContentModel.currentCollection.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of TipsContentModel.currentCollection.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of TipsContentModel.currentCollection.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of TipsContentModel.currentTip.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of TipsContentModel.currentTip.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of TipsContentModel.currentTip.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of TipsContentModel.featuredCollection.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x240))();
}

uint64_t dispatch thunk of TipsContentModel.featuredCollection.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x248))();
}

uint64_t dispatch thunk of TipsContentModel.featuredCollection.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x250))();
}

uint64_t dispatch thunk of TipsContentModel.isSharedVariant.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x270))();
}

uint64_t dispatch thunk of TipsContentModel.isSharedVariant.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x278))();
}

uint64_t dispatch thunk of TipsContentModel.isSharedVariant.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x280))();
}

uint64_t dispatch thunk of TipsContentModel.shouldDisplaySharedVariant.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of TipsContentModel.shouldDisplaySharedVariant.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of TipsContentModel.shouldDisplaySharedVariant.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of TipsContentModel.sharedVariantTip.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of TipsContentModel.sharedVariantTip.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of TipsContentModel.sharedVariantTip.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of TipsContentModel.pendingSharedVariantID.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of TipsContentModel.pendingSharedVariantID.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of TipsContentModel.pendingSharedVariantID.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of TipsContentModel.currentTipList.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of TipsContentModel.currentTipList.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of TipsContentModel.currentTipList.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2F8))();
}

uint64_t dispatch thunk of TipsContentModel.featuredTipController.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x318))();
}

uint64_t dispatch thunk of TipsContentModel.featuredTipController.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x320))();
}

uint64_t dispatch thunk of TipsContentModel.featuredTipController.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x328))();
}

uint64_t dispatch thunk of TipsContentModel.mainUserGuide.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x330))();
}

uint64_t dispatch thunk of TipsContentModel.savedTipsCollection.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x338))();
}

uint64_t dispatch thunk of TipsContentModel.isCurrentCollectionSavedTips.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x340))();
}

uint64_t dispatch thunk of TipsContentModel.assetSizes()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x348))();
}

uint64_t dispatch thunk of TipsContentModel.updateContent(alwaysShowIntro:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x350))();
}

uint64_t dispatch thunk of TipsContentModel.updateSavedTipsContent()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x358))();
}

uint64_t dispatch thunk of TipsContentModel.fetchTipAssetsInfo(for:userInterfaceStyle:completionHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x360))();
}

uint64_t dispatch thunk of TipsContentModel.startTipsPrefetchFrom(tip:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x368))();
}

uint64_t dispatch thunk of TipsContentModel.cancelTipsPrefetch()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x370))();
}

uint64_t dispatch thunk of TipsContentModel.assetConfiguration(for:assets:updatedColorScheme:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x378))();
}

uint64_t dispatch thunk of TipsContentModel.assetConfiguration(assets:updatedColorScheme:language:assetFileInfoManager:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x380))();
}

uint64_t dispatch thunk of TipsContentModel.assetURL(for:type:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x388))();
}

uint64_t dispatch thunk of TipsContentModel.tip(forIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x390))();
}

uint64_t dispatch thunk of TipsContentModel.tip(forIdentifier:inCollectionIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x398))();
}

uint64_t dispatch thunk of TipsContentModel.tips(forCollectionIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3A0))();
}

uint64_t dispatch thunk of TipsContentModel.tipViewed(_:collectionIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3A8))();
}

uint64_t dispatch thunk of TipsContentModel.collection(forCollectionIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3B0))();
}

uint64_t dispatch thunk of TipsContentModel.collection(forTipIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3B8))();
}

uint64_t dispatch thunk of TipsContentModel.collectionIdentifierViewed(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3C0))();
}

uint64_t dispatch thunk of TipsContentModel.userGuide(forBookIdentifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3C8))();
}

uint64_t dispatch thunk of TipsContentModel.removeNotificationForIdentifier(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3D0))();
}

uint64_t dispatch thunk of TipsContentModel.assetsInfo(for:assets:imageType:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3D8))();
}

uint64_t dispatch thunk of TipsContentModel.assetsInfo(for:imageType:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3E0))();
}

uint64_t dispatch thunk of TipsContentModel.removeAllContent()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3F0))();
}

uint64_t sub_20CFC2E1C(_QWORD *a1)
{
  uint64_t v1;
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *(_BYTE *)(v1 + 24);
  v3 = (_BYTE *)(*(_QWORD *)(v1 + 16) + *a1);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_20CFC2E74()
{
  uint64_t v0;
  char v1;
  _BYTE *v2;
  uint64_t result;

  v1 = *(_BYTE *)(v0 + 24);
  v2 = (_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC6TipsUI16TipsContentModel__contentMessageType);
  result = swift_beginAccess();
  *v2 = v1;
  return result;
}

uint64_t sub_20CFC2ED0()
{
  return sub_20CFBB7AC();
}

void sub_20CFC2EE4()
{
  sub_20CFBFFCC();
}

void sub_20CFC2EF8()
{
  sub_20CFBFF7C();
}

uint64_t sub_20CFC2F0C()
{
  return sub_20CFCC7AC();
}

double EnvironmentValues.backgroundViewOpacity.getter()
{
  double v1;

  sub_20CF8BAE8();
  sub_20CFCC8CC();
  return v1;
}

uint64_t EnvironmentValues.backgroundViewOpacity.setter()
{
  sub_20CF8BAE8();
  return sub_20CFCC8D8();
}

uint64_t (*EnvironmentValues.backgroundViewOpacity.modify(uint64_t a1))(_QWORD *a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 16) = v1;
  *(_QWORD *)(a1 + 24) = sub_20CF8BAE8();
  sub_20CFCC8CC();
  return sub_20CFC2FD4;
}

uint64_t sub_20CFC2FD4(_QWORD *a1)
{
  a1[1] = *a1;
  return sub_20CFCC8D8();
}

uint64_t View.backgroundViewOpacity(_:)()
{
  swift_getKeyPath();
  sub_20CFCCB48();
  return swift_release();
}

uint64_t sub_20CFC3090(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499EB60);
  v2 = sub_20CFCC80C();
  v4[0] = v1;
  v4[1] = sub_20CFC30F0();
  return MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_20CFC30F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25499EB68;
  if (!qword_25499EB68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499EB60);
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDF1028], v1);
    atomic_store(result, &qword_25499EB68);
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundViewOpacityKey()
{
  return &type metadata for BackgroundViewOpacityKey;
}

unint64_t SearchResult.Item.Category.init(rawValue:)@<X0>(unint64_t result@<X0>, char *a2@<X8>)
{
  char v2;

  v2 = 3;
  if (result < 3)
    v2 = result;
  *a2 = v2;
  return result;
}

uint64_t SearchResult.Item.Category.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

unint64_t sub_20CFC3168@<X0>(unint64_t *a1@<X0>, char *a2@<X8>)
{
  return SearchResult.Item.Category.init(rawValue:)(*a1, a2);
}

void sub_20CFC3170(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t SearchResult.Item.category.getter@<X0>(char *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  char v9;
  uint64_t v10;
  char v11;

  result = sub_20CFCCE90();
  if (v3)
  {
    v4 = result;
    v5 = v3;
    sub_20CF82934(0, (unint64_t *)&qword_253EC6B50);
    if (v4 == sub_20CFCD2C8() && v5 == v6)
    {
      swift_bridgeObjectRelease();
LABEL_10:
      result = swift_bridgeObjectRelease();
      v9 = 1;
      goto LABEL_11;
    }
    v8 = sub_20CFCD430();
    swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
      goto LABEL_10;
    sub_20CFCCFBC();
    if (v4 == sub_20CFCCF8C() && v5 == v10)
    {
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v9 = 2;
    }
    else
    {
      v11 = sub_20CFCD430();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if ((v11 & 1) != 0)
        v9 = 2;
      else
        v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_11:
  *a1 = v9;
  return result;
}

uint64_t sub_20CFC32B0@<X0>(_QWORD *a1@<X8>)
{
  return sub_20CFC34F4(a1);
}

uint64_t sub_20CFC32C4()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return sub_20CFC3310(v0);
}

uint64_t sub_20CFC32EC()
{
  return sub_20CFC35A8();
}

uint64_t sub_20CFC3304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, sub_20CFC3310);
}

uint64_t sub_20CFC3310(uint64_t a1)
{
  return sub_20CFC3634(a1, (uint64_t)&unk_20CFD1360, (uint64_t)&unk_20CFD1388, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated, (void (*)(void (*)(), uint64_t))sub_20CFCA54C);
}

void (*sub_20CFC3334(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[7] = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  v3[6] = *v3;
  return sub_20CFC33C4;
}

void sub_20CFC33C4(uint64_t a1, char a2)
{
  sub_20CFC37FC(a1, a2, (uint64_t)&unk_20CFD1360, (uint64_t)&unk_20CFD1388, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated, (void (*)(void (*)(_QWORD), uint64_t))sub_20CFCA54C);
}

uint64_t sub_20CFC33E8()
{
  return sub_20CF83BB4((uint64_t)&OBJC_IVAR____TtC6TipsUI18SearchResultsModel__tips, &qword_253EC68A0);
}

uint64_t sub_20CFC33FC(uint64_t a1)
{
  return sub_20CF9961C(a1, &qword_253EC5E58, (uint64_t)&OBJC_IVAR____TtC6TipsUI18SearchResultsModel__tips, &qword_253EC68A0);
}

uint64_t (*sub_20CFC3418(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E58);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC6TipsUI18SearchResultsModel__tips;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68A0);
  sub_20CFCC644();
  swift_endAccess();
  return sub_20CF98F10;
}

uint64_t sub_20CFC34E0@<X0>(_QWORD *a1@<X8>)
{
  return sub_20CFC34F4(a1);
}

uint64_t sub_20CFC34F4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_20CFC356C()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return sub_20CFC3610(v0);
}

uint64_t sub_20CFC3594()
{
  return sub_20CFC35A8();
}

uint64_t sub_20CFC35A8()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20CFC3610(uint64_t a1)
{
  return sub_20CFC3634(a1, (uint64_t)&unk_20CFD13A8, (uint64_t)&unk_20CFD13D0, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated, (void (*)(void (*)(), uint64_t))sub_20CFCA54C);
}

uint64_t sub_20CFC3634(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, void (*a5)(void (*)(), uint64_t))
{
  uint64_t v5;
  uint64_t v8;
  uint64_t result;
  void (*v10)();
  uint64_t v11;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_20CFCC674();
  v8 = v5 + *a4;
  result = swift_beginAccess();
  v10 = *(void (**)())v8;
  if (*(_QWORD *)v8)
  {
    v11 = *(_QWORD *)(v8 + 8);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_20CFCC668();
    swift_release();
    swift_release();
    v10();
    a5(v10, v11);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void (*sub_20CFC3748(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[7] = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  v3[6] = *v3;
  return sub_20CFC37D8;
}

void sub_20CFC37D8(uint64_t a1, char a2)
{
  sub_20CFC37FC(a1, a2, (uint64_t)&unk_20CFD13A8, (uint64_t)&unk_20CFD13D0, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated, (void (*)(void (*)(_QWORD), uint64_t))sub_20CFCA54C);
}

void sub_20CFC37FC(uint64_t a1, char a2, uint64_t a3, uint64_t a4, _QWORD *a5, void (*a6)(void (*)(_QWORD), uint64_t))
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(_QWORD);
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD);
  uint64_t v16;

  v8 = *(_QWORD **)a1;
  v9 = *(_QWORD *)(*(_QWORD *)a1 + 48);
  swift_getKeyPath();
  swift_getKeyPath();
  v10 = v8[7];
  *v8 = v9;
  swift_retain();
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    sub_20CFCC674();
    v11 = v10 + *a5;
    swift_beginAccess();
    v12 = *(void (**)(_QWORD))v11;
    if (*(_QWORD *)v11)
    {
      v13 = *(_QWORD *)(v11 + 8);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_20CFCC668();
      swift_release();
      swift_release();
      v12(*v8);
      a6(v12, v13);
      swift_bridgeObjectRelease();
    }
    goto LABEL_7;
  }
  sub_20CFCC674();
  v14 = v10 + *a5;
  swift_beginAccess();
  v15 = *(void (**)(_QWORD))v14;
  if (*(_QWORD *)v14)
  {
    v16 = *(_QWORD *)(v14 + 8);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_20CFCC668();
    swift_release();
    swift_release();
    v15(v8[3]);
    a6(v15, v16);
LABEL_7:
    swift_bridgeObjectRelease();
  }
  free(v8);
}

uint64_t sub_20CFC39FC()
{
  return sub_20CF83BB4((uint64_t)&OBJC_IVAR____TtC6TipsUI18SearchResultsModel__topics, &qword_253EC5E60);
}

uint64_t sub_20CFC3A10(uint64_t a1)
{
  return sub_20CF9961C(a1, &qword_253EC5E48, (uint64_t)&OBJC_IVAR____TtC6TipsUI18SearchResultsModel__topics, &qword_253EC5E60);
}

uint64_t (*sub_20CFC3A2C(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E48);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC6TipsUI18SearchResultsModel__topics;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E60);
  sub_20CFCC644();
  swift_endAccess();
  return sub_20CF98F10;
}

uint64_t sub_20CFC3AF4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_20CFCA554;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_20CF8A8F4(v4);
}

uint64_t sub_20CFC3B88(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_20CFCA5B8;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_20CF8A8F4(v3);
  return sub_20CF88FE0(v8);
}

uint64_t sub_20CFC3C40()
{
  return sub_20CFC59A8(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler, (void (*)(_QWORD, _QWORD))sub_20CFCA550);
}

uint64_t sub_20CFC3C54(uint64_t a1, uint64_t a2)
{
  return sub_20CFC538C(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler, (uint64_t (*)(uint64_t, uint64_t))sub_20CFCA54C);
}

uint64_t (*sub_20CFC3C68())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_20CFC3CAC()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuery);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_20CFC3CF8(void *a1)
{
  sub_20CFC9450(a1);

}

void (*sub_20CFC3D1C(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuery;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_20CFC3D74;
}

void sub_20CFC3D74(_QWORD **a1, char a2)
{
  _QWORD *v3;
  void *v4;
  id v5;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = *(void **)(v3[3] + v3[4]);
    *v3 = v4;
    v5 = v4;
    swift_retain();
    sub_20CFCC608();
    swift_release();
  }
  free(v3);
}

char *sub_20CFC3DD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  void **v5;
  char *v6;
  char *v7;
  char *v8;
  _BYTE v10[24];

  v1 = sub_20CFCD04C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = (void **)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuery);
  swift_beginAccess();
  v6 = (char *)*v5;
  if (*v5)
  {
    v7 = &v6[OBJC_IVAR___TPSAppSearchQuery__searchTerm];
    swift_beginAccess();
    (*(void (**)(_BYTE *, char *, uint64_t))(v2 + 16))(v4, v7, v1);
    v8 = v6;
    v6 = (char *)sub_20CFCD034();
    (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);

  }
  return v6;
}

BOOL sub_20CFC3EE0()
{
  return sub_20CFC3F08();
}

BOOL sub_20CFC3EF4()
{
  return sub_20CFC3F08();
}

BOOL sub_20CFC3F08()
{
  uint64_t v0;
  unint64_t v2;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v0 = sub_20CFCD3D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v0 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v0 != 0;
}

BOOL sub_20CFC3FBC()
{
  uint64_t v0;
  uint64_t v2;
  unint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v0 = sub_20CFCD3D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v0 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v0)
    return 1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_20CFCD3D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v2 != 0;
}

BOOL sub_20CFC4110()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void **v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;

  v1 = v0;
  v2 = sub_20CFCD04C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (void **)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuery);
  swift_beginAccess();
  v7 = (char *)*v6;
  if (*v6)
  {
    v8 = &v7[OBJC_IVAR___TPSAppSearchQuery__searchTerm];
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
    v9 = v7;
    v10 = sub_20CFCD034();
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

    v13 = v10 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v13 = 0;
    v12 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  v14 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0)
    v14 = v13;
  if (!v14)
    return 0;
  v15 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_queryCount);
  swift_beginAccess();
  return *v15 > 0;
}

uint64_t sub_20CFC4264@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_20CFCA0B0;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_20CF8A8F4(v4);
}

uint64_t sub_20CFC42F8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_20CFC9FEC;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_20CF8A8F4(v3);
  return sub_20CF88FE0(v8);
}

uint64_t sub_20CFC43B0()
{
  return sub_20CFC59A8(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler, (void (*)(_QWORD, _QWORD))sub_20CFCA550);
}

uint64_t sub_20CFC43C4(uint64_t a1, uint64_t a2)
{
  return sub_20CFC538C(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler, (uint64_t (*)(uint64_t, uint64_t))sub_20CFCA54C);
}

uint64_t (*sub_20CFC43D8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFC441C@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryCompleted);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_20CFA016C;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_20CF8A8F4(v4);
}

uint64_t sub_20CFC44B0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_20CFA016C;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryCompleted);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_20CF8A8F4(v3);
  return sub_20CF88FE0(v8);
}

uint64_t sub_20CFC4568()
{
  return sub_20CFC59A8(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryCompleted, (void (*)(_QWORD, _QWORD))sub_20CF8A8F4);
}

uint64_t sub_20CFC457C(uint64_t a1, uint64_t a2)
{
  return sub_20CFC538C(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryCompleted, (uint64_t (*)(uint64_t, uint64_t))sub_20CF88FE0);
}

uint64_t (*sub_20CFC4590())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFC45D4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)@<X0>(_QWORD *@<X0>, uint64_t *@<X8>);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultCollectionResolver);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_20CFCA020;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_20CF8A8F4(v4);
}

uint64_t sub_20CFC4668(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_20CFCA01C;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultCollectionResolver);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_20CF8A8F4(v3);
  return sub_20CF88FE0(v8);
}

uint64_t sub_20CFC4720()
{
  return sub_20CFC59A8(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultCollectionResolver, (void (*)(_QWORD, _QWORD))sub_20CFCA550);
}

uint64_t sub_20CFC4734(uint64_t a1, uint64_t a2)
{
  return sub_20CFC538C(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultCollectionResolver, (uint64_t (*)(uint64_t, uint64_t))sub_20CFCA54C);
}

uint64_t (*sub_20CFC4748())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFC478C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)@<X0>(_QWORD *@<X0>, uint64_t *@<X8>);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultUserGuideResolver);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_20CFCA020;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_20CF8A8F4(v4);
}

uint64_t sub_20CFC4820(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_20CFCA01C;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultUserGuideResolver);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_20CF8A8F4(v3);
  return sub_20CF88FE0(v8);
}

uint64_t sub_20CFC48D8()
{
  return sub_20CFC59A8(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultUserGuideResolver, (void (*)(_QWORD, _QWORD))sub_20CFCA550);
}

uint64_t sub_20CFC48EC(uint64_t a1, uint64_t a2)
{
  return sub_20CFC538C(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultUserGuideResolver, (uint64_t (*)(uint64_t, uint64_t))sub_20CFCA54C);
}

uint64_t (*sub_20CFC4900())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFC4944@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)@<X0>(_QWORD *@<X0>, uint64_t *@<X8>);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultEligibilityFilter);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_20CFCA020;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_20CF8A8F4(v4);
}

uint64_t sub_20CFC49D8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_20CFCA01C;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultEligibilityFilter);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_20CF8A8F4(v3);
  return sub_20CF88FE0(v8);
}

uint64_t sub_20CFC4A90()
{
  return sub_20CFC59A8(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultEligibilityFilter, (void (*)(_QWORD, _QWORD))sub_20CFCA550);
}

uint64_t sub_20CFC4AA4(uint64_t a1, uint64_t a2)
{
  return sub_20CFC538C(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultEligibilityFilter, (uint64_t (*)(uint64_t, uint64_t))sub_20CFCA54C);
}

uint64_t (*sub_20CFC4AB8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFC4AFC@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultScrollHandler);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_20CFA016C;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_20CF8A8F4(v4);
}

uint64_t sub_20CFC4B90(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_20CFA016C;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultScrollHandler);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_20CF8A8F4(v3);
  return sub_20CF88FE0(v8);
}

uint64_t sub_20CFC4C48()
{
  return sub_20CFC59A8(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultScrollHandler, (void (*)(_QWORD, _QWORD))sub_20CF8A8F4);
}

uint64_t sub_20CFC4C5C(uint64_t a1, uint64_t a2)
{
  return sub_20CFC538C(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultScrollHandler, (uint64_t (*)(uint64_t, uint64_t))sub_20CF88FE0);
}

uint64_t (*sub_20CFC4C70())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFC4CB4@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsUpdated);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_20CF9BB14;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_20CF8A8F4(v4);
}

uint64_t sub_20CFC4D48(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_20CF9BB14;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsUpdated);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_20CF8A8F4(v3);
  return sub_20CF88FE0(v8);
}

uint64_t sub_20CFC4E00()
{
  return sub_20CFC59A8(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsUpdated, (void (*)(_QWORD, _QWORD))sub_20CF8A8F4);
}

uint64_t sub_20CFC4E14(uint64_t a1, uint64_t a2)
{
  return sub_20CFC538C(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsUpdated, (uint64_t (*)(uint64_t, uint64_t))sub_20CF88FE0);
}

uint64_t (*sub_20CFC4E28())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFC4E6C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_20CFCA554;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_20CF8A8F4(v4);
}

uint64_t sub_20CFC4F00(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_20CFCA5B8;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_20CF8A8F4(v3);
  return sub_20CF88FE0(v8);
}

uint64_t sub_20CFC4FB8()
{
  return sub_20CFC59A8(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated, (void (*)(_QWORD, _QWORD))sub_20CFCA550);
}

uint64_t sub_20CFC4FD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, sub_20CFC3610);
}

uint64_t keypath_setTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v6;

  v6 = swift_bridgeObjectRetain();
  return a5(v6);
}

uint64_t sub_20CFC5008(uint64_t a1, uint64_t a2)
{
  return sub_20CFC538C(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated, (uint64_t (*)(uint64_t, uint64_t))sub_20CFCA54C);
}

uint64_t (*sub_20CFC501C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFC5060@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_20CFCA554;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_20CF8A8F4(v4);
}

uint64_t sub_20CFC50F4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_20CFC9FEC;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_20CF8A8F4(v3);
  return sub_20CF88FE0(v8);
}

uint64_t sub_20CFC51AC()
{
  return sub_20CFC59A8(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated, (void (*)(_QWORD, _QWORD))sub_20CFCA550);
}

uint64_t sub_20CFC51C0(uint64_t a1, uint64_t a2)
{
  return sub_20CFC538C(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated, (uint64_t (*)(uint64_t, uint64_t))sub_20CFCA54C);
}

uint64_t (*sub_20CFC51D4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20CFC5218@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsSeeAllHandler);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_20CF9BB14;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_20CF8A8F4(v4);
}

uint64_t sub_20CFC52AC(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_20CF9BB14;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsSeeAllHandler);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_20CF8A8F4(v3);
  return sub_20CF88FE0(v8);
}

uint64_t sub_20CFC5364()
{
  return sub_20CFC59A8(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsSeeAllHandler, (void (*)(_QWORD, _QWORD))sub_20CFCA550);
}

uint64_t sub_20CFC5378(uint64_t a1, uint64_t a2)
{
  return sub_20CFC538C(a1, a2, &OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsSeeAllHandler, (uint64_t (*)(uint64_t, uint64_t))sub_20CFCA54C);
}

uint64_t sub_20CFC538C(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  v9 = *v8;
  v10 = v8[1];
  *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*sub_20CFC53E8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_20CFC542C@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultSelected);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_20CF9BB14;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_20CF8A8F4(v4);
}

uint64_t sub_20CFC54C0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_20CF9BB14;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_20CF8A8F4(v1);
  sub_20CFC94DC((uint64_t)v4, v3);
  return sub_20CF88FE0((uint64_t)v4);
}

void sub_20CFC5548(void *a1)
{
  uint64_t Strong;
  uint64_t *v3;
  void (*v4)(void **);
  id v5;
  void *v6;
  char v7;

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_20CFC5638(a1);
    swift_release();
  }
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v3 = (uint64_t *)(Strong + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultSelected);
    swift_beginAccess();
    v4 = (void (*)(void **))*v3;
    sub_20CF8A8F4(*v3);
    swift_release();
    if (v4)
    {
      v6 = a1;
      v7 = 1;
      v5 = a1;
      v4(&v6);
      sub_20CF88FE0((uint64_t)v4);

    }
  }
}

uint64_t sub_20CFC5638(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  char *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD aBlock[6];

  v3 = sub_20CFCCDAC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20CFCCDD0();
  v24 = *(_QWORD *)(v7 - 8);
  v25 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_20CFCCDB8();
  v11 = *(_QWORD *)(v10 - 8);
  result = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(void **)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_currentSearchQuery);
  if (v15)
  {
    sub_20CF82934(0, (unint64_t *)&qword_253EC6960);
    (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v14, *MEMORY[0x24BEE5470], v10);
    v16 = v15;
    v23 = v4;
    v17 = v16;
    v18 = (void *)sub_20CFCD298();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = v17;
    *(_QWORD *)(v19 + 24) = a1;
    aBlock[4] = sub_20CFCA540;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20CF8B674;
    aBlock[3] = &block_descriptor_146;
    v20 = _Block_copy(aBlock);
    v21 = v17;
    v22 = a1;
    sub_20CFCCDC4();
    v26 = MEMORY[0x24BEE4AF8];
    sub_20CFBD624();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6928);
    sub_20CF88608((unint64_t *)&qword_253EC6930, &qword_253EC6928, MEMORY[0x24BEE12C8]);
    sub_20CFCD34C();
    MEMORY[0x212B9A220](0, v9, v6, v20);
    _Block_release(v20);

    (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v3);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v25);
    return swift_release();
  }
  return result;
}

void sub_20CFC58B8(void *a1)
{
  uint64_t Strong;
  uint64_t *v3;
  void (*v4)(void **);
  id v5;
  void *v6;
  char v7;

  swift_beginAccess();
  if (swift_weakLoadStrong())
    swift_release();
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v3 = (uint64_t *)(Strong + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultSelected);
    swift_beginAccess();
    v4 = (void (*)(void **))*v3;
    sub_20CF8A8F4(*v3);
    swift_release();
    if (v4)
    {
      v6 = a1;
      v7 = 0;
      v5 = a1;
      v4(&v6);
      sub_20CF88FE0((uint64_t)v4);

    }
  }
}

uint64_t sub_20CFC5994()
{
  return sub_20CFC59A8(&OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultSelected, (void (*)(_QWORD, _QWORD))sub_20CF8A8F4);
}

uint64_t sub_20CFC59A8(_QWORD *a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(v2 + *a1);
  swift_beginAccess();
  v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t sub_20CFC5A08(uint64_t a1, uint64_t a2)
{
  sub_20CFC94DC(a1, a2);
  return sub_20CF88FE0(a1);
}

void (*sub_20CFC5A3C(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[6] = v1;
  swift_beginAccess();
  return sub_20CFC5A94;
}

void sub_20CFC5A94(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = v3[6];
    v5 = swift_allocObject();
    swift_weakInit();
    v6 = (uint64_t *)(v4 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler);
    swift_beginAccess();
    v7 = *v6;
    *v6 = (uint64_t)sub_20CFC9628;
    v6[1] = v5;
    sub_20CF88FE0(v7);
    v8 = swift_allocObject();
    swift_weakInit();
    v9 = (uint64_t *)(v4 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler);
    swift_beginAccess();
    v10 = *v9;
    *v9 = (uint64_t)sub_20CFC9630;
    v9[1] = v8;
    sub_20CF88FE0(v10);
  }
  free(v3);
}

uint64_t sub_20CFC5B8C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_queryCount;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_20CFC5BD0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_queryCount);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_20CFC5C18())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SearchResultsModel.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  SearchResultsModel.init()();
  return v0;
}

uint64_t SearchResultsModel.init()()
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  objc_class *v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  objc_super v51;
  uint64_t v52;

  v1 = v0;
  v2 = sub_20CFCC4DC();
  v48 = *(_QWORD *)(v2 - 8);
  v49 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v47 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_20CFCD04C();
  v45 = *(_QWORD *)(v4 - 8);
  v46 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E60);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68A0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel__tips;
  v16 = MEMORY[0x24BEE4AF8];
  v52 = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6948);
  sub_20CFCC638();
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v15, v14, v11);
  v17 = v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel__topics;
  v52 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F08);
  sub_20CFCC638();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v17, v10, v7);
  v18 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler);
  *v18 = 0;
  v18[1] = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuery) = 0;
  v19 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler);
  *v19 = 0;
  v19[1] = 0;
  v20 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryCompleted);
  *v20 = 0;
  v20[1] = 0;
  v21 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultCollectionResolver);
  *v21 = 0;
  v21[1] = 0;
  v22 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultUserGuideResolver);
  *v22 = 0;
  v22[1] = 0;
  v23 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultEligibilityFilter);
  *v23 = 0;
  v23[1] = 0;
  v24 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultScrollHandler);
  *v24 = 0;
  v24[1] = 0;
  v25 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsUpdated);
  *v25 = 0;
  v25[1] = 0;
  v26 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated);
  *v26 = 0;
  v26[1] = 0;
  v27 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated);
  *v27 = 0;
  v27[1] = 0;
  v28 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsSeeAllHandler);
  *v28 = 0;
  v28[1] = 0;
  v29 = (_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultSelected);
  *v29 = 0;
  v29[1] = 0;
  v30 = OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuerySubject;
  v31 = (objc_class *)type metadata accessor for TPSAppSearchQuery();
  v32 = (char *)objc_allocWithZone(v31);
  v33 = &v32[OBJC_IVAR___TPSAppSearchQuery__searchTerm];
  v34 = v32;
  sub_20CFCD01C();
  v36 = v45;
  v35 = v46;
  (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v33, v6, v46);
  v37 = &v34[OBJC_IVAR___TPSAppSearchQuery_origin];
  *(_QWORD *)&v34[OBJC_IVAR___TPSAppSearchQuery_origin] = 0;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v33, v35);
  sub_20CFCD01C();
  swift_endAccess();
  swift_beginAccess();
  *(_QWORD *)v37 = 0;
  v38 = v47;
  sub_20CFCC4D0();
  v39 = sub_20CFCC4C4();
  v41 = v40;
  (*(void (**)(char *, uint64_t))(v48 + 8))(v38, v49);
  v42 = (uint64_t *)&v34[OBJC_IVAR___TPSAppSearchQuery_identifier];
  *v42 = v39;
  v42[1] = v41;

  v51.receiver = v34;
  v51.super_class = v31;
  v50 = objc_msgSendSuper2(&v51, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E38);
  swift_allocObject();
  *(_QWORD *)(v1 + v30) = sub_20CFCC614();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryTask) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_cancellables) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_currentSearchQuery) = 0;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_queryCount) = 0;
  sub_20CFC6364();
  return v1;
}

uint64_t sub_20CFC6098()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_queryCount);
  swift_beginAccess();
  *v1 = 0;
  return sub_20CFC60E0();
}

uint64_t sub_20CFC60E0()
{
  uint64_t v0;
  uint64_t v1;
  void (**v2)();
  void (*v3)();
  void (**v4)();
  uint64_t result;
  void (*v6)();

  v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_20CFCC674();
  v2 = (void (**)())(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated);
  swift_beginAccess();
  v3 = *v2;
  if (*v2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_20CFCC668();
    swift_release();
    swift_release();
    v3();
    sub_20CF88FE0((uint64_t)v3);
    swift_bridgeObjectRelease();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_20CFCC674();
  v4 = (void (**)())(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated);
  result = swift_beginAccess();
  v6 = *v4;
  if (*v4)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_20CFCC668();
    swift_release();
    swift_release();
    v6();
    sub_20CF88FE0((uint64_t)v6);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_20CFC6364()
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
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
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
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
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E48);
  v2 = *(_QWORD *)(v1 - 8);
  v51 = v1;
  v52 = v2;
  MEMORY[0x24BDAC7A8](v1);
  v48 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E58);
  v5 = *(_QWORD *)(v4 - 8);
  v49 = v4;
  v50 = v5;
  MEMORY[0x24BDAC7A8](v4);
  v46 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5DD0);
  v8 = *(_QWORD *)(v7 - 8);
  v53 = v7;
  v54 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v47 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5F40);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_20CFCD328();
  v39 = *(_QWORD *)(v13 - 8);
  v40 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E28);
  v41 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E18);
  v20 = *(_QWORD *)(v19 - 8);
  v42 = v19;
  v43 = v20;
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5DF8);
  v24 = *(_QWORD *)(v23 - 8);
  v44 = v23;
  v45 = v24;
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v38 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = *(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuerySubject);
  swift_retain();
  sub_20CFCD310();
  v56 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
  v27 = sub_20CFCD304();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v12, 1, 1, v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E38);
  sub_20CF82934(0, &qword_253EC5F50);
  sub_20CF88608(&qword_253EC5E30, &qword_253EC5E38, MEMORY[0x24BDB9D10]);
  sub_20CF9BB34();
  sub_20CFCC6D4();
  sub_20CF8658C((uint64_t)v12, &qword_253EC5F40);

  (*(void (**)(char *, uint64_t))(v39 + 8))(v15, v40);
  swift_release();
  sub_20CF88608(&qword_253EC5E20, &qword_253EC5E28, MEMORY[0x24BDB9920]);
  sub_20CFCC6BC();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v18, v16);
  swift_allocObject();
  swift_weakInit();
  type metadata accessor for TPSAppSearchQuery();
  sub_20CF88608(&qword_253EC5E10, &qword_253EC5E18, MEMORY[0x24BDB9658]);
  v28 = v42;
  sub_20CFCC698();
  swift_release();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v22, v28);
  swift_allocObject();
  swift_weakInit();
  sub_20CF88608(&qword_253EC5DF0, &qword_253EC5DF8, MEMORY[0x24BDB94C8]);
  v29 = v44;
  sub_20CFCC6E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v26, v29);
  swift_beginAccess();
  sub_20CFCC5E4();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68A0);
  v30 = v46;
  sub_20CFCC644();
  swift_endAccess();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E60);
  v31 = v48;
  sub_20CFCC644();
  swift_endAccess();
  v32 = MEMORY[0x24BDB9EE8];
  sub_20CF88608(&qword_253EC5E50, &qword_253EC5E58, MEMORY[0x24BDB9EE8]);
  sub_20CF88608(&qword_253EC5E40, &qword_253EC5E48, v32);
  v33 = v47;
  v34 = v49;
  v35 = v51;
  sub_20CFCC6B0();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v31, v35);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v30, v34);
  swift_allocObject();
  swift_weakInit();
  sub_20CF88608(&qword_253EC5DC8, &qword_253EC5DD0, MEMORY[0x24BDB9450]);
  v36 = v53;
  sub_20CFCC6E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v33, v36);
  swift_beginAccess();
  sub_20CFCC5E4();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_20CFC69F8(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  _BYTE v20[24];

  v4 = sub_20CFCD04C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = *a2;
  if (*a1)
  {
    v9 = *a1 + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
    swift_beginAccess();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
    v10 = sub_20CFCD034();
    v12 = v11;
    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
    if (!v8)
    {
      if (!v12)
        goto LABEL_17;
LABEL_14:
      v18 = 0;
LABEL_19:
      swift_bridgeObjectRelease();
      return v18 & 1;
    }
  }
  else
  {
    if (!v8)
      goto LABEL_17;
    v12 = 0;
    v10 = 0;
  }
  v13 = v8 + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
  swift_beginAccess();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
  v14 = sub_20CFCD034();
  v16 = v15;
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  if (v12)
  {
    if (v16)
    {
      if (v10 == v14 && v12 == v16)
      {
        swift_bridgeObjectRelease();
        v18 = 1;
      }
      else
      {
        v18 = sub_20CFCD430();
        swift_bridgeObjectRelease();
      }
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  if (v16)
  {
    v18 = 0;
    goto LABEL_19;
  }
LABEL_17:
  v18 = 1;
  return v18 & 1;
}

id sub_20CFC6BA4@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  id result;
  uint64_t v16;
  void *v17;

  v4 = sub_20CFCD04C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  if (!*a1)
    goto LABEL_6;
  v9 = (uint64_t)v8 + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
  v17 = v8;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
  v10 = sub_20CFCD034();
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  v13 = v17;
  v14 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0)
    v14 = v10 & 0xFFFFFFFFFFFFLL;
  if (v14)
  {
    *a2 = v17;
    return v13;
  }
  else
  {
LABEL_6:
    swift_beginAccess();
    result = (id)swift_weakLoadStrong();
    if (result)
    {
      sub_20CFC60E0();
      result = (id)swift_release();
    }
    *a2 = 0;
  }
  return result;
}

uint64_t sub_20CFC6CF4(void **a1)
{
  void *v1;
  uint64_t result;

  v1 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    SearchResultsModel.query(searchQuery:)(v1);
    return swift_release();
  }
  return result;
}

uint64_t SearchResultsModel.query(searchQuery:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  _WORD v26[8];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499DD80);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20CFCD04C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_20CFCCE48();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20CFCCE30();
  strcpy((char *)v26, "SearchTerm: ");
  HIBYTE(v26[6]) = 0;
  v26[7] = -5120;
  v25 = a1;
  v15 = (uint64_t)a1 + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v15, v7);
  sub_20CFCD034();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_20CFCD154();
  swift_bridgeObjectRelease();
  sub_20CFCD064();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v16 = (_QWORD *)(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_queryCount);
  result = swift_beginAccess();
  if (__OFADD__(*v16, 1))
  {
    __break(1u);
  }
  else
  {
    ++*v16;
    v18 = OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryTask;
    if (*(_QWORD *)(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryTask))
    {
      swift_retain();
      sub_20CFCD220();
      swift_release();
    }
    v19 = sub_20CFCD214();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v6, 1, 1, v19);
    v20 = swift_allocObject();
    swift_weakInit();
    v21 = (_QWORD *)swift_allocObject();
    v21[2] = 0;
    v21[3] = 0;
    v22 = v25;
    v21[4] = v25;
    v21[5] = v20;
    v23 = v22;
    *(_QWORD *)(v2 + v18) = sub_20CFC7D9C((uint64_t)v6, (uint64_t)&unk_25499EB78, (uint64_t)v21);
    return swift_release();
  }
  return result;
}

uint64_t sub_20CFC7004()
{
  uint64_t result;
  uint64_t *v1;
  void (*v2)(uint64_t);

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = (uint64_t *)(result + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsUpdated);
    swift_beginAccess();
    v2 = (void (*)(uint64_t))*v1;
    sub_20CF8A8F4(*v1);
    result = swift_release();
    if (v2)
    {
      v2(result);
      return sub_20CF88FE0((uint64_t)v2);
    }
  }
  return result;
}

uint64_t sub_20CFC70A0(uint64_t a1, uint64_t a2)
{
  return sub_20CFC70D8(a1, a2, (uint64_t)&unk_20CFD1360, (uint64_t)&unk_20CFD1388, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20CFC9144);
}

uint64_t sub_20CFC70BC(uint64_t a1, uint64_t a2)
{
  return sub_20CFC70D8(a1, a2, (uint64_t)&unk_20CFD13A8, (uint64_t)&unk_20CFD13D0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20CFC92E8);
}

uint64_t sub_20CFC70D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v8;
  uint64_t v10;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  swift_bridgeObjectRetain();
  v8 = a5(v10, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

void sub_20CFC718C(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v3;
  void *v7;
  void (**v8)(void *);
  void (*v9)(void *);
  char v10;
  void (**v11)(void *);
  void (*v12)(void *);
  unint64_t v13;

  if (!a2)
    goto LABEL_11;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  swift_bridgeObjectRetain();
  v7 = sub_20CFC9144(v13, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v7)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_20CFCC668();
    swift_release();
    swift_release();
    swift_bridgeObjectRetain();
    v7 = sub_20CFC92E8(v13, a1, a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v7)
    {
      v11 = (void (**)(void *))(v3 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler);
      swift_beginAccess();
      v12 = *v11;
      if (*v11)
      {
        swift_retain();
        v12(v7);
        sub_20CF88FE0((uint64_t)v12);
      }
      v10 = 2;
      goto LABEL_10;
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  v8 = (void (**)(void *))(v3 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler);
  swift_beginAccess();
  v9 = *v8;
  if (*v8)
  {
    swift_retain();
    v9(v7);
    sub_20CF88FE0((uint64_t)v9);
  }
  v10 = 1;
LABEL_10:

LABEL_12:
  *a3 = v10;
}

uint64_t SearchResultsModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel__tips;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel__topics;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_20CF88FE0(*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler));

  sub_20CF88FE0(*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler));
  sub_20CF88FE0(*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryCompleted));
  sub_20CF88FE0(*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultCollectionResolver));
  sub_20CF88FE0(*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultUserGuideResolver));
  sub_20CF88FE0(*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultEligibilityFilter));
  sub_20CF88FE0(*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultScrollHandler));
  sub_20CF88FE0(*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsUpdated));
  sub_20CF88FE0(*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated));
  sub_20CF88FE0(*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated));
  sub_20CF88FE0(*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsSeeAllHandler));
  sub_20CF88FE0(*(_QWORD *)(v0 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultSelected));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t SearchResultsModel.__deallocating_deinit()
{
  SearchResultsModel.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_20CFC754C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for SearchResultsModel();
  result = sub_20CFCD388();
  *a1 = result;
  return result;
}

uint64_t sub_20CFC758C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5[13] = a4;
  v5[14] = a5;
  v6 = sub_20CFCD1E4();
  v5[15] = v6;
  v5[16] = *(_QWORD *)(v6 - 8);
  v5[17] = swift_task_alloc();
  v7 = sub_20CFCCE48();
  v5[18] = v7;
  v5[19] = *(_QWORD *)(v7 - 8);
  v5[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499DD80);
  v5[21] = swift_task_alloc();
  v8 = (_QWORD *)swift_task_alloc();
  v5[22] = v8;
  *v8 = v5;
  v8[1] = sub_20CFC764C;
  return sub_20CF94C18();
}

uint64_t sub_20CFC764C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  *(_QWORD *)(*v3 + 184) = v2;
  swift_task_dealloc();
  if (!v2)
  {
    *(_QWORD *)(v6 + 192) = a2;
    *(_QWORD *)(v6 + 200) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_20CFC76C4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  v1 = *(void **)(v0 + 192);
  v2 = *(void **)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 168);
  v4 = *(void **)(v0 + 104);
  v5 = sub_20CFCD214();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v3, 1, 1, v5);
  v6 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  sub_20CFCD1FC();
  swift_retain();
  v7 = v2;
  v8 = v1;
  v9 = v4;
  v10 = sub_20CFCD1F0();
  v11 = (_QWORD *)swift_allocObject();
  v12 = MEMORY[0x24BEE6930];
  v11[2] = v10;
  v11[3] = v12;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  v11[7] = v9;
  swift_release();
  sub_20CFC7D9C(v3, (uint64_t)&unk_25499EBA0, (uint64_t)v11);

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20CFC7838()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t Strong;
  void *v11;

  v1 = *(void **)(v0 + 184);
  *(_QWORD *)(v0 + 88) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25499DDD0);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 128);
    v3 = *(_QWORD *)(v0 + 136);
    v5 = *(_QWORD *)(v0 + 120);

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    v6 = *(void **)(v0 + 88);
LABEL_6:

    goto LABEL_7;
  }
  v8 = *(_QWORD *)(v0 + 152);
  v7 = *(_QWORD *)(v0 + 160);
  v9 = *(_QWORD *)(v0 + 144);

  sub_20CFCCE30();
  sub_20CFCD370();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_20CFCD46C();
  sub_20CFCD154();
  swift_bridgeObjectRelease();
  sub_20CFCD154();
  sub_20CFCD070();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  v11 = *(void **)(v0 + 184);
  if (!Strong)
  {
    v6 = *(void **)(v0 + 184);
    goto LABEL_6;
  }
  sub_20CFC60E0();

  swift_release();
LABEL_7:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20CFC7A1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[16] = a6;
  v7[17] = a7;
  v7[14] = a4;
  v7[15] = a5;
  sub_20CFCD1FC();
  v7[18] = sub_20CFCD1F0();
  sub_20CFCD1C0();
  return swift_task_switch();
}

uint64_t sub_20CFC7A8C()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void (*v10)(_QWORD);
  void (**v11)(_QWORD);
  void (*v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void (**v17)(uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  swift_release();
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v2 = Strong;
    v3 = (_QWORD *)(v0 + 40);
    v4 = sub_20CFCCEF0();
    v5 = sub_20CFCCEF0();
    sub_20CFC8BB0(v5);
    swift_retain();
    v6 = sub_20CFC9004(MEMORY[0x24BEE4AF8], MEMORY[0x24BEE4AF8], v4, v2);
    v8 = v7;
    swift_release();
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    *(_QWORD *)(v0 + 40) = v6;
    swift_retain();
    sub_20CFCC674();
    v9 = (void (**)(_QWORD))(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTipsUpdated);
    swift_beginAccess();
    v10 = *v9;
    if (*v9)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_20CFCC668();
      swift_release();
      swift_release();
      v10(*v3);
      sub_20CF88FE0((uint64_t)v10);
      swift_bridgeObjectRelease();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    *v3 = v8;
    swift_retain();
    sub_20CFCC674();
    v11 = (void (**)(_QWORD))(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultsTopicsUpdated);
    swift_beginAccess();
    v12 = *v11;
    if (*v11)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_20CFCC668();
      swift_release();
      swift_release();
      v12(*(_QWORD *)(v0 + 88));
      sub_20CF88FE0((uint64_t)v12);
      swift_bridgeObjectRelease();
    }
    v13 = *(void **)(v0 + 136);
    v14 = *(void **)(v0 + 120);
    v15 = *(void **)(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_currentSearchQuery);
    *(_QWORD *)(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_currentSearchQuery) = v13;
    v16 = v13;

    sub_20CFCA214(v14, (uint64_t)v16);
    v17 = (void (**)(uint64_t))(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQueryCompleted);
    swift_beginAccess();
    v18 = *v17;
    if (*v17)
    {
      v19 = swift_retain();
      v18(v19);
      sub_20CF88FE0((uint64_t)v18);
    }
    swift_release();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20CFC7D9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_20CFCD214();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_20CFCD208();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_20CF8658C(a1, &qword_25499DD80);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_20CFCD1C0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_20CFC7EE8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t (**v12)(uint64_t);
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  void *v15;
  unint64_t v16;
  id v17;
  objc_class *v18;
  uint64_t v19;
  char v20;
  id v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;

  v5 = sub_20CFCCE90();
  if (!v6)
    return;
  v7 = v5;
  v8 = v6;
  sub_20CF82934(0, (unint64_t *)&qword_253EC6B50);
  if (v7 != sub_20CFCD2C8() || v8 != v9)
  {
    v11 = sub_20CFCD430();
    swift_bridgeObjectRelease();
    if ((v11 & 1) != 0)
      goto LABEL_9;
    v18 = (objc_class *)sub_20CFCCFBC();
    if (v7 == sub_20CFCCF8C() && v8 == v19)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v20 = sub_20CFCD430();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0)
        return;
    }
    sub_20CFCCEA8();
    sub_20CFCCE9C();
    v21 = objc_allocWithZone(v18);
    v22 = (void *)sub_20CFCCF80();
    sub_20CFCCECC();
    sub_20CFCCFA4();
    sub_20CFCCEC0();
    sub_20CFCCF98();
    v24 = a1[1];
    ++a1;
    v23 = v24;
    if (v24 >> 62)
    {
      swift_bridgeObjectRetain();
      v27 = sub_20CFCD3D0();
      swift_bridgeObjectRelease();
      if (v27 <= 49)
        goto LABEL_20;
    }
    else if (*(uint64_t *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10) <= 49)
    {
LABEL_20:
      v17 = v22;
      goto LABEL_21;
    }

    return;
  }
  swift_bridgeObjectRelease();
LABEL_9:
  swift_bridgeObjectRelease();
  v12 = (uint64_t (**)(uint64_t))(a3 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultEligibilityFilter);
  swift_beginAccess();
  v13 = *v12;
  if (!*v12)
    return;
  swift_retain();
  v14 = sub_20CFCCE9C();
  v15 = (void *)v13(v14);
  swift_bridgeObjectRelease();
  sub_20CF88FE0((uint64_t)v13);
  if (!v15)
    return;
  v16 = a1[1];
  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    v26 = sub_20CFCD3D0();
    swift_bridgeObjectRelease();
    if (v26 <= 49)
      goto LABEL_13;
LABEL_25:

    return;
  }
  if (*(uint64_t *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10) > 49)
    goto LABEL_25;
LABEL_13:
  v17 = v15;
LABEL_21:
  v25 = v17;
  MEMORY[0x212B9A118]();
  if (*(_QWORD *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_20CFCD1A8();
  sub_20CFCD1B4();
  sub_20CFCD19C();

}

void sub_20CFC81FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  unint64_t v33;

  v9 = sub_20CFCCEF0();
  v10 = v9 >> 62;
  if (v9 >> 62)
    goto LABEL_27;
  if (*(uint64_t *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) >= 10)
    v11 = 10;
  else
    v11 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if ((v9 & 0xC000000000000001) != 0 && v11)
    {
      sub_20CFCCEE4();
      v12 = 0;
      do
      {
        v13 = v12 + 1;
        sub_20CFCD394();
        v12 = v13;
      }
      while (v11 != v13);
    }
    if (v10)
    {
      swift_bridgeObjectRetain();
      sub_20CFCD3DC();
      v10 = v15;
      v14 = v16;
      v18 = v17;
      swift_bridgeObjectRelease_n();
      v11 = v18 >> 1;
    }
    else
    {
      v14 = 0;
      v10 = (v9 & 0xFFFFFFFFFFFFFF8) + 32;
    }
    v9 = MEMORY[0x24BEE4AF8];
    v33 = MEMORY[0x24BEE4AF8];
    if (v14 == v11)
      break;
    swift_unknownObjectRetain();
    v9 = 0;
    while (v14 < v11)
    {
      v32 = *(id *)(v10 + 8 * v14);
      v4 = v32;
      sub_20CFC86A0(&v33, (uint64_t)&v32, a2, a3, a1, (unint64_t)a4);

      if (v11 == ++v14)
      {
        swift_unknownObjectRelease();
        v9 = v33;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    v26 = sub_20CFCD3D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v27 = sub_20CFCD3D0();
    swift_bridgeObjectRelease();
    if (v27 < 0)
    {
      __break(1u);
      a4 = (void *)v33;
      swift_unknownObjectRelease();

      swift_bridgeObjectRelease();
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= 10)
      v28 = 10;
    else
      v28 = v26;
    if (v26 >= 0)
      v11 = v28;
    else
      v11 = 10;
    swift_bridgeObjectRetain();
    v29 = sub_20CFCD3D0();
    swift_bridgeObjectRelease();
    if (v29 < v11)
    {
      __break(1u);
      goto LABEL_36;
    }
  }
LABEL_17:
  v33 = v9;
  swift_unknownObjectRelease();
  if (!(v9 >> 62))
  {
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_23;
    goto LABEL_19;
  }
LABEL_36:
  swift_bridgeObjectRetain();
  v30 = sub_20CFCD3D0();
  swift_bridgeObjectRelease();
  if (v30)
    goto LABEL_23;
LABEL_19:
  v19 = (void *)sub_20CFCD0F4();
  v20 = (void *)sub_20CFCCEFC();
  sub_20CFCCE78();

  v21 = (void *)sub_20CFCD0F4();
  swift_bridgeObjectRelease();
  if ((unint64_t)a4 >= 3)
  {
LABEL_40:
    v32 = a4;
    sub_20CFCD454();
    __break(1u);
    return;
  }
  sub_20CFCD118();
  v22 = (void *)objc_opt_self();
  v23 = (void *)sub_20CFCD0F4();
  swift_bridgeObjectRelease();
  v24 = objc_msgSend(v22, sel_eventWithSearchID_searchTerm_invocationMethod_, v19, v21, v23);

  MEMORY[0x212B9A118]();
  if (*(_QWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_20CFCD1A8();
  sub_20CFCD1B4();
  sub_20CFCD19C();
  v9 = v33;
LABEL_23:
  v25 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v9 >> 62)
  {
    sub_20CF82934(0, &qword_25499EBA8);
    swift_bridgeObjectRetain();
    sub_20CFCD3C4();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_20CFCD43C();
    sub_20CF82934(0, &qword_25499EBA8);
  }
  swift_bridgeObjectRelease();
  sub_20CF82934(0, &qword_25499EBA8);
  v31 = (id)sub_20CFCD184();
  swift_bridgeObjectRelease();
  objc_msgSend(v25, sel_logAnalyticsEvents_, v31);

}

void sub_20CFC86A0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v8 = (void *)sub_20CFCD0F4();
  v9 = (void *)sub_20CFCCEFC();
  sub_20CFCCE78();

  v10 = (void *)sub_20CFCD0F4();
  swift_bridgeObjectRelease();
  if (a6 < 3)
  {
    sub_20CFCD118();
    v11 = (void *)objc_opt_self();
    v12 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    v13 = objc_msgSend(v11, sel_eventWithSearchID_searchTerm_invocationMethod_, v8, v10, v12);

    sub_20CFCCE9C();
    v14 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_setTipID_, v14);

    sub_20CFCCEB4();
    if (v15)
    {
      v16 = (void *)sub_20CFCD0F4();
      swift_bridgeObjectRelease();
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v13, sel_setCorrelationID_, v16);

    sub_20CFCCEA8();
    v17 = (void *)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_setCollectionID_, v17);

    sub_20CFCCED8();
    objc_msgSend(v13, sel_setRelevance_);
    if (*a1 >> 62)
    {
      swift_bridgeObjectRetain();
      v18 = (id)sub_20CFCD3D0();
      swift_bridgeObjectRelease();
      if (!__OFADD__(v18, 1))
      {
LABEL_7:
        objc_msgSend(v13, sel_setResultOrder_);
        v18 = v13;
        MEMORY[0x212B9A118]();
        if (*(_QWORD *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        {
LABEL_8:
          sub_20CFCD1B4();
          sub_20CFCD19C();

          return;
        }
LABEL_12:
        sub_20CFCD1A8();
        goto LABEL_8;
      }
    }
    else
    {
      v18 = *(id *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!__OFADD__(v18, 1))
        goto LABEL_7;
    }
    __break(1u);
    goto LABEL_12;
  }
  sub_20CFCD454();
  __break(1u);
}

void sub_20CFC894C(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v4 = sub_20CFCD04C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (void *)sub_20CFCD0F4();
  v9 = a1 + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
  sub_20CFCD034();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v10 = (void *)sub_20CFCD0F4();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(a2, sel_identifier);
  if (!v11)
  {
    sub_20CFCD118();
    v11 = (id)sub_20CFCD0F4();
    swift_bridgeObjectRelease();
  }
  v12 = objc_msgSend(a2, sel_collectionIdentifiers);
  if (v12)
  {
    v13 = v12;
    v14 = sub_20CFCD190();

    if (*(_QWORD *)(v14 + 16))
      swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v15 = (void *)objc_opt_self();
  v16 = (void *)sub_20CFCD0F4();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(a2, sel_correlationID);
  v18 = objc_msgSend(v15, sel_eventWithSearchID_searchTerm_tipID_collectionID_correlationID_, v8, v10, v11, v16, v17);

  v19 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  objc_msgSend(v19, sel_logAnalyticsEvent_, v18);

}

uint64_t sub_20CFC8BB0(unint64_t a1)
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
    v3 = sub_20CFCD3D0();
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
    v5 = sub_20CFCD3D0();
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
    v4 = MEMORY[0x212B9A34C](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_20CFC8E5C(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_20CFCD3D0();
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
    return sub_20CFCD19C();
  }
  __break(1u);
  return result;
}

void (*sub_20CFC8D68(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_20CFC8DE8(v6, a2, a3);
  return sub_20CFC8DBC;
}

void sub_20CFC8DBC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_20CFC8DE8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x212B9A340](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return _s5ValueOwxx;
  }
  __break(1u);
  return result;
}

void _s5ValueOwxx(id *a1)
{

}

uint64_t sub_20CFC8E5C(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  id *v11;
  id v12;
  void (*v13[4])(id *);

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_20CFCD3D0();
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
      v8 = sub_20CFCD3D0();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_20CF88608(&qword_25499EBB8, &qword_25499EBB0, MEMORY[0x24BEE12E0]);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_25499EBB0);
            v10 = sub_20CFC8D68(v13, i, a3);
            v12 = *v11;
            ((void (*)(void (**)(id *), _QWORD))v10)(v13, 0);
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
        sub_20CFCCEE4();
        swift_arrayInitWithCopy();
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

void *sub_20CFC9004(void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  id v13;
  _QWORD v14[2];

  v7 = a1;
  v14[0] = a1;
  v14[1] = a2;
  if (a3 >> 62)
    goto LABEL_13;
  v8 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v8; v8 = sub_20CFCD3D0())
  {
    for (i = 4; ; ++i)
    {
      v10 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x212B9A340](i - 4, a3) : *(id *)(a3 + 8 * i);
      v7 = v10;
      v11 = i - 3;
      if (__OFADD__(i - 4, 1))
        break;
      v13 = v10;
      sub_20CFC7EE8(v14, (uint64_t)&v13, a4);
      if (v4)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        return v7;
      }

      if (v11 == v8)
      {
        swift_bridgeObjectRelease();
        return (void *)v14[0];
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return v7;
}

void *sub_20CFC9144(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  char v20;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v4 = v3;
  v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    v8 = sub_20CFCD3D0();
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      v22 = v4;
      v23 = v7;
      v24 = v7 & 0xC000000000000001;
      v4 = 4;
      do
      {
        v9 = v4 - 4;
        if (v24)
        {
          v10 = (id)MEMORY[0x212B9A340](v4 - 4, v7);
          v11 = v4 - 3;
          if (__OFADD__(v9, 1))
            goto LABEL_19;
        }
        else
        {
          v10 = *(id *)(v7 + 8 * v4);
          v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        v12 = v8;
        v13 = v10;
        v14 = a3;
        v15 = objc_msgSend(v10, sel_identifier, v22);
        v16 = sub_20CFCD118();
        v18 = v17;

        a3 = v14;
        v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        v20 = sub_20CFCD430();
        swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          goto LABEL_18;

        ++v4;
        v8 = v12;
        v19 = v11 == v12;
        v7 = v23;
      }
      while (!v19);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_20CFC92E8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 >> 62)
    goto LABEL_17;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_20CFCD3D0())
  {
    v6 = 4;
    while (1)
    {
      v8 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x212B9A340](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      v9 = v8;
      v10 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
        break;
      v11 = sub_20CFCCFB0();
      if (v12)
      {
        if (v11 == a2 && v12 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_15:
          swift_bridgeObjectRelease();
          return v9;
        }
        v7 = sub_20CFCD430();
        swift_bridgeObjectRelease();
        if ((v7 & 1) != 0)
          goto LABEL_15;
      }

      ++v6;
      if (v10 == v5)
        goto LABEL_18;
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_20CFC9450(void *a1)
{
  uint64_t v1;
  id *v3;
  id v4;
  id v5;
  id v6;

  v3 = (id *)(v1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuery);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  v6 = *v3;
  swift_retain();
  sub_20CFCC608();
  return swift_release();
}

uint64_t sub_20CFC94DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchResultSelected);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  sub_20CF8A8F4(a1);
  sub_20CF88FE0(v6);
  v7 = swift_allocObject();
  swift_weakInit();
  v8 = (uint64_t *)(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_actionHandler);
  swift_beginAccess();
  v9 = *v8;
  *v8 = (uint64_t)sub_20CFC9628;
  v8[1] = v7;
  sub_20CF88FE0(v9);
  v10 = swift_allocObject();
  swift_weakInit();
  v11 = (uint64_t *)(v2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_topicActionHandler);
  swift_beginAccess();
  v12 = *v11;
  *v11 = (uint64_t)sub_20CFC9630;
  v11[1] = v10;
  return sub_20CF88FE0(v12);
}

uint64_t sub_20CFC9604()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_20CFC9628(void *a1)
{
  sub_20CFC5548(a1);
}

void sub_20CFC9630(void *a1)
{
  sub_20CFC58B8(a1);
}

uint64_t sub_20CFC9638()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20CFC966C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_20CF95E24;
  return sub_20CFC758C(a1, v4, v5, v7, v6);
}

unint64_t sub_20CFC96E8()
{
  unint64_t result;

  result = qword_25499EB80;
  if (!qword_25499EB80)
  {
    result = MEMORY[0x212B9AA54](&protocol conformance descriptor for SearchResult.Item.Category, &type metadata for SearchResult.Item.Category);
    atomic_store(result, (unint64_t *)&qword_25499EB80);
  }
  return result;
}

uint64_t sub_20CFC972C()
{
  return MEMORY[0x24BEE0948];
}

uint64_t sub_20CFC9738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CF99468(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC6TipsUI18SearchResultsModel__tips, &qword_253EC68A0);
}

uint64_t sub_20CFC975C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CF994D4(a1, a2, a3, a4, &qword_253EC5E58, (uint64_t)&OBJC_IVAR____TtC6TipsUI18SearchResultsModel__tips, &qword_253EC68A0);
}

uint64_t sub_20CFC9788(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CF99468(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC6TipsUI18SearchResultsModel__topics, &qword_253EC5E60);
}

uint64_t sub_20CFC97AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CF994D4(a1, a2, a3, a4, &qword_253EC5E48, (uint64_t)&OBJC_IVAR____TtC6TipsUI18SearchResultsModel__topics, &qword_253EC5E60);
}

id sub_20CFC97E0@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_searchQuery);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

void sub_20CFC9830(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_20CFC9450(v1);

}

uint64_t sub_20CFC98C4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_queryCount);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_20CFC9914(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC6TipsUI18SearchResultsModel_queryCount);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t _s5ValueOwCP(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v5 = v3;
  return a1;
}

uint64_t _s5ValueOwca(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v6 = v3;

  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t _s5ValueOwta(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;

  return a1;
}

uint64_t _s5ValueOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s5ValueOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_20CFC9AA8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_20CFC9AB0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SearchResult.Item.Value()
{
  return &type metadata for SearchResult.Item.Value;
}

uint64_t _s8CategoryOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20CFC9B18 + 4 * byte_20CFD1355[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_20CFC9B4C + 4 * byte_20CFD1350[v4]))();
}

uint64_t sub_20CFC9B4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CFC9B54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20CFC9B5CLL);
  return result;
}

uint64_t sub_20CFC9B68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20CFC9B70);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_20CFC9B74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20CFC9B7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SearchResult.Item.Category()
{
  return &type metadata for SearchResult.Item.Category;
}

uint64_t sub_20CFC9B98()
{
  return type metadata accessor for SearchResultsModel();
}

uint64_t type metadata accessor for SearchResultsModel()
{
  uint64_t result;

  result = qword_253EC5C68;
  if (!qword_253EC5C68)
    return swift_getSingletonMetadata();
  return result;
}

void sub_20CFC9BDC()
{
  unint64_t v0;
  unint64_t v1;

  sub_20CF83054(319, &qword_253EC68A8, &qword_253EC6948);
  if (v0 <= 0x3F)
  {
    sub_20CF83054(319, &qword_253EC5E68, &qword_253EC5F08);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for SearchResultsModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SearchResultsModel.tips.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of SearchResultsModel.tips.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of SearchResultsModel.tips.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of SearchResultsModel.$tips.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of SearchResultsModel.$tips.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of SearchResultsModel.$tips.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of SearchResultsModel.topics.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of SearchResultsModel.topics.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of SearchResultsModel.topics.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of SearchResultsModel.$topics.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of SearchResultsModel.$topics.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of SearchResultsModel.$topics.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of SearchResultsModel.actionHandler.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of SearchResultsModel.actionHandler.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of SearchResultsModel.actionHandler.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of SearchResultsModel.searchQuery.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of SearchResultsModel.searchQuery.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of SearchResultsModel.searchQuery.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of SearchResultsModel.searchTerm.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of SearchResultsModel.hasTips.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of SearchResultsModel.hasTopics.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of SearchResultsModel.hasSearchResults.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of SearchResultsModel.hasStartedSearch.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of SearchResultsModel.shouldShowEmptyStateView.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of SearchResultsModel.topicActionHandler.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of SearchResultsModel.topicActionHandler.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of SearchResultsModel.topicActionHandler.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t dispatch thunk of SearchResultsModel.searchQueryCompleted.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 456))();
}

uint64_t dispatch thunk of SearchResultsModel.searchQueryCompleted.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 464))();
}

uint64_t dispatch thunk of SearchResultsModel.searchQueryCompleted.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 472))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultCollectionResolver.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 480))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultCollectionResolver.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 488))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultCollectionResolver.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 496))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultUserGuideResolver.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 504))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultUserGuideResolver.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 512))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultUserGuideResolver.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 520))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultEligibilityFilter.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 528))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultEligibilityFilter.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 536))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultEligibilityFilter.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 544))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultScrollHandler.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 552))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultScrollHandler.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 560))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultScrollHandler.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 568))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsUpdated.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 576))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsUpdated.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 584))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsUpdated.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 592))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsTipsUpdated.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 600))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsTipsUpdated.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 608))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsTipsUpdated.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 616))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsTopicsUpdated.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 624))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsTopicsUpdated.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 632))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsTopicsUpdated.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 640))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsSeeAllHandler.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 648))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsSeeAllHandler.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 656))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultsSeeAllHandler.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 664))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultSelected.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 672))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultSelected.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 680))();
}

uint64_t dispatch thunk of SearchResultsModel.searchResultSelected.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 688))();
}

uint64_t dispatch thunk of SearchResultsModel.queryCount.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 792))();
}

uint64_t dispatch thunk of SearchResultsModel.queryCount.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 800))();
}

uint64_t dispatch thunk of SearchResultsModel.queryCount.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 808))();
}

uint64_t dispatch thunk of SearchResultsModel.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 816))();
}

uint64_t dispatch thunk of SearchResultsModel.reset()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 824))();
}

uint64_t dispatch thunk of SearchResultsModel.tipForIdentifier(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 840))();
}

uint64_t dispatch thunk of SearchResultsModel.userGuideForIdentifier(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 848))();
}

uint64_t dispatch thunk of SearchResultsModel.updateSelection(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 856))();
}

uint64_t sub_20CFC9FEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_20CFCA024(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t *__return_ptr, _QWORD *);
  uint64_t v5;
  _QWORD v6[2];

  v3 = *(void (**)(uint64_t *__return_ptr, _QWORD *))(v2 + 16);
  v6[0] = a1;
  v6[1] = a2;
  v3(&v5, v6);
  return v5;
}

uint64_t sub_20CFCA05C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20CFCA080@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, a1[1]);
  *a2 = result;
  return result;
}

uint64_t sub_20CFCA0B0(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_20CFCA0D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20CF95E24;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25499EB88 + dword_25499EB88))(a1, v4);
}

uint64_t sub_20CFCA144()
{
  id *v0;

  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_20CFCA188(uint64_t a1)
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
  v10[1] = sub_20CF96A5C;
  return sub_20CFC7A1C(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_20CFCA214(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[6];

  v25 = a1;
  v3 = sub_20CFCCDAC();
  v28 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_20CFCCDD0();
  v26 = *(_QWORD *)(v6 - 8);
  v27 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_20CFCCDB8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(a2 + OBJC_IVAR___TPSAppSearchQuery_identifier + 8);
  v24 = *(_QWORD *)(a2 + OBJC_IVAR___TPSAppSearchQuery_identifier);
  v14 = (uint64_t *)(a2 + OBJC_IVAR___TPSAppSearchQuery_origin);
  swift_beginAccess();
  v15 = *v14;
  sub_20CF82934(0, (unint64_t *)&qword_253EC6960);
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BEE5470], v9);
  swift_bridgeObjectRetain();
  v16 = (void *)sub_20CFCD298();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v17 = (_QWORD *)swift_allocObject();
  v18 = v24;
  v19 = v25;
  v17[2] = v25;
  v17[3] = v18;
  v17[4] = v13;
  v17[5] = v15;
  aBlock[4] = sub_20CFCA4F0;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20CF8B674;
  aBlock[3] = &block_descriptor_7;
  v20 = _Block_copy(aBlock);
  v21 = v19;
  sub_20CFCCDC4();
  v29 = MEMORY[0x24BEE4AF8];
  sub_20CFBD624();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6928);
  sub_20CF88608((unint64_t *)&qword_253EC6930, &qword_253EC6928, MEMORY[0x24BEE12C8]);
  sub_20CFCD34C();
  MEMORY[0x212B9A220](0, v8, v5, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v27);
  return swift_release();
}

uint64_t sub_20CFCA4C4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_20CFCA4F0()
{
  uint64_t v0;

  sub_20CFC81FC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40));
}

id sub_20CFCA4FC@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_20CFC6BA4(a1, a2);
}

uint64_t sub_20CFCA504(void **a1)
{
  return sub_20CFC6CF4(a1);
}

uint64_t sub_20CFCA50C()
{
  return sub_20CFC7004();
}

uint64_t sub_20CFCA514()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_20CFCA540()
{
  uint64_t v0;

  sub_20CFC894C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t View.readScrollOffset(onChange:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];

  v13 = a1;
  v15 = a4;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC6AD8);
  v6 = sub_20CFCC80C();
  v14 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - v7;
  v16[2] = sub_20CFCA788;
  v16[3] = 0;
  sub_20CFCCD4C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EC6AB0);
  sub_20CF88608(&qword_253EC6AA8, &qword_253EC6AB0, MEMORY[0x24BDEC6F8]);
  sub_20CFCCB3C();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v13;
  *(_QWORD *)(v9 + 24) = a2;
  v10 = sub_20CF88608(&qword_253EC6AD0, &qword_253EC6AD8, MEMORY[0x24BDEF370]);
  v16[0] = a3;
  v16[1] = v10;
  swift_retain();
  MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v6, v16);
  sub_20CFCA898();
  sub_20CFCA8DC();
  sub_20CFCCB78();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v8, v6);
}

uint64_t sub_20CFCA788@<X0>(uint64_t *a1@<X8>)
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
  uint64_t result;
  _QWORD v12[2];

  v2 = sub_20CFCC9D4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_20CFCCBF0();
  v12[0] = 0x69566C6C6F726353;
  v12[1] = 0xEA00000000007765;
  sub_20CFCCA10();
  sub_20CFCC788();
  v8 = v7;
  v10 = v9;
  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *a1 = v6;
  a1[1] = v8;
  a1[2] = v10;
  return result;
}

uint64_t sub_20CFCA874()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_20CFCA898()
{
  unint64_t result;

  result = qword_253EC6A30;
  if (!qword_253EC6A30)
  {
    result = MEMORY[0x212B9AA54](&unk_20CFD157C, &type metadata for ScrollOffsetPreferenceKey);
    atomic_store(result, (unint64_t *)&qword_253EC6A30);
  }
  return result;
}

unint64_t sub_20CFCA8DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253EC6B60;
  if (!qword_253EC6B60)
  {
    type metadata accessor for CGPoint(255);
    result = MEMORY[0x212B9AA54](MEMORY[0x24BDBD880], v1);
    atomic_store(result, (unint64_t *)&qword_253EC6B60);
  }
  return result;
}

uint64_t sub_20CFCA924(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EC6AD8);
  v2 = sub_20CFCC80C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25499EBD0);
  v3 = sub_20CFCC80C();
  v7[0] = v1;
  v7[1] = sub_20CF88608(&qword_253EC6AD0, &qword_253EC6AD8, MEMORY[0x24BDEF370]);
  v4 = MEMORY[0x24BDED308];
  v6[0] = MEMORY[0x212B9AA54](MEMORY[0x24BDED308], v2, v7);
  v6[1] = sub_20CF88608(&qword_25499EBD8, &qword_25499EBD0, MEMORY[0x24BDF09B0]);
  return MEMORY[0x212B9AA54](v4, v3, v6);
}

ValueMetadata *type metadata accessor for ScrollOffsetPreferenceKey()
{
  return &type metadata for ScrollOffsetPreferenceKey;
}

void sub_20CFCAA14()
{
  xmmword_25499EBC0 = 0uLL;
}

double sub_20CFCAA24@<D0>(_OWORD *a1@<X8>)
{
  double result;

  if (qword_25499DC40 != -1)
    swift_once();
  result = *(double *)&xmmword_25499EBC0;
  *a1 = xmmword_25499EBC0;
  return result;
}

uint64_t sub_20CFCAAF4()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20CFCABD4()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_20CFCC674();
}

uint64_t sub_20CFCAC3C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_20CFCACBC(void **a1, void **a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = v2;
  v5 = v3;
  return sub_20CFCC674();
}

uint64_t (*sub_20CFCAD30(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20CFCC65C();
  return sub_20CF98E28;
}

uint64_t sub_20CFCADA8()
{
  return sub_20CF83BB4((uint64_t)&OBJC_IVAR___TipNavigationViewModel__currentTip, &qword_253EC68C0);
}

uint64_t sub_20CFCADBC(uint64_t a1)
{
  return sub_20CF9961C(a1, &qword_25499EBE0, (uint64_t)&OBJC_IVAR___TipNavigationViewModel__currentTip, &qword_253EC68C0);
}

uint64_t (*sub_20CFCADD8(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25499EBE0);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR___TipNavigationViewModel__currentTip;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68C0);
  sub_20CFCC644();
  swift_endAccess();
  return sub_20CF98F10;
}

uint64_t sub_20CFCAF40()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20CFCB034@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_20CFCB0B4(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v3 = v2;
  return sub_20CFCC674();
}

uint64_t (*sub_20CFCB12C(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20CFCC65C();
  return sub_20CF98E28;
}

uint64_t sub_20CFCB1A4(uint64_t a1)
{
  return sub_20CF9961C(a1, &qword_253EC5E58, (uint64_t)&OBJC_IVAR___TipNavigationViewModel__tips, &qword_253EC68A0);
}

uint64_t (*sub_20CFCB1C0(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC5E58);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR___TipNavigationViewModel__tips;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_253EC68A0);
  sub_20CFCC644();
  swift_endAccess();
  return sub_20CF98F10;
}

uint64_t sub_20CFCB2B8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  void *v5;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  if (!v5)
    return 0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  sub_20CFCB3A4((uint64_t)v5, (unint64_t)v5);
  v1 = v0;
  v3 = v2;
  swift_bridgeObjectRelease();

  if ((v3 & 1) != 0)
    return 0;
  else
    return v1;
}

void sub_20CFCB3A4(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  char v6;
  uint64_t i;
  id v8;
  void *v9;
  char v10;
  unint64_t v11;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        v4 = (id)MEMORY[0x212B9A340](0, a2);
      }
      else
      {
        if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        v4 = *(id *)(a2 + 32);
      }
      v5 = v4;
      sub_20CFBB55C();
      v6 = sub_20CFCD2F8();

      if ((v6 & 1) == 0)
      {
        for (i = 0; ; ++i)
        {
          v11 = i + 1;
          if (__OFADD__(i, 1))
            break;
          if (v11 == v3)
            return;
          if ((a2 & 0xC000000000000001) != 0)
          {
            v8 = (id)MEMORY[0x212B9A340](i + 1, a2);
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0)
              goto LABEL_18;
            if (v11 >= *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_19;
            v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          v9 = v8;
          v10 = sub_20CFCD2F8();

          if ((v10 & 1) != 0)
            return;
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        v3 = sub_20CFCD3D0();
        swift_bridgeObjectRelease();
        if (v3)
          continue;
      }
      return;
    }
  }
}

BOOL sub_20CFCB55C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  void *v6;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  if (!v6)
    return 0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  sub_20CFCB3A4((uint64_t)v6, (unint64_t)v6);
  v1 = v0;
  v3 = v2;
  swift_bridgeObjectRelease();

  return (v3 & 1) == 0 && v1 > 0;
}

uint64_t sub_20CFCB728()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  unint64_t v3;

  v0 = sub_20CFCB2B8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v1 = sub_20CFCD3D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v1 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  result = swift_bridgeObjectRelease();
  if (!__OFSUB__(v1, 1))
    return v0 < v1 - 1;
  __break(1u);
  return result;
}

void sub_20CFCB7F8()
{
  uint64_t v0;
  BOOL v1;
  uint64_t v2;

  v0 = sub_20CFCB2B8();
  v1 = __OFSUB__(v0, 1);
  v2 = v0 - 1;
  if (v1)
    __break(1u);
  else
    sub_20CFCB8C8(v2);
}

void sub_20CFCB860()
{
  uint64_t v0;
  BOOL v1;
  uint64_t v2;

  v0 = sub_20CFCB2B8();
  v1 = __OFADD__(v0, 1);
  v2 = v0 + 1;
  if (v1)
    __break(1u);
  else
    sub_20CFCB8C8(v2);
}

void sub_20CFCB8C8(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_20CFCD3D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if ((a1 & 0x8000000000000000) == 0 && v3 > a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_20CFCC668();
    swift_release();
    swift_release();
    if ((v7 & 0xC000000000000001) != 0)
    {
      v4 = (id)MEMORY[0x212B9A340](a1);
    }
    else
    {
      if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10) <= (unint64_t)a1)
      {
        __break(1u);
        return;
      }
      v4 = *(id *)(v7 + 8 * a1 + 32);
    }
    v5 = v4;
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    v6 = v1;
    sub_20CFCC674();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_20CFCC668();
    swift_release();
    swift_release();
    if (v5)
    {
      (*(void (**)(void *))((*MEMORY[0x24BEE4EA0] & *v6) + 0xF8))(v5);

    }
  }
}

void sub_20CFCBB10(void *a1, char a2)
{
  void *v2;
  void *v3;
  id v5;
  id v6;
  char v7;
  id v8;
  _QWORD *v9;
  void *v10;

  v3 = v2;
  if ((a2 & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_20CFCC668();
    swift_release();
    swift_release();
    if (v10)
    {
      if (a1)
      {
        sub_20CFBB55C();
        v5 = a1;
        v6 = v10;
        v7 = sub_20CFCD2F8();

        if ((v7 & 1) != 0)
          return;
      }
      else
      {

      }
    }
    else if (!a1)
    {
      return;
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v8 = a1;
  v9 = v3;
  sub_20CFCC674();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20CFCC668();
  swift_release();
  swift_release();
  if (a1)
  {
    (*(void (**)(void *))((*MEMORY[0x24BEE4EA0] & *v9) + 0xF8))(a1);

  }
}

id TipNavigationViewModel.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id TipNavigationViewModel.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipNavigationViewModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_20CFCBD54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for TipNavigationViewModel();
  result = sub_20CFCC5F0();
  *a1 = result;
  return result;
}

uint64_t sub_20CFCBD90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CF99468(a1, a2, a3, (uint64_t)&OBJC_IVAR___TipNavigationViewModel__currentTip, &qword_253EC68C0);
}

uint64_t sub_20CFCBDB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CF994D4(a1, a2, a3, a4, &qword_25499EBE0, (uint64_t)&OBJC_IVAR___TipNavigationViewModel__currentTip, &qword_253EC68C0);
}

uint64_t sub_20CFCBDE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20CF99468(a1, a2, a3, (uint64_t)&OBJC_IVAR___TipNavigationViewModel__tips, &qword_253EC68A0);
}

uint64_t sub_20CFCBE04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20CF994D4(a1, a2, a3, a4, &qword_253EC5E58, (uint64_t)&OBJC_IVAR___TipNavigationViewModel__tips, &qword_253EC68A0);
}

uint64_t sub_20CFCBE30()
{
  return type metadata accessor for TipNavigationViewModel();
}

uint64_t method lookup function for TipNavigationViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TipNavigationViewModel.currentTip.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of TipNavigationViewModel.currentTip.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of TipNavigationViewModel.currentTip.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of TipNavigationViewModel.$currentTip.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of TipNavigationViewModel.$currentTip.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of TipNavigationViewModel.$currentTip.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of TipNavigationViewModel.tips.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of TipNavigationViewModel.tips.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of TipNavigationViewModel.$tips.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of TipNavigationViewModel.$tips.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of TipNavigationViewModel.currentTipIndex.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of TipNavigationViewModel.canGoBack.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of TipNavigationViewModel.canGoNext.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of TipNavigationViewModel.goBack()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of TipNavigationViewModel.goNext()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of TipNavigationViewModel.selectTip(atIndex:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of TipNavigationViewModel.updateSelectedTip(_:forceUpdate:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of TipNavigationViewModel.selectedTipDidChange(toTip:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

id static UIColor.widgetBackgroundColor.getter()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)sub_20CFCD0F4();
  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_colorNamed_, v0);

  if (v2)
    return v2;
  else
    return objc_msgSend(v1, sel_systemBackgroundColor);
}

uint64_t sub_20CFCC0D8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_20CFCC3E0()
{
  return MEMORY[0x24BDCAFC8]();
}

uint64_t sub_20CFCC3EC()
{
  return MEMORY[0x24BDCAFE0]();
}

uint64_t sub_20CFCC3F8()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_20CFCC404()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_20CFCC410()
{
  return MEMORY[0x24BDCD2C0]();
}

uint64_t sub_20CFCC41C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_20CFCC428()
{
  return MEMORY[0x24BDCD728]();
}

uint64_t sub_20CFCC434()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_20CFCC440()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_20CFCC44C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_20CFCC458()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_20CFCC464()
{
  return MEMORY[0x24BEB79F0]();
}

uint64_t sub_20CFCC470()
{
  return MEMORY[0x24BEB79F8]();
}

uint64_t sub_20CFCC47C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_20CFCC488()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_20CFCC494()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_20CFCC4A0()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_20CFCC4AC()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_20CFCC4B8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_20CFCC4C4()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_20CFCC4D0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_20CFCC4DC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_20CFCC4E8()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_20CFCC4F4()
{
  return MEMORY[0x24BDCEDD0]();
}

uint64_t sub_20CFCC500()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_20CFCC50C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_20CFCC518()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_20CFCC524()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_20CFCC530()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_20CFCC53C()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_20CFCC548()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_20CFCC554()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_20CFCC560()
{
  return MEMORY[0x24BDCF760]();
}

uint64_t sub_20CFCC56C()
{
  return MEMORY[0x24BDCF770]();
}

uint64_t sub_20CFCC578()
{
  return MEMORY[0x24BDCF788]();
}

uint64_t sub_20CFCC584()
{
  return MEMORY[0x24BDCF798]();
}

uint64_t sub_20CFCC590()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_20CFCC59C()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_20CFCC5A8()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_20CFCC5B4()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_20CFCC5C0()
{
  return MEMORY[0x24BEBC110]();
}

uint64_t sub_20CFCC5CC()
{
  return MEMORY[0x24BEBC210]();
}

uint64_t sub_20CFCC5D8()
{
  return MEMORY[0x24BDB94B0]();
}

uint64_t sub_20CFCC5E4()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_20CFCC5F0()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_20CFCC5FC()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_20CFCC608()
{
  return MEMORY[0x24BDB9CD8]();
}

uint64_t sub_20CFCC614()
{
  return MEMORY[0x24BDB9D00]();
}

uint64_t sub_20CFCC620()
{
  return MEMORY[0x24BDB9D68]();
}

uint64_t sub_20CFCC62C()
{
  return MEMORY[0x24BDB9E70]();
}

uint64_t sub_20CFCC638()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_20CFCC644()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_20CFCC650()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_20CFCC65C()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_20CFCC668()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_20CFCC674()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_20CFCC680()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_20CFCC68C()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_20CFCC698()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_20CFCC6A4()
{
  return MEMORY[0x24BDB9F38]();
}

uint64_t sub_20CFCC6B0()
{
  return MEMORY[0x24BDB9F68]();
}

uint64_t sub_20CFCC6BC()
{
  return MEMORY[0x24BDB9F80]();
}

uint64_t sub_20CFCC6C8()
{
  return MEMORY[0x24BDB9FC0]();
}

uint64_t sub_20CFCC6D4()
{
  return MEMORY[0x24BDBA0A0]();
}

uint64_t sub_20CFCC6E0()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_20CFCC6EC()
{
  return MEMORY[0x24BDBA120]();
}

uint64_t sub_20CFCC6F8()
{
  return MEMORY[0x24BDEAF58]();
}

uint64_t sub_20CFCC704()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_20CFCC710()
{
  return MEMORY[0x24BDEB1F0]();
}

uint64_t sub_20CFCC71C()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_20CFCC728()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_20CFCC734()
{
  return MEMORY[0x24BDEB450]();
}

uint64_t sub_20CFCC740()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_20CFCC74C()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_20CFCC758()
{
  return MEMORY[0x24BDEB9C0]();
}

uint64_t sub_20CFCC764()
{
  return MEMORY[0x24BDEBBC8]();
}

uint64_t sub_20CFCC770()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_20CFCC77C()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_20CFCC788()
{
  return MEMORY[0x24BDEC138]();
}

uint64_t sub_20CFCC794()
{
  return MEMORY[0x24BDEC348]();
}

uint64_t sub_20CFCC7A0()
{
  return MEMORY[0x24BDEC358]();
}

uint64_t sub_20CFCC7AC()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_20CFCC7B8()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_20CFCC7C4()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_20CFCC7D0()
{
  return MEMORY[0x24BDEC9A0]();
}

uint64_t sub_20CFCC7DC()
{
  return MEMORY[0x24BDEC9B0]();
}

uint64_t sub_20CFCC7E8()
{
  return MEMORY[0x24BDECD20]();
}

uint64_t sub_20CFCC7F4()
{
  return MEMORY[0x24BDED1E0]();
}

uint64_t sub_20CFCC800()
{
  return MEMORY[0x24BDED230]();
}

uint64_t sub_20CFCC80C()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_20CFCC818()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_20CFCC824()
{
  return MEMORY[0x24BDEDB60]();
}

uint64_t sub_20CFCC830()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_20CFCC83C()
{
  return MEMORY[0x24BDFBB28]();
}

uint64_t sub_20CFCC848()
{
  return MEMORY[0x24BDFBB30]();
}

uint64_t sub_20CFCC854()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_20CFCC860()
{
  return MEMORY[0x24BDEDE98]();
}

uint64_t sub_20CFCC86C()
{
  return MEMORY[0x24BDEDEC0]();
}

uint64_t sub_20CFCC878()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_20CFCC884()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_20CFCC890()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_20CFCC89C()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_20CFCC8A8()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_20CFCC8B4()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_20CFCC8C0()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_20CFCC8CC()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_20CFCC8D8()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_20CFCC8E4()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_20CFCC8F0()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_20CFCC8FC()
{
  return MEMORY[0x24BDEED50]();
}

uint64_t sub_20CFCC908()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_20CFCC914()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_20CFCC920()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_20CFCC92C()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_20CFCC938()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_20CFCC944()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_20CFCC950()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_20CFCC95C()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_20CFCC968()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_20CFCC974()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_20CFCC980()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_20CFCC98C()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_20CFCC998()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_20CFCC9A4()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_20CFCC9B0()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_20CFCC9BC()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_20CFCC9C8()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_20CFCC9D4()
{
  return MEMORY[0x24BDEF560]();
}

uint64_t sub_20CFCC9E0()
{
  return MEMORY[0x24BDEFBF0]();
}

uint64_t sub_20CFCC9EC()
{
  return MEMORY[0x24BDEFCA8]();
}

uint64_t sub_20CFCC9F8()
{
  return MEMORY[0x24BDEFCB8]();
}

uint64_t sub_20CFCCA04()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_20CFCCA10()
{
  return MEMORY[0x24BDF0150]();
}

uint64_t sub_20CFCCA1C()
{
  return MEMORY[0x24BDF0A10]();
}

uint64_t sub_20CFCCA28()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_20CFCCA34()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_20CFCCA40()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_20CFCCA4C()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_20CFCCA58()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_20CFCCA64()
{
  return MEMORY[0x24BDF1560]();
}

uint64_t sub_20CFCCA70()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_20CFCCA7C()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_20CFCCA88()
{
  return MEMORY[0x24BDF1600]();
}

uint64_t sub_20CFCCA94()
{
  return MEMORY[0x24BDF1790]();
}

uint64_t sub_20CFCCAA0()
{
  return MEMORY[0x24BDF17D8]();
}

uint64_t sub_20CFCCAAC()
{
  return MEMORY[0x24BDF1818]();
}

uint64_t sub_20CFCCAB8()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_20CFCCAC4()
{
  return MEMORY[0x24BDF1950]();
}

uint64_t sub_20CFCCAD0()
{
  return MEMORY[0x24BDF1C00]();
}

uint64_t sub_20CFCCADC()
{
  return MEMORY[0x24BDF1C18]();
}

uint64_t sub_20CFCCAE8()
{
  return MEMORY[0x24BDF1C20]();
}

uint64_t sub_20CFCCAF4()
{
  return MEMORY[0x24BDF1C28]();
}

uint64_t sub_20CFCCB00()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_20CFCCB0C()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_20CFCCB18()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_20CFCCB24()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_20CFCCB30()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_20CFCCB3C()
{
  return MEMORY[0x24BDF2100]();
}

uint64_t sub_20CFCCB48()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_20CFCCB54()
{
  return MEMORY[0x24BDF23D8]();
}

uint64_t sub_20CFCCB60()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_20CFCCB6C()
{
  return MEMORY[0x24BDF2A98]();
}

uint64_t sub_20CFCCB78()
{
  return MEMORY[0x24BDF2CD8]();
}

uint64_t sub_20CFCCB84()
{
  return MEMORY[0x24BDF2EB0]();
}

uint64_t sub_20CFCCB90()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_20CFCCB9C()
{
  return MEMORY[0x24BDF30D8]();
}

uint64_t sub_20CFCCBA8()
{
  return MEMORY[0x24BDF34C0]();
}

uint64_t sub_20CFCCBB4()
{
  return MEMORY[0x24BDF38C8]();
}

uint64_t sub_20CFCCBC0()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_20CFCCBCC()
{
  return MEMORY[0x24BDF3BF8]();
}

uint64_t sub_20CFCCBD8()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_20CFCCBE4()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_20CFCCBF0()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_20CFCCBFC()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_20CFCCC08()
{
  return MEMORY[0x24BDF3D60]();
}

uint64_t sub_20CFCCC14()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_20CFCCC20()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_20CFCCC2C()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_20CFCCC38()
{
  return MEMORY[0x24BDF3E78]();
}

uint64_t sub_20CFCCC44()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t _s7SwiftUI5ImageV04TipsB0E03tpsC0ACSo7UIImageC_tcfC_0()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_20CFCCC5C()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_20CFCCC68()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_20CFCCC74()
{
  return MEMORY[0x24BDF4048]();
}

uint64_t sub_20CFCCC80()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_20CFCCC8C()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_20CFCCC98()
{
  return MEMORY[0x24BDF4150]();
}

uint64_t sub_20CFCCCA4()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_20CFCCCB0()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_20CFCCCBC()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_20CFCCCC8()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_20CFCCCD4()
{
  return MEMORY[0x24BDF4470]();
}

uint64_t sub_20CFCCCE0()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_20CFCCCEC()
{
  return MEMORY[0x24BDF4728]();
}

uint64_t sub_20CFCCCF8()
{
  return MEMORY[0x24BDF4730]();
}

uint64_t sub_20CFCCD04()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_20CFCCD10()
{
  return MEMORY[0x24BDF4808]();
}

uint64_t sub_20CFCCD1C()
{
  return MEMORY[0x24BDF4CE0]();
}

uint64_t sub_20CFCCD28()
{
  return MEMORY[0x24BDF4D00]();
}

uint64_t sub_20CFCCD34()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_20CFCCD40()
{
  return MEMORY[0x24BDF4EC8]();
}

uint64_t sub_20CFCCD4C()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_20CFCCD58()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_20CFCCD64()
{
  return MEMORY[0x24BDF5118]();
}

uint64_t sub_20CFCCD70()
{
  return MEMORY[0x24BDF5448]();
}

uint64_t sub_20CFCCD7C()
{
  return MEMORY[0x24BDF5450]();
}

uint64_t sub_20CFCCD88()
{
  return MEMORY[0x24BDF5458]();
}

uint64_t sub_20CFCCD94()
{
  return MEMORY[0x24BDF5460]();
}

uint64_t sub_20CFCCDA0()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_20CFCCDAC()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_20CFCCDB8()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_20CFCCDC4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_20CFCCDD0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_20CFCCDDC()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_20CFCCDE8()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_20CFCCDF4()
{
  return MEMORY[0x24BEE55D8]();
}

uint64_t sub_20CFCCE00()
{
  return MEMORY[0x24BEE55E0]();
}

uint64_t sub_20CFCCE0C()
{
  return MEMORY[0x24BEE55F8]();
}

uint64_t sub_20CFCCE18()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_20CFCCE24()
{
  return MEMORY[0x24BEB7A00]();
}

uint64_t sub_20CFCCE30()
{
  return MEMORY[0x24BEB7A08]();
}

uint64_t sub_20CFCCE3C()
{
  return MEMORY[0x24BEB7A10]();
}

uint64_t sub_20CFCCE48()
{
  return MEMORY[0x24BEB7A18]();
}

uint64_t sub_20CFCCE54()
{
  return MEMORY[0x24BEB7A28]();
}

uint64_t sub_20CFCCE60()
{
  return MEMORY[0x24BEB7A38]();
}

uint64_t sub_20CFCCE6C()
{
  return MEMORY[0x24BEB7A40]();
}

uint64_t sub_20CFCCE78()
{
  return MEMORY[0x24BEB7A48]();
}

uint64_t sub_20CFCCE84()
{
  return MEMORY[0x24BEB7A50]();
}

uint64_t sub_20CFCCE90()
{
  return MEMORY[0x24BEB7A60]();
}

uint64_t sub_20CFCCE9C()
{
  return MEMORY[0x24BEB7A68]();
}

uint64_t sub_20CFCCEA8()
{
  return MEMORY[0x24BEB7A70]();
}

uint64_t sub_20CFCCEB4()
{
  return MEMORY[0x24BEB7A78]();
}

uint64_t sub_20CFCCEC0()
{
  return MEMORY[0x24BEB7A80]();
}

uint64_t sub_20CFCCECC()
{
  return MEMORY[0x24BEB7A88]();
}

uint64_t sub_20CFCCED8()
{
  return MEMORY[0x24BEB7A90]();
}

uint64_t sub_20CFCCEE4()
{
  return MEMORY[0x24BEB7A98]();
}

uint64_t sub_20CFCCEF0()
{
  return MEMORY[0x24BEB7AA8]();
}

uint64_t sub_20CFCCEFC()
{
  return MEMORY[0x24BEB7AB0]();
}

uint64_t sub_20CFCCF08()
{
  return MEMORY[0x24BEB7AB8]();
}

uint64_t sub_20CFCCF14()
{
  return MEMORY[0x24BEB7AE0]();
}

uint64_t sub_20CFCCF20()
{
  return MEMORY[0x24BEB7AE8]();
}

uint64_t sub_20CFCCF2C()
{
  return MEMORY[0x24BEB7AF0]();
}

uint64_t sub_20CFCCF38()
{
  return MEMORY[0x24BEB7AF8]();
}

uint64_t sub_20CFCCF44()
{
  return MEMORY[0x24BEB7B00]();
}

uint64_t sub_20CFCCF50()
{
  return MEMORY[0x24BEB7B08]();
}

uint64_t sub_20CFCCF5C()
{
  return MEMORY[0x24BEB7B18]();
}

uint64_t sub_20CFCCF68()
{
  return MEMORY[0x24BEB7B20]();
}

uint64_t sub_20CFCCF74()
{
  return MEMORY[0x24BEB7B28]();
}

uint64_t sub_20CFCCF80()
{
  return MEMORY[0x24BEB7B30]();
}

uint64_t sub_20CFCCF8C()
{
  return MEMORY[0x24BEB7B38]();
}

uint64_t sub_20CFCCF98()
{
  return MEMORY[0x24BEB7B40]();
}

uint64_t sub_20CFCCFA4()
{
  return MEMORY[0x24BEB7B48]();
}

uint64_t sub_20CFCCFB0()
{
  return MEMORY[0x24BEB7B50]();
}

uint64_t sub_20CFCCFBC()
{
  return MEMORY[0x24BEB7B58]();
}

uint64_t sub_20CFCCFC8()
{
  return MEMORY[0x24BEB7B68]();
}

uint64_t sub_20CFCCFD4()
{
  return MEMORY[0x24BEB7B70]();
}

uint64_t sub_20CFCCFE0()
{
  return MEMORY[0x24BEB7B78]();
}

uint64_t sub_20CFCCFEC()
{
  return MEMORY[0x24BEB7B80]();
}

uint64_t sub_20CFCCFF8()
{
  return MEMORY[0x24BEB7BC8]();
}

uint64_t sub_20CFCD004()
{
  return MEMORY[0x24BEB7BD0]();
}

uint64_t sub_20CFCD010()
{
  return MEMORY[0x24BEB7BD8]();
}

uint64_t sub_20CFCD01C()
{
  return MEMORY[0x24BEB7BE0]();
}

uint64_t sub_20CFCD028()
{
  return MEMORY[0x24BEB7BE8]();
}

uint64_t sub_20CFCD034()
{
  return MEMORY[0x24BEB7BF0]();
}

uint64_t sub_20CFCD040()
{
  return MEMORY[0x24BEB7BF8]();
}

uint64_t sub_20CFCD04C()
{
  return MEMORY[0x24BEB7C00]();
}

uint64_t sub_20CFCD058()
{
  return MEMORY[0x24BEB7C10]();
}

uint64_t sub_20CFCD064()
{
  return MEMORY[0x24BEB7C18]();
}

uint64_t sub_20CFCD070()
{
  return MEMORY[0x24BEB7C20]();
}

uint64_t sub_20CFCD07C()
{
  return MEMORY[0x24BEB7C28]();
}

uint64_t sub_20CFCD088()
{
  return MEMORY[0x24BEB7C30]();
}

uint64_t sub_20CFCD094()
{
  return MEMORY[0x24BEB7C38]();
}

uint64_t sub_20CFCD0A0()
{
  return MEMORY[0x24BEB7C48]();
}

uint64_t sub_20CFCD0AC()
{
  return MEMORY[0x24BEB7C50]();
}

uint64_t sub_20CFCD0B8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_20CFCD0C4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_20CFCD0D0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_20CFCD0DC()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_20CFCD0E8()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_20CFCD0F4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_20CFCD100()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_20CFCD10C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_20CFCD118()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_20CFCD124()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_20CFCD130()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_20CFCD13C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20CFCD148()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_20CFCD154()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_20CFCD160()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_20CFCD16C()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_20CFCD178()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_20CFCD184()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_20CFCD190()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_20CFCD19C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_20CFCD1A8()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_20CFCD1B4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_20CFCD1C0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_20CFCD1CC()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_20CFCD1D8()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_20CFCD1E4()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_20CFCD1F0()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_20CFCD1FC()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_20CFCD208()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_20CFCD214()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_20CFCD220()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_20CFCD22C()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_20CFCD238()
{
  return MEMORY[0x24BEE13B8]();
}

uint64_t sub_20CFCD244()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_20CFCD250()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_20CFCD25C()
{
  return MEMORY[0x24BEE56C0]();
}

uint64_t sub_20CFCD268()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_20CFCD274()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_20CFCD280()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_20CFCD28C()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_20CFCD298()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_20CFCD2A4()
{
  return MEMORY[0x24BEBCCD0]();
}

uint64_t sub_20CFCD2B0()
{
  return MEMORY[0x24BDD0078]();
}

uint64_t sub_20CFCD2BC()
{
  return MEMORY[0x24BDD0098]();
}

uint64_t sub_20CFCD2C8()
{
  return MEMORY[0x24BEB7C60]();
}

uint64_t sub_20CFCD2D4()
{
  return MEMORY[0x24BEBCFA8]();
}

uint64_t sub_20CFCD2E0()
{
  return MEMORY[0x24BEBCFB0]();
}

uint64_t sub_20CFCD2EC()
{
  return MEMORY[0x24BDF5540]();
}

uint64_t sub_20CFCD2F8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_20CFCD304()
{
  return MEMORY[0x24BDD03C0]();
}

uint64_t sub_20CFCD310()
{
  return MEMORY[0x24BDD03D0]();
}

uint64_t sub_20CFCD31C()
{
  return MEMORY[0x24BDD03E0]();
}

uint64_t sub_20CFCD328()
{
  return MEMORY[0x24BDD03F0]();
}

uint64_t sub_20CFCD334()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_20CFCD340()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_20CFCD34C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_20CFCD358()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_20CFCD364()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_20CFCD370()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_20CFCD37C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_20CFCD388()
{
  return MEMORY[0x24BEE2578]();
}

uint64_t sub_20CFCD394()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_20CFCD3A0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_20CFCD3AC()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_20CFCD3B8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_20CFCD3C4()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_20CFCD3D0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_20CFCD3DC()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_20CFCD3E8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_20CFCD3F4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_20CFCD400()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_20CFCD40C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_20CFCD418()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_20CFCD424()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_20CFCD430()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20CFCD43C()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_20CFCD448()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_20CFCD454()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_20CFCD460()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_20CFCD46C()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_20CFCD478()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_20CFCD484()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_20CFCD490()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_20CFCD49C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_20CFCD4A8()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_20CFCD4B4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20CFCD4C0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_20CFCD4CC()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_20CFCD4D8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_20CFCD4E4()
{
  return MEMORY[0x24BEE4A98]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BEBD2C8]((__n128)size, *(__n128 *)&size.height);
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x24BEE7198]();
}

uint64_t swift_asyncLet_finish()
{
  return MEMORY[0x24BEE71A0]();
}

uint64_t swift_asyncLet_get_throwing()
{
  return MEMORY[0x24BEE71B0]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x24BEE4C48]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t uloc_addLikelySubtags()
{
  return MEMORY[0x24BEDC178]();
}

