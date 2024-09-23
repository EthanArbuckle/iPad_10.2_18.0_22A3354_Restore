SiriAutoCompleteAPI::AutoCompletePhraseSource_optional __swiftcall AutoCompletePhraseSource.init(rawValue:)(Swift::Int64 rawValue)
{
  char *v1;
  char v2;

  v2 = rawValue - 1;
  if ((unint64_t)(rawValue - 1) >= 8)
    v2 = 8;
  *v1 = v2;
  return (SiriAutoCompleteAPI::AutoCompletePhraseSource_optional)rawValue;
}

uint64_t AutoCompletePhraseSource.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0 + 1;
}

BOOL sub_24613E410(char *a1, char *a2)
{
  return sub_24613E41C(*a1, *a2);
}

BOOL sub_24613E41C(char a1, char a2)
{
  return a1 == a2;
}

void sub_24613E42C(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_24613E478(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_24613E558 + 4 * byte_246156428[a2]))(0x657361726870);
}

uint64_t sub_24613E558(uint64_t a1)
{
  uint64_t v1;
  char v3;

  if (a1 == 0x657361726870 && v1 == 0xE600000000000000)
    v3 = 1;
  else
    v3 = sub_246155F74();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_24613E664()
{
  return sub_24613E66C();
}

uint64_t sub_24613E66C()
{
  sub_246155FEC();
  sub_246156004();
  return sub_246156010();
}

uint64_t sub_24613E6B4(char a1)
{
  _BYTE v3[72];

  sub_246155FEC();
  sub_24613E700((uint64_t)v3, a1);
  return sub_246156010();
}

uint64_t sub_24613E6F8()
{
  return sub_24613E81C();
}

void sub_24613E700(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_24613E744()
{
  sub_246155C2C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24613E81C()
{
  return sub_246156004();
}

uint64_t sub_24613E844()
{
  return sub_24613E84C();
}

uint64_t sub_24613E84C()
{
  sub_246155FEC();
  sub_246156004();
  return sub_246156010();
}

uint64_t sub_24613E890(uint64_t a1, char a2)
{
  _BYTE v4[72];

  sub_246155FEC();
  sub_24613E700((uint64_t)v4, a2);
  return sub_246156010();
}

SiriAutoCompleteAPI::AutoCompletePhraseSource_optional sub_24613E8D0(Swift::Int64 *a1)
{
  return AutoCompletePhraseSource.init(rawValue:)(*a1);
}

uint64_t sub_24613E8D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = AutoCompletePhraseSource.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_24613E8FC()
{
  sub_24614214C();
  return sub_246155CC8();
}

uint64_t sub_24613E958()
{
  sub_24614214C();
  return sub_246155CBC();
}

SiriAutoCompleteAPI::AutoCompleteTableColumnNames_optional __swiftcall AutoCompleteTableColumnNames.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  char v4;
  SiriAutoCompleteAPI::AutoCompleteTableColumnNames_optional result;

  v2 = v1;
  v3 = sub_246155EC0();
  OUTLINED_FUNCTION_38();
  v4 = 8;
  if (v3 < 8)
    v4 = v3;
  *v2 = v4;
  OUTLINED_FUNCTION_36();
  return result;
}

uint64_t AutoCompleteTableColumnNames.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24613EA24 + 4 * byte_246156438[*v0]))(0xD000000000000010, 0x80000002461570D0);
}

uint64_t sub_24613EA24()
{
  return 0x657361726870;
}

uint64_t sub_24613EA38()
{
  return 0x6449656C646E7562;
}

uint64_t sub_24613EA50()
{
  return 0x656372756F73;
}

uint64_t sub_24613EA64()
{
  return 0x6E65644964697575;
}

uint64_t sub_24613EA88()
{
  return 0x72656E6547776B7ALL;
}

uint64_t sub_24613EAAC()
{
  return 0x7A696C616D726F6ELL;
}

uint64_t sub_24613EAD0()
{
  return 0x746E756F43706174;
}

void sub_24613EAE8(char *a1)
{
  sub_24613E42C(*a1);
}

uint64_t sub_24613EAF4()
{
  char *v0;

  return sub_24613E6B4(*v0);
}

void sub_24613EAFC(uint64_t a1)
{
  char *v1;

  sub_24613E700(a1, *v1);
}

uint64_t sub_24613EB04(uint64_t a1)
{
  char *v1;

  return sub_24613E890(a1, *v1);
}

SiriAutoCompleteAPI::AutoCompleteTableColumnNames_optional sub_24613EB0C(Swift::String *a1)
{
  return AutoCompleteTableColumnNames.init(rawValue:)(*a1);
}

uint64_t sub_24613EB18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = AutoCompleteTableColumnNames.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_24613EB3C(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  sub_24613EB70();
  *a1 = v2;
  a1[1] = v3;
}

void sub_24613EB64(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_24613EC48(a1, a2, a3, a4, sub_24613EBA0);
}

void sub_24613EB70()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_20();
}

void sub_24613EBA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  OUTLINED_FUNCTION_1();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5();
}

void sub_24613EBE0()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_11();
}

void sub_24613EC14(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  sub_24613EC80();
  *a1 = v2;
  a1[1] = v3;
}

void sub_24613EC3C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_24613EC48(a1, a2, a3, a4, sub_24613ECB0);
}

void sub_24613EC48(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;

  v7 = *a1;
  v6 = a1[1];
  swift_bridgeObjectRetain();
  a5(v7, v6);
  OUTLINED_FUNCTION_36();
}

void sub_24613EC80()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_20();
}

void sub_24613ECB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  OUTLINED_FUNCTION_1();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5();
}

void sub_24613ECF0()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_11();
}

void AutoCompletePhrase.bundleId.getter()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11();
}

uint64_t AutoCompletePhrase.iconInfo.getter()
{
  return sub_24613EDB0((uint64_t)&OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_iconInfo, (void (*)(_QWORD))MEMORY[0x24BEA75F0]);
}

void AutoCompletePhrase.actionIdentifier.getter()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11();
}

void AutoCompletePhrase.source.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
}

uint64_t AutoCompletePhrase.uuidIdentifier.getter()
{
  return sub_24613EDB0((uint64_t)&OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_uuidIdentifier, (void (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

uint64_t sub_24613EDB0(uint64_t a1, void (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);

  a2(0);
  v2 = OUTLINED_FUNCTION_16();
  return v3(v2);
}

void sub_24613EDEC(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  sub_24613EE50();
  *a1 = v2;
  a1[1] = v3;
}

void sub_24613EE14(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  sub_24613EE94(v1, v2);
}

void sub_24613EE50()
{
  OUTLINED_FUNCTION_0();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_20();
}

void sub_24613EE94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_zkwGenerationId);
  OUTLINED_FUNCTION_1();
  *v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5();
}

void sub_24613EEE0()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_11();
}

uint64_t sub_24613EF1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_24613EF7C();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

void sub_24613EF4C(uint64_t a1)
{
  sub_24613EFBC(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_24613EF7C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_normalizedScore;
  OUTLINED_FUNCTION_0();
  return *(_QWORD *)v1;
}

void sub_24613EFBC(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = v2 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_normalizedScore;
  OUTLINED_FUNCTION_1();
  *(_QWORD *)v5 = a1;
  *(_BYTE *)(v5 + 8) = a2 & 1;
  OUTLINED_FUNCTION_5();
}

void sub_24613F008()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_11();
}

uint64_t sub_24613F044@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_24613F090();
  *a1 = result;
  return result;
}

void sub_24613F06C(uint64_t *a1)
{
  sub_24613F0CC(*a1);
}

uint64_t sub_24613F090()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_tapCount;
  OUTLINED_FUNCTION_0();
  return *(_QWORD *)v1;
}

void sub_24613F0CC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_tapCount);
  OUTLINED_FUNCTION_1();
  *v3 = a1;
  OUTLINED_FUNCTION_20();
}

void sub_24613F108()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_11();
}

void sub_24613F144(uint64_t a1@<X8>)
{
  sub_24613F1E8(a1);
}

void sub_24613F164(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C8D8);
  MEMORY[0x24BDAC7A8]();
  sub_24613FCE4(a1, (uint64_t)&v3 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_25441C8D8);
  sub_24613F270();
}

void sub_24613F1E8(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_recentTapTimeStamp;
  OUTLINED_FUNCTION_0();
  sub_24613FCE4(v3, a1, &qword_25441C8D8);
  OUTLINED_FUNCTION_20();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249551420]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_24613F270()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_1();
  v0 = OUTLINED_FUNCTION_16();
  sub_24613F2B8(v0, v1);
  swift_endAccess();
  OUTLINED_FUNCTION_20();
}

uint64_t sub_24613F2B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C8D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_24613F300()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_11();
}

char *sub_24613F33C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, char *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned __int8 a16)
{
  char *v16;
  char *v17;
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
  char *v31;
  char v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  void (*v55)(char *, char *, uint64_t);
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  char v64;
  unint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v75;
  uint64_t *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  unint64_t v87;
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

  v17 = v16;
  v92 = a7;
  v93 = a8;
  v87 = a6;
  v88 = a1;
  v90 = a3;
  v91 = a4;
  v89 = a2;
  v86 = a16;
  v84 = a14;
  v85 = a15;
  v83 = a13;
  v94 = a11;
  v95 = a12;
  v97 = a10;
  v79 = sub_246155B90();
  v78 = *(_QWORD *)(v79 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v77 = (char *)&v75 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C910);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v21 = (char *)&v75 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_246155BCC();
  v96 = *(_QWORD *)(v22 - 8);
  v23 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v80 = (char *)&v75 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v76 = (uint64_t *)((char *)&v75 - v26);
  MEMORY[0x24BDAC7A8](v25);
  v81 = (char *)&v75 - v27;
  v28 = sub_246155A4C();
  v29 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v31 = (char *)&v75 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = *a9;
  v33 = &v17[OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_zkwGenerationId];
  *(_QWORD *)v33 = 0;
  *((_QWORD *)v33 + 1) = 0;
  v34 = &v17[OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_normalizedScore];
  *(_QWORD *)v34 = 0;
  v34[8] = 1;
  v35 = &v17[OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_recentTapTimeStamp];
  v36 = sub_246155A1C();
  v37 = (uint64_t)v35;
  v38 = v87;
  __swift_storeEnumTagSinglePayload(v37, 1, 1, v36);
  v39 = v89;
  *((_QWORD *)v17 + 2) = v88;
  *((_QWORD *)v17 + 3) = v39;
  v40 = v91;
  *((_QWORD *)v17 + 4) = v90;
  *((_QWORD *)v17 + 5) = v40;
  v82 = a5;
  *((_QWORD *)v17 + 6) = a5;
  *((_QWORD *)v17 + 7) = v38;
  v41 = &v17[OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier];
  v42 = v93;
  *(_QWORD *)v41 = v92;
  *((_QWORD *)v41 + 1) = v42;
  swift_bridgeObjectRetain();
  sub_246155A40();
  v43 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
  v44 = v97;
  v43(&v17[OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_uuidIdentifier], v31, v28);
  v17[OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source] = v32;
  v45 = v22;
  swift_beginAccess();
  v46 = v95;
  *(_QWORD *)v33 = v94;
  *((_QWORD *)v33 + 1) = v46;
  swift_bridgeObjectRelease();
  sub_24613FCE4(v44, (uint64_t)v21, &qword_25441C910);
  if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, v22) != 1)
  {
    sub_24613FD20(v44, &qword_25441C910);
    swift_bridgeObjectRelease();
    v55 = *(void (**)(char *, char *, uint64_t))(v96 + 32);
    v56 = v81;
    v55(v81, v21, v45);
    v55(&v17[OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_iconInfo], v56, v45);
LABEL_10:
    v49 = v86;
    v51 = v84;
    v50 = v85;
    v52 = v83;
    v53 = 0x25441C000;
    v54 = 0x25441C000;
    goto LABEL_15;
  }
  v47 = v96;
  sub_24613FD20((uint64_t)v21, &qword_25441C910);
  v48 = HIBYTE(v38) & 0xF;
  if ((v38 & 0x2000000000000000) == 0)
    v48 = v82 & 0xFFFFFFFFFFFFLL;
  if (!v48)
  {
    swift_bridgeObjectRelease();
    v57 = v78;
    v58 = v77;
    v59 = v79;
    (*(void (**)(char *, _QWORD, uint64_t))(v78 + 104))(v77, *MEMORY[0x24BEA7408], v79);
    v60 = sub_246155B84();
    v62 = v61;
    sub_24613FD20(v44, &qword_25441C910);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v58, v59);
    v63 = v76;
    *v76 = v60;
    v63[1] = v62;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v47 + 104))(v63, *MEMORY[0x24BEA75E8], v45);
    (*(void (**)(char *, uint64_t *, uint64_t))(v47 + 32))(&v17[OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_iconInfo], v63, v45);
    goto LABEL_10;
  }
  if (v82 == 0xD000000000000017 && v38 == 0x8000000246157190)
  {
    swift_bridgeObjectRelease();
    v49 = v86;
    v51 = v84;
    v50 = v85;
    v52 = v83;
    v53 = 0x25441C000;
    v54 = 0x25441C000;
  }
  else
  {
    v64 = sub_246155F74();
    v49 = v86;
    v65 = v38;
    v51 = v84;
    v50 = v85;
    v52 = v83;
    v53 = 0x25441C000uLL;
    v54 = 0x25441C000uLL;
    if ((v64 & 1) == 0)
    {
      sub_24613FD20(v97, &qword_25441C910);
      v71 = &v17[OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_iconInfo];
      *(_QWORD *)v71 = v82;
      *((_QWORD *)v71 + 1) = v65;
      (*(void (**)(void))(v47 + 104))();
      goto LABEL_15;
    }
    swift_bridgeObjectRelease();
  }
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754D5D0);
  v67 = v80;
  v68 = (uint64_t)&v80[*(int *)(v66 + 48)];
  sub_24613FD20(v97, &qword_25441C910);
  *v67 = 0x69662E656E6F6870;
  v67[1] = 0xEA00000000006C6CLL;
  v69 = sub_246155BC0();
  __swift_storeEnumTagSinglePayload(v68, 1, 1, v69);
  v70 = v96;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v96 + 104))(v67, *MEMORY[0x24BEA75E0], v45);
  (*(void (**)(char *, _QWORD *, uint64_t))(v70 + 32))(&v17[OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_iconInfo], v67, v45);
LABEL_15:
  *(_QWORD *)&v17[OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_tapCount] = v52;
  v72 = (uint64_t)&v17[*(_QWORD *)(v54 + 3320)];
  swift_beginAccess();
  sub_24613F2B8(v51, v72);
  swift_endAccess();
  v73 = &v17[*(_QWORD *)(v53 + 3296)];
  swift_beginAccess();
  *(_QWORD *)v73 = v50;
  v73[8] = v49 & 1;
  return v17;
}

char *AutoCompletePhrase.__allocating_init(phrase:bundleId:actionIdentifier:source:iconInfo:zkwGenerationId:tapCount:recentTapTimeStamp:normalizedScore:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char v34;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C8D8);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_10();
  v19 = v18 - v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C910);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_10();
  v23 = v22 - v21;
  v24 = *a7;
  OUTLINED_FUNCTION_42();
  v25 = sub_24613FB30();
  v27 = v26;
  OUTLINED_FUNCTION_45();
  v34 = v24;
  sub_24613FCE4(a8, v23, &qword_25441C910);
  sub_24613FCE4(a12, v19, &qword_25441C8D8);
  swift_allocObject();
  swift_bridgeObjectRetain();
  v28 = sub_24613F33C(v25, v27, v25, v27, a3, a4, a5, a6, &v34, v23, a9, a10, a11, v19, a13, a14 & 1);
  sub_24613FD20(a12, &qword_25441C8D8);
  sub_24613FD20(a8, &qword_25441C910);
  return v28;
}

uint64_t type metadata accessor for AutoCompletePhrase()
{
  uint64_t result;

  result = qword_25441C948;
  if (!qword_25441C948)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24613FB30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  void *v9;
  void (*v10)(char *, uint64_t);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[3];
  int v21;

  v0 = sub_246155938();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v20 - v5;
  sub_246142194(&qword_25441C8C8, v7, MEMORY[0x24BDCB778]);
  sub_246155DD0();
  v21 = 46;
  sub_246155DC4();
  v8 = (void *)sub_246155C38();
  sub_24615592C();
  v9 = (void *)sub_246155920();
  v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v4, v0);
  v11 = objc_msgSend(v8, sel_stringByTrimmingCharactersInSet_, v9);

  v12 = sub_246155C44();
  v14 = v13;

  v20[1] = v12;
  v20[2] = v14;
  sub_24613FF7C();
  v15 = sub_246155DB8();
  v17 = v16;
  OUTLINED_FUNCTION_45();
  v18 = sub_246140330(v15, v17);
  swift_bridgeObjectRelease();
  v10(v6, v0);
  return v18;
}

void sub_24613FCE4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a3);
  v3 = OUTLINED_FUNCTION_16();
  v4(v3);
  OUTLINED_FUNCTION_11();
}

void sub_24613FD20(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_8(v2);
  OUTLINED_FUNCTION_11();
}

uint64_t sub_24613FD48()
{
  sub_246155E00();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0();
  swift_bridgeObjectRetain();
  sub_246155C80();
  OUTLINED_FUNCTION_45();
  sub_246155C80();
  sub_246155F68();
  sub_246155C80();
  OUTLINED_FUNCTION_38();
  return 0x203A657361726850;
}

uint64_t sub_24613FE34()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  sub_246155C80();
  swift_bridgeObjectRetain();
  sub_246155C80();
  swift_bridgeObjectRelease();
  return v2;
}

double sub_24613FEB8()
{
  uint64_t v0;
  uint64_t v1;
  double result;

  v1 = v0 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_normalizedScore;
  OUTLINED_FUNCTION_0();
  result = *(double *)v1;
  if (*(_BYTE *)(v1 + 8))
    return 0.0;
  return result;
}

uint64_t sub_24613FF04()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0();
  sub_246155C50();
  sub_24613FF7C();
  v0 = sub_246155DA0();
  OUTLINED_FUNCTION_38();
  return v0;
}

unint64_t sub_24613FF7C()
{
  unint64_t result;

  result = qword_25441C978;
  if (!qword_25441C978)
  {
    result = MEMORY[0x249551438](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25441C978);
  }
  return result;
}

uint64_t sub_24613FFB8()
{
  uint64_t v0;

  sub_24615598C();
  OUTLINED_FUNCTION_39();
  sub_246155980();
  sub_246155968();
  OUTLINED_FUNCTION_42();
  sub_246142194(&qword_25441C940, (uint64_t (*)(uint64_t))type metadata accessor for AutoCompletePhrase, (uint64_t)"\t~^\vP ");
  v0 = sub_246155974();
  OUTLINED_FUNCTION_15();
  return v0;
}

uint64_t sub_24614017C()
{
  uint64_t v1;

  sub_24615595C();
  OUTLINED_FUNCTION_39();
  sub_246155950();
  OUTLINED_FUNCTION_42();
  sub_246142194(&qword_25754D5C8, (uint64_t (*)(uint64_t))type metadata accessor for AutoCompletePhrase, (uint64_t)"!~^\vx ");
  sub_246155944();
  OUTLINED_FUNCTION_15();
  return v1;
}

uint64_t sub_246140330(uint64_t a1, uint64_t a2)
{
  uint64_t inited;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C9C0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246156910;
  *(_QWORD *)(inited + 32) = 9339106;
  *(_QWORD *)(inited + 40) = 0xA300000000000000;
  *(_QWORD *)(inited + 48) = 9404642;
  *(_QWORD *)(inited + 56) = 0xA300000000000000;
  v5 = sub_2461421D0(inited);
  swift_bridgeObjectRetain();
  sub_2461403E0(a1, a2, v5);
  return sub_246155CB0();
}

uint64_t sub_2461403E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v4 = sub_246155C8C();
  if (v5)
  {
    v6 = v4;
    v7 = v5;
    do
    {
      sub_246142A90(v6, v7, a3);
      if ((v8 & 1) == 0)
        MEMORY[0x249550DE4](v6, v7);
      swift_bridgeObjectRelease();
      v6 = sub_246155C8C();
      v7 = v9;
    }
    while (v9);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t static AutoCompletePhrase.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v8;
  char v10;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v19;
  double *v20;
  double v21;
  double *v22;

  OUTLINED_FUNCTION_0();
  v4 = a1[2];
  v5 = a1[3];
  OUTLINED_FUNCTION_0();
  if (v4 != a2[2] || v5 != a2[3])
  {
    OUTLINED_FUNCTION_29();
    result = OUTLINED_FUNCTION_43();
    if ((v8 & 1) == 0)
      return result;
  }
  if (a1[6] != a2[6] || a1[7] != a2[7])
  {
    OUTLINED_FUNCTION_29();
    result = OUTLINED_FUNCTION_43();
    if ((v10 & 1) == 0)
      return result;
  }
  if (*(_QWORD *)((char *)a1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier) != *(_QWORD *)((char *)a2 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier)
    || *(_QWORD *)((char *)a1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier + 8) != *(_QWORD *)((char *)a2 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier + 8))
  {
    OUTLINED_FUNCTION_29();
    result = OUTLINED_FUNCTION_43();
    if ((v12 & 1) == 0)
      return result;
  }
  if (*((unsigned __int8 *)a1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source) != *((unsigned __int8 *)a2 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source)
    || (sub_246155A34() & 1) == 0)
  {
    return 0;
  }
  v13 = (_QWORD *)((char *)a1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_zkwGenerationId);
  OUTLINED_FUNCTION_0();
  v14 = *v13;
  v15 = v13[1];
  v16 = (_QWORD *)((char *)a2 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_zkwGenerationId);
  OUTLINED_FUNCTION_0();
  v17 = v16[1];
  if (!v15)
  {
    if (!v17)
    {
LABEL_29:
      v20 = (double *)((char *)a1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_normalizedScore);
      OUTLINED_FUNCTION_0();
      v21 = *v20;
      LOBYTE(v20) = *((_BYTE *)v20 + 8);
      v22 = (double *)((char *)a2 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_normalizedScore);
      OUTLINED_FUNCTION_0();
      result = *((unsigned __int8 *)v22 + 8);
      if ((v20 & 1) == 0)
        return (v21 == *v22) & ~(_DWORD)result;
      return result;
    }
    return 0;
  }
  if (!v17)
    return 0;
  if (v14 == *v16 && v15 == v17)
    goto LABEL_29;
  OUTLINED_FUNCTION_29();
  result = OUTLINED_FUNCTION_43();
  if ((v19 & 1) != 0)
    goto LABEL_29;
  return result;
}

uint64_t sub_246140674()
{
  return sub_246155FF8();
}

uint64_t sub_246140698(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  char v13;

  v3 = a1 == 0x657361726870 && a2 == 0xE600000000000000;
  if (v3 || (sub_246155F74() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000246157150 || (sub_246155F74() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
    if (v6 || (sub_246155F74() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = a1 == 0x6F666E496E6F6369 && a2 == 0xE800000000000000;
      if (v7 || (sub_246155F74() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x80000002461570D0 || (sub_246155F74() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        v8 = a1 == 0x656372756F73 && a2 == 0xE600000000000000;
        if (v8 || (sub_246155F74() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          v9 = a1 == 0x6E65644964697575 && a2 == 0xEE00726569666974;
          if (v9 || (sub_246155F74() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            v10 = a1 == 0x72656E6547776B7ALL && a2 == 0xEF64496E6F697461;
            if (v10 || (sub_246155F74() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              v11 = a1 == 0x7A696C616D726F6ELL && a2 == 0xEF65726F63536465;
              if (v11 || (sub_246155F74() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 8;
              }
              else
              {
                v12 = a1 == 0x746E756F43706174 && a2 == 0xE800000000000000;
                if (v12 || (sub_246155F74() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 9;
                }
                else if (a1 == 0xD000000000000012 && a2 == 0x8000000246157170)
                {
                  swift_bridgeObjectRelease();
                  return 10;
                }
                else
                {
                  v13 = sub_246155F74();
                  swift_bridgeObjectRelease();
                  if ((v13 & 1) != 0)
                    return 10;
                  else
                    return 11;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_246140ACC()
{
  return 11;
}

uint64_t sub_246140AD4()
{
  sub_246155FEC();
  sub_246155FF8();
  return sub_246156010();
}

uint64_t sub_246140B18()
{
  return 0;
}

uint64_t sub_246140B24(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_246140B5C + 4 * byte_246156440[a1]))(0xD000000000000010, 0x8000000246157150);
}

uint64_t sub_246140B5C()
{
  return 0x657361726870;
}

uint64_t sub_246140B70()
{
  return 0x6449656C646E7562;
}

uint64_t sub_246140B88()
{
  return 0x6F666E496E6F6369;
}

uint64_t sub_246140C38()
{
  return 0x7A696C616D726F6ELL;
}

uint64_t sub_246140C5C()
{
  return sub_246140AD4();
}

uint64_t sub_246140C64()
{
  return sub_246140674();
}

uint64_t sub_246140C6C()
{
  sub_246155FEC();
  sub_246155FF8();
  return sub_246156010();
}

uint64_t sub_246140CAC()
{
  unsigned __int8 *v0;

  return sub_246140B24(*v0);
}

uint64_t sub_246140CB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_246140698(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246140CD8()
{
  return sub_246140B18();
}

uint64_t sub_246140CF4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246140ACC();
  *a1 = result;
  return result;
}

uint64_t sub_246140D18()
{
  sub_246141214();
  return sub_246156034();
}

uint64_t sub_246140D40()
{
  sub_246141214();
  return sub_246156040();
}

void AutoCompletePhrase.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = sub_246155BCC();
  OUTLINED_FUNCTION_8(v1);
  OUTLINED_FUNCTION_44();
  v2 = sub_246155A4C();
  OUTLINED_FUNCTION_8(v2);
  OUTLINED_FUNCTION_44();
  sub_24613FD20(v0 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_recentTapTimeStamp, &qword_25441C8D8);
  OUTLINED_FUNCTION_11();
}

uint64_t AutoCompletePhrase.__deallocating_deinit()
{
  AutoCompletePhrase.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_246140E1C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C8D8);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_10();
  v7 = v6 - v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C990);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_10();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246141214();
  sub_246156028();
  OUTLINED_FUNCTION_0();
  v9 = *(_QWORD *)(v2 + 16);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_4();
  if (v9)
    goto LABEL_3;
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_0();
  v10 = *(_QWORD *)(v2 + 32);
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_4();
  if (v10)
    goto LABEL_3;
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_4();
  sub_246155BCC();
  sub_246142194(&qword_25441C908, (uint64_t (*)(uint64_t))MEMORY[0x24BEA75F0], MEMORY[0x24BEA7600]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4();
  sub_246141250();
  sub_246155F50();
  sub_246155A4C();
  sub_246142194(&qword_25441C8E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  OUTLINED_FUNCTION_9();
  v12 = (uint64_t *)(v2 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_zkwGenerationId);
  OUTLINED_FUNCTION_0();
  v13 = *v12;
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_35();
  sub_246155F14();
  if (v13)
  {
LABEL_3:
    OUTLINED_FUNCTION_33();
    return OUTLINED_FUNCTION_27();
  }
  else
  {
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_35();
    sub_246155F20();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_35();
    sub_246155F44();
    v14 = v2 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_recentTapTimeStamp;
    OUTLINED_FUNCTION_0();
    sub_24613FCE4(v14, v7, &qword_25441C8D8);
    sub_246155A1C();
    sub_246142194(&qword_25441C8D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    OUTLINED_FUNCTION_35();
    sub_246155F2C();
    sub_24613FD20(v7, &qword_25441C8D8);
    return OUTLINED_FUNCTION_33();
  }
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_246141214()
{
  unint64_t result;

  result = qword_25441C928;
  if (!qword_25441C928)
  {
    result = MEMORY[0x249551438](&unk_2461568AC, &type metadata for AutoCompletePhrase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25441C928);
  }
  return result;
}

unint64_t sub_246141250()
{
  unint64_t result;

  result = qword_25441C918;
  if (!qword_25441C918)
  {
    result = MEMORY[0x249551438](&protocol conformance descriptor for AutoCompletePhraseSource, &type metadata for AutoCompletePhraseSource);
    atomic_store(result, (unint64_t *)&qword_25441C918);
  }
  return result;
}

uint64_t AutoCompletePhrase.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  AutoCompletePhrase.init(from:)(a1);
  return v2;
}

_QWORD *AutoCompletePhrase.init(from:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  _QWORD *v24;
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
  _QWORD *v35;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C8D8);
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_18();
  v26 = v4;
  v28 = sub_246155A4C();
  v31 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_18();
  v27 = v5;
  v6 = sub_246155BCC();
  v29 = *(_QWORD *)(v6 - 8);
  v30 = v6;
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_18();
  v32 = v7;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754D588);
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_10();
  v8 = (_QWORD *)((char *)v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_zkwGenerationId);
  *v8 = 0;
  v8[1] = 0;
  v9 = (char *)v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_normalizedScore;
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v35 = v1;
  v10 = (uint64_t)v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_recentTapTimeStamp;
  v11 = sub_246155A1C();
  __swift_storeEnumTagSinglePayload(v10, 1, 1, v11);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246141214();
  sub_24615601C();
  if (v34)
  {
    v24 = v1;
    OUTLINED_FUNCTION_40();
    sub_24613FD20((uint64_t)v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_recentTapTimeStamp, &qword_25441C8D8);
    type metadata accessor for AutoCompletePhrase();
    swift_deallocPartialClassInstance();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v25 = v10;
    v1[2] = OUTLINED_FUNCTION_24();
    v1[3] = v13;
    v1[4] = OUTLINED_FUNCTION_24();
    v1[5] = v14;
    v1[6] = OUTLINED_FUNCTION_24();
    v1[7] = v15;
    sub_246142194(&qword_25754D590, (uint64_t (*)(uint64_t))MEMORY[0x24BEA75F0], MEMORY[0x24BEA7608]);
    OUTLINED_FUNCTION_34();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))((uint64_t)v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_iconInfo, v32, v30);
    v16 = OUTLINED_FUNCTION_24();
    v17 = (_QWORD *)((char *)v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier);
    *v17 = v16;
    v17[1] = v18;
    sub_2461419A0();
    OUTLINED_FUNCTION_34();
    *((_BYTE *)v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source) = 4;
    sub_246142194(&qword_25754D5A0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    OUTLINED_FUNCTION_34();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))((uint64_t)v1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_uuidIdentifier, v27, v28);
    v19 = sub_246155ECC();
    v21 = v20;
    OUTLINED_FUNCTION_1();
    *v8 = v19;
    v8[1] = v21;
    swift_bridgeObjectRelease();
    v22 = sub_246155ED8();
    LOBYTE(v19) = v23;
    OUTLINED_FUNCTION_1();
    *(_QWORD *)v9 = v22;
    v9[8] = v19 & 1;
    *(_QWORD *)((char *)v35 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_tapCount) = sub_246155EFC();
    sub_246142194(&qword_25754D5A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    sub_246155EE4();
    OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_1();
    sub_24613F2B8(v26, v25);
    swift_endAccess();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v35;
  }
  return v24;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
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

unint64_t sub_2461419A0()
{
  unint64_t result;

  result = qword_25754D598;
  if (!qword_25754D598)
  {
    result = MEMORY[0x249551438](&protocol conformance descriptor for AutoCompletePhraseSource, &type metadata for AutoCompletePhraseSource);
    atomic_store(result, (unint64_t *)&qword_25754D598);
  }
  return result;
}

unint64_t sub_2461419E0()
{
  unint64_t result;

  result = qword_25754D5B0;
  if (!qword_25754D5B0)
  {
    result = MEMORY[0x249551438](&protocol conformance descriptor for AutoCompletePhraseSource, &type metadata for AutoCompletePhraseSource);
    atomic_store(result, (unint64_t *)&qword_25754D5B0);
  }
  return result;
}

unint64_t sub_246141A20()
{
  unint64_t result;

  result = qword_25754D5B8;
  if (!qword_25754D5B8)
  {
    result = MEMORY[0x249551438](&protocol conformance descriptor for AutoCompleteTableColumnNames, &type metadata for AutoCompleteTableColumnNames);
    atomic_store(result, (unint64_t *)&qword_25754D5B8);
  }
  return result;
}

uint64_t sub_246141A5C()
{
  return sub_24613FD48();
}

uint64_t sub_246141A7C(_QWORD **a1, _QWORD **a2)
{
  return static AutoCompletePhrase.== infix(_:_:)(*a1, *a2) & 1;
}

uint64_t sub_246141A9C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = AutoCompletePhrase.__allocating_init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_246141AC4(_QWORD *a1)
{
  return sub_246140E1C(a1);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_246141AFC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_246141B08(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AutoCompletePhraseSource()
{
  return &type metadata for AutoCompletePhraseSource;
}

uint64_t _s19SiriAutoCompleteAPI24AutoCompletePhraseSourceOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s19SiriAutoCompleteAPI24AutoCompletePhraseSourceOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246141BF4 + 4 * byte_246156450[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_246141C28 + 4 * byte_24615644B[v4]))();
}

uint64_t sub_246141C28(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246141C30(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246141C38);
  return result;
}

uint64_t sub_246141C44(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246141C4CLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_246141C50(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246141C58(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AutoCompleteTableColumnNames()
{
  return &type metadata for AutoCompleteTableColumnNames;
}

uint64_t OUTLINED_FUNCTION_42()
{
  return type metadata accessor for AutoCompletePhrase();
}

void sub_246141C7C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_246155BCC();
  if (v0 <= 0x3F)
  {
    sub_246155A4C();
    if (v1 <= 0x3F)
    {
      sub_246141EC0();
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for AutoCompletePhrase()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AutoCompletePhrase.phrase.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of AutoCompletePhrase.phrase.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of AutoCompletePhrase.phrase.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of AutoCompletePhrase.invocationPhrase.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of AutoCompletePhrase.invocationPhrase.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of AutoCompletePhrase.invocationPhrase.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of AutoCompletePhrase.zkwGenerationId.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of AutoCompletePhrase.zkwGenerationId.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of AutoCompletePhrase.zkwGenerationId.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of AutoCompletePhrase.normalizedScore.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of AutoCompletePhrase.normalizedScore.setter(uint64_t a1, char a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 248))(a1, a2 & 1);
}

uint64_t dispatch thunk of AutoCompletePhrase.normalizedScore.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of AutoCompletePhrase.tapCount.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of AutoCompletePhrase.tapCount.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of AutoCompletePhrase.tapCount.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of AutoCompletePhrase.recentTapTimeStamp.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of AutoCompletePhrase.recentTapTimeStamp.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of AutoCompletePhrase.recentTapTimeStamp.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of AutoCompletePhrase.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of AutoCompletePhrase.loggingIdentifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of AutoCompletePhrase.getNormalizedScore.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of AutoCompletePhrase.normalizedPhraseTokens.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of AutoCompletePhrase.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of AutoCompletePhrase.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 368))();
}

void sub_246141EC0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25441C8E0)
  {
    sub_246155A1C();
    v0 = sub_246155D7C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25441C8E0);
  }
}

uint64_t getEnumTagSinglePayload for AutoCompletePhrase.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF6)
  {
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
    v5 = (*a1 | (v4 << 8)) - 11;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v5 = v6 - 11;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AutoCompletePhrase.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246141FE8 + 4 * byte_24615645A[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_24614201C + 4 * byte_246156455[v4]))();
}

uint64_t sub_24614201C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246142024(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24614202CLL);
  return result;
}

uint64_t sub_246142038(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246142040);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_246142044(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24614204C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AutoCompletePhrase.CodingKeys()
{
  return &type metadata for AutoCompletePhrase.CodingKeys;
}

unint64_t sub_24614206C()
{
  unint64_t result;

  result = qword_25754D5C0;
  if (!qword_25754D5C0)
  {
    result = MEMORY[0x249551438](&unk_246156884, &type metadata for AutoCompletePhrase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25754D5C0);
  }
  return result;
}

unint64_t sub_2461420AC()
{
  unint64_t result;

  result = qword_25441C938;
  if (!qword_25441C938)
  {
    result = MEMORY[0x249551438](&unk_2461567F4, &type metadata for AutoCompletePhrase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25441C938);
  }
  return result;
}

unint64_t sub_2461420EC()
{
  unint64_t result;

  result = qword_25441C930;
  if (!qword_25441C930)
  {
    result = MEMORY[0x249551438](&unk_24615681C, &type metadata for AutoCompletePhrase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25441C930);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_246142140(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

unint64_t sub_24614214C()
{
  unint64_t result;

  result = qword_25441C920;
  if (!qword_25441C920)
  {
    result = MEMORY[0x249551438](&protocol conformance descriptor for AutoCompletePhraseSource, &type metadata for AutoCompletePhraseSource);
    atomic_store(result, (unint64_t *)&qword_25441C920);
  }
  return result;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

void sub_246142194(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x249551438](a3, v5), a1);
  }
  OUTLINED_FUNCTION_11();
}

uint64_t sub_2461421D0(uint64_t a1)
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
  uint64_t *v15;
  uint64_t v17;
  uint64_t *v18;
  _QWORD *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = MEMORY[0x24BEE4B08];
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C980);
  result = sub_246155DF4();
  v3 = result;
  v24 = *(_QWORD *)(a1 + 16);
  if (!v24)
  {
LABEL_24:
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
    sub_246155FEC();
    sub_246155C2C();
    result = sub_246156010();
    v9 = -1 << *(_BYTE *)(v3 + 32);
    v10 = result & ~v9;
    v11 = v10 >> 6;
    v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
    v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      v14 = *(_QWORD *)(v3 + 48);
      v15 = (uint64_t *)(v14 + 16 * v10);
      result = *v15;
      if (*v15 == v8 && v15[1] == v7)
        goto LABEL_21;
      result = sub_246155F74();
      if ((result & 1) != 0)
        goto LABEL_21;
      v17 = ~v9;
      while (1)
      {
        v10 = (v10 + 1) & v17;
        v11 = v10 >> 6;
        v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
        v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0)
          break;
        v18 = (uint64_t *)(v14 + 16 * v10);
        result = *v18;
        if (*v18 != v8 || v18[1] != v7)
        {
          result = sub_246155F74();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
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
      goto LABEL_26;
    *(_QWORD *)(v3 + 16) = v23;
    result = swift_bridgeObjectRetain();
LABEL_21:
    if (++v4 == v24)
      goto LABEL_24;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_2()
{
  JUMPOUT(0x2495513CCLL);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return sub_246155F38();
}

uint64_t OUTLINED_FUNCTION_6@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return sub_246155F50();
}

void OUTLINED_FUNCTION_12()
{
  JUMPOUT(0x2495514D4);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return sub_246155D88();
}

uint64_t OUTLINED_FUNCTION_14(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_getErrorValue();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_16()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_19()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v1 - 184), *(_QWORD *)(v1 - 192));
}

void OUTLINED_FUNCTION_22(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return sub_246155EF0();
}

BOOL OUTLINED_FUNCTION_25(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_26()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return sub_246155F74();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_arrayDestroy();
}

id OUTLINED_FUNCTION_32()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_33()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_34()
{
  return sub_246155F08();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_38()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_39()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_40()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_44()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_46(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  return sub_246150AC0(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_47()
{
  return sub_246155FA4();
}

double sub_2461425DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_246155C50();
  sub_24613FF7C();
  v2 = sub_246155DA0();
  swift_bridgeObjectRelease();
  v3 = sub_2461426A4(a1, v2);
  v4 = sub_246145EFC(v3, v2);
  swift_bridgeObjectRelease();
  v5 = sub_246145EFC(a1, v2);
  OUTLINED_FUNCTION_1_0();
  return ((double)v4 + (double)v5) * 0.5;
}

uint64_t sub_2461426A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = MEMORY[0x24BEE4B08];
  v23 = *(_QWORD *)(a1 + 16);
  if (v23)
  {
    v2 = *(_QWORD *)(a2 + 16);
    v3 = a2 + 32;
    swift_bridgeObjectRetain();
    v4 = 0;
    v5 = MEMORY[0x24BEE4AF8];
    do
    {
      if (v2)
      {
        v24 = v5;
        v6 = v26;
        v7 = v26 + 56;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_26();
        v8 = 0;
        while (1)
        {
          v9 = (uint64_t *)(v3 + 16 * v8);
          v11 = *v9;
          v10 = v9[1];
          OUTLINED_FUNCTION_26();
          if ((sub_246155CA4() & 1) != 0)
          {
            if (!*(_QWORD *)(v6 + 16))
              goto LABEL_14;
            v12 = sub_246155FE0();
            v13 = -1 << *(_BYTE *)(v6 + 32);
            v14 = v12 & ~v13;
            if (((*(_QWORD *)(v7 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
              goto LABEL_14;
            v15 = *(_QWORD *)(v6 + 48);
            if (*(_QWORD *)(v15 + 8 * v14) != v8)
              break;
          }
LABEL_12:
          ++v8;
          OUTLINED_FUNCTION_1_0();
          if (v8 == v2)
          {
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_1_0();
            v5 = v24;
            goto LABEL_19;
          }
        }
        v16 = ~v13;
        while (1)
        {
          v14 = (v14 + 1) & v16;
          if (((*(_QWORD *)(v7 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
            break;
          if (*(_QWORD *)(v15 + 8 * v14) == v8)
            goto LABEL_12;
        }
LABEL_14:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v5 = v24;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_2_0(0, *(_QWORD *)(v24 + 16) + 1);
          v5 = v20;
        }
        v18 = *(_QWORD *)(v5 + 16);
        v17 = *(_QWORD *)(v5 + 24);
        if (v18 >= v17 >> 1)
        {
          OUTLINED_FUNCTION_2_0(v17 > 1, v18 + 1);
          v5 = v21;
        }
        *(_QWORD *)(v5 + 16) = v18 + 1;
        v19 = v5 + 16 * v18;
        *(_QWORD *)(v19 + 32) = v11;
        *(_QWORD *)(v19 + 40) = v10;
        sub_246143B20(&v25, v8);
      }
LABEL_19:
      ++v4;
    }
    while (v4 != v23);
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t destroy for AutoCompleteQueryMatch()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *_s19SiriAutoCompleteAPI22AutoCompleteQueryMatchVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  OUTLINED_FUNCTION_26();
  return a1;
}

_QWORD *assignWithCopy for AutoCompleteQueryMatch(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
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

uint64_t assignWithTake for AutoCompleteQueryMatch(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AutoCompleteQueryMatch(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AutoCompleteQueryMatch(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AutoCompleteQueryMatch()
{
  return &type metadata for AutoCompleteQueryMatch;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_2_0(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_24614F738(a1, a2, 1, v2);
}

void sub_246142A90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v16;

  if (*(_QWORD *)(a3 + 16))
  {
    OUTLINED_FUNCTION_6_0();
    sub_246155C2C();
    v5 = OUTLINED_FUNCTION_14_0();
    v6 = -1 << *(_BYTE *)(v4 + 32);
    v7 = v5 & ~v6;
    OUTLINED_FUNCTION_0_0();
    if ((v8 & 1) != 0)
    {
      OUTLINED_FUNCTION_4_0();
      v10 = v10 && v9 == v3;
      if (!v10 && (OUTLINED_FUNCTION_29() & 1) == 0)
      {
        v11 = ~v6;
        v12 = (v7 + 1) & v11;
        OUTLINED_FUNCTION_0_0();
        if ((v13 & 1) != 0)
        {
          do
          {
            OUTLINED_FUNCTION_4_0();
            if (v10 && v14 == v3)
              break;
            if ((OUTLINED_FUNCTION_29() & 1) != 0)
              break;
            v12 = (v12 + 1) & v11;
            OUTLINED_FUNCTION_0_0();
          }
          while ((v16 & 1) != 0);
        }
      }
    }
  }
  OUTLINED_FUNCTION_7();
}

void sub_246142B60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v16;

  if (*(_QWORD *)(a3 + 16))
  {
    OUTLINED_FUNCTION_6_0();
    sub_246155C2C();
    v5 = OUTLINED_FUNCTION_14_0();
    v6 = -1 << *(_BYTE *)(v4 + 32);
    v7 = v5 & ~v6;
    OUTLINED_FUNCTION_0_0();
    if ((v8 & 1) != 0)
    {
      OUTLINED_FUNCTION_4_0();
      v10 = v10 && v9 == v3;
      if (!v10 && (OUTLINED_FUNCTION_29() & 1) == 0)
      {
        v11 = ~v6;
        v12 = (v7 + 1) & v11;
        OUTLINED_FUNCTION_0_0();
        if ((v13 & 1) != 0)
        {
          do
          {
            OUTLINED_FUNCTION_4_0();
            if (v10 && v14 == v3)
              break;
            if ((OUTLINED_FUNCTION_29() & 1) != 0)
              break;
            v12 = (v12 + 1) & v11;
            OUTLINED_FUNCTION_0_0();
          }
          while ((v16 & 1) != 0);
        }
      }
    }
  }
  OUTLINED_FUNCTION_7();
}

uint64_t sub_246142C30(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  BOOL v19;
  int v21;
  uint64_t v22;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  sub_246155FEC();
  v4 = *a1;
  v5 = a1[1];
  v6 = a1[2];
  v7 = a1[3];
  LODWORD(a1) = *((unsigned __int8 *)a1 + 32);
  OUTLINED_FUNCTION_16_0();
  sub_246155C2C();
  OUTLINED_FUNCTION_10_0();
  swift_bridgeObjectRetain();
  v22 = v6;
  sub_246155C2C();
  OUTLINED_FUNCTION_15_0();
  v21 = (int)a1;
  sub_246156004();
  v8 = sub_246156010();
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = v8 & ~v9;
  v11 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
    return 0;
  v12 = ~v9;
  v13 = *(_QWORD *)(a2 + 48);
  while (1)
  {
    v14 = v13 + 40 * v10;
    v15 = *(_QWORD *)(v14 + 16);
    v16 = *(_QWORD *)(v14 + 24);
    v17 = *(unsigned __int8 *)(v14 + 32);
    v18 = *(_QWORD *)v14 == v4 && *(_QWORD *)(v14 + 8) == v5;
    if (v18 || (OUTLINED_FUNCTION_29() & 1) != 0)
    {
      v19 = v15 == v22 && v16 == v7;
      if ((v19 || (OUTLINED_FUNCTION_29() & 1) != 0) && v17 == v21)
        break;
    }
    v10 = (v10 + 1) & v12;
    if (((*(_QWORD *)(v11 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
      return 0;
  }
  return 1;
}

void *sub_246142DA0()
{
  return &unk_25173DFF8;
}

uint64_t sub_246142DAC(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000013;
  else
    return 0x64726F57706F7473;
}

uint64_t sub_246142DEC()
{
  uint64_t result;

  type metadata accessor for StopWordAndNonSignificantWordList();
  swift_allocObject();
  result = sub_246142E24();
  qword_25754E3E0 = result;
  return result;
}

uint64_t sub_246142E24()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25754D6A8);
  *(_QWORD *)(v0 + 16) = sub_246155C20();
  *(_QWORD *)(v0 + 16) = sub_246142E8C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_246142E8C()
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
  char *v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  uint64_t ObjCClassFromMetadata;
  id v15;
  id v16;
  void (*v17)(uint64_t, char *, uint64_t);
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  _DWORD *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t result;
  int v34;
  unint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  int64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  os_log_type_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v73;
  char v74;
  uint64_t v75;
  _BOOL8 v76;
  void *v77;
  unint64_t v78;
  char v79;
  char v80;
  unint64_t v81;
  char v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  BOOL v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  __int128 v94;
  _QWORD *v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD *v105;
  uint64_t v106;

  v103 = sub_246155C14();
  v101 = *(_QWORD *)(v103 - 8);
  MEMORY[0x24BDAC7A8](v103);
  OUTLINED_FUNCTION_10();
  v98 = v1 - v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C9F8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_10();
  v5 = v4 - v3;
  v6 = sub_2461559EC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v88 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754D6A8);
  v13 = (_QWORD *)sub_246155C20();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v15 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v16 = sub_246145BD4(0xD000000000000021, 0x8000000246156970, 0x7473696C70, 0xE500000000000000, v15);

  if (!v16)
  {
    OUTLINED_FUNCTION_13_0(v5, 1);
    goto LABEL_5;
  }
  sub_2461559D4();

  v17 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
  v17(v5, v10, v6);
  OUTLINED_FUNCTION_13_0(v5, 0);
  if (__swift_getEnumTagSinglePayload(v5, 1, v6) == 1)
  {
LABEL_5:
    sub_246145C64(v5);
    if (qword_25441CCD0 != -1)
LABEL_52:
      swift_once();
    __swift_project_value_buffer(v103, (uint64_t)qword_25441CCB8);
    v19 = sub_246155BFC();
    v20 = sub_246155D58();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)OUTLINED_FUNCTION_23();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_24613C000, v19, v20, "StopWordAndNonSignificantWordList: unable to get path to the list of stop words and non significant words", v21, 2u);
      OUTLINED_FUNCTION_12();
    }

    return (uint64_t)v13;
  }
  v17((uint64_t)v12, (char *)v5, v6);
  sub_24615595C();
  swift_allocObject();
  v18 = sub_246155950();
  v22 = sub_2461559F8();
  v24 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754D6B0);
  v91 = v18;
  sub_246145CA4();
  sub_246155944();
  v89 = v22;
  v90 = v24;
  v34 = 0;
  v35 = 0;
  v36 = (uint64_t)v105;
  v97 = 0x8000000246157200;
  *(_QWORD *)&v37 = 136315138;
  v94 = v37;
  v93 = MEMORY[0x24BEE4AD8] + 8;
  v38 = v103;
  v39 = v101;
  v40 = v98;
  v104 = (uint64_t)v105;
  v99 = v6;
  v96 = v7;
  v92 = v12;
  while (1)
  {
    if (v35 >= 2)
    {
      __break(1u);
      goto LABEL_52;
    }
    v102 = v34;
    v41 = *((unsigned __int8 *)&unk_25173E020 + v35 + 32);
    if (*((_BYTE *)&unk_25173E020 + v35 + 32))
      v42 = v97;
    else
      v42 = 0xE900000000000073;
    if (!*(_QWORD *)(v36 + 16)
      || (!*((_BYTE *)&unk_25173E020 + v35 + 32) ? (v43 = 0x64726F57706F7473) : (v43 = 0xD000000000000013),
          v100 = v43,
          v44 = sub_246145A90(v43, v42),
          (v45 & 1) == 0))
    {
      v56 = v13;
      v57 = v12;
      v58 = v7;
      OUTLINED_FUNCTION_9_0();
      if (qword_25441CCD0 != -1)
        swift_once();
      v59 = __swift_project_value_buffer(v38, (uint64_t)qword_25441CCB8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v40, v59, v38);
      v60 = sub_246155BFC();
      v61 = v40;
      v62 = sub_246155D64();
      if (os_log_type_enabled(v60, v62))
      {
        v63 = OUTLINED_FUNCTION_23();
        v105 = (_QWORD *)OUTLINED_FUNCTION_23();
        *(_DWORD *)v63 = v94;
        if (v41)
          v64 = 0xD000000000000013;
        else
          v64 = 0x64726F57706F7473;
        *(_QWORD *)(v63 + 4) = sub_246150AC0(v64, v42, (uint64_t *)&v105);
        OUTLINED_FUNCTION_9_0();
        OUTLINED_FUNCTION_17_0(&dword_24613C000, v60, v62, "StopWordAndNonSignificantWordList: Unable to find key in the plist: %s", (uint8_t *)v63);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_12();
      }

      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v61, v38);
      v40 = v61;
      v7 = v58;
      v12 = v57;
      v13 = v56;
      v65 = v99;
      v36 = v104;
      v66 = v102;
      goto LABEL_49;
    }
    v46 = *(_QWORD *)(*(_QWORD *)(v104 + 56) + 8 * v44);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_9_0();
    v47 = *(_QWORD *)(v46 + 16);
    if (v47)
    {
      v95 = v13;
      v105 = (_QWORD *)MEMORY[0x24BEE4AF8];
      sub_2461512D0(0, v47, 0);
      v48 = (uint64_t)v105;
      v49 = v46 + 40;
      do
      {
        v50 = sub_246155C50();
        v52 = v51;
        v105 = (_QWORD *)v48;
        v54 = *(_QWORD *)(v48 + 16);
        v53 = *(_QWORD *)(v48 + 24);
        if (v54 >= v53 >> 1)
        {
          sub_2461512D0((char *)(v53 > 1), v54 + 1, 1);
          v48 = (uint64_t)v105;
        }
        v49 += 16;
        *(_QWORD *)(v48 + 16) = v54 + 1;
        v55 = v48 + 16 * v54;
        *(_QWORD *)(v55 + 32) = v50;
        *(_QWORD *)(v55 + 40) = v52;
        --v47;
      }
      while (v47);
      OUTLINED_FUNCTION_15_0();
      v13 = v95;
      v7 = v96;
    }
    else
    {
      OUTLINED_FUNCTION_15_0();
      v48 = MEMORY[0x24BEE4AF8];
    }
    v106 = sub_246155D40();
    v67 = *(_QWORD *)(v48 + 16);
    if (v67)
    {
      v68 = (uint64_t *)(v48 + 40);
      do
      {
        v69 = *(v68 - 1);
        v70 = *v68;
        OUTLINED_FUNCTION_16_0();
        sub_246143C10((uint64_t *)&v105, v69, v70);
        swift_bridgeObjectRelease();
        v68 += 2;
        --v67;
      }
      while (v67);
    }
    swift_bridgeObjectRelease();
    v71 = v106;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v105 = v13;
    v73 = sub_246145A90(v100, v42);
    v75 = v13[2];
    v76 = (v74 & 1) == 0;
    v77 = (void *)(v75 + v76);
    if (__OFADD__(v75, v76))
    {
      __break(1u);
      swift_once();
      __swift_project_value_buffer(isUniquelyReferenced_nonNull_native, (uint64_t)qword_25441CCB8);
      v25 = v77;
      v26 = v77;
      v27 = sub_246155BFC();
      v28 = sub_246155D64();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = OUTLINED_FUNCTION_23();
        v96 = v7;
        v99 = v71;
        v30 = (_DWORD *)v29;
        v105 = (_QWORD *)OUTLINED_FUNCTION_23();
        *v30 = *(_QWORD *)(v67 + 2304);
        swift_getErrorValue();
        v31 = sub_246155FA4();
        v106 = sub_246150AC0(v31, v32, (uint64_t *)&v105);
        sub_246155D88();
        OUTLINED_FUNCTION_1_0();
        OUTLINED_FUNCTION_2();
      }

      OUTLINED_FUNCTION_2();
    }
    v78 = v73;
    v79 = v74;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754D6D0);
    v80 = sub_246155E84();
    v12 = v92;
    v39 = v101;
    if ((v80 & 1) != 0)
    {
      v81 = sub_246145A90(v100, v42);
      if ((v79 & 1) != (v82 & 1))
        goto LABEL_55;
      v78 = v81;
    }
    v13 = v105;
    if ((v79 & 1) == 0)
      break;
    v83 = v105[7];
    swift_bridgeObjectRelease();
    *(_QWORD *)(v83 + 8 * v78) = v71;
    v40 = v98;
    v65 = v99;
    v38 = v103;
    v36 = v104;
LABEL_48:
    v66 = v102;
    OUTLINED_FUNCTION_9_0();
    swift_bridgeObjectRelease();
LABEL_49:
    v34 = 1;
    v35 = 1u;
    if ((v66 & 1) != 0)
    {
      sub_246145DB0(v89, v90);
      OUTLINED_FUNCTION_1_0();
      swift_release();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v65);
      return (uint64_t)v13;
    }
  }
  v105[(v78 >> 6) + 8] |= 1 << v78;
  v84 = (_QWORD *)(v13[6] + 16 * v78);
  *v84 = v100;
  v84[1] = v42;
  *(_QWORD *)(v13[7] + 8 * v78) = v71;
  v85 = v13[2];
  v86 = __OFADD__(v85, 1);
  v87 = v85 + 1;
  v36 = v104;
  if (!v86)
  {
    v13[2] = v87;
    swift_bridgeObjectRetain();
    v40 = v98;
    v65 = v99;
    v38 = v103;
    goto LABEL_48;
  }
  __break(1u);
LABEL_55:
  result = sub_246155F98();
  __break(1u);
  return result;
}

uint64_t sub_246143850(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16) && (sub_246145A90(a1, a2), (v3 & 1) != 0))
    return swift_bridgeObjectRetain();
  else
    return 0;
}

uint64_t sub_246143890(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;

  v5 = sub_246155C14();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_10();
  v9 = v8 - v7;
  if ((a3 & 1) != 0)
    v10 = 0xD000000000000013;
  else
    v10 = 0x64726F57706F7473;
  if ((a3 & 1) != 0)
    v11 = 0x8000000246157200;
  else
    v11 = 0xE900000000000073;
  v12 = *(_QWORD *)(v3 + 16);
  swift_bridgeObjectRetain();
  v13 = sub_246143850(v10, v11, v12);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_1_0();
  if (v13)
  {
    v14 = sub_246155C50();
    sub_246142B60(v14, v15, v13);
    v17 = v16;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_11_0();
    return v17 & 1;
  }
  else
  {
    if (qword_25441CCD0 != -1)
      swift_once();
    v19 = __swift_project_value_buffer(v5, (uint64_t)qword_25441CCB8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v9, v19, v5);
    v20 = sub_246155BFC();
    v21 = sub_246155D64();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)OUTLINED_FUNCTION_23();
      v23 = OUTLINED_FUNCTION_23();
      *(_DWORD *)v22 = 136315138;
      sub_246150AC0(v10, v11, &v23);
      sub_246155D88();
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_17_0(&dword_24613C000, v20, v21, "StopWordAndNonSignificantWordList: Unable to find key in StopWordAndNonSignificantWordList: %s", v22);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_12();
    }

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
    return 0;
  }
}

uint64_t sub_246143ADC()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StopWordAndNonSignificantWordList()
{
  return objc_opt_self();
}

uint64_t sub_246143B20(uint64_t *a1, uint64_t a2)
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
  v7 = sub_246155FE0();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    *v3 = 0x8000000000000000;
    sub_24614486C(a2, v9, isUniquelyReferenced_nonNull_native);
    OUTLINED_FUNCTION_18_0(v14);
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

uint64_t sub_246143C10(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  char v19;
  _QWORD *v20;
  BOOL v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;

  v7 = *v3;
  sub_246155FEC();
  swift_bridgeObjectRetain();
  sub_246155C2C();
  v8 = OUTLINED_FUNCTION_14_0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  OUTLINED_FUNCTION_0_0();
  if ((v11 & 1) != 0)
  {
    v12 = *(_QWORD *)(v7 + 48);
    v13 = (_QWORD *)(v12 + 16 * v10);
    v14 = *v13 == a2 && v13[1] == a3;
    if (v14 || (OUTLINED_FUNCTION_29() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_11_0();
      v15 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain();
      return 0;
    }
    v18 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v18;
      OUTLINED_FUNCTION_0_0();
      if ((v19 & 1) == 0)
        break;
      v20 = (_QWORD *)(v12 + 16 * v10);
      v21 = *v20 == a2 && v20[1] == a3;
      if (v21 || (OUTLINED_FUNCTION_29() & 1) != 0)
        goto LABEL_7;
    }
  }
  OUTLINED_FUNCTION_11_0();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v23 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24614498C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v23;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_246143D90(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  BOOL v19;
  BOOL v20;
  char isUniquelyReferenced_nonNull_native;
  __int128 v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v4 = *v2;
  sub_246155FEC();
  v5 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v30 = a2;
  LODWORD(a2) = *(unsigned __int8 *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_246155C2C();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_16_0();
  v34 = v7;
  sub_246155C2C();
  v33 = v8;
  OUTLINED_FUNCTION_10_0();
  v32 = a2;
  sub_246156004();
  v9 = sub_246156010();
  v10 = -1 << *(_BYTE *)(v4 + 32);
  v11 = v9 & ~v10;
  v12 = v4 + 56;
  if (((*(_QWORD *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
  {
    v13 = ~v10;
    v14 = *(_QWORD *)(v4 + 48);
    while (1)
    {
      v15 = v14 + 40 * v11;
      v17 = *(_QWORD *)(v15 + 16);
      v16 = *(_QWORD *)(v15 + 24);
      v18 = *(unsigned __int8 *)(v15 + 32);
      v19 = *(_QWORD *)v15 == v5 && *(_QWORD *)(v15 + 8) == v6;
      if (v19 || (OUTLINED_FUNCTION_29() & 1) != 0)
      {
        v20 = v17 == v34 && v16 == v33;
        if ((v20 || (OUTLINED_FUNCTION_29() & 1) != 0) && v18 == v32)
          break;
      }
      v11 = (v11 + 1) & v13;
      if (((*(_QWORD *)(v12 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
        goto LABEL_15;
    }
    swift_bridgeObjectRelease();
    sub_246145E28(v30);
    v24 = *(_QWORD *)(*v29 + 48) + 40 * v11;
    v26 = *(_QWORD *)v24;
    v25 = *(_QWORD *)(v24 + 8);
    v27 = *(_QWORD *)(v24 + 16);
    v28 = *(_QWORD *)(v24 + 24);
    LOBYTE(v24) = *(_BYTE *)(v24 + 32);
    *(_QWORD *)a1 = v26;
    *(_QWORD *)(a1 + 8) = v25;
    *(_QWORD *)(a1 + 16) = v27;
    *(_QWORD *)(a1 + 24) = v28;
    *(_BYTE *)(a1 + 32) = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return 0;
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v35 = *v29;
    *v29 = 0x8000000000000000;
    sub_246145DF4(v30);
    sub_246144B24(v30, v11, isUniquelyReferenced_nonNull_native);
    OUTLINED_FUNCTION_18_0(v35);
    v22 = *(_OWORD *)(v30 + 16);
    *(_OWORD *)a1 = *(_OWORD *)v30;
    *(_OWORD *)(a1 + 16) = v22;
    *(_BYTE *)(a1 + 32) = *(_BYTE *)(v30 + 32);
    return 1;
  }
}

uint64_t sub_246143FC0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754D6E0);
  result = sub_246155DE8();
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
      result = sub_246155FE0();
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
                sub_246144D3C(0, v11, (_QWORD *)(v2 + 56));
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

uint64_t sub_246144240()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C988);
  v3 = sub_246155DE8();
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
      sub_246155FEC();
      sub_246155C2C();
      result = sub_246156010();
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
                sub_246144D3C(0, (unint64_t)(v29 + 63) >> 6, v30);
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

uint64_t sub_246144518()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  _QWORD *v33;
  uint64_t v34;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754D6D8);
  v3 = sub_246155DE8();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v33 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v32 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    v34 = v2;
    if (!v7)
      goto LABEL_7;
LABEL_6:
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (i = v11 | (v10 << 6); ; i = __clz(__rbit64(v14)) + (v10 << 6))
    {
      v16 = *(_QWORD *)(v2 + 48) + 40 * i;
      v17 = *(_QWORD *)v16;
      v18 = *(_QWORD *)(v16 + 8);
      v19 = *(_QWORD *)(v16 + 16);
      v20 = *(_QWORD *)(v16 + 24);
      v21 = *(_BYTE *)(v16 + 32);
      sub_246155FEC();
      swift_bridgeObjectRetain();
      sub_246155C2C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_246155C2C();
      swift_bridgeObjectRelease();
      sub_246156004();
      result = sub_246156010();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v8 + 8 * (v23 >> 6))) == 0)
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v22) >> 6;
        while (++v24 != v27 || (v26 & 1) == 0)
        {
          v28 = v24 == v27;
          if (v24 == v27)
            v24 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v8 + 8 * v24);
          if (v29 != -1)
          {
            v25 = __clz(__rbit64(~v29)) + (v24 << 6);
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
      v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v8 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v8 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
      v30 = *(_QWORD *)(v4 + 48) + 40 * v25;
      *(_QWORD *)v30 = v17;
      *(_QWORD *)(v30 + 8) = v18;
      *(_QWORD *)(v30 + 16) = v19;
      *(_QWORD *)(v30 + 24) = v20;
      *(_BYTE *)(v30 + 32) = v21;
      ++*(_QWORD *)(v4 + 16);
      v2 = v34;
      if (v7)
        goto LABEL_6;
LABEL_7:
      v13 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_38;
      if (v13 >= v32)
        goto LABEL_32;
      v14 = v33[v13];
      ++v10;
      if (!v14)
      {
        v10 = v13 + 1;
        if (v13 + 1 >= v32)
          goto LABEL_32;
        v14 = v33[v10];
        if (!v14)
        {
          v10 = v13 + 2;
          if (v13 + 2 >= v32)
            goto LABEL_32;
          v14 = v33[v10];
          if (!v14)
          {
            v15 = v13 + 3;
            if (v15 >= v32)
            {
LABEL_32:
              swift_release();
              v1 = v0;
              v31 = 1 << *(_BYTE *)(v2 + 32);
              if (v31 > 63)
                sub_246144D3C(0, (unint64_t)(v31 + 63) >> 6, v33);
              else
                *v33 = -1 << v31;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v14 = v33[v15];
            if (!v14)
            {
              while (1)
              {
                v10 = v15 + 1;
                if (__OFADD__(v15, 1))
                  goto LABEL_39;
                if (v10 >= v32)
                  goto LABEL_32;
                v14 = v33[v10];
                ++v15;
                if (v14)
                  goto LABEL_20;
              }
            }
            v10 = v15;
          }
        }
      }
LABEL_20:
      v7 = (v14 - 1) & v14;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_24614486C(uint64_t result, unint64_t a2, char a3)
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
    sub_246143FC0();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_246144D58();
      goto LABEL_14;
    }
    sub_246145268();
  }
  v8 = *v3;
  result = sub_246155FE0();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      result = sub_246155F8C();
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

uint64_t sub_24614498C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_246144240();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_246144EEC();
      goto LABEL_22;
    }
    sub_2461454C4();
  }
  v11 = *v4;
  sub_246155FEC();
  sub_246155C2C();
  result = sub_246156010();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_246155F74(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_246155F8C();
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
          result = sub_246155F74();
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

uint64_t sub_246144B24(uint64_t result, unint64_t a2, char a3)
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
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  BOOL v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  v31 = result;
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_22;
  if ((a3 & 1) != 0)
  {
    sub_246144518();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_24614509C();
      goto LABEL_22;
    }
    sub_24614576C();
  }
  v8 = *v3;
  sub_246155FEC();
  v9 = *(_QWORD *)v5;
  v10 = *(_QWORD *)(v5 + 8);
  v11 = *(_QWORD *)(v5 + 16);
  v12 = *(_QWORD *)(v5 + 24);
  v13 = *(unsigned __int8 *)(v5 + 32);
  swift_bridgeObjectRetain();
  sub_246155C2C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v33 = v11;
  sub_246155C2C();
  swift_bridgeObjectRelease();
  v32 = v13;
  sub_246156004();
  result = sub_246156010();
  v14 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v14;
  v15 = v8 + 56;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v16 = ~v14;
    v17 = *(_QWORD *)(v8 + 48);
    do
    {
      v18 = v17 + 40 * a2;
      result = *(_QWORD *)v18;
      v19 = *(_QWORD *)(v18 + 16);
      v20 = *(_QWORD *)(v18 + 24);
      v21 = *(unsigned __int8 *)(v18 + 32);
      v22 = *(_QWORD *)v18 == v9 && *(_QWORD *)(v18 + 8) == v10;
      if (v22 || (result = sub_246155F74(), (result & 1) != 0))
      {
        v23 = v19 == v33 && v20 == v12;
        if (v23 || (result = sub_246155F74(), (result & 1) != 0))
        {
          if (v21 == v32)
            goto LABEL_25;
        }
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(_QWORD *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_22:
  v24 = *v30;
  *(_QWORD *)(*v30 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  v25 = *(_QWORD *)(v24 + 48) + 40 * a2;
  v26 = *(_OWORD *)(v31 + 16);
  *(_OWORD *)v25 = *(_OWORD *)v31;
  *(_OWORD *)(v25 + 16) = v26;
  *(_BYTE *)(v25 + 32) = *(_BYTE *)(v31 + 32);
  v27 = *(_QWORD *)(v24 + 16);
  v28 = __OFADD__(v27, 1);
  v29 = v27 + 1;
  if (!v28)
  {
    *(_QWORD *)(v24 + 16) = v29;
    return result;
  }
  __break(1u);
LABEL_25:
  result = sub_246155F8C();
  __break(1u);
  return result;
}

uint64_t sub_246144D3C(uint64_t result, uint64_t a2, _QWORD *a3)
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

void *sub_246144D58()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754D6E0);
  v2 = *v0;
  v3 = sub_246155DDC();
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

void *sub_246144EEC()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C988);
  v2 = *v0;
  v3 = sub_246155DDC();
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

void *sub_24614509C()
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754D6D8);
  v2 = *v0;
  v3 = sub_246155DDC();
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
    v20 = 5 * i;
    v21 = *(_QWORD *)(v2 + 48) + 8 * v20;
    v23 = *(_QWORD *)v21;
    v22 = *(_QWORD *)(v21 + 8);
    v24 = *(_QWORD *)(v21 + 16);
    v25 = *(_QWORD *)(v21 + 24);
    LOBYTE(v21) = *(_BYTE *)(v21 + 32);
    v26 = *(_QWORD *)(v4 + 48) + 8 * v20;
    *(_QWORD *)v26 = v23;
    *(_QWORD *)(v26 + 8) = v22;
    *(_QWORD *)(v26 + 16) = v24;
    *(_QWORD *)(v26 + 24) = v25;
    *(_BYTE *)(v26 + 32) = v21;
    swift_bridgeObjectRetain();
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

uint64_t sub_246145268()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754D6E0);
  result = sub_246155DE8();
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
    result = sub_246155FE0();
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

uint64_t sub_2461454C4()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C988);
  v3 = sub_246155DE8();
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
    sub_246155FEC();
    swift_bridgeObjectRetain();
    sub_246155C2C();
    result = sub_246156010();
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

uint64_t sub_24614576C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754D6D8);
  v3 = sub_246155DE8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v31 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v32 = (unint64_t)(v5 + 63) >> 6;
  v8 = v3 + 56;
  result = swift_retain();
  v10 = 0;
  v33 = v2;
  if (!v7)
    goto LABEL_7;
LABEL_6:
  v11 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (i = v11 | (v10 << 6); ; i = __clz(__rbit64(v14)) + (v10 << 6))
  {
    v16 = *(_QWORD *)(v2 + 48) + 40 * i;
    v17 = *(_QWORD *)v16;
    v18 = *(_QWORD *)(v16 + 8);
    v19 = *(_QWORD *)(v16 + 16);
    v20 = *(_QWORD *)(v16 + 24);
    v21 = *(_BYTE *)(v16 + 32);
    sub_246155FEC();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_246155C2C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_246155C2C();
    swift_bridgeObjectRelease();
    sub_246156004();
    result = sub_246156010();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v8 + 8 * (v23 >> 6))) == 0)
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        v28 = v24 == v27;
        if (v24 == v27)
          v24 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v8 + 8 * v24);
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
    v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v8 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v8 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    v30 = *(_QWORD *)(v4 + 48) + 40 * v25;
    *(_QWORD *)v30 = v17;
    *(_QWORD *)(v30 + 8) = v18;
    *(_QWORD *)(v30 + 16) = v19;
    *(_QWORD *)(v30 + 24) = v20;
    *(_BYTE *)(v30 + 32) = v21;
    ++*(_QWORD *)(v4 + 16);
    v2 = v33;
    if (v7)
      goto LABEL_6;
LABEL_7:
    v13 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_36;
    if (v13 >= v32)
      goto LABEL_32;
    v14 = *(_QWORD *)(v31 + 8 * v13);
    ++v10;
    if (!v14)
    {
      v10 = v13 + 1;
      if (v13 + 1 >= v32)
        goto LABEL_32;
      v14 = *(_QWORD *)(v31 + 8 * v10);
      if (!v14)
      {
        v10 = v13 + 2;
        if (v13 + 2 >= v32)
          goto LABEL_32;
        v14 = *(_QWORD *)(v31 + 8 * v10);
        if (!v14)
          break;
      }
    }
LABEL_20:
    v7 = (v14 - 1) & v14;
  }
  v15 = v13 + 3;
  if (v15 >= v32)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v31 + 8 * v15);
  if (v14)
  {
    v10 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    v10 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v10 >= v32)
      goto LABEL_32;
    v14 = *(_QWORD *)(v31 + 8 * v10);
    ++v15;
    if (v14)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_246145A90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_246155FEC();
  sub_246155C2C();
  v4 = sub_246156010();
  return sub_246145AF4(a1, a2, v4);
}

unint64_t sub_246145AF4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_246155F74() & 1) == 0)
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
      while (!v14 && (sub_246155F74() & 1) == 0);
    }
  }
  return v6;
}

id sub_246145BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)sub_246155C38();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_246155C38();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(a5, sel_URLForResource_withExtension_, v6, v7);

  return v8;
}

uint64_t sub_246145C64(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C9F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_246145CA4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_25754D6B8;
  if (!qword_25754D6B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754D6B0);
    v2 = sub_246145D54();
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x249551438](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25754D6B8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24955142C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_246145D54()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_25754D6C0;
  if (!qword_25754D6C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754D6C8);
    v2 = MEMORY[0x24BEE0D38];
    result = MEMORY[0x249551438](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25754D6C0);
  }
  return result;
}

uint64_t sub_246145DB0(uint64_t a1, unint64_t a2)
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

uint64_t sub_246145DF4(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_246145E28(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  uint64_t v0;
  uint64_t v1;

  return *(_QWORD *)(v0 + 16 * v1);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return sub_246155FEC();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return sub_246156010();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_17_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_18_0@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  *v1 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_246145EFC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  BOOL v33;
  _BOOL8 v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  int64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  char v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  _QWORD *v62;
  unint64_t v63;
  _QWORD *v64;
  unint64_t v65;
  _QWORD *v66;
  unint64_t v67;
  _QWORD *v68;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v4)
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
    OUTLINED_FUNCTION_0_1();
    v8 = v68;
    v9 = a1 + 40;
    do
    {
      v10 = sub_246155C50();
      v2 = v11;
      v68 = v8;
      v13 = v8[2];
      v12 = v8[3];
      if (v13 >= v12 >> 1)
        sub_2461512D0((char *)(v12 > 1), v13 + 1, 1);
      v9 += 16;
      v8[2] = v13 + 1;
      v14 = &v8[2 * v13];
      v14[4] = v10;
      v14[5] = v2;
      --v4;
    }
    while (v4);
    v5 = v7;
  }
  else
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v15 = *(_QWORD *)(a2 + 16);
  if (v15)
  {
    OUTLINED_FUNCTION_0_1();
    v5 = v68;
    v16 = a2 + 40;
    do
    {
      v17 = sub_246155C50();
      v2 = v18;
      v20 = v68[2];
      v19 = v68[3];
      v21 = v20 + 1;
      if (v20 >= v19 >> 1)
        sub_2461512D0((char *)(v19 > 1), v20 + 1, 1);
      v16 += 16;
      v68[2] = v21;
      v22 = &v68[2 * v20];
      v22[4] = v17;
      v22[5] = v2;
      --v15;
    }
    while (v15);
  }
  else
  {
    v21 = v5[2];
  }
  v65 = v8[2];
  if (!v65 || !v21)
  {
LABEL_59:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v21 <= v65)
      return v65;
    else
      return v21;
  }
  v23 = sub_2461464A4(0, v21 + 1);
  v24 = (_QWORD *)sub_246146554(v23, v65 + 1);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    goto LABEL_98;
  while (1)
  {
    if (v24[2] < 2uLL)
    {
      __break(1u);
    }
    else
    {
      v66 = v5;
      v5 = (_QWORD *)v24[5];
      isUniquelyReferenced_nonNull_native = OUTLINED_FUNCTION_2_1();
      v24[5] = v5;
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        goto LABEL_20;
    }
    OUTLINED_FUNCTION_1_1(isUniquelyReferenced_nonNull_native, v26, v27);
    v5 = (_QWORD *)isUniquelyReferenced_nonNull_native;
LABEL_20:
    if (v5[2])
    {
      v5[4] = 1;
      v24[5] = v5;
      if (v65 != 1)
      {
        v49 = 0;
        v50 = v24 + 6;
        while ((unint64_t)(v49 + 2) < v24[2])
        {
          v5 = (_QWORD *)v50[v49];
          isUniquelyReferenced_nonNull_native = OUTLINED_FUNCTION_2_1();
          v50[v49] = v5;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            OUTLINED_FUNCTION_1_1(isUniquelyReferenced_nonNull_native, v26, v27);
            v5 = (_QWORD *)isUniquelyReferenced_nonNull_native;
            v50[v49] = isUniquelyReferenced_nonNull_native;
          }
          if (!v5[2])
            goto LABEL_95;
          v5[4] = v49 + 2;
          if (v65 - 1 == ++v49)
            goto LABEL_22;
        }
LABEL_94:
        __break(1u);
LABEL_95:
        __break(1u);
        goto LABEL_96;
      }
LABEL_22:
      if (v24[2])
      {
        v2 = v24 + 4;
        v5 = (_QWORD *)v24[4];
        isUniquelyReferenced_nonNull_native = OUTLINED_FUNCTION_2_1();
        v24[4] = v5;
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          goto LABEL_24;
        goto LABEL_103;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_103:
    OUTLINED_FUNCTION_1_1(isUniquelyReferenced_nonNull_native, v26, v27);
    v5 = v62;
LABEL_24:
    if (v5[2] < 2uLL)
      break;
    v5[5] = 1;
    *v2 = v5;
    v67 = v21 - 1;
    if (v21 == 1)
    {
LABEL_26:
      v63 = v21;
      v64 = v8;
      v28 = v66;
      if (!v8[2])
      {
LABEL_58:
        __break(1u);
        goto LABEL_59;
      }
      v29 = 0;
      v8 += 4;
      v30 = 1;
LABEL_28:
      if (v28[2])
      {
        v31 = 0;
        v32 = v66 + 5;
        while (1)
        {
          v26 = v8[1];
          v27 = *(v32 - 1);
          v33 = *v8 == v27 && v26 == *v32;
          v34 = !v33 && (unint64_t)((sub_246155F74() & 1) == 0);
          v35 = v24[2];
          if (v30 > v35)
            break;
          v36 = v2[v29];
          if (v31 + 1 >= *(_QWORD *)(v36 + 16))
            goto LABEL_87;
          v37 = *(_QWORD *)(v36 + 8 * v31 + 40);
          v38 = __OFADD__(v37, 1);
          v39 = v37 + 1;
          if (v38)
            goto LABEL_88;
          if (v30 >= v35)
            goto LABEL_89;
          v5 = (_QWORD *)v2[v30];
          if (v31 >= v5[2])
            goto LABEL_90;
          v40 = v5[v31 + 4];
          v38 = __OFADD__(v40, 1);
          v41 = v40 + 1;
          if (v38)
            goto LABEL_91;
          v42 = *(_QWORD *)(v36 + 8 * v31 + 32);
          v38 = __OFADD__(v42, v34);
          v43 = v42 + v34;
          if (v38)
            goto LABEL_92;
          if (v41 >= v39)
            v44 = v39;
          else
            v44 = v41;
          if (v43 >= v44)
            v21 = v44;
          else
            v21 = v43;
          v45 = OUTLINED_FUNCTION_2_1();
          v2[v30] = v5;
          if ((v45 & 1) == 0)
          {
            OUTLINED_FUNCTION_1_1(v45, v26, v27);
            v5 = v46;
            v2[v30] = v46;
          }
          if (v31 + 1 >= v5[2])
            goto LABEL_93;
          v5[v31 + 5] = v21;
          if (v67 == v31)
          {
            v28 = v66;
            if (v30 != v65)
            {
              v8 = &v64[2 * v30 + 4];
              v29 = v30;
              if (v30++ >= v64[2])
                goto LABEL_58;
              goto LABEL_28;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v54 = sub_246146644((uint64_t)v24);
            if (v54)
            {
              v55 = sub_246146670(v54);
              v57 = v56;
              swift_bridgeObjectRelease();
              if ((v57 & 1) == 0)
              {
                swift_bridgeObjectRelease();
                return v55;
              }
            }
            if (qword_25441C970 != -1)
              goto LABEL_105;
            goto LABEL_80;
          }
          v32 += 2;
          if (++v31 >= v66[2])
            goto LABEL_85;
        }
      }
      else
      {
LABEL_85:
        __break(1u);
      }
      __break(1u);
LABEL_87:
      __break(1u);
LABEL_88:
      __break(1u);
LABEL_89:
      __break(1u);
LABEL_90:
      __break(1u);
LABEL_91:
      __break(1u);
LABEL_92:
      __break(1u);
LABEL_93:
      __break(1u);
      goto LABEL_94;
    }
    v51 = 0;
    while (v24[2])
    {
      v52 = OUTLINED_FUNCTION_2_1();
      *v2 = v5;
      if ((v52 & 1) == 0)
      {
        OUTLINED_FUNCTION_1_1(v52, v26, v27);
        v5 = v53;
      }
      if ((unint64_t)(v51 + 2) >= v5[2])
        goto LABEL_97;
      v5[v51 + 6] = v51 + 2;
      *v2 = v5;
      if (v67 == ++v51)
        goto LABEL_26;
    }
LABEL_96:
    __break(1u);
LABEL_97:
    __break(1u);
LABEL_98:
    sub_246151288((uint64_t)v24, v26, v27);
    v24 = (_QWORD *)isUniquelyReferenced_nonNull_native;
  }
  __break(1u);
LABEL_105:
  swift_once();
LABEL_80:
  v58 = sub_246155C14();
  __swift_project_value_buffer(v58, (uint64_t)qword_25441C958);
  v59 = sub_246155BFC();
  v60 = sub_246155D64();
  if (os_log_type_enabled(v59, v60))
  {
    v61 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v61 = 0;
    _os_log_impl(&dword_24613C000, v59, v60, "EditDistance: The output matrix was unexpectedly empty.", v61, 2u);
    MEMORY[0x2495514D4](v61, -1, -1);
  }
  swift_bridgeObjectRelease();

  if (v63 <= v65)
    return v65;
  else
    return v63;
}

uint64_t sub_2461464A4(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  if (a2 < 0)
  {
    result = sub_246155E90();
    __break(1u);
  }
  else if (a2)
  {
    result = sub_246155D1C();
    v5 = 0;
    *(_QWORD *)(result + 16) = a2;
    do
    {
      v6 = result + 8 * v5++;
      *(_QWORD *)(v6 + 32) = a1;
    }
    while (a2 != v5);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_246146554(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_246155E90();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25754D6E8);
      v4 = (_QWORD *)sub_246155D1C();
      v5 = v4;
      v4[2] = a2;
      v4[4] = a1;
      if (a2 != 1)
      {
        v4[5] = a1;
        v6 = a2 - 2;
        if (v6)
        {
          v7 = v4 + 6;
          do
          {
            *v7++ = a1;
            swift_bridgeObjectRetain();
            --v6;
          }
          while (v6);
        }
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x24BEE4AF8];
    }
    return (uint64_t)v5;
  }
  return result;
}

uint64_t sub_246146644(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 16))
    return swift_bridgeObjectRetain();
  else
    return 0;
}

uint64_t sub_246146670(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
    return *(_QWORD *)(a1 + 8 * v1 + 24);
  else
    return 0;
}

char *OUTLINED_FUNCTION_0_1()
{
  int64_t v0;

  return sub_2461512D0(0, v0, 0);
}

void OUTLINED_FUNCTION_1_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_246151254(v3, a2, a3);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

unint64_t static Logger.subsystem.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_2461466D8(uint64_t a1)
{
  return sub_246146724(a1, qword_25441CCB8);
}

uint64_t static Logger.indexCategory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2461467B0(&qword_25441CCD0, (uint64_t)qword_25441CCB8, a1);
}

uint64_t sub_24614670C(uint64_t a1)
{
  return sub_246146724(a1, qword_25441C958);
}

uint64_t sub_246146724(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_246155C14();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_246155C08();
}

uint64_t static Logger.queryCategory.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2461467B0(&qword_25441C970, (uint64_t)qword_25441C958, a1);
}

uint64_t sub_2461467B0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_246155C14();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_246146818()
{
  uint64_t result;

  sub_246146B84();
  result = sub_246155D70();
  qword_25754D6F0 = result;
  return result;
}

id static SiriAutoCompleteSignpostOSLog.indexLog.getter()
{
  return sub_246146920(&qword_25754D578, (id *)&qword_25754D6F0);
}

uint64_t sub_24614689C()
{
  uint64_t result;

  sub_246146B84();
  result = sub_246155D70();
  qword_25754D6F8 = result;
  return result;
}

id static SiriAutoCompleteSignpostOSLog.queryLog.getter()
{
  return sub_246146920(&qword_25754D580, (id *)&qword_25754D6F8);
}

id sub_246146920(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

void static SiriAutoCompleteSignpost.buildIndex.getter()
{
  OUTLINED_FUNCTION_0_2();
}

void static SiriAutoCompleteSignpost.phraseGeneration.getter()
{
  OUTLINED_FUNCTION_0_2();
}

void static SiriAutoCompleteSignpost.siriKitIntentSourcePhraseGeneration.getter()
{
  OUTLINED_FUNCTION_0_2();
}

void static SiriAutoCompleteSignpost.appLaunchSourcePhraseGeneration.getter()
{
  OUTLINED_FUNCTION_0_2();
}

void static SiriAutoCompleteSignpost.voiceShortcutSourcePhraseGeneration.getter()
{
  OUTLINED_FUNCTION_0_2();
}

void static SiriAutoCompleteSignpost.appIntentTranscriptSourcePhraseGeneration.getter()
{
  OUTLINED_FUNCTION_0_2();
}

void static SiriAutoCompleteSignpost.appShortcutsSourcePhraseGeneration.getter()
{
  OUTLINED_FUNCTION_0_2();
}

void static SiriAutoCompleteSignpost.assistantIntentExamplePhrasesSourcePhraseGeneration.getter()
{
  OUTLINED_FUNCTION_0_2();
}

void static SiriAutoCompleteSignpost.staticSuggestionsSourcePhraseGeneration.getter()
{
  OUTLINED_FUNCTION_0_2();
}

void static SiriAutoCompleteSignpost.dBInsertion.getter()
{
  OUTLINED_FUNCTION_0_2();
}

void static SiriAutoCompleteSignpost.fetchAutoCompleteResults.getter()
{
  OUTLINED_FUNCTION_0_2();
}

uint64_t static SignpostLogger.begin(log:name:telemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_246146A20(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x24BEE7948]);
}

uint64_t static SignpostLogger.end(log:name:telemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_246146A20(a1, a2, a3, a4, a5, a6, a7, MEMORY[0x24BEE7940]);
}

uint64_t sub_246146A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(uint64_t))
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD v15[2];

  v15[1] = a5;
  v9 = sub_246155BF0();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  a8(v11);
  sub_246155BE4();
  sub_246155BD8();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

uint64_t SignpostLogger.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SignpostLogger.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void type metadata accessor for Logger()
{
  OUTLINED_FUNCTION_1_2();
}

void type metadata accessor for SiriAutoCompleteSignpostOSLog()
{
  OUTLINED_FUNCTION_1_2();
}

void type metadata accessor for SiriAutoCompleteSignpost()
{
  OUTLINED_FUNCTION_1_2();
}

uint64_t type metadata accessor for SignpostLogger()
{
  return objc_opt_self();
}

uint64_t method lookup function for SignpostLogger()
{
  return swift_lookUpClassMethod();
}

unint64_t sub_246146B84()
{
  unint64_t result;

  result = qword_25754D798;
  if (!qword_25754D798)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_25754D798);
  }
  return result;
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

uint64_t sub_246146C10(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_246146C18()
{
  void *v0;
  id v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  CFPropertyListRef v7;
  uint64_t v9;

  v9 = MEMORY[0x24BEE4B08];
  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_hiddenAppBundleIdentifiers);
  v2 = OUTLINED_FUNCTION_0_3();

  sub_246146D90(v2);
  v3 = objc_msgSend(v0, sel_lockedAppBundleIdentifiers);
  v4 = OUTLINED_FUNCTION_0_3();

  sub_246146D90(v4);
  v5 = (__CFString *)sub_246155C38();
  v6 = (__CFString *)sub_246155C38();
  v7 = CFPreferencesCopyAppValue(v5, v6);

  if (v7)
  {
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
      sub_246155CE0();
    swift_unknownObjectRelease();
  }
  return v9;
}

uint64_t sub_246146D90(uint64_t result)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t i;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = result;
  v2 = 0;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  if (!v6)
    goto LABEL_5;
LABEL_4:
  v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (i = v8 | (v2 << 6); ; i = __clz(__rbit64(v11)) + (v2 << 6))
  {
    v13 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * i);
    v14 = *v13;
    v15 = v13[1];
    swift_bridgeObjectRetain();
    sub_246143C10(&v16, v14, v15);
    result = swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_4;
LABEL_5:
    v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v10 >= v7)
      return swift_release();
    v11 = *(_QWORD *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      v2 = v10 + 1;
      if (v10 + 1 >= v7)
        return swift_release();
      v11 = *(_QWORD *)(v3 + 8 * v2);
      if (!v11)
      {
        v2 = v10 + 2;
        if (v10 + 2 >= v7)
          return swift_release();
        v11 = *(_QWORD *)(v3 + 8 * v2);
        if (!v11)
        {
          v2 = v10 + 3;
          if (v10 + 3 >= v7)
            return swift_release();
          v11 = *(_QWORD *)(v3 + 8 * v2);
          if (!v11)
            break;
        }
      }
    }
LABEL_20:
    v6 = (v11 - 1) & v11;
  }
  v12 = v10 + 4;
  if (v12 >= v7)
    return swift_release();
  v11 = *(_QWORD *)(v3 + 8 * v12);
  if (v11)
  {
    v2 = v12;
    goto LABEL_20;
  }
  while (1)
  {
    v2 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v2 >= v7)
      return swift_release();
    v11 = *(_QWORD *)(v3 + 8 * v2);
    ++v12;
    if (v11)
      goto LABEL_20;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_246146F00(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = (uint64_t *)(a1 + 40);
    do
    {
      v3 = *(v2 - 1);
      v4 = *v2;
      swift_bridgeObjectRetain();
      sub_246143C10(&v6, v3, v4);
      swift_bridgeObjectRelease();
      v2 += 2;
      --v1;
    }
    while (v1);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_246146F74()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DefaultBlockedAppsProvider()
{
  return objc_opt_self();
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return sub_246155D34();
}

uint64_t sub_246146FB0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *a1;
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_246146FCC()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 16) + 112))
  {
    OUTLINED_FUNCTION_0_4();
    v1 = sub_246155A94();
    swift_release();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
  }
  else
  {
    sub_246147360();
    swift_allocError();
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_246147088()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 112))
  {
    OUTLINED_FUNCTION_0_4();
    sub_246155AAC();
    swift_release();
  }
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_2461470D8()
{
  sub_246147088();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for VectorDBWriteClientManager()
{
  return objc_opt_self();
}

uint64_t sub_246147110()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 112))
  {
    OUTLINED_FUNCTION_0_4();
    sub_246155A70();
    return OUTLINED_FUNCTION_2_2();
  }
  else
  {
    sub_246147360();
    OUTLINED_FUNCTION_3();
    return OUTLINED_FUNCTION_1_3();
  }
}

uint64_t sub_24614715C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  if (*(_QWORD *)(v1 + 112))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25441C9A0);
    v5 = sub_246155B00();
    v6 = *(_QWORD *)(v5 - 8);
    v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_246156AB0;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 16))(v3 + v7, a1, v5);
    OUTLINED_FUNCTION_0_4();
    sub_246155A64();
    if (v2)
    {
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      v3 = sub_246155A88();
      OUTLINED_FUNCTION_2_2();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_246147360();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_1_3();
  }
  return v3;
}

uint64_t sub_24614727C()
{
  return 1;
}

uint64_t sub_246147284()
{
  return sub_246155FF8();
}

uint64_t sub_2461472A8()
{
  sub_246155FEC();
  sub_246155FF8();
  return sub_246156010();
}

uint64_t sub_2461472F0()
{
  sub_246155FEC();
  sub_246155FF8();
  return sub_246156010();
}

uint64_t sub_24614733C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_246147348()
{
  return sub_24614733C();
}

unint64_t sub_246147360()
{
  unint64_t result;

  result = qword_25754D7A8;
  if (!qword_25754D7A8)
  {
    result = MEMORY[0x249551438](&unk_246156BD4, &type metadata for VectorDBWriteClientManager.DBWriteClientManagerErrors);
    atomic_store(result, (unint64_t *)&qword_25754D7A8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for VectorDBWriteClientManager.DBWriteClientManagerErrors(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for VectorDBWriteClientManager.DBWriteClientManagerErrors(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_246147430 + 4 * byte_246156AC0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_246147450 + 4 * byte_246156AC5[v4]))();
}

_BYTE *sub_246147430(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_246147450(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246147458(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246147460(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246147468(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246147470(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_24614747C()
{
  return 0;
}

ValueMetadata *type metadata accessor for VectorDBWriteClientManager.DBWriteClientManagerErrors()
{
  return &type metadata for VectorDBWriteClientManager.DBWriteClientManagerErrors;
}

unint64_t sub_246147498()
{
  unint64_t result;

  result = qword_25754D7B0;
  if (!qword_25754D7B0)
  {
    result = MEMORY[0x249551438](&unk_246156BAC, &type metadata for VectorDBWriteClientManager.DBWriteClientManagerErrors);
    atomic_store(result, (unint64_t *)&qword_25754D7B0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_allocError();
}

uint64_t sub_246147500(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_246147508()
{
  id v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  result = sub_2461476E0(v0);
  if (!v2)
  {
    if (qword_25441CCD0 != -1)
      swift_once();
    v3 = sub_246155C14();
    __swift_project_value_buffer(v3, (uint64_t)qword_25441CCB8);
    v4 = sub_246155BFC();
    v5 = sub_246155D64();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_24613C000, v4, v5, "Unable to fetch Siri locale", v6, 2u);
      MEMORY[0x2495514D4](v6, -1, -1);
    }

    return 0;
  }
  return result;
}

id sub_246147608()
{
  id result;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedConnection);
  if (result)
  {
    v1 = result;
    v2 = sub_246155C44();
    v4 = sub_24614774C(v2, v3, v1);

    return (id)(v4 != 1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_246147674()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DefaultProfanityPreferenceProvider()
{
  return objc_opt_self();
}

uint64_t sub_2461476B8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 16) = sub_246147508();
  *(_QWORD *)(v0 + 24) = v1;
  *(_BYTE *)(v0 + 32) = sub_246147608() & 1;
  return v0;
}

uint64_t sub_2461476E0(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_languageCode);

  if (!v2)
    return 0;
  v3 = sub_246155C44();

  return v3;
}

id sub_24614774C(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = (void *)sub_246155C38();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(a3, sel_effectiveBoolValueForSetting_, v4);

  return v5;
}

uint64_t sub_2461477A4@<X0>(unint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(_QWORD *, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  void (*v40)(uint64_t *, _QWORD, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  void (*v45)(_QWORD *, _QWORD, uint64_t);
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  unint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  void (*v58)(void);
  unint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  __int128 v75;
  unint64_t v76;
  __int128 v77;
  __int128 v78;
  int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  unint64_t v83;
  char *v84;
  unint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void (*v96)(_QWORD *, uint64_t, uint64_t);
  uint64_t v97;
  uint64_t v98;
  unsigned int v99;
  uint64_t v100;
  void (*v101)(_QWORD *);
  uint64_t v102;
  unint64_t v103;
  unsigned int v104;

  v100 = sub_246155B48();
  v89 = *(_QWORD *)(v100 - 8);
  MEMORY[0x24BDAC7A8](v100);
  v86 = (uint64_t **)((char *)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v88 = sub_246155B78();
  v87 = *(_QWORD *)(v88 - 8);
  result = MEMORY[0x24BDAC7A8](v88);
  v7 = (char *)&v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a1 >> 62))
  {
    v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v8)
      goto LABEL_3;
LABEL_21:
    result = OUTLINED_FUNCTION_10_0();
    v10 = MEMORY[0x24BEE4AF8];
LABEL_22:
    *a2 = v10;
    return result;
  }
  OUTLINED_FUNCTION_16_0();
  v8 = sub_246155E9C();
  result = OUTLINED_FUNCTION_10_0();
  if (!v8)
    goto LABEL_21;
LABEL_3:
  if (v8 >= 1)
  {
    v73 = a2;
    v9 = 0;
    v83 = a1 & 0xC000000000000001;
    v104 = *MEMORY[0x24BEBFE28];
    v99 = *MEMORY[0x24BEBFE48];
    v82 = *MEMORY[0x24BEBFE30];
    v81 = *MEMORY[0x24BEBFE50];
    v80 = *MEMORY[0x24BEBFE20];
    v79 = *MEMORY[0x24BEBFE40];
    v10 = MEMORY[0x24BEE4AF8];
    v78 = xmmword_246156AB0;
    v77 = xmmword_246156CB0;
    v76 = 0x80000002461570D0;
    v75 = xmmword_246156CC0;
    v85 = a1;
    v84 = v7;
    v74 = v8;
    do
    {
      v95 = v9;
      v94 = v10;
      if (v83)
      {
        v11 = (_QWORD *)MEMORY[0x249550F94](v9, a1);
      }
      else
      {
        v11 = *(_QWORD **)(a1 + 8 * v9 + 32);
        swift_retain();
      }
      OUTLINED_FUNCTION_0();
      v12 = v11[3];
      v93 = v11[2];
      v92 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25441C998);
      v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = v78;
      swift_bridgeObjectRetain();
      v14 = sub_246155CF8();
      v91 = v13;
      *(_QWORD *)(v13 + 32) = v14;
      *(_QWORD *)(v13 + 40) = v15;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25441C9B0);
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C900);
      v17 = *(_QWORD *)(v16 - 8);
      v18 = v16;
      v20 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
      v97 = *(_QWORD *)(v17 + 72);
      v19 = v97;
      v21 = swift_allocObject();
      v90 = v21;
      *(_OWORD *)(v21 + 16) = v77;
      v22 = v21 + v20;
      v23 = *(int *)(v18 + 48);
      v24 = v18;
      v102 = v18;
      v25 = (_QWORD *)(v21 + v20 + v23);
      v26 = v86;
      *v86 = 0;
      v26[1] = 0;
      v96 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v89 + 104);
      v96(v26, v104, v100);
      v103 = v22;
      OUTLINED_FUNCTION_1_4();
      v27 = v11[3];
      *v25 = v11[2];
      v25[1] = v27;
      v28 = sub_246155B54();
      v101 = *(void (**)(_QWORD *))(*(_QWORD *)(v28 - 8) + 104);
      v29 = v99;
      v98 = v28;
      v101(v25);
      v30 = (_QWORD *)(v22 + v19 + *(int *)(v24 + 48));
      *v26 = 0;
      v26[1] = 0;
      v31 = v104;
      v32 = v100;
      v33 = v96;
      v96(v26, v104, v100);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_1_4();
      v34 = v11[7];
      *v30 = v11[6];
      v30[1] = v34;
      ((void (*)(_QWORD *, uint64_t, uint64_t))v101)(v30, v29, v28);
      v35 = v97;
      v36 = (_QWORD *)(v103 + 2 * v97 + *(int *)(v102 + 48));
      *v26 = 0;
      v26[1] = 0;
      v33(v26, v31, v32);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_1_4();
      v37 = *(_QWORD *)((char *)v11 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier + 8);
      *v36 = *(_QWORD *)((char *)v11 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier);
      v36[1] = v37;
      v38 = v29;
      v39 = v11;
      v40 = (void (*)(uint64_t *, _QWORD, uint64_t))v101;
      ((void (*)(_QWORD *, uint64_t, uint64_t))v101)(v36, v38, v98);
      v41 = v35;
      v42 = 3 * v35;
      v43 = v102;
      v44 = (uint64_t *)(v103 + v42 + *(int *)(v102 + 48));
      *v26 = 0;
      v26[1] = 0;
      v45 = v96;
      v96(v26, v104, v32);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_1_4();
      *v44 = sub_246155A28();
      v44[1] = v46;
      v47 = v44;
      v48 = v98;
      v40(v47, v99, v98);
      v49 = *(int *)(v43 + 48);
      v50 = v39;
      v51 = v103;
      v52 = (uint64_t *)(v103 + 4 * v41 + v49);
      *v26 = 0;
      *((_BYTE *)v26 + 8) = 1;
      v53 = v100;
      v45(v26, v82, v100);
      OUTLINED_FUNCTION_1_4();
      *v52 = *((unsigned __int8 *)v50 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source) + 1;
      v40(v52, v81, v48);
      *v26 = 0;
      *((_BYTE *)v26 + 8) = 0;
      v54 = v53;
      v45(v26, v80, v53);
      OUTLINED_FUNCTION_1_4();
      v55 = (uint64_t)v50 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_normalizedScore;
      OUTLINED_FUNCTION_0();
      v56 = *(double *)v55;
      if (*(_BYTE *)(v55 + 8))
        v56 = 0.0;
      v57 = v102;
      *(double *)(v51 + 5 * v41 + *(int *)(v102 + 48)) = v56;
      v58 = (void (*)(void))v101;
      ((void (*)(void))v101)();
      v59 = v51 + 6 * v97;
      *(_OWORD *)v26 = v75;
      v45(v26, v104, v54);
      OUTLINED_FUNCTION_1_4();
      v60 = (_QWORD *)((char *)v50 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_zkwGenerationId);
      OUTLINED_FUNCTION_0();
      v61 = *v60;
      v62 = v60[1];
      if (!v62)
        v61 = 0;
      v63 = 0xE000000000000000;
      if (v62)
        v63 = v62;
      v64 = (_QWORD *)(v59 + *(int *)(v57 + 48));
      *v64 = v61;
      v64[1] = v63;
      v58();
      sub_246155B3C();
      sub_2461489EC();
      swift_bridgeObjectRetain();
      v65 = sub_246155C20();
      v66 = sub_24613FFB8();
      v67 = v84;
      MEMORY[0x249550CD0](v93, v92, v91, v65, v66, v68);
      v10 = v94;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v10 = OUTLINED_FUNCTION_4_1(0, *(_QWORD *)(v10 + 16) + 1);
      v69 = v74;
      v71 = *(_QWORD *)(v10 + 16);
      v70 = *(_QWORD *)(v10 + 24);
      a1 = v85;
      v72 = v95;
      if (v71 >= v70 >> 1)
        v10 = OUTLINED_FUNCTION_4_1(v70 > 1, v71 + 1);
      v9 = v72 + 1;
      *(_QWORD *)(v10 + 16) = v71 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v87 + 32))(v10+ ((*(unsigned __int8 *)(v87 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v87 + 80))+ *(_QWORD *)(v87 + 72) * v71, v67, v88);
      swift_release();
    }
    while (v69 != v9);
    result = OUTLINED_FUNCTION_10_0();
    a2 = v73;
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_246147FC8(unint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t result;
  uint64_t i;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v2 = v1;
  v10 = MEMORY[0x24BEE4AF8];
  if (!(a1 >> 62))
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = OUTLINED_FUNCTION_16_0();
    if (v4)
      goto LABEL_3;
LABEL_14:
    OUTLINED_FUNCTION_10_0();
    v8 = MEMORY[0x24BEE4AF8];
LABEL_15:
    swift_retain();
    v9 = sub_246148178(v8, v2);
    swift_release();
    swift_beginAccess();
    sub_2461484A0(v9);
    swift_endAccess();
    return swift_retain();
  }
  OUTLINED_FUNCTION_16_0();
  result = sub_246155E9C();
  v4 = result;
  if (!result)
    goto LABEL_14;
LABEL_3:
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        MEMORY[0x249550F94](i, a1);
      else
        swift_retain();
      OUTLINED_FUNCTION_0();
      swift_bridgeObjectRetain();
      v7 = sub_246155C68();
      swift_bridgeObjectRelease();
      if (v7 <= 500)
      {
        sub_246155E48();
        sub_246155E6C();
        sub_246155E78();
        sub_246155E54();
      }
      else
      {
        swift_release();
      }
    }
    OUTLINED_FUNCTION_10_0();
    v8 = v10;
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_246148178(unint64_t a1, uint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a1;
  v22 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_16;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; v4 = sub_246155E9C())
  {
    v20 = v3 & 0xC000000000000001;
    a2 += 3;
    swift_beginAccess();
    v5 = 4;
    v19 = v3;
    while (1)
    {
      if (v20)
        MEMORY[0x249550F94](v5 - 4, v3);
      else
        swift_retain();
      v6 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      v7 = *a2;
      swift_beginAccess();
      sub_24613FF7C();
      swift_bridgeObjectRetain();
      v8 = sub_246155DAC();
      sub_246142B60(v8, v9, v7);
      v10 = a2;
      v12 = v11;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) != 0)
      {
        swift_release();
        a2 = v10;
      }
      else
      {
        v13 = sub_246155DAC();
        v15 = v14;
        swift_beginAccess();
        sub_246143C10(&v21, v13, v15);
        swift_endAccess();
        v16 = swift_bridgeObjectRelease();
        MEMORY[0x249550E44](v16);
        a2 = v10;
        if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_246155D10();
        sub_246155D28();
        sub_246155D04();
      }
      ++v5;
      v3 = v19;
      if (v6 == v4)
      {
        swift_bridgeObjectRelease();
        v17 = v22;
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  v17 = MEMORY[0x24BEE4AF8];
LABEL_18:
  swift_release();
  return v17;
}

uint64_t sub_2461483E8@<X0>(uint64_t *a1@<X8>)
{
  unint64_t v2;

  OUTLINED_FUNCTION_0();
  v2 = swift_bridgeObjectRetain();
  return sub_2461477A4(v2, a1);
}

uint64_t VectorSearchAssets.Builder.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t VectorSearchAssets.Builder.__deallocating_deinit()
{
  VectorSearchAssets.Builder.deinit();
  return swift_deallocClassInstance();
}

uint64_t static VectorSearchAssets.builder()()
{
  uint64_t result;
  uint64_t v1;

  type metadata accessor for VectorSearchAssets.Builder();
  result = swift_allocObject();
  v1 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(result + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(result + 24) = v1;
  return result;
}

uint64_t sub_2461484A0(unint64_t a1)
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
    v3 = sub_246155E9C();
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
    v5 = sub_246155E9C();
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
    v4 = MEMORY[0x249550FA0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    result = sub_246148730(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_246155E9C();
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
    return sub_246155D04();
  }
  __break(1u);
  return result;
}

void sub_246148654(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v5 > *(_QWORD *)(v3 + 24) >> 1)
  {
    if (v4 <= v5)
      v8 = v4 + v2;
    else
      v8 = v4;
    sub_24614FA90(isUniquelyReferenced_nonNull_native, v8, 1, v3);
    v3 = v9;
  }
  if (!*(_QWORD *)(a1 + 16))
  {
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
  v10 = *(_QWORD *)(v3 + 16);
  if ((*(_QWORD *)(v3 + 24) >> 1) - v10 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_2461508A8(a1 + 32, v2, v3 + 24 * v10 + 32);
  if (!v2)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    *v1 = v3;
    return;
  }
  v11 = *(_QWORD *)(v3 + 16);
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    *(_QWORD *)(v3 + 16) = v13;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

uint64_t sub_246148730(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(uint64_t **, _QWORD);
  void (*v11)(uint64_t **, _QWORD);
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14[4];

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_246155E9C();
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
      v8 = sub_246155E9C();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_246148A2C();
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_25754D7B8);
            sub_2461488B4(v14, i, a3);
            v11 = v10;
            v13 = *v12;
            swift_retain();
            v11(v14, 0);
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
        sub_2461506F8((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
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

void sub_2461488B4(uint64_t **a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v6;
  uint64_t v7;

  v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  sub_24614892C(v6, a2, a3);
  v6[4] = v7;
  OUTLINED_FUNCTION_36();
}

void sub_246148900(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void sub_24614892C(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;

  v6 = a3 & 0xC000000000000001;
  sub_246151230(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6)
    v7 = MEMORY[0x249550F94](a2, a3);
  else
    v7 = swift_retain();
  *a1 = v7;
  OUTLINED_FUNCTION_36();
}

uint64_t sub_246148990()
{
  return swift_release();
}

uint64_t type metadata accessor for VectorSearchAssets.Builder()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for VectorSearchAssets()
{
  return &type metadata for VectorSearchAssets;
}

uint64_t method lookup function for VectorSearchAssets.Builder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of VectorSearchAssets.Builder.withPhrases(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of VectorSearchAssets.Builder.build()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

unint64_t sub_2461489EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25441C8F8;
  if (!qword_25441C8F8)
  {
    v1 = sub_246155B3C();
    result = MEMORY[0x249551438](MEMORY[0x24BEBFE10], v1);
    atomic_store(result, (unint64_t *)&qword_25441C8F8);
  }
  return result;
}

unint64_t sub_246148A2C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25754D7C0;
  if (!qword_25754D7C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25754D7B8);
    result = MEMORY[0x249551438](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_25754D7C0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return sub_246155B30();
}

uint64_t OUTLINED_FUNCTION_4_1(char a1, uint64_t a2)
{
  uint64_t v2;

  return sub_24614F8D8(a1, a2, 1, v2);
}

uint64_t sub_246148A84(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((a4 & 1) == 0)
    goto LABEL_2;
  sub_246155F80();
  swift_unknownObjectRetain_n();
  v10 = swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    v10 = MEMORY[0x24BEE4AF8];
  }
  v11 = *(_QWORD *)(v10 + 16);
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v11 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    sub_246151634(a1, a2, a3, a4);
    v9 = v8;
    goto LABEL_9;
  }
  v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    v9 = MEMORY[0x24BEE4AF8];
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_246148B68(unint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v14;

  v14 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_16;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      v4 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v5 = MEMORY[0x249550F94](v4, a1);
LABEL_7:
        v6 = v4 + 1;
        if (__OFADD__(v4, 1))
          goto LABEL_15;
        v8 = *(_QWORD *)(v5 + 48);
        v7 = *(_QWORD *)(v5 + 56);
        swift_bridgeObjectRetain();
        sub_246142B60(v8, v7, a2);
        v10 = v9;
        swift_bridgeObjectRelease();
        if ((v10 & 1) != 0)
        {
          swift_release();
        }
        else
        {
          sub_246155E48();
          sub_246155E6C();
          sub_246155E78();
          sub_246155E54();
        }
        ++v4;
        if (v6 == v3)
        {
          v11 = v14;
          goto LABEL_18;
        }
      }
      if (v4 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      v3 = sub_246155E9C();
      if (!v3)
        goto LABEL_17;
    }
    v5 = *(_QWORD *)(a1 + 8 * v4 + 32);
    swift_retain();
    goto LABEL_7;
  }
LABEL_17:
  v11 = MEMORY[0x24BEE4AF8];
LABEL_18:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

_QWORD *DefaultSiriAutoCompleteService.__allocating_init(featureFlagProvider:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  _QWORD *v6;
  __int128 v8[2];

  v2 = sub_246148DBC(0, a1);
  type metadata accessor for VectorDBWriteClientManager();
  v3 = swift_allocObject();
  swift_retain();
  swift_defaultActor_initialize();
  *(_QWORD *)(v3 + 112) = v2;
  type metadata accessor for DefaultProfanityPreferenceProvider();
  OUTLINED_FUNCTION_94();
  v4 = sub_2461476B8();
  type metadata accessor for DefaultBlockedAppsProvider();
  v5 = (uint64_t *)OUTLINED_FUNCTION_94();
  sub_24614974C(a1, (uint64_t)v8);
  v6 = sub_246153274(v8, v3, v4, v5);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v6;
}

uint64_t sub_246148DBC(int a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
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
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void (*v39)(_QWORD *, uint64_t, uint64_t);
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  int v59;
  uint64_t v60;
  uint64_t v61[3];
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[3];
  uint64_t v65;
  uint64_t v66;

  v51 = sub_246155B18();
  v49 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v52 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_246155B48();
  v47 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (uint64_t *)((char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = sub_246155B0C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v50 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_246155AE8();
  v55 = *(_QWORD *)(v11 - 8);
  v56 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v53 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v54 = (char *)&v46 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C9F8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2461559EC();
  v48 = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v57 = (char *)&v46 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v58 = (char *)&v46 - v21;
  sub_24614974C(a2, (uint64_t)v64);
  v59 = a1;
  if ((a1 & 1) != 0)
  {
    v22 = v65;
    v23 = v66;
    __swift_project_boxed_opaque_existential_1(v64, v65);
    v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 24))(v22, v23);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v64);
    if ((v24 & 1) == 0)
    {
      if (qword_25441CCD0 != -1)
        swift_once();
      v25 = sub_246155C14();
      __swift_project_value_buffer(v25, (uint64_t)qword_25441CCB8);
      v26 = sub_246155BFC();
      v27 = sub_246155D58();
      if (!os_log_type_enabled(v26, v27))
        goto LABEL_22;
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v61[0] = v29;
      *(_DWORD *)v28 = 136315138;
      v60 = sub_246150AC0(0xD000000000000038, 0x8000000246157D90, v61);
      sub_246155D88();
      v30 = "Function: %s > ftsQuery is not enabled. Not initializing ReadOnlyVectorDBClient";
LABEL_21:
      _os_log_impl(&dword_24613C000, v26, v27, v30, v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2495514D4](v29, -1, -1);
      MEMORY[0x2495514D4](v28, -1, -1);
LABEL_22:

      return 0;
    }
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v64);
  }
  sub_24614974C(a2, (uint64_t)v61);
  if ((v59 & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
  }
  else
  {
    v31 = v62;
    v32 = v63;
    __swift_project_boxed_opaque_existential_1(v61, v62);
    v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v31, v32);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
    if ((v33 & 1) == 0)
    {
      if (qword_25441CCD0 != -1)
        swift_once();
      v44 = sub_246155C14();
      __swift_project_value_buffer(v44, (uint64_t)qword_25441CCB8);
      v26 = sub_246155BFC();
      v27 = sub_246155D58();
      if (!os_log_type_enabled(v26, v27))
        goto LABEL_22;
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v61[0] = v29;
      *(_DWORD *)v28 = 136315138;
      v60 = sub_246150AC0(0xD000000000000038, 0x8000000246157D90, v61);
      sub_246155D88();
      v30 = "Function: %s > indexBuilding is not enabled. Not initializing WritableVectorDBClient";
      goto LABEL_21;
    }
  }
  sub_246149790((uint64_t)v17);
  v34 = v18;
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18) == 1)
  {
    sub_2461546A4((uint64_t)v17, &qword_25441C9F8);
    if (qword_25441CCD0 != -1)
      swift_once();
    v35 = sub_246155C14();
    __swift_project_value_buffer(v35, (uint64_t)qword_25441CCB8);
    v26 = sub_246155BFC();
    v27 = sub_246155D64();
    if (!os_log_type_enabled(v26, v27))
      goto LABEL_22;
    v28 = (uint8_t *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    v61[0] = v29;
    *(_DWORD *)v28 = 136315138;
    v60 = sub_246150AC0(0xD000000000000038, 0x8000000246157D90, v61);
    sub_246155D88();
    v30 = "Function: %s > Unable to create a directory for the search index";
    goto LABEL_21;
  }
  v36 = v48;
  v37 = v58;
  (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v58, v17, v34);
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v57, v37, v34);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v50, *MEMORY[0x24BEBFD60], v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C9C8);
  v46 = v34;
  sub_246155B3C();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_246156CB0;
  *v7 = 0;
  v7[1] = 0;
  v38 = *MEMORY[0x24BEBFE28];
  v39 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v47 + 104);
  v39(v7, v38, v5);
  sub_246155B30();
  *v7 = 0;
  v7[1] = 0;
  v39(v7, v38, v5);
  sub_246155B30();
  *v7 = 0;
  v7[1] = 0;
  v39(v7, v38, v5);
  sub_246155B30();
  *v7 = 0;
  v7[1] = 0;
  v39(v7, v38, v5);
  sub_246155B30();
  *v7 = 0;
  *((_BYTE *)v7 + 8) = 1;
  v39(v7, *MEMORY[0x24BEBFE30], v5);
  sub_246155B30();
  *v7 = 0;
  *((_BYTE *)v7 + 8) = 0;
  v39(v7, *MEMORY[0x24BEBFE20], v5);
  sub_246155B30();
  *(_OWORD *)v7 = xmmword_246156CC0;
  v39(v7, v38, v5);
  sub_246155B30();
  (*(void (**)(char *, _QWORD, uint64_t))(v49 + 104))(v52, *MEMORY[0x24BEBFDB8], v51);
  v40 = v54;
  sub_246155ADC();
  v42 = v55;
  v41 = v56;
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v53, v40, v56);
  sub_246155AD0();
  swift_allocObject();
  v43 = sub_246155A7C();
  sub_246155AA0();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v40, v41);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v58, v46);
  return v43;
}

uint64_t sub_24614974C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_246149790@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40[2];

  v40[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_2461559EC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v36 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v36 - v10;
  if (qword_25441CA00 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v2, (uint64_t)qword_25441CC98);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v11, v12, v2);
  v13 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v14 = (void *)sub_2461559BC();
  v40[0] = 0;
  v15 = objc_msgSend(v13, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v14, 1, 0, v40);

  if (!v15)
  {
    v38 = (void *)v3;
    v26 = v40[0];
    sub_246155998();

    swift_willThrow();
    if (qword_25441CCD0 != -1)
      swift_once();
    v27 = OUTLINED_FUNCTION_12_0();
    __swift_project_value_buffer(v27, (uint64_t)qword_25441CCB8);
    OUTLINED_FUNCTION_147((uint64_t)v6);
    OUTLINED_FUNCTION_132();
    OUTLINED_FUNCTION_132();
    v28 = sub_246155BFC();
    v29 = sub_246155D64();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = OUTLINED_FUNCTION_23();
      v36 = (_QWORD *)OUTLINED_FUNCTION_23();
      v37 = (void *)OUTLINED_FUNCTION_23();
      v40[0] = v37;
      *(_DWORD *)v30 = 136315650;
      v31 = OUTLINED_FUNCTION_9_1(25, 0x8000000246157DD0, (uint64_t *)v40);
      OUTLINED_FUNCTION_59(v31);
      *(_WORD *)(v30 + 12) = 2080;
      v32 = sub_2461559A4();
      v39 = OUTLINED_FUNCTION_136(v32, v33);
      OUTLINED_FUNCTION_55();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_85();
      *(_WORD *)(v30 + 22) = 2112;
      OUTLINED_FUNCTION_132();
      v34 = _swift_stdlib_bridgeErrorToNSError();
      OUTLINED_FUNCTION_135(v34);
      OUTLINED_FUNCTION_55();
      *v36 = v34;
      OUTLINED_FUNCTION_73();
    }

    OUTLINED_FUNCTION_73();
  }
  v16 = qword_25441CCD0;
  v17 = v40[0];
  if (v16 != -1)
    swift_once();
  v18 = OUTLINED_FUNCTION_12_0();
  __swift_project_value_buffer(v18, (uint64_t)qword_25441CCB8);
  OUTLINED_FUNCTION_147((uint64_t)v9);
  v19 = sub_246155BFC();
  v20 = sub_246155D4C();
  if (OUTLINED_FUNCTION_112(v19))
  {
    v21 = OUTLINED_FUNCTION_23();
    v38 = (void *)OUTLINED_FUNCTION_23();
    v40[0] = v38;
    *(_DWORD *)v21 = 136315394;
    v22 = OUTLINED_FUNCTION_9_1(25, 0x8000000246157DD0, (uint64_t *)v40);
    OUTLINED_FUNCTION_59(v22);
    *(_WORD *)(v21 + 12) = 2080;
    v23 = sub_2461559A4();
    v25 = OUTLINED_FUNCTION_136(v23, v24);
    OUTLINED_FUNCTION_135(v25);
    sub_246155D88();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_160((uint64_t)v9, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    OUTLINED_FUNCTION_20_0(&dword_24613C000, v19, v20, "Function: %s > creating DB directory path: %s", (uint8_t *)v21);
    OUTLINED_FUNCTION_57();
    OUTLINED_FUNCTION_12();
  }
  OUTLINED_FUNCTION_160((uint64_t)v9, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));

  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v11, v2);
  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v2);
}

uint64_t sub_246149CA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v0 = sub_2461559EC();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_25441CC98);
  __swift_project_value_buffer(v0, (uint64_t)qword_25441CC98);
  sub_2461559B0();
  sub_2461559C8();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

uint64_t DefaultSiriAutoCompleteService.dropDB()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_23_0();
}

uint64_t sub_246149D8C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 56);
  return OUTLINED_FUNCTION_23_0();
}

uint64_t sub_246149DA4()
{
  uint64_t v0;

  sub_246147110();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DefaultSiriAutoCompleteService.deletePhrasesForSource(source:)(_BYTE *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v2 + 56) = v1;
  v4 = OUTLINED_FUNCTION_82();
  *(_QWORD *)(v2 + 64) = v4;
  *(_QWORD *)(v2 + 72) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 80) = OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_100();
  *(_QWORD *)(v2 + 88) = OUTLINED_FUNCTION_2_3();
  v5 = OUTLINED_FUNCTION_98();
  *(_QWORD *)(v2 + 96) = v5;
  *(_QWORD *)(v2 + 104) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 112) = OUTLINED_FUNCTION_2_3();
  *(_BYTE *)(v2 + 144) = *a1;
  OUTLINED_FUNCTION_27_0();
  return OUTLINED_FUNCTION_96();
}

uint64_t sub_246149E6C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __n128 *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(unsigned __int8 *)(v1 + 144);
  OUTLINED_FUNCTION_116();
  *(_BYTE *)(v0 + 8) = 1;
  OUTLINED_FUNCTION_156(v5);
  OUTLINED_FUNCTION_64();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C9A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C8F0);
  v6 = (__n128 *)OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_153(v6, (__n128)xmmword_246156AB0);
  v7 = OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_71(v7);
  *v2 = v4 + 1;
  v8 = OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_56(v8);
  OUTLINED_FUNCTION_63();
  *(_QWORD *)(v1 + 120) = *(_QWORD *)(v3 + 56);
  return OUTLINED_FUNCTION_96();
}

uint64_t sub_246149F40()
{
  uint64_t v0;
  uint64_t *v1;

  v1[16] = OUTLINED_FUNCTION_128(v1[14]);
  v1[17] = v0;
  OUTLINED_FUNCTION_27_0();
  return OUTLINED_FUNCTION_14_1();
}

uint64_t sub_246149F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;

  OUTLINED_FUNCTION_22_0();
  a23 = v29;
  a24 = v30;
  a22 = v27;
  if (qword_25441C970 != -1)
    swift_once();
  v31 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_17_1(v31, (uint64_t)qword_25441C958);
  v32 = OUTLINED_FUNCTION_26_0();
  if (OUTLINED_FUNCTION_11_1(v32))
  {
    v36 = *(_QWORD *)(v27 + 128);
    v33 = *(unsigned __int8 *)(v27 + 144) + 1;
    v34 = OUTLINED_FUNCTION_23();
    a13 = OUTLINED_FUNCTION_23();
    *(_DWORD *)v34 = 136315650;
    *(_QWORD *)(v27 + 32) = OUTLINED_FUNCTION_9_1(31, 0x8000000246157630, &a13);
    OUTLINED_FUNCTION_55();
    *(_WORD *)(v34 + 12) = 2048;
    *(_QWORD *)(v27 + 40) = v33;
    OUTLINED_FUNCTION_131();
    sub_246155D88();
    *(_WORD *)(v34 + 22) = 2048;
    *(_QWORD *)(v27 + 48) = v36;
    sub_246155D88();
    OUTLINED_FUNCTION_101(&dword_24613C000, v25, (os_log_type_t)v28, "Function: %s > Successfully deleted all phrases with source %lld with return code: %ld", (uint8_t *)v34);
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_12();
  }
  OUTLINED_FUNCTION_133();
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v24, v26);
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_51();
  return OUTLINED_FUNCTION_5_0(*(uint64_t (**)(void))(v27 + 8));
}

void sub_24614A12C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_22_0();
  a23 = v25;
  a24 = v26;
  a22 = v24;
  if (qword_25441C970 != -1)
    swift_once();
  v27 = OUTLINED_FUNCTION_12_0();
  __swift_project_value_buffer(v27, (uint64_t)qword_25441C958);
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_49();
  v28 = OUTLINED_FUNCTION_108();
  sub_246155D4C();
  if (OUTLINED_FUNCTION_112(v28))
  {
    v29 = OUTLINED_FUNCTION_23();
    v30 = (_QWORD *)OUTLINED_FUNCTION_23();
    a13 = OUTLINED_FUNCTION_23();
    *(_DWORD *)v29 = 136315394;
    *(_QWORD *)(v24 + 16) = OUTLINED_FUNCTION_9_1(31, 0x8000000246157630, &a13);
    OUTLINED_FUNCTION_55();
    *(_WORD *)(v29 + 12) = 2112;
    OUTLINED_FUNCTION_32();
    v31 = OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_69(v31);
    *v30 = v29 + 4;
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_2();
}

uint64_t DefaultSiriAutoCompleteService.deletePhrasesForApp(bundleIds:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[7] = a1;
  v2[8] = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C8F0);
  v2[9] = v3;
  v2[10] = *(_QWORD *)(v3 - 8);
  v2[11] = OUTLINED_FUNCTION_2_3();
  v4 = OUTLINED_FUNCTION_82();
  v2[12] = v4;
  v2[13] = *(_QWORD *)(v4 - 8);
  v2[14] = OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_100();
  v2[15] = OUTLINED_FUNCTION_2_3();
  v5 = OUTLINED_FUNCTION_98();
  v2[16] = v5;
  v2[17] = *(_QWORD *)(v5 - 8);
  v2[18] = OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_27_0();
  return OUTLINED_FUNCTION_3_0();
}

uint64_t sub_24614A394()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void (*v14)(_QWORD *, _QWORD, uint64_t);
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v21)(void);
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;

  OUTLINED_FUNCTION_22_0();
  v1 = (_QWORD *)v0[14];
  v2 = v0[12];
  v3 = v0[13];
  v4 = v0[7];
  *v1 = 0;
  v1[1] = 0;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v1, *MEMORY[0x24BEBFE28], v2);
  sub_246155B30();
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v6 = v0[10];
    v23 = v0[9];
    v24 = MEMORY[0x24BEE4AF8];
    v7 = v0[7];
    sub_2461512EC(0, v5, 0);
    v22 = *MEMORY[0x24BEBFE48];
    OUTLINED_FUNCTION_97();
    OUTLINED_FUNCTION_122();
    v21 = v8;
    v9 = (uint64_t *)(v7 + 40);
    do
    {
      v10 = *(v9 - 1);
      v11 = *v9;
      v12 = (_QWORD *)(v0[11] + *(int *)(v23 + 48));
      v21();
      *v12 = v10;
      v12[1] = v11;
      v13 = OUTLINED_FUNCTION_99();
      OUTLINED_FUNCTION_122();
      v14(v12, v22, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v13);
      v16 = *(_QWORD *)(v24 + 16);
      v15 = *(_QWORD *)(v24 + 24);
      OUTLINED_FUNCTION_37();
      if (v16 >= v15 >> 1)
        sub_2461512EC(v15 > 1, v16 + 1, 1);
      *(_QWORD *)(v24 + 16) = v16 + 1;
      OUTLINED_FUNCTION_172();
      sub_2461533E0(v18, v24 + v17 + *(_QWORD *)(v6 + 72) * v16);
      v9 += 2;
      --v5;
    }
    while (v5);
  }
  v19 = v0[8];
  sub_246155AF4();
  v0[19] = *(_QWORD *)(v19 + 56);
  return OUTLINED_FUNCTION_30_0();
}

uint64_t sub_24614A54C()
{
  uint64_t v0;
  uint64_t *v1;

  v1[20] = OUTLINED_FUNCTION_128(v1[18]);
  v1[21] = v0;
  OUTLINED_FUNCTION_27_0();
  return OUTLINED_FUNCTION_14_1();
}

uint64_t sub_24614A594()
{
  _QWORD *v0;
  os_log_type_t v1;
  NSObject *v2;
  uint64_t v3;
  os_log_type_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t (*v14)(_BOOL8);
  uint64_t v16;
  uint64_t v17;

  if (qword_25441C970 != -1)
    swift_once();
  v2 = v0[7];
  v3 = OUTLINED_FUNCTION_12_0();
  __swift_project_value_buffer(v3, (uint64_t)qword_25441C958);
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_108();
  v4 = OUTLINED_FUNCTION_26_0();
  if (OUTLINED_FUNCTION_67(v4))
  {
    v16 = v0[20];
    v5 = OUTLINED_FUNCTION_23();
    v17 = OUTLINED_FUNCTION_23();
    *(_DWORD *)v5 = 136315650;
    OUTLINED_FUNCTION_142();
    v0[4] = OUTLINED_FUNCTION_9_1(31, v6, &v17);
    OUTLINED_FUNCTION_79();
    OUTLINED_FUNCTION_86();
    *(_WORD *)(v5 + 12) = 2048;
    v0[5] = v16;
    sub_246155D88();
    *(_WORD *)(v5 + 22) = 2080;
    v7 = OUTLINED_FUNCTION_84();
    v8 = MEMORY[0x249550E5C](v7, MEMORY[0x24BEE0D00]);
    OUTLINED_FUNCTION_44_0();
    v0[6] = OUTLINED_FUNCTION_106(v8, v9, &v17);
    OUTLINED_FUNCTION_55();
    OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_101(&dword_24613C000, v2, v1, "Function: %s > Successfully deleted %ld phrases from apps - %s", (uint8_t *)v5);
    OUTLINED_FUNCTION_57();
    OUTLINED_FUNCTION_12();
  }
  v11 = v0[17];
  v10 = v0[18];
  v12 = v0[16];

  OUTLINED_FUNCTION_36_0();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_125();
  v13 = OUTLINED_FUNCTION_155();
  return v14(v13);
}

void sub_24614A7C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_22_0();
  v10 = v1;
  v11 = v2;
  v9 = v0;
  if (qword_25441C970 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_12_0();
  __swift_project_value_buffer(v3, (uint64_t)qword_25441C958);
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_49();
  v4 = OUTLINED_FUNCTION_108();
  sub_246155D4C();
  if (OUTLINED_FUNCTION_112(v4))
  {
    v5 = OUTLINED_FUNCTION_23();
    v6 = (_QWORD *)OUTLINED_FUNCTION_23();
    v8 = OUTLINED_FUNCTION_23();
    *(_DWORD *)v5 = 136315394;
    *(_QWORD *)(v0 + 16) = OUTLINED_FUNCTION_9_1(31, 0x8000000246157650, &v8);
    OUTLINED_FUNCTION_55();
    *(_WORD *)(v5 + 12) = 2112;
    OUTLINED_FUNCTION_32();
    v7 = OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_69(v7);
    *v6 = v5 + 4;
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_2();
}

uint64_t DefaultSiriAutoCompleteService.addPhrasesToVectorDB(vectorSearchAssets:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *a1;
  *(_QWORD *)(v2 + 80) = v1;
  *(_QWORD *)(v2 + 88) = v3;
  return OUTLINED_FUNCTION_23_0();
}

uint64_t sub_24614A9D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _QWORD *a20,uint64_t a21,uint64_t a22)
{
  NSObject *v22;
  _QWORD *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v45;
  uint64_t *v46;

  OUTLINED_FUNCTION_129();
  a21 = v25;
  a22 = v26;
  a20 = v23;
  v27 = v23[11];
  if (*(_QWORD *)(v27 + 16))
  {
    if (qword_25441C970 != -1)
      swift_once();
    v28 = OUTLINED_FUNCTION_12_0();
    v23[12] = v28;
    v29 = __swift_project_value_buffer(v28, (uint64_t)qword_25441C958);
    OUTLINED_FUNCTION_26();
    v30 = v29;
    sub_246155BFC();
    v31 = OUTLINED_FUNCTION_26_0();
    if (OUTLINED_FUNCTION_11_1(v31))
    {
      v32 = OUTLINED_FUNCTION_23();
      a11 = OUTLINED_FUNCTION_23();
      *(_DWORD *)v32 = 136315394;
      v23[7] = OUTLINED_FUNCTION_9_1(41, 0x8000000246157670, &a11);
      OUTLINED_FUNCTION_86();
      *(_WORD *)(v32 + 12) = 2048;
      v23[8] = *(_QWORD *)(v27 + 16);
      sub_246155D88();
      OUTLINED_FUNCTION_144();
      OUTLINED_FUNCTION_20_0(&dword_24613C000, v30, v24, "Function: %s > Adding %ld phrases to the index", (uint8_t *)v32);
      OUTLINED_FUNCTION_7_0();
      OUTLINED_FUNCTION_12();
    }
    OUTLINED_FUNCTION_144();

    v23[2] = v23[11];
    v45 = (_QWORD *)swift_task_alloc();
    v23[13] = v45;
    OUTLINED_FUNCTION_139(v45, (uint64_t)sub_24614AC84);
    OUTLINED_FUNCTION_61();
    return sub_246146FB0(v46);
  }
  else
  {
    if (qword_25441C970 != -1)
      swift_once();
    v33 = OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_17_1(v33, (uint64_t)qword_25441C958);
    v34 = OUTLINED_FUNCTION_26_0();
    if (OUTLINED_FUNCTION_11_1(v34))
    {
      v35 = (uint8_t *)OUTLINED_FUNCTION_23();
      a11 = OUTLINED_FUNCTION_23();
      *(_DWORD *)v35 = 136315138;
      v23[9] = OUTLINED_FUNCTION_9_1(41, 0x8000000246157670, &a11);
      OUTLINED_FUNCTION_62();
      OUTLINED_FUNCTION_17_0(&dword_24613C000, v22, v24, "Function: %s > addPhrasesToVectorDB called with 0 phrases; no-op",
        v35);
      OUTLINED_FUNCTION_7_0();
      OUTLINED_FUNCTION_12();
    }

    OUTLINED_FUNCTION_61();
    return v37(v36, v37, v38, v39, v40, v41, v42, v43, a9, a10, a11, a12, a13, a14);
  }
}

uint64_t sub_24614AC84(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 112) = a1;
  *(_QWORD *)(v3 + 120) = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_27_0();
  return OUTLINED_FUNCTION_3_0();
}

uint64_t sub_24614ACE4()
{
  NSObject *v0;
  os_log_type_t v1;
  uint64_t v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;

  if (qword_25441CCD0 != -1)
    swift_once();
  OUTLINED_FUNCTION_17_1(*(_QWORD *)(v2 + 96), (uint64_t)qword_25441CCB8);
  v3 = OUTLINED_FUNCTION_26_0();
  if (OUTLINED_FUNCTION_31_0(v3))
  {
    v4 = *(_QWORD *)(v2 + 112);
    v5 = OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    *(_DWORD *)v5 = 136315394;
    OUTLINED_FUNCTION_77();
    *(_QWORD *)(v2 + 40) = OUTLINED_FUNCTION_9_1(41, v6, v7);
    sub_246155D88();
    *(_WORD *)(v5 + 12) = 2048;
    *(_QWORD *)(v2 + 48) = v4;
    sub_246155D88();
    OUTLINED_FUNCTION_20_0(&dword_24613C000, v0, v1, "Function: %s > Phrase insertion into VectorDB completed. Successfully inserted %ld records", (uint8_t *)v5);
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_12();
  }

  return OUTLINED_FUNCTION_81(*(_QWORD *)(v2 + 112), *(uint64_t (**)(void))(v2 + 8));
}

void sub_24614AE38()
{
  _QWORD *v0;
  os_log_type_t v1;
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  if (qword_25441CCD0 != -1)
    swift_once();
  __swift_project_value_buffer(v0[12], (uint64_t)qword_25441CCB8);
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_108();
  v1 = OUTLINED_FUNCTION_26_0();
  if (OUTLINED_FUNCTION_11_1(v1))
  {
    v2 = OUTLINED_FUNCTION_23();
    v3 = (_QWORD *)OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    *(_DWORD *)v2 = 136315394;
    OUTLINED_FUNCTION_111();
    v0[3] = OUTLINED_FUNCTION_9_1(41, v4, v5);
    OUTLINED_FUNCTION_131();
    OUTLINED_FUNCTION_86();
    *(_WORD *)(v2 + 12) = 2112;
    OUTLINED_FUNCTION_161();
    v6 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v6;
    sub_246155D88();
    *v3 = v6;
    OUTLINED_FUNCTION_42_0();
  }
  OUTLINED_FUNCTION_42_0();
}

uint64_t DefaultSiriAutoCompleteService.increaseTapCountForPhrase(phrase:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  v3[6] = *v2;
  return OUTLINED_FUNCTION_23_0();
}

uint64_t sub_24614B01C()
{
  os_log_type_t v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  unint64_t v10;
  uint64_t *v11;

  v2 = *(NSObject **)(v1 + 48);
  v3 = sub_246148DBC(1, *(_QWORD *)(v1 + 40) + 16);
  *(_QWORD *)(v1 + 56) = v3;
  if (v3)
  {
    v4 = v3;
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 64) = v5;
    *v5 = v1;
    v5[1] = sub_24614B1AC;
    return DefaultSiriAutoCompleteService.increaseTapCountForPhrase(phrase:readOnlyClient:)(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), v4);
  }
  else
  {
    if (qword_25441C970 != -1)
      swift_once();
    v7 = OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_17_1(v7, (uint64_t)qword_25441C958);
    v8 = OUTLINED_FUNCTION_162();
    if (OUTLINED_FUNCTION_31_0(v8))
    {
      v9 = (uint8_t *)OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_23();
      *(_DWORD *)v9 = 136315138;
      OUTLINED_FUNCTION_111();
      *(_QWORD *)(v1 + 16) = OUTLINED_FUNCTION_9_1(34, v10, v11);
      OUTLINED_FUNCTION_62();
      OUTLINED_FUNCTION_17_0(&dword_24613C000, v2, v0, "Function: %s > Unable to fetch autoCompleteResults; VectorDatabaseClient was not created",
        v9);
      OUTLINED_FUNCTION_7_0();
      OUTLINED_FUNCTION_12();
    }

    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24614B1AC()
{
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_27_0();
  return OUTLINED_FUNCTION_3_0();
}

uint64_t sub_24614B1E0()
{
  uint64_t v0;

  swift_release();
  return OUTLINED_FUNCTION_28(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t DefaultSiriAutoCompleteService.increaseTapCountForPhrase(phrase:readOnlyClient:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[25] = a3;
  v4[26] = v3;
  v4[23] = a1;
  v4[24] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C8D8);
  v4[27] = OUTLINED_FUNCTION_2_3();
  v5 = OUTLINED_FUNCTION_82();
  v4[28] = v5;
  v4[29] = *(_QWORD *)(v5 - 8);
  v4[30] = OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_100();
  v4[31] = OUTLINED_FUNCTION_2_3();
  v6 = OUTLINED_FUNCTION_98();
  v4[32] = v6;
  v4[33] = *(_QWORD *)(v6 - 8);
  v4[34] = OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_27_0();
  return OUTLINED_FUNCTION_3_0();
}

uint64_t sub_24614B290()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *, uint64_t, uint64_t);
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;

  OUTLINED_FUNCTION_22_0();
  v2 = *(_QWORD *)(v0 + 264);
  v1 = *(_QWORD *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD **)(v0 + 240);
  v5 = *(_QWORD *)(v0 + 224);
  v31 = *(_QWORD *)(v0 + 256);
  v6 = *(_QWORD *)(v0 + 192);
  v7 = *(_QWORD *)(v0 + 184);
  *v4 = 0;
  v4[1] = 0;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v4, *MEMORY[0x24BEBFE28], v5);
  OUTLINED_FUNCTION_173();
  sub_246155B30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C9A8);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C8F0);
  OUTLINED_FUNCTION_163();
  v11 = v10 & ~v9;
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_246156AB0;
  v13 = v12 + v11;
  v14 = (_QWORD *)(v12 + v11 + *(int *)(v8 + 48));
  v15 = *MEMORY[0x24BEBFDC8];
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_122();
  v16(v13, v15);
  *v14 = v7;
  v14[1] = v6;
  v17 = *MEMORY[0x24BEBFE48];
  v18 = OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_122();
  v19(v14, v17, v18);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v18);
  OUTLINED_FUNCTION_39_0();
  sub_246155AF4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C9A0);
  v20 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_246156AB0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 16))(v21 + v20, v1, v31);
  v22 = sub_24614BBD8();
  OUTLINED_FUNCTION_10_0();
  if (v22 >> 62)
  {
    OUTLINED_FUNCTION_25_0();
    v23 = OUTLINED_FUNCTION_158();
    OUTLINED_FUNCTION_38();
    if (v23 == 1)
    {
      OUTLINED_FUNCTION_25_0();
      if (OUTLINED_FUNCTION_158())
        goto LABEL_4;
      OUTLINED_FUNCTION_38();
      v23 = 1;
    }
  }
  else
  {
    v23 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v23 == 1)
    {
      OUTLINED_FUNCTION_25_0();
LABEL_4:
      if ((v22 & 0xC000000000000001) != 0)
      {
        v24 = MEMORY[0x249550F94](0, v22);
        goto LABEL_7;
      }
      if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v24 = *(_QWORD *)(v22 + 32);
        OUTLINED_FUNCTION_0_4();
LABEL_7:
        *(_QWORD *)(v0 + 280) = v24;
        v25 = *(_QWORD *)(v0 + 208);
        OUTLINED_FUNCTION_36_0();
        *(_QWORD *)(v0 + 288) = *(_QWORD *)(v25 + 56);
        OUTLINED_FUNCTION_0_4();
        return OUTLINED_FUNCTION_30_0();
      }
      __break(1u);
      goto LABEL_17;
    }
  }
  if (qword_25441C970 != -1)
LABEL_17:
    swift_once();
  v27 = OUTLINED_FUNCTION_12_0();
  __swift_project_value_buffer(v27, (uint64_t)qword_25441C958);
  OUTLINED_FUNCTION_25_0();
  v28 = sub_246155BFC();
  v29 = sub_246155D64();
  if (OUTLINED_FUNCTION_11_1(v29))
  {
    v30 = (uint8_t *)OUTLINED_FUNCTION_23();
    *(_DWORD *)v30 = 134217984;
    OUTLINED_FUNCTION_38();
    *(_QWORD *)(v0 + 136) = v23;
    sub_246155D88();
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_17_0(&dword_24613C000, v28, (os_log_type_t)v20, "Unexpected records retrieved count: %ld", v30);
    OUTLINED_FUNCTION_12();
  }
  OUTLINED_FUNCTION_36_0();

  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_125();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_5_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_24614B5D8()
{
  uint64_t v0;
  uint64_t *v1;

  v1[37] = OUTLINED_FUNCTION_128(v1[34]);
  v1[38] = v0;
  OUTLINED_FUNCTION_27_0();
  return OUTLINED_FUNCTION_14_1();
}

uint64_t sub_24614B624()
{
  NSObject *v0;
  _QWORD *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  _QWORD *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t inited;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;

  if (qword_25441C970 != -1)
    swift_once();
  v4 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_17_1(v4, (uint64_t)qword_25441C958);
  v5 = OUTLINED_FUNCTION_162();
  if (OUTLINED_FUNCTION_11_1(v5))
  {
    v6 = v1[37];
    v7 = OUTLINED_FUNCTION_23();
    v19 = OUTLINED_FUNCTION_23();
    *(_DWORD *)v7 = 136315394;
    OUTLINED_FUNCTION_111();
    v1[21] = OUTLINED_FUNCTION_9_1(49, v8, v9);
    sub_246155D88();
    *(_WORD *)(v7 + 12) = 2048;
    v1[22] = v6;
    sub_246155D88();
    OUTLINED_FUNCTION_20_0(&dword_24613C000, v0, v2, "Function: %s > Successfully deleted all phrases corresponding to source tapped suggestion: %ld", (uint8_t *)v7);
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_12();
  }

  v10 = (_QWORD *)(v1[35] + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_tapCount);
  result = OUTLINED_FUNCTION_1();
  if (__OFADD__(*v10, 1))
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_45_0(*v10 + 1);
    v12 = OUTLINED_FUNCTION_127();
    OUTLINED_FUNCTION_88(v12);
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_143();
    swift_endAccess();
    OUTLINED_FUNCTION_169();
    inited = swift_initStackObject();
    v14 = MEMORY[0x24BEE4B08];
    *(_QWORD *)(inited + 16) = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(inited + 24) = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754D7F8);
    v15 = OUTLINED_FUNCTION_137();
    *(_OWORD *)(v15 + 16) = xmmword_246156D70;
    *(_QWORD *)(v15 + 32) = v3;
    v19 = v15;
    sub_246155D04();
    OUTLINED_FUNCTION_167();
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_15();
    sub_2461483E8(&v19);
    OUTLINED_FUNCTION_117();
    v16 = v19;
    v1[39] = v19;
    v1[18] = v16;
    v17 = (_QWORD *)swift_task_alloc();
    v1[40] = v17;
    v18 = (uint64_t *)OUTLINED_FUNCTION_138(v17, (uint64_t)sub_24614B884);
    return DefaultSiriAutoCompleteService.addPhrasesToVectorDB(vectorSearchAssets:)(v18);
  }
  return result;
}

uint64_t sub_24614B884()
{
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_27_0();
  return OUTLINED_FUNCTION_3_0();
}

uint64_t sub_24614B8BC()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_125();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_24614B90C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  os_log_type_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;

  OUTLINED_FUNCTION_129();
  a21 = v23;
  a22 = v24;
  a20 = v22;
  if (qword_25441C970 != -1)
    swift_once();
  v25 = OUTLINED_FUNCTION_12_0();
  __swift_project_value_buffer(v25, (uint64_t)qword_25441C958);
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_49();
  sub_246155BFC();
  v26 = sub_246155D64();
  if (OUTLINED_FUNCTION_67(v26))
  {
    v27 = OUTLINED_FUNCTION_23();
    v28 = (_QWORD *)OUTLINED_FUNCTION_23();
    v29 = OUTLINED_FUNCTION_23();
    *(_DWORD *)v27 = 136315394;
    a11 = v29;
    *(_QWORD *)(v22 + 152) = OUTLINED_FUNCTION_9_1(49, 0x80000002461576D0, &a11);
    OUTLINED_FUNCTION_55();
    *(_WORD *)(v27 + 12) = 2112;
    OUTLINED_FUNCTION_32();
    v30 = OUTLINED_FUNCTION_124();
    *(_QWORD *)(v22 + 160) = v30;
    sub_246155D88();
    *v28 = v30;
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_2();
}

uint64_t sub_24614BBD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void (*v9)(char *, unint64_t, uint64_t);
  uint64_t v10;
  _QWORD v12[2];
  uint64_t v13;

  v0 = sub_246155B78();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BEE4AF8];
  v4 = sub_246155AC4();
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v6 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
    v12[1] = v4;
    v7 = v4 + v6;
    v8 = *(_QWORD *)(v1 + 72);
    v9 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    do
    {
      v9(v3, v7, v0);
      if (sub_24614C070())
      {
        v10 = swift_retain();
        MEMORY[0x249550E44](v10);
        if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_246155D10();
        sub_246155D28();
        sub_246155D04();
        swift_release();
      }
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      v7 += v8;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    return v13;
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
}

void DefaultSiriAutoCompleteService.fetchPhrasesMatching(filters:)()
{
  void *v0;
  uint64_t v1;
  os_log_type_t v2;
  unint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  if (OUTLINED_FUNCTION_109())
  {
    sub_24614BBD8();
    swift_release();
  }
  else
  {
    if (qword_25441C970 != -1)
      swift_once();
    v1 = OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_17_1(v1, (uint64_t)qword_25441C958);
    v2 = OUTLINED_FUNCTION_171();
    if (OUTLINED_FUNCTION_32_0(v2))
    {
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_110(4.8149e-34);
      OUTLINED_FUNCTION_77();
      OUTLINED_FUNCTION_9_1(30, v3, v4);
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_43_0(&dword_24613C000, v5, v6, "Function: %s > Unable to fetch autoCompleteResults; VectorDatabaseClient was not created");
      OUTLINED_FUNCTION_7_0();
      OUTLINED_FUNCTION_12();
    }

  }
  OUTLINED_FUNCTION_87();
}

uint64_t sub_24614C070()
{
  void *v0;
  os_log_type_t v1;
  unint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v14;

  sub_246155B6C();
  if (v2 >> 60 == 15)
  {
    if (qword_25441C970 != -1)
      swift_once();
    v3 = OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_17_1(v3, (uint64_t)qword_25441C958);
    v4 = OUTLINED_FUNCTION_171();
    if (OUTLINED_FUNCTION_32_0(v4))
    {
      OUTLINED_FUNCTION_23();
      v14 = OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_110(4.8149e-34);
      OUTLINED_FUNCTION_9_1(28, 0x8000000246157A60, &v14);
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_43_0(&dword_24613C000, v5, v6, "Function: %s > Missing payload in asset returned by the search index");
      OUTLINED_FUNCTION_7_0();
      OUTLINED_FUNCTION_12();
    }

    return 0;
  }
  v7 = type metadata accessor for AutoCompletePhrase();
  OUTLINED_FUNCTION_79();
  v8 = sub_24614017C();
  if (!v8)
  {
    if (qword_25441C970 != -1)
      swift_once();
    v10 = OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_17_1(v10, (uint64_t)qword_25441C958);
    v11 = OUTLINED_FUNCTION_162();
    if (OUTLINED_FUNCTION_11_1(v11))
    {
      v12 = (uint8_t *)OUTLINED_FUNCTION_23();
      v14 = OUTLINED_FUNCTION_23();
      *(_DWORD *)v12 = 136315138;
      OUTLINED_FUNCTION_9_1(28, 0x8000000246157A60, &v14);
      OUTLINED_FUNCTION_62();
      OUTLINED_FUNCTION_17_0(&dword_24613C000, v7, v1, "Function: %s > Unable to deserialize the payload returned from the search index", v12);
      OUTLINED_FUNCTION_7_0();
      OUTLINED_FUNCTION_12();
    }
    OUTLINED_FUNCTION_168();

    return 0;
  }
  v9 = v8;
  OUTLINED_FUNCTION_168();
  return v9;
}

void static DefaultSiriAutoCompleteService.databaseExists()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_2461559EC();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  if (qword_25441CA00 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_25441CC98);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  sub_2461559C8();
  v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v4, v0);
  v7 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_2461559E0();
  v8 = (void *)sub_246155C38();
  OUTLINED_FUNCTION_1_0();
  objc_msgSend(v7, sel_fileExistsAtPath_, v8);

  v9 = OUTLINED_FUNCTION_79();
  ((void (*)(uint64_t))v6)(v9);
  OUTLINED_FUNCTION_104();
}

void DefaultSiriAutoCompleteService.autoCompleteResults(for:)(uint64_t a1, unint64_t a2)
{
  void *v2;
  uint64_t v5;
  os_log_type_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  if (OUTLINED_FUNCTION_109())
  {
    DefaultSiriAutoCompleteService.autoCompleteResults(for:readDatabaseClient:)(a1, a2);
    swift_release();
  }
  else
  {
    if (qword_25441C970 != -1)
      swift_once();
    v5 = OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_17_1(v5, (uint64_t)qword_25441C958);
    v6 = OUTLINED_FUNCTION_171();
    if (OUTLINED_FUNCTION_32_0(v6))
    {
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_110(4.8149e-34);
      OUTLINED_FUNCTION_77();
      OUTLINED_FUNCTION_9_1(25, v7, v8);
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_43_0(&dword_24613C000, v9, v10, "Function: %s > Unable to fetch autoCompleteResults; VectorDatabaseClient was not created");
      OUTLINED_FUNCTION_7_0();
      OUTLINED_FUNCTION_12();
    }

  }
  OUTLINED_FUNCTION_87();
}

void DefaultSiriAutoCompleteService.autoCompleteResults(for:readDatabaseClient:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t *v26;
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
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t, uint64_t);
  uint64_t v54;
  unint64_t v55;
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
  uint64_t v68[2];

  v63 = sub_246155B78();
  v67 = *(_QWORD *)(v63 - 8);
  OUTLINED_FUNCTION_68();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_10();
  v8 = v7 - v6;
  v9 = OUTLINED_FUNCTION_82();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_115();
  v65 = *(_QWORD *)(sub_246155938() - 8);
  OUTLINED_FUNCTION_68();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_10();
  type metadata accessor for SignpostLogger();
  if (qword_25754D580 != -1)
    swift_once();
  v11 = qword_25754D6F8;
  OUTLINED_FUNCTION_38_0();
  static SignpostLogger.begin(log:name:telemetry:)(v12, v13, v14, v15, v16, v17, v18);
  v19 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v19 = a1 & 0xFFFFFFFFFFFFLL;
  if (v19)
  {
    if (qword_25441C970 != -1)
      swift_once();
    v20 = OUTLINED_FUNCTION_12_0();
    v21 = __swift_project_value_buffer(v20, (uint64_t)qword_25441C958);
    OUTLINED_FUNCTION_93();
    sub_246155BFC();
    v22 = OUTLINED_FUNCTION_26_0();
    if (OUTLINED_FUNCTION_31_0(v22))
    {
      v23 = OUTLINED_FUNCTION_23();
      v68[0] = OUTLINED_FUNCTION_23();
      *(_DWORD *)v23 = 136315394;
      OUTLINED_FUNCTION_9_1(44, 0x8000000246157770, v68);
      OUTLINED_FUNCTION_86();
      *(_WORD *)(v23 + 12) = 2080;
      OUTLINED_FUNCTION_37();
      v24 = OUTLINED_FUNCTION_131();
      sub_246150AC0(v24, v25, v26);
      OUTLINED_FUNCTION_86();
      OUTLINED_FUNCTION_130();
      OUTLINED_FUNCTION_20_0(&dword_24613C000, v21, v11, "Function: %s > Fetching autocomplete results for: '%s'", (uint8_t *)v23);
      OUTLINED_FUNCTION_57();
      OUTLINED_FUNCTION_12();
    }

    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_131();
    sub_246155C50();
    v68[1] = v34;
    sub_24615592C();
    sub_24613FF7C();
    v35 = sub_246155DB8();
    v37 = v36;
    OUTLINED_FUNCTION_134(v65);
    swift_bridgeObjectRelease();
    v68[0] = MEMORY[0x24BEE4AF8];
    v64 = v35;
    v66 = v37;
    sub_24614CC5C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754D800);
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25754D808);
    v39 = *(_QWORD *)(v38 - 8);
    v40 = *(_QWORD *)(v39 + 72);
    v41 = (*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
    v42 = OUTLINED_FUNCTION_154();
    *(_OWORD *)(v42 + 16) = xmmword_246156910;
    v43 = v42 + v41;
    v44 = *(int *)(v38 + 48);
    *(_QWORD *)v2 = 0;
    *(_BYTE *)(v2 + 8) = 1;
    OUTLINED_FUNCTION_145(v42, *MEMORY[0x24BEBFE30]);
    v45 = sub_246155B30();
    *(_BYTE *)(v43 + v44) = 1;
    v46 = *(int *)(v38 + 48);
    *(_QWORD *)v2 = 0;
    *(_BYTE *)(v2 + 8) = 0;
    OUTLINED_FUNCTION_145(v45, *MEMORY[0x24BEBFE20]);
    sub_246155B30();
    *(_BYTE *)(v43 + v40 + v46) = 0;
    v47 = sub_246155AB8();
    OUTLINED_FUNCTION_15_0();
    OUTLINED_FUNCTION_45();
    v48 = *(_QWORD *)(v47 + 16);
    if (v48)
    {
      OUTLINED_FUNCTION_172();
      v50 = v47 + v49;
      v52 = *(_QWORD *)(v51 + 72);
      v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16);
      do
      {
        v53(v8, v50, v63);
        if (sub_24614C070())
        {
          v54 = swift_retain();
          MEMORY[0x249550E44](v54);
          v55 = *(_QWORD *)((v68[0] & 0xFFFFFFFFFFFFFF8) + 0x18);
          if (*(_QWORD *)((v68[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= v55 >> 1)
          {
            OUTLINED_FUNCTION_150(v55);
            sub_246155D10();
          }
          OUTLINED_FUNCTION_113();
          sub_246155D28();
          sub_246155D04();
          swift_release();
        }
        (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v8, v63);
        v50 += v52;
        --v48;
      }
      while (v48);
    }
    OUTLINED_FUNCTION_38();
    sub_246155AAC();
    sub_24614CF40(v68[0], v64, v66);
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_38_0();
    static SignpostLogger.end(log:name:telemetry:)(v56, v57, v58, v59, v60, v61, v62);
  }
  else
  {
    OUTLINED_FUNCTION_38_0();
    static SignpostLogger.end(log:name:telemetry:)(v27, v28, v29, v30, v31, v32, v33);
  }
  OUTLINED_FUNCTION_70();
}

void sub_24614CC5C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
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
  void (*v21)(uint64_t, _QWORD);
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  char v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;

  v0 = OUTLINED_FUNCTION_82();
  v38 = *(_QWORD *)(v0 - 8);
  v39 = v0;
  OUTLINED_FUNCTION_68();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_18();
  v37 = v2;
  OUTLINED_FUNCTION_100();
  OUTLINED_FUNCTION_68();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_98();
  OUTLINED_FUNCTION_68();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_10();
  v7 = v6 - v5;
  sub_24613FF7C();
  v8 = OUTLINED_FUNCTION_148();
  v9 = *(_QWORD *)(v8 + 16);
  if (v9)
  {
    v35 = *MEMORY[0x24BEBFDC8];
    v36 = *MEMORY[0x24BEBFE28];
    v34 = *MEMORY[0x24BEBFE48];
    v10 = (uint64_t *)(v8 + 40);
    v11 = MEMORY[0x24BEE4AF8];
    do
    {
      v13 = *(v10 - 1);
      v12 = *v10;
      v14 = HIBYTE(*v10) & 0xF;
      if ((*v10 & 0x2000000000000000) == 0)
        v14 = v13 & 0xFFFFFFFFFFFFLL;
      if (v14)
      {
        *v37 = 0;
        v37[1] = 0;
        (*(void (**)(_QWORD *, _QWORD, uint64_t))(v38 + 104))(v37, v36, v39);
        OUTLINED_FUNCTION_26();
        OUTLINED_FUNCTION_173();
        sub_246155B30();
        __swift_instantiateConcreteTypeFromMangledName(&qword_25441C9A8);
        v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C8F0);
        OUTLINED_FUNCTION_163();
        v18 = v17 & ~v16;
        v19 = OUTLINED_FUNCTION_154();
        *(_OWORD *)(v19 + 16) = xmmword_246156AB0;
        v20 = v19 + v18;
        OUTLINED_FUNCTION_97();
        OUTLINED_FUNCTION_122();
        v21(v20, v35);
        v22 = (_QWORD *)(v20 + *(int *)(v15 + 48));
        sub_246155C80();
        *v22 = v13;
        v22[1] = v12;
        v23 = OUTLINED_FUNCTION_99();
        (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v22, v34, v23);
        __swift_storeEnumTagSinglePayload((uint64_t)v22, 0, 1, v23);
        sub_246155AF4();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v28 = OUTLINED_FUNCTION_74();
          v11 = sub_24614F8EC(v28, v29, v30, v11, &qword_25441C9A0, (void (*)(_QWORD))MEMORY[0x24BEBFD50]);
        }
        v25 = *(_QWORD *)(v11 + 16);
        v24 = *(_QWORD *)(v11 + 24);
        if (v25 >= v24 >> 1)
        {
          v31 = OUTLINED_FUNCTION_151(v24);
          v11 = sub_24614F8EC(v31, v32, v33, v11, &qword_25441C9A0, (void (*)(_QWORD))MEMORY[0x24BEBFD50]);
        }
        *(_QWORD *)(v11 + 16) = v25 + 1;
        OUTLINED_FUNCTION_172();
        (*(void (**)(unint64_t, uint64_t))(v27 + 32))(v11 + v26 + *(_QWORD *)(v27 + 72) * v25, v7);
      }
      v10 += 2;
      --v9;
    }
    while (v9);
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_70();
}

uint64_t sub_24614CF40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  double *v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  _BOOL4 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(_QWORD, _QWORD, _QWORD);
  __int128 v54;
  NSObject *v55;
  uint64_t v56;
  os_log_type_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v70;
  char v71;
  _QWORD v73[4];
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  __int128 v80;
  void (*v81)(_QWORD, _QWORD, _QWORD);
  int64_t v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  int64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89[3];
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;

  v6 = OUTLINED_FUNCTION_12_0();
  v87 = *(_QWORD *)(v6 - 8);
  OUTLINED_FUNCTION_68();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_18();
  v83 = v8;
  v75 = OUTLINED_FUNCTION_127();
  v74 = *(_QWORD *)(v75 - 8);
  OUTLINED_FUNCTION_68();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_18();
  v77 = v10;
  v84 = v3;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 104), *(_QWORD *)(v3 + 128));
  v11 = sub_246146C18();
  v12 = OUTLINED_FUNCTION_25_0();
  v13 = 0;
  v14 = sub_246148B68(v12, v11);
  v85 = a2;
  v91 = a2;
  v92 = a3;
  v81 = (void (*)(_QWORD, _QWORD, _QWORD))a3;
  v89[0] = 32;
  v89[1] = 0xE100000000000000;
  sub_24613FF7C();
  v15 = OUTLINED_FUNCTION_148();
  v16 = sub_24614D8A8(v14, v15);
  OUTLINED_FUNCTION_45();
  v17 = sub_24614DB6C(20, v16);
  v86 = v20 >> 1;
  v21 = (v20 >> 1) - v19;
  if (__OFSUB__(v20 >> 1, v19))
    goto LABEL_43;
  v22 = (const char *)v17;
  v82 = v6;
  if (!v21)
  {
    OUTLINED_FUNCTION_38();
    swift_unknownObjectRelease();
    v26 = MEMORY[0x24BEE4AF8];
    goto LABEL_16;
  }
  v23 = v18;
  v24 = v19;
  v89[0] = MEMORY[0x24BEE4AF8];
  v6 = v21 & ~(v21 >> 63);
  OUTLINED_FUNCTION_25_0();
  sub_246151308(0, v6, 0);
  if (v21 < 0)
  {
    __break(1u);
    goto LABEL_46;
  }
  v79 = v22;
  *(_QWORD *)&v80 = 0;
  v25 = 0;
  v26 = v89[0];
  v13 = v23 + 8 * v24;
  while (1)
  {
    v27 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v24 + v25 >= v86 || v25 >= v21)
      goto LABEL_41;
    v29 = *(_QWORD *)(v13 + 8 * v25);
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_121();
    OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_84();
    v30 = sub_2461425DC(v15);
    swift_release();
    OUTLINED_FUNCTION_44_0();
    v89[0] = v26;
    v32 = *(_QWORD *)(v26 + 16);
    v31 = *(_QWORD *)(v26 + 24);
    v6 = v32 + 1;
    if (v32 >= v31 >> 1)
    {
      v34 = OUTLINED_FUNCTION_150(v31);
      sub_246151308((char *)v34, v32 + 1, 1);
      v26 = v89[0];
    }
    *(_QWORD *)(v26 + 16) = v6;
    v33 = (double *)(v26 + 24 * v32);
    *((_QWORD *)v33 + 4) = v29;
    *((_QWORD *)v33 + 5) = v15;
    v33[6] = v30;
    ++v25;
    if (v27 == v21)
    {
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_36_0();
      v6 = v82;
      v13 = v80;
LABEL_16:
      sub_24614DD7C();
      OUTLINED_FUNCTION_1_0();
      v21 = (uint64_t)v81;
      v35 = sub_24614DDC0(v85, (uint64_t)v81, v26);
      OUTLINED_FUNCTION_45();
      v36 = v77;
      v37 = sub_246155A10();
      MEMORY[0x24BDAC7A8](v37);
      v73[-2] = v84;
      v73[-1] = v36;
      v89[0] = v35;
      OUTLINED_FUNCTION_25_0();
      sub_24615175C((uint64_t (*)(uint64_t *, uint64_t *))sub_246153628, (uint64_t)&v73[-4]);
      if (!v13)
      {
        OUTLINED_FUNCTION_38();
        v38 = sub_24614E270(v89[0]);
        OUTLINED_FUNCTION_15();
        v39 = sub_24614DD10(3, (uint64_t)v38);
        v76 = sub_246148A84(v39, v40, v41, v42);
        if (qword_25441C970 == -1)
          goto LABEL_18;
        goto LABEL_44;
      }
LABEL_46:
      swift_release();
      __break(1u);
      JUMPOUT(0x24614D888);
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
  while (1)
  {
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    swift_once();
LABEL_18:
    v43 = __swift_project_value_buffer(v6, (uint64_t)qword_25441C958);
    OUTLINED_FUNCTION_93();
    v86 = v43;
    v44 = sub_246155BFC();
    v45 = sub_246155D4C();
    v46 = OUTLINED_FUNCTION_32_0(v45);
    v47 = MEMORY[0x24BEE4AD8];
    if (v46)
    {
      v48 = OUTLINED_FUNCTION_23();
      v89[0] = OUTLINED_FUNCTION_23();
      *(_DWORD *)v48 = 136315394;
      OUTLINED_FUNCTION_142();
      v88 = sub_246150AC0(v49, v50, v89);
      OUTLINED_FUNCTION_123();
      *(_WORD *)(v48 + 12) = 2080;
      OUTLINED_FUNCTION_39_0();
      v88 = sub_246150AC0(v85, v21, v89);
      OUTLINED_FUNCTION_123();
      OUTLINED_FUNCTION_130();
      OUTLINED_FUNCTION_20_0(&dword_24613C000, v44, (os_log_type_t)v13, "Function: %s > Results matching query '%s'", (uint8_t *)v48);
      OUTLINED_FUNCTION_57();
      OUTLINED_FUNCTION_12();
    }

    OUTLINED_FUNCTION_36_0();
    v51 = v76;
    v52 = *(_QWORD *)(v76 + 16);
    if (!v52)
      break;
    v53 = *(void (**)(_QWORD, _QWORD, _QWORD))(v87 + 16);
    OUTLINED_FUNCTION_16_0();
    v21 = v51 + 40;
    *(_QWORD *)&v54 = 136315906;
    v80 = v54;
    v79 = "siriKitIntentTranscript";
    v78 = v47 + 8;
    v73[3] = "appIntentTranscript";
    v73[2] = "assistantIntentExamplePhrases";
    v73[1] = "staticSuggestions";
    v73[0] = "blockedAppsProvider";
    v55 = v83;
    v81 = v53;
    do
    {
      v56 = *(_QWORD *)(v21 - 8);
      v53(v55, v86, v6);
      swift_retain_n();
      OUTLINED_FUNCTION_16_0();
      sub_246155BFC();
      v57 = OUTLINED_FUNCTION_26_0();
      if (os_log_type_enabled(v55, v57))
      {
        v58 = OUTLINED_FUNCTION_23();
        v85 = OUTLINED_FUNCTION_23();
        v89[0] = v85;
        *(_DWORD *)v58 = v80;
        OUTLINED_FUNCTION_0();
        v60 = *(_QWORD *)(v56 + 16);
        v59 = *(_QWORD *)(v56 + 24);
        OUTLINED_FUNCTION_37();
        *(_QWORD *)(v58 + 4) = sub_246150AC0(v60, v59, v89);
        OUTLINED_FUNCTION_40_0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v58 + 12) = 2080;
        __asm { BR              X9 }
      }

      OUTLINED_FUNCTION_10_0();
      swift_release_n();
      OUTLINED_FUNCTION_166(*(uint64_t (**)(uint64_t, uint64_t))(v87 + 8));
      v21 += 24;
      --v52;
    }
    while (v52);
    v13 = v76;
    OUTLINED_FUNCTION_10_0();
    v61 = *(_QWORD *)(v13 + 16);
    v62 = MEMORY[0x24BEE4AF8];
    if (!v61)
      goto LABEL_39;
    v90 = MEMORY[0x24BEE4AF8];
    swift_retain();
    sub_246155E60();
    v63 = 0;
    v64 = v13 + 40;
    while (1)
    {
      v6 = v63 + 1;
      if (__OFADD__(v63, 1))
        break;
      v13 = *(_QWORD *)(v64 - 8);
      OUTLINED_FUNCTION_0();
      v66 = *(_QWORD *)(v13 + 16);
      v65 = *(_QWORD *)(v13 + 24);
      swift_retain();
      OUTLINED_FUNCTION_165();
      OUTLINED_FUNCTION_47_0();
      v67 = sub_24614E750();
      if (v67 == v66 && v68 == v65)
      {
        OUTLINED_FUNCTION_45();
        OUTLINED_FUNCTION_15_0();
      }
      else
      {
        v21 = v67;
        v70 = v68;
        v71 = OUTLINED_FUNCTION_29();
        OUTLINED_FUNCTION_15_0();
        if ((v71 & 1) != 0)
          OUTLINED_FUNCTION_45();
        else
          sub_24613EBA0(v21, v70);
      }
      OUTLINED_FUNCTION_15_0();
      sub_246155E48();
      sub_246155E6C();
      sub_246155E78();
      sub_246155E54();
      v64 += 24;
      ++v63;
      if (v6 == v61)
      {
        v62 = v90;
        swift_release();
        goto LABEL_39;
      }
    }
  }
  v62 = MEMORY[0x24BEE4AF8];
LABEL_39:
  (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v77, v75);
  OUTLINED_FUNCTION_10_0();
  return v62;
}

uint64_t sub_24614D8A8(unint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  v3 = a1;
  v28 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_33;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_25_0();
  while (v4)
  {
    v5 = 0;
    v24 = v3;
    v25 = v3 & 0xC000000000000001;
    v6 = *(_QWORD *)(a2 + 16);
    v21 = v3 & 0xFFFFFFFFFFFFFF8;
    v26 = v6;
    v22 = v4;
    v23 = a2;
    while (1)
    {
      if (v25)
      {
        MEMORY[0x249550F94](v5, v3);
      }
      else
      {
        if (v5 >= *(_QWORD *)(v21 + 16))
          goto LABEL_32;
        OUTLINED_FUNCTION_0_4();
      }
      if (__OFADD__(v5++, 1))
        break;
      v8 = sub_24613FF04();
      v9 = v8;
      if (!v6)
      {
        OUTLINED_FUNCTION_117();
        OUTLINED_FUNCTION_44_0();
        goto LABEL_28;
      }
      v10 = *(_QWORD *)(v8 + 16);
      OUTLINED_FUNCTION_47_0();
      v27 = (uint64_t *)(v9 + 40);
      for (i = 1; ; ++i)
      {
        OUTLINED_FUNCTION_140();
        if (v10)
          break;
        OUTLINED_FUNCTION_9_0();
LABEL_22:
        if (i == v6)
        {
          swift_release();
          OUTLINED_FUNCTION_44_0();
          a2 = v23;
          OUTLINED_FUNCTION_15_0();
          v3 = v24;
          v4 = v22;
          goto LABEL_28;
        }
      }
      v12 = v9;
      OUTLINED_FUNCTION_84();
      v13 = v27;
      v14 = v10;
      while (1)
      {
        v15 = *(v13 - 1);
        v16 = *v13;
        OUTLINED_FUNCTION_39_0();
        if ((sub_246155CA4() & 1) != 0)
          break;
        OUTLINED_FUNCTION_11_0();
LABEL_19:
        v13 += 2;
        if (!--v14)
        {
          OUTLINED_FUNCTION_9_0();
          v9 = v12;
          OUTLINED_FUNCTION_45();
          v6 = v26;
          goto LABEL_22;
        }
      }
      if (qword_25754D570 != -1)
        swift_once();
      v17 = sub_246143890(v15, v16, 0);
      OUTLINED_FUNCTION_11_0();
      if ((v17 & 1) != 0)
        goto LABEL_19;
      OUTLINED_FUNCTION_9_0();
      OUTLINED_FUNCTION_45();
      v18 = swift_retain();
      MEMORY[0x249550E44](v18);
      v19 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (*(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= v19 >> 1)
      {
        OUTLINED_FUNCTION_150(v19);
        sub_246155D10();
      }
      sub_246155D28();
      sub_246155D04();
      OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_45();
      v6 = v26;
      v3 = v24;
      v4 = v22;
      a2 = v23;
      OUTLINED_FUNCTION_15_0();
LABEL_28:
      if (v5 == v4)
      {
        OUTLINED_FUNCTION_38();
        return v28;
      }
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    OUTLINED_FUNCTION_25_0();
    v4 = OUTLINED_FUNCTION_158();
  }
  OUTLINED_FUNCTION_38();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_24614DB6C(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v3 = a1;
    v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      v5 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  v5 = sub_246155E9C();
  swift_bridgeObjectRelease();
LABEL_4:
  result = sub_246153228(0, v3, v5);
  if ((v7 & 1) != 0)
    v8 = v5;
  else
    v8 = result;
  if (v8 < 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    v10 = sub_246155E9C();
    result = swift_bridgeObjectRelease();
    if (v10 < 0)
    {
LABEL_25:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    v9 = sub_246155E9C();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v9 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v9 < v8)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if ((v2 & 0xC000000000000001) != 0 && v8)
  {
    type metadata accessor for AutoCompletePhrase();
    v11 = 0;
    do
    {
      v12 = v11 + 1;
      sub_246155E18();
      v11 = v12;
    }
    while (v8 != v12);
  }
  if (!v4)
    return v2 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v13 = sub_246155EA8();
  swift_bridgeObjectRelease_n();
  return v13;
}

uint64_t sub_24614DD10(uint64_t result, uint64_t a2)
{
  unint64_t v3;
  char v4;
  unint64_t v5;

  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v3 = *(_QWORD *)(a2 + 16);
  result = sub_246153228(0, result, v3);
  if ((v4 & 1) != 0)
    v5 = v3;
  else
    v5 = result;
  if ((v5 & 0x8000000000000000) != 0)
    goto LABEL_9;
  if (v3 >= v5)
    return a2;
LABEL_10:
  __break(1u);
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_24614DD7C()
{
  char *v0;

  swift_bridgeObjectRetain();
  sub_2461516F4(&v0);
}

uint64_t sub_24614DDC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v43;
  __int128 v44;
  char v45[8];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48[4];
  char v49;

  v47 = MEMORY[0x24BEE4AF8];
  v46 = MEMORY[0x24BEE4B08];
  v4 = *(_QWORD *)(a3 + 16);
  if (!v4)
  {
    v43 = MEMORY[0x24BEE4AF8];
    goto LABEL_26;
  }
  swift_bridgeObjectRetain();
  v43 = MEMORY[0x24BEE4AF8];
  v7 = (_QWORD *)(a3 + 48);
  do
  {
    v44 = *((_OWORD *)v7 - 1);
    v8 = *(double *)v7;
    v9 = *(_QWORD *)(v44 + 56);
    v10 = *(_QWORD *)(v44 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier);
    v11 = *(_QWORD *)(v44 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_actionIdentifier + 8);
    v12 = *(_BYTE *)(v44 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
    v48[0] = *(_QWORD *)(v44 + 48);
    v48[1] = v9;
    v48[2] = v10;
    v48[3] = v11;
    v49 = v12;
    OUTLINED_FUNCTION_0();
    if (sub_246155C50() == a1 && v13 == a2)
    {
      OUTLINED_FUNCTION_121();
      OUTLINED_FUNCTION_39_0();
      OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_37();
      OUTLINED_FUNCTION_45();
LABEL_15:
      OUTLINED_FUNCTION_146();
      OUTLINED_FUNCTION_39_0();
      sub_2461530F0(0, 0, v44, *((uint64_t *)&v44 + 1), v8);
LABEL_16:
      sub_246143D90((uint64_t)v45, (uint64_t)v48);
      OUTLINED_FUNCTION_11_0();
      OUTLINED_FUNCTION_52();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_1_0();
      goto LABEL_17;
    }
    v15 = OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_121();
    OUTLINED_FUNCTION_39_0();
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_37();
    OUTLINED_FUNCTION_44_0();
    if ((v15 & 1) != 0)
      goto LABEL_15;
    v16 = v46;
    OUTLINED_FUNCTION_84();
    v17 = sub_246142C30(v48, v16);
    OUTLINED_FUNCTION_44_0();
    if ((v17 & 1) == 0)
    {
      v22 = v47;
      OUTLINED_FUNCTION_146();
      OUTLINED_FUNCTION_39_0();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v36 = OUTLINED_FUNCTION_74();
        sub_24614FA90(v36, v37, v38, v22);
        v22 = v39;
      }
      v24 = *(_QWORD *)(v22 + 16);
      v23 = *(_QWORD *)(v22 + 24);
      if (v24 >= v23 >> 1)
      {
        v40 = OUTLINED_FUNCTION_150(v23);
        sub_24614FA90(v40, v24 + 1, 1, v22);
        v22 = v41;
      }
      *(_QWORD *)(v22 + 16) = v24 + 1;
      v25 = v22 + 24 * v24;
      *(_OWORD *)(v25 + 32) = v44;
      *(double *)(v25 + 48) = v8;
      v47 = v22;
      goto LABEL_16;
    }
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_146();
    OUTLINED_FUNCTION_39_0();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      v18 = v43;
    }
    else
    {
      v26 = OUTLINED_FUNCTION_74();
      sub_24614FA90(v26, v27, v28, v29);
      v18 = v30;
    }
    v20 = *(_QWORD *)(v18 + 16);
    v19 = *(_QWORD *)(v18 + 24);
    if (v20 >= v19 >> 1)
    {
      v31 = OUTLINED_FUNCTION_151(v19);
      sub_24614FA90(v31, v32, v33, v34);
      v18 = v35;
    }
    *(_QWORD *)(v18 + 16) = v20 + 1;
    v43 = v18;
    v21 = v18 + 24 * v20;
    *(_OWORD *)(v21 + 32) = v44;
    *(double *)(v21 + 48) = v8;
    OUTLINED_FUNCTION_11_0();
    OUTLINED_FUNCTION_52();
LABEL_17:
    v7 += 3;
    --v4;
  }
  while (v4);
  swift_bridgeObjectRelease();
LABEL_26:
  swift_bridgeObjectRelease();
  sub_246148654(v43);
  return v47;
}

BOOL sub_24614E0AC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  double v3;

  v2 = *a2;
  v3 = sub_24614E108(*a1);
  return sub_24614E108(v2) < v3;
}

long double sub_24614E108(uint64_t a1)
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
  double v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  double v15;
  double v16;
  uint64_t *v17;
  double v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C8D8);
  OUTLINED_FUNCTION_68();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_10();
  v5 = v4 - v3;
  v6 = OUTLINED_FUNCTION_127();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_10();
  v10 = v9 - v8;
  v11 = a1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_recentTapTimeStamp;
  OUTLINED_FUNCTION_0();
  sub_2461545CC(v11, v5);
  if (__swift_getEnumTagSinglePayload(v5, 1, v6) == 1)
  {
    sub_2461546A4(v5, &qword_25441C8D8);
    v12 = 1.0;
  }
  else
  {
    v13 = OUTLINED_FUNCTION_113();
    v14(v13);
    sub_246155A04();
    v16 = v15;
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
    v12 = v16 / 3600.0;
  }
  v17 = (uint64_t *)(a1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_tapCount);
  OUTLINED_FUNCTION_0();
  v18 = (double)*v17;
  return pow(0.99, v12) * v18;
}

char *sub_24614E270(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  int64_t v23;
  char v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  unint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  char *result;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;

  v56 = *(_QWORD *)(a1 + 16);
  if (!v56)
  {
    v26 = (char *)MEMORY[0x24BEE4AF8];
    goto LABEL_30;
  }
  v55 = a1 + 32;
  swift_bridgeObjectRetain();
  v1 = 0;
  v59 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    v57 = v1;
    v2 = (uint64_t *)(v55 + 24 * v1);
    v3 = *v2;
    v4 = v2[1];
    v5 = v2[2];
    OUTLINED_FUNCTION_121();
    OUTLINED_FUNCTION_93();
    v58 = v3;
    v6 = sub_24613FF04();
    v7 = v6;
    v63 = *(_QWORD *)(v4 + 16);
    if (v63)
    {
      v8 = *(char **)(v6 + 16);
      OUTLINED_FUNCTION_47_0();
      v9 = 0;
      v10 = 0;
      v61 = v4;
      v62 = v7 + 40;
      while (1)
      {
        v60 = v9;
        v11 = v10;
        while (1)
        {
          if (v11 >= *(_QWORD *)(v4 + 16))
          {
            __break(1u);
            goto LABEL_58;
          }
          v10 = v11 + 1;
          if (v8)
            break;
LABEL_17:
          v11 = v10;
          if (v10 == v63)
          {
            OUTLINED_FUNCTION_1_0();
            goto LABEL_22;
          }
        }
        OUTLINED_FUNCTION_84();
        v12 = v7;
        OUTLINED_FUNCTION_26();
        v13 = v62;
        v14 = v8;
        while (1)
        {
          OUTLINED_FUNCTION_165();
          if ((sub_246155CA4() & 1) != 0)
            break;
          OUTLINED_FUNCTION_45();
LABEL_15:
          v13 += 16;
          if (!--v8)
          {
            OUTLINED_FUNCTION_44_0();
            v7 = v12;
            OUTLINED_FUNCTION_38();
            v4 = v61;
            v8 = v14;
            goto LABEL_17;
          }
        }
        if (qword_25754D570 != -1)
          swift_once();
        v15 = OUTLINED_FUNCTION_113();
        v17 = sub_246143890(v15, v16, 1);
        OUTLINED_FUNCTION_45();
        if ((v17 & 1) != 0)
          goto LABEL_15;
        OUTLINED_FUNCTION_44_0();
        v7 = v12;
        OUTLINED_FUNCTION_38();
        v9 = 1;
        v4 = v61;
        v8 = v14;
        if (v10 == v63)
        {
          OUTLINED_FUNCTION_1_0();
          v60 = 1;
          goto LABEL_22;
        }
      }
    }
    v60 = 0;
LABEL_22:
    OUTLINED_FUNCTION_1_0();
    swift_retain();
    OUTLINED_FUNCTION_47_0();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
      v18 = v59;
    }
    else
    {
      v22 = (char *)OUTLINED_FUNCTION_74();
      v18 = sub_24614FB5C(v22, v23, v24, v25);
    }
    v20 = *((_QWORD *)v18 + 2);
    v19 = *((_QWORD *)v18 + 3);
    if (v20 >= v19 >> 1)
      v18 = sub_24614FB5C((char *)(v19 > 1), v20 + 1, 1, (uint64_t)v18);
    *((_QWORD *)v18 + 2) = v20 + 1;
    v59 = v18;
    v21 = &v18[32 * v20];
    *((_QWORD *)v21 + 4) = v58;
    *((_QWORD *)v21 + 5) = v4;
    *((_QWORD *)v21 + 6) = v5;
    v21[56] = v60 & 1;
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_52();
    v1 = v57 + 1;
  }
  while (v57 + 1 != v56);
  swift_bridgeObjectRelease();
  v26 = v59;
LABEL_30:
  v8 = v26;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_59;
  while (2)
  {
    v27 = *((_QWORD *)v8 + 2);
    if (v27)
    {
      v28 = 0;
      v29 = v8 + 32;
      v30 = 32;
      do
      {
        v31 = &v29[32 * v28];
        if ((v31[24] & 1) == 0)
        {
          if (v28 >= v27 - 1)
            break;
          v32 = v30 - 32 * v27;
          v33 = &v29[32 * v27--];
          while ((*(v33 - 8) & 1) == 0)
          {
            --v27;
            v32 += 32;
            v33 -= 32;
            if (v28 >= v27)
              goto LABEL_44;
          }
          v34 = *(_OWORD *)v31;
          v35 = *((_QWORD *)v31 + 2);
          if (v32 || v31 >= v33)
          {
            v36 = *((_OWORD *)v33 - 1);
            *(_OWORD *)v31 = *((_OWORD *)v33 - 2);
            *((_OWORD *)v31 + 1) = v36;
          }
          *((_OWORD *)v33 - 2) = v34;
          *((_QWORD *)v33 - 2) = v35;
          *(v33 - 8) = 0;
        }
        ++v28;
        v30 += 32;
      }
      while (v28 < v27);
LABEL_44:
      if (*((_QWORD *)v8 + 2) < (unint64_t)v28)
      {
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
LABEL_46:
      v28 = 0;
    }
    v37 = (2 * v28) | 1;
    v38 = (_QWORD *)sub_24614E9D0(v28, (uint64_t)v8);
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v65 = v8 + 32;
    OUTLINED_FUNCTION_39_0();
    sub_24615381C(v38, v40, v42, v44);
    v45 = 0;
    v8 = (char *)(v37 >> 1);
    if (v37 >> 1)
    {
      v64 = MEMORY[0x24BEE4AF8];
      result = sub_246151308(0, v37 >> 1, 0);
      if (((v37 >> 1) & 0x8000000000000000) != 0)
      {
        __break(1u);
        return result;
      }
      v47 = v64;
      v48 = (uint64_t *)(v65 + 16);
      while ((uint64_t)v45 < (uint64_t)v8)
      {
        v49 = *(v48 - 2);
        v50 = *(v48 - 1);
        v51 = *v48;
        v53 = *(_QWORD *)(v64 + 16);
        v52 = *(_QWORD *)(v64 + 24);
        swift_retain();
        OUTLINED_FUNCTION_47_0();
        if (v53 >= v52 >> 1)
          sub_246151308((char *)(v52 > 1), v53 + 1, 1);
        *(_QWORD *)(v64 + 16) = v53 + 1;
        v54 = (_QWORD *)(v64 + 24 * v53);
        v54[4] = v49;
        v54[5] = v50;
        v54[6] = v51;
        ++v45;
        v48 += 4;
        if (v8 == v45)
        {
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          return (char *)v47;
        }
      }
LABEL_58:
      __break(1u);
LABEL_59:
      v8 = sub_2461512BC((uint64_t)v8);
      continue;
    }
    break;
  }
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return (char *)MEMORY[0x24BEE4AF8];
}

uint64_t sub_24614E750()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v18;

  v2 = sub_246155BB4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_115();
  if ((*(_BYTE *)(*__swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 88)) + 32) & 1) != 0
    || (v4 = *(_QWORD *)(*__swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 88)) + 24)) == 0)
  {
    OUTLINED_FUNCTION_25_0();
  }
  else
  {
    v5 = (void *)objc_opt_self();
    OUTLINED_FUNCTION_47_0();
    OUTLINED_FUNCTION_79();
    v6 = (void *)sub_246155C38();
    v7 = (void *)sub_246155C38();
    OUTLINED_FUNCTION_15_0();
    v8 = objc_msgSend(v5, sel_filterProfanity_locale_, v6, v7);

    sub_246155C44();
    sub_246155B9C();
    sub_246155BA8();
    OUTLINED_FUNCTION_160(v1, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    if (qword_25441C970 != -1)
      swift_once();
    v9 = OUTLINED_FUNCTION_12_0();
    v10 = __swift_project_value_buffer(v9, (uint64_t)qword_25441C958);
    OUTLINED_FUNCTION_93();
    sub_246155BFC();
    v11 = OUTLINED_FUNCTION_26_0();
    if (OUTLINED_FUNCTION_11_1(v11))
    {
      v12 = OUTLINED_FUNCTION_23();
      v18 = OUTLINED_FUNCTION_23();
      *(_DWORD *)v12 = 136315394;
      OUTLINED_FUNCTION_142();
      OUTLINED_FUNCTION_9_1(24, v13, &v18);
      OUTLINED_FUNCTION_126();
      *(_WORD *)(v12 + 12) = 2080;
      OUTLINED_FUNCTION_25_0();
      v14 = OUTLINED_FUNCTION_79();
      sub_246150AC0(v14, v15, v16);
      OUTLINED_FUNCTION_126();
      OUTLINED_FUNCTION_130();
      OUTLINED_FUNCTION_20_0(&dword_24613C000, v10, (os_log_type_t)v4, "Function: %s > Profanity filtered phrase: %s", (uint8_t *)v12);
      OUTLINED_FUNCTION_57();
      OUTLINED_FUNCTION_12();
    }

    OUTLINED_FUNCTION_36_0();
  }
  return OUTLINED_FUNCTION_79();
}

uint64_t sub_24614E9D0(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 16) < result)
  {
    __break(1u);
  }
  else if ((result & 0x8000000000000000) == 0)
  {
    return swift_bridgeObjectRetain();
  }
  __break(1u);
  return result;
}

uint64_t sub_24614EA2C()
{
  OUTLINED_FUNCTION_165();
  sub_246155C2C();
  OUTLINED_FUNCTION_45();
  swift_bridgeObjectRetain();
  sub_246155C2C();
  OUTLINED_FUNCTION_144();
  return sub_246156004();
}

void sub_24614EAA4(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  v2 = a1[2];
  v3 = a1[3];
  v4 = a2[2];
  v5 = a2[3];
  v6 = *a1 == *a2 && a1[1] == a2[1];
  if ((v6 || (OUTLINED_FUNCTION_29() & 1) != 0) && (v2 != v4 || v3 != v5))
    OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_104();
}

void sub_24614EB34()
{
  OUTLINED_FUNCTION_157();
  sub_246155FEC();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_120();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_119();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_164();
  sub_246156010();
  OUTLINED_FUNCTION_7();
}

void sub_24614EB8C()
{
  OUTLINED_FUNCTION_157();
  sub_246155FEC();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_120();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_119();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_164();
  sub_246156010();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_24614EBDC(uint64_t a1, double *a2)
{
  double v2;
  double v3;
  double v4;
  unsigned int v5;
  unsigned int v6;
  BOOL v7;
  int v8;
  double v9;
  unsigned int v11;

  v2 = *(double *)(a1 + 16);
  v3 = *a2;
  v4 = a2[2];
  v5 = *(unsigned __int8 *)(*(_QWORD *)a1 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
  if (v2 != v4)
  {
    v8 = *(unsigned __int8 *)(*(_QWORD *)&v3 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
    if (v5 - 1 > 1)
    {
      v11 = v8 - 3;
      v7 = v2 >= v4 || v11 >= 0xFFFFFFFE;
      return !v7;
    }
    if ((v8 - 1) > 1)
      return 1;
LABEL_6:
    v9 = sub_24613FEB8();
    return sub_24613FEB8() < v9;
  }
  v6 = *(unsigned __int8 *)(*(_QWORD *)&v3 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
  v7 = v5 >= v6;
  if (v5 == v6)
    goto LABEL_6;
  return !v7;
}

uint64_t DefaultSiriAutoCompleteService.flushAssistantSuggestions()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[7] = v0;
  v2 = OUTLINED_FUNCTION_82();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_100();
  v1[11] = OUTLINED_FUNCTION_2_3();
  v3 = OUTLINED_FUNCTION_98();
  v1[12] = v3;
  v1[13] = *(_QWORD *)(v3 - 8);
  v1[14] = OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_27_0();
  return OUTLINED_FUNCTION_3_0();
}

uint64_t sub_24614ED00()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  __n128 *v12;
  uint64_t v13;
  uint64_t v14;

  if (qword_25441C970 != -1)
    swift_once();
  v4 = OUTLINED_FUNCTION_12_0();
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_25441C958);
  v1[15] = v5;
  v6 = v5;
  sub_246155BFC();
  v7 = OUTLINED_FUNCTION_26_0();
  if (OUTLINED_FUNCTION_31_0(v7))
  {
    v8 = (uint8_t *)OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    *(_DWORD *)v8 = 136315138;
    OUTLINED_FUNCTION_77();
    v1[6] = OUTLINED_FUNCTION_9_1(27, v9, v10);
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_17_0(&dword_24613C000, v6, (os_log_type_t)v0, "Function: %s > Flushing all assistant suggestions", v8);
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_12();
  }

  OUTLINED_FUNCTION_116();
  *(_BYTE *)(v0 + 8) = 1;
  OUTLINED_FUNCTION_156(v11);
  OUTLINED_FUNCTION_64();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C9A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C8F0);
  v12 = (__n128 *)OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_153(v12, (__n128)xmmword_246156AB0);
  v13 = OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_71(v13);
  *v2 = 1;
  v14 = OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_56(v14);
  OUTLINED_FUNCTION_63();
  v1[16] = *(_QWORD *)(v3 + 56);
  return swift_task_switch();
}

uint64_t sub_24614EECC()
{
  uint64_t v0;
  uint64_t *v1;

  v1[17] = OUTLINED_FUNCTION_128(v1[14]);
  v1[18] = v0;
  OUTLINED_FUNCTION_27_0();
  return OUTLINED_FUNCTION_14_1();
}

uint64_t sub_24614EF18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _QWORD *a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  OUTLINED_FUNCTION_129();
  a21 = v27;
  a22 = v28;
  a20 = v24;
  v29 = v24[15];
  sub_246155BFC();
  v30 = OUTLINED_FUNCTION_26_0();
  if (OUTLINED_FUNCTION_67(v30))
  {
    v31 = v24[17];
    v32 = OUTLINED_FUNCTION_23();
    a11 = OUTLINED_FUNCTION_23();
    *(_DWORD *)v32 = 136315394;
    v24[4] = OUTLINED_FUNCTION_9_1(27, 0x80000002461577A0, &a11);
    sub_246155D88();
    *(_WORD *)(v32 + 12) = 2048;
    v24[5] = v31;
    sub_246155D88();
    OUTLINED_FUNCTION_20_0(&dword_24613C000, v29, v26, "Function: %s > Successfully deleted all phrases corresponding to source 'assistantSuggestions' with return code: %ld", (uint8_t *)v32);
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_12();
  }
  OUTLINED_FUNCTION_133();
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v22, v23);
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_61();
  return v33(v33, v34, v35, v36, v37, v38, v39, v40, a9, a10, a11, a12, a13, a14);
}

void sub_24614F064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,_QWORD *a22,uint64_t a23,uint64_t a24)
{
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  _QWORD *v30;
  id v31;
  uint64_t v32;

  OUTLINED_FUNCTION_22_0();
  a23 = v25;
  a24 = v26;
  a22 = v24;
  v27 = v24[15];
  OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_161();
  sub_246155BFC();
  OUTLINED_FUNCTION_26_0();
  if (OUTLINED_FUNCTION_112(v27))
  {
    v28 = (void *)v24[18];
    v29 = OUTLINED_FUNCTION_23();
    v30 = (_QWORD *)OUTLINED_FUNCTION_23();
    a13 = OUTLINED_FUNCTION_23();
    *(_DWORD *)v29 = 136315394;
    v24[2] = OUTLINED_FUNCTION_9_1(27, 0x80000002461577A0, &a13);
    sub_246155D88();
    *(_WORD *)(v29 + 12) = 2112;
    v31 = v28;
    v32 = _swift_stdlib_bridgeErrorToNSError();
    v24[3] = v32;
    sub_246155D88();
    *v30 = v32;
    OUTLINED_FUNCTION_149();
  }

  OUTLINED_FUNCTION_42_0();
}

void sub_24614F20C()
{
  JUMPOUT(0x24614F218);
}

uint64_t DefaultSiriAutoCompleteService.insertPhrasesForAssistantSuggestions(phrases:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v2[7] = a1;
  v2[8] = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v2[9] = v3;
  OUTLINED_FUNCTION_139(v3, (uint64_t)sub_24614F278);
  return DefaultSiriAutoCompleteService.flushAssistantSuggestions()();
}

uint64_t sub_24614F278()
{
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_27_0();
  return OUTLINED_FUNCTION_3_0();
}

uint64_t sub_24614F2AC()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = v0[7];
  OUTLINED_FUNCTION_169();
  v2 = OUTLINED_FUNCTION_137();
  v3 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v2 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + 24) = v3;
  sub_246147FC8(v1);
  OUTLINED_FUNCTION_117();
  sub_2461483E8(&v7);
  OUTLINED_FUNCTION_15();
  v4 = v7;
  v0[10] = v7;
  v0[6] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[11] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_24614F358;
  return DefaultSiriAutoCompleteService.addPhrasesToVectorDB(vectorSearchAssets:)(v0 + 6);
}

uint64_t sub_24614F358()
{
  uint64_t v0;

  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0();
  return OUTLINED_FUNCTION_28(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t DefaultSiriAutoCompleteService.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  return v0;
}

uint64_t DefaultSiriAutoCompleteService.__deallocating_deinit()
{
  DefaultSiriAutoCompleteService.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_24614F3DC(uint64_t *a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24614F42C;
  return DefaultSiriAutoCompleteService.addPhrasesToVectorDB(vectorSearchAssets:)(a1);
}

uint64_t sub_24614F42C(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_4_2();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

void sub_24614F460(uint64_t a1, unint64_t a2)
{
  DefaultSiriAutoCompleteService.autoCompleteResults(for:)(a1, a2);
}

uint64_t sub_24614F480(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_246154920;
  return DefaultSiriAutoCompleteService.insertPhrasesForAssistantSuggestions(phrases:)(a1);
}

uint64_t sub_24614F4D0(_BYTE *a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24614F520;
  return DefaultSiriAutoCompleteService.deletePhrasesForSource(source:)(a1);
}

uint64_t sub_24614F520()
{
  uint64_t v0;

  OUTLINED_FUNCTION_4_2();
  return OUTLINED_FUNCTION_28(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_24614F544(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24614F42C;
  return DefaultSiriAutoCompleteService.deletePhrasesForApp(bundleIds:)(a1);
}

uint64_t sub_24614F594(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_246154920;
  return DefaultSiriAutoCompleteService.increaseTapCountForPhrase(phrase:)(a1, a2);
}

void sub_24614F5F4()
{
  DefaultSiriAutoCompleteService.fetchPhrasesMatching(filters:)();
}

uint64_t sub_24614F614()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24614F520;
  return DefaultSiriAutoCompleteService.dropDB()();
}

uint64_t sub_24614F65C(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24614F66C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_24614F6A0(uint64_t a1)
{
  uint64_t result;

  if (a1 < 0)
  {
    result = sub_246155E90();
    __break(1u);
  }
  else if (a1)
  {
    result = sub_246155D1C();
    *(_QWORD *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

void sub_24614F738(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_76();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_141();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_75();
    }
  }
  else
  {
    v6 = a2;
  }
  v9 = *(_QWORD *)(a4 + 16);
  if (v6 <= v9)
    v10 = *(_QWORD *)(a4 + 16);
  else
    v10 = v6;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754D888);
    v11 = (char *)OUTLINED_FUNCTION_94();
    v12 = _swift_stdlib_malloc_size(v11);
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 16);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v11 + 32;
  if ((a1 & 1) != 0)
  {
    sub_24615023C((char *)(a4 + 32), v9, v13);
    *(_QWORD *)(a4 + 16) = 0;
    OUTLINED_FUNCTION_38();
  }
  else
  {
    sub_24614FC48(0, v9, (unint64_t)v13, a4);
  }
}

void sub_24614F808(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD, uint64_t, _QWORD *, uint64_t), void (*a7)(uint64_t, uint64_t, _QWORD *))
{
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  size_t v17;
  _QWORD *v18;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_76();
    if (v12 != v13)
    {
      OUTLINED_FUNCTION_141();
      if (v12)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_75();
    }
  }
  else
  {
    v11 = a2;
  }
  v14 = *(_QWORD *)(a4 + 16);
  if (v11 <= v14)
    v15 = *(_QWORD *)(a4 + 16);
  else
    v15 = v11;
  if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v16 = (_QWORD *)OUTLINED_FUNCTION_94();
    v17 = _swift_stdlib_malloc_size(v16);
    v16[2] = v14;
    v16[3] = 2 * ((uint64_t)(v17 - 32) / 8);
  }
  else
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v18 = v16 + 4;
  if ((a1 & 1) != 0)
  {
    a7(a4 + 32, v14, v18);
    *(_QWORD *)(a4 + 16) = 0;
    OUTLINED_FUNCTION_38();
  }
  else
  {
    a6(0, v14, v18, a4);
  }
  OUTLINED_FUNCTION_104();
}

uint64_t sub_24614F8D8(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_24614F8EC(a1, a2, a3, a4, &qword_25441C9B8, (void (*)(_QWORD))MEMORY[0x24BEBFEA0]);
}

uint64_t sub_24614F8EC(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD))
{
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  size_t v18;
  BOOL v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_76();
    if (v10 != v11)
    {
      OUTLINED_FUNCTION_141();
      if (v10)
      {
        __break(1u);
        goto LABEL_23;
      }
      OUTLINED_FUNCTION_75();
    }
  }
  else
  {
    v9 = a2;
  }
  v12 = *(_QWORD *)(a4 + 16);
  if (v9 <= v12)
    v13 = *(_QWORD *)(a4 + 16);
  else
    v13 = v9;
  if (!v13)
  {
    v17 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v14 = *(_QWORD *)(((uint64_t (*)(_QWORD))a6)(0) - 8);
  v15 = *(_QWORD *)(v14 + 72);
  v16 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v17 = (_QWORD *)swift_allocObject();
  v18 = _swift_stdlib_malloc_size(v17);
  if (!v15 || (v18 - v16 == 0x8000000000000000 ? (v19 = v15 == -1) : (v19 = 0), v19))
  {
LABEL_23:
    OUTLINED_FUNCTION_8_0();
    result = sub_246155E90();
    __break(1u);
    return result;
  }
  v17[2] = v12;
  v17[3] = 2 * ((uint64_t)(v18 - v16) / v15);
LABEL_18:
  a6(0);
  OUTLINED_FUNCTION_172();
  v21 = (unint64_t)v17 + v20;
  if ((a1 & 1) != 0)
  {
    sub_246150448(a4 + v20, v12, v21, a6);
    *(_QWORD *)(a4 + 16) = 0;
    OUTLINED_FUNCTION_38();
  }
  else
  {
    sub_24614FF40(0, v12, v21, a4, (uint64_t (*)(_QWORD))a6);
  }
  return (uint64_t)v17;
}

void sub_24614FA90(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_76();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_141();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_75();
    }
  }
  else
  {
    v6 = a2;
  }
  v9 = *(_QWORD *)(a4 + 16);
  if (v6 <= v9)
    v10 = *(_QWORD *)(a4 + 16);
  else
    v10 = v6;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754D880);
    v11 = (char *)OUTLINED_FUNCTION_94();
    v12 = _swift_stdlib_malloc_size(v11);
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 24);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v11 + 32;
  if ((a1 & 1) != 0)
  {
    sub_24615051C((char *)(a4 + 32), v9, v13);
    *(_QWORD *)(a4 + 16) = 0;
    OUTLINED_FUNCTION_38();
  }
  else
  {
    sub_24615002C(0, v9, (unint64_t)v13, a4);
  }
  OUTLINED_FUNCTION_104();
}

char *sub_24614FB5C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754D898);
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
  if ((v5 & 1) != 0)
  {
    sub_2461505A8((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_246150128(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_24614FC48(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_246155EB4();
  __break(1u);
  return result;
}

char *sub_24614FD3C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = &__dst[8 * v4];
    if (v5 >= v6 || &v5[8 * v4] <= __dst)
    {
      memcpy(__dst, v5, 8 * v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = (char *)sub_246155EB4();
  __break(1u);
  return result;
}

uint64_t sub_24614FE2C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25754D6E8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_246155EB4();
  __break(1u);
  return result;
}

uint64_t sub_24614FF40(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 0)
  {
LABEL_9:
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_102();
    goto LABEL_11;
  }
  v9 = *(_QWORD *)(a5(0) - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = *(_QWORD *)(v9 + 72);
  v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
  v13 = v11 * v5;
  v14 = a3 + v13;
  v15 = v12 + v13;
  if (v12 >= v14 || v15 <= a3)
  {
    swift_arrayInitWithCopy();
    OUTLINED_FUNCTION_38();
    return v14;
  }
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_103();
LABEL_11:
  result = OUTLINED_FUNCTION_54();
  __break(1u);
  return result;
}

uint64_t sub_24615002C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_246155EB4();
  __break(1u);
  return result;
}

uint64_t sub_246150128(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25754D890);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_246155EB4();
  __break(1u);
  return result;
}

char *sub_24615023C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_246155EB4();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_2461502C0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_246155EB4();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t sub_246150344(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_246155EB4();
    __break(1u);
  }
  else if (a3 < a1
         || (result = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C8F0),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25441C8F0);
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_246150448(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD))
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_8_0();
    result = OUTLINED_FUNCTION_54();
    __break(1u);
  }
  else if (a3 < a1
         || (result = ((uint64_t (*)(_QWORD))a4)(0),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    a4(0);
    OUTLINED_FUNCTION_152();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_152();
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_24615051C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_246155EB4();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

char *sub_2461505A8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_246155EB4();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

uint64_t sub_24615062C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_246155EB4();
  __break(1u);
  return result;
}

uint64_t sub_2461506F8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_102();
  }
  else
  {
    if (a3 + 8 * a2 <= a1 || a1 + 8 * a2 <= a3)
    {
      type metadata accessor for AutoCompletePhrase();
      return swift_arrayInitWithCopy();
    }
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_103();
  }
  result = OUTLINED_FUNCTION_54();
  __break(1u);
  return result;
}

uint64_t sub_2461507B0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25441C8F0) - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy();
  }
  result = sub_246155EB4();
  __break(1u);
  return result;
}

uint64_t sub_2461508A8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_102();
  }
  else
  {
    if (a3 + 24 * a2 <= a1 || a1 + 24 * a2 <= a3)
      return swift_arrayInitWithCopy();
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_103();
  }
  result = OUTLINED_FUNCTION_54();
  __break(1u);
  return result;
}

uint64_t sub_246150948(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 32 * a2 > a1 ? (v3 = a1 + 32 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_246155EB4();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754D890);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_246150A34(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_246150A54(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_246150AC0(v6, v7, a3);
  v8 = *a1 + 8;
  sub_246155D88();
  result = OUTLINED_FUNCTION_1_0();
  *a1 = v8;
  return result;
}

uint64_t sub_246150AC0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[3];
  uint64_t ObjectType;

  OUTLINED_FUNCTION_27_0();
  v9 = sub_246150B88(v6, v7, v8, 1, a1, a2);
  v10 = v15[0];
  if (v9)
  {
    v11 = v9;
    ObjectType = swift_getObjectType();
    v15[0] = v11;
    v12 = *a3;
    if (*a3)
    {
      sub_246154628((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v15[0] = a1;
    v15[1] = a2;
    v13 = *a3;
    if (*a3)
    {
      sub_246154628((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    OUTLINED_FUNCTION_16_0();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v10;
}

uint64_t sub_246150B88(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_246150CDC((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_246155D94();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_246150DA0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_246155E3C();
    if (!v8)
    {
      result = sub_246155E90();
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

void *sub_246150CDC(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_246155EB4();
  __break(1u);
  return result;
}

uint64_t sub_246150DA0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_246150E34(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_246151008(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_246151008((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_246150E34(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_246155C98();
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
  v3 = sub_246150FA4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_246155E0C();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_246155EB4();
  __break(1u);
LABEL_14:
  result = sub_246155E90();
  __break(1u);
  return result;
}

_QWORD *sub_246150FA4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754D8B8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_246151008(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754D8B8);
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
    sub_2461511A0(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2461510DC(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2461510DC(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_246155EB4();
  __break(1u);
  return result;
}

char *sub_2461511A0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_246155EB4();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

_BYTE **sub_246151220(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

unint64_t sub_246151230(unint64_t result, char a2, uint64_t a3)
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

void sub_246151254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_170(a1, *(_QWORD *)(a1 + 16), a3, a1, &qword_25754D8A8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_24614FD3C, (void (*)(uint64_t, uint64_t, _QWORD *))sub_2461502C0);
}

void sub_246151288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_170(a1, *(_QWORD *)(a1 + 16), a3, a1, &qword_25754D8B0, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_24614FE2C, (void (*)(uint64_t, uint64_t, _QWORD *))sub_2461502C0);
}

char *sub_2461512BC(uint64_t a1)
{
  return sub_24614FB5C(0, *(_QWORD *)(a1 + 16), 0, a1);
}

char *sub_2461512D0(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_246151324(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

size_t sub_2461512EC(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_246151404(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_246151308(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_24615154C(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_246151324(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754D888);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_24615023C(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_24615062C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_246151404(size_t result, int64_t a2, char a3, uint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441C9A8);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25441C8F0) - 8);
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
  v15 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25441C8F0) - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = (unint64_t)v13 + v16;
  v18 = a4 + v16;
  if ((v5 & 1) != 0)
  {
    sub_246150344(v18, v8, v17);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2461507B0(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

char *sub_24615154C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754D880);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_24615051C(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2461508A8((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void sub_246151634(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v8;
  size_t v9;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25754D880);
      v8 = (_QWORD *)swift_allocObject();
      v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 24);
    }
    if (v4 != a3)
    {
      sub_2461508A8(a2 + 24 * a3, v5, (unint64_t)(v8 + 4));
      return;
    }
    goto LABEL_10;
  }
}

void sub_2461516F4(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v4[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_246153648((uint64_t)v2);
  v3 = *((_QWORD *)v2 + 2);
  v4[0] = (uint64_t)(v2 + 32);
  v4[1] = v3;
  sub_2461517DC(v4);
  *a1 = v2;
}

uint64_t sub_24615175C(uint64_t (*a1)(uint64_t *, uint64_t *), uint64_t a2)
{
  char **v2;
  char *v5;
  uint64_t result;

  v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = sub_246153648((uint64_t)v5);
  result = sub_246151DA4(a1, a2);
  *v2 = v5;
  return result;
}

void sub_2461517DC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  uint64_t v50;
  char v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  unint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *__dst;
  uint64_t v89;

  v3 = a1[1];
  v4 = sub_246155F5C();
  if (v4 >= v3)
  {
    if (v3 < 0)
      goto LABEL_114;
    if (v3)
      sub_24615236C(0, v3, 1, a1);
  }
  else
  {
    v5 = v4;
    v82 = a1;
    v83 = sub_24614F6A0(v3 / 2);
    __dst = v6;
    v85 = v3;
    if (v3 <= 0)
    {
      v9 = (char *)MEMORY[0x24BEE4AF8];
      v25 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_79:
      if (v25 >= 2)
      {
        v75 = *v82;
        do
        {
          v76 = v25 - 2;
          if (v25 < 2)
            goto LABEL_109;
          if (!v75)
            goto LABEL_123;
          v77 = v9;
          v78 = *(_QWORD *)&v9[16 * v76 + 32];
          v79 = *(_QWORD *)&v9[16 * v25 + 24];
          sub_2461529B0((char *)(v75 + 24 * v78), (char *)(v75 + 24 * *(_QWORD *)&v9[16 * v25 + 16]), v75 + 24 * v79, __dst);
          if (v1)
          {
            swift_bridgeObjectRelease();
            v3 = v85;
            goto LABEL_75;
          }
          if (v79 < v78)
            goto LABEL_110;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v77 = sub_2461530DC((uint64_t)v77);
          if (v76 >= *((_QWORD *)v77 + 2))
            goto LABEL_111;
          v80 = &v77[16 * v76 + 32];
          *(_QWORD *)v80 = v78;
          *((_QWORD *)v80 + 1) = v79;
          v81 = *((_QWORD *)v77 + 2);
          if (v25 > v81)
            goto LABEL_112;
          memmove(&v77[16 * v25 + 16], &v77[16 * v25 + 32], 16 * (v81 - v25));
          v9 = v77;
          *((_QWORD *)v77 + 2) = v81 - 1;
          v25 = v81 - 1;
        }
        while (v81 > 2);
      }
      swift_bridgeObjectRelease();
      if (v85 < -1)
      {
LABEL_120:
        __break(1u);
LABEL_121:
        __break(1u);
LABEL_122:
        __break(1u);
LABEL_123:
        __break(1u);
      }
      else
      {
        *(_QWORD *)(v83 + 16) = 0;
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      v7 = 0;
      v8 = *a1;
      v9 = (char *)MEMORY[0x24BEE4AF8];
      v84 = v5;
      v87 = *a1;
      while (1)
      {
        v10 = v9;
        v11 = sub_246152630(&v89, v8, v3, v7);
        if (v1)
          break;
        v12 = v89;
        if ((v11 & 1) != 0)
        {
          if (v89 < v7)
            goto LABEL_115;
          if (v7 < v89)
          {
            v13 = 24 * v89;
            v14 = 24 * v7;
            v15 = v89;
            v16 = v7;
            do
            {
              if (v16 != --v15)
              {
                if (!v87)
                  goto LABEL_122;
                v17 = v87 + v14;
                v18 = v87 + v13;
                v19 = *(_QWORD *)(v87 + v14 + 16);
                v20 = *(_OWORD *)(v87 + v14);
                v21 = *(_QWORD *)(v87 + v13 - 8);
                *(_OWORD *)v17 = *(_OWORD *)(v87 + v13 - 24);
                *(_QWORD *)(v17 + 16) = v21;
                *(_OWORD *)(v18 - 24) = v20;
                *(_QWORD *)(v18 - 8) = v19;
              }
              ++v16;
              v13 -= 24;
              v14 += 24;
            }
            while (v16 < v15);
          }
        }
        if (v12 < v3)
        {
          if (__OFSUB__(v12, v7))
            goto LABEL_116;
          if (v12 - v7 < v5)
          {
            if (__OFADD__(v7, v5))
              goto LABEL_118;
            if (v7 + v5 >= v3)
              v22 = v3;
            else
              v22 = v7 + v5;
            if (v22 < v7)
            {
LABEL_119:
              __break(1u);
              goto LABEL_120;
            }
            sub_24615236C(v7, v22, v12, v82);
            v12 = v22;
          }
        }
        if (v12 < v7)
          goto LABEL_113;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
          v9 = v10;
        else
          v9 = sub_246152FE8(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
        v24 = *((_QWORD *)v9 + 2);
        v23 = *((_QWORD *)v9 + 3);
        v25 = v24 + 1;
        v8 = v87;
        v86 = v12;
        if (v24 >= v23 >> 1)
        {
          v74 = sub_246152FE8((char *)(v23 > 1), v24 + 1, 1, v9);
          v8 = v87;
          v9 = v74;
        }
        *((_QWORD *)v9 + 2) = v25;
        v26 = v9 + 32;
        v27 = (uint64_t *)&v9[16 * v24 + 32];
        *v27 = v7;
        v27[1] = v12;
        if (v24)
        {
          while (1)
          {
            v28 = v25 - 1;
            if (v25 >= 4)
            {
              v33 = &v26[16 * v25];
              v34 = *((_QWORD *)v33 - 8);
              v35 = *((_QWORD *)v33 - 7);
              v39 = __OFSUB__(v35, v34);
              v36 = v35 - v34;
              if (v39)
                goto LABEL_98;
              v38 = *((_QWORD *)v33 - 6);
              v37 = *((_QWORD *)v33 - 5);
              v39 = __OFSUB__(v37, v38);
              v31 = v37 - v38;
              v32 = v39;
              if (v39)
                goto LABEL_99;
              v40 = v25 - 2;
              v41 = &v26[16 * v25 - 32];
              v43 = *(_QWORD *)v41;
              v42 = *((_QWORD *)v41 + 1);
              v39 = __OFSUB__(v42, v43);
              v44 = v42 - v43;
              if (v39)
                goto LABEL_100;
              v39 = __OFADD__(v31, v44);
              v45 = v31 + v44;
              if (v39)
                goto LABEL_102;
              if (v45 >= v36)
              {
                v63 = &v26[16 * v28];
                v65 = *(_QWORD *)v63;
                v64 = *((_QWORD *)v63 + 1);
                v39 = __OFSUB__(v64, v65);
                v66 = v64 - v65;
                if (v39)
                  goto LABEL_108;
                v56 = v31 < v66;
                goto LABEL_59;
              }
            }
            else
            {
              if (v25 != 3)
              {
                v57 = *((_QWORD *)v9 + 4);
                v58 = *((_QWORD *)v9 + 5);
                v39 = __OFSUB__(v58, v57);
                v50 = v58 - v57;
                v51 = v39;
                goto LABEL_53;
              }
              v30 = *((_QWORD *)v9 + 4);
              v29 = *((_QWORD *)v9 + 5);
              v39 = __OFSUB__(v29, v30);
              v31 = v29 - v30;
              v32 = v39;
            }
            if ((v32 & 1) != 0)
              goto LABEL_101;
            v40 = v25 - 2;
            v46 = &v26[16 * v25 - 32];
            v48 = *(_QWORD *)v46;
            v47 = *((_QWORD *)v46 + 1);
            v49 = __OFSUB__(v47, v48);
            v50 = v47 - v48;
            v51 = v49;
            if (v49)
              goto LABEL_103;
            v52 = &v26[16 * v28];
            v54 = *(_QWORD *)v52;
            v53 = *((_QWORD *)v52 + 1);
            v39 = __OFSUB__(v53, v54);
            v55 = v53 - v54;
            if (v39)
              goto LABEL_105;
            if (__OFADD__(v50, v55))
              goto LABEL_107;
            if (v50 + v55 >= v31)
            {
              v56 = v31 < v55;
LABEL_59:
              if (v56)
                v28 = v40;
              goto LABEL_61;
            }
LABEL_53:
            if ((v51 & 1) != 0)
              goto LABEL_104;
            v59 = &v26[16 * v28];
            v61 = *(_QWORD *)v59;
            v60 = *((_QWORD *)v59 + 1);
            v39 = __OFSUB__(v60, v61);
            v62 = v60 - v61;
            if (v39)
              goto LABEL_106;
            if (v62 < v50)
              goto LABEL_69;
LABEL_61:
            v67 = v28 - 1;
            if (v28 - 1 >= v25)
            {
              __break(1u);
LABEL_95:
              __break(1u);
LABEL_96:
              __break(1u);
LABEL_97:
              __break(1u);
LABEL_98:
              __break(1u);
LABEL_99:
              __break(1u);
LABEL_100:
              __break(1u);
LABEL_101:
              __break(1u);
LABEL_102:
              __break(1u);
LABEL_103:
              __break(1u);
LABEL_104:
              __break(1u);
LABEL_105:
              __break(1u);
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
              goto LABEL_119;
            }
            if (!v8)
              goto LABEL_121;
            v68 = v9;
            v69 = &v26[16 * v67];
            v70 = *(_QWORD *)v69;
            v71 = &v26[16 * v28];
            v72 = *((_QWORD *)v71 + 1);
            sub_2461529B0((char *)(v8 + 24 * *(_QWORD *)v69), (char *)(v8 + 24 * *(_QWORD *)v71), v8 + 24 * v72, __dst);
            if (v72 < v70)
              goto LABEL_95;
            if (v28 > *((_QWORD *)v68 + 2))
              goto LABEL_96;
            *(_QWORD *)v69 = v70;
            *(_QWORD *)&v26[16 * v67 + 8] = v72;
            v73 = *((_QWORD *)v68 + 2);
            if (v28 >= v73)
              goto LABEL_97;
            v25 = v73 - 1;
            memmove(&v26[16 * v28], v71 + 16, 16 * (v73 - 1 - v28));
            v9 = v68;
            *((_QWORD *)v68 + 2) = v73 - 1;
            v8 = v87;
            if (v73 <= 2)
              goto LABEL_69;
          }
        }
        v25 = 1;
LABEL_69:
        v3 = v85;
        v7 = v86;
        v5 = v84;
        if (v86 >= v85)
          goto LABEL_79;
      }
      swift_bridgeObjectRelease();
LABEL_75:
      if (v3 < -1)
        goto LABEL_117;
      *(_QWORD *)(v83 + 16) = 0;
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_246151DA4(uint64_t (*a1)(uint64_t *, uint64_t *), uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  unint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  uint64_t v50;
  char v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  unint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v90;

  v4 = v3;
  v5 = v2[1];
  result = sub_246155F5C();
  if (result >= v5)
  {
    if (v5 < 0)
      goto LABEL_113;
    if (v5)
      return sub_2461524C0(0, v5, 1, a1, a2);
  }
  else
  {
    v7 = result;
    v81 = v2;
    v82 = sub_24614F6A0(v5 / 2);
    v87 = v8;
    v85 = v5;
    if (v5 <= 0)
    {
      v11 = MEMORY[0x24BEE4AF8];
      v25 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_78:
      result = v11;
      if (v25 >= 2)
      {
        v74 = *v81;
        do
        {
          v75 = v25 - 2;
          if (v25 < 2)
            goto LABEL_108;
          if (!v74)
            goto LABEL_122;
          v76 = result;
          v77 = *(_QWORD *)(result + 32 + 16 * v75);
          v78 = *(_QWORD *)(result + 32 + 16 * (v25 - 1) + 8);
          result = sub_246152C64((char *)(v74 + 24 * v77), (char *)(v74 + 24 * *(_QWORD *)(result + 32 + 16 * (v25 - 1))), v74 + 24 * v78, v87, a1);
          if (v4)
          {
            result = swift_bridgeObjectRelease();
            v5 = v85;
            goto LABEL_74;
          }
          if (v78 < v77)
            goto LABEL_109;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_2461530DC(v76);
            v76 = result;
          }
          if (v75 >= *(_QWORD *)(v76 + 16))
            goto LABEL_110;
          v79 = (_QWORD *)(v76 + 32 + 16 * v75);
          *v79 = v77;
          v79[1] = v78;
          v80 = *(_QWORD *)(v76 + 16);
          if (v25 > v80)
            goto LABEL_111;
          memmove((void *)(v76 + 32 + 16 * (v25 - 1)), (const void *)(v76 + 32 + 16 * v25), 16 * (v80 - v25));
          result = v76;
          *(_QWORD *)(v76 + 16) = v80 - 1;
          v25 = v80 - 1;
        }
        while (v80 > 2);
      }
      result = swift_bridgeObjectRelease();
      if (v85 < -1)
      {
LABEL_119:
        __break(1u);
LABEL_120:
        __break(1u);
LABEL_121:
        __break(1u);
LABEL_122:
        __break(1u);
      }
      else
      {
        *(_QWORD *)(v82 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
    }
    else
    {
      v9 = 0;
      v10 = *v2;
      v11 = MEMORY[0x24BEE4AF8];
      v83 = v7;
      v86 = *v2;
      while (1)
      {
        result = sub_2461527C4(&v90, v10, v5, v9, a1);
        if (v4)
          break;
        v12 = v90;
        if ((result & 1) != 0)
        {
          if (v90 < v9)
            goto LABEL_114;
          if (v9 < v90)
          {
            v13 = 24 * v90;
            v14 = 24 * v9;
            v15 = v90;
            v16 = v9;
            do
            {
              if (v16 != --v15)
              {
                if (!v86)
                  goto LABEL_121;
                v17 = v86 + v14;
                v18 = v86 + v13;
                v19 = *(_QWORD *)(v86 + v14 + 16);
                v20 = *(_OWORD *)(v86 + v14);
                v21 = *(_QWORD *)(v86 + v13 - 8);
                *(_OWORD *)v17 = *(_OWORD *)(v86 + v13 - 24);
                *(_QWORD *)(v17 + 16) = v21;
                *(_OWORD *)(v18 - 24) = v20;
                *(_QWORD *)(v18 - 8) = v19;
              }
              ++v16;
              v13 -= 24;
              v14 += 24;
            }
            while (v16 < v15);
          }
        }
        if (v12 < v5)
        {
          if (__OFSUB__(v12, v9))
            goto LABEL_115;
          if (v12 - v9 < v7)
          {
            if (__OFADD__(v9, v7))
              goto LABEL_117;
            if (v9 + v7 >= v5)
              v22 = v5;
            else
              v22 = v9 + v7;
            if (v22 < v9)
            {
LABEL_118:
              __break(1u);
              goto LABEL_119;
            }
            result = sub_2461524C0(v9, v22, v12, a1, a2);
            v12 = v22;
          }
        }
        if (v12 < v9)
          goto LABEL_112;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_246152FE8(0, *(_QWORD *)(v11 + 16) + 1, 1, (char *)v11);
          v11 = result;
        }
        v24 = *(_QWORD *)(v11 + 16);
        v23 = *(_QWORD *)(v11 + 24);
        v25 = v24 + 1;
        v10 = v86;
        if (v24 >= v23 >> 1)
        {
          result = (uint64_t)sub_246152FE8((char *)(v23 > 1), v24 + 1, 1, (char *)v11);
          v10 = v86;
          v11 = result;
        }
        *(_QWORD *)(v11 + 16) = v25;
        v26 = v11 + 32;
        v27 = (uint64_t *)(v11 + 32 + 16 * v24);
        *v27 = v9;
        v27[1] = v12;
        v84 = v12;
        if (v24)
        {
          while (1)
          {
            v28 = v25 - 1;
            if (v25 >= 4)
            {
              v33 = v26 + 16 * v25;
              v34 = *(_QWORD *)(v33 - 64);
              v35 = *(_QWORD *)(v33 - 56);
              v39 = __OFSUB__(v35, v34);
              v36 = v35 - v34;
              if (v39)
                goto LABEL_97;
              v38 = *(_QWORD *)(v33 - 48);
              v37 = *(_QWORD *)(v33 - 40);
              v39 = __OFSUB__(v37, v38);
              v31 = v37 - v38;
              v32 = v39;
              if (v39)
                goto LABEL_98;
              v40 = v25 - 2;
              v41 = (uint64_t *)(v26 + 16 * (v25 - 2));
              v43 = *v41;
              v42 = v41[1];
              v39 = __OFSUB__(v42, v43);
              v44 = v42 - v43;
              if (v39)
                goto LABEL_99;
              v39 = __OFADD__(v31, v44);
              v45 = v31 + v44;
              if (v39)
                goto LABEL_101;
              if (v45 >= v36)
              {
                v63 = (uint64_t *)(v26 + 16 * v28);
                v65 = *v63;
                v64 = v63[1];
                v39 = __OFSUB__(v64, v65);
                v66 = v64 - v65;
                if (v39)
                  goto LABEL_107;
                v56 = v31 < v66;
                goto LABEL_59;
              }
            }
            else
            {
              if (v25 != 3)
              {
                v57 = *(_QWORD *)(v11 + 32);
                v58 = *(_QWORD *)(v11 + 40);
                v39 = __OFSUB__(v58, v57);
                v50 = v58 - v57;
                v51 = v39;
                goto LABEL_53;
              }
              v30 = *(_QWORD *)(v11 + 32);
              v29 = *(_QWORD *)(v11 + 40);
              v39 = __OFSUB__(v29, v30);
              v31 = v29 - v30;
              v32 = v39;
            }
            if ((v32 & 1) != 0)
              goto LABEL_100;
            v40 = v25 - 2;
            v46 = (uint64_t *)(v26 + 16 * (v25 - 2));
            v48 = *v46;
            v47 = v46[1];
            v49 = __OFSUB__(v47, v48);
            v50 = v47 - v48;
            v51 = v49;
            if (v49)
              goto LABEL_102;
            v52 = (uint64_t *)(v26 + 16 * v28);
            v54 = *v52;
            v53 = v52[1];
            v39 = __OFSUB__(v53, v54);
            v55 = v53 - v54;
            if (v39)
              goto LABEL_104;
            if (__OFADD__(v50, v55))
              goto LABEL_106;
            if (v50 + v55 >= v31)
            {
              v56 = v31 < v55;
LABEL_59:
              if (v56)
                v28 = v40;
              goto LABEL_61;
            }
LABEL_53:
            if ((v51 & 1) != 0)
              goto LABEL_103;
            v59 = (uint64_t *)(v26 + 16 * v28);
            v61 = *v59;
            v60 = v59[1];
            v39 = __OFSUB__(v60, v61);
            v62 = v60 - v61;
            if (v39)
              goto LABEL_105;
            if (v62 < v50)
              goto LABEL_69;
LABEL_61:
            v67 = v28 - 1;
            if (v28 - 1 >= v25)
            {
              __break(1u);
LABEL_94:
              __break(1u);
LABEL_95:
              __break(1u);
LABEL_96:
              __break(1u);
LABEL_97:
              __break(1u);
LABEL_98:
              __break(1u);
LABEL_99:
              __break(1u);
LABEL_100:
              __break(1u);
LABEL_101:
              __break(1u);
LABEL_102:
              __break(1u);
LABEL_103:
              __break(1u);
LABEL_104:
              __break(1u);
LABEL_105:
              __break(1u);
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
              goto LABEL_118;
            }
            if (!v10)
              goto LABEL_120;
            v68 = v11;
            v69 = (uint64_t *)(v26 + 16 * v67);
            v70 = *v69;
            v71 = (_QWORD *)(v26 + 16 * v28);
            v72 = v71[1];
            result = sub_246152C64((char *)(v10 + 24 * *v69), (char *)(v10 + 24 * *v71), v10 + 24 * v72, v87, a1);
            if (v72 < v70)
              goto LABEL_94;
            if (v28 > *(_QWORD *)(v68 + 16))
              goto LABEL_95;
            *v69 = v70;
            *(_QWORD *)(v26 + 16 * v67 + 8) = v72;
            v73 = *(_QWORD *)(v68 + 16);
            if (v28 >= v73)
              goto LABEL_96;
            v11 = v68;
            v25 = v73 - 1;
            result = (uint64_t)memmove((void *)(v26 + 16 * v28), v71 + 2, 16 * (v73 - 1 - v28));
            *(_QWORD *)(v68 + 16) = v73 - 1;
            v10 = v86;
            if (v73 <= 2)
              goto LABEL_69;
          }
        }
        v25 = 1;
LABEL_69:
        v9 = v84;
        v5 = v85;
        v4 = 0;
        v7 = v83;
        if (v84 >= v85)
          goto LABEL_78;
      }
      result = swift_bridgeObjectRelease();
LABEL_74:
      if (v5 < -1)
        goto LABEL_116;
      *(_QWORD *)(v82 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_24615236C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  double *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  double v18;
  unsigned int v19;
  __int128 v21;

  if (a3 == a2)
    return;
  v4 = a3;
  v6 = *a4;
  v7 = *a4 + 24 * a3 - 24;
  while (2)
  {
    v8 = (double *)(v6 + 24 * v4);
    v9 = *v8;
    v10 = v8[2];
    v11 = a1;
    v12 = v7;
    do
    {
      v13 = *(_QWORD *)v12;
      v14 = *(double *)(v12 + 16);
      v15 = *(unsigned __int8 *)(*(_QWORD *)&v9 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
      if (v10 == v14)
      {
        v16 = *(unsigned __int8 *)(v13 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
        if (v15 != v16)
        {
          if (v15 >= v16)
            break;
          goto LABEL_16;
        }
        goto LABEL_10;
      }
      v17 = *(unsigned __int8 *)(v13 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
      if (v15 - 1 < 2)
      {
        if ((v17 - 1) > 1)
          goto LABEL_16;
LABEL_10:
        v18 = sub_24613FEB8();
        if (sub_24613FEB8() >= v18)
          break;
        goto LABEL_16;
      }
      v19 = v17 - 3;
      if (v10 >= v14 || v19 > 0xFFFFFFFD)
        break;
LABEL_16:
      if (!v6)
      {
        __break(1u);
        return;
      }
      v10 = *(double *)(v12 + 40);
      v21 = *(_OWORD *)(v12 + 24);
      *(_OWORD *)(v12 + 24) = *(_OWORD *)v12;
      *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 16);
      *(_OWORD *)v12 = v21;
      *(double *)(v12 + 16) = v10;
      v9 = *(double *)&v21;
      v12 -= 24;
      ++v11;
    }
    while (v4 != v11);
    ++v4;
    v7 += 24;
    if (v4 != a2)
      continue;
    break;
  }
}

uint64_t sub_2461524C0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD *, _QWORD *), uint64_t a5)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[3];
  _QWORD v26[5];

  v26[4] = a5;
  if (a3 != a2)
  {
    v7 = result;
    v8 = *v5;
    v9 = (_QWORD *)(*v5 + 24 * a3);
    v19 = result;
    v22 = *v5;
LABEL_4:
    v10 = (uint64_t *)(v8 + 24 * a3);
    v11 = *v10;
    v12 = v10[1];
    v13 = v10[2];
    v21 = v9;
    v23 = a3;
    while (1)
    {
      v26[0] = v11;
      v26[1] = v12;
      v15 = *(v9 - 3);
      v14 = *(v9 - 2);
      v26[2] = v13;
      v16 = *(v9 - 1);
      v25[0] = v15;
      v25[1] = v14;
      v25[2] = v16;
      swift_retain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      v17 = a4(v26, v25);
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      result = swift_release();
      if (v6)
        break;
      if ((v17 & 1) == 0)
      {
        v8 = v22;
        v18 = v23;
LABEL_11:
        a3 = v18 + 1;
        v9 = v21 + 3;
        v7 = v19;
        if (a3 != a2)
          goto LABEL_4;
        return result;
      }
      v8 = v22;
      if (!v22)
      {
        __break(1u);
        return result;
      }
      v11 = *v9;
      v12 = v9[1];
      v13 = v9[2];
      *(_OWORD *)v9 = *(_OWORD *)(v9 - 3);
      v9[2] = *(v9 - 1);
      *(v9 - 2) = v12;
      *(v9 - 1) = v13;
      *(v9 - 3) = v11;
      v9 -= 3;
      ++v7;
      v18 = v23;
      if (v23 == v7)
        goto LABEL_11;
    }
  }
  return result;
}

uint64_t sub_246152630(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  int v5;
  uint64_t v8;
  __int128 *v10;
  uint64_t v11;
  __int128 *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  _BOOL4 v21;
  unsigned int v22;
  double v23;
  BOOL v24;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;

  if (a4 + 1 >= a3)
  {
    LOBYTE(v5) = 0;
    v8 = a4 + 1;
  }
  else
  {
    v8 = a3;
    v10 = (__int128 *)(a2 + 24 * (a4 + 1));
    v11 = *((_QWORD *)v10 + 2);
    v28 = *v10;
    v29 = v11;
    v12 = (__int128 *)(a2 + 24 * a4);
    v13 = *((_QWORD *)v12 + 2);
    v26 = *v12;
    v27 = v13;
    v14 = sub_24614EBDC((uint64_t)&v28, (double *)&v26);
    if (v4)
      return v5 & 1;
    v5 = v14;
    v15 = a4 + 2;
    if (a4 + 2 < v8)
    {
      v16 = a2 + 24 * a4 + 40;
      while (1)
      {
        v17 = *(double *)(v16 + 24);
        v18 = *(_QWORD *)(v16 - 16);
        v19 = *(unsigned __int8 *)(*(_QWORD *)(v16 + 8)
                                 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
        if (v17 == *(double *)v16)
          break;
        v22 = *(unsigned __int8 *)(v18 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source) - 1;
        if (v19 - 1 >= 2)
        {
          if (v22 > 1)
          {
            v24 = v17 < *(double *)v16;
            goto LABEL_13;
          }
          if ((v5 & 1) != 0)
            goto LABEL_25;
        }
        else
        {
          if (v22 <= 1)
            goto LABEL_12;
          if ((v5 & 1) == 0)
            goto LABEL_25;
        }
LABEL_17:
        ++v15;
        v16 += 24;
        if (v15 >= v8)
          goto LABEL_26;
      }
      v20 = *(unsigned __int8 *)(v18 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
      if (v19 == v20)
      {
LABEL_12:
        v23 = sub_24613FEB8();
        v24 = sub_24613FEB8() < v23;
LABEL_13:
        v21 = v24;
      }
      else
      {
        v21 = v19 < v20;
      }
      if (((v5 ^ v21) & 1) != 0)
        goto LABEL_25;
      goto LABEL_17;
    }
LABEL_25:
    v8 = v15;
  }
LABEL_26:
  *a1 = v8;
  return v5 & 1;
}

uint64_t sub_2461527C4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t *, uint64_t *))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  _QWORD *v24;
  uint64_t (*v27)(uint64_t *, uint64_t *);
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v6 = a4 + 1;
  if (a4 + 1 >= a3)
  {
    v16 = 0;
    *a1 = v6;
  }
  else
  {
    v35 = a3;
    v9 = (uint64_t *)(a2 + 24 * v6);
    v10 = v9[1];
    v11 = v9[2];
    v32 = *v9;
    v33 = v10;
    v34 = v11;
    v12 = (uint64_t *)(a2 + 24 * a4);
    v13 = v12[1];
    v14 = v12[2];
    v29 = *v12;
    v30 = v13;
    v31 = v14;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    v28 = a5(&v32, &v29);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    if (!v5)
    {
      v27 = a5;
      v17 = a4 + 2;
      if (a4 + 2 >= v35)
      {
        v16 = v28;
      }
      else
      {
        v18 = (uint64_t *)(a2 + 24 * a4 + 64);
        while (1)
        {
          v19 = *(v18 - 1);
          v20 = *v18;
          v32 = *(v18 - 2);
          v33 = v19;
          v34 = v20;
          v21 = *(v18 - 4);
          v22 = *(v18 - 3);
          v29 = *(v18 - 5);
          v30 = v21;
          v31 = v22;
          swift_retain();
          swift_bridgeObjectRetain();
          swift_retain();
          swift_bridgeObjectRetain();
          v23 = v27(&v32, &v29);
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          swift_release();
          v16 = v28;
          if (((v28 ^ v23) & 1) != 0)
            break;
          ++v17;
          v18 += 3;
          if (v17 >= v35)
          {
            v17 = v35;
            v24 = a1;
            v16 = v28;
            goto LABEL_13;
          }
        }
      }
      v24 = a1;
LABEL_13:
      *v24 = v17;
    }
  }
  return v16 & 1;
}

uint64_t sub_2461529B0(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v16;
  double v17;
  uint64_t v18;
  double v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  double v23;
  double v24;
  char *v25;
  BOOL v26;
  __int128 v27;
  unsigned int v29;
  unint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  double v36;
  double v37;
  unsigned int v38;
  unsigned int v39;
  int v40;
  char *v41;
  double v42;
  double v43;
  BOOL v44;
  __int128 v45;
  unsigned int v47;
  BOOL v49;
  char *v50;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = (a2 - __src) / 24;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 24;
  if (v9 >= v11)
  {
    sub_24615051C(a2, (uint64_t)(a3 - (_QWORD)a2) / 24, __dst);
    v12 = &v4[24 * v11];
    if (v7 >= v6 || v10 < 24)
      goto LABEL_13;
    v31 = a3 - 24;
    v50 = v4;
    while (1)
    {
      v32 = (char *)(v31 + 24);
      v33 = v12 - 24;
      v34 = v6 - 24;
      v35 = *((_QWORD *)v6 - 3);
      v36 = *((double *)v12 - 1);
      v37 = *((double *)v6 - 1);
      v38 = *(unsigned __int8 *)(*((_QWORD *)v12 - 3) + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
      if (v36 == v37)
        break;
      v40 = *(unsigned __int8 *)(v35 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
      if (v38 - 1 < 2)
      {
        if ((v40 - 1) > 1)
          goto LABEL_44;
LABEL_43:
        v41 = v12;
        v42 = sub_24613FEB8();
        v43 = sub_24613FEB8();
        v12 = v41;
        v4 = v50;
        if (v43 >= v42)
          goto LABEL_60;
        goto LABEL_44;
      }
      v47 = v40 - 3;
      if (v36 >= v37 || v47 > 0xFFFFFFFD)
      {
LABEL_60:
        v49 = v32 != v12 || v31 >= (unint64_t)v12;
        v34 = v33;
        v12 = v33;
        if (!v49)
          goto LABEL_50;
        goto LABEL_49;
      }
LABEL_44:
      v44 = v32 != v6 || v31 >= (unint64_t)v6;
      v6 -= 24;
      if (!v44)
        goto LABEL_50;
LABEL_49:
      v45 = *(_OWORD *)v34;
      *(_QWORD *)(v31 + 16) = *((_QWORD *)v34 + 2);
      *(_OWORD *)v31 = v45;
LABEL_50:
      v31 -= 24;
      if (v6 <= v7 || v12 <= v4)
        goto LABEL_13;
    }
    v39 = *(unsigned __int8 *)(v35 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
    if (v38 != v39)
    {
      if (v38 >= v39)
        goto LABEL_60;
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  sub_24615051C(__src, (a2 - __src) / 24, __dst);
  v12 = &v4[24 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 24)
  {
    v16 = &v4[24 * v9];
    while (1)
    {
      v17 = *((double *)v6 + 2);
      v18 = *(_QWORD *)v4;
      v19 = *((double *)v4 + 2);
      v20 = *(unsigned __int8 *)(*(_QWORD *)v6 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
      if (v17 == v19)
        break;
      v22 = *(unsigned __int8 *)(v18 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
      if (v20 - 1 < 2)
      {
        if ((v22 - 1) > 1)
          goto LABEL_21;
LABEL_20:
        v23 = sub_24613FEB8();
        v24 = sub_24613FEB8();
        v12 = v16;
        if (v24 >= v23)
          goto LABEL_34;
        goto LABEL_21;
      }
      v29 = v22 - 3;
      if (v17 >= v19 || v29 > 0xFFFFFFFD)
      {
LABEL_34:
        v25 = v4;
        v26 = v7 == v4;
        v4 += 24;
        if (v26)
          goto LABEL_23;
LABEL_22:
        v27 = *(_OWORD *)v25;
        *((_QWORD *)v7 + 2) = *((_QWORD *)v25 + 2);
        *(_OWORD *)v7 = v27;
        goto LABEL_23;
      }
LABEL_21:
      v25 = v6;
      v26 = v7 == v6;
      v6 += 24;
      if (!v26)
        goto LABEL_22;
LABEL_23:
      v7 += 24;
      if (v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_7;
    }
    v21 = *(unsigned __int8 *)(v18 + OBJC_IVAR____TtC19SiriAutoCompleteAPI18AutoCompletePhrase_source);
    if (v20 != v21)
    {
      if (v20 >= v21)
        goto LABEL_34;
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_7:
  v6 = v7;
LABEL_13:
  sub_24615051C(v4, (v12 - v4) / 24, v6);
  return 1;
}

uint64_t sub_246152C64(char *__src, char *a2, unint64_t a3, char *__dst, uint64_t (*a5)(uint64_t *, uint64_t *))
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v15;
  char *v17;
  uint64_t v20;
  char *v21;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  char *v31;
  char *v32;
  BOOL v33;
  __int128 v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  char *v44;
  BOOL v45;
  __int128 v46;
  char *v47;
  char *v48;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;

  v6 = v5;
  v7 = __dst;
  v9 = __src;
  v10 = a2 - __src;
  v11 = (a2 - __src) / 24;
  v12 = a3 - (_QWORD)a2;
  v13 = (uint64_t)(a3 - (_QWORD)a2) / 24;
  if (v11 < v13)
  {
    sub_24615051C(__src, (a2 - __src) / 24, __dst);
    v15 = &v7[24 * v11];
    if ((unint64_t)a2 >= a3 || v10 < 24)
    {
LABEL_7:
      v17 = v9;
    }
    else
    {
      v23 = a2;
      v57 = &v7[24 * v11];
      while (1)
      {
        v50 = v9;
        v24 = *((_QWORD *)v23 + 1);
        v25 = v23;
        v26 = *((_QWORD *)v23 + 2);
        v54 = *(_QWORD *)v23;
        v55 = v24;
        v56 = v26;
        v27 = *((_QWORD *)v7 + 1);
        v28 = *((_QWORD *)v7 + 2);
        v51 = *(_QWORD *)v7;
        v52 = v27;
        v53 = v28;
        swift_retain();
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        v29 = a5(&v54, &v51);
        if (v6)
        {
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          swift_release();
          v20 = (v57 - v7) / 24;
          v21 = v7;
          v17 = v50;
          goto LABEL_14;
        }
        v30 = v29;
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        if ((v30 & 1) != 0)
        {
          v31 = v25;
          v23 = v25 + 24;
          v32 = v50;
          v33 = v50 == v25;
        }
        else
        {
          v31 = v7;
          v32 = v50;
          v33 = v50 == v7;
          v7 += 24;
          v23 = v25;
        }
        v15 = v57;
        if (!v33)
        {
          v34 = *(_OWORD *)v31;
          *((_QWORD *)v32 + 2) = *((_QWORD *)v31 + 2);
          *(_OWORD *)v32 = v34;
        }
        v9 = v32 + 24;
        if (v7 >= v15)
          break;
        v6 = 0;
        if ((unint64_t)v23 >= a3)
          goto LABEL_7;
      }
      v17 = v9;
    }
    goto LABEL_13;
  }
  sub_24615051C(a2, (uint64_t)(a3 - (_QWORD)a2) / 24, __dst);
  v17 = a2;
  v15 = &v7[24 * v13];
  if (v9 >= a2 || v12 < 24)
  {
LABEL_13:
    v20 = (v15 - v7) / 24;
    v21 = v7;
LABEL_14:
    sub_24615051C(v21, v20, v17);
    return 1;
  }
  v35 = a3 - 24;
  v47 = v7;
  while (1)
  {
    v57 = v15;
    v37 = *((_QWORD *)v15 - 2);
    v36 = v15 - 24;
    v38 = *((_QWORD *)v15 - 1);
    v54 = *((_QWORD *)v15 - 3);
    v55 = v37;
    v56 = v38;
    v48 = v17;
    v40 = *((_QWORD *)v17 - 2);
    v39 = v17 - 24;
    v41 = *((_QWORD *)v17 - 1);
    v51 = *((_QWORD *)v17 - 3);
    v52 = v40;
    v53 = v41;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    v42 = a5(&v54, &v51);
    if (v5)
      break;
    v43 = v42;
    v44 = (char *)(v35 + 24);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    if ((v43 & 1) != 0)
    {
      v45 = v44 != v48 || v35 >= (unint64_t)v48;
      v17 = v39;
      v15 = v57;
    }
    else
    {
      v45 = v44 != v57 || v35 >= (unint64_t)v57;
      v39 = v36;
      v15 = v36;
      v17 = v48;
    }
    if (v45)
    {
      v46 = *(_OWORD *)v39;
      *(_QWORD *)(v35 + 16) = *((_QWORD *)v39 + 2);
      *(_OWORD *)v35 = v46;
    }
    v7 = v47;
    if (v17 > v9)
    {
      v35 -= 24;
      if (v15 > v47)
        continue;
    }
    goto LABEL_13;
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_24615051C(v47, (v57 - v47) / 24, v48);
  return 1;
}

char *sub_246152FE8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754D8A0);
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
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2461530DC(uint64_t a1)
{
  return sub_246152FE8(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2461530F0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  v7 = *v5;
  v8 = *(_QWORD *)(*v5 + 16);
  if (v8 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v9 = result;
  v10 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v11 = 1 - v10;
  if (__OFSUB__(1, v10))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v12 = v8 + v11;
  if (__OFADD__(v8, v11))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v12 > *(_QWORD *)(v7 + 24) >> 1)
  {
    if (v8 <= v12)
      v17 = v8 + v11;
    else
      v17 = v8;
    sub_24614FA90(isUniquelyReferenced_nonNull_native, v17, 1, v7);
    v7 = v18;
  }
  v19 = v7 + 32;
  v20 = v7 + 32 + 24 * v9;
  result = swift_arrayDestroy();
  if (!v11)
    goto LABEL_16;
  v21 = *(_QWORD *)(v7 + 16);
  if (__OFSUB__(v21, a2))
    goto LABEL_22;
  result = (uint64_t)sub_24615051C((char *)(v19 + 24 * a2), v21 - a2, (char *)(v20 + 24));
  v22 = *(_QWORD *)(v7 + 16);
  v23 = __OFADD__(v22, v11);
  v24 = v22 + v11;
  if (!v23)
  {
    *(_QWORD *)(v7 + 16) = v24;
LABEL_16:
    *(_QWORD *)v20 = a3;
    v25 = v19 + 24 * v9;
    *(_QWORD *)(v25 + 8) = a4;
    *(double *)(v25 + 16) = a5;
    *v5 = v7;
    return result;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_246153228(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v5;

  v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2)
      return 0;
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  v5 = __OFADD__(result, a2);
  result += a2;
  if (v5)
    goto LABEL_14;
  return result;
}

_QWORD *sub_246153274(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[3];
  uint64_t v23;
  _UNKNOWN **v24;
  _QWORD v25[5];

  v8 = *a4;
  v9 = type metadata accessor for DefaultProfanityPreferenceProvider();
  v25[3] = v9;
  v25[4] = &off_25173E6D0;
  v25[0] = a3;
  v23 = v8;
  v24 = &off_25173E5C0;
  v22[0] = a4;
  type metadata accessor for DefaultSiriAutoCompleteService();
  v10 = (_QWORD *)swift_allocObject();
  v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v9);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (_QWORD *)((char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, v23);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (_QWORD *)((char *)v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v18 + 16))(v17);
  v19 = *v13;
  v20 = *v17;
  v10[11] = v9;
  v10[12] = &off_25173E6D0;
  v10[8] = v19;
  v10[16] = v8;
  v10[17] = &off_25173E5C0;
  v10[13] = v20;
  sub_24615468C(a1, (uint64_t)(v10 + 2));
  v10[7] = a2;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  return v10;
}

uint64_t sub_2461533E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C8F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t dispatch thunk of SiriAutoCompleteService.addPhrasesToVectorDB(vectorSearchAssets:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  OUTLINED_FUNCTION_83();
  v1 = (_QWORD *)OUTLINED_FUNCTION_21();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_16_1(v1, (uint64_t)sub_24615491C);
  return OUTLINED_FUNCTION_13_1(v2, v3, v4, v5);
}

uint64_t dispatch thunk of SiriAutoCompleteService.autoCompleteResults(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of SiriAutoCompleteService.insertPhrasesForAssistantSuggestions(phrases:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  OUTLINED_FUNCTION_83();
  v1 = (_QWORD *)OUTLINED_FUNCTION_21();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_16_1(v1, (uint64_t)sub_246154920);
  return OUTLINED_FUNCTION_13_1(v2, v3, v4, v5);
}

uint64_t dispatch thunk of SiriAutoCompleteService.deletePhrasesForSource(source:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  OUTLINED_FUNCTION_83();
  v1 = (_QWORD *)OUTLINED_FUNCTION_21();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_16_1(v1, (uint64_t)sub_246154920);
  return OUTLINED_FUNCTION_13_1(v2, v3, v4, v5);
}

uint64_t dispatch thunk of SiriAutoCompleteService.deletePhrasesForApp(bundleIds:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  OUTLINED_FUNCTION_83();
  v1 = (_QWORD *)OUTLINED_FUNCTION_21();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_16_1(v1, (uint64_t)sub_24615491C);
  return OUTLINED_FUNCTION_13_1(v2, v3, v4, v5);
}

uint64_t dispatch thunk of SiriAutoCompleteService.increaseTapCountForPhrase(phrase:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v9 = (_QWORD *)OUTLINED_FUNCTION_91();
  *(_QWORD *)(v4 + 16) = v9;
  OUTLINED_FUNCTION_139(v9, (uint64_t)sub_246154920);
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of SiriAutoCompleteService.fetchPhrasesMatching(filters:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of SiriAutoCompleteService.dropDB()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v4)(uint64_t);

  v1 = (_QWORD *)OUTLINED_FUNCTION_91();
  *(_QWORD *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_139(v1, (uint64_t)sub_24614F520);
  v2 = OUTLINED_FUNCTION_79();
  return v4(v2);
}

uint64_t type metadata accessor for DefaultSiriAutoCompleteService()
{
  return objc_opt_self();
}

uint64_t method lookup function for DefaultSiriAutoCompleteService()
{
  return swift_lookUpClassMethod();
}

BOOL sub_246153628(uint64_t *a1, uint64_t *a2)
{
  return sub_24614E0AC(a1, a2);
}

char *sub_246153648(uint64_t a1)
{
  return sub_24615154C(0, *(_QWORD *)(a1 + 16), 0, a1);
}

size_t sub_24615365C(size_t result)
{
  uint64_t v1;
  int64_t v2;
  unint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v19;

  v2 = result;
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD **)v1;
  v5 = v3 >> 1;
  if ((v3 & 1) == 0)
    goto LABEL_8;
  result = swift_isUniquelyReferenced_nonNull();
  *(_QWORD *)v1 = v4;
  if ((result & 1) == 0)
    goto LABEL_8;
  v6 = *(_QWORD *)(v1 + 16);
  v7 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v8 = *(_QWORD *)(v1 + 8);
  sub_246155F80();
  swift_unknownObjectRetain();
  v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    v9 = MEMORY[0x24BEE4AF8];
  }
  v10 = *(_QWORD *)(v9 + 16);
  if (v8 + 32 * v6 + 32 * v7 != v9 + 32 * v10 + 32)
  {
    result = swift_release();
    goto LABEL_23;
  }
  v17 = *(_QWORD *)(v9 + 24);
  result = swift_release();
  v18 = (v17 >> 1) - v10;
  v19 = __OFADD__(v7, v18);
  v7 += v18;
  if (!v19)
  {
LABEL_23:
    if (v7 >= v2)
      goto LABEL_21;
LABEL_8:
    v11 = *(_QWORD *)(v1 + 16);
    v12 = v5 - v11;
    if (__OFSUB__(v5, v11))
    {
      __break(1u);
    }
    else
    {
      v13 = *(_QWORD *)(v1 + 8);
      if (v12 <= v2)
        v14 = v2;
      else
        v14 = v5 - v11;
      if (v14)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_25754D898);
        v4 = (_QWORD *)swift_allocObject();
        result = _swift_stdlib_malloc_size(v4);
        v4[2] = v12;
        v4[3] = 2 * ((uint64_t)(result - 32) / 32);
      }
      else
      {
        v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
      }
      if (v5 >= v11)
      {
        result = sub_246150948(v13 + 32 * v11, v5 - v11, (unint64_t)(v4 + 4));
        if (!__OFSUB__(0, v11))
        {
          v15 = v4[2];
          v16 = v11 + v15;
          if (!__OFADD__(v11, v15))
          {
            if (v16 >= v11)
            {
              result = swift_unknownObjectRelease();
              if ((v16 & 0x8000000000000000) == 0)
              {
                *(_QWORD *)(v1 + 8) = &v4[-4 * v11 + 4];
                *(_QWORD *)(v1 + 16) = v11;
                *(_QWORD *)(v1 + 24) = (2 * v16) | 1;
LABEL_21:
                *(_QWORD *)v1 = v4;
                return result;
              }
              goto LABEL_30;
            }
LABEL_29:
            __break(1u);
LABEL_30:
            __break(1u);
            goto LABEL_31;
          }
LABEL_28:
          __break(1u);
          goto LABEL_29;
        }
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
    }
    __break(1u);
    goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

_QWORD *sub_24615381C(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  _QWORD v22[5];

  v5 = a4 >> 1;
  v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_22;
  }
  v9 = result;
  result = (_QWORD *)sub_246153C64((a4 >> 1) - a3);
  v11 = v4[2];
  v10 = v4[3];
  v12 = (v10 >> 1) - v11;
  if (__OFSUB__(v10 >> 1, v11))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v13 = v4[1] + 32 * v11 + 32 * v12;
  if ((v10 & 1) == 0)
  {
LABEL_8:
    v16 = v12;
    goto LABEL_10;
  }
  sub_246155F80();
  swift_unknownObjectRetain();
  v14 = swift_dynamicCastClass();
  if (!v14)
  {
    swift_unknownObjectRelease();
    v14 = MEMORY[0x24BEE4AF8];
  }
  v15 = *(_QWORD *)(v14 + 16);
  if (v13 != v14 + 32 * v15 + 32)
  {
    result = (_QWORD *)swift_release();
    goto LABEL_8;
  }
  v17 = *(_QWORD *)(v14 + 24);
  result = (_QWORD *)swift_release();
  v18 = (v17 >> 1) - v15;
  v19 = __OFADD__(v12, v18);
  v16 = v12 + v18;
  if (v19)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
LABEL_10:
  v20 = v16 - v12;
  if (__OFSUB__(v16, v12))
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v5 == a3)
  {
    if (v6 <= 0)
    {
      v6 = 0;
      v5 = a3;
      goto LABEL_18;
    }
    goto LABEL_24;
  }
  if (v20 < v6)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  sub_246150948(a2 + 32 * a3, v6, v13);
  if (v6 > 0)
  {
    result = (_QWORD *)(v12 + v6);
    if (__OFADD__(v12, v6))
    {
LABEL_27:
      __break(1u);
      return result;
    }
    sub_246153D58((uint64_t)result);
  }
LABEL_18:
  if (v6 != v20)
    return (_QWORD *)swift_unknownObjectRelease();
  v22[0] = v9;
  v22[1] = a2;
  v22[2] = a3;
  v22[3] = a4;
  v22[4] = v5;
  return sub_246153E0C(v22);
}

uint64_t sub_2461539C0(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  if (__OFSUB__(0, a2))
  {
    __break(1u);
    goto LABEL_7;
  }
  v2 = *(_QWORD *)(result + 16);
  v3 = __OFADD__(a2, v2);
  v4 = a2 + v2;
  if (v3)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v4 < a2)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
LABEL_9:
    __break(1u);
  return result;
}

uint64_t sub_246153A08(uint64_t result, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *__dst;
  uint64_t v30;
  uint64_t v31;

  v5 = v4[2];
  v6 = (unint64_t)v4[3] >> 1;
  v7 = v6 - v5;
  if (__OFSUB__(v6, v5))
  {
    __break(1u);
    goto LABEL_17;
  }
  v9 = *(_QWORD *)result;
  v10 = *(_QWORD *)(*(_QWORD *)result + 16);
  v11 = __OFSUB__(v10, a2);
  v12 = v10 - a2;
  if (v11)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v13 = v12 - a3;
  if (__OFSUB__(v12, a3))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v14 = v7 - a2;
  if (__OFSUB__(v7, a2))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v11 = __OFSUB__(v14, v13);
  v15 = v14 - v13;
  if (v11)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v31 = v15;
  v17 = (char *)(v9 + 32);
  v18 = v9 + 32 + 32 * a2;
  __dst = (char *)(v18 + 32 * a3);
  result = sub_2461543B4(v7);
  v30 = v9;
  if (result)
  {
    v19 = result;
    v28 = v4[2];
    v20 = (char *)(v4[1] + 32 * v28);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25754D890);
    swift_arrayDestroy();
    sub_2461505A8(v20, a2, v17);
    swift_arrayDestroy();
    a4(v18, a3);
    sub_2461505A8(&v20[32 * a2 + 32 * v31], v13, __dst);
    swift_arrayDestroy();
    *(_QWORD *)(v19 + 16) = 0;
    v21 = v28;
    swift_release();
LABEL_15:
    swift_retain();
    swift_unknownObjectRelease();
    result = sub_2461539C0(v30, v21);
    *v4 = result;
    v4[1] = v25;
    v4[2] = v26;
    v4[3] = v27;
    return result;
  }
  v21 = v4[2];
  v22 = v21 + a2;
  if (__OFADD__(v21, a2))
    goto LABEL_21;
  if (v22 < v21)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (__OFSUB__(v22, v21))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754D890);
  swift_arrayInitWithCopy();
  result = ((uint64_t (*)(char *, uint64_t))a4)(&v17[32 * a2], a3);
  v23 = v22 + v31;
  if (__OFADD__(v22, v31))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v24 = (unint64_t)v4[3] >> 1;
  if (v24 < v23)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (!__OFSUB__(v24, v23))
  {
    swift_arrayInitWithCopy();
    goto LABEL_15;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_246153C64(uint64_t result)
{
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  v3 = v1[2];
  v2 = v1[3];
  v4 = (v2 >> 1) - v3;
  if (__OFSUB__(v2 >> 1, v3))
  {
    __break(1u);
    goto LABEL_16;
  }
  v5 = result;
  if ((v2 & 1) == 0)
    goto LABEL_7;
  v6 = v1[1];
  sub_246155F80();
  swift_unknownObjectRetain();
  v7 = swift_dynamicCastClass();
  if (!v7)
  {
    swift_unknownObjectRelease();
    v7 = MEMORY[0x24BEE4AF8];
  }
  v8 = *(_QWORD *)(v7 + 16);
  if (v6 + 32 * v3 + 32 * v4 != v7 + 32 * v8 + 32)
  {
    swift_release();
LABEL_7:
    v9 = v4;
    goto LABEL_9;
  }
  v10 = *(_QWORD *)(v7 + 24);
  result = swift_release();
  v11 = (v10 >> 1) - v8;
  v12 = __OFADD__(v4, v11);
  v9 = v4 + v11;
  if (!v12)
  {
LABEL_9:
    result = v4 + v5;
    if (!__OFADD__(v4, v5))
    {
      if (v9 >= result)
        return sub_24615365C(result);
      if (v9 + 0x4000000000000000 >= 0)
      {
        v13 = 2 * v9;
        if (v13 > result)
          result = v13;
        return sub_24615365C(result);
      }
      goto LABEL_17;
    }
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_246153D58(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  v4 = v3 >> 1;
  v5 = __OFSUB__(v3 >> 1, v2);
  v6 = (v3 >> 1) - v2;
  if (v5)
  {
    __break(1u);
    goto LABEL_12;
  }
  v7 = result - v6;
  if (__OFSUB__(result, v6))
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!v7)
    return result;
  sub_246155F80();
  swift_unknownObjectRetain();
  result = swift_dynamicCastClass();
  if (!result)
  {
    swift_unknownObjectRelease();
    result = MEMORY[0x24BEE4AF8];
  }
  v8 = *(_QWORD *)(result + 16);
  v5 = __OFADD__(v8, v7);
  v9 = v8 + v7;
  if (v5)
    goto LABEL_13;
  *(_QWORD *)(result + 16) = v9;
  result = swift_release();
  v10 = v4 + v7;
  if (__OFADD__(v4, v7))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v10 < 0)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  *(_QWORD *)(v1 + 24) = v3 & 1 | (2 * v10);
  return result;
}

_QWORD *sub_246153E0C(_QWORD *result)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v9;
  uint64_t *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)();
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v2 = v1[2];
  v3 = v1[3];
  v4 = (v3 >> 1) - v2;
  if (__OFSUB__(v3 >> 1, v2))
    goto LABEL_56;
  v6 = result[3];
  v5 = result[4];
  v37 = (uint64_t)result;
  if (v5 == v6 >> 1)
    return (_QWORD *)sub_24615438C(v37);
  v7 = v6 >> 1;
  v46 = result[2];
  if (v5 < v46 || v5 >= v7)
    goto LABEL_57;
  v9 = v5 + 1;
  v38 = result[1];
  v10 = (uint64_t *)(v38 + 32 * v5);
  v11 = *((_BYTE *)v10 + 24);
  v12 = v10[1];
  v42 = v10[2];
  v45 = *v10;
  swift_retain();
  v41 = v12;
  result = (_QWORD *)swift_bridgeObjectRetain();
  v40 = v1;
  while (1)
  {
    v13 = v4 + 1;
    if (__OFADD__(v4, 1))
      break;
    v47 = sub_246154180(v4, v4 + 1, *v1, v1[1], v2, v3);
    v14 = sub_24615437C();
    sub_246153A08((uint64_t)&v47, v4, 0, (void (*)(uint64_t, uint64_t))v14);
    swift_release();
    result = (_QWORD *)swift_release();
    v2 = v1[2];
    v15 = v1[3];
    v16 = (v15 >> 1) - v2;
    if (__OFSUB__(v15 >> 1, v2))
      goto LABEL_50;
    v17 = v1[1];
    v44 = v1[3];
    v43 = v15 >> 1;
    if ((v15 & 1) == 0)
      goto LABEL_16;
    sub_246155F80();
    swift_unknownObjectRetain();
    v18 = swift_dynamicCastClass();
    if (!v18)
    {
      swift_unknownObjectRelease();
      v18 = MEMORY[0x24BEE4AF8];
    }
    v19 = *(_QWORD *)(v18 + 16);
    if (v17 + 32 * v2 + 32 * v16 != v18 + 32 * v19 + 32)
    {
      result = (_QWORD *)swift_release();
LABEL_16:
      v20 = v16;
      goto LABEL_18;
    }
    v21 = *(_QWORD *)(v18 + 24);
    result = (_QWORD *)swift_release();
    v22 = (v21 >> 1) - v19;
    v20 = v16 + v22;
    if (__OFADD__(v16, v22))
      goto LABEL_55;
LABEL_18:
    if (v4 >= v20)
      goto LABEL_21;
    v23 = v17 + 32 * v2 + 32 * v4;
    *(_QWORD *)v23 = v45;
    *(_QWORD *)(v23 + 8) = v41;
    *(_QWORD *)(v23 + 16) = v42;
    *(_BYTE *)(v23 + 24) = v11 & 1;
    if (v9 == v7)
    {
      v45 = 0;
      v41 = 0;
      v42 = 0;
      v11 = 0;
      ++v4;
      v9 = v7;
LABEL_21:
      v1 = v40;
      goto LABEL_38;
    }
    v39 = v2;
    if (v9 < v46 || v9 >= v7)
    {
LABEL_48:
      __break(1u);
      break;
    }
    v25 = 0;
    v26 = v17 + 32 * v39 + 32 * v4;
    v27 = v38 + 32 * v9++;
    while (1)
    {
      v28 = *(_QWORD *)(v27 + v25 + 8);
      v29 = *(_QWORD *)(v27 + v25 + 16);
      v11 = *(_BYTE *)(v27 + v25 + 24);
      if (v13 >= v20)
      {
        v42 = *(_QWORD *)(v27 + v25 + 16);
        v45 = *(_QWORD *)(v27 + v25);
        v41 = *(_QWORD *)(v27 + v25 + 8);
        goto LABEL_37;
      }
      v30 = v26 + v25;
      *(_QWORD *)(v30 + 32) = *(_QWORD *)(v27 + v25);
      *(_QWORD *)(v30 + 40) = v28;
      *(_QWORD *)(v30 + 48) = v29;
      *(_BYTE *)(v30 + 56) = v11;
      if (v7 == v9)
        break;
      swift_bridgeObjectRetain();
      result = (_QWORD *)swift_retain();
      v25 += 32;
      v31 = v9 >= v46 && v9 < v7;
      ++v9;
      ++v13;
      if (!v31)
        goto LABEL_48;
    }
    v45 = 0;
    v41 = 0;
    v42 = 0;
    v11 = 0;
    v20 = v13 + 1;
    v9 = v7;
LABEL_37:
    swift_bridgeObjectRetain();
    result = (_QWORD *)swift_retain();
    v4 = v20;
    v2 = v39;
    v1 = v40;
LABEL_38:
    v32 = __OFSUB__(v4, v16);
    v33 = v4 - v16;
    v3 = v44;
    if (v32)
      goto LABEL_51;
    if (v33)
    {
      sub_246155F80();
      swift_unknownObjectRetain();
      result = (_QWORD *)swift_dynamicCastClass();
      if (!result)
      {
        swift_unknownObjectRelease();
        result = (_QWORD *)MEMORY[0x24BEE4AF8];
      }
      v34 = result[2];
      v32 = __OFADD__(v34, v33);
      v35 = v34 + v33;
      if (v32)
        goto LABEL_52;
      result[2] = v35;
      result = (_QWORD *)swift_release();
      v36 = v43 + v33;
      if (__OFADD__(v43, v33))
        goto LABEL_53;
      if ((v36 & 0x8000000000000000) != 0)
        goto LABEL_54;
      v3 = v44 & 1 | (2 * v36);
      v1[3] = v3;
    }
    if (!v45)
      return (_QWORD *)sub_24615438C(v37);
  }
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
  return result;
}

uint64_t sub_246154180(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  BOOL v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  size_t v28;

  v8 = (a6 >> 1) - a5;
  if (__OFSUB__(a6 >> 1, a5))
  {
    __break(1u);
LABEL_32:
    if (v8 >= v7)
      goto LABEL_21;
LABEL_18:
    if (v8 + 0x4000000000000000 >= 0)
    {
      v8 *= 2;
      goto LABEL_21;
    }
    __break(1u);
    goto LABEL_35;
  }
  v7 = a2;
  v6 = result;
  if ((a6 & 1) == 0)
    goto LABEL_32;
  sub_246155F80();
  swift_unknownObjectRetain();
  v11 = swift_dynamicCastClass();
  if (!v11)
  {
    swift_unknownObjectRelease();
    v11 = MEMORY[0x24BEE4AF8];
  }
  v12 = *(_QWORD *)(v11 + 16);
  v13 = a4 + 32 * a5 + 32 * v8;
  if (v13 == v11 + 32 * v12 + 32)
  {
    v15 = *(_QWORD *)(v11 + 24);
    result = swift_release();
    v16 = (v15 >> 1) - v12;
    v14 = v8 + v16;
    if (__OFADD__(v8, v16))
    {
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }
  else
  {
    swift_release();
    v14 = v8;
  }
  swift_unknownObjectRetain();
  v17 = swift_dynamicCastClass();
  if (v14 < v7)
  {
    if (!v17)
    {
      swift_unknownObjectRelease();
      v17 = MEMORY[0x24BEE4AF8];
    }
    v18 = *(_QWORD *)(v17 + 16);
    if (v13 == v17 + 32 * v18 + 32)
    {
      v20 = *(_QWORD *)(v17 + 24);
      result = swift_release();
      v21 = (v20 >> 1) - v18;
      v22 = __OFADD__(v8, v21);
      v8 += v21;
      if (v22)
      {
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
    }
    else
    {
      result = swift_release();
    }
    goto LABEL_18;
  }
  if (!v17)
  {
    swift_unknownObjectRelease();
    v17 = MEMORY[0x24BEE4AF8];
  }
  v19 = *(_QWORD *)(v17 + 16);
  if (v13 == v17 + 32 * v19 + 32)
  {
    v23 = *(_QWORD *)(v17 + 24);
    result = swift_release();
    v24 = (v23 >> 1) - v19;
    v22 = __OFADD__(v8, v24);
    v8 += v24;
    if (!v22)
      goto LABEL_21;
LABEL_37:
    __break(1u);
    return result;
  }
  swift_release();
LABEL_21:
  if (v8 <= v7)
    v25 = v7;
  else
    v25 = v8;
  if (v25 <= v6)
    v26 = v6;
  else
    v26 = v25;
  if (!v26)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754D898);
  v27 = (_QWORD *)swift_allocObject();
  v28 = _swift_stdlib_malloc_size(v27);
  v27[2] = v6;
  v27[3] = 2 * ((uint64_t)(v28 - 32) / 32);
  return (uint64_t)v27;
}

uint64_t (*sub_24615437C())()
{
  return nullsub_1;
}

uint64_t sub_24615438C(uint64_t a1)
{
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_2461543B4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t isUniquelyReferenced_nonNull;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  isUniquelyReferenced_nonNull = swift_isUniquelyReferenced_nonNull();
  if (!(_DWORD)isUniquelyReferenced_nonNull)
    return 0;
  v6 = v1[2];
  v5 = v1[3];
  v7 = (v5 >> 1) - v6;
  if (__OFSUB__(v5 >> 1, v6))
  {
    __break(1u);
    goto LABEL_18;
  }
  v8 = v1[1];
  if ((v5 & 1) == 0)
    goto LABEL_8;
  sub_246155F80();
  swift_unknownObjectRetain();
  v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    v9 = MEMORY[0x24BEE4AF8];
  }
  v10 = *(_QWORD *)(v9 + 16);
  if (v8 + 32 * v6 + 32 * v7 != v9 + 32 * v10 + 32)
  {
    swift_release();
LABEL_8:
    v11 = v7;
    goto LABEL_10;
  }
  v12 = *(_QWORD *)(v9 + 24);
  result = swift_release();
  v14 = (v12 >> 1) - v10;
  v15 = __OFADD__(v7, v14);
  v11 = v7 + v14;
  if (!v15)
  {
LABEL_10:
    if (v11 < a1)
      return 0;
    sub_246155F80();
    swift_unknownObjectRetain();
    a1 = swift_dynamicCastClass();
    if (!a1)
    {
      swift_unknownObjectRelease();
      a1 = MEMORY[0x24BEE4AF8];
    }
    v16 = (v8 + 32 * v6 - a1 - 32) / 32;
    isUniquelyReferenced_nonNull = v7 + v16;
    if (!__OFADD__(v7, v16))
    {
      v4 = *(_QWORD *)(a1 + 16);
      if (isUniquelyReferenced_nonNull >= v4)
        return a1;
LABEL_19:
      sub_24615451C(isUniquelyReferenced_nonNull, v4, 0);
      return a1;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_24615451C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a2 - result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
    goto LABEL_10;
  }
  v7 = *v3;
  v8 = v7 + 32 + 32 * result;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25754D890);
  result = swift_arrayDestroy();
  v9 = __OFSUB__(a3, v4);
  v10 = a3 - v4;
  if (v9)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (!v10)
    goto LABEL_7;
  v11 = *(_QWORD *)(v7 + 16);
  if (__OFSUB__(v11, a2))
    goto LABEL_11;
  result = (uint64_t)sub_2461505A8((char *)(v7 + 32 + 32 * a2), v11 - a2, (char *)(v8 + 32 * a3));
  v12 = *(_QWORD *)(v7 + 16);
  v9 = __OFADD__(v12, v10);
  v13 = v12 + v10;
  if (v9)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  *(_QWORD *)(v7 + 16) = v13;
LABEL_7:
  if (a3 > 0)
LABEL_13:
    __break(1u);
  return result;
}

uint64_t sub_2461545CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441C8D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246154614(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_246145DB0(a1, a2);
  return a1;
}

uint64_t sub_246154628(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_24615468C(__int128 *a1, uint64_t a2)
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

uint64_t sub_2461546A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_134(*(_QWORD *)(v3 - 8));
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for DefaultSiriAutoCompleteService.UniqueIdentifiers(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DefaultSiriAutoCompleteService.UniqueIdentifiers()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DefaultSiriAutoCompleteService.UniqueIdentifiers(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DefaultSiriAutoCompleteService.UniqueIdentifiers(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
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

uint64_t assignWithTake for DefaultSiriAutoCompleteService.UniqueIdentifiers(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for DefaultSiriAutoCompleteService.UniqueIdentifiers(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 33))
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

uint64_t storeEnumTagSinglePayload for DefaultSiriAutoCompleteService.UniqueIdentifiers(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
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
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DefaultSiriAutoCompleteService.UniqueIdentifiers()
{
  return &type metadata for DefaultSiriAutoCompleteService.UniqueIdentifiers;
}

unint64_t sub_2461548E0()
{
  unint64_t result;

  result = qword_25754D8C0;
  if (!qword_25754D8C0)
  {
    result = MEMORY[0x249551438](&unk_246156E34, &type metadata for DefaultSiriAutoCompleteService.UniqueIdentifiers);
    atomic_store(result, (unint64_t *)&qword_25754D8C0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_5_0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_9_1(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  return sub_246150AC0(a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a2, a3);
}

BOOL OUTLINED_FUNCTION_11_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return sub_246155C14();
}

uint64_t OUTLINED_FUNCTION_13_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_16_1@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v2;
  a1[1] = a2;
  return v3;
}

uint64_t OUTLINED_FUNCTION_17_1(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_246155BFC();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return sub_246155D88();
}

void OUTLINED_FUNCTION_20_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_21()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return sub_246155D4C();
}

uint64_t OUTLINED_FUNCTION_28(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return swift_task_switch();
}

BOOL OUTLINED_FUNCTION_31_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

BOOL OUTLINED_FUNCTION_32_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  return swift_release_n();
}

void OUTLINED_FUNCTION_42_0()
{
  JUMPOUT(0x2495513CCLL);
}

void OUTLINED_FUNCTION_43_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_45_0@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  *v1 = a1;
  return sub_246155A10();
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_49()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_50()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_52()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_54()
{
  return sub_246155EB4();
}

uint64_t OUTLINED_FUNCTION_55()
{
  return sub_246155D88();
}

uint64_t OUTLINED_FUNCTION_56(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 104))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_57()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_58()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_59(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = v1;
  *(_QWORD *)(v2 - 112) = a1;
  return sub_246155D88();
}

uint64_t OUTLINED_FUNCTION_62()
{
  return sub_246155D88();
}

uint64_t OUTLINED_FUNCTION_63()
{
  uint64_t v0;
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
  return sub_246155AF4();
}

uint64_t OUTLINED_FUNCTION_64()
{
  return sub_246155B30();
}

uint64_t OUTLINED_FUNCTION_65()
{
  return sub_246155D88();
}

uint64_t OUTLINED_FUNCTION_66()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[33] + 8))(v0[34], v0[32]);
}

BOOL OUTLINED_FUNCTION_67(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_69(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  return sub_246155D88();
}

uint64_t OUTLINED_FUNCTION_71(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 104))(v1, v2, a1);
}

void OUTLINED_FUNCTION_72()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

void OUTLINED_FUNCTION_73()
{
  JUMPOUT(0x2495513CCLL);
}

uint64_t OUTLINED_FUNCTION_74()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_79()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_81(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_82()
{
  return sub_246155B48();
}

uint64_t OUTLINED_FUNCTION_84()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_85()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 128) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_86()
{
  return sub_246155D88();
}

uint64_t OUTLINED_FUNCTION_88(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 0, 1, a1);
}

uint64_t OUTLINED_FUNCTION_91()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_93()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_94()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_96()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_97()
{
  return sub_246155B24();
}

uint64_t OUTLINED_FUNCTION_98()
{
  return sub_246155B00();
}

uint64_t OUTLINED_FUNCTION_99()
{
  return sub_246155B54();
}

uint64_t OUTLINED_FUNCTION_100()
{
  return sub_246155B3C();
}

void OUTLINED_FUNCTION_101(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x20u);
}

uint64_t OUTLINED_FUNCTION_106(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_246150AC0(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_108()
{
  return sub_246155BFC();
}

uint64_t OUTLINED_FUNCTION_109()
{
  uint64_t v0;

  return sub_246148DBC(1, v0 + 16);
}

void OUTLINED_FUNCTION_110(float a1)
{
  float *v1;

  *v1 = a1;
}

BOOL OUTLINED_FUNCTION_112(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_113()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_114()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_116()
{
  uint64_t v0;

  **(_QWORD **)(v0 + 80) = 0;
}

uint64_t OUTLINED_FUNCTION_117()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_119()
{
  return sub_246155C2C();
}

uint64_t OUTLINED_FUNCTION_120()
{
  return sub_246155C2C();
}

uint64_t OUTLINED_FUNCTION_121()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_123()
{
  return sub_246155D88();
}

uint64_t OUTLINED_FUNCTION_124()
{
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t OUTLINED_FUNCTION_125()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_126()
{
  return sub_246155D88();
}

uint64_t OUTLINED_FUNCTION_127()
{
  return sub_246155A1C();
}

uint64_t OUTLINED_FUNCTION_128(uint64_t a1)
{
  return sub_24614715C(a1);
}

uint64_t OUTLINED_FUNCTION_130()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_131()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_132()
{
  void *v0;

  return v0;
}

void OUTLINED_FUNCTION_133()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_134@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_135(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t OUTLINED_FUNCTION_136(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_246150AC0(a1, a2, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_137()
{
  return swift_initStackObject();
}

uint64_t OUTLINED_FUNCTION_138@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

_QWORD *OUTLINED_FUNCTION_139@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *result = v2;
  result[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_140()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_143()
{
  uint64_t v0;
  uint64_t v1;

  return sub_24613F2B8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_144()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_145(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;

  return v2(v3, a2, v4);
}

uint64_t OUTLINED_FUNCTION_146()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_147(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_148()
{
  return sub_246155DA0();
}

void OUTLINED_FUNCTION_149()
{
  JUMPOUT(0x2495513CCLL);
}

BOOL OUTLINED_FUNCTION_150@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

BOOL OUTLINED_FUNCTION_151@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_152()
{
  uint64_t v0;

  return v0;
}

__n128 *OUTLINED_FUNCTION_153(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_154()
{
  return swift_allocObject();
}

BOOL OUTLINED_FUNCTION_155()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 168) == 0;
}

uint64_t OUTLINED_FUNCTION_156@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 104))(v1);
}

uint64_t OUTLINED_FUNCTION_158()
{
  return sub_246155E9C();
}

uint64_t OUTLINED_FUNCTION_160@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

id OUTLINED_FUNCTION_161()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_162()
{
  return sub_246155D58();
}

uint64_t OUTLINED_FUNCTION_164()
{
  return sub_246156004();
}

uint64_t OUTLINED_FUNCTION_165()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_166@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_167()
{
  unint64_t v0;

  return sub_246147FC8(v0);
}

uint64_t OUTLINED_FUNCTION_168()
{
  unint64_t v0;
  uint64_t v1;

  return sub_246154614(v1, v0);
}

uint64_t OUTLINED_FUNCTION_169()
{
  return type metadata accessor for VectorSearchAssets.Builder();
}

void OUTLINED_FUNCTION_170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD, uint64_t, _QWORD *, uint64_t), void (*a7)(uint64_t, uint64_t, _QWORD *))
{
  sub_24614F808(0, a2, 0, a4, a5, a6, a7);
}

uint64_t OUTLINED_FUNCTION_171()
{
  return sub_246155D58();
}

uint64_t OUTLINED_FUNCTION_173()
{
  return 0x657361726870;
}

void SiriAutoCompleteFeatureFlags.domain.getter()
{
  OUTLINED_FUNCTION_0_2();
}

uint64_t SiriAutoCompleteFeatureFlags.feature.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_2461551D4 + 4 * byte_246156EA0[*v0]))("searchIndex", 11);
}

void sub_2461551D4()
{
  OUTLINED_FUNCTION_0_2();
}

BOOL static SiriAutoCompleteFeatureFlags.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SiriAutoCompleteFeatureFlags.hash(into:)()
{
  return sub_246155FF8();
}

void SiriAutoCompleteFeatureFlags.hashValue.getter()
{
  OUTLINED_FUNCTION_5_1();
  sub_246155FF8();
  sub_246156010();
  OUTLINED_FUNCTION_7_1();
}

const char *sub_2461552A0()
{
  return "TypeToSiriAutoComplete";
}

uint64_t sub_2461552B4()
{
  return SiriAutoCompleteFeatureFlags.feature.getter();
}

void SiriUIFeatureFlags.domain.getter()
{
  OUTLINED_FUNCTION_0_2();
}

void SiriUIFeatureFlags.feature.getter()
{
  OUTLINED_FUNCTION_0_2();
}

uint64_t static SiriUIFeatureFlags.== infix(_:_:)()
{
  return 1;
}

uint64_t SiriUIFeatureFlags.hash(into:)()
{
  return sub_246155FF8();
}

void SiriUIFeatureFlags.hashValue.getter()
{
  OUTLINED_FUNCTION_5_1();
  sub_246155FF8();
  sub_246156010();
  OUTLINED_FUNCTION_7_1();
}

void sub_246155348()
{
  SiriUIFeatureFlags.hashValue.getter();
}

uint64_t sub_24615535C()
{
  return SiriUIFeatureFlags.hash(into:)();
}

const char *sub_246155370()
{
  return "SiriUI";
}

const char *sub_246155384()
{
  return "sae";
}

Swift::Bool __swiftcall DefaultSiriAutoCompleteFeatureFlagsProvider.isIndexBuildEnabled()()
{
  Swift::Bool result;

  sub_2461554D4();
  return result;
}

Swift::Bool __swiftcall DefaultSiriAutoCompleteFeatureFlagsProvider.isSAEUIEnabled()()
{
  uint64_t v0;
  Swift::Bool result;

  if (AFDeviceSupportsSystemAssistantExperience())
  {
    OUTLINED_FUNCTION_6_2();
    v0 = OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_0_5(v0);
  }
  OUTLINED_FUNCTION_3_1();
  return result;
}

unint64_t sub_2461553E4()
{
  unint64_t result;

  result = qword_25754D8C8;
  if (!qword_25754D8C8)
  {
    result = MEMORY[0x249551438](&protocol conformance descriptor for SiriUIFeatureFlags, &type metadata for SiriUIFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_25754D8C8);
  }
  return result;
}

unint64_t sub_246155420()
{
  unint64_t result;

  result = qword_25441CCB0;
  if (!qword_25441CCB0)
  {
    result = MEMORY[0x249551438](&protocol conformance descriptor for SiriAutoCompleteFeatureFlags, &type metadata for SiriAutoCompleteFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_25441CCB0);
  }
  return result;
}

Swift::Bool __swiftcall DefaultSiriAutoCompleteFeatureFlagsProvider.isIndexBuildEnabledBypassGMAvailability()()
{
  uint64_t v0;
  Swift::Bool result;

  if (AFDeviceSupportsSAEByDeviceCapabilityAndFeatureFlags() && AFLocaleSupportsSAE())
  {
    sub_246155420();
    v0 = OUTLINED_FUNCTION_2_4();
    OUTLINED_FUNCTION_0_5(v0);
  }
  OUTLINED_FUNCTION_3_1();
  return result;
}

Swift::Bool __swiftcall DefaultSiriAutoCompleteFeatureFlagsProvider.deviceAndLocaleSupportsSAE()()
{
  int v0;

  v0 = AFDeviceSupportsSAEByDeviceCapabilityAndFeatureFlags();
  if (v0)
    LOBYTE(v0) = AFLocaleSupportsSAE();
  return v0;
}

Swift::Bool __swiftcall DefaultSiriAutoCompleteFeatureFlagsProvider.isFTSQueryEnabled()()
{
  Swift::Bool result;

  sub_2461554D4();
  return result;
}

void sub_2461554D4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  if (AFDeviceSupportsSystemAssistantExperience())
  {
    OUTLINED_FUNCTION_6_2();
    v0 = OUTLINED_FUNCTION_2_4();
    v1 = v0;
    OUTLINED_FUNCTION_1_5(v0);
    if ((v1 & 1) != 0)
    {
      sub_246155420();
      v2 = OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_0_5(v2);
    }
  }
  OUTLINED_FUNCTION_3_1();
}

Swift::Bool __swiftcall DefaultSiriAutoCompleteFeatureFlagsProvider.areAppIntentSourcesEnabled()()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;

  if (AFDeviceSupportsSystemAssistantExperience()
    && (OUTLINED_FUNCTION_6_2(), v1 = OUTLINED_FUNCTION_2_4(), OUTLINED_FUNCTION_0_5(v1), (v0 & 1) != 0))
  {
    sub_246155420();
    v2 = OUTLINED_FUNCTION_2_4();
    v3 = v2;
    OUTLINED_FUNCTION_1_5(v2);
    v4 = 0;
    if ((v3 & 1) != 0)
    {
      v5 = OUTLINED_FUNCTION_2_4();
      v4 = v5;
      OUTLINED_FUNCTION_1_5(v5);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

unint64_t sub_2461555E8()
{
  unint64_t result;

  result = qword_25754D8D0;
  if (!qword_25754D8D0)
  {
    result = MEMORY[0x249551438](&protocol conformance descriptor for SiriAutoCompleteFeatureFlags, &type metadata for SiriAutoCompleteFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_25754D8D0);
  }
  return result;
}

unint64_t sub_246155628()
{
  unint64_t result;

  result = qword_25754D8D8;
  if (!qword_25754D8D8)
  {
    result = MEMORY[0x249551438](&protocol conformance descriptor for SiriUIFeatureFlags, &type metadata for SiriUIFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_25754D8D8);
  }
  return result;
}

BOOL sub_246155664()
{
  return DefaultSiriAutoCompleteFeatureFlagsProvider.isIndexBuildEnabled()();
}

BOOL sub_24615567C()
{
  return DefaultSiriAutoCompleteFeatureFlagsProvider.isIndexBuildEnabledBypassGMAvailability()();
}

BOOL sub_246155694()
{
  return DefaultSiriAutoCompleteFeatureFlagsProvider.isFTSQueryEnabled()();
}

BOOL sub_2461556AC()
{
  return DefaultSiriAutoCompleteFeatureFlagsProvider.areAppIntentSourcesEnabled()();
}

uint64_t dispatch thunk of SiriAutoCompleteFeatureFlagsProvider.isIndexBuildEnabled()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SiriAutoCompleteFeatureFlagsProvider.isIndexBuildEnabledBypassGMAvailability()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SiriAutoCompleteFeatureFlagsProvider.isFTSQueryEnabled()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SiriAutoCompleteFeatureFlagsProvider.areAppIntentSourcesEnabled()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t getEnumTagSinglePayload for SiriAutoCompleteFeatureFlags(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFB)
  {
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
    v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v5 = v6 - 6;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriAutoCompleteFeatureFlags(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2461557B8 + 4 * byte_246156EAB[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_2461557EC + 4 * byte_246156EA6[v4]))();
}

uint64_t sub_2461557EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2461557F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2461557FCLL);
  return result;
}

uint64_t sub_246155808(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246155810);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_246155814(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24615581C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for SiriAutoCompleteFeatureFlags()
{
  OUTLINED_FUNCTION_1_2();
}

uint64_t storeEnumTagSinglePayload for SiriUIFeatureFlags(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_246155874 + 4 * byte_246156EB0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_246155894 + 4 * byte_246156EB5[v4]))();
}

_BYTE *sub_246155874(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_246155894(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24615589C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2461558A4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2461558AC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2461558B4(_DWORD *result)
{
  *result = 0;
  return result;
}

void type metadata accessor for SiriUIFeatureFlags()
{
  OUTLINED_FUNCTION_1_2();
}

void type metadata accessor for DefaultSiriAutoCompleteFeatureFlagsProvider()
{
  OUTLINED_FUNCTION_1_2();
}

uint64_t OUTLINED_FUNCTION_0_5(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_1_5(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return sub_246155A58();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_246155FEC();
}

unint64_t OUTLINED_FUNCTION_6_2()
{
  return sub_2461553E4();
}

uint64_t sub_246155920()
{
  return MEMORY[0x24BDCB6A0]();
}

uint64_t sub_24615592C()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_246155938()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_246155944()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_246155950()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_24615595C()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_246155968()
{
  return MEMORY[0x24BDCCA58]();
}

uint64_t sub_246155974()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_246155980()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_24615598C()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_246155998()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2461559A4()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_2461559B0()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_2461559BC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2461559C8()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_2461559D4()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2461559E0()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_2461559EC()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2461559F8()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_246155A04()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_246155A10()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_246155A1C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_246155A28()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_246155A34()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_246155A40()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_246155A4C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_246155A58()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_246155A64()
{
  return MEMORY[0x24BEBFC60]();
}

uint64_t sub_246155A70()
{
  return MEMORY[0x24BEBFC78]();
}

uint64_t sub_246155A7C()
{
  return MEMORY[0x24BEBFC88]();
}

uint64_t sub_246155A88()
{
  return MEMORY[0x24BEBFC90]();
}

uint64_t sub_246155A94()
{
  return MEMORY[0x24BEBFCA0]();
}

uint64_t sub_246155AA0()
{
  return MEMORY[0x24BEBFCC0]();
}

uint64_t sub_246155AAC()
{
  return MEMORY[0x24BEBFCC8]();
}

uint64_t sub_246155AB8()
{
  return MEMORY[0x24BEBFCD8]();
}

uint64_t sub_246155AC4()
{
  return MEMORY[0x24BEBFCE0]();
}

uint64_t sub_246155AD0()
{
  return MEMORY[0x24BEBFCE8]();
}

uint64_t sub_246155ADC()
{
  return MEMORY[0x24BEBFD00]();
}

uint64_t sub_246155AE8()
{
  return MEMORY[0x24BEBFD38]();
}

uint64_t sub_246155AF4()
{
  return MEMORY[0x24BEBFD48]();
}

uint64_t sub_246155B00()
{
  return MEMORY[0x24BEBFD50]();
}

uint64_t sub_246155B0C()
{
  return MEMORY[0x24BEBFD70]();
}

uint64_t sub_246155B18()
{
  return MEMORY[0x24BEBFDC0]();
}

uint64_t sub_246155B24()
{
  return MEMORY[0x24BEBFDE0]();
}

uint64_t sub_246155B30()
{
  return MEMORY[0x24BEBFDF0]();
}

uint64_t sub_246155B3C()
{
  return MEMORY[0x24BEBFE00]();
}

uint64_t sub_246155B48()
{
  return MEMORY[0x24BEBFE38]();
}

uint64_t sub_246155B54()
{
  return MEMORY[0x24BEBFE58]();
}

uint64_t sub_246155B60()
{
  return MEMORY[0x24BEBFE80]();
}

uint64_t sub_246155B6C()
{
  return MEMORY[0x24BEBFE90]();
}

uint64_t sub_246155B78()
{
  return MEMORY[0x24BEBFEA0]();
}

uint64_t sub_246155B84()
{
  return MEMORY[0x24BEA7438]();
}

uint64_t sub_246155B90()
{
  return MEMORY[0x24BEA7440]();
}

uint64_t sub_246155B9C()
{
  return MEMORY[0x24BEA7530]();
}

uint64_t sub_246155BA8()
{
  return MEMORY[0x24BEA7538]();
}

uint64_t sub_246155BB4()
{
  return MEMORY[0x24BEA7540]();
}

uint64_t sub_246155BC0()
{
  return MEMORY[0x24BEA75C8]();
}

uint64_t sub_246155BCC()
{
  return MEMORY[0x24BEA75F0]();
}

uint64_t sub_246155BD8()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t sub_246155BE4()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_246155BF0()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_246155BFC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_246155C08()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_246155C14()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_246155C20()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_246155C2C()
{
  return MEMORY[0x24BEE06E0]();
}

uint64_t sub_246155C38()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_246155C44()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_246155C50()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_246155C5C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_246155C68()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_246155C74()
{
  return MEMORY[0x24BEE0BB8]();
}

uint64_t sub_246155C80()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_246155C8C()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_246155C98()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_246155CA4()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_246155CB0()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_246155CBC()
{
  return MEMORY[0x24BEE1040]();
}

uint64_t sub_246155CC8()
{
  return MEMORY[0x24BEE10C0]();
}

uint64_t sub_246155CD4()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_246155CE0()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_246155CEC()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_246155CF8()
{
  return MEMORY[0x24BEBFEB0]();
}

uint64_t sub_246155D04()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_246155D10()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_246155D1C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_246155D28()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_246155D34()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_246155D40()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_246155D4C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_246155D58()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_246155D64()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_246155D70()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_246155D7C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_246155D88()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_246155D94()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_246155DA0()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_246155DAC()
{
  return MEMORY[0x24BDD0530]();
}

uint64_t sub_246155DB8()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_246155DC4()
{
  return MEMORY[0x24BEE2238]();
}

uint64_t sub_246155DD0()
{
  return MEMORY[0x24BEE22B8]();
}

uint64_t sub_246155DDC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_246155DE8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_246155DF4()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_246155E00()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_246155E0C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_246155E18()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_246155E24()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_246155E30()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_246155E3C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_246155E48()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_246155E54()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_246155E60()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_246155E6C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_246155E78()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_246155E84()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_246155E90()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_246155E9C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_246155EA8()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_246155EB4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_246155EC0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_246155ECC()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_246155ED8()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_246155EE4()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_246155EF0()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_246155EFC()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_246155F08()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_246155F14()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_246155F20()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_246155F2C()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_246155F38()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_246155F44()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_246155F50()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_246155F5C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_246155F68()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_246155F74()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_246155F80()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_246155F8C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_246155F98()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_246155FA4()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_246155FB0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_246155FBC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_246155FC8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_246155FD4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_246155FE0()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_246155FEC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_246155FF8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_246156004()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_246156010()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24615601C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_246156028()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_246156034()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_246156040()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AFDeviceSupportsSAEByDeviceCapabilityAndFeatureFlags()
{
  return MEMORY[0x24BE08CB0]();
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return MEMORY[0x24BE08CC8]();
}

uint64_t AFLocaleSupportsSAE()
{
  return MEMORY[0x24BE08DF8]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x24BEE4E88]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

