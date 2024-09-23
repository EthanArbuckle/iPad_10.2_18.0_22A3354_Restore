void (*sub_1B134C440(_QWORD *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t *v5;
  _QWORD *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  void (*result)(uint64_t **, uint64_t);

  v5 = v4;
  v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v5;
  v10[1] = a2;
  v11 = *v5;
  v13 = sub_1B12D372C(a2, a3);
  *((_BYTE *)v10 + 40) = v12 & 1;
  v14 = *(_QWORD *)(v11 + 16);
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    v17 = v12;
    v18 = *(_QWORD *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if ((v17 & 1) != 0)
      {
LABEL_8:
        v19 = *(_QWORD *)(*(_QWORD *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *v10 = v19;
        return sub_1B12D4280;
      }
LABEL_11:
      v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_1B12D47BC();
      goto LABEL_7;
    }
    sub_1B136BDF8(v16, a4 & 1);
    v20 = sub_1B12D372C(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      v13 = v20;
      v10[4] = v20;
      if ((v17 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = (void (*)(uint64_t **, uint64_t))sub_1B1373270();
  __break(1u);
  return result;
}

uint64_t (*sub_1B134C56C(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_1B12D5844;
}

BOOL static PrivacyMarkerType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t PrivacyMarkerType.hash(into:)()
{
  return sub_1B13732D0();
}

uint64_t PrivacyMarkerType.hashValue.getter()
{
  sub_1B13732C4();
  sub_1B13732D0();
  return sub_1B13732E8();
}

unint64_t sub_1B134C610()
{
  unint64_t result;

  result = qword_1EEF285F8;
  if (!qword_1EEF285F8)
  {
    result = MEMORY[0x1B5E1AF70](&protocol conformance descriptor for PrivacyMarkerType, &type metadata for PrivacyMarkerType);
    atomic_store(result, (unint64_t *)&qword_1EEF285F8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PrivacyMarkerType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PrivacyMarkerType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B134C730 + 4 * byte_1B13783A5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1B134C764 + 4 * byte_1B13783A0[v4]))();
}

uint64_t sub_1B134C764(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B134C76C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B134C774);
  return result;
}

uint64_t sub_1B134C780(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B134C788);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1B134C78C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B134C794(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B134C7A0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void sub_1B134C7CC(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void sub_1B134C82C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;

  v2 = v1;
  if (sub_1B12E8C24()
    || (objc_msgSend(*(id *)(v2 + OBJC_IVAR___APPCPromotedContentView_promotedContent), sel_adType),
        v4 = sub_1B13722D4(),
        v4 == sub_1B13722D4()))
  {
    *(_BYTE *)(v2 + OBJC_IVAR___APPCPromotedContentView_shouldBlockNavigation) = *(_BYTE *)(a1
                                                                                          + OBJC_IVAR____TtC17PromotedContentUI20TapGestureRecognizer_shouldBlockNavigation);
    sub_1B134DBF0(*(double *)(a1 + OBJC_IVAR____TtC17PromotedContentUI20TapGestureRecognizer_mostRecentTapLocation), *(double *)(a1 + OBJC_IVAR____TtC17PromotedContentUI20TapGestureRecognizer_mostRecentTapLocation + 8));
  }
  else
  {
    sub_1B1372D78();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v5 = (id)sub_1B1372F70();
    sub_1B1372988();

  }
}

uint64_t sub_1B134C970(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = sub_1B1373234();
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
    if (v12 || (sub_1B1373234() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B134CA34(double a1, double a2)
{
  void *v2;
  void *v3;
  double v6;
  void *v8;
  uint64_t v9;
  CGFloat Width;
  uint64_t v11;
  unint64_t v12;
  CGFloat Height;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v3 = v2;
  objc_msgSend(v2, sel_frame);
  if (CGRectGetWidth(v18) <= 0.0 || (objc_msgSend(v2, sel_frame), CGRectGetHeight(v19) <= 0.0))
  {
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v8 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_1B13757D0;
    objc_msgSend(v3, sel_frame);
    Width = CGRectGetWidth(v22);
    v11 = MEMORY[0x1E0DEF040];
    *(_QWORD *)(v9 + 56) = MEMORY[0x1E0DEF040];
    v12 = sub_1B134FF3C();
    *(_QWORD *)(v9 + 64) = v12;
    *(CGFloat *)(v9 + 32) = Width;
    objc_msgSend(v3, sel_frame);
    Height = CGRectGetHeight(v23);
    *(_QWORD *)(v9 + 96) = v11;
    *(_QWORD *)(v9 + 104) = v12;
    *(CGFloat *)(v9 + 72) = Height;
    sub_1B1372988();

  }
  else
  {
    if (a1 >= 0.0 && a2 >= 0.0)
    {
      objc_msgSend(v2, sel_frame);
      v6 = a1 / CGRectGetWidth(v20);
      objc_msgSend(v2, sel_frame);
      CGRectGetHeight(v21);
      return *(_QWORD *)&v6;
    }
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v14 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_1B13757D0;
    v16 = MEMORY[0x1E0DEF040];
    *(_QWORD *)(v15 + 56) = MEMORY[0x1E0DEF040];
    v17 = sub_1B134FF3C();
    *(_QWORD *)(v15 + 64) = v17;
    *(double *)(v15 + 32) = a1;
    *(_QWORD *)(v15 + 96) = v16;
    *(_QWORD *)(v15 + 104) = v17;
    *(double *)(v15 + 72) = a2;
    sub_1B1372988();

  }
  swift_bridgeObjectRelease();
  return 0;
}

void sub_1B134CCE0(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char *v24;
  void *v25;
  uint64_t v26;
  char *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  char *v31;
  id v32;
  unsigned __int8 v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_1B12CF7F8(&qword_1ED387C50);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B1371DC4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v34 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_1B1375550;
    v36 = objc_msgSend(*(id *)&v2[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
    v37 = sub_1B1372B98();
    v39 = v38;

    *(_QWORD *)(v35 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v35 + 64) = sub_1B12CE678();
    *(_QWORD *)(v35 + 32) = v37;
    *(_QWORD *)(v35 + 40) = v39;
    sub_1B1372988();

    swift_bridgeObjectRelease();
    return;
  }
  sub_1B1372340();
  v11 = swift_dynamicCastClass();
  v12 = a1;
  if (v11)
  {
    v62 = v12;
    sub_1B1372D84();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v13 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1B1375550;
    v15 = objc_msgSend(*(id *)&v2[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
    v16 = sub_1B1372B98();
    v18 = v17;

    *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v14 + 64) = sub_1B12CE678();
    *(_QWORD *)(v14 + 32) = v16;
    *(_QWORD *)(v14 + 40) = v18;
    sub_1B1372988();

    swift_bridgeObjectRelease();
    v19 = OBJC_IVAR___APPCPromotedContentView_storeProductRequester;
    v20 = *(void **)&v2[OBJC_IVAR___APPCPromotedContentView_storeProductRequester];
    if (!v20)
    {
      sub_1B1372310();
      v21 = sub_1B137240C();
      v22 = 0;
      if (v21 == sub_1B137240C())
      {
        v23 = v62;
        v24 = v2;
        v25 = (void *)sub_1B1372328();
        v26 = sub_1B1372334();
        v27 = (char *)objc_allocWithZone((Class)type metadata accessor for StoreProductRequester());
        v22 = sub_1B134F844(v25, v26, (uint64_t)v24, v27);

      }
      v28 = *(void **)&v2[v19];
      *(_QWORD *)&v2[v19] = v22;

      v20 = *(void **)&v2[v19];
      if (!v20)
        goto LABEL_9;
    }
    v29 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v30 = (void *)objc_opt_self();
    swift_retain_n();
    v31 = v20;
    v32 = objc_msgSend(v30, sel_processInfo);
    v33 = objc_msgSend(v32, sel_isRunningTests);

    if ((v33 & 1) != 0)
    {
      sub_1B134E634(1, 0, v29);

      swift_release_n();
LABEL_9:

LABEL_15:
      return;
    }
    v51 = *(void **)&v31[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_storeProductViewController];
    swift_beginAccess();
    v52 = v51;
    swift_bridgeObjectRetain();
    v53 = (void *)sub_1B1372B08();
    swift_bridgeObjectRelease();
    v54 = swift_allocObject();
    *(_QWORD *)(v54 + 16) = sub_1B134F810;
    *(_QWORD *)(v54 + 24) = v29;
    aBlock[4] = sub_1B134F83C;
    aBlock[5] = v54;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B134C7CC;
    aBlock[3] = &unk_1E62F9098;
    v55 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v52, sel_loadProductWithParameters_completionBlock_, v53, v55);
    _Block_release(v55);

    swift_release_n();
  }
  else
  {
    v62 = v12;
    v40 = sub_1B134F64C((uint64_t)v2, v12);
    if (v40)
    {
      v41 = v40;
      type metadata accessor for SafariViewController();
      v42 = swift_dynamicCastClass();
      if (v42)
      {
        v43 = (void *)v42;
        v44 = v41;
        sub_1B1372D84();
        sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
        v45 = (void *)sub_1B1372F70();
        sub_1B12CF7F8(&qword_1ED3899B0);
        v46 = swift_allocObject();
        *(_OWORD *)(v46 + 16) = xmmword_1B1375550;
        v47 = objc_msgSend(*(id *)&v2[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
        v48 = sub_1B1372B98();
        v50 = v49;

        *(_QWORD *)(v46 + 56) = MEMORY[0x1E0DEA968];
        *(_QWORD *)(v46 + 64) = sub_1B12CE678();
        *(_QWORD *)(v46 + 32) = v48;
        *(_QWORD *)(v46 + 40) = v50;
        sub_1B1372988();

        swift_bridgeObjectRelease();
        objc_msgSend(v43, sel_setDelegate_, v2);

      }
      sub_1B134E978(v41);

      goto LABEL_15;
    }
    sub_1B1319A00((uint64_t)v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      sub_1B12D0D40((uint64_t)v6, &qword_1ED387C50);
      sub_1B1372D90();
      sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
      v56 = (void *)sub_1B1372F70();
      sub_1B12CF7F8(&qword_1ED3899B0);
      v57 = swift_allocObject();
      *(_OWORD *)(v57 + 16) = xmmword_1B1375550;
      v58 = objc_msgSend(*(id *)&v2[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
      v59 = sub_1B1372B98();
      v61 = v60;

      *(_QWORD *)(v57 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v57 + 64) = sub_1B12CE678();
      *(_QWORD *)(v57 + 32) = v59;
      *(_QWORD *)(v57 + 40) = v61;
      sub_1B1372988();

      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
      sub_1B134EB0C((uint64_t)v10);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
  }
}

void sub_1B134D590(void *a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  void *v22;
  _QWORD *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v62;
  int v63;

  v9 = v8;
  v18 = sub_1B12CF7F8(&qword_1ED387ED8);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v61 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = objc_msgSend(a2, sel_bestRepresentation);
  if (!v21)
  {
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v25 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_1B1375550;
    v27 = objc_msgSend(a2, sel_identifier);
    v28 = sub_1B1372B98();
    v30 = v29;

    *(_QWORD *)(v26 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v26 + 64) = sub_1B12CE678();
    *(_QWORD *)(v26 + 32) = v28;
    *(_QWORD *)(v26 + 40) = v30;
    sub_1B1372988();

LABEL_6:
    swift_bridgeObjectRelease();
LABEL_8:
    *((_BYTE *)v9 + OBJC_IVAR___APPCPromotedContentView_shouldBlockNavigation) = 0;
    v31 = (char *)v9 + OBJC_IVAR___APPCPromotedContentView_tapWasRecognized;
    goto LABEL_15;
  }
  v22 = v21;
  v23 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  if (((*(uint64_t (**)(void *, id))((*MEMORY[0x1E0DEEDD8] & *v8) + 0x308))(a1, v21) & 1) == 0)
  {
    swift_unknownObjectRelease();
    goto LABEL_8;
  }
  if (!a1)
  {
    v24 = objc_msgSend(v22, sel_tapAction);
    if (v24)
      goto LABEL_10;
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v49 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v50 = swift_allocObject();
    *(_OWORD *)(v50 + 16) = xmmword_1B1375550;
    v51 = objc_msgSend(a2, sel_identifier);
    v52 = sub_1B1372B98();
    v54 = v53;

    *(_QWORD *)(v50 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v50 + 64) = sub_1B12CE678();
    *(_QWORD *)(v50 + 32) = v52;
    *(_QWORD *)(v50 + 40) = v54;
    sub_1B1372988();
    swift_unknownObjectRelease();

    goto LABEL_6;
  }
  v24 = a1;
LABEL_10:
  v32 = OBJC_IVAR___APPCPromotedContentView_shouldBlockNavigation;
  if ((*((_BYTE *)v8 + OBJC_IVAR___APPCPromotedContentView_shouldBlockNavigation) & 1) != 0
    || (v31 = (char *)v8 + OBJC_IVAR___APPCPromotedContentView_tapWasRecognized,
        *((_BYTE *)v8 + OBJC_IVAR___APPCPromotedContentView_tapWasRecognized) != 1))
  {
    *((_BYTE *)v8 + OBJC_IVAR___APPCPromotedContentView_shouldBlockNavigation) = 0;
    v31 = (char *)v8 + OBJC_IVAR___APPCPromotedContentView_tapWasRecognized;
    *((_BYTE *)v8 + OBJC_IVAR___APPCPromotedContentView_tapWasRecognized) = 0;
    v40 = a1;
    v63 = sub_1B1372D9C();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v41 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_1B1375550;
    v43 = objc_msgSend(a2, sel_identifier);
    v44 = v32;
    v45 = v24;
    v46 = sub_1B1372B98();
    v48 = v47;

    *(_QWORD *)(v42 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v42 + 64) = sub_1B12CE678();
    *(_QWORD *)(v42 + 32) = v46;
    *(_QWORD *)(v42 + 40) = v48;
    sub_1B1372988();
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
    *((_BYTE *)v9 + v44) = 0;
  }
  else
  {
    v33 = *(void **)((char *)v8 + OBJC_IVAR___APPCPromotedContentView_videoTapAction);
    *(_QWORD *)((char *)v9 + OBJC_IVAR___APPCPromotedContentView_videoTapAction) = 0;
    v34 = a1;

    v35 = sub_1B1372ACC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v20, 1, 1, v35);
    v36 = (uint64_t)v9 + OBJC_IVAR___APPCPromotedContentView_videoActionTimestamp;
    swift_beginAccess();
    sub_1B12F1898((uint64_t)v20, v36);
    swift_endAccess();
    v37 = (char *)v9 + OBJC_IVAR___APPCPromotedContentView_videoMoreLocation;
    *(_QWORD *)v37 = 0;
    *((_QWORD *)v37 + 1) = 0;
    v37[16] = 1;
    v38 = sub_1B12FE004();
    v62 = v24;
    if (v38)
    {
      v39 = v38;
    }
    else
    {
      v39 = v24;
      v38 = 0;
    }
    v55 = *(void **)((char *)v9 + OBJC_IVAR___APPCPromotedContentView_lastPerformedAction);
    *(_QWORD *)((char *)v9 + OBJC_IVAR___APPCPromotedContentView_lastPerformedAction) = v39;
    v56 = v38;
    v57 = v39;

    sub_1B134E404(a3, a4, a5, a6, a7, a8);
    objc_msgSend(a2, sel_adType);
    v58 = sub_1B13722D4();
    if (v58 == sub_1B13722D4())
    {

      v59 = swift_unknownObjectRelease();
      (*(void (**)(uint64_t))((*v23 & *v9) + 0x318))(v59);
    }
    else
    {
      v60 = v57;
      sub_1B134CCE0(v39);
      swift_unknownObjectRelease();

    }
    *((_BYTE *)v9 + v32) = 0;
  }
LABEL_15:
  *v31 = 0;
}

void sub_1B134DBF0(double a1, double a2)
{
  _BYTE *v2;
  _BYTE *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  double *v41;
  void (*v42)(char *, uint64_t);
  id v43;
  void *v44;
  id v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  id v52;
  void *v53;
  char *v54;
  unint64_t v55;
  unint64_t v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void (*v62)(char *, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  id v69;
  unint64_t v70;
  unint64_t v71;

  v3 = v2;
  v6 = sub_1B12CF7F8(&qword_1ED387ED8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1B1372ACC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v66 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v67 = (char *)&v63 - v13;
  v14 = sub_1B12CF7F8(&qword_1ED387C50);
  v15 = MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v63 - v18;
  v20 = sub_1B1371DC4();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v23 = (char *)&v63 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3[OBJC_IVAR___APPCPromotedContentView_tapWasRecognized] = 1;
  v68 = OBJC_IVAR___APPCPromotedContentView_promotedContent;
  v24 = objc_msgSend(*(id *)&v3[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_bestRepresentation);
  if (!v24)
  {
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v69 = (id)sub_1B1372F70();
    sub_1B1372988();
    goto LABEL_10;
  }
  v25 = v24;
  v65 = v10;
  v69 = objc_msgSend(v24, sel_tapAction);
  objc_msgSend(v25, sel_adType);
  v26 = sub_1B13722D4();
  if (v26 == sub_1B13722D4())
  {
    sub_1B1372574();
    if (swift_dynamicCastClass())
    {
      v64 = v9;
      swift_unknownObjectRetain();
      sub_1B1372568();
      v70 = 0xD000000000000013;
      v71 = 0x80000001B1383F60;
      sub_1B1372C34();
      sub_1B1371DB8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
      {
        swift_unknownObjectRelease_n();

        sub_1B12D0D40((uint64_t)v19, &qword_1ED387C50);
        return;
      }
      (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v23, v19, v20);
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v17, v23, v20);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v17, 0, 1, v20);
      v28 = objc_allocWithZone((Class)sub_1B13722A4());
      v29 = sub_1B1372298();
      swift_unknownObjectRelease();

      (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
      v27 = (id)v29;
      goto LABEL_12;
    }
    swift_unknownObjectRelease();
LABEL_10:

    return;
  }
  v64 = v9;
  v27 = v69;
  if (!v69)
  {
    swift_unknownObjectRelease();
    return;
  }
LABEL_12:
  v30 = v27;
  sub_1B13728BC();
  v31 = sub_1B13722EC();
  if (v31 == sub_1B13722EC()
    || (sub_1B13728BC(), v32 = sub_1B13722EC(), v32 == sub_1B13722EC())
    || (sub_1B13728BC(), v33 = sub_1B13722EC(), v33 == sub_1B13722EC()))
  {

    v34 = v30;
    sub_1B13728BC();
    v35 = sub_1B13722EC();
    if (v35 != sub_1B13722EC() || (v36 = *(void **)&v3[OBJC_IVAR___APPCPromotedContentView_videoTapAction]) == 0)
    {
      swift_unknownObjectRelease();
LABEL_20:

      return;
    }
    v37 = (uint64_t)&v3[OBJC_IVAR___APPCPromotedContentView_videoActionTimestamp];
    swift_beginAccess();
    sub_1B12F1850(v37, (uint64_t)v8);
    v39 = v64;
    v38 = v65;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v65 + 48))(v8, 1, v64) == 1)
    {
      swift_unknownObjectRelease();

      sub_1B12D0D40((uint64_t)v8, &qword_1ED387ED8);
      return;
    }
    v40 = v67;
    (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v67, v8, v39);
    v41 = (double *)&v3[OBJC_IVAR___APPCPromotedContentView_videoMoreLocation];
    if ((v3[OBJC_IVAR___APPCPromotedContentView_videoMoreLocation + 16] & 1) != 0)
    {
      v42 = *(void (**)(char *, uint64_t))(v38 + 8);
      v43 = v36;
      v42(v40, v39);
      swift_unknownObjectRelease();

      goto LABEL_20;
    }
    v51 = *v41;
    v50 = v41[1];
    v52 = v36;
    sub_1B1372D78();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v53 = (void *)sub_1B1372F70();
    sub_1B1372988();

    v54 = v66;
    sub_1B1372AC0();
    v55 = sub_1B1372AB4();
    v56 = sub_1B1372AB4();
    if (v55 < v56)
    {
      __break(1u);
    }
    else
    {
      if (v55 - v56 <= 0xBEBC200)
      {
        v57 = *(void **)&v3[v68];
        v52 = v52;
        swift_unknownObjectRetain();
        objc_msgSend(v3, sel_frame);
        sub_1B134D590(v36, v57, v51, v50, v58, v59, v60, v61);
        swift_unknownObjectRelease();

      }
      swift_unknownObjectRelease();

      v62 = *(void (**)(char *, uint64_t))(v65 + 8);
      v62(v54, v39);
      v62(v40, v39);
    }
  }
  else
  {
    v44 = *(void **)&v3[v68];
    v45 = v30;
    swift_unknownObjectRetain();
    objc_msgSend(v3, sel_frame);
    sub_1B134D590(v30, v44, a1, a2, v46, v47, v48, v49);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

  }
}

uint64_t sub_1B134E404(double a1, double a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6;
  uint64_t v7;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  double v24;
  char v25;
  double v26;
  double v27;
  id v28;
  double v29;
  double v30;

  v7 = v6;
  sub_1B1372D78();
  sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
  v14 = (void *)sub_1B1372F70();
  sub_1B12CF7F8(&qword_1ED3899B0);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1B1378480;
  v16 = OBJC_IVAR___APPCPromotedContentView_promotedContent;
  v17 = objc_msgSend(*(id *)(v7 + OBJC_IVAR___APPCPromotedContentView_promotedContent), sel_identifier);
  v18 = sub_1B1372B98();
  v20 = v19;

  *(_QWORD *)(v15 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v15 + 64) = sub_1B12CE678();
  *(_QWORD *)(v15 + 32) = v18;
  *(_QWORD *)(v15 + 40) = v20;
  v21 = MEMORY[0x1E0DEF040];
  *(_QWORD *)(v15 + 96) = MEMORY[0x1E0DEF040];
  v22 = sub_1B134FF3C();
  *(_QWORD *)(v15 + 104) = v22;
  *(double *)(v15 + 72) = a1;
  *(_QWORD *)(v15 + 136) = v21;
  *(_QWORD *)(v15 + 144) = v22;
  *(double *)(v15 + 112) = a2;
  *(_QWORD *)(v15 + 176) = v21;
  *(_QWORD *)(v15 + 184) = v22;
  *(double *)(v15 + 152) = a3;
  *(_QWORD *)(v15 + 216) = v21;
  *(_QWORD *)(v15 + 224) = v22;
  *(double *)(v15 + 192) = a4;
  *(_QWORD *)(v15 + 256) = v21;
  *(_QWORD *)(v15 + 264) = v22;
  *(double *)(v15 + 232) = a5;
  *(_QWORD *)(v15 + 296) = v21;
  *(_QWORD *)(v15 + 304) = v22;
  *(double *)(v15 + 272) = a6;
  sub_1B1372988();

  swift_bridgeObjectRelease();
  *(double *)&v23 = COERCE_DOUBLE(sub_1B134CA34(a1, a2));
  if ((v25 & 1) != 0)
  {
    v28 = objc_msgSend(*(id *)(v7 + v16), sel_metricsHelper);
    LODWORD(v29) = -1.0;
    LODWORD(v30) = -1.0;
  }
  else
  {
    v26 = *(double *)&v23;
    v27 = v24;
    v28 = objc_msgSend(*(id *)(v7 + v16), sel_metricsHelper);
    *(float *)&v29 = v26;
    *(float *)&v30 = v27;
  }
  objc_msgSend(v28, sel_interactedAtXPos_yPos_, v29, v30);
  return swift_unknownObjectRelease();
}

void sub_1B134E634(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t *v29;

  v5 = a3 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x1B5E1B0F0](v5);
  if (v6)
  {
    v7 = (char *)v6;
    v8 = *(void **)(v6 + OBJC_IVAR___APPCPromotedContentView_storeProductRequester);
    if (!v8)
    {
      v9 = (id)v6;
LABEL_14:

      return;
    }
    v9 = v8;
    sub_1B1372D84();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v10 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    if ((a1 & 1) != 0 && !a2)
    {
      v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_1B1375550;
      v12 = objc_msgSend(*(id *)&v7[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
      v13 = sub_1B1372B98();
      v15 = v14;

      *(_QWORD *)(v11 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v11 + 64) = sub_1B12CE678();
      *(_QWORD *)(v11 + 32) = v13;
      *(_QWORD *)(v11 + 40) = v15;
      sub_1B1372988();

      swift_bridgeObjectRelease();
      sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389980);
      v16 = swift_allocObject();
      *(_QWORD *)(v16 + 16) = v7;
      *(_QWORD *)(v16 + 24) = v9;
      v17 = v9;
      v18 = v7;
      sub_1B1372DCC();
      swift_release();
LABEL_13:

      goto LABEL_14;
    }
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_1B13757D0;
    v20 = objc_msgSend(*(id *)&v7[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
    v21 = sub_1B1372B98();
    v23 = v22;

    v24 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v19 + 56) = MEMORY[0x1E0DEA968];
    v25 = sub_1B12CE678();
    v26 = v25;
    *(_QWORD *)(v19 + 64) = v25;
    *(_QWORD *)(v19 + 32) = v21;
    *(_QWORD *)(v19 + 40) = v23;
    if (a2)
    {
      swift_getErrorValue();
      v27 = sub_1B137327C();
      v29 = (uint64_t *)(v19 + 72);
      *(_QWORD *)(v19 + 96) = v24;
      *(_QWORD *)(v19 + 104) = v26;
      if (v28)
      {
        *v29 = v27;
LABEL_12:
        *(_QWORD *)(v19 + 80) = v28;
        sub_1B1372988();

        swift_bridgeObjectRelease();
        goto LABEL_13;
      }
    }
    else
    {
      v29 = (uint64_t *)(v19 + 72);
      *(_QWORD *)(v19 + 96) = v24;
      *(_QWORD *)(v19 + 104) = v25;
    }
    *v29 = 0;
    v28 = 0xE000000000000000;
    goto LABEL_12;
  }
}

void sub_1B134E934(uint64_t a1, uint64_t a2)
{
  id v2;

  v2 = *(id *)(a2 + OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_storeProductViewController);
  sub_1B134E978(v2);

}

void sub_1B134E978(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[6];

  v3 = (void *)MEMORY[0x1B5E1B0F0](v1 + OBJC_IVAR___APPCPromotedContentView_interactionPresentationDelegate);
  if (v3)
  {
    v4 = objc_msgSend(v3, sel_viewControllerToPresentFrom);
    swift_unknownObjectRelease();
  }
  else
  {
    v5 = _s17PromotedContentUI9AppAdViewC010presentingF10Controller3forSo06UIViewH0CSgSo011ASCAdLockupF0C_tF_0();
    if (!v5)
      return;
    v4 = v5;
  }
  v6 = objc_msgSend(v4, sel_presentedViewController);
  if (v6)
  {
    v7 = v6;
    type metadata accessor for ExpandViewController();
    v8 = swift_dynamicCastClass();
    if (v8)
      v9 = v4;
    else
      v9 = v7;
    if (v8)
      v4 = (id)v8;

  }
  v10 = !UIAccessibilityIsReduceMotionEnabled();
  v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v11;
  v12[3] = a1;
  v12[4] = v4;
  v16[4] = sub_1B134FE24;
  v16[5] = v12;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1107296256;
  v16[2] = sub_1B12BF1A0;
  v16[3] = &unk_1E62F9110;
  v13 = _Block_copy(v16);
  v14 = a1;
  v15 = v4;
  swift_release();
  objc_msgSend(v15, sel_presentViewController_animated_completion_, v14, v10, v13);
  _Block_release(v13);

}

void sub_1B134EB0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t, uint64_t);
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  void (*v17)(char *, uint64_t, uint64_t);
  char v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, void (*)(char), uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  id v44;
  _QWORD *v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  _QWORD v48[3];
  uint64_t v49;
  uint64_t v50;

  v3 = sub_1B1371DC4();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 64);
  v6 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v43 - (((unint64_t)v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v43 - v8;
  v10 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v11 = objc_msgSend(v10, sel_bundleIdentifier);

  v46 = v1;
  if (!v11)
  {
    v17 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    v17(v9, a1, v3);
    goto LABEL_9;
  }
  v47 = v5;
  v12 = sub_1B1372B98();
  v14 = v13;

  if (v12 != 0x6C7070612E6D6F63 || v14 != 0xEE007377656E2E65)
  {
    v16 = sub_1B1373234();
    swift_bridgeObjectRelease();
    v17 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    v17(v9, a1, v3);
    v5 = v47;
    if ((v16 & 1) != 0)
      goto LABEL_11;
LABEL_9:
    v47 = v17;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v17(v9, a1, v3);
  v5 = v47;
LABEL_11:
  v18 = sub_1B133FE08();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  v47 = v17;
  if ((v18 & 1) == 0)
    goto LABEL_17;
  v19 = (void *)objc_opt_self();
  v20 = objc_msgSend(v19, sel_sharedApplication);
  v21 = objc_msgSend(v20, sel_delegate);

  if (!v21)
    goto LABEL_17;
  v44 = v19;
  LODWORD(v45) = sub_1B1372D84();
  sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
  v22 = (void *)sub_1B1372F70();
  sub_1B12CF7F8(&qword_1ED3899B0);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1B1375550;
  v24 = sub_1B1371D7C();
  v26 = v25;
  *(_QWORD *)(v23 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v23 + 64) = sub_1B12CE678();
  *(_QWORD *)(v23 + 32) = v24;
  *(_QWORD *)(v23 + 40) = v26;
  sub_1B1372988();

  swift_bridgeObjectRelease();
  if ((objc_msgSend(v21, sel_respondsToSelector_, sel_application_openURL_options_) & 1) == 0)
  {
    swift_unknownObjectRelease();
    goto LABEL_17;
  }
  swift_unknownObjectRetain();
  v27 = objc_msgSend(v44, sel_sharedApplication);
  sub_1B131A4D0(MEMORY[0x1E0DEE9D8]);
  v28 = (void *)sub_1B1371D88();
  type metadata accessor for OpenURLOptionsKey(0);
  sub_1B134FEF4();
  v29 = (void *)sub_1B1372B08();
  LODWORD(v45) = objc_msgSend(v21, sel_application_openURL_options_, v27, v28, v29);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();

  if ((v45 & 1) == 0)
  {
LABEL_17:
    sub_1B1372D84();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v30 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_1B1375550;
    v32 = sub_1B1371D7C();
    v34 = v33;
    *(_QWORD *)(v31 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v31 + 64) = sub_1B12CE678();
    *(_QWORD *)(v31 + 32) = v32;
    *(_QWORD *)(v31 + 40) = v34;
    sub_1B1372988();

    swift_bridgeObjectRelease();
    sub_1B130776C(v46 + OBJC_IVAR___APPCPromotedContentView_urlOpener, (uint64_t)v48);
    v35 = v49;
    v36 = v50;
    v45 = sub_1B12EE1E0(v48, v49);
    v37 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v47(v7, a1, v3);
    v38 = a1;
    v39 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    v40 = ((unint64_t)v5 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
    v41 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v41 + v39, v7, v3);
    *(_QWORD *)(v41 + v40) = v37;
    v42 = *(void (**)(uint64_t, void (*)(char), uint64_t, uint64_t, uint64_t))(v36 + 8);
    swift_retain();
    v42(v38, sub_1B134FEA4, v41, v35, v36);
    swift_release();
    swift_release();
    sub_1B12D4038((uint64_t)v48);
  }
}

void sub_1B134F124(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t ObjectType;
  uint64_t v24;

  v5 = a1 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x1B5E1B0F0](v5);
  if (v6)
  {
    v7 = (char *)v6;
    v24 = a3;
    v8 = a2;
    v9 = objc_msgSend(v8, sel_description);
    v10 = sub_1B1372B98();
    v12 = v11;

    sub_1B1372D84();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v13 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1B13757D0;
    v15 = objc_msgSend(*(id *)&v7[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
    v16 = sub_1B1372B98();
    v18 = v17;

    v19 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
    v20 = sub_1B12CE678();
    *(_QWORD *)(v14 + 32) = v16;
    *(_QWORD *)(v14 + 40) = v18;
    *(_QWORD *)(v14 + 96) = v19;
    *(_QWORD *)(v14 + 104) = v20;
    *(_QWORD *)(v14 + 64) = v20;
    *(_QWORD *)(v14 + 72) = v10;
    *(_QWORD *)(v14 + 80) = v12;
    sub_1B1372988();

    swift_bridgeObjectRelease();
    v21 = &v7[OBJC_IVAR___APPCPromotedContentView_interactionDelegate];
    if (MEMORY[0x1B5E1B0F0](&v7[OBJC_IVAR___APPCPromotedContentView_interactionDelegate]))
    {
      v22 = *((_QWORD *)v21 + 1);
      ObjectType = swift_getObjectType();
      (*(void (**)(id, uint64_t, uint64_t, uint64_t))(v22 + 16))(v8, v24, ObjectType, v22);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

void sub_1B134F334(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  v6 = sub_1B1371DC4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  if ((a1 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    sub_1B1371DAC();
    if (v10)
    {
      v11 = sub_1B1372BE0();
      v13 = v12;
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = 0;
      v13 = 0xE000000000000000;
    }
    v14 = sub_1B134C970(v11, v13, qword_1E62F56A8);
    swift_bridgeObjectRelease();
    swift_arrayDestroy();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    if ((v14 & 1) != 0)
    {
      type metadata accessor for SafariViewController();
      v15 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      v16 = (void *)sub_1B1371D88();
      v17 = objc_msgSend(v15, sel_initWithURL_, v16);

      swift_beginAccess();
      v18 = MEMORY[0x1B5E1B0F0](a3 + 16);
      if (v18)
      {
        v19 = (void *)v18;
        sub_1B134E978(v17);

      }
    }
  }
}

Swift::Void __swiftcall PromotedContentView.safariViewControllerDidFinish(_:)(SFSafariViewController *a1)
{
  id v1;

  sub_1B1372D84();
  sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
  v1 = (id)sub_1B1372F70();
  sub_1B1372988();

}

void *sub_1B134F64C(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  __int128 v14[2];
  uint64_t v15;
  void *v16;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  v16 = a2;
  sub_1B13728C8();
  v4 = a2;
  sub_1B12CF7F8(&qword_1EEF28680);
  if (swift_dynamicCast())
  {
    sub_1B131A1C8(v14, (uint64_t)v17);
    v5 = v18;
    v6 = v19;
    sub_1B12EE1E0(v17, v18);
    v7 = (void *)(*(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v6 + 16))(a1, &off_1E62F65B8, v5, v6);
    v8 = v7;
    if (v7)
      objc_msgSend(v7, sel_setModalPresentationStyle_, 5);
    sub_1B12D4038((uint64_t)v17);
  }
  else
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_1B12D0D40((uint64_t)v14, &qword_1EEF28688);
    if (qword_1ED389888 != -1)
      swift_once();
    v9 = sub_1B1372A48();
    sub_1B12E5A5C(v9, (uint64_t)qword_1ED38B7B0);
    v10 = sub_1B1372A30();
    v11 = sub_1B1372D90();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1B12B8000, v10, v11, "Tap action does not conform to OtherPresentableActions protocol.", v12, 2u);
      MEMORY[0x1B5E1B030](v12, -1, -1);
    }

    return 0;
  }
  return v8;
}

uint64_t sub_1B134F7EC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1B134F810(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_1B134E634(a1, a2, v2);
}

uint64_t sub_1B134F818()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B134F83C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1B13435B8(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_1B134F844(void *a1, uint64_t a2, uint64_t a3, char *a4)
{
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  char *v14;
  uint64_t inited;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _OWORD *v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  char v45;
  _QWORD *v46;
  uint64_t *v47;
  uint64_t v48;
  BOOL v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  char *v54;
  id v55;
  void *v56;
  uint64_t result;
  id v58;
  objc_super v59;
  uint64_t v60;
  int64_t v61;
  objc_super v62;
  _QWORD *v63;
  _OWORD v64[2];
  __int128 v65;
  uint64_t v66;

  v59.super_class = (Class)swift_getObjectType();
  v7 = &a4[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_actionResult];
  v8 = *MEMORY[0x1E0D81BC8];
  v9 = sub_1B137225C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v7, v8, v9);
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_actionDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_notificationObserver] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_notificationOpenObserver] = 0;
  v10 = &a4[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_backgroundedTime];
  v11 = sub_1B1371EB4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_storeProductViewController;
  v13 = objc_allocWithZone(MEMORY[0x1E0CD8070]);
  v14 = a4;
  *(_QWORD *)&a4[v12] = objc_msgSend(v13, sel_init);
  *(_QWORD *)&v14[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_adamIdentifier] = a1;
  sub_1B12CF7F8((uint64_t *)&unk_1EEF28670);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B1375550;
  *(_QWORD *)(inited + 32) = sub_1B1372B98();
  *(_QWORD *)(inited + 40) = v16;
  *(_QWORD *)(inited + 72) = sub_1B12CFA9C(0, &qword_1EEF27C58);
  *(_QWORD *)(inited + 48) = a1;
  v58 = a1;
  v17 = sub_1B131A380(inited);
  v18 = 0;
  v59.receiver = v14;
  v19 = (unint64_t *)&v14[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_storeProductInfo];
  *v19 = v17;
  v60 = a2 + 64;
  v20 = 1 << *(_BYTE *)(a2 + 32);
  v21 = -1;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  v22 = v21 & *(_QWORD *)(a2 + 64);
  v61 = (unint64_t)(v20 + 63) >> 6;
  while (1)
  {
    if (v22)
    {
      v24 = __clz(__rbit64(v22));
      v22 &= v22 - 1;
      v25 = v24 | (v18 << 6);
      goto LABEL_26;
    }
    v26 = v18 + 1;
    if (__OFADD__(v18, 1))
      goto LABEL_41;
    if (v26 >= v61)
      break;
    v27 = *(_QWORD *)(v60 + 8 * v26);
    ++v18;
    if (!v27)
    {
      v18 = v26 + 1;
      if (v26 + 1 >= v61)
        break;
      v27 = *(_QWORD *)(v60 + 8 * v18);
      if (!v27)
      {
        v18 = v26 + 2;
        if (v26 + 2 >= v61)
          break;
        v27 = *(_QWORD *)(v60 + 8 * v18);
        if (!v27)
        {
          v18 = v26 + 3;
          if (v26 + 3 >= v61)
            break;
          v27 = *(_QWORD *)(v60 + 8 * v18);
          if (!v27)
          {
            v18 = v26 + 4;
            if (v26 + 4 >= v61)
              break;
            v27 = *(_QWORD *)(v60 + 8 * v18);
            if (!v27)
            {
              v28 = v26 + 5;
              if (v28 >= v61)
                break;
              v27 = *(_QWORD *)(v60 + 8 * v28);
              if (!v27)
              {
                while (1)
                {
                  v18 = v28 + 1;
                  if (__OFADD__(v28, 1))
                    goto LABEL_42;
                  if (v18 >= v61)
                    goto LABEL_37;
                  v27 = *(_QWORD *)(v60 + 8 * v18);
                  ++v28;
                  if (v27)
                    goto LABEL_25;
                }
              }
              v18 = v28;
            }
          }
        }
      }
    }
LABEL_25:
    v22 = (v27 - 1) & v27;
    v25 = __clz(__rbit64(v27)) + (v18 << 6);
LABEL_26:
    v29 = 16 * v25;
    v30 = (uint64_t *)(*(_QWORD *)(a2 + 48) + v29);
    v32 = *v30;
    v31 = v30[1];
    v33 = (uint64_t *)(*(_QWORD *)(a2 + 56) + v29);
    v34 = *v33;
    v35 = v33[1];
    v66 = MEMORY[0x1E0DEA968];
    *(_QWORD *)&v65 = v34;
    *((_QWORD *)&v65 + 1) = v35;
    swift_beginAccess();
    sub_1B12C32CC(&v65, v64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v63 = (_QWORD *)*v19;
    v37 = v63;
    *v19 = 0x8000000000000000;
    v39 = sub_1B12D372C(v32, v31);
    v40 = v37[2];
    v41 = (v38 & 1) == 0;
    v42 = v40 + v41;
    if (__OFADD__(v40, v41))
    {
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    v43 = v38;
    if (v37[3] >= v42)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v46 = v63;
        if ((v38 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_1B136F734();
        v46 = v63;
        if ((v43 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_1B136AD28(v42, isUniquelyReferenced_nonNull_native);
      v44 = sub_1B12D372C(v32, v31);
      if ((v43 & 1) != (v45 & 1))
        goto LABEL_44;
      v39 = v44;
      v46 = v63;
      if ((v43 & 1) != 0)
      {
LABEL_4:
        v23 = (_OWORD *)(v46[7] + 32 * v39);
        sub_1B12D4038((uint64_t)v23);
        sub_1B12C32CC(v64, v23);
        goto LABEL_5;
      }
    }
    v46[(v39 >> 6) + 8] |= 1 << v39;
    v47 = (uint64_t *)(v46[6] + 16 * v39);
    *v47 = v32;
    v47[1] = v31;
    sub_1B12C32CC(v64, (_OWORD *)(v46[7] + 32 * v39));
    v48 = v46[2];
    v49 = __OFADD__(v48, 1);
    v50 = v48 + 1;
    if (v49)
      goto LABEL_40;
    v46[2] = v50;
    swift_bridgeObjectRetain();
LABEL_5:
    *v19 = (unint64_t)v46;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
LABEL_37:
  swift_release();

  v62 = v59;
  v51 = (char *)objc_msgSendSuper2(&v62, sel_init);
  v52 = OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_storeProductViewController;
  v53 = *(void **)&v51[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_storeProductViewController];
  v54 = v51;
  objc_msgSend(v53, sel_setDelegate_, v54);
  v55 = objc_msgSend(*(id *)&v51[v52], sel_view);
  if (v55)
  {
    v56 = v55;
    objc_msgSend(v55, sel_setAutoresizingMask_, 18);

    *(_QWORD *)&v54[OBJC_IVAR____TtC17PromotedContentUI21StoreProductRequester_actionDelegate + 8] = &off_1E62F65B8;
    swift_unknownObjectWeakAssign();
    return (uint64_t)v54;
  }
LABEL_43:
  __break(1u);
LABEL_44:
  result = sub_1B1373270();
  __break(1u);
  return result;
}

uint64_t sub_1B134FDBC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B134FDE8()
{
  uint64_t v0;

  sub_1B134E934(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1B134FDF0()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_1B134FE24()
{
  uint64_t v0;

  sub_1B134F124(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1B134FE30()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1B1371DC4();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

void sub_1B134FEA4(char a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(sub_1B1371DC4() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_1B134F334(a1, v1 + v4, *(_QWORD *)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)));
}

unint64_t sub_1B134FEF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEF27210;
  if (!qword_1EEF27210)
  {
    type metadata accessor for OpenURLOptionsKey(255);
    result = MEMORY[0x1B5E1AF70](&unk_1B13753A4, v1);
    atomic_store(result, (unint64_t *)&qword_1EEF27210);
  }
  return result;
}

unint64_t sub_1B134FF3C()
{
  unint64_t result;

  result = qword_1EEF28690[0];
  if (!qword_1EEF28690[0])
  {
    result = MEMORY[0x1B5E1AF70](MEMORY[0x1E0DEF098], MEMORY[0x1E0DEF040]);
    atomic_store(result, qword_1EEF28690);
  }
  return result;
}

uint64_t sub_1B134FF88()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for WeakObj(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B12BF924(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WeakObj);
}

uint64_t _s17PromotedContentUI15WeakMetricsViewCMa_0()
{
  return objc_opt_self();
}

double sub_1B134FFF4()
{
  uint64_t v0;
  uint64_t v1;
  double result;

  type metadata accessor for MetricsViewTracker();
  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_1B131BFF4(MEMORY[0x1E0DEE9D8]);
  v1 = sub_1B1350FA8(0, 3);
  *(_QWORD *)(v0 + 24) = 3;
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)&result = 2;
  *(_OWORD *)(v0 + 40) = xmmword_1B1378490;
  qword_1ED38B748 = v0;
  return result;
}

void sub_1B1350058(void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t *v7;
  char v8;
  char isUniquelyReferenced_nonNull_native;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD *v14;
  void (*v15)(_QWORD *);
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[4];
  uint64_t v34;

  v3 = v2;
  v6 = sub_1B1372EB0();
  v7 = v2 + 2;
  swift_beginAccess();
  if (!*(_QWORD *)(v2[2] + 16) || (sub_1B12BA870(v6), (v8 & 1) == 0))
  {
    swift_endAccess();
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v34 = *v7;
    *v7 = 0x8000000000000000;
    sub_1B136C800(MEMORY[0x1E0DEE9D8], v6, isUniquelyReferenced_nonNull_native);
    *v7 = v34;
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  sub_1B1372D9C();
  sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
  v10 = (void *)sub_1B1372F70();
  sub_1B12CF7F8(&qword_1ED3899B0);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1B13757D0;
  *(_QWORD *)(v11 + 56) = type metadata accessor for MetricsView();
  *(_QWORD *)(v11 + 64) = sub_1B13510A4();
  *(_QWORD *)(v11 + 32) = a2;
  *(_QWORD *)(v11 + 96) = sub_1B12CFA9C(0, &qword_1ED387F18);
  *(_QWORD *)(v11 + 104) = sub_1B13510EC();
  *(_QWORD *)(v11 + 72) = a1;
  v12 = a2;
  v13 = a1;
  sub_1B1372988();

  swift_bridgeObjectRelease();
  if (sub_1B1350538(v6, v12))
    goto LABEL_9;
  swift_beginAccess();
  v15 = sub_1B134AE30(v33, v6);
  if (!*v14)
    goto LABEL_8;
  v16 = v14;
  _s17PromotedContentUI15WeakMetricsViewCMa_0();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  v17 = swift_unknownObjectWeakAssign();
  MEMORY[0x1B5E1A310](v17);
  if (*(_QWORD *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    goto LABEL_31;
  while (1)
  {
    sub_1B1372CC4();
    sub_1B1372CA0();
LABEL_8:
    ((void (*)(_QWORD *, _QWORD))v15)(v33, 0);
    swift_endAccess();
LABEL_9:
    v15 = (void (*)(_QWORD *))(v3 + 3);
    swift_beginAccess();
    v18 = v3[5];
    if ((v18 & 0x8000000000000000) != 0)
    {
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v19 = v3[4];
    if (v18 >= *(_QWORD *)(v19 + 16))
      goto LABEL_26;
    if (!*(_QWORD *)(v19 + 8 * v18 + 32))
    {
      sub_1B12CF7F8(&qword_1ED388DD0);
      v20 = swift_allocObject();
      swift_unknownObjectWeakInit();
      swift_unknownObjectWeakAssign();
      swift_beginAccess();
      sub_1B1350788(v20);
      swift_endAccess();
      swift_release();
      v18 = v3[5];
      if ((v18 & 0x8000000000000000) != 0)
        goto LABEL_27;
      v19 = v3[4];
    }
    if (v18 >= *(_QWORD *)(v19 + 16))
      goto LABEL_28;
    v21 = *(_QWORD *)(v19 + 8 * v18 + 32);
    if (v21)
    {
      v22 = MEMORY[0x1B5E1B0F0](v21 + 16);
      if (v22)
      {
        v23 = (void *)v22;
        v24 = v13;
        v25 = v23;
        LOBYTE(v23) = sub_1B1372EA4();

        if ((v23 & 1) != 0)
          return;
      }
    }
    v26 = v3[6];
    if ((v26 & 0x8000000000000000) != 0)
      goto LABEL_29;
    v27 = v3[4];
    if (v26 < *(_QWORD *)(v27 + 16))
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    sub_1B1372CAC();
  }
  v28 = *(_QWORD *)(v27 + 8 * v26 + 32);
  if (v28 && (v29 = (void *)MEMORY[0x1B5E1B0F0](v28 + 16)) != 0)
  {
    v30 = v29;
    sub_1B1350860(v29);
    sub_1B12CF7F8(&qword_1ED388DD0);
    v31 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakAssign();
    swift_beginAccess();
    sub_1B1350788(v31);
    swift_endAccess();
    swift_release();

  }
  else
  {
    sub_1B12CF7F8(&qword_1ED388DD0);
    v32 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakAssign();
    swift_beginAccess();
    sub_1B1350788(v32);
    swift_endAccess();
    swift_release();
  }
}

BOOL sub_1B1350538(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  char v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v22;

  swift_beginAccess();
  v4 = *(_QWORD *)(v2 + 16);
  if (*(_QWORD *)(v4 + 16) && (v5 = sub_1B12BA870(a1), (v6 & 1) != 0))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v5);
    swift_endAccess();
    v22 = MEMORY[0x1E0DEE9D8];
    if (v7 >> 62)
      goto LABEL_21;
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    v9 = a2;
    swift_bridgeObjectRetain();
    for (; v8; v8 = sub_1B137318C())
    {
      v10 = 0;
      while (1)
      {
        if ((v7 & 0xC000000000000001) != 0)
        {
          v11 = MEMORY[0x1B5E1A7A8](v10, v7);
          v12 = v10 + 1;
          if (__OFADD__(v10, 1))
          {
LABEL_17:
            __break(1u);
            goto LABEL_18;
          }
          goto LABEL_11;
        }
        if (v10 >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
          break;
        v11 = *(_QWORD *)(v7 + 8 * v10 + 32);
        swift_retain();
        v12 = v10 + 1;
        if (__OFADD__(v10, 1))
          goto LABEL_17;
LABEL_11:
        v13 = MEMORY[0x1B5E1B0F0](v11 + 16);
        if (!v13)
          goto LABEL_6;
        v14 = (void *)v13;
        type metadata accessor for MetricsView();
        v15 = a2;
        v16 = v14;
        LOBYTE(v14) = sub_1B1372EA4();

        if ((v14 & 1) != 0)
        {
          sub_1B137312C();
          sub_1B1373144();
          sub_1B1373150();
          sub_1B1373138();
        }
        else
        {
LABEL_6:
          swift_release();
        }
        ++v10;
        if (v12 == v8)
        {
          v18 = v22;
          goto LABEL_23;
        }
      }
      __break(1u);
LABEL_21:
      v19 = a2;
      swift_bridgeObjectRetain();
    }
    v18 = MEMORY[0x1E0DEE9D8];
LABEL_23:
    swift_bridgeObjectRelease();

    if (v18 < 0 || (v18 & 0x4000000000000000) != 0)
      v20 = sub_1B137318C();
    else
      v20 = *(_QWORD *)(v18 + 16);
    swift_release();
    return v20 != 0;
  }
  else
  {
LABEL_18:
    swift_endAccess();
    return 0;
  }
}

uint64_t sub_1B1350788(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v2 = v1[2];
  v3 = __OFADD__(v2, 1);
  v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
    goto LABEL_12;
  }
  v5 = *v1;
  if (!*v1)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v4 == 0x8000000000000000 && v5 == -1)
    goto LABEL_16;
  v7 = result;
  v8 = v4 % v5;
  v9 = v1[1];
  v1[2] = v4 % v5;
  swift_retain();
  result = swift_isUniquelyReferenced_nonNull_native();
  v1[1] = v9;
  if ((result & 1) == 0)
LABEL_13:
    sub_1B1320160();
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v8 < *(_QWORD *)(v9 + 16))
  {
    swift_release();
    *(_QWORD *)(v9 + 8 * v8 + 32) = v7;
    result = sub_1B1372CA0();
    v1[3] = (uint64_t)(v8 + 1) % v5;
    return result;
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_1B1350860(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  _QWORD *v22;
  unsigned __int8 v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t result;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *i;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;

  v2 = v1;
  v4 = sub_1B1372EB0();
  v5 = (uint64_t *)(v1 + 16);
  swift_beginAccess();
  v6 = *(_QWORD *)(v1 + 16);
  if (*(_QWORD *)(v6 + 16) && (v7 = sub_1B12BA870(v4), (v8 & 1) != 0))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
    v46 = v9;
    swift_endAccess();
    if (v9 >> 62)
      goto LABEL_35;
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    for (i = (uint64_t *)(v2 + 16); v10; i = v5)
    {
      if (v10 < 1)
        goto LABEL_49;
      v5 = (uint64_t *)v10;
      v11 = 0;
      v12 = 0;
      v44 = v9 & 0xC000000000000001;
      v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v42 = v9;
      v43 = v10;
      while (1)
      {
        if (v44)
        {
          v14 = MEMORY[0x1B5E1A7A8](v12, v9);
        }
        else
        {
          v14 = *(_QWORD *)(v9 + 8 * v12 + 32);
          swift_retain();
        }
        v15 = MEMORY[0x1B5E1B0F0](v14 + 16);
        if (v15)
          break;
        swift_release();
LABEL_8:
        if (v5 == (uint64_t *)++v12)
          goto LABEL_37;
      }
      v16 = (_QWORD *)v15;
      v17 = OBJC_IVAR___APPCMetricsView_promotedContent;
      v18 = objc_msgSend(objc_msgSend(*(id *)(v15 + OBJC_IVAR___APPCMetricsView_promotedContent), sel_metricsHelper), sel_hasBeenOnScreen);
      v19 = swift_unknownObjectRelease();
      if (v18)
      {
        v20 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v16) + 0x408);
        v21 = v20(v19);
        if (!v21)
        {
          swift_release();
          v5 = (uint64_t *)v43;
          goto LABEL_31;
        }
        v22 = (_QWORD *)v21;
        type metadata accessor for WebAdView();
        if (!swift_dynamicCastClass())
        {
          swift_release();

          v16 = v22;
          goto LABEL_20;
        }

        v23 = objc_msgSend(objc_msgSend(*(id *)((char *)v16 + v17), sel_metricsHelper), sel_isCurrentlyOnScreen);
        v24 = swift_unknownObjectRelease();
        if ((v23 & 1) != 0)
        {
          swift_release();
LABEL_20:
          v9 = v42;
          v5 = (uint64_t *)v43;
          goto LABEL_31;
        }
        v25 = v20(v24);
        if (v25)
        {
          v26 = (void *)v25;
          if (swift_dynamicCastClass())
          {
            objc_msgSend(v16, sel_setReady_, 0);
            sub_1B13643C4();
            objc_msgSend(v16, sel_collapse);
          }

        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v13 = sub_1B12EB454(0, v13[2] + 1, 1, v13);
        v9 = v42;
        v5 = (uint64_t *)v43;
        v28 = v13[2];
        v27 = v13[3];
        if (v28 >= v27 >> 1)
          v13 = sub_1B12EB454((_QWORD *)(v27 > 1), v28 + 1, 1, v13);
        v13[2] = v28 + 1;
        v13[v28 + 4] = v11;
      }
      swift_release();
LABEL_31:

      if (!__OFADD__(v11++, 1))
        goto LABEL_8;
      __break(1u);
LABEL_35:
      swift_bridgeObjectRetain_n();
      v10 = sub_1B137318C();
    }
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
LABEL_37:
    swift_bridgeObjectRelease();
    v34 = v13[2];
    if (v34)
    {
      while (v34 <= v13[2])
      {
        v35 = v13[v34 + 3];
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || (v46 & 0x8000000000000000) != 0
          || (v46 & 0x4000000000000000) != 0)
        {
          sub_1B132015C(v46);
        }
        v36 = *(_QWORD *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v35 >= v36)
          goto LABEL_48;
        v37 = v36 - 1;
        v38 = v36 - 1 - v35;
        if (v38 < 0)
          goto LABEL_50;
        --v34;
        memmove((void *)((v46 & 0xFFFFFFFFFFFFFF8) + 8 * v35 + 32), (const void *)((v46 & 0xFFFFFFFFFFFFFF8) + 8 * v35 + 40), 8 * v38);
        *(_QWORD *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10) = v37;
        sub_1B1372CA0();
        swift_release();
        if (!v34)
          goto LABEL_46;
      }
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      result = sub_1B13731C8();
      __break(1u);
    }
    else
    {
LABEL_46:
      swift_bridgeObjectRelease();
      v39 = sub_1B1372EB0();
      swift_beginAccess();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v45 = *i;
      *i = 0x8000000000000000;
      sub_1B136C800(v46, v39, isUniquelyReferenced_nonNull_native);
      *i = v45;
      swift_bridgeObjectRelease();
      return swift_endAccess();
    }
  }
  else
  {
    swift_endAccess();
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v30 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_1B1375550;
    *(_QWORD *)(v31 + 56) = sub_1B12CFA9C(0, &qword_1ED387F18);
    *(_QWORD *)(v31 + 64) = sub_1B13510EC();
    *(_QWORD *)(v31 + 32) = a1;
    v32 = a1;
    sub_1B1372988();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1B1350DEC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MetricsViewTracker()
{
  return objc_opt_self();
}

uint64_t sub_1B1350E38()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1B1350E40()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B1350E48(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_1B1350E7C(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t sub_1B1350ED8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t sub_1B1350F14(uint64_t a1, int a2)
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

uint64_t sub_1B1350F5C(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for DistanceTracker(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B12BF924(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DistanceTracker);
}

uint64_t sub_1B1350FA8(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;
  _QWORD *v8;

  if (a2 < 0)
  {
    result = sub_1B1373168();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      sub_1B12CF7F8(&qword_1ED388DD8);
      v4 = (_QWORD *)sub_1B1372CB8();
      v4[2] = a2;
      v8 = v4;
      v4[4] = a1;
      if (a2 != 1)
      {
        v4[5] = a1;
        v5 = a2 - 2;
        if (v5)
        {
          v6 = v4 + 6;
          do
          {
            *v6++ = a1;
            swift_retain();
            --v5;
          }
          while (v5);
        }
        swift_retain();
      }
    }
    else
    {
      v8 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      swift_release();
    }
    sub_1B1372CA0();
    return (uint64_t)v8;
  }
  return result;
}

unint64_t sub_1B13510A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED388A70;
  if (!qword_1ED388A70)
  {
    v1 = type metadata accessor for MetricsView();
    result = MEMORY[0x1B5E1AF70](MEMORY[0x1E0DEFD08], v1);
    atomic_store(result, (unint64_t *)&qword_1ED388A70);
  }
  return result;
}

unint64_t sub_1B13510EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED388E58;
  if (!qword_1ED388E58)
  {
    v1 = sub_1B12CFA9C(255, &qword_1ED387F18);
    result = MEMORY[0x1B5E1AF70](MEMORY[0x1E0DEFD08], v1);
    atomic_store(result, (unint64_t *)&qword_1ED388E58);
  }
  return result;
}

id sub_1B1351148()
{
  id result;

  sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389890);
  result = sub_1B12EF1B4();
  byte_1ED38B698 = result & 1;
  return result;
}

void sub_1B135118C(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, const char *a5, void (*a6)(_QWORD, _QWORD), uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  NSObject *v45;
  os_signpost_type_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  char *v50;
  char *v51;
  uint64_t v52;
  id v53;
  id v54;
  NSObject *v55;
  os_signpost_type_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  void (*v61)(_QWORD, _QWORD);
  unint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  os_signpost_id_t v71;
  void (*v72)(char *, uint64_t);
  void (*v73)(_QWORD, _QWORD);
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint8_t *v77;
  os_signpost_id_t v78;
  void (*v79)(char *, uint64_t);
  uint64_t v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  const char *v87;
  void (*v88)(_QWORD, _QWORD);
  uint64_t v89;
  uint64_t v90[2];

  v84 = a7;
  v87 = a5;
  v88 = a6;
  v12 = sub_1B1371DC4();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x1E0C80A78](v12);
  v15 = sub_1B13729F4();
  v80 = *(_QWORD *)(v15 - 8);
  v81 = v15;
  v16 = MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v80 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v83 = (char *)&v80 - v19;
  v20 = sub_1B13729B8();
  v85 = *(_QWORD *)(v20 - 8);
  v21 = MEMORY[0x1E0C80A78](v20);
  v23 = (char *)&v80 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x1E0C80A78](v21);
  v82 = (char *)&v80 - v25;
  v26 = MEMORY[0x1E0C80A78](v24);
  v86 = (char *)&v80 - v27;
  if (a4)
  {
    v28 = v26;
    v29 = a4;
    if (qword_1ED389888 != -1)
      swift_once();
    v30 = sub_1B1372A48();
    sub_1B12E5A5C(v30, (uint64_t)qword_1ED38B7B0);
    v31 = a4;
    v32 = a4;
    v33 = sub_1B1372A30();
    v34 = sub_1B1372D90();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      v90[0] = v36;
      *(_DWORD *)v35 = 136315138;
      swift_getErrorValue();
      v37 = sub_1B137327C();
      v89 = sub_1B12D5A94(v37, v38, v90);
      sub_1B1372FA0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1B12B8000, v33, v34, "Failed to fetch image with error: %s.", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E1B030](v36, -1, -1);
      MEMORY[0x1B5E1B030](v35, -1, -1);
    }
    else
    {

    }
    v50 = v86;
    v51 = v83;
    if (qword_1ED387BF8 != -1)
      swift_once();
    v52 = sub_1B13729E8();
    sub_1B12E5A5C(v52, (uint64_t)qword_1ED38B680);
    v53 = a4;
    v54 = a4;
    v55 = sub_1B13729D0();
    sub_1B1372A00();
    v56 = sub_1B1372E38();
    if ((sub_1B1372F58() & 1) != 0)
    {
      swift_retain();
      sub_1B1372A24();
      swift_release();
      v58 = v80;
      v57 = v81;
      if ((*(unsigned int (**)(char *, uint64_t))(v80 + 88))(v51, v81) == *MEMORY[0x1E0DF2190])
      {
        v59 = 0;
        v60 = 0;
        v87 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v58 + 8))(v51, v57);
        v87 = "Finished with error: %s.";
        v60 = 2;
        v59 = 1;
      }
      v65 = v85;
      v66 = v82;
      (*(void (**)(char *, char *, uint64_t))(v85 + 16))(v82, v50, v28);
      v67 = swift_slowAlloc();
      v68 = swift_slowAlloc();
      v90[0] = v68;
      *(_BYTE *)v67 = v60;
      *(_BYTE *)(v67 + 1) = v59;
      *(_WORD *)(v67 + 2) = 2080;
      swift_getErrorValue();
      v69 = sub_1B137327C();
      v89 = sub_1B12D5A94(v69, v70, v90);
      sub_1B1372FA0();
      swift_bridgeObjectRelease();

      v71 = sub_1B13729A0();
      _os_signpost_emit_with_name_impl(&dword_1B12B8000, v55, v56, v71, "ImageRequester.loadImage", v87, (uint8_t *)v67, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E1B030](v68, -1, -1);
      MEMORY[0x1B5E1B030](v67, -1, -1);

      v72 = *(void (**)(char *, uint64_t))(v65 + 8);
      v72(v86, v28);
      v72(v66, v28);
      v61 = v88;
      if (!v88)
        goto LABEL_28;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v85 + 8))(v50, v28);
      v61 = v88;
      if (!v88)
        goto LABEL_28;
    }
    v61(0, 0);
LABEL_28:

    return;
  }
  if (a2 >> 60 != 15)
  {
    v86 = (char *)sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389980);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a8, v12);
    v62 = (*(unsigned __int8 *)(v13 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    v63 = (char *)swift_allocObject();
    *((_QWORD *)v63 + 2) = a1;
    *((_QWORD *)v63 + 3) = a2;
    v64 = (uint64_t)v88;
    *((_QWORD *)v63 + 4) = v87;
    *((_QWORD *)v63 + 5) = v64;
    *((_QWORD *)v63 + 6) = v84;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v63[v62], (char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v12);
    sub_1B1353190(a1, a2);
    swift_retain();
    sub_1B1353190(a1, a2);
    sub_1B12EACC0(v64);
    sub_1B1372DCC();
    sub_1B13530B8(a1, a2);
    swift_release();
    return;
  }
  v39 = v26;
  if (qword_1ED389888 != -1)
    swift_once();
  v40 = sub_1B1372A48();
  sub_1B12E5A5C(v40, (uint64_t)qword_1ED38B7B0);
  v41 = sub_1B1372A30();
  v42 = sub_1B1372D90();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v43 = 0;
    _os_log_impl(&dword_1B12B8000, v41, v42, "Failed to fetch image.", v43, 2u);
    MEMORY[0x1B5E1B030](v43, -1, -1);
  }

  if (qword_1ED387BF8 != -1)
    swift_once();
  v44 = sub_1B13729E8();
  sub_1B12E5A5C(v44, (uint64_t)qword_1ED38B680);
  v45 = sub_1B13729D0();
  sub_1B1372A00();
  v46 = sub_1B1372E38();
  if ((sub_1B1372F58() & 1) != 0)
  {
    swift_retain();
    sub_1B1372A24();
    swift_release();
    v48 = v80;
    v47 = v81;
    if ((*(unsigned int (**)(char *, uint64_t))(v80 + 88))(v18, v81) == *MEMORY[0x1E0DF2190])
    {
      v49 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v48 + 8))(v18, v47);
      v49 = "Finished with error.";
    }
    v74 = v85;
    v75 = v82;
    v76 = v39;
    (*(void (**)(char *, char *, uint64_t))(v85 + 16))(v82, v23, v39);
    v77 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v77 = 0;
    v78 = sub_1B13729A0();
    _os_signpost_emit_with_name_impl(&dword_1B12B8000, v45, v46, v78, "ImageRequester.loadImage", v49, v77, 2u);
    MEMORY[0x1B5E1B030](v77, -1, -1);

    v79 = *(void (**)(char *, uint64_t))(v74 + 8);
    v79(v23, v76);
    v79(v75, v76);
    v73 = v88;
    if (v88)
      goto LABEL_34;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v85 + 8))(v23, v39);
    v73 = v88;
    if (v88)
LABEL_34:
      v73(0, 0);
  }
}

void sub_1B1351A38(uint64_t a1, unint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t), char *a6)
{
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  char *v35;
  int v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  char *v48;
  int v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  char *v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  void (**v65)(uint64_t, uint64_t);
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t, uint64_t);
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD aBlock[7];

  v82 = a6;
  v85 = a5;
  v86 = a4;
  v88 = a3;
  v77 = sub_1B1371DC4();
  v8 = *(_QWORD *)(v77 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x1E0C80A78](v77);
  v76 = (char *)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1B13729F4();
  v78 = *(_QWORD *)(v10 - 8);
  v79 = v10;
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v74 = (char *)&v73 - v14;
  v15 = sub_1B13729B8();
  v83 = *(_QWORD *)(v15 - 8);
  v84 = v15;
  v16 = MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x1E0C80A78](v16);
  v21 = (char *)&v73 - v20;
  v22 = MEMORY[0x1E0C80A78](v19);
  v75 = (char *)&v73 - v23;
  MEMORY[0x1E0C80A78](v22);
  v81 = (char *)&v73 - v24;
  v25 = objc_allocWithZone(MEMORY[0x1E0DC3870]);
  v80 = a2 >> 62;
  sub_1B13531A4(a1, a2);
  v26 = (void *)sub_1B1371DD0();
  v27 = objc_msgSend(v25, sel_initWithData_, v26);
  v89 = a1;
  v87 = a2;
  sub_1B12CE094(a1, a2);

  if (v27)
  {
    if (qword_1ED388AB0 != -1)
      swift_once();
    if (byte_1ED38B698 == 1)
    {
      type metadata accessor for ImageCache();
      swift_initStaticObject();
      v77 = (uint64_t)v27;
      v28 = v27;
      v29 = sub_1B1352900();
      v30 = (void *)sub_1B1371D88();
      objc_msgSend(v29, sel_setObject_forKey_cost_, v28, v30, 1);

      if (qword_1ED387BF8 != -1)
        swift_once();
      v31 = sub_1B13729E8();
      sub_1B12E5A5C(v31, (uint64_t)qword_1ED38B680);
      v32 = v89;
      v33 = v87;
      sub_1B13531A4(v89, v87);
      v34 = (void *)sub_1B13729D0();
      v35 = v81;
      sub_1B1372A00();
      v36 = sub_1B1372E38();
      v37 = sub_1B1372F58();
      v39 = v83;
      v38 = v84;
      if ((v37 & 1) != 0)
      {
        LODWORD(v82) = v36;
        swift_retain();
        v40 = v74;
        sub_1B1372A24();
        swift_release();
        v42 = v78;
        v41 = v79;
        if ((*(unsigned int (**)(char *, uint64_t))(v78 + 88))(v40, v79) == *MEMORY[0x1E0DF2190])
        {
          v43 = 0;
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v42 + 8))(v40, v41);
          v43 = 1;
        }
        (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v75, v35, v38);
        v70 = swift_slowAlloc();
        *(_BYTE *)v70 = 0;
        *(_BYTE *)(v70 + 1) = v43;
        *(_WORD *)(v70 + 2) = 2048;
        __asm { BR              X11 }
      }

      sub_1B12CE094(v32, v33);
      (*(void (**)(char *, uint64_t))(v39 + 8))(v35, v38);
      v71 = v86;
      v72 = v77;
      if (v86)
      {
        v28 = v28;
        v71(v72, 1);

      }
    }
    else
    {
      v57 = v76;
      v56 = v77;
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v76, v82, v77);
      v58 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v59 = (v9 + v58 + 7) & 0xFFFFFFFFFFFFFFF8;
      v60 = (v59 + 15) & 0xFFFFFFFFFFFFFFF8;
      v61 = swift_allocObject();
      (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v61 + v58, v57, v56);
      v62 = v87;
      *(_QWORD *)(v61 + v59) = v88;
      v63 = (_QWORD *)(v61 + v60);
      v64 = v89;
      *v63 = v89;
      v63[1] = v62;
      v65 = (void (**)(uint64_t, uint64_t))(v61 + ((v60 + 23) & 0xFFFFFFFFFFFFFFF8));
      v67 = v85;
      v66 = (uint64_t)v86;
      *v65 = v86;
      v65[1] = v67;
      aBlock[4] = sub_1B135328C;
      aBlock[5] = v61;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1B13010E0;
      aBlock[3] = &unk_1E62F9310;
      v68 = _Block_copy(aBlock);
      sub_1B13531A4(v64, v62);
      swift_retain();
      sub_1B12EACC0(v66);
      swift_release();
      objc_msgSend(v27, sel_prepareForDisplayWithCompletionHandler_, v68);

      _Block_release(v68);
    }
  }
  else
  {
    v81 = v18;
    v82 = v21;
    if (qword_1ED387BF8 != -1)
      swift_once();
    v44 = sub_1B13729E8();
    sub_1B12E5A5C(v44, (uint64_t)qword_1ED38B680);
    v45 = v89;
    v46 = v87;
    sub_1B13531A4(v89, v87);
    v47 = (void *)sub_1B13729D0();
    v48 = v82;
    sub_1B1372A00();
    v49 = sub_1B1372E38();
    v50 = sub_1B1372F58();
    v52 = v83;
    v51 = v84;
    if ((v50 & 1) != 0)
    {
      LODWORD(v77) = v49;
      swift_retain();
      sub_1B1372A24();
      swift_release();
      v54 = v78;
      v53 = v79;
      if ((*(unsigned int (**)(char *, uint64_t))(v78 + 88))(v13, v79) == *MEMORY[0x1E0DF2190])
      {
        v55 = 0;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v54 + 8))(v13, v53);
        v55 = 1;
      }
      (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v81, v48, v51);
      v69 = swift_slowAlloc();
      *(_BYTE *)v69 = 0;
      *(_BYTE *)(v69 + 1) = v55;
      *(_WORD *)(v69 + 2) = 2048;
      __asm { BR              X11 }
    }

    sub_1B12CE094(v45, v46);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v48, v51);
    if (v86)
      v86(0, 0);
  }
}

uint64_t sub_1B13522C8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  _QWORD v27[2];
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v30 = a6;
  v31 = a7;
  v28 = a4;
  v29 = a5;
  v10 = sub_1B1371DC4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27[1] = sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389980);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, v10);
  v14 = (*(unsigned __int8 *)(v11 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v15 = (v12 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  v16 = (v15 + 15) & 0xFFFFFFFFFFFFFFF8;
  v17 = (v16 + 23) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a1;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v18 + v14, v13, v10);
  *(_QWORD *)(v18 + v15) = a3;
  v19 = (uint64_t *)(v18 + v16);
  v21 = v28;
  v20 = v29;
  *v19 = v28;
  v19[1] = v20;
  v22 = (uint64_t *)(v18 + v17);
  v24 = v30;
  v23 = v31;
  *v22 = v30;
  v22[1] = v23;
  v25 = a1;
  swift_retain();
  sub_1B13531A4(v21, v20);
  sub_1B12EACC0(v24);
  sub_1B1372DCC();
  return swift_release();
}

uint64_t sub_1B1352438(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t (*a6)(void *, uint64_t), uint64_t a7)
{
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  char v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  char v34;
  uint64_t result;
  uint64_t v36;
  _DWORD v37[2];
  void *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t (*v42)(void *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v40 = a7;
  v42 = a6;
  v39 = sub_1B13729F4();
  v43 = *(_QWORD *)(v39 - 8);
  MEMORY[0x1E0C80A78](v39);
  v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1B13729B8();
  v44 = *(_QWORD *)(v12 - 8);
  v45 = v12;
  v13 = MEMORY[0x1E0C80A78](v12);
  v41 = (char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)v37 - v15;
  type metadata accessor for ImageCache();
  swift_initStaticObject();
  if (a1)
  {
    v17 = a1;
    v18 = a4;
    v19 = a5;
    v20 = a1;
    v21 = sub_1B1352900();
    v22 = (void *)sub_1B1371D88();
    objc_msgSend(v21, sel_setObject_forKey_cost_, v20, v22, 1);

    a5 = v19;
    a4 = v18;
  }
  else
  {
    v17 = 0;
    v21 = sub_1B1352900();
    v22 = (void *)sub_1B1371D88();
    objc_msgSend(v21, sel_removeObjectForKey_, v22);
  }

  if (qword_1ED387BF8 != -1)
    swift_once();
  v23 = sub_1B13729E8();
  sub_1B12E5A5C(v23, (uint64_t)qword_1ED38B680);
  sub_1B13531A4(a4, a5);
  v24 = (void *)sub_1B13729D0();
  sub_1B1372A00();
  v25 = sub_1B1372E38();
  v26 = sub_1B1372F58();
  v27 = a5;
  v28 = v43;
  v29 = v44;
  if ((v26 & 1) != 0)
  {
    v37[1] = v25;
    v38 = v17;
    v30 = v27 >> 62;
    swift_retain();
    sub_1B1372A24();
    swift_release();
    v31 = v39;
    v32 = (*(uint64_t (**)(char *, uint64_t))(v28 + 88))(v11, v39);
    v33 = v45;
    if (v32 == *MEMORY[0x1E0DF2190])
    {
      v34 = 0;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v31);
      v34 = 1;
    }
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v41, v16, v33);
    v36 = swift_slowAlloc();
    *(_BYTE *)v36 = 0;
    *(_BYTE *)(v36 + 1) = v34;
    *(_WORD *)(v36 + 2) = 2048;
    __asm { BR              X11 }
  }

  sub_1B12CE094(a4, v27);
  result = (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v16, v45);
  if (v42)
    return v42(v17, 1);
  return result;
}

uint64_t sub_1B1352830(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  void (*v7)(void *, unint64_t, void *, void *);
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;

  v6 = a2;
  v7 = *(void (**)(void *, unint64_t, void *, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v8 = v6;
    v6 = (void *)sub_1B1371DE8();
    v10 = v9;

  }
  else
  {
    swift_retain();
    v10 = 0xF000000000000000;
  }
  v11 = a3;
  v12 = a4;
  v7(v6, v10, a3, a4);

  sub_1B13530B8((uint64_t)v6, v10);
  return swift_release();
}

uint64_t type metadata accessor for ImageRequester()
{
  return objc_opt_self();
}

id sub_1B1352900()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    v2 = *(id *)(v0 + 16);
  }
  else
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D38]), sel_init);
    objc_msgSend(v3, sel_setCountLimit_, 50);
    v4 = *(void **)(v0 + 16);
    *(_QWORD *)(v0 + 16) = v3;
    v2 = v3;

    v1 = 0;
  }
  v5 = v1;
  return v2;
}

uint64_t sub_1B135297C()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ImageCache()
{
  return objc_opt_self();
}

id sub_1B13529C0(uint64_t a1, void (*a2)(id, uint64_t), uint64_t a3)
{
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_signpost_type_t v21;
  char v22;
  void (*v23)(char *, char *, uint64_t);
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint8_t *v29;
  os_signpost_id_t v30;
  uint8_t *v31;
  void (*v32)(char *, uint64_t);
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  NSObject *v38;
  char *v39;
  int v40;
  char *v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  void (*v54)(char *, uint64_t);
  char *v55;
  uint8_t *v56;
  os_signpost_id_t v57;
  char *v58;
  void (*v59)(id, uint64_t);
  id v60;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  void (*v73)(id, uint64_t);
  _QWORD aBlock[6];

  v69 = a3;
  v5 = sub_1B1371DC4();
  v67 = *(_QWORD *)(v5 - 8);
  v68 = v5;
  MEMORY[0x1E0C80A78](v5);
  v65 = v6;
  v66 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = sub_1B13729F4();
  v7 = *(_QWORD *)(v64 - 8);
  MEMORY[0x1E0C80A78](v64);
  v63 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1B13729B8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v70 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v62 - v14;
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v62 - v16;
  if (qword_1ED387BF8 != -1)
    swift_once();
  v73 = a2;
  v18 = sub_1B13729E8();
  v19 = sub_1B12E5A5C(v18, (uint64_t)qword_1ED38B680);
  sub_1B13729D0();
  sub_1B1372994();
  v20 = sub_1B13729D0();
  v21 = sub_1B1372E44();
  v22 = sub_1B1372F58();
  v72 = v10;
  if ((v22 & 1) != 0)
  {
    v62 = v19;
    v23 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
    v23(v15, v17, v9);
    v24 = v15;
    v25 = v7;
    v26 = v9;
    v27 = a1;
    v28 = v17;
    v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v29 = 0;
    v30 = sub_1B13729A0();
    _os_signpost_emit_with_name_impl(&dword_1B12B8000, v20, v21, v30, "ImageRequester.loadImage", "", v29, 2u);
    v31 = v29;
    v17 = v28;
    a1 = v27;
    v9 = v26;
    v7 = v25;
    v15 = v24;
    MEMORY[0x1B5E1B030](v31, -1, -1);

    v32 = *(void (**)(char *, uint64_t))(v10 + 8);
    v33 = v23;
    v32(v24, v9);
  }
  else
  {

    v33 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  }
  v71 = v17;
  v33(v15, v17, v9);
  sub_1B1372A18();
  swift_allocObject();
  v34 = sub_1B1372A0C();
  type metadata accessor for ImageCache();
  swift_initStaticObject();
  v35 = sub_1B1352900();
  v36 = (void *)sub_1B1371D88();
  v37 = objc_msgSend(v35, sel_objectForKey_, v36);

  if (v37)
  {
    v38 = sub_1B13729D0();
    v39 = v70;
    sub_1B1372A00();
    v40 = sub_1B1372E38();
    if ((sub_1B1372F58() & 1) != 0)
    {
      LODWORD(v68) = v40;
      swift_retain();
      v41 = v63;
      sub_1B1372A24();
      swift_release();
      v42 = v64;
      if ((*(unsigned int (**)(char *, uint64_t))(v7 + 88))(v41, v64) == *MEMORY[0x1E0DF2190])
      {
        v43 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v7 + 8))(v41, v42);
        v43 = "Finished returning cached image.";
      }
      v55 = v70;
      v33(v15, v70, v9);
      v56 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v56 = 0;
      v57 = sub_1B13729A0();
      _os_signpost_emit_with_name_impl(&dword_1B12B8000, v38, (os_signpost_type_t)v68, v57, "ImageRequester.loadImage", v43, v56, 2u);
      MEMORY[0x1B5E1B030](v56, -1, -1);

      v54 = *(void (**)(char *, uint64_t))(v72 + 8);
      v54(v55, v9);
      v54(v15, v9);
    }
    else
    {

      v54 = *(void (**)(char *, uint64_t))(v72 + 8);
      v54(v39, v9);
    }
    v58 = v71;
    v59 = v73;
    if (v73)
    {
      v60 = v37;
      v59(v37, 1);
      swift_release();

      v54(v58, v9);
    }
    else
    {
      v54(v71, v9);
      swift_release();

    }
    return 0;
  }
  else
  {
    v70 = (char *)objc_msgSend((id)objc_opt_self(), sel_sharedSession);
    v44 = (void *)sub_1B1371D88();
    v45 = v66;
    v46 = v67;
    v47 = v68;
    (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v66, a1, v68);
    v48 = (*(unsigned __int8 *)(v46 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
    v49 = (char *)swift_allocObject();
    v50 = (uint64_t)v73;
    *((_QWORD *)v49 + 2) = v34;
    *((_QWORD *)v49 + 3) = v50;
    *((_QWORD *)v49 + 4) = v69;
    (*(void (**)(char *, char *, uint64_t))(v46 + 32))(&v49[v48], v45, v47);
    aBlock[4] = sub_1B135304C;
    aBlock[5] = v49;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B1352830;
    aBlock[3] = &unk_1E62F9298;
    v51 = _Block_copy(aBlock);
    swift_retain();
    sub_1B12EACC0(v50);
    swift_release();
    v52 = v70;
    v53 = objc_msgSend(v70, sel_dataTaskWithURL_completionHandler_, v44, v51);
    _Block_release(v51);

    objc_msgSend(v53, sel_resume);
    swift_release();
    (*(void (**)(char *, uint64_t))(v72 + 8))(v71, v9);
  }
  return v53;
}

uint64_t sub_1B1352FC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_1B1371DC4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  swift_release();
  if (*(_QWORD *)(v0 + 24))
    swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + ((v3 + 40) & ~v3), v1);
  return swift_deallocObject();
}

void sub_1B135304C(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v9;

  v9 = *(unsigned __int8 *)(*(_QWORD *)(sub_1B1371DC4() - 8) + 80);
  sub_1B135118C(a1, a2, a3, a4, *(const char **)(v4 + 16), *(void (**)(_QWORD, _QWORD))(v4 + 24), *(_QWORD *)(v4 + 32), v4 + ((v9 + 40) & ~v9));
}

uint64_t sub_1B13530B8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1B12CE094(a1, a2);
  return a1;
}

uint64_t sub_1B13530CC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_1B1371DC4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  sub_1B12CE094(v0[2], v0[3]);
  swift_release();
  if (v0[5])
    swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))((uint64_t)v0 + ((v3 + 56) & ~v3), v1);
  return swift_deallocObject();
}

void sub_1B1353158()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_1B1371DC4() - 8) + 80);
  sub_1B1351A38(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void (**)(uint64_t, uint64_t))(v0 + 40), *(void (**)(uint64_t, uint64_t))(v0 + 48), (char *)(v0 + ((v1 + 56) & ~v1)));
}

uint64_t sub_1B1353190(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1B13531A4(a1, a2);
  return a1;
}

uint64_t sub_1B13531A4(uint64_t a1, unint64_t a2)
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

uint64_t sub_1B13531E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_1B1371DC4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  sub_1B12CE094(*(_QWORD *)(v0 + v4), *(_QWORD *)(v0 + v4 + 8));
  if (*(_QWORD *)(v0 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8)))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B135328C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(sub_1B1371DC4() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1B13522C8(a1, v1 + v4, *(_QWORD *)(v1 + v5), *(_QWORD *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 8), *(_QWORD *)(v1 + ((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_1B13532FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_1B1371DC4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  sub_1B12CE094(*(_QWORD *)(v0 + v4), *(_QWORD *)(v0 + v4 + 8));
  if (*(_QWORD *)(v0 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8)))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B13533B4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(sub_1B1371DC4() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1B1352438(*(void **)(v0 + 16), v0 + v2, *(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8) + 8), *(uint64_t (**)(void *, uint64_t))(v0+ ((((v3 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((((v3 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

void sub_1B1353420(uint64_t a1, double a2)
{
  void *v4;
  uint64_t inited;
  void *v6;

  v4 = (void *)sub_1B1372B74();
  sub_1B12CF7F8(&qword_1ED388F08);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B13757D0;
  strcpy((char *)(inited + 32), "swipeDistance");
  *(_WORD *)(inited + 46) = -4864;
  *(_QWORD *)(inited + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, a1);
  strcpy((char *)(inited + 56), "cacheDuration");
  *(_WORD *)(inited + 70) = -4864;
  *(_QWORD *)(inited + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, a2);
  sub_1B131A614(inited);
  sub_1B1353570();
  v6 = (void *)sub_1B1372B08();
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();

}

unint64_t sub_1B1353570()
{
  unint64_t result;

  result = qword_1ED389158;
  if (!qword_1ED389158)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED389158);
  }
  return result;
}

ValueMetadata *type metadata accessor for PreloadedDiagnosticsAnalytics()
{
  return &type metadata for PreloadedDiagnosticsAnalytics;
}

id sub_1B13535BC(void *a1)
{
  _BYTE *v1;
  id v3;
  void *v4;
  id v5;
  id v6;
  objc_super v8;

  v1[OBJC_IVAR____TtC17PromotedContentUI10DimmerView_dimmed] = 0;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for DimmerView();
  v3 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);
  if (v3)
  {
    v4 = (void *)objc_opt_self();
    v5 = v3;
    v6 = objc_msgSend(v4, sel_clearColor);
    objc_msgSend(v5, sel_setBackgroundColor_, v6);

    objc_msgSend(v5, sel_setAlpha_, 0.2);
    objc_msgSend(v5, sel_setIsAccessibilityElement_, 0);
    objc_msgSend(v5, sel_setUserInteractionEnabled_, 0);

  }
  return v3;
}

id sub_1B13536D4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DimmerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id PrivacyMarker.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void static PrivacyMarker.privacyMarkerSize(sizeCategory:isVideo:minimumTappableSize:)(uint64_t a1, char a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;

  if ((a2 & 1) != 0)
    v2 = 2;
  else
    v2 = 0;
  v3 = v2;
  _s17PromotedContentUI13PrivacyMarkerC07privacyE4Size4type12sizeCategory015minimumTappableG0So6CGSizeVAA0dE4TypeO_So09UIContentgJ0aAItFZ_0(&v3, a1);
}

id sub_1B1353760()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  id result;
  id v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;

  v1 = v0;
  v2 = sub_1B1371F08();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v7 = objc_msgSend(v6, sel_preferredContentSizeCategory);

  sub_1B12D1F40();
  sub_1B1371EFC();
  v8 = sub_1B1371EF0();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v11 = MEMORY[0x1E0DEE9E0];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v51 = v11;
  sub_1B136CE3C(v8, v10, 0x614C656369766544, 0xEE0065676175676ELL, isUniquelyReferenced_nonNull_native);
  v13 = v51;
  swift_bridgeObjectRelease();
  result = objc_msgSend(*(id *)(v1 + OBJC_IVAR___APPrivacyMarker_markerLabel), sel_font);
  if (result)
  {
    v15 = result;
    objc_msgSend(result, sel_pointSize);
    v17 = v16;

    if ((~*(_QWORD *)&v17 & 0x7FF0000000000000) != 0)
    {
      if (v17 > -9.22337204e18)
      {
        if (v17 < 9.22337204e18)
        {
          v51 = (uint64_t)v17;
          v18 = sub_1B137321C();
          v20 = v19;
          v21 = swift_isUniquelyReferenced_nonNull_native();
          v51 = v13;
          sub_1B136CE3C(v18, v20, 0x657A6953746E6F46, 0xE800000000000000, v21);
          v22 = v51;
          swift_bridgeObjectRelease();
          v15 = objc_msgSend(*(id *)(v1 + OBJC_IVAR___APPrivacyMarker_markerView), sel_layer);
          objc_msgSend(v15, sel_cornerRadius);
          v24 = v23;

          if ((~*(_QWORD *)&v24 & 0x7FF0000000000000) != 0)
          {
            if (v24 > -9.22337204e18)
            {
              if (v24 < 9.22337204e18)
              {
                v51 = (uint64_t)v24;
                v25 = sub_1B137321C();
                v27 = v26;
                v28 = swift_isUniquelyReferenced_nonNull_native();
                v51 = v22;
                sub_1B136CE3C(v25, v27, 0x615272656E726F43, 0xEC00000073756964, v28);
                v29 = v51;
                swift_bridgeObjectRelease();
                sub_1B12CF7F8(&qword_1ED3899B0);
                v30 = swift_allocObject();
                v50 = xmmword_1B1375550;
                *(_OWORD *)(v30 + 16) = xmmword_1B1375550;
                v31 = sub_1B12D1F40();
                v32 = sub_1B130A1D8(v31 & 1);
                v33 = MEMORY[0x1E0DEB070];
                v34 = MEMORY[0x1E0DEB100];
                *(_QWORD *)(v30 + 56) = MEMORY[0x1E0DEB070];
                *(_QWORD *)(v30 + 64) = v34;
                *(double *)(v30 + 32) = v32;
                v35 = sub_1B1372BB0();
                v37 = v36;
                v38 = swift_isUniquelyReferenced_nonNull_native();
                v51 = v29;
                sub_1B136CE3C(v35, v37, 0x72656B72614D6441, 0xED00006874646957, v38);
                v39 = v51;
                swift_bridgeObjectRelease();
                v40 = swift_allocObject();
                *(_OWORD *)(v40 + 16) = v50;
                v41 = sub_1B1309BC8();
                *(_QWORD *)(v40 + 56) = v33;
                *(_QWORD *)(v40 + 64) = v34;
                *(double *)(v40 + 32) = v41;
                v42 = sub_1B1372BB0();
                v44 = v43;
                v45 = swift_isUniquelyReferenced_nonNull_native();
                v51 = v39;
                sub_1B136CE3C(v42, v44, 0x72656B72614D6441, 0xEE00746867696548, v45);
                v15 = (id)v51;
                swift_bridgeObjectRelease();
                if (qword_1ED3888A8 == -1)
                {
LABEL_9:
                  v46 = qword_1ED38B6D8;
                  v47 = unk_1ED38B6E0;
                  swift_bridgeObjectRetain();
                  v48 = swift_isUniquelyReferenced_nonNull_native();
                  v51 = (uint64_t)v15;
                  sub_1B136CE3C(v46, v47, 0xD000000000000015, 0x80000001B13843F0, v48);
                  v49 = v51;

                  swift_bridgeObjectRelease();
                  return (id)v49;
                }
LABEL_16:
                swift_once();
                goto LABEL_9;
              }
LABEL_15:
              __break(1u);
              goto LABEL_16;
            }
LABEL_14:
            __break(1u);
            goto LABEL_15;
          }
LABEL_13:
          __break(1u);
          goto LABEL_14;
        }
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

double sub_1B1353C50()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___APPrivacyMarker_minimumTappableSize;
  swift_beginAccess();
  return *(double *)v1;
}

void sub_1B1353C94(double a1, double a2)
{
  uint64_t v2;
  double *v5;

  v5 = (double *)(v2 + OBJC_IVAR___APPrivacyMarker_minimumTappableSize);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  sub_1B12D0FA0();
}

void (*sub_1B1353CEC(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1B1353D34;
}

void sub_1B1353D34(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_1B12D0FA0();
}

id PrivacyMarker.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id PrivacyMarker.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  id v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  objc_super v16;

  v9 = OBJC_IVAR___APPrivacyMarker_markerLabel;
  v10 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v11 = v4;
  *(_QWORD *)&v4[v9] = objc_msgSend(v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v12 = OBJC_IVAR___APPrivacyMarker_markerView;
  *(_QWORD *)&v11[v12] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v11[OBJC_IVAR___APPrivacyMarker_privacyMarkerType] = 0;
  *(_QWORD *)&v11[OBJC_IVAR___APPrivacyMarker_privacyMarkerPosition] = 2;
  v13 = &v11[OBJC_IVAR___APPrivacyMarker_minimumTappableSize];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;

  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for PrivacyMarker();
  v14 = objc_msgSendSuper2(&v16, sel_initWithFrame_, a1, a2, a3, a4);
  sub_1B12C625C();

  return v14;
}

uint64_t sub_1B1353F24()
{
  uint64_t v0;
  void *v1;
  uint64_t result;
  uint64_t *v3;

  v1 = *(void **)(v0 + OBJC_IVAR___APPrivacyMarker_markerView);
  result = sub_1B12C32DC();
  if ((result & 1) == 0)
  {
    if (UIAccessibilityDarkerSystemColorsEnabled())
    {
      if (qword_1EEF27018 != -1)
        swift_once();
      swift_beginAccess();
      objc_msgSend(v1, sel_setBackgroundColor_, qword_1EEF283E8);
      if (qword_1EEF27020 != -1)
        swift_once();
      v3 = &qword_1EEF283F0;
    }
    else
    {
      if (qword_1ED389210 != -1)
        swift_once();
      swift_beginAccess();
      objc_msgSend(v1, sel_setBackgroundColor_, qword_1ED389208);
      if (qword_1ED389258 != -1)
        swift_once();
      v3 = &qword_1ED389250;
    }
    swift_beginAccess();
    return (uint64_t)objc_msgSend(v1, sel_setTintColor_, *v3);
  }
  return result;
}

id PrivacyMarker.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PrivacyMarker();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

__n128 sub_1B1354234@<Q0>(_QWORD *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 *v3;
  __n128 result;

  v3 = (__n128 *)(*a1 + OBJC_IVAR___APPrivacyMarker_minimumTappableSize);
  swift_beginAccess();
  result = *v3;
  *a2 = *v3;
  return result;
}

void sub_1B1354284(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *a1;
  v3 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR___APPrivacyMarker_minimumTappableSize);
  swift_beginAccess();
  *v4 = v2;
  v4[1] = v3;
  sub_1B12D0FA0();
}

uint64_t method lookup function for PrivacyMarker()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PrivacyMarker.minimumTappableSize.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of PrivacyMarker.minimumTappableSize.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of PrivacyMarker.minimumTappableSize.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t sub_1B135433C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1B12CF7F8(&qword_1ED389168);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1B135437C()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = OBJC_IVAR___APPrivacyMarker_markerLabel;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v2 = OBJC_IVAR___APPrivacyMarker_markerView;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v0[OBJC_IVAR___APPrivacyMarker_privacyMarkerType] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___APPrivacyMarker_privacyMarkerPosition] = 2;
  v3 = &v0[OBJC_IVAR___APPrivacyMarker_minimumTappableSize];
  *v3 = 0;
  v3[1] = 0;

  sub_1B1373174();
  __break(1u);
}

uint64_t sub_1B1354470(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t result;

  v8 = a4 >> 1;
  v9 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
    goto LABEL_11;
  v5 = a3;
  v6 = a2;
  v7 = *v4;
  if (*v4 >> 62)
    goto LABEL_12;
  v10 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  v11 = v10 + v9;
  if (!__OFADD__(v10, v9))
    goto LABEL_4;
LABEL_14:
  __break(1u);
LABEL_15:
  v13 = 1;
LABEL_16:
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    v16 = sub_1B137318C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v16 <= v11)
    v16 = v11;
  swift_bridgeObjectRetain();
  v7 = MEMORY[0x1B5E1A7B4](v13, v16, 1, v7);
  swift_bridgeObjectRelease();
  *v4 = v7;
  v14 = v7 & 0xFFFFFFFFFFFFFF8;
  if (v8 == v5)
  {
    while (v9 > 0)
    {
      __break(1u);
LABEL_11:
      __break(1u);
LABEL_12:
      swift_bridgeObjectRetain();
      v15 = sub_1B137318C();
      swift_bridgeObjectRelease();
      v11 = v15 + v9;
      if (__OFADD__(v15, v9))
        goto LABEL_14;
LABEL_4:
      v7 = *v4;
      isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
      *v4 = v7;
      v13 = 0;
      if (!isUniquelyReferenced_nonNull_bridgeObject
        || (v7 & 0x8000000000000000) != 0
        || (v7 & 0x4000000000000000) != 0)
      {
        goto LABEL_16;
      }
      v14 = v7 & 0xFFFFFFFFFFFFFF8;
      if (v11 > *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        goto LABEL_15;
      if (v8 != v5)
        goto LABEL_21;
    }
    goto LABEL_28;
  }
LABEL_21:
  v17 = *(_QWORD *)(v14 + 16);
  if ((*(_QWORD *)(v14 + 24) >> 1) - v17 < v9)
  {
    __break(1u);
  }
  else
  {
    if (v9 < 0)
      goto LABEL_32;
    v18 = v14 + 8 * v17 + 32;
    v19 = v6 + 8 * v5;
    if (v19 < v18 + 8 * v9 && v18 < v19 + 8 * v9)
      goto LABEL_32;
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED387F20);
    swift_arrayInitWithCopy();
    if (!v9)
    {
LABEL_28:
      swift_unknownObjectRelease();
      return sub_1B1372CA0();
    }
    v20 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v21 = __OFADD__(v20, v9);
    v22 = v20 + v9;
    if (!v21)
    {
      *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) = v22;
      goto LABEL_28;
    }
  }
  __break(1u);
LABEL_32:
  result = sub_1B13731C8();
  __break(1u);
  return result;
}

uint64_t sub_1B13546FC(unint64_t a1)
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
    v3 = sub_1B137318C();
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
    v5 = sub_1B137318C();
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
    v4 = MEMORY[0x1B5E1A7B4](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_1B135FC64(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_1B137318C();
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
    return sub_1B1372CA0();
  }
  __break(1u);
  return result;
}

uint64_t sub_1B13548B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_1B12EB694(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = &v3[v8 + 4];
  if (a1 + 32 < (unint64_t)&v9[v2] && (unint64_t)v9 < a1 + 32 + 8 * v2)
    goto LABEL_24;
  memcpy(v9, (const void *)(a1 + 32), 8 * v2);
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1B13731C8();
  __break(1u);
  return result;
}

uint64_t sub_1B13549F8(unint64_t a1)
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
    v3 = sub_1B137318C();
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
    v5 = sub_1B137318C();
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
    v4 = MEMORY[0x1B5E1A7B4](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_1B135FE78(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_1B137318C();
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
    return sub_1B1372CA0();
  }
  __break(1u);
  return result;
}

uint64_t sub_1B1354BB0(uint64_t result)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  unint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t *v31;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  int64_t v35;
  int64_t v36;
  uint64_t v37;
  _QWORD v38[2];
  uint64_t v39;
  int64_t v40;
  unint64_t v41;

  v3 = *(_QWORD *)(result + 16);
  v4 = *(_QWORD **)v1;
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v7 = result;
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v9 = v4[3] >> 1, v9 < v6))
  {
    if (v5 <= v6)
      v10 = v5 + v3;
    else
      v10 = v5;
    v4 = sub_1B12D3870(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    v9 = v4[3] >> 1;
  }
  v11 = v4[2];
  v12 = v9 - v11;
  result = sub_1B1360684((uint64_t)v38, &v4[2 * v11 + 4], v9 - v11, v7);
  if (result < v3)
    goto LABEL_15;
  if (result)
  {
    v14 = v4[2];
    v15 = __OFADD__(v14, result);
    v16 = v14 + result;
    if (v15)
    {
      __break(1u);
      goto LABEL_48;
    }
    v4[2] = v16;
  }
  if (result != v12)
  {
LABEL_13:
    result = sub_1B12EACB8();
    *(_QWORD *)v1 = v4;
    return result;
  }
LABEL_16:
  v2 = v4[2];
  v3 = v38[0];
  v37 = v38[1];
  v13 = v39;
  v6 = v40;
  if (v41)
  {
    v17 = (v41 - 1) & v41;
    v18 = __clz(__rbit64(v41)) | (v40 << 6);
    v36 = (unint64_t)(v39 + 64) >> 6;
    goto LABEL_18;
  }
LABEL_48:
  v32 = v6 + 1;
  if (__OFADD__(v6, 1))
    goto LABEL_66;
  v36 = (unint64_t)(v13 + 64) >> 6;
  if (v32 >= v36)
    goto LABEL_13;
  v33 = *(_QWORD *)(v37 + 8 * v32);
  v34 = v6 + 1;
  if (!v33)
  {
    v34 = v6 + 2;
    if (v6 + 2 >= v36)
      goto LABEL_13;
    v33 = *(_QWORD *)(v37 + 8 * v34);
    if (!v33)
    {
      v34 = v6 + 3;
      if (v6 + 3 >= v36)
        goto LABEL_13;
      v33 = *(_QWORD *)(v37 + 8 * v34);
      if (!v33)
      {
        v34 = v6 + 4;
        if (v6 + 4 >= v36)
          goto LABEL_13;
        v33 = *(_QWORD *)(v37 + 8 * v34);
        if (!v33)
        {
          v34 = v6 + 5;
          if (v6 + 5 >= v36)
            goto LABEL_13;
          v33 = *(_QWORD *)(v37 + 8 * v34);
          if (!v33)
          {
            v35 = v6 + 6;
            do
            {
              if (v36 == v35)
                goto LABEL_13;
              v33 = *(_QWORD *)(v37 + 8 * v35++);
            }
            while (!v33);
            v34 = v35 - 1;
          }
        }
      }
    }
  }
  v17 = (v33 - 1) & v33;
  v18 = __clz(__rbit64(v33)) + (v34 << 6);
  v6 = v34;
LABEL_18:
  v19 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v18);
  v21 = *v19;
  v20 = v19[1];
  result = swift_bridgeObjectRetain();
  while (1)
  {
    v22 = v4[3];
    v23 = v22 >> 1;
    if ((uint64_t)(v22 >> 1) < v2 + 1)
      break;
    if (v2 < v23)
      goto LABEL_23;
LABEL_20:
    v4[2] = v2;
  }
  result = (uint64_t)sub_1B12D3870((_QWORD *)(v22 > 1), v2 + 1, 1, v4);
  v4 = (_QWORD *)result;
  v23 = *(_QWORD *)(result + 24) >> 1;
  if (v2 >= v23)
    goto LABEL_20;
  while (1)
  {
LABEL_23:
    v24 = &v4[2 * v2 + 4];
    *v24 = v21;
    v24[1] = v20;
    ++v2;
    if (v17)
    {
      v25 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v26 = v25 | (v6 << 6);
      goto LABEL_41;
    }
    v27 = v6 + 1;
    if (__OFADD__(v6, 1))
      break;
    if (v27 >= v36)
      goto LABEL_45;
    v28 = *(_QWORD *)(v37 + 8 * v27);
    v29 = v6 + 1;
    if (!v28)
    {
      v29 = v6 + 2;
      if (v6 + 2 >= v36)
        goto LABEL_45;
      v28 = *(_QWORD *)(v37 + 8 * v29);
      if (!v28)
      {
        v29 = v6 + 3;
        if (v6 + 3 >= v36)
          goto LABEL_45;
        v28 = *(_QWORD *)(v37 + 8 * v29);
        if (!v28)
        {
          v29 = v6 + 4;
          if (v6 + 4 >= v36)
            goto LABEL_45;
          v28 = *(_QWORD *)(v37 + 8 * v29);
          if (!v28)
          {
            v29 = v6 + 5;
            if (v6 + 5 >= v36)
              goto LABEL_45;
            v28 = *(_QWORD *)(v37 + 8 * v29);
            if (!v28)
            {
              v30 = v6 + 6;
              while (v36 != v30)
              {
                v28 = *(_QWORD *)(v37 + 8 * v30++);
                if (v28)
                {
                  v29 = v30 - 1;
                  goto LABEL_40;
                }
              }
LABEL_45:
              v4[2] = v2;
              goto LABEL_13;
            }
          }
        }
      }
    }
LABEL_40:
    v17 = (v28 - 1) & v28;
    v26 = __clz(__rbit64(v28)) + (v29 << 6);
    v6 = v29;
LABEL_41:
    v31 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v26);
    v21 = *v31;
    v20 = v31[1];
    if (v2 >= v23)
    {
      result = swift_bridgeObjectRetain();
      goto LABEL_20;
    }
    result = swift_bridgeObjectRetain();
  }
  __break(1u);
LABEL_66:
  __break(1u);
  return result;
}

uint64_t sub_1B1354F78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1B1372D00();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1B1372CF4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1B12D0D40(a1, &qword_1ED3896D8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B1372CD0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1B13550C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B1355124(a1, a2, a3, &qword_1EEF28858);
}

uint64_t sub_1B13550D0(uint64_t a1, uint64_t a2)
{
  return sub_1B1355184(a1, a2, &qword_1EEF28858);
}

void sub_1B13550DC()
{
  sub_1B13086C0();
  sub_1B1371D34();
  __break(1u);
}

void sub_1B1355100()
{
  sub_1B1371CC8();
  __break(1u);
}

uint64_t sub_1B1355118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B1355124(a1, a2, a3, &qword_1EEF28850);
}

uint64_t sub_1B1355124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  sub_1B12CF7F8(a4);
  return sub_1B1372B68() & 1;
}

uint64_t sub_1B1355178(uint64_t a1, uint64_t a2)
{
  return sub_1B1355184(a1, a2, &qword_1EEF28850);
}

uint64_t sub_1B1355184(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_1B12CF7F8(a3);
  return sub_1B1372B50();
}

void sub_1B13551C4()
{
  sub_1B1308744();
  sub_1B1371D34();
  __break(1u);
}

void sub_1B13551E8()
{
  sub_1B1371CBC();
  __break(1u);
}

uint64_t sub_1B1355200(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1B137318C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x1E0DEE9D8];
  if (!v2)
    return v3;
  v13 = MEMORY[0x1E0DEE9D8];
  result = sub_1B12D7A24(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1B5E1A7A8](i, a1);
        sub_1B12CFA9C(0, &qword_1ED387F18);
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1B12D7A24(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_1B12D7A24(v6 > 1, v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_1B12C32CC(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      sub_1B12CFA9C(0, &qword_1ED387F18);
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1B12D7A24(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_1B12D7A24(v10 > 1, v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_1B12C32CC(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B1355460(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v9 = MEMORY[0x1E0DEE9D8];
    sub_1B12D7AE0(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      swift_bridgeObjectRetain_n();
      sub_1B12CF7F8(&qword_1ED388E00);
      sub_1B12CF7F8(&qword_1ED387C20);
      swift_dynamicCast();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B12D7AE0(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1B12D7AE0(v5 > 1, v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      *(_QWORD *)(v2 + 8 * v6 + 32) = v8;
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

BOOL static CarouselAdView.CarouselStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CarouselAdView.CarouselStyle.hash(into:)()
{
  return sub_1B13732D0();
}

uint64_t CarouselAdView.CarouselStyle.hashValue.getter()
{
  sub_1B13732C4();
  sub_1B13732D0();
  return sub_1B13732E8();
}

__n128 sub_1B1355620()
{
  __n128 result;
  __int128 v1;

  result = *(__n128 *)MEMORY[0x1E0DC49E8];
  v1 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  xmmword_1EEF287E8 = *MEMORY[0x1E0DC49E8];
  *(_OWORD *)&qword_1EEF287F8 = v1;
  return result;
}

void sub_1B135563C()
{
  qword_1ED387B78 = 0x4024000000000000;
  unk_1ED387B80 = 0;
  qword_1ED387B88 = 0;
  unk_1ED387B90 = 0;
}

id sub_1B1355654()
{
  return sub_1B1355E5C(&OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___backgroundCollectionController, (uint64_t (*)(uint64_t))sub_1B1355668);
}

id sub_1B1355668(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  objc_class *v7;
  char *v8;
  char *v9;
  objc_super v11;

  sub_1B13569EC();
  v3 = v2;
  v4 = 1.77777778;
  if (*(_BYTE *)(a1 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_style) != 1)
    v4 = 1.0;
  v5 = *(_QWORD *)(a1 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements);
  v6 = v2 * v4 * (double)*(uint64_t *)(v5 + 16);
  v7 = (objc_class *)type metadata accessor for CarouselBackgroundCollectionController();
  v8 = (char *)objc_allocWithZone(v7);
  *(_QWORD *)&v8[OBJC_IVAR____TtC17PromotedContentUI38CarouselBackgroundCollectionController_elements] = v5;
  v9 = &v8[OBJC_IVAR____TtC17PromotedContentUI38CarouselBackgroundCollectionController_contentSize];
  *(double *)v9 = v6;
  *((double *)v9 + 1) = v3;
  v11.receiver = v8;
  v11.super_class = v7;
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v11, sel_init);
}

id sub_1B1355724()
{
  return sub_1B1355E5C(&OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___backgroundCollectionView, (uint64_t (*)(uint64_t))sub_1B1355738);
}

id sub_1B1355738()
{
  id v0;
  id v1;
  id v2;
  id v3;
  uint64_t ObjCClassFromMetadata;
  void *v5;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3610]), sel_init);
  objc_msgSend(v0, sel_setScrollDirection_, 1);
  objc_msgSend(v0, sel_setMinimumInteritemSpacing_, 0.0);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC35B8]), sel_initWithFrame_collectionViewLayout_, v0, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_setUserInteractionEnabled_, 0);
  v2 = sub_1B1355654();
  objc_msgSend(v1, sel_setDataSource_, v2);

  v3 = sub_1B1355654();
  objc_msgSend(v1, sel_setDelegate_, v3);

  objc_msgSend(v1, sel_setShowsHorizontalScrollIndicator_, 0);
  objc_msgSend(v1, sel_setShowsVerticalScrollIndicator_, 0);
  objc_msgSend(v1, sel_setDecelerationRate_, *MEMORY[0x1E0DC5360]);
  objc_msgSend(v1, sel_setClipsToBounds_, 0);
  objc_msgSend(v1, sel_setScrollsToTop_, 0);
  type metadata accessor for ImageCollectionViewCell();
  if (qword_1ED387910 != -1)
    swift_once();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = (void *)sub_1B1372B74();
  objc_msgSend(v1, sel_registerClass_forCellWithReuseIdentifier_, ObjCClassFromMetadata, v5);

  return v1;
}

id sub_1B1355914()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___blurView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___blurView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___blurView);
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_effectWithStyle_, 18);
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F58]), sel_initWithEffect_, v4);
    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

id sub_1B13559D0()
{
  return sub_1B1355C30(&OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___headlineLabel, (uint64_t (*)(void))sub_1B13559E4);
}

id sub_1B13559E4()
{
  id v0;
  uint64_t v1;
  id v2;
  id v3;
  double v4;
  id v5;
  id v6;
  id v7;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  objc_msgSend(v0, sel_setAccessibilityTraits_, *MEMORY[0x1E0DC4670]);
  objc_msgSend(v0, sel_setAdjustsFontForContentSizeCategory_, 1);
  v1 = *MEMORY[0x1E0DC4AD0];
  v2 = sub_1B1363564(0x6F42206C61697241, 0xEA0000000000646CLL, *MEMORY[0x1E0DC4AD0], 0, 1, 20.0);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v4 = *MEMORY[0x1E0DC1420];
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC37F8]), sel_initForTextStyle_, v1);
    v6 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_weight_, 20.0, v4);
    v3 = objc_msgSend(v5, sel_scaledFontForFont_, v6);

  }
  objc_msgSend(v0, sel_setFont_, v3);

  objc_msgSend(v0, sel_setNumberOfLines_, 0);
  v7 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  objc_msgSend(v0, sel_setTextColor_, v7);

  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v0;
}

id sub_1B1355B98()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___advertiserContainerView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___advertiserContainerView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___advertiserContainerView);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_1B1355C1C()
{
  return sub_1B1355C30(&OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___advertiserLabel, (uint64_t (*)(void))sub_1B1355C88);
}

id sub_1B1355C30(uint64_t *a1, uint64_t (*a2)(void))
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *a1;
  v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    v5 = *(id *)(v2 + *a1);
  }
  else
  {
    v6 = (void *)a2();
    v7 = *(void **)(v2 + v3);
    *(_QWORD *)(v2 + v3) = v6;
    v5 = v6;

    v4 = 0;
  }
  v8 = v4;
  return v5;
}

id sub_1B1355C88()
{
  id v0;
  uint64_t v1;
  id v2;
  id v3;
  double v4;
  id v5;
  id v6;
  id v7;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  objc_msgSend(v0, sel_setAccessibilityTraits_, *MEMORY[0x1E0DC4670]);
  objc_msgSend(v0, sel_setAdjustsFontForContentSizeCategory_, 1);
  v1 = *MEMORY[0x1E0DC4AB8];
  v2 = sub_1B1363564(0x6C61697241, 0xE500000000000000, *MEMORY[0x1E0DC4AB8], 0, 1, 13.0);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v4 = *MEMORY[0x1E0DC1440];
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC37F8]), sel_initForTextStyle_, v1);
    v6 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_weight_, 13.0, v4);
    v3 = objc_msgSend(v5, sel_scaledFontForFont_, v6);

  }
  objc_msgSend(v0, sel_setFont_, v3);

  objc_msgSend(v0, sel_setNumberOfLines_, 1);
  objc_msgSend(v0, sel_setTextAlignment_, 1);
  v7 = objc_msgSend((id)objc_opt_self(), sel_whiteColor);
  objc_msgSend(v0, sel_setTextColor_, v7);

  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v0;
}

id sub_1B1355E48()
{
  return sub_1B1355E5C(&OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___collectionView, (uint64_t (*)(uint64_t))sub_1B1355EB8);
}

id sub_1B1355E5C(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *a1;
  v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    v5 = *(id *)(v2 + *a1);
  }
  else
  {
    v6 = (void *)a2(v2);
    v7 = *(void **)(v2 + v3);
    *(_QWORD *)(v2 + v3) = v6;
    v5 = v6;

    v4 = 0;
  }
  v8 = v4;
  return v5;
}

id sub_1B1355EB8(void *a1)
{
  id v2;
  id v3;
  id v4;
  double v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t ObjCClassFromMetadata;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3610]), sel_init);
  objc_msgSend(v2, sel_setScrollDirection_, 1);
  v3 = objc_msgSend(a1, sel_traitCollection);
  v4 = objc_msgSend(v3, sel_horizontalSizeClass);

  v5 = 0.0;
  if (v4 == (id)1)
    v5 = 8.0;
  if (v4 == (id)2)
    v5 = 10.0;
  objc_msgSend(v2, sel_setMinimumLineSpacing_, v5);
  objc_msgSend(v2, sel_setSectionInset_, sub_1B1356E04());
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC35B8]), sel_initWithFrame_collectionViewLayout_, v2, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v7 = (void *)objc_opt_self();
  v8 = v6;
  v9 = objc_msgSend(v7, sel_clearColor);
  objc_msgSend(v8, sel_setBackgroundColor_, v9);

  objc_msgSend(v8, sel_setDataSource_, a1);
  objc_msgSend(v8, sel_setDelegate_, a1);
  objc_msgSend(v8, sel_setPrefetchDataSource_, a1);
  objc_msgSend(v8, sel_setShowsHorizontalScrollIndicator_, 0);
  objc_msgSend(v8, sel_setDecelerationRate_, *MEMORY[0x1E0DC5360]);
  objc_msgSend(v8, sel_setClipsToBounds_, 0);
  objc_msgSend(v8, sel_setScrollsToTop_, 0);
  v10 = qword_1ED387920;
  v11 = v8;
  if (v10 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v12 = (void *)sub_1B1372B74();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setAccessibilityHint_, v12);

  type metadata accessor for SmallCarouselCollectionViewCell();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v14 = (void *)sub_1B1372B74();
  objc_msgSend(v11, sel_registerClass_forCellWithReuseIdentifier_, ObjCClassFromMetadata, v14);

  type metadata accessor for SmallCTACarouselCollectionViewCell();
  v15 = swift_getObjCClassFromMetadata();
  v16 = (void *)sub_1B1372B74();
  objc_msgSend(v11, sel_registerClass_forCellWithReuseIdentifier_, v15, v16);

  type metadata accessor for MediumCarouselCollectionViewCell();
  v17 = swift_getObjCClassFromMetadata();
  v18 = (void *)sub_1B1372B74();
  objc_msgSend(v11, sel_registerClass_forCellWithReuseIdentifier_, v17, v18);

  type metadata accessor for MediumCTACarouselCollectionViewCell();
  v19 = swift_getObjCClassFromMetadata();
  v20 = (void *)sub_1B1372B74();
  objc_msgSend(v11, sel_registerClass_forCellWithReuseIdentifier_, v19, v20);

  type metadata accessor for LargeCarouselCollectionViewCell();
  v21 = swift_getObjCClassFromMetadata();
  v22 = (void *)sub_1B1372B74();
  objc_msgSend(v11, sel_registerClass_forCellWithReuseIdentifier_, v21, v22);

  type metadata accessor for LargeCTACarouselCollectionViewCell();
  v23 = swift_getObjCClassFromMetadata();
  v24 = (void *)sub_1B1372B74();
  objc_msgSend(v11, sel_registerClass_forCellWithReuseIdentifier_, v23, v24);

  return v11;
}

id sub_1B13562DC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___logoImageView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___logoImageView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___logoImageView);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_init);
    objc_msgSend(v4, sel_setContentMode_, 1);
    objc_msgSend(v4, sel_setOpaque_, 0);
    objc_msgSend(v4, sel_setAccessibilityIgnoresInvertColors_, 1);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void *sub_1B135639C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___actionButton;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___actionButton);
  v3 = v2;
  if (v2 == (void *)1)
  {
    v3 = sub_1B1356408(v0);
    v4 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    v5 = v3;
    sub_1B12EA250(v4);
  }
  sub_1B12EA260(v2);
  return v3;
}

void *sub_1B1356408(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  void (*v28)(id *, _QWORD);
  uint64_t v29;
  char v30;
  char v31;
  void *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t KeyPath;
  uint64_t v40;
  id v41;
  double v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v52;
  id v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60[4];

  v2 = sub_1B12CF7F8(&qword_1ED3877E0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1B1371D10();
  v56 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v55 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B1372ED4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1B1372F1C();
  v57 = *(_QWORD *)(v11 - 8);
  v58 = v11;
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v52 - v15;
  v17 = sub_1B12CF7F8(&qword_1ED387C50);
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation;
  v59 = a1;
  v21 = *(void **)(a1 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
  if (!v21)
    return 0;
  v54 = v5;
  v22 = v21;
  v23 = (void *)sub_1B1372670();

  if (!v23)
    return 0;
  v24 = *(void **)(v59 + v20);
  if (!v24)
  {
    v33 = sub_1B1371DC4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v19, 1, 1, v33);
    goto LABEL_9;
  }
  v25 = v24;
  sub_1B1372694();

  v26 = sub_1B1371DC4();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 48))(v19, 1, v26) == 1)
  {
LABEL_9:

    sub_1B12D0D40((uint64_t)v19, &qword_1ED387C50);
    return 0;
  }
  sub_1B12D0D40((uint64_t)v19, &qword_1ED387C50);
  sub_1B1372F10();
  v52 = (id)objc_opt_self();
  v27 = objc_msgSend(v52, sel_whiteColor);
  v28 = (void (*)(id *, _QWORD))sub_1B1372EC8();
  sub_1B1372A54();
  v28(v60, 0);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0DC3050], v7);
  sub_1B1372EE0();
  sub_1B1372EF8();
  v29 = sub_1B1372448();
  v53 = v23;
  if ((v30 & 1) != 0)
    v31 = 7;
  else
    v31 = sub_1B1366398(v29);
  v34 = v55;
  v35 = v56;
  v36 = v52;
  v37 = sub_1B1372460();
  sub_1B1366548(v37, v38, v31);
  swift_bridgeObjectRelease();
  sub_1B1371D04();
  KeyPath = swift_getKeyPath();
  *(&v52 - 2) = (id)MEMORY[0x1E0C80A78](KeyPath);
  swift_getKeyPath();
  v40 = *MEMORY[0x1E0DC4AA0];
  v41 = sub_1B1363564(0x6F42206C61697241, 0xEA0000000000646CLL, *MEMORY[0x1E0DC4AA0], 0x402E000000000000, 0, 12.0);
  if (!v41)
  {
    v42 = *MEMORY[0x1E0DC1420];
    v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC37F8]), sel_initForTextStyle_, v40);
    v44 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_weight_, 12.0, v42);
    v41 = objc_msgSend(v43, sel_scaledFontForFont_maximumPointSize_, v44, 15.0);

  }
  v60[0] = v41;
  sub_1B13086C0();
  sub_1B1371CF8();
  v45 = swift_getKeyPath();
  *(&v52 - 2) = (id)MEMORY[0x1E0C80A78](v45);
  swift_getKeyPath();
  v60[0] = objc_msgSend(v36, sel_systemBlueColor);
  sub_1B1308744();
  sub_1B1371CF8();
  v46 = v54;
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v4, v34, v54);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v4, 0, 1, v46);
  sub_1B1372EEC();
  sub_1B12CFA9C(0, &qword_1ED387950);
  v48 = v57;
  v47 = v58;
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v14, v16, v58);
  v32 = (void *)sub_1B1372F28();
  objc_msgSend(v32, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v32, sel_addTarget_action_forControlEvents_, v59, sel_didSelectActionButtonWithSender_, 64);
  v49 = objc_msgSend(v32, sel_titleLabel);
  if (v49)
  {
    v50 = v49;
    objc_msgSend(v49, sel_setAdjustsFontForContentSizeCategory_, 1);

  }
  (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v54);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v16, v47);
  return v32;
}

double sub_1B13569EC()
{
  uint64_t v0;
  uint64_t v1;
  double result;
  uint64_t v3;

  v1 = v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage____adSize;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage____adSize + 16) & 1) == 0)
    return *(double *)v1;
  result = sub_1B1356A30(v0);
  *(double *)v1 = result;
  *(_QWORD *)(v1 + 8) = v3;
  *(_BYTE *)(v1 + 16) = 0;
  return result;
}

double sub_1B1356A30(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  double v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v2 = sub_1B12CF7F8(&qword_1ED387C50);
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v19 - v6;
  v8 = sub_1B1356C50();
  v9 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation;
  v10 = *(void **)(a1 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
  if (v10)
  {
    v11 = v10;
    sub_1B1372658();

    v12 = sub_1B1371DC4();
    (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v7, 1, v12);
  }
  else
  {
    v13 = sub_1B1371DC4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 1, 1, v13);
  }
  sub_1B12D0D40((uint64_t)v7, &qword_1ED387C50);
  sub_1B13573D4();
  v14 = *(void **)(a1 + v9);
  if (v14)
  {
    v15 = v14;
    sub_1B1372658();

    v16 = sub_1B1371DC4();
    (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v5, 1, v16);
  }
  else
  {
    v17 = sub_1B1371DC4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v5, 1, 1, v17);
  }
  sub_1B12D0D40((uint64_t)v5, &qword_1ED387C50);
  sub_1B13577B0();
  sub_1B1357F4C();

  sub_1B1358390();
  sub_1B13585C0();
  return v8;
}

double sub_1B1356C50()
{
  char *v0;
  char *v1;
  double result;

  v1 = &v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___adSizeWidth];
  if ((v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___adSizeWidth + 8] & 1) == 0)
    return *(double *)v1;
  result = sub_1B1356C94(v0);
  *(double *)v1 = result;
  v1[8] = 0;
  return result;
}

double sub_1B1356C94(char *a1)
{
  id v2;
  double v3;
  double v4;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  double v9;

  v2 = objc_msgSend(*(id *)&a1[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_bestRepresentation);
  if (v2)
  {
    objc_msgSend(v2, sel_adSize);
    v4 = v3;
    swift_unknownObjectRelease();
  }
  else
  {
    v4 = 0.0;
  }
  v5 = sub_1B13728B0();
  if (v5 == sub_1B13728B0())
  {
    v6 = a1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_style];
    v7 = objc_msgSend(a1, sel_traitCollection);
    v8 = objc_msgSend(v7, sel_horizontalSizeClass);

    if (v8 == (id)2)
    {
      if (v6)
      {
        if (v6 == 1)
        {
LABEL_12:
          v9 = 283.0;
          goto LABEL_18;
        }
        v9 = 356.0;
      }
      else
      {
        v9 = 260.0;
      }
    }
    else
    {
      if (v8 != (id)1)
      {
        if (v4 < 0.0)
          return v4;
LABEL_19:
        if (v4 + -32.0 < 0.0)
          return 0.0;
        else
          return v4 + -32.0;
      }
      if (v6)
      {
        if (v6 != 1)
        {
          v9 = 297.0;
          goto LABEL_18;
        }
        goto LABEL_12;
      }
      v9 = 148.0;
    }
LABEL_18:
    if (v4 < v9)
      return v4;
    goto LABEL_19;
  }
  return v4;
}

double sub_1B1356E04()
{
  void *v0;
  id v1;
  char *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = objc_msgSend(v0, sel_traitCollection);
  v2 = (char *)objc_msgSend(v1, sel_horizontalSizeClass);

  if ((unint64_t)(v2 - 1) > 1)
  {
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v4 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v5 = swift_allocObject();
    v6 = MEMORY[0x1E0DEB418];
    *(_OWORD *)(v5 + 16) = xmmword_1B1375550;
    v7 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v5 + 56) = v6;
    *(_QWORD *)(v5 + 64) = v7;
    *(_QWORD *)(v5 + 32) = v2;
    sub_1B1372988();

    swift_bridgeObjectRelease();
    return *MEMORY[0x1E0DC49E8];
  }
  else
  {
    sub_1B13728B0();
    sub_1B13728B0();
    return 0.0;
  }
}

uint64_t sub_1B1356F84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v1 = sub_1B12CF7F8(&qword_1ED387C50);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(void **)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
  if (v4)
  {
    v5 = v4;
    sub_1B1372658();

    v6 = sub_1B1371DC4();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v3, 1, v6) != 1)
    {
      sub_1B12D0D40((uint64_t)v3, &qword_1ED387C50);
      return swift_beginAccess();
    }
  }
  else
  {
    v8 = sub_1B1371DC4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v3, 1, 1, v8);
  }
  return sub_1B12D0D40((uint64_t)v3, &qword_1ED387C50);
}

uint64_t sub_1B13570F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v1 = sub_1B12CF7F8(&qword_1ED387C50);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(void **)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
  if (v4)
  {
    v5 = v4;
    sub_1B1372658();

    v6 = sub_1B1371DC4();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v3, 1, v6) != 1)
    {
      sub_1B12D0D40((uint64_t)v3, &qword_1ED387C50);
      return swift_beginAccess();
    }
  }
  else
  {
    v8 = sub_1B1371DC4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v3, 1, 1, v8);
  }
  return sub_1B12D0D40((uint64_t)v3, &qword_1ED387C50);
}

uint64_t sub_1B1357264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v1 = sub_1B12CF7F8(&qword_1ED387C50);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(void **)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
  if (v4)
  {
    v5 = v4;
    sub_1B1372658();

    v6 = sub_1B1371DC4();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v3, 1, v6) != 1)
      return sub_1B12D0D40((uint64_t)v3, &qword_1ED387C50);
  }
  else
  {
    v8 = sub_1B1371DC4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v3, 1, 1, v8);
  }
  sub_1B12D0D40((uint64_t)v3, &qword_1ED387C50);
  return swift_beginAccess();
}

void sub_1B13573D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  id v20;
  id v21;
  double v22;
  id v23;
  id v24;
  uint64_t inited;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  __int128 v39;
  CGRect v40;

  v1 = v0;
  v2 = sub_1B12CF7F8(&qword_1ED387C50);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation;
  v6 = *(void **)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
  if (v6)
  {
    v7 = v6;
    sub_1B1372658();

    v8 = sub_1B1371DC4();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v4, 1, v8) != 1)
    {
      sub_1B12D0D40((uint64_t)v4, &qword_1ED387C50);
      return;
    }
  }
  else
  {
    v9 = sub_1B1371DC4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v4, 1, 1, v9);
  }
  sub_1B12D0D40((uint64_t)v4, &qword_1ED387C50);
  v10 = *(void **)(v1 + v5);
  if (!v10 || (v11 = v10, v12 = sub_1B1372628(), v14 = v13, v11, !v14))
  {
    swift_bridgeObjectRelease();
    v12 = 0;
    v14 = 0xE000000000000000;
  }
  if (qword_1ED3888B0 != -1)
    swift_once();
  sub_1B12CF7F8(&qword_1ED3899B0);
  v15 = swift_allocObject();
  v39 = xmmword_1B1375550;
  *(_OWORD *)(v15 + 16) = xmmword_1B1375550;
  *(_QWORD *)(v15 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v15 + 64) = sub_1B12CE678();
  *(_QWORD *)(v15 + 32) = v12;
  *(_QWORD *)(v15 + 40) = v14;
  swift_bridgeObjectRetain();
  sub_1B1372BB0();
  swift_bridgeObjectRelease();
  v16 = sub_1B1356C50() + -32.0;
  sub_1B1357264();
  v18 = v16 - v17;
  v19 = *MEMORY[0x1E0DC4AB8];
  v20 = sub_1B1363564(0x6C61697241, 0xE500000000000000, *MEMORY[0x1E0DC4AB8], 0, 1, 13.0);
  if (v20)
  {
    v21 = v20;
  }
  else
  {
    v22 = *MEMORY[0x1E0DC1440];
    v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC37F8]), sel_initForTextStyle_, v19);
    v24 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_weight_, 13.0, v22);
    v21 = objc_msgSend(v23, sel_scaledFontForFont_, v24);

  }
  sub_1B12CF7F8(&qword_1ED388E98);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v39;
  v26 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 64) = sub_1B12CFA9C(0, &qword_1ED388E50);
  *(_QWORD *)(inited + 40) = v21;
  v27 = v21;
  v28 = v26;
  sub_1B131A364(inited);
  v29 = (void *)sub_1B1372B74();
  type metadata accessor for Key(0);
  sub_1B12DD298();
  v30 = (void *)sub_1B1372B08();
  swift_bridgeObjectRelease();
  objc_msgSend(v29, sel_boundingRectWithSize_options_attributes_context_, 0, v30, 0, v18, 1.79769313e308);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  v40.origin.x = v32;
  v40.origin.y = v34;
  v40.size.width = v36;
  v40.size.height = v38;
  CGRectGetHeight(v40);
  swift_bridgeObjectRelease();

}

void sub_1B13577B0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  double v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  id v50;
  id v51;
  uint64_t inited;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  uint64_t v65;
  CGRect v66;
  CGRect v67;

  v1 = v0;
  v2 = sub_1B12CF7F8(&qword_1ED387C50);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(v0, sel_traitCollection);
  v6 = objc_msgSend(v5, sel_horizontalSizeClass);

  v7 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation;
  v8 = *(void **)&v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (v8)
  {
    v9 = v8;
    sub_1B1372688();
    v11 = v10;

    if (v11)
    {
      if (v6 != (id)2)
        goto LABEL_4;
LABEL_8:
      v16 = sub_1B135639C();
      if (v16)
      {
        v17 = v16;
        v18 = *(void **)&v1[v7];
        if (v18)
        {
          v19 = v18;
          sub_1B1372658();

          v20 = sub_1B1371DC4();
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 48))(v4, 1, v20) != 1)
          {
            sub_1B12D0D40((uint64_t)v4, &qword_1ED387C50);
            objc_msgSend(v17, sel_sizeThatFits_, sub_1B1356C50() + -32.0, 24.0);
            v22 = *(double *)&v1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___adSizeWidth]
                + -32.0
                - fmax(v21, 150.0)
                + -16.0;
            v23 = *MEMORY[0x1E0DC4AD0];
            v24 = sub_1B1363564(0x6F42206C61697241, 0xEA0000000000646CLL, *MEMORY[0x1E0DC4AD0], 0, 1, 20.0);
            if (v24)
            {
              v25 = v24;
            }
            else
            {
              v49 = *MEMORY[0x1E0DC1420];
              v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC37F8]), sel_initForTextStyle_, v23);
              v51 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_weight_, 20.0, v49);
              v25 = objc_msgSend(v50, sel_scaledFontForFont_, v51);

            }
            sub_1B12CF7F8(&qword_1ED388E98);
            inited = swift_initStackObject();
            *(_OWORD *)(inited + 16) = xmmword_1B1375550;
            v53 = (void *)*MEMORY[0x1E0DC1138];
            *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
            *(_QWORD *)(inited + 64) = sub_1B12CFA9C(0, &qword_1ED388E50);
            *(_QWORD *)(inited + 40) = v25;
            v37 = v25;
            v54 = v53;
            sub_1B131A364(inited);
            v55 = (void *)sub_1B1372B74();
            type metadata accessor for Key(0);
            sub_1B12DD298();
            v56 = (void *)sub_1B1372B08();
            swift_bridgeObjectRelease();
            objc_msgSend(v55, sel_boundingRectWithSize_options_attributes_context_, 1, v56, 0, v22, 1.79769313e308);
            v58 = v57;
            v60 = v59;
            v62 = v61;
            v64 = v63;

            v67.origin.x = v58;
            v67.origin.y = v60;
            v67.size.width = v62;
            v67.size.height = v64;
            CGRectGetHeight(v67);
            swift_bridgeObjectRelease();

            goto LABEL_21;
          }
        }
        else
        {
          v30 = sub_1B1371DC4();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v4, 1, 1, v30);
        }

        sub_1B12D0D40((uint64_t)v4, &qword_1ED387C50);
      }
      v12 = sub_1B1356C50() + -32.0;
      v13 = *MEMORY[0x1E0DC4AD0];
      v31 = sub_1B1363564(0x6F42206C61697241, 0xEA0000000000646CLL, *MEMORY[0x1E0DC4AD0], 0, 1, 20.0);
      if (v31)
      {
        v15 = v31;
        goto LABEL_20;
      }
LABEL_19:
      v32 = *MEMORY[0x1E0DC1420];
      v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC37F8]), sel_initForTextStyle_, v13);
      v34 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_weight_, 20.0, v32);
      v15 = objc_msgSend(v33, sel_scaledFontForFont_, v34);

      goto LABEL_20;
    }
  }
  swift_bridgeObjectRelease();
  if (v6 == (id)2)
    goto LABEL_8;
LABEL_4:
  if (v6 != (id)1)
  {
    swift_bridgeObjectRelease();
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v26 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v27 = swift_allocObject();
    v28 = MEMORY[0x1E0DEB418];
    *(_OWORD *)(v27 + 16) = xmmword_1B1375550;
    v29 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v27 + 56) = v28;
    *(_QWORD *)(v27 + 64) = v29;
    *(_QWORD *)(v27 + 32) = v6;
    sub_1B1372988();

    swift_bridgeObjectRelease();
    return;
  }
  v12 = sub_1B1356C50() + -32.0;
  v13 = *MEMORY[0x1E0DC4AD0];
  v14 = sub_1B1363564(0x6F42206C61697241, 0xEA0000000000646CLL, *MEMORY[0x1E0DC4AD0], 0, 1, 20.0);
  if (!v14)
    goto LABEL_19;
  v15 = v14;
LABEL_20:
  sub_1B12CF7F8(&qword_1ED388E98);
  v35 = swift_initStackObject();
  *(_OWORD *)(v35 + 16) = xmmword_1B1375550;
  v36 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(v35 + 32) = *MEMORY[0x1E0DC1138];
  *(_QWORD *)(v35 + 64) = sub_1B12CFA9C(0, &qword_1ED388E50);
  *(_QWORD *)(v35 + 40) = v15;
  v37 = v15;
  v38 = v36;
  sub_1B131A364(v35);
  v39 = (void *)sub_1B1372B74();
  type metadata accessor for Key(0);
  sub_1B12DD298();
  v40 = (void *)sub_1B1372B08();
  swift_bridgeObjectRelease();
  objc_msgSend(v39, sel_boundingRectWithSize_options_attributes_context_, 1, v40, 0, v12, 1.79769313e308);
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;

  v66.origin.x = v42;
  v66.origin.y = v44;
  v66.size.width = v46;
  v66.size.height = v48;
  CGRectGetHeight(v66);
  swift_bridgeObjectRelease();
LABEL_21:

}

double sub_1B1357F4C()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  id v21;
  id v22;
  double v23;
  double v24;
  id v25;
  id v26;
  uint64_t inited;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double Height;
  _BYTE v43[79];
  char v44;
  CGRect v45;

  v1 = sub_1B12CF7F8(&qword_1ED3877E0);
  MEMORY[0x1E0C80A78](v1);
  v3 = &v43[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_1B1371D10();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v43[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = *(_QWORD *)&v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements];
  v9 = sub_1B13623EC(v8);
  if (v10)
    v11 = v9;
  else
    v11 = 0;
  if (v10)
    v12 = v10;
  else
    v12 = 0xE000000000000000;
  sub_1B1362608(v8, v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_1B1371D04();
    sub_1B12D0D40((uint64_t)v3, &qword_1ED3877E0);
  }
  else
  {
    (*(void (**)(_BYTE *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  }
  v13 = objc_msgSend(v0, sel_traitCollection);
  v14 = objc_msgSend(v13, sel_horizontalSizeClass);

  v15 = v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_style];
  v16 = sub_1B135639C();

  if (v15)
  {
    if (v16)
    {
      type metadata accessor for CarouselCollectionViewCell();
      v44 = v15;
      v17 = sub_1B12DC3EC(v11, v12, &v44, (uint64_t)v14);
    }
    else
    {
      type metadata accessor for CTACarouselCollectionViewCell();
      v44 = v15;
      v17 = sub_1B12DDAE8(v11, v12, (uint64_t)v7, &v44, (uint64_t)v14);
    }
    goto LABEL_23;
  }
  if (!v16)
  {
    v44 = 0;
    v17 = sub_1B1345558(v11, v12, (uint64_t)v7, &v44, (uint64_t)v14);
LABEL_23:
    v23 = v17;
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  v18 = 148.0;
  if (v14 != (id)1)
    v18 = 0.0;
  if (v14 == (id)2)
    v19 = 260.0;
  else
    v19 = v18;
  v20 = *MEMORY[0x1E0DC4A98];
  v21 = sub_1B1363564(0x6C61697241, 0xE500000000000000, *MEMORY[0x1E0DC4A98], 0, 1, 13.0);
  if (v21)
  {
    v22 = v21;
  }
  else
  {
    v24 = *MEMORY[0x1E0DC1440];
    v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC37F8]), sel_initForTextStyle_, v20);
    v26 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_weight_, 13.0, v24);
    v22 = objc_msgSend(v25, sel_scaledFontForFont_, v26);

  }
  sub_1B12CF7F8(&qword_1ED388E98);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B1375550;
  v28 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 64) = sub_1B12CFA9C(0, &qword_1ED388E50);
  *(_QWORD *)(inited + 40) = v22;
  v29 = v22;
  v30 = v28;
  sub_1B131A364(inited);
  v31 = (void *)sub_1B1372B74();
  type metadata accessor for Key(0);
  sub_1B12DD298();
  v32 = (void *)sub_1B1372B08();
  swift_bridgeObjectRelease();
  objc_msgSend(v31, sel_boundingRectWithSize_options_attributes_context_, 1, v32, 0, v19 + -12.0, 1.79769313e308);
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;

  v45.origin.x = v34;
  v45.origin.y = v36;
  v45.size.width = v38;
  v45.size.height = v40;
  Height = CGRectGetHeight(v45);
  swift_bridgeObjectRelease();

  v23 = v19 + 6.0 + ceil(Height) + 6.0;
LABEL_26:
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  return v23;
}

double sub_1B1358390()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  double v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v1 = sub_1B12CF7F8(&qword_1ED387C50);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1B135639C();

  v5 = 0.0;
  if (v4)
  {
    v6 = objc_msgSend(v0, sel_traitCollection);
    v7 = objc_msgSend(v6, sel_horizontalSizeClass);

    v5 = 24.0;
    if (v7 != (id)1)
    {
      if (v7 == (id)2)
      {
        v8 = *(void **)&v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
        if (v8)
        {
          v9 = v8;
          sub_1B1372658();

          v10 = sub_1B1371DC4();
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v3, 1, v10) != 1)
          {
            sub_1B12D0D40((uint64_t)v3, &qword_1ED387C50);
            return 0.0;
          }
        }
        else
        {
          v15 = sub_1B1371DC4();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v3, 1, 1, v15);
        }
        sub_1B12D0D40((uint64_t)v3, &qword_1ED387C50);
        return v5;
      }
      sub_1B1372D90();
      sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
      v11 = (void *)sub_1B1372F70();
      sub_1B12CF7F8(&qword_1ED3899B0);
      v12 = swift_allocObject();
      v13 = MEMORY[0x1E0DEB418];
      *(_OWORD *)(v12 + 16) = xmmword_1B1375550;
      v14 = MEMORY[0x1E0DEB490];
      *(_QWORD *)(v12 + 56) = v13;
      *(_QWORD *)(v12 + 64) = v14;
      *(_QWORD *)(v12 + 32) = v7;
      sub_1B1372988();

      swift_bridgeObjectRelease();
      return 0.0;
    }
  }
  return v5;
}

double sub_1B13585C0()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  double result;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = objc_msgSend(v0, sel_traitCollection);
  v2 = objc_msgSend(v1, sel_horizontalSizeClass);

  if (v2 == (id)2)
  {
    v5 = sub_1B13728B0();
    v4 = v5 == sub_1B13728B0();
  }
  else
  {
    if (v2 != (id)1)
    {
      sub_1B1372D90();
      sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
      v7 = (void *)sub_1B1372F70();
      sub_1B12CF7F8(&qword_1ED3899B0);
      v8 = swift_allocObject();
      v9 = MEMORY[0x1E0DEB418];
      *(_OWORD *)(v8 + 16) = xmmword_1B1375550;
      v10 = MEMORY[0x1E0DEB490];
      *(_QWORD *)(v8 + 56) = v9;
      *(_QWORD *)(v8 + 64) = v10;
      *(_QWORD *)(v8 + 32) = v2;
      sub_1B1372988();

      swift_bridgeObjectRelease();
      return 0.0;
    }
    v3 = sub_1B135639C();

    v4 = v3 == 0;
  }
  result = 16.0;
  if (v4)
    return 8.0;
  return result;
}

uint64_t type metadata accessor for CarouselAdView()
{
  uint64_t result;

  result = qword_1ED388AA0;
  if (!qword_1ED388AA0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1B1358820(double a1, double a2, double a3, double a4)
{
  void *v4;
  objc_class *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  id v18;
  id v19;
  objc_super v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  v9 = (objc_class *)type metadata accessor for CarouselAdView();
  v21.receiver = v4;
  v21.super_class = v9;
  objc_msgSendSuper2(&v21, sel_frame);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v20.receiver = v4;
  v20.super_class = v9;
  objc_msgSendSuper2(&v20, sel_setFrame_, a1, a2, a3, a4);
  objc_msgSend(v4, sel_frame);
  v23.origin.x = v11;
  v23.origin.y = v13;
  v23.size.width = v15;
  v23.size.height = v17;
  if (!CGRectEqualToRect(v22, v23))
  {
    objc_msgSend(v4, sel_setNeedsLayout);
    objc_msgSend(v4, sel_layoutIfNeeded);
    v18 = sub_1B1355E48();
    v19 = objc_msgSend(v18, sel_collectionViewLayout);

    objc_msgSend(v19, sel_invalidateLayout);
  }
}

double sub_1B1358948()
{
  return sub_1B13569EC();
}

double sub_1B1358968()
{
  uint64_t v0;
  uint64_t *v1;

  v0 = sub_1B13728B0();
  if (v0 == sub_1B13728B0())
  {
    if (qword_1ED387B98 != -1)
      swift_once();
    v1 = &qword_1ED387B78;
  }
  else
  {
    if (qword_1ED388A80 != -1)
      swift_once();
    v1 = (uint64_t *)&xmmword_1EEF287E8;
  }
  return *(double *)v1;
}

void sub_1B1358A14()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
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
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  char *v36;
  id v37;
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_1B12CF7F8(&qword_1ED3896D8);
  MEMORY[0x1E0C80A78](v2);
  v39 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1B12CF7F8(&qword_1ED387C50);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B1371DC4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v38 - v12;
  v0[OBJC_IVAR___APPCPromotedContentView_shouldCollapseOnRotation] = 1;
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 1);
  objc_msgSend(v0, sel_setOpaque_, 1);
  v14 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v14, sel_setAllowsGroupOpacity_, 0);

  objc_msgSend(v1, sel_setClipsToBounds_, 1);
  v15 = OBJC_IVAR___APPCPromotedContentView_promotedContent;
  if (objc_msgSend(*(id *)&v1[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_bestRepresentation))
  {
    sub_1B13726A0();
    v16 = swift_dynamicCastClass();
    if (v16)
    {
      v17 = *(void **)&v1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
      *(_QWORD *)&v1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation] = v16;

    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  sub_1B1358F4C();
  v18 = *(void **)&v1[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView];
  objc_msgSend(v18, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v18, sel_addTarget_action_forControlEvents_, v1, sel_tappedPrivacyMarker_, 64);
  v19 = OBJC_IVAR___APPrivacyMarker_privacyMarkerType;
  if (!*((_BYTE *)v18 + OBJC_IVAR___APPrivacyMarker_privacyMarkerType))
  {
    if (objc_msgSend(*(id *)&v1[v15], sel_isOutstreamVideoAd))
      v20 = 2;
    else
      v20 = 0;
    *((_BYTE *)v18 + v19) = v20;
    sub_1B12D0FA0();
  }
  v21 = objc_msgSend(v1, sel_traitCollection);
  v22 = objc_msgSend(v21, sel_horizontalSizeClass);

  sub_1B13592A8(v22);
  sub_1B135D188((uint64_t)v22);
  v23 = *(void **)&v1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (!v23)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_14;
  }
  v24 = v23;
  sub_1B1372658();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_14:
    sub_1B12D0D40((uint64_t)v6, &qword_1ED387C50);
    goto LABEL_15;
  }
  v38 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v25 = v13;
  v38(v13, v6, v7);
  v26 = sub_1B1372D00();
  v27 = (uint64_t)v39;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v39, 1, 1, v26);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v25, v7);
  sub_1B1372CE8();
  v28 = v1;
  v29 = sub_1B1372CDC();
  v30 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v31 = (char *)swift_allocObject();
  v32 = MEMORY[0x1E0DF06E8];
  *((_QWORD *)v31 + 2) = v29;
  *((_QWORD *)v31 + 3) = v32;
  *((_QWORD *)v31 + 4) = v28;
  v38(&v31[v30], v11, v7);
  sub_1B1354F78(v27, (uint64_t)&unk_1EEF28820, (uint64_t)v31);
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v25, v7);
LABEL_15:
  sub_1B135D4F8();
  v33 = (void *)objc_opt_self();
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = v1;
  aBlock[4] = sub_1B135FAAC;
  aBlock[5] = v34;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B12E3264;
  aBlock[3] = &unk_1E62F9460;
  v35 = _Block_copy(aBlock);
  v36 = v1;
  swift_release();
  v37 = objc_msgSend(v33, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v35, 1.0);
  _Block_release(v35);

}

uint64_t sub_1B1358ED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v7;

  v5[2] = sub_1B1372CE8();
  v5[3] = sub_1B1372CDC();
  v7 = (_QWORD *)swift_task_alloc();
  v5[4] = v7;
  *v7 = v5;
  v7[1] = sub_1B130BAF4;
  return sub_1B135DB04(a5);
}

void sub_1B1358F4C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v1 = v0;
  v2 = sub_1B12CF7F8(&qword_1ED387C50);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1B1355724();
  objc_msgSend(v1, sel_addSubview_, v5);

  v6 = sub_1B1355914();
  objc_msgSend(v1, sel_addSubview_, v6);

  v7 = *(_QWORD *)&v1[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView];
  objc_msgSend(v1, sel_addSubview_, v7);
  v8 = *(void **)&v1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (v8)
  {
    v9 = v8;
    sub_1B1372658();

    v10 = sub_1B1371DC4();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v4, 1, v10) != 1)
    {
      sub_1B12D0D40((uint64_t)v4, &qword_1ED387C50);
      v11 = sub_1B13562DC();
      objc_msgSend(v1, sel_addSubview_, v11);
      goto LABEL_6;
    }
  }
  else
  {
    v12 = sub_1B1371DC4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v4, 1, 1, v12);
  }
  sub_1B12D0D40((uint64_t)v4, &qword_1ED387C50);
  v13 = sub_1B1355B98();
  objc_msgSend(v1, sel_addSubview_, v13);

  v14 = sub_1B1355B98();
  objc_msgSend(v14, sel_addSubview_, v7);

  v15 = sub_1B1355B98();
  v11 = sub_1B1355C1C();
  objc_msgSend(v15, sel_addSubview_, v11);

LABEL_6:
  v16 = sub_1B13559D0();
  objc_msgSend(v1, sel_addSubview_, v16);

  v17 = sub_1B1355E48();
  objc_msgSend(v1, sel_addSubview_, v17);

  v18 = sub_1B135639C();
  if (v18)
  {
    v19 = v18;
    objc_msgSend(v1, sel_addSubview_, v18);

  }
}

uint64_t sub_1B1359194()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v8;

  sub_1B12CF7F8(&qword_1ED389880);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1B1376390;
  v2 = *(void **)(v0 + OBJC_IVAR___APPCPromotedContentView_privacyMarkerView);
  *(_QWORD *)(v1 + 32) = v2;
  v3 = v2;
  *(_QWORD *)(v1 + 40) = sub_1B13559D0();
  *(_QWORD *)(v1 + 48) = sub_1B1355E48();
  v8 = v1;
  sub_1B1372CA0();
  v4 = sub_1B135639C();
  if (v4)
  {
    v5 = v4;
    MEMORY[0x1B5E1A310]();
    if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1B1372CAC();
    sub_1B1372CC4();
    sub_1B1372CA0();

    v1 = v8;
  }
  v6 = sub_1B1355200(v1);
  swift_bridgeObjectRelease();
  return v6;
}

void sub_1B13592A8(void *a1)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;

  v2 = sub_1B13593E4();
  sub_1B13549F8(v2);
  v3 = sub_1B1359770();
  sub_1B13549F8(v3);
  v4 = sub_1B135996C();
  sub_1B13549F8(v4);
  v5 = sub_1B1359C34((uint64_t)a1);
  sub_1B13549F8(v5);
  v6 = sub_1B135A800((uint64_t)a1);
  sub_1B13549F8(v6);
  v7 = sub_1B135A34C((uint64_t)a1);
  sub_1B13549F8(v7);
  v8 = sub_1B135AF88((uint64_t)a1);
  sub_1B13549F8(v8);
  v9 = sub_1B135BC78(a1);
  sub_1B13549F8(v9);
  v10 = sub_1B135C6A4((uint64_t)a1);
  sub_1B13549F8(v10);
  v11 = (void *)objc_opt_self();
  sub_1B12CFA9C(0, (unint64_t *)&qword_1ED388E28);
  v12 = (id)sub_1B1372C7C();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_activateConstraints_, v12);

}

uint64_t sub_1B13593E4()
{
  char *v0;
  uint64_t v1;
  id v2;
  id v3;
  double v4;
  double *v5;
  double v6;
  double v7;
  id v8;
  id v9;
  double v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  id v18;
  id v19;
  double v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  if (!*(_QWORD *)(*(_QWORD *)&v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements] + 16))
  {
    v6 = 0.0;
    v7 = 0.0;
    goto LABEL_20;
  }
  v1 = v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_style];
  v2 = objc_msgSend(v0, sel_traitCollection);
  v3 = objc_msgSend(v2, sel_horizontalSizeClass);

  if (v3 == (id)1)
  {
    v5 = (double *)&unk_1B13788F0;
  }
  else
  {
    v4 = 0.0;
    if (v3 != (id)2)
      goto LABEL_8;
    v5 = (double *)&unk_1B1378908;
  }
  v4 = v5[v1];
LABEL_8:
  v8 = objc_msgSend(v0, sel_traitCollection);
  v9 = objc_msgSend(v8, sel_horizontalSizeClass);

  if (v9 == (id)1)
  {
    v11 = (double *)&unk_1B1378920;
    goto LABEL_12;
  }
  v10 = 0.0;
  if (v9 == (id)2)
  {
    v11 = (double *)&unk_1B1378938;
LABEL_12:
    v10 = v11[v1];
  }
  sub_1B13569EC();
  v13 = 1.77777778;
  if ((_DWORD)v1 != 1)
    v13 = 1.0;
  v14 = v13 * v12;
  sub_1B1356E04();
  v16 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage____adSize;
  v17 = vabdd_f64(*(double *)&v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage____adSize] * 0.5, v4 + v15);
  v18 = objc_msgSend(v0, sel_traitCollection);
  v19 = objc_msgSend(v18, sel_horizontalSizeClass);

  v20 = 0.0;
  if (v19 == (id)1)
    v20 = 8.0;
  if (v19 == (id)2)
    v20 = 10.0;
  v7 = v17 * (v14 / (v10 + v20));
  v6 = *(double *)&v0[v16] * 0.5 - v14 * 0.5;
LABEL_20:
  sub_1B12CF7F8(&qword_1ED389880);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_1B1375DD0;
  v22 = sub_1B1355724();
  v23 = objc_msgSend(v22, sel_leadingAnchor);

  v24 = objc_msgSend(v0, sel_leadingAnchor);
  v25 = objc_msgSend(v23, sel_constraintEqualToAnchor_constant_, v24, v6 - v7);

  *(_QWORD *)(v21 + 32) = v25;
  v26 = sub_1B1355724();
  v27 = objc_msgSend(v26, sel_topAnchor);

  v28 = objc_msgSend(v0, sel_topAnchor);
  v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v28);

  *(_QWORD *)(v21 + 40) = v29;
  v30 = sub_1B1355724();
  v31 = objc_msgSend(v30, sel_trailingAnchor);

  v32 = objc_msgSend(v0, sel_trailingAnchor);
  v33 = objc_msgSend(v31, sel_constraintEqualToAnchor_, v32);

  *(_QWORD *)(v21 + 48) = v33;
  v34 = sub_1B1355724();
  v35 = objc_msgSend(v34, sel_bottomAnchor);

  v36 = objc_msgSend(v0, sel_bottomAnchor);
  v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v36);

  *(_QWORD *)(v21 + 56) = v37;
  sub_1B1372CA0();
  return v21;
}

uint64_t sub_1B1359770()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  sub_1B12CF7F8(&qword_1ED389880);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1B1375DD0;
  v2 = sub_1B1355914();
  v3 = objc_msgSend(v2, sel_leadingAnchor);

  v4 = objc_msgSend(v0, sel_leadingAnchor);
  v5 = objc_msgSend(v3, sel_constraintEqualToAnchor_, v4);

  *(_QWORD *)(v1 + 32) = v5;
  v6 = sub_1B1355914();
  v7 = objc_msgSend(v6, sel_topAnchor);

  v8 = objc_msgSend(v0, sel_topAnchor);
  v9 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v8);

  *(_QWORD *)(v1 + 40) = v9;
  v10 = sub_1B1355914();
  v11 = objc_msgSend(v10, sel_trailingAnchor);

  v12 = objc_msgSend(v0, sel_trailingAnchor);
  v13 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v12);

  *(_QWORD *)(v1 + 48) = v13;
  v14 = sub_1B1355914();
  v15 = objc_msgSend(v14, sel_bottomAnchor);

  v16 = objc_msgSend(v0, sel_bottomAnchor);
  v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

  *(_QWORD *)(v1 + 56) = v17;
  sub_1B1372CA0();
  return v1;
}

uint64_t sub_1B135996C()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = sub_1B12CF7F8(&qword_1ED387C50);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(void **)&v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (v5)
  {
    v6 = v5;
    sub_1B1372658();

    v7 = sub_1B1371DC4();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v4, 1, v7) != 1)
    {
      sub_1B12D0D40((uint64_t)v4, &qword_1ED387C50);
      sub_1B12CF7F8(&qword_1ED389880);
      v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_1B1375DD0;
      v9 = sub_1B13562DC();
      v10 = objc_msgSend(v9, sel_leadingAnchor);

      v11 = objc_msgSend(v1, sel_leadingAnchor);
      v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_constant_, v11, 16.0);

      *(_QWORD *)(v8 + 32) = v12;
      v13 = sub_1B13562DC();
      v14 = objc_msgSend(v13, sel_topAnchor);

      v15 = objc_msgSend(v1, sel_topAnchor);
      v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_constant_, v15, 16.0);

      *(_QWORD *)(v8 + 40) = v16;
      v17 = sub_1B13562DC();
      v18 = objc_msgSend(v17, sel_widthAnchor);

      v19 = objc_msgSend(v18, sel_constraintLessThanOrEqualToConstant_, 150.0);
      *(_QWORD *)(v8 + 48) = v19;
      v20 = sub_1B13562DC();
      v21 = objc_msgSend(v20, sel_heightAnchor);

      v22 = objc_msgSend(v21, sel_constraintEqualToConstant_, 32.0);
      *(_QWORD *)(v8 + 56) = v22;
      v26 = v8;
      sub_1B1372CA0();
      return v26;
    }
  }
  else
  {
    v24 = sub_1B1371DC4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v4, 1, 1, v24);
  }
  sub_1B12D0D40((uint64_t)v4, &qword_1ED387C50);
  return MEMORY[0x1E0DEE9D8];
}

unint64_t sub_1B1359C34(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  unsigned __int8 v55;
  unint64_t v56;

  v2 = v1;
  v4 = sub_1B12CF7F8(&qword_1ED387C50);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = MEMORY[0x1E0DEE9D8];
  if ((unint64_t)(a1 - 1) > 1)
  {
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v10 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v11 = swift_allocObject();
    v12 = MEMORY[0x1E0DEB418];
    *(_OWORD *)(v11 + 16) = xmmword_1B1375550;
    v13 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v11 + 56) = v12;
    *(_QWORD *)(v11 + 64) = v13;
    *(_QWORD *)(v11 + 32) = a1;
    sub_1B1372988();

    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9D8];
  }
  v7 = *(void **)&v1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (v7)
  {
    v8 = v7;
    sub_1B1372658();

    v9 = sub_1B1371DC4();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v6, 1, v9) != 1)
    {
      sub_1B12D0D40((uint64_t)v6, &qword_1ED387C50);
      return MEMORY[0x1E0DEE9D8];
    }
  }
  else
  {
    v15 = sub_1B1371DC4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v6, 1, 1, v15);
  }
  sub_1B12D0D40((uint64_t)v6, &qword_1ED387C50);
  v55 = *(_BYTE *)(*(_QWORD *)&v2[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView]
                 + OBJC_IVAR___APPrivacyMarker_privacyMarkerType);
  v16 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v17 = objc_msgSend(v16, sel_preferredContentSizeCategory);

  swift_beginAccess();
  _s17PromotedContentUI13PrivacyMarkerC07privacyE4Size4type12sizeCategory015minimumTappableG0So6CGSizeVAA0dE4TypeO_So09UIContentgJ0aAItFZ_0(&v55, (uint64_t)v17);
  v19 = v18;

  sub_1B13573D4();
  if (v19 > v20)
    v21 = v19;
  else
    v21 = v20;
  sub_1B13573D4();
  if (v22 >= v19)
  {
    v30 = sub_1B1355B98();
    v27 = objc_msgSend(v30, sel_topAnchor);

    v28 = objc_msgSend(v2, sel_topAnchor);
    v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_constant_, v28, 16.0);
  }
  else
  {
    sub_1B13573D4();
    v24 = (v19 - v23) * -0.5 + 16.0;
    if (v24 < 0.0)
      v25 = 0.0;
    else
      v25 = v24;
    v26 = sub_1B1355B98();
    v27 = objc_msgSend(v26, sel_topAnchor);

    v28 = objc_msgSend(v2, sel_topAnchor);
    v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_constant_, v28, v25);
  }
  v31 = v29;

  v32 = v31;
  MEMORY[0x1B5E1A310]();
  if (*(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1B1372CAC();
  sub_1B1372CC4();
  sub_1B1372CA0();

  v33 = sub_1B1355B98();
  v34 = objc_msgSend(v33, sel_leadingAnchor);

  v35 = objc_msgSend(v2, sel_leadingAnchor);
  v36 = objc_msgSend(v34, sel_constraintGreaterThanOrEqualToAnchor_constant_, v35, 16.0);

  v37 = sub_1B1355B98();
  v38 = objc_msgSend(v37, sel_trailingAnchor);

  v39 = objc_msgSend(v2, sel_trailingAnchor);
  v40 = objc_msgSend(v38, sel_constraintLessThanOrEqualToAnchor_constant_, v39, -16.0);

  v41 = sub_1B1355B98();
  v42 = objc_msgSend(v41, sel_centerXAnchor);

  v43 = objc_msgSend(v2, sel_centerXAnchor);
  v44 = objc_msgSend(v42, sel_constraintEqualToAnchor_, v43);

  v45 = sub_1B1355B98();
  v46 = objc_msgSend(v45, sel_heightAnchor);

  v47 = objc_msgSend(v46, sel_constraintEqualToConstant_, v21);
  if (!(v56 >> 62))
  {
    v48 = *(_QWORD *)((v56 & 0xFFFFFFFFFFFFF8) + 0x10);
    v49 = v48 + 4;
    if (!__OFADD__(v48, 4))
      goto LABEL_21;
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  swift_bridgeObjectRetain();
  v53 = sub_1B137318C();
  swift_bridgeObjectRelease();
  v49 = v53 + 4;
  if (__OFADD__(v53, 4))
    goto LABEL_31;
LABEL_21:
  sub_1B13602A0(v49, 1);
  sub_1B1372CA0();
  v36 = v36;
  MEMORY[0x1B5E1A310]();
  if (*(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
LABEL_32:
    sub_1B1372CAC();
  sub_1B1372CC4();
  sub_1B1372CA0();
  v50 = v40;
  MEMORY[0x1B5E1A310]();
  if (*(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1B1372CAC();
  sub_1B1372CC4();
  sub_1B1372CA0();
  v51 = v44;
  MEMORY[0x1B5E1A310]();
  if (*(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1B1372CAC();
  sub_1B1372CC4();
  sub_1B1372CA0();
  v52 = v47;
  MEMORY[0x1B5E1A310]();
  if (*(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1B1372CAC();
  sub_1B1372CC4();
  sub_1B1372CA0();

  return v56;
}

unint64_t sub_1B135A34C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v2 = v1;
  v4 = sub_1B12CF7F8(&qword_1ED387C50);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = MEMORY[0x1E0DEE9D8];
  if ((unint64_t)(a1 - 1) > 1)
  {
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v11 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v12 = swift_allocObject();
    v13 = MEMORY[0x1E0DEB418];
    *(_OWORD *)(v12 + 16) = xmmword_1B1375550;
    v14 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v12 + 56) = v13;
    *(_QWORD *)(v12 + 64) = v14;
    *(_QWORD *)(v12 + 32) = a1;
    sub_1B1372988();

    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9D8];
  }
  v7 = *(void **)(v1 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
  if (v7)
  {
    v8 = v7;
    sub_1B1372658();

    v9 = sub_1B1371DC4();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v6, 1, v9) == 1)
    {
      v10 = MEMORY[0x1E0DEE9D8];
      goto LABEL_7;
    }
    sub_1B12D0D40((uint64_t)v6, &qword_1ED387C50);
    return MEMORY[0x1E0DEE9D8];
  }
  v15 = sub_1B1371DC4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v6, 1, 1, v15);
  v10 = v37;
LABEL_7:
  sub_1B12D0D40((uint64_t)v6, &qword_1ED387C50);
  v16 = sub_1B1355C1C();
  v17 = objc_msgSend(v16, sel_leadingAnchor);

  v18 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v2
                                                              + OBJC_IVAR___APPCPromotedContentView_privacyMarkerView), sel_trailingAnchor));
  v19 = objc_msgSend(v17, sel_constraintEqualToAnchor_constant_, v18, -1.0);

  v20 = sub_1B1355C1C();
  v21 = objc_msgSend(v20, sel_trailingAnchor);

  v22 = sub_1B1355B98();
  v23 = objc_msgSend(v22, sel_trailingAnchor);

  v24 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v23);
  v25 = sub_1B1355C1C();
  v26 = objc_msgSend(v25, sel_centerYAnchor);

  v27 = sub_1B1355B98();
  v28 = objc_msgSend(v27, sel_centerYAnchor);

  v29 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v28);
  if (!(v10 >> 62))
  {
    v30 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    v31 = v30 + 3;
    if (!__OFADD__(v30, 3))
      goto LABEL_9;
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  v35 = sub_1B137318C();
  swift_bridgeObjectRelease();
  v31 = v35 + 3;
  if (__OFADD__(v35, 3))
    goto LABEL_19;
LABEL_9:
  sub_1B13602A0(v31, 1);
  sub_1B1372CA0();
  v10 = (unint64_t)v19;
  MEMORY[0x1B5E1A310]();
  if (*(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
LABEL_20:
    sub_1B1372CAC();
  sub_1B1372CC4();
  sub_1B1372CA0();
  v32 = v24;
  MEMORY[0x1B5E1A310]();
  if (*(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1B1372CAC();
  sub_1B1372CC4();
  sub_1B1372CA0();
  v33 = v29;
  MEMORY[0x1B5E1A310]();
  if (*(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1B1372CAC();
  sub_1B1372CC4();
  sub_1B1372CA0();

  return v37;
}

unint64_t sub_1B135A800(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  _BYTE *v29;
  id v30;
  id v31;
  double v32;
  double v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unsigned __int8 v54;
  unint64_t v55;

  v2 = v1;
  v4 = sub_1B12CF7F8(&qword_1ED387C50);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = MEMORY[0x1E0DEE9D8];
  if ((unint64_t)(a1 - 1) > 1)
  {
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v23 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v24 = swift_allocObject();
    v25 = MEMORY[0x1E0DEB418];
    *(_OWORD *)(v24 + 16) = xmmword_1B1375550;
    v26 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v24 + 56) = v25;
    *(_QWORD *)(v24 + 64) = v26;
    *(_QWORD *)(v24 + 32) = a1;
    sub_1B1372988();

    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9D8];
  }
  v7 = *(void **)&v1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (!v7)
  {
    v28 = sub_1B1371DC4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v6, 1, 1, v28);
    v11 = v55;
LABEL_12:
    sub_1B12D0D40((uint64_t)v6, &qword_1ED387C50);
    v29 = *(_BYTE **)&v2[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView];
    v54 = v29[OBJC_IVAR___APPrivacyMarker_privacyMarkerType];
    v30 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
    v31 = objc_msgSend(v30, sel_preferredContentSizeCategory);

    swift_beginAccess();
    _s17PromotedContentUI13PrivacyMarkerC07privacyE4Size4type12sizeCategory015minimumTappableG0So6CGSizeVAA0dE4TypeO_So09UIContentgJ0aAItFZ_0(&v54, (uint64_t)v31);
    v33 = v32;

    v34 = objc_msgSend(v29, sel_leadingAnchor);
    v35 = sub_1B1355B98();
    v36 = objc_msgSend(v35, sel_leadingAnchor);

    v37 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v36);
    v38 = objc_msgSend(v29, sel_trailingAnchor);
    v39 = sub_1B1355C1C();
    v40 = objc_msgSend(v39, sel_leadingAnchor);

    v41 = objc_msgSend(v38, sel_constraintEqualToAnchor_constant_, v40, 1.0);
    v42 = objc_msgSend(v29, sel_centerYAnchor);
    v43 = sub_1B1355B98();
    v44 = objc_msgSend(v43, sel_centerYAnchor);

    v45 = objc_msgSend(v42, sel_constraintEqualToAnchor_, v44);
    v46 = objc_msgSend(v29, sel_widthAnchor);
    v47 = objc_msgSend(v46, sel_constraintEqualToConstant_, v33);

    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      v51 = sub_1B137318C();
      swift_bridgeObjectRelease();
      v49 = v51 + 4;
      if (!__OFADD__(v51, 4))
      {
LABEL_14:
        sub_1B13602A0(v49, 1);
        sub_1B1372CA0();
        v37 = v37;
        MEMORY[0x1B5E1A310]();
        if (*(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        {
LABEL_15:
          sub_1B1372CC4();
          sub_1B1372CA0();
          v22 = v41;
          MEMORY[0x1B5E1A310]();
          if (*(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1B1372CAC();
          sub_1B1372CC4();
          sub_1B1372CA0();
          v15 = v45;
          MEMORY[0x1B5E1A310]();
          if (*(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1B1372CAC();
          sub_1B1372CC4();
          sub_1B1372CA0();
          v50 = v47;
          MEMORY[0x1B5E1A310]();
          if (*(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1B1372CAC();
          sub_1B1372CC4();
          sub_1B1372CA0();

          goto LABEL_22;
        }
LABEL_26:
        sub_1B1372CAC();
        goto LABEL_15;
      }
    }
    else
    {
      v48 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
      v49 = v48 + 4;
      if (!__OFADD__(v48, 4))
        goto LABEL_14;
    }
    __break(1u);
    goto LABEL_26;
  }
  v8 = v7;
  sub_1B1372658();

  v9 = sub_1B1371DC4();
  v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v6, 1, v9);
  v11 = MEMORY[0x1E0DEE9D8];
  if (v10 == 1)
    goto LABEL_12;
  sub_1B12D0D40((uint64_t)v6, &qword_1ED387C50);
  v12 = *(void **)&v2[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView];
  v13 = objc_msgSend(v12, sel_topAnchor);
  v14 = objc_msgSend(v2, sel_topAnchor);
  sub_1B1356F84();
  v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_constant_, v14);

  v16 = objc_msgSend(v12, sel_trailingAnchor);
  v17 = objc_msgSend(v2, sel_trailingAnchor);
  sub_1B13570F4();
  v19 = objc_msgSend(v16, sel_constraintEqualToAnchor_constant_, v17, -v18);

  if (!(v11 >> 62))
  {
    v20 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    v21 = v20 + 2;
    if (!__OFADD__(v20, 2))
      goto LABEL_6;
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  swift_bridgeObjectRetain();
  v52 = sub_1B137318C();
  swift_bridgeObjectRelease();
  v21 = v52 + 2;
  if (__OFADD__(v52, 2))
    goto LABEL_29;
LABEL_6:
  sub_1B13602A0(v21, 1);
  sub_1B1372CA0();
  v15 = v15;
  MEMORY[0x1B5E1A310]();
  if (*(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
LABEL_30:
    sub_1B1372CAC();
  sub_1B1372CC4();
  sub_1B1372CA0();
  v22 = v19;
  MEMORY[0x1B5E1A310]();
  if (*(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1B1372CAC();
  sub_1B1372CC4();
  sub_1B1372CA0();
LABEL_22:

  return v55;
}

uint64_t sub_1B135AF88(uint64_t a1)
{
  char *v1;
  char *v2;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int (*v45)(uint64_t, uint64_t, uint64_t);
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int (*v59)(char *, uint64_t, uint64_t);
  id v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  double v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  id v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  uint64_t v79;
  double v80;
  uint64_t v81;
  id v82;
  id v83;
  id v84;
  id v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  uint64_t v91;
  __objc2_ivar_list **p_ivars;
  id v93;
  uint64_t v94;
  id v95;
  id v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  uint64_t v112;
  id v113;
  id v114;
  id v115;
  id v116;
  void *v117;
  id v118;
  char *v119;
  char *v120;
  char *v121;
  uint64_t v122;

  v2 = v1;
  v4 = sub_1B12CF7F8(&qword_1ED387C50);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v119 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = (char *)&v119 - v9;
  v11 = MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v119 - v12;
  v14 = MEMORY[0x1E0C80A78](v11);
  v16 = (char *)&v119 - v15;
  v17 = MEMORY[0x1E0C80A78](v14);
  v120 = (char *)&v119 - v18;
  v19 = MEMORY[0x1E0C80A78](v17);
  v119 = (char *)&v119 - v20;
  MEMORY[0x1E0C80A78](v19);
  v121 = (char *)&v119 - v21;
  sub_1B12CF7F8(&qword_1ED389880);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_1B1375FF0;
  v23 = sub_1B13559D0();
  v24 = objc_msgSend(v23, sel_leadingAnchor);

  v25 = objc_msgSend(v2, sel_leadingAnchor);
  v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_constant_, v25, 16.0);

  *(_QWORD *)(v22 + 32) = v26;
  v122 = v22;
  sub_1B1372CA0();
  v27 = v122;
  if (a1 != 2)
  {
    if (a1 != 1)
    {
      swift_bridgeObjectRelease();
      sub_1B1372D90();
      sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
      v67 = (void *)sub_1B1372F70();
      sub_1B12CF7F8(&qword_1ED3899B0);
      v68 = swift_allocObject();
      v69 = MEMORY[0x1E0DEB418];
      *(_OWORD *)(v68 + 16) = xmmword_1B1375550;
      v70 = MEMORY[0x1E0DEB490];
      *(_QWORD *)(v68 + 56) = v69;
      *(_QWORD *)(v68 + 64) = v70;
      *(_QWORD *)(v68 + 32) = a1;
      sub_1B1372988();

      swift_bridgeObjectRelease();
      return MEMORY[0x1E0DEE9D8];
    }
    v28 = sub_1B13559D0();
    v29 = objc_msgSend(v28, sel_trailingAnchor);

    v30 = objc_msgSend(v2, sel_trailingAnchor);
    v31 = objc_msgSend(v29, sel_constraintEqualToAnchor_constant_, v30, -16.0);

    v32 = sub_1B13559D0();
    v33 = objc_msgSend(v32, sel_bottomAnchor);

    v34 = sub_1B1355E48();
    v35 = objc_msgSend(v34, sel_topAnchor);

    v36 = objc_msgSend(v33, sel_constraintEqualToAnchor_constant_, v35, -16.0);
    if (v27 >> 62)
    {
      swift_bridgeObjectRetain();
      v37 = sub_1B137318C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v37 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v38 = (uint64_t)v121;
    if (__OFADD__(v37, 2))
    {
      __break(1u);
    }
    else
    {
      sub_1B13602A0(v37 + 2, 1);
      sub_1B1372CA0();
      v27 = (unint64_t)v31;
      MEMORY[0x1B5E1A310]();
      if (*(_QWORD *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        goto LABEL_7;
    }
    sub_1B1372CAC();
LABEL_7:
    sub_1B1372CC4();
    sub_1B1372CA0();
    v39 = v36;
    MEMORY[0x1B5E1A310]();
    if (*(_QWORD *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1B1372CAC();
    sub_1B1372CC4();
    sub_1B1372CA0();

    v40 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation;
    v41 = *(void **)&v2[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
    if (v41)
    {
      v42 = v41;
      sub_1B1372658();

      v43 = sub_1B1371DC4();
      v44 = *(_QWORD *)(v43 - 8);
      v45 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48);
      if (v45(v38, 1, v43) != 1)
      {
        sub_1B12D0D40(v38, &qword_1ED387C50);
        v46 = sub_1B13559D0();
        v47 = objc_msgSend(v46, sel_topAnchor);

        v48 = sub_1B13562DC();
        v49 = objc_msgSend(v48, sel_bottomAnchor);

        v50 = *(void **)&v2[v40];
        if (v50)
        {
          v51 = v50;
          v52 = (uint64_t)v119;
          sub_1B1372658();

          if (v45(v52, 1, v43) == 1)
            v53 = 8.0;
          else
            v53 = 12.0;
        }
        else
        {
          v52 = (uint64_t)v119;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v44 + 56))(v119, 1, 1, v43);
          v53 = 8.0;
        }
        sub_1B12D0D40(v52, &qword_1ED387C50);
        v95 = objc_msgSend(v47, sel_constraintEqualToAnchor_constant_, v49, v53);

LABEL_55:
        v118 = v95;
        MEMORY[0x1B5E1A310]();
        if (*(_QWORD *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1B1372CAC();
        sub_1B1372CC4();
        sub_1B1372CA0();

        return v122;
      }
    }
    else
    {
      v81 = sub_1B1371DC4();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v81 - 8) + 56))(v38, 1, 1, v81);
    }
    sub_1B12D0D40(v38, &qword_1ED387C50);
    v82 = sub_1B13559D0();
    v83 = objc_msgSend(v82, sel_topAnchor);

    v84 = sub_1B1355C1C();
    v85 = objc_msgSend(v84, sel_bottomAnchor);

    v86 = *(void **)&v2[v40];
    if (v86)
    {
      v87 = v86;
      v88 = (uint64_t)v120;
      sub_1B1372658();

      v89 = sub_1B1371DC4();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 48))(v88, 1, v89) == 1)
        v90 = 8.0;
      else
        v90 = 12.0;
    }
    else
    {
      v94 = sub_1B1371DC4();
      v88 = (uint64_t)v120;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v94 - 8) + 56))(v120, 1, 1, v94);
      v90 = 8.0;
    }
    sub_1B12D0D40(v88, &qword_1ED387C50);
    v95 = objc_msgSend(v83, sel_constraintEqualToAnchor_constant_, v85, v90);

    goto LABEL_55;
  }
  v121 = v7;
  v54 = OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation;
  v55 = *(void **)&v2[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (v55)
  {
    v56 = v55;
    sub_1B1372658();

    v57 = sub_1B1371DC4();
    v58 = *(_QWORD *)(v57 - 8);
    v59 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48);
    if (v59(v16, 1, v57) != 1)
    {
      sub_1B12D0D40((uint64_t)v16, &qword_1ED387C50);
      v60 = sub_1B13559D0();
      v61 = objc_msgSend(v60, sel_topAnchor);

      v62 = sub_1B13562DC();
      v63 = objc_msgSend(v62, sel_bottomAnchor);

      v64 = *(void **)&v2[v54];
      if (v64)
      {
        v65 = v64;
        sub_1B1372658();

        if (v59(v13, 1, v57) == 1)
          v66 = 8.0;
        else
          v66 = 12.0;
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v58 + 56))(v13, 1, 1, v57);
        v66 = 8.0;
      }
      p_ivars = &AppStoreSession.ivars;
      sub_1B12D0D40((uint64_t)v13, &qword_1ED387C50);
      v93 = objc_msgSend(v61, sel_constraintEqualToAnchor_constant_, v63, v66);

      goto LABEL_38;
    }
  }
  else
  {
    v72 = sub_1B1371DC4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 56))(v16, 1, 1, v72);
  }
  sub_1B12D0D40((uint64_t)v16, &qword_1ED387C50);
  v73 = sub_1B13559D0();
  v74 = objc_msgSend(v73, sel_topAnchor);

  v75 = sub_1B1355C1C();
  v76 = objc_msgSend(v75, sel_bottomAnchor);

  v77 = *(void **)&v2[v54];
  if (v77)
  {
    v78 = v77;
    sub_1B1372658();

    v79 = sub_1B1371DC4();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v79 - 8) + 48))(v10, 1, v79) == 1)
      v80 = 8.0;
    else
      v80 = 12.0;
  }
  else
  {
    v91 = sub_1B1371DC4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v91 - 8) + 56))(v10, 1, 1, v91);
    v80 = 8.0;
  }
  p_ivars = (__objc2_ivar_list **)(&AppStoreSession + 48);
  sub_1B12D0D40((uint64_t)v10, &qword_1ED387C50);
  v93 = objc_msgSend(v74, sel_constraintEqualToAnchor_constant_, v76, v80);

LABEL_38:
  v96 = v93;
  MEMORY[0x1B5E1A310]();
  if (*(_QWORD *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1B1372CAC();
  sub_1B1372CC4();
  sub_1B1372CA0();

  v97 = sub_1B135639C();
  if (!v97)
  {
    v108 = sub_1B13559D0();
    v109 = objc_msgSend(v108, sel_trailingAnchor);

    v110 = objc_msgSend(v2, sel_trailingAnchor);
    v111 = objc_msgSend(v109, sel_constraintEqualToAnchor_constant_, v110, -16.0);

    v98 = v111;
    MEMORY[0x1B5E1A310]();
    if (*(_QWORD *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1B1372CAC();
    sub_1B1372CC4();
    sub_1B1372CA0();
    goto LABEL_52;
  }
  v98 = v97;
  v99 = *(void **)&v2[v54];
  if (!v99)
  {
    v112 = sub_1B1371DC4();
    v101 = (uint64_t)v121;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v112 - 8) + 56))(v121, 1, 1, v112);
    goto LABEL_48;
  }
  v100 = v99;
  v101 = (uint64_t)v121;
  sub_1B1372658();

  v102 = sub_1B1371DC4();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v102 - 8) + 48))(v101, 1, v102) == 1)
  {
LABEL_48:
    sub_1B12D0D40(v101, &qword_1ED387C50);
    v113 = sub_1B13559D0();
    v114 = objc_msgSend(v113, sel_trailingAnchor);

    v115 = objc_msgSend(v2, sel_trailingAnchor);
    v116 = objc_msgSend(v114, sel_constraintEqualToAnchor_constant_, v115, -16.0);

    v107 = v116;
    goto LABEL_49;
  }
  sub_1B12D0D40(v101, &qword_1ED387C50);
  v103 = sub_1B13559D0();
  v104 = objc_msgSend(v103, sel_trailingAnchor);

  v105 = objc_msgSend(v98, (SEL)p_ivars[331]);
  v106 = objc_msgSend(v104, sel_constraintEqualToAnchor_constant_, v105, -16.0);

  v107 = v106;
LABEL_49:
  v117 = v107;
  MEMORY[0x1B5E1A310]();
  if (*(_QWORD *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1B1372CAC();
  sub_1B1372CC4();
  sub_1B1372CA0();

LABEL_52:
  return v122;
}

uint64_t sub_1B135BC78(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;

  v2 = v1;
  v4 = sub_1B12CF7F8(&qword_1ED387C50);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B12CF7F8(&qword_1ED389880);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1B1376D10;
  v8 = sub_1B1355E48();
  v9 = objc_msgSend(v8, sel_leadingAnchor);

  v10 = objc_msgSend(v2, sel_leadingAnchor);
  v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(_QWORD *)(v7 + 32) = v11;
  v12 = sub_1B1355E48();
  v13 = objc_msgSend(v12, sel_trailingAnchor);

  v14 = objc_msgSend(v2, sel_trailingAnchor);
  v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v14);

  *(_QWORD *)(v7 + 40) = v15;
  v77 = v7;
  sub_1B1372CA0();
  v16 = v77;
  if (a1 == (void *)2)
  {
    v30 = sub_1B135639C();
    if (v30)
    {
      a1 = v30;
      v31 = *(void **)&v2[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
      if (v31)
      {
        v32 = v31;
        sub_1B1372658();

        v33 = sub_1B1371DC4();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 48))(v6, 1, v33) != 1)
        {
          sub_1B12D0D40((uint64_t)v6, &qword_1ED387C50);
          v34 = sub_1B1355E48();
          v35 = objc_msgSend(v34, sel_topAnchor);

          v36 = sub_1B13559D0();
          v37 = objc_msgSend(v36, sel_bottomAnchor);

          v38 = objc_msgSend(v35, sel_constraintEqualToAnchor_constant_, v37, 16.0);
          v39 = sub_1B1355E48();
          v40 = objc_msgSend(v39, sel_bottomAnchor);

          v41 = objc_msgSend(v2, sel_bottomAnchor);
          v29 = objc_msgSend(v40, sel_constraintEqualToAnchor_constant_, v41, -sub_1B13585C0());

          if (v16 >> 62)
          {
            swift_bridgeObjectRetain();
            v75 = sub_1B137318C();
            swift_bridgeObjectRelease();
            v43 = v75 + 2;
            if (!__OFADD__(v75, 2))
              goto LABEL_28;
          }
          else
          {
            v42 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
            v43 = v42 + 2;
            if (!__OFADD__(v42, 2))
              goto LABEL_28;
          }
          __break(1u);
          goto LABEL_14;
        }
      }
      else
      {
        v63 = sub_1B1371DC4();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 56))(v6, 1, 1, v63);
        v16 = v77;
      }
      sub_1B12D0D40((uint64_t)v6, &qword_1ED387C50);
      v64 = sub_1B1355E48();
      v65 = objc_msgSend(v64, sel_topAnchor);

      v66 = objc_msgSend(a1, sel_bottomAnchor);
      v38 = objc_msgSend(v65, sel_constraintEqualToAnchor_constant_, v66, 16.0);

      v67 = sub_1B1355E48();
      v68 = objc_msgSend(v67, sel_bottomAnchor);

      v69 = objc_msgSend(v2, sel_bottomAnchor);
      v29 = objc_msgSend(v68, sel_constraintEqualToAnchor_constant_, v69, -sub_1B13585C0());

      if (v16 >> 62)
      {
        swift_bridgeObjectRetain();
        v73 = sub_1B137318C();
        swift_bridgeObjectRelease();
        v43 = v73 + 2;
        if (!__OFADD__(v73, 2))
          goto LABEL_28;
      }
      else
      {
        v70 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
        v43 = v70 + 2;
        if (!__OFADD__(v70, 2))
        {
LABEL_28:
          sub_1B13602A0(v43, 1);
          sub_1B1372CA0();
          v71 = v38;
          MEMORY[0x1B5E1A310]();
          if (*(_QWORD *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1B1372CAC();
          sub_1B1372CC4();
          sub_1B1372CA0();
          v72 = v29;
          MEMORY[0x1B5E1A310]();
          if (*(_QWORD *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1B1372CAC();
          sub_1B1372CC4();
          sub_1B1372CA0();

          return v77;
        }
      }
      __break(1u);
LABEL_37:
      sub_1B1372CAC();
      goto LABEL_16;
    }
    v53 = sub_1B1355E48();
    v54 = objc_msgSend(v53, sel_topAnchor);

    v55 = sub_1B13559D0();
    v56 = objc_msgSend(v55, sel_bottomAnchor);

    v24 = objc_msgSend(v54, sel_constraintEqualToAnchor_constant_, v56, 16.0);
    v57 = sub_1B1355E48();
    v58 = objc_msgSend(v57, sel_bottomAnchor);

    v59 = objc_msgSend(v2, sel_bottomAnchor);
    v60 = objc_msgSend(v58, sel_constraintEqualToAnchor_constant_, v59, -sub_1B13585C0());

    if (v16 >> 62)
    {
      swift_bridgeObjectRetain();
      v74 = sub_1B137318C();
      swift_bridgeObjectRelease();
      v62 = v74 + 2;
      if (!__OFADD__(v74, 2))
      {
LABEL_19:
        sub_1B13602A0(v62, 1);
        sub_1B1372CA0();
        v24 = v24;
        MEMORY[0x1B5E1A310]();
        if (*(_QWORD *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        {
LABEL_20:
          sub_1B1372CC4();
          sub_1B1372CA0();
          v29 = v60;
          goto LABEL_21;
        }
LABEL_41:
        sub_1B1372CAC();
        goto LABEL_20;
      }
    }
    else
    {
      v61 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
      v62 = v61 + 2;
      if (!__OFADD__(v61, 2))
        goto LABEL_19;
    }
    __break(1u);
    goto LABEL_41;
  }
  if (a1 != (void *)1)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v44 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v45 = swift_allocObject();
    v46 = MEMORY[0x1E0DEB418];
    *(_OWORD *)(v45 + 16) = xmmword_1B1375550;
    v47 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v45 + 56) = v46;
    *(_QWORD *)(v45 + 64) = v47;
    *(_QWORD *)(v45 + 32) = a1;
    sub_1B1372988();

    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9D8];
  }
  v17 = sub_1B1355E48();
  v18 = objc_msgSend(v17, sel_topAnchor);

  v19 = sub_1B13559D0();
  v20 = objc_msgSend(v19, sel_bottomAnchor);

  v21 = objc_msgSend(v18, sel_constraintEqualToAnchor_constant_, v20, 16.0);
  v22 = v21;
  MEMORY[0x1B5E1A310]();
  if (*(_QWORD *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1B1372CAC();
  sub_1B1372CC4();
  sub_1B1372CA0();

  v23 = sub_1B135639C();
  if (v23)
  {
    v24 = v23;
    v25 = sub_1B1355E48();
    v26 = objc_msgSend(v25, sel_bottomAnchor);

    v27 = objc_msgSend(v24, sel_topAnchor);
    v28 = objc_msgSend(v26, sel_constraintEqualToAnchor_constant_, v27, -sub_1B13585C0());

    v29 = v28;
LABEL_21:
    MEMORY[0x1B5E1A310]();
    if (*(_QWORD *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1B1372CAC();
    sub_1B1372CC4();
    sub_1B1372CA0();

    goto LABEL_24;
  }
  v49 = sub_1B1355E48();
  v50 = objc_msgSend(v49, sel_bottomAnchor);

  v51 = objc_msgSend(v2, sel_bottomAnchor);
  v52 = objc_msgSend(v50, sel_constraintEqualToAnchor_constant_, v51, -sub_1B13585C0());

  v29 = v52;
  MEMORY[0x1B5E1A310]();
  if (*(_QWORD *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    goto LABEL_37;
LABEL_16:
  sub_1B1372CC4();
  sub_1B1372CA0();
LABEL_24:

  return v77;
}

unint64_t sub_1B135C6A4(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  double v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  double v33;
  double v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  double v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;

  v2 = v1;
  v4 = sub_1B12CF7F8(&qword_1ED387C50);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B135639C();
  if (!v7)
    return MEMORY[0x1E0DEE9D8];
  v8 = v7;
  sub_1B12CF7F8(&qword_1ED389880);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1B1375FF0;
  v10 = objc_msgSend(v8, sel_heightAnchor);
  v11 = objc_msgSend(v10, sel_constraintEqualToConstant_, 24.0);

  *(_QWORD *)(v9 + 32) = v11;
  v73 = v9;
  sub_1B1372CA0();
  v12 = v73;
  v74 = v73;
  if (a1 != 2)
  {
    if (a1 == 1)
    {
      v13 = objc_msgSend(v8, sel_leadingAnchor);
      v14 = objc_msgSend(v2, sel_leadingAnchor);
      v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_constant_, v14, 16.0);

      v16 = objc_msgSend(v8, sel_topAnchor);
      v17 = sub_1B1355E48();
      v18 = objc_msgSend(v17, sel_bottomAnchor);

      v19 = sub_1B135639C();
      v20 = 0.0;
      if (v19)
        v20 = 16.0;
      v21 = objc_msgSend(v16, sel_constraintEqualToAnchor_constant_, v18, v20);

      v22 = objc_msgSend(v8, sel_trailingAnchor);
      v23 = objc_msgSend(v2, sel_trailingAnchor);
      v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_constant_, v23, -16.0);

      v25 = objc_msgSend(v8, sel_bottomAnchor);
      v26 = objc_msgSend(v2, sel_bottomAnchor);
      v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_constant_, v26, -sub_1B13585C0());

      if (v12 >> 62)
      {
        swift_bridgeObjectRetain();
        v72 = sub_1B137318C();
        swift_bridgeObjectRelease();
        v29 = v72 + 4;
        if (!__OFADD__(v72, 4))
        {
LABEL_8:
          sub_1B13602A0(v29, 1);
          sub_1B1372CA0();
          v12 = (unint64_t)v15;
          MEMORY[0x1B5E1A310]();
          if (*(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          {
LABEL_9:
            sub_1B1372CC4();
            sub_1B1372CA0();
            v30 = v21;
            MEMORY[0x1B5E1A310]();
            if (*(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_1B1372CAC();
            sub_1B1372CC4();
            sub_1B1372CA0();
            v31 = v24;
            MEMORY[0x1B5E1A310]();
            if (*(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_1B1372CAC();
            sub_1B1372CC4();
            sub_1B1372CA0();
            v32 = v27;
            MEMORY[0x1B5E1A310]();
            if (*(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_1B1372CAC();
            sub_1B1372CC4();
            sub_1B1372CA0();

            goto LABEL_40;
          }
LABEL_44:
          sub_1B1372CAC();
          goto LABEL_9;
        }
      }
      else
      {
        v28 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
        v29 = v28 + 4;
        if (!__OFADD__(v28, 4))
          goto LABEL_8;
      }
      __break(1u);
      goto LABEL_44;
    }
    swift_bridgeObjectRelease();
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v51 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v52 = swift_allocObject();
    v53 = MEMORY[0x1E0DEB418];
    *(_OWORD *)(v52 + 16) = xmmword_1B1375550;
    v54 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v52 + 56) = v53;
    *(_QWORD *)(v52 + 64) = v54;
    *(_QWORD *)(v52 + 32) = a1;
    sub_1B1372988();

    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9D8];
  }
  objc_msgSend(v8, sel_sizeThatFits_, sub_1B1356C50() + -32.0, 24.0);
  v34 = fmax(v33, 150.0);
  v35 = objc_msgSend(v8, sel_widthAnchor);
  v36 = objc_msgSend(v35, sel_constraintEqualToConstant_, v34);

  v37 = v36;
  MEMORY[0x1B5E1A310]();
  if (*(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1B1372CAC();
  sub_1B1372CC4();
  sub_1B1372CA0();

  v38 = *(void **)&v2[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (!v38)
  {
    v56 = sub_1B1371DC4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56))(v6, 1, 1, v56);
LABEL_29:
    sub_1B12D0D40((uint64_t)v6, &qword_1ED387C50);
    v57 = objc_msgSend(v8, sel_topAnchor);
    v58 = sub_1B13559D0();
    v59 = objc_msgSend(v58, sel_bottomAnchor);

    v60 = sub_1B135639C();
    v61 = 16.0;
    if (!v60)
      v61 = 0.0;
    v62 = objc_msgSend(v57, sel_constraintEqualToAnchor_constant_, v59, v61);

    v63 = objc_msgSend(v8, sel_bottomAnchor);
    v64 = sub_1B1355E48();
    v65 = objc_msgSend(v64, sel_topAnchor);

    v66 = objc_msgSend(v63, sel_constraintEqualToAnchor_constant_, v65, -16.0);
    v67 = objc_msgSend(v8, sel_centerXAnchor);
    v68 = objc_msgSend(v2, sel_centerXAnchor);
    v69 = objc_msgSend(v67, sel_constraintEqualToAnchor_, v68);

    if (v74 >> 62)
    {
      swift_bridgeObjectRetain();
      v70 = (id)sub_1B137318C();
      swift_bridgeObjectRelease();
      v71 = (uint64_t)v70 + 3;
      if (!__OFADD__(v70, 3))
      {
LABEL_33:
        sub_1B13602A0(v71, 1);
        sub_1B1372CA0();
        v70 = v62;
        MEMORY[0x1B5E1A310]();
        if (*(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        {
LABEL_34:
          sub_1B1372CC4();
          sub_1B1372CA0();
          v50 = v66;
          MEMORY[0x1B5E1A310]();
          if (*(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1B1372CAC();
          sub_1B1372CC4();
          sub_1B1372CA0();
          v48 = v69;
          MEMORY[0x1B5E1A310]();
          if (*(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1B1372CAC();
          sub_1B1372CC4();
          sub_1B1372CA0();

          goto LABEL_39;
        }
LABEL_48:
        sub_1B1372CAC();
        goto LABEL_34;
      }
    }
    else
    {
      v70 = *(id *)((v74 & 0xFFFFFFFFFFFFF8) + 0x10);
      v71 = (uint64_t)v70 + 3;
      if (!__OFADD__(v70, 3))
        goto LABEL_33;
    }
    __break(1u);
    goto LABEL_48;
  }
  v39 = v38;
  sub_1B1372658();

  v40 = sub_1B1371DC4();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 48))(v6, 1, v40) == 1)
    goto LABEL_29;
  sub_1B12D0D40((uint64_t)v6, &qword_1ED387C50);
  v41 = objc_msgSend(v8, sel_trailingAnchor);
  v42 = objc_msgSend(v2, sel_trailingAnchor);
  v43 = objc_msgSend(v41, sel_constraintEqualToAnchor_constant_, v42, -16.0);

  v44 = objc_msgSend(v8, sel_centerYAnchor);
  v45 = sub_1B13559D0();
  v46 = objc_msgSend(v45, sel_centerYAnchor);

  v47 = objc_msgSend(v44, sel_constraintEqualToAnchor_, v46);
  if (!(v74 >> 62))
  {
    v48 = *(id *)((v74 & 0xFFFFFFFFFFFFF8) + 0x10);
    v49 = (uint64_t)v48 + 2;
    if (!__OFADD__(v48, 2))
      goto LABEL_22;
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  swift_bridgeObjectRetain();
  v48 = (id)sub_1B137318C();
  swift_bridgeObjectRelease();
  v49 = (uint64_t)v48 + 2;
  if (__OFADD__(v48, 2))
    goto LABEL_51;
LABEL_22:
  sub_1B13602A0(v49, 1);
  sub_1B1372CA0();
  v48 = v43;
  MEMORY[0x1B5E1A310]();
  if (*(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
LABEL_52:
    sub_1B1372CAC();
  sub_1B1372CC4();
  sub_1B1372CA0();
  v50 = v47;
  MEMORY[0x1B5E1A310]();
  if (*(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1B1372CAC();
  sub_1B1372CC4();
  sub_1B1372CA0();
LABEL_39:

LABEL_40:
  return v74;
}

void sub_1B135D188(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  double v26;
  id v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;

  v2 = v1;
  v4 = sub_1B12CF7F8(&qword_1ED387C50);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v33 - v8;
  if (a1 == 2)
  {
    v14 = sub_1B135639C();
    if (!v14)
      return;
    v15 = v14;
    v16 = *(void **)(v1 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
    if (v16)
    {
      v17 = v16;
      sub_1B1372658();

      v18 = sub_1B1371DC4();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 48))(v7, 1, v18) != 1)
      {
        sub_1B12D0D40((uint64_t)v7, &qword_1ED387C50);
        LODWORD(v19) = 1148846080;
        objc_msgSend(v15, sel_setContentCompressionResistancePriority_forAxis_, 0, v19);

        return;
      }
    }
    else
    {
      v32 = sub_1B1371DC4();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v7, 1, 1, v32);
    }

    v13 = (uint64_t)v7;
    goto LABEL_15;
  }
  if (a1 != 1)
  {
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v20 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v21 = swift_allocObject();
    v22 = MEMORY[0x1E0DEB418];
    *(_OWORD *)(v21 + 16) = xmmword_1B1375550;
    v23 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v21 + 56) = v22;
    *(_QWORD *)(v21 + 64) = v23;
    *(_QWORD *)(v21 + 32) = a1;
    sub_1B1372988();

    swift_bridgeObjectRelease();
    return;
  }
  v10 = *(void **)(v1 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation);
  if (!v10)
  {
    v24 = sub_1B1371DC4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v9, 1, 1, v24);
    goto LABEL_12;
  }
  v11 = v10;
  sub_1B1372658();

  v12 = sub_1B1371DC4();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v9, 1, v12) == 1)
  {
LABEL_12:
    sub_1B12D0D40((uint64_t)v9, &qword_1ED387C50);
    v25 = sub_1B1355C1C();
    LODWORD(v26) = 1148846080;
    objc_msgSend(v25, sel_setContentHuggingPriority_forAxis_, 0, v26);

    v27 = sub_1B1355C1C();
    LODWORD(v28) = 1132068864;
    objc_msgSend(v27, sel_setContentCompressionResistancePriority_forAxis_, 0, v28);

    v29 = *(void **)(v2 + OBJC_IVAR___APPCPromotedContentView_privacyMarkerView);
    LODWORD(v30) = 1112014848;
    objc_msgSend(v29, sel_setContentHuggingPriority_forAxis_, 0, v30);
    LODWORD(v31) = 1144750080;
    objc_msgSend(v29, sel_setContentCompressionResistancePriority_forAxis_, 0, v31);
    return;
  }
  v13 = (uint64_t)v9;
LABEL_15:
  sub_1B12D0D40(v13, &qword_1ED387C50);
}

uint64_t sub_1B135D4F8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __objc2_ivar_list **p_ivars;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  id v49;
  __int128 v50;
  uint64_t v51;

  v1 = v0;
  v2 = sub_1B12CF7F8(&qword_1ED387C50);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OBJC_IVAR___APPCPromotedContentView_promotedContent;
  if (!objc_msgSend(*(id *)&v0[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_bestRepresentation))
    goto LABEL_12;
  sub_1B13726A0();
  if (!swift_dynamicCastClass())
  {
    swift_unknownObjectRelease();
LABEL_12:
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v25 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_1B1375550;
    v27 = objc_msgSend(*(id *)&v1[v5], sel_identifier);
    v28 = sub_1B1372B98();
    v30 = v29;

    *(_QWORD *)(v26 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v26 + 64) = sub_1B12CE678();
    *(_QWORD *)(v26 + 32) = v28;
    *(_QWORD *)(v26 + 40) = v30;
    sub_1B1372988();

    return swift_bridgeObjectRelease();
  }
  v6 = sub_1B1372628();
  v8 = MEMORY[0x1E0DEA968];
  p_ivars = (__objc2_ivar_list **)(&AppStoreSession + 48);
  if (v7)
  {
    v10 = v6;
    v11 = v7;
    v12 = MEMORY[0x1E0DEA968];
    if (qword_1ED3888B0 != -1)
      swift_once();
    v51 = sub_1B12CF7F8(&qword_1ED3899B0);
    v13 = swift_allocObject();
    v50 = xmmword_1B1375550;
    *(_OWORD *)(v13 + 16) = xmmword_1B1375550;
    *(_QWORD *)(v13 + 56) = v12;
    v14 = sub_1B12CE678();
    *(_QWORD *)(v13 + 64) = v14;
    *(_QWORD *)(v13 + 32) = v10;
    *(_QWORD *)(v13 + 40) = v11;
    swift_bridgeObjectRetain();
    v15 = sub_1B1372BB0();
    v17 = v16;
    swift_bridgeObjectRelease();
    v18 = sub_1B1355C1C();
    v19 = (void *)sub_1B1372B74();
    objc_msgSend(v18, sel_setText_, v19);

    v49 = *(id *)&v1[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView];
    if (qword_1ED387938 != -1)
      swift_once();
    v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = v50;
    *(_QWORD *)(v20 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v20 + 64) = v14;
    *(_QWORD *)(v20 + 32) = v15;
    *(_QWORD *)(v20 + 40) = v17;
    swift_bridgeObjectRetain();
    sub_1B1372BB0();
    swift_bridgeObjectRelease();
    v21 = (void *)sub_1B1372B74();
    swift_bridgeObjectRelease();
    p_ivars = &AppStoreSession.ivars;
    objc_msgSend(v49, sel_setAccessibilityLabel_, v21);

    v8 = MEMORY[0x1E0DEA968];
  }
  v22 = sub_1B13559D0();
  sub_1B1372688();
  if (v23)
  {
    v24 = (void *)sub_1B1372B74();
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(v22, sel_setText_, v24);

  v32 = sub_1B13559D0();
  v33 = *(void **)&v1[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (v33)
  {
    v34 = v33;
    sub_1B1372658();

    v35 = sub_1B1371DC4();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 48))(v4, 1, v35) == 1)
      v36 = 1;
    else
      v36 = 4;
  }
  else
  {
    v37 = sub_1B1371DC4();
    v36 = 1;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v4, 1, 1, v37);
  }
  sub_1B12D0D40((uint64_t)v4, &qword_1ED387C50);
  objc_msgSend(v32, sel_setTextAlignment_, v36);

  v38 = sub_1B137264C();
  if (v39)
  {
    v40 = v38;
    v41 = v39;
    v42 = sub_1B13559D0();
    if (qword_1ED387928 != -1)
      swift_once();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_1B1375550;
    *(_QWORD *)(v43 + 56) = v8;
    *(_QWORD *)(v43 + 64) = sub_1B12CE678();
    *(_QWORD *)(v43 + 32) = v40;
    *(_QWORD *)(v43 + 40) = v41;
    swift_bridgeObjectRetain();
    sub_1B1372BB0();
    swift_bridgeObjectRelease();
    v44 = (void *)sub_1B1372B74();
    swift_bridgeObjectRelease();
    objc_msgSend(v42, (SEL)p_ivars[217], v44);

  }
  v45 = sub_1B1355E48();
  objc_msgSend(v45, sel_reloadData);

  v46 = sub_1B1355E48();
  v47 = objc_msgSend(v46, sel_collectionViewLayout);

  objc_msgSend(v47, sel_invalidateLayout);
  objc_msgSend(v1, sel_layoutIfNeeded);
  return swift_unknownObjectRelease();
}

uint64_t sub_1B135DB04(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[7] = a1;
  v2[8] = v1;
  sub_1B1372CE8();
  v2[9] = sub_1B1372CDC();
  v2[10] = sub_1B1372CD0();
  v2[11] = v3;
  return swift_task_switch();
}

uint64_t sub_1B135DB70()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_1ED387BA0 != -1)
    swift_once();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v1;
  *v1 = v0;
  v1[1] = sub_1B135DBEC;
  return sub_1B1369C90(*(_QWORD *)(v0 + 56));
}

uint64_t sub_1B135DBEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 104) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 112) = a1;
  return swift_task_switch();
}

uint64_t sub_1B135DC60()
{
  uint64_t v0;
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v1 = *(void **)(v0 + 112);
  swift_release();
  objc_msgSend(v1, sel_size);
  v3 = v2;
  objc_msgSend(v1, sel_size);
  if (v3 / v4 * 32.0 <= 150.0)
    v5 = v3 / v4 * 32.0;
  else
    v5 = 150.0;
  v6 = sub_1B13562DC();
  v7 = objc_msgSend(v6, sel_widthAnchor);

  v8 = objc_msgSend(v7, sel_constraintEqualToConstant_, v5);
  objc_msgSend(v8, sel_setActive_, 1);

  v9 = sub_1B13562DC();
  objc_msgSend(v9, sel_setImage_, v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B135DD68()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;

  swift_release();
  if (qword_1ED389888 != -1)
    swift_once();
  v1 = *(void **)(v0 + 104);
  v2 = sub_1B1372A48();
  sub_1B12E5A5C(v2, (uint64_t)qword_1ED38B7B0);
  v3 = v1;
  v4 = v1;
  v5 = sub_1B1372A30();
  v6 = sub_1B1372D90();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 104);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v14 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_getErrorValue();
    v11 = sub_1B137327C();
    *(_QWORD *)(v0 + 48) = sub_1B12D5A94(v11, v12, &v14);
    sub_1B1372FA0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1B12B8000, v5, v6, "An error occurred while fetching logo asset: %s.", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5E1B030](v10, -1, -1);
    MEMORY[0x1B5E1B030](v9, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_1B135DF60()
{
  char *v0;

  objc_msgSend(v0, sel_setIsAccessibilityElement_, 0);
  return objc_msgSend(*(id *)&v0[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView], sel_setAccessibilityTraits_, *MEMORY[0x1E0DC4660]);
}

void sub_1B135DFA8()
{
  char *v0;
  uint64_t v1;
  id v2;
  double v3;
  double v4;
  int v5;
  id v6;
  id v7;
  double v8;

  objc_msgSend(v0, sel_setReadiness_, 303);
  v1 = OBJC_IVAR___APPCPromotedContentView_promotedContent;
  objc_msgSend(objc_msgSend(*(id *)&v0[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_metricsHelper), sel_loaded);
  swift_unknownObjectRelease();
  v2 = objc_msgSend(*(id *)&v0[v1], sel_bestRepresentation);
  if (v2)
  {
    objc_msgSend(v2, sel_adSize);
    v4 = v3;
    swift_unknownObjectRelease();
  }
  else
  {
    v4 = 0.0;
  }
  v5 = v0[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_style];
  v6 = objc_msgSend(v0, sel_traitCollection);
  v7 = objc_msgSend(v6, sel_horizontalSizeClass);

  if (v7 == (id)2)
  {
    if (v5)
    {
      if (v5 == 1)
      {
LABEL_11:
        v8 = 283.0;
        goto LABEL_17;
      }
      v8 = 356.0;
    }
    else
    {
      v8 = 260.0;
    }
LABEL_17:
    if (v4 < v8)
      goto LABEL_18;
    return;
  }
  if (v7 == (id)1)
  {
    if (v5)
    {
      if (v5 != 1)
      {
        v8 = 297.0;
        goto LABEL_17;
      }
      goto LABEL_11;
    }
    v8 = 148.0;
    goto LABEL_17;
  }
  if (v4 < 0.0)
LABEL_18:
    objc_msgSend(v0, sel_setReadiness_, 305);
}

void sub_1B135E194(uint64_t a1)
{
  if (a1 == 100)
    _s17PromotedContentUI14CarouselAdViewC010collectionF0_11willDisplay9forItemAtySo012UICollectionF0C_So0mF4CellC10Foundation9IndexPathVtF_0();
}

void sub_1B135E1A4()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;

  if ((*(_BYTE *)(v0 + OBJC_IVAR___APPCPromotedContentView_customPrivacyHandling) & 1) == 0)
  {
    if (*(_BYTE *)(v0 + OBJC_IVAR___APPCPromotedContentView_overriddenPrivacyMarkerPosition + 8) == 1)
    {
      v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                                 + OBJC_IVAR___APPCPromotedContentView_promotedContent), sel_bestRepresentation));
      if (!v1)
        return;
      v2 = objc_msgSend(v1, sel_privacyMarkerPosition);
      swift_unknownObjectRelease();
    }
    else
    {
      v2 = *(id *)(v0 + OBJC_IVAR___APPCPromotedContentView_overriddenPrivacyMarkerPosition);
    }
    v3 = sub_1B13725C8();
    v4 = sub_1B13725C8();
    v5 = *(char **)(v0 + OBJC_IVAR___APPCPromotedContentView_privacyMarkerView);
    if (v3 == v4)
    {
      objc_msgSend(v5, sel_setHidden_, 1);
    }
    else
    {
      objc_msgSend(v5, sel_setHidden_, 0);
      *(_QWORD *)&v5[OBJC_IVAR___APPrivacyMarker_privacyMarkerPosition] = v2;
      sub_1B12D0FA0();
    }
  }
}

void sub_1B135E2AC()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  double v4;
  double v5;
  id v6;
  id v7;
  id v8;

  v1 = sub_1B13728B0();
  if (v1 == sub_1B13728B0())
  {
    v2 = objc_msgSend(v0, sel_layer);
    objc_msgSend(v2, sel_setCornerRadius_, 8.0);

    v3 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
    objc_msgSend(v3, sel_nativeScale);
    v5 = v4;

    v6 = objc_msgSend(v0, sel_layer);
    if (qword_1ED3882C0 != -1)
      swift_once();
    if (qword_1ED387C48)
      v7 = objc_msgSend((id)qword_1ED387C48, sel_CGColor);
    else
      v7 = 0;
    objc_msgSend(v6, sel_setBorderColor_, v7);

    v8 = objc_msgSend(v0, sel_layer);
    objc_msgSend(v8, sel_setBorderWidth_, 1.0 / v5);

  }
}

void sub_1B135E43C(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  double v17;
  double v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;

  v2 = v1;
  v4 = sub_1B12CF7F8(&qword_1ED387C50);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v28 - v8;
  v10 = sub_1B1371DC4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)&v2[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements];
  if (*(_QWORD *)(v14 + 16))
  {
    v15 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CarouselElement() - 8) + 80);
    v16 = *(_BYTE *)(v14 + ((v15 + 32) & ~v15));
    objc_msgSend(a1, sel_center);
    objc_msgSend(v2, sel_convertPoint_toCoordinateSpace_, v2);
    v19 = sub_1B134CA34(v17, v18);
    sub_1B135E7CC(v19, v21, v20 & 1, v16);
  }
  else
  {
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v22 = (void *)sub_1B1372F70();
    sub_1B1372988();

  }
  v23 = *(void **)&v2[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation];
  if (v23)
  {
    v24 = v23;
    sub_1B1372694();

    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v7, v13, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
      v25 = objc_allocWithZone((Class)sub_1B13722A4());
      v26 = (void *)sub_1B1372298();
      sub_1B134CCE0(v26);

      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  }
  sub_1B12D0D40((uint64_t)v9, &qword_1ED387C50);
  sub_1B1372D90();
  sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
  v27 = (void *)sub_1B1372F70();
  sub_1B1372988();

}

uint64_t sub_1B135E7CC(uint64_t a1, uint64_t a2, char a3, unsigned __int8 a4)
{
  char *v4;
  char *v5;
  uint64_t v6;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  double v30;
  double v31;

  v5 = v4;
  v6 = MEMORY[0x1E0DEA968];
  if ((a3 & 1) != 0)
  {
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v9 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_1B1375550;
    v11 = objc_msgSend(*(id *)&v5[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
    v12 = sub_1B1372B98();
    v14 = v13;

    *(_QWORD *)(v10 + 56) = v6;
    *(_QWORD *)(v10 + 64) = sub_1B12CE678();
    *(_QWORD *)(v10 + 32) = v12;
    *(_QWORD *)(v10 + 40) = v14;
    sub_1B1372988();

    swift_bridgeObjectRelease();
    *(double *)&a2 = -1.0;
    *(double *)&a1 = -1.0;
  }
  sub_1B1372D9C();
  sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
  v15 = (void *)sub_1B1372F70();
  sub_1B12CF7F8(&qword_1ED3899B0);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_1B1378680;
  v17 = MEMORY[0x1E0DEF040];
  *(_QWORD *)(v16 + 56) = MEMORY[0x1E0DEF040];
  v18 = sub_1B134FF3C();
  *(_QWORD *)(v16 + 64) = v18;
  *(double *)(v16 + 32) = *(double *)&a1;
  *(_QWORD *)(v16 + 96) = v17;
  *(_QWORD *)(v16 + 104) = v18;
  *(double *)(v16 + 72) = *(double *)&a2;
  objc_msgSend(v5, sel_frame);
  *(_QWORD *)(v16 + 136) = v17;
  *(_QWORD *)(v16 + 144) = v18;
  *(_QWORD *)(v16 + 112) = v19;
  objc_msgSend(v5, sel_frame);
  *(_QWORD *)(v16 + 176) = v17;
  *(_QWORD *)(v16 + 184) = v18;
  *(_QWORD *)(v16 + 152) = v20;
  objc_msgSend(v5, sel_frame);
  *(_QWORD *)(v16 + 216) = v17;
  *(_QWORD *)(v16 + 224) = v18;
  *(_QWORD *)(v16 + 192) = v21;
  objc_msgSend(v5, sel_frame);
  *(_QWORD *)(v16 + 256) = v17;
  *(_QWORD *)(v16 + 264) = v18;
  *(_QWORD *)(v16 + 232) = v22;
  v23 = MEMORY[0x1E0DEDEC8];
  *(_QWORD *)(v16 + 296) = MEMORY[0x1E0DEDE70];
  *(_QWORD *)(v16 + 304) = v23;
  *(_BYTE *)(v16 + 272) = a4;
  v24 = OBJC_IVAR___APPCPromotedContentView_promotedContent;
  v25 = objc_msgSend(*(id *)&v5[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_identifier);
  v26 = sub_1B1372B98();
  v28 = v27;

  *(_QWORD *)(v16 + 336) = v6;
  *(_QWORD *)(v16 + 344) = sub_1B12CE678();
  *(_QWORD *)(v16 + 312) = v26;
  *(_QWORD *)(v16 + 320) = v28;
  sub_1B1372988();

  swift_bridgeObjectRelease();
  v29 = objc_msgSend(*(id *)&v5[v24], sel_metricsHelper);
  *(float *)&v30 = *(double *)&a1;
  *(float *)&v31 = *(double *)&a2;
  objc_msgSend(v29, sel_interactedWithElementID_atXPos_yPos_, a4, v30, v31);
  return swift_unknownObjectRelease();
}

unint64_t sub_1B135EB08(uint64_t a1)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t result;
  char *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t *v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t *v42;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  int v57;
  uint64_t *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v2 = v1;
  v4 = sub_1B1371DC4();
  v63 = *(_QWORD *)(v4 - 8);
  v64 = v4;
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B1371F80();
  v60 = *(_QWORD *)(v7 - 8);
  v61 = v7;
  v8 = *(_QWORD *)(v60 + 64);
  v9 = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v62 = (uint64_t)&v56 - v11;
  v12 = type metadata accessor for CarouselElement();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1B1371F74();
  v17 = *(_QWORD *)(v1 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements);
  if (v16 >= *(_QWORD *)(v17 + 16))
  {
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v46 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = xmmword_1B13757D0;
    v48 = sub_1B1371F74();
    v49 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v47 + 56) = MEMORY[0x1E0DEB418];
    *(_QWORD *)(v47 + 64) = v49;
    *(_QWORD *)(v47 + 32) = v48;
    v50 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                                + OBJC_IVAR___APPCPromotedContentView_promotedContent), sel_identifier));
    v51 = sub_1B1372B98();
    v53 = v52;

    *(_QWORD *)(v47 + 96) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v47 + 104) = sub_1B12CE678();
    *(_QWORD *)(v47 + 72) = v51;
    *(_QWORD *)(v47 + 80) = v53;
    sub_1B1372988();

    return swift_bridgeObjectRelease();
  }
  result = sub_1B1371F74();
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (result >= *(_QWORD *)(v17 + 16))
  {
LABEL_14:
    __break(1u);
    return result;
  }
  sub_1B12DD874(v17+ ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(_QWORD *)(v13 + 72) * result, (uint64_t)v15);
  type metadata accessor for ImageCache();
  swift_initStaticObject();
  v19 = &v15[*(int *)(v12 + 24)];
  v20 = sub_1B1352900();
  v59 = v19;
  v21 = (void *)sub_1B1371D88();
  v22 = objc_msgSend(v20, sel_objectForKey_, v21);

  if (!v22)
  {
    v23 = (uint64_t *)(v2 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_prefetchingIndexPaths);
    swift_beginAccess();
    if (!*(_QWORD *)(*v23 + 16)
      || (swift_bridgeObjectRetain(), sub_1B131BA5C(a1), v25 = v24, swift_bridgeObjectRelease(), (v25 & 1) == 0))
    {
      v57 = sub_1B1372D84();
      sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
      v56 = sub_1B1372F70();
      sub_1B12CF7F8(&qword_1ED3899B0);
      v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = xmmword_1B13757D0;
      v27 = sub_1B1371F74();
      v28 = MEMORY[0x1E0DEB490];
      *(_QWORD *)(v26 + 56) = MEMORY[0x1E0DEB418];
      *(_QWORD *)(v26 + 64) = v28;
      *(_QWORD *)(v26 + 32) = v27;
      v29 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v2
                                                                  + OBJC_IVAR___APPCPromotedContentView_promotedContent), sel_identifier));
      v30 = sub_1B1372B98();
      v58 = v23;
      v32 = v31;

      *(_QWORD *)(v26 + 96) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v26 + 104) = sub_1B12CE678();
      *(_QWORD *)(v26 + 72) = v30;
      *(_QWORD *)(v26 + 80) = v32;
      v33 = (void *)v56;
      sub_1B1372988();

      swift_bridgeObjectRelease();
      v34 = v60;
      v35 = v61;
      v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 16);
      v36(v62, a1, v61);
      (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v6, v59, v64);
      v37 = swift_allocObject();
      v38 = v34;
      swift_unknownObjectWeakInit();
      v36((uint64_t)v10, a1, v35);
      v39 = (*(unsigned __int8 *)(v34 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
      v40 = swift_allocObject();
      *(_QWORD *)(v40 + 16) = v37;
      (*(void (**)(unint64_t, char *, uint64_t))(v38 + 32))(v40 + v39, v10, v35);
      swift_retain();
      v41 = sub_1B13529C0((uint64_t)v6, (void (*)(id, uint64_t))sub_1B1361158, v40);
      v42 = v58;
      swift_release();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v6, v64);
      swift_release();
      swift_beginAccess();
      if (v41)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v65 = *v42;
        *v42 = 0x8000000000000000;
        v44 = (uint64_t)v41;
        v45 = v62;
        sub_1B136C814(v44, v62, isUniquelyReferenced_nonNull_native);
        *v42 = v65;
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v45, v35);
      }
      else
      {
        v54 = v62;
        v55 = (void *)sub_1B136E7E0(v62);
        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v54, v35);

      }
      swift_endAccess();
    }
  }
  return sub_1B12DD8B8((uint64_t)v15);
}

uint64_t sub_1B135F130(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  unint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v8 = sub_1B1371F80();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  result = MEMORY[0x1E0C80A78](v8);
  if (a1)
  {
    if ((a2 & 1) != 0)
    {
      sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389980);
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v8);
      v12 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
      v13 = swift_allocObject();
      *(_QWORD *)(v13 + 16) = a3;
      (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v13 + v12, (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
      *(_QWORD *)(v13 + ((v10 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
      v14 = a1;
      swift_retain();
      sub_1B1372DCC();
      return swift_release();
    }
  }
  return result;
}

void sub_1B135F260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;

  v4 = a1 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x1B5E1B0F0](v4);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = sub_1B1355E48();

    v8 = (void *)sub_1B1371F50();
    v9 = objc_msgSend(v7, sel_cellForItemAtIndexPath_, v8);

    if (v9)
    {
      type metadata accessor for CarouselCollectionViewCell();
      if (swift_dynamicCastClass())
      {
        v10 = sub_1B12DC68C();
        objc_msgSend(v10, sel_setImage_, a3);

        v9 = v10;
      }

    }
  }
  swift_beginAccess();
  v11 = MEMORY[0x1B5E1B0F0](v4);
  if (v11)
  {
    v12 = (void *)v11;
    v13 = sub_1B1355724();

    v14 = (void *)sub_1B1371F50();
    v15 = objc_msgSend(v13, sel_cellForItemAtIndexPath_, v14);

    if (v15)
    {
      type metadata accessor for ImageCollectionViewCell();
      v16 = swift_dynamicCastClass();
      if (v16)
        objc_msgSend(*(id *)(v16 + OBJC_IVAR____TtC17PromotedContentUI23ImageCollectionViewCell_imageView), sel_setImage_, a3);

    }
  }
}

void _s17PromotedContentUI14CarouselAdViewC010collectionF0_11willDisplay9forItemAtySo012UICollectionF0C_So0mF4CellC10Foundation9IndexPathVtF_0()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  unint64_t v7;
  id v8;
  unint64_t v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  char *v14;
  id v15;
  void *v16;
  void *v17;

  v1 = sub_1B1355E48();
  v2 = objc_msgSend(v1, sel_indexPathsForVisibleItems);

  sub_1B1371F80();
  v3 = sub_1B1372C88();

  v4 = sub_1B131658C(v3);
  swift_bridgeObjectRelease();
  v5 = sub_1B1355E48();
  v6 = objc_msgSend(v5, sel_visibleCells);

  sub_1B12CFA9C(0, &qword_1ED388E30);
  v7 = sub_1B1372C88();

  v8 = v0;
  v9 = sub_1B1360920(v7);
  swift_bridgeObjectRelease();

  v10 = v8;
  v11 = sub_1B1360DD0(v9);
  swift_bridgeObjectRelease();

  v12 = sub_1B131658C(v11);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v12 + 16) <= *(_QWORD *)(v4 + 16) >> 3)
    sub_1B12FAB40(v12);
  else
    v4 = sub_1B12FB190(v12, v4);
  v13 = v10;
  sub_1B1360B34(v12, (uint64_t)v13);
  swift_bridgeObjectRelease();

  v14 = (char *)v13;
  sub_1B1360B34(v4, (uint64_t)v14);
  swift_bridgeObjectRelease();

  v15 = objc_msgSend(*(id *)&v14[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_metricsHelper);
  v16 = (void *)sub_1B1372C7C();
  swift_bridgeObjectRelease();
  v17 = (void *)sub_1B1372C7C();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_updateElementsShownWithShown_partiallyShown_, v16, v17);
  swift_unknownObjectRelease();

}

uint64_t sub_1B135F630()
{
  uint64_t v0;

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___backgroundCollectionController));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___backgroundCollectionView));

  sub_1B12EA250(*(id *)(v0 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___actionButton));
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

id CarouselAdView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CarouselAdView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1B135F734()
{
  unint64_t result;

  result = qword_1EEF28808;
  if (!qword_1EEF28808)
  {
    result = MEMORY[0x1B5E1AF70](&protocol conformance descriptor for CarouselAdView.CarouselStyle, &type metadata for CarouselAdView.CarouselStyle);
    atomic_store(result, &qword_1EEF28808);
  }
  return result;
}

uint64_t sub_1B135F850()
{
  return type metadata accessor for CarouselAdView();
}

uint64_t sub_1B135F858()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for CarouselAdView()
{
  return swift_lookUpClassMethod();
}

uint64_t storeEnumTagSinglePayload for CarouselAdView.CarouselStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B135F958 + 4 * byte_1B1378695[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1B135F98C + 4 * byte_1B1378690[v4]))();
}

uint64_t sub_1B135F98C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B135F994(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B135F99CLL);
  return result;
}

uint64_t sub_1B135F9A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B135F9B0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1B135F9B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B135F9BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CarouselAdView.CarouselStyle()
{
  return &type metadata for CarouselAdView.CarouselStyle;
}

uint64_t sub_1B135F9D8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1B135FA3C;
  return v6(a1);
}

uint64_t sub_1B135FA3C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1B135FA88()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B135FAAC()
{
  uint64_t v0;

  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], *(id *)(v0 + 16));
}

uint64_t sub_1B135FAC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1B1371DC4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1B135FB3C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_1B1371DC4() - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_1B12F4D60;
  return sub_1B1358ED8(a1, v5, v6, v7, v8);
}

uint64_t sub_1B135FBD0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1B135FBF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1B12F4D60;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EEF28828 + dword_1EEF28828))(a1, v4);
}

uint64_t sub_1B135FC64(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1B137318C();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1B137318C();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1B12D5538(&qword_1EEF28848, &qword_1ED388888);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          sub_1B12CF7F8(&qword_1ED388888);
          v12 = sub_1B1302D20(v16, i, a3);
          v14 = *v13;
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED387F20);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_1B13731C8();
  __break(1u);
  return result;
}

uint64_t sub_1B135FE78(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1B137318C();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1B137318C();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1B12D5538(&qword_1EEF28840, &qword_1EEF28838);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          sub_1B12CF7F8(&qword_1EEF28838);
          v12 = sub_1B1302D74(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED388E28);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_1B13731C8();
  __break(1u);
  return result;
}

uint64_t sub_1B136008C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1B137318C();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1B137318C();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1B12D5538(&qword_1EEF28868, &qword_1EEF28860);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          sub_1B12CF7F8(&qword_1EEF28860);
          v12 = sub_1B1302D20(v16, i, a3);
          v14 = *v13;
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1B12CFA9C(0, (unint64_t *)&unk_1EEF27CC0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_1B13731C8();
  __break(1u);
  return result;
}

uint64_t sub_1B13602A0(uint64_t a1, char a2)
{
  uint64_t *v2;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *v2;
  result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v2 = v5;
  v7 = 0;
  if ((result & 1) != 0 && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    if (a1 <= *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
      return result;
    v7 = 1;
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = sub_1B137318C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 <= a1)
    v9 = a1;
  else
    v9 = v8;
  result = MEMORY[0x1B5E1A7B4](v7, v9, a2 & 1, v5);
  *v2 = result;
  return result;
}

_QWORD *sub_1B136035C(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;

  v4 = a4 + 56;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v8 = 0;
    a3 = 0;
LABEL_35:
    *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (_QWORD *)a3;
  }
  if (!a3)
  {
    v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v8 = 0;
  v9 = 0;
  v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v12);
    if (v9 == a3)
      goto LABEL_35;
  }
  v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  if (v14)
    goto LABEL_19;
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    v7 = 0;
    v8 = v13;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    v13 = v8;
LABEL_19:
    v16 = __clz(__rbit64(v14));
    v7 = (v14 - 1) & v14;
    v12 = v16 + (v13 << 6);
    v8 = v13;
    goto LABEL_8;
  }
  v15 = v13 + 2;
  if (v13 + 2 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    v13 = v15;
    goto LABEL_19;
  }
  v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    v7 = 0;
    v8 = v13 + 2;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
    goto LABEL_15;
  v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_18;
  while (1)
  {
    v13 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v13 >= v10)
    {
      v7 = 0;
      v8 = v10 - 1;
      goto LABEL_34;
    }
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v15;
    if (v14)
      goto LABEL_19;
  }
LABEL_38:
  __break(1u);
  return result;
}

_QWORD *sub_1B13604F0(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;

  v4 = a4 + 64;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v8 = 0;
    a3 = 0;
LABEL_35:
    *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (_QWORD *)a3;
  }
  if (!a3)
  {
    v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v8 = 0;
  v9 = 0;
  v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v12);
    if (v9 == a3)
      goto LABEL_35;
  }
  v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  if (v14)
    goto LABEL_19;
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    v7 = 0;
    v8 = v13;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    v13 = v8;
LABEL_19:
    v16 = __clz(__rbit64(v14));
    v7 = (v14 - 1) & v14;
    v12 = v16 + (v13 << 6);
    v8 = v13;
    goto LABEL_8;
  }
  v15 = v13 + 2;
  if (v13 + 2 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    v13 = v15;
    goto LABEL_19;
  }
  v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    v7 = 0;
    v8 = v13 + 2;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
    goto LABEL_15;
  v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_18;
  while (1)
  {
    v13 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v13 >= v10)
    {
      v7 = 0;
      v8 = v10 - 1;
      goto LABEL_34;
    }
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v15;
    if (v14)
      goto LABEL_19;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_1B1360684(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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

uint64_t sub_1B1360880(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_1B1360920(unint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  id v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  uint64_t v35;
  CGRect v36;
  CGRect v37;

  v35 = MEMORY[0x1E0DEE9D8];
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
        v4 = (id)MEMORY[0x1B5E1A7A8](v3, a1);
LABEL_9:
        v5 = v4;
        v6 = v3 + 1;
        if (__OFADD__(v3, 1))
          goto LABEL_15;
        v7 = sub_1B1355E48();
        objc_msgSend(v5, sel_frame);
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v16 = sub_1B1355E48();
        objc_msgSend(v7, sel_convertRect_toCoordinateSpace_, v16, v9, v11, v13, v15);
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;

        v25 = sub_1B1355E48();
        objc_msgSend(v25, sel_bounds);
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;

        v36.origin.x = v27;
        v36.origin.y = v29;
        v36.size.width = v31;
        v36.size.height = v33;
        v37.origin.x = v18;
        v37.origin.y = v20;
        v37.size.width = v22;
        v37.size.height = v24;
        if (CGRectContainsRect(v36, v37))
        {
          sub_1B137312C();
          sub_1B1373144();
          sub_1B1373150();
          sub_1B1373138();
        }
        else
        {

        }
        ++v3;
        if (v6 == v2)
          return v35;
      }
      if (v3 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      v2 = sub_1B137318C();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x1E0DEE9D8];
}

unint64_t sub_1B1360B34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  unint64_t result;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;

  v5 = sub_1B1371F80();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v35 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v34 = (char *)v27 - v9;
  v10 = *(_QWORD *)(a1 + 16);
  v11 = MEMORY[0x1E0DEE9D8];
  if (!v10)
    return v11;
  v27[1] = v2;
  v36 = MEMORY[0x1E0DEE9D8];
  sub_1B12D7A40(0, v10, 0);
  v12 = sub_1B1360880(a1);
  v14 = v13;
  v16 = v15 & 1;
  v33 = a1 + 56;
  v17 = *(_QWORD *)(a2 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements);
  result = type metadata accessor for CarouselElement();
  v29 = *(_QWORD *)(result - 8);
  v30 = v5;
  v19 = *(unsigned __int8 *)(v29 + 80);
  v31 = a1;
  v32 = v17;
  v28 = v17 + ((v19 + 32) & ~v19);
  while ((v12 & 0x8000000000000000) == 0 && v12 < 1 << *(_BYTE *)(a1 + 32))
  {
    if (((*(_QWORD *)(v33 + (((unint64_t)v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
      goto LABEL_17;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v14)
      goto LABEL_18;
    v20 = *(_QWORD *)(a1 + 48) + *(_QWORD *)(v6 + 72) * v12;
    v21 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v34, v20, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v35, v21, v5);
    result = sub_1B1371F74();
    if ((result & 0x8000000000000000) != 0)
      goto LABEL_19;
    if (result >= *(_QWORD *)(v32 + 16))
      goto LABEL_20;
    v22 = *(_BYTE *)(v28 + *(_QWORD *)(v29 + 72) * result);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v35, v5);
    v11 = v36;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1B12D7A40(0, *(_QWORD *)(v11 + 16) + 1, 1);
      v11 = v36;
    }
    v24 = *(_QWORD *)(v11 + 16);
    v23 = *(_QWORD *)(v11 + 24);
    if (v24 >= v23 >> 1)
    {
      sub_1B12D7A40(v23 > 1, v24 + 1, 1);
      v11 = v36;
    }
    *(_QWORD *)(v11 + 16) = v24 + 1;
    *(_BYTE *)(v11 + v24 + 32) = v22;
    a1 = v31;
    result = sub_1B12EA584(v12, v14, v16 & 1, v31);
    v12 = result;
    v14 = v25;
    v16 = v26 & 1;
    --v10;
    v5 = v30;
    if (!v10)
    {
      sub_1B12DD338(result, v25, v26 & 1);
      return v11;
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

unint64_t sub_1B1360DD0(unint64_t a1)
{
  void *v1;
  void *v2;
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
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  char *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  unint64_t v32;

  v2 = v1;
  v4 = sub_1B12CF7F8((uint64_t *)&unk_1ED388960);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1B1371F80();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v31 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v27 = (char *)&v26 - v11;
  if (a1 >> 62)
    goto LABEL_22;
  v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v12; v12 = sub_1B137318C())
  {
    v26 = v2;
    v30 = a1 & 0xC000000000000001;
    v32 = MEMORY[0x1E0DEE9D8];
    v13 = 4;
    v28 = v12;
    v29 = a1;
    while (1)
    {
      v14 = v30 ? (id)MEMORY[0x1B5E1A7A8](v13 - 4, a1) : *(id *)(a1 + 8 * v13);
      v2 = v14;
      v15 = v13 - 3;
      if (__OFADD__(v13 - 4, 1))
        break;
      v16 = sub_1B1355E48();
      v17 = objc_msgSend(v16, sel_indexPathForCell_, v2);

      if (v17)
      {
        sub_1B1371F5C();

        v18 = 0;
      }
      else
      {
        v18 = 1;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, v18, 1, v7);

      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
      {
        sub_1B12D0D40((uint64_t)v6, (uint64_t *)&unk_1ED388960);
      }
      else
      {
        v19 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
        v20 = v27;
        v19(v27, v6, v7);
        v19(v31, v20, v7);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
          v21 = v32;
        else
          v21 = sub_1B12EB8AC(0, *(_QWORD *)(v32 + 16) + 1, 1, v32);
        v23 = *(_QWORD *)(v21 + 16);
        v22 = *(_QWORD *)(v21 + 24);
        if (v23 >= v22 >> 1)
          v21 = sub_1B12EB8AC(v22 > 1, v23 + 1, 1, v21);
        *(_QWORD *)(v21 + 16) = v23 + 1;
        v24 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
        v32 = v21;
        v19((char *)(v21 + v24 + *(_QWORD *)(v8 + 72) * v23), v31, v7);
      }
      ++v13;
      a1 = v29;
      if (v15 == v28)
      {
        swift_bridgeObjectRelease();
        return v32;
      }
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1E0DEE9D8];
}

uint64_t sub_1B13610C0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1B13610E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1B1371F80();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1B1361158(void *a1, char a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_1B1371F80() - 8) + 80);
  return sub_1B135F130(a1, a2, *(_QWORD *)(v2 + 16), v2 + ((v5 + 24) & ~v5));
}

uint64_t sub_1B13611A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_1B1371F80();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

void sub_1B1361238()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(sub_1B1371F80() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  sub_1B135F260(*(_QWORD *)(v0 + 16), v0 + v2, *(_QWORD *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8)));
}

void sub_1B136127C()
{
  sub_1B1371CC8();
  __break(1u);
}

void sub_1B1361298()
{
  sub_1B13086C0();
  sub_1B1371D34();
  __break(1u);
}

uint64_t sub_1B13612BC()
{
  return 8;
}

uint64_t sub_1B13612C8()
{
  return swift_release();
}

uint64_t sub_1B13612D0(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_1B13612DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B1355124(a1, a2, a3, &qword_1EEF28858) & 1;
}

uint64_t sub_1B13612FC(uint64_t a1, uint64_t a2)
{
  return sub_1B1355184(a1, a2, &qword_1EEF28858);
}

_QWORD *sub_1B1361308(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

void sub_1B1361314()
{
  sub_1B1371CBC();
  __break(1u);
}

void sub_1B1361330()
{
  sub_1B1308744();
  sub_1B1371D34();
  __break(1u);
}

uint64_t sub_1B1361354()
{
  return 8;
}

uint64_t sub_1B1361360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B1355124(a1, a2, a3, &qword_1EEF28850) & 1;
}

uint64_t sub_1B1361380(uint64_t a1, uint64_t a2)
{
  return sub_1B1355184(a1, a2, &qword_1EEF28850);
}

_QWORD *sub_1B1361398(uint64_t a1, void *a2, void *a3, void *a4, _BYTE *a5)
{
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD *v20;

  v9 = OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView;
  *(_QWORD *)&a5[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView] = 0;
  *(_QWORD *)&a5[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_videoProgressMetricThresholds] = &unk_1E62F5558;
  a5[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webViewDebugging] = 0;
  *(_QWORD *)&a5[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_outstreamVisibleThreshold] = 50;
  *(_QWORD *)&a5[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_nonOutstreamVisibleThreshold] = 95;
  v10 = OBJC_IVAR____TtC17PromotedContentUI9WebAdView_mraidActionTypes;
  v11 = a5;
  *(_QWORD *)&a5[v10] = sub_1B134003C((uint64_t)&unk_1E62F5590);
  v12 = OBJC_IVAR____TtC17PromotedContentUI9WebAdView_videoProgressMetricStatus;
  *(_QWORD *)&v11[v12] = sub_1B131C0F8(MEMORY[0x1E0DEE9D8]);
  v13 = OBJC_IVAR____TtC17PromotedContentUI9WebAdView_unfairLock;
  *(_QWORD *)&v11[v13] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF1968]), sel_initWithOptions_, 1);
  *(_QWORD *)&v11[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_navigationCoordinator] = 0;
  v11[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_isAppActive] = 1;
  v11[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_needToUpdateVisibility] = 0;
  v14 = *(void **)&a5[v9];
  *(_QWORD *)&a5[v9] = a2;
  v15 = a2;

  swift_getObjectType();
  v16 = a3;
  v17 = v15;
  v18 = a4;
  v19 = swift_unknownObjectRetain();
  v20 = sub_1B13073A8(v19, a3, (uint64_t)v18, v11);
  swift_unknownObjectRelease();

  sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389890);
  *((_BYTE *)v20 + OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webViewDebugging) = sub_1B12EF198() & 1;
  return v20;
}

_QWORD *sub_1B136156C(void *a1, void *a2, uint64_t a3, char *a4)
{
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  id v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char *v25;
  id v26;
  id v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *result;
  uint64_t v32;
  unint64_t v33;
  id v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t ObjectType;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;

  v8 = sub_1B12CF7F8(&qword_1ED3878B0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for CarouselElement();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v39 - v16;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___backgroundCollectionController] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___backgroundCollectionView] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___blurView] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___headlineLabel] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___advertiserContainerView] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___advertiserLabel] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___collectionView] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___logoImageView] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___actionButton] = 1;
  v18 = &a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage____adSize];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  v18[16] = 1;
  v19 = &a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___adSizeWidth];
  *(_QWORD *)v19 = 0;
  v19[8] = 1;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_prefetchingIndexPaths] = MEMORY[0x1E0DEE9E0];
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_topMargin] = 0x4030000000000000;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_advertiserViewHorizontalMargin] = 0x4030000000000000;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_headlineHorizontalMargin] = 0x4030000000000000;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_logoImageViewHeight] = 0x4040000000000000;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_logoImageViewMaxWidth] = 0x4062C00000000000;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_logoImageViewLeadingMargin] = 0x4030000000000000;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_collectionViewTopMargin] = 0x4030000000000000;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_actionButtonHeight] = 0x4038000000000000;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_actionButtonHorizontalMargin] = 0x4030000000000000;
  *(_QWORD *)&a4[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_actionButtonMinimumWidth] = 0x4062C00000000000;
  ObjectType = swift_getObjectType();
  v45 = a4;
  v20 = objc_msgSend(a1, sel_bestRepresentation);
  v46 = v15;
  if (!v20)
    goto LABEL_6;
  sub_1B13726A0();
  if (!swift_dynamicCastClass())
  {
    swift_unknownObjectRelease();
LABEL_6:
    v24 = 2;
    goto LABEL_7;
  }
  v21 = a1;
  v22 = sub_1B1372634();
  swift_unknownObjectRelease();
  v23 = v22 - 22200;
  a1 = v21;
  v15 = v46;
  v24 = 2;
  if (v23 < 3)
    v24 = 2 - v23;
LABEL_7:
  v25 = v45;
  v45[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_style] = v24;
  v43 = (uint64_t)a1;
  v26 = objc_msgSend(a1, sel_bestRepresentation);
  if (!v26)
  {
LABEL_26:
    sub_1B1372D90();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v37 = (void *)sub_1B1372F70();
    v38 = MEMORY[0x1E0DEE9D8];
    v25 = v45;
    sub_1B1372988();

    *(_QWORD *)&v25[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements] = v38;
    return sub_1B13073A8(v43, a2, a3, v25);
  }
  v27 = v26;
  sub_1B13726A0();
  if (!swift_dynamicCastClass() || (v28 = sub_1B137267C()) == 0)
  {
    swift_unknownObjectRelease();
    goto LABEL_26;
  }
  v29 = v28;
  v41 = v27;
  if (!(v28 >> 62))
  {
    v30 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
    result = (_QWORD *)swift_bridgeObjectRetain();
    v40 = a2;
    if (v30)
      goto LABEL_12;
LABEL_29:
    swift_unknownObjectRelease();
    v33 = MEMORY[0x1E0DEE9D8];
LABEL_30:
    swift_bridgeObjectRelease_n();
    *(_QWORD *)&v25[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements] = v33;

    a2 = v40;
    return sub_1B13073A8(v43, a2, a3, v25);
  }
  swift_bridgeObjectRetain();
  result = (_QWORD *)sub_1B137318C();
  v30 = (uint64_t)result;
  v40 = a2;
  if (!result)
    goto LABEL_29;
LABEL_12:
  v39 = a3;
  if (v30 >= 1)
  {
    v32 = 0;
    v33 = MEMORY[0x1E0DEE9D8];
    v44 = v11;
    do
    {
      if ((v29 & 0xC000000000000001) != 0)
        v34 = (id)MEMORY[0x1B5E1A7A8](v32, v29);
      else
        v34 = *(id *)(v29 + 8 * v32 + 32);
      sub_1B1307EE4(v34, v10);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
      {
        sub_1B1362130((uint64_t)v10);
      }
      else
      {
        sub_1B1362170((uint64_t)v10, (uint64_t)v17);
        sub_1B1362170((uint64_t)v17, (uint64_t)v15);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v33 = sub_1B12EB8C0(0, *(_QWORD *)(v33 + 16) + 1, 1, v33);
        v36 = *(_QWORD *)(v33 + 16);
        v35 = *(_QWORD *)(v33 + 24);
        if (v36 >= v35 >> 1)
          v33 = sub_1B12EB8C0(v35 > 1, v36 + 1, 1, v33);
        *(_QWORD *)(v33 + 16) = v36 + 1;
        v15 = v46;
        sub_1B1362170((uint64_t)v46, v33+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(_QWORD *)(v12 + 72) * v36);
        v11 = v44;
      }
      ++v32;
    }
    while (v30 != v32);
    swift_unknownObjectRelease();
    a3 = v39;
    v25 = v45;
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1B1361B08(void *a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  char *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  id v27;
  _BYTE *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  char *v37;
  id v38;
  void *v39;
  uint64_t v40;
  char *v41;
  void *v42;
  id v43;
  uint64_t v44;

  swift_getObjectType();
  objc_msgSend(a1, sel_serverUnfilledReason);
  v4 = sub_1B1372358();
  if (v4 == sub_1B1372358())
  {
    if (objc_msgSend(a1, sel_bestRepresentation))
    {
      sub_1B137252C();
      if (swift_dynamicCastClass())
        sub_1B1372508();
      swift_unknownObjectRelease();
    }
    if (objc_msgSend(a1, sel_bestRepresentation)
      && (sub_1B13726A0(), v17 = swift_dynamicCastClass(), swift_unknownObjectRelease(), v17))
    {
      objc_msgSend(a1, sel_adType);
      v18 = sub_1B13722D4();
      v19 = v18 != sub_1B13722D4();
    }
    else
    {
      v19 = 0;
    }
    if (objc_msgSend(a1, sel_bestRepresentation)
      && (sub_1B13726A0(), v20 = swift_dynamicCastClass(), swift_unknownObjectRelease(), v20))
    {
      objc_msgSend(a1, sel_adType);
      v21 = sub_1B13722D4();
      v22 = v21 == sub_1B13722D4();
    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(a1, sel_serverUnfilledReason);
    v23 = sub_1B1372358();
    if (v23 != sub_1B1372358()
      || (objc_msgSend(a1, sel_placeholder) & 1) != 0
      || (objc_msgSend(a1, sel_adType), v24 = sub_1B13722D4(), v24 == sub_1B13722D4())
      || (v25 = sub_1B13722D4(), v25 == sub_1B13722D4()))
    {
      v26 = 0;
    }
    else
    {
      v40 = sub_1B137240C();
      v26 = v40 == sub_1B137240C() && !v19;
    }
    v12 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
    if (v26)
    {
      v27 = sub_1B1334274(a1, (char)objc_msgSend(a1, sel_isOutstreamVideoAd));
      swift_unknownObjectRelease();
      v28 = objc_allocWithZone((Class)type metadata accessor for WebAdView());
      v29 = a2;
      v30 = swift_unknownObjectRetain();
      v16 = sub_1B1361398(v30, v27, a2, v12, v28);
      swift_unknownObjectRelease();

      goto LABEL_37;
    }
    objc_msgSend(a1, sel_adType);
    v31 = sub_1B13722D4();
    if (v31 == sub_1B13722D4())
    {
      v32 = (char *)objc_allocWithZone((Class)type metadata accessor for NewsAdView());
      *(_QWORD *)&v32[OBJC_IVAR____TtC17PromotedContentUI10NewsAdView_newsAdView] = 0;
      v32[OBJC_IVAR____TtC17PromotedContentUI10NewsAdView_nativeArticleOnDisplay] = 0;
      v33 = &v32[OBJC_IVAR____TtC17PromotedContentUI10NewsAdView_oldPercentageTimestamp];
      v34 = sub_1B1372ACC();
      v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56);
      v35(v33, 1, 1, v34);
      v35(&v32[OBJC_IVAR____TtC17PromotedContentUI10NewsAdView_newPercentageTimestamp], 1, 1, v34);
LABEL_36:
      v43 = a2;
      v44 = swift_unknownObjectRetain();
      v16 = sub_1B13073A8(v44, a2, (uint64_t)v12, v32);
      swift_unknownObjectRelease();
      v12 = v43;
      goto LABEL_37;
    }
    v36 = sub_1B137240C();
    if (v36 != sub_1B137240C())
    {
      v32 = (char *)objc_allocWithZone((Class)type metadata accessor for AppAdView());
      *(_QWORD *)&v32[OBJC_IVAR____TtC17PromotedContentUI9AppAdView____lazy_storage___appView] = 0;
      *(_QWORD *)&v32[OBJC_IVAR____TtC17PromotedContentUI9AppAdView____lazy_storage___topBorder] = 0;
      *(_QWORD *)&v32[OBJC_IVAR____TtC17PromotedContentUI9AppAdView____lazy_storage___bottomBorder] = 0;
      goto LABEL_36;
    }
    if (v19)
    {
      v37 = (char *)objc_allocWithZone((Class)type metadata accessor for CarouselAdView());
      v38 = a2;
      v39 = (void *)swift_unknownObjectRetain();
      v16 = sub_1B136156C(v39, a2, (uint64_t)v12, v37);
      swift_unknownObjectRelease();
      v12 = v38;
      goto LABEL_37;
    }
    if (!v22)
    {
      v32 = (char *)objc_allocWithZone((Class)type metadata accessor for PromotedContentView());
      goto LABEL_36;
    }
    v41 = (char *)objc_allocWithZone((Class)type metadata accessor for SponsorshipAdView());
    v42 = (void *)swift_unknownObjectRetain();
    v15 = sub_1B130CF58(v42, v12, v41);
  }
  else
  {
    sub_1B1372D84();
    sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389990);
    v5 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1B1375550;
    v7 = objc_msgSend(a1, sel_identifier);
    v8 = sub_1B1372B98();
    v10 = v9;

    *(_QWORD *)(v6 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v6 + 64) = sub_1B12CE678();
    *(_QWORD *)(v6 + 32) = v8;
    *(_QWORD *)(v6 + 40) = v10;
    sub_1B1372988();

    swift_bridgeObjectRelease();
    v11 = (void *)objc_opt_self();
    v12 = a2;
    swift_unknownObjectRetain();
    v13 = objc_msgSend(v11, sel_sharedApplication);
    v14 = (char *)objc_allocWithZone((Class)type metadata accessor for PromotedContentView());
    v15 = sub_1B13073A8((uint64_t)a1, a2, (uint64_t)v13, v14);
  }
  v16 = v15;
  swift_unknownObjectRelease();
LABEL_37:

  return v16;
}

uint64_t sub_1B1362130(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1B12CF7F8(&qword_1ED3878B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B1362170(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CarouselElement();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B13621B4()
{
  char *v0;

  return qword_1B1378A20[*v0];
}

BOOL static AppStoreInteractionType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AppStoreInteractionType.hash(into:)()
{
  return sub_1B13732D0();
}

uint64_t AppStoreInteractionType.hashValue.getter()
{
  sub_1B13732C4();
  sub_1B13732D0();
  return sub_1B13732E8();
}

unint64_t sub_1B136224C()
{
  unint64_t result;

  result = qword_1EEF28870;
  if (!qword_1EEF28870)
  {
    result = MEMORY[0x1B5E1AF70](&protocol conformance descriptor for AppStoreInteractionType, &type metadata for AppStoreInteractionType);
    atomic_store(result, (unint64_t *)&qword_1EEF28870);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AppStoreInteractionType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AppStoreInteractionType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B136236C + 4 * byte_1B1378955[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_1B13623A0 + 4 * byte_1B1378950[v4]))();
}

uint64_t sub_1B13623A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B13623A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B13623B0);
  return result;
}

uint64_t sub_1B13623BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B13623C4);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_1B13623C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B13623D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppStoreInteractionType()
{
  return &type metadata for AppStoreInteractionType;
}

uint64_t sub_1B13623EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];

  v2 = type metadata accessor for CarouselElement();
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    v7 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v8 = *(_QWORD *)(v3 + 72);
    v23[1] = a1;
    swift_bridgeObjectRetain();
    v9 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    do
    {
      sub_1B12DD874(v7, (uint64_t)v5);
      v11 = &v5[*(int *)(v2 + 32)];
      v13 = *(_QWORD *)v11;
      v12 = *((_QWORD *)v11 + 1);
      swift_bridgeObjectRetain();
      sub_1B12DD8B8((uint64_t)v5);
      if (v12)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v9 = sub_1B12D3870(0, v9[2] + 1, 1, v9);
        v15 = v9[2];
        v14 = v9[3];
        if (v15 >= v14 >> 1)
          v9 = sub_1B12D3870((_QWORD *)(v14 > 1), v15 + 1, 1, v9);
        v9[2] = v15 + 1;
        v10 = &v9[2 * v15];
        v10[4] = v13;
        v10[5] = v12;
      }
      v7 += v8;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    v16 = v9[2];
    if (v16)
      goto LABEL_11;
LABEL_14:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v16 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
  if (!v16)
    goto LABEL_14;
LABEL_11:
  v17 = v9[4];
  v18 = v16 - 1;
  if (v16 == 1)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v19 = v9 + 7;
    do
    {
      v20 = *(v19 - 1);
      swift_bridgeObjectRetain();
      v19 += 2;
      v21 = sub_1B1372C10();
      if (sub_1B1372C10() < v21)
        v17 = v20;
      swift_bridgeObjectRelease();
      --v18;
    }
    while (v18);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_1B1362608@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  char *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  void (*v45)(uint64_t, char *, uint64_t);
  void (*v46)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v47)(uint64_t, uint64_t, uint64_t);
  unsigned int v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t);
  uint64_t result;
  char *v56;
  unint64_t v57;
  uint64_t (*v58)(char *, char *, uint64_t);
  char *v59;
  void (*v60)(char *, uint64_t);
  char *v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t (*v66)(char *, uint64_t);
  char *v67;
  void (*v68)(uint64_t, char *, uint64_t);
  char *v69;
  char *v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  unint64_t v80;

  v4 = sub_1B1371CEC();
  v73 = *(_QWORD *)(v4 - 8);
  v74 = v4;
  v5 = MEMORY[0x1E0C80A78](v4);
  v72 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v71 = (char *)&v67 - v7;
  v8 = type metadata accessor for CarouselElement();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1B12CF7F8(&qword_1ED3877E0);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v13);
  v18 = (char *)&v67 - v17;
  MEMORY[0x1E0C80A78](v16);
  v69 = (char *)&v67 - v19;
  v20 = sub_1B1371D10();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x1E0C80A78](a1);
  v70 = (char *)&v67 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x1E0C80A78](v22);
  v26 = (char *)&v67 - v25;
  v27 = MEMORY[0x1E0C80A78](v24);
  v79 = (char *)&v67 - v28;
  v29 = MEMORY[0x1E0C80A78](v27);
  v75 = v15;
  v76 = (char *)&v67 - v30;
  v31 = *(_QWORD *)(a1 + 16);
  v67 = a2;
  if (v31)
  {
    v32 = v29 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v33 = *(_QWORD *)(v9 + 72);
    v68 = (void (*)(uint64_t, char *, uint64_t))v29;
    swift_bridgeObjectRetain();
    v80 = MEMORY[0x1E0DEE9D8];
    v77 = v26;
    v78 = v8;
    do
    {
      sub_1B12DD874(v32, (uint64_t)v11);
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, &v11[*(int *)(v8 + 28)], v20);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      sub_1B12DD8B8((uint64_t)v11);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v18, 1, v20) == 1)
      {
        sub_1B1362BF8((uint64_t)v18);
      }
      else
      {
        v34 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
        v35 = v79;
        v34(v79, v18, v20);
        v34(v26, v35, v20);
        v36 = v80;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v36 = sub_1B12EB574(0, *(_QWORD *)(v36 + 16) + 1, 1, v36);
        v38 = *(_QWORD *)(v36 + 16);
        v37 = *(_QWORD *)(v36 + 24);
        v80 = v36;
        if (v38 >= v37 >> 1)
          v80 = sub_1B12EB574(v37 > 1, v38 + 1, 1, v80);
        v39 = v80;
        *(_QWORD *)(v80 + 16) = v38 + 1;
        v26 = v77;
        v34((char *)(v39+ ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80))+ *(_QWORD *)(v21 + 72) * v38), v77, v20);
        v8 = v78;
      }
      v32 += v33;
      --v31;
    }
    while (v31);
    swift_bridgeObjectRelease();
    v40 = v76;
    v42 = (uint64_t)v69;
    v41 = v70;
    v43 = v80;
  }
  else
  {
    v43 = MEMORY[0x1E0DEE9D8];
    v40 = v76;
    v42 = (uint64_t)v69;
    v41 = v70;
  }
  v78 = *(_QWORD *)(v43 + 16);
  if (!v78)
  {
    v46 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56);
    v46(v42, 1, 1, v20);
    v50 = v67;
    goto LABEL_17;
  }
  v44 = (char *)(v43 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80)));
  v80 = v43;
  v45 = *(void (**)(uint64_t, char *, uint64_t))(v21 + 16);
  v45(v42, v44, v20);
  v46 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56);
  v46(v42, 0, 1, v20);
  v47 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 48);
  v48 = v47(v42, 1, v20);
  v49 = (uint64_t)v75;
  if (v48 == 1)
  {
    v50 = v67;
LABEL_17:
    sub_1B1362BF8(v42);
    v51 = v50;
    v52 = 1;
LABEL_21:
    v46((uint64_t)v51, v52, 1, v20);
    return swift_bridgeObjectRelease();
  }
  v53 = v42;
  v54 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 32);
  v54(v40, v53, v20);
  result = swift_bridgeObjectRetain();
  v77 = (char *)v47;
  if (v78 == 1)
  {
LABEL_19:
    v46(v49, 1, 1, v20);
LABEL_20:
    swift_bridgeObjectRelease();
    sub_1B1362BF8(v49);
    v56 = v67;
    v54(v67, (uint64_t)v76, v20);
    v51 = v56;
    v52 = 0;
    goto LABEL_21;
  }
  v57 = 1;
  v69 = v44;
  v70 = (char *)v46;
  v68 = v45;
  while (v57 < *(_QWORD *)(v80 + 16))
  {
    v45(v49, &v44[*(_QWORD *)(v21 + 72) * v57], v20);
    v46(v49, 0, 1, v20);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v77)(v49, 1, v20) == 1)
      goto LABEL_20;
    v54(v41, v49, v20);
    v58 = (uint64_t (*)(char *, char *, uint64_t))v54;
    v59 = v71;
    sub_1B1371CD4();
    v79 = (char *)sub_1B1371CE0();
    v60 = *(void (**)(char *, uint64_t))(v73 + 8);
    v61 = v59;
    v62 = v74;
    v60(v61, v74);
    v63 = v72;
    v64 = v76;
    sub_1B1371CD4();
    v65 = sub_1B1371CE0();
    v60(v63, v62);
    v66 = *(uint64_t (**)(char *, uint64_t))(v21 + 8);
    if (v65 >= (uint64_t)v79)
    {
      result = v66(v41, v20);
    }
    else
    {
      v66(v64, v20);
      result = v58(v64, v41, v20);
    }
    v54 = (void (*)(char *, uint64_t, uint64_t))v58;
    ++v57;
    v49 = (uint64_t)v75;
    v44 = v69;
    v46 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v70;
    v45 = v68;
    if (v78 == v57)
      goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B1362BF8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1B12CF7F8(&qword_1ED3877E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B1362C38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  dispatch_semaphore_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  char *v41;
  char *v42;
  double v43;
  double v44;
  void (*v45)(char *, uint64_t);
  void *v46;
  id v48;
  char *v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t aBlock;
  unint64_t v60;
  void (*v61)(uint64_t, void *, uint64_t, void *);
  void *v62;
  uint64_t (*v63)(void *, uint64_t, uint64_t);
  uint64_t v64;

  v8 = v7;
  v16 = sub_1B1371EB4();
  v57 = *(_QWORD *)(v16 - 8);
  v58 = v16;
  v17 = MEMORY[0x1E0C80A78](v16);
  v56 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v48 - v19;
  v21 = *a7;
  *(_QWORD *)(v8 + 40) = a1;
  *(_QWORD *)(v8 + 48) = a2;
  *(_QWORD *)(v8 + 56) = a3;
  *(_QWORD *)(v8 + 64) = a4;
  *(_QWORD *)(v8 + 72) = a6;
  v22 = swift_allocObject();
  *(_BYTE *)(v22 + 16) = 0;
  v23 = swift_allocObject();
  *(_BYTE *)(v23 + 16) = 0;
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = 0x4014000000000000;
  if (a5)
  {
    v52 = v24 + 16;
    v53 = v23 + 16;
    v54 = v22 + 16;
    v55 = v21;
    swift_unknownObjectRetain();
    v49 = v20;
    sub_1B1371EA8();
    v25 = dispatch_semaphore_create(3);
    v26 = (void *)sub_1B1372B74();
    v27 = objc_msgSend(a5, sel_BOOLForKey_, v26);

    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = v23;
    *(_QWORD *)(v28 + 24) = v25;
    v63 = sub_1B13634EC;
    v64 = v28;
    aBlock = MEMORY[0x1E0C809B0];
    v60 = 1107296256;
    v61 = sub_1B136324C;
    v62 = &unk_1E62F9778;
    v29 = _Block_copy(&aBlock);
    swift_retain();
    v30 = v25;
    swift_release();
    v51 = v27;
    objc_msgSend(v27, sel_valueWithCompletion_, v29);
    _Block_release(v29);
    v31 = (void *)sub_1B1372B74();
    v32 = objc_msgSend(a5, sel_BOOLForKey_, v31);

    v33 = swift_allocObject();
    *(_QWORD *)(v33 + 16) = v22;
    *(_QWORD *)(v33 + 24) = v30;
    v63 = sub_1B13634C0;
    v64 = v33;
    aBlock = MEMORY[0x1E0C809B0];
    v60 = 1107296256;
    v61 = sub_1B136324C;
    v62 = &unk_1E62F97C8;
    v34 = _Block_copy(&aBlock);
    v35 = v30;
    swift_retain();
    swift_release();
    v50 = v32;
    objc_msgSend(v32, sel_valueWithCompletion_, v34);
    _Block_release(v34);
    v36 = (void *)sub_1B1372B74();
    v37 = objc_msgSend(a5, sel_doubleForKey_, v36);

    v38 = swift_allocObject();
    *(_QWORD *)(v38 + 16) = v24;
    *(_QWORD *)(v38 + 24) = v35;
    v63 = sub_1B13634DC;
    v64 = v38;
    aBlock = MEMORY[0x1E0C809B0];
    v60 = 1107296256;
    v61 = sub_1B136324C;
    v62 = &unk_1E62F9818;
    v39 = _Block_copy(&aBlock);
    v40 = v35;
    swift_retain();
    swift_release();
    objc_msgSend(v37, sel_valueWithCompletion_, v39);
    _Block_release(v39);
    sub_1B1372E50();
    if (objc_msgSend((id)objc_opt_self(), sel_isAppleInternalInstall))
    {
      v48 = v37;
      v41 = v56;
      sub_1B1371EA8();
      v42 = v49;
      sub_1B1371E18();
      v44 = v43;
      v45 = *(void (**)(char *, uint64_t))(v57 + 8);
      v45(v41, v58);
      if (v44 <= 0.1)
      {
        swift_unknownObjectRelease_n();

      }
      else
      {
        aBlock = 0;
        v60 = 0xE000000000000000;
        sub_1B13730E4();
        sub_1B1372C34();
        sub_1B1372D18();
        v46 = (void *)sub_1B1372B74();
        swift_bridgeObjectRelease();
        APSimulateCrash();

        swift_unknownObjectRelease_n();
      }
      v45(v42, v58);
    }
    else
    {
      swift_unknownObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v57 + 8))(v49, v58);
    }
    v21 = v55;
  }
  swift_beginAccess();
  *(_BYTE *)(v8 + 17) = *(_BYTE *)(v22 + 16);
  swift_beginAccess();
  *(_BYTE *)(v8 + 16) = *(_BYTE *)(v23 + 16);
  swift_beginAccess();
  *(_QWORD *)(v8 + 24) = *(_QWORD *)(v24 + 16);
  *(_QWORD *)(v8 + 32) = v21;
  swift_release();
  swift_release();
  swift_release();
  return v8;
}

void sub_1B136324C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (*v7)(void *, uint64_t, void *);
  id v8;
  id v9;

  v7 = *(void (**)(void *, uint64_t, void *))(a1 + 32);
  swift_retain();
  v9 = a2;
  v8 = a4;
  v7(a2, a3, a4);
  swift_release();

}

uint64_t sub_1B13632C8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned __int8 v5;

  if (a1)
    v5 = objc_msgSend(a1, sel_BOOLValue);
  else
    v5 = 0;
  swift_beginAccess();
  *(_BYTE *)(a4 + 16) = v5;
  return sub_1B1372E5C();
}

uint64_t sub_1B1363330(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v5;
  double v6;

  if (a1)
  {
    objc_msgSend(a1, sel_doubleValue);
    v6 = v5;
  }
  else
  {
    v6 = 5.0;
  }
  swift_beginAccess();
  *(double *)(a4 + 16) = v6;
  return sub_1B1372E5C();
}

uint64_t sub_1B1363398()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1B13633CC(uint64_t *a1, uint64_t *a2)
{
  return sub_1B13633D8(*a1, *a2);
}

uint64_t sub_1B13633D8(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a1 + 16) == *(unsigned __int8 *)(a2 + 16)
    && *(unsigned __int8 *)(a1 + 17) == *(unsigned __int8 *)(a2 + 17)
    && *(double *)(a1 + 24) == *(double *)(a2 + 24)
    && *(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 32)
    && (*(_QWORD *)(a1 + 40) == *(_QWORD *)(a2 + 40) && *(_QWORD *)(a1 + 48) == *(_QWORD *)(a2 + 48)
     || (sub_1B1373234() & 1) != 0)
    && (*(_QWORD *)(a1 + 56) == *(_QWORD *)(a2 + 56) && *(_QWORD *)(a1 + 64) == *(_QWORD *)(a2 + 64)
     || (sub_1B1373234() & 1) != 0))
  {
    return sub_1B133E67C(*(_QWORD *)(a1 + 72), *(_QWORD *)(a2 + 72));
  }
  else
  {
    return 0;
  }
}

uint64_t sub_1B1363498()
{
  return swift_deallocObject();
}

uint64_t sub_1B13634A8()
{
  return swift_deallocObject();
}

uint64_t sub_1B13634C0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1B13632C8(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_1B13634DC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1B1363330(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

id sub_1B1363524()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TrackedInstance();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1B1363564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, double a6)
{
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;

  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC37F8]), sel_initForTextStyle_, a3);
  swift_bridgeObjectRetain();
  v12 = (void *)sub_1B1372B74();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend((id)objc_opt_self(), sel_fontWithName_size_, v12, a6);

  if (v13)
  {
    if ((a5 & 1) != 0)
      v14 = objc_msgSend(v11, sel_scaledFontForFont_, v13);
    else
      v14 = objc_msgSend(v11, sel_scaledFontForFont_maximumPointSize_, v13, *(double *)&a4);
    v17 = v14;

  }
  else
  {
    sub_1B1372D90();
    sub_1B12CE6BC();
    v15 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_1B1375550;
    *(_QWORD *)(v16 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v16 + 64) = sub_1B12CE678();
    *(_QWORD *)(v16 + 32) = a1;
    *(_QWORD *)(v16 + 40) = a2;
    swift_bridgeObjectRetain();
    sub_1B1372988();

    swift_bridgeObjectRelease();
    return 0;
  }
  return v17;
}

uint64_t destroy for AppStoreTargetingMetadata()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AppStoreTargetingMetadata(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AppStoreTargetingMetadata(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AppStoreTargetingMetadata(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for AppStoreTargetingMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppStoreTargetingMetadata(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppStoreTargetingMetadata(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_1B1363954()
{
  id v0;

  v0 = sub_1B12EBCD4(0);
  return sub_1B12EC22C(v0);
}

void sub_1B136396C()
{
  uint64_t v0;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    sub_1B12F51B8(0, 0);
  }
  else
  {
    v0 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_1B12F51B8(sub_1B12ECEC4, v0);
    swift_release_n();
  }
}

uint64_t sub_1B1363A00()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1B1363A24()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0;
  sub_1B1372D78();
  sub_1B12CE6BC();
  v2 = (void *)sub_1B1372F70();
  sub_1B12CF7F8(&qword_1ED3899B0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1B1375550;
  v4 = OBJC_IVAR___APPCMetricsView_promotedContent;
  v5 = objc_msgSend(*(id *)(v1 + OBJC_IVAR___APPCMetricsView_promotedContent), sel_identifier);
  v6 = sub_1B1372B98();
  v8 = v7;

  *(_QWORD *)(v3 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v3 + 64) = sub_1B12CE678();
  *(_QWORD *)(v3 + 32) = v6;
  *(_QWORD *)(v3 + 40) = v8;
  sub_1B1372988();

  swift_bridgeObjectRelease();
  *(_BYTE *)(v1 + OBJC_IVAR___APPCMetricsView_wasTapped) = 1;
  objc_msgSend(objc_msgSend(*(id *)(v1 + v4), sel_metricsHelper), sel_adMarkerInteracted);
  return swift_unknownObjectRelease();
}

uint64_t sub_1B1363B94()
{
  sub_1B1363DBC();
  return sub_1B1372EBC();
}

unint64_t sub_1B1363DBC()
{
  unint64_t result;

  result = qword_1EEF28888;
  if (!qword_1EEF28888)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EEF28888);
  }
  return result;
}

uint64_t sub_1B1363DF8()
{
  uint64_t v0;

  v0 = sub_1B1372A48();
  sub_1B1363E78(v0, qword_1ED38B7B0);
  sub_1B12E5A5C(v0, (uint64_t)qword_1ED38B7B0);
  return sub_1B1372A3C();
}

uint64_t *sub_1B1363E78(uint64_t a1, uint64_t *a2)
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

uint64_t sub_1B1363EB8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_1B13732C4();
    sub_1B1372C04();
    v6 = sub_1B13732E8();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1B1373234() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_1B1373234() & 1) != 0)
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

uint64_t sub_1B1363FEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v12;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  sub_1B13732C4();
  sub_1B13722EC();
  sub_1B13732D0();
  v3 = sub_1B13732E8();
  v4 = -1 << *(_BYTE *)(a2 + 32);
  v5 = v3 & ~v4;
  v6 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
    return 0;
  v7 = sub_1B13722EC();
  if (v7 == sub_1B13722EC())
    return 1;
  v9 = ~v4;
  v10 = (v5 + 1) & v9;
  if (((*(_QWORD *)(v6 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
    return 0;
  do
  {
    v11 = sub_1B13722EC();
    v12 = v11 == sub_1B13722EC();
    result = v12;
    if (v12)
      break;
    v10 = (v10 + 1) & v9;
  }
  while (((*(_QWORD *)(v6 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  return result;
}

void sub_1B1364108()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

id WebAdView.__deallocating_deinit()
{
  char *v0;
  char *v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  objc_super v17;

  v1 = v0;
  sub_1B1372D84();
  sub_1B12CE6BC();
  v2 = (void *)sub_1B1372F70();
  sub_1B12CF7F8(&qword_1ED3899B0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1B13757D0;
  v4 = objc_msgSend(*(id *)&v1[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_journeyIdentifier);
  v5 = sub_1B1372B98();
  v7 = v6;

  v8 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v3 + 56) = MEMORY[0x1E0DEA968];
  v9 = sub_1B12CE678();
  *(_QWORD *)(v3 + 64) = v9;
  *(_QWORD *)(v3 + 32) = v5;
  *(_QWORD *)(v3 + 40) = v7;
  v10 = objc_msgSend(v1, sel_description);
  v11 = sub_1B1372B98();
  v13 = v12;

  *(_QWORD *)(v3 + 96) = v8;
  *(_QWORD *)(v3 + 104) = v9;
  *(_QWORD *)(v3 + 72) = v11;
  *(_QWORD *)(v3 + 80) = v13;
  sub_1B1372988();

  swift_bridgeObjectRelease();
  v14 = *(void **)&v1[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView];
  if (v14)
  {
    v15 = v14;
    sub_1B1367288();

  }
  v17.receiver = v1;
  v17.super_class = (Class)type metadata accessor for WebAdView();
  return objc_msgSendSuper2(&v17, sel_dealloc);
}

uint64_t sub_1B13643C4()
{
  char *v0;
  char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;

  v1 = v0;
  sub_1B1372D84();
  sub_1B12CE6BC();
  v2 = (void *)sub_1B1372F70();
  sub_1B12CF7F8(&qword_1ED3899B0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1B13757D0;
  v4 = OBJC_IVAR___APPCPromotedContentView_promotedContent;
  v5 = objc_msgSend(*(id *)&v1[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_journeyIdentifier);
  v6 = sub_1B1372B98();
  v8 = v7;

  v9 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v3 + 56) = MEMORY[0x1E0DEA968];
  v10 = sub_1B12CE678();
  *(_QWORD *)(v3 + 64) = v10;
  *(_QWORD *)(v3 + 32) = v6;
  *(_QWORD *)(v3 + 40) = v8;
  v11 = objc_msgSend(v1, sel_description);
  v12 = sub_1B1372B98();
  v14 = v13;

  *(_QWORD *)(v3 + 96) = v9;
  *(_QWORD *)(v3 + 104) = v10;
  *(_QWORD *)(v3 + 72) = v12;
  *(_QWORD *)(v3 + 80) = v14;
  sub_1B1372988();

  swift_bridgeObjectRelease();
  v15 = OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView;
  v16 = *(void **)&v1[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView];
  if (v16)
  {
    v17 = v16;
    sub_1B1367288();

    v18 = *(void **)&v1[v15];
    if (v18)
    {
      objc_msgSend(v18, sel_removeFromSuperview);
      v16 = *(void **)&v1[v15];
    }
    else
    {
      v16 = 0;
    }
  }
  *(_QWORD *)&v1[v15] = 0;

  objc_msgSend(objc_msgSend(*(id *)&v1[v4], sel_metricsHelper), sel_webAdRemoved);
  return swift_unknownObjectRelease();
}

void sub_1B136464C(double a1, double a2, double a3, double a4)
{
  char *v4;
  objc_class *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  id v19;
  objc_super v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  v9 = (objc_class *)type metadata accessor for WebAdView();
  v21.receiver = v4;
  v21.super_class = v9;
  objc_msgSendSuper2(&v21, sel_frame);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v20.receiver = v4;
  v20.super_class = v9;
  objc_msgSendSuper2(&v20, sel_setFrame_, a1, a2, a3, a4);
  objc_msgSend(v4, sel_frame);
  v23.origin.x = v11;
  v23.origin.y = v13;
  v23.size.width = v15;
  v23.size.height = v17;
  if (!CGRectEqualToRect(v22, v23))
  {
    v18 = *(void **)&v4[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView];
    if (v18)
    {
      v19 = v18;
      objc_msgSend(v4, sel_bounds);
      objc_msgSend(v19, sel_setFrame_);

    }
  }
}

void sub_1B1364754()
{
  sub_1B12BF9C4();
  sub_1B1364768();
}

void sub_1B1364768()
{
  char *v0;
  void *v1;
  objc_class *v2;
  id v3;
  char *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char *v10;
  id v11;
  void *v12;
  objc_super v13;

  v1 = *(void **)&v0[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView];
  if (v1)
  {
    v2 = (objc_class *)type metadata accessor for WebAdNavigationCoordinator();
    v3 = objc_allocWithZone(v2);
    swift_unknownObjectWeakInit();
    swift_unknownObjectWeakAssign();
    v13.receiver = v3;
    v13.super_class = v2;
    v4 = v1;
    v5 = objc_msgSendSuper2(&v13, sel_init);
    v6 = OBJC_IVAR____TtC17PromotedContentUI9WebAdView_navigationCoordinator;
    v7 = *(void **)&v0[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_navigationCoordinator];
    *(_QWORD *)&v0[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_navigationCoordinator] = v5;

    objc_msgSend(v4, sel_setNavigationDelegate_, *(_QWORD *)&v0[v6], v13.receiver, v13.super_class);
    v8 = OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock;
    v9 = *(void **)&v4[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock];
    v10 = v0;
    objc_msgSend(v9, sel_lock);
    *(_QWORD *)&v4[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView__processDelegate + 8] = &off_1E62F6650;
    swift_unknownObjectWeakAssign();
    objc_msgSend(*(id *)&v4[v8], sel_unlock);

    objc_msgSend(v4, sel_setUIDelegate_, v10);
    v11 = objc_msgSend(*(id *)&v10[OBJC_IVAR___APPCPromotedContentView_promotedContent], sel_campaignText);
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v4, sel_setRemoteInspectionNameOverride_, v11);

    }
    objc_msgSend(v10, sel_insertSubview_belowSubview_, v4, *(_QWORD *)&v10[OBJC_IVAR___APPCPromotedContentView_dimmerView]);

  }
}

uint64_t sub_1B13648F0()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  char *v7;

  v1 = *(void **)&v0[OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView];
  if (!v1)
    goto LABEL_5;
  v2 = *(void **)&v0[OBJC_IVAR___APPCPromotedContentView_promotedContent];
  v3 = v1;
  if (!objc_msgSend(v2, sel_isOutstreamVideoAd))
  {

LABEL_5:
    sub_1B12CF7F8(&qword_1ED387FA8);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_1B13757D0;
    *(_QWORD *)(v4 + 56) = type metadata accessor for PromotedContentView();
    *(_QWORD *)(v4 + 32) = v0;
    v5 = *(void **)&v0[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView];
    *(_QWORD *)(v4 + 88) = type metadata accessor for PrivacyMarker();
    *(_QWORD *)(v4 + 64) = v5;
    goto LABEL_6;
  }
  sub_1B12CF7F8(&qword_1ED387FA8);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1B1375D50;
  *(_QWORD *)(v4 + 56) = type metadata accessor for WebAdView();
  *(_QWORD *)(v4 + 32) = v0;
  *(_QWORD *)(v4 + 88) = type metadata accessor for PromotedContentWebView();
  *(_QWORD *)(v4 + 64) = v3;
  v5 = *(void **)&v0[OBJC_IVAR___APPCPromotedContentView_privacyMarkerView];
  *(_QWORD *)(v4 + 120) = type metadata accessor for PrivacyMarker();
  *(_QWORD *)(v4 + 96) = v5;
LABEL_6:
  v6 = v5;
  v7 = v0;
  return v4;
}

uint64_t sub_1B1364A20(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (!a1)
    return 1;
  v3 = v2;
  v5 = sub_1B13728BC();
  v6 = objc_msgSend(a2, sel_tapAction);
  if (!v6)
    return 1;
  v7 = v6;
  v8 = sub_1B13728BC();

  v9 = *(_QWORD *)(v3 + OBJC_IVAR____TtC17PromotedContentUI9WebAdView_mraidActionTypes);
  if ((sub_1B1363FEC(v5, v9) & 1) != 0)
    v10 = sub_1B1363FEC(v8, v9);
  else
    v10 = 0;
  v12 = sub_1B13722EC();
  v13 = sub_1B13722EC();
  result = 1;
  if ((v10 & 1) == 0 && v12 != v13)
  {
    sub_1B1372D90();
    sub_1B12CE6BC();
    v14 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_1B13757D0;
    v16 = sub_1B13722E0();
    v18 = v17;
    v19 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v15 + 56) = MEMORY[0x1E0DEA968];
    v20 = sub_1B12CE678();
    *(_QWORD *)(v15 + 64) = v20;
    *(_QWORD *)(v15 + 32) = v16;
    *(_QWORD *)(v15 + 40) = v18;
    v21 = sub_1B13722E0();
    *(_QWORD *)(v15 + 96) = v19;
    *(_QWORD *)(v15 + 104) = v20;
    *(_QWORD *)(v15 + 72) = v21;
    *(_QWORD *)(v15 + 80) = v22;
    sub_1B1372988();

    swift_bridgeObjectRelease();
    return 0;
  }
  return result;
}

uint64_t sub_1B1364BE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  char v5;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR___APPCPromotedContentView_visiblePercentage);
  *(_QWORD *)(v1 + OBJC_IVAR___APPCPromotedContentView_visiblePercentage) = a1;
  result = (uint64_t)objc_msgSend(*(id *)(v1 + OBJC_IVAR___APPCPromotedContentView_promotedContent), sel_isOutstreamVideoAd);
  if ((result & 1) == 0)
  {
    if (v3 <= 94)
    {
      if (a1 < 95)
        return result;
LABEL_7:
      if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC17PromotedContentUI9WebAdView_isAppActive) & 1) == 0)
      {
        *(_BYTE *)(v1 + OBJC_IVAR____TtC17PromotedContentUI9WebAdView_needToUpdateVisibility) = 1;
        return result;
      }
      v5 = 1;
      return sub_1B1338F70(v5);
    }
    if (a1 >= 95)
      return result;
LABEL_12:
    v5 = 0;
    return sub_1B1338F70(v5);
  }
  if (v3 <= 49)
  {
    if (a1 < 50)
      return result;
    goto LABEL_7;
  }
  if (a1 <= 49)
    goto LABEL_12;
  return result;
}

void sub_1B1364CB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v1 = v0;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC17PromotedContentUI9WebAdView_webView);
  if (v2 && (v3 = *(void **)(v2 + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_webProcessProxy)) != 0)
  {
    swift_unknownObjectRetain();
    v4 = sub_1B1353760();
    sub_1B1335CB8((uint64_t)v4);
    swift_bridgeObjectRelease();
    v11 = (id)sub_1B1372B08();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_contentSizeDidChange_, v11);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_1B1372D90();
    sub_1B12CE6BC();
    v5 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1B1375550;
    v7 = objc_msgSend(*(id *)(v1 + OBJC_IVAR___APPCPromotedContentView_promotedContent), sel_identifier);
    v8 = sub_1B1372B98();
    v10 = v9;

    *(_QWORD *)(v6 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v6 + 64) = sub_1B12CE678();
    *(_QWORD *)(v6 + 32) = v8;
    *(_QWORD *)(v6 + 40) = v10;
    sub_1B1372988();

    swift_bridgeObjectRelease();
  }
}

uint64_t type metadata accessor for WebAdView()
{
  uint64_t result;

  result = qword_1ED388908;
  if (!qword_1ED388908)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B1364F6C()
{
  return type metadata accessor for WebAdView();
}

uint64_t sub_1B1364F74()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for WebAdView()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1B1365000()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1B12C1AAC();
  qword_1ED38B6D8 = result;
  unk_1ED38B6E0 = v1;
  return result;
}

uint64_t sub_1B1365020()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1B1365040();
  qword_1EEF2A2D8 = result;
  unk_1EEF2A2E0 = v1;
  return result;
}

uint64_t sub_1B1365040()
{
  uint64_t ObjCClassFromMetadata;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t result;

  type metadata accessor for PromotedContentUIModule();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_opt_self();
  v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B12CA07C();
  LOBYTE(v1) = sub_1B1372EA4();

  if ((v1 & 1) != 0)
  {
    result = sub_1B1373174();
    __break(1u);
  }
  else
  {
    v4 = sub_1B1371D1C();

    return v4;
  }
  return result;
}

uint64_t sub_1B136519C()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1B13651BC();
  qword_1EEF2A2E8 = result;
  unk_1EEF2A2F0 = v1;
  return result;
}

uint64_t sub_1B13651BC()
{
  uint64_t ObjCClassFromMetadata;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t result;

  type metadata accessor for PromotedContentUIModule();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_opt_self();
  v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B12CA07C();
  LOBYTE(v1) = sub_1B1372EA4();

  if ((v1 & 1) != 0)
  {
    result = sub_1B1373174();
    __break(1u);
  }
  else
  {
    v4 = sub_1B1371D1C();

    return v4;
  }
  return result;
}

uint64_t sub_1B1365328()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1B1365348();
  qword_1EEF2A2F8 = result;
  unk_1EEF2A300 = v1;
  return result;
}

uint64_t sub_1B1365348()
{
  uint64_t ObjCClassFromMetadata;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t result;

  type metadata accessor for PromotedContentUIModule();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_opt_self();
  v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B12CA07C();
  LOBYTE(v1) = sub_1B1372EA4();

  if ((v1 & 1) != 0)
  {
    result = sub_1B1373174();
    __break(1u);
  }
  else
  {
    v4 = sub_1B1371D1C();

    return v4;
  }
  return result;
}

uint64_t sub_1B13654AC()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1B13654CC();
  qword_1EEF2A308 = result;
  unk_1EEF2A310 = v1;
  return result;
}

uint64_t sub_1B13654CC()
{
  uint64_t ObjCClassFromMetadata;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t result;

  type metadata accessor for PromotedContentUIModule();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_opt_self();
  v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B12CA07C();
  LOBYTE(v1) = sub_1B1372EA4();

  if ((v1 & 1) != 0)
  {
    result = sub_1B1373174();
    __break(1u);
  }
  else
  {
    v4 = sub_1B1371D1C();

    return v4;
  }
  return result;
}

uint64_t sub_1B1365640()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1B1365660();
  qword_1EEF2A318 = result;
  unk_1EEF2A320 = v1;
  return result;
}

uint64_t sub_1B1365660()
{
  uint64_t ObjCClassFromMetadata;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t result;

  type metadata accessor for PromotedContentUIModule();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_opt_self();
  v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B12CA07C();
  LOBYTE(v1) = sub_1B1372EA4();

  if ((v1 & 1) != 0)
  {
    result = sub_1B1373174();
    __break(1u);
  }
  else
  {
    v4 = sub_1B1371D1C();

    return v4;
  }
  return result;
}

uint64_t sub_1B13657C4()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1B13657E4();
  qword_1ED38B6A0 = result;
  *(_QWORD *)algn_1ED38B6A8 = v1;
  return result;
}

uint64_t sub_1B13657E4()
{
  uint64_t ObjCClassFromMetadata;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t result;

  type metadata accessor for PromotedContentUIModule();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_opt_self();
  v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B12CA07C();
  LOBYTE(v1) = sub_1B1372EA4();

  if ((v1 & 1) != 0)
  {
    result = sub_1B1373174();
    __break(1u);
  }
  else
  {
    v4 = sub_1B1371D1C();

    return v4;
  }
  return result;
}

uint64_t sub_1B1365948()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1B1365968();
  qword_1ED38B6E8 = result;
  unk_1ED38B6F0 = v1;
  return result;
}

uint64_t sub_1B1365968()
{
  uint64_t ObjCClassFromMetadata;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t result;

  type metadata accessor for PromotedContentUIModule();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_opt_self();
  v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B12CA07C();
  LOBYTE(v1) = sub_1B1372EA4();

  if ((v1 & 1) != 0)
  {
    result = sub_1B1373174();
    __break(1u);
  }
  else
  {
    v4 = sub_1B1371D1C();

    return v4;
  }
  return result;
}

uint64_t sub_1B1365AB4()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1B1365AD4();
  qword_1ED38B628 = result;
  unk_1ED38B630 = v1;
  return result;
}

uint64_t sub_1B1365AD4()
{
  uint64_t ObjCClassFromMetadata;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t result;

  type metadata accessor for PromotedContentUIModule();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_opt_self();
  v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B12CA07C();
  LOBYTE(v1) = sub_1B1372EA4();

  if ((v1 & 1) != 0)
  {
    result = sub_1B1373174();
    __break(1u);
  }
  else
  {
    v4 = sub_1B1371D1C();

    return v4;
  }
  return result;
}

uint64_t sub_1B1365C30()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1B1365C50();
  qword_1ED38B658 = result;
  unk_1ED38B660 = v1;
  return result;
}

uint64_t sub_1B1365C50()
{
  uint64_t ObjCClassFromMetadata;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t result;

  type metadata accessor for PromotedContentUIModule();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_opt_self();
  v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B12CA07C();
  LOBYTE(v1) = sub_1B1372EA4();

  if ((v1 & 1) != 0)
  {
    result = sub_1B1373174();
    __break(1u);
  }
  else
  {
    v4 = sub_1B1371D1C();

    return v4;
  }
  return result;
}

uint64_t sub_1B1365DA4()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1B1365DC4();
  qword_1ED38B638 = result;
  unk_1ED38B640 = v1;
  return result;
}

uint64_t sub_1B1365DC4()
{
  uint64_t ObjCClassFromMetadata;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t result;

  type metadata accessor for PromotedContentUIModule();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_opt_self();
  v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B12CA07C();
  LOBYTE(v1) = sub_1B1372EA4();

  if ((v1 & 1) != 0)
  {
    result = sub_1B1373174();
    __break(1u);
  }
  else
  {
    v4 = sub_1B1371D1C();

    return v4;
  }
  return result;
}

uint64_t sub_1B1365F18()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1B1365F38();
  qword_1ED38B648 = result;
  unk_1ED38B650 = v1;
  return result;
}

uint64_t sub_1B1365F38()
{
  uint64_t ObjCClassFromMetadata;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t result;

  type metadata accessor for PromotedContentUIModule();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_opt_self();
  v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B12CA07C();
  LOBYTE(v1) = sub_1B1372EA4();

  if ((v1 & 1) != 0)
  {
    result = sub_1B1373174();
    __break(1u);
  }
  else
  {
    v4 = sub_1B1371D1C();

    return v4;
  }
  return result;
}

uint64_t sub_1B13660AC()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1B13660CC();
  qword_1ED38B668 = result;
  unk_1ED38B670 = v1;
  return result;
}

uint64_t sub_1B13660CC()
{
  uint64_t ObjCClassFromMetadata;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t result;

  type metadata accessor for PromotedContentUIModule();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_opt_self();
  v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B12CA07C();
  LOBYTE(v1) = sub_1B1372EA4();

  if ((v1 & 1) != 0)
  {
    result = sub_1B1373174();
    __break(1u);
  }
  else
  {
    v4 = sub_1B1371D1C();

    return v4;
  }
  return result;
}

void sub_1B1366228()
{
  uint64_t ObjCClassFromMetadata;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  type metadata accessor for PromotedContentUIModule();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_opt_self();
  v2 = objc_msgSend((id)v1, sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = objc_msgSend((id)v1, sel_mainBundle);
  sub_1B12CA07C();
  LOBYTE(v1) = sub_1B1372EA4();

  if ((v1 & 1) != 0)
  {
    sub_1B1373174();
    __break(1u);
  }
  else
  {
    v4 = sub_1B1371D1C();
    v6 = v5;

    qword_1EEF2A328 = v4;
    unk_1EEF2A330 = v6;
  }
}

uint64_t sub_1B1366398(uint64_t a1)
{
  if ((unint64_t)(a1 - 100000) >= 7)
    return 7;
  else
    return a1 - 100000;
}

void sub_1B13663B0(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1B13663D4()
{
  if (qword_1EEF27038 != -1)
    swift_once();
  return qword_1EEF2A2D8;
}

uint64_t sub_1B1366548(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD v18[2];

  v6 = sub_1B1371C50();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
LABEL_6:
    if (a3 == 7)
      goto LABEL_11;
    sub_1B13663B0(a3);
    if (!v15)
      goto LABEL_11;
    v10 = v14;
    v16 = HIBYTE(v15) & 0xF;
    if ((v15 & 0x2000000000000000) == 0)
      v16 = v14 & 0xFFFFFFFFFFFFLL;
    if (!v16)
    {
LABEL_11:
      if (qword_1ED387C40 != -1)
        swift_once();
      v10 = qword_1ED38B6A0;
    }
    swift_bridgeObjectRetain();
    return v10;
  }
  v18[0] = a1;
  v18[1] = a2;
  swift_bridgeObjectRetain();
  sub_1B1371C44();
  sub_1B13666A4();
  v10 = sub_1B1372FB8();
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  v13 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0)
    v13 = v10 & 0xFFFFFFFFFFFFLL;
  if (!v13)
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  return v10;
}

unint64_t sub_1B13666A4()
{
  unint64_t result;

  result = qword_1ED389568;
  if (!qword_1ED389568)
  {
    result = MEMORY[0x1B5E1AF70](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED389568);
  }
  return result;
}

void sub_1B13666E8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  uint64_t v9;
  id v10;

  if (!a2)
  {
    v8 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v8 = (void *)sub_1B1372B74();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v9 = sub_1B1372B08();
LABEL_6:
  v10 = (id)v9;
  (*(void (**)(uint64_t, void *, _QWORD))(a5 + 16))(a5, v8, a3 & 1);

}

uint64_t sub_1B1366784()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v1 = v0;
  v2 = OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock), sel_lock);
  v3 = v0 + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView__processDelegate;
  v4 = MEMORY[0x1B5E1B0F0](v0 + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView__processDelegate);
  swift_unknownObjectRelease();
  if (!v4)
  {
    sub_1B1372D90();
    sub_1B12CE6BC();
    v5 = (void *)sub_1B1372F70();
    sub_1B1372988();

  }
  v6 = MEMORY[0x1B5E1B0F0](v3);
  objc_msgSend(*(id *)(v1 + v2), sel_unlock);
  return v6;
}

uint64_t sub_1B13669A0(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  void *v4;
  void *v5;
  uint64_t result;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CGRect v21;
  CGRect v22;

  v5 = v4;
  objc_msgSend(v4, sel_frame);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  result = CGRectEqualToRect(v21, v22);
  if ((result & 1) == 0)
  {
    sub_1B1372D84();
    sub_1B12CE6BC();
    v11 = (void *)sub_1B1372F70();
    sub_1B12CF7F8(&qword_1ED3899B0);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_1B13757D0;
    v13 = objc_msgSend(v5, sel_description);
    v14 = sub_1B1372B98();
    v16 = v15;

    v17 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v12 + 56) = MEMORY[0x1E0DEA968];
    v18 = sub_1B12CE678();
    *(_QWORD *)(v12 + 64) = v18;
    *(_QWORD *)(v12 + 32) = v14;
    *(_QWORD *)(v12 + 40) = v16;
    objc_msgSend(v5, sel_frame);
    v19 = sub_1B1372E68();
    *(_QWORD *)(v12 + 96) = v17;
    *(_QWORD *)(v12 + 104) = v18;
    *(_QWORD *)(v12 + 72) = v19;
    *(_QWORD *)(v12 + 80) = v20;
    sub_1B1372988();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1B1366B50()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  objc_super v18;

  v1 = v0;
  v18.receiver = v0;
  v18.super_class = (Class)type metadata accessor for PromotedContentWebView();
  objc_msgSendSuper2(&v18, sel_didMoveToSuperview);
  sub_1B1372D84();
  sub_1B12CE6BC();
  v2 = (void *)sub_1B1372F70();
  sub_1B12CF7F8(&qword_1ED3899B0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1B13757D0;
  v4 = objc_msgSend(v1, sel_description);
  v5 = sub_1B1372B98();
  v7 = v6;

  v8 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v3 + 56) = MEMORY[0x1E0DEA968];
  v9 = sub_1B12CE678();
  *(_QWORD *)(v3 + 64) = v9;
  *(_QWORD *)(v3 + 32) = v5;
  *(_QWORD *)(v3 + 40) = v7;
  v10 = objc_msgSend(v1, sel_superview);
  if (!v10)
  {
    v16 = (uint64_t *)(v3 + 72);
    *(_QWORD *)(v3 + 96) = v8;
    *(_QWORD *)(v3 + 104) = v9;
    goto LABEL_5;
  }
  v11 = v10;
  v12 = objc_msgSend(v10, sel_debugDescription);

  v13 = sub_1B1372B98();
  v15 = v14;

  v16 = (uint64_t *)(v3 + 72);
  *(_QWORD *)(v3 + 96) = v8;
  *(_QWORD *)(v3 + 104) = v9;
  if (!v15)
  {
LABEL_5:
    *v16 = 1701736270;
    v15 = 0xE400000000000000;
    goto LABEL_6;
  }
  *v16 = v13;
LABEL_6:
  *(_QWORD *)(v3 + 80) = v15;
  sub_1B1372988();

  return swift_bridgeObjectRelease();
}

id sub_1B1366D4C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, double a5, double a6, double a7, double a8)
{
  _BYTE *v8;
  _OWORD *v17;
  uint64_t v18;
  id v19;
  char *v20;
  char *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  objc_super v32;

  *(_QWORD *)&v8[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView__processDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v8[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_webProcessProxy] = 0;
  v17 = &v8[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_remoteObjectInterface];
  *v17 = 0u;
  v17[1] = 0u;
  v8[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_browserContextControllerDidLoad] = 0;
  v18 = OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock;
  v19 = objc_allocWithZone(MEMORY[0x1E0CF1968]);
  v20 = v8;
  *(_QWORD *)&v8[v18] = objc_msgSend(v19, sel_initWithOptions_, 1);
  v21 = &v20[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_adIdentifier];
  *(_QWORD *)v21 = a1;
  *((_QWORD *)v21 + 1) = a2;
  *(_QWORD *)&v20[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_maxRequestCount] = a3;

  v32.receiver = v20;
  v32.super_class = (Class)type metadata accessor for PromotedContentWebView();
  v22 = objc_msgSendSuper2(&v32, sel_initWithFrame_configuration_, a4, a5, a6, a7, a8);
  v23 = (void *)objc_opt_self();
  v24 = v22;
  v25 = objc_msgSend(v23, sel_clearColor);
  objc_msgSend(v24, sel_setBackgroundColor_, v25);

  v26 = v24;
  v27 = (void *)sub_1B1372B74();
  objc_msgSend(v26, sel_setAccessibilityIdentifier_, v27);

  objc_msgSend(v26, sel_setAccessibilityIgnoresInvertColors_, 1);
  v28 = objc_msgSend(v26, sel_scrollView);
  objc_msgSend(v28, sel_setScrollEnabled_, 0);

  v29 = objc_msgSend(v26, sel_scrollView);
  objc_msgSend(v29, sel_setContentInsetAdjustmentBehavior_, 2);

  v30 = v26;
  objc_msgSend(v30, sel_setAllowsLinkPreview_, 0);

  return v30;
}

id sub_1B1366FD4()
{
  void *v0;
  void *v1;
  void *v2;
  objc_super v4;

  v1 = v0;
  sub_1B1372D84();
  sub_1B12CE6BC();
  v2 = (void *)sub_1B1372F70();
  sub_1B1372988();

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for PromotedContentWebView();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_1B13671CC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  id v4;
  _BYTE v5[24];
  uint64_t v6;

  v1 = (uint64_t)v0 + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_remoteObjectInterface;
  swift_beginAccess();
  sub_1B13680D8(v1, (uint64_t)v5);
  v2 = v6;
  result = sub_1B1309A88((uint64_t)v5);
  if (!v2)
  {
    v4 = objc_msgSend(v0, sel_registerExportedObjectInterface_, v0);
    sub_1B1372FC4();
    swift_unknownObjectRelease();
    swift_beginAccess();
    sub_1B1368120((uint64_t)v5, v1);
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_1B1367288()
{
  void *v0;
  uint64_t v1;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v1 = (uint64_t)v0 + OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_remoteObjectInterface;
  swift_beginAccess();
  sub_1B13680D8(v1, (uint64_t)&v3);
  if (!*((_QWORD *)&v4 + 1))
    return sub_1B1309A88((uint64_t)&v3);
  sub_1B12C32CC(&v3, &v5);
  sub_1B12EE1E0(&v5, v6);
  objc_msgSend(v0, sel_unregisterExportedObject_interface_, v0, sub_1B1373228());
  swift_unknownObjectRelease();
  v3 = 0u;
  v4 = 0u;
  swift_beginAccess();
  sub_1B1368120((uint64_t)&v3, v1);
  swift_endAccess();
  return sub_1B12D4038((uint64_t)&v5);
}

uint64_t type metadata accessor for PromotedContentWebView()
{
  return objc_opt_self();
}

uint64_t sub_1B13673C4()
{
  char *v0;
  char *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t result;
  void *v6;
  void *v7;
  void *v8;

  v1 = v0;
  sub_1B1372D78();
  sub_1B12CE6BC();
  v2 = (void *)sub_1B1372F70();
  sub_1B1372988();

  v3 = objc_msgSend(v1, sel_remoteObjectProxyWithInterface);
  v4 = OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_webProcessProxy;
  *(_QWORD *)&v1[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_webProcessProxy] = v3;
  result = swift_unknownObjectRelease();
  v6 = *(void **)&v1[v4];
  if (v6)
  {
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    v7 = (void *)sub_1B1372B74();
    swift_bridgeObjectRelease();
    v8 = (void *)sub_1B1372D60();
    objc_msgSend(v6, sel_setWebViewProcessAdIdentifier_maxRequestCount_, v7, v8);

    result = swift_unknownObjectRelease();
  }
  v1[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_browserContextControllerDidLoad] = 1;
  return result;
}

uint64_t sub_1B1367558()
{
  char *v0;
  char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v1 = v0;
  sub_1B1372D78();
  sub_1B12CE6BC();
  v2 = (void *)sub_1B1372F70();
  sub_1B1372988();

  v3 = OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock], sel_lock);
  *(_QWORD *)&v1[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView__processDelegate + 8] = 0;
  swift_unknownObjectWeakAssign();
  objc_msgSend(*(id *)&v1[v3], sel_unlock);
  *(_QWORD *)&v1[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_webProcessProxy] = 0;
  swift_unknownObjectRelease();
  v4 = (uint64_t)&v1[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_remoteObjectInterface];
  swift_beginAccess();
  sub_1B13680D8(v4, (uint64_t)&v6);
  if (!v7)
    return sub_1B1309A88((uint64_t)&v6);
  sub_1B12C32CC(&v6, &v8);
  sub_1B12EE1E0(&v8, v9);
  objc_msgSend(v1, sel_unregisterExportedObject_interface_, v1, sub_1B1373228());
  swift_unknownObjectRelease();
  return sub_1B12D4038((uint64_t)&v8);
}

uint64_t sub_1B1367B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a4;
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (!a2)
  {
    v7 = 0;
    v9 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = sub_1B1372B98();
  v9 = v8;
  if (v4)
LABEL_3:
    v4 = sub_1B1372B20();
LABEL_4:
  swift_retain();
  v6(v7, v9, a3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1B1367D9C(void *a1, uint64_t a2, SEL *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a1;
  v4 = (void *)sub_1B1366784();
  if (v4)
  {
    v5 = v4;
    if ((objc_msgSend(v4, sel_respondsToSelector_, *a3) & 1) != 0)
      objc_msgSend(v5, *a3);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

void sub_1B1367F24(void *a1, float a2, uint64_t a3, SEL *a4)
{
  void *v6;
  void *v7;
  double v8;
  id v9;

  v9 = a1;
  v6 = (void *)sub_1B1366784();
  if (v6)
  {
    v7 = v6;
    if ((objc_msgSend(v6, sel_respondsToSelector_, *a4) & 1) != 0)
    {
      *(float *)&v8 = a2;
      objc_msgSend(v7, *a4, v8);
    }

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

void sub_1B1368008(void *a1, float a2, float a3, uint64_t a4, SEL *a5)
{
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v12 = a1;
  v8 = (void *)sub_1B1366784();
  if (v8)
  {
    v9 = v8;
    if ((objc_msgSend(v8, sel_respondsToSelector_, *a5) & 1) != 0)
    {
      *(float *)&v10 = a2;
      *(float *)&v11 = a3;
      objc_msgSend(v9, *a5, v10, v11);
    }

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

uint64_t sub_1B13680AC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1B13680D0(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;

  sub_1B13666E8(a1, a2, a3, a4, *(_QWORD *)(v4 + 16));
}

uint64_t sub_1B13680D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B12CF7F8(&qword_1ED389578);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B1368120(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1B12CF7F8(&qword_1ED389578);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1B1368168()
{
  _BYTE *v0;
  _OWORD *v1;
  uint64_t v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView__processDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_webProcessProxy] = 0;
  v1 = &v0[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_remoteObjectInterface];
  *v1 = 0u;
  v1[1] = 0u;
  v0[OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_browserContextControllerDidLoad] = 0;
  v2 = OBJC_IVAR____TtC17PromotedContentUI22PromotedContentWebView_unfairLock;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CF1968]), sel_initWithOptions_, 1);

  sub_1B1373174();
  __break(1u);
}

void sub_1B1368234(char *a1)
{
  sub_1B13003C4(*a1);
}

void sub_1B1368240()
{
  char *v0;

  sub_1B130064C(*v0);
}

void sub_1B1368248()
{
  __asm { BR              X10 }
}

uint64_t sub_1B1368284()
{
  sub_1B1372C04();
  return swift_bridgeObjectRelease();
}

void sub_1B1368300(uint64_t a1)
{
  char *v1;

  sub_1B130072C(a1, *v1);
}

uint64_t sub_1B1368308@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B1369438();
  *a1 = result;
  return result;
}

uint64_t sub_1B1368334()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1B1368364 + 4 * byte_1B1378C55[*v0]))();
}

void sub_1B1368364(_QWORD *a1@<X8>)
{
  *a1 = 0x6E65746E6F437061;
  a1[1] = 0xE900000000000074;
}

void sub_1B1368384(_QWORD *a1@<X8>)
{
  *a1 = 0x7472617473;
  a1[1] = 0xE500000000000000;
}

void sub_1B136839C(_QWORD *a1@<X8>)
{
  *a1 = 0x6F724665726F7473;
  a1[1] = 0xEA0000000000746ELL;
}

void sub_1B13683BC(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000010;
  a1[1] = 0x80000001B13794C0;
}

uint64_t sub_1B13683DC()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B136840C + 4 * byte_1B1378C5A[*v0]))(0x747865746E6F63, 0xE700000000000000);
}

uint64_t sub_1B136840C()
{
  return 0x6E65746E6F437061;
}

uint64_t sub_1B1368428()
{
  return 0x7472617473;
}

uint64_t sub_1B136843C()
{
  return 0x6F724665726F7473;
}

unint64_t sub_1B1368458()
{
  return 0xD000000000000010;
}

uint64_t sub_1B1368474@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1B1369438();
  *a1 = result;
  return result;
}

void sub_1B1368498(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_1B13684A4()
{
  sub_1B1369060();
  return sub_1B1373318();
}

uint64_t sub_1B13684CC()
{
  sub_1B1369060();
  return sub_1B1373324();
}

_QWORD *sub_1B13684F4(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  uint64_t v27;
  char *v28;
  _QWORD v29[2];
  id v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  objc_class *ObjectType;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  objc_super v43;
  uint64_t v44;

  ObjectType = (objc_class *)swift_getObjectType();
  v3 = sub_1B1371EB4();
  v35 = *(_QWORD *)(v3 - 8);
  v36 = v3;
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_1B12CF7F8(&qword_1ED386C18);
  v6 = *(_QWORD *)(v37 - 8);
  MEMORY[0x1E0C80A78](v37);
  v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B12EE1E0(a1, a1[3]);
  sub_1B1369060();
  v9 = v1;
  v10 = v39;
  sub_1B1373300();
  if (!v10)
  {
    v34 = v5;
    v12 = (uint64_t)a1;
    v39 = v6;
    LOBYTE(v44) = 0;
    a1 = (_QWORD *)sub_1B13690A4();
    v13 = v37;
    sub_1B13731F8();
    v33 = v8;
    v14 = v40;
    v15 = v41;
    v16 = sub_1B12CFA9C(0, &qword_1ED386C00);
    sub_1B12CFA9C(0, &qword_1ED386C08);
    v17 = (void *)sub_1B1372DA8();
    v18 = v39;
    v29[1] = v16;
    v31 = v15;
    v32 = v14;
    if (!v17)
    {
      sub_1B13690E8();
      swift_allocError();
      swift_willThrow();
      sub_1B12CE094(v32, v31);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v33, v13);
      v11 = v12;
      goto LABEL_4;
    }
    v30 = v17;
    LOBYTE(v44) = 1;
    v20 = v13;
    sub_1B13731EC();
    v21 = v41;
    if (v41 >> 60 == 15)
    {
      v22 = MEMORY[0x1E0DEE9D8];
LABEL_16:
      *(_QWORD *)&v9[OBJC_IVAR____TtC17PromotedContentUI15AppStoreSession_apContentData] = v22;
      objc_allocWithZone((Class)sub_1B1372898());
      v26 = v30;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v9[OBJC_IVAR____TtC17PromotedContentUI15AppStoreSession_context] = sub_1B1372820();
      LOBYTE(v40) = 2;
      sub_1B1369170(&qword_1ED386998, MEMORY[0x1E0CB08C0]);
      v27 = v36;
      v28 = v33;
      sub_1B13731F8();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v28, v20);
      sub_1B12CE094(v32, v31);

      (*(void (**)(char *, char *, uint64_t))(v35 + 32))(&v9[OBJC_IVAR____TtC17PromotedContentUI15AppStoreSession_start], v34, v27);
      v43.receiver = v9;
      v43.super_class = ObjectType;
      a1 = objc_msgSendSuper2(&v43, sel_init);
      sub_1B12D4038(v12);
      return a1;
    }
    v23 = v40;
    sub_1B12CF7F8(&qword_1ED387698);
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_1B13757D0;
    *(_QWORD *)(v24 + 32) = sub_1B12CFA9C(0, &qword_1ED387668);
    *(_QWORD *)(v24 + 40) = sub_1B12CFA9C(0, &qword_1ED3882A0);
    v29[0] = v21;
    sub_1B1372DB4();
    v25 = v29[0];
    swift_bridgeObjectRelease();
    if (v42)
    {
      sub_1B12CF7F8(&qword_1ED386BF8);
      if (swift_dynamicCast())
      {
        v22 = v44;
        sub_1B13530B8(v23, v25);
        goto LABEL_16;
      }
    }
    else
    {
      sub_1B1309A88((uint64_t)&v40);
    }
    sub_1B13530B8(v23, v25);
    v22 = MEMORY[0x1E0DEE9D8];
    goto LABEL_16;
  }
  v11 = (uint64_t)a1;
LABEL_4:
  sub_1B12D4038(v11);

  swift_deallocPartialClassInstance();
  return a1;
}

uint64_t sub_1B1368AA4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  char v37;
  id v38;
  unint64_t v39;
  uint64_t v40;

  v3 = v1;
  v40 = *MEMORY[0x1E0C80C00];
  v5 = sub_1B12CF7F8(&qword_1ED386C20);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B12EE1E0(a1, a1[3]);
  sub_1B1369060();
  sub_1B137330C();
  v36 = v3;
  sub_1B1372898();
  if (swift_dynamicCastClass())
    v9 = (void *)sub_1B1372880();
  else
    v9 = 0;
  v10 = (void *)objc_opt_self();
  v38 = v9;
  sub_1B12CF7F8(&qword_1ED386C10);
  v11 = sub_1B1372F88();
  v38 = 0;
  v12 = objc_msgSend(v10, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v11, 1, &v38);
  swift_unknownObjectRelease();
  v13 = v38;
  if (v12)
  {
    v35 = v9;
    v14 = (void *)sub_1B1371DE8();
    v16 = v15;

    v38 = v14;
    v39 = v16;
    v37 = 0;
    sub_1B136912C();
    sub_1B1373204();
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

      v17 = (uint64_t)v14;
      v18 = v16;
      return sub_1B12CE094(v17, v18);
    }
    v32 = (uint64_t)v14;
    v33 = v16;
    v34 = v6;
    sub_1B12CFA9C(0, &qword_1ED3882A0);
    v21 = (void *)sub_1B1372C7C();
    v38 = 0;
    v22 = objc_msgSend(v10, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v21, 1, &v38);

    v23 = v38;
    if (v22)
    {
      v24 = (void *)sub_1B1371DE8();
      v26 = v25;

      v38 = v24;
      v39 = v26;
      v31 = v26;
      v37 = 1;
      sub_1B1373204();
      v28 = v33;
      v27 = v34;
      v29 = v35;
      LOBYTE(v38) = 2;
      sub_1B1371EB4();
      sub_1B1369170(&qword_1ED386990, MEMORY[0x1E0CB0890]);
      sub_1B1373204();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v8, v5);

      sub_1B12CE094((uint64_t)v24, v31);
      v17 = v32;
      v18 = v28;
      return sub_1B12CE094(v17, v18);
    }
    v30 = v23;
    sub_1B1371D4C();

    swift_willThrow();
    sub_1B12CE094(v32, v33);
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v8, v5);
  }
  else
  {
    v20 = v13;
    sub_1B1371D4C();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_1B1368F2C()
{
  return type metadata accessor for AppStoreSession();
}

uint64_t type metadata accessor for AppStoreSession()
{
  uint64_t result;

  result = qword_1ED386678;
  if (!qword_1ED386678)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1B1368F70()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B1371EB4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

_QWORD *sub_1B1368FF4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  objc_class *v2;
  uint64_t v3;
  id v6;
  _QWORD *result;

  v6 = objc_allocWithZone(v2);
  result = sub_1B13684F4(a1);
  if (!v3)
    *a2 = result;
  return result;
}

uint64_t sub_1B1369040(_QWORD *a1)
{
  return sub_1B1368AA4(a1);
}

unint64_t sub_1B1369060()
{
  unint64_t result;

  result = qword_1ED3869B0;
  if (!qword_1ED3869B0)
  {
    result = MEMORY[0x1B5E1AF70](&unk_1B1378EB8, &type metadata for AppStoreSession.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED3869B0);
  }
  return result;
}

unint64_t sub_1B13690A4()
{
  unint64_t result;

  result = qword_1ED386988;
  if (!qword_1ED386988)
  {
    result = MEMORY[0x1B5E1AF70](MEMORY[0x1E0CB0378], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1ED386988);
  }
  return result;
}

unint64_t sub_1B13690E8()
{
  unint64_t result;

  result = qword_1EEF28A00;
  if (!qword_1EEF28A00)
  {
    result = MEMORY[0x1B5E1AF70](&unk_1B1378E78, &type metadata for AppStoreSession.SessionError);
    atomic_store(result, (unint64_t *)&qword_1EEF28A00);
  }
  return result;
}

unint64_t sub_1B136912C()
{
  unint64_t result;

  result = qword_1ED386980;
  if (!qword_1ED386980)
  {
    result = MEMORY[0x1B5E1AF70](MEMORY[0x1E0CB0350], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1ED386980);
  }
  return result;
}

uint64_t sub_1B1369170(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1B1371EB4();
    result = MEMORY[0x1B5E1AF70](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for AppStoreSession.SessionError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1B13691F0 + 4 * byte_1B1378C5F[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1B1369210 + 4 * byte_1B1378C64[v4]))();
}

_BYTE *sub_1B13691F0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1B1369210(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B1369218(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B1369220(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B1369228(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B1369230(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AppStoreSession.SessionError()
{
  return &type metadata for AppStoreSession.SessionError;
}

uint64_t storeEnumTagSinglePayload for AppStoreSession.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B1369298 + 4 * byte_1B1378C6E[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1B13692CC + 4 * byte_1B1378C69[v4]))();
}

uint64_t sub_1B13692CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B13692D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B13692DCLL);
  return result;
}

uint64_t sub_1B13692E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B13692F0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1B13692F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B13692FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppStoreSession.CodingKeys()
{
  return &type metadata for AppStoreSession.CodingKeys;
}

unint64_t sub_1B136931C()
{
  unint64_t result;

  result = qword_1EEF28A08;
  if (!qword_1EEF28A08)
  {
    result = MEMORY[0x1B5E1AF70](&unk_1B1378DE8, &type metadata for AppStoreSession.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEF28A08);
  }
  return result;
}

unint64_t sub_1B1369364()
{
  unint64_t result;

  result = qword_1EEF28A10;
  if (!qword_1EEF28A10)
  {
    result = MEMORY[0x1B5E1AF70](&unk_1B1378E50, &type metadata for AppStoreSession.SessionError);
    atomic_store(result, (unint64_t *)&qword_1EEF28A10);
  }
  return result;
}

unint64_t sub_1B13693AC()
{
  unint64_t result;

  result = qword_1ED3869C0;
  if (!qword_1ED3869C0)
  {
    result = MEMORY[0x1B5E1AF70](&unk_1B1378D20, &type metadata for AppStoreSession.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED3869C0);
  }
  return result;
}

unint64_t sub_1B13693F4()
{
  unint64_t result;

  result = qword_1ED3869B8;
  if (!qword_1ED3869B8)
  {
    result = MEMORY[0x1B5E1AF70](&unk_1B1378D48, &type metadata for AppStoreSession.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED3869B8);
  }
  return result;
}

uint64_t sub_1B1369438()
{
  unint64_t v0;

  v0 = sub_1B13731E0();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_1B1369480(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 40) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B13694DC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 48) = v3;
  *(_QWORD *)(v4 + 56) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B1369538(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 64) = v3;
  *(_QWORD *)(v4 + 72) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B1369594(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 80) = v3;
  *(_QWORD *)(v4 + 88) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B13695F0()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    return sub_1B1372700() & 1;
  else
    return 0;
}

uint64_t sub_1B1369620()
{
  return sub_1B1369638(MEMORY[0x1E0D82230]);
}

uint64_t sub_1B136962C()
{
  return sub_1B1369638(MEMORY[0x1E0D82220]);
}

uint64_t sub_1B1369638(uint64_t (*a1)(void))
{
  uint64_t v1;

  if (*(_QWORD *)(v1 + 24))
    return a1();
  else
    return 0;
}

uint64_t sub_1B1369668()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    return sub_1B137270C();
  else
    return 0;
}

uint64_t sub_1B1369698(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 96) = v3;
  *(_QWORD *)(v4 + 104) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B13696F4()
{
  sub_1B13730E4();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B1372C34();
  swift_bridgeObjectRelease();
  sub_1B1372C34();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B1372C34();
  swift_bridgeObjectRelease();
  return 0x203A64496D616441;
}

uint64_t sub_1B13697EC(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = swift_beginAccess();
  *(_BYTE *)(v1 + 112) = v2;
  return result;
}

uint64_t (*sub_1B1369828())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1B1369864(void *a1)
{
  objc_msgSend(objc_msgSend(a1, sel_metricsHelper), sel_userReturnedFromInteractionWithIsVoiceOverEnabled_ignoreVisibilityState_, UIAccessibilityIsVoiceOverRunning(), 1);
  return swift_unknownObjectRelease();
}

uint64_t AppStoreAd.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t AppStoreAd.__deallocating_deinit()
{
  AppStoreAd.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1B1369930()
{
  return sub_1B13696F4();
}

unint64_t sub_1B1369950()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEF28A18;
  if (!qword_1EEF28A18)
  {
    v1 = sub_1B12D3FF4(&qword_1EEF28380);
    result = MEMORY[0x1B5E1AF70](MEMORY[0x1E0CB1828], v1);
    atomic_store(result, &qword_1EEF28A18);
  }
  return result;
}

uint64_t sub_1B136999C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 40);
  *a2 = *(_QWORD *)(v3 + 32);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B13699E8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 56);
  *a2 = *(_QWORD *)(v3 + 48);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B1369A34@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 72);
  *a2 = *(_QWORD *)(v3 + 64);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B1369A80@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 88);
  *a2 = *(_QWORD *)(v3 + 80);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B1369ACC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 104);
  *a2 = *(_QWORD *)(v3 + 96);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B1369B18@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 112);
  return result;
}

uint64_t sub_1B1369B5C(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 112) = v2;
  return result;
}

uint64_t method lookup function for AppStoreAd()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppStoreAd.odmlSuccess.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of AppStoreAd.experimentId.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of AppStoreAd.treatmentId.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of AppStoreAd.deploymentId.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of AppStoreAd.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of AppStoreAd.unfilledReason.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of AppStoreAd.unfilledReason.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of AppStoreAd.slot.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t sub_1B1369C24()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_1B1369C48()
{
  uint64_t v0;
  unint64_t result;

  type metadata accessor for ImageDownloader();
  v0 = swift_allocObject();
  swift_defaultActor_initialize();
  result = sub_1B131A620(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)(v0 + 112) = result;
  qword_1ED38B678 = v0;
  return result;
}

uint64_t sub_1B1369C90(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[16] = a1;
  v2[17] = v1;
  v3 = sub_1B1371DC4();
  v2[18] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[19] = v4;
  v2[20] = *(_QWORD *)(v4 + 64);
  v2[21] = swift_task_alloc();
  sub_1B12CF7F8(&qword_1ED3896D8);
  v2[22] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1B1369D18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  char isUniquelyReferenced_nonNull_native;
  void (*v24)(uint64_t, uint64_t);
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = *(_QWORD *)(v0 + 136) + 112;
  swift_beginAccess();
  v2 = *(_QWORD *)v1;
  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    goto LABEL_6;
  v3 = *(_QWORD *)(v0 + 128);
  swift_bridgeObjectRetain();
  v4 = sub_1B131BAF4(v3);
  if ((v5 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    v11 = *(_QWORD *)(v0 + 168);
    v10 = *(_QWORD *)(v0 + 176);
    v12 = *(_QWORD *)(v0 + 152);
    v14 = *(_QWORD *)(v0 + 136);
    v13 = *(_QWORD *)(v0 + 144);
    v15 = *(_QWORD *)(v0 + 128);
    v27 = v15;
    v28 = v10;
    v16 = sub_1B1372D00();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v10, 1, 1, v16);
    v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
    *(_QWORD *)(v0 + 208) = v17;
    v17(v11, v15, v13);
    v19 = sub_1B136D414(&qword_1ED387BA8, v18, (uint64_t (*)(uint64_t))type metadata accessor for ImageDownloader, (uint64_t)&unk_1B1379020);
    v20 = (*(unsigned __int8 *)(v12 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    v21 = (char *)swift_allocObject();
    *((_QWORD *)v21 + 2) = v14;
    *((_QWORD *)v21 + 3) = v19;
    *((_QWORD *)v21 + 4) = v14;
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(&v21[v20], v11, v13);
    swift_retain_n();
    v22 = sub_1B136A46C(v28, (uint64_t)&unk_1EEF28A48, (uint64_t)v21);
    *(_QWORD *)(v0 + 216) = v22;
    v17(v11, v27, v13);
    swift_beginAccess();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v29 = *(_QWORD *)v1;
    *(_QWORD *)v1 = 0x8000000000000000;
    sub_1B136C970(v22, 0, v11, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)v1 = v29;
    swift_bridgeObjectRelease();
    v24 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    *(_QWORD *)(v0 + 224) = v24;
    v24(v11, v13);
    swift_endAccess();
    v25 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 232) = v25;
    sub_1B136CAEC();
    sub_1B12CF7F8(&qword_1ED388F10);
    *v25 = v0;
    v25[1] = sub_1B136A108;
    return sub_1B1372D0C();
  }
  v6 = *(_QWORD *)(v2 + 56) + 16 * v4;
  v7 = *(void **)v6;
  *(_QWORD *)(v0 + 184) = *(_QWORD *)v6;
  v8 = *(_BYTE *)(v6 + 8);
  sub_1B136AA50(v7, v8);
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void *))(v0 + 8))(v7);
  }
  swift_retain();
  v26 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 192) = v26;
  sub_1B136CAEC();
  sub_1B12CF7F8(&qword_1ED388F10);
  *v26 = v0;
  v26[1] = sub_1B136A044;
  return sub_1B1372D0C();
}

uint64_t sub_1B136A044()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B136A0A8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 184);
  sub_1B136AA6C(v1, 0);
  sub_1B136AA6C(v1, 0);
  v2 = *(_QWORD *)(v0 + 120);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_1B136A108()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 240) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1B136A16C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 224);
  v2 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 144);
  v5 = *(void **)(v0 + 112);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 208))(v2, *(_QWORD *)(v0 + 128), v3);
  swift_beginAccess();
  v6 = v5;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *(_QWORD *)(v4 + 112);
  *(_QWORD *)(v4 + 112) = 0x8000000000000000;
  sub_1B136C970((uint64_t)v5, 1, v2, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v4 + 112) = v9;
  swift_bridgeObjectRelease();
  v1(v2, v3);
  swift_endAccess();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v6);
}

uint64_t sub_1B136A270()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 184);
  sub_1B136AA6C(v1, 0);
  sub_1B136AA6C(v1, 0);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B136A2C8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  unsigned __int8 v3;
  unsigned __int8 v4;

  v1 = *(_QWORD *)(v0 + 128);
  swift_beginAccess();
  v2 = (void *)sub_1B136E9F4(v1);
  v4 = v3;
  swift_endAccess();
  sub_1B136CB28(v2, v4);
  swift_willThrow();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B136A370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v8;

  v5[2] = a1;
  v5[3] = a4;
  v8 = (_QWORD *)swift_task_alloc();
  v5[4] = v8;
  *v8 = v5;
  v8[1] = sub_1B136A3D8;
  v8[5] = a5;
  v8[6] = a4;
  return swift_task_switch();
}

uint64_t sub_1B136A3D8(uint64_t a1)
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
  *(_QWORD *)(v4 + 40) = a1;
  return swift_task_switch();
}

uint64_t sub_1B136A454()
{
  uint64_t v0;

  **(_QWORD **)(v0 + 16) = *(_QWORD *)(v0 + 40);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B136A46C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_1B1372D00();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1B1372CF4();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1B136D390(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1B1372CD0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  sub_1B136CAEC();
  return swift_task_create();
}

uint64_t sub_1B136A594(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = v1;
  return swift_task_switch();
}

uint64_t sub_1B136A5AC()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 56) = objc_msgSend((id)objc_opt_self(), sel_sharedSession);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_1B136A628;
  return sub_1B1372D6C();
}

uint64_t sub_1B136A628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  v5 = *v4;
  *(_QWORD *)(v5 + 72) = a1;
  *(_QWORD *)(v5 + 80) = a2;
  *(_QWORD *)(v5 + 88) = a3;
  *(_QWORD *)(v5 + 96) = v3;
  swift_task_dealloc();
  if (!v3)

  return swift_task_switch();
}

uint64_t sub_1B136A6A4()
{
  uint64_t v0;
  void *v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  objc_opt_self();
  v1 = (void *)swift_dynamicCastObjCClass();
  if (v1)
    v2 = *(id *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  v5 = objc_allocWithZone(MEMORY[0x1E0DC3870]);
  sub_1B13531A4(v4, v3);
  v6 = (void *)sub_1B1371DD0();
  v7 = objc_msgSend(v5, sel_initWithData_, v6);
  sub_1B12CE094(v4, v3);

  if (v7)
  {
    v8 = *(_QWORD *)(v0 + 80);
    v9 = *(_QWORD *)(v0 + 72);

    sub_1B12CE094(v9, v8);
    return (*(uint64_t (**)(id))(v0 + 8))(v7);
  }
  else
  {
    if (qword_1ED389888 != -1)
      swift_once();
    v11 = sub_1B1372A48();
    sub_1B12E5A5C(v11, (uint64_t)qword_1ED38B7B0);
    v12 = v1;
    v13 = sub_1B1372A30();
    v14 = sub_1B1372D84();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v23 = v16;
      *(_DWORD *)v15 = 136315138;
      if (v1)
        v17 = objc_msgSend(v12, sel_statusCode, v23);
      else
        v17 = 0;
      *(_QWORD *)(v0 + 16) = v17;
      *(_BYTE *)(v0 + 24) = v1 == 0;
      sub_1B12CF7F8(&qword_1EEF28A38);
      v18 = sub_1B1372BD4();
      *(_QWORD *)(v0 + 32) = sub_1B12D5A94(v18, v19, &v23);
      sub_1B1372FA0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1B12B8000, v13, v14, "Got %s HTTP Response Code, throwing error", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1B5E1B030](v16, -1, -1);
      MEMORY[0x1B5E1B030](v15, -1, -1);

    }
    else
    {

    }
    v20 = *(_QWORD *)(v0 + 80);
    v21 = *(void **)(v0 + 88);
    v22 = *(_QWORD *)(v0 + 72);
    sub_1B136ABD4();
    swift_allocError();
    swift_willThrow();

    sub_1B12CE094(v22, v20);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1B136A994()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1B136A9C8()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for ImageDownloader()
{
  return objc_opt_self();
}

uint64_t initializeBufferWithCopyOfBuffer for ImageDownloader.CacheEntry(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_1B136AA50(*(id *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

id sub_1B136AA50(id a1, char a2)
{
  if ((a2 & 1) != 0)
    return a1;
  else
    return (id)swift_retain();
}

void destroy for ImageDownloader.CacheEntry(uint64_t a1)
{
  sub_1B136AA6C(*(id *)a1, *(_BYTE *)(a1 + 8));
}

void sub_1B136AA6C(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_release();
}

uint64_t assignWithCopy for ImageDownloader.CacheEntry(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;
  void *v5;
  char v6;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_1B136AA50(*(id *)a2, v4);
  v5 = *(void **)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_1B136AA6C(v5, v6);
  return a1;
}

uint64_t initializeWithTake for ImageDownloader.CacheEntry(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for ImageDownloader.CacheEntry(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  char v4;
  void *v5;
  char v6;

  v3 = *a2;
  v4 = *((_BYTE *)a2 + 8);
  v5 = *(void **)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_1B136AA6C(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ImageDownloader.CacheEntry(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ImageDownloader.CacheEntry(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_1B136ABA4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_1B136ABAC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ImageDownloader.CacheEntry()
{
  return &type metadata for ImageDownloader.CacheEntry;
}

uint64_t sub_1B136ABC8()
{
  uint64_t v0;

  return v0;
}

unint64_t sub_1B136ABD4()
{
  unint64_t result;

  result = qword_1EEF28A30;
  if (!qword_1EEF28A30)
  {
    result = MEMORY[0x1B5E1AF70](&unk_1B13790D0, &type metadata for ImageDownloader.ImageDownloaderError);
    atomic_store(result, (unint64_t *)&qword_1EEF28A30);
  }
  return result;
}

uint64_t sub_1B136AC18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1B1371DC4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1B136AC94(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_1B1371DC4() - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_1B12F4D60;
  return sub_1B136A370(a1, v5, v6, v7, v8);
}

uint64_t sub_1B136AD28(uint64_t a1, char a2)
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
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  sub_1B12CF7F8(&qword_1EEF28128);
  v6 = sub_1B13731B0();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
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
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
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
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_1B12C32CC(v24, v35);
      }
      else
      {
        sub_1B12D4058((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1B13732C4();
      sub_1B1372C04();
      result = sub_1B13732E8();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
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
            goto LABEL_40;
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
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_1B12C32CC(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1B136B024(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  _QWORD *v33;
  char v34;

  v3 = v2;
  v5 = *v2;
  sub_1B12CF7F8(&qword_1ED388E70);
  v34 = a2;
  result = sub_1B13731B0();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v33 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v32 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v32)
          goto LABEL_33;
        v21 = v33[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v32)
            goto LABEL_33;
          v21 = v33[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v32)
            {
LABEL_33:
              if ((v34 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v31 = 1 << *(_BYTE *)(v5 + 32);
              if (v31 >= 64)
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v33 = -1 << v31;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v33[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v32)
                  goto LABEL_33;
                v21 = v33[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v19);
      v28 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * v19);
      v29 = *v28;
      v30 = v28[1];
      if ((v34 & 1) == 0)
        swift_bridgeObjectRetain();
      sub_1B13732C4();
      sub_1B13732D0();
      result = sub_1B13732E8();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v15 == v24;
          if (v15 == v24)
            v15 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v16) = v27;
      v17 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 16 * v16);
      *v17 = v29;
      v17[1] = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_1B136B308(uint64_t a1, int a2)
{
  return sub_1B136BA6C(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for VisibilityTiming, &qword_1ED387F50);
}

uint64_t sub_1B136B31C(uint64_t a1, char a2)
{
  return sub_1B136BE04(a1, a2, &qword_1ED388E78);
}

uint64_t sub_1B136B328(uint64_t a1, int a2)
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
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
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
  uint64_t i;
  int v42;

  v3 = v2;
  v5 = sub_1B1371F80();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  sub_1B12CF7F8(&qword_1ED3876D8);
  v42 = a2;
  v10 = sub_1B13731B0();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
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
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = v40[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v39)
              goto LABEL_34;
            v24 = v40[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v28 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    sub_1B136D414(&qword_1ED3877E8, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1658], MEMORY[0x1E0CB1668]);
    result = sub_1B1372B38();
    v29 = -1 << *(_BYTE *)(v11 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v31);
      }
      while (v35 == -1);
      v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v28;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v9 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_1B136B6C0(uint64_t a1, int a2)
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
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  int64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t i;
  int v48;

  v3 = v2;
  v5 = sub_1B1371DC4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  sub_1B12CF7F8(&qword_1ED387C10);
  v48 = a2;
  v10 = sub_1B13731B0();
  v11 = v10;
  if (*(_QWORD *)(v9 + 16))
  {
    v43 = v2;
    v12 = 1 << *(_BYTE *)(v9 + 32);
    v13 = *(_QWORD *)(v9 + 64);
    v45 = (_QWORD *)(v9 + 64);
    if (v12 < 64)
      v14 = ~(-1 << v12);
    else
      v14 = -1;
    v15 = v14 & v13;
    v44 = (unint64_t)(v12 + 63) >> 6;
    v16 = v10 + 64;
    result = swift_retain();
    v18 = 0;
    v46 = v6;
    for (i = v9; ; v9 = i)
    {
      if (v15)
      {
        v22 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        v23 = v22 | (v18 << 6);
      }
      else
      {
        v24 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v24 >= v44)
          goto LABEL_34;
        v25 = v45[v24];
        ++v18;
        if (!v25)
        {
          v18 = v24 + 1;
          if (v24 + 1 >= v44)
            goto LABEL_34;
          v25 = v45[v18];
          if (!v25)
          {
            v26 = v24 + 2;
            if (v26 >= v44)
            {
LABEL_34:
              swift_release();
              v3 = v43;
              if ((v48 & 1) != 0)
              {
                v42 = 1 << *(_BYTE *)(v9 + 32);
                if (v42 >= 64)
                  bzero(v45, ((unint64_t)(v42 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v45 = -1 << v42;
                *(_QWORD *)(v9 + 16) = 0;
              }
              break;
            }
            v25 = v45[v26];
            if (!v25)
            {
              while (1)
              {
                v18 = v26 + 1;
                if (__OFADD__(v26, 1))
                  goto LABEL_41;
                if (v18 >= v44)
                  goto LABEL_34;
                v25 = v45[v18];
                ++v26;
                if (v25)
                  goto LABEL_21;
              }
            }
            v18 = v26;
          }
        }
LABEL_21:
        v15 = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v18 << 6);
      }
      v27 = v6;
      v28 = *(_QWORD *)(v6 + 72);
      v29 = *(_QWORD *)(v9 + 48) + v28 * v23;
      v30 = 16 * v23;
      if ((v48 & 1) != 0)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v27 + 32))(v8, v29, v5);
        v31 = *(_QWORD *)(v9 + 56) + v30;
        v32 = *(id *)v31;
        v33 = *(_BYTE *)(v31 + 8);
      }
      else
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v27 + 16))(v8, v29, v5);
        v34 = *(_QWORD *)(v9 + 56) + v30;
        v32 = *(id *)v34;
        v33 = *(_BYTE *)(v34 + 8);
        sub_1B136AA50(*(id *)v34, v33);
      }
      sub_1B136D414(&qword_1ED387B30, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0018]);
      result = sub_1B1372B38();
      v35 = -1 << *(_BYTE *)(v11 + 32);
      v36 = result & ~v35;
      v37 = v36 >> 6;
      if (((-1 << v36) & ~*(_QWORD *)(v16 + 8 * (v36 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v36) & ~*(_QWORD *)(v16 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v38 = 0;
        v39 = (unint64_t)(63 - v35) >> 6;
        do
        {
          if (++v37 == v39 && (v38 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v40 = v37 == v39;
          if (v37 == v39)
            v37 = 0;
          v38 |= v40;
          v41 = *(_QWORD *)(v16 + 8 * v37);
        }
        while (v41 == -1);
        v19 = __clz(__rbit64(~v41)) + (v37 << 6);
      }
      *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      v20 = *(_QWORD *)(v11 + 48) + v19 * v28;
      v6 = v46;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v46 + 32))(v20, v8, v5);
      v21 = *(_QWORD *)(v11 + 56) + 16 * v19;
      *(_QWORD *)v21 = v32;
      *(_BYTE *)(v21 + 8) = v33;
      ++*(_QWORD *)(v11 + 16);
    }
  }
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_1B136BA6C(uint64_t a1, int a2, uint64_t (*a3)(_QWORD), uint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  int64_t v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  int64_t v44;
  _QWORD *v45;
  uint64_t v46;
  int v47;
  uint64_t (*v48)(_QWORD);

  v6 = v4;
  v48 = a3;
  v8 = a3(0);
  v46 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v42 - v9;
  v11 = *v4;
  sub_1B12CF7F8(a4);
  v47 = a2;
  v12 = sub_1B13731B0();
  v13 = v12;
  if (!*(_QWORD *)(v11 + 16))
    goto LABEL_41;
  v14 = 1 << *(_BYTE *)(v11 + 32);
  v15 = *(_QWORD *)(v11 + 64);
  v45 = (_QWORD *)(v11 + 64);
  if (v14 < 64)
    v16 = ~(-1 << v14);
  else
    v16 = -1;
  v17 = v16 & v15;
  v43 = v4;
  v44 = (unint64_t)(v14 + 63) >> 6;
  v18 = v12 + 64;
  result = swift_retain();
  v20 = 0;
  while (1)
  {
    if (v17)
    {
      v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v24 = v23 | (v20 << 6);
      goto LABEL_22;
    }
    v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v44)
      break;
    v26 = v45;
    v27 = v45[v25];
    ++v20;
    if (!v27)
    {
      v20 = v25 + 1;
      if (v25 + 1 >= v44)
        goto LABEL_34;
      v27 = v45[v20];
      if (!v27)
      {
        v28 = v25 + 2;
        if (v28 >= v44)
        {
LABEL_34:
          swift_release();
          v6 = v43;
          if ((v47 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v27 = v45[v28];
        if (!v27)
        {
          while (1)
          {
            v20 = v28 + 1;
            if (__OFADD__(v28, 1))
              goto LABEL_43;
            if (v20 >= v44)
              goto LABEL_34;
            v27 = v45[v20];
            ++v28;
            if (v27)
              goto LABEL_21;
          }
        }
        v20 = v28;
      }
    }
LABEL_21:
    v17 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v20 << 6);
LABEL_22:
    v29 = (uint64_t *)(*(_QWORD *)(v11 + 48) + 16 * v24);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(v46 + 72);
    v33 = *(_QWORD *)(v11 + 56) + v32 * v24;
    if ((v47 & 1) != 0)
    {
      sub_1B12D3DB8(v33, (uint64_t)v10, v48);
    }
    else
    {
      sub_1B1332FDC(v33, (uint64_t)v10, v48);
      swift_bridgeObjectRetain();
    }
    sub_1B13732C4();
    sub_1B1372C04();
    result = sub_1B13732E8();
    v34 = -1 << *(_BYTE *)(v13 + 32);
    v35 = result & ~v34;
    v36 = v35 >> 6;
    if (((-1 << v35) & ~*(_QWORD *)(v18 + 8 * (v35 >> 6))) != 0)
    {
      v21 = __clz(__rbit64((-1 << v35) & ~*(_QWORD *)(v18 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v37 = 0;
      v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v39 = v36 == v38;
        if (v36 == v38)
          v36 = 0;
        v37 |= v39;
        v40 = *(_QWORD *)(v18 + 8 * v36);
      }
      while (v40 == -1);
      v21 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(_QWORD *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    v22 = (_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v21);
    *v22 = v31;
    v22[1] = v30;
    result = sub_1B12D3DB8((uint64_t)v10, *(_QWORD *)(v13 + 56) + v32 * v21, v48);
    ++*(_QWORD *)(v13 + 16);
  }
  swift_release();
  v6 = v43;
  v26 = v45;
  if ((v47 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v41 = 1 << *(_BYTE *)(v11 + 32);
  if (v41 >= 64)
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v41;
  *(_QWORD *)(v11 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v6 = v13;
  return result;
}

uint64_t sub_1B136BDE0(uint64_t a1, char a2)
{
  return sub_1B12CC890(a1, a2, (uint64_t *)&unk_1ED387F70);
}

uint64_t sub_1B136BDEC(uint64_t a1, char a2)
{
  return sub_1B12CC890(a1, a2, (uint64_t *)&unk_1ED387F60);
}

uint64_t sub_1B136BDF8(uint64_t a1, char a2)
{
  return sub_1B12CC890(a1, a2, &qword_1ED389998);
}

uint64_t sub_1B136BE04(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;

  v4 = v3;
  v6 = *v3;
  sub_1B12CF7F8(a3);
  result = sub_1B13731B0();
  v8 = result;
  if (*(_QWORD *)(v6 + 16))
  {
    v9 = 0;
    v10 = (uint64_t *)(v6 + 64);
    v11 = 1 << *(_BYTE *)(v6 + 32);
    v32 = -1 << v11;
    v33 = v11;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v13 = v12 & *(_QWORD *)(v6 + 64);
    v34 = (unint64_t)(v11 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v13)
      {
        v20 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v21 = v20 | (v9 << 6);
      }
      else
      {
        v22 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v22 >= v34)
          goto LABEL_33;
        v23 = v10[v22];
        ++v9;
        if (!v23)
        {
          v9 = v22 + 1;
          if (v22 + 1 >= v34)
            goto LABEL_33;
          v23 = v10[v9];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v34)
            {
LABEL_33:
              if ((a2 & 1) != 0)
              {
                if (v33 >= 64)
                  bzero((void *)(v6 + 64), 8 * v34);
                else
                  *v10 = v32;
                *(_QWORD *)(v6 + 16) = 0;
              }
              break;
            }
            v23 = v10[v24];
            if (!v23)
            {
              while (1)
              {
                v9 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_41;
                if (v9 >= v34)
                  goto LABEL_33;
                v23 = v10[v9];
                ++v24;
                if (v23)
                  goto LABEL_30;
              }
            }
            v9 = v24;
          }
        }
LABEL_30:
        v13 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v9 << 6);
      }
      v29 = 8 * v21;
      v30 = *(_QWORD *)(*(_QWORD *)(v6 + 48) + v29);
      v31 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + v29);
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain();
      result = sub_1B13732B8();
      v15 = -1 << *(_BYTE *)(v8 + 32);
      v16 = result & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v14 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v27 = v17 == v26;
          if (v17 == v26)
            v17 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v14 + 8 * v17);
        }
        while (v28 == -1);
        v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }
      *(_QWORD *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v19 = 8 * v18;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + v19) = v30;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + v19) = v31;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_1B136C0B4(uint64_t a1, char a2)
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
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  sub_1B12CF7F8(&qword_1ED3882D0);
  v42 = a2;
  v6 = sub_1B13731B0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1B13732C4();
    sub_1B1372C04();
    result = sub_1B13732E8();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1B136C3D8(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  char v34;

  v4 = v3;
  v6 = *v3;
  sub_1B12CF7F8(a3);
  result = sub_1B13731B0();
  v8 = result;
  if (*(_QWORD *)(v6 + 16))
  {
    v34 = a2;
    v33 = v4;
    v9 = 0;
    v10 = (uint64_t *)(v6 + 64);
    v11 = 1 << *(_BYTE *)(v6 + 32);
    v31 = -1 << v11;
    v32 = v11;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v13 = v12 & *(_QWORD *)(v6 + 64);
    v14 = (unint64_t)(v11 + 63) >> 6;
    v15 = result + 64;
    while (1)
    {
      if (v13)
      {
        v17 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v18 = v17 | (v9 << 6);
      }
      else
      {
        v19 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v14)
          goto LABEL_31;
        v20 = v10[v19];
        ++v9;
        if (!v20)
        {
          v9 = v19 + 1;
          if (v19 + 1 >= v14)
            goto LABEL_31;
          v20 = v10[v9];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v14)
            {
LABEL_31:
              if ((v34 & 1) == 0)
              {
                result = swift_release();
                v4 = v33;
                goto LABEL_38;
              }
              if (v32 >= 64)
                bzero((void *)(v6 + 64), 8 * v14);
              else
                *v10 = v31;
              v4 = v33;
              *(_QWORD *)(v6 + 16) = 0;
              break;
            }
            v20 = v10[v21];
            if (!v20)
            {
              while (1)
              {
                v9 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_40;
                if (v9 >= v14)
                  goto LABEL_31;
                v20 = v10[v9];
                ++v21;
                if (v20)
                  goto LABEL_21;
              }
            }
            v9 = v21;
          }
        }
LABEL_21:
        v13 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v9 << 6);
      }
      v22 = *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v18);
      v23 = *(_BYTE *)(*(_QWORD *)(v6 + 56) + v18);
      result = sub_1B13732B8();
      v24 = -1 << *(_BYTE *)(v8 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v15 + 8 * (v25 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v15 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v15 + 8 * v26);
        }
        while (v30 == -1);
        v16 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v15 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v16) = v22;
      *(_BYTE *)(*(_QWORD *)(v8 + 56) + v16) = v23;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v4 = v8;
  return result;
}

uint64_t sub_1B136C670(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1B12CC71C(a1, a2, a3, a4, (void (*)(void))sub_1B136F728, &qword_1ED386C98);
}

uint64_t sub_1B136C684(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1B131BA04(a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_1B136F918();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = (_QWORD *)(v18[7] + 16 * v12);
      result = swift_bridgeObjectRelease();
      *v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(_QWORD *)(v18[6] + 8 * v12) = a3;
    v21 = (_QWORD *)(v18[7] + 16 * v12);
    *v21 = a1;
    v21[1] = a2;
    v22 = v18[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_1B136B024(result, a4 & 1);
  result = sub_1B131BA04(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1B1373270();
  __break(1u);
  return result;
}

uint64_t sub_1B136C7C0(char a1, uint64_t a2, char a3)
{
  return sub_1B136CFD4(a1, a2, a3, (uint64_t (*)(uint64_t))sub_1B131C93C, (uint64_t (*)(void))sub_1B136FAD0, &qword_1ED388E90);
}

uint64_t sub_1B136C7E4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1B136CB5C(a1, a2, a3, a4, (void (*)(void))sub_1B136FADC, (uint64_t (*)(_QWORD))type metadata accessor for VisibilityTiming, &qword_1ED387F50);
}

uint64_t sub_1B136C800(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1B136CCF0(a1, a2, a3, (uint64_t (*)(void))sub_1B136FAF0, &qword_1ED388E78);
}

void sub_1B136C814(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;

  v4 = (_QWORD **)v3;
  v8 = sub_1B1371F80();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_1B131BA5C(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];

      *(_QWORD *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_1B136FD28();
    goto LABEL_7;
  }
  sub_1B136B328(v17, a3 & 1);
  v22 = sub_1B131BA5C(a2);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_14:
    sub_1B1373270();
    __break(1u);
    return;
  }
  v14 = v22;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_1B136D16C(v14, (uint64_t)v11, a1, v20);
}

void sub_1B136C970(uint64_t a1, char a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  int v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v5 = (_QWORD **)v4;
  v27 = a1;
  v9 = sub_1B1371DC4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (_QWORD *)*v4;
  v15 = sub_1B131BAF4(a3);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  v19 = v14;
  v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
    goto LABEL_9;
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_1B13701AC();
    goto LABEL_9;
  }
  sub_1B136B6C0(v18, a4 & 1);
  v21 = sub_1B131BAF4(a3);
  if ((v19 & 1) != (v22 & 1))
  {
LABEL_14:
    sub_1B1373270();
    __break(1u);
    return;
  }
  v15 = v21;
LABEL_9:
  v23 = a2 & 1;
  v24 = *v5;
  if ((v19 & 1) != 0)
  {
    v25 = v24[7] + 16 * v15;
    sub_1B136AA6C(*(id *)v25, *(_BYTE *)(v25 + 8));
    *(_QWORD *)v25 = v27;
    *(_BYTE *)(v25 + 8) = v23 != 0;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
    sub_1B136D204(v15, (uint64_t)v12, v27, v23, v24);
  }
}

unint64_t sub_1B136CAEC()
{
  unint64_t result;

  result = qword_1ED387C00;
  if (!qword_1ED387C00)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED387C00);
  }
  return result;
}

void sub_1B136CB28(void *a1, unsigned __int8 a2)
{
  if (a2 != 255)
    sub_1B136AA6C(a1, a2 & 1);
}

uint64_t sub_1B136CB40(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1B136CB5C(a1, a2, a3, a4, (void (*)(void))sub_1B13705E8, (uint64_t (*)(_QWORD))type metadata accessor for PreloadedContentDiagnosticPayload, &qword_1ED389280);
}

uint64_t sub_1B136CB5C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), uint64_t (*a6)(_QWORD), uint64_t *a7)
{
  _QWORD *v7;
  _QWORD **v11;
  _QWORD *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  unint64_t v27;
  char v28;

  v11 = (_QWORD **)v7;
  v15 = (_QWORD *)*v7;
  v17 = sub_1B12D372C(a2, a3);
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
    if (v22 >= v20 && (a4 & 1) != 0)
    {
LABEL_7:
      v23 = *v11;
      if ((v21 & 1) != 0)
      {
LABEL_8:
        v24 = v23[7];
        v25 = a6(0);
        return sub_1B136D3D0(a1, v24 + *(_QWORD *)(*(_QWORD *)(v25 - 8) + 72) * v17, a6);
      }
      goto LABEL_11;
    }
    if (v22 >= v20 && (a4 & 1) == 0)
    {
      a5();
      goto LABEL_7;
    }
    sub_1B136BA6C(v20, a4 & 1, a6, a7);
    v27 = sub_1B12D372C(a2, a3);
    if ((v21 & 1) == (v28 & 1))
    {
      v17 = v27;
      v23 = *v11;
      if ((v21 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1B136D2AC(v17, a2, a3, a1, v23, a6);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_1B1373270();
  __break(1u);
  return result;
}

uint64_t sub_1B136CCC8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1B12CB9EC(a1, a2, a3, a4, (void (*)(void))sub_1B1370850, &qword_1ED387F48);
}

uint64_t sub_1B136CCDC(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1B136CCF0(a1, a2, a3, (uint64_t (*)(void))sub_1B1370A08, &qword_1EEF28A60);
}

uint64_t sub_1B136CCF0(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(void), uint64_t *a5)
{
  _QWORD *v5;
  _QWORD *v8;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t result;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v8 = v5;
  v12 = *v5;
  v14 = sub_1B12BA870(a2);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v19 >= result && (a3 & 1) == 0)
  {
    result = a4();
LABEL_7:
    v20 = (_QWORD *)*v8;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v23 = 8 * v14;
    *(_QWORD *)(v20[6] + v23) = a2;
    *(_QWORD *)(v20[7] + v23) = a1;
    v24 = v20[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v20[2] = v26;
      return result;
    }
    goto LABEL_14;
  }
  sub_1B136BE04(result, a3 & 1, a5);
  result = sub_1B12BA870(a2);
  if ((v18 & 1) == (v22 & 1))
  {
    v14 = result;
    v20 = (_QWORD *)*v8;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1B1373270();
  __break(1u);
  return result;
}

uint64_t sub_1B136CE3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_1B12D372C(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1B1370BAC();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      result = swift_bridgeObjectRelease();
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1B136C0B4(v17, a5 & 1);
  v23 = sub_1B12D372C(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1B1373270();
  __break(1u);
  return result;
}

uint64_t sub_1B136CFB0(char a1, uint64_t a2, char a3)
{
  return sub_1B136CFD4(a1, a2, a3, (uint64_t (*)(uint64_t))sub_1B12BA870, (uint64_t (*)(void))sub_1B1370D64, &qword_1ED386C50);
}

uint64_t sub_1B136CFD4(char a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(void), uint64_t *a6)
{
  _QWORD *v6;
  _QWORD *v10;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t result;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  char v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v10 = v6;
  v14 = *v6;
  v16 = a4(a2);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = (v15 & 1) == 0;
  result = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v20 = v15;
  v21 = *(_QWORD *)(v14 + 24);
  if (v21 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v21 >= result && (a3 & 1) == 0)
  {
    result = a5();
LABEL_7:
    v22 = (_QWORD *)*v10;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(v22[7] + v16) = a1 & 1;
      return result;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    *(_QWORD *)(v22[6] + 8 * v16) = a2;
    *(_BYTE *)(v22[7] + v16) = a1 & 1;
    v24 = v22[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v22[2] = v26;
      return result;
    }
    goto LABEL_14;
  }
  sub_1B136C3D8(result, a3 & 1, a6);
  result = a4(a2);
  if ((v20 & 1) == (v23 & 1))
  {
    v16 = result;
    v22 = (_QWORD *)*v10;
    if ((v20 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1B1373270();
  __break(1u);
  return result;
}

unint64_t sub_1B136D124(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  a4[(result >> 6) + 8] |= 1 << result;
  v4 = 8 * result;
  *(_QWORD *)(a4[6] + v4) = a2;
  *(_QWORD *)(a4[7] + v4) = a3;
  v5 = a4[2];
  v6 = __OFADD__(v5, 1);
  v7 = v5 + 1;
  if (v6)
    __break(1u);
  else
    a4[2] = v7;
  return result;
}

uint64_t sub_1B136D16C(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_1B1371F80();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_1B136D204(unint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v10 = a5[6];
  v11 = sub_1B1371DC4();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a2, v11);
  v13 = a5[7] + 16 * a1;
  *(_QWORD *)v13 = a3;
  *(_BYTE *)(v13 + 8) = a4 & 1;
  v14 = a5[2];
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
    __break(1u);
  else
    a5[2] = v16;
  return result;
}

uint64_t sub_1B136D2AC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t (*a6)(_QWORD))
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v10 = (_QWORD *)(a5[6] + 16 * a1);
  *v10 = a2;
  v10[1] = a3;
  v11 = a5[7];
  v12 = a6(0);
  result = sub_1B12D3DB8(a4, v11 + *(_QWORD *)(*(_QWORD *)(v12 - 8) + 72) * a1, a6);
  v14 = a5[2];
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
    __break(1u);
  else
    a5[2] = v16;
  return result;
}

unint64_t sub_1B136D348(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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

uint64_t sub_1B136D390(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1B12CF7F8(&qword_1ED3896D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B136D3D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_1B136D414(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x1B5E1AF70](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ImageDownloader.ImageDownloaderError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1B136D494 + 4 * byte_1B1378FE0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1B136D4B4 + 4 * byte_1B1378FE5[v4]))();
}

_BYTE *sub_1B136D494(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1B136D4B4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B136D4BC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B136D4C4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1B136D4CC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1B136D4D4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ImageDownloader.ImageDownloaderError()
{
  return &type metadata for ImageDownloader.ImageDownloaderError;
}

unint64_t sub_1B136D4F4()
{
  unint64_t result;

  result = qword_1EEF28A50;
  if (!qword_1EEF28A50)
  {
    result = MEMORY[0x1B5E1AF70](&unk_1B13790A8, &type metadata for ImageDownloader.ImageDownloaderError);
    atomic_store(result, (unint64_t *)&qword_1EEF28A50);
  }
  return result;
}

void sub_1B136D618()
{
  void *v0;
  id v1;
  id v2;
  double v3;
  double v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
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
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  void *v84;
  id v85;

  v1 = objc_msgSend(v0, sel_traitCollection);
  v2 = objc_msgSend(v1, sel_horizontalSizeClass);

  v3 = 148.0;
  if (v2 != (id)1)
    v3 = 0.0;
  if (v2 == (id)2)
    v4 = 260.0;
  else
    v4 = v3;
  v84 = (void *)objc_opt_self();
  sub_1B12CF7F8(&qword_1ED389880);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1B13766A0;
  v6 = sub_1B12DC68C();
  v7 = objc_msgSend(v6, sel_leadingAnchor);

  v8 = objc_msgSend(v0, sel_contentView);
  v9 = objc_msgSend(v8, (SEL)&stru_1E6302130.offs + 6);

  v10 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v9);
  *(_QWORD *)(v5 + 32) = v10;
  v11 = sub_1B12DC68C();
  v12 = objc_msgSend(v11, sel_topAnchor);

  v13 = objc_msgSend(v0, sel_contentView);
  v14 = objc_msgSend(v13, (SEL)&selRef_whiteColor + 4);

  v15 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v14);
  *(_QWORD *)(v5 + 40) = v15;
  v16 = sub_1B12DC68C();
  v17 = objc_msgSend(v16, sel_trailingAnchor);

  v18 = objc_msgSend(v0, sel_contentView);
  v19 = objc_msgSend(v18, sel_trailingAnchor);

  v20 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v19);
  *(_QWORD *)(v5 + 48) = v20;
  v21 = sub_1B12DC68C();
  v22 = objc_msgSend(v21, sel_heightAnchor);

  v23 = objc_msgSend(v22, sel_constraintEqualToConstant_, v4);
  *(_QWORD *)(v5 + 56) = v23;
  v24 = sub_1B12DC7A0();
  v25 = objc_msgSend(v24, (SEL)&stru_1E6302130.offs + 6);

  v26 = objc_msgSend(v0, sel_contentView);
  v27 = objc_msgSend(v26, (SEL)&stru_1E6302130.offs + 6);

  v28 = objc_msgSend(v25, sel_constraintEqualToAnchor_, v27);
  *(_QWORD *)(v5 + 64) = v28;
  v29 = sub_1B12DC7A0();
  v30 = objc_msgSend(v29, (SEL)&selRef_whiteColor + 4);

  v31 = sub_1B12DC68C();
  v32 = objc_msgSend(v31, sel_bottomAnchor);

  v33 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v32);
  *(_QWORD *)(v5 + 72) = v33;
  v34 = sub_1B12DC7A0();
  v35 = objc_msgSend(v34, sel_trailingAnchor);

  v36 = objc_msgSend(v0, sel_contentView);
  v37 = objc_msgSend(v36, sel_trailingAnchor);

  v38 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v37);
  *(_QWORD *)(v5 + 80) = v38;
  v39 = sub_1B12DC7A0();
  v40 = objc_msgSend(v39, sel_bottomAnchor);

  v41 = objc_msgSend(v0, sel_contentView);
  v42 = objc_msgSend(v41, sel_bottomAnchor);

  v43 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v42);
  *(_QWORD *)(v5 + 88) = v43;
  v44 = sub_1B12DC824();
  v45 = objc_msgSend(v44, (SEL)&stru_1E6302130.offs + 6);

  v46 = sub_1B12DC7A0();
  v47 = objc_msgSend(v46, (SEL)&stru_1E6302130.offs + 6);

  v48 = objc_msgSend(v45, sel_constraintEqualToAnchor_constant_, v47, 6.0);
  *(_QWORD *)(v5 + 96) = v48;
  v49 = sub_1B12DC824();
  v50 = objc_msgSend(v49, sel_topAnchor);

  v51 = sub_1B12DC7A0();
  v52 = objc_msgSend(v51, sel_topAnchor);

  v53 = objc_msgSend(v50, sel_constraintEqualToAnchor_constant_, v52, 6.0);
  *(_QWORD *)(v5 + 104) = v53;
  v54 = sub_1B12DC824();
  v55 = objc_msgSend(v54, sel_trailingAnchor);

  v56 = sub_1B12DC7A0();
  v57 = objc_msgSend(v56, sel_trailingAnchor);

  v58 = objc_msgSend(v55, sel_constraintEqualToAnchor_constant_, v57, -6.0);
  *(_QWORD *)(v5 + 112) = v58;
  v59 = sub_1B12DC824();
  v60 = objc_msgSend(v59, sel_bottomAnchor);

  v61 = sub_1B12DC7A0();
  v62 = objc_msgSend(v61, sel_bottomAnchor);

  v63 = objc_msgSend(v60, sel_constraintLessThanOrEqualToAnchor_constant_, v62, -6.0);
  *(_QWORD *)(v5 + 120) = v63;
  v64 = sub_1B12DCA28();
  v65 = objc_msgSend(v64, sel_leadingAnchor);

  v66 = sub_1B12DC7A0();
  v67 = objc_msgSend(v66, sel_leadingAnchor);

  v68 = objc_msgSend(v65, sel_constraintEqualToAnchor_, v67);
  *(_QWORD *)(v5 + 128) = v68;
  v69 = sub_1B12DCA28();
  v70 = objc_msgSend(v69, sel_topAnchor);

  v71 = sub_1B12DC7A0();
  v72 = objc_msgSend(v71, sel_topAnchor);

  v73 = objc_msgSend(v70, sel_constraintEqualToAnchor_, v72);
  *(_QWORD *)(v5 + 136) = v73;
  v74 = sub_1B12DCA28();
  v75 = objc_msgSend(v74, sel_trailingAnchor);

  v76 = sub_1B12DC7A0();
  v77 = objc_msgSend(v76, sel_trailingAnchor);

  v78 = objc_msgSend(v75, sel_constraintEqualToAnchor_, v77);
  *(_QWORD *)(v5 + 144) = v78;
  v79 = sub_1B12DCA28();
  v80 = objc_msgSend(v79, sel_bottomAnchor);

  v81 = sub_1B12DC7A0();
  v82 = objc_msgSend(v81, sel_bottomAnchor);

  v83 = objc_msgSend(v80, sel_constraintEqualToAnchor_, v82);
  *(_QWORD *)(v5 + 152) = v83;
  sub_1B1372CA0();
  sub_1B12E64E0();
  v85 = (id)sub_1B1372C7C();
  swift_bridgeObjectRelease();
  objc_msgSend(v84, sel_activateConstraints_, v85);

}

id sub_1B136DE3C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SmallCarouselCollectionViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SmallCarouselCollectionViewCell()
{
  return objc_opt_self();
}

Swift::Int __swiftcall CarouselAdView.collectionView(_:numberOfItemsInSection:)(UICollectionView *_, Swift::Int numberOfItemsInSection)
{
  uint64_t v2;

  return *(_QWORD *)(*(_QWORD *)(v2 + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements) + 16);
}

char *CarouselAdView.collectionView(_:cellForItemAt:)(void *a1, uint64_t a2)
{
  char *v2;
  char *v3;
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
  int *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  int *v36;
  id v37;
  void *v38;
  int *v39;
  uint64_t v40;
  int *v41;
  char *result;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t);
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;

  v3 = v2;
  v6 = sub_1B1371DC4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v63 = (uint64_t)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1B1371F80();
  v69 = *(_QWORD *)(v9 - 8);
  v70 = v9;
  v10 = *(_QWORD *)(v69 + 64);
  v11 = MEMORY[0x1E0C80A78](v9);
  v62 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v60 - v13;
  MEMORY[0x1E0C80A78](v12);
  v71 = (char *)&v60 - v15;
  v16 = (int *)type metadata accessor for CarouselElement();
  v17 = *((_QWORD *)v16 - 1);
  MEMORY[0x1E0C80A78](v16);
  v72 = (uint64_t)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1B135639C();
  if (v19)

  v64 = v7;
  v65 = v6;
  v20 = (void *)sub_1B1372B74();
  swift_bridgeObjectRelease();
  v21 = (void *)sub_1B1371F50();
  v22 = objc_msgSend(a1, sel_dequeueReusableCellWithReuseIdentifier_forIndexPath_, v20, v21);

  type metadata accessor for CarouselCollectionViewCell();
  v23 = swift_dynamicCastClass();
  if (!v23)
  {

    return (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC35C0]), sel_init);
  }
  v24 = (_QWORD *)v23;
  v25 = *(_QWORD *)&v3[OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements];
  v26 = sub_1B1371F74();
  if ((v26 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v26 >= *(_QWORD *)(v25 + 16))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  sub_1B1332FDC(v25+ ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80))+ *(_QWORD *)(v17 + 72) * v26, v72, (uint64_t (*)(_QWORD))type metadata accessor for CarouselElement);
  v27 = sub_1B1371F74();
  v28 = __OFADD__(v27, 1);
  v29 = v27 + 1;
  if (v28)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v68 = v22;
  v22 = v71;
  MEMORY[0x1B5E19608](v29, 0);
  if (sub_1B1371F74() < *(_QWORD *)(v25 + 16))
    sub_1B135EB08(a2);
  v30 = sub_1B1371F74();
  v28 = __OFADD__(v30, 1);
  v31 = v30 + 1;
  if (!v28)
  {
    MEMORY[0x1B5E19608](v31, 0);
    v32 = sub_1B1371F74();
    v66 = v25;
    if (v32 < *(_QWORD *)(v25 + 16))
      sub_1B135EB08((uint64_t)v14);
    type metadata accessor for ImageCache();
    swift_initStaticObject();
    v33 = v72 + v16[6];
    v34 = sub_1B1352900();
    v35 = (void *)sub_1B1371D88();
    v16 = (int *)objc_msgSend(v34, sel_objectForKey_, v35);

    v67 = v14;
    if (v16)
    {
      v36 = v16;
      v37 = sub_1B1355724();
      v38 = (void *)sub_1B1371F50();
      v39 = (int *)objc_msgSend(v37, sel_cellForItemAtIndexPath_, v38);

      if (v39)
      {
        type metadata accessor for ImageCollectionViewCell();
        v40 = swift_dynamicCastClass();
        if (v40)
        {
          objc_msgSend(*(id *)(v40 + OBJC_IVAR____TtC17PromotedContentUI23ImageCollectionViewCell_imageView), sel_setImage_, v36);
          v41 = v36;
          v36 = v39;
        }
        else
        {
          v41 = v39;
        }

      }
    }
    swift_beginAccess();
    v43 = (void *)sub_1B136E7E0(a2);
    swift_endAccess();
    if (!v43)
    {
      v43 = *(void **)((char *)v24 + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell_assetToken);
      v44 = v43;
      if (!v16 && !v43)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 16))(v63, v33, v65);
        v61 = swift_allocObject();
        swift_unknownObjectWeakInit();
        v45 = v69;
        v46 = v70;
        v47 = v62;
        (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v62, a2, v70);
        v48 = (*(unsigned __int8 *)(v45 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
        v49 = swift_allocObject();
        *(_QWORD *)(v49 + 16) = v61;
        (*(void (**)(unint64_t, char *, uint64_t))(v45 + 32))(v49 + v48, v47, v46);
        swift_retain();
        v50 = v63;
        v43 = sub_1B13529C0(v63, (void (*)(id, uint64_t))sub_1B1370F8C, v49);
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v50, v65);
        swift_release();
      }
    }
    (*(void (**)(uint64_t, int *, char *, _UNKNOWN **))((*MEMORY[0x1E0DEEDD8] & *v24) + 0x140))(v72, v16, v3, &off_1E62F6DB8);
    v51 = *(void **)((char *)v24 + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell_assetToken);
    *(_QWORD *)((char *)v24 + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell_assetToken) = v43;
    v22 = v43;

    v52 = qword_1ED387940;
    v3 = (char *)v68;
    if (v52 == -1)
      goto LABEL_25;
    goto LABEL_31;
  }
LABEL_30:
  __break(1u);
LABEL_31:
  swift_once();
LABEL_25:
  sub_1B12CF7F8(&qword_1ED3899B0);
  v53 = swift_allocObject();
  *(_OWORD *)(v53 + 16) = xmmword_1B13757D0;
  swift_bridgeObjectRetain();
  result = (char *)sub_1B1371F74();
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    v54 = MEMORY[0x1E0DEB418];
    v55 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v53 + 56) = MEMORY[0x1E0DEB418];
    *(_QWORD *)(v53 + 64) = v55;
    *(_QWORD *)(v53 + 32) = result + 1;
    v56 = *(_QWORD *)(v66 + 16);
    *(_QWORD *)(v53 + 96) = v54;
    *(_QWORD *)(v53 + 104) = v55;
    *(_QWORD *)(v53 + 72) = v56;
    sub_1B1372BB0();
    swift_bridgeObjectRelease();
    v57 = (void *)sub_1B1372B74();
    swift_bridgeObjectRelease();
    objc_msgSend(v24, sel_setAccessibilityHint_, v57);

    v58 = v70;
    v59 = *(void (**)(char *, uint64_t))(v69 + 8);
    v59(v67, v70);
    v59(v71, v58);
    sub_1B12DD8B8(v72);
    return (char *)v24;
  }
  return result;
}

uint64_t sub_1B136E5F4(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  unint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v8 = sub_1B1371F80();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  result = MEMORY[0x1E0C80A78](v8);
  if (a1)
  {
    if ((a2 & 1) != 0)
    {
      sub_1B12BBD50();
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v8);
      v12 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
      v13 = swift_allocObject();
      *(_QWORD *)(v13 + 16) = a3;
      (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v13 + v12, (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
      *(_QWORD *)(v13 + ((v10 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
      v14 = a1;
      swift_retain();
      sub_1B1372DCC();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_1B136E7CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1B136EB0C(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for VisibilityTiming, &qword_1ED387F50, a3);
}

uint64_t sub_1B136E7E0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_1B131BA5C(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  v12 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1B136FD28();
    v7 = v12;
  }
  v8 = *(_QWORD *)(v7 + 48);
  v9 = sub_1B1371F80();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v4, v9);
  v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v4);
  sub_1B136EFC8(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1B136E8B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1B12D372C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v18 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1B136FF50();
      v11 = v18;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = sub_1B1371EB4();
    v14 = MEMORY[0x1E0CB0870];
    v15 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v15 + 32))(a3, v12 + *(_QWORD *)(v15 + 72) * v8, v13);
    sub_1B136F51C(v8, v11, (uint64_t (*)(_QWORD))v14);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v15 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v17 = sub_1B1371EB4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(a3, 1, 1, v17);
  }
}

uint64_t sub_1B136E9F4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_1B131BAF4(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  v12 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1B13701AC();
    v7 = v12;
  }
  v8 = *(_QWORD *)(v7 + 48);
  v9 = sub_1B1371DC4();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v4, v9);
  v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 16 * v4);
  sub_1B136F268(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1B136EAE4(uint64_t a1, uint64_t a2)
{
  return sub_1B12BD2CC(a1, a2, (uint64_t)&qword_1ED387F88, (void (*)(uint64_t))sub_1B1370440);
}

uint64_t sub_1B136EAF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1B136EB0C(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for PreloadedContentDiagnosticPayload, &qword_1ED389280, a3);
}

uint64_t sub_1B136EB0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_QWORD)@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t *v5;
  uint64_t *v8;
  unint64_t v12;
  char v13;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v8 = v5;
  swift_bridgeObjectRetain();
  v12 = sub_1B12D372C(a1, a2);
  LOBYTE(a2) = v13;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = *v8;
    v21 = *v8;
    *v8 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1B13705FC(a3, a4);
      v15 = v21;
    }
    swift_bridgeObjectRelease();
    v16 = *(_QWORD *)(v15 + 56);
    v17 = a3(0);
    v18 = *(_QWORD *)(v17 - 8);
    sub_1B12D3DB8(v16 + *(_QWORD *)(v18 + 72) * v12, a5, a3);
    sub_1B136F51C(v12, v15, a3);
    *v8 = v15;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(a5, 0, 1, v17);
  }
  else
  {
    v20 = a3(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(a5, 1, 1, v20);
  }
}

uint64_t sub_1B136EC4C(uint64_t a1, uint64_t a2)
{
  return sub_1B12BD2CC(a1, a2, (uint64_t)&qword_1ED387F58, (void (*)(uint64_t))sub_1B137085C);
}

uint64_t sub_1B136EC60(uint64_t a1, uint64_t a2)
{
  return sub_1B12BCF08(a1, a2, (uint64_t *)&unk_1ED387F70);
}

uint64_t sub_1B136EC6C(uint64_t a1, uint64_t a2)
{
  return sub_1B12BCF08(a1, a2, (uint64_t *)&unk_1ED387F60);
}

unint64_t sub_1B136EC78(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1B1372FE8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = sub_1B13732B8();
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = (_QWORD *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1)
              *v14 = *v10;
            v15 = *(_QWORD *)(a2 + 56);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v16 >= v17 + 1))
            {
              *v16 = *v17;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1B136EE0C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1B1372FE8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = sub_1B13732B8();
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11)
            goto LABEL_6;
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        v14 = (_QWORD *)(v9 + 8 * v3);
        if (v3 != v6 || v14 >= v10 + 1)
          *v14 = *v10;
        v15 = *(_QWORD *)(a2 + 56);
        v16 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for VisibilityTiming() - 8) + 72);
        v17 = v16 * v3;
        result = v15 + v16 * v3;
        v18 = v16 * v6;
        v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v17 == v18)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    v23 = *v21;
    v22 = (-1 << result) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1B136EFC8(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, unint64_t, uint64_t);
  unint64_t v34;
  uint64_t v35;

  v4 = sub_1B1371F80();
  v35 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_1B1372FE8();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v34 = (result + 1) & v11;
      v12 = *(_QWORD *)(v35 + 72);
      v33 = *(void (**)(char *, unint64_t, uint64_t))(v35 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v33(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_1B12BBA04(&qword_1ED3877E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1658], MEMORY[0x1E0CB1668]);
        v18 = sub_1B1372B38();
        result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v34)
        {
          if (v19 >= v34 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v22 = *(_QWORD *)(a2 + 48);
            result = v22 + v15 * a1;
            v8 = v14;
            if (v15 * a1 < v16 || (v12 = v15, result >= v22 + v16 + v15))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              v13 = v17;
              v12 = v15;
            }
            else if (v15 * a1 != v16)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v23 = *(_QWORD *)(a2 + 56);
            v24 = (_QWORD *)(v23 + 8 * a1);
            v25 = (_QWORD *)(v23 + 8 * v10);
            if (a1 != v10 || (a1 = v10, v24 >= v25 + 1))
            {
              *v24 = *v25;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v34 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
        v12 = v15;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v26;
    v28 = (-1 << a1) - 1;
  }
  else
  {
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v28 = *v26;
    v27 = (-1 << a1) - 1;
  }
  *v26 = v28 & v27;
  v29 = *(_QWORD *)(a2 + 16);
  v30 = __OFSUB__(v29, 1);
  v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1B136F268(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  _OWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, unint64_t, uint64_t);
  unint64_t v34;
  uint64_t v35;

  v4 = sub_1B1371DC4();
  v35 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_1B1372FE8();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v34 = (result + 1) & v11;
      v12 = *(_QWORD *)(v35 + 72);
      v33 = *(void (**)(char *, unint64_t, uint64_t))(v35 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v33(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_1B12BBA04(&qword_1ED387B30, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0018]);
        v18 = sub_1B1372B38();
        result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v34)
        {
          if (v19 >= v34 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v22 = *(_QWORD *)(a2 + 48);
            result = v22 + v15 * a1;
            v8 = v14;
            if (v15 * a1 < v16 || (v12 = v15, result >= v22 + v16 + v15))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              v13 = v17;
              v12 = v15;
            }
            else if (v15 * a1 != v16)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v23 = *(_QWORD *)(a2 + 56);
            v24 = (_OWORD *)(v23 + 16 * a1);
            v25 = (_OWORD *)(v23 + 16 * v10);
            if (16 * a1 != 16 * v10 || (a1 = v10, v24 >= v25 + 1))
            {
              *v24 = *v25;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v34 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
        v12 = v15;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v26;
    v28 = (-1 << a1) - 1;
  }
  else
  {
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v28 = *v26;
    v27 = (-1 << a1) - 1;
  }
  *v26 = v28 & v27;
  v29 = *(_QWORD *)(a2 + 16);
  v30 = __OFSUB__(v29, 1);
  v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1B136F510(unint64_t a1, uint64_t a2)
{
  return sub_1B136F51C(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for PreloadedContentDiagnosticPayload);
}

unint64_t sub_1B136F51C(unint64_t result, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

  v4 = result;
  v5 = a2 + 64;
  v6 = -1 << *(_BYTE *)(a2 + 32);
  v7 = (result + 1) & ~v6;
  if (((1 << v7) & *(_QWORD *)(a2 + 64 + 8 * (v7 >> 6))) != 0)
  {
    v9 = ~v6;
    result = sub_1B1372FE8();
    if ((*(_QWORD *)(v5 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
    {
      v10 = (result + 1) & v9;
      while (1)
      {
        sub_1B13732C4();
        swift_bridgeObjectRetain();
        sub_1B1372C04();
        v11 = sub_1B13732E8();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v9;
        if (v4 >= (uint64_t)v10)
          break;
        if (v12 < v10)
          goto LABEL_11;
LABEL_12:
        v13 = *(_QWORD *)(a2 + 48);
        v14 = (_OWORD *)(v13 + 16 * v4);
        v15 = (_OWORD *)(v13 + 16 * v7);
        if (v4 != v7 || v14 >= v15 + 1)
          *v14 = *v15;
        v16 = *(_QWORD *)(a2 + 56);
        v17 = *(_QWORD *)(*(_QWORD *)(a3(0) - 8) + 72);
        v18 = v17 * v4;
        result = v16 + v17 * v4;
        v19 = v17 * v7;
        v20 = v16 + v17 * v7 + v17;
        if (v18 < v19 || result >= v20)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v4 = v7;
          if (v18 == v19)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v4 = v7;
LABEL_6:
        v7 = (v7 + 1) & v9;
        if (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
          goto LABEL_21;
      }
      if (v12 < v10)
        goto LABEL_6;
LABEL_11:
      if (v4 < (uint64_t)v12)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v22 = (uint64_t *)(v5 + 8 * ((unint64_t)v4 >> 6));
    v23 = *v22;
    v24 = (-1 << v4) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v5 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_1B136F728()
{
  return sub_1B12BC78C(&qword_1ED386C98);
}

void *sub_1B136F734()
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
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  sub_1B12CF7F8(&qword_1EEF28128);
  v2 = *v0;
  v3 = sub_1B13731A4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_1B12D4058(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_1B12C32CC(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1B136F918()
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
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  sub_1B12CF7F8(&qword_1ED388E70);
  v2 = *v0;
  v3 = sub_1B13731A4();
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
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v18);
    v21 = *v19;
    v20 = v19[1];
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v18);
    *v22 = v21;
    v22[1] = v20;
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

void *sub_1B136FAC4()
{
  return sub_1B137085C(&qword_1ED3872F8);
}

void *sub_1B136FAD0()
{
  return sub_1B1370D70(&qword_1ED388E90);
}

void *sub_1B136FADC()
{
  return sub_1B13705FC((uint64_t (*)(_QWORD))type metadata accessor for VisibilityTiming, &qword_1ED387F50);
}

void *sub_1B136FAF0()
{
  return sub_1B1370A14(&qword_1ED388E78);
}

void *sub_1B136FAFC()
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
  uint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v1 = v0;
  v2 = type metadata accessor for VisibilityTiming();
  v27 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B12CF7F8(&qword_1ED386978);
  v5 = *v0;
  v6 = sub_1B13731A4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v7;
    return result;
  }
  v25 = v1;
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v26 = v5 + 64;
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
    v21 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v15)
      goto LABEL_26;
    v22 = *(_QWORD *)(v26 + 8 * v21);
    ++v11;
    if (!v22)
    {
      v11 = v21 + 1;
      if (v21 + 1 >= v15)
        goto LABEL_26;
      v22 = *(_QWORD *)(v26 + 8 * v11);
      if (!v22)
        break;
    }
LABEL_25:
    v14 = (v22 - 1) & v22;
    v17 = __clz(__rbit64(v22)) + (v11 << 6);
LABEL_12:
    v18 = 8 * v17;
    v19 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v17);
    v20 = *(_QWORD *)(v27 + 72) * v17;
    sub_1B1332FDC(*(_QWORD *)(v5 + 56) + v20, (uint64_t)v4, (uint64_t (*)(_QWORD))type metadata accessor for VisibilityTiming);
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18) = v19;
    result = (void *)sub_1B12D3DB8((uint64_t)v4, *(_QWORD *)(v7 + 56) + v20, (uint64_t (*)(_QWORD))type metadata accessor for VisibilityTiming);
  }
  v23 = v21 + 2;
  if (v23 >= v15)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v22 = *(_QWORD *)(v26 + 8 * v23);
  if (v22)
  {
    v11 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v11 >= v15)
      goto LABEL_26;
    v22 = *(_QWORD *)(v26 + 8 * v11);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1B136FD28()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_1B1371F80();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B12CF7F8(&qword_1ED3876D8);
  v24 = v0;
  v5 = *v0;
  v6 = sub_1B13731A4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v24 = v7;
    return result;
  }
  result = (id)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v25 = v5 + 64;
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(void **)(*(_QWORD *)(v5 + 56) + v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = v19;
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1B136FF50()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = sub_1B1371EB4();
  v1 = *(_QWORD *)(v34 - 8);
  MEMORY[0x1E0C80A78](v34);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B12CF7F8(&qword_1ED3896C0);
  v31 = v0;
  v4 = *v0;
  v5 = sub_1B13731A4();
  v6 = *(_QWORD *)(v4 + 16);
  v35 = v5;
  if (!v6)
  {
    result = (void *)swift_release();
    v29 = v35;
    v28 = v31;
LABEL_28:
    *v28 = v29;
    return result;
  }
  v7 = v5;
  result = (void *)(v5 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    v7 = v35;
  }
  v32 = v4 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v4 + 16);
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v33 = (unint64_t)(v12 + 63) >> 6;
  v15 = v34;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      v11 = v25 + 1;
      if (v25 + 1 >= v33)
        goto LABEL_26;
      v26 = *(_QWORD *)(v32 + 8 * v11);
      if (!v26)
        break;
    }
LABEL_25:
    v14 = (v26 - 1) & v26;
    v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(_QWORD *)(v4 + 56) + v22, v15);
    v23 = v35;
    v24 = (_QWORD *)(*(_QWORD *)(v35 + 48) + v18);
    *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v23 + 56) + v22, v3, v15);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release();
    v28 = v31;
    v29 = v35;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v32 + 8 * v27);
  if (v26)
  {
    v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v11 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v11);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1B13701AC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *result;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v37 = sub_1B1371DC4();
  v1 = *(_QWORD *)(v37 - 8);
  MEMORY[0x1E0C80A78](v37);
  v36 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B12CF7F8(&qword_1ED387C10);
  v33 = v0;
  v3 = *v0;
  v4 = sub_1B13731A4();
  v5 = *(_QWORD *)(v3 + 16);
  v39 = v4;
  if (!v5)
  {
    result = (void *)swift_release();
    v31 = v39;
    v30 = v33;
LABEL_28:
    *v30 = v31;
    return result;
  }
  v6 = v4;
  result = (void *)(v4 + 64);
  v8 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    v6 = v39;
  }
  v34 = v3 + 64;
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v38 = v3;
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v35 = (unint64_t)(v11 + 63) >> 6;
  v15 = v36;
  v14 = v37;
  v16 = v39;
  while (1)
  {
    if (v13)
    {
      v17 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v18 = v17 | (v10 << 6);
      v19 = v38;
      goto LABEL_12;
    }
    v27 = v10 + 1;
    v19 = v38;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v27 >= v35)
      goto LABEL_26;
    v28 = *(_QWORD *)(v34 + 8 * v27);
    ++v10;
    if (!v28)
    {
      v10 = v27 + 1;
      if (v27 + 1 >= v35)
        goto LABEL_26;
      v28 = *(_QWORD *)(v34 + 8 * v10);
      if (!v28)
        break;
    }
LABEL_25:
    v13 = (v28 - 1) & v28;
    v18 = __clz(__rbit64(v28)) + (v10 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v1 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v15, *(_QWORD *)(v19 + 48) + v20, v14);
    v21 = *(_QWORD *)(v19 + 56);
    v22 = 16 * v18;
    v23 = v21 + 16 * v18;
    v24 = *(void **)v23;
    v25 = *(_BYTE *)(v23 + 8);
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v16 + 48) + v20, v15, v14);
    v26 = *(_QWORD *)(v16 + 56) + v22;
    *(_QWORD *)v26 = v24;
    *(_BYTE *)(v26 + 8) = v25;
    result = sub_1B136AA50(v24, v25);
  }
  v29 = v27 + 2;
  if (v29 >= v35)
  {
LABEL_26:
    result = (void *)swift_release();
    v30 = v33;
    v31 = v39;
    goto LABEL_28;
  }
  v28 = *(_QWORD *)(v34 + 8 * v29);
  if (v28)
  {
    v10 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v10 >= v35)
      goto LABEL_26;
    v28 = *(_QWORD *)(v34 + 8 * v10);
    ++v29;
    if (v28)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1B1370428()
{
  return sub_1B1370440(&qword_1ED387F80);
}

id sub_1B1370434()
{
  return sub_1B1370440(&qword_1ED387F88);
}

id sub_1B1370440(uint64_t *a1)
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
  sub_1B12CF7F8(a1);
  v3 = *v1;
  v4 = sub_1B13731A4();
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

void *sub_1B13705E8()
{
  return sub_1B13705FC((uint64_t (*)(_QWORD))type metadata accessor for PreloadedContentDiagnosticPayload, &qword_1ED389280);
}

void *sub_1B13705FC(uint64_t (*a1)(_QWORD), uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *result;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;

  v31 = *(_QWORD *)(a1(0) - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v28 - v5;
  sub_1B12CF7F8(a2);
  v28 = v2;
  v7 = *v2;
  v8 = sub_1B13731A4();
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v28 = v9;
    return result;
  }
  result = (void *)(v8 + 64);
  v11 = (unint64_t)((1 << *(_BYTE *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11)
    result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  v29 = v7 + 64;
  v13 = 0;
  *(_QWORD *)(v9 + 16) = *(_QWORD *)(v7 + 16);
  v14 = 1 << *(_BYTE *)(v7 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v7 + 64);
  v30 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v18 = v17 | (v13 << 6);
      goto LABEL_12;
    }
    v25 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v30)
      goto LABEL_26;
    v26 = *(_QWORD *)(v29 + 8 * v25);
    ++v13;
    if (!v26)
    {
      v13 = v25 + 1;
      if (v25 + 1 >= v30)
        goto LABEL_26;
      v26 = *(_QWORD *)(v29 + 8 * v13);
      if (!v26)
        break;
    }
LABEL_25:
    v16 = (v26 - 1) & v26;
    v18 = __clz(__rbit64(v26)) + (v13 << 6);
LABEL_12:
    v19 = 16 * v18;
    v20 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    v22 = *v20;
    v21 = v20[1];
    v23 = *(_QWORD *)(v31 + 72) * v18;
    sub_1B1332FDC(*(_QWORD *)(v7 + 56) + v23, (uint64_t)v6, a1);
    v24 = (_QWORD *)(*(_QWORD *)(v9 + 48) + v19);
    *v24 = v22;
    v24[1] = v21;
    sub_1B12D3DB8((uint64_t)v6, *(_QWORD *)(v9 + 56) + v23, a1);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v30)
    goto LABEL_26;
  v26 = *(_QWORD *)(v29 + 8 * v27);
  if (v26)
  {
    v13 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v13 >= v30)
      goto LABEL_26;
    v26 = *(_QWORD *)(v29 + 8 * v13);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1B137082C()
{
  return sub_1B137085C(&qword_1ED387F58);
}

void *sub_1B1370838()
{
  return sub_1B12BC78C((uint64_t *)&unk_1ED387F70);
}

void *sub_1B1370844()
{
  return sub_1B12BC78C((uint64_t *)&unk_1ED387F60);
}

void *sub_1B1370850()
{
  return sub_1B137085C(&qword_1ED387F48);
}

void *sub_1B137085C(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
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
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  sub_1B12CF7F8(a1);
  v3 = *v1;
  v4 = sub_1B13731A4();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
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
    v21 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
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

void *sub_1B1370A08()
{
  return sub_1B1370A14(&qword_1EEF28A60);
}

void *sub_1B1370A14(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
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
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v2 = v1;
  sub_1B12CF7F8(a1);
  v3 = *v1;
  v4 = sub_1B13731A4();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
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
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v14)
      goto LABEL_26;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_26;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
        break;
    }
LABEL_25:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = *(_QWORD *)(*(_QWORD *)(v3 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v17) = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v21 = v19 + 2;
  if (v21 >= v14)
    goto LABEL_26;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1B1370BAC()
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
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  sub_1B12CF7F8(&qword_1ED3882D0);
  v2 = *v0;
  v3 = sub_1B13731A4();
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1B1370D64()
{
  return sub_1B1370D70(&qword_1ED386C50);
}

void *sub_1B1370D70(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;

  v2 = v1;
  sub_1B12CF7F8(a1);
  v3 = *v1;
  v4 = sub_1B13731A4();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
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
    v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v7 + 8 * v18);
    ++v10;
    if (!v19)
    {
      v10 = v18 + 1;
      if (v18 + 1 >= v14)
        goto LABEL_26;
      v19 = *(_QWORD *)(v7 + 8 * v10);
      if (!v19)
        break;
    }
LABEL_25:
    v21 = __clz(__rbit64(v19));
    v13 = (v19 - 1) & v19;
    v16 = v21 + (v10 << 6);
LABEL_12:
    v17 = *(_BYTE *)(*(_QWORD *)(v3 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v16) = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v16);
    *(_BYTE *)(*(_QWORD *)(v5 + 56) + v16) = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v14)
    goto LABEL_26;
  v19 = *(_QWORD *)(v7 + 8 * v20);
  if (v19)
  {
    v10 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v7 + 8 * v10);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1B1370EF4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1B1370F18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1B1371F80();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1B1370F8C(void *a1, char a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_1B1371F80() - 8) + 80);
  return sub_1B136E5F4(a1, a2, *(_QWORD *)(v2 + 16), v2 + ((v5 + 24) & ~v5));
}

uint64_t sub_1B1370FDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_1B1371F80();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

uint64_t sub_1B137106C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_1B1372A48();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1B13729E8();
  sub_1B1363E78(v4, qword_1ED38B680);
  sub_1B12E5A5C(v4, (uint64_t)qword_1ED38B680);
  if (qword_1ED389888 != -1)
    swift_once();
  v5 = sub_1B12E5A5C(v0, (uint64_t)qword_1ED38B7B0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_1B13729C4();
}

id sub_1B1371154()
{
  void *v0;
  double v1;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7[2];

  v7[1] = *(double *)MEMORY[0x1E0C80C00];
  v6 = 0.0;
  v7[0] = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  if (!objc_msgSend(v0, sel_getHue_saturation_brightness_alpha_, v7, &v6, &v5, &v4))
    return v3;
  if (v6 + 0.5 <= 1.0)
    v1 = v6 + 0.5;
  else
    v1 = 1.0;
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithHue_saturation_brightness_alpha_, v7[0], v1, v5 * 0.75, v4);
}

void sub_1B1371254(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v2 = v1;
  v4 = objc_msgSend((id)objc_opt_self(), sel_currentTraitCollection);
  v5 = objc_msgSend(v4, sel_userInterfaceStyle);

  if (v5 == (id)2)
    v6 = sub_1B1371154();
  else
    v6 = a1;
  v7 = *(void **)(v2 + OBJC_IVAR___APPrivacyMarker_markerView);
  v8 = v6;
  objc_msgSend(v7, sel_setBackgroundColor_);
  objc_msgSend(v7, sel_setTintColor_, v8);

}

void sub_1B1371310(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  char **v7;
  id v8;
  id v9;
  id v10;

  sub_1B1371254(a1);
  v2 = objc_msgSend((id)objc_opt_self(), sel_currentTraitCollection);
  v3 = objc_msgSend(v2, sel_userInterfaceStyle);

  v4 = *(void **)(v1 + OBJC_IVAR___APPrivacyMarker_markerView);
  v5 = objc_msgSend(v4, sel_layer);
  v6 = (void *)objc_opt_self();
  v7 = &selRef_whiteColor;
  if (v3 != (id)2)
    v7 = &selRef_systemPurpleColor;
  v8 = objc_msgSend(v6, *v7);
  v9 = objc_msgSend(v8, sel_CGColor);

  objc_msgSend(v5, sel_setBorderColor_, v9);
  v10 = objc_msgSend(v4, sel_layer);
  objc_msgSend(v10, sel_setBorderWidth_, 1.0);

}

uint64_t sub_1B1371444(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t *v26;
  _QWORD *v27;
  uint64_t v28;
  BOOL v29;
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
  _QWORD *v43;
  char v44;
  unint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v48;
  char v49;
  unint64_t v50;
  char v51;
  _QWORD *v52;
  uint64_t *v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t result;

  swift_bridgeObjectRetain();
  swift_retain();
  v7 = sub_1B1371780();
  if (!v8)
    goto LABEL_24;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = (_QWORD *)*a5;
  v17 = sub_1B12D372C(v7, v8);
  v18 = v15[2];
  v19 = (v16 & 1) == 0;
  v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v21 = v16;
  if (v15[3] >= v20)
  {
    if ((a4 & 1) != 0)
    {
      v24 = (_QWORD *)*a5;
      if ((v16 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_1B1370BAC();
      v24 = (_QWORD *)*a5;
      if ((v21 & 1) != 0)
        goto LABEL_9;
    }
LABEL_11:
    v24[(v17 >> 6) + 8] |= 1 << v17;
    v26 = (uint64_t *)(v24[6] + 16 * v17);
    *v26 = v11;
    v26[1] = v12;
    v27 = (_QWORD *)(v24[7] + 16 * v17);
    *v27 = v13;
    v27[1] = v14;
    v28 = v24[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v24[2] = v30;
LABEL_13:
    v31 = sub_1B1371780();
    if (v32)
    {
      v35 = v31;
      v36 = v32;
      v37 = v33;
      v38 = v34;
      do
      {
        v43 = (_QWORD *)*a5;
        v45 = sub_1B12D372C(v35, v36);
        v46 = v43[2];
        v47 = (v44 & 1) == 0;
        v48 = v46 + v47;
        if (__OFADD__(v46, v47))
          goto LABEL_25;
        v49 = v44;
        if (v43[3] < v48)
        {
          sub_1B136C0B4(v48, 1);
          v50 = sub_1B12D372C(v35, v36);
          if ((v49 & 1) != (v51 & 1))
            goto LABEL_27;
          v45 = v50;
        }
        v52 = (_QWORD *)*a5;
        if ((v49 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v39 = (_QWORD *)(v52[7] + 16 * v45);
          swift_bridgeObjectRelease();
          *v39 = v37;
          v39[1] = v38;
        }
        else
        {
          v52[(v45 >> 6) + 8] |= 1 << v45;
          v53 = (uint64_t *)(v52[6] + 16 * v45);
          *v53 = v35;
          v53[1] = v36;
          v54 = (_QWORD *)(v52[7] + 16 * v45);
          *v54 = v37;
          v54[1] = v38;
          v55 = v52[2];
          v29 = __OFADD__(v55, 1);
          v56 = v55 + 1;
          if (v29)
            goto LABEL_26;
          v52[2] = v56;
        }
        v35 = sub_1B1371780();
        v36 = v40;
        v37 = v41;
        v38 = v42;
      }
      while (v40);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_1B12EACB8();
    return swift_release();
  }
  sub_1B136C0B4(v20, a4 & 1);
  v22 = sub_1B12D372C(v11, v12);
  if ((v21 & 1) == (v23 & 1))
  {
    v17 = v22;
    v24 = (_QWORD *)*a5;
    if ((v21 & 1) == 0)
      goto LABEL_11;
LABEL_9:
    swift_bridgeObjectRelease();
    v25 = (_QWORD *)(v24[7] + 16 * v17);
    swift_bridgeObjectRelease();
    *v25 = v13;
    v25[1] = v14;
    goto LABEL_13;
  }
LABEL_27:
  result = sub_1B1373270();
  __break(1u);
  return result;
}

uint64_t sub_1B137174C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  a2[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B1371780()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t *__return_ptr, _QWORD *);
  uint64_t result;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  _QWORD v23[4];

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = 16 * v6;
    v8 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v9 = *v8;
    v10 = v8[1];
    v11 = (uint64_t *)(*(_QWORD *)(v1 + 56) + v7);
    v12 = *v11;
    v13 = v11[1];
    v0[3] = v4;
    v0[4] = v5;
    v14 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v23[0] = v9;
    v23[1] = v10;
    v23[2] = v12;
    v23[3] = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(&v22, v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v22;
  }
  v16 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v17 = (unint64_t)(v0[2] + 64) >> 6;
    if (v16 < v17)
    {
      v18 = v0[1];
      v19 = *(_QWORD *)(v18 + 8 * v16);
      if (v19)
      {
LABEL_7:
        v5 = (v19 - 1) & v19;
        v6 = __clz(__rbit64(v19)) + (v16 << 6);
        v4 = v16;
        goto LABEL_3;
      }
      v20 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v17)
      {
        v19 = *(_QWORD *)(v18 + 8 * v20);
        if (v19)
        {
LABEL_10:
          v16 = v20;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v17)
        {
          v19 = *(_QWORD *)(v18 + 8 * (v3 + 3));
          if (v19)
          {
            v16 = v3 + 3;
            goto LABEL_7;
          }
          v20 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v17)
          {
            v19 = *(_QWORD *)(v18 + 8 * v20);
            if (v19)
              goto LABEL_10;
            v16 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v17)
            {
              v19 = *(_QWORD *)(v18 + 8 * v16);
              if (v19)
                goto LABEL_7;
              v4 = v17 - 1;
              v21 = v3 + 6;
              while (v17 != v21)
              {
                v19 = *(_QWORD *)(v18 + 8 * v21++);
                if (v19)
                {
                  v16 = v21 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

unint64_t sub_1B137191C()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1B12CF7F8(&qword_1EEF281F8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B1375E30;
  *(_QWORD *)(inited + 32) = sub_1B1372B98();
  *(_QWORD *)(inited + 40) = v1;
  *(_QWORD *)(inited + 48) = 0x30303066666623;
  *(_QWORD *)(inited + 56) = 0xE700000000000000;
  *(_QWORD *)(inited + 64) = sub_1B1372B98();
  *(_QWORD *)(inited + 72) = v2;
  *(_QWORD *)(inited + 80) = 0x30306666303023;
  *(_QWORD *)(inited + 88) = 0xE700000000000000;
  *(_QWORD *)(inited + 96) = sub_1B1372B98();
  *(_QWORD *)(inited + 104) = v3;
  *(_QWORD *)(inited + 112) = 0x66663030666623;
  *(_QWORD *)(inited + 120) = 0xE700000000000000;
  *(_QWORD *)(inited + 128) = sub_1B1372B98();
  *(_QWORD *)(inited + 136) = v4;
  *(_QWORD *)(inited + 144) = 0x66663030303823;
  *(_QWORD *)(inited + 152) = 0xE700000000000000;
  return sub_1B131A7C4(inited);
}

id sub_1B1371A0C()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if ((sub_1B1372C4C() & 1) == 0 || sub_1B1372C10() != 7)
    return 0;
  v0 = objc_allocWithZone(MEMORY[0x1E0CB3900]);
  swift_bridgeObjectRetain();
  v1 = (void *)sub_1B1372B74();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithString_, v1);

  sub_1B1372C1C();
  sub_1B1372F4C();
  v5[0] = 0;
  objc_msgSend(v2, sel_scanHexLongLong_, v5);
  if (!((LOBYTE(v5[0]) | BYTE1(v5[0])) | BYTE2(v5[0])))
  {

    return 0;
  }
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3658]), sel_initWithRed_green_blue_alpha_, (double)BYTE2(v5[0]) / 255.0, (double)BYTE1(v5[0]) / 255.0, (double)LOBYTE(v5[0]) / 255.0, 1.0);

  return v3;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_1B1371BC0()
{
  return MEMORY[0x1E0CADEE8]();
}

uint64_t sub_1B1371BCC()
{
  return MEMORY[0x1E0CADF08]();
}

uint64_t sub_1B1371BD8()
{
  return MEMORY[0x1E0CADF10]();
}

uint64_t sub_1B1371BE4()
{
  return MEMORY[0x1E0CADF18]();
}

uint64_t sub_1B1371BF0()
{
  return MEMORY[0x1E0CADF50]();
}

uint64_t sub_1B1371BFC()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1B1371C08()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1B1371C14()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1B1371C20()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1B1371C2C()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1B1371C38()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1B1371C44()
{
  return MEMORY[0x1E0CAE390]();
}

uint64_t sub_1B1371C50()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1B1371C5C()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1B1371C68()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1B1371C74()
{
  return MEMORY[0x1E0CAE668]();
}

uint64_t sub_1B1371C80()
{
  return MEMORY[0x1E0CAE690]();
}

uint64_t sub_1B1371C8C()
{
  return MEMORY[0x1E0CAE778]();
}

uint64_t sub_1B1371C98()
{
  return MEMORY[0x1E0CAE790]();
}

uint64_t sub_1B1371CA4()
{
  return MEMORY[0x1E0CAE878]();
}

uint64_t sub_1B1371CB0()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_1B1371CBC()
{
  return MEMORY[0x1E0DC19C0]();
}

uint64_t sub_1B1371CC8()
{
  return MEMORY[0x1E0DC19E0]();
}

uint64_t sub_1B1371CD4()
{
  return MEMORY[0x1E0CAEEE0]();
}

uint64_t sub_1B1371CE0()
{
  return MEMORY[0x1E0CAEF00]();
}

uint64_t sub_1B1371CEC()
{
  return MEMORY[0x1E0CAEF10]();
}

uint64_t sub_1B1371CF8()
{
  return MEMORY[0x1E0CAEF48]();
}

uint64_t sub_1B1371D04()
{
  return MEMORY[0x1E0CAEF60]();
}

uint64_t sub_1B1371D10()
{
  return MEMORY[0x1E0CAF240]();
}

uint64_t sub_1B1371D1C()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1B1371D28()
{
  return MEMORY[0x1E0CAF8B0]();
}

uint64_t sub_1B1371D34()
{
  return MEMORY[0x1E0DC1A18]();
}

uint64_t sub_1B1371D40()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1B1371D4C()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1B1371D58()
{
  return MEMORY[0x1E0CAFC08]();
}

uint64_t sub_1B1371D64()
{
  return MEMORY[0x1E0CAFC10]();
}

uint64_t sub_1B1371D70()
{
  return MEMORY[0x1E0CAFC18]();
}

uint64_t sub_1B1371D7C()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1B1371D88()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1B1371D94()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1B1371DA0()
{
  return MEMORY[0x1E0CAFF20]();
}

uint64_t sub_1B1371DAC()
{
  return MEMORY[0x1E0CAFF80]();
}

uint64_t sub_1B1371DB8()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1B1371DC4()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1B1371DD0()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1B1371DDC()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1B1371DE8()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1B1371DF4()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1B1371E00()
{
  return MEMORY[0x1E0CB03D0]();
}

uint64_t sub_1B1371E0C()
{
  return MEMORY[0x1E0CB0588]();
}

uint64_t sub_1B1371E18()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1B1371E24()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1B1371E30()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1B1371E3C()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1B1371E48()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1B1371E54()
{
  return MEMORY[0x1E0CB0700]();
}

uint64_t sub_1B1371E60()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t sub_1B1371E6C()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1B1371E78()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1B1371E84()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1B1371E90()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1B1371E9C()
{
  return MEMORY[0x1E0CB0830]();
}

uint64_t sub_1B1371EA8()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1B1371EB4()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1B1371EC0()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1B1371ECC()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1B1371ED8()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1B1371EE4()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1B1371EF0()
{
  return MEMORY[0x1E0CB0AC0]();
}

uint64_t sub_1B1371EFC()
{
  return MEMORY[0x1E0CB0AD8]();
}

uint64_t sub_1B1371F08()
{
  return MEMORY[0x1E0CB0AE8]();
}

uint64_t sub_1B1371F14()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1B1371F20()
{
  return MEMORY[0x1E0CB0D80]();
}

uint64_t sub_1B1371F2C()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_1B1371F38()
{
  return MEMORY[0x1E0CB0DF0]();
}

uint64_t sub_1B1371F44()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1B1371F50()
{
  return MEMORY[0x1E0CB15E8]();
}

uint64_t sub_1B1371F5C()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_1B1371F68()
{
  return MEMORY[0x1E0DC1A20]();
}

uint64_t sub_1B1371F74()
{
  return MEMORY[0x1E0DC1A30]();
}

uint64_t sub_1B1371F80()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_1B1371F8C()
{
  return MEMORY[0x1E0D81878]();
}

uint64_t sub_1B1371F98()
{
  return MEMORY[0x1E0D81890]();
}

uint64_t sub_1B1371FA4()
{
  return MEMORY[0x1E0D818A0]();
}

uint64_t sub_1B1371FB0()
{
  return MEMORY[0x1E0D818A8]();
}

uint64_t sub_1B1371FBC()
{
  return MEMORY[0x1E0D818B0]();
}

uint64_t sub_1B1371FC8()
{
  return MEMORY[0x1E0D818B8]();
}

uint64_t sub_1B1371FD4()
{
  return MEMORY[0x1E0D818C8]();
}

uint64_t sub_1B1371FE0()
{
  return MEMORY[0x1E0D818D0]();
}

uint64_t sub_1B1371FEC()
{
  return MEMORY[0x1E0D818D8]();
}

uint64_t sub_1B1371FF8()
{
  return MEMORY[0x1E0D818E0]();
}

uint64_t sub_1B1372004()
{
  return MEMORY[0x1E0D818E8]();
}

uint64_t sub_1B1372010()
{
  return MEMORY[0x1E0D818F0]();
}

uint64_t sub_1B137201C()
{
  return MEMORY[0x1E0D81960]();
}

uint64_t sub_1B1372028()
{
  return MEMORY[0x1E0D81968]();
}

uint64_t sub_1B1372034()
{
  return MEMORY[0x1E0D81970]();
}

uint64_t sub_1B1372040()
{
  return MEMORY[0x1E0D81978]();
}

uint64_t sub_1B137204C()
{
  return MEMORY[0x1E0D81980]();
}

uint64_t sub_1B1372058()
{
  return MEMORY[0x1E0D81998]();
}

uint64_t sub_1B1372064()
{
  return MEMORY[0x1E0D819A8]();
}

uint64_t sub_1B1372070()
{
  return MEMORY[0x1E0D819C0]();
}

uint64_t sub_1B137207C()
{
  return MEMORY[0x1E0D819D8]();
}

uint64_t sub_1B1372088()
{
  return MEMORY[0x1E0D819F0]();
}

uint64_t sub_1B1372094()
{
  return MEMORY[0x1E0D81A08]();
}

uint64_t sub_1B13720A0()
{
  return MEMORY[0x1E0D81A10]();
}

uint64_t sub_1B13720AC()
{
  return MEMORY[0x1E0D81A18]();
}

uint64_t sub_1B13720B8()
{
  return MEMORY[0x1E0D81A20]();
}

uint64_t sub_1B13720C4()
{
  return MEMORY[0x1E0D81A28]();
}

uint64_t sub_1B13720D0()
{
  return MEMORY[0x1E0D81A30]();
}

uint64_t sub_1B13720DC()
{
  return MEMORY[0x1E0D81A38]();
}

uint64_t sub_1B13720E8()
{
  return MEMORY[0x1E0D81A40]();
}

uint64_t sub_1B13720F4()
{
  return MEMORY[0x1E0D81A48]();
}

uint64_t sub_1B1372100()
{
  return MEMORY[0x1E0D81A50]();
}

uint64_t sub_1B137210C()
{
  return MEMORY[0x1E0D81A60]();
}

uint64_t sub_1B1372118()
{
  return MEMORY[0x1E0D81A68]();
}

uint64_t sub_1B1372124()
{
  return MEMORY[0x1E0D81A70]();
}

uint64_t sub_1B1372130()
{
  return MEMORY[0x1E0D81A78]();
}

uint64_t sub_1B137213C()
{
  return MEMORY[0x1E0D81A80]();
}

uint64_t sub_1B1372148()
{
  return MEMORY[0x1E0D81A98]();
}

uint64_t sub_1B1372154()
{
  return MEMORY[0x1E0D81AA0]();
}

uint64_t sub_1B1372160()
{
  return MEMORY[0x1E0D81AB0]();
}

uint64_t sub_1B137216C()
{
  return MEMORY[0x1E0D81AB8]();
}

uint64_t sub_1B1372178()
{
  return MEMORY[0x1E0D81AE0]();
}

uint64_t sub_1B1372184()
{
  return MEMORY[0x1E0D81AE8]();
}

uint64_t sub_1B1372190()
{
  return MEMORY[0x1E0D81AF0]();
}

uint64_t sub_1B137219C()
{
  return MEMORY[0x1E0D81AF8]();
}

uint64_t sub_1B13721A8()
{
  return MEMORY[0x1E0D81B00]();
}

uint64_t sub_1B13721B4()
{
  return MEMORY[0x1E0D81B10]();
}

uint64_t sub_1B13721C0()
{
  return MEMORY[0x1E0D81B18]();
}

uint64_t sub_1B13721CC()
{
  return MEMORY[0x1E0D81B20]();
}

uint64_t sub_1B13721D8()
{
  return MEMORY[0x1E0D81B28]();
}

uint64_t sub_1B13721E4()
{
  return MEMORY[0x1E0D81B30]();
}

uint64_t sub_1B13721F0()
{
  return MEMORY[0x1E0D81B38]();
}

uint64_t sub_1B13721FC()
{
  return MEMORY[0x1E0D81B40]();
}

uint64_t sub_1B1372208()
{
  return MEMORY[0x1E0D81B68]();
}

uint64_t sub_1B1372214()
{
  return MEMORY[0x1E0D81B78]();
}

uint64_t sub_1B1372220()
{
  return MEMORY[0x1E0D81B88]();
}

uint64_t sub_1B137222C()
{
  return MEMORY[0x1E0D81BA0]();
}

uint64_t sub_1B1372238()
{
  return MEMORY[0x1E0D81BA8]();
}

uint64_t sub_1B1372244()
{
  return MEMORY[0x1E0D81BB0]();
}

uint64_t sub_1B1372250()
{
  return MEMORY[0x1E0D81BC0]();
}

uint64_t sub_1B137225C()
{
  return MEMORY[0x1E0D81BD0]();
}

uint64_t sub_1B1372268()
{
  return MEMORY[0x1E0D81BE8]();
}

uint64_t sub_1B1372274()
{
  return MEMORY[0x1E0D81BF0]();
}

uint64_t sub_1B1372280()
{
  return MEMORY[0x1E0D81BF8]();
}

uint64_t sub_1B137228C()
{
  return MEMORY[0x1E0D81C00]();
}

uint64_t sub_1B1372298()
{
  return MEMORY[0x1E0D81C08]();
}

uint64_t sub_1B13722A4()
{
  return MEMORY[0x1E0D81C10]();
}

uint64_t sub_1B13722B0()
{
  return MEMORY[0x1E0D81C18]();
}

uint64_t sub_1B13722BC()
{
  return MEMORY[0x1E0D81C28]();
}

uint64_t sub_1B13722C8()
{
  return MEMORY[0x1E0D81C30]();
}

uint64_t sub_1B13722D4()
{
  return MEMORY[0x1E0D81C38]();
}

uint64_t sub_1B13722E0()
{
  return MEMORY[0x1E0D81C40]();
}

uint64_t sub_1B13722EC()
{
  return MEMORY[0x1E0D81C48]();
}

uint64_t sub_1B13722F8()
{
  return MEMORY[0x1E0D81C60]();
}

uint64_t sub_1B1372304()
{
  return MEMORY[0x1E0D81C68]();
}

uint64_t sub_1B1372310()
{
  return MEMORY[0x1E0D81CA0]();
}

uint64_t sub_1B137231C()
{
  return MEMORY[0x1E0D81CA8]();
}

uint64_t sub_1B1372328()
{
  return MEMORY[0x1E0D81CB0]();
}

uint64_t sub_1B1372334()
{
  return MEMORY[0x1E0D81CB8]();
}

uint64_t sub_1B1372340()
{
  return MEMORY[0x1E0D81CC0]();
}

uint64_t sub_1B137234C()
{
  return MEMORY[0x1E0D81CD0]();
}

uint64_t sub_1B1372358()
{
  return MEMORY[0x1E0D81CE0]();
}

uint64_t sub_1B1372364()
{
  return MEMORY[0x1E0D81D00]();
}

uint64_t sub_1B1372370()
{
  return MEMORY[0x1E0D81D08]();
}

uint64_t sub_1B137237C()
{
  return MEMORY[0x1E0D81D10]();
}

uint64_t sub_1B1372388()
{
  return MEMORY[0x1E0D81D18]();
}

uint64_t sub_1B1372394()
{
  return MEMORY[0x1E0D81D20]();
}

uint64_t sub_1B13723A0()
{
  return MEMORY[0x1E0D81D28]();
}

uint64_t sub_1B13723AC()
{
  return MEMORY[0x1E0D81D38]();
}

uint64_t sub_1B13723B8()
{
  return MEMORY[0x1E0D81D40]();
}

uint64_t sub_1B13723C4()
{
  return MEMORY[0x1E0D81D58]();
}

uint64_t sub_1B13723D0()
{
  return MEMORY[0x1E0D81D60]();
}

uint64_t sub_1B13723DC()
{
  return MEMORY[0x1E0D81D68]();
}

uint64_t sub_1B13723E8()
{
  return MEMORY[0x1E0D81D70]();
}

uint64_t sub_1B13723F4()
{
  return MEMORY[0x1E0D81D78]();
}

uint64_t sub_1B1372400()
{
  return MEMORY[0x1E0D81D80]();
}

uint64_t sub_1B137240C()
{
  return MEMORY[0x1E0D81D88]();
}

uint64_t sub_1B1372418()
{
  return MEMORY[0x1E0D81D90]();
}

uint64_t sub_1B1372424()
{
  return MEMORY[0x1E0D81D98]();
}

uint64_t sub_1B1372430()
{
  return MEMORY[0x1E0D81DA0]();
}

uint64_t sub_1B137243C()
{
  return MEMORY[0x1E0D81DB0]();
}

uint64_t sub_1B1372448()
{
  return MEMORY[0x1E0D81DC8]();
}

uint64_t sub_1B1372454()
{
  return MEMORY[0x1E0D81DD0]();
}

uint64_t sub_1B1372460()
{
  return MEMORY[0x1E0D81DD8]();
}

uint64_t sub_1B137246C()
{
  return MEMORY[0x1E0D81DE0]();
}

uint64_t sub_1B1372478()
{
  return MEMORY[0x1E0D81DE8]();
}

uint64_t sub_1B1372484()
{
  return MEMORY[0x1E0D81DF0]();
}

uint64_t sub_1B1372490()
{
  return MEMORY[0x1E0D81DF8]();
}

uint64_t sub_1B137249C()
{
  return MEMORY[0x1E0D81E00]();
}

uint64_t sub_1B13724A8()
{
  return MEMORY[0x1E0D81E08]();
}

uint64_t sub_1B13724B4()
{
  return MEMORY[0x1E0D81E10]();
}

uint64_t sub_1B13724C0()
{
  return MEMORY[0x1E0D81E18]();
}

uint64_t sub_1B13724CC()
{
  return MEMORY[0x1E0D81E20]();
}

uint64_t sub_1B13724D8()
{
  return MEMORY[0x1E0D81E28]();
}

uint64_t sub_1B13724E4()
{
  return MEMORY[0x1E0D81E30]();
}

uint64_t sub_1B13724F0()
{
  return MEMORY[0x1E0D81E38]();
}

uint64_t sub_1B13724FC()
{
  return MEMORY[0x1E0D81E40]();
}

uint64_t sub_1B1372508()
{
  return MEMORY[0x1E0D81E48]();
}

uint64_t sub_1B1372514()
{
  return MEMORY[0x1E0D81E50]();
}

uint64_t sub_1B1372520()
{
  return MEMORY[0x1E0D81E58]();
}

uint64_t sub_1B137252C()
{
  return MEMORY[0x1E0D81E60]();
}

uint64_t sub_1B1372538()
{
  return MEMORY[0x1E0D81E98]();
}

uint64_t sub_1B1372544()
{
  return MEMORY[0x1E0D81EA8]();
}

uint64_t sub_1B1372550()
{
  return MEMORY[0x1E0D81EB0]();
}

uint64_t sub_1B137255C()
{
  return MEMORY[0x1E0D81EB8]();
}

uint64_t sub_1B1372568()
{
  return MEMORY[0x1E0D81ED8]();
}

uint64_t sub_1B1372574()
{
  return MEMORY[0x1E0D81EE0]();
}

uint64_t sub_1B1372580()
{
  return MEMORY[0x1E0D81EE8]();
}

uint64_t sub_1B137258C()
{
  return MEMORY[0x1E0D81EF0]();
}

uint64_t sub_1B1372598()
{
  return MEMORY[0x1E0D81EF8]();
}

uint64_t sub_1B13725A4()
{
  return MEMORY[0x1E0D81F00]();
}

uint64_t sub_1B13725B0()
{
  return MEMORY[0x1E0D81F08]();
}

uint64_t sub_1B13725BC()
{
  return MEMORY[0x1E0D81F10]();
}

uint64_t sub_1B13725C8()
{
  return MEMORY[0x1E0D81F50]();
}

uint64_t sub_1B13725D4()
{
  return MEMORY[0x1E0D81F78]();
}

uint64_t sub_1B13725E0()
{
  return MEMORY[0x1E0D81F80]();
}

uint64_t sub_1B13725EC()
{
  return MEMORY[0x1E0D81F98]();
}

uint64_t sub_1B13725F8()
{
  return MEMORY[0x1E0D820B8]();
}

uint64_t sub_1B1372604()
{
  return MEMORY[0x1E0D82148]();
}

uint64_t sub_1B1372610()
{
  return MEMORY[0x1E0D82150]();
}

uint64_t sub_1B137261C()
{
  return MEMORY[0x1E0D82158]();
}

uint64_t sub_1B1372628()
{
  return MEMORY[0x1E0D82160]();
}

uint64_t sub_1B1372634()
{
  return MEMORY[0x1E0D82168]();
}

uint64_t sub_1B1372640()
{
  return MEMORY[0x1E0D82170]();
}

uint64_t sub_1B137264C()
{
  return MEMORY[0x1E0D82178]();
}

uint64_t sub_1B1372658()
{
  return MEMORY[0x1E0D82180]();
}

uint64_t sub_1B1372664()
{
  return MEMORY[0x1E0D82188]();
}

uint64_t sub_1B1372670()
{
  return MEMORY[0x1E0D82190]();
}

uint64_t sub_1B137267C()
{
  return MEMORY[0x1E0D82198]();
}

uint64_t sub_1B1372688()
{
  return MEMORY[0x1E0D821A0]();
}

uint64_t sub_1B1372694()
{
  return MEMORY[0x1E0D821A8]();
}

uint64_t sub_1B13726A0()
{
  return MEMORY[0x1E0D821B0]();
}

uint64_t sub_1B13726AC()
{
  return MEMORY[0x1E0D821C0]();
}

uint64_t sub_1B13726B8()
{
  return MEMORY[0x1E0D821D0]();
}

uint64_t sub_1B13726C4()
{
  return MEMORY[0x1E0D821D8]();
}

uint64_t sub_1B13726D0()
{
  return MEMORY[0x1E0D821F8]();
}

uint64_t sub_1B13726DC()
{
  return MEMORY[0x1E0D82200]();
}

uint64_t sub_1B13726E8()
{
  return MEMORY[0x1E0D82208]();
}

uint64_t sub_1B13726F4()
{
  return MEMORY[0x1E0D82210]();
}

uint64_t sub_1B1372700()
{
  return MEMORY[0x1E0D82218]();
}

uint64_t sub_1B137270C()
{
  return MEMORY[0x1E0D82228]();
}

uint64_t sub_1B1372718()
{
  return MEMORY[0x1E0D82238]();
}

uint64_t sub_1B1372724()
{
  return MEMORY[0x1E0D82240]();
}

uint64_t sub_1B1372730()
{
  return MEMORY[0x1E0D82248]();
}

uint64_t sub_1B137273C()
{
  return MEMORY[0x1E0D82250]();
}

uint64_t sub_1B1372748()
{
  return MEMORY[0x1E0D82258]();
}

uint64_t sub_1B1372754()
{
  return MEMORY[0x1E0D82260]();
}

uint64_t sub_1B1372760()
{
  return MEMORY[0x1E0D82268]();
}

uint64_t sub_1B137276C()
{
  return MEMORY[0x1E0D82270]();
}

uint64_t sub_1B1372778()
{
  return MEMORY[0x1E0D82278]();
}

uint64_t sub_1B1372784()
{
  return MEMORY[0x1E0D82288]();
}

uint64_t sub_1B1372790()
{
  return MEMORY[0x1E0D82290]();
}

uint64_t sub_1B137279C()
{
  return MEMORY[0x1E0D82298]();
}

uint64_t sub_1B13727A8()
{
  return MEMORY[0x1E0D822A0]();
}

uint64_t sub_1B13727B4()
{
  return MEMORY[0x1E0D822A8]();
}

uint64_t sub_1B13727C0()
{
  return MEMORY[0x1E0D822B0]();
}

uint64_t sub_1B13727CC()
{
  return MEMORY[0x1E0D822B8]();
}

uint64_t sub_1B13727D8()
{
  return MEMORY[0x1E0D822C0]();
}

uint64_t sub_1B13727E4()
{
  return MEMORY[0x1E0D822C8]();
}

uint64_t sub_1B13727F0()
{
  return MEMORY[0x1E0D822D0]();
}

uint64_t sub_1B13727FC()
{
  return MEMORY[0x1E0D822D8]();
}

uint64_t sub_1B1372808()
{
  return MEMORY[0x1E0D822E0]();
}

uint64_t sub_1B1372814()
{
  return MEMORY[0x1E0D822F0]();
}

uint64_t sub_1B1372820()
{
  return MEMORY[0x1E0D822F8]();
}

uint64_t sub_1B137282C()
{
  return MEMORY[0x1E0D82300]();
}

uint64_t sub_1B1372838()
{
  return MEMORY[0x1E0D82308]();
}

uint64_t sub_1B1372844()
{
  return MEMORY[0x1E0D82310]();
}

uint64_t sub_1B1372850()
{
  return MEMORY[0x1E0D82318]();
}

uint64_t sub_1B137285C()
{
  return MEMORY[0x1E0D82320]();
}

uint64_t sub_1B1372868()
{
  return MEMORY[0x1E0D82328]();
}

uint64_t sub_1B1372874()
{
  return MEMORY[0x1E0D82330]();
}

uint64_t sub_1B1372880()
{
  return MEMORY[0x1E0D82338]();
}

uint64_t sub_1B137288C()
{
  return MEMORY[0x1E0D82340]();
}

uint64_t sub_1B1372898()
{
  return MEMORY[0x1E0D82348]();
}

uint64_t sub_1B13728A4()
{
  return MEMORY[0x1E0D82358]();
}

uint64_t sub_1B13728B0()
{
  return MEMORY[0x1E0D82360]();
}

uint64_t sub_1B13728BC()
{
  return MEMORY[0x1E0D82370]();
}

uint64_t sub_1B13728C8()
{
  return MEMORY[0x1E0D82378]();
}

uint64_t sub_1B13728D4()
{
  return MEMORY[0x1E0D82388]();
}

uint64_t sub_1B13728E0()
{
  return MEMORY[0x1E0D82390]();
}

uint64_t sub_1B13728EC()
{
  return MEMORY[0x1E0D82398]();
}

uint64_t sub_1B13728F8()
{
  return MEMORY[0x1E0D823A0]();
}

uint64_t sub_1B1372904()
{
  return MEMORY[0x1E0D823A8]();
}

uint64_t sub_1B1372910()
{
  return MEMORY[0x1E0D823B0]();
}

uint64_t sub_1B137291C()
{
  return MEMORY[0x1E0D823B8]();
}

uint64_t sub_1B1372928()
{
  return MEMORY[0x1E0D823C0]();
}

uint64_t sub_1B1372934()
{
  return MEMORY[0x1E0D823C8]();
}

uint64_t sub_1B1372940()
{
  return MEMORY[0x1E0D823D0]();
}

uint64_t sub_1B137294C()
{
  return MEMORY[0x1E0D823D8]();
}

uint64_t sub_1B1372958()
{
  return MEMORY[0x1E0D823E0]();
}

uint64_t sub_1B1372964()
{
  return MEMORY[0x1E0D823E8]();
}

uint64_t sub_1B1372970()
{
  return MEMORY[0x1E0D823F0]();
}

uint64_t sub_1B137297C()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1B1372988()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1B1372994()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t sub_1B13729A0()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_1B13729AC()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t sub_1B13729B8()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1B13729C4()
{
  return MEMORY[0x1E0DF2130]();
}

uint64_t sub_1B13729D0()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_1B13729DC()
{
  return MEMORY[0x1E0DF2158]();
}

uint64_t sub_1B13729E8()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_1B13729F4()
{
  return MEMORY[0x1E0DF2198]();
}

uint64_t sub_1B1372A00()
{
  return MEMORY[0x1E0DF2218]();
}

uint64_t sub_1B1372A0C()
{
  return MEMORY[0x1E0DF2220]();
}

uint64_t sub_1B1372A18()
{
  return MEMORY[0x1E0DF2228]();
}

uint64_t sub_1B1372A24()
{
  return MEMORY[0x1E0DF2238]();
}

uint64_t sub_1B1372A30()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1B1372A3C()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1B1372A48()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1B1372A54()
{
  return MEMORY[0x1E0DC20C8]();
}

uint64_t sub_1B1372A60()
{
  return MEMORY[0x1E0DC2168]();
}

uint64_t sub_1B1372A6C()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1B1372A78()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1B1372A84()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1B1372A90()
{
  return MEMORY[0x1E0DEF590]();
}

uint64_t sub_1B1372A9C()
{
  return MEMORY[0x1E0DEF598]();
}

uint64_t sub_1B1372AA8()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1B1372AB4()
{
  return MEMORY[0x1E0DEF688]();
}

uint64_t sub_1B1372AC0()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1B1372ACC()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1B1372AD8()
{
  return MEMORY[0x1E0DEF6F8]();
}

uint64_t sub_1B1372AE4()
{
  return MEMORY[0x1E0DEF710]();
}

uint64_t sub_1B1372AF0()
{
  return MEMORY[0x1E0DEF728]();
}

uint64_t sub_1B1372AFC()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1B1372B08()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1B1372B14()
{
  return MEMORY[0x1E0CB17F8]();
}

uint64_t sub_1B1372B20()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1B1372B2C()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1B1372B38()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1B1372B44()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1B1372B50()
{
  return MEMORY[0x1E0DEA1C8]();
}

uint64_t sub_1B1372B5C()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1B1372B68()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1B1372B74()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B1372B80()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1B1372B8C()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1B1372B98()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B1372BA4()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1B1372BB0()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1B1372BBC()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1B1372BC8()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1B1372BD4()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1B1372BE0()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1B1372BEC()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1B1372BF8()
{
  return MEMORY[0x1E0DEA6F0]();
}

uint64_t sub_1B1372C04()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1B1372C10()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1B1372C1C()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_1B1372C28()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_1B1372C34()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B1372C40()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1B1372C4C()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1B1372C58()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1B1372C64()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1B1372C70()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1B1372C7C()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B1372C88()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B1372C94()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1B1372CA0()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1B1372CAC()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1B1372CB8()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1B1372CC4()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1B1372CD0()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1B1372CDC()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1B1372CE8()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1B1372CF4()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1B1372D00()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1B1372D0C()
{
  return MEMORY[0x1E0DF0860]();
}

uint64_t sub_1B1372D18()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1B1372D24()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1B1372D30()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1B1372D3C()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1B1372D48()
{
  return MEMORY[0x1E0DEB2A8]();
}

uint64_t sub_1B1372D54()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1B1372D60()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1B1372D6C()
{
  return MEMORY[0x1E0CB1D80]();
}

uint64_t sub_1B1372D78()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1B1372D84()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1B1372D90()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1B1372D9C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1B1372DA8()
{
  return MEMORY[0x1E0CB1E68]();
}

uint64_t sub_1B1372DB4()
{
  return MEMORY[0x1E0CB1E70]();
}

uint64_t sub_1B1372DC0()
{
  return MEMORY[0x1E0DEF7E8]();
}

uint64_t sub_1B1372DCC()
{
  return MEMORY[0x1E0D82400]();
}

uint64_t sub_1B1372DD8()
{
  return MEMORY[0x1E0DEF800]();
}

uint64_t sub_1B1372DE4()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1B1372DF0()
{
  return MEMORY[0x1E0DEF848]();
}

uint64_t sub_1B1372DFC()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1B1372E08()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1B1372E14()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1B1372E20()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1B1372E2C()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1B1372E38()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1B1372E44()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1B1372E50()
{
  return MEMORY[0x1E0DEFA68]();
}

uint64_t sub_1B1372E5C()
{
  return MEMORY[0x1E0DEFA70]();
}

uint64_t sub_1B1372E68()
{
  return MEMORY[0x1E0C9B9B8]();
}

uint64_t sub_1B1372E74()
{
  return MEMORY[0x1E0C9B9E8]();
}

uint64_t sub_1B1372E80()
{
  return MEMORY[0x1E0DC2FC0]();
}

uint64_t sub_1B1372E8C()
{
  return MEMORY[0x1E0CB20E0]();
}

uint64_t sub_1B1372E98()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1B1372EA4()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1B1372EB0()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t sub_1B1372EBC()
{
  return MEMORY[0x1E0CB2130]();
}

uint64_t sub_1B1372EC8()
{
  return MEMORY[0x1E0DC3010]();
}

uint64_t sub_1B1372ED4()
{
  return MEMORY[0x1E0DC3070]();
}

uint64_t sub_1B1372EE0()
{
  return MEMORY[0x1E0DC3080]();
}

uint64_t sub_1B1372EEC()
{
  return MEMORY[0x1E0DC3110]();
}

uint64_t sub_1B1372EF8()
{
  return MEMORY[0x1E0DC3128]();
}

uint64_t sub_1B1372F04()
{
  return MEMORY[0x1E0DC31C0]();
}

uint64_t sub_1B1372F10()
{
  return MEMORY[0x1E0DC31D8]();
}

uint64_t sub_1B1372F1C()
{
  return MEMORY[0x1E0DC3228]();
}

uint64_t sub_1B1372F28()
{
  return MEMORY[0x1E0DC3238]();
}

uint64_t sub_1B1372F34()
{
  return MEMORY[0x1E0DC3240]();
}

uint64_t sub_1B1372F40()
{
  return MEMORY[0x1E0DC3248]();
}

uint64_t sub_1B1372F4C()
{
  return MEMORY[0x1E0CB2378]();
}

uint64_t sub_1B1372F58()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t sub_1B1372F64()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_1B1372F70()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1B1372F7C()
{
  return MEMORY[0x1E0DEB930]();
}

uint64_t sub_1B1372F88()
{
  return MEMORY[0x1E0DEB938]();
}

uint64_t sub_1B1372F94()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1B1372FA0()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1B1372FAC()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1B1372FB8()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1B1372FC4()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1B1372FD0()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1B1372FDC()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1B1372FE8()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1B1372FF4()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1B1373000()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1B137300C()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1B1373018()
{
  return MEMORY[0x1E0DEC0B8]();
}

uint64_t sub_1B1373024()
{
  return MEMORY[0x1E0DEC0C8]();
}

uint64_t sub_1B1373030()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1B137303C()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1B1373048()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1B1373054()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1B1373060()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1B137306C()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1B1373078()
{
  return MEMORY[0x1E0DEC120]();
}

uint64_t sub_1B1373084()
{
  return MEMORY[0x1E0DEC128]();
}

uint64_t sub_1B1373090()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1B137309C()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1B13730A8()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1B13730B4()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1B13730C0()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1B13730CC()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1B13730D8()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1B13730E4()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1B13730F0()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1B13730FC()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_1B1373108()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1B1373114()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1B1373120()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B137312C()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1B1373138()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1B1373144()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1B1373150()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1B137315C()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1B1373168()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1B1373174()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1B1373180()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1B137318C()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1B1373198()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_1B13731A4()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1B13731B0()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1B13731BC()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1B13731C8()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1B13731D4()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1B13731E0()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1B13731EC()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1B13731F8()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1B1373204()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1B1373210()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1B137321C()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1B1373228()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1B1373234()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B1373240()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1B137324C()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1B1373258()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1B1373264()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1B1373270()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1B137327C()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1B1373288()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1B1373294()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1B13732A0()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1B13732AC()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1B13732B8()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1B13732C4()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B13732D0()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1B13732DC()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1B13732E8()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1B13732F4()
{
  return MEMORY[0x1E0CB2710]();
}

uint64_t sub_1B1373300()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1B137330C()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1B1373318()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1B1373324()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t APSimulateCrash()
{
  return MEMORY[0x1E0CF1928]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x1E0C9D568](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CreateDiagnosticReport()
{
  return MEMORY[0x1E0CF1930]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1E0DC4500]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1E0DC4548]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x1E0DC4570]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x1E0DC4598](*(_QWORD *)&notification, argument);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1E0DE7A60](cls, protocol);
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
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

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassFromObject()
{
  return MEMORY[0x1E0DEECD0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1E0DEED80]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

