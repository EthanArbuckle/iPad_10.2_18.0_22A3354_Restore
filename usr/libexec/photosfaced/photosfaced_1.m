uint64_t sub_1000822CC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v0[28] = v0[118];
  v1 = (_QWORD *)swift_task_alloc(async function pointer to Sequence.asyncMap<A>(predicate:)[1]);
  v0[119] = v1;
  v2 = sub_10000629C(&qword_1000B3DA8);
  v3 = sub_100006454(&qword_1000B3DB0, &qword_1000B3DA8, (uint64_t)&protocol conformance descriptor for [A]);
  *v1 = v0;
  v1[1] = sub_100082370;
  return Sequence.asyncMap<A>(predicate:)(&unk_1000B4108, v0[117], v2, v0[37], v3);
}

uint64_t sub_100082370(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 952);
  *(_QWORD *)(*(_QWORD *)v2 + 960) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = sub_1000824CC;
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v9 = v4[118];
    swift_bridgeObjectRelease(a1);
    swift_bridgeObjectRelease(v9);
    v8 = v4[96];
    v7 = v4[95];
    v6 = sub_1000823FC;
  }
  return swift_task_switch(v6, v7, v8);
}

uint64_t sub_1000823FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 920))(*(_QWORD *)(v0 + 520), *(_QWORD *)(v0 + 432));
  v2 = *(_QWORD *)(v0 + 928);
  *(_QWORD *)(v0 + 880) = *(_QWORD *)(v0 + 912);
  *(_QWORD *)(v0 + 872) = v2;
  v3 = *(_QWORD *)(v0 + 752);
  v4 = static CommunicationActor.shared.getter(v1);
  *(_QWORD *)(v0 + 888) = v4;
  v5 = sub_100006454(&qword_1000B4100, &qword_1000B40E0, (uint64_t)&protocol conformance descriptor for AsyncThrowingMapSequence<A, B>.Iterator);
  v6 = (_QWORD *)swift_task_alloc(_sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTjTu[1]);
  *(_QWORD *)(v0 + 896) = v6;
  *v6 = v0;
  v6[1] = sub_1000800E0;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(*(_QWORD *)(v0 + 528), v4, v3, v0 + 96, *(_QWORD *)(v0 + 536), v5);
}

uint64_t sub_1000824CC()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[118]);
  return swift_task_switch(sub_100082508, v0[95], v0[96]);
}

void sub_100082508()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __n128 v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void (*v17)(unint64_t, uint64_t, uint64_t);
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t KeyPath;
  uint64_t v58;
  unint64_t *v59;
  unint64_t v60;
  uint64_t v61;
  int v62;
  void (*v63)(uint64_t, unint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t, _QWORD, uint64_t, uint64_t);
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t (*v74)(uint64_t, uint64_t, uint64_t, __n128);
  void (*v75)(uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __n128 v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  os_log_type_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  void (*v93)(uint64_t, uint64_t);
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
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
  _QWORD *v118;
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
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void (*v176)(uint64_t, uint64_t);
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void (*v181)(uint64_t, uint64_t);
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  _QWORD *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194[3];

  v1 = *(_QWORD *)(v0 + 552);
  v2 = *(_QWORD *)(v0 + 544);
  v3 = *(_QWORD *)(v0 + 536);
  (*(void (**)(_QWORD, _QWORD))(v0 + 920))(*(_QWORD *)(v0 + 520), *(_QWORD *)(v0 + 432));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = *(_QWORD *)(v0 + 960);
  v5 = *(_QWORD *)(v0 + 912);
  *(_QWORD *)(v0 + 976) = v5;
  *(_QWORD *)(v0 + 968) = v4;
  *(_QWORD *)(v0 + 984) = sub_100009174(&qword_1000B29F0, (uint64_t (*)(uint64_t))&type metadata accessor for AlbumID, (uint64_t)&protocol conformance descriptor for AlbumID);
  v6 = swift_bridgeObjectRetain(v5);
  v7 = static SyncedPhotosFace.destreamify(_:)(v6);
  v8 = swift_bridgeObjectRelease(v5);
  *(_QWORD *)(v0 + 88) = v7;
  v9 = v0 + 88;
  if (v4)
  {
    v194[0] = (uint64_t)_swiftEmptyArrayStorage;
    v10 = *(_QWORD *)(v7 + 16);
    v11 = swift_bridgeObjectRetain(v7);
    if (v10)
    {
      v12 = 0;
      v190 = _swiftEmptyArrayStorage;
      while (v12 < *(_QWORD *)(v7 + 16))
      {
        v14 = *(_QWORD *)(v0 + 432);
        v13 = *(_QWORD *)(v0 + 440);
        v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
        v16 = *(_QWORD *)(v13 + 72);
        (*(void (**)(_QWORD, unint64_t, uint64_t, __n128))(v13 + 16))(*(_QWORD *)(v0 + 480), v7 + v15 + v16 * v12, v14, v11);
        if ((SyncedPhotosFace.complete.getter(v14) & 1) != 0)
        {
          v17 = *(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 440) + 32);
          v17(*(_QWORD *)(v0 + 472), *(_QWORD *)(v0 + 480), *(_QWORD *)(v0 + 432));
          v18 = (uint64_t)v190;
          if ((swift_isUniquelyReferenced_nonNull_native(v190) & 1) == 0)
          {
            sub_10004D880(0, v190[2] + 1, 1);
            v18 = v194[0];
          }
          v20 = *(_QWORD *)(v18 + 16);
          v19 = *(_QWORD *)(v18 + 24);
          if (v20 >= v19 >> 1)
          {
            sub_10004D880(v19 > 1, v20 + 1, 1);
            v18 = v194[0];
          }
          v21 = *(_QWORD *)(v0 + 472);
          v22 = *(_QWORD *)(v0 + 432);
          *(_QWORD *)(v18 + 16) = v20 + 1;
          v190 = (_QWORD *)v18;
          v17(v18 + v15 + v20 * v16, v21, v22);
        }
        else
        {
          (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 440) + 8))(*(_QWORD *)(v0 + 480), *(_QWORD *)(v0 + 432));
        }
        if (v10 == ++v12)
          goto LABEL_15;
      }
      __break(1u);
      return;
    }
    v190 = _swiftEmptyArrayStorage;
LABEL_15:
    v9 = v0 + 88;
    v24 = swift_bridgeObjectRelease(v7);
    static Log.session.getter(v24);
    v23 = (uint64_t)v190;
    v25 = swift_retain(v190);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = swift_slowAlloc(22, -1);
      *(_DWORD *)v28 = 134218240;
      *(_QWORD *)(v0 + 200) = v190[2];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 200, v0 + 208, v28 + 4, v28 + 12);
      swift_release(v190);
      *(_WORD *)(v28 + 12) = 2048;
      swift_beginAccess(v0 + 88, v0 + 16, 0, 0);
      *(_QWORD *)(v0 + 216) = *(_QWORD *)(*(_QWORD *)(v0 + 88) + 16);
      v9 = v0 + 88;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 216, v0 + 224, v28 + 14, v28 + 22);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "An error occurred during sync. Only %ld / %ld finished successfully.", (uint8_t *)v28, 0x16u);
      swift_slowDealloc(v28, -1, -1);
    }
    else
    {
      swift_release(v190);
    }

    (*(void (**)(_QWORD, _QWORD))(v0 + 840))(*(_QWORD *)(v0 + 648), *(_QWORD *)(v0 + 592));
    swift_beginAccess(v9, v0 + 40, 1, 0);
    v29 = *(_QWORD *)(v0 + 88);
    *(_QWORD *)(v0 + 88) = v190;
    v8 = swift_bridgeObjectRelease(v29);
  }
  else
  {
    v23 = v7;
  }
  v191 = v9 - 24;
  v30 = v9 + 16;
  v31 = *(_QWORD *)(v0 + 288);
  static Log.session.getter(v8);
  swift_bridgeObjectRetain_n(v23, 3);
  v32 = swift_retain(v31);
  v33 = Logger.logObject.getter(v32);
  v34 = static os_log_type_t.default.getter();
  v184 = v9 + 80;
  if (os_log_type_enabled(v33, v34))
  {
    v158 = v9 + 96;
    v172 = *(_QWORD *)(v0 + 640);
    v176 = *(void (**)(uint64_t, uint64_t))(v0 + 840);
    v168 = *(_QWORD *)(v0 + 592);
    v161 = *(_QWORD *)(v0 + 288);
    v180 = v9 + 16;
    v35 = *(unsigned __int8 *)(v0 + 1248);
    v36 = swift_slowAlloc(32, -1);
    v164 = swift_slowAlloc(64, -1);
    v194[0] = v164;
    *(_DWORD *)v36 = 134218498;
    *(_QWORD *)(v0 + 168) = *(_QWORD *)(v23 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v9 + 80, v9 + 88, v36 + 4, v36 + 12);
    swift_bridgeObjectRelease(v23);
    *(_WORD *)(v36 + 12) = 2080;
    v37 = PhotosFaceType.description.getter(v35);
    v39 = v38;
    *(_QWORD *)(v0 + 176) = sub_100021438(v37, v38, v194);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v9 + 88, v9 + 96, v36 + 14, v36 + 22);
    swift_bridgeObjectRelease(v39);
    swift_release(v161);
    *(_WORD *)(v36 + 22) = 2080;
    v40 = sub_100086480(v23, (uint64_t (*)(uint64_t))&type metadata accessor for AlbumID, &qword_1000B25E8, &qword_1000B2A30, (uint64_t)&protocol conformance descriptor for AlbumID);
    swift_bridgeObjectRelease(v23);
    v41 = Array.description.getter(v40, &type metadata for String);
    v42 = v9;
    v44 = v43;
    swift_bridgeObjectRelease(v40);
    v45 = v41;
    v30 = v180;
    *(_QWORD *)(v0 + 184) = sub_100021438(v45, v44, v194);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v158, v0 + 192, v36 + 24, v36 + 32);
    swift_bridgeObjectRelease(v44);
    swift_bridgeObjectRelease(v23);
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Did syncFaces (%ld) for type %s: %s", (uint8_t *)v36, 0x20u);
    swift_arrayDestroy(v164, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v164, -1, -1);
    swift_slowDealloc(v36, -1, -1);

    v176(v172, v168);
  }
  else
  {
    v46 = *(void (**)(uint64_t, uint64_t))(v0 + 840);
    v47 = *(_QWORD *)(v0 + 640);
    v48 = *(_QWORD *)(v0 + 592);
    v49 = *(_QWORD *)(v0 + 288);
    swift_bridgeObjectRelease_n(v23, 3);
    swift_release(v49);

    v46(v47, v48);
    v42 = v9;
  }
  v50 = *(_QWORD *)(v0 + 784);
  v51 = *(_QWORD *)(v0 + 776);
  v52 = *(_QWORD *)(v0 + 720);
  v53 = *(_QWORD *)(v0 + 712);
  v54 = *(_QWORD *)(v0 + 328);
  swift_beginAccess(v42, v191, 0, 0);
  v55 = *(_QWORD *)(v0 + 88);
  v56 = (_QWORD *)swift_task_alloc(48);
  *v56 = v54;
  v56[1] = v51;
  v56[2] = v53;
  v56[3] = v50;
  v56[4] = v52;
  KeyPath = swift_getKeyPath(&unk_100096E48);
  swift_task_dealloc(v56);
  swift_retain(KeyPath);
  swift_bridgeObjectRetain(v55);
  v59 = sub_10008BAA8(v58, KeyPath, v30, &qword_1000B25E8);
  *(_QWORD *)(v0 + 992) = v59;
  swift_release_n(KeyPath, 2);
  swift_bridgeObjectRelease(v55);
  v60 = v59[2];
  *(_QWORD *)(v0 + 1000) = v60;
  v61 = *(_QWORD *)(v0 + 376);
  if (v60)
  {
    v62 = *(_DWORD *)(v61 + 80);
    *(_DWORD *)(v0 + 1240) = v62;
    *(_QWORD *)(v0 + 1008) = *(_QWORD *)(v61 + 72);
    v63 = *(void (**)(uint64_t, unint64_t, uint64_t))(v61 + 16);
    *(_QWORD *)(v0 + 1016) = v63;
    v64 = *(_QWORD *)(v0 + 840);
    *(_QWORD *)(v0 + 1160) = 0;
    *(_QWORD *)(v0 + 1152) = v64;
    *(_QWORD *)(v0 + 1144) = v64;
    *(_QWORD *)(v0 + 1136) = v64;
    v65 = *(_QWORD *)(v0 + 368);
    v66 = *(_QWORD *)(v0 + 320);
    v63(v66, *(_QWORD *)(v0 + 992) + ((v62 + 32) & ~(unint64_t)v62), v65);
    v67 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v61 + 56);
    *(_QWORD *)(v0 + 1168) = v67;
    v67(v66, 0, 1, v65);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v66, 1, v65) != 1)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 376) + 32))(*(_QWORD *)(v0 + 408), *(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 368));
      v68 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of PhotosFaceIDDatabase.clearPhotos(for:)[1]);
      *(_QWORD *)(v0 + 1176) = v68;
      *v68 = v0;
      v68[1] = sub_1000846F8;
      dispatch thunk of PhotosFaceIDDatabase.clearPhotos(for:)(*(_QWORD *)(v0 + 408), *(_QWORD *)(v0 + 712), *(_QWORD *)(v0 + 720));
      return;
    }
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v61 + 56))(*(_QWORD *)(v0 + 320), 1, 1, *(_QWORD *)(v0 + 368));
  }
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 992));
  v69 = *(_QWORD *)(v0 + 88);
  *(_QWORD *)(v0 + 1024) = v69;
  v70 = *(_QWORD *)(v69 + 16);
  *(_QWORD *)(v0 + 1032) = v70;
  if (v70)
  {
    v72 = *(_QWORD *)(v0 + 432);
    v71 = *(_QWORD *)(v0 + 440);
    v73 = *(_DWORD *)(v71 + 80);
    *(_DWORD *)(v0 + 1244) = v73;
    *(_QWORD *)(v0 + 1040) = *(_QWORD *)(v71 + 72);
    v74 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128))(v71 + 16);
    *(_QWORD *)(v0 + 1048) = v74;
    v75 = *(void (**)(uint64_t, uint64_t))(v0 + 840);
    *(_QWORD *)(v0 + 1064) = 0;
    *(_QWORD *)(v0 + 1056) = v75;
    v77 = *(_QWORD *)(v0 + 456);
    v76 = *(_QWORD *)(v0 + 464);
    v78 = *(_QWORD *)(v0 + 288);
    v79 = v69 + ((v73 + 32) & ~(unint64_t)v73);
    v80 = swift_bridgeObjectRetain(v69);
    v81 = v74(v76, v79, v72, v80);
    static Log.photos.getter(v81);
    ((void (*)(uint64_t, uint64_t, uint64_t))v74)(v77, v76, v72);
    v82 = swift_retain(v78);
    v83 = Logger.logObject.getter(v82);
    v84 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v83, v84))
    {
      v192 = *(_QWORD *)(v0 + 632);
      v187 = *(_QWORD *)(v0 + 592);
      v85 = *(_QWORD *)(v0 + 456);
      v86 = *(_QWORD *)(v0 + 432);
      v165 = *(_QWORD *)(v0 + 440);
      v181 = v75;
      v87 = *(_QWORD *)(v0 + 360);
      v173 = *(_QWORD *)(v0 + 336);
      v169 = *(_QWORD *)(v0 + 328);
      v155 = *(_QWORD *)(v0 + 288);
      v88 = *(unsigned __int8 *)(v0 + 1248);
      v89 = swift_slowAlloc(22, -1);
      v177 = swift_slowAlloc(64, -1);
      v194[0] = v177;
      *(_DWORD *)v89 = 136315394;
      v90 = PhotosFaceType.description.getter(v88);
      v92 = v91;
      *(_QWORD *)(v0 + 152) = sub_100021438(v90, v91, v194);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 152, v0 + 160, v89 + 4, v89 + 12);
      swift_bridgeObjectRelease(v92);
      swift_release(v155);
      *(_WORD *)(v89 + 12) = 2080;
      SyncedPhotosFace.id.getter(v86);
      v93 = *(void (**)(uint64_t, uint64_t))(v165 + 8);
      v93(v85, v86);
      v94 = sub_100009174(&qword_1000B2A30, (uint64_t (*)(uint64_t))&type metadata accessor for AlbumID, (uint64_t)&protocol conformance descriptor for AlbumID);
      v95 = dispatch thunk of CustomStringConvertible.description.getter(v169, v94);
      v97 = v96;
      (*(void (**)(uint64_t, uint64_t))(v173 + 8))(v87, v169);
      *(_QWORD *)(v0 + 160) = sub_100021438(v95, v97, v194);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 160, v184, v89 + 14, v89 + 22);
      swift_bridgeObjectRelease(v97);
      _os_log_impl((void *)&_mh_execute_header, v83, v84, "Inserting face, type = %s: %s", (uint8_t *)v89, 0x16u);
      swift_arrayDestroy(v177, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v177, -1, -1);
      swift_slowDealloc(v89, -1, -1);

      v181(v192, v187);
    }
    else
    {
      v115 = *(_QWORD *)(v0 + 632);
      v116 = *(_QWORD *)(v0 + 592);
      v117 = *(_QWORD *)(v0 + 288);
      v93 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 440) + 8);
      v93(*(_QWORD *)(v0 + 456), *(_QWORD *)(v0 + 432));
      swift_release(v117);

      v75(v115, v116);
    }
    *(_QWORD *)(v0 + 1072) = v93;
    SyncedPhotosFace.id.getter(*(_QWORD *)(v0 + 432));
    v118 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of PhotosFaceIDDatabase.insert(id:)[1]);
    *(_QWORD *)(v0 + 1080) = v118;
    *v118 = v0;
    v118[1] = sub_100083424;
    dispatch thunk of PhotosFaceIDDatabase.insert(id:)(*(_QWORD *)(v0 + 352), *(_QWORD *)(v0 + 712), *(_QWORD *)(v0 + 720));
  }
  else
  {
    v98 = *(_QWORD *)(v0 + 704);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 976));
    v99 = swift_release(v98);
    if (*(_QWORD *)(*(_QWORD *)(v0 + 88) + 16))
      v99 = sub_100022934(*(unsigned __int8 *)(v0 + 1248));
    v100 = *(_QWORD *)(v0 + 688);
    v101 = *(_QWORD *)(v0 + 680);
    v102 = *(_QWORD *)(v0 + 672);
    v103 = *(_QWORD *)(v0 + 584);
    v104 = *(_QWORD *)(v0 + 568);
    v105 = *(_QWORD *)(v0 + 560);
    if (*(_QWORD *)(v0 + 968))
    {
      swift_willThrow(v99);
      (*(void (**)(uint64_t, uint64_t))(v104 + 8))(v103, v105);
      (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v100, v102);
      swift_bridgeObjectRelease(*(_QWORD *)(v0 + 88));
      v106 = *(_QWORD *)(v0 + 664);
      v107 = *(_QWORD *)(v0 + 656);
      v108 = *(_QWORD *)(v0 + 648);
      v109 = *(_QWORD *)(v0 + 640);
      v110 = *(_QWORD *)(v0 + 632);
      v111 = *(_QWORD *)(v0 + 624);
      v112 = *(_QWORD *)(v0 + 616);
      v113 = *(_QWORD *)(v0 + 608);
      v114 = *(_QWORD *)(v0 + 584);
      v128 = *(_QWORD *)(v0 + 576);
      v129 = *(_QWORD *)(v0 + 552);
      v131 = *(_QWORD *)(v0 + 528);
      v133 = *(_QWORD *)(v0 + 520);
      v135 = *(_QWORD *)(v0 + 512);
      v137 = *(_QWORD *)(v0 + 504);
      v139 = *(_QWORD *)(v0 + 496);
      v141 = *(_QWORD *)(v0 + 488);
      v143 = *(_QWORD *)(v0 + 480);
      v145 = *(_QWORD *)(v0 + 472);
      v147 = *(_QWORD *)(v0 + 464);
      v149 = *(_QWORD *)(v0 + 456);
      v151 = *(_QWORD *)(v0 + 448);
      v153 = *(_QWORD *)(v0 + 424);
      v156 = *(_QWORD *)(v0 + 416);
      v159 = *(_QWORD *)(v0 + 408);
      v162 = *(_QWORD *)(v0 + 400);
      v166 = *(_QWORD *)(v0 + 392);
      v170 = *(_QWORD *)(v0 + 384);
      v174 = *(_QWORD *)(v0 + 360);
      v178 = *(_QWORD *)(v0 + 352);
      v182 = *(_QWORD *)(v0 + 344);
      v185 = *(_QWORD *)(v0 + 320);
      v188 = *(_QWORD *)(v0 + 312);
      swift_task_dealloc(*(_QWORD *)(v0 + 688));
      swift_task_dealloc(v106);
      swift_task_dealloc(v107);
      swift_task_dealloc(v108);
      swift_task_dealloc(v109);
      swift_task_dealloc(v110);
      swift_task_dealloc(v111);
      swift_task_dealloc(v112);
      swift_task_dealloc(v113);
      swift_task_dealloc(v114);
      swift_task_dealloc(v128);
      swift_task_dealloc(v129);
      swift_task_dealloc(v131);
      swift_task_dealloc(v133);
      swift_task_dealloc(v135);
      swift_task_dealloc(v137);
      swift_task_dealloc(v139);
      swift_task_dealloc(v141);
      swift_task_dealloc(v143);
      swift_task_dealloc(v145);
      swift_task_dealloc(v147);
      swift_task_dealloc(v149);
      swift_task_dealloc(v151);
      swift_task_dealloc(v153);
      swift_task_dealloc(v156);
      swift_task_dealloc(v159);
      swift_task_dealloc(v162);
      swift_task_dealloc(v166);
      swift_task_dealloc(v170);
      swift_task_dealloc(v174);
      swift_task_dealloc(v178);
      swift_task_dealloc(v182);
      swift_task_dealloc(v185);
      swift_task_dealloc(v188);
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(v104 + 8))(*(_QWORD *)(v0 + 584), *(_QWORD *)(v0 + 560));
      (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v100, v102);
      swift_bridgeObjectRelease(*(_QWORD *)(v0 + 88));
      v119 = *(_QWORD *)(v0 + 664);
      v120 = *(_QWORD *)(v0 + 656);
      v121 = *(_QWORD *)(v0 + 648);
      v122 = *(_QWORD *)(v0 + 640);
      v123 = *(_QWORD *)(v0 + 632);
      v124 = *(_QWORD *)(v0 + 624);
      v125 = *(_QWORD *)(v0 + 616);
      v126 = *(_QWORD *)(v0 + 608);
      v127 = *(_QWORD *)(v0 + 584);
      v130 = *(_QWORD *)(v0 + 576);
      v132 = *(_QWORD *)(v0 + 552);
      v134 = *(_QWORD *)(v0 + 528);
      v136 = *(_QWORD *)(v0 + 520);
      v138 = *(_QWORD *)(v0 + 512);
      v140 = *(_QWORD *)(v0 + 504);
      v142 = *(_QWORD *)(v0 + 496);
      v144 = *(_QWORD *)(v0 + 488);
      v146 = *(_QWORD *)(v0 + 480);
      v148 = *(_QWORD *)(v0 + 472);
      v150 = *(_QWORD *)(v0 + 464);
      v152 = *(_QWORD *)(v0 + 456);
      v154 = *(_QWORD *)(v0 + 448);
      v157 = *(_QWORD *)(v0 + 424);
      v160 = *(_QWORD *)(v0 + 416);
      v163 = *(_QWORD *)(v0 + 408);
      v167 = *(_QWORD *)(v0 + 400);
      v171 = *(_QWORD *)(v0 + 392);
      v175 = *(_QWORD *)(v0 + 384);
      v179 = *(_QWORD *)(v0 + 360);
      v183 = *(_QWORD *)(v0 + 352);
      v186 = *(_QWORD *)(v0 + 344);
      v189 = *(_QWORD *)(v0 + 320);
      v193 = *(_QWORD *)(v0 + 312);
      swift_task_dealloc(*(_QWORD *)(v0 + 688));
      swift_task_dealloc(v119);
      swift_task_dealloc(v120);
      swift_task_dealloc(v121);
      swift_task_dealloc(v122);
      swift_task_dealloc(v123);
      swift_task_dealloc(v124);
      swift_task_dealloc(v125);
      swift_task_dealloc(v126);
      swift_task_dealloc(v127);
      swift_task_dealloc(v130);
      swift_task_dealloc(v132);
      swift_task_dealloc(v134);
      swift_task_dealloc(v136);
      swift_task_dealloc(v138);
      swift_task_dealloc(v140);
      swift_task_dealloc(v142);
      swift_task_dealloc(v144);
      swift_task_dealloc(v146);
      swift_task_dealloc(v148);
      swift_task_dealloc(v150);
      swift_task_dealloc(v152);
      swift_task_dealloc(v154);
      swift_task_dealloc(v157);
      swift_task_dealloc(v160);
      swift_task_dealloc(v163);
      swift_task_dealloc(v167);
      swift_task_dealloc(v171);
      swift_task_dealloc(v175);
      swift_task_dealloc(v179);
      swift_task_dealloc(v183);
      swift_task_dealloc(v186);
      swift_task_dealloc(v189);
      swift_task_dealloc(v193);
    }
    (*(void (**)(void))(v0 + 8))();
  }
}

uint64_t sub_100083424()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 1080);
  *(_QWORD *)(*(_QWORD *)v1 + 1088) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = v2[128];
    v5 = v2[122];
    (*(void (**)(_QWORD, _QWORD))(v2[42] + 8))(v2[44], v2[41]);
    swift_bridgeObjectRelease(v4);
    swift_bridgeObjectRelease(v5);
    v6 = v2[96];
    v7 = v2[95];
    v8 = sub_10008393C;
  }
  else
  {
    v9 = v2[44];
    v10 = v2[41];
    v11 = *(void (**)(uint64_t, uint64_t))(v2[42] + 8);
    v2[137] = v11;
    v11(v9, v10);
    v6 = v2[96];
    v7 = v2[95];
    v8 = sub_1000834D4;
  }
  return swift_task_switch(v8, v7, v6);
}

uint64_t sub_1000834D4()
{
  _QWORD *v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  os_log_type_t type;
  uint64_t v46;
  NSObject *log;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  _QWORD *v51;
  unint64_t *v52;
  uint64_t v53[2];

  v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[131];
  v2 = v0[58];
  v3 = v0[56];
  v4 = v0[54];
  v5 = SyncedPhotosFace.photos.getter(v4);
  v6 = sub_10004F36C(v5);
  swift_bridgeObjectRelease(v5);
  v7 = SyncedPhotosFace.cached.getter(v4);
  v53[0] = (uint64_t)v6;
  v8 = sub_100017970(v7);
  v0[138] = v6;
  static Log.photos.getter(v8);
  v1(v3, v2, v4);
  v9 = swift_bridgeObjectRetain_n(v6, 3);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.debug.getter();
  v52 = v6;
  if (os_log_type_enabled(v10, v11))
  {
    v41 = (void (*)(uint64_t, uint64_t))v0[137];
    v42 = (void (*)(uint64_t, uint64_t))v0[134];
    v40 = v0[123];
    v50 = (void (*)(uint64_t, uint64_t))v0[105];
    v48 = v0[74];
    v49 = v0[78];
    v39 = v0[56];
    v13 = v0[53];
    v12 = v0[54];
    log = v10;
    v14 = v0[45];
    v43 = v0[46];
    v44 = v0[47];
    v15 = v0[41];
    v16 = swift_slowAlloc(32, -1);
    v46 = swift_slowAlloc(64, -1);
    *(_DWORD *)v16 = 134218498;
    v0[16] = v6[2];
    v51 = v0 + 105;
    v53[0] = v46;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 17, v16 + 4, v16 + 12);
    swift_bridgeObjectRelease(v6);
    *(_WORD *)(v16 + 12) = 2080;
    type = v11;
    SyncedPhotosFace.id.getter(v12);
    dispatch thunk of PhotosFaceID.id.getter(v15, v40);
    v41(v14, v15);
    v42(v39, v12);
    v17 = sub_100009174((unint64_t *)&qword_1000B28E8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v18 = dispatch thunk of CustomStringConvertible.description.getter(v43, v17);
    v20 = v19;
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v13, v43);
    v0[17] = sub_100021438(v18, v20, v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 17, v0 + 18, v16 + 14, v16 + 22);
    swift_bridgeObjectRelease(v20);
    *(_WORD *)(v16 + 22) = 2080;
    swift_bridgeObjectRetain(v6);
    v22 = Array.description.getter(v21, v43);
    v24 = v23;
    swift_bridgeObjectRelease(v6);
    v0[18] = sub_100021438(v22, v24, v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 18, v0 + 19, v16 + 24, v16 + 32);
    swift_bridgeObjectRelease(v24);
    swift_bridgeObjectRelease_n(v6, 2);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Relating photos %ld for face %s, photos = %s", (uint8_t *)v16, 0x20u);
    swift_arrayDestroy(v46, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v46, -1, -1);
    swift_slowDealloc(v16, -1, -1);

    v50(v49, v48);
  }
  else
  {
    v51 = v0 + 132;
    v25 = (void (*)(uint64_t, uint64_t))v0[132];
    v26 = v0[78];
    v27 = v0[74];
    ((void (*)(_QWORD, _QWORD))v0[134])(v0[56], v0[54]);
    swift_bridgeObjectRelease_n(v6, 3);

    v25(v26, v27);
  }
  v0[139] = *v51;
  v28 = (void (*)(uint64_t, uint64_t))v0[137];
  v29 = v0[123];
  v30 = v0[54];
  v31 = v0[43];
  v32 = v0[41];
  v33 = *(_QWORD *)(v0[36] + 80);
  v0[15] = v33;
  swift_retain(v33);
  SyncedPhotosFace.id.getter(v30);
  dispatch thunk of PhotosFaceID.id.getter(v32, v29);
  v28(v31, v32);
  v34 = SyncedPhotosFace.day.getter(v30);
  if ((v35 & 1) != 0)
    v36 = 0;
  else
    v36 = v34;
  v37 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of PhotosFaceIDDatabase.relate(photos:to:on:)[1]);
  v0[140] = v37;
  *v37 = v0;
  v37[1] = sub_100083BC4;
  return dispatch thunk of PhotosFaceIDDatabase.relate(photos:to:on:)(v52, v0[52], v36, v0[89], v0[90]);
}

uint64_t sub_10008393C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
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

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 1072);
  v2 = *(_QWORD *)(v0 + 968);
  v44 = *(_QWORD *)(v0 + 688);
  v3 = *(_QWORD *)(v0 + 680);
  v4 = *(_QWORD *)(v0 + 672);
  v5 = *(_QWORD *)(v0 + 584);
  v6 = *(_QWORD *)(v0 + 568);
  v7 = *(_QWORD *)(v0 + 560);
  v8 = *(_QWORD *)(v0 + 464);
  v9 = *(_QWORD *)(v0 + 432);
  swift_release(*(_QWORD *)(v0 + 704));
  swift_errorRelease(v2);
  v1(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v44, v4);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 88));
  v10 = *(_QWORD *)(v0 + 664);
  v11 = *(_QWORD *)(v0 + 656);
  v12 = *(_QWORD *)(v0 + 648);
  v13 = *(_QWORD *)(v0 + 640);
  v14 = *(_QWORD *)(v0 + 632);
  v15 = *(_QWORD *)(v0 + 624);
  v16 = *(_QWORD *)(v0 + 616);
  v17 = *(_QWORD *)(v0 + 608);
  v18 = *(_QWORD *)(v0 + 584);
  v20 = *(_QWORD *)(v0 + 576);
  v21 = *(_QWORD *)(v0 + 552);
  v22 = *(_QWORD *)(v0 + 528);
  v23 = *(_QWORD *)(v0 + 520);
  v24 = *(_QWORD *)(v0 + 512);
  v25 = *(_QWORD *)(v0 + 504);
  v26 = *(_QWORD *)(v0 + 496);
  v27 = *(_QWORD *)(v0 + 488);
  v28 = *(_QWORD *)(v0 + 480);
  v29 = *(_QWORD *)(v0 + 472);
  v30 = *(_QWORD *)(v0 + 464);
  v31 = *(_QWORD *)(v0 + 456);
  v32 = *(_QWORD *)(v0 + 448);
  v33 = *(_QWORD *)(v0 + 424);
  v34 = *(_QWORD *)(v0 + 416);
  v35 = *(_QWORD *)(v0 + 408);
  v36 = *(_QWORD *)(v0 + 400);
  v37 = *(_QWORD *)(v0 + 392);
  v38 = *(_QWORD *)(v0 + 384);
  v39 = *(_QWORD *)(v0 + 360);
  v40 = *(_QWORD *)(v0 + 352);
  v41 = *(_QWORD *)(v0 + 344);
  v42 = *(_QWORD *)(v0 + 320);
  v43 = *(_QWORD *)(v0 + 312);
  swift_task_dealloc(*(_QWORD *)(v0 + 688));
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100083BC4()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)();
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 1120);
  *(_QWORD *)(*(_QWORD *)v1 + 1128) = v0;
  swift_task_dealloc(v3);
  v4 = v2[138];
  if (v0)
  {
    v5 = v2[128];
    v6 = v2[122];
    v7 = v2[52];
    v8 = v2[46];
    v9 = v2[47];
    swift_bridgeObjectRelease(v4);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    swift_release(v2[15]);
    swift_bridgeObjectRelease(v5);
    swift_bridgeObjectRelease(v6);
    v10 = v2[96];
    v11 = v2[95];
    v12 = sub_100084470;
  }
  else
  {
    v13 = v2[52];
    v14 = v2[46];
    v15 = v2[47];
    swift_bridgeObjectRelease(v4);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    swift_release(v2[15]);
    v10 = v2[96];
    v11 = v2[95];
    v12 = sub_100083CA4;
  }
  return swift_task_switch(v12, v11, v10);
}

uint64_t sub_100083CA4()
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
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t (*v22)(unint64_t, unint64_t, uint64_t);
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
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
  void (*v107)(uint64_t, uint64_t);
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114[3];

  v1 = *(_QWORD *)(v0 + 1032);
  v2 = *(_QWORD *)(v0 + 1064) + 1;
  (*(void (**)(_QWORD, _QWORD))(v0 + 1072))(*(_QWORD *)(v0 + 464), *(_QWORD *)(v0 + 432));
  if (v2 == v1)
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 1024));
    v3 = *(_QWORD *)(v0 + 704);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 976));
    v4 = swift_release(v3);
    if (*(_QWORD *)(*(_QWORD *)(v0 + 88) + 16))
      v4 = sub_100022934(*(unsigned __int8 *)(v0 + 1248));
    v5 = *(_QWORD *)(v0 + 688);
    v6 = *(_QWORD *)(v0 + 680);
    v7 = *(_QWORD *)(v0 + 672);
    v8 = *(_QWORD *)(v0 + 584);
    v9 = *(_QWORD *)(v0 + 568);
    v10 = *(_QWORD *)(v0 + 560);
    if (*(_QWORD *)(v0 + 968))
    {
      swift_willThrow(v4);
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
      swift_bridgeObjectRelease(*(_QWORD *)(v0 + 88));
      v11 = *(_QWORD *)(v0 + 664);
      v12 = *(_QWORD *)(v0 + 656);
      v13 = *(_QWORD *)(v0 + 648);
      v14 = *(_QWORD *)(v0 + 640);
      v15 = *(_QWORD *)(v0 + 632);
      v16 = *(_QWORD *)(v0 + 624);
      v17 = *(_QWORD *)(v0 + 616);
      v18 = *(_QWORD *)(v0 + 608);
      v19 = *(_QWORD *)(v0 + 584);
      v58 = *(_QWORD *)(v0 + 576);
      v59 = *(_QWORD *)(v0 + 552);
      v61 = *(_QWORD *)(v0 + 528);
      v63 = *(_QWORD *)(v0 + 520);
      v65 = *(_QWORD *)(v0 + 512);
      v67 = *(_QWORD *)(v0 + 504);
      v69 = *(_QWORD *)(v0 + 496);
      v71 = *(_QWORD *)(v0 + 488);
      v73 = *(_QWORD *)(v0 + 480);
      v75 = *(_QWORD *)(v0 + 472);
      v77 = *(_QWORD *)(v0 + 464);
      v79 = *(_QWORD *)(v0 + 456);
      v81 = *(_QWORD *)(v0 + 448);
      v83 = *(_QWORD *)(v0 + 424);
      v85 = *(_QWORD *)(v0 + 416);
      v88 = *(_QWORD *)(v0 + 408);
      v90 = *(_QWORD *)(v0 + 400);
      v92 = *(_QWORD *)(v0 + 392);
      v95 = *(_QWORD *)(v0 + 384);
      v98 = *(_QWORD *)(v0 + 360);
      v101 = *(_QWORD *)(v0 + 352);
      v103 = *(_QWORD *)(v0 + 344);
      v106 = *(_QWORD *)(v0 + 320);
      v109 = *(_QWORD *)(v0 + 312);
      swift_task_dealloc(*(_QWORD *)(v0 + 688));
      swift_task_dealloc(v11);
      swift_task_dealloc(v12);
      swift_task_dealloc(v13);
      swift_task_dealloc(v14);
      swift_task_dealloc(v15);
      swift_task_dealloc(v16);
      swift_task_dealloc(v17);
      swift_task_dealloc(v18);
      swift_task_dealloc(v19);
      swift_task_dealloc(v58);
      swift_task_dealloc(v59);
      swift_task_dealloc(v61);
      swift_task_dealloc(v63);
      swift_task_dealloc(v65);
      swift_task_dealloc(v67);
      swift_task_dealloc(v69);
      swift_task_dealloc(v71);
      swift_task_dealloc(v73);
      swift_task_dealloc(v75);
      swift_task_dealloc(v77);
      swift_task_dealloc(v79);
      swift_task_dealloc(v81);
      swift_task_dealloc(v83);
      swift_task_dealloc(v85);
      swift_task_dealloc(v88);
      swift_task_dealloc(v90);
      swift_task_dealloc(v92);
      swift_task_dealloc(v95);
      swift_task_dealloc(v98);
      swift_task_dealloc(v101);
      swift_task_dealloc(v103);
      swift_task_dealloc(v106);
      swift_task_dealloc(v109);
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(v9 + 8))(*(_QWORD *)(v0 + 584), *(_QWORD *)(v0 + 560));
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
      swift_bridgeObjectRelease(*(_QWORD *)(v0 + 88));
      v49 = *(_QWORD *)(v0 + 664);
      v50 = *(_QWORD *)(v0 + 656);
      v51 = *(_QWORD *)(v0 + 648);
      v52 = *(_QWORD *)(v0 + 640);
      v53 = *(_QWORD *)(v0 + 632);
      v54 = *(_QWORD *)(v0 + 624);
      v55 = *(_QWORD *)(v0 + 616);
      v56 = *(_QWORD *)(v0 + 608);
      v57 = *(_QWORD *)(v0 + 584);
      v60 = *(_QWORD *)(v0 + 576);
      v62 = *(_QWORD *)(v0 + 552);
      v64 = *(_QWORD *)(v0 + 528);
      v66 = *(_QWORD *)(v0 + 520);
      v68 = *(_QWORD *)(v0 + 512);
      v70 = *(_QWORD *)(v0 + 504);
      v72 = *(_QWORD *)(v0 + 496);
      v74 = *(_QWORD *)(v0 + 488);
      v76 = *(_QWORD *)(v0 + 480);
      v78 = *(_QWORD *)(v0 + 472);
      v80 = *(_QWORD *)(v0 + 464);
      v82 = *(_QWORD *)(v0 + 456);
      v84 = *(_QWORD *)(v0 + 448);
      v87 = *(_QWORD *)(v0 + 424);
      v89 = *(_QWORD *)(v0 + 416);
      v91 = *(_QWORD *)(v0 + 408);
      v94 = *(_QWORD *)(v0 + 400);
      v97 = *(_QWORD *)(v0 + 392);
      v100 = *(_QWORD *)(v0 + 384);
      v102 = *(_QWORD *)(v0 + 360);
      v105 = *(_QWORD *)(v0 + 352);
      v108 = *(_QWORD *)(v0 + 344);
      v111 = *(_QWORD *)(v0 + 320);
      v113 = *(_QWORD *)(v0 + 312);
      swift_task_dealloc(*(_QWORD *)(v0 + 688));
      swift_task_dealloc(v49);
      swift_task_dealloc(v50);
      swift_task_dealloc(v51);
      swift_task_dealloc(v52);
      swift_task_dealloc(v53);
      swift_task_dealloc(v54);
      swift_task_dealloc(v55);
      swift_task_dealloc(v56);
      swift_task_dealloc(v57);
      swift_task_dealloc(v60);
      swift_task_dealloc(v62);
      swift_task_dealloc(v64);
      swift_task_dealloc(v66);
      swift_task_dealloc(v68);
      swift_task_dealloc(v70);
      swift_task_dealloc(v72);
      swift_task_dealloc(v74);
      swift_task_dealloc(v76);
      swift_task_dealloc(v78);
      swift_task_dealloc(v80);
      swift_task_dealloc(v82);
      swift_task_dealloc(v84);
      swift_task_dealloc(v87);
      swift_task_dealloc(v89);
      swift_task_dealloc(v91);
      swift_task_dealloc(v94);
      swift_task_dealloc(v97);
      swift_task_dealloc(v100);
      swift_task_dealloc(v102);
      swift_task_dealloc(v105);
      swift_task_dealloc(v108);
      swift_task_dealloc(v111);
      swift_task_dealloc(v113);
    }
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v20 = *(void (**)(uint64_t, uint64_t))(v0 + 1112);
    v21 = *(_QWORD *)(v0 + 1064) + 1;
    *(_QWORD *)(v0 + 1064) = v21;
    *(_QWORD *)(v0 + 1056) = v20;
    v22 = *(uint64_t (**)(unint64_t, unint64_t, uint64_t))(v0 + 1048);
    v24 = *(_QWORD *)(v0 + 456);
    v23 = *(_QWORD *)(v0 + 464);
    v25 = *(_QWORD *)(v0 + 432);
    v26 = *(_QWORD *)(v0 + 288);
    v27 = v22(v23, *(_QWORD *)(v0 + 1024)+ ((*(unsigned __int8 *)(v0 + 1244) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 1244))+ *(_QWORD *)(v0 + 1040) * v21, v25);
    static Log.photos.getter(v27);
    v22(v24, v23, v25);
    v28 = swift_retain(v26);
    v29 = Logger.logObject.getter(v28);
    v30 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v112 = *(_QWORD *)(v0 + 632);
      v110 = *(_QWORD *)(v0 + 592);
      v31 = *(_QWORD *)(v0 + 456);
      v32 = *(_QWORD *)(v0 + 432);
      v93 = *(_QWORD *)(v0 + 440);
      v33 = *(_QWORD *)(v0 + 360);
      v99 = *(_QWORD *)(v0 + 336);
      v96 = *(_QWORD *)(v0 + 328);
      v86 = *(_QWORD *)(v0 + 288);
      v34 = *(unsigned __int8 *)(v0 + 1248);
      v35 = swift_slowAlloc(22, -1);
      v104 = swift_slowAlloc(64, -1);
      v114[0] = v104;
      *(_DWORD *)v35 = 136315394;
      v107 = v20;
      v36 = PhotosFaceType.description.getter(v34);
      v38 = v37;
      *(_QWORD *)(v0 + 152) = sub_100021438(v36, v37, v114);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 152, v0 + 160, v35 + 4, v35 + 12);
      swift_bridgeObjectRelease(v38);
      swift_release(v86);
      *(_WORD *)(v35 + 12) = 2080;
      SyncedPhotosFace.id.getter(v32);
      v39 = *(void (**)(uint64_t, uint64_t))(v93 + 8);
      v39(v31, v32);
      v40 = sub_100009174(&qword_1000B2A30, (uint64_t (*)(uint64_t))&type metadata accessor for AlbumID, (uint64_t)&protocol conformance descriptor for AlbumID);
      v41 = dispatch thunk of CustomStringConvertible.description.getter(v96, v40);
      v43 = v42;
      (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v33, v96);
      *(_QWORD *)(v0 + 160) = sub_100021438(v41, v43, v114);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 160, v0 + 168, v35 + 14, v35 + 22);
      swift_bridgeObjectRelease(v43);
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Inserting face, type = %s: %s", (uint8_t *)v35, 0x16u);
      swift_arrayDestroy(v104, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v104, -1, -1);
      swift_slowDealloc(v35, -1, -1);

      v107(v112, v110);
    }
    else
    {
      v44 = *(_QWORD *)(v0 + 632);
      v45 = *(_QWORD *)(v0 + 592);
      v46 = *(_QWORD *)(v0 + 288);
      v39 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 440) + 8);
      v39(*(_QWORD *)(v0 + 456), *(_QWORD *)(v0 + 432));
      swift_release(v46);

      v20(v44, v45);
    }
    *(_QWORD *)(v0 + 1072) = v39;
    SyncedPhotosFace.id.getter(*(_QWORD *)(v0 + 432));
    v47 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of PhotosFaceIDDatabase.insert(id:)[1]);
    *(_QWORD *)(v0 + 1080) = v47;
    *v47 = v0;
    v47[1] = sub_100083424;
    return dispatch thunk of PhotosFaceIDDatabase.insert(id:)(*(_QWORD *)(v0 + 352), *(_QWORD *)(v0 + 712), *(_QWORD *)(v0 + 720));
  }
}

uint64_t sub_100084470()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
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

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 1072);
  v2 = *(_QWORD *)(v0 + 968);
  v44 = *(_QWORD *)(v0 + 688);
  v3 = *(_QWORD *)(v0 + 680);
  v4 = *(_QWORD *)(v0 + 672);
  v5 = *(_QWORD *)(v0 + 584);
  v6 = *(_QWORD *)(v0 + 568);
  v7 = *(_QWORD *)(v0 + 560);
  v8 = *(_QWORD *)(v0 + 464);
  v9 = *(_QWORD *)(v0 + 432);
  swift_release(*(_QWORD *)(v0 + 704));
  swift_errorRelease(v2);
  v1(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v44, v4);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 88));
  v10 = *(_QWORD *)(v0 + 664);
  v11 = *(_QWORD *)(v0 + 656);
  v12 = *(_QWORD *)(v0 + 648);
  v13 = *(_QWORD *)(v0 + 640);
  v14 = *(_QWORD *)(v0 + 632);
  v15 = *(_QWORD *)(v0 + 624);
  v16 = *(_QWORD *)(v0 + 616);
  v17 = *(_QWORD *)(v0 + 608);
  v18 = *(_QWORD *)(v0 + 584);
  v20 = *(_QWORD *)(v0 + 576);
  v21 = *(_QWORD *)(v0 + 552);
  v22 = *(_QWORD *)(v0 + 528);
  v23 = *(_QWORD *)(v0 + 520);
  v24 = *(_QWORD *)(v0 + 512);
  v25 = *(_QWORD *)(v0 + 504);
  v26 = *(_QWORD *)(v0 + 496);
  v27 = *(_QWORD *)(v0 + 488);
  v28 = *(_QWORD *)(v0 + 480);
  v29 = *(_QWORD *)(v0 + 472);
  v30 = *(_QWORD *)(v0 + 464);
  v31 = *(_QWORD *)(v0 + 456);
  v32 = *(_QWORD *)(v0 + 448);
  v33 = *(_QWORD *)(v0 + 424);
  v34 = *(_QWORD *)(v0 + 416);
  v35 = *(_QWORD *)(v0 + 408);
  v36 = *(_QWORD *)(v0 + 400);
  v37 = *(_QWORD *)(v0 + 392);
  v38 = *(_QWORD *)(v0 + 384);
  v39 = *(_QWORD *)(v0 + 360);
  v40 = *(_QWORD *)(v0 + 352);
  v41 = *(_QWORD *)(v0 + 344);
  v42 = *(_QWORD *)(v0 + 320);
  v43 = *(_QWORD *)(v0 + 312);
  swift_task_dealloc(*(_QWORD *)(v0 + 688));
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000846F8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 1176);
  *(_QWORD *)(*v1 + 1184) = v0;
  swift_task_dealloc(v3);
  if (v0)
    v4 = sub_1000851F0;
  else
    v4 = sub_10008475C;
  return swift_task_switch(v4, *(_QWORD *)(v2 + 760), *(_QWORD *)(v2 + 768));
}

uint64_t sub_10008475C(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  BOOL v9;
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
  unint64_t v20;
  unint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  os_log_type_t v23;
  uint64_t *v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t (*v38)(uint64_t, uint64_t, uint64_t, __n128);
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __n128 v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  void (*v57)(uint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
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
  _QWORD *v79;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
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
  void (*v143)(uint64_t, uint64_t);
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void (*v150)(uint64_t, uint64_t);
  uint64_t v151;
  uint64_t v152;
  uint64_t v153[3];

  v2 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 1016);
  v4 = *(_QWORD *)(v1 + 400);
  v3 = *(_QWORD *)(v1 + 408);
  v5 = *(_QWORD *)(v1 + 368);
  static Log.photos.getter(a1);
  v6 = v2(v4, v3, v5);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.debug.getter();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(_QWORD *)(v1 + 616);
  v11 = *(_QWORD *)(v1 + 592);
  v12 = *(_QWORD *)(v1 + 400);
  v13 = *(_QWORD *)(v1 + 408);
  v14 = *(_QWORD *)(v1 + 368);
  v15 = *(_QWORD *)(v1 + 376);
  if (v9)
  {
    v150 = *(void (**)(uint64_t, uint64_t))(v1 + 840);
    v146 = *(_QWORD *)(v1 + 408);
    v16 = swift_slowAlloc(12, -1);
    v142 = v10;
    v17 = swift_slowAlloc(32, -1);
    v153[0] = v17;
    *(_DWORD *)v16 = 136315138;
    v18 = sub_100009174((unint64_t *)&qword_1000B28E8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v19 = dispatch thunk of CustomStringConvertible.description.getter(v14, v18);
    v21 = v20;
    *(_QWORD *)(v16 + 4) = sub_100021438(v19, v20, v153);
    swift_bridgeObjectRelease(v21);
    v22 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v22(v12, v14);
    v23 = v8;
    v24 = (uint64_t *)(v1 + 840);
    _os_log_impl((void *)&_mh_execute_header, v7, v23, "Cleared photos for: %s", (uint8_t *)v16, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v16, -1, -1);

    v150(v142, v11);
    v22(v146, v14);
  }
  else
  {
    v24 = (uint64_t *)(v1 + 1136);
    v25 = *(void (**)(uint64_t, uint64_t))(v1 + 1136);

    v26 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v26(v12, v14);
    v25(v10, v11);
    v26(v13, v14);
  }
  v27 = *(_QWORD *)(v1 + 1160) + 1;
  if (v27 == *(_QWORD *)(v1 + 1000))
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v1 + 1168))(*(_QWORD *)(v1 + 320), 1, 1, *(_QWORD *)(v1 + 368));
  }
  else
  {
    v28 = *v24;
    *(_QWORD *)(v1 + 1160) = v27;
    *(_QWORD *)(v1 + 1152) = v28;
    *(_QWORD *)(v1 + 1144) = v28;
    *(_QWORD *)(v1 + 1136) = v28;
    v29 = *(_QWORD *)(v1 + 368);
    v30 = *(_QWORD *)(v1 + 376);
    v31 = *(_QWORD *)(v1 + 320);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v1 + 1016))(v31, *(_QWORD *)(v1 + 992)+ ((*(unsigned __int8 *)(v1 + 1240) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 1240))+ *(_QWORD *)(v1 + 1008) * v27, v29);
    v32 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v30 + 56);
    *(_QWORD *)(v1 + 1168) = v32;
    v32(v31, 0, 1, v29);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v31, 1, v29) != 1)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v1 + 376) + 32))(*(_QWORD *)(v1 + 408), *(_QWORD *)(v1 + 320), *(_QWORD *)(v1 + 368));
      v79 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of PhotosFaceIDDatabase.clearPhotos(for:)[1]);
      *(_QWORD *)(v1 + 1176) = v79;
      *v79 = v1;
      v79[1] = sub_1000846F8;
      return dispatch thunk of PhotosFaceIDDatabase.clearPhotos(for:)(*(_QWORD *)(v1 + 408), *(_QWORD *)(v1 + 712), *(_QWORD *)(v1 + 720));
    }
  }
  swift_bridgeObjectRelease(*(_QWORD *)(v1 + 992));
  v33 = *(_QWORD *)(v1 + 88);
  *(_QWORD *)(v1 + 1024) = v33;
  v34 = *(_QWORD *)(v33 + 16);
  *(_QWORD *)(v1 + 1032) = v34;
  if (v34)
  {
    v36 = *(_QWORD *)(v1 + 432);
    v35 = *(_QWORD *)(v1 + 440);
    v37 = *(_DWORD *)(v35 + 80);
    *(_DWORD *)(v1 + 1244) = v37;
    *(_QWORD *)(v1 + 1040) = *(_QWORD *)(v35 + 72);
    v38 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128))(v35 + 16);
    *(_QWORD *)(v1 + 1048) = v38;
    v39 = *(void (**)(uint64_t, uint64_t))(v1 + 840);
    *(_QWORD *)(v1 + 1064) = 0;
    *(_QWORD *)(v1 + 1056) = v39;
    v41 = *(_QWORD *)(v1 + 456);
    v40 = *(_QWORD *)(v1 + 464);
    v42 = *(_QWORD *)(v1 + 288);
    v43 = v33 + ((v37 + 32) & ~(unint64_t)v37);
    v44 = swift_bridgeObjectRetain(v33);
    v45 = v38(v40, v43, v36, v44);
    static Log.photos.getter(v45);
    ((void (*)(uint64_t, uint64_t, uint64_t))v38)(v41, v40, v36);
    v46 = swift_retain(v42);
    v47 = Logger.logObject.getter(v46);
    v48 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v47, v48))
    {
      v151 = *(_QWORD *)(v1 + 632);
      v147 = *(_QWORD *)(v1 + 592);
      v49 = *(_QWORD *)(v1 + 456);
      v128 = *(_QWORD *)(v1 + 440);
      v143 = v39;
      v50 = *(_QWORD *)(v1 + 432);
      v51 = *(_QWORD *)(v1 + 360);
      v134 = *(_QWORD *)(v1 + 336);
      v131 = *(_QWORD *)(v1 + 328);
      v121 = *(_QWORD *)(v1 + 288);
      v52 = *(unsigned __int8 *)(v1 + 1248);
      v53 = swift_slowAlloc(22, -1);
      v137 = swift_slowAlloc(64, -1);
      v153[0] = v137;
      *(_DWORD *)v53 = 136315394;
      v54 = PhotosFaceType.description.getter(v52);
      v56 = v55;
      *(_QWORD *)(v1 + 152) = sub_100021438(v54, v55, v153);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 152, v1 + 160, v53 + 4, v53 + 12);
      swift_release(v121);
      swift_bridgeObjectRelease(v56);
      *(_WORD *)(v53 + 12) = 2080;
      SyncedPhotosFace.id.getter(v50);
      v57 = *(void (**)(uint64_t, uint64_t))(v128 + 8);
      v57(v49, v50);
      v58 = sub_100009174(&qword_1000B2A30, (uint64_t (*)(uint64_t))&type metadata accessor for AlbumID, (uint64_t)&protocol conformance descriptor for AlbumID);
      v59 = dispatch thunk of CustomStringConvertible.description.getter(v131, v58);
      v61 = v60;
      (*(void (**)(uint64_t, uint64_t))(v134 + 8))(v51, v131);
      *(_QWORD *)(v1 + 160) = sub_100021438(v59, v61, v153);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 160, v1 + 168, v53 + 14, v53 + 22);
      swift_bridgeObjectRelease(v61);
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "Inserting face, type = %s: %s", (uint8_t *)v53, 0x16u);
      swift_arrayDestroy(v137, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v137, -1, -1);
      swift_slowDealloc(v53, -1, -1);

      v143(v151, v147);
    }
    else
    {
      v81 = *(_QWORD *)(v1 + 632);
      v82 = *(_QWORD *)(v1 + 592);
      v83 = *(_QWORD *)(v1 + 288);
      v57 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 440) + 8);
      v57(*(_QWORD *)(v1 + 456), *(_QWORD *)(v1 + 432));

      swift_release(v83);
      v39(v81, v82);
    }
    *(_QWORD *)(v1 + 1072) = v57;
    SyncedPhotosFace.id.getter(*(_QWORD *)(v1 + 432));
    v84 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of PhotosFaceIDDatabase.insert(id:)[1]);
    *(_QWORD *)(v1 + 1080) = v84;
    *v84 = v1;
    v84[1] = sub_100083424;
    return dispatch thunk of PhotosFaceIDDatabase.insert(id:)(*(_QWORD *)(v1 + 352), *(_QWORD *)(v1 + 712), *(_QWORD *)(v1 + 720));
  }
  else
  {
    v62 = *(_QWORD *)(v1 + 976);
    swift_release(*(_QWORD *)(v1 + 704));
    v63 = swift_bridgeObjectRelease(v62);
    if (*(_QWORD *)(*(_QWORD *)(v1 + 88) + 16))
      v63 = sub_100022934(*(unsigned __int8 *)(v1 + 1248));
    v64 = *(_QWORD *)(v1 + 688);
    v65 = *(_QWORD *)(v1 + 680);
    v66 = *(_QWORD *)(v1 + 672);
    v67 = *(_QWORD *)(v1 + 584);
    v68 = *(_QWORD *)(v1 + 568);
    v69 = *(_QWORD *)(v1 + 560);
    if (*(_QWORD *)(v1 + 968))
    {
      swift_willThrow(v63);
      (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v67, v69);
      (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v64, v66);
      swift_bridgeObjectRelease(*(_QWORD *)(v1 + 88));
      v70 = *(_QWORD *)(v1 + 664);
      v71 = *(_QWORD *)(v1 + 656);
      v72 = *(_QWORD *)(v1 + 648);
      v73 = *(_QWORD *)(v1 + 640);
      v74 = *(_QWORD *)(v1 + 632);
      v75 = *(_QWORD *)(v1 + 624);
      v76 = *(_QWORD *)(v1 + 616);
      v77 = *(_QWORD *)(v1 + 608);
      v78 = *(_QWORD *)(v1 + 584);
      v94 = *(_QWORD *)(v1 + 576);
      v95 = *(_QWORD *)(v1 + 552);
      v97 = *(_QWORD *)(v1 + 528);
      v99 = *(_QWORD *)(v1 + 520);
      v101 = *(_QWORD *)(v1 + 512);
      v103 = *(_QWORD *)(v1 + 504);
      v105 = *(_QWORD *)(v1 + 496);
      v107 = *(_QWORD *)(v1 + 488);
      v109 = *(_QWORD *)(v1 + 480);
      v111 = *(_QWORD *)(v1 + 472);
      v113 = *(_QWORD *)(v1 + 464);
      v115 = *(_QWORD *)(v1 + 456);
      v117 = *(_QWORD *)(v1 + 448);
      v119 = *(_QWORD *)(v1 + 424);
      v122 = *(_QWORD *)(v1 + 416);
      v124 = *(_QWORD *)(v1 + 408);
      v126 = *(_QWORD *)(v1 + 400);
      v129 = *(_QWORD *)(v1 + 392);
      v132 = *(_QWORD *)(v1 + 384);
      v135 = *(_QWORD *)(v1 + 360);
      v138 = *(_QWORD *)(v1 + 352);
      v140 = *(_QWORD *)(v1 + 344);
      v144 = *(_QWORD *)(v1 + 320);
      v148 = *(_QWORD *)(v1 + 312);
      swift_task_dealloc(*(_QWORD *)(v1 + 688));
      swift_task_dealloc(v70);
      swift_task_dealloc(v71);
      swift_task_dealloc(v72);
      swift_task_dealloc(v73);
      swift_task_dealloc(v74);
      swift_task_dealloc(v75);
      swift_task_dealloc(v76);
      swift_task_dealloc(v77);
      swift_task_dealloc(v78);
      swift_task_dealloc(v94);
      swift_task_dealloc(v95);
      swift_task_dealloc(v97);
      swift_task_dealloc(v99);
      swift_task_dealloc(v101);
      swift_task_dealloc(v103);
      swift_task_dealloc(v105);
      swift_task_dealloc(v107);
      swift_task_dealloc(v109);
      swift_task_dealloc(v111);
      swift_task_dealloc(v113);
      swift_task_dealloc(v115);
      swift_task_dealloc(v117);
      swift_task_dealloc(v119);
      swift_task_dealloc(v122);
      swift_task_dealloc(v124);
      swift_task_dealloc(v126);
      swift_task_dealloc(v129);
      swift_task_dealloc(v132);
      swift_task_dealloc(v135);
      swift_task_dealloc(v138);
      swift_task_dealloc(v140);
      swift_task_dealloc(v144);
      swift_task_dealloc(v148);
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(v68 + 8))(*(_QWORD *)(v1 + 584), *(_QWORD *)(v1 + 560));
      (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v64, v66);
      swift_bridgeObjectRelease(*(_QWORD *)(v1 + 88));
      v85 = *(_QWORD *)(v1 + 664);
      v86 = *(_QWORD *)(v1 + 656);
      v87 = *(_QWORD *)(v1 + 648);
      v88 = *(_QWORD *)(v1 + 640);
      v89 = *(_QWORD *)(v1 + 632);
      v90 = *(_QWORD *)(v1 + 624);
      v91 = *(_QWORD *)(v1 + 616);
      v92 = *(_QWORD *)(v1 + 608);
      v93 = *(_QWORD *)(v1 + 584);
      v96 = *(_QWORD *)(v1 + 576);
      v98 = *(_QWORD *)(v1 + 552);
      v100 = *(_QWORD *)(v1 + 528);
      v102 = *(_QWORD *)(v1 + 520);
      v104 = *(_QWORD *)(v1 + 512);
      v106 = *(_QWORD *)(v1 + 504);
      v108 = *(_QWORD *)(v1 + 496);
      v110 = *(_QWORD *)(v1 + 488);
      v112 = *(_QWORD *)(v1 + 480);
      v114 = *(_QWORD *)(v1 + 472);
      v116 = *(_QWORD *)(v1 + 464);
      v118 = *(_QWORD *)(v1 + 456);
      v120 = *(_QWORD *)(v1 + 448);
      v123 = *(_QWORD *)(v1 + 424);
      v125 = *(_QWORD *)(v1 + 416);
      v127 = *(_QWORD *)(v1 + 408);
      v130 = *(_QWORD *)(v1 + 400);
      v133 = *(_QWORD *)(v1 + 392);
      v136 = *(_QWORD *)(v1 + 384);
      v139 = *(_QWORD *)(v1 + 360);
      v141 = *(_QWORD *)(v1 + 352);
      v145 = *(_QWORD *)(v1 + 344);
      v149 = *(_QWORD *)(v1 + 320);
      v152 = *(_QWORD *)(v1 + 312);
      swift_task_dealloc(*(_QWORD *)(v1 + 688));
      swift_task_dealloc(v85);
      swift_task_dealloc(v86);
      swift_task_dealloc(v87);
      swift_task_dealloc(v88);
      swift_task_dealloc(v89);
      swift_task_dealloc(v90);
      swift_task_dealloc(v91);
      swift_task_dealloc(v92);
      swift_task_dealloc(v93);
      swift_task_dealloc(v96);
      swift_task_dealloc(v98);
      swift_task_dealloc(v100);
      swift_task_dealloc(v102);
      swift_task_dealloc(v104);
      swift_task_dealloc(v106);
      swift_task_dealloc(v108);
      swift_task_dealloc(v110);
      swift_task_dealloc(v112);
      swift_task_dealloc(v114);
      swift_task_dealloc(v116);
      swift_task_dealloc(v118);
      swift_task_dealloc(v120);
      swift_task_dealloc(v123);
      swift_task_dealloc(v125);
      swift_task_dealloc(v127);
      swift_task_dealloc(v130);
      swift_task_dealloc(v133);
      swift_task_dealloc(v136);
      swift_task_dealloc(v139);
      swift_task_dealloc(v141);
      swift_task_dealloc(v145);
      swift_task_dealloc(v149);
      swift_task_dealloc(v152);
    }
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000851F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t (*v41)(uint64_t, uint64_t, uint64_t, __n128);
  void (*v42)(uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __n128 v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  void (*v60)(uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
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
  _QWORD *v82;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
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
  void (*v148)(uint64_t, uint64_t);
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void (*v155)(uint64_t, uint64_t);
  uint64_t v156;
  uint64_t v157;
  uint64_t v158[3];

  v2 = *(_QWORD *)(v1 + 1184);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 1016);
  v4 = *(_QWORD *)(v1 + 408);
  v5 = *(_QWORD *)(v1 + 392);
  v6 = *(_QWORD *)(v1 + 368);
  static Log.photos.getter(a1);
  v3(v5, v4, v6);
  swift_errorRetain(v2);
  v7 = swift_errorRetain(v2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.error.getter();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(_QWORD *)(v1 + 1184);
  v12 = *(_QWORD *)(v1 + 608);
  v13 = *(_QWORD *)(v1 + 408);
  v14 = *(_QWORD *)(v1 + 392);
  v16 = *(_QWORD *)(v1 + 368);
  v15 = *(_QWORD *)(v1 + 376);
  if (v10)
  {
    v151 = *(_QWORD *)(v1 + 592);
    v155 = *(void (**)(uint64_t, uint64_t))(v1 + 1144);
    v147 = *(_QWORD *)(v1 + 608);
    v17 = swift_slowAlloc(22, -1);
    v18 = (uint64_t *)swift_slowAlloc(8, -1);
    v140 = swift_slowAlloc(32, -1);
    v158[0] = v140;
    *(_DWORD *)v17 = 136315394;
    v19 = sub_100009174((unint64_t *)&qword_1000B28E8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v20 = dispatch thunk of CustomStringConvertible.description.getter(v16, v19);
    v144 = v13;
    v22 = v21;
    *(_QWORD *)(v17 + 4) = sub_100021438(v20, v21, v158);
    swift_bridgeObjectRelease(v22);
    v23 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v23(v14, v16);
    *(_WORD *)(v17 + 12) = 2112;
    swift_errorRetain(v11);
    v24 = _swift_stdlib_bridgeErrorToNSError(v11);
    *(_QWORD *)(v17 + 14) = v24;
    *v18 = v24;
    swift_errorRelease(v11);
    swift_errorRelease(v11);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Failed to clear photos for face %s: %@", (uint8_t *)v17, 0x16u);
    v25 = sub_10000629C(&qword_1000B20C0);
    swift_arrayDestroy(v18, 1, v25);
    swift_slowDealloc(v18, -1, -1);
    swift_arrayDestroy(v140, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v140, -1, -1);
    swift_slowDealloc(v17, -1, -1);

    swift_errorRelease(v11);
    v155(v147, v151);
    v23(v144, v16);
    v26 = *(_QWORD *)(v1 + 1144);
    v27 = v26;
  }
  else
  {
    v28 = *(void (**)(uint64_t, uint64_t))(v1 + 1152);
    v29 = *(_QWORD *)(v1 + 592);

    swift_errorRelease(v11);
    swift_errorRelease(v11);
    v30 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v30(v14, v16);
    swift_errorRelease(v11);
    v28(v12, v29);
    v30(v13, v16);
    v27 = *(_QWORD *)(v1 + 1152);
    v26 = *(_QWORD *)(v1 + 1144);
  }
  v31 = *(_QWORD *)(v1 + 1160) + 1;
  if (v31 == *(_QWORD *)(v1 + 1000))
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v1 + 1168))(*(_QWORD *)(v1 + 320), 1, 1, *(_QWORD *)(v1 + 368));
  }
  else
  {
    *(_QWORD *)(v1 + 1160) = v31;
    *(_QWORD *)(v1 + 1152) = v27;
    *(_QWORD *)(v1 + 1144) = v26;
    v32 = *(_QWORD *)(v1 + 368);
    v33 = *(_QWORD *)(v1 + 376);
    v34 = *(_QWORD *)(v1 + 320);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v1 + 1016))(v34, *(_QWORD *)(v1 + 992)+ ((*(unsigned __int8 *)(v1 + 1240) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 1240))+ *(_QWORD *)(v1 + 1008) * v31, v32);
    v35 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v33 + 56);
    *(_QWORD *)(v1 + 1168) = v35;
    v35(v34, 0, 1, v32);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v34, 1, v32) != 1)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v1 + 376) + 32))(*(_QWORD *)(v1 + 408), *(_QWORD *)(v1 + 320), *(_QWORD *)(v1 + 368));
      v82 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of PhotosFaceIDDatabase.clearPhotos(for:)[1]);
      *(_QWORD *)(v1 + 1176) = v82;
      *v82 = v1;
      v82[1] = sub_1000846F8;
      return dispatch thunk of PhotosFaceIDDatabase.clearPhotos(for:)(*(_QWORD *)(v1 + 408), *(_QWORD *)(v1 + 712), *(_QWORD *)(v1 + 720));
    }
  }
  swift_bridgeObjectRelease(*(_QWORD *)(v1 + 992));
  v36 = *(_QWORD *)(v1 + 88);
  *(_QWORD *)(v1 + 1024) = v36;
  v37 = *(_QWORD *)(v36 + 16);
  *(_QWORD *)(v1 + 1032) = v37;
  if (v37)
  {
    v39 = *(_QWORD *)(v1 + 432);
    v38 = *(_QWORD *)(v1 + 440);
    v40 = *(_DWORD *)(v38 + 80);
    *(_DWORD *)(v1 + 1244) = v40;
    *(_QWORD *)(v1 + 1040) = *(_QWORD *)(v38 + 72);
    v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128))(v38 + 16);
    *(_QWORD *)(v1 + 1048) = v41;
    v42 = *(void (**)(uint64_t, uint64_t))(v1 + 840);
    *(_QWORD *)(v1 + 1064) = 0;
    *(_QWORD *)(v1 + 1056) = v42;
    v44 = *(_QWORD *)(v1 + 456);
    v43 = *(_QWORD *)(v1 + 464);
    v45 = *(_QWORD *)(v1 + 288);
    v46 = v36 + ((v40 + 32) & ~(unint64_t)v40);
    v47 = swift_bridgeObjectRetain(v36);
    v48 = v41(v43, v46, v39, v47);
    static Log.photos.getter(v48);
    ((void (*)(uint64_t, uint64_t, uint64_t))v41)(v44, v43, v39);
    v49 = swift_retain(v45);
    v50 = Logger.logObject.getter(v49);
    v51 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v50, v51))
    {
      v156 = *(_QWORD *)(v1 + 632);
      v152 = *(_QWORD *)(v1 + 592);
      v52 = *(_QWORD *)(v1 + 456);
      v131 = *(_QWORD *)(v1 + 440);
      v148 = v42;
      v53 = *(_QWORD *)(v1 + 432);
      v54 = *(_QWORD *)(v1 + 360);
      v137 = *(_QWORD *)(v1 + 336);
      v134 = *(_QWORD *)(v1 + 328);
      v124 = *(_QWORD *)(v1 + 288);
      v55 = *(unsigned __int8 *)(v1 + 1248);
      v56 = swift_slowAlloc(22, -1);
      v141 = swift_slowAlloc(64, -1);
      v158[0] = v141;
      *(_DWORD *)v56 = 136315394;
      v57 = PhotosFaceType.description.getter(v55);
      v59 = v58;
      *(_QWORD *)(v1 + 152) = sub_100021438(v57, v58, v158);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 152, v1 + 160, v56 + 4, v56 + 12);
      swift_release(v124);
      swift_bridgeObjectRelease(v59);
      *(_WORD *)(v56 + 12) = 2080;
      SyncedPhotosFace.id.getter(v53);
      v60 = *(void (**)(uint64_t, uint64_t))(v131 + 8);
      v60(v52, v53);
      v61 = sub_100009174(&qword_1000B2A30, (uint64_t (*)(uint64_t))&type metadata accessor for AlbumID, (uint64_t)&protocol conformance descriptor for AlbumID);
      v62 = dispatch thunk of CustomStringConvertible.description.getter(v134, v61);
      v64 = v63;
      (*(void (**)(uint64_t, uint64_t))(v137 + 8))(v54, v134);
      *(_QWORD *)(v1 + 160) = sub_100021438(v62, v64, v158);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 160, v1 + 168, v56 + 14, v56 + 22);
      swift_bridgeObjectRelease(v64);
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "Inserting face, type = %s: %s", (uint8_t *)v56, 0x16u);
      swift_arrayDestroy(v141, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v141, -1, -1);
      swift_slowDealloc(v56, -1, -1);

      v148(v156, v152);
    }
    else
    {
      v84 = *(_QWORD *)(v1 + 632);
      v85 = *(_QWORD *)(v1 + 592);
      v86 = *(_QWORD *)(v1 + 288);
      v60 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 440) + 8);
      v60(*(_QWORD *)(v1 + 456), *(_QWORD *)(v1 + 432));

      swift_release(v86);
      v42(v84, v85);
    }
    *(_QWORD *)(v1 + 1072) = v60;
    SyncedPhotosFace.id.getter(*(_QWORD *)(v1 + 432));
    v87 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of PhotosFaceIDDatabase.insert(id:)[1]);
    *(_QWORD *)(v1 + 1080) = v87;
    *v87 = v1;
    v87[1] = sub_100083424;
    return dispatch thunk of PhotosFaceIDDatabase.insert(id:)(*(_QWORD *)(v1 + 352), *(_QWORD *)(v1 + 712), *(_QWORD *)(v1 + 720));
  }
  else
  {
    v65 = *(_QWORD *)(v1 + 976);
    swift_release(*(_QWORD *)(v1 + 704));
    v66 = swift_bridgeObjectRelease(v65);
    if (*(_QWORD *)(*(_QWORD *)(v1 + 88) + 16))
      v66 = sub_100022934(*(unsigned __int8 *)(v1 + 1248));
    v67 = *(_QWORD *)(v1 + 688);
    v68 = *(_QWORD *)(v1 + 680);
    v69 = *(_QWORD *)(v1 + 672);
    v70 = *(_QWORD *)(v1 + 584);
    v71 = *(_QWORD *)(v1 + 568);
    v72 = *(_QWORD *)(v1 + 560);
    if (*(_QWORD *)(v1 + 968))
    {
      swift_willThrow(v66);
      (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v70, v72);
      (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v67, v69);
      swift_bridgeObjectRelease(*(_QWORD *)(v1 + 88));
      v73 = *(_QWORD *)(v1 + 664);
      v74 = *(_QWORD *)(v1 + 656);
      v75 = *(_QWORD *)(v1 + 648);
      v76 = *(_QWORD *)(v1 + 640);
      v77 = *(_QWORD *)(v1 + 632);
      v78 = *(_QWORD *)(v1 + 624);
      v79 = *(_QWORD *)(v1 + 616);
      v80 = *(_QWORD *)(v1 + 608);
      v81 = *(_QWORD *)(v1 + 584);
      v97 = *(_QWORD *)(v1 + 576);
      v98 = *(_QWORD *)(v1 + 552);
      v100 = *(_QWORD *)(v1 + 528);
      v102 = *(_QWORD *)(v1 + 520);
      v104 = *(_QWORD *)(v1 + 512);
      v106 = *(_QWORD *)(v1 + 504);
      v108 = *(_QWORD *)(v1 + 496);
      v110 = *(_QWORD *)(v1 + 488);
      v112 = *(_QWORD *)(v1 + 480);
      v114 = *(_QWORD *)(v1 + 472);
      v116 = *(_QWORD *)(v1 + 464);
      v118 = *(_QWORD *)(v1 + 456);
      v120 = *(_QWORD *)(v1 + 448);
      v122 = *(_QWORD *)(v1 + 424);
      v125 = *(_QWORD *)(v1 + 416);
      v127 = *(_QWORD *)(v1 + 408);
      v129 = *(_QWORD *)(v1 + 400);
      v132 = *(_QWORD *)(v1 + 392);
      v135 = *(_QWORD *)(v1 + 384);
      v138 = *(_QWORD *)(v1 + 360);
      v142 = *(_QWORD *)(v1 + 352);
      v145 = *(_QWORD *)(v1 + 344);
      v149 = *(_QWORD *)(v1 + 320);
      v153 = *(_QWORD *)(v1 + 312);
      swift_task_dealloc(*(_QWORD *)(v1 + 688));
      swift_task_dealloc(v73);
      swift_task_dealloc(v74);
      swift_task_dealloc(v75);
      swift_task_dealloc(v76);
      swift_task_dealloc(v77);
      swift_task_dealloc(v78);
      swift_task_dealloc(v79);
      swift_task_dealloc(v80);
      swift_task_dealloc(v81);
      swift_task_dealloc(v97);
      swift_task_dealloc(v98);
      swift_task_dealloc(v100);
      swift_task_dealloc(v102);
      swift_task_dealloc(v104);
      swift_task_dealloc(v106);
      swift_task_dealloc(v108);
      swift_task_dealloc(v110);
      swift_task_dealloc(v112);
      swift_task_dealloc(v114);
      swift_task_dealloc(v116);
      swift_task_dealloc(v118);
      swift_task_dealloc(v120);
      swift_task_dealloc(v122);
      swift_task_dealloc(v125);
      swift_task_dealloc(v127);
      swift_task_dealloc(v129);
      swift_task_dealloc(v132);
      swift_task_dealloc(v135);
      swift_task_dealloc(v138);
      swift_task_dealloc(v142);
      swift_task_dealloc(v145);
      swift_task_dealloc(v149);
      swift_task_dealloc(v153);
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(v71 + 8))(*(_QWORD *)(v1 + 584), *(_QWORD *)(v1 + 560));
      (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v67, v69);
      swift_bridgeObjectRelease(*(_QWORD *)(v1 + 88));
      v88 = *(_QWORD *)(v1 + 664);
      v89 = *(_QWORD *)(v1 + 656);
      v90 = *(_QWORD *)(v1 + 648);
      v91 = *(_QWORD *)(v1 + 640);
      v92 = *(_QWORD *)(v1 + 632);
      v93 = *(_QWORD *)(v1 + 624);
      v94 = *(_QWORD *)(v1 + 616);
      v95 = *(_QWORD *)(v1 + 608);
      v96 = *(_QWORD *)(v1 + 584);
      v99 = *(_QWORD *)(v1 + 576);
      v101 = *(_QWORD *)(v1 + 552);
      v103 = *(_QWORD *)(v1 + 528);
      v105 = *(_QWORD *)(v1 + 520);
      v107 = *(_QWORD *)(v1 + 512);
      v109 = *(_QWORD *)(v1 + 504);
      v111 = *(_QWORD *)(v1 + 496);
      v113 = *(_QWORD *)(v1 + 488);
      v115 = *(_QWORD *)(v1 + 480);
      v117 = *(_QWORD *)(v1 + 472);
      v119 = *(_QWORD *)(v1 + 464);
      v121 = *(_QWORD *)(v1 + 456);
      v123 = *(_QWORD *)(v1 + 448);
      v126 = *(_QWORD *)(v1 + 424);
      v128 = *(_QWORD *)(v1 + 416);
      v130 = *(_QWORD *)(v1 + 408);
      v133 = *(_QWORD *)(v1 + 400);
      v136 = *(_QWORD *)(v1 + 392);
      v139 = *(_QWORD *)(v1 + 384);
      v143 = *(_QWORD *)(v1 + 360);
      v146 = *(_QWORD *)(v1 + 352);
      v150 = *(_QWORD *)(v1 + 344);
      v154 = *(_QWORD *)(v1 + 320);
      v157 = *(_QWORD *)(v1 + 312);
      swift_task_dealloc(*(_QWORD *)(v1 + 688));
      swift_task_dealloc(v88);
      swift_task_dealloc(v89);
      swift_task_dealloc(v90);
      swift_task_dealloc(v91);
      swift_task_dealloc(v92);
      swift_task_dealloc(v93);
      swift_task_dealloc(v94);
      swift_task_dealloc(v95);
      swift_task_dealloc(v96);
      swift_task_dealloc(v99);
      swift_task_dealloc(v101);
      swift_task_dealloc(v103);
      swift_task_dealloc(v105);
      swift_task_dealloc(v107);
      swift_task_dealloc(v109);
      swift_task_dealloc(v111);
      swift_task_dealloc(v113);
      swift_task_dealloc(v115);
      swift_task_dealloc(v117);
      swift_task_dealloc(v119);
      swift_task_dealloc(v121);
      swift_task_dealloc(v123);
      swift_task_dealloc(v126);
      swift_task_dealloc(v128);
      swift_task_dealloc(v130);
      swift_task_dealloc(v133);
      swift_task_dealloc(v136);
      swift_task_dealloc(v139);
      swift_task_dealloc(v143);
      swift_task_dealloc(v146);
      swift_task_dealloc(v150);
      swift_task_dealloc(v154);
      swift_task_dealloc(v157);
    }
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100085D30()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(async function pointer to PhotosFaceDatabase.timePositions(for:)[1]);
  *(_QWORD *)(v0 + 1192) = v1;
  *v1 = v0;
  v1[1] = sub_100085D8C;
  return PhotosFaceDatabase.timePositions(for:)(*(_QWORD *)(v0 + 824));
}

uint64_t sub_100085D8C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 1192);
  *(_QWORD *)(*v2 + 1200) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = sub_1000861B4;
  }
  else
  {
    *(_QWORD *)(v4 + 1208) = a1;
    v6 = sub_100085E00;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_100085E00()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v1 = v0[151];
  v2 = v0[150];
  v3 = v0[103];
  v4 = sub_10008BC0C(v1, (uint64_t (*)(_QWORD, _QWORD, _QWORD))sub_10008B93C, v0[100]);
  swift_bridgeObjectRelease(v1);
  v5 = sub_10005CA80((uint64_t)v4);
  v0[152] = v2;
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRetain(v3);
  v7 = sub_100054F10(v6);
  swift_bridgeObjectRelease(v3);
  v8 = sub_100053314((uint64_t)v5, v7);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v5);
  v0[153] = sub_10005321C((uint64_t)v8);
  swift_release(v8);
  return swift_task_switch(sub_100085EDC, v0[95], v0[96]);
}

uint64_t sub_100085EDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __n128 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v1 = *(_QWORD *)(v0 + 1224);
  *(_QWORD *)(v0 + 832) = *(_QWORD *)(v0 + 1216);
  v2 = *(_QWORD *)(v0 + 792);
  swift_bridgeObjectRetain(v2);
  v4 = sub_100054F10(v3);
  swift_bridgeObjectRelease(v2);
  v5 = swift_bridgeObjectRetain(v1);
  v6 = SyncFacesRequest.init(trackedFaces:cachedIdentifiers:)(v2, v1, v5);
  static Log.photos.getter(v6);
  swift_bridgeObjectRetain(v1);
  swift_bridgeObjectRetain(v4);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v30 = *(_QWORD *)(v0 + 600);
    v31 = *(_QWORD *)(v0 + 592);
    v32 = *(_QWORD *)(v0 + 664);
    v28 = *(_QWORD *)(v0 + 368);
    v10 = swift_slowAlloc(22, -1);
    v29 = swift_slowAlloc(32, -1);
    v33 = v29;
    *(_DWORD *)v10 = 134218242;
    v11 = *(_QWORD *)(v1 + 16);
    swift_bridgeObjectRelease(v1);
    *(_QWORD *)(v0 + 272) = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 272, v0 + 280, v10 + 4, v10 + 12);
    swift_bridgeObjectRelease(v1);
    *(_WORD *)(v10 + 12) = 2080;
    v12 = sub_100009174(&qword_1000B3208, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    swift_bridgeObjectRetain(v4);
    v14 = Set.description.getter(v13, v28, v12);
    v16 = v15;
    swift_bridgeObjectRelease(v4);
    *(_QWORD *)(v0 + 280) = sub_100021438(v14, v16, &v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 280, v0 + 288, v10 + 14, v10 + 22);
    swift_bridgeObjectRelease_n(v4, 2);
    swift_bridgeObjectRelease(v16);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Requesting syncFaces with %ld cached photos and faces: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy(v29, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v29, -1, -1);
    swift_slowDealloc(v10, -1, -1);

    v17 = *(uint64_t (**)(uint64_t, uint64_t))(v30 + 8);
    v18 = v17(v32, v31);
  }
  else
  {
    v19 = *(_QWORD *)(v0 + 664);
    v20 = *(_QWORD *)(v0 + 600);
    v21 = *(_QWORD *)(v0 + 592);

    swift_bridgeObjectRelease_n(v4, 2);
    swift_bridgeObjectRelease_n(v1, 2);
    v17 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 8);
    v18 = v17(v19, v21);
  }
  *(_QWORD *)(v0 + 840) = v17;
  v22 = *(_QWORD *)(v0 + 752);
  v23 = *(_QWORD *)(v0 + 696);
  v24 = *(_QWORD *)(v0 + 288);
  *(_QWORD *)(v0 + 848) = *(_QWORD *)(v24 + 96);
  *(_BYTE *)(v0 + 1248) = *(_BYTE *)(v24 + 16);
  *(_QWORD *)(v0 + 856) = static CommunicationActor.shared.getter(v18);
  v25 = dispatch thunk of Actor.unownedExecutor.getter(v23, v22);
  return swift_task_switch(sub_10007FD08, v25, v26);
}

uint64_t sub_1000861B4()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[103]);
  v0[154] = v0[150];
  return swift_task_switch(sub_1000861F8, v0[95], v0[96]);
}

uint64_t sub_1000861F8()
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

  v1 = *(_QWORD *)(v0 + 792);
  swift_release(*(_QWORD *)(v0 + 704));
  swift_bridgeObjectRelease(v1);
  v2 = *(_QWORD *)(v0 + 664);
  v3 = *(_QWORD *)(v0 + 656);
  v4 = *(_QWORD *)(v0 + 648);
  v5 = *(_QWORD *)(v0 + 640);
  v6 = *(_QWORD *)(v0 + 632);
  v7 = *(_QWORD *)(v0 + 624);
  v8 = *(_QWORD *)(v0 + 616);
  v9 = *(_QWORD *)(v0 + 608);
  v10 = *(_QWORD *)(v0 + 584);
  v12 = *(_QWORD *)(v0 + 576);
  v13 = *(_QWORD *)(v0 + 552);
  v14 = *(_QWORD *)(v0 + 528);
  v15 = *(_QWORD *)(v0 + 520);
  v16 = *(_QWORD *)(v0 + 512);
  v17 = *(_QWORD *)(v0 + 504);
  v18 = *(_QWORD *)(v0 + 496);
  v19 = *(_QWORD *)(v0 + 488);
  v20 = *(_QWORD *)(v0 + 480);
  v21 = *(_QWORD *)(v0 + 472);
  v22 = *(_QWORD *)(v0 + 464);
  v23 = *(_QWORD *)(v0 + 456);
  v24 = *(_QWORD *)(v0 + 448);
  v25 = *(_QWORD *)(v0 + 424);
  v26 = *(_QWORD *)(v0 + 416);
  v27 = *(_QWORD *)(v0 + 408);
  v28 = *(_QWORD *)(v0 + 400);
  v29 = *(_QWORD *)(v0 + 392);
  v30 = *(_QWORD *)(v0 + 384);
  v31 = *(_QWORD *)(v0 + 360);
  v32 = *(_QWORD *)(v0 + 352);
  v33 = *(_QWORD *)(v0 + 344);
  v34 = *(_QWORD *)(v0 + 320);
  v35 = *(_QWORD *)(v0 + 312);
  swift_task_dealloc(*(_QWORD *)(v0 + 688));
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100086424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t AssociatedConformanceWitness;

  v3 = *(_QWORD *)(a3 + a2 - 40);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(*(_QWORD *)(a3 + a2 - 16), *(_QWORD *)(a3 + a2 - 32), v3, &unk_100097754, &unk_10009775C);
  return dispatch thunk of PhotosFaceID.id.getter(v3, AssociatedConformanceWitness);
}

_QWORD *sub_100086480(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  _QWORD *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  Swift::String v20;
  void *object;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  Swift::String v25;
  void *v26;
  Swift::String v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t);
  unint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  _QWORD *v47;

  v42 = a4;
  v43 = a5;
  v41 = a2;
  v7 = a2(0);
  v39 = *(_QWORD *)(v7 - 8);
  v40 = v7;
  __chkstk_darwin(v7);
  v9 = (char *)&v34 - v8;
  v10 = sub_10000629C(a3);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = &_swiftEmptyArrayStorage;
  if (v14)
  {
    v47 = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain(a1);
    sub_10004D838(0, v14, 0);
    v16 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    v37 = *(_QWORD *)(v11 + 72);
    v38 = v11;
    v17 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    v35 = a1;
    v36 = v17;
    do
    {
      v36(v13, v16, v10);
      v45 = 0;
      v46 = 0xE000000000000000;
      _StringGuts.grow(_:)(22);
      swift_bridgeObjectRelease(v46);
      v45 = 0x203D20646928;
      v46 = 0xE600000000000000;
      SyncedPhotosFace.id.getter(v10);
      v18 = sub_100009174(v42, v41, v43);
      v19 = v40;
      v20._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v40, v18);
      object = v20._object;
      String.append(_:)(v20);
      swift_bridgeObjectRelease(object);
      (*(void (**)(char *, uint64_t))(v39 + 8))(v9, v19);
      v22._countAndFlagsBits = 0x736F746F6870202CLL;
      v22._object = (void *)0xEB00000000203D20;
      String.append(_:)(v22);
      v23 = SyncedPhotosFace.photos.getter(v10);
      v24 = *(_QWORD *)(v23 + 16);
      swift_bridgeObjectRelease(v23);
      v44 = v24;
      v25._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
      v26 = v25._object;
      String.append(_:)(v25);
      swift_bridgeObjectRelease(v26);
      v27._countAndFlagsBits = 41;
      v27._object = (void *)0xE100000000000000;
      String.append(_:)(v27);
      v28 = v45;
      v29 = v46;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      v15 = v47;
      if ((swift_isUniquelyReferenced_nonNull_native(v47) & 1) == 0)
      {
        sub_10004D838(0, v15[2] + 1, 1);
        v15 = v47;
      }
      v31 = v15[2];
      v30 = v15[3];
      if (v31 >= v30 >> 1)
      {
        sub_10004D838(v30 > 1, v31 + 1, 1);
        v15 = v47;
      }
      v15[2] = v31 + 1;
      v32 = (char *)&v15[2 * v31];
      *((_QWORD *)v32 + 4) = v28;
      *((_QWORD *)v32 + 5) = v29;
      v11 = v38;
      v16 += v37;
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease(v35);
  }
  return v15;
}

uint64_t sub_100086738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t AssociatedConformanceWitness;
  uint64_t v5;

  v3 = *(_QWORD *)(a3 + a2 - 40);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(*(_QWORD *)(a3 + a2 - 16), *(_QWORD *)(a3 + a2 - 32), v3, &unk_100097754, &unk_10009775C);
  v5 = type metadata accessor for SyncedPhotosFace(0, v3, AssociatedConformanceWitness);
  return SyncedPhotosFace.id.getter(v5);
}

uint64_t sub_10008679C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  v4 = type metadata accessor for ShuffleID(0);
  v3[8] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[9] = v5;
  v6 = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[10] = swift_task_alloc(v6);
  v3[11] = swift_task_alloc(v6);
  v7 = type metadata accessor for Logger(0);
  v3[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[13] = v8;
  v3[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for UUID(0);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v3[17] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100086860, 0, 0);
}

uint64_t sub_100086860()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[8];
  v2 = sub_100009174(&qword_1000B2B08, (uint64_t (*)(uint64_t))&type metadata accessor for ShuffleID, (uint64_t)&protocol conformance descriptor for ShuffleID);
  dispatch thunk of PhotosFaceID.id.getter(v1, v2);
  v3 = type metadata accessor for GalleryDatabase(0);
  v4 = sub_100009174(&qword_1000B3138, (uint64_t (*)(uint64_t))&type metadata accessor for GalleryDatabase, (uint64_t)&protocol conformance descriptor for GalleryDatabase);
  v5 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of PhotosFaceIDDatabase.queryByDay(id:)[1]);
  v0[18] = v5;
  *v5 = v0;
  v5[1] = sub_10008692C;
  return dispatch thunk of PhotosFaceIDDatabase.queryByDay(id:)(v0[17], v3, v4);
}

uint64_t sub_10008692C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = *v2;
  v5 = *(_QWORD *)(*v2 + 136);
  v4 = *(_QWORD *)(*v2 + 144);
  v6 = *(_QWORD *)(*v2 + 120);
  v7 = *(_QWORD *)(*v2 + 128);
  *(_QWORD *)(v3 + 152) = a1;
  *(_QWORD *)(v3 + 160) = v1;
  swift_task_dealloc(v4);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  if (v1)
    v8 = sub_10008DDF4;
  else
    v8 = sub_1000869B4;
  return swift_task_switch(v8, 0, 0);
}

uint64_t sub_1000869B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int8x16_t *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  os_log_type_t type;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v2 = *(_QWORD *)(v1 + 40);
  v3 = *(_QWORD *)(v1 + 152);
  v4 = *(_QWORD *)(v1 + 88);
  v5 = *(_QWORD *)(v1 + 64);
  v6 = *(_QWORD *)(v1 + 72);
  static Log.photos.getter(a1);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(v4, v2, v5);
  swift_bridgeObjectRetain(v3);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = *(_QWORD *)(v1 + 152);
    v36 = *(_QWORD *)(v1 + 104);
    v12 = *(_QWORD *)(v1 + 88);
    v37 = *(_QWORD *)(v1 + 96);
    v38 = *(_QWORD *)(v1 + 112);
    type = v10;
    v13 = *(_QWORD *)(v1 + 80);
    v33 = *(_QWORD *)(v1 + 72);
    v14 = *(_QWORD *)(v1 + 64);
    v15 = swift_slowAlloc(22, -1);
    v34 = swift_slowAlloc(32, -1);
    *(_DWORD *)v15 = 134218242;
    *(_QWORD *)(v1 + 24) = *(_QWORD *)(v11 + 16);
    v39 = v34;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 24, v1 + 32, v15 + 4, v15 + 12);
    swift_bridgeObjectRelease(v11);
    *(_WORD *)(v15 + 12) = 2080;
    v7(v13, v12, v14);
    v16 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v16(v12, v14);
    v17 = sub_100009174(&qword_1000B2B30, (uint64_t (*)(uint64_t))&type metadata accessor for ShuffleID, (uint64_t)&protocol conformance descriptor for ShuffleID);
    v18 = dispatch thunk of CustomStringConvertible.description.getter(v14, v17);
    v20 = v19;
    v16(v13, v14);
    *(_QWORD *)(v1 + 32) = sub_100021438(v18, v20, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 32, v1 + 40, v15 + 14, v15 + 22);
    swift_bridgeObjectRelease(v20);
    _os_log_impl((void *)&_mh_execute_header, v9, type, "Found %ld days for face %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy(v34, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1, -1);
    swift_slowDealloc(v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v38, v37);
  }
  else
  {
    v21 = *(_QWORD *)(v1 + 152);
    v23 = *(_QWORD *)(v1 + 104);
    v22 = *(_QWORD *)(v1 + 112);
    v24 = *(_QWORD *)(v1 + 96);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 72) + 8))(*(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 64));
    swift_bridgeObjectRelease(v21);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
  }
  v25 = *(_QWORD *)(v1 + 56);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v1 + 152);
  v26 = (int8x16_t *)swift_task_alloc(48);
  *(_QWORD *)(v1 + 168) = v26;
  v26[1] = vextq_s8(*(int8x16_t *)(v1 + 40), *(int8x16_t *)(v1 + 40), 8uLL);
  v26[2].i64[0] = v25;
  v27 = swift_task_alloc(32);
  *(_QWORD *)(v1 + 176) = v27;
  *(_QWORD *)(v27 + 16) = &unk_1000B3E20;
  *(_QWORD *)(v27 + 24) = v26;
  v28 = (_QWORD *)swift_task_alloc(async function pointer to Sequence.asyncMap<A>(predicate:)[1]);
  *(_QWORD *)(v1 + 184) = v28;
  v29 = sub_10000629C(&qword_1000B31E0);
  v30 = sub_10000629C(&qword_1000B3DF8);
  v31 = sub_100006454(&qword_1000B31E8, &qword_1000B31E0, (uint64_t)&protocol conformance descriptor for [A : B]);
  *v28 = v1;
  v28[1] = sub_100086CEC;
  return Sequence.asyncMap<A>(predicate:)(&unk_1000B3E30, v27, v29, v30, v31);
}

uint64_t sub_100086CEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD **)v2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 184);
  v3[24] = a1;
  v3[25] = v1;
  swift_task_dealloc(v4);
  if (v1)
  {
    v5 = sub_10008DDE0;
  }
  else
  {
    v6 = v3[21];
    v7 = v3[22];
    swift_bridgeObjectRelease(v3[19]);
    swift_task_dealloc(v7);
    swift_task_dealloc(v6);
    v5 = sub_10008DDA0;
  }
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100086D7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  v4 = type metadata accessor for ShuffleID(0);
  v3[8] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[9] = v5;
  v6 = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[10] = swift_task_alloc(v6);
  v3[11] = swift_task_alloc(v6);
  v7 = type metadata accessor for Logger(0);
  v3[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[13] = v8;
  v3[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for UUID(0);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v3[17] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100086E40, 0, 0);
}

uint64_t sub_100086E40()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[8];
  v2 = sub_100009174(&qword_1000B2B08, (uint64_t (*)(uint64_t))&type metadata accessor for ShuffleID, (uint64_t)&protocol conformance descriptor for ShuffleID);
  dispatch thunk of PhotosFaceID.id.getter(v1, v2);
  v3 = type metadata accessor for ShuffleDatabase(0);
  v4 = sub_100009174(&qword_1000B3270, (uint64_t (*)(uint64_t))&type metadata accessor for ShuffleDatabase, (uint64_t)&protocol conformance descriptor for ShuffleDatabase);
  v5 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of PhotosFaceIDDatabase.queryByDay(id:)[1]);
  v0[18] = v5;
  *v5 = v0;
  v5[1] = sub_100086F0C;
  return dispatch thunk of PhotosFaceIDDatabase.queryByDay(id:)(v0[17], v3, v4);
}

uint64_t sub_100086F0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = *v2;
  v5 = *(_QWORD *)(*v2 + 136);
  v4 = *(_QWORD *)(*v2 + 144);
  v6 = *(_QWORD *)(*v2 + 120);
  v7 = *(_QWORD *)(*v2 + 128);
  *(_QWORD *)(v3 + 152) = a1;
  *(_QWORD *)(v3 + 160) = v1;
  swift_task_dealloc(v4);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  if (v1)
    v8 = sub_10008DDF4;
  else
    v8 = sub_100086F94;
  return swift_task_switch(v8, 0, 0);
}

uint64_t sub_100086F94(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int8x16_t *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  os_log_type_t type;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v2 = *(_QWORD *)(v1 + 40);
  v3 = *(_QWORD *)(v1 + 152);
  v4 = *(_QWORD *)(v1 + 88);
  v5 = *(_QWORD *)(v1 + 64);
  v6 = *(_QWORD *)(v1 + 72);
  static Log.photos.getter(a1);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(v4, v2, v5);
  swift_bridgeObjectRetain(v3);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = *(_QWORD *)(v1 + 152);
    v36 = *(_QWORD *)(v1 + 104);
    v12 = *(_QWORD *)(v1 + 88);
    v37 = *(_QWORD *)(v1 + 96);
    v38 = *(_QWORD *)(v1 + 112);
    type = v10;
    v13 = *(_QWORD *)(v1 + 80);
    v33 = *(_QWORD *)(v1 + 72);
    v14 = *(_QWORD *)(v1 + 64);
    v15 = swift_slowAlloc(22, -1);
    v34 = swift_slowAlloc(32, -1);
    *(_DWORD *)v15 = 134218242;
    *(_QWORD *)(v1 + 24) = *(_QWORD *)(v11 + 16);
    v39 = v34;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 24, v1 + 32, v15 + 4, v15 + 12);
    swift_bridgeObjectRelease(v11);
    *(_WORD *)(v15 + 12) = 2080;
    v7(v13, v12, v14);
    v16 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v16(v12, v14);
    v17 = sub_100009174(&qword_1000B2B30, (uint64_t (*)(uint64_t))&type metadata accessor for ShuffleID, (uint64_t)&protocol conformance descriptor for ShuffleID);
    v18 = dispatch thunk of CustomStringConvertible.description.getter(v14, v17);
    v20 = v19;
    v16(v13, v14);
    *(_QWORD *)(v1 + 32) = sub_100021438(v18, v20, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 32, v1 + 40, v15 + 14, v15 + 22);
    swift_bridgeObjectRelease(v20);
    _os_log_impl((void *)&_mh_execute_header, v9, type, "Found %ld days for face %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy(v34, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1, -1);
    swift_slowDealloc(v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v38, v37);
  }
  else
  {
    v21 = *(_QWORD *)(v1 + 152);
    v23 = *(_QWORD *)(v1 + 104);
    v22 = *(_QWORD *)(v1 + 112);
    v24 = *(_QWORD *)(v1 + 96);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 72) + 8))(*(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 64));
    swift_bridgeObjectRelease(v21);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
  }
  v25 = *(_QWORD *)(v1 + 56);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v1 + 152);
  v26 = (int8x16_t *)swift_task_alloc(48);
  *(_QWORD *)(v1 + 168) = v26;
  v26[1] = vextq_s8(*(int8x16_t *)(v1 + 40), *(int8x16_t *)(v1 + 40), 8uLL);
  v26[2].i64[0] = v25;
  v27 = swift_task_alloc(32);
  *(_QWORD *)(v1 + 176) = v27;
  *(_QWORD *)(v27 + 16) = &unk_1000B3F98;
  *(_QWORD *)(v27 + 24) = v26;
  v28 = (_QWORD *)swift_task_alloc(async function pointer to Sequence.asyncMap<A>(predicate:)[1]);
  *(_QWORD *)(v1 + 184) = v28;
  v29 = sub_10000629C(&qword_1000B31E0);
  v30 = sub_10000629C(&qword_1000B3DF8);
  v31 = sub_100006454(&qword_1000B31E8, &qword_1000B31E0, (uint64_t)&protocol conformance descriptor for [A : B]);
  *v28 = v1;
  v28[1] = sub_1000872CC;
  return Sequence.asyncMap<A>(predicate:)(&unk_1000B3FA8, v27, v29, v30, v31);
}

uint64_t sub_1000872CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD **)v2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 184);
  v3[24] = a1;
  v3[25] = v1;
  swift_task_dealloc(v4);
  if (v1)
  {
    v5 = sub_10008DDE0;
  }
  else
  {
    v6 = v3[21];
    v7 = v3[22];
    swift_bridgeObjectRelease(v3[19]);
    swift_task_dealloc(v7);
    swift_task_dealloc(v6);
    v5 = sub_10008735C;
  }
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_10008735C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = (uint64_t *)(v1 + 32);
    swift_bridgeObjectRetain(v1);
    do
    {
      v4 = *v3++;
      swift_bridgeObjectRetain(v4);
      sub_100017AD8(v5);
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 192));
    v1 = *(_QWORD *)(v0 + 192);
  }
  v6 = *(_QWORD *)(v0 + 136);
  v7 = *(_QWORD *)(v0 + 112);
  v9 = *(_QWORD *)(v0 + 80);
  v8 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRelease(v1);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(_swiftEmptyArrayStorage);
}

uint64_t sub_100087414(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  v4 = type metadata accessor for AlbumID(0);
  v3[8] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[9] = v5;
  v6 = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[10] = swift_task_alloc(v6);
  v3[11] = swift_task_alloc(v6);
  v7 = type metadata accessor for Logger(0);
  v3[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[13] = v8;
  v3[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for UUID(0);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v3[17] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000874D8, 0, 0);
}

uint64_t sub_1000874D8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[8];
  v2 = sub_100009174(&qword_1000B29F0, (uint64_t (*)(uint64_t))&type metadata accessor for AlbumID, (uint64_t)&protocol conformance descriptor for AlbumID);
  dispatch thunk of PhotosFaceID.id.getter(v1, v2);
  v3 = type metadata accessor for AlbumDatabase(0);
  v4 = sub_100009174(&qword_1000B32D8, (uint64_t (*)(uint64_t))&type metadata accessor for AlbumDatabase, (uint64_t)&protocol conformance descriptor for AlbumDatabase);
  v5 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of PhotosFaceIDDatabase.queryByDay(id:)[1]);
  v0[18] = v5;
  *v5 = v0;
  v5[1] = sub_1000875A4;
  return dispatch thunk of PhotosFaceIDDatabase.queryByDay(id:)(v0[17], v3, v4);
}

uint64_t sub_1000875A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = *v2;
  v5 = *(_QWORD *)(*v2 + 136);
  v4 = *(_QWORD *)(*v2 + 144);
  v6 = *(_QWORD *)(*v2 + 120);
  v7 = *(_QWORD *)(*v2 + 128);
  *(_QWORD *)(v3 + 152) = a1;
  *(_QWORD *)(v3 + 160) = v1;
  swift_task_dealloc(v4);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  if (v1)
    v8 = sub_100087964;
  else
    v8 = sub_10008762C;
  return swift_task_switch(v8, 0, 0);
}

uint64_t sub_10008762C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int8x16_t *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  os_log_type_t type;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v2 = *(_QWORD *)(v1 + 40);
  v3 = *(_QWORD *)(v1 + 152);
  v4 = *(_QWORD *)(v1 + 88);
  v5 = *(_QWORD *)(v1 + 64);
  v6 = *(_QWORD *)(v1 + 72);
  static Log.photos.getter(a1);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(v4, v2, v5);
  swift_bridgeObjectRetain(v3);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = *(_QWORD *)(v1 + 152);
    v36 = *(_QWORD *)(v1 + 104);
    v12 = *(_QWORD *)(v1 + 88);
    v37 = *(_QWORD *)(v1 + 96);
    v38 = *(_QWORD *)(v1 + 112);
    type = v10;
    v13 = *(_QWORD *)(v1 + 80);
    v33 = *(_QWORD *)(v1 + 72);
    v14 = *(_QWORD *)(v1 + 64);
    v15 = swift_slowAlloc(22, -1);
    v34 = swift_slowAlloc(32, -1);
    *(_DWORD *)v15 = 134218242;
    *(_QWORD *)(v1 + 24) = *(_QWORD *)(v11 + 16);
    v39 = v34;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 24, v1 + 32, v15 + 4, v15 + 12);
    swift_bridgeObjectRelease(v11);
    *(_WORD *)(v15 + 12) = 2080;
    v7(v13, v12, v14);
    v16 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v16(v12, v14);
    v17 = sub_100009174(&qword_1000B2A30, (uint64_t (*)(uint64_t))&type metadata accessor for AlbumID, (uint64_t)&protocol conformance descriptor for AlbumID);
    v18 = dispatch thunk of CustomStringConvertible.description.getter(v14, v17);
    v20 = v19;
    v16(v13, v14);
    *(_QWORD *)(v1 + 32) = sub_100021438(v18, v20, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 32, v1 + 40, v15 + 14, v15 + 22);
    swift_bridgeObjectRelease(v20);
    _os_log_impl((void *)&_mh_execute_header, v9, type, "Found %ld days for face %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy(v34, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1, -1);
    swift_slowDealloc(v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v38, v37);
  }
  else
  {
    v21 = *(_QWORD *)(v1 + 152);
    v23 = *(_QWORD *)(v1 + 104);
    v22 = *(_QWORD *)(v1 + 112);
    v24 = *(_QWORD *)(v1 + 96);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 72) + 8))(*(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 64));
    swift_bridgeObjectRelease(v21);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
  }
  v25 = *(_QWORD *)(v1 + 56);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v1 + 152);
  v26 = (int8x16_t *)swift_task_alloc(48);
  *(_QWORD *)(v1 + 168) = v26;
  v26[1] = vextq_s8(*(int8x16_t *)(v1 + 40), *(int8x16_t *)(v1 + 40), 8uLL);
  v26[2].i64[0] = v25;
  v27 = swift_task_alloc(32);
  *(_QWORD *)(v1 + 176) = v27;
  *(_QWORD *)(v27 + 16) = &unk_1000B4170;
  *(_QWORD *)(v27 + 24) = v26;
  v28 = (_QWORD *)swift_task_alloc(async function pointer to Sequence.asyncMap<A>(predicate:)[1]);
  *(_QWORD *)(v1 + 184) = v28;
  v29 = sub_10000629C(&qword_1000B31E0);
  v30 = sub_10000629C(&qword_1000B4148);
  v31 = sub_100006454(&qword_1000B31E8, &qword_1000B31E0, (uint64_t)&protocol conformance descriptor for [A : B]);
  *v28 = v1;
  v28[1] = sub_1000879C0;
  return Sequence.asyncMap<A>(predicate:)(&unk_1000B4180, v27, v29, v30, v31);
}

uint64_t sub_100087964()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 88);
  swift_task_dealloc(*(_QWORD *)(v0 + 136));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000879C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD **)v2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 184);
  v3[24] = a1;
  v3[25] = v1;
  swift_task_dealloc(v4);
  if (v1)
  {
    v5 = sub_100087B08;
  }
  else
  {
    v6 = v3[21];
    v7 = v3[22];
    swift_bridgeObjectRelease(v3[19]);
    swift_task_dealloc(v7);
    swift_task_dealloc(v6);
    v5 = sub_100087A50;
  }
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100087A50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = (uint64_t *)(v1 + 32);
    swift_bridgeObjectRetain(v1);
    do
    {
      v4 = *v3++;
      swift_bridgeObjectRetain(v4);
      sub_100017AEC(v5);
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 192));
    v1 = *(_QWORD *)(v0 + 192);
  }
  v6 = *(_QWORD *)(v0 + 136);
  v7 = *(_QWORD *)(v0 + 112);
  v9 = *(_QWORD *)(v0 + 80);
  v8 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRelease(v1);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(_swiftEmptyArrayStorage);
}

uint64_t sub_100087B08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 168);
  v2 = *(_QWORD *)(v0 + 176);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 152));
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  v3 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 88);
  swift_task_dealloc(*(_QWORD *)(v0 + 136));
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100087B80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5[15] = a4;
  v5[16] = a5;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  v6 = sub_10000629C(&qword_1000B25E0);
  v5[17] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[18] = v7;
  v5[19] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for ShuffleID(0);
  v5[20] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v5[21] = v9;
  v10 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[22] = swift_task_alloc(v10);
  v5[23] = swift_task_alloc(v10);
  v11 = type metadata accessor for Logger(0);
  v5[24] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v5[25] = v12;
  v5[26] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100087C4C, 0, 0);
}

uint64_t sub_100087C4C()
{
  uint64_t *v0;
  unint64_t *v1;
  uint64_t **v2;

  v1 = sub_10004F36C(v0[13]);
  v0[27] = (uint64_t)v1;
  v2 = (uint64_t **)swift_task_alloc(dword_1000B372C);
  v0[28] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = (uint64_t *)sub_100087CB8;
  return sub_10004FB58((uint64_t)v1);
}

uint64_t sub_100087CB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t (*v6)();

  v4 = (_QWORD *)*v3;
  v4[2] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = v2;
  v5 = v4[28];
  v4[29] = a2;
  v4[30] = v2;
  swift_task_dealloc(v5);
  if (v2)
  {
    v6 = sub_10008DE14;
  }
  else
  {
    swift_bridgeObjectRelease(v4[27]);
    v6 = sub_10008DD68;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_100087D2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5[15] = a4;
  v5[16] = a5;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  v6 = sub_10000629C(&qword_1000B25E0);
  v5[17] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[18] = v7;
  v5[19] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for ShuffleID(0);
  v5[20] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v5[21] = v9;
  v10 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[22] = swift_task_alloc(v10);
  v5[23] = swift_task_alloc(v10);
  v11 = type metadata accessor for Logger(0);
  v5[24] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v5[25] = v12;
  v5[26] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100087DF8, 0, 0);
}

uint64_t sub_100087DF8()
{
  uint64_t *v0;
  unint64_t *v1;
  uint64_t **v2;

  v1 = sub_10004F36C(v0[13]);
  v0[27] = (uint64_t)v1;
  v2 = (uint64_t **)swift_task_alloc(dword_1000B372C);
  v0[28] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = (uint64_t *)sub_100087E64;
  return sub_10004FB58((uint64_t)v1);
}

uint64_t sub_100087E64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);

  v4 = (_QWORD *)*v3;
  v4[2] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = v2;
  v5 = v4[28];
  v4[29] = a2;
  v4[30] = v2;
  swift_task_dealloc(v5);
  if (v2)
  {
    v6 = (uint64_t (*)(uint64_t))sub_10008DE14;
  }
  else
  {
    swift_bridgeObjectRelease(v4[27]);
    v6 = sub_100087ED8;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_100087ED8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  os_log_type_t type;
  os_log_type_t typea[8];
  NSObject *log;
  os_log_t loga;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59[2];

  v2 = *(_QWORD *)(v1 + 232);
  if (*(_QWORD *)(v2 + 16))
  {
    v3 = *(_QWORD *)(v1 + 184);
    v4 = *(_QWORD *)(v1 + 160);
    v5 = *(_QWORD *)(v1 + 168);
    v6 = *(_QWORD *)(v1 + 120);
    static Log.photos.getter(a1);
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    v7(v3, v6, v4);
    v8 = swift_bridgeObjectRetain_n(v2, 2);
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.error.getter();
    v11 = os_log_type_enabled(v9, v10);
    v12 = *(_QWORD *)(v1 + 232);
    v14 = *(_QWORD *)(v1 + 200);
    v13 = *(_QWORD *)(v1 + 208);
    v16 = *(_QWORD *)(v1 + 184);
    v15 = *(_QWORD *)(v1 + 192);
    if (v11)
    {
      v55 = *(_QWORD *)(v1 + 192);
      v57 = *(_QWORD *)(v1 + 208);
      v45 = *(_QWORD *)(v1 + 96);
      log = v9;
      v17 = *(_QWORD *)(v1 + 176);
      v46 = *(_QWORD *)(v1 + 168);
      type = v10;
      v18 = *(_QWORD *)(v1 + 160);
      v53 = *(_QWORD *)(v1 + 200);
      v19 = swift_slowAlloc(42, -1);
      v47 = swift_slowAlloc(64, -1);
      v59[0] = v47;
      *(_DWORD *)v19 = 134218754;
      *(_QWORD *)(v1 + 64) = *(_QWORD *)(v2 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 64, v1 + 72, v19 + 4, v19 + 12);
      swift_bridgeObjectRelease(v12);
      *(_WORD *)(v19 + 12) = 2048;
      *(_QWORD *)(v1 + 72) = v45;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 72, v1 + 80, v19 + 14, v19 + 22);
      *(_WORD *)(v19 + 22) = 2080;
      v7(v17, v16, v18);
      v20 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
      v20(v16, v18);
      v21 = sub_100009174(&qword_1000B2B30, (uint64_t (*)(uint64_t))&type metadata accessor for ShuffleID, (uint64_t)&protocol conformance descriptor for ShuffleID);
      v22 = dispatch thunk of CustomStringConvertible.description.getter(v18, v21);
      v24 = v23;
      v20(v17, v18);
      *(_QWORD *)(v1 + 80) = sub_100021438(v22, v24, v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 80, v1 + 88, v19 + 24, v19 + 32);
      swift_bridgeObjectRelease(v24);
      *(_WORD *)(v19 + 32) = 2080;
      v25 = type metadata accessor for UUID(0);
      swift_bridgeObjectRetain(v12);
      v27 = Array.description.getter(v26, v25);
      v29 = v28;
      swift_bridgeObjectRelease(v12);
      *(_QWORD *)(v1 + 88) = sub_100021438(v27, v29, v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 88, v1 + 96, v19 + 34, v19 + 42);
      swift_bridgeObjectRelease(v29);
      swift_bridgeObjectRelease_n(v12, 2);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Ignoring %ld uncached photos on %ld for face %s: %s", (uint8_t *)v19, 0x2Au);
      swift_arrayDestroy(v47, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v47, -1, -1);
      swift_slowDealloc(v19, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v57, v55);
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 168) + 8))(*(_QWORD *)(v1 + 184), *(_QWORD *)(v1 + 160));
      swift_bridgeObjectRelease_n(v12, 3);

      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    }
  }
  else
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v1 + 232));
  }
  v30 = *(_QWORD *)(v1 + 24);
  v31 = *(_QWORD *)(v1 + 176);
  v56 = *(_QWORD *)(v1 + 208);
  v58 = *(_QWORD *)(v1 + 184);
  v33 = *(_QWORD *)(v1 + 160);
  v32 = *(_QWORD *)(v1 + 168);
  v34 = *(_QWORD *)(v1 + 152);
  v35 = *(_QWORD *)(v1 + 128);
  loga = *(os_log_t *)(v1 + 136);
  v54 = *(_QWORD *)(v1 + 144);
  v36 = *(_QWORD *)(v1 + 120);
  *(_QWORD *)typea = *(_QWORD *)(v1 + 96);
  swift_bridgeObjectRetain(v35);
  swift_bridgeObjectRetain(v30);
  v48 = sub_10008BF34(v37, v35);
  swift_bridgeObjectRelease(v35);
  swift_bridgeObjectRelease(v30);
  v38 = sub_10004F36C(v30);
  swift_bridgeObjectRelease(v30);
  swift_bridgeObjectRetain(v35);
  v39 = sub_10008A074((uint64_t)v38, v35);
  swift_bridgeObjectRelease(v38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v31, v36, v33);
  v40 = sub_10005321C(v39);
  swift_release(v39);
  v41 = sub_100009174(&qword_1000B2B08, (uint64_t (*)(uint64_t))&type metadata accessor for ShuffleID, (uint64_t)&protocol conformance descriptor for ShuffleID);
  v42 = default argument 4 of SyncedPhotosFace.init(id:day:photos:cached:complete:)(v33, v41);
  SyncedPhotosFace.init(id:day:photos:cached:complete:)(v31, *(_QWORD *)typea, 0, v48, v40, v42 & 1, v33, v41);
  v43 = SyncedPhotosFace.streamify()(loga);
  (*(void (**)(uint64_t, os_log_t))(v54 + 8))(v34, loga);
  swift_task_dealloc(v56);
  swift_task_dealloc(v58);
  swift_task_dealloc(v31);
  swift_task_dealloc(v34);
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(v43);
}

uint64_t sub_100088370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5[15] = a4;
  v5[16] = a5;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  v6 = sub_10000629C(&qword_1000B25E8);
  v5[17] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[18] = v7;
  v5[19] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for AlbumID(0);
  v5[20] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v5[21] = v9;
  v10 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[22] = swift_task_alloc(v10);
  v5[23] = swift_task_alloc(v10);
  v11 = type metadata accessor for Logger(0);
  v5[24] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v5[25] = v12;
  v5[26] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10008843C, 0, 0);
}

uint64_t sub_10008843C()
{
  uint64_t *v0;
  unint64_t *v1;
  uint64_t **v2;

  v1 = sub_10004F36C(v0[13]);
  v0[27] = (uint64_t)v1;
  v2 = (uint64_t **)swift_task_alloc(dword_1000B372C);
  v0[28] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = (uint64_t *)sub_1000884A8;
  return sub_10004FB58((uint64_t)v1);
}

uint64_t sub_1000884A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)*v3;
  v4[2] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = v2;
  v5 = v4[28];
  v4[29] = a2;
  v4[30] = v2;
  swift_task_dealloc(v5);
  if (v2)
  {
    v6 = sub_1000889B4;
  }
  else
  {
    swift_bridgeObjectRelease(v4[27]);
    v6 = sub_10008851C;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_10008851C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  os_log_type_t type;
  os_log_type_t typea[8];
  NSObject *log;
  os_log_t loga;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59[2];

  v2 = *(_QWORD *)(v1 + 232);
  if (*(_QWORD *)(v2 + 16))
  {
    v3 = *(_QWORD *)(v1 + 184);
    v4 = *(_QWORD *)(v1 + 160);
    v5 = *(_QWORD *)(v1 + 168);
    v6 = *(_QWORD *)(v1 + 120);
    static Log.photos.getter(a1);
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    v7(v3, v6, v4);
    v8 = swift_bridgeObjectRetain_n(v2, 2);
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.error.getter();
    v11 = os_log_type_enabled(v9, v10);
    v12 = *(_QWORD *)(v1 + 232);
    v14 = *(_QWORD *)(v1 + 200);
    v13 = *(_QWORD *)(v1 + 208);
    v16 = *(_QWORD *)(v1 + 184);
    v15 = *(_QWORD *)(v1 + 192);
    if (v11)
    {
      v55 = *(_QWORD *)(v1 + 192);
      v57 = *(_QWORD *)(v1 + 208);
      v45 = *(_QWORD *)(v1 + 96);
      log = v9;
      v17 = *(_QWORD *)(v1 + 176);
      v46 = *(_QWORD *)(v1 + 168);
      type = v10;
      v18 = *(_QWORD *)(v1 + 160);
      v53 = *(_QWORD *)(v1 + 200);
      v19 = swift_slowAlloc(42, -1);
      v47 = swift_slowAlloc(64, -1);
      v59[0] = v47;
      *(_DWORD *)v19 = 134218754;
      *(_QWORD *)(v1 + 64) = *(_QWORD *)(v2 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 64, v1 + 72, v19 + 4, v19 + 12);
      swift_bridgeObjectRelease(v12);
      *(_WORD *)(v19 + 12) = 2048;
      *(_QWORD *)(v1 + 72) = v45;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 72, v1 + 80, v19 + 14, v19 + 22);
      *(_WORD *)(v19 + 22) = 2080;
      v7(v17, v16, v18);
      v20 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
      v20(v16, v18);
      v21 = sub_100009174(&qword_1000B2A30, (uint64_t (*)(uint64_t))&type metadata accessor for AlbumID, (uint64_t)&protocol conformance descriptor for AlbumID);
      v22 = dispatch thunk of CustomStringConvertible.description.getter(v18, v21);
      v24 = v23;
      v20(v17, v18);
      *(_QWORD *)(v1 + 80) = sub_100021438(v22, v24, v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 80, v1 + 88, v19 + 24, v19 + 32);
      swift_bridgeObjectRelease(v24);
      *(_WORD *)(v19 + 32) = 2080;
      v25 = type metadata accessor for UUID(0);
      swift_bridgeObjectRetain(v12);
      v27 = Array.description.getter(v26, v25);
      v29 = v28;
      swift_bridgeObjectRelease(v12);
      *(_QWORD *)(v1 + 88) = sub_100021438(v27, v29, v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 88, v1 + 96, v19 + 34, v19 + 42);
      swift_bridgeObjectRelease(v29);
      swift_bridgeObjectRelease_n(v12, 2);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Ignoring %ld uncached photos on %ld for face %s: %s", (uint8_t *)v19, 0x2Au);
      swift_arrayDestroy(v47, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v47, -1, -1);
      swift_slowDealloc(v19, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v57, v55);
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 168) + 8))(*(_QWORD *)(v1 + 184), *(_QWORD *)(v1 + 160));
      swift_bridgeObjectRelease_n(v12, 3);

      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    }
  }
  else
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v1 + 232));
  }
  v30 = *(_QWORD *)(v1 + 24);
  v31 = *(_QWORD *)(v1 + 176);
  v56 = *(_QWORD *)(v1 + 208);
  v58 = *(_QWORD *)(v1 + 184);
  v33 = *(_QWORD *)(v1 + 160);
  v32 = *(_QWORD *)(v1 + 168);
  v34 = *(_QWORD *)(v1 + 152);
  v35 = *(_QWORD *)(v1 + 128);
  loga = *(os_log_t *)(v1 + 136);
  v54 = *(_QWORD *)(v1 + 144);
  v36 = *(_QWORD *)(v1 + 120);
  *(_QWORD *)typea = *(_QWORD *)(v1 + 96);
  swift_bridgeObjectRetain(v35);
  swift_bridgeObjectRetain(v30);
  v48 = sub_10008BF34(v37, v35);
  swift_bridgeObjectRelease(v35);
  swift_bridgeObjectRelease(v30);
  v38 = sub_10004F36C(v30);
  swift_bridgeObjectRelease(v30);
  swift_bridgeObjectRetain(v35);
  v39 = sub_10008A074((uint64_t)v38, v35);
  swift_bridgeObjectRelease(v38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v31, v36, v33);
  v40 = sub_10005321C(v39);
  swift_release(v39);
  v41 = sub_100009174(&qword_1000B29F0, (uint64_t (*)(uint64_t))&type metadata accessor for AlbumID, (uint64_t)&protocol conformance descriptor for AlbumID);
  v42 = default argument 4 of SyncedPhotosFace.init(id:day:photos:cached:complete:)(v33, v41);
  SyncedPhotosFace.init(id:day:photos:cached:complete:)(v31, *(_QWORD *)typea, 0, v48, v40, v42 & 1, v33, v41);
  v43 = SyncedPhotosFace.streamify()(loga);
  (*(void (**)(uint64_t, os_log_t))(v54 + 8))(v34, loga);
  swift_task_dealloc(v56);
  swift_task_dealloc(v58);
  swift_task_dealloc(v31);
  swift_task_dealloc(v34);
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(v43);
}

uint64_t sub_1000889B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 152);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 216));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *sub_100088A18()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
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
  char v31;
  uint64_t v32;
  _QWORD *v33;
  _UNKNOWN **v34;
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
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  _QWORD *v66;
  _QWORD v67[6];

  v1 = v0;
  v2 = sub_10000629C(&qword_1000B1F58);
  __chkstk_darwin(v2);
  v4 = (char *)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DatabaseConnection.Location(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static Log.default.getter(v10);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Daemon Init", v16, 2u);
    swift_slowDealloc(v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  v17 = type metadata accessor for PhotosFaceNetworkMessageCenter();
  v18 = swift_allocObject(v17, 24, 7);
  v19 = sub_10000629C(&qword_1000B3B80);
  swift_allocObject(v19, 72, 7);
  *(_QWORD *)(v18 + 16) = sub_10005CCF4();
  v1[3] = v18;
  type metadata accessor for PhotosXPC(0);
  sub_10000629C(&qword_1000B3B88);
  v20 = static XPCConstants.serviceName.getter();
  v21 = XPCMessageCenter.__allocating_init(serviceName:client:)(v20);
  v22 = PhotosXPC.__allocating_init(messageCenter:)(v21);
  v1[2] = v22;
  type metadata accessor for PhotosFaceDatabase(0);
  default argument 0 of PhotosFaceDatabase.init(location:)();
  v23 = PhotosFaceDatabase.__allocating_init(location:)(v7);
  v1[10] = v23;
  v24 = type metadata accessor for PhotoCache(0);
  swift_allocObject(v24, *(unsigned int *)(v24 + 48), *(unsigned __int16 *)(v24 + 52));
  v25 = swift_retain(v23);
  v26 = sub_1000548AC(v25);
  swift_release(v23);
  v1[4] = v26;
  v27 = type metadata accessor for BackgroundTaskManager(0);
  swift_allocObject(v27, *(unsigned int *)(v27 + 48), *(unsigned __int16 *)(v27 + 52));
  v28 = sub_10008DF60();
  v1[15] = v28;
  type metadata accessor for XPCEventStream(0);
  v1[16] = XPCEventStream.__allocating_init()();
  v29 = type metadata accessor for NetworkMonitor();
  v30 = swift_allocObject(v29, 32, 7);
  *(_QWORD *)(v30 + 24) = 0;
  *(_QWORD *)(v30 + 16) = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DeviceMonitor()), "init");
  v1[17] = v30;
  v31 = static Platform.current.getter();
  v65 = v4;
  if ((v31 & 1) != 0)
  {
    v32 = type metadata accessor for WatchPhotoProcessor();
    v33 = (_QWORD *)swift_allocObject(v32, 40, 7);
    v33[2] = v26;
    v33[3] = v18;
    v34 = &off_1000AEAB8;
  }
  else
  {
    v32 = type metadata accessor for PhonePhotoProcessor();
    v33 = (_QWORD *)swift_allocObject(v32, 48, 7);
    v33[5] = 0;
    v33[2] = v26;
    v33[3] = v18;
    v34 = &off_1000AE4F8;
  }
  v33[4] = v22;
  v1[8] = v32;
  v1[9] = v34;
  v1[5] = v33;
  v66 = v1 + 5;
  v35 = type metadata accessor for AlbumProvider();
  v36 = swift_allocObject(v35, 24, 7);
  swift_retain_n(v22, 2);
  swift_retain(v26);
  v37 = swift_retain(v18);
  *(_QWORD *)(v36 + 16) = static TestProperties.watchFacePerDaySize.getter(v37);
  sub_10008ABC0((uint64_t)(v1 + 5), (uint64_t)v67);
  type metadata accessor for AlbumDatabase(0);
  v38 = swift_retain(v23);
  v39 = AlbumDatabase.__allocating_init(database:)(v38);
  v40 = sub_10000629C(&qword_1000B3B90);
  swift_allocObject(v40, 136, 7);
  swift_retain(v26);
  swift_retain(v18);
  swift_retain(v28);
  swift_retain(v30);
  v41 = sub_10008AC04(0, v22, v36, v67, v39, v28, v18, v26, v30, (uint64_t (*)(uint64_t))&type metadata accessor for AlbumDatabase, &qword_1000B32D8, (uint64_t)&protocol conformance descriptor for AlbumDatabase);
  swift_release(v22);
  swift_release(v36);
  swift_release(v39);
  swift_release(v28);
  swift_release(v18);
  swift_release(v26);
  v1[11] = v41;
  v42 = swift_retain(v22);
  v43 = static TestProperties.watchFacePerDaySize.getter(v42);
  v64 = type metadata accessor for ShuffleProvider();
  v44 = swift_allocObject(v64, 24, 7);
  *(_QWORD *)(v44 + 16) = v43;
  sub_10008ABC0((uint64_t)v66, (uint64_t)v67);
  type metadata accessor for ShuffleDatabase(0);
  v45 = swift_retain(v23);
  v46 = ShuffleDatabase.__allocating_init(database:)(v45);
  v47 = sub_10000629C(&qword_1000B3B98);
  swift_allocObject(v47, 136, 7);
  swift_retain(v26);
  swift_retain(v18);
  swift_retain(v28);
  swift_retain(v30);
  v48 = sub_10008AC04(1, v22, v44, v67, v46, v28, v18, v26, v30, (uint64_t (*)(uint64_t))&type metadata accessor for ShuffleDatabase, &qword_1000B3270, (uint64_t)&protocol conformance descriptor for ShuffleDatabase);
  swift_release(v22);
  swift_release(v44);
  swift_release(v46);
  swift_release(v28);
  swift_release(v18);
  swift_release(v26);
  v1[12] = v48;
  type metadata accessor for GalleryDatabase(0);
  v49 = swift_retain(v23);
  v50 = GalleryDatabase.__allocating_init(database:)(v49);
  v51 = swift_retain(v22);
  v52 = static TestProperties.gallerySize.getter(v51);
  v53 = swift_allocObject(v64, 24, 7);
  *(_QWORD *)(v53 + 16) = v52;
  sub_10008ABC0((uint64_t)v66, (uint64_t)v67);
  v54 = sub_10000629C(&qword_1000B3BA0);
  swift_allocObject(v54, 136, 7);
  swift_retain(v26);
  swift_retain(v18);
  swift_retain(v28);
  swift_retain(v30);
  swift_retain(v50);
  v55 = sub_10008AC04(2, v22, v53, v67, v50, v28, v18, v26, v30, (uint64_t (*)(uint64_t))&type metadata accessor for GalleryDatabase, &qword_1000B3138, (uint64_t)&protocol conformance descriptor for GalleryDatabase);
  swift_release(v22);
  swift_release(v53);
  swift_release(v50);
  swift_release(v28);
  swift_release(v18);
  swift_release(v26);
  v1[13] = v55;
  v56 = type metadata accessor for GalleryGeneratorSystem();
  v57 = (_QWORD *)swift_allocObject(v56, 40, 7);
  v57[2] = v28;
  v57[3] = v55;
  v57[4] = v50;
  v1[14] = v57;
  v58 = type metadata accessor for TaskPriority(0);
  v59 = (uint64_t)v65;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v65, 1, 1, v58);
  v60 = (_QWORD *)swift_allocObject(&unk_1000AECF0, 40, 7);
  v60[2] = 0;
  v60[3] = 0;
  v60[4] = v1;
  swift_retain(v28);
  swift_retain(v55);
  swift_retain(v1);
  v61 = sub_100057608(v59, (uint64_t)&unk_1000B3BB0, (uint64_t)v60);
  swift_release(v61);
  return v1;
}

uint64_t sub_100089150()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_1000B3BBC);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10003E42C;
  return sub_100089198();
}

uint64_t sub_100089198()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[5] = v0;
  v2 = type metadata accessor for Logger(0);
  v1[6] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[7] = v3;
  v1[8] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000891F8, 0, 0);
}

uint64_t sub_1000891F8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = static Log.default.getter(a1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Daemon Activate", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }
  v7 = v1[7];
  v6 = v1[8];
  v9 = v1[5];
  v8 = v1[6];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  v1[9] = *(_QWORD *)(v9 + 80);
  v10 = type metadata accessor for PhotosFaceDatabase(0);
  v11 = sub_100009174(&qword_1000B2B70, (uint64_t (*)(uint64_t))&type metadata accessor for PhotosFaceDatabase, (uint64_t)&protocol conformance descriptor for PhotosFaceDatabase);
  v12 = dispatch thunk of Actor.unownedExecutor.getter(v10, v11);
  return swift_task_switch(sub_100089310, v12, v13);
}

uint64_t sub_100089310()
{
  dispatch thunk of PhotosFaceDatabase.activate()();
  return swift_task_switch(sub_10008934C, 0, 0);
}

uint64_t sub_10008934C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v1 = *(_QWORD **)(v0 + 40);
  v2 = v1[8];
  v3 = v1[9];
  sub_10003D4FC(v1 + 5, v2);
  v4 = *(int **)(v3 + 8);
  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc(v4[1]);
  *(_QWORD *)(v0 + 80) = v5;
  *v5 = v0;
  v5[1] = sub_1000893C8;
  return v7(v2, v3);
}

uint64_t sub_1000893C8()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 80));
  return swift_task_switch(sub_10008941C, 0, 0);
}

uint64_t sub_10008941C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0[5];
  v0[11] = *(_QWORD *)(v1 + 16);
  v2 = type metadata accessor for CommunicationActor(0);
  v0[12] = v2;
  v3 = swift_retain(v1);
  v0[13] = static CommunicationActor.shared.getter(v3);
  v4 = sub_100009174(&qword_1000B1F78, (uint64_t (*)(uint64_t))&type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  v0[14] = v4;
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v2, v4);
  return swift_task_switch(sub_1000894C4, v5, v6);
}

uint64_t sub_1000894C4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_release(*(_QWORD *)(v0 + 104));
  PhotosXPC.registerSendMessage(callback:)(&unk_1000B3BC8, v1);
  swift_release(v1);
  return swift_task_switch(sub_100089520, 0, 0);
}

uint64_t sub_100089520(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v1[14];
  v3 = v1[12];
  v1[15] = *(_QWORD *)(v1[5] + 24);
  v1[16] = static CommunicationActor.shared.getter(a1);
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v3, v2);
  return swift_task_switch(sub_100089594, v4, v5);
}

uint64_t sub_100089594()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 128));
  sub_10003EE34(0, (uint64_t)&unk_1000B1FB0, 0, (uint64_t)&unk_1000AF1A0, (uint64_t)sub_10008DC30);
  return swift_task_switch(sub_1000895F8, 0, 0);
}

uint64_t sub_1000895F8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_1000B3BD0 + dword_1000B3BD0);
  v1 = (_QWORD *)swift_task_alloc(unk_1000B3BD4);
  *(_QWORD *)(v0 + 136) = v1;
  *v1 = v0;
  v1[1] = sub_100089658;
  return v3();
}

uint64_t sub_100089658()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 136));
  return swift_task_switch(sub_1000896AC, 0, 0);
}

uint64_t sub_1000896AC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_1000B3BD8 + dword_1000B3BD8);
  v1 = (_QWORD *)swift_task_alloc(unk_1000B3BDC);
  *(_QWORD *)(v0 + 144) = v1;
  *v1 = v0;
  v1[1] = sub_10008970C;
  return v3();
}

uint64_t sub_10008970C()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 144));
  return swift_task_switch(sub_100089760, 0, 0);
}

uint64_t sub_100089760()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_1000B3BE0 + dword_1000B3BE0);
  v1 = (_QWORD *)swift_task_alloc(unk_1000B3BE4);
  *(_QWORD *)(v0 + 152) = v1;
  *v1 = v0;
  v1[1] = sub_1000897C0;
  return v3();
}

uint64_t sub_1000897C0()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 152));
  return swift_task_switch(sub_100089814, 0, 0);
}

uint64_t sub_100089814()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_1000B30FC);
  *(_QWORD *)(v0 + 160) = v1;
  *v1 = v0;
  v1[1] = sub_100089860;
  return sub_1000243B4();
}

uint64_t sub_100089860()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 160));
  return swift_task_switch(sub_1000898B4, 0, 0);
}

uint64_t sub_1000898B4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + 120);
  *(_QWORD *)(v0 + 168) = v1;
  return swift_task_switch(sub_1000898D0, v1, 0);
}

void sub_1000898D0()
{
  sub_10008E140();
}

uint64_t sub_10008990C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v1[14];
  v3 = v1[12];
  v1[22] = static CommunicationActor.shared.getter(a1);
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v3, v2);
  return swift_task_switch(sub_100089974, v4, v5);
}

uint64_t sub_100089974()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;

  v1 = v0[15];
  swift_release(v0[22]);
  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  v4 = swift_allocObject(&unk_1000AED18, 24, 7);
  swift_weakInit(v4 + 16, v2);
  swift_beginAccess(v3 + 32, v0 + 2, 1, 0);
  v5 = *(_QWORD *)(v3 + 32);
  v6 = *(_QWORD *)(v3 + 40);
  *(_QWORD *)(v3 + 32) = &unk_1000B3BF0;
  *(_QWORD *)(v3 + 40) = v4;
  v7 = sub_100008214(v5, v6);
  v8 = (void *)static CommunicationActor.sharedQueue.getter(v7);
  NWListener.start(queue:)();

  v9 = (_QWORD *)swift_task_alloc(async function pointer to PhotosXPC.activate()[1]);
  v0[23] = v9;
  *v9 = v0;
  v9[1] = sub_100089A50;
  return PhotosXPC.activate()();
}

uint64_t sub_100089A50()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)(*v0 + 64);
  v3 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 184));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_100089AA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = type metadata accessor for CommunicationActor(0);
  v3[5] = v4;
  v3[6] = static CommunicationActor.shared.getter(v4);
  v5 = sub_100009174(&qword_1000B1F78, (uint64_t (*)(uint64_t))&type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  v3[7] = v5;
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  v3[8] = v6;
  v3[9] = v7;
  return swift_task_switch(sub_100089B40, v6, v7);
}

uint64_t sub_100089B40(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v1[7];
  v3 = v1[5];
  v1[10] = *(_QWORD *)(v1[4] + 24);
  v1[11] = static CommunicationActor.shared.getter(a1);
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v3, v2);
  v1[12] = v4;
  v1[13] = v5;
  return swift_task_switch(sub_100089BB0, v4, v5);
}

uint64_t sub_100089BB0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(char, uint64_t, uint64_t, char);

  v3 = (uint64_t (*)(char, uint64_t, uint64_t, char))((char *)&dword_1000B1FB8 + dword_1000B1FB8);
  v1 = (_QWORD *)swift_task_alloc(unk_1000B1FBC);
  v0[14] = v1;
  *v1 = v0;
  v1[1] = sub_100089C1C;
  return v3(0, v0[2], v0[3], 1);
}

uint64_t sub_100089C1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)();

  v6 = *(_QWORD **)v3;
  v7 = *(_QWORD *)(*(_QWORD *)v3 + 112);
  *(_QWORD *)(*(_QWORD *)v3 + 120) = v2;
  swift_task_dealloc(v7);
  if (v2)
  {
    v8 = v6[12];
    v9 = v6[13];
    v10 = sub_100089D04;
  }
  else
  {
    v6[16] = a2;
    v6[17] = a1;
    v8 = v6[12];
    v9 = v6[13];
    v10 = sub_100089C94;
  }
  return swift_task_switch(v10, v8, v9);
}

uint64_t sub_100089C94()
{
  _QWORD *v0;

  swift_release(v0[11]);
  return swift_task_switch(sub_100089CCC, v0[8], v0[9]);
}

uint64_t sub_100089CCC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 48));
  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 128));
}

uint64_t sub_100089D04()
{
  _QWORD *v0;

  swift_release(v0[11]);
  return swift_task_switch(sub_100089D3C, v0[8], v0[9]);
}

uint64_t sub_100089D3C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 48));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100089D70(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[3] = a1;
  v2[4] = a2;
  v3 = type metadata accessor for Logger(0);
  v2[5] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[6] = v4;
  v2[7] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100089DD0, 0, 0);
}

uint64_t sub_100089DD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  unint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::String v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v2 = *(_QWORD *)(v1 + 32);
  static Log.default.getter(a1);
  v3 = swift_bridgeObjectRetain_n(v2, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v18 = *(_QWORD *)(v1 + 48);
    v6 = *(_QWORD *)(v1 + 32);
    v19 = *(_QWORD *)(v1 + 40);
    v20 = *(_QWORD *)(v1 + 56);
    v7 = *(_QWORD *)(v1 + 24);
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v21 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain(v6);
    *(_QWORD *)(v1 + 16) = sub_100021438(v7, v6, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 16, v1 + 24, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease_n(v6, 3);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Hello: %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  }
  else
  {
    v11 = *(_QWORD *)(v1 + 48);
    v10 = *(_QWORD *)(v1 + 56);
    v12 = *(_QWORD *)(v1 + 40);
    swift_bridgeObjectRelease_n(*(_QWORD *)(v1 + 32), 2);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  v13 = *(_QWORD *)(v1 + 56);
  v14 = *(Swift::String *)(v1 + 24);
  v21 = 0x203A6F6C6C6548;
  v22 = 0xE700000000000000;
  String.append(_:)(v14);
  v15 = v21;
  v16 = v22;
  swift_task_dealloc(v13);
  return (*(uint64_t (**)(uint64_t, unint64_t))(v1 + 8))(v15, v16);
}

_QWORD *sub_100089FC0()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[3]);
  swift_release(v0[4]);
  sub_100022238(v0 + 5);
  swift_release(v0[10]);
  swift_release(v0[11]);
  swift_release(v0[12]);
  swift_release(v0[13]);
  swift_release(v0[14]);
  swift_release(v0[15]);
  swift_release(v0[16]);
  swift_release(v0[17]);
  return v0;
}

uint64_t sub_10008A034()
{
  uint64_t v0;

  sub_100089FC0();
  return swift_deallocClassInstance(v0, 144, 7);
}

uint64_t type metadata accessor for Daemon()
{
  return objc_opt_self(_TtC11photosfaced6Daemon);
}

uint64_t sub_10008A074(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3;
  char v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v3 = isStackAllocationSafe;
  v4 = *(_BYTE *)(a2 + 32);
  v5 = v4 & 0x3F;
  v6 = (1 << v4) + 63;
  v7 = v6 >> 6;
  v8 = 8 * (v6 >> 6);
  if (v5 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(8 * (v6 >> 6), 8), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    v9 = sub_10008A1F4((unint64_t *)((char *)&v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0)), v7, v3, a2);
    swift_release(a2);
  }
  else
  {
    v10 = (void *)swift_slowAlloc(v8, -1);
    bzero(v10, v8);
    v9 = sub_10008A1F4((unint64_t *)v10, v7, v3, a2);
    swift_release(a2);
    swift_slowDealloc(v10, -1, -1);
  }
  return v9;
}

uint64_t sub_10008A1F4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t, uint64_t, __n128);
  __n128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  void (*v29)(char *, uint64_t);
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  void (*v34)(char *, uint64_t, uint64_t, uint64_t, __n128);
  __n128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t *v42;
  void (*v43)(char *, uint64_t, uint64_t, uint64_t, __n128);
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t, __n128);
  uint64_t v50;

  v39 = a2;
  v42 = a1;
  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v38 - v12;
  v14 = sub_10000629C(&qword_1000B2B50);
  __chkstk_darwin(v14);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = *(_QWORD *)(a3 + 16);
  v40 = a3;
  if (v46)
  {
    v38 = v4;
    v45 = a3 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    v50 = *(_QWORD *)(v8 + 72);
    v17 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v8 + 16);
    v48 = a4 + 56;
    v49 = v17;
    v18 = swift_bridgeObjectRetain(a3);
    v41 = 0;
    v19 = 0;
    v44 = v16;
    while (1)
    {
      v49(v16, v45 + v50 * v19, v7, v18);
      v43 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, __n128))(v8 + 56);
      ((void (*)(char *, _QWORD, uint64_t, uint64_t))v43)(v16, 0, 1, v7);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v16, 1, v7) == 1)
      {
        v36 = v39;
        v37 = v41;
        goto LABEL_20;
      }
      v47 = v19;
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v16, v7);
      v20 = *(_QWORD *)(a4 + 40);
      v21 = sub_100009174(&qword_1000B3208, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      v22 = dispatch thunk of Hashable._rawHashValue(seed:)(v20, v7, v21);
      v23 = a4;
      v24 = -1 << *(_BYTE *)(a4 + 32);
      v25 = v22 & ~v24;
      if (((*(_QWORD *)(v48 + ((v25 >> 3) & 0xFFFFFFFFFFFFF8)) >> v25) & 1) == 0)
        break;
      v26 = ~v24;
      while (1)
      {
        ((void (*)(char *, unint64_t, uint64_t))v49)(v11, *(_QWORD *)(v23 + 48) + v25 * v50, v7);
        v27 = sub_100009174(&qword_1000B3588, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
        v28 = dispatch thunk of static Equatable.== infix(_:_:)(v11, v13, v7, v27);
        v29 = *(void (**)(char *, uint64_t))(v8 + 8);
        v29(v11, v7);
        if ((v28 & 1) != 0)
          break;
        v25 = (v25 + 1) & v26;
        if (((*(_QWORD *)(v48 + ((v25 >> 3) & 0xFFFFFFFFFFFFF8)) >> v25) & 1) == 0)
          goto LABEL_10;
      }
      result = ((uint64_t (*)(char *, uint64_t))v29)(v13, v7);
      v31 = (v25 >> 3) & 0x1FFFFFFFFFFFFFF8;
      v32 = *(unint64_t *)((char *)v42 + v31);
      *(unint64_t *)((char *)v42 + v31) = v32 | (1 << v25);
      if ((v32 & (1 << v25)) != 0)
        goto LABEL_12;
      v33 = __OFADD__(v41++, 1);
      v16 = v44;
      if (v33)
      {
        __break(1u);
        return result;
      }
      a4 = v23;
LABEL_13:
      v19 = v47 + 1;
      if (v47 + 1 == v46)
      {
        v36 = v39;
        v37 = v41;
        v43(v16, 1, 1, v7, v18);
        goto LABEL_20;
      }
    }
    v29 = *(void (**)(char *, uint64_t))(v8 + 8);
LABEL_10:
    v29(v13, v7);
LABEL_12:
    a4 = v23;
    v16 = v44;
    goto LABEL_13;
  }
  v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, __n128))(v8 + 56);
  v35 = swift_bridgeObjectRetain(a3);
  v37 = 0;
  v36 = v39;
  v34(v16, 1, 1, v7, v35);
LABEL_20:
  swift_bridgeObjectRelease(v40);
  swift_retain(a4);
  return sub_100054248(v42, v36, v37, a4);
}

uint64_t sub_10008A570(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, int a5, uint64_t a6, int a7)
{
  uint64_t v7;
  char v14;
  _QWORD *v15;

  v14 = *a4;
  v15 = (_QWORD *)swift_task_alloc(dword_1000B3C3C);
  *(_QWORD *)(v7 + 16) = v15;
  *v15 = v7;
  v15[1] = sub_10003E42C;
  return sub_100060CE8(a1, a2, a3, v14, a5, a6, a7);
}

uint64_t sub_10008A604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;

  *(_QWORD *)(v4 + 16) = a1;
  v8 = (_QWORD *)swift_task_alloc(dword_1000B3E14);
  *(_QWORD *)(v4 + 24) = v8;
  *v8 = v4;
  v8[1] = sub_10008DDF0;
  return sub_10008679C(a2, a3, a4);
}

uint64_t sub_10008A66C(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  *(_QWORD *)(v3 + 16) = a1;
  v4 = *a2;
  v5 = a2[1];
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)a3 + *a3);
  v6 = (_QWORD *)swift_task_alloc(a3[1]);
  *(_QWORD *)(v3 + 24) = v6;
  *v6 = v3;
  v6[1] = sub_10008DDF0;
  return v8(v4, v5);
}

uint64_t sub_10008A6D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;

  *(_QWORD *)(v4 + 16) = a1;
  v8 = (_QWORD *)swift_task_alloc(dword_1000B3F8C);
  *(_QWORD *)(v4 + 24) = v8;
  *v8 = v4;
  v8[1] = sub_10008DDF0;
  return sub_100086D7C(a2, a3, a4);
}

uint64_t sub_10008A740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;

  *(_QWORD *)(v4 + 16) = a1;
  v8 = (_QWORD *)swift_task_alloc(dword_1000B4164);
  *(_QWORD *)(v4 + 24) = v8;
  *v8 = v4;
  v8[1] = sub_10008A7A8;
  return sub_100087414(a2, a3, a4);
}

uint64_t sub_10008A7A8(uint64_t a1)
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

Swift::Int sub_10008A804(Swift::Int result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  BOOL v10;
  Swift::Int v11;
  uint64_t v12;
  uint64_t v13;
  Swift::UInt64 v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
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
  Swift::UInt64 v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
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
  _QWORD v52[9];

  v1 = result;
  v2 = (unint64_t)result >> 62;
  if ((unint64_t)result >> 62)
  {
    if (result < 0)
      v6 = result;
    else
      v6 = result & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(result);
    v3 = _CocoaArrayWrapper.endIndex.getter(v6);
    result = swift_bridgeObjectRelease(v1);
    if (v3)
    {
LABEL_3:
      sub_10000629C(&qword_1000B3758);
      result = static _SetStorage.allocate(capacity:)(v3);
      v4 = (_QWORD *)result;
      if (!v2)
        goto LABEL_4;
LABEL_11:
      if (v1 < 0)
        v7 = v1;
      else
        v7 = v1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v1);
      v5 = _CocoaArrayWrapper.endIndex.getter(v7);
      result = swift_bridgeObjectRelease(v1);
      if (!v5)
        return (Swift::Int)v4;
      goto LABEL_15;
    }
  }
  else
  {
    v3 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
  }
  v4 = &_swiftEmptySetSingleton;
  if (v2)
    goto LABEL_11;
LABEL_4:
  v5 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v5)
    return (Swift::Int)v4;
LABEL_15:
  v8 = (char *)(v4 + 7);
  v51 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v9 = 0;
    v49 = v1;
    while (1)
    {
      result = specialized _ArrayBuffer._getElementSlowPath(_:)(v9, v1);
      v10 = __OFADD__(v9++, 1);
      if (v10)
        break;
      v11 = result;
      Hasher.init(_seed:)(v52, v4[5]);
      v12 = *(_QWORD *)(*(_QWORD *)(v11 + 16) + 16);
      v13 = swift_retain(v12);
      v14 = NWConnection.identifier.getter(v13);
      swift_release(v12);
      Hasher._combine(_:)(v14);
      result = Hasher._finalize()();
      v15 = ~(-1 << *((_BYTE *)v4 + 32));
      v16 = result & v15;
      v17 = (result & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)&v8[8 * v17];
      v19 = 1 << (result & v15);
      if ((v19 & v18) != 0)
      {
        while (1)
        {
          v20 = *(_QWORD *)(v4[6] + 8 * v16);
          v21 = *(_QWORD *)(*(_QWORD *)(v20 + 16) + 16);
          swift_retain(v20);
          v22 = swift_retain(v21);
          v23 = NWConnection.identifier.getter(v22);
          swift_release(v21);
          v24 = *(_QWORD *)(*(_QWORD *)(v11 + 16) + 16);
          v25 = swift_retain(v24);
          v26 = NWConnection.identifier.getter(v25);
          swift_release(v20);
          result = swift_release(v24);
          if (v23 == v26)
            break;
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)&v8[8 * (v16 >> 6)];
          v19 = 1 << v16;
          if ((v18 & (1 << v16)) == 0)
          {
            v1 = v49;
            v5 = v51;
            goto LABEL_23;
          }
        }
        swift_unknownObjectRelease(v11);
        v1 = v49;
        v5 = v51;
        if (v9 == v51)
          return (Swift::Int)v4;
      }
      else
      {
LABEL_23:
        *(_QWORD *)&v8[8 * v17] = v19 | v18;
        *(_QWORD *)(v4[6] + 8 * v16) = v11;
        v27 = v4[2];
        v10 = __OFADD__(v27, 1);
        v28 = v27 + 1;
        if (v10)
          goto LABEL_36;
        v4[2] = v28;
        if (v9 == v5)
          return (Swift::Int)v4;
      }
    }
    __break(1u);
LABEL_36:
    __break(1u);
  }
  else
  {
    v29 = 0;
    v48 = v1 + 32;
    v50 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    while (v29 != v50)
    {
      v30 = *(_QWORD *)(v48 + 8 * v29);
      Hasher.init(_seed:)(v52, v4[5]);
      v31 = *(_QWORD *)(*(_QWORD *)(v30 + 16) + 16);
      swift_retain(v30);
      v32 = swift_retain(v31);
      v33 = NWConnection.identifier.getter(v32);
      swift_release(v31);
      Hasher._combine(_:)(v33);
      result = Hasher._finalize()();
      v34 = ~(-1 << *((_BYTE *)v4 + 32));
      v35 = result & v34;
      v36 = (result & (unint64_t)v34) >> 6;
      v37 = *(_QWORD *)&v8[8 * v36];
      v38 = 1 << (result & v34);
      if ((v38 & v37) != 0)
      {
        while (1)
        {
          v39 = *(_QWORD *)(v4[6] + 8 * v35);
          v40 = *(_QWORD *)(*(_QWORD *)(v39 + 16) + 16);
          swift_retain(v39);
          v41 = swift_retain(v40);
          v42 = NWConnection.identifier.getter(v41);
          swift_release(v40);
          v43 = *(_QWORD *)(*(_QWORD *)(v30 + 16) + 16);
          v44 = swift_retain(v43);
          v45 = NWConnection.identifier.getter(v44);
          swift_release(v39);
          result = swift_release(v43);
          if (v42 == v45)
            break;
          v35 = (v35 + 1) & v34;
          v36 = v35 >> 6;
          v37 = *(_QWORD *)&v8[8 * (v35 >> 6)];
          v38 = 1 << v35;
          if ((v37 & (1 << v35)) == 0)
            goto LABEL_33;
        }
        result = swift_release(v30);
      }
      else
      {
LABEL_33:
        *(_QWORD *)&v8[8 * v36] = v38 | v37;
        *(_QWORD *)(v4[6] + 8 * v35) = v30;
        v46 = v4[2];
        v10 = __OFADD__(v46, 1);
        v47 = v46 + 1;
        if (v10)
          goto LABEL_38;
        v4[2] = v47;
      }
      if (++v29 == v51)
        return (Swift::Int)v4;
    }
  }
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_10008ABC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10008AC04(char a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t), unint64_t *a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v13 = v12;
  *(_BYTE *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  *(_QWORD *)(v13 + 32) = a3;
  sub_10008ABC0((uint64_t)a4, v13 + 40);
  *(_QWORD *)(v13 + 80) = a5;
  *(_QWORD *)(v13 + 88) = a6;
  *(_QWORD *)(v13 + 96) = a7;
  *(_QWORD *)(v13 + 104) = a8;
  swift_retain(a3);
  swift_retain(a5);
  swift_retain(a2);
  swift_retain(a6);
  swift_retain(a7);
  swift_retain(a8);
  *(_QWORD *)(v13 + 112) = sub_10003E8D8((uint64_t)&_swiftEmptyArrayStorage);
  v21 = a10(0);
  v22 = sub_100009174(a11, a10, a12);
  v23 = dispatch thunk of PhotosFaceIDDatabase.database.getter(v21, v22);
  sub_100022238(a4);
  v24 = type metadata accessor for DeviceSyncTracker();
  v25 = swift_allocObject(v24, 32, 7);
  *(_QWORD *)(v25 + 16) = v23;
  *(_QWORD *)(v25 + 24) = 0x40BC200000000000;
  *(_QWORD *)(v13 + 120) = v25;
  *(_QWORD *)(v13 + 128) = a9;
  return v13;
}

uint64_t sub_10008AD3C()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10008AD68()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc(dword_1000B3BAC);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10003E42C;
  v2 = (_QWORD *)swift_task_alloc(dword_1000B3BBC);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_10003E42C;
  return sub_100089198();
}

uint64_t sub_10008ADD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc(dword_1000B3BC4);
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_10004E9FC;
  return sub_100089AA4(a1, a2, v2);
}

uint64_t sub_10008AE30()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10008AE54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_1000B3BEC);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100005B30;
  return sub_10005CE70(a1, v1);
}

uint64_t sub_10008AEA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for Message(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v3 | 7;
  v6 = ((*(_QWORD *)(v2 + 64) + v4 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  swift_release(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10008AF24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  int v10;
  uint64_t v11;
  int v12;
  _QWORD *v13;

  v6 = *(_QWORD *)(type metadata accessor for Message(0) - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v2 + 16);
  v9 = (char *)(v2 + 24);
  v10 = *(_DWORD *)(v2 + 28);
  v11 = v2 + v7;
  v12 = *(_DWORD *)(v2 + ((*(_QWORD *)(v6 + 64) + v7 + 3) & 0xFFFFFFFFFFFFFCLL));
  v13 = (_QWORD *)swift_task_alloc(dword_1000B3C0C);
  *(_QWORD *)(v3 + 16) = v13;
  *v13 = v3;
  v13[1] = sub_10003E42C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, char *, int, uint64_t, int))((char *)&dword_1000B3C08
                                                                                       + dword_1000B3C08))(a1, a2, v8, v9, v10, v11, v12);
}

uint64_t sub_10008AFEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc(dword_1000B3C1C);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10003E42C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000B3C18 + dword_1000B3C18))(a1, a2, v6);
}

uint64_t sub_10008B068()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for Message(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 20) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10008B0C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  int v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Message(0) - 8) + 80);
  v7 = *(_DWORD *)(v2 + 16);
  v8 = v2 + ((v6 + 20) & ~v6);
  v9 = (_QWORD *)swift_task_alloc(dword_1000B26B4);
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_10003E42C;
  return sub_100018D94(a1, a2, v7, v8);
}

uint64_t sub_10008B14C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v5 = (_QWORD *)swift_task_alloc(dword_1000B3C74);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003E42C;
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000B3E50 + dword_1000B3E50);
  v6 = (_QWORD *)swift_task_alloc(unk_1000B3E54);
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_10003E42C;
  return v8(a1, a2);
}

uint64_t sub_10008B1E0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v3 = (_QWORD *)swift_task_alloc(dword_1000B3C84);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10003E42C;
  v6 = (uint64_t (*)(uint64_t))((char *)&dword_1000B3E48 + dword_1000B3E48);
  v4 = (_QWORD *)swift_task_alloc(unk_1000B3E4C);
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_10003E42C;
  return v6(a1);
}

uint64_t sub_10008B268()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_1000B3C94);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10008DE30;
  return sub_100066A44();
}

uint64_t sub_10008B2B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc(dword_1000B3CA4);
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_10003E42C;
  return sub_100066D14(a1, a2, v2);
}

uint64_t sub_10008B314(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_1000B3CB4);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10008DE30;
  return sub_100067290(a1);
}

uint64_t sub_10008B364(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_1000B3CC4);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10008DE30;
  return sub_1000675B0(a1, v1);
}

uint64_t sub_10008B3B4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)swift_task_alloc(dword_1000B3CD4);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10003E42C;
  v4 = (uint64_t (*)(void))((char *)&dword_1000B3128 + dword_1000B3128);
  v2 = (_QWORD *)swift_task_alloc(unk_1000B312C);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_10003E42C;
  return v4();
}

uint64_t sub_10008B430()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)swift_task_alloc(dword_1000B3CE4);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10003E42C;
  v4 = (uint64_t (*)(void))((char *)&dword_1000B3D70 + dword_1000B3D70);
  v2 = (_QWORD *)swift_task_alloc(unk_1000B3D74);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_10003E42C;
  return v4();
}

uint64_t sub_10008B4AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v5 = (_QWORD *)swift_task_alloc(dword_1000B3CF4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003E42C;
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000B3E50 + dword_1000B3E50);
  v6 = (_QWORD *)swift_task_alloc(unk_1000B3E54);
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_10003E42C;
  return v8(a1, a2);
}

uint64_t sub_10008B540(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc(dword_1000B3D04);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10003E42C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000B3D00 + dword_1000B3D00))(a1, a2, v6);
}

uint64_t sub_10008B5C0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v3 = (_QWORD *)swift_task_alloc(dword_1000B3D14);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10003E42C;
  v6 = (uint64_t (*)(uint64_t))((char *)&dword_1000B3E48 + dword_1000B3E48);
  v4 = (_QWORD *)swift_task_alloc(unk_1000B3E4C);
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_10003E42C;
  return v6(a1);
}

uint64_t sub_10008B648(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc(dword_1000B1F74);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10003E42C;
  return sub_100005D50(a1, a2, v6);
}

uint64_t sub_10008B6B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v5 = (_QWORD *)swift_task_alloc(dword_1000B3D2C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003E42C;
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000B3DD0 + dword_1000B3DD0);
  v6 = (_QWORD *)swift_task_alloc(unk_1000B3DD4);
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_10003E42C;
  return v8(a1, a2);
}

uint64_t sub_10008B748(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc(dword_1000B3D3C);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10003E42C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000B3D38 + dword_1000B3D38))(a1, a2, v6);
}

uint64_t sub_10008B7C8()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)swift_task_alloc(dword_1000B3D4C);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10003E42C;
  v4 = (uint64_t (*)(void))((char *)&dword_1000B3D70 + dword_1000B3D70);
  v2 = (_QWORD *)swift_task_alloc(unk_1000B3D74);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_10003E42C;
  return v4();
}

uint64_t sub_10008B844(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _QWORD *v7;

  v4 = *(_QWORD *)(v1 + 24);
  v5 = *(_QWORD *)(v1 + 32);
  v6 = *(_BYTE *)(v1 + 16);
  v7 = (_QWORD *)swift_task_alloc(dword_1000B1F54);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10003E42C;
  return sub_100005850(a1, v6, v4, v5);
}

uint64_t sub_10008B8AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v7 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  v8 = (_QWORD *)swift_task_alloc(dword_1000B3D64);
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_10003E42C;
  return sub_100060A5C(a1, a2, v7, v6);
}

uint64_t sub_10008B91C()
{
  return 40;
}

__n128 sub_10008B928(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

BOOL sub_10008B93C(uint64_t a1, uint64_t a2, int a3)
{
  return sub_1000509CC(a1, a2, a3);
}

unint64_t *sub_10008B944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  unint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  unint64_t *v21;

  v20 = a2;
  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (uint64_t *)((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = *(_QWORD *)(a1 + 16);
  v12 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v11)
  {
    v19 = v4;
    v21 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_10004D740(0, v11, 0);
    v12 = v21;
    v13 = *(_QWORD *)(a4(0) - 8);
    v14 = a1 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
    v15 = *(_QWORD *)(v13 + 72);
    do
    {
      swift_getAtKeyPath(v10, v14, v20);
      v21 = v12;
      v17 = v12[2];
      v16 = v12[3];
      if (v17 >= v16 >> 1)
      {
        sub_10004D740(v16 > 1, v17 + 1, 1);
        v12 = v21;
      }
      v12[2] = v17 + 1;
      (*(void (**)(unint64_t, _QWORD *, uint64_t))(v8 + 32))((unint64_t)v12+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v17, v10, v7);
      v14 += v15;
      --v11;
    }
    while (v11);
  }
  return v12;
}

unint64_t *sub_10008BAA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  unint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  unint64_t *v21;

  v20 = a2;
  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (uint64_t *)((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = *(_QWORD *)(a1 + 16);
  v12 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v11)
  {
    v19 = v4;
    v21 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_10004D740(0, v11, 0);
    v12 = v21;
    v13 = *(_QWORD *)(sub_10000629C(a4) - 8);
    v14 = a1 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
    v15 = *(_QWORD *)(v13 + 72);
    do
    {
      swift_getAtKeyPath(v10, v14, v20);
      v21 = v12;
      v17 = v12[2];
      v16 = v12[3];
      if (v17 >= v16 >> 1)
      {
        sub_10004D740(v16 > 1, v17 + 1, 1);
        v12 = v21;
      }
      v12[2] = v17 + 1;
      (*(void (**)(unint64_t, _QWORD *, uint64_t))(v8 + 32))((unint64_t)v12+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v17, v10, v7);
      v14 += v15;
      --v11;
    }
    while (v11);
  }
  return v12;
}

unint64_t *sub_10008BC0C(uint64_t a1, uint64_t (*a2)(_QWORD, _QWORD, _QWORD), uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t *result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD v21[2];
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(_QWORD, _QWORD, _QWORD);
  unint64_t *v26;

  v7 = sub_10000629C(&qword_1000B35D0);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v13 = (char *)v21 - v12;
  result = (unint64_t *)&_swiftEmptyArrayStorage;
  v26 = (unint64_t *)&_swiftEmptyArrayStorage;
  v15 = *(_QWORD *)(a1 + 16);
  if (v15)
  {
    v21[1] = v3;
    v16 = *(_QWORD *)(v11 + 72);
    v23 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v17 = a1 + v23;
    v18 = (unint64_t *)&_swiftEmptyArrayStorage;
    v24 = a3;
    v25 = a2;
    v22 = v7;
    do
    {
      sub_10008BEA4(v17, (uint64_t)v13);
      if ((a2(v13, *(_QWORD *)&v13[*(int *)(v7 + 48)], v13[*(int *)(v7 + 64)]) & 1) != 0)
      {
        sub_10008BEEC((uint64_t)v13, (uint64_t)v10);
        if ((swift_isUniquelyReferenced_nonNull_native(v18) & 1) == 0)
          sub_10004D7C4(0, v18[2] + 1, 1);
        v18 = v26;
        v20 = v26[2];
        v19 = v26[3];
        if (v20 >= v19 >> 1)
        {
          sub_10004D7C4(v19 > 1, v20 + 1, 1);
          v18 = v26;
        }
        v18[2] = v20 + 1;
        sub_10008BEEC((uint64_t)v10, (uint64_t)v18 + v23 + v20 * v16);
        a2 = v25;
        v7 = v22;
      }
      else
      {
        sub_10000EA70((uint64_t)v13, &qword_1000B35D0);
      }
      v17 += v16;
      --v15;
    }
    while (v15);
    return v26;
  }
  return result;
}

uint64_t sub_10008BDE0(_QWORD *a1)
{
  return swift_getAssociatedConformanceWitness(a1[3], a1[1], *a1, &unk_100097754, &unk_10009775C);
}

uint64_t sub_10008BE00()
{
  return 40;
}

__n128 sub_10008BE0C(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

uint64_t sub_10008BE20()
{
  return 40;
}

__n128 sub_10008BE2C(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

uint64_t sub_10008BE40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc(dword_1000B3784);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003E42C;
  return sub_10004FFE4(a1, a2);
}

uint64_t sub_10008BEA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000629C(&qword_1000B35D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10008BEEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000629C(&qword_1000B35D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

char *sub_10008BF34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  char *result;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, unint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  char v29;
  void (*v30)(char *, uint64_t);
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  _QWORD *v47;
  char *v48;
  char *v49;

  v5 = type metadata accessor for UUID(0);
  v47 = *(_QWORD **)(v5 - 8);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v48 = (char *)&v35 - v9;
  v10 = type metadata accessor for StoredPhoto(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v42 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v45 = (char *)&v35 - v14;
  result = (char *)_swiftEmptyArrayStorage;
  v49 = (char *)_swiftEmptyArrayStorage;
  v41 = *(_QWORD *)(a1 + 16);
  if (v41)
  {
    v16 = 0;
    v17 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v43 = *(_QWORD *)(v11 + 72);
    v35 = v2;
    v36 = v17;
    v38 = a1 + v17;
    v39 = v11;
    v37 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 16);
    v46 = a2 + 56;
    v40 = v10;
    do
    {
      v44 = v16;
      v18 = v37(v45, v38 + v43 * v16, v10);
      StoredPhoto.localIdentifier.getter(v18);
      if (*(_QWORD *)(a2 + 16)
        && (v19 = *(_QWORD *)(a2 + 40),
            v20 = sub_100009174(&qword_1000B3208, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID), v21 = dispatch thunk of Hashable._rawHashValue(seed:)(v19, v5, v20), v22 = -1 << *(_BYTE *)(a2 + 32), v23 = v21 & ~v22, ((*(_QWORD *)(v46 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) != 0))
      {
        v24 = ~v22;
        v25 = v47[9];
        v26 = (void (*)(char *, unint64_t, uint64_t))v47[2];
        while (1)
        {
          v27 = a2;
          v26(v8, *(_QWORD *)(a2 + 48) + v25 * v23, v5);
          v28 = sub_100009174(&qword_1000B3588, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
          v29 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v48, v5, v28);
          v30 = (void (*)(char *, uint64_t))v47[1];
          v30(v8, v5);
          if ((v29 & 1) != 0)
            break;
          v23 = (v23 + 1) & v24;
          a2 = v27;
          if (((*(_QWORD *)(v46 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
            goto LABEL_10;
        }
        v30(v48, v5);
        v10 = v40;
        (*(void (**)(char *, uint64_t))(v39 + 8))(v45, v40);
        a2 = v27;
      }
      else
      {
LABEL_10:
        ((void (*)(char *, uint64_t))v47[1])(v48, v5);
        v10 = v40;
        v31 = *(void (**)(char *, char *, uint64_t))(v39 + 32);
        v31(v42, v45, v40);
        v32 = v49;
        if ((swift_isUniquelyReferenced_nonNull_native(v49) & 1) == 0)
        {
          sub_10004D798(0, *((_QWORD *)v32 + 2) + 1, 1);
          v32 = v49;
        }
        v34 = *((_QWORD *)v32 + 2);
        v33 = *((_QWORD *)v32 + 3);
        if (v34 >= v33 >> 1)
        {
          sub_10004D798(v33 > 1, v34 + 1, 1);
          v32 = v49;
        }
        *((_QWORD *)v32 + 2) = v34 + 1;
        v31(&v32[v36 + v34 * v43], v42, v10);
        v49 = v32;
      }
      v16 = v44 + 1;
    }
    while (v44 + 1 != v41);
    return v49;
  }
  return result;
}

uint64_t sub_10008C2A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v7 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  v8 = (_QWORD *)swift_task_alloc(dword_1000B3DE4);
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_10003E42C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1000B3DE0 + dword_1000B3DE0))(a1, a2, v7, v6);
}

uint64_t sub_10008C324(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = (_QWORD *)swift_task_alloc(dword_1000B3E1C);
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_10008DE30;
  return sub_100087B80(a1, a2, v6, v7, v8);
}

uint64_t sub_10008C39C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc(dword_1000B3E2C);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10003E42C;
  return ((uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_1000B3E28 + dword_1000B3E28))(a1, a2, v6);
}

uint64_t sub_10008C41C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10008C440@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_10005FB84(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), (uint64_t)&unk_1000AEED0, (uint64_t)&unk_1000B3E40, a2);
}

uint64_t sub_10008C46C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MessageBody(0) - 8) + 80);
  v7 = *(_QWORD *)(v2 + 16);
  v8 = *(_QWORD *)(v2 + 24);
  v9 = v2 + ((v6 + 32) & ~v6);
  v10 = (_QWORD *)swift_task_alloc(dword_1000B3E3C);
  *(_QWORD *)(v3 + 16) = v10;
  *v10 = v3;
  v10[1] = sub_10003E42C;
  return sub_10006019C(a1, a2, v7, v8, v9);
}

uint64_t sub_10008C4FC()
{
  return sub_10008DBB8((uint64_t (*)(_QWORD))&type metadata accessor for ShuffleID);
}

uint64_t sub_10008C508(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ShuffleID(0) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = v1 + ((v4 + 24) & ~v4);
  v7 = (_QWORD *)swift_task_alloc(dword_1000B3E5C);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10003E42C;
  return sub_10006DC08(a1, v5, v6);
}

uint64_t sub_10008C588(__int128 *a1, uint64_t a2)
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

uint64_t sub_10008C5A0()
{
  return sub_10008DBB8((uint64_t (*)(_QWORD))&type metadata accessor for ShuffleID);
}

uint64_t sub_10008C5AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ShuffleID(0) - 8) + 80);
  v7 = *(_QWORD *)(v2 + 16);
  v8 = v2 + ((v6 + 24) & ~v6);
  v9 = (_QWORD *)swift_task_alloc(dword_1000B3E6C);
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_10003E42C;
  return sub_10006E238(a1, a2, v7, v8);
}

uint64_t sub_10008C630()
{
  return sub_10008DBB8((uint64_t (*)(_QWORD))&type metadata accessor for FetchFaceRequest);
}

uint64_t sub_10008C63C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v5 = (_QWORD *)swift_task_alloc(dword_1000B3E84);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003E42C;
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000B3FB8 + dword_1000B3FB8);
  v6 = (_QWORD *)swift_task_alloc(unk_1000B3FBC);
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_10003E42C;
  return v8(a1, a2);
}

uint64_t sub_10008C6D0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v3 = (_QWORD *)swift_task_alloc(dword_1000B3E94);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10003E42C;
  v6 = (uint64_t (*)(uint64_t))((char *)&dword_1000B3FB0 + dword_1000B3FB0);
  v4 = (_QWORD *)swift_task_alloc(unk_1000B3FB4);
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_10003E42C;
  return v6(a1);
}

uint64_t sub_10008C758()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_1000B3EA4);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10008DE30;
  return sub_100066BCC();
}

uint64_t sub_10008C7A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc(dword_1000B3EB4);
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_10003E42C;
  return sub_100066EE8(a1, a2, v2);
}

uint64_t sub_10008C804(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_1000B3EC4);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10008DE30;
  return sub_10006733C(a1);
}

uint64_t sub_10008C854(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_1000B3ED4);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10008DE30;
  return sub_100067640(a1, v1);
}

uint64_t sub_10008C8A4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)swift_task_alloc(dword_1000B3EE4);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10003E42C;
  v4 = (uint64_t (*)(void))((char *)&dword_1000B3298 + dword_1000B3298);
  v2 = (_QWORD *)swift_task_alloc(unk_1000B329C);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_10003E42C;
  return v4();
}

uint64_t sub_10008C920()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)swift_task_alloc(dword_1000B3EF4);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10003E42C;
  v4 = (uint64_t (*)(void))((char *)&dword_1000B3F60 + dword_1000B3F60);
  v2 = (_QWORD *)swift_task_alloc(unk_1000B3F64);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_10003E42C;
  return v4();
}

uint64_t sub_10008C99C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v5 = (_QWORD *)swift_task_alloc(dword_1000B3F04);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003E42C;
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000B3FB8 + dword_1000B3FB8);
  v6 = (_QWORD *)swift_task_alloc(unk_1000B3FBC);
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_10003E42C;
  return v8(a1, a2);
}

uint64_t sub_10008CA30(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v3 = (_QWORD *)swift_task_alloc(dword_1000B3F1C);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10003E42C;
  v6 = (uint64_t (*)(uint64_t))((char *)&dword_1000B3FB0 + dword_1000B3FB0);
  v4 = (_QWORD *)swift_task_alloc(unk_1000B3FB4);
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_10003E42C;
  return v6(a1);
}

uint64_t sub_10008CAB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v5 = (_QWORD *)swift_task_alloc(dword_1000B3F34);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003E42C;
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000B3F70 + dword_1000B3F70);
  v6 = (_QWORD *)swift_task_alloc(unk_1000B3F74);
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_10003E42C;
  return v8(a1, a2);
}

uint64_t sub_10008CB4C()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)swift_task_alloc(dword_1000B3F4C);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10003E42C;
  v4 = (uint64_t (*)(void))((char *)&dword_1000B3F60 + dword_1000B3F60);
  v2 = (_QWORD *)swift_task_alloc(unk_1000B3F64);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_10003E42C;
  return v4();
}

uint64_t sub_10008CBC8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

char *sub_10008CBEC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5, void (*a6)(BOOL, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *result;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, unint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  char v36;
  void (*v37)(char *, uint64_t);
  char *v38;
  unint64_t v39;
  unint64_t v40;
  _QWORD v41[2];
  void (*v42)(BOOL, uint64_t, uint64_t);
  unint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t);
  unint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  char *v59;
  char *v60;

  v42 = a6;
  v53 = a4;
  v54 = a5;
  v10 = type metadata accessor for UUID(0);
  v58 = *(_QWORD **)(v10 - 8);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v59 = (char *)v41 - v14;
  v52 = a3;
  v15 = a3(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = __chkstk_darwin(v15);
  v45 = (char *)v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v20 = (char *)v41 - v19;
  result = (char *)_swiftEmptyArrayStorage;
  v60 = (char *)_swiftEmptyArrayStorage;
  v51 = *(_QWORD *)(a1 + 16);
  if (v51)
  {
    v41[1] = v6;
    v22 = 0;
    v23 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    v55 = *(_QWORD *)(v16 + 72);
    v43 = v23;
    v50 = a1 + v23;
    v24 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
    v48 = v15;
    v49 = v24;
    v57 = a2 + 56;
    v46 = (char *)v41 - v19;
    v47 = v16;
    do
    {
      v56 = v22;
      v49(v20, v50 + v55 * v22, v15);
      v25 = sub_100009174(v53, v52, v54);
      dispatch thunk of PhotosFaceID.id.getter(v15, v25);
      if (*(_QWORD *)(a2 + 16)
        && (v26 = *(_QWORD *)(a2 + 40),
            v27 = sub_100009174(&qword_1000B3208, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID), v28 = dispatch thunk of Hashable._rawHashValue(seed:)(v26, v10, v27), v29 = -1 << *(_BYTE *)(a2 + 32), v30 = v28 & ~v29, ((*(_QWORD *)(v57 + ((v30 >> 3) & 0xFFFFFFFFFFFFF8)) >> v30) & 1) != 0))
      {
        v31 = ~v29;
        v32 = v58[9];
        v33 = (void (*)(char *, unint64_t, uint64_t))v58[2];
        while (1)
        {
          v34 = a2;
          v33(v13, *(_QWORD *)(a2 + 48) + v32 * v30, v10);
          v35 = sub_100009174(&qword_1000B3588, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
          v36 = dispatch thunk of static Equatable.== infix(_:_:)(v13, v59, v10, v35);
          v37 = (void (*)(char *, uint64_t))v58[1];
          v37(v13, v10);
          if ((v36 & 1) != 0)
            break;
          v30 = (v30 + 1) & v31;
          a2 = v34;
          if (((*(_QWORD *)(v57 + ((v30 >> 3) & 0xFFFFFFFFFFFFF8)) >> v30) & 1) == 0)
            goto LABEL_3;
        }
        v37(v59, v10);
        v20 = v46;
        v15 = v48;
        v44 = *(void (**)(char *, char *, uint64_t))(v47 + 32);
        v44(v45, v46, v48);
        v38 = v60;
        if ((swift_isUniquelyReferenced_nonNull_native(v60) & 1) == 0)
        {
          v42(0, *((_QWORD *)v38 + 2) + 1, 1);
          v38 = v60;
        }
        a2 = v34;
        v40 = *((_QWORD *)v38 + 2);
        v39 = *((_QWORD *)v38 + 3);
        if (v40 >= v39 >> 1)
        {
          v42(v39 > 1, v40 + 1, 1);
          v38 = v60;
        }
        *((_QWORD *)v38 + 2) = v40 + 1;
        v44(&v38[v43 + v40 * v55], v45, v15);
        v60 = v38;
      }
      else
      {
LABEL_3:
        ((void (*)(char *, uint64_t))v58[1])(v59, v10);
        v20 = v46;
        v15 = v48;
        (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v48);
      }
      v22 = v56 + 1;
    }
    while (v56 + 1 != v51);
    return v60;
  }
  return result;
}

uint64_t sub_10008CF9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v7 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  v8 = (_QWORD *)swift_task_alloc(dword_1000B3F7C);
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_10003E42C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1000B3F78 + dword_1000B3F78))(a1, a2, v7, v6);
}

uint64_t sub_10008D01C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = (_QWORD *)swift_task_alloc(dword_1000B3F94);
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_10008DE30;
  return sub_100087D2C(a1, a2, v6, v7, v8);
}

uint64_t sub_10008D094(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc(dword_1000B3FA4);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10003E42C;
  return ((uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_1000B3FA0 + dword_1000B3FA0))(a1, a2, v6);
}

uint64_t sub_10008D114()
{
  return sub_10008DBB8((uint64_t (*)(_QWORD))&type metadata accessor for ShuffleID);
}

uint64_t sub_10008D120(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ShuffleID(0) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = v1 + ((v4 + 24) & ~v4);
  v7 = (_QWORD *)swift_task_alloc(dword_1000B3FC4);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10003E42C;
  return sub_10006DE18(a1, v5, v6);
}

uint64_t sub_10008D1A0()
{
  return sub_10008DBB8((uint64_t (*)(_QWORD))&type metadata accessor for ShuffleID);
}

uint64_t sub_10008D1AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ShuffleID(0) - 8) + 80);
  v7 = *(_QWORD *)(v2 + 16);
  v8 = v2 + ((v6 + 24) & ~v6);
  v9 = (_QWORD *)swift_task_alloc(dword_1000B3FD4);
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_10003E42C;
  return sub_10006F48C(a1, a2, v7, v8);
}

uint64_t sub_10008D230()
{
  return sub_10008DBB8((uint64_t (*)(_QWORD))&type metadata accessor for FetchFaceRequest);
}

uint64_t sub_10008D23C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v5 = (_QWORD *)swift_task_alloc(dword_1000B3FEC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003E42C;
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000B4190 + dword_1000B4190);
  v6 = (_QWORD *)swift_task_alloc(unk_1000B4194);
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_10003E42C;
  return v8(a1, a2);
}

uint64_t sub_10008D2D0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v3 = (_QWORD *)swift_task_alloc(dword_1000B3FFC);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10003E42C;
  v6 = (uint64_t (*)(uint64_t))((char *)&dword_1000B4188 + dword_1000B4188);
  v4 = (_QWORD *)swift_task_alloc(unk_1000B418C);
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_10003E42C;
  return v6(a1);
}

uint64_t sub_10008D358()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_1000B400C);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10008DE30;
  return sub_100066C70();
}

uint64_t sub_10008D3A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc(dword_1000B401C);
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_10003E42C;
  return sub_1000670BC(a1, a2, v2);
}

uint64_t sub_10008D404(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_1000B402C);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10008DE30;
  return sub_1000673E8(a1);
}

uint64_t sub_10008D454(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_1000B403C);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10008DE30;
  return sub_100067768(a1, v1);
}

uint64_t sub_10008D4A4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)swift_task_alloc(dword_1000B404C);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10003E42C;
  v4 = (uint64_t (*)(void))((char *)&dword_1000B3300 + dword_1000B3300);
  v2 = (_QWORD *)swift_task_alloc(unk_1000B3304);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_10003E42C;
  return v4();
}

uint64_t sub_10008D520()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)swift_task_alloc(dword_1000B405C);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10003E42C;
  v4 = (uint64_t (*)(void))((char *)&dword_1000B40D8 + dword_1000B40D8);
  v2 = (_QWORD *)swift_task_alloc(unk_1000B40DC);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_10003E42C;
  return v4();
}

uint64_t sub_10008D59C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v5 = (_QWORD *)swift_task_alloc(dword_1000B406C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003E42C;
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000B4190 + dword_1000B4190);
  v6 = (_QWORD *)swift_task_alloc(unk_1000B4194);
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_10003E42C;
  return v8(a1, a2);
}

uint64_t sub_10008D630(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc(dword_1000B407C);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10003E42C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000B4078 + dword_1000B4078))(a1, a2, v6);
}

uint64_t sub_10008D6B0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v3 = (_QWORD *)swift_task_alloc(dword_1000B408C);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10003E42C;
  v6 = (uint64_t (*)(uint64_t))((char *)&dword_1000B4188 + dword_1000B4188);
  v4 = (_QWORD *)swift_task_alloc(unk_1000B418C);
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_10003E42C;
  return v6(a1);
}

uint64_t sub_10008D738(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v5 = (_QWORD *)swift_task_alloc(dword_1000B40A4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003E42C;
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000B4128 + dword_1000B4128);
  v6 = (_QWORD *)swift_task_alloc(unk_1000B412C);
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_10003E42C;
  return v8(a1, a2);
}

uint64_t sub_10008D7CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc(dword_1000B40B4);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100005B30;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000B40B0 + dword_1000B40B0))(a1, a2, v6);
}

uint64_t sub_10008D84C()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)swift_task_alloc(dword_1000B40C4);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10003E42C;
  v4 = (uint64_t (*)(void))((char *)&dword_1000B40D8 + dword_1000B40D8);
  v2 = (_QWORD *)swift_task_alloc(unk_1000B40DC);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_10003E42C;
  return v4();
}

uint64_t sub_10008D8C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v7 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  v8 = (_QWORD *)swift_task_alloc(dword_1000B4134);
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_10003E42C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_1000B4130 + dword_1000B4130))(a1, a2, v7, v6);
}

uint64_t sub_10008D948(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = (_QWORD *)swift_task_alloc(dword_1000B416C);
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_10008D9C0;
  return sub_100088370(a1, a2, v6, v7, v8);
}

uint64_t sub_10008D9C0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 16));
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_10008DA10(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc(dword_1000B417C);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10003E42C;
  return ((uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_1000B4178 + dword_1000B4178))(a1, a2, v6);
}

uint64_t sub_10008DA90()
{
  return sub_10008DBB8((uint64_t (*)(_QWORD))&type metadata accessor for AlbumID);
}

uint64_t sub_10008DA9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AlbumID(0) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = v1 + ((v4 + 24) & ~v4);
  v7 = (_QWORD *)swift_task_alloc(dword_1000B419C);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10003E42C;
  return sub_10006E028(a1, v5, v6);
}

uint64_t sub_10008DB1C()
{
  return sub_10008DBB8((uint64_t (*)(_QWORD))&type metadata accessor for AlbumID);
}

uint64_t sub_10008DB28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AlbumID(0) - 8) + 80);
  v7 = *(_QWORD *)(v2 + 16);
  v8 = v2 + ((v6 + 24) & ~v6);
  v9 = (_QWORD *)swift_task_alloc(dword_1000B41AC);
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_10003E42C;
  return sub_1000706A8(a1, a2, v7, v8);
}

uint64_t sub_10008DBAC()
{
  return sub_10008DBB8((uint64_t (*)(_QWORD))&type metadata accessor for FetchFaceRequest);
}

uint64_t sub_10008DBB8(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(unsigned __int8 *)(v3 + 80);
  v5 = (v4 + 24) & ~v4;
  v6 = v5 + *(_QWORD *)(v3 + 64);
  v7 = v4 | 7;
  swift_release(*(_QWORD *)(v1 + 16));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  return swift_deallocObject(v1, v6, v7);
}

uint64_t sub_10008DC30@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_10005FB84(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), (uint64_t)&unk_1000AF1C8, (uint64_t)&unk_1000B41C8, a2);
}

uint64_t sub_10008DC5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for MessageBody(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_release(*(_QWORD *)(v0 + 24));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10008DCD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MessageBody(0) - 8) + 80);
  v7 = *(_QWORD *)(v2 + 16);
  v8 = *(_QWORD *)(v2 + 24);
  v9 = v2 + ((v6 + 32) & ~v6);
  v10 = (_QWORD *)swift_task_alloc(dword_1000B41C4);
  *(_QWORD *)(v3 + 16) = v10;
  *v10 = v3;
  v10[1] = sub_10003E42C;
  return sub_10005FD04(a1, a2, v7, v8, v9);
}

uint64_t sub_10008DE34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unsigned __int8 v16;
  _QWORD v18[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10005BE00(a1);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (!v9)
    {
LABEL_6:
      v15 = 0;
      return swift_task_create(v8, v15, (char *)&type metadata for () + 8, a2, a3);
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v16 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (!v9)
      goto LABEL_6;
  }
  v10 = *(_QWORD *)(a3 + 24);
  ObjectType = swift_getObjectType(v9);
  swift_unknownObjectRetain(v9);
  v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
  v14 = v13;
  swift_unknownObjectRelease(v9);
  if (!(v14 | v12))
    goto LABEL_6;
  v18[0] = 0;
  v18[1] = 0;
  v15 = v18;
  v18[2] = v12;
  v18[3] = v14;
  return swift_task_create(v8, v15, (char *)&type metadata for () + 8, a2, a3);
}

uint64_t sub_10008DF60()
{
  uint64_t v0;
  uint64_t v1;
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
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  void *v19;

  v1 = v0;
  v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OS_dispatch_queue_serial.Attributes(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize(v1);
  sub_100092124();
  static DispatchQoS.unspecified.getter();
  v19 = &_swiftEmptyArrayStorage;
  v12 = sub_100009174(&qword_1000B4368, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue_serial.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue_serial.Attributes);
  v13 = sub_10000629C(&qword_1000B4370);
  v14 = sub_100092160();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v19, v13, v14, v6, v12);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v2);
  *(_QWORD *)(v1 + 112) = OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000015, 0x8000000100096EC0, v11, v8, v5, 0);
  ContinuousClock.init()();
  v15 = OBJC_IVAR____TtC11photosfaced21BackgroundTaskManager_registry;
  sub_10003E7D8((uint64_t)&_swiftEmptyArrayStorage);
  *(_QWORD *)(v1 + v15) = v16;
  return v1;
}

void sub_10008E140()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  uint64_t v10;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = static Log.default.getter(v2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "BackgroundTaskManager Activate", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  v9 = objc_msgSend((id)objc_opt_self(BGSystemTaskScheduler), "sharedScheduler");
  JUMPOUT(0x10008E28CLL);
}

uint64_t sub_10008E28C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  NSString v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0x8000000100094D30);
  v8 = swift_allocObject(&unk_1000AF360, 24, 7);
  swift_weakInit(v8 + 16, v0);
  v9 = swift_allocObject(&unk_1000AF388, 25, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_BYTE *)(v9 + 24) = v5;
  *(_QWORD *)(v6 - 112) = sub_100092000;
  *(_QWORD *)(v6 - 104) = v9;
  *(_QWORD *)(v6 - 144) = _NSConcreteStackBlock;
  *(_QWORD *)(v6 - 136) = 1107296256;
  *(_QWORD *)(v6 - 128) = sub_10008E838;
  *(_QWORD *)(v6 - 120) = &unk_1000AF3A0;
  v10 = _Block_copy((const void *)(v6 - 144));
  swift_release(*(_QWORD *)(v6 - 104));
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v7, v1, v10);
  _Block_release(v10);

  objc_msgSend(v2, "sharedScheduler");
  return ((uint64_t (*)(uint64_t))loc_10008E3F8)(v4 + 6);
}

uint64_t sub_10008E3DC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0x8000000100094D30);
  v10 = swift_allocObject(&unk_1000AF360, 24, 7);
  swift_weakInit(v10 + 16, v0);
  v11 = swift_allocObject(&unk_1000AF3D8, 25, 7);
  *(_QWORD *)(v11 + 16) = v10;
  *(_BYTE *)(v11 + 24) = v5;
  *(_QWORD *)(v7 - 112) = sub_1000921F0;
  *(_QWORD *)(v7 - 104) = v11;
  *(_QWORD *)(v7 - 144) = _NSConcreteStackBlock;
  *(_QWORD *)(v7 - 136) = v8;
  *(_QWORD *)(v7 - 128) = sub_10008E838;
  *(_QWORD *)(v7 - 120) = &unk_1000AF3F0;
  v12 = _Block_copy((const void *)(v7 - 144));
  swift_release(*(_QWORD *)(v7 - 104));
  objc_msgSend(v3, *(SEL *)(v6 + 2944), v9, v1, v12);
  _Block_release(v12);

  objc_msgSend(v2, "sharedScheduler");
  return ((uint64_t (*)(uint64_t))loc_10008E560)(v4 + 6);
}

uint64_t sub_10008E520()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0x8000000100094D30);
  v10 = swift_allocObject(&unk_1000AF360, 24, 7);
  swift_weakInit(v10 + 16, v0);
  v11 = swift_allocObject(&unk_1000AF428, 25, 7);
  *(_QWORD *)(v11 + 16) = v10;
  *(_BYTE *)(v11 + 24) = v5;
  *(_QWORD *)(v7 - 112) = sub_1000921F0;
  *(_QWORD *)(v7 - 104) = v11;
  *(_QWORD *)(v7 - 144) = _NSConcreteStackBlock;
  *(_QWORD *)(v7 - 136) = v8;
  *(_QWORD *)(v7 - 128) = sub_10008E838;
  *(_QWORD *)(v7 - 120) = &unk_1000AF440;
  v12 = _Block_copy((const void *)(v7 - 144));
  swift_release(*(_QWORD *)(v7 - 104));
  objc_msgSend(v3, *(SEL *)(v6 + 2944), v9, v1, v12);
  _Block_release(v12);

  objc_msgSend(v2, "sharedScheduler");
  return ((uint64_t (*)(uint64_t))loc_10008E690)(v4 + 6);
}

void sub_10008E664()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0x8000000100094D30);
  v8 = swift_allocObject(&unk_1000AF360, 24, 7);
  swift_weakInit(v8 + 16, v0);
  v9 = swift_allocObject(&unk_1000AF478, 25, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_BYTE *)(v9 + 24) = v3;
  *(_QWORD *)(v5 - 112) = sub_1000921F0;
  *(_QWORD *)(v5 - 104) = v9;
  *(_QWORD *)(v5 - 144) = _NSConcreteStackBlock;
  *(_QWORD *)(v5 - 136) = v6;
  *(_QWORD *)(v5 - 128) = sub_10008E838;
  *(_QWORD *)(v5 - 120) = &unk_1000AF490;
  v10 = _Block_copy((const void *)(v5 - 144));
  swift_release(*(_QWORD *)(v5 - 104));
  objc_msgSend(v2, *(SEL *)(v4 + 2944), v7, v1, v10);
  _Block_release(v10);

}

uint64_t sub_10008E7C8(void *a1, uint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  _BYTE v8[24];

  v5 = a2 + 16;
  swift_beginAccess(a2 + 16, v8, 0, 0);
  result = swift_weakLoadStrong(v5);
  if (result)
  {
    v7 = result;
    sub_10008EC4C(a3, a1);
    return swift_release(v7);
  }
  return result;
}

void sub_10008E838(uint64_t a1, void *a2)
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

uint64_t sub_10008E888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10008E990(a1, a2, a3, (uint64_t)&unk_1000AF338, (uint64_t)&unk_1000B4350);
}

uint64_t sub_10008E89C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_10008E8F4;
  return v5();
}

uint64_t sub_10008E8F4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*v1 + 24);
  v3 = *v1;
  swift_task_dealloc(v2);
  if (v0)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch(sub_10008E960, 0, 0);
}

uint64_t sub_10008E960()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)v1 = 0;
  *(_QWORD *)(v1 + 8) = 0;
  *(_BYTE *)(v1 + 16) = 1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10008E97C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10008E990(a1, a2, a3, (uint64_t)&unk_1000AF310, (uint64_t)&unk_1000B4330);
}

uint64_t sub_10008E990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  _QWORD *v11;
  uint64_t isUniquelyReferenced_nonNull_native;
  _QWORD *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t result;
  _QWORD *v30;
  _BYTE v31[24];

  v10 = swift_allocObject(a4, 32, 7);
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  v11 = (_QWORD *)(v5 + OBJC_IVAR____TtC11photosfaced21BackgroundTaskManager_registry);
  swift_beginAccess(v5 + OBJC_IVAR____TtC11photosfaced21BackgroundTaskManager_registry, v31, 33, 0);
  swift_retain(a3);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v11);
  v13 = (_QWORD *)*v11;
  v30 = (_QWORD *)*v11;
  *v11 = 0x8000000000000000;
  sub_10004A32C(a1);
  v16 = v15;
  v17 = v13[2];
  v18 = (v14 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    v13 = sub_1000914D0(0, v13[2] + 1, 1, v13, &qword_1000B4338);
    v11[v16] = v13;
    goto LABEL_10;
  }
  v20 = v14;
  if (v13[3] >= v19)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_10004D16C();
      v13 = v30;
    }
  }
  else
  {
    sub_10004B114(v19, isUniquelyReferenced_nonNull_native);
    v13 = v30;
    sub_10004A32C(a1);
    if ((v20 & 1) != (v22 & 1))
    {
      result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for BackgroundTaskType);
      __break(1u);
      return result;
    }
    v16 = v21;
  }
  v23 = *v11;
  *v11 = v13;
  swift_bridgeObjectRelease(v23);
  v24 = *v11;
  if ((v20 & 1) == 0)
    sub_10004C3C4(v16, a1, _swiftEmptyArrayStorage, *v11);
  v11 = *(_QWORD **)(v24 + 56);
  v13 = (_QWORD *)v11[v16];
  v25 = swift_isUniquelyReferenced_nonNull_native(v13);
  v11[v16] = v13;
  if ((v25 & 1) == 0)
    goto LABEL_14;
LABEL_10:
  v27 = v13[2];
  v26 = v13[3];
  if (v27 >= v26 >> 1)
  {
    v13 = sub_1000914D0((_QWORD *)(v26 > 1), v27 + 1, 1, v13, &qword_1000B4338);
    v11[v16] = v13;
  }
  v13[2] = v27 + 1;
  v28 = &v13[2 * v27];
  v28[4] = a5;
  v28[5] = v10;
  return swift_endAccess(v31);
}

uint64_t sub_10008EB80(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_10008EBD8;
  return v5();
}

uint64_t sub_10008EBD8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = *v4;
  v9 = *(_QWORD *)(*v4 + 24);
  v10 = *v4;
  swift_task_dealloc(v9);
  if (!v3)
  {
    v11 = *(_QWORD *)(v8 + 16);
    *(_QWORD *)v11 = a1;
    *(_QWORD *)(v11 + 8) = a2;
    *(_BYTE *)(v11 + 16) = a3 & 1;
  }
  return (*(uint64_t (**)(void))(v10 + 8))();
}

uint64_t sub_10008EC4C(char a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD aBlock[5];
  uint64_t v26;

  v3 = v2;
  v6 = sub_10000629C(&qword_1000B1F58);
  __chkstk_darwin(v6);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Analytics.BackgroundTask(0);
  v10 = swift_allocObject(v9, *(unsigned int *)(v9 + 48), *(unsigned __int16 *)(v9 + 52));
  static ContinuousClock.Instant.now.getter(v10);
  *(_BYTE *)(v10 + OBJC_IVAR____TtCC11photosfaced9Analytics14BackgroundTask_errored) = 0;
  v11 = v10 + OBJC_IVAR____TtCC11photosfaced9Analytics14BackgroundTask_cancelTime;
  v12 = type metadata accessor for ContinuousClock.Instant(0);
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56);
  v13(v11, 1, 1, v12);
  v13(v10 + OBJC_IVAR____TtCC11photosfaced9Analytics14BackgroundTask_endTime, 1, 1, v12);
  v14 = OBJC_IVAR____TtCC11photosfaced9Analytics14BackgroundTask_lock;
  v15 = sub_10000629C(&qword_1000B4310);
  v16 = swift_allocObject(v15, 20, 7);
  *(_DWORD *)(v16 + 16) = 0;
  *(_QWORD *)(v10 + v14) = v16;
  *(_BYTE *)(v10 + 16) = a1;
  v17 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v8, 1, 1, v17);
  v18 = swift_allocObject(&unk_1000AF298, 64, 7);
  *(_QWORD *)(v18 + 16) = 0;
  *(_QWORD *)(v18 + 24) = 0;
  *(_QWORD *)(v18 + 32) = v3;
  *(_QWORD *)(v18 + 40) = v10;
  *(_BYTE *)(v18 + 48) = a1;
  *(_QWORD *)(v18 + 56) = a2;
  swift_retain(v3);
  swift_retain(v10);
  v19 = a2;
  v20 = sub_10008DE34((uint64_t)v8, (uint64_t)&unk_1000B4320, v18);
  v21 = swift_allocObject(&unk_1000AF2C0, 40, 7);
  *(_BYTE *)(v21 + 16) = a1;
  *(_QWORD *)(v21 + 24) = v10;
  *(_QWORD *)(v21 + 32) = v20;
  aBlock[4] = sub_100091B20;
  v26 = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100090814;
  aBlock[3] = &unk_1000AF2D8;
  v22 = _Block_copy(aBlock);
  v23 = v26;
  swift_retain(v10);
  swift_retain(v20);
  swift_release(v23);
  objc_msgSend(v19, "setExpirationHandler:", v22);
  _Block_release(v22);
  swift_release(v10);
  return swift_release(v20);
}

uint64_t sub_10008EE9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  *(_QWORD *)(v7 + 136) = a5;
  *(_QWORD *)(v7 + 144) = a7;
  *(_BYTE *)(v7 + 304) = a6;
  *(_QWORD *)(v7 + 128) = a4;
  v8 = type metadata accessor for Logger(0);
  *(_QWORD *)(v7 + 152) = v8;
  v9 = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 160) = v9;
  v10 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v7 + 168) = swift_task_alloc(v10);
  *(_QWORD *)(v7 + 176) = swift_task_alloc(v10);
  *(_QWORD *)(v7 + 184) = swift_task_alloc(v10);
  v11 = type metadata accessor for ContinuousClock.Instant(0);
  *(_QWORD *)(v7 + 192) = v11;
  v12 = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v7 + 200) = v12;
  v13 = (*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v7 + 208) = swift_task_alloc(v13);
  *(_QWORD *)(v7 + 216) = swift_task_alloc(v13);
  *(_QWORD *)(v7 + 224) = swift_task_alloc(v13);
  *(_QWORD *)(v7 + 232) = swift_task_alloc(v13);
  *(_QWORD *)(v7 + 240) = swift_task_alloc(v13);
  *(_QWORD *)(v7 + 248) = swift_task_alloc(v13);
  *(_QWORD *)(v7 + 256) = swift_task_alloc(v13);
  return swift_task_switch(sub_10008EFC0, 0, 0);
}

uint64_t sub_10008EFC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 256);
  v2 = *(_QWORD *)(v0 + 136);
  *(_QWORD *)(v0 + 264) = OBJC_IVAR____TtC11photosfaced21BackgroundTaskManager_clock;
  ContinuousClock.now.getter();
  v3 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtCC11photosfaced9Analytics14BackgroundTask_lock);
  *(_QWORD *)(v0 + 272) = v3;
  v4 = swift_task_alloc(32);
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v1;
  v5 = swift_task_alloc(32);
  *(_QWORD *)(v5 + 16) = sub_100091B44;
  *(_QWORD *)(v5 + 24) = v4;
  os_unfair_lock_lock(v3 + 4);
  (*(void (**)(void))(v5 + 16))();
  os_unfair_lock_unlock(v3 + 4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v4);
  v6 = (_QWORD *)swift_task_alloc(dword_1000B4234);
  *(_QWORD *)(v0 + 280) = v6;
  *v6 = v0;
  v6[1] = sub_10008F108;
  return sub_100090840(*(_BYTE *)(v0 + 304));
}

uint64_t sub_10008F108(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);

  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 280);
  *(_QWORD *)(v5 + 288) = a1;
  *(_QWORD *)(v5 + 296) = v2;
  swift_task_dealloc(v6);
  if (v2)
  {
    v7 = sub_10008FF30;
  }
  else
  {
    *(_BYTE *)(v5 + 305) = a2;
    v7 = sub_10008F1C8;
  }
  return swift_task_switch(v7, 0, 0);
}

uint64_t sub_10008F1C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  _DWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  os_unfair_lock_s *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t result;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  unsigned int v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  _DWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  os_unfair_lock_s *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t (*v79)(void);
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t, uint64_t);
  uint64_t v89;
  os_unfair_lock_s *v90;
  uint64_t v91;
  void *v92;
  unsigned int v93;
  void *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  os_log_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  os_log_t log;
  os_log_t loga;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;

  if ((*(_BYTE *)(v1 + 305) & 1) != 0)
  {
    v12 = *(_QWORD *)(v1 + 248);
    v13 = *(_QWORD *)(v1 + 256);
    v14 = *(_QWORD *)(v1 + 192);
    v15 = *(_QWORD *)(v1 + 200);
    v16 = *(_QWORD *)(v1 + 128);
    static Log.session.getter(a1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v12, v13, v14);
    v17 = swift_retain_n(v16, 2);
    v18 = Logger.logObject.getter(v17);
    LOBYTE(v13) = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, (os_log_type_t)v13))
    {
      v19 = *(unsigned __int8 *)(v1 + 304);
      v20 = (_DWORD *)swift_slowAlloc(22, -1);
      swift_slowAlloc(64, -1);
      *v20 = 136315394;
      __asm { BR              X9 }
    }
    v29 = *(_QWORD *)(v1 + 248);
    v30 = *(_QWORD *)(v1 + 192);
    v31 = *(_QWORD *)(v1 + 200);
    v32 = *(_QWORD *)(v1 + 184);
    v33 = *(_QWORD *)(v1 + 152);
    v34 = *(_QWORD *)(v1 + 160);
    swift_release_n(*(_QWORD *)(v1 + 128), 2);
    v35 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
    v35(v29, v30);

    v62 = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 8))(v32, v33);
    v63 = *(_QWORD *)(v1 + 296);
    v64 = *(_QWORD *)(v1 + 216);
    v65 = *(_QWORD *)(v1 + 136);
    v66 = (os_unfair_lock_s *)(*(_QWORD *)(v1 + 272) + 16);
    static ContinuousClock.Instant.now.getter(v62);
    v67 = swift_task_alloc(32);
    *(_QWORD *)(v67 + 16) = v65;
    *(_QWORD *)(v67 + 24) = v64;
    v68 = swift_task_alloc(32);
    *(_QWORD *)(v68 + 16) = sub_100091B74;
    *(_QWORD *)(v68 + 24) = v67;
    os_unfair_lock_lock(v66);
    (*(void (**)(void))(v68 + 16))();
    os_unfair_lock_unlock(v66);
    result = swift_task_dealloc(v68);
    if (!v63)
    {
      v69 = *(_QWORD *)(v1 + 216);
      v70 = *(_QWORD *)(v1 + 192);
      v71 = *(void **)(v1 + 144);
      swift_task_dealloc(v67);
      v35(v69, v70);
      objc_msgSend(v71, "setTaskCompleted");
      goto LABEL_16;
    }
  }
  else
  {
    v2 = *(_QWORD *)(v1 + 128);
    v3 = *(double *)(v1 + 288);
    v4 = *(_QWORD *)(v1 + 256);
    v5 = *(_QWORD *)(v1 + 240);
    v6 = *(_QWORD *)(v1 + 192);
    v7 = *(_QWORD *)(v1 + 200);
    static Log.session.getter(a1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v4, v6);
    v8 = swift_retain_n(v2, 2);
    v9 = Logger.logObject.getter(v8);
    LOBYTE(v2) = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, (os_log_type_t)v2))
    {
      v10 = *(unsigned __int8 *)(v1 + 304);
      v11 = (_DWORD *)swift_slowAlloc(32, -1);
      swift_slowAlloc(64, -1);
      *v11 = 136315650;
      __asm { BR              X9 }
    }
    v21 = *(_QWORD *)(v1 + 240);
    v22 = *(_QWORD *)(v1 + 192);
    v23 = *(_QWORD *)(v1 + 200);
    v24 = *(_QWORD *)(v1 + 176);
    v25 = *(_QWORD *)(v1 + 152);
    v26 = *(_QWORD *)(v1 + 160);
    swift_release_n(*(_QWORD *)(v1 + 128), 2);
    v27 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v27(v21, v22);

    v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
    v36 = *(_QWORD *)(v1 + 296);
    v37 = *(_QWORD *)(v1 + 224);
    v38 = *(_QWORD *)(v1 + 136);
    v39 = (os_unfair_lock_s *)(*(_QWORD *)(v1 + 272) + 16);
    static ContinuousClock.Instant.now.getter(v28);
    v40 = swift_task_alloc(32);
    *(_QWORD *)(v40 + 16) = v38;
    *(_QWORD *)(v40 + 24) = v37;
    v41 = swift_task_alloc(32);
    *(_QWORD *)(v41 + 16) = sub_1000921DC;
    *(_QWORD *)(v41 + 24) = v40;
    os_unfair_lock_lock(v39);
    (*(void (**)(void))(v41 + 16))();
    os_unfair_lock_unlock(v39);
    result = swift_task_dealloc(v41);
    if (!v36)
    {
      v43 = *(_QWORD *)(v1 + 224);
      v44 = *(_QWORD *)(v1 + 192);
      v45 = *(void **)(v1 + 144);
      swift_task_dealloc(v40);
      v27(v43, v44);
      *(_QWORD *)(v1 + 96) = 0;
      v46 = objc_msgSend(v45, "setTaskExpiredWithRetryAfter:error:", v1 + 96, v3);
      v47 = *(void **)(v1 + 96);
      if (v46)
      {
        v48 = v47;
LABEL_17:
        v73 = *(_QWORD *)(v1 + 248);
        v72 = *(_QWORD *)(v1 + 256);
        v75 = *(_QWORD *)(v1 + 232);
        v74 = *(_QWORD *)(v1 + 240);
        v77 = *(_QWORD *)(v1 + 216);
        v76 = *(_QWORD *)(v1 + 224);
        v78 = *(_QWORD *)(v1 + 192);
        v105 = *(_QWORD *)(v1 + 208);
        log = *(os_log_t *)(v1 + 184);
        v109 = *(_QWORD *)(v1 + 176);
        v111 = *(_QWORD *)(v1 + 168);
        sub_10001FDFC();
        v27(v72, v78);
        swift_task_dealloc(v72);
        swift_task_dealloc(v73);
        swift_task_dealloc(v74);
        swift_task_dealloc(v75);
        swift_task_dealloc(v76);
        swift_task_dealloc(v77);
        swift_task_dealloc(v105);
        swift_task_dealloc(log);
        swift_task_dealloc(v109);
        swift_task_dealloc(v111);
        v79 = *(uint64_t (**)(void))(v1 + 8);
        return v79();
      }
      v49 = v47;
      v50 = _convertNSErrorToError(_:)(v47);

      v52 = swift_willThrow(v51);
      v53 = *(_QWORD *)(v1 + 256);
      v55 = *(_QWORD *)(v1 + 200);
      v54 = *(_QWORD *)(v1 + 208);
      v56 = *(_QWORD *)(v1 + 192);
      v57 = *(_QWORD *)(v1 + 128);
      static Log.session.getter(v52);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 16))(v54, v53, v56);
      swift_retain(v57);
      swift_errorRetain(v50);
      swift_retain(v57);
      v58 = swift_errorRetain(v50);
      v59 = Logger.logObject.getter(v58);
      LOBYTE(v53) = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v59, (os_log_type_t)v53))
      {
        v60 = *(unsigned __int8 *)(v1 + 304);
        v61 = (_DWORD *)swift_slowAlloc(32, -1);
        swift_slowAlloc(96, -1);
        *v61 = 136315650;
        __asm { BR              X9 }
      }
      v81 = *(_QWORD *)(v1 + 200);
      v80 = *(_QWORD *)(v1 + 208);
      v82 = *(_QWORD *)(v1 + 192);
      v84 = *(_QWORD *)(v1 + 160);
      v83 = *(_QWORD *)(v1 + 168);
      v85 = *(_QWORD *)(v1 + 152);
      v86 = *(_QWORD *)(v1 + 128);
      swift_errorRelease(v50);
      swift_errorRelease(v50);
      swift_release_n(v86, 2);
      v87 = *(void (**)(uint64_t, uint64_t))(v81 + 8);
      v87(v80, v82);

      v88 = *(void (**)(uint64_t, uint64_t))(v84 + 8);
      v35 = v87;
      v88(v83, v85);
      v89 = *(_QWORD *)(v1 + 136);
      v90 = (os_unfair_lock_s *)(*(_QWORD *)(v1 + 272) + 16);
      v91 = swift_task_alloc(32);
      *(_QWORD *)(v91 + 16) = sub_100091B5C;
      *(_QWORD *)(v91 + 24) = v89;
      os_unfair_lock_lock(v90);
      (*(void (**)(void))(v91 + 16))();
      os_unfair_lock_unlock(v90);
      swift_task_dealloc(v91);
      v92 = *(void **)(v1 + 144);
      *(_QWORD *)(v1 + 56) = 0;
      v93 = objc_msgSend(v92, "setTaskExpiredWithRetryAfter:error:", v1 + 56, 0.0);
      v94 = *(void **)(v1 + 56);
      if (!v93)
      {
        v97 = *(_QWORD *)(v1 + 248);
        v96 = *(_QWORD *)(v1 + 256);
        v101 = *(_QWORD *)(v1 + 240);
        v102 = *(os_log_t *)(v1 + 232);
        v103 = *(_QWORD *)(v1 + 224);
        v104 = *(_QWORD *)(v1 + 216);
        v98 = *(_QWORD *)(v1 + 192);
        v106 = *(_QWORD *)(v1 + 208);
        loga = *(os_log_t *)(v1 + 184);
        v110 = *(_QWORD *)(v1 + 176);
        v112 = *(_QWORD *)(v1 + 168);
        v99 = v94;
        _convertNSErrorToError(_:)(v94);

        swift_willThrow(v100);
        swift_errorRelease(v50);
        sub_10001FDFC();
        v87(v96, v98);
        swift_task_dealloc(v96);
        swift_task_dealloc(v97);
        swift_task_dealloc(v101);
        swift_task_dealloc(v102);
        swift_task_dealloc(v103);
        swift_task_dealloc(v104);
        swift_task_dealloc(v106);
        swift_task_dealloc(loga);
        swift_task_dealloc(v110);
        swift_task_dealloc(v112);
        v79 = *(uint64_t (**)(void))(v1 + 8);
        return v79();
      }
      v95 = v94;
      swift_errorRelease(v50);
LABEL_16:
      v27 = v35;
      goto LABEL_17;
    }
  }
  return result;
}

uint64_t sub_10008FF30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  os_unfair_lock_s *v21;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  void *v25;
  id v26;
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
  id v37;
  uint64_t v38;
  uint64_t v40;
  os_log_t log;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v2 = *(_QWORD *)(v1 + 296);
  v3 = *(_QWORD *)(v1 + 256);
  v5 = *(_QWORD *)(v1 + 200);
  v4 = *(_QWORD *)(v1 + 208);
  v6 = *(_QWORD *)(v1 + 192);
  v7 = *(_QWORD *)(v1 + 128);
  static Log.session.getter(a1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v3, v6);
  swift_retain(v7);
  swift_errorRetain(v2);
  swift_retain(v7);
  v8 = swift_errorRetain(v2);
  v9 = Logger.logObject.getter(v8);
  LOBYTE(v3) = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, (os_log_type_t)v3))
  {
    v10 = *(unsigned __int8 *)(v1 + 304);
    v11 = (_DWORD *)swift_slowAlloc(32, -1);
    swift_slowAlloc(96, -1);
    *v11 = 136315650;
    __asm { BR              X9 }
  }
  v13 = *(_QWORD *)(v1 + 200);
  v12 = *(_QWORD *)(v1 + 208);
  v14 = *(_QWORD *)(v1 + 192);
  v16 = *(_QWORD *)(v1 + 160);
  v15 = *(_QWORD *)(v1 + 168);
  v17 = *(_QWORD *)(v1 + 152);
  v18 = *(_QWORD *)(v1 + 128);
  swift_errorRelease(v2);
  swift_errorRelease(v2);
  swift_release_n(v18, 2);
  v19 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  v19(v12, v14);

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  v20 = *(_QWORD *)(v1 + 136);
  v21 = (os_unfair_lock_s *)(*(_QWORD *)(v1 + 272) + 16);
  v22 = swift_task_alloc(32);
  *(_QWORD *)(v22 + 16) = sub_100091B5C;
  *(_QWORD *)(v22 + 24) = v20;
  os_unfair_lock_lock(v21);
  (*(void (**)(void))(v22 + 16))();
  os_unfair_lock_unlock(v21);
  swift_task_dealloc(v22);
  v23 = *(void **)(v1 + 144);
  *(_QWORD *)(v1 + 56) = 0;
  v24 = objc_msgSend(v23, "setTaskExpiredWithRetryAfter:error:", v1 + 56, 0.0);
  v25 = *(void **)(v1 + 56);
  if (v24)
  {
    v26 = v25;
    swift_errorRelease(v2);
    v28 = *(_QWORD *)(v1 + 248);
    v27 = *(_QWORD *)(v1 + 256);
    v30 = *(_QWORD *)(v1 + 232);
    v29 = *(_QWORD *)(v1 + 240);
    v32 = *(_QWORD *)(v1 + 216);
    v31 = *(_QWORD *)(v1 + 224);
    v33 = *(_QWORD *)(v1 + 192);
    v44 = *(_QWORD *)(v1 + 208);
    v45 = *(_QWORD *)(v1 + 184);
    v46 = *(_QWORD *)(v1 + 176);
    v47 = *(_QWORD *)(v1 + 168);
    sub_10001FDFC();
    v19(v27, v33);
    swift_task_dealloc(v27);
    swift_task_dealloc(v28);
    swift_task_dealloc(v29);
    swift_task_dealloc(v30);
    swift_task_dealloc(v31);
    swift_task_dealloc(v32);
  }
  else
  {
    v35 = *(_QWORD *)(v1 + 248);
    v34 = *(_QWORD *)(v1 + 256);
    v40 = *(_QWORD *)(v1 + 240);
    log = *(os_log_t *)(v1 + 232);
    v42 = *(_QWORD *)(v1 + 224);
    v43 = *(_QWORD *)(v1 + 216);
    v36 = *(_QWORD *)(v1 + 192);
    v44 = *(_QWORD *)(v1 + 208);
    v45 = *(_QWORD *)(v1 + 184);
    v46 = *(_QWORD *)(v1 + 176);
    v47 = *(_QWORD *)(v1 + 168);
    v37 = v25;
    _convertNSErrorToError(_:)(v25);

    swift_willThrow(v38);
    swift_errorRelease(v2);
    sub_10001FDFC();
    v19(v34, v36);
    swift_task_dealloc(v34);
    swift_task_dealloc(v35);
    swift_task_dealloc(v40);
    swift_task_dealloc(log);
    swift_task_dealloc(v42);
    swift_task_dealloc(v43);
  }
  swift_task_dealloc(v44);
  swift_task_dealloc(v45);
  swift_task_dealloc(v46);
  swift_task_dealloc(v47);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_100090540(char a1, uint64_t a2, uint64_t a3)
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
  NSObject *v17;
  os_log_type_t v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t v21;
  os_unfair_lock_s *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v6 = type metadata accessor for ContinuousClock.Instant(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = static TestProperties.ignoreDuetCancellations.getter(v12);
  if ((v15 & 1) == 0)
  {
    v26 = a2;
    v27 = v6;
    v16 = static Log.session.getter(v15);
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v25 = a3;
      v19 = (_DWORD *)swift_slowAlloc(12, -1);
      v24 = swift_slowAlloc(32, -1);
      v28 = v24;
      *v19 = 136315138;
      __asm { BR              X10 }
    }

    v20 = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    static ContinuousClock.Instant.now.getter(v20);
    v21 = v26;
    v22 = (os_unfair_lock_s *)(*(_QWORD *)(v26 + OBJC_IVAR____TtCC11photosfaced9Analytics14BackgroundTask_lock) + 16);
    os_unfair_lock_lock(v22);
    sub_10001FCB4(v21, (uint64_t)v9);
    os_unfair_lock_unlock(v22);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v27);
    sub_10000629C(&qword_1000B2B48);
    Task.cancel()();
  }
}

uint64_t sub_100090814(uint64_t a1)
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

uint64_t sub_100090840(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 184) = v1;
  *(_BYTE *)(v2 + 105) = a1;
  v3 = type metadata accessor for Logger(0);
  *(_QWORD *)(v2 + 192) = v3;
  v4 = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 200) = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v2 + 208) = swift_task_alloc(v5);
  *(_QWORD *)(v2 + 216) = swift_task_alloc(v5);
  return swift_task_switch(sub_1000908B4, v1, 0);
}

uint64_t sub_1000908B4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  _QWORD *v28;
  uint64_t (*v29)(uint64_t);

  v1 = (uint64_t *)(*(_QWORD *)(v0 + 184) + OBJC_IVAR____TtC11photosfaced21BackgroundTaskManager_registry);
  swift_beginAccess(v1, v0 + 16, 0, 0);
  v2 = *v1;
  v3 = *(_QWORD *)(v2 + 16);
  swift_bridgeObjectRetain(v2);
  if (v3 && (sub_10004A32C(*(_BYTE *)(v0 + 105)), (v5 & 1) != 0))
  {
    v6 = *(_QWORD **)(*(_QWORD *)(v2 + 56) + 8 * v4);
    swift_bridgeObjectRetain(v6);
  }
  else
  {
    v6 = _swiftEmptyArrayStorage;
  }
  *(_QWORD *)(v0 + 224) = v6;
  v7 = swift_bridgeObjectRelease(v2);
  static Log.session.getter(v7);
  swift_bridgeObjectRetain(v6);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = *(unsigned __int8 *)(v0 + 105);
    v12 = swift_slowAlloc(22, -1);
    swift_slowAlloc(32, -1);
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)(v0 + 168) = v6[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 168, v0 + 176, v12 + 4, v12 + 12);
    swift_bridgeObjectRelease(v6);
    *(_WORD *)(v12 + 12) = 2080;
    __asm { BR              X9 }
  }
  v13 = *(_QWORD *)(v0 + 216);
  v14 = *(_QWORD *)(v0 + 192);
  v15 = *(_QWORD *)(v0 + 200);
  swift_bridgeObjectRelease(v6);

  v16 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v16(v13, v14);
  *(_QWORD *)(v0 + 232) = v16;
  v17 = v6[2];
  *(_QWORD *)(v0 + 240) = v17;
  if (v17)
  {
    v19 = (int *)v6[4];
    v18 = v6[5];
    v20 = swift_retain(v18);
    if ((static Task<>.isCancelled.getter(v20) & 1) != 0)
    {
      v21 = *(_QWORD *)(v0 + 224);
      swift_release(v18);
      swift_bridgeObjectRelease(v21);
      v22 = type metadata accessor for CancellationError(0);
      v23 = sub_100009174(&qword_1000B4308, (uint64_t (*)(uint64_t))&type metadata accessor for CancellationError, (uint64_t)&protocol conformance descriptor for CancellationError);
      swift_allocError(v22, v23, 0, 0);
      v24 = CancellationError.init()();
      swift_willThrow(v24);
      v25 = *(_QWORD *)(v0 + 208);
      swift_task_dealloc(*(_QWORD *)(v0 + 216));
      swift_task_dealloc(v25);
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    else
    {
      *(_QWORD *)(v0 + 248) = v18;
      *(_QWORD *)(v0 + 256) = 1;
      v29 = (uint64_t (*)(uint64_t))((char *)v19 + *v19);
      v28 = (_QWORD *)swift_task_alloc(v19[1]);
      *(_QWORD *)(v0 + 264) = v28;
      *v28 = v0;
      v28[1] = sub_100090C8C;
      return v29(v0 + 88);
    }
  }
  else
  {
    swift_bridgeObjectRelease(v6);
    v27 = *(_QWORD *)(v0 + 208);
    swift_task_dealloc(*(_QWORD *)(v0 + 216));
    swift_task_dealloc(v27);
    return (*(uint64_t (**)(_QWORD, uint64_t))(v0 + 8))(0, 1);
  }
}

uint64_t sub_100090C8C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = *(_QWORD *)(*v1 + 264);
  v3 = *v1;
  swift_task_dealloc(v2);
  v4 = *(_QWORD *)(v3 + 248);
  if (v0)
  {
    v5 = *(_QWORD *)(v3 + 224);
    swift_release(v4);
    swift_bridgeObjectRelease(v5);
    v6 = *(_QWORD *)(v3 + 208);
    swift_task_dealloc(*(_QWORD *)(v3 + 216));
    swift_task_dealloc(v6);
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  else
  {
    v8 = *(_QWORD *)(v3 + 184);
    swift_release(v4);
    *(_OWORD *)(v3 + 272) = *(_OWORD *)(v3 + 88);
    *(_BYTE *)(v3 + 106) = *(_BYTE *)(v3 + 104);
    return swift_task_switch(sub_100090D3C, v8, 0);
  }
}

uint64_t sub_100090D3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Swift::String v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t (*v36)(uint64_t);
  uint64_t v37;

  v1 = *(unsigned __int8 *)(v0 + 106);
  v3 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v0 + 280);
  if ((v1 & 1) == 0)
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 224));
    v5 = (double)Duration.components.getter(v3, v2);
    v6 = Duration.components.getter(v3, v2);
    v8 = (double)v7 / 1.0e18 + v5;
    *(double *)(v0 + 152) = v8;
    if (v8 < 300.0 || v8 > 64000000.0)
    {
      v10 = v0 + 40;
      v11 = static Log.session.getter(v6);
      v12 = Logger.logObject.getter(v11);
      v13 = static os_log_type_t.error.getter();
      v14 = os_log_type_enabled(v12, v13);
      v15 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
      v16 = *(_QWORD *)(v0 + 208);
      v17 = *(_QWORD *)(v0 + 192);
      if (v14)
      {
        v35 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
        v18 = swift_slowAlloc(22, -1);
        v34 = swift_slowAlloc(32, -1);
        *(_DWORD *)v18 = 134218242;
        v37 = v34;
        swift_beginAccess(v0 + 152, v0 + 64, 0, 0);
        *(_QWORD *)(v0 + 128) = *(_QWORD *)(v0 + 152);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 128, v0 + 136, v18 + 4, v18 + 12);
        *(_WORD *)(v18 + 12) = 2080;
        *(_OWORD *)(v0 + 136) = xmmword_100096F40;
        *(_QWORD *)(v0 + 112) = 0;
        *(_QWORD *)(v0 + 120) = 0xE000000000000000;
        _print_unlocked<A, B>(_:_:)(v0 + 136, v0 + 112, &type metadata for Double, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
        v19._countAndFlagsBits = 3026478;
        v19._object = (void *)0xE300000000000000;
        String.append(_:)(v19);
        v10 = v0 + 40;
        _print_unlocked<A, B>(_:_:)(v0 + 144, v0 + 112, &type metadata for Double, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
        v20 = *(_QWORD *)(v0 + 120);
        *(_QWORD *)(v0 + 160) = sub_100021438(*(_QWORD *)(v0 + 112), v20, &v37);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 160, v0 + 168, v18 + 14, v18 + 22);
        swift_bridgeObjectRelease(v20);
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Invalid Delay Duration: %f, clamping to %s", (uint8_t *)v18, 0x16u);
        swift_arrayDestroy(v34, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v34, -1, -1);
        swift_slowDealloc(v18, -1, -1);

        v35(v16, v17);
      }
      else
      {

        v15(v16, v17);
      }
      swift_beginAccess(v0 + 152, v10, 0, 0);
      v8 = fmax(*(double *)(v0 + 152), 300.0);
      if (v8 >= 64000000.0)
        v8 = 64000000.0;
    }
    v22 = v8;
    goto LABEL_17;
  }
  if (v3 | v2)
  {
    result = *(_QWORD *)(v0 + 224);
LABEL_12:
    swift_bridgeObjectRelease(result);
    v22 = 0.0;
LABEL_17:
    v23 = *(_QWORD *)(v0 + 208);
    swift_task_dealloc(*(_QWORD *)(v0 + 216));
    swift_task_dealloc(v23);
    return (*(uint64_t (**)(double, uint64_t))(v0 + 8))(COERCE_DOUBLE(*(_QWORD *)&v22), v1);
  }
  v21 = *(_QWORD *)(v0 + 256);
  result = *(_QWORD *)(v0 + 224);
  if (v21 == *(_QWORD *)(v0 + 240))
    goto LABEL_12;
  if (v21 >= *(_QWORD *)(result + 16))
  {
    __break(1u);
  }
  else
  {
    v24 = result + 16 * v21;
    v26 = *(int **)(v24 + 32);
    v25 = *(_QWORD *)(v24 + 40);
    v27 = swift_retain(v25);
    if ((static Task<>.isCancelled.getter(v27) & 1) != 0)
    {
      v28 = *(_QWORD *)(v0 + 224);
      swift_release(v25);
      swift_bridgeObjectRelease(v28);
      v29 = type metadata accessor for CancellationError(0);
      v30 = sub_100009174(&qword_1000B4308, (uint64_t (*)(uint64_t))&type metadata accessor for CancellationError, (uint64_t)&protocol conformance descriptor for CancellationError);
      swift_allocError(v29, v30, 0, 0);
      v31 = CancellationError.init()();
      swift_willThrow(v31);
      v32 = *(_QWORD *)(v0 + 208);
      swift_task_dealloc(*(_QWORD *)(v0 + 216));
      swift_task_dealloc(v32);
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    else
    {
      *(_QWORD *)(v0 + 248) = v25;
      *(_QWORD *)(v0 + 256) = v21 + 1;
      v36 = (uint64_t (*)(uint64_t))((char *)v26 + *v26);
      v33 = (_QWORD *)swift_task_alloc(v26[1]);
      *(_QWORD *)(v0 + 264) = v33;
      *v33 = v0;
      v33[1] = sub_100090C8C;
      return v36(v0 + 88);
    }
  }
  return result;
}

uint64_t sub_1000911B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC11photosfaced21BackgroundTaskManager_clock;
  v2 = type metadata accessor for ContinuousClock(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC11photosfaced21BackgroundTaskManager_registry));
  swift_defaultActor_destroy(v0);
  return swift_defaultActor_deallocate(v0);
}

uint64_t sub_100091214()
{
  return type metadata accessor for BackgroundTaskManager(0);
}

uint64_t type metadata accessor for BackgroundTaskManager(uint64_t a1)
{
  uint64_t result;

  result = qword_1000B4220;
  if (!qword_1000B4220)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for BackgroundTaskManager);
  return result;
}

uint64_t sub_100091258(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[4];

  v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  result = type metadata accessor for ContinuousClock(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(result - 8) + 64;
    v4[3] = (char *)&value witness table for Builtin.BridgeObject + 64;
    result = swift_updateClassMetadata2(a1, 256, 4, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for BackgroundTaskManager.Result(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for BackgroundTaskManager.Result(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for BackgroundTaskManager.Result(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 17) = v3;
  return result;
}

uint64_t sub_10009134C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100091368(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    *(_BYTE *)(result + 16) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundTaskManager.Result()
{
  return &type metadata for BackgroundTaskManager.Result;
}

uint64_t sub_100091398()
{
  uint64_t v0;

  return v0;
}

_QWORD *sub_1000913A4(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_1000914D0(a1, a2, a3, a4, &qword_1000B4358);
}

char *sub_1000913B0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_10000629C(&qword_1000B25A0);
      v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32])
          memmove(v14, a4 + 32, 16 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100091C20(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000914BC(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1000915EC(a1, a2, a3, a4, &qword_1000B3168, &qword_1000B28E0);
}

_QWORD *sub_1000914D0(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  int64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    v8 = a2;
    goto LABEL_8;
  }
  v7 = a4[3];
  v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2)
    goto LABEL_8;
  if (v8 + 0x4000000000000000 >= 0)
  {
    v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v8 = a2;
LABEL_8:
    v9 = a4[2];
    if (v8 <= v9)
      v10 = a4[2];
    else
      v10 = v8;
    if (v10)
    {
      v11 = sub_10000629C(a5);
      v12 = (_QWORD *)swift_allocObject(v11, 16 * v10 + 32, 7);
      v13 = j__malloc_size(v12);
      v14 = v13 - 32;
      if (v13 < 32)
        v14 = v13 - 17;
      v12[2] = v9;
      v12[3] = 2 * (v14 >> 4);
      v15 = v12 + 4;
      if ((v6 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v12 = _swiftEmptyArrayStorage;
      v15 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v12 != a4 || v15 >= &a4[2 * v9 + 4])
          memmove(v15, a4 + 4, 16 * v9);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_100091E28(0, v9, (unint64_t)v15, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000915D8(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1000915EC(a1, a2, a3, a4, &qword_1000B3230, &qword_1000B25D8);
}

uint64_t sub_1000915EC(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t *a6)
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
    v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v13 = sub_10000629C(a5);
  v14 = *(_QWORD *)(sub_10000629C(a6) - 8);
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
  v21 = sub_10000629C(a6);
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
    sub_10009200C(0, v11, v24, a4, a6);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v18;
}

uint64_t sub_1000917F8(char a1, int64_t a2, char a3, unint64_t a4)
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
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
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
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_10000629C(&qword_1000B3200);
  v11 = *(_QWORD *)(type metadata accessor for UUID(0) - 8);
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
  v18 = type metadata accessor for UUID(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(_QWORD *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_100091D10(0, v8, v21, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

uint64_t sub_100091A00(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1000915EC(a1, a2, a3, a4, &qword_1000B35C0, &qword_1000B25E0);
}

uint64_t sub_100091A14(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1000915EC(a1, a2, a3, a4, &qword_1000B3608, &qword_1000B25E8);
}

uint64_t sub_100091A28()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));

  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100091A64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 56);
  v9 = *(_BYTE *)(v1 + 48);
  v10 = (_QWORD *)swift_task_alloc(dword_1000B431C);
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_100005B30;
  return sub_10008EE9C(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_100091AF4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_100091B20()
{
  uint64_t v0;

  sub_100090540(*(_BYTE *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_100091B2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100091B3C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100091B44()
{
  uint64_t v0;

  return sub_10001FC38(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_100091B5C()
{
  uint64_t v0;

  return sub_10001FDE8(v0);
}

uint64_t sub_100091B74()
{
  uint64_t v0;

  return sub_10001FC1C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_100091B8C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100091BB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000B432C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003E42C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000B4328 + dword_1000B4328))(a1, v4);
}

uint64_t sub_100091C20(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100091D10(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  v8 = *(_QWORD *)(type metadata accessor for UUID(0) - 8);
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

uint64_t sub_100091E28(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v6 = a4 + 16 * a1 + 32;
    v7 = a3 + 16 * v4;
    if (v6 >= v7 || v6 + 16 * v4 <= a3)
    {
      sub_10000629C(&qword_1000B4340);
      swift_arrayInitWithCopy(a3);
      return v7;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100091F30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(void);

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000B434C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003E42C;
  v5[2] = a1;
  v8 = (uint64_t (*)(void))((char *)v4 + *v4);
  v6 = (_QWORD *)swift_task_alloc(v4[1]);
  v5[3] = v6;
  *v6 = v5;
  v6[1] = sub_10008E8F4;
  return v8();
}

uint64_t sub_100091FB8()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100091FDC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 25, 7);
}

uint64_t sub_100092000(void *a1)
{
  uint64_t v1;

  return sub_10008E7C8(a1, *(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24));
}

uint64_t sub_10009200C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
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
  v9 = *(_QWORD *)(sub_10000629C(a5) - 8);
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

unint64_t sub_100092124()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000B4360;
  if (!qword_1000B4360)
  {
    v1 = objc_opt_self(OS_dispatch_queue_serial);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000B4360);
  }
  return result;
}

unint64_t sub_100092160()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000B4378;
  if (!qword_1000B4378)
  {
    v1 = sub_100006410(&qword_1000B4370);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000B4378);
  }
  return result;
}

uint64_t sub_1000921DC()
{
  return sub_100091B74();
}

uint64_t getEnumTagSinglePayload for BackgroundTaskType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for BackgroundTaskType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000922D0 + 4 * byte_100096F55[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100092304 + 4 * byte_100096F50[v4]))();
}

uint64_t sub_100092304(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10009230C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100092314);
  return result;
}

uint64_t sub_100092320(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100092328);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_10009232C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100092334(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BackgroundTaskType()
{
  return &type metadata for BackgroundTaskType;
}

unint64_t sub_100092354()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000B4380;
  if (!qword_1000B4380)
  {
    v1 = sub_100006410(&qword_1000B4388);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000B4380);
  }
  return result;
}

void sub_1000923A0(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1000923E0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_100092444 + 4 * byte_100096F5E[a2]))(0x68736572666572);
}

uint64_t sub_100092444(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x68736572666572 && v1 == 0xE700000000000000)
    v2 = 1;
  else
    v2 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1, 0x68736572666572, 0xE700000000000000, 0);
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xE700000000000000);
  return v2 & 1;
}

void sub_1000924EC(char *a1)
{
  sub_1000923A0(*a1);
}

unint64_t sub_1000924F8@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10009285C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100092524()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_10009254C + 4 * byte_100096F62[*v0]))();
}

void sub_10009254C(_QWORD *a1@<X8>)
{
  *a1 = 0x68736572666572;
  a1[1] = 0xE700000000000000;
}

void sub_100092568(_QWORD *a1@<X8>)
{
  *a1 = 0x69737365636F7270;
  a1[1] = 0xEA0000000000676ELL;
}

void sub_100092588(_QWORD *a1@<X8>)
{
  *a1 = 0x70756D726177;
  a1[1] = 0xE600000000000000;
}

void sub_1000925A0()
{
  unsigned __int8 *v0;
  uint64_t v1;
  _QWORD v2[9];

  v1 = *v0;
  Hasher.init(_seed:)(v2, 0);
  __asm { BR              X9 }
}

Swift::Int sub_1000925E4()
{
  uint64_t v1;

  String.hash(into:)(&v1, 0x68736572666572, 0xE700000000000000);
  swift_bridgeObjectRelease(0xE700000000000000);
  return Hasher._finalize()();
}

void sub_100092654()
{
  __asm { BR              X10 }
}

uint64_t sub_100092688(uint64_t a1)
{
  String.hash(into:)(a1, 0x68736572666572, 0xE700000000000000);
  return swift_bridgeObjectRelease(0xE700000000000000);
}

void sub_1000926E4(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v2;
  _QWORD v3[9];

  v2 = *v1;
  Hasher.init(_seed:)(v3, a1);
  __asm { BR              X9 }
}

Swift::Int sub_100092724()
{
  uint64_t v1;

  String.hash(into:)(&v1, 0x68736572666572, 0xE700000000000000);
  swift_bridgeObjectRelease(0xE700000000000000);
  return Hasher._finalize()();
}

void sub_100092794(_QWORD *a1@<X8>)
{
  *a1 = &off_1000ADA08;
}

unint64_t sub_1000927A8()
{
  unint64_t result;

  result = qword_1000B4390;
  if (!qword_1000B4390)
  {
    result = swift_getWitnessTable(&unk_100097044, &type metadata for BackgroundTaskType);
    atomic_store(result, (unint64_t *)&qword_1000B4390);
  }
  return result;
}

uint64_t sub_1000927EC()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_100092814 + 4 * byte_100096F72[*v0]))(1668184435, 0xE400000000000000);
}

uint64_t sub_100092814()
{
  return 0x68736572666572;
}

uint64_t sub_10009282C()
{
  return 0x69737365636F7270;
}

uint64_t sub_100092848()
{
  return 0x70756D726177;
}

unint64_t sub_10009285C(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000AD988, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 4)
    return 4;
  else
    return v3;
}
