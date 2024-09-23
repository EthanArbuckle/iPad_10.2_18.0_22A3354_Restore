uint64_t sub_100004DB0()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[2];

  sub_100007E00(&qword_10005D630);
  __chkstk_darwin();
  v1 = (char *)v16 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v2 = *(_QWORD *)(v16[0] - 8);
  __chkstk_darwin();
  v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for LocalizedStringResource(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_100007F24(v13, qword_10005DD58);
  sub_100007F0C(v13, (uint64_t)qword_10005DD58);
  v14 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000017, 0x800000010003AFE0);
  static Locale.current.getter(v14);
  (*(void (**)(char *, _QWORD, _QWORD))(v2 + 104))(v4, enum case for LocalizedStringResource.BundleDescription.main(_:), v16[0]);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v8, 0, 0, v6, v4, "Title for Settings showing all available Calendar deep links.", 61, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v1, 1, 1, v9);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v12, v1);
}

unint64_t sub_100004FC4()
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
  char *v11;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  char *v53;
  char *v54;
  char *v55;
  _BYTE *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t, uint64_t);
  uint64_t v62;
  void (*v63)(char *, uint64_t, uint64_t);
  uint64_t v64;
  char *v65;
  _BYTE *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  char *v76;
  _BYTE *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(char *, uint64_t, uint64_t);
  uint64_t v82;
  uint64_t v83;
  void (*v84)(char *, uint64_t, uint64_t);
  char *v85;
  _BYTE *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(char *, uint64_t, uint64_t);
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  _BYTE *v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(char *, uint64_t, uint64_t);
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  void (*v105)(char *, _QWORD, uint64_t, uint64_t);
  char *v106;
  _BYTE *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void (*v112)(char *, uint64_t, uint64_t);
  char *v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  char *v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void (*v124)(char *, uint64_t, uint64_t);
  uint64_t v125;
  char *v126;
  uint64_t v127;
  char *v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void (*v133)(char *, uint64_t, uint64_t);
  char *v134;
  uint64_t v135;
  uint64_t v136;
  void (*v137)(char *, _QWORD, uint64_t, uint64_t);
  char *v138;
  _BYTE *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void (*v143)(char *, uint64_t, uint64_t);
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  char *v148;
  _BYTE *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  unint64_t result;
  _BYTE *v155;
  uint64_t v156;
  char *v157;
  char *v158;
  char *v159;
  char *v160;
  uint64_t v161;
  unint64_t v162;
  uint64_t v163;
  char *v164;
  char *v165;
  char *v166;
  unint64_t v167;
  char *v168;
  uint64_t v169;
  unsigned int v170;
  uint64_t v171;
  void (*v172)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v173;
  void (*v174)(char *, uint64_t, uint64_t);
  void (*v175)(char *, uint64_t, uint64_t);
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;

  sub_100007E00(&qword_10005D190);
  ((void (*)(void))__chkstk_darwin)();
  v157 = (char *)&v155 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007E00(&qword_10005D630);
  v1 = ((uint64_t (*)(void))__chkstk_darwin)();
  v165 = (char *)&v155 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  v4 = (char *)&v155 - v3;
  v5 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v155 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Locale(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v155 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v12);
  v14 = (char *)&v155 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v180 = type metadata accessor for LocalizedStringResource(0);
  v178 = *(_QWORD *)(v180 - 8);
  v15 = __chkstk_darwin(v180);
  v160 = (char *)&v155 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v159 = (char *)&v155 - v18;
  v19 = __chkstk_darwin(v17);
  v164 = (char *)&v155 - v20;
  v21 = __chkstk_darwin(v19);
  v158 = (char *)&v155 - v22;
  v23 = __chkstk_darwin(v21);
  v163 = (uint64_t)&v155 - v24;
  v25 = __chkstk_darwin(v23);
  v166 = (char *)&v155 - v26;
  v27 = __chkstk_darwin(v25);
  v168 = (char *)&v155 - v28;
  __chkstk_darwin(v27);
  v30 = (char *)&v155 - v29;
  v31 = sub_100007E00(&qword_10005C780);
  v32 = sub_100007E00(&qword_10005C788);
  v33 = *(_QWORD *)(v32 - 8);
  v34 = *(_QWORD *)(v33 + 72);
  v35 = *(unsigned __int8 *)(v33 + 80);
  v36 = (v35 + 32) & ~v35;
  v176 = v34;
  v37 = swift_allocObject(v31, v36 + 12 * v34, v35 | 7);
  *(_OWORD *)(v37 + 16) = xmmword_100045870;
  v161 = v37;
  v179 = v37 + v36;
  *(_BYTE *)(v37 + v36) = 0;
  v38 = String.LocalizationValue.init(stringLiteral:)(0x7261646E656C6143, 0xE800000000000000);
  static Locale.current.getter(v38);
  v39 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v40 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v40(v8, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  v167 = (unint64_t)v30;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link root", 44, 2);
  v169 = v32;
  v41 = String.LocalizationValue.init(stringLiteral:)(1936748609, 0xE400000000000000);
  static Locale.current.getter(v41);
  v170 = v39;
  v177 = v5;
  v174 = v40;
  v40(v8, v39, v5);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link subtitle", 48, 2);
  v42 = v4;
  v178 = *(_QWORD *)(v178 + 56);
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v178)(v4, 0, 1, v180);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v43 = v179;
  v44 = type metadata accessor for DisplayRepresentation.Image(0);
  v173 = sub_100007F0C(v44, (uint64_t)qword_10005DF80);
  v45 = *(_QWORD *)(v44 - 8);
  v175 = *(void (**)(char *, uint64_t, uint64_t))(v45 + 16);
  v46 = v157;
  v175(v157, v173, v44);
  v172 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v45 + 56);
  v172(v46, 0, 1, v44);
  v47 = v168;
  LocalizedStringResource.init(stringLiteral:)(0xD0000000000001A9, 0x80000001000399B0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v167, v42, v46, &_swiftEmptyArrayStorage, v47);
  v162 = v43 + v176 + *(int *)(v169 + 48);
  *(_BYTE *)(v43 + v176) = 1;
  v48 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000012, 0x8000000100039B60);
  static Locale.current.getter(v48);
  v49 = v170;
  v50 = v177;
  v51 = v174;
  v174(v8, v170, v177);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link Time Zone Override screen", 65, 2);
  v167 = 0x8000000100039BD0;
  v52 = String.LocalizationValue.init(stringLiteral:)(0x1000000000000011, 0x8000000100039BD0);
  static Locale.current.getter(v52);
  v51(v8, v49, v50);
  v53 = v165;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link subtitle", 48, 2);
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v178)(v53, 0, 1, v180);
  v171 = v44;
  v175(v46, v173, v44);
  v172(v46, 0, 1, v44);
  v54 = v166;
  LocalizedStringResource.init(stringLiteral:)(0x100000000000017ELL, 0x8000000100039BF0);
  v55 = v47;
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v47, v53, v46, &_swiftEmptyArrayStorage, v54);
  v156 = 2 * v176;
  v56 = (_BYTE *)(v179 + 2 * v176);
  v155 = &v56[*(int *)(v169 + 48)];
  *v56 = 2;
  v162 = 0xD000000000000013;
  v57 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x8000000100039D70);
  static Locale.current.getter(v57);
  v58 = v49;
  v59 = v49;
  v60 = v177;
  v61 = v174;
  v174(v8, v59, v177);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link Alternate Calendars screen", 66, 2);
  v62 = String.LocalizationValue.init(stringLiteral:)(0x1000000000000011, v167);
  static Locale.current.getter(v62);
  v63 = v61;
  v61(v8, v58, v60);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link subtitle", 48, 2);
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v178)(v53, 0, 1, v180);
  v64 = v171;
  v175(v46, v173, v171);
  v172(v46, 0, 1, v64);
  v65 = v166;
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000019DLL, 0x8000000100039DE0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v55, v53, v46, &_swiftEmptyArrayStorage, v65);
  v66 = (_BYTE *)(v179 + v156 + v176);
  *v66 = 3;
  v67 = v169;
  v156 = (uint64_t)&v66[*(int *)(v169 + 48)];
  v68 = String.LocalizationValue.init(stringLiteral:)(1668184403, 0xE400000000000000);
  static Locale.current.getter(v68);
  v69 = v177;
  v63(v8, v58, v177);
  v70 = v163;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link Sync screen", 51, 2);
  v71 = String.LocalizationValue.init(stringLiteral:)(0x1000000000000011, v167);
  static Locale.current.getter(v71);
  v63(v8, v58, v69);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link subtitle", 48, 2);
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v178)(v53, 0, 1, v180);
  v72 = v173;
  v73 = v171;
  v175(v46, v173, v171);
  v172(v46, 0, 1, v73);
  v74 = v168;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000158, 0x8000000100039FC0);
  v75 = v70;
  v76 = v74;
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v75, v53, v46, &_swiftEmptyArrayStorage, v74);
  v163 = 4 * v176;
  v77 = (_BYTE *)(v179 + 4 * v176);
  v156 = (uint64_t)&v77[*(int *)(v67 + 48)];
  *v77 = 4;
  v78 = String.LocalizationValue.init(stringLiteral:)(v162, 0x800000010003A120);
  static Locale.current.getter(v78);
  v79 = v170;
  v80 = v177;
  v81 = v174;
  v174(v8, v170, v177);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link Default Alert Times screen", 66, 2);
  v82 = String.LocalizationValue.init(stringLiteral:)(0x1000000000000011, v167);
  static Locale.current.getter(v82);
  v81(v8, v79, v80);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link subtitle", 48, 2);
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v178)(v53, 0, 1, v180);
  v83 = v171;
  v84 = v175;
  v175(v46, v72, v171);
  v172(v46, 0, 1, v83);
  v85 = v166;
  LocalizedStringResource.init(stringLiteral:)(0x1000000000000195, 0x800000010003A190);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v76, v53, v46, &_swiftEmptyArrayStorage, v85);
  v86 = (_BYTE *)(v179 + v163 + v176);
  *v86 = 5;
  v156 = (uint64_t)&v86[*(int *)(v169 + 48)];
  v87 = String.LocalizationValue.init(stringLiteral:)(0x7961646874726942, 0xE900000000000073);
  static Locale.current.getter(v87);
  v88 = v170;
  v89 = v177;
  v90 = v174;
  v174(v8, v170, v177);
  v91 = v158;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link Default Alert Times screen", 66, 2);
  v163 = 0x1000000000000029;
  v162 = 0x800000010003A330;
  v92 = String.LocalizationValue.init(stringLiteral:)(0x1000000000000029, 0x800000010003A330);
  static Locale.current.getter(v92);
  v90(v8, v88, v89);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link subtitle", 48, 2);
  v93 = v180;
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v178)(v53, 0, 1, v180);
  v94 = v171;
  v84(v46, v173, v171);
  v172(v46, 0, 1, v94);
  v95 = v168;
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000017DLL, 0x800000010003A360);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v91, v53, v46, &_swiftEmptyArrayStorage, v95);
  v96 = (_BYTE *)(v179 + 6 * v176);
  *v96 = 6;
  v158 = &v96[*(int *)(v169 + 48)];
  v97 = String.LocalizationValue.init(stringLiteral:)(0x73746E657645, 0xE600000000000000);
  static Locale.current.getter(v97);
  v98 = v177;
  v99 = v174;
  v174(v8, v88, v177);
  v100 = v164;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link Default Alert Times screen", 66, 2);
  v101 = String.LocalizationValue.init(stringLiteral:)(v163, v162);
  static Locale.current.getter(v101);
  v99(v8, v88, v98);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link subtitle", 48, 2);
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v178)(v53, 0, 1, v93);
  v102 = v171;
  v103 = v53;
  v175(v46, v173, v171);
  v104 = v102;
  v105 = v172;
  v172(v46, 0, 1, v104);
  v106 = v168;
  LocalizedStringResource.init(stringLiteral:)(0x10000000000001ACLL, 0x800000010003A4E0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v100, v103, v46, &_swiftEmptyArrayStorage, v106);
  v164 = (char *)(8 * v176);
  v107 = (_BYTE *)(v179 + 7 * v176);
  *v107 = 7;
  v108 = v169;
  v158 = &v107[*(int *)(v169 + 48)];
  v109 = String.LocalizationValue.init(stringLiteral:)(0x207961442D6C6C41, 0xEE0073746E657645);
  static Locale.current.getter(v109);
  v110 = v170;
  v111 = v177;
  v112 = v174;
  v174(v8, v170, v177);
  v113 = v159;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link Default Alert Times screen", 66, 2);
  v114 = String.LocalizationValue.init(stringLiteral:)(v163, v162);
  static Locale.current.getter(v114);
  v112(v8, v110, v111);
  v115 = v165;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link subtitle", 48, 2);
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v178)(v115, 0, 1, v180);
  v116 = v173;
  v117 = v171;
  v175(v46, v173, v171);
  v105(v46, 0, 1, v117);
  v118 = v168;
  LocalizedStringResource.init(stringLiteral:)(0x10000000000001E2, 0x800000010003A690);
  v119 = v113;
  v120 = v118;
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v119, v115, v46, &_swiftEmptyArrayStorage, v118);
  v163 = (uint64_t)&v164[v179 + *(int *)(v108 + 48)];
  v164[v179] = 8;
  v121 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000017, 0x800000010003A880);
  static Locale.current.getter(v121);
  v122 = v170;
  v123 = v177;
  v124 = v174;
  v174(v8, v170, v177);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link Duration For New Events screen", 70, 2);
  v125 = String.LocalizationValue.init(stringLiteral:)(0x1000000000000011, v167);
  static Locale.current.getter(v125);
  v124(v8, v122, v123);
  v126 = v165;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link subtitle", 48, 2);
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v178)(v126, 0, 1, v180);
  v127 = v171;
  v175(v46, v116, v171);
  v172(v46, 0, 1, v127);
  v128 = v166;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000172, 0x800000010003A8F0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v120, v126, v46, &_swiftEmptyArrayStorage, v128);
  v129 = &v164[v176 + v179];
  *v129 = 9;
  v164 = &v129[*(int *)(v108 + 48)];
  v130 = String.LocalizationValue.init(stringLiteral:)(0x6557207472617453, 0xED00006E4F206B65);
  static Locale.current.getter(v130);
  v131 = v170;
  v132 = v177;
  v133 = v174;
  v174(v8, v170, v177);
  v134 = v160;
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link Start Week On screen", 60, 2);
  v135 = String.LocalizationValue.init(stringLiteral:)(0x1000000000000011, v167);
  static Locale.current.getter(v135);
  v133(v8, v131, v132);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link subtitle", 48, 2);
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v178)(v126, 0, 1, v180);
  v136 = v171;
  v175(v46, v173, v171);
  v137 = v172;
  v172(v46, 0, 1, v136);
  v138 = v168;
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000013FLL, 0x800000010003AAB0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v134, v126, v46, &_swiftEmptyArrayStorage, v138);
  v139 = (_BYTE *)(v179 + 10 * v176);
  v164 = &v139[*(int *)(v169 + 48)];
  *v139 = 10;
  v140 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000010, 0x800000010003ABF0);
  static Locale.current.getter(v140);
  v141 = v170;
  v142 = v177;
  v143 = v174;
  v174(v8, v170, v177);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link Default Calendar screen", 63, 2);
  v144 = String.LocalizationValue.init(stringLiteral:)(0x1000000000000011, v167);
  static Locale.current.getter(v144);
  v145 = v142;
  v143(v8, v141, v142);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link subtitle", 48, 2);
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v178)(v126, 0, 1, v180);
  v146 = v171;
  v175(v46, v173, v171);
  v137(v46, 0, 1, v146);
  v147 = v166;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000182, 0x800000010003AC50);
  v148 = v168;
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v168, v126, v46, &_swiftEmptyArrayStorage, v147);
  v149 = (_BYTE *)(v179 + 11 * v176);
  v179 = (uint64_t)&v149[*(int *)(v169 + 48)];
  *v149 = 11;
  v150 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000012, 0x800000010003ADE0);
  static Locale.current.getter(v150);
  v151 = v170;
  v143(v8, v170, v145);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link Delegate Calendars screen", 65, 2);
  v152 = String.LocalizationValue.init(stringLiteral:)(0x1000000000000011, v167);
  static Locale.current.getter(v152);
  v143(v8, v151, v145);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v14, 0, 0, v11, v8, "Display name for the calendar deep link subtitle", 48, 2);
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v178)(v126, 0, 1, v180);
  v175(v46, v173, v146);
  v172(v46, 0, 1, v146);
  v153 = v166;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000180, 0x800000010003AE50);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v148, v126, v46, &_swiftEmptyArrayStorage, v153);
  result = sub_10003266C(v161);
  qword_10005DD70 = result;
  return result;
}

uint64_t sub_1000065E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v0 = sub_100007E00(&qword_10005C790);
  sub_100007F24(v0, qword_10005DD78);
  sub_100007F0C(v0, (uint64_t)qword_10005DD78);
  v1 = sub_100007E00(&qword_10005C798);
  v2 = *(_QWORD *)(sub_100007E00(&qword_10005C7A0) - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = *(unsigned __int8 *)(v2 + 80);
  v5 = (v4 + 32) & ~v4;
  v6 = swift_allocObject(v1, v5 + 12 * v3, v4 | 7);
  *(_OWORD *)(v6 + 16) = xmmword_100045870;
  v7 = v6 + v5;
  *(_BYTE *)(v6 + v5) = 0;
  v8 = sub_100006DA4();
  EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD000000000000041, 0x800000010003B040, &type metadata for SettingsCalendarStaticDeepLinks, v8);
  *(_BYTE *)(v7 + v3) = 1;
  EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD000000000000052, 0x800000010003B090, &type metadata for SettingsCalendarStaticDeepLinks, v8);
  *(_BYTE *)(v7 + 2 * v3) = 2;
  EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD000000000000054, 0x800000010003B0F0, &type metadata for SettingsCalendarStaticDeepLinks, v8);
  *(_BYTE *)(v7 + 3 * v3) = 3;
  EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD00000000000004ELL, 0x800000010003B150, &type metadata for SettingsCalendarStaticDeepLinks, v8);
  *(_BYTE *)(v7 + 4 * v3) = 4;
  EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD000000000000053, 0x800000010003B1A0, &type metadata for SettingsCalendarStaticDeepLinks, v8);
  *(_BYTE *)(v7 + 5 * v3) = 5;
  EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD00000000000006ELL, 0x800000010003B200, &type metadata for SettingsCalendarStaticDeepLinks, v8);
  *(_BYTE *)(v7 + 6 * v3) = 6;
  EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD000000000000070, 0x800000010003B270, &type metadata for SettingsCalendarStaticDeepLinks, v8);
  *(_BYTE *)(v7 + 7 * v3) = 7;
  EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD000000000000071, 0x800000010003B2F0, &type metadata for SettingsCalendarStaticDeepLinks, v8);
  *(_BYTE *)(v7 + 8 * v3) = 8;
  EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD000000000000056, 0x800000010003B370, &type metadata for SettingsCalendarStaticDeepLinks, v8);
  *(_BYTE *)(v7 + 9 * v3) = 9;
  EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD00000000000004DLL, 0x800000010003B3D0, &type metadata for SettingsCalendarStaticDeepLinks, v8);
  *(_BYTE *)(v7 + 10 * v3) = 10;
  EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD000000000000051, 0x800000010003B420, &type metadata for SettingsCalendarStaticDeepLinks, v8);
  *(_BYTE *)(v7 + 11 * v3) = 11;
  EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD000000000000054, 0x800000010003B480, &type metadata for SettingsCalendarStaticDeepLinks, v8);
  v9 = sub_100032690(v6);
  return EnumURLRepresentation.init(_:)(v9, &type metadata for SettingsCalendarStaticDeepLinks, v8);
}

uint64_t sub_10000696C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1000069A8 + 4 * byte_100045880[a1]))(0xD000000000000010, 0x8000000100039510);
}

uint64_t sub_1000069A8()
{
  return 1953460082;
}

uint64_t sub_1000069B8()
{
  uint64_t v0;

  return v0 + 1;
}

uint64_t sub_100006A3C()
{
  return 0x6565577472617473;
}

uint64_t sub_100006A5C()
{
  return 0x43746C7561666564;
}

uint64_t sub_100006A9C(unsigned __int8 *a1, unsigned __int8 *a2)
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
  v3 = sub_10000696C(*a1);
  v5 = v4;
  v6 = sub_10000696C(v2);
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

unint64_t sub_100006B28()
{
  unint64_t result;

  result = qword_10005C6B0;
  if (!qword_10005C6B0)
  {
    result = swift_getWitnessTable(&unk_100045898, &type metadata for SettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C6B0);
  }
  return result;
}

Swift::Int sub_100006B6C()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v1 = *v0;
  Hasher.init(_seed:)(v6, 0);
  v2 = sub_10000696C(v1);
  v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_100006BCC(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_10000696C(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100006C0C(uint64_t a1)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  v3 = sub_10000696C(v2);
  v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

unint64_t sub_100006C68@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_100007A84(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100006C94@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_10000696C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100006CC0()
{
  unint64_t result;

  result = qword_10005C6B8;
  if (!qword_10005C6B8)
  {
    result = swift_getWitnessTable(&unk_1000459B0, &type metadata for SettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C6B8);
  }
  return result;
}

unint64_t sub_100006D08()
{
  unint64_t result;

  result = qword_10005C6C0;
  if (!qword_10005C6C0)
  {
    result = swift_getWitnessTable(&unk_1000459E8, &type metadata for SettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C6C0);
  }
  return result;
}

unint64_t sub_100006D50()
{
  unint64_t result;

  result = qword_10005C6C8;
  if (!qword_10005C6C8)
  {
    result = swift_getWitnessTable(&unk_100045900, &type metadata for SettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C6C8);
  }
  return result;
}

void *sub_100006D94()
{
  return &protocol witness table for String;
}

unint64_t sub_100006DA4()
{
  unint64_t result;

  result = qword_10005C6D0;
  if (!qword_10005C6D0)
  {
    result = swift_getWitnessTable(&unk_100045938, &type metadata for SettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C6D0);
  }
  return result;
}

unint64_t sub_100006DEC()
{
  unint64_t result;

  result = qword_10005C6D8;
  if (!qword_10005C6D8)
  {
    result = swift_getWitnessTable(&unk_100045A18, &type metadata for SettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C6D8);
  }
  return result;
}

uint64_t sub_100006E30@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10005C480 != -1)
    swift_once(&qword_10005C480, sub_1000065E8);
  v2 = sub_100007E00(&qword_10005C790);
  v3 = sub_100007F0C(v2, (uint64_t)qword_10005DD78);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_100006EA8()
{
  unint64_t result;

  result = qword_10005C6E0;
  if (!qword_10005C6E0)
  {
    result = swift_getWitnessTable(&unk_100045A40, &type metadata for SettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C6E0);
  }
  return result;
}

unint64_t sub_100006EF0()
{
  unint64_t result;

  result = qword_10005C6E8;
  if (!qword_10005C6E8)
  {
    result = swift_getWitnessTable(&unk_100045A68, &type metadata for SettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C6E8);
  }
  return result;
}

unint64_t sub_100006F38()
{
  unint64_t result;

  result = qword_10005C6F0;
  if (!qword_10005C6F0)
  {
    result = swift_getWitnessTable(&unk_100045A90, &type metadata for SettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C6F0);
  }
  return result;
}

unint64_t sub_100006F80()
{
  unint64_t result;

  result = qword_10005C6F8;
  if (!qword_10005C6F8)
  {
    result = swift_getWitnessTable(&unk_100045AE8, &type metadata for SettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C6F8);
  }
  return result;
}

uint64_t sub_100006FC4(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_100007EC8();
  v4 = URLRepresentableEnum.urlRepresentationParameter.getter(a1, v3);
  return sub_100007F64(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

uint64_t sub_100007010@<X0>(uint64_t a1@<X8>)
{
  return sub_10000773C(&qword_10005C470, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005DD58, (uint64_t)sub_100004DB0, a1);
}

uint64_t sub_100007034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076D8(a1, a2, a3, (uint64_t (*)(void))sub_100006DA4, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

uint64_t sub_100007048(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100006DA4();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100007084()
{
  unint64_t result;

  result = qword_10005C708;
  if (!qword_10005C708)
  {
    result = swift_getWitnessTable(&unk_100045B28, &type metadata for SettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C708);
  }
  return result;
}

unint64_t sub_1000070CC()
{
  unint64_t result;

  result = qword_10005C710;
  if (!qword_10005C710)
  {
    result = swift_getWitnessTable(&unk_100045B50, &type metadata for SettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C710);
  }
  return result;
}

unint64_t sub_100007114()
{
  unint64_t result;

  result = qword_10005C718;
  if (!qword_10005C718)
  {
    result = swift_getWitnessTable(&unk_1000458C0, &type metadata for SettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C718);
  }
  return result;
}

uint64_t sub_100007158()
{
  if (qword_10005C478 != -1)
    swift_once(&qword_10005C478, sub_100004FC4);
  return swift_bridgeObjectRetain(qword_10005DD70);
}

uint64_t sub_100007198(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100006F80();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000071D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005C720;
  if (!qword_10005C720)
  {
    v1 = sub_100007220(&qword_10005C728);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005C720);
  }
  return result;
}

uint64_t sub_100007220(uint64_t *a1)
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

void sub_100007264(_QWORD *a1@<X8>)
{
  *a1 = &off_100054AE8;
}

unint64_t sub_100007278()
{
  unint64_t result;

  result = qword_10005C730;
  if (!qword_10005C730)
  {
    result = swift_getWitnessTable(&unk_100045C48, &type metadata for OpenSettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C730);
  }
  return result;
}

uint64_t sub_1000072BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_100007F24(v10, qword_10005DD90);
  sub_100007F0C(v10, (uint64_t)qword_10005DD90);
  v11 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x80000001000398D0);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(v9, 0, 0, v6, v3, "Title for the Open intent for directing to a particular Calendar settings view", 78, 2);
}

_QWORD *sub_100007430@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100007468(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

void (*sub_10000749C(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_1000074E4;
}

void sub_1000074E4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

unint64_t sub_100007518()
{
  unint64_t result;

  result = qword_10005C738;
  if (!qword_10005C738)
  {
    result = swift_getWitnessTable(&unk_100045C70, &type metadata for OpenSettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C738);
  }
  return result;
}

uint64_t sub_10000755C(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = sub_100007E40();
  v5 = sub_100007EC8();
  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_1000075B4()
{
  uint64_t v0;

  v0 = qword_10005C6A0;
  swift_bridgeObjectRetain(off_10005C6A8);
  return v0;
}

unint64_t sub_1000075F0()
{
  unint64_t result;

  result = qword_10005C740;
  if (!qword_10005C740)
  {
    result = swift_getWitnessTable(&unk_100045D00, &type metadata for OpenSettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C740);
  }
  return result;
}

unint64_t sub_100007638()
{
  unint64_t result;

  result = qword_10005C748;
  if (!qword_10005C748)
  {
    result = swift_getWitnessTable(&unk_100045D28, &type metadata for OpenSettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C748);
  }
  return result;
}

unint64_t sub_100007680()
{
  unint64_t result;

  result = qword_10005C750;
  if (!qword_10005C750)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Never, &type metadata for Never);
    atomic_store(result, (unint64_t *)&qword_10005C750);
  }
  return result;
}

uint64_t sub_1000076C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076D8(a1, a2, a3, (uint64_t (*)(void))sub_100007518, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t sub_1000076D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5)
{
  _QWORD v7[2];

  v7[0] = a2;
  v7[1] = a4();
  return swift_getOpaqueTypeConformance2(v7, a5, 1);
}

uint64_t sub_100007718@<X0>(uint64_t a1@<X8>)
{
  return sub_10000773C(&qword_10005C488, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005DD90, (uint64_t)sub_1000072BC, a1);
}

uint64_t sub_10000773C@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  if (*a1 != -1)
    swift_once(a1, a4);
  v8 = a2(0);
  v9 = sub_100007F0C(v8, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a5, v9, v8);
}

uint64_t sub_1000077AC()
{
  return 0;
}

uint64_t sub_1000077B8()
{
  return 1;
}

uint64_t sub_1000077C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to URLRepresentableIntent<>.perform()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = sub_100007E40();
  v6 = sub_100007E84();
  v7 = sub_100007EC8();
  *v4 = v2;
  v4[1] = sub_10000784C;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10000784C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v5 = *v1;
  v2 = *(_QWORD *)(v5 + 16);
  v3 = *v1;
  v5 = v3;
  result = swift_task_dealloc(v2);
  if (v0)
    return (*(uint64_t (**)(void))(v3 + 8))();
  return result;
}

uint64_t sub_1000078A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_100007ACC();
  *a1 = result;
  return result;
}

uint64_t sub_1000078CC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100007518();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenSettingsCalendarStaticDeepLinks()
{
  return &type metadata for OpenSettingsCalendarStaticDeepLinks;
}

_BYTE *initializeBufferWithCopyOfBuffer for SettingsCalendarStaticDeepLinks(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SettingsCalendarStaticDeepLinks(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SettingsCalendarStaticDeepLinks(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000079F0 + 4 * byte_100045891[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_100007A24 + 4 * byte_10004588C[v4]))();
}

uint64_t sub_100007A24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100007A2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100007A34);
  return result;
}

uint64_t sub_100007A40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100007A48);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_100007A4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100007A54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100007A60(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100007A6C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SettingsCalendarStaticDeepLinks()
{
  return &type metadata for SettingsCalendarStaticDeepLinks;
}

unint64_t sub_100007A84(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000549A8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 0xC)
    return 12;
  else
    return v3;
}

uint64_t sub_100007ACC()
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
  char *v9;
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
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  char *v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38[2];

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v35 = *(_QWORD *)(v0 - 8);
  v36 = v0;
  __chkstk_darwin(v0);
  v34 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_100007E00((uint64_t *)&unk_10005D140);
  v3 = __chkstk_darwin(v2);
  v33 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v6 = (char *)&v32 - v5;
  v7 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v7);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for Locale(0);
  __chkstk_darwin(v14);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v17);
  v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for LocalizedStringResource(0);
  v21 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin(v20);
  v23 = (char *)&v32 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_100007E00(&qword_10005C760);
  v24 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x8000000100039850);
  static Locale.current.getter(v24);
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, enum case for LocalizedStringResource.BundleDescription.main(_:), v10);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v19, 0, 0, v16, v13, "Title that indicates which Calendar settings view the user would like to target.", 80, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v9, 1, 1, v20);
  v38[0] = 12;
  v25 = type metadata accessor for IntentDialog(0);
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56);
  v26(v6, 1, 1, v25);
  v27 = v33;
  v26(v33, 1, 1, v25);
  v28 = v34;
  (*(void (**)(char *, _QWORD, uint64_t))(v35 + 104))(v34, enum case for InputConnectionBehavior.default(_:), v36);
  v29 = sub_100006DA4();
  v30 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v23, v9, v38, v6, v27, v28, &off_100054AE8, v29);
  v37 = 0;
  swift_retain(v30);
  IntentParameter.wrappedValue.setter(&v37);
  swift_release(v30);
  return v30;
}

uint64_t sub_100007E00(uint64_t *a1)
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

unint64_t sub_100007E40()
{
  unint64_t result;

  result = qword_10005C768;
  if (!qword_10005C768)
  {
    result = swift_getWitnessTable(&unk_100045B88, &type metadata for OpenSettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C768);
  }
  return result;
}

unint64_t sub_100007E84()
{
  unint64_t result;

  result = qword_10005C770;
  if (!qword_10005C770)
  {
    result = swift_getWitnessTable(&unk_100045BD8, &type metadata for OpenSettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C770);
  }
  return result;
}

unint64_t sub_100007EC8()
{
  unint64_t result;

  result = qword_10005C778;
  if (!qword_10005C778)
  {
    result = swift_getWitnessTable(&unk_100045978, &type metadata for SettingsCalendarStaticDeepLinks);
    atomic_store(result, (unint64_t *)&qword_10005C778);
  }
  return result;
}

uint64_t sub_100007F0C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_100007F24(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100007F64(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

unint64_t sub_100007F7C()
{
  unint64_t result;

  result = qword_10005C7B8;
  if (!qword_10005C7B8)
  {
    result = swift_getWitnessTable(&unk_100045E30, &type metadata for SettingsShowLocationSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005C7B8);
  }
  return result;
}

unint64_t sub_100007FC4()
{
  unint64_t result;

  result = qword_10005C7C0;
  if (!qword_10005C7C0)
  {
    result = swift_getWitnessTable(&unk_10004616C, &type metadata for SettingsShowLocationSuggestionsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C7C0);
  }
  return result;
}

uint64_t sub_100008008(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100008020, 0, 0);
}

uint64_t sub_100008020()
{
  uint64_t v0;
  _BYTE *v1;

  v1 = *(_BYTE **)(v0 + 16);
  *v1 = CalLocationSuggestionsEnabled();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100008058(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_100008074, 0, 0);
}

uint64_t sub_100008074()
{
  uint64_t v0;

  CalSetLocationSuggestionsEnabled(*(unsigned __int8 *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000080AC()
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
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  __int16 v19;
  _BYTE v20[16];

  v0 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v0);
  v2 = &v20[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v10);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v20[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000019, 0x800000010003B780);
  static Locale.current.getter(v17);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  v19 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsShowInviteeDeclinesEntityName", 37, 2, v12, 0, 0, v9, v6, "Name of the SettingsShowInviteeDeclinesEntity type", 50, v19);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v2, 1, 1, v13);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v16, v2);
}

uint64_t sub_1000082B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v32 = a1;
  v1 = sub_100007E00(&qword_10005D190);
  __chkstk_darwin(v1);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v4);
  v31 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Locale(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for LocalizedStringResource(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v30 - v21;
  v23 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000019, 0x800000010003B780);
  static Locale.current.getter(v23);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v15, 0, 0, v12, v9, "SettingsShowLocationSuggestionsEntity displayRepresentation", 59, 2);
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v25 = v31;
  v24(v31, 1, 1, v16);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v26 = type metadata accessor for DisplayRepresentation.Image(0);
  v27 = sub_100007F0C(v26, (uint64_t)qword_10005DF80);
  v28 = *(_QWORD *)(v26 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v3, v27, v26);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v3, 0, 1, v26);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000150, 0x800000010003B8D0);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v22, v25, v3, &_swiftEmptyArrayStorage, v20);
}

uint64_t sub_1000085A4()
{
  uint64_t v0;

  v0 = qword_10005C7A8;
  swift_bridgeObjectRetain(off_10005C7B0);
  return v0;
}

unint64_t sub_1000085DC()
{
  unint64_t result;

  result = qword_10005C7C8;
  if (!qword_10005C7C8)
  {
    result = swift_getWitnessTable(&unk_100045E88, &type metadata for SettingsShowLocationSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005C7C8);
  }
  return result;
}

unint64_t sub_100008624()
{
  unint64_t result;

  result = qword_10005C7D0;
  if (!qword_10005C7D0)
  {
    result = swift_getWitnessTable(&unk_100045EC0, &type metadata for SettingsShowLocationSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005C7D0);
  }
  return result;
}

unint64_t sub_10000866C()
{
  unint64_t result;

  result = qword_10005C7D8;
  if (!qword_10005C7D8)
  {
    result = swift_getWitnessTable(&unk_100045EF0, &type metadata for SettingsShowLocationSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005C7D8);
  }
  return result;
}

unint64_t sub_1000086B4()
{
  unint64_t result;

  result = qword_10005C7E0;
  if (!qword_10005C7E0)
  {
    result = swift_getWitnessTable(&unk_1000461E4, &type metadata for SettingsShowLocationSuggestionsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C7E0);
  }
  return result;
}

void *sub_1000086F8()
{
  return &protocol witness table for String;
}

unint64_t sub_100008708()
{
  unint64_t result;

  result = qword_10005C7E8;
  if (!qword_10005C7E8)
  {
    result = swift_getWitnessTable(&unk_100045F28, &type metadata for SettingsShowLocationSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005C7E8);
  }
  return result;
}

unint64_t sub_100008750()
{
  unint64_t result;

  result = qword_10005C7F0;
  if (!qword_10005C7F0)
  {
    result = swift_getWitnessTable(&unk_100045F50, &type metadata for SettingsShowLocationSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005C7F0);
  }
  return result;
}

unint64_t sub_100008798()
{
  unint64_t result;

  result = qword_10005C7F8;
  if (!qword_10005C7F8)
  {
    result = swift_getWitnessTable(&unk_100045F78, &type metadata for SettingsShowLocationSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005C7F8);
  }
  return result;
}

unint64_t sub_1000087E0()
{
  unint64_t result;

  result = qword_10005C800;
  if (!qword_10005C800)
  {
    result = swift_getWitnessTable(&unk_100045FD0, &type metadata for SettingsShowLocationSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005C800);
  }
  return result;
}

void *sub_100008824()
{
  return &protocol witness table for String;
}

void sub_100008830(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000027;
  a1[1] = 0x800000010003BA30;
}

uint64_t sub_100008854()
{
  return sub_10000A9CC(&qword_10005C808, &qword_10005C810, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100008880(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100007F7C();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000088BC()
{
  unint64_t result;

  result = qword_10005C818;
  if (!qword_10005C818)
  {
    result = swift_getWitnessTable(&unk_100046000, &type metadata for SettingsShowLocationSuggestionsEntity);
    atomic_store(result, (unint64_t *)&qword_10005C818);
  }
  return result;
}

uint64_t sub_100008904(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000087E0();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100008940()
{
  unint64_t result;

  result = qword_10005C820;
  if (!qword_10005C820)
  {
    result = swift_getWitnessTable(&unk_100046098, &type metadata for UpdateIntent_showLocationSuggestions);
    atomic_store(result, (unint64_t *)&qword_10005C820);
  }
  return result;
}

uint64_t sub_100008984()
{
  return sub_10000A9CC(&qword_10005C828, &qword_10005C830, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_1000089B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v13;
  _BYTE v14[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_100007F24(v10, qword_10005DDA8);
  sub_100007F0C(v10, (uint64_t)qword_10005DDA8);
  v11 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000020, 0x800000010003B810);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  v13 = 2;
  return LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsShowLocationSuggestionsIntent_title", 43, 2, v9, 0, 0, v6, v3, "Display string for the title of the SettingsShowLocationSuggestionsIntent", 73, v13);
}

uint64_t sub_100008B44()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

uint64_t sub_100008B74()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100046368);
  qword_10005DDC0 = result;
  return result;
}

uint64_t sub_100008B98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  v4 = type metadata accessor for MainActor(0);
  v3[7] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v3[8] = v5;
  v3[9] = v6;
  return swift_task_switch(sub_100008C08, v5, v6);
}

uint64_t sub_100008C08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 16));
  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 24) = v1;
  *(_QWORD *)(v0 + 80) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 112));
  *(_BYTE *)(v0 + 113) = *(_BYTE *)(v0 + 112);
  if (qword_10005C498 != -1)
    swift_once(&qword_10005C498, sub_100008B74);
  v2 = qword_10005DDC0;
  *(_QWORD *)(v0 + 88) = qword_10005DDC0;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 96) = v4;
  v5 = sub_10000A9CC(&qword_10005C8F0, &qword_10005C8F8, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_100008D04;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 113, v2, &type metadata for Bool, v5);
}

uint64_t sub_100008D04()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v2 = *v1;
  v4 = *(_QWORD *)(*v1 + 88);
  v3 = *(_QWORD *)(*v1 + 96);
  v5 = *(_QWORD *)(*v1 + 80);
  *(_QWORD *)(*v1 + 104) = v0;
  swift_task_dealloc(v3);
  swift_release(v5);
  swift_release(v4);
  if (v0)
    v6 = sub_100008DC4;
  else
    v6 = sub_100008D84;
  return swift_task_switch(v6, *(_QWORD *)(v2 + 64), *(_QWORD *)(v2 + 72));
}

uint64_t sub_100008D84()
{
  uint64_t v0;
  uint64_t v1;

  v1 = swift_release(*(_QWORD *)(v0 + 56));
  static IntentResult.result<>()(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100008DC4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 56));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *sub_100008DF8@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100008E30(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;

  v1 = *a1;
  v3 = v1;
  swift_retain(v1);
  IntentParameter.wrappedValue.setter(&v3);
  return swift_release(v1);
}

void (*sub_100008E74(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100008EBC;
}

_QWORD *sub_100008EC0@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100008EF8(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

void (*sub_100008F2C(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100008EBC;
}

uint64_t sub_100008F74()
{
  if (qword_10005C498 != -1)
    swift_once(&qword_10005C498, sub_100008B74);
  return swift_retain(qword_10005DDC0);
}

unint64_t sub_100008FB8()
{
  unint64_t result;

  result = qword_10005C838;
  if (!qword_10005C838)
  {
    result = swift_getWitnessTable(&unk_100046128, &type metadata for UpdateIntent_showLocationSuggestions);
    atomic_store(result, (unint64_t *)&qword_10005C838);
  }
  return result;
}

unint64_t sub_100009000()
{
  unint64_t result;

  result = qword_10005C840;
  if (!qword_10005C840)
  {
    result = swift_getWitnessTable(&unk_100046150, &type metadata for UpdateIntent_showLocationSuggestions);
    atomic_store(result, (unint64_t *)&qword_10005C840);
  }
  return result;
}

uint64_t sub_100009044(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10004FEA4, 1);
}

uint64_t sub_100009054(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100008940();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100009094@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10005C490 != -1)
    swift_once(&qword_10005C490, sub_1000089B0);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_100007F0C(v2, (uint64_t)qword_10005DDA8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000910C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005C904);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_100009170;
  return sub_100008B98(a1, v5, v4);
}

uint64_t sub_100009170()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

char *sub_1000091B8@<X0>(char **a1@<X8>)
{
  char *result;
  char *v3;

  result = sub_10000A198();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000091DC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100008940();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100009208()
{
  unint64_t result;

  result = qword_10005C850;
  if (!qword_10005C850)
  {
    result = swift_getWitnessTable(&unk_1000461AC, &type metadata for SettingsShowLocationSuggestionsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C850);
  }
  return result;
}

unint64_t sub_100009250()
{
  unint64_t result;

  result = qword_10005C858[0];
  if (!qword_10005C858[0])
  {
    result = swift_getWitnessTable(&unk_100045DD0, &type metadata for SettingsShowLocationSuggestionsEntity);
    atomic_store(result, qword_10005C858);
  }
  return result;
}

uint64_t sub_100009294(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005C8D8 + dword_10005C8D8);
  v2 = (_QWORD *)swift_task_alloc(unk_10005C8DC);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000AB54;
  return v4();
}

uint64_t sub_1000092F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100007FC4();
  *v4 = v2;
  v4[1] = sub_100009358;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_100009358(uint64_t a1)
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

unint64_t sub_1000093BC()
{
  unint64_t result;

  result = qword_10005C870;
  if (!qword_10005C870)
  {
    result = swift_getWitnessTable(&unk_10004623C, &type metadata for SettingsShowLocationSuggestionsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C870);
  }
  return result;
}

unint64_t sub_100009404()
{
  unint64_t result;

  result = qword_10005C878[0];
  if (!qword_10005C878[0])
  {
    result = swift_getWitnessTable(&unk_10004629C, &type metadata for SettingsShowLocationSuggestionsEntityQuery);
    atomic_store(result, qword_10005C878);
  }
  return result;
}

uint64_t sub_100009448(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100007FC4();
  *v5 = v2;
  v5[1] = sub_1000094B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000094B4(uint64_t a1)
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

uint64_t sub_100009508(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100007FC4();
  *v4 = v2;
  v4[1] = sub_10000AB54;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100009574()
{
  unint64_t result;

  result = qword_10005C890;
  if (!qword_10005C890)
  {
    result = swift_getWitnessTable(&unk_1000462C4, &type metadata for SettingsShowLocationSuggestionsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C890);
  }
  return result;
}

unint64_t sub_1000095BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005C898;
  if (!qword_10005C898)
  {
    v1 = sub_100007220(qword_10005C8A0);
    sub_100008798();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005C898);
  }
  return result;
}

uint64_t sub_100009620(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_1000086B4();
  *v5 = v2;
  v5[1] = sub_10000AB50;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000968C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to DynamicOptionsProvider.defaultResult()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100009170;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

uint64_t destroy for UpdateIntent_showLocationSuggestions(_QWORD *a1)
{
  swift_release(*a1);
  return swift_release(a1[1]);
}

uint64_t *_s23CalendarWidgetExtension36UpdateIntent_showLocationSuggestionsVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain(v3);
  swift_retain(v4);
  return a1;
}

uint64_t *assignWithCopy for UpdateIntent_showLocationSuggestions(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  return a1;
}

__n128 initializeWithTake for UpdateIntent_showLocationSuggestions(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for UpdateIntent_showLocationSuggestions(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for UpdateIntent_showLocationSuggestions(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UpdateIntent_showLocationSuggestions(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UpdateIntent_showLocationSuggestions()
{
  return &type metadata for UpdateIntent_showLocationSuggestions;
}

ValueMetadata *type metadata accessor for SettingsShowLocationSuggestionsEntityQuery()
{
  return &type metadata for SettingsShowLocationSuggestionsEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsShowLocationSuggestionsEntity()
{
  return &type metadata for SettingsShowLocationSuggestionsEntity;
}

uint64_t sub_1000098B4()
{
  return sub_10000A9CC((unint64_t *)&unk_10005D130, &qword_10005C8B8, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_1000098E0@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t KeyPath;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  Swift::String v26;
  Swift::String v27;
  Swift::String v28;
  uint64_t OpaqueTypeConformance2;
  unint64_t v30;
  void *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  Swift::String v45;
  uint64_t v46;
  unint64_t v47;
  _QWORD v48[2];
  Swift::String v49;

  v44 = a1;
  v1 = sub_100007E00(&qword_10005C908);
  v37 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00(&qword_10005C910);
  v39 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007E00(&qword_10005C918);
  v8 = *(_QWORD *)(v7 - 8);
  v40 = v7;
  v41 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100007E00(&qword_10005C920);
  v12 = *(_QWORD *)(v11 - 8);
  v42 = v11;
  v43 = v12;
  __chkstk_darwin(v11);
  v38 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100046368);
  v15 = sub_100007E00(&qword_10005C928);
  v16 = sub_100009250();
  v17 = sub_10000A9CC(&qword_10005C930, &qword_10005C928, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)(0xD00000000000002ALL, 0x800000010003BA60, KeyPath, sub_100009CE8, 0, sub_100009DC8, 0, sub_100009F80, 0, v15, &type metadata for Text, &type metadata for Text, v16, v17, &protocol witness table for Text, &protocol witness table for Text);
  v18 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000017, 0x800000010003BA90);
  v20 = v19;
  LOBYTE(v16) = v21;
  v23 = v22;
  v24 = sub_10000A9CC(&qword_10005C938, &qword_10005C908, (uint64_t)&protocol conformance descriptor for ControlToggle<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v18, v20, v16 & 1, v23, v1, v24);
  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v20);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v3, v1);
  v25 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v26._countAndFlagsBits = 0xD000000000000019;
  v49._countAndFlagsBits = 0xD000000000000055;
  v49._object = (void *)0x800000010003BAB0;
  v26._object = (void *)0x800000010003B780;
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  v28 = NSLocalizedString(_:tableName:bundle:value:comment:)(v26, (Swift::String_optional)0, (NSBundle)v25, v27, v49);

  v45 = v28;
  v48[0] = v1;
  v48[1] = v24;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v48, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v30 = sub_10000AA0C();
  WidgetConfiguration.description<A>(_:)(&v45, v4, &type metadata for String, OpaqueTypeConformance2, v30);
  swift_bridgeObjectRelease(v28._object);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v6, v4);
  v45._countAndFlagsBits = v4;
  v45._object = &type metadata for String;
  v46 = OpaqueTypeConformance2;
  v47 = v30;
  v31 = (void *)swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description<A>(_:)>>, 1);
  v32 = v38;
  v33 = v40;
  WidgetConfiguration.disablesControlStateCaching()(v40, v31);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v33);
  v45._countAndFlagsBits = v33;
  v45._object = v31;
  v34 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v35 = v42;
  WidgetConfiguration.hiddenControl()(v42, v34);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v32, v35);
}

uint64_t sub_100009CE8()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  unint64_t v4;
  Swift::String v6;
  Swift::String v7;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v7._countAndFlagsBits = 0xD000000000000036;
  v7._object = (void *)0x800000010003BC60;
  v1._object = (void *)0x800000010003B780;
  v1._countAndFlagsBits = 0xD000000000000019;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v7);

  v6 = v3;
  v4 = sub_10000AA0C();
  return Label<>.init<A>(_:systemImage:)(&v6, 0x7261646E656C6163, 0xE800000000000000, &type metadata for String, v4);
}

uint64_t sub_100009DC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  char v15;
  uint64_t v16;
  __int16 v17;
  _BYTE v18[16];

  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = &v18[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin();
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x8000000100039850);
  static Locale.current.getter(v12);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  v17 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("CalendarSettingsName", 20, 2, v9, 0, 0, v7, v5, "Subtitle of a calendar settings control indicating that this control belongs in calendar settings", 97, v17);
  result = Text.init(_:)(v11);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v14;
  *(_BYTE *)(a1 + 16) = v15 & 1;
  *(_QWORD *)(a1 + 24) = v16;
  return result;
}

uint64_t sub_100009F80@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _BYTE v20[16];

  v4 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v11 = &v20[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin();
  v13 = &v20[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((a1 & 1) != 0)
  {
    v14 = String.LocalizationValue.init(stringLiteral:)(28239, 0xE200000000000000);
    static Locale.current.getter(v14);
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for LocalizedStringResource.BundleDescription.main(_:), v4);
    LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Control_State_On", 16, 2, v11, 0, 0, v9, v7, "Title of calendar control toggle for the 'On' state.", 52, 2);
  }
  else
  {
    v15 = String.LocalizationValue.init(stringLiteral:)(6710863, 0xE300000000000000);
    static Locale.current.getter(v15);
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for LocalizedStringResource.BundleDescription.main(_:), v4);
    LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Control_State_Off", 17, 2, v11, 0, 0, v9, v7, "Title of calendar control toggle for the 'Off' state.", 53, 2);
  }
  result = Text.init(_:)(v13);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v17;
  *(_BYTE *)(a2 + 16) = v18 & 1;
  *(_QWORD *)(a2 + 24) = v19;
  return result;
}

char *sub_10000A198()
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
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  char *v32;
  char *v33;
  char *v34;
  unint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  __int16 v46;
  int v47;
  int v48;
  int v49;
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  void (*v54)(char *, _QWORD, uint64_t, uint64_t);
  void (*v55)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  char v65[3];
  uint64_t v66;

  v0 = sub_100007E00(&qword_10005C8C0);
  __chkstk_darwin(v0);
  v61 = (char *)&v50 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = type metadata accessor for InputConnectionBehavior(0);
  v60 = *(_QWORD *)(v64 - 8);
  __chkstk_darwin(v64);
  v59 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100007E00((uint64_t *)&unk_10005D140);
  v4 = __chkstk_darwin(v3);
  v58 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v63 = (char *)&v50 - v6;
  v7 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v7);
  v62 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Locale(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v16);
  v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for LocalizedStringResource(0);
  v20 = *(_QWORD *)(v19 - 8);
  v56 = v19;
  v21 = __chkstk_darwin(v19);
  v57 = (char *)&v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v24 = (char *)&v50 - v23;
  v53 = sub_100007E00(&qword_10005C8C8);
  v25 = String.LocalizationValue.init(stringLiteral:)(0x746567726154, 0xE600000000000000);
  static Locale.current.getter(v25);
  v26 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
  v51 = v9;
  v27(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  v50 = v27;
  v46 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target", 6, 2, v18, 0, 0, v15, v12, "Calendar settings entity title that indicates which setting the user would like to target.", 90, v46);
  v28 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x800000010003B560);
  static Locale.current.getter(v28);
  v27(v12, v26, v9);
  LOWORD(v47) = 2;
  v29 = v62;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target_description", 18, 2, v18, 0, 0, v15, v12, "Description for the Calendar settings entity parameter that indicates which setting the user would like to target.", 114, v47);
  v54 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56);
  v54(v29, 0, 1, v19);
  v66 = 0;
  v30 = type metadata accessor for IntentDialog(0);
  v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56);
  v55 = v31;
  v32 = v63;
  v31(v63, 1, 1, v30);
  v33 = v58;
  v31(v58, 1, 1, v30);
  v52 = enum case for InputConnectionBehavior.default(_:);
  v34 = v59;
  v60 = *(_QWORD *)(v60 + 104);
  ((void (*)(char *))v60)(v59);
  v35 = sub_100007F7C();
  v58 = (char *)IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v24, v29, &v66, v32, v33, v34, v35);
  v53 = sub_100007E00(&qword_10005C8D0);
  v36 = String.LocalizationValue.init(stringLiteral:)(0x65756C6156, 0xE500000000000000);
  static Locale.current.getter(v36);
  v37 = v50;
  v38 = v51;
  v50(v12, v26, v51);
  LOWORD(v48) = 2;
  v39 = v57;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value", 5, 2, v18, 0, 0, v15, v12, "Calendar settings property title that indicates which property of a setting the user would like to set to as the value.", 119, v48);
  v40 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000026, 0x800000010003B6A0);
  static Locale.current.getter(v40);
  v37(v12, v26, v38);
  LOWORD(v49) = 2;
  v41 = v62;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value_description", 17, 2, v18, 0, 0, v15, v12, "Description for a Calendar settings property parameter that indicates which value of a setting the user would like to set to.", 125, v49);
  v54(v41, 0, 1, v56);
  v65[0] = 2;
  v42 = type metadata accessor for Bool.IntentDisplayName(0);
  v43 = v61;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v61, 1, 1, v42);
  v44 = v63;
  v55(v63, 1, 1, v30);
  ((void (*)(char *, _QWORD, uint64_t))v60)(v34, v52, v64);
  IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v39, v41, v65, v43, v44, v34);
  return v58;
}

uint64_t sub_10000A78C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000A848, 0, 0);
}

uint64_t sub_10000A848()
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
  __int16 v11;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100007E00(&qword_10005C830);
  v7 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000019, 0x800000010003B780);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  v11 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsShowInviteeDeclinesEntityName", 37, 2, v1, 0, 0, v4, v3, "Name of the SettingsShowInviteeDeclinesEntity type", 50, v11);
  v8 = sub_10000A9CC(&qword_10005C8F0, &qword_10005C8F8, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005C8E0, 0, &unk_10005C8E8, 0, &type metadata for UpdateIntent_showLocationSuggestions, v8);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v9);
}

uint64_t sub_10000A9A0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

ValueMetadata *type metadata accessor for SettingsShowLocationSuggestionsToggleControl()
{
  return &type metadata for SettingsShowLocationSuggestionsToggleControl;
}

uint64_t sub_10000A9BC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10004FEE8, 1);
}

uint64_t sub_10000A9CC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100007220(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000AA0C()
{
  unint64_t result;

  result = qword_10005C940;
  if (!qword_10005C940)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10005C940);
  }
  return result;
}

uint64_t sub_10000AA50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;

  v0 = sub_100007220(&qword_10005C920);
  v1 = sub_100007220(&qword_10005C918);
  v2 = sub_100007220(&qword_10005C910);
  v8 = sub_100007220(&qword_10005C908);
  v9 = (void *)sub_10000A9CC(&qword_10005C938, &qword_10005C908, (uint64_t)&protocol conformance descriptor for ControlToggle<A>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v8, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v4 = sub_10000AA0C();
  v8 = v2;
  v9 = &type metadata for String;
  v10 = OpaqueTypeConformance2;
  v11 = v4;
  v5 = swift_getOpaqueTypeConformance2(&v8, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description<A>(_:)>>, 1);
  v8 = v1;
  v9 = (void *)v5;
  v6 = swift_getOpaqueTypeConformance2(&v8, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v8 = v0;
  v9 = (void *)v6;
  return swift_getOpaqueTypeConformance2(&v8, &opaque type descriptor for <<opaque return type of WidgetConfiguration.hiddenControl()>>, 1);
}

unint64_t sub_10000AB5C()
{
  unint64_t result;

  result = qword_10005C958;
  if (!qword_10005C958)
  {
    result = swift_getWitnessTable(&unk_100046460, &type metadata for SettingsShowWeekNumbersEntity);
    atomic_store(result, (unint64_t *)&qword_10005C958);
  }
  return result;
}

unint64_t sub_10000ABA4()
{
  unint64_t result;

  result = qword_10005C960;
  if (!qword_10005C960)
  {
    result = swift_getWitnessTable(&unk_10004679C, &type metadata for SettingsShowWeekNumbersEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C960);
  }
  return result;
}

uint64_t sub_10000ABE8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_10000AC00, 0, 0);
}

id sub_10000AC00()
{
  uint64_t v0;
  id result;
  void *v2;
  unsigned __int8 *v3;
  unsigned __int8 v4;

  result = objc_msgSend((id)objc_opt_self(CUIKPreferences), "sharedPreferences");
  if (result)
  {
    v2 = result;
    v3 = *(unsigned __int8 **)(v0 + 16);
    v4 = objc_msgSend(result, "showWeekNumbers");

    *v3 = v4;
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000AC7C(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_10000AC98, 0, 0);
}

id sub_10000AC98()
{
  uint64_t v0;
  id result;
  void *v2;

  result = objc_msgSend((id)objc_opt_self(CUIKPreferences), "sharedPreferences");
  if (result)
  {
    v2 = result;
    objc_msgSend(result, "setShowWeekNumbers:", *(unsigned __int8 *)(v0 + 16));

    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000AD04()
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
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  __int16 v19;
  _BYTE v20[16];

  v0 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v0);
  v2 = &v20[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v10);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v20[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x800000010003BCC0);
  static Locale.current.getter(v17);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  v19 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsWeekNumbersEntityName", 29, 2, v12, 0, 0, v9, v6, "Name of the week numbers entity type", 36, v19);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v2, 1, 1, v13);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v16, v2);
}

uint64_t sub_10000AF10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v32 = a1;
  v1 = sub_100007E00(&qword_10005D190);
  __chkstk_darwin(v1);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v4);
  v31 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Locale(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for LocalizedStringResource(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v30 - v21;
  v23 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x800000010003BCC0);
  static Locale.current.getter(v23);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v15, 0, 0, v12, v9, "SettingsShowWeekNumbersEntity displayRepresentation", 51, 2);
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v25 = v31;
  v24(v31, 1, 1, v16);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v26 = type metadata accessor for DisplayRepresentation.Image(0);
  v27 = sub_100007F0C(v26, (uint64_t)qword_10005DF80);
  v28 = *(_QWORD *)(v26 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v3, v27, v26);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v3, 0, 1, v26);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000185, 0x800000010003BDE0);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v22, v25, v3, &_swiftEmptyArrayStorage, v20);
}

uint64_t sub_10000B1FC()
{
  uint64_t v0;

  v0 = qword_10005C948;
  swift_bridgeObjectRetain(off_10005C950);
  return v0;
}

unint64_t sub_10000B234()
{
  unint64_t result;

  result = qword_10005C968;
  if (!qword_10005C968)
  {
    result = swift_getWitnessTable(&unk_1000464B8, &type metadata for SettingsShowWeekNumbersEntity);
    atomic_store(result, (unint64_t *)&qword_10005C968);
  }
  return result;
}

unint64_t sub_10000B27C()
{
  unint64_t result;

  result = qword_10005C970;
  if (!qword_10005C970)
  {
    result = swift_getWitnessTable(&unk_1000464F0, &type metadata for SettingsShowWeekNumbersEntity);
    atomic_store(result, (unint64_t *)&qword_10005C970);
  }
  return result;
}

unint64_t sub_10000B2C4()
{
  unint64_t result;

  result = qword_10005C978;
  if (!qword_10005C978)
  {
    result = swift_getWitnessTable(&unk_100046520, &type metadata for SettingsShowWeekNumbersEntity);
    atomic_store(result, (unint64_t *)&qword_10005C978);
  }
  return result;
}

unint64_t sub_10000B30C()
{
  unint64_t result;

  result = qword_10005C980;
  if (!qword_10005C980)
  {
    result = swift_getWitnessTable(&unk_100046814, &type metadata for SettingsShowWeekNumbersEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C980);
  }
  return result;
}

unint64_t sub_10000B354()
{
  unint64_t result;

  result = qword_10005C988;
  if (!qword_10005C988)
  {
    result = swift_getWitnessTable(&unk_100046558, &type metadata for SettingsShowWeekNumbersEntity);
    atomic_store(result, (unint64_t *)&qword_10005C988);
  }
  return result;
}

unint64_t sub_10000B39C()
{
  unint64_t result;

  result = qword_10005C990;
  if (!qword_10005C990)
  {
    result = swift_getWitnessTable(&unk_100046580, &type metadata for SettingsShowWeekNumbersEntity);
    atomic_store(result, (unint64_t *)&qword_10005C990);
  }
  return result;
}

unint64_t sub_10000B3E4()
{
  unint64_t result;

  result = qword_10005C998;
  if (!qword_10005C998)
  {
    result = swift_getWitnessTable(&unk_1000465A8, &type metadata for SettingsShowWeekNumbersEntity);
    atomic_store(result, (unint64_t *)&qword_10005C998);
  }
  return result;
}

unint64_t sub_10000B42C()
{
  unint64_t result;

  result = qword_10005C9A0;
  if (!qword_10005C9A0)
  {
    result = swift_getWitnessTable(&unk_100046600, &type metadata for SettingsShowWeekNumbersEntity);
    atomic_store(result, (unint64_t *)&qword_10005C9A0);
  }
  return result;
}

void sub_10000B470(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000001BLL;
  a1[1] = 0x800000010003BF70;
}

uint64_t sub_10000B494()
{
  return sub_10000A9CC(&qword_10005C9A8, &qword_10005C9B0, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_10000B4C0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000AB5C();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000B4FC()
{
  unint64_t result;

  result = qword_10005C9B8;
  if (!qword_10005C9B8)
  {
    result = swift_getWitnessTable(&unk_100046630, &type metadata for SettingsShowWeekNumbersEntity);
    atomic_store(result, (unint64_t *)&qword_10005C9B8);
  }
  return result;
}

uint64_t sub_10000B544(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000B42C();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000B580()
{
  unint64_t result;

  result = qword_10005C9C0;
  if (!qword_10005C9C0)
  {
    result = swift_getWitnessTable(&unk_1000466C8, &type metadata for UpdateIntent_showWeekNumbers);
    atomic_store(result, (unint64_t *)&qword_10005C9C0);
  }
  return result;
}

uint64_t sub_10000B5C4()
{
  return sub_10000A9CC(&qword_10005C9C8, &qword_10005C9D0, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_10000B5F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v13;
  _BYTE v14[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_100007F24(v10, qword_10005DDC8);
  sub_100007F0C(v10, (uint64_t)qword_10005DDC8);
  v11 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000018, 0x800000010003BD40);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  v13 = 2;
  return LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsShowWeekNumbersIntent_title", 35, 2, v9, 0, 0, v6, v3, "Display string for the title of the update week numbers intent", 62, v13);
}

uint64_t sub_10000B784()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100046980);
  qword_10005DDE0 = result;
  return result;
}

uint64_t sub_10000B7A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  v4 = type metadata accessor for MainActor(0);
  v3[7] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v3[8] = v5;
  v3[9] = v6;
  return swift_task_switch(sub_10000B818, v5, v6);
}

uint64_t sub_10000B818()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 16));
  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 24) = v1;
  *(_QWORD *)(v0 + 80) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 112));
  *(_BYTE *)(v0 + 113) = *(_BYTE *)(v0 + 112);
  if (qword_10005C4A8 != -1)
    swift_once(&qword_10005C4A8, sub_10000B784);
  v2 = qword_10005DDE0;
  *(_QWORD *)(v0 + 88) = qword_10005DDE0;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 96) = v4;
  v5 = sub_10000A9CC(&qword_10005CA78, &qword_10005CA80, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_100008D04;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 113, v2, &type metadata for Bool, v5);
}

uint64_t sub_10000B914()
{
  if (qword_10005C4A8 != -1)
    swift_once(&qword_10005C4A8, sub_10000B784);
  return swift_retain(qword_10005DDE0);
}

unint64_t sub_10000B958()
{
  unint64_t result;

  result = qword_10005C9D8;
  if (!qword_10005C9D8)
  {
    result = swift_getWitnessTable(&unk_100046758, &type metadata for UpdateIntent_showWeekNumbers);
    atomic_store(result, (unint64_t *)&qword_10005C9D8);
  }
  return result;
}

unint64_t sub_10000B9A0()
{
  unint64_t result;

  result = qword_10005C9E0;
  if (!qword_10005C9E0)
  {
    result = swift_getWitnessTable(&unk_100046780, &type metadata for UpdateIntent_showWeekNumbers);
    atomic_store(result, (unint64_t *)&qword_10005C9E0);
  }
  return result;
}

uint64_t sub_10000B9E4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10004FF64, 1);
}

uint64_t sub_10000B9F4(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_10000B580();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_10000BA34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10005C4A0 != -1)
    swift_once(&qword_10005C4A0, sub_10000B5F0);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_100007F0C(v2, (uint64_t)qword_10005DDC8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000BAA4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005CA8C);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_100009170;
  return sub_10000B7A8(a1, v5, v4);
}

char *sub_10000BB08@<X0>(char **a1@<X8>)
{
  char *result;
  char *v3;

  result = sub_10000C450();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000BB2C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000B580();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10000BB58()
{
  unint64_t result;

  result = qword_10005C9F0;
  if (!qword_10005C9F0)
  {
    result = swift_getWitnessTable(&unk_1000467DC, &type metadata for SettingsShowWeekNumbersEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005C9F0);
  }
  return result;
}

unint64_t sub_10000BBA0()
{
  unint64_t result;

  result = qword_10005C9F8[0];
  if (!qword_10005C9F8[0])
  {
    result = swift_getWitnessTable(&unk_100046400, &type metadata for SettingsShowWeekNumbersEntity);
    atomic_store(result, qword_10005C9F8);
  }
  return result;
}

uint64_t sub_10000BBE4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005CA60 + dword_10005CA60);
  v2 = (_QWORD *)swift_task_alloc(unk_10005CA64);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000AB54;
  return v4();
}

uint64_t sub_10000BC40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10000ABA4();
  *v4 = v2;
  v4[1] = sub_100009358;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10000BCAC()
{
  unint64_t result;

  result = qword_10005CA10;
  if (!qword_10005CA10)
  {
    result = swift_getWitnessTable(&unk_10004686C, &type metadata for SettingsShowWeekNumbersEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CA10);
  }
  return result;
}

unint64_t sub_10000BCF4()
{
  unint64_t result;

  result = qword_10005CA18[0];
  if (!qword_10005CA18[0])
  {
    result = swift_getWitnessTable(&unk_1000468CC, &type metadata for SettingsShowWeekNumbersEntityQuery);
    atomic_store(result, qword_10005CA18);
  }
  return result;
}

uint64_t sub_10000BD38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10000ABA4();
  *v5 = v2;
  v5[1] = sub_1000094B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10000BDA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10000ABA4();
  *v4 = v2;
  v4[1] = sub_10000AB54;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10000BE10()
{
  unint64_t result;

  result = qword_10005CA30;
  if (!qword_10005CA30)
  {
    result = swift_getWitnessTable(&unk_1000468F4, &type metadata for SettingsShowWeekNumbersEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CA30);
  }
  return result;
}

unint64_t sub_10000BE58()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005CA38;
  if (!qword_10005CA38)
  {
    v1 = sub_100007220(qword_10005CA40);
    sub_10000B3E4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005CA38);
  }
  return result;
}

uint64_t sub_10000BEBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10000B30C();
  *v5 = v2;
  v5[1] = sub_10000AB50;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_showWeekNumbers()
{
  return &type metadata for UpdateIntent_showWeekNumbers;
}

ValueMetadata *type metadata accessor for SettingsShowWeekNumbersEntityQuery()
{
  return &type metadata for SettingsShowWeekNumbersEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsShowWeekNumbersEntity()
{
  return &type metadata for SettingsShowWeekNumbersEntity;
}

uint64_t sub_10000BF58@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t KeyPath;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  Swift::String v26;
  Swift::String v27;
  Swift::String v28;
  uint64_t OpaqueTypeConformance2;
  unint64_t v30;
  void *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  Swift::String v45;
  uint64_t v46;
  unint64_t v47;
  _QWORD v48[2];
  Swift::String v49;

  v44 = a1;
  v1 = sub_100007E00(&qword_10005C908);
  v37 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00(&qword_10005C910);
  v39 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007E00(&qword_10005C918);
  v8 = *(_QWORD *)(v7 - 8);
  v40 = v7;
  v41 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100007E00(&qword_10005C920);
  v12 = *(_QWORD *)(v11 - 8);
  v42 = v11;
  v43 = v12;
  __chkstk_darwin(v11);
  v38 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100046980);
  v15 = sub_100007E00(&qword_10005C928);
  v16 = sub_10000BBA0();
  v17 = sub_10000A9CC(&qword_10005C930, &qword_10005C928, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)(0xD000000000000022, 0x800000010003BF90, KeyPath, sub_10000C36C, 0, sub_100009DC8, 0, sub_100009F80, 0, v15, &type metadata for Text, &type metadata for Text, v16, v17, &protocol witness table for Text, &protocol witness table for Text);
  v18 = LocalizedStringKey.init(stringLiteral:)(0x6B656557776F6853, 0xEF737265626D754ELL);
  v20 = v19;
  LOBYTE(v16) = v21;
  v23 = v22;
  v24 = sub_10000A9CC(&qword_10005C938, &qword_10005C908, (uint64_t)&protocol conformance descriptor for ControlToggle<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v18, v20, v16 & 1, v23, v1, v24);
  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v20);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v3, v1);
  v25 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v49._countAndFlagsBits = 0xD00000000000004CLL;
  v49._object = (void *)0x800000010003BFE0;
  v26._object = (void *)0x800000010003BFC0;
  v26._countAndFlagsBits = 0xD00000000000001DLL;
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  v28 = NSLocalizedString(_:tableName:bundle:value:comment:)(v26, (Swift::String_optional)0, (NSBundle)v25, v27, v49);

  v45 = v28;
  v48[0] = v1;
  v48[1] = v24;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v48, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v30 = sub_10000AA0C();
  WidgetConfiguration.description<A>(_:)(&v45, v4, &type metadata for String, OpaqueTypeConformance2, v30);
  swift_bridgeObjectRelease(v28._object);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v6, v4);
  v45._countAndFlagsBits = v4;
  v45._object = &type metadata for String;
  v46 = OpaqueTypeConformance2;
  v47 = v30;
  v31 = (void *)swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description<A>(_:)>>, 1);
  v32 = v38;
  v33 = v40;
  WidgetConfiguration.disablesControlStateCaching()(v40, v31);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v33);
  v45._countAndFlagsBits = v33;
  v45._object = v31;
  v34 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v35 = v42;
  WidgetConfiguration.hiddenControl()(v42, v34);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v32, v35);
}

uint64_t sub_10000C36C()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  unint64_t v4;
  Swift::String v6;
  Swift::String v7;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v7._countAndFlagsBits = 0xD000000000000024;
  v7._object = (void *)0x800000010003BCE0;
  v1._object = (void *)0x800000010003BCC0;
  v1._countAndFlagsBits = 0xD000000000000011;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v7);

  v6 = v3;
  v4 = sub_10000AA0C();
  return Label<>.init<A>(_:systemImage:)(&v6, 0x7261646E656C6163, 0xE800000000000000, &type metadata for String, v4);
}

char *sub_10000C450()
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
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  char *v32;
  char *v33;
  char *v34;
  unint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  __int16 v46;
  int v47;
  int v48;
  int v49;
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  void (*v54)(char *, _QWORD, uint64_t, uint64_t);
  void (*v55)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  char v65[3];
  uint64_t v66;

  v0 = sub_100007E00(&qword_10005C8C0);
  __chkstk_darwin(v0);
  v61 = (char *)&v50 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = type metadata accessor for InputConnectionBehavior(0);
  v60 = *(_QWORD *)(v64 - 8);
  __chkstk_darwin(v64);
  v59 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100007E00((uint64_t *)&unk_10005D140);
  v4 = __chkstk_darwin(v3);
  v58 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v63 = (char *)&v50 - v6;
  v7 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v7);
  v62 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Locale(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v16);
  v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for LocalizedStringResource(0);
  v20 = *(_QWORD *)(v19 - 8);
  v56 = v19;
  v21 = __chkstk_darwin(v19);
  v57 = (char *)&v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v24 = (char *)&v50 - v23;
  v53 = sub_100007E00(&qword_10005CA58);
  v25 = String.LocalizationValue.init(stringLiteral:)(0x746567726154, 0xE600000000000000);
  static Locale.current.getter(v25);
  v26 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
  v51 = v9;
  v27(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  v50 = v27;
  v46 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target", 6, 2, v18, 0, 0, v15, v12, "Calendar settings entity title that indicates which setting the user would like to target.", 90, v46);
  v28 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x800000010003B560);
  static Locale.current.getter(v28);
  v27(v12, v26, v9);
  LOWORD(v47) = 2;
  v29 = v62;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target_description", 18, 2, v18, 0, 0, v15, v12, "Description for the Calendar settings entity parameter that indicates which setting the user would like to target.", 114, v47);
  v54 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56);
  v54(v29, 0, 1, v19);
  v66 = 0;
  v30 = type metadata accessor for IntentDialog(0);
  v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56);
  v55 = v31;
  v32 = v63;
  v31(v63, 1, 1, v30);
  v33 = v58;
  v31(v58, 1, 1, v30);
  v52 = enum case for InputConnectionBehavior.default(_:);
  v34 = v59;
  v60 = *(_QWORD *)(v60 + 104);
  ((void (*)(char *))v60)(v59);
  v35 = sub_10000AB5C();
  v58 = (char *)IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v24, v29, &v66, v32, v33, v34, v35);
  v53 = sub_100007E00(&qword_10005C8D0);
  v36 = String.LocalizationValue.init(stringLiteral:)(0x65756C6156, 0xE500000000000000);
  static Locale.current.getter(v36);
  v37 = v50;
  v38 = v51;
  v50(v12, v26, v51);
  LOWORD(v48) = 2;
  v39 = v57;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value", 5, 2, v18, 0, 0, v15, v12, "Calendar settings property title that indicates which property of a setting the user would like to set to as the value.", 119, v48);
  v40 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000026, 0x800000010003B6A0);
  static Locale.current.getter(v40);
  v37(v12, v26, v38);
  LOWORD(v49) = 2;
  v41 = v62;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value_description", 17, 2, v18, 0, 0, v15, v12, "Description for a Calendar settings property parameter that indicates which value of a setting the user would like to set to.", 125, v49);
  v54(v41, 0, 1, v56);
  v65[0] = 2;
  v42 = type metadata accessor for Bool.IntentDisplayName(0);
  v43 = v61;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v61, 1, 1, v42);
  v44 = v63;
  v55(v63, 1, 1, v30);
  ((void (*)(char *, _QWORD, uint64_t))v60)(v34, v52, v64);
  IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v39, v41, v65, v43, v44, v34);
  return v58;
}

uint64_t sub_10000CA44()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000CB00, 0, 0);
}

uint64_t sub_10000CB00()
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
  __int16 v11;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100007E00(&qword_10005C9D0);
  v7 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x800000010003BCC0);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  v11 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsWeekNumbersEntityName", 29, 2, v1, 0, 0, v4, v3, "Name of the week numbers entity type", 36, v11);
  v8 = sub_10000A9CC(&qword_10005CA78, &qword_10005CA80, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005CA68, 0, &unk_10005CA70, 0, &type metadata for UpdateIntent_showWeekNumbers, v8);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v9);
}

uint64_t sub_10000CC58@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

ValueMetadata *type metadata accessor for SettingsShowWeekNumbersToggleControl()
{
  return &type metadata for SettingsShowWeekNumbersToggleControl;
}

uint64_t sub_10000CC74(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10004FFA8, 1);
}

uint64_t sub_10000CC84(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_10000CCBC + 4 * byte_100046A20[a1]))(0xD000000000000010, 0x8000000100039630);
}

uint64_t sub_10000CCBC()
{
  return 0x746E6576456C6C61;
}

uint64_t sub_10000CD0C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_10000CD44 + 4 * byte_100046A25[a1]))(0xD000000000000010, 0x8000000100039630);
}

uint64_t sub_10000CD44()
{
  return 0x746E6576456C6C61;
}

uint64_t sub_10000CD94()
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

  v0 = sub_100007E00(&qword_10005D630);
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
  sub_100007F24(v16, qword_10005DDE8);
  sub_100007F0C(v16, (uint64_t)qword_10005DDE8);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x800000010003CD70);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, _QWORD))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v19[0]);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0, 0, v8, v5, "Title for choosing an Sync duration for events.", 47, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v2, 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v2);
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t, uint64_t);
  void (*v53)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, uint64_t, uint64_t);
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t, uint64_t);
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t, uint64_t);
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(char *, uint64_t, uint64_t);
  uint64_t v83;
  void (*v84)(char *, uint64_t, uint64_t);
  char *v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(char *, uint64_t, uint64_t);
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  unint64_t result;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  char *v120;
  char *v121;
  char *v122;
  char *v123;
  uint64_t v124;
  char *v125;
  unsigned int v126;
  void (*v127)(char *, uint64_t, uint64_t);
  char *v128;
  char *v129;
  char *v130;
  char *v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  __int128 v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  char *v139;
  void (*v140)(char *, uint64_t, uint64_t);
  uint64_t v141;
  void (*v142)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v143;
  void (*v144)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;

  v0 = sub_100007E00(&qword_10005D190);
  v1 = __chkstk_darwin(v0);
  v121 = (char *)&v117 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __chkstk_darwin(v1);
  v120 = (char *)&v117 - v4;
  v5 = __chkstk_darwin(v3);
  v118 = (char *)&v117 - v6;
  v7 = __chkstk_darwin(v5);
  v124 = (uint64_t)&v117 - v8;
  __chkstk_darwin(v7);
  v137 = (char *)&v117 - v9;
  v10 = sub_100007E00(&qword_10005D630);
  v11 = __chkstk_darwin(v10);
  v132 = (char *)&v117 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v130 = (char *)&v117 - v14;
  v15 = __chkstk_darwin(v13);
  v128 = (char *)&v117 - v16;
  v17 = __chkstk_darwin(v15);
  v123 = (char *)&v117 - v18;
  __chkstk_darwin(v17);
  v139 = (char *)&v117 - v19;
  v20 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v146 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin(v20);
  v22 = (char *)&v117 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for Locale(0);
  __chkstk_darwin(v23);
  v25 = (char *)&v117 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v26);
  v28 = (char *)&v117 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = type metadata accessor for LocalizedStringResource(0);
  v30 = *(_QWORD *)(v29 - 8);
  v31 = __chkstk_darwin(v29);
  v131 = (char *)&v117 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __chkstk_darwin(v31);
  v129 = (char *)&v117 - v34;
  v35 = __chkstk_darwin(v33);
  v125 = (char *)&v117 - v36;
  v37 = __chkstk_darwin(v35);
  v122 = (char *)&v117 - v38;
  v39 = __chkstk_darwin(v37);
  v149 = (char *)&v117 - v40;
  __chkstk_darwin(v39);
  v42 = (char *)&v117 - v41;
  v43 = sub_100007E00(&qword_10005CC50);
  v44 = sub_100007E00(&qword_10005CC58);
  v45 = *(_QWORD *)(v44 - 8);
  v46 = *(_QWORD *)(v45 + 72);
  v47 = *(unsigned __int8 *)(v45 + 80);
  v48 = (v47 + 32) & ~v47;
  v145 = v46;
  v49 = swift_allocObject(v43, v48 + 5 * v46, v47 | 7);
  *(_OWORD *)(v49 + 16) = xmmword_100047360;
  v119 = v49;
  v50 = v49 + v48;
  *(_BYTE *)(v49 + v48) = 0;
  v147 = v44;
  v51 = String.LocalizationValue.init(stringLiteral:)(7105601, 0xE300000000000000);
  static Locale.current.getter(v51);
  v52 = *(void (**)(char *, uint64_t, uint64_t))(v146 + 104);
  v126 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v148 = v20;
  v127 = v52;
  ((void (*)(char *))v52)(v22);
  v136 = (uint64_t)v42;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsSyncDurationType_All", 28, 2, v28, 0, 0, v25, v22, "Display name for Sync all type", 30, 2);
  v138 = v30;
  v53 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56);
  v146 = v29;
  v144 = v53;
  v53(v139, 1, 1, v29);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v54 = v50;
  v141 = v50;
  v55 = type metadata accessor for DisplayRepresentation.Image(0);
  v143 = sub_100007F0C(v55, (uint64_t)qword_10005DF80);
  v56 = *(_QWORD *)(v55 - 8);
  v57 = *(void (**)(char *, uint64_t, uint64_t))(v56 + 16);
  v58 = v137;
  v57(v137, v143, v55);
  v140 = v57;
  v142 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v56 + 56);
  v142(v58, 0, 1, v55);
  v59 = v149;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000114, 0x800000010003C1A0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v136, v139, v58, &_swiftEmptyArrayStorage, v59);
  *(_BYTE *)(v54 + v145) = 1;
  v60 = String.LocalizationValue.init(stringLiteral:)(0x20736B6565572032, 0xEC0000006B636142);
  static Locale.current.getter(v60);
  v61 = v126;
  v62 = v127;
  v127(v22, v126, v148);
  LOWORD(v105) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsSyncDurationType_TwoWeeksBack", 37, 2, v28, 0, 0, v25, v22, "Display name for Sync events 2 Weeks Back type", 46, v105);
  v144(v123, 1, 1, v146);
  v63 = (char *)v124;
  v133 = v55;
  v57((char *)v124, v143, v55);
  v142(v63, 0, 1, v55);
  v64 = sub_100007E00(&qword_10005CC60);
  v65 = *(_QWORD *)(v138 + 72);
  v66 = *(unsigned __int8 *)(v138 + 80);
  v138 = ((v66 + 32) & ~v66) + 2 * v65;
  v139 = (char *)v64;
  v134 = v65;
  v136 = (v66 + 32) & ~v66;
  v137 = (char *)(v66 | 7);
  v67 = swift_allocObject(v64, v138, v66 | 7);
  v135 = xmmword_100047370;
  *(_OWORD *)(v67 + 16) = xmmword_100047370;
  v68 = String.LocalizationValue.init(stringLiteral:)(0x736B6565572032, 0xE700000000000000);
  static Locale.current.getter(v68);
  v69 = v148;
  v62(v22, v61, v148);
  LOWORD(v106) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsSyncDurationType_TwoWeeksBack_Synonym_2Weeks", 52, 2, v28, 0, 0, v25, v22, "Synonym (\"2 Weeks\") for sync events 2 Weeks Back", 48, v106);
  v70 = String.LocalizationValue.init(stringLiteral:)(0x6B656557206F7754, 0xE900000000000073);
  static Locale.current.getter(v70);
  v71 = v69;
  v72 = v62;
  v62(v22, v61, v71);
  LOWORD(v107) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsSyncDurationType_TwoWeeksBack_Synonym_TwoWeeks", 54, 2, v28, 0, 0, v25, v22, "Synonym (\"Two Weeks\") for sync events 2 Weeks Back", 50, v107);
  v73 = v149;
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000012ALL, 0x800000010003C420);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v122, v123, v124, v67, v73);
  v124 = 2 * v145;
  *(_BYTE *)(v141 + 2 * v145) = 2;
  v74 = String.LocalizationValue.init(stringLiteral:)(0x2068746E6F4D2031, 0xEC0000006B636142);
  static Locale.current.getter(v74);
  v75 = v148;
  v72(v22, v61, v148);
  LOWORD(v108) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsSyncDurationType_OneMonthBack", 37, 2, v28, 0, 0, v25, v22, "Display name for Sync events 1 Month Back type", 46, v108);
  v144(v128, 1, 1, v146);
  v76 = v118;
  v77 = v133;
  v140(v118, v143, v133);
  v142(v76, 0, 1, v77);
  v78 = swift_allocObject(v139, v138, v137);
  *(_OWORD *)(v78 + 16) = v135;
  v79 = String.LocalizationValue.init(stringLiteral:)(0x746E6F4D20656E4FLL, 0xE900000000000068);
  static Locale.current.getter(v79);
  v80 = v75;
  v81 = v75;
  v82 = v127;
  v127(v22, v61, v81);
  LOWORD(v109) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsSyncDurationType_OneMonthBack_Synonym_OneMonth", 54, 2, v28, 0, 0, v25, v22, "Synonym (\"One Month\") for sync events 1 Month Back", 50, v109);
  v83 = String.LocalizationValue.init(stringLiteral:)(0x68746E6F4D2031, 0xE700000000000000);
  static Locale.current.getter(v83);
  v82(v22, v61, v80);
  v84 = v82;
  LOWORD(v110) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsSyncDurationType_OneMonthBack_Synonym_1Month", 52, 2, v28, 0, 0, v25, v22, "Synonym (\"1 Month\") for sync events 1 Month Back", 48, v110);
  v85 = v149;
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000012ALL, 0x800000010003C6B0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v125, v128, v76, v78, v85);
  *(_BYTE *)(v141 + v124 + v145) = 3;
  v86 = String.LocalizationValue.init(stringLiteral:)(0x7368746E6F4D2033, 0xED00006B63614220);
  static Locale.current.getter(v86);
  v87 = v148;
  v88 = v84;
  v84(v22, v61, v148);
  LOWORD(v111) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsSyncDurationType_ThreeMonthsBack", 40, 2, v28, 0, 0, v25, v22, "Display name for Sync events 3 Months Back type", 47, v111);
  v144(v130, 1, 1, v146);
  v89 = v120;
  v90 = v133;
  v140(v120, v143, v133);
  v142(v89, 0, 1, v90);
  v91 = swift_allocObject(v139, v138, v137);
  *(_OWORD *)(v91 + 16) = v135;
  v92 = String.LocalizationValue.init(stringLiteral:)(0x7368746E6F4D2033, 0xE800000000000000);
  static Locale.current.getter(v92);
  v88(v22, v61, v87);
  LOWORD(v112) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsSyncDurationType_ThreeMonthsBack_Synonym_3Months", 56, 2, v28, 0, 0, v25, v22, "Synonym (\"3 Months\") for sync events 3 Months Back", 50, v112);
  v93 = String.LocalizationValue.init(stringLiteral:)(0x6F4D206565726854, 0xEC0000007368746ELL);
  static Locale.current.getter(v93);
  v88(v22, v61, v87);
  LOWORD(v113) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsSyncDurationType_ThreeMonthsBack_Synonym_ThreeMonths", 60, 2, v28, 0, 0, v25, v22, "Synonym (\"Three Months\") for sync events 3 Months Back", 54, v113);
  v94 = v149;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000157, 0x800000010003C940);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v129, v130, v89, v91, v94);
  v145 = v141 + 4 * v145;
  *(_BYTE *)v145 = 4;
  v95 = String.LocalizationValue.init(stringLiteral:)(0x7368746E6F4D2036, 0xED00006B63614220);
  static Locale.current.getter(v95);
  v96 = v126;
  v97 = v148;
  v88(v22, v126, v148);
  LOWORD(v114) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsSyncDurationType_SixMonthsBack", 38, 2, v28, 0, 0, v25, v22, "Display name for Sync events 6 Months Back type", 47, v114);
  v144(v132, 1, 1, v146);
  v98 = v121;
  v99 = v133;
  v140(v121, v143, v133);
  v142(v98, 0, 1, v99);
  v100 = swift_allocObject(v139, v138, v137);
  *(_OWORD *)(v100 + 16) = v135;
  v101 = String.LocalizationValue.init(stringLiteral:)(0x7368746E6F4D2036, 0xE800000000000000);
  static Locale.current.getter(v101);
  v88(v22, v96, v97);
  LOWORD(v115) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsSyncDurationType_SixMonthsBack_Synonym_6Months", 54, 2, v28, 0, 0, v25, v22, "Synonym (\"6 Months\") for sync events 6 Months Back", 50, v115);
  v102 = String.LocalizationValue.init(stringLiteral:)(0x746E6F4D20786953, 0xEA00000000007368);
  static Locale.current.getter(v102);
  v88(v22, v96, v97);
  LOWORD(v116) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsSyncDurationType_SixMonthsBack_Synonym_SixMonths", 56, 2, v28, 0, 0, v25, v22, "Synonym (\"Six Months\") for sync events 6 Months Back", 52, v116);
  v103 = v149;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000168, 0x800000010003CC00);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v131, v132, v98, v100, v103);
  result = sub_10003283C(v119);
  qword_10005DE00 = result;
  return result;
}

uint64_t sub_10000DFA4@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v20[24];

  v4 = sub_100007E00(&qword_10005CC78);
  __chkstk_darwin(v4);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = type metadata accessor for LocalizedStringResource(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (qword_10005C4B8 != -1)
    swift_once(&qword_10005C4B8, sub_10000CFA8);
  swift_beginAccess(&qword_10005DE00, v20, 32, 0);
  v11 = qword_10005DE00;
  if (*(_QWORD *)(qword_10005DE00 + 16) && (sub_1000372D8(a1), (v13 & 1) != 0))
  {
    v14 = v12;
    v15 = *(_QWORD *)(v11 + 56);
    v16 = type metadata accessor for DisplayRepresentation(0);
    v17 = *(_QWORD *)(v16 - 8);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v17 + 16))(v6, v15 + *(_QWORD *)(v17 + 72) * v14, v16);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v6, 0, 1, v16);
  }
  else
  {
    v16 = type metadata accessor for DisplayRepresentation(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  type metadata accessor for DisplayRepresentation(0);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v6, 1, v16))
  {
    sub_100010A58((uint64_t)v6);
    swift_endAccess(v20);
    return LocalizedStringResource.init(stringLiteral:)(0, 0xE000000000000000);
  }
  else
  {
    DisplayRepresentation.title.getter();
    sub_100010A58((uint64_t)v6);
    swift_endAccess(v20);
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v8 + 32))(a2, v10, v7);
  }
}

void sub_10000E198(char *a1)
{
  sub_100032F34(*a1);
}

unint64_t sub_10000E1A8()
{
  unint64_t result;

  result = qword_10005CAA0;
  if (!qword_10005CAA0)
  {
    result = swift_getWitnessTable(&unk_100046A34, &type metadata for SettingsSyncDurationType);
    atomic_store(result, (unint64_t *)&qword_10005CAA0);
  }
  return result;
}

void sub_10000E1EC()
{
  char *v0;

  sub_100033194(*v0);
}

void sub_10000E1F4(uint64_t a1)
{
  char *v1;

  sub_1000334B0(a1, *v1);
}

void sub_10000E1FC(uint64_t a1)
{
  char *v1;

  sub_1000336A0(a1, *v1);
}

unint64_t sub_10000E204@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_1000101CC(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000E230@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_10000CD0C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10000E25C()
{
  unint64_t result;

  result = qword_10005CAA8;
  if (!qword_10005CAA8)
  {
    result = swift_getWitnessTable(&unk_100046B4C, &type metadata for SettingsSyncDurationType);
    atomic_store(result, (unint64_t *)&qword_10005CAA8);
  }
  return result;
}

unint64_t sub_10000E2A4()
{
  unint64_t result;

  result = qword_10005CAB0;
  if (!qword_10005CAB0)
  {
    result = swift_getWitnessTable(&unk_100046B84, &type metadata for SettingsSyncDurationType);
    atomic_store(result, (unint64_t *)&qword_10005CAB0);
  }
  return result;
}

unint64_t sub_10000E2EC()
{
  unint64_t result;

  result = qword_10005CAB8;
  if (!qword_10005CAB8)
  {
    result = swift_getWitnessTable(&unk_100046A9C, &type metadata for SettingsSyncDurationType);
    atomic_store(result, (unint64_t *)&qword_10005CAB8);
  }
  return result;
}

uint64_t sub_10000E330@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_10000CC84(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10000E35C()
{
  unint64_t result;

  result = qword_10005CAC0;
  if (!qword_10005CAC0)
  {
    result = swift_getWitnessTable(&unk_100046BB4, &type metadata for SettingsSyncDurationType);
    atomic_store(result, (unint64_t *)&qword_10005CAC0);
  }
  return result;
}

unint64_t sub_10000E3A4()
{
  unint64_t result;

  result = qword_10005CAC8;
  if (!qword_10005CAC8)
  {
    result = swift_getWitnessTable(&unk_100046BDC, &type metadata for SettingsSyncDurationType);
    atomic_store(result, (unint64_t *)&qword_10005CAC8);
  }
  return result;
}

unint64_t sub_10000E3EC()
{
  unint64_t result;

  result = qword_10005CAD0;
  if (!qword_10005CAD0)
  {
    result = swift_getWitnessTable(&unk_100046C04, &type metadata for SettingsSyncDurationType);
    atomic_store(result, (unint64_t *)&qword_10005CAD0);
  }
  return result;
}

unint64_t sub_10000E434()
{
  unint64_t result;

  result = qword_10005CAD8;
  if (!qword_10005CAD8)
  {
    result = swift_getWitnessTable(&unk_100046C5C, &type metadata for SettingsSyncDurationType);
    atomic_store(result, (unint64_t *)&qword_10005CAD8);
  }
  return result;
}

uint64_t sub_10000E478@<X0>(uint64_t a1@<X8>)
{
  return sub_10000773C(&qword_10005C4B0, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005DDE8, (uint64_t)sub_10000CD94, a1);
}

uint64_t sub_10000E49C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076D8(a1, a2, a3, (uint64_t (*)(void))sub_10000E4B0, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

unint64_t sub_10000E4B0()
{
  unint64_t result;

  result = qword_10005CAE0;
  if (!qword_10005CAE0)
  {
    result = swift_getWitnessTable(&unk_100046AD4, &type metadata for SettingsSyncDurationType);
    atomic_store(result, (unint64_t *)&qword_10005CAE0);
  }
  return result;
}

uint64_t sub_10000E4F4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000E4B0();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000E530()
{
  unint64_t result;

  result = qword_10005CAE8;
  if (!qword_10005CAE8)
  {
    result = swift_getWitnessTable(&unk_100046C9C, &type metadata for SettingsSyncDurationType);
    atomic_store(result, (unint64_t *)&qword_10005CAE8);
  }
  return result;
}

unint64_t sub_10000E578()
{
  unint64_t result;

  result = qword_10005CAF0;
  if (!qword_10005CAF0)
  {
    result = swift_getWitnessTable(&unk_100046CC4, &type metadata for SettingsSyncDurationType);
    atomic_store(result, (unint64_t *)&qword_10005CAF0);
  }
  return result;
}

unint64_t sub_10000E5C0()
{
  unint64_t result;

  result = qword_10005CAF8;
  if (!qword_10005CAF8)
  {
    result = swift_getWitnessTable(&unk_100046A5C, &type metadata for SettingsSyncDurationType);
    atomic_store(result, (unint64_t *)&qword_10005CAF8);
  }
  return result;
}

uint64_t sub_10000E604()
{
  _BYTE v1[24];

  if (qword_10005C4B8 != -1)
    swift_once(&qword_10005C4B8, sub_10000CFA8);
  swift_beginAccess(&qword_10005DE00, v1, 0, 0);
  return swift_bridgeObjectRetain(qword_10005DE00);
}

uint64_t sub_10000E670(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000E434();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10000E6A8()
{
  return sub_10000A9CC(&qword_10005CB00, &qword_10005CB08, (uint64_t)&protocol conformance descriptor for [A]);
}

void sub_10000E6D4(_QWORD *a1@<X8>)
{
  *a1 = &off_100054BB0;
}

unint64_t sub_10000E6E8()
{
  unint64_t result;

  result = qword_10005CB10;
  if (!qword_10005CB10)
  {
    result = swift_getWitnessTable(&unk_100046D5C, &type metadata for SettingsSyncDurationsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CB10);
  }
  return result;
}

unint64_t sub_10000E730()
{
  unint64_t result;

  result = qword_10005CB18;
  if (!qword_10005CB18)
  {
    result = swift_getWitnessTable(&unk_100047098, &type metadata for SettingsSyncDurationsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CB18);
  }
  return result;
}

uint64_t sub_10000E774(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_10000E78C, 0, 0);
}

uint64_t sub_10000E78C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  char v5;

  v1 = CalDaysToSync();
  if (v1 == 183)
    v2 = 4;
  else
    v2 = 0;
  if (v1 == 92)
    v3 = 3;
  else
    v3 = v2;
  if (v1 == 31)
    v4 = 2;
  else
    v4 = 0;
  if (v1 == 14)
    v5 = 1;
  else
    v5 = v4;
  if (v1 <= 91)
    v3 = v5;
  **(_BYTE **)(v0 + 16) = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E7FC(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_10000E818, 0, 0);
}

uint64_t sub_10000E818()
{
  uint64_t v0;

  CalSetDaysToSync(qword_100047338[*(char *)(v0 + 16)]);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E858()
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
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  __int16 v19;
  _BYTE v20[16];

  v0 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v0);
  v2 = &v20[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v10);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v20[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000014, 0x800000010003C050);
  static Locale.current.getter(v17);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  v19 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsSyncDurationsEntityName", 31, 2, v12, 0, 0, v9, v6, "Name of the SettingsSyncDurationsEntity type", 44, v19);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v2, 1, 1, v13);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v16, v2);
}

uint64_t sub_10000EA64@<X0>(uint64_t a1@<X8>)
{
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
  _QWORD v26[2];

  v26[0] = a1;
  v1 = sub_100007E00(&qword_10005D190);
  __chkstk_darwin(v1);
  v3 = (char *)v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v4);
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Locale(0);
  __chkstk_darwin(v11);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v14);
  v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for LocalizedStringResource(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000014, 0x800000010003C050);
  static Locale.current.getter(v21);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsSyncDurationsEntityName", 31, 2, v16, 0, 0, v13, v10, "Name of the SettingsSyncDurationsEntity type", 44, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v6, 1, 1, v17);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v22 = type metadata accessor for DisplayRepresentation.Image(0);
  v23 = sub_100007F0C(v22, (uint64_t)qword_10005DF80);
  v24 = *(_QWORD *)(v22 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v3, v23, v22);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v3, 0, 1, v22);
  return DisplayRepresentation.init(title:subtitle:image:)(v20, v6, v3);
}

uint64_t sub_10000ED1C()
{
  uint64_t v0;

  v0 = qword_10005CA90;
  swift_bridgeObjectRetain(off_10005CA98);
  return v0;
}

unint64_t sub_10000ED54()
{
  unint64_t result;

  result = qword_10005CB20;
  if (!qword_10005CB20)
  {
    result = swift_getWitnessTable(&unk_100046DB4, &type metadata for SettingsSyncDurationsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CB20);
  }
  return result;
}

unint64_t sub_10000ED9C()
{
  unint64_t result;

  result = qword_10005CB28;
  if (!qword_10005CB28)
  {
    result = swift_getWitnessTable(&unk_100046DEC, &type metadata for SettingsSyncDurationsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CB28);
  }
  return result;
}

unint64_t sub_10000EDE4()
{
  unint64_t result;

  result = qword_10005CB30;
  if (!qword_10005CB30)
  {
    result = swift_getWitnessTable(&unk_100046E1C, &type metadata for SettingsSyncDurationsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CB30);
  }
  return result;
}

unint64_t sub_10000EE2C()
{
  unint64_t result;

  result = qword_10005CB38;
  if (!qword_10005CB38)
  {
    result = swift_getWitnessTable(&unk_100047110, &type metadata for SettingsSyncDurationsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CB38);
  }
  return result;
}

unint64_t sub_10000EE74()
{
  unint64_t result;

  result = qword_10005CB40;
  if (!qword_10005CB40)
  {
    result = swift_getWitnessTable(&unk_100046E54, &type metadata for SettingsSyncDurationsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CB40);
  }
  return result;
}

unint64_t sub_10000EEBC()
{
  unint64_t result;

  result = qword_10005CB48;
  if (!qword_10005CB48)
  {
    result = swift_getWitnessTable(&unk_100046E7C, &type metadata for SettingsSyncDurationsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CB48);
  }
  return result;
}

unint64_t sub_10000EF04()
{
  unint64_t result;

  result = qword_10005CB50;
  if (!qword_10005CB50)
  {
    result = swift_getWitnessTable(&unk_100046EA4, &type metadata for SettingsSyncDurationsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CB50);
  }
  return result;
}

unint64_t sub_10000EF4C()
{
  unint64_t result;

  result = qword_10005CB58;
  if (!qword_10005CB58)
  {
    result = swift_getWitnessTable(&unk_100046EFC, &type metadata for SettingsSyncDurationsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CB58);
  }
  return result;
}

void sub_10000EF90(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000001DLL;
  a1[1] = 0x800000010003C140;
}

uint64_t sub_10000EFB4()
{
  return sub_10000A9CC(&qword_10005CB60, &qword_10005CB68, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_10000EFE0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000E6E8();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000F01C()
{
  unint64_t result;

  result = qword_10005CB70;
  if (!qword_10005CB70)
  {
    result = swift_getWitnessTable(&unk_100046F2C, &type metadata for SettingsSyncDurationsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CB70);
  }
  return result;
}

uint64_t sub_10000F064(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000EF4C();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000F0A0()
{
  unint64_t result;

  result = qword_10005CB78;
  if (!qword_10005CB78)
  {
    result = swift_getWitnessTable(&unk_100046FC4, &type metadata for UpdateIntent_syncDurationType);
    atomic_store(result, (unint64_t *)&qword_10005CB78);
  }
  return result;
}

uint64_t sub_10000F0E4()
{
  return sub_10000A9CC(&qword_10005CB80, &qword_10005CB88, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_10000F110()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v13;
  _BYTE v14[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_100007F24(v10, qword_10005DE08);
  sub_100007F0C(v10, (uint64_t)qword_10005DE08);
  v11 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000001ALL, 0x800000010003C0D0);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  v13 = 2;
  return LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("UpdateSettingsSyncDurationIntent_title", 38, 2, v9, 0, 0, v6, v3, "Display string for the title of the UpdateSettingsSyncDurationIntent", 68, v13);
}

uint64_t sub_10000F2A4()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_1000472A0);
  qword_10005DE20 = result;
  return result;
}

uint64_t sub_10000F2C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  v4 = type metadata accessor for MainActor(0);
  v3[7] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v3[8] = v5;
  v3[9] = v6;
  return swift_task_switch(sub_10000F338, v5, v6);
}

uint64_t sub_10000F338()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = v0[2];
  v0[3] = v1;
  v0[10] = v1;
  IntentParameter.wrappedValue.getter(v0 + 14);
  if (qword_10005C4C8 != -1)
    swift_once(&qword_10005C4C8, sub_10000F2A4);
  v2 = qword_10005DE20;
  v0[11] = qword_10005DE20;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  v0[12] = v4;
  v5 = sub_10000A9CC(&qword_10005CC38, &qword_10005CC40, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_100008D04;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 14, v2, &type metadata for SettingsSyncDurationType, v5);
}

uint64_t sub_10000F42C()
{
  if (qword_10005C4C8 != -1)
    swift_once(&qword_10005C4C8, sub_10000F2A4);
  return swift_retain(qword_10005DE20);
}

unint64_t sub_10000F470()
{
  unint64_t result;

  result = qword_10005CB90;
  if (!qword_10005CB90)
  {
    result = swift_getWitnessTable(&unk_100047054, &type metadata for UpdateIntent_syncDurationType);
    atomic_store(result, (unint64_t *)&qword_10005CB90);
  }
  return result;
}

unint64_t sub_10000F4B8()
{
  unint64_t result;

  result = qword_10005CB98;
  if (!qword_10005CB98)
  {
    result = swift_getWitnessTable(&unk_10004707C, &type metadata for UpdateIntent_syncDurationType);
    atomic_store(result, (unint64_t *)&qword_10005CB98);
  }
  return result;
}

uint64_t sub_10000F4FC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100050040, 1);
}

uint64_t sub_10000F50C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076D8(a1, a2, a3, (uint64_t (*)(void))sub_10000F0A0, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t sub_10000F520@<X0>(uint64_t a1@<X8>)
{
  return sub_10000773C(&qword_10005C4C0, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005DE08, (uint64_t)sub_10000F110, a1);
}

uint64_t sub_10000F544(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005CC4C);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_100009170;
  return sub_10000F2C8(a1, v5, v4);
}

uint64_t sub_10000F5A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100010214();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000F5CC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000F0A0();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10000F5F8()
{
  unint64_t result;

  result = qword_10005CBA8;
  if (!qword_10005CBA8)
  {
    result = swift_getWitnessTable(&unk_1000470D8, &type metadata for SettingsSyncDurationsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CBA8);
  }
  return result;
}

unint64_t sub_10000F640()
{
  unint64_t result;

  result = qword_10005CBB0[0];
  if (!qword_10005CBB0[0])
  {
    result = swift_getWitnessTable(&unk_100046CFC, &type metadata for SettingsSyncDurationsEntity);
    atomic_store(result, qword_10005CBB0);
  }
  return result;
}

uint64_t sub_10000F684(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005CC20 + dword_10005CC20);
  v2 = (_QWORD *)swift_task_alloc(unk_10005CC24);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000AB54;
  return v4();
}

uint64_t sub_10000F6E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10000E730();
  *v4 = v2;
  v4[1] = sub_100009358;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10000F74C()
{
  unint64_t result;

  result = qword_10005CBC8;
  if (!qword_10005CBC8)
  {
    result = swift_getWitnessTable(&unk_100047168, &type metadata for SettingsSyncDurationsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CBC8);
  }
  return result;
}

unint64_t sub_10000F794()
{
  unint64_t result;

  result = qword_10005CBD0[0];
  if (!qword_10005CBD0[0])
  {
    result = swift_getWitnessTable(&unk_1000471C8, &type metadata for SettingsSyncDurationsEntityQuery);
    atomic_store(result, qword_10005CBD0);
  }
  return result;
}

uint64_t sub_10000F7D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10000E730();
  *v5 = v2;
  v5[1] = sub_1000094B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10000F844(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10000E730();
  *v4 = v2;
  v4[1] = sub_10000AB54;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10000F8B0()
{
  unint64_t result;

  result = qword_10005CBE8;
  if (!qword_10005CBE8)
  {
    result = swift_getWitnessTable(&unk_1000471F0, &type metadata for SettingsSyncDurationsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CBE8);
  }
  return result;
}

unint64_t sub_10000F8F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005CBF0;
  if (!qword_10005CBF0)
  {
    v1 = sub_100007220(qword_10005CBF8);
    sub_10000EF04();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005CBF0);
  }
  return result;
}

uint64_t sub_10000F95C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10000EE2C();
  *v5 = v2;
  v5[1] = sub_10000AB50;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_syncDurationType()
{
  return &type metadata for UpdateIntent_syncDurationType;
}

ValueMetadata *type metadata accessor for SettingsSyncDurationsEntityQuery()
{
  return &type metadata for SettingsSyncDurationsEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsSyncDurationsEntity()
{
  return &type metadata for SettingsSyncDurationsEntity;
}

uint64_t getEnumTagSinglePayload for SettingsSyncDurationType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SettingsSyncDurationType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000FAD4 + 4 * byte_100046A2F[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10000FB08 + 4 * byte_100046A2A[v4]))();
}

uint64_t sub_10000FB08(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000FB10(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000FB18);
  return result;
}

uint64_t sub_10000FB24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000FB2CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_10000FB30(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000FB38(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SettingsSyncDurationType()
{
  return &type metadata for SettingsSyncDurationType;
}

uint64_t sub_10000FB54@<X0>(uint64_t a1@<X8>)
{
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
  id v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  uint64_t KeyPath;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t OpaqueTypeConformance2;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  Swift::String v43;

  v40 = a1;
  v1 = type metadata accessor for ControlSize(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00((uint64_t *)&unk_10005D1B0);
  v35 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007E00(&qword_10005CC68);
  v8 = *(_QWORD *)(v7 - 8);
  v36 = v7;
  v37 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100007E00(&qword_10005D1C0);
  v12 = *(_QWORD *)(v11 - 8);
  v38 = v11;
  v39 = v12;
  __chkstk_darwin(v11);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v43._countAndFlagsBits = 0xD00000000000002CLL;
  v43._object = (void *)0x800000010003C070;
  v16._object = (void *)0x800000010003C050;
  v16._countAndFlagsBits = 0xD000000000000014;
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  v18 = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, (Swift::String_optional)0, (NSBundle)v15, v17, v43);

  KeyPath = swift_getKeyPath(&unk_1000472A0);
  static ControlSize._1x1.getter();
  v20 = sub_10000E4B0();
  v21 = sub_100010A14();
  v22 = sub_10000F640();
  ControlPicker.init<A, B, C, D, E, F, G>(kind:displayName:preferredSize:intentUpdatableProperty:title:value:affordances:)(0xD000000000000020, 0x800000010003CDC0, v18._countAndFlagsBits, v18._object, v3, KeyPath, sub_10000FEDC, 0, sub_100010094, 0, sub_100010118, 0, &type metadata for Text, &type metadata for Text, v20, v21, v22, &protocol witness table for Text, &protocol witness table for Text);
  v23 = LocalizedStringKey.init(stringLiteral:)(0x61727544636E7953, 0xED0000736E6F6974);
  v25 = v24;
  LOBYTE(v21) = v26;
  v28 = v27;
  v29 = sub_10000A9CC(&qword_10005D1D0, (uint64_t *)&unk_10005D1B0, (uint64_t)&protocol conformance descriptor for ControlPicker<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v23, v25, v21 & 1, v28, v4, v29);
  swift_bridgeObjectRelease(v28);
  swift_bridgeObjectRelease(v25);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v4);
  v41 = v4;
  v42 = v29;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v41, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v31 = v36;
  WidgetConfiguration.disablesControlStateCaching()(v36, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v10, v31);
  v41 = v31;
  v42 = OpaqueTypeConformance2;
  v32 = swift_getOpaqueTypeConformance2(&v41, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v33 = v38;
  WidgetConfiguration.hiddenControl()(v38, v32);
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v14, v33);
}

uint64_t sub_10000FEDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  char v15;
  uint64_t v16;
  __int16 v17;
  _BYTE v18[16];

  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = &v18[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin();
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000014, 0x800000010003C050);
  static Locale.current.getter(v12);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  v17 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsSyncDurationsEntityName", 31, 2, v9, 0, 0, v7, v5, "Name of the SettingsSyncDurationsEntity type", 44, v17);
  result = Text.init(_:)(v11);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v14;
  *(_BYTE *)(a1 + 16) = v15 & 1;
  *(_QWORD *)(a1 + 24) = v16;
  return result;
}

uint64_t sub_100010094@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v4 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000DFA4(*a1, (uint64_t)v6);
  result = Text.init(_:)(v6);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v8;
  *(_BYTE *)(a2 + 16) = v9 & 1;
  *(_QWORD *)(a2 + 24) = v10;
  return result;
}

uint64_t sub_100010118(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000DFA4(*a1, (uint64_t)v4);
  v5 = Text.init(_:)(v4);
  return ControlAffordances.init(tint:status:actionHint:)(0, v5, v7, v6 & 1, v8, 0, 0, 0, 0);
}

unint64_t sub_1000101CC(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100054B18, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 5)
    return 5;
  else
    return v3;
}

uint64_t sub_100010214()
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
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_BYTE *, uint64_t, uint64_t);
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  void (*v29)(_BYTE *, uint64_t, uint64_t, uint64_t);
  _BYTE *v30;
  _BYTE *v31;
  _BYTE *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v38;
  uint64_t v39;
  _BYTE *v40;
  _BYTE *v41;
  _BYTE *v42;
  _BYTE *v43;
  unint64_t v44;
  __int16 v46;
  int v47;
  int v48;
  int v49;
  _BYTE v50[4];
  unsigned int v51;
  uint64_t v52;
  void (*v53)(_BYTE *, uint64_t, uint64_t);
  unsigned int v54;
  void (*v55)(_BYTE *);
  uint64_t v56;
  void (*v57)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  _BYTE *v61;
  _BYTE *v62;
  _BYTE *v63;
  _BYTE *v64;
  uint64_t v65;
  char v66[3];
  uint64_t v67;

  v65 = type metadata accessor for InputConnectionBehavior(0);
  v60 = *(_QWORD *)(v65 - 8);
  __chkstk_darwin(v65);
  v64 = &v50[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v1 = sub_100007E00((uint64_t *)&unk_10005D140);
  v2 = __chkstk_darwin(v1);
  v63 = &v50[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  v62 = &v50[-v4];
  v5 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v5);
  v61 = &v50[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v50[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = type metadata accessor for Locale(0);
  __chkstk_darwin(v11);
  v13 = &v50[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v14);
  v16 = &v50[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = type metadata accessor for LocalizedStringResource(0);
  v18 = *(_QWORD *)(v17 - 8);
  v58 = v17;
  v19 = __chkstk_darwin(v17);
  v59 = &v50[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v19);
  v22 = &v50[-v21];
  v56 = sub_100007E00(&qword_10005CC10);
  v23 = String.LocalizationValue.init(stringLiteral:)(0x746567726154, 0xE600000000000000);
  static Locale.current.getter(v23);
  v24 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v25 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 104);
  v51 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v52 = v7;
  v25(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  v53 = v25;
  v46 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target", 6, 2, v16, 0, 0, v13, v10, "Calendar settings entity title that indicates which setting the user would like to target.", 90, v46);
  v26 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x800000010003B560);
  static Locale.current.getter(v26);
  v25(v10, v24, v7);
  LOWORD(v47) = 2;
  v27 = v61;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target_description", 18, 2, v16, 0, 0, v13, v10, "Description for the Calendar settings entity parameter that indicates which setting the user would like to target.", 114, v47);
  v57 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v18 + 56);
  v57(v27, 0, 1, v17);
  v67 = 0;
  v28 = type metadata accessor for IntentDialog(0);
  v29 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56);
  v30 = v62;
  v29(v62, 1, 1, v28);
  v31 = v63;
  v29(v63, 1, 1, v28);
  v54 = enum case for InputConnectionBehavior.default(_:);
  v55 = *(void (**)(_BYTE *))(v60 + 104);
  v32 = v64;
  v55(v64);
  v33 = sub_10000E6E8();
  v60 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v22, v27, &v67, v30, v31, v32, v33);
  v56 = sub_100007E00(&qword_10005CC18);
  v34 = String.LocalizationValue.init(stringLiteral:)(0x65756C6156, 0xE500000000000000);
  static Locale.current.getter(v34);
  v35 = v51;
  v36 = v52;
  v37 = v53;
  v53(v10, v51, v52);
  LOWORD(v48) = 2;
  v38 = v59;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value", 5, 2, v16, 0, 0, v13, v10, "Calendar settings property title that indicates which property of a setting the user would like to set to as the value.", 119, v48);
  v39 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000026, 0x800000010003B6A0);
  static Locale.current.getter(v39);
  v37(v10, v35, v36);
  LOWORD(v49) = 2;
  v40 = v61;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value_description", 17, 2, v16, 0, 0, v13, v10, "Description for a Calendar settings property parameter that indicates which value of a setting the user would like to set to.", 125, v49);
  v57(v40, 0, 1, v58);
  v66[0] = 5;
  v41 = v62;
  v29(v62, 1, 1, v28);
  v42 = v63;
  v29(v63, 1, 1, v28);
  v43 = v64;
  ((void (*)(_BYTE *, _QWORD, uint64_t))v55)(v64, v54, v65);
  v44 = sub_10000E4B0();
  IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v38, v40, v66, v41, v42, v43, &off_100054BD8, v44);
  return v60;
}

uint64_t sub_1000107C8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100010884, 0, 0);
}

uint64_t sub_100010884()
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
  unint64_t v9;
  uint64_t v10;
  __int16 v12;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100007E00(&qword_10005CB88);
  v7 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000014, 0x800000010003C050);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  v12 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsSyncDurationsEntityName", 31, 2, v1, 0, 0, v4, v3, "Name of the SettingsSyncDurationsEntity type", 44, v12);
  v8 = sub_10000A9CC(&qword_10005CC38, &qword_10005CC40, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = sub_10000E4B0();
  v10 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005CC28, 0, &unk_10005CC30, 0, &type metadata for UpdateIntent_syncDurationType, v8, v9);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v10);
}

uint64_t sub_1000109E8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

ValueMetadata *type metadata accessor for SettingsSyncDurationsPickerControl()
{
  return &type metadata for SettingsSyncDurationsPickerControl;
}

uint64_t sub_100010A04(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100050084, 1);
}

unint64_t sub_100010A14()
{
  unint64_t result;

  result = qword_10005CC70;
  if (!qword_10005CC70)
  {
    result = swift_getWitnessTable(&unk_100046B14, &type metadata for SettingsSyncDurationType);
    atomic_store(result, (unint64_t *)&qword_10005CC70);
  }
  return result;
}

uint64_t sub_100010A58(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100007E00(&qword_10005CC78);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100010A98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_100007220(&qword_10005D1C0);
  v1 = sub_100007220(&qword_10005CC68);
  v5 = sub_100007220((uint64_t *)&unk_10005D1B0);
  v6 = sub_10000A9CC(&qword_10005D1D0, (uint64_t *)&unk_10005D1B0, (uint64_t)&protocol conformance descriptor for ControlPicker<A>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v5 = v1;
  v6 = OpaqueTypeConformance2;
  v3 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v5 = v0;
  v6 = v3;
  return swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.hiddenControl()>>, 1);
}

unint64_t sub_100010B58()
{
  unint64_t result;

  result = qword_10005CC90;
  if (!qword_10005CC90)
  {
    result = swift_getWitnessTable(&unk_1000473E0, &type metadata for SettingsWeekViewStartsOnTodayEntity);
    atomic_store(result, (unint64_t *)&qword_10005CC90);
  }
  return result;
}

unint64_t sub_100010BA0()
{
  unint64_t result;

  result = qword_10005CC98;
  if (!qword_10005CC98)
  {
    result = swift_getWitnessTable(&unk_10004771C, &type metadata for SettingsWeekViewStartsOnTodayEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CC98);
  }
  return result;
}

uint64_t sub_100010BE4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100010BFC, 0, 0);
}

id sub_100010BFC()
{
  uint64_t v0;
  id result;
  void *v2;
  unsigned __int8 *v3;
  unsigned __int8 v4;

  result = objc_msgSend((id)objc_opt_self(CUIKPreferences), "sharedPreferences");
  if (result)
  {
    v2 = result;
    v3 = *(unsigned __int8 **)(v0 + 16);
    v4 = objc_msgSend(result, "weekViewStartsOnToday");

    *v3 = v4;
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100010C78(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_100010C94, 0, 0);
}

id sub_100010C94()
{
  uint64_t v0;
  id result;
  void *v2;

  result = objc_msgSend((id)objc_opt_self(CUIKPreferences), "sharedPreferences");
  if (result)
  {
    v2 = result;
    objc_msgSend(result, "setWeekViewStartsOnToday:", *(unsigned __int8 *)(v0 + 16));

    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100010D00()
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
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  __int16 v19;
  _BYTE v20[16];

  v0 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v0);
  v2 = &v20[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v10);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v20[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000019, 0x800000010003CE20);
  static Locale.current.getter(v17);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  v19 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsWeekViewStartsOnTodayEntityName", 39, 2, v12, 0, 0, v9, v6, "Name of the SettingsWeekViewStartsOnTodayEntity type", 52, v19);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v2, 1, 1, v13);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v16, v2);
}

uint64_t sub_100010F0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v32 = a1;
  v1 = sub_100007E00(&qword_10005D190);
  __chkstk_darwin(v1);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v4);
  v31 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Locale(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for LocalizedStringResource(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v30 - v21;
  v23 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000019, 0x800000010003CE20);
  static Locale.current.getter(v23);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v15, 0, 0, v12, v9, "SettingsShowInviteeDeclinesEntity displayRepresentation", 55, 2);
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v25 = v31;
  v24(v31, 1, 1, v16);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v26 = type metadata accessor for DisplayRepresentation.Image(0);
  v27 = sub_100007F0C(v26, (uint64_t)qword_10005DF80);
  v28 = *(_QWORD *)(v26 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v3, v27, v26);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v3, 0, 1, v26);
  LocalizedStringResource.init(stringLiteral:)(0xD0000000000001BALL, 0x800000010003CEE0);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v22, v25, v3, &_swiftEmptyArrayStorage, v20);
}

uint64_t sub_1000111F8()
{
  uint64_t v0;

  v0 = qword_10005CC80;
  swift_bridgeObjectRetain(off_10005CC88);
  return v0;
}

unint64_t sub_100011230()
{
  unint64_t result;

  result = qword_10005CCA0;
  if (!qword_10005CCA0)
  {
    result = swift_getWitnessTable(&unk_100047438, &type metadata for SettingsWeekViewStartsOnTodayEntity);
    atomic_store(result, (unint64_t *)&qword_10005CCA0);
  }
  return result;
}

unint64_t sub_100011278()
{
  unint64_t result;

  result = qword_10005CCA8;
  if (!qword_10005CCA8)
  {
    result = swift_getWitnessTable(&unk_100047470, &type metadata for SettingsWeekViewStartsOnTodayEntity);
    atomic_store(result, (unint64_t *)&qword_10005CCA8);
  }
  return result;
}

unint64_t sub_1000112C0()
{
  unint64_t result;

  result = qword_10005CCB0;
  if (!qword_10005CCB0)
  {
    result = swift_getWitnessTable(&unk_1000474A0, &type metadata for SettingsWeekViewStartsOnTodayEntity);
    atomic_store(result, (unint64_t *)&qword_10005CCB0);
  }
  return result;
}

unint64_t sub_100011308()
{
  unint64_t result;

  result = qword_10005CCB8;
  if (!qword_10005CCB8)
  {
    result = swift_getWitnessTable(&unk_100047794, &type metadata for SettingsWeekViewStartsOnTodayEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CCB8);
  }
  return result;
}

unint64_t sub_100011350()
{
  unint64_t result;

  result = qword_10005CCC0;
  if (!qword_10005CCC0)
  {
    result = swift_getWitnessTable(&unk_1000474D8, &type metadata for SettingsWeekViewStartsOnTodayEntity);
    atomic_store(result, (unint64_t *)&qword_10005CCC0);
  }
  return result;
}

unint64_t sub_100011398()
{
  unint64_t result;

  result = qword_10005CCC8;
  if (!qword_10005CCC8)
  {
    result = swift_getWitnessTable(&unk_100047500, &type metadata for SettingsWeekViewStartsOnTodayEntity);
    atomic_store(result, (unint64_t *)&qword_10005CCC8);
  }
  return result;
}

unint64_t sub_1000113E0()
{
  unint64_t result;

  result = qword_10005CCD0;
  if (!qword_10005CCD0)
  {
    result = swift_getWitnessTable(&unk_100047528, &type metadata for SettingsWeekViewStartsOnTodayEntity);
    atomic_store(result, (unint64_t *)&qword_10005CCD0);
  }
  return result;
}

unint64_t sub_100011428()
{
  unint64_t result;

  result = qword_10005CCD8;
  if (!qword_10005CCD8)
  {
    result = swift_getWitnessTable(&unk_100047580, &type metadata for SettingsWeekViewStartsOnTodayEntity);
    atomic_store(result, (unint64_t *)&qword_10005CCD8);
  }
  return result;
}

void sub_10001146C(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000025;
  a1[1] = 0x800000010003D0E0;
}

uint64_t sub_100011490()
{
  return sub_10000A9CC(&qword_10005CCE0, &qword_10005CCE8, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_1000114BC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100010B58();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000114F8()
{
  unint64_t result;

  result = qword_10005CCF0;
  if (!qword_10005CCF0)
  {
    result = swift_getWitnessTable(&unk_1000475B0, &type metadata for SettingsWeekViewStartsOnTodayEntity);
    atomic_store(result, (unint64_t *)&qword_10005CCF0);
  }
  return result;
}

uint64_t sub_100011540(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100011428();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10001157C()
{
  unint64_t result;

  result = qword_10005CCF8;
  if (!qword_10005CCF8)
  {
    result = swift_getWitnessTable(&unk_100047648, &type metadata for UpdateIntent_weekViewStartsOnToday);
    atomic_store(result, (unint64_t *)&qword_10005CCF8);
  }
  return result;
}

uint64_t sub_1000115C0()
{
  return sub_10000A9CC(&qword_10005CD00, &qword_10005CD08, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_1000115EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v13;
  _BYTE v14[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_100007F24(v10, qword_10005DE28);
  sub_100007F0C(v10, (uint64_t)qword_10005DE28);
  v11 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000020, 0x800000010003CE70);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  v13 = 2;
  return LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("UpdateSettingsWeekViewStartsOnTodayIntent_title", 47, 2, v9, 0, 0, v6, v3, "Display string for the title of the SettingsShowLocationSuggestionsIntent", 73, v13);
}

uint64_t sub_100011780()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100047918);
  qword_10005DE40 = result;
  return result;
}

uint64_t sub_1000117A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  v4 = type metadata accessor for MainActor(0);
  v3[7] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v3[8] = v5;
  v3[9] = v6;
  return swift_task_switch(sub_100011814, v5, v6);
}

uint64_t sub_100011814()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 16));
  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 24) = v1;
  *(_QWORD *)(v0 + 80) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 112));
  *(_BYTE *)(v0 + 113) = *(_BYTE *)(v0 + 112);
  if (qword_10005C4D8 != -1)
    swift_once(&qword_10005C4D8, sub_100011780);
  v2 = qword_10005DE40;
  *(_QWORD *)(v0 + 88) = qword_10005DE40;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 96) = v4;
  v5 = sub_10000A9CC(&qword_10005CDB0, &qword_10005CDB8, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_100008D04;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 113, v2, &type metadata for Bool, v5);
}

uint64_t sub_100011910()
{
  if (qword_10005C4D8 != -1)
    swift_once(&qword_10005C4D8, sub_100011780);
  return swift_retain(qword_10005DE40);
}

unint64_t sub_100011954()
{
  unint64_t result;

  result = qword_10005CD10;
  if (!qword_10005CD10)
  {
    result = swift_getWitnessTable(&unk_1000476D8, &type metadata for UpdateIntent_weekViewStartsOnToday);
    atomic_store(result, (unint64_t *)&qword_10005CD10);
  }
  return result;
}

unint64_t sub_10001199C()
{
  unint64_t result;

  result = qword_10005CD18;
  if (!qword_10005CD18)
  {
    result = swift_getWitnessTable(&unk_100047700, &type metadata for UpdateIntent_weekViewStartsOnToday);
    atomic_store(result, (unint64_t *)&qword_10005CD18);
  }
  return result;
}

uint64_t sub_1000119E0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100050100, 1);
}

uint64_t sub_1000119F0(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_10001157C();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100011A30@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10005C4D0 != -1)
    swift_once(&qword_10005C4D0, sub_1000115EC);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_100007F0C(v2, (uint64_t)qword_10005DE28);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100011AA0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005CDC4);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_100009170;
  return sub_1000117A4(a1, v5, v4);
}

char *sub_100011B04@<X0>(char **a1@<X8>)
{
  char *result;
  char *v3;

  result = sub_10001243C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100011B28(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001157C();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100011B54()
{
  unint64_t result;

  result = qword_10005CD28;
  if (!qword_10005CD28)
  {
    result = swift_getWitnessTable(&unk_10004775C, &type metadata for SettingsWeekViewStartsOnTodayEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CD28);
  }
  return result;
}

unint64_t sub_100011B9C()
{
  unint64_t result;

  result = qword_10005CD30[0];
  if (!qword_10005CD30[0])
  {
    result = swift_getWitnessTable(&unk_100047380, &type metadata for SettingsWeekViewStartsOnTodayEntity);
    atomic_store(result, qword_10005CD30);
  }
  return result;
}

uint64_t sub_100011BE0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005CD98 + dword_10005CD98);
  v2 = (_QWORD *)swift_task_alloc(unk_10005CD9C);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000AB54;
  return v4();
}

uint64_t sub_100011C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100010BA0();
  *v4 = v2;
  v4[1] = sub_100009358;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100011CA8()
{
  unint64_t result;

  result = qword_10005CD48;
  if (!qword_10005CD48)
  {
    result = swift_getWitnessTable(&unk_1000477EC, &type metadata for SettingsWeekViewStartsOnTodayEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CD48);
  }
  return result;
}

unint64_t sub_100011CF0()
{
  unint64_t result;

  result = qword_10005CD50[0];
  if (!qword_10005CD50[0])
  {
    result = swift_getWitnessTable(&unk_10004784C, &type metadata for SettingsWeekViewStartsOnTodayEntityQuery);
    atomic_store(result, qword_10005CD50);
  }
  return result;
}

uint64_t sub_100011D34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100010BA0();
  *v5 = v2;
  v5[1] = sub_1000094B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100011DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100010BA0();
  *v4 = v2;
  v4[1] = sub_10000AB54;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100011E0C()
{
  unint64_t result;

  result = qword_10005CD68;
  if (!qword_10005CD68)
  {
    result = swift_getWitnessTable(&unk_100047874, &type metadata for SettingsWeekViewStartsOnTodayEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CD68);
  }
  return result;
}

unint64_t sub_100011E54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005CD70;
  if (!qword_10005CD70)
  {
    v1 = sub_100007220(qword_10005CD78);
    sub_1000113E0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005CD70);
  }
  return result;
}

uint64_t sub_100011EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100011308();
  *v5 = v2;
  v5[1] = sub_10000AB50;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_weekViewStartsOnToday()
{
  return &type metadata for UpdateIntent_weekViewStartsOnToday;
}

ValueMetadata *type metadata accessor for SettingsWeekViewStartsOnTodayEntityQuery()
{
  return &type metadata for SettingsWeekViewStartsOnTodayEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsWeekViewStartsOnTodayEntity()
{
  return &type metadata for SettingsWeekViewStartsOnTodayEntity;
}

uint64_t sub_100011F54@<X0>(uint64_t a1@<X8>)
{
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t KeyPath;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  Swift::String v28;
  Swift::String v29;
  Swift::String v30;
  uint64_t OpaqueTypeConformance2;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  Swift::String v50;
  uint64_t v51;
  unint64_t v52;
  _QWORD v53[2];
  Swift::String v54;

  v49 = a1;
  v1 = sub_100007E00(&qword_10005C908);
  v41 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00(&qword_10005C910);
  v5 = *(_QWORD *)(v4 - 8);
  v43 = v4;
  v44 = v5;
  __chkstk_darwin(v4);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100007E00(&qword_10005C918);
  v9 = *(_QWORD *)(v8 - 8);
  v45 = v8;
  v46 = v9;
  __chkstk_darwin(v8);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100007E00(&qword_10005C920);
  v13 = *(_QWORD *)(v12 - 8);
  v47 = v12;
  v48 = v13;
  __chkstk_darwin(v12);
  v42 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100047918);
  v16 = sub_100007E00(&qword_10005C928);
  v17 = sub_100011B9C();
  v18 = sub_10000A9CC(&qword_10005C930, &qword_10005C928, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)(0xD000000000000028, 0x800000010003D110, KeyPath, sub_100012358, 0, sub_100009DC8, 0, sub_100009F80, 0, v16, &type metadata for Text, &type metadata for Text, v17, v18, &protocol witness table for Text, &protocol witness table for Text);
  v19 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000019, 0x800000010003CE20);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = sub_10000A9CC(&qword_10005C938, &qword_10005C908, (uint64_t)&protocol conformance descriptor for ControlToggle<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v19, v21, v23 & 1, v25, v1, v26);
  swift_bridgeObjectRelease(v25);
  swift_bridgeObjectRelease(v21);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v3, v1);
  v27 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v54._countAndFlagsBits = 0xD00000000000005ALL;
  v54._object = (void *)0x800000010003D140;
  v28._countAndFlagsBits = 0xD000000000000019;
  v28._object = (void *)0x800000010003CE20;
  v29._countAndFlagsBits = 0;
  v29._object = (void *)0xE000000000000000;
  v30 = NSLocalizedString(_:tableName:bundle:value:comment:)(v28, (Swift::String_optional)0, (NSBundle)v27, v29, v54);

  v50 = v30;
  v53[0] = v1;
  v53[1] = v26;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v53, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v32 = sub_10000AA0C();
  v33 = v43;
  WidgetConfiguration.description<A>(_:)(&v50, v43, &type metadata for String, OpaqueTypeConformance2, v32);
  swift_bridgeObjectRelease(v30._object);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v7, v33);
  v50._countAndFlagsBits = v33;
  v50._object = &type metadata for String;
  v51 = OpaqueTypeConformance2;
  v52 = v32;
  v34 = (void *)swift_getOpaqueTypeConformance2(&v50, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description<A>(_:)>>, 1);
  v35 = v42;
  v36 = v45;
  WidgetConfiguration.disablesControlStateCaching()(v45, v34);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v11, v36);
  v50._countAndFlagsBits = v36;
  v50._object = v34;
  v37 = swift_getOpaqueTypeConformance2(&v50, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v38 = v47;
  WidgetConfiguration.hiddenControl()(v47, v37);
  return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v35, v38);
}

uint64_t sub_100012358()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  unint64_t v4;
  Swift::String v6;
  Swift::String v7;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v7._countAndFlagsBits = 0xD000000000000034;
  v7._object = (void *)0x800000010003D0A0;
  v1._object = (void *)0x800000010003CE20;
  v1._countAndFlagsBits = 0xD000000000000019;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v7);

  v6 = v3;
  v4 = sub_10000AA0C();
  return Label<>.init<A>(_:systemImage:)(&v6, 0x7261646E656C6163, 0xE800000000000000, &type metadata for String, v4);
}

char *sub_10001243C()
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
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  char *v32;
  char *v33;
  char *v34;
  unint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  __int16 v46;
  int v47;
  int v48;
  int v49;
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  void (*v54)(char *, _QWORD, uint64_t, uint64_t);
  void (*v55)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  char v65[3];
  uint64_t v66;

  v0 = sub_100007E00(&qword_10005C8C0);
  __chkstk_darwin(v0);
  v61 = (char *)&v50 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = type metadata accessor for InputConnectionBehavior(0);
  v60 = *(_QWORD *)(v64 - 8);
  __chkstk_darwin(v64);
  v59 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100007E00((uint64_t *)&unk_10005D140);
  v4 = __chkstk_darwin(v3);
  v58 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v63 = (char *)&v50 - v6;
  v7 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v7);
  v62 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Locale(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v16);
  v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for LocalizedStringResource(0);
  v20 = *(_QWORD *)(v19 - 8);
  v56 = v19;
  v21 = __chkstk_darwin(v19);
  v57 = (char *)&v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v24 = (char *)&v50 - v23;
  v53 = sub_100007E00(&qword_10005CD90);
  v25 = String.LocalizationValue.init(stringLiteral:)(0x746567726154, 0xE600000000000000);
  static Locale.current.getter(v25);
  v26 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
  v51 = v9;
  v27(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  v50 = v27;
  v46 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target", 6, 2, v18, 0, 0, v15, v12, "Calendar settings entity title that indicates which setting the user would like to target.", 90, v46);
  v28 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x800000010003B560);
  static Locale.current.getter(v28);
  v27(v12, v26, v9);
  LOWORD(v47) = 2;
  v29 = v62;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target_description", 18, 2, v18, 0, 0, v15, v12, "Description for the Calendar settings entity parameter that indicates which setting the user would like to target.", 114, v47);
  v54 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56);
  v54(v29, 0, 1, v19);
  v66 = 0;
  v30 = type metadata accessor for IntentDialog(0);
  v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56);
  v55 = v31;
  v32 = v63;
  v31(v63, 1, 1, v30);
  v33 = v58;
  v31(v58, 1, 1, v30);
  v52 = enum case for InputConnectionBehavior.default(_:);
  v34 = v59;
  v60 = *(_QWORD *)(v60 + 104);
  ((void (*)(char *))v60)(v59);
  v35 = sub_100010B58();
  v58 = (char *)IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v24, v29, &v66, v32, v33, v34, v35);
  v53 = sub_100007E00(&qword_10005C8D0);
  v36 = String.LocalizationValue.init(stringLiteral:)(0x65756C6156, 0xE500000000000000);
  static Locale.current.getter(v36);
  v37 = v50;
  v38 = v51;
  v50(v12, v26, v51);
  LOWORD(v48) = 2;
  v39 = v57;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value", 5, 2, v18, 0, 0, v15, v12, "Calendar settings property title that indicates which property of a setting the user would like to set to as the value.", 119, v48);
  v40 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000026, 0x800000010003B6A0);
  static Locale.current.getter(v40);
  v37(v12, v26, v38);
  LOWORD(v49) = 2;
  v41 = v62;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value_description", 17, 2, v18, 0, 0, v15, v12, "Description for a Calendar settings property parameter that indicates which value of a setting the user would like to set to.", 125, v49);
  v54(v41, 0, 1, v56);
  v65[0] = 2;
  v42 = type metadata accessor for Bool.IntentDisplayName(0);
  v43 = v61;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v61, 1, 1, v42);
  v44 = v63;
  v55(v63, 1, 1, v30);
  ((void (*)(char *, _QWORD, uint64_t))v60)(v34, v52, v64);
  IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v39, v41, v65, v43, v44, v34);
  return v58;
}

uint64_t sub_100012A30()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100012AEC, 0, 0);
}

uint64_t sub_100012AEC()
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
  __int16 v11;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100007E00(&qword_10005CD08);
  v7 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000019, 0x800000010003CE20);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  v11 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsWeekViewStartsOnTodayEntityName", 39, 2, v1, 0, 0, v4, v3, "Name of the SettingsShowInviteeDeclinesEntity type", 50, v11);
  v8 = sub_10000A9CC(&qword_10005CDB0, &qword_10005CDB8, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005CDA0, 0, &unk_10005CDA8, 0, &type metadata for UpdateIntent_weekViewStartsOnToday, v8);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v9);
}

uint64_t sub_100012C44@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

ValueMetadata *type metadata accessor for SettingsWeekViewStartsOnTodayToggleControl()
{
  return &type metadata for SettingsWeekViewStartsOnTodayToggleControl;
}

uint64_t sub_100012C60(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100050144, 1);
}

void WidgetExtensionError.localizedStringResource.getter(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  __chkstk_darwin(v2);
  v3 = type metadata accessor for Locale(0);
  __chkstk_darwin(v3);
  v4 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v4);
  __asm { BR              X10 }
}

uint64_t sub_100012D50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000026, 0x800000010003D340);
  static Locale.current.getter(v5);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v0, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  return ((uint64_t (*)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, const char *, uint64_t, uint64_t))LocalizedStringResource.init(_:table:locale:bundle:comment:))(v3, 0, 0, v1, v0, "Error shown to the user when we cannot communicate with the calendar database when running an app intent", 104, 2);
}

BOOL static WidgetExtensionError.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void WidgetExtensionError.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int WidgetExtensionError.hashValue.getter(unsigned __int8 a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

BOOL sub_100012FA4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100012FB8()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100012FFC()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100013024(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_100013068()
{
  unint64_t result;

  result = qword_10005CDC8;
  if (!qword_10005CDC8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for WidgetExtensionError, &type metadata for WidgetExtensionError);
    atomic_store(result, (unint64_t *)&qword_10005CDC8);
  }
  return result;
}

void sub_1000130BC()
{
  char *v0;

  WidgetExtensionError.localizedStringResource.getter(*v0);
}

uint64_t getEnumTagSinglePayload for WidgetExtensionError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for WidgetExtensionError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000131A0 + 4 * byte_1000479B9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1000131D4 + 4 * byte_1000479B4[v4]))();
}

uint64_t sub_1000131D4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000131DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000131E4);
  return result;
}

uint64_t sub_1000131F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000131F8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1000131FC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013204(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WidgetExtensionError()
{
  return &type metadata for WidgetExtensionError;
}

uint64_t sub_100013220(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_10001325C + 4 * byte_100047AC0[a1]))(0xD000000000000011, 0x80000001000396C0);
}

uint64_t sub_10001325C()
{
  return 0x4D6E656574666966;
}

uint64_t sub_100013280()
{
  return 0x694D797472696874;
}

unint64_t sub_1000132A4()
{
  return 0xD000000000000010;
}

uint64_t sub_1000132EC()
{
  return 0x72756F48656E6FLL;
}

uint64_t sub_100013304()
{
  uint64_t v0;

  return v0 + 4;
}

uint64_t sub_10001331C()
{
  return 0x7372756F486F7774;
}

uint64_t sub_100013334(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100013370 + 4 * byte_100047AC9[a1]))(0xD000000000000011, 0x80000001000396C0);
}

uint64_t sub_100013370()
{
  return 0x4D6E656574666966;
}

uint64_t sub_100013394()
{
  return 0x694D797472696874;
}

unint64_t sub_1000133B8()
{
  return 0xD000000000000010;
}

uint64_t sub_100013400()
{
  return 0x72756F48656E6FLL;
}

uint64_t sub_100013418()
{
  uint64_t v0;

  return v0 + 4;
}

uint64_t sub_100013430()
{
  return 0x7372756F486F7774;
}

uint64_t sub_100013448()
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

  v0 = sub_100007E00(&qword_10005D630);
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
  sub_100007F24(v16, qword_10005DE48);
  sub_100007F0C(v16, (uint64_t)qword_10005DE48);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000017, 0x800000010003A880);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, _QWORD))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v19[0]);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0, 0, v8, v5, "Title for choosing a duration for new events", 44, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v2, 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v2);
}

unint64_t sub_10001365C()
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
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
  void (*v65)(_QWORD);
  void (*v66)(char *, _QWORD, uint64_t);
  void (*v67)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _BYTE *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  void (*v83)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(char *, _QWORD, uint64_t);
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void (*v98)(char *, uint64_t, uint64_t);
  uint64_t v99;
  uint64_t v100;
  void (*v101)(char *, uint64_t, uint64_t);
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _BYTE *v110;
  uint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void (*v120)(char *, uint64_t, uint64_t);
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void (*v133)(char *, uint64_t, uint64_t);
  uint64_t v134;
  _BYTE *v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  char *v139;
  uint64_t v140;
  void (*v141)(char *, uint64_t, uint64_t);
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void (*v146)(char *, uint64_t, uint64_t);
  uint64_t v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void (*v162)(char *, uint64_t, uint64_t);
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void (*v174)(char *, uint64_t, uint64_t);
  char *v175;
  char *v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  unint64_t result;
  int v185;
  int v186;
  int v187;
  int v188;
  int v189;
  int v190;
  int v191;
  int v192;
  int v193;
  int v194;
  int v195;
  int v196;
  int v197;
  int v198;
  int v199;
  int v200;
  int v201;
  int v202;
  int v203;
  int v204;
  int v205;
  int v206;
  int v207;
  int v208;
  int v209;
  int v210;
  int v211;
  int v212;
  int v213;
  int v214;
  int v215;
  int v216;
  int v217;
  int v218;
  _QWORD v219[2];
  uint64_t v220;
  uint64_t v221;
  __int128 v222;
  char *v223;
  uint64_t v224;
  char *v225;
  uint64_t v226;
  char *v227;
  char *v228;
  char *v229;
  char *v230;
  char *v231;
  char *v232;
  uint64_t v233;
  char *v234;
  char *v235;
  uint64_t v236;
  char *v237;
  char *v238;
  char *v239;
  char *v240;
  char *v241;
  char *v242;
  char *v243;
  uint64_t v244;
  char *v245;
  uint64_t v246;
  char *v247;
  uint64_t v248;
  uint64_t v249;
  void (*v250)(char *, _QWORD, uint64_t);
  unsigned int v251;
  uint64_t v252;
  uint64_t v253;
  void (*v254)(char *, _QWORD, uint64_t, uint64_t);
  void (*v255)(char *, uint64_t, uint64_t);
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  void (*v261)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v262;
  uint64_t v263;

  v0 = sub_100007E00(&qword_10005D190);
  v1 = __chkstk_darwin(v0);
  v229 = (char *)v219 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __chkstk_darwin(v1);
  v242 = (char *)v219 - v4;
  v5 = __chkstk_darwin(v3);
  v225 = (char *)v219 - v6;
  v7 = __chkstk_darwin(v5);
  v223 = (char *)v219 - v8;
  v9 = __chkstk_darwin(v7);
  v233 = (uint64_t)v219 - v10;
  v11 = __chkstk_darwin(v9);
  v247 = (char *)v219 - v12;
  __chkstk_darwin(v11);
  v234 = (char *)v219 - v13;
  v14 = sub_100007E00(&qword_10005D630);
  v15 = __chkstk_darwin(v14);
  v228 = (char *)v219 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v243 = (char *)v219 - v18;
  v19 = __chkstk_darwin(v17);
  v240 = (char *)v219 - v20;
  v21 = __chkstk_darwin(v19);
  v237 = (char *)v219 - v22;
  v23 = __chkstk_darwin(v21);
  v231 = (char *)v219 - v24;
  v25 = __chkstk_darwin(v23);
  v245 = (char *)v219 - v26;
  __chkstk_darwin(v25);
  v28 = (char *)v219 - v27;
  v29 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v261 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 - 8);
  __chkstk_darwin(v29);
  v31 = (char *)v219 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = type metadata accessor for Locale(0);
  __chkstk_darwin(v32);
  v34 = (char *)v219 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v35);
  v37 = (char *)v219 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = type metadata accessor for LocalizedStringResource(0);
  v39 = *(_QWORD *)(v38 - 8);
  v40 = __chkstk_darwin(v38);
  v227 = (char *)v219 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __chkstk_darwin(v40);
  v241 = (char *)v219 - v43;
  v44 = __chkstk_darwin(v42);
  v239 = (char *)v219 - v45;
  v46 = __chkstk_darwin(v44);
  v238 = (char *)v219 - v47;
  v48 = __chkstk_darwin(v46);
  v235 = (char *)v219 - v49;
  v50 = __chkstk_darwin(v48);
  v232 = (char *)v219 - v51;
  v52 = __chkstk_darwin(v50);
  v230 = (char *)v219 - v53;
  v54 = __chkstk_darwin(v52);
  v244 = (uint64_t)v219 - v55;
  __chkstk_darwin(v54);
  v57 = (char *)v219 - v56;
  v58 = sub_100007E00(&qword_10005CF90);
  v253 = sub_100007E00(&qword_10005CF98);
  v59 = *(_QWORD *)(v253 - 8);
  v60 = *(_QWORD *)(v59 + 72);
  v61 = *(unsigned __int8 *)(v59 + 80);
  v62 = (v61 + 32) & ~v61;
  v256 = v60;
  v63 = swift_allocObject(v58, v62 + 9 * v60, v61 | 7);
  *(_OWORD *)(v63 + 16) = xmmword_1000484A0;
  v226 = v63;
  v262 = v63 + v62;
  *(_BYTE *)(v63 + v62) = 0;
  v64 = String.LocalizationValue.init(stringLiteral:)(0x74756E694D203531, 0xEA00000000007365);
  static Locale.current.getter(v64);
  v65 = (void (*)(_QWORD))*((_QWORD *)v261 + 13);
  v251 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v252 = v29;
  v66 = (void (*)(char *, _QWORD, uint64_t))v65;
  v65(v31);
  v224 = (uint64_t)v57;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_15Minutes", 42, 2, v37, 0, 0, v34, v31, "Display name for 15 minutes option for the Duration for New Events type", 71, 2);
  v67 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56);
  v236 = (uint64_t)v28;
  v263 = v38;
  v261 = v67;
  v67(v28, 1, 1, v38);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v68 = type metadata accessor for DisplayRepresentation.Image(0);
  v260 = sub_100007F0C(v68, (uint64_t)qword_10005DF80);
  v69 = *(_QWORD *)(v68 - 8);
  v255 = *(void (**)(char *, uint64_t, uint64_t))(v69 + 16);
  v70 = v234;
  v257 = v68;
  v255(v234, v260, v68);
  v254 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v69 + 56);
  v254(v70, 0, 1, v68);
  v259 = sub_100007E00(&qword_10005CC60);
  v71 = *(unsigned __int8 *)(v39 + 80);
  v248 = *(_QWORD *)(v39 + 72);
  v249 = ((v71 + 32) & ~v71) + v248;
  v246 = (v71 + 32) & ~v71;
  v258 = v71 | 7;
  v72 = swift_allocObject(v259, v249, v71 | 7);
  v222 = xmmword_1000484B0;
  *(_OWORD *)(v72 + 16) = xmmword_1000484B0;
  v73 = v253;
  v221 = v262 + *(int *)(v253 + 48);
  v74 = v262;
  v75 = String.LocalizationValue.init(stringLiteral:)(0x206E656574666946, 0xEF736574756E696DLL);
  static Locale.current.getter(v75);
  v76 = v252;
  v66(v31, v251, v252);
  v250 = v66;
  LOWORD(v185) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_15Minutes_Synonym_FifteenMinutes", 65, 2, v37, 0, 0, v34, v31, "Synonym (\"Fifteen minutes\") for 15 minutes option for the Duration for New Events type", 86, v185);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v224, v236, v70, v72);
  v77 = (_BYTE *)(v74 + v256);
  *v77 = 1;
  v236 = (uint64_t)&v77[*(int *)(v73 + 48)];
  v78 = String.LocalizationValue.init(stringLiteral:)(0x74756E694D203532, 0xEA00000000007365);
  static Locale.current.getter(v78);
  v79 = v251;
  v66(v31, v251, v76);
  LOWORD(v186) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_25Minutes", 42, 2, v37, 0, 0, v34, v31, "Display name for 25 minutes option for the Duration for New Events type", 71, v186);
  v80 = v245;
  v261(v245, 1, 1, v263);
  v81 = v247;
  v82 = v257;
  v255(v247, v260, v257);
  v83 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v254;
  v254(v81, 0, 1, v82);
  v84 = swift_allocObject(v259, v249, v258);
  *(_OWORD *)(v84 + 16) = v222;
  v85 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x800000010003D8F0);
  static Locale.current.getter(v85);
  v86 = v79;
  v87 = v252;
  v88 = v250;
  v250(v31, v86, v252);
  LOWORD(v187) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_25Minutes_Synonym_TwentyFiveMinutes", 68, 2, v37, 0, 0, v34, v31, "Synonym (\"Twenty five minutes\") for 25 minutes option for the Duration for New Events type", 90, v187);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v244, v80, v81, v84);
  v221 = 2 * v256;
  *(_QWORD *)&v222 = v262 + 2 * v256;
  *(_BYTE *)v222 = 2;
  v89 = String.LocalizationValue.init(stringLiteral:)(0x74756E694D203033, 0xEA00000000007365);
  static Locale.current.getter(v89);
  v90 = v251;
  v88(v31, v251, v87);
  LOWORD(v188) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_30Minutes", 42, 2, v37, 0, 0, v34, v31, "Display name for 30 minutes option for the Duration for New Events type", 71, v188);
  v261(v231, 1, 1, v263);
  v91 = v233;
  v92 = v257;
  v255((char *)v233, v260, v257);
  v83(v91, 0, 1, v92);
  v244 = 3 * v248;
  v236 = 2 * v248;
  v224 = 6 * v248;
  v93 = v246;
  v94 = swift_allocObject(v259, v246 + 6 * v248, v258);
  v220 = v94;
  *(_OWORD *)(v94 + 16) = xmmword_1000484C0;
  v95 = v94 + v93;
  v96 = String.LocalizationValue.init(stringLiteral:)(0x6D20797472696854, 0xEE00736574756E69);
  static Locale.current.getter(v96);
  v97 = v252;
  v98 = v250;
  v250(v31, v90, v252);
  LOWORD(v189) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_30Minutes_Synonym_ThirtyMinutes", 64, 2, v37, 0, 0, v34, v31, "Synonym (\"Thirty minutes\") for 30 minutes option for the Duration for New Events type", 85, v189);
  v99 = String.LocalizationValue.init(stringLiteral:)(0x206E6120666C6148, 0xEC00000072756F68);
  static Locale.current.getter(v99);
  v98(v31, v90, v97);
  LOWORD(v190) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_30Minutes_Synonym_HalfAnHour", 61, 2, v37, 0, 0, v34, v31, "Synonym (\"Half an hour\") for 30 minutes option for the Duration for New Events type", 83, v190);
  v100 = String.LocalizationValue.init(stringLiteral:)(0x6820666C61682041, 0xEB0000000072756FLL);
  static Locale.current.getter(v100);
  v98(v31, v90, v97);
  v101 = v98;
  LOWORD(v191) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_30Minutes_Synonym_AHalfHour", 60, 2, v37, 0, 0, v34, v31, "Synonym (\"A half hour\") for 30 minutes option for the Duration for New Events type", 82, v191);
  v219[1] = v95;
  v102 = String.LocalizationValue.init(stringLiteral:)(0x756F6820666C6148, 0xE900000000000072);
  static Locale.current.getter(v102);
  v103 = v90;
  v101(v31, v90, v97);
  LOWORD(v192) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_30Minutes_Synonym_HalfHour", 59, 2, v37, 0, 0, v34, v31, "Synonym (\"Half hour\") for 30 minutes option for the Duration for New Events type", 80, v192);
  v104 = v248;
  v234 = (char *)(4 * v248);
  v105 = String.LocalizationValue.init(stringLiteral:)(0x72756F6820322F31, 0xE800000000000000);
  static Locale.current.getter(v105);
  v106 = v103;
  v101(v31, v103, v97);
  LOWORD(v193) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_30Minutes_Synonym_1/2Hour", 58, 2, v37, 0, 0, v34, v31, "Synonym (\"1/2 hour\") for 30 minutes option for the Duration for New Events type", 79, v193);
  v107 = v253;
  *(_QWORD *)&v222 = 5 * v104;
  v108 = String.LocalizationValue.init(stringLiteral:)(0x72756F6820352E31, 0xE900000000000073);
  static Locale.current.getter(v108);
  v101(v31, v106, v97);
  LOWORD(v194) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_30Minutes_Synonym_1.5Hours", 59, 2, v37, 0, 0, v34, v31, "Synonym (\"1.5 hours\") for 30 minutes option for the Duration for New Events type", 80, v194);
  v109 = nullsub_1(v220);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v230, v231, v233, v109);
  v110 = (_BYTE *)(v262 + v221 + v256);
  *v110 = 3;
  v233 = (uint64_t)&v110[*(int *)(v107 + 48)];
  v111 = String.LocalizationValue.init(stringLiteral:)(0x74756E694D203534, 0xEA00000000007365);
  static Locale.current.getter(v111);
  v101(v31, v106, v97);
  LOWORD(v195) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_45Minutes", 42, 2, v37, 0, 0, v34, v31, "Display name for 45 minutes option for the Duration for New Events type", 71, v195);
  v112 = v245;
  v261(v245, 1, 1, v263);
  v113 = v247;
  v114 = v257;
  v255(v247, v260, v257);
  v254(v113, 0, 1, v114);
  v115 = swift_allocObject(v259, v249, v258);
  v116 = sub_100037294(v115, 1);
  v117 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000012, 0x800000010003DE80);
  static Locale.current.getter(v117);
  v118 = v251;
  v119 = v252;
  v120 = v250;
  v250(v31, v251, v252);
  LOWORD(v196) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_45Minutes_Synonym_FortyFiveMinutes", 67, 2, v37, 0, 0, v34, v31, "Synonym (\"Forty five minutes\") for 45 minutes option for the Duration for New Events type", 89, v196);
  v121 = nullsub_1(v116);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v232, v112, v113, v121);
  v233 = 4 * v256;
  *(_BYTE *)(v262 + 4 * v256) = 4;
  v122 = String.LocalizationValue.init(stringLiteral:)(0x74756E694D203035, 0xEA00000000007365);
  static Locale.current.getter(v122);
  v123 = v118;
  v124 = v118;
  v125 = v119;
  v120(v31, v123, v119);
  LOWORD(v197) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_50Minutes", 42, 2, v37, 0, 0, v34, v31, "Display name for 50 minutes option for the Duration for New Events type", 71, v197);
  v261(v237, 1, 1, v263);
  v126 = v223;
  v127 = v257;
  v255(v223, v260, v257);
  v254(v126, 0, 1, v127);
  v128 = swift_allocObject(v259, v249, v258);
  v129 = sub_100037294(v128, 1);
  v130 = v253;
  v131 = String.LocalizationValue.init(stringLiteral:)(0x696D207974666946, 0xED0000736574756ELL);
  static Locale.current.getter(v131);
  v132 = v125;
  v133 = v250;
  v250(v31, v124, v132);
  LOWORD(v198) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_50Minutes_Synonym_FiftyMinutes", 63, 2, v37, 0, 0, v34, v31, "Synonym (\"Fifty minutes\") for 50 minutes option for the Duration for New Events type", 84, v198);
  v134 = nullsub_1(v129);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v235, v237, v126, v134);
  v135 = (_BYTE *)(v262 + v233 + v256);
  *v135 = 5;
  v237 = &v135[*(int *)(v130 + 48)];
  v136 = String.LocalizationValue.init(stringLiteral:)(0x74756E694D203535, 0xEA00000000007365);
  static Locale.current.getter(v136);
  v137 = v252;
  v133(v31, v124, v252);
  LOWORD(v199) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_55Minutes", 42, 2, v37, 0, 0, v34, v31, "Display name for 55 minutes option for the Duration for New Events type", 71, v199);
  v138 = v245;
  v261(v245, 1, 1, v263);
  v139 = v247;
  v140 = v257;
  v141 = v255;
  v255(v247, v260, v257);
  v254(v139, 0, 1, v140);
  v142 = swift_allocObject(v259, v249, v258);
  v143 = sub_100037294(v142, 1);
  v144 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000012, 0x800000010003E0F0);
  static Locale.current.getter(v144);
  v145 = v251;
  v146 = v250;
  v250(v31, v251, v137);
  LOWORD(v200) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_55Minutes_Synonym_FiftyFiveMinutes", 67, 2, v37, 0, 0, v34, v31, "Synonym (\"Fifty five minutes\") for 55 minutes option for the Duration for New Events type", 89, v200);
  v147 = nullsub_1(v143);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v238, v138, v247, v147);
  v247 = (char *)(v262 + 6 * v256);
  *v247 = 6;
  v148 = String.LocalizationValue.init(stringLiteral:)(0x72756F482031, 0xE600000000000000);
  static Locale.current.getter(v148);
  v146(v31, v145, v137);
  LOWORD(v201) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_1Hour", 38, 2, v37, 0, 0, v34, v31, "Display name for 1 hour option for the Duration for New Events type", 67, v201);
  v261(v240, 1, 1, v263);
  v149 = v225;
  v150 = v257;
  v141(v225, v260, v257);
  v254(v149, 0, 1, v150);
  v151 = swift_allocObject(v259, &v234[v246], v258);
  v245 = (char *)sub_100037294(v151, 4);
  v152 = String.LocalizationValue.init(stringLiteral:)(0x72756F6820656E4FLL, 0xE800000000000000);
  static Locale.current.getter(v152);
  v146(v31, v145, v137);
  LOWORD(v202) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_1Hour_Synonym_OneHour", 54, 2, v37, 0, 0, v34, v31, "Synonym (\"One hour\") for 1 hour option for the Duration for New Events type", 75, v202);
  v153 = String.LocalizationValue.init(stringLiteral:)(0x72756F68206E41, 0xE700000000000000);
  static Locale.current.getter(v153);
  v146(v31, v145, v137);
  LOWORD(v203) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_1Hour_Synonym_AnHour", 53, 2, v37, 0, 0, v34, v31, "Synonym (\"An hour\") for 1 hour option for the Duration for New Events type", 74, v203);
  v154 = String.LocalizationValue.init(stringLiteral:)(0x74756E696D203036, 0xEA00000000007365);
  static Locale.current.getter(v154);
  v146(v31, v145, v137);
  LOWORD(v204) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_1Hour_Synonym_60Minutes", 56, 2, v37, 0, 0, v34, v31, "Synonym (\"60 minutes\") for 1 hour option for the Duration for New Events type", 77, v204);
  v155 = String.LocalizationValue.init(stringLiteral:)(0x696D207974786953, 0xED0000736574756ELL);
  static Locale.current.getter(v155);
  v146(v31, v145, v137);
  LOWORD(v205) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_1Hour_Synonym_SixtyMinutes", 59, 2, v37, 0, 0, v34, v31, "Synonym (\"Sixty minutes\") for 1 hour option for the Duration for New Events type", 80, v205);
  v156 = nullsub_1(v245);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v239, v240, v149, v156);
  v247 = (char *)(8 * v256);
  v256 = v262 + 7 * v256;
  *(_BYTE *)v256 = 7;
  v157 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x800000010003E470);
  static Locale.current.getter(v157);
  v146(v31, v145, v137);
  LOWORD(v206) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_1Hour30Minutes", 47, 2, v37, 0, 0, v34, v31, "Display name for 1 hour 30 minutes option for the Duration for New Events type", 78, v206);
  v261(v243, 1, 1, v263);
  v158 = v242;
  v159 = v257;
  v255(v242, v260, v257);
  v254(v158, 0, 1, v159);
  v160 = swift_allocObject(v259, v246 + 10 * v248, v258);
  v246 = sub_100037294(v160, 10);
  v161 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000017, 0x800000010003E530);
  static Locale.current.getter(v161);
  v162 = v250;
  v250(v31, v145, v137);
  LOWORD(v207) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_1Hour30Minutes_Synonym_OneHourThirtyMinutes", 76, 2, v37, 0, 0, v34, v31, "Synonym (\"One hour thirty minutes\") for 1 hour 30 minutes option for the Duration for New Events type", 101, v207);
  v163 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000001BLL, 0x800000010003E610);
  static Locale.current.getter(v163);
  v162(v31, v145, v137);
  LOWORD(v208) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_1Hour30Minutes_Synonym_OneHourAndThirtyMinutes", 79, 2, v37, 0, 0, v34, v31, "Synonym (\"One hour and thirty minutes\") for 1 hour 30 minutes option for the Duration for New Events type", 105, v208);
  v164 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000015, 0x800000010003E6F0);
  static Locale.current.getter(v164);
  v162(v31, v145, v137);
  LOWORD(v209) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_1Hour30Minutes_Synonym_1HourAnd30Minutes", 73, 2, v37, 0, 0, v34, v31, "Synonym (\"1 hour and 30 minutes\") for 1 hour 30 minutes option for the Duration for New Events type", 99, v209);
  v165 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x800000010003E7D0);
  static Locale.current.getter(v165);
  v162(v31, v145, v137);
  LOWORD(v210) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_1Hour30Minutes_Synonym_OneAndOneHalfHours", 74, 2, v37, 0, 0, v34, v31, "Synonym (\"One and one half hours\") for 1 hour 30 minutes option for the Duration for New Events type", 100, v210);
  v166 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000014, 0x800000010003E8B0);
  static Locale.current.getter(v166);
  v162(v31, v145, v137);
  LOWORD(v211) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_1Hour30Minutes_Synonym_OneAndAHalfHours", 72, 2, v37, 0, 0, v34, v31, "Synonym (\"One and a half hours\") for 1 hour 30 minutes option for the Duration for New Events type", 98, v211);
  v167 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000012, 0x800000010003E990);
  static Locale.current.getter(v167);
  v162(v31, v145, v137);
  LOWORD(v212) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_1Hour30Minutes_Synonym_1And1HalfHours", 70, 2, v37, 0, 0, v34, v31, "Synonym (\"1 and 1 half hours\") for 1 hour 30 minutes option for the Duration for New Events type", 96, v212);
  v168 = String.LocalizationValue.init(stringLiteral:)(0x2F3120646E612031, 0xEF7372756F682032);
  static Locale.current.getter(v168);
  v162(v31, v145, v137);
  LOWORD(v213) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_1Hour30Minutes_Synonym_1And1/2Hours", 68, 2, v37, 0, 0, v34, v31, "Synonym (\"1 and 1/2 hours\") for 1 hour 30 minutes option for the Duration for New Events type", 93, v213);
  v169 = String.LocalizationValue.init(stringLiteral:)(0x72756F6820352E31, 0xE900000000000073);
  static Locale.current.getter(v169);
  v162(v31, v145, v137);
  LOWORD(v214) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_1Hour30Minutes_Synonym_1.5Hours", 64, 2, v37, 0, 0, v34, v31, "Synonym (\"1.5 hours\") for 1 hour 30 minutes option for the Duration for New Events type", 87, v214);
  v170 = String.LocalizationValue.init(stringLiteral:)(0x74756E696D203039, 0xEA00000000007365);
  static Locale.current.getter(v170);
  v162(v31, v145, v137);
  LOWORD(v215) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_1Hour30Minutes_Synonym_90Minutes", 65, 2, v37, 0, 0, v34, v31, "Synonym (\"90 minutes\") for 1 hour 30 minutes option for the Duration for New Events type", 88, v215);
  v171 = String.LocalizationValue.init(stringLiteral:)(0x6D207974656E694ELL, 0xEE00736574756E69);
  static Locale.current.getter(v171);
  v162(v31, v145, v137);
  LOWORD(v216) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_1Hour30Minutes_Synonym_NinetyMinutes", 69, 2, v37, 0, 0, v34, v31, "Synonym (\"Ninety minutes\") for 1 hour 30 minutes option for the Duration for New Events type", 92, v216);
  v172 = nullsub_1(v246);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v241, v243, v242, v172);
  v247[v262] = 8;
  v173 = String.LocalizationValue.init(stringLiteral:)(0x7372756F482032, 0xE700000000000000);
  static Locale.current.getter(v173);
  v162(v31, v145, v137);
  v174 = v162;
  LOWORD(v217) = 2;
  v175 = v227;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_2Hours", 39, 2, v37, 0, 0, v34, v31, "Display name for 2 hours option for the Duration for New Events type", 68, v217);
  v176 = v228;
  v261(v228, 1, 1, v263);
  v177 = v229;
  v178 = v257;
  v255(v229, v260, v257);
  v254(v177, 0, 1, v178);
  v179 = swift_allocObject(v259, v249, v258);
  v180 = sub_100037294(v179, 1);
  v181 = String.LocalizationValue.init(stringLiteral:)(0x72756F68206F7754, 0xE900000000000073);
  static Locale.current.getter(v181);
  v174(v31, v251, v252);
  LOWORD(v218) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsType_2Hours_Synonym_TwoHours", 56, 2, v37, 0, 0, v34, v31, "Synonym (\"Two hours\") for 2 hours option for the Duration for New Events type", 77, v218);
  v182 = nullsub_1(v180);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v175, v176, v177, v182);
  v183 = nullsub_1(v226);
  result = sub_1000329F0(v183);
  qword_10005DE60 = result;
  return result;
}

uint64_t sub_1000156F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v20[24];

  v4 = sub_100007E00(&qword_10005CC78);
  __chkstk_darwin(v4);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = type metadata accessor for LocalizedStringResource(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (qword_10005C4E8 != -1)
    swift_once(&qword_10005C4E8, sub_10001365C);
  swift_beginAccess(&qword_10005DE60, v20, 32, 0);
  v11 = qword_10005DE60;
  if (*(_QWORD *)(qword_10005DE60 + 16) && (v12 = sub_1000373BC(a1), (v13 & 1) != 0))
  {
    v14 = v12;
    v15 = *(_QWORD *)(v11 + 56);
    v16 = type metadata accessor for DisplayRepresentation(0);
    v17 = *(_QWORD *)(v16 - 8);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v17 + 16))(v6, v15 + *(_QWORD *)(v17 + 72) * v14, v16);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v6, 0, 1, v16);
  }
  else
  {
    v16 = type metadata accessor for DisplayRepresentation(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  type metadata accessor for DisplayRepresentation(0);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v6, 1, v16))
  {
    sub_100010A58((uint64_t)v6);
    swift_endAccess(v20);
    return LocalizedStringResource.init(stringLiteral:)(0, 0xE000000000000000);
  }
  else
  {
    DisplayRepresentation.title.getter();
    sub_100010A58((uint64_t)v6);
    swift_endAccess(v20);
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v8 + 32))(a2, v10, v7);
  }
}

void sub_1000158EC(char *a1)
{
  sub_100032CA0(*a1);
}

unint64_t sub_1000158FC()
{
  unint64_t result;

  result = qword_10005CDE0;
  if (!qword_10005CDE0)
  {
    result = swift_getWitnessTable(&unk_100047B28, &type metadata for SettingsDurationForNewEventsType);
    atomic_store(result, (unint64_t *)&qword_10005CDE0);
  }
  return result;
}

Swift::Int sub_100015940()
{
  char *v0;
  char v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  sub_10003337C((uint64_t)v3, v1);
  return Hasher._finalize()();
}

void sub_100015984(uint64_t a1)
{
  char *v1;

  sub_10003337C(a1, *v1);
}

Swift::Int sub_10001598C(uint64_t a1)
{
  char *v1;
  char v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  sub_10003337C((uint64_t)v4, v2);
  return Hasher._finalize()();
}

unint64_t sub_1000159CC@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_100017AE0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000159F8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_100013334(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100015A24()
{
  unint64_t result;

  result = qword_10005CDE8;
  if (!qword_10005CDE8)
  {
    result = swift_getWitnessTable(&unk_100047C40, &type metadata for SettingsDurationForNewEventsType);
    atomic_store(result, (unint64_t *)&qword_10005CDE8);
  }
  return result;
}

unint64_t sub_100015A6C()
{
  unint64_t result;

  result = qword_10005CDF0;
  if (!qword_10005CDF0)
  {
    result = swift_getWitnessTable(&unk_100047C78, &type metadata for SettingsDurationForNewEventsType);
    atomic_store(result, (unint64_t *)&qword_10005CDF0);
  }
  return result;
}

unint64_t sub_100015AB4()
{
  unint64_t result;

  result = qword_10005CDF8;
  if (!qword_10005CDF8)
  {
    result = swift_getWitnessTable(&unk_100047B90, &type metadata for SettingsDurationForNewEventsType);
    atomic_store(result, (unint64_t *)&qword_10005CDF8);
  }
  return result;
}

uint64_t sub_100015AF8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_100013220(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100015B24()
{
  unint64_t result;

  result = qword_10005CE00;
  if (!qword_10005CE00)
  {
    result = swift_getWitnessTable(&unk_100047CA8, &type metadata for SettingsDurationForNewEventsType);
    atomic_store(result, (unint64_t *)&qword_10005CE00);
  }
  return result;
}

unint64_t sub_100015B6C()
{
  unint64_t result;

  result = qword_10005CE08;
  if (!qword_10005CE08)
  {
    result = swift_getWitnessTable(&unk_100047CD0, &type metadata for SettingsDurationForNewEventsType);
    atomic_store(result, (unint64_t *)&qword_10005CE08);
  }
  return result;
}

unint64_t sub_100015BB4()
{
  unint64_t result;

  result = qword_10005CE10;
  if (!qword_10005CE10)
  {
    result = swift_getWitnessTable(&unk_100047CF8, &type metadata for SettingsDurationForNewEventsType);
    atomic_store(result, (unint64_t *)&qword_10005CE10);
  }
  return result;
}

unint64_t sub_100015BFC()
{
  unint64_t result;

  result = qword_10005CE18;
  if (!qword_10005CE18)
  {
    result = swift_getWitnessTable(&unk_100047D50, &type metadata for SettingsDurationForNewEventsType);
    atomic_store(result, (unint64_t *)&qword_10005CE18);
  }
  return result;
}

uint64_t sub_100015C40@<X0>(uint64_t a1@<X8>)
{
  return sub_10000773C(&qword_10005C4E0, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005DE48, (uint64_t)sub_100013448, a1);
}

uint64_t sub_100015C64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076D8(a1, a2, a3, (uint64_t (*)(void))sub_100015C78, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

unint64_t sub_100015C78()
{
  unint64_t result;

  result = qword_10005CE20;
  if (!qword_10005CE20)
  {
    result = swift_getWitnessTable(&unk_100047BC8, &type metadata for SettingsDurationForNewEventsType);
    atomic_store(result, (unint64_t *)&qword_10005CE20);
  }
  return result;
}

uint64_t sub_100015CBC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100015C78();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100015CF8()
{
  unint64_t result;

  result = qword_10005CE28;
  if (!qword_10005CE28)
  {
    result = swift_getWitnessTable(&unk_100047D90, &type metadata for SettingsDurationForNewEventsType);
    atomic_store(result, (unint64_t *)&qword_10005CE28);
  }
  return result;
}

unint64_t sub_100015D40()
{
  unint64_t result;

  result = qword_10005CE30;
  if (!qword_10005CE30)
  {
    result = swift_getWitnessTable(&unk_100047DB8, &type metadata for SettingsDurationForNewEventsType);
    atomic_store(result, (unint64_t *)&qword_10005CE30);
  }
  return result;
}

unint64_t sub_100015D88()
{
  unint64_t result;

  result = qword_10005CE38;
  if (!qword_10005CE38)
  {
    result = swift_getWitnessTable(&unk_100047B50, &type metadata for SettingsDurationForNewEventsType);
    atomic_store(result, (unint64_t *)&qword_10005CE38);
  }
  return result;
}

uint64_t sub_100015DCC()
{
  _BYTE v1[24];

  if (qword_10005C4E8 != -1)
    swift_once(&qword_10005C4E8, sub_10001365C);
  swift_beginAccess(&qword_10005DE60, v1, 0, 0);
  return swift_bridgeObjectRetain(qword_10005DE60);
}

uint64_t sub_100015E38(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100015BFC();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100015E70()
{
  return sub_10000A9CC(&qword_10005CE40, &qword_10005CE48, (uint64_t)&protocol conformance descriptor for [A]);
}

void sub_100015E9C(_QWORD *a1@<X8>)
{
  *a1 = &off_100054CF8;
}

unint64_t sub_100015EB0()
{
  unint64_t result;

  result = qword_10005CE50;
  if (!qword_10005CE50)
  {
    result = swift_getWitnessTable(&unk_100047E50, &type metadata for SettingsDurationForNewEventsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CE50);
  }
  return result;
}

unint64_t sub_100015EF8()
{
  unint64_t result;

  result = qword_10005CE58;
  if (!qword_10005CE58)
  {
    result = swift_getWitnessTable(&unk_10004818C, &type metadata for SettingsDurationForNewEventsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CE58);
  }
  return result;
}

uint64_t sub_100015F3C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100015F54, 0, 0);
}

void sub_100015F54()
{
  uint64_t v0;
  id v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  _BYTE *v6;

  v1 = objc_msgSend((id)objc_opt_self(CalFoundationPreferences), "shared");
  if (!v1)
    goto LABEL_9;
  v2 = v1;
  objc_msgSend(v1, "defaultEventDuration");
  v4 = v3;

  v5 = v4 / 60.0;
  if ((~COERCE__INT64(v4 / 60.0) & 0x7FF0000000000000) != 0)
  {
    if (v5 > -9.22337204e18)
    {
      if (v5 < 9.22337204e18)
      {
        v6 = *(_BYTE **)(v0 + 16);
        *v6 = sub_100017A70((uint64_t)v5);
        (*(void (**)(void))(v0 + 8))();
        return;
      }
      goto LABEL_8;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_8:
  __break(1u);
LABEL_9:
  __break(1u);
}

uint64_t sub_10001601C(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_100016038, 0, 0);
}

id sub_100016038()
{
  uint64_t v0;
  double v1;
  id result;
  void *v3;

  v1 = dbl_100048450[*(char *)(v0 + 16)];
  result = objc_msgSend((id)objc_opt_self(CalFoundationPreferences), "shared");
  if (result)
  {
    v3 = result;
    objc_msgSend(result, "setDefaultEventDuration:", v1);

    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000160B4()
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
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  __int16 v19;
  _BYTE v20[16];

  v0 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v0);
  v2 = &v20[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v10);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v20[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000017, 0x800000010003A880);
  static Locale.current.getter(v17);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  v19 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsEntityName", 38, 2, v12, 0, 0, v9, v6, "Name of the SettingsDurationForNewEventsEntity type", 51, v19);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v2, 1, 1, v13);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v16, v2);
}

uint64_t sub_1000162C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v32 = a1;
  v1 = sub_100007E00(&qword_10005D190);
  __chkstk_darwin(v1);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v4);
  v31 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Locale(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for LocalizedStringResource(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v30 - v21;
  v23 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000017, 0x800000010003A880);
  static Locale.current.getter(v23);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsEntityName", 38, 2, v15, 0, 0, v12, v9, "Name of the SettingsDurationForNewEventsEntity type", 51, 2);
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v25 = v31;
  v24(v31, 1, 1, v16);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v26 = type metadata accessor for DisplayRepresentation.Image(0);
  v27 = sub_100007F0C(v26, (uint64_t)qword_10005DF80);
  v28 = *(_QWORD *)(v26 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v3, v27, v26);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v3, 0, 1, v26);
  LocalizedStringResource.init(stringLiteral:)(0xD0000000000001CELL, 0x800000010003D4F0);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v22, v25, v3, &_swiftEmptyArrayStorage, v20);
}

uint64_t sub_1000165CC()
{
  uint64_t v0;

  v0 = qword_10005CDD0;
  swift_bridgeObjectRetain(off_10005CDD8);
  return v0;
}

unint64_t sub_100016604()
{
  unint64_t result;

  result = qword_10005CE60;
  if (!qword_10005CE60)
  {
    result = swift_getWitnessTable(&unk_100047EA8, &type metadata for SettingsDurationForNewEventsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CE60);
  }
  return result;
}

unint64_t sub_10001664C()
{
  unint64_t result;

  result = qword_10005CE68;
  if (!qword_10005CE68)
  {
    result = swift_getWitnessTable(&unk_100047EE0, &type metadata for SettingsDurationForNewEventsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CE68);
  }
  return result;
}

unint64_t sub_100016694()
{
  unint64_t result;

  result = qword_10005CE70;
  if (!qword_10005CE70)
  {
    result = swift_getWitnessTable(&unk_100047F10, &type metadata for SettingsDurationForNewEventsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CE70);
  }
  return result;
}

unint64_t sub_1000166DC()
{
  unint64_t result;

  result = qword_10005CE78;
  if (!qword_10005CE78)
  {
    result = swift_getWitnessTable(&unk_100048204, &type metadata for SettingsDurationForNewEventsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CE78);
  }
  return result;
}

unint64_t sub_100016724()
{
  unint64_t result;

  result = qword_10005CE80;
  if (!qword_10005CE80)
  {
    result = swift_getWitnessTable(&unk_100047F48, &type metadata for SettingsDurationForNewEventsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CE80);
  }
  return result;
}

unint64_t sub_10001676C()
{
  unint64_t result;

  result = qword_10005CE88;
  if (!qword_10005CE88)
  {
    result = swift_getWitnessTable(&unk_100047F70, &type metadata for SettingsDurationForNewEventsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CE88);
  }
  return result;
}

unint64_t sub_1000167B4()
{
  unint64_t result;

  result = qword_10005CE90;
  if (!qword_10005CE90)
  {
    result = swift_getWitnessTable(&unk_100047F98, &type metadata for SettingsDurationForNewEventsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CE90);
  }
  return result;
}

unint64_t sub_1000167FC()
{
  unint64_t result;

  result = qword_10005CE98;
  if (!qword_10005CE98)
  {
    result = swift_getWitnessTable(&unk_100047FF0, &type metadata for SettingsDurationForNewEventsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CE98);
  }
  return result;
}

void sub_100016840(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000024;
  a1[1] = 0x800000010003D6C0;
}

uint64_t sub_100016864()
{
  return sub_10000A9CC(&qword_10005CEA0, &qword_10005CEA8, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100016890(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100015EB0();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000168CC()
{
  unint64_t result;

  result = qword_10005CEB0;
  if (!qword_10005CEB0)
  {
    result = swift_getWitnessTable(&unk_100048020, &type metadata for SettingsDurationForNewEventsEntity);
    atomic_store(result, (unint64_t *)&qword_10005CEB0);
  }
  return result;
}

uint64_t sub_100016914(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000167FC();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100016950()
{
  unint64_t result;

  result = qword_10005CEB8;
  if (!qword_10005CEB8)
  {
    result = swift_getWitnessTable(&unk_1000480B8, &type metadata for UpdateIntent_durationForNewEvents);
    atomic_store(result, (unint64_t *)&qword_10005CEB8);
  }
  return result;
}

uint64_t sub_100016994()
{
  return sub_10000A9CC(&qword_10005CEC0, &qword_10005CEC8, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_1000169C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v13;
  _BYTE v14[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_100007F24(v10, qword_10005DE68);
  sub_100007F0C(v10, (uint64_t)qword_10005DE68);
  v11 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000001ELL, 0x800000010003D480);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  v13 = 2;
  return LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("UpdateSettingsDurationForNewEventsIntent_title", 46, 2, v9, 0, 0, v6, v3, "Display string for the title of the UpdateSettingsDurationForNewEventsIntent", 76, v13);
}

uint64_t sub_100016B54()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_1000483B8);
  qword_10005DE80 = result;
  return result;
}

uint64_t sub_100016B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  v4 = type metadata accessor for MainActor(0);
  v3[7] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v3[8] = v5;
  v3[9] = v6;
  return swift_task_switch(sub_100016BE8, v5, v6);
}

uint64_t sub_100016BE8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = v0[2];
  v0[3] = v1;
  v0[10] = v1;
  IntentParameter.wrappedValue.getter(v0 + 14);
  if (qword_10005C4F8 != -1)
    swift_once(&qword_10005C4F8, sub_100016B54);
  v2 = qword_10005DE80;
  v0[11] = qword_10005DE80;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  v0[12] = v4;
  v5 = sub_10000A9CC(&qword_10005CF78, &qword_10005CF80, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_100008D04;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 14, v2, &type metadata for SettingsDurationForNewEventsType, v5);
}

uint64_t sub_100016CDC()
{
  if (qword_10005C4F8 != -1)
    swift_once(&qword_10005C4F8, sub_100016B54);
  return swift_retain(qword_10005DE80);
}

unint64_t sub_100016D20()
{
  unint64_t result;

  result = qword_10005CED0;
  if (!qword_10005CED0)
  {
    result = swift_getWitnessTable(&unk_100048148, &type metadata for UpdateIntent_durationForNewEvents);
    atomic_store(result, (unint64_t *)&qword_10005CED0);
  }
  return result;
}

unint64_t sub_100016D68()
{
  unint64_t result;

  result = qword_10005CED8;
  if (!qword_10005CED8)
  {
    result = swift_getWitnessTable(&unk_100048170, &type metadata for UpdateIntent_durationForNewEvents);
    atomic_store(result, (unint64_t *)&qword_10005CED8);
  }
  return result;
}

uint64_t sub_100016DAC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000501F8, 1);
}

uint64_t sub_100016DBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076D8(a1, a2, a3, (uint64_t (*)(void))sub_100016950, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t sub_100016DD0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000773C(&qword_10005C4F0, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005DE68, (uint64_t)sub_1000169C0, a1);
}

uint64_t sub_100016DF4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005CF8C);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_100009170;
  return sub_100016B78(a1, v5, v4);
}

uint64_t sub_100016E58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100017B28();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100016E7C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100016950();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100016EA8()
{
  unint64_t result;

  result = qword_10005CEE8;
  if (!qword_10005CEE8)
  {
    result = swift_getWitnessTable(&unk_1000481CC, &type metadata for SettingsDurationForNewEventsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CEE8);
  }
  return result;
}

unint64_t sub_100016EF0()
{
  unint64_t result;

  result = qword_10005CEF0[0];
  if (!qword_10005CEF0[0])
  {
    result = swift_getWitnessTable(&unk_100047DF0, &type metadata for SettingsDurationForNewEventsEntity);
    atomic_store(result, qword_10005CEF0);
  }
  return result;
}

uint64_t sub_100016F34(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005CF60 + dword_10005CF60);
  v2 = (_QWORD *)swift_task_alloc(unk_10005CF64);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000AB54;
  return v4();
}

uint64_t sub_100016F90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100015EF8();
  *v4 = v2;
  v4[1] = sub_100009358;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100016FFC()
{
  unint64_t result;

  result = qword_10005CF08;
  if (!qword_10005CF08)
  {
    result = swift_getWitnessTable(&unk_10004825C, &type metadata for SettingsDurationForNewEventsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CF08);
  }
  return result;
}

unint64_t sub_100017044()
{
  unint64_t result;

  result = qword_10005CF10[0];
  if (!qword_10005CF10[0])
  {
    result = swift_getWitnessTable(&unk_1000482BC, &type metadata for SettingsDurationForNewEventsEntityQuery);
    atomic_store(result, qword_10005CF10);
  }
  return result;
}

uint64_t sub_100017088(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100015EF8();
  *v5 = v2;
  v5[1] = sub_1000094B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000170F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100015EF8();
  *v4 = v2;
  v4[1] = sub_10000AB54;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100017160()
{
  unint64_t result;

  result = qword_10005CF28;
  if (!qword_10005CF28)
  {
    result = swift_getWitnessTable(&unk_1000482E4, &type metadata for SettingsDurationForNewEventsEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005CF28);
  }
  return result;
}

unint64_t sub_1000171A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005CF30;
  if (!qword_10005CF30)
  {
    v1 = sub_100007220(qword_10005CF38);
    sub_1000167B4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005CF30);
  }
  return result;
}

uint64_t sub_10001720C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_1000166DC();
  *v5 = v2;
  v5[1] = sub_10000AB50;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_durationForNewEvents()
{
  return &type metadata for UpdateIntent_durationForNewEvents;
}

ValueMetadata *type metadata accessor for SettingsDurationForNewEventsEntityQuery()
{
  return &type metadata for SettingsDurationForNewEventsEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsDurationForNewEventsEntity()
{
  return &type metadata for SettingsDurationForNewEventsEntity;
}

uint64_t getEnumTagSinglePayload for SettingsDurationForNewEventsType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SettingsDurationForNewEventsType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100017384 + 4 * byte_100047AD7[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_1000173B8 + 4 * byte_100047AD2[v4]))();
}

uint64_t sub_1000173B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000173C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000173C8);
  return result;
}

uint64_t sub_1000173D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000173DCLL);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_1000173E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000173E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SettingsDurationForNewEventsType()
{
  return &type metadata for SettingsDurationForNewEventsType;
}

uint64_t sub_100017404@<X0>(uint64_t a1@<X8>)
{
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
  id v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t KeyPath;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t OpaqueTypeConformance2;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  Swift::String v45;

  v42 = a1;
  v1 = type metadata accessor for ControlSize(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00((uint64_t *)&unk_10005D1B0);
  v37 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007E00(&qword_10005CC68);
  v8 = *(_QWORD *)(v7 - 8);
  v38 = v7;
  v39 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100007E00(&qword_10005D1C0);
  v12 = *(_QWORD *)(v11 - 8);
  v40 = v11;
  v41 = v12;
  __chkstk_darwin(v11);
  v36 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v15._countAndFlagsBits = 0xD000000000000017;
  v45._countAndFlagsBits = 0xD000000000000033;
  v45._object = (void *)0x800000010003D410;
  v15._object = (void *)0x800000010003A880;
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  v17 = NSLocalizedString(_:tableName:bundle:value:comment:)(v15, (Swift::String_optional)0, (NSBundle)v14, v16, v45);

  KeyPath = swift_getKeyPath(&unk_1000483B8);
  static ControlSize._1x1.getter();
  v19 = sub_100015C78();
  v20 = sub_100018328();
  v21 = sub_100016EF0();
  ControlPicker.init<A, B, C, D, E, F, G>(kind:displayName:preferredSize:intentUpdatableProperty:title:value:affordances:)(0xD000000000000027, 0x800000010003EE20, v17._countAndFlagsBits, v17._object, v3, KeyPath, sub_100017780, 0, sub_100017938, 0, sub_1000179BC, 0, &type metadata for Text, &type metadata for Text, v19, v20, v21, &protocol witness table for Text, &protocol witness table for Text);
  v22 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000014, 0x800000010003EE50);
  v24 = v23;
  LOBYTE(v20) = v25;
  v27 = v26;
  v28 = sub_10000A9CC(&qword_10005D1D0, (uint64_t *)&unk_10005D1B0, (uint64_t)&protocol conformance descriptor for ControlPicker<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v22, v24, v20 & 1, v27, v4, v28);
  swift_bridgeObjectRelease(v27);
  swift_bridgeObjectRelease(v24);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v6, v4);
  v43 = v4;
  v44 = v28;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v43, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v30 = v36;
  v31 = v38;
  WidgetConfiguration.disablesControlStateCaching()(v38, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v31);
  v43 = v31;
  v44 = OpaqueTypeConformance2;
  v32 = swift_getOpaqueTypeConformance2(&v43, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v33 = v40;
  WidgetConfiguration.hiddenControl()(v40, v32);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v30, v33);
}

uint64_t sub_100017780@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  char v15;
  uint64_t v16;
  __int16 v17;
  _BYTE v18[16];

  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = &v18[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin();
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000017, 0x800000010003A880);
  static Locale.current.getter(v12);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  v17 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsEntityName", 38, 2, v9, 0, 0, v7, v5, "Name of the SettingsDurationForNewEventsEntity type", 51, v17);
  result = Text.init(_:)(v11);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v14;
  *(_BYTE *)(a1 + 16) = v15 & 1;
  *(_QWORD *)(a1 + 24) = v16;
  return result;
}

uint64_t sub_100017938@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v4 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000156F8(*a1, (uint64_t)v6);
  result = Text.init(_:)(v6);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v8;
  *(_BYTE *)(a2 + 16) = v9 & 1;
  *(_QWORD *)(a2 + 24) = v10;
  return result;
}

uint64_t sub_1000179BC(unsigned __int8 *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000156F8(*a1, (uint64_t)v4);
  v5 = Text.init(_:)(v4);
  return ControlAffordances.init(tint:status:actionHint:)(0, v5, v7, v6 & 1, v8, 0, 0, 0, 0);
}

uint64_t sub_100017A70(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = a1 - 15;
  result = 0;
  switch(v1)
  {
    case 0:
      return result;
    case 10:
      result = 1;
      break;
    case 15:
      result = 2;
      break;
    case 25:
      result = 3;
      break;
    case 35:
      result = 4;
      break;
    case 40:
      result = 5;
      break;
    case 75:
      result = 7;
      break;
    default:
      result = 6;
      break;
  }
  return result;
}

unint64_t sub_100017AE0(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100054C00, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 9)
    return 9;
  else
    return v3;
}

uint64_t sub_100017B28()
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
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_BYTE *, uint64_t, uint64_t);
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  void (*v29)(_BYTE *, uint64_t, uint64_t, uint64_t);
  _BYTE *v30;
  _BYTE *v31;
  _BYTE *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v38;
  uint64_t v39;
  _BYTE *v40;
  _BYTE *v41;
  _BYTE *v42;
  _BYTE *v43;
  unint64_t v44;
  __int16 v46;
  int v47;
  int v48;
  int v49;
  _BYTE v50[4];
  unsigned int v51;
  uint64_t v52;
  void (*v53)(_BYTE *, uint64_t, uint64_t);
  unsigned int v54;
  void (*v55)(_BYTE *);
  uint64_t v56;
  void (*v57)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  _BYTE *v61;
  _BYTE *v62;
  _BYTE *v63;
  _BYTE *v64;
  uint64_t v65;
  char v66[3];
  uint64_t v67;

  v65 = type metadata accessor for InputConnectionBehavior(0);
  v60 = *(_QWORD *)(v65 - 8);
  __chkstk_darwin(v65);
  v64 = &v50[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v1 = sub_100007E00((uint64_t *)&unk_10005D140);
  v2 = __chkstk_darwin(v1);
  v63 = &v50[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  v62 = &v50[-v4];
  v5 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v5);
  v61 = &v50[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v50[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = type metadata accessor for Locale(0);
  __chkstk_darwin(v11);
  v13 = &v50[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v14);
  v16 = &v50[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = type metadata accessor for LocalizedStringResource(0);
  v18 = *(_QWORD *)(v17 - 8);
  v58 = v17;
  v19 = __chkstk_darwin(v17);
  v59 = &v50[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v19);
  v22 = &v50[-v21];
  v56 = sub_100007E00(&qword_10005CF50);
  v23 = String.LocalizationValue.init(stringLiteral:)(0x746567726154, 0xE600000000000000);
  static Locale.current.getter(v23);
  v24 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v25 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 104);
  v51 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v52 = v7;
  v25(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  v53 = v25;
  v46 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target", 6, 2, v16, 0, 0, v13, v10, "Calendar settings entity title that indicates which setting the user would like to target.", 90, v46);
  v26 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x800000010003B560);
  static Locale.current.getter(v26);
  v25(v10, v24, v7);
  LOWORD(v47) = 2;
  v27 = v61;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target_description", 18, 2, v16, 0, 0, v13, v10, "Description for the Calendar settings entity parameter that indicates which setting the user would like to target.", 114, v47);
  v57 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v18 + 56);
  v57(v27, 0, 1, v17);
  v67 = 0;
  v28 = type metadata accessor for IntentDialog(0);
  v29 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56);
  v30 = v62;
  v29(v62, 1, 1, v28);
  v31 = v63;
  v29(v63, 1, 1, v28);
  v54 = enum case for InputConnectionBehavior.default(_:);
  v55 = *(void (**)(_BYTE *))(v60 + 104);
  v32 = v64;
  v55(v64);
  v33 = sub_100015EB0();
  v60 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v22, v27, &v67, v30, v31, v32, v33);
  v56 = sub_100007E00(&qword_10005CF58);
  v34 = String.LocalizationValue.init(stringLiteral:)(0x65756C6156, 0xE500000000000000);
  static Locale.current.getter(v34);
  v35 = v51;
  v36 = v52;
  v37 = v53;
  v53(v10, v51, v52);
  LOWORD(v48) = 2;
  v38 = v59;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value", 5, 2, v16, 0, 0, v13, v10, "Calendar settings property title that indicates which property of a setting the user would like to set to as the value.", 119, v48);
  v39 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000026, 0x800000010003B6A0);
  static Locale.current.getter(v39);
  v37(v10, v35, v36);
  LOWORD(v49) = 2;
  v40 = v61;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value_description", 17, 2, v16, 0, 0, v13, v10, "Description for a Calendar settings property parameter that indicates which value of a setting the user would like to set to.", 125, v49);
  v57(v40, 0, 1, v58);
  v66[0] = 9;
  v41 = v62;
  v29(v62, 1, 1, v28);
  v42 = v63;
  v29(v63, 1, 1, v28);
  v43 = v64;
  ((void (*)(_BYTE *, _QWORD, uint64_t))v55)(v64, v54, v65);
  v44 = sub_100015C78();
  IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v38, v40, v66, v41, v42, v43, &off_100054CF8, v44);
  return v60;
}

uint64_t sub_1000180DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100018198, 0, 0);
}

uint64_t sub_100018198()
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
  unint64_t v9;
  uint64_t v10;
  __int16 v12;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100007E00(&qword_10005CEC8);
  v7 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000017, 0x800000010003A880);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  v12 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsDurationForNewEventsEntityName", 38, 2, v1, 0, 0, v4, v3, "Name of the SettingsDurationForNewEventsEntity type", 51, v12);
  v8 = sub_10000A9CC(&qword_10005CF78, &qword_10005CF80, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = sub_100015C78();
  v10 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005CF68, 0, &unk_10005CF70, 0, &type metadata for UpdateIntent_durationForNewEvents, v8, v9);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v10);
}

uint64_t sub_1000182FC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

ValueMetadata *type metadata accessor for SettingsDurationForNewEventsPickerControl()
{
  return &type metadata for SettingsDurationForNewEventsPickerControl;
}

uint64_t sub_100018318(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10005023C, 1);
}

unint64_t sub_100018328()
{
  unint64_t result;

  result = qword_10005CFA0;
  if (!qword_10005CFA0)
  {
    result = swift_getWitnessTable(&unk_100047C08, &type metadata for SettingsDurationForNewEventsType);
    atomic_store(result, (unint64_t *)&qword_10005CFA0);
  }
  return result;
}

uint64_t sub_10001836C(char a1)
{
  return *(_QWORD *)&aNoalert_3[8 * a1];
}

uint64_t sub_10001838C()
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

  v0 = sub_100007E00(&qword_10005D630);
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
  sub_100007F24(v16, qword_10005DE88);
  sub_100007F0C(v16, (uint64_t)qword_10005DE88);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000019, 0x8000000100040B10);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, _QWORD))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v19[0]);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0, 0, v8, v5, "Title for choosing an Default alert times for events.", 53, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v2, 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v2);
}

unint64_t sub_1000185A0()
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
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
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t, uint64_t);
  void (*v64)(char *, uint64_t, uint64_t);
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(char *, uint64_t, uint64_t);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(char *, uint64_t, uint64_t);
  _BYTE *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void (*v98)(char *, uint64_t, uint64_t);
  uint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  void (*v104)(char *, uint64_t, uint64_t);
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void (*v111)(char *, uint64_t, uint64_t);
  char *v112;
  uint64_t v113;
  _BYTE *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void (*v118)(char *, uint64_t, uint64_t);
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  char *v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  _BYTE *v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void (*v140)(char *, uint64_t, uint64_t);
  uint64_t v141;
  uint64_t v142;
  void (*v143)(char *, uint64_t, uint64_t);
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  _BYTE *v148;
  uint64_t v149;
  uint64_t v150;
  char *v151;
  uint64_t v152;
  char *v153;
  void (*v154)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void (*v158)(char *, uint64_t, uint64_t);
  uint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  uint64_t v169;
  char *v170;
  uint64_t v171;
  uint64_t v172;
  void (*v173)(char *, uint64_t, uint64_t);
  char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  unint64_t result;
  int v191;
  int v192;
  int v193;
  int v194;
  int v195;
  int v196;
  int v197;
  int v198;
  int v199;
  int v200;
  int v201;
  int v202;
  int v203;
  int v204;
  int v205;
  int v206;
  int v207;
  int v208;
  int v209;
  int v210;
  int v211;
  int v212;
  int v213;
  int v214;
  int v215;
  int v216;
  int v217;
  int v218;
  int v219;
  int v220;
  int v221;
  int v222;
  int v223;
  int v224;
  int v225;
  int v226;
  _QWORD v227[2];
  __int128 v228;
  uint64_t v229;
  _BYTE *v230;
  uint64_t v231;
  uint64_t v232;
  char *v233;
  char *v234;
  char *v235;
  char *v236;
  char *v237;
  char *v238;
  char *v239;
  char *v240;
  char *v241;
  char *v242;
  char *v243;
  char *v244;
  char *v245;
  char *v246;
  char *v247;
  void (*v248)(char *, uint64_t, uint64_t);
  char *v249;
  __int128 v250;
  uint64_t v251;
  char *v252;
  unsigned int v253;
  __int128 v254;
  char *v255;
  uint64_t v256;
  uint64_t v257;
  void (*v258)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  void (*v262)(char *, uint64_t, uint64_t);
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  _QWORD *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;

  v0 = sub_100007E00(&qword_10005D190);
  v1 = __chkstk_darwin(v0);
  v234 = (char *)v227 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __chkstk_darwin(v1);
  v233 = (char *)v227 - v4;
  v5 = __chkstk_darwin(v3);
  v243 = (char *)v227 - v6;
  v7 = __chkstk_darwin(v5);
  v240 = (char *)v227 - v8;
  v9 = __chkstk_darwin(v7);
  v255 = (char *)v227 - v10;
  v11 = __chkstk_darwin(v9);
  v235 = (char *)v227 - v12;
  __chkstk_darwin(v11);
  v236 = (char *)v227 - v13;
  v14 = sub_100007E00(&qword_10005D630);
  v15 = __chkstk_darwin(v14);
  v247 = (char *)v227 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v245 = (char *)v227 - v18;
  v19 = __chkstk_darwin(v17);
  v242 = (char *)v227 - v20;
  v21 = __chkstk_darwin(v19);
  v239 = (char *)v227 - v22;
  v23 = __chkstk_darwin(v21);
  *(_QWORD *)&v254 = (char *)v227 - v24;
  v25 = __chkstk_darwin(v23);
  *(_QWORD *)&v250 = (char *)v227 - v26;
  __chkstk_darwin(v25);
  v28 = (char *)v227 - v27;
  v29 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v266 = *(_QWORD **)(v29 - 8);
  __chkstk_darwin(v29);
  v31 = (char *)v227 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = type metadata accessor for Locale(0);
  __chkstk_darwin(v32);
  v34 = (char *)v227 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v35);
  v37 = (char *)v227 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = type metadata accessor for LocalizedStringResource(0);
  v39 = *(_QWORD *)(v38 - 8);
  v40 = __chkstk_darwin(v38);
  v246 = (char *)v227 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __chkstk_darwin(v40);
  v244 = (char *)v227 - v43;
  v44 = __chkstk_darwin(v42);
  v241 = (char *)v227 - v45;
  v46 = __chkstk_darwin(v44);
  v238 = (char *)v227 - v47;
  v48 = __chkstk_darwin(v46);
  v237 = (char *)v227 - v49;
  v50 = __chkstk_darwin(v48);
  v252 = (char *)v227 - v51;
  v52 = __chkstk_darwin(v50);
  v249 = (char *)v227 - v53;
  __chkstk_darwin(v52);
  v55 = (char *)v227 - v54;
  v56 = sub_100007E00(&qword_10005D198);
  v269 = sub_100007E00((uint64_t *)&unk_10005D1A0);
  v57 = *(_QWORD *)(v269 - 8);
  v58 = *(_QWORD *)(v57 + 72);
  v59 = *(unsigned __int8 *)(v57 + 80);
  v60 = (v59 + 32) & ~v59;
  v259 = v58;
  v61 = swift_allocObject(v56, v60 + 11 * v58, v59 | 7);
  *(_OWORD *)(v61 + 16) = xmmword_1000484D0;
  v232 = v61;
  v267 = v61 + v60;
  *(_BYTE *)(v61 + v60) = 0;
  v62 = String.LocalizationValue.init(stringLiteral:)(1701736270, 0xE400000000000000);
  static Locale.current.getter(v62);
  v63 = (void (*)(char *, uint64_t, uint64_t))v266[13];
  v253 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v256 = v29;
  v64 = v63;
  ((void (*)(char *))v63)(v31);
  v230 = v55;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_None", 39, 2, v37, 0, 0, v34, v31, "Display name for choosing no alert for timed events as default", 62, 2);
  v65 = *(_QWORD **)(v39 + 56);
  v231 = (uint64_t)v28;
  v268 = v38;
  v266 = v65;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v65)(v28, 1, 1, v38);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v66 = type metadata accessor for DisplayRepresentation.Image(0);
  v67 = sub_100007F0C(v66, (uint64_t)qword_10005DF80);
  v68 = *(_QWORD *)(v66 - 8);
  v262 = *(void (**)(char *, uint64_t, uint64_t))(v68 + 16);
  v263 = v67;
  v69 = v236;
  v260 = v66;
  v262(v236, v67, v66);
  v258 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v68 + 56);
  v258(v69, 0, 1, v66);
  v265 = sub_100007E00(&qword_10005CC60);
  v70 = *(_QWORD *)(v39 + 72);
  v71 = *(unsigned __int8 *)(v39 + 80);
  v251 = 2 * v70;
  v257 = v70;
  v229 = ((v71 + 32) & ~v71) + 2 * v70;
  v261 = (v71 + 32) & ~v71;
  v264 = v71 | 7;
  v72 = swift_allocObject(v265, v229, v71 | 7);
  v228 = xmmword_100047370;
  *(_OWORD *)(v72 + 16) = xmmword_100047370;
  v73 = String.LocalizationValue.init(stringLiteral:)(0x64656C6261736944, 0xE800000000000000);
  static Locale.current.getter(v73);
  v74 = v253;
  v75 = v256;
  v76 = v64;
  v64(v31, v253, v256);
  LOWORD(v191) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_None_Synonym_Disabled", 56, 2, v37, 0, 0, v34, v31, "Synonym (\"Disabled\") for the no alert option for the default timed event alert setting", 86, v191);
  v227[1] = v267 + *(int *)(v269 + 48);
  v77 = v267;
  v78 = String.LocalizationValue.init(stringLiteral:)(6710863, 0xE300000000000000);
  static Locale.current.getter(v78);
  v79 = v75;
  v76(v31, v74, v75);
  LOWORD(v192) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_None_Synonym_Off", 51, 2, v37, 0, 0, v34, v31, "Synonym (\"Off\") for the no alert option for the default timed event alert setting", 81, v192);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v230, v231, v236, v72);
  *(_BYTE *)(v77 + v259) = 1;
  v236 = (char *)0xD000000000000010;
  v80 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000010, 0x800000010003F2B0);
  static Locale.current.getter(v80);
  v76(v31, v74, v75);
  v248 = v76;
  LOWORD(v193) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_TimeOfEvent", 46, 2, v37, 0, 0, v34, v31, "Display name for choosing default alarm as at time of event type", 64, v193);
  ((void (*)(_QWORD, uint64_t, uint64_t, uint64_t))v266)(v250, 1, 1, v268);
  v81 = v235;
  v82 = v260;
  v262(v235, v263, v260);
  v258(v81, 0, 1, v82);
  v83 = swift_allocObject(v265, v229, v264);
  *(_OWORD *)(v83 + 16) = v228;
  v84 = String.LocalizationValue.init(stringLiteral:)(0x666F20656D6954, 0xE700000000000000);
  static Locale.current.getter(v84);
  v76(v31, v74, v79);
  LOWORD(v194) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_TimeOfEvent_Synonym_TimeOf", 61, 2, v37, 0, 0, v34, v31, "Synonym (\"Time of\") for the time of event option for the default timed event alert setting", 90, v194);
  v85 = v269;
  v86 = String.LocalizationValue.init(stringLiteral:)(0x656D697420656854, 0xEB00000000666F20);
  static Locale.current.getter(v86);
  v87 = v74;
  v88 = v248;
  v248(v31, v87, v79);
  LOWORD(v195) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_TimeOfEvent_Synonym_TheTimeOf", 64, 2, v37, 0, 0, v34, v31, "Synonym (\"The time of\") for the time of event option for the default timed event alert setting", 94, v195);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v249, v250, v81, v83);
  v235 = (char *)(2 * v259);
  v89 = (_BYTE *)(v267 + 2 * v259);
  v231 = (uint64_t)&v89[*(int *)(v85 + 48)];
  *v89 = 2;
  v90 = String.LocalizationValue.init(stringLiteral:)(v236, 0x800000010003F4B0);
  static Locale.current.getter(v90);
  v91 = v253;
  v92 = v79;
  v88(v31, v253, v79);
  LOWORD(v196) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_5MinutesBefore", 49, 2, v37, 0, 0, v34, v31, "Display name for choosing default alarm as 5 minutes before event type", 70, v196);
  ((void (*)(_QWORD, uint64_t, uint64_t, uint64_t))v266)(v254, 1, 1, v268);
  v93 = v255;
  v94 = v260;
  v262(v255, v263, v260);
  v258(v93, 0, 1, v94);
  v249 = (char *)(v261 + v257);
  v95 = swift_allocObject(v265, v261 + v257, v264);
  v250 = xmmword_1000484B0;
  *(_OWORD *)(v95 + 16) = xmmword_1000484B0;
  v96 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x800000010003F570);
  static Locale.current.getter(v96);
  v97 = v91;
  v98 = v248;
  v248(v31, v91, v92);
  LOWORD(v197) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_5MinutesBefore_Synonym_FiveMinutesBefore", 75, 2, v37, 0, 0, v34, v31, "Synonym (\"Five minutes before\") for the 5 minutes before option for the default timed event alert setting", 105, v197);
  v99 = v254;
  v100 = v255;
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v252, v254, v255, v95);
  v101 = &v235[v259 + v267];
  v235 = &v101[*(int *)(v269 + 48)];
  *v101 = 3;
  v102 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x800000010003F640);
  static Locale.current.getter(v102);
  v103 = v92;
  v104 = v98;
  v98(v31, v91, v103);
  LOWORD(v198) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_10MinutesBefore", 50, 2, v37, 0, 0, v34, v31, "Display name for choosing default alarm as 10 minutes before type", 65, v198);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v266)(v99, 1, 1, v268);
  v105 = v100;
  v106 = v260;
  v262(v100, v263, v260);
  v258(v100, 0, 1, v106);
  v107 = swift_allocObject(v265, v249, v264);
  *(_OWORD *)(v107 + 16) = v250;
  v108 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000012, 0x800000010003F700);
  static Locale.current.getter(v108);
  v109 = v97;
  v110 = v256;
  v104(v31, v97, v256);
  v111 = v104;
  LOWORD(v199) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_10MinutesBefore_Synonym_TenMinutesBefore", 75, 2, v37, 0, 0, v34, v31, "Synonym (\"Ten minutes before\") for the 10 minutes before option for the default timed event alert setting", 105, v199);
  v112 = v252;
  v113 = v254;
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v252, v254, v105, v107);
  v235 = (char *)(4 * v259);
  v114 = (_BYTE *)(v267 + 4 * v259);
  v231 = (uint64_t)&v114[*(int *)(v269 + 48)];
  *v114 = 4;
  v115 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x800000010003F7D0);
  static Locale.current.getter(v115);
  v116 = v109;
  v117 = v110;
  v111(v31, v116, v110);
  v118 = v111;
  LOWORD(v200) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_15MinutesBefore", 50, 2, v37, 0, 0, v34, v31, "Display name for choosing default alarm as 15 minutes before type", 65, v200);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v266)(v113, 1, 1, v268);
  v119 = v260;
  v262(v105, v263, v260);
  v258(v105, 0, 1, v119);
  v120 = swift_allocObject(v265, v249, v264);
  *(_OWORD *)(v120 + 16) = v250;
  v121 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x800000010003F890);
  static Locale.current.getter(v121);
  v122 = v253;
  v111(v31, v253, v117);
  LOWORD(v201) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_15MinutesBefore_Synonym_FifteenMinutesBefore", 79, 2, v37, 0, 0, v34, v31, "Synonym (\"Fifteen minutes before\") for the 15 minutes before option for the default timed event alert setting", 109, v201);
  v123 = v112;
  v124 = v254;
  v125 = v255;
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v123, v254, v255, v120);
  v126 = &v235[v259 + v267];
  v235 = &v126[*(int *)(v269 + 48)];
  *v126 = 5;
  v127 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x800000010003F960);
  static Locale.current.getter(v127);
  v118(v31, v122, v117);
  LOWORD(v202) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_30MinutesBefore", 50, 2, v37, 0, 0, v34, v31, "Display name for choosing default alarm as 30 minutes before type", 65, v202);
  v128 = v124;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v266)(v124, 1, 1, v268);
  v129 = v260;
  v262(v125, v263, v260);
  v258(v125, 0, 1, v129);
  v130 = swift_allocObject(v265, v249, v264);
  *(_OWORD *)(v130 + 16) = v250;
  v131 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000015, 0x800000010003FA20);
  static Locale.current.getter(v131);
  v132 = v253;
  v133 = v256;
  v118(v31, v253, v256);
  LOWORD(v203) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_30MinutesBefore_Synonym_ThirtyMinutesBefore", 78, 2, v37, 0, 0, v34, v31, "Synonym (\"Thirty minutes before\") for the 30 minutes before option for the default timed event alert setting", 108, v203);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v252, v128, v125, v130);
  v134 = (_BYTE *)(v267 + 6 * v259);
  *v134 = 6;
  v135 = String.LocalizationValue.init(stringLiteral:)(0x622072756F682031, 0xED000065726F6665);
  static Locale.current.getter(v135);
  v118(v31, v132, v133);
  LOWORD(v204) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_1HourBefore", 46, 2, v37, 0, 0, v34, v31, "Display name for choosing default alarm as 1 hour before type", 61, v204);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v266)(v239, 1, 1, v268);
  v136 = v240;
  v137 = v260;
  v262(v240, v263, v260);
  v258(v136, 0, 1, v137);
  v252 = (char *)(4 * v257);
  v231 = swift_allocObject(v265, v261 + 4 * v257, v264);
  *(_OWORD *)(v231 + 16) = xmmword_1000484E0;
  v138 = String.LocalizationValue.init(stringLiteral:)(0x72756F6820656E4FLL, 0xEF65726F66656220);
  static Locale.current.getter(v138);
  v139 = v256;
  v140 = v248;
  v248(v31, v132, v256);
  LOWORD(v205) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_1HourBefore_Synonym_OneHourBefore", 68, 2, v37, 0, 0, v34, v31, "Synonym (\"One hour before\") for the 1 hour before option for the default timed event alert setting", 98, v205);
  v230 = &v134[*(int *)(v269 + 48)];
  v141 = String.LocalizationValue.init(stringLiteral:)(0x2072756F68206E41, 0xEE0065726F666562);
  static Locale.current.getter(v141);
  v142 = v132;
  v140(v31, v132, v139);
  v143 = v140;
  LOWORD(v206) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_1HourBefore_Synonym_AnHourBefore", 67, 2, v37, 0, 0, v34, v31, "Synonym (\"An hour before\") for the 1 hour before option for the default timed event alert setting", 97, v206);
  v144 = v251;
  v145 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x800000010003FCF0);
  static Locale.current.getter(v145);
  v143(v31, v142, v139);
  LOWORD(v207) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_1HourBefore_Synonym_60MinutesBefore", 70, 2, v37, 0, 0, v34, v31, "Synonym (\"60 minutes before\") for the 1 hour before option for the default timed event alert setting", 100, v207);
  v235 = (char *)(v144 + v257);
  v146 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000014, 0x800000010003FDD0);
  static Locale.current.getter(v146);
  v147 = v142;
  v143(v31, v142, v139);
  LOWORD(v208) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_1HourBefore_Synonym_SixtyMinutesBefore", 73, 2, v37, 0, 0, v34, v31, "Synonym (\"Sixty minutes before\") for the 1 hour before option for the default timed event alert setting", 103, v208);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v237, v239, v240, v231);
  v240 = (char *)(8 * v259);
  v148 = (_BYTE *)(v267 + 7 * v259);
  *v148 = 7;
  v239 = &v148[*(int *)(v269 + 48)];
  v149 = String.LocalizationValue.init(stringLiteral:)(0x207372756F682032, 0xEE0065726F666562);
  static Locale.current.getter(v149);
  v143(v31, v142, v139);
  LOWORD(v209) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_2HoursBefore", 47, 2, v37, 0, 0, v34, v31, "Display name for choosing default alarm as 2 hours before type", 62, v209);
  v150 = v254;
  ((void (*)(_QWORD, uint64_t, uint64_t, uint64_t))v266)(v254, 1, 1, v268);
  v151 = v255;
  v152 = v260;
  v262(v255, v263, v260);
  v153 = v151;
  v154 = v258;
  v258(v153, 0, 1, v152);
  v155 = swift_allocObject(v265, v249, v264);
  *(_OWORD *)(v155 + 16) = v250;
  v156 = String.LocalizationValue.init(stringLiteral:)(v236, 0x800000010003FF20);
  static Locale.current.getter(v156);
  v157 = v256;
  v158 = v248;
  v248(v31, v147, v256);
  LOWORD(v210) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_2HoursBefore_Synonym_TwoHoursBefore", 70, 2, v37, 0, 0, v34, v31, "Synonym (\"Two hours before\") for the 2 hours before option for the default timed event alert setting", 100, v210);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v238, v150, v255, v155);
  v249 = &v240[v267];
  *v249 = 8;
  v159 = String.LocalizationValue.init(stringLiteral:)(0x6562207961642031, 0xEC00000065726F66);
  static Locale.current.getter(v159);
  v158(v31, v147, v157);
  LOWORD(v211) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_1DayBefore", 45, 2, v37, 0, 0, v34, v31, "Display name for choosing default alarm as one day before type", 62, v211);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v266)(v242, 1, 1, v268);
  v160 = v243;
  v161 = v260;
  v262(v243, v263, v260);
  v154(v160, 0, 1, v161);
  v255 = &v252[v257 + v261];
  v162 = swift_allocObject(v265, v255, v264);
  v254 = xmmword_100047360;
  *(_QWORD *)&v250 = v162;
  *(_OWORD *)(v162 + 16) = xmmword_100047360;
  v163 = String.LocalizationValue.init(stringLiteral:)(0x2079616420656E4FLL, 0xEE0065726F666562);
  static Locale.current.getter(v163);
  v164 = v256;
  v158(v31, v147, v256);
  LOWORD(v212) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_1DayBefore_Synonym_OneDayBefore", 66, 2, v37, 0, 0, v34, v31, "Synonym (\"One day before\") for the 1 day before option for the default timed event alert setting", 96, v212);
  v165 = String.LocalizationValue.init(stringLiteral:)(0x6562207961642041, 0xEC00000065726F66);
  static Locale.current.getter(v165);
  v158(v31, v147, v164);
  LOWORD(v213) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_1DayBefore_Synonym_ADayBefore", 64, 2, v37, 0, 0, v34, v31, "Synonym (\"A day before\") for the 1 day before option for the default timed event alert setting", 94, v213);
  v166 = String.LocalizationValue.init(stringLiteral:)(0x2079616420656854, 0xEE0065726F666562);
  static Locale.current.getter(v166);
  v158(v31, v147, v164);
  LOWORD(v214) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_1DayBefore_Synonym_TheDayBefore", 66, 2, v37, 0, 0, v34, v31, "Synonym (\"The day before\") for the 1 day before option for the default timed event alert setting", 96, v214);
  v167 = v235;
  v168 = String.LocalizationValue.init(stringLiteral:)(0x7372756F68203432, 0xEF65726F66656220);
  static Locale.current.getter(v168);
  v158(v31, v147, v164);
  LOWORD(v215) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_1DayBefore_Synonym_24HoursBefore", 67, 2, v37, 0, 0, v34, v31, "Synonym (\"24 hours before\") for the 1 day before option for the default timed event alert setting", 97, v215);
  v249 = (char *)0xD000000000000018;
  v169 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000018, 0x8000000100040360);
  static Locale.current.getter(v169);
  v158(v31, v147, v164);
  LOWORD(v216) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_1DayBefore_Synonym_TwentyFourHoursBefore", 75, 2, v37, 0, 0, v34, v31, "Synonym (\"Twenty four hours before\") for the 1 day before option for the default timed event alert setting", 106, v216);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v241, v242, v243, v250);
  v170 = &v240[v259 + v267];
  *v170 = 9;
  v171 = String.LocalizationValue.init(stringLiteral:)(0x6220737961642032, 0xED000065726F6665);
  static Locale.current.getter(v171);
  v172 = v164;
  v158(v31, v147, v164);
  LOWORD(v217) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_2DaysBefore", 46, 2, v37, 0, 0, v34, v31, "Display name for choosing default alarm as 2 days before type", 61, v217);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v266)(v245, 1, 1, v268);
  v173 = v158;
  v174 = v233;
  v175 = v260;
  v262(v233, v263, v260);
  v258(v174, 0, 1, v175);
  v176 = swift_allocObject(v265, &v167[v261], v264);
  *(_OWORD *)(v176 + 16) = xmmword_1000484F0;
  v177 = String.LocalizationValue.init(stringLiteral:)(0x73796164206F7754, 0xEF65726F66656220);
  static Locale.current.getter(v177);
  v178 = v253;
  v173(v31, v253, v172);
  LOWORD(v218) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_2DaysBefore_Synonym_TwoDaysBefore", 68, 2, v37, 0, 0, v34, v31, "Synonym (\"Two days before\") for the 2 days before option for the default timed event alert setting", 98, v218);
  *(_QWORD *)&v250 = &v170[*(int *)(v269 + 48)];
  v179 = String.LocalizationValue.init(stringLiteral:)(0x7372756F68203834, 0xEF65726F66656220);
  static Locale.current.getter(v179);
  v173(v31, v178, v172);
  LOWORD(v219) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_2DaysBefore_Synonym_48HoursBefore", 68, 2, v37, 0, 0, v34, v31, "Synonym (\"48 hours before\") for the 2 days before option for the default timed event alert setting", 98, v219);
  v180 = String.LocalizationValue.init(stringLiteral:)(v249, 0x8000000100040630);
  static Locale.current.getter(v180);
  v173(v31, v178, v172);
  LOWORD(v220) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_2DaysBefore_Synonym_FortyEightHoursBefore", 76, 2, v37, 0, 0, v34, v31, "Synonym (\"Forty eight hours before\") for the 2 days before option for the default timed event alert setting", 107, v220);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v244, v245, v174, v176);
  v267 += 10 * v259;
  *(_BYTE *)v267 = 10;
  v181 = String.LocalizationValue.init(stringLiteral:)(0x62206B6565772031, 0xED000065726F6665);
  static Locale.current.getter(v181);
  v173(v31, v178, v172);
  LOWORD(v221) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_1WeekBefore", 46, 2, v37, 0, 0, v34, v31, "Display name for choosing default alarm as 1 week before type", 61, v221);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v266)(v247, 1, 1, v268);
  v182 = v234;
  v183 = v260;
  v262(v234, v263, v260);
  v258(v182, 0, 1, v183);
  v184 = swift_allocObject(v265, v255, v264);
  *(_OWORD *)(v184 + 16) = v254;
  v185 = String.LocalizationValue.init(stringLiteral:)(0x6B65657720656E4FLL, 0xEF65726F66656220);
  static Locale.current.getter(v185);
  v173(v31, v178, v172);
  LOWORD(v222) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_1WeekBefore_Synonym_OneWeekBefore", 68, 2, v37, 0, 0, v34, v31, "Synonym (\"One week before\") for the 1 week before option for the default timed event alert setting", 98, v222);
  v186 = String.LocalizationValue.init(stringLiteral:)(0x6220737961642037, 0xED000065726F6665);
  static Locale.current.getter(v186);
  v173(v31, v178, v172);
  LOWORD(v223) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_1WeekBefore_Synonym_7DaysBefore", 66, 2, v37, 0, 0, v34, v31, "Synonym (\"7 days before\") for the 1 week before option for the default timed event alert setting", 96, v223);
  v187 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x8000000100040900);
  static Locale.current.getter(v187);
  v173(v31, v178, v172);
  LOWORD(v224) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_1WeekBefore_Synonym_SevenDaysBefore", 70, 2, v37, 0, 0, v34, v31, "Synonym (\"Seven days before\") for the 1 week before option for the default timed event alert setting", 100, v224);
  v188 = String.LocalizationValue.init(stringLiteral:)(0x6B65657720656854, 0xEF65726F66656220);
  static Locale.current.getter(v188);
  v173(v31, v178, v172);
  LOWORD(v225) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_1WeekBefore_Synonym_TheWeekBefore", 68, 2, v37, 0, 0, v34, v31, "Synonym (\"The week before\") for the 1 week before option for the default timed event alert setting", 98, v225);
  v189 = String.LocalizationValue.init(stringLiteral:)(0x62206B6565772041, 0xED000065726F6665);
  static Locale.current.getter(v189);
  v173(v31, v178, v172);
  LOWORD(v226) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimeType_1WeekBefore_Synonym_AWeekBefore", 66, 2, v37, 0, 0, v34, v31, "Synonym (\"A week before\") for the 1 week before option for the default timed event alert setting", 96, v226);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v246, v247, v182, v184);
  result = sub_100032A0C(v232);
  qword_10005DEA0 = result;
  return result;
}

uint64_t sub_10001A910@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v20[24];

  v4 = sub_100007E00(&qword_10005CC78);
  __chkstk_darwin(v4);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = type metadata accessor for LocalizedStringResource(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (qword_10005C508 != -1)
    swift_once(&qword_10005C508, sub_1000185A0);
  swift_beginAccess(&qword_10005DEA0, v20, 32, 0);
  v11 = qword_10005DEA0;
  if (*(_QWORD *)(qword_10005DEA0 + 16) && (v12 = sub_100037414(a1), (v13 & 1) != 0))
  {
    v14 = v12;
    v15 = *(_QWORD *)(v11 + 56);
    v16 = type metadata accessor for DisplayRepresentation(0);
    v17 = *(_QWORD *)(v16 - 8);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v17 + 16))(v6, v15 + *(_QWORD *)(v17 + 72) * v14, v16);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v6, 0, 1, v16);
  }
  else
  {
    v16 = type metadata accessor for DisplayRepresentation(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  type metadata accessor for DisplayRepresentation(0);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v6, 1, v16))
  {
    sub_100010A58((uint64_t)v6);
    swift_endAccess(v20);
    return LocalizedStringResource.init(stringLiteral:)(0, 0xE000000000000000);
  }
  else
  {
    DisplayRepresentation.title.getter();
    sub_100010A58((uint64_t)v6);
    swift_endAccess(v20);
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v8 + 32))(a2, v10, v7);
  }
}

uint64_t sub_10001AB04(char *a1, char *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = sub_10001836C(*a1);
  v5 = v4;
  v6 = sub_10001836C(v2);
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

unint64_t sub_10001AB90()
{
  unint64_t result;

  result = qword_10005CFC0;
  if (!qword_10005CFC0)
  {
    result = swift_getWitnessTable(&unk_10004850C, &type metadata for SettingsEventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005CFC0);
  }
  return result;
}

Swift::Int sub_10001ABD4()
{
  char *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v1 = *v0;
  Hasher.init(_seed:)(v6, 0);
  v2 = sub_10001836C(v1);
  v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_10001AC34(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_10001836C(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_10001AC74(uint64_t a1)
{
  char *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  v3 = sub_10001836C(v2);
  v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

unint64_t sub_10001ACD0@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10001D2F0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10001ACFC@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_10001836C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10001AD28()
{
  unint64_t result;

  result = qword_10005CFC8;
  if (!qword_10005CFC8)
  {
    result = swift_getWitnessTable(&unk_100048624, &type metadata for SettingsEventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005CFC8);
  }
  return result;
}

unint64_t sub_10001AD70()
{
  unint64_t result;

  result = qword_10005CFD0;
  if (!qword_10005CFD0)
  {
    result = swift_getWitnessTable(&unk_10004865C, &type metadata for SettingsEventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005CFD0);
  }
  return result;
}

unint64_t sub_10001ADB8()
{
  unint64_t result;

  result = qword_10005CFD8;
  if (!qword_10005CFD8)
  {
    result = swift_getWitnessTable(&unk_100048574, &type metadata for SettingsEventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005CFD8);
  }
  return result;
}

unint64_t sub_10001AE00()
{
  unint64_t result;

  result = qword_10005CFE0;
  if (!qword_10005CFE0)
  {
    result = swift_getWitnessTable(&unk_10004868C, &type metadata for SettingsEventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005CFE0);
  }
  return result;
}

unint64_t sub_10001AE48()
{
  unint64_t result;

  result = qword_10005CFE8;
  if (!qword_10005CFE8)
  {
    result = swift_getWitnessTable(&unk_1000486B4, &type metadata for SettingsEventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005CFE8);
  }
  return result;
}

unint64_t sub_10001AE90()
{
  unint64_t result;

  result = qword_10005CFF0;
  if (!qword_10005CFF0)
  {
    result = swift_getWitnessTable(&unk_1000486DC, &type metadata for SettingsEventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005CFF0);
  }
  return result;
}

unint64_t sub_10001AED8()
{
  unint64_t result;

  result = qword_10005CFF8;
  if (!qword_10005CFF8)
  {
    result = swift_getWitnessTable(&unk_100048734, &type metadata for SettingsEventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005CFF8);
  }
  return result;
}

uint64_t sub_10001AF1C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000773C(&qword_10005C500, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005DE88, (uint64_t)sub_10001838C, a1);
}

uint64_t sub_10001AF40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076D8(a1, a2, a3, (uint64_t (*)(void))sub_10001AF54, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

unint64_t sub_10001AF54()
{
  unint64_t result;

  result = qword_10005D000;
  if (!qword_10005D000)
  {
    result = swift_getWitnessTable(&unk_1000485AC, &type metadata for SettingsEventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D000);
  }
  return result;
}

uint64_t sub_10001AF98(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001AF54();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001AFD4()
{
  unint64_t result;

  result = qword_10005D008;
  if (!qword_10005D008)
  {
    result = swift_getWitnessTable(&unk_100048774, &type metadata for SettingsEventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D008);
  }
  return result;
}

unint64_t sub_10001B01C()
{
  unint64_t result;

  result = qword_10005D010;
  if (!qword_10005D010)
  {
    result = swift_getWitnessTable(&unk_10004879C, &type metadata for SettingsEventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D010);
  }
  return result;
}

unint64_t sub_10001B064()
{
  unint64_t result;

  result = qword_10005D018;
  if (!qword_10005D018)
  {
    result = swift_getWitnessTable(&unk_100048534, &type metadata for SettingsEventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D018);
  }
  return result;
}

uint64_t sub_10001B0A8()
{
  _BYTE v1[24];

  if (qword_10005C508 != -1)
    swift_once(&qword_10005C508, sub_1000185A0);
  swift_beginAccess(&qword_10005DEA0, v1, 0, 0);
  return swift_bridgeObjectRetain(qword_10005DEA0);
}

uint64_t sub_10001B114(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001AED8();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10001B14C()
{
  return sub_10000A9CC(&qword_10005D020, &qword_10005D028, (uint64_t)&protocol conformance descriptor for [A]);
}

void sub_10001B178(_QWORD *a1@<X8>)
{
  *a1 = &off_100054E50;
}

unint64_t sub_10001B18C()
{
  unint64_t result;

  result = qword_10005D030;
  if (!qword_10005D030)
  {
    result = swift_getWitnessTable(&unk_100048834, &type metadata for SettingsEventsDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D030);
  }
  return result;
}

unint64_t sub_10001B1D4()
{
  unint64_t result;

  result = qword_10005D038;
  if (!qword_10005D038)
  {
    result = swift_getWitnessTable(&unk_100048B70, &type metadata for SettingsEventsDefaultAlertTimesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D038);
  }
  return result;
}

uint64_t sub_10001B218(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_10001B230, 0, 0);
}

uint64_t sub_10001B230()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  char v4;
  double v5;
  _BYTE *v6;

  v1 = objc_msgSend(objc_allocWithZone((Class)CUIKDefaultAlarmPreferences), "init");
  v2 = objc_msgSend(v1, "defaultTimedAlarmOffset");

  v3 = objc_msgSend(v2, "integerValue");
  if (v3 == (id)NSNotFound.getter())
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "doubleValue");
    v4 = sub_10001D1BC(v5);
  }
  v6 = *(_BYTE **)(v0 + 16);

  *v6 = v4;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001B2E8(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = *(_QWORD *)(a1 + 8);
  *(_BYTE *)(v2 + 32) = *a2;
  return swift_task_switch(sub_10001B30C, 0, 0);
}

uint64_t sub_10001B30C()
{
  uint64_t v0;
  void *v1;
  id v2;
  char v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  Class isa;

  AppDependency.wrappedValue.getter();
  v1 = *(void **)(v0 + 16);
  v2 = objc_msgSend(v1, "eventStore");
  swift_unknownObjectRelease(v1);
  if (v2)
  {
    v3 = *(_BYTE *)(v0 + 32);
    v4 = objc_msgSend(v2, "eventSources");
    v5 = objc_msgSend(objc_allocWithZone((Class)CUIKDefaultAlarmPreferences), "init");
    v6 = sub_10001836C(v3);
    v8 = v7;
    if (v6 == 0x7472656C416F6ELL && v7 == 0xE700000000000000)
    {
      v9 = swift_bridgeObjectRelease(0xE700000000000000);
    }
    else
    {
      v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v7, 0x7472656C416F6ELL, 0xE700000000000000, 0);
      v9 = swift_bridgeObjectRelease(v8);
      if ((v10 & 1) == 0)
        __asm { BR              X10 }
    }
    NSNotFound.getter(v9);
    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v5, "setDefaultAlarmOffset:forAlarmType:sources:", isa, 0, v4);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001B52C()
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
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  __int16 v19;
  _BYTE v20[16];

  v0 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v0);
  v2 = &v20[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v10);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v20[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000020, 0x800000010003EEA0);
  static Locale.current.getter(v17);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  v19 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimesEntityName", 41, 2, v12, 0, 0, v9, v6, "Name of the SettingsEventsDefaultAlertTimesEntity type", 54, v19);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v2, 1, 1, v13);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v16, v2);
}

uint64_t sub_10001B738@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v32 = a1;
  v1 = sub_100007E00(&qword_10005D190);
  __chkstk_darwin(v1);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v4);
  v31 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Locale(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for LocalizedStringResource(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v30 - v21;
  v23 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000020, 0x800000010003EEA0);
  static Locale.current.getter(v23);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimesEntityName", 41, 2, v15, 0, 0, v12, v9, "Name of the SettingsEventsDefaultAlertTimesEntity type", 54, 2);
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v25 = v31;
  v24(v31, 1, 1, v16);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v26 = type metadata accessor for DisplayRepresentation.Image(0);
  v27 = sub_100007F0C(v26, (uint64_t)qword_10005DF80);
  v28 = *(_QWORD *)(v26 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v3, v27, v26);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v3, 0, 1, v26);
  LocalizedStringResource.init(stringLiteral:)(0xD0000000000000C3, 0x800000010003EFD0);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v22, v25, v3, &_swiftEmptyArrayStorage, v20);
}

uint64_t sub_10001BA44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  _OWORD v7[2];
  uint64_t v8;

  sub_100007E00(&qword_10005D160);
  v0 = type metadata accessor for AppDependencyManager(0);
  memset(v7, 0, sizeof(v7));
  v8 = 0;
  v5 = static AppDependencyManager.shared.getter(v0, v1, v2, v3, v4);
  result = AppDependency.__allocating_init(key:manager:)(v7, v5);
  qword_10005DEA8 = result;
  return result;
}

uint64_t sub_10001BAA8()
{
  uint64_t v0;

  v0 = qword_10005CFB0;
  swift_bridgeObjectRetain(off_10005CFB8);
  return v0;
}

unint64_t sub_10001BAE0()
{
  unint64_t result;

  result = qword_10005D040;
  if (!qword_10005D040)
  {
    result = swift_getWitnessTable(&unk_10004888C, &type metadata for SettingsEventsDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D040);
  }
  return result;
}

unint64_t sub_10001BB28()
{
  unint64_t result;

  result = qword_10005D048;
  if (!qword_10005D048)
  {
    result = swift_getWitnessTable(&unk_1000488C4, &type metadata for SettingsEventsDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D048);
  }
  return result;
}

unint64_t sub_10001BB70()
{
  unint64_t result;

  result = qword_10005D050;
  if (!qword_10005D050)
  {
    result = swift_getWitnessTable(&unk_1000488F4, &type metadata for SettingsEventsDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D050);
  }
  return result;
}

unint64_t sub_10001BBB8()
{
  unint64_t result;

  result = qword_10005D058;
  if (!qword_10005D058)
  {
    result = swift_getWitnessTable(&unk_100048BE8, &type metadata for SettingsEventsDefaultAlertTimesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D058);
  }
  return result;
}

uint64_t sub_10001BBFC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  if (qword_10005C510 != -1)
    swift_once(&qword_10005C510, sub_10001BA44);
  v2 = qword_10005DEA8;
  *a1 = qword_10005DEA8;
  return swift_retain(v2);
}

unint64_t sub_10001BC50()
{
  unint64_t result;

  result = qword_10005D060;
  if (!qword_10005D060)
  {
    result = swift_getWitnessTable(&unk_10004892C, &type metadata for SettingsEventsDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D060);
  }
  return result;
}

unint64_t sub_10001BC98()
{
  unint64_t result;

  result = qword_10005D068;
  if (!qword_10005D068)
  {
    result = swift_getWitnessTable(&unk_100048954, &type metadata for SettingsEventsDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D068);
  }
  return result;
}

unint64_t sub_10001BCE0()
{
  unint64_t result;

  result = qword_10005D070;
  if (!qword_10005D070)
  {
    result = swift_getWitnessTable(&unk_10004897C, &type metadata for SettingsEventsDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D070);
  }
  return result;
}

unint64_t sub_10001BD28()
{
  unint64_t result;

  result = qword_10005D078;
  if (!qword_10005D078)
  {
    result = swift_getWitnessTable(&unk_1000489D4, &type metadata for SettingsEventsDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D078);
  }
  return result;
}

void sub_10001BD6C(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000027;
  a1[1] = 0x800000010003F0A0;
}

uint64_t sub_10001BD90()
{
  return sub_10000A9CC(&qword_10005D080, &qword_10005D088, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_10001BDBC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001B18C();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10001BDF8()
{
  unint64_t result;

  result = qword_10005D090;
  if (!qword_10005D090)
  {
    result = swift_getWitnessTable(&unk_100048A04, &type metadata for SettingsEventsDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D090);
  }
  return result;
}

uint64_t sub_10001BE40(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BD28();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10001BE7C()
{
  unint64_t result;

  result = qword_10005D098;
  if (!qword_10005D098)
  {
    result = swift_getWitnessTable(&unk_100048A9C, &type metadata for UpdateIntent_eventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D098);
  }
  return result;
}

uint64_t sub_10001BEC0()
{
  return sub_10000A9CC(&qword_10005D0A0, &qword_10005D0A8, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_10001BEEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v13;
  _BYTE v14[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_100007F24(v10, qword_10005DEB0);
  sub_100007F0C(v10, (uint64_t)qword_10005DEB0);
  v11 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000027, 0x800000010003EF50);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  v13 = 2;
  return LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("UpdateSettingsEventsDefaultAlertTimesIntent_title", 49, 2, v9, 0, 0, v6, v3, "Display string for the title of the UpdateSettingsEventsDefaultAlertTimesIntent", 79, v13);
}

uint64_t sub_10001C080()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100048DB0);
  qword_10005DEC8 = result;
  return result;
}

uint64_t sub_10001C0A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = type metadata accessor for MainActor(0);
  v3[9] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v3[10] = v5;
  v3[11] = v6;
  return swift_task_switch(sub_10001C114, v5, v6);
}

uint64_t sub_10001C114()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = v0[2];
  v0[4] = v1;
  v2 = v0[3];
  v0[12] = v1;
  v0[13] = v2;
  v0[5] = v2;
  IntentParameter.wrappedValue.getter(v0 + 17);
  if (qword_10005C520 != -1)
    swift_once(&qword_10005C520, sub_10001C080);
  v3 = qword_10005DEC8;
  v0[14] = qword_10005DEC8;
  v4 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v3);
  v5 = (_QWORD *)swift_task_alloc(v4);
  v0[15] = v5;
  v6 = sub_10000A9CC(&qword_10005D178, &qword_10005D180, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v5 = v0;
  v5[1] = sub_10001C210;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 17, v3, &type metadata for SettingsEventsDefaultAlertTimeType, v6);
}

uint64_t sub_10001C210()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v2 = *v1;
  v4 = *(_QWORD *)(*v1 + 112);
  v3 = *(_QWORD *)(*v1 + 120);
  v6 = *(_QWORD *)(*v1 + 96);
  v5 = *(_QWORD *)(*v1 + 104);
  *(_QWORD *)(*v1 + 128) = v0;
  swift_task_dealloc(v3);
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
  if (v0)
    v7 = sub_10001C2E0;
  else
    v7 = sub_10001C2A0;
  return swift_task_switch(v7, *(_QWORD *)(v2 + 80), *(_QWORD *)(v2 + 88));
}

uint64_t sub_10001C2A0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = swift_release(*(_QWORD *)(v0 + 72));
  static IntentResult.result<>()(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001C2E0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 72));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

double sub_10001C314@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  IntentParameter.wrappedValue.getter(&v3);
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_10001C34C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *a1;
  v2 = a1[1];
  v4[0] = v1;
  v4[1] = v2;
  swift_retain(v1);
  swift_retain(v2);
  IntentParameter.wrappedValue.setter(v4);
  swift_release(v2);
  return swift_release(v1);
}

uint64_t sub_10001C3A8()
{
  if (qword_10005C520 != -1)
    swift_once(&qword_10005C520, sub_10001C080);
  return swift_retain(qword_10005DEC8);
}

unint64_t sub_10001C3EC()
{
  unint64_t result;

  result = qword_10005D0B0;
  if (!qword_10005D0B0)
  {
    result = swift_getWitnessTable(&unk_100048B2C, &type metadata for UpdateIntent_eventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D0B0);
  }
  return result;
}

unint64_t sub_10001C434()
{
  unint64_t result;

  result = qword_10005D0B8;
  if (!qword_10005D0B8)
  {
    result = swift_getWitnessTable(&unk_100048B54, &type metadata for UpdateIntent_eventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D0B8);
  }
  return result;
}

uint64_t sub_10001C478(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000502D4, 1);
}

uint64_t sub_10001C488(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076D8(a1, a2, a3, (uint64_t (*)(void))sub_10001BE7C, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t sub_10001C49C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000773C(&qword_10005C518, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005DEB0, (uint64_t)sub_10001BEEC, a1);
}

uint64_t sub_10001C4C0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005D18C);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_100009170;
  return sub_10001C0A4(a1, v5, v4);
}

uint64_t sub_10001C524@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10001D5D4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10001C548(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BE7C();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10001C574()
{
  unint64_t result;

  result = qword_10005D0C8;
  if (!qword_10005D0C8)
  {
    result = swift_getWitnessTable(&unk_100048BB0, &type metadata for SettingsEventsDefaultAlertTimesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D0C8);
  }
  return result;
}

unint64_t sub_10001C5BC()
{
  unint64_t result;

  result = qword_10005D0D0[0];
  if (!qword_10005D0D0[0])
  {
    result = swift_getWitnessTable(&unk_1000487D4, &type metadata for SettingsEventsDefaultAlertTimesEntity);
    atomic_store(result, qword_10005D0D0);
  }
  return result;
}

uint64_t sub_10001C600(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v3;
  return swift_task_switch(sub_10001C61C, 0, 0);
}

uint64_t sub_10001C61C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = *(uint64_t **)(v0 + 24);
  AppDependency.wrappedValue.getter();
  *v1 = sub_10001D338(*(_QWORD *)(v0 + 16));
  v1[1] = v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001C660(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10001B1D4();
  *v4 = v2;
  v4[1] = sub_100009358;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10001C6CC()
{
  unint64_t result;

  result = qword_10005D0E8;
  if (!qword_10005D0E8)
  {
    result = swift_getWitnessTable(&unk_100048C40, &type metadata for SettingsEventsDefaultAlertTimesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D0E8);
  }
  return result;
}

unint64_t sub_10001C714()
{
  unint64_t result;

  result = qword_10005D0F0[0];
  if (!qword_10005D0F0[0])
  {
    result = swift_getWitnessTable(&unk_100048CA0, &type metadata for SettingsEventsDefaultAlertTimesEntityQuery);
    atomic_store(result, qword_10005D0F0);
  }
  return result;
}

uint64_t sub_10001C758@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _OWORD v9[2];
  uint64_t v10;

  sub_100007E00(&qword_10005D160);
  v2 = type metadata accessor for AppDependencyManager(0);
  memset(v9, 0, sizeof(v9));
  v10 = 0;
  v7 = static AppDependencyManager.shared.getter(v2, v3, v4, v5, v6);
  result = AppDependency.__allocating_init(key:manager:)(v9, v7);
  *a1 = result;
  return result;
}

uint64_t sub_10001C7C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10001B1D4();
  *v5 = v2;
  v5[1] = sub_1000094B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10001C830(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10001B1D4();
  *v4 = v2;
  v4[1] = sub_10000AB54;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10001C89C()
{
  unint64_t result;

  result = qword_10005D108;
  if (!qword_10005D108)
  {
    result = swift_getWitnessTable(&unk_100048CC8, &type metadata for SettingsEventsDefaultAlertTimesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D108);
  }
  return result;
}

unint64_t sub_10001C8E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005D110;
  if (!qword_10005D110)
  {
    v1 = sub_100007220(qword_10005D118);
    sub_10001BCE0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005D110);
  }
  return result;
}

uint64_t sub_10001C948(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10001BBB8();
  *v5 = v2;
  v5[1] = sub_10000AB50;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_eventsDefaultAlertTimeType()
{
  return &type metadata for UpdateIntent_eventsDefaultAlertTimeType;
}

ValueMetadata *type metadata accessor for SettingsEventsDefaultAlertTimesEntityQuery()
{
  return &type metadata for SettingsEventsDefaultAlertTimesEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsEventsDefaultAlertTimesEntity()
{
  return &type metadata for SettingsEventsDefaultAlertTimesEntity;
}

uint64_t getEnumTagSinglePayload for SettingsEventsDefaultAlertTimeType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SettingsEventsDefaultAlertTimeType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10001CAD0 + 4 * byte_100048505[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_10001CB04 + 4 * byte_100048500[v4]))();
}

uint64_t sub_10001CB04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001CB0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001CB14);
  return result;
}

uint64_t sub_10001CB20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001CB28);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_10001CB2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001CB34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SettingsEventsDefaultAlertTimeType()
{
  return &type metadata for SettingsEventsDefaultAlertTimeType;
}

uint64_t sub_10001CB50@<X0>(uint64_t a1@<X8>)
{
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
  id v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t KeyPath;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t OpaqueTypeConformance2;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  Swift::String v45;

  v42 = a1;
  v1 = type metadata accessor for ControlSize(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00((uint64_t *)&unk_10005D1B0);
  v37 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007E00(&qword_10005CC68);
  v8 = *(_QWORD *)(v7 - 8);
  v38 = v7;
  v39 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100007E00(&qword_10005D1C0);
  v12 = *(_QWORD *)(v11 - 8);
  v40 = v11;
  v41 = v12;
  __chkstk_darwin(v11);
  v36 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v15._countAndFlagsBits = 0xD000000000000020;
  v45._countAndFlagsBits = 0xD000000000000036;
  v45._object = (void *)0x800000010003EED0;
  v15._object = (void *)0x800000010003EEA0;
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  v17 = NSLocalizedString(_:tableName:bundle:value:comment:)(v15, (Swift::String_optional)0, (NSBundle)v14, v16, v45);

  KeyPath = swift_getKeyPath(&unk_100048DB0);
  static ControlSize._1x1.getter();
  v19 = sub_10001AF54();
  v20 = sub_10001DBB4();
  v21 = sub_10001C5BC();
  ControlPicker.init<A, B, C, D, E, F, G>(kind:displayName:preferredSize:intentUpdatableProperty:title:value:affordances:)(0xD00000000000002ALL, 0x8000000100040B70, v17._countAndFlagsBits, v17._object, v3, KeyPath, sub_10001CECC, 0, sub_10001D084, 0, sub_10001D108, 0, &type metadata for Text, &type metadata for Text, v19, v20, v21, &protocol witness table for Text, &protocol witness table for Text);
  v22 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000017, 0x8000000100040BA0);
  v24 = v23;
  LOBYTE(v20) = v25;
  v27 = v26;
  v28 = sub_10000A9CC(&qword_10005D1D0, (uint64_t *)&unk_10005D1B0, (uint64_t)&protocol conformance descriptor for ControlPicker<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v22, v24, v20 & 1, v27, v4, v28);
  swift_bridgeObjectRelease(v27);
  swift_bridgeObjectRelease(v24);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v6, v4);
  v43 = v4;
  v44 = v28;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v43, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v30 = v36;
  v31 = v38;
  WidgetConfiguration.disablesControlStateCaching()(v38, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v31);
  v43 = v31;
  v44 = OpaqueTypeConformance2;
  v32 = swift_getOpaqueTypeConformance2(&v43, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v33 = v40;
  WidgetConfiguration.hiddenControl()(v40, v32);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v30, v33);
}

uint64_t sub_10001CECC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  char v15;
  uint64_t v16;
  __int16 v17;
  _BYTE v18[16];

  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = &v18[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin();
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000020, 0x800000010003EEA0);
  static Locale.current.getter(v12);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  v17 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimesEntityName", 41, 2, v9, 0, 0, v7, v5, "Name of the SettingsEventsDefaultAlertTimesEntity type", 54, v17);
  result = Text.init(_:)(v11);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v14;
  *(_BYTE *)(a1 + 16) = v15 & 1;
  *(_QWORD *)(a1 + 24) = v16;
  return result;
}

uint64_t sub_10001D084@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v4 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001A910(*a1, (uint64_t)v6);
  result = Text.init(_:)(v6);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v8;
  *(_BYTE *)(a2 + 16) = v9 & 1;
  *(_QWORD *)(a2 + 24) = v10;
  return result;
}

uint64_t sub_10001D108(unsigned __int8 *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001A910(*a1, (uint64_t)v4);
  v5 = Text.init(_:)(v4);
  return ControlAffordances.init(tint:status:actionHint:)(0, v5, v7, v6 & 1, v8, 0, 0, 0, 0);
}

uint64_t sub_10001D1BC(double a1)
{
  int v3;
  unsigned int v4;

  if ((double)NSNotFound.getter() == a1)
    return 0;
  if (a1 == 0.0)
    return 1;
  if (a1 == -300.0)
    return 2;
  if (a1 == -600.0)
    return 3;
  if (a1 == -900.0)
    return 4;
  if (a1 == -1800.0)
    return 5;
  if (a1 == -3600.0)
    return 6;
  if (a1 == -7200.0)
    return 7;
  if (a1 == -572400.0)
    v3 = 10;
  else
    v3 = 0;
  if (a1 == -172800.0)
    v4 = 9;
  else
    v4 = v3;
  if (a1 == -86400.0)
    return 8;
  else
    return v4;
}

unint64_t sub_10001D2F0(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100054D28, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 0xB)
    return 11;
  else
    return v3;
}

uint64_t sub_10001D338(uint64_t a1)
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
  char *v14;
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
  _OWORD v27[2];
  uint64_t v28;

  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v12);
  v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007E00(&qword_10005D0A8);
  v15 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000020, 0x800000010003EEA0);
  static Locale.current.getter(v15);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsEventsDefaultAlertTimesEntityName", 41, 2, v11, 0, 0, v8, v5, "Name of the SettingsEventsDefaultAlertTimesEntity type", 54, 2);
  v16 = sub_10000A9CC(&qword_10005D178, &qword_10005D180, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v17 = sub_10001AF54();
  v18 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v14, &unk_10005D168, 0, &unk_10005D170, 0, &type metadata for UpdateIntent_eventsDefaultAlertTimeType, v16, v17);
  sub_100007E00(&qword_10005D160);
  type metadata accessor for AppDependencyManager(0);
  memset(v27, 0, sizeof(v27));
  v28 = 0;
  v19 = swift_retain(v18);
  v24 = static AppDependencyManager.shared.getter(v19, v20, v21, v22, v23);
  v25 = AppDependency.__allocating_init(key:manager:)(v27, v24);
  *(_QWORD *)&v27[0] = a1;
  swift_retain(v18);
  swift_retain(v25);
  swift_unknownObjectRetain(a1);
  AppDependency.wrappedValue.setter(v27);
  swift_release(v25);
  swift_release_n(v18, 2);
  swift_unknownObjectRelease(a1);
  return v18;
}

uint64_t sub_10001D5D4()
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
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_BYTE *, uint64_t, uint64_t);
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  void (*v29)(_BYTE *, uint64_t, uint64_t, uint64_t);
  _BYTE *v30;
  _BYTE *v31;
  _BYTE *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v38;
  uint64_t v39;
  _BYTE *v40;
  _BYTE *v41;
  _BYTE *v42;
  _BYTE *v43;
  unint64_t v44;
  __int16 v46;
  int v47;
  int v48;
  int v49;
  _BYTE v50[4];
  unsigned int v51;
  uint64_t v52;
  void (*v53)(_BYTE *, uint64_t, uint64_t);
  unsigned int v54;
  void (*v55)(_BYTE *);
  uint64_t v56;
  void (*v57)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  _BYTE *v61;
  _BYTE *v62;
  _BYTE *v63;
  _BYTE *v64;
  uint64_t v65;
  _QWORD v66[4];

  v65 = type metadata accessor for InputConnectionBehavior(0);
  v60 = *(_QWORD *)(v65 - 8);
  __chkstk_darwin(v65);
  v64 = &v50[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v1 = sub_100007E00((uint64_t *)&unk_10005D140);
  v2 = __chkstk_darwin(v1);
  v63 = &v50[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  v62 = &v50[-v4];
  v5 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v5);
  v61 = &v50[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v50[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = type metadata accessor for Locale(0);
  __chkstk_darwin(v11);
  v13 = &v50[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v14);
  v16 = &v50[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = type metadata accessor for LocalizedStringResource(0);
  v18 = *(_QWORD *)(v17 - 8);
  v58 = v17;
  v19 = __chkstk_darwin(v17);
  v59 = &v50[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v19);
  v22 = &v50[-v21];
  v56 = sub_100007E00(&qword_10005D150);
  v23 = String.LocalizationValue.init(stringLiteral:)(0x746567726154, 0xE600000000000000);
  static Locale.current.getter(v23);
  v24 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v25 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 104);
  v51 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v52 = v7;
  v25(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  v53 = v25;
  v46 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target", 6, 2, v16, 0, 0, v13, v10, "Calendar settings entity title that indicates which setting the user would like to target.", 90, v46);
  v26 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x800000010003B560);
  static Locale.current.getter(v26);
  v25(v10, v24, v7);
  LOWORD(v47) = 2;
  v27 = v61;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target_description", 18, 2, v16, 0, 0, v13, v10, "Description for the Calendar settings entity parameter that indicates which setting the user would like to target.", 114, v47);
  v57 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v18 + 56);
  v57(v27, 0, 1, v17);
  v28 = type metadata accessor for IntentDialog(0);
  v66[0] = 0;
  v66[1] = 0;
  v29 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56);
  v30 = v62;
  v29(v62, 1, 1, v28);
  v31 = v63;
  v29(v63, 1, 1, v28);
  v54 = enum case for InputConnectionBehavior.default(_:);
  v55 = *(void (**)(_BYTE *))(v60 + 104);
  v32 = v64;
  v55(v64);
  v33 = sub_10001B18C();
  v60 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v22, v27, v66, v30, v31, v32, v33);
  v56 = sub_100007E00(&qword_10005D158);
  v34 = String.LocalizationValue.init(stringLiteral:)(0x65756C6156, 0xE500000000000000);
  static Locale.current.getter(v34);
  v35 = v51;
  v36 = v52;
  v37 = v53;
  v53(v10, v51, v52);
  LOWORD(v48) = 2;
  v38 = v59;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value", 5, 2, v16, 0, 0, v13, v10, "Calendar settings property title that indicates which property of a setting the user would like to set to as the value.", 119, v48);
  v39 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000026, 0x800000010003B6A0);
  static Locale.current.getter(v39);
  v37(v10, v35, v36);
  LOWORD(v49) = 2;
  v40 = v61;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value_description", 17, 2, v16, 0, 0, v13, v10, "Description for a Calendar settings property parameter that indicates which value of a setting the user would like to set to.", 125, v49);
  v57(v40, 0, 1, v58);
  LOBYTE(v66[0]) = 11;
  v41 = v62;
  v29(v62, 1, 1, v28);
  v42 = v63;
  v29(v63, 1, 1, v28);
  v43 = v64;
  ((void (*)(_BYTE *, _QWORD, uint64_t))v55)(v64, v54, v65);
  v44 = sub_10001AF54();
  IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v38, v40, v66, v41, v42, v43, &off_100054E50, v44);
  return v60;
}

uint64_t sub_10001DB88@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

ValueMetadata *type metadata accessor for SettingsEventsDefaultAlertTimesPickerControl()
{
  return &type metadata for SettingsEventsDefaultAlertTimesPickerControl;
}

uint64_t sub_10001DBA4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100050318, 1);
}

unint64_t sub_10001DBB4()
{
  unint64_t result;

  result = qword_10005D1C8;
  if (!qword_10005D1C8)
  {
    result = swift_getWitnessTable(&unk_1000485EC, &type metadata for SettingsEventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D1C8);
  }
  return result;
}

uint64_t sub_10001DBF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_100007220(&qword_10005D1C0);
  v1 = sub_100007220(&qword_10005CC68);
  v5 = sub_100007220((uint64_t *)&unk_10005D1B0);
  v6 = sub_10000A9CC(&qword_10005D1D0, (uint64_t *)&unk_10005D1B0, (uint64_t)&protocol conformance descriptor for ControlPicker<A>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v5 = v1;
  v6 = OpaqueTypeConformance2;
  v3 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v5 = v0;
  v6 = v3;
  return swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.hiddenControl()>>, 1);
}

uint64_t sub_10001DCB8(uint64_t a1)
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
  void (*v20)(char *);
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  void (*v23)(char *, uint64_t);
  void (*v24)(char *, uint64_t);
  Swift::String v25;
  char *v26;
  Swift::String v27;
  uint64_t v28;
  Swift::String v29;
  uint64_t v30;
  uint64_t v31;
  Swift::String v32;
  void (*v33)(char *, uint64_t);
  char *v34;
  Swift::String v35;
  uint64_t v36;
  uint64_t v37;
  Swift::String v38;
  uint64_t v39;
  Swift::String v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v47[2];
  void (*v48)(char *, uint64_t);
  void (*v49)(char *);
  unsigned int v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;

  v47[1] = a1;
  v57 = sub_100007E00(&qword_10005D320);
  v52 = *(_QWORD *)(v57 - 8);
  __chkstk_darwin(v57);
  v51 = (char *)v47 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100007E00(&qword_10005D328);
  v7 = __chkstk_darwin(v6);
  v53 = (char *)v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)v47 - v10;
  __chkstk_darwin(v9);
  v13 = (char *)v47 - v12;
  v14 = sub_1000236DC();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(34, 2, &type metadata for UpdateIntent_alternateCalendarType, v14);
  v15._countAndFlagsBits = 0xD00000000000001ELL;
  v15._object = (void *)0x80000001000413A0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  KeyPath = swift_getKeyPath(&unk_100049150);
  v56 = sub_100023A68();
  v17 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v56);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v17, v6);
  swift_release(v17);
  v18._countAndFlagsBits = 544106784;
  v18._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v18);
  v19 = v3;
  v20 = *(void (**)(char *))(v3 + 104);
  v21 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v50 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v55 = v2;
  v20(v5);
  v22 = (void (*)(char *, uint64_t, uint64_t))v20;
  v49 = v20;
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v23 = *(void (**)(char *, uint64_t))(v19 + 8);
  v23(v5, v2);
  v24 = v23;
  v48 = v23;
  v25._countAndFlagsBits = 0;
  v25._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v25);
  v26 = v51;
  _AssistantIntent.Phrase.init(stringInterpolation:)(v13, &type metadata for UpdateIntent_alternateCalendarType, v14);
  v54 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v26, &type metadata for UpdateIntent_alternateCalendarType, v14);
  v47[0] = *(_QWORD *)(v52 + 8);
  ((void (*)(char *, uint64_t))v47[0])(v26, v57);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(29, 2, &type metadata for UpdateIntent_alternateCalendarType, v14);
  v27._countAndFlagsBits = 2125385;
  v27._object = (void *)0xE300000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  v28 = v55;
  v22(v5, v21, v55);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v24(v5, v28);
  v29._countAndFlagsBits = 0x20776F6853202CLL;
  v29._object = (void *)0xE700000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v29);
  v30 = swift_getKeyPath(&unk_100049150);
  v31 = _AssistantIntent.IntentProjection.subscript.getter(v30, v56);
  swift_release(v30);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v31, v6);
  swift_release(v31);
  v32._object = (void *)0x80000001000413C0;
  v32._countAndFlagsBits = 0xD000000000000013;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v32);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v11, &type metadata for UpdateIntent_alternateCalendarType, v14);
  v52 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v26, &type metadata for UpdateIntent_alternateCalendarType, v14);
  v33 = (void (*)(char *, uint64_t))v47[0];
  ((void (*)(char *, uint64_t))v47[0])(v26, v57);
  v34 = v53;
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(35, 2, &type metadata for UpdateIntent_alternateCalendarType, v14);
  v35._countAndFlagsBits = 0x7420656C62616E45;
  v35._object = (void *)0xEB00000000206568;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v35);
  v36 = swift_getKeyPath(&unk_100049150);
  v37 = _AssistantIntent.IntentProjection.subscript.getter(v36, v56);
  swift_release(v36);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v37, v6);
  swift_release(v37);
  v38._countAndFlagsBits = 0xD000000000000018;
  v38._object = (void *)0x80000001000413E0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v38);
  v39 = v55;
  ((void (*)(char *, _QWORD, uint64_t))v49)(v5, v50, v55);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v48(v5, v39);
  v40._countAndFlagsBits = 0;
  v40._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v40);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v34, &type metadata for UpdateIntent_alternateCalendarType, v14);
  v41 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v26, &type metadata for UpdateIntent_alternateCalendarType, v14);
  v33(v26, v57);
  v42 = sub_100007E00(&qword_10005D330);
  v43 = swift_allocObject(v42, 56, 7);
  *(_OWORD *)(v43 + 16) = xmmword_1000484F0;
  v44 = v52;
  *(_QWORD *)(v43 + 32) = v54;
  *(_QWORD *)(v43 + 40) = v44;
  *(_QWORD *)(v43 + 48) = v41;
  v45 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v43);
  return v45;
}

uint64_t sub_10001E208(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_100049150, (uint64_t (*)(void))sub_100023A68, (uint64_t (*)(uint64_t))sub_1000236DC, (uint64_t)sub_10001E22C);
}

uint64_t sub_10001E22C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x776572626548, 0xE600000000000000);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6573656E696843, 0xE700000000000000);
  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x69726A6948, 0xE500000000000000);
  v3 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000011, 0x8000000100041380);
  v4 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(6710863, 0xE300000000000000);
  v5 = sub_100007E00(&qword_10005D218);
  v6 = swift_allocObject(v5, 72, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100047360;
  *(_QWORD *)(v6 + 32) = v0;
  *(_QWORD *)(v6 + 40) = v1;
  *(_QWORD *)(v6 + 48) = v2;
  *(_QWORD *)(v6 + 56) = v3;
  *(_QWORD *)(v6 + 64) = v4;
  v7 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v6);
  return v7;
}

uint64_t sub_10001E31C()
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
  _BYTE *v9;
  unint64_t v10;
  Swift::String v11;
  void (*v12)(_BYTE *, uint64_t);
  Swift::String v13;
  void (*v14)(_BYTE *, uint64_t);
  uint64_t v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v23[4];
  unsigned int v24;
  void (*v25)(_BYTE *);
  uint64_t v26;
  uint64_t v27;

  v27 = sub_100007E00(&qword_10005D320);
  v0 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v2 = &v23[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_100007E00(&qword_10005D328);
  __chkstk_darwin(v7);
  v9 = &v23[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_1000236DC();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(34, 1, &type metadata for UpdateIntent_alternateCalendarType, v10);
  v11._countAndFlagsBits = 0xD000000000000022;
  v11._object = (void *)0x8000000100041330;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  v24 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v25 = *(void (**)(_BYTE *))(v4 + 104);
  v25(v6);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v12 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v12(v6, v3);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v13);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for UpdateIntent_alternateCalendarType, v10);
  v26 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_alternateCalendarType, v10);
  v14 = *(void (**)(_BYTE *, uint64_t))(v0 + 8);
  v15 = v27;
  v14(v2, v27);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(31, 1, &type metadata for UpdateIntent_alternateCalendarType, v10);
  v16._object = (void *)0x8000000100041360;
  v16._countAndFlagsBits = 0xD00000000000001FLL;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v16);
  ((void (*)(_BYTE *, _QWORD, uint64_t))v25)(v6, v24, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v12(v6, v3);
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for UpdateIntent_alternateCalendarType, v10);
  v18 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_alternateCalendarType, v10);
  v14(v2, v15);
  v19 = sub_100007E00(&qword_10005D330);
  v20 = swift_allocObject(v19, 48, 7);
  *(_OWORD *)(v20 + 16) = xmmword_100047370;
  *(_QWORD *)(v20 + 32) = v26;
  *(_QWORD *)(v20 + 40) = v18;
  v21 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v20);
  return v21;
}

uint64_t sub_10001E5D8(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_100049150, (uint64_t (*)(void))sub_100023A68, (uint64_t (*)(uint64_t))sub_1000236DC, (uint64_t)sub_10001E720);
}

uint64_t sub_10001E5FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(uint64_t), uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t KeyPath;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v9 = type metadata accessor for _AssistantIntent.Value(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(a2);
  v14 = a3();
  v15 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v14);
  v16 = swift_release(KeyPath);
  v17 = a4(v16);
  _AssistantIntent.Value.init<A>(for:builder:)(v15, a5, 0, v17);
  v18 = static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)(v12);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v19 = sub_100007E00(&qword_10005D210);
  v20 = swift_allocObject(v19, 40, 7);
  *(_OWORD *)(v20 + 16) = xmmword_1000484B0;
  *(_QWORD *)(v20 + 32) = v18;
  v21 = static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v20);
  return v21;
}

uint64_t sub_10001E720()
{
  return sub_100022EB8(6710863, 0xE300000000000000);
}

uint64_t sub_10001E730()
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
  _BYTE *v9;
  unint64_t v10;
  Swift::String v11;
  void (*v12)(_BYTE *, uint64_t);
  Swift::String v13;
  void (*v14)(_BYTE *, uint64_t);
  uint64_t v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v23[4];
  unsigned int v24;
  void (*v25)(_BYTE *);
  uint64_t v26;
  uint64_t v27;

  v27 = sub_100007E00(&qword_10005D300);
  v0 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v2 = &v23[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_100007E00(&qword_10005D308);
  __chkstk_darwin(v7);
  v9 = &v23[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_10000B580();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(21, 1, &type metadata for UpdateIntent_showWeekNumbers, v10);
  v11._object = (void *)0x80000001000412F0;
  v11._countAndFlagsBits = 0xD000000000000015;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  v24 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v25 = *(void (**)(_BYTE *))(v4 + 104);
  v25(v6);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v12 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v12(v6, v3);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v13);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for UpdateIntent_showWeekNumbers, v10);
  v26 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_showWeekNumbers, v10);
  v14 = *(void (**)(_BYTE *, uint64_t))(v0 + 8);
  v15 = v27;
  v14(v2, v27);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(23, 1, &type metadata for UpdateIntent_showWeekNumbers, v10);
  v16._countAndFlagsBits = 0xD000000000000017;
  v16._object = (void *)0x8000000100041310;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v16);
  ((void (*)(_BYTE *, _QWORD, uint64_t))v25)(v6, v24, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v12(v6, v3);
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for UpdateIntent_showWeekNumbers, v10);
  v18 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_showWeekNumbers, v10);
  v14(v2, v15);
  v19 = sub_100007E00(&qword_10005D310);
  v20 = swift_allocObject(v19, 48, 7);
  *(_OWORD *)(v20 + 16) = xmmword_100047370;
  *(_QWORD *)(v20 + 32) = v26;
  *(_QWORD *)(v20 + 40) = v18;
  v21 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v20);
  return v21;
}

uint64_t sub_10001E9F0(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_100049128, (uint64_t (*)(void))sub_100023838, (uint64_t (*)(uint64_t))sub_10000B580, (uint64_t)sub_10001EA14);
}

uint64_t sub_10001EA14()
{
  return sub_100022EB8(1702195796, 0xE400000000000000);
}

uint64_t sub_10001EA24()
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
  _BYTE *v9;
  unint64_t v10;
  Swift::String v11;
  void (*v12)(_BYTE *, uint64_t);
  Swift::String v13;
  void (*v14)(_BYTE *, uint64_t);
  uint64_t v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v23[4];
  unsigned int v24;
  void (*v25)(_BYTE *);
  uint64_t v26;
  uint64_t v27;

  v27 = sub_100007E00(&qword_10005D300);
  v0 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v2 = &v23[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_100007E00(&qword_10005D308);
  __chkstk_darwin(v7);
  v9 = &v23[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_10000B580();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(21, 1, &type metadata for UpdateIntent_showWeekNumbers, v10);
  v11._object = (void *)0x80000001000412B0;
  v11._countAndFlagsBits = 0xD000000000000015;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  v24 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v25 = *(void (**)(_BYTE *))(v4 + 104);
  v25(v6);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v12 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v12(v6, v3);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v13);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for UpdateIntent_showWeekNumbers, v10);
  v26 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_showWeekNumbers, v10);
  v14 = *(void (**)(_BYTE *, uint64_t))(v0 + 8);
  v15 = v27;
  v14(v2, v27);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(24, 1, &type metadata for UpdateIntent_showWeekNumbers, v10);
  v16._countAndFlagsBits = 0xD000000000000018;
  v16._object = (void *)0x80000001000412D0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v16);
  ((void (*)(_BYTE *, _QWORD, uint64_t))v25)(v6, v24, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v12(v6, v3);
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for UpdateIntent_showWeekNumbers, v10);
  v18 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_showWeekNumbers, v10);
  v14(v2, v15);
  v19 = sub_100007E00(&qword_10005D310);
  v20 = swift_allocObject(v19, 48, 7);
  *(_OWORD *)(v20 + 16) = xmmword_100047370;
  *(_QWORD *)(v20 + 32) = v26;
  *(_QWORD *)(v20 + 40) = v18;
  v21 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v20);
  return v21;
}

uint64_t sub_10001ECE4(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_100049128, (uint64_t (*)(void))sub_100023838, (uint64_t (*)(uint64_t))sub_10000B580, (uint64_t)sub_10001ED08);
}

uint64_t sub_10001ED08()
{
  return sub_100022EB8(0x65736C6146, 0xE500000000000000);
}

uint64_t sub_10001ED1C()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  Swift::String v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t);
  Swift::String v13;
  uint64_t v14;
  Swift::String v15;
  void (*v16)(char *, _QWORD, uint64_t);
  Swift::String v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  Swift::String v20;
  Swift::String v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v28)(char *, uint64_t);
  unsigned int v29;
  void (*v30)(char *, _QWORD, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v33 = sub_100007E00(&qword_10005D2E8);
  v31 = *(_QWORD *)(v33 - 8);
  __chkstk_darwin(v33);
  v1 = (char *)&v28 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100007E00(&qword_10005D2F0);
  __chkstk_darwin(v6);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100023720();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(25, 1, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v10._object = (void *)0x8000000100041240;
  v10._countAndFlagsBits = 0xD000000000000019;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v10);
  v11 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v30 = *(void (**)(char *, _QWORD, uint64_t))(v3 + 104);
  v29 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v30(v5, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v2);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v12 = *(void (**)(char *, uint64_t))(v3 + 8);
  v12(v5, v2);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v13);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v8, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v32 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v1, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v28 = *(void (**)(char *, uint64_t))(v31 + 8);
  v14 = v33;
  v28(v1, v33);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(27, 1, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v15._countAndFlagsBits = 0xD00000000000001BLL;
  v15._object = (void *)0x8000000100041260;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  v16 = v30;
  v30(v5, v11, v2);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v12(v5, v2);
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v8, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v31 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v1, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v18 = v14;
  v19 = v28;
  v28(v1, v18);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(35, 1, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v20._countAndFlagsBits = 0xD000000000000023;
  v20._object = (void *)0x8000000100041280;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  v16(v5, v29, v2);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v12(v5, v2);
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v21);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v8, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v22 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v1, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v19(v1, v33);
  v23 = sub_100007E00(&qword_10005D2F8);
  v24 = swift_allocObject(v23, 56, 7);
  *(_OWORD *)(v24 + 16) = xmmword_1000484F0;
  v25 = v31;
  *(_QWORD *)(v24 + 32) = v32;
  *(_QWORD *)(v24 + 40) = v25;
  *(_QWORD *)(v24 + 48) = v22;
  v26 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v24);
  return v26;
}

uint64_t sub_10001F0A8(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_100049100, (uint64_t (*)(void))sub_100023838, (uint64_t (*)(uint64_t))sub_100023720, (uint64_t)sub_10001EA14);
}

uint64_t sub_10001F0CC()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  Swift::String v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t);
  Swift::String v13;
  uint64_t v14;
  Swift::String v15;
  void (*v16)(char *, _QWORD, uint64_t);
  Swift::String v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  Swift::String v20;
  Swift::String v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v28)(char *, uint64_t);
  unsigned int v29;
  void (*v30)(char *, _QWORD, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v33 = sub_100007E00(&qword_10005D2E8);
  v31 = *(_QWORD *)(v33 - 8);
  __chkstk_darwin(v33);
  v1 = (char *)&v28 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100007E00(&qword_10005D2F0);
  __chkstk_darwin(v6);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100023720();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(25, 1, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v10._object = (void *)0x80000001000411D0;
  v10._countAndFlagsBits = 0xD000000000000019;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v10);
  v11 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v30 = *(void (**)(char *, _QWORD, uint64_t))(v3 + 104);
  v29 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v30(v5, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v2);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v12 = *(void (**)(char *, uint64_t))(v3 + 8);
  v12(v5, v2);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v13);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v8, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v32 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v1, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v28 = *(void (**)(char *, uint64_t))(v31 + 8);
  v14 = v33;
  v28(v1, v33);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(28, 1, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v15._countAndFlagsBits = 0xD00000000000001CLL;
  v15._object = (void *)0x80000001000411F0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  v16 = v30;
  v30(v5, v11, v2);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v12(v5, v2);
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v8, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v31 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v1, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v18 = v14;
  v19 = v28;
  v28(v1, v18);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(41, 1, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v20._countAndFlagsBits = 0xD000000000000029;
  v20._object = (void *)0x8000000100041210;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  v16(v5, v29, v2);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v5, v6);
  v12(v5, v2);
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v21);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v8, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v22 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v1, &type metadata for UpdateIntent_showInviteeDeclines, v9);
  v19(v1, v33);
  v23 = sub_100007E00(&qword_10005D2F8);
  v24 = swift_allocObject(v23, 56, 7);
  *(_OWORD *)(v24 + 16) = xmmword_1000484F0;
  v25 = v31;
  *(_QWORD *)(v24 + 32) = v32;
  *(_QWORD *)(v24 + 40) = v25;
  *(_QWORD *)(v24 + 48) = v22;
  v26 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v24);
  return v26;
}

uint64_t sub_10001F458(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_100049100, (uint64_t (*)(void))sub_100023838, (uint64_t (*)(uint64_t))sub_100023720, (uint64_t)sub_10001ED08);
}

uint64_t sub_10001F47C()
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

  v0 = sub_100007E00(&qword_10005D2D0);
  v39 = *(_QWORD *)(v0 - 8);
  v40 = v0;
  __chkstk_darwin(v0);
  v2 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007E00(&qword_10005D2D8);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v34 - v11;
  v13 = sub_10001157C();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(32, 1, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v14._countAndFlagsBits = 544499027;
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
  v17._object = (void *)0x8000000100041150;
  v17._countAndFlagsBits = 0xD00000000000001CLL;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v12, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v41 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v18 = v40;
  v35 = *(void (**)(char *, uint64_t))(v39 + 8);
  v35(v2, v40);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(35, 1, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v19._countAndFlagsBits = 0xD000000000000023;
  v19._object = (void *)0x8000000100041170;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v19);
  v20 = v15;
  v21 = v38;
  v38(v6, v20, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v16(v6, v3);
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v22);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v39 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v23 = v18;
  v24 = v18;
  v25 = v35;
  v35(v2, v23);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(36, 1, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v26._countAndFlagsBits = 0xD000000000000024;
  v26._object = (void *)0x80000001000411A0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v26);
  v21(v6, v37, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v36(v6, v3);
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v28 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v25(v2, v24);
  v29 = sub_100007E00(&qword_10005D2E0);
  v30 = swift_allocObject(v29, 56, 7);
  *(_OWORD *)(v30 + 16) = xmmword_1000484F0;
  v31 = v39;
  *(_QWORD *)(v30 + 32) = v41;
  *(_QWORD *)(v30 + 40) = v31;
  *(_QWORD *)(v30 + 48) = v28;
  v32 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v30);
  return v32;
}

uint64_t sub_10001F83C(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_1000490D8, (uint64_t (*)(void))sub_100023838, (uint64_t (*)(uint64_t))sub_10001157C, (uint64_t)sub_10001EA14);
}

uint64_t sub_10001F860()
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

  v0 = sub_100007E00(&qword_10005D2D0);
  v39 = *(_QWORD *)(v0 - 8);
  v40 = v0;
  __chkstk_darwin(v0);
  v2 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007E00(&qword_10005D2D8);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v34 - v11;
  v13 = sub_10001157C();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(36, 1, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v14._countAndFlagsBits = 544499027;
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
  v17._object = (void *)0x80000001000410C0;
  v17._countAndFlagsBits = 0xD000000000000020;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v12, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v41 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v18 = v40;
  v35 = *(void (**)(char *, uint64_t))(v39 + 8);
  v35(v2, v40);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(39, 1, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v19._countAndFlagsBits = 0xD000000000000027;
  v19._object = (void *)0x80000001000410F0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v19);
  v20 = v15;
  v21 = v38;
  v38(v6, v20, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v16(v6, v3);
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v22);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v39 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v23 = v18;
  v24 = v18;
  v25 = v35;
  v35(v2, v23);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(37, 1, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v26._countAndFlagsBits = 0xD000000000000025;
  v26._object = (void *)0x8000000100041120;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v26);
  v21(v6, v37, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v36(v6, v3);
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v28 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_weekViewStartsOnToday, v13);
  v25(v2, v24);
  v29 = sub_100007E00(&qword_10005D2E0);
  v30 = swift_allocObject(v29, 56, 7);
  *(_OWORD *)(v30 + 16) = xmmword_1000484F0;
  v31 = v39;
  *(_QWORD *)(v30 + 32) = v41;
  *(_QWORD *)(v30 + 40) = v31;
  *(_QWORD *)(v30 + 48) = v28;
  v32 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v30);
  return v32;
}

uint64_t sub_10001FC24(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_1000490D8, (uint64_t (*)(void))sub_100023838, (uint64_t (*)(uint64_t))sub_10001157C, (uint64_t)sub_10001ED08);
}

uint64_t sub_10001FC48(uint64_t a1)
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
  unint64_t v11;
  Swift::String v12;
  uint64_t KeyPath;
  uint64_t v14;
  Swift::String v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  Swift::String v21;
  char *v22;
  Swift::String v23;
  Swift::String v24;
  uint64_t v25;
  uint64_t v26;
  Swift::String v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;

  v38 = a1;
  v41 = sub_100007E00(&qword_10005D2B8);
  v39 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v40 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v2 = *(_QWORD *)(v35 - 8);
  __chkstk_darwin(v35);
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100007E00(&qword_10005D2C0);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v34 - v9;
  v11 = sub_10000F0A0();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(9, 2, &type metadata for UpdateIntent_syncDurationType, v11);
  v12._countAndFlagsBits = 0x20636E7953;
  v12._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v12);
  KeyPath = swift_getKeyPath(&unk_1000490B0);
  v37 = sub_10000E3EC();
  v14 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v37);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v14, v5);
  swift_release(v14);
  v15._countAndFlagsBits = 544106784;
  v15._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  v16 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v17 = v2;
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  v19 = v35;
  v18(v4, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v35);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v4, v5);
  v20 = *(void (**)(char *, uint64_t))(v17 + 8);
  v20(v4, v19);
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v21);
  v22 = v40;
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for UpdateIntent_syncDurationType, v11);
  v36 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v22, &type metadata for UpdateIntent_syncDurationType, v11);
  v39 = *(_QWORD *)(v39 + 8);
  ((void (*)(char *, uint64_t))v39)(v22, v41);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(13, 2, &type metadata for UpdateIntent_syncDurationType, v11);
  v23._countAndFlagsBits = 544499027;
  v23._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v23);
  v18(v4, v16, v19);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v4, v5);
  v20(v4, v19);
  v24._countAndFlagsBits = 0x636E7973206F7420;
  v24._object = (void *)0xE900000000000020;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v24);
  v25 = swift_getKeyPath(&unk_1000490B0);
  v26 = _AssistantIntent.IntentProjection.subscript.getter(v25, v37);
  swift_release(v25);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v26, v5);
  swift_release(v26);
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  v28 = v40;
  _AssistantIntent.Phrase.init(stringInterpolation:)(v8, &type metadata for UpdateIntent_syncDurationType, v11);
  v29 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v28, &type metadata for UpdateIntent_syncDurationType, v11);
  ((void (*)(char *, uint64_t))v39)(v28, v41);
  v30 = sub_100007E00(&qword_10005D2C8);
  v31 = swift_allocObject(v30, 48, 7);
  *(_OWORD *)(v31 + 16) = xmmword_100047370;
  *(_QWORD *)(v31 + 32) = v36;
  *(_QWORD *)(v31 + 40) = v29;
  v32 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v31);
  return v32;
}

uint64_t sub_10001FFFC(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_1000490B0, (uint64_t (*)(void))sub_10000E3EC, (uint64_t (*)(uint64_t))sub_10000F0A0, (uint64_t)sub_100020020);
}

uint64_t sub_100020020()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6E657665206C6C61, 0xEA00000000007374);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x736B6565772032, 0xE700000000000000);
  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x68746E6F6D2031, 0xE700000000000000);
  v3 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x7368746E6F6D2033, 0xE800000000000000);
  v4 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x7368746E6F6D2036, 0xE800000000000000);
  v5 = sub_100007E00(&qword_10005D218);
  v6 = swift_allocObject(v5, 72, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100047360;
  *(_QWORD *)(v6 + 32) = v0;
  *(_QWORD *)(v6 + 40) = v1;
  *(_QWORD *)(v6 + 48) = v2;
  *(_QWORD *)(v6 + 56) = v3;
  *(_QWORD *)(v6 + 64) = v4;
  v7 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v6);
  return v7;
}

uint64_t sub_100020124(uint64_t a1)
{
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
  char *v12;
  unint64_t v13;
  Swift::String v14;
  uint64_t KeyPath;
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  Swift::String v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  Swift::String v23;
  uint64_t v24;
  uint64_t v25;
  Swift::String v26;
  Swift::String v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  void (*v35)(char *);
  unsigned int v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;

  v38 = a1;
  v1 = sub_100007E00(&qword_10005D2A0);
  v41 = *(void (**)(char *, uint64_t))(v1 - 8);
  v42 = v1;
  __chkstk_darwin(v1);
  v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v39 - 8);
  __chkstk_darwin(v39);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007E00(&qword_10005D2A8);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v33 - v11;
  v13 = sub_100023764();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(43, 2, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType, v13);
  v14._countAndFlagsBits = 0xD000000000000027;
  v14._object = (void *)0x8000000100041070;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  KeyPath = swift_getKeyPath(&unk_100049088);
  v37 = sub_100023990();
  v16 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v37);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v16, v7);
  swift_release(v16);
  v17._countAndFlagsBits = 544106784;
  v17._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  v36 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v35 = *(void (**)(char *))(v4 + 104);
  v18 = v39;
  v35(v6);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v34 = *(void (**)(char *, uint64_t))(v4 + 8);
  v34(v6, v18);
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v19);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v12, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType, v13);
  v20 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType, v13);
  v21 = v42;
  v22 = (void (*)(char *, uint64_t))*((_QWORD *)v41 + 1);
  v40 = v20;
  v41 = v22;
  v22(v3, v42);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(28, 2, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType, v13);
  v23._countAndFlagsBits = 0x6D20796669746F4ELL;
  v23._object = (void *)0xEA00000000002065;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v23);
  v24 = swift_getKeyPath(&unk_100049088);
  v25 = _AssistantIntent.IntentProjection.subscript.getter(v24, v37);
  swift_release(v24);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v25, v7);
  swift_release(v25);
  v26._object = (void *)0x80000001000410A0;
  v26._countAndFlagsBits = 0xD000000000000012;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v26);
  ((void (*)(char *, _QWORD, uint64_t))v35)(v6, v36, v18);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v34(v6, v18);
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType, v13);
  v28 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType, v13);
  v41(v3, v21);
  v29 = sub_100007E00(&qword_10005D2B0);
  v30 = swift_allocObject(v29, 48, 7);
  *(_OWORD *)(v30 + 16) = xmmword_100047370;
  *(_QWORD *)(v30 + 32) = v40;
  *(_QWORD *)(v30 + 40) = v28;
  v31 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v30);
  return v31;
}

uint64_t sub_1000204E4(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_100049088, (uint64_t (*)(void))sub_100023990, (uint64_t (*)(uint64_t))sub_100023764, (uint64_t)sub_100020508);
}

uint64_t sub_100020508()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x2079616420656874, 0xEA0000000000666FLL);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x2079616420656E6FLL, 0xEE0065726F666562);
  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x73796164206F7774, 0xEF65726F66656220);
  v3 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6B65657720656E6FLL, 0xEF65726F66656220);
  v4 = sub_100007E00(&qword_10005D218);
  v5 = swift_allocObject(v4, 64, 7);
  *(_OWORD *)(v5 + 16) = xmmword_1000484E0;
  *(_QWORD *)(v5 + 32) = v0;
  *(_QWORD *)(v5 + 40) = v1;
  *(_QWORD *)(v5 + 48) = v2;
  *(_QWORD *)(v5 + 56) = v3;
  v6 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100020610()
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
  _BYTE *v9;
  unint64_t v10;
  Swift::String v11;
  void (*v12)(_BYTE *, uint64_t);
  Swift::String v13;
  void (*v14)(_BYTE *, uint64_t);
  uint64_t v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v23[4];
  unsigned int v24;
  void (*v25)(_BYTE *);
  uint64_t v26;
  uint64_t v27;

  v27 = sub_100007E00(&qword_10005D2A0);
  v0 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v2 = &v23[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_100007E00(&qword_10005D2A8);
  __chkstk_darwin(v7);
  v9 = &v23[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_100023764();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(43, 1, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType, v10);
  v11._countAndFlagsBits = 0xD00000000000002BLL;
  v11._object = (void *)0x8000000100041010;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  v24 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v25 = *(void (**)(_BYTE *))(v4 + 104);
  v25(v6);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v12 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v12(v6, v3);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v13);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType, v10);
  v26 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType, v10);
  v14 = *(void (**)(_BYTE *, uint64_t))(v0 + 8);
  v15 = v27;
  v14(v2, v27);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(33, 1, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType, v10);
  v16._object = (void *)0x8000000100041040;
  v16._countAndFlagsBits = 0xD000000000000021;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v16);
  ((void (*)(_BYTE *, _QWORD, uint64_t))v25)(v6, v24, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v12(v6, v3);
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType, v10);
  v18 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType, v10);
  v14(v2, v15);
  v19 = sub_100007E00(&qword_10005D2B0);
  v20 = swift_allocObject(v19, 48, 7);
  *(_OWORD *)(v20 + 16) = xmmword_100047370;
  *(_QWORD *)(v20 + 32) = v26;
  *(_QWORD *)(v20 + 40) = v18;
  v21 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v20);
  return v21;
}

uint64_t sub_1000208D0(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_100049088, (uint64_t (*)(void))sub_100023990, (uint64_t (*)(uint64_t))sub_100023764, (uint64_t)sub_1000208F4);
}

uint64_t sub_1000208F4()
{
  return sub_100022EB8(1701736270, 0xE400000000000000);
}

uint64_t sub_100020904(uint64_t a1)
{
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
  char *v12;
  unint64_t v13;
  Swift::String v14;
  uint64_t KeyPath;
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  Swift::String v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  Swift::String v23;
  uint64_t v24;
  uint64_t v25;
  Swift::String v26;
  Swift::String v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  void (*v35)(char *);
  unsigned int v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;

  v38 = a1;
  v1 = sub_100007E00(&qword_10005D288);
  v41 = *(void (**)(char *, uint64_t))(v1 - 8);
  v42 = v1;
  __chkstk_darwin(v1);
  v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v39 - 8);
  __chkstk_darwin(v39);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007E00(&qword_10005D290);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v33 - v11;
  v13 = sub_10001BE7C();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(40, 2, &type metadata for UpdateIntent_eventsDefaultAlertTimeType, v13);
  v14._object = (void *)0x8000000100040FE0;
  v14._countAndFlagsBits = 0xD000000000000024;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  KeyPath = swift_getKeyPath(&unk_100049060);
  v37 = sub_10001AE90();
  v16 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v37);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v16, v7);
  swift_release(v16);
  v17._countAndFlagsBits = 544106784;
  v17._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  v36 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v35 = *(void (**)(char *))(v4 + 104);
  v18 = v39;
  v35(v6);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v34 = *(void (**)(char *, uint64_t))(v4 + 8);
  v34(v6, v18);
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v19);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v12, &type metadata for UpdateIntent_eventsDefaultAlertTimeType, v13);
  v20 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for UpdateIntent_eventsDefaultAlertTimeType, v13);
  v21 = v42;
  v22 = (void (*)(char *, uint64_t))*((_QWORD *)v41 + 1);
  v40 = v20;
  v41 = v22;
  v22(v3, v42);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(25, 2, &type metadata for UpdateIntent_eventsDefaultAlertTimeType, v13);
  v23._countAndFlagsBits = 0x6D20796669746F4ELL;
  v23._object = (void *)0xEA00000000002065;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v23);
  v24 = swift_getKeyPath(&unk_100049060);
  v25 = _AssistantIntent.IntentProjection.subscript.getter(v24, v37);
  swift_release(v24);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v25, v7);
  swift_release(v25);
  v26._countAndFlagsBits = 0x65766520726F6620;
  v26._object = (void *)0xEF206E692073746ELL;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v26);
  ((void (*)(char *, _QWORD, uint64_t))v35)(v6, v36, v18);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v34(v6, v18);
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for UpdateIntent_eventsDefaultAlertTimeType, v13);
  v28 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for UpdateIntent_eventsDefaultAlertTimeType, v13);
  v41(v3, v21);
  v29 = sub_100007E00(&qword_10005D298);
  v30 = swift_allocObject(v29, 48, 7);
  *(_OWORD *)(v30 + 16) = xmmword_100047370;
  *(_QWORD *)(v30 + 32) = v40;
  *(_QWORD *)(v30 + 40) = v28;
  v31 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v30);
  return v31;
}

uint64_t sub_100020CC8(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_100049060, (uint64_t (*)(void))sub_10001AE90, (uint64_t (*)(uint64_t))sub_10001BE7C, (uint64_t)sub_100020CEC);
}

uint64_t sub_100020CEC()
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

  v24 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x7420656874207461, 0xEE00666F20656D69);
  v23 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000013, 0x8000000100040EE0);
  v22 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000010, 0x800000010003F4B0);
  v21 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000012, 0x8000000100040F00);
  v20 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000011, 0x8000000100040F20);
  v19 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000016, 0x8000000100040F40);
  v18 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000011, 0x8000000100040F60);
  v17 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000015, 0x8000000100040F80);
  v16 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000011, 0x8000000100040FA0);
  v15 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x72756F6820656E6FLL, 0xEF65726F66656220);
  v14 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x622072756F682031, 0xED000065726F6665);
  v13 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000010, 0x8000000100040FC0);
  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x207372756F682032, 0xEE0065726F666562);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x2079616420656E6FLL, 0xEE0065726F666562);
  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6562207961642031, 0xEC00000065726F66);
  v3 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x2079616420656874, 0xEE0065726F666562);
  v4 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x73796164206F7774, 0xEF65726F66656220);
  v5 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6220737961642032, 0xED000065726F6665);
  v6 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6B65657720656E6FLL, 0xEF65726F66656220);
  v7 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x62206B6565772031, 0xED000065726F6665);
  v8 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6B65657720656874, 0xEF65726F66656220);
  v9 = sub_100007E00(&qword_10005D218);
  v10 = swift_allocObject(v9, 200, 7);
  *(_OWORD *)(v10 + 16) = xmmword_100048F10;
  *(_QWORD *)(v10 + 32) = v24;
  *(_QWORD *)(v10 + 40) = v23;
  *(_QWORD *)(v10 + 48) = v22;
  *(_QWORD *)(v10 + 56) = v21;
  *(_QWORD *)(v10 + 64) = v20;
  *(_QWORD *)(v10 + 72) = v19;
  *(_QWORD *)(v10 + 80) = v18;
  *(_QWORD *)(v10 + 88) = v17;
  *(_QWORD *)(v10 + 96) = v16;
  *(_QWORD *)(v10 + 104) = v15;
  *(_QWORD *)(v10 + 112) = v14;
  *(_QWORD *)(v10 + 120) = v13;
  *(_QWORD *)(v10 + 128) = v0;
  *(_QWORD *)(v10 + 136) = v1;
  *(_QWORD *)(v10 + 144) = v2;
  *(_QWORD *)(v10 + 152) = v3;
  *(_QWORD *)(v10 + 160) = v4;
  *(_QWORD *)(v10 + 168) = v5;
  *(_QWORD *)(v10 + 176) = v6;
  *(_QWORD *)(v10 + 184) = v7;
  *(_QWORD *)(v10 + 192) = v8;
  v11 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v10);
  return v11;
}

uint64_t sub_1000210BC()
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
  _BYTE *v9;
  unint64_t v10;
  Swift::String v11;
  void (*v12)(_BYTE *, uint64_t);
  Swift::String v13;
  void (*v14)(_BYTE *, uint64_t);
  uint64_t v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v23[4];
  unsigned int v24;
  void (*v25)(_BYTE *);
  uint64_t v26;
  uint64_t v27;

  v27 = sub_100007E00(&qword_10005D288);
  v0 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v2 = &v23[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_100007E00(&qword_10005D290);
  __chkstk_darwin(v7);
  v9 = &v23[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_10001BE7C();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(40, 1, &type metadata for UpdateIntent_eventsDefaultAlertTimeType, v10);
  v11._countAndFlagsBits = 0xD000000000000028;
  v11._object = (void *)0x8000000100040E90;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  v24 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v25 = *(void (**)(_BYTE *))(v4 + 104);
  v25(v6);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v12 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v12(v6, v3);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v13);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for UpdateIntent_eventsDefaultAlertTimeType, v10);
  v26 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_eventsDefaultAlertTimeType, v10);
  v14 = *(void (**)(_BYTE *, uint64_t))(v0 + 8);
  v15 = v27;
  v14(v2, v27);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(30, 1, &type metadata for UpdateIntent_eventsDefaultAlertTimeType, v10);
  v16._object = (void *)0x8000000100040EC0;
  v16._countAndFlagsBits = 0xD00000000000001ELL;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v16);
  ((void (*)(_BYTE *, _QWORD, uint64_t))v25)(v6, v24, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v12(v6, v3);
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for UpdateIntent_eventsDefaultAlertTimeType, v10);
  v18 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_eventsDefaultAlertTimeType, v10);
  v14(v2, v15);
  v19 = sub_100007E00(&qword_10005D298);
  v20 = swift_allocObject(v19, 48, 7);
  *(_OWORD *)(v20 + 16) = xmmword_100047370;
  *(_QWORD *)(v20 + 32) = v26;
  *(_QWORD *)(v20 + 40) = v18;
  v21 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v20);
  return v21;
}

uint64_t sub_100021378(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_100049060, (uint64_t (*)(void))sub_10001AE90, (uint64_t (*)(uint64_t))sub_10001BE7C, (uint64_t)sub_1000208F4);
}

uint64_t sub_10002139C(uint64_t a1)
{
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
  char *v12;
  unint64_t v13;
  Swift::String v14;
  uint64_t KeyPath;
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  Swift::String v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  Swift::String v23;
  uint64_t v24;
  uint64_t v25;
  Swift::String v26;
  Swift::String v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  void (*v35)(char *);
  unsigned int v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;

  v38 = a1;
  v1 = sub_100007E00(&qword_10005D270);
  v41 = *(void (**)(char *, uint64_t))(v1 - 8);
  v42 = v1;
  __chkstk_darwin(v1);
  v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v39 - 8);
  __chkstk_darwin(v39);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007E00(&qword_10005D278);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v33 - v11;
  v13 = sub_1000237A8();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(48, 2, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType, v13);
  v14._countAndFlagsBits = 0xD00000000000002CLL;
  v14._object = (void *)0x8000000100040E40;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  KeyPath = swift_getKeyPath(&unk_100049038);
  v37 = sub_1000238D8();
  v16 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v37);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v16, v7);
  swift_release(v16);
  v17._countAndFlagsBits = 544106784;
  v17._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  v36 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v35 = *(void (**)(char *))(v4 + 104);
  v18 = v39;
  v35(v6);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v34 = *(void (**)(char *, uint64_t))(v4 + 8);
  v34(v6, v18);
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v19);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v12, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType, v13);
  v20 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType, v13);
  v21 = v42;
  v22 = (void (*)(char *, uint64_t))*((_QWORD *)v41 + 1);
  v40 = v20;
  v41 = v22;
  v22(v3, v42);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(33, 2, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType, v13);
  v23._countAndFlagsBits = 0x6D20796669746F4ELL;
  v23._object = (void *)0xEA00000000002065;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v23);
  v24 = swift_getKeyPath(&unk_100049038);
  v25 = _AssistantIntent.IntentProjection.subscript.getter(v24, v37);
  swift_release(v24);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v25, v7);
  swift_release(v25);
  v26._object = (void *)0x8000000100040E70;
  v26._countAndFlagsBits = 0xD000000000000017;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v26);
  ((void (*)(char *, _QWORD, uint64_t))v35)(v6, v36, v18);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v34(v6, v18);
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType, v13);
  v28 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType, v13);
  v41(v3, v21);
  v29 = sub_100007E00(&qword_10005D280);
  v30 = swift_allocObject(v29, 48, 7);
  *(_OWORD *)(v30 + 16) = xmmword_100047370;
  *(_QWORD *)(v30 + 32) = v40;
  *(_QWORD *)(v30 + 40) = v28;
  v31 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v30);
  return v31;
}

uint64_t sub_10002175C(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_100049038, (uint64_t (*)(void))sub_1000238D8, (uint64_t (*)(uint64_t))sub_1000237A8, (uint64_t)sub_100021780);
}

uint64_t sub_100021780()
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

  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x2079616420656874, 0xEA0000000000666FLL);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x2079616420656E6FLL, 0xEE0065726F666562);
  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6562207961642031, 0xEC00000065726F66);
  v3 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x2079616420656874, 0xEE0065726F666562);
  v4 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x73796164206F7774, 0xEF65726F66656220);
  v5 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6220737961642032, 0xED000065726F6665);
  v6 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6B65657720656E6FLL, 0xEF65726F66656220);
  v7 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x62206B6565772031, 0xED000065726F6665);
  v8 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6B65657720656874, 0xEF65726F66656220);
  v9 = sub_100007E00(&qword_10005D218);
  v10 = swift_allocObject(v9, 104, 7);
  *(_OWORD *)(v10 + 16) = xmmword_1000484A0;
  *(_QWORD *)(v10 + 32) = v0;
  *(_QWORD *)(v10 + 40) = v1;
  *(_QWORD *)(v10 + 48) = v2;
  *(_QWORD *)(v10 + 56) = v3;
  *(_QWORD *)(v10 + 64) = v4;
  *(_QWORD *)(v10 + 72) = v5;
  *(_QWORD *)(v10 + 80) = v6;
  *(_QWORD *)(v10 + 88) = v7;
  *(_QWORD *)(v10 + 96) = v8;
  v11 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v10);
  return v11;
}

uint64_t sub_10002196C()
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
  _BYTE *v9;
  unint64_t v10;
  Swift::String v11;
  void (*v12)(_BYTE *, uint64_t);
  Swift::String v13;
  void (*v14)(_BYTE *, uint64_t);
  uint64_t v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v23[4];
  unsigned int v24;
  void (*v25)(_BYTE *);
  uint64_t v26;
  uint64_t v27;

  v27 = sub_100007E00(&qword_10005D270);
  v0 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v2 = &v23[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_100007E00(&qword_10005D278);
  __chkstk_darwin(v7);
  v9 = &v23[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_1000237A8();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(48, 1, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType, v10);
  v11._countAndFlagsBits = 0xD000000000000030;
  v11._object = (void *)0x8000000100040DD0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  v24 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v25 = *(void (**)(_BYTE *))(v4 + 104);
  v25(v6);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v12 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v12(v6, v3);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v13);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType, v10);
  v26 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType, v10);
  v14 = *(void (**)(_BYTE *, uint64_t))(v0 + 8);
  v15 = v27;
  v14(v2, v27);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(38, 1, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType, v10);
  v16._object = (void *)0x8000000100040E10;
  v16._countAndFlagsBits = 0xD000000000000026;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v16);
  ((void (*)(_BYTE *, _QWORD, uint64_t))v25)(v6, v24, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v12(v6, v3);
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType, v10);
  v18 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType, v10);
  v14(v2, v15);
  v19 = sub_100007E00(&qword_10005D280);
  v20 = swift_allocObject(v19, 48, 7);
  *(_OWORD *)(v20 + 16) = xmmword_100047370;
  *(_QWORD *)(v20 + 32) = v26;
  *(_QWORD *)(v20 + 40) = v18;
  v21 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v20);
  return v21;
}

uint64_t sub_100021C28(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_100049038, (uint64_t (*)(void))sub_1000238D8, (uint64_t (*)(uint64_t))sub_1000237A8, (uint64_t)sub_1000208F4);
}

uint64_t sub_100021C4C(uint64_t a1)
{
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
  char *v12;
  unint64_t v13;
  Swift::String v14;
  uint64_t KeyPath;
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  Swift::String v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  Swift::String v24;
  uint64_t v25;
  uint64_t v26;
  Swift::String v27;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  void (*v36)(char *);
  unsigned int v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;

  v39 = a1;
  v1 = sub_100007E00(&qword_10005D258);
  v42 = *(void (**)(char *, uint64_t))(v1 - 8);
  v43 = v1;
  __chkstk_darwin(v1);
  v3 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v40 - 8);
  __chkstk_darwin(v40);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007E00(&qword_10005D260);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v34 - v11;
  v13 = sub_100016950();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(43, 2, &type metadata for UpdateIntent_durationForNewEvents, v13);
  v14._countAndFlagsBits = 0xD000000000000027;
  v14._object = (void *)0x8000000100040D80;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  KeyPath = swift_getKeyPath(&unk_100049010);
  v38 = sub_100015BB4();
  v16 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v38);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v16, v7);
  swift_release(v16);
  v17._countAndFlagsBits = 544106784;
  v17._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  v37 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v36 = *(void (**)(char *))(v4 + 104);
  v18 = v40;
  v36(v6);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v35 = *(void (**)(char *, uint64_t))(v4 + 8);
  v19 = v18;
  v35(v6, v18);
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v12, &type metadata for UpdateIntent_durationForNewEvents, v13);
  v21 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for UpdateIntent_durationForNewEvents, v13);
  v22 = v43;
  v23 = (void (*)(char *, uint64_t))*((_QWORD *)v42 + 1);
  v41 = v21;
  v42 = v23;
  v23(v3, v43);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(31, 2, &type metadata for UpdateIntent_durationForNewEvents, v13);
  v24._object = (void *)0x8000000100040DB0;
  v24._countAndFlagsBits = 0xD00000000000001BLL;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v24);
  v25 = swift_getKeyPath(&unk_100049010);
  v26 = _AssistantIntent.IntentProjection.subscript.getter(v25, v38);
  swift_release(v25);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v26, v7);
  swift_release(v26);
  v27._countAndFlagsBits = 544106784;
  v27._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  ((void (*)(char *, _QWORD, uint64_t))v36)(v6, v37, v19);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v35(v6, v19);
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v28);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for UpdateIntent_durationForNewEvents, v13);
  v29 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for UpdateIntent_durationForNewEvents, v13);
  v42(v3, v22);
  v30 = sub_100007E00(&qword_10005D268);
  v31 = swift_allocObject(v30, 48, 7);
  *(_OWORD *)(v31 + 16) = xmmword_100047370;
  *(_QWORD *)(v31 + 32) = v41;
  *(_QWORD *)(v31 + 40) = v29;
  v32 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v31);
  return v32;
}

uint64_t sub_100022004(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_100049010, (uint64_t (*)(void))sub_100015BB4, (uint64_t (*)(uint64_t))sub_100016950, (uint64_t)sub_100022028);
}

uint64_t sub_100022028()
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

  v26 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x206E656574666966, 0xEF736574756E696DLL);
  v25 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x74756E696D203531, 0xEA00000000007365);
  v24 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000013, 0x8000000100040CE0);
  v23 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x74756E696D203532, 0xEA00000000007365);
  v22 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6D20797472696874, 0xEE00736574756E69);
  v21 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x74756E696D203033, 0xEA00000000007365);
  v20 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x206E6120666C6168, 0xEC00000072756F68);
  v19 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000012, 0x8000000100040D00);
  v18 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x74756E696D203534, 0xEA00000000007365);
  v17 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x696D207974666966, 0xED0000736574756ELL);
  v16 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x74756E696D203035, 0xEA00000000007365);
  v15 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000012, 0x8000000100040D20);
  v14 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x74756E696D203535, 0xEA00000000007365);
  v13 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x72756F6820656E6FLL, 0xE800000000000000);
  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x72756F682031, 0xE600000000000000);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000014, 0x8000000100040D40);
  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000012, 0x8000000100040D60);
  v3 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x2F3120646E612031, 0xEF7372756F682032);
  v4 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x72756F6820352E31, 0xE900000000000073);
  v5 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6D207974656E696ELL, 0xEE00736574756E69);
  v6 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x74756E696D203039, 0xEA00000000007365);
  v7 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x72756F68206F7774, 0xE900000000000073);
  v8 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x7372756F682032, 0xE700000000000000);
  v9 = sub_100007E00(&qword_10005D218);
  v10 = swift_allocObject(v9, 216, 7);
  *(_OWORD *)(v10 + 16) = xmmword_100048F20;
  *(_QWORD *)(v10 + 32) = v26;
  *(_QWORD *)(v10 + 40) = v25;
  *(_QWORD *)(v10 + 48) = v24;
  *(_QWORD *)(v10 + 56) = v23;
  *(_QWORD *)(v10 + 64) = v22;
  *(_QWORD *)(v10 + 72) = v21;
  *(_QWORD *)(v10 + 80) = v20;
  *(_QWORD *)(v10 + 88) = v19;
  *(_QWORD *)(v10 + 96) = v18;
  *(_QWORD *)(v10 + 104) = v17;
  *(_QWORD *)(v10 + 112) = v16;
  *(_QWORD *)(v10 + 120) = v15;
  *(_QWORD *)(v10 + 128) = v14;
  *(_QWORD *)(v10 + 136) = v13;
  *(_QWORD *)(v10 + 144) = v0;
  *(_QWORD *)(v10 + 152) = v1;
  *(_QWORD *)(v10 + 160) = v2;
  *(_QWORD *)(v10 + 168) = v3;
  *(_QWORD *)(v10 + 176) = v4;
  *(_QWORD *)(v10 + 184) = v5;
  *(_QWORD *)(v10 + 192) = v6;
  *(_QWORD *)(v10 + 200) = v7;
  *(_QWORD *)(v10 + 208) = v8;
  v11 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v10);
  return v11;
}

uint64_t sub_1000223D0(uint64_t a1)
{
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
  char *v12;
  unint64_t v13;
  Swift::String v14;
  uint64_t KeyPath;
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  Swift::String v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  Swift::String v24;
  uint64_t v25;
  uint64_t v26;
  Swift::String v27;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  void (*v36)(char *);
  unsigned int v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;

  v39 = a1;
  v1 = sub_100007E00(&qword_10005D240);
  v42 = *(void (**)(char *, uint64_t))(v1 - 8);
  v43 = v1;
  __chkstk_darwin(v1);
  v3 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v40 - 8);
  __chkstk_darwin(v40);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007E00(&qword_10005D248);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v34 - v11;
  v13 = sub_1000237EC();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(37, 2, &type metadata for UpdateIntent_weekStartDay, v13);
  v14._countAndFlagsBits = 0xD000000000000021;
  v14._object = (void *)0x8000000100040C90;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  KeyPath = swift_getKeyPath(&unk_100048FE8);
  v38 = sub_100023884();
  v16 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v38);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v16, v7);
  swift_release(v16);
  v17._countAndFlagsBits = 544106784;
  v17._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  v37 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v36 = *(void (**)(char *))(v4 + 104);
  v18 = v40;
  v36(v6);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v35 = *(void (**)(char *, uint64_t))(v4 + 8);
  v19 = v18;
  v35(v6, v18);
  v20._countAndFlagsBits = 0;
  v20._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v12, &type metadata for UpdateIntent_weekStartDay, v13);
  v21 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for UpdateIntent_weekStartDay, v13);
  v22 = v43;
  v23 = (void (*)(char *, uint64_t))*((_QWORD *)v42 + 1);
  v41 = v21;
  v42 = v23;
  v23(v3, v43);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(22, 2, &type metadata for UpdateIntent_weekStartDay, v13);
  v24._object = (void *)0x8000000100040CC0;
  v24._countAndFlagsBits = 0xD000000000000012;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v24);
  v25 = swift_getKeyPath(&unk_100048FE8);
  v26 = _AssistantIntent.IntentProjection.subscript.getter(v25, v38);
  swift_release(v25);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v26, v7);
  swift_release(v26);
  v27._countAndFlagsBits = 544106784;
  v27._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  ((void (*)(char *, _QWORD, uint64_t))v36)(v6, v37, v19);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v35(v6, v19);
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v28);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for UpdateIntent_weekStartDay, v13);
  v29 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for UpdateIntent_weekStartDay, v13);
  v42(v3, v22);
  v30 = sub_100007E00(&qword_10005D250);
  v31 = swift_allocObject(v30, 48, 7);
  *(_OWORD *)(v31 + 16) = xmmword_100047370;
  *(_QWORD *)(v31 + 32) = v41;
  *(_QWORD *)(v31 + 40) = v29;
  v32 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v31);
  return v32;
}

uint64_t sub_100022788(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_100048FE8, (uint64_t (*)(void))sub_100023884, (uint64_t (*)(uint64_t))sub_1000237EC, (uint64_t)sub_1000227AC);
}

uint64_t sub_1000227AC()
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

  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x7961646E6F4DLL, 0xE600000000000000);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x79616473657554, 0xE700000000000000);
  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x616473656E646557, 0xE900000000000079);
  v3 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x7961647372756854, 0xE800000000000000);
  v4 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x7961647275746153, 0xE800000000000000);
  v5 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x7961646E7553, 0xE600000000000000);
  v6 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000012, 0x8000000100040C70);
  v7 = sub_100007E00(&qword_10005D218);
  v8 = swift_allocObject(v7, 88, 7);
  *(_OWORD *)(v8 + 16) = xmmword_100048F30;
  *(_QWORD *)(v8 + 32) = v0;
  *(_QWORD *)(v8 + 40) = v1;
  *(_QWORD *)(v8 + 48) = v2;
  *(_QWORD *)(v8 + 56) = v3;
  *(_QWORD *)(v8 + 64) = v4;
  *(_QWORD *)(v8 + 72) = v5;
  *(_QWORD *)(v8 + 80) = v6;
  v9 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v8);
  return v9;
}

uint64_t sub_1000228F0()
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
  _BYTE *v9;
  unint64_t v10;
  Swift::String v11;
  void (*v12)(_BYTE *, uint64_t);
  Swift::String v13;
  void (*v14)(_BYTE *, uint64_t);
  uint64_t v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v23[4];
  unsigned int v24;
  void (*v25)(_BYTE *);
  uint64_t v26;
  uint64_t v27;

  v27 = sub_100007E00(&qword_10005D220);
  v0 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v2 = &v23[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_100007E00(&qword_10005D228);
  __chkstk_darwin(v7);
  v9 = &v23[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_100008940();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(31, 1, &type metadata for UpdateIntent_showLocationSuggestions, v10);
  v11._object = (void *)0x8000000100040C20;
  v11._countAndFlagsBits = 0xD00000000000001FLL;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  v24 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v25 = *(void (**)(_BYTE *))(v4 + 104);
  v25(v6);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v12 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v12(v6, v3);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v13);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for UpdateIntent_showLocationSuggestions, v10);
  v26 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_showLocationSuggestions, v10);
  v14 = *(void (**)(_BYTE *, uint64_t))(v0 + 8);
  v15 = v27;
  v14(v2, v27);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(32, 1, &type metadata for UpdateIntent_showLocationSuggestions, v10);
  v16._countAndFlagsBits = 0xD000000000000020;
  v16._object = (void *)0x8000000100040C40;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v16);
  ((void (*)(_BYTE *, _QWORD, uint64_t))v25)(v6, v24, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v12(v6, v3);
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for UpdateIntent_showLocationSuggestions, v10);
  v18 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_showLocationSuggestions, v10);
  v14(v2, v15);
  v19 = sub_100007E00(&qword_10005D230);
  v20 = swift_allocObject(v19, 48, 7);
  *(_OWORD *)(v20 + 16) = xmmword_100047370;
  *(_QWORD *)(v20 + 32) = v26;
  *(_QWORD *)(v20 + 40) = v18;
  v21 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v20);
  return v21;
}

uint64_t sub_100022BB0(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_100048FC0, (uint64_t (*)(void))sub_100023838, (uint64_t (*)(uint64_t))sub_100008940, (uint64_t)sub_10001EA14);
}

uint64_t sub_100022BD4()
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
  _BYTE *v9;
  unint64_t v10;
  Swift::String v11;
  void (*v12)(_BYTE *, uint64_t);
  Swift::String v13;
  void (*v14)(_BYTE *, uint64_t);
  uint64_t v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v23[4];
  unsigned int v24;
  void (*v25)(_BYTE *);
  uint64_t v26;
  uint64_t v27;

  v27 = sub_100007E00(&qword_10005D220);
  v0 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v2 = &v23[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_100007E00(&qword_10005D228);
  __chkstk_darwin(v7);
  v9 = &v23[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_100008940();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(32, 1, &type metadata for UpdateIntent_showLocationSuggestions, v10);
  v11._object = (void *)0x8000000100040BC0;
  v11._countAndFlagsBits = 0xD000000000000020;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  v24 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v25 = *(void (**)(_BYTE *))(v4 + 104);
  v25(v6);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v12 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v12(v6, v3);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v13);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for UpdateIntent_showLocationSuggestions, v10);
  v26 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_showLocationSuggestions, v10);
  v14 = *(void (**)(_BYTE *, uint64_t))(v0 + 8);
  v15 = v27;
  v14(v2, v27);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(33, 1, &type metadata for UpdateIntent_showLocationSuggestions, v10);
  v16._countAndFlagsBits = 0xD000000000000021;
  v16._object = (void *)0x8000000100040BF0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v16);
  ((void (*)(_BYTE *, _QWORD, uint64_t))v25)(v6, v24, v3);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v6, v7);
  v12(v6, v3);
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for UpdateIntent_showLocationSuggestions, v10);
  v18 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v2, &type metadata for UpdateIntent_showLocationSuggestions, v10);
  v14(v2, v15);
  v19 = sub_100007E00(&qword_10005D230);
  v20 = swift_allocObject(v19, 48, 7);
  *(_OWORD *)(v20 + 16) = xmmword_100047370;
  *(_QWORD *)(v20 + 32) = v26;
  *(_QWORD *)(v20 + 40) = v18;
  v21 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v20);
  return v21;
}

uint64_t sub_100022E94(uint64_t a1)
{
  return sub_10001E5FC(a1, (uint64_t)&unk_100048FC0, (uint64_t (*)(void))sub_100023838, (uint64_t (*)(uint64_t))sub_100008940, (uint64_t)sub_10001ED08);
}

uint64_t sub_100022EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(a1, a2);
  v3 = sub_100007E00(&qword_10005D218);
  v4 = swift_allocObject(v3, 40, 7);
  *(_OWORD *)(v4 + 16) = xmmword_1000484B0;
  *(_QWORD *)(v4 + 32) = v2;
  v5 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v4);
  return v5;
}

void sub_100022F18()
{
  qword_10005DED0 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_100022F34()
{
  if (qword_10005C528 != -1)
    swift_once(&qword_10005C528, sub_100022F18);
  return swift_bridgeObjectRetain(qword_10005DED0);
}

ValueMetadata *type metadata accessor for CalendarSettingsAssistantIntentsProvider()
{
  return &type metadata for CalendarSettingsAssistantIntentsProvider;
}

uint64_t sub_100022F84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(char *, uint64_t);
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
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

  v0 = type metadata accessor for _AssistantIntent(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v53 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = sub_100031DE0();
  v67 = v4;
  v5 = sub_1000236DC();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_10001DCB8, 0, sub_10001E208, 0, &type metadata for UpdateIntent_alternateCalendarType, v5);
  v65 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  v66 = sub_100031DE0();
  v67 = v7;
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_10001E31C, 0, sub_10001E5D8, 0, &type metadata for UpdateIntent_alternateCalendarType, v5);
  v64 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v66 = (uint64_t)sub_10000C450();
  v67 = v8;
  v9 = sub_10000B580();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_10001E730, 0, sub_10001E9F0, 0, &type metadata for UpdateIntent_showWeekNumbers, v9);
  v63 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v66 = (uint64_t)sub_10000C450();
  v67 = v10;
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_10001EA24, 0, sub_10001ECE4, 0, &type metadata for UpdateIntent_showWeekNumbers, v9);
  v62 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v66 = (uint64_t)sub_1000252DC();
  v67 = v11;
  v12 = sub_100023720();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_10001ED1C, 0, sub_10001F0A8, 0, &type metadata for UpdateIntent_showInviteeDeclines, v12);
  v61 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v66 = (uint64_t)sub_1000252DC();
  v67 = v13;
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_10001F0CC, 0, sub_10001F458, 0, &type metadata for UpdateIntent_showInviteeDeclines, v12);
  v60 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v66 = (uint64_t)sub_10001243C();
  v67 = v14;
  v15 = sub_10001157C();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_10001F47C, 0, sub_10001F83C, 0, &type metadata for UpdateIntent_weekViewStartsOnToday, v15);
  v59 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v66 = (uint64_t)sub_10001243C();
  v67 = v16;
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_10001F860, 0, sub_10001FC24, 0, &type metadata for UpdateIntent_weekViewStartsOnToday, v15);
  v58 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v66 = sub_100010214();
  v67 = v17;
  v18 = sub_10000F0A0();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_10001FC48, 0, sub_10001FFFC, 0, &type metadata for UpdateIntent_syncDurationType, v18);
  v57 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v66 = sub_100029828();
  v67 = v19;
  v68 = v20;
  v21 = sub_100023764();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_100020124, 0, sub_1000204E4, 0, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType, v21);
  v56 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v66 = sub_100029828();
  v67 = v22;
  v68 = v23;
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_100020610, 0, sub_1000208D0, 0, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType, v21);
  v55 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v66 = sub_10001D5D4();
  v67 = v24;
  v25 = sub_10001BE7C();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_100020904, 0, sub_100020CC8, 0, &type metadata for UpdateIntent_eventsDefaultAlertTimeType, v25);
  v54 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v66 = sub_10001D5D4();
  v67 = v26;
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_1000210BC, 0, sub_100021378, 0, &type metadata for UpdateIntent_eventsDefaultAlertTimeType, v25);
  v53 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v66 = sub_10003831C();
  v67 = v27;
  v28 = sub_1000237A8();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_10002139C, 0, sub_10002175C, 0, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType, v28);
  v29 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v66 = sub_10003831C();
  v67 = v30;
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_10002196C, 0, sub_100021C28, 0, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType, v28);
  v31 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v66 = sub_100017B28();
  v67 = v32;
  v33 = sub_100016950();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_100021C4C, 0, sub_100022004, 0, &type metadata for UpdateIntent_durationForNewEvents, v33);
  v34 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v66 = sub_10002D5F4();
  v67 = v35;
  v36 = sub_1000237EC();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_1000223D0, 0, sub_100022788, 0, &type metadata for UpdateIntent_weekStartDay, v36);
  v37 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v66 = (uint64_t)sub_10000A198();
  v67 = v38;
  v39 = sub_100008940();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_1000228F0, 0, sub_100022BB0, 0, &type metadata for UpdateIntent_showLocationSuggestions, v39);
  v40 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v66 = (uint64_t)sub_10000A198();
  v67 = v41;
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v66, sub_100022BD4, 0, sub_100022E94, 0, &type metadata for UpdateIntent_showLocationSuggestions, v39);
  v42 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v43 = sub_100007E00(&qword_10005D200);
  v44 = swift_allocObject(v43, 184, 7);
  *(_OWORD *)(v44 + 16) = xmmword_100048F40;
  v45 = v64;
  *(_QWORD *)(v44 + 32) = v65;
  *(_QWORD *)(v44 + 40) = v45;
  v46 = v62;
  *(_QWORD *)(v44 + 48) = v63;
  *(_QWORD *)(v44 + 56) = v46;
  v47 = v60;
  *(_QWORD *)(v44 + 64) = v61;
  *(_QWORD *)(v44 + 72) = v47;
  v48 = v58;
  *(_QWORD *)(v44 + 80) = v59;
  *(_QWORD *)(v44 + 88) = v48;
  v49 = v56;
  *(_QWORD *)(v44 + 96) = v57;
  *(_QWORD *)(v44 + 104) = v49;
  v50 = v54;
  *(_QWORD *)(v44 + 112) = v55;
  *(_QWORD *)(v44 + 120) = v50;
  *(_QWORD *)(v44 + 128) = v53;
  *(_QWORD *)(v44 + 136) = v29;
  *(_QWORD *)(v44 + 144) = v31;
  *(_QWORD *)(v44 + 152) = v34;
  *(_QWORD *)(v44 + 160) = v37;
  *(_QWORD *)(v44 + 168) = v40;
  *(_QWORD *)(v44 + 176) = v42;
  v51 = static _AssistantIntent.Builder.buildBlock(_:)();
  swift_bridgeObjectRelease(v44);
  return v51;
}

unint64_t sub_1000236DC()
{
  unint64_t result;

  result = qword_10005D1D8;
  if (!qword_10005D1D8)
  {
    result = swift_getWitnessTable(&unk_10004B11C, &type metadata for UpdateIntent_alternateCalendarType);
    atomic_store(result, (unint64_t *)&qword_10005D1D8);
  }
  return result;
}

unint64_t sub_100023720()
{
  unint64_t result;

  result = qword_10005D1E0;
  if (!qword_10005D1E0)
  {
    result = swift_getWitnessTable(&unk_100049448, &type metadata for UpdateIntent_showInviteeDeclines);
    atomic_store(result, (unint64_t *)&qword_10005D1E0);
  }
  return result;
}

unint64_t sub_100023764()
{
  unint64_t result;

  result = qword_10005D1E8;
  if (!qword_10005D1E8)
  {
    result = swift_getWitnessTable(&unk_100049D4C, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D1E8);
  }
  return result;
}

unint64_t sub_1000237A8()
{
  unint64_t result;

  result = qword_10005D1F0;
  if (!qword_10005D1F0)
  {
    result = swift_getWitnessTable(&unk_10004BB08, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D1F0);
  }
  return result;
}

unint64_t sub_1000237EC()
{
  unint64_t result;

  result = qword_10005D1F8;
  if (!qword_10005D1F8)
  {
    result = swift_getWitnessTable(&unk_10004A72C, &type metadata for UpdateIntent_weekStartDay);
    atomic_store(result, (unint64_t *)&qword_10005D1F8);
  }
  return result;
}

unint64_t sub_100023838()
{
  unint64_t result;

  result = qword_10005D208;
  if (!qword_10005D208)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Bool, &type metadata for Bool);
    atomic_store(result, (unint64_t *)&qword_10005D208);
  }
  return result;
}

unint64_t sub_100023884()
{
  unint64_t result;

  result = qword_10005D238;
  if (!qword_10005D238)
  {
    result = swift_getWitnessTable(&unk_10004A36C, &type metadata for SettingsStartWeekOnType);
    atomic_store(result, (unint64_t *)&qword_10005D238);
  }
  return result;
}

unint64_t sub_1000238D8()
{
  unint64_t result;

  result = qword_10005DA80;
  if (!qword_10005DA80)
  {
    result = swift_getWitnessTable(&unk_10004B748, &type metadata for SettingsAllDayDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005DA80);
  }
  return result;
}

_QWORD *sub_100023924@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_10002395C(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

unint64_t sub_100023990()
{
  unint64_t result;

  result = qword_10005D4C0;
  if (!qword_10005D4C0)
  {
    result = swift_getWitnessTable(&unk_10004998C, &type metadata for SettingsBirthdaysDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D4C0);
  }
  return result;
}

_QWORD *sub_1000239F0@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100023A2C(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

unint64_t sub_100023A68()
{
  unint64_t result;

  result = qword_10005D318;
  if (!qword_10005D318)
  {
    result = swift_getWitnessTable(&unk_10004AD5C, &type metadata for SettingsAlternateCalendarType);
    atomic_store(result, (unint64_t *)&qword_10005D318);
  }
  return result;
}

unint64_t sub_100023AB0()
{
  unint64_t result;

  result = qword_10005D348;
  if (!qword_10005D348)
  {
    result = swift_getWitnessTable(&unk_1000491E0, &type metadata for SettingsShowInviteeDeclinesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D348);
  }
  return result;
}

unint64_t sub_100023AF8()
{
  unint64_t result;

  result = qword_10005D350;
  if (!qword_10005D350)
  {
    result = swift_getWitnessTable(&unk_10004951C, &type metadata for SettingsShowInviteeDeclinesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D350);
  }
  return result;
}

uint64_t sub_100023B3C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100023B54, 0, 0);
}

uint64_t sub_100023B54()
{
  uint64_t v0;
  BOOL *v1;

  v1 = *(BOOL **)(v0 + 16);
  *v1 = CalAlertInviteeDeclines() != 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100023B94(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_100023BB0, 0, 0);
}

uint64_t sub_100023BB0()
{
  uint64_t v0;

  CalSetAlertInviteeDeclines(*(unsigned __int8 *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100023BE4()
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
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  __int16 v19;
  _BYTE v20[16];

  v0 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v0);
  v2 = &v20[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v10);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v20[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000015, 0x8000000100041400);
  static Locale.current.getter(v17);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  v19 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsShowInviteeDeclinesEntityName", 37, 2, v12, 0, 0, v9, v6, "Name of the SettingsShowInviteeDeclinesEntity type", 50, v19);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v2, 1, 1, v13);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v16, v2);
}

uint64_t sub_100023DF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v32 = a1;
  v1 = sub_100007E00(&qword_10005D190);
  __chkstk_darwin(v1);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v4);
  v31 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Locale(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for LocalizedStringResource(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v30 - v21;
  v23 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000015, 0x8000000100041400);
  static Locale.current.getter(v23);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v15, 0, 0, v12, v9, "SettingsShowInviteeDeclinesEntity displayRepresentation", 55, 2);
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v25 = v31;
  v24(v31, 1, 1, v16);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v26 = type metadata accessor for DisplayRepresentation.Image(0);
  v27 = sub_100007F0C(v26, (uint64_t)qword_10005DF80);
  v28 = *(_QWORD *)(v26 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v3, v27, v26);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v3, 0, 1, v26);
  LocalizedStringResource.init(stringLiteral:)(0x10000000000001C6, 0x80000001000414C0);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v22, v25, v3, &_swiftEmptyArrayStorage, v20);
}

uint64_t sub_1000240D8()
{
  uint64_t v0;

  v0 = qword_10005D338;
  swift_bridgeObjectRetain(off_10005D340);
  return v0;
}

unint64_t sub_100024110()
{
  unint64_t result;

  result = qword_10005D358;
  if (!qword_10005D358)
  {
    result = swift_getWitnessTable(&unk_100049238, &type metadata for SettingsShowInviteeDeclinesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D358);
  }
  return result;
}

unint64_t sub_100024158()
{
  unint64_t result;

  result = qword_10005D360;
  if (!qword_10005D360)
  {
    result = swift_getWitnessTable(&unk_100049270, &type metadata for SettingsShowInviteeDeclinesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D360);
  }
  return result;
}

unint64_t sub_1000241A0()
{
  unint64_t result;

  result = qword_10005D368;
  if (!qword_10005D368)
  {
    result = swift_getWitnessTable(&unk_1000492A0, &type metadata for SettingsShowInviteeDeclinesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D368);
  }
  return result;
}

unint64_t sub_1000241E8()
{
  unint64_t result;

  result = qword_10005D370;
  if (!qword_10005D370)
  {
    result = swift_getWitnessTable(&unk_100049594, &type metadata for SettingsShowInviteeDeclinesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D370);
  }
  return result;
}

unint64_t sub_100024230()
{
  unint64_t result;

  result = qword_10005D378;
  if (!qword_10005D378)
  {
    result = swift_getWitnessTable(&unk_1000492D8, &type metadata for SettingsShowInviteeDeclinesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D378);
  }
  return result;
}

unint64_t sub_100024278()
{
  unint64_t result;

  result = qword_10005D380;
  if (!qword_10005D380)
  {
    result = swift_getWitnessTable(&unk_100049300, &type metadata for SettingsShowInviteeDeclinesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D380);
  }
  return result;
}

unint64_t sub_1000242C0()
{
  unint64_t result;

  result = qword_10005D388;
  if (!qword_10005D388)
  {
    result = swift_getWitnessTable(&unk_100049328, &type metadata for SettingsShowInviteeDeclinesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D388);
  }
  return result;
}

unint64_t sub_100024308()
{
  unint64_t result;

  result = qword_10005D390;
  if (!qword_10005D390)
  {
    result = swift_getWitnessTable(&unk_100049380, &type metadata for SettingsShowInviteeDeclinesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D390);
  }
  return result;
}

void sub_10002434C(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000023;
  a1[1] = 0x8000000100041690;
}

uint64_t sub_100024370()
{
  return sub_10000A9CC(&qword_10005D398, &qword_10005D3A0, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_10002439C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100023AB0();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000243D8()
{
  unint64_t result;

  result = qword_10005D3A8;
  if (!qword_10005D3A8)
  {
    result = swift_getWitnessTable(&unk_1000493B0, &type metadata for SettingsShowInviteeDeclinesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D3A8);
  }
  return result;
}

uint64_t sub_100024420(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100024308();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10002445C()
{
  return sub_10000A9CC(&qword_10005D3B0, &qword_10005D3B8, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_100024488()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v13;
  _BYTE v14[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_100007F24(v10, qword_10005DED8);
  sub_100007F0C(v10, (uint64_t)qword_10005DED8);
  v11 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000001CLL, 0x8000000100041450);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  v13 = 2;
  return LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsShowInviteeDeclinesIntent_title", 39, 2, v9, 0, 0, v6, v3, "Display string for the title of the show invitee declines intent", 64, v13);
}

uint64_t sub_10002461C()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100049718);
  qword_10005DEF0 = result;
  return result;
}

uint64_t sub_100024640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  v4 = type metadata accessor for MainActor(0);
  v3[7] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v3[8] = v5;
  v3[9] = v6;
  return swift_task_switch(sub_1000246B0, v5, v6);
}

uint64_t sub_1000246B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 16));
  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 24) = v1;
  *(_QWORD *)(v0 + 80) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 112));
  *(_BYTE *)(v0 + 113) = *(_BYTE *)(v0 + 112);
  if (qword_10005C538 != -1)
    swift_once(&qword_10005C538, sub_10002461C);
  v2 = qword_10005DEF0;
  *(_QWORD *)(v0 + 88) = qword_10005DEF0;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 96) = v4;
  v5 = sub_10000A9CC(&qword_10005D458, &qword_10005D460, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_100008D04;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 113, v2, &type metadata for Bool, v5);
}

uint64_t sub_1000247AC()
{
  if (qword_10005C538 != -1)
    swift_once(&qword_10005C538, sub_10002461C);
  return swift_retain(qword_10005DEF0);
}

unint64_t sub_1000247F0()
{
  unint64_t result;

  result = qword_10005D3C0;
  if (!qword_10005D3C0)
  {
    result = swift_getWitnessTable(&unk_1000494D8, &type metadata for UpdateIntent_showInviteeDeclines);
    atomic_store(result, (unint64_t *)&qword_10005D3C0);
  }
  return result;
}

unint64_t sub_100024838()
{
  unint64_t result;

  result = qword_10005D3C8;
  if (!qword_10005D3C8)
  {
    result = swift_getWitnessTable(&unk_100049500, &type metadata for UpdateIntent_showInviteeDeclines);
    atomic_store(result, (unint64_t *)&qword_10005D3C8);
  }
  return result;
}

uint64_t sub_10002487C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000503B0, 1);
}

uint64_t sub_10002488C(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100023720();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_1000248CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10005C530 != -1)
    swift_once(&qword_10005C530, sub_100024488);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_100007F0C(v2, (uint64_t)qword_10005DED8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10002493C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005D474);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_100009170;
  return sub_100024640(a1, v5, v4);
}

char *sub_1000249A0@<X0>(char **a1@<X8>)
{
  char *result;
  char *v3;

  result = sub_1000252DC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000249C4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100023720();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_1000249F0()
{
  unint64_t result;

  result = qword_10005D3D8;
  if (!qword_10005D3D8)
  {
    result = swift_getWitnessTable(&unk_10004955C, &type metadata for SettingsShowInviteeDeclinesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D3D8);
  }
  return result;
}

unint64_t sub_100024A38()
{
  unint64_t result;

  result = qword_10005D3E0[0];
  if (!qword_10005D3E0[0])
  {
    result = swift_getWitnessTable(&unk_100049180, &type metadata for SettingsShowInviteeDeclinesEntity);
    atomic_store(result, qword_10005D3E0);
  }
  return result;
}

uint64_t sub_100024A7C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005D440 + dword_10005D440);
  v2 = (_QWORD *)swift_task_alloc(unk_10005D444);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000AB54;
  return v4();
}

uint64_t sub_100024AD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100023AF8();
  *v4 = v2;
  v4[1] = sub_100009358;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100024B44()
{
  unint64_t result;

  result = qword_10005D3F8;
  if (!qword_10005D3F8)
  {
    result = swift_getWitnessTable(&unk_1000495EC, &type metadata for SettingsShowInviteeDeclinesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D3F8);
  }
  return result;
}

unint64_t sub_100024B8C()
{
  unint64_t result;

  result = qword_10005D400[0];
  if (!qword_10005D400[0])
  {
    result = swift_getWitnessTable(&unk_10004964C, &type metadata for SettingsShowInviteeDeclinesEntityQuery);
    atomic_store(result, qword_10005D400);
  }
  return result;
}

uint64_t sub_100024BD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100023AF8();
  *v5 = v2;
  v5[1] = sub_1000094B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100024C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100023AF8();
  *v4 = v2;
  v4[1] = sub_10000AB54;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100024CA8()
{
  unint64_t result;

  result = qword_10005D418;
  if (!qword_10005D418)
  {
    result = swift_getWitnessTable(&unk_100049674, &type metadata for SettingsShowInviteeDeclinesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D418);
  }
  return result;
}

unint64_t sub_100024CF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005D420;
  if (!qword_10005D420)
  {
    v1 = sub_100007220(qword_10005D428);
    sub_1000242C0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005D420);
  }
  return result;
}

uint64_t sub_100024D54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_1000241E8();
  *v5 = v2;
  v5[1] = sub_10000AB50;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_showInviteeDeclines()
{
  return &type metadata for UpdateIntent_showInviteeDeclines;
}

ValueMetadata *type metadata accessor for SettingsShowInviteeDeclinesEntityQuery()
{
  return &type metadata for SettingsShowInviteeDeclinesEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsShowInviteeDeclinesEntity()
{
  return &type metadata for SettingsShowInviteeDeclinesEntity;
}

uint64_t sub_100024DF0@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t KeyPath;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  Swift::String v26;
  Swift::String v27;
  Swift::String v28;
  uint64_t OpaqueTypeConformance2;
  unint64_t v30;
  void *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  Swift::String v45;
  uint64_t v46;
  unint64_t v47;
  _QWORD v48[2];
  Swift::String v49;

  v44 = a1;
  v1 = sub_100007E00(&qword_10005C908);
  v37 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00(&qword_10005C910);
  v39 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007E00(&qword_10005C918);
  v8 = *(_QWORD *)(v7 - 8);
  v40 = v7;
  v41 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100007E00(&qword_10005C920);
  v12 = *(_QWORD *)(v11 - 8);
  v42 = v11;
  v43 = v12;
  __chkstk_darwin(v11);
  v38 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100049718);
  v15 = sub_100007E00(&qword_10005C928);
  v16 = sub_100024A38();
  v17 = sub_10000A9CC(&qword_10005C930, &qword_10005C928, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)(0xD000000000000026, 0x80000001000416C0, KeyPath, sub_1000251F8, 0, sub_100009DC8, 0, sub_100009F80, 0, v15, &type metadata for Text, &type metadata for Text, v16, v17, &protocol witness table for Text, &protocol witness table for Text);
  v18 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000013, 0x80000001000416F0);
  v20 = v19;
  LOBYTE(v16) = v21;
  v23 = v22;
  v24 = sub_10000A9CC(&qword_10005C938, &qword_10005C908, (uint64_t)&protocol conformance descriptor for ControlToggle<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v18, v20, v16 & 1, v23, v1, v24);
  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v20);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v3, v1);
  v25 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v26._countAndFlagsBits = 0xD000000000000015;
  v49._countAndFlagsBits = 0xD000000000000051;
  v49._object = (void *)0x8000000100041710;
  v26._object = (void *)0x8000000100041400;
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  v28 = NSLocalizedString(_:tableName:bundle:value:comment:)(v26, (Swift::String_optional)0, (NSBundle)v25, v27, v49);

  v45 = v28;
  v48[0] = v1;
  v48[1] = v24;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v48, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v30 = sub_10000AA0C();
  WidgetConfiguration.description<A>(_:)(&v45, v4, &type metadata for String, OpaqueTypeConformance2, v30);
  swift_bridgeObjectRelease(v28._object);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v6, v4);
  v45._countAndFlagsBits = v4;
  v45._object = &type metadata for String;
  v46 = OpaqueTypeConformance2;
  v47 = v30;
  v31 = (void *)swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description<A>(_:)>>, 1);
  v32 = v38;
  v33 = v40;
  WidgetConfiguration.disablesControlStateCaching()(v40, v31);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v33);
  v45._countAndFlagsBits = v33;
  v45._object = v31;
  v34 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v35 = v42;
  WidgetConfiguration.hiddenControl()(v42, v34);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v32, v35);
}

uint64_t sub_1000251F8()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  unint64_t v4;
  Swift::String v6;
  Swift::String v7;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v7._countAndFlagsBits = 0xD000000000000032;
  v7._object = (void *)0x800000010003B7A0;
  v1._object = (void *)0x8000000100041400;
  v1._countAndFlagsBits = 0xD000000000000015;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v7);

  v6 = v3;
  v4 = sub_10000AA0C();
  return Label<>.init<A>(_:systemImage:)(&v6, 0x7261646E656C6163, 0xE800000000000000, &type metadata for String, v4);
}

char *sub_1000252DC()
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
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  char *v32;
  char *v33;
  char *v34;
  unint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  __int16 v46;
  int v47;
  int v48;
  int v49;
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  void (*v54)(char *, _QWORD, uint64_t, uint64_t);
  void (*v55)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  char v65[3];
  uint64_t v66;

  v0 = sub_100007E00(&qword_10005C8C0);
  __chkstk_darwin(v0);
  v61 = (char *)&v50 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = type metadata accessor for InputConnectionBehavior(0);
  v60 = *(_QWORD *)(v64 - 8);
  __chkstk_darwin(v64);
  v59 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100007E00((uint64_t *)&unk_10005D140);
  v4 = __chkstk_darwin(v3);
  v58 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v63 = (char *)&v50 - v6;
  v7 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v7);
  v62 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Locale(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v16);
  v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for LocalizedStringResource(0);
  v20 = *(_QWORD *)(v19 - 8);
  v56 = v19;
  v21 = __chkstk_darwin(v19);
  v57 = (char *)&v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v24 = (char *)&v50 - v23;
  v53 = sub_100007E00(&qword_10005D468);
  v25 = String.LocalizationValue.init(stringLiteral:)(0x746567726154, 0xE600000000000000);
  static Locale.current.getter(v25);
  v26 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
  v51 = v9;
  v27(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  v50 = v27;
  v46 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target", 6, 2, v18, 0, 0, v15, v12, "Calendar settings entity title that indicates which setting the user would like to target.", 90, v46);
  v28 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x800000010003B560);
  static Locale.current.getter(v28);
  v27(v12, v26, v9);
  LOWORD(v47) = 2;
  v29 = v62;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target_description", 18, 2, v18, 0, 0, v15, v12, "Description for the Calendar settings entity parameter that indicates which setting the user would like to target.", 114, v47);
  v54 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56);
  v54(v29, 0, 1, v19);
  v66 = 0;
  v30 = type metadata accessor for IntentDialog(0);
  v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56);
  v55 = v31;
  v32 = v63;
  v31(v63, 1, 1, v30);
  v33 = v58;
  v31(v58, 1, 1, v30);
  v52 = enum case for InputConnectionBehavior.default(_:);
  v34 = v59;
  v60 = *(_QWORD *)(v60 + 104);
  ((void (*)(char *))v60)(v59);
  v35 = sub_100023AB0();
  v58 = (char *)IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v24, v29, &v66, v32, v33, v34, v35);
  v53 = sub_100007E00(&qword_10005C8D0);
  v36 = String.LocalizationValue.init(stringLiteral:)(0x65756C6156, 0xE500000000000000);
  static Locale.current.getter(v36);
  v37 = v50;
  v38 = v51;
  v50(v12, v26, v51);
  LOWORD(v48) = 2;
  v39 = v57;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value", 5, 2, v18, 0, 0, v15, v12, "Calendar settings property title that indicates which property of a setting the user would like to set to as the value.", 119, v48);
  v40 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000026, 0x800000010003B6A0);
  static Locale.current.getter(v40);
  v37(v12, v26, v38);
  LOWORD(v49) = 2;
  v41 = v62;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value_description", 17, 2, v18, 0, 0, v15, v12, "Description for a Calendar settings property parameter that indicates which value of a setting the user would like to set to.", 125, v49);
  v54(v41, 0, 1, v56);
  v65[0] = 2;
  v42 = type metadata accessor for Bool.IntentDisplayName(0);
  v43 = v61;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v61, 1, 1, v42);
  v44 = v63;
  v55(v63, 1, 1, v30);
  ((void (*)(char *, _QWORD, uint64_t))v60)(v34, v52, v64);
  IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v39, v41, v65, v43, v44, v34);
  return v58;
}

uint64_t sub_1000258D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10002598C, 0, 0);
}

uint64_t sub_10002598C()
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
  __int16 v11;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100007E00(&qword_10005D3B8);
  v7 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000015, 0x8000000100041400);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  v11 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsShowInviteeDeclinesEntityName", 37, 2, v1, 0, 0, v4, v3, "Name of the SettingsShowInviteeDeclinesEntity type", 50, v11);
  v8 = sub_10000A9CC(&qword_10005D458, &qword_10005D460, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005D448, 0, &unk_10005D450, 0, &type metadata for UpdateIntent_showInviteeDeclines, v8);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v9);
}

uint64_t sub_100025AE4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

ValueMetadata *type metadata accessor for SettingsShowInviteeDeclinesToggleControl()
{
  return &type metadata for SettingsShowInviteeDeclinesToggleControl;
}

uint64_t sub_100025B00(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000503F4, 1);
}

uint64_t sub_100025B10(char a1)
{
  return *(_QWORD *)&aNoalert_4[8 * a1];
}

uint64_t sub_100025B30()
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

  v0 = sub_100007E00(&qword_10005D630);
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
  sub_100007F24(v16, qword_10005DEF8);
  sub_100007F0C(v16, (uint64_t)qword_10005DEF8);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000019, 0x8000000100040B10);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, _QWORD))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v19[0]);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0, 0, v8, v5, "Title for choosing an Default alert times for events.", 53, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v2, 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v2);
}

unint64_t sub_100025D44()
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
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
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t);
  void (*v50)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(char *, uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
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
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(char *, uint64_t, uint64_t);
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t result;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  _QWORD v117[2];
  uint64_t v118;
  _BYTE *v119;
  __int128 v120;
  uint64_t v121;
  void (*v122)(char *, uint64_t, uint64_t);
  char *v123;
  unsigned int v124;
  uint64_t v125;
  _BYTE *v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  __int128 v130;
  uint64_t v131;
  char *v132;
  char *v133;
  char *v134;
  char *v135;
  char *v136;
  char *v137;
  char *v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void (*v146)(char *, _QWORD, uint64_t, uint64_t);
  void (*v147)(char *, uint64_t, uint64_t);
  void (*v148)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;

  v0 = sub_100007E00(&qword_10005D190);
  v1 = __chkstk_darwin(v0);
  v139 = (char *)v117 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __chkstk_darwin(v1);
  v123 = (char *)v117 - v4;
  v5 = __chkstk_darwin(v3);
  v134 = (char *)v117 - v6;
  v7 = __chkstk_darwin(v5);
  v121 = (uint64_t)v117 - v8;
  __chkstk_darwin(v7);
  v126 = (char *)v117 - v9;
  v10 = sub_100007E00(&qword_10005D630);
  v11 = __chkstk_darwin(v10);
  v138 = (char *)v117 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v136 = (char *)v117 - v14;
  v15 = __chkstk_darwin(v13);
  v133 = (char *)v117 - v16;
  v17 = __chkstk_darwin(v15);
  v129 = (char *)v117 - v18;
  __chkstk_darwin(v17);
  v20 = (char *)v117 - v19;
  v21 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v151 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v23 = (char *)v117 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for Locale(0);
  __chkstk_darwin(v24);
  v26 = (char *)v117 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v27);
  v29 = (char *)v117 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = type metadata accessor for LocalizedStringResource(0);
  v31 = *(_QWORD *)(v30 - 8);
  v32 = __chkstk_darwin(v30);
  v137 = (char *)v117 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __chkstk_darwin(v32);
  v135 = (char *)v117 - v35;
  v36 = __chkstk_darwin(v34);
  v132 = (char *)v117 - v37;
  v38 = __chkstk_darwin(v36);
  v128 = (uint64_t)v117 - v39;
  __chkstk_darwin(v38);
  v41 = (char *)v117 - v40;
  v42 = sub_100007E00(&qword_10005D658);
  v152 = sub_100007E00(&qword_10005D660);
  v43 = *(_QWORD *)(v152 - 8);
  v44 = *(_QWORD *)(v43 + 72);
  v45 = *(unsigned __int8 *)(v43 + 80);
  v46 = (v45 + 32) & ~v45;
  v150 = v44;
  v47 = swift_allocObject(v42, v46 + 5 * v44, v45 | 7);
  v120 = xmmword_100047360;
  *(_OWORD *)(v47 + 16) = xmmword_100047360;
  v125 = v47;
  v149 = v47 + v46;
  *(_BYTE *)(v47 + v46) = 0;
  v48 = String.LocalizationValue.init(stringLiteral:)(1701736270, 0xE400000000000000);
  static Locale.current.getter(v48);
  v49 = *(void (**)(char *, uint64_t, uint64_t))(v151 + 104);
  v124 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v122 = v49;
  ((void (*)(char *))v49)(v23);
  v118 = (uint64_t)v41;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_None", 42, 2, v29, 0, 0, v26, v23, "Display name for choosing no alert for birthday events as default", 65, 2);
  v50 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56);
  v119 = v20;
  v151 = v30;
  v148 = v50;
  v50(v20, 1, 1, v30);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v51 = type metadata accessor for DisplayRepresentation.Image(0);
  v143 = sub_100007F0C(v51, (uint64_t)qword_10005DF80);
  v52 = *(_QWORD *)(v51 - 8);
  v147 = *(void (**)(char *, uint64_t, uint64_t))(v52 + 16);
  v53 = v126;
  v140 = v51;
  v147(v126, v143, v51);
  v146 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v52 + 56);
  v146(v53, 0, 1, v51);
  v145 = sub_100007E00(&qword_10005CC60);
  v54 = *(unsigned __int8 *)(v31 + 80);
  v141 = *(_QWORD *)(v31 + 72);
  v127 = 2 * v141;
  v142 = (v54 + 32) & ~v54;
  v131 = v142 + 2 * v141;
  v144 = v54 | 7;
  v55 = swift_allocObject(v145, v131, v54 | 7);
  v130 = xmmword_100047370;
  *(_OWORD *)(v55 + 16) = xmmword_100047370;
  v56 = String.LocalizationValue.init(stringLiteral:)(6710863, 0xE300000000000000);
  static Locale.current.getter(v56);
  v57 = v124;
  v58 = v122;
  v122(v23, v124, v21);
  LOWORD(v96) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_None_Synonym_Off", 54, 2, v29, 0, 0, v26, v23, "Synonym (\"Off\") for no alert for birthday events", 48, v96);
  v117[1] = v149 + *(int *)(v152 + 48);
  v59 = v149;
  v60 = String.LocalizationValue.init(stringLiteral:)(0x64656C6261736944, 0xE800000000000000);
  static Locale.current.getter(v60);
  v58(v23, v57, v21);
  LOWORD(v97) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_None_Synonym_Disabled", 59, 2, v29, 0, 0, v26, v23, "Synonym (\"Disabled\") for no alert for birthday events", 53, v97);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v118, v119, v126, v55);
  v126 = (_BYTE *)(v59 + v150);
  *v126 = 1;
  v61 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000015, 0x8000000100041B80);
  static Locale.current.getter(v61);
  v62 = v57;
  v58(v23, v57, v21);
  LOWORD(v98) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_DayOf", 43, 2, v29, 0, 0, v26, v23, "Display name for choosing default alarm as on day of event type", 63, v98);
  v148(v129, 1, 1, v151);
  v63 = (char *)v121;
  v64 = v140;
  v147((char *)v121, v143, v140);
  v146(v63, 0, 1, v64);
  v65 = swift_allocObject(v145, v131, v144);
  *(_OWORD *)(v65 + 16) = v130;
  v66 = String.LocalizationValue.init(stringLiteral:)(0x2079616420656854, 0xEA0000000000666FLL);
  static Locale.current.getter(v66);
  v58(v23, v57, v21);
  LOWORD(v99) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_DayOf_Synonym_TheDayOf", 60, 2, v29, 0, 0, v26, v23, "Synonym (\"The day of\") for the day of default alert setting for birthday events", 79, v99);
  v67 = String.LocalizationValue.init(stringLiteral:)(0x6E726F6D20656854, 0xEE00666F20676E69);
  static Locale.current.getter(v67);
  v58(v23, v57, v21);
  LOWORD(v100) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_DayOf_Synonym_TheMorningOf", 64, 2, v29, 0, 0, v26, v23, "Synonym (\"The morning of\") for the day of default alert setting for birthday events", 83, v100);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v128, v129, v63, v65);
  v121 = 2 * v150;
  v119 = (_BYTE *)(v149 + 2 * v150);
  *v119 = 2;
  v68 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000012, 0x8000000100041D50);
  static Locale.current.getter(v68);
  v69 = v21;
  v58(v23, v57, v21);
  LOWORD(v101) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_DayBefore", 47, 2, v29, 0, 0, v26, v23, "Display name for choosing default alarm as one day before event type", 68, v101);
  v148(v133, 1, 1, v151);
  v70 = v134;
  v71 = v140;
  v147(v134, v143, v140);
  v146(v70, 0, 1, v71);
  v72 = v141;
  v129 = (char *)(4 * v141);
  v128 = 5 * v141;
  v118 = swift_allocObject(v145, v142 + 5 * v141, v144);
  *(_OWORD *)(v118 + 16) = v120;
  v73 = String.LocalizationValue.init(stringLiteral:)(0x2079616420656854, 0xEE0065726F666562);
  static Locale.current.getter(v73);
  v58(v23, v62, v69);
  LOWORD(v102) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_DayBefore_Synonym_TheDayBefore", 68, 2, v29, 0, 0, v26, v23, "Synonym (\"The day before\") for the day before default alert setting for birthday events", 87, v102);
  v74 = String.LocalizationValue.init(stringLiteral:)(0x6562207961642041, 0xEC00000065726F66);
  static Locale.current.getter(v74);
  v58(v23, v62, v69);
  LOWORD(v103) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_DayBefore_Synonym_ADayBefore", 66, 2, v29, 0, 0, v26, v23, "Synonym (\"A day before\") for the day before default alert setting for birthday events", 85, v103);
  v75 = v127;
  v76 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000012, 0x8000000100041F70);
  static Locale.current.getter(v76);
  v58(v23, v62, v69);
  LOWORD(v104) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_DayBefore_Synonym_TheMorningBefore", 72, 2, v29, 0, 0, v26, v23, "Synonym (\"The morning before\") for the day before default alert setting for birthday events", 91, v104);
  v126 = (_BYTE *)(v75 + v72);
  v77 = String.LocalizationValue.init(stringLiteral:)(0x2079616420656E4FLL, 0xEE0065726F666562);
  static Locale.current.getter(v77);
  v58(v23, v62, v69);
  LOWORD(v105) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_DayBefore_Synonym_OneDayBefore", 68, 2, v29, 0, 0, v26, v23, "Synonym (\"One day before\") for the day before default alert setting for birthday events", 87, v105);
  v78 = String.LocalizationValue.init(stringLiteral:)(0x6562207961642031, 0xEC00000065726F66);
  static Locale.current.getter(v78);
  v58(v23, v62, v69);
  LOWORD(v106) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_DayBefore_Synonym_1DayBefore", 66, 2, v29, 0, 0, v26, v23, "Synonym (\"1 day before\") for the day before default alert setting for birthday events", 85, v106);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v132, v133, v134, v118);
  *(_BYTE *)(v149 + v121 + v150) = 3;
  v79 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x8000000100042190);
  static Locale.current.getter(v79);
  v58(v23, v62, v69);
  LOWORD(v107) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_2DaysBefore", 49, 2, v29, 0, 0, v26, v23, "Display name for choosing default alarm as two days before event type", 69, v107);
  v148(v136, 1, 1, v151);
  v80 = v123;
  v81 = v140;
  v147(v123, v143, v140);
  v146(v80, 0, 1, v81);
  v82 = swift_allocObject(v145, v131, v144);
  *(_OWORD *)(v82 + 16) = v130;
  v83 = String.LocalizationValue.init(stringLiteral:)(0x73796164206F7754, 0xEF65726F66656220);
  static Locale.current.getter(v83);
  v58(v23, v62, v69);
  LOWORD(v108) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_2DaysBefore_Synonym_TwoDaysBefore", 71, 2, v29, 0, 0, v26, v23, "Synonym (\"Two days before\") for the 2 days before default alert setting for birthday events", 91, v108);
  v84 = String.LocalizationValue.init(stringLiteral:)(0x6220737961642032, 0xED000065726F6665);
  static Locale.current.getter(v84);
  v58(v23, v62, v69);
  LOWORD(v109) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_2DaysBefore_Synonym_2DaysBefore", 69, 2, v29, 0, 0, v26, v23, "Synonym (\"2 days before\") for the 2 days before default alert setting for birthday events", 89, v109);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v135, v136, v80, v82);
  v150 = v149 + 4 * v150;
  *(_BYTE *)v150 = 4;
  v85 = String.LocalizationValue.init(stringLiteral:)(0x62206B6565772031, 0xED000065726F6665);
  static Locale.current.getter(v85);
  v86 = v58;
  v58(v23, v62, v69);
  LOWORD(v110) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_WeekBefore", 48, 2, v29, 0, 0, v26, v23, "Display name for choosing default alarm as one week before type", 63, v110);
  v148(v138, 1, 1, v151);
  v87 = v139;
  v88 = v140;
  v147(v139, v143, v140);
  v146(v87, 0, 1, v88);
  v151 = swift_allocObject(v145, v142 + 6 * v141, v144);
  *(_OWORD *)(v151 + 16) = xmmword_1000484C0;
  v89 = String.LocalizationValue.init(stringLiteral:)(0x62206B6565772041, 0xED000065726F6665);
  static Locale.current.getter(v89);
  v86(v23, v62, v69);
  LOWORD(v111) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_WeekBefore_Synonym_AWeekBefore", 68, 2, v29, 0, 0, v26, v23, "Synonym (\"A week before\") for the 1 week before default alert setting for birthday events", 89, v111);
  v90 = String.LocalizationValue.init(stringLiteral:)(0x6B65657720656854, 0xEF65726F66656220);
  static Locale.current.getter(v90);
  v86(v23, v62, v69);
  LOWORD(v112) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_WeekBefore_Synonym_TheWeekBefore", 70, 2, v29, 0, 0, v26, v23, "Synonym (\"The week before\") for the 1 week before default alert setting for birthday events", 91, v112);
  v91 = String.LocalizationValue.init(stringLiteral:)(0x6B65657720656E4FLL, 0xEF65726F66656220);
  static Locale.current.getter(v91);
  v86(v23, v62, v69);
  LOWORD(v113) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_WeekBefore_Synonym_OneWeekBefore", 70, 2, v29, 0, 0, v26, v23, "Synonym (\"One week before\") for the 1 week before default alert setting for birthday events", 91, v113);
  v92 = String.LocalizationValue.init(stringLiteral:)(0x62206B6565772031, 0xED000065726F6665);
  static Locale.current.getter(v92);
  v86(v23, v62, v69);
  LOWORD(v114) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_WeekBefore_Synonym_1WeekBefore", 68, 2, v29, 0, 0, v26, v23, "Synonym (\"1 week before\") for the 1 week before default alert setting for birthday events", 89, v114);
  v93 = String.LocalizationValue.init(stringLiteral:)(0x6220737961642037, 0xED000065726F6665);
  static Locale.current.getter(v93);
  v86(v23, v62, v69);
  LOWORD(v115) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_WeekBefore_Synonym_7DaysBefore", 68, 2, v29, 0, 0, v26, v23, "Synonym (\"7 days before\") for the 1 week before default alert setting for birthday events", 89, v115);
  v94 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x8000000100040900);
  static Locale.current.getter(v94);
  v86(v23, v62, v69);
  LOWORD(v116) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimeType_WeekBefore_Synonym_SevenDaysBefore", 72, 2, v29, 0, 0, v26, v23, "Synonym (\"Seven days before\") for the 1 week before default alert setting for birthday events", 93, v116);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v137, v138, v139, v151);
  result = sub_100032BC8(v125);
  qword_10005DF10 = result;
  return result;
}

uint64_t sub_100027204@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v20[24];

  v4 = sub_100007E00(&qword_10005CC78);
  __chkstk_darwin(v4);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = type metadata accessor for LocalizedStringResource(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (qword_10005C548 != -1)
    swift_once(&qword_10005C548, sub_100025D44);
  swift_beginAccess(&qword_10005DF10, v20, 32, 0);
  v11 = qword_10005DF10;
  if (*(_QWORD *)(qword_10005DF10 + 16) && (v12 = sub_1000374A8(a1), (v13 & 1) != 0))
  {
    v14 = v12;
    v15 = *(_QWORD *)(v11 + 56);
    v16 = type metadata accessor for DisplayRepresentation(0);
    v17 = *(_QWORD *)(v16 - 8);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v17 + 16))(v6, v15 + *(_QWORD *)(v17 + 72) * v14, v16);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v6, 0, 1, v16);
  }
  else
  {
    v16 = type metadata accessor for DisplayRepresentation(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  type metadata accessor for DisplayRepresentation(0);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v6, 1, v16))
  {
    sub_100010A58((uint64_t)v6);
    swift_endAccess(v20);
    return LocalizedStringResource.init(stringLiteral:)(0, 0xE000000000000000);
  }
  else
  {
    DisplayRepresentation.title.getter();
    sub_100010A58((uint64_t)v6);
    swift_endAccess(v20);
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v8 + 32))(a2, v10, v7);
  }
}

uint64_t sub_1000273F8(char *a1, char *a2)
{
  return sub_100032C1C(*a1, *a2);
}

unint64_t sub_100027408()
{
  unint64_t result;

  result = qword_10005D490;
  if (!qword_10005D490)
  {
    result = swift_getWitnessTable(&unk_1000497BC, &type metadata for SettingsBirthdaysDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D490);
  }
  return result;
}

Swift::Int sub_10002744C()
{
  char *v0;

  return sub_10003326C(*v0);
}

uint64_t sub_100027454(uint64_t a1)
{
  char *v1;

  return sub_10003333C(a1, *v1);
}

Swift::Int sub_10002745C(uint64_t a1)
{
  char *v1;

  return sub_100033774(a1, *v1);
}

unint64_t sub_100027464@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_100029EC4(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100027490@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_100025B10(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_1000274BC()
{
  unint64_t result;

  result = qword_10005D498;
  if (!qword_10005D498)
  {
    result = swift_getWitnessTable(&unk_1000498D4, &type metadata for SettingsBirthdaysDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D498);
  }
  return result;
}

unint64_t sub_100027504()
{
  unint64_t result;

  result = qword_10005D4A0;
  if (!qword_10005D4A0)
  {
    result = swift_getWitnessTable(&unk_10004990C, &type metadata for SettingsBirthdaysDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D4A0);
  }
  return result;
}

unint64_t sub_10002754C()
{
  unint64_t result;

  result = qword_10005D4A8;
  if (!qword_10005D4A8)
  {
    result = swift_getWitnessTable(&unk_100049824, &type metadata for SettingsBirthdaysDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D4A8);
  }
  return result;
}

unint64_t sub_100027594()
{
  unint64_t result;

  result = qword_10005D4B0;
  if (!qword_10005D4B0)
  {
    result = swift_getWitnessTable(&unk_10004993C, &type metadata for SettingsBirthdaysDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D4B0);
  }
  return result;
}

unint64_t sub_1000275DC()
{
  unint64_t result;

  result = qword_10005D4B8;
  if (!qword_10005D4B8)
  {
    result = swift_getWitnessTable(&unk_100049964, &type metadata for SettingsBirthdaysDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D4B8);
  }
  return result;
}

unint64_t sub_100027628()
{
  unint64_t result;

  result = qword_10005D4C8;
  if (!qword_10005D4C8)
  {
    result = swift_getWitnessTable(&unk_1000499E4, &type metadata for SettingsBirthdaysDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D4C8);
  }
  return result;
}

uint64_t sub_10002766C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000773C(&qword_10005C540, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005DEF8, (uint64_t)sub_100025B30, a1);
}

uint64_t sub_100027690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076D8(a1, a2, a3, (uint64_t (*)(void))sub_1000276A4, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

unint64_t sub_1000276A4()
{
  unint64_t result;

  result = qword_10005D4D0;
  if (!qword_10005D4D0)
  {
    result = swift_getWitnessTable(&unk_10004985C, &type metadata for SettingsBirthdaysDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D4D0);
  }
  return result;
}

uint64_t sub_1000276E8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000276A4();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100027724()
{
  unint64_t result;

  result = qword_10005D4D8;
  if (!qword_10005D4D8)
  {
    result = swift_getWitnessTable(&unk_100049A24, &type metadata for SettingsBirthdaysDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D4D8);
  }
  return result;
}

unint64_t sub_10002776C()
{
  unint64_t result;

  result = qword_10005D4E0;
  if (!qword_10005D4E0)
  {
    result = swift_getWitnessTable(&unk_100049A4C, &type metadata for SettingsBirthdaysDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D4E0);
  }
  return result;
}

unint64_t sub_1000277B4()
{
  unint64_t result;

  result = qword_10005D4E8;
  if (!qword_10005D4E8)
  {
    result = swift_getWitnessTable(&unk_1000497E4, &type metadata for SettingsBirthdaysDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D4E8);
  }
  return result;
}

uint64_t sub_1000277F8()
{
  _BYTE v1[24];

  if (qword_10005C548 != -1)
    swift_once(&qword_10005C548, sub_100025D44);
  swift_beginAccess(&qword_10005DF10, v1, 0, 0);
  return swift_bridgeObjectRetain(qword_10005DF10);
}

uint64_t sub_100027864(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100027628();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10002789C()
{
  return sub_10000A9CC(&qword_10005D4F0, &qword_10005D4F8, (uint64_t)&protocol conformance descriptor for [A]);
}

void sub_1000278C8(_QWORD *a1@<X8>)
{
  *a1 = &off_100054FB8;
}

unint64_t sub_1000278DC()
{
  unint64_t result;

  result = qword_10005D500;
  if (!qword_10005D500)
  {
    result = swift_getWitnessTable(&unk_100049AE4, &type metadata for SettingsBirthdaysDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D500);
  }
  return result;
}

unint64_t sub_100027924()
{
  unint64_t result;

  result = qword_10005D508;
  if (!qword_10005D508)
  {
    result = swift_getWitnessTable(&unk_100049E20, &type metadata for SettingsBirthdaysDefaultAlertTimesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D508);
  }
  return result;
}

uint64_t sub_100027968(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v3;
  return swift_task_switch(sub_100027984, 0, 0);
}

uint64_t sub_100027984()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;
  double v8;

  AppDependency.wrappedValue.getter();
  v1 = *(void **)(v0 + 16);
  v2 = objc_msgSend(v1, "eventStore");
  swift_unknownObjectRelease(v1);
  if (v2)
  {
    v3 = objc_msgSend(v2, "eventSources");
    v4 = objc_msgSend(objc_allocWithZone((Class)CUIKDefaultAlarmPreferences), "init");
    v5 = objc_msgSend(v4, "defaultBirthdayAlarmOffsetForSources:", v3);

    v6 = objc_msgSend(v5, "integerValue");
    if (v6 == (id)NSNotFound.getter(v6))
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v5, "doubleValue");
      v7 = sub_100029E28(v8);
    }

  }
  else
  {
    v7 = 0;
  }
  **(_BYTE **)(v0 + 24) = v7;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100027AA4(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = *(_QWORD *)(a1 + 8);
  *(_BYTE *)(v2 + 32) = *a2;
  return swift_task_switch(sub_100027AC8, 0, 0);
}

uint64_t sub_100027AC8()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  id v4;

  AppDependency.wrappedValue.getter();
  v1 = *(void **)(v0 + 16);
  v2 = objc_msgSend(v1, "eventStore");
  swift_unknownObjectRelease(v1);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(v0 + 32);
    v4 = objc_msgSend(v2, "eventSources");
    objc_msgSend(objc_allocWithZone((Class)CUIKDefaultAlarmPreferences), "init");
    __asm { BR              X9 }
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100027CA0()
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
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  __int16 v19;
  _BYTE v20[16];

  v0 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v0);
  v2 = &v20[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v10);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v20[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000001DLL, 0x80000001000417A0);
  static Locale.current.getter(v17);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  v19 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimesEntityName", 44, 2, v12, 0, 0, v9, v6, "Name of the SettingsBirthdaysDefaultAlertTimesEntity type", 57, v19);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v2, 1, 1, v13);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v16, v2);
}

uint64_t sub_100027EAC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v32 = a1;
  v1 = sub_100007E00(&qword_10005D190);
  __chkstk_darwin(v1);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v4);
  v31 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Locale(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for LocalizedStringResource(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v30 - v21;
  v23 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000001DLL, 0x80000001000417A0);
  static Locale.current.getter(v23);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimesEntityName", 44, 2, v15, 0, 0, v12, v9, "Name of the SettingsBirthdaysDefaultAlertTimesEntity type", 57, 2);
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v25 = v31;
  v24(v31, 1, 1, v16);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v26 = type metadata accessor for DisplayRepresentation.Image(0);
  v27 = sub_100007F0C(v26, (uint64_t)qword_10005DF80);
  v28 = *(_QWORD *)(v26 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v3, v27, v26);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v3, 0, 1, v26);
  LocalizedStringResource.init(stringLiteral:)(0xD0000000000000C3, 0x80000001000418D0);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v22, v25, v3, &_swiftEmptyArrayStorage, v20);
}

uint64_t sub_1000281B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  _OWORD v7[2];
  uint64_t v8;

  sub_100007E00(&qword_10005D160);
  v0 = type metadata accessor for AppDependencyManager(0);
  memset(v7, 0, sizeof(v7));
  v8 = 0;
  v5 = static AppDependencyManager.shared.getter(v0, v1, v2, v3, v4);
  result = AppDependency.__allocating_init(key:manager:)(v7, v5);
  qword_10005DF18 = result;
  return result;
}

uint64_t sub_10002821C()
{
  uint64_t v0;

  v0 = qword_10005D480;
  swift_bridgeObjectRetain(off_10005D488);
  return v0;
}

unint64_t sub_100028254()
{
  unint64_t result;

  result = qword_10005D510;
  if (!qword_10005D510)
  {
    result = swift_getWitnessTable(&unk_100049B3C, &type metadata for SettingsBirthdaysDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D510);
  }
  return result;
}

unint64_t sub_10002829C()
{
  unint64_t result;

  result = qword_10005D518;
  if (!qword_10005D518)
  {
    result = swift_getWitnessTable(&unk_100049B74, &type metadata for SettingsBirthdaysDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D518);
  }
  return result;
}

unint64_t sub_1000282E4()
{
  unint64_t result;

  result = qword_10005D520;
  if (!qword_10005D520)
  {
    result = swift_getWitnessTable(&unk_100049BA4, &type metadata for SettingsBirthdaysDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D520);
  }
  return result;
}

unint64_t sub_10002832C()
{
  unint64_t result;

  result = qword_10005D528;
  if (!qword_10005D528)
  {
    result = swift_getWitnessTable(&unk_100049E98, &type metadata for SettingsBirthdaysDefaultAlertTimesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D528);
  }
  return result;
}

uint64_t sub_100028370@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  if (qword_10005C550 != -1)
    swift_once(&qword_10005C550, sub_1000281B8);
  v2 = qword_10005DF18;
  *a1 = qword_10005DF18;
  return swift_retain(v2);
}

unint64_t sub_1000283C4()
{
  unint64_t result;

  result = qword_10005D530;
  if (!qword_10005D530)
  {
    result = swift_getWitnessTable(&unk_100049BDC, &type metadata for SettingsBirthdaysDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D530);
  }
  return result;
}

unint64_t sub_10002840C()
{
  unint64_t result;

  result = qword_10005D538;
  if (!qword_10005D538)
  {
    result = swift_getWitnessTable(&unk_100049C04, &type metadata for SettingsBirthdaysDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D538);
  }
  return result;
}

unint64_t sub_100028454()
{
  unint64_t result;

  result = qword_10005D540;
  if (!qword_10005D540)
  {
    result = swift_getWitnessTable(&unk_100049C2C, &type metadata for SettingsBirthdaysDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D540);
  }
  return result;
}

unint64_t sub_10002849C()
{
  unint64_t result;

  result = qword_10005D548;
  if (!qword_10005D548)
  {
    result = swift_getWitnessTable(&unk_100049C84, &type metadata for SettingsBirthdaysDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D548);
  }
  return result;
}

void sub_1000284E0(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000002ALL;
  a1[1] = 0x80000001000419A0;
}

uint64_t sub_100028504()
{
  return sub_10000A9CC(&qword_10005D550, &qword_10005D558, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100028530(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000278DC();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10002856C()
{
  unint64_t result;

  result = qword_10005D560;
  if (!qword_10005D560)
  {
    result = swift_getWitnessTable(&unk_100049CB4, &type metadata for SettingsBirthdaysDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005D560);
  }
  return result;
}

uint64_t sub_1000285B4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10002849C();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_1000285F0()
{
  return sub_10000A9CC(&qword_10005D570, &qword_10005D578, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_10002861C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v13;
  _BYTE v14[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_100007F24(v10, qword_10005DF20);
  sub_100007F0C(v10, (uint64_t)qword_10005DF20);
  v11 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000024, 0x8000000100041840);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  v13 = 2;
  return LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("UpdateSettingsBirthdaysDefaultAlertTimesIntent_title", 52, 2, v9, 0, 0, v6, v3, "Display string for the title of the UpdateSettingsBirthdaysDefaultAlertTimesIntent", 82, v13);
}

uint64_t sub_1000287B0()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_10004A060);
  qword_10005DF38 = result;
  return result;
}

uint64_t sub_1000287D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = type metadata accessor for MainActor(0);
  v3[9] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v3[10] = v5;
  v3[11] = v6;
  return swift_task_switch(sub_100028844, v5, v6);
}

uint64_t sub_100028844()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = v0[2];
  v0[4] = v1;
  v2 = v0[3];
  v0[12] = v1;
  v0[13] = v2;
  v0[5] = v2;
  IntentParameter.wrappedValue.getter(v0 + 17);
  if (qword_10005C560 != -1)
    swift_once(&qword_10005C560, sub_1000287B0);
  v3 = qword_10005DF38;
  v0[14] = qword_10005DF38;
  v4 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v3);
  v5 = (_QWORD *)swift_task_alloc(v4);
  v0[15] = v5;
  v6 = sub_10000A9CC(&qword_10005D618, (uint64_t *)&unk_10005D620, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v5 = v0;
  v5[1] = sub_10001C210;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 17, v3, &type metadata for SettingsBirthdaysDefaultAlertTimeType, v6);
}

uint64_t sub_100028940()
{
  if (qword_10005C560 != -1)
    swift_once(&qword_10005C560, sub_1000287B0);
  return swift_retain(qword_10005DF38);
}

unint64_t sub_100028984()
{
  unint64_t result;

  result = qword_10005D580;
  if (!qword_10005D580)
  {
    result = swift_getWitnessTable(&unk_100049DDC, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D580);
  }
  return result;
}

unint64_t sub_1000289CC()
{
  unint64_t result;

  result = qword_10005D588;
  if (!qword_10005D588)
  {
    result = swift_getWitnessTable(&unk_100049E04, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D588);
  }
  return result;
}

uint64_t sub_100028A10(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10005048C, 1);
}

uint64_t sub_100028A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076D8(a1, a2, a3, (uint64_t (*)(void))sub_100023764, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t sub_100028A34@<X0>(uint64_t a1@<X8>)
{
  return sub_10000773C(&qword_10005C558, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005DF20, (uint64_t)sub_10002861C, a1);
}

uint64_t sub_100028A58(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005D64C);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_100009170;
  return sub_1000287D4(a1, v5, v4);
}

uint64_t sub_100028ABC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = sub_100029828();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_100028AE4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100023764();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100028B10()
{
  unint64_t result;

  result = qword_10005D598;
  if (!qword_10005D598)
  {
    result = swift_getWitnessTable(&unk_100049E60, &type metadata for SettingsBirthdaysDefaultAlertTimesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D598);
  }
  return result;
}

unint64_t sub_100028B58()
{
  unint64_t result;

  result = qword_10005D5A0[0];
  if (!qword_10005D5A0[0])
  {
    result = swift_getWitnessTable(&unk_100049A84, &type metadata for SettingsBirthdaysDefaultAlertTimesEntity);
    atomic_store(result, qword_10005D5A0);
  }
  return result;
}

uint64_t sub_100028B9C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v3;
  return swift_task_switch(sub_100028BB8, 0, 0);
}

uint64_t sub_100028BB8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = *(uint64_t **)(v0 + 24);
  AppDependency.wrappedValue.getter();
  *v1 = sub_100029F0C(*(_QWORD *)(v0 + 16));
  v1[1] = v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100028BFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100027924();
  *v4 = v2;
  v4[1] = sub_100009358;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_100028C68()
{
  unint64_t result;

  result = qword_10005D5B8;
  if (!qword_10005D5B8)
  {
    result = swift_getWitnessTable(&unk_100049EF0, &type metadata for SettingsBirthdaysDefaultAlertTimesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D5B8);
  }
  return result;
}

unint64_t sub_100028CB0()
{
  unint64_t result;

  result = qword_10005D5C0[0];
  if (!qword_10005D5C0[0])
  {
    result = swift_getWitnessTable(&unk_100049F50, &type metadata for SettingsBirthdaysDefaultAlertTimesEntityQuery);
    atomic_store(result, qword_10005D5C0);
  }
  return result;
}

uint64_t sub_100028CF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100027924();
  *v5 = v2;
  v5[1] = sub_1000094B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100028D60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100027924();
  *v4 = v2;
  v4[1] = sub_10000AB54;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100028DCC()
{
  unint64_t result;

  result = qword_10005D5D8;
  if (!qword_10005D5D8)
  {
    result = swift_getWitnessTable(&unk_100049F78, &type metadata for SettingsBirthdaysDefaultAlertTimesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D5D8);
  }
  return result;
}

unint64_t sub_100028E14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005D5E0;
  if (!qword_10005D5E0)
  {
    v1 = sub_100007220(qword_10005D5E8);
    sub_100028454();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005D5E0);
  }
  return result;
}

uint64_t sub_100028E78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10002832C();
  *v5 = v2;
  v5[1] = sub_10000AB50;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t destroy for UpdateIntent_birthdaysDefaultAlertTimeType(_QWORD *a1)
{
  swift_release(*a1);
  swift_release(a1[1]);
  return swift_release(a1[2]);
}

uint64_t *_s23CalendarWidgetExtension42UpdateIntent_birthdaysDefaultAlertTimeTypeVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[2];
  a1[2] = v5;
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  return a1;
}

uint64_t *assignWithCopy for UpdateIntent_birthdaysDefaultAlertTimeType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  v8 = a2[2];
  v9 = a1[2];
  a1[2] = v8;
  swift_retain(v8);
  swift_release(v9);
  return a1;
}

__n128 initializeWithTake for UpdateIntent_birthdaysDefaultAlertTimeType(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *assignWithTake for UpdateIntent_birthdaysDefaultAlertTimeType(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release(v4);
  v5 = a1[2];
  a1[2] = *(_QWORD *)(a2 + 16);
  swift_release(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for UpdateIntent_birthdaysDefaultAlertTimeType(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for UpdateIntent_birthdaysDefaultAlertTimeType(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for UpdateIntent_birthdaysDefaultAlertTimeType()
{
  return &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType;
}

ValueMetadata *type metadata accessor for SettingsBirthdaysDefaultAlertTimesEntityQuery()
{
  return &type metadata for SettingsBirthdaysDefaultAlertTimesEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsBirthdaysDefaultAlertTimesEntity()
{
  return &type metadata for SettingsBirthdaysDefaultAlertTimesEntity;
}

uint64_t storeEnumTagSinglePayload for SettingsBirthdaysDefaultAlertTimeType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10002913C + 4 * byte_1000497B5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100029170 + 4 * byte_1000497B0[v4]))();
}

uint64_t sub_100029170(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100029178(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100029180);
  return result;
}

uint64_t sub_10002918C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100029194);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_100029198(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000291A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SettingsBirthdaysDefaultAlertTimeType()
{
  return &type metadata for SettingsBirthdaysDefaultAlertTimeType;
}

uint64_t sub_1000291BC@<X0>(uint64_t a1@<X8>)
{
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
  id v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t KeyPath;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t OpaqueTypeConformance2;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  Swift::String v45;

  v42 = a1;
  v1 = type metadata accessor for ControlSize(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00((uint64_t *)&unk_10005D1B0);
  v37 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007E00(&qword_10005CC68);
  v8 = *(_QWORD *)(v7 - 8);
  v38 = v7;
  v39 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100007E00(&qword_10005D1C0);
  v12 = *(_QWORD *)(v11 - 8);
  v40 = v11;
  v41 = v12;
  __chkstk_darwin(v11);
  v36 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v15._countAndFlagsBits = 0xD000000000000023;
  v45._countAndFlagsBits = 0xD000000000000038;
  v45._object = (void *)0x8000000100042860;
  v15._object = (void *)0x8000000100042830;
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  v17 = NSLocalizedString(_:tableName:bundle:value:comment:)(v15, (Swift::String_optional)0, (NSBundle)v14, v16, v45);

  KeyPath = swift_getKeyPath(&unk_10004A060);
  static ControlSize._1x1.getter();
  v19 = sub_1000276A4();
  v20 = sub_10002A1D4();
  v21 = sub_100028B58();
  ControlPicker.init<A, B, C, D, E, F, G>(kind:displayName:preferredSize:intentUpdatableProperty:title:value:affordances:)(0xD00000000000002CLL, 0x8000000100042800, v17._countAndFlagsBits, v17._object, v3, KeyPath, sub_100029538, 0, sub_1000296F0, 0, sub_100029774, 0, &type metadata for Text, &type metadata for Text, v19, v20, v21, &protocol witness table for Text, &protocol witness table for Text);
  v22 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000019, 0x80000001000428A0);
  v24 = v23;
  LOBYTE(v20) = v25;
  v27 = v26;
  v28 = sub_10000A9CC(&qword_10005D1D0, (uint64_t *)&unk_10005D1B0, (uint64_t)&protocol conformance descriptor for ControlPicker<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v22, v24, v20 & 1, v27, v4, v28);
  swift_bridgeObjectRelease(v27);
  swift_bridgeObjectRelease(v24);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v6, v4);
  v43 = v4;
  v44 = v28;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v43, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v30 = v36;
  v31 = v38;
  WidgetConfiguration.disablesControlStateCaching()(v38, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v31);
  v43 = v31;
  v44 = OpaqueTypeConformance2;
  v32 = swift_getOpaqueTypeConformance2(&v43, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v33 = v40;
  WidgetConfiguration.hiddenControl()(v40, v32);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v30, v33);
}

uint64_t sub_100029538@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  char v15;
  uint64_t v16;
  __int16 v17;
  _BYTE v18[16];

  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = &v18[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin();
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000023, 0x8000000100042830);
  static Locale.current.getter(v12);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  v17 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdayDefaultAlertTimesEntityName", 43, 2, v9, 0, 0, v7, v5, "Name of the SettingsBirthdayDefaultAlertTimesEntity type", 56, v17);
  result = Text.init(_:)(v11);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v14;
  *(_BYTE *)(a1 + 16) = v15 & 1;
  *(_QWORD *)(a1 + 24) = v16;
  return result;
}

uint64_t sub_1000296F0@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v4 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100027204(*a1, (uint64_t)v6);
  result = Text.init(_:)(v6);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v8;
  *(_BYTE *)(a2 + 16) = v9 & 1;
  *(_QWORD *)(a2 + 24) = v10;
  return result;
}

uint64_t sub_100029774(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100027204(*a1, (uint64_t)v4);
  v5 = Text.init(_:)(v4);
  return ControlAffordances.init(tint:status:actionHint:)(0, v5, v7, v6 & 1, v8, 0, 0, 0, 0);
}

uint64_t sub_100029828()
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
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_BYTE *, uint64_t, uint64_t);
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  void (*v29)(_BYTE *, uint64_t, uint64_t, uint64_t);
  _BYTE *v30;
  _BYTE *v31;
  _BYTE *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v38;
  uint64_t v39;
  _BYTE *v40;
  _BYTE *v41;
  _BYTE *v42;
  _BYTE *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v52;
  int v53;
  int v54;
  _BYTE v55[12];
  unsigned int v56;
  uint64_t v57;
  void (*v58)(_BYTE *, uint64_t, uint64_t);
  unsigned int v59;
  void (*v60)(_BYTE *);
  uint64_t v61;
  void (*v62)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v63;
  _BYTE *v64;
  uint64_t v65;
  _BYTE *v66;
  _BYTE *v67;
  _BYTE *v68;
  _BYTE *v69;
  uint64_t v70;
  _OWORD v71[2];
  uint64_t v72;

  v70 = type metadata accessor for InputConnectionBehavior(0);
  v65 = *(_QWORD *)(v70 - 8);
  __chkstk_darwin(v70);
  v69 = &v55[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v1 = sub_100007E00((uint64_t *)&unk_10005D140);
  v2 = __chkstk_darwin(v1);
  v68 = &v55[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  v67 = &v55[-v4];
  v5 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v5);
  v66 = &v55[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v55[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = type metadata accessor for Locale(0);
  __chkstk_darwin(v11);
  v13 = &v55[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v14);
  v16 = &v55[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = type metadata accessor for LocalizedStringResource(0);
  v18 = *(_QWORD *)(v17 - 8);
  v63 = v17;
  v19 = __chkstk_darwin(v17);
  v64 = &v55[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v19);
  v22 = &v55[-v21];
  v61 = sub_100007E00(&qword_10005D638);
  v23 = String.LocalizationValue.init(stringLiteral:)(0x746567726154, 0xE600000000000000);
  static Locale.current.getter(v23);
  v24 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v25 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 104);
  v56 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v57 = v7;
  v25(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  v58 = v25;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target", 6, 2, v16, 0, 0, v13, v10, "Calendar settings entity title that indicates which setting the user would like to target.", 90, 2);
  v26 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x800000010003B560);
  static Locale.current.getter(v26);
  v25(v10, v24, v7);
  LOWORD(v52) = 2;
  v27 = v66;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target_description", 18, 2, v16, 0, 0, v13, v10, "Description for the Calendar settings entity parameter that indicates which setting the user would like to target.", 114, v52);
  v62 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v18 + 56);
  v62(v27, 0, 1, v17);
  v28 = type metadata accessor for IntentDialog(0);
  v71[0] = 0uLL;
  v29 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56);
  v30 = v67;
  v29(v67, 1, 1, v28);
  v31 = v68;
  v29(v68, 1, 1, v28);
  v59 = enum case for InputConnectionBehavior.default(_:);
  v60 = *(void (**)(_BYTE *))(v65 + 104);
  v32 = v69;
  v60(v69);
  v33 = sub_1000278DC();
  v65 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v22, v27, v71, v30, v31, v32, v33);
  v61 = sub_100007E00(&qword_10005D640);
  v34 = String.LocalizationValue.init(stringLiteral:)(0x65756C6156, 0xE500000000000000);
  static Locale.current.getter(v34);
  v35 = v56;
  v36 = v57;
  v37 = v58;
  v58(v10, v56, v57);
  LOWORD(v53) = 2;
  v38 = v64;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value", 5, 2, v16, 0, 0, v13, v10, "Calendar settings property title that indicates which property of a setting the user would like to set to as the value.", 119, v53);
  v39 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000026, 0x800000010003B6A0);
  static Locale.current.getter(v39);
  v37(v10, v35, v36);
  LOWORD(v54) = 2;
  v40 = v66;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value_description", 17, 2, v16, 0, 0, v13, v10, "Description for a Calendar settings property parameter that indicates which value of a setting the user would like to set to.", 125, v54);
  v62(v40, 0, 1, v63);
  LOBYTE(v71[0]) = 5;
  v41 = v67;
  v29(v67, 1, 1, v28);
  v42 = v68;
  v29(v68, 1, 1, v28);
  v43 = v69;
  ((void (*)(_BYTE *, _QWORD, uint64_t))v60)(v69, v59, v70);
  v44 = sub_1000276A4();
  IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v38, v40, v71, v41, v42, v43, &off_100054EA8, v44);
  sub_100007E00(&qword_10005D160);
  v45 = type metadata accessor for AppDependencyManager(0);
  memset(v71, 0, sizeof(v71));
  v72 = 0;
  v50 = static AppDependencyManager.shared.getter(v45, v46, v47, v48, v49);
  AppDependency.__allocating_init(key:manager:)(v71, v50);
  return v65;
}

uint64_t sub_100029E28(double a1)
{
  if ((double)NSNotFound.getter() == a1)
    return 0;
  if (a1 == 32400.0)
    return 1;
  if (a1 == -54000.0)
    return 2;
  if (a1 == -140400.0)
    return 3;
  return 4 * (a1 == -572400.0);
}

unint64_t sub_100029EC4(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100054F20, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 5)
    return 5;
  else
    return v3;
}

uint64_t sub_100029F0C(uint64_t a1)
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
  char *v14;
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
  _OWORD v27[2];
  uint64_t v28;

  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v12);
  v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007E00(&qword_10005D578);
  v15 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000001DLL, 0x80000001000417A0);
  static Locale.current.getter(v15);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsBirthdaysDefaultAlertTimesEntityName", 44, 2, v11, 0, 0, v8, v5, "Name of the SettingsBirthdaysDefaultAlertTimesEntity type", 57, 2);
  v16 = sub_10000A9CC(&qword_10005D618, (uint64_t *)&unk_10005D620, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v17 = sub_1000276A4();
  v18 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v14, &unk_10005D608, 0, &unk_10005D610, 0, &type metadata for UpdateIntent_birthdaysDefaultAlertTimeType, v16, v17);
  sub_100007E00(&qword_10005D160);
  type metadata accessor for AppDependencyManager(0);
  memset(v27, 0, sizeof(v27));
  v28 = 0;
  v19 = swift_retain(v18);
  v24 = static AppDependencyManager.shared.getter(v19, v20, v21, v22, v23);
  v25 = AppDependency.__allocating_init(key:manager:)(v27, v24);
  *(_QWORD *)&v27[0] = a1;
  swift_retain(v18);
  swift_retain(v25);
  swift_unknownObjectRetain(a1);
  AppDependency.wrappedValue.setter(v27);
  swift_release(v25);
  swift_release_n(v18, 2);
  swift_unknownObjectRelease(a1);
  return v18;
}

uint64_t sub_10002A1A8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

ValueMetadata *type metadata accessor for SettingsBirthdayDefaultAlertTimesPickerControl()
{
  return &type metadata for SettingsBirthdayDefaultAlertTimesPickerControl;
}

uint64_t sub_10002A1C4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000504D0, 1);
}

unint64_t sub_10002A1D4()
{
  unint64_t result;

  result = qword_10005D668;
  if (!qword_10005D668)
  {
    result = swift_getWitnessTable(&unk_10004989C, &type metadata for SettingsBirthdaysDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005D668);
  }
  return result;
}

uint64_t sub_10002A218(char a1)
{
  return *(_QWORD *)&aSystemsesunday[8 * a1];
}

uint64_t sub_10002A238()
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

  v0 = sub_100007E00(&qword_10005D630);
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
  sub_100007F24(v16, qword_10005DF40);
  sub_100007F0C(v16, (uint64_t)qword_10005DF40);
  v17 = String.LocalizationValue.init(stringLiteral:)(0x617453206B656557, 0xEE00796144207472);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, _QWORD))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v19[0]);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0, 0, v8, v5, "Title for choosing a Week Start Day", 35, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v2, 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v2);
}

unint64_t sub_10002A454()
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
  char *v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  void (*v48)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  void (*v60)(char *, uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(char *, _QWORD, uint64_t, uint64_t);
  _BYTE *v74;
  _BYTE *v75;
  char *v76;
  uint64_t v77;
  char *v78;
  char *v79;
  void (*v80)(char *, uint64_t, uint64_t);
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  char *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  char *v94;
  char *v95;
  uint64_t v96;
  void (*v97)(char *, uint64_t, uint64_t, uint64_t);
  char *v98;
  char *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  void (*v106)(char *, uint64_t, uint64_t);
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  _BYTE *v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  char *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  char *v121;
  uint64_t v122;
  void (*v123)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void (*v127)(char *, _QWORD, uint64_t, uint64_t);
  char *v128;
  _BYTE *v129;
  char *v130;
  uint64_t v131;
  char *v132;
  char *v133;
  uint64_t v134;
  void (*v135)(char *, uint64_t, uint64_t);
  char *v136;
  char *v137;
  char *v138;
  char *v139;
  char *v140;
  uint64_t v141;
  void (*v142)(char *, uint64_t, uint64_t);
  char *v143;
  _BYTE *v144;
  uint64_t v145;
  char *v146;
  unint64_t result;
  int v148;
  int v149;
  int v150;
  int v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  _QWORD v157[2];
  char *v158;
  char *v159;
  _BYTE *v160;
  char *v161;
  char *v162;
  char *v163;
  char *v164;
  char *v165;
  uint64_t v166;
  char *v167;
  char *v168;
  char *v169;
  char *v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  void (*v174)(char *, uint64_t, uint64_t);
  char *v175;
  char *v176;
  void (*v177)(char *, _QWORD, uint64_t, uint64_t);
  void (*v178)(char *, uint64_t, uint64_t);
  char *v179;
  void (*v180)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  _BYTE *v186;

  v0 = sub_100007E00(&qword_10005D190);
  v1 = __chkstk_darwin(v0);
  v170 = (char *)v157 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  v169 = (char *)v157 - v3;
  v4 = sub_100007E00(&qword_10005D630);
  v5 = __chkstk_darwin(v4);
  v175 = (char *)v157 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v8 = (char *)v157 - v7;
  v9 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v184 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v11 = (char *)v157 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Locale(0);
  __chkstk_darwin(v12);
  v14 = (char *)v157 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v15);
  v17 = (char *)v157 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for LocalizedStringResource(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = __chkstk_darwin(v18);
  v167 = (char *)v157 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __chkstk_darwin(v20);
  v165 = (char *)v157 - v23;
  v24 = __chkstk_darwin(v22);
  v164 = (char *)v157 - v25;
  v26 = __chkstk_darwin(v24);
  v163 = (char *)v157 - v27;
  v28 = __chkstk_darwin(v26);
  v162 = (char *)v157 - v29;
  v30 = __chkstk_darwin(v28);
  v161 = (char *)v157 - v31;
  v32 = __chkstk_darwin(v30);
  v159 = (char *)v157 - v33;
  v34 = __chkstk_darwin(v32);
  v179 = (char *)v157 - v35;
  __chkstk_darwin(v34);
  v37 = (char *)v157 - v36;
  v38 = sub_100007E00(&qword_10005D828);
  v182 = sub_100007E00(&qword_10005D830);
  v39 = *(_QWORD *)(v182 - 8);
  v40 = *(_BYTE **)(v39 + 72);
  v41 = *(unsigned __int8 *)(v39 + 80);
  v42 = (v41 + 32) & ~v41;
  v186 = v40;
  v43 = v38;
  v44 = v9;
  v45 = swift_allocObject(v43, v42 + 8 * (_QWORD)v40, v41 | 7);
  *(_OWORD *)(v45 + 16) = xmmword_10004A180;
  v166 = v45;
  v185 = v45 + v42;
  *(_BYTE *)(v45 + v42) = 0;
  v46 = String.LocalizationValue.init(stringLiteral:)(0x53206D6574737953, 0xEE00676E69747465);
  static Locale.current.getter(v46);
  v47 = *(void (**)(char *, uint64_t, uint64_t))(v184 + 104);
  v181 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v174 = v47;
  ((void (*)(char *))v47)(v11);
  v158 = v37;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsStartWeekOnType_SystemSetting", 37, 2, v17, 0, 0, v14, v11, "Display name for System Setting option of the Start Week On setting", 67, 2);
  v48 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
  v160 = v8;
  v183 = v18;
  v180 = v48;
  v48(v8, 1, 1, v18);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v49 = type metadata accessor for DisplayRepresentation.Image(0);
  v173 = sub_100007F0C(v49, (uint64_t)qword_10005DF80);
  v50 = *(_QWORD *)(v49 - 8);
  v178 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 16);
  v51 = v169;
  v184 = v49;
  v178(v169, v173, v49);
  v177 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v50 + 56);
  v177(v51, 0, 1, v49);
  v52 = sub_100007E00(&qword_10005CC60);
  v53 = swift_allocObject(v52, ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))+ 2 * *(_QWORD *)(v19 + 72), *(unsigned __int8 *)(v19 + 80) | 7);
  *(_OWORD *)(v53 + 16) = xmmword_100047370;
  v54 = String.LocalizationValue.init(stringLiteral:)(0x44206D6574737953, 0xEE00746C75616665);
  static Locale.current.getter(v54);
  v55 = v11;
  v56 = v11;
  v57 = v14;
  v58 = v17;
  v59 = v181;
  v60 = v174;
  ((void (*)(char *))v174)(v55);
  LOWORD(v148) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsStartWeekOnType_SystemSetting_Synonym_SystemDefault", 59, 2, v58, 0, 0, v57, v56, "Synonym (\"System Default\") for the System Setting option of the Start Week On setting", 85, v148);
  v157[1] = v185 + *(int *)(v182 + 48);
  v61 = String.LocalizationValue.init(stringLiteral:)(0x6166656420656854, 0xEB00000000746C75);
  static Locale.current.getter(v61);
  v62 = v59;
  v172 = v44;
  v60(v56, v59, v44);
  LOWORD(v149) = 2;
  v63 = v56;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsStartWeekOnType_SystemSetting_Synonym_TheDefault", 56, 2, v58, 0, 0, v57, v56, "Synonym (\"The default\") for the System Setting option of the Start Week On setting", 82, v149);
  v64 = v179;
  LocalizedStringResource.init(stringLiteral:)(0x10000000000001A5, 0x8000000100042BC0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v158, v160, v169, v53, v64);
  v65 = v185;
  v186[v185] = 1;
  v66 = String.LocalizationValue.init(stringLiteral:)(0x7961646E7553, 0xE600000000000000);
  v67 = v57;
  v171 = v57;
  static Locale.current.getter(v66);
  v176 = v63;
  v60(v63, v62, v44);
  LOWORD(v150) = 2;
  v68 = v159;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsStartWeekOnType_Sunday", 30, 2, v58, 0, 0, v67, v63, "Display name for the Sunday option of the Start Week On setting", 63, v150);
  v69 = v175;
  v180(v175, 1, 1, v183);
  v70 = v170;
  v71 = v173;
  v72 = v184;
  v178(v170, v173, v184);
  v73 = v177;
  v177(v70, 0, 1, v72);
  LocalizedStringResource.init(stringLiteral:)(0xD0000000000000FALL, 0x8000000100042DD0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v68, v69, v70, &_swiftEmptyArrayStorage, v64);
  v74 = v186;
  v169 = (char *)(2 * (_QWORD)v186);
  v75 = (_BYTE *)(v65 + 2 * (_QWORD)v186);
  *v75 = 2;
  v160 = &v75[*(int *)(v182 + 48)];
  v76 = v58;
  v77 = String.LocalizationValue.init(stringLiteral:)(0x7961646E6F4DLL, 0xE600000000000000);
  v78 = v171;
  static Locale.current.getter(v77);
  v79 = v176;
  v80 = v174;
  v174(v176, v181, v172);
  LOWORD(v151) = 2;
  v81 = v161;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsStartWeekOnType_Monday", 30, 2, v76, 0, 0, v78, v79, "Display name for the Monday option of the Start Week On setting", 63, v151);
  v180(v69, 1, 1, v183);
  v82 = v170;
  v83 = v184;
  v178(v170, v71, v184);
  v73(v82, 0, 1, v83);
  LocalizedStringResource.init(stringLiteral:)(0x100000000000011FLL, 0x8000000100042F30);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v81, v69, v82, &_swiftEmptyArrayStorage, v64);
  v84 = v185;
  v85 = &v74[(_QWORD)v169 + v185];
  *v85 = 3;
  v86 = *(int *)(v182 + 48);
  v168 = v76;
  v169 = &v85[v86];
  v87 = v76;
  v88 = String.LocalizationValue.init(stringLiteral:)(0x79616473657554, 0xE700000000000000);
  v89 = v171;
  static Locale.current.getter(v88);
  v90 = v176;
  v91 = v181;
  v92 = v172;
  v80(v176, v181, v172);
  LOWORD(v152) = 2;
  v93 = v162;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsStartWeekOnType_Tuesday", 31, 2, v87, 0, 0, v89, v90, "Display name for the Tuesday option of the Start Week On setting", 64, v152);
  v94 = v69;
  v95 = v69;
  v96 = v183;
  v97 = v180;
  v180(v95, 1, 1, v183);
  v98 = v170;
  v177(v170, 1, 1, v184);
  v99 = v179;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000106, 0x80000001000430C0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v93, v94, v98, &_swiftEmptyArrayStorage, v99);
  v100 = 4 * (_QWORD)v186;
  *(_BYTE *)(v84 + 4 * (_QWORD)v186) = 4;
  v101 = v168;
  v102 = String.LocalizationValue.init(stringLiteral:)(0x616473656E646557, 0xE900000000000079);
  v103 = v171;
  static Locale.current.getter(v102);
  v104 = v176;
  v105 = v91;
  v106 = v174;
  v174(v176, v105, v92);
  LOWORD(v153) = 2;
  v107 = v163;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsStartWeekOnType_Wednesday", 33, 2, v101, 0, 0, v103, v104, "Display name for the Wednesday option of the Start Week On setting", 66, v153);
  v108 = v175;
  v97(v175, 1, 1, v96);
  v109 = v173;
  v110 = v184;
  v178(v98, v173, v184);
  v177(v98, 0, 1, v110);
  v111 = v179;
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000010BLL, 0x8000000100043250);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v107, v108, v98, &_swiftEmptyArrayStorage, v111);
  v112 = &v186[v100 + v185];
  *v112 = 5;
  v113 = v182;
  v169 = &v112[*(int *)(v182 + 48)];
  v114 = v101;
  v115 = String.LocalizationValue.init(stringLiteral:)(0x7961647372756854, 0xE800000000000000);
  v116 = v103;
  static Locale.current.getter(v115);
  v117 = v176;
  v118 = v181;
  v119 = v172;
  v106(v176, v181, v172);
  LOWORD(v154) = 2;
  v120 = v164;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsStartWeekOnType_Thursday", 32, 2, v114, 0, 0, v116, v117, "Display name for the Thursday option of the Start Week On setting", 65, v154);
  v121 = v175;
  v122 = v183;
  v123 = v180;
  v180(v175, 1, 1, v183);
  v124 = v109;
  v125 = v184;
  v178(v98, v124, v184);
  v126 = v125;
  v127 = v177;
  v177(v98, 0, 1, v126);
  v128 = v179;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000105, 0x80000001000433E0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v120, v121, v98, &_swiftEmptyArrayStorage, v128);
  v129 = (_BYTE *)(v185 + 6 * (_QWORD)v186);
  *v129 = 6;
  v169 = &v129[*(int *)(v113 + 48)];
  v130 = v168;
  v131 = String.LocalizationValue.init(stringLiteral:)(0x796164697246, 0xE600000000000000);
  v132 = v171;
  static Locale.current.getter(v131);
  v133 = v176;
  v134 = v118;
  v135 = v174;
  v174(v176, v134, v119);
  LOWORD(v155) = 2;
  v136 = v165;
  v137 = v130;
  v138 = v130;
  v139 = v132;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsStartWeekOnType_Friday", 30, 2, v137, 0, 0, v132, v133, "Display name for the Friday option of the Start Week On setting", 63, v155);
  v140 = v175;
  v123(v175, 1, 1, v122);
  v141 = v184;
  v142 = v178;
  v178(v98, v173, v184);
  v127(v98, 0, 1, v141);
  v143 = v179;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000116, 0x8000000100043550);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v136, v140, v98, &_swiftEmptyArrayStorage, v143);
  v144 = (_BYTE *)(v185 - (_QWORD)v186 + 8 * (_QWORD)v186);
  *v144 = 7;
  v186 = &v144[*(int *)(v182 + 48)];
  v145 = String.LocalizationValue.init(stringLiteral:)(0x7961647275746153, 0xE800000000000000);
  static Locale.current.getter(v145);
  v135(v133, v181, v172);
  LOWORD(v156) = 2;
  v146 = v167;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsStartWeekOnType_Saturday", 32, 2, v138, 0, 0, v139, v133, "Display name for the Saturday option of the Start Week On setting", 65, v156);
  v180(v140, 1, 1, v183);
  v142(v98, v173, v141);
  v177(v98, 0, 1, v141);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000103, 0x80000001000436F0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v146, v140, v98, &_swiftEmptyArrayStorage, v143);
  result = sub_100032BE4(v166);
  qword_10005DF58 = result;
  return result;
}

uint64_t sub_10002B3DC@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v20[24];

  v4 = sub_100007E00(&qword_10005CC78);
  __chkstk_darwin(v4);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = type metadata accessor for LocalizedStringResource(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (qword_10005C570 != -1)
    swift_once(&qword_10005C570, sub_10002A454);
  swift_beginAccess(&qword_10005DF58, v20, 32, 0);
  v11 = qword_10005DF58;
  if (*(_QWORD *)(qword_10005DF58 + 16) && (v12 = sub_100037524(a1), (v13 & 1) != 0))
  {
    v14 = v12;
    v15 = *(_QWORD *)(v11 + 56);
    v16 = type metadata accessor for DisplayRepresentation(0);
    v17 = *(_QWORD *)(v16 - 8);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v17 + 16))(v6, v15 + *(_QWORD *)(v17 + 72) * v14, v16);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v6, 0, 1, v16);
  }
  else
  {
    v16 = type metadata accessor for DisplayRepresentation(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  type metadata accessor for DisplayRepresentation(0);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v6, 1, v16))
  {
    sub_100010A58((uint64_t)v6);
    swift_endAccess(v20);
    return LocalizedStringResource.init(stringLiteral:)(0, 0xE000000000000000);
  }
  else
  {
    DisplayRepresentation.title.getter();
    sub_100010A58((uint64_t)v6);
    swift_endAccess(v20);
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v8 + 32))(a2, v10, v7);
  }
}

NSNumber sub_10002B5D0(unsigned __int8 a1)
{
  Swift::Int v1;

  v1 = a1;
  sub_10002E030();
  return NSNumber.init(integerLiteral:)(v1);
}

uint64_t sub_10002B600(char *a1, char *a2)
{
  return sub_10003308C(*a1, *a2);
}

unint64_t sub_10002B610()
{
  unint64_t result;

  result = qword_10005D680;
  if (!qword_10005D680)
  {
    result = swift_getWitnessTable(&unk_10004A19C, &type metadata for SettingsStartWeekOnType);
    atomic_store(result, (unint64_t *)&qword_10005D680);
  }
  return result;
}

Swift::Int sub_10002B654()
{
  char *v0;

  return sub_10003363C(0, *v0);
}

uint64_t sub_10002B660(uint64_t a1)
{
  char *v1;

  return sub_100033558(a1, *v1);
}

Swift::Int sub_10002B668(uint64_t a1)
{
  char *v1;

  return sub_10003363C(a1, *v1);
}

unint64_t sub_10002B670@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10002DDC0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10002B69C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_10002A218(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10002B6C8()
{
  unint64_t result;

  result = qword_10005D688;
  if (!qword_10005D688)
  {
    result = swift_getWitnessTable(&unk_10004A2B4, &type metadata for SettingsStartWeekOnType);
    atomic_store(result, (unint64_t *)&qword_10005D688);
  }
  return result;
}

unint64_t sub_10002B710()
{
  unint64_t result;

  result = qword_10005D690;
  if (!qword_10005D690)
  {
    result = swift_getWitnessTable(&unk_10004A2EC, &type metadata for SettingsStartWeekOnType);
    atomic_store(result, (unint64_t *)&qword_10005D690);
  }
  return result;
}

unint64_t sub_10002B758()
{
  unint64_t result;

  result = qword_10005D698;
  if (!qword_10005D698)
  {
    result = swift_getWitnessTable(&unk_10004A204, &type metadata for SettingsStartWeekOnType);
    atomic_store(result, (unint64_t *)&qword_10005D698);
  }
  return result;
}

unint64_t sub_10002B7A0()
{
  unint64_t result;

  result = qword_10005D6A0;
  if (!qword_10005D6A0)
  {
    result = swift_getWitnessTable(&unk_10004A31C, &type metadata for SettingsStartWeekOnType);
    atomic_store(result, (unint64_t *)&qword_10005D6A0);
  }
  return result;
}

unint64_t sub_10002B7E8()
{
  unint64_t result;

  result = qword_10005D6A8;
  if (!qword_10005D6A8)
  {
    result = swift_getWitnessTable(&unk_10004A344, &type metadata for SettingsStartWeekOnType);
    atomic_store(result, (unint64_t *)&qword_10005D6A8);
  }
  return result;
}

unint64_t sub_10002B834()
{
  unint64_t result;

  result = qword_10005D6B0;
  if (!qword_10005D6B0)
  {
    result = swift_getWitnessTable(&unk_10004A3C4, &type metadata for SettingsStartWeekOnType);
    atomic_store(result, (unint64_t *)&qword_10005D6B0);
  }
  return result;
}

uint64_t sub_10002B878@<X0>(uint64_t a1@<X8>)
{
  return sub_10000773C(&qword_10005C568, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005DF40, (uint64_t)sub_10002A238, a1);
}

uint64_t sub_10002B89C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076D8(a1, a2, a3, (uint64_t (*)(void))sub_10002B8B0, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

unint64_t sub_10002B8B0()
{
  unint64_t result;

  result = qword_10005D6B8;
  if (!qword_10005D6B8)
  {
    result = swift_getWitnessTable(&unk_10004A23C, &type metadata for SettingsStartWeekOnType);
    atomic_store(result, (unint64_t *)&qword_10005D6B8);
  }
  return result;
}

uint64_t sub_10002B8F4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10002B8B0();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10002B930()
{
  unint64_t result;

  result = qword_10005D6C0;
  if (!qword_10005D6C0)
  {
    result = swift_getWitnessTable(&unk_10004A404, &type metadata for SettingsStartWeekOnType);
    atomic_store(result, (unint64_t *)&qword_10005D6C0);
  }
  return result;
}

unint64_t sub_10002B978()
{
  unint64_t result;

  result = qword_10005D6C8;
  if (!qword_10005D6C8)
  {
    result = swift_getWitnessTable(&unk_10004A42C, &type metadata for SettingsStartWeekOnType);
    atomic_store(result, (unint64_t *)&qword_10005D6C8);
  }
  return result;
}

unint64_t sub_10002B9C0()
{
  unint64_t result;

  result = qword_10005D6D0;
  if (!qword_10005D6D0)
  {
    result = swift_getWitnessTable(&unk_10004A1C4, &type metadata for SettingsStartWeekOnType);
    atomic_store(result, (unint64_t *)&qword_10005D6D0);
  }
  return result;
}

uint64_t sub_10002BA04()
{
  _BYTE v1[24];

  if (qword_10005C570 != -1)
    swift_once(&qword_10005C570, sub_10002A454);
  swift_beginAccess(&qword_10005DF58, v1, 0, 0);
  return swift_bridgeObjectRetain(qword_10005DF58);
}

uint64_t sub_10002BA70(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10002B834();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10002BAA8()
{
  return sub_10000A9CC(&qword_10005D6D8, &qword_10005D6E0, (uint64_t)&protocol conformance descriptor for [A]);
}

void sub_10002BAD4(_QWORD *a1@<X8>)
{
  *a1 = &off_100054EF8;
}

unint64_t sub_10002BAE8()
{
  unint64_t result;

  result = qword_10005D6E8;
  if (!qword_10005D6E8)
  {
    result = swift_getWitnessTable(&unk_10004A4C4, &type metadata for SettingsStartWeekOnEntity);
    atomic_store(result, (unint64_t *)&qword_10005D6E8);
  }
  return result;
}

unint64_t sub_10002BB30()
{
  unint64_t result;

  result = qword_10005D6F0;
  if (!qword_10005D6F0)
  {
    result = swift_getWitnessTable(&unk_10004A800, &type metadata for SettingsStartWeekOnEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D6F0);
  }
  return result;
}

uint64_t sub_10002BB74(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_10002BB8C, 0, 0);
}

id sub_10002BB8C()
{
  uint64_t v0;
  id result;
  void *v2;
  _BYTE *v3;
  id v4;

  result = objc_msgSend((id)objc_opt_self(CUIKPreferences), "sharedPreferences");
  if (result)
  {
    v2 = result;
    v3 = *(_BYTE **)(v0 + 16);
    v4 = objc_msgSend(result, "weekStart");

    *v3 = sub_10002DBA8((uint64_t)v4);
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10002BC18(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_10002BC34, 0, 0);
}

id sub_10002BC34()
{
  uint64_t v0;
  NSNumber v1;
  id result;
  void *v3;

  v1.super.super.isa = sub_10002B5D0(*(_BYTE *)(v0 + 16)).super.super.isa;
  result = objc_msgSend((id)objc_opt_self(CUIKPreferences), "sharedPreferences");
  if (result)
  {
    v3 = result;
    objc_msgSend(result, "setWeekStart:", v1.super.super.isa);

    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10002BCB0()
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
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  __int16 v19;
  _BYTE v20[16];

  v0 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v0);
  v2 = &v20[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v10);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v20[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = String.LocalizationValue.init(stringLiteral:)(0x6557207472617453, 0xED00006E4F206B65);
  static Locale.current.getter(v17);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  v19 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsStartWeekOnEntityName", 29, 2, v12, 0, 0, v9, v6, "Name of the SettingsStartWeekOnEntity type", 42, v19);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v2, 1, 1, v13);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v16, v2);
}

uint64_t sub_10002BEC4@<X0>(uint64_t a1@<X8>)
{
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
  _QWORD v26[2];

  v26[0] = a1;
  v1 = sub_100007E00(&qword_10005D190);
  __chkstk_darwin(v1);
  v3 = (char *)v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v4);
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Locale(0);
  __chkstk_darwin(v11);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v14);
  v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for LocalizedStringResource(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = String.LocalizationValue.init(stringLiteral:)(0x6557207472617453, 0xED00006E4F206B65);
  static Locale.current.getter(v21);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsStartWeekOnEntityName", 29, 2, v16, 0, 0, v13, v10, "Name of the SettingsStartWeekOnEntity type", 42, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v6, 1, 1, v17);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v22 = type metadata accessor for DisplayRepresentation.Image(0);
  v23 = sub_100007F0C(v22, (uint64_t)qword_10005DF80);
  v24 = *(_QWORD *)(v22 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v3, v23, v22);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v3, 0, 1, v22);
  return DisplayRepresentation.init(title:subtitle:image:)(v20, v6, v3);
}

uint64_t sub_10002C184()
{
  uint64_t v0;

  v0 = qword_10005D670;
  swift_bridgeObjectRetain(off_10005D678);
  return v0;
}

unint64_t sub_10002C1BC()
{
  unint64_t result;

  result = qword_10005D6F8;
  if (!qword_10005D6F8)
  {
    result = swift_getWitnessTable(&unk_10004A51C, &type metadata for SettingsStartWeekOnEntity);
    atomic_store(result, (unint64_t *)&qword_10005D6F8);
  }
  return result;
}

unint64_t sub_10002C204()
{
  unint64_t result;

  result = qword_10005D700;
  if (!qword_10005D700)
  {
    result = swift_getWitnessTable(&unk_10004A554, &type metadata for SettingsStartWeekOnEntity);
    atomic_store(result, (unint64_t *)&qword_10005D700);
  }
  return result;
}

unint64_t sub_10002C24C()
{
  unint64_t result;

  result = qword_10005D708;
  if (!qword_10005D708)
  {
    result = swift_getWitnessTable(&unk_10004A584, &type metadata for SettingsStartWeekOnEntity);
    atomic_store(result, (unint64_t *)&qword_10005D708);
  }
  return result;
}

unint64_t sub_10002C294()
{
  unint64_t result;

  result = qword_10005D710;
  if (!qword_10005D710)
  {
    result = swift_getWitnessTable(&unk_10004A878, &type metadata for SettingsStartWeekOnEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D710);
  }
  return result;
}

unint64_t sub_10002C2DC()
{
  unint64_t result;

  result = qword_10005D718;
  if (!qword_10005D718)
  {
    result = swift_getWitnessTable(&unk_10004A5BC, &type metadata for SettingsStartWeekOnEntity);
    atomic_store(result, (unint64_t *)&qword_10005D718);
  }
  return result;
}

unint64_t sub_10002C324()
{
  unint64_t result;

  result = qword_10005D720;
  if (!qword_10005D720)
  {
    result = swift_getWitnessTable(&unk_10004A5E4, &type metadata for SettingsStartWeekOnEntity);
    atomic_store(result, (unint64_t *)&qword_10005D720);
  }
  return result;
}

unint64_t sub_10002C36C()
{
  unint64_t result;

  result = qword_10005D728;
  if (!qword_10005D728)
  {
    result = swift_getWitnessTable(&unk_10004A60C, &type metadata for SettingsStartWeekOnEntity);
    atomic_store(result, (unint64_t *)&qword_10005D728);
  }
  return result;
}

unint64_t sub_10002C3B4()
{
  unint64_t result;

  result = qword_10005D730;
  if (!qword_10005D730)
  {
    result = swift_getWitnessTable(&unk_10004A664, &type metadata for SettingsStartWeekOnEntity);
    atomic_store(result, (unint64_t *)&qword_10005D730);
  }
  return result;
}

void sub_10002C3F8(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000001BLL;
  a1[1] = 0x80000001000429E0;
}

uint64_t sub_10002C41C()
{
  return sub_10000A9CC(&qword_10005D738, &qword_10005D740, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_10002C448(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10002BAE8();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10002C484()
{
  unint64_t result;

  result = qword_10005D748;
  if (!qword_10005D748)
  {
    result = swift_getWitnessTable(&unk_10004A694, &type metadata for SettingsStartWeekOnEntity);
    atomic_store(result, (unint64_t *)&qword_10005D748);
  }
  return result;
}

uint64_t sub_10002C4CC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10002C3B4();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10002C508()
{
  return sub_10000A9CC(&qword_10005D750, &qword_10005D758, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_10002C534()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v13;
  _BYTE v14[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_100007F24(v10, qword_10005DF60);
  sub_100007F0C(v10, (uint64_t)qword_10005DF60);
  v11 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000015, 0x8000000100042970);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  v13 = 2;
  return LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("UpdateSettingsStartWeekOnIntent_title", 37, 2, v9, 0, 0, v6, v3, "Display string for the title of the UpdateSettingsStartWeekOnIntent", 67, v13);
}

uint64_t sub_10002C6C8()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_10004A9F8);
  qword_10005DF78 = result;
  return result;
}

uint64_t sub_10002C6EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  v4 = type metadata accessor for MainActor(0);
  v3[7] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v3[8] = v5;
  v3[9] = v6;
  return swift_task_switch(sub_10002C75C, v5, v6);
}

uint64_t sub_10002C75C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = v0[2];
  v0[3] = v1;
  v0[10] = v1;
  IntentParameter.wrappedValue.getter(v0 + 14);
  if (qword_10005C580 != -1)
    swift_once(&qword_10005C580, sub_10002C6C8);
  v2 = qword_10005DF78;
  v0[11] = qword_10005DF78;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  v0[12] = v4;
  v5 = sub_10000A9CC(&qword_10005D7F8, &qword_10005D800, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_100008D04;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 14, v2, &type metadata for SettingsStartWeekOnType, v5);
}

uint64_t sub_10002C850()
{
  if (qword_10005C580 != -1)
    swift_once(&qword_10005C580, sub_10002C6C8);
  return swift_retain(qword_10005DF78);
}

unint64_t sub_10002C894()
{
  unint64_t result;

  result = qword_10005D760;
  if (!qword_10005D760)
  {
    result = swift_getWitnessTable(&unk_10004A7BC, &type metadata for UpdateIntent_weekStartDay);
    atomic_store(result, (unint64_t *)&qword_10005D760);
  }
  return result;
}

unint64_t sub_10002C8DC()
{
  unint64_t result;

  result = qword_10005D768;
  if (!qword_10005D768)
  {
    result = swift_getWitnessTable(&unk_10004A7E4, &type metadata for UpdateIntent_weekStartDay);
    atomic_store(result, (unint64_t *)&qword_10005D768);
  }
  return result;
}

uint64_t sub_10002C920(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100050568, 1);
}

uint64_t sub_10002C930(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076D8(a1, a2, a3, (uint64_t (*)(void))sub_1000237EC, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t sub_10002C944@<X0>(uint64_t a1@<X8>)
{
  return sub_10000773C(&qword_10005C578, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005DF60, (uint64_t)sub_10002C534, a1);
}

uint64_t sub_10002C968(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005D824);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_100009170;
  return sub_10002C6EC(a1, v5, v4);
}

uint64_t sub_10002C9CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10002D5F4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10002C9F0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000237EC();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10002CA1C()
{
  unint64_t result;

  result = qword_10005D778;
  if (!qword_10005D778)
  {
    result = swift_getWitnessTable(&unk_10004A840, &type metadata for SettingsStartWeekOnEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D778);
  }
  return result;
}

unint64_t sub_10002CA64()
{
  unint64_t result;

  result = qword_10005D780[0];
  if (!qword_10005D780[0])
  {
    result = swift_getWitnessTable(&unk_10004A464, &type metadata for SettingsStartWeekOnEntity);
    atomic_store(result, qword_10005D780);
  }
  return result;
}

uint64_t sub_10002CAA8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005D7E0 + dword_10005D7E0);
  v2 = (_QWORD *)swift_task_alloc(unk_10005D7E4);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000AB54;
  return v4();
}

uint64_t sub_10002CB04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10002BB30();
  *v4 = v2;
  v4[1] = sub_100009358;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10002CB70()
{
  unint64_t result;

  result = qword_10005D798;
  if (!qword_10005D798)
  {
    result = swift_getWitnessTable(&unk_10004A8D0, &type metadata for SettingsStartWeekOnEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D798);
  }
  return result;
}

unint64_t sub_10002CBB8()
{
  unint64_t result;

  result = qword_10005D7A0[0];
  if (!qword_10005D7A0[0])
  {
    result = swift_getWitnessTable(&unk_10004A930, &type metadata for SettingsStartWeekOnEntityQuery);
    atomic_store(result, qword_10005D7A0);
  }
  return result;
}

uint64_t sub_10002CBFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10002BB30();
  *v5 = v2;
  v5[1] = sub_1000094B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10002CC68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10002BB30();
  *v4 = v2;
  v4[1] = sub_10000AB54;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10002CCD4()
{
  unint64_t result;

  result = qword_10005D7B8;
  if (!qword_10005D7B8)
  {
    result = swift_getWitnessTable(&unk_10004A958, &type metadata for SettingsStartWeekOnEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D7B8);
  }
  return result;
}

unint64_t sub_10002CD1C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005D7C0;
  if (!qword_10005D7C0)
  {
    v1 = sub_100007220(qword_10005D7C8);
    sub_10002C36C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005D7C0);
  }
  return result;
}

uint64_t sub_10002CD80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10002C294();
  *v5 = v2;
  v5[1] = sub_10000AB50;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_weekStartDay()
{
  return &type metadata for UpdateIntent_weekStartDay;
}

ValueMetadata *type metadata accessor for SettingsStartWeekOnEntityQuery()
{
  return &type metadata for SettingsStartWeekOnEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsStartWeekOnEntity()
{
  return &type metadata for SettingsStartWeekOnEntity;
}

uint64_t getEnumTagSinglePayload for SettingsStartWeekOnType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SettingsStartWeekOnType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10002CEF8 + 4 * byte_10004A195[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_10002CF2C + 4 * byte_10004A190[v4]))();
}

uint64_t sub_10002CF2C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002CF34(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10002CF3CLL);
  return result;
}

uint64_t sub_10002CF48(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10002CF50);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_10002CF54(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002CF5C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SettingsStartWeekOnType()
{
  return &type metadata for SettingsStartWeekOnType;
}

uint64_t sub_10002CF78@<X0>(uint64_t a1@<X8>)
{
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
  id v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  uint64_t KeyPath;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t OpaqueTypeConformance2;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  Swift::String v43;

  v40 = a1;
  v1 = type metadata accessor for ControlSize(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00((uint64_t *)&unk_10005D1B0);
  v35 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007E00(&qword_10005CC68);
  v8 = *(_QWORD *)(v7 - 8);
  v36 = v7;
  v37 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100007E00(&qword_10005D1C0);
  v12 = *(_QWORD *)(v11 - 8);
  v38 = v11;
  v39 = v12;
  __chkstk_darwin(v11);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v43._countAndFlagsBits = 0xD00000000000002ALL;
  v43._object = (void *)0x8000000100042910;
  v16._countAndFlagsBits = 0x6557207472617453;
  v16._object = (void *)0xED00006E4F206B65;
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  v18 = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, (Swift::String_optional)0, (NSBundle)v15, v17, v43);

  KeyPath = swift_getKeyPath(&unk_10004A9F8);
  static ControlSize._1x1.getter();
  v20 = sub_10002B8B0();
  v21 = sub_10002E098();
  v22 = sub_10002CA64();
  ControlPicker.init<A, B, C, D, E, F, G>(kind:displayName:preferredSize:intentUpdatableProperty:title:value:affordances:)(0xD00000000000001ELL, 0x8000000100043830, v18._countAndFlagsBits, v18._object, v3, KeyPath, sub_10002D2FC, 0, sub_10002D4BC, 0, sub_10002D540, 0, &type metadata for Text, &type metadata for Text, v20, v21, v22, &protocol witness table for Text, &protocol witness table for Text);
  v23 = LocalizedStringKey.init(stringLiteral:)(0x6565577472617453, 0xEB000000006E4F6BLL);
  v25 = v24;
  LOBYTE(v21) = v26;
  v28 = v27;
  v29 = sub_10000A9CC(&qword_10005D1D0, (uint64_t *)&unk_10005D1B0, (uint64_t)&protocol conformance descriptor for ControlPicker<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v23, v25, v21 & 1, v28, v4, v29);
  swift_bridgeObjectRelease(v28);
  swift_bridgeObjectRelease(v25);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v4);
  v41 = v4;
  v42 = v29;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v41, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v31 = v36;
  WidgetConfiguration.disablesControlStateCaching()(v36, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v10, v31);
  v41 = v31;
  v42 = OpaqueTypeConformance2;
  v32 = swift_getOpaqueTypeConformance2(&v41, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v33 = v38;
  WidgetConfiguration.hiddenControl()(v38, v32);
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v14, v33);
}

uint64_t sub_10002D2FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  char v15;
  uint64_t v16;
  __int16 v17;
  _BYTE v18[16];

  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = &v18[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin();
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = String.LocalizationValue.init(stringLiteral:)(0x6557207472617453, 0xED00006E4F206B65);
  static Locale.current.getter(v12);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  v17 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsStartWeekOnEntityName", 29, 2, v9, 0, 0, v7, v5, "Name of the SettingsStartWeekOnEntity type", 42, v17);
  result = Text.init(_:)(v11);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v14;
  *(_BYTE *)(a1 + 16) = v15 & 1;
  *(_QWORD *)(a1 + 24) = v16;
  return result;
}

uint64_t sub_10002D4BC@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v4 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002B3DC(*a1, (uint64_t)v6);
  result = Text.init(_:)(v6);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v8;
  *(_BYTE *)(a2 + 16) = v9 & 1;
  *(_QWORD *)(a2 + 24) = v10;
  return result;
}

uint64_t sub_10002D540(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002B3DC(*a1, (uint64_t)v4);
  v5 = Text.init(_:)(v4);
  return ControlAffordances.init(tint:status:actionHint:)(0, v5, v7, v6 & 1, v8, 0, 0, 0, 0);
}

uint64_t sub_10002D5F4()
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
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_BYTE *, uint64_t, uint64_t);
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  void (*v29)(_BYTE *, uint64_t, uint64_t, uint64_t);
  _BYTE *v30;
  _BYTE *v31;
  _BYTE *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v38;
  uint64_t v39;
  _BYTE *v40;
  _BYTE *v41;
  _BYTE *v42;
  _BYTE *v43;
  unint64_t v44;
  __int16 v46;
  int v47;
  int v48;
  int v49;
  _BYTE v50[4];
  unsigned int v51;
  uint64_t v52;
  void (*v53)(_BYTE *, uint64_t, uint64_t);
  unsigned int v54;
  void (*v55)(_BYTE *);
  uint64_t v56;
  void (*v57)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  _BYTE *v61;
  _BYTE *v62;
  _BYTE *v63;
  _BYTE *v64;
  uint64_t v65;
  char v66[3];
  uint64_t v67;

  v65 = type metadata accessor for InputConnectionBehavior(0);
  v60 = *(_QWORD *)(v65 - 8);
  __chkstk_darwin(v65);
  v64 = &v50[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v1 = sub_100007E00((uint64_t *)&unk_10005D140);
  v2 = __chkstk_darwin(v1);
  v63 = &v50[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  v62 = &v50[-v4];
  v5 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v5);
  v61 = &v50[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v50[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = type metadata accessor for Locale(0);
  __chkstk_darwin(v11);
  v13 = &v50[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v14);
  v16 = &v50[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = type metadata accessor for LocalizedStringResource(0);
  v18 = *(_QWORD *)(v17 - 8);
  v58 = v17;
  v19 = __chkstk_darwin(v17);
  v59 = &v50[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v19);
  v22 = &v50[-v21];
  v56 = sub_100007E00(&qword_10005D810);
  v23 = String.LocalizationValue.init(stringLiteral:)(0x746567726154, 0xE600000000000000);
  static Locale.current.getter(v23);
  v24 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v25 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 104);
  v51 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v52 = v7;
  v25(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  v53 = v25;
  v46 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target", 6, 2, v16, 0, 0, v13, v10, "Calendar settings entity title that indicates which setting the user would like to target.", 90, v46);
  v26 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x800000010003B560);
  static Locale.current.getter(v26);
  v25(v10, v24, v7);
  LOWORD(v47) = 2;
  v27 = v61;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target_description", 18, 2, v16, 0, 0, v13, v10, "Description for the Calendar settings entity parameter that indicates which setting the user would like to target.", 114, v47);
  v57 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v18 + 56);
  v57(v27, 0, 1, v17);
  v67 = 0;
  v28 = type metadata accessor for IntentDialog(0);
  v29 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56);
  v30 = v62;
  v29(v62, 1, 1, v28);
  v31 = v63;
  v29(v63, 1, 1, v28);
  v54 = enum case for InputConnectionBehavior.default(_:);
  v55 = *(void (**)(_BYTE *))(v60 + 104);
  v32 = v64;
  v55(v64);
  v33 = sub_10002BAE8();
  v60 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v22, v27, &v67, v30, v31, v32, v33);
  v56 = sub_100007E00(&qword_10005D818);
  v34 = String.LocalizationValue.init(stringLiteral:)(0x65756C6156, 0xE500000000000000);
  static Locale.current.getter(v34);
  v35 = v51;
  v36 = v52;
  v37 = v53;
  v53(v10, v51, v52);
  LOWORD(v48) = 2;
  v38 = v59;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value", 5, 2, v16, 0, 0, v13, v10, "Calendar settings property title that indicates which property of a setting the user would like to set to as the value.", 119, v48);
  v39 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000026, 0x800000010003B6A0);
  static Locale.current.getter(v39);
  v37(v10, v35, v36);
  LOWORD(v49) = 2;
  v40 = v61;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value_description", 17, 2, v16, 0, 0, v13, v10, "Description for a Calendar settings property parameter that indicates which value of a setting the user would like to set to.", 125, v49);
  v57(v40, 0, 1, v58);
  v66[0] = 8;
  v41 = v62;
  v29(v62, 1, 1, v28);
  v42 = v63;
  v29(v63, 1, 1, v28);
  v43 = v64;
  ((void (*)(_BYTE *, _QWORD, uint64_t))v55)(v64, v54, v65);
  v44 = sub_10002B8B0();
  IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v38, v40, v66, v41, v42, v43, &off_100054EF8, v44);
  return v60;
}

uint64_t sub_10002DBA8(uint64_t result)
{
  void *v1;
  id v2;
  Class isa;
  char v4;
  id v5;
  Class v6;
  char v7;
  id v8;
  Class v9;
  char v10;
  id v11;
  Class v12;
  char v13;
  id v14;
  Class v15;
  char v16;
  id v17;
  Class v18;
  char v19;
  id v20;
  Class v21;
  char v22;
  id v23;
  Class v24;
  char v25;

  if (result)
  {
    v1 = (void *)result;
    sub_10002E030();
    v2 = v1;
    isa = NSNumber.init(integerLiteral:)(0).super.super.isa;
    v4 = static NSObject.== infix(_:_:)(isa, v2);

    if ((v4 & 1) != 0)
    {

      return 0;
    }
    else
    {
      v5 = v2;
      v6 = NSNumber.init(integerLiteral:)(1).super.super.isa;
      v7 = static NSObject.== infix(_:_:)(v6, v5);

      if ((v7 & 1) != 0)
      {

        return 1;
      }
      else
      {
        v8 = v5;
        v9 = NSNumber.init(integerLiteral:)(2).super.super.isa;
        v10 = static NSObject.== infix(_:_:)(v9, v8);

        if ((v10 & 1) != 0)
        {

          return 2;
        }
        else
        {
          v11 = v8;
          v12 = NSNumber.init(integerLiteral:)(3).super.super.isa;
          v13 = static NSObject.== infix(_:_:)(v12, v11);

          if ((v13 & 1) != 0)
          {

            return 3;
          }
          else
          {
            v14 = v11;
            v15 = NSNumber.init(integerLiteral:)(4).super.super.isa;
            v16 = static NSObject.== infix(_:_:)(v15, v14);

            if ((v16 & 1) != 0)
            {

              return 4;
            }
            else
            {
              v17 = v14;
              v18 = NSNumber.init(integerLiteral:)(5).super.super.isa;
              v19 = static NSObject.== infix(_:_:)(v18, v17);

              if ((v19 & 1) != 0)
              {

                return 5;
              }
              else
              {
                v20 = v17;
                v21 = NSNumber.init(integerLiteral:)(6).super.super.isa;
                v22 = static NSObject.== infix(_:_:)(v21, v20);

                if ((v22 & 1) != 0)
                {

                  return 6;
                }
                else
                {
                  v23 = v20;
                  v24 = NSNumber.init(integerLiteral:)(7).super.super.isa;
                  v25 = static NSObject.== infix(_:_:)(v24, v23);

                  if ((v25 & 1) != 0)
                    return 7;
                  else
                    return 0;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

unint64_t sub_10002DDC0(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100054FE0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 8)
    return 8;
  else
    return v3;
}

uint64_t sub_10002DE08()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10002DEC4, 0, 0);
}

uint64_t sub_10002DEC4()
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
  unint64_t v9;
  uint64_t v10;
  __int16 v12;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100007E00(&qword_10005D758);
  v7 = String.LocalizationValue.init(stringLiteral:)(0x617453206B656557, 0xEE00796144207472);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  v12 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsStartWeekOnEntityName", 29, 2, v1, 0, 0, v4, v3, "Name of the SettingsStartWeekOnEntity type", 42, v12);
  v8 = sub_10000A9CC(&qword_10005D7F8, &qword_10005D800, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = sub_10002B8B0();
  v10 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005D7E8, 0, &unk_10005D7F0, 0, &type metadata for UpdateIntent_weekStartDay, v8, v9);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v10);
}

unint64_t sub_10002E030()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005D808;
  if (!qword_10005D808)
  {
    v1 = objc_opt_self(NSNumber);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10005D808);
  }
  return result;
}

uint64_t sub_10002E06C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

ValueMetadata *type metadata accessor for SettingsStartWeekOnPickerControl()
{
  return &type metadata for SettingsStartWeekOnPickerControl;
}

uint64_t sub_10002E088(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000505AC, 1);
}

unint64_t sub_10002E098()
{
  unint64_t result;

  result = qword_10005D838;
  if (!qword_10005D838)
  {
    result = swift_getWitnessTable(&unk_10004A27C, &type metadata for SettingsStartWeekOnType);
    atomic_store(result, (unint64_t *)&qword_10005D838);
  }
  return result;
}

uint64_t sub_10002E0DC()
{
  uint64_t v0;

  v0 = type metadata accessor for DisplayRepresentation.Image(0);
  sub_100007F24(v0, qword_10005DF80);
  sub_100007F0C(v0, (uint64_t)qword_10005DF80);
  return DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000013, 0x8000000100043890);
}

id sub_10002E13C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)EKEventStore), "initWithEKOptions:", 0x2000);
  if (!result)
    __break(1u);
  return result;
}

uint64_t sub_10002E170()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100007F24(v0, qword_10005DF98);
  sub_100007F0C(v0, (uint64_t)qword_10005DF98);
  return Logger.init(subsystem:category:)(0xD000000000000012, 0x8000000100043870, 0xD000000000000017, 0x800000010004AAF0);
}

uint64_t sub_10002E1F0@<X0>(uint64_t a1@<X8>)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t Widget;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  void (*v47)(char *, uint64_t);
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  uint64_t v51;
  void (*v52)(char *, uint64_t);
  uint64_t v53;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t EventComplication;
  uint64_t v74[13];

  v68 = a1;
  EventComplication = type metadata accessor for CalendarNextEventComplication(0);
  v64 = *(_QWORD *)(EventComplication - 8);
  v1 = __chkstk_darwin(EventComplication);
  v67 = (char *)&v55 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  v63 = (char *)&v55 - v3;
  v66 = type metadata accessor for CalendarListWidget(0);
  v65 = *(_QWORD *)(v66 - 8);
  v4 = __chkstk_darwin(v66);
  v72 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v7 = (char *)&v55 - v6;
  v62 = type metadata accessor for CalendarMonthWidget(0);
  v70 = *(_QWORD *)(v62 - 8);
  v8 = __chkstk_darwin(v62);
  v71 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v11 = (char *)&v55 - v10;
  v12 = type metadata accessor for CalendarDateWidget(0);
  v13 = *(_QWORD *)(v12 - 8);
  v56 = v12;
  v57 = v13;
  v14 = __chkstk_darwin(v12);
  v69 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v55 - v16;
  Widget = type metadata accessor for CalendarUpNextWidget(0);
  v19 = *(_QWORD *)(Widget - 8);
  v58 = Widget;
  v60 = v19;
  v20 = __chkstk_darwin(Widget);
  v22 = (char *)&v55 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __chkstk_darwin(v20);
  v25 = (char *)&v55 - v24;
  v59 = (char *)&v55 - v24;
  v26 = CalendarUpNextWidget.init()(v23);
  v27 = CalendarDateWidget.init()(v26);
  v55 = v11;
  v28 = CalendarMonthWidget.init()(v27);
  v29 = CalendarListWidget.init()(v28);
  v30 = v63;
  CalendarNextEventComplication.init()(v29);
  v31 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
  v61 = v22;
  v31(v22, v25, Widget);
  v74[0] = (uint64_t)v22;
  v32 = (uint64_t)v69;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v69, v17, v12);
  v74[1] = v32;
  v33 = (uint64_t)v71;
  v34 = v11;
  v35 = v62;
  (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v71, v34, v62);
  v74[2] = v33;
  v36 = v65;
  v37 = (uint64_t)v72;
  v38 = v7;
  v39 = v7;
  v40 = v66;
  (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v72, v38, v66);
  v74[3] = v37;
  v41 = v64;
  v42 = (uint64_t)v67;
  v43 = v30;
  v44 = EventComplication;
  (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v67, v30, EventComplication);
  v74[4] = v42;
  v45 = v42;
  sub_10002E608(v74);
  v46 = *(void (**)(char *, uint64_t))(v41 + 8);
  v46(v43, v44);
  v47 = *(void (**)(char *, uint64_t))(v36 + 8);
  v47(v39, v40);
  v48 = *(void (**)(char *, uint64_t))(v70 + 8);
  v49 = v35;
  v48(v55, v35);
  v50 = *(void (**)(char *, uint64_t))(v57 + 8);
  v51 = v56;
  v50(v17, v56);
  v52 = *(void (**)(char *, uint64_t))(v60 + 8);
  v53 = v58;
  v52(v59, v58);
  v46((char *)v45, EventComplication);
  v47(v72, v40);
  v48(v71, v49);
  v50(v69, v51);
  return ((uint64_t (*)(char *, uint64_t))v52)(v61, v53);
}

uint64_t sub_10002E608(uint64_t *a1)
{
  int *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t Widget;
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
  uint64_t EventComplication;
  uint64_t v20;

  v2 = (int *)sub_100007E00(&qword_10005D848);
  __chkstk_darwin(v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *a1;
  Widget = type metadata accessor for CalendarUpNextWidget(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(Widget - 8) + 16))(v4, v5, Widget);
  v7 = &v4[v2[12]];
  v8 = a1[1];
  v9 = type metadata accessor for CalendarDateWidget(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = &v4[v2[16]];
  v11 = a1[2];
  v12 = type metadata accessor for CalendarMonthWidget(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  v13 = &v4[v2[20]];
  v14 = a1[3];
  v15 = type metadata accessor for CalendarListWidget(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v16 = &v4[v2[24]];
  v17 = a1[4];
  EventComplication = type metadata accessor for CalendarNextEventComplication(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(EventComplication - 8) + 16))(v16, v17, EventComplication);
  return TupleWidget.init(_:)(v4, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_10002E798();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_10002E798()
{
  unint64_t result;

  result = qword_10005D840;
  if (!qword_10005D840)
  {
    result = swift_getWitnessTable(&unk_10004AB34, &type metadata for WidgetGroup);
    atomic_store(result, (unint64_t *)&qword_10005D840);
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetGroup()
{
  return &type metadata for WidgetGroup;
}

uint64_t sub_10002E7EC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000505F0, 1);
}

id sub_10002E7FC(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v4 = (void *)v1(v3);
  swift_release(v2);
  return v4;
}

uint64_t sub_10002E834()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  id (*v19)();
  uint64_t v20;

  if (qword_10005C590 != -1)
    swift_once(&qword_10005C590, sub_10002E170);
  v0 = type metadata accessor for Logger(0);
  sub_100007F0C(v0, (uint64_t)qword_10005DF98);
  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Initializing", v3, 2u);
    swift_slowDealloc(v3, -1, -1);
  }

  v4 = objc_allocWithZone((Class)EKEphemeralCacheEventStoreProvider);
  v19 = sub_10002E13C;
  v20 = 0;
  *(_QWORD *)&v17 = _NSConcreteStackBlock;
  *((_QWORD *)&v17 + 1) = 1107296256;
  *(_QWORD *)&v18 = sub_10002E7FC;
  *((_QWORD *)&v18 + 1) = &unk_1000584D8;
  v5 = _Block_copy(&v17);
  v6 = objc_msgSend(v4, "initWithCreationBlock:", v5);
  _Block_release(v5);
  swift_release(v20);
  v7 = type metadata accessor for AppDependencyManager(0);
  v12 = static AppDependencyManager.shared.getter(v7, v8, v9, v10, v11);
  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  v13 = swift_allocObject(&unk_100058510, 24, 7);
  *(_QWORD *)(v13 + 16) = v6;
  v14 = v6;
  v15 = sub_100007E00(&qword_10005D850);
  AppDependencyManager.add<A>(key:dependency:)(&v17, sub_10002EA44, v13, v15);

  swift_release(v12);
  swift_release(v13);
  return sub_10002EA50((uint64_t)&v17);
}

uint64_t sub_10002EA08(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002EA18(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10002EA20()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002EA44@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 16);
  return swift_unknownObjectRetain();
}

uint64_t sub_10002EA50(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100007E00(&qword_10005D858);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10002EA94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005D860;
  if (!qword_10005D860)
  {
    v1 = sub_100007220(&qword_10005D868);
    result = swift_getWitnessTable(&protocol conformance descriptor for TupleWidget<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10005D860);
  }
  return result;
}

uint64_t sub_10002EAE0(char a1)
{
  return qword_10004B4B0[a1];
}

uint64_t sub_10002EB00()
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

  v0 = sub_100007E00(&qword_10005D630);
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
  sub_100007F24(v16, qword_10005DFB0);
  sub_100007F0C(v16, (uint64_t)qword_10005DFB0);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000012, 0x8000000100044330);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, _QWORD))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v19[0]);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0, 0, v8, v5, "Title for the type of an alternative calendar overlay to show in Calendar.", 74, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v2, 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v2);
}

unint64_t sub_10002ED14()
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(_QWORD);
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  void (*v46)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t);
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, uint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t, uint64_t);
  char *v64;
  _BYTE *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  void (*v75)(char *, uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _BYTE *v79;
  uint64_t v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(char *, _QWORD, uint64_t, uint64_t);
  char *v88;
  char *v89;
  char *v90;
  uint64_t v91;
  char *v92;
  char *v93;
  char *v94;
  uint64_t v95;
  void (*v96)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v97;
  uint64_t v98;
  char *v99;
  unint64_t result;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  char *v112;
  _BYTE *v113;
  char *v114;
  char *v115;
  char *v116;
  uint64_t v117;
  char *v118;
  char *v119;
  void (*v120)(char *, _QWORD, uint64_t, uint64_t);
  char *v121;
  char *v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  void (*v126)(char *, uint64_t, uint64_t);
  uint64_t v127;
  void (*v128)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void (*v132)(_QWORD);
  unsigned int v133;
  uint64_t v134;

  v0 = sub_100007E00(&qword_10005D190);
  v1 = __chkstk_darwin(v0);
  v114 = (char *)&v107 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  v122 = (char *)&v107 - v3;
  v4 = sub_100007E00(&qword_10005D630);
  v5 = __chkstk_darwin(v4);
  v123 = (char *)&v107 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v8 = (char *)&v107 - v7;
  v9 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v132 = *(void (**)(_QWORD))(v9 - 8);
  __chkstk_darwin(v9);
  v11 = (char *)&v107 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Locale(0);
  __chkstk_darwin(v12);
  v14 = (char *)&v107 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v15);
  v17 = (char *)&v107 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for LocalizedStringResource(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = __chkstk_darwin(v18);
  v118 = (char *)&v107 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __chkstk_darwin(v20);
  v116 = (char *)&v107 - v23;
  v24 = __chkstk_darwin(v22);
  v115 = (char *)&v107 - v25;
  v26 = __chkstk_darwin(v24);
  v112 = (char *)&v107 - v27;
  v28 = __chkstk_darwin(v26);
  v121 = (char *)&v107 - v29;
  __chkstk_darwin(v28);
  v31 = (char *)&v107 - v30;
  v32 = sub_100007E00(&qword_10005DA20);
  v33 = sub_100007E00(&qword_10005DA28);
  v34 = *(_QWORD *)(v33 - 8);
  v35 = *(_QWORD *)(v34 + 72);
  v36 = *(unsigned __int8 *)(v34 + 80);
  v37 = (v36 + 32) & ~v36;
  v129 = v35;
  v130 = v33;
  v38 = swift_allocObject(v32, v37 + 5 * v35, v36 | 7);
  *(_OWORD *)(v38 + 16) = xmmword_100047360;
  v117 = v38;
  v127 = v38 + v37;
  *(_BYTE *)(v38 + v37) = 0;
  v39 = String.LocalizationValue.init(stringLiteral:)(6710863, 0xE300000000000000);
  static Locale.current.getter(v39);
  v40 = (void (*)(_QWORD))*((_QWORD *)v132 + 13);
  v133 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v134 = v9;
  v132 = v40;
  v40(v11);
  v111 = v31;
  v41 = v17;
  v42 = v17;
  v43 = v14;
  v44 = v14;
  v45 = v11;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAlternateCalendarType_Off", 33, 2, v42, 0, 0, v44, v11, "Display name for no alternate calendar overlay", 46, 2);
  v46 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
  v113 = v8;
  v131 = v18;
  v128 = v46;
  v46(v8, 1, 1, v18);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v47 = type metadata accessor for DisplayRepresentation.Image(0);
  v48 = sub_100007F0C(v47, (uint64_t)qword_10005DF80);
  v49 = *(_QWORD *)(v47 - 8);
  v50 = *(void (**)(char *, uint64_t, uint64_t))(v49 + 16);
  v125 = v48;
  v126 = v50;
  v51 = v122;
  v124 = v47;
  v50(v122, v48, v47);
  v120 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v49 + 56);
  v120(v51, 0, 1, v47);
  v52 = sub_100007E00(&qword_10005CC60);
  v110 = swift_allocObject(v52, ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))+ 2 * *(_QWORD *)(v19 + 72), *(unsigned __int8 *)(v19 + 80) | 7);
  *(_OWORD *)(v110 + 16) = xmmword_100047370;
  v53 = v41;
  v54 = String.LocalizationValue.init(stringLiteral:)(0x64656C6261736944, 0xE800000000000000);
  static Locale.current.getter(v54);
  v119 = v45;
  v55 = v133;
  v56 = v134;
  v57 = (void (*)(char *, uint64_t, uint64_t))v132;
  ((void (*)(char *, _QWORD, uint64_t))v132)(v45, v133, v134);
  LOWORD(v101) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAlternateCalendarType_Off_Synonym_Disabled", 50, 2, v41, 0, 0, v43, v45, "Synonym (\"Disabled\") of the off value for the alternate calendar overlay setting", 80, v101);
  v58 = v130;
  v59 = v127;
  v109 = v127 + *(int *)(v130 + 48);
  v60 = String.LocalizationValue.init(stringLiteral:)(1701736270, 0xE400000000000000);
  static Locale.current.getter(v60);
  v61 = v55;
  v62 = v55;
  v63 = v57;
  v57(v45, v62, v56);
  LOWORD(v102) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAlternateCalendarType_Off_Synonym_None", 46, 2, v53, 0, 0, v43, v45, "Synonym (\"None\") of the off value for the alternate calendar overlay setting", 76, v102);
  v64 = v121;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000117, 0x8000000100043B50);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v111, v113, v122, v110, v64);
  v65 = (_BYTE *)(v59 + v129);
  *v65 = 1;
  v122 = &v65[*(int *)(v58 + 48)];
  v66 = String.LocalizationValue.init(stringLiteral:)(0x6573656E696843, 0xE700000000000000);
  static Locale.current.getter(v66);
  v63(v45, v61, v56);
  LOWORD(v103) = 2;
  v67 = v112;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAlternateCalendarType_Chinese", 37, 2, v53, 0, 0, v43, v45, "Display name for the Chinese alternate calendar overlay", 55, v103);
  v68 = v123;
  v128(v123, 1, 1, v131);
  v69 = v114;
  v70 = v43;
  v71 = v53;
  v73 = v124;
  v72 = v125;
  v74 = v64;
  v75 = v126;
  v126(v114, v125, v124);
  v120(v69, 0, 1, v73);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000108, 0x8000000100043CE0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v67, v68, v69, &_swiftEmptyArrayStorage, v74);
  v76 = v129;
  v77 = v130;
  v122 = (char *)(2 * v129);
  v78 = v127;
  v79 = (_BYTE *)(v127 + 2 * v129);
  *v79 = 2;
  v113 = &v79[*(int *)(v77 + 48)];
  v107 = v53;
  v80 = String.LocalizationValue.init(stringLiteral:)(0x776572626548, 0xE600000000000000);
  v81 = v70;
  v108 = v70;
  static Locale.current.getter(v80);
  v82 = v119;
  ((void (*)(char *, _QWORD, uint64_t))v132)(v119, v133, v134);
  LOWORD(v104) = 2;
  v83 = v115;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAlternateCalendarType_Hebrew", 36, 2, v71, 0, 0, v81, v82, "Display name for the Hebrew alternate calendar overlay", 54, v104);
  v84 = v123;
  v85 = v131;
  v128(v123, 1, 1, v131);
  v86 = v124;
  v75(v69, v72, v124);
  v87 = v120;
  v120(v69, 0, 1, v86);
  v88 = v121;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000115, 0x8000000100043E60);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v83, v84, v69, &_swiftEmptyArrayStorage, v88);
  v89 = &v122[v76 + v78];
  *v89 = 3;
  v122 = &v89[*(int *)(v77 + 48)];
  v90 = v107;
  v91 = String.LocalizationValue.init(stringLiteral:)(0x69726A6948, 0xE500000000000000);
  v92 = v108;
  static Locale.current.getter(v91);
  v93 = v119;
  ((void (*)(char *, _QWORD, uint64_t))v132)(v119, v133, v134);
  LOWORD(v105) = 2;
  v94 = v116;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAlternateCalendarType_Hijri", 35, 2, v90, 0, 0, v92, v93, "Display name for the Hijri alternate calendar overlay", 53, v105);
  v95 = v85;
  v96 = v128;
  v128(v84, 1, 1, v95);
  v97 = v124;
  v126(v69, v125, v124);
  v87(v69, 0, 1, v97);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000132, 0x8000000100043FF0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v94, v84, v69, &_swiftEmptyArrayStorage, v88);
  *(_BYTE *)(v127 + 4 * v129) = 4;
  v98 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x8000000100044160);
  static Locale.current.getter(v98);
  ((void (*)(char *, _QWORD, uint64_t))v132)(v93, v133, v134);
  LOWORD(v106) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAlternateCalendarType_HijriUmmAlQura", 44, 2, v90, 0, 0, v92, v93, "Display name for the Hijri Umm al-Qura alternate calendar overlay", 65, v106);
  v96(v84, 1, 1, v131);
  v126(v69, v125, v97);
  v87(v69, 0, 1, v97);
  v99 = v118;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000151, 0x80000001000441D0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v88, v84, v69, &_swiftEmptyArrayStorage, v99);
  result = sub_100032C00(v117);
  qword_10005DFC8 = result;
  return result;
}

uint64_t sub_10002F820@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v20[24];

  v4 = sub_100007E00(&qword_10005CC78);
  __chkstk_darwin(v4);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = type metadata accessor for LocalizedStringResource(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (qword_10005C5A0 != -1)
    swift_once(&qword_10005C5A0, sub_10002ED14);
  swift_beginAccess(&qword_10005DFC8, v20, 32, 0);
  v11 = qword_10005DFC8;
  if (*(_QWORD *)(qword_10005DFC8 + 16) && (v12 = sub_100037554(a1), (v13 & 1) != 0))
  {
    v14 = v12;
    v15 = *(_QWORD *)(v11 + 56);
    v16 = type metadata accessor for DisplayRepresentation(0);
    v17 = *(_QWORD *)(v16 - 8);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v17 + 16))(v6, v15 + *(_QWORD *)(v17 + 72) * v14, v16);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v6, 0, 1, v16);
  }
  else
  {
    v16 = type metadata accessor for DisplayRepresentation(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  type metadata accessor for DisplayRepresentation(0);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v6, 1, v16))
  {
    sub_100010A58((uint64_t)v6);
    swift_endAccess(v20);
    return LocalizedStringResource.init(stringLiteral:)(0, 0xE000000000000000);
  }
  else
  {
    DisplayRepresentation.title.getter();
    sub_100010A58((uint64_t)v6);
    swift_endAccess(v20);
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v8 + 32))(a2, v10, v7);
  }
}

uint64_t sub_10002FA14(char *a1, char *a2)
{
  return sub_100033110(*a1, *a2);
}

unint64_t sub_10002FA24()
{
  unint64_t result;

  result = qword_10005D880;
  if (!qword_10005D880)
  {
    result = swift_getWitnessTable(&unk_10004AB8C, &type metadata for SettingsAlternateCalendarType);
    atomic_store(result, (unint64_t *)&qword_10005D880);
  }
  return result;
}

Swift::Int sub_10002FA68()
{
  char *v0;

  return sub_1000332D4(*v0);
}

uint64_t sub_10002FA70(uint64_t a1)
{
  char *v1;

  return sub_100033598(a1, *v1);
}

Swift::Int sub_10002FA78(uint64_t a1)
{
  char *v1;

  return sub_1000335D8(a1, *v1);
}

unint64_t sub_10002FA80@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_100032394(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10002FAAC@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_10002EAE0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10002FAD8()
{
  unint64_t result;

  result = qword_10005D888;
  if (!qword_10005D888)
  {
    result = swift_getWitnessTable(&unk_10004ACA4, &type metadata for SettingsAlternateCalendarType);
    atomic_store(result, (unint64_t *)&qword_10005D888);
  }
  return result;
}

unint64_t sub_10002FB20()
{
  unint64_t result;

  result = qword_10005D890;
  if (!qword_10005D890)
  {
    result = swift_getWitnessTable(&unk_10004ACDC, &type metadata for SettingsAlternateCalendarType);
    atomic_store(result, (unint64_t *)&qword_10005D890);
  }
  return result;
}

unint64_t sub_10002FB68()
{
  unint64_t result;

  result = qword_10005D898;
  if (!qword_10005D898)
  {
    result = swift_getWitnessTable(&unk_10004ABF4, &type metadata for SettingsAlternateCalendarType);
    atomic_store(result, (unint64_t *)&qword_10005D898);
  }
  return result;
}

unint64_t sub_10002FBB0()
{
  unint64_t result;

  result = qword_10005D8A0;
  if (!qword_10005D8A0)
  {
    result = swift_getWitnessTable(&unk_10004AD0C, &type metadata for SettingsAlternateCalendarType);
    atomic_store(result, (unint64_t *)&qword_10005D8A0);
  }
  return result;
}

unint64_t sub_10002FBF8()
{
  unint64_t result;

  result = qword_10005D8A8;
  if (!qword_10005D8A8)
  {
    result = swift_getWitnessTable(&unk_10004AD34, &type metadata for SettingsAlternateCalendarType);
    atomic_store(result, (unint64_t *)&qword_10005D8A8);
  }
  return result;
}

unint64_t sub_10002FC44()
{
  unint64_t result;

  result = qword_10005D8B0;
  if (!qword_10005D8B0)
  {
    result = swift_getWitnessTable(&unk_10004ADB4, &type metadata for SettingsAlternateCalendarType);
    atomic_store(result, (unint64_t *)&qword_10005D8B0);
  }
  return result;
}

uint64_t sub_10002FC88@<X0>(uint64_t a1@<X8>)
{
  return sub_10000773C(&qword_10005C598, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005DFB0, (uint64_t)sub_10002EB00, a1);
}

uint64_t sub_10002FCAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076D8(a1, a2, a3, (uint64_t (*)(void))sub_10002FCC0, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

unint64_t sub_10002FCC0()
{
  unint64_t result;

  result = qword_10005D8B8;
  if (!qword_10005D8B8)
  {
    result = swift_getWitnessTable(&unk_10004AC2C, &type metadata for SettingsAlternateCalendarType);
    atomic_store(result, (unint64_t *)&qword_10005D8B8);
  }
  return result;
}

uint64_t sub_10002FD04(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10002FCC0();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10002FD40()
{
  unint64_t result;

  result = qword_10005D8C0;
  if (!qword_10005D8C0)
  {
    result = swift_getWitnessTable(&unk_10004ADF4, &type metadata for SettingsAlternateCalendarType);
    atomic_store(result, (unint64_t *)&qword_10005D8C0);
  }
  return result;
}

unint64_t sub_10002FD88()
{
  unint64_t result;

  result = qword_10005D8C8;
  if (!qword_10005D8C8)
  {
    result = swift_getWitnessTable(&unk_10004AE1C, &type metadata for SettingsAlternateCalendarType);
    atomic_store(result, (unint64_t *)&qword_10005D8C8);
  }
  return result;
}

unint64_t sub_10002FDD0()
{
  unint64_t result;

  result = qword_10005D8D0;
  if (!qword_10005D8D0)
  {
    result = swift_getWitnessTable(&unk_10004ABB4, &type metadata for SettingsAlternateCalendarType);
    atomic_store(result, (unint64_t *)&qword_10005D8D0);
  }
  return result;
}

uint64_t sub_10002FE14()
{
  _BYTE v1[24];

  if (qword_10005C5A0 != -1)
    swift_once(&qword_10005C5A0, sub_10002ED14);
  swift_beginAccess(&qword_10005DFC8, v1, 0, 0);
  return swift_bridgeObjectRetain(qword_10005DFC8);
}

uint64_t sub_10002FE80(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10002FC44();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10002FEB8()
{
  return sub_10000A9CC(&qword_10005D8D8, &qword_10005D8E0, (uint64_t)&protocol conformance descriptor for [A]);
}

void sub_10002FEE4(_QWORD *a1@<X8>)
{
  *a1 = &off_100055158;
}

unint64_t sub_10002FEF8()
{
  unint64_t result;

  result = qword_10005D8E8;
  if (!qword_10005D8E8)
  {
    result = swift_getWitnessTable(&unk_10004AEB4, &type metadata for SettingsAlternateCalendarEntity);
    atomic_store(result, (unint64_t *)&qword_10005D8E8);
  }
  return result;
}

unint64_t sub_10002FF40()
{
  unint64_t result;

  result = qword_10005D8F0;
  if (!qword_10005D8F0)
  {
    result = swift_getWitnessTable(&unk_10004B1F0, &type metadata for SettingsAlternateCalendarEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D8F0);
  }
  return result;
}

uint64_t sub_10002FF84(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_10002FF9C, 0, 0);
}

id sub_10002FF9C()
{
  uint64_t v0;
  id result;
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;

  result = objc_msgSend((id)objc_opt_self(CUIKPreferences), "sharedPreferences");
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, "overlayCalendarID");

    if (v3)
    {
      v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
      v6 = v5;

      if (v4)
        v7 = 0;
      else
        v7 = v6 == 0xE000000000000000;
      if (v7)
      {
        v8 = 0xE000000000000000;
        goto LABEL_12;
      }
      if ((_stringCompareWithSmolCheck(_:_:expecting:)(0, 0xE000000000000000, v4, v6, 0) & 1) != 0)
      {
        v8 = v6;
LABEL_12:
        swift_bridgeObjectRelease(v8);
LABEL_13:
        v14 = 0;
LABEL_14:
        **(_BYTE **)(v0 + 16) = v14;
        return (id)(*(uint64_t (**)(void))(v0 + 8))();
      }
      v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSCalendarIdentifierChinese);
      v10 = v16;
      if (v6)
      {
        if (v15 == v4 && v6 == v16)
        {
          swift_bridgeObjectRelease_n(v6, 2);
          v14 = 1;
          goto LABEL_14;
        }
        v18 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, v4, v6, 0);
        swift_bridgeObjectRelease(v10);
        if ((v18 & 1) != 0)
        {
          swift_bridgeObjectRelease(v6);
          v14 = 1;
          goto LABEL_14;
        }
        v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSCalendarIdentifierHebrew);
        v21 = v20;
        if (v19 == v4 && v6 == v20)
        {
          v14 = 2;
          swift_bridgeObjectRelease_n(v6, 2);
          goto LABEL_14;
        }
        v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v20, v4, v6, 0);
        swift_bridgeObjectRelease(v21);
        if ((v22 & 1) != 0)
        {
          swift_bridgeObjectRelease(v6);
          v14 = 2;
          goto LABEL_14;
        }
        v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSCalendarIdentifierIslamicCivil);
        v25 = v24;
        if (v23 == v4 && v6 == v24)
        {
          swift_bridgeObjectRelease_n(v6, 2);
          v14 = 3;
          goto LABEL_14;
        }
        v26 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, v4, v6, 0);
        swift_bridgeObjectRelease(v25);
        if ((v26 & 1) != 0)
        {
          swift_bridgeObjectRelease(v6);
          v14 = 3;
          goto LABEL_14;
        }
        v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSCalendarIdentifierIslamicUmmAlQura);
        v29 = v28;
        if (v27 == v4 && v6 == v28)
        {
          swift_bridgeObjectRelease_n(v6, 2);
        }
        else
        {
          v30 = _stringCompareWithSmolCheck(_:_:expecting:)(v27, v28, v4, v6, 0);
          swift_bridgeObjectRelease(v6);
          swift_bridgeObjectRelease(v29);
          if ((v30 & 1) == 0)
            goto LABEL_13;
        }
        v14 = 4;
        goto LABEL_14;
      }
    }
    else
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(NSCalendarIdentifierChinese);
      v10 = v9;
    }
    swift_bridgeObjectRelease(v10);
    static String._unconditionallyBridgeFromObjectiveC(_:)(NSCalendarIdentifierHebrew);
    swift_bridgeObjectRelease(v11);
    static String._unconditionallyBridgeFromObjectiveC(_:)(NSCalendarIdentifierIslamicCivil);
    swift_bridgeObjectRelease(v12);
    static String._unconditionallyBridgeFromObjectiveC(_:)(NSCalendarIdentifierIslamicUmmAlQura);
    v8 = v13;
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_100030288(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_1000302A4, 0, 0);
}

void sub_1000302A4()
{
  __asm { BR              X9 }
}

uint64_t sub_1000302DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  NSString v5;

  static String._unconditionallyBridgeFromObjectiveC(_:)(NSCalendarIdentifierChinese);
  v2 = v1;
  v3 = objc_msgSend((id)objc_opt_self(CUIKPreferences), "sharedPreferences");
  if (!v3)
  {
    __break(1u);
    JUMPOUT(0x100030394);
  }
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  objc_msgSend(v4, "setOverlayCalendarID:", v5);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000303A8()
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
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  __int16 v19;
  _BYTE v20[16];

  v0 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v0);
  v2 = &v20[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v10);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v20[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x8000000100039D70);
  static Locale.current.getter(v17);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  v19 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAlternateCalendarEntityName", 35, 2, v12, 0, 0, v9, v6, "Name of the Alternate Calendar entity type", 42, v19);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v2, 1, 1, v13);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v16, v2);
}

uint64_t sub_1000305B4@<X0>(uint64_t a1@<X8>)
{
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
  _QWORD v26[2];

  v26[0] = a1;
  v1 = sub_100007E00(&qword_10005D190);
  __chkstk_darwin(v1);
  v3 = (char *)v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v4);
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Locale(0);
  __chkstk_darwin(v11);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v14);
  v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for LocalizedStringResource(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x8000000100039D70);
  static Locale.current.getter(v21);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAlternateCalendarEntityName", 35, 2, v16, 0, 0, v13, v10, "Name of the Alternate Calendar entity type", 42, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v6, 1, 1, v17);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v22 = type metadata accessor for DisplayRepresentation.Image(0);
  v23 = sub_100007F0C(v22, (uint64_t)qword_10005DF80);
  v24 = *(_QWORD *)(v22 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v3, v23, v22);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v3, 0, 1, v22);
  return DisplayRepresentation.init(title:subtitle:image:)(v20, v6, v3);
}

uint64_t sub_10003086C()
{
  uint64_t v0;

  v0 = qword_10005D870;
  swift_bridgeObjectRetain(off_10005D878);
  return v0;
}

unint64_t sub_1000308A4()
{
  unint64_t result;

  result = qword_10005D8F8;
  if (!qword_10005D8F8)
  {
    result = swift_getWitnessTable(&unk_10004AF0C, &type metadata for SettingsAlternateCalendarEntity);
    atomic_store(result, (unint64_t *)&qword_10005D8F8);
  }
  return result;
}

unint64_t sub_1000308EC()
{
  unint64_t result;

  result = qword_10005D900;
  if (!qword_10005D900)
  {
    result = swift_getWitnessTable(&unk_10004AF44, &type metadata for SettingsAlternateCalendarEntity);
    atomic_store(result, (unint64_t *)&qword_10005D900);
  }
  return result;
}

unint64_t sub_100030934()
{
  unint64_t result;

  result = qword_10005D908;
  if (!qword_10005D908)
  {
    result = swift_getWitnessTable(&unk_10004AF74, &type metadata for SettingsAlternateCalendarEntity);
    atomic_store(result, (unint64_t *)&qword_10005D908);
  }
  return result;
}

unint64_t sub_10003097C()
{
  unint64_t result;

  result = qword_10005D910;
  if (!qword_10005D910)
  {
    result = swift_getWitnessTable(&unk_10004B268, &type metadata for SettingsAlternateCalendarEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D910);
  }
  return result;
}

unint64_t sub_1000309C4()
{
  unint64_t result;

  result = qword_10005D918;
  if (!qword_10005D918)
  {
    result = swift_getWitnessTable(&unk_10004AFAC, &type metadata for SettingsAlternateCalendarEntity);
    atomic_store(result, (unint64_t *)&qword_10005D918);
  }
  return result;
}

unint64_t sub_100030A0C()
{
  unint64_t result;

  result = qword_10005D920;
  if (!qword_10005D920)
  {
    result = swift_getWitnessTable(&unk_10004AFD4, &type metadata for SettingsAlternateCalendarEntity);
    atomic_store(result, (unint64_t *)&qword_10005D920);
  }
  return result;
}

unint64_t sub_100030A54()
{
  unint64_t result;

  result = qword_10005D928;
  if (!qword_10005D928)
  {
    result = swift_getWitnessTable(&unk_10004AFFC, &type metadata for SettingsAlternateCalendarEntity);
    atomic_store(result, (unint64_t *)&qword_10005D928);
  }
  return result;
}

unint64_t sub_100030A9C()
{
  unint64_t result;

  result = qword_10005D930;
  if (!qword_10005D930)
  {
    result = swift_getWitnessTable(&unk_10004B054, &type metadata for SettingsAlternateCalendarEntity);
    atomic_store(result, (unint64_t *)&qword_10005D930);
  }
  return result;
}

void sub_100030AE0(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000019;
  a1[1] = 0x80000001000439B0;
}

uint64_t sub_100030B04()
{
  return sub_10000A9CC(&qword_10005D938, &qword_10005D940, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100030B30(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10002FEF8();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100030B6C()
{
  unint64_t result;

  result = qword_10005D948;
  if (!qword_10005D948)
  {
    result = swift_getWitnessTable(&unk_10004B084, &type metadata for SettingsAlternateCalendarEntity);
    atomic_store(result, (unint64_t *)&qword_10005D948);
  }
  return result;
}

uint64_t sub_100030BB4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100030A9C();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100030BF0()
{
  return sub_10000A9CC(&qword_10005D950, &qword_10005D958, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_100030C1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v13;
  _BYTE v14[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_100007F24(v10, qword_10005DFD0);
  sub_100007F0C(v10, (uint64_t)qword_10005DFD0);
  v11 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000019, 0x8000000100043940);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  v13 = 2;
  return LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsUpdateAlternateCalendarIntent_title", 43, 2, v9, 0, 0, v6, v3, "Display string for the title of the update alternate calendar intent", 68, v13);
}

uint64_t sub_100030DB0()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_10004B410);
  qword_10005DFE8 = result;
  return result;
}

uint64_t sub_100030DD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  v4 = type metadata accessor for MainActor(0);
  v3[7] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v3[8] = v5;
  v3[9] = v6;
  return swift_task_switch(sub_100030E44, v5, v6);
}

uint64_t sub_100030E44()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = v0[2];
  v0[3] = v1;
  v0[10] = v1;
  IntentParameter.wrappedValue.getter(v0 + 14);
  if (qword_10005C5B0 != -1)
    swift_once(&qword_10005C5B0, sub_100030DB0);
  v2 = qword_10005DFE8;
  v0[11] = qword_10005DFE8;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  v0[12] = v4;
  v5 = sub_10000A9CC(&qword_10005D9F8, &qword_10005DA00, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_100030F38;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 14, v2, &type metadata for SettingsAlternateCalendarType, v5);
}

uint64_t sub_100030F38()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *v1;
  v4 = *(_QWORD *)(*v1 + 88);
  v3 = *(_QWORD *)(*v1 + 96);
  v5 = *(_QWORD *)(*v1 + 80);
  *(_QWORD *)(*v1 + 104) = v0;
  swift_task_dealloc(v3);
  swift_release(v5);
  swift_release(v4);
  if (v0)
    v6 = sub_100008DC4;
  else
    v6 = sub_100030FB8;
  return swift_task_switch(v6, *(_QWORD *)(v2 + 64), *(_QWORD *)(v2 + 72));
}

void sub_100030FB8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 56));
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 113));
  __asm { BR              X9 }
}

uint64_t sub_100031004()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  NSString v5;
  uint64_t v6;

  static String._unconditionallyBridgeFromObjectiveC(_:)(NSCalendarIdentifierChinese);
  v2 = v1;
  v3 = objc_msgSend((id)objc_opt_self(CUIKPreferences), "sharedPreferences");
  if (!v3)
  {
    __break(1u);
    JUMPOUT(0x1000310C8);
  }
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  objc_msgSend(v4, "setOverlayCalendarID:", v5);

  static IntentResult.result<>()(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000310DC()
{
  if (qword_10005C5B0 != -1)
    swift_once(&qword_10005C5B0, sub_100030DB0);
  return swift_retain(qword_10005DFE8);
}

unint64_t sub_100031120()
{
  unint64_t result;

  result = qword_10005D960;
  if (!qword_10005D960)
  {
    result = swift_getWitnessTable(&unk_10004B1AC, &type metadata for UpdateIntent_alternateCalendarType);
    atomic_store(result, (unint64_t *)&qword_10005D960);
  }
  return result;
}

unint64_t sub_100031168()
{
  unint64_t result;

  result = qword_10005D968;
  if (!qword_10005D968)
  {
    result = swift_getWitnessTable(&unk_10004B1D4, &type metadata for UpdateIntent_alternateCalendarType);
    atomic_store(result, (unint64_t *)&qword_10005D968);
  }
  return result;
}

uint64_t sub_1000311AC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100050688, 1);
}

uint64_t sub_1000311BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076D8(a1, a2, a3, (uint64_t (*)(void))sub_1000236DC, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t sub_1000311D0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000773C(&qword_10005C5A8, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005DFD0, (uint64_t)sub_100030C1C, a1);
}

uint64_t sub_1000311F4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005DA1C);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10000AB50;
  return sub_100030DD4(a1, v5, v4);
}

uint64_t sub_100031258@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100031DE0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10003127C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000236DC();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_1000312A8()
{
  unint64_t result;

  result = qword_10005D978;
  if (!qword_10005D978)
  {
    result = swift_getWitnessTable(&unk_10004B230, &type metadata for SettingsAlternateCalendarEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D978);
  }
  return result;
}

unint64_t sub_1000312F0()
{
  unint64_t result;

  result = qword_10005D980[0];
  if (!qword_10005D980[0])
  {
    result = swift_getWitnessTable(&unk_10004AE54, &type metadata for SettingsAlternateCalendarEntity);
    atomic_store(result, qword_10005D980);
  }
  return result;
}

uint64_t sub_100031334(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10005D9E0 + dword_10005D9E0);
  v2 = (_QWORD *)swift_task_alloc(unk_10005D9E4);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_10000AB54;
  return v4();
}

uint64_t sub_100031390(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10002FF40();
  *v4 = v2;
  v4[1] = sub_100009358;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_1000313FC()
{
  unint64_t result;

  result = qword_10005D998;
  if (!qword_10005D998)
  {
    result = swift_getWitnessTable(&unk_10004B2C0, &type metadata for SettingsAlternateCalendarEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D998);
  }
  return result;
}

unint64_t sub_100031444()
{
  unint64_t result;

  result = qword_10005D9A0[0];
  if (!qword_10005D9A0[0])
  {
    result = swift_getWitnessTable(&unk_10004B320, &type metadata for SettingsAlternateCalendarEntityQuery);
    atomic_store(result, qword_10005D9A0);
  }
  return result;
}

uint64_t sub_100031488(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10002FF40();
  *v5 = v2;
  v5[1] = sub_1000094B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000314F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10002FF40();
  *v4 = v2;
  v4[1] = sub_10000AB54;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100031560()
{
  unint64_t result;

  result = qword_10005D9B8;
  if (!qword_10005D9B8)
  {
    result = swift_getWitnessTable(&unk_10004B348, &type metadata for SettingsAlternateCalendarEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005D9B8);
  }
  return result;
}

unint64_t sub_1000315A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005D9C0;
  if (!qword_10005D9C0)
  {
    v1 = sub_100007220(qword_10005D9C8);
    sub_100030A54();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005D9C0);
  }
  return result;
}

uint64_t sub_10003160C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10003097C();
  *v5 = v2;
  v5[1] = sub_100009170;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_alternateCalendarType()
{
  return &type metadata for UpdateIntent_alternateCalendarType;
}

ValueMetadata *type metadata accessor for SettingsAlternateCalendarEntityQuery()
{
  return &type metadata for SettingsAlternateCalendarEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsAlternateCalendarEntity()
{
  return &type metadata for SettingsAlternateCalendarEntity;
}

uint64_t storeEnumTagSinglePayload for SettingsAlternateCalendarType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000316F4 + 4 * byte_10004AB85[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100031728 + 4 * byte_10004AB80[v4]))();
}

uint64_t sub_100031728(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100031730(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100031738);
  return result;
}

uint64_t sub_100031744(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10003174CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_100031750(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100031758(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SettingsAlternateCalendarType()
{
  return &type metadata for SettingsAlternateCalendarType;
}

uint64_t sub_100031774@<X0>(uint64_t a1@<X8>)
{
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
  id v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t KeyPath;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t OpaqueTypeConformance2;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  Swift::String v45;

  v42 = a1;
  v1 = type metadata accessor for ControlSize(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00((uint64_t *)&unk_10005D1B0);
  v37 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007E00(&qword_10005CC68);
  v8 = *(_QWORD *)(v7 - 8);
  v38 = v7;
  v39 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100007E00(&qword_10005D1C0);
  v12 = *(_QWORD *)(v11 - 8);
  v40 = v11;
  v41 = v12;
  __chkstk_darwin(v11);
  v36 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v15._countAndFlagsBits = 0xD000000000000023;
  v45._countAndFlagsBits = 0xD00000000000002ALL;
  v45._object = (void *)0x80000001000438E0;
  v15._object = (void *)0x80000001000438B0;
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  v17 = NSLocalizedString(_:tableName:bundle:value:comment:)(v15, (Swift::String_optional)0, (NSBundle)v14, v16, v45);

  KeyPath = swift_getKeyPath(&unk_10004B410);
  static ControlSize._1x1.getter();
  v19 = sub_10002FCC0();
  v20 = sub_100032628();
  v21 = sub_1000312F0();
  ControlPicker.init<A, B, C, D, E, F, G>(kind:displayName:preferredSize:intentUpdatableProperty:title:value:affordances:)(0xD000000000000025, 0x80000001000443A0, v17._countAndFlagsBits, v17._object, v3, KeyPath, sub_100031AF0, 0, sub_100031CA8, 0, sub_100031D2C, 0, &type metadata for Text, &type metadata for Text, v19, v20, v21, &protocol witness table for Text, &protocol witness table for Text);
  v22 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000012, 0x80000001000443D0);
  v24 = v23;
  LOBYTE(v20) = v25;
  v27 = v26;
  v28 = sub_10000A9CC(&qword_10005D1D0, (uint64_t *)&unk_10005D1B0, (uint64_t)&protocol conformance descriptor for ControlPicker<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v22, v24, v20 & 1, v27, v4, v28);
  swift_bridgeObjectRelease(v27);
  swift_bridgeObjectRelease(v24);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v6, v4);
  v43 = v4;
  v44 = v28;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v43, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v30 = v36;
  v31 = v38;
  WidgetConfiguration.disablesControlStateCaching()(v38, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v31);
  v43 = v31;
  v44 = OpaqueTypeConformance2;
  v32 = swift_getOpaqueTypeConformance2(&v43, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v33 = v40;
  WidgetConfiguration.hiddenControl()(v40, v32);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v30, v33);
}

uint64_t sub_100031AF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  char v15;
  uint64_t v16;
  __int16 v17;
  _BYTE v18[16];

  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = &v18[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin();
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x8000000100039D70);
  static Locale.current.getter(v12);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  v17 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAlternateCalendarEntityName", 35, 2, v9, 0, 0, v7, v5, "Name of the Alternate Calendar entity type", 42, v17);
  result = Text.init(_:)(v11);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v14;
  *(_BYTE *)(a1 + 16) = v15 & 1;
  *(_QWORD *)(a1 + 24) = v16;
  return result;
}

uint64_t sub_100031CA8@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v4 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002F820(*a1, (uint64_t)v6);
  result = Text.init(_:)(v6);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v8;
  *(_BYTE *)(a2 + 16) = v9 & 1;
  *(_QWORD *)(a2 + 24) = v10;
  return result;
}

uint64_t sub_100031D2C(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002F820(*a1, (uint64_t)v4);
  v5 = Text.init(_:)(v4);
  return ControlAffordances.init(tint:status:actionHint:)(0, v5, v7, v6 & 1, v8, 0, 0, 0, 0);
}

uint64_t sub_100031DE0()
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
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_BYTE *, uint64_t, uint64_t);
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  void (*v29)(_BYTE *, uint64_t, uint64_t, uint64_t);
  _BYTE *v30;
  _BYTE *v31;
  _BYTE *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v38;
  uint64_t v39;
  _BYTE *v40;
  _BYTE *v41;
  _BYTE *v42;
  _BYTE *v43;
  unint64_t v44;
  __int16 v46;
  int v47;
  int v48;
  int v49;
  _BYTE v50[4];
  unsigned int v51;
  uint64_t v52;
  void (*v53)(_BYTE *, uint64_t, uint64_t);
  unsigned int v54;
  void (*v55)(_BYTE *);
  uint64_t v56;
  void (*v57)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  _BYTE *v61;
  _BYTE *v62;
  _BYTE *v63;
  _BYTE *v64;
  uint64_t v65;
  char v66[3];
  uint64_t v67;

  v65 = type metadata accessor for InputConnectionBehavior(0);
  v60 = *(_QWORD *)(v65 - 8);
  __chkstk_darwin(v65);
  v64 = &v50[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v1 = sub_100007E00((uint64_t *)&unk_10005D140);
  v2 = __chkstk_darwin(v1);
  v63 = &v50[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  v62 = &v50[-v4];
  v5 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v5);
  v61 = &v50[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v50[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = type metadata accessor for Locale(0);
  __chkstk_darwin(v11);
  v13 = &v50[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v14);
  v16 = &v50[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = type metadata accessor for LocalizedStringResource(0);
  v18 = *(_QWORD *)(v17 - 8);
  v58 = v17;
  v19 = __chkstk_darwin(v17);
  v59 = &v50[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v19);
  v22 = &v50[-v21];
  v56 = sub_100007E00(&qword_10005DA08);
  v23 = String.LocalizationValue.init(stringLiteral:)(0x746567726154, 0xE600000000000000);
  static Locale.current.getter(v23);
  v24 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v25 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 104);
  v51 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v52 = v7;
  v25(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  v53 = v25;
  v46 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target", 6, 2, v16, 0, 0, v13, v10, "Calendar settings entity title that indicates which setting the user would like to target.", 90, v46);
  v26 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x800000010003B560);
  static Locale.current.getter(v26);
  v25(v10, v24, v7);
  LOWORD(v47) = 2;
  v27 = v61;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target_description", 18, 2, v16, 0, 0, v13, v10, "Description for the Calendar settings entity parameter that indicates which setting the user would like to target.", 114, v47);
  v57 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v18 + 56);
  v57(v27, 0, 1, v17);
  v67 = 0;
  v28 = type metadata accessor for IntentDialog(0);
  v29 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56);
  v30 = v62;
  v29(v62, 1, 1, v28);
  v31 = v63;
  v29(v63, 1, 1, v28);
  v54 = enum case for InputConnectionBehavior.default(_:);
  v55 = *(void (**)(_BYTE *))(v60 + 104);
  v32 = v64;
  v55(v64);
  v33 = sub_10002FEF8();
  v60 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v22, v27, &v67, v30, v31, v32, v33);
  v56 = sub_100007E00(&qword_10005DA10);
  v34 = String.LocalizationValue.init(stringLiteral:)(0x65756C6156, 0xE500000000000000);
  static Locale.current.getter(v34);
  v35 = v51;
  v36 = v52;
  v37 = v53;
  v53(v10, v51, v52);
  LOWORD(v48) = 2;
  v38 = v59;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value", 5, 2, v16, 0, 0, v13, v10, "Calendar settings property title that indicates which property of a setting the user would like to set to as the value.", 119, v48);
  v39 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000026, 0x800000010003B6A0);
  static Locale.current.getter(v39);
  v37(v10, v35, v36);
  LOWORD(v49) = 2;
  v40 = v61;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value_description", 17, 2, v16, 0, 0, v13, v10, "Description for a Calendar settings property parameter that indicates which value of a setting the user would like to set to.", 125, v49);
  v57(v40, 0, 1, v58);
  v66[0] = 5;
  v41 = v62;
  v29(v62, 1, 1, v28);
  v42 = v63;
  v29(v63, 1, 1, v28);
  v43 = v64;
  ((void (*)(_BYTE *, _QWORD, uint64_t))v55)(v64, v54, v65);
  v44 = sub_10002FCC0();
  IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v38, v40, v66, v41, v42, v43, &off_100054E80, v44);
  return v60;
}

unint64_t sub_100032394(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000550C0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 5)
    return 5;
  else
    return v3;
}

uint64_t sub_1000323DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v0[2] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[3] = v2;
  v0[4] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Locale(0);
  v0[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  v0[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for LocalizedStringResource(0);
  v0[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100032498, 0, 0);
}

uint64_t sub_100032498()
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
  unint64_t v9;
  uint64_t v10;
  __int16 v12;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  sub_100007E00(&qword_10005D958);
  v7 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x8000000100039D70);
  static Locale.current.getter(v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v5);
  v12 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAlternateCalendarEntityName", 35, 2, v1, 0, 0, v4, v3, "Name of the Alternate Calendar entity type", 42, v12);
  v8 = sub_10000A9CC(&qword_10005D9F8, &qword_10005DA00, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v9 = sub_10002FCC0();
  v10 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10005D9E8, 0, &unk_10005D9F0, 0, &type metadata for UpdateIntent_alternateCalendarType, v8, v9);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v10);
}

uint64_t sub_1000325FC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

ValueMetadata *type metadata accessor for SettingsAlternateCalendarsPickerControl()
{
  return &type metadata for SettingsAlternateCalendarsPickerControl;
}

uint64_t sub_100032618(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000506CC, 1);
}

unint64_t sub_100032628()
{
  unint64_t result;

  result = qword_10005DA30;
  if (!qword_10005DA30)
  {
    result = swift_getWitnessTable(&unk_10004AC6C, &type metadata for SettingsAlternateCalendarType);
    atomic_store(result, (unint64_t *)&qword_10005DA30);
  }
  return result;
}

unint64_t sub_10003266C(uint64_t a1)
{
  return sub_100032A30(a1, &qword_10005C788, (uint64_t *)&unk_10005DC90, (uint64_t (*)(uint64_t))sub_10000696C, sub_1000375D0);
}

unint64_t sub_100032690(uint64_t a1)
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

  v2 = sub_100007E00(&qword_10005C7A0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
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
  sub_100007E00(&qword_10005DCA0);
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
    sub_100038BC0(v13, (uint64_t)v5, &qword_10005C7A0);
    v15 = *v5;
    result = sub_100037428(*v5, (uint64_t (*)(uint64_t))sub_10000696C, sub_1000375D0);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v8[6] + result) = v15;
    v19 = v8[7];
    v20 = sub_100007E00((uint64_t *)&unk_10005DCA8);
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

unint64_t sub_10003283C(uint64_t a1)
{
  return sub_100032858(a1, &qword_10005CC58, (uint64_t *)&unk_10005DC80, (uint64_t (*)(_QWORD))sub_1000372D8);
}

unint64_t sub_100032858(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unint64_t result;
  char v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(_QWORD);

  v31 = a4;
  v7 = sub_100007E00(a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a1 + 16);
  if (!v11)
  {
    v13 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v29 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v29);
    return (unint64_t)v13;
  }
  sub_100007E00(a3);
  v12 = static _DictionaryStorage.allocate(capacity:)(v11);
  v13 = (_QWORD *)v12;
  v14 = *(_QWORD *)(a1 + 16);
  if (!v14)
    goto LABEL_9;
  v15 = &v10[*(int *)(v7 + 48)];
  v16 = v12 + 64;
  v17 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v30 = a1;
  v18 = a1 + v17;
  v19 = *(_QWORD *)(v8 + 72);
  swift_retain(v12);
  while (1)
  {
    sub_100038BC0(v18, (uint64_t)v10, a2);
    v20 = *v10;
    result = v31(*v10);
    if ((v22 & 1) != 0)
      break;
    v23 = result;
    *(_QWORD *)(v16 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v13[6] + result) = v20;
    v24 = v13[7];
    v25 = type metadata accessor for DisplayRepresentation(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v24 + *(_QWORD *)(*(_QWORD *)(v25 - 8) + 72) * v23, v15, v25);
    v26 = v13[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
      goto LABEL_12;
    v13[2] = v28;
    v18 += v19;
    if (!--v14)
    {
      swift_release(v13);
      v29 = v30;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_1000329F0(uint64_t a1)
{
  return sub_100032858(a1, &qword_10005CF98, (uint64_t *)&unk_10005DC70, sub_1000373BC);
}

unint64_t sub_100032A0C(uint64_t a1)
{
  return sub_100032A30(a1, (uint64_t *)&unk_10005D1A0, (uint64_t *)&unk_10005DC60, (uint64_t (*)(uint64_t))sub_10001836C, (uint64_t (*)(uint64_t, Swift::Int))sub_100037EDC);
}

unint64_t sub_100032A30(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(uint64_t, Swift::Int))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unint64_t result;
  char v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  uint64_t (*v34)(uint64_t, Swift::Int);

  v33 = a4;
  v34 = a5;
  v8 = sub_100007E00(a2);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a1 + 16);
  if (!v12)
  {
    v14 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v30 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v30);
    return (unint64_t)v14;
  }
  sub_100007E00(a3);
  v13 = static _DictionaryStorage.allocate(capacity:)(v12);
  v14 = (_QWORD *)v13;
  v15 = *(_QWORD *)(a1 + 16);
  if (!v15)
    goto LABEL_9;
  v16 = &v11[*(int *)(v8 + 48)];
  v17 = v13 + 64;
  v18 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v32 = a1;
  v19 = a1 + v18;
  v20 = *(_QWORD *)(v9 + 72);
  swift_retain(v13);
  while (1)
  {
    sub_100038BC0(v19, (uint64_t)v11, a2);
    v21 = *v11;
    result = sub_100037428(*v11, v33, v34);
    if ((v23 & 1) != 0)
      break;
    v24 = result;
    *(_QWORD *)(v17 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v14[6] + result) = v21;
    v25 = v14[7];
    v26 = type metadata accessor for DisplayRepresentation(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v25 + *(_QWORD *)(*(_QWORD *)(v26 - 8) + 72) * v24, v16, v26);
    v27 = v14[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (v28)
      goto LABEL_12;
    v14[2] = v29;
    v19 += v20;
    if (!--v15)
    {
      swift_release(v14);
      v30 = v32;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_100032BC8(uint64_t a1)
{
  return sub_100032858(a1, &qword_10005D660, (uint64_t *)&unk_10005DC50, (uint64_t (*)(_QWORD))sub_1000374A8);
}

unint64_t sub_100032BE4(uint64_t a1)
{
  return sub_100032858(a1, &qword_10005D830, (uint64_t *)&unk_10005DC40, (uint64_t (*)(_QWORD))sub_100037524);
}

unint64_t sub_100032C00(uint64_t a1)
{
  return sub_100032858(a1, &qword_10005DA28, (uint64_t *)&unk_10005DC30, (uint64_t (*)(_QWORD))sub_100037554);
}

uint64_t sub_100032C1C(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v2 = 8 * a1;
  v3 = *(_QWORD *)&aNoalert_5[v2];
  v4 = *(_QWORD *)&aDayofeveoneday_0[v2 + 32];
  v5 = 8 * a2;
  v6 = *(_QWORD *)&aNoalert_5[v5];
  v7 = *(_QWORD *)&aDayofeveoneday_0[v5 + 32];
  if (v3 == v6 && v4 == v7)
    v9 = 1;
  else
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v6, *(_QWORD *)&aDayofeveoneday_0[8 * a2 + 32], 0);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v7);
  return v9 & 1;
}

void sub_100032CA0(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_100032CEC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_100032DE4 + 4 * byte_10004B509[a2]))(0x4D6E656574666966);
}

uint64_t sub_100032DE4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x4D6E656574666966 && v1 == 0xEE00736574756E69)
    v2 = 1;
  else
    v2 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1, 0x4D6E656574666966, 0xEE00736574756E69, 0);
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xEE00736574756E69);
  return v2 & 1;
}

void sub_100032F34(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_100032F80(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_100032FEC + 4 * byte_10004B517[a2]))(0x746E6576456C6C61);
}

uint64_t sub_100032FEC(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x746E6576456C6C61 && v1 == 0xE900000000000073)
    v2 = 1;
  else
    v2 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1, 0x746E6576456C6C61, 0xE900000000000073, 0);
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xE900000000000073);
  return v2 & 1;
}

uint64_t sub_10003308C(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v2 = 8 * a1;
  v3 = *(_QWORD *)&aSystemsesunday_0[v2];
  v4 = *(_QWORD *)&aSaturdaytting_0[v2 + 8];
  v5 = 8 * a2;
  v6 = *(_QWORD *)&aSystemsesunday_0[v5];
  v7 = *(_QWORD *)&aSaturdaytting_0[v5 + 8];
  if (v3 == v6 && v4 == v7)
    v9 = 1;
  else
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v6, *(_QWORD *)&aSaturdaytting_0[8 * a2 + 8], 0);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v7);
  return v9 & 1;
}

uint64_t sub_100033110(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v2 = a1;
  v3 = *(_QWORD *)((char *)&unk_10004C008 + v2 * 8);
  v4 = qword_10004C030[v2];
  v5 = a2;
  v6 = *(_QWORD *)((char *)&unk_10004C008 + v5 * 8);
  v7 = qword_10004C030[v5];
  if (v3 == v6 && v4 == v7)
    v9 = 1;
  else
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v6, qword_10004C030[a2], 0);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v7);
  return v9 & 1;
}

void sub_100033194(char a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, 0);
  __asm { BR              X10 }
}

Swift::Int sub_1000331EC()
{
  uint64_t v1;

  ((void (*)(uint64_t *, uint64_t, unint64_t))String.hash(into:))(&v1, 0x746E6576456C6C61, 0xE900000000000073);
  swift_bridgeObjectRelease(0xE900000000000073);
  return Hasher._finalize()();
}

Swift::Int sub_10003326C(char a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, 0);
  v2 = 8 * a1;
  v3 = *(_QWORD *)&aDayofeveoneday_0[v2 + 32];
  String.hash(into:)(v5, *(_QWORD *)&aNoalert_5[v2], v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

Swift::Int sub_1000332D4(char a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, 0);
  v2 = a1;
  v3 = qword_10004C030[v2];
  String.hash(into:)(v5, *(_QWORD *)((char *)&unk_10004C008 + v2 * 8), v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_10003333C(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 8 * a2;
  v3 = *(_QWORD *)&aDayofeveoneday_0[v2 + 32];
  String.hash(into:)(a1, *(_QWORD *)&aNoalert_5[v2], v3);
  return swift_bridgeObjectRelease(v3);
}

void sub_10003337C(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1000333C4(uint64_t a1)
{
  String.hash(into:)(a1, 0x4D6E656574666966, 0xEE00736574756E69);
  return swift_bridgeObjectRelease(0xEE00736574756E69);
}

void sub_1000334B0(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1000334F4(uint64_t a1)
{
  String.hash(into:)(a1, 0x746E6576456C6C61, 0xE900000000000073);
  return swift_bridgeObjectRelease(0xE900000000000073);
}

uint64_t sub_100033558(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 8 * a2;
  v3 = *(_QWORD *)&aSaturdaytting_0[v2 + 8];
  String.hash(into:)(a1, *(_QWORD *)&aSystemsesunday_0[v2], v3);
  return swift_bridgeObjectRelease(v3);
}

uint64_t sub_100033598(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a2;
  v3 = qword_10004C030[v2];
  String.hash(into:)(a1, *(_QWORD *)((char *)&unk_10004C008 + v2 * 8), v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_1000335D8(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6, a1);
  v3 = a2;
  v4 = qword_10004C030[v3];
  String.hash(into:)(v6, *(_QWORD *)((char *)&unk_10004C008 + v3 * 8), v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

Swift::Int sub_10003363C(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6, a1);
  v3 = 8 * a2;
  v4 = *(_QWORD *)&aSaturdaytting_0[v3 + 8];
  String.hash(into:)(v6, *(_QWORD *)&aSystemsesunday_0[v3], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

void sub_1000336A0(uint64_t a1, char a2)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, a1);
  __asm { BR              X10 }
}

Swift::Int sub_1000336F4()
{
  uint64_t v1;

  String.hash(into:)(&v1, 0x746E6576456C6C61, 0xE900000000000073);
  swift_bridgeObjectRelease(0xE900000000000073);
  return Hasher._finalize()();
}

Swift::Int sub_100033774(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6, a1);
  v3 = 8 * a2;
  v4 = *(_QWORD *)&aDayofeveoneday_0[v3 + 32];
  String.hash(into:)(v6, *(_QWORD *)&aNoalert_5[v3], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_1000337D8(char a1)
{
  return *(_QWORD *)&aNoalert_5[8 * a1];
}

uint64_t sub_1000337F8()
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

  v0 = sub_100007E00(&qword_10005D630);
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
  sub_100007F24(v16, qword_10005DFF0);
  sub_100007F0C(v16, (uint64_t)qword_10005DFF0);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000019, 0x8000000100040B10);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, _QWORD))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v19[0]);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0, 0, v8, v5, "Title for choosing an Default alert times for events.", 53, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v2, 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v2);
}

unint64_t sub_100033A0C()
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
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
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t);
  void (*v50)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t, uint64_t);
  void (*v60)(char *, uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t, uint64_t);
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t, uint64_t);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(char *, uint64_t, uint64_t);
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(char *, uint64_t, uint64_t);
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t result;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  _QWORD v126[2];
  uint64_t v127;
  _BYTE *v128;
  __int128 v129;
  uint64_t v130;
  void (*v131)(char *, uint64_t, uint64_t);
  char *v132;
  unsigned int v133;
  uint64_t v134;
  _BYTE *v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  __int128 v139;
  uint64_t v140;
  char *v141;
  char *v142;
  char *v143;
  char *v144;
  char *v145;
  char *v146;
  char *v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void (*v154)(char *, _QWORD, uint64_t, uint64_t);
  void (*v155)(char *, uint64_t, uint64_t);
  uint64_t v156;
  void (*v157)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;

  v0 = sub_100007E00(&qword_10005D190);
  v1 = __chkstk_darwin(v0);
  v148 = (char *)v126 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __chkstk_darwin(v1);
  v132 = (char *)v126 - v4;
  v5 = __chkstk_darwin(v3);
  v143 = (char *)v126 - v6;
  v7 = __chkstk_darwin(v5);
  v130 = (uint64_t)v126 - v8;
  __chkstk_darwin(v7);
  v135 = (char *)v126 - v9;
  v10 = sub_100007E00(&qword_10005D630);
  v11 = __chkstk_darwin(v10);
  v147 = (char *)v126 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v145 = (char *)v126 - v14;
  v15 = __chkstk_darwin(v13);
  v142 = (char *)v126 - v16;
  v17 = __chkstk_darwin(v15);
  v138 = (char *)v126 - v18;
  __chkstk_darwin(v17);
  v20 = (char *)v126 - v19;
  v21 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v160 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v23 = (char *)v126 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for Locale(0);
  __chkstk_darwin(v24);
  v26 = (char *)v126 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v27);
  v29 = (char *)v126 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = type metadata accessor for LocalizedStringResource(0);
  v31 = *(_QWORD *)(v30 - 8);
  v32 = __chkstk_darwin(v30);
  v146 = (char *)v126 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __chkstk_darwin(v32);
  v144 = (char *)v126 - v35;
  v36 = __chkstk_darwin(v34);
  v141 = (char *)v126 - v37;
  v38 = __chkstk_darwin(v36);
  v137 = (uint64_t)v126 - v39;
  __chkstk_darwin(v38);
  v41 = (char *)v126 - v40;
  v42 = sub_100007E00(&qword_10005DC08);
  v161 = sub_100007E00((uint64_t *)&unk_10005DC10);
  v43 = *(_QWORD *)(v161 - 8);
  v44 = *(_QWORD *)(v43 + 72);
  v45 = *(unsigned __int8 *)(v43 + 80);
  v46 = (v45 + 32) & ~v45;
  v159 = v44;
  v47 = swift_allocObject(v42, v46 + 5 * v44, v45 | 7);
  v129 = xmmword_100047360;
  *(_OWORD *)(v47 + 16) = xmmword_100047360;
  v134 = v47;
  v158 = v47 + v46;
  *(_BYTE *)(v47 + v46) = 0;
  v48 = String.LocalizationValue.init(stringLiteral:)(1701736270, 0xE400000000000000);
  static Locale.current.getter(v48);
  v49 = *(void (**)(char *, uint64_t, uint64_t))(v160 + 104);
  v133 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v131 = v49;
  ((void (*)(char *))v49)(v23);
  v127 = (uint64_t)v41;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_None", 39, 2, v29, 0, 0, v26, v23, "Display name for choosing no alert for all day events as default", 64, 2);
  v50 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56);
  v128 = v20;
  v160 = v30;
  v157 = v50;
  v50(v20, 1, 1, v30);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v51 = type metadata accessor for DisplayRepresentation.Image(0);
  v52 = sub_100007F0C(v51, (uint64_t)qword_10005DF80);
  v53 = *(_QWORD *)(v51 - 8);
  v155 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v53 + 16);
  v156 = v52;
  v54 = v135;
  v149 = v51;
  v155(v135, v52, v51);
  v154 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v53 + 56);
  v154(v54, 0, 1, v51);
  v153 = sub_100007E00(&qword_10005CC60);
  v55 = *(unsigned __int8 *)(v31 + 80);
  v150 = *(_QWORD *)(v31 + 72);
  v136 = 2 * v150;
  v151 = (v55 + 32) & ~v55;
  v140 = v151 + 2 * v150;
  v152 = v55 | 7;
  v56 = swift_allocObject(v153, v140, v55 | 7);
  v139 = xmmword_100047370;
  *(_OWORD *)(v56 + 16) = xmmword_100047370;
  v57 = String.LocalizationValue.init(stringLiteral:)(0x64656C6261736944, 0xE800000000000000);
  static Locale.current.getter(v57);
  v58 = v133;
  v59 = v131;
  v131(v23, v133, v21);
  v60 = v59;
  LOWORD(v105) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_None_Synonym_Disabled", 56, 2, v29, 0, 0, v26, v23, "Synonym (\"Disabled\") for the no alert option for the default all day event alert setting", 88, v105);
  v126[1] = v158 + *(int *)(v161 + 48);
  v61 = v158;
  v62 = String.LocalizationValue.init(stringLiteral:)(6710863, 0xE300000000000000);
  static Locale.current.getter(v62);
  v63 = v58;
  v64 = v58;
  v65 = v21;
  v60(v23, v63, v21);
  LOWORD(v106) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_None_Synonym_Off", 51, 2, v29, 0, 0, v26, v23, "Synonym (\"Off\") for the no alert option for the default all day event alert setting", 83, v106);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v127, v128, v135, v56);
  v135 = (_BYTE *)(v61 + v159);
  *v135 = 1;
  v66 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000015, 0x8000000100041B80);
  static Locale.current.getter(v66);
  v60(v23, v64, v21);
  v67 = v60;
  LOWORD(v107) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_DayOfEvent", 45, 2, v29, 0, 0, v26, v23, "Display name for choosing default alarm as on day of event type", 63, v107);
  v157(v138, 1, 1, v160);
  v68 = (char *)v130;
  v69 = v149;
  v155((_BYTE *)v130, v156, v149);
  v154(v68, 0, 1, v69);
  v70 = swift_allocObject(v153, v140, v152);
  *(_OWORD *)(v70 + 16) = v139;
  v71 = String.LocalizationValue.init(stringLiteral:)(0x2079616420656854, 0xEA0000000000666FLL);
  static Locale.current.getter(v71);
  v67(v23, v64, v65);
  LOWORD(v108) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_DayOfEvent_Synonym_TheDayOf", 62, 2, v29, 0, 0, v26, v23, "Synonym (\"The day of\") for the day of option for the default all day event alert setting", 88, v108);
  v72 = String.LocalizationValue.init(stringLiteral:)(0x6E726F6D20656854, 0xEE00666F20676E69);
  static Locale.current.getter(v72);
  v67(v23, v64, v65);
  LOWORD(v109) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_DayOfEvent_Synonym_TheMorningOf", 66, 2, v29, 0, 0, v26, v23, "Synonym (\"The morning of\") for the day of option for the default all day event alert setting", 92, v109);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v137, v138, v68, v70);
  v130 = 2 * v159;
  v128 = (_BYTE *)(v158 + 2 * v159);
  *v128 = 2;
  v73 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000012, 0x8000000100041D50);
  static Locale.current.getter(v73);
  v67(v23, v64, v65);
  LOWORD(v110) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_1DayBefore", 45, 2, v29, 0, 0, v26, v23, "Display name for choosing default alarm as one day before event type", 68, v110);
  v157(v142, 1, 1, v160);
  v74 = v143;
  v75 = v149;
  v155(v143, v156, v149);
  v154(v74, 0, 1, v75);
  v138 = (char *)(4 * v150);
  v137 = 5 * v150;
  v76 = v150;
  v127 = swift_allocObject(v153, v151 + 5 * v150, v152);
  *(_OWORD *)(v127 + 16) = v129;
  v77 = String.LocalizationValue.init(stringLiteral:)(0x2079616420656854, 0xEE0065726F666562);
  static Locale.current.getter(v77);
  v78 = v67;
  v67(v23, v64, v65);
  LOWORD(v111) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_1DayBefore_Synonym_TheDayBefore", 66, 2, v29, 0, 0, v26, v23, "Synonym (\"The day before\") for the day before default alert setting for all day events", 86, v111);
  v79 = String.LocalizationValue.init(stringLiteral:)(0x6562207961642041, 0xEC00000065726F66);
  static Locale.current.getter(v79);
  v67(v23, v64, v65);
  LOWORD(v112) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_1DayBefore_Synonym_ADayBefore", 64, 2, v29, 0, 0, v26, v23, "Synonym (\"A day before\") for the day before default alert setting for all day events", 84, v112);
  v80 = v136;
  v81 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000012, 0x8000000100041F70);
  static Locale.current.getter(v81);
  v78(v23, v64, v65);
  LOWORD(v113) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_1DayBefore_Synonym_TheMorningBefore", 70, 2, v29, 0, 0, v26, v23, "Synonym (\"The morning before\") for the day before default alert setting for all day events", 90, v113);
  v135 = (_BYTE *)(v80 + v76);
  v82 = String.LocalizationValue.init(stringLiteral:)(0x2079616420656E4FLL, 0xEE0065726F666562);
  static Locale.current.getter(v82);
  v83 = v64;
  v84 = v65;
  v85 = v65;
  v86 = v78;
  v78(v23, v64, v85);
  LOWORD(v114) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_1DayBefore_Synonym_OneDayBefore", 66, 2, v29, 0, 0, v26, v23, "Synonym (\"One day before\") for the day before default alert setting for all day events", 86, v114);
  v87 = String.LocalizationValue.init(stringLiteral:)(0x6562207961642031, 0xEC00000065726F66);
  static Locale.current.getter(v87);
  v78(v23, v64, v84);
  LOWORD(v115) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_1DayBefore_Synonym_1DayBefore", 64, 2, v29, 0, 0, v26, v23, "Synonym (\"1 day before\") for the day before default alert setting for all day events", 84, v115);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v141, v142, v143, v127);
  *(_BYTE *)(v158 + v130 + v159) = 3;
  v88 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x8000000100042190);
  static Locale.current.getter(v88);
  v78(v23, v64, v84);
  LOWORD(v116) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_2DaysBefore", 46, 2, v29, 0, 0, v26, v23, "Display name for choosing default alarm as two days before event type", 69, v116);
  v157(v145, 1, 1, v160);
  v89 = v132;
  v90 = v149;
  v155(v132, v156, v149);
  v154(v89, 0, 1, v90);
  v91 = swift_allocObject(v153, v140, v152);
  *(_OWORD *)(v91 + 16) = v139;
  v92 = String.LocalizationValue.init(stringLiteral:)(0x73796164206F7754, 0xEF65726F66656220);
  static Locale.current.getter(v92);
  v86(v23, v64, v84);
  LOWORD(v117) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_2DaysBefore_Synonym_TwoDaysBefore", 68, 2, v29, 0, 0, v26, v23, "Synonym (\"Two days before\") for the 2 days before default alert setting for all day events", 90, v117);
  v93 = String.LocalizationValue.init(stringLiteral:)(0x6220737961642032, 0xED000065726F6665);
  static Locale.current.getter(v93);
  v86(v23, v64, v84);
  LOWORD(v118) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_2DaysBefore_Synonym_2DaysBefore", 66, 2, v29, 0, 0, v26, v23, "Synonym (\"2 days before\") for the 2 days before default alert setting for all day events", 88, v118);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v144, v145, v89, v91);
  v159 = v158 + 4 * v159;
  *(_BYTE *)v159 = 4;
  v94 = String.LocalizationValue.init(stringLiteral:)(0x62206B6565772031, 0xED000065726F6665);
  static Locale.current.getter(v94);
  v95 = v86;
  v86(v23, v64, v84);
  LOWORD(v119) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_1WeekBefore", 46, 2, v29, 0, 0, v26, v23, "Display name for choosing default alarm as one week before event type", 69, v119);
  v157(v147, 1, 1, v160);
  v96 = v148;
  v97 = v149;
  v155(v148, v156, v149);
  v154(v96, 0, 1, v97);
  v160 = swift_allocObject(v153, v151 + 6 * v150, v152);
  *(_OWORD *)(v160 + 16) = xmmword_1000484C0;
  v98 = String.LocalizationValue.init(stringLiteral:)(0x62206B6565772041, 0xED000065726F6665);
  static Locale.current.getter(v98);
  v95(v23, v83, v84);
  LOWORD(v120) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_1WeekBefore_Synonym_AWeekBefore", 66, 2, v29, 0, 0, v26, v23, "Synonym (\"A week before\") for the 1 week before default alert setting for all day events", 88, v120);
  v99 = String.LocalizationValue.init(stringLiteral:)(0x6B65657720656854, 0xEF65726F66656220);
  static Locale.current.getter(v99);
  v95(v23, v83, v84);
  LOWORD(v121) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_1WeekBefore_Synonym_TheWeekBefore", 68, 2, v29, 0, 0, v26, v23, "Synonym (\"The week before\") for the 1 week before default alert setting for all day events", 90, v121);
  v100 = String.LocalizationValue.init(stringLiteral:)(0x6B65657720656E4FLL, 0xEF65726F66656220);
  static Locale.current.getter(v100);
  v95(v23, v83, v84);
  LOWORD(v122) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_1WeekBefore_Synonym_OneWeekBefore", 68, 2, v29, 0, 0, v26, v23, "Synonym (\"One week before\") for the 1 week before default alert setting for all day events", 90, v122);
  v101 = String.LocalizationValue.init(stringLiteral:)(0x62206B6565772031, 0xED000065726F6665);
  static Locale.current.getter(v101);
  v95(v23, v83, v84);
  LOWORD(v123) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_1WeekBefore_Synonym_1WeekBefore", 66, 2, v29, 0, 0, v26, v23, "Synonym (\"1 week before\") for the 1 week before default alert setting for all day events", 88, v123);
  v102 = String.LocalizationValue.init(stringLiteral:)(0x6220737961642037, 0xED000065726F6665);
  static Locale.current.getter(v102);
  v95(v23, v83, v84);
  LOWORD(v124) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_1WeekBefore_Synonym_7DaysBefore", 66, 2, v29, 0, 0, v26, v23, "Synonym (\"7 days before\") for the 1 week before default alert setting for all day events", 88, v124);
  v103 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000011, 0x8000000100040900);
  static Locale.current.getter(v103);
  v95(v23, v83, v84);
  LOWORD(v125) = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimeType_1WeekBefore_Synonym_SevenDaysBefore", 70, 2, v29, 0, 0, v26, v23, "Synonym (\"Sevent days before\") for the 1 week before default alert setting for all day events", 93, v125);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v146, v147, v148, v160);
  result = sub_100032858(v134, (uint64_t *)&unk_10005DC10, (uint64_t *)&unk_10005DC20, (uint64_t (*)(_QWORD))sub_1000374A8);
  qword_10005E008 = result;
  return result;
}

uint64_t sub_100034EE0@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v20[24];

  v4 = sub_100007E00(&qword_10005CC78);
  __chkstk_darwin(v4);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = type metadata accessor for LocalizedStringResource(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (qword_10005C5C0 != -1)
    swift_once(&qword_10005C5C0, sub_100033A0C);
  swift_beginAccess(&qword_10005E008, v20, 32, 0);
  v11 = qword_10005E008;
  if (*(_QWORD *)(qword_10005E008 + 16) && (v12 = sub_1000374A8(a1), (v13 & 1) != 0))
  {
    v14 = v12;
    v15 = *(_QWORD *)(v11 + 56);
    v16 = type metadata accessor for DisplayRepresentation(0);
    v17 = *(_QWORD *)(v16 - 8);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v17 + 16))(v6, v15 + *(_QWORD *)(v17 + 72) * v14, v16);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v6, 0, 1, v16);
  }
  else
  {
    v16 = type metadata accessor for DisplayRepresentation(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  type metadata accessor for DisplayRepresentation(0);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v6, 1, v16))
  {
    sub_100010A58((uint64_t)v6);
    swift_endAccess(v20);
    return LocalizedStringResource.init(stringLiteral:)(0, 0xE000000000000000);
  }
  else
  {
    DisplayRepresentation.title.getter();
    sub_100010A58((uint64_t)v6);
    swift_endAccess(v20);
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v8 + 32))(a2, v10, v7);
  }
}

unint64_t sub_1000350D8()
{
  unint64_t result;

  result = qword_10005DA50;
  if (!qword_10005DA50)
  {
    result = swift_getWitnessTable(&unk_10004B578, &type metadata for SettingsAllDayDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005DA50);
  }
  return result;
}

unint64_t sub_10003511C@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_1000388D0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100035148@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1000337D8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100035174()
{
  unint64_t result;

  result = qword_10005DA58;
  if (!qword_10005DA58)
  {
    result = swift_getWitnessTable(&unk_10004B690, &type metadata for SettingsAllDayDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005DA58);
  }
  return result;
}

unint64_t sub_1000351BC()
{
  unint64_t result;

  result = qword_10005DA60;
  if (!qword_10005DA60)
  {
    result = swift_getWitnessTable(&unk_10004B6C8, &type metadata for SettingsAllDayDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005DA60);
  }
  return result;
}

unint64_t sub_100035204()
{
  unint64_t result;

  result = qword_10005DA68;
  if (!qword_10005DA68)
  {
    result = swift_getWitnessTable(&unk_10004B5E0, &type metadata for SettingsAllDayDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005DA68);
  }
  return result;
}

unint64_t sub_10003524C()
{
  unint64_t result;

  result = qword_10005DA70;
  if (!qword_10005DA70)
  {
    result = swift_getWitnessTable(&unk_10004B6F8, &type metadata for SettingsAllDayDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005DA70);
  }
  return result;
}

unint64_t sub_100035294()
{
  unint64_t result;

  result = qword_10005DA78;
  if (!qword_10005DA78)
  {
    result = swift_getWitnessTable(&unk_10004B720, &type metadata for SettingsAllDayDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005DA78);
  }
  return result;
}

unint64_t sub_1000352E0()
{
  unint64_t result;

  result = qword_10005DA88;
  if (!qword_10005DA88)
  {
    result = swift_getWitnessTable(&unk_10004B7A0, &type metadata for SettingsAllDayDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005DA88);
  }
  return result;
}

uint64_t sub_100035324@<X0>(uint64_t a1@<X8>)
{
  return sub_10000773C(&qword_10005C5B8, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10005DFF0, (uint64_t)sub_1000337F8, a1);
}

uint64_t sub_100035348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076D8(a1, a2, a3, (uint64_t (*)(void))sub_10003535C, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

unint64_t sub_10003535C()
{
  unint64_t result;

  result = qword_10005DA90;
  if (!qword_10005DA90)
  {
    result = swift_getWitnessTable(&unk_10004B618, &type metadata for SettingsAllDayDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005DA90);
  }
  return result;
}

uint64_t sub_1000353A0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10003535C();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000353DC()
{
  unint64_t result;

  result = qword_10005DA98;
  if (!qword_10005DA98)
  {
    result = swift_getWitnessTable(&unk_10004B7E0, &type metadata for SettingsAllDayDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005DA98);
  }
  return result;
}

unint64_t sub_100035424()
{
  unint64_t result;

  result = qword_10005DAA0;
  if (!qword_10005DAA0)
  {
    result = swift_getWitnessTable(&unk_10004B808, &type metadata for SettingsAllDayDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005DAA0);
  }
  return result;
}

unint64_t sub_10003546C()
{
  unint64_t result;

  result = qword_10005DAA8;
  if (!qword_10005DAA8)
  {
    result = swift_getWitnessTable(&unk_10004B5A0, &type metadata for SettingsAllDayDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005DAA8);
  }
  return result;
}

uint64_t sub_1000354B0()
{
  _BYTE v1[24];

  if (qword_10005C5C0 != -1)
    swift_once(&qword_10005C5C0, sub_100033A0C);
  swift_beginAccess(&qword_10005E008, v1, 0, 0);
  return swift_bridgeObjectRetain(qword_10005E008);
}

uint64_t sub_10003551C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000352E0();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_100035554()
{
  return sub_10000A9CC(&qword_10005DAB0, &qword_10005DAB8, (uint64_t)&protocol conformance descriptor for [A]);
}

void sub_100035580(_QWORD *a1@<X8>)
{
  *a1 = &off_100055218;
}

unint64_t sub_100035594()
{
  unint64_t result;

  result = qword_10005DAC0;
  if (!qword_10005DAC0)
  {
    result = swift_getWitnessTable(&unk_10004B8A0, &type metadata for SettingsAllDayDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005DAC0);
  }
  return result;
}

unint64_t sub_1000355DC()
{
  unint64_t result;

  result = qword_10005DAC8;
  if (!qword_10005DAC8)
  {
    result = swift_getWitnessTable(&unk_10004BBDC, &type metadata for SettingsAllDayDefaultAlertTimesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005DAC8);
  }
  return result;
}

uint64_t sub_100035620(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100035638, 0, 0);
}

uint64_t sub_100035638()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  char v4;
  double v5;
  _BYTE *v6;

  v1 = objc_msgSend(objc_allocWithZone((Class)CUIKDefaultAlarmPreferences), "init");
  v2 = objc_msgSend(v1, "defaultAllDayAlarmOffset");

  v3 = objc_msgSend(v2, "integerValue");
  if (v3 == (id)NSNotFound.getter(v3))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "doubleValue");
    v4 = sub_100029E28(v5);
  }
  v6 = *(_BYTE **)(v0 + 16);

  *v6 = v4;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000356F0(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = *(_QWORD *)(a1 + 8);
  *(_BYTE *)(v2 + 32) = *a2;
  return swift_task_switch(sub_100035714, 0, 0);
}

uint64_t sub_100035714()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  id v4;

  AppDependency.wrappedValue.getter();
  v1 = *(void **)(v0 + 16);
  v2 = objc_msgSend(v1, "eventStore");
  swift_unknownObjectRelease(v1);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(v0 + 32);
    v4 = objc_msgSend(v2, "eventSources");
    objc_msgSend(objc_allocWithZone((Class)CUIKDefaultAlarmPreferences), "init");
    __asm { BR              X9 }
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000358EC()
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
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  __int16 v19;
  _BYTE v20[16];

  v0 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v0);
  v2 = &v20[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for Locale(0);
  __chkstk_darwin(v7);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v10);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v20[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000022, 0x8000000100044550);
  static Locale.current.getter(v17);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  v19 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimesEntityName", 41, 2, v12, 0, 0, v9, v6, "Name of the SettingsAllDayDefaultAlertTimesEntity type", 54, v19);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v2, 1, 1, v13);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v16, v2);
}

uint64_t sub_100035AF8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v32 = a1;
  v1 = sub_100007E00(&qword_10005D190);
  __chkstk_darwin(v1);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v4);
  v31 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Locale(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for LocalizedStringResource(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v30 - v21;
  v23 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000022, 0x8000000100044550);
  static Locale.current.getter(v23);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for LocalizedStringResource.BundleDescription.main(_:), v6);
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimesEntityName", 41, 2, v15, 0, 0, v12, v9, "Name of the SettingsAllDayDefaultAlertTimesEntity type", 54, 2);
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v25 = v31;
  v24(v31, 1, 1, v16);
  if (qword_10005C588 != -1)
    swift_once(&qword_10005C588, sub_10002E0DC);
  v26 = type metadata accessor for DisplayRepresentation.Image(0);
  v27 = sub_100007F0C(v26, (uint64_t)qword_10005DF80);
  v28 = *(_QWORD *)(v26 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v3, v27, v26);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v3, 0, 1, v26);
  LocalizedStringResource.init(stringLiteral:)(0xD0000000000000C7, 0x8000000100044580);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v22, v25, v3, &_swiftEmptyArrayStorage, v20);
}

uint64_t sub_100035E04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  _OWORD v7[2];
  uint64_t v8;

  sub_100007E00(&qword_10005D160);
  v0 = type metadata accessor for AppDependencyManager(0);
  memset(v7, 0, sizeof(v7));
  v8 = 0;
  v5 = static AppDependencyManager.shared.getter(v0, v1, v2, v3, v4);
  result = AppDependency.__allocating_init(key:manager:)(v7, v5);
  qword_10005E010 = result;
  return result;
}

uint64_t sub_100035E68()
{
  uint64_t v0;

  v0 = qword_10005DA40;
  swift_bridgeObjectRetain(off_10005DA48);
  return v0;
}

unint64_t sub_100035EA0()
{
  unint64_t result;

  result = qword_10005DAD0;
  if (!qword_10005DAD0)
  {
    result = swift_getWitnessTable(&unk_10004B8F8, &type metadata for SettingsAllDayDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005DAD0);
  }
  return result;
}

unint64_t sub_100035EE8()
{
  unint64_t result;

  result = qword_10005DAD8;
  if (!qword_10005DAD8)
  {
    result = swift_getWitnessTable(&unk_10004B930, &type metadata for SettingsAllDayDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005DAD8);
  }
  return result;
}

unint64_t sub_100035F30()
{
  unint64_t result;

  result = qword_10005DAE0;
  if (!qword_10005DAE0)
  {
    result = swift_getWitnessTable(&unk_10004B960, &type metadata for SettingsAllDayDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005DAE0);
  }
  return result;
}

unint64_t sub_100035F78()
{
  unint64_t result;

  result = qword_10005DAE8;
  if (!qword_10005DAE8)
  {
    result = swift_getWitnessTable(&unk_10004BC54, &type metadata for SettingsAllDayDefaultAlertTimesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005DAE8);
  }
  return result;
}

uint64_t sub_100035FBC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  if (qword_10005C5C8 != -1)
    swift_once(&qword_10005C5C8, sub_100035E04);
  v2 = qword_10005E010;
  *a1 = qword_10005E010;
  return swift_retain(v2);
}

unint64_t sub_100036010()
{
  unint64_t result;

  result = qword_10005DAF0;
  if (!qword_10005DAF0)
  {
    result = swift_getWitnessTable(&unk_10004B998, &type metadata for SettingsAllDayDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005DAF0);
  }
  return result;
}

unint64_t sub_100036058()
{
  unint64_t result;

  result = qword_10005DAF8;
  if (!qword_10005DAF8)
  {
    result = swift_getWitnessTable(&unk_10004B9C0, &type metadata for SettingsAllDayDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005DAF8);
  }
  return result;
}

unint64_t sub_1000360A0()
{
  unint64_t result;

  result = qword_10005DB00;
  if (!qword_10005DB00)
  {
    result = swift_getWitnessTable(&unk_10004B9E8, &type metadata for SettingsAllDayDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005DB00);
  }
  return result;
}

unint64_t sub_1000360E8()
{
  unint64_t result;

  result = qword_10005DB08;
  if (!qword_10005DB08)
  {
    result = swift_getWitnessTable(&unk_10004BA40, &type metadata for SettingsAllDayDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005DB08);
  }
  return result;
}

void sub_10003612C(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000027;
  a1[1] = 0x8000000100044650;
}

uint64_t sub_100036150()
{
  return sub_10000A9CC(&qword_10005DB10, &qword_10005DB18, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_10003617C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100035594();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000361B8()
{
  unint64_t result;

  result = qword_10005DB20;
  if (!qword_10005DB20)
  {
    result = swift_getWitnessTable(&unk_10004BA70, &type metadata for SettingsAllDayDefaultAlertTimesEntity);
    atomic_store(result, (unint64_t *)&qword_10005DB20);
  }
  return result;
}

uint64_t sub_100036200(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000360E8();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10003623C()
{
  return sub_10000A9CC(&qword_10005DB30, &qword_10005DB38, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_100036268()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v13;
  _BYTE v14[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v14[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_100007F24(v10, qword_10005E018);
  sub_100007F0C(v10, (uint64_t)qword_10005E018);
  v11 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000029, 0x80000001000444D0);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  v13 = 2;
  return LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("UpdateSettingsAllDayDefaultAlertTimesIntent_title", 49, 2, v9, 0, 0, v6, v3, "Display string for the title of the UpdateSettingsAllDayDefaultAlertTimesIntent", 79, v13);
}

uint64_t sub_1000363FC()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_10004BE10);
  qword_10005E030 = result;
  return result;
}

uint64_t sub_100036420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = type metadata accessor for MainActor(0);
  v3[9] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v3[10] = v5;
  v3[11] = v6;
  return swift_task_switch(sub_100036490, v5, v6);
}

uint64_t sub_100036490()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = v0[2];
  v0[4] = v1;
  v2 = v0[3];
  v0[12] = v1;
  v0[13] = v2;
  v0[5] = v2;
  IntentParameter.wrappedValue.getter(v0 + 17);
  if (qword_10005C5D8 != -1)
    swift_once(&qword_10005C5D8, sub_1000363FC);
  v3 = qword_10005E030;
  v0[14] = qword_10005E030;
  v4 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v3);
  v5 = (_QWORD *)swift_task_alloc(v4);
  v0[15] = v5;
  v6 = sub_10000A9CC(&qword_10005DBD8, &qword_10005DBE0, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v5 = v0;
  v5[1] = sub_10001C210;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 17, v3, &type metadata for SettingsAllDayDefaultAlertTimeType, v6);
}

uint64_t sub_10003658C()
{
  if (qword_10005C5D8 != -1)
    swift_once(&qword_10005C5D8, sub_1000363FC);
  return swift_retain(qword_10005E030);
}

unint64_t sub_1000365D0()
{
  unint64_t result;

  result = qword_10005DB40;
  if (!qword_10005DB40)
  {
    result = swift_getWitnessTable(&unk_10004BB98, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005DB40);
  }
  return result;
}

unint64_t sub_100036618()
{
  unint64_t result;

  result = qword_10005DB48;
  if (!qword_10005DB48)
  {
    result = swift_getWitnessTable(&unk_10004BBC0, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005DB48);
  }
  return result;
}

uint64_t sub_10003665C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100050764, 1);
}

uint64_t sub_10003666C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076D8(a1, a2, a3, (uint64_t (*)(void))sub_1000237A8, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t sub_100036680@<X0>(uint64_t a1@<X8>)
{
  return sub_10000773C(&qword_10005C5D0, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10005E018, (uint64_t)sub_100036268, a1);
}

uint64_t sub_1000366A4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10005DBFC);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10000AB50;
  return sub_100036420(a1, v5, v4);
}

uint64_t sub_100036708@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10003831C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10003672C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000237A8();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100036758()
{
  unint64_t result;

  result = qword_10005DB58;
  if (!qword_10005DB58)
  {
    result = swift_getWitnessTable(&unk_10004BC1C, &type metadata for SettingsAllDayDefaultAlertTimesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005DB58);
  }
  return result;
}

unint64_t sub_1000367A0()
{
  unint64_t result;

  result = qword_10005DB60[0];
  if (!qword_10005DB60[0])
  {
    result = swift_getWitnessTable(&unk_10004B840, &type metadata for SettingsAllDayDefaultAlertTimesEntity);
    atomic_store(result, qword_10005DB60);
  }
  return result;
}

uint64_t sub_1000367E4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v3;
  return swift_task_switch(sub_100036800, 0, 0);
}

uint64_t sub_100036800()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = *(uint64_t **)(v0 + 24);
  AppDependency.wrappedValue.getter();
  *v1 = sub_100038918(*(_QWORD *)(v0 + 16));
  v1[1] = v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100036844(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_1000355DC();
  *v4 = v2;
  v4[1] = sub_100009358;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_1000368B0()
{
  unint64_t result;

  result = qword_10005DB78;
  if (!qword_10005DB78)
  {
    result = swift_getWitnessTable(&unk_10004BCAC, &type metadata for SettingsAllDayDefaultAlertTimesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005DB78);
  }
  return result;
}

unint64_t sub_1000368F8()
{
  unint64_t result;

  result = qword_10005DB80[0];
  if (!qword_10005DB80[0])
  {
    result = swift_getWitnessTable(&unk_10004BD0C, &type metadata for SettingsAllDayDefaultAlertTimesEntityQuery);
    atomic_store(result, qword_10005DB80);
  }
  return result;
}

uint64_t sub_10003693C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_1000355DC();
  *v5 = v2;
  v5[1] = sub_1000094B4;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000369A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_1000355DC();
  *v4 = v2;
  v4[1] = sub_10000AB54;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100036A14()
{
  unint64_t result;

  result = qword_10005DB98;
  if (!qword_10005DB98)
  {
    result = swift_getWitnessTable(&unk_10004BD34, &type metadata for SettingsAllDayDefaultAlertTimesEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10005DB98);
  }
  return result;
}

unint64_t sub_100036A5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10005DBA0;
  if (!qword_10005DBA0)
  {
    v1 = sub_100007220(qword_10005DBA8);
    sub_1000360A0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10005DBA0);
  }
  return result;
}

uint64_t sub_100036AC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100035F78();
  *v5 = v2;
  v5[1] = sub_100009170;
  return EntityQuery.results()(a1, a2, v6);
}

ValueMetadata *type metadata accessor for UpdateIntent_allDayEventsDefaultAlertTimeType()
{
  return &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType;
}

ValueMetadata *type metadata accessor for SettingsAllDayDefaultAlertTimesEntityQuery()
{
  return &type metadata for SettingsAllDayDefaultAlertTimesEntityQuery;
}

ValueMetadata *type metadata accessor for SettingsAllDayDefaultAlertTimesEntity()
{
  return &type metadata for SettingsAllDayDefaultAlertTimesEntity;
}

uint64_t storeEnumTagSinglePayload for SettingsAllDayDefaultAlertTimeType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100036BA8 + 4 * byte_10004B539[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100036BDC + 4 * byte_10004B534[v4]))();
}

uint64_t sub_100036BDC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100036BE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100036BECLL);
  return result;
}

uint64_t sub_100036BF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100036C00);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_100036C04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100036C0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SettingsAllDayDefaultAlertTimeType()
{
  return &type metadata for SettingsAllDayDefaultAlertTimeType;
}

uint64_t sub_100036C28@<X0>(uint64_t a1@<X8>)
{
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
  id v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t KeyPath;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t OpaqueTypeConformance2;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  Swift::String v45;

  v42 = a1;
  v1 = type metadata accessor for ControlSize(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100007E00((uint64_t *)&unk_10005D1B0);
  v37 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100007E00(&qword_10005CC68);
  v8 = *(_QWORD *)(v7 - 8);
  v38 = v7;
  v39 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100007E00(&qword_10005D1C0);
  v12 = *(_QWORD *)(v11 - 8);
  v40 = v11;
  v41 = v12;
  __chkstk_darwin(v11);
  v36 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v15._countAndFlagsBits = 0xD000000000000022;
  v45._countAndFlagsBits = 0xD000000000000036;
  v45._object = (void *)0x8000000100044450;
  v15._object = (void *)0x8000000100044550;
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  v17 = NSLocalizedString(_:tableName:bundle:value:comment:)(v15, (Swift::String_optional)0, (NSBundle)v14, v16, v45);

  KeyPath = swift_getKeyPath(&unk_10004BE10);
  static ControlSize._1x1.getter();
  v19 = sub_10003535C();
  v20 = sub_100038C24();
  v21 = sub_1000367A0();
  ControlPicker.init<A, B, C, D, E, F, G>(kind:displayName:preferredSize:intentUpdatableProperty:title:value:affordances:)(0xD00000000000002ALL, 0x8000000100045390, v17._countAndFlagsBits, v17._object, v3, KeyPath, sub_100036FA4, 0, sub_10003715C, 0, sub_1000371E0, 0, &type metadata for Text, &type metadata for Text, v19, v20, v21, &protocol witness table for Text, &protocol witness table for Text);
  v22 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000017, 0x80000001000453C0);
  v24 = v23;
  LOBYTE(v20) = v25;
  v27 = v26;
  v28 = sub_10000A9CC(&qword_10005D1D0, (uint64_t *)&unk_10005D1B0, (uint64_t)&protocol conformance descriptor for ControlPicker<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v22, v24, v20 & 1, v27, v4, v28);
  swift_bridgeObjectRelease(v27);
  swift_bridgeObjectRelease(v24);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v6, v4);
  v43 = v4;
  v44 = v28;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v43, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v30 = v36;
  v31 = v38;
  WidgetConfiguration.disablesControlStateCaching()(v38, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v31);
  v43 = v31;
  v44 = OpaqueTypeConformance2;
  v32 = swift_getOpaqueTypeConformance2(&v43, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v33 = v40;
  WidgetConfiguration.hiddenControl()(v40, v32);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v30, v33);
}

uint64_t sub_100036FA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  char v15;
  uint64_t v16;
  __int16 v17;
  _BYTE v18[16];

  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = &v18[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin();
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000021, 0x80000001000453E0);
  static Locale.current.getter(v12);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  v17 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimesEntityName", 41, 2, v9, 0, 0, v7, v5, "Name of the SettingsAllDayDefaultAlertTimesEntity type", 54, v17);
  result = Text.init(_:)(v11);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v14;
  *(_BYTE *)(a1 + 16) = v15 & 1;
  *(_QWORD *)(a1 + 24) = v16;
  return result;
}

uint64_t sub_10003715C@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v4 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100034EE0(*a1, (uint64_t)v6);
  result = Text.init(_:)(v6);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v8;
  *(_BYTE *)(a2 + 16) = v9 & 1;
  *(_QWORD *)(a2 + 24) = v10;
  return result;
}

uint64_t sub_1000371E0(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100034EE0(*a1, (uint64_t)v4);
  v5 = Text.init(_:)(v4);
  return ControlAffordances.init(tint:status:actionHint:)(0, v5, v7, v6 & 1, v8, 0, 0, 0, 0);
}

uint64_t sub_100037294(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 16) = a2;
  *(_QWORD *)(a1 + 24) = 2 * a2;
  type metadata accessor for LocalizedStringResource(0);
  return a1;
}

void sub_1000372D8(char a1)
{
  uint64_t v1;
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, *(_QWORD *)(v1 + 40));
  __asm { BR              X10 }
}

uint64_t sub_100037334()
{
  uint64_t v0;
  Swift::Int v1;
  uint64_t v3;

  String.hash(into:)(&v3, 0x746E6576456C6C61, 0xE900000000000073);
  swift_bridgeObjectRelease(0xE900000000000073);
  v1 = Hasher._finalize()();
  return sub_1000379A8(v0, v1);
}

uint64_t sub_1000373BC(uint64_t a1)
{
  uint64_t v1;
  Swift::Int v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, *(_QWORD *)(v1 + 40));
  sub_10003337C((uint64_t)v5, a1);
  v3 = Hasher._finalize()();
  return sub_100037BB8(a1, v3);
}

uint64_t sub_100037414(uint64_t a1)
{
  return sub_100037428(a1, (uint64_t (*)(uint64_t))sub_10001836C, (uint64_t (*)(uint64_t, Swift::Int))sub_100037EDC);
}

uint64_t sub_100037428(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(uint64_t, Swift::Int))
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Int v9;
  _QWORD v12[9];

  Hasher.init(_seed:)(v12, *(_QWORD *)(v3 + 40));
  v6 = a2(a1);
  v8 = v7;
  String.hash(into:)(v12, v6, v7);
  swift_bridgeObjectRelease(v8);
  v9 = Hasher._finalize()();
  return a3(a1, v9);
}

unint64_t sub_1000374A8(char a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v1 + 40));
  v3 = 8 * a1;
  v4 = *(_QWORD *)&aDayofeveoneday_0[v3 + 32];
  String.hash(into:)(v7, *(_QWORD *)&aNoalert_5[v3], v4);
  swift_bridgeObjectRelease(v4);
  v5 = Hasher._finalize()();
  return sub_100037FEC(a1, v5);
}

unint64_t sub_100037524(char a1)
{
  uint64_t v1;
  Swift::Int v3;

  v3 = sub_10003363C(*(_QWORD *)(v1 + 40), a1);
  return sub_1000380FC(a1, v3);
}

unint64_t sub_100037554(char a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v1 + 40));
  v3 = a1;
  v4 = qword_10004C030[v3];
  String.hash(into:)(v7, *(_QWORD *)((char *)&unk_10004C008 + v3 * 8), v4);
  swift_bridgeObjectRelease(v4);
  v5 = Hasher._finalize()();
  return sub_10003820C(a1, v5);
}

uint64_t sub_1000375D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

uint64_t sub_1000379A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

uint64_t sub_100037BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

unint64_t sub_100037EDC(char a1, uint64_t a2)
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
    v6 = a1;
    v7 = *(_QWORD *)&aNoalert_6[v6 * 8];
    v8 = qword_10004BF30[v6];
    while (1)
    {
      v9 = *(char *)(*(_QWORD *)(v2 + 48) + v4);
      v10 = *(_QWORD *)&aNoalert_6[v9 * 8];
      v11 = qword_10004BF30[v9];
      if (v10 == v7 && v11 == v8)
        break;
      v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, qword_10004BF30[*(char *)(*(_QWORD *)(v2 + 48) + v4)], v7, v8, 0);
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
    swift_bridgeObjectRelease(qword_10004BF30[*(char *)(*(_QWORD *)(v2 + 48) + v4)]);
    swift_bridgeObjectRelease(v8);
  }
  return v4;
}

unint64_t sub_100037FEC(char a1, uint64_t a2)
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
    v7 = *(_QWORD *)&aNoalert_5[v6];
    v8 = *(_QWORD *)&aDayofeveoneday_0[v6 + 32];
    while (1)
    {
      v9 = 8 * *(char *)(*(_QWORD *)(v2 + 48) + v4);
      v10 = *(_QWORD *)&aNoalert_5[v9];
      v11 = *(_QWORD *)&aDayofeveoneday_0[v9 + 32];
      if (v10 == v7 && v11 == v8)
        break;
      v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, *(_QWORD *)&aDayofeveoneday_0[8 * *(char *)(*(_QWORD *)(v2 + 48) + v4) + 32], v7, v8, 0);
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
    swift_bridgeObjectRelease(*(_QWORD *)&aDayofeveoneday_0[8 * *(char *)(*(_QWORD *)(v2 + 48) + v4) + 32]);
    swift_bridgeObjectRelease(v8);
  }
  return v4;
}

unint64_t sub_1000380FC(char a1, uint64_t a2)
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
    v7 = *(_QWORD *)&aSystemsesunday_0[v6];
    v8 = *(_QWORD *)&aSaturdaytting_0[v6 + 8];
    while (1)
    {
      v9 = 8 * *(char *)(*(_QWORD *)(v2 + 48) + v4);
      v10 = *(_QWORD *)&aSystemsesunday_0[v9];
      v11 = *(_QWORD *)&aSaturdaytting_0[v9 + 8];
      if (v10 == v7 && v11 == v8)
        break;
      v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, *(_QWORD *)&aSaturdaytting_0[8 * *(char *)(*(_QWORD *)(v2 + 48) + v4) + 8], v7, v8, 0);
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
    swift_bridgeObjectRelease(*(_QWORD *)&aSaturdaytting_0[8 * *(char *)(*(_QWORD *)(v2 + 48) + v4) + 8]);
    swift_bridgeObjectRelease(v8);
  }
  return v4;
}

unint64_t sub_10003820C(char a1, uint64_t a2)
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
    v6 = a1;
    v7 = *(_QWORD *)((char *)&unk_10004C008 + v6 * 8);
    v8 = qword_10004C030[v6];
    while (1)
    {
      v9 = *(char *)(*(_QWORD *)(v2 + 48) + v4);
      v10 = *(_QWORD *)((char *)&unk_10004C008 + v9 * 8);
      v11 = qword_10004C030[v9];
      if (v10 == v7 && v11 == v8)
        break;
      v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, qword_10004C030[*(char *)(*(_QWORD *)(v2 + 48) + v4)], v7, v8, 0);
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
    swift_bridgeObjectRelease(qword_10004C030[*(char *)(*(_QWORD *)(v2 + 48) + v4)]);
    swift_bridgeObjectRelease(v8);
  }
  return v4;
}

uint64_t sub_10003831C()
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
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_BYTE *, uint64_t, uint64_t);
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  void (*v29)(_BYTE *, uint64_t, uint64_t, uint64_t);
  _BYTE *v30;
  _BYTE *v31;
  _BYTE *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v38;
  uint64_t v39;
  _BYTE *v40;
  _BYTE *v41;
  _BYTE *v42;
  _BYTE *v43;
  unint64_t v44;
  __int16 v46;
  int v47;
  int v48;
  int v49;
  _BYTE v50[4];
  unsigned int v51;
  uint64_t v52;
  void (*v53)(_BYTE *, uint64_t, uint64_t);
  unsigned int v54;
  void (*v55)(_BYTE *);
  uint64_t v56;
  void (*v57)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  _BYTE *v61;
  _BYTE *v62;
  _BYTE *v63;
  _BYTE *v64;
  uint64_t v65;
  _QWORD v66[4];

  v65 = type metadata accessor for InputConnectionBehavior(0);
  v60 = *(_QWORD *)(v65 - 8);
  __chkstk_darwin(v65);
  v64 = &v50[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v1 = sub_100007E00((uint64_t *)&unk_10005D140);
  v2 = __chkstk_darwin(v1);
  v63 = &v50[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  v62 = &v50[-v4];
  v5 = sub_100007E00(&qword_10005D630);
  __chkstk_darwin(v5);
  v61 = &v50[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v50[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = type metadata accessor for Locale(0);
  __chkstk_darwin(v11);
  v13 = &v50[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v14);
  v16 = &v50[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = type metadata accessor for LocalizedStringResource(0);
  v18 = *(_QWORD *)(v17 - 8);
  v58 = v17;
  v19 = __chkstk_darwin(v17);
  v59 = &v50[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v19);
  v22 = &v50[-v21];
  v56 = sub_100007E00(&qword_10005DBE8);
  v23 = String.LocalizationValue.init(stringLiteral:)(0x746567726154, 0xE600000000000000);
  static Locale.current.getter(v23);
  v24 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v25 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 104);
  v51 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v52 = v7;
  v25(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  v53 = v25;
  v46 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target", 6, 2, v16, 0, 0, v13, v10, "Calendar settings entity title that indicates which setting the user would like to target.", 90, v46);
  v26 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x800000010003B560);
  static Locale.current.getter(v26);
  v25(v10, v24, v7);
  LOWORD(v47) = 2;
  v27 = v61;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Target_description", 18, 2, v16, 0, 0, v13, v10, "Description for the Calendar settings entity parameter that indicates which setting the user would like to target.", 114, v47);
  v57 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v18 + 56);
  v57(v27, 0, 1, v17);
  v28 = type metadata accessor for IntentDialog(0);
  v66[0] = 0;
  v66[1] = 0;
  v29 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56);
  v30 = v62;
  v29(v62, 1, 1, v28);
  v31 = v63;
  v29(v63, 1, 1, v28);
  v54 = enum case for InputConnectionBehavior.default(_:);
  v55 = *(void (**)(_BYTE *))(v60 + 104);
  v32 = v64;
  v55(v64);
  v33 = sub_100035594();
  v60 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v22, v27, v66, v30, v31, v32, v33);
  v56 = sub_100007E00(&qword_10005DBF0);
  v34 = String.LocalizationValue.init(stringLiteral:)(0x65756C6156, 0xE500000000000000);
  static Locale.current.getter(v34);
  v35 = v51;
  v36 = v52;
  v37 = v53;
  v53(v10, v51, v52);
  LOWORD(v48) = 2;
  v38 = v59;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value", 5, 2, v16, 0, 0, v13, v10, "Calendar settings property title that indicates which property of a setting the user would like to set to as the value.", 119, v48);
  v39 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000026, 0x800000010003B6A0);
  static Locale.current.getter(v39);
  v37(v10, v35, v36);
  LOWORD(v49) = 2;
  v40 = v61;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("Value_description", 17, 2, v16, 0, 0, v13, v10, "Description for a Calendar settings property parameter that indicates which value of a setting the user would like to set to.", 125, v49);
  v57(v40, 0, 1, v58);
  LOBYTE(v66[0]) = 5;
  v41 = v62;
  v29(v62, 1, 1, v28);
  v42 = v63;
  v29(v63, 1, 1, v28);
  v43 = v64;
  ((void (*)(_BYTE *, _QWORD, uint64_t))v55)(v64, v54, v65);
  v44 = sub_10003535C();
  IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v38, v40, v66, v41, v42, v43, &off_100054ED0, v44);
  return v60;
}

unint64_t sub_1000388D0(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100055180, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 5)
    return 5;
  else
    return v3;
}

uint64_t sub_100038918(uint64_t a1)
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
  char *v14;
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
  _OWORD v27[2];
  uint64_t v28;

  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v12);
  v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007E00(&qword_10005DB38);
  v15 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000022, 0x8000000100044420);
  static Locale.current.getter(v15);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("SettingsAllDayDefaultAlertTimesEntityName", 41, 2, v11, 0, 0, v8, v5, "Name of the SettingsAllDayDefaultAlertTimesEntity type", 54, 2);
  v16 = sub_10000A9CC(&qword_10005DBD8, &qword_10005DBE0, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v17 = sub_10003535C();
  v18 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v14, &unk_10005DBC8, 0, &unk_10005DBD0, 0, &type metadata for UpdateIntent_allDayEventsDefaultAlertTimeType, v16, v17);
  sub_100007E00(&qword_10005D160);
  type metadata accessor for AppDependencyManager(0);
  memset(v27, 0, sizeof(v27));
  v28 = 0;
  v19 = swift_retain(v18);
  v24 = static AppDependencyManager.shared.getter(v19, v20, v21, v22, v23);
  v25 = AppDependency.__allocating_init(key:manager:)(v27, v24);
  *(_QWORD *)&v27[0] = a1;
  swift_retain(v18);
  swift_retain(v25);
  swift_unknownObjectRetain(a1);
  AppDependency.wrappedValue.setter(v27);
  swift_release(v25);
  swift_release_n(v18, 2);
  swift_unknownObjectRelease(a1);
  return v18;
}

uint64_t sub_100038BB4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

uint64_t sub_100038BC0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100007E00(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

ValueMetadata *type metadata accessor for SettingsAllDayDefaultAlertTimesPickerControl()
{
  return &type metadata for SettingsAllDayDefaultAlertTimesPickerControl;
}

uint64_t sub_100038C14(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000507A8, 1);
}

unint64_t sub_100038C24()
{
  unint64_t result;

  result = qword_10005DCB8;
  if (!qword_10005DCB8)
  {
    result = swift_getWitnessTable(&unk_10004B658, &type metadata for SettingsAllDayDefaultAlertTimeType);
    atomic_store(result, (unint64_t *)&qword_10005DCB8);
  }
  return result;
}

uint64_t sub_100038C68()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC23CalendarWidgetExtensionP33_0840C6F82D9CCF8D2CA6BFA71AA17DB919ResourceBundleClass);
}
