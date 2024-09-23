ValueMetadata *type metadata accessor for MagnifierShortcuts()
{
  return &type metadata for MagnifierShortcuts;
}

uint64_t sub_1000033EC(uint64_t a1, uint64_t a2)
{
  return sub_1000034B4(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000033F8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100003438(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_1000034A8(uint64_t a1, uint64_t a2)
{
  return sub_1000034B4(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000034B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_1000034F0(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_100003564(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_1000035E0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

uint64_t sub_100003620(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
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

uint64_t sub_1000036A8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_1000036EC@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100003714(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100005BFC((unint64_t *)&qword_1000181C8, (uint64_t)&unk_1000109E8);
  v3 = sub_100005BFC(&qword_1000181D0, (uint64_t)&unk_10001093C);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100003780()
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
  uint64_t v20;
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
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  Swift::String v83;
  Swift::String v84;
  unint64_t v85;
  char *v86;
  Swift::String v87;
  uint64_t v88;
  void (*v89)(char *, uint64_t, uint64_t);
  void (*v90)(char *, uint64_t);
  Swift::String v91;
  uint64_t v92;
  Swift::String v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void (*v97)(char *, uint64_t, uint64_t);
  void (*v98)(char *, uint64_t);
  Swift::String v99;
  char *v100;
  Swift::String v101;
  uint64_t v102;
  void (*v103)(char *, uint64_t, uint64_t);
  uint64_t v104;
  Swift::String v105;
  unint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  Swift::String v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void (*v118)(char *, uint64_t);
  Swift::String v119;
  char *v120;
  Swift::String v121;
  void (*v122)(char *, uint64_t);
  Swift::String v123;
  char *v124;
  Swift::String v125;
  uint64_t v126;
  void (*v127)(char *, uint64_t, uint64_t);
  void (*v128)(char *, uint64_t);
  Swift::String v129;
  char *v130;
  Swift::String v131;
  uint64_t v132;
  Swift::String v133;
  char *v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  Swift::String v140;
  uint64_t v141;
  void (*v142)(char *);
  void (*v143)(char *, uint64_t);
  Swift::String v144;
  uint64_t v145;
  Swift::String v146;
  uint64_t v147;
  Swift::String v148;
  char *v149;
  Swift::String v150;
  uint64_t v151;
  void (*v152)(char *, uint64_t, uint64_t);
  void (*v153)(char *, uint64_t);
  Swift::String v154;
  char *v155;
  Swift::String v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void (*v160)(char *, uint64_t);
  Swift::String v161;
  char *v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  char *v168;
  Swift::String v169;
  uint64_t v170;
  void (*v171)(char *, uint64_t, uint64_t);
  Swift::String v172;
  char *v173;
  Swift::String v174;
  void (*v175)(char *, uint64_t);
  Swift::String v176;
  char *v177;
  Swift::String v178;
  uint64_t v179;
  void (*v180)(char *, uint64_t, uint64_t);
  Swift::String v181;
  char *v182;
  Swift::String v183;
  void (*v184)(char *, uint64_t, uint64_t);
  Swift::String v185;
  char *v186;
  char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  unint64_t v193;
  char *v194;
  Swift::String v195;
  uint64_t v196;
  char *v197;
  char *v198;
  uint64_t v199;
  void (*v200)(char *, uint64_t, uint64_t);
  char *v201;
  void (*v202)(char *, uint64_t);
  Swift::String v203;
  uint64_t v204;
  uint64_t v205;
  char *v206;
  Swift::String v207;
  char *v208;
  Swift::String v209;
  char *v210;
  uint64_t v211;
  char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  unint64_t v218;
  char *v219;
  Swift::String v220;
  uint64_t v221;
  char *v222;
  uint64_t v223;
  void (*v224)(char *, uint64_t, uint64_t);
  uint64_t v225;
  void (*v226)(char *, uint64_t);
  Swift::String v227;
  char *v228;
  Swift::String v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  Swift::String v233;
  char *v234;
  Swift::String v235;
  uint64_t v236;
  Swift::String v237;
  char *v238;
  uint64_t v239;
  char *v240;
  uint64_t v241;
  uint64_t v242;
  unint64_t v243;
  char *v244;
  Swift::String v245;
  uint64_t v246;
  uint64_t v247;
  void (*v248)(char *, uint64_t, uint64_t);
  void (*v249)(char *, uint64_t);
  Swift::String v250;
  char *v251;
  Swift::String v252;
  Swift::String v253;
  char *v254;
  char *v255;
  uint64_t v256;
  uint64_t v257;
  unint64_t v258;
  char *v259;
  Swift::String v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  void (*v264)(char *, uint64_t, uint64_t);
  void (*v265)(char *, uint64_t);
  Swift::String v266;
  char *v267;
  Swift::String v268;
  Swift::String v269;
  char *v270;
  uint64_t v271;
  char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  _QWORD v281[2];
  __int128 v282;
  uint64_t v283;
  char *v284;
  char *v285;
  unint64_t v286;
  char *v287;
  char *v288;
  uint64_t v289;
  char *v290;
  char *v291;
  char *v292;
  char *v293;
  char *v294;
  char *v295;
  uint64_t v296;
  char *v297;
  char *v298;
  char *v299;
  char *v300;
  char *v301;
  char *v302;
  char *v303;
  char *v304;
  uint64_t v305;
  char *v306;
  char *v307;
  char *v308;
  uint64_t v309;
  uint64_t v310;
  char *v311;
  char *v312;
  char *v313;
  char *v314;
  uint64_t v315;
  char *v316;
  char *v317;
  char *v318;
  char *v319;
  uint64_t v320;
  char *v321;
  char *v322;
  char *v323;
  char *v324;
  uint64_t v325;
  uint64_t v326;
  __int128 v327;
  char *v328;
  __int128 v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  unint64_t v333;
  char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  void (*v338)(char *, uint64_t);
  void (*v339)(char *);
  unsigned int v340;
  uint64_t v341;

  v320 = sub_1000059A8(&qword_100018100);
  v0 = __chkstk_darwin(v320);
  v321 = (char *)v281 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v0);
  v318 = (char *)v281 - v2;
  v315 = sub_1000059A8(&qword_100018108);
  v3 = __chkstk_darwin(v315);
  v317 = (char *)v281 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v314 = (char *)v281 - v5;
  v310 = sub_1000059A8(&qword_100018110);
  v6 = __chkstk_darwin(v310);
  v312 = (char *)v281 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  v311 = (char *)v281 - v9;
  __chkstk_darwin(v8);
  v308 = (char *)v281 - v10;
  v305 = sub_1000059A8(&qword_100018118);
  v11 = __chkstk_darwin(v305);
  v306 = (char *)v281 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v304 = (char *)v281 - v13;
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = __chkstk_darwin(v14);
  v319 = (char *)v281 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v301 = (char *)v281 - v18;
  v19 = __chkstk_darwin(v17);
  v295 = (char *)v281 - v20;
  __chkstk_darwin(v19);
  v334 = (char *)v281 - v21;
  v22 = type metadata accessor for AppShortcutPhraseToken(0);
  v23 = *(_QWORD *)(v22 - 8);
  __chkstk_darwin(v22);
  v25 = (char *)v281 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_1000059A8(&qword_100018120);
  v27 = __chkstk_darwin(v26);
  v300 = (char *)v281 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __chkstk_darwin(v27);
  v299 = (char *)v281 - v30;
  v31 = __chkstk_darwin(v29);
  v297 = (char *)v281 - v32;
  v33 = __chkstk_darwin(v31);
  v294 = (char *)v281 - v34;
  v35 = __chkstk_darwin(v33);
  v292 = (char *)v281 - v36;
  v37 = __chkstk_darwin(v35);
  v290 = (char *)v281 - v38;
  v39 = __chkstk_darwin(v37);
  v326 = (uint64_t)v281 - v40;
  v41 = __chkstk_darwin(v39);
  v287 = (char *)v281 - v42;
  v43 = __chkstk_darwin(v41);
  v322 = (char *)v281 - v44;
  v45 = __chkstk_darwin(v43);
  v303 = (char *)v281 - v46;
  v47 = __chkstk_darwin(v45);
  v293 = (char *)v281 - v48;
  v49 = __chkstk_darwin(v47);
  v285 = (char *)v281 - v50;
  v51 = __chkstk_darwin(v49);
  v328 = (char *)v281 - v52;
  v53 = __chkstk_darwin(v51);
  v325 = (uint64_t)v281 - v54;
  v55 = __chkstk_darwin(v53);
  v324 = (char *)v281 - v56;
  __chkstk_darwin(v55);
  v58 = (char *)v281 - v57;
  v59 = type metadata accessor for AppShortcut(0);
  v336 = *(_QWORD *)(v59 - 8);
  v337 = v59;
  v60 = __chkstk_darwin(v59);
  v316 = (char *)v281 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __chkstk_darwin(v60);
  v313 = (char *)v281 - v63;
  v64 = __chkstk_darwin(v62);
  v307 = (char *)v281 - v65;
  v66 = __chkstk_darwin(v64);
  v302 = (char *)v281 - v67;
  v68 = __chkstk_darwin(v66);
  v298 = (char *)v281 - v69;
  v70 = __chkstk_darwin(v68);
  v291 = (char *)v281 - v71;
  v72 = __chkstk_darwin(v70);
  v288 = (char *)v281 - v73;
  __chkstk_darwin(v72);
  v284 = (char *)v281 - v74;
  v341 = sub_10000E6A0(0);
  v75 = sub_1000059A8(&qword_100018128);
  v330 = v75;
  v76 = *(_QWORD *)(sub_1000059A8(&qword_100018130) - 8);
  v77 = *(_QWORD *)(v76 + 72);
  v78 = *(unsigned __int8 *)(v76 + 80);
  v331 = 2 * v77;
  v332 = 3 * v77;
  v333 = v77;
  v289 = 6 * v77;
  v283 = ((v78 + 32) & ~v78) + 6 * v77;
  v79 = (v78 + 32) & ~v78;
  *(_QWORD *)&v327 = v79;
  *(_QWORD *)&v329 = v78 | 7;
  v80 = swift_allocObject(v75);
  v282 = xmmword_1000107E0;
  v309 = v80;
  *(_OWORD *)(v80 + 16) = xmmword_1000107E0;
  v81 = v80 + v79;
  v82 = sub_1000059E8();
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(21, 1, &type metadata for StartDetectionTypeIntent, v82);
  v83._countAndFlagsBits = 543519573;
  v83._object = (void *)0xE400000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v83);
  v340 = enum case for AppShortcutPhraseToken.applicationName(_:);
  v339 = *(void (**)(char *))(v23 + 104);
  v339(v25);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v25, v26);
  v338 = *(void (**)(char *, uint64_t))(v23 + 8);
  v338(v25, v22);
  v84._object = (void *)0x8000000100011700;
  v84._countAndFlagsBits = 0xD000000000000011;
  v296 = 0xD000000000000011;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v84);
  v85 = v81;
  AppShortcutPhrase.init(stringInterpolation:)(v58, &type metadata for StartDetectionTypeIntent, v82);
  v281[1] = v81 + v77;
  v286 = v81;
  v86 = v324;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(17, 1, &type metadata for StartDetectionTypeIntent, v82);
  v87._object = (void *)0x8000000100011720;
  v87._countAndFlagsBits = 0xD000000000000011;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v87);
  v88 = v340;
  v335 = v22;
  v89 = (void (*)(char *, uint64_t, uint64_t))v339;
  ((void (*)(char *, _QWORD, uint64_t))v339)(v25, v340, v22);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v25, v26);
  v90 = v338;
  v338(v25, v22);
  v91._countAndFlagsBits = 0;
  v91._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v91);
  AppShortcutPhrase.init(stringInterpolation:)(v86, &type metadata for StartDetectionTypeIntent, v82);
  v92 = v325;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(15, 1, &type metadata for StartDetectionTypeIntent, v82);
  v324 = (char *)(v85 + v331);
  v93._countAndFlagsBits = 0x6F657020646E6946;
  v93._object = (void *)0xEF206E6920656C70;
  v94 = v92;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v93);
  v95 = v88;
  v96 = v335;
  v89(v25, v88, v335);
  v97 = v89;
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v25, v26);
  v98 = v90;
  v90(v25, v96);
  v99._countAndFlagsBits = 0;
  v99._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v99);
  AppShortcutPhrase.init(stringInterpolation:)(v94, &type metadata for StartDetectionTypeIntent, v82);
  v100 = v328;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(19, 1, &type metadata for StartDetectionTypeIntent, v82);
  v101._countAndFlagsBits = 543519573;
  v101._object = (void *)0xE400000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v101);
  v102 = v335;
  v97(v25, v95, v335);
  v103 = v97;
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v25, v26);
  v104 = v102;
  v98(v25, v102);
  v105._countAndFlagsBits = 0x646E6966206F7420;
  v105._object = (void *)0xEF656C706F657020;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v105);
  AppShortcutPhrase.init(stringInterpolation:)(v100, &type metadata for StartDetectionTypeIntent, v82);
  v106 = v333;
  v324 = (char *)(4 * v333);
  AppShortcutPhrase.init(stringLiteral:)(0xD000000000000017, 0x8000000100011740, &type metadata for StartDetectionTypeIntent, v82);
  v325 = 5 * v106;
  AppShortcutPhrase.init(stringLiteral:)(0x7020746365746544, 0xED0000656C706F65, &type metadata for StartDetectionTypeIntent, v82);
  v328 = (char *)0xD000000000000022;
  v107 = v334;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000022, 0x8000000100011760);
  v286 = 0xD000000000000025;
  v108 = v284;
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)(&v341, v309, v107);
  v309 = static AppShortcutsBuilder.buildExpression(_:)(v108);
  v336 = *(_QWORD *)(v336 + 8);
  ((void (*)(char *, uint64_t))v336)(v108, v337);
  v341 = sub_10000E6A0(1);
  v109 = swift_allocObject(v330);
  *(_OWORD *)(v109 + 16) = v282;
  v110 = v109;
  v284 = (char *)v109;
  v111 = *(unsigned __int8 *)(*(_QWORD *)(sub_1000059A8(&qword_100018130) - 8) + 80);
  v112 = v110 + ((v111 + 32) & ~v111);
  v113 = v285;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(20, 1, &type metadata for StartDetectionTypeIntent, v82);
  v114._countAndFlagsBits = 543519573;
  v114._object = (void *)0xE400000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v114);
  v115 = v340;
  v116 = v104;
  v103(v25, v340, v104);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v25, v26);
  v117 = v104;
  v118 = v338;
  v338(v25, v117);
  v119._object = (void *)0x80000001000117C0;
  v119._countAndFlagsBits = 0xD000000000000010;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v119);
  AppShortcutPhrase.init(stringInterpolation:)(v113, &type metadata for StartDetectionTypeIntent, v82);
  v285 = (char *)(v112 + v333);
  v283 = v112;
  v120 = v293;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(16, 1, &type metadata for StartDetectionTypeIntent, v82);
  v121._object = (void *)0x80000001000117E0;
  v121._countAndFlagsBits = 0xD000000000000010;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v121);
  v103(v25, v115, v116);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v25, v26);
  v122 = v118;
  v118(v25, v116);
  v123._countAndFlagsBits = 0;
  v123._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v123);
  AppShortcutPhrase.init(stringInterpolation:)(v120, &type metadata for StartDetectionTypeIntent, v82);
  v124 = v303;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(14, 1, &type metadata for StartDetectionTypeIntent, v82);
  v293 = (char *)(v112 + v331);
  v125._countAndFlagsBits = 0x6F6F6420646E6946;
  v125._object = (void *)0xEE00206E69207372;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v125);
  v126 = v340;
  v127 = (void (*)(char *, uint64_t, uint64_t))v339;
  ((void (*)(char *, _QWORD, uint64_t))v339)(v25, v340, v116);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v25, v26);
  v122(v25, v116);
  v128 = v122;
  v129._countAndFlagsBits = 0;
  v129._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v129);
  AppShortcutPhrase.init(stringInterpolation:)(v124, &type metadata for StartDetectionTypeIntent, v82);
  v130 = v322;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(18, 1, &type metadata for StartDetectionTypeIntent, v82);
  v131._countAndFlagsBits = 543519573;
  v131._object = (void *)0xE400000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v131);
  v127(v25, v126, v116);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v25, v26);
  v132 = v116;
  v128(v25, v116);
  v133._countAndFlagsBits = 0x646E6966206F7420;
  v133._object = (void *)0xEE0073726F6F6420;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v133);
  AppShortcutPhrase.init(stringInterpolation:)(v130, &type metadata for StartDetectionTypeIntent, v82);
  v293 = (char *)0xD000000000000016;
  AppShortcutPhrase.init(stringLiteral:)(0xD000000000000016, 0x8000000100011800, &type metadata for StartDetectionTypeIntent, v82);
  AppShortcutPhrase.init(stringLiteral:)(0x6420746365746544, 0xEC00000073726F6FLL, &type metadata for StartDetectionTypeIntent, v82);
  v134 = v334;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000021, 0x8000000100011820);
  v135 = v288;
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)(&v341, v284, v134);
  v303 = (char *)static AppShortcutsBuilder.buildExpression(_:)(v135);
  ((void (*)(char *, uint64_t))v336)(v135, v337);
  v341 = sub_10000E6A0(3);
  v136 = swift_allocObject(v330);
  *(_OWORD *)(v136 + 16) = xmmword_1000107F0;
  v137 = v136;
  v285 = (char *)v136;
  v138 = *(unsigned __int8 *)(*(_QWORD *)(sub_1000059A8(&qword_100018130) - 8) + 80);
  v322 = (char *)(v137 + ((v138 + 32) & ~v138));
  v139 = v287;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(24, 1, &type metadata for StartDetectionTypeIntent, v82);
  v140._countAndFlagsBits = 543519573;
  v140._object = (void *)0xE400000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v140);
  v141 = v132;
  v142 = v339;
  ((void (*)(char *, uint64_t, uint64_t))v339)(v25, v126, v132);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v25, v26);
  v143 = v338;
  v338(v25, v132);
  v144._object = (void *)0x8000000100011870;
  v144._countAndFlagsBits = 0xD000000000000014;
  v288 = (char *)0xD000000000000014;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v144);
  AppShortcutPhrase.init(stringInterpolation:)(v139, &type metadata for StartDetectionTypeIntent, v82);
  v145 = v326;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(20, 1, &type metadata for StartDetectionTypeIntent, v82);
  v146._object = (void *)0x8000000100011890;
  v146._countAndFlagsBits = 0xD000000000000014;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v146);
  v147 = v340;
  ((void (*)(char *, _QWORD, uint64_t))v142)(v25, v340, v141);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v25, v26);
  v143(v25, v141);
  v148._countAndFlagsBits = 0;
  v148._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v148);
  AppShortcutPhrase.init(stringInterpolation:)(v145, &type metadata for StartDetectionTypeIntent, v82);
  v287 = &v322[v331];
  v149 = v290;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(18, 1, &type metadata for StartDetectionTypeIntent, v82);
  v150._countAndFlagsBits = 0xD000000000000012;
  v326 = 0xD000000000000012;
  v150._object = (void *)0x80000001000118B0;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v150);
  v151 = v147;
  ((void (*)(char *, uint64_t, uint64_t))v142)(v25, v147, v141);
  v152 = (void (*)(char *, uint64_t, uint64_t))v142;
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v25, v26);
  v153 = v338;
  v338(v25, v141);
  v154._countAndFlagsBits = 0;
  v154._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v154);
  AppShortcutPhrase.init(stringInterpolation:)(v149, &type metadata for StartDetectionTypeIntent, v82);
  v155 = v292;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(22, 1, &type metadata for StartDetectionTypeIntent, v82);
  v156._countAndFlagsBits = 543519573;
  v156._object = (void *)0xE400000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v156);
  v157 = v151;
  v158 = v335;
  v152(v25, v157, v335);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v25, v26);
  v159 = v158;
  v153(v25, v158);
  v160 = v153;
  v161._object = (void *)0x80000001000118D0;
  v161._countAndFlagsBits = v326;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v161);
  AppShortcutPhrase.init(stringInterpolation:)(v155, &type metadata for StartDetectionTypeIntent, v82);
  AppShortcutPhrase.init(stringLiteral:)(0xD00000000000001ALL, 0x80000001000118F0, &type metadata for StartDetectionTypeIntent, v82);
  AppShortcutPhrase.init(stringLiteral:)(0xD000000000000010, 0x8000000100011910, &type metadata for StartDetectionTypeIntent, v82);
  AppShortcutPhrase.init(stringLiteral:)(0xD000000000000018, 0x8000000100011930, &type metadata for StartDetectionTypeIntent, v82);
  v162 = v295;
  LocalizedStringResource.init(stringLiteral:)(v286, 0x8000000100011950);
  v163 = v291;
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)(&v341, v285, v162);
  v325 = static AppShortcutsBuilder.buildExpression(_:)(v163);
  ((void (*)(char *, uint64_t))v336)(v163, v337);
  v341 = sub_10000E6A0(2);
  v164 = swift_allocObject(v330);
  v327 = xmmword_100010800;
  *(_OWORD *)(v164 + 16) = xmmword_100010800;
  v165 = v164;
  v330 = v164;
  v166 = *(unsigned __int8 *)(*(_QWORD *)(sub_1000059A8(&qword_100018130) - 8) + 80);
  v167 = v165 + ((v166 + 32) & ~v166);
  v168 = v294;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(19, 1, &type metadata for StartDetectionTypeIntent, v82);
  v169._countAndFlagsBits = 543519573;
  v169._object = (void *)0xE400000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v169);
  v170 = v340;
  v171 = (void (*)(char *, uint64_t, uint64_t))v339;
  ((void (*)(char *, _QWORD, uint64_t))v339)(v25, v340, v159);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v25, v26);
  v160(v25, v159);
  v172._countAndFlagsBits = 0x65746564206F7420;
  v172._object = (void *)0xEF74786574207463;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v172);
  AppShortcutPhrase.init(stringInterpolation:)(v168, &type metadata for StartDetectionTypeIntent, v82);
  v173 = v297;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(15, 1, &type metadata for StartDetectionTypeIntent, v82);
  v333 += v167;
  v174._countAndFlagsBits = 0x7420746365746544;
  v174._object = (void *)0xEF206E6920747865;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v174);
  v171(v25, v170, v159);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v25, v26);
  v160(v25, v159);
  v175 = v160;
  v176._countAndFlagsBits = 0;
  v176._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v176);
  AppShortcutPhrase.init(stringInterpolation:)(v173, &type metadata for StartDetectionTypeIntent, v82);
  v177 = v299;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(8, 1, &type metadata for StartDetectionTypeIntent, v82);
  v333 = v167 + v331;
  v178._countAndFlagsBits = 0x206E692064616552;
  v178._object = (void *)0xE800000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v178);
  v179 = v340;
  v180 = (void (*)(char *, uint64_t, uint64_t))v339;
  ((void (*)(char *, _QWORD, uint64_t))v339)(v25, v340, v159);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v25, v26);
  v175(v25, v159);
  v181._countAndFlagsBits = 0;
  v181._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v181);
  AppShortcutPhrase.init(stringInterpolation:)(v177, &type metadata for StartDetectionTypeIntent, v82);
  v182 = v300;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(12, 1, &type metadata for StartDetectionTypeIntent, v82);
  v183._countAndFlagsBits = 543519573;
  v183._object = (void *)0xE400000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v183);
  v180(v25, v179, v159);
  v184 = v180;
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v25, v26);
  v175(v25, v159);
  v185._countAndFlagsBits = 0x64616572206F7420;
  v185._object = (void *)0xE800000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v185);
  AppShortcutPhrase.init(stringInterpolation:)(v182, &type metadata for StartDetectionTypeIntent, v82);
  v333 = 0xD000000000000020;
  v186 = v301;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000020, 0x8000000100011980);
  v187 = v298;
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)(&v341, v330, v186);
  v331 = static AppShortcutsBuilder.buildExpression(_:)(v187);
  ((void (*)(char *, uint64_t))v336)(v187, v337);
  v188 = sub_1000059A8(&qword_100018140);
  v189 = *(_QWORD *)(*(_QWORD *)(sub_1000059A8(&qword_100018148) - 8) + 72);
  v324 = (char *)(2 * v189);
  v190 = swift_allocObject(v188);
  v329 = xmmword_100010810;
  *(_OWORD *)(v190 + 16) = xmmword_100010810;
  v191 = v190;
  v330 = v190;
  v192 = *(unsigned __int8 *)(*(_QWORD *)(sub_1000059A8(&qword_100018148) - 8) + 80);
  v332 = v191 + ((v192 + 32) & ~v192);
  v193 = sub_100005A2C();
  v194 = v304;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(21, 1, &type metadata for DescribeThisIntent, v193);
  v195._countAndFlagsBits = 543519573;
  v195._object = (void *)0xE400000000000000;
  v196 = v305;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v195);
  v197 = v25;
  v323 = v25;
  v198 = v25;
  v199 = v340;
  v200 = v184;
  v184(v198, v340, v159);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v197, v196);
  v201 = v197;
  v202 = v338;
  v338(v201, v159);
  v203._object = (void *)0x80000001000119B0;
  v204 = v296;
  v203._countAndFlagsBits = v296;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v203);
  v205 = v332;
  AppShortcutPhrase.init(stringInterpolation:)(v194, &type metadata for DescribeThisIntent, v193);
  v322 = (char *)(v205 + v189);
  v206 = v306;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(17, 1, &type metadata for DescribeThisIntent, v193);
  v207._object = (void *)0x80000001000119D0;
  v207._countAndFlagsBits = v204;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v207);
  v208 = v323;
  v200(v323, v199, v159);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v208, v196);
  v202(v208, v159);
  v209._countAndFlagsBits = 0;
  v209._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v209);
  AppShortcutPhrase.init(stringInterpolation:)(v206, &type metadata for DescribeThisIntent, v193);
  AppShortcutPhrase.init(stringLiteral:)(0x6562697263736544, 0xED00007369687420, &type metadata for DescribeThisIntent, v193);
  v210 = v334;
  v211 = LocalizedStringResource.init(stringLiteral:)(v328, 0x80000001000119F0);
  v212 = v302;
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)(v211, v330, v210);
  v330 = static AppShortcutsBuilder.buildExpression(_:)(v212);
  ((void (*)(char *, uint64_t))v336)(v212, v337);
  v213 = sub_1000059A8(&qword_100018158);
  v332 = *(_QWORD *)(*(_QWORD *)(sub_1000059A8(&qword_100018160) - 8) + 72);
  v214 = swift_allocObject(v213);
  *(_OWORD *)(v214 + 16) = v327;
  v215 = v214;
  v324 = (char *)v214;
  v216 = *(unsigned __int8 *)(*(_QWORD *)(sub_1000059A8(&qword_100018160) - 8) + 80);
  v217 = v215 + ((v216 + 32) & ~v216);
  v218 = sub_100005A70();
  v219 = v308;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(38, 1, &type metadata for PointAndSpeakIntent, v218);
  v220._countAndFlagsBits = 543519573;
  v220._object = (void *)0xE400000000000000;
  v221 = v310;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v220);
  v222 = v323;
  v223 = v340;
  v224 = (void (*)(char *, uint64_t, uint64_t))v339;
  ((void (*)(char *, _QWORD, uint64_t))v339)(v323, v340, v159);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v222, v221);
  v225 = v159;
  v226 = v338;
  v338(v222, v225);
  v227._object = (void *)0x8000000100011A40;
  v227._countAndFlagsBits = (uint64_t)v328;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v227);
  *(_QWORD *)&v327 = v217;
  AppShortcutPhrase.init(stringInterpolation:)(v219, &type metadata for PointAndSpeakIntent, v218);
  v228 = v311;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(24, 1, &type metadata for PointAndSpeakIntent, v218);
  v328 = (char *)(v217 + v332);
  v229._countAndFlagsBits = 543519573;
  v229._object = (void *)0xE400000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v229);
  v230 = v223;
  v231 = v223;
  v232 = v335;
  v224(v222, v230, v335);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v222, v221);
  v226(v222, v232);
  v233._object = (void *)0x8000000100011A70;
  v233._countAndFlagsBits = (uint64_t)v288;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v233);
  AppShortcutPhrase.init(stringInterpolation:)(v228, &type metadata for PointAndSpeakIntent, v218);
  v234 = v312;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(25, 1, &type metadata for PointAndSpeakIntent, v218);
  v235._countAndFlagsBits = 0xD000000000000019;
  v235._object = (void *)0x8000000100011A90;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v235);
  v236 = v335;
  ((void (*)(char *, uint64_t, uint64_t))v339)(v222, v231, v335);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v222, v221);
  v338(v222, v236);
  v237._countAndFlagsBits = 0;
  v237._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v237);
  AppShortcutPhrase.init(stringInterpolation:)(v234, &type metadata for PointAndSpeakIntent, v218);
  AppShortcutPhrase.init(stringLiteral:)(v293, 0x8000000100011AB0, &type metadata for PointAndSpeakIntent, v218);
  v238 = v334;
  v239 = LocalizedStringResource.init(stringLiteral:)(0xD000000000000024, 0x8000000100011AD0);
  v240 = v307;
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)(v239, v324, v238);
  v332 = static AppShortcutsBuilder.buildExpression(_:)(v240);
  ((void (*)(char *, uint64_t))v336)(v240, v337);
  v341 = sub_10000C9CC();
  v241 = sub_1000059A8(&qword_100018170);
  *(_QWORD *)&v327 = *(_QWORD *)(*(_QWORD *)(sub_1000059A8(&qword_100018178) - 8) + 72);
  v242 = swift_allocObject(v241);
  *(_OWORD *)(v242 + 16) = xmmword_100010820;
  v328 = (char *)v242;
  sub_1000059A8(&qword_100018178);
  v243 = sub_100005AB4();
  v244 = v314;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(18, 1, &type metadata for StartActivityAppIntent, v243);
  v245._object = (void *)0x8000000100011B30;
  v245._countAndFlagsBits = v326;
  v246 = v315;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v245);
  v247 = v340;
  v248 = (void (*)(char *, uint64_t, uint64_t))v339;
  ((void (*)(char *, _QWORD, uint64_t))v339)(v222, v340, v236);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v222, v246);
  v249 = v338;
  v338(v222, v236);
  v250._countAndFlagsBits = 0;
  v250._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v250);
  AppShortcutPhrase.init(stringInterpolation:)(v244, &type metadata for StartActivityAppIntent, v243);
  v251 = v317;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(15, 1, &type metadata for StartActivityAppIntent, v243);
  v252._countAndFlagsBits = 0x207472617453;
  v252._object = (void *)0xE600000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v252);
  v248(v222, v247, v236);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v222, v246);
  v249(v222, v236);
  v253._object = (void *)0xE900000000000079;
  v253._countAndFlagsBits = 0x7469766974636120;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v253);
  AppShortcutPhrase.init(stringInterpolation:)(v251, &type metadata for StartActivityAppIntent, v243);
  v254 = v334;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000023, 0x8000000100011B50);
  v255 = v313;
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)(&v341, v328, v254);
  v334 = (char *)static AppShortcutsBuilder.buildExpression(_:)(v255);
  ((void (*)(char *, uint64_t))v336)(v255, v337);
  v256 = sub_1000059A8(&qword_100018188);
  v326 = *(_QWORD *)(*(_QWORD *)(sub_1000059A8(&qword_100018190) - 8) + 72);
  *(_QWORD *)&v327 = 2 * v326;
  v257 = swift_allocObject(v256);
  *(_OWORD *)(v257 + 16) = v329;
  v328 = (char *)v257;
  sub_1000059A8(&qword_100018190);
  v258 = sub_100005AF8();
  v259 = v318;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(15, 1, &type metadata for ReaderModeIntent, v258);
  v260._countAndFlagsBits = 0x616552206E65704FLL;
  v260._object = (void *)0xEF206E6920726564;
  v261 = v320;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v260);
  v262 = v340;
  v263 = v335;
  v264 = (void (*)(char *, uint64_t, uint64_t))v339;
  ((void (*)(char *, _QWORD, uint64_t))v339)(v222, v340, v335);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v222, v261);
  v265 = v338;
  v338(v222, v263);
  v266._countAndFlagsBits = 0;
  v266._object = (void *)0xE000000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v266);
  AppShortcutPhrase.init(stringInterpolation:)(v259, &type metadata for ReaderModeIntent, v258);
  v267 = v321;
  AppShortcutPhrase.StringInterpolation.init(literalCapacity:interpolationCount:)(15, 1, &type metadata for ReaderModeIntent, v258);
  v268._countAndFlagsBits = 543519573;
  v268._object = (void *)0xE400000000000000;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v268);
  v264(v222, v262, v263);
  AppShortcutPhrase.StringInterpolation.appendInterpolation(_:)(v222, v261);
  v265(v222, v263);
  v269._countAndFlagsBits = 0x61655220726F6620;
  v269._object = (void *)0xEB00000000726564;
  AppShortcutPhrase.StringInterpolation.appendLiteral(_:)(v269);
  AppShortcutPhrase.init(stringInterpolation:)(v267, &type metadata for ReaderModeIntent, v258);
  AppShortcutPhrase.init(stringLiteral:)(0x6552207472617453, 0xEC00000072656461, &type metadata for ReaderModeIntent, v258);
  v270 = v319;
  v271 = LocalizedStringResource.init(stringLiteral:)(v333, 0x8000000100011BA0);
  v272 = v316;
  AppShortcut.init<A>(intent:phrases:shortTitle:systemImageName:)(v271, v328, v270);
  v273 = static AppShortcutsBuilder.buildExpression(_:)(v272);
  ((void (*)(char *, uint64_t))v336)(v272, v337);
  v274 = sub_1000059A8(&qword_1000181A0);
  v275 = swift_allocObject(v274);
  *(_OWORD *)(v275 + 16) = xmmword_100010830;
  v276 = v303;
  *(_QWORD *)(v275 + 32) = v309;
  *(_QWORD *)(v275 + 40) = v276;
  v277 = v331;
  *(_QWORD *)(v275 + 48) = v325;
  *(_QWORD *)(v275 + 56) = v277;
  v278 = v332;
  *(_QWORD *)(v275 + 64) = v330;
  *(_QWORD *)(v275 + 72) = v278;
  *(_QWORD *)(v275 + 80) = v334;
  *(_QWORD *)(v275 + 88) = v273;
  v279 = static AppShortcutsBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v275);
  return v279;
}

uint64_t sub_1000059A8(uint64_t *a1)
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

unint64_t sub_1000059E8()
{
  unint64_t result;

  result = qword_100018138;
  if (!qword_100018138)
  {
    result = swift_getWitnessTable(&unk_100011510, &type metadata for StartDetectionTypeIntent);
    atomic_store(result, (unint64_t *)&qword_100018138);
  }
  return result;
}

unint64_t sub_100005A2C()
{
  unint64_t result;

  result = qword_100018150;
  if (!qword_100018150)
  {
    result = swift_getWitnessTable("I@", &type metadata for DescribeThisIntent);
    atomic_store(result, (unint64_t *)&qword_100018150);
  }
  return result;
}

unint64_t sub_100005A70()
{
  unint64_t result;

  result = qword_100018168;
  if (!qword_100018168)
  {
    result = swift_getWitnessTable(&unk_100011050, &type metadata for PointAndSpeakIntent);
    atomic_store(result, (unint64_t *)&qword_100018168);
  }
  return result;
}

unint64_t sub_100005AB4()
{
  unint64_t result;

  result = qword_100018180;
  if (!qword_100018180)
  {
    result = swift_getWitnessTable(&unk_100011150, &type metadata for StartActivityAppIntent);
    atomic_store(result, (unint64_t *)&qword_100018180);
  }
  return result;
}

unint64_t sub_100005AF8()
{
  unint64_t result;

  result = qword_100018198;
  if (!qword_100018198)
  {
    result = swift_getWitnessTable(&unk_100010F50, &type metadata for ReaderModeIntent);
    atomic_store(result, (unint64_t *)&qword_100018198);
  }
  return result;
}

void type metadata accessor for FileAttributeKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1000181A8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100014AF0);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000181A8);
  }
}

uint64_t sub_100005B90()
{
  return sub_100005BFC(&qword_1000181B0, (uint64_t)&unk_100010900);
}

uint64_t sub_100005BB4()
{
  return sub_100005BFC(&qword_1000181B8, (uint64_t)&unk_1000108D4);
}

uint64_t sub_100005BD8()
{
  return sub_100005BFC(&qword_1000181C0, (uint64_t)&unk_100010970);
}

uint64_t sub_100005BFC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for FileAttributeKey();
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005C3C()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  Swift::String v18;
  uint64_t v19;
  Swift::String v20;
  uint64_t v21;
  Swift::String v22;
  void (*v23)(char *, _QWORD, uint64_t);
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  Swift::String v26;
  char *v27;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  Swift::String v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  char *v34;
  Swift::String v35;
  Swift::String v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  unsigned int v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t);
  void (*v53)(char *, _QWORD, uint64_t);
  uint64_t v54;
  uint64_t v55;

  v0 = sub_1000059A8(&qword_100018280);
  v54 = *(_QWORD *)(v0 - 8);
  v55 = v0;
  __chkstk_darwin(v0);
  v2 = (char *)&v46 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000059A8(&qword_100018288);
  v8 = __chkstk_darwin(v7);
  v50 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v48 = (char *)&v46 - v11;
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v46 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v46 - v15;
  v17 = sub_1000059E8();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(21, 1, &type metadata for StartDetectionTypeIntent, v17);
  v18._countAndFlagsBits = 543519573;
  v18._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v18);
  v19 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v53 = *(void (**)(char *, _QWORD, uint64_t))(v4 + 104);
  v47 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v53(v6, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v52 = *(void (**)(char *, uint64_t))(v4 + 8);
  v52(v6, v3);
  v20._object = (void *)0x8000000100011700;
  v20._countAndFlagsBits = 0xD000000000000011;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v16, &type metadata for StartDetectionTypeIntent, v17);
  v51 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v17);
  v21 = v55;
  v54 = *(_QWORD *)(v54 + 8);
  ((void (*)(char *, uint64_t))v54)(v2, v55);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(17, 1, &type metadata for StartDetectionTypeIntent, v17);
  v22._object = (void *)0x8000000100011720;
  v22._countAndFlagsBits = 0xD000000000000011;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v22);
  v46 = v3;
  v23 = v53;
  v53(v6, v19, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v24 = v3;
  v25 = v52;
  v52(v6, v24);
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v26);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v14, &type metadata for StartDetectionTypeIntent, v17);
  v49 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v17);
  ((void (*)(char *, uint64_t))v54)(v2, v21);
  v27 = v48;
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(15, 1, &type metadata for StartDetectionTypeIntent, v17);
  v28._countAndFlagsBits = 0x6F657020646E6946;
  v28._object = (void *)0xEF206E6920656C70;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v28);
  v29 = v47;
  v30 = v46;
  v23(v6, v47, v46);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v25(v6, v30);
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v31);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v27, &type metadata for StartDetectionTypeIntent, v17);
  v48 = (char *)static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v17);
  v32 = (void (*)(char *, uint64_t))v54;
  v33 = v55;
  ((void (*)(char *, uint64_t))v54)(v2, v55);
  v34 = v50;
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(19, 1, &type metadata for StartDetectionTypeIntent, v17);
  v35._countAndFlagsBits = 543519573;
  v35._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v35);
  v53(v6, v29, v30);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v52(v6, v30);
  v36._countAndFlagsBits = 0x646E6966206F7420;
  v36._object = (void *)0xEF656C706F657020;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v36);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v34, &type metadata for StartDetectionTypeIntent, v17);
  v37 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v17);
  v38 = v32;
  v32(v2, v33);
  _AssistantIntent.Phrase.init(stringLiteral:)(0xD000000000000017, 0x8000000100011740, &type metadata for StartDetectionTypeIntent, v17);
  v39 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v17);
  v38(v2, v33);
  _AssistantIntent.Phrase.init(stringLiteral:)(0x7020746365746544, 0xED0000656C706F65, &type metadata for StartDetectionTypeIntent, v17);
  v40 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v17);
  v38(v2, v33);
  v41 = sub_1000059A8(&qword_100018290);
  v42 = swift_allocObject(v41);
  *(_OWORD *)(v42 + 16) = xmmword_1000107E0;
  v43 = v49;
  *(_QWORD *)(v42 + 32) = v51;
  *(_QWORD *)(v42 + 40) = v43;
  *(_QWORD *)(v42 + 48) = v48;
  *(_QWORD *)(v42 + 56) = v37;
  *(_QWORD *)(v42 + 64) = v39;
  *(_QWORD *)(v42 + 72) = v40;
  v44 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v42);
  return v44;
}

uint64_t sub_1000061B4()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  Swift::String v18;
  uint64_t v19;
  Swift::String v20;
  uint64_t v21;
  Swift::String v22;
  void (*v23)(char *, _QWORD, uint64_t);
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  Swift::String v26;
  char *v27;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  Swift::String v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  char *v34;
  Swift::String v35;
  Swift::String v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  unsigned int v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t);
  void (*v53)(char *, _QWORD, uint64_t);
  uint64_t v54;
  uint64_t v55;

  v0 = sub_1000059A8(&qword_100018280);
  v54 = *(_QWORD *)(v0 - 8);
  v55 = v0;
  __chkstk_darwin(v0);
  v2 = (char *)&v46 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000059A8(&qword_100018288);
  v8 = __chkstk_darwin(v7);
  v50 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v48 = (char *)&v46 - v11;
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v46 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v46 - v15;
  v17 = sub_1000059E8();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(20, 1, &type metadata for StartDetectionTypeIntent, v17);
  v18._countAndFlagsBits = 543519573;
  v18._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v18);
  v19 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v53 = *(void (**)(char *, _QWORD, uint64_t))(v4 + 104);
  v47 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v53(v6, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v52 = *(void (**)(char *, uint64_t))(v4 + 8);
  v52(v6, v3);
  v20._object = (void *)0x80000001000117C0;
  v20._countAndFlagsBits = 0xD000000000000010;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v16, &type metadata for StartDetectionTypeIntent, v17);
  v51 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v17);
  v21 = v55;
  v54 = *(_QWORD *)(v54 + 8);
  ((void (*)(char *, uint64_t))v54)(v2, v55);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(16, 1, &type metadata for StartDetectionTypeIntent, v17);
  v22._object = (void *)0x80000001000117E0;
  v22._countAndFlagsBits = 0xD000000000000010;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v22);
  v46 = v3;
  v23 = v53;
  v53(v6, v19, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v24 = v3;
  v25 = v52;
  v52(v6, v24);
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v26);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v14, &type metadata for StartDetectionTypeIntent, v17);
  v49 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v17);
  ((void (*)(char *, uint64_t))v54)(v2, v21);
  v27 = v48;
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(14, 1, &type metadata for StartDetectionTypeIntent, v17);
  v28._countAndFlagsBits = 0x6F6F6420646E6946;
  v28._object = (void *)0xEE00206E69207372;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v28);
  v29 = v47;
  v30 = v46;
  v23(v6, v47, v46);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v25(v6, v30);
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v31);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v27, &type metadata for StartDetectionTypeIntent, v17);
  v48 = (char *)static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v17);
  v32 = (void (*)(char *, uint64_t))v54;
  v33 = v55;
  ((void (*)(char *, uint64_t))v54)(v2, v55);
  v34 = v50;
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(18, 1, &type metadata for StartDetectionTypeIntent, v17);
  v35._countAndFlagsBits = 543519573;
  v35._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v35);
  v53(v6, v29, v30);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v52(v6, v30);
  v36._countAndFlagsBits = 0x646E6966206F7420;
  v36._object = (void *)0xEE0073726F6F6420;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v36);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v34, &type metadata for StartDetectionTypeIntent, v17);
  v37 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v17);
  v38 = v32;
  v32(v2, v33);
  _AssistantIntent.Phrase.init(stringLiteral:)(0xD000000000000016, 0x8000000100011800, &type metadata for StartDetectionTypeIntent, v17);
  v39 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v17);
  v38(v2, v33);
  _AssistantIntent.Phrase.init(stringLiteral:)(0x6420746365746544, 0xEC00000073726F6FLL, &type metadata for StartDetectionTypeIntent, v17);
  v40 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v17);
  v38(v2, v33);
  v41 = sub_1000059A8(&qword_100018290);
  v42 = swift_allocObject(v41);
  *(_OWORD *)(v42 + 16) = xmmword_1000107E0;
  v43 = v49;
  *(_QWORD *)(v42 + 32) = v51;
  *(_QWORD *)(v42 + 40) = v43;
  *(_QWORD *)(v42 + 48) = v48;
  *(_QWORD *)(v42 + 56) = v37;
  *(_QWORD *)(v42 + 64) = v39;
  *(_QWORD *)(v42 + 72) = v40;
  v44 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v42);
  return v44;
}

uint64_t sub_100006728()
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
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  Swift::String v21;
  uint64_t v22;
  Swift::String v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  Swift::String v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  Swift::String v29;
  char *v30;
  Swift::String v31;
  Swift::String v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  unsigned int v51;
  void (*v52)(char *, uint64_t);
  void (*v53)(char *);

  v45 = sub_1000059A8(&qword_100018280);
  v0 = *(_QWORD *)(v45 - 8);
  __chkstk_darwin(v45);
  v2 = (char *)&v44 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000059A8(&qword_100018288);
  v8 = __chkstk_darwin(v7);
  v47 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v44 - v11;
  __chkstk_darwin(v10);
  v14 = (char *)&v44 - v13;
  v15 = sub_1000059E8();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(24, 1, &type metadata for StartDetectionTypeIntent, v15);
  v16._countAndFlagsBits = 543519573;
  v16._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v16);
  v51 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v53 = *(void (**)(char *))(v4 + 104);
  v53(v6);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v52 = *(void (**)(char *, uint64_t))(v4 + 8);
  v52(v6, v3);
  v17._object = (void *)0x8000000100011870;
  v17._countAndFlagsBits = 0xD000000000000014;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v14, &type metadata for StartDetectionTypeIntent, v15);
  v18 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v15);
  v19 = *(void (**)(char *, uint64_t))(v0 + 8);
  v49 = v18;
  v50 = v19;
  v20 = v45;
  v19(v2, v45);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(20, 1, &type metadata for StartDetectionTypeIntent, v15);
  v21._object = (void *)0x8000000100011890;
  v21._countAndFlagsBits = 0xD000000000000014;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v21);
  v22 = v51;
  v44 = v3;
  ((void (*)(char *, _QWORD, uint64_t))v53)(v6, v51, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v52(v6, v3);
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v23);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v12, &type metadata for StartDetectionTypeIntent, v15);
  v48 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v15);
  v24 = v20;
  v25 = v50;
  v50(v2, v20);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(18, 1, &type metadata for StartDetectionTypeIntent, v15);
  v26._object = (void *)0x80000001000118B0;
  v26._countAndFlagsBits = 0xD000000000000012;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v26);
  v27 = v44;
  ((void (*)(char *, uint64_t, uint64_t))v53)(v6, v22, v44);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v28 = v52;
  v52(v6, v27);
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v29);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v12, &type metadata for StartDetectionTypeIntent, v15);
  v46 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v15);
  v25(v2, v24);
  v30 = v47;
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(22, 1, &type metadata for StartDetectionTypeIntent, v15);
  v31._countAndFlagsBits = 543519573;
  v31._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v31);
  ((void (*)(char *, _QWORD, uint64_t))v53)(v6, v51, v27);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v28(v6, v27);
  v32._object = (void *)0x80000001000118D0;
  v32._countAndFlagsBits = 0xD000000000000012;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v32);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v30, &type metadata for StartDetectionTypeIntent, v15);
  v33 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v15);
  v34 = v50;
  v50(v2, v24);
  _AssistantIntent.Phrase.init(stringLiteral:)(0xD00000000000001ALL, 0x80000001000118F0, &type metadata for StartDetectionTypeIntent, v15);
  v35 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v15);
  v34(v2, v24);
  v36 = v34;
  _AssistantIntent.Phrase.init(stringLiteral:)(0xD000000000000010, 0x8000000100011910, &type metadata for StartDetectionTypeIntent, v15);
  v37 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v15);
  v34(v2, v24);
  _AssistantIntent.Phrase.init(stringLiteral:)(0xD000000000000018, 0x8000000100011930, &type metadata for StartDetectionTypeIntent, v15);
  v38 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartDetectionTypeIntent, v15);
  v36(v2, v24);
  v39 = sub_1000059A8(&qword_100018290);
  v40 = swift_allocObject(v39);
  *(_OWORD *)(v40 + 16) = xmmword_1000107F0;
  v41 = v48;
  *(_QWORD *)(v40 + 32) = v49;
  *(_QWORD *)(v40 + 40) = v41;
  *(_QWORD *)(v40 + 48) = v46;
  *(_QWORD *)(v40 + 56) = v33;
  *(_QWORD *)(v40 + 64) = v35;
  *(_QWORD *)(v40 + 72) = v37;
  *(_QWORD *)(v40 + 80) = v38;
  v42 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v40);
  return v42;
}

uint64_t sub_100006CB8()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  Swift::String v17;
  uint64_t v18;
  void (*v19)(_BYTE *, uint64_t, uint64_t);
  Swift::String v20;
  uint64_t v21;
  Swift::String v22;
  void (*v23)(_BYTE *, uint64_t);
  Swift::String v24;
  void (*v25)(_BYTE *, uint64_t);
  _BYTE *v26;
  Swift::String v27;
  uint64_t v28;
  Swift::String v29;
  _BYTE *v30;
  Swift::String v31;
  Swift::String v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v39[12];
  unsigned int v40;
  void (*v41)(_BYTE *, uint64_t);
  _BYTE *v42;
  uint64_t v43;
  _BYTE *v44;
  uint64_t v45;
  void (*v46)(_BYTE *, uint64_t);
  void (*v47)(_BYTE *, uint64_t, uint64_t);
  uint64_t v48;

  v48 = sub_1000059A8(&qword_100018280);
  v43 = *(_QWORD *)(v48 - 8);
  __chkstk_darwin(v48);
  v1 = &v39[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v2 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = &v39[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_1000059A8(&qword_100018288);
  v7 = __chkstk_darwin(v6);
  v44 = &v39[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __chkstk_darwin(v7);
  v42 = &v39[-v10];
  v11 = __chkstk_darwin(v9);
  v13 = &v39[-v12];
  __chkstk_darwin(v11);
  v15 = &v39[-v14];
  v16 = sub_1000059E8();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(19, 1, &type metadata for StartDetectionTypeIntent, v16);
  v17._countAndFlagsBits = 543519573;
  v17._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  v18 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v19 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 104);
  v40 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v19(v5, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v2);
  v47 = v19;
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v46 = *(void (**)(_BYTE *, uint64_t))(v3 + 8);
  v46(v5, v2);
  v20._countAndFlagsBits = 0x65746564206F7420;
  v20._object = (void *)0xEF74786574207463;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v15, &type metadata for StartDetectionTypeIntent, v16);
  v45 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v1, &type metadata for StartDetectionTypeIntent, v16);
  v41 = *(void (**)(_BYTE *, uint64_t))(v43 + 8);
  v21 = v48;
  v41(v1, v48);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(15, 1, &type metadata for StartDetectionTypeIntent, v16);
  v22._countAndFlagsBits = 0x7420746365746544;
  v22._object = (void *)0xEF206E6920747865;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v22);
  v19(v5, v18, v2);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v23 = v46;
  v46(v5, v2);
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v24);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v13, &type metadata for StartDetectionTypeIntent, v16);
  v43 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v1, &type metadata for StartDetectionTypeIntent, v16);
  v25 = v41;
  v41(v1, v21);
  v26 = v42;
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(8, 1, &type metadata for StartDetectionTypeIntent, v16);
  v27._countAndFlagsBits = 0x206E692064616552;
  v27._object = (void *)0xE800000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  v28 = v40;
  v47(v5, v40, v2);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v23(v5, v2);
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v29);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v26, &type metadata for StartDetectionTypeIntent, v16);
  v42 = (_BYTE *)static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v1, &type metadata for StartDetectionTypeIntent, v16);
  v25(v1, v48);
  v30 = v44;
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(12, 1, &type metadata for StartDetectionTypeIntent, v16);
  v31._countAndFlagsBits = 543519573;
  v31._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v31);
  v47(v5, v28, v2);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v46(v5, v2);
  v32._countAndFlagsBits = 0x64616572206F7420;
  v32._object = (void *)0xE800000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v32);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v30, &type metadata for StartDetectionTypeIntent, v16);
  v33 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v1, &type metadata for StartDetectionTypeIntent, v16);
  v25(v1, v48);
  v34 = sub_1000059A8(&qword_100018290);
  v35 = swift_allocObject(v34);
  *(_OWORD *)(v35 + 16) = xmmword_100010800;
  v36 = v43;
  *(_QWORD *)(v35 + 32) = v45;
  *(_QWORD *)(v35 + 40) = v36;
  *(_QWORD *)(v35 + 48) = v42;
  *(_QWORD *)(v35 + 56) = v33;
  v37 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v35);
  return v37;
}

uint64_t sub_100007184()
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
  uint64_t v11;
  char *v12;
  unint64_t v13;
  Swift::String v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  Swift::String v17;
  uint64_t v18;
  Swift::String v19;
  uint64_t v20;
  void (*v21)(char *, _QWORD, uint64_t);
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  Swift::String v26;
  Swift::String v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  void (*v36)(char *, uint64_t);
  unsigned int v37;
  void (*v38)(char *, _QWORD, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v0 = sub_1000059A8(&qword_100018268);
  v39 = *(_QWORD *)(v0 - 8);
  v40 = v0;
  __chkstk_darwin(v0);
  v2 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000059A8(&qword_100018270);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v34 - v11;
  v13 = sub_100005A2C();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(21, 1, &type metadata for DescribeThisIntent, v13);
  v14._countAndFlagsBits = 543519573;
  v14._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  v15 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v38 = *(void (**)(char *, _QWORD, uint64_t))(v4 + 104);
  v37 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v38(v6, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v16 = *(void (**)(char *, uint64_t))(v4 + 8);
  v16(v6, v3);
  v36 = v16;
  v17._object = (void *)0x80000001000119B0;
  v17._countAndFlagsBits = 0xD000000000000011;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v12, &type metadata for DescribeThisIntent, v13);
  v41 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for DescribeThisIntent, v13);
  v18 = v40;
  v35 = *(void (**)(char *, uint64_t))(v39 + 8);
  v35(v2, v40);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(17, 1, &type metadata for DescribeThisIntent, v13);
  v19._object = (void *)0x80000001000119D0;
  v19._countAndFlagsBits = 0xD000000000000011;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v19);
  v20 = v15;
  v21 = v38;
  v38(v6, v20, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v16(v6, v3);
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v22);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for DescribeThisIntent, v13);
  v39 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for DescribeThisIntent, v13);
  v23 = v18;
  v24 = v18;
  v25 = v35;
  v35(v2, v23);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(27, 1, &type metadata for DescribeThisIntent, v13);
  v26._object = (void *)0x8000000100011D90;
  v26._countAndFlagsBits = 0x100000000000001BLL;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v26);
  v21(v6, v37, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v36(v6, v3);
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for DescribeThisIntent, v13);
  v28 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for DescribeThisIntent, v13);
  v25(v2, v24);
  v29 = sub_1000059A8(&qword_100018278);
  v30 = swift_allocObject(v29);
  *(_OWORD *)(v30 + 16) = xmmword_100010810;
  v31 = v39;
  *(_QWORD *)(v30 + 32) = v41;
  *(_QWORD *)(v30 + 40) = v31;
  *(_QWORD *)(v30 + 48) = v28;
  v32 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v30);
  return v32;
}

uint64_t sub_10000753C()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
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
  char *v13;
  unint64_t v14;
  Swift::String v15;
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  Swift::String v19;
  void (*v20)(char *, _QWORD, uint64_t);
  void (*v21)(char *, uint64_t);
  Swift::String v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  char *v25;
  Swift::String v26;
  Swift::String v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v34)(char *, uint64_t);
  void (*v35)(char *, uint64_t);
  void (*v36)(char *, _QWORD, uint64_t);
  unsigned int v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;

  v41 = sub_1000059A8(&qword_100018250);
  v38 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v1 = (char *)&v34 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000059A8(&qword_100018258);
  v7 = __chkstk_darwin(v6);
  v39 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v34 - v10;
  __chkstk_darwin(v9);
  v13 = (char *)&v34 - v12;
  v14 = sub_100005A70();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(40, 1, &type metadata for PointAndSpeakIntent, v14);
  v15._countAndFlagsBits = 543519573;
  v15._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  v16 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v36 = *(void (**)(char *, _QWORD, uint64_t))(v3 + 104);
  v37 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v36(v5, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v2);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v35 = *(void (**)(char *, uint64_t))(v3 + 8);
  v35(v5, v2);
  v17._countAndFlagsBits = 0x1000000000000024;
  v17._object = (void *)0x8000000100011D30;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v13, &type metadata for PointAndSpeakIntent, v14);
  v40 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v1, &type metadata for PointAndSpeakIntent, v14);
  v34 = *(void (**)(char *, uint64_t))(v38 + 8);
  v18 = v41;
  v34(v1, v41);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(24, 1, &type metadata for PointAndSpeakIntent, v14);
  v19._countAndFlagsBits = 543519573;
  v19._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v19);
  v20 = v36;
  v36(v5, v16, v2);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v21 = v35;
  v35(v5, v2);
  v22._object = (void *)0x8000000100011A70;
  v22._countAndFlagsBits = 0xD000000000000014;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v22);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v11, &type metadata for PointAndSpeakIntent, v14);
  v38 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v1, &type metadata for PointAndSpeakIntent, v14);
  v23 = v18;
  v24 = v34;
  v34(v1, v23);
  v25 = v39;
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(35, 1, &type metadata for PointAndSpeakIntent, v14);
  v26._object = (void *)0x8000000100011D60;
  v26._countAndFlagsBits = 0x1000000000000023;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v26);
  v20(v5, v37, v2);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v21(v5, v2);
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v25, &type metadata for PointAndSpeakIntent, v14);
  v28 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v1, &type metadata for PointAndSpeakIntent, v14);
  v24(v1, v41);
  v29 = sub_1000059A8(&qword_100018260);
  v30 = swift_allocObject(v29);
  *(_OWORD *)(v30 + 16) = xmmword_100010810;
  v31 = v38;
  *(_QWORD *)(v30 + 32) = v40;
  *(_QWORD *)(v30 + 40) = v31;
  *(_QWORD *)(v30 + 48) = v28;
  v32 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v30);
  return v32;
}

uint64_t sub_100007920(uint64_t a1)
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
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  Swift::String v15;
  uint64_t KeyPath;
  uint64_t v17;
  Swift::String v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  Swift::String v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  Swift::String v24;
  uint64_t v25;
  uint64_t v26;
  Swift::String v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  Swift::String v32;
  char *v33;
  Swift::String v34;
  Swift::String v35;
  uint64_t v36;
  uint64_t v37;
  Swift::String v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v45)(char *);
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t);
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v53 = a1;
  v54 = sub_1000059A8(&qword_100018238);
  v51 = *(void (**)(char *, uint64_t))(v54 - 8);
  __chkstk_darwin(v54);
  v2 = (char *)&v45 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v3 = *(_QWORD *)(v47 - 8);
  __chkstk_darwin(v47);
  v5 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000059A8(&qword_100018240);
  v7 = __chkstk_darwin(v6);
  v49 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v45 - v10;
  __chkstk_darwin(v9);
  v13 = (char *)&v45 - v12;
  v14 = sub_100005AB4();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(19, 2, &type metadata for StartActivityAppIntent, v14);
  v15._countAndFlagsBits = 0x207472617453;
  v15._object = (void *)0xE600000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  KeyPath = swift_getKeyPath(&unk_100010AB0);
  v52 = sub_100008EB4();
  v17 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v52);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v17, v6);
  swift_release(v17);
  v18._countAndFlagsBits = 0x7469766974636120;
  v18._object = (void *)0xED0000206E692079;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v18);
  v46 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v45 = *(void (**)(char *))(v3 + 104);
  v19 = v47;
  v45(v5);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v20 = *(void (**)(char *, uint64_t))(v3 + 8);
  v20(v5, v19);
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v21);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v13, &type metadata for StartActivityAppIntent, v14);
  v22 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartActivityAppIntent, v14);
  v23 = (void (*)(char *, uint64_t))*((_QWORD *)v51 + 1);
  v50 = v22;
  v51 = v23;
  v23(v2, v54);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(29, 2, &type metadata for StartActivityAppIntent, v14);
  v24._object = (void *)0x8000000100011D10;
  v24._countAndFlagsBits = 0x1000000000000010;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v24);
  v25 = swift_getKeyPath(&unk_100010AB0);
  v26 = _AssistantIntent.IntentProjection.subscript.getter(v25, v52);
  swift_release(v25);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v26, v6);
  swift_release(v26);
  v27._countAndFlagsBits = 0x7469766974636120;
  v27._object = (void *)0xED0000206E692079;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  v28 = v46;
  v29 = v19;
  v30 = v19;
  v31 = (void (*)(char *, uint64_t, uint64_t))v45;
  ((void (*)(char *, _QWORD, uint64_t))v45)(v5, v46, v30);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v20(v5, v29);
  v32._countAndFlagsBits = 0;
  v32._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v32);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v11, &type metadata for StartActivityAppIntent, v14);
  v48 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartActivityAppIntent, v14);
  v51(v2, v54);
  v33 = v49;
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(8, 2, &type metadata for StartActivityAppIntent, v14);
  v34._countAndFlagsBits = 543519573;
  v34._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v34);
  v31(v5, v28, v29);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v20(v5, v29);
  v35._countAndFlagsBits = 544106784;
  v35._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v35);
  v36 = swift_getKeyPath(&unk_100010AB0);
  v37 = _AssistantIntent.IntentProjection.subscript.getter(v36, v52);
  swift_release(v36);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v37, v6);
  swift_release(v37);
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v38);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v33, &type metadata for StartActivityAppIntent, v14);
  v39 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for StartActivityAppIntent, v14);
  v51(v2, v54);
  v40 = sub_1000059A8(&qword_100018248);
  v41 = swift_allocObject(v40);
  *(_OWORD *)(v41 + 16) = xmmword_100010810;
  v42 = v48;
  *(_QWORD *)(v41 + 32) = v50;
  *(_QWORD *)(v41 + 40) = v42;
  *(_QWORD *)(v41 + 48) = v39;
  v43 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v41);
  return v43;
}

uint64_t sub_100007E18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t KeyPath;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v0 = type metadata accessor for _AssistantIntent.Value(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100010AB0);
  v5 = sub_100008EB4();
  v6 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v5);
  swift_release(KeyPath);
  v7 = sub_100005AB4();
  _AssistantIntent.Value.init<A>(for:builder:)(v6, sub_100007F28, 0, v7);
  v8 = static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)(v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v9 = sub_1000059A8(&qword_100018230);
  v10 = swift_allocObject(v9);
  *(_OWORD *)(v10 + 16) = xmmword_100010A30;
  *(_QWORD *)(v10 + 32) = v8;
  v11 = static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v10);
  return v11;
}

uint64_t sub_100007F28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x5320656566666F43, 0xEB00000000706F68);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x74726F70726941, 0xE700000000000000);
  v2 = sub_1000059A8(&qword_1000181E8);
  v3 = swift_allocObject(v2);
  *(_OWORD *)(v3 + 16) = xmmword_100010820;
  *(_QWORD *)(v3 + 32) = v0;
  *(_QWORD *)(v3 + 40) = v1;
  v4 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v3);
  return v4;
}

uint64_t sub_100007FC8()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  Swift::String v12;
  uint64_t v13;
  void (*v14)(_BYTE *, uint64_t);
  Swift::String v15;
  uint64_t v16;
  Swift::String v17;
  void (*v18)(_BYTE *, _QWORD, uint64_t);
  Swift::String v19;
  uint64_t v20;
  void (*v21)(_BYTE *, uint64_t);
  _BYTE *v22;
  Swift::String v23;
  Swift::String v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v31[12];
  unsigned int v32;
  void (*v33)(_BYTE *, uint64_t);
  void (*v34)(_BYTE *, _QWORD, uint64_t);
  uint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;

  v38 = sub_1000059A8(&qword_100018210);
  v35 = *(_QWORD *)(v38 - 8);
  __chkstk_darwin(v38);
  v1 = &v31[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v2 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = &v31[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_1000059A8(&qword_100018218);
  v7 = __chkstk_darwin(v6);
  v36 = &v31[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  v10 = &v31[-v9];
  v11 = sub_100005AF8();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(21, 1, &type metadata for ReaderModeIntent, v11);
  v12._countAndFlagsBits = 0xD000000000000015;
  v12._object = (void *)0x8000000100011CB0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v12);
  v13 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v34 = *(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104);
  v32 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v34(v5, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v2);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v14 = *(void (**)(_BYTE *, uint64_t))(v3 + 8);
  v14(v5, v2);
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for ReaderModeIntent, v11);
  v37 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v1, &type metadata for ReaderModeIntent, v11);
  v33 = *(void (**)(_BYTE *, uint64_t))(v35 + 8);
  v16 = v38;
  v33(v1, v38);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(28, 1, &type metadata for ReaderModeIntent, v11);
  v17._object = (void *)0x8000000100011CD0;
  v17._countAndFlagsBits = 0x100000000000001CLL;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  v18 = v34;
  v34(v5, v13, v2);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v14(v5, v2);
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v19);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for ReaderModeIntent, v11);
  v35 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v1, &type metadata for ReaderModeIntent, v11);
  v20 = v16;
  v21 = v33;
  v33(v1, v20);
  v22 = v36;
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(20, 1, &type metadata for ReaderModeIntent, v11);
  v23._countAndFlagsBits = 543519573;
  v23._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v23);
  v18(v5, v32, v2);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v14(v5, v2);
  v24._object = (void *)0x8000000100011CF0;
  v24._countAndFlagsBits = 0xD000000000000010;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v24);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v22, &type metadata for ReaderModeIntent, v11);
  v25 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v1, &type metadata for ReaderModeIntent, v11);
  v21(v1, v38);
  v26 = sub_1000059A8(&qword_100018220);
  v27 = swift_allocObject(v26);
  *(_OWORD *)(v27 + 16) = xmmword_100010810;
  v28 = v35;
  *(_QWORD *)(v27 + 32) = v37;
  *(_QWORD *)(v27 + 40) = v28;
  *(_QWORD *)(v27 + 48) = v25;
  v29 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v27);
  return v29;
}

uint64_t sub_100008384()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
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
  unint64_t v14;
  Swift::String v15;
  void (*v16)(_BYTE *, uint64_t);
  Swift::String v17;
  uint64_t v18;
  void (*v19)(_BYTE *, uint64_t);
  Swift::String v20;
  Swift::String v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v28[12];
  unsigned int v29;
  void (*v30)(_BYTE *);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v0 = sub_1000059A8(&qword_1000181F8);
  v32 = *(_QWORD *)(v0 - 8);
  v33 = v0;
  __chkstk_darwin(v0);
  v2 = &v28[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v28[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_1000059A8(&qword_100018200);
  v8 = __chkstk_darwin(v7);
  v10 = &v28[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  v12 = &v28[-v11];
  v13 = type metadata accessor for MagnifierIntent(0);
  v14 = sub_100008DFC();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(14, 1, v13, v14);
  v15._countAndFlagsBits = 0x206E69206D6F6F5ALL;
  v15._object = (void *)0xEE0020676E697375;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  v29 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v30 = *(void (**)(_BYTE *))(v4 + 104);
  v30(v6);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v16 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v16(v6, v3);
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v12, v13, v14);
  v31 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, v13, v14);
  v18 = v33;
  v19 = *(void (**)(_BYTE *, uint64_t))(v32 + 8);
  v19(v2, v33);
  _AssistantIntent.Phrase.init(stringLiteral:)(0xD000000000000016, 0x8000000100011C90, v13, v14);
  v32 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, v13, v14);
  v19(v2, v18);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(6, 1, v13, v14);
  v20._countAndFlagsBits = 0x207472617453;
  v20._object = (void *)0xE600000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  ((void (*)(_BYTE *, _QWORD, uint64_t))v30)(v6, v29, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v16(v6, v3);
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v21);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, v13, v14);
  v22 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, v13, v14);
  v19(v2, v33);
  v23 = sub_1000059A8(&qword_100018208);
  v24 = swift_allocObject(v23);
  *(_OWORD *)(v24 + 16) = xmmword_100010810;
  v25 = v32;
  *(_QWORD *)(v24 + 32) = v31;
  *(_QWORD *)(v24 + 40) = v25;
  *(_QWORD *)(v24 + 48) = v22;
  v26 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v24);
  return v26;
}

uint64_t sub_1000086B4()
{
  return sub_10000875C(0xD000000000000018, 0x8000000100011C70);
}

uint64_t sub_1000086D0()
{
  return sub_10000875C(0xD000000000000018, 0x8000000100011C50);
}

uint64_t sub_1000086EC()
{
  return sub_10000875C(0xD000000000000016, 0x8000000100011C30);
}

uint64_t sub_100008708()
{
  return sub_10000875C(0xD000000000000015, 0x8000000100011C10);
}

uint64_t sub_100008724()
{
  return sub_10000875C(0xD000000000000017, 0x8000000100011BF0);
}

uint64_t sub_100008740()
{
  return sub_10000875C(0xD000000000000012, 0x8000000100011BD0);
}

uint64_t sub_10000875C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(a1, a2);
  v3 = sub_1000059A8(&qword_1000181E8);
  v4 = swift_allocObject(v3);
  *(_OWORD *)(v4 + 16) = xmmword_100010A30;
  *(_QWORD *)(v4 + 32) = v2;
  v5 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v4);
  return v5;
}

ValueMetadata *type metadata accessor for MagnifierAppAssistantIntents()
{
  return &type metadata for MagnifierAppAssistantIntents;
}

uint64_t sub_1000087D8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  void (*v8)(char *, uint64_t);
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v0 = type metadata accessor for MagnifierIntent(0);
  __chkstk_darwin(v0);
  v2 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for _AssistantIntent(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_10000E6A0(0);
  v7 = sub_1000059E8();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v29, sub_100005C3C, 0, &j_j___s10AppIntents16_AssistantIntentV21ParameterValueBuilderO10buildBlockSayAC0F0VGyFZ, 0, &type metadata for StartDetectionTypeIntent, v7);
  v28 = static _AssistantIntent.Builder.buildExpression(_:)(v6);
  v8 = *(void (**)(char *, uint64_t))(v4 + 8);
  v8(v6, v3);
  v29 = sub_10000E6A0(1);
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v29, sub_1000061B4, 0, &j_j___s10AppIntents16_AssistantIntentV21ParameterValueBuilderO10buildBlockSayAC0F0VGyFZ, 0, &type metadata for StartDetectionTypeIntent, v7);
  v27 = static _AssistantIntent.Builder.buildExpression(_:)(v6);
  v8(v6, v3);
  v29 = sub_10000E6A0(3);
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v29, sub_100006728, 0, &j_j___s10AppIntents16_AssistantIntentV21ParameterValueBuilderO10buildBlockSayAC0F0VGyFZ, 0, &type metadata for StartDetectionTypeIntent, v7);
  v26 = static _AssistantIntent.Builder.buildExpression(_:)(v6);
  v8(v6, v3);
  v29 = sub_10000E6A0(2);
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v29, sub_100006CB8, 0, &j_j___s10AppIntents16_AssistantIntentV21ParameterValueBuilderO10buildBlockSayAC0F0VGyFZ, 0, &type metadata for StartDetectionTypeIntent, v7);
  v9 = static _AssistantIntent.Builder.buildExpression(_:)(v6);
  v8(v6, v3);
  v10 = sub_100005A2C();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(v10, sub_100007184, 0, &j_j___s10AppIntents16_AssistantIntentV21ParameterValueBuilderO10buildBlockSayAC0F0VGyFZ, 0, &type metadata for DescribeThisIntent, v10);
  v11 = static _AssistantIntent.Builder.buildExpression(_:)(v6);
  v8(v6, v3);
  v12 = sub_100005A70();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(v12, sub_10000753C, 0, &j_j___s10AppIntents16_AssistantIntentV21ParameterValueBuilderO10buildBlockSayAC0F0VGyFZ, 0, &type metadata for PointAndSpeakIntent, v12);
  v13 = static _AssistantIntent.Builder.buildExpression(_:)(v6);
  v8(v6, v3);
  v29 = sub_10000C9CC();
  v14 = sub_100005AB4();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v29, sub_100007920, 0, sub_100007E18, 0, &type metadata for StartActivityAppIntent, v14);
  v15 = static _AssistantIntent.Builder.buildExpression(_:)(v6);
  v8(v6, v3);
  v16 = sub_100005AF8();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(v16, sub_100007FC8, 0, &j_j___s10AppIntents16_AssistantIntentV21ParameterValueBuilderO10buildBlockSayAC0F0VGyFZ, 0, &type metadata for ReaderModeIntent, v16);
  v17 = static _AssistantIntent.Builder.buildExpression(_:)(v6);
  v18 = ((uint64_t (*)(char *, uint64_t))v8)(v6, v3);
  MagnifierIntent.init()(v18);
  v19 = sub_100008DFC();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(v2, sub_100008384, 0, &j___s10AppIntents16_AssistantIntentV21ParameterValueBuilderO10buildBlockSayAC0F0VGyFZ, 0, v0, v19);
  v20 = static _AssistantIntent.Builder.buildExpression(_:)(v6);
  v8(v6, v3);
  v21 = sub_1000059A8(&qword_1000181F0);
  v22 = swift_allocObject(v21);
  *(_OWORD *)(v22 + 16) = xmmword_100010A40;
  v23 = v27;
  *(_QWORD *)(v22 + 32) = v28;
  *(_QWORD *)(v22 + 40) = v23;
  *(_QWORD *)(v22 + 48) = v26;
  *(_QWORD *)(v22 + 56) = v9;
  *(_QWORD *)(v22 + 64) = v11;
  *(_QWORD *)(v22 + 72) = v13;
  *(_QWORD *)(v22 + 80) = v15;
  *(_QWORD *)(v22 + 88) = v17;
  *(_QWORD *)(v22 + 96) = v20;
  v24 = static _AssistantIntent.Builder.buildBlock(_:)();
  swift_bridgeObjectRelease(v22);
  return v24;
}

uint64_t sub_100008BB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v0 = type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1000059E8();
  _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)(&type metadata for StartDetectionTypeIntent, sub_1000086B4, 0, &type metadata for StartDetectionTypeIntent, v4);
  v5 = static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)(v3);
  v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  v7 = sub_100005A2C();
  _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)(&type metadata for DescribeThisIntent, sub_1000086D0, 0, &type metadata for DescribeThisIntent, v7);
  v8 = static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)(v3);
  v6(v3, v0);
  v9 = sub_100005A70();
  _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)(&type metadata for PointAndSpeakIntent, sub_1000086EC, 0, &type metadata for PointAndSpeakIntent, v9);
  v10 = static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)(v3);
  v6(v3, v0);
  v11 = sub_100005AB4();
  _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)(&type metadata for StartActivityAppIntent, sub_100008708, 0, &type metadata for StartActivityAppIntent, v11);
  v12 = static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)(v3);
  v6(v3, v0);
  v13 = sub_100005AF8();
  _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)(&type metadata for ReaderModeIntent, sub_100008724, 0, &type metadata for ReaderModeIntent, v13);
  v14 = static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)(v3);
  v6(v3, v0);
  v15 = type metadata accessor for MagnifierIntent(0);
  v16 = sub_100008DFC();
  _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)(v15, sub_100008740, 0, v15, v16);
  v17 = static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)(v3);
  v6(v3, v0);
  v18 = sub_1000059A8(&qword_1000181E0);
  v19 = swift_allocObject(v18);
  *(_OWORD *)(v19 + 16) = xmmword_1000107E0;
  *(_QWORD *)(v19 + 32) = v5;
  *(_QWORD *)(v19 + 40) = v8;
  *(_QWORD *)(v19 + 48) = v10;
  *(_QWORD *)(v19 + 56) = v12;
  *(_QWORD *)(v19 + 64) = v14;
  *(_QWORD *)(v19 + 72) = v17;
  v20 = static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v19);
  return v20;
}

unint64_t sub_100008DFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000181D8;
  if (!qword_1000181D8)
  {
    v1 = type metadata accessor for MagnifierIntent(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for MagnifierIntent, v1);
    atomic_store(result, (unint64_t *)&qword_1000181D8);
  }
  return result;
}

_QWORD *sub_100008E44@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;
  _QWORD v4[2];

  result = IntentParameter.wrappedValue.getter(v4);
  v3 = v4[1];
  *a1 = v4[0];
  a1[1] = v3;
  return result;
}

uint64_t sub_100008E7C(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];

  v3 = *a1;
  v2 = a1[1];
  v5[0] = v3;
  v5[1] = v2;
  swift_bridgeObjectRetain(v2, a2);
  return IntentParameter.wrappedValue.setter(v5);
}

unint64_t sub_100008EB4()
{
  unint64_t result;

  result = qword_100018228;
  if (!qword_100018228)
  {
    result = swift_getWitnessTable(&unk_100010C28, &type metadata for MAGActivityEntity);
    atomic_store(result, (unint64_t *)&qword_100018228);
  }
  return result;
}

unint64_t sub_100008F00()
{
  unint64_t result;

  result = qword_100018298;
  if (!qword_100018298)
  {
    result = swift_getWitnessTable(&unk_100010B38, &type metadata for MAGActivityEntity);
    atomic_store(result, (unint64_t *)&qword_100018298);
  }
  return result;
}

unint64_t sub_100008F48()
{
  unint64_t result;

  result = qword_1000182A0;
  if (!qword_1000182A0)
  {
    result = swift_getWitnessTable(&unk_100010B70, &type metadata for MAGActivityEntity);
    atomic_store(result, (unint64_t *)&qword_1000182A0);
  }
  return result;
}

unint64_t sub_100008F90()
{
  unint64_t result;

  result = qword_1000182A8;
  if (!qword_1000182A8)
  {
    result = swift_getWitnessTable(&unk_100010BA0, &type metadata for MAGActivityEntity);
    atomic_store(result, (unint64_t *)&qword_1000182A8);
  }
  return result;
}

unint64_t sub_100008FD8()
{
  unint64_t result;

  result = qword_1000182B0;
  if (!qword_1000182B0)
  {
    result = swift_getWitnessTable(&unk_100010D08, &type metadata for MAGActivityQuery);
    atomic_store(result, (unint64_t *)&qword_1000182B0);
  }
  return result;
}

void *sub_10000901C()
{
  return &protocol witness table for String;
}

uint64_t sub_100009028()
{
  uint64_t v0;

  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AD50(v0, qword_100019E88);
  sub_10000AD38(v0, (uint64_t)qword_100019E88);
  return TypeDisplayRepresentation.init(stringLiteral:)(0x7974697669746341, 0xE800000000000000);
}

unint64_t sub_10000908C()
{
  unint64_t result;

  result = qword_1000182B8;
  if (!qword_1000182B8)
  {
    result = swift_getWitnessTable(&unk_100010BD8, &type metadata for MAGActivityEntity);
    atomic_store(result, (unint64_t *)&qword_1000182B8);
  }
  return result;
}

unint64_t sub_1000090D4()
{
  unint64_t result;

  result = qword_1000182C0;
  if (!qword_1000182C0)
  {
    result = swift_getWitnessTable(&unk_100010C00, &type metadata for MAGActivityEntity);
    atomic_store(result, (unint64_t *)&qword_1000182C0);
  }
  return result;
}

unint64_t sub_100009120()
{
  unint64_t result;

  result = qword_1000182C8;
  if (!qword_1000182C8)
  {
    result = swift_getWitnessTable(&unk_100010C80, &type metadata for MAGActivityEntity);
    atomic_store(result, (unint64_t *)&qword_1000182C8);
  }
  return result;
}

void *sub_100009164()
{
  return &protocol witness table for String;
}

uint64_t sub_100009170@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = v2[1];
  *a2 = *v2;
  a2[1] = v3;
  return swift_bridgeObjectRetain(v3, a1);
}

uint64_t sub_100009180@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1000180C0 != -1)
    swift_once(&qword_1000180C0, sub_100009028);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_10000AD38(v2, (uint64_t)qword_100019E88);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_1000091F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000182D0;
  if (!qword_1000182D0)
  {
    v1 = sub_100009240(&qword_1000182D8);
    result = swift_getWitnessTable(&protocol conformance descriptor for EmptyResolverSpecification<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000182D0);
  }
  return result;
}

uint64_t sub_100009240(uint64_t *a1)
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

uint64_t sub_100009284(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100009650();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000092C0()
{
  unint64_t result;

  result = qword_1000182E0;
  if (!qword_1000182E0)
  {
    result = swift_getWitnessTable(&unk_100010CB0, &type metadata for MAGActivityEntity);
    atomic_store(result, (unint64_t *)&qword_1000182E0);
  }
  return result;
}

uint64_t sub_100009304()
{
  uint64_t *v0;
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
  char *v13;
  uint64_t v14;
  void *v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  uint64_t v19;
  uint64_t v21;

  v1 = sub_1000059A8(&qword_100018370);
  __chkstk_darwin(v1);
  v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1000059A8(&qword_100018378);
  __chkstk_darwin(v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LocalizedStringResource(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for String.LocalizationValue.StringInterpolation(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *v0;
  v15 = (void *)v0[1];
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(0, 1);
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v16);
  v17._countAndFlagsBits = v14;
  v17._object = v15;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v17);
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v18);
  LocalizedStringResource.init(stringInterpolation:)(v13);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  v19 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v3, 1, 1, v19);
  return DisplayRepresentation.init(title:subtitle:image:)(v10, v6, v3);
}

uint64_t sub_1000094B8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100009120();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_1000094F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  *(_QWORD *)(v3 + 16) = a1;
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100018360 + dword_100018360);
  v6 = (_QWORD *)swift_task_alloc(unk_100018364);
  *(_QWORD *)(v3 + 24) = v6;
  *v6 = v3;
  v6[1] = sub_100009560;
  return v8(a2, a3);
}

uint64_t sub_100009560(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 24);
  v6 = *v2;
  swift_task_dealloc(v5);
  if (!v1)
    **(_QWORD **)(v4 + 16) = a1;
  return (*(uint64_t (**)(void))(v6 + 8))();
}

unint64_t sub_1000095C0()
{
  unint64_t result;

  result = qword_1000182F0;
  if (!qword_1000182F0)
  {
    result = swift_getWitnessTable(&unk_100010D60, &type metadata for MAGActivityQuery);
    atomic_store(result, (unint64_t *)&qword_1000182F0);
  }
  return result;
}

unint64_t sub_100009608()
{
  unint64_t result;

  result = qword_1000182F8;
  if (!qword_1000182F8)
  {
    result = swift_getWitnessTable(&unk_100010DC0, &type metadata for MAGActivityQuery);
    atomic_store(result, (unint64_t *)&qword_1000182F8);
  }
  return result;
}

unint64_t sub_100009650()
{
  unint64_t result;

  result = qword_100018300[0];
  if (!qword_100018300[0])
  {
    result = swift_getWitnessTable(&unk_100010AE0, &type metadata for MAGActivityEntity);
    atomic_store(result, qword_100018300);
  }
  return result;
}

uint64_t sub_100009694(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_100018350 + dword_100018350);
  v3 = (_QWORD *)swift_task_alloc(unk_100018354);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1000096F4;
  return v5(a1);
}

uint64_t sub_1000096F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(*v2 + 16);
  v5 = *v2;
  v6 = swift_task_dealloc(v4);
  if (!v1)
    v6 = a1;
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

uint64_t sub_100009748(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_100018340 + dword_100018340);
  v2 = (_QWORD *)swift_task_alloc(unk_100018344);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000AD90;
  return v4();
}

unint64_t sub_1000097A8()
{
  unint64_t result;

  result = qword_100018318;
  if (!qword_100018318)
  {
    result = swift_getWitnessTable(&unk_100010DE8, &type metadata for MAGActivityQuery);
    atomic_store(result, (unint64_t *)&qword_100018318);
  }
  return result;
}

unint64_t sub_1000097F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018320;
  if (!qword_100018320)
  {
    v1 = sub_100009240(qword_100018328);
    sub_100008EB4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_100018320);
  }
  return result;
}

uint64_t sub_100009854(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100008FD8();
  *v5 = v2;
  v5[1] = sub_1000098C0;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_1000098C0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100009908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to DynamicOptionsProvider.defaultResult()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1000098C0;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

ValueMetadata *type metadata accessor for MAGActivityQuery()
{
  return &type metadata for MAGActivityQuery;
}

_QWORD *initializeBufferWithCopyOfBuffer for MAGActivityEntity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3, a2);
  return a1;
}

uint64_t destroy for MAGActivityEntity(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for MAGActivityEntity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3, a2);
  swift_bridgeObjectRelease(v4);
  return a1;
}

__n128 initializeWithTake for MAGActivityEntity(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for MAGActivityEntity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for MAGActivityEntity(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MAGActivityEntity(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MAGActivityEntity()
{
  return &type metadata for MAGActivityEntity;
}

uint64_t sub_100009ACC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100009B04(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100009AE8(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100009C6C(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_100009B04(char a1, int64_t a2, char a3, char *a4)
{
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
        goto LABEL_32;
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
    v10 = sub_1000059A8(&qword_100018348);
    v11 = (char *)swift_allocObject(v10);
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
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100009C6C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  size_t v15;
  uint64_t v17;
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
    v14 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_1000059A8(&qword_100018358);
  v11 = *(_QWORD *)(type metadata accessor for MAGActivity(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v14 = (_QWORD *)swift_allocObject(v10);
  v15 = j__malloc_size(v14);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v15 - v13 == 0x8000000000000000 && v12 == -1)
    goto LABEL_34;
  v14[2] = v8;
  v14[3] = 2 * ((uint64_t)(v15 - v13) / v12);
LABEL_19:
  v17 = type metadata accessor for MAGActivity(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v20 = (char *)v14 + v19;
  v21 = (char *)a4 + v19;
  if ((a1 & 1) != 0)
  {
    if (v14 < a4 || v20 >= &v21[*(_QWORD *)(v18 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v20, v21, v8, v17);
    }
    else if (v14 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
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
    return (uint64_t)v14;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100009E4C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
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
  BOOL v23;
  void (*v24)(char *, char *, uint64_t);
  char *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t *v35;
  unint64_t v36;
  uint64_t (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  char *v40;
  _QWORD *v41;
  uint64_t v42;
  char *v43;
  char *v44;

  v5 = type metadata accessor for MAGActivity(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v40 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v43 = (char *)&v34 - v9;
  result = (uint64_t)&_swiftEmptyArrayStorage;
  v44 = (char *)&_swiftEmptyArrayStorage;
  v39 = *(_QWORD *)(a1 + 16);
  if (!v39)
    return result;
  v34 = v2;
  v11 = 0;
  v12 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v13 = *(_QWORD *)(v6 + 72);
  v41 = a2;
  v42 = v13;
  v36 = v12;
  v38 = a1 + v12;
  v37 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v35 = a2 + 7;
  while (1)
  {
    v14 = v5;
    v15 = v37(v43, v38 + v42 * v11, v5);
    v16 = MAGActivity.name.getter(v15);
    v18 = v17;
    v19 = a2[2];
    if (v19)
    {
      v20 = v16;
      v21 = a2[4];
      v22 = a2[5];
      v23 = v21 == v20 && v22 == v18;
      if (v23 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(v21, v22, v20, v18, 0), (result & 1) != 0))
      {
LABEL_11:
        swift_bridgeObjectRelease(v18);
        v24 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
        v5 = v14;
        v24(v40, v43, v14);
        v25 = v44;
        if ((swift_isUniquelyReferenced_nonNull_native(v44) & 1) == 0)
        {
          sub_100009AE8(0, *((_QWORD *)v25 + 2) + 1, 1);
          v25 = v44;
        }
        v27 = *((_QWORD *)v25 + 2);
        v26 = *((_QWORD *)v25 + 3);
        if (v27 >= v26 >> 1)
        {
          sub_100009AE8(v26 > 1, v27 + 1, 1);
          v25 = v44;
        }
        *((_QWORD *)v25 + 2) = v27 + 1;
        v24(&v25[v36 + v27 * v42], v40, v14);
        v44 = v25;
        a2 = v41;
        goto LABEL_4;
      }
      a2 = v41;
      if (v19 != 1)
        break;
    }
LABEL_3:
    swift_bridgeObjectRelease(v18);
    v5 = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v43, v14);
LABEL_4:
    if (++v11 == v39)
      return (uint64_t)v44;
  }
  v28 = v35;
  v29 = 1;
  while (1)
  {
    v30 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    v31 = *(v28 - 1);
    v32 = *v28;
    if (v31 == v20 && v32 == v18)
      goto LABEL_11;
    result = _stringCompareWithSmolCheck(_:_:expecting:)(v31, v32, v20, v18, 0);
    if ((result & 1) != 0)
      goto LABEL_11;
    v28 += 2;
    ++v29;
    v23 = v30 == v19;
    a2 = v41;
    if (v23)
      goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A0DC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[2] = a1;
  v2 = type metadata accessor for MAGActivity(0);
  v1[3] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[4] = v3;
  v1[5] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000A13C, 0, 0);
}

uint64_t sub_10000A13C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 48) = v1;
  *(_QWORD *)(v0 + 56) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000A1A8, v2, v3);
}

uint64_t sub_10000A1A8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = swift_release(*(_QWORD *)(v0 + 56));
  *(_QWORD *)(v0 + 64) = static CompositionRoot.activityStore.getter(v1);
  return swift_task_switch(sub_10000A1EC, 0, 0);
}

uint64_t sub_10000A1EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 48);
  *(_QWORD *)(v0 + 72) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000A24C, v2, v3);
}

uint64_t sub_10000A24C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[8];
  v2 = swift_release(v0[9]);
  v0[10] = MAGActivityStore.activities.getter(v2);
  swift_release(v1);
  return swift_task_switch(sub_10000A298, 0, 0);
}

uint64_t sub_10000A298(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, unint64_t, uint64_t);
  uint64_t v21;

  v3 = *(_QWORD *)(v2 + 80);
  v4 = *(_QWORD **)(v2 + 16);
  swift_bridgeObjectRetain(v4, a2);
  v5 = sub_100009E4C(v3, v4);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  v6 = *(_QWORD *)(v5 + 16);
  if (v6)
  {
    v7 = *(_QWORD *)(v2 + 32);
    sub_100009ACC(0, v6, 0);
    v8 = v5 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    v21 = *(_QWORD *)(v7 + 72);
    v19 = v5;
    v20 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v9 = *(_QWORD *)(v2 + 40);
      v10 = *(_QWORD *)(v2 + 24);
      v11 = v20(v9, v8, v10);
      v12 = MAGActivity.id.getter(v11);
      v14 = v13;
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v10);
      if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0)
        sub_100009ACC(0, _swiftEmptyArrayStorage[2] + 1, 1);
      v16 = _swiftEmptyArrayStorage[2];
      v15 = _swiftEmptyArrayStorage[3];
      if (v16 >= v15 >> 1)
        sub_100009ACC(v15 > 1, v16 + 1, 1);
      _swiftEmptyArrayStorage[2] = v16 + 1;
      v17 = (char *)&_swiftEmptyArrayStorage[2 * v16];
      *((_QWORD *)v17 + 4) = v12;
      *((_QWORD *)v17 + 5) = v14;
      v8 += v21;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease(v19);
  }
  else
  {
    swift_bridgeObjectRelease(v5);
  }
  swift_task_dealloc(*(_QWORD *)(v2 + 40));
  return (*(uint64_t (**)(_QWORD *))(v2 + 8))(_swiftEmptyArrayStorage);
}

_QWORD *sub_10000A444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void (*v26)(char *, char *, uint64_t);
  _QWORD *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(char *, uint64_t, uint64_t);
  char *v38;
  _QWORD v39[4];
  _QWORD *v40;

  v35 = type metadata accessor for MAGActivity(0);
  v7 = __chkstk_darwin(v35);
  v38 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v31 - v10;
  result = _swiftEmptyArrayStorage;
  v40 = _swiftEmptyArrayStorage;
  v13 = *(_QWORD *)(a1 + 16);
  if (v13)
  {
    v14 = *(unsigned __int8 *)(v9 + 80);
    v15 = *(_QWORD *)(v9 + 72);
    v31 = v3;
    v32 = (v14 + 32) & ~v14;
    v16 = a1 + v32;
    v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v36 = a3;
    v37 = v17;
    v18 = v9;
    v33 = v9;
    v34 = a2;
    v19 = v35;
    for (i = v17(v11, a1 + v32, v35); ; i = v37(v11, v16, v19))
    {
      v21 = MAGActivity.id.getter(i);
      v23 = v22;
      v39[2] = v21;
      v39[3] = v22;
      v39[0] = a2;
      v39[1] = v36;
      v24 = sub_10000ACF4();
      v25 = StringProtocol.localizedCaseInsensitiveContains<A>(_:)(v39, &type metadata for String, &type metadata for String, v24, v24);
      swift_bridgeObjectRelease(v23);
      if ((v25 & 1) != 0)
      {
        v26 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
        v26(v38, v11, v19);
        v27 = v40;
        if ((swift_isUniquelyReferenced_nonNull_native(v40) & 1) == 0)
        {
          sub_100009AE8(0, v27[2] + 1, 1);
          v27 = v40;
        }
        v29 = v27[2];
        v28 = v27[3];
        if (v29 >= v28 >> 1)
        {
          sub_100009AE8(v28 > 1, v29 + 1, 1);
          v27 = v40;
        }
        v27[2] = v29 + 1;
        v30 = (uint64_t)v27 + v32 + v29 * v15;
        v19 = v35;
        v26((char *)v30, v38, v35);
        v40 = v27;
        v18 = v33;
        a2 = v34;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v18 + 8))(v11, v19);
      }
      v16 += v15;
      if (!--v13)
        break;
    }
    return v40;
  }
  return result;
}

uint64_t sub_10000A654(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[2] = a1;
  v2[3] = a2;
  v3 = type metadata accessor for MAGActivity(0);
  v2[4] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[5] = v4;
  v2[6] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000A6B4, 0, 0);
}

uint64_t sub_10000A6B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 56) = v1;
  *(_QWORD *)(v0 + 64) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000A720, v2, v3);
}

uint64_t sub_10000A720()
{
  uint64_t v0;
  uint64_t v1;

  v1 = swift_release(*(_QWORD *)(v0 + 64));
  *(_QWORD *)(v0 + 72) = static CompositionRoot.activityStore.getter(v1);
  return swift_task_switch(sub_10000A764, 0, 0);
}

uint64_t sub_10000A764()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 56);
  *(_QWORD *)(v0 + 80) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000A7C4, v2, v3);
}

uint64_t sub_10000A7C4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[9];
  v2 = swift_release(v0[10]);
  v0[11] = MAGActivityStore.activities.getter(v2);
  swift_release(v1);
  return swift_task_switch(sub_10000A810, 0, 0);
}

uint64_t sub_10000A810(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  _QWORD *v20;
  uint64_t (*v21)(uint64_t, char *, uint64_t);
  uint64_t v22;

  v3 = *(_QWORD *)(v2 + 88);
  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(_QWORD *)(v2 + 24);
  swift_bridgeObjectRetain(v5, a2);
  v6 = sub_10000A444(v3, v4, v5);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v3);
  v7 = v6[2];
  if (v7)
  {
    v8 = *(_QWORD *)(v2 + 40);
    sub_100009ACC(0, v7, 0);
    v9 = (char *)v6 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    v22 = *(_QWORD *)(v8 + 72);
    v20 = v6;
    v21 = *(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 16);
    do
    {
      v10 = *(_QWORD *)(v2 + 48);
      v11 = *(_QWORD *)(v2 + 32);
      v12 = v21(v10, v9, v11);
      v13 = MAGActivity.id.getter(v12);
      v15 = v14;
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v11);
      if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0)
        sub_100009ACC(0, _swiftEmptyArrayStorage[2] + 1, 1);
      v17 = _swiftEmptyArrayStorage[2];
      v16 = _swiftEmptyArrayStorage[3];
      if (v17 >= v16 >> 1)
        sub_100009ACC(v16 > 1, v17 + 1, 1);
      _swiftEmptyArrayStorage[2] = v17 + 1;
      v18 = &_swiftEmptyArrayStorage[2 * v17];
      v18[4] = v13;
      v18[5] = v15;
      v9 += v22;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease(v20);
  }
  else
  {
    swift_bridgeObjectRelease(v6);
  }
  swift_task_dealloc(*(_QWORD *)(v2 + 48));
  return (*(uint64_t (**)(_QWORD *))(v2 + 8))(_swiftEmptyArrayStorage);
}

uint64_t sub_10000A9C0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = type metadata accessor for MAGActivity(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000AA1C, 0, 0);
}

uint64_t sub_10000AA1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 40) = v1;
  *(_QWORD *)(v0 + 48) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000AA88, v2, v3);
}

uint64_t sub_10000AA88()
{
  uint64_t v0;
  uint64_t v1;

  v1 = swift_release(*(_QWORD *)(v0 + 48));
  *(_QWORD *)(v0 + 56) = static CompositionRoot.activityStore.getter(v1);
  return swift_task_switch(sub_10000AACC, 0, 0);
}

uint64_t sub_10000AACC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 40);
  *(_QWORD *)(v0 + 64) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000AB2C, v2, v3);
}

uint64_t sub_10000AB2C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[7];
  v2 = swift_release(v0[8]);
  v0[9] = MAGActivityStore.activities.getter(v2);
  swift_release(v1);
  return swift_task_switch(sub_10000AB78, 0, 0);
}

uint64_t sub_10000AB78()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 24);
    sub_100009ACC(0, v2, 0);
    v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v16 = *(_QWORD *)(v3 + 72);
    do
    {
      v5 = *(_QWORD *)(v0 + 32);
      v6 = *(_QWORD *)(v0 + 16);
      v7 = v15(v5, v4, v6);
      v8 = MAGActivity.id.getter(v7);
      v10 = v9;
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v6);
      if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0)
        sub_100009ACC(0, _swiftEmptyArrayStorage[2] + 1, 1);
      v12 = _swiftEmptyArrayStorage[2];
      v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1)
        sub_100009ACC(v11 > 1, v12 + 1, 1);
      _swiftEmptyArrayStorage[2] = v12 + 1;
      v13 = &_swiftEmptyArrayStorage[2 * v12];
      v13[4] = v8;
      v13[5] = v10;
      v4 += v16;
      --v2;
    }
    while (v2);
  }
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 72));
  swift_task_dealloc(*(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(_swiftEmptyArrayStorage);
}

unint64_t sub_10000ACF4()
{
  unint64_t result;

  result = qword_100018368;
  if (!qword_100018368)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100018368);
  }
  return result;
}

uint64_t sub_10000AD38(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_10000AD50(uint64_t a1, uint64_t *a2)
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

unint64_t sub_10000AD9C()
{
  unint64_t result;

  result = qword_100018380;
  if (!qword_100018380)
  {
    result = swift_getWitnessTable(&unk_100010EE0, &type metadata for DescribeThisIntent);
    atomic_store(result, (unint64_t *)&qword_100018380);
  }
  return result;
}

unint64_t sub_10000ADE4()
{
  unint64_t result;

  result = qword_100018388;
  if (!qword_100018388)
  {
    result = swift_getWitnessTable(&unk_100010F08, &type metadata for DescribeThisIntent);
    atomic_store(result, (unint64_t *)&qword_100018388);
  }
  return result;
}

uint64_t sub_10000AE28(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000123B8, 1);
}

uint64_t sub_10000AE38(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100005A2C();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_10000AE78()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000AD50(v0, qword_100019EA0);
  sub_10000AD38(v0, (uint64_t)qword_100019EA0);
  return LocalizedStringResource.init(stringLiteral:)(0xD00000000000001ELL, 0x8000000100011E10);
}

uint64_t sub_10000AED8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1000180C8 != -1)
    swift_once(&qword_1000180C8, sub_10000AE78);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_10000AD38(v2, (uint64_t)qword_100019EA0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000AF48()
{
  return 1;
}

uint64_t sub_10000AF60(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[2] = a1;
  v2 = type metadata accessor for MAGAction(0);
  v1[3] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[4] = v3;
  v1[5] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for MainActor(0);
  v1[6] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v1[7] = v5;
  v1[8] = v6;
  return swift_task_switch(sub_10000AFF4, v5, v6);
}

uint64_t sub_10000AFF4()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[9] = static CompositionRoot.actionHandler.getter();
  static MAGAction.describeImage()();
  v1 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to MAGActionHandler.send(_:) + 1));
  v0[10] = v1;
  *v1 = v0;
  v1[1] = sub_10000B060;
  return MAGActionHandler.send(_:)(v0[5]);
}

uint64_t sub_10000B060()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();

  v2 = *v1;
  v4 = *(_QWORD *)(*v1 + 72);
  v3 = *(_QWORD *)(*v1 + 80);
  v6 = *(_QWORD *)(*v1 + 32);
  v5 = *(_QWORD *)(*v1 + 40);
  v7 = *(_QWORD *)(*v1 + 24);
  *(_QWORD *)(*v1 + 88) = v0;
  swift_task_dealloc(v3);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_release(v4);
  if (v0)
    v8 = sub_10000B138;
  else
    v8 = sub_10000B0F0;
  return swift_task_switch(v8, *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 64));
}

uint64_t sub_10000B0F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = swift_release(*(_QWORD *)(v0 + 48));
  static IntentResult.result<>()(v2);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000B138()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_release(*(_QWORD *)(v0 + 48));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000B174(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100005A2C();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for DescribeThisIntent()
{
  return &type metadata for DescribeThisIntent;
}

unint64_t sub_10000B1B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018398;
  if (!qword_100018398)
  {
    v1 = sub_100009240(&qword_1000183A0);
    result = swift_getWitnessTable(&protocol conformance descriptor for IntentResultContainer<A, B, C, D>, v1);
    atomic_store(result, (unint64_t *)&qword_100018398);
  }
  return result;
}

unint64_t sub_10000B200()
{
  unint64_t result;

  result = qword_1000183A8;
  if (!qword_1000183A8)
  {
    result = swift_getWitnessTable(&unk_100010FE0, &type metadata for ReaderModeIntent);
    atomic_store(result, (unint64_t *)&qword_1000183A8);
  }
  return result;
}

unint64_t sub_10000B248()
{
  unint64_t result;

  result = qword_1000183B0;
  if (!qword_1000183B0)
  {
    result = swift_getWitnessTable(&unk_100011008, &type metadata for ReaderModeIntent);
    atomic_store(result, (unint64_t *)&qword_1000183B0);
  }
  return result;
}

uint64_t sub_10000B28C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000123FC, 1);
}

uint64_t sub_10000B29C(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100005AF8();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_10000B2DC()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000AD50(v0, qword_100019EB8);
  sub_10000AD38(v0, (uint64_t)qword_100019EB8);
  return LocalizedStringResource.init(stringLiteral:)(0xD00000000000001CLL, 0x8000000100011E30);
}

uint64_t sub_10000B33C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1000180D0 != -1)
    swift_once(&qword_1000180D0, sub_10000B2DC);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_10000AD38(v2, (uint64_t)qword_100019EB8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000B3AC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[2] = a1;
  v2 = type metadata accessor for MAGAction(0);
  v1[3] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[4] = v3;
  v1[5] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for MainActor(0);
  v1[6] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v1[7] = v5;
  v1[8] = v6;
  return swift_task_switch(sub_10000B440, v5, v6);
}

uint64_t sub_10000B440()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[9] = static CompositionRoot.actionHandler.getter();
  static MAGAction.readerMode()();
  v1 = (_QWORD *)swift_task_alloc(async function pointer to MAGActionHandler.send(_:)[1]);
  v0[10] = v1;
  *v1 = v0;
  v1[1] = sub_10000B060;
  return MAGActionHandler.send(_:)(v0[5]);
}

uint64_t sub_10000B4AC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100005AF8();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for ReaderModeIntent()
{
  return &type metadata for ReaderModeIntent;
}

unint64_t sub_10000B4E8()
{
  unint64_t result;

  result = qword_1000183C0;
  if (!qword_1000183C0)
  {
    result = swift_getWitnessTable(&unk_1000110E0, &type metadata for PointAndSpeakIntent);
    atomic_store(result, (unint64_t *)&qword_1000183C0);
  }
  return result;
}

unint64_t sub_10000B530()
{
  unint64_t result;

  result = qword_1000183C8;
  if (!qword_1000183C8)
  {
    result = swift_getWitnessTable(&unk_100011108, &type metadata for PointAndSpeakIntent);
    atomic_store(result, (unint64_t *)&qword_1000183C8);
  }
  return result;
}

uint64_t sub_10000B574(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100012440, 1);
}

uint64_t sub_10000B584(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100005A70();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_10000B5C4()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000AD50(v0, qword_100019ED0);
  sub_10000AD38(v0, (uint64_t)qword_100019ED0);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000020, 0x8000000100011E50);
}

uint64_t sub_10000B624@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1000180D8 != -1)
    swift_once(&qword_1000180D8, sub_10000B5C4);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_10000AD38(v2, (uint64_t)qword_100019ED0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000B694(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[2] = a1;
  v2 = type metadata accessor for MAGAction(0);
  v1[3] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[4] = v3;
  v1[5] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for MainActor(0);
  v1[6] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v1[7] = v5;
  v1[8] = v6;
  return swift_task_switch(sub_10000B728, v5, v6);
}

uint64_t sub_10000B728()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[9] = static CompositionRoot.actionHandler.getter();
  static MAGAction.startPointAndSpeak()();
  v1 = (_QWORD *)swift_task_alloc(async function pointer to MAGActionHandler.send(_:)[1]);
  v0[10] = v1;
  *v1 = v0;
  v1[1] = sub_10000B060;
  return MAGActionHandler.send(_:)(v0[5]);
}

uint64_t sub_10000B794(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100005A70();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for PointAndSpeakIntent()
{
  return &type metadata for PointAndSpeakIntent;
}

unint64_t sub_10000B7D0()
{
  unint64_t result;

  result = qword_1000183D8;
  if (!qword_1000183D8)
  {
    result = swift_getWitnessTable(&unk_1000111E0, &type metadata for StartActivityAppIntent);
    atomic_store(result, (unint64_t *)&qword_1000183D8);
  }
  return result;
}

unint64_t sub_10000B818()
{
  unint64_t result;

  result = qword_1000183E0;
  if (!qword_1000183E0)
  {
    result = swift_getWitnessTable(&unk_100011208, &type metadata for StartActivityAppIntent);
    atomic_store(result, (unint64_t *)&qword_1000183E0);
  }
  return result;
}

uint64_t sub_10000B85C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000124AC, 1);
}

uint64_t sub_10000B86C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100012484, 1);
}

uint64_t sub_10000B87C()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

uint64_t sub_10000B8AC()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000AD50(v0, qword_100019EE8);
  sub_10000AD38(v0, (uint64_t)qword_100019EE8);
  return LocalizedStringResource.init(stringLiteral:)(0xD00000000000001FLL, 0x8000000100012070);
}

uint64_t sub_10000B90C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  Swift::String v7;
  uint64_t KeyPath;
  uint64_t v9;
  Swift::String v10;
  uint64_t v12;

  v0 = sub_1000059A8(&qword_100018430);
  __chkstk_darwin(v0);
  v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1000059A8(&qword_100018438);
  __chkstk_darwin(v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100005AB4();
  ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)(6, 1, &type metadata for StartActivityAppIntent, v6);
  v7._countAndFlagsBits = 0x207472617453;
  v7._object = (void *)0xE600000000000000;
  ParameterSummaryString.StringInterpolation.appendLiteral(_:)(v7);
  KeyPath = swift_getKeyPath(&unk_100011248);
  v9 = sub_1000059A8(&qword_100018440);
  ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)(KeyPath, v3, v9);
  swift_release(KeyPath);
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  ParameterSummaryString.StringInterpolation.appendLiteral(_:)(v10);
  ParameterSummaryString.init(stringInterpolation:)(v5, &type metadata for StartActivityAppIntent, v6);
  return IntentParameterSummary.init(_:table:)(v2, 0x6E65746E49707041, 0xEA00000000007374, &type metadata for StartActivityAppIntent, v6);
}

uint64_t sub_10000BA7C()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_10000BA9C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
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

  v2[9] = a1;
  v2[10] = a2;
  v3 = type metadata accessor for Logger(0);
  v2[11] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[12] = v4;
  v2[13] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MAGAction(0);
  v2[14] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[15] = v6;
  v2[16] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000059A8(&qword_100018418);
  v2[17] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MAGActivity(0);
  v2[18] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v2[19] = v9;
  v10 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[20] = swift_task_alloc(v10);
  v2[21] = swift_task_alloc(v10);
  v11 = type metadata accessor for MainActor(0);
  v2[22] = static MainActor.shared.getter();
  v12 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
  v2[23] = v12;
  v2[24] = v13;
  return swift_task_switch(sub_10000BBB4, v12, v13);
}

uint64_t sub_10000BBB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_QWORD, unint64_t, _QWORD);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
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
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
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

  v2 = static CompositionRoot.activityStore.getter(a1);
  v3 = MAGActivityStore.activities.getter(v2);
  swift_release(v2);
  v5 = *(_QWORD *)(v3 + 16);
  if (v5)
  {
    v54 = v3;
    v6 = *(_QWORD *)(v1 + 152);
    v7 = v3 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v8 = *(_QWORD *)(v6 + 72);
    v9 = *(uint64_t (**)(_QWORD, unint64_t, _QWORD))(v6 + 16);
    swift_bridgeObjectRetain(v3, v4);
    while (1)
    {
      v10 = v9(*(_QWORD *)(v1 + 160), v7, *(_QWORD *)(v1 + 144));
      v11 = MAGActivity.id.getter(v10);
      v13 = v12;
      IntentParameter.wrappedValue.getter((_QWORD *)(v1 + 16));
      v14 = *(_QWORD *)(v1 + 16);
      v15 = *(_QWORD *)(v1 + 24);
      if (v11 == v14 && v13 == v15)
      {
        swift_bridgeObjectRelease(v13);
        v3 = v54;
        swift_bridgeObjectRelease(v54);
        goto LABEL_13;
      }
      v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v13, v14, *(_QWORD *)(v1 + 24), 0);
      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease(v13);
      if ((v17 & 1) != 0)
        break;
      (*(void (**)(_QWORD, _QWORD))(v6 + 8))(*(_QWORD *)(v1 + 160), *(_QWORD *)(v1 + 144));
      v7 += v8;
      if (!--v5)
      {
        v3 = v54;
        swift_bridgeObjectRelease(v54);
        goto LABEL_10;
      }
    }
    v3 = v54;
    v13 = v54;
LABEL_13:
    v19 = *(_QWORD *)(v1 + 152);
    v20 = *(_QWORD *)(v1 + 160);
    v22 = *(_QWORD *)(v1 + 136);
    v21 = *(_QWORD *)(v1 + 144);
    swift_bridgeObjectRelease(v13);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v22, v20, v21);
    v18 = 0;
  }
  else
  {
LABEL_10:
    v18 = 1;
  }
  v24 = *(_QWORD *)(v1 + 144);
  v23 = *(_QWORD *)(v1 + 152);
  v25 = *(_QWORD *)(v1 + 136);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56))(v25, v18, 1, v24);
  swift_bridgeObjectRelease(v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v25, 1, v24) == 1)
  {
    v26 = *(_QWORD *)(v1 + 136);
    v27 = *(_QWORD *)(v1 + 80);
    swift_release(*(_QWORD *)(v1 + 176));
    v28 = sub_10000CBD0(v26);
    static Log.default.getter(v28);
    v29 = swift_retain_n(v27, 2);
    v30 = Logger.logObject.getter(v29);
    v31 = static os_log_type_t.error.getter();
    v32 = os_log_type_enabled(v30, v31);
    v34 = *(_QWORD *)(v1 + 96);
    v33 = *(_QWORD *)(v1 + 104);
    v35 = *(_QWORD *)(v1 + 80);
    v36 = *(_QWORD *)(v1 + 88);
    if (v32)
    {
      v56 = *(_QWORD *)(v1 + 88);
      v55 = *(_QWORD *)(v1 + 104);
      v37 = (uint8_t *)swift_slowAlloc(12, -1);
      v38 = swift_slowAlloc(32, -1);
      v57 = v38;
      *(_DWORD *)v37 = 136315138;
      IntentParameter.wrappedValue.getter((_QWORD *)(v1 + 48));
      v39 = *(_QWORD *)(v1 + 56);
      *(_QWORD *)(v1 + 64) = sub_10000C38C(*(_QWORD *)(v1 + 48), v39, &v57);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 64, v1 + 72, v37 + 4, v37 + 12);
      swift_bridgeObjectRelease(v39);
      swift_release_n(v35, 2);
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Cannot handle requested unknown activity entity: %s", v37, 0xCu);
      swift_arrayDestroy(v38, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v38, -1, -1);
      swift_slowDealloc(v37, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v55, v56);
    }
    else
    {
      swift_release_n(*(_QWORD *)(v1 + 80), 2);

      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v36);
    }
    v44 = type metadata accessor for MAGError(0);
    v45 = sub_10000CC10();
    swift_allocError(v44, v45, 0, 0);
    v47 = v46;
    IntentParameter.wrappedValue.getter((_QWORD *)(v1 + 32));
    v48 = *(_QWORD *)(v1 + 40);
    *v47 = *(_QWORD *)(v1 + 32);
    v47[1] = v48;
    v49 = (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v44 - 8) + 104))(v47, enum case for MAGError.unknownRequestedActivityEntity(_:), v44);
    swift_willThrow(v49);
    v50 = *(_QWORD *)(v1 + 160);
    v52 = *(_QWORD *)(v1 + 128);
    v51 = *(_QWORD *)(v1 + 136);
    v53 = *(_QWORD *)(v1 + 104);
    swift_task_dealloc(*(_QWORD *)(v1 + 168));
    swift_task_dealloc(v50);
    swift_task_dealloc(v51);
    swift_task_dealloc(v52);
    swift_task_dealloc(v53);
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
  else
  {
    v40 = *(_QWORD *)(v1 + 168);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v1 + 152) + 32))(v40, *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 144));
    v41 = static MAGAction.start(activity:)(v40);
    *(_QWORD *)(v1 + 200) = static CompositionRoot.actionHandler.getter(v41);
    v42 = (_QWORD *)swift_task_alloc(async function pointer to MAGActionHandler.send(_:)[1]);
    *(_QWORD *)(v1 + 208) = v42;
    *v42 = v1;
    v42[1] = sub_10000C008;
    return MAGActionHandler.send(_:)(*(_QWORD *)(v1 + 128));
  }
}

uint64_t sub_10000C008()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 208);
  *(_QWORD *)(*(_QWORD *)v1 + 216) = v0;
  swift_task_dealloc(v3);
  swift_release(v2[25]);
  if (v0)
    v4 = sub_10000C12C;
  else
    v4 = sub_10000C070;
  return swift_task_switch(v4, v2[23], v2[24]);
}

uint64_t sub_10000C070()
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
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 144);
  v7 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 128);
  v8 = *(_QWORD *)(v0 + 112);
  v11 = *(_QWORD *)(v0 + 104);
  v9 = swift_release(*(_QWORD *)(v0 + 176));
  static IntentResult.result<>()(v9);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v4);
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000C12C()
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

  v1 = *(_QWORD *)(v0 + 168);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 152);
  v5 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 128);
  v6 = *(_QWORD *)(v0 + 112);
  swift_release(*(_QWORD *)(v0 + 176));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  v7 = *(_QWORD *)(v0 + 160);
  v9 = *(_QWORD *)(v0 + 128);
  v8 = *(_QWORD *)(v0 + 136);
  v10 = *(_QWORD *)(v0 + 104);
  swift_task_dealloc(*(_QWORD *)(v0 + 168));
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000C1CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1000180E0 != -1)
    swift_once(&qword_1000180E0, sub_10000B8AC);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_10000AD38(v2, (uint64_t)qword_100019EE8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000C240(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc(dword_100018414);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1000098C0;
  return sub_10000BA9C(a1, v4);
}

uint64_t sub_10000C298@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_10000C9CC();
  *a1 = result;
  return result;
}

uint64_t sub_10000C2BC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100005AB4();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for StartActivityAppIntent()
{
  return &type metadata for StartActivityAppIntent;
}

uint64_t sub_10000C2F4()
{
  return sub_10000C34C(&qword_1000183F0, &qword_1000183F8, (uint64_t)&protocol conformance descriptor for IntentParameterSummary<A>);
}

uint64_t sub_10000C320()
{
  return sub_10000C34C((unint64_t *)&qword_100018398, &qword_1000183A0, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_10000C34C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100009240(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000C38C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13[3];
  void *ObjectType;

  v6 = sub_10000C45C(v13, 0, 0, 1, a1, a2);
  v8 = v13[0];
  if (v6)
  {
    v9 = v6;
    ObjectType = (void *)swift_getObjectType();
    v13[0] = v9;
    v10 = *a3;
    if (*a3)
    {
      sub_10000CC78((uint64_t)v13, *a3);
      *a3 = v10 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    v11 = *a3;
    if (*a3)
    {
      sub_10000CC78((uint64_t)v13, *a3);
      *a3 = v11 + 32;
    }
    swift_bridgeObjectRetain(a2, v7);
  }
  sub_10000CC58(v13);
  return v8;
}

uint64_t sub_10000C45C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000C614(a5, a6);
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

uint64_t sub_10000C614(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000C6A8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_10000C880(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000C880(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000C6A8(uint64_t a1, unint64_t a2)
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
      v5 = sub_10000C81C(v4, 0);
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
        return _swiftEmptyArrayStorage;
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
    return _swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_10000C81C(uint64_t a1, uint64_t a2)
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
    return _swiftEmptyArrayStorage;
  v4 = sub_1000059A8(&qword_100018428);
  v5 = (_QWORD *)swift_allocObject(v4);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000C880(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000059A8(&qword_100018428);
    v11 = (char *)swift_allocObject(v10);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
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

uint64_t sub_10000C9CC()
{
  uint64_t v0;
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v18;
  _QWORD v20[2];

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v1 = *(_QWORD *)(v0 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000059A8(&qword_100018400);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)v20 - v7;
  v9 = sub_1000059A8(&qword_100018378);
  __chkstk_darwin(v9);
  v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000059A8(&qword_100018408);
  LocalizedStringResource.init(stringLiteral:)(0x5954495649544341, 0xE800000000000000);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v16 = type metadata accessor for IntentDialog(0);
  v20[0] = 0;
  v20[1] = 0;
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v17(v8, 1, 1, v16);
  v17(v6, 1, 1, v16);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  v18 = sub_100009650();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v15, v11, v20, v8, v6, v3, v18);
}

uint64_t sub_10000CBD0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000059A8(&qword_100018418);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000CC10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018420;
  if (!qword_100018420)
  {
    v1 = type metadata accessor for MAGError(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for MAGError, v1);
    atomic_store(result, (unint64_t *)&qword_100018420);
  }
  return result;
}

uint64_t sub_10000CC58(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000CC78(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000CCB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = IntentParameter.projectedValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000CCDC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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
  _QWORD v19[2];

  v0 = sub_1000059A8(&qword_100018378);
  __chkstk_darwin(v0);
  v2 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[0] = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v19[0] - 8);
  __chkstk_darwin(v19[0]);
  v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000AD50(v16, static DetectionTypeEnum.typeDisplayRepresentation);
  sub_10000AD38(v16, (uint64_t)static DetectionTypeEnum.typeDisplayRepresentation);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x8000000100012190);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, _QWORD))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v19[0]);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0, 0, v8, v5, "Title for entity representing the detection types for when users make changes to detection type. The detection type tells us whether to detect people, doors, text or furniture", 175, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v2, 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v2);
}

uint64_t DetectionTypeEnum.typeDisplayRepresentation.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_1000180E8 != -1)
    swift_once(&qword_1000180E8, sub_10000CCDC);
  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  return sub_10000AD38(v0, (uint64_t)static DetectionTypeEnum.typeDisplayRepresentation);
}

uint64_t static DetectionTypeEnum.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1000180E8 != -1)
    swift_once(&qword_1000180E8, sub_10000CCDC);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_10000AD38(v2, (uint64_t)static DetectionTypeEnum.typeDisplayRepresentation);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_10000CFA8()
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  unint64_t v40;
  _BYTE *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t);
  char *v50;
  char *v51;
  void (*v52)(char *, uint64_t, uint64_t, uint64_t);
  void (*v53)(char *, _QWORD, uint64_t, uint64_t);
  char *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  char *v68;
  unint64_t result;
  char *v70;
  char *v71;
  _BYTE *v72;
  void (*v73)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  void (*v85)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v86;
  unsigned int v87;
  void (*v88)(char *);
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;

  v0 = sub_1000059A8(&qword_100018370);
  v1 = __chkstk_darwin(v0);
  v83 = (char *)&v70 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __chkstk_darwin(v1);
  v81 = (char *)&v70 - v4;
  __chkstk_darwin(v3);
  v76 = (char *)&v70 - v5;
  v6 = sub_1000059A8(&qword_100018378);
  v7 = __chkstk_darwin(v6);
  v82 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v80 = (char *)&v70 - v10;
  __chkstk_darwin(v9);
  v92 = (char *)&v70 - v11;
  v12 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v91 = *(_QWORD *)(v12 - 8);
  v86 = v12;
  __chkstk_darwin(v12);
  v14 = (char *)&v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for Locale(0);
  __chkstk_darwin(v15);
  v17 = (char *)&v70 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v18);
  v20 = (char *)&v70 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = type metadata accessor for LocalizedStringResource(0);
  v21 = *(_QWORD *)(v90 - 8);
  v22 = __chkstk_darwin(v90);
  v79 = (char *)&v70 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __chkstk_darwin(v22);
  v77 = (char *)&v70 - v25;
  v26 = __chkstk_darwin(v24);
  v75 = (char *)&v70 - v27;
  __chkstk_darwin(v26);
  v29 = (char *)&v70 - v28;
  v30 = sub_1000059A8(&qword_100018508);
  v31 = sub_1000059A8(&qword_100018510);
  v32 = *(_QWORD *)(v31 - 8);
  v93 = *(_QWORD *)(v32 + 72);
  v33 = (*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  v34 = swift_allocObject(v30);
  v78 = v34;
  *(_OWORD *)(v34 + 16) = xmmword_100010800;
  v89 = v34 + v33;
  v74 = v31;
  *(_BYTE *)(v34 + v33) = 0;
  v35 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000010, 0x80000001000120B0);
  static Locale.current.getter(v35);
  v87 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v88 = *(void (**)(char *))(v91 + 104);
  v88(v14);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v20, 0, 0, v17, v14, "Display name for people detection", 33, 2);
  v85 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  v36 = v92;
  v37 = v90;
  v85(v92, 1, 1, v90);
  v38 = v76;
  DisplayRepresentation.Image.init(systemName:isTemplate:)(0xD000000000000025, 0x8000000100011790, 2);
  v91 = type metadata accessor for DisplayRepresentation.Image(0);
  v73 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v91 - 8) + 56);
  v73(v38, 0, 1, v91);
  v39 = v38;
  DisplayRepresentation.init(title:subtitle:image:)(v29, v36, v38);
  v40 = v89;
  v41 = (_BYTE *)(v89 + v93);
  *v41 = 1;
  v72 = &v41[*(int *)(v31 + 48)];
  v42 = v20;
  v70 = v20;
  v43 = String.LocalizationValue.init(stringLiteral:)(0x41505F53524F4F44, 0xEF524554454D4152);
  v44 = v17;
  v71 = v17;
  static Locale.current.getter(v43);
  v45 = v14;
  v84 = v14;
  v46 = v14;
  v47 = v87;
  v48 = v86;
  v49 = (void (*)(char *, uint64_t, uint64_t))v88;
  ((void (*)(char *, _QWORD, uint64_t))v88)(v46, v87, v86);
  v50 = v75;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v42, 0, 0, v44, v45, "Display name for door detection", 31, 2);
  v51 = v92;
  v52 = v85;
  v85(v92, 1, 1, v37);
  DisplayRepresentation.Image.init(systemName:isTemplate:)(0xD000000000000016, 0x8000000100011850, 2);
  v53 = v73;
  v73(v39, 0, 1, v91);
  DisplayRepresentation.init(title:subtitle:image:)(v50, v51, v39);
  v92 = (char *)(2 * v93);
  v92[v40] = 2;
  v54 = v70;
  v55 = String.LocalizationValue.init(stringLiteral:)(0x5241505F54584554, 0xEE00524554454D41);
  v56 = v71;
  static Locale.current.getter(v55);
  v57 = v84;
  v49(v84, v47, v48);
  v58 = v77;
  v59 = v56;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v54, 0, 0, v56, v57, "Display name for text detection", 31, 2);
  v60 = v80;
  v61 = v90;
  v52(v80, 1, 1, v90);
  v62 = v81;
  DisplayRepresentation.Image.init(systemName:isTemplate:)(0x6569762E74786574, 0xEF7265646E696677, 2);
  v63 = v91;
  v53(v62, 0, 1, v91);
  DisplayRepresentation.init(title:subtitle:image:)(v58, v60, v62);
  v92[v93 + v89] = 3;
  v64 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x8000000100012140);
  static Locale.current.getter(v64);
  v65 = v84;
  ((void (*)(char *, _QWORD, uint64_t))v88)(v84, v87, v86);
  v66 = v79;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v54, 0, 0, v59, v65, "Display name for furniture detection", 36, 2);
  v67 = v82;
  v85(v82, 1, 1, v61);
  v68 = v83;
  DisplayRepresentation.Image.init(systemName:isTemplate:)(0x6C69662E61666F73, 0xE90000000000006CLL, 2);
  v53(v68, 0, 1, v63);
  DisplayRepresentation.init(title:subtitle:image:)(v66, v67, v68);
  result = sub_10000D71C(v78);
  static DetectionTypeEnum.caseDisplayRepresentations = result;
  return result;
}

unint64_t sub_10000D71C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = sub_1000059A8(&qword_100018510);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v24 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v24);
    return (unint64_t)v8;
  }
  sub_1000059A8(&qword_100018518);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = &v5[*(int *)(v2 + 48)];
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v26 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_10000F1AC(v13, (uint64_t)v5);
    v15 = *v5;
    result = sub_10000F210(*v5);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v8[6] + result) = v15;
    v19 = v8[7];
    v20 = type metadata accessor for DisplayRepresentation(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v18, v10, v20);
    v21 = v8[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_12;
    v8[2] = v23;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      v24 = v26;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t *DetectionTypeEnum.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_1000180F0 != -1)
    swift_once(&qword_1000180F0, sub_10000CFA8);
  return &static DetectionTypeEnum.caseDisplayRepresentations;
}

uint64_t static DetectionTypeEnum.caseDisplayRepresentations.getter()
{
  uint64_t v0;
  _BYTE v2[24];

  if (qword_1000180F0 != -1)
    swift_once(&qword_1000180F0, sub_10000CFA8);
  swift_beginAccess(&static DetectionTypeEnum.caseDisplayRepresentations, v2, 0, 0);
  return swift_bridgeObjectRetain(static DetectionTypeEnum.caseDisplayRepresentations, v0);
}

uint64_t static DetectionTypeEnum.caseDisplayRepresentations.setter(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[24];

  if (qword_1000180F0 != -1)
    swift_once(&qword_1000180F0, sub_10000CFA8);
  swift_beginAccess(&static DetectionTypeEnum.caseDisplayRepresentations, v4, 1, 0);
  v2 = static DetectionTypeEnum.caseDisplayRepresentations;
  static DetectionTypeEnum.caseDisplayRepresentations = a1;
  return swift_bridgeObjectRelease(v2);
}

void *static DetectionTypeEnum.caseDisplayRepresentations.modify(uint64_t a1)
{
  if (qword_1000180F0 != -1)
    swift_once(&qword_1000180F0, sub_10000CFA8);
  swift_beginAccess(&static DetectionTypeEnum.caseDisplayRepresentations, a1, 33, 0);
  return &j__swift_endAccess;
}

_UNKNOWN **static DetectionTypeEnum.allCases.getter()
{
  return &off_100014900;
}

uint64_t DetectionTypeEnum.rawValue.getter(char a1)
{
  return *(_QWORD *)&aPeople_1[8 * a1];
}

uint64_t sub_10000DA6C(char *a1, char *a2)
{
  return sub_10000DA78(*a1, *a2);
}

uint64_t sub_10000DA78(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v2 = 8 * a1;
  v3 = *(_QWORD *)&aPeople_1[v2];
  v4 = *(_QWORD *)&aFurnitur[v2 + 8];
  v5 = 8 * a2;
  v6 = *(_QWORD *)&aPeople_1[v5];
  v7 = *(_QWORD *)&aFurnitur[v5 + 8];
  if (v3 == v6 && v4 == v7)
    v9 = 1;
  else
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v6, *(_QWORD *)&aFurnitur[8 * a2 + 8], 0);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v7);
  return v9 & 1;
}

Swift::Int sub_10000DAFC()
{
  char *v0;

  return sub_10000DB04(*v0);
}

Swift::Int sub_10000DB04(char a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, 0);
  v2 = 8 * a1;
  v3 = *(_QWORD *)&aFurnitur[v2 + 8];
  String.hash(into:)(v5, *(_QWORD *)&aPeople_1[v2], v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_10000DB6C(uint64_t a1)
{
  char *v1;

  return sub_10000DB74(a1, *v1);
}

uint64_t sub_10000DB74(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 8 * a2;
  v3 = *(_QWORD *)&aFurnitur[v2 + 8];
  String.hash(into:)(a1, *(_QWORD *)&aPeople_1[v2], v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_10000DBB4(uint64_t a1)
{
  char *v1;

  return sub_10000DBBC(a1, *v1);
}

Swift::Int sub_10000DBBC(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6, a1);
  v3 = 8 * a2;
  v4 = *(_QWORD *)&aFurnitur[v3 + 8];
  String.hash(into:)(v6, *(_QWORD *)&aPeople_1[v3], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

unint64_t sub_10000DC20@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = _s9Magnifier17DetectionTypeEnumO8rawValueACSgSS_tcfC_0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000DC4C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = DetectionTypeEnum.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000DC74@<X0>(uint64_t a1@<X8>)
{
  return sub_10000E588(&qword_1000180E8, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)static DetectionTypeEnum.typeDisplayRepresentation, (uint64_t)sub_10000CCDC, a1);
}

uint64_t sub_10000DC98(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000EBB8();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10000DCD0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000EB34();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

void sub_10000DD08(_QWORD *a1@<X8>)
{
  *a1 = &off_100014928;
}

uint64_t sub_10000DD18()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000AD50(v0, qword_100019F20);
  sub_10000AD38(v0, (uint64_t)qword_100019F20);
  return LocalizedStringResource.init(stringLiteral:)(0xD00000000000001FLL, 0x8000000100012090);
}

uint64_t sub_10000DD78()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  Swift::String v7;
  uint64_t KeyPath;
  uint64_t v9;
  Swift::String v10;
  uint64_t v12;

  v0 = sub_1000059A8(&qword_1000184F0);
  __chkstk_darwin(v0);
  v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1000059A8(&qword_1000184F8);
  __chkstk_darwin(v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000059E8();
  ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)(7, 1, &type metadata for StartDetectionTypeIntent, v6);
  v7._countAndFlagsBits = 0x20746365746544;
  v7._object = (void *)0xE700000000000000;
  ParameterSummaryString.StringInterpolation.appendLiteral(_:)(v7);
  KeyPath = swift_getKeyPath(&unk_100011630);
  v9 = sub_1000059A8(&qword_100018500);
  ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)(KeyPath, v3, v9);
  swift_release(KeyPath);
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  ParameterSummaryString.StringInterpolation.appendLiteral(_:)(v10);
  ParameterSummaryString.init(stringInterpolation:)(v5, &type metadata for StartDetectionTypeIntent, v6);
  return IntentParameterSummary.init(_:table:)(v2, 0x6E65746E49707041, 0xEA00000000007374, &type metadata for StartDetectionTypeIntent, v6);
}

uint64_t sub_10000DEEC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2[2] = a1;
  v2[3] = a2;
  v3 = type metadata accessor for MAGAction(0);
  v2[4] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[5] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[6] = swift_task_alloc(v5);
  v2[7] = swift_task_alloc(v5);
  v2[8] = swift_task_alloc(v5);
  v2[9] = swift_task_alloc(v5);
  v6 = type metadata accessor for MainActor(0);
  v2[10] = static MainActor.shared.getter();
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  v2[11] = v7;
  v2[12] = v8;
  return swift_task_switch(sub_10000DFA8, v7, v8);
}

void sub_10000DFA8()
{
  uint64_t v0;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 200));
  __asm { BR              X10 }
}

uint64_t sub_10000DFE4(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v1[13] = static CompositionRoot.actionHandler.getter(a1);
  ((void (*)(void))static MAGAction.detectPeople())();
  v2 = (_QWORD *)swift_task_alloc(async function pointer to MAGActionHandler.send(_:)[1]);
  v1[14] = v2;
  *v2 = v1;
  v2[1] = sub_10000E0FC;
  return MAGActionHandler.send(_:)(v1[9]);
}

uint64_t sub_10000E0FC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();

  v2 = *v1;
  v4 = *(_QWORD *)(*v1 + 104);
  v3 = *(_QWORD *)(*v1 + 112);
  v5 = *(_QWORD *)(*v1 + 72);
  v6 = *(_QWORD *)(*v1 + 32);
  v7 = *(_QWORD *)(*v1 + 40);
  *(_QWORD *)(*v1 + 120) = v0;
  swift_task_dealloc(v3);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  swift_release(v4);
  if (v0)
    v8 = sub_10000E3B4;
  else
    v8 = sub_10000E18C;
  return swift_task_switch(v8, *(_QWORD *)(v2 + 88), *(_QWORD *)(v2 + 96));
}

uint64_t sub_10000E18C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = swift_release(*(_QWORD *)(v0 + 80));
  static IntentResult.result<>()(v5);
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E204()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();

  v2 = *v1;
  v4 = *(_QWORD *)(*v1 + 128);
  v3 = *(_QWORD *)(*v1 + 136);
  v5 = *(_QWORD *)(*v1 + 64);
  v6 = *(_QWORD *)(*v1 + 32);
  v7 = *(_QWORD *)(*v1 + 40);
  *(_QWORD *)(*v1 + 144) = v0;
  swift_task_dealloc(v3);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  swift_release(v4);
  if (v0)
    v8 = sub_10000E420;
  else
    v8 = sub_10000F1F4;
  return swift_task_switch(v8, *(_QWORD *)(v2 + 88), *(_QWORD *)(v2 + 96));
}

uint64_t sub_10000E294()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();

  v2 = *v1;
  v4 = *(_QWORD *)(*v1 + 152);
  v3 = *(_QWORD *)(*v1 + 160);
  v5 = *(_QWORD *)(*v1 + 56);
  v6 = *(_QWORD *)(*v1 + 32);
  v7 = *(_QWORD *)(*v1 + 40);
  *(_QWORD *)(*v1 + 168) = v0;
  swift_task_dealloc(v3);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  swift_release(v4);
  if (v0)
    v8 = sub_10000E48C;
  else
    v8 = sub_10000F1F4;
  return swift_task_switch(v8, *(_QWORD *)(v2 + 88), *(_QWORD *)(v2 + 96));
}

uint64_t sub_10000E324()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();

  v2 = *v1;
  v4 = *(_QWORD *)(*v1 + 176);
  v3 = *(_QWORD *)(*v1 + 184);
  v6 = *(_QWORD *)(*v1 + 40);
  v5 = *(_QWORD *)(*v1 + 48);
  v7 = *(_QWORD *)(*v1 + 32);
  *(_QWORD *)(*v1 + 192) = v0;
  swift_task_dealloc(v3);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_release(v4);
  if (v0)
    v8 = sub_10000E4F8;
  else
    v8 = sub_10000F1F4;
  return swift_task_switch(v8, *(_QWORD *)(v2 + 88), *(_QWORD *)(v2 + 96));
}

uint64_t sub_10000E3B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  swift_release(*(_QWORD *)(v0 + 80));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E420()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  swift_release(*(_QWORD *)(v0 + 80));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E48C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  swift_release(*(_QWORD *)(v0 + 80));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E4F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 48);
  swift_release(*(_QWORD *)(v0 + 80));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E564@<X0>(uint64_t a1@<X8>)
{
  return sub_10000E588(&qword_1000180F8, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100019F20, (uint64_t)sub_10000DD18, a1);
}

uint64_t sub_10000E588@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  if (*a1 != -1)
    swift_once(a1, a4);
  v8 = a2(0);
  v9 = sub_10000AD38(v8, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a5, v9, v8);
}

uint64_t sub_10000E5FC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc(dword_1000184EC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1000098C0;
  return sub_10000DEEC(a1, v4);
}

uint64_t sub_10000E654@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_10000EF68();
  *a1 = result;
  return result;
}

uint64_t sub_10000E678(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000059E8();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_10000E6A0(int a1)
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v20;
  uint64_t v21;
  uint64_t v23;
  int v24;
  char v25;
  char v26;

  v24 = a1;
  v1 = type metadata accessor for InputConnectionBehavior(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000059A8(&qword_100018400);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v23 - v9;
  v11 = sub_1000059A8(&qword_100018378);
  __chkstk_darwin(v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000059A8(&qword_1000184E0);
  LocalizedStringResource.init(stringLiteral:)(0x41505F534D455449, 0xEF524554454D4152);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  v26 = 4;
  v18 = type metadata accessor for IntentDialog(0);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v10, 1, 1, v18);
  v19(v8, 1, 1, v18);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, enum case for InputConnectionBehavior.default(_:), v1);
  v20 = sub_10000EBB8();
  v21 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v17, v13, &v26, v10, v8, v4, &off_100014858, v20);
  v25 = v24;
  swift_retain();
  IntentParameter.wrappedValue.setter(&v25);
  swift_release(v21);
  return v21;
}

unint64_t _s9Magnifier17DetectionTypeEnumO8rawValueACSgSS_tcfC_0(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100014880, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 4)
    return 4;
  else
    return v3;
}

unint64_t sub_10000E930()
{
  unint64_t result;

  result = qword_100018448;
  if (!qword_100018448)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for DetectionTypeEnum, &type metadata for DetectionTypeEnum);
    atomic_store(result, (unint64_t *)&qword_100018448);
  }
  return result;
}

unint64_t sub_10000E978()
{
  unint64_t result;

  result = qword_100018450;
  if (!qword_100018450)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for DetectionTypeEnum, &type metadata for DetectionTypeEnum);
    atomic_store(result, (unint64_t *)&qword_100018450);
  }
  return result;
}

unint64_t sub_10000E9C0()
{
  unint64_t result;

  result = qword_100018458;
  if (!qword_100018458)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for DetectionTypeEnum, &type metadata for DetectionTypeEnum);
    atomic_store(result, (unint64_t *)&qword_100018458);
  }
  return result;
}

unint64_t sub_10000EA08()
{
  unint64_t result;

  result = qword_100018460;
  if (!qword_100018460)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for DetectionTypeEnum, &type metadata for DetectionTypeEnum);
    atomic_store(result, (unint64_t *)&qword_100018460);
  }
  return result;
}

void *sub_10000EA4C()
{
  return &protocol witness table for String;
}

unint64_t sub_10000EA5C()
{
  unint64_t result;

  result = qword_100018468;
  if (!qword_100018468)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for DetectionTypeEnum, &type metadata for DetectionTypeEnum);
    atomic_store(result, (unint64_t *)&qword_100018468);
  }
  return result;
}

unint64_t sub_10000EAA4()
{
  unint64_t result;

  result = qword_100018470;
  if (!qword_100018470)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for DetectionTypeEnum, &type metadata for DetectionTypeEnum);
    atomic_store(result, (unint64_t *)&qword_100018470);
  }
  return result;
}

unint64_t sub_10000EAEC()
{
  unint64_t result;

  result = qword_100018478;
  if (!qword_100018478)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for DetectionTypeEnum, &type metadata for DetectionTypeEnum);
    atomic_store(result, (unint64_t *)&qword_100018478);
  }
  return result;
}

unint64_t sub_10000EB34()
{
  unint64_t result;

  result = qword_100018480;
  if (!qword_100018480)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for DetectionTypeEnum, &type metadata for DetectionTypeEnum);
    atomic_store(result, (unint64_t *)&qword_100018480);
  }
  return result;
}

uint64_t sub_10000EB78(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_10000EBB8();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>, 1);
}

unint64_t sub_10000EBB8()
{
  unint64_t result;

  result = qword_100018488;
  if (!qword_100018488)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for DetectionTypeEnum, &type metadata for DetectionTypeEnum);
    atomic_store(result, (unint64_t *)&qword_100018488);
  }
  return result;
}

unint64_t sub_10000EC00()
{
  unint64_t result;

  result = qword_100018490;
  if (!qword_100018490)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for DetectionTypeEnum, &type metadata for DetectionTypeEnum);
    atomic_store(result, (unint64_t *)&qword_100018490);
  }
  return result;
}

unint64_t sub_10000EC48()
{
  unint64_t result;

  result = qword_100018498;
  if (!qword_100018498)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for DetectionTypeEnum, &type metadata for DetectionTypeEnum);
    atomic_store(result, (unint64_t *)&qword_100018498);
  }
  return result;
}

unint64_t sub_10000EC90()
{
  unint64_t result;

  result = qword_1000184A0;
  if (!qword_1000184A0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for DetectionTypeEnum, &type metadata for DetectionTypeEnum);
    atomic_store(result, (unint64_t *)&qword_1000184A0);
  }
  return result;
}

uint64_t sub_10000ECD4()
{
  return sub_10000C34C(&qword_1000184A8, &qword_1000184B0, (uint64_t)&protocol conformance descriptor for [A]);
}

unint64_t sub_10000ED04()
{
  unint64_t result;

  result = qword_1000184B8;
  if (!qword_1000184B8)
  {
    result = swift_getWitnessTable(&unk_1000115A0, &type metadata for StartDetectionTypeIntent);
    atomic_store(result, (unint64_t *)&qword_1000184B8);
  }
  return result;
}

unint64_t sub_10000ED4C()
{
  unint64_t result;

  result = qword_1000184C0;
  if (!qword_1000184C0)
  {
    result = swift_getWitnessTable(&unk_1000115C8, &type metadata for StartDetectionTypeIntent);
    atomic_store(result, (unint64_t *)&qword_1000184C0);
  }
  return result;
}

uint64_t sub_10000ED90(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100012534, 1);
}

uint64_t sub_10000EDA0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001250C, 1);
}

_BYTE *initializeBufferWithCopyOfBuffer for DetectionTypeEnum(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DetectionTypeEnum(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DetectionTypeEnum(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000EE9C + 4 * byte_100011279[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_10000EED0 + 4 * byte_100011274[v4]))();
}

uint64_t sub_10000EED0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000EED8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000EEE0);
  return result;
}

uint64_t sub_10000EEEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000EEF4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_10000EEF8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000EF00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000EF0C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000EF14(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DetectionTypeEnum()
{
  return &type metadata for DetectionTypeEnum;
}

ValueMetadata *type metadata accessor for StartDetectionTypeIntent()
{
  return &type metadata for StartDetectionTypeIntent;
}

uint64_t sub_10000EF3C()
{
  return sub_10000C34C(&qword_1000184D0, &qword_1000184D8, (uint64_t)&protocol conformance descriptor for IntentParameterSummary<A>);
}

uint64_t sub_10000EF68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  void (*v18)(_BYTE *, uint64_t, uint64_t, uint64_t);
  unint64_t v19;
  _BYTE v21[15];
  char v22;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v21[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_1000059A8(&qword_100018400);
  v5 = __chkstk_darwin(v4);
  v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  v9 = &v21[-v8];
  v10 = sub_1000059A8(&qword_100018378);
  __chkstk_darwin(v10);
  v12 = &v21[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v21[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000059A8(&qword_1000184E0);
  LocalizedStringResource.init(stringLiteral:)(0x41505F534D455449, 0xEF524554454D4152);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  v22 = 4;
  v17 = type metadata accessor for IntentDialog(0);
  v18 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v18(v9, 1, 1, v17);
  v18(v7, 1, 1, v17);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  v19 = sub_10000EBB8();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v16, v12, &v22, v9, v7, v3, &off_100014950, v19);
}

uint64_t sub_10000F184@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = IntentParameter.projectedValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000F1AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000059A8(&qword_100018510);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

int main(int argc, const char **argv, const char **envp)
{
  sub_10000F590();
  return 0;
}

unint64_t sub_10000F210(char a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v1 + 40));
  v3 = 8 * a1;
  v4 = *(_QWORD *)&aFurnitur_0[v3 + 8];
  String.hash(into:)(v7, *(_QWORD *)&aPeople_2[v3], v4);
  swift_bridgeObjectRelease(v4);
  v5 = Hasher._finalize()();
  return sub_10000F30C(a1, v5);
}

unint64_t sub_10000F28C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Int v7;
  _QWORD v9[9];

  v3 = *(_QWORD *)(v1 + 40);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_10000F41C(a1, v7);
}

unint64_t sub_10000F30C(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    v6 = 8 * a1;
    v7 = *(_QWORD *)&aPeople_2[v6];
    v8 = *(_QWORD *)&aFurnitur_0[v6 + 8];
    while (1)
    {
      v9 = 8 * *(char *)(*(_QWORD *)(v2 + 48) + v4);
      v10 = *(_QWORD *)&aPeople_2[v9];
      v11 = *(_QWORD *)&aFurnitur_0[v9 + 8];
      if (v10 == v7 && v11 == v8)
        break;
      v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, *(_QWORD *)&aFurnitur_0[8 * *(char *)(*(_QWORD *)(v2 + 48) + v4) + 8], v7, v8, 0);
      swift_bridgeObjectRelease(v11);
      swift_bridgeObjectRelease(v8);
      if ((v13 & 1) == 0)
      {
        v4 = (v4 + 1) & v5;
        if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
          continue;
      }
      return v4;
    }
    swift_bridgeObjectRelease(*(_QWORD *)&aFurnitur_0[8 * *(char *)(*(_QWORD *)(v2 + 48) + v4) + 8]);
    swift_bridgeObjectRelease(v8);
  }
  return v4;
}

unint64_t sub_10000F41C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char v22;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2);
      return v5;
    }
    v13 = v11;
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      v15 = ~v4;
      v5 = (v5 + 1) & v15;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
          v9 = v17;
          v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19)
            break;
          v21 = v19;
          v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            v5 = (v5 + 1) & v15;
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

void sub_10000F590()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  NSString *v26;
  unint64_t v27;
  char v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  Swift::String v41;
  Swift::String v42;
  Swift::String v43;
  Swift::String v44;
  Swift::String v45;
  void *object;
  void *v47;
  unint64_t v48;
  char *v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  int v56;
  uint64_t v57;
  unint64_t v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  Swift::String v66;
  void (*v67)(char *, uint64_t);
  os_log_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  char **v72;
  unint64_t v73;
  objc_class *ObjCClassFromMetadata;
  NSString *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  objc_class *v79;
  NSString *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  os_log_t v84;
  uint64_t v85;
  id v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  __int128 v93;
  __int128 v94;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v83 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1000059A8(&qword_100018520);
  __chkstk_darwin(v4);
  v6 = (char *)&v83 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v83 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v83 - v12;
  v14 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v15 = objc_msgSend(v14, "executablePath");

  if (!v15)
    goto LABEL_18;
  v88 = v1;
  v89 = v0;
  v90 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  v17 = v16;
  v18 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  *(_QWORD *)&v93 = 0;
  v19 = objc_msgSend(v18, "attributesOfItemAtPath:error:", v15, &v93);

  v20 = (void *)v93;
  if (!v19)
  {
    v29 = (id)v93;
    swift_bridgeObjectRelease(v17);
    v30 = _convertNSErrorToError(_:)(v20);

    swift_willThrow(v31);
    swift_errorRelease(v30);
    goto LABEL_18;
  }
  type metadata accessor for FileAttributeKey();
  v22 = v21;
  v23 = sub_10000FDD8();
  v24 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v19, v22, (char *)&type metadata for Any + 8, v23);
  v25 = v20;

  if (*(_QWORD *)(v24 + 16))
  {
    v26 = NSFileModificationDate;
    v27 = sub_10000F28C((uint64_t)v26);
    if ((v28 & 1) != 0)
    {
      sub_10000CC78(*(_QWORD *)(v24 + 56) + 32 * v27, (uint64_t)&v93);
    }
    else
    {
      v93 = 0u;
      v94 = 0u;
    }

  }
  else
  {
    v93 = 0u;
    v94 = 0u;
  }
  swift_bridgeObjectRelease(v24);
  if (!*((_QWORD *)&v94 + 1))
  {
    sub_10000FE20((uint64_t)&v93, &qword_100018538);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_15;
  }
  v32 = swift_dynamicCast(v6, &v93, (char *)&type metadata for Any + 8, v7, 6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, v32 ^ 1u, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_15:
    swift_bridgeObjectRelease(v17);
    sub_10000FE20((uint64_t)v6, &qword_100018520);
    goto LABEL_18;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
  v33 = sub_1000059A8(&qword_100018540);
  v34 = swift_allocObject(v33);
  *(_OWORD *)(v34 + 16) = xmmword_100010A30;
  *(_QWORD *)&v93 = 0;
  *((_QWORD *)&v93 + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(40);
  swift_bridgeObjectRelease(*((_QWORD *)&v93 + 1));
  *(_QWORD *)&v93 = 0x20676E696E6E7552;
  *((_QWORD *)&v93 + 1) = 0xE900000000000027;
  v86 = (id)objc_opt_self(NSProcessInfo);
  v35 = objc_msgSend(v86, "processInfo");
  v36 = objc_msgSend(v35, "processName");

  v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v36);
  v87 = v3;
  v38 = v17;
  v40 = v39;

  v41._countAndFlagsBits = v37;
  v41._object = v40;
  String.append(_:)(v41);
  swift_bridgeObjectRelease(v40);
  v42._countAndFlagsBits = 0x27206D6F72662027;
  v42._object = (void *)0xE800000000000000;
  String.append(_:)(v42);
  v43._countAndFlagsBits = v90;
  v43._object = v38;
  String.append(_:)(v43);
  v44._object = (void *)0x8000000100012260;
  v44._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v44);
  v45 = Date.formatted()();
  object = v45._object;
  String.append(_:)(v45);
  v47 = object;
  v48 = (unint64_t)v38;
  v49 = v87;
  swift_bridgeObjectRelease(v47);
  v50 = v93;
  *(_QWORD *)(v34 + 56) = &type metadata for String;
  *(_OWORD *)(v34 + 32) = v50;
  print(_:separator:terminator:)(v34, 32, 0xE100000000000000, 10, 0xE100000000000000);
  v51 = swift_bridgeObjectRelease(v34);
  static Log.default.getter(v51);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v53 = swift_bridgeObjectRetain(v48, v52);
  v54 = Logger.logObject.getter(v53);
  v55 = static os_log_type_t.default.getter();
  v56 = v55;
  if (os_log_type_enabled(v54, v55))
  {
    v57 = swift_slowAlloc(32, -1);
    v85 = swift_slowAlloc(96, -1);
    *(_QWORD *)&v93 = v85;
    *(_DWORD *)v57 = 136315650;
    v83 = v57 + 4;
    v58 = v48;
    v59 = objc_msgSend(v86, "processInfo");
    v60 = objc_msgSend(v59, "processName");
    LODWORD(v86) = v56;
    v61 = v60;

    v62 = static String._unconditionallyBridgeFromObjectiveC(_:)(v61);
    v84 = v54;
    v64 = v63;

    v91 = sub_10000C38C(v62, v64, (uint64_t *)&v93);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v91, &v92, v83, v57 + 12);
    swift_bridgeObjectRelease(v64);
    *(_WORD *)(v57 + 12) = 2080;
    swift_bridgeObjectRetain(v58, v65);
    v91 = sub_10000C38C(v90, v58, (uint64_t *)&v93);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v91, &v92, v57 + 14, v57 + 22);
    swift_bridgeObjectRelease_n(v58, 3);
    *(_WORD *)(v57 + 22) = 2080;
    v66 = Date.formatted()();
    v91 = sub_10000C38C(v66._countAndFlagsBits, (unint64_t)v66._object, (uint64_t *)&v93);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v91, &v92, v57 + 24, v57 + 32);
    swift_bridgeObjectRelease(v66._object);
    v67 = *(void (**)(char *, uint64_t))(v8 + 8);
    v67(v11, v7);
    v68 = v84;
    _os_log_impl((void *)&_mh_execute_header, v84, (os_log_type_t)v86, "Running '%s' from '%s' Last Modified: %s", (uint8_t *)v57, 0x20u);
    v69 = v85;
    swift_arrayDestroy(v85, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v69, -1, -1);
    swift_slowDealloc(v57, -1, -1);

  }
  else
  {

    v67 = *(void (**)(char *, uint64_t))(v8 + 8);
    v67(v11, v7);
    swift_bridgeObjectRelease_n(v48, 2);
  }
  (*(void (**)(char *, uint64_t))(v88 + 8))(v49, v89);
  v67(v13, v7);
LABEL_18:
  sub_10000FD58();
  v70 = static AppShortcutsProvider.updateAppShortcutParameters()();
  v71 = static CommandLine.argc.getter(v70);
  v72 = (char **)static CommandLine.unsafeArgv.getter();
  v73 = sub_10000FD9C();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v73);
  v75 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v75)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v77 = v76;
    v75 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v77);
  }
  v78 = type metadata accessor for MagnifierApplicationDelegate(0);
  v79 = (objc_class *)swift_getObjCClassFromMetadata(v78);
  v80 = NSStringFromClass(v79);
  if (!v80)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v82 = v81;
    v80 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v82);
  }
  UIApplicationMain(v71, v72, v75, v80);

}

unint64_t sub_10000FD58()
{
  unint64_t result;

  result = qword_100018528;
  if (!qword_100018528)
  {
    result = swift_getWitnessTable(&unk_100010840, &type metadata for MagnifierShortcuts);
    atomic_store(result, (unint64_t *)&qword_100018528);
  }
  return result;
}

unint64_t sub_10000FD9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100018530;
  if (!qword_100018530)
  {
    v1 = objc_opt_self(UIApplication);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100018530);
  }
  return result;
}

unint64_t sub_10000FDD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000181C8;
  if (!qword_1000181C8)
  {
    type metadata accessor for FileAttributeKey();
    result = swift_getWitnessTable(&unk_1000109E8, v1);
    atomic_store(result, (unint64_t *)&qword_1000181C8);
  }
  return result;
}

uint64_t sub_10000FE20(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000059A8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000FE5C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC9MagnifierP33_8FA8A99536A58F43F998737F9ED7F87419ResourceBundleClass);
}
