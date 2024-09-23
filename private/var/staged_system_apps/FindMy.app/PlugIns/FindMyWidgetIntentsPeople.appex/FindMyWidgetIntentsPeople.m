uint64_t variable initialization expression of FriendSelectorIntentResponse.code()
{
  return 0;
}

void sub_100004F94(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

__n128 sub_100004FA0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100004FB0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100004FD0(uint64_t result, int a2, int a3)
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
  sub_100005020(a1, &qword_100021AF0, (uint64_t)&unk_10001CF38);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_100005020(a1, &qword_100021AF8, (uint64_t)&unk_10001CFB8);
}

void sub_100005020(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

unint64_t sub_100005070(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  Swift::String v13;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  swift_bridgeObjectRetain(a2);
  v4 = sub_1000111C8(9uLL, a1, a2);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  swift_bridgeObjectRelease(a2);
  v19 = 7876668;
  v20 = 0xE300000000000000;
  v15 = v4;
  v16 = v6;
  v17 = v8;
  v18 = v10;
  v11 = sub_100005140();
  String.append<A>(contentsOf:)(&v15, &type metadata for Substring, v11);
  swift_bridgeObjectRelease(v10);
  v12 = v20;
  v15 = v19;
  v16 = v20;
  swift_bridgeObjectRetain(v20);
  v13._countAndFlagsBits = 15971;
  v13._object = (void *)0xE200000000000000;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v12);
  return v15;
}

unint64_t sub_100005140()
{
  unint64_t result;

  result = qword_100021C80;
  if (!qword_100021C80)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Substring, &type metadata for Substring);
    atomic_store(result, (unint64_t *)&qword_100021C80);
  }
  return result;
}

void *sub_100005184(uint64_t a1, void *a2, void *a3, char a4)
{
  void *v4;
  id v5;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v4 = a2;
  if ((a4 & 1) == 0)
    goto LABEL_2;
  if (!a2)
  {
    v12 = a3;
    return a3;
  }
  if (a3)
  {
    v7 = a2;
    v8 = a3;
    v9 = objc_msgSend(v7, "imageAsset");
    if (v9)
    {
      v10 = v9;
      v11 = objc_msgSend((id)objc_opt_self(UITraitCollection), "traitCollectionWithUserInterfaceStyle:", 2);
      objc_msgSend(v10, "registerImage:withTraitCollection:", v8, v11);

    }
  }
  else
  {
LABEL_2:
    v5 = a2;
  }
  return v4;
}

void *sub_10000525C(void *a1, void *a2, char a3)
{
  void *v3;
  id v4;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v3 = a1;
  if ((a3 & 1) == 0)
    goto LABEL_2;
  if (!a1)
  {
    v12 = a2;
    return a2;
  }
  if (a2)
  {
    v6 = a1;
    v7 = a2;
    v8 = v6;
    v9 = objc_msgSend(v8, "imageAsset");
    if (v9)
    {
      v10 = v9;
      v11 = objc_msgSend((id)objc_opt_self(UITraitCollection), "traitCollectionWithUserInterfaceStyle:", 2);
      objc_msgSend(v10, "registerImage:withTraitCollection:", v7, v11);

    }
  }
  else
  {
LABEL_2:
    v4 = a1;
  }
  return v3;
}

id sub_100005338(void *a1, void *a2, char a3)
{
  id v3;
  id v5;

  if ((a3 & 1) != 0)
  {
    v5 = a1;
    v3 = a2;
    a1 = v5;
  }
  return a1;
}

void destroy for ColorSchemeImageSet(uint64_t a1)
{
  sub_100005370(*(void **)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_100005370(void *a1, void *a2, char a3)
{

  if ((a3 & 1) != 0)
}

uint64_t _s25FindMyWidgetIntentsPeople19ColorSchemeImageSetOwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100005338(*(void **)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ColorSchemeImageSet(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100005338(*(void **)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_100005370(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for ColorSchemeImageSet(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ColorSchemeImageSet(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_100005370(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorSchemeImageSet(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ColorSchemeImageSet(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_100005534(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_100005540(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ColorSchemeImageSet()
{
  return &type metadata for ColorSchemeImageSet;
}

uint64_t sub_10000555C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for UserDefaultsManager()
{
  return objc_opt_self(_TtC25FindMyWidgetIntentsPeople19UserDefaultsManager);
}

uint64_t sub_10000558C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
    return String.subscript.getter(15, a1, a2);
  else
    return 0;
}

uint64_t sub_1000055CC(uint64_t a1)
{
  uint64_t result;
  int v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  result = sub_100009440(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
    return 0;
  v5 = sub_1000094E0(result, v3, 0, a1);
  swift_bridgeObjectRetain(v6);
  return v5;
}

void sub_100005648()
{
  qword_100021D20 = 0x403F000000000000;
}

uint64_t sub_100005658(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_100005694 + 4 * byte_100018E20[a1]))(0x696669746E656469, 0xEA00000000007265);
}

uint64_t sub_100005694()
{
  return 1701667182;
}

uint64_t sub_1000056A4()
{
  return 0x656C646E6168;
}

uint64_t sub_1000056B8()
{
  return 0x686563616C507369;
}

uint64_t sub_1000056DC()
{
  return 0x64656E6769537369;
}

uint64_t sub_1000056F8()
{
  return 0x4C7974706D457369;
}

uint64_t sub_100005718()
{
  return 0x6576726553736168;
}

uint64_t sub_10000573C()
{
  return 0x64656D6954736168;
}

uint64_t sub_100005760()
{
  return 0x7461636F4C736168;
}

unint64_t sub_100005780()
{
  return 0xD000000000000010;
}

uint64_t sub_100005944(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = sub_100005658(*a1);
  v5 = v4;
  v6 = sub_100005658(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

Swift::Int sub_1000059CC()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v1 = *v0;
  Hasher.init(_seed:)(v6, 0);
  v2 = sub_100005658(v1);
  v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_100005A2C(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_100005658(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100005A6C(uint64_t a1)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  v3 = sub_100005658(v2);
  v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t sub_100005AC8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_100009538(*a1, a1[1]);
  *a2 = result;
  return result;
}

uint64_t sub_100005AF4@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_100005658(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100005B1C()
{
  unsigned __int8 *v0;

  return sub_100005658(*v0);
}

uint64_t sub_100005B24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100009538(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100005B48()
{
  return 0;
}

void sub_100005B54(_BYTE *a1@<X8>)
{
  *a1 = 25;
}

uint64_t sub_100005B60(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000B450();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100005B88(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000B450();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100005BB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, unsigned int a6@<W5>, void *a7@<X6>, void *a8@<X7>, unint64_t a9@<X8>, unsigned __int8 a10, double a11, char a12, uint64_t a13)
{
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
  char *v58;
  uint64_t v59;
  char *v60;
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
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  int *v76;
  _QWORD *v77;
  uint64_t v78;
  unint64_t *v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t result;
  uint64_t (*v91)(char *, uint64_t);
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void (*v105)(char *, uint64_t);
  uint64_t v106;
  uint64_t v107;
  unsigned __int8 v108;
  uint64_t v109;
  uint64_t v110;
  char v111;
  uint64_t v112;
  int v113;
  uint64_t v114;
  uint64_t v115;
  int *v116;
  char *v117;
  int v118;
  int v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  unint64_t v130;
  unint64_t v131;
  _QWORD *v132;
  uint64_t v133;
  char v134;
  int v135;
  void *v136;
  id v137;
  unint64_t v138;
  uint64_t v139;
  unint64_t v140;
  uint64_t v141;
  char v142;
  char v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  _QWORD *v147;
  char v148;
  _QWORD *v149;
  uint64_t v150;
  void (*v151)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v152;
  id v153;
  char *v154;
  void (*v155)(char *, char *, uint64_t);
  uint64_t v156;
  uint64_t v157;
  void *v158;
  Swift::String v159;
  uint64_t v160;
  Swift::String v161;
  uint64_t *v162;
  uint64_t v163;
  void *v164;
  id v165;
  Swift::String v166;
  Swift::String v167;
  Swift::String v168;
  uint64_t *v169;
  _QWORD *v170;
  uint64_t v171;
  uint64_t v172;
  char v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  _QWORD *v177;
  unint64_t v178;
  unint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  _QWORD *v183;
  unint64_t v184;
  unint64_t v185;
  unint64_t v186;
  unint64_t v187;
  void *v188;
  void *v189;
  char v190;
  unsigned __int8 v191;
  unint64_t v192;
  uint64_t KeyPath;
  uint64_t *v195;
  uint64_t v196;
  uint64_t v197;
  id v198;
  id v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  unint64_t v203;
  id v204;
  uint64_t v205;
  uint64_t v206;
  char v207;
  unint64_t v208;
  uint64_t v209;
  unint64_t v210;
  uint64_t v211;
  unint64_t v212;
  unint64_t v213;
  unint64_t v214;
  uint64_t v215;
  uint64_t v216;
  unint64_t v217;
  uint64_t v218;
  unint64_t v219;
  unint64_t v220;
  Swift::String v221;
  unint64_t v222;
  unint64_t v223;
  unint64_t *v224;
  unint64_t v225;
  uint64_t v226;
  uint64_t v227;
  Swift::String v228;
  Swift::String v229;
  Swift::String v230;
  id v231;
  Swift::String v232;
  Swift::String v233;
  Swift::String v234;
  uint64_t v235;
  uint64_t v236;
  int v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  char *v244;
  uint64_t v245;
  void *v246;
  void *v247;
  uint64_t v248;
  int v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  unint64_t v272;
  unint64_t v273;
  uint64_t v274;
  uint64_t *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  unint64_t v279;
  unint64_t v280;
  Swift::String v281;
  Swift::String v282;
  Swift::String v283;
  uint64_t countAndFlagsBits;
  void *object;
  _QWORD *v286;
  unint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t *v295;
  id v296;
  Swift::String v297;
  Swift::String v298;
  Swift::String v299;
  uint64_t v300;
  char v301;
  uint64_t v302;
  void *v303;
  void *v304;
  void *v305;
  uint64_t *v306;
  Swift::String v307;
  uint64_t v308;
  Swift::String v309;
  uint64_t *v310;
  _QWORD *v311;
  id v312;
  id v313;
  Swift::String v314;
  Swift::String v315;
  Swift::String v316;
  uint64_t v317;
  uint64_t v318;
  unint64_t v319;
  void *v320;
  void *v321;
  unint64_t v322;
  unint64_t v323;
  uint64_t v324;
  uint64_t v325;
  int v326;
  uint64_t v327;
  char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  int v333;
  char *v334;
  char *v335;
  char *v336;
  char *v337;
  char *v338;
  char *v339;
  char *v340;
  char *v341;
  char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  void *v346;
  uint64_t (*v347)(uint64_t, uint64_t, uint64_t);
  uint64_t v348;
  char *v349;
  uint64_t v350;
  uint64_t v351;
  void (*v352)(uint64_t, uint64_t);
  uint64_t v353;
  void *v354;
  void *v355;
  unint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  unint64_t *v360;
  uint64_t v361;
  uint64_t *v362;
  uint64_t v363;
  uint64_t v364;
  char *v365;
  char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  int *v370;
  uint64_t v371;
  uint64_t v372;
  unint64_t v373;
  _BOOL4 v374;
  uint64_t v375;
  id v376;
  int v377;
  uint64_t v378;
  unsigned int v379;
  uint64_t v380;
  unint64_t v381;
  unint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  unint64_t v386;
  Swift::String v387;
  Swift::String v388;
  Swift::String v389;
  Swift::String v390;
  Swift::String v391;
  Swift::String v392;

  v355 = a8;
  v354 = a7;
  v333 = a5;
  LODWORD(v380) = a4;
  v359 = a3;
  v351 = a2;
  v361 = type metadata accessor for ContactsUtilities(0);
  v16 = __chkstk_darwin(v361);
  v362 = (uint64_t *)((char *)&v324 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v16);
  v363 = (uint64_t)&v324 - v18;
  v19 = sub_1000097D8(&qword_100021D28);
  __chkstk_darwin(v19);
  v334 = (char *)&v324 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1000097D8(&qword_100021D30);
  v22 = __chkstk_darwin(v21);
  v336 = (char *)&v324 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __chkstk_darwin(v22);
  v332 = (uint64_t)&v324 - v25;
  v26 = __chkstk_darwin(v24);
  v344 = (uint64_t)&v324 - v27;
  v28 = __chkstk_darwin(v26);
  v325 = (uint64_t)&v324 - v29;
  v30 = __chkstk_darwin(v28);
  v327 = (uint64_t)&v324 - v31;
  v32 = __chkstk_darwin(v30);
  v328 = (char *)&v324 - v33;
  v34 = __chkstk_darwin(v32);
  v335 = (char *)&v324 - v35;
  v36 = __chkstk_darwin(v34);
  v329 = (uint64_t)&v324 - v37;
  v38 = __chkstk_darwin(v36);
  v331 = (uint64_t)&v324 - v39;
  v40 = __chkstk_darwin(v38);
  v330 = (uint64_t)&v324 - v41;
  v42 = __chkstk_darwin(v40);
  v343 = (uint64_t)&v324 - v43;
  v44 = __chkstk_darwin(v42);
  v342 = (char *)&v324 - v45;
  __chkstk_darwin(v44);
  v350 = (uint64_t)&v324 - v46;
  v367 = type metadata accessor for Date(0);
  v372 = *(_QWORD *)(v367 - 8);
  v47 = __chkstk_darwin(v367);
  v338 = (char *)&v324 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v47);
  v365 = (char *)&v324 - v49;
  v50 = sub_1000097D8(&qword_100021D38);
  v51 = __chkstk_darwin(v50);
  v349 = (char *)&v324 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __chkstk_darwin(v51);
  v339 = (char *)&v324 - v54;
  __chkstk_darwin(v53);
  v348 = (uint64_t)&v324 - v55;
  v357 = type metadata accessor for FMFRelationshipType(0);
  v358 = *(_QWORD *)(v357 - 8);
  v56 = __chkstk_darwin(v357);
  v58 = (char *)&v324 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v56);
  v60 = (char *)&v324 - v59;
  v61 = sub_1000097D8(&qword_100021D40);
  v62 = __chkstk_darwin(v61);
  v341 = (char *)&v324 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __chkstk_darwin(v62);
  v340 = (char *)&v324 - v65;
  v66 = __chkstk_darwin(v64);
  v337 = (char *)&v324 - v67;
  __chkstk_darwin(v66);
  v366 = (char *)&v324 - v68;
  v69 = type metadata accessor for FMFFriend(0);
  v70 = *(_QWORD *)(v69 - 8);
  __chkstk_darwin(v69);
  v72 = (char *)&v324 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_1000097D8(&qword_100021D48);
  __chkstk_darwin(v73);
  v75 = (char *)&v324 - ((v74 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = (int *)type metadata accessor for FriendModel(0);
  *(_BYTE *)(a9 + v76[27]) = 0;
  v77 = (_QWORD *)(a9 + v76[28]);
  *v77 = 0;
  v77[1] = 0;
  v77[2] = 1;
  *(_OWORD *)(a9 + v76[29]) = xmmword_100019160;
  v370 = v76;
  v78 = v76[30];
  v356 = a9;
  v79 = (unint64_t *)(a9 + v78);
  v374 = a6 != 2;
  LODWORD(v378) = a6 == 2;
  v379 = a6;
  v80 = (a6 >> 8) & 1;
  LODWORD(v364) = v80;
  if (a6 == 2)
    v80 = 0;
  v377 = v80;
  v375 = a13;
  LODWORD(v346) = a13 != 0;
  *v79 = 0;
  v79[1] = 0;
  v360 = v79;
  FMFFriend.contact.getter();
  v81 = type metadata accessor for FMFContact(0);
  v82 = *(_QWORD *)(v81 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v82 + 48))(v75, 1, v81) == 1)
  {
    sub_100009A04((uint64_t)v75, &qword_100021D48);
    v83 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v70 + 16))(v72, a1, v69);
    v84 = a1;
  }
  else
  {
    v369 = FMFContact.displayName.getter();
    v86 = v85;
    (*(void (**)(char *, uint64_t))(v82 + 8))(v75, v81);
    v83 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v70 + 16))(v72, a1, v69);
    v84 = a1;
    v368 = v86;
    if (v86)
      goto LABEL_7;
  }
  v87 = FMFFriend.contactHandles.getter(v83);
  v369 = sub_1000055CC(v87);
  v89 = v88;
  result = swift_bridgeObjectRelease(v87);
  v368 = v89;
  if (!v89)
  {
LABEL_151:
    __break(1u);
    return result;
  }
LABEL_7:
  v91 = *(uint64_t (**)(char *, uint64_t))(v70 + 8);
  v353 = v69;
  v92 = v91(v72, v69);
  v93 = FMFFriend.contactHandles.getter(v92);
  v371 = sub_1000055CC(v93);
  v95 = v94;
  result = swift_bridgeObjectRelease(v93);
  v373 = v95;
  if (!v95)
  {
    __break(1u);
    goto LABEL_151;
  }
  v96 = v380;
  LODWORD(v378) = v378 | v379;
  v97 = (uint64_t)v366;
  FMFFriend.location.getter(result);
  v98 = type metadata accessor for FMFLocation(0);
  v99 = *(_QWORD *)(v98 - 8);
  v347 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v99 + 48);
  v100 = v347(v97, 1, v98);
  v380 = v84;
  v352 = (void (*)(uint64_t, uint64_t))v91;
  v345 = v99;
  if (v100 == 1)
  {
    v101 = sub_100009A04(v97, &qword_100021D40);
    v376 = 0;
  }
  else
  {
    v376 = (id)FMFLocation.location.getter();
    v101 = (*(uint64_t (**)(uint64_t, uint64_t))(v99 + 8))(v97, v98);
  }
  LODWORD(v366) = a10;
  v102 = FMFFriend.relationshipType.getter(v101);
  static FMFRelationshipType.willShareLocationWithMe.getter(v102);
  v103 = sub_10000B764(&qword_100021D50, (uint64_t (*)(uint64_t))&type metadata accessor for FMFRelationshipType, (uint64_t)&protocol conformance descriptor for FMFRelationshipType);
  v104 = v357;
  v326 = dispatch thunk of SetAlgebra.isSuperset(of:)(v58, v357, v103);
  v105 = *(void (**)(char *, uint64_t))(v358 + 8);
  v105(v58, v104);
  v106 = ((uint64_t (*)(char *, uint64_t))v105)(v60, v104);
  v107 = FMFFriend.relationshipType.getter(v106);
  static FMFRelationshipType.sharesLocationWithMe.getter(v107);
  v108 = dispatch thunk of SetAlgebra.isSuperset(of:)(v58, v104, v103);
  v105(v58, v104);
  v109 = ((uint64_t (*)(char *, uint64_t))v105)(v60, v104);
  v110 = FMFFriend.relationshipType.getter(v109);
  static FMFRelationshipType.followsMyLocation.getter(v110);
  v111 = dispatch thunk of SetAlgebra.isSuperset(of:)(v58, v104, v103);
  v105(v58, v104);
  v112 = ((uint64_t (*)(char *, uint64_t))v105)(v60, v104);
  if (v96 == 2)
  {
    v113 = v364;
    if ((v379 & 1) == 0)
      v113 = 1;
    v114 = v375;
    v116 = v370;
    v115 = v371;
    v117 = v365;
    if ((v374 & v113 & 1) != 0)
      goto LABEL_25;
    v118 = 0;
    if (v375)
      goto LABEL_25;
LABEL_21:
    if (!v376)
      goto LABEL_25;
    if ((v108 & 1) == 0)
    {
      v120 = v356;
      *(_BYTE *)(v356 + 53) = 0;
      if ((v111 & 1) != 0)
      {
        v132 = (_QWORD *)(v120 + v116[14]);
        *v132 = 0;
        v132[1] = 0;
        *(_BYTE *)(v120 + v116[15]) = 0;
        v133 = v367;
        (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v372 + 56))(v120 + v116[13], 1, 1, v367);
        v134 = v333;
        v135 = v333;
        v136 = (void *)objc_opt_self(NSBundle);
        v137 = objc_msgSend(v136, "mainBundle");
        if (v135 == 2 || (v134 & 1) != 0)
        {
          v388._object = (void *)0xE000000000000000;
          v228._object = (void *)0x80000001000182E0;
          v228._countAndFlagsBits = 0xD000000000000012;
          v229._countAndFlagsBits = 0;
          v229._object = (void *)0xE000000000000000;
          v388._countAndFlagsBits = 0;
          v230 = NSLocalizedString(_:tableName:bundle:value:comment:)(v228, (Swift::String_optional)0, (NSBundle)v137, v229, v388);

          *(Swift::String *)(v120 + v116[16]) = v230;
          v138 = v373;
          if ((v326 & 1) != 0)
          {
            v231 = objc_msgSend(v136, "mainBundle");
            v232._countAndFlagsBits = 0xD000000000000020;
            v389._object = (void *)0xE000000000000000;
            v232._object = (void *)0x8000000100018320;
            v233._countAndFlagsBits = 0;
            v233._object = (void *)0xE000000000000000;
            v389._countAndFlagsBits = 0;
            v234 = NSLocalizedString(_:tableName:bundle:value:comment:)(v232, (Swift::String_optional)0, (NSBundle)v231, v233, v389);

            *(Swift::String *)(v120 + v116[17]) = v234;
          }
          else
          {
            v286 = (_QWORD *)(v120 + v116[17]);
            *v286 = 0;
            v286[1] = 0;
          }
          v127 = v355;
          v128 = v354;
          v115 = v371;
          v114 = v375;
          *(_BYTE *)(v120 + v116[22]) = 0;
          *(_BYTE *)(v120 + v116[23]) = 0;
          v133 = v367;
        }
        else
        {
          v127 = v355;
          v128 = v354;
          v138 = v373;
          if ((v378 & 1) != 0)
          {
            v115 = v371;
            v323 = 0xE000000000000000;
            if ((v377 & 1) != 0)
            {
              v139 = 0x656E616C70726941;
              v140 = 0xEE006E4F65646F4DLL;
            }
            else
            {
              v139 = 0x697461636F4C6F4ELL;
              v140 = 0xEF646E756F466E6FLL;
            }
            v307._countAndFlagsBits = 0;
            v307._object = (void *)0xE000000000000000;
            v308 = 0;
            v309 = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v139, (Swift::String_optional)0, (NSBundle)v137, v307, *(Swift::String *)(&v323 - 1));
            countAndFlagsBits = v309._countAndFlagsBits;
            object = v309._object;
          }
          else
          {
            v390._object = (void *)0xE000000000000000;
            v281._countAndFlagsBits = 0x4C746F4E72657355;
            v281._object = (void *)0xEF6E49646567676FLL;
            v282._countAndFlagsBits = 0;
            v282._object = (void *)0xE000000000000000;
            v390._countAndFlagsBits = 0;
            v283 = NSLocalizedString(_:tableName:bundle:value:comment:)(v281, (Swift::String_optional)0, (NSBundle)v137, v282, v390);
            countAndFlagsBits = v283._countAndFlagsBits;
            object = v283._object;
            v115 = v371;
          }

          v310 = (uint64_t *)(v120 + v116[16]);
          *v310 = countAndFlagsBits;
          v310[1] = (uint64_t)object;
          v311 = (_QWORD *)(v120 + v116[17]);
          *v311 = 0;
          v311[1] = 0;
          *(_BYTE *)(v120 + v116[22]) = 1;
          *(_BYTE *)(v120 + v116[23]) = 0;
          v114 = v375;
        }
        goto LABEL_58;
      }
      v157 = sub_100009588(v378 & 1, v377, 0, 0, 0, 0);
      v127 = v355;
      v128 = v354;
      if (v158)
      {
        v125 = v157;
        v126 = v158;
        goto LABEL_45;
      }
      goto LABEL_43;
    }
    LODWORD(v357) = v118;
    v120 = v356;
    *(_BYTE *)(v356 + 53) = 1;
    v121 = (uint64_t)v337;
    FMFFriend.location.getter(v112);
    if (v347(v121, 1, v98) == 1)
    {
      sub_100009A04(v121, &qword_100021D40);
      v122 = v348;
    }
    else
    {
      v141 = FMFLocation.motionActivityState.getter();
      v143 = v142;
      (*(void (**)(uint64_t, uint64_t))(v345 + 8))(v121, v98);
      v122 = v348;
      if ((v143 & 1) == 0 && (unint64_t)(v141 - 3) <= 2)
      {
        v144 = 8 * (v141 - 3);
        v145 = *(_QWORD *)&aFigureRbicycle[v144];
        v146 = *(_QWORD *)&aCarFillun[v144 + 8];
        v147 = (_QWORD *)(v120 + v116[14]);
        *v147 = v145;
        v147[1] = v146;
        v148 = 1;
        goto LABEL_39;
      }
    }
    v148 = 0;
    v149 = (_QWORD *)(v120 + v116[14]);
    *v149 = 0;
    v149[1] = 0;
LABEL_39:
    *(_BYTE *)(v120 + v116[15]) = v148;
    v150 = v372;
    v151 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v372 + 56);
    v152 = v367;
    v151(v122, 1, 1, v367);
    v153 = objc_msgSend(v376, "timestamp");
    v154 = v338;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    v155 = *(void (**)(char *, char *, uint64_t))(v150 + 32);
    v156 = (uint64_t)v339;
    v155(v339, v154, v152);
    v151(v156, 0, 1, v152);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v150 + 48))(v156, 1, v152) == 1)
    {
      sub_100009A04(v156, &qword_100021D38);
    }
    else
    {
      v226 = ((uint64_t (*)(char *, uint64_t, uint64_t))v155)(v117, v156, v152);
      if (fabs(Date.timeIntervalSinceNow.getter(v226)) < 7200.0)
      {
        v227 = v348;
        sub_100009A04(v348, &qword_100021D38);
        v155((char *)v227, v117, v152);
        v151(v227, 0, 1, v152);
        v138 = v373;
        goto LABEL_76;
      }
      (*(void (**)(char *, uint64_t))(v372 + 8))(v117, v152);
    }
    v138 = v373;
    v227 = v348;
LABEL_76:
    v235 = sub_10000997C(v227, v120 + v116[13], &qword_100021D38);
    v236 = (uint64_t)v340;
    FMFFriend.location.getter(v235);
    v237 = v347(v236, 1, v98);
    v115 = v371;
    v238 = v350;
    v239 = (uint64_t)v342;
    if (v237 == 1)
    {
      sub_100009A04(v236, &qword_100021D40);
      v240 = type metadata accessor for FMFAddress(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v240 - 8) + 56))(v238, 1, 1, v240);
    }
    else
    {
      FMFLocation.address.getter();
      (*(void (**)(uint64_t, uint64_t))(v345 + 8))(v236, v98);
    }
    v241 = v238;
    sub_10000997C(v238, v239, &qword_100021D30);
    v242 = type metadata accessor for FMFAddress(0);
    v243 = *(_QWORD *)(v242 - 8);
    v244 = *(char **)(v243 + 48);
    v378 = v242;
    v365 = v244;
    if (((unsigned int (*)(uint64_t, uint64_t))v244)(v239, 1) == 1)
    {
      v245 = sub_100009A04(v239, &qword_100021D30);
      v364 = 0;
      v246 = 0;
    }
    else
    {
      v364 = FMFAddress.locality.getter();
      v246 = v247;
      v245 = (*(uint64_t (**)(uint64_t, uint64_t))(v243 + 8))(v239, v378);
    }
    v248 = (uint64_t)v341;
    FMFFriend.location.getter(v245);
    v249 = v347(v248, 1, v98);
    v358 = v243;
    if (v249 == 1)
    {
      v250 = v243;
      sub_100009A04(v248, &qword_100021D40);
      v251 = (uint64_t)v336;
    }
    else
    {
      v252 = v246;
      v253 = v248;
      v254 = (uint64_t)v334;
      FMFLocation.label.getter();
      v255 = v98;
      v256 = v254;
      (*(void (**)(uint64_t, uint64_t))(v345 + 8))(v253, v255);
      v257 = type metadata accessor for FMFLabel(0);
      v258 = *(_QWORD *)(v257 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v258 + 48))(v254, 1, v257) != 1)
      {
        v267 = FMFLabel.localizedValue.getter();
        v269 = v268;
        (*(void (**)(uint64_t, uint64_t))(v258 + 8))(v256, v257);
        v241 = v350;
        v270 = v343;
        sub_10000997C(v350, v343, &qword_100021D30);
        v115 = v371;
        v251 = (uint64_t)v336;
        v246 = v252;
        v259 = v270;
        v250 = v358;
        if (v269)
        {
          sub_100009A04(v259, &qword_100021D30);
          v263 = v250;
          goto LABEL_99;
        }
LABEL_87:
        v346 = v246;
        if ((v357 & 1) != 0)
        {
          sub_100009A04(v259, &qword_100021D30);
          v260 = v331;
          sub_10000997C(v241, v331, &qword_100021D30);
          if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v365)(v260, 1, v378) == 1)
          {
            sub_100009A04(v260, &qword_100021D30);
            v261 = v329;
            sub_10000997C(v241, v329, &qword_100021D30);
            v262 = (uint64_t)v335;
            v263 = v250;
            v264 = v261;
LABEL_95:
            sub_10000997C(v264, v262, &qword_100021D30);
            if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v365)(v262, 1, v378) == 1)
            {
              sub_100009A04(v264, &qword_100021D30);
              sub_100009A04(v262, &qword_100021D30);
LABEL_124:
              v291 = v344;
              sub_10000997C(v241, v344, &qword_100021D30);
              v292 = v291;
              v293 = v332;
              sub_10000997C(v292, v332, &qword_100021D30);
              if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v365)(v293, 1, v378) == 1)
              {
                sub_100009A04(v293, &qword_100021D30);
LABEL_129:
                v296 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
                v391._object = (void *)0xE000000000000000;
                v297._countAndFlagsBits = 0x7365726464416F4ELL;
                v297._object = (void *)0xEE00646E756F4673;
                v298._countAndFlagsBits = 0;
                v298._object = (void *)0xE000000000000000;
                v391._countAndFlagsBits = 0;
                v299 = NSLocalizedString(_:tableName:bundle:value:comment:)(v297, (Swift::String_optional)0, (NSBundle)v296, v298, v391);

                sub_100009A04(v344, &qword_100021D30);
                swift_bridgeObjectRelease(0);
                *(Swift::String *)(v120 + v370[16]) = v299;
                v241 = v350;
                v246 = v346;
                goto LABEL_130;
              }
              v271 = FMFAddress.landmark.getter();
              v290 = v294;
              (*(void (**)(uint64_t, uint64_t))(v263 + 8))(v293, v378);
              if (!v290)
                goto LABEL_129;
              v273 = 0;
              v289 = v344;
LABEL_128:
              swift_bridgeObjectRetain(v273);
              sub_100009A04(v289, &qword_100021D30);
              v295 = (uint64_t *)(v120 + v370[16]);
              *v295 = v271;
              v295[1] = v290;
              swift_bridgeObjectRelease(v273);
              v241 = v350;
              v246 = v346;
              v263 = v358;
              goto LABEL_130;
            }
            v277 = FMFAddress.streetAddress.getter();
            v278 = (uint64_t)v335;
            v271 = v277;
            v273 = v279;
LABEL_117:
            sub_100009A04(v264, &qword_100021D30);
            (*(void (**)(uint64_t, uint64_t))(v263 + 8))(v278, v378);
            if (!v273)
              goto LABEL_124;
            goto LABEL_118;
          }
          v271 = FMFAddress.streetName.getter();
          v273 = v272;
          v263 = v250;
          (*(void (**)(uint64_t, uint64_t))(v250 + 8))(v260, v378);
          v264 = v329;
          sub_10000997C(v241, v329, &qword_100021D30);
          v262 = (uint64_t)v335;
          if (!v273)
            goto LABEL_95;
LABEL_110:
          sub_100009A04(v264, &qword_100021D30);
LABEL_118:
          v288 = HIBYTE(v273) & 0xF;
          if ((v273 & 0x2000000000000000) == 0)
            v288 = v271 & 0xFFFFFFFFFFFFLL;
          v289 = v344;
          if (v288)
          {
            sub_10000997C(v241, v344, &qword_100021D30);
            v290 = v273;
            goto LABEL_128;
          }
          swift_bridgeObjectRelease(v273);
          goto LABEL_123;
        }
        v265 = v330;
        sub_10000997C(v259, v330, &qword_100021D30);
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v365)(v265, 1, v378) == 1)
        {
          sub_100009A04(v259, &qword_100021D30);
          sub_100009A04(v265, &qword_100021D30);
          v266 = (uint64_t)v328;
          goto LABEL_105;
        }
        v267 = FMFAddress.landmark.getter();
        v269 = v274;
        sub_100009A04(v259, &qword_100021D30);
        (*(void (**)(uint64_t, uint64_t))(v250 + 8))(v265, v378);
        v266 = (uint64_t)v328;
        if (!v269)
        {
LABEL_105:
          sub_10000997C(v241, v266, &qword_100021D30);
          if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v365)(v266, 1, v378) == 1)
          {
            sub_100009A04(v266, &qword_100021D30);
            v276 = v327;
            sub_10000997C(v241, v327, &qword_100021D30);
          }
          else
          {
            v271 = FMFAddress.streetAddress.getter();
            v273 = v280;
            (*(void (**)(uint64_t, uint64_t))(v358 + 8))(v266, v378);
            v276 = v327;
            sub_10000997C(v241, v327, &qword_100021D30);
            if (v273)
            {
              v264 = v276;
              goto LABEL_110;
            }
          }
          v278 = v325;
          sub_10000997C(v276, v325, &qword_100021D30);
          if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v365)(v278, 1, v378) == 1)
          {
            sub_100009A04(v276, &qword_100021D30);
            sub_100009A04(v278, &qword_100021D30);
LABEL_123:
            v263 = v358;
            goto LABEL_124;
          }
          v271 = FMFAddress.streetName.getter();
          v273 = v287;
          v264 = v276;
          v263 = v358;
          goto LABEL_117;
        }
        v246 = v346;
        v263 = v358;
LABEL_99:
        if (v246
          && (v364 == v267 && v246 == (void *)v269
           || (_stringCompareWithSmolCheck(_:_:expecting:)(v364, v246, v267, v269, 0) & 1) != 0))
        {
          swift_bridgeObjectRelease(v269);
          v267 = 0;
          v269 = 0;
        }
        v275 = (uint64_t *)(v120 + v370[16]);
        *v275 = v267;
        v275[1] = v269;
LABEL_130:
        sub_10000997C(v241, v251, &qword_100021D30);
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v365)(v251, 1, v378) == 1)
        {
          sub_100009A04(v251, &qword_100021D30);
          v300 = v375;
          v301 = (char)v366;
          if (v246)
          {
            v127 = v355;
            v128 = v354;
            v116 = v370;
            v133 = v367;
LABEL_145:
            sub_100009A04(v350, &qword_100021D30);
            v171 = sub_100009A04(v348, &qword_100021D38);
            v306 = (uint64_t *)(v120 + v116[17]);
            *v306 = v364;
            v306[1] = (uint64_t)v246;
            *(_BYTE *)(v120 + v116[22]) = 0;
            *(_BYTE *)(v120 + v116[23]) = v301 == -1;
            v114 = v300;
            goto LABEL_58;
          }
          v304 = 0;
        }
        else
        {
          v302 = FMFAddress.country.getter();
          v304 = v303;
          (*(void (**)(uint64_t, uint64_t))(v263 + 8))(v251, v378);
          v300 = v375;
          if (v246)
          {
            v116 = v370;
            v133 = v367;
            if (v304)
            {
              if (v302 == v364 && v304 == v246
                || (_stringCompareWithSmolCheck(_:_:expecting:)(v302, v304, v364, v246, 0) & 1) != 0
                || (_DWORD)v357)
              {
                v305 = v304;
              }
              else
              {
                v312 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
                v346 = v246;
                v313 = v312;
                v392._object = (void *)0xEE007972746E756FLL;
                v314._countAndFlagsBits = 0x43646E4179746943;
                v314._object = (void *)0xEE007972746E756FLL;
                v315._countAndFlagsBits = 0;
                v315._object = (void *)0xE000000000000000;
                v392._countAndFlagsBits = 0x43646E4179746943;
                v316 = NSLocalizedString(_:tableName:bundle:value:comment:)(v314, (Swift::String_optional)0, (NSBundle)v313, v315, v392);

                v317 = sub_1000097D8((uint64_t *)&unk_100022060);
                v318 = swift_allocObject(v317, 112, 7);
                *(_OWORD *)(v318 + 16) = xmmword_100019170;
                *(_QWORD *)(v318 + 56) = &type metadata for String;
                v319 = sub_1000099C0();
                v320 = v346;
                *(_QWORD *)(v318 + 32) = v364;
                *(_QWORD *)(v318 + 40) = v320;
                *(_QWORD *)(v318 + 96) = &type metadata for String;
                *(_QWORD *)(v318 + 104) = v319;
                v115 = v371;
                *(_QWORD *)(v318 + 64) = v319;
                *(_QWORD *)(v318 + 72) = v302;
                *(_QWORD *)(v318 + 80) = v304;
                v133 = v367;
                v364 = String.init(format:_:)(v316._countAndFlagsBits, v316._object, v318);
                v246 = v321;
                v305 = v316._object;
              }
              swift_bridgeObjectRelease(v305);
            }
            v127 = v355;
            v128 = v354;
            goto LABEL_144;
          }
        }
        v127 = v355;
        v128 = v354;
        v116 = v370;
        v133 = v367;
        swift_bridgeObjectRelease(v304);
LABEL_144:
        v301 = (char)v366;
        goto LABEL_145;
      }
      sub_100009A04(v254, &qword_100021D28);
      v115 = v371;
      v241 = v350;
      v251 = (uint64_t)v336;
      v246 = v252;
      v250 = v358;
    }
    v259 = v343;
    sub_10000997C(v241, v343, &qword_100021D30);
    goto LABEL_87;
  }
  v119 = v364;
  if ((v379 & 1) == 0)
    v119 = 1;
  v114 = v375;
  v116 = v370;
  v115 = v371;
  v117 = v365;
  if ((v374 & v119 & 1) == 0)
  {
    v118 = v96 & 1;
    if (!v375)
      goto LABEL_21;
  }
LABEL_25:
  v120 = v356;
  *(_BYTE *)(v356 + 53) = 0;
  v123 = sub_100009588(v378 & 1, v377, v114 != 0, 0, 0, 0);
  if (v124)
  {
    v125 = v123;
    v126 = v124;
    v127 = v355;
    v128 = v354;
    goto LABEL_45;
  }
  v127 = v355;
  v128 = v354;
  if ((v108 & 1) == 0)
  {
LABEL_43:
    v129 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v322 = 0xE000000000000000;
    v131 = 0x80000001000182E0;
    v130 = 0xD000000000000012;
    goto LABEL_44;
  }
  v129 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v322 = 0xE000000000000000;
  v130 = 0x697461636F4C6F4ELL;
  v131 = 0xEF646E756F466E6FLL;
LABEL_44:
  v159._countAndFlagsBits = 0;
  v159._object = (void *)0xE000000000000000;
  v160 = 0;
  v161 = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v130, (Swift::String_optional)0, (NSBundle)v129, v159, *(Swift::String *)(&v322 - 1));
  v125 = v161._countAndFlagsBits;
  v126 = v161._object;

LABEL_45:
  v162 = (uint64_t *)(v120 + v116[16]);
  *v162 = v125;
  v162[1] = (uint64_t)v126;
  if ((v378 & 1) != 0)
  {
    v163 = 0;
    v164 = 0;
  }
  else
  {
    v165 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v166._countAndFlagsBits = 0xD000000000000013;
    v387._object = (void *)0xE000000000000000;
    v166._object = (void *)0x8000000100018300;
    v167._countAndFlagsBits = 0;
    v167._object = (void *)0xE000000000000000;
    v387._countAndFlagsBits = 0;
    v168 = NSLocalizedString(_:tableName:bundle:value:comment:)(v166, (Swift::String_optional)0, (NSBundle)v165, v167, v387);
    v163 = v168._countAndFlagsBits;
    v164 = v168._object;

  }
  v133 = v367;
  v169 = (uint64_t *)(v120 + v116[17]);
  *v169 = v163;
  v169[1] = (uint64_t)v164;
  v170 = (_QWORD *)(v120 + v116[14]);
  *v170 = 0;
  v170[1] = 0;
  *(_BYTE *)(v120 + v116[15]) = 0;
  v171 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v372 + 56))(v120 + v116[13], 1, 1, v133);
  v172 = v116[22];
  if (((v376 == 0) & v108) != 0)
  {
    *(_BYTE *)(v120 + v172) = 1;
    v173 = v378 ^ 1;
    if (((v378 ^ 1 | v377) & 1) != 0)
      goto LABEL_57;
LABEL_56:
    v173 = (char)v346;
    goto LABEL_57;
  }
  if ((v378 & 1) != 0)
  {
    if ((v377 & 1) == 0)
    {
      *(_BYTE *)(v120 + v172) = 0;
      if ((v108 & 1) == 0)
      {
        v173 = 1;
        goto LABEL_57;
      }
      goto LABEL_56;
    }
    v173 = v108 ^ 1;
    *(_BYTE *)(v120 + v172) = 1;
  }
  else
  {
    *(_BYTE *)(v120 + v172) = 0;
    v173 = 1;
  }
LABEL_57:
  *(_BYTE *)(v120 + v116[23]) = v173 & 1;
  v138 = v373;
LABEL_58:
  *(_QWORD *)v120 = FMFFriend.identifier.getter(v171);
  *(_QWORD *)(v120 + 8) = v174;
  v175 = v368;
  *(_QWORD *)(v120 + 16) = v369;
  *(_QWORD *)(v120 + 24) = v175;
  *(_QWORD *)(v120 + 32) = v115;
  *(_QWORD *)(v120 + 40) = v138;
  *(_BYTE *)(v120 + 48) = 0;
  *(_BYTE *)(v120 + 49) = v374 & v379;
  *(_BYTE *)(v120 + 50) = 0;
  *(_BYTE *)(v120 + 51) = v114 != 0;
  *(_BYTE *)(v120 + 52) = 0;
  v176 = v359;
  if (v359)
  {
    v177 = (_QWORD *)(v120 + v116[18]);
    *v177 = v351;
    v177[1] = v176;
    v178 = v120 + v116[19];
    *(_QWORD *)v178 = 0;
    *(_BYTE *)(v178 + 8) = 0;
    v179 = v120 + v116[20];
    *(_QWORD *)v179 = 0;
    *(_QWORD *)(v179 + 8) = 0;
    *(_BYTE *)(v179 + 16) = 0;
    swift_bridgeObjectRetain(v138);
  }
  else
  {
    v180 = swift_bridgeObjectRetain(v138);
    v181 = v133;
    v182 = (uint64_t)v349;
    FMFFriend.shareExpires.getter(v180);
    LODWORD(v181) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v372 + 48))(v182, 1, v181);
    sub_100009A04(v182, &qword_100021D38);
    v183 = (_QWORD *)(v120 + v116[18]);
    if ((_DWORD)v181 == 1)
    {
      *v183 = 0;
      v183[1] = 0;
      v184 = v120 + v116[19];
      *(_QWORD *)v184 = 0;
      *(_BYTE *)(v184 + 8) = 1;
      v185 = v120 + v116[20];
      *(_QWORD *)v185 = 0;
      *(_QWORD *)(v185 + 8) = 0;
      *(_BYTE *)(v185 + 16) = 1;
    }
    else
    {
      *(_OWORD *)v183 = xmmword_100019180;
      v186 = v120 + v116[19];
      *(_QWORD *)v186 = 16409600;
      *(_BYTE *)(v186 + 8) = 0;
      v187 = v120 + v116[20];
      *(_QWORD *)v187 = 0;
      *(_QWORD *)(v187 + 8) = 0;
      *(_BYTE *)(v187 + 16) = 0;
    }
  }
  if ((v377 & 1) != 0)
  {
    v188 = 0;
    v189 = 0;
    v190 = -1;
    v191 = v366;
  }
  else
  {
    v191 = v366;
    sub_100009854(v128, v127, v366);
    v188 = v128;
    v189 = v127;
    v190 = v191;
  }
  v192 = v120 + v116[21];
  *(_QWORD *)v192 = v188;
  *(_QWORD *)(v192 + 8) = v189;
  *(_BYTE *)(v192 + 16) = v190;
  if ((a12 & 1) != 0)
    a11 = 0.0;
  *(double *)(v120 + v116[24]) = a11;
  KeyPath = swift_getKeyPath(&unk_100018E48);
  v195 = v362;
  *v362 = KeyPath;
  v196 = sub_1000097D8(&qword_100022090);
  swift_storeEnumTagMultiPayload(v195, v196, 0);
  v197 = *(int *)(v361 + 20);
  v198 = objc_msgSend((id)objc_opt_self(CNAvatarImageRendererSettings), "defaultSettings");
  v199 = objc_msgSend(objc_allocWithZone((Class)CNAvatarImageRenderer), "initWithSettings:", v198);

  *(uint64_t *)((char *)v195 + v197) = (uint64_t)v199;
  v200 = (uint64_t)v195;
  v201 = v363;
  sub_100009890(v200, v363);
  v202 = v115;
  v203 = v373;
  v204 = sub_10000BF98(v202, v373);
  v206 = v205;
  LOBYTE(v197) = v207;
  swift_bridgeObjectRelease(v203);
  sub_10000B5DC(v201, type metadata accessor for ContactsUtilities);
  v208 = v120 + v116[25];
  *(_QWORD *)v208 = v204;
  *(_QWORD *)(v208 + 8) = v206;
  *(_BYTE *)(v208 + 16) = v197;
  *(_BYTE *)(v120 + v116[26]) = 0;
  v381 = v120;
  v209 = sub_1000097D8(&qword_100021D58);
  v210 = sub_1000098D4();
  v211 = _Pointer.debugDescription.getter(v209, v210);
  v213 = v212;
  v214 = sub_1000111C8(9uLL, v211, v212);
  v216 = v215;
  v385 = 7876668;
  v386 = 0xE300000000000000;
  v381 = v214;
  v382 = v217;
  v383 = v218;
  v384 = v215;
  v219 = sub_100005140();
  String.append<A>(contentsOf:)(&v381, &type metadata for Substring, v219);
  swift_bridgeObjectRelease(v216);
  v220 = v386;
  v381 = v385;
  v382 = v386;
  swift_bridgeObjectRetain(v386);
  v221._countAndFlagsBits = 15987;
  v221._object = (void *)0xE200000000000000;
  String.append(_:)(v221);
  swift_bridgeObjectRelease(v213);
  swift_bridgeObjectRelease(v220);
  swift_errorRelease(v375);
  sub_100009964(v128, v127, v191);

  v222 = v381;
  v223 = v382;
  v352(v380, v353);
  v224 = v360;
  v225 = v360[1];
  *v360 = v222;
  v224[1] = v223;
  return swift_bridgeObjectRelease(v225);
}

uint64_t sub_100007B9C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  __int128 v53;
  id v54;
  Class isa;
  id v56;
  __int128 v57;
  id v58;
  Class v59;
  id v60;
  char *v61;
  char v62;
  char v63;
  unint64_t v64;
  __int128 v65;
  id v66;
  Class v67;
  id v68;
  __int128 v69;
  id v70;
  Class v71;
  id v72;
  char *v73;
  id v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  Swift::String v89;
  __int128 v90;
  uint64_t v91;
  id v93;
  id v94;
  id v95;
  uint64_t v96;
  _QWORD *v97;
  char *v98;
  char *v99;
  uint64_t *v100;
  int *v101;
  uint64_t *v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  uint64_t v106;

  sub_1000097D8(&qword_100021D38);
  __chkstk_darwin();
  v6 = (char *)&v93 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000097D8(&qword_100021E78);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v93 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for FriendModel(0);
  v11 = (int *)__chkstk_darwin();
  v13 = (uint64_t *)((char *)&v93 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  *((_BYTE *)v13 + v11[27]) = 0;
  v14 = (uint64_t *)((char *)v13 + v11[28]);
  *v14 = 0;
  v14[1] = 0;
  v100 = v14;
  v14[2] = 1;
  v15 = (char *)v13 + v11[29];
  *(_OWORD *)v15 = xmmword_100019160;
  v101 = v11;
  v102 = v13;
  v16 = (char *)v13 + v11[30];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;
  v98 = v15;
  v99 = v16;
  v18 = a1[3];
  v17 = a1[4];
  v97 = a1;
  sub_10000B42C(a1, v18);
  v19 = sub_10000B450();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for FriendModel.CodingKeys, &type metadata for FriendModel.CodingKeys, v19, v18, v17);
  if (v2)
  {
    sub_10000B494(v97);
    v23 = v98;
    v24 = v99;
    sub_10000B4B4(*v100, v100[1], v100[2]);
    swift_bridgeObjectRelease(*((_QWORD *)v23 + 1));
    return swift_bridgeObjectRelease(*((_QWORD *)v24 + 1));
  }
  else
  {
    v20 = (uint64_t)v6;
    v96 = a2;
    LOBYTE(v104) = 0;
    v21 = KeyedDecodingContainer.decode(_:forKey:)(&v104, v7);
    v22 = v7;
    v25 = v102;
    *v102 = v21;
    v25[1] = v26;
    LOBYTE(v104) = 1;
    v25[2] = KeyedDecodingContainer.decode(_:forKey:)(&v104, v7);
    v25[3] = v27;
    LOBYTE(v104) = 2;
    v25[4] = KeyedDecodingContainer.decode(_:forKey:)(&v104, v7);
    v25[5] = v28;
    LOBYTE(v104) = 3;
    *((_BYTE *)v25 + 48) = KeyedDecodingContainer.decode(_:forKey:)(&v104, v7) & 1;
    LOBYTE(v104) = 4;
    *((_BYTE *)v25 + 49) = KeyedDecodingContainer.decode(_:forKey:)(&v104, v7) & 1;
    LOBYTE(v104) = 5;
    *((_BYTE *)v25 + 50) = KeyedDecodingContainer.decode(_:forKey:)(&v104, v7) & 1;
    LOBYTE(v104) = 6;
    *((_BYTE *)v25 + 51) = KeyedDecodingContainer.decode(_:forKey:)(&v104, v7) & 1;
    LOBYTE(v104) = 7;
    *((_BYTE *)v25 + 52) = KeyedDecodingContainer.decode(_:forKey:)(&v104, v7) & 1;
    LOBYTE(v104) = 8;
    *((_BYTE *)v25 + 53) = KeyedDecodingContainer.decode(_:forKey:)(&v104, v7) & 1;
    v29 = type metadata accessor for Date(0);
    LOBYTE(v104) = 9;
    v30 = sub_10000B764(&qword_100021E88, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
    v31 = v10;
    v32 = v7;
    v33 = v31;
    KeyedDecodingContainer.decode<A>(_:forKey:)(v29, &v104, v32, v29, v30);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v20, 0, 1, v29);
    sub_10000B4C8(v20, (uint64_t)v102 + v101[13]);
    LOBYTE(v104) = 10;
    v34 = KeyedDecodingContainer.decode(_:forKey:)(&v104, v22);
    v35 = (uint64_t *)((char *)v102 + v101[14]);
    *v35 = v34;
    v35[1] = v36;
    LOBYTE(v104) = 11;
    v37 = KeyedDecodingContainer.decode(_:forKey:)(&v104, v22);
    *((_BYTE *)v102 + v101[15]) = v37 & 1;
    LOBYTE(v104) = 12;
    v38 = KeyedDecodingContainer.decode(_:forKey:)(&v104, v22);
    v39 = (uint64_t *)((char *)v102 + v101[16]);
    *v39 = v38;
    v39[1] = v40;
    LOBYTE(v104) = 13;
    v41 = KeyedDecodingContainer.decode(_:forKey:)(&v104, v22);
    v42 = (uint64_t *)((char *)v102 + v101[17]);
    *v42 = v41;
    v42[1] = v43;
    LOBYTE(v104) = 14;
    v44 = KeyedDecodingContainer.decode(_:forKey:)(&v104, v22);
    v45 = (uint64_t *)((char *)v102 + v101[18]);
    *v45 = v44;
    v45[1] = v46;
    LOBYTE(v104) = 15;
    v47 = KeyedDecodingContainer.decode(_:forKey:)(&v104, v22);
    v48 = (char *)v102 + v101[19];
    *(_QWORD *)v48 = v47;
    v48[8] = 0;
    type metadata accessor for CGPoint(0);
    v50 = v49;
    LOBYTE(v103) = 16;
    v51 = sub_10000B764(&qword_100021E90, (uint64_t (*)(uint64_t))type metadata accessor for CGPoint, (uint64_t)&protocol conformance descriptor for CGPoint);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v50, &v103, v22, v50, v51);
    v52 = (char *)v102 + v101[20];
    *(_OWORD *)v52 = v104;
    v52[16] = 0;
    LOBYTE(v103) = 17;
    v95 = (id)sub_10000B510();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v103, v22, &type metadata for Data, v95);
    v53 = v104;
    v54 = objc_allocWithZone((Class)UIImage);
    isa = Data._bridgeToObjectiveC()().super.isa;
    v56 = objc_msgSend(v54, "initWithData:", isa);
    sub_100009E28(v53, *((unint64_t *)&v53 + 1));

    LOBYTE(v103) = 18;
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v103, v32, &type metadata for Data, v95);
    v57 = v104;
    v58 = objc_allocWithZone((Class)UIImage);
    v59 = Data._bridgeToObjectiveC()().super.isa;
    v60 = objc_msgSend(v58, "initWithData:", v59);
    sub_100009E28(v57, *((unint64_t *)&v57 + 1));

    v61 = (char *)v102 + v101[21];
    *(_QWORD *)v61 = v56;
    *((_QWORD *)v61 + 1) = v60;
    v61[16] = 1;
    LOBYTE(v104) = 19;
    v94 = v60;
    v93 = v56;
    v62 = KeyedDecodingContainer.decode(_:forKey:)(&v104, v32);
    *((_BYTE *)v102 + v101[22]) = v62 & 1;
    LOBYTE(v104) = 20;
    v63 = KeyedDecodingContainer.decode(_:forKey:)(&v104, v32);
    *((_BYTE *)v102 + v101[23]) = v63 & 1;
    LOBYTE(v103) = 21;
    v64 = sub_10000B554();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for CGFloat, &v103, v32, &type metadata for CGFloat, v64);
    *(uint64_t *)((char *)v102 + v101[24]) = v104;
    LOBYTE(v103) = 22;
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v103, v32, &type metadata for Data, v95);
    v65 = v104;
    v66 = objc_allocWithZone((Class)UIImage);
    v67 = Data._bridgeToObjectiveC()().super.isa;
    v68 = objc_msgSend(v66, "initWithData:", v67);
    sub_100009E28(v65, *((unint64_t *)&v65 + 1));

    LOBYTE(v103) = 23;
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v103, v32, &type metadata for Data, v95);
    v69 = v104;
    v70 = objc_allocWithZone((Class)UIImage);
    v71 = Data._bridgeToObjectiveC()().super.isa;
    v72 = objc_msgSend(v70, "initWithData:", v71);
    sub_100009E28(v69, *((unint64_t *)&v69 + 1));

    v73 = (char *)v102 + v101[25];
    *(_QWORD *)v73 = v68;
    *((_QWORD *)v73 + 1) = v72;
    v73[16] = 1;
    LOBYTE(v104) = 24;
    v95 = v72;
    v74 = v68;
    v75 = KeyedDecodingContainer.decode(_:forKey:)(&v104, v32);
    v76 = (uint64_t)v102;
    *((_BYTE *)v102 + v101[26]) = v75 & 1;
    *(_QWORD *)&v104 = v76;
    v77 = sub_1000097D8(&qword_100021D58);
    v78 = sub_1000098D4();
    v79 = _Pointer.debugDescription.getter(v77, v78);
    v81 = v80;
    v82 = sub_1000111C8(9uLL, v79, v80);
    v84 = v83;
    *(_QWORD *)&v103 = 7876668;
    *((_QWORD *)&v103 + 1) = 0xE300000000000000;
    *(_QWORD *)&v104 = v82;
    *((_QWORD *)&v104 + 1) = v85;
    v105 = v86;
    v106 = v83;
    v87 = sub_100005140();
    String.append<A>(contentsOf:)(&v104, &type metadata for Substring, v87);
    swift_bridgeObjectRelease(v84);
    v88 = *((_QWORD *)&v103 + 1);
    v104 = v103;
    swift_bridgeObjectRetain(*((_QWORD *)&v103 + 1));
    v89._countAndFlagsBits = 15987;
    v89._object = (void *)0xE200000000000000;
    String.append(_:)(v89);

    swift_bridgeObjectRelease(v81);
    swift_bridgeObjectRelease(v88);
    v90 = v104;

    (*(void (**)(char *, uint64_t))(v8 + 8))(v33, v32);
    v91 = *((_QWORD *)v99 + 1);
    *(_OWORD *)v99 = v90;
    swift_bridgeObjectRelease(v91);
    sub_10000B598(v76, v96);
    sub_10000B494(v97);
    return sub_10000B5DC(v76, type metadata accessor for FriendModel);
  }
}

uint64_t sub_1000088D8(_QWORD *a1)
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
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 *v45;
  char v46;
  uint64_t v47;
  unint64_t v48;
  int v49;
  void *v50;
  uint64_t v51;
  UIImage *v52;
  void (*v53)(char *, uint64_t);
  NSData *v54;
  NSData *v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  int v60;
  void *v61;
  UIImage *v62;
  NSData *v63;
  NSData *v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  int v73;
  void *v74;
  uint64_t v75;
  UIImage *v76;
  void (*v77)(char *, uint64_t);
  NSData *v78;
  NSData *v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  int v84;
  void *v85;
  void *v86;
  char *v87;
  UIImage *v88;
  NSData *v89;
  NSData *v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  void (*v97)(char *, _QWORD, uint64_t);
  void *v98;
  void *v99;
  uint64_t v100;
  int *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  __int128 v105;
  char v106;
  char v107;

  v2 = type metadata accessor for ColorScheme(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v97 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000097D8(&qword_100021EA8);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v97 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1[3];
  v11 = a1[4];
  sub_10000B42C(a1, v10);
  v12 = sub_10000B450();
  v13 = v10;
  v14 = v6;
  v15 = v104;
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for FriendModel.CodingKeys, &type metadata for FriendModel.CodingKeys, v12, v13, v11);
  v16 = *v15;
  v17 = v15[1];
  LOBYTE(v105) = 0;
  v18 = v103;
  KeyedEncodingContainer.encode(_:forKey:)(v16, v17, &v105, v14);
  if (v18)
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v14);
  v103 = v3;
  v19 = v7;
  v20 = v15[2];
  v21 = v15[3];
  LOBYTE(v105) = 1;
  KeyedEncodingContainer.encode(_:forKey:)(v20, v21, &v105, v14);
  v23 = v15[4];
  v24 = v15[5];
  LOBYTE(v105) = 2;
  KeyedEncodingContainer.encode(_:forKey:)(v23, v24, &v105, v14);
  v25 = v14;
  v26 = *((unsigned __int8 *)v15 + 48);
  LOBYTE(v105) = 3;
  KeyedEncodingContainer.encode(_:forKey:)(v26, &v105, v14);
  v27 = *((unsigned __int8 *)v15 + 49);
  LOBYTE(v105) = 4;
  KeyedEncodingContainer.encode(_:forKey:)(v27, &v105, v14);
  v28 = *((unsigned __int8 *)v15 + 50);
  LOBYTE(v105) = 5;
  KeyedEncodingContainer.encode(_:forKey:)(v28, &v105, v14);
  v29 = *((unsigned __int8 *)v15 + 51);
  LOBYTE(v105) = 6;
  KeyedEncodingContainer.encode(_:forKey:)(v29, &v105, v14);
  v30 = *((unsigned __int8 *)v15 + 52);
  LOBYTE(v105) = 7;
  KeyedEncodingContainer.encode(_:forKey:)(v30, &v105, v14);
  v31 = *((unsigned __int8 *)v15 + 53);
  LOBYTE(v105) = 8;
  KeyedEncodingContainer.encode(_:forKey:)(v31, &v105, v14);
  v32 = type metadata accessor for FriendModel(0);
  v33 = (uint64_t)v15 + *(int *)(v32 + 52);
  v101 = (int *)v32;
  v102 = v33;
  LOBYTE(v105) = 9;
  v34 = sub_1000097D8(&qword_100021D38);
  v35 = sub_10000B618();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v102, &v105, v14, v34, v35);
  v105 = *(_OWORD *)((char *)v15 + v101[14]);
  v107 = 10;
  v36 = sub_1000097D8(&qword_100021EC0);
  v37 = sub_10000B694(&qword_100021EC8, &qword_100021EC0);
  v102 = v25;
  v38 = v25;
  v39 = v9;
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v38, v36, v37);
  v40 = *((unsigned __int8 *)v104 + v101[15]);
  LOBYTE(v105) = 11;
  KeyedEncodingContainer.encode(_:forKey:)(v40, &v105, v102);
  v105 = *(_OWORD *)((char *)v104 + v101[16]);
  v107 = 12;
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v36, v37);
  v105 = *(_OWORD *)((char *)v104 + v101[17]);
  v107 = 13;
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v36, v37);
  v105 = *(_OWORD *)((char *)v104 + v101[18]);
  v107 = 14;
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v36, v37);
  v41 = (uint64_t *)((char *)v104 + v101[19]);
  v42 = *v41;
  LOBYTE(v41) = *((_BYTE *)v41 + 8);
  *(_QWORD *)&v105 = v42;
  BYTE8(v105) = (_BYTE)v41;
  v107 = 15;
  v43 = sub_1000097D8(&qword_100021ED0);
  v44 = sub_10000B694(&qword_100021ED8, &qword_100021ED0);
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v43, v44);
  v45 = (__int128 *)((char *)v104 + v101[20]);
  v46 = *((_BYTE *)v45 + 16);
  v105 = *v45;
  v106 = v46;
  v107 = 16;
  v47 = sub_1000097D8(&qword_100021EE0);
  v48 = sub_10000B6E8();
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v47, v48);
  v100 = (uint64_t)v104 + v101[21];
  v49 = *(unsigned __int8 *)(v100 + 16);
  if (v49 != 255)
  {
    v50 = *(void **)(v100 + 8);
    v98 = *(void **)v100;
    LODWORD(v99) = v49 & 1;
    v51 = v103;
    v97 = *(void (**)(char *, _QWORD, uint64_t))(v103 + 104);
    v97(v5, enum case for ColorScheme.light(_:), v2);
    v52 = (UIImage *)sub_100005184((uint64_t)v5, v98, v50, (char)v99);
    v53 = *(void (**)(char *, uint64_t))(v51 + 8);
    v53(v5, v2);
    if (v52)
    {
      v54 = UIImagePNGRepresentation(v52);
      if (v54)
      {
        v55 = v54;
        v99 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
        v57 = v56;

      }
      else
      {
        v99 = 0;
        v57 = 0xF000000000000000;
      }
      *(_QWORD *)&v105 = v99;
      *((_QWORD *)&v105 + 1) = v57;
      v107 = 17;
      v58 = sub_1000097D8(&qword_100021F00);
      v59 = sub_10000B7E8();
      KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v58, v59);
      sub_100009F1C((uint64_t)v99, v57);

    }
    v60 = *(unsigned __int8 *)(v100 + 16);
    if (v60 != 255)
    {
      v61 = *(void **)(v100 + 8);
      v99 = *(void **)v100;
      LODWORD(v100) = v60 & 1;
      v97(v5, enum case for ColorScheme.dark(_:), v2);
      v62 = (UIImage *)sub_100005184((uint64_t)v5, v99, v61, v100);
      v53(v5, v2);
      if (v62)
      {
        v63 = UIImagePNGRepresentation(v62);
        if (v63)
        {
          v64 = v63;
          v65 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v67 = v66;

        }
        else
        {
          v65 = 0;
          v67 = 0xF000000000000000;
        }
        *(_QWORD *)&v105 = v65;
        *((_QWORD *)&v105 + 1) = v67;
        v107 = 18;
        v68 = sub_1000097D8(&qword_100021F00);
        v69 = sub_10000B7E8();
        KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v68, v69);
        sub_100009F1C(v65, v67);

      }
    }
  }
  v70 = *((unsigned __int8 *)v104 + v101[22]);
  LOBYTE(v105) = 19;
  KeyedEncodingContainer.encode(_:forKey:)(v70, &v105, v102);
  v71 = *((unsigned __int8 *)v104 + v101[23]);
  LOBYTE(v105) = 20;
  KeyedEncodingContainer.encode(_:forKey:)(v71, &v105, v102);
  *(_QWORD *)&v105 = *(uint64_t *)((char *)v104 + v101[24]);
  v107 = 21;
  v72 = sub_10000B7A4();
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, &type metadata for CGFloat, v72);
  v100 = (uint64_t)v104 + v101[25];
  v73 = *(unsigned __int8 *)(v100 + 16);
  if (v73 != 255)
  {
    v74 = *(void **)(v100 + 8);
    v98 = *(void **)v100;
    LODWORD(v99) = v73 & 1;
    v75 = v103;
    v97 = *(void (**)(char *, _QWORD, uint64_t))(v103 + 104);
    v97(v5, enum case for ColorScheme.light(_:), v2);
    v76 = (UIImage *)sub_100005184((uint64_t)v5, v98, v74, (char)v99);
    v77 = *(void (**)(char *, uint64_t))(v75 + 8);
    v77(v5, v2);
    if (v76)
    {
      v78 = UIImagePNGRepresentation(v76);
      if (v78)
      {
        v79 = v78;
        v103 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        v81 = v80;

      }
      else
      {
        v103 = 0;
        v81 = 0xF000000000000000;
      }
      *(_QWORD *)&v105 = v103;
      *((_QWORD *)&v105 + 1) = v81;
      v107 = 22;
      v82 = sub_1000097D8(&qword_100021F00);
      v83 = sub_10000B7E8();
      KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v82, v83);
      sub_100009F1C(v103, v81);

    }
    v84 = *(unsigned __int8 *)(v100 + 16);
    if (v84 != 255)
    {
      v86 = *(void **)v100;
      v85 = *(void **)(v100 + 8);
      LODWORD(v103) = v84 & 1;
      v87 = v5;
      v97(v5, enum case for ColorScheme.dark(_:), v2);
      v88 = (UIImage *)sub_100005184((uint64_t)v5, v86, v85, v103);
      v77(v87, v2);
      if (v88)
      {
        v89 = UIImagePNGRepresentation(v88);
        if (v89)
        {
          v90 = v89;
          v91 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v93 = v92;

        }
        else
        {
          v91 = 0;
          v93 = 0xF000000000000000;
        }
        *(_QWORD *)&v105 = v91;
        *((_QWORD *)&v105 + 1) = v93;
        v107 = 23;
        v94 = sub_1000097D8(&qword_100021F00);
        v95 = sub_10000B7E8();
        KeyedEncodingContainer.encode<A>(_:forKey:)(&v105, &v107, v102, v94, v95);
        sub_100009F1C(v91, v93);

      }
    }
  }
  v96 = *((unsigned __int8 *)v104 + v101[26]);
  LOBYTE(v105) = 24;
  KeyedEncodingContainer.encode(_:forKey:)(v96, &v105, v102);
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v39, v102);
}

uint64_t sub_10000936C(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000939C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100007B9C(a1, a2);
}

uint64_t sub_1000093B0(_QWORD *a1)
{
  return sub_1000088D8(a1);
}

uint64_t sub_1000093C4(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for LayoutDirection(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.layoutDirection.setter(v3);
}

uint64_t sub_100009440(uint64_t a1)
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

uint64_t sub_1000094E0(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(_BYTE *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
    return *(_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * result);
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_100009538(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = _findStringSwitchCaseWithCache(cases:string:cache:)(&off_10001CB48, a1, a2, &unk_100021A80);
  swift_bridgeObjectRelease(a2);
  if (v3 >= 0x19)
    return 25;
  else
    return v3;
}

uint64_t sub_100009588(char a1, char a2, char a3, char a4, char a5, char a6)
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t countAndFlagsBits;
  unint64_t v13;

  if ((a1 & 1) != 0)
  {
    if ((a2 & 1) != 0)
    {
      v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v13 = 0xE000000000000000;
      v7 = 0x656E616C70726941;
      v8 = 0xEE006E4F65646F4DLL;
    }
    else if ((a3 & 1) != 0)
    {
      v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v13 = 0xE000000000000000;
      v7 = 0x6576726553796E41;
      v8 = 0xEE00726F72724572;
    }
    else if ((a4 & 1) != 0)
    {
      v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v13 = 0xE000000000000000;
      v7 = 0x74754F64656D6954;
      v8 = 0xED0000726F727245;
    }
    else if ((a5 & 1) != 0)
    {
      v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v13 = 0xE000000000000000;
      v7 = 0x65526E6F73726550;
      v8 = 0xED00006465766F6DLL;
    }
    else
    {
      if ((a6 & 1) == 0)
        return 0;
      v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v13 = 0xE000000000000000;
      v7 = 0x646E656972466F4ELL;
      v8 = 0xE900000000000073;
    }
  }
  else
  {
    v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v13 = 0xE000000000000000;
    v7 = 0x4C746F4E72657355;
    v8 = 0xEF6E49646567676FLL;
  }
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  v10 = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v7, (Swift::String_optional)0, (NSBundle)v6, v9, *(Swift::String *)(&v13 - 1))._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_1000097D8(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for FriendModel(uint64_t a1)
{
  uint64_t result;

  result = qword_100021DD0;
  if (!qword_100021DD0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FriendModel);
  return result;
}

id sub_100009854(id result, void *a2, unsigned __int8 a3)
{
  if (a3 != 255)
    return sub_100005338(result, a2, a3 & 1);
  return result;
}

uint64_t sub_10000986C()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_100009890(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ContactsUtilities(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000098D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021D60;
  if (!qword_100021D60)
  {
    v1 = sub_100009920(&qword_100021D58);
    result = swift_getWitnessTable(&protocol conformance descriptor for UnsafePointer<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100021D60);
  }
  return result;
}

uint64_t sub_100009920(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_100009964(void *a1, void *a2, unsigned __int8 a3)
{
  if (a3 != 255)
    sub_100005370(a1, a2, a3 & 1);
}

uint64_t sub_10000997C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000097D8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1000099C0()
{
  unint64_t result;

  result = qword_100021D68;
  if (!qword_100021D68)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100021D68);
  }
  return result;
}

uint64_t sub_100009A04(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000097D8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100009A40(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  UIImage *v24;
  NSData *v25;
  uint64_t v26;
  NSData *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  NSObject *v31;
  uint64_t result;
  id v33;
  UIImage *v34;
  _QWORD aBlock[5];
  void *v36;

  v6 = type metadata accessor for ContactsUtilities(0);
  v7 = __chkstk_darwin(v6);
  v9 = (id *)((char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v7);
  v11 = (char *)&v33 - v10;
  *v9 = swift_getKeyPath(&unk_100018E48);
  v12 = sub_1000097D8(&qword_100022090);
  swift_storeEnumTagMultiPayload(v9, v12, 0);
  v13 = *(int *)(v6 + 20);
  v14 = objc_msgSend((id)objc_opt_self(CNAvatarImageRendererSettings), "defaultSettings");
  v15 = objc_msgSend(objc_allocWithZone((Class)CNAvatarImageRenderer), "initWithSettings:", v14);

  *(_QWORD *)((char *)v9 + v13) = v15;
  sub_100009890((uint64_t)v9, (uint64_t)v11);
  v16 = sub_10000BF98(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v18 = v17;
  v20 = v19;
  LODWORD(v9) = ~v19;
  sub_10000B5DC((uint64_t)v11, type metadata accessor for ContactsUtilities);
  if (!(_DWORD)v9
    || (sub_100005338(v16, v18, v20 & 1), v21 = sub_10000525C(v16, v18, v20 & 1), sub_100009964(v16, v18, v20), !v21))
  {
    v28 = 0;
    v33 = 0;
    v34 = 0;
    goto LABEL_8;
  }
  v22 = qword_100021A60;
  v23 = v21;
  if (v22 != -1)
    goto LABEL_14;
  while (1)
  {
    v24 = (UIImage *)sub_10000EEA4(*(double *)&qword_100021D20);

    v33 = v21;
    if (v24)
    {
      v25 = UIImagePNGRepresentation(v24);
      v34 = v24;
      if (v25)
      {
        v27 = v25;
        v28 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v25, v26);
        v30 = v29;

        goto LABEL_9;
      }
      v28 = 0;
    }
    else
    {
      v28 = 0;
      v34 = 0;
    }
LABEL_8:
    v30 = 0xF000000000000000;
LABEL_9:
    sub_100009DB8();
    v31 = static OS_dispatch_queue.main.getter();
    v23 = (_QWORD *)swift_allocObject(&unk_10001D070, 48, 7);
    v23[2] = a2;
    v23[3] = a3;
    v23[4] = v28;
    v23[5] = v30;
    a3 = swift_allocObject(&unk_10001D098, 32, 7);
    *(_QWORD *)(a3 + 16) = sub_100009E6C;
    *(_QWORD *)(a3 + 24) = v23;
    aBlock[4] = sub_100009EA4;
    v36 = (void *)a3;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100011EF8;
    aBlock[3] = &unk_10001D0B0;
    a2 = _Block_copy(aBlock);
    v21 = v36;
    sub_100009EC4(v28, v30);
    swift_retain(a3);
    swift_release(v21);
    dispatch_sync(v31, a2);
    sub_100009964(v16, v18, v20);

    sub_100009F1C(v28, v30);
    _Block_release(a2);
    LOBYTE(v31) = swift_isEscapingClosureAtFileLocation(a3, "", 99, 448, 33, 1);
    swift_release(v23);
    result = swift_release(a3);
    if ((v31 & 1) == 0)
      return result;
    __break(1u);
LABEL_14:
    swift_once(&qword_100021A60, sub_100005648);
  }
}

unint64_t sub_100009DB8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021D70;
  if (!qword_100021D70)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100021D70);
  }
  return result;
}

uint64_t sub_100009DF4()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  if (v1 >> 60 != 15)
    sub_100009E28(*(_QWORD *)(v0 + 32), v1);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100009E28(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    ((void (*)(void))swift_release)();
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100009E6C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_100009E94()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100009EA4()
{
  uint64_t v0;

  return sub_100011ED8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100009EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100009EBC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100009EC4(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100009ED8(result, a2);
  return result;
}

uint64_t sub_100009ED8(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100009F1C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100009E28(a1, a2);
  return a1;
}

_QWORD *sub_100009F30(uint64_t a1, uint64_t *a2, int *a3)
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
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
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
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t *v43;
  int v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t *v50;
  int v51;
  char v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  void *__dst;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v16);
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    v8 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v8;
    v9 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v9;
    *(_DWORD *)(a1 + 48) = *((_DWORD *)a2 + 12);
    *(_WORD *)(a1 + 52) = *((_WORD *)a2 + 26);
    v10 = a3[13];
    __dst = (void *)(a1 + v10);
    v11 = (char *)a2 + v10;
    v12 = type metadata accessor for Date(0);
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    if (v14(v11, 1, v12))
    {
      v15 = sub_1000097D8(&qword_100021D38);
      memcpy(__dst, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    v17 = a3[14];
    v18 = a3[15];
    v19 = (_QWORD *)((char *)v4 + v17);
    v20 = (uint64_t *)((char *)a2 + v17);
    v22 = *v20;
    v21 = v20[1];
    LOBYTE(v20) = *((_BYTE *)a2 + v18);
    *v19 = v22;
    v19[1] = v21;
    *((_BYTE *)v4 + v18) = (_BYTE)v20;
    v23 = a3[16];
    v24 = a3[17];
    v25 = (_QWORD *)((char *)v4 + v23);
    v26 = (uint64_t *)((char *)a2 + v23);
    v27 = v26[1];
    *v25 = *v26;
    v25[1] = v27;
    v28 = (_QWORD *)((char *)v4 + v24);
    v29 = (uint64_t *)((char *)a2 + v24);
    v30 = v29[1];
    *v28 = *v29;
    v28[1] = v30;
    v31 = a3[18];
    v32 = a3[19];
    v33 = (_QWORD *)((char *)v4 + v31);
    v34 = (uint64_t *)((char *)a2 + v31);
    v35 = v34[1];
    *v33 = *v34;
    v33[1] = v35;
    v36 = (char *)v4 + v32;
    v37 = (uint64_t)a2 + v32;
    *(_QWORD *)v36 = *(_QWORD *)v37;
    v36[8] = *(_BYTE *)(v37 + 8);
    v38 = a3[20];
    v39 = a3[21];
    v40 = (char *)v4 + v38;
    v41 = (uint64_t)a2 + v38;
    *(_OWORD *)v40 = *(_OWORD *)v41;
    v40[16] = *(_BYTE *)(v41 + 16);
    v42 = (char *)v4 + v39;
    v43 = (uint64_t *)((char *)a2 + v39);
    v44 = *((unsigned __int8 *)a2 + v39 + 16);
    swift_bridgeObjectRetain(v21);
    swift_bridgeObjectRetain(v27);
    swift_bridgeObjectRetain(v30);
    swift_bridgeObjectRetain(v35);
    if (v44 == 255)
    {
      *(_OWORD *)v42 = *(_OWORD *)v43;
      v42[16] = *((_BYTE *)v43 + 16);
    }
    else
    {
      v45 = *v43;
      v46 = (void *)v43[1];
      sub_100005338((void *)*v43, v46, v44 & 1);
      *(_QWORD *)v42 = v45;
      *((_QWORD *)v42 + 1) = v46;
      v42[16] = v44 & 1;
    }
    v47 = a3[23];
    *((_BYTE *)v4 + a3[22]) = *((_BYTE *)a2 + a3[22]);
    *((_BYTE *)v4 + v47) = *((_BYTE *)a2 + v47);
    v48 = a3[25];
    *(_QWORD *)((char *)v4 + a3[24]) = *(uint64_t *)((char *)a2 + a3[24]);
    v49 = (char *)v4 + v48;
    v50 = (uint64_t *)((char *)a2 + v48);
    v51 = *((unsigned __int8 *)a2 + v48 + 16);
    if (v51 == 255)
    {
      *(_OWORD *)v49 = *(_OWORD *)v50;
      v49[16] = *((_BYTE *)v50 + 16);
    }
    else
    {
      v52 = v51 & 1;
      v53 = *v50;
      v54 = (void *)v50[1];
      sub_100005338((void *)*v50, v54, v51 & 1);
      *(_QWORD *)v49 = v53;
      *((_QWORD *)v49 + 1) = v54;
      v49[16] = v52;
    }
    v55 = a3[27];
    *((_BYTE *)v4 + a3[26]) = *((_BYTE *)a2 + a3[26]);
    *((_BYTE *)v4 + v55) = *((_BYTE *)a2 + v55);
    v56 = a3[28];
    v57 = (char *)v4 + v56;
    v58 = (uint64_t)a2 + v56;
    v59 = *(_QWORD *)(v58 + 16);
    if (v59 == 1)
    {
      *(_OWORD *)v57 = *(_OWORD *)v58;
      *((_QWORD *)v57 + 2) = *(_QWORD *)(v58 + 16);
    }
    else
    {
      *(_DWORD *)v57 = *(_DWORD *)v58;
      v57[4] = *(_BYTE *)(v58 + 4);
      *(_WORD *)(v57 + 5) = *(_WORD *)(v58 + 5);
      *((_QWORD *)v57 + 1) = *(_QWORD *)(v58 + 8);
      *((_QWORD *)v57 + 2) = v59;
      swift_bridgeObjectRetain(v59);
    }
    v60 = a3[29];
    v61 = a3[30];
    v62 = (_QWORD *)((char *)v4 + v60);
    v63 = (uint64_t *)((char *)a2 + v60);
    v64 = v63[1];
    *v62 = *v63;
    v62[1] = v64;
    v65 = (_QWORD *)((char *)v4 + v61);
    v66 = (uint64_t *)((char *)a2 + v61);
    v67 = v66[1];
    *v65 = *v66;
    v65[1] = v67;
    swift_bridgeObjectRetain(v64);
    swift_bridgeObjectRetain(v67);
  }
  return v4;
}

uint64_t sub_10000A260(_QWORD *a1, int *a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  int v8;
  void **v9;
  int v10;
  uint64_t v11;

  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  v4 = (char *)a1 + a2[13];
  v5 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[14] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[16] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[17] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[18] + 8));
  v7 = (void **)((char *)a1 + a2[21]);
  v8 = *((unsigned __int8 *)v7 + 16);
  if (v8 != 255)
    sub_100005370(*v7, v7[1], v8 & 1);
  v9 = (void **)((char *)a1 + a2[25]);
  v10 = *((unsigned __int8 *)v9 + 16);
  if (v10 != 255)
    sub_100005370(*v9, v9[1], v10 & 1);
  v11 = *(_QWORD *)((char *)a1 + a2[28] + 16);
  if (v11 != 1)
    swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[29] + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[30] + 8));
}

uint64_t sub_10000A39C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  int v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  int v49;
  char v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  uint64_t v65;
  void *__dst;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_WORD *)(a1 + 52) = *(_WORD *)(a2 + 52);
  v9 = a3[13];
  __dst = (void *)(a1 + v9);
  v10 = (const void *)(a2 + v9);
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  if (v13(v10, 1, v11))
  {
    v14 = sub_1000097D8(&qword_100021D38);
    memcpy(__dst, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(__dst, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
  }
  v15 = a3[14];
  v16 = a3[15];
  v17 = (_QWORD *)(a1 + v15);
  v18 = (uint64_t *)(a2 + v15);
  v20 = *v18;
  v19 = v18[1];
  LOBYTE(v18) = *(_BYTE *)(a2 + v16);
  *v17 = v20;
  v17[1] = v19;
  *(_BYTE *)(a1 + v16) = (_BYTE)v18;
  v21 = a3[16];
  v22 = a3[17];
  v23 = (_QWORD *)(a1 + v21);
  v24 = (_QWORD *)(a2 + v21);
  v25 = v24[1];
  *v23 = *v24;
  v23[1] = v25;
  v26 = (_QWORD *)(a1 + v22);
  v27 = (_QWORD *)(a2 + v22);
  v28 = v27[1];
  *v26 = *v27;
  v26[1] = v28;
  v29 = a3[18];
  v30 = a3[19];
  v31 = (_QWORD *)(a1 + v29);
  v32 = (_QWORD *)(a2 + v29);
  v33 = v32[1];
  *v31 = *v32;
  v31[1] = v33;
  v34 = a1 + v30;
  v35 = a2 + v30;
  *(_QWORD *)v34 = *(_QWORD *)v35;
  *(_BYTE *)(v34 + 8) = *(_BYTE *)(v35 + 8);
  v36 = a3[20];
  v37 = a3[21];
  v38 = a1 + v36;
  v39 = a2 + v36;
  *(_OWORD *)v38 = *(_OWORD *)v39;
  *(_BYTE *)(v38 + 16) = *(_BYTE *)(v39 + 16);
  v40 = a1 + v37;
  v41 = (uint64_t *)(a2 + v37);
  v42 = *(unsigned __int8 *)(a2 + v37 + 16);
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRetain(v28);
  swift_bridgeObjectRetain(v33);
  if (v42 == 255)
  {
    *(_OWORD *)v40 = *(_OWORD *)v41;
    *(_BYTE *)(v40 + 16) = *((_BYTE *)v41 + 16);
  }
  else
  {
    v43 = *v41;
    v44 = (void *)v41[1];
    sub_100005338((void *)*v41, v44, v42 & 1);
    *(_QWORD *)v40 = v43;
    *(_QWORD *)(v40 + 8) = v44;
    *(_BYTE *)(v40 + 16) = v42 & 1;
  }
  v45 = a3[23];
  *(_BYTE *)(a1 + a3[22]) = *(_BYTE *)(a2 + a3[22]);
  *(_BYTE *)(a1 + v45) = *(_BYTE *)(a2 + v45);
  v46 = a3[25];
  *(_QWORD *)(a1 + a3[24]) = *(_QWORD *)(a2 + a3[24]);
  v47 = a1 + v46;
  v48 = (uint64_t *)(a2 + v46);
  v49 = *(unsigned __int8 *)(a2 + v46 + 16);
  if (v49 == 255)
  {
    *(_OWORD *)v47 = *(_OWORD *)v48;
    *(_BYTE *)(v47 + 16) = *((_BYTE *)v48 + 16);
  }
  else
  {
    v50 = v49 & 1;
    v51 = *v48;
    v52 = (void *)v48[1];
    sub_100005338((void *)*v48, v52, v49 & 1);
    *(_QWORD *)v47 = v51;
    *(_QWORD *)(v47 + 8) = v52;
    *(_BYTE *)(v47 + 16) = v50;
  }
  v53 = a3[27];
  *(_BYTE *)(a1 + a3[26]) = *(_BYTE *)(a2 + a3[26]);
  *(_BYTE *)(a1 + v53) = *(_BYTE *)(a2 + v53);
  v54 = a3[28];
  v55 = a1 + v54;
  v56 = a2 + v54;
  v57 = *(_QWORD *)(v56 + 16);
  if (v57 == 1)
  {
    *(_OWORD *)v55 = *(_OWORD *)v56;
    *(_QWORD *)(v55 + 16) = *(_QWORD *)(v56 + 16);
  }
  else
  {
    *(_DWORD *)v55 = *(_DWORD *)v56;
    *(_BYTE *)(v55 + 4) = *(_BYTE *)(v56 + 4);
    *(_WORD *)(v55 + 5) = *(_WORD *)(v56 + 5);
    *(_QWORD *)(v55 + 8) = *(_QWORD *)(v56 + 8);
    *(_QWORD *)(v55 + 16) = v57;
    swift_bridgeObjectRetain(v57);
  }
  v58 = a3[29];
  v59 = a3[30];
  v60 = (_QWORD *)(a1 + v58);
  v61 = (_QWORD *)(a2 + v58);
  v62 = v61[1];
  *v60 = *v61;
  v60[1] = v62;
  v63 = (_QWORD *)(a1 + v59);
  v64 = (_QWORD *)(a2 + v59);
  v65 = v64[1];
  *v63 = *v64;
  v63[1] = v65;
  swift_bridgeObjectRetain(v62);
  swift_bridgeObjectRetain(v65);
  return a1;
}

uint64_t sub_10000A6A0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void *, uint64_t, uint64_t);
  int v18;
  int v19;
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
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 *v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  __int128 *v51;
  int v52;
  char v53;
  __int128 v54;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  char v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  __int128 *v66;
  int v67;
  int v68;
  char v69;
  __int128 v70;
  char v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  char v76;
  char v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  __int128 *v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  _QWORD *v96;
  uint64_t v97;
  uint64_t v98;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a2 + 40);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 50);
  *(_BYTE *)(a1 + 51) = *(_BYTE *)(a2 + 51);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_BYTE *)(a1 + 53) = *(_BYTE *)(a2 + 53);
  v12 = a3[13];
  v13 = (void *)(a1 + v12);
  v14 = (void *)(a2 + v12);
  v15 = type metadata accessor for Date(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    v20 = sub_1000097D8(&qword_100021D38);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 24))(v13, v14, v15);
LABEL_7:
  v21 = a3[14];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (_QWORD *)(a2 + v21);
  *v22 = *v23;
  v24 = v23[1];
  v25 = v22[1];
  v22[1] = v24;
  swift_bridgeObjectRetain(v24);
  swift_bridgeObjectRelease(v25);
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  v26 = a3[16];
  v27 = (_QWORD *)(a1 + v26);
  v28 = (_QWORD *)(a2 + v26);
  *v27 = *v28;
  v29 = v28[1];
  v30 = v27[1];
  v27[1] = v29;
  swift_bridgeObjectRetain(v29);
  swift_bridgeObjectRelease(v30);
  v31 = a3[17];
  v32 = (_QWORD *)(a1 + v31);
  v33 = (_QWORD *)(a2 + v31);
  *v32 = *v33;
  v34 = v33[1];
  v35 = v32[1];
  v32[1] = v34;
  swift_bridgeObjectRetain(v34);
  swift_bridgeObjectRelease(v35);
  v36 = a3[18];
  v37 = (_QWORD *)(a1 + v36);
  v38 = (_QWORD *)(a2 + v36);
  *v37 = *v38;
  v39 = v38[1];
  v40 = v37[1];
  v37[1] = v39;
  swift_bridgeObjectRetain(v39);
  swift_bridgeObjectRelease(v40);
  v41 = a3[19];
  v42 = a1 + v41;
  v43 = (uint64_t *)(a2 + v41);
  v44 = *v43;
  *(_BYTE *)(v42 + 8) = *((_BYTE *)v43 + 8);
  *(_QWORD *)v42 = v44;
  v45 = a3[20];
  v46 = a1 + v45;
  v47 = (__int128 *)(a2 + v45);
  v48 = *v47;
  *(_BYTE *)(v46 + 16) = *((_BYTE *)v47 + 16);
  *(_OWORD *)v46 = v48;
  v49 = a3[21];
  v50 = a1 + v49;
  v51 = (__int128 *)(a2 + v49);
  LODWORD(v46) = *(unsigned __int8 *)(a1 + v49 + 16);
  v52 = *(unsigned __int8 *)(a2 + v49 + 16);
  if ((_DWORD)v46 == 255)
  {
    if (v52 == 255)
    {
      v54 = *v51;
      *(_BYTE *)(v50 + 16) = *((_BYTE *)v51 + 16);
      *(_OWORD *)v50 = v54;
    }
    else
    {
      v61 = v52 & 1;
      v62 = *(void **)v51;
      v63 = (void *)*((_QWORD *)v51 + 1);
      sub_100005338(v62, v63, v52 & 1);
      *(_QWORD *)v50 = v62;
      *(_QWORD *)(v50 + 8) = v63;
      *(_BYTE *)(v50 + 16) = v61;
    }
  }
  else if (v52 == 255)
  {
    sub_10000ABF0(v50);
    v53 = *((_BYTE *)v51 + 16);
    *(_OWORD *)v50 = *v51;
    *(_BYTE *)(v50 + 16) = v53;
  }
  else
  {
    v55 = v52 & 1;
    v56 = *(void **)v51;
    v57 = (void *)*((_QWORD *)v51 + 1);
    sub_100005338(v56, v57, v52 & 1);
    v58 = *(void **)v50;
    v59 = *(void **)(v50 + 8);
    v60 = *(_BYTE *)(v50 + 16);
    *(_QWORD *)v50 = v56;
    *(_QWORD *)(v50 + 8) = v57;
    *(_BYTE *)(v50 + 16) = v55;
    sub_100005370(v58, v59, v60);
  }
  *(_BYTE *)(a1 + a3[22]) = *(_BYTE *)(a2 + a3[22]);
  *(_BYTE *)(a1 + a3[23]) = *(_BYTE *)(a2 + a3[23]);
  *(_QWORD *)(a1 + a3[24]) = *(_QWORD *)(a2 + a3[24]);
  v64 = a3[25];
  v65 = a1 + v64;
  v66 = (__int128 *)(a2 + v64);
  v67 = *(unsigned __int8 *)(a1 + v64 + 16);
  v68 = *(unsigned __int8 *)(a2 + v64 + 16);
  if (v67 == 255)
  {
    if (v68 == 255)
    {
      v70 = *v66;
      *(_BYTE *)(v65 + 16) = *((_BYTE *)v66 + 16);
      *(_OWORD *)v65 = v70;
    }
    else
    {
      v77 = v68 & 1;
      v78 = *(void **)v66;
      v79 = (void *)*((_QWORD *)v66 + 1);
      sub_100005338(v78, v79, v68 & 1);
      *(_QWORD *)v65 = v78;
      *(_QWORD *)(v65 + 8) = v79;
      *(_BYTE *)(v65 + 16) = v77;
    }
  }
  else if (v68 == 255)
  {
    sub_10000ABF0(v65);
    v69 = *((_BYTE *)v66 + 16);
    *(_OWORD *)v65 = *v66;
    *(_BYTE *)(v65 + 16) = v69;
  }
  else
  {
    v71 = v68 & 1;
    v72 = *(void **)v66;
    v73 = (void *)*((_QWORD *)v66 + 1);
    sub_100005338(v72, v73, v68 & 1);
    v74 = *(void **)v65;
    v75 = *(void **)(v65 + 8);
    v76 = *(_BYTE *)(v65 + 16);
    *(_QWORD *)v65 = v72;
    *(_QWORD *)(v65 + 8) = v73;
    *(_BYTE *)(v65 + 16) = v71;
    sub_100005370(v74, v75, v76);
  }
  *(_BYTE *)(a1 + a3[26]) = *(_BYTE *)(a2 + a3[26]);
  *(_BYTE *)(a1 + a3[27]) = *(_BYTE *)(a2 + a3[27]);
  v80 = a3[28];
  v81 = a1 + v80;
  v82 = (__int128 *)(a2 + v80);
  v83 = *(_QWORD *)(a1 + v80 + 16);
  v84 = *(_QWORD *)(a2 + v80 + 16);
  if (v83 == 1)
  {
    if (v84 == 1)
    {
      v85 = *v82;
      *(_QWORD *)(v81 + 16) = *((_QWORD *)v82 + 2);
      *(_OWORD *)v81 = v85;
    }
    else
    {
      *(_DWORD *)v81 = *(_DWORD *)v82;
      *(_BYTE *)(v81 + 4) = *((_BYTE *)v82 + 4);
      *(_BYTE *)(v81 + 5) = *((_BYTE *)v82 + 5);
      *(_BYTE *)(v81 + 6) = *((_BYTE *)v82 + 6);
      *(_QWORD *)(v81 + 8) = *((_QWORD *)v82 + 1);
      v87 = *((_QWORD *)v82 + 2);
      *(_QWORD *)(v81 + 16) = v87;
      swift_bridgeObjectRetain(v87);
    }
  }
  else if (v84 == 1)
  {
    sub_10000AC24(v81);
    v86 = *((_QWORD *)v82 + 2);
    *(_OWORD *)v81 = *v82;
    *(_QWORD *)(v81 + 16) = v86;
  }
  else
  {
    *(_DWORD *)v81 = *(_DWORD *)v82;
    *(_BYTE *)(v81 + 4) = *((_BYTE *)v82 + 4);
    *(_BYTE *)(v81 + 5) = *((_BYTE *)v82 + 5);
    *(_BYTE *)(v81 + 6) = *((_BYTE *)v82 + 6);
    *(_QWORD *)(v81 + 8) = *((_QWORD *)v82 + 1);
    v88 = *((_QWORD *)v82 + 2);
    *(_QWORD *)(v81 + 16) = v88;
    swift_bridgeObjectRetain(v88);
    swift_bridgeObjectRelease(v83);
  }
  v89 = a3[29];
  v90 = (_QWORD *)(a1 + v89);
  v91 = (_QWORD *)(a2 + v89);
  *v90 = *v91;
  v92 = v91[1];
  v93 = v90[1];
  v90[1] = v92;
  swift_bridgeObjectRetain(v92);
  swift_bridgeObjectRelease(v93);
  v94 = a3[30];
  v95 = (_QWORD *)(a1 + v94);
  v96 = (_QWORD *)(a2 + v94);
  *v95 = *v96;
  v97 = v96[1];
  v98 = v95[1];
  v95[1] = v97;
  swift_bridgeObjectRetain(v97);
  swift_bridgeObjectRelease(v98);
  return a1;
}

uint64_t sub_10000ABF0(uint64_t a1)
{
  destroy for ColorSchemeImageSet(a1);
  return a1;
}

uint64_t sub_10000AC24(uint64_t a1)
{
  destroy for BatteryInfo(a1);
  return a1;
}

uint64_t sub_10000AC58(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  void *v8;
  const void *v9;
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
  __int128 *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_WORD *)(a1 + 52) = *(_WORD *)(a2 + 52);
  v7 = a3[13];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for Date(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = sub_1000097D8(&qword_100021D38);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[15];
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  *(_BYTE *)(a1 + v13) = *(_BYTE *)(a2 + v13);
  v14 = a3[17];
  *(_OWORD *)(a1 + a3[16]) = *(_OWORD *)(a2 + a3[16]);
  *(_OWORD *)(a1 + v14) = *(_OWORD *)(a2 + v14);
  v15 = a3[19];
  *(_OWORD *)(a1 + a3[18]) = *(_OWORD *)(a2 + a3[18]);
  v16 = a1 + v15;
  v17 = a2 + v15;
  *(_QWORD *)v16 = *(_QWORD *)v17;
  *(_BYTE *)(v16 + 8) = *(_BYTE *)(v17 + 8);
  v18 = a3[20];
  v19 = a3[21];
  v20 = a1 + v18;
  v21 = a2 + v18;
  *(_BYTE *)(v20 + 16) = *(_BYTE *)(v21 + 16);
  *(_OWORD *)v20 = *(_OWORD *)v21;
  v22 = a1 + v19;
  v23 = (__int128 *)(a2 + v19);
  v24 = *v23;
  *(_BYTE *)(v22 + 16) = *((_BYTE *)v23 + 16);
  *(_OWORD *)v22 = v24;
  v25 = a3[23];
  *(_BYTE *)(a1 + a3[22]) = *(_BYTE *)(a2 + a3[22]);
  *(_BYTE *)(a1 + v25) = *(_BYTE *)(a2 + v25);
  v26 = a3[25];
  *(_QWORD *)(a1 + a3[24]) = *(_QWORD *)(a2 + a3[24]);
  v27 = a1 + v26;
  v28 = a2 + v26;
  *(_OWORD *)v27 = *(_OWORD *)v28;
  *(_BYTE *)(v27 + 16) = *(_BYTE *)(v28 + 16);
  v29 = a3[27];
  *(_BYTE *)(a1 + a3[26]) = *(_BYTE *)(a2 + a3[26]);
  *(_BYTE *)(a1 + v29) = *(_BYTE *)(a2 + v29);
  v30 = a3[28];
  v31 = a3[29];
  v32 = a1 + v30;
  v33 = a2 + v30;
  *(_OWORD *)v32 = *(_OWORD *)v33;
  *(_QWORD *)(v32 + 16) = *(_QWORD *)(v33 + 16);
  *(_OWORD *)(a1 + v31) = *(_OWORD *)(a2 + v31);
  *(_OWORD *)(a1 + a3[30]) = *(_OWORD *)(a2 + a3[30]);
  return a1;
}

uint64_t sub_10000AE38(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t *v41;
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
  int v54;
  int v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  int v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;

  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRelease(v9);
  v10 = *(_QWORD *)(a2 + 40);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v10;
  swift_bridgeObjectRelease(v11);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 50);
  *(_BYTE *)(a1 + 51) = *(_BYTE *)(a2 + 51);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_BYTE *)(a1 + 53) = *(_BYTE *)(a2 + 53);
  v12 = a3[13];
  v13 = (void *)(a1 + v12);
  v14 = (void *)(a2 + v12);
  v15 = type metadata accessor for Date(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 32))(v13, v14, v15);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    v20 = sub_1000097D8(&qword_100021D38);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 40))(v13, v14, v15);
LABEL_7:
  v21 = a3[14];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (uint64_t *)(a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  v26 = v22[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease(v26);
  v27 = a3[16];
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  v28 = (_QWORD *)(a1 + v27);
  v29 = (uint64_t *)(a2 + v27);
  v31 = *v29;
  v30 = v29[1];
  v32 = v28[1];
  *v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease(v32);
  v33 = a3[17];
  v34 = (_QWORD *)(a1 + v33);
  v35 = (uint64_t *)(a2 + v33);
  v37 = *v35;
  v36 = v35[1];
  v38 = v34[1];
  *v34 = v37;
  v34[1] = v36;
  swift_bridgeObjectRelease(v38);
  v39 = a3[18];
  v40 = (_QWORD *)(a1 + v39);
  v41 = (uint64_t *)(a2 + v39);
  v43 = *v41;
  v42 = v41[1];
  v44 = v40[1];
  *v40 = v43;
  v40[1] = v42;
  swift_bridgeObjectRelease(v44);
  v45 = a3[19];
  v46 = a3[20];
  v47 = a1 + v45;
  v48 = a2 + v45;
  *(_BYTE *)(v47 + 8) = *(_BYTE *)(v48 + 8);
  *(_QWORD *)v47 = *(_QWORD *)v48;
  v49 = a1 + v46;
  v50 = a2 + v46;
  *(_BYTE *)(v49 + 16) = *(_BYTE *)(v50 + 16);
  *(_OWORD *)v49 = *(_OWORD *)v50;
  v51 = a3[21];
  v52 = a1 + v51;
  v53 = a2 + v51;
  v54 = *(unsigned __int8 *)(a1 + v51 + 16);
  if (v54 == 255)
  {
LABEL_10:
    *(_OWORD *)v52 = *(_OWORD *)v53;
    *(_BYTE *)(v52 + 16) = *(_BYTE *)(v53 + 16);
    goto LABEL_12;
  }
  v55 = *(unsigned __int8 *)(v53 + 16);
  if (v55 == 255)
  {
    sub_10000ABF0(v52);
    goto LABEL_10;
  }
  v56 = *(void **)v52;
  v57 = *(void **)(v52 + 8);
  *(_OWORD *)v52 = *(_OWORD *)v53;
  *(_BYTE *)(v52 + 16) = v55 & 1;
  sub_100005370(v56, v57, v54 & 1);
LABEL_12:
  v58 = a3[23];
  *(_BYTE *)(a1 + a3[22]) = *(_BYTE *)(a2 + a3[22]);
  *(_BYTE *)(a1 + v58) = *(_BYTE *)(a2 + v58);
  v59 = a3[25];
  *(_QWORD *)(a1 + a3[24]) = *(_QWORD *)(a2 + a3[24]);
  v60 = a1 + v59;
  v61 = a2 + v59;
  v62 = *(unsigned __int8 *)(a1 + v59 + 16);
  if (v62 == 255)
  {
LABEL_15:
    *(_OWORD *)v60 = *(_OWORD *)v61;
    *(_BYTE *)(v60 + 16) = *(_BYTE *)(v61 + 16);
    goto LABEL_17;
  }
  v63 = *(unsigned __int8 *)(v61 + 16);
  if (v63 == 255)
  {
    sub_10000ABF0(v60);
    goto LABEL_15;
  }
  v64 = *(void **)v60;
  v65 = *(void **)(v60 + 8);
  *(_OWORD *)v60 = *(_OWORD *)v61;
  *(_BYTE *)(v60 + 16) = v63 & 1;
  sub_100005370(v64, v65, v62 & 1);
LABEL_17:
  v66 = a3[27];
  *(_BYTE *)(a1 + a3[26]) = *(_BYTE *)(a2 + a3[26]);
  *(_BYTE *)(a1 + v66) = *(_BYTE *)(a2 + v66);
  v67 = a3[28];
  v68 = a1 + v67;
  v69 = a2 + v67;
  v70 = *(_QWORD *)(a1 + v67 + 16);
  if (v70 != 1)
  {
    v71 = *(_QWORD *)(v69 + 16);
    if (v71 != 1)
    {
      *(_DWORD *)v68 = *(_DWORD *)v69;
      *(_BYTE *)(v68 + 4) = *(_BYTE *)(v69 + 4);
      *(_BYTE *)(v68 + 5) = *(_BYTE *)(v69 + 5);
      *(_BYTE *)(v68 + 6) = *(_BYTE *)(v69 + 6);
      *(_QWORD *)(v68 + 8) = *(_QWORD *)(v69 + 8);
      *(_QWORD *)(v68 + 16) = v71;
      swift_bridgeObjectRelease(v70);
      goto LABEL_22;
    }
    sub_10000AC24(v68);
  }
  *(_OWORD *)v68 = *(_OWORD *)v69;
  *(_QWORD *)(v68 + 16) = *(_QWORD *)(v69 + 16);
LABEL_22:
  v72 = a3[29];
  v73 = (_QWORD *)(a1 + v72);
  v74 = (uint64_t *)(a2 + v72);
  v76 = *v74;
  v75 = v74[1];
  v77 = v73[1];
  *v73 = v76;
  v73[1] = v75;
  swift_bridgeObjectRelease(v77);
  v78 = a3[30];
  v79 = (_QWORD *)(a1 + v78);
  v80 = (uint64_t *)(a2 + v78);
  v82 = *v80;
  v81 = v80[1];
  v83 = v79[1];
  *v79 = v82;
  v79[1] = v81;
  swift_bridgeObjectRelease(v83);
  return a1;
}

uint64_t sub_10000B1E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000B1EC);
}

uint64_t sub_10000B1EC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_1000097D8(&qword_100021D38);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 52), a2, v8);
  }
}

uint64_t sub_10000B26C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000B278);
}

uint64_t sub_10000B278(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_1000097D8(&qword_100021D38);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 52), a2, a2, v7);
  }
  return result;
}

void sub_10000B2F0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[27];

  v4[0] = &unk_100018EA8;
  v4[1] = &unk_100018EA8;
  v4[2] = &unk_100018EA8;
  v4[3] = &unk_100018EC0;
  v4[4] = &unk_100018EC0;
  v4[5] = &unk_100018EC0;
  v4[6] = &unk_100018EC0;
  v4[7] = &unk_100018EC0;
  v4[8] = &unk_100018EC0;
  sub_10000B3D8(319);
  if (v3 <= 0x3F)
  {
    v4[9] = *(_QWORD *)(v2 - 8) + 64;
    v4[10] = &unk_100018ED8;
    v4[11] = &unk_100018EC0;
    v4[12] = &unk_100018ED8;
    v4[13] = &unk_100018ED8;
    v4[14] = &unk_100018ED8;
    v4[15] = &unk_100018EF0;
    v4[16] = &unk_100018F08;
    v4[17] = &unk_100018F20;
    v4[18] = &unk_100018EC0;
    v4[19] = &unk_100018EC0;
    v4[20] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[21] = &unk_100018F20;
    v4[22] = &unk_100018EC0;
    v4[23] = &unk_100018EC0;
    v4[24] = &unk_100018F38;
    v4[25] = &unk_100018ED8;
    v4[26] = &unk_100018ED8;
    swift_initStructMetadata(a1, 256, 27, v4, a1 + 16);
  }
}

void sub_10000B3D8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100021DE0)
  {
    v2 = type metadata accessor for Date(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100021DE0);
  }
}

_QWORD *sub_10000B42C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000B450()
{
  unint64_t result;

  result = qword_100021E80;
  if (!qword_100021E80)
  {
    result = swift_getWitnessTable(&unk_1000190D4, &type metadata for FriendModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021E80);
  }
  return result;
}

uint64_t sub_10000B494(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000B4B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
    return swift_bridgeObjectRelease(a3);
  return result;
}

uint64_t sub_10000B4C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000097D8(&qword_100021D38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000B510()
{
  unint64_t result;

  result = qword_100021E98;
  if (!qword_100021E98)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_100021E98);
  }
  return result;
}

unint64_t sub_10000B554()
{
  unint64_t result;

  result = qword_100021EA0;
  if (!qword_100021EA0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_100021EA0);
  }
  return result;
}

uint64_t sub_10000B598(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FriendModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B5DC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10000B618()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021EB0;
  if (!qword_100021EB0)
  {
    v1 = sub_100009920(&qword_100021D38);
    sub_10000B764(&qword_100021EB8, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100021EB0);
  }
  return result;
}

uint64_t sub_10000B694(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_100009920(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000B6E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021EE8;
  if (!qword_100021EE8)
  {
    v1 = sub_100009920(&qword_100021EE0);
    sub_10000B764(&qword_100021EF0, (uint64_t (*)(uint64_t))type metadata accessor for CGPoint, (uint64_t)&protocol conformance descriptor for CGPoint);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100021EE8);
  }
  return result;
}

uint64_t sub_10000B764(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000B7A4()
{
  unint64_t result;

  result = qword_100021EF8;
  if (!qword_100021EF8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_100021EF8);
  }
  return result;
}

unint64_t sub_10000B7E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021F08;
  if (!qword_100021F08)
  {
    v1 = sub_100009920(&qword_100021F00);
    sub_10000B84C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100021F08);
  }
  return result;
}

unint64_t sub_10000B84C()
{
  unint64_t result;

  result = qword_100021F10;
  if (!qword_100021F10)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_100021F10);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for FriendModel.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FriendModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE8)
    goto LABEL_17;
  if (a2 + 24 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 24) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 24;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 24;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 24;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x19;
  v8 = v6 - 25;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FriendModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 24 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 24) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE7)
    return ((uint64_t (*)(void))((char *)&loc_10000B978 + 4 * byte_100018E3E[v4]))();
  *a1 = a2 + 24;
  return ((uint64_t (*)(void))((char *)sub_10000B9AC + 4 * byte_100018E39[v4]))();
}

uint64_t sub_10000B9AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B9B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000B9BCLL);
  return result;
}

uint64_t sub_10000B9C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000B9D0);
  *(_BYTE *)result = a2 + 24;
  return result;
}

uint64_t sub_10000B9D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B9DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B9E8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000B9F0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FriendModel.CodingKeys()
{
  return &type metadata for FriendModel.CodingKeys;
}

unint64_t sub_10000BA0C()
{
  unint64_t result;

  result = qword_100021F18;
  if (!qword_100021F18)
  {
    result = swift_getWitnessTable(&unk_1000190AC, &type metadata for FriendModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021F18);
  }
  return result;
}

unint64_t sub_10000BA54()
{
  unint64_t result;

  result = qword_100021F20;
  if (!qword_100021F20)
  {
    result = swift_getWitnessTable(&unk_100018FE4, &type metadata for FriendModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021F20);
  }
  return result;
}

unint64_t sub_10000BA9C()
{
  unint64_t result;

  result = qword_100021F28;
  if (!qword_100021F28)
  {
    result = swift_getWitnessTable(&unk_10001900C, &type metadata for FriendModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021F28);
  }
  return result;
}

uint64_t sub_10000BAE0(uint64_t a1, unint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void (*v20)(char *, _QWORD, uint64_t);
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;

  v4 = v3;
  v33 = a1;
  v34 = a2;
  v6 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin();
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DispatchQoS(0);
  __chkstk_darwin();
  v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009DB8();
  static DispatchQoS.userInitiated.getter();
  v36 = &_swiftEmptyArrayStorage;
  v15 = sub_10000BEEC();
  v16 = sub_1000097D8(&qword_100022038);
  v17 = sub_10000BF34();
  v18 = v15;
  v19 = v33;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v36, v16, v17, v10, v18);
  v20 = *(void (**)(char *, _QWORD, uint64_t))(v7 + 104);
  v21 = v34;
  v20(v9, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v6);
  *(_QWORD *)(v4 + 40) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000015, 0x80000001000183C0, v14, v12, v9, 0);
  *(_QWORD *)(v4 + 48) = &_swiftEmptyArrayStorage;
  *(_QWORD *)(v4 + 56) = objc_msgSend(objc_allocWithZone((Class)ACAccountStore), "init");
  *(_QWORD *)(v4 + 16) = v19;
  *(_QWORD *)(v4 + 24) = v21;
  *(double *)(v4 + 32) = a3;
  v22 = qword_100021A78;
  swift_bridgeObjectRetain(v21);
  if (v22 != -1)
    swift_once(&qword_100021A78, sub_10000F108);
  v23 = type metadata accessor for Logger(0);
  sub_10000BF80(v23, (uint64_t)qword_100022F18);
  swift_retain_n(v4, 2);
  v24 = swift_bridgeObjectRetain(v21);
  v25 = Logger.logObject.getter(v24);
  v26 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = swift_slowAlloc(22, -1);
    v28 = (void *)swift_slowAlloc(64, -1);
    v36 = v28;
    *(_DWORD *)v27 = 136315394;
    v29 = (*(uint64_t (**)(void))(*(_QWORD *)v4 + 152))();
    v31 = v30;
    v35 = sub_100012FC4(v29, v30, (uint64_t *)&v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v27 + 4, v27 + 12);
    swift_release_n(v4, 2);
    swift_bridgeObjectRelease(v31);
    *(_WORD *)(v27 + 12) = 2080;
    swift_bridgeObjectRetain(v21);
    v35 = sub_100012FC4(v19, v21, (uint64_t *)&v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v27 + 14, v27 + 22);
    swift_bridgeObjectRelease_n(v21, 3);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "🥑 %sDataService%s: init (v6)", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy(v28, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1, -1);
    swift_slowDealloc(v27, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v21, 2);
    swift_release_n(v4, 2);
  }
  return v4;
}

uint64_t sub_10000BE84()
{
  return 0;
}

uint64_t sub_10000BE90()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  return swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for DataService()
{
  return objc_opt_self(_TtC25FindMyWidgetIntentsPeople11DataService);
}

unint64_t sub_10000BEEC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100022030;
  if (!qword_100022030)
  {
    v1 = type metadata accessor for OS_dispatch_queue.Attributes(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue.Attributes, v1);
    atomic_store(result, (unint64_t *)&qword_100022030);
  }
  return result;
}

unint64_t sub_10000BF34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100022040;
  if (!qword_100022040)
  {
    v1 = sub_100009920(&qword_100022038);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100022040);
  }
  return result;
}

uint64_t sub_10000BF80(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

id sub_10000BF98(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
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
  char *v15;
  char v16;
  void (*v17)(char *, uint64_t);
  double v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  Class isa;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  double v39;
  double v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSString v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  void *object;
  NSString v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  id v56;
  id v57;
  char *v58;
  void (*v59)(char *, uint64_t);
  uint64_t v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  Class v67;
  id v68;
  uint64_t v70;
  id v71;
  id v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  _QWORD aBlock[5];
  uint64_t v77;

  v75 = type metadata accessor for DispatchTime(0);
  v73 = *(_QWORD *)(v75 - 8);
  v5 = __chkstk_darwin(v75);
  v7 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v74 = (char *)&v70 - v8;
  v9 = type metadata accessor for LayoutDirection(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v70 - v14;
  sub_10000C8E8((uint64_t)&v70 - v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v13, enum case for LayoutDirection.rightToLeft(_:), v9);
  v16 = static LayoutDirection.== infix(_:_:)(v15, v13);
  v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v13, v9);
  v17(v15, v9);
  if (qword_100021A68 != -1)
    swift_once(&qword_100021A68, sub_10000C66C);
  v18 = *(double *)&qword_100022F10;
  v19 = (void *)objc_opt_self(CNAvatarImageRenderingScope);
  v20 = (void *)objc_opt_self(UIScreen);
  v21 = objc_msgSend(v20, "mainScreen");
  objc_msgSend(v21, "scale");
  v23 = v22;

  v24 = objc_msgSend(v19, "scopeWithPointSize:scale:rightToLeft:style:", v16 & 1, 0, v18, v18, v23);
  v25 = (void *)sub_10000CED8(a1, a2);
  if (v25)
  {
    v26 = v25;
    v27 = objc_msgSend(v25, "thumbnailImageData");
    if (v27)
    {
      v28 = v27;
      v29 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v31 = v30;

      v32 = objc_allocWithZone((Class)UIImage);
      sub_100009ED8(v29, v31);
      isa = Data._bridgeToObjectiveC()().super.isa;
      v34 = objc_msgSend(v32, "initWithData:", isa);
      sub_100009E28(v29, v31);

      if (v34)
      {
        v35 = (id)sub_10000EAF4(v18, v18);

        sub_100009E28(v29, v31);
        swift_unknownObjectRelease(v24);
      }
      else
      {

        sub_100009E28(v29, v31);
        swift_unknownObjectRelease(v24);
        v35 = 0;
      }
    }
    else
    {
      v62 = *(void **)(v2 + *(int *)(type metadata accessor for ContactsUtilities(0) + 20));
      v63 = sub_1000097D8(&qword_100022070);
      v64 = swift_allocObject(v63, 40, 7);
      *(_OWORD *)(v64 + 16) = xmmword_100019200;
      *(_QWORD *)(v64 + 32) = v26;
      aBlock[0] = v64;
      specialized Array._endMutation()(v64);
      v65 = aBlock[0];
      sub_10000D3A0(0, &qword_100022078, CNContact_ptr);
      v66 = v26;
      v67 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v65);
      v35 = objc_msgSend(v62, "avatarImageForContacts:scope:", v67, v24);

      swift_unknownObjectRelease(v24);
    }
    v68 = v35;
  }
  else
  {
    v72 = v24;
    v36 = swift_allocObject(&unk_10001D330, 24, 7);
    v71 = *(id *)(v2 + *(int *)(type metadata accessor for ContactsUtilities(0) + 20));
    v37 = objc_msgSend(v71, "placeholderImageProvider");
    v38 = objc_msgSend(v20, "mainScreen");
    objc_msgSend(v38, "scale");
    v40 = v39;

    v41 = objc_msgSend(v37, "imageForSize:scale:", v18, v18, v40);
    swift_unknownObjectRelease(v37);
    *(_QWORD *)(v36 + 16) = v41;
    sub_10000D3A0(0, &qword_100022058, NSPredicate_ptr);
    v42 = sub_1000097D8((uint64_t *)&unk_100022060);
    v43 = swift_allocObject(v42, 72, 7);
    *(_OWORD *)(v43 + 16) = xmmword_100019210;
    *(_QWORD *)(v43 + 56) = &type metadata for String;
    *(_QWORD *)(v43 + 64) = sub_1000099C0();
    *(_QWORD *)(v43 + 32) = 0xD000000000000029;
    *(_QWORD *)(v43 + 40) = 0x80000001000183E0;
    v44 = (void *)NSPredicate.init(format:_:)(0x54414D20464C4553, 0xEF40252053454843, v43);
    v45 = String._bridgeToObjectiveC()();
    v46 = objc_msgSend(v44, "evaluateWithObject:", v45);

    if (v46 && (swift_bridgeObjectRetain(a2), sub_10000558C(a1, a2), v48 = v47, swift_bridgeObjectRelease(a2), v48))
    {
      v49 = dispatch_group_create();
      dispatch_group_enter(v49);
      object = String.uppercased()()._object;
      swift_bridgeObjectRelease(v48);
      v51 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(object);
      v52 = swift_allocObject(&unk_10001D358, 32, 7);
      *(_QWORD *)(v52 + 16) = v36;
      *(_QWORD *)(v52 + 24) = v49;
      aBlock[4] = sub_10000D380;
      v77 = v52;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_10000C898;
      aBlock[3] = &unk_10001D370;
      v53 = _Block_copy(aBlock);
      v54 = v77;
      swift_retain(v36);
      v55 = v49;
      swift_release(v54);
      v56 = v72;
      v57 = objc_msgSend(v71, "renderMonogramForString:scope:imageHandler:", v51, v72, v53);
      _Block_release(v53);
      swift_unknownObjectRelease(v57);

      static DispatchTime.now()();
      v58 = v74;
      + infix(_:_:)(v7, 0.5);
      v59 = *(void (**)(char *, uint64_t))(v73 + 8);
      v60 = v75;
      v59(v7, v75);
      OS_dispatch_group.wait(timeout:)(v58);

      swift_unknownObjectRelease(v56);
      v59(v58, v60);
    }
    else
    {
      swift_unknownObjectRelease(v72);
    }
    swift_beginAccess(v36 + 16, aBlock, 0, 0);
    v35 = *(id *)(v36 + 16);
    v61 = v35;
    swift_release(v36);
  }
  return v35;
}

void sub_10000C66C()
{
  qword_100022F10 = 0x405E000000000000;
}

uint64_t sub_10000C67C()
{
  uint64_t result;

  result = sub_10000C698();
  qword_100022050 = result;
  return result;
}

uint64_t sub_10000C698()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  NSString *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v0 = sub_1000097D8(&qword_100022070);
  v1 = swift_allocObject(v0, 104, 7);
  *(_OWORD *)(v1 + 16) = xmmword_100019220;
  *(_QWORD *)(v1 + 32) = CNContactTypeKey;
  *(_QWORD *)(v1 + 40) = CNContactIdentifierKey;
  *(_QWORD *)(v1 + 48) = CNContactGivenNameKey;
  *(_QWORD *)(v1 + 56) = CNContactFamilyNameKey;
  *(_QWORD *)(v1 + 64) = CNContactMiddleNameKey;
  *(_QWORD *)(v1 + 72) = CNContactNicknameKey;
  *(_QWORD *)(v1 + 80) = CNContactEmailAddressesKey;
  *(_QWORD *)(v1 + 88) = CNContactPhoneNumbersKey;
  *(_QWORD *)(v1 + 96) = CNContactThumbnailImageDataKey;
  v17 = v1;
  specialized Array._endMutation()(v1);
  v2 = (void *)objc_opt_self(CNContactFormatter);
  v3 = CNContactTypeKey;
  v4 = CNContactIdentifierKey;
  v5 = CNContactGivenNameKey;
  v6 = CNContactFamilyNameKey;
  v7 = CNContactMiddleNameKey;
  v8 = CNContactNicknameKey;
  v9 = CNContactEmailAddressesKey;
  v10 = CNContactPhoneNumbersKey;
  v11 = CNContactThumbnailImageDataKey;
  v12 = objc_msgSend(v2, "descriptorForRequiredKeysForStyle:", 0);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v12);
  v14 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v14 >= v13 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v14 + 1, 1);
  v15 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v14, v12);
  specialized Array._endMutation()(v15);
  return v17;
}

void sub_10000C838(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  id v7;
  _BYTE v8[24];

  swift_beginAccess(a2 + 16, v8, 1, 0);
  v6 = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = a1;
  v7 = a1;

  dispatch_group_leave(a3);
}

void sub_10000C898(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

uint64_t sub_10000C8E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v13;
  os_log_type_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;

  v2 = v1;
  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000097D8(&qword_100022090);
  __chkstk_darwin();
  v10 = (_QWORD *)((char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000D41C(v2, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload(v10, v8) == 1)
  {
    v11 = type metadata accessor for LayoutDirection(0);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = *v10;
    v14 = static os_log_type_t.fault.getter();
    v15 = static Log.runtimeIssuesLog.getter();
    v16 = v14;
    if (os_log_type_enabled(v15, v14))
    {
      v17 = (uint8_t *)swift_slowAlloc(12, -1);
      v18 = swift_slowAlloc(32, -1);
      v20[1] = a1;
      v19 = v18;
      v22 = v18;
      *(_DWORD *)v17 = 136315138;
      v21 = sub_100012FC4(0x694474756F79614CLL, 0xEF6E6F6974636572, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v17 + 4, v17 + 12);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v17, 0xCu);
      swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v19, -1, -1);
      swift_slowDealloc(v17, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v7, v13);
    swift_release(v13);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_10000CB24(uint64_t a1, unint64_t a2, int a3)
{
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
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  char *v32;
  unint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  int v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;

  v50 = a3;
  v5 = type metadata accessor for CharacterSet(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v47 - v11;
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v47 - v14;
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v47 - v17;
  v19 = __chkstk_darwin(v16);
  v21 = (char *)&v47 - v20;
  v22 = __chkstk_darwin(v19);
  v24 = (char *)&v47 - v23;
  v25 = __chkstk_darwin(v22);
  if (!a2)
    goto LABEL_7;
  v27 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v27 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v27)
    goto LABEL_7;
  v49 = (char *)&v47 - v26;
  v28 = static CharacterSet.decimalDigits.getter(v25);
  static CharacterSet.whitespacesAndNewlines.getter(v28);
  v48 = a1;
  CharacterSet.union(_:)(v12);
  v29 = *(void (**)(char *, uint64_t))(v6 + 8);
  v29(v12, v5);
  v30 = ((uint64_t (*)(char *, uint64_t))v29)(v15, v5);
  static CharacterSet.controlCharacters.getter(v30);
  CharacterSet.union(_:)(v15);
  v29(v15, v5);
  v29(v18, v5);
  CharacterSet.init(charactersIn:)(757671979, 0xE400000000000000);
  CharacterSet.union(_:)(v18);
  v29(v18, v5);
  v31 = ((uint64_t (*)(char *, uint64_t))v29)(v21, v5);
  v32 = v49;
  CharacterSet.inverted.getter(v31);
  v29(v24, v5);
  v53 = v48;
  v54 = a2;
  v33 = sub_10000D3D8();
  v34 = StringProtocol.rangeOfCharacter(from:options:range:)(v32, 0, 0, 0, 1, &type metadata for String, v33);
  if ((v35 & 1) == 0)
  {
    v29(v32, v5);
LABEL_7:
    v36 = 0;
    return v36 & 1;
  }
  static CharacterSet.decimalDigits.getter(v34);
  CharacterSet.init(charactersIn:)(43, 0xE100000000000000);
  CharacterSet.union(_:)(v18);
  v29(v18, v5);
  v38 = ((uint64_t (*)(char *, uint64_t))v29)(v21, v5);
  CharacterSet.inverted.getter(v38);
  v29(v24, v5);
  v39 = v48;
  v53 = v48;
  v54 = a2;
  swift_bridgeObjectRetain(a2);
  v51 = v39;
  v52 = a2;
  v40 = StringProtocol.rangeOfCharacter(from:options:range:)(v9, 0, 0, 0, 1, &type metadata for String, v33);
  v41 = v39;
  v42 = a2;
  v43 = v39;
  if ((v44 & 1) == 0)
  {
    do
    {
      String.removeSubrange(_:)(v40);
      v41 = v53;
      v42 = v54;
      v51 = v53;
      v52 = v54;
      v40 = StringProtocol.rangeOfCharacter(from:options:range:)(v9, 0, 0, 0, 1, &type metadata for String, v33);
    }
    while ((v45 & 1) == 0);
    v43 = v39;
  }
  if ((v50 & 1) != 0)
  {
    if (v41 == v43 && v42 == a2)
      v36 = 0;
    else
      v36 = _stringCompareWithSmolCheck(_:_:expecting:)(v43, a2, v41, v42, 0) ^ 1;
  }
  else
  {
    v36 = 1;
  }
  v29(v9, v5);
  v29(v49, v5);
  return v36 & 1;
}

uint64_t sub_10000CED8(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSString v7;
  unsigned int v8;
  void *v9;
  NSString v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  NSString v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  Class isa;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v33;
  id v34;

  sub_10000D3A0(0, &qword_100022058, NSPredicate_ptr);
  v4 = sub_1000097D8((uint64_t *)&unk_100022060);
  v5 = swift_allocObject(v4, 72, 7);
  *(_OWORD *)(v5 + 16) = xmmword_100019210;
  *(_QWORD *)(v5 + 56) = &type metadata for String;
  *(_QWORD *)(v5 + 64) = sub_1000099C0();
  *(_QWORD *)(v5 + 32) = 0xD000000000000029;
  *(_QWORD *)(v5 + 40) = 0x80000001000183E0;
  v6 = (void *)NSPredicate.init(format:_:)(0x54414D20464C4553, 0xEF40252053454843, v5);
  v7 = String._bridgeToObjectiveC()();
  v8 = objc_msgSend(v6, "evaluateWithObject:", v7);

  if (v8)
  {
    v9 = (void *)objc_opt_self(CNContact);
    v10 = String._bridgeToObjectiveC()();
    v11 = objc_msgSend(v9, "predicateForContactsMatchingEmailAddress:", v10);
LABEL_5:
    v16 = v11;

    goto LABEL_7;
  }
  v12 = sub_10000CB24(a1, a2, 0);
  swift_bridgeObjectRelease(v13);
  if ((v12 & 1) != 0)
  {
    v14 = objc_allocWithZone((Class)CNPhoneNumber);
    swift_bridgeObjectRetain(a2);
    v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
    v10 = objc_msgSend(v14, "initWithStringValue:", v15);

    v11 = objc_msgSend((id)objc_opt_self(CNContact), "predicateForContactsMatchingPhoneNumber:", v10);
    goto LABEL_5;
  }
  v16 = 0;
LABEL_7:
  if (objc_msgSend((id)objc_opt_self(CNContactStore), "authorizationStatusForEntityType:", 0) != (id)3)
  {

    return 0;
  }
  v17 = objc_msgSend(objc_allocWithZone((Class)CNContactStore), "init");
  v18 = v17;
  if (!v16)
  {

    return 0;
  }
  v19 = qword_100021A70;
  v20 = v16;
  if (v19 != -1)
    swift_once(&qword_100021A70, sub_10000C67C);
  v21 = qword_100022050;
  swift_bridgeObjectRetain(qword_100022050);
  sub_1000097D8(&qword_100022080);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v21);
  v34 = 0;
  v23 = objc_msgSend(v18, "unifiedContactsMatchingPredicate:keysToFetch:error:", v20, isa, &v34);

  v24 = v34;
  if (!v23)
  {
    v30 = v34;
    v31 = _convertNSErrorToError(_:)(v24);

    swift_willThrow();
    swift_errorRelease(v31);
    return 0;
  }
  v25 = sub_10000D3A0(0, &qword_100022078, CNContact_ptr);
  v26 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v23, v25);
  v27 = v24;

  if ((unint64_t)v26 >> 62)
  {
    if (v26 < 0)
      v33 = v26;
    else
      v33 = v26 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v26);
    v28 = _CocoaArrayWrapper.endIndex.getter(v33);
    swift_bridgeObjectRelease(v26);
    if (v28)
      goto LABEL_14;
LABEL_27:
    swift_bridgeObjectRelease(v26);

    return v28;
  }
  v28 = *(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v28)
    goto LABEL_27;
LABEL_14:
  if ((v26 & 0xC000000000000001) != 0)
  {
    v29 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v26);
  }
  else
  {
    if (!*(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10))
      __break(1u);
    v29 = *(id *)(v26 + 32);
  }
  v28 = (uint64_t)v29;
  swift_bridgeObjectRelease(v26);

  return v28;
}

uint64_t sub_10000D2F4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t type metadata accessor for ContactsUtilities(uint64_t a1)
{
  uint64_t result;

  result = qword_1000220F8;
  if (!qword_1000220F8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ContactsUtilities);
  return result;
}

uint64_t sub_10000D354()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

void sub_10000D380(void *a1)
{
  uint64_t v1;

  sub_10000C838(a1, *(_QWORD *)(v1 + 16), *(NSObject **)(v1 + 24));
}

uint64_t sub_10000D388(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000D398(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000D3A0(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_10000D3D8()
{
  unint64_t result;

  result = qword_100022088;
  if (!qword_100022088)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100022088);
  }
  return result;
}

uint64_t sub_10000D41C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000097D8(&qword_100022090);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_10000D464(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_1000097D8(&qword_100022090);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for LayoutDirection(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = *(int *)(a3 + 20);
    v15 = *(void **)((char *)a2 + v14);
    *(uint64_t *)((char *)a1 + v14) = (uint64_t)v15;
    v16 = v15;
  }
  return a1;
}

void sub_10000D540(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1000097D8(&qword_100022090);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for LayoutDirection(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }

}

uint64_t *sub_10000D5B0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = sub_1000097D8(&qword_100022090);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for LayoutDirection(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = *(int *)(a3 + 20);
  v13 = *(void **)((char *)a2 + v12);
  *(uint64_t *)((char *)a1 + v12) = (uint64_t)v13;
  v14 = v13;
  return a1;
}

uint64_t *sub_10000D660(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  if (a1 != a2)
  {
    sub_10000D728((uint64_t)a1);
    v6 = sub_1000097D8(&qword_100022090);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for LayoutDirection(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  v12 = *(int *)(a3 + 20);
  v13 = *(void **)((char *)a2 + v12);
  v14 = *(void **)((char *)a1 + v12);
  *(uint64_t *)((char *)a1 + v12) = (uint64_t)v13;
  v15 = v13;

  return a1;
}

uint64_t sub_10000D728(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000097D8(&qword_100022090);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_10000D768(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1000097D8(&qword_100022090);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for LayoutDirection(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_10000D810(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (a1 != a2)
  {
    sub_10000D728((uint64_t)a1);
    v6 = sub_1000097D8(&qword_100022090);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for LayoutDirection(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = *(void **)&a1[v8];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];

  return a1;
}

uint64_t sub_10000D8D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000D8DC);
}

uint64_t sub_10000D8DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_1000097D8(&qword_100022098);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_10000D95C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000D968);
}

uint64_t sub_10000D968(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1000097D8(&qword_100022098);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

void sub_10000D9E4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  sub_10000DA58(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
  }
}

void sub_10000DA58(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100022108)
  {
    v2 = type metadata accessor for LayoutDirection(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100022108);
  }
}

Swift::String __swiftcall String.deletingPrefix(_:)(Swift::String a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  void *object;
  uint64_t countAndFlagsBits;
  Swift::Bool v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  Swift::String result;

  v3 = v2;
  v4 = v1;
  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v7 = String.hasPrefix(_:)(a1);
  swift_bridgeObjectRetain(v3);
  if (v7)
  {
    v8 = String.count.getter(countAndFlagsBits, object);
    v9 = sub_10000DBC8(v8, v4, v3);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    swift_bridgeObjectRelease(v3);
    v4 = static String._fromSubstring(_:)(v9, v11, v13, v15);
    v3 = v16;
    swift_bridgeObjectRelease(v15);
  }
  v17 = v4;
  v18 = (void *)v3;
  result._object = v18;
  result._countAndFlagsBits = v17;
  return result;
}

uint64_t String.nonBreaking.getter(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  _QWORD v4[2];
  _QWORD v5[4];

  v5[2] = a1;
  v5[3] = a2;
  v5[0] = 32;
  v5[1] = 0xE100000000000000;
  v4[0] = 41154;
  v4[1] = 0xA200000000000000;
  v2 = sub_10000D3D8();
  return ((uint64_t (*)(_QWORD *, _QWORD *, _QWORD, _QWORD, _QWORD, uint64_t, void *, void *, void *, unint64_t, unint64_t, unint64_t))StringProtocol.replacingOccurrences<A, B>(of:with:options:range:))(v5, v4, 0, 0, 0, 1, &type metadata for String, &type metadata for String, &type metadata for String, v2, v2, v2);
}

unint64_t sub_10000DBC8(unint64_t result, uint64_t a2, unint64_t a3)
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
    result = String.index(_:offsetBy:limitedBy:)(15, result, v5, a2, a3);
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return String.subscript.getter();
  }
  __break(1u);
  return result;
}

uint64_t destroy for BatteryInfo(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
}

uint64_t _s25FindMyWidgetIntentsPeople11BatteryInfoVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_WORD *)(a1 + 5) = *(_WORD *)(a2 + 5);
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BatteryInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_BYTE *)(a1 + 5) = *(_BYTE *)(a2 + 5);
  *(_BYTE *)(a1 + 6) = *(_BYTE *)(a2 + 6);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v3);
  return a1;
}

__n128 initializeWithTake for BatteryInfo(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for BatteryInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_BYTE *)(a1 + 5) = *(_BYTE *)(a2 + 5);
  *(_BYTE *)(a1 + 6) = *(_BYTE *)(a2 + 6);
  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for BatteryInfo(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BatteryInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for BatteryInfo()
{
  return &type metadata for BatteryInfo;
}

uint64_t sub_10000DE38(int a1, uint64_t a2, void *a3, float a4)
{
  void *v8;
  Swift::String v9;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  Swift::String v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  Swift::String v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v25[2];

  v8 = (void *)0xE000000000000000;
  v25[0] = 0;
  v25[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(90);
  v9._countAndFlagsBits = 0x4979726574746142;
  v9._object = (void *)0xEB000000006F666ELL;
  String.append(_:)(v9);
  if (a3)
    v8 = a3;
  else
    a2 = 0;
  swift_bridgeObjectRetain(a3);
  v10._countAndFlagsBits = a2;
  v10._object = v8;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(v8);
  v11._countAndFlagsBits = 0x3D6C6576656C203ALL;
  v11._object = (void *)0xE800000000000000;
  String.append(_:)(v11);
  Float.write<A>(to:)(v25, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation, a4);
  v12._countAndFlagsBits = 0x726168437369202CLL;
  v12._object = (void *)0xED00003D676E6967;
  String.append(_:)(v12);
  if ((a1 & 1) != 0)
    v13 = 1702195828;
  else
    v13 = 0x65736C6166;
  if ((a1 & 1) != 0)
    v14 = 0xE400000000000000;
  else
    v14 = 0xE500000000000000;
  v15 = v14;
  String.append(_:)(*(Swift::String *)&v13);
  swift_bridgeObjectRelease(v14);
  v16._object = (void *)0x8000000100018430;
  v16._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v16);
  if ((a1 & 0x100) != 0)
    v17 = 1702195828;
  else
    v17 = 0x65736C6166;
  if ((a1 & 0x100) != 0)
    v18 = 0xE400000000000000;
  else
    v18 = 0xE500000000000000;
  v19 = v18;
  String.append(_:)(*(Swift::String *)&v17);
  swift_bridgeObjectRelease(v18);
  v20._countAndFlagsBits = 0xD00000000000001CLL;
  v20._object = (void *)0x8000000100018450;
  String.append(_:)(v20);
  if ((a1 & 0x10000) != 0)
    v21 = 1702195828;
  else
    v21 = 0x65736C6166;
  if ((a1 & 0x10000) != 0)
    v22 = 0xE400000000000000;
  else
    v22 = 0xE500000000000000;
  v23 = v22;
  String.append(_:)(*(Swift::String *)&v21);
  swift_bridgeObjectRelease(v22);
  return v25[0];
}

uint64_t sub_10000E018(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10000E048
                                                            + 4 * asc_100019290[a1]))(0x6C6576656CLL, 0xE500000000000000);
}

uint64_t sub_10000E048()
{
  return 0x6967726168437369;
}

unint64_t sub_10000E064()
{
  return 0xD000000000000011;
}

unint64_t sub_10000E080()
{
  return 0xD000000000000019;
}

uint64_t sub_10000E0B8(_QWORD *a1, unsigned int a2, uint64_t a3, uint64_t a4, float a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;

  v19 = a4;
  v10 = sub_1000097D8(&qword_100022150);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin();
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[3];
  v15 = a1[4];
  sub_10000B42C(a1, v14);
  v16 = sub_10000E87C();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for BatteryInfo.CodingKeys, &type metadata for BatteryInfo.CodingKeys, v16, v14, v15);
  v24 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(&v24, v10, a5);
  if (!v5)
  {
    v17 = v19;
    v23 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(a2 & 1, &v23, v10);
    v22 = 2;
    KeyedEncodingContainer.encode(_:forKey:)((a2 >> 8) & 1, &v22, v10);
    v21 = 3;
    KeyedEncodingContainer.encode(_:forKey:)(HIWORD(a2) & 1, &v21, v10);
    v20 = 4;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(a3, v17, &v20, v10);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

BOOL sub_10000E268(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000E27C()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000E2C0()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000E2E8(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10000E328()
{
  unsigned __int8 *v0;

  return sub_10000E018(*v0);
}

uint64_t sub_10000E330@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10000E474(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000E354(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_10000E360(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000E87C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E388(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000E87C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E3B0()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  if (*(_BYTE *)(v0 + 5))
    v1 = 256;
  else
    v1 = 0;
  v2 = v1 | *(unsigned __int8 *)(v0 + 4);
  if (*(_BYTE *)(v0 + 6))
    v3 = 0x10000;
  else
    v3 = 0;
  return sub_10000DE38(v2 | v3, *(_QWORD *)(v0 + 8), *(void **)(v0 + 16), *(float *)v0);
}

void sub_10000E3E8(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  uint64_t v6;
  float v7;

  v7 = sub_10000E67C(a1);
  if (!v2)
  {
    *(float *)a2 = v7;
    *(_BYTE *)(a2 + 4) = v4 & 1;
    *(_BYTE *)(a2 + 5) = BYTE1(v4) & 1;
    *(_BYTE *)(a2 + 6) = BYTE2(v4) & 1;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
  }
}

uint64_t sub_10000E42C(_QWORD *a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;

  if (*(_BYTE *)(v1 + 5))
    v2 = 256;
  else
    v2 = 0;
  v3 = v2 | *(unsigned __int8 *)(v1 + 4);
  if (*(_BYTE *)(v1 + 6))
    v4 = 0x10000;
  else
    v4 = 0;
  return sub_10000E0B8(a1, v3 | v4, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(float *)v1);
}

uint64_t sub_10000E474(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;

  if (a1 == 0x6C6576656CLL && a2 == 0xE500000000000000)
  {
    v5 = 0xE500000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6C6576656CLL, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6967726168437369 && a2 == 0xEA0000000000676ELL)
  {
    v7 = 0xEA0000000000676ELL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6967726168437369, 0xEA0000000000676ELL, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0xD000000000000011)
  {
    v8 = 0x8000000100018470;
    if (a2 == 0x8000000100018470)
      goto LABEL_19;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011, 0x8000000100018470, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
LABEL_19:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if (a1 == 0xD000000000000019 && a2 == 0x8000000100018490)
  {
    v9 = 0x8000000100018490;
LABEL_25:
    swift_bridgeObjectRelease(v9);
    return 3;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000019, 0x8000000100018490, a1, a2, 0) & 1) != 0)
  {
    v9 = a2;
    goto LABEL_25;
  }
  if (a1 == 0xD000000000000012 && a2 == 0x80000001000184B0)
  {
    swift_bridgeObjectRelease(0x80000001000184B0);
    return 4;
  }
  else
  {
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012, 0x80000001000184B0, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v10 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

float sub_10000E67C(_QWORD *a1)
{
  uint64_t v1;
  float v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  float v11;
  _DWORD v13[2];
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;

  v4 = sub_1000097D8(&qword_100022140);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  sub_10000B42C(a1, v8);
  v10 = sub_10000E87C();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for BatteryInfo.CodingKeys, &type metadata for BatteryInfo.CodingKeys, v10, v8, v9);
  if (!v1)
  {
    v18 = 0;
    KeyedDecodingContainer.decode(_:forKey:)(&v18, v4);
    v2 = v11;
    v17 = 1;
    KeyedDecodingContainer.decode(_:forKey:)(&v17, v4);
    v16 = 2;
    KeyedDecodingContainer.decode(_:forKey:)(&v16, v4);
    v15 = 3;
    v13[1] = KeyedDecodingContainer.decode(_:forKey:)(&v15, v4);
    v14 = 4;
    KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v14, v4);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_10000B494(a1);
  return v2;
}

unint64_t sub_10000E87C()
{
  unint64_t result;

  result = qword_100022148;
  if (!qword_100022148)
  {
    result = swift_getWitnessTable(&unk_100019404, &type metadata for BatteryInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100022148);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for BatteryInfo.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for BatteryInfo.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000E99C + 4 * byte_10001929A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10000E9D0 + 4 * byte_100019295[v4]))();
}

uint64_t sub_10000E9D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E9D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000E9E0);
  return result;
}

uint64_t sub_10000E9EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000E9F4);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_10000E9F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000EA00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BatteryInfo.CodingKeys()
{
  return &type metadata for BatteryInfo.CodingKeys;
}

unint64_t sub_10000EA20()
{
  unint64_t result;

  result = qword_100022158;
  if (!qword_100022158)
  {
    result = swift_getWitnessTable(&unk_1000193DC, &type metadata for BatteryInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100022158);
  }
  return result;
}

unint64_t sub_10000EA68()
{
  unint64_t result;

  result = qword_100022160;
  if (!qword_100022160)
  {
    result = swift_getWitnessTable(&unk_10001934C, &type metadata for BatteryInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100022160);
  }
  return result;
}

unint64_t sub_10000EAB0()
{
  unint64_t result;

  result = qword_100022168;
  if (!qword_100022168)
  {
    result = swift_getWitnessTable(&unk_100019374, &type metadata for BatteryInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100022168);
  }
  return result;
}

uint64_t sub_10000EAF4(double a1, double a2)
{
  void *v2;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t result;
  _QWORD v13[5];
  uint64_t v14;

  v5 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRenderer), "initWithSize:", a1, a2);
  v6 = swift_allocObject(&unk_10001D578, 40, 7);
  *(_QWORD *)(v6 + 16) = v2;
  *(double *)(v6 + 24) = a1;
  *(double *)(v6 + 32) = a2;
  v7 = swift_allocObject(&unk_10001D5A0, 32, 7);
  *(_QWORD *)(v7 + 16) = sub_10000EC88;
  *(_QWORD *)(v7 + 24) = v6;
  v13[4] = sub_10000ECB4;
  v14 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10000ECD4;
  v13[3] = &unk_10001D5B8;
  v8 = _Block_copy(v13);
  v9 = v14;
  v10 = v2;
  swift_retain(v7);
  swift_release(v9);
  v11 = objc_msgSend(v5, "imageWithActions:", v8);

  _Block_release(v8);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation(v7, "", 101, 55, 58, 1);
  swift_release(v6);
  result = swift_release(v7);
  if ((v5 & 1) == 0)
    return (uint64_t)v11;
  __break(1u);
  return result;
}

uint64_t sub_10000EC64()
{
  uint64_t v0;

  return swift_deallocObject(v0, 40, 7);
}

id sub_10000EC88()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "drawInRect:", 0.0, 0.0, *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_10000ECA4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000ECB4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_10000ECD4(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

uint64_t sub_10000ED08(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000ED18(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_10000ED20(double a1, double a2, double a3, uint64_t a4, void *a5, void *a6)
{
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  id v21;

  v11 = sub_10000F0E0(0.0);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = (void *)objc_opt_self(UIBezierPath);
  v19 = objc_msgSend(v18, "bezierPathWithOvalInRect:", 0.0, 0.0, a1, a2);
  objc_msgSend(v19, "addClip");
  objc_msgSend(a5, "drawInRect:", 0.0, 0.0, a1, a2);
  v20 = objc_msgSend(v18, "bezierPathWithRect:", 0.0, 0.0, a1, a2);
  objc_msgSend(v20, "addClip");
  v21 = objc_msgSend(v18, "bezierPathWithOvalInRect:", v11, v13, v15, v17);
  objc_msgSend(v21, "setLineWidth:", a3);
  objc_msgSend(a6, "set");
  objc_msgSend(v21, "stroke");

}

uint64_t sub_10000EEA4(double a1)
{
  void *v1;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t result;
  uint64_t v17;
  _QWORD v18[5];
  uint64_t v19;

  v3 = objc_msgSend((id)objc_opt_self(UIColor), "whiteColor");
  objc_msgSend(v1, "scale");
  v5 = v4 * a1;
  objc_msgSend(v1, "scale");
  v7 = v6 * a1;
  v8 = objc_msgSend(objc_allocWithZone((Class)UIGraphicsImageRenderer), "initWithSize:", v5, v6 * a1);
  v9 = swift_allocObject(&unk_10001D5F0, 56, 7);
  *(double *)(v9 + 16) = v5;
  *(double *)(v9 + 24) = v7;
  *(_QWORD *)(v9 + 32) = v1;
  *(_QWORD *)(v9 + 40) = 0x3FF0000000000000;
  *(_QWORD *)(v9 + 48) = v3;
  v10 = swift_allocObject(&unk_10001D618, 32, 7);
  *(_QWORD *)(v10 + 16) = sub_10000F0BC;
  *(_QWORD *)(v10 + 24) = v9;
  v18[4] = sub_10000F104;
  v19 = v10;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_10000ECD4;
  v18[3] = &unk_10001D630;
  v11 = _Block_copy(v18);
  v12 = v19;
  v13 = v1;
  v14 = v3;
  swift_retain(v10);
  swift_release(v12);
  v15 = objc_msgSend(v8, "imageWithActions:", v11);
  _Block_release(v11);
  LOBYTE(v11) = swift_isEscapingClosureAtFileLocation(v10, "", 101, 66, 48, 1);
  result = swift_release(v10);
  if ((v11 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v17 = sub_10000EAF4(a1, a1);
    swift_release(v9);

    return v17;
  }
  return result;
}

uint64_t sub_10000F090()
{
  uint64_t v0;

  return swift_deallocObject(v0, 56, 7);
}

void sub_10000F0BC(uint64_t a1)
{
  uint64_t v1;

  sub_10000ED20(*(double *)(v1 + 16), *(double *)(v1 + 24), *(double *)(v1 + 40), a1, *(void **)(v1 + 32), *(void **)(v1 + 48));
}

uint64_t sub_10000F0D0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

double sub_10000F0E0(double a1)
{
  return a1 + 0.5;
}

uint64_t sub_10000F108()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001102C(v0, qword_100022F18);
  sub_10000BF80(v0, (uint64_t)qword_100022F18);
  return Logger.init(subsystem:category:)(0xD000000000000010, 0x80000001000185A0, 0xD000000000000019, 0x8000000100019440);
}

id sub_10000F188()
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
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Swift::String v17;
  unint64_t v18;
  Swift::String v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  Swift::String v48;
  unint64_t v49;
  objc_class *ObjectType;
  uint64_t v52;
  unint64_t v53[3];
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  objc_super v57;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  v1 = type metadata accessor for Date(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&ObjectType - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&ObjectType - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = &v0[OBJC_IVAR____TtC25FindMyWidgetIntentsPeople20FriendIntentsHandler_instanceId];
  v10 = v0;
  v11 = UUID.init()();
  v12 = UUID.uuidString.getter(v11);
  v14 = v13;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1000111C8(8uLL, v12, v14);
  v16 = v15;
  swift_bridgeObjectRelease(v14);
  v17 = Substring.lowercased()();
  swift_bridgeObjectRelease(v16);
  v52 = 60;
  v53[0] = 0xE100000000000000;
  String.append(_:)(v17);
  swift_bridgeObjectRelease(v17._object);
  v18 = v53[0];
  swift_bridgeObjectRetain(v53[0]);
  v19._countAndFlagsBits = 62;
  v19._object = (void *)0xE100000000000000;
  String.append(_:)(v19);
  swift_bridgeObjectRelease(v18);
  v20 = v52;
  v21 = v53[0];
  *(_QWORD *)v9 = v52;
  *((_QWORD *)v9 + 1) = v21;
  v22 = swift_bridgeObjectRetain(v21);
  v23 = Date.init()(v22);
  v24 = Date.timeIntervalSinceReferenceDate.getter(v23);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v25 = type metadata accessor for PeopleDataService();
  v26 = swift_allocObject(v25, 81, 7);
  *(_QWORD *)(v26 + 64) = &_swiftEmptyArrayStorage;
  v27 = objc_allocWithZone((Class)NSDateFormatter);
  swift_retain(v26);
  *(_QWORD *)(v26 + 72) = objc_msgSend(v27, "init");
  *(_BYTE *)(v26 + 80) = 2;
  swift_release(v26);
  *(_QWORD *)&v10[OBJC_IVAR____TtC25FindMyWidgetIntentsPeople20FriendIntentsHandler_peopleDataService] = sub_10000BAE0(v20, v21, v24);

  v57.receiver = v10;
  v57.super_class = ObjectType;
  v28 = objc_msgSendSuper2(&v57, "init");
  v29 = qword_100021A78;
  v30 = v28;
  if (v29 != -1)
    swift_once(&qword_100021A78, sub_10000F108);
  v31 = type metadata accessor for Logger(0);
  sub_10000BF80(v31, (uint64_t)qword_100022F18);
  v32 = v30;
  v33 = Logger.logObject.getter(v32);
  v34 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc(12, -1);
    v36 = swift_slowAlloc(32, -1);
    v56 = v36;
    *(_DWORD *)v35 = 136315138;
    ObjectType = (objc_class *)(v35 + 4);
    v52 = (uint64_t)v32;
    v37 = sub_100011AA4();
    v38 = String.init<A>(_:radix:uppercase:)(&v52, 16, 0, &type metadata for Int, v37);
    v40 = v39;
    v41 = sub_1000111C8(9uLL, v38, v39);
    v43 = v42;
    v54 = 7876668;
    v55 = 0xE300000000000000;
    v52 = v41;
    v53[0] = v44;
    v53[1] = v45;
    v53[2] = v42;
    v46 = sub_100005140();
    String.append<A>(contentsOf:)(&v52, &type metadata for Substring, v46);
    swift_bridgeObjectRelease(v43);
    v47 = v55;
    v52 = v54;
    v53[0] = v55;
    swift_bridgeObjectRetain(v55);
    v48._countAndFlagsBits = 15971;
    v48._object = (void *)0xE200000000000000;
    String.append(_:)(v48);
    swift_bridgeObjectRelease(v40);
    swift_bridgeObjectRelease(v47);
    v49 = v53[0];
    v52 = sub_100012FC4(v52, v53[0], &v56);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, v53, ObjectType, v35 + 12);

    swift_bridgeObjectRelease(v49);
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "🥑 FriendIntentsHandler%s: init", v35, 0xCu);
    swift_arrayDestroy(v36, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v36, -1, -1);
    swift_slowDealloc(v35, -1, -1);

  }
  else
  {

  }
  return v32;
}

unint64_t sub_10000F5F4()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Swift::String v11;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v0 = sub_100011AA4();
  v1 = String.init<A>(_:radix:uppercase:)(&v13, 16, 0, &type metadata for Int, v0);
  v3 = v2;
  v4 = sub_1000111C8(9uLL, v1, v2);
  v6 = v5;
  v17 = 7876668;
  v18 = 0xE300000000000000;
  v13 = v4;
  v14 = v7;
  v15 = v8;
  v16 = v5;
  v9 = sub_100005140();
  String.append<A>(contentsOf:)(&v13, &type metadata for Substring, v9);
  swift_bridgeObjectRelease(v6);
  v10 = v18;
  v13 = v17;
  v14 = v18;
  swift_bridgeObjectRetain(v18);
  v11._countAndFlagsBits = 15971;
  v11._object = (void *)0xE200000000000000;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v10);
  return v13;
}

id sub_10000F6EC()
{
  void *v0;
  objc_class *ObjectType;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  Swift::String v19;
  unint64_t v20;
  unint64_t v21;
  objc_class *v23;
  uint64_t v24;
  unint64_t v25[3];
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  objc_super v29;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  if (qword_100021A78 != -1)
    swift_once(&qword_100021A78, sub_10000F108);
  v2 = type metadata accessor for Logger(0);
  sub_10000BF80(v2, (uint64_t)qword_100022F18);
  v3 = v0;
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v23 = ObjectType;
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v28 = v7;
    *(_DWORD *)v6 = 136315138;
    v24 = (uint64_t)v3;
    v8 = sub_100011AA4();
    v9 = String.init<A>(_:radix:uppercase:)(&v24, 16, 0, &type metadata for Int, v8);
    v11 = v10;
    v12 = sub_1000111C8(9uLL, v9, v10);
    v14 = v13;
    v26 = 7876668;
    v27 = 0xE300000000000000;
    v24 = v12;
    v25[0] = v15;
    v25[1] = v16;
    v25[2] = v13;
    v17 = sub_100005140();
    String.append<A>(contentsOf:)(&v24, &type metadata for Substring, v17);
    swift_bridgeObjectRelease(v14);
    v18 = v27;
    v24 = v26;
    v25[0] = v27;
    swift_bridgeObjectRetain(v27);
    v19._countAndFlagsBits = 15971;
    v19._object = (void *)0xE200000000000000;
    String.append(_:)(v19);
    swift_bridgeObjectRelease(v11);
    swift_bridgeObjectRelease(v18);
    v20 = v25[0];
    v24 = sub_100012FC4(v24, v25[0], &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, v25, v6 + 4, v6 + 12);

    v21 = v20;
    ObjectType = v23;
    swift_bridgeObjectRelease(v21);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "🥑 FriendIntentsHandler%s: deinit", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

  }
  v29.receiver = v3;
  v29.super_class = ObjectType;
  return objc_msgSendSuper2(&v29, "dealloc");
}

id sub_10000FA34(void *a1)
{
  char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  NSString v40;
  NSString v41;
  id v42;
  uint64_t v43;
  NSString v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  NSObject *v50;
  int v51;
  unint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  id v58;
  void *v59;
  id v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  id v64;
  os_log_type_t v65;
  uint64_t v66;
  void *v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE v76[16];
  uint64_t v77[3];
  char v78[24];
  id v79;

  v2 = v1;
  v73 = a1;
  v3 = sub_1000097D8(&qword_1000221D0);
  __chkstk_darwin(v3);
  v5 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for FriendModel(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = 0;
  v10 = *(_QWORD *)&v1[OBJC_IVAR____TtC25FindMyWidgetIntentsPeople20FriendIntentsHandler_peopleDataService];
  v11 = swift_allocObject(&unk_10001D6E0, 24, 7);
  *(_QWORD *)(v11 + 16) = _swiftEmptyArrayStorage;
  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10001D7F8, 40, 7);
  v13[2] = v12;
  v13[3] = v10;
  v13[4] = v11;
  v14 = v12;
  swift_retain(v10);
  swift_retain(v11);
  sub_100012168((uint64_t)sub_100011C9C, (uint64_t)v13);
  swift_release(v13);
  OS_dispatch_group.wait()();

  swift_beginAccess(v11 + 16, v78, 0, 0);
  v15 = *(_QWORD *)(v11 + 16);
  swift_bridgeObjectRetain(v15);
  swift_release(v11);
  if (*(_QWORD *)(v15 + 16))
  {
    sub_10000B598(v15 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), (uint64_t)v5);
    v16 = 0;
  }
  else
  {
    v16 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, v16, 1, v6);
  swift_bridgeObjectRelease(v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_100011BD4((uint64_t)v5);
    if (qword_100021A78 != -1)
      swift_once(&qword_100021A78, sub_10000F108);
    v17 = type metadata accessor for Logger(0);
    sub_10000BF80(v17, (uint64_t)qword_100022F18);
    v18 = v2;
    v19 = v73;
    v20 = v18;
    v21 = v19;
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = swift_slowAlloc(22, -1);
      v25 = swift_slowAlloc(64, -1);
      v77[0] = v25;
      *(_DWORD *)v24 = 136315394;
      v26 = objc_msgSend(v20, "description");
      v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
      v29 = v28;

      v75 = sub_100012FC4(v27, v29, v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, v76, v24 + 4, v24 + 12);

      swift_bridgeObjectRelease(v29);
      *(_WORD *)(v24 + 12) = 2080;
      v30 = objc_msgSend(v21, "contact");
      if (v30
        && (v31 = v30, v32 = objc_msgSend(v30, "handle"), v31, v32))
      {
        v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
        v35 = v34;

      }
      else
      {
        v35 = 0xEA0000000000746ELL;
        v33 = 0x65746E69206C696ELL;
      }
      v75 = sub_100012FC4(v33, v35, v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, v76, v24 + 14, v24 + 22);

      swift_bridgeObjectRelease(v35);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "%s: default contact for %s: nil", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy(v25, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v25, -1, -1);
      swift_slowDealloc(v24, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    sub_100011C14((uint64_t)v5, (uint64_t)v9);
    v36 = type metadata accessor for Contact();
    v37 = *((_QWORD *)v9 + 1);
    v38 = *((_QWORD *)v9 + 3);
    v39 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v36));
    swift_bridgeObjectRetain(v37);
    swift_bridgeObjectRetain(v38);
    v40 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v37);
    v41 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v38);
    v42 = objc_msgSend(v39, "initWithIdentifier:displayString:", v40, v41);

    __chkstk_darwin(v43);
    *(&v71 - 2) = (uint64_t)v42;
    sub_100009A40((uint64_t)v9, sub_100011C58, (uint64_t)(&v71 - 4));
    v44 = String._bridgeToObjectiveC()();
    objc_msgSend(v42, "setHandle:", v44);

    v79 = v42;
    if (qword_100021A78 != -1)
      swift_once(&qword_100021A78, sub_10000F108);
    v45 = type metadata accessor for Logger(0);
    sub_10000BF80(v45, (uint64_t)qword_100022F18);
    v46 = v2;
    v47 = v73;
    v48 = v46;
    v49 = v47;
    v50 = Logger.logObject.getter(v49);
    v51 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v50, (os_log_type_t)v51))
    {
      LODWORD(v73) = v51;
      v52 = 0xEA0000000000746ELL;
      v53 = swift_slowAlloc(32, -1);
      v72 = swift_slowAlloc(96, -1);
      v77[0] = v72;
      *(_DWORD *)v53 = 136315650;
      v54 = objc_msgSend(v48, "description");
      v55 = ((uint64_t (*)(void))static String._unconditionallyBridgeFromObjectiveC(_:))();
      v57 = v56;

      v75 = sub_100012FC4(v55, v57, v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, v76, v53 + 4, v53 + 12);

      swift_bridgeObjectRelease(v57);
      *(_WORD *)(v53 + 12) = 2080;
      v58 = objc_msgSend(v49, "contact");
      if (v58)
      {
        v59 = v58;
        v60 = objc_msgSend(v58, "handle");

        if (v60)
        {
          v61 = static String._unconditionallyBridgeFromObjectiveC(_:)(v60);
          v52 = v62;

        }
        else
        {
          v61 = 0x65746E69206C696ELL;
        }
      }
      else
      {
        v61 = 0x65746E69206C696ELL;
      }
      v63 = 7104878;
      v75 = sub_100012FC4(v61, v52, v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, v76, v53 + 14, v53 + 22);

      swift_bridgeObjectRelease(v52);
      *(_WORD *)(v53 + 22) = 2080;
      swift_beginAccess(&v79, &v75, 0, 0);
      if (v79)
      {
        v64 = objc_msgSend(v79, "handle");
        v65 = v73;
        v66 = v72;
        if (v64)
        {
          v67 = v64;
          v63 = static String._unconditionallyBridgeFromObjectiveC(_:)(v64);
          v69 = v68;

        }
        else
        {
          v69 = 0xE300000000000000;
        }
      }
      else
      {
        v69 = 0xE300000000000000;
        v65 = v73;
        v66 = v72;
      }
      v74 = sub_100012FC4(v63, v69, v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75, v53 + 24, v53 + 32);
      swift_bridgeObjectRelease(v69);
      _os_log_impl((void *)&_mh_execute_header, v50, v65, "%s: default contact for %s: %s", (uint8_t *)v53, 0x20u);
      swift_arrayDestroy(v66, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v66, -1, -1);
      swift_slowDealloc(v53, -1, -1);
    }
    else
    {

    }
    sub_100011C60((uint64_t)v9);
  }
  swift_beginAccess(&v79, v77, 0, 0);
  return v79;
}

uint64_t sub_1000102E8(void *a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  if (a1)
  {
    v5 = objc_msgSend(a1, "allItems");
    v6 = type metadata accessor for Contact();
    v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

  }
  else
  {
    v7 = 0;
  }
  a3(v7, a2);
  return swift_bridgeObjectRelease(v7);
}

void sub_100010420(objc_class *a1, uint64_t a2, uint64_t a3)
{
  Class isa;
  uint64_t v6;
  id v7;

  isa = a1;
  if (a1)
  {
    type metadata accessor for Contact();
    isa = Array._bridgeToObjectiveC()().super.isa;
  }
  if (a2)
    v6 = _convertErrorToNSError(_:)(a2);
  else
    v6 = 0;
  v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, isa);

}

uint64_t sub_1000104A4(char *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  objc_class *ObjCClassFromMetadata;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSString v26;
  NSString v27;
  id v28;
  NSString v29;
  id v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  id v34;
  Swift::String v35;
  Swift::String v36;
  void *object;
  uint64_t v38;
  id v39;
  NSString v40;
  Class isa;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  Class v47;
  id v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  _QWORD *v67;
  char *v68;
  id v69;
  uint64_t v70;
  char *v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char *v75;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t aBlock[5];
  _QWORD *v94;
  char v95[32];
  Swift::String v96;

  v82 = a2;
  v83 = a3;
  v4 = (_QWORD *)type metadata accessor for DispatchWorkItemFlags(0);
  v88 = *(v4 - 1);
  __chkstk_darwin(v4);
  v87 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v85 = *(_QWORD *)(v6 - 8);
  v86 = v6;
  __chkstk_darwin(v6);
  v84 = (char *)&v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)&a1[OBJC_IVAR____TtC25FindMyWidgetIntentsPeople20FriendIntentsHandler_peopleDataService];
  v9 = swift_allocObject(&unk_10001D6E0, 24, 7);
  *(_QWORD *)(v9 + 16) = _swiftEmptyArrayStorage;
  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10001D708, 40, 7);
  v11[2] = v10;
  v11[3] = v8;
  v11[4] = v9;
  v12 = v10;
  swift_retain(v8);
  swift_retain(v9);
  sub_100012168((uint64_t)sub_100011AEC, (uint64_t)v11);
  swift_release(v11);
  OS_dispatch_group.wait()();

  swift_beginAccess(v9 + 16, v95, 0, 0);
  v13 = *(_QWORD *)(v9 + 16);
  swift_bridgeObjectRetain(v13);
  swift_release(v9);
  v14 = swift_allocObject(&unk_10001D730, 24, 7);
  v89 = v14;
  *(_QWORD *)(v14 + 16) = _swiftEmptyArrayStorage;
  v15 = (uint64_t *)(v14 + 16);
  v16 = *(_QWORD *)(v13 + 16);
  if (v16)
  {
    v80 = a1;
    v81 = v4;
    v17 = *(_QWORD *)(type metadata accessor for FriendModel(0) - 8);
    v18 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    v19 = type metadata accessor for Contact();
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v19);
    v21 = *(_QWORD *)(v17 + 72);
    swift_bridgeObjectRetain(v13);
    v79 = v13;
    v22 = (uint64_t *)(v18 + v13 + 24);
    do
    {
      v23 = *(v22 - 2);
      v24 = *v22;
      v25 = objc_allocWithZone(ObjCClassFromMetadata);
      swift_bridgeObjectRetain(v23);
      swift_bridgeObjectRetain(v24);
      v26 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v23);
      v27 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v24);
      v28 = objc_msgSend(v25, "initWithIdentifier:displayString:", v26, v27);

      v29 = String._bridgeToObjectiveC()();
      objc_msgSend(v28, "setHandle:", v29);

      v30 = v28;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v30);
      v32 = *(_QWORD *)((*v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v31 = *(_QWORD *)((*v15 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v32 >= v31 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v31 > 1, v32 + 1, 1);
      v33 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v32, v30);
      specialized Array._endMutation()(v33);

      v22 = (uint64_t *)((char *)v22 + v21);
      --v16;
    }
    while (v16);
    v13 = v79;
    swift_bridgeObjectRelease(v79);
    v4 = v81;
    a1 = v80;
  }
  swift_bridgeObjectRelease(v13);
  v34 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v96._object = (void *)0x80000001000185C0;
  v35._countAndFlagsBits = 0x73646E65697246;
  v35._object = (void *)0xE700000000000000;
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  v96._countAndFlagsBits = 0xD00000000000001ELL;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v35, (Swift::String_optional)0, (NSBundle)v34, v36, v96)._object;

  v38 = *v15;
  v39 = objc_allocWithZone((Class)INObjectSection);
  swift_bridgeObjectRetain(v38);
  v40 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  type metadata accessor for Contact();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v38);
  v42 = objc_msgSend(v39, "initWithTitle:items:", v40, isa);

  v43 = sub_1000097D8(&qword_100022070);
  v44 = swift_allocObject(v43, 40, 7);
  *(_OWORD *)(v44 + 16) = xmmword_100019200;
  *(_QWORD *)(v44 + 32) = v42;
  aBlock[0] = v44;
  specialized Array._endMutation()(v44);
  v45 = aBlock[0];
  v46 = objc_allocWithZone((Class)INObjectCollection);
  v81 = v42;
  sub_1000097D8(&qword_1000221C8);
  v47 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v45);
  v48 = objc_msgSend(v46, "initWithSections:", v47);

  if (qword_100021A78 != -1)
    swift_once(&qword_100021A78, sub_10000F108);
  v49 = type metadata accessor for Logger(0);
  sub_10000BF80(v49, (uint64_t)qword_100022F18);
  v50 = a1;
  v51 = v89;
  swift_retain_n(v89, 2);
  v52 = v50;
  v53 = Logger.logObject.getter(v52);
  v54 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v53, v54))
  {
    v55 = swift_slowAlloc(22, -1);
    v56 = swift_slowAlloc(32, -1);
    aBlock[0] = v56;
    *(_DWORD *)v55 = 136315394;
    v57 = sub_10000F5F4();
    v59 = v58;
    v91 = sub_100012FC4(v57, v58, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v91, &v92, v55 + 4, v55 + 12);

    swift_bridgeObjectRelease(v59);
    *(_WORD *)(v55 + 12) = 2048;
    swift_beginAccess(v15, &v91, 0, 0);
    v60 = *v15;
    if ((unint64_t)*v15 >> 62)
    {
      if (v60 < 0)
        v77 = *v15;
      else
        v77 = v60 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*v15);
      v61 = _CocoaArrayWrapper.endIndex.getter(v77);
      v51 = v89;
      swift_release(v89);
      swift_bridgeObjectRelease(v60);
    }
    else
    {
      v61 = *(_QWORD *)((v60 & 0xFFFFFFFFFFFFF8) + 0x10);
      v51 = v89;
      swift_release(v89);
    }
    v90 = v61;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91, v55 + 14, v55 + 22);
    swift_release(v51);
    _os_log_impl((void *)&_mh_execute_header, v53, v54, "🥑 FriendIntentsHandler%s: provided %ld options for intent", (uint8_t *)v55, 0x16u);
    swift_arrayDestroy(v56, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v56, -1, -1);
    swift_slowDealloc(v55, -1, -1);

  }
  else
  {

    swift_release_n(v51, 2);
  }
  sub_100009DB8();
  v62 = (void *)static OS_dispatch_queue.main.getter();
  v63 = (_QWORD *)swift_allocObject(&unk_10001D758, 56, 7);
  v63[2] = v52;
  v63[3] = v51;
  v64 = v51;
  v65 = v83;
  v63[4] = v82;
  v63[5] = v65;
  v63[6] = v48;
  aBlock[4] = (uint64_t)sub_100011B58;
  v94 = v63;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100010F3C;
  aBlock[3] = (uint64_t)&unk_10001D770;
  v66 = _Block_copy(aBlock);
  v67 = v94;
  v68 = v52;
  swift_retain(v64);
  swift_retain(v65);
  v69 = v48;
  v70 = swift_release(v67);
  v71 = v84;
  static DispatchQoS.unspecified.getter(v70);
  aBlock[0] = (uint64_t)_swiftEmptyArrayStorage;
  v72 = sub_100011A10();
  v73 = sub_1000097D8(&qword_1000221B0);
  v74 = sub_100011A58();
  v75 = v87;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v73, v74, v4, v72);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v71, v75, v66);
  _Block_release(v66);

  (*(void (**)(char *, _QWORD *))(v88 + 8))(v75, v4);
  (*(void (**)(char *, uint64_t))(v85 + 8))(v71, v86);
  return swift_release(v64);
}

uint64_t sub_100010CC8(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD), uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t (*v14)(_QWORD, _QWORD);
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (qword_100021A78 != -1)
    swift_once(&qword_100021A78, sub_10000F108);
  v9 = type metadata accessor for Logger(0);
  sub_10000BF80(v9, (uint64_t)qword_100022F18);
  v10 = a1;
  swift_retain_n(a2, 2);
  v11 = v10;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = a3;
    v15 = swift_slowAlloc(22, -1);
    v16 = swift_slowAlloc(32, -1);
    v27 = v16;
    *(_DWORD *)v15 = 136315394;
    v17 = sub_10000F5F4();
    v19 = v18;
    v25 = sub_100012FC4(v17, v18, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v15 + 4, v15 + 12);

    swift_bridgeObjectRelease(v19);
    *(_WORD *)(v15 + 12) = 2048;
    swift_beginAccess(a2 + 16, &v25, 0, 0);
    v20 = *(_QWORD *)(a2 + 16);
    if ((unint64_t)v20 >> 62)
    {
      if (v20 < 0)
        v23 = *(_QWORD *)(a2 + 16);
      else
        v23 = v20 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*(_QWORD *)(a2 + 16));
      v21 = _CocoaArrayWrapper.endIndex.getter(v23);
      swift_release(a2);
      swift_bridgeObjectRelease(v20);
    }
    else
    {
      v21 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_release(a2);
    }
    a3 = v14;
    v24 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v15 + 14, v15 + 22);
    swift_release(a2);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "🥑 FriendIntentsHandler%s: returning %ld options for intent", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v15, -1, -1);

  }
  else
  {

    swift_release_n(a2, 2);
  }
  return a3(a5, 0);
}

uint64_t sub_100010F3C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t type metadata accessor for FriendIntentsHandler()
{
  return objc_opt_self(_TtC25FindMyWidgetIntentsPeople20FriendIntentsHandler);
}

uint64_t *sub_10001102C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

void sub_10001106C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = _convertErrorToNSError(_:)(a2);
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_1000110C4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000110E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10001106C(a1, a2, *(_QWORD *)(v2 + 16));
}

id sub_1000110F0(uint64_t a1, unint64_t a2, id a3)
{
  Class isa;
  id v8;

  if (a2 >> 60 == 15)
    return objc_msgSend(a3, "setDisplayImage:", 0);
  sub_100009ED8(a1, a2);
  isa = Data._bridgeToObjectiveC()().super.isa;
  v8 = objc_msgSend((id)objc_opt_self(INImage), "imageWithImageData:", isa);

  objc_msgSend(v8, "_setRenderingMode:", 1);
  objc_msgSend(a3, "setDisplayImage:", v8);

  return (id)sub_100009F1C(a1, a2);
}

unint64_t sub_1000111C8(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

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
    result = String.index(_:offsetBy:limitedBy:)(v4 | (v3 << 16), -(uint64_t)result, 15, a2, a3);
    if ((v5 & 1) != 0)
      result = 15;
    if (4 * v3 >= result >> 14)
      return String.subscript.getter();
  }
  __break(1u);
  return result;
}

void sub_100011270(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26[3];

  if (qword_100021A78 != -1)
    swift_once(&qword_100021A78, sub_10000F108);
  v6 = type metadata accessor for Logger(0);
  sub_10000BF80(v6, (uint64_t)qword_100022F18);
  v7 = a2;
  v8 = a1;
  v9 = v7;
  v10 = v8;
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc(22, -1);
    v14 = (_QWORD *)swift_slowAlloc(8, -1);
    v24 = a3;
    v15 = swift_slowAlloc(32, -1);
    v26[0] = v15;
    *(_DWORD *)v13 = 136315394;
    v16 = sub_10000F5F4();
    v18 = v17;
    v25 = sub_100012FC4(v16, v17, v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, v26, v13 + 4, v13 + 12);

    swift_bridgeObjectRelease(v18);
    *(_WORD *)(v13 + 12) = 2112;
    v25 = (uint64_t)v10;
    v19 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, v26, v13 + 14, v13 + 22);
    *v14 = v10;

    _os_log_impl((void *)&_mh_execute_header, v11, v12, "🥑 FriendIntentsHandler%s: handle intent %@", (uint8_t *)v13, 0x16u);
    v20 = sub_1000097D8(&qword_1000221D8);
    swift_arrayDestroy(v14, 1, v20);
    swift_slowDealloc(v14, -1, -1);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    v21 = v15;
    a3 = v24;
    swift_slowDealloc(v21, -1, -1);
    swift_slowDealloc(v13, -1, -1);

  }
  else
  {

  }
  v22 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FriendSelectorIntentResponse()), "init");
  v23 = &v22[OBJC_IVAR___FriendSelectorIntentResponse_code];
  swift_beginAccess(&v22[OBJC_IVAR___FriendSelectorIntentResponse_code], v26, 1, 0);
  *(_QWORD *)v23 = 2;
  objc_msgSend(v22, "setUserActivity:", 0);
  (*(void (**)(uint64_t, char *))(a3 + 16))(a3, v22);

}

uint64_t sub_100011520(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  char *v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  _QWORD *v58;
  uint64_t aBlock[5];
  _QWORD *v60;

  v52 = a2;
  v53 = a3;
  v5 = type metadata accessor for DispatchWorkItemFlags(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v57 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v55 = *(_QWORD *)(v8 - 8);
  v56 = v8;
  __chkstk_darwin(v8);
  v54 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = type metadata accessor for DispatchQoS.QoSClass(0);
  v10 = *(_QWORD *)(v51 - 8);
  __chkstk_darwin(v51);
  v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100021A78 != -1)
    swift_once(&qword_100021A78, sub_10000F108);
  v13 = type metadata accessor for Logger(0);
  sub_10000BF80(v13, (uint64_t)qword_100022F18);
  v14 = v3;
  v15 = a1;
  v16 = v14;
  v17 = v15;
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v50 = v6;
    v47 = v5;
    v20 = swift_slowAlloc(22, -1);
    v49 = swift_slowAlloc(64, -1);
    aBlock[0] = v49;
    *(_DWORD *)v20 = 136315394;
    v21 = sub_10000F5F4();
    v23 = v22;
    v58 = (_QWORD *)sub_100012FC4(v21, v22, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, aBlock, v20 + 4, v20 + 12);

    swift_bridgeObjectRelease(v23);
    *(_WORD *)(v20 + 12) = 2080;
    v24 = objc_msgSend(v17, "contact");
    v48 = v10;
    if (v24
      && (v25 = v24, v26 = objc_msgSend(v24, "handle"), v25, v26))
    {
      v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
      v29 = v28;

      v30 = v27;
      v31 = v29;
      v5 = v47;
    }
    else
    {
      v5 = v47;
      v31 = 0xEA0000000000746ELL;
      v30 = 0x65746E69206C696ELL;
    }
    v58 = (_QWORD *)sub_100012FC4(v30, v31, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, aBlock, v20 + 14, v20 + 22);

    swift_bridgeObjectRelease(v31);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "🥑 FriendIntentsHandler%s: providing contacts for %s...", (uint8_t *)v20, 0x16u);
    v32 = v49;
    swift_arrayDestroy(v49, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1, -1);
    swift_slowDealloc(v20, -1, -1);

    v6 = v50;
    v10 = v48;
  }
  else
  {

  }
  sub_100009DB8();
  v33 = v51;
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for DispatchQoS.QoSClass.default(_:), v51);
  v34 = (void *)static OS_dispatch_queue.global(qos:)(v12);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v33);
  v35 = (_QWORD *)swift_allocObject(&unk_10001D690, 40, 7);
  v36 = v52;
  v37 = v53;
  v35[2] = v16;
  v35[3] = v36;
  v35[4] = v37;
  aBlock[4] = (uint64_t)sub_1000119EC;
  v60 = v35;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100010F3C;
  aBlock[3] = (uint64_t)&unk_10001D6A8;
  v38 = _Block_copy(aBlock);
  v39 = v16;
  v40 = swift_retain(v37);
  v41 = v54;
  static DispatchQoS.unspecified.getter(v40);
  v58 = _swiftEmptyArrayStorage;
  v42 = sub_100011A10();
  v43 = sub_1000097D8(&qword_1000221B0);
  v44 = sub_100011A58();
  v45 = v57;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v58, v43, v44, v5, v42);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v41, v45, v38);
  _Block_release(v38);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v45, v5);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v41, v56);
  return swift_release(v60);
}

uint64_t sub_1000119C0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000119EC()
{
  uint64_t v0;

  return sub_1000104A4(*(char **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1000119F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100011A08(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100011A10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000221A8;
  if (!qword_1000221A8)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_1000221A8);
  }
  return result;
}

unint64_t sub_100011A58()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000221B8;
  if (!qword_1000221B8)
  {
    v1 = sub_100009920(&qword_1000221B0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000221B8);
  }
  return result;
}

unint64_t sub_100011AA4()
{
  unint64_t result;

  result = qword_1000221C0;
  if (!qword_1000221C0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_1000221C0);
  }
  return result;
}

void sub_100011AEC(uint64_t a1)
{
  uint64_t v1;

  sub_100012A7C(a1, *(NSObject **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_100011AF8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100011B1C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 40));

  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100011B58()
{
  uint64_t v0;

  return sub_100010CC8(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t (**)(_QWORD, _QWORD))(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

void sub_100011B68(objc_class *a1, uint64_t a2)
{
  uint64_t v2;

  sub_100010420(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_100011B70()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100011B94(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1000102E8(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_100011BA0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100011BD4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000097D8(&qword_1000221D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100011C14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FriendModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_100011C58(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1000110F0(a1, a2, *(id *)(v2 + 16));
}

uint64_t sub_100011C60(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FriendModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100011CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v13 = a1;
  if (!((unint64_t)a2 >> 62))
  {
    v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
    return 0;
  }
LABEL_13:
  if (a2 < 0)
    v10 = a2;
  else
    v10 = a2 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a2);
  v3 = _CocoaArrayWrapper.endIndex.getter(v10);
  swift_bridgeObjectRelease(a2);
  if (!v3)
    return 0;
LABEL_3:
  v4 = type metadata accessor for FMFManager(0);
  for (i = 0; ; ++i)
  {
    if ((a2 & 0xC000000000000001) != 0)
    {
      v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, a2);
    }
    else
    {
      v6 = *(_QWORD *)(a2 + 8 * i + 32);
      swift_retain(v6);
    }
    v12 = v6;
    v7 = sub_10000B764(&qword_100022380, (uint64_t (*)(uint64_t))&type metadata accessor for FMFManager, (uint64_t)&protocol conformance descriptor for FMFManager);
    v8 = dispatch thunk of static Equatable.== infix(_:_:)(&v12, &v13, v4, v7);
    swift_release(v6);
    if ((v8 & 1) != 0)
      break;
    v9 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_13;
    }
    if (v9 == v3)
      return 0;
  }
  return i;
}

uint64_t sub_100011DF8(unint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t result;
  char v13;

  v3 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject || v3 < 0 || (v3 & 0x4000000000000000) != 0)
  {
    v3 = sub_1000136D0(v3);
    *v1 = v3;
  }
  v5 = v3 & 0xFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      v9 = v5 + 8 * a1;
      v10 = *(_QWORD *)(v9 + 32);
      v11 = memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(_QWORD *)(v5 + 16) = v7;
      specialized Array._endMutation()(v11);
      return v10;
    }
  }
  v13 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v13, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_100011ED8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100011EF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

Swift::String *peopleWidgetBundleId.unsafeMutableAddressor()
{
  return &peopleWidgetBundleId;
}

void sub_100011F24()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));

}

uint64_t sub_100011F40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v1 = v0;
  if (qword_100021A78 != -1)
    swift_once(&qword_100021A78, sub_10000F108);
  v2 = type metadata accessor for Logger(0);
  sub_10000BF80(v2, (uint64_t)qword_100022F18);
  v3 = swift_retain(v0);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v12 = v7;
    *(_DWORD *)v6 = 136315138;
    v8 = *(_QWORD *)(v1 + 16);
    v9 = *(_QWORD *)(v1 + 24);
    swift_bridgeObjectRetain(v9);
    v11 = sub_100012FC4(v8, v9, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v6 + 4, v6 + 12);
    swift_release(v1);
    swift_bridgeObjectRelease(v9);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "🥑 PeopleDataService%s: deinit", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

    swift_release(v1);
  }
  swift_bridgeObjectRelease(*(_QWORD *)(v1 + 24));

  swift_bridgeObjectRelease(*(_QWORD *)(v1 + 48));
  swift_bridgeObjectRelease(*(_QWORD *)(v1 + 64));

  return v1;
}

uint64_t sub_100012114()
{
  uint64_t v0;

  sub_100011F40();
  return swift_deallocClassInstance(v0, 81, 7);
}

uint64_t type metadata accessor for PeopleDataService()
{
  return objc_opt_self(_TtC25FindMyWidgetIntentsPeople17PeopleDataService);
}

uint64_t sub_100012154()
{
  return 0x656C706F6550;
}

uint64_t sub_100012168(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
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
  char v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t result;
  uint64_t v41;
  char *v42;
  _QWORD aBlock[5];
  uint64_t v44;

  v3 = v2;
  v6 = type metadata accessor for InitialTabInfo(0);
  __chkstk_darwin(v6);
  v42 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Locale(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for FMFManagerSubsystem(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (_QWORD *)swift_allocObject(&unk_10001D830, 40, 7);
  v14[2] = v3;
  v14[3] = a1;
  v14[4] = a2;
  v15 = type metadata accessor for FMFSnapshotHandlers(0);
  swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
  swift_retain(v3);
  swift_retain(a2);
  swift_retain(v14);
  v16 = FMFSnapshotHandlers.init(responseFilter:responseHandler:)(0, 0, sub_100012900, v14);
  type metadata accessor for FMFManagerConfiguration(0);
  v17 = swift_retain(v16);
  v18 = static FMFManagerConfiguration.default.getter(v17);
  FMFManagerConfiguration.enabledSubsystems.getter();
  v19 = swift_release(v18);
  v20 = static FMFManagerConfiguration.default.getter(v19);
  FMFManagerConfiguration.preferredLocale.getter();
  v21 = swift_release(v20);
  v22 = static FMFManagerConfiguration.default.getter(v21);
  v23 = FMFManagerConfiguration.cacheDirectory.getter();
  v25 = v24;
  v26 = swift_release(v22);
  v27 = static FMFManagerConfiguration.default.getter(v26);
  v28 = FMFManagerConfiguration.useCache.getter();
  swift_release(v27);
  v29 = FMFManagerConfiguration.__allocating_init(enabledSubsystems:preferredLocale:cacheDirectory:useCache:snapshotHandlers:useOptimizedFetch:disableContactMatching:)(v13, v10, v23, v25, v28 & 1, v16, 0, 0);
  v30 = swift_retain(v29);
  v31 = v42;
  InitialTabInfo.init()(v30);
  v32 = type metadata accessor for FMFManager(0);
  swift_allocObject(v32, *(unsigned int *)(v32 + 48), *(unsigned __int16 *)(v32 + 52));
  v33 = FMFManager.init(configuration:tabInfo:)(v29, v31);
  v34 = dispatch thunk of FMFManager.initialize()();
  dispatch thunk of FMFManager.startRefreshing()(v34);
  v35 = *(NSObject **)(v3 + 40);
  v36 = swift_allocObject(&unk_10001D858, 32, 7);
  *(_QWORD *)(v36 + 16) = v3;
  *(_QWORD *)(v36 + 24) = v33;
  v37 = swift_allocObject(&unk_10001D880, 32, 7);
  *(_QWORD *)(v37 + 16) = sub_100012A4C;
  *(_QWORD *)(v37 + 24) = v36;
  aBlock[4] = sub_10000ECB4;
  v44 = v37;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100011EF8;
  aBlock[3] = &unk_10001D898;
  v38 = _Block_copy(aBlock);
  v39 = v44;
  swift_retain(v3);
  swift_retain(v33);
  swift_retain(v37);
  swift_release(v39);
  dispatch_sync(v35, v38);
  swift_release(v33);
  swift_release(v29);
  swift_release(v16);
  swift_release(v14);
  _Block_release(v38);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation(v37, "", 103, 110, 34, 1);
  swift_release(v36);
  result = swift_release(v37);
  if ((v3 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_1000124DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t), uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  char *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t aBlock[5];
  uint64_t v49;

  v43 = a8;
  v44 = a7;
  v11 = type metadata accessor for DispatchWorkItemFlags(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for DispatchQoS(0);
  v46 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v45 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100021A78 != -1)
    swift_once(&qword_100021A78, sub_10000F108);
  v17 = type metadata accessor for Logger(0);
  sub_10000BF80(v17, (uint64_t)qword_100022F18);
  swift_retain(a6);
  v18 = swift_bridgeObjectRetain(a4);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc(22, -1);
    v41 = v15;
    v22 = v21;
    v23 = swift_slowAlloc(32, -1);
    v42 = v11;
    v39 = v23;
    aBlock[0] = v23;
    *(_DWORD *)v22 = 136315394;
    v40 = a1;
    v24 = *(_QWORD *)(a6 + 16);
    v25 = *(_QWORD *)(a6 + 24);
    swift_bridgeObjectRetain(v25);
    v47 = (_QWORD *)sub_100012FC4(v24, v25, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, aBlock, v22 + 4, v22 + 12);
    swift_release(a6);
    v26 = v25;
    a1 = v40;
    swift_bridgeObjectRelease(v26);
    *(_WORD *)(v22 + 12) = 2048;
    v47 = *(_QWORD **)(a4 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, aBlock, v22 + 14, v22 + 22);
    swift_bridgeObjectRelease(a4);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "🥑 PeopleDataService%s: provided %ld records", (uint8_t *)v22, 0x16u);
    v27 = v39;
    swift_arrayDestroy(v39, 1, (char *)&type metadata for Any + 8);
    v11 = v42;
    swift_slowDealloc(v27, -1, -1);
    v28 = v22;
    v15 = v41;
    swift_slowDealloc(v28, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease(a4);
    v29 = swift_release(a6);
  }
  dispatch thunk of FMFManager.stopRefreshing()(v29);
  aBlock[0] = a4;
  swift_bridgeObjectRetain(a4);
  sub_100013738(aBlock);
  v30 = aBlock[0];
  v44(aBlock[0]);
  swift_release(v30);
  v31 = swift_allocObject(&unk_10001D8D0, 32, 7);
  *(_QWORD *)(v31 + 16) = a6;
  *(_QWORD *)(v31 + 24) = a1;
  aBlock[4] = (uint64_t)sub_1000137E8;
  v49 = v31;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100010F3C;
  aBlock[3] = (uint64_t)&unk_10001D8E8;
  v32 = _Block_copy(aBlock);
  swift_retain(a6);
  v33 = swift_retain(a1);
  v34 = v45;
  static DispatchQoS.unspecified.getter(v33);
  v47 = _swiftEmptyArrayStorage;
  v35 = sub_10000B764((unint64_t *)&qword_1000221A8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v36 = sub_1000097D8(&qword_1000221B0);
  v37 = sub_100011A58();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v47, v36, v37, v11, v35);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v34, v14, v32);
  _Block_release(v32);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v34, v15);
  return swift_release(v49);
}

uint64_t sub_1000128D4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100012900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  return sub_1000124DC(a1, a2, a3, a4, a5, *(_QWORD *)(v5 + 16), *(void (**)(uint64_t))(v5 + 24), *(_QWORD *)(v5 + 32));
}

uint64_t sub_10001290C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  char v8;
  uint64_t result;
  uint64_t v10;
  _BYTE v11[24];
  _BYTE v12[24];

  v4 = a1 + 64;
  swift_beginAccess(a1 + 64, v12, 0, 0);
  v5 = *(_QWORD *)(a1 + 64);
  swift_bridgeObjectRetain(v5);
  v6 = sub_100011CB0(a2, v5);
  v8 = v7;
  result = swift_bridgeObjectRelease(v5);
  if ((v8 & 1) == 0)
  {
    swift_beginAccess(v4, v11, 33, 0);
    v10 = sub_100011DF8(v6);
    swift_endAccess(v11);
    return swift_release(v10);
  }
  return result;
}

uint64_t sub_1000129B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE v10[24];

  swift_beginAccess(a1 + 64, v10, 33, 0);
  v4 = swift_retain(a2);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v4);
  v5 = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(v5 + 0x10);
  v6 = *(_QWORD *)(v5 + 24);
  if (v7 >= v6 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v6 > 1, v7 + 1, 1);
  v8 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v7, a2);
  specialized Array._endMutation()(v8);
  return swift_endAccess(v10);
}

uint64_t sub_100012A4C()
{
  uint64_t v0;

  return sub_1000129B0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_100012A54()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100012A64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100012A74(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_100012A7C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;

  v8 = type metadata accessor for WidgetFamily(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a1 + 16);
  if (v12)
  {
    v13 = *(_QWORD *)(type metadata accessor for FMFFriend(0) - 8);
    v14 = a1 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
    v18 = *(_QWORD *)(v13 + 72);
    v15 = enum case for WidgetFamily.systemSmall(_:);
    v17 = a1;
    swift_bridgeObjectRetain(a1);
    do
    {
      dispatch_group_enter(a2);
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 104))(v11, v15, v8);
      swift_retain(a4);
      v16 = a2;
      sub_100015598(v14, (uint64_t)v11, 0, a3, a4, v16);
      swift_release(a4);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      v14 += v18;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease(v17);
  }
  dispatch_group_leave(a2);
}

void sub_100012BCC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  unint64_t *v10;
  unint64_t v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  _BYTE v16[24];

  v6 = type metadata accessor for FriendModel(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v10 = (unint64_t *)(a2 + 16);
  sub_10000B598(a1, (uint64_t)v9);
  swift_beginAccess(a2 + 16, v16, 33, 0);
  v11 = *(_QWORD *)(a2 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v11);
  *(_QWORD *)(a2 + 16) = v11;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v11 = sub_100012D4C(0, *(_QWORD *)(v11 + 16) + 1, 1, v11);
    *v10 = v11;
  }
  v14 = *(_QWORD *)(v11 + 16);
  v13 = *(_QWORD *)(v11 + 24);
  if (v14 >= v13 >> 1)
  {
    v11 = sub_100012D4C(v13 > 1, v14 + 1, 1, v11);
    *v10 = v11;
  }
  *(_QWORD *)(v11 + 16) = v14 + 1;
  sub_100011C14((uint64_t)v9, v11+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v14);
  swift_endAccess(v16);
  dispatch_group_leave(a3);
}

uint64_t sub_100012D08(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100012D18(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100012D4C(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
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
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
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
    v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_1000097D8(&qword_1000223A0);
  v11 = *(_QWORD *)(type metadata accessor for FriendModel(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
    goto LABEL_29;
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = *(_QWORD *)(type metadata accessor for FriendModel(0) - 8);
  v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v20 = (unint64_t)v15 + v19;
  if ((a1 & 1) != 0)
  {
    v21 = a4 + v19;
    if ((unint64_t)v15 < a4 || v20 >= v21 + *(_QWORD *)(v18 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v19, v21);
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v19, v21);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_100015480(0, v8, v20, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

uint64_t sub_100012F54(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v6 = a4();
  v8 = v7;
  v9 = sub_100012FC4(v6, v7, a3);
  v10 = *a1;
  v11 = *a1 + 8;
  v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10, v11);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t sub_100012FC4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100013094(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000137F0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1000137F0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000B494(v12);
  return v7;
}

uint64_t sub_100013094(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_10001324C(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_10001324C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_1000132E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000134B8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000134B8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_1000132E0(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_100013454(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100013454(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_1000097D8(&qword_100022378);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000134B8(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
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
    v10 = sub_1000097D8(&qword_100022378);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

_BYTE **sub_100013604(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void *sub_100013614(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawBufferPointer.copyMemory source has too many elements", 69, 2, "Swift/UnsafeRawBufferPointer.swift", 34, 2, 487, 0);
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_1000136A8@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_1000136D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v4 = a1;
    else
      v4 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v4);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

Swift::Int sub_100013738(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  Swift::Int result;
  uint64_t v6[2];

  v2 = *(_QWORD *)(type metadata accessor for FMFFriend(0) - 8);
  v3 = (_QWORD *)*a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v3 = (_QWORD *)sub_10001546C(v3);
  v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_100013830(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_1000137BC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000137E8()
{
  uint64_t v0;

  return sub_10001290C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1000137F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

Swift::Int sub_100013830(uint64_t *a1)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  Swift::Int v23;
  Swift::Int result;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t, char *);
  char *v30;
  unint64_t v31;
  Swift::Int v32;
  char *v33;
  uint64_t v34;
  Swift::Int v35;
  void (*v36)(char *, uint64_t, uint64_t);
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BOOL4 v49;
  Swift::Int v50;
  uint64_t v51;
  char *v52;
  void (*v53)(char *, uint64_t);
  uint64_t v54;
  Swift::Int v55;
  Swift::Int v56;
  uint64_t (*v57)(char *, uint64_t, uint64_t);
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  Swift::Int v74;
  Swift::Int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  Swift::Int v80;
  unint64_t v81;
  uint64_t v82;
  char *v83;
  Swift::Int v84;
  Swift::Int v85;
  uint64_t v86;
  void (*v87)(char *, uint64_t, uint64_t, char *);
  uint64_t v88;
  void (*v89)(char *, uint64_t, uint64_t, char *);
  uint64_t v90;
  uint64_t (*v91)(char *, uint64_t, uint64_t);
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  _BOOL4 v104;
  uint64_t v105;
  void (*v106)(char *, uint64_t);
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  void (*v111)(char *, uint64_t, uint64_t);
  char *v112;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v114;
  unint64_t v115;
  char *v116;
  char *v117;
  void (*v118)(char *, uint64_t, uint64_t, char *);
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  BOOL v130;
  unint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  BOOL v140;
  uint64_t v141;
  char v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  BOOL v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  char *v159;
  char *v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  uint64_t v170;
  uint64_t v171;
  char *v172;
  unint64_t v173;
  _QWORD *v174;
  _QWORD *v175;
  char *v176;
  Swift::Int v177;
  char *v178;
  char *v179;
  char *v180;
  uint64_t v181;
  char *v182;
  char *v183;
  Swift::Int v184;
  unint64_t v185;
  uint64_t v186;
  char *v187;
  Swift::Int v188;
  char *v189;
  char *v190;
  Swift::Int v191;
  uint64_t (*v192)(char *, uint64_t, uint64_t);
  void (*v193)(char *, uint64_t, uint64_t, char *);
  char *v194;
  Swift::Int v195;
  uint64_t v196;
  uint64_t *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;

  v2 = sub_1000097D8(&qword_100022388);
  __chkstk_darwin(v2);
  v187 = (char *)&v175 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for FMFFriend(0);
  v202 = *(_QWORD *)(v4 - 8);
  v5 = __chkstk_darwin(v4);
  v183 = (char *)&v175 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v5);
  v194 = (char *)&v175 - v8;
  v9 = __chkstk_darwin(v7);
  v189 = (char *)&v175 - v10;
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v175 - v12;
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v175 - v15;
  v17 = __chkstk_darwin(v14);
  v178 = (char *)&v175 - v18;
  v19 = __chkstk_darwin(v17);
  v179 = (char *)&v175 - v20;
  __chkstk_darwin(v19);
  v22 = (char *)&v175 - v21;
  v197 = a1;
  v23 = a1[1];
  result = _minimumMergeRunLength(_:)(v23);
  if (result >= v23)
  {
    if (v23 < 0)
      goto LABEL_151;
    if (v23)
      return sub_1000145D0(0, v23, 1, v197);
    return result;
  }
  if (v23 >= 0)
    v25 = v23;
  else
    v25 = v23 + 1;
  if (v23 < -1)
    goto LABEL_159;
  v177 = result;
  if (v23 < 2)
  {
    v185 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v202 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v202 + 80));
    v175 = _swiftEmptyArrayStorage;
    if (v23 != 1)
    {
      v31 = _swiftEmptyArrayStorage[2];
      v30 = (char *)_swiftEmptyArrayStorage;
LABEL_117:
      v167 = v186;
      if (v31 >= 2)
      {
        v168 = *v197;
        do
        {
          v169 = v31 - 2;
          if (v31 < 2)
            goto LABEL_146;
          if (!v168)
            goto LABEL_158;
          v159 = v30;
          v170 = *(_QWORD *)&v30[16 * v169 + 32];
          v171 = *(_QWORD *)&v30[16 * v31 + 24];
          sub_100014934(v168 + *(_QWORD *)(v202 + 72) * v170, v168 + *(_QWORD *)(v202 + 72) * *(_QWORD *)&v30[16 * v31 + 16], v168 + *(_QWORD *)(v202 + 72) * v171, v185);
          if (v167)
            goto LABEL_114;
          if (v171 < v170)
            goto LABEL_147;
          if ((swift_isUniquelyReferenced_nonNull_native(v159) & 1) == 0)
            v159 = sub_100015278((uint64_t)v159);
          if (v169 >= *((_QWORD *)v159 + 2))
            goto LABEL_148;
          v172 = &v159[16 * v169 + 32];
          *(_QWORD *)v172 = v170;
          *((_QWORD *)v172 + 1) = v171;
          v173 = *((_QWORD *)v159 + 2);
          if (v31 > v173)
            goto LABEL_149;
          memmove(&v159[16 * v31 + 16], &v159[16 * v31 + 32], 16 * (v173 - v31));
          v30 = v159;
          *((_QWORD *)v159 + 2) = v173 - 1;
          v31 = v173 - 1;
        }
        while (v173 > 2);
      }
      v166 = v30;
LABEL_129:
      swift_bridgeObjectRelease(v166);
      v174 = v175;
      v175[2] = 0;
      return swift_bridgeObjectRelease(v174);
    }
    v176 = v22;
    v182 = v16;
  }
  else
  {
    v176 = v22;
    v182 = v16;
    v26 = v25 >> 1;
    v27 = static Array._allocateBufferUninitialized(minimumCapacity:)(v25 >> 1, v4);
    *(_QWORD *)(v27 + 16) = v26;
    v28 = *(unsigned __int8 *)(v202 + 80);
    v175 = (_QWORD *)v27;
    v185 = v27 + ((v28 + 32) & ~v28);
  }
  v29 = 0;
  v30 = (char *)_swiftEmptyArrayStorage;
  v196 = v4;
  v190 = v13;
  while (1)
  {
    v32 = (Swift::Int)v29;
    v33 = (char *)v29 + 1;
    v180 = v30;
    v184 = (Swift::Int)v29;
    if ((uint64_t)v29 + 1 >= v23)
    {
      v50 = (Swift::Int)v29 + 1;
      goto LABEL_66;
    }
    v34 = *v197;
    v35 = *(_QWORD *)(v202 + 72);
    v36 = *(void (**)(char *, uint64_t, uint64_t))(v202 + 16);
    v37 = v176;
    v36(v176, *v197 + v35 * (_QWORD)v33, v4);
    v181 = v34;
    v195 = v35;
    v38 = v179;
    v192 = (uint64_t (*)(char *, uint64_t, uint64_t))v36;
    v39 = ((uint64_t (*)(char *, uint64_t, uint64_t))v36)(v179, v34 + v35 * v32, v4);
    v40 = FMFFriend.favoriteOrder.getter(v39);
    v41 = FMFFriend.favoriteOrder.getter(v40);
    if (v40 == v41)
    {
      v200 = FMFFriend.name.getter();
      v201 = v42;
      v198 = FMFFriend.name.getter();
      v199 = v43;
      v44 = type metadata accessor for Locale(0);
      v45 = v187;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v187, 1, 1, v44);
      v46 = sub_10000D3D8();
      v47 = StringProtocol.compare<A>(_:options:range:locale:)(&v198, 1, 0, 0, 1, v45, &type metadata for String, &type metadata for String, v46, v46);
      v48 = (uint64_t)v45;
      v38 = v179;
      sub_100009A04(v48, &qword_100022388);
      swift_bridgeObjectRelease(v199);
      swift_bridgeObjectRelease(v201);
      v49 = v47 == -1;
    }
    else
    {
      v51 = FMFFriend.favoriteOrder.getter(v41);
      v49 = v51 < FMFFriend.favoriteOrder.getter(v51);
    }
    LODWORD(v193) = v49;
    v52 = v178;
    v53 = *(void (**)(char *, uint64_t))(v202 + 8);
    v53(v38, v4);
    v53(v37, v4);
    v50 = v184 + 2;
    if (v184 + 2 < v23)
    {
      v191 = v195 * (_QWORD)v33;
      v54 = v181;
      v188 = v195 * v50;
      while (1)
      {
        v55 = v23;
        v56 = v50;
        v57 = v192;
        v192(v52, v54 + v188, v4);
        v58 = v52;
        v59 = v182;
        v60 = v57(v182, v54 + v191, v4);
        v61 = FMFFriend.favoriteOrder.getter(v60);
        v62 = FMFFriend.favoriteOrder.getter(v61);
        if (v61 == v62)
        {
          v200 = FMFFriend.name.getter();
          v201 = v63;
          v198 = FMFFriend.name.getter();
          v199 = v64;
          v65 = type metadata accessor for Locale(0);
          v66 = v187;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 56))(v187, 1, 1, v65);
          v67 = sub_10000D3D8();
          v68 = StringProtocol.compare<A>(_:options:range:locale:)(&v198, 1, 0, 0, 1, v66, &type metadata for String, &type metadata for String, v67, v67);
          v69 = (uint64_t)v66;
          v4 = v196;
          sub_100009A04(v69, &qword_100022388);
          swift_bridgeObjectRelease(v199);
          swift_bridgeObjectRelease(v201);
          v70 = v68 == -1;
        }
        else
        {
          v71 = FMFFriend.favoriteOrder.getter(v62);
          v70 = v71 < FMFFriend.favoriteOrder.getter(v71);
        }
        v53(v59, v4);
        v53(v58, v4);
        v50 = v56;
        if ((_DWORD)v193 != v70)
          break;
        v52 = v58;
        v50 = v56 + 1;
        v54 += v195;
        v23 = v55;
        if (v55 == v50)
        {
          v50 = v55;
          goto LABEL_30;
        }
      }
      v23 = v55;
    }
LABEL_30:
    v30 = v180;
    v32 = v184;
    if (!(_DWORD)v193)
      break;
    if (v50 < v184)
      goto LABEL_152;
    if (v184 >= v50)
      break;
    v192 = (uint64_t (*)(char *, uint64_t, uint64_t))v23;
    v72 = 0;
    v73 = v195 * (v50 - 1);
    v74 = v50 * v195;
    v75 = v184;
    v76 = v184 * v195;
    do
    {
      if (v75 != v50 + v72 - 1)
      {
        v79 = v181;
        if (!v181)
          goto LABEL_157;
        v80 = v50;
        v81 = v181 + v76;
        v82 = v181 + v73;
        v193 = *(void (**)(char *, uint64_t, uint64_t, char *))(v202 + 32);
        v193(v183, v181 + v76, v196, v30);
        if (v76 < v73 || v81 >= v79 + v74)
        {
          v77 = v79 + v76;
          v78 = v79 + v73;
          v4 = v196;
          swift_arrayInitWithTakeFrontToBack(v77, v78);
        }
        else
        {
          v4 = v196;
          if (v76 != v73)
            swift_arrayInitWithTakeBackToFront(v81, v82);
        }
        ((void (*)(uint64_t, char *, uint64_t))v193)(v82, v183, v4);
        v30 = v180;
        v50 = v80;
      }
      ++v75;
      --v72;
      v73 -= v195;
      v74 -= v195;
      v76 += v195;
    }
    while (v75 < v50 + v72);
    v83 = v190;
    v32 = v184;
    v23 = (Swift::Int)v192;
    if (v50 < (uint64_t)v192)
      goto LABEL_46;
LABEL_66:
    if (v50 < v32)
      goto LABEL_145;
    v112 = v30;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v30);
    v193 = (void (*)(char *, uint64_t, uint64_t, char *))v50;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      v30 = v112;
    else
      v30 = sub_100015074(0, *((_QWORD *)v112 + 2) + 1, 1, v112);
    v115 = *((_QWORD *)v30 + 2);
    v114 = *((_QWORD *)v30 + 3);
    v31 = v115 + 1;
    if (v115 >= v114 >> 1)
      v30 = sub_100015074((char *)(v114 > 1), v115 + 1, 1, v30);
    *((_QWORD *)v30 + 2) = v31;
    v116 = v30 + 32;
    v117 = &v30[16 * v115 + 32];
    v118 = v193;
    *(_QWORD *)v117 = v32;
    *((_QWORD *)v117 + 1) = v118;
    if (v115)
    {
      while (1)
      {
        v119 = v31 - 1;
        if (v31 >= 4)
        {
          v124 = &v116[16 * v31];
          v125 = *((_QWORD *)v124 - 8);
          v126 = *((_QWORD *)v124 - 7);
          v130 = __OFSUB__(v126, v125);
          v127 = v126 - v125;
          if (v130)
            goto LABEL_134;
          v129 = *((_QWORD *)v124 - 6);
          v128 = *((_QWORD *)v124 - 5);
          v130 = __OFSUB__(v128, v129);
          v122 = v128 - v129;
          v123 = v130;
          if (v130)
            goto LABEL_135;
          v131 = v31 - 2;
          v132 = &v116[16 * v31 - 32];
          v134 = *(_QWORD *)v132;
          v133 = *((_QWORD *)v132 + 1);
          v130 = __OFSUB__(v133, v134);
          v135 = v133 - v134;
          if (v130)
            goto LABEL_137;
          v130 = __OFADD__(v122, v135);
          v136 = v122 + v135;
          if (v130)
            goto LABEL_140;
          if (v136 >= v127)
          {
            v154 = &v116[16 * v119];
            v156 = *(_QWORD *)v154;
            v155 = *((_QWORD *)v154 + 1);
            v130 = __OFSUB__(v155, v156);
            v157 = v155 - v156;
            if (v130)
              goto LABEL_144;
            v147 = v122 < v157;
            goto LABEL_103;
          }
        }
        else
        {
          if (v31 != 3)
          {
            v148 = *((_QWORD *)v30 + 4);
            v149 = *((_QWORD *)v30 + 5);
            v130 = __OFSUB__(v149, v148);
            v141 = v149 - v148;
            v142 = v130;
            goto LABEL_97;
          }
          v121 = *((_QWORD *)v30 + 4);
          v120 = *((_QWORD *)v30 + 5);
          v130 = __OFSUB__(v120, v121);
          v122 = v120 - v121;
          v123 = v130;
        }
        if ((v123 & 1) != 0)
          goto LABEL_136;
        v131 = v31 - 2;
        v137 = &v116[16 * v31 - 32];
        v139 = *(_QWORD *)v137;
        v138 = *((_QWORD *)v137 + 1);
        v140 = __OFSUB__(v138, v139);
        v141 = v138 - v139;
        v142 = v140;
        if (v140)
          goto LABEL_139;
        v143 = &v116[16 * v119];
        v145 = *(_QWORD *)v143;
        v144 = *((_QWORD *)v143 + 1);
        v130 = __OFSUB__(v144, v145);
        v146 = v144 - v145;
        if (v130)
          goto LABEL_142;
        if (__OFADD__(v141, v146))
          goto LABEL_143;
        if (v141 + v146 >= v122)
        {
          v147 = v122 < v146;
LABEL_103:
          if (v147)
            v119 = v131;
          goto LABEL_105;
        }
LABEL_97:
        if ((v142 & 1) != 0)
          goto LABEL_138;
        v150 = &v116[16 * v119];
        v152 = *(_QWORD *)v150;
        v151 = *((_QWORD *)v150 + 1);
        v130 = __OFSUB__(v151, v152);
        v153 = v151 - v152;
        if (v130)
          goto LABEL_141;
        if (v153 < v141)
          goto LABEL_15;
LABEL_105:
        v158 = v119 - 1;
        if (v119 - 1 >= v31)
        {
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
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        if (!*v197)
          goto LABEL_156;
        v159 = v30;
        v160 = &v116[16 * v158];
        v161 = *(_QWORD *)v160;
        v162 = &v116[16 * v119];
        v163 = *((_QWORD *)v162 + 1);
        v164 = v186;
        sub_100014934(*v197 + *(_QWORD *)(v202 + 72) * *(_QWORD *)v160, *v197 + *(_QWORD *)(v202 + 72) * *(_QWORD *)v162, *v197 + *(_QWORD *)(v202 + 72) * v163, v185);
        v186 = v164;
        if (v164)
        {
LABEL_114:
          v166 = v159;
          goto LABEL_129;
        }
        if (v163 < v161)
          goto LABEL_131;
        if (v119 > *((_QWORD *)v159 + 2))
          goto LABEL_132;
        *(_QWORD *)v160 = v161;
        *(_QWORD *)&v116[16 * v158 + 8] = v163;
        v165 = *((_QWORD *)v159 + 2);
        if (v119 >= v165)
          goto LABEL_133;
        v31 = v165 - 1;
        memmove(&v116[16 * v119], v162 + 16, 16 * (v165 - 1 - v119));
        v30 = v159;
        *((_QWORD *)v159 + 2) = v165 - 1;
        if (v165 <= 2)
          goto LABEL_15;
      }
    }
    v31 = 1;
LABEL_15:
    v23 = v197[1];
    v29 = v193;
    if ((uint64_t)v193 >= v23)
      goto LABEL_117;
  }
  v83 = v190;
  if (v50 >= v23)
    goto LABEL_66;
LABEL_46:
  if (__OFSUB__(v50, v32))
    goto LABEL_150;
  if (v50 - v32 >= v177)
    goto LABEL_66;
  if (__OFADD__(v32, v177))
    goto LABEL_153;
  if (v32 + v177 >= v23)
    v84 = v23;
  else
    v84 = v32 + v177;
  if (v84 >= v32)
  {
    if (v50 != v84)
    {
      v85 = *(_QWORD *)(v202 + 72);
      v188 = *(_QWORD *)(v202 + 16);
      v86 = v85 * (v50 - 1);
      v191 = v85;
      v195 = v50 * v85;
      v181 = v84;
      do
      {
        v88 = 0;
        v89 = (void (*)(char *, uint64_t, uint64_t, char *))v32;
        v192 = (uint64_t (*)(char *, uint64_t, uint64_t))v86;
        v193 = (void (*)(char *, uint64_t, uint64_t, char *))v50;
        while (1)
        {
          v90 = *v197;
          v91 = (uint64_t (*)(char *, uint64_t, uint64_t))v188;
          ((void (*)(char *, Swift::Int, uint64_t, char *))v188)(v83, v195 + v88 + *v197, v4, v30);
          v92 = v4;
          v93 = v189;
          v94 = v91(v189, v86 + v88 + v90, v92);
          v95 = FMFFriend.favoriteOrder.getter(v94);
          v96 = FMFFriend.favoriteOrder.getter(v95);
          if (v95 == v96)
          {
            v200 = FMFFriend.name.getter();
            v201 = v97;
            v198 = FMFFriend.name.getter();
            v199 = v98;
            v99 = type metadata accessor for Locale(0);
            v100 = v83;
            v101 = (uint64_t)v187;
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v99 - 8) + 56))(v187, 1, 1, v99);
            v102 = sub_10000D3D8();
            v103 = StringProtocol.compare<A>(_:options:range:locale:)(&v198, 1, 0, 0, 1, v101, &type metadata for String, &type metadata for String, v102, v102);
            sub_100009A04(v101, &qword_100022388);
            swift_bridgeObjectRelease(v199);
            swift_bridgeObjectRelease(v201);
            v104 = v103 == -1;
          }
          else
          {
            v105 = FMFFriend.favoriteOrder.getter(v96);
            v104 = v105 < FMFFriend.favoriteOrder.getter(v105);
            v100 = v83;
          }
          v106 = *(void (**)(char *, uint64_t))(v202 + 8);
          v107 = v196;
          v106(v93, v196);
          v106(v100, v107);
          if (!v104)
            break;
          v108 = *v197;
          v86 = (uint64_t)v192;
          if (!*v197)
            goto LABEL_155;
          v109 = v108 + v195 + v88;
          v110 = (char *)v192 + v108 + v88;
          v111 = *(void (**)(char *, uint64_t, uint64_t))(v202 + 32);
          v4 = v196;
          v111(v194, v109, v196);
          swift_arrayInitWithTakeFrontToBack(v109, v110);
          v111(v110, (uint64_t)v194, v4);
          v83 = v190;
          v88 -= v191;
          v89 = (void (*)(char *, uint64_t, uint64_t, char *))((char *)v89 + 1);
          v87 = v193;
          if (v193 == v89)
            goto LABEL_56;
        }
        v4 = v196;
        v83 = v190;
        v86 = (uint64_t)v192;
        v87 = v193;
LABEL_56:
        v50 = (Swift::Int)v87 + 1;
        v86 += v191;
        v195 += v191;
        v32 = v184;
      }
      while (v50 != v181);
      v50 = v181;
      v30 = v180;
    }
    goto LABEL_66;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000145D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _BOOL4 v33;
  uint64_t v34;
  BOOL v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t (*v45)(char *, uint64_t, uint64_t);
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v50 = a4;
  v43 = a1;
  v6 = sub_1000097D8(&qword_100022388);
  __chkstk_darwin(v6);
  v44 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for FMFFriend(0);
  v51 = *(_QWORD **)(v8 - 8);
  v9 = __chkstk_darwin(v8);
  v49 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v46 = (char *)&v41 - v12;
  result = __chkstk_darwin(v11);
  v15 = (char *)&v41 - v14;
  v48 = a3;
  v42 = a2;
  if (a3 != a2)
  {
    v16 = v51[9];
    v45 = (uint64_t (*)(char *, uint64_t, uint64_t))v51[2];
    v57 = v16 * (v48 - 1);
    v47 = v16;
    v52 = v16 * v48;
LABEL_5:
    v17 = 0;
    v18 = v43;
    while (1)
    {
      v19 = *v50;
      v20 = v45;
      v45(v15, v52 + v17 + *v50, v8);
      v21 = v57 + v17 + v19;
      v22 = v46;
      v23 = v20(v46, v21, v8);
      v24 = FMFFriend.favoriteOrder.getter(v23);
      v25 = FMFFriend.favoriteOrder.getter(v24);
      if (v24 == v25)
      {
        v55 = FMFFriend.name.getter();
        v56 = v26;
        v53 = FMFFriend.name.getter();
        v54 = v27;
        v28 = type metadata accessor for Locale(0);
        v29 = v22;
        v30 = (uint64_t)v44;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v44, 1, 1, v28);
        v31 = sub_10000D3D8();
        v32 = StringProtocol.compare<A>(_:options:range:locale:)(&v53, 1, 0, 0, 1, v30, &type metadata for String, &type metadata for String, v31, v31);
        sub_100009A04(v30, &qword_100022388);
        swift_bridgeObjectRelease(v54);
        swift_bridgeObjectRelease(v56);
        v33 = v32 == -1;
      }
      else
      {
        v34 = FMFFriend.favoriteOrder.getter(v25);
        v35 = v34 < FMFFriend.favoriteOrder.getter(v34);
        v29 = v22;
        v33 = v35;
      }
      v36 = (void (*)(char *, uint64_t))v51[1];
      v36(v29, v8);
      result = ((uint64_t (*)(char *, uint64_t))v36)(v15, v8);
      if (!v33)
      {
LABEL_4:
        v57 += v47;
        v52 += v47;
        if (++v48 == v42)
          return result;
        goto LABEL_5;
      }
      v37 = *v50;
      if (!*v50)
        break;
      v38 = v37 + v52 + v17;
      v39 = v37 + v57 + v17;
      v40 = (void (*)(char *, uint64_t, uint64_t))v51[4];
      v40(v49, v38, v8);
      swift_arrayInitWithTakeFrontToBack(v38, v39);
      result = ((uint64_t (*)(uint64_t, char *, uint64_t))v40)(v39, v49, v8);
      v17 -= v47;
      if (v48 == ++v18)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_100014934(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void (*v30)(char *, unint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t result;
  uint64_t v49;
  uint64_t (*v50)(char *, unint64_t, uint64_t);
  char *v51;
  uint64_t (*v52)(char *, unint64_t, uint64_t);
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  _BOOL4 v63;
  uint64_t v64;
  char *v65;
  unint64_t v66;
  unint64_t v67;
  void (*v68)(void);
  char *v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t (*v81)(char *, unint64_t, uint64_t);
  unint64_t v82;
  char *v83;
  char *v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;

  v8 = sub_1000097D8(&qword_100022388);
  __chkstk_darwin(v8);
  v84 = (char *)&v78 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for FMFFriend(0);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v83 = (char *)&v78 - v15;
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v78 - v17;
  __chkstk_darwin(v16);
  v20 = (char *)&v78 - v19;
  v22 = *(_QWORD *)(v21 + 72);
  v86 = v21;
  v87 = v22;
  if (!v22)
  {
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  if (a2 - a1 == 0x8000000000000000 && v87 == -1)
    goto LABEL_71;
  v23 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v87 == -1)
    goto LABEL_72;
  v24 = (uint64_t)(a2 - a1) / v87;
  v94 = a1;
  v93 = a4;
  v25 = v23 / v87;
  if (v24 >= v23 / v87)
  {
    if (v25 < 0)
      goto LABEL_73;
    v27 = v25 * v87;
    if (a4 < a2 || a2 + v27 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack(a4, a2);
    }
    else if (a4 != a2)
    {
      swift_arrayInitWithTakeBackToFront(a4, a2);
    }
    v46 = a4 + v27;
    v92 = a4 + v27;
    v94 = a2;
    v82 = a1;
    if (v27 < 1 || a1 >= a2)
      goto LABEL_48;
    v49 = -v87;
    v50 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v86 + 16);
    v80 = a4;
    v81 = v50;
    v87 = v10;
    v79 = v49;
    v51 = v83;
    while (1)
    {
      v52 = v81;
      v81(v51, v46 + v49, v10);
      v53 = a2 + v49;
      v54 = v52(v13, a2 + v49, v10);
      v55 = FMFFriend.favoriteOrder.getter(v54);
      v56 = FMFFriend.favoriteOrder.getter(v55);
      v85 = a2;
      if (v55 == v56)
      {
        v90 = FMFFriend.name.getter();
        v91 = v57;
        v88 = FMFFriend.name.getter();
        v89 = v58;
        v59 = type metadata accessor for Locale(0);
        v60 = (uint64_t)v84;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 56))(v84, 1, 1, v59);
        v61 = sub_10000D3D8();
        v62 = StringProtocol.compare<A>(_:options:range:locale:)(&v88, 1, 0, 0, 1, v60, &type metadata for String, &type metadata for String, v61, v61);
        sub_100009A04(v60, &qword_100022388);
        swift_bridgeObjectRelease(v89);
        swift_bridgeObjectRelease(v91);
        v63 = v62 == -1;
      }
      else
      {
        v64 = FMFFriend.favoriteOrder.getter(v56);
        v63 = v64 < FMFFriend.favoriteOrder.getter(v64);
      }
      v65 = v13;
      v66 = a3;
      v67 = a3 + v49;
      v68 = *(void (**)(void))(v86 + 8);
      v69 = v65;
      v70 = v49;
      v71 = v87;
      v68();
      ((void (*)(char *, uint64_t))v68)(v51, v71);
      if (v63)
        break;
      v73 = v92;
      v74 = v92 + v70;
      v92 += v70;
      if (v66 < v73 || v67 >= v73)
      {
        v75 = v87;
        swift_arrayInitWithTakeFrontToBack(v67, v74);
        v53 = v85;
LABEL_64:
        v13 = v69;
        v10 = v75;
        v49 = v79;
LABEL_65:
        v77 = v80;
        goto LABEL_66;
      }
      v53 = v85;
      if (v66 != v73)
      {
        v75 = v87;
        swift_arrayInitWithTakeBackToFront(v67, v74);
        goto LABEL_64;
      }
      v49 = v70;
      v13 = v69;
      v77 = v80;
      v10 = v87;
LABEL_66:
      v46 = v92;
      if (v92 > v77)
      {
        a2 = v53;
        a3 = v67;
        if (v53 > v82)
          continue;
      }
      goto LABEL_48;
    }
    if (v66 < v85 || v67 >= v85)
    {
      v76 = v87;
      swift_arrayInitWithTakeFrontToBack(v67, v53);
      v13 = v69;
      v10 = v76;
      v49 = v79;
    }
    else
    {
      v72 = v66 == v85;
      v13 = v69;
      v10 = v87;
      v49 = v79;
      if (!v72)
        swift_arrayInitWithTakeBackToFront(v67, v53);
    }
    v94 += v49;
    goto LABEL_65;
  }
  if ((v24 & 0x8000000000000000) == 0)
  {
    v26 = v24 * v87;
    v85 = a3;
    if (a4 < a1 || a1 + v26 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack(a4, a1);
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront(a4, a1);
    }
    v28 = a4 + v26;
    v92 = a4 + v26;
    if (v26 >= 1 && a2 < v85)
    {
      v30 = *(void (**)(char *, unint64_t, uint64_t))(v86 + 16);
      do
      {
        v30(v20, a2, v10);
        v31 = ((uint64_t (*)(char *, unint64_t, uint64_t))v30)(v18, a4, v10);
        v32 = FMFFriend.favoriteOrder.getter(v31);
        v33 = FMFFriend.favoriteOrder.getter(v32);
        if (v32 == v33)
        {
          v90 = FMFFriend.name.getter();
          v91 = v34;
          v88 = FMFFriend.name.getter();
          v89 = v35;
          v36 = type metadata accessor for Locale(0);
          v37 = (uint64_t)v84;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v84, 1, 1, v36);
          v38 = sub_10000D3D8();
          v39 = StringProtocol.compare<A>(_:options:range:locale:)(&v88, 1, 0, 0, 1, v37, &type metadata for String, &type metadata for String, v38, v38);
          sub_100009A04(v37, &qword_100022388);
          swift_bridgeObjectRelease(v89);
          swift_bridgeObjectRelease(v91);
          v40 = v39 == -1;
        }
        else
        {
          v41 = FMFFriend.favoriteOrder.getter(v33);
          v40 = v41 < FMFFriend.favoriteOrder.getter(v41);
        }
        v42 = *(void (**)(char *, uint64_t))(v86 + 8);
        v42(v18, v10);
        v42(v20, v10);
        v43 = v94;
        if (v40)
        {
          v44 = a2 + v87;
          if (v94 < a2 || v94 >= v44)
          {
            swift_arrayInitWithTakeFrontToBack(v94, a2);
          }
          else if (v94 == a2)
          {
            v43 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront(v94, a2);
          }
        }
        else
        {
          v45 = v93 + v87;
          if (v94 < v93 || v94 >= v45)
          {
            swift_arrayInitWithTakeFrontToBack(v94, v93);
          }
          else if (v94 != v93)
          {
            swift_arrayInitWithTakeBackToFront(v94, v93);
          }
          v93 = v45;
          v44 = a2;
        }
        v94 = v43 + v87;
        a4 = v93;
        if (v93 >= v28)
          break;
        a2 = v44;
      }
      while (v44 < v85);
    }
LABEL_48:
    sub_10001516C(&v94, &v93, (uint64_t *)&v92);
    return 1;
  }
LABEL_73:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

char *sub_100015074(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

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
    v10 = sub_1000097D8(&qword_100022390);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 16 * v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

uint64_t sub_10001516C(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for FMFFriend(0);
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack(v3, v4);
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront(v3, v4);
  return result;
}

char *sub_100015278(uint64_t a1)
{
  return sub_100015074(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10001528C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_1000097D8(&qword_100022398);
  v11 = *(_QWORD *)(type metadata accessor for FMFFriend(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_34;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = *(_QWORD *)(type metadata accessor for FMFFriend(0) - 8);
  v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v20 = (char *)v15 + v19;
  v21 = (char *)a4 + v19;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v20 >= &v21[*(_QWORD *)(v18 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v20, v21);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v20, v21);
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v22 = *(_QWORD *)(v18 + 72) * v8;
  v23 = &v20[v22];
  v24 = (unint64_t)&v21[v22];
  if (v21 >= v23 || (unint64_t)v20 >= v24)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10001546C(_QWORD *a1)
{
  return sub_10001528C(0, a1[2], 0, a1);
}

uint64_t sub_100015480(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v8 = *(_QWORD *)(type metadata accessor for FriendModel(0) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v8 + 72);
  v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  v12 = v10 * v4;
  v13 = a3 + v12;
  v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100015598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, NSObject *a6)
{
  uint64_t v9;
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
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  int v39;
  id v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  _QWORD v51[2];
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;

  v56 = a5;
  v57 = a6;
  v9 = type metadata accessor for FMFFriend(0);
  v52 = *(_QWORD *)(v9 - 8);
  v53 = v9;
  __chkstk_darwin(v9);
  v11 = (char *)v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for FriendModel(0);
  __chkstk_darwin(v12);
  v14 = (char *)v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1000097D8(&qword_100021D40);
  v16 = __chkstk_darwin(v15);
  v18 = (char *)v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = FMFFriend.name.getter(v16);
  v54 = a1;
  v55 = v19;
  v21 = v20;
  FMFFriend.location.getter(v19);
  v22 = type metadata accessor for FMFLocation(0);
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v18, 1, v22) == 1)
  {
    sub_100009A04((uint64_t)v18, &qword_100021D40);
  }
  else
  {
    v24 = (void *)FMFLocation.location.getter();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v18, v22);

  }
  if (qword_100021A78 != -1)
    swift_once(&qword_100021A78, sub_10000F108);
  v25 = type metadata accessor for Logger(0);
  v26 = sub_10000BF80(v25, (uint64_t)qword_100022F18);
  swift_retain_n(a4, 2);
  v27 = swift_bridgeObjectRetain_n(v21, 2);
  v51[1] = v26;
  v28 = Logger.logObject.getter(v27);
  v29 = static os_log_type_t.default.getter();
  v30 = os_log_type_enabled(v28, v29);
  v58 = v14;
  if (v30)
  {
    v31 = swift_slowAlloc(22, -1);
    v32 = swift_slowAlloc(64, -1);
    v60 = v32;
    *(_DWORD *)v31 = 136315394;
    v51[0] = v11;
    v33 = a3;
    v34 = v21;
    v35 = *(_QWORD *)(a4 + 16);
    v36 = *(_QWORD *)(a4 + 24);
    swift_bridgeObjectRetain(v36);
    v59 = sub_100012FC4(v35, v36, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v31 + 4, v31 + 12);
    swift_release_n(a4, 2);
    v37 = v36;
    v21 = v34;
    swift_bridgeObjectRelease(v37);
    *(_WORD *)(v31 + 12) = 2080;
    swift_bridgeObjectRetain(v34);
    v59 = sub_100012FC4(v55, v34, &v60);
    a3 = v33;
    v11 = (char *)v51[0];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v31 + 14, v31 + 22);
    swift_bridgeObjectRelease_n(v34, 3);
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "🥑 PeopleDataService%s: parsing \"%s\" (has no location)", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy(v32, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1, -1);
    v38 = v31;
    v14 = v58;
    swift_slowDealloc(v38, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v21, 2);
    swift_release_n(a4, 2);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v11, v54, v53);
  v39 = *(unsigned __int8 *)(a4 + 80);
  v40 = objc_msgSend(*(id *)(a4 + 56), "aa_primaryAppleAccount");
  v41 = v40;
  if (v40)

  swift_errorRetain(a3);
  sub_100005BB0((uint64_t)v11, 0, 0, 2, v39, v41 != 0, 0, 0, (unint64_t)v14, 0xFFu, 0.0, 1, a3);
  swift_retain_n(a4, 2);
  v42 = swift_bridgeObjectRetain(v21);
  v43 = Logger.logObject.getter(v42);
  v44 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = swift_slowAlloc(22, -1);
    v46 = swift_slowAlloc(64, -1);
    v60 = v46;
    *(_DWORD *)v45 = 136315394;
    v47 = *(_QWORD *)(a4 + 16);
    v48 = *(_QWORD *)(a4 + 24);
    swift_bridgeObjectRetain(v48);
    v59 = sub_100012FC4(v47, v48, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v45 + 4, v45 + 12);
    swift_release_n(a4, 2);
    swift_bridgeObjectRelease(v48);
    *(_WORD *)(v45 + 12) = 2080;
    swift_bridgeObjectRetain(v21);
    v59 = sub_100012FC4(v55, v21, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v45 + 14, v45 + 22);
    swift_bridgeObjectRelease_n(v21, 3);
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "🥑 PeopleDataService%s: generated no map for \"%s\"", (uint8_t *)v45, 0x16u);
    swift_arrayDestroy(v46, 2, (char *)&type metadata for Any + 8);
    v49 = v46;
    v14 = v58;
    swift_slowDealloc(v49, -1, -1);
    swift_slowDealloc(v45, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v21, 2);
    swift_release_n(a4, 2);
  }
  sub_100012BCC((uint64_t)v14, v56, v57);
  return sub_100011C60((uint64_t)v14);
}

char *FriendSelectorIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), "init");
  v6 = &v5[OBJC_IVAR___FriendSelectorIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___FriendSelectorIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

id FriendSelectorIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id FriendSelectorIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FriendSelectorIntent();
  return objc_msgSendSuper2(&v2, "init");
}

id Contact.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithCoder:", a1);

  return v3;
}

id FriendSelectorIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for FriendSelectorIntent();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id FriendSelectorIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  NSString v7;
  id v8;

  v4 = v3;
  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(objc_allocWithZone(v4), "initWithIdentifier:backingStore:", v7, a3);

  return v8;
}

id FriendSelectorIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  NSString v6;
  id v7;
  objc_super v9;

  if (a2)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for FriendSelectorIntent();
  v7 = objc_msgSendSuper2(&v9, "initWithIdentifier:backingStore:", v6, a3);

  return v7;
}

id FriendSelectorIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  NSString v9;
  NSString v10;
  NSDictionary v11;
  id v12;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a5)
  {
    v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a5);
  }
  else
  {
    v11.super.isa = 0;
  }
  v12 = objc_msgSend(objc_allocWithZone(v5), "initWithDomain:verb:parametersByName:", v9, v10, v11.super.isa);

  return v12;
}

id FriendSelectorIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  NSString v9;
  NSString v10;
  NSDictionary v11;
  id v12;
  objc_super v14;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a5)
  {
    v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a5);
  }
  else
  {
    v11.super.isa = 0;
  }
  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for FriendSelectorIntent();
  v12 = objc_msgSendSuper2(&v14, "initWithDomain:verb:parametersByName:", v9, v10, v11.super.isa);

  return v12;
}

id FriendSelectorIntent.__deallocating_deinit()
{
  return sub_100016834(type metadata accessor for FriendSelectorIntent);
}

unint64_t FriendSelectorIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_100016864(a1);
}

BOOL sub_1000161C8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000161DC()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100016220()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100016248(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_100016288@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_100016864(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t FriendSelectorIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR___FriendSelectorIntentResponse_code;
  swift_beginAccess(v0 + OBJC_IVAR___FriendSelectorIntentResponse_code, v3, 0, 0);
  return *(_QWORD *)v1;
}

char *FriendSelectorIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(v2, "init");
  v6 = &v5[OBJC_IVAR___FriendSelectorIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___FriendSelectorIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

uint64_t type metadata accessor for FriendSelectorIntent()
{
  return objc_opt_self(FriendSelectorIntent);
}

id FriendSelectorIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___FriendSelectorIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FriendSelectorIntentResponse();
  return objc_msgSendSuper2(&v2, "init");
}

id FriendSelectorIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___FriendSelectorIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for FriendSelectorIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id FriendSelectorIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithBackingStore:", a1);

  return v3;
}

id FriendSelectorIntentResponse.init(backingStore:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___FriendSelectorIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for FriendSelectorIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithBackingStore:", a1);

  return v3;
}

id sub_100016658(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  objc_super v7;

  *(_QWORD *)&a1[OBJC_IVAR___FriendSelectorIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for FriendSelectorIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id FriendSelectorIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  objc_class *v1;
  NSDictionary v3;
  id v4;

  if (a1)
  {
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3.super.isa = 0;
  }
  v4 = objc_msgSend(objc_allocWithZone(v1), "initWithPropertiesByName:", v3.super.isa);

  return v4;
}

id FriendSelectorIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  NSDictionary v3;
  id v4;
  objc_super v6;

  *(_QWORD *)&v1[OBJC_IVAR___FriendSelectorIntentResponse_code] = 0;
  if (a1)
  {
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3.super.isa = 0;
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for FriendSelectorIntentResponse();
  v4 = objc_msgSendSuper2(&v6, "initWithPropertiesByName:", v3.super.isa);

  if (v4)
  return v4;
}

id FriendSelectorIntentResponse.__deallocating_deinit()
{
  return sub_100016834(type metadata accessor for FriendSelectorIntentResponse);
}

id sub_100016834(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

unint64_t sub_100016864(unint64_t result)
{
  if (result > 6)
    return 0;
  return result;
}

uint64_t type metadata accessor for FriendSelectorIntentResponse()
{
  return objc_opt_self(FriendSelectorIntentResponse);
}

unint64_t sub_100016898()
{
  unint64_t result;

  result = qword_1000223B0;
  if (!qword_1000223B0)
  {
    result = swift_getWitnessTable("YD", &type metadata for FriendSelectorIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_1000223B0);
  }
  return result;
}

uint64_t sub_1000168DC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___FriendSelectorIntentResponse_code);
  result = swift_beginAccess(v3, v5, 0, 0);
  *a2 = *v3;
  return result;
}

uint64_t sub_10001692C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___FriendSelectorIntentResponse_code);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for FriendSelectorIntentResponseCode()
{
  return &type metadata for FriendSelectorIntentResponseCode;
}

uint64_t static Contact.supportsSecureCoding.getter()
{
  return 1;
}

id Contact.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  NSString v10;
  NSString v11;
  NSString v12;
  id v13;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a6)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(objc_allocWithZone(v6), "initWithIdentifier:displayString:pronunciationHint:", v10, v11, v12);

  return v13;
}

id Contact.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  NSString v10;
  NSString v11;
  NSString v12;
  id v13;
  objc_super v15;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a6)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v6;
  v15.super_class = (Class)type metadata accessor for Contact();
  v13 = objc_msgSendSuper2(&v15, "initWithIdentifier:displayString:pronunciationHint:", v10, v11, v12);

  return v13;
}

uint64_t type metadata accessor for Contact()
{
  return objc_opt_self(Contact);
}

id Contact.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Contact();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id Contact.__deallocating_deinit()
{
  return sub_100016834(type metadata accessor for Contact);
}

id static ContactResolutionResult.success(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___ContactResolutionResult;
  return objc_msgSendSuper2(&v4, "successWithResolvedObject:", a1);
}

id static ContactResolutionResult.disambiguation(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *ObjCClassFromMetadata;
  Class isa;
  id v7;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  objc_super v12;

  v2 = v1;
  v3 = a1;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v9 = a1;
    else
      v9 = a1 & 0xFFFFFFFFFFFFFF8;
    v10 = sub_100016E20();
    swift_bridgeObjectRetain(v3);
    v11 = _bridgeCocoaArray<A>(_:)(v9, v10);
    swift_bridgeObjectRelease(v3);
    v3 = v11;
  }
  else
  {
    v4 = swift_bridgeObjectRetain(a1);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v4);
    sub_100016E20();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v2);
  sub_100016E20();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  v12.receiver = ObjCClassFromMetadata;
  v12.super_class = (Class)&OBJC_METACLASS___ContactResolutionResult;
  v7 = objc_msgSendSuper2(&v12, "disambiguationWithObjectsToDisambiguate:", isa);

  return v7;
}

unint64_t sub_100016E20()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100022430;
  if (!qword_100022430)
  {
    v1 = objc_opt_self(INObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100022430);
  }
  return result;
}

id static ContactResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___ContactResolutionResult;
  return objc_msgSendSuper2(&v4, "confirmationRequiredWithObjectToConfirm:", a1);
}

void static ContactResolutionResult.success(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "FindMyWidgetIntentsPeople/Contact.swift", 39, 2, 47, 0);
  __break(1u);
}

void static ContactResolutionResult.disambiguation(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "FindMyWidgetIntentsPeople/Contact.swift", 39, 2, 52, 0);
  __break(1u);
}

void static ContactResolutionResult.confirmationRequired(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "FindMyWidgetIntentsPeople/Contact.swift", 39, 2, 57, 0);
  __break(1u);
}

id ContactResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v5;
  Class isa;
  id v7;

  v5 = objc_allocWithZone(v2);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v7 = objc_msgSend(v5, "initWithJSONDictionary:forIntent:", isa, a2);

  return v7;
}

id ContactResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  Class isa;
  id v6;
  id v7;
  objc_super v9;

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for ContactResolutionResult();
  v6 = objc_msgSendSuper2(&v9, "initWithJSONDictionary:forIntent:", isa, a2);

  v7 = v6;
  if (v7)

  return v7;
}

uint64_t type metadata accessor for ContactResolutionResult()
{
  return objc_opt_self(ContactResolutionResult);
}

id ContactResolutionResult.__deallocating_deinit()
{
  return sub_100016834(type metadata accessor for ContactResolutionResult);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC25FindMyWidgetIntentsPeopleP33_03B1EF53AE05B5F34BB4145821DD78D819ResourceBundleClass);
}
