void sub_10000556C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void sub_100005F58(uint64_t a1)
{
  sub_100005F90(a1, 0x80000001000112C0, &qword_100020DD8);
}

void sub_100005F74(uint64_t a1)
{
  sub_100005F90(a1, 0x80000001000112A0, &qword_100020DE8);
}

void sub_100005F90(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  id v5;
  NSString v6;
  NSString v7;
  id v8;

  v4 = type metadata accessor for Tag();
  v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v4));
  v6 = String._bridgeToObjectiveC()();
  v7 = String._bridgeToObjectiveC()();
  v8 = objc_msgSend(v5, "initWithIdentifier:displayString:", v6, v7);

  *a3 = v8;
}

uint64_t variable initialization expression of TagIntentResponse.code()
{
  return 0;
}

void sub_10000602C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_100006038(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_10000604C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t _s16NewsTodayIntents9TagIntentC14equalInContent3lhs3rhsSbAC_ACtFZ_0(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  char v13;

  v3 = objc_msgSend(a1, "tag");
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "identifier");

    if (v5)
    {
      v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
      v4 = v7;

    }
    else
    {
      v6 = 0;
      v4 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  v8 = objc_msgSend(a2, "tag");
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "identifier");

    if (v10)
    {
      v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
      v9 = v12;

      if (!v4)
        goto LABEL_16;
LABEL_11:
      if (v9)
      {
        if (v6 == v11 && v4 == v9)
        {
          swift_bridgeObjectRelease(v4);
          v13 = 1;
        }
        else
        {
          v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v4, v11, v9, 0);
          swift_bridgeObjectRelease(v4);
        }
      }
      else
      {
        v13 = 0;
        v9 = v4;
      }
      goto LABEL_20;
    }
    v11 = 0;
    v9 = 0;
    if (v4)
      goto LABEL_11;
  }
  else
  {
    v11 = 0;
    if (v4)
      goto LABEL_11;
  }
LABEL_16:
  if (!v9)
  {
    v13 = 1;
    return v13 & 1;
  }
  v13 = 0;
LABEL_20:
  swift_bridgeObjectRelease(v9);
  return v13 & 1;
}

void type metadata accessor for FCTagType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_100021210)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100018BA0);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100021210);
  }
}

uint64_t sub_100006228()
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
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  void (*v40)(char *, uint64_t);
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
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
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
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
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
  uint64_t v113;
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
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v172;
  uint64_t v173;

  v1 = v0;
  v2 = type metadata accessor for Scope(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v172 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = ProxyContainer.public.getter(v4);
  v8 = sub_10000890C(&qword_100021520);
  v9 = RegistrationContainer.register<A>(_:name:factory:)(v8, 0, 0, sub_100007084, 0, v8);
  swift_release(v9);
  v10 = swift_release(v7);
  v11 = ProxyContainer.private.getter(v10);
  v12 = sub_10000895C(0, &qword_100021528, FCContextConfiguration_ptr);
  v13 = RegistrationContainer.register<A>(_:name:factory:)(v12, 0, 0, sub_1000070A0, 0, v12);
  swift_release(v13);
  v14 = swift_release(v11);
  v15 = ProxyContainer.private.getter(v14);
  v16 = sub_10000890C(&qword_100021530);
  v17 = RegistrationContainer.register<A>(_:name:factory:)(v16, 0, 0, sub_1000070B4, 0, v16);
  swift_release(v17);
  v18 = swift_release(v15);
  v19 = ProxyContainer.private.getter(v18);
  v20 = sub_10000890C(&qword_100021538);
  v21 = RegistrationContainer.register<A>(_:name:factory:)(v20, 0, 0, sub_1000070C8, 0, v20);
  swift_release(v21);
  v22 = swift_release(v19);
  v23 = ProxyContainer.private.getter(v22);
  v173 = sub_10000895C(0, &qword_100021540, FCUserInfo_ptr);
  v24 = RegistrationContainer.register<A>(_:name:factory:)(v173, 0, 0, sub_1000072A8, 0, v173);
  swift_release(v24);
  v25 = swift_release(v23);
  v26 = ProxyContainer.private.getter(v25);
  v27 = sub_10000890C(&qword_100021548);
  v28 = RegistrationContainer.register<A>(_:name:factory:)(v27, 0, 0, sub_1000072B4, 0, v27);
  swift_release(v28);
  v29 = swift_release(v26);
  v30 = ProxyContainer.private.getter(v29);
  v31 = sub_10000895C(0, &qword_100021550, FCNetworkBehaviorMonitor_ptr);
  v32 = RegistrationContainer.register<A>(_:name:factory:)(v31, 0, 0, sub_1000072B8, 0, v31);
  swift_release(v32);
  v33 = swift_release(v30);
  v34 = ProxyContainer.public.getter(v33);
  v35 = sub_10000890C(&qword_100021558);
  v36 = RegistrationContainer.register<A>(_:name:factory:)(v35, 0, 0, sub_1000072DC, 0, v35);
  swift_release(v34);
  v37 = enum case for Scope.singleton(_:);
  v38 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v38(v6, enum case for Scope.singleton(_:), v2);
  v39 = Definition.inScope(_:)(v6);
  swift_release(v36);
  v40 = *(void (**)(char *, uint64_t))(v3 + 8);
  v40(v6, v2);
  v41 = Definition.thenConfigure(_:)(sub_100008C18, 0);
  swift_release(v41);
  v42 = swift_release(v39);
  v43 = ProxyContainer.public.getter(v42);
  v44 = sub_10000895C(0, &qword_100021560, FCTagController_ptr);
  v45 = RegistrationContainer.register<A>(_:name:factory:)(v44, 0, 0, sub_10000755C, 0, v44);
  swift_release(v45);
  v46 = swift_release(v43);
  v47 = ProxyContainer.public.getter(v46);
  v48 = sub_10000890C(&qword_100021568);
  v49 = RegistrationContainer.register<A>(_:name:factory:)(v48, 0, 0, sub_100007568, 0, v48);
  swift_release(v47);
  v38(v6, v37, v2);
  v50 = Definition.inScope(_:)(v6);
  swift_release(v50);
  swift_release(v49);
  v51 = ((uint64_t (*)(char *, uint64_t))v40)(v6, v2);
  v52 = ProxyContainer.public.getter(v51);
  v53 = sub_10000890C(&qword_100021570);
  v54 = RegistrationContainer.register<A>(_:name:factory:)(v53, 0, 0, sub_1000075BC, 0, v53);
  swift_release(v54);
  v55 = swift_release(v52);
  v56 = ProxyContainer.private.getter(v55);
  v57 = type metadata accessor for FeatureAvailability(0);
  v58 = RegistrationContainer.register<A>(_:name:factory:)(v57, 0, 0, sub_10000760C, 0, v57);
  swift_release(v56);
  v38(v6, v37, v2);
  v59 = Definition.inScope(_:)(v6);
  swift_release(v59);
  swift_release(v58);
  v60 = ((uint64_t (*)(char *, uint64_t))v40)(v6, v2);
  v61 = ProxyContainer.public.getter(v60);
  v62 = sub_10000890C(&qword_100021578);
  v63 = RegistrationContainer.register<A>(_:name:factory:)(v62, 0, 0, sub_1000076A0, 0, v62);
  swift_release(v63);
  v64 = swift_release(v61);
  v65 = ProxyContainer.public.getter(v64);
  v66 = sub_10000890C(&qword_100021580);
  v67 = RegistrationContainer.register<A>(_:name:factory:)(v66, 0, 0, sub_100007798, 0, v66);
  swift_release(v67);
  v68 = swift_release(v65);
  v69 = ProxyContainer.public.getter(v68);
  v70 = sub_10000895C(0, &qword_100021588, FCConfigurationManager_ptr);
  swift_retain(v1);
  v71 = RegistrationContainer.register<A>(_:name:factory:)(v70, 0, 0, sub_10000894C, v1, v70);
  swift_release(v69);
  swift_release(v1);
  v38(v6, v37, v2);
  v72 = Definition.inScope(_:)(v6);
  swift_release(v72);
  swift_release(v71);
  v73 = ((uint64_t (*)(char *, uint64_t))v40)(v6, v2);
  v74 = ProxyContainer.public.getter(v73);
  v75 = sub_10000895C(0, &qword_100021590, FCCloudContext_ptr);
  swift_retain(v1);
  v76 = RegistrationContainer.register<A>(_:name:factory:)(v75, 0, 0, sub_100008954, v1, v75);
  swift_release(v74);
  swift_release(v1);
  v38(v6, v37, v2);
  v77 = Definition.inScope(_:)(v6);
  swift_release(v76);
  v40(v6, v2);
  v78 = Definition.thenConfigure(_:)(sub_10000807C, 0);
  swift_release(v78);
  v79 = swift_release(v77);
  v80 = ProxyContainer.public.getter(v79);
  v81 = sub_10000890C(&qword_100021598);
  v82 = RegistrationContainer.register<A>(_:name:factory:)(v81, 0, 0, sub_100008090, 0, v81);
  swift_release(v80);
  v38(v6, v37, v2);
  v83 = Definition.inScope(_:)(v6);
  swift_release(v83);
  swift_release(v82);
  v84 = ((uint64_t (*)(char *, uint64_t))v40)(v6, v2);
  v85 = ProxyContainer.public.getter(v84);
  v86 = sub_10000895C(0, &qword_1000215A0, FCAssetManager_ptr);
  v87 = RegistrationContainer.register<A>(_:name:factory:)(v86, 0, 0, sub_100008118, 0, v86);
  swift_release(v85);
  v38(v6, v37, v2);
  v88 = Definition.inScope(_:)(v6);
  swift_release(v88);
  swift_release(v87);
  v89 = ((uint64_t (*)(char *, uint64_t))v40)(v6, v2);
  v90 = ProxyContainer.public.getter(v89);
  v91 = sub_10000890C(&qword_1000215A8);
  v92 = RegistrationContainer.register<A>(_:name:factory:)(v91, 0, 0, sub_1000081A8, 0, v91);
  swift_release(v90);
  v38(v6, v37, v2);
  v93 = Definition.inScope(_:)(v6);
  swift_release(v93);
  swift_release(v92);
  v94 = ((uint64_t (*)(char *, uint64_t))v40)(v6, v2);
  v95 = ProxyContainer.public.getter(v94);
  v96 = sub_10000890C(&qword_1000215B0);
  v97 = RegistrationContainer.register<A>(_:name:factory:)(v96, 0, 0, sub_1000081B4, 0, v96);
  swift_release(v95);
  v38(v6, v37, v2);
  v98 = Definition.inScope(_:)(v6);
  swift_release(v98);
  swift_release(v97);
  v99 = ((uint64_t (*)(char *, uint64_t))v40)(v6, v2);
  v100 = ProxyContainer.public.getter(v99);
  v101 = sub_10000895C(0, &qword_1000215B8, FCSubscriptionController_ptr);
  v102 = RegistrationContainer.register<A>(_:name:factory:)(v101, 0, 0, sub_10000824C, 0, v101);
  swift_release(v100);
  v38(v6, v37, v2);
  v103 = Definition.inScope(_:)(v6);
  swift_release(v103);
  swift_release(v102);
  v104 = ((uint64_t (*)(char *, uint64_t))v40)(v6, v2);
  v105 = ProxyContainer.public.getter(v104);
  v106 = sub_10000890C(&qword_1000215C0);
  v107 = RegistrationContainer.register<A>(_:name:factory:)(v106, 0, 0, sub_100008258, 0, v106);
  swift_release(v105);
  v38(v6, v37, v2);
  v108 = Definition.inScope(_:)(v6);
  swift_release(v108);
  swift_release(v107);
  v109 = ((uint64_t (*)(char *, uint64_t))v40)(v6, v2);
  v110 = ProxyContainer.public.getter(v109);
  v111 = sub_10000895C(0, &qword_1000215C8, FCPuzzleTypeController_ptr);
  v112 = RegistrationContainer.register<A>(_:name:factory:)(v111, 0, 0, sub_100008264, 0, v111);
  swift_release(v110);
  v38(v6, v37, v2);
  v113 = Definition.inScope(_:)(v6);
  swift_release(v113);
  swift_release(v112);
  v114 = ((uint64_t (*)(char *, uint64_t))v40)(v6, v2);
  v115 = ProxyContainer.public.getter(v114);
  v116 = sub_10000890C(&qword_1000215D0);
  v117 = RegistrationContainer.register<A>(_:name:factory:)(v116, 0, 0, sub_100008270, 0, v116);
  swift_release(v115);
  v38(v6, v37, v2);
  v118 = Definition.inScope(_:)(v6);
  swift_release(v118);
  swift_release(v117);
  v119 = ((uint64_t (*)(char *, uint64_t))v40)(v6, v2);
  v120 = ProxyContainer.public.getter(v119);
  v121 = sub_10000895C(0, &qword_1000215D8, FCPurchaseController_ptr);
  v122 = RegistrationContainer.register<A>(_:name:factory:)(v121, 0, 0, sub_10000827C, 0, v121);
  swift_release(v120);
  v38(v6, v37, v2);
  v123 = Definition.inScope(_:)(v6);
  swift_release(v123);
  swift_release(v122);
  v124 = ((uint64_t (*)(char *, uint64_t))v40)(v6, v2);
  v125 = ProxyContainer.public.getter(v124);
  v126 = sub_10000895C(0, &qword_1000215E0, FCEntitlementService_ptr);
  v127 = RegistrationContainer.register<A>(_:name:factory:)(v126, 0, 0, sub_100008288, 0, v126);
  swift_release(v125);
  v38(v6, v37, v2);
  v128 = Definition.inScope(_:)(v6);
  swift_release(v128);
  swift_release(v127);
  v129 = ((uint64_t (*)(char *, uint64_t))v40)(v6, v2);
  v130 = ProxyContainer.public.getter(v129);
  v131 = sub_10000890C(&qword_1000215E8);
  v132 = RegistrationContainer.register<A>(_:name:factory:)(v131, 0, 0, sub_100008294, 0, v131);
  swift_release(v130);
  v38(v6, v37, v2);
  v133 = Definition.inScope(_:)(v6);
  swift_release(v133);
  swift_release(v132);
  v134 = ((uint64_t (*)(char *, uint64_t))v40)(v6, v2);
  v135 = ProxyContainer.public.getter(v134);
  v136 = RegistrationContainer.register<A>(_:name:factory:)(v173, 0, 0, sub_1000072A8, 0, v173);
  swift_release(v136);
  v137 = swift_release(v135);
  v138 = ProxyContainer.public.getter(v137);
  v139 = RegistrationContainer.register<A>(_:name:factory:)(v27, 0, 0, sub_1000072B4, 0, v27);
  swift_release(v139);
  v140 = swift_release(v138);
  v141 = ProxyContainer.public.getter(v140);
  v142 = sub_10000890C(&qword_1000215F0);
  v143 = RegistrationContainer.register<A>(_:name:factory:)(v142, 0, 0, sub_100008348, 0, v142);
  swift_release(v141);
  v38(v6, v37, v2);
  v144 = Definition.inScope(_:)(v6);
  swift_release(v144);
  swift_release(v143);
  v145 = ((uint64_t (*)(char *, uint64_t))v40)(v6, v2);
  v146 = ProxyContainer.public.getter(v145);
  v147 = sub_10000890C(&qword_1000215F8);
  v148 = RegistrationContainer.register<A>(_:name:factory:)(v147, 0, 0, sub_10000836C, 0, v147);
  swift_release(v146);
  v38(v6, v37, v2);
  v149 = Definition.inScope(_:)(v6);
  swift_release(v149);
  swift_release(v148);
  v150 = ((uint64_t (*)(char *, uint64_t))v40)(v6, v2);
  v151 = ProxyContainer.public.getter(v150);
  v152 = sub_10000890C(&qword_100021600);
  v153 = RegistrationContainer.register<A>(_:name:factory:)(v152, 0, 0, sub_100008434, 0, v152);
  swift_release(v153);
  v154 = swift_release(v151);
  v155 = ProxyContainer.public.getter(v154);
  v156 = sub_10000890C(&qword_100021608);
  v157 = RegistrationContainer.register<A>(_:name:factory:)(v156, 0, 0, sub_100008450, 0, v156);
  swift_release(v157);
  v158 = swift_release(v155);
  v159 = ProxyContainer.public.getter(v158);
  v160 = sub_10000890C(&qword_100021610);
  v161 = RegistrationContainer.register<A>(_:name:factory:)(v160, 0, 0, sub_100008514, 0, v160);
  swift_release(v161);
  v162 = swift_release(v159);
  v163 = ProxyContainer.public.getter(v162);
  v164 = sub_10000890C(&qword_100021618);
  v165 = RegistrationContainer.register<A>(_:name:factory:)(v164, 0, 0, sub_1000085FC, 0, v164);
  swift_release(v163);
  v38(v6, v37, v2);
  v166 = Definition.inScope(_:)(v6);
  swift_release(v166);
  swift_release(v165);
  v167 = ((uint64_t (*)(char *, uint64_t))v40)(v6, v2);
  v168 = ProxyContainer.private.getter(v167);
  v169 = sub_10000895C(0, &qword_100021620, FCPrivateDataSyncAvailability_ptr);
  v170 = RegistrationContainer.register<A>(_:name:factory:)(v169, 0, 0, sub_10000869C, 0, v169);
  swift_release(v170);
  return swift_release(v168);
}

uint64_t sub_100007084@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10000846C(a1, (uint64_t (*)(_QWORD))&type metadata accessor for PaidBundleConfigManager, (uint64_t (*)(uint64_t))&PaidBundleConfigManager.init(configurationManager:), (uint64_t)&protocol witness table for PaidBundleConfigManager, a2);
}

id sub_1000070A0(uint64_t a1)
{
  return sub_1000086B0(a1, FCContextConfiguration_ptr, (SEL *)&selRef_defaultConfiguration);
}

id sub_1000070B4(uint64_t a1)
{
  return sub_1000086B0(a1, FCFeldsparIDProvider_ptr, (SEL *)&selRef_sharedInstance);
}

uint64_t sub_1000070C8(_QWORD *a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSURL *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;

  sub_10000890C(&qword_100021628);
  __chkstk_darwin();
  v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = a1[3];
  v5 = a1[4];
  sub_100008994(a1, v4);
  v6 = sub_10000895C(0, &qword_100021528, FCContextConfiguration_ptr);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v6, v6, v4, v5);
  if (!result)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v8 = (void *)result;
  v9 = (id)FCURLForContainerizedUserAccountCachesDirectory(1);
  if (v9)
  {
    v10 = v9;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v11 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v3, 0, 1, v11);
  }
  else
  {
    v12 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v3, 1, 1, v12);
  }
  v13 = a1[3];
  v14 = a1[4];
  sub_100008994(a1, v13);
  v15 = sub_10000890C(&qword_100021530);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v15, v15, v13, v14);
  if (!result)
    goto LABEL_11;
  v16 = result;
  v17 = type metadata accessor for URL(0);
  v18 = *(_QWORD *)(v17 - 8);
  v20 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v3, 1, v17) != 1)
  {
    URL._bridgeToObjectiveC()(v19);
    v20 = v21;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v3, v17);
  }
  v22 = objc_msgSend(objc_allocWithZone((Class)FCConfigurationManager), "initWithContextConfiguration:contentHostDirectoryFileURL:feldsparIDProvider:", v8, v20, v16);

  result = swift_unknownObjectRelease(v16);
  if (v22)
    return (uint64_t)v22;
LABEL_12:
  __break(1u);
  return result;
}

id sub_1000072A8(_QWORD *a1)
{
  return sub_100008124(a1, (SEL *)&selRef_userInfo);
}

id sub_1000072B8()
{
  return objc_msgSend(objc_allocWithZone((Class)FCNetworkBehaviorMonitor), "initForLoggingOnly");
}

uint64_t sub_1000072DC(_QWORD *a1)
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
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSURL *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000890C(&qword_100021628);
  __chkstk_darwin();
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  sub_100008994(a1, v8);
  v10 = sub_10000895C(0, &qword_100021528, FCContextConfiguration_ptr);
  v11 = dispatch thunk of ResolverType.resolve<A>(_:)(v10, v10, v8, v9);
  if (!v11)
  {
    __break(1u);
    goto LABEL_8;
  }
  v12 = (void *)v11;
  v13 = a1[3];
  v14 = a1[4];
  sub_100008994(a1, v13);
  v15 = sub_10000890C(&qword_100021538);
  v16 = dispatch thunk of ResolverType.resolve<A>(_:)(v15, v15, v13, v14);
  if (!v16)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v17 = v16;
  v18 = (id)FCURLForContainerizedUserAccountCachesDirectory(1);
  if (!v18)
  {
LABEL_9:
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v7, 1, 1, v2);
    goto LABEL_10;
  }
  v19 = v18;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v7, v5, v2);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v7, 0, 1, v2);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v7, 1, v2);
  if ((_DWORD)result == 1)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v21 = a1[3];
  v22 = a1[4];
  sub_100008994(a1, v21);
  v23 = sub_10000895C(0, &qword_100021550, FCNetworkBehaviorMonitor_ptr);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v23, v23, v21, v22);
  if (result)
  {
    v24 = (void *)result;
    v25 = objc_allocWithZone((Class)FCContentContext);
    URL._bridgeToObjectiveC()(v26);
    v28 = v27;
    v29 = objc_msgSend(v25, "initWithConfiguration:configurationManager:contentHostDirectory:networkBehaviorMonitor:desiredHeadlineFieldOptions:feedUsage:appActivityMonitor:backgroundTaskable:pptContext:", v12, v17, v27, v24, 0, 1, 0, 0, 0);

    swift_unknownObjectRelease(v17);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
    return (uint64_t)v29;
  }
LABEL_11:
  __break(1u);
  return result;
}

id sub_10000755C(_QWORD *a1)
{
  return sub_10000809C(a1, (SEL *)&selRef_tagController);
}

uint64_t sub_100007568@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = type metadata accessor for FeatureAvailability(0);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  result = FeatureAvailability.init()();
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for FeatureAvailability;
  *a1 = result;
  return result;
}

uint64_t sub_1000075BC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v1 = a1[3];
  v2 = a1[4];
  sub_100008994(a1, v1);
  v3 = type metadata accessor for FeatureAvailability(0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v3, v3, v1, v2);
  if (!result)
    __break(1u);
  return result;
}

uint64_t sub_10000760C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1[3];
  v2 = a1[4];
  sub_100008994(a1, v1);
  v3 = sub_10000890C(&qword_100021598);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v3, v3, v1, v2);
  if (result)
  {
    v5 = result;
    v6 = objc_allocWithZone((Class)type metadata accessor for FeatureAvailabilityProvider(0));
    v7 = FeatureAvailabilityProvider.init(appConfigurationManager:)(v5);
    v8 = type metadata accessor for FeatureAvailability(0);
    swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
    return FeatureAvailability.init(featureAvailabilityProvider:)(v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000076A0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a1[3];
  v5 = a1[4];
  sub_100008994(a1, v4);
  v6 = sub_10000895C(0, &qword_100021560, FCTagController_ptr);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v6, v6, v4, v5);
  if (result)
  {
    v8 = result;
    v9 = a1[3];
    v10 = a1[4];
    sub_100008994(a1, v9);
    v11 = sub_10000895C(0, &qword_1000215B8, FCSubscriptionController_ptr);
    result = dispatch thunk of ResolverType.resolve<A>(_:)(v11, v11, v9, v10);
    if (result)
    {
      v12 = result;
      v13 = type metadata accessor for TagService(0);
      swift_allocObject(v13, *(unsigned int *)(v13 + 48), *(unsigned __int16 *)(v13 + 52));
      result = TagService.init(tagController:subscriptionController:)(v8, v12);
      a2[3] = v13;
      a2[4] = (uint64_t)&protocol witness table for TagService;
      *a2 = result;
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

_QWORD *sub_100007798@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[3];
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[5];

  type metadata accessor for FeedPlatform(0);
  __chkstk_darwin();
  v5 = (char *)&v37[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1[3];
  v7 = a1[4];
  sub_100008994(a1, v6);
  v8 = sub_10000890C(&qword_100021520);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v43, v8, v8, v6, v7);
  if (!v43[3])
  {
    __break(1u);
    goto LABEL_9;
  }
  v10 = a1[3];
  v11 = a1[4];
  sub_100008994(a1, v10);
  v12 = sub_10000890C(&qword_1000215C0);
  result = (_QWORD *)dispatch thunk of ResolverType.resolve<A>(_:)(v12, v12, v10, v11);
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v13 = result;
  v14 = a1[3];
  v15 = a1[4];
  sub_100008994(a1, v14);
  v16 = sub_10000890C(&qword_1000215D0);
  result = (_QWORD *)dispatch thunk of ResolverType.resolve<A>(_:)(v16, v16, v14, v15);
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v17 = result;
  v18 = a1[3];
  v19 = a1[4];
  sub_100008994(a1, v18);
  v20 = sub_10000890C(&qword_100021568);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v40, v20, v20, v18, v19);
  v21 = v41;
  if (!v41)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v22 = v42;
  v23 = sub_100008994(v40, v41);
  v39[3] = v21;
  v39[4] = v22;
  v24 = sub_100008BA4(v39);
  (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v24, v23, v21);
  v25 = a1[3];
  v26 = a1[4];
  sub_100008994(a1, v25);
  v27 = sub_10000890C(&qword_100021598);
  result = (_QWORD *)dispatch thunk of ResolverType.resolve<A>(_:)(v27, v27, v25, v26);
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v28 = result;
  v29 = type metadata accessor for FeedAppConfigManager(0);
  swift_allocObject(v29, *(unsigned int *)(v29 + 48), *(unsigned __int16 *)(v29 + 52));
  v30 = FeedAppConfigManager.init(appConfigManager:)(v28);
  v38[3] = v29;
  v38[4] = &protocol witness table for FeedAppConfigManager;
  v38[0] = v30;
  v31 = a1[3];
  v32 = a1[4];
  sub_100008994(a1, v31);
  v33 = sub_10000890C(&qword_100021548);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v37, v33, v33, v31, v32);
  if (v37[3])
  {
    static FeedPlatform.current.getter(result);
    v34 = type metadata accessor for FeedContextFactory(0);
    swift_allocObject(v34, *(unsigned int *)(v34 + 48), *(unsigned __int16 *)(v34 + 52));
    v35 = FeedContextFactory.init(paidBundleConfigManager:paidAccessChecker:bundleSubscriptionManager:featureAvailability:appConfigManager:platform:userInfo:)(v43, v13, v17, v39, v38, v5, v37);
    result = (_QWORD *)sub_100008BE0(v40);
    *a2 = v35;
    a2[1] = (uint64_t)&protocol witness table for FeedContextFactory;
    return result;
  }
LABEL_13:
  __break(1u);
  return result;
}

void sub_100007A4C()
{
  uint64_t v0;
  char *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSURL *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;

  sub_10000890C(&qword_100021628);
  __chkstk_darwin();
  v1 = (char *)&v12 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = objc_msgSend(objc_allocWithZone((Class)FCContextConfiguration), "initWithEnvironment:", sub_100007BF0());
  v3 = (id)FCURLForContainerizedUserAccountCachesDirectory(1);
  if (v3)
  {
    v4 = v3;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v5 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v1, 0, 1, v5);
  }
  else
  {
    v5 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v1, 1, 1, v5);
  }
  v6 = objc_msgSend((id)objc_opt_self(FCFeldsparIDProvider), "sharedInstance");
  type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v5 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v1, 1, v5) != 1)
  {
    URL._bridgeToObjectiveC()(v8);
    v9 = v10;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v1, v5);
  }
  v11 = objc_msgSend(objc_allocWithZone((Class)FCConfigurationManager), "initWithContextConfiguration:contentHostDirectoryFileURL:feldsparIDProvider:", v2, v9, v6);

  if (!v11)
    __break(1u);
}

uint64_t sub_100007BF0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v1 = *v0;
  v2 = type metadata accessor for NewsEnvironment(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = static Settings.NewsContentEnvironment.contentEnvironment.getter(v4);
  v8 = sub_100008B60();
  Configurable.setting<A>(_:)(v7, v1, v8);
  swift_release(v7);
  v9 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
  v10 = 0;
  if (v9 == enum case for NewsEnvironment.production(_:))
    return v10;
  if (v9 == enum case for NewsEnvironment.staging(_:))
    return 1;
  if (v9 == enum case for NewsEnvironment.qa(_:))
    return 2;
  if (v9 == enum case for NewsEnvironment.test(_:))
    return 3;
  if (v9 == enum case for NewsEnvironment.devel(_:))
    return 4;
  if (v9 == enum case for NewsEnvironment.sandbox(_:))
    return 6;
  if (v9 == enum case for NewsEnvironment.demo1(_:))
    return 7;
  if (v9 == enum case for NewsEnvironment.demo2(_:))
    return 8;
  result = _diagnoseUnexpectedEnumCase<A>(type:)(v2, v2);
  __break(1u);
  return result;
}

id sub_100007D7C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;

  sub_10000890C(&qword_100021628);
  v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v6 = (char *)&v32 - v5;
  v7 = objc_msgSend(objc_allocWithZone((Class)FCContextConfiguration), "initWithEnvironment:", sub_100007BF0());
  v8 = a1[3];
  v9 = a1[4];
  sub_100008994(a1, v8);
  v10 = sub_10000895C(0, &qword_100021588, FCConfigurationManager_ptr);
  result = (id)dispatch thunk of ResolverType.resolve<A>(_:)(v10, v10, v8, v9);
  if (!result)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v12 = (uint64_t)result;
  v13 = (id)FCURLForContainerizedUserAccountCachesDirectory(1);
  if (v13)
  {
    v14 = v13;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v15 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v6, 0, 1, v15);
  }
  else
  {
    v16 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  v17 = (id)FCURLForContainerizedUserAccountCachesDirectory(1);
  v33 = v7;
  if (v17)
  {
    v18 = v17;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v19 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v4, 0, 1, v19);
  }
  else
  {
    v20 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v4, 1, 1, v20);
  }
  v21 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PrivateDataActionProvider()), "init");
  v22 = a1[3];
  v23 = a1[4];
  sub_100008994(a1, v22);
  v24 = sub_10000895C(0, &qword_100021550, FCNetworkBehaviorMonitor_ptr);
  result = (id)dispatch thunk of ResolverType.resolve<A>(_:)(v24, v24, v22, v23);
  if (!result)
    goto LABEL_13;
  v25 = (uint64_t)result;
  v26 = objc_msgSend(objc_allocWithZone((Class)NUApplicationAppActivityMonitorIOS), "init");
  v28 = a1[3];
  v27 = a1[4];
  sub_100008994(a1, v28);
  v29 = sub_10000895C(0, &qword_100021620, FCPrivateDataSyncAvailability_ptr);
  result = (id)dispatch thunk of ResolverType.resolve<A>(_:)(v29, v29, v28, v27);
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v30 = (uint64_t)result;
  v31 = objc_allocWithZone((Class)FCCloudContext);
  result = sub_1000089B8(v33, v12, (uint64_t)v6, (uint64_t)v4, (uint64_t)v21, v25, (uint64_t)v26, 0xF87FFFFC1, 2, 0, 0, v30, 0);
  if (!result)
LABEL_15:
    __break(1u);
  return result;
}

id sub_10000807C(id *a1)
{
  return objc_msgSend(*a1, "enableFlushingWithFlushingThreshold:", 2);
}

id sub_100008090(_QWORD *a1)
{
  return sub_10000809C(a1, (SEL *)&selRef_news_core_ConfigurationManager);
}

id sub_10000809C(_QWORD *a1, SEL *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  id v7;
  id v8;

  v3 = a1[3];
  v4 = a1[4];
  sub_100008994(a1, v3);
  v5 = sub_10000890C(&qword_100021558);
  result = (id)dispatch thunk of ResolverType.resolve<A>(_:)(v5, v5, v3, v4);
  if (result)
  {
    v7 = result;
    v8 = objc_msgSend(result, *a2);
    swift_unknownObjectRelease(v7);
    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100008118(_QWORD *a1)
{
  return sub_100008124(a1, (SEL *)&selRef_assetManager);
}

id sub_100008124(_QWORD *a1, SEL *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  void *v7;
  id v8;

  v3 = a1[3];
  v4 = a1[4];
  sub_100008994(a1, v3);
  v5 = sub_10000895C(0, &qword_100021590, FCCloudContext_ptr);
  result = (id)dispatch thunk of ResolverType.resolve<A>(_:)(v5, v5, v3, v4);
  if (result)
  {
    v7 = result;
    v8 = objc_msgSend(result, *a2);

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1000081A8(_QWORD *a1)
{
  sub_1000081C0(a1, (SEL *)&selRef_purchaseProvider);
}

void sub_1000081B4(_QWORD *a1)
{
  sub_1000081C0(a1, (SEL *)&selRef_localAreasManager);
}

void sub_1000081C0(_QWORD *a1, SEL *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a1[3];
  v4 = a1[4];
  sub_100008994(a1, v3);
  v5 = sub_10000895C(0, &qword_100021590, FCCloudContext_ptr);
  v6 = (void *)dispatch thunk of ResolverType.resolve<A>(_:)(v5, v5, v3, v4);
  if (!v6)
  {
    __break(1u);
    goto LABEL_5;
  }
  v7 = v6;
  v8 = objc_msgSend(v6, *a2);

  if (!v8)
LABEL_5:
    __break(1u);
}

void sub_10000824C(_QWORD *a1)
{
  sub_1000081C0(a1, (SEL *)&selRef_subscriptionController);
}

void sub_100008258(_QWORD *a1)
{
  sub_1000081C0(a1, (SEL *)&selRef_paidAccessChecker);
}

id sub_100008264(_QWORD *a1)
{
  return sub_100008124(a1, (SEL *)&selRef_puzzleTypeController);
}

void sub_100008270(_QWORD *a1)
{
  sub_1000081C0(a1, (SEL *)&selRef_bundleSubscriptionManager);
}

void sub_10000827C(_QWORD *a1)
{
  sub_1000081C0(a1, (SEL *)&selRef_purchaseController);
}

void sub_100008288(_QWORD *a1)
{
  sub_1000081C0(a1, (SEL *)&selRef_entitlementService);
}

id sub_100008294(uint64_t a1)
{
  return sub_1000086B0(a1, FCAppleAccount_ptr, (SEL *)&selRef_sharedAccount);
}

uint64_t sub_1000082A8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = a1[3];
  v4 = a1[4];
  sub_100008994(a1, v3);
  v5 = sub_10000895C(0, &qword_100021540, FCUserInfo_ptr);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v5, v5, v3, v4);
  if (result)
  {
    v7 = result;
    v8 = type metadata accessor for FeedUserInfo(0);
    swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
    result = FeedUserInfo.init(userInfo:)(v7);
    a2[3] = v8;
    a2[4] = (uint64_t)&protocol witness table for FeedUserInfo;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100008348()
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LocationDetectionManager(0)), "init");
}

uint64_t sub_10000836C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a1[3];
  v3 = a1[4];
  sub_100008994(a1, v2);
  v4 = sub_10000890C(&qword_1000215F0);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v4, v4, v2, v3);
  if (result)
  {
    v6 = result;
    v7 = a1[3];
    v8 = a1[4];
    sub_100008994(a1, v7);
    v9 = sub_10000890C(&qword_1000215B0);
    result = dispatch thunk of ResolverType.resolve<A>(_:)(v9, v9, v7, v8);
    if (result)
    {
      v10 = result;
      v11 = type metadata accessor for LocalRegionManager(0);
      swift_allocObject(v11, *(unsigned int *)(v11 + 48), *(unsigned __int16 *)(v11 + 52));
      return LocalRegionManager.init(locationManager:localAreasManager:)(v6, v10);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100008434@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10000846C(a1, (uint64_t (*)(_QWORD))&type metadata accessor for NotificationConfigurationManager, (uint64_t (*)(uint64_t))&NotificationConfigurationManager.init(appConfigurationManager:), (uint64_t)&protocol witness table for NotificationConfigurationManager, a2);
}

uint64_t sub_100008450@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10000846C(a1, (uint64_t (*)(_QWORD))&type metadata accessor for TopHeadlinesQueryTimeRangeConfigurationManager, (uint64_t (*)(uint64_t))&TopHeadlinesQueryTimeRangeConfigurationManager.init(appConfigurationManager:), (uint64_t)&protocol witness table for TopHeadlinesQueryTimeRangeConfigurationManager, a2);
}

uint64_t sub_10000846C@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v9 = a1[3];
  v10 = a1[4];
  sub_100008994(a1, v9);
  v11 = sub_10000890C(&qword_100021598);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v11, v11, v9, v10);
  if (result)
  {
    v13 = result;
    v14 = a2(0);
    swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
    result = a3(v13);
    a5[3] = v14;
    a5[4] = a4;
    *a5 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

_QWORD *sub_100008514@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];

  v4 = a1[3];
  v5 = a1[4];
  sub_100008994(a1, v4);
  v6 = sub_10000890C(&qword_100021598);
  result = (_QWORD *)dispatch thunk of ResolverType.resolve<A>(_:)(v6, v6, v4, v5);
  if (result)
  {
    v8 = result;
    v9 = a1[3];
    v10 = a1[4];
    sub_100008994(a1, v9);
    v11 = sub_10000890C(&qword_100021618);
    result = dispatch thunk of ResolverType.resolve<A>(_:)(v13, v11, v11, v9, v10);
    if (v13[3])
    {
      v12 = type metadata accessor for SearchEndpointConfigManager(0);
      swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
      result = (_QWORD *)SearchEndpointConfigManager.init(appConfigManager:resourceService:)(v8, v13);
      a2[3] = v12;
      a2[4] = &protocol witness table for SearchEndpointConfigManager;
      *a2 = result;
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

uint64_t sub_1000085FC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = a1[3];
  v4 = a1[4];
  sub_100008994(a1, v3);
  v5 = sub_10000895C(0, &qword_100021590, FCCloudContext_ptr);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v5, v5, v3, v4);
  if (result)
  {
    v7 = result;
    v8 = type metadata accessor for ResourceService(0);
    swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
    result = ResourceService.init(cloudContext:)(v7);
    a2[3] = v8;
    a2[4] = (uint64_t)&protocol witness table for ResourceService;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_10000869C(uint64_t a1)
{
  return sub_1000086B0(a1, FCPrivateDataSyncAvailability_ptr, (SEL *)&selRef_notAvailable);
}

id sub_1000086B0(uint64_t a1, _QWORD *a2, SEL *a3)
{
  return objc_msgSend((id)objc_opt_self(*a2), *a3);
}

uint64_t sub_1000086E0()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for TodayIntentsServiceAssembly()
{
  return objc_opt_self(_TtC16NewsTodayIntents27TodayIntentsServiceAssembly);
}

uint64_t sub_100008710()
{
  return sub_100006228();
}

uint64_t sub_100008730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  return Configurable.setting<A>(_:)(a1, *v5, a5);
}

uint64_t sub_10000873C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  return Configurable.setting<A>(_:defaultValue:)(a1, a2, *v6, a6);
}

uint64_t sub_100008748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  return Configurable.setting<A>(_:_:)(a1, a2, a3, *v7, a7);
}

uint64_t sub_100008754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  return Configurable.setting<A>(_:defaultValue:_:)(a1, a2, a3, a4, *v8, a8);
}

uint64_t sub_100008850(uint64_t a1)
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

id sub_1000088B8(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)swift_getObjectType(v2, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for PrivateDataActionProvider()
{
  return objc_opt_self(_TtC16NewsTodayIntentsP33_346BAA50B64DD5C36F8B4573B40F56D325PrivateDataActionProvider);
}

uint64_t sub_10000890C(uint64_t *a1)
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

void sub_10000894C()
{
  sub_100007A4C();
}

id sub_100008954(_QWORD *a1)
{
  return sub_100007D7C(a1);
}

uint64_t sub_10000895C(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

_QWORD *sub_100008994(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

id sub_1000089B8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __int16 a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(uint64_t, uint64_t, uint64_t);
  NSURL *v18;
  void *v19;
  void *v20;
  NSURL *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v27;
  id v28;

  v15 = type metadata accessor for URL(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
  v19 = 0;
  if (v17(a3, 1, v15) != 1)
  {
    URL._bridgeToObjectiveC()(v18);
    v19 = v20;
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a3, v15);
  }
  if (v17(a4, 1, v15) == 1)
  {
    v22 = 0;
  }
  else
  {
    URL._bridgeToObjectiveC()(v21);
    v22 = v23;
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a4, v15);
  }
  LOWORD(v25) = a10 & 0x101;
  v28 = objc_msgSend(v27, "initWithConfiguration:configurationManager:contentHostDirectory:privateDataHostDirectory:privateDataActionProvider:networkBehaviorMonitor:appActivityMonitor:desiredHeadlineFieldOptions:feedUsage:lockStoreFrontIfNeeded:deviceIsiPad:backgroundTaskable:privateDataSyncAvailability:pptContext:", a1, a2, v19, v22, a5, a6, a7, a8, a9, v25, a11, a12, a13);

  swift_unknownObjectRelease(a2);
  swift_unknownObjectRelease(a5);
  swift_unknownObjectRelease(a6);
  swift_unknownObjectRelease(a7);
  swift_unknownObjectRelease(a11);
  swift_unknownObjectRelease(a12);
  swift_unknownObjectRelease(a13);
  return v28;
}

unint64_t sub_100008B60()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021630;
  if (!qword_100021630)
  {
    v1 = type metadata accessor for TodayIntentsServiceAssembly();
    result = swift_getWitnessTable("])", v1);
    atomic_store(result, (unint64_t *)&qword_100021630);
  }
  return result;
}

_QWORD *sub_100008BA4(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

uint64_t sub_100008BE0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100008C00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100008C10(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100008C1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v5;
  _BYTE v6[24];
  __int128 v7;
  uint64_t v8;
  _BYTE v9[24];

  v3 = v1 + 24;
  swift_beginAccess(v1 + 24, v9, 0, 0);
  sub_100008F18(v1 + 24, (uint64_t)&v7);
  if (v8)
    return sub_10000902C(&v7, a1);
  v5 = sub_100008F60((uint64_t)&v7);
  Container.resolver.getter(v5);
  sub_100008FA0(a1, (uint64_t)&v7);
  swift_beginAccess(v3, v6, 33, 0);
  sub_100008FE4((uint64_t)&v7, v3);
  return swift_endAccess(v6);
}

uint64_t sub_100008CCC()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v1 = v0;
  v2 = type metadata accessor for Container.Environment(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v0 + 56) = 0;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_OWORD *)(v0 + 24) = 0u;
  v6 = sub_10000890C(&qword_1000216E8);
  v7 = swift_allocObject(v6, 152, 7);
  *(_OWORD *)(v7 + 16) = xmmword_100016390;
  v8 = type metadata accessor for TodayIntentsServiceAssembly();
  v9 = swift_allocObject(v8, 16, 7);
  *(_QWORD *)(v7 + 56) = v8;
  *(_QWORD *)(v7 + 64) = sub_100009044(&qword_1000216F0, (uint64_t (*)(uint64_t))type metadata accessor for TodayIntentsServiceAssembly, (uint64_t)&unk_1000162FC);
  *(_QWORD *)(v7 + 32) = v9;
  v10 = type metadata accessor for SearchServiceAssembly(0);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  v11 = SearchServiceAssembly.init()();
  *(_QWORD *)(v7 + 96) = v10;
  *(_QWORD *)(v7 + 104) = sub_100009044(&qword_1000216F8, (uint64_t (*)(uint64_t))&type metadata accessor for SearchServiceAssembly, (uint64_t)&protocol conformance descriptor for SearchServiceAssembly);
  *(_QWORD *)(v7 + 72) = v11;
  v12 = type metadata accessor for TodayIntentsAssembly();
  v13 = swift_allocObject(v12, 16, 7);
  *(_QWORD *)(v7 + 136) = v12;
  *(_QWORD *)(v7 + 144) = sub_100009044(&qword_100021700, (uint64_t (*)(uint64_t))type metadata accessor for TodayIntentsAssembly, (uint64_t)"i(");
  *(_QWORD *)(v7 + 112) = v13;
  v14 = type metadata accessor for SingletonPool(0);
  swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
  v15 = SingletonPool.init()();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for Container.Environment.normal(_:), v2);
  v16 = type metadata accessor for Container(0);
  swift_allocObject(v16, *(unsigned int *)(v16 + 48), *(unsigned __int16 *)(v16 + 52));
  *(_QWORD *)(v1 + 16) = Container.init(bundleAssemblies:assemblies:singletonPool:environment:)(&_swiftEmptyArrayStorage, v7, v15, v5);
  return v1;
}

uint64_t sub_100008ECC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  sub_100008F60(v0 + 24);
  return swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for TodayIntentsContainer()
{
  return objc_opt_self(_TtC16NewsTodayIntents21TodayIntentsContainer);
}

uint64_t sub_100008F18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000890C((uint64_t *)&unk_100021890);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008F60(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000890C((uint64_t *)&unk_100021890);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100008FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000890C((uint64_t *)&unk_100021890);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000902C(__int128 *a1, uint64_t a2)
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

uint64_t sub_100009044(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

_QWORD *sub_100009084@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v4 = a1[3];
  v5 = a1[4];
  sub_100008994(a1, v4);
  v6 = sub_10000890C(&qword_1000217A8);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(&v15, v6, v6, v4, v5);
  if (v16)
  {
    v8 = a1[3];
    v9 = a1[4];
    sub_100008994(a1, v8);
    v10 = sub_10000890C(&qword_1000217B0);
    result = dispatch thunk of ResolverType.resolve<A>(_:)(&v13, v10, v10, v8, v9);
    if (v14)
    {
      v11 = type metadata accessor for FollowingTagsService();
      v12 = swift_allocObject(v11, 96, 7);
      sub_10000902C(&v15, v12 + 16);
      result = (_QWORD *)sub_10000902C(&v13, v12 + 56);
      a2[3] = v11;
      a2[4] = (uint64_t)&off_100018F68;
      *a2 = v12;
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

uint64_t sub_10000917C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  uint64_t result;
  id v13;
  NSURL *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_10000890C(&qword_100021628);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (id)FCURLForTodayDropbox(v7);
  if (v10)
  {
    v11 = v10;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v9, v5, v2);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v9, 0, 1, v2);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v9, 1, v2);
    if ((_DWORD)result != 1)
    {
      v13 = objc_allocWithZone((Class)FCFileCoordinatedTodayDropbox);
      URL._bridgeToObjectiveC()(v14);
      v16 = v15;
      v17 = objc_msgSend(v13, "initWithFileURL:", v15);

      (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
      result = sub_10000895C(0, &qword_1000217B8, FCFileCoordinatedTodayDropbox_ptr);
      a1[3] = result;
      a1[4] = &off_100018FC8;
      *a1 = v17;
      return result;
    }
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v9, 1, 1, v2);
  }
  __break(1u);
  return result;
}

uint64_t sub_100009314@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v3 = a1[3];
  v4 = a1[4];
  sub_100008994(a1, v3);
  v5 = sub_10000895C(0, &qword_100021560, FCTagController_ptr);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v5, v5, v3, v4);
  if (result)
  {
    a2[3] = v5;
    a2[4] = (uint64_t)&off_100018DF0;
    *a2 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for TodayIntentsAssembly()
{
  return objc_opt_self(_TtC16NewsTodayIntents20TodayIntentsAssembly);
}

uint64_t sub_1000093B4(uint64_t a1)
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

  v1 = ProxyContainer.public.getter(a1);
  v2 = sub_10000890C(&qword_1000217A0);
  v3 = RegistrationContainer.register<A>(_:name:factory:)(v2, 0, 0, sub_100009084, 0, v2);
  swift_release(v3);
  v4 = swift_release(v1);
  v5 = ProxyContainer.private.getter(v4);
  v6 = sub_10000890C(&qword_1000217A8);
  v7 = RegistrationContainer.register<A>(_:name:factory:)(v6, 0, 0, sub_10000917C, 0, v6);
  swift_release(v7);
  v8 = swift_release(v5);
  v9 = ProxyContainer.private.getter(v8);
  v10 = sub_10000890C(&qword_1000217B0);
  v11 = RegistrationContainer.register<A>(_:name:factory:)(v10, 0, 0, sub_100009314, 0, v10);
  swift_release(v11);
  return swift_release(v9);
}

id sub_10000948C()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  NSString v10;
  id v11;
  id v12;
  NSString v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSString v18;
  id v19;
  uint64_t v20;
  uint64_t v21;

  v1 = objc_msgSend(v0, "identifier");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  v3 = v2;

  v4 = objc_msgSend(v0, "nameCompact");
  if (!v4)
    v4 = objc_msgSend(v0, "name");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v6 = v5;

  v7 = type metadata accessor for Tag();
  v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v7));
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  v11 = objc_msgSend(v8, "initWithIdentifier:displayString:", v9, v10);

  v12 = objc_msgSend(v0, "groupTitleColor");
  v13 = v12;
  if (v12)
  {
    v14 = objc_msgSend(v12, "hex");

    static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    v16 = v15;

    v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v16);
  }
  objc_msgSend(v11, "setNameColorLight:", v13);

  v17 = objc_msgSend(v0, "groupDarkStyleTitleColor");
  v18 = v17;
  if (v17)
  {
    v19 = objc_msgSend(v17, "hex");

    static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
    v21 = v20;

    v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v21);
  }
  objc_msgSend(v11, "setNameColorDark:", v18);

  return v11;
}

uint64_t sub_1000096A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[24];
  __int128 v6;
  uint64_t v7;
  _BYTE v8[24];

  v3 = v1 + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___resolver;
  swift_beginAccess(v1 + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___resolver, v8, 0, 0);
  sub_10000BAD8(v3, (uint64_t)&v6, (uint64_t *)&unk_100021890);
  if (v7)
    return sub_10000902C(&v6, a1);
  sub_10000BB1C((uint64_t)&v6, (uint64_t *)&unk_100021890);
  sub_100008C1C(a1);
  sub_100008FA0(a1, (uint64_t)&v6);
  swift_beginAccess(v3, v5, 33, 0);
  sub_10000BB58((uint64_t)&v6, v3, (uint64_t *)&unk_100021890);
  return swift_endAccess(v5);
}

_QWORD *sub_100009778@<X0>(uint64_t a1@<X8>)
{
  return sub_1000097C0(&OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___followingTagsService, (uint64_t *)&unk_100021880, (uint64_t (*)(_QWORD *, uint64_t))sub_10000902C, &qword_1000217A0, a1);
}

_QWORD *sub_10000979C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000097C0(&OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___searchService, &qword_100021870, (uint64_t (*)(_QWORD *, uint64_t))sub_10000902C, &qword_100021878, a1);
}

_QWORD *sub_1000097C0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(_QWORD *, uint64_t)@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v10;
  _QWORD *result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[24];

  v10 = v5 + *a1;
  swift_beginAccess(v10, v19, 0, 0);
  sub_10000BAD8(v10, (uint64_t)v16, a2);
  if (v17)
    return (_QWORD *)a3(v16, a5);
  sub_10000BB1C((uint64_t)v16, a2);
  sub_1000096A0((uint64_t)v16);
  v12 = v17;
  v13 = v18;
  sub_100008994(v16, v17);
  v14 = sub_10000890C(a4);
  result = dispatch thunk of ResolverType.resolve<A>(_:)(v15, v14, v14, v12, v13);
  if (v15[3])
  {
    a3(v15, a5);
    sub_100008BE0(v16);
    sub_100008FA0(a5, (uint64_t)v16);
    swift_beginAccess(v10, v15, 33, 0);
    sub_10000BB58((uint64_t)v16, v10, a2);
    return (_QWORD *)swift_endAccess(v15);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000099A0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentHandler()
{
  return objc_opt_self(_TtC16NewsTodayIntents13IntentHandler);
}

uint64_t sub_100009A78(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD v5[5];

  sub_100009778((uint64_t)v5);
  sub_100008994(v5, v5[3]);
  type metadata accessor for FollowingTagsService();
  v3 = sub_10000C6A4(a2);
  sub_100008BE0(v5);
  return v3;
}

id sub_100009B04(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  Class isa;
  id v15;

  v3 = (void *)sub_10000AE2C(a1);
  if (v3)
  {
    v4 = v3;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v4);
    v6 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
    v5 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v6 >= v5 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v5 > 1, v6 + 1, 1);
    v7 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v6, v4);
    specialized Array._endMutation()(v7);

  }
  v8 = (void *)sub_10000B060(a2);
  if (v8)
  {
    v9 = v8;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v9);
    v11 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
    v10 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v11 >= v10 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v10 > 1, v11 + 1, 1);
    v12 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v11, v9);
    specialized Array._endMutation()(v12);

  }
  v13 = objc_allocWithZone((Class)INObjectCollection);
  sub_10000890C((uint64_t *)&unk_100021850);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  v15 = objc_msgSend(v13, "initWithSections:", isa);

  return v15;
}

void sub_100009C60(uint64_t a1, void (*a2)(id, _QWORD))
{
  id v3;
  Class isa;
  id v5;
  id v6;

  v3 = objc_allocWithZone((Class)INObjectCollection);
  type metadata accessor for Tag();
  isa = Array._bridgeToObjectiveC()().super.isa;
  v5 = objc_msgSend(v3, "initWithItems:", isa);

  v6 = v5;
  a2(v5, 0);

}

uint64_t sub_100009CF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  sub_10000979C((uint64_t)v9);
  v5 = v10;
  v6 = v11;
  sub_100008994(v9, v10);
  v7 = dispatch thunk of LegacySearchServiceType.fetchSearchResults(searchData:param:)(a2, a3, v5, v6);
  sub_100008BE0(v9);
  return v7;
}

uint64_t sub_100009D7C(uint64_t a1, void (*a2)(id, _QWORD), uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD *v24;
  NSString v25;
  id v26;
  Class isa;
  id v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t inited;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  Swift::Int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t result;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  NSString v58;
  uint64_t v59;
  id v60;
  Class v61;
  id v62;
  id v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  id v70;
  Class v71;
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(id, _QWORD);
  uint64_t v79;
  char *v80;
  char v81[48];
  _QWORD *v82;
  unint64_t v83;

  v4 = v3;
  v77 = a3;
  v7 = type metadata accessor for LegacySearchResults(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = (unint64_t)_swiftEmptyArrayStorage;
  v12 = LegacySearchResults.topHitTopic()(v9);
  v13 = v12;
  v79 = v8;
  v80 = v11;
  v78 = a2;
  if (v12)
  {
    v14 = swift_unknownObjectRetain(v12);
    v15 = (id)NSSNewsWidgetIntentsTopHitHeaderName(v14);
    if (v15)
    {
      v16 = v15;
      static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      v18 = v17;

    }
    else
    {
      v18 = 0;
    }
    v20 = sub_10000890C(&qword_100021860);
    v21 = swift_allocObject(v20, 40, 7);
    *(_OWORD *)(v21 + 16) = xmmword_100016410;
    swift_getObjectType(v13, v22);
    v23 = sub_10000D39C();
    *(_QWORD *)(v21 + 32) = v23;
    v82 = (_QWORD *)v21;
    specialized Array._endMutation()(v23);
    v24 = v82;
    if (v18)
    {
      v25 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v18);
    }
    else
    {
      v25 = 0;
    }
    v26 = objc_allocWithZone((Class)INObjectSection);
    type metadata accessor for Tag();
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v24);
    v28 = objc_msgSend(v26, "initWithTitle:items:", v25, isa);

    v29 = v28;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v29);
    v31 = *(_QWORD *)((v83 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v30 = *(_QWORD *)((v83 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v31 >= v30 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v30 > 1, v31 + 1, 1);
    v32 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v31, v29);
    specialized Array._endMutation()(v32);
    swift_unknownObjectRelease(v13);

    v33 = sub_10000890C((uint64_t *)&unk_100021A40);
    inited = swift_initStackObject(v33, v81);
    *(_OWORD *)(inited + 16) = xmmword_100016420;
    v35 = objc_msgSend((id)swift_unknownObjectRetain(v13), "identifier");
    v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
    v38 = v37;

    *(_QWORD *)(inited + 32) = v36;
    *(_QWORD *)(inited + 40) = v38;
    v39 = sub_10000B2C4(inited);
    swift_setDeallocating(inited);
    swift_arrayDestroy(inited + 32, 1, &type metadata for String);
    LegacySearchResults.excluding(identifiers:)(v39);
    swift_unknownObjectRelease(v13);
    v19 = swift_bridgeObjectRelease(v39);
  }
  else
  {
    v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  }
  v40 = LegacySearchResults.topics()(v19);
  v41 = v40;
  v42 = (unint64_t)v40 >> 62;
  if (!((unint64_t)v40 >> 62))
  {
    if (*(_QWORD *)((v40 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_14;
LABEL_39:
    swift_bridgeObjectRelease(v41);
LABEL_40:
    v69 = v83;
    v70 = objc_allocWithZone((Class)INObjectCollection);
    sub_10000890C((uint64_t *)&unk_100021850);
    v71 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v69);
    v72 = objc_msgSend(v70, "initWithSections:", v71);

    v73 = v72;
    v78(v72, 0);

    swift_unknownObjectRelease(v13);
    return (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v80, v7);
  }
  if (v40 < 0)
    v67 = v40;
  else
    v67 = v40 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v40);
  v68 = _CocoaArrayWrapper.endIndex.getter(v67);
  swift_bridgeObjectRelease(v41);
  if (!v68)
    goto LABEL_39;
LABEL_14:
  v76 = v7;
  v43 = (id)NSSNewsWidgetIntentsTopicsHeaderName();
  if (v43)
  {
    v44 = v43;
    v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
    v47 = v46;

    if (!v42)
      goto LABEL_16;
  }
  else
  {
    v45 = 0;
    v47 = 0;
    if (!v42)
    {
LABEL_16:
      v48 = *(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10);
      v75 = v45;
      if (v48)
        goto LABEL_17;
LABEL_30:
      swift_bridgeObjectRelease(v41);
      v57 = _swiftEmptyArrayStorage;
      if (v47)
      {
LABEL_24:
        v58 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v47);
LABEL_32:
        v7 = v76;
        v60 = objc_allocWithZone((Class)INObjectSection);
        type metadata accessor for Tag();
        v61 = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v57);
        v62 = objc_msgSend(v60, "initWithTitle:items:", v58, v61);

        v63 = v62;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v63);
        v65 = *(_QWORD *)((v83 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v64 = *(_QWORD *)((v83 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v65 >= v64 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v64 > 1, v65 + 1, 1);
        v66 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v65, v63);
        specialized Array._endMutation()(v66);

        goto LABEL_40;
      }
LABEL_31:
      v58 = 0;
      goto LABEL_32;
    }
  }
  if (v41 < 0)
    v59 = v41;
  else
    v59 = v41 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v41);
  v48 = _CocoaArrayWrapper.endIndex.getter(v59);
  swift_bridgeObjectRelease(v41);
  v75 = v45;
  if (!v48)
    goto LABEL_30;
LABEL_17:
  v82 = _swiftEmptyArrayStorage;
  result = specialized ContiguousArray.reserveCapacity(_:)(v48);
  if ((v48 & 0x8000000000000000) == 0)
  {
    v74 = v4;
    v50 = 0;
    do
    {
      if ((v41 & 0xC000000000000001) != 0)
      {
        v52 = specialized _ArrayBuffer._getElementSlowPath(_:)(v50, v41);
      }
      else
      {
        v52 = *(_QWORD *)(v41 + 8 * v50 + 32);
        swift_unknownObjectRetain(v52);
      }
      ++v50;
      swift_getObjectType(v52, v51);
      v53 = sub_10000D39C();
      v54 = swift_unknownObjectRelease(v52);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v54);
      v55 = v82[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v55);
      v56 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v55, v53);
      specialized ContiguousArray._endMutation()(v56);
    }
    while (v48 != v50);
    v57 = v82;
    swift_bridgeObjectRelease(v41);
    if (v47)
      goto LABEL_24;
    goto LABEL_31;
  }
  __break(1u);
  return result;
}

void sub_10000A3F0(uint64_t a1, uint64_t a2, uint64_t a3)
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

void sub_10000A45C(void *a1, int a2, void *a3, void *aBlock, uint64_t (*a5)(_QWORD), _QWORD *a6)
{
  void (**v10)(void *, id);
  id v11;
  id v12;
  id v13;
  char *v14;
  char *v15;
  char v16[24];

  v10 = (void (**)(void *, id))_Block_copy(aBlock);
  v11 = objc_allocWithZone((Class)a5(0));
  v12 = a3;
  v13 = a1;
  v14 = (char *)objc_msgSend(v11, "init");
  v15 = &v14[*a6];
  swift_beginAccess(v15, v16, 1, 0);
  *(_QWORD *)v15 = 2;
  objc_msgSend(v14, "setUserActivity:", 0);
  v10[2](v10, v14);

  _Block_release(v10);
}

uint64_t sub_10000A538()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[5];

  sub_100009778((uint64_t)v13);
  v0 = *sub_100008994(v13, v13[3]);
  v1 = sub_10000890C((uint64_t *)&unk_100021840);
  v2 = firstly<A>(closure:)(sub_10000B814, v0, v1);
  v3 = swift_retain(v0);
  v4 = (void *)zalgo.getter(v3);
  v5 = sub_10000890C((uint64_t *)&unk_100021A20);
  v6 = Promise.then<A>(on:closure:)(v4, sub_10000B82C, v0, v5);
  swift_release(v2);
  swift_release(v0);

  v7 = swift_allocObject(&unk_100018C98, 24, 7);
  *(_QWORD *)(v7 + 16) = &off_1000189B0;
  v8 = swift_allocObject(&unk_100018CC0, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_10000B868;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = (void *)zalgo.getter(v8);
  v10 = sub_10000890C(&qword_100021820);
  v11 = Promise.then<A>(on:closure:)(v9, sub_10000B870, v8, v10);
  swift_release(v6);
  swift_release(v8);

  sub_100008BE0(v13);
  return v11;
}

uint64_t sub_10000A698(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = a1[1];
  v18 = *a1;
  swift_bridgeObjectRetain(v18);
  v2 = swift_bridgeObjectRetain(v1);
  sub_10000CBDC(v2);
  v3 = v18;
  if (!((unint64_t)v18 >> 62))
  {
    v4 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_3;
LABEL_14:
    swift_bridgeObjectRelease(v18);
    v15 = _swiftEmptyArrayStorage;
LABEL_15:
    v18 = (uint64_t)v15;
    v17 = sub_10000890C(&qword_100021838);
    swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
    return Promise.init(value:)(&v18);
  }
  if (v18 < 0)
    v16 = v18;
  else
    v16 = v18 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v18);
  v4 = _CocoaArrayWrapper.endIndex.getter(v16);
  swift_bridgeObjectRelease(v18);
  if (!v4)
    goto LABEL_14;
LABEL_3:
  v18 = (uint64_t)_swiftEmptyArrayStorage;
  result = specialized ContiguousArray.reserveCapacity(_:)(v4);
  if ((v4 & 0x8000000000000000) == 0)
  {
    v6 = 0;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
      {
        v7 = specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v3);
      }
      else
      {
        v7 = *(_QWORD *)(v3 + 8 * v6 + 32);
        swift_unknownObjectRetain(v7);
      }
      ++v6;
      v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TagIntent()), "init");
      swift_getObjectType(v7, v9);
      v10 = v8;
      v11 = sub_10000D39C();
      objc_msgSend(v10, "setTag:", v11);

      v12 = swift_unknownObjectRelease(v7);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v12);
      v13 = *(_QWORD *)(v18 + 16);
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v13);
      v14 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v13, v10);
      specialized ContiguousArray._endMutation()(v14);
    }
    while (v4 != v6);
    v15 = (_QWORD *)v18;
    swift_bridgeObjectRelease(v3);
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

void (*sub_10000A8CC(uint64_t **a1, unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  uint64_t *v6;

  v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_10000A94C(v6, a2, a3);
  return sub_10000A920;
}

void sub_10000A920(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t *sub_10000A94C(uint64_t *result, unint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_unknownObjectRetain(*(_QWORD *)(a3 + 8 * a2 + 32));
LABEL_5:
    *v3 = v4;
    return (uint64_t *)sub_10000A9B8;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A9B8(_QWORD *a1)
{
  return swift_unknownObjectRelease(*a1);
}

void sub_10000A9C0(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
  void *v4;
  uint64_t Param;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  id v73;

  v73 = a3;
  Param = type metadata accessor for SearchParsecQueryParam(0);
  v70 = *(_QWORD *)(Param - 8);
  v71 = Param;
  v9 = *(_QWORD *)(v70 + 64);
  v10 = __chkstk_darwin(Param);
  v11 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v72 = (char *)&v64 - v12;
  v13 = type metadata accessor for SearchRequestData(0);
  v14 = *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64);
  v15 = __chkstk_darwin(v13);
  v16 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v20 = (char *)&v64 - v19;
  if (!a2)
    goto LABEL_6;
  v21 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v21 = a1 & 0xFFFFFFFFFFFFLL;
  if (v21)
  {
    v22 = v17;
    v65 = v4;
    v67 = a4;
    v23 = v18;
    swift_bridgeObjectRetain(a2);
    v69 = v20;
    SearchRequestData.init(searchString:origination:batchSize:refreshQueryParam:keyboardInputMode:)(a1, a2, 6, 0, 1, 0, 0);
    v24 = v72;
    v25 = SearchParsecQueryParam.init(queryID:keyboardInputMode:)(0, 0, 0);
    v66 = zalgoIfMain.getter(v25);
    v26 = v22;
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v16, v20, v22);
    v27 = v70;
    v28 = v71;
    (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v11, v24, v71);
    v29 = *(unsigned __int8 *)(v23 + 80);
    v68 = v23;
    v30 = (v29 + 24) & ~v29;
    v31 = *(unsigned __int8 *)(v27 + 80);
    v32 = (v14 + v31 + v30) & ~v31;
    v33 = swift_allocObject(&unk_100018D88, v32 + v9, v29 | v31 | 7);
    v34 = v65;
    *(_QWORD *)(v33 + 16) = v65;
    v35 = v16;
    v36 = v26;
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v33 + v30, v35, v26);
    (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(v33 + v32, v11, v28);
    v37 = type metadata accessor for LegacySearchResults(0);
    v38 = v34;
    v39 = (void *)v66;
    v40 = firstly<A>(on:closure:)(v66, sub_10000BA28, v33, v37);

    swift_release(v33);
    v41 = swift_allocObject(&unk_100018DB0, 32, 7);
    v42 = v73;
    v43 = v67;
    *(_QWORD *)(v41 + 16) = v73;
    *(_QWORD *)(v41 + 24) = v43;
    v44 = swift_retain(v43);
    v45 = (void *)zalgo.getter(v44);
    v46 = Promise.then<A>(on:closure:)(v45, sub_10000BA98, v41, (char *)&type metadata for () + 8);
    swift_release(v40);
    swift_release(v41);

    v47 = swift_allocObject(&unk_100018DD8, 32, 7);
    *(_QWORD *)(v47 + 16) = v42;
    *(_QWORD *)(v47 + 24) = v43;
    v48 = swift_retain(v43);
    v49 = (void *)zalgo.getter(v48);
    v50 = Promise.error(on:closure:)(v49, sub_10000BAB0, v47);
    swift_release(v50);
    swift_release(v46);
    swift_release(v47);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v72, v28);
    (*(void (**)(char *, uint64_t))(v68 + 8))(v69, v36);
  }
  else
  {
LABEL_6:
    v51 = (void *)zalgoIfMain.getter(v17);
    v52 = swift_allocObject(&unk_100018D10, 32, 7);
    *(_QWORD *)(v52 + 16) = v4;
    *(_QWORD *)(v52 + 24) = &off_100018988;
    v53 = v4;
    v54 = sub_10000890C(&qword_100021820);
    v55 = firstly<A>(on:closure:)(v51, sub_10000B8E0, v52, v54);

    swift_release(v52);
    v56 = swift_allocObject(&unk_100018D38, 32, 7);
    v57 = v73;
    *(_QWORD *)(v56 + 16) = v73;
    *(_QWORD *)(v56 + 24) = a4;
    v58 = swift_retain(a4);
    v59 = (void *)zalgo.getter(v58);
    v60 = Promise.then<A>(on:closure:)(v59, sub_10000B91C, v56, (char *)&type metadata for () + 8);
    swift_release(v55);
    swift_release(v56);

    v61 = swift_allocObject(&unk_100018D60, 32, 7);
    *(_QWORD *)(v61 + 16) = v57;
    *(_QWORD *)(v61 + 24) = a4;
    v62 = swift_retain(a4);
    v73 = (id)zalgo.getter(v62);
    v63 = Promise.error(on:closure:)(v73, sub_10000B964, v61);
    swift_release(v63);
    swift_release(v60);
    swift_release(v61);

  }
}

uint64_t sub_10000AE2C(uint64_t a1)
{
  unint64_t v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString v16;
  uint64_t v17;
  id v18;
  Class isa;
  uint64_t v20;

  v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v20 = a1;
    else
      v20 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = (id)_CocoaArrayWrapper.endIndex.getter(v20);
    swift_bridgeObjectRelease(a1);
    if (!v3)
      return (uint64_t)v3;
  }
  else
  {
    v3 = *(id *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v3)
      return (uint64_t)v3;
  }
  v4 = (id)NSSNewsWidgetIntentsFollowingHeaderName();
  if (v4)
  {
    v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v7 = v6;

    if (!v2)
      goto LABEL_5;
  }
  else
  {
    v7 = 0;
    if (!v2)
    {
LABEL_5:
      v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(a1);
      if (v8)
        goto LABEL_6;
LABEL_19:
      swift_bridgeObjectRelease(a1);
      if (v7)
      {
LABEL_13:
        v16 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v7);
LABEL_21:
        v18 = objc_allocWithZone((Class)INObjectSection);
        type metadata accessor for Tag();
        isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        v3 = objc_msgSend(v18, "initWithTitle:items:", v16, isa);

        return (uint64_t)v3;
      }
LABEL_20:
      v16 = 0;
      goto LABEL_21;
    }
  }
  if (a1 < 0)
    v17 = a1;
  else
    v17 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a1);
  v8 = _CocoaArrayWrapper.endIndex.getter(v17);
  if (!v8)
    goto LABEL_19;
LABEL_6:
  result = specialized ContiguousArray.reserveCapacity(_:)(v8);
  if ((v8 & 0x8000000000000000) == 0)
  {
    v10 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(v10, a1);
      }
      else
      {
        v11 = *(_QWORD *)(a1 + 8 * v10 + 32);
        swift_unknownObjectRetain(v11);
      }
      ++v10;
      v12 = sub_10000948C();
      v13 = swift_unknownObjectRelease(v11);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v13);
      v14 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v14);
      v15 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v14, v12);
      specialized ContiguousArray._endMutation()(v15);
    }
    while (v8 != v10);
    swift_bridgeObjectRelease(a1);
    if (v7)
      goto LABEL_13;
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000B060(uint64_t a1)
{
  unint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString v17;
  uint64_t v18;
  id v19;
  Class isa;
  uint64_t v21;

  v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v21 = a1;
    else
      v21 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = (id)_CocoaArrayWrapper.endIndex.getter(v21);
    swift_bridgeObjectRelease(a1);
    if (!v3)
      return (uint64_t)v3;
  }
  else
  {
    v3 = *(id *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v3)
      return (uint64_t)v3;
  }
  if (objc_msgSend((id)objc_opt_self(FCUserInfo), "progressivePersonalization") == (id)2)
    v4 = (void *)NSSNewsWidgetIntentsSuggestedBySiriHeaderName();
  else
    v4 = (void *)NSSNewsWidgetIntentsSuggestedByNewsHeaderName();
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
    v8 = v7;

    if (!v2)
      goto LABEL_8;
  }
  else
  {
    v8 = 0;
    if (!v2)
    {
LABEL_8:
      v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(a1);
      if (v9)
        goto LABEL_9;
LABEL_22:
      swift_bridgeObjectRelease(a1);
      if (v8)
      {
LABEL_16:
        v17 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v8);
LABEL_24:
        v19 = objc_allocWithZone((Class)INObjectSection);
        type metadata accessor for Tag();
        isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        v3 = objc_msgSend(v19, "initWithTitle:items:", v17, isa);

        return (uint64_t)v3;
      }
LABEL_23:
      v17 = 0;
      goto LABEL_24;
    }
  }
  if (a1 < 0)
    v18 = a1;
  else
    v18 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a1);
  v9 = _CocoaArrayWrapper.endIndex.getter(v18);
  if (!v9)
    goto LABEL_22;
LABEL_9:
  result = specialized ContiguousArray.reserveCapacity(_:)(v9);
  if ((v9 & 0x8000000000000000) == 0)
  {
    v11 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v12 = specialized _ArrayBuffer._getElementSlowPath(_:)(v11, a1);
      }
      else
      {
        v12 = *(_QWORD *)(a1 + 8 * v11 + 32);
        swift_unknownObjectRetain(v12);
      }
      ++v11;
      v13 = sub_10000948C();
      v14 = swift_unknownObjectRelease(v12);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v14);
      v15 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v15);
      v16 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v15, v13);
      specialized ContiguousArray._endMutation()(v16);
    }
    while (v9 != v11);
    swift_bridgeObjectRelease(a1);
    if (v8)
      goto LABEL_16;
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

Swift::Int sub_10000B2C4(uint64_t a1)
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
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[9];

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_10000890C(&qword_100021868);
    v3 = static _SetStorage.allocate(capacity:)(v1);
    v4 = 0;
    v5 = v3 + 56;
    v27 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v27 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      Hasher.init(_seed:)(v28, *(_QWORD *)(v3 + 40));
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(v28, v8, v7);
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
        v17 = v16[1];
        v18 = *v16 == v8 && v17 == v7;
        if (v18 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, v7, 0), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease(v7);
          goto LABEL_4;
        }
        v19 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v19;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v20 = (_QWORD *)(v15 + 16 * v11);
          v21 = v20[1];
          if (*v20 != v8 || v21 != v7)
          {
            result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, v7, 0);
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v23 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v23 = v8;
      v23[1] = v7;
      v24 = *(_QWORD *)(v3 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v26;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

id sub_10000B464()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;

  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(FCAppleAccount), "sharedAccount");
  v3 = objc_msgSend(v2, "dynamicSupportedContentLanguage");

  if (v3 == (id)1)
  {
    if (qword_100020DE0 != -1)
      swift_once(&qword_100020DE0, sub_100005F74);
    v4 = &qword_100020DE8;
  }
  else
  {
    if (qword_100020DD0 != -1)
      swift_once(&qword_100020DD0, sub_100005F58);
    v4 = &qword_100020DD8;
  }
  v5 = (void *)*v4;
  v6 = objc_allocWithZone((Class)type metadata accessor for TagIntent());
  v7 = v5;
  v8 = objc_msgSend(v6, "init");
  objc_msgSend(v8, "setTag:", v7);

  v9 = sub_10000890C(&qword_100021808);
  v10 = swift_allocObject(v9, 72, 7);
  *(_OWORD *)(v10 + 16) = xmmword_100016420;
  v11 = objc_msgSend(v8, "description");
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v14 = v13;

  *(_QWORD *)(v10 + 56) = &type metadata for String;
  *(_QWORD *)(v10 + 64) = sub_10000B758();
  *(_QWORD *)(v10 + 32) = v12;
  *(_QWORD *)(v10 + 40) = v14;
  sub_10000B79C();
  v15 = (void *)static OS_os_log.default.getter();
  v16 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)("intent provider did find %@", 27, 2, &_mh_execute_header, v15, v16, v10);
  swift_bridgeObjectRelease(v10);

  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSSNewsTagWidgetKind);
  v19 = v18;
  v20 = v8;
  v21 = (void *)zalgoIfMain.getter(v20);
  v22 = swift_allocObject(&unk_100018C70, 24, 7);
  *(_QWORD *)(v22 + 16) = v1;
  v23 = v1;
  v24 = sub_10000890C(&qword_100021820);
  v25 = firstly<A>(on:closure:)(v21, sub_10000B7FC, v22, v24);

  v26 = swift_release(v22);
  v27 = (void *)zalgo.getter(v26);
  v28 = sub_10000890C(&qword_100021828);
  v29 = Promise.then<A>(on:closure:)(v27, sub_10000A698, 0, v28);
  swift_release(v25);

  v30 = sub_10000890C(&qword_100021830);
  swift_allocObject(v30, *(unsigned int *)(v30 + 48), *(unsigned __int16 *)(v30 + 52));
  v31 = DefaultIntentProvider.init(widgetKind:fallback:defaultIntentsPromise:)(v17, v19, v20, v29);
  v32 = (void *)DefaultIntentProvider.defaultIntent()();
  v33 = objc_msgSend(v32, "tag");

  swift_release(v31);
  return v33;
}

unint64_t sub_10000B758()
{
  unint64_t result;

  result = qword_100021810;
  if (!qword_100021810)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100021810);
  }
  return result;
}

unint64_t sub_10000B79C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021818;
  if (!qword_100021818)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100021818);
  }
  return result;
}

uint64_t sub_10000B7D8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000B7FC()
{
  return sub_10000A538();
}

uint64_t sub_10000B814()
{
  _QWORD *v0;

  return sub_10000C2F0(v0);
}

uint64_t sub_10000B82C(_QWORD *a1)
{
  _QWORD *v1;

  return sub_10000C340(a1, v1);
}

uint64_t sub_10000B844()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000B868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_10000C54C(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_10000B870(_QWORD *a1)
{
  uint64_t v1;

  return sub_10000C620(a1, *(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v1 + 16));
}

uint64_t sub_10000B888()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000B8AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10000A3F0(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_10000B8B4()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000B8E0()
{
  uint64_t v0;

  return sub_100009A78(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_10000B8F8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_10000B91C(uint64_t *a1)
{
  uint64_t v1;
  void (*v2)(id, _QWORD);
  id v3;

  v2 = *(void (**)(id, _QWORD))(v1 + 16);
  v3 = sub_100009B04(*a1, a1[1]);
  v2(v3, 0);

}

void sub_10000B964(uint64_t a1)
{
  uint64_t v1;

  sub_100009C60(a1, *(void (**)(id, _QWORD))(v1 + 16));
}

uint64_t sub_10000B96C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t Param;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = type metadata accessor for SearchRequestData(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  Param = type metadata accessor for SearchParsecQueryParam(0);
  v7 = *(_QWORD *)(Param - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v4 + v5 + v8) & ~v8;
  v10 = v9 + *(_QWORD *)(v7 + 64);
  v11 = v3 | v8 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, Param);
  return swift_deallocObject(v0, v10, v11);
}

uint64_t sub_10000BA28()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(type metadata accessor for SearchRequestData(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SearchParsecQueryParam(0) - 8) + 80);
  return sub_100009CF8(*(_QWORD *)(v0 + 16), v0 + v2, v0 + ((v2 + v3 + v4) & ~v4));
}

uint64_t sub_10000BA98(uint64_t a1)
{
  uint64_t v1;

  return sub_100009D7C(a1, *(void (**)(id, _QWORD))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10000BAB0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v1 + 16))(0, a1);
}

uint64_t sub_10000BAD8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000890C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000BB1C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10000890C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000BB58(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000890C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t static Tag.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Int sub_10000BBB4()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_10000BBF4()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_10000BC18(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_10000BC64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v12;
  _QWORD *v13;
  Class isa;
  void *v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  _QWORD v19[5];
  _QWORD *v20;

  v12 = swift_allocObject(&unk_100018E10, 32, 7);
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  swift_retain(a2);
  v13 = sub_10000BDC0(a6);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  sub_10000C0AC();
  v15 = (void *)static OS_dispatch_queue.main.getter();
  v16 = (_QWORD *)swift_allocObject(&unk_100018E38, 48, 7);
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = sub_10000C07C;
  v16[5] = v12;
  v19[4] = sub_10000C114;
  v20 = v16;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 1107296256;
  v19[2] = sub_10000BF6C;
  v19[3] = &unk_100018E50;
  v17 = _Block_copy(v19);
  v18 = v20;
  swift_retain(a4);
  swift_release(v18);
  objc_msgSend(a5, "fetchTagsForTagIDs:qualityOfService:callbackQueue:completionHandler:", isa, 25, v15, v17);
  _Block_release(v17);

}

_QWORD *sub_10000BDC0(uint64_t a1)
{
  int64_t v1;
  _QWORD *v2;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD v9[2];
  _OWORD v10[2];
  _QWORD *v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    v11 = _swiftEmptyArrayStorage;
    sub_10000C9A0(0, v1, 0);
    v2 = _swiftEmptyArrayStorage;
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *v4;
      v9[0] = *(v4 - 1);
      v9[1] = v5;
      swift_bridgeObjectRetain(v5);
      swift_dynamicCast(v10, v9, &type metadata for String, (char *)&type metadata for Any + 8, 7);
      if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
      {
        sub_10000C9A0(0, v2[2] + 1, 1);
        v2 = v11;
      }
      v7 = v2[2];
      v6 = v2[3];
      if (v7 >= v6 >> 1)
      {
        sub_10000C9A0((char *)(v6 > 1), v7 + 1, 1);
        v2 = v11;
      }
      v4 += 2;
      v2[2] = v7 + 1;
      sub_10000C17C(v10, &v2[4 * v7 + 4]);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_10000BEE4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v8;
  unint64_t v9;

  if (a1)
    return a5();
  if (a2)
  {
    v8 = a2;
  }
  else
  {
    v9 = sub_10000C138();
    v8 = swift_allocError(&_s6ErrorsON, v9, 0, 0);
  }
  swift_errorRetain(a2);
  a3(v8);
  return swift_errorRelease(v8);
}

uint64_t sub_10000BF6C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  uint64_t v7;
  id v8;

  v4 = a2;
  v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    v7 = sub_10000890C(&qword_1000218B0);
    v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, &type metadata for String, v7, &protocol witness table for String);
  }
  swift_retain(v5);
  v8 = a3;
  v6(v4, a3);
  swift_release(v5);

  return swift_bridgeObjectRelease(v4);
}

uint64_t sub_10000BFFC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD v4[4];

  v4[2] = *v1;
  v4[3] = a1;
  v2 = sub_10000890C(&qword_1000218A0);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  return Promise.init(resolver:)(sub_10000C050, v4);
}

void sub_10000C050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_10000BC64(a1, a2, a3, a4, *(void **)(v4 + 16), *(_QWORD *)(v4 + 24));
}

uint64_t sub_10000C058()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C07C(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

unint64_t sub_10000C0AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000218A8;
  if (!qword_1000218A8)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000218A8);
  }
  return result;
}

uint64_t sub_10000C0E8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000C114(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10000BEE4(a1, a2, *(void (**)(uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), *(uint64_t (**)(void))(v2 + 32));
}

uint64_t sub_10000C120(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000C130(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_10000C138()
{
  unint64_t result;

  result = qword_1000218B8;
  if (!qword_1000218B8)
  {
    result = swift_getWitnessTable(&unk_100016520, &_s6ErrorsON);
    atomic_store(result, (unint64_t *)&qword_1000218B8);
  }
  return result;
}

_OWORD *sub_10000C17C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t _s6ErrorsOwet(unsigned int *a1, int a2)
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

uint64_t _s6ErrorsOwst(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10000C224 + 4 * byte_100016460[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10000C244 + 4 * byte_100016465[v4]))();
}

_BYTE *sub_10000C224(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10000C244(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000C24C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000C254(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000C25C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000C264(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_10000C270()
{
  return 0;
}

ValueMetadata *_s6ErrorsOMa()
{
  return &_s6ErrorsON;
}

unint64_t sub_10000C28C()
{
  unint64_t result;

  result = qword_1000218C0;
  if (!qword_1000218C0)
  {
    result = swift_getWitnessTable(&unk_1000164F8, &_s6ErrorsON);
    atomic_store(result, (unint64_t *)&qword_1000218C0);
  }
  return result;
}

uint64_t type metadata accessor for Localized()
{
  return objc_opt_self(_TtC16NewsTodayIntentsP33_7AA0C7D6D3FBEAA862D6124FA95FB0119Localized);
}

uint64_t sub_10000C2F0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1[5];
  v2 = a1[6];
  sub_100008994(a1 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
}

uint64_t sub_10000C340(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v28;
  _QWORD v30[4];

  v3 = a2;
  v5 = *a1;
  v4 = a1[1];
  v6 = *(_QWORD *)(*a1 + 16);
  if (v6)
  {
    v30[3] = v2;
    swift_bridgeObjectRetain(v5);
    v28 = v5;
    v7 = (_QWORD *)(v5 + 40);
    v8 = &_swiftEmptyArrayStorage;
    do
    {
      v10 = *(v7 - 1);
      v9 = *v7;
      swift_bridgeObjectRetain(*v7);
      v11 = String._bridgeToObjectiveC()();
      v12 = objc_msgSend(v11, "fc_isValidTagID");

      if (v12)
      {
        v30[0] = v8;
        if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0)
        {
          sub_10000C9BC(0, v8[2] + 1, 1);
          v8 = (_QWORD *)v30[0];
        }
        v14 = v8[2];
        v13 = v8[3];
        if (v14 >= v13 >> 1)
        {
          sub_10000C9BC((char *)(v13 > 1), v14 + 1, 1);
          v8 = (_QWORD *)v30[0];
        }
        v8[2] = v14 + 1;
        v15 = (char *)&v8[2 * v14];
        *((_QWORD *)v15 + 4) = v10;
        *((_QWORD *)v15 + 5) = v9;
      }
      else
      {
        swift_bridgeObjectRelease(v9);
      }
      v7 += 2;
      --v6;
    }
    while (v6);
    v5 = v28;
    swift_bridgeObjectRelease(v28);
    v3 = a2;
  }
  else
  {
    v8 = &_swiftEmptyArrayStorage;
  }
  v30[0] = v5;
  v30[1] = v4;
  v16 = sub_10000890C(&qword_100021A38);
  swift_allocObject(v16, *(unsigned int *)(v16 + 48), *(unsigned __int16 *)(v16 + 52));
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v4);
  v17 = Promise.init(value:)(v30);
  v18 = v3 + 7;
  v20 = v3[10];
  v19 = v3[11];
  sub_100008994(v18, v20);
  v30[0] = v8;
  v21 = (char *)swift_bridgeObjectRetain(v4);
  sub_10000CD94(v21);
  v22 = v30[0];
  v23 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v19 + 8))(v30[0], v20, v19);
  v24 = swift_bridgeObjectRelease(v22);
  v25 = (void *)zalgo.getter(v24);
  v26 = when2<A, B>(on:_:_:)(v25, v17, v23);
  swift_release(v17);
  swift_release(v23);

  return v26;
}

uint64_t sub_10000C54C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v12[3];

  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(a4);
  v8 = sub_10000D158(a1, a3, a4);
  swift_bridgeObjectRelease(a3);
  swift_bridgeObjectRelease(a4);
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(a4);
  v9 = sub_10000D158(a2, a3, a4);
  swift_bridgeObjectRelease(a3);
  swift_bridgeObjectRelease(a4);
  v12[0] = v8;
  v12[1] = v9;
  v10 = sub_10000890C(&qword_100021A30);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  return Promise.init(value:)(v12);
}

uint64_t sub_10000C620(_QWORD *a1, uint64_t (*a2)(_QWORD, _QWORD, _QWORD))
{
  return a2(*a1, a1[1], a1[2]);
}

uint64_t sub_10000C658()
{
  uint64_t v0;

  sub_100008BE0((_QWORD *)(v0 + 16));
  sub_100008BE0((_QWORD *)(v0 + 56));
  return swift_deallocClassInstance(v0, 96, 7);
}

uint64_t type metadata accessor for FollowingTagsService()
{
  return objc_opt_self(_TtC16NewsTodayIntents20FollowingTagsService);
}

uint64_t sub_10000C6A4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *v1;
  v4 = sub_10000890C((uint64_t *)&unk_100021840);
  v5 = firstly<A>(closure:)(sub_10000C7D8, v3, v4);
  v6 = swift_retain(v3);
  v7 = (void *)zalgo.getter(v6);
  v8 = sub_10000890C((uint64_t *)&unk_100021A20);
  v9 = Promise.then<A>(on:closure:)(v7, sub_10000B82C, v3, v8);
  swift_release(v5);
  swift_release(v3);

  v10 = swift_allocObject(&unk_100018F88, 24, 7);
  *(_QWORD *)(v10 + 16) = a1;
  v11 = swift_allocObject(&unk_100018FB0, 32, 7);
  *(_QWORD *)(v11 + 16) = sub_10000B868;
  *(_QWORD *)(v11 + 24) = v10;
  v12 = swift_bridgeObjectRetain(a1);
  v13 = (void *)zalgo.getter(v12);
  v14 = sub_10000890C(&qword_100021820);
  v15 = Promise.then<A>(on:closure:)(v13, sub_10000C86C, v11, v14);
  swift_release(v9);
  swift_release(v11);

  return v15;
}

uint64_t sub_10000C7D8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  sub_100008994(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
}

uint64_t sub_10000C824()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000C848()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C86C(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v1 + 16))(*a1, a1[1], a1[2]);
}

char *sub_10000C8A0(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000890C((uint64_t *)&unk_100021A40);
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
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_10000C9A0(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_10000C9D8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_10000C9BC(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_10000CADC(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_10000C9D8(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000890C(qword_100021A60);
    v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 1;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 5);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[32 * v8])
      memmove(v14, v15, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v14, v15, v8, (char *)&type metadata for Any + 8);
  }
  swift_release(a4);
  return v11;
}

char *sub_10000CADC(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000890C((uint64_t *)&unk_100021A40);
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
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }
  swift_release(a4);
  return v11;
}

uint64_t sub_10000CBDC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v16 = a1;
    else
      v16 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v4 < 0)
    v17 = *v1;
  else
    v17 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v1);
  v5 = _CocoaArrayWrapper.endIndex.getter(v17);
  swift_bridgeObjectRelease(v4);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_29;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if ((unint64_t)v4 >> 62)
    goto LABEL_31;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain(v4);
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v5, v9, 1, v4);
    swift_bridgeObjectRelease(*v1);
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_10000CFC0(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    if (v4 < 0)
      v18 = v4;
    else
      v18 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v9 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(v4);
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
    v15 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v15);
  }
  __break(1u);
  return result;
}

char *sub_10000CD94(char *result)
{
  char **v1;
  uint64_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  int64_t v11;

  v2 = *((_QWORD *)result + 2);
  v3 = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = (char *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)result && v5 <= *((_QWORD *)v3 + 3) >> 1)
  {
    if (*((_QWORD *)v6 + 2))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v11 = v4 + v2;
  else
    v11 = v4;
  result = sub_10000C8A0(result, v11, 1, v3);
  v3 = result;
  if (!*((_QWORD *)v6 + 2))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  v7 = *((_QWORD *)v3 + 2);
  if ((*((_QWORD *)v3 + 3) >> 1) - v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = (char *)swift_arrayInitWithCopy(&v3[16 * v7 + 32], v6 + 32, v2, &type metadata for String);
  if (!v2)
  {
LABEL_14:
    result = (char *)swift_bridgeObjectRelease(v6);
    *v1 = v3;
    return result;
  }
  v8 = *((_QWORD *)v3 + 2);
  v9 = __OFADD__(v8, v2);
  v10 = v8 + v2;
  if (!v9)
  {
    *((_QWORD *)v3 + 2) = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

unint64_t sub_10000CE7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10000CEE0(a1, a2, v5);
}

unint64_t sub_10000CEE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10000CFC0(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t i;
  void (*v13)(_QWORD *);
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17[4];

  v5 = result;
  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v16 = a3;
    else
      v16 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    result = swift_bridgeObjectRelease(a3);
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
      if (a3 < 0)
        v10 = a3;
      else
        v10 = a3 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a3);
      v11 = _CocoaArrayWrapper.endIndex.getter(v10);
      result = swift_bridgeObjectRelease(a3);
      if (v11 <= a2)
      {
        if (v7 >= 1)
        {
          sub_10000D30C();
          swift_bridgeObjectRetain(a3);
          for (i = 0; i != v7; ++i)
          {
            sub_10000890C(&qword_100021A50);
            v13 = sub_10000A8CC(v17, i, a3);
            v15 = *v14;
            swift_unknownObjectRetain(*v14);
            ((void (*)(uint64_t **, _QWORD))v13)(v17, 0);
            *(_QWORD *)(v5 + 8 * i) = v15;
          }
          swift_bridgeObjectRelease(a3);
          return a3;
        }
        goto LABEL_22;
      }
    }
    else
    {
      v8 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v8 <= a2)
      {
        v9 = sub_10000890C(&qword_1000218B0);
        swift_arrayInitWithCopy(v5, (a3 & 0xFFFFFFFFFFFFFF8) + 32, v8, v9);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_10000D158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result;
  uint64_t v5;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  result = &_swiftEmptyArrayStorage;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
    return result;
  swift_bridgeObjectRetain(a1);
  v8 = 0;
  while (1)
  {
    if (!*(_QWORD *)(a2 + 16))
      goto LABEL_4;
    v9 = (uint64_t *)(a1 + 32 + 16 * v8);
    v10 = *v9;
    v11 = v9[1];
    swift_bridgeObjectRetain_n(v11, 2);
    v12 = sub_10000CE7C(v10, v11);
    if ((v13 & 1) != 0)
      break;
    swift_bridgeObjectRelease_n(v11, 2);
LABEL_4:
    if (++v8 == v5)
    {
      swift_bridgeObjectRelease(a1);
      return &_swiftEmptyArrayStorage;
    }
  }
  v14 = *(void **)(*(_QWORD *)(a2 + 56) + 8 * v12);
  swift_unknownObjectRetain(v14);
  swift_bridgeObjectRelease(v11);
  result = objc_msgSend(v14, "tagType");
  v15 = *(_QWORD *)(a3 + 16);
  if (!v15)
    goto LABEL_17;
  if (*(id *)(a3 + 32) == result)
  {
LABEL_9:
    v16 = swift_bridgeObjectRelease(v11);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v16);
    v18 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
    v17 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v18 >= v17 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v17 > 1, v18 + 1, 1);
    v19 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, v14);
    specialized Array._endMutation()(v19);
    goto LABEL_4;
  }
  if (v15 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease(v11);
    swift_unknownObjectRelease(v14);
    goto LABEL_4;
  }
  v20 = 5;
  while (1)
  {
    v21 = v20 - 3;
    if (__OFADD__(v20 - 4, 1))
      break;
    if (*(id *)(a3 + 8 * v20) == result)
      goto LABEL_9;
    ++v20;
    if (v21 == v15)
      goto LABEL_17;
  }
  __break(1u);
  return result;
}

unint64_t sub_10000D30C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021A58;
  if (!qword_100021A58)
  {
    v1 = sub_10000D358(&qword_100021A50);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100021A58);
  }
  return result;
}

uint64_t sub_10000D358(uint64_t *a1)
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

id sub_10000D39C()
{
  void *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSString v8;
  NSString v9;
  id v10;
  id v11;
  NSString v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSString v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v1 = type metadata accessor for Tag();
  v2 = objc_msgSend(v0, "identifier");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  v4 = v3;

  sub_10000D57C();
  v6 = v5;
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v1));
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  v10 = objc_msgSend(v7, "initWithIdentifier:displayString:", v8, v9);

  v11 = objc_msgSend(v0, "groupTitleColor");
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "hex");

    static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
    v15 = v14;

    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v15);
  }
  objc_msgSend(v10, "setNameColorLight:", v12);

  v16 = objc_msgSend(v0, "groupDarkStyleTitleColor");
  v17 = v16;
  if (v16)
  {
    v18 = objc_msgSend(v16, "hex");

    static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    v20 = v19;

    v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v20);
  }
  objc_msgSend(v10, "setNameColorDark:", v17);

  return v10;
}

uint64_t sub_10000D57C()
{
  void *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(v0, "nameCompact");
  if (!v1)
    v1 = objc_msgSend(v0, "name");
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);

  return v2;
}

void sub_10000D5F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  uint64_t v13;

  v8 = swift_allocObject(&unk_100018FE8, 32, 7);
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  v9 = swift_allocObject(&unk_100019010, 32, 7);
  *(_QWORD *)(v9 + 16) = sub_10000D89C;
  *(_QWORD *)(v9 + 24) = v8;
  v12[4] = sub_10000D8CC;
  v13 = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10000D7D4;
  v12[3] = &unk_100019028;
  v10 = _Block_copy(v12);
  v11 = v13;
  swift_retain(a2);
  swift_release(v11);
  objc_msgSend(a5, "peekWithAccessor:", v10);
  _Block_release(v10);
}

uint64_t sub_10000D6D8(void *a1, void (*a2)(uint64_t, _QWORD *))
{
  id v4;
  void *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;

  v4 = objc_msgSend(a1, "autoFavoriteTagIDs");
  if (v4)
  {
    v5 = v4;
    v6 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, &type metadata for String);

  }
  else
  {
    v6 = _swiftEmptyArrayStorage;
  }
  v7 = objc_msgSend(a1, "rankedAllSubscribedTagIDs");
  if (v7)
  {
    v8 = v7;
    v9 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, &type metadata for String);

  }
  else
  {
    v9 = _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain(v6);
  v10 = sub_10000D8EC((uint64_t)v9, v6);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v6);
  a2(v10, v6);
  swift_bridgeObjectRelease(v6);
  return swift_bridgeObjectRelease(v10);
}

uint64_t sub_10000D7D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

uint64_t sub_10000D81C()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD v3[4];

  v3[2] = *v0;
  v1 = sub_10000890C(&qword_100021A38);
  swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  return Promise.init(resolver:)(sub_10000D870, v3);
}

void sub_10000D870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_10000D5F4(a1, a2, a3, a4, *(void **)(v4 + 16));
}

uint64_t sub_10000D878()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000D89C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(_QWORD *);
  _QWORD v5[2];

  v3 = *(uint64_t (**)(_QWORD *))(v2 + 16);
  v5[0] = a1;
  v5[1] = a2;
  return v3(v5);
}

uint64_t sub_10000D8CC(void *a1)
{
  uint64_t v1;

  return sub_10000D6D8(a1, *(void (**)(uint64_t, _QWORD *))(v1 + 16));
}

uint64_t sub_10000D8D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000D8E4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000D8EC(uint64_t result, _QWORD *a2)
{
  unint64_t v2;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;

  v2 = *(_QWORD *)(result + 16);
  if (!v2)
    return (uint64_t)_swiftEmptyArrayStorage;
  v4 = 0;
  v24 = result + 32;
  v22 = a2 + 7;
  v23 = _swiftEmptyArrayStorage;
  do
  {
    if (v4 <= v2)
      v5 = v2;
    else
      v5 = v4;
    v25 = v5;
    while (1)
    {
      if (v4 == v25)
        goto LABEL_33;
      v6 = (_QWORD *)(v24 + 16 * v4);
      v7 = *v6;
      v8 = v6[1];
      ++v4;
      v9 = a2[2];
      if (!v9)
        goto LABEL_24;
      result = a2[4];
      v10 = a2[5];
      if (result != v7 || v10 != v8)
      {
        result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v10, *v6, v6[1], 0);
        if ((result & 1) == 0)
          break;
      }
LABEL_7:
      if (v4 == v2)
        return (uint64_t)v23;
    }
    if (v9 != 1)
    {
      v12 = v22;
      v13 = 1;
      while (1)
      {
        v14 = v13 + 1;
        if (__OFADD__(v13, 1))
          break;
        result = *(v12 - 1);
        v15 = *v12;
        if (result == v7 && v15 == v8)
          goto LABEL_7;
        result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v15, v7, v8, 0);
        if ((result & 1) != 0)
          goto LABEL_7;
        v12 += 2;
        ++v13;
        if (v14 == v9)
          goto LABEL_24;
      }
      __break(1u);
LABEL_33:
      __break(1u);
      return result;
    }
LABEL_24:
    swift_bridgeObjectRetain(v8);
    result = swift_isUniquelyReferenced_nonNull_native(v23);
    v17 = v23;
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_10000C9BC(0, v23[2] + 1, 1);
      v17 = v23;
    }
    v18 = v17;
    v20 = v17[2];
    v19 = v17[3];
    if (v20 >= v19 >> 1)
    {
      result = (uint64_t)sub_10000C9BC((char *)(v19 > 1), v20 + 1, 1);
      v18 = v23;
    }
    v18[2] = v20 + 1;
    v23 = v18;
    v21 = &v18[2 * v20];
    v21[4] = v7;
    v21[5] = v8;
  }
  while (v4 != v2);
  return (uint64_t)v23;
}

uint64_t sub_10000DAB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 16);
}

uint64_t sub_10000DABC(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  return swift_bridgeObjectRelease(a1[1]);
}

_QWORD *sub_10000DAE4(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t *sub_10000DB18(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

__n128 sub_10000DB74(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *sub_10000DB80(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;

  swift_bridgeObjectRelease(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t sub_10000DBBC(uint64_t *a1, int a2)
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

uint64_t sub_10000DC04(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for FollowingResults(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000DC4C(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FollowingResults);
}

uint64_t sub_10000DC4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

char *TagIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), "init");
  v6 = &v5[OBJC_IVAR___TagIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___TagIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

id TagIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TagIntent();
  return objc_msgSendSuper2(&v2, "init");
}

id TagIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntent();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id TagIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
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

id TagIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
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
  v9.super_class = (Class)type metadata accessor for TagIntent();
  v7 = objc_msgSendSuper2(&v9, "initWithIdentifier:backingStore:", v6, a3);

  return v7;
}

id TagIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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

id TagIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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
  v14.super_class = (Class)type metadata accessor for TagIntent();
  v12 = objc_msgSendSuper2(&v14, "initWithDomain:verb:parametersByName:", v9, v10, v11.super.isa);

  return v12;
}

id TagIntent.__deallocating_deinit()
{
  return sub_10000E94C(type metadata accessor for TagIntent);
}

unint64_t TagIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_10000E97C(a1);
}

Swift::Int sub_10000E294()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000E2D8()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000E300(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_10000E340@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_10000E97C(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t TagIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR___TagIntentResponse_code;
  swift_beginAccess(v0 + OBJC_IVAR___TagIntentResponse_code, v3, 0, 0);
  return *(_QWORD *)v1;
}

char *TagIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(v2, "init");
  v6 = &v5[OBJC_IVAR___TagIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___TagIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

uint64_t type metadata accessor for TagIntent()
{
  return objc_opt_self(TagIntent);
}

id TagIntentResponse.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id TagIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___TagIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TagIntentResponse();
  return objc_msgSendSuper2(&v2, "init");
}

id Tag.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithCoder:", a1);

  return v3;
}

id TagIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___TagIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id TagIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithBackingStore:", a1);

  return v3;
}

id TagIntentResponse.init(backingStore:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___TagIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithBackingStore:", a1);

  return v3;
}

id sub_10000E770(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  objc_super v7;

  *(_QWORD *)&a1[OBJC_IVAR___TagIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for TagIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id TagIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
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

id TagIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  NSDictionary v3;
  id v4;
  objc_super v6;

  *(_QWORD *)&v1[OBJC_IVAR___TagIntentResponse_code] = 0;
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
  v6.super_class = (Class)type metadata accessor for TagIntentResponse();
  v4 = objc_msgSendSuper2(&v6, "initWithPropertiesByName:", v3.super.isa);

  if (v4)
  return v4;
}

id TagIntentResponse.__deallocating_deinit()
{
  return sub_10000E94C(type metadata accessor for TagIntentResponse);
}

id sub_10000E94C(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

unint64_t sub_10000E97C(unint64_t result)
{
  if (result > 6)
    return 0;
  return result;
}

uint64_t type metadata accessor for TagIntentResponse()
{
  return objc_opt_self(TagIntentResponse);
}

unint64_t sub_10000E9B0()
{
  unint64_t result;

  result = qword_100021AF8;
  if (!qword_100021AF8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TagIntentResponseCode, &type metadata for TagIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_100021AF8);
  }
  return result;
}

uint64_t sub_10000E9F4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___TagIntentResponse_code);
  result = swift_beginAccess(v3, v5, 0, 0);
  *a2 = *v3;
  return result;
}

uint64_t sub_10000EA44(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___TagIntentResponse_code);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for TagIntentResponseCode()
{
  return &type metadata for TagIntentResponseCode;
}

char *TodayIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), "init");
  v6 = &v5[OBJC_IVAR___TodayIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___TodayIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

id TodayIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TodayIntent();
  return objc_msgSendSuper2(&v2, "init");
}

id TodayIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntent();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id TodayIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
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
  v9.super_class = (Class)type metadata accessor for TodayIntent();
  v7 = objc_msgSendSuper2(&v9, "initWithIdentifier:backingStore:", v6, a3);

  return v7;
}

id TodayIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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
  v14.super_class = (Class)type metadata accessor for TodayIntent();
  v12 = objc_msgSendSuper2(&v14, "initWithDomain:verb:parametersByName:", v9, v10, v11.super.isa);

  return v12;
}

id TodayIntent.__deallocating_deinit()
{
  return sub_10000E94C(type metadata accessor for TodayIntent);
}

uint64_t TodayIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR___TodayIntentResponse_code;
  swift_beginAccess(v0 + OBJC_IVAR___TodayIntentResponse_code, v3, 0, 0);
  return *(_QWORD *)v1;
}

char *TodayIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(v2, "init");
  v6 = &v5[OBJC_IVAR___TodayIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___TodayIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

uint64_t type metadata accessor for TodayIntent()
{
  return objc_opt_self(TodayIntent);
}

id TodayIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TodayIntentResponse();
  return objc_msgSendSuper2(&v2, "init");
}

id TodayIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id TodayIntentResponse.init(backingStore:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithBackingStore:", a1);

  return v3;
}

id sub_10000F2C4(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  objc_super v7;

  *(_QWORD *)&a1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for TodayIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id TodayIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  NSDictionary v3;
  id v4;
  objc_super v6;

  *(_QWORD *)&v1[OBJC_IVAR___TodayIntentResponse_code] = 0;
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
  v6.super_class = (Class)type metadata accessor for TodayIntentResponse();
  v4 = objc_msgSendSuper2(&v6, "initWithPropertiesByName:", v3.super.isa);

  if (v4)
  return v4;
}

id TodayIntentResponse.__deallocating_deinit()
{
  return sub_10000E94C(type metadata accessor for TodayIntentResponse);
}

uint64_t type metadata accessor for TodayIntentResponse()
{
  return objc_opt_self(TodayIntentResponse);
}

unint64_t sub_10000F444()
{
  unint64_t result;

  result = qword_100021B58;
  if (!qword_100021B58)
  {
    result = swift_getWitnessTable("!*", &type metadata for TodayIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_100021B58);
  }
  return result;
}

uint64_t sub_10000F488@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___TodayIntentResponse_code);
  result = swift_beginAccess(v3, v5, 0, 0);
  *a2 = *v3;
  return result;
}

uint64_t sub_10000F4D8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___TodayIntentResponse_code);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for TodayIntentResponseCode()
{
  return &type metadata for TodayIntentResponseCode;
}

id Tag.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
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

id Tag.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
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
  v15.super_class = (Class)type metadata accessor for Tag();
  v13 = objc_msgSendSuper2(&v15, "initWithIdentifier:displayString:pronunciationHint:", v10, v11, v12);

  return v13;
}

uint64_t type metadata accessor for Tag()
{
  return objc_opt_self(Tag);
}

id Tag.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Tag();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id Tag.__deallocating_deinit()
{
  return sub_10000E94C(type metadata accessor for Tag);
}

id static TagResolutionResult.success(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  return objc_msgSendSuper2(&v4, "successWithResolvedObject:", a1);
}

id static TagResolutionResult.disambiguation(with:)(uint64_t a1)
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
    v10 = sub_10000F9BC();
    swift_bridgeObjectRetain(v3);
    v11 = _bridgeCocoaArray<A>(_:)(v9, v10);
    swift_bridgeObjectRelease(v3);
    v3 = v11;
  }
  else
  {
    v4 = swift_bridgeObjectRetain(a1);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v4);
    sub_10000F9BC();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v2);
  sub_10000F9BC();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  v12.receiver = ObjCClassFromMetadata;
  v12.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  v7 = objc_msgSendSuper2(&v12, "disambiguationWithObjectsToDisambiguate:", isa);

  return v7;
}

unint64_t sub_10000F9BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021BD8;
  if (!qword_100021BD8)
  {
    v1 = objc_opt_self(INObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100021BD8);
  }
  return result;
}

id static TagResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  return objc_msgSendSuper2(&v4, "confirmationRequiredWithObjectToConfirm:", a1);
}

void static TagResolutionResult.success(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "NewsTodayIntents/Tag.swift", 26, 2, 50, 0);
  __break(1u);
}

void static TagResolutionResult.disambiguation(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "NewsTodayIntents/Tag.swift", 26, 2, 55, 0);
  __break(1u);
}

void static TagResolutionResult.confirmationRequired(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "NewsTodayIntents/Tag.swift", 26, 2, 60, 0);
  __break(1u);
}

id TagResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
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

id TagResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  Class isa;
  id v6;
  id v7;
  objc_super v9;

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for TagResolutionResult();
  v6 = objc_msgSendSuper2(&v9, "initWithJSONDictionary:forIntent:", isa, a2);

  v7 = v6;
  if (v7)

  return v7;
}

uint64_t type metadata accessor for TagResolutionResult()
{
  return objc_opt_self(TagResolutionResult);
}

id TagResolutionResult.__deallocating_deinit()
{
  return sub_10000E94C(type metadata accessor for TagResolutionResult);
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterIsMember:");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_compare_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:range:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_fastestEncoding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fastestEncoding");
}

id objc_msgSend_fr_accessibilityApplyLowerPitchTokenToRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fr_accessibilityApplyLowerPitchTokenToRange:");
}

id objc_msgSend_fr_stringByDecodingHTMLEntities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fr_stringByDecodingHTMLEntities");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAtEnd");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_parse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parse");
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanHexInt:");
}

id objc_msgSend_scanInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanInt:");
}

id objc_msgSend_scanLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanLocation");
}

id objc_msgSend_scanString_intoString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanString:intoString:");
}

id objc_msgSend_scanUpToString_intoString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanUpToString:intoString:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_setAttributes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:range:");
}

id objc_msgSend_setCharactersToBeSkipped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCharactersToBeSkipped:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "string");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_strings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "strings");
}

id objc_msgSend_strippedString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "strippedString");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitespaceCharacterSet");
}
