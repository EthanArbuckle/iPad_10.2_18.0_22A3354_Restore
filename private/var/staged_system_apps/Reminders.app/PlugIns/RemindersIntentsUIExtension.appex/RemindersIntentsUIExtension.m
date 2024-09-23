uint64_t *sub_100005CC4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, _QWORD, uint64_t);
  void *v39;
  char *v40;
  void *v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  uint64_t v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _BOOL8 v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t *v60;
  int64_t v61;
  uint64_t *v62;
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
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t *result;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  uint64_t v86;
  __int128 v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  uint64_t v91;
  char *v92;
  char *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  int *v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t *v111;

  v2 = sub_10000EFCC(&qword_10002E600);
  __chkstk_darwin(v2);
  v109 = (uint64_t)&v83 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for TTRIIntentsSnippetSection(0);
  v105 = *(_QWORD *)(v4 - 8);
  v106 = v4;
  __chkstk_darwin(v4);
  v6 = (uint64_t *)((char *)&v83 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = type metadata accessor for Calendar(0);
  v98 = *(_QWORD *)(v7 - 8);
  v99 = v7;
  __chkstk_darwin(v7);
  v97 = (char *)&v83 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DateComponents(0);
  v95 = *(_QWORD *)(v9 - 8);
  v96 = v9;
  __chkstk_darwin(v9);
  v94 = (char *)&v83 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Date(0);
  v102 = *(_QWORD *)(v11 - 8);
  v103 = v11;
  __chkstk_darwin(v11);
  v93 = (char *)&v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_10000EFCC(&qword_10002E070);
  v86 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v15 = (char *)&v83 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = (uint64_t *)&_swiftEmptyDictionarySingleton;
  if ((unint64_t)a1 >> 62)
  {
LABEL_27:
    if (a1 < 0)
      v57 = a1;
    else
      v57 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v16 = _CocoaArrayWrapper.endIndex.getter(v57);
    v104 = v6;
    if (v16)
      goto LABEL_3;
  }
  else
  {
    v16 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(a1);
    v104 = v6;
    if (v16)
    {
LABEL_3:
      v84 = v13;
      v101 = a1 & 0xC000000000000001;
      v90 = enum case for Calendar.Component.year(_:);
      v89 = enum case for Calendar.Component.month(_:);
      v88 = enum case for Calendar.Component.day(_:);
      v17 = (uint64_t *)&_swiftEmptyDictionarySingleton;
      v18 = 4;
      v85 = xmmword_100022910;
      v87 = xmmword_100022900;
      v100 = a1;
      v92 = v15;
      v91 = v16;
      v13 = (uint64_t)v97;
      while (1)
      {
        v23 = v18 - 4;
        if (v101)
        {
          v24 = (int *)specialized _ArrayBuffer._getElementSlowPath(_:)(v18 - 4, a1);
          v25 = v18 - 3;
          if (__OFADD__(v23, 1))
            goto LABEL_24;
        }
        else
        {
          v24 = (int *)*(id *)(a1 + 8 * v18);
          v25 = v18 - 3;
          if (__OFADD__(v23, 1))
          {
LABEL_24:
            __break(1u);
LABEL_25:
            __break(1u);
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
        }
        v107 = v25;
        v108 = v24;
        v26 = objc_msgSend(v24, "displayDate");
        if (v26)
        {
          v27 = v26;
          v28 = objc_msgSend(v26, "date");

          v29 = v93;
          static Date._unconditionallyBridgeFromObjectiveC(_:)(v28);

          ((void (*)(void))static Calendar.current.getter)();
          v30 = sub_10000EFCC(&qword_10002E080);
          v31 = type metadata accessor for Calendar.Component(0);
          v32 = *(_QWORD *)(v31 - 8);
          v33 = *(_QWORD *)(v32 + 72);
          v34 = *(unsigned __int8 *)(v32 + 80);
          v35 = (v34 + 32) & ~v34;
          v36 = swift_allocObject(v30, v35 + 3 * v33, v34 | 7);
          *(_OWORD *)(v36 + 16) = v87;
          v37 = v36 + v35;
          v38 = *(void (**)(uint64_t, _QWORD, uint64_t))(v32 + 104);
          v38(v37, v90, v31);
          v38(v37 + v33, v89, v31);
          v38(v37 + 2 * v33, v88, v31);
          v39 = sub_100010EE4(v36);
          swift_setDeallocating(v36);
          swift_arrayDestroy(v37, 3, v31);
          swift_deallocClassInstance(v36, 32, 7);
          v40 = v94;
          Calendar.dateComponents(_:from:)(v39, v29);
          v41 = v39;
          v15 = v92;
          swift_bridgeObjectRelease(v41);
          a1 = v99;
          v42 = *(uint64_t (**)(uint64_t, uint64_t))(v98 + 8);
          v43 = v42(v13, v99);
          static Calendar.current.getter(v43);
          Calendar.date(from:)(v40);
          v42(v13, a1);
          (*(void (**)(char *, uint64_t))(v95 + 8))(v40, v96);
          v44 = v29;
          v16 = v91;
          (*(void (**)(char *, uint64_t))(v102 + 8))(v44, v103);
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v102 + 56))(v15, 1, 1, v103);
        }
        v6 = v17;
        v46 = sub_100007F48((uint64_t)v15);
        v47 = v17[2];
        v48 = (v45 & 1) == 0;
        v49 = v47 + v48;
        if (__OFADD__(v47, v48))
          goto LABEL_25;
        a1 = v45;
        if (v17[3] < v49)
        {
          sub_1000085AC(v49, 1);
          v17 = v111;
          v50 = sub_100007F48((uint64_t)v15);
          if ((a1 & 1) != (v51 & 1))
          {
            KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v84);
            __break(1u);
            result = (uint64_t *)swift_release(v111);
            __break(1u);
            return result;
          }
          v46 = v50;
        }
        if ((a1 & 1) != 0)
        {
          v19 = sub_100013834((uint64_t)v15, &qword_10002E070);
          v17 = v111;
          v6 = (uint64_t *)(v111[7] + 8 * v46);
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v19);
          v21 = *(_QWORD *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
          v20 = *(_QWORD *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x18);
          if (v21 >= v20 >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v20 > 1, v21 + 1, 1);
          v22 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v21, v108);
          specialized Array._endMutation()(v22);
        }
        else
        {
          v52 = sub_10000EFCC(&qword_10002E058);
          v53 = swift_allocObject(v52, 40, 7);
          *(_OWORD *)(v53 + 16) = v85;
          *(_QWORD *)(v53 + 32) = v108;
          v110 = (uint64_t *)v53;
          specialized Array._endMutation()(v53);
          v6 = v110;
          v17[(v46 >> 6) + 8] |= 1 << v46;
          sub_1000137AC((uint64_t)v15, v17[6] + *(_QWORD *)(v86 + 72) * v46, &qword_10002E070);
          *(_QWORD *)(v17[7] + 8 * v46) = v6;
          v54 = v17[2];
          v55 = __OFADD__(v54, 1);
          v56 = v54 + 1;
          if (v55)
            goto LABEL_26;
          v17[2] = v56;
        }
        a1 = v100;
        ++v18;
        if (v107 == v16)
        {
          swift_bridgeObjectRelease(v100);
          goto LABEL_32;
        }
      }
    }
  }
  swift_bridgeObjectRelease(a1);
  v17 = (uint64_t *)&_swiftEmptyDictionarySingleton;
LABEL_32:
  v58 = swift_bridgeObjectRetain(v17);
  v59 = sub_1000092D8(v58);
  swift_release(v17);
  v111 = v59;
  sub_1000090F8(&v111);
  swift_release(v17);
  v60 = v111;
  v61 = v111[2];
  if (v61)
  {
    v111 = _swiftEmptyArrayStorage;
    sub_10000D5A0(0, v61, 0);
    v62 = v111;
    v63 = sub_10000EFCC(&qword_10002E078);
    v64 = *(_QWORD *)(v63 - 8);
    v65 = *(unsigned __int8 *)(v64 + 80);
    v101 = (unint64_t)v60;
    v66 = (uint64_t)v60 + ((v65 + 32) & ~v65);
    v107 = *(_QWORD *)(v64 + 72);
    v108 = (int *)v63;
    LODWORD(v103) = enum case for REMNavigationSpecifier.SmartListPathSpecifier.showContents(_:);
    LODWORD(v102) = enum case for REMNavigationSpecifier.scheduled(_:);
    do
    {
      v67 = *(_QWORD *)(v66 + v108[12]);
      v68 = sub_100011490(v66);
      v70 = v69;
      v71 = type metadata accessor for REMNavigationSpecifier.SmartListPathSpecifier(0);
      v72 = v109;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v71 - 8) + 104))(v109, v103, v71);
      v73 = type metadata accessor for REMNavigationSpecifier(0);
      v74 = *(_QWORD *)(v73 - 8);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v74 + 104))(v72, v102, v73);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v74 + 56))(v72, 0, 1, v73);
      if (v67 < 0 || (v67 & 0x4000000000000000) != 0)
      {
        v81 = swift_bridgeObjectRetain(v67);
        v75 = (uint64_t)sub_1000091E4(v81);
        swift_bridgeObjectRelease(v67);
      }
      else
      {
        v75 = v67 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v67);
      }
      v110 = (uint64_t *)v75;
      sub_100009080((uint64_t *)&v110);
      v76 = (uint64_t)v104;
      v77 = (uint64_t)v110;
      *v104 = v68;
      *(_QWORD *)(v76 + 8) = v70;
      v78 = v106;
      sub_1000137AC(v109, v76 + *(int *)(v106 + 20), &qword_10002E600);
      *(_QWORD *)(v76 + *(int *)(v78 + 24)) = v77;
      v111 = v62;
      v80 = v62[2];
      v79 = v62[3];
      if (v80 >= v79 >> 1)
      {
        sub_10000D5A0(v79 > 1, v80 + 1, 1);
        v62 = v111;
      }
      v62[2] = v80 + 1;
      sub_10000F00C(v76, (uint64_t)v62+ ((*(unsigned __int8 *)(v105 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v105 + 80))+ *(_QWORD *)(v105 + 72) * v80);
      v66 += v107;
      --v61;
    }
    while (v61);
    swift_release(v101);
  }
  else
  {
    swift_release(v111);
    return _swiftEmptyArrayStorage;
  }
  return v62;
}

uint64_t sub_10000653C(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  char *v44;
  char v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  _BOOL8 v52;
  int64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  Swift::String v70;
  Swift::String v71;
  Swift::String v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v78;
  unint64_t v79;
  char v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  Swift::String *v94;
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
  unsigned int (*v108)(uint64_t, uint64_t, uint64_t);
  _QWORD *v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v118;
  unint64_t v119;
  uint64_t result;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  Swift::String *v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  __int128 v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t *v149;

  v2 = type metadata accessor for TTRIIntentsSnippetSection(0);
  v3 = *(char **)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (uint64_t *)((char *)&v122 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = __chkstk_darwin(v4);
  v131 = (uint64_t)&v122 - v8;
  __chkstk_darwin(v7);
  v127 = (Swift::String *)((char *)&v122 - v9);
  v10 = sub_10000EFCC(&qword_10002E600);
  v11 = __chkstk_darwin(v10);
  v125 = (uint64_t)&v122 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v126 = (uint64_t)&v122 - v14;
  __chkstk_darwin(v13);
  v124 = (char *)&v122 - v15;
  v16 = type metadata accessor for Calendar(0);
  v138 = *(_QWORD *)(v16 - 8);
  v139 = v16;
  __chkstk_darwin(v16);
  v137 = (char *)&v122 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for Date(0);
  v142 = *(_QWORD *)(v18 - 8);
  v19 = __chkstk_darwin(v18);
  v146 = (char *)&v122 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __chkstk_darwin(v19);
  v141 = (char *)&v122 - v22;
  __chkstk_darwin(v21);
  v24 = (char *)&v122 - v23;
  v130 = sub_10000EFCC(&qword_10002E050);
  v129 = *(_QWORD *)(v130 - 8);
  v25 = __chkstk_darwin(v130);
  v133 = (uint64_t)&v122 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __chkstk_darwin(v25);
  v134 = (uint64_t)&v122 - v28;
  v29 = __chkstk_darwin(v27);
  v31 = (unint64_t)&v122 - v30;
  __chkstk_darwin(v29);
  v136 = (uint64_t)&v122 - v32;
  v149 = _swiftEmptyDictionarySingleton;
  if ((unint64_t)a1 >> 62)
  {
LABEL_53:
    if (a1 < 0)
      v121 = a1;
    else
      v121 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v33 = _CocoaArrayWrapper.endIndex.getter(v121);
  }
  else
  {
    v33 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(a1);
  }
  v135 = v31;
  v132 = v6;
  v128 = v3;
  if (v33)
  {
    v123 = v2;
    v145 = a1 & 0xC000000000000001;
    v34 = _swiftEmptyDictionarySingleton;
    v2 = 4;
    v140 = xmmword_100022910;
    v143 = v33;
    v144 = a1;
    v3 = v146;
    do
    {
      if (v145)
        v38 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v2 - 4, a1);
      else
        v38 = *(id *)(a1 + 8 * v2);
      a1 = (uint64_t)v38;
      v39 = v2 - 3;
      if (__OFADD__(v2 - 4, 1))
      {
        __break(1u);
LABEL_51:
        __break(1u);
LABEL_52:
        __break(1u);
        goto LABEL_53;
      }
      v40 = objc_msgSend(v38, "displayDate");
      v41 = v40;
      if (v40)
      {
        v147 = a1;
        v42 = objc_msgSend(v40, "date");

        static Date._unconditionallyBridgeFromObjectiveC(_:)(v42);
        v43 = v18;
        v44 = v141;
        Date.init()();
        v45 = static Date.< infix(_:_:)(v24, v44);
        v46 = v142;
        v47 = *(void (**)(char *, uint64_t))(v142 + 8);
        v48 = v44;
        v18 = v43;
        v47(v48, v43);
        (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v3, v24, v43);
        if ((v45 & 1) != 0)
        {
          LOBYTE(v41) = 1;
        }
        else
        {
          v41 = objc_msgSend((id)objc_opt_self(NSCalendar), "currentCalendar");
          v49 = v137;
          static Calendar._unconditionallyBridgeFromObjectiveC(_:)();

          LOBYTE(v41) = Calendar.isDateInToday(_:)(v3);
          (*(void (**)(char *, uint64_t))(v138 + 8))(v49, v139);
        }
        v47(v3, v43);
        v47(v24, v43);
        a1 = v147;
      }
      v6 = v34;
      v31 = sub_1000080C0(v41 & 1);
      v51 = v34[2];
      v52 = (v50 & 1) == 0;
      v53 = v51 + v52;
      if (__OFADD__(v51, v52))
        goto LABEL_51;
      v3 = v50;
      if (v34[3] < v53)
      {
        sub_10000880C(v53, 1);
        v34 = v149;
        v53 = sub_1000080C0(v41 & 1);
        if ((v3 & 1) != (v54 & 1))
        {
          result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Bool);
          __break(1u);
          return result;
        }
        v31 = v53;
      }
      if ((v3 & 1) != 0)
      {
        v6 = (uint64_t *)(v34[7] + 8 * v31);
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v53);
        v36 = *(_QWORD *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v35 = *(_QWORD *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v36 >= v35 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v35 > 1, v36 + 1, 1);
        v37 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v36, a1);
        specialized Array._endMutation()(v37);
      }
      else
      {
        v55 = sub_10000EFCC(&qword_10002E058);
        v56 = swift_allocObject(v55, 40, 7);
        *(_OWORD *)(v56 + 16) = v140;
        *(_QWORD *)(v56 + 32) = a1;
        v148 = v56;
        v6 = &v148;
        specialized Array._endMutation()(v56);
        v57 = v148;
        v34[(v31 >> 6) + 8] |= 1 << v31;
        *(_BYTE *)(v34[6] + v31) = v41 & 1;
        *(_QWORD *)(v34[7] + 8 * v31) = v57;
        v58 = v34[2];
        v59 = __OFADD__(v58, 1);
        v60 = v58 + 1;
        if (v59)
          goto LABEL_52;
        v34[2] = v60;
      }
      v3 = v146;
      ++v2;
      a1 = v144;
    }
    while (v39 != v143);
    swift_bridgeObjectRelease(v144);
    v3 = v128;
    v2 = v123;
    if (v34[2])
      goto LABEL_28;
  }
  else
  {
    swift_bridgeObjectRelease(a1);
    v34 = _swiftEmptyDictionarySingleton;
    if (_swiftEmptyDictionarySingleton[2])
    {
LABEL_28:
      v61 = sub_1000080C0(1);
      if ((v62 & 1) != 0)
      {
        v63 = *(_QWORD *)(v34[7] + 8 * v61);
        v64 = enum case for REMNavigationSpecifier.SmartListPathSpecifier.showContents(_:);
        v65 = type metadata accessor for REMNavigationSpecifier.SmartListPathSpecifier(0);
        v66 = (uint64_t)v124;
        (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 104))(v124, v64, v65);
        v67 = enum case for REMNavigationSpecifier.today(_:);
        v68 = type metadata accessor for REMNavigationSpecifier(0);
        v69 = *(_QWORD *)(v68 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v69 + 104))(v66, v67, v68);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v69 + 56))(v66, 0, 1, v68);
        swift_bridgeObjectRetain(v63);
        v70._object = (void *)0x8000000100024F30;
        v71._countAndFlagsBits = 0x7961646F54;
        v71._object = (void *)0xE500000000000000;
        v70._countAndFlagsBits = 0xD000000000000010;
        v72 = TTRLocalizedString(_:comment:)(v71, v70);
        v73 = v126;
        sub_1000137F0(v66, v126, &qword_10002E600);
        v74 = (uint64_t)v127;
        *v127 = v72;
        sub_1000137F0(v73, v74 + *(int *)(v2 + 20), &qword_10002E600);
        v75 = sub_1000103C0(v63, (uint64_t *)sub_100010CA8, 0);
        sub_100013834(v73, &qword_10002E600);
        *(_QWORD *)(v74 + *(int *)(v2 + 24)) = v75;
        v76 = v136;
        sub_10000F00C(v74, v136);
        sub_100013834(v66, &qword_10002E600);
        v77 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))*((_QWORD *)v3 + 7);
        v77(v76, 0, 1, v2);
        swift_bridgeObjectRelease(v63);
        goto LABEL_31;
      }
    }
  }
  v77 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))*((_QWORD *)v3 + 7);
  v77(v136, 1, 1, v2);
LABEL_31:
  v78 = (uint64_t)v132;
  if (v34[2] && (v79 = sub_1000080C0(0), (v80 & 1) != 0))
  {
    v81 = *(_QWORD *)(v34[7] + 8 * v79);
    swift_bridgeObjectRetain(v81);
    swift_release(v34);
    v82 = enum case for REMNavigationSpecifier.SmartListPathSpecifier.showContents(_:);
    v83 = type metadata accessor for REMNavigationSpecifier.SmartListPathSpecifier(0);
    v84 = v126;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v83 - 8) + 104))(v126, v82, v83);
    v85 = enum case for REMNavigationSpecifier.today(_:);
    v86 = type metadata accessor for REMNavigationSpecifier(0);
    v87 = *(_QWORD *)(v86 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v87 + 104))(v84, v85, v86);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v87 + 56))(v84, 0, 1, v86);
    v88 = swift_bridgeObjectRetain(v81);
    v89 = static TTRLocalizableStrings.TodayList.nearbySectionName.getter(v88);
    v91 = v90;
    v92 = v78;
    v93 = v125;
    sub_1000137F0(v84, v125, &qword_10002E600);
    v94 = v127;
    v127->_countAndFlagsBits = v89;
    v94->_object = v91;
    sub_1000137F0(v93, (uint64_t)v94 + *(int *)(v2 + 20), &qword_10002E600);
    v95 = sub_1000103C0(v81, 0, 0);
    swift_bridgeObjectRelease(v81);
    v96 = v93;
    v78 = v92;
    v3 = v128;
    sub_100013834(v96, &qword_10002E600);
    *(uint64_t *)((char *)&v94->_countAndFlagsBits + *(int *)(v2 + 24)) = v95;
    v97 = (uint64_t)v94;
    v98 = v135;
    sub_10000F00C(v97, v135);
    sub_100013834(v84, &qword_10002E600);
    v77(v98, 0, 1, v2);
    swift_bridgeObjectRelease(v81);
  }
  else
  {
    swift_release(v34);
    v98 = v135;
    v77(v135, 1, 1, v2);
  }
  v99 = sub_10000EFCC(&qword_10002E060);
  v100 = *(_QWORD *)(v129 + 72);
  v101 = *(unsigned __int8 *)(v129 + 80);
  v102 = (v101 + 32) & ~v101;
  v103 = swift_allocObject(v99, v102 + 2 * v100, v101 | 7);
  *(_OWORD *)(v103 + 16) = xmmword_100022920;
  v104 = v103 + v102;
  sub_1000137F0(v136, v104, &qword_10002E050);
  v105 = v104 + v100;
  sub_1000137F0(v98, v105, &qword_10002E050);
  v106 = v134;
  sub_1000137F0(v104, v134, &qword_10002E050);
  v107 = v133;
  sub_1000137AC(v106, v133, &qword_10002E050);
  v108 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))*((_QWORD *)v3 + 6);
  if (v108(v107, 1, v2) == 1)
  {
    sub_100013834(v107, &qword_10002E050);
    v109 = _swiftEmptyArrayStorage;
  }
  else
  {
    v110 = v131;
    sub_10000F00C(v107, v131);
    sub_10000F00C(v110, v78);
    v109 = _swiftEmptyArrayStorage;
    if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0)
      v109 = (_QWORD *)sub_10001F18C(0, _swiftEmptyArrayStorage[2] + 1, 1, (unint64_t)_swiftEmptyArrayStorage);
    v112 = v109[2];
    v111 = v109[3];
    if (v112 >= v111 >> 1)
      v109 = (_QWORD *)sub_10001F18C(v111 > 1, v112 + 1, 1, (unint64_t)v109);
    v109[2] = v112 + 1;
    sub_10000F00C(v78, (uint64_t)v109+ ((v3[80] + 32) & ~(unint64_t)v3[80])+ *((_QWORD *)v3 + 9) * v112);
    v107 = v133;
  }
  v113 = v105;
  v114 = v134;
  sub_1000137F0(v113, v134, &qword_10002E050);
  sub_1000137AC(v114, v107, &qword_10002E050);
  if (v108(v107, 1, v2) == 1)
  {
    sub_100013834(v107, &qword_10002E050);
    v115 = v135;
  }
  else
  {
    v116 = v131;
    sub_10000F00C(v107, v131);
    sub_10000F00C(v116, v78);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v109);
    v115 = v135;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v109 = (_QWORD *)sub_10001F18C(0, v109[2] + 1, 1, (unint64_t)v109);
    v119 = v109[2];
    v118 = v109[3];
    if (v119 >= v118 >> 1)
      v109 = (_QWORD *)sub_10001F18C(v118 > 1, v119 + 1, 1, (unint64_t)v109);
    v109[2] = v119 + 1;
    sub_10000F00C(v78, (uint64_t)v109+ ((v3[80] + 32) & ~(unint64_t)v3[80])+ *((_QWORD *)v3 + 9) * v119);
  }
  swift_setDeallocating(v103);
  swift_arrayDestroy(v104, *(_QWORD *)(v103 + 16), v130);
  swift_deallocClassInstance(v103, 32, 7);
  sub_100013834(v115, &qword_10002E050);
  sub_100013834(v136, &qword_10002E050);
  return (uint64_t)v109;
}

_QWORD *sub_100007140(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  int64_t v40;
  uint64_t *v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  _QWORD *result;
  uint64_t v64;
  _QWORD *v65;
  unsigned int v66;
  __int128 v67;
  char *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  unint64_t v73;
  uint64_t v74;
  _QWORD *v75;

  v2 = sub_10000EFCC(&qword_10002E600);
  __chkstk_darwin(v2);
  v68 = (char *)&v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for TTRIIntentsSnippetSection(0);
  v70 = *(_QWORD *)(v4 - 8);
  v71 = v4;
  v5 = __chkstk_darwin(v4);
  v69 = (uint64_t *)((char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v5);
  v72 = (char *)&v65 - v7;
  v75 = &_swiftEmptyDictionarySingleton;
  if ((unint64_t)a1 >> 62)
  {
LABEL_22:
    if (a1 < 0)
      v36 = a1;
    else
      v36 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v8 = _CocoaArrayWrapper.endIndex.getter(v36);
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(a1);
    if (v8)
    {
LABEL_3:
      v73 = a1 & 0xC000000000000001;
      v9 = &_swiftEmptyDictionarySingleton;
      v10 = 4;
      v67 = xmmword_100022910;
      while (1)
      {
        if (v73)
          v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v10 - 4, a1);
        else
          v16 = *(id *)(a1 + 8 * v10);
        v17 = v16;
        v18 = v10 - 3;
        if (__OFADD__(v10 - 4, 1))
        {
          __break(1u);
LABEL_20:
          __break(1u);
LABEL_21:
          __break(1u);
          goto LABEL_22;
        }
        v19 = v8;
        v20 = objc_msgSend(v16, "list");
        v22 = sub_100008118((uint64_t)v20);
        v23 = v9[2];
        v24 = (v21 & 1) == 0;
        v25 = v23 + v24;
        if (__OFADD__(v23, v24))
          goto LABEL_20;
        v26 = v21;
        if (v9[3] < v25)
        {
          sub_100008ADC(v25, 1);
          v9 = v75;
          v27 = sub_100008118((uint64_t)v20);
          if ((v26 & 1) != (v28 & 1))
          {
            v64 = sub_100013968(0, &qword_10002E0E8, REMList_ptr);
            KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v64);
            __break(1u);
            result = (_QWORD *)swift_release(v75);
            __break(1u);
            return result;
          }
          v22 = v27;
        }
        if ((v26 & 1) != 0)
        {

          v11 = (_QWORD *)(v9[7] + 8 * v22);
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v12);
          v14 = *(_QWORD *)((*v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
          v13 = *(_QWORD *)((*v11 & 0xFFFFFFFFFFFFFF8) + 0x18);
          if (v14 >= v13 >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v14 + 1, 1);
          v15 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v14, v17);
          specialized Array._endMutation()(v15);
        }
        else
        {
          v29 = sub_10000EFCC(&qword_10002E058);
          v30 = swift_allocObject(v29, 40, 7);
          *(_OWORD *)(v30 + 16) = v67;
          *(_QWORD *)(v30 + 32) = v17;
          v74 = v30;
          specialized Array._endMutation()(v30);
          v31 = v74;
          v9[(v22 >> 6) + 8] |= 1 << v22;
          v32 = 8 * v22;
          *(_QWORD *)(v9[6] + v32) = v20;
          *(_QWORD *)(v9[7] + v32) = v31;
          v33 = v9[2];
          v34 = __OFADD__(v33, 1);
          v35 = v33 + 1;
          if (v34)
            goto LABEL_21;
          v9[2] = v35;
        }
        v8 = v19;
        ++v10;
        if (v18 == v19)
          goto LABEL_27;
      }
    }
  }
  v9 = &_swiftEmptyDictionarySingleton;
LABEL_27:
  swift_bridgeObjectRelease(a1);
  v37 = swift_bridgeObjectRetain(v9);
  v38 = sub_100009410(v37);
  swift_release(v9);
  v75 = v38;
  sub_10000917C(&v75);
  swift_release(v9);
  v39 = v75;
  v40 = v75[2];
  if (v40)
  {
    v75 = _swiftEmptyArrayStorage;
    sub_10000D5A0(0, v40, 0);
    v73 = (unint64_t)v75;
    LODWORD(v67) = enum case for REMNavigationSpecifier.ListPathSpecifier.showContents(_:);
    v65 = v39;
    v41 = v39 + 5;
    v66 = enum case for REMNavigationSpecifier.list(_:);
    do
    {
      v42 = *v41;
      v43 = (id)*(v41 - 1);
      swift_bridgeObjectRetain(v42);
      v44 = objc_msgSend(v43, "displayName");
      v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(v44);
      v47 = v46;

      v48 = sub_10000EFCC(&qword_10002E0E0);
      v49 = v68;
      v50 = &v68[*(int *)(v48 + 48)];
      *v49 = objc_msgSend(v43, "objectID");
      v51 = type metadata accessor for REMNavigationSpecifier.ListPathSpecifier(0);
      (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v51 - 8) + 104))(v50, v67, v51);
      v52 = type metadata accessor for REMNavigationSpecifier(0);
      v53 = *(_QWORD *)(v52 - 8);
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(v53 + 104))(v49, v66, v52);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v53 + 56))(v49, 0, 1, v52);
      v54 = (uint64_t)v69;
      *v69 = v45;
      *(_QWORD *)(v54 + 8) = v47;
      v55 = v71;
      sub_1000137F0((uint64_t)v49, v54 + *(int *)(v71 + 20), &qword_10002E600);
      v56 = swift_bridgeObjectRetain(v42);
      v57 = sub_1000103C0(v56, (uint64_t *)sub_10000F8E4, 0);
      swift_bridgeObjectRelease(v42);
      sub_100013834((uint64_t)v49, &qword_10002E600);
      v58 = (uint64_t)v72;
      *(_QWORD *)(v54 + *(int *)(v55 + 24)) = v57;
      sub_10000F00C(v54, v58);
      swift_bridgeObjectRelease(v42);

      v75 = (_QWORD *)v73;
      v60 = *(_QWORD *)(v73 + 16);
      v59 = *(_QWORD *)(v73 + 24);
      if (v60 >= v59 >> 1)
      {
        sub_10000D5A0(v59 > 1, v60 + 1, 1);
        v73 = (unint64_t)v75;
      }
      v61 = (uint64_t)v72;
      v62 = v73;
      *(_QWORD *)(v73 + 16) = v60 + 1;
      sub_10000F00C(v61, v62+ ((*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80))+ *(_QWORD *)(v70 + 72) * v60);
      v41 += 2;
      --v40;
    }
    while (v40);
    swift_release(v65);
  }
  else
  {
    swift_release(v75);
    return _swiftEmptyArrayStorage;
  }
  return (_QWORD *)v73;
}

uint64_t sub_1000076D0(void *a1, uint64_t a2)
{
  id v3;
  char v4;
  Swift::Int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  id v15;

  if ((a2 & 0xC000000000000001) != 0)
  {
    v3 = a1;
    v4 = __CocoaSet.contains(_:)();

    return v4 & 1;
  }
  if (!*(_QWORD *)(a2 + 16)
    || (v6 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a2 + 40)),
        v7 = -1 << *(_BYTE *)(a2 + 32),
        v8 = v6 & ~v7,
        v9 = a2 + 56,
        ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0))
  {
LABEL_11:
    v12 = 0;
    return v12 & 1;
  }
  sub_100013968(0, (unint64_t *)&unk_10002E6F0, REMObjectID_ptr);
  v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v8);
  v11 = static NSObject.== infix(_:_:)();

  if ((v11 & 1) == 0)
  {
    v13 = ~v7;
    v14 = (v8 + 1) & v13;
    if (((*(_QWORD *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
    {
      do
      {
        v15 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v14);
        v12 = static NSObject.== infix(_:_:)();

        if ((v12 & 1) != 0)
          break;
        v14 = (v14 + 1) & v13;
      }
      while (((*(_QWORD *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
      return v12 & 1;
    }
    goto LABEL_11;
  }
  v12 = 1;
  return v12 & 1;
}

_QWORD *sub_10000782C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v4 = swift_allocObject(&unk_100028D88, 24, 7);
  *(_QWORD *)(v4 + 16) = a2;
  if ((unint64_t)a1 >> 62)
    goto LABEL_21;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a2);
  if (v5)
  {
    while (1)
    {
      v22 = v4;
      v6 = 0;
      v7 = a1 & 0xC000000000000001;
      v8 = a1 & 0xFFFFFFFFFFFFFF8;
      v23 = a1 & 0xFFFFFFFFFFFFFF8;
      while (v7)
      {
        v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, a1);
LABEL_9:
        v10 = v9;
        v4 = v6 + 1;
        if (__OFADD__(v6, 1))
          goto LABEL_20;
        v11 = REMReminder.parentReminderID.getter();
        if (v11)
        {
          v12 = (void *)v11;
          if (objc_msgSend(v10, "isSubtask"))
          {
            v13 = v7;
            v14 = v5;
            v15 = a1;
            v16 = a2;
            v17 = sub_1000076D0(v12, a2);

            if ((v17 & 1) != 0)
            {
              specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
              v18 = _swiftEmptyArrayStorage[2];
              specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v18);
              v19 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, v10);
              specialized ContiguousArray._endMutation()(v19);
            }
            else
            {

            }
            a2 = v16;
            a1 = v15;
            v5 = v14;
            v7 = v13;
            v8 = v23;
          }
          else
          {

          }
        }
        else
        {

        }
        ++v6;
        if (v4 == v5)
        {
          v4 = v22;
          goto LABEL_25;
        }
      }
      if (v6 < *(_QWORD *)(v8 + 16))
        break;
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      if (a1 < 0)
        v20 = a1;
      else
        v20 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a2);
      v5 = _CocoaArrayWrapper.endIndex.getter(v20);
      if (!v5)
        goto LABEL_25;
    }
    v9 = *(id *)(a1 + 8 * v6 + 32);
    goto LABEL_9;
  }
LABEL_25:
  swift_bridgeObjectRelease(a2);
  swift_release(v4);
  swift_bridgeObjectRelease(a1);
  return _swiftEmptyArrayStorage;
}

void sub_100007A28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  Class isa;
  NSString v6;
  uint64_t v7;

  v0 = type metadata accessor for Locale(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
  static Locale.current.getter();
  isa = Locale._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  objc_msgSend(v4, "setLocale:", isa);

  v6 = String._bridgeToObjectiveC()();
  objc_msgSend(v4, "setLocalizedDateFormatFromTemplate:", v6);

  qword_10002E018 = (uint64_t)v4;
}

uint64_t sub_100007B20(uint64_t a1, uint64_t a2)
{
  return sub_100007C68(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100007B2C(uint64_t a1, id *a2)
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

uint64_t sub_100007BA0(uint64_t a1, id *a2)
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

uint64_t sub_100007C1C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

uint64_t sub_100007C5C(uint64_t a1, uint64_t a2)
{
  return sub_100007C68(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100007C68(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_100007CA4(uint64_t a1)
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

Swift::Int sub_100007CE4(uint64_t a1)
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

uint64_t sub_100007D54(_QWORD *a1, uint64_t *a2)
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

uint64_t sub_100007DDC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100007E20@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100007E48(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100011838((unint64_t *)&qword_10002E218, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_100022AF0);
  v3 = sub_100011838(&qword_10002E220, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_100022A44);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

unint64_t sub_100007ECC(void *a1)
{
  uint64_t v1;
  id v3;
  Swift::Int v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6, *(_QWORD *)(v1 + 40));
  if (a1)
  {
    Hasher._combine(_:)(1u);
    v3 = a1;
    NSObject.hash(into:)(v6);

  }
  else
  {
    Hasher._combine(_:)(0);
  }
  v4 = Hasher._finalize()();
  return sub_10000CB84(a1, v4);
}

unint64_t sub_100007F48(uint64_t a1)
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
  Swift::Int v12;
  _QWORD v15[9];

  v2 = v1;
  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10000EFCC(&qword_10002E070);
  __chkstk_darwin(v8);
  v10 = (char *)&v15[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  Hasher.init(_seed:)(v15, *(_QWORD *)(v2 + 40));
  sub_1000137F0(a1, (uint64_t)v10, &qword_10002E070);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    Hasher._combine(_:)(1u);
    v11 = sub_100011838(&qword_10002E0A8, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
    dispatch thunk of Hashable.hash(into:)(v15, v4, v11);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v12 = Hasher._finalize()();
  return sub_10000CC84(a1, v12);
}

unint64_t sub_1000080C0(int a1)
{
  uint64_t v1;
  Swift::Int v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, *(_QWORD *)(v1 + 40));
  Hasher._combine(_:)(a1 & 1);
  v3 = Hasher._finalize()();
  return sub_10000CFB0(a1, v3);
}

unint64_t sub_100008118(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10000D2B0(a1, v4, &qword_10002E0E8, REMList_ptr);
}

unint64_t sub_100008164(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10000D05C(a1, a2, v5);
}

unint64_t sub_1000081C8(uint64_t a1)
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
  return sub_10000D13C(a1, v7);
}

unint64_t sub_100008248(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10000D2B0(a1, v4, (unint64_t *)&unk_10002E6F0, REMObjectID_ptr);
}

Swift::Int sub_100008294(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  _QWORD v39[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_10000EFCC(&qword_10002E120);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_46;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v38 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v17 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v18 = v17 | (v14 << 6);
      goto LABEL_25;
    }
    v19 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
      return result;
    }
    if (v19 >= v37)
      break;
    v20 = (_QWORD *)(v5 + 64);
    v21 = *(_QWORD *)(v38 + 8 * v19);
    ++v14;
    if (!v21)
    {
      v14 = v19 + 1;
      if (v19 + 1 >= v37)
        goto LABEL_39;
      v21 = *(_QWORD *)(v38 + 8 * v14);
      if (!v21)
      {
        v22 = v19 + 2;
        if (v22 >= v37)
        {
LABEL_39:
          swift_release(v5);
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_46;
          goto LABEL_42;
        }
        v21 = *(_QWORD *)(v38 + 8 * v22);
        if (!v21)
        {
          while (1)
          {
            v14 = v22 + 1;
            if (__OFADD__(v22, 1))
              goto LABEL_48;
            if (v14 >= v37)
              goto LABEL_39;
            v21 = *(_QWORD *)(v38 + 8 * v14);
            ++v22;
            if (v21)
              goto LABEL_24;
          }
        }
        v14 = v22;
      }
    }
LABEL_24:
    v11 = (v21 - 1) & v21;
    v18 = __clz(__rbit64(v21)) + (v14 << 6);
LABEL_25:
    v23 = 8 * v18;
    v24 = *(void **)(*(_QWORD *)(v5 + 48) + v23);
    v25 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v23);
    if ((a2 & 1) == 0)
    {
      v26 = v24;
      swift_bridgeObjectRetain(v25);
    }
    Hasher.init(_seed:)(v39, *(_QWORD *)(v8 + 40));
    if (v24)
    {
      Hasher._combine(_:)(1u);
      v27 = v24;
      NSObject.hash(into:)(v39);

    }
    else
    {
      Hasher._combine(_:)(0);
    }
    result = Hasher._finalize()();
    v28 = -1 << *(_BYTE *)(v8 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_47;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = 8 * v15;
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + v16) = v24;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + v16) = v25;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v36;
  v20 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_46;
LABEL_42:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v20, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v20 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_46:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_1000085AC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t result;
  int64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v3 = v2;
  v6 = sub_10000EFCC(&qword_10002E070);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  if (*(_QWORD *)(*v3 + 24) > a1)
    a1 = *(_QWORD *)(*v3 + 24);
  sub_10000EFCC(&qword_10002E0A0);
  v11 = static _DictionaryStorage.resize(original:capacity:move:)(v10, a1, a2);
  if (*(_QWORD *)(v10 + 16))
  {
    v28 = v3;
    v12 = 1 << *(_BYTE *)(v10 + 32);
    v13 = (_QWORD *)(v10 + 64);
    v14 = -1;
    if (v12 < 64)
      v14 = ~(-1 << v12);
    v15 = v14 & *(_QWORD *)(v10 + 64);
    v16 = (unint64_t)(v12 + 63) >> 6;
    result = swift_retain(v10);
    v18 = 0;
    while (1)
    {
      if (v15)
      {
        v20 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        v21 = v20 | (v18 << 6);
      }
      else
      {
        v22 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
          __break(1u);
LABEL_34:
          __break(1u);
          return result;
        }
        if (v22 >= v16)
          goto LABEL_25;
        v23 = v13[v22];
        ++v18;
        if (!v23)
        {
          v18 = v22 + 1;
          if (v22 + 1 >= v16)
            goto LABEL_25;
          v23 = v13[v18];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v16)
            {
LABEL_25:
              swift_release(v10);
              if ((a2 & 1) == 0)
              {
                result = swift_release(v10);
                v3 = v28;
                goto LABEL_32;
              }
              v26 = 1 << *(_BYTE *)(v10 + 32);
              if (v26 >= 64)
                bzero((void *)(v10 + 64), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v13 = -1 << v26;
              v3 = v28;
              *(_QWORD *)(v10 + 16) = 0;
              break;
            }
            v23 = v13[v24];
            if (!v23)
            {
              while (1)
              {
                v18 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_34;
                if (v18 >= v16)
                  goto LABEL_25;
                v23 = v13[v18];
                ++v24;
                if (v23)
                  goto LABEL_22;
              }
            }
            v18 = v24;
          }
        }
LABEL_22:
        v15 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v18 << 6);
      }
      v25 = *(_QWORD *)(v10 + 48) + *(_QWORD *)(v7 + 72) * v21;
      if ((a2 & 1) != 0)
      {
        sub_1000137AC(v25, (uint64_t)v9, &qword_10002E070);
        v19 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v21);
      }
      else
      {
        sub_1000137F0(v25, (uint64_t)v9, &qword_10002E070);
        v19 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v21);
        swift_bridgeObjectRetain(v19);
      }
      result = sub_10000D3C0((uint64_t)v9, v19, v11);
    }
  }
  result = swift_release(v10);
LABEL_32:
  *v3 = v11;
  return result;
}

Swift::Int sub_10000880C(uint64_t a1, uint64_t a2)
{
  Swift::Int *v2;
  Swift::Int *v3;
  Swift::Int v5;
  uint64_t v6;
  Swift::Int result;
  Swift::Int v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
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
  Swift::UInt8 v28;
  uint64_t v29;
  uint64_t v30;
  Swift::Int *v31;
  int64_t v32;
  _QWORD *v33;
  uint64_t v34[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_10000EFCC(&qword_10002E068);
  result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v31 = v3;
    v9 = 0;
    v33 = (_QWORD *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v32 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v18 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v19 = v18 | (v9 << 6);
      }
      else
      {
        v20 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v32)
          goto LABEL_36;
        v21 = v33[v20];
        ++v9;
        if (!v21)
        {
          v9 = v20 + 1;
          if (v20 + 1 >= v32)
            goto LABEL_36;
          v21 = v33[v9];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v32)
            {
LABEL_36:
              if ((a2 & 1) == 0)
              {
                result = swift_release(v5);
                v3 = v31;
                goto LABEL_43;
              }
              v30 = 1 << *(_BYTE *)(v5 + 32);
              if (v30 >= 64)
                bzero(v33, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v33 = -1 << v30;
              v3 = v31;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v33[v22];
            if (!v21)
            {
              while (1)
              {
                v9 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_45;
                if (v9 >= v32)
                  goto LABEL_36;
                v21 = v33[v9];
                ++v22;
                if (v21)
                  goto LABEL_33;
              }
            }
            v9 = v22;
          }
        }
LABEL_33:
        v12 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v9 << 6);
      }
      v27 = *(_QWORD *)(v5 + 56);
      v28 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v19);
      v29 = *(_QWORD *)(v27 + 8 * v19);
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain(*(_QWORD *)(v27 + 8 * v19));
      Hasher.init(_seed:)(v34, *(_QWORD *)(v8 + 40));
      Hasher._combine(_:)(v28);
      result = Hasher._finalize()();
      v14 = -1 << *(_BYTE *)(v8 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_44;
          }
          v25 = v16 == v24;
          if (v16 == v24)
            v16 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v26 == -1);
        v17 = __clz(__rbit64(~v26)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_BYTE *)(*(_QWORD *)(v8 + 48) + v17) = v28;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v17) = v29;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
LABEL_43:
  *v3 = v8;
  return result;
}

Swift::Int sub_100008ADC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  Swift::Int result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
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
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_10000EFCC(&qword_10002E0F0);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v3;
  v37 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  result = swift_retain(v5);
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v22 = v21 | (v15 << 6);
      goto LABEL_34;
    }
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v12)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v37 + 8 * v23);
    ++v15;
    if (!v25)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v12)
        goto LABEL_36;
      v25 = *(_QWORD *)(v37 + 8 * v15);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_36:
          swift_release(v5);
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = *(_QWORD *)(v37 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v15 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v15 >= v12)
              goto LABEL_36;
            v25 = *(_QWORD *)(v37 + 8 * v15);
            ++v26;
            if (v25)
              goto LABEL_33;
          }
        }
        v15 = v26;
      }
    }
LABEL_33:
    v11 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    v31 = 8 * v22;
    v32 = *(void **)(*(_QWORD *)(v5 + 48) + v31);
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v31);
    if ((a2 & 1) == 0)
    {
      v34 = v32;
      swift_bridgeObjectRetain(v33);
    }
    result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v8 + 40));
    v16 = -1 << *(_BYTE *)(v8 + 32);
    v17 = result & ~v16;
    v18 = v17 >> 6;
    if (((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v29 = v18 == v28;
        if (v18 == v28)
          v18 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v13 + 8 * v18);
      }
      while (v30 == -1);
      v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }
    *(_QWORD *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    v20 = 8 * v19;
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + v20) = v32;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + v20) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v36;
  v24 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_100008DB0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  Swift::Int result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
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
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_10000EFCC((uint64_t *)&unk_10002E720);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v3;
  v38 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  result = swift_retain(v5);
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v22 = v21 | (v15 << 6);
      goto LABEL_34;
    }
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v12)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v38 + 8 * v23);
    ++v15;
    if (!v25)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v12)
        goto LABEL_36;
      v25 = *(_QWORD *)(v38 + 8 * v15);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_36:
          swift_release(v5);
          v3 = v37;
          if ((a2 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = *(_QWORD *)(v38 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v15 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v15 >= v12)
              goto LABEL_36;
            v25 = *(_QWORD *)(v38 + 8 * v15);
            ++v26;
            if (v25)
              goto LABEL_33;
          }
        }
        v15 = v26;
      }
    }
LABEL_33:
    v11 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    v31 = 8 * v22;
    v32 = *(void **)(*(_QWORD *)(v5 + 48) + v31);
    v33 = *(void **)(*(_QWORD *)(v5 + 56) + v31);
    if ((a2 & 1) == 0)
    {
      v34 = v32;
      v35 = v33;
    }
    result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v8 + 40));
    v16 = -1 << *(_BYTE *)(v8 + 32);
    v17 = result & ~v16;
    v18 = v17 >> 6;
    if (((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v29 = v18 == v28;
        if (v18 == v28)
          v18 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v13 + 8 * v18);
      }
      while (v30 == -1);
      v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }
    *(_QWORD *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    v20 = 8 * v19;
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + v20) = v32;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + v20) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v37;
  v24 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v36 = 1 << *(_BYTE *)(v5 + 32);
  if (v36 >= 64)
    bzero(v24, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v36;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_100009080(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a1);
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v2 = sub_10000F0BC(v2);
    *a1 = v2;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v7[0] = v2 + 32;
  v7[1] = v4;
  sub_100012690(v7);
  return specialized ContiguousArray._endMutation()(v5);
}

Swift::Int sub_1000090F8(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  Swift::Int result;
  uint64_t v6[2];

  v2 = *(_QWORD *)(sub_10000EFCC(&qword_10002E078) - 8);
  v3 = (_QWORD *)*a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v3 = (_QWORD *)sub_10000F0D0(v3);
  v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_1000095EC(v6);
  *a1 = v3;
  return result;
}

Swift::Int sub_10000917C(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  Swift::Int result;
  uint64_t v5[2];

  v2 = (_QWORD *)*a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v2 = (_QWORD *)sub_10000F0E4(v2);
  v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  result = sub_10000A684(v5);
  *a1 = v2;
  return result;
}

_QWORD *sub_1000091E4(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return _swiftEmptyArrayStorage;
  while (1)
  {
    if (v2 <= 0)
    {
      v4 = _swiftEmptyArrayStorage;
    }
    else
    {
      v3 = sub_10000EFCC(&qword_10002E058);
      v4 = (_QWORD *)swift_allocObject(v3, 8 * v2 + 32, 7);
      v5 = j__malloc_size(v4);
      v6 = v5 - 32;
      if (v5 < 32)
        v6 = v5 - 25;
      v4[2] = v2;
      v4[3] = (2 * (v6 >> 3)) | 1;
    }
    swift_bridgeObjectRetain(v1);
    v7 = sub_10000EA1C((unint64_t)(v4 + 4), v2, v1);
    v1 = v8;
    swift_bridgeObjectRelease(v7);
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    if (v1 < 0)
      v9 = v1;
    else
      v9 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v9);
    swift_bridgeObjectRelease(v1);
    if (!v2)
      return _swiftEmptyArrayStorage;
  }
  return v4;
}

_QWORD *sub_1000092D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return _swiftEmptyArrayStorage;
  v3 = sub_10000EFCC(&qword_10002E0C8);
  v4 = *(_QWORD *)(sub_10000EFCC(&qword_10002E078) - 8);
  v5 = *(_QWORD *)(v4 + 72);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = (v6 + 32) & ~v6;
  v8 = (_QWORD *)swift_allocObject(v3, v7 + v5 * v1, v6 | 7);
  result = (_QWORD *)j__malloc_size(v8);
  if (v5)
  {
    if ((_QWORD *)((char *)result - v7) != (_QWORD *)0x8000000000000000 || v5 != -1)
    {
      v8[2] = v1;
      v8[3] = 2 * (((uint64_t)result - v7) / v5);
      v11 = *(unsigned __int8 *)(*(_QWORD *)(sub_10000EFCC(&qword_10002E078) - 8) + 80);
      v12 = sub_10000F0F8(&v14, (uint64_t)v8 + ((v11 + 32) & ~v11), v1, a1);
      v13 = v14;
      swift_bridgeObjectRetain(a1);
      sub_1000137A4(v13);
      if (v12 == v1)
        return v8;
      __break(1u);
      return _swiftEmptyArrayStorage;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

_QWORD *sub_100009410(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return _swiftEmptyArrayStorage;
  v3 = sub_10000EFCC(&qword_10002E0F8);
  v4 = (_QWORD *)swift_allocObject(v3, 16 * v1 + 32, 7);
  v5 = j__malloc_size(v4);
  v6 = v5 - 32;
  if (v5 < 32)
    v6 = v5 - 17;
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  v7 = sub_10000F400((uint64_t)&v10, v4 + 4, v1, a1);
  v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_1000137A4(v8);
  if (v7 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v4;
}

uint64_t *sub_1000094F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *result;
  uint64_t v9;

  v1 = a1;
  if ((a1 & 0xC000000000000001) == 0)
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (v2)
      goto LABEL_5;
    return (uint64_t *)&_swiftEmptyArrayStorage;
  }
  if (a1 >= 0)
    a1 &= 0xFFFFFFFFFFFFFF8uLL;
  v2 = __CocoaDictionary.count.getter(a1);
  if (!v2)
    return (uint64_t *)&_swiftEmptyArrayStorage;
LABEL_5:
  if (v2 <= 0)
  {
    v4 = (uint64_t *)&_swiftEmptyArrayStorage;
  }
  else
  {
    v3 = sub_10000EFCC(&qword_10002E058);
    v4 = (uint64_t *)swift_allocObject(v3, 8 * v2 + 32, 7);
    v5 = j__malloc_size(v4);
    v6 = v5 - 32;
    if (v5 < 32)
      v6 = v5 - 25;
    v4[2] = v2;
    v4[3] = (2 * (v6 >> 3)) | 1;
  }
  swift_bridgeObjectRetain(v1);
  v7 = sub_10000F614((uint64_t)&v9, v4 + 4, v2, v1);
  result = (uint64_t *)sub_1000137A4(v9);
  if (v7 == v2)
    return v4;
  __break(1u);
  return result;
}

Swift::Int sub_1000095EC(uint64_t *a1)
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
  uint64_t v15;
  char *v16;
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
  Swift::Int v47;
  Swift::Int result;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  Swift::Int v53;
  char *v54;
  unint64_t v55;
  Swift::Int v56;
  Swift::Int v57;
  uint64_t v58;
  Swift::Int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int (*v65)(uint64_t, uint64_t, uint64_t);
  uint64_t v66;
  void (*v67)(char *, uint64_t, uint64_t);
  char *v68;
  uint64_t v69;
  char *v70;
  void (*v71)(char *, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unsigned int (*v76)(uint64_t, uint64_t, uint64_t);
  int v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(char *, uint64_t, uint64_t);
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  void (*v85)(char *, uint64_t);
  char *v86;
  char *v87;
  Swift::Int v88;
  uint64_t v89;
  Swift::Int v90;
  uint64_t v91;
  Swift::Int v92;
  Swift::Int v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  Swift::Int v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unsigned int (*v107)(char *, uint64_t, uint64_t);
  uint64_t v108;
  void (*v109)(char *, char *, uint64_t);
  uint64_t v110;
  char *v111;
  uint64_t v112;
  char *v113;
  char v114;
  void (*v115)(char *, uint64_t);
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v120;
  unint64_t v121;
  char *v122;
  char *v123;
  Swift::Int v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  BOOL v136;
  unint64_t v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  BOOL v146;
  uint64_t v147;
  char v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  BOOL v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  unint64_t v164;
  char *v165;
  char *v166;
  char *v167;
  uint64_t v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  _QWORD *v173;
  char *v174;
  uint64_t v175;
  unint64_t v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  char *v181;
  unint64_t v182;
  char *v183;
  _QWORD *v184;
  Swift::Int v185;
  char *v186;
  char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  char *v191;
  char *v192;
  char *v193;
  uint64_t v194;
  uint64_t v195;
  char *v196;
  uint64_t v197;
  char *v198;
  uint64_t v199;
  Swift::Int v200;
  uint64_t v201;
  unint64_t v202;
  uint64_t v203;
  uint64_t v204;
  char *v205;
  uint64_t v206;
  char *v207;
  char *v208;
  char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  Swift::Int v213;
  uint64_t v214;
  unsigned int (*v215)(uint64_t, uint64_t, uint64_t);
  uint64_t v216;
  Swift::Int v217;
  uint64_t v218;
  Swift::Int v219;
  uint64_t *v220;

  v2 = sub_10000EFCC(&qword_10002E070);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v183 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v3);
  v8 = (char *)&v183 - v7;
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v183 - v10;
  v12 = __chkstk_darwin(v9);
  v199 = (uint64_t)&v183 - v13;
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v183 - v15;
  __chkstk_darwin(v14);
  v188 = (uint64_t)&v183 - v17;
  v18 = type metadata accessor for Date(0);
  v194 = *(_QWORD *)(v18 - 8);
  v19 = __chkstk_darwin(v18);
  v205 = (char *)&v183 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __chkstk_darwin(v19);
  v208 = (char *)&v183 - v22;
  v23 = __chkstk_darwin(v21);
  v191 = (char *)&v183 - v24;
  v25 = __chkstk_darwin(v23);
  v198 = (char *)&v183 - v26;
  v27 = __chkstk_darwin(v25);
  v187 = (char *)&v183 - v28;
  __chkstk_darwin(v27);
  v30 = (char *)&v183 - v29;
  v206 = sub_10000EFCC(&qword_10002E078);
  v203 = *(_QWORD *)(v206 - 8);
  v31 = __chkstk_darwin(v206);
  v197 = (uint64_t)&v183 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __chkstk_darwin(v31);
  v214 = (uint64_t)&v183 - v34;
  v35 = __chkstk_darwin(v33);
  v37 = (char *)&v183 - v36;
  v38 = __chkstk_darwin(v35);
  v218 = (uint64_t)&v183 - v39;
  v40 = __chkstk_darwin(v38);
  v193 = (char *)&v183 - v41;
  v42 = __chkstk_darwin(v40);
  v201 = (uint64_t)&v183 - v43;
  v44 = __chkstk_darwin(v42);
  v190 = (uint64_t)&v183 - v45;
  __chkstk_darwin(v44);
  v189 = (uint64_t)&v183 - v46;
  v220 = a1;
  v47 = a1[1];
  result = _minimumMergeRunLength(_:)(v47);
  if (result >= v47)
  {
    if ((v47 & 0x8000000000000000) == 0)
    {
      if (v47)
        return sub_10000B140(0, v47, 1, v220);
      return result;
    }
    goto LABEL_159;
  }
  if (v47 >= 0)
    v49 = v47;
  else
    v49 = v47 + 1;
  if (v47 < -1)
  {
LABEL_167:
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
    __break(1u);
    return result;
  }
  v207 = v5;
  v185 = result;
  v186 = v30;
  if (v47 < 2)
  {
    v202 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v203 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v203 + 80));
    if (v47 != 1)
    {
      v55 = _swiftEmptyArrayStorage[2];
      v54 = (char *)_swiftEmptyArrayStorage;
      v173 = _swiftEmptyArrayStorage;
      if (v55 < 2)
      {
LABEL_136:
        swift_bridgeObjectRelease(v54);
        v173[2] = 0;
        return swift_bridgeObjectRelease(v173);
      }
LABEL_123:
      v175 = *v220;
      while (1)
      {
        v176 = v55 - 2;
        if (v55 < 2)
          goto LABEL_154;
        if (!v175)
          goto LABEL_166;
        v177 = v54;
        v178 = *(_QWORD *)&v54[16 * v176 + 32];
        v179 = *(_QWORD *)&v54[16 * v55 + 24];
        v180 = v204;
        sub_10000BA98(v175 + *(_QWORD *)(v203 + 72) * v178, v175 + *(_QWORD *)(v203 + 72) * *(_QWORD *)&v54[16 * v55 + 16], v175 + *(_QWORD *)(v203 + 72) * v179, v202);
        if (v180)
        {
          v174 = v177;
          goto LABEL_121;
        }
        if (v179 < v178)
          goto LABEL_155;
        v204 = 0;
        if ((swift_isUniquelyReferenced_nonNull_native(v177) & 1) == 0)
          v177 = sub_10000CB70((uint64_t)v177);
        if (v176 >= *((_QWORD *)v177 + 2))
          goto LABEL_156;
        v181 = &v177[16 * v176 + 32];
        *(_QWORD *)v181 = v178;
        *((_QWORD *)v181 + 1) = v179;
        v182 = *((_QWORD *)v177 + 2);
        if (v55 > v182)
          goto LABEL_157;
        memmove(&v177[16 * v55 + 16], &v177[16 * v55 + 32], 16 * (v182 - v55));
        v54 = v177;
        *((_QWORD *)v177 + 2) = v182 - 1;
        v55 = v182 - 1;
        if (v182 <= 2)
          goto LABEL_136;
      }
    }
    v184 = _swiftEmptyArrayStorage;
  }
  else
  {
    v50 = v49 >> 1;
    v51 = static Array._allocateBufferUninitialized(minimumCapacity:)(v49 >> 1, v206);
    *(_QWORD *)(v51 + 16) = v50;
    v52 = *(unsigned __int8 *)(v203 + 80);
    v184 = (_QWORD *)v51;
    v202 = v51 + ((v52 + 32) & ~v52);
  }
  v53 = 0;
  v54 = (char *)_swiftEmptyArrayStorage;
  v209 = v8;
  v192 = v11;
  v183 = v16;
  v212 = v18;
  while (1)
  {
    v56 = v53;
    v57 = v53 + 1;
    v217 = v47;
    v196 = v54;
    v200 = v53;
    if (v53 + 1 >= v47)
      goto LABEL_49;
    v58 = *v220;
    v59 = *(_QWORD *)(v203 + 72);
    v213 = v53 + 1;
    v60 = v58 + v59 * v57;
    v61 = v189;
    sub_1000137F0(v60, v189, &qword_10002E078);
    v195 = v58;
    v219 = v59;
    v62 = v190;
    sub_1000137F0(v58 + v59 * v56, v190, &qword_10002E078);
    v63 = v188;
    sub_1000137F0(v61, v188, &qword_10002E070);
    v64 = v194;
    v65 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v194 + 48);
    if (v65(v63, 1, v18) == 1)
    {
      sub_100013834(v63, &qword_10002E070);
      LODWORD(v216) = 0;
    }
    else
    {
      v66 = v63;
      v67 = *(void (**)(char *, uint64_t, uint64_t))(v64 + 32);
      v68 = v186;
      v67(v186, v66, v18);
      v69 = (uint64_t)v183;
      sub_1000137F0(v62, (uint64_t)v183, &qword_10002E070);
      if (v65(v69, 1, v18) == 1)
      {
        (*(void (**)(char *, uint64_t))(v194 + 8))(v68, v18);
        sub_100013834(v69, &qword_10002E070);
        LODWORD(v216) = 1;
      }
      else
      {
        v70 = v187;
        v67(v187, v69, v18);
        LODWORD(v216) = static Date.< infix(_:_:)(v186, v70);
        v71 = *(void (**)(char *, uint64_t))(v194 + 8);
        v71(v70, v18);
        v71(v186, v18);
      }
    }
    sub_100013834(v190, &qword_10002E078);
    sub_100013834(v189, &qword_10002E078);
    v56 = v200;
    v57 = v200 + 2;
    if (v200 + 2 < v217)
    {
      v215 = v65;
      v211 = v219 * v213;
      v72 = v195;
      v210 = v219 * v57;
      v73 = (uint64_t)v193;
      while (1)
      {
        v213 = v57;
        v74 = v201;
        sub_1000137F0(v72 + v210, v201, &qword_10002E078);
        sub_1000137F0(v72 + v211, v73, &qword_10002E078);
        v75 = v199;
        sub_1000137F0(v74, v199, &qword_10002E070);
        v76 = v215;
        if (v215(v75, 1, v18) == 1)
        {
          sub_100013834(v75, &qword_10002E070);
          v77 = 0;
        }
        else
        {
          v78 = v73;
          v79 = v194;
          v80 = *(void (**)(char *, uint64_t, uint64_t))(v194 + 32);
          v81 = v198;
          v80(v198, v75, v18);
          v82 = v78;
          v83 = (uint64_t)v192;
          sub_1000137F0(v82, (uint64_t)v192, &qword_10002E070);
          if (v76(v83, 1, v18) == 1)
          {
            (*(void (**)(char *, uint64_t))(v79 + 8))(v81, v18);
            sub_100013834(v83, &qword_10002E070);
            v77 = 1;
          }
          else
          {
            v84 = v191;
            v80(v191, v83, v18);
            v77 = static Date.< infix(_:_:)(v198, v84);
            v85 = *(void (**)(char *, uint64_t))(v79 + 8);
            v86 = v84;
            v87 = v198;
            v85(v86, v18);
            v85(v87, v18);
          }
          v73 = (uint64_t)v193;
        }
        sub_100013834(v73, &qword_10002E078);
        sub_100013834(v201, &qword_10002E078);
        if (((v216 ^ v77) & 1) != 0)
          break;
        v18 = v212;
        v57 = v213 + 1;
        v72 += v219;
        if (v217 == v213 + 1)
        {
          v88 = v217;
          v57 = v217;
          v8 = v209;
          v56 = v200;
          goto LABEL_35;
        }
      }
      v8 = v209;
      v18 = v212;
      v57 = v213;
      v56 = v200;
    }
    v88 = v217;
LABEL_35:
    v54 = v196;
    if ((v216 & 1) != 0)
    {
      if (v57 < v56)
        goto LABEL_160;
      if (v56 < v57)
      {
        v89 = 0;
        v90 = v56;
        v91 = v219 * (v57 - 1);
        v92 = v57 * v219;
        v93 = v90;
        v94 = v90 * v219;
        v213 = v57;
        do
        {
          if (v93 != v57 + v89 - 1)
          {
            v97 = v195;
            if (!v195)
              goto LABEL_165;
            v98 = v195 + v94;
            v216 = v195 + v91;
            sub_1000137AC(v195 + v94, v197, &qword_10002E078);
            if (v94 < v91 || v98 >= v97 + v92)
            {
              v95 = v97 + v94;
              v96 = v216;
              swift_arrayInitWithTakeFrontToBack(v95, v216, 1, v206);
            }
            else
            {
              v96 = v216;
              if (v94 != v91)
                swift_arrayInitWithTakeBackToFront(v98);
            }
            sub_1000137AC(v197, v96, &qword_10002E078);
            v18 = v212;
            v57 = v213;
            v54 = v196;
          }
          ++v93;
          --v89;
          v91 -= v219;
          v92 -= v219;
          v94 += v219;
        }
        while (v93 < v57 + v89);
        v8 = v209;
        v56 = v200;
LABEL_49:
        v88 = v217;
      }
    }
    if (v57 >= v88)
      goto LABEL_72;
    if (__OFSUB__(v57, v56))
      goto LABEL_158;
    if (v57 - v56 >= v185)
      goto LABEL_72;
    if (__OFADD__(v56, v185))
      goto LABEL_161;
    if (v56 + v185 >= v88)
      v99 = v88;
    else
      v99 = v56 + v185;
    if (v99 < v56)
      goto LABEL_162;
    if (v57 == v99)
      goto LABEL_72;
    v100 = *(_QWORD *)(v203 + 72);
    v101 = v100 * (v57 - 1);
    v210 = v100;
    v219 = v57 * v100;
    v102 = v194;
    v195 = v99;
    while (2)
    {
      v104 = 0;
      v213 = v57;
      v211 = v101;
      while (1)
      {
        v105 = *v220;
        v216 = v219 + v104;
        v217 = v56;
        v106 = v218;
        sub_1000137F0(v219 + v104 + v105, v218, &qword_10002E078);
        v215 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))(v101 + v104);
        sub_1000137F0(v101 + v104 + v105, (uint64_t)v37, &qword_10002E078);
        sub_1000137F0(v106, (uint64_t)v8, &qword_10002E070);
        v107 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v102 + 48);
        if (v107(v8, 1, v18) == 1)
        {
          sub_100013834((uint64_t)v8, &qword_10002E070);
          sub_100013834((uint64_t)v37, &qword_10002E078);
          sub_100013834(v218, &qword_10002E078);
          v103 = v213;
          v101 = v211;
          goto LABEL_61;
        }
        v108 = v102;
        v109 = *(void (**)(char *, char *, uint64_t))(v102 + 32);
        v110 = (uint64_t)v37;
        v111 = v208;
        v109(v208, v8, v18);
        v112 = (uint64_t)v207;
        sub_1000137F0(v110, (uint64_t)v207, &qword_10002E070);
        if (v107((char *)v112, 1, v18) != 1)
          break;
        (*(void (**)(char *, uint64_t))(v108 + 8))(v111, v18);
        sub_100013834(v112, &qword_10002E070);
        sub_100013834(v110, &qword_10002E078);
        sub_100013834(v218, &qword_10002E078);
        v37 = (char *)v110;
        v101 = v211;
LABEL_68:
        v116 = *v220;
        v8 = v209;
        if (!*v220)
          goto LABEL_163;
        v117 = v116 + v219 + v104;
        v118 = v116 + v101 + v104;
        sub_1000137AC(v117, v214, &qword_10002E078);
        v102 = v108;
        swift_arrayInitWithTakeFrontToBack(v117, v118, 1, v206);
        sub_1000137AC(v214, v118, &qword_10002E078);
        v104 -= v210;
        v56 = v217 + 1;
        v18 = v212;
        v103 = v213;
        if (v213 == v217 + 1)
          goto LABEL_61;
      }
      v113 = v205;
      v109(v205, (char *)v112, v18);
      v114 = static Date.< infix(_:_:)(v111, v113);
      v115 = *(void (**)(char *, uint64_t))(v108 + 8);
      v115(v113, v18);
      v115(v111, v18);
      sub_100013834(v110, &qword_10002E078);
      sub_100013834(v218, &qword_10002E078);
      v37 = (char *)v110;
      v101 = v211;
      if ((v114 & 1) != 0)
        goto LABEL_68;
      v8 = v209;
      v102 = v108;
      v103 = v213;
LABEL_61:
      v57 = v103 + 1;
      v101 += v210;
      v219 += v210;
      v56 = v200;
      if (v57 != v195)
        continue;
      break;
    }
    v57 = v195;
    v54 = v196;
LABEL_72:
    if (v57 < v56)
    {
LABEL_153:
      __break(1u);
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
      __break(1u);
LABEL_160:
      __break(1u);
LABEL_161:
      __break(1u);
LABEL_162:
      __break(1u);
LABEL_163:
      __break(1u);
LABEL_164:
      __break(1u);
LABEL_165:
      __break(1u);
LABEL_166:
      __break(1u);
      goto LABEL_167;
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v54);
    v213 = v57;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      v54 = v196;
    else
      v54 = sub_10000C818(0, *((_QWORD *)v196 + 2) + 1, 1, v196);
    v121 = *((_QWORD *)v54 + 2);
    v120 = *((_QWORD *)v54 + 3);
    v55 = v121 + 1;
    if (v121 >= v120 >> 1)
      v54 = sub_10000C818((char *)(v120 > 1), v121 + 1, 1, v54);
    *((_QWORD *)v54 + 2) = v55;
    v122 = v54 + 32;
    v123 = &v54[16 * v121 + 32];
    v124 = v213;
    *(_QWORD *)v123 = v200;
    *((_QWORD *)v123 + 1) = v124;
    if (v121)
      break;
    v55 = 1;
LABEL_15:
    v47 = v220[1];
    v53 = v213;
    v8 = v209;
    if (v213 >= v47)
    {
      v173 = v184;
      if (v55 < 2)
        goto LABEL_136;
      goto LABEL_123;
    }
  }
  while (1)
  {
    v125 = v55 - 1;
    if (v55 >= 4)
    {
      v130 = &v122[16 * v55];
      v131 = *((_QWORD *)v130 - 8);
      v132 = *((_QWORD *)v130 - 7);
      v136 = __OFSUB__(v132, v131);
      v133 = v132 - v131;
      if (v136)
        goto LABEL_142;
      v135 = *((_QWORD *)v130 - 6);
      v134 = *((_QWORD *)v130 - 5);
      v136 = __OFSUB__(v134, v135);
      v128 = v134 - v135;
      v129 = v136;
      if (v136)
        goto LABEL_143;
      v137 = v55 - 2;
      v138 = &v122[16 * v55 - 32];
      v140 = *(_QWORD *)v138;
      v139 = *((_QWORD *)v138 + 1);
      v136 = __OFSUB__(v139, v140);
      v141 = v139 - v140;
      if (v136)
        goto LABEL_145;
      v136 = __OFADD__(v128, v141);
      v142 = v128 + v141;
      if (v136)
        goto LABEL_148;
      if (v142 >= v133)
      {
        v160 = &v122[16 * v125];
        v162 = *(_QWORD *)v160;
        v161 = *((_QWORD *)v160 + 1);
        v136 = __OFSUB__(v161, v162);
        v163 = v161 - v162;
        if (v136)
          goto LABEL_152;
        v153 = v128 < v163;
        goto LABEL_109;
      }
    }
    else
    {
      if (v55 != 3)
      {
        v154 = *((_QWORD *)v54 + 4);
        v155 = *((_QWORD *)v54 + 5);
        v136 = __OFSUB__(v155, v154);
        v147 = v155 - v154;
        v148 = v136;
        goto LABEL_103;
      }
      v127 = *((_QWORD *)v54 + 4);
      v126 = *((_QWORD *)v54 + 5);
      v136 = __OFSUB__(v126, v127);
      v128 = v126 - v127;
      v129 = v136;
    }
    if ((v129 & 1) != 0)
      goto LABEL_144;
    v137 = v55 - 2;
    v143 = &v122[16 * v55 - 32];
    v145 = *(_QWORD *)v143;
    v144 = *((_QWORD *)v143 + 1);
    v146 = __OFSUB__(v144, v145);
    v147 = v144 - v145;
    v148 = v146;
    if (v146)
      goto LABEL_147;
    v149 = &v122[16 * v125];
    v151 = *(_QWORD *)v149;
    v150 = *((_QWORD *)v149 + 1);
    v136 = __OFSUB__(v150, v151);
    v152 = v150 - v151;
    if (v136)
      goto LABEL_150;
    if (__OFADD__(v147, v152))
      goto LABEL_151;
    if (v147 + v152 >= v128)
    {
      v153 = v128 < v152;
LABEL_109:
      if (v153)
        v125 = v137;
      goto LABEL_111;
    }
LABEL_103:
    if ((v148 & 1) != 0)
      goto LABEL_146;
    v156 = &v122[16 * v125];
    v158 = *(_QWORD *)v156;
    v157 = *((_QWORD *)v156 + 1);
    v136 = __OFSUB__(v157, v158);
    v159 = v157 - v158;
    if (v136)
      goto LABEL_149;
    if (v159 < v147)
      goto LABEL_15;
LABEL_111:
    v164 = v125 - 1;
    if (v125 - 1 >= v55)
    {
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
      goto LABEL_153;
    }
    if (!*v220)
      goto LABEL_164;
    v165 = v37;
    v166 = v54;
    v167 = &v122[16 * v164];
    v168 = *(_QWORD *)v167;
    v169 = &v122[16 * v125];
    v170 = *((_QWORD *)v169 + 1);
    v171 = v204;
    sub_10000BA98(*v220 + *(_QWORD *)(v203 + 72) * *(_QWORD *)v167, *v220 + *(_QWORD *)(v203 + 72) * *(_QWORD *)v169, *v220 + *(_QWORD *)(v203 + 72) * v170, v202);
    if (v171)
      break;
    if (v170 < v168)
      goto LABEL_139;
    if (v125 > *((_QWORD *)v166 + 2))
      goto LABEL_140;
    *(_QWORD *)v167 = v168;
    *(_QWORD *)&v122[16 * v164 + 8] = v170;
    v172 = *((_QWORD *)v166 + 2);
    if (v125 >= v172)
      goto LABEL_141;
    v204 = 0;
    v55 = v172 - 1;
    memmove(&v122[16 * v125], v169 + 16, 16 * (v172 - 1 - v125));
    v54 = v166;
    *((_QWORD *)v166 + 2) = v172 - 1;
    v18 = v212;
    v37 = v165;
    if (v172 <= 2)
      goto LABEL_15;
  }
  v173 = v184;
  v174 = v166;
LABEL_121:
  swift_bridgeObjectRelease(v174);
  v173[2] = 0;
  return swift_bridgeObjectRelease(v173);
}

Swift::Int sub_10000A684(uint64_t *a1)
{
  uint64_t v1;
  Swift::Int v3;
  Swift::Int result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  Swift::Int v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  Swift::Int v13;
  Swift::Int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v47;
  __int128 *v48;
  Swift::Int v49;
  Swift::Int v50;
  __int128 *v51;
  __int128 v52;
  Swift::Int v53;
  uint64_t v54;
  Swift::Int v55;
  __int128 v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v70;
  unint64_t v71;
  unint64_t v72;
  char *v73;
  char *v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  BOOL v86;
  unint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  BOOL v96;
  uint64_t v97;
  char v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  BOOL v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  char *v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  unint64_t v119;
  char *v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  unint64_t v126;
  uint64_t *v127;
  uint64_t v128;
  uint64_t v129;
  Swift::Int v130;
  char *v131;
  char *v132;
  char *v133;
  Swift::Int v134;
  Swift::Int v135;
  Swift::Int v136;
  uint64_t v137;
  void **v138;
  uint64_t v139;
  uint64_t v140;
  Swift::Int v141;
  Swift::Int v142;
  Swift::Int v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  int v148;
  Swift::Int v149;

  v3 = a1[1];
  result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_151;
    if (v3)
      return sub_10000B584(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_159;
  v135 = v3;
  v130 = result;
  v139 = v1;
  v127 = a1;
  if (v3 < 2)
  {
    v8 = (char *)_swiftEmptyArrayStorage;
    v138 = (void **)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      v12 = _swiftEmptyArrayStorage[2];
      v11 = (char *)_swiftEmptyArrayStorage;
LABEL_116:
      v133 = v8;
      if (v12 >= 2)
      {
        v121 = *v127;
        do
        {
          v122 = v12 - 2;
          if (v12 < 2)
            goto LABEL_146;
          if (!v121)
            goto LABEL_158;
          v123 = *(_QWORD *)&v11[16 * v122 + 32];
          v124 = *(_QWORD *)&v11[16 * v12 + 24];
          sub_10000C37C((void **)(v121 + 16 * v123), (void **)(v121 + 16 * *(_QWORD *)&v11[16 * v12 + 16]), v121 + 16 * v124, v138);
          if (v139)
            goto LABEL_128;
          if (v124 < v123)
            goto LABEL_147;
          if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0)
            v11 = sub_10000CB70((uint64_t)v11);
          if (v122 >= *((_QWORD *)v11 + 2))
            goto LABEL_148;
          v125 = &v11[16 * v122 + 32];
          *(_QWORD *)v125 = v123;
          *((_QWORD *)v125 + 1) = v124;
          v126 = *((_QWORD *)v11 + 2);
          if (v12 > v126)
            goto LABEL_149;
          memmove(&v11[16 * v12 + 16], &v11[16 * v12 + 32], 16 * (v126 - v12));
          *((_QWORD *)v11 + 2) = v126 - 1;
          v12 = v126 - 1;
        }
        while (v126 > 2);
      }
      swift_bridgeObjectRelease(v11);
      *((_QWORD *)v133 + 2) = 0;
      return swift_bridgeObjectRelease(v133);
    }
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_10000EFCC(&qword_10002E100);
    v8 = (char *)static Array._allocateBufferUninitialized(minimumCapacity:)(v6, v7);
    *((_QWORD *)v8 + 2) = v6;
    v3 = v135;
    v138 = (void **)(v8 + 32);
  }
  v133 = v8;
  v9 = 0;
  v10 = *a1;
  v128 = *a1 - 16;
  v129 = *a1 + 40;
  v11 = (char *)_swiftEmptyArrayStorage;
  v140 = *a1;
  while (1)
  {
    v13 = v9;
    v14 = v9 + 1;
    v136 = v9;
    if (v9 + 1 < v3)
    {
      v131 = v11;
      v15 = v10 + 16 * v14;
      v16 = *(void **)v15;
      v17 = *(_QWORD *)(v15 + 8);
      v18 = v10 + 16 * v13;
      v19 = *(void **)v18;
      v20 = *(_QWORD *)(v18 + 8);
      v21 = v16;
      swift_bridgeObjectRetain(v17);
      v22 = v19;
      v144 = v20;
      swift_bridgeObjectRetain(v20);
      v23 = objc_msgSend(v21, "displayName");
      v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
      v26 = v25;

      v27 = objc_msgSend(v22, "displayName");
      v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
      v30 = v29;

      if (v24 == v28 && v26 == v30)
      {
        v148 = 0;
        v30 = v26;
      }
      else
      {
        v148 = _stringCompareWithSmolCheck(_:_:expecting:)(v24, v26, v28, v30, 1);
      }
      swift_bridgeObjectRelease(v26);
      swift_bridgeObjectRelease(v30);
      swift_bridgeObjectRelease(v17);

      swift_bridgeObjectRelease(v144);
      v3 = v135;
      v13 = v136;
      v14 = v136 + 2;
      if (v136 + 2 >= v135)
      {
        v11 = v131;
      }
      else
      {
        v32 = (uint64_t *)(v129 + 16 * v136);
        while (1)
        {
          v141 = v14;
          v33 = *v32;
          v34 = (void *)*(v32 - 3);
          v35 = *(v32 - 2);
          v36 = (id)*(v32 - 1);
          swift_bridgeObjectRetain(v33);
          v37 = v34;
          v145 = v35;
          swift_bridgeObjectRetain(v35);
          v38 = objc_msgSend(v36, "displayName");
          v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
          v41 = v40;

          v42 = objc_msgSend(v37, "displayName");
          v43 = static String._unconditionallyBridgeFromObjectiveC(_:)(v42);
          v45 = v44;

          if (v39 == v43 && v41 == v45)
          {
            v47 = 0;
            v45 = v41;
          }
          else
          {
            v47 = _stringCompareWithSmolCheck(_:_:expecting:)(v39, v41, v43, v45, 1);
          }
          swift_bridgeObjectRelease(v41);
          swift_bridgeObjectRelease(v45);
          swift_bridgeObjectRelease(v33);

          swift_bridgeObjectRelease(v145);
          v3 = v135;
          if (((v148 ^ v47) & 1) != 0)
            break;
          v14 = v141 + 1;
          v32 += 2;
          if (v135 == v141 + 1)
          {
            v14 = v135;
            v11 = v131;
            goto LABEL_35;
          }
        }
        v11 = v131;
        v14 = v141;
LABEL_35:
        v13 = v136;
      }
      v10 = v140;
      if ((v148 & 1) != 0)
      {
        if (v14 < v13)
          goto LABEL_152;
        if (v13 < v14)
        {
          v48 = (__int128 *)(v128 + 16 * v14);
          v49 = v14;
          v50 = v13;
          v51 = (__int128 *)(v140 + 16 * v13);
          do
          {
            if (v50 != --v49)
            {
              if (!v140)
                goto LABEL_157;
              v52 = *v51;
              *v51 = *v48;
              *v48 = v52;
            }
            ++v50;
            --v48;
            ++v51;
          }
          while (v50 < v49);
        }
      }
    }
    if (v14 < v3)
    {
      if (__OFSUB__(v14, v13))
        goto LABEL_150;
      if (v14 - v13 < v130)
        break;
    }
LABEL_68:
    if (v14 < v13)
      goto LABEL_145;
    if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0)
      v11 = sub_10000C818(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v72 = *((_QWORD *)v11 + 2);
    v71 = *((_QWORD *)v11 + 3);
    v12 = v72 + 1;
    v10 = v140;
    if (v72 >= v71 >> 1)
    {
      v120 = sub_10000C818((char *)(v71 > 1), v72 + 1, 1, v11);
      v10 = v140;
      v11 = v120;
    }
    *((_QWORD *)v11 + 2) = v12;
    v73 = v11 + 32;
    v74 = &v11[16 * v72 + 32];
    *(_QWORD *)v74 = v136;
    *((_QWORD *)v74 + 1) = v14;
    v143 = v14;
    if (v72)
    {
      while (1)
      {
        v75 = v12 - 1;
        if (v12 >= 4)
        {
          v80 = &v73[16 * v12];
          v81 = *((_QWORD *)v80 - 8);
          v82 = *((_QWORD *)v80 - 7);
          v86 = __OFSUB__(v82, v81);
          v83 = v82 - v81;
          if (v86)
            goto LABEL_134;
          v85 = *((_QWORD *)v80 - 6);
          v84 = *((_QWORD *)v80 - 5);
          v86 = __OFSUB__(v84, v85);
          v78 = v84 - v85;
          v79 = v86;
          if (v86)
            goto LABEL_135;
          v87 = v12 - 2;
          v88 = &v73[16 * v12 - 32];
          v90 = *(_QWORD *)v88;
          v89 = *((_QWORD *)v88 + 1);
          v86 = __OFSUB__(v89, v90);
          v91 = v89 - v90;
          if (v86)
            goto LABEL_137;
          v86 = __OFADD__(v78, v91);
          v92 = v78 + v91;
          if (v86)
            goto LABEL_140;
          if (v92 >= v83)
          {
            v110 = &v73[16 * v75];
            v112 = *(_QWORD *)v110;
            v111 = *((_QWORD *)v110 + 1);
            v86 = __OFSUB__(v111, v112);
            v113 = v111 - v112;
            if (v86)
              goto LABEL_144;
            v103 = v78 < v113;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v104 = *((_QWORD *)v11 + 4);
            v105 = *((_QWORD *)v11 + 5);
            v86 = __OFSUB__(v105, v104);
            v97 = v105 - v104;
            v98 = v86;
            goto LABEL_99;
          }
          v77 = *((_QWORD *)v11 + 4);
          v76 = *((_QWORD *)v11 + 5);
          v86 = __OFSUB__(v76, v77);
          v78 = v76 - v77;
          v79 = v86;
        }
        if ((v79 & 1) != 0)
          goto LABEL_136;
        v87 = v12 - 2;
        v93 = &v73[16 * v12 - 32];
        v95 = *(_QWORD *)v93;
        v94 = *((_QWORD *)v93 + 1);
        v96 = __OFSUB__(v94, v95);
        v97 = v94 - v95;
        v98 = v96;
        if (v96)
          goto LABEL_139;
        v99 = &v73[16 * v75];
        v101 = *(_QWORD *)v99;
        v100 = *((_QWORD *)v99 + 1);
        v86 = __OFSUB__(v100, v101);
        v102 = v100 - v101;
        if (v86)
          goto LABEL_142;
        if (__OFADD__(v97, v102))
          goto LABEL_143;
        if (v97 + v102 >= v78)
        {
          v103 = v78 < v102;
LABEL_105:
          if (v103)
            v75 = v87;
          goto LABEL_107;
        }
LABEL_99:
        if ((v98 & 1) != 0)
          goto LABEL_138;
        v106 = &v73[16 * v75];
        v108 = *(_QWORD *)v106;
        v107 = *((_QWORD *)v106 + 1);
        v86 = __OFSUB__(v107, v108);
        v109 = v107 - v108;
        if (v86)
          goto LABEL_141;
        if (v109 < v97)
          goto LABEL_14;
LABEL_107:
        v114 = v75 - 1;
        if (v75 - 1 >= v12)
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
        if (!v10)
          goto LABEL_156;
        v115 = &v73[16 * v114];
        v116 = *(_QWORD *)v115;
        v117 = &v73[16 * v75];
        v118 = *((_QWORD *)v117 + 1);
        sub_10000C37C((void **)(v10 + 16 * *(_QWORD *)v115), (void **)(v10 + 16 * *(_QWORD *)v117), v10 + 16 * v118, v138);
        if (v139)
        {
LABEL_128:
          swift_bridgeObjectRelease(v11);
          *((_QWORD *)v133 + 2) = 0;
          return swift_bridgeObjectRelease(v133);
        }
        if (v118 < v116)
          goto LABEL_131;
        if (v75 > *((_QWORD *)v11 + 2))
          goto LABEL_132;
        *(_QWORD *)v115 = v116;
        *(_QWORD *)&v73[16 * v114 + 8] = v118;
        v119 = *((_QWORD *)v11 + 2);
        if (v75 >= v119)
          goto LABEL_133;
        v139 = 0;
        v12 = v119 - 1;
        memmove(&v73[16 * v75], v117 + 16, 16 * (v119 - 1 - v75));
        *((_QWORD *)v11 + 2) = v119 - 1;
        v10 = v140;
        if (v119 <= 2)
          goto LABEL_14;
      }
    }
    v12 = 1;
LABEL_14:
    v3 = v135;
    v9 = v143;
    v8 = v133;
    if (v143 >= v135)
      goto LABEL_116;
  }
  if (__OFADD__(v13, v130))
    goto LABEL_153;
  if (v13 + v130 >= v3)
    v53 = v3;
  else
    v53 = v13 + v130;
  if (v53 >= v13)
  {
    if (v14 != v53)
    {
      v132 = v11;
      v54 = v128 + 16 * v14;
      v134 = v53;
      do
      {
        v56 = *(_OWORD *)(v10 + 16 * v14);
        v137 = v54;
        v142 = v14;
        while (1)
        {
          v147 = *((_QWORD *)&v56 + 1);
          v149 = v13;
          v57 = *(void **)v54;
          v58 = *(_QWORD *)(v54 + 8);
          v59 = (id)v56;
          swift_bridgeObjectRetain(v147);
          v60 = v57;
          v146 = v58;
          swift_bridgeObjectRetain(v58);
          v61 = objc_msgSend(v59, "displayName");
          v62 = static String._unconditionallyBridgeFromObjectiveC(_:)(v61);
          v64 = v63;

          v65 = objc_msgSend(v60, "displayName");
          v66 = static String._unconditionallyBridgeFromObjectiveC(_:)(v65);
          v68 = v67;

          if (v62 == v66 && v64 == v68)
            break;
          v70 = _stringCompareWithSmolCheck(_:_:expecting:)(v62, v64, v66, v68, 1);
          swift_bridgeObjectRelease(v147);

          swift_bridgeObjectRelease(v146);
          swift_bridgeObjectRelease(v64);
          swift_bridgeObjectRelease(v68);
          if ((v70 & 1) == 0)
            goto LABEL_56;
          v10 = v140;
          v55 = v142;
          if (!v140)
            goto LABEL_155;
          v56 = *(_OWORD *)(v54 + 16);
          *(_OWORD *)(v54 + 16) = *(_OWORD *)v54;
          *(_OWORD *)v54 = v56;
          v54 -= 16;
          v13 = v149 + 1;
          if (v142 == v149 + 1)
            goto LABEL_57;
        }
        swift_bridgeObjectRelease(v147);

        swift_bridgeObjectRelease(v146);
        swift_bridgeObjectRelease_n(v64, 2);
LABEL_56:
        v10 = v140;
        v55 = v142;
LABEL_57:
        v14 = v55 + 1;
        v13 = v136;
        v54 = v137 + 16;
      }
      while (v14 != v134);
      v14 = v134;
      v11 = v132;
    }
    goto LABEL_68;
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

uint64_t sub_10000AFEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(char *__return_ptr, void **, void **), uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  char v26;
  void *v27;
  void *v28;

  v11 = swift_allocObject(&unk_100028D60, 32, 7);
  v12 = v11;
  *(_QWORD *)(v11 + 16) = a5;
  *(_QWORD *)(v11 + 24) = a6;
  v24 = a2;
  if (a3 == a2)
  {
    swift_retain(a6);
    swift_release(v12);
  }
  else
  {
    v23 = v11;
    v13 = *a4;
    swift_retain(a6);
    v14 = v13 + 8 * a3 - 8;
    while (2)
    {
      v15 = *(void **)(v13 + 8 * a3);
      v16 = a1;
      v17 = v14;
      do
      {
        v18 = *(void **)v17;
        v28 = v15;
        v27 = v18;
        v19 = v15;
        v20 = v18;
        a5(&v26, &v28, &v27);

        if (v26 != 1)
          break;
        if (!v13)
        {
          result = swift_release(a6);
          __break(1u);
          return result;
        }
        v21 = *(void **)v17;
        v15 = *(void **)(v17 + 8);
        *(_QWORD *)v17 = v15;
        *(_QWORD *)(v17 + 8) = v21;
        v17 -= 8;
        ++v16;
      }
      while (a3 != v16);
      ++a3;
      v14 += 8;
      if (a3 != v24)
        continue;
      break;
    }
    swift_release(v23);
  }
  return swift_release(a6);
}

uint64_t sub_10000B140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
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
  uint64_t result;
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
  unsigned int (*v34)(char *, uint64_t, uint64_t);
  char *v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  int v50;
  char *v51;
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
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;

  v62 = a4;
  v47 = a1;
  v6 = sub_10000EFCC(&qword_10002E070);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v45 - v10;
  v12 = type metadata accessor for Date(0);
  v52 = *(_QWORD *)(v12 - 8);
  v13 = __chkstk_darwin(v12);
  v49 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v51 = (char *)&v45 - v15;
  v48 = sub_10000EFCC(&qword_10002E078);
  v16 = __chkstk_darwin(v48);
  v58 = (uint64_t)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v16);
  v63 = (uint64_t)&v45 - v19;
  result = __chkstk_darwin(v18);
  v64 = (uint64_t)&v45 - v22;
  v56 = a3;
  v46 = a2;
  if (a3 != a2)
  {
    v23 = *(_QWORD *)(v21 + 72);
    v24 = v23 * (v56 - 1);
    v53 = v23;
    v25 = v23 * v56;
    v57 = v11;
LABEL_6:
    v26 = 0;
    v27 = v47;
    v54 = v25;
    v55 = v24;
    while (1)
    {
      v28 = v12;
      v29 = *v62;
      v61 = v25 + v26;
      v30 = v25 + v26 + v29;
      v31 = v64;
      sub_1000137F0(v30, v64, &qword_10002E078);
      v60 = v24 + v26;
      sub_1000137F0(v24 + v26 + v29, v63, &qword_10002E078);
      sub_1000137F0(v31, (uint64_t)v11, &qword_10002E070);
      v32 = v28;
      v33 = v52;
      v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v52 + 48);
      if (v34(v11, 1, v28) == 1)
      {
        sub_100013834((uint64_t)v11, &qword_10002E070);
        sub_100013834(v63, &qword_10002E078);
        result = sub_100013834(v64, &qword_10002E078);
        v12 = v28;
        v25 = v54;
        v24 = v55;
LABEL_5:
        v24 += v53;
        v25 += v53;
        if (++v56 == v46)
          return result;
        goto LABEL_6;
      }
      v59 = v27;
      v35 = v11;
      v36 = *(void (**)(char *, char *, uint64_t))(v33 + 32);
      v37 = v63;
      v38 = v51;
      v36(v51, v35, v32);
      sub_1000137F0(v37, (uint64_t)v9, &qword_10002E070);
      if (v34(v9, 1, v32) == 1)
      {
        (*(void (**)(char *, uint64_t))(v33 + 8))(v38, v32);
        sub_100013834((uint64_t)v9, &qword_10002E070);
        sub_100013834(v37, &qword_10002E078);
        result = sub_100013834(v64, &qword_10002E078);
        v12 = v32;
        v25 = v54;
        v24 = v55;
        v39 = v59;
      }
      else
      {
        v40 = v49;
        v36(v49, v9, v32);
        v50 = static Date.< infix(_:_:)(v38, v40);
        v41 = *(void (**)(char *, uint64_t))(v33 + 8);
        v41(v40, v32);
        v41(v38, v32);
        sub_100013834(v37, &qword_10002E078);
        result = sub_100013834(v64, &qword_10002E078);
        v11 = v57;
        v12 = v32;
        v25 = v54;
        v24 = v55;
        v39 = v59;
        if ((v50 & 1) == 0)
          goto LABEL_5;
      }
      v42 = *v62;
      if (!*v62)
        break;
      v43 = v42 + v25 + v26;
      v44 = v42 + v24 + v26;
      sub_1000137AC(v43, v58, &qword_10002E078);
      swift_arrayInitWithTakeFrontToBack(v43, v44, 1, v48);
      result = sub_1000137AC(v58, v44, &qword_10002E078);
      v26 -= v53;
      v27 = v39 + 1;
      v11 = v57;
      if (v56 == v27)
        goto LABEL_5;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_10000B584(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v22 = result;
  if (a3 != a2)
  {
    v24 = *a4;
    v4 = *a4 + 16 * a3 - 16;
LABEL_6:
    v6 = *(_OWORD *)(v24 + 16 * a3);
    v28 = v22;
    v23 = v4;
    v25 = a3;
    while (1)
    {
      v27 = *((_QWORD *)&v6 + 1);
      v7 = *(void **)v4;
      v8 = *(_QWORD *)(v4 + 8);
      v9 = (id)v6;
      swift_bridgeObjectRetain(v27);
      v10 = v7;
      v26 = v8;
      swift_bridgeObjectRetain(v8);
      v11 = objc_msgSend(v9, "displayName");
      v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
      v14 = v13;

      v15 = objc_msgSend(v10, "displayName");
      v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      v18 = v17;

      if (v12 == v16 && v14 == v18)
      {
        swift_bridgeObjectRelease(v27);

        swift_bridgeObjectRelease(v26);
        result = swift_bridgeObjectRelease_n(v14, 2);
        v5 = v25;
LABEL_5:
        a3 = v5 + 1;
        v4 = v23 + 16;
        if (a3 == a2)
          return result;
        goto LABEL_6;
      }
      v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v14, v16, v18, 1);
      swift_bridgeObjectRelease(v27);

      swift_bridgeObjectRelease(v26);
      swift_bridgeObjectRelease(v14);
      result = swift_bridgeObjectRelease(v18);
      v5 = v25;
      if ((v20 & 1) == 0)
        goto LABEL_5;
      if (!v24)
        break;
      v6 = *(_OWORD *)(v4 + 16);
      *(_OWORD *)(v4 + 16) = *(_OWORD *)v4;
      *(_OWORD *)v4 = v6;
      v4 -= 16;
      if (v25 == ++v28)
        goto LABEL_5;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_10000B75C(void **a1, void **a2, unint64_t a3, void **a4, void (*a5)(char *__return_ptr, void **, void **), uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void **v19;
  void **v20;
  void **v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void **v26;
  void **v27;
  void **v28;
  void **v29;
  void *v30;
  void *v31;
  void **v32;
  id v33;
  id v34;
  uint64_t result;
  uint64_t v36;
  void **v37;
  void (*v38)(char *__return_ptr, void **, void **);
  char v39;
  void *v40;
  void *v41;
  char *v42;
  void **v43;
  void **v44;

  v12 = swift_allocObject(&unk_100028D38, 32, 7);
  v38 = a5;
  *(_QWORD *)(v12 + 16) = a5;
  *(_QWORD *)(v12 + 24) = a6;
  v13 = (char *)a2 - (char *)a1;
  v14 = (char *)a2 - (char *)a1 + 7;
  if ((char *)a2 - (char *)a1 >= 0)
    v14 = (char *)a2 - (char *)a1;
  v15 = v14 >> 3;
  v16 = a3 - (_QWORD)a2;
  v17 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v17 = a3 - (_QWORD)a2;
  v18 = v17 >> 3;
  v37 = a1;
  v44 = a1;
  v43 = a4;
  v36 = v12;
  if (v15 >= v17 >> 3)
  {
    if (v16 >= -7)
    {
      if (a4 != a2 || &a2[v18] <= a4)
        memmove(a4, a2, 8 * v18);
      swift_retain(a6);
      v27 = &a4[v18];
      v42 = (char *)v27;
      v44 = a2;
      if (v16 >= 8 && a1 < a2)
      {
        v28 = (void **)(a3 - 8);
        v29 = a2;
        do
        {
          v30 = *(v27 - 1);
          v31 = *--v29;
          v32 = v28 + 1;
          v40 = v31;
          v41 = v30;
          v33 = v30;
          v34 = v31;
          v38(&v39, &v41, &v40);

          if (v39 == 1)
          {
            if (v32 != a2 || v28 >= a2)
              *v28 = *v29;
            v44 = v29;
          }
          else
          {
            v42 = (char *)(v27 - 1);
            if (v32 < v27 || v28 >= v27 || v32 != v27)
              *v28 = *(v27 - 1);
            v29 = a2;
            --v27;
          }
          if (v27 <= a4)
            break;
          --v28;
          a2 = v29;
        }
        while (v29 > v37);
      }
      goto LABEL_43;
    }
  }
  else if (v13 >= -7)
  {
    v19 = a1;
    if (a4 != a1 || &a1[v15] <= a4)
      memmove(a4, a1, 8 * v15);
    swift_retain(a6);
    v20 = &a4[v15];
    v42 = (char *)v20;
    if (v13 >= 8 && (unint64_t)a2 < a3)
    {
      v21 = a4;
      do
      {
        v22 = *a2;
        v40 = *v21;
        v23 = v40;
        v41 = v22;
        v24 = v22;
        v25 = v23;
        v38(&v39, &v41, &v40);

        if (v39 == 1)
        {
          v26 = a2 + 1;
          if (v19 < a2 || v19 >= v26 || v19 != a2)
            *v19 = *a2;
        }
        else
        {
          if (v19 != v21)
            *v19 = *v21;
          v43 = ++v21;
          v26 = a2;
        }
        ++v19;
        if (v21 >= v20)
          break;
        a2 = v26;
      }
      while ((unint64_t)v26 < a3);
      v44 = v19;
    }
LABEL_43:
    sub_10000C910((void **)&v44, (const void **)&v43, &v42);
    swift_release(a6);
    swift_release(v36);
    return 1;
  }
  swift_release(v12);
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000BA98(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
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
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int (*v43)(uint64_t, uint64_t, uint64_t);
  uint64_t *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  void (*v48)(char *, unint64_t, uint64_t);
  char *v49;
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  unint64_t v52;
  char *v53;
  char v54;
  void (*v55)(char *, uint64_t);
  unint64_t v56;
  BOOL v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unsigned int (*v64)(uint64_t, uint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  unint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  void (*v73)(char *, uint64_t);
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t result;
  uint64_t v79;
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  unint64_t v85;
  char *v86;
  char *v87;
  unint64_t v88;
  uint64_t v89;
  void (*v90)(char *, uint64_t, uint64_t);
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;

  v96 = a3;
  v88 = a1;
  v6 = sub_10000EFCC(&qword_10002E070);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v79 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v87 = (char *)&v79 - v11;
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v79 - v13;
  __chkstk_darwin(v12);
  v91 = (unint64_t)&v79 - v15;
  v16 = type metadata accessor for Date(0);
  v93 = *(_QWORD *)(v16 - 8);
  v94 = v16;
  v17 = __chkstk_darwin(v16);
  v81 = (char *)&v79 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __chkstk_darwin(v17);
  v83 = (char *)&v79 - v20;
  v21 = __chkstk_darwin(v19);
  v80 = (char *)&v79 - v22;
  __chkstk_darwin(v21);
  v86 = (char *)&v79 - v23;
  v89 = sub_10000EFCC(&qword_10002E078);
  v24 = __chkstk_darwin(v89);
  v84 = (char *)&v79 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __chkstk_darwin(v24);
  v92 = (unint64_t)&v79 - v27;
  v28 = __chkstk_darwin(v26);
  v90 = (void (*)(char *, uint64_t, uint64_t))((char *)&v79 - v29);
  __chkstk_darwin(v28);
  v31 = (char *)&v79 - v30;
  v95 = *(_QWORD *)(v32 + 72);
  if (!v95)
  {
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  if (a2 - v88 == 0x8000000000000000 && v95 == -1)
    goto LABEL_72;
  v33 = v96 - a2;
  if (v96 - a2 == 0x8000000000000000 && v95 == -1)
    goto LABEL_73;
  v34 = (uint64_t)(a2 - v88) / v95;
  v99 = v88;
  v98 = a4;
  v35 = v33 / v95;
  if (v34 >= v33 / v95)
  {
    if ((v35 & 0x8000000000000000) == 0)
    {
      v37 = v35 * v95;
      v38 = (uint64_t)v87;
      if (a4 < a2 || a2 + v37 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack(a4, a2, v35, v89);
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront(a4);
      }
      v56 = a4 + v37;
      v97 = a4 + v37;
      v99 = a2;
      v57 = v37 < 1 || v88 >= a2;
      v58 = (uint64_t)v84;
      if (!v57)
      {
        v95 = -v95;
        v85 = a4;
        do
        {
          v59 = (uint64_t)v9;
          v60 = v95;
          v61 = v92;
          sub_1000137F0(v56 + v95, v92, &qword_10002E078);
          v62 = a2 + v60;
          sub_1000137F0(a2 + v60, v58, &qword_10002E078);
          sub_1000137F0(v61, v38, &qword_10002E070);
          v63 = v93;
          v64 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v93 + 48);
          v65 = v38;
          v66 = v38;
          v67 = v94;
          if (v64(v65, 1, v94) == 1)
          {
            sub_100013834(v66, &qword_10002E070);
            v68 = 0;
            v9 = (char *)v59;
            v69 = v85;
          }
          else
          {
            v91 = a2;
            v70 = v83;
            v90 = *(void (**)(char *, uint64_t, uint64_t))(v63 + 32);
            v90(v83, v66, v67);
            sub_1000137F0(v58, v59, &qword_10002E070);
            if (v64(v59, 1, v67) == 1)
            {
              (*(void (**)(char *, uint64_t))(v63 + 8))(v70, v67);
              sub_100013834(v59, &qword_10002E070);
              v68 = 1;
            }
            else
            {
              v71 = v81;
              v90(v81, v59, v67);
              v72 = v67;
              v68 = static Date.< infix(_:_:)(v70, v71);
              v73 = *(void (**)(char *, uint64_t))(v63 + 8);
              v73(v71, v72);
              v73(v70, v72);
            }
            v9 = (char *)v59;
            v58 = (uint64_t)v84;
            v69 = v85;
            a2 = v91;
          }
          v74 = v95;
          v75 = v96 + v95;
          sub_100013834(v58, &qword_10002E078);
          sub_100013834(v92, &qword_10002E078);
          if ((v68 & 1) != 0)
          {
            if (v96 < a2 || v75 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack(v75, v62, 1, v89);
              v38 = (uint64_t)v87;
            }
            else
            {
              v38 = (uint64_t)v87;
              if (v96 != a2)
                swift_arrayInitWithTakeBackToFront(v75);
            }
            v99 += v74;
          }
          else
          {
            v76 = v97;
            v77 = v97 + v74;
            v97 += v74;
            if (v96 < v76 || v75 >= v76)
            {
              swift_arrayInitWithTakeFrontToBack(v75, v77, 1, v89);
              v62 = a2;
              v38 = (uint64_t)v87;
            }
            else
            {
              v38 = (uint64_t)v87;
              if (v96 != v76)
                swift_arrayInitWithTakeBackToFront(v75);
              v62 = a2;
            }
          }
          v56 = v97;
          if (v97 <= v69)
            break;
          a2 = v62;
          v96 = v75;
        }
        while (v62 > v88);
      }
LABEL_70:
      sub_10000C9B8(&v99, &v98, (uint64_t *)&v97);
      return 1;
    }
  }
  else if ((v34 & 0x8000000000000000) == 0)
  {
    v36 = v34 * v95;
    v87 = v14;
    if (a4 < v88 || v88 + v36 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack(a4, v88, v34, v89);
    }
    else if (a4 != v88)
    {
      swift_arrayInitWithTakeBackToFront(a4);
    }
    v92 = a4 + v36;
    v97 = a4 + v36;
    if (v36 >= 1 && a2 < v96)
    {
      v40 = &qword_10002E078;
      v82 = v31;
      v41 = v93;
      while (1)
      {
        sub_1000137F0(a2, (uint64_t)v31, v40);
        sub_1000137F0(a4, (uint64_t)v90, v40);
        v42 = v91;
        sub_1000137F0((uint64_t)v31, v91, &qword_10002E070);
        v43 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v41 + 48);
        v44 = v40;
        v45 = v94;
        if (v43(v42, 1, v94) == 1)
          break;
        v48 = *(void (**)(char *, unint64_t, uint64_t))(v41 + 32);
        v49 = v86;
        v50 = v90;
        v48(v86, v91, v45);
        v51 = (uint64_t)v87;
        sub_1000137F0((uint64_t)v50, (uint64_t)v87, &qword_10002E070);
        if (v43(v51, 1, v45) == 1)
        {
          (*(void (**)(char *, uint64_t))(v41 + 8))(v49, v45);
          sub_100013834(v51, &qword_10002E070);
          v40 = &qword_10002E078;
          sub_100013834((uint64_t)v50, &qword_10002E078);
          v31 = v82;
          sub_100013834((uint64_t)v82, &qword_10002E078);
        }
        else
        {
          v53 = v80;
          v48(v80, v51, v45);
          v54 = static Date.< infix(_:_:)(v86, v53);
          v55 = *(void (**)(char *, uint64_t))(v41 + 8);
          v55(v53, v45);
          v55(v86, v45);
          v40 = &qword_10002E078;
          sub_100013834((uint64_t)v50, &qword_10002E078);
          v31 = v82;
          sub_100013834((uint64_t)v82, &qword_10002E078);
          if ((v54 & 1) == 0)
            goto LABEL_25;
        }
        v46 = v99;
        v52 = a2 + v95;
        if (v99 < a2 || v99 >= v52)
        {
          swift_arrayInitWithTakeFrontToBack(v99, a2, 1, v89);
        }
        else if (v99 == a2)
        {
          v46 = a2;
        }
        else
        {
          swift_arrayInitWithTakeBackToFront(v99);
        }
LABEL_40:
        v99 = v46 + v95;
        a4 = v98;
        if (v98 < v92)
        {
          a2 = v52;
          if (v52 < v96)
            continue;
        }
        goto LABEL_70;
      }
      sub_100013834(v91, &qword_10002E070);
      sub_100013834((uint64_t)v90, v44);
      sub_100013834((uint64_t)v31, v44);
      v40 = v44;
LABEL_25:
      v46 = v99;
      v47 = v98 + v95;
      if (v99 < v98 || v99 >= v47)
      {
        swift_arrayInitWithTakeFrontToBack(v99, v98, 1, v89);
      }
      else if (v99 != v98)
      {
        swift_arrayInitWithTakeBackToFront(v99);
      }
      v98 = v47;
      v52 = a2;
      goto LABEL_40;
    }
    goto LABEL_70;
  }
LABEL_74:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000C37C(void **__src, void **a2, unint64_t a3, void **__dst)
{
  char *v4;
  void **v5;
  void **v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29;
  void **v30;
  void **v31;
  char *v32;
  void **v33;
  void **v34;
  uint64_t v35;
  char *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v50;
  void **v51;
  char *v52;
  uint64_t result;
  void *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  unint64_t v59;
  void **v60;
  void **v61;
  char *v62;
  char *v63;
  void **v64;
  void **v65;
  char *v66;
  void **v67;
  void **v68;

  v4 = (char *)__dst;
  v5 = a2;
  v6 = __src;
  v7 = (char *)a2 - (char *)__src;
  v8 = (char *)a2 - (char *)__src + 15;
  if ((char *)a2 - (char *)__src >= 0)
    v8 = (char *)a2 - (char *)__src;
  v9 = v8 >> 4;
  v10 = a3 - (_QWORD)a2;
  v11 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v11 = a3 - (_QWORD)a2;
  v12 = v11 >> 4;
  v68 = __src;
  v67 = __dst;
  if (v9 >= v11 >> 4)
  {
    if (v10 < -15)
      goto LABEL_56;
    if (__dst != a2 || &a2[2 * v12] <= __dst)
      memmove(__dst, a2, 16 * v12);
    v32 = &v4[16 * v12];
    v66 = v32;
    v68 = v5;
    if (v6 >= v5 || v10 < 16)
    {
LABEL_55:
      sub_10000CAC8((void **)&v68, (const void **)&v67, &v66);
      return 1;
    }
    v33 = (void **)(a3 - 16);
    v34 = v5;
    v61 = v6;
    v63 = v4;
    while (1)
    {
      v65 = v5;
      v59 = (unint64_t)v32;
      v35 = *((_QWORD *)v32 - 1);
      v36 = v32 - 16;
      v37 = *(v34 - 2);
      v38 = (uint64_t)*(v34 - 1);
      v34 -= 2;
      v39 = *((id *)v32 - 2);
      v55 = v35;
      swift_bridgeObjectRetain(v35);
      v40 = v37;
      v57 = v38;
      swift_bridgeObjectRetain(v38);
      v54 = v39;
      v41 = objc_msgSend(v39, "displayName");
      v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
      v44 = v43;

      v45 = objc_msgSend(v40, "displayName");
      v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v45);
      v48 = v47;

      if (v42 == v46 && v44 == v48)
      {
        v50 = 0;
        v48 = v44;
      }
      else
      {
        v50 = _stringCompareWithSmolCheck(_:_:expecting:)(v42, v44, v46, v48, 1);
      }
      v51 = v33 + 2;
      swift_bridgeObjectRelease(v44);
      swift_bridgeObjectRelease(v48);
      swift_bridgeObjectRelease(v55);

      swift_bridgeObjectRelease(v57);
      if ((v50 & 1) != 0)
        break;
      v66 = v36;
      if ((unint64_t)v51 < v59 || (unint64_t)v33 >= v59)
      {
        *(_OWORD *)v33 = *(_OWORD *)v36;
        v34 = v65;
        v32 = v36;
        goto LABEL_53;
      }
      v34 = v65;
      if (v51 != (void **)v59)
        *(_OWORD *)v33 = *(_OWORD *)v36;
      v32 = v36;
      v52 = v63;
      if (v65 <= v61)
        goto LABEL_55;
LABEL_54:
      v33 -= 2;
      v5 = v34;
      if (v32 <= v52)
        goto LABEL_55;
    }
    v32 = (char *)v59;
    if (v51 != v65 || v33 >= v65)
      *(_OWORD *)v33 = *(_OWORD *)v34;
    v68 = v34;
LABEL_53:
    v52 = v63;
    if (v34 <= v61)
      goto LABEL_55;
    goto LABEL_54;
  }
  if (v7 >= -15)
  {
    if (__dst != __src || &__src[2 * v9] <= __dst)
      memmove(__dst, __src, 16 * v9);
    v56 = &v4[16 * v9];
    v66 = v56;
    if ((unint64_t)v5 < a3 && v7 >= 16)
    {
      while (1)
      {
        v60 = v6;
        v62 = v4;
        v64 = v5;
        v13 = *v5;
        v14 = v5[1];
        v15 = *(void **)v4;
        v16 = *((_QWORD *)v4 + 1);
        v17 = v13;
        swift_bridgeObjectRetain(v14);
        v18 = v15;
        v19 = v16;
        swift_bridgeObjectRetain(v16);
        v20 = objc_msgSend(v17, "displayName");
        v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
        v23 = v22;

        v24 = objc_msgSend(v18, "displayName");
        v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
        v27 = v26;

        if (v21 == v25 && v23 == v27)
          break;
        v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v21, v23, v25, v27, 1);
        swift_bridgeObjectRelease(v14);

        swift_bridgeObjectRelease(v19);
        swift_bridgeObjectRelease(v23);
        swift_bridgeObjectRelease(v27);
        if ((v29 & 1) == 0)
          goto LABEL_22;
        v4 = v62;
        v30 = v64 + 2;
        v31 = v60;
        if (v60 < v64 || v60 >= v30 || v60 != v64)
          *(_OWORD *)v60 = *(_OWORD *)v64;
LABEL_25:
        v6 = v31 + 2;
        if (v4 < v56)
        {
          v5 = v30;
          if ((unint64_t)v30 < a3)
            continue;
        }
        v68 = v6;
        goto LABEL_55;
      }
      swift_bridgeObjectRelease(v14);

      swift_bridgeObjectRelease(v19);
      swift_bridgeObjectRelease_n(v23, 2);
LABEL_22:
      v31 = v60;
      v30 = v64;
      if (v60 != (void **)v62)
        *(_OWORD *)v60 = *(_OWORD *)v62;
      v4 = v62 + 16;
      v67 = (void **)(v62 + 16);
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_56:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

char *sub_10000C818(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000EFCC(&qword_10002E0C0);
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

char *sub_10000C910(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;
  char v9;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    v9 = 2;
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v9, 1046, 0);
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

uint64_t sub_10000C9B8(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = sub_10000EFCC(&qword_10002E078);
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
  v10 = v8 / v7;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v10 * v7)
    return swift_arrayInitWithTakeFrontToBack(v3, v4, v10, result);
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront(v3);
  return result;
}

char *sub_10000CAC8(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;
  char v9;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    v9 = 2;
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v9, 1046, 0);
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

char *sub_10000CB70(uint64_t a1)
{
  return sub_10000C818(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_10000CB84(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  char v12;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = v2;
    v8 = ~v4;
    do
    {
      v9 = *(void **)(*(_QWORD *)(v6 + 48) + 8 * v5);
      if (v9)
      {
        if (a1)
        {
          sub_100013968(0, (unint64_t *)&unk_10002E6F0, REMObjectID_ptr);
          v10 = v9;
          v11 = a1;
          v12 = static NSObject.== infix(_:_:)(v10, v11);

          if ((v12 & 1) != 0)
            return v5;
        }
      }
      else if (!a1)
      {
        return v5;
      }
      v5 = (v5 + 1) & v8;
    }
    while (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_10000CC84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char v25;
  void (*v26)(char *, uint64_t);
  char *v27;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v3 = v2;
  v35 = a1;
  v5 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v30 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10000EFCC(&qword_10002E0D0);
  __chkstk_darwin(v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10000EFCC(&qword_10002E070);
  v12 = __chkstk_darwin(v11);
  __chkstk_darwin(v12);
  v16 = (char *)&v29 - v15;
  v17 = v3 + 64;
  v36 = v3;
  v18 = -1 << *(_BYTE *)(v3 + 32);
  v19 = a2 & ~v18;
  if (((*(_QWORD *)(v3 + 64 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) != 0)
  {
    v32 = v14;
    v33 = ~v18;
    v34 = *(_QWORD *)(v13 + 72);
    v29 = v8;
    v31 = v3 + 64;
    while (1)
    {
      sub_1000137F0(*(_QWORD *)(v36 + 48) + v34 * v19, (uint64_t)v16, &qword_10002E070);
      v20 = (uint64_t)&v10[*(int *)(v8 + 48)];
      sub_1000137F0((uint64_t)v16, (uint64_t)v10, &qword_10002E070);
      sub_1000137F0(v35, v20, &qword_10002E070);
      v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
      if (v21(v10, 1, v5) == 1)
        break;
      v22 = v32;
      sub_1000137F0((uint64_t)v10, v32, &qword_10002E070);
      if (v21((char *)v20, 1, v5) == 1)
      {
        (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v22, v5);
        v17 = v31;
LABEL_4:
        sub_100013834((uint64_t)v10, &qword_10002E0D0);
        sub_100013834((uint64_t)v16, &qword_10002E070);
        goto LABEL_5;
      }
      v23 = v30;
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v30, v20, v5);
      v24 = sub_100011838(&qword_10002E0D8, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
      v25 = dispatch thunk of static Equatable.== infix(_:_:)(v22, v23, v5, v24);
      v26 = *(void (**)(char *, uint64_t))(v6 + 8);
      v27 = v23;
      v8 = v29;
      v26(v27, v5);
      v26((char *)v22, v5);
      sub_100013834((uint64_t)v10, &qword_10002E070);
      sub_100013834((uint64_t)v16, &qword_10002E070);
      v17 = v31;
      if ((v25 & 1) != 0)
        return v19;
LABEL_5:
      v19 = (v19 + 1) & v33;
      if (((*(_QWORD *)(v17 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
        return v19;
    }
    if (v21((char *)v20, 1, v5) == 1)
    {
      sub_100013834((uint64_t)v10, &qword_10002E070);
      sub_100013834((uint64_t)v16, &qword_10002E070);
      return v19;
    }
    goto LABEL_4;
  }
  return v19;
}

unint64_t sub_10000CFB0(int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_BYTE *)(v7 + result) != (a1 & 1))
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (((*(unsigned __int8 *)(v7 + result) ^ a1) & 1) == 0)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_10000D05C(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_10000D13C(uint64_t a1, uint64_t a2)
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

unint64_t sub_10000D2B0(uint64_t a1, uint64_t a2, unint64_t *a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t i;
  id v8;
  char v9;
  uint64_t v10;
  id v11;
  char v12;

  v5 = v4 + 64;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  i = a2 & ~v6;
  if (((*(_QWORD *)(v4 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_100013968(0, a3, a4);
    v8 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * i);
    v9 = static NSObject.== infix(_:_:)();

    if ((v9 & 1) == 0)
    {
      v10 = ~v6;
      for (i = (i + 1) & v10; ((*(_QWORD *)(v5 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v10)
      {
        v11 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * i);
        v12 = static NSObject.== infix(_:_:)();

        if ((v12 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_10000D3C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  Swift::Int v15;
  unint64_t v16;
  uint64_t result;
  _QWORD v19[9];

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v19[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10000EFCC(&qword_10002E070);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v19[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  Hasher.init(_seed:)(v19, *(_QWORD *)(a3 + 40));
  sub_1000137F0(a1, (uint64_t)v13, &qword_10002E070);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v13, 1, v6) == 1)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v13, v6);
    Hasher._combine(_:)(1u);
    v14 = sub_100011838(&qword_10002E0A8, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
    dispatch thunk of Hashable.hash(into:)(v19, v6, v14);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v15 = Hasher._finalize()();
  v16 = _HashTable.nextHole(atOrAfter:)(v15 & ~(-1 << *(_BYTE *)(a3 + 32)), a3 + 64, ~(-1 << *(_BYTE *)(a3 + 32)));
  *(_QWORD *)(a3 + 64 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
  result = sub_1000137AC(a1, *(_QWORD *)(a3 + 48) + *(_QWORD *)(v11 + 72) * v16, &qword_10002E070);
  *(_QWORD *)(*(_QWORD *)(a3 + 56) + 8 * v16) = a2;
  ++*(_QWORD *)(a3 + 16);
  return result;
}

uint64_t sub_10000D5A0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_10000DAEC(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_10002E6D0, type metadata accessor for TTRIIntentsSnippetSection);
  *v3 = result;
  return result;
}

uint64_t sub_10000D5CC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_10000D984(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10000D5E8(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_10000DAEC(a1, a2, a3, (_QWORD *)*v3, &qword_10002E108, type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
  *v3 = result;
  return result;
}

uint64_t sub_10000D614(char a1, int64_t a2, char a3, _QWORD *a4)
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
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
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
  v10 = sub_10000EFCC(&qword_10002E0C8);
  v11 = *(_QWORD *)(sub_10000EFCC(&qword_10002E078) - 8);
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
  v18 = sub_10000EFCC(&qword_10002E078);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v15 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v21);
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v8;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000D7FC(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_10000EFCC(&qword_10002E0F8);
    v11 = (_QWORD *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 4);
  }
  else
  {
    v11 = _swiftEmptyArrayStorage;
  }
  v14 = (unint64_t)(v11 + 4);
  v15 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= v15 + 16 * v8)
      memmove(v11 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v15 >= v14 + 16 * v8 || v14 >= v15 + 16 * v8)
  {
    sub_10000EFCC(&qword_10002E100);
    swift_arrayInitWithCopy(v11 + 4);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000D984(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000EFCC(&qword_10002E110);
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
    v11 = (char *)_swiftEmptyArrayStorage;
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
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000DAEC(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  size_t v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v13 = sub_10000EFCC(a5);
  v14 = *(_QWORD *)(a6(0) - 8);
  v15 = *(_QWORD *)(v14 + 72);
  v16 = *(unsigned __int8 *)(v14 + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (_QWORD *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  v19 = j__malloc_size(v18);
  if (!v15)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v19 - v17 == 0x8000000000000000 && v15 == -1)
    goto LABEL_34;
  v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v15);
LABEL_19:
  v21 = a6(0);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  v24 = (char *)v18 + v23;
  v25 = (char *)a4 + v23;
  if ((a1 & 1) != 0)
  {
    if (v18 < a4 || v24 >= &v25[*(_QWORD *)(v22 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack(v24, v25, v11, v21);
    }
    else if (v18 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v26 = *(_QWORD *)(v22 + 72) * v11;
  v27 = &v24[v26];
  v28 = (unint64_t)&v25[v26];
  if (v25 >= v27 || (unint64_t)v24 >= v28)
  {
    swift_arrayInitWithCopy(v24);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v18;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000DCCC(Swift::Int *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  char v17;
  uint64_t v18;
  id v19;
  char v20;
  void *v21;
  id v22;
  Swift::Int v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  Swift::Int v32;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v2);
    v8 = a2;
    v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease(v6);

      v31 = v9;
      v10 = sub_100013968(0, (unint64_t *)&unk_10002E6F0, REMObjectID_ptr);
      swift_unknownObjectRetain(v9);
      swift_dynamicCast(&v32, &v31, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
      *a1 = v32;
      swift_unknownObjectRelease(v9);
      return 0;
    }
    result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v23 = sub_10000DF68(v7, result + 1);
    v32 = v23;
    v24 = *(_QWORD *)(v23 + 16);
    if (*(_QWORD *)(v23 + 24) <= v24)
    {
      v29 = v24 + 1;
      v30 = v8;
      sub_10000E15C(v29);
      v25 = v32;
    }
    else
    {
      v25 = v23;
      v26 = v8;
    }
    sub_10000E3F8((uint64_t)v8, v25);
    v28 = *v3;
    *v3 = v25;
  }
  else
  {
    v12 = *(_QWORD *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    v13 = NSObject._rawHashValue(seed:)(v12);
    v14 = -1 << *(_BYTE *)(v6 + 32);
    v15 = v13 & ~v14;
    if (((*(_QWORD *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
    {
      sub_100013968(0, (unint64_t *)&unk_10002E6F0, REMObjectID_ptr);
      v16 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
      v17 = static NSObject.== infix(_:_:)(v16, a2);

      if ((v17 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        v21 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v15);
        *a1 = (Swift::Int)v21;
        v22 = v21;
        return 0;
      }
      v18 = ~v14;
      while (1)
      {
        v15 = (v15 + 1) & v18;
        if (((*(_QWORD *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
          break;
        v19 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
        v20 = static NSObject.== infix(_:_:)(v19, a2);

        if ((v20 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    v8 = a2;
    sub_10000E478((uint64_t)v8, v15, isUniquelyReferenced_nonNull_native);
    v28 = *v3;
    *v3 = v32;
  }
  swift_bridgeObjectRelease(v28);
  *a1 = (Swift::Int)v8;
  return 1;
}

Swift::Int sub_10000DF68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a2)
  {
    sub_10000EFCC(&qword_10002E130);
    v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    v23 = v4;
    v5 = __CocoaSet.makeIterator()(a1);
    v6 = __CocoaSet.Iterator.next()();
    if (v6)
    {
      v7 = v6;
      v8 = sub_100013968(0, (unint64_t *)&unk_10002E6F0, REMObjectID_ptr);
      do
      {
        v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7);
        v4 = v23;
        v16 = *(_QWORD *)(v23 + 16);
        if (*(_QWORD *)(v23 + 24) <= v16)
        {
          sub_10000E15C(v16 + 1);
          v4 = v23;
        }
        v9 = v22;
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
        v11 = v4 + 56;
        v12 = -1 << *(_BYTE *)(v4 + 32);
        v13 = result & ~v12;
        v14 = v13 >> 6;
        if (((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6))) != 0)
        {
          v15 = __clz(__rbit64((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v17 = 0;
          v18 = (unint64_t)(63 - v12) >> 6;
          do
          {
            if (++v14 == v18 && (v17 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v19 = v14 == v18;
            if (v14 == v18)
              v14 = 0;
            v17 |= v19;
            v20 = *(_QWORD *)(v11 + 8 * v14);
          }
          while (v20 == -1);
          v15 = __clz(__rbit64(~v20)) + (v14 << 6);
        }
        *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = v9;
        ++*(_QWORD *)(v4 + 16);
        v7 = __CocoaSet.Iterator.next()();
      }
      while (v7);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v4;
}

Swift::Int sub_10000E15C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_10000EFCC(&qword_10002E130);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v8 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v3 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain(v3);
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_36;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_36;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_36;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_36:
                swift_release(v3);
                v2 = v30;
                v29 = 1 << *(_BYTE *)(v3 + 32);
                if (v29 > 63)
                  bzero((void *)(v3 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v14 >= v11)
                    goto LABEL_36;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_26:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v17);
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

unint64_t sub_10000E3F8(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  unint64_t result;

  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
  result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1 << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1 << *(_BYTE *)(a2 + 32)));
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_10000E478(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_14;
  v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_10000E15C(v9);
  }
  else
  {
    if (v8 > v7)
    {
      sub_10000E5FC();
      goto LABEL_14;
    }
    sub_10000E7A4(v9);
  }
  v10 = *v3;
  v11 = NSObject._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v12 = -1 << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v13 = sub_100013968(0, (unint64_t *)&unk_10002E6F0, REMObjectID_ptr);
    v14 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
    v15 = static NSObject.== infix(_:_:)(v14, a1);

    if ((v15 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v13);
      __break(1u);
    }
    else
    {
      v16 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v16;
        if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
        v18 = static NSObject.== infix(_:_:)(v17, a1);

        if ((v18 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v19 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8 * a2) = a1;
  v20 = *(_QWORD *)(v19 + 16);
  v21 = __OFADD__(v20, 1);
  v22 = v20 + 1;
  if (v21)
    __break(1u);
  else
    *(_QWORD *)(v19 + 16) = v22;
}

id sub_10000E5FC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_10000EFCC(&qword_10002E130);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_10000E7A4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  Swift::Int v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_10000EFCC(&qword_10002E130);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v30 = v2;
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain(v3);
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_27;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_27:
    v21 = *(_QWORD *)(v6 + 40);
    v22 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v17);
    result = NSObject._rawHashValue(seed:)(v21);
    v23 = -1 << *(_BYTE *)(v6 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v25);
      }
      while (v29 == -1);
      v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v22;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v30;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_10000EA1C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t i;
  void (*v13)(_QWORD *);
  id *v14;
  id v15;
  uint64_t v16;
  uint64_t result;
  void (*v18[4])(id *);

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v16 = a3;
    else
      v16 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a3);
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
    goto LABEL_25;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    if (a3 < 0)
      v10 = a3;
    else
      v10 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a3);
    if (v11 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1000139A0(&qword_10002E0B8, &qword_10002E0B0);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_10000EFCC(&qword_10002E0B0);
          v13 = sub_10000EE44(v18, i, a3);
          v15 = *v14;
          ((void (*)(void (**)(id *), _QWORD))v13)(v18, 0);
          *(_QWORD *)(a1 + 8 * i) = v15;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100013968(0, &qword_10002E6E0, REMReminder_ptr);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000EC30(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t i;
  void (*v13)(_QWORD *);
  id *v14;
  id v15;
  uint64_t v16;
  uint64_t result;
  void (*v18[4])(id *);

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v16 = a3;
    else
      v16 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a3);
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
    goto LABEL_25;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    if (a3 < 0)
      v10 = a3;
    else
      v10 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a3);
    if (v11 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1000139A0(&qword_10002E148, &qword_10002E140);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_10000EFCC(&qword_10002E140);
          v13 = sub_10000EE9C(v18, i, a3);
          v15 = *v14;
          ((void (*)(void (**)(id *), _QWORD))v13)(v18, 0);
          *(_QWORD *)(a1 + 8 * i) = v15;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100013968(0, &qword_10002E138, INTask_ptr);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

void (*sub_10000EE44(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_10000EF1C(v6, a2, a3);
  return sub_10000EE98;
}

void (*sub_10000EE9C(void (**a1)(id *), unint64_t a2, uint64_t a3))(_QWORD *)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_10000F050(v6, a2, a3);
  return sub_10000EE98;
}

void sub_10000EEF0(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_10000EF1C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
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
    return sub_10000EF88;
  }
  __break(1u);
  return result;
}

void sub_10000EF88(id *a1)
{

}

uint64_t type metadata accessor for TTRIIntentsSnippetSection(uint64_t a1)
{
  uint64_t result;

  result = qword_10002E1B0;
  if (!qword_10002E1B0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TTRIIntentsSnippetSection);
  return result;
}

uint64_t sub_10000EFCC(uint64_t *a1)
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

uint64_t sub_10000F00C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TTRIIntentsSnippetSection(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void (*sub_10000F050(void (*result)(id *), unint64_t a2, uint64_t a3))(id *)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
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
    return sub_100014308;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000F0BC(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_10000F0D0(_QWORD *a1)
{
  return sub_10000D614(0, a1[2], 0, a1);
}

uint64_t sub_10000F0E4(_QWORD *a1)
{
  return sub_10000D7FC(0, a1[2], 0, a1);
}

uint64_t sub_10000F0F8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  _QWORD *v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v8 = sub_10000EFCC(&qword_10002E078);
  v36 = *(_QWORD *)(v8 - 8);
  v37 = v8;
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = __chkstk_darwin(v9);
  v14 = (char *)&v30 - v13;
  v15 = *(_QWORD *)(a4 + 64);
  v34 = a4 + 64;
  v16 = -1 << *(_BYTE *)(a4 + 32);
  if (-v16 < 64)
    v17 = ~(-1 << -(char)v16);
  else
    v17 = -1;
  v18 = v17 & v15;
  if (!a2)
  {
    v19 = 0;
    a3 = 0;
LABEL_39:
    v29 = v34;
    *a1 = a4;
    a1[1] = v29;
    a1[2] = ~v16;
    a1[3] = v19;
    a1[4] = v18;
    return a3;
  }
  if (!a3)
  {
    v19 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v31 = -1 << *(_BYTE *)(a4 + 32);
  v32 = a1;
  v19 = 0;
  v20 = 0;
  v33 = (unint64_t)(63 - v16) >> 6;
  v30 = v33 - 1;
  v35 = a3;
  if (!v18)
    goto LABEL_9;
LABEL_8:
  v21 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  v22 = v21 | (v19 << 6);
  while (1)
  {
    ++v20;
    v26 = *(_QWORD *)(a4 + 48);
    v27 = sub_10000EFCC(&qword_10002E070);
    sub_1000137F0(v26 + *(_QWORD *)(*(_QWORD *)(v27 - 8) + 72) * v22, (uint64_t)v11, &qword_10002E070);
    v28 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v22);
    *(_QWORD *)&v11[*(int *)(v37 + 48)] = v28;
    sub_1000137AC((uint64_t)v11, (uint64_t)v14, &qword_10002E078);
    sub_1000137AC((uint64_t)v14, a2, &qword_10002E078);
    a3 = v35;
    if (v20 == v35)
    {
      swift_bridgeObjectRetain(v28);
      goto LABEL_38;
    }
    a2 += *(_QWORD *)(v36 + 72);
    result = swift_bridgeObjectRetain(v28);
    if (v18)
      goto LABEL_8;
LABEL_9:
    v23 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v23 >= v33)
      goto LABEL_33;
    v24 = *(_QWORD *)(v34 + 8 * v23);
    if (!v24)
    {
      v19 += 2;
      if (v23 + 1 >= v33)
      {
        v18 = 0;
        v19 = v23;
      }
      else
      {
        v24 = *(_QWORD *)(v34 + 8 * v19);
        if (v24)
          goto LABEL_14;
        v25 = v23 + 2;
        if (v23 + 2 >= v33)
          goto LABEL_33;
        v24 = *(_QWORD *)(v34 + 8 * v25);
        if (v24)
        {
LABEL_17:
          v23 = v25;
          goto LABEL_18;
        }
        v19 = v23 + 3;
        if (v23 + 3 < v33)
        {
          v24 = *(_QWORD *)(v34 + 8 * v19);
          if (v24)
          {
LABEL_14:
            v23 = v19;
            goto LABEL_18;
          }
          v25 = v23 + 4;
          if (v23 + 4 >= v33)
          {
LABEL_33:
            v18 = 0;
            goto LABEL_37;
          }
          v24 = *(_QWORD *)(v34 + 8 * v25);
          if (!v24)
          {
            while (1)
            {
              v23 = v25 + 1;
              if (__OFADD__(v25, 1))
                goto LABEL_42;
              if (v23 >= v33)
              {
                v18 = 0;
                v19 = v30;
                goto LABEL_37;
              }
              v24 = *(_QWORD *)(v34 + 8 * v23);
              ++v25;
              if (v24)
                goto LABEL_18;
            }
          }
          goto LABEL_17;
        }
        v18 = 0;
        v19 = v23 + 2;
      }
LABEL_37:
      a3 = v20;
LABEL_38:
      v16 = v31;
      a1 = v32;
      goto LABEL_39;
    }
LABEL_18:
    v18 = (v24 - 1) & v24;
    v22 = __clz(__rbit64(v24)) + (v23 << 6);
    v19 = v23;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_10000F400(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;

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
LABEL_39:
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
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  v25 = -1 << *(_BYTE *)(a4 + 32);
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    v20 = 8 * v16;
    v21 = *(void **)(*(_QWORD *)(a4 + 48) + v20);
    ++v13;
    v22 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + v20);
    *v11 = v21;
    v11[1] = v22;
    if (v13 == v10)
    {
      v24 = v21;
      swift_bridgeObjectRetain(v22);
      goto LABEL_38;
    }
    v11 += 2;
    v23 = v21;
    result = swift_bridgeObjectRetain(v22);
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        v9 = 0;
        v12 = v17;
      }
      else
      {
        v18 = *(_QWORD *)(v6 + 8 * v12);
        if (v18)
          goto LABEL_14;
        v19 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_33;
        v18 = *(_QWORD *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          v17 = v19;
          goto LABEL_18;
        }
        v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
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
            goto LABEL_37;
          }
          v18 = *(_QWORD *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              v17 = v19 + 1;
              if (__OFADD__(v19, 1))
                goto LABEL_42;
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
          }
          goto LABEL_17;
        }
        v9 = 0;
        v12 = v17 + 2;
      }
LABEL_37:
      v10 = v13;
LABEL_38:
      v7 = v25;
      goto LABEL_39;
    }
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_10000F614(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a4;
  v6 = a2;
  v7 = (_QWORD *)result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a4 < 0)
      v8 = a4;
    else
      v8 = a4 & 0xFFFFFFFFFFFFFF8;
    result = __CocoaDictionary.makeIterator()(v8);
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v4 = result | 0x8000000000000000;
    if (v6)
      goto LABEL_6;
LABEL_39:
    v12 = 0;
    a3 = 0;
LABEL_48:
    *v7 = v4;
    v7[1] = v9;
    v7[2] = v10;
    v7[3] = v12;
    v7[4] = v11;
    return a3;
  }
  v25 = -1 << *(_BYTE *)(a4 + 32);
  v9 = a4 + 64;
  v26 = ~v25;
  v27 = -v25;
  if (v27 < 64)
    v28 = ~(-1 << v27);
  else
    v28 = -1;
  v11 = v28 & *(_QWORD *)(a4 + 64);
  v10 = v26;
  if (!a2)
    goto LABEL_39;
LABEL_6:
  if (!a3)
  {
    v12 = 0;
    goto LABEL_48;
  }
  if (a3 < 0)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  v29 = v10;
  v30 = v7;
  v12 = 0;
  v13 = 0;
  v31 = (unint64_t)(v10 + 64) >> 6;
  while ((v4 & 0x8000000000000000) != 0)
  {
    v19 = v9;
    v20 = __CocoaDictionary.Iterator.next()();
    if (!v20)
    {
      a3 = v13;
LABEL_47:
      v10 = v29;
      v7 = v30;
      goto LABEL_48;
    }
    v22 = v21;
    swift_unknownObjectRelease(v20);
    v32 = v22;
    v23 = sub_100013968(0, &qword_10002E6E0, REMReminder_ptr);
    swift_unknownObjectRetain(v22);
    swift_dynamicCast(&v33, &v32, (char *)&type metadata for Swift.AnyObject + 8, v23, 7);
    v16 = v33;
    result = swift_unknownObjectRelease(v22);
    v9 = v19;
    if (!v16)
      goto LABEL_46;
LABEL_11:
    ++v13;
    *v6++ = v16;
    if (v13 == a3)
      goto LABEL_47;
  }
  if (v11)
  {
    v14 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    v15 = v14 | (v12 << 6);
    goto LABEL_10;
  }
  v17 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_50;
  }
  if (v17 >= v31)
    goto LABEL_42;
  v18 = *(_QWORD *)(v9 + 8 * v17);
  if (v18)
    goto LABEL_26;
  v12 += 2;
  if (v17 + 1 >= v31)
  {
    v11 = 0;
    v12 = v17;
    goto LABEL_46;
  }
  v18 = *(_QWORD *)(v9 + 8 * v12);
  if (v18)
  {
LABEL_19:
    v17 = v12;
LABEL_26:
    v11 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
LABEL_10:
    result = (uint64_t)*(id *)(*(_QWORD *)(v4 + 56) + 8 * v15);
    v16 = result;
    if (!result)
      goto LABEL_46;
    goto LABEL_11;
  }
  v24 = v17 + 2;
  if (v17 + 2 >= v31)
    goto LABEL_42;
  v18 = *(_QWORD *)(v9 + 8 * v24);
  if (v18)
  {
LABEL_25:
    v17 = v24;
    goto LABEL_26;
  }
  v12 = v17 + 3;
  if (v17 + 3 >= v31)
  {
    v11 = 0;
    v12 = v17 + 2;
    goto LABEL_46;
  }
  v18 = *(_QWORD *)(v9 + 8 * v12);
  if (v18)
    goto LABEL_19;
  v24 = v17 + 4;
  if (v17 + 4 >= v31)
  {
LABEL_42:
    v11 = 0;
LABEL_46:
    a3 = v13;
    goto LABEL_47;
  }
  v18 = *(_QWORD *)(v9 + 8 * v24);
  if (v18)
    goto LABEL_25;
  while (1)
  {
    v17 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v17 >= v31)
    {
      v11 = 0;
      v12 = v31 - 1;
      goto LABEL_46;
    }
    v18 = *(_QWORD *)(v9 + 8 * v17);
    ++v24;
    if (v18)
      goto LABEL_26;
  }
LABEL_51:
  __break(1u);
  return result;
}

BOOL sub_10000F8E4(void *a1, void *a2)
{
  id v3;

  v3 = objc_msgSend(a1, "icsDisplayOrder");
  return v3 < objc_msgSend(a2, "icsDisplayOrder");
}

uint64_t sub_10000F92C(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void **v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v13 = a1;
    else
      v13 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v13);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = sub_100013968(0, (unint64_t *)&unk_10002E6F0, REMObjectID_ptr);
  v5 = sub_100013910();
  result = Set.init(minimumCapacity:)(v3, v4, v5);
  v15 = result;
  if (v2)
  {
    if (a1 < 0)
      v8 = a1;
    else
      v8 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v7 = _CocoaArrayWrapper.endIndex.getter(v8);
    result = swift_bridgeObjectRelease(a1);
    if (!v7)
      return v15;
  }
  else
  {
    v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return v15;
  }
  if (v7 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v7; ++i)
      {
        v10 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
        sub_10000DCCC((Swift::Int *)&v14, v10);

      }
    }
    else
    {
      v11 = (void **)(a1 + 32);
      do
      {
        v12 = *v11++;
        sub_10000DCCC((Swift::Int *)&v14, v12);

        --v7;
      }
      while (v7);
    }
    return v15;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000FA84(uint64_t *a1, void (*a2)(char *__return_ptr, void **, void **), char *a3)
{
  uint64_t v3;
  unint64_t v7;
  Swift::Int v8;
  Swift::Int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  char *v15;
  Swift::Int v16;
  uint64_t v17;
  int64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  int v23;
  void **v24;
  unint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t *v30;
  int64_t v31;
  int64_t v32;
  uint64_t *v33;
  uint64_t v34;
  Swift::Int v35;
  void **v36;
  void *v37;
  int64_t v38;
  void **v39;
  unint64_t v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  unint64_t v45;
  unint64_t v46;
  char *v47;
  char *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  uint64_t v71;
  char v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  void **v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  char *v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void **v102;
  void **v103;
  unint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t *v112;
  Swift::Int v113;
  char *v114;
  char *v115;
  Swift::Int v116;
  Swift::Int v117;
  void **v118;
  unint64_t v119;
  int64_t v120;
  void **v121;
  void (*v122)(char *__return_ptr, void **, void **);
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unsigned __int8 v127;
  void *v128;
  _QWORD v129[2];
  uint64_t v130;

  v7 = swift_allocObject(&unk_100028D10, 32, 7);
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v8 = a1[1];
  swift_retain_n(a3, 4);
  v9 = _minimumMergeRunLength(_:)(v8);
  if (v9 >= v8)
  {
    if (v8 < 0)
      goto LABEL_136;
    if (v8)
    {
      swift_retain(a3);
      sub_10000AFEC(0, v8, 1, a1, a2, (uint64_t)a3);
    }
    swift_release_n(a3, 3);
    return swift_release(v7);
  }
  if (v8 >= 0)
    v10 = v8;
  else
    v10 = v8 + 1;
  if (v8 < -1)
    goto LABEL_144;
  v112 = a1;
  v113 = v9;
  v122 = a2;
  v123 = (uint64_t)a3;
  v124 = v3;
  v111 = v7;
  if (v8 < 2)
  {
    v15 = (char *)_swiftEmptyArrayStorage;
    v130 = (uint64_t)_swiftEmptyArrayStorage;
    v118 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v8 != 1)
    {
      v7 = _swiftEmptyArrayStorage[2];
LABEL_101:
      if (v7 >= 2)
      {
        v97 = *v112;
        v126 = *v112;
        do
        {
          v98 = v7 - 2;
          if (v7 < 2)
            goto LABEL_131;
          if (!v97)
            goto LABEL_143;
          v99 = (uint64_t)v15;
          v100 = *(_QWORD *)&v15[16 * v98 + 32];
          v101 = *(_QWORD *)&v15[16 * v7 + 24];
          v102 = (void **)(v97 + 8 * v100);
          v103 = (void **)(v97 + 8 * *(_QWORD *)&v15[16 * v7 + 16]);
          v104 = v97 + 8 * v101;
          swift_retain(a3);
          sub_10000B75C(v102, v103, v104, v118, v122, (uint64_t)a3);
          if (v124)
          {
            v106 = v99;
            goto LABEL_113;
          }
          if (v101 < v100)
            goto LABEL_132;
          v15 = (char *)v99;
          if ((swift_isUniquelyReferenced_nonNull_native(v99) & 1) == 0)
            v15 = sub_10000CB70(v99);
          if (v98 >= *((_QWORD *)v15 + 2))
            goto LABEL_133;
          v105 = &v15[16 * v98 + 32];
          *(_QWORD *)v105 = v100;
          *((_QWORD *)v105 + 1) = v101;
          a3 = (char *)*((_QWORD *)v15 + 2);
          if (v7 > (unint64_t)a3)
            goto LABEL_134;
          memmove(&v15[16 * v7 + 16], &v15[16 * v7 + 32], 16 * (_QWORD)&a3[-v7]);
          *((_QWORD *)v15 + 2) = a3 - 1;
          v7 = (unint64_t)(a3 - 1);
          v77 = (unint64_t)a3 > 2;
          a3 = (char *)v123;
          v97 = v126;
        }
        while (v77);
      }
LABEL_112:
      v106 = (uint64_t)v15;
LABEL_113:
      v107 = swift_bridgeObjectRelease(v106);
      *(_QWORD *)((v130 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()(v107);
      v108 = v130;
      swift_release_n(a3, 3);
      swift_release(v111);
      return swift_bridgeObjectRelease(v108);
    }
  }
  else
  {
    v11 = v10 >> 1;
    v12 = sub_100013968(0, &qword_10002E6E0, REMReminder_ptr);
    v13 = static Array._allocateBufferUninitialized(minimumCapacity:)(v11, v12);
    *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) = v11;
    v118 = (void **)((v13 & 0xFFFFFFFFFFFFFF8) + 32);
    v130 = v13;
  }
  v16 = 0;
  v17 = *a1;
  v109 = *a1 - 8;
  v110 = *a1 + 16;
  v15 = (char *)_swiftEmptyArrayStorage;
  v117 = v8;
  v125 = *a1;
  while (1)
  {
    v18 = v16;
    v7 = v16 + 1;
    v120 = v16;
    if (v16 + 1 < v8)
    {
      v114 = v15;
      v19 = *(void **)(v17 + 8 * v7);
      v128 = *(void **)(v17 + 8 * v16);
      v20 = v128;
      v129[0] = v19;
      v21 = v19;
      v22 = v20;
      a2((char *)&v127, (void **)v129, &v128);

      v23 = v127;
      v7 = v18 + 2;
      if (v18 + 2 < v8)
      {
        v24 = (void **)(v110 + 8 * v18);
        while (1)
        {
          v25 = v7;
          v26 = *v24;
          v128 = *(v24 - 1);
          v27 = v128;
          v129[0] = v26;
          v28 = v26;
          v29 = v27;
          a2((char *)&v127, (void **)v129, &v128);

          if (v23 != v127)
            break;
          v7 = v25 + 1;
          ++v24;
          if (v8 == v25 + 1)
          {
            v7 = v8;
            goto LABEL_23;
          }
        }
        v7 = v25;
LABEL_23:
        v18 = v120;
      }
      v15 = v114;
      v17 = v125;
      if (v23)
      {
        if ((uint64_t)v7 < v18)
          goto LABEL_137;
        if (v18 < (uint64_t)v7)
        {
          v30 = (uint64_t *)(v109 + 8 * v7);
          v31 = v7;
          v32 = v18;
          v33 = (uint64_t *)(v125 + 8 * v18);
          do
          {
            if (v32 != --v31)
            {
              if (!v125)
                goto LABEL_142;
              v34 = *v33;
              *v33 = *v30;
              *v30 = v34;
            }
            ++v32;
            --v30;
            ++v33;
          }
          while (v32 < v31);
        }
      }
    }
    if ((uint64_t)v7 < v8)
    {
      if (__OFSUB__(v7, v18))
        goto LABEL_135;
      if ((uint64_t)(v7 - v18) < v113)
        break;
    }
LABEL_51:
    if ((uint64_t)v7 < v18)
      goto LABEL_130;
    v116 = v7;
    if ((swift_isUniquelyReferenced_nonNull_native(v15) & 1) == 0)
      v15 = sub_10000C818(0, *((_QWORD *)v15 + 2) + 1, 1, v15);
    v46 = *((_QWORD *)v15 + 2);
    v45 = *((_QWORD *)v15 + 3);
    v7 = v46 + 1;
    v17 = v125;
    if (v46 >= v45 >> 1)
    {
      v96 = sub_10000C818((char *)(v45 > 1), v46 + 1, 1, v15);
      v17 = v125;
      v15 = v96;
    }
    *((_QWORD *)v15 + 2) = v7;
    v47 = &v15[16 * v46 + 32];
    *(_QWORD *)v47 = v18;
    *((_QWORD *)v47 + 1) = v116;
    if (v46)
    {
      v48 = v15 + 32;
      while (1)
      {
        v49 = v7 - 1;
        if (v7 >= 4)
        {
          v54 = &v48[16 * v7];
          v55 = *((_QWORD *)v54 - 8);
          v56 = *((_QWORD *)v54 - 7);
          v60 = __OFSUB__(v56, v55);
          v57 = v56 - v55;
          if (v60)
            goto LABEL_119;
          v59 = *((_QWORD *)v54 - 6);
          v58 = *((_QWORD *)v54 - 5);
          v60 = __OFSUB__(v58, v59);
          v52 = v58 - v59;
          v53 = v60;
          if (v60)
            goto LABEL_120;
          v61 = v7 - 2;
          v62 = &v48[16 * v7 - 32];
          v64 = *(_QWORD *)v62;
          v63 = *((_QWORD *)v62 + 1);
          v60 = __OFSUB__(v63, v64);
          v65 = v63 - v64;
          if (v60)
            goto LABEL_122;
          v60 = __OFADD__(v52, v65);
          v66 = v52 + v65;
          if (v60)
            goto LABEL_125;
          if (v66 >= v57)
          {
            v84 = &v48[16 * v49];
            v86 = *(_QWORD *)v84;
            v85 = *((_QWORD *)v84 + 1);
            v60 = __OFSUB__(v85, v86);
            v87 = v85 - v86;
            if (v60)
              goto LABEL_129;
            v77 = v52 < v87;
            goto LABEL_89;
          }
        }
        else
        {
          if (v7 != 3)
          {
            v78 = *((_QWORD *)v15 + 4);
            v79 = *((_QWORD *)v15 + 5);
            v60 = __OFSUB__(v79, v78);
            v71 = v79 - v78;
            v72 = v60;
            goto LABEL_83;
          }
          v51 = *((_QWORD *)v15 + 4);
          v50 = *((_QWORD *)v15 + 5);
          v60 = __OFSUB__(v50, v51);
          v52 = v50 - v51;
          v53 = v60;
        }
        if ((v53 & 1) != 0)
          goto LABEL_121;
        v61 = v7 - 2;
        v67 = &v48[16 * v7 - 32];
        v69 = *(_QWORD *)v67;
        v68 = *((_QWORD *)v67 + 1);
        v70 = __OFSUB__(v68, v69);
        v71 = v68 - v69;
        v72 = v70;
        if (v70)
          goto LABEL_124;
        v73 = &v48[16 * v49];
        v75 = *(_QWORD *)v73;
        v74 = *((_QWORD *)v73 + 1);
        v60 = __OFSUB__(v74, v75);
        v76 = v74 - v75;
        if (v60)
          goto LABEL_127;
        if (__OFADD__(v71, v76))
          goto LABEL_128;
        if (v71 + v76 >= v52)
        {
          v77 = v52 < v76;
LABEL_89:
          if (v77)
            v49 = v61;
          goto LABEL_91;
        }
LABEL_83:
        if ((v72 & 1) != 0)
          goto LABEL_123;
        v80 = &v48[16 * v49];
        v82 = *(_QWORD *)v80;
        v81 = *((_QWORD *)v80 + 1);
        v60 = __OFSUB__(v81, v82);
        v83 = v81 - v82;
        if (v60)
          goto LABEL_126;
        if (v83 < v71)
          goto LABEL_15;
LABEL_91:
        v88 = v49 - 1;
        if (v49 - 1 >= v7)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
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
          goto LABEL_139;
        }
        if (!v17)
          goto LABEL_141;
        a3 = &v48[16 * v88];
        v89 = *(_QWORD *)a3;
        v7 = v49;
        v90 = &v48[16 * v49];
        v91 = *((_QWORD *)v90 + 1);
        v92 = (void **)(v17 + 8 * *(_QWORD *)a3);
        v121 = (void **)(v17 + 8 * *(_QWORD *)v90);
        v93 = v17 + 8 * v91;
        swift_retain(v123);
        sub_10000B75C(v92, v121, v93, v118, v122, v123);
        if (v124)
        {
          a3 = (char *)v123;
          goto LABEL_112;
        }
        v8 = v117;
        if (v91 < v89)
          goto LABEL_116;
        if (v7 > *((_QWORD *)v15 + 2))
          goto LABEL_117;
        v94 = v7;
        *(_QWORD *)a3 = v89;
        v48 = v15 + 32;
        *(_QWORD *)&v15[16 * v88 + 40] = v91;
        v95 = *((_QWORD *)v15 + 2);
        if (v7 >= v95)
          goto LABEL_118;
        v7 = v95 - 1;
        memmove(v90, v90 + 16, 16 * (v95 - 1 - v94));
        *((_QWORD *)v15 + 2) = v95 - 1;
        a2 = v122;
        a3 = (char *)v123;
        v17 = v125;
        if (v95 <= 2)
          goto LABEL_15;
      }
    }
    v7 = 1;
LABEL_15:
    v16 = v116;
    if (v116 >= v8)
      goto LABEL_101;
  }
  if (__OFADD__(v18, v113))
    goto LABEL_138;
  if (v18 + v113 >= v8)
    v35 = v8;
  else
    v35 = v18 + v113;
  if (v35 >= v18)
  {
    if (v7 != v35)
    {
      v115 = v15;
      v36 = (void **)(v109 + 8 * v7);
      v119 = v35;
      do
      {
        v37 = *(void **)(v17 + 8 * v7);
        v38 = v18;
        v39 = v36;
        while (1)
        {
          v40 = v7;
          v128 = *v39;
          v41 = v128;
          v129[0] = v37;
          v42 = v37;
          v43 = v41;
          v7 = (unint64_t)a3;
          a2((char *)&v127, (void **)v129, &v128);

          if (v127 != 1)
            break;
          v17 = v125;
          if (!v125)
            goto LABEL_140;
          v7 = v40;
          v44 = *v39;
          v37 = v39[1];
          *v39 = v37;
          v39[1] = v44;
          --v39;
          if (v40 == ++v38)
            goto LABEL_44;
        }
        v17 = v125;
        v7 = v40;
LABEL_44:
        ++v7;
        ++v36;
        v18 = v120;
      }
      while (v7 != v119);
      v7 = v119;
      v15 = v115;
      v8 = v117;
    }
    goto LABEL_51;
  }
LABEL_139:
  __break(1u);
LABEL_140:
  swift_release_n(a3, 4);
  __break(1u);
LABEL_141:
  swift_release_n(v123, 4);
  __break(1u);
LABEL_142:
  swift_release_n(a3, 4);
  __break(1u);
LABEL_143:
  swift_release_n(a3, 4);
  __break(1u);
LABEL_144:
  swift_release_n(a3, 4);
  swift_release(v7);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000102E8(uint64_t *a1, void (*a2)(char *__return_ptr, void **, void **), char *a3)
{
  uint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[2];

  v6 = swift_allocObject(&unk_100028CE8, 32, 7);
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  v7 = *a1;
  swift_retain_n(a3, 2);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v7);
  *a1 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v7 = sub_10000F0BC(v7);
    *a1 = v7;
  }
  v9 = *(_QWORD *)(v7 + 16);
  v12[0] = v7 + 32;
  v12[1] = v9;
  swift_retain(a3);
  sub_10000FA84(v12, a2, a3);
  v10 = swift_release(a3);
  specialized ContiguousArray._endMutation()(v10);
  swift_release(a3);
  return swift_release(v6);
}

uint64_t sub_1000103C0(unint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  char v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  uint64_t v55;
  void *v56;
  id v57;
  Swift::Int v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  id v62;
  char v63;
  uint64_t v64;
  unint64_t v65;
  id v66;
  char v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  id v71;
  void *v72;
  unint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t result;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92[2];
  uint64_t v93;

  v5 = a1;
  v6 = a1 >> 62;
  if (a1 >> 62)
    goto LABEL_33;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v87 = (uint64_t)a2;
    v83 = v6;
    if (v7)
    {
      v93 = (uint64_t)_swiftEmptyArrayStorage;
      v8 = &v93;
      specialized ContiguousArray.reserveCapacity(_:)(v7);
      if (v7 < 0)
      {
        __break(1u);
LABEL_92:
        swift_bridgeObjectRelease(v86);
        v82 = sub_10000EFCC(&qword_10002E118);
        KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v82);
        __break(1u);
        swift_release_n(v8, 2);
        swift_bridgeObjectRelease(v86);
        swift_release(v92[0]);
        __break(1u);
        swift_bridgeObjectRelease(v86);
        result = swift_release(v93);
        __break(1u);
        return result;
      }
      v9 = 0;
      do
      {
        if ((v5 & 0xC000000000000001) != 0)
          v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v9, v5);
        else
          v10 = *(id *)(v5 + 8 * v9 + 32);
        v11 = v10;
        ++v9;
        v12 = objc_msgSend(v10, "objectID");

        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        v13 = *(_QWORD *)(v93 + 16);
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v13);
        v14 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v13, v12);
        specialized ContiguousArray._endMutation()(v14);
      }
      while (v7 != v9);
      v15 = (_QWORD *)v93;
    }
    else
    {
      v15 = _swiftEmptyArrayStorage;
    }
    v85 = (uint64_t)a3;
    v16 = sub_10000F92C((uint64_t)v15);
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v16);
    v89 = v5;
    v17 = (uint64_t)sub_10000782C(v5, v16);
    v5 = v17;
    v93 = (uint64_t)&_swiftEmptyDictionarySingleton;
    if ((unint64_t)v17 >> 62)
      break;
    v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
    v86 = v16;
    if (!v18)
      goto LABEL_41;
LABEL_14:
    a3 = (uint64_t *)&_swiftEmptyDictionarySingleton;
    v19 = 4;
    while (1)
    {
      a2 = (uint64_t *)(v19 - 4);
      v25 = (v5 & 0xC000000000000001) != 0
          ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v19 - 4, v5)
          : *(id *)(v5 + 8 * v19);
      v26 = v25;
      v6 = v19 - 3;
      if (__OFADD__(a2, 1))
        break;
      v27 = (void *)REMReminder.parentReminderID.getter();
      a2 = a3;
      v29 = sub_100007ECC(v27);
      v30 = a3[2];
      v31 = (v28 & 1) == 0;
      v32 = v30 + v31;
      if (__OFADD__(v30, v31))
        goto LABEL_31;
      v33 = v28;
      if (a3[3] < v32)
      {
        sub_100008294(v32, 1);
        a3 = (uint64_t *)v93;
        v8 = (uint64_t *)v93;
        v34 = sub_100007ECC(v27);
        if ((v33 & 1) != (v35 & 1))
          goto LABEL_92;
        v29 = v34;
      }
      if ((v33 & 1) != 0)
      {

        v20 = (_QWORD *)(a3[7] + 8 * v29);
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v21);
        v23 = *(_QWORD *)((*v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v22 = *(_QWORD *)((*v20 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v23 >= v22 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v22 > 1, v23 + 1, 1);
        v24 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v23, v26);
        specialized Array._endMutation()(v24);
      }
      else
      {
        v36 = sub_10000EFCC(&qword_10002E058);
        v37 = swift_allocObject(v36, 40, 7);
        *(_OWORD *)(v37 + 16) = xmmword_100022910;
        *(_QWORD *)(v37 + 32) = v26;
        v92[0] = v37;
        a2 = v92;
        specialized Array._endMutation()(v37);
        v38 = v92[0];
        a3[(v29 >> 6) + 8] |= 1 << v29;
        v39 = 8 * v29;
        *(_QWORD *)(a3[6] + v39) = v27;
        *(_QWORD *)(a3[7] + v39) = v38;
        v40 = a3[2];
        v41 = __OFADD__(v40, 1);
        v42 = v40 + 1;
        if (v41)
          goto LABEL_32;
        a3[2] = v42;
      }
      ++v19;
      if (v6 == v18)
        goto LABEL_42;
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    if (v5 < 0)
      v43 = v5;
    else
      v43 = v5 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v5);
    v7 = _CocoaArrayWrapper.endIndex.getter(v43);
    swift_bridgeObjectRelease(v5);
  }
  if (v17 < 0)
    v44 = v17;
  else
    v44 = v17 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v17);
  v18 = _CocoaArrayWrapper.endIndex.getter(v44);
  swift_bridgeObjectRelease(v5);
  v86 = v16;
  if (v18)
    goto LABEL_14;
LABEL_41:
  a3 = (uint64_t *)&_swiftEmptyDictionarySingleton;
LABEL_42:
  swift_bridgeObjectRelease(v5);
  v45 = v87;
  if (v87)
  {
    v46 = swift_allocObject(&unk_100028CC0, 32, 7);
    v47 = (char *)v46;
    v48 = v85;
    *(_QWORD *)(v46 + 16) = v87;
    *(_QWORD *)(v46 + 24) = v85;
    if (v83)
    {
      swift_retain_n(v46, 3);
      swift_bridgeObjectRetain(v89);
      sub_100013870(v87, v85);
      v49 = (uint64_t)sub_1000091E4(v89);
      swift_bridgeObjectRelease(v89);
    }
    else
    {
      v49 = v89 & 0xFFFFFFFFFFFFFF8;
      swift_retain_n(v46, 3);
      swift_bridgeObjectRetain(v89);
      sub_100013870(v87, v85);
    }
    v93 = v49;
    sub_1000102E8(&v93, (void (*)(char *__return_ptr, void **, void **))sub_1000138B4, v47);
    swift_release_n(v47, 2);
    swift_release_n(v47, 2);
    v50 = v93;
  }
  else
  {
    v50 = v89;
    swift_bridgeObjectRetain(v89);
    v48 = v85;
  }
  v93 = (uint64_t)_swiftEmptyArrayStorage;
  if ((unint64_t)v50 >> 62)
  {
LABEL_85:
    if (v50 < 0)
      v80 = v50;
    else
      v80 = v50 & 0xFFFFFFFFFFFFFF8;
    sub_100013870(v45, v48);
    swift_retain(a3);
    swift_bridgeObjectRetain(v50);
    v51 = _CocoaArrayWrapper.endIndex.getter(v80);
    if (!v51)
      goto LABEL_89;
LABEL_50:
    v52 = 0;
    v48 = v50 & 0xC000000000000001;
    v90 = v50;
    v91 = v51;
    v88 = v50 + 32;
    v84 = v86 + 56;
    while (1)
    {
      if (v48)
        v54 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v52, v90);
      else
        v54 = *(id *)(v88 + 8 * v52);
      v53 = v54;
      v41 = __OFADD__(v52++, 1);
      if (v41)
      {
        __break(1u);
        goto LABEL_85;
      }
      v55 = REMReminder.parentReminderID.getter();
      if (!v55)
        goto LABEL_72;
      v56 = (void *)v55;
      if (!objc_msgSend(v53, "isSubtask"))
        goto LABEL_71;
      if ((v86 & 0xC000000000000001) != 0)
      {
        v57 = v56;
        v50 = __CocoaSet.contains(_:)();

        if ((v50 & 1) == 0)
          goto LABEL_72;
      }
      else
      {
        if (!*(_QWORD *)(v86 + 16))
          goto LABEL_71;
        v58 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v86 + 40));
        v59 = -1 << *(_BYTE *)(v86 + 32);
        v60 = v58 & ~v59;
        if (((*(_QWORD *)(v84 + ((v60 >> 3) & 0xFFFFFFFFFFFFF8)) >> v60) & 1) == 0)
          goto LABEL_71;
        v61 = v48;
        v50 = sub_100013968(0, (unint64_t *)&unk_10002E6F0, REMObjectID_ptr);
        v62 = *(id *)(*(_QWORD *)(v86 + 48) + 8 * v60);
        v63 = static NSObject.== infix(_:_:)(v62, v56);

        if ((v63 & 1) == 0)
        {
          v64 = ~v59;
          v65 = (v60 + 1) & v64;
          if (((*(_QWORD *)(v84 + ((v65 >> 3) & 0xFFFFFFFFFFFFF8)) >> v65) & 1) == 0)
          {
            v48 = v61;
LABEL_71:

            v45 = v87;
            v51 = v91;
LABEL_72:
            v53 = v53;
            v50 = (uint64_t)&v93;
            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v53);
            v69 = *(_QWORD *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x10);
            v68 = *(_QWORD *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x18);
            if (v69 >= v68 >> 1)
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v68 > 1, v69 + 1, 1);
            v70 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v69, v53);
            specialized Array._endMutation()(v70);
            v71 = objc_msgSend(v53, "objectID");
            v72 = v71;
            if (a3[2] && (v50 = (uint64_t)a3, v73 = sub_100007ECC(v71), (v74 & 1) != 0))
            {
              v75 = *(_QWORD *)(a3[7] + 8 * v73);
              swift_bridgeObjectRetain(v75);

              if (v45)
              {
                v76 = swift_allocObject(&unk_100028C98, 32, 7);
                v77 = (char *)v76;
                *(_QWORD *)(v76 + 16) = v45;
                *(_QWORD *)(v76 + 24) = v85;
                if (v75 < 0 || (v75 & 0x4000000000000000) != 0)
                {
                  swift_retain_n(v76, 2);
                  sub_100013870(v45, v85);
                  swift_bridgeObjectRetain(v75);
                  swift_retain(v77);
                  v78 = (uint64_t)sub_1000091E4(v75);
                  swift_bridgeObjectRelease(v75);
                }
                else
                {
                  v78 = v75 & 0xFFFFFFFFFFFFFF8;
                  swift_retain_n(v76, 2);
                  sub_100013870(v45, v85);
                  swift_bridgeObjectRetain(v75);
                  swift_retain(v77);
                }
                v92[0] = v78;
                sub_1000102E8(v92, (void (*)(char *__return_ptr, void **, void **))sub_1000138B4, v77);
                swift_bridgeObjectRelease(v75);
                swift_release_n(v77, 4);
                v75 = v92[0];
              }
              v50 = (uint64_t)&v93;
              sub_10001AD3C(v75);
            }
            else
            {

              v53 = v72;
            }
            goto LABEL_52;
          }
          while (1)
          {
            v66 = *(id *)(*(_QWORD *)(v86 + 48) + 8 * v65);
            v67 = static NSObject.== infix(_:_:)(v66, v56);

            if ((v67 & 1) != 0)
              break;
            v65 = (v65 + 1) & v64;
            v48 = v61;
            if (((*(_QWORD *)(v84 + ((v65 >> 3) & 0xFFFFFFFFFFFFF8)) >> v65) & 1) == 0)
              goto LABEL_71;
          }
        }

        v53 = v56;
        v45 = v87;
        v48 = v61;
        v51 = v91;
      }
LABEL_52:

      if (v52 == v51)
      {
        v50 = v90;
        swift_bridgeObjectRelease(v90);
        v79 = (_QWORD *)v93;
        v48 = v85;
        goto LABEL_90;
      }
    }
  }
  v51 = *(_QWORD *)((v50 & 0xFFFFFFFFFFFFF8) + 0x10);
  sub_100013870(v87, v48);
  swift_retain(a3);
  swift_bridgeObjectRetain(v50);
  if (v51)
    goto LABEL_50;
LABEL_89:
  swift_bridgeObjectRelease(v50);
  v79 = _swiftEmptyArrayStorage;
LABEL_90:
  sub_100013880(v45, v48);
  swift_bridgeObjectRelease(v50);
  swift_bridgeObjectRelease(v86);
  swift_release_n(a3, 2);
  return (uint64_t)v79;
}

uint64_t sub_100010CAC(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Swift::String *v5;
  uint64_t v6;
  uint64_t v7;
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
  Swift::String v21;
  Swift::String v22;
  Swift::String v23;
  uint64_t v24;
  uint64_t v26;

  v2 = type metadata accessor for TTRIIntentsSnippetSection(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (Swift::String *)((char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_10000EFCC(&qword_10002E600);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v26 - v10;
  v12 = sub_10000EFCC((uint64_t *)&unk_10002E6D0);
  v13 = *(unsigned __int8 *)(v3 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = swift_allocObject(v12, v14 + *(_QWORD *)(v3 + 72), v13 | 7);
  *(_OWORD *)(v15 + 16) = xmmword_100022930;
  v16 = enum case for REMNavigationSpecifier.SmartListPathSpecifier.showContents(_:);
  v17 = type metadata accessor for REMNavigationSpecifier.SmartListPathSpecifier(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v11, v16, v17);
  v18 = enum case for REMNavigationSpecifier.flagged(_:);
  v19 = type metadata accessor for REMNavigationSpecifier(0);
  v20 = *(_QWORD *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 104))(v11, v18, v19);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v11, 0, 1, v19);
  swift_bridgeObjectRetain(a1);
  v21._object = (void *)0x8000000100025080;
  v22._countAndFlagsBits = 0x64656767616C46;
  v22._object = (void *)0xE700000000000000;
  v21._countAndFlagsBits = 0xD000000000000012;
  v23 = TTRLocalizedString(_:comment:)(v22, v21);
  sub_1000137F0((uint64_t)v11, (uint64_t)v9, &qword_10002E600);
  *v5 = v23;
  sub_1000137F0((uint64_t)v9, (uint64_t)v5 + *(int *)(v2 + 20), &qword_10002E600);
  v24 = sub_1000103C0(a1, 0, 0);
  swift_bridgeObjectRelease(a1);
  sub_100013834((uint64_t)v9, &qword_10002E600);
  *(uint64_t *)((char *)&v5->_countAndFlagsBits + *(int *)(v2 + 24)) = v24;
  sub_10000F00C((uint64_t)v5, v15 + v14);
  sub_100013834((uint64_t)v11, &qword_10002E600);
  return v15;
}

void *sub_100010EE4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  void *result;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;

  v2 = type metadata accessor for Calendar.Component(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v30 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    sub_10000EFCC(&qword_10002E088);
    v10 = static _SetStorage.allocate(capacity:)(v9);
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v31 = v9;
    v32 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v34 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v35 = v10 + 56;
    while (1)
    {
      v33 = v11;
      v34(v8, v32 + v13 * v11, v2);
      v14 = *(_QWORD *)(v10 + 40);
      v15 = sub_100011838(&qword_10002E090, (uint64_t (*)(uint64_t))&type metadata accessor for Calendar.Component, (uint64_t)&protocol conformance descriptor for Calendar.Component);
      v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v2, v15);
      v17 = ~(-1 << *(_BYTE *)(v10 + 32));
      v18 = v16 & v17;
      v19 = (v16 & (unint64_t)v17) >> 6;
      v20 = *(_QWORD *)(v35 + 8 * v19);
      v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        do
        {
          v34(v6, *(_QWORD *)(v10 + 48) + v18 * v13, v2);
          v22 = sub_100011838(&qword_10002E098, (uint64_t (*)(uint64_t))&type metadata accessor for Calendar.Component, (uint64_t)&protocol conformance descriptor for Calendar.Component);
          v23 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v8, v2, v22);
          v24 = v3;
          v25 = *(void (**)(char *, uint64_t))(v3 + 8);
          v25(v6, v2);
          if ((v23 & 1) != 0)
          {
            v25(v8, v2);
            v3 = v24;
            v9 = v31;
            goto LABEL_4;
          }
          v18 = (v18 + 1) & v17;
          v19 = v18 >> 6;
          v20 = *(_QWORD *)(v35 + 8 * (v18 >> 6));
          v21 = 1 << v18;
          v3 = v24;
        }
        while ((v20 & (1 << v18)) != 0);
        v9 = v31;
      }
      *(_QWORD *)(v35 + 8 * v19) = v21 | v20;
      result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v18 * v13, v8, v2);
      v27 = *(_QWORD *)(v10 + 16);
      v28 = __OFADD__(v27, 1);
      v29 = v27 + 1;
      if (v28)
        break;
      *(_QWORD *)(v10 + 16) = v29;
LABEL_4:
      v11 = v33 + 1;
      if (v33 + 1 == v9)
        return (void *)v10;
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptySetSingleton;
  }
  return result;
}

uint64_t sub_10001114C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  unsigned int (*v16)(char *, uint64_t, uint64_t);
  char v17;
  void (*v18)(char *, char *, uint64_t);
  void (*v19)(char *, uint64_t);
  uint64_t v21;

  sub_10000EFCC(&qword_10002E070);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v21 - v7;
  v9 = type metadata accessor for Date(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v21 - v14;
  sub_1000137F0(a1, (uint64_t)v8, &qword_10002E070);
  v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v16(v8, 1, v9) == 1)
  {
    sub_100013834((uint64_t)v8, &qword_10002E070);
    v17 = 0;
  }
  else
  {
    v18 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v18(v15, v8, v9);
    sub_1000137F0(a2, (uint64_t)v6, &qword_10002E070);
    if (v16(v6, 1, v9) == 1)
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
      sub_100013834((uint64_t)v6, &qword_10002E070);
      v17 = 1;
    }
    else
    {
      v18(v13, v6, v9);
      v17 = static Date.< infix(_:_:)(v15, v13);
      v19 = *(void (**)(char *, uint64_t))(v10 + 8);
      v19(v13, v9);
      v19(v15, v9);
    }
  }
  return v17 & 1;
}

uint64_t sub_100011328()
{
  id v0;
  Class isa;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Class v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v0 = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
  objc_msgSend(v0, "setDateStyle:", 4);
  objc_msgSend(v0, "setDoesRelativeDateFormatting:", 1);
  isa = Date._bridgeToObjectiveC()().super.isa;
  v2 = objc_msgSend(v0, "stringFromDate:", isa);

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  v5 = v4;

  objc_msgSend(v0, "setDoesRelativeDateFormatting:", 0);
  v6 = Date._bridgeToObjectiveC()().super.isa;
  v7 = objc_msgSend(v0, "stringFromDate:", v6);

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v10 = v9;

  if (v3 == v8 && v5 == v10)
  {

    swift_bridgeObjectRelease_n(v5, 2);
    return 0;
  }
  v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v8, v10, 0);

  swift_bridgeObjectRelease(v10);
  if ((v11 & 1) != 0)
  {
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  return v3;
}

uint64_t sub_100011490(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  Swift::String v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  Class isa;
  id v16;
  uint64_t v18;

  v2 = type metadata accessor for Date(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_10000EFCC(&qword_10002E070);
  __chkstk_darwin(v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000137F0(a1, (uint64_t)v8, &qword_10002E070);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    v9._object = (void *)0x8000000100025040;
    v10._countAndFlagsBits = 0x7564656863736E55;
    v10._object = (void *)0xEB0000000064656CLL;
    v9._countAndFlagsBits = 0xD000000000000032;
    return TTRLocalizedString(_:comment:)(v10, v9)._countAndFlagsBits;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    v12 = sub_100011328();
    if (v13)
    {
      v11 = v12;
    }
    else
    {
      if (qword_10002E010 != -1)
        swift_once(&qword_10002E010, sub_100007A28);
      v14 = (id)qword_10002E018;
      isa = Date._bridgeToObjectiveC()().super.isa;
      v16 = objc_msgSend(v14, "stringFromDate:", isa);

      v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v11;
}

uint64_t sub_100011664(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v22;

  v4 = sub_10000EFCC(&qword_10002E070);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v22 - v8;
  v10 = objc_msgSend(a1, "displayDate");
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(v10, "date");

    static Date._unconditionallyBridgeFromObjectiveC(_:)(v12);
    v13 = type metadata accessor for Date(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 0, 1, v13);
  }
  else
  {
    v14 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 1, 1, v14);
  }
  v15 = objc_msgSend(a2, "displayDate");
  if (v15)
  {
    v16 = v15;
    v17 = objc_msgSend(v15, "date");

    static Date._unconditionallyBridgeFromObjectiveC(_:)(v17);
    v18 = type metadata accessor for Date(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v7, 0, 1, v18);
  }
  else
  {
    v19 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v7, 1, 1, v19);
  }
  v20 = sub_10001114C((uint64_t)v9, (uint64_t)v7);
  sub_100013834((uint64_t)v7, &qword_10002E070);
  sub_100013834((uint64_t)v9, &qword_10002E070);
  return v20 & 1;
}

uint64_t sub_100011838(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_10001187C(uint64_t *a1)
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

uint64_t sub_1000118C0(void **a1, void **a2, void **a3, void **a4)
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
  void **v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  void (*v46)(char *, uint64_t, uint64_t, uint64_t);
  id v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  unsigned int (*v56)(uint64_t, uint64_t, uint64_t);
  void **v57;
  unint64_t v58;
  void (*v59)(void **, uint64_t, uint64_t);
  uint64_t v60;
  uint64_t v61;
  void **v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t);
  void **v67;
  uint64_t v68;
  uint64_t v69;
  void **v70;
  void **v71;
  void *v72;
  void *v73;
  char *v74;
  id v75;
  void *v76;
  id v77;
  void (*v78)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v79;
  void *v80;
  id v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unsigned int (*v87)(uint64_t, uint64_t, uint64_t);
  char v88;
  void (*v89)(char *, uint64_t, uint64_t);
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  void (*v96)(char *, uint64_t);
  void **v97;
  void **v98;
  void **v99;
  void **v100;
  uint64_t result;
  uint64_t v102;
  char *v103;
  void **v104;
  char *v105;
  char *v106;
  void **v107;
  void **v108;
  uint64_t v109;
  void **v110;
  void **v111;
  char *v112;
  unint64_t v113;
  id v114;
  void **v115;
  uint64_t v116;
  void **v117;
  uint64_t v118;
  unint64_t v119;
  void **v120;
  void **v121;

  v118 = type metadata accessor for Date(0);
  v116 = *(_QWORD *)(v118 - 8);
  v8 = __chkstk_darwin(v118);
  v103 = (char *)&v102 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v105 = (char *)&v102 - v11;
  v12 = __chkstk_darwin(v10);
  v104 = (void **)((char *)&v102 - v13);
  __chkstk_darwin(v12);
  v108 = (void **)((char *)&v102 - v14);
  v15 = sub_10000EFCC(&qword_10002E070);
  v16 = __chkstk_darwin(v15);
  v17 = __chkstk_darwin(v16);
  v106 = (char *)&v102 - v18;
  v19 = __chkstk_darwin(v17);
  v113 = (unint64_t)&v102 - v20;
  v21 = __chkstk_darwin(v19);
  v109 = (uint64_t)&v102 - v22;
  v23 = __chkstk_darwin(v21);
  v24 = __chkstk_darwin(v23);
  v107 = (void **)((char *)&v102 - v25);
  v26 = __chkstk_darwin(v24);
  v110 = (void **)((char *)&v102 - v27);
  __chkstk_darwin(v26);
  v30 = a4;
  v111 = a3;
  v112 = (char *)&v102 - v31;
  v32 = (char *)a2 - (char *)a1;
  v33 = (char *)a2 - (char *)a1 + 7;
  if ((char *)a2 - (char *)a1 >= 0)
    v33 = (char *)a2 - (char *)a1;
  v34 = v33 >> 3;
  v35 = (char *)a3 - (char *)a2;
  v36 = v35 / 8;
  v117 = a1;
  v121 = a1;
  v120 = v30;
  v115 = v30;
  if (v33 >> 3 >= v35 / 8)
  {
    if (v35 >= -7)
    {
      v104 = (void **)v28;
      if (v30 != a2 || &a2[v36] <= v30)
      {
        memmove(v30, a2, 8 * v36);
        v30 = v115;
      }
      v67 = &v30[v36];
      v119 = (unint64_t)v67;
      v121 = a2;
      v68 = (uint64_t)v106;
      v69 = v109;
      if (v35 >= 8 && v117 < a2)
      {
        v70 = v111 - 1;
        v71 = a2;
        do
        {
          v72 = *(v67 - 1);
          v73 = *(v71 - 1);
          v110 = v67 - 1;
          v111 = v71 - 1;
          v74 = v72;
          v114 = v73;
          v112 = v74;
          v75 = objc_msgSend(v74, "displayDate");
          if (v75)
          {
            v76 = v75;
            v77 = objc_msgSend(v75, "date");

            static Date._unconditionallyBridgeFromObjectiveC(_:)(v77);
            v78 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v116 + 56);
            v78(v69, 0, 1, v118);
          }
          else
          {
            v78 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v116 + 56);
            v78(v69, 1, 1, v118);
          }
          v79 = objc_msgSend(v114, "displayDate");
          if (v79)
          {
            v80 = v79;
            v81 = objc_msgSend(v79, "date");

            v82 = v113;
            static Date._unconditionallyBridgeFromObjectiveC(_:)(v81);

            v83 = 0;
          }
          else
          {
            v83 = 1;
            v82 = v113;
          }
          v84 = v118;
          v78(v82, v83, 1, v118);
          sub_1000137F0(v69, v68, &qword_10002E070);
          v85 = v116;
          v86 = v82;
          v87 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v116 + 48);
          if (v87(v68, 1, v84) == 1)
          {
            sub_100013834(v68, &qword_10002E070);
            v88 = 0;
          }
          else
          {
            v107 = v67;
            v108 = a2;
            v89 = *(void (**)(char *, uint64_t, uint64_t))(v85 + 32);
            v90 = v105;
            v91 = v118;
            v89(v105, v68, v118);
            v92 = v86;
            v93 = (uint64_t)v104;
            sub_1000137F0(v92, (uint64_t)v104, &qword_10002E070);
            if (v87(v93, 1, v91) == 1)
            {
              (*(void (**)(char *, uint64_t))(v85 + 8))(v90, v118);
              sub_100013834(v93, &qword_10002E070);
              v88 = 1;
            }
            else
            {
              v94 = v118;
              v95 = v103;
              v89(v103, v93, v118);
              v88 = static Date.< infix(_:_:)(v90, v95);
              v96 = *(void (**)(char *, uint64_t))(v85 + 8);
              v96(v95, v94);
              v96(v90, v94);
            }
            v67 = v107;
            a2 = v108;
            v68 = (uint64_t)v106;
          }
          v97 = v70 + 1;
          sub_100013834(v113, &qword_10002E070);
          v69 = v109;
          sub_100013834(v109, &qword_10002E070);

          if ((v88 & 1) != 0)
          {
            v98 = v115;
            v71 = v111;
            if (v97 != a2 || v70 >= a2)
              *v70 = *v111;
            v121 = v71;
            if (v67 <= v98)
              break;
          }
          else
          {
            v99 = v110;
            v119 = (unint64_t)v110;
            v100 = v115;
            if (v97 < v67 || v70 >= v67 || v97 != v67)
              *v70 = *v110;
            v71 = a2;
            v67 = v99;
            if (v99 <= v100)
              break;
          }
          --v70;
          a2 = v71;
        }
        while (v71 > v117);
      }
LABEL_63:
      sub_10000C910((void **)&v121, (const void **)&v120, &v119);
      return 1;
    }
  }
  else if (v32 >= -7)
  {
    v109 = v29;
    if (v30 != v117 || &v117[v34] <= v30)
    {
      memmove(v30, v117, 8 * v34);
      v30 = v115;
    }
    v113 = (unint64_t)&v30[v34];
    v119 = v113;
    v37 = (uint64_t)v107;
    v38 = v112;
    if (v32 >= 8 && a2 < v111)
    {
      while (1)
      {
        v39 = *a2;
        v115 = v30;
        v40 = *v30;
        v41 = v39;
        v42 = v40;
        v43 = objc_msgSend(v41, "displayDate");
        if (v43)
        {
          v44 = v43;
          v45 = objc_msgSend(v43, "date");

          static Date._unconditionallyBridgeFromObjectiveC(_:)(v45);
          v46 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v116 + 56);
          v46(v38, 0, 1, v118);
        }
        else
        {
          v46 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v116 + 56);
          v46(v38, 1, 1, v118);
        }
        v114 = v42;
        v47 = objc_msgSend(v42, "displayDate");
        if (v47)
        {
          v48 = v47;
          v49 = v41;
          v50 = objc_msgSend(v47, "date");

          v51 = (uint64_t)v110;
          static Date._unconditionallyBridgeFromObjectiveC(_:)(v50);

          v52 = 0;
        }
        else
        {
          v49 = v41;
          v52 = 1;
          v51 = (uint64_t)v110;
        }
        v53 = v118;
        v46((char *)v51, v52, 1, v118);
        v54 = v112;
        sub_1000137F0((uint64_t)v112, v37, &qword_10002E070);
        v55 = v116;
        v56 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v116 + 48);
        if (v56(v37, 1, v53) == 1)
        {
          sub_100013834(v37, &qword_10002E070);
          sub_100013834(v51, &qword_10002E070);
          sub_100013834((uint64_t)v54, &qword_10002E070);

          v38 = v54;
        }
        else
        {
          v59 = *(void (**)(void **, uint64_t, uint64_t))(v55 + 32);
          v60 = v118;
          v59(v108, v37, v118);
          v61 = v109;
          sub_1000137F0(v51, v109, &qword_10002E070);
          if (v56(v61, 1, v60) == 1)
          {
            (*(void (**)(void **, uint64_t))(v55 + 8))(v108, v118);
            sub_100013834(v61, &qword_10002E070);
            sub_100013834(v51, &qword_10002E070);
            v38 = v112;
            sub_100013834((uint64_t)v112, &qword_10002E070);

            v37 = (uint64_t)v107;
LABEL_24:
            v58 = (unint64_t)(a2 + 1);
            if (v117 < a2 || (unint64_t)v117 >= v58 || v117 != a2)
              *v117 = *a2;
            v30 = v115;
            goto LABEL_29;
          }
          v62 = v108;
          v63 = (uint64_t)v104;
          v64 = v61;
          v65 = v118;
          v59(v104, v64, v118);
          LODWORD(v106) = static Date.< infix(_:_:)(v62, v63);
          v66 = *(void (**)(uint64_t, uint64_t))(v55 + 8);
          v66(v63, v65);
          v66((uint64_t)v62, v65);
          sub_100013834(v51, &qword_10002E070);
          v38 = v112;
          sub_100013834((uint64_t)v112, &qword_10002E070);

          v37 = (uint64_t)v107;
          if ((v106 & 1) != 0)
            goto LABEL_24;
        }
        v57 = v115;
        if (v117 != v115)
          *v117 = *v115;
        v30 = v57 + 1;
        v120 = v30;
        v58 = (unint64_t)a2;
LABEL_29:
        v121 = ++v117;
        if ((unint64_t)v30 < v113)
        {
          a2 = (void **)v58;
          if (v58 < (unint64_t)v111)
            continue;
        }
        goto LABEL_63;
      }
    }
    goto LABEL_63;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

void sub_100012238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  void (*v43)(char *, uint64_t, uint64_t);
  char *v44;
  uint64_t v45;
  char *v46;
  char v47;
  void (*v48)(char *, uint64_t);
  char *v49;
  char *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;

  v54 = a1;
  v65 = type metadata accessor for Date(0);
  v7 = *(_QWORD **)(v65 - 8);
  v8 = __chkstk_darwin(v65);
  v56 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v11 = (char *)&v52 - v10;
  v12 = sub_10000EFCC(&qword_10002E070);
  v13 = __chkstk_darwin(v12);
  v14 = __chkstk_darwin(v13);
  v58 = (uint64_t)&v52 - v15;
  v16 = __chkstk_darwin(v14);
  v57 = (char *)&v52 - v17;
  __chkstk_darwin(v16);
  v66 = (uint64_t)&v52 - v19;
  v53 = a2;
  if (a3 != a2)
  {
    v59 = *a4;
    v20 = v59 + 8 * a3 - 8;
    v61 = v11;
LABEL_6:
    v22 = *(void **)(v59 + 8 * a3);
    v23 = v54;
    v55 = v20;
    v60 = a3;
    while (1)
    {
      v62 = v23;
      v24 = v18;
      v25 = v7;
      v26 = *(void **)v20;
      v27 = v22;
      v28 = v26;
      v63 = v27;
      v29 = objc_msgSend(v27, "displayDate");
      if (v29)
      {
        v30 = v29;
        v31 = objc_msgSend(v29, "date");

        v32 = v66;
        static Date._unconditionallyBridgeFromObjectiveC(_:)(v31);

        v33 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v25[7];
        v33(v32, 0, 1, v65);
      }
      else
      {
        v33 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v7[7];
        v33(v66, 1, 1, v65);
      }
      v34 = objc_msgSend(v28, "displayDate");
      v64 = v28;
      if (v34)
      {
        v35 = v34;
        v36 = objc_msgSend(v34, "date");

        v37 = (uint64_t)v57;
        static Date._unconditionallyBridgeFromObjectiveC(_:)(v36);

        v38 = 0;
      }
      else
      {
        v38 = 1;
        v37 = (uint64_t)v57;
      }
      v39 = v65;
      v33(v37, v38, 1, v65);
      v40 = v58;
      sub_1000137F0(v66, v58, &qword_10002E070);
      v7 = v25;
      v41 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v25[6];
      if (v41(v40, 1, v39) == 1)
      {
        sub_100013834(v40, &qword_10002E070);
        sub_100013834(v37, &qword_10002E070);
        sub_100013834(v66, &qword_10002E070);

        v21 = v60;
        v18 = v24;
LABEL_5:
        a3 = v21 + 1;
        v20 = v55 + 8;
        if (a3 == v53)
          return;
        goto LABEL_6;
      }
      v42 = v40;
      v43 = (void (*)(char *, uint64_t, uint64_t))v25[4];
      v44 = v61;
      v43(v61, v42, v39);
      sub_1000137F0(v37, v24, &qword_10002E070);
      if (v41(v24, 1, v39) == 1)
      {
        ((void (*)(char *, uint64_t))v7[1])(v44, v39);
        sub_100013834(v24, &qword_10002E070);
        sub_100013834(v37, &qword_10002E070);
        sub_100013834(v66, &qword_10002E070);

        v21 = v60;
        v18 = v24;
        v45 = v62;
      }
      else
      {
        v46 = v56;
        v43(v56, v24, v39);
        v47 = static Date.< infix(_:_:)(v61, v46);
        v48 = (void (*)(char *, uint64_t))v7[1];
        v49 = v46;
        v50 = v61;
        v48(v49, v39);
        v48(v50, v39);
        sub_100013834(v37, &qword_10002E070);
        sub_100013834(v66, &qword_10002E070);

        v21 = v60;
        v18 = v24;
        v45 = v62;
        if ((v47 & 1) == 0)
          goto LABEL_5;
      }
      if (!v59)
        break;
      v51 = *(void **)v20;
      v22 = *(void **)(v20 + 8);
      *(_QWORD *)v20 = v22;
      *(_QWORD *)(v20 + 8) = v51;
      v20 -= 8;
      v23 = v45 + 1;
      if (v21 == v23)
        goto LABEL_5;
    }
    __break(1u);
  }
}

void sub_100012690(uint64_t *a1)
{
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
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
  Swift::Int v44;
  Swift::Int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  Swift::Int v54;
  unint64_t v55;
  Swift::Int v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  id v65;
  void *v66;
  id v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int (*v71)(uint64_t, uint64_t, uint64_t);
  unsigned int v72;
  uint64_t v73;
  void (*v74)(char *, uint64_t, uint64_t);
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  void (*v79)(char *, uint64_t);
  id v80;
  id *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  void *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unsigned int (*v97)(uint64_t, uint64_t, uint64_t);
  int v98;
  void (*v99)(char *, uint64_t, uint64_t);
  char *v100;
  char *v101;
  void (*v102)(char *, uint64_t);
  id v103;
  uint64_t *v104;
  uint64_t v105;
  Swift::Int v106;
  Swift::Int v107;
  uint64_t *v108;
  uint64_t v109;
  unsigned int (*v110)(uint64_t, uint64_t, uint64_t);
  uint64_t v111;
  char *v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  id v117;
  void *v118;
  id v119;
  uint64_t v120;
  void (*v121)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v122;
  void *v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  unsigned int (*v128)(uint64_t, uint64_t, uint64_t);
  uint64_t v129;
  void (*v130)(char *, uint64_t, uint64_t);
  uint64_t v131;
  uint64_t v132;
  char *v133;
  char v134;
  void (*v135)(char *, uint64_t);
  void *v136;
  unint64_t v137;
  unint64_t v138;
  uint64_t v139;
  char *v140;
  char *v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  BOOL v153;
  unint64_t v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  BOOL v163;
  uint64_t v164;
  char v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  BOOL v170;
  uint64_t v171;
  uint64_t v172;
  char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  unint64_t v181;
  char *v182;
  char *v183;
  uint64_t v184;
  char *v185;
  char *v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  char *v190;
  uint64_t v191;
  uint64_t v192;
  unint64_t v193;
  uint64_t v194;
  uint64_t v195;
  char *v196;
  unint64_t v197;
  uint64_t v198;
  uint64_t v199;
  char *v200;
  uint64_t *v201;
  uint64_t v202;
  uint64_t v203;
  char *v204;
  Swift::Int v205;
  uint64_t v206;
  char *v207;
  char *v208;
  uint64_t v209;
  char *v210;
  char *v211;
  unsigned int (*v212)(uint64_t, uint64_t, uint64_t);
  uint64_t v213;
  char *v214;
  Swift::Int v215;
  uint64_t v216;
  uint64_t v217;
  char *v218;
  void **v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  char *v223;
  uint64_t v224;
  char *v225;
  char *v226;
  char *v227;
  uint64_t v228;
  Swift::Int v229;
  char *v230;
  char *v231;
  id v232;
  id v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;

  v2 = type metadata accessor for Date(0);
  v235 = *(_QWORD *)(v2 - 8);
  v3 = __chkstk_darwin(v2);
  v223 = (char *)&v199 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v199 - v6;
  v8 = __chkstk_darwin(v5);
  v208 = (char *)&v199 - v9;
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v199 - v11;
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v199 - v14;
  __chkstk_darwin(v13);
  v17 = (char *)&v199 - v16;
  v18 = sub_10000EFCC(&qword_10002E070);
  v19 = __chkstk_darwin(v18);
  v21 = (char *)&v199 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __chkstk_darwin(v19);
  v226 = (char *)&v199 - v23;
  v24 = __chkstk_darwin(v22);
  v26 = (char *)&v199 - v25;
  v27 = __chkstk_darwin(v24);
  v234 = (uint64_t)&v199 - v28;
  v29 = __chkstk_darwin(v27);
  v214 = (char *)&v199 - v30;
  v31 = __chkstk_darwin(v29);
  v213 = (uint64_t)&v199 - v32;
  v33 = __chkstk_darwin(v31);
  v220 = (uint64_t)&v199 - v34;
  v35 = __chkstk_darwin(v33);
  v221 = (uint64_t)&v199 - v36;
  v37 = __chkstk_darwin(v35);
  v218 = (char *)&v199 - v38;
  v39 = __chkstk_darwin(v37);
  v206 = (uint64_t)&v199 - v40;
  v41 = __chkstk_darwin(v39);
  v207 = (char *)&v199 - v42;
  __chkstk_darwin(v41);
  v209 = (uint64_t)&v199 - v43;
  v44 = a1[1];
  v45 = _minimumMergeRunLength(_:)(v44);
  if (v45 >= v44)
  {
    if (v44 < 0)
      goto LABEL_170;
    if (v44)
      sub_100012238(0, v44, 1, a1);
    return;
  }
  v205 = v45;
  if (v44 >= 0)
    v46 = v44;
  else
    v46 = v44 + 1;
  if (v44 < -1)
    goto LABEL_178;
  v227 = v26;
  v204 = v17;
  v215 = v44;
  v201 = a1;
  if (v44 < 2)
  {
    v50 = (char *)_swiftEmptyArrayStorage;
    v236 = (uint64_t)_swiftEmptyArrayStorage;
    v219 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v44 != 1)
    {
      v55 = _swiftEmptyArrayStorage[2];
LABEL_137:
      v191 = v222;
      if (v55 >= 2)
      {
        v192 = *v201;
        do
        {
          v193 = v55 - 2;
          if (v55 < 2)
            goto LABEL_165;
          if (!v192)
            goto LABEL_177;
          v194 = *(_QWORD *)&v50[16 * v193 + 32];
          v195 = *(_QWORD *)&v50[16 * v55 + 24];
          sub_1000118C0((void **)(v192 + 8 * v194), (void **)(v192 + 8 * *(_QWORD *)&v50[16 * v55 + 16]), (void **)(v192 + 8 * v195), v219);
          if (v191)
            break;
          if (v195 < v194)
            goto LABEL_166;
          if ((swift_isUniquelyReferenced_nonNull_native(v50) & 1) == 0)
            v50 = sub_10000CB70((uint64_t)v50);
          if (v193 >= *((_QWORD *)v50 + 2))
            goto LABEL_167;
          v196 = &v50[16 * v193 + 32];
          *(_QWORD *)v196 = v194;
          *((_QWORD *)v196 + 1) = v195;
          v197 = *((_QWORD *)v50 + 2);
          if (v55 > v197)
            goto LABEL_168;
          memmove(&v50[16 * v55 + 16], &v50[16 * v55 + 32], 16 * (v197 - v55));
          *((_QWORD *)v50 + 2) = v197 - 1;
          v55 = v197 - 1;
        }
        while (v197 > 2);
      }
LABEL_148:
      v198 = swift_bridgeObjectRelease(v50);
      *(_QWORD *)((v236 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()(v198);
      swift_bridgeObjectRelease(v236);
      return;
    }
  }
  else
  {
    v47 = v46 >> 1;
    v48 = sub_100013968(0, &qword_10002E6E0, REMReminder_ptr);
    v49 = static Array._allocateBufferUninitialized(minimumCapacity:)(v47, v48);
    *(_QWORD *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x10) = v47;
    v219 = (void **)((v49 & 0xFFFFFFFFFFFFFF8) + 32);
    v236 = v49;
  }
  v200 = v15;
  v210 = v12;
  v51 = 0;
  v52 = *a1;
  v203 = *a1 + 16;
  v202 = v52 - 8;
  v50 = (char *)_swiftEmptyArrayStorage;
  v231 = v7;
  v224 = v2;
  v225 = v21;
  v53 = (uint64_t)v218;
  v54 = v215;
  v228 = v52;
LABEL_15:
  v56 = v51 + 1;
  v211 = v50;
  v216 = v51;
  if (v51 + 1 < v54)
  {
    v57 = *(void **)(v52 + 8 * v51);
    v58 = *(id *)(v52 + 8 * v56);
    v233 = v57;
    v59 = objc_msgSend(v58, "displayDate");
    if (v59)
    {
      v60 = v59;
      v61 = objc_msgSend(v59, "date");

      v62 = v209;
      static Date._unconditionallyBridgeFromObjectiveC(_:)(v61);

      v63 = *(char **)(v235 + 56);
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v63)(v62, 0, 1, v2);
    }
    else
    {
      v63 = *(char **)(v235 + 56);
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v63)(v209, 1, 1, v2);
    }
    v65 = objc_msgSend(v233, "displayDate");
    v232 = v58;
    if (v65)
    {
      v66 = v65;
      v67 = objc_msgSend(v65, "date");

      v68 = v207;
      static Date._unconditionallyBridgeFromObjectiveC(_:)(v67);

      v69 = 0;
    }
    else
    {
      v69 = 1;
      v68 = v207;
    }
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v63)(v68, v69, 1, v2);
    v70 = v206;
    sub_1000137F0(v209, v206, &qword_10002E070);
    v71 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v235 + 48);
    v72 = v71(v70, 1, v2);
    v73 = (uint64_t)v68;
    v212 = v71;
    if (v72 == 1)
    {
      sub_100013834(v70, &qword_10002E070);
      LODWORD(v217) = 0;
    }
    else
    {
      v74 = *(void (**)(char *, uint64_t, uint64_t))(v235 + 32);
      v75 = v70;
      v76 = v73;
      v77 = v204;
      v74(v204, v75, v2);
      sub_1000137F0(v76, v53, &qword_10002E070);
      if (v71(v53, 1, v2) == 1)
      {
        (*(void (**)(char *, uint64_t))(v235 + 8))(v77, v2);
        sub_100013834(v53, &qword_10002E070);
        LODWORD(v217) = 1;
      }
      else
      {
        v78 = v200;
        v74(v200, v53, v2);
        LODWORD(v217) = static Date.< infix(_:_:)(v77, v78);
        v79 = *(void (**)(char *, uint64_t))(v235 + 8);
        v79(v78, v2);
        v79(v77, v2);
      }
      v73 = (uint64_t)v207;
    }
    v80 = v232;
    sub_100013834(v73, &qword_10002E070);
    sub_100013834(v209, &qword_10002E070);

    v51 = v216;
    v56 = v216 + 2;
    if (v216 + 2 < v215)
    {
      v81 = (id *)(v203 + 8 * v216);
      while (1)
      {
        v229 = v56;
        v82 = *(v81 - 1);
        v83 = *v81;
        v233 = v82;
        v84 = objc_msgSend(v83, "displayDate");
        if (v84)
        {
          v85 = v84;
          v86 = objc_msgSend(v84, "date");

          v87 = v221;
          static Date._unconditionallyBridgeFromObjectiveC(_:)(v86);

          v88 = 0;
        }
        else
        {
          v88 = 1;
          v87 = v221;
        }
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v63)(v87, v88, 1, v2);
        v89 = objc_msgSend(v233, "displayDate");
        v230 = v63;
        v232 = v83;
        if (v89)
        {
          v90 = v89;
          v91 = objc_msgSend(v89, "date");

          v92 = v220;
          static Date._unconditionallyBridgeFromObjectiveC(_:)(v91);

          v93 = v92;
          v94 = 0;
        }
        else
        {
          v93 = v220;
          v94 = 1;
        }
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v63)(v93, v94, 1, v2);
        v95 = (uint64_t)v214;
        v96 = v213;
        sub_1000137F0(v221, v213, &qword_10002E070);
        v97 = v212;
        if (v212(v96, 1, v2) == 1)
        {
          sub_100013834(v96, &qword_10002E070);
          v98 = 0;
        }
        else
        {
          v99 = *(void (**)(char *, uint64_t, uint64_t))(v235 + 32);
          v100 = v210;
          v99(v210, v96, v2);
          sub_1000137F0(v220, v95, &qword_10002E070);
          if (v97(v95, 1, v2) == 1)
          {
            (*(void (**)(char *, uint64_t))(v235 + 8))(v100, v2);
            sub_100013834(v95, &qword_10002E070);
            v98 = 1;
          }
          else
          {
            v101 = v208;
            v99(v208, v95, v2);
            v98 = static Date.< infix(_:_:)(v100, v101);
            v102 = *(void (**)(char *, uint64_t))(v235 + 8);
            v102(v101, v2);
            v102(v100, v2);
          }
          v50 = v211;
        }
        v56 = v229;
        v103 = v232;
        sub_100013834(v220, &qword_10002E070);
        sub_100013834(v221, &qword_10002E070);

        if (((v217 ^ v98) & 1) != 0)
          break;
        ++v56;
        ++v81;
        v63 = v230;
        if (v215 == v56)
        {
          v56 = v215;
          break;
        }
      }
      v53 = (uint64_t)v218;
      v51 = v216;
    }
    v64 = (uint64_t)v226;
    v52 = v228;
    if ((v217 & 1) != 0)
    {
      if (v56 < v51)
        goto LABEL_171;
      if (v51 < v56)
      {
        v104 = (uint64_t *)(v202 + 8 * v56);
        v105 = v51;
        v106 = v56;
        v107 = v105;
        v108 = (uint64_t *)(v228 + 8 * v105);
        do
        {
          if (v107 != --v106)
          {
            if (!v52)
              goto LABEL_176;
            v109 = *v108;
            *v108 = *v104;
            *v104 = v109;
          }
          ++v107;
          --v104;
          ++v108;
        }
        while (v107 < v106);
        v51 = v216;
      }
    }
  }
  else
  {
    v64 = (uint64_t)v226;
  }
  if (v56 >= v215)
    goto LABEL_85;
  if (__OFSUB__(v56, v51))
    goto LABEL_169;
  if (v56 - v51 >= v205)
  {
    v51 = v216;
LABEL_85:
    if (v56 < v51)
      goto LABEL_164;
    goto LABEL_86;
  }
  if (__OFADD__(v216, v205))
    goto LABEL_172;
  if (v216 + v205 >= v215)
    v110 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v215;
  else
    v110 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))(v216 + v205);
  v51 = v216;
  if ((uint64_t)v110 >= v216)
  {
    if ((unsigned int (*)(uint64_t, uint64_t, uint64_t))v56 == v110)
      goto LABEL_85;
    v111 = v202 + 8 * v56;
    v212 = v110;
LABEL_69:
    v113 = *(void **)(v52 + 8 * v56);
    v217 = v111;
    v229 = v56;
    while (1)
    {
      v230 = (char *)v51;
      v114 = *(void **)v111;
      v115 = v113;
      v116 = v114;
      v232 = v115;
      v117 = objc_msgSend(v115, "displayDate");
      if (v117)
      {
        v118 = v117;
        v119 = objc_msgSend(v117, "date");

        v120 = v234;
        static Date._unconditionallyBridgeFromObjectiveC(_:)(v119);

        v121 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v235 + 56);
        v121(v120, 0, 1, v2);
      }
      else
      {
        v121 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v235 + 56);
        v121(v234, 1, 1, v2);
      }
      v122 = objc_msgSend(v116, "displayDate");
      v233 = v116;
      if (v122)
      {
        v123 = v122;
        v124 = objc_msgSend(v122, "date");

        v125 = (uint64_t)v227;
        static Date._unconditionallyBridgeFromObjectiveC(_:)(v124);

        v126 = 0;
        v127 = v231;
      }
      else
      {
        v126 = 1;
        v127 = v231;
        v125 = (uint64_t)v227;
      }
      v121(v125, v126, 1, v2);
      sub_1000137F0(v234, v64, &qword_10002E070);
      v128 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v235 + 48);
      if (v128(v64, 1, v2) == 1)
      {
        sub_100013834(v64, &qword_10002E070);
        sub_100013834(v125, &qword_10002E070);
        sub_100013834(v234, &qword_10002E070);

        goto LABEL_67;
      }
      v129 = v235;
      v130 = *(void (**)(char *, uint64_t, uint64_t))(v235 + 32);
      v130(v127, v64, v2);
      v131 = v129;
      v132 = (uint64_t)v225;
      sub_1000137F0(v125, (uint64_t)v225, &qword_10002E070);
      if (v128(v132, 1, v2) == 1)
      {
        (*(void (**)(char *, uint64_t))(v131 + 8))(v127, v2);
        sub_100013834(v132, &qword_10002E070);
        sub_100013834(v125, &qword_10002E070);
        sub_100013834(v234, &qword_10002E070);

      }
      else
      {
        v133 = v223;
        v130(v223, v132, v2);
        v134 = static Date.< infix(_:_:)(v231, v133);
        v135 = *(void (**)(char *, uint64_t))(v131 + 8);
        v135(v133, v2);
        v135(v231, v2);
        sub_100013834(v125, &qword_10002E070);
        sub_100013834(v234, &qword_10002E070);

        if ((v134 & 1) == 0)
        {
          v2 = v224;
          v64 = (uint64_t)v226;
LABEL_67:
          v52 = v228;
          v112 = (char *)v229;
LABEL_68:
          v56 = (Swift::Int)(v112 + 1);
          v51 = v216;
          v111 = v217 + 8;
          if ((unsigned int (*)(uint64_t, uint64_t, uint64_t))v56 != v212)
            goto LABEL_69;
          v56 = (Swift::Int)v212;
          v50 = v211;
          v53 = (uint64_t)v218;
          if ((uint64_t)v212 < v216)
            goto LABEL_164;
LABEL_86:
          if ((swift_isUniquelyReferenced_nonNull_native(v50) & 1) == 0)
            v50 = sub_10000C818(0, *((_QWORD *)v50 + 2) + 1, 1, v50);
          v138 = *((_QWORD *)v50 + 2);
          v137 = *((_QWORD *)v50 + 3);
          v55 = v138 + 1;
          v52 = v228;
          v139 = v216;
          if (v138 >= v137 >> 1)
          {
            v190 = sub_10000C818((char *)(v137 > 1), v138 + 1, 1, v50);
            v139 = v216;
            v52 = v228;
            v50 = v190;
          }
          *((_QWORD *)v50 + 2) = v55;
          v140 = v50 + 32;
          v141 = &v50[16 * v138 + 32];
          *(_QWORD *)v141 = v139;
          *((_QWORD *)v141 + 1) = v56;
          v229 = v56;
          if (v138)
          {
LABEL_91:
            v142 = v55 - 1;
            if (v55 >= 4)
            {
              v147 = &v140[16 * v55];
              v148 = *((_QWORD *)v147 - 8);
              v149 = *((_QWORD *)v147 - 7);
              v153 = __OFSUB__(v149, v148);
              v150 = v149 - v148;
              if (v153)
                goto LABEL_153;
              v152 = *((_QWORD *)v147 - 6);
              v151 = *((_QWORD *)v147 - 5);
              v153 = __OFSUB__(v151, v152);
              v145 = v151 - v152;
              v146 = v153;
              if (v153)
                goto LABEL_154;
              v154 = v55 - 2;
              v155 = &v140[16 * v55 - 32];
              v157 = *(_QWORD *)v155;
              v156 = *((_QWORD *)v155 + 1);
              v153 = __OFSUB__(v156, v157);
              v158 = v156 - v157;
              if (v153)
                goto LABEL_156;
              v153 = __OFADD__(v145, v158);
              v159 = v145 + v158;
              if (v153)
                goto LABEL_159;
              if (v159 >= v150)
              {
                v177 = &v140[16 * v142];
                v179 = *(_QWORD *)v177;
                v178 = *((_QWORD *)v177 + 1);
                v153 = __OFSUB__(v178, v179);
                v180 = v178 - v179;
                if (v153)
                  goto LABEL_163;
                v170 = v145 < v180;
              }
              else
              {
LABEL_104:
                if ((v146 & 1) != 0)
                  goto LABEL_155;
                v154 = v55 - 2;
                v160 = &v140[16 * v55 - 32];
                v162 = *(_QWORD *)v160;
                v161 = *((_QWORD *)v160 + 1);
                v163 = __OFSUB__(v161, v162);
                v164 = v161 - v162;
                v165 = v163;
                if (v163)
                  goto LABEL_158;
                v166 = &v140[16 * v142];
                v168 = *(_QWORD *)v166;
                v167 = *((_QWORD *)v166 + 1);
                v153 = __OFSUB__(v167, v168);
                v169 = v167 - v168;
                if (v153)
                  goto LABEL_161;
                if (__OFADD__(v164, v169))
                  goto LABEL_162;
                if (v164 + v169 < v145)
                  goto LABEL_116;
                v170 = v145 < v169;
              }
              if (v170)
                v142 = v154;
            }
            else
            {
              if (v55 == 3)
              {
                v144 = *((_QWORD *)v50 + 4);
                v143 = *((_QWORD *)v50 + 5);
                v153 = __OFSUB__(v143, v144);
                v145 = v143 - v144;
                v146 = v153;
                goto LABEL_104;
              }
              v171 = *((_QWORD *)v50 + 4);
              v172 = *((_QWORD *)v50 + 5);
              v153 = __OFSUB__(v172, v171);
              v164 = v172 - v171;
              v165 = v153;
LABEL_116:
              if ((v165 & 1) != 0)
                goto LABEL_157;
              v173 = &v140[16 * v142];
              v175 = *(_QWORD *)v173;
              v174 = *((_QWORD *)v173 + 1);
              v153 = __OFSUB__(v174, v175);
              v176 = v174 - v175;
              if (v153)
                goto LABEL_160;
              if (v176 < v164)
                goto LABEL_14;
            }
            v181 = v142 - 1;
            if (v142 - 1 >= v55)
            {
              __break(1u);
LABEL_150:
              __break(1u);
LABEL_151:
              __break(1u);
LABEL_152:
              __break(1u);
LABEL_153:
              __break(1u);
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
              __break(1u);
LABEL_160:
              __break(1u);
LABEL_161:
              __break(1u);
LABEL_162:
              __break(1u);
LABEL_163:
              __break(1u);
LABEL_164:
              __break(1u);
LABEL_165:
              __break(1u);
LABEL_166:
              __break(1u);
LABEL_167:
              __break(1u);
LABEL_168:
              __break(1u);
LABEL_169:
              __break(1u);
LABEL_170:
              __break(1u);
LABEL_171:
              __break(1u);
LABEL_172:
              __break(1u);
              break;
            }
            if (!v52)
              goto LABEL_175;
            v182 = v50;
            v183 = &v140[16 * v181];
            v184 = *(_QWORD *)v183;
            v185 = v140;
            v186 = &v140[16 * v142];
            v187 = *((_QWORD *)v186 + 1);
            v188 = v222;
            sub_1000118C0((void **)(v52 + 8 * *(_QWORD *)v183), (void **)(v52 + 8 * *(_QWORD *)v186), (void **)(v52 + 8 * v187), v219);
            v222 = v188;
            if (v188)
            {
              v50 = v182;
              goto LABEL_148;
            }
            if (v187 < v184)
              goto LABEL_150;
            if (v142 > *((_QWORD *)v182 + 2))
              goto LABEL_151;
            *(_QWORD *)v183 = v184;
            *(_QWORD *)&v185[16 * v181 + 8] = v187;
            v189 = *((_QWORD *)v182 + 2);
            if (v142 >= v189)
              goto LABEL_152;
            v50 = v182;
            v55 = v189 - 1;
            memmove(v186, v186 + 16, 16 * (v189 - 1 - v142));
            v140 = v185;
            *((_QWORD *)v182 + 2) = v189 - 1;
            v53 = (uint64_t)v218;
            v52 = v228;
            if (v189 <= 2)
              goto LABEL_14;
            goto LABEL_91;
          }
          v55 = 1;
LABEL_14:
          v54 = v215;
          v51 = v229;
          if (v229 >= v215)
            goto LABEL_137;
          goto LABEL_15;
        }
      }
      v64 = (uint64_t)v226;
      v52 = v228;
      v112 = (char *)v229;
      if (!v228)
        goto LABEL_174;
      v136 = *(void **)v111;
      v113 = *(void **)(v111 + 8);
      *(_QWORD *)v111 = v113;
      *(_QWORD *)(v111 + 8) = v136;
      v111 -= 8;
      v51 = (uint64_t)(v230 + 1);
      v2 = v224;
      if (v112 == v230 + 1)
        goto LABEL_68;
    }
  }
  __break(1u);
LABEL_174:
  __break(1u);
LABEL_175:
  __break(1u);
LABEL_176:
  __break(1u);
LABEL_177:
  __break(1u);
LABEL_178:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
}

uint64_t sub_1000137A4(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000137AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000EFCC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000137F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000EFCC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100013834(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10000EFCC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100013870(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_100013880(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100013890()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000138B8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, _QWORD))(v3 + 16))(*a1, *a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1000138EC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

unint64_t sub_100013910()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002E128;
  if (!qword_10002E128)
  {
    v1 = sub_100013968(255, (unint64_t *)&unk_10002E6F0, REMObjectID_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10002E128);
  }
  return result;
}

uint64_t sub_100013968(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_1000139A0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_10001187C(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_10001422C(a1, &qword_10002E150, (uint64_t)&unk_100028DB0);
}

uint64_t *sub_1000139F4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v15);
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for REMNavigationSpecifier(0);
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain(v7);
    if (v13(v10, 1, v11))
    {
      v14 = sub_10000EFCC(&qword_10002E600);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v16 = *(int *)(a3 + 24);
    v17 = *(uint64_t *)((char *)a2 + v16);
    *(uint64_t *)((char *)v4 + v16) = v17;
    swift_bridgeObjectRetain(v17);
  }
  return v4;
}

uint64_t sub_100013B0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  v4 = a1 + *(int *)(a2 + 20);
  v5 = type metadata accessor for REMNavigationSpecifier(0);
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(a2 + 24)));
}

_QWORD *sub_100013B8C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for REMNavigationSpecifier(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain(v6);
  if (v12(v9, 1, v10))
  {
    v13 = sub_10000EFCC(&qword_10002E600);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = *(int *)(a3 + 24);
  v15 = *(_QWORD *)((char *)a2 + v14);
  *(_QWORD *)((char *)a1 + v14) = v15;
  swift_bridgeObjectRetain(v15);
  return a1;
}

_QWORD *sub_100013C78(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *a1 = *a2;
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for REMNavigationSpecifier(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v16 = sub_10000EFCC(&qword_10002E600);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  v17 = *(int *)(a3 + 24);
  v18 = *(_QWORD *)((char *)a2 + v17);
  v19 = *(_QWORD *)((char *)a1 + v17);
  *(_QWORD *)((char *)a1 + v17) = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  return a1;
}

_OWORD *sub_100013DC4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for REMNavigationSpecifier(0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = sub_10000EFCC(&qword_10002E600);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_100013E9C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a2[1];
  v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for REMNavigationSpecifier(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v16 = sub_10000EFCC(&qword_10002E600);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  v17 = *(int *)(a3 + 24);
  v18 = *(_QWORD *)((char *)a1 + v17);
  *(_QWORD *)((char *)a1 + v17) = *(_QWORD *)((char *)a2 + v17);
  swift_bridgeObjectRelease(v18);
  return a1;
}

uint64_t sub_100013FD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100013FDC);
}

uint64_t sub_100013FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_10000EFCC(&qword_10002E600);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_100014060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001406C);
}

uint64_t sub_10001406C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_10000EFCC(&qword_10002E600);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

void sub_1000140EC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = &unk_1000229B0;
  sub_10001416C(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    v4[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
  }
}

void sub_10001416C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10002E1C0)
  {
    v2 = type metadata accessor for REMNavigationSpecifier(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10002E1C0);
  }
}

__n128 initializeWithTake for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000141D0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1000141F0(uint64_t result, int a2, int a3)
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
  sub_10001422C(a1, &qword_10002E1F8, (uint64_t)&unk_100028E30);
}

void sub_10001422C(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_100014270()
{
  return sub_100011838(&qword_10002E200, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_100022A08);
}

uint64_t sub_10001429C()
{
  return sub_100011838(&qword_10002E208, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)"md");
}

uint64_t sub_1000142C8()
{
  return sub_100011838(&qword_10002E210, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_100022A78);
}

void *sub_10001430C(uint64_t a1, uint64_t a2)
{
  return sub_100014610(a1, a2, (SEL *)&selRef_addedTasks);
}

void *sub_100014318()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = objc_msgSend(v0, "modifiedTask");
  v2 = v1;
  if (v1)
  {
    v3 = v1;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v5 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
    v4 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v5 >= v4 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v4 > 1, v5 + 1, 1);
    v6 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v5, v3);
    specialized Array._endMutation()(v6);
  }

  return &_swiftEmptyArrayStorage;
}

void *sub_1000143D0()
{
  return sub_100014318();
}

void *sub_1000143F0()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *result;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = objc_msgSend(v0, "tasks");
  if (v1)
  {
    v2 = v1;
    v3 = sub_100013968(0, &qword_10002E138, INTask_ptr);
    v4 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

    return v4;
  }
  v6 = objc_msgSend(v0, "taskLists");
  v4 = &_swiftEmptyArrayStorage;
  if (!v6)
    return v4;
  v7 = v6;
  v8 = sub_100013968(0, &qword_10002E228, INTaskList_ptr);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);

  if (!((unint64_t)v9 >> 62))
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = (void *)swift_bridgeObjectRetain(v9);
    if (v10)
      goto LABEL_7;
LABEL_18:
    swift_bridgeObjectRelease_n(v9, 2);
    return &_swiftEmptyArrayStorage;
  }
  if (v9 < 0)
    v17 = v9;
  else
    v17 = v9 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v9);
  result = (void *)_CocoaArrayWrapper.endIndex.getter(v17);
  v10 = (uint64_t)result;
  if (!result)
    goto LABEL_18;
LABEL_7:
  if (v10 >= 1)
  {
    v11 = 0;
    do
    {
      if ((v9 & 0xC000000000000001) != 0)
        v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v11, v9);
      else
        v12 = *(id *)(v9 + 8 * v11 + 32);
      v13 = v12;
      ++v11;
      v14 = objc_msgSend(v12, "tasks");
      v15 = sub_100013968(0, &qword_10002E138, INTask_ptr);
      v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v14, v15);

      sub_10001AD48(v16);
    }
    while (v10 != v11);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

void *sub_1000145E4()
{
  return sub_1000143F0();
}

void *sub_100014604(uint64_t a1, uint64_t a2)
{
  return sub_100014610(a1, a2, (SEL *)&selRef_tasks);
}

void *sub_100014610(uint64_t a1, uint64_t a2, SEL *a3)
{
  id *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend(*v3, *a3);
  if (!v4)
    return &_swiftEmptyArrayStorage;
  v5 = v4;
  v6 = sub_100013968(0, &qword_10002E138, INTask_ptr);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

  return (void *)v7;
}

void *sub_100014680(uint64_t a1, uint64_t a2)
{
  return sub_100014610(a1, a2, (SEL *)&selRef_snoozedTasks);
}

void *sub_10001468C()
{
  id *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v1 = objc_msgSend(*v0, "createdTaskList");
  if (!v1)
    return &_swiftEmptyArrayStorage;
  v2 = v1;
  v3 = objc_msgSend(v1, "tasks");

  v4 = sub_100013968(0, &qword_10002E138, INTask_ptr);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  return (void *)v5;
}

id sub_10001471C()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v1 = objc_msgSend((id)objc_opt_self(UIBlurEffect), "effectWithStyle:", 4);
  v2 = objc_msgSend((id)objc_opt_self(UIVibrancyEffect), "effectForBlurEffect:style:", v1, 6);

  v3 = objc_msgSend(v0, "initWithEffect:", v2);
  v4 = v3;
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  v5 = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  v6 = objc_msgSend((id)objc_opt_self(UIColor), "whiteColor");
  v7 = objc_msgSend(v6, "colorWithAlphaComponent:", 0.5);

  objc_msgSend(v5, "setBackgroundColor:", v7);
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  v8 = objc_msgSend(v4, "contentView");

  objc_msgSend(v8, "addSubview:", v5);
  return v4;
}

id sub_100014910()
{
  return sub_100015568(0, type metadata accessor for TTRIVibrantTableCell.VibrantSelectedBackgroundView);
}

void sub_100014920()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  objc_super v10;

  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for TTRIVibrantTableCell();
  objc_msgSendSuper2(&v10, "layoutSubviews");
  v1 = objc_msgSend(v0, "selectedBackgroundView");
  if (!v1
    || (v2 = v1,
        v3 = type metadata accessor for TTRIVibrantTableCell.VibrantSelectedBackgroundView(),
        v4 = swift_dynamicCastClass(v2, v3),
        v2,
        !v4))
  {
    v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TTRIVibrantTableCell.VibrantSelectedBackgroundView()), "init");
    objc_msgSend(v0, "setSelectedBackgroundView:", v5);

    v6 = objc_msgSend((id)objc_opt_self(UIColor), "ttr_systemGrayColor");
    v7 = objc_msgSend(v6, "colorWithAlphaComponent:", 0.00390625);

    objc_msgSend(v0, "setBackgroundColor:", v7);
  }
  v8 = objc_msgSend(v0, "selectedBackgroundView");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v0, "bounds");
    objc_msgSend(v9, "setFrame:");

  }
}

id sub_100014B38(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)a5(a4);
  return objc_msgSendSuper2(&v7, "initWithCoder:", a3);
}

id sub_100014B80(uint64_t a1)
{
  return sub_100015568(a1, type metadata accessor for TTRIVibrantTableCell);
}

uint64_t type metadata accessor for TTRIVibrantTableCell()
{
  return objc_opt_self(_TtC27RemindersIntentsUIExtension20TTRIVibrantTableCell);
}

uint64_t type metadata accessor for TTRIVibrantTableCell.VibrantSelectedBackgroundView()
{
  return objc_opt_self(_TtCC27RemindersIntentsUIExtension20TTRIVibrantTableCellP33_A16CC222747B0398DAEED7873719199929VibrantSelectedBackgroundView);
}

char *sub_100014BCC(void *a1)
{
  char *v1;
  char *v2;
  objc_class *ObjectType;
  uint64_t v5;
  id v6;
  char *v7;
  id v8;
  id v9;
  char *v10;
  void *v11;
  char *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  objc_super v22;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType(v2);
  *(_QWORD *)&v2[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image] = 0;
  v5 = OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_imageView;
  v6 = objc_allocWithZone((Class)UIImageView);
  v7 = v2;
  *(_QWORD *)&v2[v5] = objc_msgSend(v6, "init");

  v8 = objc_msgSend((id)objc_opt_self(UIBlurEffect), "effectWithStyle:", 4);
  v9 = objc_msgSend((id)objc_opt_self(UIVibrancyEffect), "effectForBlurEffect:style:", v8, 1);

  v22.receiver = v7;
  v22.super_class = ObjectType;
  v10 = (char *)objc_msgSendSuper2(&v22, "initWithEffect:", v9);

  v11 = *(void **)&v10[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_imageView];
  v12 = v10;
  objc_msgSend(v11, "setAutoresizingMask:", 18);
  objc_msgSend(v11, "setUserInteractionEnabled:", 0);
  v13 = objc_msgSend(v12, "contentView");
  objc_msgSend(v13, "addSubview:", v11);

  v14 = OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image;
  v15 = *(void **)&v12[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image];
  *(_QWORD *)&v12[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image] = a1;
  v16 = a1;

  v17 = *(void **)&v12[v14];
  if (v17)
    v18 = objc_msgSend(v17, "imageWithRenderingMode:", 2);
  else
    v18 = 0;
  objc_msgSend(v11, "setImage:", v18);

  objc_msgSend(v12, "invalidateIntrinsicContentSize");
  v19 = *(void **)&v12[v14];
  if (v19)
    v20 = objc_msgSend(v19, "imageWithRenderingMode:", 2);
  else
    v20 = 0;
  objc_msgSend(v11, "setImage:", v20);

  objc_msgSend(v12, "invalidateIntrinsicContentSize");
  return v12;
}

char *sub_100014E1C(void *a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v4;
  id v5;
  char *v6;
  char *v7;
  char *v8;
  void *v9;
  char *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  objc_super v19;

  ObjectType = (objc_class *)swift_getObjectType(v1);
  *(_QWORD *)&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image] = 0;
  v4 = OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_imageView;
  v5 = objc_allocWithZone((Class)UIImageView);
  v6 = v1;
  *(_QWORD *)&v1[v4] = objc_msgSend(v5, "init");

  v19.receiver = v6;
  v19.super_class = ObjectType;
  v7 = (char *)objc_msgSendSuper2(&v19, "initWithCoder:", a1);
  v8 = v7;
  if (v7)
  {
    v9 = *(void **)&v7[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_imageView];
    v10 = v7;
    objc_msgSend(v9, "setAutoresizingMask:", 18);
    objc_msgSend(v9, "setUserInteractionEnabled:", 0);
    v11 = objc_msgSend(v10, "contentView");
    objc_msgSend(v11, "addSubview:", v9);

    v12 = OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image;
    v13 = *(void **)&v10[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image];
    *(_QWORD *)&v10[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image] = 0;

    v14 = *(void **)&v10[v12];
    if (v14)
      v15 = objc_msgSend(v14, "imageWithRenderingMode:", 2);
    else
      v15 = 0;
    objc_msgSend(v9, "setImage:", v15);

    objc_msgSend(v10, "invalidateIntrinsicContentSize");
    v16 = *(void **)&v10[v12];
    if (v16)
      v17 = objc_msgSend(v16, "imageWithRenderingMode:", 2);
    else
      v17 = 0;
    objc_msgSend(v9, "setImage:", v17);

    objc_msgSend(v10, "invalidateIntrinsicContentSize");
  }

  return v8;
}

id sub_100015044()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TTRIVibrantTemplateImageView()
{
  return objc_opt_self(_TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView);
}

void sub_1000150D0()
{
  char *v0;
  id v1;
  unsigned int v2;
  uint64_t v3;
  objc_class *v4;
  id v5;
  char *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  objc_super v14;
  objc_super v15;

  v1 = objc_msgSend(v0, "traitCollection");
  v2 = objc_msgSend(v1, "isAmbientPresented");

  if (v2)
  {
    v3 = *(_QWORD *)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_image];
    v4 = (objc_class *)type metadata accessor for TTRIVibrantCompletedButton();
    v15.receiver = v0;
    v15.super_class = v4;
    objc_msgSendSuper2(&v15, "setImage:forState:", v3, 0);
    v5 = objc_msgSend((id)objc_opt_self(UIColor), "secondaryLabelColor");
    v14.receiver = v0;
    v14.super_class = v4;
    objc_msgSendSuper2(&v14, "setTintColor:", v5);

  }
  else
  {
    v6 = *(char **)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_vibrantImage];
    v7 = *(void **)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_image];
    v8 = OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image;
    v9 = *(void **)&v6[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image];
    *(_QWORD *)&v6[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image] = v7;
    v13 = v7;

    v10 = *(void **)&v6[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_imageView];
    v11 = *(void **)&v6[v8];
    if (v11)
      v12 = objc_msgSend(v11, "imageWithRenderingMode:", 2);
    else
      v12 = 0;
    objc_msgSend(v10, "setImage:", v12);

    objc_msgSend(v6, "invalidateIntrinsicContentSize");
  }
}

char *sub_10001524C()
{
  char *v0;
  uint64_t v1;
  id v2;
  char *v3;
  char *v4;
  void *v5;
  char *v6;
  objc_super v8;

  v1 = OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_vibrantImage;
  v2 = objc_allocWithZone((Class)type metadata accessor for TTRIVibrantTemplateImageView());
  v3 = v0;
  *(_QWORD *)&v0[v1] = sub_100014BCC(0);
  *(_QWORD *)&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_image] = 0;

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for TTRIVibrantCompletedButton();
  v4 = (char *)objc_msgSendSuper2(&v8, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v5 = *(void **)&v4[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_vibrantImage];
  v6 = v4;
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);
  objc_msgSend(v5, "setAutoresizingMask:", 2);
  objc_msgSend(v6, "addSubview:", v5);

  return v6;
}

char *sub_100015354(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  char *v6;
  char *v7;
  void *v8;
  char *v9;
  objc_super v11;

  v3 = OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_vibrantImage;
  v4 = objc_allocWithZone((Class)type metadata accessor for TTRIVibrantTemplateImageView());
  v5 = v1;
  *(_QWORD *)&v1[v3] = sub_100014BCC(0);
  *(_QWORD *)&v5[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_image] = 0;

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for TTRIVibrantCompletedButton();
  v6 = (char *)objc_msgSendSuper2(&v11, "initWithCoder:", a1);
  v7 = v6;
  if (v6)
  {
    v8 = *(void **)&v6[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_vibrantImage];
    v9 = v6;
    objc_msgSend(v8, "setUserInteractionEnabled:", 0);
    objc_msgSend(v8, "setAutoresizingMask:", 2);
    objc_msgSend(v9, "addSubview:", v8);

  }
  return v7;
}

void sub_100015530()
{
  uint64_t v0;

}

id sub_10001555C(uint64_t a1)
{
  return sub_100015568(a1, type metadata accessor for TTRIVibrantCompletedButton);
}

id sub_100015568(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for TTRIVibrantCompletedButton()
{
  return objc_opt_self(_TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton);
}

void sub_1000155F0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t inited;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
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
  char v32[104];

  v29 = a5;
  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_10000EFCC(&qword_10002E2F0);
  inited = swift_initStackObject(v13, v32);
  *(_OWORD *)(inited + 16) = xmmword_100022900;
  type metadata accessor for Analytics(0);
  *(_QWORD *)(inited + 32) = 0x696669746E656449;
  *(_QWORD *)(inited + 40) = 0xEA00000000007265;
  sub_100015A9C();
  *(_QWORD *)(inited + 48) = NSString.init(stringLiteral:)("Navigation", 10, 2);
  *(_QWORD *)(inited + 56) = 0xD00000000000001ALL;
  *(_QWORD *)(inited + 64) = 0x8000000100025380;
  v27 = a1;
  *(_QWORD *)(inited + 72) = String._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 80) = 0xD00000000000001ALL;
  *(_QWORD *)(inited + 88) = 0x80000001000253A0;
  v28 = a3;
  *(_QWORD *)(inited + 96) = String._bridgeToObjectiveC()();
  v15 = sub_100016248(inited);
  static Analytics.postEvent(_:payload:duration:)(0xD00000000000001CLL, 0x8000000100025350, v15, 0, 1);
  swift_bridgeObjectRelease(v15);
  if (qword_10002E020 != -1)
    swift_once(&qword_10002E020, sub_1000159AC);
  v16 = type metadata accessor for Logger(0);
  sub_100015A84(v16, (uint64_t)qword_10002EB60);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v29, v9);
  swift_bridgeObjectRetain_n(a2, 2);
  v17 = swift_bridgeObjectRetain_n(a4, 2);
  v18 = Logger.logObject.getter(v17);
  v19 = v9;
  v20 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v20))
  {
    v21 = swift_slowAlloc(32, -1);
    v22 = swift_slowAlloc(96, -1);
    v31 = v22;
    *(_DWORD *)v21 = 136315650;
    v29 = v19;
    swift_bridgeObjectRetain(a2);
    v30 = sub_10001F3AC(v27, a2, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v21 + 4, v21 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    *(_WORD *)(v21 + 12) = 2080;
    swift_bridgeObjectRetain(a4);
    v30 = sub_10001F3AC(v28, a4, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v21 + 14, v21 + 22);
    v23 = swift_bridgeObjectRelease_n(a4, 3);
    *(_WORD *)(v21 + 22) = 2080;
    v24 = URL.absoluteString.getter(v23);
    v26 = v25;
    v30 = sub_10001F3AC(v24, v25, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v21 + 24, v21 + 32);
    swift_bridgeObjectRelease(v26);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v29);
    _os_log_impl((void *)&_mh_execute_header, v18, v20, "Navigating (%s) -> (%s) {url:%s}", (uint8_t *)v21, 0x20u);
    swift_arrayDestroy(v22, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v21, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(a4, 2);
    swift_bridgeObjectRelease_n(a2, 2);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v19);
  }

}

uint64_t sub_1000159AC(uint64_t a1)
{
  return sub_1000159D4(a1, qword_10002EB60, (SEL *)&selRef_userAction);
}

uint64_t sub_1000159C0(uint64_t a1)
{
  return sub_1000159D4(a1, qword_10002EB78, (SEL *)&selRef_siriKit);
}

uint64_t sub_1000159D4(uint64_t a1, uint64_t *a2, SEL *a3)
{
  uint64_t v5;
  id v6;

  v5 = type metadata accessor for Logger(0);
  sub_100015A44(v5, a2);
  sub_100015A84(v5, (uint64_t)a2);
  v6 = objc_msgSend((id)objc_opt_self(REMLog), *a3);
  return Logger.init(_:)(v6);
}

uint64_t *sub_100015A44(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100015A84(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_100015A9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002E2F8;
  if (!qword_10002E2F8)
  {
    v1 = objc_opt_self(NSString);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10002E2F8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TTRIIntentsSnippetReminderCellViewModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

id sub_100015B08(id result, uint64_t a2, char a3)
{
  if (a3 == 1)
    return (id)swift_bridgeObjectRetain(a2);
  if (!a3)
    return result;
  return result;
}

uint64_t destroy for TTRIIntentsSnippetReminderCellViewModel(uint64_t a1)
{
  int v2;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 32));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 48));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 64));
  v2 = *(unsigned __int8 *)(a1 + 88);
  if (v2 != 255)
    sub_100015B8C(*(void **)(a1 + 72), *(_QWORD *)(a1 + 80), v2);

  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 120));
}

void sub_100015B8C(void *a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {
    swift_bridgeObjectRelease(a2);
  }
  else if (!a3)
  {

  }
}

uint64_t initializeWithCopy for TTRIIntentsSnippetReminderCellViewModel(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v4 = *(void **)a2;
  v5 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v6;
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  v8 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v8;
  v9 = *(unsigned __int8 *)(a2 + 88);
  v10 = v4;
  v11 = v5;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  if (v9 == 255)
  {
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  }
  else
  {
    v12 = *(void **)(a2 + 72);
    v13 = *(_QWORD *)(a2 + 80);
    sub_100015B08(v12, v13, v9);
    *(_QWORD *)(a1 + 72) = v12;
    *(_QWORD *)(a1 + 80) = v13;
    *(_BYTE *)(a1 + 88) = v9;
  }
  v14 = *(void **)(a2 + 96);
  *(_QWORD *)(a1 + 96) = v14;
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  v15 = *(_QWORD *)(a2 + 112);
  v16 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = v15;
  *(_QWORD *)(a1 + 120) = v16;
  v17 = v14;
  swift_bridgeObjectRetain(v16);
  return a1;
}

uint64_t assignWithCopy for TTRIIntentsSnippetReminderCellViewModel(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 *v16;
  __int128 *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  char v23;
  void *v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  *(_BYTE *)(a1 + 19) = *(_BYTE *)(a2 + 19);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  v11 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v12 = *(_QWORD *)(a2 + 48);
  v13 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v14 = *(_QWORD *)(a2 + 64);
  v15 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  v16 = (__int128 *)(a1 + 72);
  v17 = (__int128 *)(a2 + 72);
  v18 = *(unsigned __int8 *)(a2 + 88);
  if (*(unsigned __int8 *)(a1 + 88) == 255)
  {
    if (v18 == 255)
    {
      v27 = *v17;
      *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
      *v16 = v27;
    }
    else
    {
      v24 = *(void **)(a2 + 72);
      v25 = *(_QWORD *)(a2 + 80);
      sub_100015B08(v24, v25, *(_BYTE *)(a2 + 88));
      *(_QWORD *)(a1 + 72) = v24;
      *(_QWORD *)(a1 + 80) = v25;
      *(_BYTE *)(a1 + 88) = v18;
    }
  }
  else if (v18 == 255)
  {
    sub_100015E50(a1 + 72);
    v26 = *(_BYTE *)(a2 + 88);
    *v16 = *v17;
    *(_BYTE *)(a1 + 88) = v26;
  }
  else
  {
    v19 = *(void **)(a2 + 72);
    v20 = *(_QWORD *)(a2 + 80);
    sub_100015B08(v19, v20, *(_BYTE *)(a2 + 88));
    v21 = *(void **)(a1 + 72);
    v22 = *(_QWORD *)(a1 + 80);
    *(_QWORD *)(a1 + 72) = v19;
    *(_QWORD *)(a1 + 80) = v20;
    v23 = *(_BYTE *)(a1 + 88);
    *(_BYTE *)(a1 + 88) = v18;
    sub_100015B8C(v21, v22, v23);
  }
  v28 = *(void **)(a1 + 96);
  v29 = *(void **)(a2 + 96);
  *(_QWORD *)(a1 + 96) = v29;
  v30 = v29;

  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  v31 = *(_QWORD *)(a2 + 120);
  v32 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 120) = v31;
  swift_bridgeObjectRetain(v31);
  swift_bridgeObjectRelease(v32);
  return a1;
}

uint64_t sub_100015E50(uint64_t a1)
{
  sub_100015B8C(*(void **)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  return a1;
}

__n128 initializeWithTake for TTRIIntentsSnippetReminderCellViewModel(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for TTRIIntentsSnippetReminderCellViewModel(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  int v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  *(_BYTE *)(a1 + 19) = *(_BYTE *)(a2 + 19);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 48);
  v9 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v8;
  swift_bridgeObjectRelease(v9);
  v10 = *(_QWORD *)(a2 + 64);
  v11 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v10;
  swift_bridgeObjectRelease(v11);
  v12 = (_OWORD *)(a2 + 72);
  v13 = *(unsigned __int8 *)(a1 + 88);
  if (v13 == 255)
    goto LABEL_5;
  v14 = *(unsigned __int8 *)(a2 + 88);
  if (v14 == 255)
  {
    sub_100015E50(a1 + 72);
LABEL_5:
    *(_OWORD *)(a1 + 72) = *v12;
    *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
    goto LABEL_6;
  }
  v15 = *(void **)(a1 + 72);
  v16 = *(_QWORD *)(a1 + 80);
  *(_OWORD *)(a1 + 72) = *v12;
  *(_BYTE *)(a1 + 88) = v14;
  sub_100015B8C(v15, v16, v13);
LABEL_6:
  v17 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);

  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  v18 = *(_QWORD *)(a2 + 120);
  v19 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v18;
  swift_bridgeObjectRelease(v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for TTRIIntentsSnippetReminderCellViewModel(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 128))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TTRIIntentsSnippetReminderCellViewModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 128) = 1;
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
    *(_BYTE *)(result + 128) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TTRIIntentsSnippetReminderCellViewModel()
{
  return &type metadata for TTRIIntentsSnippetReminderCellViewModel;
}

void destroy for TTRIIntentsSnippetReminderCellViewModel.ContactTriggerState(uint64_t a1)
{
  sub_100015B8C(*(void **)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s27RemindersIntentsUIExtension39TTRIIntentsSnippetReminderCellViewModelV19ContactTriggerStateOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100015B08(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for TTRIIntentsSnippetReminderCellViewModel.ContactTriggerState(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  char v8;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100015B08(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_100015B8C(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for TTRIIntentsSnippetReminderCellViewModel.ContactTriggerState(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for TTRIIntentsSnippetReminderCellViewModel.ContactTriggerState(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_100015B8C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for TTRIIntentsSnippetReminderCellViewModel.ContactTriggerState(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TTRIIntentsSnippetReminderCellViewModel.ContactTriggerState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_100016204(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_100016220(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TTRIIntentsSnippetReminderCellViewModel.ContactTriggerState()
{
  return &type metadata for TTRIIntentsSnippetReminderCellViewModel.ContactTriggerState;
}

unint64_t sub_100016248(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000EFCC(&qword_10002E358);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (void **)(a1 + 48);
  while (1)
  {
    v7 = (uint64_t)*(v6 - 2);
    v8 = (uint64_t)*(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    v10 = v9;
    result = sub_100008164(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v10;
    v14 = v4[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v4[2] = v16;
    v6 += 3;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100016360(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void **v6;
  void *v7;
  id v8;
  id v9;
  unint64_t result;
  char v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000EFCC(&qword_10002E340);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (void **)(a1 + 40);
  while (1)
  {
    v7 = *v6;
    v8 = *(v6 - 1);
    v9 = v7;
    result = sub_1000081C8((uint64_t)v8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = 8 * result;
    *(_QWORD *)(v4[6] + v12) = v8;
    *(_QWORD *)(v4[7] + v12) = v9;
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v6 += 2;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100016468(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000EFCC(&qword_10002E348);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_1000137F0(v7, (uint64_t)&v14, &qword_10002E350);
    v8 = v14;
    result = sub_1000081C8(v14);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v8;
    result = (unint64_t)sub_1000178FC(&v15, (_OWORD *)(v4[7] + 32 * result));
    v11 = v4[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4[2] = v13;
    v7 += 40;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100016594(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void **v6;
  void *v7;
  id v8;
  id v9;
  unint64_t result;
  char v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000EFCC((uint64_t *)&unk_10002E720);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (void **)(a1 + 40);
  while (1)
  {
    v7 = *v6;
    v8 = *(v6 - 1);
    v9 = v7;
    result = sub_100008248((uint64_t)v8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = 8 * result;
    *(_QWORD *)(v4[6] + v12) = v8;
    *(_QWORD *)(v4[7] + v12) = v9;
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v6 += 2;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10001669C()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t inited;
  id v7;
  NSString *v8;
  _BOOL4 IsBoldTextEnabled;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  unint64_t v17;
  uint64_t v18;
  NSString *v19;
  unint64_t v20;
  uint64_t v21;
  NSString *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  NSString *v26;
  unint64_t v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  Swift::String v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  id v56;
  void *v57;
  unint64_t v58;
  char v59[48];
  char v60[48];
  char v61[48];
  char v62[48];
  char v63[48];
  char v64[48];
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  __int128 v74;
  uint64_t v75;
  _QWORD *v76;
  _QWORD v77[2];

  v70 = sub_100013968(0, &qword_10002E6E0, REMReminder_ptr);
  v71 = &protocol witness table for REMReminder;
  *(_QWORD *)&v68 = v0;
  v1 = v0;
  TTRReminderViewModelComputedProperties.init(reminder:postProcessingOperations:)(&v72, &v68, 3);
  v57 = v72;
  if (v72)
  {
    v2 = v72;
    v3 = v72;
  }
  else
  {
    v4 = objc_msgSend(v1, "title");
    if (!v4)
    {
      v30 = 0;
      goto LABEL_9;
    }
    v3 = v4;
    v2 = 0;
  }
  v5 = sub_10000EFCC(&qword_10002E328);
  inited = swift_initStackObject(v5, v64);
  *(_OWORD *)(inited + 16) = xmmword_100022930;
  *(_QWORD *)(inited + 32) = NSFontAttributeName;
  v7 = v2;
  v8 = NSFontAttributeName;
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  v10 = sub_100013968(0, &qword_10002E330, UIFont_ptr);
  if (IsBoldTextEnabled)
    v11 = static UIFont.roundedHeadlineFont.getter(v10);
  else
    v11 = static UIFont.roundedSubheadlineFont.getter(v10);
  *(_QWORD *)(inited + 40) = v11;
  v55 = sub_100016360(inited);
  v12 = swift_initStackObject(v5, v63);
  *(_OWORD *)(v12 + 16) = xmmword_100022930;
  *(_QWORD *)(v12 + 32) = v8;
  *(_QWORD *)(v12 + 40) = static UIFont.roundedSubheadlineSemiboldFont.getter(v8);
  v13 = sub_100016360(v12);
  v14 = *((_QWORD *)&v74 + 1);
  v15 = swift_initStackObject(v5, v62);
  *(_OWORD *)(v15 + 16) = xmmword_100022930;
  *(_QWORD *)(v15 + 32) = NSForegroundColorAttributeName;
  sub_100013968(0, &qword_10002E338, UIColor_ptr);
  swift_bridgeObjectRetain(v14);
  v16 = NSForegroundColorAttributeName;
  *(_QWORD *)(v15 + 40) = static UIColor.ttrSecondaryLabelColor.getter();
  v17 = sub_100016EAC(v15);
  v18 = swift_initStackObject(v5, v61);
  *(_OWORD *)(v18 + 16) = xmmword_100022930;
  *(_QWORD *)(v18 + 32) = v16;
  v19 = v16;
  *(_QWORD *)(v18 + 40) = static UIColor.ttrSecondaryLabelColor.getter();
  v20 = sub_100016EAC(v18);
  v21 = swift_initStackObject(v5, v60);
  *(_OWORD *)(v21 + 16) = xmmword_100022930;
  *(_QWORD *)(v21 + 32) = v19;
  v22 = v19;
  *(_QWORD *)(v21 + 40) = static UIColor.ttrLinkColor.getter();
  v23 = sub_100016EAC(v21);
  v24 = swift_initStackObject(v5, v59);
  *(_OWORD *)(v24 + 16) = xmmword_100022930;
  *(_QWORD *)(v24 + 32) = v22;
  v25 = (void *)objc_opt_self(UIColor);
  v26 = v22;
  *(_QWORD *)(v24 + 40) = objc_msgSend(v25, "magentaColor");
  v27 = sub_100016EAC(v24);
  v28 = objc_allocWithZone((Class)type metadata accessor for TTRReminderTextStorage(0));
  v29 = (void *)TTRReminderTextStorage.init(baseTextStyles:uncommittedHashtagTextStyles:committedHashtagTextStyles:foreignHashtagTextStyles:harvestedResultTextStyles:hashtagVisibility:debug_nonEditableTextStyles:debug_highlightNonEditableTexts:)(v55, v17, v13, v20, v23, v14, v27, 0);
  objc_msgSend(v29, "insertAttributedString:atIndex:", v3, 0);
  v30 = objc_msgSend(objc_allocWithZone((Class)NSAttributedString), "initWithAttributedString:", v29);

LABEL_9:
  v68 = v74;
  v31 = v75;
  v69 = v75;
  v77[0] = v75;
  if (!((unint64_t)v75 >> 62))
  {
    v32 = *(_QWORD *)((v75 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v75);
    if (v32)
      goto LABEL_11;
LABEL_25:
    sub_1000177DC(v77);
    v35 = _swiftEmptyArrayStorage;
LABEL_26:
    v65 = v35;
    v53 = sub_10000EFCC(&qword_10002E310);
    v54 = sub_100017804();
    BidirectionalCollection<>.joined(separator:)(32, 0xE100000000000000, v53, v54);

    sub_100017850((uint64_t)&v73, (uint64_t)&v76);
    sub_100017898((id *)&v76);
    sub_1000178C0((uint64_t)&v68 + 8, (uint64_t)&v66);
    sub_1000177DC(&v66);
    sub_1000177DC(v77);
    swift_bridgeObjectRelease(v35);
    return (uint64_t)v30;
  }
  if (v75 >= 0)
    v52 = v75 & 0xFFFFFFFFFFFFFF8;
  else
    v52 = v75;
  swift_bridgeObjectRetain(v75);
  v32 = _CocoaArrayWrapper.endIndex.getter(v52);
  if (!v32)
    goto LABEL_25;
LABEL_11:
  v76 = _swiftEmptyArrayStorage;
  result = sub_10000D5CC(0, v32 & ~(v32 >> 63), 0);
  if ((v32 & 0x8000000000000000) == 0)
  {
    v56 = v30;
    v34 = 0;
    v35 = v76;
    v58 = v31 & 0xC000000000000001;
    v36 = v31;
    do
    {
      if (v58)
        v37 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v34, v31);
      else
        v37 = *(id *)(v31 + 8 * v34 + 32);
      v38 = v37;
      v39 = static String.hashtagTokenDefaultPrefix.getter();
      v41 = v40;
      v42 = objc_msgSend(v38, "name");
      v43 = static String._unconditionallyBridgeFromObjectiveC(_:)(v42);
      v45 = v44;

      v66 = v39;
      v67 = v41;
      swift_bridgeObjectRetain(v41);
      v46._countAndFlagsBits = v43;
      v46._object = v45;
      String.append(_:)(v46);

      swift_bridgeObjectRelease(v41);
      swift_bridgeObjectRelease(v45);
      v47 = v66;
      v48 = v67;
      v76 = v35;
      v50 = v35[2];
      v49 = v35[3];
      if (v50 >= v49 >> 1)
      {
        sub_10000D5CC(v49 > 1, v50 + 1, 1);
        v35 = v76;
      }
      ++v34;
      v35[2] = v50 + 1;
      v51 = &v35[2 * v50];
      v51[4] = v47;
      v51[5] = v48;
      v31 = v36;
    }
    while (v32 != v34);
    sub_1000177DC(v77);
    v30 = v56;
    goto LABEL_26;
  }
  __break(1u);
  return result;
}

uint64_t sub_100016BF4@<X0>(id a1@<X0>, void *a2@<X1>, char a3@<W2>, char a4@<W3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, char a16, void *a17, char a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  id v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char v36;
  void *v37;
  id v38;
  uint64_t v39;
  char v41;
  uint64_t v42;
  char v43;
  char v44;
  char v45;
  char v46;
  id v47;
  id v48;
  id v49;
  char v51;
  char v52;
  char v53;
  void *v54;
  uint64_t v55;
  char v56;
  char v57;
  uint64_t v58;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;

  v21 = v20;
  v62 = a1;
  if (!a1)
    a1 = *(id *)v21;
  v61 = a1;
  v66 = a2;
  if (!a2)
  {
    v66 = *(void **)(v21 + 8);
    v28 = v66;
  }
  if (a3 == 2)
    v29 = *(_BYTE *)(v21 + 16);
  else
    v29 = a3 & 1;
  v53 = v29;
  if (a5 == 2)
    v30 = *(_BYTE *)(v21 + 18);
  else
    v30 = a5 & 1;
  v52 = v30;
  v56 = *(_BYTE *)(v21 + 19);
  v57 = *(_BYTE *)(v21 + 17);
  v31 = a8;
  if (!a8)
  {
    a7 = *(_QWORD *)(v21 + 24);
    v31 = *(_QWORD *)(v21 + 32);
    swift_bridgeObjectRetain(v31);
  }
  v32 = a11;
  if (!a11)
  {
    a10 = *(_QWORD *)(v21 + 40);
    v32 = swift_bridgeObjectRetain(*(_QWORD *)(v21 + 48));
  }
  v58 = v32;
  v63 = a10;
  v65 = a7;
  v33 = a13;
  if (!a13)
  {
    a12 = *(_QWORD *)(v21 + 56);
    v33 = *(_QWORD *)(v21 + 64);
    swift_bridgeObjectRetain(v33);
  }
  v64 = a12;
  v35 = a14;
  v34 = a15;
  v36 = a16;
  if (a16 == -1)
  {
    v35 = *(void **)(v21 + 72);
    v34 = *(_QWORD *)(v21 + 80);
    v36 = *(_BYTE *)(v21 + 88);
    sub_10001790C(v35, v34, v36);
  }
  v54 = v35;
  v37 = a17;
  if (!a17)
  {
    v37 = *(void **)(v21 + 96);
    v38 = v37;
  }
  v55 = v33;
  v39 = v31;
  if (a18 == 2)
    v41 = *(_BYTE *)(v21 + 104);
  else
    v41 = a18 & 1;
  v51 = v41;
  v42 = a20;
  if (!a20)
  {
    a19 = *(_QWORD *)(v21 + 112);
    v42 = *(_QWORD *)(v21 + 120);
    swift_bridgeObjectRetain(v42);
  }
  v43 = v56;
  if (a6 != 2)
    v43 = a6;
  v44 = v57;
  if (a4 != 2)
    v44 = a4;
  v45 = v44 & 1;
  v46 = v43 & 1;
  swift_bridgeObjectRetain(a13);
  v47 = v62;
  v48 = a2;
  swift_bridgeObjectRetain(a8);
  swift_bridgeObjectRetain(a11);
  sub_10001790C(a14, a15, a16);
  *(_QWORD *)a9 = v61;
  *(_QWORD *)(a9 + 8) = v66;
  *(_BYTE *)(a9 + 16) = v53;
  *(_BYTE *)(a9 + 17) = v45;
  *(_BYTE *)(a9 + 18) = v52;
  *(_BYTE *)(a9 + 19) = v46;
  *(_QWORD *)(a9 + 24) = v65;
  *(_QWORD *)(a9 + 32) = v39;
  *(_QWORD *)(a9 + 40) = v63;
  *(_QWORD *)(a9 + 48) = v58;
  *(_QWORD *)(a9 + 56) = v64;
  *(_QWORD *)(a9 + 64) = v55;
  *(_QWORD *)(a9 + 72) = v54;
  *(_QWORD *)(a9 + 80) = v34;
  *(_BYTE *)(a9 + 88) = v36;
  *(_QWORD *)(a9 + 96) = v37;
  *(_BYTE *)(a9 + 104) = v51;
  *(_QWORD *)(a9 + 112) = a19;
  *(_QWORD *)(a9 + 120) = v42;
  v49 = a17;
  return swift_bridgeObjectRetain(a20);
}

unint64_t sub_100016EAC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void **v6;
  void *v7;
  id v8;
  id v9;
  unint64_t result;
  char v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000EFCC(&qword_10002E340);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (void **)(a1 + 40);
  while (1)
  {
    v7 = *v6;
    v8 = *(v6 - 1);
    v9 = v7;
    result = sub_100016FB4((uint64_t)v8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = 8 * result;
    *(_QWORD *)(v4[6] + v12) = v8;
    *(_QWORD *)(v4[7] + v12) = v9;
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v6 += 2;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100016FB4(uint64_t a1)
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
  return sub_100017034(a1, v7);
}

unint64_t sub_100017034(uint64_t a1, uint64_t a2)
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  char v29;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
      goto LABEL_22;
    v13 = v11;
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) != 0)
      return v5;
    v15 = ~v4;
    v5 = (v5 + 1) & v15;
    if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
      return v5;
    v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
    v9 = v17;
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v16 == v18 && v9 == v19)
    {
LABEL_22:
      swift_bridgeObjectRelease_n(v9, 2);
      return v5;
    }
    v21 = v19;
    v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v21);
    if ((v22 & 1) == 0)
    {
      v5 = (v5 + 1) & v15;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
          v9 = v24;
          v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v23 == v25 && v9 == v26)
            break;
          v28 = v26;
          v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v9, v25, v26, 0);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v28);
          if ((v29 & 1) == 0)
          {
            v5 = (v5 + 1) & v15;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_22;
      }
    }
  }
  return v5;
}

uint64_t sub_100017220@<X0>(void *a1@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(char *, uint64_t, uint64_t);
  int v27;
  id v28;
  id v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  char v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  char *v52;
  id v53;
  uint64_t v54;
  uint64_t result;
  char v56;
  char v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int *v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  int v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  int v77;
  _QWORD v78[6];
  char v79;
  __int128 v80;
  __int128 v81;
  void *v82;

  v76 = a2;
  v77 = a3;
  v6 = sub_10000EFCC(&qword_10002E300);
  v7 = __chkstk_darwin(v6);
  v9 = (uint64_t *)((char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v7);
  v11 = (char *)&v62 - v10;
  v12 = sub_10000EFCC(&qword_10002E308);
  __chkstk_darwin(v12);
  v14 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (int *)type metadata accessor for TTRRemindersListViewModel.Reminder(0);
  __chkstk_darwin(v15);
  v17 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for TTRRemindersListViewModel.Item(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v14, 1, 1, v18);
  *((_QWORD *)&v81 + 1) = sub_100013968(0, &qword_10002E6E0, REMReminder_ptr);
  v82 = &protocol witness table for REMReminder;
  *(_QWORD *)&v80 = a1;
  TTRReminderProtocolWithPendingMove.init(reminder:pendingMoveTargetList:)(v78, &v80, 0);
  v80 = 0u;
  v81 = 0u;
  v82 = 0;
  v19 = a1;
  TTRRemindersListViewModel.Reminder.init(item:reminderAndList:precomputedProperties:overrides:)(v14, v78, &v80, _swiftEmptyArrayStorage);
  v73 = v17[v15[25]];
  v69 = v19;
  v72 = sub_10001669C();
  v21 = v20;
  v74 = v22;
  v23 = *(void **)&v17[v15[5]];
  v71 = v17[v15[8]];
  v24 = (uint64_t)&v17[v15[11]];
  sub_1000137F0(v24, (uint64_t)v11, &qword_10002E300);
  v25 = type metadata accessor for TTRRemindersListViewModel.DisplayDate(0);
  v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 48);
  v27 = v26(v11, 1, v25);
  v70 = v23;
  if (v27 == 1)
  {
    v28 = v23;
    sub_100017698((uint64_t)v11);
    v65 = 0;
  }
  else
  {
    v65 = v11[*(int *)(v25 + 28)];
    v29 = v23;
    sub_1000177A0((uint64_t)v11, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.DisplayDate);
  }
  sub_1000137F0(v24, (uint64_t)v9, &qword_10002E300);
  v30 = v26((char *)v9, 1, v25);
  v75 = v21;
  if (v30 == 1)
  {
    sub_100017698((uint64_t)v9);
    v31 = 0;
    v32 = 0;
  }
  else
  {
    v31 = *v9;
    v32 = v9[1];
    swift_bridgeObjectRetain(v32);
    sub_1000177A0((uint64_t)v9, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.DisplayDate);
  }
  v33 = &v17[v15[29]];
  v34 = *((_QWORD *)v33 + 1);
  v68 = *(_QWORD *)v33;
  v35 = &v17[v15[12]];
  v36 = *((_QWORD *)v35 + 3);
  v67 = v34;
  if (v36)
  {
    v62 = v32;
    v37 = *((_QWORD *)v35 + 4);
    v38 = *((_QWORD *)v35 + 5);
    v64 = v15;
    v63 = v31;
    v39 = (void *)*((_QWORD *)v35 + 1);
    v40 = *((_QWORD *)v35 + 2);
    v42 = v35[48];
    v78[0] = *(_QWORD *)v35;
    v41 = (void *)v78[0];
    v78[1] = v39;
    v78[2] = v40;
    v78[3] = v36;
    v78[4] = v37;
    v78[5] = v38;
    v79 = v42 & 1;
    swift_bridgeObjectRetain(v34);
    v43 = sub_100017708(v41, v39, v40, v36, v37, v38);
    v66 = TTRRemindersListViewModel.LocationData.title.getter(v43);
    v45 = v44;
    v46 = v39;
    v31 = v63;
    v47 = v40;
    v15 = v64;
    v48 = v38;
    v32 = v62;
    sub_100017754(v41, v46, v47, v36, v37, v48);
  }
  else
  {
    swift_bridgeObjectRetain(v34);
    v66 = 0;
    v45 = 0;
  }
  v50 = v69;
  v49 = v70;
  v51 = objc_msgSend(v69, "contactHandles");

  v52 = &v17[v15[37]];
  v53 = *(id *)v52;
  v54 = *((_QWORD *)v52 + 2);
  sub_1000176D8(*(id *)v52, *((_QWORD *)v52 + 1), v54);
  result = sub_1000177A0((uint64_t)v17, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.Reminder);
  if (v53)
    result = swift_bridgeObjectRelease(v54);
  if (v51)
    v56 = 0;
  else
    v56 = -1;
  v57 = v73 & 1;
  v58 = v72;
  *(_QWORD *)a4 = v49;
  *(_QWORD *)(a4 + 8) = v58;
  LOBYTE(v58) = v77 & 1;
  v59 = v76 & 1;
  *(_BYTE *)(a4 + 16) = v71;
  *(_BYTE *)(a4 + 17) = v57;
  *(_BYTE *)(a4 + 18) = v58;
  *(_BYTE *)(a4 + 19) = v65;
  *(_QWORD *)(a4 + 24) = v31;
  *(_QWORD *)(a4 + 32) = v32;
  v60 = v67;
  *(_QWORD *)(a4 + 40) = v68;
  *(_QWORD *)(a4 + 48) = v60;
  *(_QWORD *)(a4 + 56) = v66;
  *(_QWORD *)(a4 + 64) = v45;
  *(_QWORD *)(a4 + 72) = v51;
  *(_QWORD *)(a4 + 80) = 0;
  *(_BYTE *)(a4 + 88) = v56;
  *(_QWORD *)(a4 + 96) = v53;
  *(_BYTE *)(a4 + 104) = v59;
  v61 = v74;
  *(_QWORD *)(a4 + 112) = v75;
  *(_QWORD *)(a4 + 120) = v61;
  return result;
}

uint64_t sub_100017698(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000EFCC(&qword_10002E300);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_1000176D8(id result, uint64_t a2, uint64_t a3)
{
  id v3;

  if (result)
  {
    v3 = result;
    swift_bridgeObjectRetain(a3);
    return v3;
  }
  return result;
}

id sub_100017708(id result, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v8;
  id v9;

  if (a4)
  {
    v9 = result;
    v8 = a2;
    swift_bridgeObjectRetain(a4);
    swift_bridgeObjectRetain(a6);
    return v9;
  }
  return result;
}

void sub_100017754(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a4)
  {
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a6);

  }
}

uint64_t sub_1000177A0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_QWORD *sub_1000177DC(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  return a1;
}

unint64_t sub_100017804()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002E318;
  if (!qword_10002E318)
  {
    v1 = sub_10001187C(&qword_10002E310);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10002E318);
  }
  return result;
}

uint64_t sub_100017850(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000EFCC(&qword_10002E320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id *sub_100017898(id *a1)
{

  return a1;
}

uint64_t sub_1000178C0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for TTRReminderCellInlineHashtagVisibility - 1) + 32))(a2, a1);
  return a2;
}

_OWORD *sub_1000178FC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id sub_10001790C(id result, uint64_t a2, char a3)
{
  if (a3 != -1)
    return sub_100015B08(result, a2, a3);
  return result;
}

void sub_100017920()
{
  _BYTE *v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  id v4;
  NSString v5;
  void *v6;
  double v7;

  v1 = *(void **)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_headingLabel];
  if (!v1)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_viewModel + 8];
  if (v2)
    v3 = *(_QWORD *)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_viewModel + 8];
  else
    v3 = 0xE000000000000000;
  v4 = v1;
  swift_bridgeObjectRetain(v2);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  objc_msgSend(v4, "setText:", v5);

  v6 = *(void **)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_topConstraint];
  if (!v6)
    goto LABEL_10;
  v7 = 16.0;
  if (v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_isFirst])
    v7 = 6.0;
  objc_msgSend(v6, "setConstant:", v7);
  objc_msgSend(v0, "layoutIfNeeded");
}

id sub_100017B04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v3;
  objc_class *ObjectType;
  _QWORD *v7;
  NSString v8;
  id v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType(v3);
  v7 = &v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_viewModel];
  *v7 = 0;
  v7[1] = 0;
  v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_isFirst] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_topConstraint] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_headingLabel] = 0;
  if (a3)
  {
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a3);
  }
  else
  {
    v8 = 0;
  }
  v11.receiver = v3;
  v11.super_class = ObjectType;
  v9 = objc_msgSendSuper2(&v11, "initWithStyle:reuseIdentifier:", a1, v8);

  return v9;
}

id sub_100017C14(void *a1)
{
  _BYTE *v1;
  objc_class *ObjectType;
  _QWORD *v4;
  id v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(v1);
  v4 = &v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_viewModel];
  *v4 = 0;
  v4[1] = 0;
  v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_isFirst] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_topConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_headingLabel] = 0;
  v7.receiver = v1;
  v7.super_class = ObjectType;
  v5 = objc_msgSendSuper2(&v7, "initWithCoder:", a1);

  return v5;
}

void sub_100017CBC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0
                                      + OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_viewModel
                                      + 8));

}

uint64_t type metadata accessor for TTRIIntentsSnippetHeaderCell()
{
  return objc_opt_self(_TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell);
}

id sub_100017D68()
{
  qword_10002EB90 = *(_QWORD *)TTRCommonAsset.Image.reminderCompleted.unsafeMutableAddressor();
  return (id)qword_10002EB90;
}

id sub_100017D88()
{
  qword_10002EB98 = *(_QWORD *)TTRCommonAsset.Image.reminderIncomplete.unsafeMutableAddressor();
  return (id)qword_10002EB98;
}

id sub_100017DA8()
{
  qword_10002EBA0 = *(_QWORD *)TTRCommonAsset.Image.reminderDetailButtonFlagged.unsafeMutableAddressor();
  return (id)qword_10002EBA0;
}

void sub_100017DC8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSString v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSString v19;
  uint64_t v20;
  void *v21;
  uint64_t (*v22)(uint64_t, char);
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _BYTE v36[32];
  _BYTE v37[128];
  uint64_t v38[16];
  _BYTE v39[128];
  uint64_t v40[16];
  _BYTE v41[128];
  uint64_t v42[16];
  char v43[24];
  _BYTE v44[128];
  uint64_t v45[16];

  v1 = v0;
  sub_100018668();
  Strong = swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_titleLabel], v2);
  if (!Strong)
  {
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    return;
  }
  v4 = (void *)Strong;
  v5 = (uint64_t)&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel];
  swift_beginAccess(&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel], v43, 0, 0);
  sub_10001A230(v5, (uint64_t)v44);
  sub_10001A230((uint64_t)v44, (uint64_t)v45);
  v6 = 0;
  if (sub_10001A278(v45) != 1)
    v6 = *(id *)(v5 + 8);
  objc_msgSend(v4, "setAttributedText:", v6);

  sub_1000188AC();
  v8 = swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_locationTriggerLabel], v7);
  if (!v8)
    goto LABEL_22;
  v9 = (void *)v8;
  sub_10001A230(v5, (uint64_t)v41);
  sub_10001A230((uint64_t)v41, (uint64_t)v42);
  if (sub_10001A278(v42) == 1 || (v10 = *(_QWORD *)(v5 + 64)) == 0)
  {
    v11 = 0;
  }
  else
  {
    swift_bridgeObjectRetain(*(_QWORD *)(v5 + 64));
    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v10);
  }
  objc_msgSend(v9, "setText:", v11);

  v12._object = (void *)0x80000001000256C0;
  v13._countAndFlagsBits = 0x6E6967617373654DLL;
  v13._object = (void *)0xED00004025203A67;
  v12._countAndFlagsBits = 0xD00000000000002FLL;
  v14 = TTRLocalizedString(_:comment:)(v13, v12);
  v15 = swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_contactTriggerLabel], v14._object);
  if (!v15)
    goto LABEL_23;
  v16 = (void *)v15;
  sub_1000197F0((uint64_t)v1, v14._countAndFlagsBits, (uint64_t)v14._object);
  v18 = v17;
  swift_bridgeObjectRelease(v14._object);
  if (v18)
  {
    v19 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v18);
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v16, "setText:", v19);

  sub_1000190D4();
  objc_msgSend(v1, "layoutIfNeeded");
  sub_10001A230(v5, (uint64_t)v39);
  sub_10001A230((uint64_t)v39, (uint64_t)v40);
  if (sub_10001A278(v40) != 1 && !*(_BYTE *)(v5 + 88))
  {
    v21 = *(void **)(v5 + 72);
    v20 = *(_QWORD *)(v5 + 80);
    sub_100015B08(v21, v20, 0);
    v22 = sub_10001816C((uint64_t)v36);
    v24 = v23;
    sub_10001A230(v23, (uint64_t)v37);
    sub_10001A230((uint64_t)v37, (uint64_t)v38);
    if (sub_10001A278(v38) != 1)
    {
      v25 = *(void **)(v24 + 72);
      v26 = *(_QWORD *)(v24 + 80);
      *(_QWORD *)(v24 + 72) = 0;
      *(_QWORD *)(v24 + 80) = 0;
      v27 = *(_BYTE *)(v24 + 88);
      *(_BYTE *)(v24 + 88) = 2;
      sub_10001A290(v25, v26, v27);
    }
    v22((uint64_t)v36, 0);
    v29 = swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_delegate], v28);
    if (v29)
    {
      v30 = v29;
      v31 = REMContactsProvider.name(for:)(v21);
      swift_unknownObjectRelease(v30);
      v32 = swift_allocObject(&unk_100029128, 24, 7);
      v33 = swift_unknownObjectWeakInit(v32 + 16, v1);
      v34 = (void *)zalgo.getter(v33);
      v35 = dispatch thunk of Promise.then<A>(on:closure:)(v34, sub_10001A2C8, v32, (char *)&type metadata for () + 8);
      swift_release(v35);
      sub_10001A290(v21, v20, 0);

      swift_release(v32);
      swift_release(v31);
    }
    else
    {
      sub_10001A290(v21, v20, 0);
    }
  }
}

uint64_t (*sub_10001816C(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess(v1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel, a1, 33, 0);
  return sub_1000181B4;
}

uint64_t sub_1000181B4(uint64_t a1, char a2)
{
  uint64_t v3;

  if ((a2 & 1) != 0)
    return swift_endAccess();
  v3 = swift_endAccess();
  return sub_100017DC8(v3);
}

void *sub_1000181E0()
{
  char *v0;
  uint64_t v1;
  void *result;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char v11[32];
  _OWORD v12[8];
  _QWORD v13[16];
  objc_super v14;

  v14.receiver = v0;
  v14.super_class = (Class)swift_getObjectType(v0);
  objc_msgSendSuper2(&v14, "prepareForReuse");
  result = (void *)swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_stackView], v1);
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(result, "arrangedSubviews");
    v5 = sub_100013968(0, &qword_10002E458, UIView_ptr);
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

    v7 = v3;
    v8 = sub_10001A4D4((uint64_t)&_swiftEmptyArrayStorage, v6, v7);
    swift_bridgeObjectRelease(v8);
    swift_bridgeObjectRelease(v6);

    sub_10001A47C(v12);
    v9 = (uint64_t)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel];
    swift_beginAccess(&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel], v11, 1, 0);
    sub_10001A230(v9, (uint64_t)v13);
    sub_10001A230((uint64_t)v12, v9);
    sub_10001A6FC(v13, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10001A3C4);
    sub_100017DC8();
    v10 = &v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_delegate];
    *((_QWORD *)v10 + 1) = 0;
    return (void *)swift_unknownObjectWeakAssign(v10, 0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_10001845C()
{
  char *v0;
  uint64_t v1;
  _BOOL8 v2;
  double v3;
  id v4;
  void *v5;
  void *v6;
  _BYTE v8[128];
  uint64_t v9[16];
  _BYTE v10[24];
  objc_super v11;
  _BYTE v12[128];
  uint64_t v13[17];

  v11.receiver = v0;
  v11.super_class = (Class)swift_getObjectType(v0);
  objc_msgSendSuper2(&v11, "layoutSubviews");
  v1 = (uint64_t)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel];
  swift_beginAccess(&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel], v10, 0, 0);
  sub_10001A230(v1, (uint64_t)v12);
  sub_10001A230((uint64_t)v12, (uint64_t)v13);
  v2 = sub_10001A278(v13) == 1 || (*(_BYTE *)(v1 + 104) & 1) == 0;
  objc_msgSend(v0, "setSeparatorStyle:", v2);
  sub_10001A230(v1, (uint64_t)v8);
  sub_10001A230((uint64_t)v8, (uint64_t)v9);
  v3 = 16.0;
  if (sub_10001A278(v9) != 1)
  {
    if (*(_BYTE *)(v1 + 18))
      v3 = 52.0;
    else
      v3 = 16.0;
  }
  v4 = sub_1000185DC();
  v6 = v5;

  objc_msgSend(v6, "setConstant:", v3);
  objc_msgSend(v0, "separatorInset");
  return objc_msgSend(v0, "setSeparatorInset:");
}

id sub_1000185DC()
{
  char *v0;
  char *v1;
  char *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v1 = v0;
  v2 = &v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton];
  v3 = *(void **)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton];
  v4 = *(void **)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton
                   + 8];
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)sub_10001954C(v1);
    v8 = v7;
    v9 = *(void **)v2;
    v10 = (void *)*((_QWORD *)v2 + 1);
    *(_QWORD *)v2 = v6;
    *((_QWORD *)v2 + 1) = v7;
    v5 = v6;
    v8;
    sub_10001A36C(v9, v10);
  }
  sub_10001A398(v3, v4);
  return v5;
}

void sub_100018668()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  id v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSString v12;
  id v13;
  id v14;
  id v15;
  _BYTE v16[128];
  uint64_t v17[16];
  _BYTE v18[24];
  _BYTE v19[128];
  uint64_t v20[16];

  v1 = v0;
  v2 = (char *)sub_1000185DC();

  v4 = v1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel;
  swift_beginAccess(v1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel, v18, 0, 0);
  sub_10001A230(v4, (uint64_t)v19);
  sub_10001A230((uint64_t)v19, (uint64_t)v20);
  if (sub_10001A278(v20) == 1 || (*(_BYTE *)(v4 + 16) & 1) == 0)
  {
    if (qword_10002E038 != -1)
      swift_once(&qword_10002E038, sub_100017D88);
    v5 = &qword_10002EB98;
  }
  else
  {
    if (qword_10002E030 != -1)
      swift_once(&qword_10002E030, sub_100017D68);
    v5 = &qword_10002EB90;
  }
  v6 = 0xEA00000000006574;
  v7 = (void *)*v5;
  v8 = *(void **)&v2[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_image];
  *(_QWORD *)&v2[OBJC_IVAR____TtC27RemindersIntentsUIExtension26TTRIVibrantCompletedButton_image] = v7;
  v9 = v7;

  sub_1000150D0();
  v10 = sub_1000185DC();

  sub_10001A230(v4, (uint64_t)v16);
  sub_10001A230((uint64_t)v16, (uint64_t)v17);
  if (sub_10001A278(v17) != 1 && *(_BYTE *)(v4 + 16))
    v6 = 0xE900000000000064;
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  objc_msgSend(v10, "setAccessibilityIdentifier:", v12);

  v13 = sub_1000185DC();
  v15 = objc_msgSend((id)objc_opt_self(UIImageSymbolConfiguration), "configurationWithTextStyle:scale:", UIFontTextStyleBody, 3);
  objc_msgSend(v13, "setPreferredSymbolConfiguration:forImageInState:", v15, 0);

}

void sub_1000188AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char **v5;
  void *Strong;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  Class isa;
  id v25;
  uint64_t v26;
  uint64_t v27;
  objc_class *v28;
  id v29;
  unint64_t v30;
  id v31;
  NSString v32;
  Class v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  Swift::String v43;
  Swift::String v44;
  Swift::String v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  NSString *v50;
  unint64_t v51;
  id v52;
  NSString v53;
  Class v54;
  uint64_t v55;
  id v56;
  NSString *v57;
  unint64_t v58;
  id v59;
  NSString v60;
  Class v61;
  id v62;
  uint64_t v63;
  id v64;
  NSString *v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  id v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  objc_class *v79;
  id v80;
  id v81;
  NSString *v82;
  id v83;
  NSString *v84;
  NSString *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  void *v90;
  _BYTE v91[128];
  uint64_t v92[16];
  _BYTE v93[128];
  uint64_t v94[16];
  char v95[24];
  uint64_t v96;
  uint64_t v97;
  _BYTE v98[128];
  uint64_t v99[17];

  v1 = v0;
  v2 = v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel;
  swift_beginAccess(v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel, v95, 0, 0);
  sub_10001A230(v2, (uint64_t)v98);
  sub_10001A230((uint64_t)v98, (uint64_t)v99);
  if (sub_10001A278(v99) == 1 || (v4 = *(_QWORD *)(v2 + 32)) == 0)
  {
    Strong = (void *)swift_unknownObjectWeakLoadStrong(v1+ OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_timeTriggerLabel, v3);
    if (Strong)
    {
      v7 = Strong;
      objc_msgSend(Strong, "setText:", 0);
      goto LABEL_15;
    }
    __break(1u);
    goto LABEL_35;
  }
  v96 = *(_QWORD *)(v2 + 24);
  v97 = v4;
  sub_10001A230(v2, (uint64_t)v93);
  sub_10001A230((uint64_t)v93, (uint64_t)v94);
  if (sub_10001A278(v94) == 1 || (*(_BYTE *)(v2 + 19) & 1) == 0)
    v5 = &selRef_secondaryLabelColor;
  else
    v5 = &selRef_redColor;
  v8 = (void *)objc_opt_self(UIColor);
  swift_bridgeObjectRetain(v4);
  v9 = objc_msgSend(v8, *v5);
  sub_10001A230(v2, (uint64_t)v91);
  sub_10001A230((uint64_t)v91, (uint64_t)v92);
  if (sub_10001A278(v92) != 1)
  {
    v10 = *(_QWORD *)(v2 + 48);
    if (v10)
    {
      v11 = *(_QWORD *)(v2 + 40);
      String.append(_:)(*(Swift::String *)(&v10 - 1));
      v12._countAndFlagsBits = 8236;
      v12._object = (void *)0xE200000000000000;
      String.append(_:)(v12);
      swift_bridgeObjectRelease(0xE200000000000000);
    }
  }
  v13 = v1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_timeTriggerLabel;
  v14 = swift_unknownObjectWeakLoadStrong(v1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_timeTriggerLabel, v10);
  if (!v14)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v15 = (void *)v14;
  v16 = v97;
  swift_bridgeObjectRetain(v97);
  v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v16);
  objc_msgSend(v15, "setText:", v17);

  v19 = swift_unknownObjectWeakLoadStrong(v13, v18);
  if (!v19)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v7 = (void *)v19;
  swift_bridgeObjectRelease(v16);
  objc_msgSend(v7, "setTextColor:", v9);

LABEL_15:
  sub_10001A230(v2, (uint64_t)v93);
  sub_10001A230((uint64_t)v93, (uint64_t)v94);
  if (sub_10001A278(v94) != 1)
  {
    v20 = *(_QWORD *)(v2 + 120);
    if (v20)
    {
      v21 = *(_QWORD *)(v2 + 112);
      v22 = HIBYTE(v20) & 0xF;
      if ((v20 & 0x2000000000000000) == 0)
        v22 = v21 & 0xFFFFFFFFFFFFLL;
      if (v22)
      {
        v23 = sub_100013968(0, &qword_10002E330, UIFont_ptr);
        swift_bridgeObjectRetain(v20);
        v90 = (void *)static UIFont.roundedCustomFont(textStyle:contentSizeCategory:maximumContentSizeCategory:weight:)(UIFontTextStyleCallout, UIContentSizeCategoryUnspecified, UIContentSizeCategoryUnspecified, 0, 1);
        isa = UIFont.withBoldTrait()().super.isa;
        v80 = (id)objc_opt_self(UIColor);
        v25 = objc_msgSend(v80, "secondaryLabelColor");
        v87 = sub_10000EFCC(&qword_10002E438);
        v26 = swift_allocObject(v87, 112, 7);
        *(_OWORD *)(v26 + 16) = xmmword_100022920;
        *(_QWORD *)(v26 + 32) = NSFontAttributeName;
        *(_QWORD *)(v26 + 40) = isa;
        v88 = v23;
        *(_QWORD *)(v26 + 64) = v23;
        *(_QWORD *)(v26 + 72) = NSForegroundColorAttributeName;
        v27 = sub_100013968(0, &qword_10002E338, UIColor_ptr);
        *(_QWORD *)(v26 + 104) = v27;
        *(_QWORD *)(v26 + 80) = v25;
        v84 = NSFontAttributeName;
        v28 = isa;
        v82 = NSForegroundColorAttributeName;
        v29 = v25;
        v30 = sub_100016468(v26);
        v31 = objc_allocWithZone((Class)NSAttributedString);
        v32 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v20);
        type metadata accessor for Key(0);
        sub_10001A324();
        v33 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v30);
        v89 = objc_msgSend(v31, "initWithString:attributes:", v32, v33);

        v34 = v1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_timeTriggerLabel;
        v36 = (void *)swift_unknownObjectWeakLoadStrong(v34, v35);
        if (v36)
        {
          v37 = v36;
          v38 = objc_msgSend(v36, "text");

          if (v38)
          {
            v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
            v41 = v40;

            v42 = HIBYTE(v41) & 0xF;
            if ((v41 & 0x2000000000000000) == 0)
              v42 = v39 & 0xFFFFFFFFFFFFLL;
            if (v42)
            {
              v43._object = (void *)0x80000001000256F0;
              v44._countAndFlagsBits = 0x4025204025204025;
              v44._object = (void *)0xE800000000000000;
              v43._countAndFlagsBits = 0xD00000000000004FLL;
              v45 = TTRLocalizedString(_:comment:)(v44, v43);
              v46 = (void *)swift_unknownObjectWeakLoadStrong(v34, v45._object);
              if (!v46)
              {
LABEL_39:
                __break(1u);
                return;
              }
              v47 = v46;
              v78 = v29;
              v79 = v28;
              v48 = objc_msgSend(v46, "textColor");

              if (!v48)
                v48 = objc_msgSend(v80, "secondaryLabelColor");
              v49 = swift_allocObject(v87, 112, 7);
              *(_OWORD *)(v49 + 16) = xmmword_100022920;
              *(_QWORD *)(v49 + 32) = v84;
              *(_QWORD *)(v49 + 40) = v90;
              *(_QWORD *)(v49 + 64) = v88;
              *(_QWORD *)(v49 + 72) = v82;
              *(_QWORD *)(v49 + 104) = v27;
              *(_QWORD *)(v49 + 80) = v48;
              v85 = v84;
              v81 = v90;
              v50 = v82;
              v86 = v48;
              v51 = sub_100016468(v49);
              v52 = objc_allocWithZone((Class)NSAttributedString);
              v53 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease(v41);
              v54 = Dictionary._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease(v51);
              v83 = objc_msgSend(v52, "initWithString:attributes:", v53, v54);

              v55 = swift_allocObject(v87, 72, 7);
              *(_OWORD *)(v55 + 16) = xmmword_100022930;
              *(_QWORD *)(v55 + 64) = v27;
              *(_QWORD *)(v55 + 32) = v50;
              *(_QWORD *)(v55 + 40) = v78;
              v56 = v78;
              v57 = v50;
              v58 = sub_100016468(v55);
              v59 = objc_allocWithZone((Class)NSAttributedString);
              v60 = String._bridgeToObjectiveC()();
              v61 = Dictionary._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease(v58);
              v62 = objc_msgSend(v59, "initWithString:attributes:", v60, v61);

              sub_100013968(0, &qword_10002E440, NSAttributedString_ptr);
              v63 = swift_allocObject(v87, 72, 7);
              *(_OWORD *)(v63 + 16) = xmmword_100022930;
              *(_QWORD *)(v63 + 64) = v88;
              *(_QWORD *)(v63 + 32) = v85;
              *(_QWORD *)(v63 + 40) = v81;
              v64 = v81;
              v65 = v85;
              v66 = sub_100016468(v63);
              v67 = sub_10000EFCC(&qword_10002E058);
              v68 = swift_allocObject(v67, 56, 7);
              *(_OWORD *)(v68 + 16) = xmmword_100022DA0;
              *(_QWORD *)(v68 + 32) = v83;
              *(_QWORD *)(v68 + 40) = v62;
              v69 = v89;
              *(_QWORD *)(v68 + 48) = v89;
              v92[0] = v68;
              specialized Array._endMutation()(v68);
              v70 = v92[0];
              v71 = v83;
              v72 = v62;
              v73 = v89;
              v74 = (id)static NSAttributedString.formattedString(format:formatAttributes:attributedStringsToInsert:)(v45._countAndFlagsBits, v45._object, v66, v70);
              swift_bridgeObjectRelease(v66);
              swift_bridgeObjectRelease(v70);
              swift_bridgeObjectRelease(v45._object);

              v29 = v78;
              v28 = v79;
              goto LABEL_31;
            }
            swift_bridgeObjectRelease(v41);
          }
          v69 = v89;
          v74 = v89;
LABEL_31:
          v76 = (void *)swift_unknownObjectWeakLoadStrong(v34, v75);
          if (v76)
          {
            v77 = v76;
            objc_msgSend(v76, "setAttributedText:", v74);

            return;
          }
          goto LABEL_38;
        }
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
    }
  }
}

void sub_1000190D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  char *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _BYTE v14[128];
  uint64_t v15[16];
  _BYTE v16[24];
  _BYTE v17[128];
  uint64_t v18[16];

  v1 = v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel;
  swift_beginAccess(v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel, v16, 0, 0);
  sub_10001A230(v1, (uint64_t)v17);
  sub_10001A230((uint64_t)v17, (uint64_t)v18);
  if (sub_10001A278(v18) != 1 && *(_BYTE *)(v1 + 17) == 1)
  {
    Strong = swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_stackView, v2);
    if (!Strong)
      goto LABEL_11;
    v4 = (void *)Strong;
    v5 = sub_100019960();
    objc_msgSend(v4, "addArrangedSubview:", v5);

  }
  sub_10001A230(v1, (uint64_t)v14);
  sub_10001A230((uint64_t)v14, (uint64_t)v15);
  if (sub_10001A278(v15) != 1)
  {
    v6 = *(void **)(v1 + 96);
    if (v6)
    {
      v7 = v6;
      v8 = sub_100019A0C();
      objc_msgSend(v8, "setImage:forState:", v7, 0);

      v9 = sub_100019A0C();
      objc_msgSend(v7, "size");
      objc_msgSend(v9, "frame");
      objc_msgSend(v9, "setFrame:");

      v11 = swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_stackView, v10);
      if (v11)
      {
        v12 = (void *)v11;
        v13 = sub_100019A0C();
        objc_msgSend(v12, "addArrangedSubview:", v13);

        return;
      }
      __break(1u);
LABEL_11:
      __break(1u);
    }
  }
}

void sub_100019288(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t Strong;
  void *v7;
  uint64_t (*v8)(uint64_t, char);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSString v24;
  _BYTE v25[32];
  _BYTE v26[128];
  uint64_t v27[16];
  _BYTE v28[24];

  v3 = *a1;
  v2 = a1[1];
  v4 = a2 + 16;
  swift_beginAccess(a2 + 16, v28, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v4, v5);
  if (Strong)
  {
    v7 = (void *)Strong;
    v8 = sub_10001816C((uint64_t)v25);
    v10 = v9;
    sub_10001A230(v9, (uint64_t)v26);
    sub_10001A230((uint64_t)v26, (uint64_t)v27);
    if (sub_10001A278(v27) != 1)
    {
      v11 = *(void **)(v10 + 72);
      v12 = *(_QWORD *)(v10 + 80);
      *(_QWORD *)(v10 + 72) = v3;
      *(_QWORD *)(v10 + 80) = v2;
      v13 = *(_BYTE *)(v10 + 88);
      *(_BYTE *)(v10 + 88) = 1;
      swift_bridgeObjectRetain(v2);
      sub_10001A290(v11, v12, v13);
    }
    v8((uint64_t)v25, 0);

  }
  swift_beginAccess(v4, v27, 0, 0);
  v15 = swift_unknownObjectWeakLoadStrong(v4, v14);
  if (v15)
  {
    v16 = (char *)v15;
    v17._object = (void *)0x80000001000256C0;
    v18._countAndFlagsBits = 0x6E6967617373654DLL;
    v18._object = (void *)0xED00004025203A67;
    v17._countAndFlagsBits = 0xD00000000000002FLL;
    v19 = TTRLocalizedString(_:comment:)(v18, v17);
    v20 = swift_unknownObjectWeakLoadStrong(&v16[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_contactTriggerLabel], v19._object);
    if (v20)
    {
      v21 = (void *)v20;
      sub_1000197F0((uint64_t)v16, v19._countAndFlagsBits, (uint64_t)v19._object);
      v23 = v22;
      swift_bridgeObjectRelease(v19._object);
      if (v23)
      {
        v24 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v23);
      }
      else
      {
        v24 = 0;
      }
      objc_msgSend(v21, "setText:", v24);

    }
    else
    {
      __break(1u);
    }
  }
}

_QWORD *sub_100019458()
{
  char *v0;
  uint64_t v1;
  _QWORD *result;
  uint64_t v3;
  _QWORD *v4;
  _BYTE v5[128];
  _BYTE v6[24];
  _OWORD v7[8];
  _QWORD v8[16];
  _OWORD v9[8];

  v1 = (uint64_t)&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel];
  swift_beginAccess(&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel], v6, 0, 0);
  sub_10001A230(v1, (uint64_t)v8);
  sub_10001A230((uint64_t)v8, (uint64_t)v9);
  result = (_QWORD *)sub_10001A278((uint64_t *)v9);
  if ((_DWORD)result != 1)
  {
    v7[4] = v9[4];
    v7[5] = v9[5];
    v7[6] = v9[6];
    v7[7] = v9[7];
    v7[0] = v9[0];
    v7[1] = v9[1];
    v7[2] = v9[2];
    v7[3] = v9[3];
    result = (_QWORD *)swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_delegate], v3);
    if (result)
    {
      v4 = result;
      sub_10001A230((uint64_t)v8, (uint64_t)v5);
      sub_10001A7F4((uint64_t)v5);
      sub_10001E948(v0, (uint64_t)v7);
      swift_unknownObjectRelease(v4);
      return sub_10001A6FC(v8, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10001A3C4);
    }
  }
  return result;
}

uint64_t sub_10001954C(char *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t result;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  Class isa;

  v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TTRIVibrantCompletedButton()), "init");
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = objc_msgSend(v2, "leadingAnchor");
  v4 = objc_msgSend(a1, "leadingAnchor");
  v5 = objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 16.0);

  v6 = objc_msgSend(a1, "contentView");
  objc_msgSend(v6, "addSubview:", v2);

  v7 = sub_10000EFCC(&qword_10002E058);
  v8 = swift_allocObject(v7, 56, 7);
  *(_OWORD *)(v8 + 16) = xmmword_100022DA0;
  *(_QWORD *)(v8 + 32) = v5;
  v5;
  v9 = objc_msgSend(v2, "centerYAnchor");
  v10 = objc_msgSend(a1, "centerYAnchor");
  v11 = objc_msgSend(v9, "constraintEqualToAnchor:", v10);

  *(_QWORD *)(v8 + 40) = v11;
  result = swift_unknownObjectWeakLoadStrong(&a1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_titleLabel], v12);
  if (result)
  {
    v14 = (void *)result;
    v15 = (void *)objc_opt_self(NSLayoutConstraint);
    v16 = objc_msgSend(v14, "leadingAnchor");

    v17 = objc_msgSend(v2, "trailingAnchor");
    v18 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 12.0);

    *(_QWORD *)(v8 + 48) = v18;
    specialized Array._endMutation()(v19);
    sub_100013968(0, &qword_10002E448, NSLayoutConstraint_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
    objc_msgSend(v15, "activateConstraints:", isa);

    objc_msgSend(v2, "addTarget:action:forControlEvents:", a1, "didTapCompleteButton:", 0x2000);
    return (uint64_t)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1000197F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t result;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[24];
  _BYTE v19[128];
  uint64_t v20[16];

  v5 = a1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel;
  swift_beginAccess(a1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel, v18, 0, 0);
  sub_10001A230(v5, (uint64_t)v19);
  sub_10001A230((uint64_t)v19, (uint64_t)v20);
  v6 = sub_10001A278(v20);
  result = 0;
  if (v6 != 1)
  {
    if (*(unsigned __int8 *)(v5 + 88) <= 1u)
    {
      if (*(_BYTE *)(v5 + 88))
      {
        v10 = v5 + 72;
        v8 = *(void **)(v5 + 72);
        v9 = *(_QWORD *)(v10 + 8);
        v11 = sub_10000EFCC(&qword_10002E428);
        v12 = swift_allocObject(v11, 72, 7);
        *(_OWORD *)(v12 + 16) = xmmword_100022930;
        *(_QWORD *)(v12 + 56) = &type metadata for String;
        *(_QWORD *)(v12 + 64) = sub_10001A2E0();
        *(_QWORD *)(v12 + 32) = v8;
        *(_QWORD *)(v12 + 40) = v9;
        sub_100015B08(v8, v9, 1);
        v13 = a2;
        v14 = a3;
        v15 = v12;
        return String.init(format:_:)(v13, v14, v15);
      }
LABEL_6:
      v16 = sub_10000EFCC(&qword_10002E428);
      v17 = swift_allocObject(v16, 72, 7);
      *(_OWORD *)(v17 + 16) = xmmword_100022930;
      *(_QWORD *)(v17 + 56) = &type metadata for String;
      *(_QWORD *)(v17 + 64) = sub_10001A2E0();
      *(_QWORD *)(v17 + 32) = 3026478;
      *(_QWORD *)(v17 + 40) = 0xE300000000000000;
      v13 = a2;
      v14 = a3;
      v15 = v17;
      return String.init(format:_:)(v13, v14, v15);
    }
    if (*(_BYTE *)(v5 + 88) == 2)
      goto LABEL_6;
    return 0;
  }
  return result;
}

char *sub_100019960()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  id v6;
  char *v7;
  void *v8;
  id v9;

  v1 = OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___flaggedView;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___flaggedView);
  if (v2)
  {
    v3 = *(char **)(v0
                  + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___flaggedView);
  }
  else
  {
    v4 = v0;
    if (qword_10002E040 != -1)
      swift_once(&qword_10002E040, sub_100017DA8);
    v5 = (void *)qword_10002EBA0;
    objc_allocWithZone((Class)type metadata accessor for TTRIVibrantTemplateImageView());
    v6 = v5;
    v7 = sub_100014BCC(v5);
    v8 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v7;
    v3 = v7;

    v2 = 0;
  }
  v9 = v2;
  return v3;
}

id sub_100019A0C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___appLinkIconView;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___appLinkIconView);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___appLinkIconView);
  }
  else
  {
    v4 = type metadata accessor for TTRIExpandedHitTestButton(0);
    v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v4)), "init");
    objc_msgSend(v5, "addTarget:action:forControlEvents:", v0, "didTapAppLinkButton:", 0x2000);
    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

_QWORD *sub_100019AA0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *result;
  uint64_t v3;
  _QWORD *v4;
  _BYTE v5[24];
  _OWORD v6[8];
  _QWORD v7[16];
  _OWORD v8[8];

  v1 = v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel;
  swift_beginAccess(v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel, v5, 0, 0);
  sub_10001A230(v1, (uint64_t)v7);
  sub_10001A230((uint64_t)v7, (uint64_t)v8);
  result = (_QWORD *)sub_10001A278((uint64_t *)v8);
  if ((_DWORD)result != 1)
  {
    v6[4] = v8[4];
    v6[5] = v8[5];
    v6[6] = v8[6];
    v6[7] = v8[7];
    v6[0] = v8[0];
    v6[1] = v8[1];
    v6[2] = v8[2];
    v6[3] = v8[3];
    result = (_QWORD *)swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_delegate, v3);
    if (result)
    {
      v4 = result;
      sub_10001A6FC(v7, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10001A758);
      sub_1000200DC((void **)v6);
      swift_unknownObjectRelease(v4);
      return sub_10001A6FC(v7, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10001A3C4);
    }
  }
  return result;
}

uint64_t sub_100019B8C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(_OWORD *))
{
  id v7;
  uint64_t v8;
  id v9;
  _OWORD v11[2];

  if (a3)
  {
    v7 = a1;
    v8 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v11, v8);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v9 = a1;
  }
  a4(v11);

  return sub_10001A494((uint64_t)v11);
}

id sub_100019C04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  objc_class *ObjectType;
  uint64_t v7;
  char *v8;
  char *v9;
  NSString v10;
  id v11;
  objc_super v13;
  _OWORD v14[8];

  ObjectType = (objc_class *)swift_getObjectType(v3);
  v7 = (uint64_t)&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel];
  sub_10001A47C(v14);
  sub_10001A230((uint64_t)v14, v7);
  v8 = &v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_delegate];
  *((_QWORD *)v8 + 1) = 0;
  swift_unknownObjectWeakInit(v8, 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_titleLabel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_timeTriggerLabel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_locationTriggerLabel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_contactTriggerLabel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_stackView], 0);
  v9 = &v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___flaggedView] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___appLinkIconView] = 0;
  if (a3)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a3);
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = v3;
  v13.super_class = ObjectType;
  v11 = objc_msgSendSuper2(&v13, "initWithStyle:reuseIdentifier:", a1, v10);

  return v11;
}

id sub_100019DA4(void *a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v4;
  char *v5;
  char *v6;
  id v7;
  objc_super v9;
  _OWORD v10[8];

  ObjectType = (objc_class *)swift_getObjectType(v1);
  v4 = (uint64_t)&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel];
  sub_10001A47C(v10);
  sub_10001A230((uint64_t)v10, v4);
  v5 = &v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_delegate];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_titleLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_timeTriggerLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_locationTriggerLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_contactTriggerLabel], 0);
  swift_unknownObjectWeakInit(&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_stackView], 0);
  v6 = &v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___flaggedView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___appLinkIconView] = 0;
  v9.receiver = v1;
  v9.super_class = ObjectType;
  v7 = objc_msgSendSuper2(&v9, "initWithCoder:", a1);

  return v7;
}

void sub_100019EE8()
{
  uint64_t v0;
  _QWORD v1[16];

  sub_10001A230(v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel, (uint64_t)v1);
  sub_10001A6FC(v1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10001A3C4);
  sub_10001A458(v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_delegate);
  swift_unknownObjectWeakDestroy(v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_titleLabel);
  swift_unknownObjectWeakDestroy(v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_timeTriggerLabel);
  swift_unknownObjectWeakDestroy(v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_locationTriggerLabel);
  swift_unknownObjectWeakDestroy(v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_contactTriggerLabel);
  swift_unknownObjectWeakDestroy(v0 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_stackView);
  sub_10001A36C(*(void **)(v0+ OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton), *(void **)(v0+ OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton+ 8));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___flaggedView));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___appLinkIconView));
}

uint64_t type metadata accessor for TTRIIntentsSnippetReminderViewCell()
{
  return objc_opt_self(_TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell);
}

_QWORD *initializeBufferWithCopyOfBuffer for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  v6 = v4;
  return a1;
}

void destroy for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder(id *a1)
{

}

uint64_t assignWithCopy for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  return a1;
}

uint64_t assignWithTake for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder()
{
  return &type metadata for TTRIIntentsSnippetReminderViewCell.CompletedButtonHolder;
}

uint64_t sub_10001A230(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000EFCC(&qword_10002E420);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001A278(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

void sub_10001A290(void *a1, uint64_t a2, char a3)
{
  if (a3 != -1)
    sub_100015B8C(a1, a2, a3);
}

uint64_t sub_10001A2A4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10001A2C8(uint64_t *a1)
{
  uint64_t v1;

  sub_100019288(a1, v1);
}

unint64_t sub_10001A2E0()
{
  unint64_t result;

  result = qword_10002E430;
  if (!qword_10002E430)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10002E430);
  }
  return result;
}

unint64_t sub_10001A324()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002E218;
  if (!qword_10002E218)
  {
    type metadata accessor for Key(255);
    result = swift_getWitnessTable(&unk_100022AF0, v1);
    atomic_store(result, (unint64_t *)&qword_10002E218);
  }
  return result;
}

void sub_10001A36C(void *a1, void *a2)
{
  if (a1)
  {

  }
}

id sub_10001A398(id result, void *a2)
{
  id v2;

  if (result)
  {
    v2 = result;
    return a2;
  }
  return result;
}

void *sub_10001A3C4(void *result, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, char a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (result)
  {

    swift_bridgeObjectRelease(a5);
    swift_bridgeObjectRelease(a7);
    swift_bridgeObjectRelease(a9);
    sub_10001A290(a10, a11, a12);

    return (void *)swift_bridgeObjectRelease(a16);
  }
  return result;
}

uint64_t sub_10001A458(uint64_t a1)
{
  swift_unknownObjectWeakDestroy(a1);
  return a1;
}

double sub_10001A47C(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_10001A494(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000EFCC(&qword_10002E450);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001A4D4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  Class isa;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if ((unint64_t)a2 >> 62)
    goto LABEL_15;
  v5 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  swift_bridgeObjectRetain(a2);
  for (; v5; v5 = _CocoaArrayWrapper.endIndex.getter(v20))
  {
    v6 = (void *)objc_opt_self(NSLayoutConstraint);
    v7 = 4;
    while (1)
    {
      v8 = (a2 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7 - 4, a2)
         : *(id *)(a2 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      objc_msgSend(a3, "removeArrangedSubview:", v8);
      isa = (Class)objc_msgSend(v9, "constraints");
      if (!isa)
      {
        v12 = sub_100013968(0, &qword_10002E448, NSLayoutConstraint_ptr);
        v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(0, v12);
        isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v13);
      }
      objc_msgSend(v6, "deactivateConstraints:", isa);

      objc_msgSend(v9, "removeFromSuperview");
      v14 = v9;
      v15 = swift_bridgeObjectRetain(a1);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v15);
      v17 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v16 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v17 >= v16 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v16 > 1, v17 + 1, 1);
      v18 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, v14);
      specialized Array._endMutation()(v18);
      v19 = a1;
      swift_bridgeObjectRelease(a1);

      ++v7;
      if (v10 == v5)
        goto LABEL_20;
    }
    __break(1u);
LABEL_15:
    if (a2 < 0)
      v20 = a2;
    else
      v20 = a2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    swift_bridgeObjectRetain(a2);
  }
  v19 = a1;
LABEL_20:
  swift_bridgeObjectRelease(a2);
  return v19;
}

_QWORD *sub_10001A6FC(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15]);
  return a1;
}

id sub_10001A758(id result, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, char a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  void *v19;
  id v20;
  id v21;

  if (result)
  {
    v19 = result;
    swift_bridgeObjectRetain(a9);
    v20 = v19;
    v21 = a2;
    swift_bridgeObjectRetain(a5);
    swift_bridgeObjectRetain(a7);
    sub_10001790C(a10, a11, a12);
    swift_bridgeObjectRetain(a16);
    return a13;
  }
  return result;
}

uint64_t sub_10001A7F4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v11;
  id v12;
  id v13;

  v2 = *(void **)a1;
  v3 = *(void **)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(void **)(a1 + 96);
  v9 = *(_QWORD *)(a1 + 120);
  v10 = *(_BYTE *)(a1 + 88);
  swift_bridgeObjectRetain(*(_QWORD *)(a1 + 64));
  v11 = v2;
  v12 = v3;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  sub_10001790C(v6, v7, v10);
  swift_bridgeObjectRetain(v9);
  v13 = v8;
  return a1;
}

void *sub_10001A890(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  char v8;
  id v9;
  uint64_t v11;
  void *v12;

  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v7 = sub_100008248((uint64_t)a1);
      if ((v8 & 1) != 0)
      {
        v6 = *(void **)(*(_QWORD *)(a2 + 56) + 8 * v7);
        v9 = v6;
        return v6;
      }
    }
    return 0;
  }
  v3 = a1;
  v4 = __CocoaDictionary.lookup(_:)();

  if (!v4)
    return 0;
  v11 = v4;
  v5 = sub_100013968(0, &qword_10002E6E0, REMReminder_ptr);
  swift_unknownObjectRetain(v4);
  swift_dynamicCast(&v12, &v11, (char *)&type metadata for Swift.AnyObject + 8, v5, 7);
  v6 = v12;
  swift_unknownObjectRelease(v4);
  return v6;
}

uint64_t sub_10001A964()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100015A44(v0, qword_10002E460);
  v1 = sub_100015A84(v0, (uint64_t)qword_10002E460);
  if (qword_10002E028 != -1)
    swift_once(&qword_10002E028, sub_1000159C0);
  v2 = sub_100015A84(v0, (uint64_t)qword_10002EB78);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

id sub_10001A9F4()
{
  return objc_msgSend(objc_allocWithZone((Class)CNContactStore), "init");
}

void sub_10001AA18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *Strong;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel) = a1;
  swift_bridgeObjectRelease(v2);
  v3 = v1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_tableView;
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_tableView, v4);
  objc_msgSend(Strong, "reloadData");

  v7 = (void *)swift_unknownObjectWeakLoadStrong(v3, v6);
  if (v7)
  {
    v9 = v7;
    objc_msgSend(v7, "invalidateIntrinsicContentSize");

  }
  v10 = (void *)swift_unknownObjectWeakLoadStrong(v3, v8);
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "layoutIfNeeded");

  }
}

uint64_t sub_10001AAC8@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X8>)
{
  uint64_t v4;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t result;
  uint64_t v25;
  _QWORD v26[2];
  _QWORD *v27;
  _QWORD *v28;

  v9 = type metadata accessor for TTRIIntentsSnippetViewController.ViewModel(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (_QWORD *)((char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v28 = _swiftEmptyArrayStorage;
  v13 = *(_QWORD *)(a1 + 8);
  if (!v13)
    goto LABEL_4;
  v26[0] = a3;
  v26[1] = v4;
  v27 = (_QWORD *)a4;
  v14 = *(_QWORD *)a1;
  v15 = sub_10000EFCC(&qword_10002E5F8);
  v16 = (uint64_t)v12 + *(int *)(v15 + 48);
  v17 = *(int *)(v15 + 64);
  *v12 = v14;
  v12[1] = v13;
  v18 = type metadata accessor for TTRIIntentsSnippetSection(0);
  sub_100021634(a1 + *(int *)(v18 + 20), v16);
  *((_BYTE *)v12 + v17) = *a2;
  swift_storeEnumTagMultiPayload(v12, v9, 0);
  swift_bridgeObjectRetain(v13);
  v9 = sub_10001F1A0(0, 1, 1, (unint64_t)_swiftEmptyArrayStorage, &qword_10002E108, type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
  a4 = *(_QWORD *)(v9 + 16);
  v19 = *(_QWORD *)(v9 + 24);
  v13 = a4 + 1;
  if (a4 >= v19 >> 1)
    goto LABEL_13;
  while (1)
  {
    *(_QWORD *)(v9 + 16) = v13;
    sub_1000216A4((uint64_t)v12, v9+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(_QWORD *)(v10 + 72) * a4, type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
    v28 = (_QWORD *)v9;
    a4 = (unint64_t)v27;
    a3 = v26[0];
LABEL_4:
    *a2 = 0;
    v20 = type metadata accessor for TTRIIntentsSnippetSection(0);
    a1 = *(_QWORD *)(a1 + *(int *)(v20 + 24));
    if ((unint64_t)a1 >> 62)
      break;
    a2 = *(_BYTE **)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v19 = (unint64_t)(a2 - 1);
    if (!__OFSUB__(a2, 1))
      goto LABEL_6;
LABEL_12:
    __break(1u);
LABEL_13:
    v9 = sub_10001F1A0(v19 > 1, v13, 1, v9, &qword_10002E108, type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
  }
  if (a1 < 0)
    v25 = a1;
  else
    v25 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a1);
  a2 = (_BYTE *)_CocoaArrayWrapper.endIndex.getter(v25);
  v20 = swift_bridgeObjectRelease(a1);
  v19 = (unint64_t)(a2 - 1);
  if (__OFSUB__(a2, 1))
    goto LABEL_12;
LABEL_6:
  __chkstk_darwin(v20);
  v26[-2] = a3;
  v26[-1] = v21;
  v22 = swift_bridgeObjectRetain(a1);
  v23 = sub_1000203E4(v22, (void (*)(unint64_t, id))sub_10002169C, (uint64_t)&v26[-4]);
  swift_bridgeObjectRelease(a1);
  result = sub_10001AF10((uint64_t)v23);
  *(_QWORD *)a4 = v28;
  return result;
}

uint64_t sub_10001AD3C(uint64_t a1)
{
  return sub_10001AD54(a1, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_10000EA1C);
}

uint64_t sub_10001AD48(uint64_t a1)
{
  return sub_10001AD54(a1, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_10000EC30);
}

uint64_t sub_10001AD54(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, uint64_t))
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v18 = a1;
    else
      v18 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v5 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = *v2;
  if (!((unint64_t)*v2 >> 62))
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_5;
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v6 < 0)
    v19 = *v2;
  else
    v19 = v6 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v2);
  v7 = _CocoaArrayWrapper.endIndex.getter(v19);
  swift_bridgeObjectRelease(v6);
  v8 = v7 + v5;
  if (__OFADD__(v7, v5))
    goto LABEL_29;
LABEL_5:
  v6 = *v2;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v2);
  *v2 = v6;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v7 = 1;
  }
  if ((unint64_t)v6 >> 62)
    goto LABEL_31;
  v11 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8)
      v11 = v8;
    swift_bridgeObjectRetain(v6);
    v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v7, v11, 1, v6);
    swift_bridgeObjectRelease(*v2);
    *v2 = v6;
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = a2(v10 + 8 * *(_QWORD *)(v10 + 16) + 32, (*(_QWORD *)(v10 + 24) >> 1) - *(_QWORD *)(v10 + 16), a1);
    if (v13 >= v5)
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    if (v6 < 0)
      v20 = v6;
    else
      v20 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v6);
    v11 = _CocoaArrayWrapper.endIndex.getter(v20);
    swift_bridgeObjectRelease(v6);
  }
  if (v13 < 1)
    goto LABEL_19;
  v14 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v15 = __OFADD__(v14, v13);
  v16 = v14 + v13;
  if (!v15)
  {
    *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
LABEL_19:
    v17 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v17);
  }
  __break(1u);
  return result;
}

uint64_t sub_10001AF10(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  uint64_t result;
  char v26;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v24 = v4 + v2;
  else
    v24 = v4;
  v3 = sub_10001F1A0(isUniquelyReferenced_nonNull_native, v24, 1, v3, &qword_10002E108, type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *(_QWORD *)(v3 + 16);
  v10 = (*(_QWORD *)(v3 + 24) >> 1) - v9;
  v11 = type metadata accessor for TTRIIntentsSnippetViewController.ViewModel(0);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v3 + v13 + v14 * v9;
  v16 = a1 + v13;
  v17 = v14 * v8;
  v18 = v15 + v17;
  v19 = v16 + v17;
  if (v16 < v18 && v15 < v19)
    goto LABEL_24;
  swift_arrayInitWithCopy(v15);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v21 = *(_QWORD *)(v3 + 16);
  v22 = __OFADD__(v21, v8);
  v23 = v21 + v8;
  if (!v22)
  {
    *(_QWORD *)(v3 + 16) = v23;
LABEL_19:
    result = swift_bridgeObjectRelease(a1);
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  v26 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, v26, 1092, 0);
  __break(1u);
  return result;
}

id sub_10001B094@<X0>(id a1@<X1>, uint64_t a2@<X0>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  id v10;
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  id v24;
  _BYTE v25[24];
  _OWORD v26[8];

  v10 = objc_msgSend(a1, "parentReminder");
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(v11, "objectID");
    v13 = (uint64_t *)(a3
                    + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_cachedReminders);
    swift_beginAccess(v13, v25, 0, 0);
    v14 = *v13;
    v15 = v12;
    swift_bridgeObjectRetain(v14);
    v16 = sub_10001A890(v15, v14);

    swift_bridgeObjectRelease(v14);
    v17 = v16 != 0;

  }
  else
  {
    v17 = 0;
  }
  v24 = a1;
  sub_100017220(v24, a2 == a4, v17, (uint64_t)v26);
  v18 = v26[5];
  *(_OWORD *)(a5 + 72) = v26[4];
  *(_OWORD *)(a5 + 88) = v18;
  v19 = v26[7];
  *(_OWORD *)(a5 + 104) = v26[6];
  *(_OWORD *)(a5 + 120) = v19;
  v20 = v26[1];
  *(_OWORD *)(a5 + 8) = v26[0];
  *(_OWORD *)(a5 + 24) = v20;
  v21 = v26[3];
  *(_OWORD *)(a5 + 40) = v26[2];
  *(_QWORD *)a5 = v24;
  *(_OWORD *)(a5 + 56) = v21;
  v22 = type metadata accessor for TTRIIntentsSnippetViewController.ViewModel(0);
  swift_storeEnumTagMultiPayload(a5, v22, 1);
  return v24;
}

uint64_t sub_10001B2FC(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t result;
  void *v10;
  NSString v11;
  Class isa;
  id v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  _QWORD *v25;
  id v26;
  uint64_t v27;
  _BYTE v28[24];
  _OWORD v29[8];
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v3 = v2;
  v5 = a2[5];
  v36 = a2[4];
  v37 = v5;
  v6 = a2[7];
  v38 = a2[6];
  v39 = v6;
  v7 = a2[1];
  v32 = *a2;
  v33 = v7;
  v8 = a2[3];
  v34 = a2[2];
  v35 = v8;
  result = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_tableView, a2);
  if (result)
  {
    v10 = (void *)result;
    v11 = String._bridgeToObjectiveC()();
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v13 = objc_msgSend(v10, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, isa);

    v14 = type metadata accessor for TTRIIntentsSnippetReminderViewCell();
    v15 = swift_dynamicCastClass(v13, v14);
    if (v15)
    {
      v16 = (char *)v15;
      v17 = v15 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_delegate;
      *(_QWORD *)(v17 + 8) = &off_100029140;
      swift_unknownObjectWeakAssign(v17, v3);
      v29[4] = v36;
      v29[5] = v37;
      v29[6] = v38;
      v29[7] = v39;
      v29[0] = v32;
      v29[1] = v33;
      v29[2] = v34;
      v29[3] = v35;
      nullsub_2(v29);
      v18 = (uint64_t)&v16[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel];
      swift_beginAccess(&v16[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel], v28, 1, 0);
      sub_10001A230(v18, (uint64_t)&v30);
      sub_10001A230((uint64_t)v29, v18);
      sub_10001A7F4((uint64_t)a2);
      sub_10001A7F4((uint64_t)a2);
      v19 = v13;
      sub_100021764((uint64_t)&v30);
      sub_100017DC8();
      sub_1000217BC((uint64_t)a2);

    }
    else
    {
      if (qword_10002E048 != -1)
        swift_once(&qword_10002E048, sub_10001A964);
      v20 = type metadata accessor for Logger(0);
      sub_100015A84(v20, (uint64_t)qword_10002E460);
      v21 = v13;
      v22 = Logger.logObject.getter(v21);
      v23 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc(12, -1);
        v25 = (_QWORD *)swift_slowAlloc(8, -1);
        *(_DWORD *)v24 = 138412290;
        v30 = v21;
        v26 = v21;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v24 + 4, v24 + 12);
        *v25 = v21;

        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Expected to dequeue reminder cell, but got %@", v24, 0xCu);
        v27 = sub_10000EFCC(&qword_10002E6E8);
        swift_arrayDestroy(v25, 1, v27);
        swift_slowDealloc(v25, -1, -1);
        swift_slowDealloc(v24, -1, -1);

      }
      else
      {

      }
      v16 = (char *)objc_msgSend(objc_allocWithZone((Class)UITableViewCell), "init");

    }
    return (uint64_t)v16;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001B630(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t result;
  void *v9;
  NSString v10;
  Class isa;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  _QWORD *v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;

  result = swift_unknownObjectWeakLoadStrong(v4 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_tableView, a2);
  if (result)
  {
    v9 = (void *)result;
    v10 = String._bridgeToObjectiveC()();
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v12 = objc_msgSend(v9, "dequeueReusableCellWithIdentifier:forIndexPath:", v10, isa);

    v13 = type metadata accessor for TTRIIntentsSnippetHeaderCell();
    v14 = swift_dynamicCastClass(v12, v13);
    if (v14)
    {
      v15 = (_BYTE *)v14;
      v16 = (_QWORD *)(v14 + OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_viewModel);
      v17 = *(_QWORD *)(v14 + OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_viewModel + 8);
      *v16 = a2;
      v16[1] = a3;
      v18 = v12;
      swift_bridgeObjectRetain(a3);
      swift_bridgeObjectRelease(v17);
      sub_100017920();
      v15[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_isFirst] = a4 & 1;
      sub_100017920();

    }
    else
    {
      if (qword_10002E048 != -1)
        swift_once(&qword_10002E048, sub_10001A964);
      v19 = type metadata accessor for Logger(0);
      sub_100015A84(v19, (uint64_t)qword_10002E460);
      v20 = v12;
      v21 = Logger.logObject.getter(v20);
      v22 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc(12, -1);
        v24 = (_QWORD *)swift_slowAlloc(8, -1);
        *(_DWORD *)v23 = 138412290;
        v27 = v20;
        v25 = v20;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v23 + 4, v23 + 12);
        *v24 = v20;

        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Expected to dequeue header cell, but got %@", v23, 0xCu);
        v26 = sub_10000EFCC(&qword_10002E6E8);
        swift_arrayDestroy(v24, 1, v26);
        swift_slowDealloc(v24, -1, -1);
        swift_slowDealloc(v23, -1, -1);

      }
      else
      {

      }
      v15 = objc_msgSend(objc_allocWithZone((Class)UITableViewCell), "init");

    }
    return (uint64_t)v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10001B8D8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  void *Strong;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = v0;
  v29.super_class = (Class)type metadata accessor for TTRIIntentsSnippetViewController();
  objc_msgSendSuper2(&v29, "viewDidLoad");
  v1 = &v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_tableView];
  Strong = (void *)swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_tableView], v2);
  if (!Strong)
  {
    __break(1u);
    goto LABEL_12;
  }
  v4 = Strong;
  objc_msgSend(Strong, "setEstimatedRowHeight:", UITableViewAutomaticDimension);

  v6 = swift_unknownObjectWeakLoadStrong(v1, v5);
  if (!v6)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v7 = (void *)v6;
  v8 = objc_msgSend((id)objc_opt_self(UIBlurEffect), "effectWithStyle:", 4);
  v9 = objc_msgSend((id)objc_opt_self(UIVibrancyEffect), "effectForBlurEffect:style:", v8, 5);

  objc_msgSend(v7, "setSeparatorEffect:", v9);
  v11 = swift_unknownObjectWeakLoadStrong(v1, v10);
  if (!v11)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v12 = (void *)v11;
  v13 = objc_msgSend(objc_allocWithZone((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v12, "setTableFooterView:", v13);

  v15 = swift_unknownObjectWeakLoadStrong(v1, v14);
  if (!v15)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = (void *)v15;
  v17 = objc_msgSend(objc_allocWithZone((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v16, "setTableHeaderView:", v17);

  v19 = (void *)swift_unknownObjectWeakLoadStrong(v1, v18);
  objc_msgSend(v19, "reloadData");

  v21 = (void *)swift_unknownObjectWeakLoadStrong(v1, v20);
  if (v21)
  {
    v23 = v21;
    objc_msgSend(v21, "invalidateIntrinsicContentSize");

  }
  v24 = (void *)swift_unknownObjectWeakLoadStrong(v1, v22);
  if (v24)
  {
    v26 = v24;
    objc_msgSend(v24, "layoutIfNeeded");

  }
  v27 = (void *)swift_unknownObjectWeakLoadStrong(v1, v25);
  if (v27)
  {
    v28 = v27;
    objc_msgSend(v27, "setInsetsLayoutMarginsFromSafeArea:", 1);

    return;
  }
LABEL_15:
  __break(1u);
}

uint64_t sub_10001BBF8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31[3];

  v2 = sub_100016594((uint64_t)&_swiftEmptyArrayStorage);
  if ((unint64_t)a1 >> 62)
  {
LABEL_28:
    if (a1 < 0)
      v25 = a1;
    else
      v25 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v25);
    if (v3)
      goto LABEL_3;
LABEL_32:
    swift_bridgeObjectRelease(a1);
    v26 = (uint64_t *)(v30
                    + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_cachedReminders);
    swift_beginAccess(v30 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_cachedReminders, v31, 1, 0);
    v27 = *v26;
    *v26 = v2;
    return swift_bridgeObjectRelease(v27);
  }
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  if (!v3)
    goto LABEL_32;
LABEL_3:
  v4 = 4;
  while (1)
  {
    if ((a1 & 0xC000000000000001) != 0)
      v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, a1);
    else
      v7 = *(id *)(a1 + 8 * v4);
    v8 = v7;
    v9 = v4 - 3;
    if (__OFADD__(v4 - 4, 1))
    {
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v10 = objc_msgSend(v7, "remObjectID");
    if ((v2 & 0xC000000000000001) != 0)
    {
      if (v2 >= 0)
        v2 &= 0xFFFFFFFFFFFFFF8uLL;
      v11 = __CocoaDictionary.count.getter(v2);
      if (__OFADD__(v11, 1))
        goto LABEL_26;
      v2 = sub_10001FB38(v2, v11 + 1);
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v2);
    v31[0] = v2;
    v14 = sub_100008248((uint64_t)v10);
    v15 = *(_QWORD *)(v2 + 16);
    v16 = (v13 & 1) == 0;
    v17 = v15 + v16;
    if (__OFADD__(v15, v16))
      goto LABEL_25;
    v18 = v13;
    if (*(_QWORD *)(v2 + 24) < v17)
      break;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      sub_10001FF38();
LABEL_21:
    v2 = v31[0];
    if ((v18 & 1) != 0)
    {
      v5 = *(_QWORD *)(v31[0] + 56);
      v6 = *(void **)(v5 + 8 * v14);
      *(_QWORD *)(v5 + 8 * v14) = v8;

    }
    else
    {
      *(_QWORD *)(v31[0] + 8 * (v14 >> 6) + 64) |= 1 << v14;
      *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14) = v10;
      *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v14) = v8;
      v21 = *(_QWORD *)(v2 + 16);
      v22 = __OFADD__(v21, 1);
      v23 = v21 + 1;
      if (v22)
        goto LABEL_27;
      *(_QWORD *)(v2 + 16) = v23;
      v24 = v10;
    }

    swift_bridgeObjectRelease(0x8000000000000000);
    ++v4;
    if (v9 == v3)
      goto LABEL_32;
  }
  sub_100008DB0(v17, isUniquelyReferenced_nonNull_native);
  v19 = sub_100008248((uint64_t)v10);
  if ((v18 & 1) == (v20 & 1))
  {
    v14 = v19;
    goto LABEL_21;
  }
  v29 = sub_100013968(0, (unint64_t *)&unk_10002E6F0, REMObjectID_ptr);
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v29);
  __break(1u);
  return result;
}

void sub_10001BE7C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  _QWORD *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  _QWORD *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _QWORD v36[3];
  uint64_t v37;
  uint64_t v38;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    v35 = 0;
    v33 = 0u;
    v34 = 0u;
    sub_100013834((uint64_t)&v33, &qword_10002E700);
    goto LABEL_19;
  }
  v6 = objc_msgSend(a1, "intentResponse");
  if (!v6
    || (v32 = v6,
        v7 = sub_100013968(0, &qword_10002E718, INIntentResponse_ptr),
        v8 = sub_10000EFCC(&qword_10002E710),
        (swift_dynamicCast(&v33, &v32, v7, v8, 6) & 1) == 0))
  {
    v35 = 0;
    v33 = 0u;
    v34 = 0u;
    goto LABEL_11;
  }
  if (!*((_QWORD *)&v34 + 1))
  {
LABEL_11:
    sub_100013834((uint64_t)&v33, &qword_10002E700);
    v18 = objc_msgSend(a1, "intent");
    if (v18)
    {
      v32 = v18;
      v19 = sub_100013968(0, &qword_10002E708, INIntent_ptr);
      v20 = sub_10000EFCC(&qword_10002E710);
      if ((swift_dynamicCast(&v33, &v32, v19, v20, 6) & 1) != 0)
      {
        if (*((_QWORD *)&v34 + 1))
        {
          sub_100021728(&v33, (uint64_t)v36);
          if (qword_10002E048 != -1)
            swift_once(&qword_10002E048, sub_10001A964);
          sub_100015A84(v2, (uint64_t)qword_10002E460);
          v21 = a1;
          v22 = Logger.logObject.getter(v21);
          v23 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v22, v23))
          {
            v24 = (uint8_t *)swift_slowAlloc(12, -1);
            v25 = (_QWORD *)swift_slowAlloc(8, -1);
            *(_DWORD *)v24 = 138412290;
            v26 = -[NSObject intent](v21, "intent");
            *(_QWORD *)&v33 = v26;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, (char *)&v33 + 8, v24 + 4, v24 + 12);
            *v25 = v26;

            _os_log_impl((void *)&_mh_execute_header, v22, v23, "getting tasks from {intent: %@}", v24, 0xCu);
            v27 = sub_10000EFCC(&qword_10002E6E8);
            swift_arrayDestroy(v25, 1, v27);
            swift_slowDealloc(v25, -1, -1);
            swift_slowDealloc(v24, -1, -1);
          }
          else
          {

            v22 = v21;
          }

          goto LABEL_25;
        }
LABEL_20:
        sub_100013834((uint64_t)&v33, &qword_10002E700);
        return;
      }
    }
LABEL_19:
    v35 = 0;
    v33 = 0u;
    v34 = 0u;
    goto LABEL_20;
  }
  sub_100021728(&v33, (uint64_t)v36);
  if (qword_10002E048 != -1)
    swift_once(&qword_10002E048, sub_10001A964);
  v9 = sub_100015A84(v2, (uint64_t)qword_10002E460);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
  v10 = a1;
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.debug.getter();
  if (!os_log_type_enabled(v11, v12))
  {

    v11 = v10;
    goto LABEL_22;
  }
  v13 = (uint8_t *)swift_slowAlloc(12, -1);
  v14 = (_QWORD *)swift_slowAlloc(8, -1);
  *(_DWORD *)v13 = 138412290;
  v15 = -[NSObject intentResponse](v10, "intentResponse");
  if (v15)
  {
    v16 = v15;
    *(_QWORD *)&v33 = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, (char *)&v33 + 8, v13 + 4, v13 + 12);
    *v14 = v16;

    _os_log_impl((void *)&_mh_execute_header, v11, v12, "getting tasks from {response: %@}", v13, 0xCu);
    v17 = sub_10000EFCC(&qword_10002E6E8);
    swift_arrayDestroy(v14, 1, v17);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v13, -1, -1);
LABEL_22:

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
LABEL_25:
    v28 = v37;
    v29 = v38;
    sub_100021740(v36, v37);
    v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8))(v28, v29);
    sub_10001C34C(v30);
    swift_bridgeObjectRelease(v30);
    sub_10002167C(v36);
    return;
  }

  __break(1u);
}

uint64_t *sub_10001C34C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  Class isa;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v41;
  _QWORD v42[3];
  _BYTE v43[16];
  unint64_t v44;

  v2 = v1;
  v44 = (unint64_t)&_swiftEmptyArrayStorage;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v19 = a1;
    else
      v19 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v4 = _CocoaArrayWrapper.endIndex.getter(v19);
    if (!v4)
      goto LABEL_21;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(a1);
    if (!v4)
      goto LABEL_21;
  }
  if (v4 < 1)
  {
    __break(1u);
LABEL_30:
    swift_once(&qword_10002E048, sub_10001A964);
    goto LABEL_24;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    for (i = 0; i != v4; ++i)
    {
      v7 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
      v8 = INTask.reminderID.getter();
      v9 = swift_unknownObjectRelease(v7);
      if (v8)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v9);
        v11 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v10 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v11 >= v10 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v10 > 1, v11 + 1, 1);
        v6 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v11, v8);
        specialized Array._endMutation()(v6);
      }
    }
  }
  else
  {
    for (j = 0; j != v4; ++j)
    {
      v14 = *(id *)(a1 + 8 * j + 32);
      v15 = INTask.reminderID.getter();

      if (v15)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v16);
        v18 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v17 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v18 >= v17 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v17 > 1, v18 + 1, 1);
        v13 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, v15);
        specialized Array._endMutation()(v13);
      }
    }
  }
LABEL_21:
  swift_bridgeObjectRelease(a1);
  v20 = *(void **)(v2 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_store);
  v21 = sub_100013968(0, (unint64_t *)&unk_10002E6F0, REMObjectID_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v44);
  v44 = 0;
  v23 = objc_msgSend(v20, "fetchRemindersWithObjectIDs:error:", isa, &v44);

  v24 = (id)v44;
  if (v23)
  {
    v25 = sub_100013968(0, &qword_10002E6E0, REMReminder_ptr);
    v26 = sub_1000216E8((unint64_t *)&qword_10002E128, (unint64_t *)&unk_10002E6F0, REMObjectID_ptr);
    v27 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v23, v21, v25, v26);
    v28 = v24;

    v29 = sub_1000094F4(v27);
    swift_bridgeObjectRelease(v27);
    return v29;
  }
  v30 = (id)v44;
  v2 = _convertNSErrorToError(_:)(v24);

  swift_willThrow();
  if (qword_10002E048 != -1)
    goto LABEL_30;
LABEL_24:
  v31 = type metadata accessor for Logger(0);
  sub_100015A84(v31, (uint64_t)qword_10002E460);
  swift_errorRetain(v2);
  v32 = swift_errorRetain(v2);
  v33 = Logger.logObject.getter(v32);
  v34 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc(12, -1);
    v36 = swift_slowAlloc(32, -1);
    v44 = v36;
    *(_DWORD *)v35 = 136315138;
    swift_getErrorValue(v2, v43, v42);
    v37 = Error.localizedDescription.getter(v42[1], v42[2]);
    v39 = v38;
    v41 = sub_10001F3AC(v37, v38, (uint64_t *)&v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, v42, v35 + 4, v35 + 12);
    swift_bridgeObjectRelease(v39);
    swift_errorRelease(v2);
    swift_errorRelease(v2);
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Failed to fetch reminders from INTasks {error: %s}", v35, 0xCu);
    swift_arrayDestroy(v36, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v36, -1, -1);
    swift_slowDealloc(v35, -1, -1);
  }
  else
  {
    swift_errorRelease(v2);
    swift_errorRelease(v2);
  }

  swift_errorRelease(v2);
  return (uint64_t *)&_swiftEmptyArrayStorage;
}

id sub_10001C7C4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  NSObject **v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  NSObject *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v29;
  _QWORD v30[3];
  char v31[16];
  NSObject *v32;
  _BYTE v33[24];

  v2 = v1;
  v4 = (uint64_t *)(v2 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_cachedReminders);
  swift_beginAccess(v2 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_cachedReminders, v33, 0, 0);
  v5 = *v4;
  v6 = a1;
  swift_bridgeObjectRetain(v5);
  v7 = sub_10001A890(v6, v5);

  swift_bridgeObjectRelease(v5);
  if (!v7)
  {
    if (qword_10002E048 != -1)
      swift_once(&qword_10002E048, sub_10001A964);
    v8 = type metadata accessor for Logger(0);
    sub_100015A84(v8, (uint64_t)qword_10002E460);
    v9 = v6;
    v10 = ((uint64_t (*)(void))Logger.logObject.getter)();
    v11 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      v13 = (NSObject **)swift_slowAlloc(8, -1);
      *(_DWORD *)v12 = 138412290;
      v32 = v9;
      v14 = v9;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, v33, v12 + 4, v12 + 12);
      *v13 = v9;

      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Dont have id in cache, fetching %@", v12, 0xCu);
      v15 = sub_10000EFCC(&qword_10002E6E8);
      swift_arrayDestroy(v13, 1, v15);
      swift_slowDealloc(v13, -1, -1);
      swift_slowDealloc(v12, -1, -1);
    }
    else
    {

      v10 = v9;
    }

    v16 = *(void **)(v2 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_store);
    v32 = 0;
    v7 = objc_msgSend(v16, "fetchReminderWithObjectID:error:", v9, &v32);
    v17 = v32;
    if (!v7)
    {
      v18 = v17;
      v19 = _convertNSErrorToError(_:)();

      swift_willThrow();
      swift_errorRetain(v19);
      v20 = swift_errorRetain(v19);
      v21 = Logger.logObject.getter(v20);
      v22 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc(12, -1);
        v24 = swift_slowAlloc(32, -1);
        v32 = v24;
        *(_DWORD *)v23 = 136315138;
        swift_getErrorValue(v19, v31, v30);
        v25 = Error.localizedDescription.getter(v30[1], v30[2]);
        v27 = v26;
        v29 = sub_10001F3AC(v25, v26, (uint64_t *)&v32);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, v30, v23 + 4, v23 + 12);
        swift_bridgeObjectRelease(v27);
        swift_errorRelease(v19);
        swift_errorRelease(v19);
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Failed to fetch reminder by id {error: %s}", v23, 0xCu);
        swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v24, -1, -1);
        swift_slowDealloc(v23, -1, -1);

        swift_errorRelease(v19);
      }
      else
      {
        swift_errorRelease(v19);
        swift_errorRelease(v19);
        swift_errorRelease(v19);

      }
      return 0;
    }
  }
  return v7;
}

id sub_10001CB8C(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  id v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString v16;
  id v17;
  objc_super v19;

  v6 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_store;
  v7 = objc_allocWithZone((Class)REMStore);
  v8 = v3;
  *(_QWORD *)&v3[v6] = objc_msgSend(v7, "initUserInteractive:", 1);
  v9 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_contactsProvider;
  sub_100013968(0, &qword_10002E730, OS_dispatch_queue_ptr);
  v10 = static OS_dispatch_queue.main.getter();
  type metadata accessor for RDIDispatchQueue(0);
  v11 = static RDIDispatchQueue.storeQueue.getter();
  v12 = type metadata accessor for REMContactsProvider(0);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  *(_QWORD *)&v8[v9] = REMContactsProvider.init(contactStoreCreator:queue:backgroundQueue:)(sub_10001A9F4, 0, v10, v11);
  v13 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_timeProvider;
  v14 = type metadata accessor for TTRCurrentTimeProvider(0);
  *(_QWORD *)&v8[v13] = swift_allocObject(v14, 16, 7);
  *(_QWORD *)&v8[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v8[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_maxContentHeight] = 0;
  swift_unknownObjectWeakInit(&v8[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_tableView], 0);
  v15 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_cachedReminders;
  *(_QWORD *)&v8[v15] = sub_100016594((uint64_t)&_swiftEmptyArrayStorage);

  if (a2)
  {
    v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v16 = 0;
  }
  v19.receiver = v8;
  v19.super_class = (Class)type metadata accessor for TTRIIntentsSnippetViewController();
  v17 = objc_msgSendSuper2(&v19, "initWithNibName:bundle:", v16, a3);

  return v17;
}

id sub_10001CD9C(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  objc_super v15;

  v3 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_store;
  v4 = objc_allocWithZone((Class)REMStore);
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, "initUserInteractive:", 1);
  v6 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_contactsProvider;
  sub_100013968(0, &qword_10002E730, OS_dispatch_queue_ptr);
  v7 = static OS_dispatch_queue.main.getter();
  type metadata accessor for RDIDispatchQueue(0);
  v8 = static RDIDispatchQueue.storeQueue.getter();
  v9 = type metadata accessor for REMContactsProvider(0);
  swift_allocObject(v9, *(unsigned int *)(v9 + 48), *(unsigned __int16 *)(v9 + 52));
  *(_QWORD *)&v5[v6] = REMContactsProvider.init(contactStoreCreator:queue:backgroundQueue:)(sub_10001A9F4, 0, v7, v8);
  v10 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_timeProvider;
  v11 = type metadata accessor for TTRCurrentTimeProvider(0);
  *(_QWORD *)&v5[v10] = swift_allocObject(v11, 16, 7);
  *(_QWORD *)&v5[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel] = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v5[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_maxContentHeight] = 0;
  swift_unknownObjectWeakInit(&v5[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_tableView], 0);
  v12 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_cachedReminders;
  *(_QWORD *)&v5[v12] = sub_100016594((uint64_t)&_swiftEmptyArrayStorage);

  v15.receiver = v5;
  v15.super_class = (Class)type metadata accessor for TTRIIntentsSnippetViewController();
  v13 = objc_msgSendSuper2(&v15, "initWithCoder:", a1);

  return v13;
}

id sub_10001CF38()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRIIntentsSnippetViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TTRIIntentsSnippetViewController()
{
  return objc_opt_self(_TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController);
}

void sub_10001D000(unint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  int64_t v22;
  int v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  unint64_t v35;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  id v40;
  void *v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  int64_t v58;
  int64_t v59;
  int isUniquelyReferenced_nonNull_native;
  int64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  char *v68;
  unint64_t v69;
  uint64_t v70;
  char *v71;
  unint64_t v72;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  int64_t v83;
  int64_t v84;
  int v85;
  int64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  char *v93;
  unint64_t v94;
  uint64_t v95;
  char *v96;
  unint64_t v97;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  id v103;
  uint64_t v104;
  char v105;

  v3 = v2;
  v6 = type metadata accessor for TTRIIntentsSnippetSection(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (uint64_t *)((char *)&v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = sub_10000EFCC(&qword_10002E600);
  __chkstk_darwin(v10);
  v12 = (char *)&v101 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v103 = objc_msgSend(a2, "intent");
  v13 = objc_opt_self(INSearchForNotebookItemsIntent);
  if (!swift_dynamicCastObjCClass(v103, v13))
  {

    v40 = sub_100020E8C(a2);
    if (!v40 || (v41 = v40, v42 = INTaskList.isTitleDefaultListTitle.getter(), v41, (v42 & 1) != 0))
    {
      v43 = sub_10000EFCC((uint64_t *)&unk_10002E6D0);
      v44 = *(_QWORD *)(v7 + 72);
      v45 = *(unsigned __int8 *)(v7 + 80);
      v46 = (v45 + 32) & ~v45;
      v47 = swift_allocObject(v43, v46 + v44, v45 | 7);
      *(_OWORD *)(v47 + 16) = xmmword_100022930;
      v48 = v47 + v46;
      v49 = (_QWORD *)v47;
      v50 = type metadata accessor for REMNavigationSpecifier(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v12, 1, 1, v50);
      *v9 = 0;
      v9[1] = 0;
      sub_100021634((uint64_t)v12, (uint64_t)v9 + *(int *)(v6 + 20));
      v51 = swift_bridgeObjectRetain(a1);
      v52 = sub_1000103C0(v51, 0, 0);
      swift_bridgeObjectRelease(a1);
      sub_100013834((uint64_t)v12, &qword_10002E600);
      *(_QWORD *)((char *)v9 + *(int *)(v6 + 24)) = v52;
      sub_1000216A4((uint64_t)v9, v48, type metadata accessor for TTRIIntentsSnippetSection);
      v53 = v49;
      v105 = 1;
      v54 = v49[2];
      if (!v54)
      {
        swift_bridgeObjectRelease(v53);
        v55 = _swiftEmptyArrayStorage;
        goto LABEL_75;
      }
      v103 = v53;
      swift_bridgeObjectRetain(v53);
      v55 = _swiftEmptyArrayStorage;
      while (1)
      {
        sub_10001AAC8(v48, &v105, v3, (unint64_t)&v104);
        v56 = v104;
        v57 = *(_QWORD *)(v104 + 16);
        v58 = v55[2];
        v59 = v58 + v57;
        if (__OFADD__(v58, v57))
          goto LABEL_82;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v55);
        if (isUniquelyReferenced_nonNull_native && v59 <= v55[3] >> 1)
        {
          if (*(_QWORD *)(v56 + 16))
            goto LABEL_39;
        }
        else
        {
          if (v58 <= v59)
            v61 = v58 + v57;
          else
            v61 = v58;
          v55 = (_QWORD *)sub_10001F1A0(isUniquelyReferenced_nonNull_native, v61, 1, (unint64_t)v55, &qword_10002E108, type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
          if (*(_QWORD *)(v56 + 16))
          {
LABEL_39:
            v62 = v55[2];
            v63 = (v55[3] >> 1) - v62;
            v64 = type metadata accessor for TTRIIntentsSnippetViewController.ViewModel(0);
            if (v63 < v57)
              goto LABEL_85;
            v65 = *(_QWORD *)(v64 - 8);
            v66 = (*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80);
            v67 = *(_QWORD *)(v65 + 72);
            v68 = (char *)v55 + v66 + v67 * v62;
            v69 = v56 + v66;
            v70 = v67 * v57;
            v71 = &v68[v70];
            v72 = v69 + v70;
            if (v69 < (unint64_t)v71 && (unint64_t)v68 < v72)
              goto LABEL_91;
            swift_arrayInitWithCopy(v68);
            if (v57)
            {
              v74 = v55[2];
              v38 = __OFADD__(v74, v57);
              v75 = v74 + v57;
              if (v38)
                goto LABEL_88;
              v55[2] = v75;
            }
            goto LABEL_29;
          }
        }
        if (v57)
          goto LABEL_83;
LABEL_29:
        swift_bridgeObjectRelease(v56);
        v48 += v44;
        if (!--v54)
        {
          swift_bridgeObjectRelease_n(v103, 2);
LABEL_75:
          sub_10001AA18((uint64_t)v55);
          return;
        }
      }
    }
    v76 = sub_100007140(a1);
    v105 = 1;
    v77 = v76[2];
    if (!v77)
    {
      swift_bridgeObjectRelease(v76);
      v80 = _swiftEmptyArrayStorage;
      goto LABEL_78;
    }
    v78 = (uint64_t)v76 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    v79 = *(_QWORD *)(v7 + 72);
    v103 = v76;
    swift_bridgeObjectRetain(v76);
    v80 = _swiftEmptyArrayStorage;
    while (1)
    {
      sub_10001AAC8(v78, &v105, v3, (unint64_t)&v104);
      v81 = v104;
      v82 = *(_QWORD *)(v104 + 16);
      v83 = v80[2];
      v84 = v83 + v82;
      if (__OFADD__(v83, v82))
        goto LABEL_86;
      v85 = swift_isUniquelyReferenced_nonNull_native(v80);
      if (v85 && v84 <= v80[3] >> 1)
      {
        if (*(_QWORD *)(v81 + 16))
          goto LABEL_65;
      }
      else
      {
        if (v83 <= v84)
          v86 = v83 + v82;
        else
          v86 = v83;
        v80 = (_QWORD *)sub_10001F1A0(v85, v86, 1, (unint64_t)v80, &qword_10002E108, type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
        if (*(_QWORD *)(v81 + 16))
        {
LABEL_65:
          v87 = v80[2];
          v88 = (v80[3] >> 1) - v87;
          v89 = type metadata accessor for TTRIIntentsSnippetViewController.ViewModel(0);
          if (v88 < v82)
            goto LABEL_89;
          v90 = *(_QWORD *)(v89 - 8);
          v91 = (*(unsigned __int8 *)(v90 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v90 + 80);
          v92 = *(_QWORD *)(v90 + 72);
          v93 = (char *)v80 + v91 + v92 * v87;
          v94 = v81 + v91;
          v95 = v92 * v82;
          v96 = &v93[v95];
          v97 = v94 + v95;
          if (v94 < (unint64_t)v96 && (unint64_t)v93 < v97)
            goto LABEL_91;
          swift_arrayInitWithCopy(v93);
          if (v82)
          {
            v99 = v80[2];
            v38 = __OFADD__(v99, v82);
            v100 = v99 + v82;
            if (v38)
              goto LABEL_90;
            v80[2] = v100;
          }
          goto LABEL_55;
        }
      }
      if (v82)
        goto LABEL_87;
LABEL_55:
      swift_bridgeObjectRelease(v81);
      v78 += v79;
      if (!--v77)
      {
        swift_bridgeObjectRelease_n(v103, 2);
LABEL_78:
        sub_10001AA18((uint64_t)v80);
        return;
      }
    }
  }
  v14 = sub_10001E734(a1);
  v105 = 1;
  v15 = v14[2];
  if (!v15)
  {
    swift_bridgeObjectRelease(v14);
    v18 = _swiftEmptyArrayStorage;
LABEL_50:
    sub_10001AA18((uint64_t)v18);

    return;
  }
  v16 = (uint64_t)v14 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  v17 = *(_QWORD *)(v7 + 72);
  v102 = v14;
  swift_bridgeObjectRetain(v14);
  v18 = _swiftEmptyArrayStorage;
  while (1)
  {
    sub_10001AAC8(v16, &v105, v3, (unint64_t)&v104);
    v19 = v104;
    v20 = *(_QWORD *)(v104 + 16);
    v21 = v18[2];
    v22 = v21 + v20;
    if (__OFADD__(v21, v20))
      break;
    v23 = swift_isUniquelyReferenced_nonNull_native(v18);
    if (v23 && v22 <= v18[3] >> 1)
    {
      if (*(_QWORD *)(v19 + 16))
        goto LABEL_15;
    }
    else
    {
      if (v21 <= v22)
        v24 = v21 + v20;
      else
        v24 = v21;
      v18 = (_QWORD *)sub_10001F1A0(v23, v24, 1, (unint64_t)v18, &qword_10002E108, type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
      if (*(_QWORD *)(v19 + 16))
      {
LABEL_15:
        v25 = v18[2];
        v26 = (v18[3] >> 1) - v25;
        v27 = type metadata accessor for TTRIIntentsSnippetViewController.ViewModel(0);
        if (v26 < v20)
          goto LABEL_81;
        v28 = *(_QWORD *)(v27 - 8);
        v29 = (*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
        v30 = *(_QWORD *)(v28 + 72);
        v31 = (char *)v18 + v29 + v30 * v25;
        v32 = v19 + v29;
        v33 = v30 * v20;
        v34 = &v31[v33];
        v35 = v32 + v33;
        if (v32 < (unint64_t)v34 && (unint64_t)v31 < v35)
          goto LABEL_91;
        swift_arrayInitWithCopy(v31);
        if (v20)
        {
          v37 = v18[2];
          v38 = __OFADD__(v37, v20);
          v39 = v37 + v20;
          if (v38)
            goto LABEL_84;
          v18[2] = v39;
        }
        goto LABEL_5;
      }
    }
    if (v20)
      goto LABEL_80;
LABEL_5:
    swift_bridgeObjectRelease(v19);
    v16 += v17;
    if (!--v15)
    {
      swift_bridgeObjectRelease_n(v102, 2);
      goto LABEL_50;
    }
  }
  __break(1u);
LABEL_80:
  __break(1u);
LABEL_81:
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  __break(1u);
LABEL_85:
  __break(1u);
LABEL_86:
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
  _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
}

double sub_10001D6E8(char a1, uint64_t a2, double a3, double a4, double a5, CGFloat a6)
{
  uint64_t v6;
  void *Strong;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  double v35;
  double v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;

  Strong = (void *)swift_unknownObjectWeakLoadStrong(v6 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_tableView, a2);
  if (!Strong)
    return 0.0;
  v12 = Strong;
  objc_msgSend(Strong, "contentSize");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, a5, a6);
  sub_100020F70(v12, a1 & 1, a6);
  v18 = v17;
  if (*(double *)(v6 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_maxContentHeight) > v17)
    v19 = *(double *)(v6
                    + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_maxContentHeight);
  else
    v19 = v17;
  *(double *)(v6 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_maxContentHeight) = v19;
  if (qword_10002E048 != -1)
    swift_once(&qword_10002E048, sub_10001A964);
  v20 = type metadata accessor for Logger(0);
  v21 = sub_100015A84(v20, (uint64_t)qword_10002E460);
  v22 = Logger.logObject.getter(v21);
  v23 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc(32, -1);
    v25 = swift_slowAlloc(96, -1);
    *(_DWORD *)v24 = 136446722;
    v37 = 0;
    v38 = 0xE000000000000000;
    v39 = v25;
    v35 = v14;
    v36 = v16;
    type metadata accessor for CGSize(0);
    v27 = v26;
    _print_unlocked<A, B>(_:_:)(&v35, &v37, v26, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    v28 = v38;
    v37 = sub_10001F3AC(v37, v38, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38, v24 + 4, v24 + 12);
    v29 = swift_bridgeObjectRelease(v28);
    *(_WORD *)(v24 + 12) = 2082;
    v30 = Double.description.getter(v29, v18);
    v32 = v31;
    v37 = sub_10001F3AC(v30, v31, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38, v24 + 14, v24 + 22);
    swift_bridgeObjectRelease(v32);
    *(_WORD *)(v24 + 22) = 2082;
    v37 = 0;
    v38 = 0xE000000000000000;
    v35 = a3;
    v36 = v19;
    _print_unlocked<A, B>(_:_:)(&v35, &v37, v27, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    v33 = v38;
    v37 = sub_10001F3AC(v37, v38, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38, v24 + 24, v24 + 32);
    swift_bridgeObjectRelease(v33);
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "preferred content size {originalContentSize: %{public}s, tableContentHeight: %{public}s, preferredContentSize: %{public}s}", (uint8_t *)v24, 0x20u);
    swift_arrayDestroy(v25, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v25, -1, -1);
    swift_slowDealloc(v24, -1, -1);

  }
  else
  {

  }
  return a3;
}

char *sub_10001DBDC(char *a1, char **a2, uint64_t a3)
{
  int v5;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  int v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v19[(v5 + 16) & ~(unint64_t)v5];
    swift_retain(v19);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      v7 = *a2;
      v8 = a2[1];
      *(_QWORD *)a1 = *a2;
      *((_QWORD *)a1 + 1) = v8;
      v9 = a2[2];
      *((_QWORD *)a1 + 2) = v9;
      *((_DWORD *)a1 + 6) = *((_DWORD *)a2 + 6);
      v10 = a2[5];
      *((_QWORD *)a1 + 4) = a2[4];
      *((_QWORD *)a1 + 5) = v10;
      v11 = a2[7];
      *((_QWORD *)a1 + 6) = a2[6];
      *((_QWORD *)a1 + 7) = v11;
      v12 = a2[9];
      *((_QWORD *)a1 + 8) = a2[8];
      *((_QWORD *)a1 + 9) = v12;
      v13 = *((unsigned __int8 *)a2 + 96);
      v14 = v7;
      v15 = v8;
      v16 = v9;
      swift_bridgeObjectRetain(v10);
      swift_bridgeObjectRetain(v11);
      swift_bridgeObjectRetain(v12);
      if (v13 == 255)
      {
        *((_OWORD *)a1 + 5) = *((_OWORD *)a2 + 5);
        a1[96] = *((_BYTE *)a2 + 96);
      }
      else
      {
        v17 = a2[10];
        v18 = (uint64_t)a2[11];
        sub_100015B08(v17, v18, v13);
        *((_QWORD *)a1 + 10) = v17;
        *((_QWORD *)a1 + 11) = v18;
        a1[96] = v13;
      }
      v28 = a2[13];
      *((_QWORD *)a1 + 13) = v28;
      a1[112] = *((_BYTE *)a2 + 112);
      v29 = a2[15];
      v30 = a2[16];
      *((_QWORD *)a1 + 15) = v29;
      *((_QWORD *)a1 + 16) = v30;
      v31 = v28;
      swift_bridgeObjectRetain(v30);
      v32 = a1;
      v33 = a3;
      v34 = 1;
    }
    else
    {
      v20 = a2[1];
      *(_QWORD *)a1 = *a2;
      *((_QWORD *)a1 + 1) = v20;
      swift_bridgeObjectRetain(v20);
      v21 = sub_10000EFCC(&qword_10002E5F8);
      v22 = *(int *)(v21 + 48);
      v23 = &a1[v22];
      v24 = (char *)a2 + v22;
      v25 = type metadata accessor for REMNavigationSpecifier(0);
      v26 = *(_QWORD *)(v25 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
      {
        v27 = sub_10000EFCC(&qword_10002E600);
        memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v23, v24, v25);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
      }
      a1[*(int *)(v21 + 64)] = *((_BYTE *)a2 + *(int *)(v21 + 64));
      v32 = a1;
      v33 = a3;
      v34 = 0;
    }
    swift_storeEnumTagMultiPayload(v32, v33, v34);
  }
  return a1;
}

uint64_t sub_10001DDEC(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (swift_getEnumCaseMultiPayload(a1, a2) == 1)
  {

    swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + 56));
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + 72));
    v3 = *(unsigned __int8 *)(a1 + 96);
    if (v3 != 255)
      sub_100015B8C(*(void **)(a1 + 80), *(_QWORD *)(a1 + 88), v3);

    return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 128));
  }
  else
  {
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
    v5 = a1 + *(int *)(sub_10000EFCC(&qword_10002E5F8) + 48);
    v6 = type metadata accessor for REMNavigationSpecifier(0);
    v7 = *(_QWORD *)(v6 - 8);
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
    if (!(_DWORD)result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  return result;
}

uint64_t sub_10001DEDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;

  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    v6 = *(void **)a2;
    v7 = *(void **)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v7;
    v8 = *(void **)(a2 + 16);
    *(_QWORD *)(a1 + 16) = v8;
    *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
    v9 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = v9;
    v10 = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 56) = v10;
    v11 = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 72) = v11;
    v12 = *(unsigned __int8 *)(a2 + 96);
    v13 = v6;
    v14 = v7;
    v15 = v8;
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRetain(v11);
    if (v12 == 255)
    {
      *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
      *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
    }
    else
    {
      v16 = *(void **)(a2 + 80);
      v17 = *(_QWORD *)(a2 + 88);
      sub_100015B08(v16, v17, v12);
      *(_QWORD *)(a1 + 80) = v16;
      *(_QWORD *)(a1 + 88) = v17;
      *(_BYTE *)(a1 + 96) = v12;
    }
    v26 = *(void **)(a2 + 104);
    *(_QWORD *)(a1 + 104) = v26;
    *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
    v27 = *(_QWORD *)(a2 + 120);
    v28 = *(_QWORD *)(a2 + 128);
    *(_QWORD *)(a1 + 120) = v27;
    *(_QWORD *)(a1 + 128) = v28;
    v29 = v26;
    swift_bridgeObjectRetain(v28);
    v30 = 1;
  }
  else
  {
    v18 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v18;
    swift_bridgeObjectRetain(v18);
    v19 = sub_10000EFCC(&qword_10002E5F8);
    v20 = *(int *)(v19 + 48);
    v21 = (void *)(a1 + v20);
    v22 = (const void *)(a2 + v20);
    v23 = type metadata accessor for REMNavigationSpecifier(0);
    v24 = *(_QWORD *)(v23 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    {
      v25 = sub_10000EFCC(&qword_10002E600);
      memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v24 + 16))(v21, v22, v23);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
    v30 = 0;
    *(_BYTE *)(a1 + *(int *)(v19 + 64)) = *(_BYTE *)(a2 + *(int *)(v19 + 64));
  }
  swift_storeEnumTagMultiPayload(a1, a3, v30);
  return a1;
}

uint64_t sub_10001E0B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;

  if (a1 != a2)
  {
    sub_10001E2EC(a1);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      v6 = *(void **)a2;
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v7 = *(void **)(a2 + 8);
      *(_QWORD *)(a1 + 8) = v7;
      v8 = *(void **)(a2 + 16);
      *(_QWORD *)(a1 + 16) = v8;
      *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
      *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
      *(_BYTE *)(a1 + 26) = *(_BYTE *)(a2 + 26);
      *(_BYTE *)(a1 + 27) = *(_BYTE *)(a2 + 27);
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      v9 = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 40) = v9;
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      v10 = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 56) = v10;
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      v11 = *(_QWORD *)(a2 + 72);
      *(_QWORD *)(a1 + 72) = v11;
      v12 = *(unsigned __int8 *)(a2 + 96);
      v13 = v6;
      v14 = v7;
      v15 = v8;
      swift_bridgeObjectRetain(v9);
      swift_bridgeObjectRetain(v10);
      swift_bridgeObjectRetain(v11);
      if (v12 == 255)
      {
        v26 = *(_OWORD *)(a2 + 80);
        *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
        *(_OWORD *)(a1 + 80) = v26;
      }
      else
      {
        v16 = *(void **)(a2 + 80);
        v17 = *(_QWORD *)(a2 + 88);
        sub_100015B08(v16, v17, v12);
        *(_QWORD *)(a1 + 80) = v16;
        *(_QWORD *)(a1 + 88) = v17;
        *(_BYTE *)(a1 + 96) = v12;
      }
      v27 = *(void **)(a2 + 104);
      *(_QWORD *)(a1 + 104) = v27;
      *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
      *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
      v28 = *(_QWORD *)(a2 + 128);
      *(_QWORD *)(a1 + 128) = v28;
      v29 = v27;
      swift_bridgeObjectRetain(v28);
      v30 = 1;
    }
    else
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v18 = *(_QWORD *)(a2 + 8);
      *(_QWORD *)(a1 + 8) = v18;
      swift_bridgeObjectRetain(v18);
      v19 = sub_10000EFCC(&qword_10002E5F8);
      v20 = *(int *)(v19 + 48);
      v21 = (void *)(a1 + v20);
      v22 = (const void *)(a2 + v20);
      v23 = type metadata accessor for REMNavigationSpecifier(0);
      v24 = *(_QWORD *)(v23 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
      {
        v25 = sub_10000EFCC(&qword_10002E600);
        memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v24 + 16))(v21, v22, v23);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
      }
      v30 = 0;
      *(_BYTE *)(a1 + *(int *)(v19 + 64)) = *(_BYTE *)(a2 + *(int *)(v19 + 64));
    }
    swift_storeEnumTagMultiPayload(a1, a3, v30);
  }
  return a1;
}

uint64_t sub_10001E2EC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TTRIIntentsSnippetViewController.ViewModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for TTRIIntentsSnippetViewController.ViewModel(uint64_t a1)
{
  uint64_t result;

  result = qword_10002E678;
  if (!qword_10002E678)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TTRIIntentsSnippetViewController.ViewModel);
  return result;
}

_OWORD *sub_10001E364(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (swift_getEnumCaseMultiPayload(a2, a3))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v6 = sub_10000EFCC(&qword_10002E5F8);
    v7 = *(int *)(v6 + 48);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = type metadata accessor for REMNavigationSpecifier(0);
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      v12 = sub_10000EFCC(&qword_10002E600);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    *((_BYTE *)a1 + *(int *)(v6 + 64)) = *((_BYTE *)a2 + *(int *)(v6 + 64));
    swift_storeEnumTagMultiPayload(a1, a3, 0);
  }
  return a1;
}

_OWORD *sub_10001E484(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sub_10001E2EC((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload(a2, a3))
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      v6 = sub_10000EFCC(&qword_10002E5F8);
      v7 = *(int *)(v6 + 48);
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      v10 = type metadata accessor for REMNavigationSpecifier(0);
      v11 = *(_QWORD *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        v12 = sub_10000EFCC(&qword_10002E600);
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
      *((_BYTE *)a1 + *(int *)(v6 + 64)) = *((_BYTE *)a2 + *(int *)(v6 + 64));
      swift_storeEnumTagMultiPayload(a1, a3, 0);
    }
  }
  return a1;
}

uint64_t sub_10001E5B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_10001E5C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_10001E5D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

void sub_10001E5E0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _BYTE v4[32];
  _QWORD v5[2];

  sub_10001416C(319);
  if (v3 <= 0x3F)
  {
    swift_getTupleTypeLayout3(v4, &unk_100022EA0, *(_QWORD *)(v2 - 8) + 64, &unk_100022EB8);
    v5[0] = v4;
    v5[1] = &unk_100022ED0;
    swift_initEnumMetadataMultiPayload(a1, 256, 2, v5);
  }
}

void sub_10001E668(char a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  NSSet v9;
  Class isa;

  if (a2)
  {
    sub_100013968(0, &qword_10002E6B8, INParameter_ptr);
    sub_1000216E8(&qword_10002E6C0, &qword_10002E6B8, INParameter_ptr);
    v9.super.isa = Set._bridgeToObjectiveC()().super.isa;
  }
  else
  {
    v9.super.isa = 0;
  }
  isa = v9.super.isa;
  (*(void (**)(uint64_t, _QWORD, double, double))(a3 + 16))(a3, a1 & 1, a4, a5);

}

uint64_t sub_10001E72C()
{
  return 0;
}

uint64_t *sub_10001E734(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
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
  unint64_t v17;
  uint64_t v18;
  _QWORD v21[5];

  v3 = type metadata accessor for TTRIIntentsSnippetSection(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (_QWORD *)((char *)&v21[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_10000EFCC(&qword_10002E600);
  __chkstk_darwin(v7);
  v9 = (char *)&v21[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(v1 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_timeProvider);
  v21[3] = type metadata accessor for TTRCurrentTimeProvider(0);
  v21[4] = &protocol witness table for TTRCurrentTimeProvider;
  v21[0] = v10;
  swift_retain(v10);
  LOBYTE(v10) = INSearchForNotebookItemsIntent.isTodayQuery(timeProvider:)(v21);
  v11 = sub_10002167C(v21);
  if ((v10 & 1) != 0)
    return (uint64_t *)sub_10000653C(a1);
  if ((INSearchForNotebookItemsIntent.isScheduledQuery.getter(v11) & 1) != 0)
    return sub_100005CC4(a1);
  if ((INSearchForNotebookItemsIntent.isFlaggedQuery.getter() & 1) != 0)
    return (uint64_t *)sub_100010CAC(a1);
  if ((INSearchForNotebookItemsIntent.isListOrAllQuery.getter() & 1) != 0)
    return sub_100007140(a1);
  v13 = sub_10000EFCC((uint64_t *)&unk_10002E6D0);
  v14 = *(unsigned __int8 *)(v4 + 80);
  v15 = (v14 + 32) & ~v14;
  v12 = swift_allocObject(v13, v15 + *(_QWORD *)(v4 + 72), v14 | 7);
  *(_OWORD *)(v12 + 16) = xmmword_100022930;
  v16 = type metadata accessor for REMNavigationSpecifier(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v9, 1, 1, v16);
  *v6 = 0;
  v6[1] = 0;
  sub_100021634((uint64_t)v9, (uint64_t)v6 + *(int *)(v3 + 20));
  v17 = swift_bridgeObjectRetain(a1);
  v18 = sub_1000103C0(v17, 0, 0);
  swift_bridgeObjectRelease(a1);
  sub_100013834((uint64_t)v9, &qword_10002E600);
  *(_QWORD *)((char *)v6 + *(int *)(v3 + 24)) = v18;
  sub_1000216A4((uint64_t)v6, v12 + v15, type metadata accessor for TTRIIntentsSnippetSection);
  return (uint64_t *)v12;
}

void sub_10001E948(char *a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  os_log_type_t v19;
  uint8_t *v20;
  char v21[8];
  __int128 v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  _OWORD v26[8];
  _BYTE v27[128];
  _OWORD v28[8];

  v5 = *(void **)a2;
  v6 = sub_10001C7C4(*(void **)a2);
  if (v6)
  {
    v7 = v6;
    swift_beginAccess(v2 + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_cachedReminders, v28, 33, 0);
    v8 = (void *)sub_10001F9EC((unint64_t)v5);
    swift_endAccess(v28);

    sub_100016BF4(0, 0, (*(_BYTE *)(a2 + 16) & 1) == 0, 2, 2, 2, 0, 0, (uint64_t)v28, 0, 0, 0, 0, 0, 0, 255, 0, 2, 0,
      0);
    v26[4] = v28[4];
    v26[5] = v28[5];
    v26[6] = v28[6];
    v26[7] = v28[7];
    v26[0] = v28[0];
    v26[1] = v28[1];
    v26[2] = v28[2];
    v26[3] = v28[3];
    nullsub_2(v26);
    v9 = (uint64_t)&a1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel];
    swift_beginAccess(&a1[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel], &v25, 1, 0);
    sub_10001A230(v9, (uint64_t)v27);
    sub_10001A230((uint64_t)v26, v9);
    sub_10001A7F4((uint64_t)v28);
    sub_100021764((uint64_t)v27);
    sub_100017DC8();
    sub_1000217BC((uint64_t)v28);
    v10 = type metadata accessor for TTRReminderEditor(0);
    v24 = v7;
    __chkstk_darwin(v10);
    *((_QWORD *)&v22 + 1) = v7;
    v11 = swift_allocObject(&unk_100029198, 152, 7);
    v12 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(v11 + 88) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(v11 + 104) = v12;
    v13 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(v11 + 120) = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(v11 + 136) = v13;
    v14 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v11 + 24) = *(_OWORD *)a2;
    *(_OWORD *)(v11 + 40) = v14;
    v15 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(v11 + 56) = *(_OWORD *)(a2 + 32);
    *(_QWORD *)(v11 + 16) = a1;
    *(_OWORD *)(v11 + 72) = v15;
    v16 = a1;
    sub_10001A7F4(a2);
    static TTROneshotEditing.oneshotEdit(_:undoManager:editBlock:completionBlock:)(&v24, 0, sub_10002189C, v21, sub_100021948, v11, v10, &protocol witness table for TTRReminderEditor);

    swift_release(v11);
  }
  else
  {
    if (qword_10002E048 != -1)
      swift_once(&qword_10002E048, sub_10001A964);
    v17 = type metadata accessor for Logger(0);
    v18 = sub_100015A84(v17, (uint64_t)qword_10002E460);
    v23 = Logger.logObject.getter(v18);
    v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v19, "didn't get reminder object on toggle request", v20, 2u);
      swift_slowDealloc(v20, -1, -1);
    }

  }
}

uint64_t sub_10001EC5C(uint64_t a1, uint64_t a2, __int128 *a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  os_log_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  os_log_t v43;
  uint8_t *v44;
  uint64_t v45;
  _QWORD v46[3];
  uint64_t v47;
  uint64_t v48;
  _OWORD v49[8];
  uint64_t v50[16];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;

  v6 = a3[5];
  v55 = a3[4];
  v56 = v6;
  v7 = a3[7];
  v57 = a3[6];
  v58 = v7;
  v8 = a3[1];
  v51 = *a3;
  v52 = v8;
  v9 = a3[3];
  v53 = a3[2];
  v54 = v9;
  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_errorRetain(a1);
    if (qword_10002E048 != -1)
      swift_once(&qword_10002E048, sub_10001A964);
    sub_100015A84(v10, (uint64_t)qword_10002E460);
    swift_errorRetain(a1);
    v14 = swift_errorRetain(a1);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc(12, -1);
      v45 = a2;
      v18 = (uint8_t *)v17;
      v19 = swift_slowAlloc(32, -1);
      v50[0] = v19;
      *(_DWORD *)v18 = 136315138;
      v44 = v18 + 4;
      swift_getErrorValue(a1, &v47, v46);
      v20 = Error.localizedDescription.getter(v46[1], v46[2]);
      v22 = v21;
      *(_QWORD *)&v49[0] = sub_10001F3AC(v20, v21, v50);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v49, (char *)v49 + 8, v44, v18 + 12);
      swift_bridgeObjectRelease(v22);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Failed toggling reminder complete: %s", v18, 0xCu);
      swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v19, -1, -1);
      v23 = v18;
      a2 = v45;
      swift_slowDealloc(v23, -1, -1);
    }
    else
    {
      swift_errorRelease(a1);
      swift_errorRelease(a1);
    }

    v49[5] = v56;
    v49[6] = v57;
    v49[7] = v58;
    v49[0] = v51;
    v49[1] = v52;
    v49[2] = v53;
    v49[3] = v54;
    v49[4] = v55;
    nullsub_2(v49);
    v40 = a2 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel;
    swift_beginAccess(a2 + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel, &v48, 1, 0);
    sub_10001A230(v40, (uint64_t)v50);
    sub_10001A230((uint64_t)v49, v40);
    sub_10001A7F4((uint64_t)a3);
    sub_10001A7F4((uint64_t)a3);
    sub_100021764((uint64_t)v50);
    sub_100017DC8();
    sub_1000217BC((uint64_t)a3);
    return swift_errorRelease(a1);
  }
  else
  {
    if (qword_10002E048 != -1)
      swift_once(&qword_10002E048, sub_10001A964);
    v24 = sub_100015A84(v10, (uint64_t)qword_10002E460);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v24, v10);
    sub_10001A7F4((uint64_t)a3);
    sub_10001A7F4((uint64_t)a3);
    sub_10001A7F4((uint64_t)a3);
    v25 = sub_10001A7F4((uint64_t)a3);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.debug.getter();
    v28 = v27;
    if (os_log_type_enabled(v26, v27))
    {
      v29 = swift_slowAlloc(22, -1);
      LODWORD(v44) = v28;
      v30 = v29;
      v31 = (_QWORD *)swift_slowAlloc(8, -1);
      v45 = swift_slowAlloc(32, -1);
      v50[0] = v45;
      *(_DWORD *)v30 = 138412546;
      v42 = v11;
      v43 = v26;
      *(_QWORD *)&v49[0] = *(_QWORD *)a3;
      v32 = *(_QWORD *)&v49[0];
      v33 = *(id *)&v49[0];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v49, (char *)v49 + 8, v30 + 4, v30 + 12);
      *v31 = v32;
      sub_1000217BC((uint64_t)a3);
      sub_1000217BC((uint64_t)a3);
      *(_WORD *)(v30 + 12) = 2080;
      if ((a3[1] & 1) != 0)
        v34 = 20302;
      else
        v34 = 5457241;
      if ((a3[1] & 1) != 0)
        v35 = 0xE200000000000000;
      else
        v35 = 0xE300000000000000;
      *(_QWORD *)&v49[0] = sub_10001F3AC(v34, v35, v50);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v49, (char *)v49 + 8, v30 + 14, v30 + 22);
      swift_bridgeObjectRelease(v35);
      sub_1000217BC((uint64_t)a3);
      sub_1000217BC((uint64_t)a3);
      v36 = v43;
      _os_log_impl((void *)&_mh_execute_header, v43, (os_log_type_t)v44, "toggle complete for reminder {reminderID: %@}, {expected completed: %s}", (uint8_t *)v30, 0x16u);
      v37 = sub_10000EFCC(&qword_10002E6E8);
      swift_arrayDestroy(v31, 1, v37);
      swift_slowDealloc(v31, -1, -1);
      v38 = v45;
      swift_arrayDestroy(v45, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v38, -1, -1);
      swift_slowDealloc(v30, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v13, v10);
    }
    else
    {
      sub_1000217BC((uint64_t)a3);
      sub_1000217BC((uint64_t)a3);
      sub_1000217BC((uint64_t)a3);
      sub_1000217BC((uint64_t)a3);

      return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
  }
}

uint64_t sub_10001F18C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10001F1A0(a1, a2, a3, a4, (uint64_t *)&unk_10002E6D0, type metadata accessor for TTRIIntentsSnippetSection);
}

uint64_t sub_10001F1A0(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  size_t v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
        __break(1u);
        return result;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v13 = sub_10000EFCC(a5);
  v14 = *(_QWORD *)(a6(0) - 8);
  v15 = *(_QWORD *)(v14 + 72);
  v16 = *(unsigned __int8 *)(v14 + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (_QWORD *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  v19 = j__malloc_size(v18);
  if (!v15)
    goto LABEL_29;
  if (v19 - v17 == 0x8000000000000000 && v15 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v15);
LABEL_19:
  v21 = a6(0);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  v24 = (unint64_t)v18 + v23;
  if ((a1 & 1) != 0)
  {
    v25 = a4 + v23;
    if ((unint64_t)v18 < a4 || v24 >= v25 + *(_QWORD *)(v22 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v18 + v23, v25, v11, v21);
    }
    else if (v18 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v18 + v23);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000202CC(0, v11, v24, a4, a6);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v18;
}

uint64_t sub_10001F3AC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10001F47C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000215F8((uint64_t)v12, *a3);
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
      sub_1000215F8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10002167C(v12);
  return v7;
}

uint64_t sub_10001F47C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10001F634(a5, a6);
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
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_10001F634(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10001F6C8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10001F8A0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10001F8A0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10001F6C8(uint64_t a1, unint64_t a2)
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
      v5 = sub_10001F83C(v4, 0);
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

_QWORD *sub_10001F83C(uint64_t a1, uint64_t a2)
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
  v4 = sub_10000EFCC(&qword_10002E6C8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10001F8A0(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000EFCC(&qword_10002E6C8);
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

uint64_t sub_10001F9EC(unint64_t a1)
{
  Swift::Int *v1;
  Swift::Int *v2;
  Swift::Int v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  char v12;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  Swift::Int v15;
  Swift::Int v17;

  v2 = v1;
  v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain(v4);
    a1 = sub_100008248(a1);
    v12 = v11;
    swift_bridgeObjectRelease(v4);
    if ((v12 & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
      v4 = *v2;
      v17 = *v2;
      *v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_10001FF38();
        v4 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0)
    v5 = v4;
  else
    v5 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v4);
  v6 = (id)a1;
  v7 = __CocoaDictionary.lookup(_:)();

  if (!v7)
  {
    swift_bridgeObjectRelease(v4);
    return 0;
  }
  swift_unknownObjectRelease(v7);
  v8 = __CocoaDictionary.count.getter(v5);
  v4 = sub_10001FB38(v5, v8);
  swift_retain(v4);
  a1 = sub_100008248((uint64_t)v6);
  v10 = v9;
  swift_release(v4);
  if ((v10 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  v14 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * a1);
  sub_10001FD88(a1, v4);
  v15 = *v2;
  *v2 = v4;
  swift_bridgeObjectRelease(v15);
  return v14;
}

Swift::Int sub_10001FB38(uint64_t a1, uint64_t a2)
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
  Swift::Int result;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  if (a2)
  {
    sub_10000EFCC((uint64_t *)&unk_10002E720);
    v4 = static _DictionaryStorage.convert(_:capacity:)(a1, a2);
    v30 = v4;
    v5 = __CocoaDictionary.makeIterator()(a1);
    v6 = __CocoaDictionary.Iterator.next()();
    if (v6)
    {
      v8 = v6;
      v9 = v7;
      v10 = sub_100013968(0, (unint64_t *)&unk_10002E6F0, REMObjectID_ptr);
      do
      {
        v28 = v8;
        swift_dynamicCast(&v29, &v28, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
        v27 = v9;
        v21 = sub_100013968(0, &qword_10002E6E0, REMReminder_ptr);
        swift_dynamicCast(&v28, &v27, (char *)&type metadata for Swift.AnyObject + 8, v21, 7);
        v4 = v30;
        v22 = *(_QWORD *)(v30 + 16);
        if (*(_QWORD *)(v30 + 24) <= v22)
        {
          sub_100008DB0(v22 + 1, 1);
          v4 = v30;
        }
        v12 = v28;
        v11 = v29;
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
        v14 = v4 + 64;
        v15 = -1 << *(_BYTE *)(v4 + 32);
        v16 = result & ~v15;
        v17 = v16 >> 6;
        if (((-1 << v16) & ~*(_QWORD *)(v4 + 64 + 8 * (v16 >> 6))) != 0)
        {
          v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v4 + 64 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v23 = 0;
          v24 = (unint64_t)(63 - v15) >> 6;
          do
          {
            if (++v17 == v24 && (v23 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v25 = v17 == v24;
            if (v17 == v24)
              v17 = 0;
            v23 |= v25;
            v26 = *(_QWORD *)(v14 + 8 * v17);
          }
          while (v26 == -1);
          v18 = __clz(__rbit64(~v26)) + (v17 << 6);
        }
        *(_QWORD *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
        v19 = 8 * v18;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + v19) = v11;
        *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v12;
        ++*(_QWORD *)(v4 + 16);
        v8 = __CocoaDictionary.Iterator.next()();
        v9 = v20;
      }
      while (v8);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v4;
}

void sub_10001FD88(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  Swift::Int v10;
  id v11;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

  v3 = a1;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    v8 = _HashTable.previousHole(before:)(a1, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(a2 + 40);
        v11 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        v12 = NSObject._rawHashValue(seed:)(v10);

        v13 = v12 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v3 >= v13)
          {
LABEL_16:
            v16 = *(_QWORD *)(a2 + 48);
            v17 = (_QWORD *)(v16 + 8 * v3);
            v18 = (_QWORD *)(v16 + 8 * v6);
            if (v3 != v6 || v17 >= v18 + 1)
              *v17 = *v18;
            v19 = *(_QWORD *)(a2 + 56);
            v20 = (_QWORD *)(v19 + 8 * v3);
            v21 = (_QWORD *)(v19 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v20 >= v21 + 1))
            {
              *v20 = *v21;
              v3 = v6;
            }
          }
        }
        else if (v13 >= v9 || v3 >= v13)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v23 = *v22;
    v24 = (-1 << v3) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v24 = *v22;
    v23 = (-1 << a1) - 1;
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
}

id sub_10001FF38()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_10000EFCC((uint64_t *)&unk_10002E720);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_1000200DC(void **a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  NSObject *oslog;
  void *v14;
  uint64_t v15;

  v2 = *a1;
  v3 = sub_10001C7C4(*a1);
  if (v3)
  {
    oslog = v3;
    v4 = -[NSObject userActivity](v3, "userActivity");
    if (v4)
    {
      v5 = v4;
      REMUserActivity.launch()();

    }
  }
  else
  {
    if (qword_10002E048 != -1)
      swift_once(&qword_10002E048, sub_10001A964);
    v6 = type metadata accessor for Logger(0);
    sub_100015A84(v6, (uint64_t)qword_10002E460);
    sub_10001A7F4((uint64_t)a1);
    v7 = sub_10001A7F4((uint64_t)a1);
    oslog = Logger.logObject.getter(v7);
    v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(12, -1);
      v10 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v9 = 138412290;
      v14 = v2;
      v11 = v2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v9 + 4, v9 + 12);
      *v10 = v2;
      sub_1000217BC((uint64_t)a1);
      sub_1000217BC((uint64_t)a1);
      _os_log_impl((void *)&_mh_execute_header, oslog, v8, "Didn't get reminder object on app link launch request {id: %@}", v9, 0xCu);
      v12 = sub_10000EFCC(&qword_10002E6E8);
      swift_arrayDestroy(v10, 1, v12);
      swift_slowDealloc(v10, -1, -1);
      swift_slowDealloc(v9, -1, -1);

      return;
    }
    sub_1000217BC((uint64_t)a1);
    sub_1000217BC((uint64_t)a1);
  }

}

uint64_t sub_1000202CC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
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
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
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
    swift_arrayInitWithCopy(a3);
    return v14;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

_QWORD *sub_1000203E4(uint64_t a1, void (*a2)(unint64_t, id), uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void (*v21)(unint64_t, id);
  uint64_t v22;
  _QWORD *v23;

  v21 = a2;
  v22 = a3;
  v4 = type metadata accessor for TTRIIntentsSnippetViewController.ViewModel(0);
  v20 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = _swiftEmptyArrayStorage;
  sub_10000D5E8(0, 0, 0);
  v7 = v23;
  if ((unint64_t)a1 >> 62)
    goto LABEL_15;
  v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  if (v8)
  {
    while (1)
    {
      v9 = 0;
      v18 = a1 & 0xFFFFFFFFFFFFFF8;
      v19 = a1 & 0xC000000000000001;
      while (v19)
      {
        v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v9, a1);
LABEL_7:
        v11 = v10;
        v12 = v9 + 1;
        if (__OFADD__(v9, 1))
          goto LABEL_14;
        v21(v9, v10);

        v23 = v7;
        v14 = v7[2];
        v13 = v7[3];
        if (v14 >= v13 >> 1)
        {
          sub_10000D5E8(v13 > 1, v14 + 1, 1);
          v7 = v23;
        }
        v7[2] = v14 + 1;
        sub_1000216A4((uint64_t)v6, (uint64_t)v7+ ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80))+ *(_QWORD *)(v20 + 72) * v14, type metadata accessor for TTRIIntentsSnippetViewController.ViewModel);
        ++v9;
        if (v12 == v8)
          goto LABEL_19;
      }
      if (v9 < *(_QWORD *)(v18 + 16))
        break;
      __break(1u);
LABEL_14:
      __break(1u);
LABEL_15:
      if (a1 < 0)
        v15 = a1;
      else
        v15 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a1);
      v8 = _CocoaArrayWrapper.endIndex.getter(v15);
      if (!v8)
        goto LABEL_19;
    }
    v10 = *(id *)(a1 + 8 * v9 + 32);
    goto LABEL_7;
  }
LABEL_19:
  swift_bridgeObjectRelease(a1);
  return v7;
}

id sub_1000205C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v42[8];

  v2 = v1;
  v4 = type metadata accessor for IndexPath(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)v42 - v9;
  v11 = type metadata accessor for TTRIIntentsSnippetViewController.ViewModel(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = IndexPath.row.getter(v13);
  v17 = OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel;
  if (v16 < *(_QWORD *)(*(_QWORD *)(v2
                                   + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel)
                       + 16))
  {
    v18 = IndexPath.row.getter(v16);
    if ((v18 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      v19 = *(_QWORD *)(v2 + v17);
      if (v18 < *(_QWORD *)(v19 + 16))
      {
        sub_100021858(v19+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(_QWORD *)(v12 + 72) * v18, (uint64_t)v15);
        if (swift_getEnumCaseMultiPayload(v15, v11) == 1)
        {
          v20 = *(void **)v15;
          v21 = *(_OWORD *)(v15 + 88);
          v42[4] = *(_OWORD *)(v15 + 72);
          v42[5] = v21;
          v22 = *(_OWORD *)(v15 + 120);
          v42[6] = *(_OWORD *)(v15 + 104);
          v42[7] = v22;
          v23 = *(_OWORD *)(v15 + 24);
          v42[0] = *(_OWORD *)(v15 + 8);
          v42[1] = v23;
          v24 = *(_OWORD *)(v15 + 56);
          v42[2] = *(_OWORD *)(v15 + 40);
          v42[3] = v24;

          v25 = sub_10001B2FC(a1, v42);
          sub_1000217BC((uint64_t)v42);
        }
        else
        {
          v37 = *(_QWORD *)v15;
          v38 = *((_QWORD *)v15 + 1);
          v39 = sub_10000EFCC(&qword_10002E5F8);
          v40 = (uint64_t)&v15[*(int *)(v39 + 48)];
          v25 = sub_10001B630(a1, v37, v38, v15[*(int *)(v39 + 64)]);
          swift_bridgeObjectRelease(v38);
          sub_100013834(v40, &qword_10002E600);
        }
        return (id)v25;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
  if (qword_10002E048 != -1)
LABEL_15:
    swift_once(&qword_10002E048, sub_10001A964);
  v26 = type metadata accessor for Logger(0);
  sub_100015A84(v26, (uint64_t)qword_10002E460);
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v27(v10, a1, v4);
  v28 = ((uint64_t (*)(char *, uint64_t, uint64_t))v27)(v8, a1, v4);
  v29 = Logger.logObject.getter(v28);
  v30 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = swift_slowAlloc(22, -1);
    *(_DWORD *)v31 = 134218240;
    v32 = IndexPath.section.getter();
    v33 = *(void (**)(char *, uint64_t))(v5 + 8);
    v33(v10, v4);
    *(_QWORD *)&v42[0] = v32;
    v34 = UnsafeMutableRawBufferPointer.copyMemory(from:)(v42, (char *)v42 + 8, v31 + 4, v31 + 12);
    *(_WORD *)(v31 + 12) = 2048;
    v35 = IndexPath.row.getter(v34);
    v33(v8, v4);
    *(_QWORD *)&v42[0] = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v42, (char *)v42 + 8, v31 + 14, v31 + 22);
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Got asked for path {section: %ld, row: %ld} with no coresponding item", (uint8_t *)v31, 0x16u);
    swift_slowDealloc(v31, -1, -1);
  }
  else
  {
    v36 = *(void (**)(char *, uint64_t))(v5 + 8);
    v36(v8, v4);
    v36(v10, v4);
  }

  return objc_msgSend(objc_allocWithZone((Class)UITableViewCell), "init");
}

id sub_100020948()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (**v15)(uint64_t, uint64_t, char *);
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  id result;
  unsigned int (*v22)(uint64_t, uint64_t, char *);
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  void *v33;
  uint64_t v34;
  char *v35;
  unsigned int (**v36)(uint64_t, uint64_t, char *);
  char *v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  void *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int (**v45)(uint64_t, uint64_t, char *);
  char *v46;
  uint64_t v47;
  _OWORD v48[9];

  v44 = type metadata accessor for URL(0);
  v43 = *(_QWORD *)(v44 - 8);
  __chkstk_darwin(v44);
  v2 = (char *)&v42 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for REMNavigationSpecifier(0);
  v45 = *(unsigned int (***)(uint64_t, uint64_t, char *))(v3 - 8);
  v46 = (char *)v3;
  v4 = __chkstk_darwin(v3);
  v42 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v7 = (char **)((char *)&v42 - v6);
  v8 = type metadata accessor for TTRIIntentsSnippetViewController.ViewModel(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10);
  v15 = (unsigned int (**)(uint64_t, uint64_t, char *))((char *)&v42 - v14);
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v42 - v17;
  v19 = __chkstk_darwin(v16);
  v47 = (uint64_t)&v42 - v20;
  result = (id)IndexPath.row.getter(v19);
  v22 = (unsigned int (*)(uint64_t, uint64_t, char *))OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel;
  if ((uint64_t)result < *(_QWORD *)(*(_QWORD *)(v0
                                               + OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel)
                                   + 16))
  {
    v23 = IndexPath.row.getter(result);
    if ((v23 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      v24 = *(_QWORD *)((char *)v22 + v0);
      if (v23 < *(_QWORD *)(v24 + 16))
      {
        v25 = v47;
        sub_100021858(v24+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v23, v47);
        sub_100021858(v25, (uint64_t)v18);
        if (swift_getEnumCaseMultiPayload(v18, v8) != 1)
        {
          sub_100021858((uint64_t)v18, (uint64_t)v12);
          swift_bridgeObjectRelease(*((_QWORD *)v12 + 1));
          v34 = (uint64_t)&v12[*(int *)(sub_10000EFCC(&qword_10002E5F8) + 48)];
          v36 = v45;
          v35 = v46;
          if (v45[6](v34, 1, v46) == 1)
          {
            sub_10001E2EC(v47);
            sub_100013834(v34, &qword_10002E600);
            return (id)sub_10001E2EC((uint64_t)v18);
          }
          v37 = v42;
          v36[4]((uint64_t)v42, v34, v35);
          if (qword_10002E048 != -1)
            swift_once(&qword_10002E048, sub_10001A964);
          v38 = type metadata accessor for Logger(0);
          sub_100015A84(v38, (uint64_t)qword_10002E460);
          REMNavigationSpecifier.url.getter();
          sub_1000155F0(0x696E532069726953, 0xEC00000074657070, 0x7265646E696D6552, 0xED00007473694C20, (uint64_t)v2);
          v39 = *(void (**)(char *, uint64_t))(v43 + 8);
          v40 = v44;
          v39(v2, v44);
          result = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
          if (result)
          {
            v41 = result;
            REMNavigationSpecifier.url.getter();
            LSApplicationWorkspace.open(universalLink:)(v2);

            v39(v2, v40);
            ((void (*)(char *, char *))v36[1])(v37, v35);
            goto LABEL_14;
          }
LABEL_21:
          __break(1u);
          return result;
        }
        sub_100021858((uint64_t)v18, (uint64_t)v15);
        v22 = *v15;
        v26 = *(_OWORD *)(v15 + 11);
        v48[4] = *(_OWORD *)(v15 + 9);
        v48[5] = v26;
        v27 = *(_OWORD *)(v15 + 15);
        v48[6] = *(_OWORD *)(v15 + 13);
        v48[7] = v27;
        v28 = *(_OWORD *)(v15 + 3);
        v48[0] = *(_OWORD *)(v15 + 1);
        v48[1] = v28;
        v29 = *(_OWORD *)(v15 + 7);
        v48[2] = *(_OWORD *)(v15 + 5);
        v48[3] = v29;
        sub_1000217BC((uint64_t)v48);
        sub_10000EFCC(&qword_10002E738);
        *v7 = objc_msgSend(v22, "remObjectID");
        static REMNavigationSpecifier.ReminderPathSpecifier.showInList.getter();
        v15 = v45;
        v12 = v46;
        v45[13]((uint64_t)v7, enum case for REMNavigationSpecifier.reminder(_:), v46);
        if (qword_10002E048 == -1)
        {
LABEL_6:
          v30 = type metadata accessor for Logger(0);
          sub_100015A84(v30, (uint64_t)qword_10002E460);
          REMNavigationSpecifier.url.getter();
          sub_1000155F0(0x696E532069726953, 0xEC00000074657070, 0x7265646E696D6552, 0xE800000000000000, (uint64_t)v2);
          v31 = *(void (**)(char *, uint64_t))(v43 + 8);
          v32 = v44;
          v31(v2, v44);
          result = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
          if (result)
          {
            v33 = result;
            REMNavigationSpecifier.url.getter();
            LSApplicationWorkspace.open(universalLink:)(v2);

            v31(v2, v32);
            ((void (*)(_QWORD *, char *))v15[1])(v7, v12);
LABEL_14:
            sub_10001E2EC(v47);
            return (id)sub_10001E2EC((uint64_t)v18);
          }
          __break(1u);
          goto LABEL_21;
        }
LABEL_19:
        swift_once(&qword_10002E048, sub_10001A964);
        goto LABEL_6;
      }
    }
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

id sub_100020E8C(void *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = objc_msgSend(a1, "intentResponse");
  if (!v2)
  {
LABEL_5:
    v7 = objc_msgSend(a1, "intentResponse");
    if (v7)
    {
      v8 = v7;
      v9 = objc_opt_self(INCreateTaskListIntentResponse);
      v10 = (void *)swift_dynamicCastObjCClass(v8, v9);
      if (v10)
      {
        v6 = objc_msgSend(v10, "createdTaskList");

        return v6;
      }

    }
    return 0;
  }
  v3 = v2;
  v4 = objc_opt_self(INAddTasksIntentResponse);
  v5 = (void *)swift_dynamicCastObjCClass(v3, v4);
  if (!v5)
  {

    goto LABEL_5;
  }
  v6 = objc_msgSend(v5, "modifiedTaskList");

  return v6;
}

void sub_100020F70(void *a1, char a2, CGFloat a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  __n128 v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  Class isa;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  int v30;
  _DWORD *v31;
  _DWORD *v32;
  char *v33;
  uint64_t *v34;
  uint64_t *v35;
  __n128 v36;
  _DWORD *v37;
  int v38;
  NSObject *v39;
  char *v40;
  uint64_t *v41;
  unint64_t v42;
  CGFloat MaxY;
  uint64_t v44;
  char v45[24];
  _QWORD v46[2];
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v6 = type metadata accessor for IndexPath(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46[0] = 0;
  v10 = (unint64_t)objc_msgSend(a1, "numberOfSections");
  if ((v10 & 0x8000000000000000) == 0)
  {
    v11 = v10;
    if (!v10)
    {
LABEL_18:
      swift_beginAccess(v46, &MaxY, 0, 0);
      return;
    }
    v12 = swift_beginAccess(v46, v45, 1, 0);
    v13 = 0;
    v40 = (char *)&MaxY + 4;
    v41 = &v44;
    v12.n128_u64[0] = 134219520;
    v36 = v12;
    v42 = v11;
    while (v13 != v11)
    {
      v14 = (unint64_t)objc_msgSend(a1, "numberOfRowsInSection:", v13);
      if ((v14 & 0x8000000000000000) != 0)
        goto LABEL_21;
      v15 = v14;
      if (v14)
      {
        v16 = 0.0;
        while (1)
        {
          if (v15 == *(_QWORD *)&v16)
          {
            __break(1u);
            goto LABEL_20;
          }
          IndexPath.init(row:section:)(*(_QWORD *)&v16, v13);
          isa = IndexPath._bridgeToObjectiveC()().super.isa;
          (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
          objc_msgSend(a1, "rectForRowAtIndexPath:", isa);
          v19 = v18;
          v21 = v20;
          v23 = v22;
          v25 = v24;

          if ((a2 & 1) != 0)
          {
            v48.origin.x = v19;
            v48.origin.y = v21;
            v48.size.width = v23;
            v48.size.height = v25;
            if (CGRectGetMaxY(v48) > a3)
              break;
          }
          ++*(_QWORD *)&v16;
          v47.origin.x = v19;
          v47.origin.y = v21;
          v47.size.width = v23;
          v47.size.height = v25;
          v46[0] = CGRectGetMaxY(v47);
          if (v15 == *(_QWORD *)&v16)
            goto LABEL_5;
        }
        if (qword_10002E048 != -1)
          swift_once(&qword_10002E048, sub_10001A964);
        v26 = type metadata accessor for Logger(0);
        sub_100015A84(v26, (uint64_t)qword_10002E460);
        sub_10001E72C();
        sub_10001E72C();
        sub_10001E72C();
        sub_10001E72C();
        sub_10001E72C();
        v27 = sub_10001E72C();
        v28 = Logger.logObject.getter(v27);
        v29 = static os_log_type_t.debug.getter();
        v30 = v29;
        if (os_log_type_enabled(v28, v29))
        {
          v31 = (_DWORD *)swift_slowAlloc(60, -1);
          v38 = v30;
          v32 = v31;
          *v31 = v36.n128_u32[0];
          MaxY = v16;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&MaxY, v41, v31 + 1, v31 + 3);
          *((_WORD *)v32 + 6) = 1040;
          LODWORD(MaxY) = 1;
          v39 = v28;
          v33 = v40;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&MaxY, v40, (char *)v32 + 14, (char *)v32 + 18);
          *((_WORD *)v32 + 9) = 2048;
          v37 = v32 + 5;
          v49.origin.x = v19;
          v49.origin.y = v21;
          v49.size.width = v23;
          v49.size.height = v25;
          MaxY = CGRectGetMaxY(v49);
          v34 = v41;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&MaxY, v41, v37, v32 + 7);
          *((_WORD *)v32 + 14) = 1040;
          LODWORD(MaxY) = 1;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&MaxY, v33, (char *)v32 + 30, (char *)v32 + 34);
          *((_WORD *)v32 + 17) = 2048;
          MaxY = *(double *)v46;
          v35 = v34;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&MaxY, v34, v32 + 9, v32 + 11);
          *((_WORD *)v32 + 22) = 1040;
          LODWORD(MaxY) = 1;
          v28 = v39;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&MaxY, v40, (char *)v32 + 46, (char *)v32 + 50);
          *((_WORD *)v32 + 25) = 2048;
          MaxY = a3;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&MaxY, v35, v32 + 13, v32 + 15);
          _os_log_impl((void *)&_mh_execute_header, v28, (os_log_type_t)v38, "Adding row %ld would be too large to fit, stopping at previous height. { currentRowMaxY:  %.*f, previousMaxY: %.*f, maxHeight: %.*f}", (uint8_t *)v32, 0x3Cu);
          swift_slowDealloc(v32, -1, -1);
        }

      }
LABEL_5:
      ++v13;
      v11 = v42;
      if (v13 == v42)
        goto LABEL_18;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
  }
  __break(1u);
}

void sub_100021354(uint64_t a1, void *a2, void (*a3)(uint64_t, uint64_t, __n128, __n128), __n128 a4, __n128 a5)
{
  char *v5;
  char *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  void *Strong;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;

  if (!a1)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v6 = v5;
  v9 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 >= 0)
      a1 &= 0xFFFFFFFFFFFFFF8uLL;
    if (__CocoaSet.count.getter(a1))
    {
LABEL_6:
      if (a3)
      {
LABEL_7:
        a4.n128_u64[0] = 0;
        a5.n128_u64[0] = 0;
LABEL_8:
        v10 = v9;
LABEL_9:
        a3(1, v10, a4, a5);
        return;
      }
      goto LABEL_29;
    }
  }
  else if (*(_QWORD *)(a1 + 16))
  {
    goto LABEL_6;
  }
  sub_10001BE7C(a2);
  if (!v11)
  {
    if (a3)
      goto LABEL_7;
    __break(1u);
    goto LABEL_26;
  }
  v12 = v11;
  sub_10001BBF8(v11);
  if (!a2)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  sub_10001D000(v12, a2);
  swift_bridgeObjectRelease(v12);
  v13 = objc_msgSend(v5, "extensionContext");
  if (v13)
  {
    v14 = v13;
    objc_msgSend(v13, "hostedViewMinimumAllowedSize");
    v16 = v15;
    v18 = v17;

    v19 = objc_msgSend(v6, "extensionContext");
    if (v19)
    {
      v20 = v19;
      objc_msgSend(v19, "hostedViewMaximumAllowedSize");
      v22 = v21;
      v24 = v23;

      a4.n128_f64[0] = sub_10001D6E8(1, v25, v16, v18, v22, v24);
      if (a3)
        goto LABEL_8;
      __break(1u);
    }
  }
  if (qword_10002E048 != -1)
    swift_once(&qword_10002E048, sub_10001A964);
  v26 = type metadata accessor for Logger(0);
  v27 = sub_100015A84(v26, (uint64_t)qword_10002E460);
  v28 = Logger.logObject.getter(v27);
  v29 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "Unable to determine hostedViewMinimumAllowedSize", v30, 2u);
    swift_slowDealloc(v30, -1, -1);
  }

  if (a3)
  {
    Strong = (void *)swift_unknownObjectWeakLoadStrong(&v6[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_tableView], v31);
    if (Strong)
    {
      v33 = Strong;
      objc_msgSend(Strong, "contentSize");
      v35 = v34;
      v37 = v36;

LABEL_27:
      v10 = v9;
      a4.n128_u64[0] = v35;
      a5.n128_u64[0] = v37;
      goto LABEL_9;
    }
LABEL_26:
    v37 = 0;
    v35 = 0;
    goto LABEL_27;
  }
LABEL_31:
  __break(1u);
}

uint64_t sub_1000215CC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000215F0(char a1, uint64_t a2, double a3, double a4)
{
  uint64_t v4;

  sub_10001E668(a1, a2, *(_QWORD *)(v4 + 16), a3, a4);
}

uint64_t sub_1000215F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100021634(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000EFCC(&qword_10002E600);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002167C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

id sub_10002169C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_10001B094(a2, a1, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), a3);
}

uint64_t sub_1000216A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000216E8(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_100013968(255, a2, a3);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100021728(__int128 *a1, uint64_t a2)
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

_QWORD *sub_100021740(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100021764(uint64_t a1)
{
  sub_10001A3C4(*(void **)a1, *(void **)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(void **)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(void **)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120));
  return a1;
}

uint64_t sub_1000217BC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char v10;

  v2 = *(void **)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(void **)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *(void **)(a1 + 96);
  v9 = *(_QWORD *)(a1 + 120);
  v10 = *(_BYTE *)(a1 + 88);

  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v5);
  sub_10001A290(v6, v7, v10);

  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t sub_100021858(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TTRIIntentsSnippetViewController.ViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002189C()
{
  uint64_t v0;

  return TTRReminderEditor.edit(completed:trackEditedUsing:)(objc_msgSend(*(id *)(v0 + 16), "isCompleted") ^ 1, 0);
}

uint64_t sub_1000218D8()
{
  uint64_t v0;
  int v1;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 72));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 88));
  v1 = *(unsigned __int8 *)(v0 + 112);
  if (v1 != 255)
    sub_100015B8C(*(void **)(v0 + 96), *(_QWORD *)(v0 + 104), v1);

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 144));
  return swift_deallocObject(v0, 152, 7);
}

uint64_t sub_100021948(uint64_t a1)
{
  uint64_t v1;

  return sub_10001EC5C(a1, *(_QWORD *)(v1 + 16), (__int128 *)(v1 + 24));
}
