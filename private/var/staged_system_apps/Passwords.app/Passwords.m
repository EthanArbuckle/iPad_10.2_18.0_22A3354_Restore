uint64_t sub_100004EBC()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;

  v0 = type metadata accessor for AppLaunchActions();
  v1 = swift_allocObject(v0, 16, 7);
  v2 = objc_msgSend((id)objc_opt_self(WBSAnalyticsLogger), "sharedLogger");
  objc_msgSend(v2, "didLaunchPasswordsApp");

  if (objc_msgSend((id)objc_opt_self(WBSFeatureAvailability), "isSignInWithAppleCredentialSharingEnabled"))
  {
    v3 = objc_msgSend(objc_allocWithZone((Class)PMSignInWithAppleController), "init");
    objc_msgSend(v3, "performHealthCheckInBackground");

  }
  return v1;
}

uint64_t sub_100004F68@<X0>(uint64_t a1@<X8>)
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
  char *v22;
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
  Swift::Int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t OpaqueTypeConformance2;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(char *, _QWORD, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t);
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  void (*v65)(char *, char *, uint64_t);
  uint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  uint64_t v70;
  void (*v71)(char *, uint64_t);
  void (*v72)(char *, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(char *, uint64_t);
  uint64_t (*v80)(char *, _QWORD, uint64_t);
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  char *v95;
  char v96[16];
  uint64_t v97;
  _QWORD v98[3];

  v90 = a1;
  v89 = sub_100008460(&qword_1000102F8);
  __chkstk_darwin(v89);
  v88 = (char *)&v74 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = sub_100008460(&qword_100010300);
  v85 = *(_QWORD *)(v87 - 8);
  v2 = __chkstk_darwin(v87);
  v86 = (char *)&v74 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __chkstk_darwin(v2);
  v84 = (char *)&v74 - v5;
  v6 = __chkstk_darwin(v4);
  v83 = (char *)&v74 - v7;
  __chkstk_darwin(v6);
  v94 = (char *)&v74 - v8;
  v9 = type metadata accessor for PMPasswordsApp(0);
  v75 = *(_QWORD *)(v9 - 8);
  v10 = *(_QWORD *)(v75 + 64);
  __chkstk_darwin(v9);
  v11 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for PMWindowGroupIdentifier(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_100008460(&qword_100010308);
  v77 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v18 = (char *)&v74 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_100008460(&qword_100010310);
  v20 = *(_QWORD *)(v19 - 8);
  v81 = v19;
  v82 = v20;
  __chkstk_darwin(v19);
  v22 = (char *)&v74 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_100008460(&qword_100010318);
  v92 = *(_QWORD *)(v23 - 8);
  v93 = v23;
  v24 = __chkstk_darwin(v23);
  v91 = (char *)&v74 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  v95 = (char *)&v74 - v26;
  v80 = *(uint64_t (**)(char *, _QWORD, uint64_t))(v13 + 104);
  v76 = v12;
  v27 = v80(v15, enum case for PMWindowGroupIdentifier.main(_:), v12);
  v28 = PMWindowGroupIdentifier.rawValue.getter(v27);
  v30 = v29;
  v79 = *(void (**)(char *, uint64_t))(v13 + 8);
  v79(v15, v12);
  v31 = v78;
  sub_100008CA8(v78, (uint64_t)v11);
  v32 = *(unsigned __int8 *)(v75 + 80);
  v33 = (v32 + 16) & ~v32;
  v34 = swift_allocObject(&unk_10000C788, v33 + v10, v32 | 7);
  sub_100008CF0((uint64_t)v11, v34 + v33);
  v35 = sub_100008460(&qword_100010320);
  v36 = sub_10000A200(&qword_100010328, &qword_100010320, (uint64_t)&unk_10000AA70);
  WindowGroup.init(id:title:lazyContent:)(v28, v30, 0, 0, 0, 0, sub_100008D34, v34, v35, v36);
  v37 = sub_1000093FC((uint64_t)&off_10000C638);
  swift_arrayDestroy(&unk_10000C658, 1, &type metadata for String);
  v38 = sub_10000A200(&qword_100010330, &qword_100010308, (uint64_t)&protocol conformance descriptor for WindowGroup<A>);
  Scene.handlesExternalEvents(matching:)(v37, v16, v38);
  swift_bridgeObjectRelease(v37);
  (*(void (**)(char *, uint64_t))(v77 + 8))(v18, v16);
  v97 = v31;
  v39 = sub_100008460(&qword_100010338);
  v98[0] = v16;
  v98[1] = v38;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v98, &opaque type descriptor for <<opaque return type of Scene.handlesExternalEvents(matching:)>>, 1);
  v41 = sub_10000A200(&qword_100010340, &qword_100010338, (uint64_t)&protocol conformance descriptor for TupleCommandContent<A>);
  v42 = v91;
  v43 = v81;
  Scene.commands<A>(content:)(sub_10000959C, v96, v81, v39, OpaqueTypeConformance2, v41);
  (*(void (**)(char *, uint64_t))(v82 + 8))(v22, v43);
  v44 = v92;
  (*(void (**)(char *, char *, uint64_t))(v92 + 32))(v95, v42, v93);
  v45 = v76;
  v46 = v80;
  v47 = v80(v15, enum case for PMWindowGroupIdentifier.accountDetails(_:), v76);
  v48 = PMWindowGroupIdentifier.rawValue.getter(v47);
  v50 = v49;
  v51 = v79;
  v79(v15, v45);
  v52 = sub_100008460(&qword_100010348);
  v53 = sub_10000A200(&qword_100010350, &qword_100010348, (uint64_t)&protocol conformance descriptor for NavigationStack<A, B>);
  v54 = v94;
  WindowGroup.init<A, B>(id:for:content:)(v48, v50, &type metadata for String, sub_10000791C, 0, &type metadata for String, v52, &protocol witness table for String, &protocol witness table for String, &protocol witness table for String, v53);
  v55 = v46(v15, enum case for PMWindowGroupIdentifier.wifiDetails(_:), v45);
  v56 = PMWindowGroupIdentifier.rawValue.getter(v55);
  v58 = v57;
  v51(v15, v45);
  v59 = v83;
  WindowGroup.init<A, B>(id:for:content:)(v56, v58, &type metadata for String, sub_100007938, 0, &type metadata for String, v52, &protocol witness table for String, &protocol witness table for String, &protocol witness table for String, v53);
  v60 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
  v61 = v91;
  v62 = v93;
  v60(v91, v95, v93);
  v63 = v84;
  v64 = v85;
  v65 = *(void (**)(char *, char *, uint64_t))(v85 + 16);
  v66 = v87;
  v65(v84, v54, v87);
  v67 = v86;
  v68 = v59;
  v65(v86, v59, v66);
  v69 = v88;
  v60(v88, v61, v62);
  v70 = v89;
  v65(&v69[*(int *)(v89 + 48)], v63, v66);
  v65(&v69[*(int *)(v70 + 64)], v67, v66);
  _TupleScene.init(_:)(v69, v70);
  v71 = *(void (**)(char *, uint64_t))(v64 + 8);
  v71(v68, v66);
  v71(v94, v66);
  v72 = *(void (**)(char *, uint64_t))(v92 + 8);
  v72(v95, v62);
  v71(v67, v66);
  v71(v63, v66);
  return ((uint64_t (*)(char *, uint64_t))v72)(v61, v62);
}

_QWORD *sub_100005660@<X0>(uint64_t a1@<X0>, uint64_t (**a2)(uint64_t a1)@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  _QWORD *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v4 = *(_QWORD *)(type metadata accessor for PMPasswordsApp(0) - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin();
  sub_100008CA8(a1, (uint64_t)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = (v6 + 16) & ~v6;
  v8 = swift_allocObject(&unk_10000C800, v7 + v5, v6 | 7);
  sub_100008CF0((uint64_t)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  *a2 = sub_1000097B4;
  a2[1] = (uint64_t (*)(uint64_t))v8;
  v9 = sub_100008460(&qword_100010320);
  v10 = (uint64_t (**)(uint64_t))((char *)a2 + *(int *)(v9 + 36));
  *v10 = swift_getKeyPath(&unk_10000A9F8);
  v11 = sub_100008460(&qword_100010468);
  swift_storeEnumTagMultiPayload(v10, v11, 0);
  v12 = (uint64_t (**)(uint64_t))((char *)a2 + *(int *)(v9 + 40));
  v13 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PMPasswordManagerState(0)), "init");
  v14 = type metadata accessor for PMExtensionCoordinator(0);
  swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
  v18 = PMExtensionCoordinator.init(appState:)(v13);
  result = State.init(wrappedValue:)(v19, &v18, v14);
  v16 = v19[1];
  *v12 = v19[0];
  v12[1] = v16;
  return result;
}

uint64_t sub_1000057BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = type metadata accessor for PMAccountsNavigationStyle(0);
  v4 = __chkstk_darwin();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = PMExtensionCoordinator.appState.getter(v4);
  v8 = type metadata accessor for PMPasswordsApp(0);
  AppStorage.wrappedValue.getter(*(_QWORD *)(a2 + *(int *)(v8 + 32)), v3);
  return PMPasswordsPaneView.init(appState:style:)(v7, v6);
}

uint64_t sub_100005860@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;

  v43 = a2;
  v42 = sub_100008460(&qword_100010368);
  __chkstk_darwin(v42);
  v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100008460(&qword_100010370);
  __chkstk_darwin(v5);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for PMWindowGroupIdentifier(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = type metadata accessor for PMAppCommands(0);
  v12 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for PMWindowGroupIdentifier.main(_:), v8);
  v16 = PMWindowGroupIdentifier.rawValue.getter(v15);
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  PMAppCommands.init(mainWindowGroupIdentifier:)(v16, v18);
  v19 = type metadata accessor for PMPasswordsApp(0);
  AppStorage.wrappedValue.getter(*(_QWORD *)(a1 + *(int *)(v19 + 36)), &type metadata for Bool);
  if (v44 == 1
    && (v20 = (char *)(a1 + *(int *)(v19 + 44)),
        v21 = *v20,
        v22 = *((_QWORD *)v20 + 1),
        v44 = v21,
        v45 = v22,
        v23 = sub_100008460(&qword_100010380),
        State.wrappedValue.getter(&v46, v23),
        (v46 & 1) == 0)
    && objc_msgSend((id)objc_opt_self(WBSFeatureAvailability), "isInternalInstall"))
  {
    v24 = LocalizedStringKey.init(stringLiteral:)(0x6775626544, 0xE500000000000000);
    v39 = v25;
    v40 = v24;
    v27 = v26;
    v38 = v28;
    __chkstk_darwin(v24);
    *(&v37 - 2) = a1;
    v29 = sub_100008460(&qword_100010388);
    v30 = sub_10000A200(&qword_100010390, &qword_100010388, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    CommandMenu.init(_:content:)(v40, v39, v27 & 1, v38, sub_1000095E4, &v37 - 4, v29, v30);
    v31 = sub_100008460(&qword_100010378);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v7, 0, 1, v31);
  }
  else
  {
    v32 = sub_100008460(&qword_100010378);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v7, 1, 1, v32);
  }
  v34 = v41;
  v33 = v42;
  v35 = (uint64_t)&v4[*(int *)(v42 + 48)];
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v4, v14, v41);
  sub_10000A240((uint64_t)v7, v35, &qword_100010370);
  TupleCommandContent.init(_:)(v4, v33);
  sub_10000A1C4((uint64_t)v7, &qword_100010370);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v34);
}

uint64_t sub_100005BA4@<X0>(char *a1@<X0>, char *a2@<X8>)
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
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
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
  uint64_t v51;
  char *v52;
  uint64_t v53;
  void (*v54)(char *, void (*)(char *, char *, uint64_t));
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  int *v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void (*v100)(char *, char *, uint64_t);
  char *v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  void (*v105)(char *, char *, uint64_t);
  char *v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  char *v110;
  int *v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  void (*v119)(char *, uint64_t);
  void (*v120)(char *, uint64_t);
  void (*v121)(char *, uint64_t);
  char *v122;
  char *v123;
  void (*v124)(char *, uint64_t);
  uint64_t v125;
  void (*v126)(char *, uint64_t);
  uint64_t v127;
  _QWORD v129[4];
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  char *v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  _QWORD *v138;
  char *v139;
  void (*v140)(char *, char *, uint64_t);
  uint64_t v141;
  char *v142;
  char *v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  uint64_t v151;
  char *v152;
  char *v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  char *v158;
  char *v159;
  char *v160;
  char *v161;
  char *v162;
  char *v163;
  uint64_t v164;
  char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  unsigned __int8 v170;

  v143 = a1;
  v139 = a2;
  v2 = sub_100008460(&qword_100010398);
  __chkstk_darwin(v2);
  v138 = (uint64_t *)((char *)&v130 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v167 = sub_100008460(&qword_1000103A0);
  v151 = *(_QWORD *)(v167 - 8);
  v4 = __chkstk_darwin(v167);
  v152 = (char *)&v130 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v163 = (char *)&v130 - v6;
  v166 = sub_100008460(&qword_1000103A8);
  v148 = *(_QWORD *)(v166 - 8);
  v7 = __chkstk_darwin(v166);
  v165 = (char *)&v130 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v161 = (char *)&v130 - v9;
  v164 = sub_100008460(&qword_1000103B0);
  v146 = *(_QWORD *)(v164 - 8);
  v10 = __chkstk_darwin(v164);
  v150 = (char *)&v130 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v160 = (char *)&v130 - v12;
  v149 = sub_100008460(&qword_1000103B8);
  v141 = *(_QWORD *)(v149 - 8);
  v13 = __chkstk_darwin(v149);
  v162 = (char *)&v130 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v13);
  v147 = (char *)&v130 - v16;
  v17 = __chkstk_darwin(v15);
  v159 = (char *)&v130 - v18;
  v19 = __chkstk_darwin(v17);
  v158 = (char *)&v130 - v20;
  __chkstk_darwin(v19);
  v135 = (char *)&v130 - v21;
  v145 = sub_100008460(&qword_1000103C0);
  v157 = *(_QWORD *)(v145 - 8);
  v22 = __chkstk_darwin(v145);
  v144 = (char *)&v130 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __chkstk_darwin(v22);
  v134 = (char *)&v130 - v25;
  __chkstk_darwin(v24);
  v156 = (char *)&v130 - v26;
  v140 = (void (*)(char *, char *, uint64_t))type metadata accessor for KeyEquivalent(0);
  v132 = *((_QWORD *)v140 - 1);
  v27 = __chkstk_darwin(v140);
  v133 = (char *)&v130 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  v30 = (char *)&v130 - v29;
  v137 = type metadata accessor for PMPasswordsApp(0);
  v31 = *(_QWORD *)(v137 - 8);
  v32 = *(_QWORD *)(v31 + 64);
  __chkstk_darwin(v137);
  v136 = sub_100008460(&qword_1000103C8);
  v131 = *(_QWORD *)(v136 - 8);
  __chkstk_darwin(v136);
  v34 = (char *)&v130 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_100008460(&qword_1000103D0);
  v154 = *(_QWORD *)(v35 - 8);
  v155 = v35;
  v36 = __chkstk_darwin(v35);
  v142 = (char *)&v130 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __chkstk_darwin(v36);
  v40 = (char *)&v130 - v39;
  __chkstk_darwin(v38);
  v153 = (char *)&v130 - v41;
  v42 = LocalizedStringKey.init(stringLiteral:)(0x72656B636950, 0xE600000000000000);
  sub_100008CA8((uint64_t)v143, (uint64_t)&v130 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0));
  v43 = *(unsigned __int8 *)(v31 + 80);
  v44 = (v43 + 16) & ~v43;
  v45 = swift_allocObject(&unk_10000C7B0, v44 + v32, v43 | 7);
  sub_100008CF0((uint64_t)&v130 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0), v45 + v44);
  Button<>.init(_:action:)(v42);
  v46 = KeyEquivalent.init(extendedGraphemeClusterLiteral:)(80, 0xE100000000000000);
  v47 = static EventModifiers.command.getter(v46);
  v48 = static EventModifiers.shift.getter();
  v49 = EventModifiers.init(rawValue:)(0);
  v50 = EventModifiers.init(rawValue:)(v49);
  if (EventModifiers.init(rawValue:)(v50 & v47) != v47)
    v49 = EventModifiers.init(rawValue:)(v49 | v47);
  v51 = EventModifiers.init(rawValue:)(v49);
  if (EventModifiers.init(rawValue:)(v51 & v48) != v48)
    v49 = EventModifiers.init(rawValue:)(v49 | v48);
  v52 = v143;
  v53 = v136;
  v136 = sub_10000A200(&qword_1000103D8, &qword_1000103C8, (uint64_t)&protocol conformance descriptor for Button<A>);
  View.keyboardShortcut(_:modifiers:)(v30, v49, v53);
  v54 = *(void (**)(char *, _QWORD *))(v132 + 8);
  v54(v30, v140);
  (*(void (**)(char *, uint64_t))(v131 + 8))(v34, v53);
  (*(void (**)(char *, char *, uint64_t))(v154 + 32))(v153, v40, v155);
  v55 = LocalizedStringKey.init(stringLiteral:)(0x646F4D206F6D6544, 0xE900000000000065);
  v57 = v56;
  v59 = v58;
  v61 = v60;
  v62 = (int *)v137;
  AppStorage.projectedValue.getter(&v168, *(_QWORD *)&v52[*(int *)(v137 + 28)], &type metadata for Bool);
  v63 = v135;
  Toggle<>.init(_:isOn:)(v55, v57, v59 & 1, v61, v168, v169, v170);
  v64 = v133;
  v65 = KeyEquivalent.init(extendedGraphemeClusterLiteral:)(68, 0xE100000000000000);
  v66 = static EventModifiers.command.getter(v65);
  v67 = static EventModifiers.shift.getter();
  v68 = EventModifiers.init(rawValue:)(0);
  v69 = EventModifiers.init(rawValue:)(v68);
  if (EventModifiers.init(rawValue:)(v69 & v66) != v66)
    v68 = EventModifiers.init(rawValue:)(v68 | v66);
  v70 = EventModifiers.init(rawValue:)(v68);
  if (EventModifiers.init(rawValue:)(v70 & v67) != v67)
    v68 = EventModifiers.init(rawValue:)(v68 | v67);
  sub_10000A200(&qword_1000103E0, &qword_1000103B8, (uint64_t)&protocol conformance descriptor for Toggle<A>);
  v71 = v134;
  v72 = v149;
  View.keyboardShortcut(_:modifiers:)(v64, v68, v149);
  v54(v64, v140);
  v143 = *(char **)(v141 + 8);
  ((void (*)(char *, uint64_t))v143)(v63, v72);
  (*(void (**)(char *, char *, uint64_t))(v157 + 32))(v156, v71, v145);
  v73 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000017, 0x800000010000ABB0);
  v75 = v74;
  LOBYTE(v72) = v76;
  v78 = v77;
  AppStorage.projectedValue.getter(&v168, *(_QWORD *)&v52[v62[10]], &type metadata for Bool);
  Toggle<>.init(_:isOn:)(v73, v75, v72 & 1, v78, v168, v169, v170);
  v79 = LocalizedStringKey.init(stringLiteral:)(0xD00000000000002ELL, 0x800000010000ABD0);
  v81 = v80;
  LOBYTE(v72) = v82;
  v84 = v83;
  AppStorage.projectedValue.getter(&v168, *(_QWORD *)&v52[v62[13]], &type metadata for Bool);
  Toggle<>.init(_:isOn:)(v79, v81, v72 & 1, v84, v168, v169, v170);
  v85 = sub_100008460(&qword_1000103E8);
  v86 = sub_10000A200(&qword_1000103F0, &qword_1000103E8, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  v87 = Section<>.init(content:)(sub_100006898, 0, v85, v86);
  __chkstk_darwin(v87);
  v129[2] = v52;
  Section<>.init(content:)(sub_1000095FC, v129, v53, v136);
  v88 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000010, 0x800000010000AC00);
  v90 = v89;
  LOBYTE(v84) = v91;
  v93 = v92;
  v94 = *(_QWORD *)&v52[v62[8]];
  v95 = type metadata accessor for PMAccountsNavigationStyle(0);
  v96 = v138;
  AppStorage.projectedValue.getter(v138, v94, v95);
  v97 = sub_100008460(&qword_1000103F8);
  v98 = sub_100009604(&qword_100010400, (uint64_t (*)(uint64_t))&type metadata accessor for PMAccountsNavigationStyle, (uint64_t)&protocol conformance descriptor for PMAccountsNavigationStyle);
  v99 = sub_10000A200(&qword_100010408, &qword_1000103F8, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  Picker<>.init(_:selection:content:)(v88, v90, v84 & 1, v93, v96, sub_100006CA8, 0, v95, v97, v98, v99);
  v100 = *(void (**)(char *, char *, uint64_t))(v154 + 16);
  v101 = v142;
  v102 = v155;
  v100(v142, v153, v155);
  v137 = *(_QWORD *)(v157 + 16);
  v103 = v144;
  v104 = v145;
  ((void (*)(char *, char *, uint64_t))v137)(v144, v156, v145);
  v105 = *(void (**)(char *, char *, uint64_t))(v141 + 16);
  v106 = v147;
  v107 = v149;
  v105(v147, v158, v149);
  v108 = v107;
  v105(v162, v159, v107);
  v138 = *(_QWORD **)(v146 + 16);
  v109 = v150;
  ((void (*)(char *, char *, uint64_t))v138)(v150, v160, v164);
  v140 = *(void (**)(char *, char *, uint64_t))(v148 + 16);
  v140(v165, v161, v166);
  v141 = *(_QWORD *)(v151 + 16);
  ((void (*)(char *, char *, uint64_t))v141)(v152, v163, v167);
  v110 = v139;
  v100(v139, v101, v102);
  v111 = (int *)sub_100008460(&qword_100010410);
  v112 = v103;
  v113 = v104;
  ((void (*)(char *, char *, uint64_t))v137)(&v110[v111[12]], v112, v104);
  v114 = v108;
  v105(&v110[v111[16]], v106, v108);
  v105(&v110[v111[20]], v162, v108);
  v115 = v164;
  ((void (*)(char *, char *, uint64_t))v138)(&v110[v111[24]], v109, v164);
  v116 = v166;
  v140(&v110[v111[28]], v165, v166);
  v117 = v152;
  v118 = v167;
  ((void (*)(char *, char *, uint64_t))v141)(&v110[v111[32]], v152, v167);
  v119 = *(void (**)(char *, uint64_t))(v151 + 8);
  v119(v163, v118);
  v120 = *(void (**)(char *, uint64_t))(v148 + 8);
  v120(v161, v116);
  v121 = *(void (**)(char *, uint64_t))(v146 + 8);
  v121(v160, v115);
  v122 = v143;
  ((void (*)(char *, uint64_t))v143)(v159, v114);
  ((void (*)(char *, uint64_t))v122)(v158, v114);
  v123 = v122;
  v124 = *(void (**)(char *, uint64_t))(v157 + 8);
  v125 = v113;
  v124(v156, v113);
  v126 = *(void (**)(char *, uint64_t))(v154 + 8);
  v127 = v155;
  v126(v153, v155);
  v119(v117, v167);
  v120(v165, v166);
  v121(v150, v164);
  ((void (*)(char *, uint64_t))v123)(v162, v114);
  ((void (*)(char *, uint64_t))v123)(v147, v114);
  v124(v144, v125);
  return ((uint64_t (*)(char *, uint64_t))v126)(v142, v127);
}

uint64_t sub_100006830(uint64_t a1)
{
  char *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[9];
  uint64_t v7;

  v1 = (char *)(a1 + *(int *)(type metadata accessor for PMPasswordsApp(0) + 20));
  v2 = *v1;
  v3 = *((_QWORD *)v1 + 1);
  v6[1] = v2;
  v7 = v3;
  v6[0] = 1;
  v4 = sub_100008460(&qword_100010380);
  return State.wrappedValue.setter(v6, v4);
}

uint64_t sub_100006898@<X0>(char *a1@<X8>)
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  uint64_t v21;

  v2 = sub_100008460(&qword_1000103C8);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v21 - v8;
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v21 - v11;
  __chkstk_darwin(v10);
  v14 = (char *)&v21 - v13;
  v15 = LocalizedStringKey.init(stringLiteral:)(0xD00000000000001ELL, 0x800000010000AC80);
  Button<>.init(_:action:)(v15);
  v16 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000021, 0x800000010000ACA0);
  Button<>.init(_:action:)(v16);
  v17 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v17(v9, v14, v2);
  v17(v6, v12, v2);
  v17(a1, v9, v2);
  v18 = sub_100008460(&qword_100010458);
  v17(&a1[*(int *)(v18 + 48)], v6, v2);
  v19 = *(void (**)(char *, uint64_t))(v3 + 8);
  v19(v12, v2);
  v19(v14, v2);
  v19(v6, v2);
  return ((uint64_t (*)(char *, uint64_t))v19)(v9, v2);
}

void sub_100006A54()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(WBSGeneratedPasswordStore), "sharedStore");
  objc_msgSend(v0, "debug_removeAll");

}

void sub_100006AA0()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;

  v0 = objc_msgSend((id)objc_opt_self(WBSSavedAccountStore), "sharedStore");
  if (v0)
  {
    v1 = v0;
    v2 = objc_msgSend(v0, "websiteNameProvider");

    if (v2)
    {
      v3 = objc_opt_self(_ASWebsiteNameProvider);
      v4 = (void *)swift_dynamicCastObjCClass(v2, v3);
      if (v4)
        objc_msgSend(v4, "debug_deleteAllPersistedData");
      swift_unknownObjectRelease(v2);
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100006B3C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = type metadata accessor for PMPasswordsApp(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  __chkstk_darwin(v2);
  v5 = LocalizedStringKey.init(stringLiteral:)(0xD00000000000001ELL, 0x800000010000AC60);
  sub_100008CA8(a1, (uint64_t)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(unsigned __int8 *)(v3 + 80);
  v7 = (v6 + 16) & ~v6;
  v8 = swift_allocObject(&unk_10000C7D8, v7 + v4, v6 | 7);
  sub_100008CF0((uint64_t)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  return Button<>.init(_:action:)(v5);
}

uint64_t sub_100006C40(uint64_t a1)
{
  char *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[9];
  uint64_t v7;

  v1 = (char *)(a1 + *(int *)(type metadata accessor for PMPasswordsApp(0) + 44));
  v2 = *v1;
  v3 = *((_QWORD *)v1 + 1);
  v6[1] = v2;
  v7 = v3;
  v6[0] = 1;
  v4 = sub_100008460(&qword_100010380);
  return State.wrappedValue.setter(v6, v4);
}

uint64_t sub_100006CA8@<X0>(uint64_t a1@<X8>)
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
  _QWORD *v10;
  uint64_t v11;
  char *v12;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(_QWORD, _QWORD, _QWORD, _QWORD);
  void (*v36)(_QWORD, _QWORD, _QWORD);
  char v37;
  void (*v38)(char *, _QWORD, uint64_t);
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  uint64_t v41;
  void (*v42)(uint64_t, _QWORD, uint64_t, uint64_t);
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(_QWORD, _QWORD, _QWORD, _QWORD);
  char v47;
  void (*v48)(_QWORD, _QWORD, _QWORD);
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  int v57;
  char *v58;
  uint64_t v59;
  void (*v60)(char *, char *, uint64_t);
  uint64_t v61;
  void (*v62)(uint64_t, _QWORD, uint64_t, uint64_t);
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
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  char *v80;
  void (*v81)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  void (*v89)(uint64_t, char *, uint64_t);
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  int *v105;
  uint64_t v107;
  void (*v108)(uint64_t, char *, uint64_t);
  char *v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  void (*v117)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void (*v121)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v122;
  void (*v123)(_QWORD, _QWORD, _QWORD);
  char *v124;
  char *v125;
  _QWORD *v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;

  v114 = a1;
  v1 = sub_100008460(&qword_100010418);
  __chkstk_darwin(v1);
  v3 = (char *)&v107 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100008460(&qword_100010420);
  __chkstk_darwin(v4);
  v132 = (uint64_t)&v107 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100008460(&qword_100010428);
  __chkstk_darwin(v6);
  v125 = (char *)&v107 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v130 = sub_100008460(&qword_100010430);
  __chkstk_darwin(v130);
  v9 = (char *)&v107 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = type metadata accessor for PMAccountsNavigationStyle(0);
  v10 = *(_QWORD **)(v115 - 8);
  __chkstk_darwin(v115);
  v12 = (char *)&v107 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100008460(&qword_100010438);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = __chkstk_darwin(v13);
  v113 = (uint64_t)&v107 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v112 = (uint64_t)&v107 - v18;
  v19 = __chkstk_darwin(v17);
  v111 = (char *)&v107 - v20;
  v21 = __chkstk_darwin(v19);
  v129 = (uint64_t)&v107 - v22;
  v23 = __chkstk_darwin(v21);
  v128 = (uint64_t)&v107 - v24;
  __chkstk_darwin(v23);
  v26 = (char *)&v107 - v25;
  v27 = sub_100008460(&qword_100010440);
  v28 = __chkstk_darwin(v27);
  v110 = (uint64_t)&v107 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  v31 = (char *)&v107 - v30;
  v32 = objc_msgSend((id)objc_opt_self(WBSFeatureAvailability), "isPasswordManagerAppEnabledAndInstalled");
  v126 = v10;
  v127 = v31;
  v131 = v13;
  v124 = v26;
  v109 = v3;
  if (v32)
  {
    v33 = LocalizedStringKey.init(stringLiteral:)(7368769, 0xE300000000000000);
    v34 = Text.init(_:tableName:bundle:comment:)(v33);
    v121 = v35;
    v122 = v34;
    v123 = v36;
    LODWORD(v120) = v37 & 1;
    v38 = (void (*)(char *, _QWORD, uint64_t))v10[13];
    v119 = v14;
    v39 = v115;
    v38(v12, enum case for PMAccountsNavigationStyle.app(_:), v115);
    v40 = (void (*)(char *, char *, uint64_t))v10[2];
    v41 = (uint64_t)v125;
    v40(v125, v12, v39);
    v42 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v126[7];
    v42(v41, 0, 1, v39);
    v43 = v12;
    v44 = v132;
    sub_10000A240(v41, v132, &qword_100010428);
    sub_10000A240(v44, (uint64_t)&v9[*(int *)(v130 + 36)], &qword_100010420);
    v46 = v121;
    v45 = v122;
    *(_QWORD *)v9 = v122;
    *((_QWORD *)v9 + 1) = v46;
    v47 = v120;
    v9[16] = v120;
    v48 = v123;
    *((_QWORD *)v9 + 3) = v123;
    sub_100009644(v45, (uint64_t)v46, v47);
    swift_bridgeObjectRetain(v48);
    sub_10000A1C4(v44, &qword_100010420);
    sub_10000A1C4(v41, &qword_100010428);
    v40(v3, v43, v39);
    v42((uint64_t)v3, 0, 1, v39);
    v13 = v131;
    v49 = sub_100008460(&qword_100010448);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v3, 0, 1, v49);
    sub_10000A240((uint64_t)v3, (uint64_t)&v26[*(int *)(v13 + 36)], &qword_100010418);
    sub_10000A240((uint64_t)v9, (uint64_t)v26, &qword_100010430);
    sub_10000A1C4((uint64_t)v3, &qword_100010418);
    v31 = v127;
    sub_10000A1C4((uint64_t)v9, &qword_100010430);
    v12 = v43;
    v50 = v43;
    v14 = v119;
    ((void (*)(char *, uint64_t))v126[1])(v50, v39);
    sub_100009654(v122, (uint64_t)v121, v120);
    swift_bridgeObjectRelease(v123);
    v10 = v126;
    sub_10000A284((uint64_t)v26, (uint64_t)v31, &qword_100010438);
    v51 = 0;
  }
  else
  {
    v51 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v31, v51, 1, v13);
  v52 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000010, 0x800000010000AC20);
  v53 = Text.init(_:tableName:bundle:comment:)(v52);
  v118 = v54;
  v119 = v53;
  v120 = v55;
  v57 = v56 & 1;
  v123 = (void (*)(_QWORD, _QWORD, _QWORD))v10[13];
  v58 = v12;
  v59 = v115;
  v123(v12, enum case for PMAccountsNavigationStyle.passwordOptions(_:), v115);
  v60 = (void (*)(char *, char *, uint64_t))v10[2];
  v61 = (uint64_t)v125;
  v60(v125, v12, v59);
  v62 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v10[7];
  v62(v61, 0, 1, v59);
  v63 = v132;
  sub_10000A240(v61, v132, &qword_100010428);
  sub_10000A240(v63, (uint64_t)&v9[*(int *)(v130 + 36)], &qword_100010420);
  v65 = v118;
  v64 = v119;
  *(_QWORD *)v9 = v119;
  *((_QWORD *)v9 + 1) = v65;
  LODWORD(v107) = v57;
  v9[16] = v57;
  v66 = v120;
  *((_QWORD *)v9 + 3) = v120;
  sub_100009644(v64, v65, v57);
  swift_bridgeObjectRetain(v66);
  sub_10000A1C4(v63, &qword_100010420);
  sub_10000A1C4(v61, &qword_100010428);
  v67 = (uint64_t)v109;
  v60(v109, v58, v59);
  v117 = v62;
  v62(v67, 0, 1, v59);
  v68 = sub_100008460(&qword_100010448);
  v121 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(v68 - 8) + 56);
  v122 = v68;
  v121(v67, 0, 1, v68);
  v69 = v128;
  sub_10000A240(v67, v128 + *(int *)(v131 + 36), &qword_100010418);
  sub_10000A240((uint64_t)v9, v69, &qword_100010430);
  sub_10000A1C4(v67, &qword_100010418);
  sub_10000A1C4((uint64_t)v9, &qword_100010430);
  v126 = (_QWORD *)v126[1];
  ((void (*)(char *, uint64_t))v126)(v58, v59);
  sub_100009654(v119, v118, v107);
  swift_bridgeObjectRelease(v120);
  sub_10000A284(v69, (uint64_t)v124, &qword_100010438);
  v70 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000012, 0x800000010000AC40);
  v120 = Text.init(_:tableName:bundle:comment:)(v70);
  v107 = v71;
  v73 = v72;
  LODWORD(v69) = v74 & 1;
  v116 = v58;
  v123(v58, enum case for PMAccountsNavigationStyle.safariBreadcrumbs(_:), v59);
  v108 = (void (*)(uint64_t, char *, uint64_t))v60;
  v60((char *)v61, v58, v59);
  v62(v61, 0, 1, v59);
  v75 = v132;
  sub_10000A240(v61, v132, &qword_100010428);
  sub_10000A240(v75, (uint64_t)&v9[*(int *)(v130 + 36)], &qword_100010420);
  v76 = v120;
  v77 = v107;
  *(_QWORD *)v9 = v120;
  *((_QWORD *)v9 + 1) = v77;
  v78 = v69;
  LODWORD(v118) = v69;
  v9[16] = v69;
  v119 = v73;
  *((_QWORD *)v9 + 3) = v73;
  v79 = v77;
  sub_100009644(v76, v77, v78);
  swift_bridgeObjectRetain(v73);
  sub_10000A1C4(v75, &qword_100010420);
  sub_10000A1C4(v61, &qword_100010428);
  v80 = v116;
  v60((char *)v67, v116, v59);
  v81 = v117;
  v117(v67, 0, 1, v59);
  v121(v67, 0, 1, v122);
  v82 = v129;
  sub_10000A240(v67, v129 + *(int *)(v131 + 36), &qword_100010418);
  sub_10000A240((uint64_t)v9, v82, &qword_100010430);
  sub_10000A1C4(v67, &qword_100010418);
  sub_10000A1C4((uint64_t)v9, &qword_100010430);
  ((void (*)(char *, uint64_t))v126)(v80, v59);
  sub_100009654(v120, v79, v118);
  swift_bridgeObjectRelease(v119);
  sub_10000A284(v82, v128, &qword_100010438);
  v83 = LocalizedStringKey.init(stringLiteral:)(0x53206D6574737953, 0xEF73676E69747465);
  v118 = Text.init(_:tableName:bundle:comment:)(v83);
  v120 = v84;
  v86 = v85;
  LODWORD(v62) = v87 & 1;
  v123(v80, enum case for PMAccountsNavigationStyle.systemSettings(_:), v59);
  v88 = (uint64_t)v125;
  v89 = v108;
  v108((uint64_t)v125, v80, v59);
  v81(v88, 0, 1, v59);
  v90 = v132;
  sub_10000A240(v88, v132, &qword_100010428);
  v91 = v59;
  sub_10000A240(v90, (uint64_t)&v9[*(int *)(v130 + 36)], &qword_100010420);
  v92 = v118;
  v93 = v120;
  *(_QWORD *)v9 = v118;
  *((_QWORD *)v9 + 1) = v93;
  LODWORD(v119) = (_DWORD)v62;
  v9[16] = (char)v62;
  v94 = v86;
  *((_QWORD *)v9 + 3) = v86;
  v95 = v92;
  sub_100009644(v92, v93, (char)v62);
  swift_bridgeObjectRetain(v94);
  sub_10000A1C4(v90, &qword_100010420);
  sub_10000A1C4(v88, &qword_100010428);
  v96 = v116;
  v89(v67, v116, v91);
  v117(v67, 0, 1, v91);
  v121(v67, 0, 1, v122);
  v97 = (uint64_t)v111;
  sub_10000A240(v67, (uint64_t)&v111[*(int *)(v131 + 36)], &qword_100010418);
  sub_10000A240((uint64_t)v9, v97, &qword_100010430);
  sub_10000A1C4(v67, &qword_100010418);
  sub_10000A1C4((uint64_t)v9, &qword_100010430);
  ((void (*)(char *, uint64_t))v126)(v96, v91);
  sub_100009654(v95, v120, v119);
  swift_bridgeObjectRelease(v94);
  v98 = v129;
  sub_10000A284(v97, v129, &qword_100010438);
  v99 = v110;
  sub_10000A240((uint64_t)v127, v110, &qword_100010440);
  v100 = (uint64_t)v124;
  sub_10000A240((uint64_t)v124, v97, &qword_100010438);
  v101 = v128;
  v102 = v112;
  sub_10000A240(v128, v112, &qword_100010438);
  v103 = v113;
  sub_10000A240(v98, v113, &qword_100010438);
  v104 = v114;
  sub_10000A240(v99, v114, &qword_100010440);
  v105 = (int *)sub_100008460(&qword_100010450);
  sub_10000A240(v97, v104 + v105[12], &qword_100010438);
  sub_10000A240(v102, v104 + v105[16], &qword_100010438);
  sub_10000A240(v103, v104 + v105[20], &qword_100010438);
  sub_10000A1C4(v129, &qword_100010438);
  sub_10000A1C4(v101, &qword_100010438);
  sub_10000A1C4(v100, &qword_100010438);
  sub_10000A1C4((uint64_t)v127, &qword_100010440);
  sub_10000A1C4(v103, &qword_100010438);
  sub_10000A1C4(v102, &qword_100010438);
  sub_10000A1C4(v97, &qword_100010438);
  return sub_10000A1C4(v99, &qword_100010440);
}

uint64_t sub_10000791C(uint64_t *a1)
{
  return sub_100007954(a1, (uint64_t (*)(_QWORD))&type metadata accessor for PMAppAccountDetailsWindowModel, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))&PMAppAccountDetailsWindowModel.init(accountID:), (uint64_t)sub_1000095C4);
}

uint64_t sub_100007938(uint64_t *a1)
{
  return sub_100007954(a1, (uint64_t (*)(_QWORD))&type metadata accessor for PMWiFiDetailsWindowModel, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))&PMWiFiDetailsWindowModel.init(networkID:), (uint64_t)sub_1000095A4);
}

uint64_t sub_100007954(uint64_t *a1, uint64_t (*a2)(_QWORD), uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4)
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
  uint64_t v19;
  _QWORD v20[4];

  v6 = *a1;
  v7 = a1[1];
  v19 = a1[3];
  swift_bridgeObjectRetain(v19);
  swift_retain(v6);
  swift_retain(v7);
  v8 = sub_100008460(&qword_100010358);
  Binding.projectedValue.getter(v20, v8);
  v9 = v20[0];
  v10 = v20[1];
  v12 = v20[2];
  v11 = v20[3];
  v13 = a2(0);
  swift_allocObject(v13, *(unsigned int *)(v13 + 48), *(unsigned __int16 *)(v13 + 52));
  v14 = a3(v9, v10, v12, v11);
  v15 = type metadata accessor for PMAppDetailsWindowView(0);
  v16 = sub_100009604(&qword_100010360, (uint64_t (*)(uint64_t))&type metadata accessor for PMAppDetailsWindowView, (uint64_t)&protocol conformance descriptor for PMAppDetailsWindowView);
  NavigationStack.init<>(root:)(a4, v14, v15, v16);
  swift_bridgeObjectRelease(v19);
  swift_release(v7);
  swift_release(v6);
  return swift_release(v14);
}

uint64_t sub_100007A80(uint64_t a1, unsigned int *a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v8;

  type metadata accessor for PMAppDetailsWindowView.Detail(0);
  __chkstk_darwin();
  v5 = (uint64_t *)((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v5 = a1;
  (*(void (**)(_QWORD *, _QWORD))(v6 + 104))(v5, *a2);
  swift_retain(a1);
  return PMAppDetailsWindowView.init(model:)(v5);
}

uint64_t sub_100007B10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  unsigned int *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  _BYTE v34[15];
  char v35;
  uint64_t v36;
  uint64_t v37;

  v2 = type metadata accessor for PMAccountsNavigationStyle(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = &v34[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  v8 = &v34[-v7];
  v9 = type metadata accessor for PMUIApplicationDelegate(0);
  v10 = sub_100009604(&qword_1000102E8, (uint64_t (*)(uint64_t))&type metadata accessor for PMUIApplicationDelegate, (uint64_t)&protocol conformance descriptor for PMUIApplicationDelegate);
  UIApplicationDelegateAdaptor<>.init(_:)(v9, v9, v10);
  v11 = (int *)type metadata accessor for PMPasswordsApp(0);
  v12 = a1 + v11[5];
  v35 = 0;
  State.init(wrappedValue:)(&v36, &v35, &type metadata for Bool);
  v13 = v37;
  *(_BYTE *)v12 = v36;
  *(_QWORD *)(v12 + 8) = v13;
  v14 = a1 + v11[6];
  v35 = 0;
  State.init(wrappedValue:)(&v36, &v35, &type metadata for Bool);
  v15 = v37;
  *(_BYTE *)v14 = v36;
  *(_QWORD *)(v14 + 8) = v15;
  v16 = v11[7];
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(WBSEnablePasswordManagerDemoModeKey);
  v19 = v18;
  v20 = (void *)objc_opt_self(NSUserDefaults);
  *(_QWORD *)(a1 + v16) = AppStorage.init<A>(wrappedValue:_:store:)(0, v17, v19, objc_msgSend(v20, "pm_defaults"));
  v21 = objc_msgSend((id)objc_opt_self(WBSFeatureAvailability), "isPasswordManagerAppEnabledAndInstalled");
  v22 = (unsigned int *)&enum case for PMAccountsNavigationStyle.app(_:);
  if (!v21)
    v22 = (unsigned int *)&enum case for PMAccountsNavigationStyle.systemSettings(_:);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104))(v8, *v22, v2);
  v23 = v11[8];
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v3 + 16))(v6, v8, v2);
  v24 = objc_msgSend(v20, "safari_browserDefaults");
  v25 = sub_100009604(&qword_1000102F0, (uint64_t (*)(uint64_t))&type metadata accessor for PMAccountsNavigationStyle, (uint64_t)&protocol conformance descriptor for PMAccountsNavigationStyle);
  v26 = AppStorage.init<A>(wrappedValue:_:store:)(v6, 0xD000000000000019, 0x800000010000AB30, v24, v2, v25);
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v8, v2);
  *(_QWORD *)(a1 + v23) = v26;
  v27 = v11[9];
  *(_QWORD *)(a1 + v27) = AppStorage.init<A>(wrappedValue:_:store:)(0, 0x75626544776F6853, 0xED0000756E654D67, 0);
  v28 = v11[10];
  *(_QWORD *)(a1 + v28) = AppStorage.init<A>(wrappedValue:_:store:)(0, 0xD000000000000014, 0x800000010000AB50, objc_msgSend(v20, "pm_defaults"));
  v29 = a1 + v11[11];
  v35 = 0;
  State.init(wrappedValue:)(&v36, &v35, &type metadata for Bool);
  v30 = v37;
  *(_BYTE *)v29 = v36;
  *(_QWORD *)(v29 + 8) = v30;
  v31 = a1 + v11[12];
  *(_QWORD *)v31 = sub_100004EBC;
  *(_QWORD *)(v31 + 8) = 0;
  *(_BYTE *)(v31 + 16) = 0;
  v32 = v11[13];
  result = AppStorage.init<A>(wrappedValue:_:store:)(0, 0xD000000000000032, 0x800000010000AB70, 0);
  *(_QWORD *)(a1 + v32) = result;
  return result;
}

uint64_t sub_100007E74@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  void (**v2)(uint64_t);
  void (**v3)(uint64_t);
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t KeyPath;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, char *, uint64_t);
  void (*v31)(char *, uint64_t);
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

  v3 = v2;
  v37 = a2;
  v5 = sub_100008460(&qword_100010470);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 16);
  v36 = *(_QWORD *)(v9 - 8);
  v33 = v9;
  __chkstk_darwin(v6);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100008D70(&qword_100010518);
  v13 = type metadata accessor for ModifiedContent(0, v9, v12);
  v35 = *(_QWORD *)(v13 - 8);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v34 = (char *)&v33 - v17;
  v18 = *v3;
  v19 = (uint64_t *)((char *)v3 + *(int *)(a1 + 40));
  v21 = *v19;
  v20 = v19[1];
  v40 = v21;
  v41 = v20;
  v22 = sub_100008460(&qword_100010520);
  State.wrappedValue.getter(&v42, v22);
  v23 = v42;
  v18(v42);
  swift_release(v23);
  KeyPath = swift_getKeyPath(&unk_10000AAC0);
  sub_100008DB4((uint64_t)v8);
  v25 = *(_QWORD *)(a1 + 24);
  v26 = v33;
  View.environment<A>(_:_:)(KeyPath, v8, v33, v25);
  swift_release(KeyPath);
  sub_10000A1C4((uint64_t)v8, &qword_100010470);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v26);
  v27 = sub_10000A200(&qword_100010528, &qword_100010518, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
  v38 = v25;
  v39 = v27;
  swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v13);
  v29 = v34;
  v28 = v35;
  v30 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
  v30(v34, v16, v13);
  v31 = *(void (**)(char *, uint64_t))(v28 + 8);
  v31(v16, v13);
  v30(v37, v29, v13);
  return ((uint64_t (*)(char *, uint64_t))v31)(v29, v13);
}

uint64_t sub_1000080D0()
{
  return EnvironmentValues.windowHorizontalSizeClass.getter();
}

uint64_t sub_1000080F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100008128(a1, a2, a3, a4, (uint64_t (*)(char *))&EnvironmentValues.windowHorizontalSizeClass.setter);
}

uint64_t sub_1000080FC()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t sub_10000811C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100008128(a1, a2, a3, a4, (uint64_t (*)(char *))&EnvironmentValues.horizontalSizeClass.setter);
}

uint64_t sub_100008128(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *))
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v7 = sub_100008460(&qword_100010470);
  __chkstk_darwin(v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A240(a1, (uint64_t)v9, &qword_100010470);
  return a5(v9);
}

uint64_t sub_1000081BC()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000081D8()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_1000081E8@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for AppLaunchActions();
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;

  v3 = type metadata accessor for PMPasswordsApp(0);
  v4 = sub_100009604(&qword_100010188, type metadata accessor for PMPasswordsApp, (uint64_t)&unk_10000A9B8);
  static App.main()(v3, v4);
  return 0;
}

uint64_t type metadata accessor for PMPasswordsApp(uint64_t a1)
{
  uint64_t result;

  result = qword_100010288;
  if (!qword_100010288)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PMPasswordsApp);
  return result;
}

uint64_t type metadata accessor for AppLaunchActions()
{
  return objc_opt_self(_TtC9Passwords16AppLaunchActions);
}

_QWORD *sub_1000082CC(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
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
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  char v34;
  uint64_t v35;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v31 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v31 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_100008460(&qword_100010228);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (char *)a1 + v8;
    v11 = (char *)a2 + v8;
    *v10 = *v11;
    v12 = *((_QWORD *)v11 + 1);
    *((_QWORD *)v10 + 1) = v12;
    v13 = (char *)a1 + v9;
    v14 = (char *)a2 + v9;
    *v13 = *v14;
    v15 = *((_QWORD *)v14 + 1);
    *((_QWORD *)v13 + 1) = v15;
    v16 = a3[7];
    v17 = a3[8];
    v18 = *(_QWORD *)((char *)a2 + v16);
    *(_QWORD *)((char *)a1 + v16) = v18;
    v19 = *(_QWORD *)((char *)a2 + v17);
    *(_QWORD *)((char *)a1 + v17) = v19;
    v20 = a3[9];
    v21 = a3[10];
    v22 = *(_QWORD *)((char *)a2 + v20);
    *(_QWORD *)((char *)a1 + v20) = v22;
    v35 = *(_QWORD *)((char *)a2 + v21);
    *(_QWORD *)((char *)a1 + v21) = v35;
    v23 = a3[11];
    v24 = a3[12];
    v25 = (char *)a1 + v23;
    v26 = (char *)a2 + v23;
    *v25 = *v26;
    v27 = *((_QWORD *)v26 + 1);
    *((_QWORD *)v25 + 1) = v27;
    v28 = (char *)a1 + v24;
    v29 = *(_QWORD *)((char *)a2 + v24);
    v33 = *(_QWORD *)((char *)a2 + v24 + 8);
    v34 = *((_BYTE *)a2 + v24 + 16);
    swift_retain(v12);
    swift_retain(v15);
    swift_retain(v18);
    swift_retain(v19);
    swift_retain(v22);
    swift_retain(v35);
    swift_retain(v27);
    sub_1000084A0(v29, v33);
    *(_QWORD *)v28 = v29;
    *((_QWORD *)v28 + 1) = v33;
    v28[16] = v34;
    v30 = a3[13];
    v31 = *(_QWORD *)((char *)a2 + v30);
    *(_QWORD *)((char *)a1 + v30) = v31;
  }
  swift_retain(v31);
  return a1;
}

uint64_t sub_100008460(uint64_t *a1)
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

uint64_t sub_1000084A0(uint64_t a1, uint64_t a2)
{
  return swift_retain(a2);
}

uint64_t sub_1000084A8(uint64_t a1, int *a2)
{
  uint64_t v4;

  v4 = sub_100008460(&qword_100010228);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_release(*(_QWORD *)(a1 + a2[5] + 8));
  swift_release(*(_QWORD *)(a1 + a2[6] + 8));
  swift_release(*(_QWORD *)(a1 + a2[7]));
  swift_release(*(_QWORD *)(a1 + a2[8]));
  swift_release(*(_QWORD *)(a1 + a2[9]));
  swift_release(*(_QWORD *)(a1 + a2[10]));
  swift_release(*(_QWORD *)(a1 + a2[11] + 8));
  sub_100008564(*(_QWORD *)(a1 + a2[12]), *(_QWORD *)(a1 + a2[12] + 8));
  return swift_release(*(_QWORD *)(a1 + a2[13]));
}

uint64_t sub_100008564(uint64_t a1, uint64_t a2)
{
  return swift_release(a2);
}

uint64_t sub_10000856C(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v32;
  char v33;
  uint64_t v34;

  v6 = sub_100008460(&qword_100010228);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = a1 + v7;
  v10 = a2 + v7;
  *(_BYTE *)v9 = *(_BYTE *)v10;
  v11 = *(_QWORD *)(v10 + 8);
  *(_QWORD *)(v9 + 8) = v11;
  v12 = a1 + v8;
  v13 = a2 + v8;
  *(_BYTE *)v12 = *(_BYTE *)v13;
  v14 = *(_QWORD *)(v13 + 8);
  *(_QWORD *)(v12 + 8) = v14;
  v15 = a3[7];
  v16 = a3[8];
  v17 = *(_QWORD *)(a2 + v15);
  *(_QWORD *)(a1 + v15) = v17;
  v18 = *(_QWORD *)(a2 + v16);
  *(_QWORD *)(a1 + v16) = v18;
  v19 = a3[9];
  v20 = a3[10];
  v21 = *(_QWORD *)(a2 + v19);
  *(_QWORD *)(a1 + v19) = v21;
  v34 = *(_QWORD *)(a2 + v20);
  *(_QWORD *)(a1 + v20) = v34;
  v22 = a3[11];
  v23 = a3[12];
  v24 = a1 + v22;
  v25 = a2 + v22;
  *(_BYTE *)v24 = *(_BYTE *)v25;
  v26 = *(_QWORD *)(v25 + 8);
  *(_QWORD *)(v24 + 8) = v26;
  v27 = a1 + v23;
  v28 = *(_QWORD *)(a2 + v23);
  v32 = *(_QWORD *)(a2 + v23 + 8);
  v33 = *(_BYTE *)(a2 + v23 + 16);
  swift_retain(v11);
  swift_retain(v14);
  swift_retain(v17);
  swift_retain(v18);
  swift_retain(v21);
  swift_retain(v34);
  swift_retain(v26);
  sub_1000084A0(v28, v32);
  *(_QWORD *)v27 = v28;
  *(_QWORD *)(v27 + 8) = v32;
  *(_BYTE *)(v27 + 16) = v33;
  v29 = a3[13];
  v30 = *(_QWORD *)(a2 + v29);
  *(_QWORD *)(a1 + v29) = v30;
  swift_retain(v30);
  return a1;
}

uint64_t sub_1000086D8(uint64_t a1, uint64_t a2, int *a3)
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
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v6 = sub_100008460(&qword_100010228);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_BYTE *)v8 = *(_BYTE *)v9;
  v10 = *(_QWORD *)(v8 + 8);
  v11 = *(_QWORD *)(v9 + 8);
  *(_QWORD *)(v8 + 8) = v11;
  swift_retain(v11);
  swift_release(v10);
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_BYTE *)v13 = *(_BYTE *)v14;
  v15 = *(_QWORD *)(v13 + 8);
  v16 = *(_QWORD *)(v14 + 8);
  *(_QWORD *)(v13 + 8) = v16;
  swift_retain(v16);
  swift_release(v15);
  v17 = a3[7];
  v18 = *(_QWORD *)(a2 + v17);
  v19 = *(_QWORD *)(a1 + v17);
  *(_QWORD *)(a1 + v17) = v18;
  swift_retain(v18);
  swift_release(v19);
  v20 = a3[8];
  v21 = *(_QWORD *)(a2 + v20);
  v22 = *(_QWORD *)(a1 + v20);
  *(_QWORD *)(a1 + v20) = v21;
  swift_retain(v21);
  swift_release(v22);
  v23 = a3[9];
  v24 = *(_QWORD *)(a2 + v23);
  v25 = *(_QWORD *)(a1 + v23);
  *(_QWORD *)(a1 + v23) = v24;
  swift_retain(v24);
  swift_release(v25);
  v26 = a3[10];
  v27 = *(_QWORD *)(a2 + v26);
  v28 = *(_QWORD *)(a1 + v26);
  *(_QWORD *)(a1 + v26) = v27;
  swift_retain(v27);
  swift_release(v28);
  v29 = a3[11];
  v30 = a1 + v29;
  v31 = a2 + v29;
  *(_BYTE *)v30 = *(_BYTE *)v31;
  v32 = *(_QWORD *)(v30 + 8);
  v33 = *(_QWORD *)(v31 + 8);
  *(_QWORD *)(v30 + 8) = v33;
  swift_retain(v33);
  swift_release(v32);
  v34 = a3[12];
  v35 = a1 + v34;
  v36 = a2 + v34;
  v37 = *(_QWORD *)v36;
  v38 = *(_QWORD *)(v36 + 8);
  v39 = *(_BYTE *)(v36 + 16);
  sub_1000084A0(*(_QWORD *)v36, v38);
  v40 = *(_QWORD *)v35;
  v41 = *(_QWORD *)(v35 + 8);
  *(_QWORD *)v35 = v37;
  *(_QWORD *)(v35 + 8) = v38;
  *(_BYTE *)(v35 + 16) = v39;
  sub_100008564(v40, v41);
  v42 = a3[13];
  v43 = *(_QWORD *)(a2 + v42);
  v44 = *(_QWORD *)(a1 + v42);
  *(_QWORD *)(a1 + v42) = v43;
  swift_retain(v43);
  swift_release(v44);
  return a1;
}

uint64_t sub_100008884(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_100008460(&qword_100010228);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v9 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v9) = *(_QWORD *)(a2 + v9);
  v10 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  v11 = a1 + v10;
  v12 = a2 + v10;
  *(_OWORD *)v11 = *(_OWORD *)v12;
  *(_BYTE *)(v11 + 16) = *(_BYTE *)(v12 + 16);
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  return a1;
}

uint64_t sub_100008944(uint64_t a1, uint64_t a2, int *a3)
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
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v6 = sub_100008460(&qword_100010228);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_BYTE *)v8 = *(_BYTE *)v9;
  v10 = *(_QWORD *)(v8 + 8);
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
  swift_release(v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_BYTE *)v12 = *(_BYTE *)v13;
  v14 = *(_QWORD *)(v12 + 8);
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v13 + 8);
  swift_release(v14);
  v15 = a3[7];
  v16 = *(_QWORD *)(a1 + v15);
  *(_QWORD *)(a1 + v15) = *(_QWORD *)(a2 + v15);
  swift_release(v16);
  v17 = a3[8];
  v18 = *(_QWORD *)(a1 + v17);
  *(_QWORD *)(a1 + v17) = *(_QWORD *)(a2 + v17);
  swift_release(v18);
  v19 = a3[9];
  v20 = *(_QWORD *)(a1 + v19);
  *(_QWORD *)(a1 + v19) = *(_QWORD *)(a2 + v19);
  swift_release(v20);
  v21 = a3[10];
  v22 = *(_QWORD *)(a1 + v21);
  *(_QWORD *)(a1 + v21) = *(_QWORD *)(a2 + v21);
  swift_release(v22);
  v23 = a3[11];
  v24 = a1 + v23;
  v25 = a2 + v23;
  *(_BYTE *)v24 = *(_BYTE *)v25;
  v26 = *(_QWORD *)(v24 + 8);
  *(_QWORD *)(v24 + 8) = *(_QWORD *)(v25 + 8);
  swift_release(v26);
  v27 = a3[12];
  v28 = a1 + v27;
  v29 = a2 + v27;
  v30 = *(_BYTE *)(v29 + 16);
  v31 = *(_QWORD *)v28;
  v32 = *(_QWORD *)(v28 + 8);
  *(_OWORD *)v28 = *(_OWORD *)v29;
  *(_BYTE *)(v28 + 16) = v30;
  sub_100008564(v31, v32);
  v33 = a3[13];
  v34 = *(_QWORD *)(a1 + v33);
  *(_QWORD *)(a1 + v33) = *(_QWORD *)(a2 + v33);
  swift_release(v34);
  return a1;
}

uint64_t sub_100008A90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100008A9C);
}

uint64_t sub_100008A9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_100008460(&qword_100010228);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 28));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_100008B1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100008B28);
}

uint64_t sub_100008B28(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_100008460(&qword_100010228);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  return result;
}

void sub_100008BA4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[10];

  sub_100008C38(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = &unk_10000A950;
    v4[2] = &unk_10000A950;
    v4[3] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[4] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[5] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[6] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[7] = &unk_10000A950;
    v4[8] = &unk_10000A968;
    v4[9] = (char *)&value witness table for Builtin.NativeObject + 64;
    swift_initStructMetadata(a1, 256, 10, v4, a1 + 16);
  }
}

void sub_100008C38(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100010298)
  {
    v2 = type metadata accessor for PMUIApplicationDelegate(255);
    v3 = type metadata accessor for UIApplicationDelegateAdaptor(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100010298);
  }
}

void *sub_100008C8C()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100008C98(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000AE14, 1);
}

uint64_t sub_100008CA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PMPasswordsApp(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PMPasswordsApp(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_QWORD *sub_100008D34@<X0>(uint64_t (**a1)(uint64_t a1)@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PMPasswordsApp(0) - 8) + 80);
  return sub_100005660(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_100008D70(uint64_t *a1)
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

uint64_t sub_100008DB4@<X0>(uint64_t a1@<X8>)
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
  uint64_t v12;
  os_log_type_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100008460(&qword_100010468);
  __chkstk_darwin(v8);
  v10 = (uint64_t *)((char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000A240(v2, (uint64_t)v10, &qword_100010468);
  if (swift_getEnumCaseMultiPayload(v10, v8) == 1)
    return sub_10000A284((uint64_t)v10, a1, &qword_100010470);
  v12 = *v10;
  v13 = static os_log_type_t.fault.getter();
  v14 = static Log.runtimeIssuesLog.getter();
  if (os_log_type_enabled(v14, v13))
  {
    v15 = swift_slowAlloc(12, -1);
    v16 = swift_slowAlloc(32, -1);
    v18 = v16;
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v15 + 4) = sub_100008FB8((char *)0xD000000000000020, (char *)0x800000010000ACD0, &v18);
    _os_log_impl((void *)&_mh_execute_header, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v15, -1, -1);
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath(v7, v12);
  swift_release(v12);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

char *sub_100008FB8(char *a1, char *a2, uint64_t *a3)
{
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v12[3];
  void *ObjectType;

  v6 = sub_100009088(v12, 0, 0, 1, (uint64_t)a1, (unint64_t)a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000A2E8((uint64_t)v12, *a3);
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
      sub_10000A2E8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000A2C8(v12);
  return v7;
}

char *sub_100009088(char **a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  char *result;
  uint64_t v10;
  char *v11;
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
          *a1 = (char *)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_100009184(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (char *)((a6 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    result = (char *)_StringObject.sharedUTF8.getter(a5, a6);
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
    return (char *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

char *sub_100009184(uint64_t a1, unint64_t a2)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (char *)sub_100009218(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100009314(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v4 = *((_QWORD *)v2 + 2);
  v3 = *((_QWORD *)v2 + 3);
  if (v4 >= v3 >> 1)
    v2 = sub_100009314((char *)(v3 > 1), v4 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

_QWORD *sub_100009218(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *result;
  char v7;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_1000092B0(v4, 0);
      result = (_QWORD *)_StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v7 & 1) != 0)
        break;
      if (result == (_QWORD *)v4)
        return v5;
      __break(1u);
LABEL_9:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_1000092B0(uint64_t a1, uint64_t a2)
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
  v4 = sub_100008460(&qword_100010530);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_100009314(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_100008460(&qword_100010530);
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
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

Swift::Int sub_1000093FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Int result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[9];

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_100008460(&qword_100010460);
    v3 = static _SetStorage.allocate(capacity:)(v1);
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      Hasher.init(_seed:)(v26, *(_QWORD *)(v3 + 40));
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(v26, v8, v7);
      result = Hasher._finalize()();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease(v7);
          goto LABEL_4;
        }
        v18 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v18;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v19 = (_QWORD *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v21 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v21 = v8;
      v21[1] = v7;
      v22 = *(_QWORD *)(v3 + 16);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t sub_10000959C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100005860(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_1000095A4()
{
  uint64_t v0;

  return sub_100007A80(v0, &enum case for PMAppDetailsWindowView.Detail.wifi(_:));
}

uint64_t sub_1000095C4()
{
  uint64_t v0;

  return sub_100007A80(v0, &enum case for PMAppDetailsWindowView.Detail.account(_:));
}

uint64_t sub_1000095E4@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_100005BA4(*(char **)(v1 + 16), a1);
}

uint64_t sub_1000095F0()
{
  return sub_100009674(sub_100006830);
}

uint64_t sub_1000095FC()
{
  uint64_t v0;

  return sub_100006B3C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100009604(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100009644(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_100009654(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_100009668()
{
  return sub_100009674(sub_100006C40);
}

uint64_t sub_100009674(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PMPasswordsApp(0) - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_1000096B4()
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

  v1 = (int *)type metadata accessor for PMPasswordsApp(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  v7 = v0 + v4;
  v8 = sub_100008460(&qword_100010228);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_release(*(_QWORD *)(v7 + v1[5] + 8));
  swift_release(*(_QWORD *)(v7 + v1[6] + 8));
  swift_release(*(_QWORD *)(v7 + v1[7]));
  swift_release(*(_QWORD *)(v7 + v1[8]));
  swift_release(*(_QWORD *)(v7 + v1[9]));
  swift_release(*(_QWORD *)(v7 + v1[10]));
  swift_release(*(_QWORD *)(v7 + v1[11] + 8));
  sub_100008564(*(_QWORD *)(v7 + v1[12]), *(_QWORD *)(v7 + v1[12] + 8));
  swift_release(*(_QWORD *)(v7 + v1[13]));
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000097B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PMPasswordsApp(0) - 8) + 80);
  return sub_1000057BC(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_100009800(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

void sub_100009808(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = (char *)&value witness table for () + 64;
  sub_10000A10C(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    v4[2] = &unk_10000AA48;
    swift_initStructMetadata(a1, 0, 3, v4, a1 + 32);
  }
}

_QWORD *sub_100009888(_QWORD *a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *a1 = v5;
    v3 = (_QWORD *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
  }
  else
  {
    v8 = a2[1];
    *v3 = v5;
    v3[1] = v8;
    v9 = *(int *)(a3 + 36);
    v10 = (_QWORD *)((char *)v3 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    swift_retain(v8);
    v12 = sub_100008460(&qword_100010468);
    if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
    {
      v13 = type metadata accessor for UserInterfaceSizeClass(0);
      v14 = *(_QWORD *)(v13 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v14 + 48))(v11, 1, v13))
      {
        v15 = sub_100008460(&qword_100010470);
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
        v16 = 1;
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v14 + 16))(v10, v11, v13);
        v16 = 1;
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v10, 0, 1, v13);
      }
    }
    else
    {
      v17 = *v11;
      *v10 = *v11;
      swift_retain(v17);
      v16 = 0;
    }
    swift_storeEnumTagMultiPayload(v10, v12, v16);
    v18 = *(int *)(a3 + 40);
    v19 = (_QWORD *)((char *)v3 + v18);
    v20 = (uint64_t *)((char *)a2 + v18);
    v21 = *v20;
    v5 = v20[1];
    *v19 = *v20;
    v19[1] = v5;
    swift_retain(v21);
  }
  swift_retain(v5);
  return v3;
}

uint64_t sub_1000099F0(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  swift_release(*(_QWORD *)(a1 + 8));
  v4 = (_QWORD *)(a1 + *(int *)(a2 + 36));
  v5 = sub_100008460(&qword_100010468);
  if (swift_getEnumCaseMultiPayload(v4, v5) == 1)
  {
    v6 = type metadata accessor for UserInterfaceSizeClass(0);
    v7 = *(_QWORD *)(v6 - 8);
    if (!(*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6))
      (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v4, v6);
  }
  else
  {
    swift_release(*v4);
  }
  v8 = (_QWORD *)(a1 + *(int *)(a2 + 40));
  swift_release(*v8);
  return swift_release(v8[1]);
}

_QWORD *sub_100009AA8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 36);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  swift_retain(v6);
  v10 = sub_100008460(&qword_100010468);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for UserInterfaceSizeClass(0);
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11))
    {
      v13 = sub_100008460(&qword_100010470);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
      v14 = 1;
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v12 + 16))(v8, v9, v11);
      v14 = 1;
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v8, 0, 1, v11);
    }
  }
  else
  {
    v15 = *v9;
    *v8 = *v9;
    swift_retain(v15);
    v14 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v10, v14);
  v16 = *(int *)(a3 + 40);
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  v19 = *v18;
  v20 = v18[1];
  *v17 = *v18;
  v17[1] = v20;
  swift_retain(v19);
  swift_retain(v20);
  return a1;
}

_QWORD *sub_100009BE8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a2[1];
  v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 36);
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    sub_10000A1C4((uint64_t)a1 + v8, &qword_100010468);
    v11 = sub_100008460(&qword_100010468);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for UserInterfaceSizeClass(0);
      v13 = *(_QWORD *)(v12 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
      {
        v14 = sub_100008460(&qword_100010470);
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
        v15 = 1;
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v13 + 16))(v9, v10, v12);
        v15 = 1;
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
      }
    }
    else
    {
      v16 = *v10;
      *v9 = *v10;
      swift_retain(v16);
      v15 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v11, v15);
  }
  v17 = *(int *)(a3 + 40);
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  v20 = *(_QWORD *)((char *)a2 + v17);
  v21 = *(_QWORD *)((char *)a1 + v17);
  *(_QWORD *)((char *)a1 + v17) = v20;
  swift_retain(v20);
  swift_release(v21);
  v22 = *((_QWORD *)v18 + 1);
  v23 = *((_QWORD *)v19 + 1);
  *((_QWORD *)v18 + 1) = v23;
  swift_retain(v23);
  swift_release(v22);
  return a1;
}

_OWORD *sub_100009D68(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *a1 = *a2;
  v6 = *(int *)(a3 + 36);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_100008460(&qword_100010468);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    v10 = type metadata accessor for UserInterfaceSizeClass(0);
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10))
    {
      v12 = sub_100008460(&qword_100010470);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v7, v8, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    }
    swift_storeEnumTagMultiPayload(v7, v9, 1);
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 40)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 40));
  return a1;
}

uint64_t sub_100009E8C(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *a2;
  swift_release(v6);
  if ((_OWORD *)a1 != a2)
  {
    v7 = *(int *)(a3 + 36);
    v8 = (void *)(a1 + v7);
    v9 = (char *)a2 + v7;
    sub_10000A1C4(a1 + v7, &qword_100010468);
    v10 = sub_100008460(&qword_100010468);
    if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
    {
      v11 = type metadata accessor for UserInterfaceSizeClass(0);
      v12 = *(_QWORD *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11))
      {
        v13 = sub_100008460(&qword_100010470);
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, char *, uint64_t))(v12 + 32))(v8, v9, v11);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v8, 0, 1, v11);
      }
      swift_storeEnumTagMultiPayload(v8, v10, 1);
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  v14 = *(int *)(a3 + 40);
  v15 = a1 + v14;
  v16 = (_QWORD *)((char *)a2 + v14);
  v17 = *(_QWORD *)(a1 + v14);
  *(_QWORD *)(a1 + v14) = *v16;
  swift_release(v17);
  v18 = *(_QWORD *)(v15 + 8);
  *(_QWORD *)(v15 + 8) = v16[1];
  swift_release(v18);
  return a1;
}

uint64_t sub_100009FF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009FFC);
}

uint64_t sub_100009FFC(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_100008460(qword_100010478);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 36)], a2, v8);
  }
}

uint64_t sub_10000A07C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000A088);
}

char *sub_10000A088(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_100008460(qword_100010478);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 36)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PMCoordinatorStoreView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000A328(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PMCoordinatorStoreView);
}

void sub_10000A10C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100010500)
  {
    v2 = sub_100008D70(&qword_100010470);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100010500);
  }
}

uint64_t sub_10000A164()
{
  return sub_10000A200(&qword_100010508, &qword_100010510, (uint64_t)&protocol conformance descriptor for _TupleScene<A>);
}

uint64_t sub_10000A190(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 16);
  return swift_getOpaqueTypeConformance2(&v3, &unk_10000AE3C, 1);
}

uint64_t sub_10000A1C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100008460(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000A200(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100008D70(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000A240(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100008460(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000A284(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100008460(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000A2C8(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000A2E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000A328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t sub_10000A354(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *a1;
  v2 = sub_100008D70(&qword_100010518);
  v3 = type metadata accessor for ModifiedContent(255, v1, v2);
  sub_10000A200(&qword_100010528, &qword_100010518, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
  return swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v3);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC9PasswordsP33_EA265A8E5D3E9F2EDD0AA576693033B619ResourceBundleClass);
}
