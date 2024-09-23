uint64_t sub_100376CC0(void *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 528);
  *(_QWORD *)(*v2 + 536) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = sub_1003776D8;
  }
  else
  {

    sub_10003D380((_QWORD *)(v4 + 160));
    v6 = sub_100376D40;
  }
  return swift_task_switch(v6, 0, 0);
}

char *sub_100376D40()
{
  uint64_t v0;
  char *result;
  unint64_t v2;
  uint64_t v3;
  int v4;
  void (*v5)(uint64_t, uint64_t);
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  __n128 v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  __n128 v28;
  void (*v29)(uint64_t, uint64_t, __n128);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_QWORD *, uint64_t, uint64_t);
  uint64_t v38;
  char *v39;
  uint64_t v40;
  _QWORD *v41;
  char *v42;
  uint64_t v43;
  _QWORD *v44;
  void (*v45)(uint64_t, uint64_t);
  void *v46;
  void *v47;
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
  void (*v68)(uint64_t, uint64_t);
  uint64_t v69;
  uint64_t (*v70)(uint64_t, char *, uint64_t);
  char *v71;
  uint64_t v72;
  uint64_t v73;

  result = (char *)sub_100378428();
  *(_QWORD *)(v0 + 544) = result;
  v2 = *((_QWORD *)result + 2);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 304);
    v4 = *(_DWORD *)(v3 + 80);
    *(_DWORD *)(v0 + 592) = v4;
    *(_DWORD *)(v0 + 596) = enum case for PlaybackController.QueueCommand.Location.queueHead(_:);
    *(_DWORD *)(v0 + 600) = enum case for PlaybackController.QueueCommand.addItemToQueue(_:);
    v5 = *(void (**)(uint64_t, uint64_t))(v0 + 496);
    *(_QWORD *)(v0 + 552) = v2;
    if (v2 > *((_QWORD *)result + 2))
    {
      __break(1u);
    }
    else
    {
      v7 = *(_QWORD *)(v0 + 320);
      v6 = *(char **)(v0 + 328);
      v9 = *(_QWORD *)(v0 + 288);
      v8 = *(_QWORD *)(v0 + 296);
      v10 = *(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 16);
      v11 = v10((uint64_t)v6, &result[((v4 + 32) & ~(unint64_t)v4)+ *(_QWORD *)(v3 + 72) * (v2 - 1)], v8);
      static Logger.modernPlayback.getter(v11);
      v10(v7, v6, v8);
      v12 = swift_retain_n(v9, 2);
      v13 = Logger.logObject.getter(v12);
      v14 = static os_log_type_t.default.getter();
      v70 = v10;
      if (os_log_type_enabled(v13, v14))
      {
        v66 = *(_QWORD *)(v0 + 384);
        v68 = *(void (**)(uint64_t, uint64_t))(v0 + 496);
        v15 = *(_QWORD *)(v0 + 312);
        v63 = *(_QWORD *)(v0 + 320);
        v16 = *(_QWORD *)(v0 + 296);
        v64 = *(_QWORD *)(v0 + 304);
        v65 = *(_QWORD *)(v0 + 360);
        v17 = *(_QWORD **)(v0 + 288);
        v18 = swift_slowAlloc(22, -1);
        v19 = swift_slowAlloc(64, -1);
        v73 = v19;
        *(_DWORD *)v18 = 136315394;
        *(_QWORD *)(v0 + 232) = *v17;
        v20 = sub_10003F544(&qword_100566B60);
        v21 = String.init<A>(describing:)(v0 + 232, v20);
        v23 = v22;
        *(_QWORD *)(v18 + 4) = sub_10003D274(v21, v22, &v73);
        swift_release_n(v17, 2);
        v24 = swift_bridgeObjectRelease(v23);
        *(_WORD *)(v18 + 12) = 2080;
        ((void (*)(uint64_t, uint64_t, uint64_t, __n128))v10)(v15, v63, v16, v24);
        v25 = String.init<A>(describing:)(v15, v16);
        v27 = v26;
        *(_QWORD *)(v18 + 14) = sub_10003D274(v25, v26, &v73);
        v28 = swift_bridgeObjectRelease(v27);
        v29 = *(void (**)(uint64_t, uint64_t, __n128))(v64 + 8);
        v29(v63, v16, v28);
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "[%s] Appending %s to hard queue", (uint8_t *)v18, 0x16u);
        swift_arrayDestroy(v19, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v19, -1, -1);
        swift_slowDealloc(v18, -1, -1);

        v68(v66, v65);
        v5 = *(void (**)(uint64_t, uint64_t))(v0 + 496);
      }
      else
      {
        v30 = *(_QWORD *)(v0 + 384);
        v31 = *(_QWORD *)(v0 + 360);
        v32 = *(_QWORD *)(v0 + 320);
        v33 = *(_QWORD *)(v0 + 296);
        v34 = *(_QWORD *)(v0 + 304);
        swift_release_n(*(_QWORD *)(v0 + 288), 2);
        v29 = *(void (**)(uint64_t, uint64_t, __n128))(v34 + 8);
        ((void (*)(uint64_t, uint64_t))v29)(v32, v33);

        v5(v30, v31);
      }
      *(_QWORD *)(v0 + 568) = v5;
      *(_QWORD *)(v0 + 560) = v29;
      v35 = *(unsigned int *)(v0 + 600);
      v36 = *(unsigned int *)(v0 + 596);
      v37 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v0 + 504);
      v39 = *(char **)(v0 + 328);
      v38 = *(_QWORD *)(v0 + 336);
      v40 = *(_QWORD *)(v0 + 296);
      *(_QWORD *)(v0 + 104) = v38;
      *(_QWORD *)(v0 + 112) = &protocol witness table for PlaybackController.QueueCommand;
      v41 = sub_1000242A8((_QWORD *)(v0 + 80));
      v42 = (char *)v41 + *(int *)(sub_10003F544(&qword_10055C3E8) + 48);
      v70((uint64_t)v41, v39, v40);
      v43 = type metadata accessor for PlaybackController.QueueCommand.Location(0);
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 104))(v42, v36, v43);
      v37(v41, v35, v38);
      v71 = (char *)&async function pointer to dispatch thunk of PlaybackController.performCommand(_:options:)
          + async function pointer to dispatch thunk of PlaybackController.performCommand(_:options:);
      v44 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of PlaybackController.performCommand(_:options:)
                                       + 1));
      *(_QWORD *)(v0 + 576) = v44;
      *v44 = v0;
      v44[1] = sub_1003771D0;
      return (char *)((uint64_t (*)(uint64_t, _QWORD))v71)(v0 + 80, 0);
    }
  }
  else
  {
    v45 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
    v47 = *(void **)(v0 + 464);
    v46 = *(void **)(v0 + 472);
    v48 = *(_QWORD *)(v0 + 448);
    v49 = *(_QWORD *)(v0 + 456);
    v50 = *(_QWORD *)(v0 + 416);
    v52 = *(_QWORD *)(v0 + 344);
    v51 = *(_QWORD *)(v0 + 352);
    v53 = *(_QWORD *)(v0 + 336);
    swift_bridgeObjectRelease(result);

    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v51, v53);
    v45(v48, v50);
    v45(v49, v50);
    v54 = *(_QWORD *)(v0 + 448);
    v56 = *(_QWORD *)(v0 + 432);
    v55 = *(_QWORD *)(v0 + 440);
    v58 = *(_QWORD *)(v0 + 400);
    v57 = *(_QWORD *)(v0 + 408);
    v60 = *(_QWORD *)(v0 + 384);
    v59 = *(_QWORD *)(v0 + 392);
    v61 = *(_QWORD *)(v0 + 376);
    v62 = *(_QWORD *)(v0 + 352);
    v67 = *(_QWORD *)(v0 + 328);
    v69 = *(_QWORD *)(v0 + 320);
    v72 = *(_QWORD *)(v0 + 312);
    swift_task_dealloc(*(_QWORD *)(v0 + 456));
    swift_task_dealloc(v54);
    swift_task_dealloc(v55);
    swift_task_dealloc(v56);
    swift_task_dealloc(v57);
    swift_task_dealloc(v58);
    swift_task_dealloc(v59);
    swift_task_dealloc(v60);
    swift_task_dealloc(v61);
    swift_task_dealloc(v62);
    swift_task_dealloc(v67);
    swift_task_dealloc(v69);
    swift_task_dealloc(v72);
    return (char *)(*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_1003771D0(void *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 576);
  *(_QWORD *)(*v2 + 584) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v4 + 544));
    v6 = sub_100377A94;
  }
  else
  {

    sub_10003D380((_QWORD *)(v4 + 80));
    v6 = sub_100377258;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_100377258()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, unint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  __n128 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  __n128 v29;
  void (*v30)(uint64_t, uint64_t, __n128);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(_QWORD *, uint64_t, uint64_t);
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  char *v43;
  uint64_t v44;
  _QWORD *v45;
  void (*v46)(uint64_t, uint64_t);
  void *v47;
  void *v48;
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
  void (*v69)(uint64_t, uint64_t);
  uint64_t v70;
  uint64_t (*v71)(uint64_t, unint64_t, uint64_t);
  char *v72;
  uint64_t v73;
  uint64_t v74;

  v1 = *(_QWORD *)(v0 + 552);
  result = (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 560))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 296));
  if (v1 == 1)
  {
    v46 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
    v48 = *(void **)(v0 + 464);
    v47 = *(void **)(v0 + 472);
    v49 = *(_QWORD *)(v0 + 448);
    v50 = *(_QWORD *)(v0 + 456);
    v51 = *(_QWORD *)(v0 + 416);
    v53 = *(_QWORD *)(v0 + 344);
    v52 = *(_QWORD *)(v0 + 352);
    v54 = *(_QWORD *)(v0 + 336);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 544));

    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v52, v54);
    v46(v49, v51);
    v46(v50, v51);
    v55 = *(_QWORD *)(v0 + 448);
    v57 = *(_QWORD *)(v0 + 432);
    v56 = *(_QWORD *)(v0 + 440);
    v59 = *(_QWORD *)(v0 + 400);
    v58 = *(_QWORD *)(v0 + 408);
    v61 = *(_QWORD *)(v0 + 384);
    v60 = *(_QWORD *)(v0 + 392);
    v62 = *(_QWORD *)(v0 + 376);
    v63 = *(_QWORD *)(v0 + 352);
    v68 = *(_QWORD *)(v0 + 328);
    v70 = *(_QWORD *)(v0 + 320);
    v73 = *(_QWORD *)(v0 + 312);
    swift_task_dealloc(*(_QWORD *)(v0 + 456));
    swift_task_dealloc(v55);
    swift_task_dealloc(v56);
    swift_task_dealloc(v57);
    swift_task_dealloc(v58);
    swift_task_dealloc(v59);
    swift_task_dealloc(v60);
    swift_task_dealloc(v61);
    swift_task_dealloc(v62);
    swift_task_dealloc(v63);
    swift_task_dealloc(v68);
    swift_task_dealloc(v70);
    swift_task_dealloc(v73);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v3 = *(void (**)(uint64_t, uint64_t))(v0 + 568);
    v4 = *(_QWORD *)(v0 + 552);
    *(_QWORD *)(v0 + 552) = v4 - 1;
    v5 = *(_QWORD *)(v0 + 544);
    if (v4 - 1 > *(_QWORD *)(v5 + 16))
    {
      __break(1u);
    }
    else
    {
      v7 = *(_QWORD *)(v0 + 320);
      v6 = *(_QWORD *)(v0 + 328);
      v9 = *(_QWORD *)(v0 + 296);
      v8 = *(_QWORD *)(v0 + 304);
      v10 = *(_QWORD *)(v0 + 288);
      v11 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v8 + 16);
      v12 = v11(v6, v5+ ((*(unsigned __int8 *)(v0 + 592) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 592))+ *(_QWORD *)(v8 + 72) * (v4 - 2), v9);
      static Logger.modernPlayback.getter(v12);
      v11(v7, v6, v9);
      v13 = swift_retain_n(v10, 2);
      v14 = Logger.logObject.getter(v13);
      v15 = static os_log_type_t.default.getter();
      v71 = v11;
      if (os_log_type_enabled(v14, v15))
      {
        v67 = *(_QWORD *)(v0 + 384);
        v69 = *(void (**)(uint64_t, uint64_t))(v0 + 496);
        v16 = *(_QWORD *)(v0 + 312);
        v64 = *(_QWORD *)(v0 + 320);
        v17 = *(_QWORD *)(v0 + 296);
        v65 = *(_QWORD *)(v0 + 304);
        v66 = *(_QWORD *)(v0 + 360);
        v18 = *(_QWORD **)(v0 + 288);
        v19 = swift_slowAlloc(22, -1);
        v20 = swift_slowAlloc(64, -1);
        v74 = v20;
        *(_DWORD *)v19 = 136315394;
        *(_QWORD *)(v0 + 232) = *v18;
        v21 = sub_10003F544(&qword_100566B60);
        v22 = String.init<A>(describing:)(v0 + 232, v21);
        v24 = v23;
        *(_QWORD *)(v19 + 4) = sub_10003D274(v22, v23, &v74);
        swift_release_n(v18, 2);
        v25 = swift_bridgeObjectRelease(v24);
        *(_WORD *)(v19 + 12) = 2080;
        ((void (*)(uint64_t, uint64_t, uint64_t, __n128))v11)(v16, v64, v17, v25);
        v26 = String.init<A>(describing:)(v16, v17);
        v28 = v27;
        *(_QWORD *)(v19 + 14) = sub_10003D274(v26, v27, &v74);
        v29 = swift_bridgeObjectRelease(v28);
        v30 = *(void (**)(uint64_t, uint64_t, __n128))(v65 + 8);
        v30(v64, v17, v29);
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "[%s] Appending %s to hard queue", (uint8_t *)v19, 0x16u);
        swift_arrayDestroy(v20, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v20, -1, -1);
        swift_slowDealloc(v19, -1, -1);

        v69(v67, v66);
        v3 = *(void (**)(uint64_t, uint64_t))(v0 + 496);
      }
      else
      {
        v31 = *(_QWORD *)(v0 + 384);
        v32 = *(_QWORD *)(v0 + 360);
        v33 = *(_QWORD *)(v0 + 320);
        v34 = *(_QWORD *)(v0 + 296);
        v35 = *(_QWORD *)(v0 + 304);
        swift_release_n(*(_QWORD *)(v0 + 288), 2);
        v30 = *(void (**)(uint64_t, uint64_t, __n128))(v35 + 8);
        ((void (*)(uint64_t, uint64_t))v30)(v33, v34);

        v3(v31, v32);
      }
      *(_QWORD *)(v0 + 568) = v3;
      *(_QWORD *)(v0 + 560) = v30;
      v36 = *(unsigned int *)(v0 + 600);
      v37 = *(unsigned int *)(v0 + 596);
      v38 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v0 + 504);
      v40 = *(_QWORD *)(v0 + 328);
      v39 = *(_QWORD *)(v0 + 336);
      v41 = *(_QWORD *)(v0 + 296);
      *(_QWORD *)(v0 + 104) = v39;
      *(_QWORD *)(v0 + 112) = &protocol witness table for PlaybackController.QueueCommand;
      v42 = sub_1000242A8((_QWORD *)(v0 + 80));
      v43 = (char *)v42 + *(int *)(sub_10003F544(&qword_10055C3E8) + 48);
      v71((uint64_t)v42, v40, v41);
      v44 = type metadata accessor for PlaybackController.QueueCommand.Location(0);
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 104))(v43, v37, v44);
      v38(v42, v36, v39);
      v72 = (char *)&async function pointer to dispatch thunk of PlaybackController.performCommand(_:options:)
          + async function pointer to dispatch thunk of PlaybackController.performCommand(_:options:);
      v45 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of PlaybackController.performCommand(_:options:)
                                       + 1));
      *(_QWORD *)(v0 + 576) = v45;
      *v45 = v0;
      v45[1] = sub_1003771D0;
      return ((uint64_t (*)(uint64_t, _QWORD))v72)(v0 + 80, 0);
    }
  }
  return result;
}

uint64_t sub_1003776D8()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
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
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t, uint64_t);
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
  v2 = *(_QWORD *)(v0 + 448);
  v3 = *(_QWORD *)(v0 + 416);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 344) + 8))(*(_QWORD *)(v0 + 352), *(_QWORD *)(v0 + 336));
  v1(v2, v3);
  v4 = sub_10003D380((_QWORD *)(v0 + 160));
  v5 = *(_QWORD *)(v0 + 536);
  static Logger.modernPlayback.getter(v4);
  swift_retain();
  swift_errorRetain();
  swift_retain();
  v6 = swift_errorRetain();
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.error.getter(v7);
  if (os_log_type_enabled(v7, v8))
  {
    v45 = *(void (**)(uint64_t, uint64_t))(v0 + 496);
    v48 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
    v43 = *(_QWORD *)(v0 + 456);
    v41 = *(void **)(v0 + 472);
    v42 = *(_QWORD *)(v0 + 416);
    v40 = *(_QWORD *)(v0 + 376);
    v38 = *(void **)(v0 + 464);
    v39 = *(_QWORD *)(v0 + 360);
    v9 = *(_QWORD **)(v0 + 288);
    v10 = swift_slowAlloc(22, -1);
    v11 = (uint64_t *)swift_slowAlloc(8, -1);
    v37 = swift_slowAlloc(32, -1);
    v50 = v37;
    *(_DWORD *)v10 = 136315394;
    *(_QWORD *)(v0 + 200) = *v9;
    v12 = sub_10003F544(&qword_100566B60);
    v13 = String.init<A>(describing:)(v0 + 200, v12);
    v15 = v14;
    *(_QWORD *)(v0 + 208) = sub_10003D274(v13, v14, &v50);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 208, v0 + 216, v10 + 4, v10 + 12);
    swift_release_n(v9, 2);
    swift_bridgeObjectRelease(v15);
    *(_WORD *)(v10 + 12) = 2112;
    swift_errorRetain();
    v16 = _swift_stdlib_bridgeErrorToNSError(v5);
    *(_QWORD *)(v0 + 216) = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 216, v0 + 224, v10 + 14, v10 + 22);
    *v11 = v16;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%s] Failed to set playback intent from legacy queue %@", (uint8_t *)v10, 0x16u);
    v17 = sub_10003F544((uint64_t *)&unk_100556480);
    swift_arrayDestroy(v11, 1, v17);
    swift_slowDealloc(v11, -1, -1);
    swift_arrayDestroy(v37, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1, -1);
    swift_slowDealloc(v10, -1, -1);

    swift_errorRelease();
    v45(v40, v39);
    v19 = v42;
    v18 = v43;
  }
  else
  {
    v46 = *(void (**)(uint64_t, uint64_t))(v0 + 496);
    v48 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
    v21 = *(void **)(v0 + 464);
    v20 = *(void **)(v0 + 472);
    v22 = *(_QWORD *)(v0 + 456);
    v23 = *(_QWORD *)(v0 + 416);
    v24 = *(_QWORD *)(v0 + 376);
    v25 = *(_QWORD *)(v0 + 360);
    v26 = *(_QWORD *)(v0 + 288);

    swift_errorRelease();
    swift_errorRelease();
    swift_release_n(v26, 2);
    swift_errorRelease();

    v46(v24, v25);
    v18 = v22;
    v19 = v23;
  }
  v48(v18, v19);
  v27 = *(_QWORD *)(v0 + 448);
  v29 = *(_QWORD *)(v0 + 432);
  v28 = *(_QWORD *)(v0 + 440);
  v31 = *(_QWORD *)(v0 + 400);
  v30 = *(_QWORD *)(v0 + 408);
  v33 = *(_QWORD *)(v0 + 384);
  v32 = *(_QWORD *)(v0 + 392);
  v34 = *(_QWORD *)(v0 + 376);
  v35 = *(_QWORD *)(v0 + 352);
  v44 = *(_QWORD *)(v0 + 328);
  v47 = *(_QWORD *)(v0 + 320);
  v49 = *(_QWORD *)(v0 + 312);
  swift_task_dealloc(*(_QWORD *)(v0 + 456));
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v44);
  swift_task_dealloc(v47);
  swift_task_dealloc(v49);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100377A94()
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
  NSObject *v10;
  os_log_type_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
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
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t, uint64_t);
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
  v2 = *(_QWORD *)(v0 + 448);
  v3 = *(_QWORD *)(v0 + 416);
  v5 = *(_QWORD *)(v0 + 344);
  v4 = *(_QWORD *)(v0 + 352);
  v6 = *(_QWORD *)(v0 + 336);
  (*(void (**)(_QWORD, _QWORD))(v0 + 560))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 296));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v1(v2, v3);
  v7 = sub_10003D380((_QWORD *)(v0 + 80));
  v8 = *(_QWORD *)(v0 + 584);
  static Logger.modernPlayback.getter(v7);
  swift_retain();
  swift_errorRetain();
  swift_retain();
  v9 = swift_errorRetain();
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.error.getter(v10);
  if (os_log_type_enabled(v10, v11))
  {
    v48 = *(void (**)(uint64_t, uint64_t))(v0 + 496);
    v51 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
    v46 = *(_QWORD *)(v0 + 456);
    v44 = *(void **)(v0 + 472);
    v45 = *(_QWORD *)(v0 + 416);
    v43 = *(_QWORD *)(v0 + 376);
    v41 = *(void **)(v0 + 464);
    v42 = *(_QWORD *)(v0 + 360);
    v12 = *(_QWORD **)(v0 + 288);
    v13 = swift_slowAlloc(22, -1);
    v14 = (uint64_t *)swift_slowAlloc(8, -1);
    v40 = swift_slowAlloc(32, -1);
    v53 = v40;
    *(_DWORD *)v13 = 136315394;
    *(_QWORD *)(v0 + 200) = *v12;
    v15 = sub_10003F544(&qword_100566B60);
    v16 = String.init<A>(describing:)(v0 + 200, v15);
    v18 = v17;
    *(_QWORD *)(v0 + 208) = sub_10003D274(v16, v17, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 208, v0 + 216, v13 + 4, v13 + 12);
    swift_release_n(v12, 2);
    swift_bridgeObjectRelease(v18);
    *(_WORD *)(v13 + 12) = 2112;
    swift_errorRetain();
    v19 = _swift_stdlib_bridgeErrorToNSError(v8);
    *(_QWORD *)(v0 + 216) = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 216, v0 + 224, v13 + 14, v13 + 22);
    *v14 = v19;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%s] Failed to set playback intent from legacy queue %@", (uint8_t *)v13, 0x16u);
    v20 = sub_10003F544((uint64_t *)&unk_100556480);
    swift_arrayDestroy(v14, 1, v20);
    swift_slowDealloc(v14, -1, -1);
    swift_arrayDestroy(v40, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v40, -1, -1);
    swift_slowDealloc(v13, -1, -1);

    swift_errorRelease();
    v48(v43, v42);
    v22 = v45;
    v21 = v46;
  }
  else
  {
    v49 = *(void (**)(uint64_t, uint64_t))(v0 + 496);
    v51 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
    v24 = *(void **)(v0 + 464);
    v23 = *(void **)(v0 + 472);
    v25 = *(_QWORD *)(v0 + 456);
    v26 = *(_QWORD *)(v0 + 416);
    v27 = *(_QWORD *)(v0 + 376);
    v28 = *(_QWORD *)(v0 + 360);
    v29 = *(_QWORD *)(v0 + 288);

    swift_errorRelease();
    swift_errorRelease();
    swift_release_n(v29, 2);
    swift_errorRelease();

    v49(v27, v28);
    v21 = v25;
    v22 = v26;
  }
  v51(v21, v22);
  v30 = *(_QWORD *)(v0 + 448);
  v32 = *(_QWORD *)(v0 + 432);
  v31 = *(_QWORD *)(v0 + 440);
  v34 = *(_QWORD *)(v0 + 400);
  v33 = *(_QWORD *)(v0 + 408);
  v36 = *(_QWORD *)(v0 + 384);
  v35 = *(_QWORD *)(v0 + 392);
  v37 = *(_QWORD *)(v0 + 376);
  v38 = *(_QWORD *)(v0 + 352);
  v47 = *(_QWORD *)(v0 + 328);
  v50 = *(_QWORD *)(v0 + 320);
  v52 = *(_QWORD *)(v0 + 312);
  swift_task_dealloc(*(_QWORD *)(v0 + 456));
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v47);
  swift_task_dealloc(v50);
  swift_task_dealloc(v52);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100377E64(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(v2 + 64) + 40);
  v4 = a2;
  sub_100378ED0((uint64_t)&v6, v3);
  return swift_continuation_resume(v2);
}

_QWORD *sub_100377EAC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  __n128 v22;
  void (*v23)(char *, char *, uint64_t);
  char *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  os_log_t v47;
  char *v48;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  os_log_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58[2];

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003F544(&qword_100566B78);
  __chkstk_darwin();
  v7 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for URLTrackIdentifier(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = ((char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin();
  v56 = (char *)&v50 - v12;
  v13 = objc_msgSend((id)objc_opt_self(MTUpNextController), "unarchivedIdentifiers");
  if (!v13)
    return _swiftEmptyArrayStorage;
  v14 = v13;
  v52 = v3;
  v53 = v2;
  v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v13, &type metadata for String);

  v17 = *(_QWORD *)(v15 + 16);
  if (v17)
  {
    v51 = v1;
    v54 = v5;
    swift_bridgeObjectRetain(v15);
    v50 = v15;
    v18 = (_QWORD *)(v15 + 40);
    v19 = _swiftEmptyArrayStorage;
    v55 = v11;
    do
    {
      v20 = *(v18 - 1);
      v21 = *v18;
      swift_bridgeObjectRetain_n(*v18, 2);
      URLTrackIdentifier.init(string:)(v20, v21);
      v22 = swift_bridgeObjectRelease(v21);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t, __n128))(v9 + 48))(v7, 1, v8, v22) == 1)
      {
        sub_100007A28((uint64_t)v7, &qword_100566B78);
      }
      else
      {
        v23 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
        v24 = v56;
        v23(v56, v7, v8);
        v23((char *)v11, v24, v8);
        if ((swift_isUniquelyReferenced_nonNull_native(v19) & 1) == 0)
          v19 = (_QWORD *)sub_10027C0DC(0, v19[2] + 1, 1, (unint64_t)v19);
        v26 = v19[2];
        v25 = v19[3];
        if (v26 >= v25 >> 1)
          v19 = (_QWORD *)sub_10027C0DC(v25 > 1, v26 + 1, 1, (unint64_t)v19);
        v19[2] = v26 + 1;
        v27 = (unint64_t)v19
            + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
            + *(_QWORD *)(v9 + 72) * v26;
        v11 = v55;
        v23((char *)v27, (char *)v55, v8);
      }
      v18 += 2;
      --v17;
    }
    while (v17);
    v15 = v50;
    swift_bridgeObjectRelease(v50);
    v28 = *(_QWORD *)(v15 + 16);
    v5 = v54;
    v1 = v51;
  }
  else
  {
    v28 = 0;
    v19 = _swiftEmptyArrayStorage;
  }
  if (v28 == v19[2])
  {
    swift_bridgeObjectRelease(v15);
  }
  else
  {
    static Logger.modernPlayback.getter(v16);
    swift_retain_n(v1, 2);
    swift_bridgeObjectRetain_n(v19, 2);
    swift_bridgeObjectRetain(v15);
    v30 = Logger.logObject.getter(v29);
    v31 = v1;
    v32 = static os_log_type_t.error.getter(v30);
    if (os_log_type_enabled(v30, v32))
    {
      v33 = swift_slowAlloc(32, -1);
      v34 = swift_slowAlloc(96, -1);
      v56 = (char *)v34;
      *(_DWORD *)v33 = 136315650;
      v57 = *v31;
      v58[0] = v34;
      v35 = sub_10003F544(&qword_100566B60);
      v55 = v30;
      v36 = String.init<A>(describing:)(&v57, v35);
      v54 = v5;
      v38 = v37;
      v57 = sub_10003D274(v36, v37, v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, v58, v33 + 4, v33 + 12);
      swift_bridgeObjectRelease(v38);
      swift_release_n(v31, 2);
      *(_WORD *)(v33 + 12) = 2080;
      swift_bridgeObjectRetain(v15);
      v40 = Array.description.getter(v39, &type metadata for String);
      v42 = v41;
      swift_bridgeObjectRelease(v15);
      v57 = sub_10003D274(v40, v42, v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, v58, v33 + 14, v33 + 22);
      swift_bridgeObjectRelease(v42);
      swift_bridgeObjectRelease_n(v15, 2);
      *(_WORD *)(v33 + 22) = 2080;
      swift_bridgeObjectRetain(v19);
      v44 = Array.description.getter(v43, v8);
      v46 = v45;
      swift_bridgeObjectRelease(v19);
      v57 = sub_10003D274(v44, v46, v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, v58, v33 + 24, v33 + 32);
      swift_bridgeObjectRelease(v46);
      swift_bridgeObjectRelease_n(v19, 2);
      v47 = v55;
      _os_log_impl((void *)&_mh_execute_header, v55, v32, "[%s] Not all track identifiers were converted. \nBefore: %s. \nAfter: %s", (uint8_t *)v33, 0x20u);
      v48 = v56;
      swift_arrayDestroy(v56, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v48, -1, -1);
      swift_slowDealloc(v33, -1, -1);

      (*(void (**)(char *, uint64_t))(v52 + 8))(v54, v53);
    }
    else
    {
      swift_release_n(v31, 2);
      swift_bridgeObjectRelease_n(v15, 2);
      swift_bridgeObjectRelease_n(v19, 2);

      (*(void (**)(char *, uint64_t))(v52 + 8))(v5, v53);
    }
  }
  return v19;
}

_QWORD *sub_100378428()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  __n128 v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  char *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, _QWORD, uint64_t);
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  __n128 v41;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __n128 v50;
  uint64_t v51;
  uint64_t v52;
  __n128 v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  __n128 v60;
  char v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v79;
  uint64_t v80;
  __n128 v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  __n128 v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  _QWORD *v95;
  _QWORD *v96;
  int v97;
  _QWORD *v98;
  int v99;
  unsigned int v100;
  uint64_t v101;
  _QWORD *v102;
  char *v103;
  unsigned int v104;
  void (*v105)(char *, char *, uint64_t);
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  _QWORD *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117[2];

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v114 = *(_QWORD *)(v2 - 8);
  v115 = v2;
  __chkstk_darwin();
  v4 = (char *)&v93 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MediaIdentifier(0);
  v109 = *(_QWORD *)(v5 - 8);
  v110 = v5;
  __chkstk_darwin();
  v7 = (uint64_t *)((char *)&v93 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin();
  v9 = (uint64_t *)((char *)&v93 - v8);
  __chkstk_darwin();
  v98 = (uint64_t *)((char *)&v93 - v10);
  __chkstk_darwin();
  v102 = (uint64_t *)((char *)&v93 - v11);
  v12 = type metadata accessor for URLTrackIdentifier.ArgumentKey(0);
  v111 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin();
  v14 = (char *)&v93 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for URLTrackIdentifier(0);
  v112 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin();
  v103 = (char *)&v93 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100377EAC();
  v117[0] = (uint64_t)v17;
  v18 = sub_10003F544(&qword_100566B50);
  v19 = sub_10017599C(&qword_100566B58, &qword_100566B50);
  if ((Collection.isNotEmpty.getter(v18, v19, v20) & 1) != 0)
  {
    v21 = v17[2];
    if (v21)
    {
      v107 = v14;
      v108 = v12;
      v95 = v9;
      v96 = v7;
      v101 = 0;
      v22 = (*(unsigned __int8 *)(v112 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v112 + 80);
      v94 = v17;
      v23 = (char *)v17 + v22;
      v24 = *(_QWORD *)(v112 + 72);
      v105 = *(void (**)(char *, char *, uint64_t))(v112 + 16);
      v106 = v24;
      v104 = enum case for URLTrackIdentifier.ArgumentKey.episodeUUID(_:);
      v99 = enum case for MediaIdentifier.episodes(_:);
      v100 = enum case for URLTrackIdentifier.ArgumentKey.storeTrackID(_:);
      v97 = enum case for MediaIdentifier.localEpisodes(_:);
      v25 = _swiftEmptyArrayStorage;
      v26 = _swiftEmptyArrayStorage;
      v113 = _swiftEmptyArrayStorage;
      v27 = v103;
      do
      {
        v114 = v21;
        v115 = (uint64_t)v26;
        v28 = v25;
        v29 = v15;
        v105(v27, v23, v15);
        v30 = v111;
        v31 = *(void (**)(char *, _QWORD, uint64_t))(v111 + 104);
        v33 = v107;
        v32 = v108;
        v31(v107, v104, v108);
        v34 = v27;
        v35 = URLTrackIdentifier.valueForArgument(_:)(v33);
        v37 = v36;
        v38 = *(void (**)(char *, uint64_t))(v30 + 8);
        v38(v33, v32);
        if (v37)
        {
          v25 = v28;
          v117[0] = (uint64_t)v28;
          v39 = sub_10003F544(&qword_100566B68);
          v40 = sub_10017599C(&qword_100566B70, &qword_100566B68);
          if ((Collection.isNotEmpty.getter(v39, v40, v41) & 1) != 0)
          {
            *v102 = v28;
            (*(void (**)(void))(v109 + 104))();
            swift_bridgeObjectRetain(v28);
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v113);
            v26 = (_QWORD *)v115;
            v15 = v29;
            if ((isUniquelyReferenced_nonNull_native & 1) != 0)
              v43 = (unint64_t)v113;
            else
              v43 = sub_10027C0F0(0, v113[2] + 1, 1, (unint64_t)v113);
            v45 = *(_QWORD *)(v43 + 16);
            v44 = *(_QWORD *)(v43 + 24);
            if (v45 >= v44 >> 1)
              v43 = sub_10027C0F0(v44 > 1, v45 + 1, 1, v43);
            *(_QWORD *)(v43 + 16) = v45 + 1;
            v46 = (*(unsigned __int8 *)(v109 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v109 + 80);
            v113 = (_QWORD *)v43;
            (*(void (**)(unint64_t, _QWORD *, uint64_t))(v109 + 32))(v43 + v46 + *(_QWORD *)(v109 + 72) * v45, v102, v110);
            swift_bridgeObjectRelease(v28);
            v25 = _swiftEmptyArrayStorage;
          }
          else
          {
            v26 = (_QWORD *)v115;
            v15 = v29;
          }
          if ((swift_isUniquelyReferenced_nonNull_native(v26) & 1) == 0)
            v26 = sub_10027AE00(0, v26[2] + 1, 1, v26);
          v56 = v26[2];
          v55 = v26[3];
          if (v56 >= v55 >> 1)
            v26 = sub_10027AE00((_QWORD *)(v55 > 1), v56 + 1, 1, v26);
          v26[2] = v56 + 1;
          v57 = &v26[2 * v56];
          v57[4] = v35;
          v57[5] = v37;
          v27 = v103;
        }
        else
        {
          v31(v33, v100, v32);
          v47 = URLTrackIdentifier.valueForArgument(_:)(v33);
          v49 = v48;
          v38(v33, v32);
          if (v49)
          {
            v51 = v101;
            v52 = static AdamID.parse(_:)(v47, v49, v50);
            v15 = v29;
            if (v51)
            {
              v53 = swift_bridgeObjectRelease(v49);
              v54 = static AdamID.empty.getter(v53);
              swift_errorRelease();
              v101 = 0;
            }
            else
            {
              v54 = v52;
              v101 = 0;
              swift_bridgeObjectRelease(v49);
            }
            v25 = v28;
            v26 = (_QWORD *)v115;
            v117[0] = v115;
            v58 = sub_10003F544((uint64_t *)&unk_10055FDF0);
            v59 = sub_10017599C((unint64_t *)&qword_1005639B0, (uint64_t *)&unk_10055FDF0);
            v61 = Collection.isNotEmpty.getter(v58, v59, v60);
            v27 = v103;
            if ((v61 & 1) != 0)
            {
              *v98 = v26;
              (*(void (**)(void))(v109 + 104))();
              swift_bridgeObjectRetain(v26);
              if ((swift_isUniquelyReferenced_nonNull_native(v113) & 1) != 0)
                v62 = (unint64_t)v113;
              else
                v62 = sub_10027C0F0(0, v113[2] + 1, 1, (unint64_t)v113);
              v64 = *(_QWORD *)(v62 + 16);
              v63 = *(_QWORD *)(v62 + 24);
              if (v64 >= v63 >> 1)
                v62 = sub_10027C0F0(v63 > 1, v64 + 1, 1, v62);
              *(_QWORD *)(v62 + 16) = v64 + 1;
              v65 = (*(unsigned __int8 *)(v109 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v109 + 80);
              v113 = (_QWORD *)v62;
              (*(void (**)(unint64_t, _QWORD *, uint64_t))(v109 + 32))(v62 + v65 + *(_QWORD *)(v109 + 72) * v64, v98, v110);
              swift_bridgeObjectRelease(v26);
              v26 = _swiftEmptyArrayStorage;
            }
            if ((swift_isUniquelyReferenced_nonNull_native(v28) & 1) == 0)
              v25 = sub_10027B258(0, v28[2] + 1, 1, v28);
            v67 = v25[2];
            v66 = v25[3];
            if (v67 >= v66 >> 1)
              v25 = sub_10027B258((_QWORD *)(v66 > 1), v67 + 1, 1, v25);
            v25[2] = v67 + 1;
            v25[v67 + 4] = v54;
          }
          else
          {
            v27 = v34;
            v25 = v28;
            v26 = (_QWORD *)v115;
            v15 = v29;
          }
        }
        (*(void (**)(char *, uint64_t))(v112 + 8))(v27, v15);
        v23 += v106;
        v21 = v114 - 1;
      }
      while (v114 != 1);
      swift_bridgeObjectRelease(v94);
      v7 = v96;
      v9 = v95;
    }
    else
    {
      swift_bridgeObjectRelease(v17);
      v25 = _swiftEmptyArrayStorage;
      v26 = _swiftEmptyArrayStorage;
      v113 = _swiftEmptyArrayStorage;
    }
    v117[0] = (uint64_t)v25;
    v79 = sub_10003F544(&qword_100566B68);
    v80 = sub_10017599C(&qword_100566B70, &qword_100566B68);
    if ((Collection.isNotEmpty.getter(v79, v80, v81) & 1) != 0)
    {
      *v9 = v25;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(v109 + 104))(v9, enum case for MediaIdentifier.episodes(_:), v110);
      swift_bridgeObjectRetain(v25);
      if ((swift_isUniquelyReferenced_nonNull_native(v113) & 1) != 0)
        v82 = (unint64_t)v113;
      else
        v82 = sub_10027C0F0(0, v113[2] + 1, 1, (unint64_t)v113);
      v84 = *(_QWORD *)(v82 + 16);
      v83 = *(_QWORD *)(v82 + 24);
      if (v84 >= v83 >> 1)
        v82 = sub_10027C0F0(v83 > 1, v84 + 1, 1, v82);
      *(_QWORD *)(v82 + 16) = v84 + 1;
      v85 = (*(unsigned __int8 *)(v109 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v109 + 80);
      v113 = (_QWORD *)v82;
      (*(void (**)(unint64_t, _QWORD *, uint64_t))(v109 + 32))(v82 + v85 + *(_QWORD *)(v109 + 72) * v84, v9, v110);
    }
    v117[0] = (uint64_t)v26;
    v86 = sub_10003F544((uint64_t *)&unk_10055FDF0);
    v87 = sub_10017599C((unint64_t *)&qword_1005639B0, (uint64_t *)&unk_10055FDF0);
    if ((Collection.isNotEmpty.getter(v86, v87, v88) & 1) != 0)
    {
      *v7 = v26;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(v109 + 104))(v7, enum case for MediaIdentifier.localEpisodes(_:), v110);
      swift_bridgeObjectRetain(v26);
      if ((swift_isUniquelyReferenced_nonNull_native(v113) & 1) != 0)
        v89 = (unint64_t)v113;
      else
        v89 = sub_10027C0F0(0, v113[2] + 1, 1, (unint64_t)v113);
      v91 = *(_QWORD *)(v89 + 16);
      v90 = *(_QWORD *)(v89 + 24);
      if (v91 >= v90 >> 1)
        v89 = sub_10027C0F0(v90 > 1, v91 + 1, 1, v89);
      *(_QWORD *)(v89 + 16) = v91 + 1;
      v92 = v89;
      (*(void (**)(unint64_t, _QWORD *, uint64_t))(v109 + 32))(v89+ ((*(unsigned __int8 *)(v109 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v109 + 80))+ *(_QWORD *)(v109 + 72) * v91, v7, v110);
      swift_bridgeObjectRelease(v26);
      swift_bridgeObjectRelease(v25);
      return (_QWORD *)v92;
    }
    else
    {
      swift_bridgeObjectRelease(v26);
      swift_bridgeObjectRelease(v25);
      return v113;
    }
  }
  else
  {
    swift_bridgeObjectRelease(v17);
    static Logger.modernPlayback.getter(v68);
    v69 = swift_retain_n(v0, 2);
    v70 = Logger.logObject.getter(v69);
    v71 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v70, v71))
    {
      v72 = (uint8_t *)swift_slowAlloc(12, -1);
      v73 = swift_slowAlloc(32, -1);
      *(_DWORD *)v72 = 136315138;
      v116 = *v1;
      v117[0] = v73;
      v74 = sub_10003F544(&qword_100566B60);
      v75 = String.init<A>(describing:)(&v116, v74);
      v77 = v76;
      v116 = sub_10003D274(v75, v76, v117);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v116, v117, v72 + 4, v72 + 12);
      swift_bridgeObjectRelease(v77);
      swift_release_n(v1, 2);
      _os_log_impl((void *)&_mh_execute_header, v70, v71, "[%s] Hard queue is empty", v72, 0xCu);
      swift_arrayDestroy(v73, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v73, -1, -1);
      swift_slowDealloc(v72, -1, -1);
    }
    else
    {
      swift_release_n(v0, 2);
    }

    (*(void (**)(char *, uint64_t))(v114 + 8))(v4, v115);
    return _swiftEmptyArrayStorage;
  }
}

uint64_t sub_100378E48()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for LegacyPlaybackQueueMigrator()
{
  return objc_opt_self(_TtC8Podcasts27LegacyPlaybackQueueMigrator);
}

unint64_t sub_100378E8C()
{
  unint64_t result;

  result = qword_100566B80;
  if (!qword_100566B80)
  {
    result = swift_getWitnessTable(&unk_1003D76EC, &type metadata for LegacyPlaybackQueueMigrator.Error);
    atomic_store(result, (unint64_t *)&qword_100566B80);
  }
  return result;
}

uint64_t sub_100378ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10003F544(&qword_100566B90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100378F18()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100378F44(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_100566B9C);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_100191178;
  return sub_100375C1C(a1, v4, v5, v6);
}

id sub_100378FB0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = (void *)objc_opt_self(IMPlayerManifest);
  v1 = sub_100005EC8(0, &qword_100566BA8, &off_1004A43B0);
  objc_msgSend(v0, "registerManifestForRestoration:", swift_getObjCClassFromMetadata(v1));
  v2 = sub_100005EC8(0, &qword_100566BB0, &off_1004A44E0);
  objc_msgSend(v0, "registerManifestForRestoration:", swift_getObjCClassFromMetadata(v2));
  v3 = sub_100005EC8(0, &qword_100566BB8, off_1004A44C0);
  objc_msgSend(v0, "registerManifestForRestoration:", swift_getObjCClassFromMetadata(v3));
  v4 = sub_100005EC8(0, &qword_100566BC0, off_1004A4560);
  objc_msgSend(v0, "registerManifestForRestoration:", swift_getObjCClassFromMetadata(v4));
  v5 = type metadata accessor for EpisodeListManifest(0);
  objc_msgSend(v0, "registerManifestForRestoration:", swift_getObjCClassFromMetadata(v5));
  v6 = type metadata accessor for NetworkMediaManifest(0);
  return objc_msgSend(v0, "registerManifestForRestoration:", swift_getObjCClassFromMetadata(v6));
}

uint64_t storeEnumTagSinglePayload for LegacyPlaybackQueueMigrator.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10037910C + 4 * byte_1003D7635[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100379140 + 4 * asc_1003D7630[v4]))();
}

uint64_t sub_100379140(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100379148(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100379150);
  return result;
}

uint64_t sub_10037915C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100379164);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_100379168(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100379170(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LegacyPlaybackQueueMigrator.Error()
{
  return &type metadata for LegacyPlaybackQueueMigrator.Error;
}

unint64_t sub_100379190()
{
  unint64_t result;

  result = qword_100566BC8;
  if (!qword_100566BC8)
  {
    result = swift_getWitnessTable(&unk_1003D76C4, &type metadata for LegacyPlaybackQueueMigrator.Error);
    atomic_store(result, (unint64_t *)&qword_100566BC8);
  }
  return result;
}

uint64_t type metadata accessor for ContextMenuLockupPreviewProvider()
{
  return objc_opt_self(_TtC8Podcasts32ContextMenuLockupPreviewProvider);
}

unint64_t sub_1003791F8(uint64_t a1)
{
  uint64_t v2;
  char *v3;
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
  void (*v15)(__int128 *__return_ptr, __n128);
  __n128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t (*v23)(__n128);
  __n128 v24;
  void *v25;
  id v26;
  __n128 v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  sub_10003F544((uint64_t *)&unk_100553DE0);
  __chkstk_darwin();
  v3 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003F544(&qword_10055B790);
  __chkstk_darwin();
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for EpisodeContextActionConfiguration(0);
  if (!swift_dynamicCastClass(a1, v6))
  {
LABEL_6:
    v10 = type metadata accessor for PodcastContextActionConfiguration(0);
    if (swift_dynamicCastClass(a1, v10))
    {
      (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)a1 + 144))(&v36);
      if (*((_QWORD *)&v37 + 1))
      {
        v11 = sub_10003F544(&qword_100554A30);
        v12 = type metadata accessor for LegacyLockup(0);
        if ((swift_dynamicCast(&v35, &v36, v11, v12, 6) & 1) != 0)
          return v35 | 0x4000000000000000;
      }
      else
      {
        sub_100007A28((uint64_t)&v36, &qword_100557C78);
      }
    }
    v13 = type metadata accessor for ChannelContextActionConfiguration(0);
    v14 = swift_dynamicCastClass(a1, v13);
    if (v14)
    {
      v15 = *(void (**)(__int128 *__return_ptr, __n128))(*(_QWORD *)v14 + 144);
      v16 = swift_retain();
      v15(&v36, v16);
      swift_release(a1);
      if (*((_QWORD *)&v37 + 1))
      {
        v17 = sub_10003F544(&qword_100554A30);
        v18 = type metadata accessor for LegacyChannelLockup(0);
        if ((swift_dynamicCast(&v35, &v36, v17, v18, 6) & 1) != 0)
          return v35 | 0x8000000000000000;
      }
      else
      {
        sub_100007A28((uint64_t)&v36, &qword_100557C78);
      }
    }
    v19 = type metadata accessor for NowPlayingContextActionConfiguration(0);
    v20 = swift_dynamicCastClass(a1, v19);
    if (v20)
    {
      v21 = v20;
      v22 = (void *)objc_opt_self(MTMediaPlayerEpisodeLookupUtil);
      v23 = *(uint64_t (**)(__n128))(*(_QWORD *)v21 + 256);
      v24 = swift_retain();
      v25 = (void *)v23(v24);
      v26 = objc_msgSend(v22, "findEpisodeFromModelObject:", v25);

      if (v26)
      {
        type metadata accessor for Episode(0, v27);
        v38 = 0;
        v36 = 0u;
        v37 = 0u;
        v28 = v26;
        v29 = Episode.init(from:clickAction:wantsListenNowReason:)(v28, (uint64_t)&v36, 0);
        if (v29)
        {
          v30 = v29;
          v31 = type metadata accessor for EpisodeListSettings(0);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v5, 1, 1, v31);
          v32 = type metadata accessor for SectionContext(0);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v3, 1, 1, v32);
          v9 = dispatch thunk of Episode.defaultLockup(for:sectionContext:)(v5, v3);

          swift_release(v30);
          swift_release(a1);
          sub_100007A28((uint64_t)v3, (uint64_t *)&unk_100553DE0);
          sub_100007A28((uint64_t)v5, &qword_10055B790);
          return v9;
        }
        swift_release(a1);

      }
      else
      {
        swift_release(a1);
      }
    }
    return 0xF000000000000007;
  }
  (*(void (**)(__int128 *__return_ptr))(*(_QWORD *)a1 + 144))(&v36);
  if (!*((_QWORD *)&v37 + 1))
  {
    sub_100007A28((uint64_t)&v36, &qword_100557C78);
    goto LABEL_6;
  }
  v7 = sub_10003F544(&qword_100554A30);
  v8 = type metadata accessor for LegacyEpisodeLockup(0);
  if ((swift_dynamicCast(&v35, &v36, v7, v8, 6) & 1) == 0)
    goto LABEL_6;
  return v35;
}

uint64_t sub_10037958C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  void *v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v2 = type metadata accessor for FlowDestination(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (uint64_t *)((char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10003F544(qword_1005542D8);
  v6 = __chkstk_darwin();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 120))(v6);
  v9 = type metadata accessor for PresentationSource(0);
  v10 = *(_QWORD *)(v9 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v12 = (void *)PresentationSource.viewController.getter(result);
    if (v12)
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
      v13 = v12;
      UIResponder.nearestFlowController.getter(&v18);

      if (v19)
      {
        sub_10002099C(&v18, (uint64_t)v20);
        v14 = sub_1003791F8(a1);
        if ((~v14 & 0xF000000000000007) != 0)
        {
          v15 = v14;
          v16 = v21;
          v17 = v22;
          sub_10003A834(v20, v21);
          *v5 = v15;
          (*(void (**)(uint64_t *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for FlowDestination.contextMenuPreview(_:), v2);
          swift_retain();
          v12 = (void *)dispatch thunk of FlowController.viewController(for:referrer:)(v5, 0, 0, v16, v17);
          sub_1003797A4(v15);

          (*(void (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v2);
          sub_10003D380(v20);
        }
        else
        {

          sub_10003D380(v20);
          return 0;
        }
      }
      else
      {

        sub_100007A28((uint64_t)&v18, &qword_100554570);
        return 0;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    }
    return (uint64_t)v12;
  }
  return result;
}

uint64_t sub_1003797A4(uint64_t result)
{
  if ((~result & 0xF000000000000007) != 0)
    return swift_release(result & 0x3FFFFFFFFFFFFFFFLL);
  return result;
}

uint64_t sub_1003797C0(unint64_t a1)
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
    v3 = sub_10037A928(v3);
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

BOOL sub_1003798A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  NSObject *v13;
  uint8_t *v14;
  uint64_t v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31[4];
  char v32[24];

  v2 = v1;
  v4 = type metadata accessor for DownloadJob(0);
  __chkstk_darwin(v4);
  v6 = (uint64_t *)((char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  objc_msgSend(*(id *)(v1 + 16), "lock");
  v7 = (_QWORD *)(v1 + 24);
  swift_beginAccess(v7, v32, 0, 0);
  v8 = *(_QWORD *)(v2 + 24);
  swift_retain(a1);
  v9 = swift_bridgeObjectRetain(v8);
  v10 = sub_10037A9A4(v9, a1);
  swift_bridgeObjectRelease(v8);
  swift_release(a1);
  if (v10)
  {
    v11 = swift_release(v10);
    v12 = static os_log_type_t.error.getter(v11);
    sub_100181038();
    v13 = static OS_os_log.downloads.getter();
    if (os_log_type_enabled(v13, v12))
    {
      swift_retain(a1);
      v29 = v12;
      v14 = (uint8_t *)swift_slowAlloc(12, -1);
      v15 = swift_slowAlloc(32, -1);
      v28 = v15;
      *(_DWORD *)v14 = 136446210;
      v31[0] = v15;
      v27 = v14 + 4;
      v16 = *(id *)(a1 + OBJC_IVAR____TtC8Podcasts11JobPipeline_accessQueue);
      OS_dispatch_queue.sync<A>(execute:)(v6, sub_10033F940, a1, v4);

      v17 = (_QWORD *)((char *)v6 + *(int *)(v4 + 20));
      v18 = *v17;
      v19 = v17[1];
      swift_bridgeObjectRetain(v19);
      sub_1001959BC((uint64_t)v6);
      v30 = sub_10003D274(v18, v19, v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, v31, v27, v14 + 12);
      swift_release(a1);
      swift_bridgeObjectRelease(v19);
      _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)v29, "Episode already exists in pipeline. %{public}s", v14, 0xCu);
      v20 = v28;
      swift_arrayDestroy(v28, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1, -1);
      swift_slowDealloc(v14, -1, -1);
    }

  }
  else
  {
    swift_beginAccess(v7, v31, 33, 0);
    swift_retain(a1);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v21);
    v23 = *(_QWORD *)((*v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v22 = *(_QWORD *)((*v7 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v23 >= v22 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v22 > 1, v23 + 1, 1);
    v24 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v23, a1);
    specialized Array._endMutation()(v24);
    swift_endAccess(v31);
  }
  objc_msgSend(*(id *)(v2 + 16), "unlock");
  return v10 == 0;
}

id sub_100379B70(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  char v17;
  unint64_t v18;
  Swift::String v19;
  Swift::String v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  _BYTE v32[24];

  v5 = type metadata accessor for DownloadJob(0);
  __chkstk_darwin(v5);
  v7 = (uint64_t *)((char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  objc_msgSend(*(id *)(v2 + 16), "lock");
  v26 = v2 + 24;
  swift_beginAccess(v2 + 24, v32, 0, 0);
  v27 = v2;
  v8 = *(_QWORD *)(v2 + 24);
  if ((unint64_t)v8 >> 62)
    goto LABEL_19;
  v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(v8);
  for (; v9; v9 = _CocoaArrayWrapper.endIndex.getter(v24))
  {
    v10 = 0;
    v28 = v9;
    v29 = v8 & 0xC000000000000001;
    while (1)
    {
      if (v29)
      {
        v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(v10, v8);
      }
      else
      {
        v11 = *(_QWORD *)(v8 + 8 * v10 + 32);
        swift_retain(v11);
      }
      v12 = *(id *)(v11 + OBJC_IVAR____TtC8Podcasts11JobPipeline_accessQueue);
      OS_dispatch_queue.sync<A>(execute:)(v7, sub_10033F940, v11, v5);

      v13 = (_QWORD *)((char *)v7 + *(int *)(v5 + 20));
      v15 = *v13;
      v14 = (void *)v13[1];
      swift_bridgeObjectRetain(v14);
      sub_1001959BC((uint64_t)v7);
      if (v15 == a1 && v14 == a2)
      {
        swift_bridgeObjectRelease(v8);
        swift_release(v11);
        v8 = (uint64_t)a2;
LABEL_16:
        swift_bridgeObjectRelease(v8);
        swift_bridgeObjectRelease(a2);
        swift_beginAccess(v26, &v30, 33, 0);
        v22 = sub_1003797C0(v10);
        swift_endAccess(&v30);
        swift_release(v22);
        return objc_msgSend(*(id *)(v27 + 16), "unlock");
      }
      v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v14, a1, a2, 0);
      swift_release(v11);
      swift_bridgeObjectRelease(v14);
      if ((v17 & 1) != 0)
        goto LABEL_16;
      v18 = v10 + 1;
      if (__OFADD__(v10, 1))
        break;
      ++v10;
      if (v18 == v28)
        goto LABEL_14;
    }
    __break(1u);
LABEL_19:
    if (v8 < 0)
      v24 = v8;
    else
      v24 = v8 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(v8);
  }
LABEL_14:
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(a2);
  v30 = 0;
  v31 = 0xE000000000000000;
  _StringGuts.grow(_:)(38);
  swift_bridgeObjectRelease(v31);
  v30 = 0xD00000000000001ALL;
  v31 = 0x800000010043FFA0;
  v19._countAndFlagsBits = a1;
  v19._object = a2;
  String.append(_:)(v19);
  v20._countAndFlagsBits = 0x756F6620746F6E20;
  v20._object = (void *)0xEA0000000000646ELL;
  String.append(_:)(v20);
  v21 = v31;
  sub_10033F96C();
  swift_bridgeObjectRelease(v21);
  return objc_msgSend(*(id *)(v27 + 16), "unlock");
}

uint64_t sub_100379E44(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[24];

  objc_msgSend(*(id *)(v1 + 16), "lock");
  swift_beginAccess(v1 + 24, v12, 0, 0);
  v3 = *(_QWORD *)(v1 + 24);
  if ((unint64_t)v3 >> 62)
    goto LABEL_14;
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n(*(_QWORD *)(v1 + 24), 2);
  while (v4)
  {
    v5 = 4;
    while (1)
    {
      v6 = v5 - 4;
      if ((v3 & 0xC000000000000001) == 0)
        break;
      v7 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5 - 4, v3);
      v8 = __OFADD__(v6, 1);
      v9 = v5 - 3;
      if (v8)
        goto LABEL_13;
LABEL_10:
      if ((*(_BYTE *)(v7 + OBJC_IVAR____TtC8Podcasts11JobPipeline_metadata + 40) & 1) == 0
        && *(_QWORD *)(v7 + OBJC_IVAR____TtC8Podcasts11JobPipeline_metadata + 32) == a1)
      {
        swift_bridgeObjectRelease_n(v3, 2);
        goto LABEL_19;
      }
      swift_release(v7);
      ++v5;
      if (v9 == v4)
        goto LABEL_18;
    }
    v7 = *(_QWORD *)(v3 + 8 * v5);
    swift_retain(v7);
    v8 = __OFADD__(v6, 1);
    v9 = v5 - 3;
    if (!v8)
      goto LABEL_10;
LABEL_13:
    __break(1u);
LABEL_14:
    if (v3 < 0)
      v10 = v3;
    else
      v10 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n(v3, 2);
    v4 = _CocoaArrayWrapper.endIndex.getter(v10);
  }
LABEL_18:
  swift_bridgeObjectRelease_n(v3, 2);
  v7 = 0;
LABEL_19:
  objc_msgSend(*(id *)(v1 + 16), "unlock");
  return v7;
}

uint64_t sub_100379FAC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_100379FD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  double v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34[24];

  v32 = type metadata accessor for DownloadJob(0);
  __chkstk_darwin();
  v8 = (uint64_t *)((char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  objc_msgSend(*(id *)(v2 + 16), "lock");
  swift_beginAccess(v2 + 24, v34, 0, 0);
  v29 = v2;
  v9 = *(_QWORD *)(v2 + 24);
  v33 = a2;
  if ((unint64_t)v9 >> 62)
    goto LABEL_21;
  v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n(v9, 2);
  swift_bridgeObjectRetain(a2);
  while (v10)
  {
    a2 = 0;
    v30 = v9;
    v31 = v9 & 0xC000000000000001;
    v11 = 4;
    while (1)
    {
      v12 = v11 - 4;
      if (!v31)
        break;
      v4 = specialized _ArrayBuffer._getElementSlowPath(_:)(v11 - 4, v9);
      v9 = v11 - 3;
      if (__OFADD__(v12, 1))
        goto LABEL_20;
LABEL_9:
      v3 = OBJC_IVAR____TtC8Podcasts11JobPipeline_accessQueue;
      v13 = *(id *)(v4 + OBJC_IVAR____TtC8Podcasts11JobPipeline_accessQueue);
      v14 = v32;
      OS_dispatch_queue.sync<A>(execute:)(v8, sub_10033F940, v4, v32);

      v15 = (_QWORD *)((char *)v8 + *(int *)(v14 + 20));
      v16 = *v15;
      v17 = v15[1];
      swift_bridgeObjectRetain(v17);
      sub_1001959BC((uint64_t)v8);
      v18 = v16 == a1 && v17 == v33;
      if (v18)
        goto LABEL_17;
      v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v17, a1, v33, 0);
      swift_bridgeObjectRelease(v17);
      if ((v19 & 1) != 0)
      {
        v20 = v30;
        v22 = v30;
        v21 = v33;
        goto LABEL_19;
      }
      swift_release(v4);
      ++v11;
      v18 = v9 == v10;
      v9 = v30;
      if (v18)
        goto LABEL_16;
    }
    v4 = *(_QWORD *)(v9 + 8 * v11);
    swift_retain();
    v9 = v11 - 3;
    if (!__OFADD__(v12, 1))
      goto LABEL_9;
LABEL_20:
    __break(1u);
LABEL_21:
    if (v9 < 0)
      v27 = v9;
    else
      v27 = v9 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n(v9, 2);
    swift_bridgeObjectRetain(a2);
    v10 = _CocoaArrayWrapper.endIndex.getter(v27);
  }
LABEL_16:
  swift_bridgeObjectRelease(v33);
  swift_bridgeObjectRelease_n(v9, 2);
  __break(1u);
LABEL_17:
  v20 = v30;
  swift_bridgeObjectRelease(v30);
  v21 = v33;
  v22 = v33;
LABEL_19:
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v22);
  swift_bridgeObjectRelease(v20);
  v23 = *(id *)(v4 + v3);
  OS_dispatch_queue.sync<A>(execute:)(v8, sub_10033F940, v4, v32);

  v24 = sub_1001D7DAC();
  sub_1001959BC((uint64_t)v8);
  *(_QWORD *)&v25 = swift_release(v4).n128_u64[0];
  objc_msgSend(*(id *)(v29 + 16), "unlock", v25);
  return v24;
}

uint64_t sub_10037A2DC(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28[24];

  v3 = type metadata accessor for DownloadJob(0);
  __chkstk_darwin();
  v5 = (uint64_t *)((char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  objc_msgSend(*(id *)(v1 + 16), "lock");
  v6 = objc_msgSend(a1, "episodeUuid");
  if (v6)
  {
    v7 = v6;
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v10 = v9;

    swift_beginAccess(v1 + 24, v28, 0, 0);
    v11 = *(_QWORD *)(v1 + 24);
    v25 = v1;
    if ((unint64_t)v11 >> 62)
      goto LABEL_21;
    v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRetain(v11);
    for (; v12; v12 = _CocoaArrayWrapper.endIndex.getter(v23))
    {
      v13 = 0;
      v26 = v12;
      v27 = v11 & 0xC000000000000001;
      while (1)
      {
        if (v27)
        {
          v14 = specialized _ArrayBuffer._getElementSlowPath(_:)(v13, v11);
        }
        else
        {
          v14 = *(_QWORD *)(v11 + 8 * v13 + 32);
          swift_retain();
        }
        v15 = *(id *)(v14 + OBJC_IVAR____TtC8Podcasts11JobPipeline_accessQueue);
        OS_dispatch_queue.sync<A>(execute:)(v5, sub_10033F940, v14, v3);

        v16 = (_QWORD *)((char *)v5 + *(int *)(v3 + 20));
        v18 = *v16;
        v17 = v16[1];
        swift_bridgeObjectRetain(v17);
        sub_1001959BC((uint64_t)v5);
        if (v18 == v8 && v17 == v10)
        {
          swift_bridgeObjectRelease(v11);
          swift_release(v14);
          v11 = v10;
LABEL_18:
          swift_bridgeObjectRelease(v11);
          swift_bridgeObjectRelease_n(v10, 2);
          v1 = v25;
          goto LABEL_19;
        }
        v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v18, v17, v8, v10, 0);
        swift_release(v14);
        swift_bridgeObjectRelease(v17);
        if ((v20 & 1) != 0)
          goto LABEL_18;
        v21 = v13 + 1;
        if (__OFADD__(v13, 1))
          break;
        ++v13;
        if (v21 == v26)
          goto LABEL_15;
      }
      __break(1u);
LABEL_21:
      if (v11 < 0)
        v23 = v11;
      else
        v23 = v11 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v10);
      swift_bridgeObjectRetain(v11);
    }
LABEL_15:
    swift_bridgeObjectRelease(v11);
    swift_bridgeObjectRelease_n(v10, 2);
    v1 = v25;
  }
  v13 = NSNotFound.getter();
LABEL_19:
  objc_msgSend(*(id *)(v1 + 16), "unlock");
  return v13;
}

void sub_10037A5A4(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _BYTE v11[24];

  v2 = v1;
  v4 = type metadata accessor for DownloadJob(0);
  __chkstk_darwin();
  v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  objc_msgSend(*(id *)(v2 + 16), "lock");
  swift_beginAccess(v2 + 24, v11, 0, 0);
  v7 = *(_QWORD *)(v2 + 24);
  if ((v7 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain(*(_QWORD *)(v2 + 24));
    v8 = specialized _ArrayBuffer._getElementSlowPath(_:)(a1, v7);
    swift_bridgeObjectRelease(v7);
    goto LABEL_5;
  }
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10) > a1)
  {
    v8 = *(_QWORD *)(v7 + 8 * a1 + 32);
    swift_retain();
LABEL_5:
    v9 = *(id *)(v8 + OBJC_IVAR____TtC8Podcasts11JobPipeline_accessQueue);
    OS_dispatch_queue.sync<A>(execute:)(v6, sub_10033F940, v8, v4);

    sub_1001D7DAC();
    sub_1001959BC((uint64_t)v6);
    objc_msgSend(*(id *)(v2 + 16), "unlock", swift_release(v8).n128_f64[0]);
    return;
  }
  __break(1u);
}

uint64_t sub_10037A7EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  _BYTE v11[24];

  objc_msgSend(*(id *)(v2 + 16), "lock");
  swift_beginAccess(v2 + 24, v11, 0, 0);
  v5 = *(_QWORD *)(v2 + 24);
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(v5);
  v7 = (uint64_t)sub_10037AC10(v6, a1, a2);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(a2);
  if ((unint64_t)v7 >> 62)
  {
    if (v7 < 0)
      v10 = v7;
    else
      v10 = v7 & 0xFFFFFFFFFFFFFF8;
    v8 = _CocoaArrayWrapper.endIndex.getter(v10);
  }
  else
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  objc_msgSend(*(id *)(v2 + 16), "unlock", swift_bridgeObjectRelease(v7).n128_f64[0]);
  return v8;
}

uint64_t sub_10037A928(uint64_t a1)
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

_QWORD *sub_10037A990(_QWORD *a1)
{
  return sub_10027AE00(0, a1[2], 0, a1);
}

uint64_t sub_10037A9A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v33 = a2;
  v32 = type metadata accessor for DownloadJob(0);
  __chkstk_darwin(v32);
  v31 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((unint64_t)a1 >> 62)
    goto LABEL_21;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  while (v4)
  {
    v29 = OBJC_IVAR____TtC8Podcasts11JobPipeline_accessQueue;
    v30 = a1 & 0xC000000000000001;
    v5 = 4;
    v27 = v4;
    v28 = a1;
    v6 = v31;
    while (1)
    {
      v7 = v5 - 4;
      if (!v30)
        break;
      v8 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5 - 4, a1);
      v9 = v5 - 3;
      if (__OFADD__(v7, 1))
        goto LABEL_20;
LABEL_9:
      v34 = v9;
      v10 = *(id *)(v8 + OBJC_IVAR____TtC8Podcasts11JobPipeline_accessQueue);
      v11 = v8;
      v12 = v8;
      v13 = v32;
      OS_dispatch_queue.sync<A>(execute:)(v6, sub_10033F940, v12, v32);

      v14 = (_QWORD *)((char *)v6 + *(int *)(v13 + 20));
      v16 = *v14;
      v15 = v14[1];
      swift_bridgeObjectRetain(v15);
      sub_1001959BC((uint64_t)v6);
      v17 = v33;
      v18 = *(id *)(v33 + v29);
      OS_dispatch_queue.sync<A>(execute:)(v6, sub_10033F940, v17, v13);

      v19 = (_QWORD *)((char *)v6 + *(int *)(v13 + 20));
      v21 = *v19;
      v20 = v19[1];
      swift_bridgeObjectRetain(v20);
      sub_1001959BC((uint64_t)v6);
      if (v16 == v21 && v15 == v20)
      {
        swift_bridgeObjectRelease(v28);
        swift_bridgeObjectRelease(v15);
LABEL_18:
        swift_bridgeObjectRelease(v15);
        return v11;
      }
      v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v15, v21, v20, 0);
      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease(v20);
      if ((v23 & 1) != 0)
      {
        v15 = v28;
        goto LABEL_18;
      }
      swift_release(v11);
      ++v5;
      a1 = v28;
      if (v34 == v27)
        goto LABEL_15;
    }
    v8 = *(_QWORD *)(a1 + 8 * v5);
    swift_retain(v8);
    v9 = v5 - 3;
    if (!__OFADD__(v7, 1))
      goto LABEL_9;
LABEL_20:
    __break(1u);
LABEL_21:
    if (a1 < 0)
      v25 = a1;
    else
      v25 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v4 = _CocoaArrayWrapper.endIndex.getter(v25);
  }
LABEL_15:
  swift_bridgeObjectRelease(a1);
  return 0;
}

_QWORD *sub_10037AC10(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v5 = a1;
  if (a1 >> 62)
    goto LABEL_21;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v6)
  {
    while (1)
    {
      v23 = v5;
      v7 = 0;
      v8 = v5 & 0xC000000000000001;
      v9 = v5 & 0xFFFFFFFFFFFFFF8;
      v24 = v5 & 0xC000000000000001;
      while (v8)
      {
        v10 = specialized _ArrayBuffer._getElementSlowPath(_:)(v7, v5);
        v11 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
LABEL_18:
          __break(1u);
          return _swiftEmptyArrayStorage;
        }
LABEL_9:
        v12 = (uint64_t *)(v10 + OBJC_IVAR____TtC8Podcasts11JobPipeline_metadata);
        v13 = *(_QWORD *)(v10 + OBJC_IVAR____TtC8Podcasts11JobPipeline_metadata + 8);
        if (v13
          && ((v14 = *v12, *v12 == a2) ? (v15 = v13 == a3) : (v15 = 0),
              v15 || (v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v13, a2, a3, 0), (v14 & 1) != 0)))
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v14);
          v16 = v9;
          v17 = v6;
          v18 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v18);
          v19 = v18;
          v6 = v17;
          v9 = v16;
          v20 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v19, v10);
          specialized ContiguousArray._endMutation()(v20);
          v5 = v23;
          v8 = v24;
        }
        else
        {
          swift_release(v10);
        }
        ++v7;
        if (v11 == v6)
          return _swiftEmptyArrayStorage;
      }
      if (v7 < *(_QWORD *)(v9 + 16))
        break;
      __break(1u);
LABEL_21:
      if (v5 < 0)
        v22 = v5;
      else
        v22 = v5 & 0xFFFFFFFFFFFFFF8;
      v6 = _CocoaArrayWrapper.endIndex.getter(v22);
      if (!v6)
        return _swiftEmptyArrayStorage;
    }
    v10 = *(_QWORD *)(v5 + 8 * v7 + 32);
    swift_retain(v10);
    v11 = v7 + 1;
    if (__OFADD__(v7, 1))
      goto LABEL_18;
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

id sub_10037ADBC(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id result;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void **aBlock;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  void *v43;
  void (*v44)();
  uint64_t v45;
  char v46[32];

  v37 = a2;
  v38 = a4;
  v36 = type metadata accessor for DownloadJob(0);
  __chkstk_darwin();
  v35 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(*(id *)(a1 + 16), "lock");
  swift_beginAccess(a1 + 24, v46, 0, 0);
  v30 = a1;
  v7 = *(_QWORD *)(a1 + 24);
  if (!((unint64_t)v7 >> 62))
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = (id)swift_bridgeObjectRetain_n(v7, 2);
    if (v8)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease_n(v7, 2);
    return objc_msgSend(*(id *)(v30 + 16), "unlock");
  }
  if (v7 < 0)
    v28 = *(_QWORD *)(a1 + 24);
  else
    v28 = v7 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain_n(v7, 2);
  result = (id)_CocoaArrayWrapper.endIndex.getter(v28);
  v8 = (uint64_t)result;
  if (!result)
    goto LABEL_13;
LABEL_3:
  if (v8 >= 1)
  {
    v10 = 0;
    v32 = v7 & 0xC000000000000001;
    v31 = a3 & 1;
    v33 = v8;
    v34 = v7;
    v11 = v35;
    v12 = v36;
    do
    {
      if (v32)
      {
        v13 = specialized _ArrayBuffer._getElementSlowPath(_:)(v10, v7);
      }
      else
      {
        v13 = *(_QWORD *)(v7 + 8 * v10 + 32);
        swift_retain();
      }
      ++v10;
      v39 = OBJC_IVAR____TtC8Podcasts11JobPipeline_accessQueue;
      v14 = *(id *)(v13 + OBJC_IVAR____TtC8Podcasts11JobPipeline_accessQueue);
      OS_dispatch_queue.sync<A>(execute:)(v11, sub_10033F940, v13, v12);

      v15 = (_QWORD *)((char *)v11 + *(int *)(v12 + 20));
      v17 = *v15;
      v16 = v15[1];
      swift_bridgeObjectRetain(v16);
      sub_1001959BC((uint64_t)v11);
      v18 = sub_10002BE98();
      v19 = swift_allocObject(&unk_1004C6930, 24, 7);
      swift_unknownObjectWeakInit(v19 + 16);
      v20 = swift_allocObject(&unk_1004C6958, 41, 7);
      *(_QWORD *)(v20 + 16) = v19;
      *(_QWORD *)(v20 + 24) = v17;
      *(_QWORD *)(v20 + 32) = v16;
      *(_BYTE *)(v20 + 40) = v31;
      v44 = sub_10033F95C;
      v45 = v20;
      aBlock = _NSConcreteStackBlock;
      v41 = 1107296256;
      v42 = sub_100027AF8;
      v43 = &unk_1004C6970;
      v21 = _Block_copy(&aBlock);
      v22 = v45;
      swift_bridgeObjectRetain(v16);
      objc_msgSend(v18, "addOperationWithBlock:", v21, swift_release(v22).n128_f64[0]);
      _Block_release(v21);
      swift_bridgeObjectRelease(v16);

      v23 = *(id *)(v13 + v39);
      OS_dispatch_queue.sync<A>(execute:)(v11, sub_10033F940, v13, v12);

      v24 = (_QWORD *)((char *)v11 + *(int *)(v12 + 20));
      v25 = *v24;
      v26 = v24[1];
      swift_bridgeObjectRetain(v26);
      sub_1001959BC((uint64_t)v11);
      sub_10002B270((uint64_t *)&aBlock, v25, v26);
      v27 = v41;
      swift_release(v13);
      swift_bridgeObjectRelease(v27);
      v7 = v34;
    }
    while (v33 != v10);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_10037B0E8()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10037B10C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 41, 7);
}

uint64_t sub_10037B138()
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
  void (*v9)(__n128);
  __n128 v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v20[24];

  v1 = v0;
  type metadata accessor for InteractionContext.Page(0);
  __chkstk_darwin();
  v3 = &v20[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v4 = type metadata accessor for InteractionContext(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  swift_beginAccess(v0 + 64, v20, 0, 0);
  v8 = *(_QWORD *)(v0 + 64);
  if (!v8)
    goto LABEL_5;
  v9 = *(void (**)(__n128))(*(_QWORD *)v8 + 168);
  v10 = swift_retain();
  v9(v10);
  swift_release(v8);
  InteractionContext.page.getter(v11);
  v12 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v13 = InteractionContext.Page.isRecentlyUnfollowedPage.getter(v12);
  sub_10017603C((uint64_t)v3);
  if ((v13 & 1) == 0)
    goto LABEL_5;
  v14 = *(_QWORD *)(v1 + 56);
  if (v14)
  {
    swift_retain();
    v15 = sub_1001E35A4();
    v17 = v16;
    swift_release(v14);
    swift_bridgeObjectRelease(v17);
  }
  else
  {
LABEL_5:
    v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_10037B288()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;

  sub_10003D380(v0 + 2);
  swift_release(v0[7]);
  swift_release(v0[8]);
  swift_bridgeObjectRelease(v0[11]);
  v1 = (char *)v0 + OBJC_IVAR____TtC8Podcasts44DeleteRecentlyUnfollowedPodcastContextAction_metricsLabel;
  v2 = type metadata accessor for MetricsLabel(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48), *(unsigned __int16 *)(*v0 + 52));
}

uint64_t sub_10037B2F8()
{
  return type metadata accessor for DeleteRecentlyUnfollowedPodcastContextAction(0);
}

uint64_t type metadata accessor for DeleteRecentlyUnfollowedPodcastContextAction(uint64_t a1)
{
  uint64_t result;

  result = qword_100566DA8;
  if (!qword_100566DA8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for DeleteRecentlyUnfollowedPodcastContextAction);
  return result;
}

uint64_t sub_10037B33C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[7];

  v4[0] = "(";
  v4[1] = &unk_1003D7848;
  v4[2] = &unk_1003D7848;
  v4[3] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[4] = &unk_1003D7860;
  result = type metadata accessor for MetricsLabel(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(result - 8) + 64;
    v4[6] = &unk_1003D7878;
    result = swift_updateClassMetadata2(a1, 256, 7, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_10037B3E0()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  uint64_t countAndFlagsBits;
  Swift::String v5;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v5._object = (void *)0xE000000000000000;
  v1._countAndFlagsBits = 0x535F45564F4D4552;
  v1._object = (void *)0xEB00000000574F48;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v5._countAndFlagsBits = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v5)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_10037B480@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC8Podcasts44DeleteRecentlyUnfollowedPodcastContextAction_metricsLabel;
  v4 = type metadata accessor for MetricsLabel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_10037B4C4()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC8Podcasts44DeleteRecentlyUnfollowedPodcastContextAction_contextActionType);
}

double sub_10037B4D8()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  double result;

  v1 = v0[7];
  if (v1)
  {
    v2 = v0;
    swift_retain();
    sub_1001E35A4();
    if (v4)
    {
      v5 = v3;
      v6 = v4;
      v7 = v2 + 2;
      v9 = v2[5];
      v8 = v2[6];
      sub_10003A834(v7, v9);
      dispatch thunk of LibraryActionControllerProtocol.deleteRecentlyUnfollowedShow(uuid:)(v5, v6, v9, v8);
      swift_release(v1);
      *(_QWORD *)&result = swift_bridgeObjectRelease(v6).n128_u64[0];
    }
    else
    {
      *(_QWORD *)&result = swift_release(v1).n128_u64[0];
    }
  }
  return result;
}

uint64_t sub_10037B58C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t *v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4];
  v8 = a3[5];
  if (v7 == a1 && v8 == a2)
    return 1;
  result = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, a1, a2, 0);
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v11 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v13 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v14 = *(v11 - 1);
    v15 = *v11;
    v16 = v14 == a1 && v15 == a2;
    if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, a1, a2, 0) & 1) != 0)
      return 1;
    result = 0;
    v11 += 2;
    if (v13 == v3)
      return result;
  }
  __break(1u);
  return result;
}

void sub_10037B650(uint64_t a1, char a2)
{
  sub_10037B784(a1, a2, (uint64_t *)&unk_100564DF0);
}

void sub_10037B660(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v6)(uint64_t *);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v3 = v2;
  v6 = *(void (**)(uint64_t *))(v2 + OBJC_IVAR____TtC8Podcasts13BaseOperation_resultHandler);
  if (v6)
  {
    v7 = *(_QWORD *)(v2 + OBJC_IVAR____TtC8Podcasts13BaseOperation_resultHandler + 8);
    v12 = sub_10003F544(&qword_10055A088);
    v10 = a1;
    v11 = a2;
    sub_10002CA20((uint64_t)v6, v7);
    sub_10003A8DC(a1, a2);
    v6(&v10);
    sub_10002CA30((uint64_t)v6, v7);
    sub_10003D380(&v10);
  }
  if (a2 == 1)
  {
    v8 = OBJC_IVAR____TtC8Podcasts13BaseOperation_lock;
    v9 = *(void **)(v3 + OBJC_IVAR____TtC8Podcasts13BaseOperation_lock);
    swift_errorRetain();
    objc_msgSend(v9, "lock");
    *(_QWORD *)(v3 + OBJC_IVAR____TtC8Podcasts13BaseOperation__error) = a1;
    swift_errorRetain();
    swift_errorRelease();
    objc_msgSend(*(id *)(v3 + v8), "unlock");
    sub_10003A858(a1, 1);
  }
  sub_100044BF0();
}

void sub_10037B778(uint64_t a1, char a2)
{
  sub_10037B784(a1, a2, (uint64_t *)&unk_100564DC0);
}

void sub_10037B784(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  void (*v7)(uint64_t *);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v4 = v3;
  v7 = *(void (**)(uint64_t *))(v3 + OBJC_IVAR____TtC8Podcasts13BaseOperation_resultHandler);
  if (v7)
  {
    v8 = *(_QWORD *)(v3 + OBJC_IVAR____TtC8Podcasts13BaseOperation_resultHandler + 8);
    v14 = sub_10003F544(a3);
    v12 = a1;
    v13 = a2;
    sub_10002CA20((uint64_t)v7, v8);
    sub_100045994(a1, a2);
    v7(&v12);
    sub_10002CA30((uint64_t)v7, v8);
    sub_10003D380(&v12);
  }
  if (a2 == 1)
  {
    v9 = OBJC_IVAR____TtC8Podcasts13BaseOperation_lock;
    v10 = *(void **)(v4 + OBJC_IVAR____TtC8Podcasts13BaseOperation_lock);
    swift_errorRetain(a1);
    objc_msgSend(v10, "lock");
    v11 = *(_QWORD *)(v4 + OBJC_IVAR____TtC8Podcasts13BaseOperation__error);
    *(_QWORD *)(v4 + OBJC_IVAR____TtC8Podcasts13BaseOperation__error) = a1;
    swift_errorRetain(a1);
    swift_errorRelease(v11);
    objc_msgSend(*(id *)(v4 + v9), "unlock");
    sub_100045978(a1, 1);
  }
  sub_100044BF0();
}

void sub_10037B898(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  void (*v7)(_QWORD *, __n128);
  uint64_t v8;
  _QWORD *v9;
  __n128 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];

  v2 = v1;
  v4 = sub_10003F544(&qword_100564EA0);
  __chkstk_darwin();
  v6 = (_QWORD *)((char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = *(void (**)(_QWORD *, __n128))(v1 + OBJC_IVAR____TtC8Podcasts13BaseOperation_resultHandler);
  if (v7)
  {
    v8 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8Podcasts13BaseOperation_resultHandler + 8);
    v14[3] = v4;
    v9 = sub_1000242A8(v14);
    sub_10037D5EC(a1, (uint64_t)v9);
    v10 = swift_retain();
    v7(v14, v10);
    sub_10002CA30((uint64_t)v7, v8);
    sub_10003D380(v14);
  }
  sub_10037D5EC(a1, (uint64_t)v6);
  if (swift_getEnumCaseMultiPayload(v6, v4) == 1)
  {
    v11 = *v6;
    v12 = OBJC_IVAR____TtC8Podcasts13BaseOperation_lock;
    v13 = *(void **)(v2 + OBJC_IVAR____TtC8Podcasts13BaseOperation_lock);
    swift_errorRetain();
    objc_msgSend(v13, "lock");
    *(_QWORD *)(v2 + OBJC_IVAR____TtC8Podcasts13BaseOperation__error) = v11;
    swift_errorRetain();
    swift_errorRelease();
    objc_msgSend(*(id *)(v2 + v12), "unlock");
    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    sub_100007A28((uint64_t)v6, &qword_100564EA0);
  }
  sub_100044BF0();
}

uint64_t sub_10037BA08()
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  __n128 v29;
  void (*v30)(char *, uint64_t, uint64_t, __n128);
  Swift::Bool v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  objc_class *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  unint64_t v48;
  char *v49;
  id v50;
  char *v51;
  char *v52;
  void (*v53)(char *, uint64_t);
  __n128 v54;
  void (*v55)(uint64_t, char *, uint64_t, __n128);
  __n128 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  double v65;
  Swift::String v66;
  Swift::String v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t *v73;
  unint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t *v77;
  id v78;
  NSURL *v79;
  void *v80;
  void *v81;
  id v82;
  unsigned __int8 v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  id v90;
  id v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  _QWORD *v97;
  uint64_t v98;
  __n128 v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
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
  double v115;
  Swift::String v116;
  id v117;
  void *v118;
  void *v119;
  char *v120;
  uint64_t v121;
  char *v122;
  uint64_t (*v123)(char *, uint64_t);
  id v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  double v135;
  Swift::String v136;
  id v137;
  id v138;
  void *v139;
  char *v140;
  uint64_t v141;
  char *v142;
  id v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  double v161;
  Swift::String v162;
  id v163;
  id v164;
  void *v165;
  char *v166;
  uint64_t v167;
  char *v168;
  id v169;
  uint64_t v170;
  char *v171;
  uint64_t *v172;
  Swift::String v173;
  void *object;
  uint64_t v175;
  unint64_t v176;
  unint64_t v177;
  uint64_t v178;
  _QWORD *v179;
  char *v180;
  uint64_t v181;
  uint64_t *v182;
  Swift::String v183;
  void *v184;
  uint64_t v185;
  unint64_t v186;
  unint64_t v187;
  uint64_t v188;
  _QWORD *v189;
  id v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  unint64_t v196;
  char *v197;
  uint64_t v198;
  uint64_t v199;
  double v200;
  Swift::String v201;
  id v202;
  id v203;
  void *v204;
  char *v205;
  uint64_t v206;
  uint64_t v207;
  Swift::String v208;
  void *v209;
  uint64_t v210;
  unint64_t v211;
  unint64_t v212;
  uint64_t v213;
  _QWORD *v214;
  uint64_t v215;
  uint64_t *v216;
  Swift::String v217;
  void *v218;
  uint64_t v219;
  unint64_t v220;
  unint64_t v221;
  uint64_t v222;
  _QWORD *v223;
  uint64_t v224;
  void (*v225)(char *, uint64_t, uint64_t);
  char *v226;
  char *v227;
  objc_class *v228;
  char *v229;
  char *v230;
  char *v231;
  int *v232;
  void (*v233)(char *, uint64_t);
  char *v234;
  void (*v235)(char *, uint64_t);
  uint64_t v236;
  __n128 v237;
  id v238;
  NSURL *v239;
  void *v240;
  void *v241;
  id v242;
  __n128 v243;
  _QWORD *v244;
  uint64_t *v245;
  char *v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  uint64_t v250;
  uint64_t v251;
  unint64_t v252;
  char *v253;
  uint64_t v254;
  uint64_t v255;
  double v256;
  Swift::String v257;
  id v258;
  id v259;
  void *v260;
  char *v261;
  uint64_t v262;
  char *v263;
  id v264;
  char *v265;
  Swift::String v266;
  void *v267;
  uint64_t v268;
  unint64_t v269;
  unint64_t v270;
  uint64_t v271;
  _QWORD *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  id v276;
  id v277;
  Class v278;
  unint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  _QWORD *v283;
  uint64_t v284;
  id v285;
  void (*v286)(char *, uint64_t, uint64_t);
  uint64_t v287;
  uint64_t *v288;
  uint64_t *v289;
  char *v290;
  char *v291;
  uint64_t *v292;
  char *v293;
  char *v294;
  uint64_t *v295;
  char *v296;
  uint64_t *v297;
  char *v298;
  char *v299;
  void (*v300)(uint64_t, char *, uint64_t, __n128);
  uint64_t *v301;
  char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  char *v306;
  uint64_t v307;
  char *v308;
  int *v309;
  void (*v310)(char *, uint64_t);
  objc_super v311;
  uint64_t v312;
  unint64_t v313;
  objc_super v314;
  char v315[8];

  v309 = (int *)type metadata accessor for ValidateOperation.Result(0);
  __chkstk_darwin();
  v2 = (uint64_t *)((char *)&v274 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  v305 = sub_10003F544((uint64_t *)&unk_100553DC0);
  __chkstk_darwin();
  v302 = (char *)&v274 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin();
  v298 = (char *)&v274 - v4;
  __chkstk_darwin();
  v294 = (char *)&v274 - v5;
  __chkstk_darwin();
  v290 = (char *)&v274 - v6;
  __chkstk_darwin();
  v293 = (char *)&v274 - v7;
  sub_10003F544(&qword_100566F50);
  __chkstk_darwin();
  v300 = (void (*)(uint64_t, char *, uint64_t, __n128))((char *)&v274 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = type metadata accessor for UTType(0);
  v303 = *(_QWORD *)(v9 - 8);
  v304 = v9;
  __chkstk_darwin();
  v299 = (char *)&v274 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin();
  v296 = (char *)&v274 - v11;
  v12 = sub_10003F544(&qword_100564EA0);
  __chkstk_darwin();
  v301 = (uint64_t *)((char *)&v274 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin();
  v297 = (uint64_t *)((char *)&v274 - v14);
  __chkstk_darwin();
  v295 = (uint64_t *)((char *)&v274 - v15);
  __chkstk_darwin();
  v289 = (uint64_t *)((char *)&v274 - v16);
  __chkstk_darwin();
  v292 = (uint64_t *)((char *)&v274 - v17);
  __chkstk_darwin();
  v19 = (uint64_t *)((char *)&v274 - v18);
  v20 = type metadata accessor for URL(0);
  v21 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin();
  v291 = (char *)&v274 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin();
  v306 = (char *)&v274 - v23;
  __chkstk_darwin();
  v308 = (char *)&v274 - v24;
  __chkstk_darwin();
  v26 = (char *)&v274 - v25;
  v27 = v0;
  v28 = v0 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_source;
  v29 = swift_beginAccess(v0 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_source, v315, 0, 0);
  v30 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v21 + 16);
  v30(v26, v28, v20, v29);
  v31 = URL.isPackagedMedia()();
  v307 = v21;
  v310 = *(void (**)(char *, uint64_t))(v21 + 8);
  v310(v26, v20);
  if (v31)
  {
    v32 = v27 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_originalExtension;
    v33 = *(_QWORD *)(v27 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_originalExtension);
    v34 = *(_QWORD *)(v32 + 8);
    ((void (*)(char *, uint64_t, uint64_t))v30)((char *)v2 + v309[5], v28, v20);
    *v2 = v33;
    v2[1] = v34;
    sub_10037D56C((uint64_t)v2, (uint64_t)v19);
    swift_storeEnumTagMultiPayload(v19, v12, 0);
    swift_bridgeObjectRetain(v34);
    sub_10037B898((uint64_t)v19);
    sub_100007A28((uint64_t)v19, &qword_100564EA0);
    return sub_10037D5B0((uint64_t)v2);
  }
  v286 = (void (*)(char *, uint64_t, uint64_t))v30;
  v287 = v28;
  v288 = v19;
  v283 = v2;
  v36 = v27;
  v37 = *(void **)(v27 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_response);
  if (!v37)
  {
    v74 = sub_100150A08();
    v75 = swift_allocError(&type metadata for PostflightError, v74, 0, 0);
    *v76 = 0xD00000000000002ELL;
    v76[1] = 0x8000000100440060;
    v77 = v288;
    *v288 = v75;
    swift_storeEnumTagMultiPayload(v77, v12, 1);
    sub_10037B898((uint64_t)v77);
    return sub_100007A28((uint64_t)v77, &qword_100564EA0);
  }
  v284 = v12;
  v38 = v287;
  v39 = v286;
  v286(v26, v287, v20);
  v41 = *(_QWORD *)(v27 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_originalExtension);
  v40 = *(_QWORD *)(v27 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_originalExtension + 8);
  v285 = v37;
  v42 = v308;
  v281 = v41;
  v282 = v40;
  URL.appendingPathExtension(_:)(v41, v40);
  v310(v26, v20);
  v39(v26, v38, v20);
  v43 = v306;
  v39(v306, (uint64_t)v42, v20);
  v44 = (objc_class *)type metadata accessor for MoveFileOperation(0);
  v45 = v36;
  v46 = (char *)objc_allocWithZone(v44);
  v47 = &v46[OBJC_IVAR____TtC8Podcasts17MoveFileOperation_input];
  *(_QWORD *)v47 = 0;
  v47[8] = 2;
  v39(&v46[OBJC_IVAR____TtC8Podcasts17MoveFileOperation_destination], (uint64_t)v43, v20);
  v39(&v46[OBJC_IVAR____TtC8Podcasts17MoveFileOperation_source], (uint64_t)v26, v20);
  v48 = sub_100181038();
  v49 = v46;
  v279 = v48;
  *(_QWORD *)&v49[OBJC_IVAR____TtC8Podcasts17MoveFileOperation_log] = static OS_os_log.default.getter(v49);

  v314.receiver = v49;
  v314.super_class = v44;
  v278 = v44;
  v50 = objc_msgSendSuper2(&v314, "init");
  v51 = v43;
  v52 = v42;
  v53 = v310;
  v310(v51, v20);
  v53(v26, v20);
  sub_10027CF04();
  v54 = swift_beginAccess(v38, &v312, 33, 0);
  v55 = *(void (**)(uint64_t, char *, uint64_t, __n128))(v307 + 24);
  v55(v38, v52, v20, v54);
  v56 = swift_endAccess(&v312);
  ((void (*)(char *, uint64_t, uint64_t, __n128))v39)(v26, v38, v20, v56);
  LOBYTE(v48) = URL.isHLSPlaylist()();
  v57 = ((uint64_t (*)(char *, uint64_t))v53)(v26, v20);
  if ((v48 & 1) != 0)
  {
    v58 = static os_log_type_t.error.getter(v57);
    v59 = *(_QWORD *)(v45 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_log);
    v60 = sub_10003F544(&qword_1005559A0);
    v61 = swift_allocObject(v60, 72, 7);
    *(_OWORD *)(v61 + 16) = xmmword_1003CA200;
    v62 = v50;
    v64 = *(_QWORD *)(v45 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_episodeUuid);
    v63 = *(void **)(v45 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_episodeUuid + 8);
    *(_QWORD *)(v61 + 56) = &type metadata for String;
    *(_QWORD *)(v61 + 64) = sub_10003E198();
    *(_QWORD *)(v61 + 32) = v64;
    *(_QWORD *)(v61 + 40) = v63;
    *(_QWORD *)&v65 = swift_bridgeObjectRetain(v63).n128_u64[0];
    os_log(_:dso:log:_:_:)(v58, &_mh_execute_header, v59, "HLS playlists (m3u8) cannot be downloaded directly, expected .movpkg format from AVFoundation for episode uuid: %{public}s.", 123, 2, v61, v65);
    swift_bridgeObjectRelease(v61);
    v312 = 0;
    v313 = 0xE000000000000000;
    _StringGuts.grow(_:)(114);
    v66._countAndFlagsBits = 0xD000000000000070;
    v66._object = (void *)0x8000000100440590;
    String.append(_:)(v66);
    swift_bridgeObjectRetain(v63);
    v67._countAndFlagsBits = v64;
    v67._object = v63;
    String.append(_:)(v67);
    swift_bridgeObjectRelease(v63);
    v68 = v312;
    v69 = v313;
    v70 = sub_100150A08();
    v71 = swift_allocError(&type metadata for PostflightError, v70, 0, 0);
    *v72 = v68;
    v72[1] = v69;
    v73 = v288;
    *v288 = v71;
    swift_storeEnumTagMultiPayload(v73, v284, 1);
    sub_10037B898((uint64_t)v73);
    sub_100007A28((uint64_t)v73, &qword_100564EA0);

    return ((uint64_t (*)(char *, uint64_t))v53)(v52, v20);
  }
  v277 = v50;
  v280 = v45;
  v39(v26, v38, v20);
  v78 = objc_allocWithZone((Class)AVURLAsset);
  URL._bridgeToObjectiveC()(v79);
  v81 = v80;
  v82 = objc_msgSend(v78, "initWithURL:options:", v80, 0);

  v53(v26, v20);
  v83 = objc_msgSend(v82, "isPlayable");
  v84 = v20;
  if ((v83 & 1) != 0)
  {
    v85 = v283;
    v86 = v38;
    v87 = v84;
    v39((char *)v283 + v309[5], v86, v84);
    v88 = v282;
    *v85 = v281;
    v85[1] = v88;
    v89 = v288;
    sub_10037D56C((uint64_t)v85, (uint64_t)v288);
    swift_storeEnumTagMultiPayload(v89, v284, 0);
    swift_bridgeObjectRetain(v88);
    sub_10037B898((uint64_t)v89);

    sub_100007A28((uint64_t)v89, &qword_100564EA0);
    sub_10037D5B0((uint64_t)v85);
    return ((uint64_t (*)(char *, uint64_t))v53)(v308, v87);
  }
  v275 = v20;
  v276 = v82;
  v90 = v285;
  v91 = objc_msgSend(v285, "MIMEType");
  if (!v91)
  {
    v107 = v275;
    v108 = static os_log_type_t.error.getter(0);
    v109 = v280;
    v110 = *(_QWORD *)(v280 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_log);
    v111 = sub_10003F544(&qword_1005559A0);
    v112 = swift_allocObject(v111, 72, 7);
    *(_OWORD *)(v112 + 16) = xmmword_1003CA200;
    v114 = *(_QWORD *)(v109 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_episodeUuid);
    v113 = *(_QWORD *)(v109 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_episodeUuid + 8);
    *(_QWORD *)(v112 + 56) = &type metadata for String;
    *(_QWORD *)(v112 + 64) = sub_10003E198();
    *(_QWORD *)(v112 + 32) = v114;
    *(_QWORD *)(v112 + 40) = v113;
    *(_QWORD *)&v115 = swift_bridgeObjectRetain(v113).n128_u64[0];
    os_log(_:dso:log:_:_:)(v108, &_mh_execute_header, v110, "The original file extension was not playable and a mimeType was not provided for episode uuid: %{public}s.", 106, 2, v112, v115);
    swift_bridgeObjectRelease(v112);
    v312 = 0;
    v313 = 0xE000000000000000;
    _StringGuts.grow(_:)(96);
    v116._countAndFlagsBits = 0xD00000000000005ELL;
    v116._object = (void *)0x8000000100440100;
    String.append(_:)(v116);
    v117 = objc_msgSend(v90, "URL");
    v118 = v90;
    if (v117)
    {
      v119 = v117;
      v120 = v302;
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v117);

      v121 = 0;
      v122 = v308;
      v123 = (uint64_t (*)(char *, uint64_t))v310;
      v124 = v277;
      v125 = v305;
    }
    else
    {
      v121 = 1;
      v122 = v308;
      v123 = (uint64_t (*)(char *, uint64_t))v310;
      v124 = v277;
      v125 = v305;
      v120 = v302;
    }
    v172 = v301;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v307 + 56))(v120, v121, 1, v107);
    v173._countAndFlagsBits = String.init<A>(describing:)(v120, v125);
    object = v173._object;
    String.append(_:)(v173);
    swift_bridgeObjectRelease(object);
    v175 = v312;
    v176 = v313;
    v177 = sub_100150A08();
    v178 = swift_allocError(&type metadata for PostflightError, v177, 0, 0);
    *v179 = v175;
    v179[1] = v176;
    *v172 = v178;
    swift_storeEnumTagMultiPayload(v172, v284, 1);
    sub_10037B898((uint64_t)v172);

    sub_100007A28((uint64_t)v172, &qword_100564EA0);
    v180 = v122;
    v181 = v107;
    return v123(v180, v181);
  }
  v92 = v91;
  v93 = static String._unconditionallyBridgeFromObjectiveC(_:)(v91);
  v95 = v94;

  v96 = objc_msgSend((id)objc_opt_self(AVURLAsset), "audiovisualMIMETypes");
  v97 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v96, &type metadata for String);

  LOBYTE(v96) = sub_10037B58C(v93, v95, v97);
  swift_bridgeObjectRelease(v97);
  if ((v96 & 1) == 0)
  {
    v126 = v275;
    v127 = static os_log_type_t.error.getter(v98);
    v128 = v280;
    v129 = *(_QWORD *)(v280 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_log);
    v130 = sub_10003F544(&qword_1005559A0);
    v131 = swift_allocObject(v130, 112, 7);
    *(_OWORD *)(v131 + 16) = xmmword_1003CA220;
    *(_QWORD *)(v131 + 56) = &type metadata for String;
    v132 = sub_10003E198();
    *(_QWORD *)(v131 + 32) = v93;
    *(_QWORD *)(v131 + 40) = v95;
    v134 = *(_QWORD *)(v128 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_episodeUuid);
    v133 = *(_QWORD *)(v128 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_episodeUuid + 8);
    *(_QWORD *)(v131 + 96) = &type metadata for String;
    *(_QWORD *)(v131 + 104) = v132;
    *(_QWORD *)(v131 + 64) = v132;
    *(_QWORD *)(v131 + 72) = v134;
    *(_QWORD *)(v131 + 80) = v133;
    *(_QWORD *)&v135 = swift_bridgeObjectRetain(v133).n128_u64[0];
    os_log(_:dso:log:_:_:)(v127, &_mh_execute_header, v129, "The original file extension was not playable and mimeType %{public}s is not supported for episode uuid: %{public}s.", 115, 2, v131, v135);
    swift_bridgeObjectRelease(v131);
    v312 = 0;
    v313 = 0xE000000000000000;
    _StringGuts.grow(_:)(105);
    v136._countAndFlagsBits = 0xD000000000000067;
    v136._object = (void *)0x80000001004401E0;
    String.append(_:)(v136);
    v137 = v285;
    v138 = objc_msgSend(v285, "URL");
    if (v138)
    {
      v139 = v138;
      v140 = v298;
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v138);

      v141 = 0;
      v142 = v308;
      v123 = (uint64_t (*)(char *, uint64_t))v310;
      v143 = v277;
      v144 = v305;
    }
    else
    {
      v141 = 1;
      v142 = v308;
      v123 = (uint64_t (*)(char *, uint64_t))v310;
      v143 = v277;
      v144 = v305;
      v140 = v298;
    }
    v182 = v297;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v307 + 56))(v140, v141, 1, v126);
    v183._countAndFlagsBits = String.init<A>(describing:)(v140, v144);
    v184 = v183._object;
    String.append(_:)(v183);
    swift_bridgeObjectRelease(v184);
    v185 = v312;
    v186 = v313;
    v187 = sub_100150A08();
    v188 = swift_allocError(&type metadata for PostflightError, v187, 0, 0);
    *v189 = v185;
    v189[1] = v186;
    *v182 = v188;
    swift_storeEnumTagMultiPayload(v182, v284, 1);
    sub_10037B898((uint64_t)v182);

    sub_100007A28((uint64_t)v182, &qword_100564EA0);
    v180 = v142;
    v181 = v126;
    return v123(v180, v181);
  }
  v99 = swift_bridgeObjectRetain(v95);
  v100 = v299;
  static UTType.data.getter(v99);
  v101 = (uint64_t)v300;
  v301 = (uint64_t *)v93;
  v302 = (char *)v95;
  UTType.init(mimeType:conformingTo:)(v93, v95, v100);
  v103 = v303;
  v102 = v304;
  v104 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v303 + 48))(v101, 1, v304);
  v105 = v280;
  if (v104 == 1)
  {
    v106 = sub_100007A28(v101, &qword_100566F50);
LABEL_28:
    v190 = v277;
    v151 = v275;
    v191 = static os_log_type_t.error.getter(v106);
    v192 = *(_QWORD *)(v105 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_log);
    v193 = sub_10003F544(&qword_1005559A0);
    v194 = v105;
    v195 = swift_allocObject(v193, 112, 7);
    *(_OWORD *)(v195 + 16) = xmmword_1003CA220;
    *(_QWORD *)(v195 + 56) = &type metadata for String;
    v196 = sub_10003E198();
    v197 = v302;
    *(_QWORD *)(v195 + 32) = v301;
    *(_QWORD *)(v195 + 40) = v197;
    v199 = *(_QWORD *)(v194 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_episodeUuid);
    v198 = *(_QWORD *)(v194 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_episodeUuid + 8);
    *(_QWORD *)(v195 + 96) = &type metadata for String;
    *(_QWORD *)(v195 + 104) = v196;
    *(_QWORD *)(v195 + 64) = v196;
    *(_QWORD *)(v195 + 72) = v199;
    *(_QWORD *)(v195 + 80) = v198;
    *(_QWORD *)&v200 = swift_bridgeObjectRetain(v198).n128_u64[0];
    os_log(_:dso:log:_:_:)(v191, &_mh_execute_header, v192, "The original file extension was not playable and the correct extension could not be derived from mimeType %{public}s for episode uuid: %{public}s.", 146, 2, v195, v200);
    swift_bridgeObjectRelease(v195);
    v312 = 0;
    v313 = 0xE000000000000000;
    _StringGuts.grow(_:)(110);
    v201._countAndFlagsBits = 0xD00000000000006CLL;
    v201._object = (void *)0x80000001004402F0;
    String.append(_:)(v201);
    v202 = v285;
    v203 = objc_msgSend(v285, "URL");
    v123 = (uint64_t (*)(char *, uint64_t))v310;
    if (v203)
    {
      v204 = v203;
      v205 = v294;
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v203);

      v206 = 0;
      v168 = v308;
      v207 = v305;
    }
    else
    {
      v206 = 1;
      v168 = v308;
      v207 = v305;
      v205 = v294;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v307 + 56))(v205, v206, 1, v151);
    v208._countAndFlagsBits = String.init<A>(describing:)(v205, v207);
    v209 = v208._object;
    String.append(_:)(v208);
    swift_bridgeObjectRelease(v209);
    v210 = v312;
    v211 = v313;
    v212 = sub_100150A08();
    v213 = swift_allocError(&type metadata for PostflightError, v212, 0, 0);
    *v214 = v210;
    v214[1] = v211;
    v215 = (uint64_t)v295;
    *v295 = v213;
    swift_storeEnumTagMultiPayload(v215, v284, 1);
    sub_10037B898(v215);

    sub_100007A28(v215, &qword_100564EA0);
LABEL_34:
    v180 = v168;
    v181 = v151;
    return v123(v180, v181);
  }
  v145 = v296;
  v146 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v103 + 32))(v296, v101, v102);
  v147 = UTType.preferredFilenameExtension.getter(v146);
  if (!v148)
  {
    v106 = (*(uint64_t (**)(char *, uint64_t))(v103 + 8))(v145, v102);
    goto LABEL_28;
  }
  v149 = (char *)v147;
  v150 = v148;
  if (v147 == v281 && v148 == v282
    || (_stringCompareWithSmolCheck(_:_:expecting:)(v147, v148, v281, v282, 0) & 1) != 0)
  {
    v151 = v275;
    swift_bridgeObjectRelease(v150);
    v153 = static os_log_type_t.error.getter(v152);
    v154 = (void *)static OS_os_log.downloads.getter(v153);
    v155 = sub_10003F544(&qword_1005559A0);
    v156 = swift_allocObject(v155, 112, 7);
    *(_OWORD *)(v156 + 16) = xmmword_1003CA220;
    *(_QWORD *)(v156 + 56) = &type metadata for String;
    v157 = sub_10003E198();
    v158 = v302;
    *(_QWORD *)(v156 + 32) = v301;
    *(_QWORD *)(v156 + 40) = v158;
    v160 = *(_QWORD *)(v280 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_episodeUuid);
    v159 = *(_QWORD *)(v280 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_episodeUuid + 8);
    *(_QWORD *)(v156 + 96) = &type metadata for String;
    *(_QWORD *)(v156 + 104) = v157;
    *(_QWORD *)(v156 + 64) = v157;
    *(_QWORD *)(v156 + 72) = v160;
    *(_QWORD *)(v156 + 80) = v159;
    *(_QWORD *)&v161 = swift_bridgeObjectRetain(v159).n128_u64[0];
    os_log(_:dso:log:_:_:)(v153, &_mh_execute_header, v154, "The original file extension was not playable and mimeType %{public}s resolved to the same extension for episode uuid: %{public}s.", 129, 2, v156, v161);

    swift_bridgeObjectRelease(v156);
    v312 = 0;
    v313 = 0xE000000000000000;
    _StringGuts.grow(_:)(58);
    v162._countAndFlagsBits = 0xD000000000000038;
    v162._object = (void *)0x80000001004404D0;
    String.append(_:)(v162);
    v163 = v285;
    v164 = objc_msgSend(v285, "URL");
    if (v164)
    {
      v165 = v164;
      v166 = v293;
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v164);

      v167 = 0;
      v168 = v308;
      v123 = (uint64_t (*)(char *, uint64_t))v310;
      v169 = v277;
      v170 = v305;
      v171 = v296;
    }
    else
    {
      v167 = 1;
      v168 = v308;
      v123 = (uint64_t (*)(char *, uint64_t))v310;
      v169 = v277;
      v170 = v305;
      v171 = v296;
      v166 = v293;
    }
    v216 = v292;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v307 + 56))(v166, v167, 1, v151);
    v217._countAndFlagsBits = String.init<A>(describing:)(v166, v170);
    v218 = v217._object;
    String.append(_:)(v217);
    swift_bridgeObjectRelease(v218);
    v219 = v312;
    v220 = v313;
    v221 = sub_100150A08();
    v222 = swift_allocError(&type metadata for PostflightError, v221, 0, 0);
    *v223 = v219;
    v223[1] = v220;
    *v216 = v222;
    swift_storeEnumTagMultiPayload(v216, v284, 1);
    sub_10037B898((uint64_t)v216);

    sub_100007A28((uint64_t)v216, &qword_100564EA0);
    (*(void (**)(char *, uint64_t))(v303 + 8))(v171, v304);
    goto LABEL_34;
  }
  v224 = v275;
  v225 = v286;
  v286(v26, v287, v275);
  v226 = v291;
  URL.appendingPathExtension(_:)(v149, v150);
  v310(v26, v224);
  v225(v26, v287, v224);
  v300 = v55;
  v299 = v149;
  v227 = v306;
  v225(v306, (uint64_t)v226, v224);
  v228 = v278;
  v229 = (char *)objc_allocWithZone(v278);
  v230 = &v229[OBJC_IVAR____TtC8Podcasts17MoveFileOperation_input];
  *(_QWORD *)v230 = 0;
  v230[8] = 2;
  v225(&v229[OBJC_IVAR____TtC8Podcasts17MoveFileOperation_destination], (uint64_t)v227, v224);
  v225(&v229[OBJC_IVAR____TtC8Podcasts17MoveFileOperation_source], (uint64_t)v26, v224);
  v231 = v229;
  *(_QWORD *)&v231[OBJC_IVAR____TtC8Podcasts17MoveFileOperation_log] = static OS_os_log.default.getter(v231);

  v311.receiver = v231;
  v311.super_class = v228;
  v232 = (int *)objc_msgSendSuper2(&v311, "init");
  v233 = v310;
  v310(v227, v224);
  v234 = v26;
  v235 = v233;
  v233(v234, v224);
  sub_10027CF04();
  v236 = v287;
  v237 = swift_beginAccess(v287, &v312, 33, 0);
  v300(v236, v291, v224, v237);
  swift_endAccess(&v312);
  v238 = objc_allocWithZone((Class)AVURLAsset);
  URL._bridgeToObjectiveC()(v239);
  v241 = v240;
  v242 = objc_msgSend(v238, "initWithURL:options:", v240, 0);

  if ((objc_msgSend(v242, "isPlayable") & 1) != 0)
  {
    v243 = swift_bridgeObjectRelease(v302);
    v244 = v283;
    ((void (*)(char *, uint64_t, uint64_t, __n128))v286)((char *)v283 + v309[5], v287, v224, v243);
    *v244 = v299;
    v244[1] = v150;
    v245 = v288;
    sub_10037D56C((uint64_t)v244, (uint64_t)v288);
    swift_storeEnumTagMultiPayload(v245, v284, 0);
    sub_10037B898((uint64_t)v245);

    sub_100007A28((uint64_t)v245, &qword_100564EA0);
    sub_10037D5B0((uint64_t)v244);
    v235(v291, v224);
    (*(void (**)(char *, uint64_t))(v103 + 8))(v296, v102);
    v246 = v308;
  }
  else
  {
    v309 = v232;
    swift_bridgeObjectRelease(v150);
    v248 = static os_log_type_t.error.getter(v247);
    v249 = (void *)static OS_os_log.downloads.getter(v248);
    v250 = sub_10003F544(&qword_1005559A0);
    v251 = swift_allocObject(v250, 112, 7);
    *(_OWORD *)(v251 + 16) = xmmword_1003CA220;
    *(_QWORD *)(v251 + 56) = &type metadata for String;
    v252 = sub_10003E198();
    v253 = v302;
    *(_QWORD *)(v251 + 32) = v301;
    *(_QWORD *)(v251 + 40) = v253;
    v255 = *(_QWORD *)(v280 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_episodeUuid);
    v254 = *(_QWORD *)(v280 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_episodeUuid + 8);
    *(_QWORD *)(v251 + 96) = &type metadata for String;
    *(_QWORD *)(v251 + 104) = v252;
    *(_QWORD *)(v251 + 64) = v252;
    *(_QWORD *)(v251 + 72) = v255;
    *(_QWORD *)(v251 + 80) = v254;
    *(_QWORD *)&v256 = swift_bridgeObjectRetain(v254).n128_u64[0];
    os_log(_:dso:log:_:_:)(v248, &_mh_execute_header, v249, "The original file extension was not playable and the resolved file extension was not playable for episode uuid: %{public}s.", 123, 2, v251, v256);

    swift_bridgeObjectRelease(v251);
    v312 = 0;
    v313 = 0xE000000000000000;
    _StringGuts.grow(_:)(82);
    v257._countAndFlagsBits = 0xD000000000000050;
    v257._object = (void *)0x80000001004403E0;
    String.append(_:)(v257);
    v258 = v285;
    v259 = objc_msgSend(v285, "URL");
    if (v259)
    {
      v260 = v259;
      v261 = v290;
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v259);

      v262 = 0;
      v263 = v308;
      v264 = v277;
      v265 = v296;
    }
    else
    {
      v262 = 1;
      v263 = v308;
      v264 = v277;
      v265 = v296;
      v261 = v290;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v307 + 56))(v261, v262, 1, v224);
    v266._countAndFlagsBits = String.init<A>(describing:)(v261, v305);
    v267 = v266._object;
    String.append(_:)(v266);
    swift_bridgeObjectRelease(v267);
    v268 = v312;
    v269 = v313;
    v270 = sub_100150A08();
    v271 = swift_allocError(&type metadata for PostflightError, v270, 0, 0);
    *v272 = v268;
    v272[1] = v269;
    v273 = (uint64_t)v289;
    *v289 = v271;
    swift_storeEnumTagMultiPayload(v273, v284, 1);
    sub_10037B898(v273);

    sub_100007A28(v273, &qword_100564EA0);
    v235(v291, v224);
    (*(void (**)(char *, uint64_t))(v303 + 8))(v265, v304);
    v246 = v263;
  }
  return ((uint64_t (*)(char *, uint64_t))v235)(v246, v224);
}

void sub_10037D304()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);

  sub_10003A858(*(_QWORD *)(v0 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_input), *(_BYTE *)(v0 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_input + 8));
  v1 = v0 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_source;
  v2 = type metadata accessor for URL(0);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_origin, v2);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_originalExtension + 8));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_episodeUuid + 8));
}

uint64_t sub_10037D480()
{
  return type metadata accessor for ValidateOperation(0);
}

uint64_t type metadata accessor for ValidateOperation(uint64_t a1)
{
  return sub_10003EAF4(a1, (uint64_t *)&unk_100566F08, (uint64_t)&nominal type descriptor for ValidateOperation);
}

uint64_t sub_10037D49C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;

  v4 = "\t";
  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v5 = *(_QWORD *)(result - 8) + 64;
    v6 = v5;
    v7 = &unk_1003D7900;
    v8 = &unk_1003D7918;
    v9 = &unk_1003D7900;
    v10 = (char *)&value witness table for Builtin.UnknownObject + 64;
    result = swift_updateClassMetadata2(a1, 256, 7, &v4, a1 + 368);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_10037D538@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = v1 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_input;
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8Podcasts17ValidateOperation_input);
  *(_QWORD *)a1 = v3;
  v4 = *(_BYTE *)(v2 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  return sub_10003A8DC(v3, v4);
}

uint64_t type metadata accessor for ValidateOperation.Result(uint64_t a1)
{
  return sub_10003EAF4(a1, qword_100566FB0, (uint64_t)&nominal type descriptor for ValidateOperation.Result);
}

uint64_t sub_10037D56C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ValidateOperation.Result(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10037D5B0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ValidateOperation.Result(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10037D5EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10003F544(&qword_100564EA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_10037D634(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v11);
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = type metadata accessor for URL(0);
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain(v5);
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_10037D6D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  v4 = a1 + *(int *)(a2 + 20);
  v5 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_10037D718(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = type metadata accessor for URL(0);
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain(v4);
  v9(v6, v7, v8);
  return a1;
}

_QWORD *sub_10037D788(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  return a1;
}

_OWORD *sub_10037D804(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_10037D860(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = a2[1];
  v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_10037D8CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10037D8D8);
}

uint64_t sub_10037D8D8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for URL(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_10037D954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10037D960);
}

uint64_t sub_10037D960(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for URL(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_10037D9D4(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = &unk_1003D7900;
  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
    return 0;
  }
  return result;
}

void sub_10037DA48()
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
  _QWORD *v24;
  uint64_t v25;
  void (*v26)(__n128);
  __n128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[14];
  uint64_t v33;
  _BYTE v34[32];

  v1 = type metadata accessor for ShowOffer(0);
  v32[8] = *(_QWORD *)(v1 - 8);
  v32[9] = v1;
  __chkstk_darwin(v1);
  v32[7] = (char *)v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for EpisodeOffer(0);
  __chkstk_darwin(v3);
  v4 = sub_10003F544((uint64_t *)&unk_100553DC0);
  v5 = __chkstk_darwin(v4);
  v32[3] = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v5);
  v32[11] = (char *)v32 - v8;
  __chkstk_darwin(v7);
  v9 = type metadata accessor for URL(0);
  v32[12] = *(_QWORD *)(v9 - 8);
  v32[13] = v9;
  v10 = __chkstk_darwin(v9);
  v32[2] = (char *)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v10);
  v32[6] = (char *)v32 - v13;
  v14 = __chkstk_darwin(v12);
  v32[4] = (char *)v32 - v15;
  __chkstk_darwin(v14);
  v32[5] = (char *)v32 - v16;
  v17 = type metadata accessor for PreviewingPresentationHint(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v32[10] = (char *)v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_10003F544(qword_1005542D8);
  __chkstk_darwin(v20);
  v22 = (char *)v32 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(v0 + 16))
  {
    v33 = *(_QWORD *)(v0 + 16);
    swift_beginAccess(v0 + 24, v34, 0, 0);
    v23 = v33;
    v24 = *(_QWORD **)(v0 + 24);
    if (v24)
    {
      v32[0] = v18;
      v32[1] = v17;
      v25 = v24[2];
      v26 = *(void (**)(__n128))(*v24 + 120);
      swift_retain();
      swift_retain();
      v27 = swift_retain();
      v26(v27);
      swift_release(v24);
      v28 = type metadata accessor for PresentationSource(0);
      v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 48))(v22, 1, v28);
      if ((_DWORD)v29)
      {
        swift_release(v23);
        swift_release(v25);
        sub_100007A28((uint64_t)v22, qword_1005542D8);
      }
      else
      {
        v30 = v25;
        v31 = PresentationSource.viewController.getter(v29);
        sub_100007A28((uint64_t)v22, qword_1005542D8);
        if (v31)
          __asm { BR              X9 }
        swift_release(v33);
        swift_release(v30);
      }
    }
  }
}

uint64_t sub_10037E588()
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
  void (*v10)(__n128);
  __n128 v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t result;
  uint64_t v16;
  _BYTE v18[24];

  v1 = v0;
  v2 = type metadata accessor for InteractionContext.Page(0);
  __chkstk_darwin(v2);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v5 = type metadata accessor for InteractionContext(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  swift_beginAccess(v0 + 24, v18, 0, 0);
  v9 = *(_QWORD *)(v0 + 24);
  if (!v9)
  {
    v16 = *(_QWORD *)(v1 + 16);
    if (!v16)
      return 0;
LABEL_6:
    __asm { BR              X10 }
  }
  v10 = *(void (**)(__n128))(*(_QWORD *)v9 + 168);
  v11 = swift_retain();
  v10(v11);
  v12 = swift_release(v9);
  InteractionContext.page.getter(v12);
  v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v14 = InteractionContext.Page.isShowPage.getter(v13);
  sub_10017603C((uint64_t)v4);
  result = 0;
  v16 = *(_QWORD *)(v1 + 16);
  if (v16 && (v14 & 1) == 0)
    goto LABEL_6;
  return result;
}

uint64_t sub_10037E794()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;

  swift_release(v0[2]);
  swift_release(v0[3]);
  sub_10003D380(v0 + 4);
  v1 = (char *)v0 + OBJC_IVAR____TtC8Podcasts34EpisodePresentPodcastContextAction_metricsLabel;
  v2 = type metadata accessor for MetricsLabel(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48), *(unsigned __int16 *)(*v0 + 52));
}

uint64_t sub_10037E7FC()
{
  return type metadata accessor for EpisodePresentPodcastContextAction(0);
}

uint64_t type metadata accessor for EpisodePresentPodcastContextAction(uint64_t a1)
{
  uint64_t result;

  result = qword_100567010;
  if (!qword_100567010)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for EpisodePresentPodcastContextAction);
  return result;
}

uint64_t sub_10037E840(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[4];

  v4[0] = "\b";
  v4[1] = "\b";
  v4[2] = &unk_1003D79D0;
  result = type metadata accessor for MetricsLabel(319);
  if (v3 <= 0x3F)
  {
    v4[3] = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 4, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_10037E8C4()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  uint64_t countAndFlagsBits;
  Swift::String v5;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v5._object = (void *)0x80000001004355F0;
  v1._countAndFlagsBits = 0x6853206F74206F47;
  v1._object = (void *)0xEA0000000000776FLL;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v5._countAndFlagsBits = 0xD000000000000021;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v5)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_10037E970@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC8Podcasts34EpisodePresentPodcastContextAction_metricsLabel;
  v4 = type metadata accessor for MetricsLabel(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_10037E9B4()
{
  return 6;
}

__n128 initializeWithCopy for CarPlayDeviceInfo(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CarPlayDeviceInfo(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CarPlayDeviceInfo(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CarPlayDeviceInfo()
{
  return &type metadata for CarPlayDeviceInfo;
}

uint64_t sub_10037EA3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  __n128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned __int8 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  char *v77;
  unint64_t v78;
  void (*v79)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97[2];
  id v98[2];

  v95 = a4;
  v96 = a5;
  v74 = a3;
  v94 = a1;
  v7 = sub_10003F544(&qword_1005564A0);
  __chkstk_darwin(v7);
  v9 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10003F544((uint64_t *)&unk_100562040);
  v11 = *(_QWORD *)(v10 - 8);
  v82 = v10;
  v83 = v11;
  __chkstk_darwin(v10);
  v13 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_10003F544((uint64_t *)&unk_1005670B0);
  v15 = *(_QWORD *)(v14 - 8);
  v85 = v14;
  v86 = v15;
  __chkstk_darwin(v14);
  v77 = (char *)&v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_10003F544((uint64_t *)&unk_100562050);
  v18 = *(_QWORD *)(v17 - 8);
  v87 = v17;
  v88 = v18;
  __chkstk_darwin(v17);
  v84 = (char *)&v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_10003F544(&qword_1005670C0);
  v90 = *(_QWORD *)(v20 - 8);
  v91 = v20;
  __chkstk_darwin(v20);
  v76 = (char *)&v74 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_10003F544(&qword_1005670C8);
  v92 = *(_QWORD *)(v22 - 8);
  v93 = v22;
  __chkstk_darwin(v22);
  v89 = (char *)&v74 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v97[0] = sub_10037F1E4((double *)a2);
  v24 = sub_100005EC8(0, (unint64_t *)&qword_100555190, OS_dispatch_queue_ptr);
  v75 = v24;
  v98[0] = (id)static OS_dispatch_queue.uiAssetPreparationQueue.getter(v24);
  v80 = type metadata accessor for OS_dispatch_queue.SchedulerOptions(0);
  v79 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v80 - 8) + 56);
  v79(v9, 1, 1, v80);
  v25 = sub_10003F544((uint64_t *)&unk_100562080);
  v26 = sub_10002F9C8((unint64_t *)&unk_1005670D0, (uint64_t *)&unk_100562080, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v78 = sub_1000489AC();
  Publisher.receive<A>(on:options:)(v98, v9, v25, v24, v26, v78);
  sub_100007A28((uint64_t)v9, &qword_1005564A0);

  swift_release(*(_QWORD *)&v97[0]);
  sub_10000A520(a3, (uint64_t)v97);
  v27 = swift_allocObject(&unk_1004C6C40, 104, 7);
  v28 = sub_10002099C(v97, v27 + 16);
  v29 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v27 + 56) = *(_OWORD *)a2;
  *(_OWORD *)(v27 + 72) = v29;
  *(_OWORD *)(v27 + 88) = *(_OWORD *)(a2 + 32);
  v30 = static Subscribers.Demand.unlimited.getter(v28);
  v31 = sub_10003F544((uint64_t *)&unk_1005670E0);
  v32 = sub_10003F544((uint64_t *)&unk_100562090);
  v33 = sub_10002F9C8((unint64_t *)&unk_1005670F0, (uint64_t *)&unk_100562040, (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
  v34 = sub_10002F9C8((unint64_t *)&unk_1005620A0, (uint64_t *)&unk_100562090, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v35 = v77;
  v36 = v82;
  v37 = v32;
  v38 = v76;
  Publisher.flatMap<A, B>(maxPublishers:_:)(v30, sub_1002E5AF8, v27, v82, v31, v37, v33, v34);
  swift_release(v27);
  (*(void (**)(char *, uint64_t))(v83 + 8))(v13, v36);
  sub_10000A520(v74, (uint64_t)v97);
  v39 = swift_allocObject(&unk_1004C6C68, 104, 7);
  sub_10002099C(v97, v39 + 16);
  v40 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v39 + 56) = *(_OWORD *)a2;
  *(_OWORD *)(v39 + 72) = v40;
  *(_OWORD *)(v39 + 88) = *(_OWORD *)(a2 + 32);
  v41 = sub_10003F544((uint64_t *)&unk_100567100);
  v42 = sub_10002F9C8((unint64_t *)&unk_1005620B0, (uint64_t *)&unk_1005670B0, (uint64_t)&protocol conformance descriptor for Publishers.FlatMap<A, B>);
  v43 = sub_10002F9C8((unint64_t *)&unk_100567110, (uint64_t *)&unk_100567100, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v44 = v84;
  v45 = v85;
  v46 = v42;
  v47 = v81;
  Publisher.catch<A>(_:)(sub_1002E5B04, v39, v85, v41, v46, v43);
  swift_release(v39);
  v48.n128_f64[0] = (*(double (**)(char *, uint64_t))(v86 + 8))(v35, v45);
  v49 = v75;
  *(_QWORD *)&v97[0] = static OS_dispatch_queue.main.getter(v48);
  v79(v9, 1, 1, v80);
  v50 = sub_10002F9C8(&qword_1005620C0, (uint64_t *)&unk_100562050, (uint64_t)&protocol conformance descriptor for Publishers.Catch<A, B>);
  v51 = v87;
  Publisher.receive<A>(on:options:)(v97, v9, v87, v49, v50, v78);
  sub_100007A28((uint64_t)v9, &qword_1005564A0);

  (*(void (**)(char *, uint64_t))(v88 + 8))(v44, v51);
  v52 = objc_msgSend(v47, "title");
  if (v52)
  {
    v53 = v52;
    v54 = static String._unconditionallyBridgeFromObjectiveC(_:)(v52);
    v56 = v55;

  }
  else
  {
    v54 = 0;
    v56 = 0;
  }
  v57 = objc_msgSend(v47, "album", v74);
  if (v57)
  {
    v58 = v57;
    v59 = static String._unconditionallyBridgeFromObjectiveC(_:)(v57);
    v61 = v60;

  }
  else
  {
    v59 = 0;
    v61 = 0;
  }
  v62 = objc_msgSend(v47, "isExplicit");
  v63 = swift_allocObject(&unk_1004C6C90, 80, 7);
  *(_QWORD *)(v63 + 16) = v54;
  *(_QWORD *)(v63 + 24) = v56;
  *(_QWORD *)(v63 + 32) = v59;
  *(_QWORD *)(v63 + 40) = v61;
  *(_BYTE *)(v63 + 48) = v62;
  v64 = v95;
  v65 = v96;
  *(_QWORD *)(v63 + 56) = v94;
  *(_QWORD *)(v63 + 64) = v64;
  *(_QWORD *)(v63 + 72) = v65;
  v66 = sub_100005EC8(0, (unint64_t *)&qword_100559F60, CPListItem_ptr);
  v67 = sub_10002F9C8(&qword_1005620C8, &qword_1005670C0, (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
  swift_retain();
  v68 = v89;
  v69 = v91;
  Publisher.map<A>(_:)(sub_10037FBCC, v63, v91, v66, v67);
  swift_release(v63);
  (*(void (**)(char *, uint64_t))(v90 + 8))(v38, v69);
  v70 = sub_10002F9C8((unint64_t *)&unk_100567120, &qword_1005670C8, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
  v71 = v93;
  v72 = Publisher.eraseToAnyPublisher()(v93, v70);
  (*(void (**)(char *, uint64_t))(v92 + 8))(v68, v71);
  return v72;
}

id sub_10037F130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t v6;
  NSString v10;
  NSString v11;
  id v12;

  v6 = v5;
  if (!a2)
  {
    v10 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
LABEL_6:
  v12 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6)), "initWithText:detailText:image:", v10, v11, a5);

  return v12;
}

uint64_t sub_10037F1E4(double *a1)
{
  void *v1;
  void *v2;
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
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  char *v44;
  char *v45;
  double *v46;
  char *v47;
  uint64_t v48;
  id v49;
  void *v50;
  void (*v51)(char *, char *, uint64_t);
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  uint64_t v63;
  char *v64;
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
  char *v78;
  void (*v79)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v87;
  int v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  char *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  double *v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  _OWORD v103[5];

  v2 = v1;
  v98 = a1;
  v3 = sub_10003F544((uint64_t *)&unk_100562130);
  v4 = *(_QWORD *)(v3 - 8);
  v95 = v3;
  v96 = v4;
  __chkstk_darwin(v3);
  v97 = (char *)&v89 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ArtworkCrop(0);
  __chkstk_darwin(v6);
  v90 = (char *)&v89 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = type metadata accessor for ArtworkModel(0);
  __chkstk_darwin(v102);
  v92 = (char *)&v89 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = sub_10003F544(&qword_100567170);
  v94 = *(_QWORD *)(v91 - 8);
  __chkstk_darwin(v91);
  v93 = (char *)&v89 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10003F544(&qword_100562140);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v89 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_10003F544((uint64_t *)&unk_100553DC0);
  __chkstk_darwin(v14);
  v16 = (char *)&v89 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for URL(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = __chkstk_darwin(v17);
  v21 = (char *)&v89 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v23 = (char *)&v89 - v22;
  v24 = sub_10003F544(&qword_100567178);
  v100 = *(char **)(v24 - 8);
  v101 = v24;
  __chkstk_darwin(v24);
  v99 = (char *)&v89 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = v2;
  v27 = objc_msgSend(v2, "podcastUuid");
  if (v27)
  {
    v28 = v27;
    v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
    v31 = v30;

    v32 = objc_msgSend((id)objc_opt_self(MTDB), "sharedInstance");
    v33 = objc_msgSend(v32, "mainQueueContext");

    v34 = swift_allocObject(&unk_1004C6D08, 32, 7);
    *(_QWORD *)(v34 + 16) = v29;
    *(_QWORD *)(v34 + 24) = v31;
    v35 = sub_10003F544(&qword_10055D840);
    v36 = NSManagedObjectContext.performAndPublish<A>(_:)(sub_1002F35C4, v34, v35);

    swift_release(v34);
    *(_QWORD *)&v103[0] = v36;
    v37 = sub_10003F544((uint64_t *)&unk_100567180);
    v38 = sub_10002F9C8((unint64_t *)&unk_100562B90, (uint64_t *)&unk_100567180, (uint64_t)&protocol conformance descriptor for Future<A, B>);
    v39 = v99;
    Publisher.compactMap<A>(_:)(sub_1002FB8B0, 0, v37, v102, v38);
    swift_release(v36);
    v40 = sub_10002F9C8((unint64_t *)&unk_100567190, &qword_100567178, (uint64_t)&protocol conformance descriptor for Publishers.CompactMap<A, B>);
    v41 = v101;
    v42 = Publisher.eraseToAnyPublisher()(v101, v40);
    v43 = (void (*)(char *, uint64_t))*((_QWORD *)v100 + 1);
    v44 = v39;
LABEL_8:
    v43(v44, v41);
    return v42;
  }
  v45 = v23;
  v100 = v13;
  v101 = v11;
  v99 = (char *)v10;
  v47 = v97;
  v46 = v98;
  v48 = v102;
  v49 = objc_msgSend(v26, "artworkUrl");
  if (!v49)
  {
    v79 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v55 = (uint64_t)v16;
    v79(v16, 1, 1, v17);
    goto LABEL_7;
  }
  v50 = v49;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v49);

  v51 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
  v52 = v21;
  v53 = v17;
  v54 = v18;
  v55 = (uint64_t)v16;
  v51(v16, v52, v53);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v54 + 56))(v16, 0, 1, v53);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48))(v16, 1, v53) == 1)
  {
LABEL_7:
    sub_100007A28(v55, (uint64_t *)&unk_100553DC0);
    v80 = type metadata accessor for LibraryImageProviderError(0);
    v81 = sub_1002E5BA4();
    v82 = swift_allocError(v80, v81, 0, 0);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v80 - 8) + 104))(v83, enum case for LibraryImageProviderError.failedToPrepareImage(_:), v80);
    *(_QWORD *)&v103[0] = v82;
    v84 = sub_10003F544((uint64_t *)&unk_10055A340);
    Fail.init(error:)(v103, v48, v84, &protocol self-conformance witness table for Error);
    v85 = sub_10002F9C8(&qword_100562158, (uint64_t *)&unk_100562130, (uint64_t)&protocol conformance descriptor for Fail<A, B>);
    v41 = v95;
    v42 = Publisher.eraseToAnyPublisher()(v95, v85);
    v43 = *(void (**)(char *, uint64_t))(v96 + 8);
    v44 = v47;
    goto LABEL_8;
  }
  v56 = v45;
  v57 = ((uint64_t (*)(char *, char *, uint64_t))v51)(v45, v16, v53);
  v58 = URL.path.getter(v57);
  v60 = v59;
  v61 = *v46;
  v62 = v46[1];
  v103[0] = xmmword_1003D55A0;
  memset(&v103[1], 0, 41);
  v63 = v54;
  v64 = v90;
  v71 = static ArtworkCrop.boundingBox.getter(v58, v59, v65, v66, v67, v68, v69, v70);
  BYTE2(v88) = 0;
  LOWORD(v88) = static ArtworkFormat.preferredFormat.getter(v71);
  v87 = v64;
  v72 = v92;
  ArtworkModel.init(template:width:height:libraryEntity:backgroundColor:textColors:style:crop:accessibilityTitle:format:isCustomSymbol:isMulticolorSymbol:imageStoreIdentifier:)(v58, v60, 0, 0, 255, 0, 255, v103, v61, v62, 3, v87, 0, 0, v88, 0, 0);
  v73 = v93;
  Just.init(_:)(v72, v48);
  v74 = sub_10003F544((uint64_t *)&unk_10055A340);
  v75 = v100;
  v76 = v91;
  Just.setFailureType<A>(to:)(v74, v91, v74, &protocol self-conformance witness table for Error);
  (*(void (**)(char *, uint64_t))(v94 + 8))(v73, v76);
  v77 = sub_10002F9C8((unint64_t *)&unk_100562160, &qword_100562140, (uint64_t)&protocol conformance descriptor for Result<A, B>.Publisher);
  v78 = v99;
  v42 = Publisher.eraseToAnyPublisher()(v99, v77);
  (*(void (**)(char *, char *))(v101 + 8))(v75, v78);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v56, v53);
  return v42;
}

uint64_t sub_10037F890()
{
  uint64_t v0;

  sub_10003D380((_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 104, 7);
}

void sub_10037F8B4(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void **a9@<X8>, uint64_t a10)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void *v22;
  id v23;
  id v24;
  void **v25;
  _BYTE *v26;
  uint64_t v27;
  void *v28;
  _BYTE *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void **v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD aBlock[5];
  uint64_t v43;

  v39 = a7;
  v38 = a6;
  v37 = a9;
  v40 = a10;
  v41 = a8;
  v15 = sub_10003F544((uint64_t *)&unk_100555310);
  __chkstk_darwin(v15);
  v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for CarPlayTemplateInfo.TemplateType(0);
  v19 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v21 = (char *)&v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = *a1;
  sub_100005EC8(0, (unint64_t *)&qword_100559F60, CPListItem_ptr);
  v23 = v22;
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(a5);
  v24 = sub_10037F130(a2, a3, a4, a5, v22);
  v25 = v37;
  *v37 = v24;
  objc_msgSend(v24, "setExplicitContent:", v38 & 1);
  *(_QWORD *)v21 = v39;
  v21[8] = 1;
  swift_storeEnumTagMultiPayload(v21, v18, 2);
  v26 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CarPlayTemplateInfo(0)), "init");
  sub_10017FE20((uint64_t)v21, (uint64_t)v17);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v17, 0, 1, v18);
  v27 = (uint64_t)&v26[OBJC_IVAR____TtC8Podcasts19CarPlayTemplateInfo_type];
  swift_beginAccess(&v26[OBJC_IVAR____TtC8Podcasts19CarPlayTemplateInfo_type], aBlock, 33, 0);
  sub_10017FE64((uint64_t)v17, v27);
  swift_endAccess(aBlock);
  v26[OBJC_IVAR____TtC8Podcasts19CarPlayTemplateInfo_playbackSource] = 9;
  sub_100005EC8(0, &qword_100554ED0, NSString_ptr);
  v28 = (void *)NSString.init(stringLiteral:)("templateInfo", 12, 2);
  v29 = v26;
  sub_10017FF38((uint64_t)v28, (uint64_t)v26);

  v30 = *v25;
  v31 = swift_allocObject(&unk_1004C6CB8, 32, 7);
  v32 = v40;
  *(_QWORD *)(v31 + 16) = v41;
  *(_QWORD *)(v31 + 24) = v32;
  aBlock[4] = sub_10017FF60;
  v43 = v31;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10017FEAC;
  aBlock[3] = &unk_1004C6CD0;
  v33 = _Block_copy(aBlock);
  v34 = v43;
  v35 = v30;
  swift_retain();
  swift_release(v34);
  objc_msgSend(v35, "setHandler:", v33);
  _Block_release(v33);

}

uint64_t sub_10037FB98()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[3]);
  swift_bridgeObjectRelease(v0[5]);
  swift_release(v0[9]);
  return swift_deallocObject(v0, 80, 7);
}

void sub_10037FBCC(void **a1@<X0>, void **a2@<X8>)
{
  uint64_t v2;

  sub_10037F8B4(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(unsigned __int8 *)(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 64), a2, *(_QWORD *)(v2 + 72));
}

uint64_t sub_10037FC00()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10037FC24()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC8PodcastsP33_F6D5C82A1EAC8EE8094292EEB021E60619ResourceBundleClass);
}

void sub_10037FC6C()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "AFAnalytics");
  AppDependency.wrappedValue.getter(v0);
}

id objc_msgSend_AND_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "AND:");
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGSizeValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGSizeValue");
}

id objc_msgSend_DSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "DSID");
}

id objc_msgSend_DSIDText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "DSIDText");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_MZDataByDeflatingWithGZip(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MZDataByDeflatingWithGZip");
}

id objc_msgSend_MZDataByInflatingWithGZip(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MZDataByInflatingWithGZip");
}

id objc_msgSend_MZStringByMD5HashingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MZStringByMD5HashingString:");
}

id objc_msgSend_MZStringFromDigestData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MZStringFromDigestData:");
}

id objc_msgSend_OR_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "OR:");
}

id objc_msgSend_PlayerNotification_JumpDurationDidChange_String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "PlayerNotification_JumpDurationDidChange_String");
}

id objc_msgSend_UPPDisabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UPPDisabled");
}

id objc_msgSend_UPPDomainVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UPPDomainVersion");
}

id objc_msgSend_UPPEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UPPEnabled");
}

id objc_msgSend_UPPStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UPPStore");
}

id objc_msgSend_URI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URI");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByDeletingPathExtension");
}

id objc_msgSend_URLByStandardizingPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByStandardizingPath");
}

id objc_msgSend_URLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForKey:");
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLQueryAllowedCharacterSet");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_URLsForDirectory_inDomains_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLsForDirectory:inDomains:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UTIByExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTIByExtension:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend___queryStringToQueryDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__queryStringToQueryDictionary:");
}

id objc_msgSend___stringByRemovingPercentEscapes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__stringByRemovingPercentEscapes:");
}

id objc_msgSend___stringWithPercentEscape_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__stringWithPercentEscape:");
}

id objc_msgSend__accountForSyncing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accountForSyncing");
}

id objc_msgSend__actionButtonDisplayTitleForActionTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actionButtonDisplayTitleForActionTitle:");
}

id objc_msgSend__activeAccountBlocking(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activeAccountBlocking");
}

id objc_msgSend__activityRestorationPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activityRestorationPath");
}

id objc_msgSend__addDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addDictionary:");
}

id objc_msgSend__addEpisode_toMyEpisodesInPodcast_persist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addEpisode:toMyEpisodesInPodcast:persist:");
}

id objc_msgSend__addEpisodeInCtx_mediaItem_episodeCache_podcastUuid_isRestoreDownloadCandidate_canSendNotifications_outEpisodeUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addEpisodeInCtx:mediaItem:episodeCache:podcastUuid:isRestoreDownloadCandidate:canSendNotifications:outEpisodeUUID:");
}

id objc_msgSend__addLatestSeasonForSerialPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addLatestSeasonForSerialPodcast:");
}

id objc_msgSend__addLatestSeasonToPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addLatestSeasonToPodcast:");
}

id objc_msgSend__addNewestEpisodeToPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addNewestEpisodeToPodcast:");
}

id objc_msgSend__addPendingFeedProcessingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addPendingFeedProcessingBlock:");
}

id objc_msgSend__addPendingTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addPendingTransaction:");
}

id objc_msgSend__addSetting_syncObj_playlist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addSetting:syncObj:playlist:");
}

id objc_msgSend__addedSubscriptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addedSubscriptions");
}

id objc_msgSend__alertControllerForClearingOrKeepingUpNextWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_alertControllerForClearingOrKeepingUpNextWithRequest:");
}

id objc_msgSend__allEligiblePodcastsForPlaylistInCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allEligiblePodcastsForPlaylistInCtx:");
}

id objc_msgSend__appendDeferredWorkBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendDeferredWorkBlock:");
}

id objc_msgSend__applePodcastsFoundationSettingsUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applePodcastsFoundationSettingsUserDefaults");
}

id objc_msgSend__applePodcastsFoundationSharedUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applePodcastsFoundationSharedUserDefaults");
}

id objc_msgSend__appliedInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appliedInsets");
}

id objc_msgSend__applyBackdropViewSettings_includeTints_includeBlur_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyBackdropViewSettings:includeTints:includeBlur:");
}

id objc_msgSend__artworkSizeDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_artworkSizeDidChange");
}

id objc_msgSend__artworkView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_artworkView");
}

id objc_msgSend__asyncFetchArtworkDidLoadImage_forArtworkKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_asyncFetchArtworkDidLoadImage:forArtworkKey:");
}

id objc_msgSend__augmentPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_augmentPredicate:");
}

id objc_msgSend__authenticationCanProcessTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_authenticationCanProcessTransaction:error:");
}

id objc_msgSend__automaticallySynchronizeLocalChangesOnResignActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_automaticallySynchronizeLocalChangesOnResignActive");
}

id objc_msgSend__automaticallySynchronizeOnBecomeActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_automaticallySynchronizeOnBecomeActive");
}

id objc_msgSend__backgroundFetchInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_backgroundFetchInterval");
}

id objc_msgSend__baselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_baselineOffsetFromBottom");
}

id objc_msgSend__beginBackgroundTask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_beginBackgroundTask");
}

id objc_msgSend__beginGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_beginGeneratingLibraryChangeNotifications");
}

id objc_msgSend__blurredArtworkForArtwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_blurredArtworkForArtwork:");
}

id objc_msgSend__boundsRelativeHitRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_boundsRelativeHitRect");
}

id objc_msgSend__buildMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildMap");
}

id objc_msgSend__canScheduleTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canScheduleTransaction:error:");
}

id objc_msgSend__canScheduleTransactionBasedOfNetworkingBlocked_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canScheduleTransactionBasedOfNetworkingBlocked:error:");
}

id objc_msgSend__canScheduleTransactionBasedOnBackOff_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canScheduleTransactionBasedOnBackOff:error:");
}

id objc_msgSend__canScheduleTransactionBasedOnDSIDCheck_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canScheduleTransactionBasedOnDSIDCheck:error:");
}

id objc_msgSend__canScheduleTransactionBasedOnType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canScheduleTransactionBasedOnType:error:");
}

id objc_msgSend__canScheduleTransactionBasedOnUserCancelledSignIn_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canScheduleTransactionBasedOnUserCancelledSignIn:error:");
}

id objc_msgSend__canShowInApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canShowInApp");
}

id objc_msgSend__cancelAllPendingTransactions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelAllPendingTransactions:");
}

id objc_msgSend__cancelTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelTransaction:error:");
}

id objc_msgSend__changeContainsRelevantChannelChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_changeContainsRelevantChannelChanges:");
}

id objc_msgSend__changeContainsRelevantEpisodeChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_changeContainsRelevantEpisodeChanges:");
}

id objc_msgSend__changeContainsRelevantPodcastChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_changeContainsRelevantPodcastChanges:");
}

id objc_msgSend__chevronFrameForViewSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_chevronFrameForViewSize:");
}

id objc_msgSend__chevronSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_chevronSize");
}

id objc_msgSend__clampsCanScheduleTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clampsCanScheduleTransaction:error:");
}

id objc_msgSend__classesForTransactionClampsValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_classesForTransactionClampsValues");
}

id objc_msgSend__clearAndHideArtworkView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearAndHideArtworkView");
}

id objc_msgSend__clearCellEmphasis(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearCellEmphasis");
}

id objc_msgSend__commandEventIsFromSiri_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_commandEventIsFromSiri:");
}

id objc_msgSend__commandEventIsInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_commandEventIsInternal:");
}

id objc_msgSend__compareServerEpisode_toLocalEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_compareServerEpisode:toLocalEpisode:");
}

id objc_msgSend__configureEmphasisForCell_indexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureEmphasisForCell:indexPath:animated:");
}

id objc_msgSend__configureEmphasisForCellAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureEmphasisForCellAtIndexPath:animated:");
}

id objc_msgSend__contentGUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentGUID");
}

id objc_msgSend__contentScrollInset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentScrollInset");
}

id objc_msgSend__contentViewLayoutRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentViewLayoutRect");
}

id objc_msgSend__countFrameForViewSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_countFrameForViewSize:");
}

id objc_msgSend__countSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_countSize");
}

id objc_msgSend__createLabelTextForCurrentState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createLabelTextForCurrentState");
}

id objc_msgSend__currentDescriptionColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentDescriptionColor");
}

id objc_msgSend__currentEpisodeForManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentEpisodeForManifest:");
}

id objc_msgSend__currentEpisodeForPodcastGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentEpisodeForPodcastGroup:");
}

id objc_msgSend__currentEpisodeUuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentEpisodeUuid");
}

id objc_msgSend__currentStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentStatus");
}

id objc_msgSend__currentTitleColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentTitleColor");
}

id objc_msgSend__currentTitleFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentTitleFont");
}

id objc_msgSend__currentTransactionDidFinish(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentTransactionDidFinish");
}

id objc_msgSend__currentUpNextIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentUpNextIndex");
}

id objc_msgSend__data(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_data");
}

id objc_msgSend__dataSourceCancelTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dataSourceCancelTransaction");
}

id objc_msgSend__defaultSelectionStyleForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_defaultSelectionStyleForSetting:");
}

id objc_msgSend__defaultsChanged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_defaultsChanged");
}

id objc_msgSend__delegateOperationDidFinish(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_delegateOperationDidFinish");
}

id objc_msgSend__delegateShouldScheduleTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_delegateShouldScheduleTransaction:error:");
}

id objc_msgSend__delegateTransactionDidFail_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_delegateTransactionDidFail:withError:");
}

id objc_msgSend__delegateTransactionDidFinish_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_delegateTransactionDidFinish:");
}

id objc_msgSend__deleteEpisodeUuids_forced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteEpisodeUuids:forced:");
}

id objc_msgSend__deleteEpisodes_forced_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteEpisodes:forced:ctx:");
}

id objc_msgSend__deleteFromRecentlyUnfollowedForPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteFromRecentlyUnfollowedForPredicate:");
}

id objc_msgSend__deletePodcastForPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deletePodcastForPredicate:");
}

id objc_msgSend__deleteSpotlightIdentifierForPlaylist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteSpotlightIdentifierForPlaylist:");
}

id objc_msgSend__deleteSpotlightIdentifiersForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteSpotlightIdentifiersForPodcast:");
}

id objc_msgSend__dequeueAllDeferredWorkBlocks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dequeueAllDeferredWorkBlocks");
}

id objc_msgSend__descriptionHTMLForDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_descriptionHTMLForDataSource:");
}

id objc_msgSend__destinationForRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_destinationForRequest:completion:");
}

id objc_msgSend__determineManifest_scalledIndex_forIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_determineManifest:scalledIndex:forIndex:");
}

id objc_msgSend__dictionaryForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dictionaryForPodcastUuid:");
}

id objc_msgSend__didCompleteBatchProcessingBatchGenerator_state_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didCompleteBatchProcessingBatchGenerator:state:error:");
}

id objc_msgSend__didFinishUpdatingFeedUrl_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didFinishUpdatingFeedUrl:withError:");
}

id objc_msgSend__disclosureChevronImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disclosureChevronImage:");
}

id objc_msgSend__donateCurrentPlayerItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_donateCurrentPlayerItem");
}

id objc_msgSend__downloadDataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_downloadDataSource");
}

id objc_msgSend__duration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_duration");
}

id objc_msgSend__effectiveAutorefreshRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_effectiveAutorefreshRate");
}

id objc_msgSend__encodedUpNext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_encodedUpNext");
}

id objc_msgSend__encodedUpNextClasses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_encodedUpNextClasses");
}

id objc_msgSend__endBackgroundTask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endBackgroundTask");
}

id objc_msgSend__endGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endGeneratingLibraryChangeNotifications");
}

id objc_msgSend__enqueueStoreRequest_withUrlRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enqueueStoreRequest:withUrlRequest:");
}

id objc_msgSend__enqueueTempFilesDeletion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enqueueTempFilesDeletion");
}

id objc_msgSend__entitiesByRemovingAlreadyProcessedFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_entitiesByRemovingAlreadyProcessedFrom:");
}

id objc_msgSend__episodeArtworkIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_episodeArtworkIdentifier");
}

id objc_msgSend__episodeContextFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_episodeContextFromString:");
}

id objc_msgSend__episodeContextSortFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_episodeContextSortFromString:");
}

id objc_msgSend__episodeOrderFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_episodeOrderFromString:");
}

id objc_msgSend__episodeStorePlatformDictionaryFromSiriAssetInfo_episodeAdamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_episodeStorePlatformDictionaryFromSiriAssetInfo:episodeAdamId:");
}

id objc_msgSend__episodeToPlayForPodcastUuid_playbackOrder_excludeExplicit_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_episodeToPlayForPodcastUuid:playbackOrder:excludeExplicit:ctx:");
}

id objc_msgSend__errorResolutionCancel_transaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorResolutionCancel:transaction:");
}

id objc_msgSend__errorResolutionDefault_transaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorResolutionDefault:transaction:");
}

id objc_msgSend__errorResolutionRetry_transaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorResolutionRetry:transaction:");
}

id objc_msgSend__extraObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extraObjects");
}

id objc_msgSend__feedUpdateAndSubscribeToPodcast_feedUrl_adamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_feedUpdateAndSubscribeToPodcast:feedUrl:adamId:");
}

id objc_msgSend__fetchArtwork(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchArtwork");
}

id objc_msgSend__fetchArtworkInBackground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchArtworkInBackground");
}

id objc_msgSend__fetchBatchFetchEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchBatchFetchEnabled");
}

id objc_msgSend__fetchLatestProcessedPersistentHistoryToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchLatestProcessedPersistentHistoryToken");
}

id objc_msgSend__fetchMediaAPIShowsExpectedToUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchMediaAPIShowsExpectedToUpdate:");
}

id objc_msgSend__fetchRequestForDistinctSeasons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchRequestForDistinctSeasons");
}

id objc_msgSend__fetchRequestForEpisodesWithMissingAdamIdsForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchRequestForEpisodesWithMissingAdamIdsForPodcastUuid:");
}

id objc_msgSend__fetchRequestForMostRecentlyPlayedEpisode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchRequestForMostRecentlyPlayedEpisode");
}

id objc_msgSend__fetchShortcutItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchShortcutItems");
}

id objc_msgSend__fetchSmallestPicturePossible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchSmallestPicturePossible");
}

id objc_msgSend__filePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filePath");
}

id objc_msgSend__fillEmptyMetadataIdentifiersIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fillEmptyMetadataIdentifiersIfNeeded");
}

id objc_msgSend__findOrAddPodcastForMediaItem_updaterCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findOrAddPodcastForMediaItem:updaterCache:");
}

id objc_msgSend__fixSortOrder_generated_p_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fixSortOrder:generated_p:");
}

id objc_msgSend__font(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_font");
}

id objc_msgSend__footerHTMLForDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_footerHTMLForDataSource:");
}

id objc_msgSend__frcDidChangeResults_uuidToManagedObjectIDMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_frcDidChangeResults:uuidToManagedObjectIDMap:");
}

id objc_msgSend__freeSpace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_freeSpace");
}

id objc_msgSend__freezeContentIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_freezeContentIfNeeded");
}

id objc_msgSend__genreNameForStoreItemDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_genreNameForStoreItemDictionary:");
}

id objc_msgSend__getNowPlayingInfoAndCallPendingCompletions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getNowPlayingInfoAndCallPendingCompletions");
}

id objc_msgSend__grabBagWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_grabBagWithCompletionBlock:");
}

id objc_msgSend__handleAttributesAndRedownloadOnPriceTypeChangeIfNeeded_isNewEpisodeToCurrentDevice_oldIsEntitled_oldEnclosureURL_oldPriceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleAttributesAndRedownloadOnPriceTypeChangeIfNeeded:isNewEpisodeToCurrentDevice:oldIsEntitled:oldEnclosureURL:oldPriceType:");
}

id objc_msgSend__handleBrowseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleBrowseURL:");
}

id objc_msgSend__handleLegacyCoreSpotlightURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleLegacyCoreSpotlightURL:");
}

id objc_msgSend__handleNowPlayingURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleNowPlayingURL:");
}

id objc_msgSend__handleShowNotificationsDebugMenuAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleShowNotificationsDebugMenuAction");
}

id objc_msgSend__hasMTImageStoreContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasMTImageStoreContent");
}

id objc_msgSend__hasResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasResults");
}

id objc_msgSend__hasRowAtIndexPath_focusable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasRowAtIndexPath:focusable:");
}

id objc_msgSend__heightWillChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_heightWillChange");
}

id objc_msgSend__historyTransactionsSinceLatestPersistentHistoryToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_historyTransactionsSinceLatestPersistentHistoryToken");
}

id objc_msgSend__identifierForDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_identifierForDictionary:");
}

id objc_msgSend__imageThatSuppressesAccessibilityHairlineThickening(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageThatSuppressesAccessibilityHairlineThickening");
}

id objc_msgSend__imageViewForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageViewForKey:");
}

id objc_msgSend__imageViews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageViews");
}

id objc_msgSend__indexOfEpisodeUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexOfEpisodeUUID:");
}

id objc_msgSend__indexPathForRowAfterIndexPath_focusable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexPathForRowAfterIndexPath:focusable:");
}

id objc_msgSend__indexPathForRowBeforeIndexPath_focusable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indexPathForRowBeforeIndexPath:focusable:");
}

id objc_msgSend__initGroupWithName_identifier_customizations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initGroupWithName:identifier:customizations:");
}

id objc_msgSend__initShared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initShared");
}

id objc_msgSend__initWithEpisodeAdamIds_playheadPosition_initialIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithEpisodeAdamIds:playheadPosition:initialIndex:");
}

id objc_msgSend__initWithPodcastStorePlatformDictionary_oldestEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithPodcastStorePlatformDictionary:oldestEpisode:");
}

id objc_msgSend__initWithTypeIdentifier_suggestedActionType_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithTypeIdentifier:suggestedActionType:options:");
}

id objc_msgSend__initializeFrc(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initializeFrc");
}

id objc_msgSend__insertNewEpisodeForServerEpisode_podcast_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertNewEpisodeForServerEpisode:podcast:ctx:");
}

id objc_msgSend__intentWantsPlaybackQueueIncludedInNowPlayingInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_intentWantsPlaybackQueueIncludedInNowPlayingInfo:");
}

id objc_msgSend__invalidateAssertionTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidateAssertionTimer");
}

id objc_msgSend__invalidateTaskAssertionForced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidateTaskAssertionForced:");
}

id objc_msgSend__invalidateTaskTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidateTaskTimer");
}

id objc_msgSend__invokeRestorationCompletions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invokeRestorationCompletions");
}

id objc_msgSend__isApplicationActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isApplicationActive");
}

id objc_msgSend__isBackgroundEmphasized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isBackgroundEmphasized");
}

id objc_msgSend__isContinuousPlaybackEnabledForLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isContinuousPlaybackEnabledForLimit:");
}

id objc_msgSend__isDownloadButtonEnabledForDownloadPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isDownloadButtonEnabledForDownloadPhase:");
}

id objc_msgSend__isEmphasizedSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isEmphasizedSetting:");
}

id objc_msgSend__isEnabledForTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isEnabledForTransaction:error:");
}

id objc_msgSend__isExplicitContentDisallowedInCurrentStoreFront(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isExplicitContentDisallowedInCurrentStoreFront");
}

id objc_msgSend__isExplicitContentRestrictedByDefaultInCurrentStoreFront(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isExplicitContentRestrictedByDefaultInCurrentStoreFront");
}

id objc_msgSend__isGetAllSinceDomainVersionRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isGetAllSinceDomainVersionRequest");
}

id objc_msgSend__isLPMEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isLPMEnabled");
}

id objc_msgSend__isPausedForDownloadPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isPausedForDownloadPhase:");
}

id objc_msgSend__isRTL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isRTL");
}

id objc_msgSend__isRemoveAllSinceDomainVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isRemoveAllSinceDomainVersion");
}

id objc_msgSend__isSideViewHidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSideViewHidden");
}

id objc_msgSend__isTextEmphasized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isTextEmphasized");
}

id objc_msgSend__isTransactionValid_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isTransactionValid:error:");
}

id objc_msgSend__itemType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_itemType");
}

id objc_msgSend__itemTypeForPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_itemTypeForPlayerItem:");
}

id objc_msgSend__keyForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_keyForTransaction:");
}

id objc_msgSend__lastGlyphBaselineRightPointWithLayoutManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lastGlyphBaselineRightPointWithLayoutManager:");
}

id objc_msgSend__latestEpisodeForPodcastUuid_restrictToUserEpisodes_excludeExplicit_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_latestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:ctx:");
}

id objc_msgSend__layoutContentViewSubviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutContentViewSubviews");
}

id objc_msgSend__layoutMargins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutMargins");
}

id objc_msgSend__layoutMarginsForViewWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutMarginsForViewWidth:");
}

id objc_msgSend__leading(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_leading");
}

id objc_msgSend__load_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_load:");
}

id objc_msgSend__loadActivityForRestoration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadActivityForRestoration");
}

id objc_msgSend__loadArtworkFromMemoryCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadArtworkFromMemoryCache");
}

id objc_msgSend__loadItemsFromEpisodeAdamIdsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadItemsFromEpisodeAdamIdsWithCompletion:");
}

id objc_msgSend__loadQueryParameterValuesFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadQueryParameterValuesFromString:");
}

id objc_msgSend__localEpisode_isEqualToServerEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localEpisode:isEqualToServerEpisode:");
}

id objc_msgSend__localPlayerPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localPlayerPath");
}

id objc_msgSend__localPodcastExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localPodcastExists");
}

id objc_msgSend__logStateChange_oldButtonType_oldStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logStateChange:oldButtonType:oldStatus:");
}

id objc_msgSend__longStringForEpisodes_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_longStringForEpisodes:defaultValue:");
}

id objc_msgSend__lookupEpisodeUuidIfNecessaryFromURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lookupEpisodeUuidIfNecessaryFromURLString:");
}

id objc_msgSend__lookupPodcastUuidIfNecessaryFromURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lookupPodcastUuidIfNecessaryFromURLString:");
}

id objc_msgSend__manifestForPlayMyLatestPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_manifestForPlayMyLatestPodcasts");
}

id objc_msgSend__manifestForPlayMyOldestPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_manifestForPlayMyOldestPodcasts");
}

id objc_msgSend__manifestForPlayMyPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_manifestForPlayMyPodcasts");
}

id objc_msgSend__markAsHiddenPodcast_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markAsHiddenPodcast:inContext:");
}

id objc_msgSend__markAsHiddenPodcastsWithUuids_setSubscriptionsSyncDirty_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markAsHiddenPodcastsWithUuids:setSubscriptionsSyncDirty:ctx:");
}

id objc_msgSend__markEpisodeAsFirstSeen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markEpisodeAsFirstSeen:");
}

id objc_msgSend__markLatestEpisodeAsUnplayedIfNeeded_latestEpisodeInPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markLatestEpisodeAsUnplayedIfNeeded:latestEpisodeInPodcast:");
}

id objc_msgSend__markPlaylistsForUpdateForPodcastUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markPlaylistsForUpdateForPodcastUuids:");
}

id objc_msgSend__maxArtworkSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_maxArtworkSize");
}

id objc_msgSend__mediaItemForEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mediaItemForEpisode:");
}

id objc_msgSend__mediaType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mediaType");
}

id objc_msgSend__mediaTypeForPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mediaTypeForPlayerItem:");
}

id objc_msgSend__mergeSetting_syncObj_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mergeSetting:syncObj:");
}

id objc_msgSend__metadataUrl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_metadataUrl");
}

id objc_msgSend__metricsDateFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_metricsDateFormatter");
}

id objc_msgSend__migrateToImageProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_migrateToImageProvider");
}

id objc_msgSend__mostRecentPlayTimeFromDatabase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mostRecentPlayTimeFromDatabase");
}

id objc_msgSend__mt_identifiersMatchingDeletedEpisodesOnPodcastUuid_inNotificationRequests_ctx_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mt_identifiersMatchingDeletedEpisodesOnPodcastUuid:inNotificationRequests:ctx:completion:");
}

id objc_msgSend__mt_identifiersMatchingPlayerItemsInNotificationRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mt_identifiersMatchingPlayerItemsInNotificationRequests:");
}

id objc_msgSend__mt_identifiersMatchingPodcastUuid_inNotificationRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mt_identifiersMatchingPodcastUuid:inNotificationRequests:");
}

id objc_msgSend__multiSelectCheckmarkImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_multiSelectCheckmarkImage");
}

id objc_msgSend__multiSelectNotSelectedImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_multiSelectNotSelectedImage");
}

id objc_msgSend__needsImageStoreMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_needsImageStoreMigration");
}

id objc_msgSend__notifyDelegateIfHeightChanged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyDelegateIfHeightChanged");
}

id objc_msgSend__nowPlayingRootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nowPlayingRootViewController");
}

id objc_msgSend__observeAllPropertyChangesForEntityName_predicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_observeAllPropertyChangesForEntityName:predicate:");
}

id objc_msgSend__offerNameForOfferFlavor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_offerNameForOfferFlavor:");
}

id objc_msgSend__offerTypesAsFlagBits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_offerTypesAsFlagBits:");
}

id objc_msgSend__oldestEpisodeForPodcastUuid_restrictToUserEpisodes_excludeExplicit_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_oldestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:ctx:");
}

id objc_msgSend__onIndexingQueueHandleNextBatchOrUpdateRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onIndexingQueueHandleNextBatchOrUpdateRequest");
}

id objc_msgSend__onIndexingQueuePerformUpdateRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onIndexingQueuePerformUpdateRequest:");
}

id objc_msgSend__onQueueCancelCurrentReindexAll(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueueCancelCurrentReindexAll");
}

id objc_msgSend__onQueueLoadBagContextWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueueLoadBagContextWithCompletionHandler:");
}

id objc_msgSend__onQueuePerformCompletionsForGenerator_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueuePerformCompletionsForGenerator:error:");
}

id objc_msgSend__onQueueStartNewTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueueStartNewTimer");
}

id objc_msgSend__onQueueStartProcessNextBatchInGenerator_searchableIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueueStartProcessNextBatchInGenerator:searchableIndex:");
}

id objc_msgSend__onQueueStopTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueueStopTimer");
}

id objc_msgSend__onQueueSuspendTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueueSuspendTimer");
}

id objc_msgSend__onQueueSynchronizeImmediatelyWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueueSynchronizeImmediatelyWithCompletionBlock:");
}

id objc_msgSend__onQueueSynchronizeWithAutosynchronizeMask_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueueSynchronizeWithAutosynchronizeMask:withCompletionBlock:");
}

id objc_msgSend__onQueueUpdateTimerForActiveChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onQueueUpdateTimerForActiveChanges");
}

id objc_msgSend__openExternalItemIfNeededForManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_openExternalItemIfNeededForManifest:");
}

id objc_msgSend__options(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_options");
}

id objc_msgSend__performAfterPlay_playbackStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAfterPlay:playbackStarted:");
}

id objc_msgSend__performDeferredIndexAll(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performDeferredIndexAll");
}

id objc_msgSend__performMediaRemoteCommand_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performMediaRemoteCommand:options:");
}

id objc_msgSend__platformContentController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_platformContentController");
}

id objc_msgSend__playQueueTypeForRequestURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playQueueTypeForRequestURL:");
}

id objc_msgSend__playReasonFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playReasonFromString:");
}

id objc_msgSend__playbackRequestIdentifierWithHost_queryComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playbackRequestIdentifierWithHost:queryComponents:");
}

id objc_msgSend__playbackRequestIdentifierWithHost_queryKey_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playbackRequestIdentifierWithHost:queryKey:value:");
}

id objc_msgSend__playbackRequestURLForIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playbackRequestURLForIntent:");
}

id objc_msgSend__playerItemForContentItemId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playerItemForContentItemId:");
}

id objc_msgSend__playerItemForContentItemId_infoCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playerItemForContentItemId:infoCenter:");
}

id objc_msgSend__podcastArtworkIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_podcastArtworkIdentifier");
}

id objc_msgSend__podcastFeedURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_podcastFeedURL");
}

id objc_msgSend__podcastId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_podcastId");
}

id objc_msgSend__podcastState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_podcastState");
}

id objc_msgSend__podcastStateForPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_podcastStateForPlayerItem:");
}

id objc_msgSend__podcastSubscriptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_podcastSubscriptions");
}

id objc_msgSend__predicate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicate");
}

id objc_msgSend__predicateForEpisodesToUpdateWithPodcastUuid_predicateForUnplayedInUnplayedTab_predicateForUserEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForEpisodesToUpdateWithPodcastUuid:predicateForUnplayedInUnplayedTab:predicateForUserEpisodes:");
}

id objc_msgSend__predicateForFilteringExplicitEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForFilteringExplicitEpisodes");
}

id objc_msgSend__predicateForOpportunisticHiddenPodcastDeletion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForOpportunisticHiddenPodcastDeletion");
}

id objc_msgSend__prepareToHandleNextBatchWithReadyBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareToHandleNextBatchWithReadyBlock:");
}

id objc_msgSend__presentErrorDialogWithTitle_message_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentErrorDialogWithTitle:message:handler:");
}

id objc_msgSend__presentRestrictedDialogWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentRestrictedDialogWithHandler:");
}

id objc_msgSend__prewarmSingletons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prewarmSingletons");
}

id objc_msgSend__processCurrentTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processCurrentTransaction");
}

id objc_msgSend__processLatestPersistentHistoryTransactions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processLatestPersistentHistoryTransactions");
}

id objc_msgSend__processOperationOutput_forRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processOperationOutput:forRequest:");
}

id objc_msgSend__processPendingTransactions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processPendingTransactions");
}

id objc_msgSend__processResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processResults:");
}

id objc_msgSend__promptToClearUpNextIfNeededForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_promptToClearUpNextIfNeededForRequest:");
}

id objc_msgSend__propertiesToFetch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_propertiesToFetch");
}

id objc_msgSend__propertyDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_propertyDidChange");
}

id objc_msgSend__providerId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_providerId");
}

id objc_msgSend__queue_processNextPendingFeedIfPossible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_processNextPendingFeedIfPossible");
}

id objc_msgSend__radioButtonTintsTextColorOnSelection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_radioButtonTintsTextColorOnSelection");
}

id objc_msgSend__reCheck(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reCheck");
}

id objc_msgSend__recalculateEpisodeLevel_episodeLevelCalculator_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_recalculateEpisodeLevel:episodeLevelCalculator:ctx:");
}

id objc_msgSend__recordMetricsForItemDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_recordMetricsForItemDidChange");
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_referenceBounds");
}

id objc_msgSend__refetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refetch:");
}

id objc_msgSend__registerPushNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerPushNotifications");
}

id objc_msgSend__reloadActionButtonContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reloadActionButtonContent");
}

id objc_msgSend__reloadArtwork(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reloadArtwork");
}

id objc_msgSend__removeDownloadAssetsForEpisodeUuids_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeDownloadAssetsForEpisodeUuids:reason:");
}

id objc_msgSend__removeDownloadAssetsForEpisodes_shouldKeep_forced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeDownloadAssetsForEpisodes:shouldKeep:forced:");
}

id objc_msgSend__removeImageStoreContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeImageStoreContent");
}

id objc_msgSend__reportMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportMetrics");
}

id objc_msgSend__reportRetentionPolicy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportRetentionPolicy");
}

id objc_msgSend__reportUpNextChangeType_forPlayerItem_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportUpNextChangeType:forPlayerItem:withData:");
}

id objc_msgSend__reportUpNextChangeType_forPlayerItems_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportUpNextChangeType:forPlayerItems:withData:");
}

id objc_msgSend__representationByMigratingLegacyKeysInRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_representationByMigratingLegacyKeysInRepresentation:");
}

id objc_msgSend__requestForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestForTransaction:");
}

id objc_msgSend__resetState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetState");
}

id objc_msgSend__resolveError_transaction_resolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resolveError:transaction:resolution:");
}

id objc_msgSend__responseForCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_responseForCode:");
}

id objc_msgSend__responseForMediaRemoteStatus_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_responseForMediaRemoteStatus:error:");
}

id objc_msgSend__restoreDefaultManifestIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_restoreDefaultManifestIfNeededWithCompletion:");
}

id objc_msgSend__restoreManifestIfNeededWithCompletion_useEmptyManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_restoreManifestIfNeededWithCompletion:useEmptyManifest:");
}

id objc_msgSend__restoreUpNext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_restoreUpNext");
}

id objc_msgSend__rightNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rightNow");
}

id objc_msgSend__sanitisedTimeIntervalForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sanitisedTimeIntervalForObject:");
}

id objc_msgSend__saveActivityForRestoration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveActivityForRestoration");
}

id objc_msgSend__scaledValueForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scaledValueForValue:");
}

id objc_msgSend__scheduleTransactionWithType_sinceDomainVersion_URL_keys_processor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleTransactionWithType:sinceDomainVersion:URL:keys:processor:");
}

id objc_msgSend__scrollEmphasizedCellToVisibleIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollEmphasizedCellToVisibleIfNecessary");
}

id objc_msgSend__searchDictionaryFromArray_withKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_searchDictionaryFromArray:withKey:");
}

id objc_msgSend__selectItemWithUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectItemWithUuid:");
}

id objc_msgSend__sendDidEndEditingForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendDidEndEditingForIndexPath:");
}

id objc_msgSend__sendMediaRemoteCommand_toPlayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendMediaRemoteCommand:toPlayer:");
}

id objc_msgSend__sendMediaRemoteCommand_toPlayer_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendMediaRemoteCommand:toPlayer:options:");
}

id objc_msgSend__sendNotificationForNewlyEntitledEpisodesIfNeeded_latestEpisodeInPodcast_newlyEntitledEpisodeUUIDs_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendNotificationForNewlyEntitledEpisodesIfNeeded:latestEpisodeInPodcast:newlyEntitledEpisodeUUIDs:ctx:");
}

id objc_msgSend__sendWillBeginEditingForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendWillBeginEditingForIndexPath:");
}

id objc_msgSend__separatorColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_separatorColor");
}

id objc_msgSend__setAttributedMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAttributedMessage:");
}

id objc_msgSend__setAttributesOfLocalEpisode_feedEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAttributesOfLocalEpisode:feedEpisode:");
}

id objc_msgSend__setContentScrollInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContentScrollInset:");
}

id objc_msgSend__setControllers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setControllers:");
}

id objc_msgSend__setDocument_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDocument:");
}

id objc_msgSend__setDonatedBySiri_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDonatedBySiri:");
}

id objc_msgSend__setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setError:");
}

id objc_msgSend__setFrc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFrc:");
}

id objc_msgSend__setHeight_forRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHeight:forRowAtIndexPath:");
}

id objc_msgSend__setImageIgnoringSmallerSize_forKey_shareMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setImageIgnoringSmallerSize:forKey:shareMode:");
}

id objc_msgSend__setIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIndexPath:");
}

id objc_msgSend__setLastProcessedPersistentHistoryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setLastProcessedPersistentHistoryToken:");
}

id objc_msgSend__setLocalPlaybackQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setLocalPlaybackQueue:");
}

id objc_msgSend__setManifest_playerController_queueType_startPlayback_forceLocal_reason_interactive_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setManifest:playerController:queueType:startPlayback:forceLocal:reason:interactive:completion:");
}

id objc_msgSend__setNeedsRetryFlagFromNotificationForStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNeedsRetryFlagFromNotificationForStoreId:");
}

id objc_msgSend__setNumberOfLinesForDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNumberOfLinesForDescription:");
}

id objc_msgSend__setPlaybackQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPlaybackQueue:");
}

id objc_msgSend__setPlaybackQueueForMyPodcastsWithOrder_playerController_startPlayback_forceLocal_reason_interactive_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPlaybackQueueForMyPodcastsWithOrder:playerController:startPlayback:forceLocal:reason:interactive:completion:");
}

id objc_msgSend__setPlaybackQueueFromStoreForPodcastAdamId_playerController_siriAssetInfo_savePlayHistory_playbackOrder_startPlayback_reason_interactive_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPlaybackQueueFromStoreForPodcastAdamId:playerController:siriAssetInfo:savePlayHistory:playbackOrder:startPlayback:reason:interactive:completion:");
}

id objc_msgSend__setPlaybackQueueWithIdentifier_startPlayback_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_playerID_mrCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPlaybackQueueWithIdentifier:startPlayback:assetInfo:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:playerID:mrCompletion:");
}

id objc_msgSend__setPodcastArtwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPodcastArtwork:");
}

id objc_msgSend__setRowAlignmentsOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRowAlignmentsOptions:");
}

id objc_msgSend__setStreaming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setStreaming:");
}

id objc_msgSend__setSuggestedEpisodeUuidsImmediately_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setSuggestedEpisodeUuidsImmediately:");
}

id objc_msgSend__setupLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupLabel");
}

id objc_msgSend__setupManifestDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupManifestDefaults");
}

id objc_msgSend__setupMarketingPushHandlerWithBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupMarketingPushHandlerWithBag:");
}

id objc_msgSend__setupPlayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupPlayer");
}

id objc_msgSend__setupUPP(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupUPP");
}

id objc_msgSend__shiftIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shiftIndexPath:");
}

id objc_msgSend__shortStringForEpisodes_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shortStringForEpisodes:defaultValue:");
}

id objc_msgSend__shouldDeferWork(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldDeferWork");
}

id objc_msgSend__shouldDelayEmphasizeCellScrollToVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldDelayEmphasizeCellScrollToVisible");
}

id objc_msgSend__shouldDownloadPodcastWithIdentifierFromStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldDownloadPodcastWithIdentifierFromStore:");
}

id objc_msgSend__shouldOpenExternalItemForEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldOpenExternalItemForEpisode:");
}

id objc_msgSend__shouldSkipSettingPropertiesForWatchPPT(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldSkipSettingPropertiesForWatchPPT");
}

id objc_msgSend__shouldStop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldStop");
}

id objc_msgSend__shouldUpdatePodcastsStatsForChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldUpdatePodcastsStatsForChange:");
}

id objc_msgSend__showAlertForInternetUnavailableReason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showAlertForInternetUnavailableReason:completion:");
}

id objc_msgSend__showDetailUsingURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showDetailUsingURL:");
}

id objc_msgSend__showURL_presentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showURL:presentingViewController:");
}

id objc_msgSend__showsArtwork(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showsArtwork");
}

id objc_msgSend__signalKVSTransactionCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_signalKVSTransactionCompletion:");
}

id objc_msgSend__signalKVSTransactionCompletion_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_signalKVSTransactionCompletion:withError:");
}

id objc_msgSend__skipBackwardCommandEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_skipBackwardCommandEvent");
}

id objc_msgSend__skipForwardCommandEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_skipForwardCommandEvent");
}

id objc_msgSend__sortDescriptorsForLocalEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortDescriptorsForLocalEpisodes");
}

id objc_msgSend__sortTypeForString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortTypeForString:");
}

id objc_msgSend__sortUngroupedList_inPlaylist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortUngroupedList:inPlaylist:");
}

id objc_msgSend__startDownloadForFeedUrl_cloudSyncFeedUrl_podcastStoreId_triggerBy_userInitiated_useBackgroundFetch_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startDownloadForFeedUrl:cloudSyncFeedUrl:podcastStoreId:triggerBy:userInitiated:useBackgroundFetch:source:");
}

id objc_msgSend__startProcessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startProcessor:");
}

id objc_msgSend__storeDownloadArtworkArrayForStoreItemDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storeDownloadArtworkArrayForStoreItemDictionary:");
}

id objc_msgSend__storeDownloadOffersForStoreItemDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storeDownloadOffersForStoreItemDictionary:");
}

id objc_msgSend__storeOfferDownloadDictionaryForStoreOfferItemDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storeOfferDownloadDictionaryForStoreOfferItemDictionary:");
}

id objc_msgSend__storefrontIdentifierFromPreviewUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storefrontIdentifierFromPreviewUrl:");
}

id objc_msgSend__stringForSortType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringForSortType:");
}

id objc_msgSend__subscribedPodcastsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_subscribedPodcastsCount");
}

id objc_msgSend__subtitleForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_subtitleForPodcast:");
}

id objc_msgSend__subtitleForPodcastGroup_currentEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_subtitleForPodcastGroup:currentEpisode:");
}

id objc_msgSend__subtitleHTMLForDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_subtitleHTMLForDataSource:");
}

id objc_msgSend__suggestedActionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_suggestedActionType");
}

id objc_msgSend__synchronize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_synchronize:");
}

id objc_msgSend__synchronousResetToInitialStateDatabase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_synchronousResetToInitialStateDatabase");
}

id objc_msgSend__synchronousResetToInitialStateMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_synchronousResetToInitialStateMetadata");
}

id objc_msgSend__synchronouslyRunKVSTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_synchronouslyRunKVSTransaction:");
}

id objc_msgSend__systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemImageNamed:");
}

id objc_msgSend__systemMidGrayTintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemMidGrayTintColor");
}

id objc_msgSend__tableHeaderHeightDidChangeToHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tableHeaderHeightDidChangeToHeight:");
}

id objc_msgSend__tableView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tableView");
}

id objc_msgSend__takeAssertionAndSchedule(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_takeAssertionAndSchedule");
}

id objc_msgSend__timerFired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timerFired:");
}

id objc_msgSend__timerIsStopped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timerIsStopped");
}

id objc_msgSend__tintedImageForSize_withTint_effectsImage_maskImage_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tintedImageForSize:withTint:effectsImage:maskImage:style:");
}

id objc_msgSend__titleForPodcastGroup_currentEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_titleForPodcastGroup:currentEpisode:");
}

id objc_msgSend__titleHTMLForDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_titleHTMLForDataSource:");
}

id objc_msgSend__toolbarButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_toolbarButton");
}

id objc_msgSend__transactionDidCancel_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transactionDidCancel:withError:");
}

id objc_msgSend__transactionDidFail_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transactionDidFail:withError:");
}

id objc_msgSend__uniqueIdentifierForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_uniqueIdentifierForPodcast:");
}

id objc_msgSend__universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_context_contextSortType_sampPlaybackOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:context:contextSortType:sampPlaybackOrder:");
}

id objc_msgSend__unmodifiedTitleForStoreItemDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unmodifiedTitleForStoreItemDictionary:");
}

id objc_msgSend__unregisterPushNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unregisterPushNotifications");
}

id objc_msgSend__unsafeDeletePodcast_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafeDeletePodcast:ctx:");
}

id objc_msgSend__unsafeFinalizeIngestion_episodeLevelCalculator_storeInfoUpdater_updateAverageCalculator_ctx_didUpdateAnyEpisodes_newlyEntitledEpisodeUUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafeFinalizeIngestion:episodeLevelCalculator:storeInfoUpdater:updateAverageCalculator:ctx:didUpdateAnyEpisodes:newlyEntitledEpisodeUUIDs:");
}

id objc_msgSend__unsafeIngestEpisode_localEpisode_isNew_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafeIngestEpisode:localEpisode:isNew:");
}

id objc_msgSend__unsafe_updateAllPodcastsUserInitiated_forced_useBackgroundFetch_source_startedUpdatesCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unsafe_updateAllPodcastsUserInitiated:forced:useBackgroundFetch:source:startedUpdatesCallback:");
}

id objc_msgSend__upNextDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_upNextDidChange");
}

id objc_msgSend__updateActiveAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateActiveAccount");
}

id objc_msgSend__updateActivityItems_applicationActivities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateActivityItems:applicationActivities:");
}

id objc_msgSend__updateAirplaneMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAirplaneMode");
}

id objc_msgSend__updateAllMediaAPIPodcastsUserInitiated_source_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAllMediaAPIPodcastsUserInitiated:source:completion:");
}

id objc_msgSend__updateAllNonMediaAPIPodcastsUserInitiated_forced_source_started_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAllNonMediaAPIPodcastsUserInitiated:forced:source:started:");
}

id objc_msgSend__updateAutorefreshRateSettingAndRestartTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAutorefreshRateSettingAndRestartTimer:");
}

id objc_msgSend__updateButtonFontAndTextAlignment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateButtonFontAndTextAlignment");
}

id objc_msgSend__updateChannelRelationship_deassociate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateChannelRelationship:deassociate:");
}

id objc_msgSend__updateCurrentActivityForPlayState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCurrentActivityForPlayState");
}

id objc_msgSend__updateCurrentTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCurrentTextColor");
}

id objc_msgSend__updateDerivedPropertiesForPodcastUUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDerivedPropertiesForPodcastUUIDs:");
}

id objc_msgSend__updateEpisodeCountsForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateEpisodeCountsForPodcastUuid:");
}

id objc_msgSend__updateFonts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFonts");
}

id objc_msgSend__updateGlobalCellularWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateGlobalCellularWithCompletion:");
}

id objc_msgSend__updateGlobalPolicyLimitIfMoreRestrictiveInDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateGlobalPolicyLimitIfMoreRestrictiveInDefaults:");
}

id objc_msgSend__updateIconsIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateIconsIfNeeded");
}

id objc_msgSend__updateLoadStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLoadStatus:");
}

id objc_msgSend__updatePlaylistEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePlaylistEpisodes");
}

id objc_msgSend__updatePodcastArtworksIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePodcastArtworksIfNeeded");
}

id objc_msgSend__updatePodcastWithUUID_triggerBy_userInitiated_forced_forceBootstrap_source_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:source:completion:");
}

id objc_msgSend__updatePodcastWithUUID_triggerBy_userInitiated_forced_forceBootstrap_useBackgroundFetch_source_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:useBackgroundFetch:source:completion:");
}

id objc_msgSend__updatePodcastWithUUID_triggerBy_userInitiated_forced_forceBootstrap_useBackgroundFetch_source_tryRedirectURL_startedUpdateCallback_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePodcastWithUUID:triggerBy:userInitiated:forced:forceBootstrap:useBackgroundFetch:source:tryRedirectURL:startedUpdateCallback:completion:");
}

id objc_msgSend__updatePodcastWithUUID_userInitiated_forced_useBackgroundFetch_source_startedUpdateCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePodcastWithUUID:userInitiated:forced:useBackgroundFetch:source:startedUpdateCallback:");
}

id objc_msgSend__updatePodcastWithUUID_userInitiated_forced_useBackgroundFetch_source_tryRedirectURL_startedUpdateCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePodcastWithUUID:userInitiated:forced:useBackgroundFetch:source:tryRedirectURL:startedUpdateCallback:");
}

id objc_msgSend__updatePodcastWithUUID_userInitiated_useBackgroundFetch_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePodcastWithUUID:userInitiated:useBackgroundFetch:source:");
}

id objc_msgSend__updatePodcastWithUUID_userInitiated_useBackgroundFetch_source_tryRedirectURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePodcastWithUUID:userInitiated:useBackgroundFetch:source:tryRedirectURL:");
}

id objc_msgSend__updatePodcastsWithUUIDs_userInitiated_forced_useBackgroundFetch_source_startedUpdatesCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePodcastsWithUUIDs:userInitiated:forced:useBackgroundFetch:source:startedUpdatesCallback:");
}

id objc_msgSend__updatePodcastsWithUUIDs_userInitiated_useBackgroundFetch_source_startedUpdatesCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePodcastsWithUUIDs:userInitiated:useBackgroundFetch:source:startedUpdatesCallback:");
}

id objc_msgSend__updateReachability(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateReachability");
}

id objc_msgSend__updateSeparatorInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSeparatorInsets");
}

id objc_msgSend__updateSettingsFromLoadedBagContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSettingsFromLoadedBagContext:");
}

id objc_msgSend__updateSideViewHiddenForCurrentState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSideViewHiddenForCurrentState");
}

id objc_msgSend__updateSideViewHiddenForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSideViewHiddenForState:");
}

id objc_msgSend__updateSortOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSortOrder");
}

id objc_msgSend__updateSubtitleFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSubtitleFont");
}

id objc_msgSend__updateTableAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateTableAnimated:");
}

id objc_msgSend__updateTextColorForCell_selected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateTextColorForCell:selected:");
}

id objc_msgSend__updateTitleFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateTitleFont");
}

id objc_msgSend__updateUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateUI");
}

id objc_msgSend__updateUngroupedListSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateUngroupedListSetting:");
}

id objc_msgSend__updateUpNextDeleting_inContext_forced_podcastUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateUpNextDeleting:inContext:forced:podcastUuids:");
}

id objc_msgSend__updateWithPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateWithPodcast:");
}

id objc_msgSend__upgradeRepresentationFrom0To1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_upgradeRepresentationFrom0To1:");
}

id objc_msgSend__userDefaultsKeyForExplicitRestrictionAlert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_userDefaultsKeyForExplicitRestrictionAlert");
}

id objc_msgSend__validateFairPlayEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateFairPlayEpisodes");
}

id objc_msgSend__validateFairPlayEpisodesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateFairPlayEpisodesWithCompletionHandler:");
}

id objc_msgSend__validatePlaybackRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validatePlaybackRequest:");
}

id objc_msgSend__verifyFairPlayMigrationWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_verifyFairPlayMigrationWithCompletionHandler:");
}

id objc_msgSend__withLockSetAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_withLockSetAssertion:");
}

id objc_msgSend_abbreviatedFriendlyDisplayString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "abbreviatedFriendlyDisplayString");
}

id objc_msgSend_abortUpdatesIfNetworkUnreachable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "abortUpdatesIfNetworkUnreachable:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_acceptedDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptedDSID");
}

id objc_msgSend_acceptedDSIDText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptedDSIDText");
}

id objc_msgSend_acceptedDSIDTextUserDefaultsKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptedDSIDTextUserDefaultsKey");
}

id objc_msgSend_acceptedDSIDUserDefaultsKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptedDSIDUserDefaultsKey");
}

id objc_msgSend_accessLog(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessLog");
}

id objc_msgSend_accessLogEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessLogEvent");
}

id objc_msgSend_accessTransactionClampsWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessTransactionClampsWithBlock:");
}

id objc_msgSend_accountAgreedTermsVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountAgreedTermsVersion");
}

id objc_msgSend_accountForRequesterUserId_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountForRequesterUserId:completionHandler:");
}

id objc_msgSend_accountFromQueueContainingDsid_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountFromQueueContainingDsid:error:");
}

id objc_msgSend_accountIdentifierForLastSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountIdentifierForLastSync");
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountStore");
}

id objc_msgSend_acknowledgePrivacy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acknowledgePrivacy");
}

id objc_msgSend_acknowledged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acknowledged");
}

id objc_msgSend_acknowledgementNeededForPrivacyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acknowledgementNeededForPrivacyIdentifier:");
}

id objc_msgSend_acquireWithInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireWithInvalidationHandler:");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "action");
}

id objc_msgSend_actionBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionBlock");
}

id objc_msgSend_actionButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionButton");
}

id objc_msgSend_actionButtonFrameForViewWidth_titleOriginY_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionButtonFrameForViewWidth:titleOriginY:");
}

id objc_msgSend_actionButtons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionButtons");
}

id objc_msgSend_actionButtonsContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionButtonsContainer");
}

id objc_msgSend_actionController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionController");
}

id objc_msgSend_actionHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionHandler");
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionIdentifier");
}

id objc_msgSend_actionObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionObject");
}

id objc_msgSend_actionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionType");
}

id objc_msgSend_actionWithIdentifier_title_options_icon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithIdentifier:title:options:icon:");
}

id objc_msgSend_actionWithTitle_image_identifier_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:image:identifier:handler:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actions");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeAccount");
}

id objc_msgSend_activeDsid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeDsid");
}

id objc_msgSend_activeStorefront(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeStorefront");
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activity");
}

id objc_msgSend_activityIndicator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityIndicator");
}

id objc_msgSend_activitySpotlightIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activitySpotlightIdentifier");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityType");
}

id objc_msgSend_actualRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actualRate");
}

id objc_msgSend_adamID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adamID");
}

id objc_msgSend_adamIdNumberFromStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adamIdNumberFromStoreId:");
}

id objc_msgSend_addAcknowledgementCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAcknowledgementCompletionBlock:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addAttributes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttributes:range:");
}

id objc_msgSend_addCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCallback:");
}

id objc_msgSend_addCapacityChangeObserverWithOptions_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCapacityChangeObserverWithOptions:callback:");
}

id objc_msgSend_addChangeNotifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChangeNotifier:");
}

id objc_msgSend_addChild_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChild:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addDeleteButtonInFooter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDeleteButtonInFooter");
}

id objc_msgSend_addDeletedEpisodesObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDeletedEpisodesObject:");
}

id objc_msgSend_addEntityToCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntityToCache:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEpisode:");
}

id objc_msgSend_addEpisodeAutoDownloads_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEpisodeAutoDownloads:completion:");
}

id objc_msgSend_addEpisodeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEpisodeObserver:");
}

id objc_msgSend_addEpisodeObserverForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEpisodeObserverForPodcast:");
}

id objc_msgSend_addEpisodeUuidToUpNext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEpisodeUuidToUpNext:");
}

id objc_msgSend_addFilterPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFilterPredicate:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addImage_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addImage:forKey:");
}

id objc_msgSend_addImage_forKey_persist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addImage:forKey:persist:");
}

id objc_msgSend_addMetricsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMetricsController:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperationWithBlock:");
}

id objc_msgSend_addPlayerItemToUpNext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPlayerItemToUpNext:");
}

id objc_msgSend_addPlayerItemsToPlayNext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPlayerItemsToPlayNext:");
}

id objc_msgSend_addPlayerItemsToUpNext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPlayerItemsToUpNext:");
}

id objc_msgSend_addPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPodcast:");
}

id objc_msgSend_addPodcastInfoViewHeader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPodcastInfoViewHeader");
}

id objc_msgSend_addPodcastWithTitle_uuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPodcastWithTitle:uuid:");
}

id objc_msgSend_addPodcastsViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPodcastsViewController");
}

id objc_msgSend_addRadioSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRadioSetting:");
}

id objc_msgSend_addResultsChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addResultsChangedHandler:");
}

id objc_msgSend_addServiceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addServiceIdentifier:");
}

id objc_msgSend_addSubscribeParams_forFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubscribeParams:forFeedUrl:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addSubviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubviews");
}

id objc_msgSend_addTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addTarget_action_usingExtendedStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:usingExtendedStatus:");
}

id objc_msgSend_addTaskCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTaskCompletionBlock:");
}

id objc_msgSend_addTextFieldWithConfigurationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTextFieldWithConfigurationHandler:");
}

id objc_msgSend_addToUpNextAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addToUpNextAction");
}

id objc_msgSend_addUserAgent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUserAgent:");
}

id objc_msgSend_addVolumeDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addVolumeDisplay:");
}

id objc_msgSend_addedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addedDate");
}

id objc_msgSend_addedPlaylists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addedPlaylists");
}

id objc_msgSend_addedSubscriptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addedSubscriptions");
}

id objc_msgSend_adjustBarHeightToSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustBarHeightToSize");
}

id objc_msgSend_adjustContentOffsetForRefreshControlAsNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustContentOffsetForRefreshControlAsNeeded");
}

id objc_msgSend_adjustVolumeValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustVolumeValue:");
}

id objc_msgSend_adjustedContentInset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustedContentInset");
}

id objc_msgSend_aggregateOperation_attribute_predicate_managedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aggregateOperation:attribute:predicate:managedObjectContext:");
}

id objc_msgSend_airplaneMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airplaneMode");
}

id objc_msgSend_album(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "album");
}

id objc_msgSend_albumName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "albumName");
}

id objc_msgSend_alertController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertController");
}

id objc_msgSend_alertControllerStyleForInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerStyleForInterfaceIdiom");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_alertTitleForUnavailableReason_podcastTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertTitleForUnavailableReason:podcastTitle:");
}

id objc_msgSend_allActions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allActions");
}

id objc_msgSend_allEpisodesMigrationForVersion40to41In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion40to41In:");
}

id objc_msgSend_allEpisodesMigrationForVersion43to44In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion43to44In:");
}

id objc_msgSend_allEpisodesMigrationForVersion45to46In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion45to46In:");
}

id objc_msgSend_allEpisodesMigrationForVersion46to47In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion46to47In:");
}

id objc_msgSend_allEpisodesMigrationForVersion47to48In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion47to48In:");
}

id objc_msgSend_allEpisodesMigrationForVersion51to52In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion51to52In:");
}

id objc_msgSend_allEpisodesMigrationForVersion53to54In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion53to54In:");
}

id objc_msgSend_allEpisodesMigrationForVersion54to55In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion54to55In:");
}

id objc_msgSend_allEpisodesMigrationForVersion59to60In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion59to60In:");
}

id objc_msgSend_allEpisodesMigrationForVersion65to66In_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEpisodesMigrationForVersion65to66In:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allPodcastsSelected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allPodcastsSelected");
}

id objc_msgSend_allPossibleEpisodeListSortOrderProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allPossibleEpisodeListSortOrderProperties");
}

id objc_msgSend_allPropertyChangeObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allPropertyChangeObserver");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowEpisodesRequestTo404AndDeleteEpisodesWithFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowEpisodesRequestTo404AndDeleteEpisodesWithFeedUrl:");
}

id objc_msgSend_allowReporting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowReporting");
}

id objc_msgSend_allowsMultipleSelection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowsMultipleSelection");
}

id objc_msgSend_alreadyRegisteredWithActiveDsid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alreadyRegisteredWithActiveDsid");
}

id objc_msgSend_alreadySubscribedErrorCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alreadySubscribedErrorCode");
}

id objc_msgSend_alternatePaidURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alternatePaidURL");
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_DSID");
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_altDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_altDSID");
}

id objc_msgSend_ams_dictionaryByAddingEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_dictionaryByAddingEntriesFromDictionary:");
}

id objc_msgSend_ams_filterUsingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_filterUsingTest:");
}

id objc_msgSend_ams_fullName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_fullName");
}

id objc_msgSend_ams_isManagedAppleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_isManagedAppleID");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_ams_storefront(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_storefront");
}

id objc_msgSend_ams_underlyingError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_underlyingError");
}

id objc_msgSend_analyticsChannel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyticsChannel");
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_annotateItem_withManagedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotateItem:withManagedObject:");
}

id objc_msgSend_annotateItem_withPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotateItem:withPlayerItem:");
}

id objc_msgSend_annotator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotator");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appActivateObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appActivateObserver");
}

id objc_msgSend_appController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appController");
}

id objc_msgSend_appControllerWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appControllerWithDelegate:");
}

id objc_msgSend_appDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appDelegate");
}

id objc_msgSend_appDelegateClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appDelegateClass");
}

id objc_msgSend_appTintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appTintColor");
}

id objc_msgSend_appearanceSelectedPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appearanceSelectedPath");
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_application(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "application");
}

id objc_msgSend_application_continueUserActivity_restorationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "application:continueUserActivity:restorationHandler:");
}

id objc_msgSend_application_didFinishLaunchingWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "application:didFinishLaunchingWithOptions:");
}

id objc_msgSend_application_handleStateRestorationWith_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "application:handleStateRestorationWith:");
}

id objc_msgSend_application_openStateRestorationActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "application:openStateRestorationActivity:");
}

id objc_msgSend_application_openURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "application:openURL:options:");
}

id objc_msgSend_application_runTest_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "application:runTest:options:");
}

id objc_msgSend_application_willFinishLaunchingWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "application:willFinishLaunchingWithOptions:");
}

id objc_msgSend_applicationActivities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationActivities");
}

id objc_msgSend_applicationDidBecomeActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationDidBecomeActive:");
}

id objc_msgSend_applicationDidEnterBackground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationDidEnterBackground");
}

id objc_msgSend_applicationDidEnterBackground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationDidEnterBackground:");
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationState");
}

id objc_msgSend_applicationWillEnterForeground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationWillEnterForeground");
}

id objc_msgSend_applicationWillTerminate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationWillTerminate:");
}

id objc_msgSend_appliedInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appliedInsets");
}

id objc_msgSend_appliedYOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appliedYOffset");
}

id objc_msgSend_applyCachedImageForPodcast_withSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyCachedImageForPodcast:withSize:");
}

id objc_msgSend_applyShowTypeSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyShowTypeSetting:");
}

id objc_msgSend_applyThemeToImageViewWithKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyThemeToImageViewWithKey:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_areAnimationsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "areAnimationsEnabled");
}

id objc_msgSend_areChaptersLoaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "areChaptersLoaded");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayValue");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_artist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artist");
}

id objc_msgSend_artwork(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artwork");
}

id objc_msgSend_artworkBackgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkBackgroundColor");
}

id objc_msgSend_artworkBorderColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkBorderColor");
}

id objc_msgSend_artworkCatalog(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkCatalog");
}

id objc_msgSend_artworkDictionary_closestToSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkDictionary:closestToSize:");
}

id objc_msgSend_artworkForMTPodcast_withSize_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkForMTPodcast:withSize:completionHandler:");
}

id objc_msgSend_artworkForShow_size_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkForShow:size:completionHandler:");
}

id objc_msgSend_artworkForStationUUID_podcastsUUIDs_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkForStationUUID:podcastsUUIDs:size:");
}

id objc_msgSend_artworkForURL_withSize_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkForURL:withSize:completionHandler:");
}

id objc_msgSend_artworkFrameForContentViewSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkFrameForContentViewSize:");
}

id objc_msgSend_artworkFrameForStyle_forViewWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkFrameForStyle:forViewWidth:");
}

id objc_msgSend_artworkHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkHeight");
}

id objc_msgSend_artworkHeightForStyle_sizeType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkHeightForStyle:sizeType:");
}

id objc_msgSend_artworkIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkIdentifier");
}

id objc_msgSend_artworkKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkKey");
}

id objc_msgSend_artworkPathForShow_size_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkPathForShow:size:completionHandler:");
}

id objc_msgSend_artworkPathForShow_size_source_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkPathForShow:size:source:completionHandler:");
}

id objc_msgSend_artworkPrimaryColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkPrimaryColor");
}

id objc_msgSend_artworkProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkProvider");
}

id objc_msgSend_artworkRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkRequests");
}

id objc_msgSend_artworkSizeForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkSizeForStyle:");
}

id objc_msgSend_artworkSizeForViewWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkSizeForViewWidth:");
}

id objc_msgSend_artworkTemplateURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkTemplateURL");
}

id objc_msgSend_artworkTextPrimaryColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkTextPrimaryColor");
}

id objc_msgSend_artworkTextQuaternaryColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkTextQuaternaryColor");
}

id objc_msgSend_artworkTextSecondaryColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkTextSecondaryColor");
}

id objc_msgSend_artworkTextTertiaryColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkTextTertiaryColor");
}

id objc_msgSend_artworkTokenId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkTokenId");
}

id objc_msgSend_artworkUrl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkUrl");
}

id objc_msgSend_artworkView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkView");
}

id objc_msgSend_artworkWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkWidth");
}

id objc_msgSend_artworkWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artworkWithSize:");
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ascender");
}

id objc_msgSend_assertionTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assertionTimeout");
}

id objc_msgSend_assertionTimeoutTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assertionTimeoutTimer");
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asset");
}

id objc_msgSend_assetCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetCache");
}

id objc_msgSend_assetForLocalFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetForLocalFile:");
}

id objc_msgSend_assetForRemoteFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetForRemoteFile:");
}

id objc_msgSend_assetTimeRange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetTimeRange");
}

id objc_msgSend_assetURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetURL");
}

id objc_msgSend_assetUrl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetUrl");
}

id objc_msgSend_asyncImageForKey_size_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asyncImageForKey:size:completionHandler:");
}

id objc_msgSend_asyncImageURLForKey_squareDimension_cacheKeyModifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asyncImageURLForKey:squareDimension:cacheKeyModifier:completionHandler:");
}

id objc_msgSend_asyncValueOnQueue_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asyncValueOnQueue:withCompletion:");
}

id objc_msgSend_asyncValuePromiseOnQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asyncValuePromiseOnQueue:");
}

id objc_msgSend_attachmentWithIdentifier_URL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentWithIdentifier:URL:options:error:");
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachments");
}

id objc_msgSend_attemptToRecoverFromKeyError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptToRecoverFromKeyError:");
}

id objc_msgSend_attributeSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeSet");
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_attributedMessageForAlertController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedMessageForAlertController");
}

id objc_msgSend_attributedStringWithAttachment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedStringWithAttachment:");
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedText");
}

id objc_msgSend_attributedTitleForRefreshControl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedTitleForRefreshControl");
}

id objc_msgSend_attributesOfFileSystemForPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfFileSystemForPath:error:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_authenticationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticationController");
}

id objc_msgSend_authenticationError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticationError");
}

id objc_msgSend_authenticationErrorsForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticationErrorsForTransaction:");
}

id objc_msgSend_authenticationNeededTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticationNeededTimestamp");
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "author");
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authorizationStatus");
}

id objc_msgSend_autoDownload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoDownload");
}

id objc_msgSend_autoDownloadEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoDownloadEnabled");
}

id objc_msgSend_autoDownloadFooterTextWithGlobalLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoDownloadFooterTextWithGlobalLimit");
}

id objc_msgSend_autoDownloadType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoDownloadType");
}

id objc_msgSend_autoDownloadsSettingsGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoDownloadsSettingsGroup");
}

id objc_msgSend_autoSimulateNotificationOnAppActivate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoSimulateNotificationOnAppActivate");
}

id objc_msgSend_autodownloadEpisodesChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autodownloadEpisodesChanged:");
}

id objc_msgSend_automaticSynchronizeOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "automaticSynchronizeOptions");
}

id objc_msgSend_automaticallySuggestsEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "automaticallySuggestsEpisodes");
}

id objc_msgSend_autorefreshRate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autorefreshRate");
}

id objc_msgSend_availableActions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availableActions");
}

id objc_msgSend_backCatalog(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backCatalog");
}

id objc_msgSend_backCatalogIconForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backCatalogIconForTheme:");
}

id objc_msgSend_backCatalogPartiallyPlayedIconForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backCatalogPartiallyPlayedIconForTheme:");
}

id objc_msgSend_backOffForTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backOffForTimeInterval:");
}

id objc_msgSend_backOffUntil(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backOffUntil");
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundColor");
}

id objc_msgSend_backgroundColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundColorForTheme:");
}

id objc_msgSend_backgroundFetch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundFetch");
}

id objc_msgSend_backgroundTask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask");
}

id objc_msgSend_backgroundTaskAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTaskAssertion");
}

id objc_msgSend_backgroundTaskId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTaskId");
}

id objc_msgSend_backgroundTaskIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTaskIdentifier");
}

id objc_msgSend_backgroundTaskScheduler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTaskScheduler");
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundView");
}

id objc_msgSend_badgeLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "badgeLabel");
}

id objc_msgSend_bag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bag");
}

id objc_msgSend_bagLookupEndTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagLookupEndTime");
}

id objc_msgSend_bagLookupStartTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagLookupStartTime");
}

id objc_msgSend_bagLookupTask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagLookupTask");
}

id objc_msgSend_barsTintColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "barsTintColorForTheme:");
}

id objc_msgSend_barsView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "barsView");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_baseDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baseDictionary");
}

id objc_msgSend_baseURLForGETAll(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baseURLForGETAll");
}

id objc_msgSend_baseURLForPUTAll(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baseURLForPUTAll");
}

id objc_msgSend_batchFeedFetchIsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchFeedFetchIsEnabled");
}

id objc_msgSend_batchUpdateRequestWithEntityName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchUpdateRequestWithEntityName:");
}

id objc_msgSend_becomeActiveMediaPlayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "becomeActiveMediaPlayer");
}

id objc_msgSend_becomeCurrent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "becomeCurrent");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "begin");
}

id objc_msgSend_beginAutomaticResponseLoading(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginAutomaticResponseLoading");
}

id objc_msgSend_beginBackgroundTaskWithExpirationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginBackgroundTaskWithExpirationHandler:");
}

id objc_msgSend_beginBackgroundTaskWithName_expirationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginBackgroundTaskWithName:expirationHandler:");
}

id objc_msgSend_beginEnforcementWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginEnforcementWithCompletionHandler:");
}

id objc_msgSend_beginGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginGeneratingLibraryChangeNotifications");
}

id objc_msgSend_beginGeneratingLibraryChangeNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginGeneratingLibraryChangeNotifications:");
}

id objc_msgSend_beginIgnoringInteractionEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginIgnoringInteractionEvents");
}

id objc_msgSend_beginListeningForChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginListeningForChanges");
}

id objc_msgSend_beginLoadingArtwork(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginLoadingArtwork");
}

id objc_msgSend_beginObserving(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginObserving");
}

id objc_msgSend_beginObservingTranscriptIdentifierChangesForCurrentItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginObservingTranscriptIdentifierChangesForCurrentItem:");
}

id objc_msgSend_beginRefreshing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginRefreshing");
}

id objc_msgSend_beginTaskOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTaskOperation");
}

id objc_msgSend_beginTransactionWithItemsToSyncEnumerationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTransactionWithItemsToSyncEnumerationBlock:");
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginUpdates");
}

id objc_msgSend_bestAvailableStoreCleanURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bestAvailableStoreCleanURL");
}

id objc_msgSend_bestDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bestDescription");
}

id objc_msgSend_bestFeedURLExcludingRedirectURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bestFeedURLExcludingRedirectURL:");
}

id objc_msgSend_bestIndexPathForObject_atIndex_fromMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bestIndexPathForObject:atIndex:fromMap:");
}

id objc_msgSend_bestIndexPathForObject_atIndex_fromMap_autoremove_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bestIndexPathForObject:atIndex:fromMap:autoremove:");
}

id objc_msgSend_bestSummary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bestSummary");
}

id objc_msgSend_bestTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bestTitle");
}

id objc_msgSend_bestUrl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bestUrl");
}

id objc_msgSend_bezierPathWithRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithRect:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blackColor");
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "block");
}

id objc_msgSend_bodyForShareEmailFromDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bodyForShareEmailFromDataSource:");
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_bookmarkKeyForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bookmarkKeyForSyncType:");
}

id objc_msgSend_bookmarkTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bookmarkTime");
}

id objc_msgSend_bookmarkTimeMillis(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bookmarkTimeMillis");
}

id objc_msgSend_bookmarksKeyForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bookmarksKeyForSyncType:");
}

id objc_msgSend_bookmarksLastSyncKeyForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bookmarksLastSyncKeyForSyncType:");
}

id objc_msgSend_bookmarksSyncVersionForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bookmarksSyncVersionForSyncType:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_box_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "box:");
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_bumpBookmarksSyncVersionToVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bumpBookmarksSyncVersionToVersion:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "button");
}

id objc_msgSend_buttonCallback(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonCallback");
}

id objc_msgSend_buttonFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonFont");
}

id objc_msgSend_buttonLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonLabel");
}

id objc_msgSend_buttonSettingWithTitle_detailText_identifier_changeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonSettingWithTitle:detailText:identifier:changeHandler:");
}

id objc_msgSend_buttonSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonSize");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_buttonsFrameForActionButtonFrame_downloadButtonFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonsFrameForActionButtonFrame:downloadButtonFrame:");
}

id objc_msgSend_byteSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "byteSize");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_cacheArtwork_withDimension_forShow_fromSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheArtwork:withDimension:forShow:fromSource:");
}

id objc_msgSend_cachedArtworkForMTPodcast_withSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedArtworkForMTPodcast:withSize:");
}

id objc_msgSend_cachedAssetURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedAssetURL");
}

id objc_msgSend_cachesDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachesDirectory");
}

id objc_msgSend_calculateCellWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculateCellWidth:");
}

id objc_msgSend_calculateNewEpisodeCountIn_serialShowsUseExperimentalRules_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculateNewEpisodeCountIn:serialShowsUseExperimentalRules:");
}

id objc_msgSend_callbacks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callbacks");
}

id objc_msgSend_canBecomeFocused(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canBecomeFocused");
}

id objc_msgSend_canContinueIntentWithUserActivityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canContinueIntentWithUserActivityType:");
}

id objc_msgSend_canDeletePlaylistUUIDBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canDeletePlaylistUUIDBlock");
}

id objc_msgSend_canFocusRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canFocusRowAtIndexPath:");
}

id objc_msgSend_canOpenURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canOpenURL:");
}

id objc_msgSend_canPromptForNotificationPermissionsWithPreWarmSheet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canPromptForNotificationPermissionsWithPreWarmSheet");
}

id objc_msgSend_canRequestStoreSignIn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canRequestStoreSignIn");
}

id objc_msgSend_canScheduleSyncRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canScheduleSyncRequest");
}

id objc_msgSend_canScheduleTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canScheduleTransaction:error:");
}

id objc_msgSend_canSendNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canSendNotification");
}

id objc_msgSend_canShareFromTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canShareFromTimestamp");
}

id objc_msgSend_canShowWithPresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canShowWithPresentingViewController:");
}

id objc_msgSend_canSyncInterests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canSyncInterests");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelAllButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelAllButton");
}

id objc_msgSend_cancelAllDownloadsUserInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelAllDownloadsUserInitiated:");
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelAllOperations");
}

id objc_msgSend_cancelAllRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelAllRequests");
}

id objc_msgSend_cancelAllTaskRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelAllTaskRequests");
}

id objc_msgSend_cancelAllTransactions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelAllTransactions");
}

id objc_msgSend_cancelAllTransactionsCancelCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelAllTransactionsCancelCode:");
}

id objc_msgSend_cancelDownloadForEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelDownloadForEpisodeUuid:");
}

id objc_msgSend_cancelDownloadsForEpisodeUuid_userInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelDownloadsForEpisodeUuid:userInitiated:");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_cancelTaskRequestWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelTaskRequestWithIdentifier:");
}

id objc_msgSend_cancelType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelType");
}

id objc_msgSend_cancelUniversalPlaybackPositionTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelUniversalPlaybackPositionTransaction:");
}

id objc_msgSend_cancelWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelWithError:");
}

id objc_msgSend_canceled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canceled");
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capHeight");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_categories(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categories");
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "category");
}

id objc_msgSend_categoryWithIdentifier_actions_intentIdentifiers_hiddenPreviewsBodyPlaceholder_categorySummaryFormat_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:");
}

id objc_msgSend_cell_moreButtonTapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cell:moreButtonTapped:");
}

id objc_msgSend_cellClassForSettingType_inGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellClassForSettingType:inGroupWithIdentifier:");
}

id objc_msgSend_cellDidChangeSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellDidChangeSize:");
}

id objc_msgSend_cellDidPressDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellDidPressDelete:");
}

id objc_msgSend_cellDidPressMore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellDidPressMore:");
}

id objc_msgSend_cellDidPressToggleDownload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellDidPressToggleDownload:");
}

id objc_msgSend_cellEmpahsisBackgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellEmpahsisBackgroundColor");
}

id objc_msgSend_cellEmpahsisSwitchBorderColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellEmpahsisSwitchBorderColor");
}

id objc_msgSend_cellEmpahsisTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellEmpahsisTextColor");
}

id objc_msgSend_cellEmphasis(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellEmphasis");
}

id objc_msgSend_cellForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForItemAtIndexPath:");
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_cellIdentifierForSettingType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellIdentifierForSettingType:");
}

id objc_msgSend_cellSecondaryTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellSecondaryTextColor");
}

id objc_msgSend_cellSelectedBackgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellSelectedBackgroundColor");
}

id objc_msgSend_cellSeparatorColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellSeparatorColor");
}

id objc_msgSend_cellTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellTextColor");
}

id objc_msgSend_changeGenerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeGenerator");
}

id objc_msgSend_changeHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeHandler");
}

id objc_msgSend_changeIsUserDriven(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeIsUserDriven");
}

id objc_msgSend_changeType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeType");
}

id objc_msgSend_changedObjectID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changedObjectID");
}

id objc_msgSend_changes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changes");
}

id objc_msgSend_changesForEntityName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changesForEntityName:");
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "channel");
}

id objc_msgSend_channelForStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "channelForStoreId:");
}

id objc_msgSend_channelItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "channelItem");
}

id objc_msgSend_channelStoreId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "channelStoreId");
}

id objc_msgSend_chapters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chapters");
}

id objc_msgSend_checkAutoDownloadsForUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkAutoDownloadsForUuids:");
}

id objc_msgSend_checkPotentialLibraryDeletionIssueForPreviouslySubscribedPodcastsCount_podcastsToUnsubscribeCount_newVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkPotentialLibraryDeletionIssueForPreviouslySubscribedPodcastsCount:podcastsToUnsubscribeCount:newVersion:");
}

id objc_msgSend_checkPotentialLibraryDeletionIssueForRemoteBookmarksCount_episodesToUnbookmarkCount_newVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkPotentialLibraryDeletionIssueForRemoteBookmarksCount:episodesToUnbookmarkCount:newVersion:");
}

id objc_msgSend_checkViabilityOfSyncLibraryAndUPP(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkViabilityOfSyncLibraryAndUPP");
}

id objc_msgSend_chevronImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chevronImage");
}

id objc_msgSend_chevronView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chevronView");
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "children");
}

id objc_msgSend_chosenByAutofill(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chosenByAutofill");
}

id objc_msgSend_clampsController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clampsController");
}

id objc_msgSend_cleanKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanKeys");
}

id objc_msgSend_cleanUpNeutralInterests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanUpNeutralInterests");
}

id objc_msgSend_cleanUpOldHiddenPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanUpOldHiddenPodcasts");
}

id objc_msgSend_cleanedTitleStringWithPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanedTitleStringWithPrefix:");
}

id objc_msgSend_cleanupItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupItem");
}

id objc_msgSend_cleanupTemporaryResourcesDirectoryIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupTemporaryResourcesDirectoryIfNecessary");
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clear");
}

id objc_msgSend_clearAuthenticationRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearAuthenticationRequest");
}

id objc_msgSend_clearBackOff(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearBackOff");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearColor");
}

id objc_msgSend_clearDSIDCheckTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearDSIDCheckTimestamp");
}

id objc_msgSend_clearHasBeenIndexed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearHasBeenIndexed");
}

id objc_msgSend_clearNetworkingBlocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearNetworkingBlocked");
}

id objc_msgSend_clearPartialUploadState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPartialUploadState");
}

id objc_msgSend_clearPlayerManifestWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPlayerManifestWithCompletion:");
}

id objc_msgSend_clearQueueItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearQueueItems");
}

id objc_msgSend_clearStopInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearStopInfo");
}

id objc_msgSend_clearTimestampForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearTimestampForTransaction:");
}

id objc_msgSend_clearUpNextManifest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearUpNextManifest");
}

id objc_msgSend_clearUserAcceptedSyncTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearUserAcceptedSyncTimestamp");
}

id objc_msgSend_clearUserCancelledSignIn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearUserCancelledSignIn");
}

id objc_msgSend_clientClampErrorWithTransaction_retrySeconds_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientClampErrorWithTransaction:retrySeconds:underlyingError:");
}

id objc_msgSend_clientId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientId");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "close");
}

id objc_msgSend_closestIndexPathToRow_forIndexPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closestIndexPathToRow:forIndexPaths:");
}

id objc_msgSend_cloudSyncBugReporter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudSyncBugReporter");
}

id objc_msgSend_cloudSyncController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudSyncController");
}

id objc_msgSend_cloudSyncIsDirty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudSyncIsDirty");
}

id objc_msgSend_cloudSyncVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudSyncVersion");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_collectNextBatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectNextBatch:");
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView");
}

id objc_msgSend_collectionView_didEndEditingItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView:didEndEditingItemAtIndexPath:");
}

id objc_msgSend_collectionView_didSelectItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView:didSelectItemAtIndexPath:");
}

id objc_msgSend_collectionView_layout_referenceSizeForHeaderInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView:layout:referenceSizeForHeaderInSection:");
}

id objc_msgSend_collectionView_willBeginEditingItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView:willBeginEditingItemAtIndexPath:");
}

id objc_msgSend_collectionViewLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionViewLayout");
}

id objc_msgSend_collections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collections");
}

id objc_msgSend_colorTheme(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorTheme");
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_combineImages_rowCount_size_border_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combineImages:rowCount:size:border:");
}

id objc_msgSend_commandCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandCenter");
}

id objc_msgSend_commandController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandController");
}

id objc_msgSend_commandType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandType");
}

id objc_msgSend_commitHasPerformedLegacyBadgeMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitHasPerformedLegacyBadgeMigration");
}

id objc_msgSend_commitUniversalPlaybackPositionTransaction_domainVersion_metadataEnumerationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitUniversalPlaybackPositionTransaction:domainVersion:metadataEnumerationBlock:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_completeAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeAndReturnError:");
}

id objc_msgSend_completeTransactionWithNewVersion_isGetTransaction_mismatch_finishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeTransactionWithNewVersion:isGetTransaction:mismatch:finishedBlock:");
}

id objc_msgSend_completeTransactionWithNewVersion_key_finishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeTransactionWithNewVersion:key:finishedBlock:");
}

id objc_msgSend_completeTransactionWithNewVersion_mismatch_finishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeTransactionWithNewVersion:mismatch:finishedBlock:");
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completion");
}

id objc_msgSend_completions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completions");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_compositeManifest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compositeManifest");
}

id objc_msgSend_compositingFilter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compositingFilter");
}

id objc_msgSend_computeNotificationsWithSchedulingOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "computeNotificationsWithSchedulingOptions:");
}

id objc_msgSend_concurrentMapWithStrideSize_on_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "concurrentMapWithStrideSize:on:withBlock:");
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "config");
}

id objc_msgSend_configWithSupportsMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configWithSupportsMetrics:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configuration");
}

id objc_msgSend_configureArtworkForSearchableItemAttributeSet_withPodcastUuid_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureArtworkForSearchableItemAttributeSet:withPodcastUuid:completion:");
}

id objc_msgSend_configureBarButtonItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureBarButtonItems");
}

id objc_msgSend_configureCell_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureCell:atIndex:");
}

id objc_msgSend_configureCell_atIndexPath_withDescription_inGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureCell:atIndexPath:withDescription:inGroupWithIdentifier:");
}

id objc_msgSend_configureCell_withObject_atIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureCell:withObject:atIndexPath:");
}

id objc_msgSend_configureRowHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureRowHeight");
}

id objc_msgSend_configureSubviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureSubviews");
}

id objc_msgSend_conflictForSetTransaction_withData_forKey_version_finishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conflictForSetTransaction:withData:forKey:version:finishedBlock:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_conformsToType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToType:");
}

id objc_msgSend_consecutiveFeedFetchErrors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consecutiveFeedFetchErrors");
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constant");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_containerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerIdentifier");
}

id objc_msgSend_containerOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerOrder");
}

id objc_msgSend_containerOrderOptionArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerOrderOptionArray:");
}

id objc_msgSend_containerOrderOptionValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerOrderOptionValues");
}

id objc_msgSend_containerTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerTitle");
}

id objc_msgSend_containsEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsEpisodeUuid:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_containsStringInsensitive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsStringInsensitive:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "content");
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentInset");
}

id objc_msgSend_contentItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentItem");
}

id objc_msgSend_contentItemID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentItemID");
}

id objc_msgSend_contentItemIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentItemIdentifier");
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentOffset");
}

id objc_msgSend_contentRectForCell_forState_rowWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentRectForCell:forState:rowWidth:");
}

id objc_msgSend_contentRectForEditControlWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentRectForEditControlWidth:");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentSize");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentView");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "context");
}

id objc_msgSend_contextID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextID");
}

id objc_msgSend_contextWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextWithReason:");
}

id objc_msgSend_continueActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueActivity:");
}

id objc_msgSend_continueCoreSpotlightItemActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueCoreSpotlightItemActivity:");
}

id objc_msgSend_continueCoreSpotlightSearchActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueCoreSpotlightSearchActivity:");
}

id objc_msgSend_continueIntentsUserActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueIntentsUserActivity:");
}

id objc_msgSend_continuePlaybackActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continuePlaybackActivity:");
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controller");
}

id objc_msgSend_controller_didChangeObject_atIndexPath_forChangeType_newIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:");
}

id objc_msgSend_controllerAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controllerAtIndex:");
}

id objc_msgSend_controllerDidChangeContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controllerDidChangeContent:");
}

id objc_msgSend_controllerForDeletingStation_fromLibrary_deletionCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controllerForDeletingStation:fromLibrary:deletionCompletion:");
}

id objc_msgSend_controllerWillChangeContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controllerWillChangeContent:");
}

id objc_msgSend_controllerWithQosClass_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controllerWithQosClass:identifier:");
}

id objc_msgSend_controllerWithUserIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controllerWithUserIdentity:");
}

id objc_msgSend_controllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controllers");
}

id objc_msgSend_convertActiveEndpointToBufferedAirPlayWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertActiveEndpointToBufferedAirPlayWithCompletion:");
}

id objc_msgSend_convertPoint_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:fromView:");
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:toView:");
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:fromView:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_copyImageFromSourceUrl_sourceFileType_to_discardTransparency_enforceSquare_maxDimensionInPixels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyImageFromSourceUrl:sourceFileType:to:discardTransparency:enforceSquare:maxDimensionInPixels:");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_copySettingsToSharedContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copySettingsToSharedContainer");
}

id objc_msgSend_copyWithPlayReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithPlayReason:");
}

id objc_msgSend_coreDataVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coreDataVersion");
}

id objc_msgSend_cornerRadiusForSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cornerRadiusForSize:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForFetchRequest:error:");
}

id objc_msgSend_countInfoButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countInfoButton");
}

id objc_msgSend_countLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countLabel");
}

id objc_msgSend_countOfNewEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfNewEpisodes");
}

id objc_msgSend_countOfNewEpisodesForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfNewEpisodesForPodcast:");
}

id objc_msgSend_countOfObjectsInEntity_predicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfObjectsInEntity:predicate:");
}

id objc_msgSend_countOfPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfPodcasts");
}

id objc_msgSend_countOfUnplayedEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfUnplayedEpisodes");
}

id objc_msgSend_countOfUnplayedEpisodesForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfUnplayedEpisodesForPodcast:");
}

id objc_msgSend_countView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countView");
}

id objc_msgSend_counterForGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "counterForGeneratingLibraryChangeNotifications");
}

id objc_msgSend_createAndSaveStationWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAndSaveStationWithTitle:");
}

id objc_msgSend_createBagForSubProfile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createBagForSubProfile");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createEpisodeObserverForPodcastUuid_predicate_sortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createEpisodeObserverForPodcastUuid:predicate:sortDescriptors:");
}

id objc_msgSend_createMoreAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createMoreAction");
}

id objc_msgSend_createOrFindChannelFromFeedChannelItem_personalizedRequest_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createOrFindChannelFromFeedChannelItem:personalizedRequest:context:");
}

id objc_msgSend_createOrUpdateUPPMetadataFromUPPMediaItem_inCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createOrUpdateUPPMetadataFromUPPMediaItem:inCtx:");
}

id objc_msgSend_createOrUpdateUPPMetadataFromUPPRecord_inCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createOrUpdateUPPMetadataFromUPPRecord:inCtx:");
}

id objc_msgSend_createPersistentStoreForModel_attemptMigration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createPersistentStoreForModel:attemptMigration:");
}

id objc_msgSend_createPrivateTempDirIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createPrivateTempDirIfNeeded");
}

id objc_msgSend_createQueryObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createQueryObserver");
}

id objc_msgSend_createSectionForEmptyOverlay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSectionForEmptyOverlay");
}

id objc_msgSend_createSectionForFeed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSectionForFeed");
}

id objc_msgSend_createSectionForIsFromiTunesSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSectionForIsFromiTunesSync");
}

id objc_msgSend_createSectionForOtherEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSectionForOtherEpisodes");
}

id objc_msgSend_createSectionForPlayedToBeDeleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSectionForPlayedToBeDeleted");
}

id objc_msgSend_createSectionForUnplayed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSectionForUnplayed");
}

id objc_msgSend_createSeparator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSeparator");
}

id objc_msgSend_createSessionWithAsset_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSessionWithAsset:completion:");
}

id objc_msgSend_createSocialPostUIImageWithShareModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSocialPostUIImageWithShareModel:");
}

id objc_msgSend_createVideoGlyphAttributedString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createVideoGlyphAttributedString");
}

id objc_msgSend_createWindowForApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createWindowForApplication:");
}

id objc_msgSend_createWindowWithScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createWindowWithScene:");
}

id objc_msgSend_createdPodcastUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createdPodcastUUID");
}

id objc_msgSend_currentActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentActivity");
}

id objc_msgSend_currentChapter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentChapter");
}

id objc_msgSend_currentConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentConstant");
}

id objc_msgSend_currentDeserializer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDeserializer");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentEpisodeLimitAllowsAutomaticDownloads(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentEpisodeLimitAllowsAutomaticDownloads");
}

id objc_msgSend_currentEpisodeLimitIsNextNEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentEpisodeLimitIsNextNEpisodes");
}

id objc_msgSend_currentFeedURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentFeedURL");
}

id objc_msgSend_currentFetchRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentFetchRequest");
}

id objc_msgSend_currentIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentIndex");
}

id objc_msgSend_currentItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentItem");
}

id objc_msgSend_currentKVSTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentKVSTransaction");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentManifest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentManifest");
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentNotificationCenter");
}

id objc_msgSend_currentPersistentHistoryTokenFromStores_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPersistentHistoryTokenFromStores:");
}

id objc_msgSend_currentPlayerTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPlayerTime");
}

id objc_msgSend_currentPodcastFeedURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPodcastFeedURL");
}

id objc_msgSend_currentPodcastStateDescriptionFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPodcastStateDescriptionFrom:");
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentProcess");
}

id objc_msgSend_currentReachabilityStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentReachabilityStatus");
}

id objc_msgSend_currentRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRequest");
}

id objc_msgSend_currentSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentSettings");
}

id objc_msgSend_currentShareMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentShareMode");
}

id objc_msgSend_currentShortTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentShortTitle");
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentState");
}

id objc_msgSend_currentStateMask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentStateMask");
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentThread");
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTime");
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTraitCollection");
}

id objc_msgSend_currentTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTransaction");
}

id objc_msgSend_currentlySubscribingStoreCollectionIds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentlySubscribingStoreCollectionIds");
}

id objc_msgSend_customHeaderHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customHeaderHeight");
}

id objc_msgSend_customView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customView");
}

id objc_msgSend_customiseLabelAndSeparatorInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customiseLabelAndSeparatorInsets");
}

id objc_msgSend_darkCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "darkCount");
}

id objc_msgSend_darkDownloadsChangeWithWasDark_isDark_reason_previousExit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:");
}

id objc_msgSend_dataAccessQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataAccessQueue");
}

id objc_msgSend_dataForSetTransaction_key_version_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataForSetTransaction:key:version:");
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataSource");
}

id objc_msgSend_dataSourceTransactionContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataSourceTransactionContext");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_dataWithNodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithNodes:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_databaseID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "databaseID");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateAccessed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateAccessed");
}

id objc_msgSend_dateAdded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateAdded");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateFormatters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFormatters");
}

id objc_msgSend_dateFromFormattedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromFormattedString:");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_dateLabelDescriptionForEpisode_download_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateLabelDescriptionForEpisode:download:");
}

id objc_msgSend_dateReleased(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateReleased");
}

id objc_msgSend_dateToFireNextTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateToFireNextTimer");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_debugDataFileName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugDataFileName");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_declinedAuthRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "declinedAuthRequests");
}

id objc_msgSend_decodeAndSetPlaybackQueueForController_fromIdentifiers_enqueuer_accountLookupFailed_startPlayback_upNextQueueIntent_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeAndSetPlaybackQueueForController:fromIdentifiers:enqueuer:accountLookupFailed:startPlayback:upNextQueueIntent:completion:");
}

id objc_msgSend_decodeAndSetPlaybackQueueForController_fromIdentifiers_sessionIdentifierOverride_enqueuer_accountLookupFailed_startPlayback_upNextQueueIntent_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeAndSetPlaybackQueueForController:fromIdentifiers:sessionIdentifierOverride:enqueuer:accountLookupFailed:startPlayback:upNextQueueIntent:completion:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultActionButtonsXOriginForScrollFrame_andActionContainerSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultActionButtonsXOriginForScrollFrame:andActionContainerSize:");
}

id objc_msgSend_defaultArtworkForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultArtworkForStyle:");
}

id objc_msgSend_defaultAssetOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultAssetOptions");
}

id objc_msgSend_defaultCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCategory");
}

id objc_msgSend_defaultCellBackgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCellBackgroundColor");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultConfiguration");
}

id objc_msgSend_defaultContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultContext");
}

id objc_msgSend_defaultDomain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultDomain");
}

id objc_msgSend_defaultEpisodeLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultEpisodeLimit");
}

id objc_msgSend_defaultGetURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultGetURL");
}

id objc_msgSend_defaultImageStoreURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultImageStoreURL");
}

id objc_msgSend_defaultInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultInstance");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultMediaLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultMediaLibrary");
}

id objc_msgSend_defaultPodcastArtwork(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultPodcastArtwork");
}

id objc_msgSend_defaultPodcastArtworkData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultPodcastArtworkData");
}

id objc_msgSend_defaultPollingInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultPollingInterval");
}

id objc_msgSend_defaultPropertiesThatAffectPredicate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultPropertiesThatAffectPredicate");
}

id objc_msgSend_defaultPropertiesToFetch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultPropertiesToFetch");
}

id objc_msgSend_defaultSetURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSetURL");
}

id objc_msgSend_defaultSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSettings");
}

id objc_msgSend_defaultShowType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultShowType");
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultStore");
}

id objc_msgSend_defaultSubtitleFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSubtitleFont");
}

id objc_msgSend_defaultSubtitleNumberOfLines(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSubtitleNumberOfLines");
}

id objc_msgSend_defaultSubtitleTextStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSubtitleTextStyle");
}

id objc_msgSend_defaultTitleFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultTitleFont");
}

id objc_msgSend_defaultTitleNumberOfLines(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultTitleNumberOfLines");
}

id objc_msgSend_defaultTitleTextStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultTitleTextStyle");
}

id objc_msgSend_defaultToInitialIndexZero(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultToInitialIndexZero");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_defaultsKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultsKey");
}

id objc_msgSend_defaultsNotifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultsNotifier");
}

id objc_msgSend_defaultsObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultsObserver");
}

id objc_msgSend_deferWork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deferWork:");
}

id objc_msgSend_deferredEpisodeUuids(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deferredEpisodeUuids");
}

id objc_msgSend_deferredWorkBlocks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deferredWorkBlocks");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_delegateCancelledErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegateCancelledErrorWithTransaction:underlyingError:");
}

id objc_msgSend_deleteAllContentInCtx_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllContentInCtx:error:");
}

id objc_msgSend_deleteAllInterestsBlockingCaller(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllInterestsBlockingCaller");
}

id objc_msgSend_deleteAllTopLevelStationsExcludingFolders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllTopLevelStationsExcludingFolders");
}

id objc_msgSend_deleteAllUPPMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllUPPMetadata");
}

id objc_msgSend_deleteButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteButton");
}

id objc_msgSend_deleteDuplicateVideoEpisodesForRdar59691904(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteDuplicateVideoEpisodesForRdar59691904");
}

id objc_msgSend_deleteEpisodeUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteEpisodeUuids:");
}

id objc_msgSend_deleteEpisodeUuids_forced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteEpisodeUuids:forced:");
}

id objc_msgSend_deleteEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteEpisodes:");
}

id objc_msgSend_deleteHistoryBeforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteHistoryBeforeDate:");
}

id objc_msgSend_deleteInteractionsWithGroupIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteInteractionsWithGroupIdentifier:completion:");
}

id objc_msgSend_deleteInteractionsWithIdentifiers_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteInteractionsWithIdentifiers:completion:");
}

id objc_msgSend_deleteItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteItems:");
}

id objc_msgSend_deleteMediaItems_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteMediaItems:completion:");
}

id objc_msgSend_deleteMigrationRegistryAtVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteMigrationRegistryAtVersion:");
}

id objc_msgSend_deleteObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteObject:");
}

id objc_msgSend_deleteOrUpdatePlaylist_ifIsDefault_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteOrUpdatePlaylist:ifIsDefault:");
}

id objc_msgSend_deleteOrphanedEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteOrphanedEpisodes");
}

id objc_msgSend_deletePlayedEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletePlayedEpisodes");
}

id objc_msgSend_deletePlayedEpisodesDefaultValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletePlayedEpisodesDefaultValue");
}

id objc_msgSend_deletePlayedEpisodesResolvedValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletePlayedEpisodesResolvedValue");
}

id objc_msgSend_deletePlayedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletePlayedText:");
}

id objc_msgSend_deletePlaylist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletePlaylist:");
}

id objc_msgSend_deletePodcastWithUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletePodcastWithUuid:");
}

id objc_msgSend_deleteRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteRowsAtIndexPaths:withRowAnimation:");
}

id objc_msgSend_deleteSearchableItemsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteSearchableItemsWithIdentifiers:");
}

id objc_msgSend_deleteSearchableItemsWithIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteSearchableItemsWithIdentifiers:completionHandler:");
}

id objc_msgSend_deleteSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteSections:withRowAnimation:");
}

id objc_msgSend_deleteStationAlertController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteStationAlertController");
}

id objc_msgSend_deletedEpisodeCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletedEpisodeCount");
}

id objc_msgSend_deletedEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletedEpisodes");
}

id objc_msgSend_dependantPropertyKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dependantPropertyKeys");
}

id objc_msgSend_dependentKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dependentKeys");
}

id objc_msgSend_dependentPropertyKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dependentPropertyKeys");
}

id objc_msgSend_deprecatedImageStoreURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deprecatedImageStoreURL");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_dequeueReusableCellWithReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");
}

id objc_msgSend_dequeueReusableHeaderFooterViewWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableHeaderFooterViewWithIdentifier:");
}

id objc_msgSend_dequeueReusableSupplementaryViewOfKind_withReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:");
}

id objc_msgSend_deregister(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deregister");
}

id objc_msgSend_derivedPropertiesForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "derivedPropertiesForPodcast:");
}

id objc_msgSend_derivedPropertyValueForKey_forPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "derivedPropertyValueForKey:forPodcast:");
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descender");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_descriptionBodyTextForEpisode_html_withAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionBodyTextForEpisode:html:withAttributes:");
}

id objc_msgSend_descriptionButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionButton");
}

id objc_msgSend_descriptionButtonFrameForDescriptionFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionButtonFrameForDescriptionFrame:");
}

id objc_msgSend_descriptionCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionCache");
}

id objc_msgSend_descriptionCacheForEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionCacheForEpisodeUuid:");
}

id objc_msgSend_descriptionExclusionPathsForOrigin_descriptionWidth_buttonsFrame_titleFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionExclusionPathsForOrigin:descriptionWidth:buttonsFrame:titleFrame:");
}

id objc_msgSend_descriptionFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionFont");
}

id objc_msgSend_descriptionFooterTextForEpisode_includesSeasonEpisodeType_includesDuration_includesPlayedIfPlayed_hasBodyText_unavailableReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionFooterTextForEpisode:includesSeasonEpisodeType:includesDuration:includesPlayedIfPlayed:hasBodyText:unavailableReason:");
}

id objc_msgSend_descriptionForEpisode_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionForEpisode:options:");
}

id objc_msgSend_descriptionForNotificationLogging(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionForNotificationLogging");
}

id objc_msgSend_descriptionForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionForState:");
}

id objc_msgSend_descriptionKeyForOptions_unavailableReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionKeyForOptions:unavailableReason:");
}

id objc_msgSend_descriptionMaxHeightForCurrentOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionMaxHeightForCurrentOrientation");
}

id objc_msgSend_descriptionNumberOfLinesForStyle_isTitleMultipleLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionNumberOfLinesForStyle:isTitleMultipleLines:");
}

id objc_msgSend_descriptionOriginForViewWidth_artworkFrame_buttonViewFrame_titleFrame_metadataFrame_iconViewFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionOriginForViewWidth:artworkFrame:buttonViewFrame:titleFrame:metadataFrame:iconViewFrame:style:");
}

id objc_msgSend_descriptionPrefixTextForEpisode_options_trailingNewline_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionPrefixTextForEpisode:options:trailingNewline:");
}

id objc_msgSend_descriptionTextForEpisode_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionTextForEpisode:options:");
}

id objc_msgSend_descriptionTextStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionTextStyle");
}

id objc_msgSend_descriptionTextView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionTextView");
}

id objc_msgSend_descriptionWidthForViewWidth_titleFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionWidthForViewWidth:titleFrame:style:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_deserialize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deserialize");
}

id objc_msgSend_deserializeOperationDidFinish_shouldReschedule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deserializeOperationDidFinish:shouldReschedule:");
}

id objc_msgSend_destroyAndRebuildDatabase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destroyAndRebuildDatabase");
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailTextLabel");
}

id objc_msgSend_determineCanSendNewEpisodeAlertsWithSchedulingOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "determineCanSendNewEpisodeAlertsWithSchedulingOptions:completion:");
}

id objc_msgSend_determineCompositeIndexWithIndex_fromManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "determineCompositeIndexWithIndex:fromManifest:");
}

id objc_msgSend_determineiTunesMatchEnabledWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "determineiTunesMatchEnabledWithCompletion:");
}

id objc_msgSend_deviceAgreedTermsVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceAgreedTermsVersion");
}

id objc_msgSend_deviceCapacityObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceCapacityObserver");
}

id objc_msgSend_dictionariesToMerge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionariesToMerge");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryByDecomposingQueryStringWithURLDecode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryByDecomposingQueryStringWithURLDecode:");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryToSecItemFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryToSecItemFormat:");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfURL:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_dictionaryWithValuesForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithValuesForKeys:");
}

id objc_msgSend_didBecomeActiveWhileMigrating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didBecomeActiveWhileMigrating");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_didDeletePersistentId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDeletePersistentId:");
}

id objc_msgSend_didDownloadFeedWithError_data_task_requestedUrl_useBackgroundFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDownloadFeedWithError:data:task:requestedUrl:useBackgroundFetch:");
}

id objc_msgSend_didEndRefreshing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didEndRefreshing");
}

id objc_msgSend_didFailToRegisterWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFailToRegisterWithError:");
}

id objc_msgSend_didFinishProcessingContextSaveHandlerForTests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFinishProcessingContextSaveHandlerForTests");
}

id objc_msgSend_didFinishUpdatingAllFeeds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFinishUpdatingAllFeeds:");
}

id objc_msgSend_didFinishUpdatingFeedUrl_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFinishUpdatingFeedUrl:withError:");
}

id objc_msgSend_didLoadChapters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didLoadChapters");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_didPerformActionInSheet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didPerformActionInSheet:");
}

id objc_msgSend_didRegisterWithToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didRegisterWithToken:");
}

id objc_msgSend_didRestoreFeedUrlTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didRestoreFeedUrlTask:");
}

id objc_msgSend_didRollbackStatusChangeWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didRollbackStatusChangeWithCompletion:");
}

id objc_msgSend_didStartUpdatingFeedUrl_cloudSyncUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStartUpdatingFeedUrl:cloudSyncUrl:");
}

id objc_msgSend_didTapStartButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didTapStartButton");
}

id objc_msgSend_didUpdateCompletionBlocks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateCompletionBlocks");
}

id objc_msgSend_dimmingView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dimmingView");
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "direction");
}

id objc_msgSend_dirtyKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dirtyKeys");
}

id objc_msgSend_disable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disable");
}

id objc_msgSend_disableRefreshControlWhileEditing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableRefreshControlWhileEditing");
}

id objc_msgSend_disableSubscriptionOnPodcastUUID_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableSubscriptionOnPodcastUUID:from:");
}

id objc_msgSend_disableSubscriptionsOnPodcastUUIDs_from_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableSubscriptionsOnPodcastUUIDs:from:context:");
}

id objc_msgSend_disableSubscriptionsWithUuids_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableSubscriptionsWithUuids:ctx:");
}

id objc_msgSend_disabledGroups(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disabledGroups");
}

id objc_msgSend_disabledReason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disabledReason");
}

id objc_msgSend_diskCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "diskCache");
}

id objc_msgSend_dismissActionSheet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissActionSheet");
}

id objc_msgSend_dismissActionSheetsAndPopovers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissActionSheetsAndPopovers");
}

id objc_msgSend_dismissNowPlayingAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissNowPlayingAnimated:");
}

id objc_msgSend_dismissNowPlayingAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissNowPlayingAnimated:completion:");
}

id objc_msgSend_dismissNowPlayingWithAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissNowPlayingWithAnimated:completion:");
}

id objc_msgSend_dismissOnTouchRecognizer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissOnTouchRecognizer");
}

id objc_msgSend_dismissPopover(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissPopover");
}

id objc_msgSend_dismissSearchOverlayController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissSearchOverlayController");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatchQueue");
}

id objc_msgSend_displayType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayType");
}

id objc_msgSend_displayURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayURL");
}

id objc_msgSend_distanceBetweenLabelFrames(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceBetweenLabelFrames");
}

id objc_msgSend_distanceBetweenLabelFramesWithTitleFont_subtitleFont_multilineTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceBetweenLabelFramesWithTitleFont:subtitleFont:multilineTitle:");
}

id objc_msgSend_distanceFromIndexPath_toIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceFromIndexPath:toIndexPath:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distantPast");
}

id objc_msgSend_dividerColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dividerColor");
}

id objc_msgSend_dividerView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dividerView");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_domainVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domainVersion");
}

id objc_msgSend_donateEpisodeUuid_stationUuid_isPlaybackFromSiri_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateEpisodeUuid:stationUuid:isPlaybackFromSiri:completion:");
}

id objc_msgSend_donateInteractionWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateInteractionWithCompletion:");
}

id objc_msgSend_donateManifestCurrentItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateManifestCurrentItem:");
}

id objc_msgSend_donateManifestCurrentItem_playReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateManifestCurrentItem:playReason:");
}

id objc_msgSend_donationQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donationQueue");
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downloadAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadAtIndex:");
}

id objc_msgSend_downloadButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadButton");
}

id objc_msgSend_downloadButtonFrameForActionButtonFrame_titleOriginY_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadButtonFrameForActionButtonFrame:titleOriginY:");
}

id objc_msgSend_downloadBytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadBytes");
}

id objc_msgSend_downloadCandidateMediaItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadCandidateMediaItems");
}

id objc_msgSend_downloadDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadDate");
}

id objc_msgSend_downloadDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadDescription");
}

id objc_msgSend_downloadEpisode_isFromSaving_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadEpisode:isFromSaving:");
}

id objc_msgSend_downloadIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadIdentifier");
}

id objc_msgSend_downloadImageForPodcastUuid_urlOptions_userInitiated_useBackgroundFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadImageForPodcastUuid:urlOptions:userInitiated:useBackgroundFetch:");
}

id objc_msgSend_downloadImageForPodcastUuid_urlOptions_userInitiated_useBackgroundFetch_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadImageForPodcastUuid:urlOptions:userInitiated:useBackgroundFetch:callback:");
}

id objc_msgSend_downloadImageUrl_cacheKey_userInitiated_backgroundFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadImageUrl:cacheKey:userInitiated:backgroundFetch:");
}

id objc_msgSend_downloadLimitPodcast(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadLimitPodcast");
}

id objc_msgSend_downloadLimitVideoPodcast(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadLimitVideoPodcast");
}

id objc_msgSend_downloadManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadManager");
}

id objc_msgSend_downloadManagerIfSetup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadManagerIfSetup");
}

id objc_msgSend_downloadOverdue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadOverdue");
}

id objc_msgSend_downloadPhase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadPhase");
}

id objc_msgSend_downloadPodcast_triggerBy_allowEpisodesTo404_isImplicitActionRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadPodcast:triggerBy:allowEpisodesTo404:isImplicitActionRequest:completion:");
}

id objc_msgSend_downloadProgress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadProgress");
}

id objc_msgSend_downloadSizeLimitForEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadSizeLimitForEpisode:");
}

id objc_msgSend_downloaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloaded");
}

id objc_msgSend_downloadedCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadedCount");
}

id objc_msgSend_downloadedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadedDate");
}

id objc_msgSend_downloadedFileHasiPodLibraryURLWithDiscoveryPoint_path_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadedFileHasiPodLibraryURLWithDiscoveryPoint:path:source:");
}

id objc_msgSend_downloadedQueryObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadedQueryObserver");
}

id objc_msgSend_downloadsNotifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadsNotifier");
}

id objc_msgSend_downloadsSettingsGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadsSettingsGroup");
}

id objc_msgSend_dryRun(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dryRun");
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dsid");
}

id objc_msgSend_dsidCheckTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dsidCheckTimestamp");
}

id objc_msgSend_dumpPlist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dumpPlist");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "duration");
}

id objc_msgSend_durationWatched(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "durationWatched");
}

id objc_msgSend_earliestBeginTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "earliestBeginTime");
}

id objc_msgSend_editButtonItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editButtonItem");
}

id objc_msgSend_editingControlRectInBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editingControlRectInBounds:");
}

id objc_msgSend_editingStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editingStyle");
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection");
}

id objc_msgSend_emptyPropertySet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emptyPropertySet");
}

id objc_msgSend_enable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enable");
}

id objc_msgSend_enableAssetDeletionIfPossible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableAssetDeletionIfPossible");
}

id objc_msgSend_enableAssetDeletionIfPossible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableAssetDeletionIfPossible:");
}

id objc_msgSend_enableSubscriptionOnPodcastUUID_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableSubscriptionOnPodcastUUID:from:");
}

id objc_msgSend_enableSubscriptionOnPodcastUuid_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableSubscriptionOnPodcastUuid:ctx:");
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enabled");
}

id objc_msgSend_enclosureURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enclosureURL");
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedQueryStringFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodedQueryStringFromDictionary:");
}

id objc_msgSend_endBackgroundTask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endBackgroundTask");
}

id objc_msgSend_endBackgroundTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endBackgroundTask:");
}

id objc_msgSend_endGeneratingLibraryChangeNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endGeneratingLibraryChangeNotifications");
}

id objc_msgSend_endGeneratingLibraryChangeNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endGeneratingLibraryChangeNotifications:");
}

id objc_msgSend_endIgnoringInteractionEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endIgnoringInteractionEvents");
}

id objc_msgSend_endListeningForChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endListeningForChanges");
}

id objc_msgSend_endObserving(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endObserving");
}

id objc_msgSend_endOfTrack(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endOfTrack");
}

id objc_msgSend_endRefreshing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endRefreshing");
}

id objc_msgSend_endTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTimer:");
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endUpdates");
}

id objc_msgSend_endedEpisodeUuids(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endedEpisodeUuids");
}

id objc_msgSend_engagementRequestForFullSheet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementRequestForFullSheet");
}

id objc_msgSend_enqueueWorkBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueWorkBlock:");
}

id objc_msgSend_enqueuedByAnotherUser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueuedByAnotherUser");
}

id objc_msgSend_entitiesByName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entitiesByName");
}

id objc_msgSend_entitledDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entitledDuration");
}

id objc_msgSend_entitledEnclosureURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entitledEnclosureURL");
}

id objc_msgSend_entitledPriceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entitledPriceType");
}

id objc_msgSend_entitledTranscriptIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entitledTranscriptIdentifier");
}

id objc_msgSend_entitledTranscriptProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entitledTranscriptProvider");
}

id objc_msgSend_entitledTranscriptSnippet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entitledTranscriptSnippet");
}

id objc_msgSend_entitlementState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entitlementState");
}

id objc_msgSend_entity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entity");
}

id objc_msgSend_entityForName_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entityForName:inManagedObjectContext:");
}

id objc_msgSend_entityLoadingBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entityLoadingBlock");
}

id objc_msgSend_entityName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entityName");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateUnvisitedItemUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateUnvisitedItemUuids:");
}

id objc_msgSend_enumerateValuesForProperties_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateValuesForProperties:usingBlock:");
}

id objc_msgSend_episode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episode");
}

id objc_msgSend_episodeAdamId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeAdamId");
}

id objc_msgSend_episodeAdamIds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeAdamIds");
}

id objc_msgSend_episodeArtworkProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeArtworkProperties");
}

id objc_msgSend_episodeCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeCache");
}

id objc_msgSend_episodeCacheForStoreMediaDictionaries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeCacheForStoreMediaDictionaries:");
}

id objc_msgSend_episodeCacheWithPredicate_inCtx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeCacheWithPredicate:inCtx:");
}

id objc_msgSend_episodeCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeCount");
}

id objc_msgSend_episodeDisplayGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeDisplayGroup");
}

id objc_msgSend_episodeForAssetUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForAssetUrl:");
}

id objc_msgSend_episodeForDownloadAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForDownloadAtIndex:");
}

id objc_msgSend_episodeForEnclosure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForEnclosure:");
}

id objc_msgSend_episodeForGuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForGuid:");
}

id objc_msgSend_episodeForPersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForPersistentID:");
}

id objc_msgSend_episodeForPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForPlayerItem:");
}

id objc_msgSend_episodeForTitle_pubDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForTitle:pubDate:");
}

id objc_msgSend_episodeForUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForUUID:");
}

id objc_msgSend_episodeForUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeForUuid:");
}

id objc_msgSend_episodeGUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeGUID");
}

id objc_msgSend_episodeGuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeGuid");
}

id objc_msgSend_episodeIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeIdentifier");
}

id objc_msgSend_episodeIntents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeIntents");
}

id objc_msgSend_episodeLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeLimit");
}

id objc_msgSend_episodeLimitDefaultValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeLimitDefaultValue");
}

id objc_msgSend_episodeLimitForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeLimitForKey:");
}

id objc_msgSend_episodeLimitResolvedValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeLimitResolvedValue");
}

id objc_msgSend_episodeLockup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeLockup");
}

id objc_msgSend_episodeMigrationForVersion0to1_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion0to1:");
}

id objc_msgSend_episodeMigrationForVersion13to14_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion13to14:");
}

id objc_msgSend_episodeMigrationForVersion16to17_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion16to17:");
}

id objc_msgSend_episodeMigrationForVersion17to18_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion17to18:");
}

id objc_msgSend_episodeMigrationForVersion21to22_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion21to22:");
}

id objc_msgSend_episodeMigrationForVersion23to24_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion23to24:");
}

id objc_msgSend_episodeMigrationForVersion24to25_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion24to25:");
}

id objc_msgSend_episodeMigrationForVersion29to30_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion29to30:");
}

id objc_msgSend_episodeMigrationForVersion6to7_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeMigrationForVersion6to7:");
}

id objc_msgSend_episodeNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeNumber");
}

id objc_msgSend_episodeObjectID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeObjectID");
}

id objc_msgSend_episodeObserverForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeObserverForPodcastUuid:");
}

id objc_msgSend_episodeObservers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeObservers");
}

id objc_msgSend_episodeOrderSettingsGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeOrderSettingsGroup");
}

id objc_msgSend_episodePredicateForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodePredicateForPodcast:");
}

id objc_msgSend_episodeResultsChangedForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeResultsChangedForPodcastUuid:");
}

id objc_msgSend_episodeSection_didChangeObject_atIndex_forChangeType_newIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeSection:didChangeObject:atIndex:forChangeType:newIndex:");
}

id objc_msgSend_episodeSection_didChangeObject_atIndexPath_forChangeType_newIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeSection:didChangeObject:atIndexPath:forChangeType:newIndexPath:");
}

id objc_msgSend_episodeSerpentID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeSerpentID");
}

id objc_msgSend_episodeShareUrl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeShareUrl");
}

id objc_msgSend_episodeSortDescriptorsForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeSortDescriptorsForPodcast:");
}

id objc_msgSend_episodeStoreId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeStoreId");
}

id objc_msgSend_episodeSyncStorage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeSyncStorage");
}

id objc_msgSend_episodeType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeType");
}

id objc_msgSend_episodeTypeResolvedValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeTypeResolvedValue");
}

id objc_msgSend_episodeUUIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeUUIDs");
}

id objc_msgSend_episodeUuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeUuid");
}

id objc_msgSend_episodeUuidForActivity_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeUuidForActivity:completion:");
}

id objc_msgSend_episodeUuidForDownloadWithAdamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeUuidForDownloadWithAdamID:");
}

id objc_msgSend_episodeUuidForSetPlaybackQueueRequestIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeUuidForSetPlaybackQueueRequestIdentifier:");
}

id objc_msgSend_episodeUuidObserver_resultsChangedForPodcast_withDeletedIds_andInsertIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeUuidObserver:resultsChangedForPodcast:withDeletedIds:andInsertIds:");
}

id objc_msgSend_episodeUuids(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeUuids");
}

id objc_msgSend_episodeWithValue_forPropertyKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodeWithValue:forPropertyKey:");
}

id objc_msgSend_episodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodes");
}

id objc_msgSend_episodesInLatestSeasonWithLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodesInLatestSeasonWithLimit:");
}

id objc_msgSend_episodesOptionArray_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodesOptionArray:defaultValue:");
}

id objc_msgSend_episodesOptionValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodesOptionValues");
}

id objc_msgSend_episodesToKeepDefaultValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodesToKeepDefaultValue");
}

id objc_msgSend_episodesToKeepSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodesToKeepSetting");
}

id objc_msgSend_episodesToKeepToEpisodeLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodesToKeepToEpisodeLimit:");
}

id objc_msgSend_episodesToShow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodesToShow");
}

id objc_msgSend_episodesWithMissingAdamIdsForPodcast_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "episodesWithMissingAdamIdsForPodcast:withContext:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "error");
}

id objc_msgSend_errorCannotGenerateInternalURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorCannotGenerateInternalURL");
}

id objc_msgSend_errorCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorCode");
}

id objc_msgSend_errorComment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorComment");
}

id objc_msgSend_errorDomain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorDomain");
}

id objc_msgSend_errorLog(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorLog");
}

id objc_msgSend_errorStatusCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorStatusCode");
}

id objc_msgSend_errorURLDoesNotExist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorURLDoesNotExist");
}

id objc_msgSend_errorURLInvalid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorURLInvalid");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_evaluateWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateWithObject:");
}

id objc_msgSend_eventId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventId");
}

id objc_msgSend_eventWithAccessLog_dataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventWithAccessLog:dataSource:");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "events");
}

id objc_msgSend_exactDescriptionSizeForOrigin_viewWidth_titleFrame_actionButtonFrame_downloadButtonFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exactDescriptionSizeForOrigin:viewWidth:titleFrame:actionButtonFrame:downloadButtonFrame:style:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_executeAction_using_andToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeAction:using:andToken:");
}

id objc_msgSend_executeFetchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeFetchRequest:");
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeFetchRequest:error:");
}

id objc_msgSend_executeRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeRequest:error:");
}

id objc_msgSend_existingDownloadedEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingDownloadedEpisodes");
}

id objc_msgSend_existingEpisodeWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingEpisodeWithID:");
}

id objc_msgSend_existingObjectWithID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingObjectWithID:error:");
}

id objc_msgSend_exists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exists:");
}

id objc_msgSend_expandFeedUrls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expandFeedUrls:");
}

id objc_msgSend_expandedIndexPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expandedIndexPath");
}

id objc_msgSend_expirationBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expirationBlock");
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expirationDate");
}

id objc_msgSend_explicit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "explicit");
}

id objc_msgSend_explicitIcon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "explicitIcon");
}

id objc_msgSend_explicitIconView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "explicitIconView");
}

id objc_msgSend_explicitSortOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "explicitSortOrder");
}

id objc_msgSend_exposeActionsAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exposeActionsAnimated:");
}

id objc_msgSend_exposedActions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exposedActions");
}

id objc_msgSend_externalFeedDownloader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "externalFeedDownloader");
}

id objc_msgSend_externalGuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "externalGuid");
}

id objc_msgSend_externalType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "externalType");
}

id objc_msgSend_externallyProcessedMOIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "externallyProcessedMOIDs");
}

id objc_msgSend_fairPlayKeyLoader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fairPlayKeyLoader");
}

id objc_msgSend_fairPlayKeySession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fairPlayKeySession");
}

id objc_msgSend_fairPlayMigrationBackgroundTask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fairPlayMigrationBackgroundTask");
}

id objc_msgSend_fairPlayMigrationRetryCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fairPlayMigrationRetryCount");
}

id objc_msgSend_fairPlayValidationManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fairPlayValidationManager");
}

id objc_msgSend_falsePredicate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "falsePredicate");
}

id objc_msgSend_fatalSyncError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fatalSyncError");
}

id objc_msgSend_feedChangedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedChangedDate");
}

id objc_msgSend_feedDeleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedDeleted");
}

id objc_msgSend_feedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedDescription");
}

id objc_msgSend_feedDownloadedWithError_task_requestedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedDownloadedWithError:task:requestedUrl:");
}

id objc_msgSend_feedManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedManager");
}

id objc_msgSend_feedProcessingQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedProcessingQueue");
}

id objc_msgSend_feedSections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedSections");
}

id objc_msgSend_feedURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedURL");
}

id objc_msgSend_feedURLComposer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedURLComposer");
}

id objc_msgSend_feedURLForOptionalURL_adamID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedURLForOptionalURL:adamID:error:");
}

id objc_msgSend_feedURLIsEmpty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedURLIsEmpty");
}

id objc_msgSend_feedUpdateAllPodcastsOnForeground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedUpdateAllPodcastsOnForeground");
}

id objc_msgSend_feedUpdateBeginTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedUpdateBeginTime");
}

id objc_msgSend_feedUpdateNeedsRetry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedUpdateNeedsRetry");
}

id objc_msgSend_feedUpdatesDisabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedUpdatesDisabled");
}

id objc_msgSend_feedUrl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedUrl");
}

id objc_msgSend_feedUrlFromModernKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedUrlFromModernKey:");
}

id objc_msgSend_feedUrlsToParams(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedUrlsToParams");
}

id objc_msgSend_fetchActiveAccountWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchActiveAccountWithCompletion:");
}

id objc_msgSend_fetchArtworkForPlayerItem_contentItem_atTime_ofSize_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchArtworkForPlayerItem:contentItem:atTime:ofSize:completion:");
}

id objc_msgSend_fetchBatchSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchBatchSize");
}

id objc_msgSend_fetchChannelUpdatesCheckingEntitlementsNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchChannelUpdatesCheckingEntitlementsNotification");
}

id objc_msgSend_fetchEntityName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchEntityName");
}

id objc_msgSend_fetchFeedsExpectedToUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchFeedsExpectedToUpdate");
}

id objc_msgSend_fetchHistoryAfterToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchHistoryAfterToken:");
}

id objc_msgSend_fetchImageWithTemplateURL_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchImageWithTemplateURL:completionHandler:");
}

id objc_msgSend_fetchInfoCenterArtworkWith_at_of_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchInfoCenterArtworkWith:at:of:completion:");
}

id objc_msgSend_fetchLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLimit");
}

id objc_msgSend_fetchManagedObjectModelFromDisk(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchManagedObjectModelFromDisk");
}

id objc_msgSend_fetchMediaDataForEpisodeStoreId_podcastStoreId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMediaDataForEpisodeStoreId:podcastStoreId:completion:");
}

id objc_msgSend_fetchOutOfDateShowUUIDsWith_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchOutOfDateShowUUIDsWith:completionHandler:");
}

id objc_msgSend_fetchOutOfDateShowUUIDsWithIncludeImplicit_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchOutOfDateShowUUIDsWithIncludeImplicit:completionHandler:");
}

id objc_msgSend_fetchPlayerItemsFor_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPlayerItemsFor:completion:");
}

id objc_msgSend_fetchPlayerItemsForPlaybackQueueRequestIdentifiers_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPlayerItemsForPlaybackQueueRequestIdentifiers:completion:");
}

id objc_msgSend_fetchPlayerItemsForPlaybackQueueRequestIdentifiers_initiatedByAnotherUser_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPlayerItemsForPlaybackQueueRequestIdentifiers:initiatedByAnotherUser:completion:");
}

id objc_msgSend_fetchPlayerItemsForStoreTrackIDs_initiatedByAnotherUser_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPlayerItemsForStoreTrackIDs:initiatedByAnotherUser:completion:");
}

id objc_msgSend_fetchPredicate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchPredicate");
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRequest");
}

id objc_msgSend_fetchRequestForIndexType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRequestForIndexType:");
}

id objc_msgSend_fetchRequestForIndexType_additionalPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRequestForIndexType:additionalPredicate:");
}

id objc_msgSend_fetchRequestInManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRequestInManagedObjectContext:");
}

id objc_msgSend_fetchRequestWithEntityName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRequestWithEntityName:");
}

id objc_msgSend_fetchedObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchedObjects");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExtension");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileSize");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileType");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPathComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPathComponents:");
}

id objc_msgSend_filter_compactMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filter:compactMap:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_findDuplicateItemsWithEntity_itemsToLookAtFilter_keysThatMustMatchToBeConsideredADuplicate_keysThatShouldNotBeDuplicated_keyValuesOfDuplicatedItemsToReturn_sortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findDuplicateItemsWithEntity:itemsToLookAtFilter:keysThatMustMatchToBeConsideredADuplicate:keysThatShouldNotBeDuplicated:keyValuesOfDuplicatedItemsToReturn:sortDescriptors:");
}

id objc_msgSend_findEpisodeByFeedURL_guid_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findEpisodeByFeedURL:guid:inContext:");
}

id objc_msgSend_findEpisodeByStoreID_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findEpisodeByStoreID:inContext:");
}

id objc_msgSend_findEpisodeWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findEpisodeWithRequest:");
}

id objc_msgSend_findIndexOfCommand_inArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findIndexOfCommand:inArray:");
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finish");
}

id objc_msgSend_finishSuccessfulTransactionWithNewVersion_finishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishSuccessfulTransactionWithNewVersion:finishedBlock:");
}

id objc_msgSend_finishTaskOperationWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishTaskOperationWithResult:error:");
}

id objc_msgSend_finishWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithResult:");
}

id objc_msgSend_finishWithStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithStatus:");
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finished");
}

id objc_msgSend_finishedHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedHandler");
}

id objc_msgSend_finishedWithoutURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedWithoutURL");
}

id objc_msgSend_firstAttribute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstAttribute");
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstIndex");
}

id objc_msgSend_firstItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstItem");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstTimeAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstTimeAvailable");
}

id objc_msgSend_firstTimeAvailableAsFree(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstTimeAvailableAsFree");
}

id objc_msgSend_firstTimeAvailableAsPaid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstTimeAvailableAsPaid");
}

id objc_msgSend_firstValidIndexPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstValidIndexPath");
}

id objc_msgSend_fixEmptyTextContainers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fixEmptyTextContainers");
}

id objc_msgSend_fixupDataMigrationVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fixupDataMigrationVersion");
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flags");
}

id objc_msgSend_floatForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatForKey:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValue");
}

id objc_msgSend_flushInvocations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flushInvocations");
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "font");
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorWithSymbolicTraits:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_footerAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "footerAttributedString:");
}

id objc_msgSend_footerAttributedString_additionalAttributeName_additionalAttributeValue_additionalAttributeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "footerAttributedString:additionalAttributeName:additionalAttributeValue:additionalAttributeRange:");
}

id objc_msgSend_footerCallback(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "footerCallback");
}

id objc_msgSend_footerFrameForDescriptionButtonFrame_descriptionFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "footerFrameForDescriptionButtonFrame:descriptionFrame:");
}

id objc_msgSend_footerText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "footerText");
}

id objc_msgSend_footerTextStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "footerTextStyle");
}

id objc_msgSend_footerTextView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "footerTextView");
}

id objc_msgSend_forceFetchLatestChannelUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceFetchLatestChannelUpdates");
}

id objc_msgSend_forceUpdateDatabaseFromMediaLibraryWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceUpdateDatabaseFromMediaLibraryWithCompletion:");
}

id objc_msgSend_foreground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foreground");
}

id objc_msgSend_formatArtworkUrlWithString_for_cropCode_fileExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formatArtworkUrlWithString:for:cropCode:fileExtension:");
}

id objc_msgSend_formatDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formatDate:");
}

id objc_msgSend_forwardInvocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forwardInvocation:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frame");
}

id objc_msgSend_frc(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frc");
}

id objc_msgSend_freeDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "freeDuration");
}

id objc_msgSend_freeEnclosureURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "freeEnclosureURL");
}

id objc_msgSend_freePriceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "freePriceType");
}

id objc_msgSend_freeTranscriptIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "freeTranscriptIdentifier");
}

id objc_msgSend_freeTranscriptProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "freeTranscriptProvider");
}

id objc_msgSend_freeTranscriptSnippet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "freeTranscriptSnippet");
}

id objc_msgSend_friendlyDisplayString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "friendlyDisplayString");
}

id objc_msgSend_generateChangesForExistingObjects_newObjects_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateChangesForExistingObjects:newObjects:inSection:");
}

id objc_msgSend_generatedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatedDate");
}

id objc_msgSend_generator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generator");
}

id objc_msgSend_generator_didChangeObject_atIndexPath_forChangeType_newIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generator:didChangeObject:atIndexPath:forChangeType:newIndexPath:");
}

id objc_msgSend_genericError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "genericError");
}

id objc_msgSend_getAllTasksWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAllTasksWithCompletionHandler:");
}

id objc_msgSend_getBadgeNumberWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBadgeNumberWithCompletionHandler:");
}

id objc_msgSend_getContinuationStreamsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getContinuationStreamsWithCompletionHandler:");
}

id objc_msgSend_getDeliveredNotificationsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDeliveredNotificationsWithCompletionHandler:");
}

id objc_msgSend_getHomeUserIdForSharedUserId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHomeUserIdForSharedUserId:completion:");
}

id objc_msgSend_getNotificationSettingsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNotificationSettingsWithCompletionHandler:");
}

id objc_msgSend_getNowPlayingInfoForMagicMomentInfoCenterWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getNowPlayingInfoForMagicMomentInfoCenterWithCompletion:");
}

id objc_msgSend_getObjectId_andIndexPath_forItemWithUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getObjectId:andIndexPath:forItemWithUuid:");
}

id objc_msgSend_getPendingNotificationRequestsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPendingNotificationRequestsWithCompletionHandler:");
}

id objc_msgSend_getPendingTaskRequestsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPendingTaskRequestsWithCompletionHandler:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getStoreInfoForEpisodesWithAdamIds_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStoreInfoForEpisodesWithAdamIds:callback:");
}

id objc_msgSend_getStoreInfoForPodcastWithAdamId_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStoreInfoForPodcastWithAdamId:callback:");
}

id objc_msgSend_globalDownloadPolicyRequiresMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "globalDownloadPolicyRequiresMigration");
}

id objc_msgSend_globalImageURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "globalImageURL");
}

id objc_msgSend_globalRetentionPolicy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "globalRetentionPolicy");
}

id objc_msgSend_globallyUniqueString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "globallyUniqueString");
}

id objc_msgSend_goneDarkColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "goneDarkColor");
}

id objc_msgSend_group(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "group");
}

id objc_msgSend_groupFooter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupFooter");
}

id objc_msgSend_groupSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSettings");
}

id objc_msgSend_groupTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupTitle");
}

id objc_msgSend_groupWithTitle_footerText_settings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupWithTitle:footerText:settings:");
}

id objc_msgSend_groupWithTitle_footerText_settingsHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupWithTitle:footerText:settingsHandler:");
}

id objc_msgSend_groupedFooterConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupedFooterConfiguration");
}

id objc_msgSend_groups(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groups");
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "guid");
}

id objc_msgSend_halfPlayedIcon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "halfPlayedIcon");
}

id objc_msgSend_handleEventsForBackgroundURLSessionFor_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEventsForBackgroundURLSessionFor:completionHandler:");
}

id objc_msgSend_handleEventsForBackgroundURLSessionWithIdentifier_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEventsForBackgroundURLSessionWithIdentifier:handler:");
}

id objc_msgSend_handleNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleNotification:");
}

id objc_msgSend_handleNotificationResponse_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleNotificationResponse:bag:");
}

id objc_msgSend_handlePodcastsUrlScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePodcastsUrlScheme:");
}

id objc_msgSend_handleiTMSUrlScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleiTMSUrlScheme:");
}

id objc_msgSend_handlers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlers");
}

id objc_msgSend_hasAccountChangedSinceLastSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAccountChangedSinceLastSync");
}

id objc_msgSend_hasAnyObjectsInEntity_satisfyingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAnyObjectsInEntity:satisfyingPredicate:");
}

id objc_msgSend_hasArtworkForShow_withDimensions_fromSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasArtworkForShow:withDimensions:fromSource:");
}

id objc_msgSend_hasAuthenticatedTooRecentlyForTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAuthenticatedTooRecentlyForTransaction:error:");
}

id objc_msgSend_hasBackoff(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBackoff");
}

id objc_msgSend_hasBeenInactiveForTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBeenInactiveForTimeInterval:");
}

id objc_msgSend_hasBeenIndexed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBeenIndexed");
}

id objc_msgSend_hasBeenPlayed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBeenPlayed");
}

id objc_msgSend_hasBeenPlayedForPlayState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBeenPlayedForPlayState:");
}

id objc_msgSend_hasBeenSynced(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBeenSynced");
}

id objc_msgSend_hasBookmarksSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBookmarksSync");
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasChanges");
}

id objc_msgSend_hasCheckQueued(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasCheckQueued");
}

id objc_msgSend_hasData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasData");
}

id objc_msgSend_hasDefaultInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasDefaultInstance");
}

id objc_msgSend_hasDeferredIndexAll(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasDeferredIndexAll");
}

id objc_msgSend_hasDeletes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasDeletes");
}

id objc_msgSend_hasDeterminedActualGlobalCellularState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasDeterminedActualGlobalCellularState");
}

id objc_msgSend_hasEnabledSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasEnabledSettings");
}

id objc_msgSend_hasEndedVisitingEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasEndedVisitingEpisode:");
}

id objc_msgSend_hasEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasEpisodes");
}

id objc_msgSend_hasFRCChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasFRCChanges");
}

id objc_msgSend_hasFetchedInitialAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasFetchedInitialAccount");
}

id objc_msgSend_hasHTML(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasHTML");
}

id objc_msgSend_hasIndexingOperationInProgress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasIndexingOperationInProgress");
}

id objc_msgSend_hasInserts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasInserts");
}

id objc_msgSend_hasInsertsForEntityNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasInsertsForEntityNames:");
}

id objc_msgSend_hasInterestSyncVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasInterestSyncVersion");
}

id objc_msgSend_hasItemForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasItemForKey:");
}

id objc_msgSend_hasLocalChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasLocalChanges");
}

id objc_msgSend_hasLocalChangesToSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasLocalChangesToSync");
}

id objc_msgSend_hasObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasObjects");
}

id objc_msgSend_hasOnlyPaidEpisodesWithoutSubscription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasOnlyPaidEpisodesWithoutSubscription");
}

id objc_msgSend_hasPerformedLegacyBadgeMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPerformedLegacyBadgeMigration");
}

id objc_msgSend_hasPerformedLegacyBadgeMigrationKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPerformedLegacyBadgeMigrationKey");
}

id objc_msgSend_hasPlaylistSyncVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPlaylistSyncVersion");
}

id objc_msgSend_hasPodcastSyncV3Version(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPodcastSyncV3Version");
}

id objc_msgSend_hasPodcastSyncVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPodcastSyncVersion");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasReportedThisEpisode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasReportedThisEpisode");
}

id objc_msgSend_hasResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasResults");
}

id objc_msgSend_hasRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasRowAtIndexPath:");
}

id objc_msgSend_hasRowsInSectionAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasRowsInSectionAtIndex:");
}

id objc_msgSend_hasSectionNameKeyPathChanged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSectionNameKeyPathChanged");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hasUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasUpdates");
}

id objc_msgSend_hasUserRecentlyAcceptedSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasUserRecentlyAcceptedSync");
}

id objc_msgSend_hasVideo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasVideo");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hash");
}

id objc_msgSend_haveMediaLibraryPropertiesChangedForEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "haveMediaLibraryPropertiesChangedForEpisode:");
}

id objc_msgSend_headerAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerAction");
}

id objc_msgSend_headerCallback(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerCallback");
}

id objc_msgSend_headerText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerText");
}

id objc_msgSend_headerTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerTitle");
}

id objc_msgSend_headerTitleFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerTitleFont");
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerView");
}

id objc_msgSend_headerViewForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerViewForSection:");
}

id objc_msgSend_heightForRowWithDescription_inGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightForRowWithDescription:inGroupWithIdentifier:");
}

id objc_msgSend_heightForSeparatorInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightForSeparatorInsets:");
}

id objc_msgSend_heightForWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightForWidth:");
}

id objc_msgSend_heightForWidth_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightForWidth:style:");
}

id objc_msgSend_hexString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hexString");
}

id objc_msgSend_hidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hidden");
}

id objc_msgSend_hideActionsAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideActionsAnimated:");
}

id objc_msgSend_hidesPlayedEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hidesPlayedEpisodes");
}

id objc_msgSend_hidesSideViewWhenEditing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hidesSideViewWhenEditing");
}

id objc_msgSend_highlightsProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "highlightsProvider");
}

id objc_msgSend_hitTest_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hitTest:withEvent:");
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalSizeClass");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "host");
}

id objc_msgSend_iTunesAccountDidChangeForACAccountNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iTunesAccountDidChangeForACAccountNotification:");
}

id objc_msgSend_iTunesMatchEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iTunesMatchEnabled");
}

id objc_msgSend_ic_privateListeningEnabledForHomeUsers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_privateListeningEnabledForHomeUsers");
}

id objc_msgSend_ic_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_sharedAccountStore");
}

id objc_msgSend_ic_storeAccountForHomeUserIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_storeAccountForHomeUserIdentifier:completion:");
}

id objc_msgSend_ic_storeAccountForStoreAccountID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_storeAccountForStoreAccountID:completion:");
}

id objc_msgSend_ic_storeAccountForStoreAccountID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ic_storeAccountForStoreAccountID:error:");
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "icon");
}

id objc_msgSend_iconView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iconView");
}

id objc_msgSend_iconWithSystemImageName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iconWithSystemImageName:");
}

id objc_msgSend_iconsViewFrameForViewWidth_titleFrame_metadataFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iconsViewFrameForViewWidth:titleFrame:metadataFrame:style:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierComposer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierComposer");
}

id objc_msgSend_identifierPromise(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierPromise");
}

id objc_msgSend_identifierWithFeedUrl_storeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierWithFeedUrl:storeIdentifier:");
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifiers");
}

id objc_msgSend_im_addAttribute_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_addAttribute:value:");
}

id objc_msgSend_im_addPropertiesWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_addPropertiesWithDictionary:");
}

id objc_msgSend_im_appendImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_appendImage:");
}

id objc_msgSend_im_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_appendString:");
}

id objc_msgSend_im_distanceFromLastBaselineToBottom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_distanceFromLastBaselineToBottom");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "image");
}

id objc_msgSend_image_inRect_withBacking_opaque_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "image:inRect:withBacking:opaque:scale:");
}

id objc_msgSend_imageFlippedForRightToLeftLayoutDirection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageFlippedForRightToLeftLayoutDirection");
}

id objc_msgSend_imageForIconKey_theme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForIconKey:theme:");
}

id objc_msgSend_imageForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForKey:");
}

id objc_msgSend_imageForKey_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForKey:size:");
}

id objc_msgSend_imageInMemoryForKey_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageInMemoryForKey:size:");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imagePadding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imagePadding");
}

id objc_msgSend_imageProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageProvider");
}

id objc_msgSend_imageRectForContentRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageRectForContentRect:");
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageURL");
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageView");
}

id objc_msgSend_imageWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithData:");
}

id objc_msgSend_imageWithImageData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithImageData:");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_imageWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithSize:");
}

id objc_msgSend_immediatelyDeleteAllHiddenPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "immediatelyDeleteAllHiddenPodcasts");
}

id objc_msgSend_importContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importContext");
}

id objc_msgSend_importDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importDate");
}

id objc_msgSend_importPlaylist_intoContext_mediaLibraryCache_knownPlaylistIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importPlaylist:intoContext:mediaLibraryCache:knownPlaylistIds:");
}

id objc_msgSend_importPlaylists_knownPlaylistIds_mediaLibraryCache_playlists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importPlaylists:knownPlaylistIds:mediaLibraryCache:playlists:");
}

id objc_msgSend_importRemotePodcastDicts_inContext_visitingPodcastsInCache_updatingPodcastsToAdd_updatingPodcastsToUnsubscribe_mismatch_version_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importRemotePodcastDicts:inContext:visitingPodcastsInCache:updatingPodcastsToAdd:updatingPodcastsToUnsubscribe:mismatch:version:");
}

id objc_msgSend_importedShowArtworkURLFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importedShowArtworkURLFor:");
}

id objc_msgSend_importing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importing");
}

id objc_msgSend_inContextKeyDataFor_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inContextKeyDataFor:ctx:");
}

id objc_msgSend_inFlightAuthRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inFlightAuthRequests");
}

id objc_msgSend_inactiveIntervalForDownloadPolicyUpgrade(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inactiveIntervalForDownloadPolicyUpgrade");
}

id objc_msgSend_includesAllPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "includesAllPodcasts");
}

id objc_msgSend_incremementPlayCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incremementPlayCount");
}

id objc_msgSend_incrementSize_duration_forFeedURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incrementSize:duration:forFeedURL:");
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "index");
}

id objc_msgSend_indexAllBatchGenerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexAllBatchGenerator");
}

id objc_msgSend_indexAllCompletions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexAllCompletions");
}

id objc_msgSend_indexAllDataWithSearchableIndex_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexAllDataWithSearchableIndex:completionHandler:");
}

id objc_msgSend_indexForDownload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexForDownload:");
}

id objc_msgSend_indexForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexForSection:");
}

id objc_msgSend_indexForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexForValue:");
}

id objc_msgSend_indexOfController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfController:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPath");
}

id objc_msgSend_indexPathForCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForCell:");
}

id objc_msgSend_indexPathForFirstRow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForFirstRow");
}

id objc_msgSend_indexPathForFirstRowInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForFirstRowInSection:");
}

id objc_msgSend_indexPathForFocusableRowAfterIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForFocusableRowAfterIndexPath:");
}

id objc_msgSend_indexPathForFocusableRowBeforeIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForFocusableRowBeforeIndexPath:");
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForItem:inSection:");
}

id objc_msgSend_indexPathForLastRowInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForLastRowInSection:");
}

id objc_msgSend_indexPathForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForObject:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_indexPathForRowAfterIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForRowAfterIndexPath:");
}

id objc_msgSend_indexPathForRowBeforeIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForRowBeforeIndexPath:");
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForSelectedRow");
}

id objc_msgSend_indexPathForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForSetting:");
}

id objc_msgSend_indexPathIsCurrentlySelectedRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathIsCurrentlySelectedRow:");
}

id objc_msgSend_indexPathShifter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathShifter");
}

id objc_msgSend_indexPathWithIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathWithIndex:");
}

id objc_msgSend_indexPathsForVisibleRows(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathsForVisibleRows");
}

id objc_msgSend_indexSearchableItems_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSearchableItems:completionHandler:");
}

id objc_msgSend_indexSetWithIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSetWithIndex:");
}

id objc_msgSend_indexSetWithIndexesInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSetWithIndexesInRange:");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_indexingBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexingBlock");
}

id objc_msgSend_indexingQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexingQueue");
}

id objc_msgSend_indicatedBitrate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indicatedBitrate");
}

id objc_msgSend_infoCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infoCenter");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infoDictionary");
}

id objc_msgSend_infoIcon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infoIcon");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init");
}

id objc_msgSend_init_nonAppInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init:nonAppInitiated:");
}

id objc_msgSend_initSupportsPlayback_supportsLocalMedia_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initSupportsPlayback:supportsLocalMedia:");
}

id objc_msgSend_initWithAccessLogEvent_dataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccessLogEvent:dataSource:");
}

id objc_msgSend_initWithAccount_presentingViewController_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:presentingViewController:options:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithAdamID_avAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAdamID:avAsset:");
}

id objc_msgSend_initWithAnnotator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAnnotator:");
}

id objc_msgSend_initWithAppBundleID_playerID_origin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppBundleID:playerID:origin:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithAssetInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAssetInfo:");
}

id objc_msgSend_initWithAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAttributedString:");
}

id objc_msgSend_initWithBackgroundTaskManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBackgroundTaskManager:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBlock:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCategory_name_title_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCategory:name:title:handler:");
}

id objc_msgSend_initWithCloudSyncBugReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCloudSyncBugReporter:");
}

id objc_msgSend_initWithCode_userActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCode:userActivity:");
}

id objc_msgSend_initWithCollectionViewLayout_libraryActionControllerBridge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCollectionViewLayout:libraryActionControllerBridge:");
}

id objc_msgSend_initWithConcurrentOperationCount_requestEncodingType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConcurrentOperationCount:requestEncodingType:");
}

id objc_msgSend_initWithCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCondition:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithConfiguration_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:bag:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithControllers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithControllers:");
}

id objc_msgSend_initWithCustomView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCustomView:");
}

id objc_msgSend_initWithData_MIMEType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:MIMEType:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:");
}

id objc_msgSend_initWithDataSource_applicationActivities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:applicationActivities:");
}

id objc_msgSend_initWithDataSource_bagContext_andTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:bagContext:andTask:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDictionaryRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionaryRepresentation:");
}

id objc_msgSend_initWithDomain_baseURLForGETAll_baseURLForPUTAll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:baseURLForGETAll:baseURLForPUTAll:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithDownloadManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDownloadManager:");
}

id objc_msgSend_initWithEntity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntity:");
}

id objc_msgSend_initWithEntity_insertIntoManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntity:insertIntoManagedObjectContext:");
}

id objc_msgSend_initWithEntityName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntityName:");
}

id objc_msgSend_initWithEntityName_predicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntityName:predicate:");
}

id objc_msgSend_initWithEntityName_predicate_sortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntityName:predicate:sortDescriptors:");
}

id objc_msgSend_initWithEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEpisode:");
}

id objc_msgSend_initWithEpisodeAdamId_assetInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEpisodeAdamId:assetInfo:");
}

id objc_msgSend_initWithEpisodeAdamIds_assetInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEpisodeAdamIds:assetInfo:");
}

id objc_msgSend_initWithEpisodeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEpisodeIdentifier:");
}

id objc_msgSend_initWithEpisodeRemovalManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEpisodeRemovalManager:");
}

id objc_msgSend_initWithEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEpisodeUuid:");
}

id objc_msgSend_initWithExpirationBlock_debugDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExpirationBlock:debugDescription:");
}

id objc_msgSend_initWithExpirationHandler_debugInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExpirationHandler:debugInfo:");
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:target:attributes:");
}

id objc_msgSend_initWithFeedUrl_storeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFeedUrl:storeIdentifier:");
}

id objc_msgSend_initWithFetchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFetchRequest:");
}

id objc_msgSend_initWithFetchRequest_managedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFetchRequest:managedObjectContext:");
}

id objc_msgSend_initWithFetchRequest_managedObjectContext_sectionNameKeyPath_cacheName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:");
}

id objc_msgSend_initWithFetchRequest_propertyKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFetchRequest:propertyKeys:");
}

id objc_msgSend_initWithFocusedView_touchAllowance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFocusedView:touchAllowance:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_collectionViewLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:collectionViewLayout:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithHandlerQueue_taskTimeout_assertionTimeout_debugDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandlerQueue:taskTimeout:assertionTimeout:debugDescription:");
}

id objc_msgSend_initWithHandlerQueue_taskTimeout_assertionTimeout_debugDescription_reportMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandlerQueue:taskTimeout:assertionTimeout:debugDescription:reportMetrics:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_title_type_artwork_artist_topics_namedEntities_privateMediaItemValueData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:title:type:artwork:artist:topics:namedEntities:privateMediaItemValueData:");
}

id objc_msgSend_initWithIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIds:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithImage_highlightedImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:highlightedImage:");
}

id objc_msgSend_initWithImage_titleText_descriptionText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:titleText:descriptionText:");
}

id objc_msgSend_initWithIndexesInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIndexesInRange:");
}

id objc_msgSend_initWithInitialEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInitialEpisodeUuid:");
}

id objc_msgSend_initWithInitialEpisodeUuid_fetchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInitialEpisodeUuid:fetchRequest:");
}

id objc_msgSend_initWithInitialEpisodeUuid_newestToOldest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInitialEpisodeUuid:newestToOldest:");
}

id objc_msgSend_initWithInitialEpisodeUuid_predicateToTrack_sortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:");
}

id objc_msgSend_initWithInitialEpisodeUuid_sectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInitialEpisodeUuid:sectionType:");
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInt:");
}

id objc_msgSend_initWithIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIntent:");
}

id objc_msgSend_initWithIntent_response_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIntent:response:");
}

id objc_msgSend_initWithItemContentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItemContentType:");
}

id objc_msgSend_initWithItemProvider_properties_placeholderImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItemProvider:properties:placeholderImage:");
}

id objc_msgSend_initWithItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItems:");
}

id objc_msgSend_initWithItems_initialIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItems:initialIndex:");
}

id objc_msgSend_initWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:ascending:");
}

id objc_msgSend_initWithKey_processor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:processor:");
}

id objc_msgSend_initWithKeysAndProcessors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeysAndProcessors:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithLoggingCategory_dictionariesToMerge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLoggingCategory:dictionariesToMerge:");
}

id objc_msgSend_initWithMediaItems_mediaContainer_playShuffled_playbackRepeatMode_resumePlayback_playbackQueueLocation_playbackSpeed_mediaSearch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMediaItems:mediaContainer:playShuffled:playbackRepeatMode:resumePlayback:playbackQueueLocation:playbackSpeed:mediaSearch:");
}

id objc_msgSend_initWithMediaQuery_initialItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMediaQuery:initialItem:");
}

id objc_msgSend_initWithMetricsSender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMetricsSender:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithName_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:bundleIdentifier:");
}

id objc_msgSend_initWithName_payload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:payload:");
}

id objc_msgSend_initWithName_title_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:title:");
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:value:");
}

id objc_msgSend_initWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObject:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithOption_largeTitleDisplayMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOption:largeTitleDisplayMode:");
}

id objc_msgSend_initWithOptionsDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptionsDictionary:");
}

id objc_msgSend_initWithPlaybackQueueRef_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlaybackQueueRef:");
}

id objc_msgSend_initWithPlayerController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlayerController:");
}

id objc_msgSend_initWithPlayerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlayerID:");
}

id objc_msgSend_initWithPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlayerItem:");
}

id objc_msgSend_initWithPlayerItem_selectedReferenceTime_selectedPlayerTime_currentPlayerTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlayerItem:selectedReferenceTime:selectedPlayerTime:currentPlayerTime:");
}

id objc_msgSend_initWithPlayerItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlayerItems:");
}

id objc_msgSend_initWithPlaylistUuid_initialEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlaylistUuid:initialEpisodeUuid:");
}

id objc_msgSend_initWithPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPodcast:");
}

id objc_msgSend_initWithPodcastAdamId_assetInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPodcastAdamId:assetInfo:");
}

id objc_msgSend_initWithPodcastAdamId_siriAssetInfo_oldestEpisode_initiatedByAnotherUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPodcastAdamId:siriAssetInfo:oldestEpisode:initiatedByAnotherUser:");
}

id objc_msgSend_initWithPodcastDetails_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPodcastDetails:");
}

id objc_msgSend_initWithPredicate_entityName_ctx_properties_fetchProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPredicate:entityName:ctx:properties:fetchProperties:");
}

id objc_msgSend_initWithPredicate_inCtx_extraProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPredicate:inCtx:extraProperties:");
}

id objc_msgSend_initWithPresentedViewController_presentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPresentedViewController:presentingViewController:");
}

id objc_msgSend_initWithPrivacyIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPrivacyIdentifier:");
}

id objc_msgSend_initWithProperties_defaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProperties:defaults:");
}

id objc_msgSend_initWithReason_entityLoadingBlock_searchableIndex_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReason:entityLoadingBlock:searchableIndex:completion:");
}

id objc_msgSend_initWithRecipient_useCase_account_urlProtocolDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecipient:useCase:account:urlProtocolDelegate:");
}

id objc_msgSend_initWithRequest_bag_presentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:bag:presentingViewController:");
}

id objc_msgSend_initWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReuseIdentifier:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithShortcut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithShortcut:");
}

id objc_msgSend_initWithShouldContinue_createdPodcastUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithShouldContinue:createdPodcastUUID:");
}

id objc_msgSend_initWithShowName_episodeName_creatorName_publishDate_artwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithShowName:episodeName:creatorName:publishDate:artwork:");
}

id objc_msgSend_initWithSourceURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSourceURL:");
}

id objc_msgSend_initWithStartingIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartingIndexPath:");
}

id objc_msgSend_initWithStationId_assetInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStationId:assetInfo:");
}

id objc_msgSend_initWithStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStorage:");
}

id objc_msgSend_initWithStorage_config_cloudSyncBugReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStorage:config:cloudSyncBugReporter:");
}

id objc_msgSend_initWithStorageProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStorageProvider:");
}

id objc_msgSend_initWithStorageProvider_cloudSyncBugReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStorageProvider:cloudSyncBugReporter:");
}

id objc_msgSend_initWithStorageProviderDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStorageProviderDelegate:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:reuseIdentifier:");
}

id objc_msgSend_initWithSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSyncType:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:");
}

id objc_msgSend_initWithTitle_actionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:actionHandler:");
}

id objc_msgSend_initWithTitle_icon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:icon:");
}

id objc_msgSend_initWithTitle_image_selectedImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:image:selectedImage:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_initWithTopic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTopic:");
}

id objc_msgSend_initWithTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTransaction:");
}

id objc_msgSend_initWithTransaction_response_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTransaction:response:");
}

id objc_msgSend_initWithType_clientIdentifier_clientVersion_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:clientIdentifier:clientVersion:bag:");
}

id objc_msgSend_initWithType_domain_URL_keys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:domain:URL:keys:");
}

id objc_msgSend_initWithType_localizedTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:localizedTitle:");
}

id objc_msgSend_initWithType_localizedTitle_localizedSubtitle_icon_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:options:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_initWithURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURLString:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUpNextManifest_userManifest_loadQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUpNextManifest:userManifest:loadQueue:");
}

id objc_msgSend_initWithUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUrl:");
}

id objc_msgSend_initWithUrl_nonAppInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUrl:nonAppInitiated:");
}

id objc_msgSend_initWithUuid_storeTrackId_bestTitle_bestSummary_pubDate_duration_byteSize_isVideo_sortPropertyValues_podcastUuid_podcastTitle_podcastStoreCollectionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUuid:storeTrackId:bestTitle:bestSummary:pubDate:duration:byteSize:isVideo:sortPropertyValues:podcastUuid:podcastTitle:podcastStoreCollectionId:");
}

id objc_msgSend_initWithUuid_title_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUuid:title:");
}

id objc_msgSend_initWithWorkQueue_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWorkQueue:identifier:");
}

id objc_msgSend_initialAutosyncNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initialAutosyncNeeded");
}

id objc_msgSend_initialEpisodeUuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initialEpisodeUuid");
}

id objc_msgSend_initialFeedUpdateCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initialFeedUpdateCount");
}

id objc_msgSend_initialIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initialIndex");
}

id objc_msgSend_initialIndexPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initialIndexPath");
}

id objc_msgSend_initialPlayheadPosition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initialPlayheadPosition");
}

id objc_msgSend_initialSubscribedPodcastsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initialSubscribedPodcastsCount");
}

id objc_msgSend_initializeFrc(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeFrc");
}

id objc_msgSend_initiatedByAnotherUser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initiatedByAnotherUser");
}

id objc_msgSend_insertAfterContextItemID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertAfterContextItemID");
}

id objc_msgSend_insertEpisodeUuids_intoPlaybackQueueAtPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertEpisodeUuids:intoPlaybackQueueAtPosition:");
}

id objc_msgSend_insertIntoPlaybackQueueCommand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertIntoPlaybackQueueCommand");
}

id objc_msgSend_insertNewEpisodeInManagedObjectContext_canSendNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertNewEpisodeInManagedObjectContext:canSendNotifications:");
}

id objc_msgSend_insertNewImplicitFollowIfNeededForPlayerItem_from_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertNewImplicitFollowIfNeededForPlayerItem:from:completion:");
}

id objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertNewObjectForEntityForName:inManagedObjectContext:");
}

id objc_msgSend_insertNewPlaylistInManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertNewPlaylistInManagedObjectContext:");
}

id objc_msgSend_insertNewPlaylistInManagedObjectContext_uuid_defaultSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertNewPlaylistInManagedObjectContext:uuid:defaultSettings:");
}

id objc_msgSend_insertNewPodcastInManagedObjectContext_subscribed_feedUrl_showType_showTypeInFeed_title_author_provider_imageUrl_description_displayType_showSpecificUpsellCopy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertNewPodcastInManagedObjectContext:subscribed:feedUrl:showType:showTypeInFeed:title:author:provider:imageUrl:description:displayType:showSpecificUpsellCopy:");
}

id objc_msgSend_insertNewPodcastInManagedObjectContext_subscribed_feedUrl_showType_title_author_provider_imageUrl_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertNewPodcastInManagedObjectContext:subscribed:feedUrl:showType:title:author:provider:imageUrl:description:");
}

id objc_msgSend_insertNewSettingsInManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertNewSettingsInManagedObjectContext:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertObjects_atIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObjects:atIndexes:");
}

id objc_msgSend_insertPlayerItems_intoPlaybackQueueAtPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertPlayerItems:intoPlaybackQueueAtPosition:");
}

id objc_msgSend_insertRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertRowsAtIndexPaths:withRowAnimation:");
}

id objc_msgSend_insertSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSections:withRowAnimation:");
}

id objc_msgSend_insertSubview_aboveSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:aboveSubview:");
}

id objc_msgSend_insertSubview_below_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:below:");
}

id objc_msgSend_insertSubview_belowSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:belowSubview:");
}

id objc_msgSend_insertedAndUpdatedObjectIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertedAndUpdatedObjectIDs");
}

id objc_msgSend_insertionPosition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertionPosition");
}

id objc_msgSend_instanceIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instanceIdentifier");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerForEpisodesToShow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForEpisodesToShow");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intent");
}

id objc_msgSend_interaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interaction");
}

id objc_msgSend_interactionClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interactionClass");
}

id objc_msgSend_interestSyncVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interestSyncVersion");
}

id objc_msgSend_internalAppDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalAppDelegate");
}

id objc_msgSend_internetNotReachable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internetNotReachable");
}

id objc_msgSend_interruptEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interruptEvent");
}

id objc_msgSend_intersectOrderedSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectOrderedSet:");
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectSet:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateAndCancel");
}

id objc_msgSend_invalidateArtwork(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateArtwork");
}

id objc_msgSend_invalidateArtworkForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateArtworkForPodcast:");
}

id objc_msgSend_invalidateAsset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateAsset");
}

id objc_msgSend_invalidateLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateLayout");
}

id objc_msgSend_invalidateLayoutMargins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateLayoutMargins");
}

id objc_msgSend_invalidatePlaybackQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidatePlaybackQueue");
}

id objc_msgSend_invalidateSizeMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateSizeMetrics");
}

id objc_msgSend_invalidateTranscriptAssetForAdamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateTranscriptAssetForAdamID:");
}

id objc_msgSend_invalidationManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidationManager");
}

id objc_msgSend_invocationWithMethodSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invocationWithMethodSignature:");
}

id objc_msgSend_invokeTaskCompletionBlocksWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeTaskCompletionBlocksWithBlock:");
}

id objc_msgSend_invokeWithTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeWithTarget:");
}

id objc_msgSend_isAValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAValue:");
}

id objc_msgSend_isAccountsChangedError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAccountsChangedError");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isActive");
}

id objc_msgSend_isAdded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAdded");
}

id objc_msgSend_isAirplaneModeEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAirplaneModeEnabled");
}

id objc_msgSend_isAppleMusicEpisode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAppleMusicEpisode");
}

id objc_msgSend_isAppleNewsEpisode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAppleNewsEpisode");
}

id objc_msgSend_isAppleTVRoute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAppleTVRoute");
}

id objc_msgSend_isAudio(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAudio");
}

id objc_msgSend_isAuthenticatedDark(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAuthenticatedDark");
}

id objc_msgSend_isAuthenticatedWithQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAuthenticatedWithQueue:completionHandler:");
}

id objc_msgSend_isAuthenticationError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAuthenticationError");
}

id objc_msgSend_isAuthenticationValidForTransaction_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAuthenticationValidForTransaction:error:");
}

id objc_msgSend_isBackCatalogItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBackCatalogItem");
}

id objc_msgSend_isBookmarksSyncDirtyFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBookmarksSyncDirtyFor:");
}

id objc_msgSend_isBuiltIn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBuiltIn");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isCenteredLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCenteredLayout");
}

id objc_msgSend_isCompilation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCompilation");
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isComplete");
}

id objc_msgSend_isCorrupt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCorrupt");
}

id objc_msgSend_isCurrentEpisodeDownloaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCurrentEpisodeDownloaded");
}

id objc_msgSend_isCurrentPlayerItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCurrentPlayerItem");
}

id objc_msgSend_isDark(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDark");
}

id objc_msgSend_isDebugUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDebugUrl:");
}

id objc_msgSend_isDefaultSettingsForPlaylist_title_episodesToShow_showPlayedEpisodes_includeAllPodcasts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDefaultSettingsForPlaylist:title:episodesToShow:showPlayedEpisodes:includeAllPodcasts:");
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeleted");
}

id objc_msgSend_isDeletingPersistentId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeletingPersistentId:");
}

id objc_msgSend_isDestructive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDestructive");
}

id objc_msgSend_isDeviceRoute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeviceRoute");
}

id objc_msgSend_isDeviceStorageSpaceAvailableForPersistence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeviceStorageSpaceAvailableForPersistence");
}

id objc_msgSend_isDirty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDirty");
}

id objc_msgSend_isDisabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDisabled");
}

id objc_msgSend_isDownloaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDownloaded");
}

id objc_msgSend_isDragging(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDragging");
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEditing");
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEmpty");
}

id objc_msgSend_isEmpty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEmpty:");
}

id objc_msgSend_isEmptyNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEmptyNumber:");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEnabledForGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabledForGroupWithIdentifier:");
}

id objc_msgSend_isEntitled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEntitled");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToAttributedString:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToOrderedSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToOrderedSet:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExecuting");
}

id objc_msgSend_isExpanded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExpanded");
}

id objc_msgSend_isExplicit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExplicit");
}

id objc_msgSend_isExplicitContentAllowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExplicitContentAllowed");
}

id objc_msgSend_isExplicitForStorePlatformDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExplicitForStorePlatformDictionary:");
}

id objc_msgSend_isExternalType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExternalType");
}

id objc_msgSend_isFileExpired_inDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFileExpired:inDirectory:");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFileURL");
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFinished");
}

id objc_msgSend_isFloating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFloating");
}

id objc_msgSend_isFolder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFolder");
}

id objc_msgSend_isFromITunesSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFromITunesSync");
}

id objc_msgSend_isFutureWithTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFutureWithTimestamp:");
}

id objc_msgSend_isGenius(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isGenius");
}

id objc_msgSend_isGlobalCellularEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isGlobalCellularEnabled");
}

id objc_msgSend_isHLSPlaylist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHLSPlaylist");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHidden");
}

id objc_msgSend_isHomePodRoute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHomePodRoute");
}

id objc_msgSend_isHorizontallyCompact(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHorizontallyCompact");
}

id objc_msgSend_isHorizontallyRegular(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHorizontallyRegular");
}

id objc_msgSend_isITunesU(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isITunesU");
}

id objc_msgSend_isIdle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIdle");
}

id objc_msgSend_isImplicitlyFollowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isImplicitlyFollowed");
}

id objc_msgSend_isInPodcastDetailsUnplayedTab(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInPodcastDetailsUnplayedTab");
}

id objc_msgSend_isInUserEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInUserEpisodes");
}

id objc_msgSend_isInitialPrepare(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInitialPrepare");
}

id objc_msgSend_isInteractive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInteractive");
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInternalInstall");
}

id objc_msgSend_isItunesPlaylist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isItunesPlaylist");
}

id objc_msgSend_isItunesSmartPlaylist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isItunesSmartPlaylist");
}

id objc_msgSend_isItunesU(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isItunesU");
}

id objc_msgSend_isLabelMultipleLinesWithFrame_font_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLabelMultipleLinesWithFrame:font:");
}

id objc_msgSend_isLessThanDaysOld_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLessThanDaysOld:");
}

id objc_msgSend_isLibrarySyncEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLibrarySyncEnabled");
}

id objc_msgSend_isLicenseKeyExpiredError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLicenseKeyExpiredError:");
}

id objc_msgSend_isLicenseKeyIntegrityError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLicenseKeyIntegrityError:");
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLoaded");
}

id objc_msgSend_isLocal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocal");
}

id objc_msgSend_isLocalSetPlaybackQueueURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocalSetPlaybackQueueURLString:");
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLowPowerModeEnabled");
}

id objc_msgSend_isMacIdiom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMacIdiom");
}

id objc_msgSend_isManifestRestorationOngoing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isManifestRestorationOngoing");
}

id objc_msgSend_isMedia(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMedia");
}

id objc_msgSend_isMediaItemSyncedFromiTunes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMediaItemSyncedFromiTunes:");
}

id objc_msgSend_isMigrating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMigrating");
}

id objc_msgSend_isMigrationPossible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMigrationPossible");
}

id objc_msgSend_isMissingAsset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMissingAsset");
}

id objc_msgSend_isMissingAssetForItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMissingAssetForItem:");
}

id objc_msgSend_isMissingFilePathForItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMissingFilePathForItem:");
}

id objc_msgSend_isMomCompatible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMomCompatible:");
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMultiUser");
}

id objc_msgSend_isMultiplayerHost(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMultiplayerHost");
}

id objc_msgSend_isMyPodcastsTabSelected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMyPodcastsTabSelected");
}

id objc_msgSend_isNetworkingBlocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNetworkingBlocked");
}

id objc_msgSend_isNew(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNew");
}

id objc_msgSend_isNewInstall(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNewInstall");
}

id objc_msgSend_isNonFollowedShowsSyncDirty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNonFollowedShowsSyncDirty");
}

id objc_msgSend_isNotEmpty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNotEmpty");
}

id objc_msgSend_isNotEmpty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNotEmpty:");
}

id objc_msgSend_isNotEmptyNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNotEmptyNumber:");
}

id objc_msgSend_isNotSubscribable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNotSubscribable");
}

id objc_msgSend_isOTAPurchased(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOTAPurchased");
}

id objc_msgSend_isObserving(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isObserving");
}

id objc_msgSend_isOfflineAsset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOfflineAsset");
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOn");
}

id objc_msgSend_isOnTheGo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOnTheGo");
}

id objc_msgSend_isOpen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOpen");
}

id objc_msgSend_isPackagedMedia(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPackagedMedia");
}

id objc_msgSend_isPartiallyOffTheTop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPartiallyOffTheTop");
}

id objc_msgSend_isPartiallyPlayed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPartiallyPlayed");
}

id objc_msgSend_isPartiallyPlayedBackCatalogItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPartiallyPlayedBackCatalogItem");
}

id objc_msgSend_isPastAutodownloadOrEpisodeLimitDark(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPastAutodownloadOrEpisodeLimitDark");
}

id objc_msgSend_isPausable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPausable");
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlaceholder");
}

id objc_msgSend_isPlaybackActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlaybackActive");
}

id objc_msgSend_isPlaybackRequested(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlaybackRequested");
}

id objc_msgSend_isPlayed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlayed");
}

id objc_msgSend_isPlayerManifestRestored(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlayerManifestRestored");
}

id objc_msgSend_isPlayerTargetLocal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlayerTargetLocal");
}

id objc_msgSend_isPlayhead_resumableForDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlayhead:resumableForDuration:");
}

id objc_msgSend_isPlayheadResumable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlayheadResumable");
}

id objc_msgSend_isPlayingEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlayingEpisodeUuid:");
}

id objc_msgSend_isPlayingFromManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlayingFromManifest:");
}

id objc_msgSend_isPlayingFromUpNext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlayingFromUpNext");
}

id objc_msgSend_isPlayingLocally(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlayingLocally");
}

id objc_msgSend_isPlaylistSyncDirty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlaylistSyncDirty");
}

id objc_msgSend_isPodcastUpdatable_userInitiated_forced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPodcastUpdatable:userInitiated:forced:");
}

id objc_msgSend_isPodcastsCellularDownloadsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPodcastsCellularDownloadsEnabled");
}

id objc_msgSend_isPresentedModally(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPresentedModally");
}

id objc_msgSend_isPrimaryUserActiveAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPrimaryUserActiveAccount");
}

id objc_msgSend_isPrivateListeningEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPrivateListeningEnabled");
}

id objc_msgSend_isReachable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isReachable");
}

id objc_msgSend_isReachableViaCellular(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isReachableViaCellular");
}

id objc_msgSend_isRecoverableError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRecoverableError");
}

id objc_msgSend_isRedirectURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRedirectURL:");
}

id objc_msgSend_isRefreshing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRefreshing");
}

id objc_msgSend_isRequestingImmediatePlayback(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRequestingImmediatePlayback");
}

id objc_msgSend_isResetable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isResetable");
}

id objc_msgSend_isResolvingError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isResolvingError");
}

id objc_msgSend_isRestricted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRestricted");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isRunningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunningInStoreDemoMode");
}

id objc_msgSend_isRunningOnHomepod(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunningOnHomepod");
}

id objc_msgSend_isRunningOnInternalOS(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunningOnInternalOS");
}

id objc_msgSend_isRunningOnTV(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunningOnTV");
}

id objc_msgSend_isRunningOnVisionOS(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunningOnVisionOS");
}

id objc_msgSend_isScrollEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isScrollEnabled");
}

id objc_msgSend_isSeekingOrScrubbing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSeekingOrScrubbing");
}

id objc_msgSend_isSeparatorHidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSeparatorHidden");
}

id objc_msgSend_isSerialPodcast(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSerialPodcast");
}

id objc_msgSend_isSerialShowTypeInFeed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSerialShowTypeInFeed");
}

id objc_msgSend_isServerRevisionNewerThanClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isServerRevisionNewerThanClient:");
}

id objc_msgSend_isShareable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isShareable");
}

id objc_msgSend_isSharedContentWithContentAdamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSharedContentWithContentAdamId:");
}

id objc_msgSend_isSmart(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSmart");
}

id objc_msgSend_isStateRestorationActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStateRestorationActivity");
}

id objc_msgSend_isStopping(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStopping");
}

id objc_msgSend_isStoppingLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStoppingLock");
}

id objc_msgSend_isStreamable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStreamable");
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubclassOfClass:");
}

id objc_msgSend_isSubscribeCommandURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubscribeCommandURLString:");
}

id objc_msgSend_isSubscribedToPodcastWithUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubscribedToPodcastWithUuid:");
}

id objc_msgSend_isSubscribingWithFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubscribingWithFeedUrl:");
}

id objc_msgSend_isSubscriptionSyncDirtyFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubscriptionSyncDirtyFor:");
}

id objc_msgSend_isSupportedUrlString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSupportedUrlString:");
}

id objc_msgSend_isSyncing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSyncing");
}

id objc_msgSend_isTargetPlaying(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTargetPlaying");
}

id objc_msgSend_isToday(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isToday");
}

id objc_msgSend_isTransactionCancelledError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTransactionCancelledError");
}

id objc_msgSend_isUngroupedList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUngroupedList");
}

id objc_msgSend_isUniversalPlaybackIdentifierURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUniversalPlaybackIdentifierURLString:");
}

id objc_msgSend_isUnplayed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUnplayed");
}

id objc_msgSend_isUpdating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUpdating");
}

id objc_msgSend_isUpdatingFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUpdatingFeedUrl:");
}

id objc_msgSend_isUserLoggedIn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUserLoggedIn");
}

id objc_msgSend_isValidShowTypeSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidShowTypeSetting:");
}

id objc_msgSend_isVerticalLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isVerticalLayout");
}

id objc_msgSend_isVideo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isVideo");
}

id objc_msgSend_isVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isVideo:");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isViewLoaded");
}

id objc_msgSend_isVisuallyPlayed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isVisuallyPlayed");
}

id objc_msgSend_isVolumeControlAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isVolumeControlAvailable");
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "item");
}

id objc_msgSend_itemDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemDescription");
}

id objc_msgSend_itemDescriptionHasHTML(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemDescriptionHasHTML");
}

id objc_msgSend_itemDescriptionWithoutHTML(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemDescriptionWithoutHTML");
}

id objc_msgSend_itemFilePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemFilePath");
}

id objc_msgSend_itemIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemIdentifier");
}

id objc_msgSend_itemSummary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemSummary");
}

id objc_msgSend_itemTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemTitle");
}

id objc_msgSend_itemType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemType");
}

id objc_msgSend_itemWithMPMediaItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemWithMPMediaItem:");
}

id objc_msgSend_itemWithMPMediaItem_isRestoreDownloadCandidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemWithMPMediaItem:isRestoreDownloadCandidate:");
}

id objc_msgSend_itemWithPersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemWithPersistentID:");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "items");
}

id objc_msgSend_itunesSubtitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itunesSubtitle");
}

id objc_msgSend_itunesTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itunesTitle");
}

id objc_msgSend_jumpBackwardsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jumpBackwardsWithCompletion:");
}

id objc_msgSend_jumpForwardsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jumpForwardsWithCompletion:");
}

id objc_msgSend_kIsPlayingKeyPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kIsPlayingKeyPath");
}

id objc_msgSend_keepEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keepEpisodes");
}

id objc_msgSend_keepsFeedFileInTempDirAfterDownload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keepsFeedFileInTempDirAfterDownload");
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "key");
}

id objc_msgSend_keyImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyImage");
}

id objc_msgSend_keyProcessorPairProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyProcessorPairProvider");
}

id objc_msgSend_keyRequestLicenseErrorDomain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyRequestLicenseErrorDomain");
}

id objc_msgSend_keyStorage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyStorage");
}

id objc_msgSend_keyValueStoreController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreController");
}

id objc_msgSend_keyValueStoreController_shouldScheduleTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreController:shouldScheduleTransaction:");
}

id objc_msgSend_keyValueStoreController_transaction_didCancelWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreController:transaction:didCancelWithError:");
}

id objc_msgSend_keyValueStoreController_transaction_didFailWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreController:transaction:didFailWithError:");
}

id objc_msgSend_keyValueStoreController_transactionDidFinish_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreController:transactionDidFinish:");
}

id objc_msgSend_keyValueStoreDataCurrentRevision(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreDataCurrentRevision");
}

id objc_msgSend_keyValueStoreDataFirstRevision(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreDataFirstRevision");
}

id objc_msgSend_keyValueStoreDisabledErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreDisabledErrorWithTransaction:underlyingError:");
}

id objc_msgSend_keyValueStoreErrorWithCode_localizedDescription_transaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreErrorWithCode:localizedDescription:transaction:underlyingError:");
}

id objc_msgSend_keyValueStoreItemIdentifierForItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreItemIdentifierForItem:");
}

id objc_msgSend_keyValueStoreOperation_scheduleURLRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreOperation:scheduleURLRequest:");
}

id objc_msgSend_keyValueStoreOperationOperationDidFinish_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStoreOperationOperationDidFinish:");
}

id objc_msgSend_keyValueStorePayload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStorePayload");
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWindow");
}

id objc_msgSend_keyWithPrefix_assetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWithPrefix:assetID:");
}

id objc_msgSend_keyedArtworkForShow_size_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyedArtworkForShow:size:completionHandler:");
}

id objc_msgSend_keys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keys");
}

id objc_msgSend_keysAndProcessorsForAllBookkeeperKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysAndProcessorsForAllBookkeeperKeys");
}

id objc_msgSend_keysAndProcessorsForBookmarksSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysAndProcessorsForBookmarksSync");
}

id objc_msgSend_keysAndProcessorsForCriticalBookkeeperKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysAndProcessorsForCriticalBookkeeperKeys");
}

id objc_msgSend_keysAndProcessorsForInterestSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysAndProcessorsForInterestSync");
}

id objc_msgSend_keysAndProcessorsForNonFollowedShowsSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysAndProcessorsForNonFollowedShowsSync");
}

id objc_msgSend_keysAndProcessorsForSubscriptionsAndStationsSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysAndProcessorsForSubscriptionsAndStationsSync");
}

id objc_msgSend_keysAndProcessorsForTermsVersionSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysAndProcessorsForTermsVersionSync");
}

id objc_msgSend_keysForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysForTransaction:");
}

id objc_msgSend_keysOfEntriesPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysOfEntriesPassingTest:");
}

id objc_msgSend_killSwitchErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "killSwitchErrorWithTransaction:underlyingError:");
}

id objc_msgSend_kvsController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kvsController");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "label");
}

id objc_msgSend_labelInset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelInset");
}

id objc_msgSend_labelSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelSize");
}

id objc_msgSend_labelStackViewDidChangeHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelStackViewDidChangeHeight:");
}

id objc_msgSend_lastAppUseDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastAppUseDate");
}

id objc_msgSend_lastBookmarkedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastBookmarkedDate");
}

id objc_msgSend_lastBookmarksSyncTimestampForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastBookmarksSyncTimestampForSyncType:");
}

id objc_msgSend_lastCheckTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastCheckTime");
}

id objc_msgSend_lastDatePlayed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastDatePlayed");
}

id objc_msgSend_lastImplicitlyFollowedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastImplicitlyFollowedDate");
}

id objc_msgSend_lastModifiedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastModifiedDate");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastPlaybackPositionSaveTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPlaybackPositionSaveTime");
}

id objc_msgSend_lastPlaybackSaveTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPlaybackSaveTime");
}

id objc_msgSend_lastPlayedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPlayedDate");
}

id objc_msgSend_lastRecordedItemURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastRecordedItemURL");
}

id objc_msgSend_lastRemovedFromUpNextDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastRemovedFromUpNextDate");
}

id objc_msgSend_lastStoreEpisodesInfoCheckDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastStoreEpisodesInfoCheckDate");
}

id objc_msgSend_lastStorePodcastInfoCheckDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastStorePodcastInfoCheckDate");
}

id objc_msgSend_lastSyncTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastSyncTimestamp");
}

id objc_msgSend_lastSyncedDomainVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastSyncedDomainVersion");
}

id objc_msgSend_lastTouchDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastTouchDate");
}

id objc_msgSend_lastUnfollowedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastUnfollowedDate");
}

id objc_msgSend_lastUserMarkedAsPlayedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastUserMarkedAsPlayedDate");
}

id objc_msgSend_latestEpisodeDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latestEpisodeDate");
}

id objc_msgSend_latestExitFromDarkDownloads(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latestExitFromDarkDownloads");
}

id objc_msgSend_latestSeasonNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latestSeasonNumber");
}

id objc_msgSend_latestUPPSubtask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latestUPPSubtask");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutAttributesForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutAttributesForItemAtIndexPath:");
}

id objc_msgSend_layoutAttributesForSupplementaryViewOfKind_atIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:");
}

id objc_msgSend_layoutAttributesForSupplementaryViewOfKind_withIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_layoutManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutManager");
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutMargins");
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutMarginsGuide");
}

id objc_msgSend_lazyAttributedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lazyAttributedDescription");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_leadingMarginForViewWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leadingMarginForViewWidth:");
}

id objc_msgSend_leftAccessoryView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leftAccessoryView");
}

id objc_msgSend_leftEditingAccessoryView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leftEditingAccessoryView");
}

id objc_msgSend_legacyFetchArtworkForPlayerItem_contentItem_atTime_ofSize_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "legacyFetchArtworkForPlayerItem:contentItem:atTime:ofSize:completion:");
}

id objc_msgSend_legacyLibraryPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "legacyLibraryPath");
}

id objc_msgSend_legacyPlayCountForPlayState_playCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "legacyPlayCountForPlayState:playCount:");
}

id objc_msgSend_legacyUICachedArtworkForPodcastUuid_withSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "legacyUICachedArtworkForPodcastUuid:withSize:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_lenientSharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lenientSharedInstance");
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "library");
}

id objc_msgSend_libraryActionControllerBridge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "libraryActionControllerBridge");
}

id objc_msgSend_libraryDataProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "libraryDataProvider");
}

id objc_msgSend_libraryDataVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "libraryDataVersion");
}

id objc_msgSend_libraryPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "libraryPath");
}

id objc_msgSend_libraryShmPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "libraryShmPath");
}

id objc_msgSend_libraryWalPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "libraryWalPath");
}

id objc_msgSend_lineFragmentRectForGlyphAtIndex_effectiveRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lineFragmentRectForGlyphAtIndex:effectiveRange:");
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lineHeight");
}

id objc_msgSend_linkMetadataForDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkMetadataForDataSource:");
}

id objc_msgSend_linkWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkWithBundleIdentifier:");
}

id objc_msgSend_listenNowEpisode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listenNowEpisode");
}

id objc_msgSend_listenNowQueryObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listenNowQueryObserver");
}

id objc_msgSend_load_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "load:");
}

id objc_msgSend_loadBagContextFromIMURLBag_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadBagContextFromIMURLBag:completionBlock:");
}

id objc_msgSend_loadData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadData");
}

id objc_msgSend_loadIfNeededAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadIfNeededAndReturnError:");
}

id objc_msgSend_loadQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadQueue");
}

id objc_msgSend_loadSessionsIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSessionsIfNeeded");
}

id objc_msgSend_loadState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadState");
}

id objc_msgSend_loadStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadStatus");
}

id objc_msgSend_localAssetSupportWorkQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localAssetSupportWorkQueue");
}

id objc_msgSend_localLibraryUpdatesDisabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localLibraryUpdatesDisabled");
}

id objc_msgSend_localPlaybackQueueIdentifierForPodcastUuid_episodeUuid_sampPlaybackOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localPlaybackQueueIdentifierForPodcastUuid:episodeUuid:sampPlaybackOrder:");
}

id objc_msgSend_localPlaybackQueueIdentifierForStationUuid_episodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localPlaybackQueueIdentifierForStationUuid:episodeUuid:");
}

id objc_msgSend_localShowMissing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localShowMissing");
}

id objc_msgSend_localizedCaseInsensitiveContainsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedCaseInsensitiveContainsString:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedFailureReason");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringForSkipBackwards(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForSkipBackwards");
}

id objc_msgSend_localizedStringForSkipForward(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForSkipForward");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_localizedStringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:");
}

id objc_msgSend_localizedUserNotificationStringForKey_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedUserNotificationStringForKey:arguments:");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "location");
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationInView:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lock");
}

id objc_msgSend_lockContentOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockContentOffset");
}

id objc_msgSend_lockWhenCondition_beforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockWhenCondition:beforeDate:");
}

id objc_msgSend_lockup_moreButtonTapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockup:moreButtonTapped:");
}

id objc_msgSend_lockupDidChangeSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockupDidChangeSize:");
}

id objc_msgSend_logAndThrow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logAndThrow:");
}

id objc_msgSend_logAndThrow_printStackTrace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logAndThrow:printStackTrace:");
}

id objc_msgSend_logEventWithType_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logEventWithType:context:");
}

id objc_msgSend_logFile_lineNumber_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logFile:lineNumber:format:");
}

id objc_msgSend_logPrefix(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logPrefix");
}

id objc_msgSend_loggingCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loggingCategory");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_longReasonTextForNoInternet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longReasonTextForNoInternet");
}

id objc_msgSend_longStringForUnavailableReason_podcastTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longStringForUnavailableReason:podcastTitle:");
}

id objc_msgSend_longTitles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longTitles");
}

id objc_msgSend_lookupDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lookupDict");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_magicMomentCompletionHandlers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "magicMomentCompletionHandlers");
}

id objc_msgSend_magicMomentPlayerItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "magicMomentPlayerItem");
}

id objc_msgSend_main(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "main");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainOrPrivateContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainOrPrivateContext");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mainQueueContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainQueueContext");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_mainThread_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainThread:");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeObjectsPerformSelector:");
}

id objc_msgSend_managedAssetsDirectoryURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedAssetsDirectoryURL");
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedObjectContext");
}

id objc_msgSend_managedObjectModel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedObjectModel");
}

id objc_msgSend_managedObjectModelDefinitionURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedObjectModelDefinitionURL");
}

id objc_msgSend_manifest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manifest");
}

id objc_msgSend_manifestDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manifestDidChange");
}

id objc_msgSend_manifestIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manifestIdentifier");
}

id objc_msgSend_manifestIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manifestIndex");
}

id objc_msgSend_manuallyAdded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manuallyAdded");
}

id objc_msgSend_markAddedSubscriptionsAsSynced(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markAddedSubscriptionsAsSynced");
}

id objc_msgSend_markAllShowsAsSynced(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markAllShowsAsSynced");
}

id objc_msgSend_markAsAgreedToLatestTerms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markAsAgreedToLatestTerms");
}

id objc_msgSend_markAsUnbookmarked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markAsUnbookmarked");
}

id objc_msgSend_markBookmarksSyncDirty_for_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markBookmarksSyncDirty:for:");
}

id objc_msgSend_markEpisodeAsFirstSeen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markEpisodeAsFirstSeen:");
}

id objc_msgSend_markEpisodesAsNotified_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markEpisodesAsNotified:");
}

id objc_msgSend_markEverythingAsSyncedWithVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markEverythingAsSyncedWithVersion:");
}

id objc_msgSend_markHasBeenIndexed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markHasBeenIndexed");
}

id objc_msgSend_markPlayedAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markPlayedAction");
}

id objc_msgSend_markPlaylistsForUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markPlaylistsForUpdate");
}

id objc_msgSend_markShowsAsSyncedForPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markShowsAsSyncedForPredicate:");
}

id objc_msgSend_markSubscriptionSyncDirty_for_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markSubscriptionSyncDirty:for:");
}

id objc_msgSend_markUnplayedAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markUnplayedAction");
}

id objc_msgSend_markUpdateUnnecessaryForObjectIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markUpdateUnnecessaryForObjectIDs:");
}

id objc_msgSend_markWelcomeAsShown(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markWelcomeAsShown");
}

id objc_msgSend_marketingPushHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "marketingPushHandler");
}

id objc_msgSend_maximumContentWidthForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumContentWidthForStyle:");
}

id objc_msgSend_maximumLevelHeightDefault(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumLevelHeightDefault");
}

id objc_msgSend_maximumLevelHeightMax(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumLevelHeightMax");
}

id objc_msgSend_maximumLevelHeightMin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumLevelHeightMin");
}

id objc_msgSend_maximumNumberOfLines(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumNumberOfLines");
}

id objc_msgSend_mediaApiClientIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaApiClientIdentifier");
}

id objc_msgSend_mediaApiClientVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaApiClientVersion");
}

id objc_msgSend_mediaContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaContainer");
}

id objc_msgSend_mediaItemDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaItemDictionary");
}

id objc_msgSend_mediaItemForEpisodeWithManagedObjectID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaItemForEpisodeWithManagedObjectID:");
}

id objc_msgSend_mediaItemForEpisodeWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaItemForEpisodeWithUUID:");
}

id objc_msgSend_mediaItemIdentifierForEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaItemIdentifierForEpisode:");
}

id objc_msgSend_mediaItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaItems");
}

id objc_msgSend_mediaLibraryDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaLibraryDidChange");
}

id objc_msgSend_mediaLibraryId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaLibraryId");
}

id objc_msgSend_mediaOptionArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaOptionArray:");
}

id objc_msgSend_mediaOptionValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaOptionValues");
}

id objc_msgSend_mediaQuery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaQuery");
}

id objc_msgSend_mediaRemoteOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaRemoteOptions");
}

id objc_msgSend_mediaRemotePlayerPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaRemotePlayerPath");
}

id objc_msgSend_mediaRequestsWWAN(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaRequestsWWAN");
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaType");
}

id objc_msgSend_menuWithTitle_children_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "menuWithTitle:children:");
}

id objc_msgSend_mergeArray_fromArray_lookupKey_updateBlock_insertBlock_deleteBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeArray:fromArray:lookupKey:updateBlock:insertBlock:deleteBlock:");
}

id objc_msgSend_mergeData_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeData:forKey:");
}

id objc_msgSend_mergeData_forKey_version_mismatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeData:forKey:version:mismatch:");
}

id objc_msgSend_mergeData_forKey_version_mismatch_finishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeData:forKey:version:mismatch:finishedBlock:");
}

id objc_msgSend_mergeData_forKey_version_mismatch_isGetTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeData:forKey:version:mismatch:isGetTransaction:");
}

id objc_msgSend_mergeData_mismatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeData:mismatch:");
}

id objc_msgSend_mergeLocalAndRemoteData_forKey_version_mismatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeLocalAndRemoteData:forKey:version:mismatch:");
}

id objc_msgSend_mergeMetadataItemFromSetResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeMetadataItemFromSetResponse:");
}

id objc_msgSend_mergeMetadataItemsFromGetResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeMetadataItemsFromGetResponse");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "message");
}

id objc_msgSend_messageForAlertController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageForAlertController");
}

id objc_msgSend_messageLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageLabel");
}

id objc_msgSend_messageLabelWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageLabelWithFrame:");
}

id objc_msgSend_metadataChapters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataChapters");
}

id objc_msgSend_metadataCommandCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataCommandCenter");
}

id objc_msgSend_metadataFooterFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataFooterFont");
}

id objc_msgSend_metadataFooterForEpisode_includingDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataFooterForEpisode:includingDuration:");
}

id objc_msgSend_metadataFrameForViewWidth_titleFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataFrameForViewWidth:titleFrame:style:");
}

id objc_msgSend_metadataHeaderFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataHeaderFont");
}

id objc_msgSend_metadataIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataIdentifier");
}

id objc_msgSend_metadataInfoCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataInfoCenter");
}

id objc_msgSend_metadataItemsFromDataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataItemsFromDataSource");
}

id objc_msgSend_metadataItemsFromKVSStorage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataItemsFromKVSStorage");
}

id objc_msgSend_metadataItemsToCommitToDataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataItemsToCommitToDataSource");
}

id objc_msgSend_metadataItemsToCommitToKVSStorage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataItemsToCommitToKVSStorage");
}

id objc_msgSend_metadataLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataLabel");
}

id objc_msgSend_metadataObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataObject");
}

id objc_msgSend_metadataTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataTimestamp");
}

id objc_msgSend_metadataWithValuesFromDataSourceItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataWithValuesFromDataSourceItem:");
}

id objc_msgSend_metadataWithValuesItemIdentifier_keyValueStorePayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataWithValuesItemIdentifier:keyValueStorePayload:");
}

id objc_msgSend_methodSignatureForSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "methodSignatureForSelector:");
}

id objc_msgSend_metricDataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricDataSource");
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metrics");
}

id objc_msgSend_metricsAdditionalData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsAdditionalData");
}

id objc_msgSend_metricsCanaryIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsCanaryIdentifier");
}

id objc_msgSend_metricsContentIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsContentIdentifier");
}

id objc_msgSend_metricsDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsDictionary");
}

id objc_msgSend_metricsKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsKeys");
}

id objc_msgSend_metricsPlayStartPosition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsPlayStartPosition");
}

id objc_msgSend_metricsPlayStartTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsPlayStartTime");
}

id objc_msgSend_metricsSender(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsSender");
}

id objc_msgSend_migrate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrate");
}

id objc_msgSend_migrateDatabasePropertiesToSharedContainerIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateDatabasePropertiesToSharedContainerIfNeeded");
}

id objc_msgSend_migrateDatabaseToSharedContainerIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateDatabaseToSharedContainerIfNeeded");
}

id objc_msgSend_migrateDefaultPlaylistsForVersion18to19(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateDefaultPlaylistsForVersion18to19");
}

id objc_msgSend_migrateIfNecessaryWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateIfNecessaryWithCompletion:");
}

id objc_msgSend_migrateLibraryArtworkFromImageStoreWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateLibraryArtworkFromImageStoreWithCompletionHandler:");
}

id objc_msgSend_migratePlaylistDefaultsForVersion7to8(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migratePlaylistDefaultsForVersion7to8");
}

id objc_msgSend_migratePlaylistsForVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migratePlaylistsForVersion:");
}

id objc_msgSend_migrateSerpentId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateSerpentId");
}

id objc_msgSend_migrateSettingDefaultsForVersion10to11(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateSettingDefaultsForVersion10to11");
}

id objc_msgSend_migrateSettingDefaultsForVersion30to31(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateSettingDefaultsForVersion30to31");
}

id objc_msgSend_migrateSettingDefaultsForVersion42to43(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateSettingDefaultsForVersion42to43");
}

id objc_msgSend_migrateSettingDefaultsForVersion44to45(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateSettingDefaultsForVersion44to45");
}

id objc_msgSend_migrateSettingDefaultsForVersion48to49(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateSettingDefaultsForVersion48to49");
}

id objc_msgSend_migrateSettingDefaultsForVersion58to59(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateSettingDefaultsForVersion58to59");
}

id objc_msgSend_migrateSettingDefaultsForVersion6to7(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateSettingDefaultsForVersion6to7");
}

id objc_msgSend_migrateSettingDefaultsForVersion9to10(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateSettingDefaultsForVersion9to10");
}

id objc_msgSend_migrateSettingsForVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateSettingsForVersion:");
}

id objc_msgSend_migrateToDeltaFeedSystem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateToDeltaFeedSystem");
}

id objc_msgSend_migrationRegisteredAtVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrationRegisteredAtVersion:");
}

id objc_msgSend_minimumInteritemSpacing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minimumInteritemSpacing");
}

id objc_msgSend_minimumLineSpacing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minimumLineSpacing");
}

id objc_msgSend_minusOrderedSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusOrderedSet:");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_mockEpisode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mockEpisode");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "model");
}

id objc_msgSend_modernKeyFromFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modernKeyFromFeedUrl:");
}

id objc_msgSend_modifiedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modifiedDate");
}

id objc_msgSend_moreAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moreAction");
}

id objc_msgSend_moreButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moreButton");
}

id objc_msgSend_moreButtonFrameForDescriptionFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moreButtonFrameForDescriptionFrame:");
}

id objc_msgSend_moreButtonTapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moreButtonTapped:");
}

id objc_msgSend_moreIcon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moreIcon");
}

id objc_msgSend_moveEpisodeFrom_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveEpisodeFrom:to:");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_moveSQLiteFilesFromDocumentsToSharedContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveSQLiteFilesFromDocumentsToSharedContainer");
}

id objc_msgSend_moveSourceFile_toPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveSourceFile:toPath:");
}

id objc_msgSend_moveUserDefaultToSharedContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveUserDefaultToSharedContainer:");
}

id objc_msgSend_mt_RTLMirrorIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_RTLMirrorIfNeeded");
}

id objc_msgSend_mt_accessSchedulingOptionsByRequestIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_accessSchedulingOptionsByRequestIdentifier:");
}

id objc_msgSend_mt_actionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_actionType");
}

id objc_msgSend_mt_allItemsForPodcastsApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_allItemsForPodcastsApp");
}

id objc_msgSend_mt_allItemsForPodcastsAppWithAdditionalFilterPredicate_disableSystemPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_allItemsForPodcastsAppWithAdditionalFilterPredicate:disableSystemPredicates:");
}

id objc_msgSend_mt_allSupportedLocalNotificationCategories(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_allSupportedLocalNotificationCategories");
}

id objc_msgSend_mt_allSupportedNotificationCategories(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_allSupportedNotificationCategories");
}

id objc_msgSend_mt_areMarginsGenerousForWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_areMarginsGenerousForWidth:");
}

id objc_msgSend_mt_baselineOriginY(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_baselineOriginY");
}

id objc_msgSend_mt_collectionView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_collectionView");
}

id objc_msgSend_mt_compactMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_compactMap:");
}

id objc_msgSend_mt_configureForDisplayingArtworkWithRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_configureForDisplayingArtworkWithRadius:");
}

id objc_msgSend_mt_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_copy");
}

id objc_msgSend_mt_dynamicTypeConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_dynamicTypeConstant");
}

id objc_msgSend_mt_enableAutomaticRTLMirroringForSubviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_enableAutomaticRTLMirroringForSubviews");
}

id objc_msgSend_mt_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_filter:");
}

id objc_msgSend_mt_firstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_firstBaselineOffsetFromTop");
}

id objc_msgSend_mt_fontDescriptorForTextStyle_contentSizeCategoryName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_fontDescriptorForTextStyle:contentSizeCategoryName:");
}

id objc_msgSend_mt_fontForTextStyle_contentSizeCategoryName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_fontForTextStyle:contentSizeCategoryName:");
}

id objc_msgSend_mt_horizontalMarginsForWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_horizontalMarginsForWidth:");
}

id objc_msgSend_mt_iTunesUQuery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_iTunesUQuery");
}

id objc_msgSend_mt_imageAttachmentForCacheKey_imageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_imageAttachmentForCacheKey:imageURL:");
}

id objc_msgSend_mt_isExcludedFromAutomaticRTLMirroring(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_isExcludedFromAutomaticRTLMirroring");
}

id objc_msgSend_mt_isPlayerItemRequestIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_isPlayerItemRequestIdentifier:");
}

id objc_msgSend_mt_isRTL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_isRTL");
}

id objc_msgSend_mt_isUuidRequestIdentifier_matchForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_isUuidRequestIdentifier:matchForPodcastUuid:");
}

id objc_msgSend_mt_layoutMarginsForWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_layoutMarginsForWidth:");
}

id objc_msgSend_mt_leftMargin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_leftMargin");
}

id objc_msgSend_mt_localNotificationForAnnouncements(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_localNotificationForAnnouncements");
}

id objc_msgSend_mt_localNotificationForNewEpisodesAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_localNotificationForNewEpisodesAvailable");
}

id objc_msgSend_mt_notificationEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_notificationEpisodes");
}

id objc_msgSend_mt_offsetFromCapHeightToAscent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_offsetFromCapHeightToAscent");
}

id objc_msgSend_mt_offsetFromFirstBaselineToTop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_offsetFromFirstBaselineToTop");
}

id objc_msgSend_mt_offsetFromLastBaselineToBottom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_offsetFromLastBaselineToBottom");
}

id objc_msgSend_mt_podcastUuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_podcastUuid");
}

id objc_msgSend_mt_podcastsQuery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_podcastsQuery");
}

id objc_msgSend_mt_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_preferredFontForTextStyle:");
}

id objc_msgSend_mt_preferredFontForTextStyle_addingSymbolicTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_preferredFontForTextStyle:addingSymbolicTraits:");
}

id objc_msgSend_mt_recursivelyFindFirstViewMeetingCriteria_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_recursivelyFindFirstViewMeetingCriteria:");
}

id objc_msgSend_mt_removeAllNotificationsForDeletedEpisodesOnPodcastUuid_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_removeAllNotificationsForDeletedEpisodesOnPodcastUuid:ctx:");
}

id objc_msgSend_mt_removeAllNotificationsForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_removeAllNotificationsForPodcastUuid:");
}

id objc_msgSend_mt_rootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_rootViewController");
}

id objc_msgSend_mt_schedulingOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_schedulingOptions");
}

id objc_msgSend_mt_setDynamicTypeConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_setDynamicTypeConstant:");
}

id objc_msgSend_mt_setSchedulingOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_setSchedulingOptions:");
}

id objc_msgSend_mt_setShouldRTLMirrorStackDepth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_setShouldRTLMirrorStackDepth:");
}

id objc_msgSend_mt_setUserInfoEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_setUserInfoEpisode:");
}

id objc_msgSend_mt_setUserInfoPodcastUuid_episodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_setUserInfoPodcastUuid:episodes:");
}

id objc_msgSend_mt_shouldRTLMirrorStackDepth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_shouldRTLMirrorStackDepth");
}

id objc_msgSend_mt_subdictionaryWithKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_subdictionaryWithKeys:");
}

id objc_msgSend_mt_topViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_topViewController");
}

id objc_msgSend_mt_uniqueRequestIdentifierForPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_uniqueRequestIdentifierForPlayerItem:");
}

id objc_msgSend_mt_uniqueRequestIdentifierForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_uniqueRequestIdentifierForPodcastUuid:");
}

id objc_msgSend_multiCheckIcon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "multiCheckIcon");
}

id objc_msgSend_multiUncheckIcon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "multiUncheckIcon");
}

id objc_msgSend_multiplier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "multiplier");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_mutableOrderedSetValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableOrderedSetValueForKey:");
}

id objc_msgSend_mutableSetValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableSetValueForKey:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_nanoFriendlyDisplayString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nanoFriendlyDisplayString");
}

id objc_msgSend_naturalRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "naturalRect");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_needToMigrateDataToSharedContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needToMigrateDataToSharedContainer");
}

id objc_msgSend_needsArtworkUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsArtworkUpdate");
}

id objc_msgSend_needsCacheBustForFreeAndPaidUrlStorage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsCacheBustForFreeAndPaidUrlStorage");
}

id objc_msgSend_needsCoreDataMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsCoreDataMigration");
}

id objc_msgSend_needsDataMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsDataMigration");
}

id objc_msgSend_needsFrozenCheck(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsFrozenCheck");
}

id objc_msgSend_needsImageStoreMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsImageStoreMigration");
}

id objc_msgSend_needsMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsMigration");
}

id objc_msgSend_needsMigrationToDeltaFeedUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsMigrationToDeltaFeedUpdates");
}

id objc_msgSend_needsNetworkToPlayButNoNetwork(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsNetworkToPlayButNoNetwork");
}

id objc_msgSend_needsRestore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsRestore");
}

id objc_msgSend_needsSerpentIdEpisodeMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsSerpentIdEpisodeMigration");
}

id objc_msgSend_needsToComputeLastLaunch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsToComputeLastLaunch");
}

id objc_msgSend_needsUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsUpdate");
}

id objc_msgSend_networkIsReachable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkIsReachable");
}

id objc_msgSend_networkStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkStatus");
}

id objc_msgSend_networkUPPEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkUPPEnabled");
}

id objc_msgSend_networkingBlockedErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkingBlockedErrorWithTransaction:underlyingError:");
}

id objc_msgSend_networkingBlockedUntil(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkingBlockedUntil");
}

id objc_msgSend_newBackgroundTaskWithExpirationHandler_debugInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newBackgroundTaskWithExpirationHandler:debugInfo:");
}

id objc_msgSend_newCellForDescriptionType_inGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newCellForDescriptionType:inGroupWithIdentifier:");
}

id objc_msgSend_newCellInstanceWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newCellInstanceWithReuseIdentifier:");
}

id objc_msgSend_newCommandEventWithInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newCommandEventWithInterval:");
}

id objc_msgSend_newEpisodeCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newEpisodeCount");
}

id objc_msgSend_newKVSGetAllTransactionSinceDomainVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newKVSGetAllTransactionSinceDomainVersion:");
}

id objc_msgSend_newKVSGetAllTransactionWithMetadataItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newKVSGetAllTransactionWithMetadataItems:");
}

id objc_msgSend_newKVSPutAllTransactionWithMetadataItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newKVSPutAllTransactionWithMetadataItems:");
}

id objc_msgSend_newKVSTransactionWithType_keys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newKVSTransactionWithType:keys:");
}

id objc_msgSend_newSettingsController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newSettingsController");
}

id objc_msgSend_newestEpisode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newestEpisode");
}

id objc_msgSend_newestEpisodeByAvailabiltyTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newestEpisodeByAvailabiltyTime");
}

id objc_msgSend_newestEpisodeExcludingUuid_excludeExplicit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newestEpisodeExcludingUuid:excludeExplicit:");
}

id objc_msgSend_newestEpisodeWithFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newestEpisodeWithFilter:");
}

id objc_msgSend_newestFullEpisode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newestFullEpisode");
}

id objc_msgSend_newestUserEpisodeExcludingExplicit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newestUserEpisodeExcludingExplicit:");
}

id objc_msgSend_newlyEntitledEpisodeUUIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newlyEntitledEpisodeUUIDs");
}

id objc_msgSend_next(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "next");
}

id objc_msgSend_nextBatchWithTransformationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextBatchWithTransformationBlock:");
}

id objc_msgSend_nextEpisode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextEpisode");
}

id objc_msgSend_nextEpisodeUuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextEpisodeUuid");
}

id objc_msgSend_nextIndexPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextIndexPath");
}

id objc_msgSend_nextManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextManifest:");
}

id objc_msgSend_noStoreAccountErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "noStoreAccountErrorWithTransaction:underlyingError:");
}

id objc_msgSend_notPredicateWithSubpredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notPredicateWithSubpredicate:");
}

id objc_msgSend_notYetUpdatable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notYetUpdatable");
}

id objc_msgSend_noteObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "noteObserver");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notification");
}

id objc_msgSend_notificationCenter_didChangeSettings_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationCenter:didChangeSettings:bag:");
}

id objc_msgSend_notificationEpisodesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationEpisodesCount");
}

id objc_msgSend_notificationReceived(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationReceived");
}

id objc_msgSend_notificationScheduled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationScheduled");
}

id objc_msgSend_notificationSetRetryFlag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationSetRetryFlag");
}

id objc_msgSend_notificationTapped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationTapped");
}

id objc_msgSend_notificationTestActionsViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationTestActionsViewController");
}

id objc_msgSend_notificationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationType");
}

id objc_msgSend_notifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifications");
}

id objc_msgSend_notificationsSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationsSetting");
}

id objc_msgSend_notifyCurrentItemDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyCurrentItemDidChange");
}

id objc_msgSend_notifyObservers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyObservers");
}

id objc_msgSend_notifyObserversForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyObserversForPodcast:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "now");
}

id objc_msgSend_nowPlayingIcon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nowPlayingIcon");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "null");
}

id objc_msgSend_numMetadataItemsFromDataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numMetadataItemsFromDataSource");
}

id objc_msgSend_numMetadataItemsFromKVSStorage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numMetadataItemsFromKVSStorage");
}

id objc_msgSend_numMetadataItemsToCommitToDataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numMetadataItemsToCommitToDataSource");
}

id objc_msgSend_numMetadataItemsToCommitToKVSStorage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numMetadataItemsToCommitToKVSStorage");
}

id objc_msgSend_numberFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFormatter");
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberOfBytesTransferred(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfBytesTransferred");
}

id objc_msgSend_numberOfColumns(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfColumns");
}

id objc_msgSend_numberOfDownloads(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfDownloads");
}

id objc_msgSend_numberOfDroppedVideoFrames(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfDroppedVideoFrames");
}

id objc_msgSend_numberOfExtraObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfExtraObjects");
}

id objc_msgSend_numberOfGlyphs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfGlyphs");
}

id objc_msgSend_numberOfItemsInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfItemsInSection:");
}

id objc_msgSend_numberOfLevels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfLevels");
}

id objc_msgSend_numberOfLines(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfLines");
}

id objc_msgSend_numberOfMediaRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfMediaRequests");
}

id objc_msgSend_numberOfObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfObjects");
}

id objc_msgSend_numberOfPlaceholderObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfPlaceholderObjects");
}

id objc_msgSend_numberOfResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfResults");
}

id objc_msgSend_numberOfRowsFromIndexPath_toFromIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfRowsFromIndexPath:toFromIndexPath:");
}

id objc_msgSend_numberOfRowsInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfRowsInSection:");
}

id objc_msgSend_numberOfSections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfSections");
}

id objc_msgSend_numberOfSectionsInTableView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfSectionsInTableView:");
}

id objc_msgSend_numberOfServerAddressChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfServerAddressChanges");
}

id objc_msgSend_numberOfStalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfStalls");
}

id objc_msgSend_numberValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberValue");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "object");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexPath:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectDictionariesInEntity_predicate_sortDescriptors_propertiesToFetch_includeObjectId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectDictionariesInEntity:predicate:sortDescriptors:propertiesToFetch:includeObjectId:");
}

id objc_msgSend_objectDictionariesInEntity_predicate_sortDescriptors_propertiesToFetch_includeObjectId_limit_distinct_groupBy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectDictionariesInEntity:predicate:sortDescriptors:propertiesToFetch:includeObjectId:limit:distinct:groupBy:");
}

id objc_msgSend_objectDictionaryForUuid_entityName_byAddingComputedProperties_toFetchedObjectDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectDictionaryForUuid:entityName:byAddingComputedProperties:toFetchedObjectDictionary:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_withDefaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:withDefaultValue:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectForUuid_entityName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForUuid:entityName:");
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectID");
}

id objc_msgSend_objectInEntity_predicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectInEntity:predicate:");
}

id objc_msgSend_objectValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectValue");
}

id objc_msgSend_objectVersionPairForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectVersionPairForKey:");
}

id objc_msgSend_objectWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectWithID:");
}

id objc_msgSend_objects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objects");
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_objectsForKeys_notFoundMarker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsForKeys:notFoundMarker:");
}

id objc_msgSend_objectsInEntity_predicate_propertiesToFetch_batchSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsInEntity:predicate:propertiesToFetch:batchSize:");
}

id objc_msgSend_objectsInEntity_predicate_propertiesToFetch_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsInEntity:predicate:propertiesToFetch:limit:");
}

id objc_msgSend_objectsInEntity_predicate_sortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsInEntity:predicate:sortDescriptors:");
}

id objc_msgSend_objectsInEntity_predicate_sortDescriptors_returnsObjectsAsFaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:");
}

id objc_msgSend_objectsInEntity_predicate_sortDescriptors_returnsObjectsAsFaults_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:");
}

id objc_msgSend_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsPassingTest:");
}

id objc_msgSend_objectsToIndexPathDictionary_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsToIndexPathDictionary:inSection:");
}

id objc_msgSend_observePlaybackStartEventForRefId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observePlaybackStartEventForRefId:");
}

id objc_msgSend_observedBitrate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observedBitrate");
}

id objc_msgSend_observedBitrateStandardDeviation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observedBitrateStandardDeviation");
}

id objc_msgSend_observedMaxBitrate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observedMaxBitrate");
}

id objc_msgSend_observedMinBitrate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observedMinBitrate");
}

id objc_msgSend_observerLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observerLock");
}

id objc_msgSend_observerWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observerWithBlock:");
}

id objc_msgSend_obtainPermanentIDsForObjects_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "obtainPermanentIDsForObjects:error:");
}

id objc_msgSend_offerTypeAsFlagBit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "offerTypeAsFlagBit");
}

id objc_msgSend_offerTypesAsFlagBits(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "offerTypesAsFlagBits");
}

id objc_msgSend_offers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "offers");
}

id objc_msgSend_oldestEpisodeDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oldestEpisodeDate");
}

id objc_msgSend_oldestEpisodeExcludingExplicit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oldestEpisodeExcludingExplicit:");
}

id objc_msgSend_oldestUserEpisodeExcludingExplicit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oldestUserEpisodeExcludingExplicit:");
}

id objc_msgSend_openExternalEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openExternalEpisode:");
}

id objc_msgSend_openGlobalSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openGlobalSettings");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openStoreURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openStoreURL:");
}

id objc_msgSend_openURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:");
}

id objc_msgSend_openURL_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:options:completionHandler:");
}

id objc_msgSend_openURL_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:withOptions:");
}

id objc_msgSend_operationCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationCount");
}

id objc_msgSend_operationInQueueWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationInQueueWithType:");
}

id objc_msgSend_operationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationType");
}

id objc_msgSend_operationTypeForSET(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationTypeForSET");
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operations");
}

id objc_msgSend_option(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "option");
}

id objc_msgSend_optionDown(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionDown");
}

id objc_msgSend_optionFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionFont");
}

id objc_msgSend_optionSettingChanged_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionSettingChanged:value:");
}

id objc_msgSend_optionSettingWithTitle_footerText_initialValue_optionDescription_identifier_changeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionSettingWithTitle:footerText:initialValue:optionDescription:identifier:changeHandler:");
}

id objc_msgSend_optionSettingWithTitle_headerTitle_footerText_initialValue_optionDescription_identifier_changeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionSettingWithTitle:headerTitle:footerText:initialValue:optionDescription:identifier:changeHandler:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "options");
}

id objc_msgSend_optionsForDeletePlayedEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsForDeletePlayedEpisodes");
}

id objc_msgSend_optionsForHidesPlayedEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsForHidesPlayedEpisodes");
}

id objc_msgSend_optionsForLimitWithGlobalDefault(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsForLimitWithGlobalDefault");
}

id objc_msgSend_optionsTableViewControllerWithOption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsTableViewControllerWithOption:");
}

id objc_msgSend_optionsWithLongTitles_shortTitles_valueList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsWithLongTitles:shortTitles:valueList:");
}

id objc_msgSend_optionsWithLongTitles_shortTitles_valueList_footerTextCallback_headerTextCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsWithLongTitles:shortTitles:valueList:footerTextCallback:headerTextCallback:");
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orPredicateWithSubpredicates:");
}

id objc_msgSend_orangeColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orangeColor");
}

id objc_msgSend_order(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "order");
}

id objc_msgSend_orderedIconKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderedIconKeys");
}

id objc_msgSend_orderedSetWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderedSetWithArray:");
}

id objc_msgSend_orderedSetWithOrderedSet_range_copyItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderedSetWithOrderedSet:range:copyItems:");
}

id objc_msgSend_originalPodcastFeedURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "originalPodcastFeedURL");
}

id objc_msgSend_originalRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "originalRequest");
}

id objc_msgSend_originalURLForTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "originalURLForTask:");
}

id objc_msgSend_overrideLocalWithRemoteData_forKey_version_mismatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideLocalWithRemoteData:forKey:version:mismatch:");
}

id objc_msgSend_pageContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pageContext");
}

id objc_msgSend_pageParser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pageParser");
}

id objc_msgSend_pageTypeForReportType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pageTypeForReportType:");
}

id objc_msgSend_paidSubscriptionActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "paidSubscriptionActive");
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "panGestureRecognizer");
}

id objc_msgSend_parentMediaLibraryId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parentMediaLibraryId");
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parentViewController");
}

id objc_msgSend_parseError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseError");
}

id objc_msgSend_parseWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseWithData:");
}

id objc_msgSend_parser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parser");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_pathWithRoute_bundleID_playerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithRoute:bundleID:playerID:");
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pause");
}

id objc_msgSend_pauseLocalPlayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseLocalPlayer");
}

id objc_msgSend_pauseLocalPlayerWithInitiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseLocalPlayerWithInitiator:");
}

id objc_msgSend_pauseWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseWithCompletion:");
}

id objc_msgSend_pauseWithInitiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseWithInitiator:");
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "payload");
}

id objc_msgSend_pcrFallback(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pcrFallback");
}

id objc_msgSend_pendingCompletion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingCompletion");
}

id objc_msgSend_pendingDeferredUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingDeferredUpdate");
}

id objc_msgSend_pendingDeletionPersistentIds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingDeletionPersistentIds");
}

id objc_msgSend_pendingDeserializations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingDeserializations");
}

id objc_msgSend_pendingFeedProcessingBlocks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingFeedProcessingBlocks");
}

id objc_msgSend_pendingRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingRequest");
}

id objc_msgSend_pendingTransactions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingTransactions");
}

id objc_msgSend_pendingUserDefaultArchivedData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingUserDefaultArchivedData");
}

id objc_msgSend_peopleScoresFromMediaData_keyedOnQid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "peopleScoresFromMediaData:keyedOnQid:");
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "perform");
}

id objc_msgSend_performAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAction");
}

id objc_msgSend_performActionForShortcutItem_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performActionForShortcutItem:completionHandler:");
}

id objc_msgSend_performAndWaitWithContext_save_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAndWaitWithContext:save:");
}

id objc_msgSend_performAuthentication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAuthentication");
}

id objc_msgSend_performBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlock:");
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockAndWait:");
}

id objc_msgSend_performBlockAndWaitWithSave_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockAndWaitWithSave:");
}

id objc_msgSend_performEpisodeUpdateAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performEpisodeUpdateAction:");
}

id objc_msgSend_performFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performFetch:");
}

id objc_msgSend_performMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performMigration");
}

id objc_msgSend_performMigrationIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performMigrationIfNecessary");
}

id objc_msgSend_performMigrationIfNecessaryWithOptionKeyDown::(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performMigrationIfNecessaryWithOptionKeyDown::");
}

id objc_msgSend_performOnAvSessionQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performOnAvSessionQueue:");
}

id objc_msgSend_performOnMainQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performOnMainQueue:");
}

id objc_msgSend_performPlayActionForShortcutItem_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performPlayActionForShortcutItem:completionHandler:");
}

id objc_msgSend_performRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequest:");
}

id objc_msgSend_performRequestAsBufferedAirPlay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequestAsBufferedAirPlay:");
}

id objc_msgSend_performSearchAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSearchAction:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_performSubscribe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSubscribe:");
}

id objc_msgSend_performTransactionWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performTransactionWithBlock:");
}

id objc_msgSend_performUniversalPlaybackPositionSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performUniversalPlaybackPositionSync");
}

id objc_msgSend_performUrlRequest_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performUrlRequest:callback:");
}

id objc_msgSend_performWhenURLAvailableForImageForKey_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWhenURLAvailableForImageForKey:block:");
}

id objc_msgSend_performWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithCompletion:");
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithoutAnimation:");
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentID");
}

id objc_msgSend_persistentId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentId");
}

id objc_msgSend_persistentIds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentIds");
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentStoreCoordinator");
}

id objc_msgSend_pf_URLByAppendingHashString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pf_URLByAppendingHashString:");
}

id objc_msgSend_pf_URLByAppendingQueryParameterKey_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pf_URLByAppendingQueryParameterKey:value:");
}

id objc_msgSend_pf_URLByAppendingQueryParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pf_URLByAppendingQueryParameters:");
}

id objc_msgSend_pf_URLByAppendingQueryString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pf_URLByAppendingQueryString:");
}

id objc_msgSend_pf_cleanUrlToEpisodeGuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pf_cleanUrlToEpisodeGuid");
}

id objc_msgSend_pf_cleanUrlToStoreId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pf_cleanUrlToStoreId");
}

id objc_msgSend_pf_cleanUrlToStoreTrackId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pf_cleanUrlToStoreTrackId");
}

id objc_msgSend_pf_queryAsDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pf_queryAsDictionary");
}

id objc_msgSend_pf_stringWithPercentEscape(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pf_stringWithPercentEscape");
}

id objc_msgSend_pickRouteAndSwitchToLocalCard_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pickRouteAndSwitchToLocalCard:completion:");
}

id objc_msgSend_pickerCustomizationWithIdentifier_options_selectedOptionIndex_footerText_valueChangedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pickerCustomizationWithIdentifier:options:selectedOptionIndex:footerText:valueChangedHandler:");
}

id objc_msgSend_pidToUuidMapping(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pidToUuidMapping");
}

id objc_msgSend_placeholder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeholder");
}

id objc_msgSend_placeholderWithSize_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placeholderWithSize:completionHandler:");
}

id objc_msgSend_platformSpecificConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "platformSpecificConfiguration");
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "play");
}

id objc_msgSend_play_interruptionEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "play:interruptionEvent:");
}

id objc_msgSend_playCommand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playCommand");
}

id objc_msgSend_playContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playContext");
}

id objc_msgSend_playCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playCount");
}

id objc_msgSend_playEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playEpisodeUuid:");
}

id objc_msgSend_playEpisodeUuid_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playEpisodeUuid:context:");
}

id objc_msgSend_playEpisodeUuid_context_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playEpisodeUuid:context:limit:");
}

id objc_msgSend_playEpisodeUuid_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playEpisodeUuid:limit:");
}

id objc_msgSend_playItemInQueueCommand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playItemInQueueCommand");
}

id objc_msgSend_playItemWithContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playItemWithContentID:");
}

id objc_msgSend_playListenNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playListenNow");
}

id objc_msgSend_playLocalPlayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playLocalPlayer");
}

id objc_msgSend_playManifest_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playManifest:reason:");
}

id objc_msgSend_playManifest_reason_interactive_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playManifest:reason:interactive:completion:");
}

id objc_msgSend_playManifest_reason_interactive_presentationType_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playManifest:reason:interactive:presentationType:completion:");
}

id objc_msgSend_playManifest_waitingForEngine_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playManifest:waitingForEngine:completion:");
}

id objc_msgSend_playMyPodcastsWithOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playMyPodcastsWithOrder:");
}

id objc_msgSend_playNextAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playNextAction");
}

id objc_msgSend_playPodcastDefaultBehaviorForNotificationEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playPodcastDefaultBehaviorForNotificationEpisode:");
}

id objc_msgSend_playPodcastNotificationEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playPodcastNotificationEpisodes:");
}

id objc_msgSend_playPodcastUuid_order_limit_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playPodcastUuid:order:limit:error:");
}

id objc_msgSend_playQueueType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playQueueType");
}

id objc_msgSend_playReason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playReason");
}

id objc_msgSend_playState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playState");
}

id objc_msgSend_playStateFromHasBeenPlayed_andPlayCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playStateFromHasBeenPlayed:andPlayCount:");
}

id objc_msgSend_playStateManuallySet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playStateManuallySet");
}

id objc_msgSend_playStateSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playStateSource");
}

id objc_msgSend_playStationUuid_episodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playStationUuid:episodeUuid:");
}

id objc_msgSend_playStationUuid_episodeUuid_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playStationUuid:episodeUuid:limit:");
}

id objc_msgSend_playStationUuid_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playStationUuid:limit:");
}

id objc_msgSend_playStatusImageForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playStatusImageForTheme:");
}

id objc_msgSend_playStatusView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playStatusView");
}

id objc_msgSend_playStatusViewFrameForViewWidth_titleFrame_artworkFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playStatusViewFrameForViewWidth:titleFrame:artworkFrame:");
}

id objc_msgSend_playWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playWithCompletion:");
}

id objc_msgSend_playWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playWithContext:");
}

id objc_msgSend_playWithContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playWithContext:completion:");
}

id objc_msgSend_playWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playWithReason:");
}

id objc_msgSend_playWithReason_interruptEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playWithReason:interruptEvent:");
}

id objc_msgSend_playbackContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackContext");
}

id objc_msgSend_playbackDestination(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackDestination");
}

id objc_msgSend_playbackIsUserRequested(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackIsUserRequested");
}

id objc_msgSend_playbackNewestToOldest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackNewestToOldest");
}

id objc_msgSend_playbackOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackOrder");
}

id objc_msgSend_playbackPlayerPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackPlayerPath");
}

id objc_msgSend_playbackPositionController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackPositionController");
}

id objc_msgSend_playbackQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackQueue");
}

id objc_msgSend_playbackQueueController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackQueueController");
}

id objc_msgSend_playbackQueueForIdentifier_startPlayback_assetInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackQueueForIdentifier:startPlayback:assetInfo:");
}

id objc_msgSend_playbackQueueIdentifierForPodcastAdamId_sampPlaybackOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackQueueIdentifierForPodcastAdamId:sampPlaybackOrder:");
}

id objc_msgSend_playbackQueueWithAccountInfoForIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackQueueWithAccountInfoForIdentifiers:");
}

id objc_msgSend_playbackQueueWithAccountInfoForManifest_queueStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackQueueWithAccountInfoForManifest:queueStatus:");
}

id objc_msgSend_playbackQueueWithAccountInfoForPlayerItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackQueueWithAccountInfoForPlayerItems:");
}

id objc_msgSend_playbackQueueWithDsid_forIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackQueueWithDsid:forIdentifiers:");
}

id objc_msgSend_playbackRelativeVolume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackRelativeVolume");
}

id objc_msgSend_playbackRequestURLWithDSID_baseRequestURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackRequestURLWithDSID:baseRequestURLString:");
}

id objc_msgSend_playbackSessionData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackSessionData");
}

id objc_msgSend_playbackSessionID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackSessionID");
}

id objc_msgSend_playbackSpeed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackSpeed");
}

id objc_msgSend_playbackStart(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackStart");
}

id objc_msgSend_playbackStartDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackStartDate");
}

id objc_msgSend_playbackStartOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackStartOffset");
}

id objc_msgSend_playbackState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackState");
}

id objc_msgSend_playbackType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackType");
}

id objc_msgSend_playedText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playedText");
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "player");
}

id objc_msgSend_player_didStopWithReason_initiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "player:didStopWithReason:initiator:");
}

id objc_msgSend_player_willStopWithReason_initiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "player:willStopWithReason:initiator:");
}

id objc_msgSend_playerController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerController");
}

id objc_msgSend_playerFailure_shouldShowDialog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerFailure:shouldShowDialog:");
}

id objc_msgSend_playerID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerID");
}

id objc_msgSend_playerItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerItem");
}

id objc_msgSend_playerItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerItems");
}

id objc_msgSend_playerItemsFromPodcastStorePlatformDictionary_oldestEpisode_restricted_initiatedByAnotherUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerItemsFromPodcastStorePlatformDictionary:oldestEpisode:restricted:initiatedByAnotherUser:");
}

id objc_msgSend_playerItemsNeedLoading(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerItemsNeedLoading");
}

id objc_msgSend_playerPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerPath");
}

id objc_msgSend_playerPaused(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerPaused");
}

id objc_msgSend_playhead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playhead");
}

id objc_msgSend_playingEpisodeUuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playingEpisodeUuid");
}

id objc_msgSend_playingItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playingItem");
}

id objc_msgSend_playlist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlist");
}

id objc_msgSend_playlistForUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistForUuid:");
}

id objc_msgSend_playlistId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistId");
}

id objc_msgSend_playlistIfDefault(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistIfDefault");
}

id objc_msgSend_playlistSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistSettings");
}

id objc_msgSend_playlistSettings_didChangeLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistSettings:didChangeLayout:");
}

id objc_msgSend_playlistSettingsDidChangeSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistSettingsDidChangeSetting:");
}

id objc_msgSend_playlistSyncDirtyFlag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistSyncDirtyFlag");
}

id objc_msgSend_playlistSyncVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistSyncVersion");
}

id objc_msgSend_playlistUuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistUuid");
}

id objc_msgSend_playlistWithMPPlaylist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlistWithMPPlaylist:");
}

id objc_msgSend_playlists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playlists");
}

id objc_msgSend_podcast(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcast");
}

id objc_msgSend_podcastAdamID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastAdamID");
}

id objc_msgSend_podcastAdamId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastAdamId");
}

id objc_msgSend_podcastCacheInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastCacheInContext:");
}

id objc_msgSend_podcastCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastCount");
}

id objc_msgSend_podcastDataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastDataSource");
}

id objc_msgSend_podcastExistsInStoreWithFeedUrl_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastExistsInStoreWithFeedUrl:completion:");
}

id objc_msgSend_podcastFeedUrl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastFeedUrl");
}

id objc_msgSend_podcastForFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastForFeedUrl:");
}

id objc_msgSend_podcastForStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastForStoreId:");
}

id objc_msgSend_podcastForUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastForUuid:");
}

id objc_msgSend_podcastGroupCellDidTapInfoButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastGroupCellDidTapInfoButton:");
}

id objc_msgSend_podcastImageSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastImageSize");
}

id objc_msgSend_podcastInfoViewDidExpand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastInfoViewDidExpand:");
}

id objc_msgSend_podcastInfoViewWasTapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastInfoViewWasTapped:");
}

id objc_msgSend_podcastMigrationForVersion11to12_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion11to12:");
}

id objc_msgSend_podcastMigrationForVersion14to15_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion14to15:");
}

id objc_msgSend_podcastMigrationForVersion19to20_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion19to20:");
}

id objc_msgSend_podcastMigrationForVersion20to21_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion20to21:");
}

id objc_msgSend_podcastMigrationForVersion24to25_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion24to25:");
}

id objc_msgSend_podcastMigrationForVersion25to26_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion25to26:");
}

id objc_msgSend_podcastMigrationForVersion26to27_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion26to27:");
}

id objc_msgSend_podcastMigrationForVersion27to28_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion27to28:");
}

id objc_msgSend_podcastMigrationForVersion28to29_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion28to29:");
}

id objc_msgSend_podcastMigrationForVersion32to33_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion32to33:");
}

id objc_msgSend_podcastMigrationForVersion34to35_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion34to35:");
}

id objc_msgSend_podcastMigrationForVersion35to36_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion35to36:");
}

id objc_msgSend_podcastMigrationForVersion36to37_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion36to37:");
}

id objc_msgSend_podcastMigrationForVersion38to39_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion38to39:");
}

id objc_msgSend_podcastMigrationForVersion41to42_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion41to42:");
}

id objc_msgSend_podcastMigrationForVersion42to43_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion42to43:");
}

id objc_msgSend_podcastMigrationForVersion44to45_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion44to45:");
}

id objc_msgSend_podcastMigrationForVersion49to50_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion49to50:");
}

id objc_msgSend_podcastMigrationForVersion50to51_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion50to51:");
}

id objc_msgSend_podcastMigrationForVersion55to56_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion55to56:");
}

id objc_msgSend_podcastMigrationForVersion56to57_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion56to57:");
}

id objc_msgSend_podcastMigrationForVersion57to58_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion57to58:");
}

id objc_msgSend_podcastMigrationForVersion58to59_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion58to59:");
}

id objc_msgSend_podcastMigrationForVersion59to60_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion59to60:");
}

id objc_msgSend_podcastMigrationForVersion62to63_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion62to63:");
}

id objc_msgSend_podcastMigrationForVersion66to67_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion66to67:");
}

id objc_msgSend_podcastMigrationForVersion6to7_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion6to7:");
}

id objc_msgSend_podcastMigrationForVersion8to9_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion8to9:");
}

id objc_msgSend_podcastMigrationForVersion9to10_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastMigrationForVersion9to10:");
}

id objc_msgSend_podcastPID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastPID");
}

id objc_msgSend_podcastPersistentId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastPersistentId");
}

id objc_msgSend_podcastPlaylistSettingsForUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastPlaylistSettingsForUuid:");
}

id objc_msgSend_podcastStateDataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastStateDataSource");
}

id objc_msgSend_podcastStoreCollectionId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastStoreCollectionId");
}

id objc_msgSend_podcastStoreId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastStoreId");
}

id objc_msgSend_podcastStorePlatformDictionaryFromSiriAssetInfo_podcastAdamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastStorePlatformDictionaryFromSiriAssetInfo:podcastAdamId:");
}

id objc_msgSend_podcastTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastTitle");
}

id objc_msgSend_podcastUrlForStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastUrlForStoreId:");
}

id objc_msgSend_podcastUuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastUuid");
}

id objc_msgSend_podcastUuidForFeedUrlString_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastUuidForFeedUrlString:ctx:");
}

id objc_msgSend_podcastUuidForSetPlaybackQueueRequestIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastUuidForSetPlaybackQueueRequestIdentifier:");
}

id objc_msgSend_podcastUuids(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastUuids");
}

id objc_msgSend_podcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcasts");
}

id objc_msgSend_podcastsDomainVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastsDomainVersion");
}

id objc_msgSend_podcastsQuery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "podcastsQuery");
}

id objc_msgSend_pollingInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pollingInterval");
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popToRootViewControllerAnimated:");
}

id objc_msgSend_popToViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popToViewController:animated:");
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popoverPresentationController");
}

id objc_msgSend_populateEpisodeDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateEpisodeDictionary");
}

id objc_msgSend_populateLocationPropertiesWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateLocationPropertiesWithPath:");
}

id objc_msgSend_populateMagicMomentInfoCenterWithPlaybackRequestIdentifier_mrCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateMagicMomentInfoCenterWithPlaybackRequestIdentifier:mrCompletion:");
}

id objc_msgSend_postData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postData:");
}

id objc_msgSend_postManifestDidChangeNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postManifestDidChangeNotification");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_postNotificationName_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:userInfo:");
}

id objc_msgSend_postProcessFeedHookWithParams_podcastUuid_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postProcessFeedHookWithParams:podcastUuid:ctx:");
}

id objc_msgSend_preProcessFeedHook_requestUrl_needsUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preProcessFeedHook:requestUrl:needsUpdate:");
}

id objc_msgSend_preProcessFeedHookWithParams_feed_requestUrl_needsUpdate_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preProcessFeedHookWithParams:feed:requestUrl:needsUpdate:ctx:");
}

id objc_msgSend_preProcessHookDeniedUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preProcessHookDeniedUpdate");
}

id objc_msgSend_preWarmSheetMetricsOverlayDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preWarmSheetMetricsOverlayDictionary");
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicate");
}

id objc_msgSend_predicateForAllBookmarkedEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForAllBookmarkedEpisodes");
}

id objc_msgSend_predicateForAllEpisodesIncludingHiddenOnPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForAllEpisodesIncludingHiddenOnPodcastUuid:");
}

id objc_msgSend_predicateForAllEpisodesOnPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:");
}

id objc_msgSend_predicateForAllEpisodesOnPodcastUuid_includeNonAudioEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForAllEpisodesOnPodcastUuid:includeNonAudioEpisodes:");
}

id objc_msgSend_predicateForAreMediaAPI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForAreMediaAPI:");
}

id objc_msgSend_predicateForAudio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForAudio:");
}

id objc_msgSend_predicateForAutomaticDeletionOnShow_deletePlayedEpisodes_episodeLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForAutomaticDeletionOnShow:deletePlayedEpisodes:episodeLimit:");
}

id objc_msgSend_predicateForAutomaticDownloadsOnShow_deletePlayedEpisodes_episodeLimit_serialNextEpisodesSort_includePlayableWithoutAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForAutomaticDownloadsOnShow:deletePlayedEpisodes:episodeLimit:serialNextEpisodesSort:includePlayableWithoutAccount:");
}

id objc_msgSend_predicateForBacklog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForBacklog:");
}

id objc_msgSend_predicateForBookmarkedEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForBookmarkedEpisodes");
}

id objc_msgSend_predicateForBookmarkedEpisodesExcludingUUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForBookmarkedEpisodesExcludingUUIDs:");
}

id objc_msgSend_predicateForBookmarkedEpisodesOnPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForBookmarkedEpisodesOnPodcastUuid:");
}

id objc_msgSend_predicateForBookmarksOnlyInLocalAndBeforeLastSyncWithRemoteBookmarksUUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForBookmarksOnlyInLocalAndBeforeLastSyncWithRemoteBookmarksUUIDs:");
}

id objc_msgSend_predicateForBookmarksSyncType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForBookmarksSyncType");
}

id objc_msgSend_predicateForDateKey_isGreaterThanDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForDateKey:isGreaterThanDate:");
}

id objc_msgSend_predicateForDateKey_isGreaterThanOrEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForDateKey:isGreaterThanOrEqualToDate:");
}

id objc_msgSend_predicateForDateKey_isLessThanDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForDateKey:isLessThanDate:");
}

id objc_msgSend_predicateForDateKey_isLessThanOrEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForDateKey:isLessThanOrEqualToDate:");
}

id objc_msgSend_predicateForDownloadBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForDownloadBehavior:");
}

id objc_msgSend_predicateForDownloaded_excludeHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForDownloaded:excludeHidden:");
}

id objc_msgSend_predicateForDownloadedEpisodesOnPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForDownloadedEpisodesOnPodcastUuid:");
}

id objc_msgSend_predicateForEntitledEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEntitledEpisodes");
}

id objc_msgSend_predicateForEpisodeGuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodeGuid:");
}

id objc_msgSend_predicateForEpisodeGuid_onFeedURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodeGuid:onFeedURL:");
}

id objc_msgSend_predicateForEpisodeGuid_onPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodeGuid:onPodcastUuid:");
}

id objc_msgSend_predicateForEpisodeStoreTrackId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodeStoreTrackId:");
}

id objc_msgSend_predicateForEpisodeTitle_onPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodeTitle:onPodcastUuid:");
}

id objc_msgSend_predicateForEpisodeType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodeType:");
}

id objc_msgSend_predicateForEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodeUuid:");
}

id objc_msgSend_predicateForEpisodeUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodeUuids:");
}

id objc_msgSend_predicateForEpisodesInFeedForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesInFeedForPodcastUuid:");
}

id objc_msgSend_predicateForEpisodesInSearchResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesInSearchResults");
}

id objc_msgSend_predicateForEpisodesIsFromiTunesSyncOnPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesIsFromiTunesSyncOnPodcastUuid:");
}

id objc_msgSend_predicateForEpisodesOnPodcastUuid_deletePlayedEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesOnPodcastUuid:deletePlayedEpisodes:");
}

id objc_msgSend_predicateForEpisodesOnUnplayedTab(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesOnUnplayedTab");
}

id objc_msgSend_predicateForEpisodesOnUnplayedTabOnPodcastUuid_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesOnUnplayedTabOnPodcastUuid:ctx:");
}

id objc_msgSend_predicateForEpisodesPriceTypeChangedThisWeek(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesPriceTypeChangedThisWeek");
}

id objc_msgSend_predicateForEpisodesPublishedThisWeek(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesPublishedThisWeek");
}

id objc_msgSend_predicateForEpisodesWhichNeedEntitlementStateUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesWhichNeedEntitlementStateUpdate");
}

id objc_msgSend_predicateForEpisodesWhichNeedEntitlementStateUpdateForShowUUID_subscriptionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesWhichNeedEntitlementStateUpdateForShowUUID:subscriptionState:");
}

id objc_msgSend_predicateForEpisodesWithSeasonNumbersOnPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForEpisodesWithSeasonNumbersOnPodcastUuid:");
}

id objc_msgSend_predicateForExplicit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForExplicit:");
}

id objc_msgSend_predicateForExternalType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForExternalType:");
}

id objc_msgSend_predicateForFeedDeleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForFeedDeleted:");
}

id objc_msgSend_predicateForFilteringEpisodesWithEmptyPlayState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForFilteringEpisodesWithEmptyPlayState");
}

id objc_msgSend_predicateForFlag_isTrue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForFlag:isTrue:");
}

id objc_msgSend_predicateForHLSDownloadedExcludeHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForHLSDownloadedExcludeHidden:");
}

id objc_msgSend_predicateForHasBeenSynced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForHasBeenSynced:");
}

id objc_msgSend_predicateForHiddenOrImplicitlyFollowedPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForHiddenOrImplicitlyFollowedPodcasts");
}

id objc_msgSend_predicateForHiddenPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForHiddenPodcasts");
}

id objc_msgSend_predicateForIdentifer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForIdentifer:");
}

id objc_msgSend_predicateForIsFromiTunesSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForIsFromiTunesSync:");
}

id objc_msgSend_predicateForIsNew_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForIsNew:");
}

id objc_msgSend_predicateForLibraryEpisodesOnPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForLibraryEpisodesOnPodcastUuid:");
}

id objc_msgSend_predicateForListenNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForListenNow");
}

id objc_msgSend_predicateForListenNowForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForListenNowForPodcastUuid:");
}

id objc_msgSend_predicateForListenNowLatestEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForListenNowLatestEpisodes");
}

id objc_msgSend_predicateForMetadataFirstSyncEligible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForMetadataFirstSyncEligible:");
}

id objc_msgSend_predicateForNilLastDatePlayed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForNilLastDatePlayed");
}

id objc_msgSend_predicateForNilLastUserMarkedAsPlayedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForNilLastUserMarkedAsPlayedDate");
}

id objc_msgSend_predicateForNilValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForNilValueForKey:");
}

id objc_msgSend_predicateForNilValueOrEmptyStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForNilValueOrEmptyStringForKey:");
}

id objc_msgSend_predicateForNonNilLastDatePlayed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForNonNilLastDatePlayed");
}

id objc_msgSend_predicateForNonNilLastUserMarkedAsPlayedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForNonNilLastUserMarkedAsPlayedDate");
}

id objc_msgSend_predicateForNotHiddenNotImplicitlyFollowedPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForNotHiddenNotImplicitlyFollowedPodcasts");
}

id objc_msgSend_predicateForNotHiddenPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForNotHiddenPodcasts");
}

id objc_msgSend_predicateForNotImplicitlyFollowedPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForNotImplicitlyFollowedPodcasts");
}

id objc_msgSend_predicateForOtherEpisodesOnPodcastUuid_baseEpisodesPredicate_deletePlayedEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForOtherEpisodesOnPodcastUuid:baseEpisodesPredicate:deletePlayedEpisodes:");
}

id objc_msgSend_predicateForPeriodicallyUpdatablePodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPeriodicallyUpdatablePodcasts");
}

id objc_msgSend_predicateForPersistentId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPersistentId:");
}

id objc_msgSend_predicateForPlayStateManuallySet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPlayStateManuallySet:");
}

id objc_msgSend_predicateForPlayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPlayed:");
}

id objc_msgSend_predicateForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcast:");
}

id objc_msgSend_predicateForPodcast_sectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcast:sectionType:");
}

id objc_msgSend_predicateForPodcastIsNotHidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcastIsNotHidden");
}

id objc_msgSend_predicateForPodcastIsNotHiddenNotImplicitlyFollowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcastIsNotHiddenNotImplicitlyFollowed");
}

id objc_msgSend_predicateForPodcastIsSubscribed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcastIsSubscribed:");
}

id objc_msgSend_predicateForPodcastStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcastStoreId:");
}

id objc_msgSend_predicateForPodcastUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcastUUID:");
}

id objc_msgSend_predicateForPodcastUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcastUuids:");
}

id objc_msgSend_predicateForPodcastWithFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcastWithFeedUrl:");
}

id objc_msgSend_predicateForPodcastsNeedingRetry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPodcastsNeedingRetry:");
}

id objc_msgSend_predicateForPreviouslyPlayedHidingFutureTimestamps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPreviouslyPlayedHidingFutureTimestamps");
}

id objc_msgSend_predicateForPubDateLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForPubDateLimit:");
}

id objc_msgSend_predicateForRSSEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForRSSEpisodes");
}

id objc_msgSend_predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid_deletePlayedEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:deletePlayedEpisodes:");
}

id objc_msgSend_predicateForRecentlyUnfollowedOlderThanCutoffDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForRecentlyUnfollowedOlderThanCutoffDate");
}

id objc_msgSend_predicateForSaved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSaved:");
}

id objc_msgSend_predicateForSeasonNumberWithNoEpisodeNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSeasonNumberWithNoEpisodeNumber:");
}

id objc_msgSend_predicateForSentNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSentNotification:");
}

id objc_msgSend_predicateForSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSettings");
}

id objc_msgSend_predicateForStationEligibleEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForStationEligibleEpisodes");
}

id objc_msgSend_predicateForSubscribedAndNotHidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSubscribedAndNotHidden");
}

id objc_msgSend_predicateForSubscribedPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSubscribedPodcasts");
}

id objc_msgSend_predicateForSubscriptionSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSubscriptionSyncType:");
}

id objc_msgSend_predicateForSuppressAutoDownload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSuppressAutoDownload:");
}

id objc_msgSend_predicateForSyncablePodcastsForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForSyncablePodcastsForSyncType:");
}

id objc_msgSend_predicateForUnplayedTabFlag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForUnplayedTabFlag:");
}

id objc_msgSend_predicateForUserEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForUserEpisode:");
}

id objc_msgSend_predicateForUserEpisodesOnPodcastUuid_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForUserEpisodesOnPodcastUuid:ctx:");
}

id objc_msgSend_predicateForUserEpisodesOnPodcastUuid_episodeLimit_deletePlayedEpisodes_limitToDownloadBehaviorAutomatic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:");
}

id objc_msgSend_predicateForVisiblePlaylistWithUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForVisiblePlaylistWithUUID:");
}

id objc_msgSend_predicateForVisuallyPlayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForVisuallyPlayed:");
}

id objc_msgSend_predicateMatchingPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingPredicates:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_predicateWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithValue:");
}

id objc_msgSend_predicateWithValue_forProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithValue:forProperty:");
}

id objc_msgSend_preferencesURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferencesURL");
}

id objc_msgSend_preferredContentWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredContentWidth");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_preferredIntervals(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredIntervals");
}

id objc_msgSend_prepareAssetForFairPlayPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareAssetForFairPlayPlayback:");
}

id objc_msgSend_prepareAssetForFairPlayPlayback_legacy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareAssetForFairPlayPlayback_legacy:");
}

id objc_msgSend_prepareForPlatform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForPlatform:");
}

id objc_msgSend_prepareForPopoverPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForPopoverPresentation:");
}

id objc_msgSend_prepareForReuse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForReuse");
}

id objc_msgSend_prepareImageDataForPodcastUuid_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareImageDataForPodcastUuid:completion:");
}

id objc_msgSend_prepareIntentForEpisodeUuid_stationUuid_includeImage_includeStorePlatformData_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareIntentForEpisodeUuid:stationUuid:includeImage:includeStorePlatformData:completion:");
}

id objc_msgSend_prepareSearchableItemForEpisode_annotator_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareSearchableItemForEpisode:annotator:completion:");
}

id objc_msgSend_prepareSearchableItemForObject_annotator_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareSearchableItemForObject:annotator:completion:");
}

id objc_msgSend_prepareSearchableItemForPlayerItem_annotator_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareSearchableItemForPlayerItem:annotator:completion:");
}

id objc_msgSend_prepareSearchableItemForPodcast_annotator_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareSearchableItemForPodcast:annotator:completion:");
}

id objc_msgSend_prepareSearchableItemForStation_annotator_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareSearchableItemForStation:annotator:completion:");
}

id objc_msgSend_prepareSearchableItemsForObjectInArray_annotator_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareSearchableItemsForObjectInArray:annotator:completion:");
}

id objc_msgSend_preprocessFeedWithDataHashingBlock_feedCreationBlock_url_useBackgroundFetch_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preprocessFeedWithDataHashingBlock:feedCreationBlock:url:useBackgroundFetch:source:");
}

id objc_msgSend_presentAddPodcastUIWithUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentAddPodcastUIWithUrl:");
}

id objc_msgSend_presentAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentAnimated:completion:");
}

id objc_msgSend_presentEngagement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentEngagement");
}

id objc_msgSend_presentExplicitRestrictionAlertIfNeededOfType_actionCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentExplicitRestrictionAlertIfNeededOfType:actionCompletion:");
}

id objc_msgSend_presentExplicitRestrictionLaunchAlertIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentExplicitRestrictionLaunchAlertIfNeeded");
}

id objc_msgSend_presentModalWithHighlightedPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentModalWithHighlightedPodcastUuid:");
}

id objc_msgSend_presentNowPlayingAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentNowPlayingAnimated:");
}

id objc_msgSend_presentNowPlayingWithAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentNowPlayingWithAnimated:completion:");
}

id objc_msgSend_presentPodcast_episode_podcastTab_startPlayback_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentPodcast:episode:podcastTab:startPlayback:animated:");
}

id objc_msgSend_presentPodcast_episodeUuid_episodeNotAvailable_podcastTab_startPlayback_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentPodcast:episodeUuid:episodeNotAvailable:podcastTab:startPlayback:animated:");
}

id objc_msgSend_presentStation_new_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentStation:new:");
}

id objc_msgSend_presentStationWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentStationWithTitle:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentationController");
}

id objc_msgSend_presentationStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentationStyle");
}

id objc_msgSend_presentationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentationType");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_presentingButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentingButton");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentingViewController");
}

id objc_msgSend_prettyShortStringWithDuration_abbreviated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prettyShortStringWithDuration:abbreviated:");
}

id objc_msgSend_prettyShortStringWithDuration_includeTimeRemainingPhrase_abbreviated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prettyShortStringWithDuration:includeTimeRemainingPhrase:abbreviated:");
}

id objc_msgSend_prettyStringWithDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prettyStringWithDuration:");
}

id objc_msgSend_previousPlayingEpisodeUuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousPlayingEpisodeUuid");
}

id objc_msgSend_priceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "priceType");
}

id objc_msgSend_priceTypeIsPSUB(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "priceTypeIsPSUB");
}

id objc_msgSend_primaryTextColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "primaryTextColorForTheme:");
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "priority");
}

id objc_msgSend_privacyAcknowledgementNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privacyAcknowledgementNeeded");
}

id objc_msgSend_privatePathForDownload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privatePathForDownload");
}

id objc_msgSend_privateQueueContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privateQueueContext");
}

id objc_msgSend_processAnnouncementNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAnnouncementNotification:");
}

id objc_msgSend_processAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAssertion");
}

id objc_msgSend_processChangeAtIndexPath_forChangeType_newIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processChangeAtIndexPath:forChangeType:newIndexPath:");
}

id objc_msgSend_processFeed_podcastUUID_requestUrl_useBackgroundFetch_needsUpdate_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processFeed:podcastUUID:requestUrl:useBackgroundFetch:needsUpdate:source:");
}

id objc_msgSend_processFeedUpdateNotification_triggerBy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processFeedUpdateNotification:triggerBy:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processLatestPersistentHistoryTransactions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processLatestPersistentHistoryTransactions");
}

id objc_msgSend_processNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processNotification:");
}

id objc_msgSend_processNotificationsWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processNotificationsWithReason:");
}

id objc_msgSend_processPendingKeyInvalidations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processPendingKeyInvalidations");
}

id objc_msgSend_processResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processResults");
}

id objc_msgSend_processSubscriptionSyncNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processSubscriptionSyncNotification");
}

id objc_msgSend_processUPPSyncNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processUPPSyncNotification");
}

id objc_msgSend_processingCompletion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processingCompletion");
}

id objc_msgSend_processor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processor");
}

id objc_msgSend_processorForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processorForKey:");
}

id objc_msgSend_productURLForStoreCollectionId_storeTrackId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productURLForStoreCollectionId:storeTrackId:");
}

id objc_msgSend_promiseWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promiseWithResult:");
}

id objc_msgSend_promptAccountAuthenticationWithDebugReason_forced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promptAccountAuthenticationWithDebugReason:forced:");
}

id objc_msgSend_promptBeforePerformingIntentAsBufferedAirPlayForRoute_provider_queueStatus_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promptBeforePerformingIntentAsBufferedAirPlayForRoute:provider:queueStatus:completion:");
}

id objc_msgSend_promptBeforePerformingRequestAsBufferedAirPlay_queueStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promptBeforePerformingRequestAsBufferedAirPlay:queueStatus:");
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "properties");
}

id objc_msgSend_propertiesForMediaItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertiesForMediaItem");
}

id objc_msgSend_propertiesForMediaLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertiesForMediaLibrary");
}

id objc_msgSend_propertiesToFetchAssetURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertiesToFetchAssetURL");
}

id objc_msgSend_propertyDictionaryForSearchItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyDictionaryForSearchItem:");
}

id objc_msgSend_propertyKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyKeys");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_propertyPathForPodcastProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyPathForPodcastProperty:");
}

id objc_msgSend_propertySetWithRelationships_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertySetWithRelationships:");
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider");
}

id objc_msgSend_proxyShouldShowDialogForReason_podcastTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proxyShouldShowDialogForReason:podcastTitle:");
}

id objc_msgSend_prunePersistentHistory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prunePersistentHistory");
}

id objc_msgSend_pubDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pubDate");
}

id objc_msgSend_pubDateFromStoreMediaDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pubDateFromStoreMediaDictionary:");
}

id objc_msgSend_purgeExternalCookies(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeExternalCookies");
}

id objc_msgSend_purgeSubscriptionMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeSubscriptionMetadata");
}

id objc_msgSend_pushNotificationRegistration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushNotificationRegistration");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "query");
}

id objc_msgSend_queryObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryObserver");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queue");
}

id objc_msgSend_queueCommandCustomStatusForRequestStatus_queueType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueCommandCustomStatusForRequestStatus:queueType:");
}

id objc_msgSend_queueCommandStatusForRequestStatus_queueType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueCommandStatusForRequestStatus:queueType:");
}

id objc_msgSend_queuedInvocations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queuedInvocations");
}

id objc_msgSend_quickCheckForNeedsContainerMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quickCheckForNeedsContainerMigration");
}

id objc_msgSend_radioGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "radioGroup");
}

id objc_msgSend_radioGroupWithInitialValue_changeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "radioGroupWithInitialValue:changeHandler:");
}

id objc_msgSend_radioOptionWithTitle_radioGroup_value_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "radioOptionWithTitle:radioGroup:value:identifier:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_reachability(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reachability");
}

id objc_msgSend_reachabilityChangedFrom_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reachabilityChangedFrom:to:");
}

id objc_msgSend_reachabilityForInternetConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reachabilityForInternetConnection");
}

id objc_msgSend_readableWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readableWidth");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reason");
}

id objc_msgSend_reasonForNoInternet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reasonForNoInternet");
}

id objc_msgSend_reasonForNotPlayable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reasonForNotPlayable");
}

id objc_msgSend_reasonTextForNoInternet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reasonTextForNoInternet");
}

id objc_msgSend_recalculateAllPlaylists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recalculateAllPlaylists");
}

id objc_msgSend_recalculateEpisodeCounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recalculateEpisodeCounts");
}

id objc_msgSend_recalculateUpNextForShowWithFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recalculateUpNextForShowWithFeedUrl:");
}

id objc_msgSend_receiveOn_loader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveOn:loader:");
}

id objc_msgSend_record(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "record");
}

id objc_msgSend_recordEvent_dataSource_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordEvent:dataSource:data:");
}

id objc_msgSend_recordEvent_dataSource_data_topic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordEvent:dataSource:data:topic:");
}

id objc_msgSend_recordEvent_topic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordEvent:topic:");
}

id objc_msgSend_recordMTPlayerMetricsForCurrentItemWithCurrentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordMTPlayerMetricsForCurrentItemWithCurrentTime:");
}

id objc_msgSend_recordMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordMetrics");
}

id objc_msgSend_recordMetricsEventForAccessLog_playerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordMetricsEventForAccessLog:playerItem:");
}

id objc_msgSend_recordMetricsEventForErrorLog_withEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordMetricsEventForErrorLog:withEpisode:");
}

id objc_msgSend_recordMetricsEventForType_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordMetricsEventForType:withData:");
}

id objc_msgSend_recordMetricsForCurrentItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordMetricsForCurrentItem");
}

id objc_msgSend_recordUserAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordUserAction:");
}

id objc_msgSend_recordUserAction_dataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordUserAction:dataSource:");
}

id objc_msgSend_recordUserAction_dataSource_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordUserAction:dataSource:withData:");
}

id objc_msgSend_recordedPlayEventsForCurrentItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordedPlayEventsForCurrentItem");
}

id objc_msgSend_rectForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rectForRowAtIndexPath:");
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redColor");
}

id objc_msgSend_redirectURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redirectURL");
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refresh");
}

id objc_msgSend_refreshContentsOfUpdatedOrInsertedPlaylists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshContentsOfUpdatedOrInsertedPlaylists");
}

id objc_msgSend_refreshControl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshControl");
}

id objc_msgSend_refreshControlTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshControlTextColor");
}

id objc_msgSend_refreshDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshDelegate");
}

id objc_msgSend_refreshObject_mergeChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshObject:mergeChanges:");
}

id objc_msgSend_refreshSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshSettings");
}

id objc_msgSend_registerAVSessionCategoryAndMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerAVSessionCategoryAndMode");
}

id objc_msgSend_registerActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerActions:");
}

id objc_msgSend_registerBackgroundCompletion_forSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerBackgroundCompletion:forSession:");
}

id objc_msgSend_registerBackgroundTaskClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerBackgroundTaskClass:");
}

id objc_msgSend_registerClass_forCellWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellWithReuseIdentifier:");
}

id objc_msgSend_registerClass_forHeaderFooterViewReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forHeaderFooterViewReuseIdentifier:");
}

id objc_msgSend_registerClass_forSupplementaryViewOfKind_withReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:");
}

id objc_msgSend_registerDataProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDataProvider:");
}

id objc_msgSend_registerDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDefaults");
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDefaults:");
}

id objc_msgSend_registerForRemoteNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForRemoteNotifications");
}

id objc_msgSend_registerForTaskWithIdentifier_usingQueue_launchHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTaskWithIdentifier:usingQueue:launchHandler:");
}

id objc_msgSend_registerForUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForUpdates:");
}

id objc_msgSend_registerItemForTypeIdentifier_loadHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerItemForTypeIdentifier:loadHandler:");
}

id objc_msgSend_registerLaunchHandlers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerLaunchHandlers");
}

id objc_msgSend_registerManifestForRestoration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerManifestForRestoration:");
}

id objc_msgSend_registerPushNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerPushNotifications");
}

id objc_msgSend_registerSupportedQueueType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerSupportedQueueType:");
}

id objc_msgSend_registerUserSwitchStakeHolder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerUserSwitchStakeHolder:");
}

id objc_msgSend_relation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relation");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadData");
}

id objc_msgSend_reloadGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadGroupWithIdentifier:");
}

id objc_msgSend_reloadHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadHandler");
}

id objc_msgSend_reloadIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadIfNeeded");
}

id objc_msgSend_reloadRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadRowsAtIndexPaths:withRowAnimation:");
}

id objc_msgSend_reloadSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSections:withRowAnimation:");
}

id objc_msgSend_reloadSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSettings");
}

id objc_msgSend_remainingBackgroundTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remainingBackgroundTime");
}

id objc_msgSend_remeberBookmark(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remeberBookmark");
}

id objc_msgSend_remoteSkipBackward_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteSkipBackward:");
}

id objc_msgSend_remoteSkipForward_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteSkipForward:");
}

id objc_msgSend_remoteSkipPreference(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteSkipPreference");
}

id objc_msgSend_removalAllFairPlayKeysWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removalAllFairPlayKeysWithCompletion:");
}

id objc_msgSend_removeAccount_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAccount:withCompletionHandler:");
}

id objc_msgSend_removeAllDeliveredNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllDeliveredNotifications");
}

id objc_msgSend_removeAllDonations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllDonations");
}

id objc_msgSend_removeAllHLSDownloadAssets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllHLSDownloadAssets");
}

id objc_msgSend_removeAllKeyDataWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllKeyDataWithCompletion:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeAllPendingNotificationRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllPendingNotificationRequests");
}

id objc_msgSend_removeCapacityChangeObserverWith_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCapacityChangeObserverWith:");
}

id objc_msgSend_removeChangeNotifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeChangeNotifier:");
}

id objc_msgSend_removeDeliveredNotificationsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDeliveredNotificationsWithIdentifiers:");
}

id objc_msgSend_removeDismissRecognizer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDismissRecognizer");
}

id objc_msgSend_removeDonationForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDonationForPodcastUuid:");
}

id objc_msgSend_removeDonationsForEpisodeUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDonationsForEpisodeUuids:");
}

id objc_msgSend_removeDownload_shouldAllowAutomaticRedownloads_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDownload:shouldAllowAutomaticRedownloads:completion:");
}

id objc_msgSend_removeDownloadAssetsForEpisodeAdamIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDownloadAssetsForEpisodeAdamIds:");
}

id objc_msgSend_removeDownloadAssetsForEpisodeUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDownloadAssetsForEpisodeUuids:");
}

id objc_msgSend_removeDownloadAssetsForEpisodeUuids_shouldKeep_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDownloadAssetsForEpisodeUuids:shouldKeep:");
}

id objc_msgSend_removeEpisode_inBulkTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEpisode:inBulkTransaction:");
}

id objc_msgSend_removeEpisodeAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEpisodeAtIndex:");
}

id objc_msgSend_removeEpisodeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEpisodeObserver:");
}

id objc_msgSend_removeEpisodeObserverForPodcasts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEpisodeObserverForPodcasts:");
}

id objc_msgSend_removeEpisodesForUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEpisodesForUuid:");
}

id objc_msgSend_removeFromPlaybackQueueCommand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromPlaybackQueueCommand");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeGestureRecognizer:");
}

id objc_msgSend_removeIndexPath_forObject_fromMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeIndexPath:forObject:fromMap:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeItemWithContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemWithContentID:");
}

id objc_msgSend_removeItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItems:");
}

id objc_msgSend_removeItemsWithPrefx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemsWithPrefx:");
}

id objc_msgSend_removeKeyDataForStoreTrackID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeKeyDataForStoreTrackID:");
}

id objc_msgSend_removeKeyFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeKeyFor:");
}

id objc_msgSend_removeMetadataForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeMetadataForPodcastUuid:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectIdenticalTo:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePendingNotificationRequestsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePendingNotificationRequestsWithIdentifiers:");
}

id objc_msgSend_removePlayedDownloadsSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePlayedDownloadsSetting");
}

id objc_msgSend_removePlaylistsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePlaylistsObject:");
}

id objc_msgSend_removePodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePodcast:");
}

id objc_msgSend_removeSettingAtIndex_fromGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSettingAtIndex:fromGroupWithIdentifier:");
}

id objc_msgSend_removeSubscribeParamsForFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSubscribeParamsForFeedUrl:");
}

id objc_msgSend_removeTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTarget:");
}

id objc_msgSend_removeTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTarget:action:forControlEvents:");
}

id objc_msgSend_reorderItemWithContentId_afterItemWithContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reorderItemWithContentId:afterItemWithContentID:");
}

id objc_msgSend_reorderLocalPodcastsToMatchRemote_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reorderLocalPodcastsToMatchRemote:");
}

id objc_msgSend_reorderQueueCommand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reorderQueueCommand");
}

id objc_msgSend_replaceIntent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceIntent");
}

id objc_msgSend_report(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "report");
}

id objc_msgSend_report_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "report:userInfo:");
}

id objc_msgSend_reportBookmarksSyncIssue_bookmarksSyncType_version_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportBookmarksSyncIssue:bookmarksSyncType:version:userInfo:");
}

id objc_msgSend_reportIfLocalAssetHasiPodLibraryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportIfLocalAssetHasiPodLibraryURL:");
}

id objc_msgSend_reportImportingRemotePodcast_withLocalPodcast_shouldAddPodcast_shouldUnsubscribeLocalPodcast_shouldUpdateSettings_mismatch_version_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportImportingRemotePodcast:withLocalPodcast:shouldAddPodcast:shouldUnsubscribeLocalPodcast:shouldUpdateSettings:mismatch:version:");
}

id objc_msgSend_reportKeyIntegrityError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportKeyIntegrityError");
}

id objc_msgSend_reportMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportMetrics");
}

id objc_msgSend_reportPlaybackFromStore_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportPlaybackFromStore:reason:");
}

id objc_msgSend_reportStatsForPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportStatsForPodcasts");
}

id objc_msgSend_reportStopReason_withInitiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportStopReason:withInitiator:");
}

id objc_msgSend_reportSubscriptionsSyncIssue_subscriptionSyncType_version_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportSubscriptionsSyncIssue:subscriptionSyncType:version:userInfo:");
}

id objc_msgSend_reportSyncAuthenticationErrorFor_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportSyncAuthenticationErrorFor:error:");
}

id objc_msgSend_reportWithMarker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportWithMarker:");
}

id objc_msgSend_reportWithType_userInfo_location_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportWithType:userInfo:location:reason:");
}

id objc_msgSend_reportedItemVersionForIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportedItemVersionForIdentifier");
}

id objc_msgSend_reportingStringForPlayReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingStringForPlayReason:");
}

id objc_msgSend_representedElementKind(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "representedElementKind");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "request");
}

id objc_msgSend_request_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "request:");
}

id objc_msgSend_requestAuthorizationWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAuthorizationWithOptions:completionHandler:");
}

id objc_msgSend_requestError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestError");
}

id objc_msgSend_requestIdentifierForPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestIdentifierForPlayerItem:");
}

id objc_msgSend_requestIdentifiersForManifest_queueStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestIdentifiersForManifest:queueStatus:");
}

id objc_msgSend_requestImageWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestImageWithCompletionHandler:");
}

id objc_msgSend_requestMediaLibraryReadTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestMediaLibraryReadTransaction:");
}

id objc_msgSend_requestMediaLibraryWriteTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestMediaLibraryWriteTransaction:");
}

id objc_msgSend_requestMediaLibraryWriteTransaction_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestMediaLibraryWriteTransaction:completion:");
}

id objc_msgSend_requestParams(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestParams");
}

id objc_msgSend_requestSecureDeletionOf_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestSecureDeletionOf:completionHandler:");
}

id objc_msgSend_requestStatusForMediaRemoteStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestStatusForMediaRemoteStatus:");
}

id objc_msgSend_requestWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithContext:");
}

id objc_msgSend_requestWithIdentifier_content_trigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithIdentifier:content:trigger:");
}

id objc_msgSend_requestWithParams_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithParams:callback:");
}

id objc_msgSend_requesterDsid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requesterDsid");
}

id objc_msgSend_requestsAreNonAppInitiated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestsAreNonAppInitiated");
}

id objc_msgSend_requiresMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiresMigration");
}

id objc_msgSend_requiresStartDelayToAvoidClampErrors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiresStartDelayToAvoidClampErrors");
}

id objc_msgSend_rescheduleTasksIfNotScheduledWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rescheduleTasksIfNotScheduledWithIdentifier:completion:");
}

id objc_msgSend_rescheduleTasksWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rescheduleTasksWithIdentifier:completion:");
}

id objc_msgSend_rescheduleTransactionWithFinishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rescheduleTransactionWithFinishedBlock:");
}

id objc_msgSend_rescheduleTransactionWithNewVersion_key_finishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rescheduleTransactionWithNewVersion:key:finishedBlock:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reset");
}

id objc_msgSend_resetAcceptedCredentials(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetAcceptedCredentials");
}

id objc_msgSend_resetAccountIdentifierForLastSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetAccountIdentifierForLastSync");
}

id objc_msgSend_resetAllSubscriptionSyncVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetAllSubscriptionSyncVersion");
}

id objc_msgSend_resetBookmarksSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetBookmarksSync");
}

id objc_msgSend_resetCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetCache");
}

id objc_msgSend_resetForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetForSyncType:");
}

id objc_msgSend_resetGoDarkWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetGoDarkWithReason:");
}

id objc_msgSend_resetInterestSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetInterestSync");
}

id objc_msgSend_resetKeychainItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetKeychainItem");
}

id objc_msgSend_resetMetadataToInitialState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetMetadataToInitialState");
}

id objc_msgSend_resetNonFollowedShowsSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetNonFollowedShowsSync");
}

id objc_msgSend_resetPlaylistSyncVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetPlaylistSyncVersion");
}

id objc_msgSend_resetSubscriptionsLastSyncTimestampFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetSubscriptionsLastSyncTimestampFor:");
}

id objc_msgSend_resetSubscriptionsSyncVersionFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetSubscriptionsSyncVersionFor:");
}

id objc_msgSend_resetToInitialState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetToInitialState");
}

id objc_msgSend_resetToInitialStateForced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetToInitialStateForced:");
}

id objc_msgSend_resetToInitialStateIfIncomplete(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetToInitialStateIfIncomplete");
}

id objc_msgSend_resetToInitialStateIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetToInitialStateIfNeeded");
}

id objc_msgSend_resetUppLastSyncTimeAndDomainVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetUppLastSyncTimeAndDomainVersion");
}

id objc_msgSend_resetVersionForAllFeedUrls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetVersionForAllFeedUrls");
}

id objc_msgSend_resetVersionForFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetVersionForFeedUrl:");
}

id objc_msgSend_resetableImportContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetableImportContext");
}

id objc_msgSend_resettingToInitialState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resettingToInitialState");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resignFirstResponder");
}

id objc_msgSend_resizableImageWithCapInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resizableImageWithCapInsets:");
}

id objc_msgSend_resizedArtworkURLString_withDimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resizedArtworkURLString:withDimension:");
}

id objc_msgSend_resolveActivePlayerPathWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveActivePlayerPathWithCompletion:");
}

id objc_msgSend_resolveAvailabilityDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveAvailabilityDate");
}

id objc_msgSend_resolveError_transaction_resolution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveError:transaction:resolution:");
}

id objc_msgSend_resolveWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveWithCompletion:");
}

id objc_msgSend_resolvedColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolvedColor");
}

id objc_msgSend_resolvedEnclosureUrl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolvedEnclosureUrl");
}

id objc_msgSend_resolvedFeedURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolvedFeedURL");
}

id objc_msgSend_resolvedSyncClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolvedSyncClass");
}

id objc_msgSend_resolvedSyncController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolvedSyncController");
}

id objc_msgSend_resourceSpecifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceSpecifier");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "response");
}

id objc_msgSend_responseDomainVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseDomainVersion");
}

id objc_msgSend_responseTypeForTransaction_withData_forKey_mismatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseTypeForTransaction:withData:forKey:mismatch:");
}

id objc_msgSend_restorationCompletions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restorationCompletions");
}

id objc_msgSend_restorationQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restorationQueue");
}

id objc_msgSend_restoreActivity_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreActivity:completion:");
}

id objc_msgSend_restoreBackgroundDownloadTasksWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreBackgroundDownloadTasksWithCompletion:");
}

id objc_msgSend_restoreDownloadedEpisodes_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreDownloadedEpisodes:completion:");
}

id objc_msgSend_restoreFromUserActivity_startPlayback_reason_interactive_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreFromUserActivity:startPlayback:reason:interactive:completion:");
}

id objc_msgSend_restoreFromUserActivity_withManifest_startPlayback_reason_interactive_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreFromUserActivity:withManifest:startPlayback:reason:interactive:completion:");
}

id objc_msgSend_restorePlayerManifestWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restorePlayerManifestWithCompletion:");
}

id objc_msgSend_restorePreviouslyDownloadedEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restorePreviouslyDownloadedEpisodes");
}

id objc_msgSend_restoreSelection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreSelection");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "result");
}

id objc_msgSend_results_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "results:");
}

id objc_msgSend_resultsAreFrozen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultsAreFrozen");
}

id objc_msgSend_resultsChangedWithDeletedIds_insertIds_updatedIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultsChangedWithDeletedIds:insertIds:updatedIds:");
}

id objc_msgSend_resumeOrPauseEpisodeDownloadWithUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resumeOrPauseEpisodeDownloadWithUuid:");
}

id objc_msgSend_resyncWhenDone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resyncWhenDone");
}

id objc_msgSend_retainArguments(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retainArguments");
}

id objc_msgSend_retrieveArtwork_withSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveArtwork:withSize:");
}

id objc_msgSend_retrieveArtwork_withSize_atTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveArtwork:withSize:atTime:");
}

id objc_msgSend_retrySeconds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrySeconds");
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reuseIdentifier");
}

id objc_msgSend_reuseIdentifierForRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reuseIdentifierForRow:");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_rollbackIfNecessaryWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rollbackIfNecessaryWithCompletion:");
}

id objc_msgSend_rollbackMigrationV40IfNeededInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rollbackMigrationV40IfNeededInContext:");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_route(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "route");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "row");
}

id objc_msgSend_rowAnimation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowAnimation");
}

id objc_msgSend_rowHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowHeight");
}

id objc_msgSend_runBlockWhenReady_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runBlockWhenReady:");
}

id objc_msgSend_runCoreDataMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runCoreDataMigration");
}

id objc_msgSend_runDataMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runDataMigration");
}

id objc_msgSend_runImageFormatMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runImageFormatMigration");
}

id objc_msgSend_runImageStoreMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runImageStoreMigration");
}

id objc_msgSend_runImageStorePathMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runImageStorePathMigration");
}

id objc_msgSend_runMigrationForPodcast_version_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runMigrationForPodcast:version:");
}

id objc_msgSend_runMigrationOnAllEpisodesForVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runMigrationOnAllEpisodesForVersion:");
}

id objc_msgSend_runMigrationOnEpisodesByPodcastForVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runMigrationOnEpisodesByPodcastForVersion:");
}

id objc_msgSend_runQueryInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runQueryInContext:");
}

id objc_msgSend_runQueryWithPodcastPredicate_episodePredicate_channelPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runQueryWithPodcastPredicate:episodePredicate:channelPredicate:");
}

id objc_msgSend_saveController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveController");
}

id objc_msgSend_saveDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveDelegate");
}

id objc_msgSend_saveInCurrentBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveInCurrentBlock");
}

id objc_msgSend_saveNewPlaylists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveNewPlaylists");
}

id objc_msgSend_savePartialUploadStateIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "savePartialUploadStateIndexPath:");
}

id objc_msgSend_saveSubscriptionMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveSubscriptionMetadata");
}

id objc_msgSend_saveToUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveToUserDefaults");
}

id objc_msgSend_saved(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saved");
}

id objc_msgSend_savedPartialUploadStateIndexPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "savedPartialUploadStateIndexPath");
}

id objc_msgSend_savedSections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "savedSections");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scale");
}

id objc_msgSend_scaleToSize_addBorder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaleToSize:addBorder:");
}

id objc_msgSend_schedule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "schedule:");
}

id objc_msgSend_schedule_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "schedule:completion:");
}

id objc_msgSend_scheduleApnSubscriptionTransactionWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleApnSubscriptionTransactionWithDictionary:");
}

id objc_msgSend_scheduleDefaultDeferralDeadline(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleDefaultDeferralDeadline");
}

id objc_msgSend_scheduleEpisodeStateGetWithFeedUrls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleEpisodeStateGetWithFeedUrls:");
}

id objc_msgSend_scheduleEpisodeStatePutWithFeedUrls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleEpisodeStatePutWithFeedUrls:");
}

id objc_msgSend_scheduleFeedUpdateIdleBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleFeedUpdateIdleBlock:");
}

id objc_msgSend_scheduleGetTransactionWithKeys_processor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleGetTransactionWithKeys:processor:");
}

id objc_msgSend_scheduleIndexAllIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleIndexAllIfNecessary");
}

id objc_msgSend_scheduleLocalNotificationForPodcast_schedulingOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleLocalNotificationForPodcast:schedulingOptions:completion:");
}

id objc_msgSend_scheduleSetTransactionWithKeys_processor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleSetTransactionWithKeys:processor:");
}

id objc_msgSend_scheduleStoreURLRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleStoreURLRequest:");
}

id objc_msgSend_scheduleTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleTransaction:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheme");
}

id objc_msgSend_scoreFromModifiedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scoreFromModifiedDate:");
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollView");
}

id objc_msgSend_scrubbing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrubbing");
}

id objc_msgSend_searchCacheForEpisodeMatchingMediaItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchCacheForEpisodeMatchingMediaItem:");
}

id objc_msgSend_searchUrlForSearchText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchUrlForSearchText:");
}

id objc_msgSend_searchableIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchableIndex");
}

id objc_msgSend_searchableIndex_indexSearchableItems_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchableIndex:indexSearchableItems:completionHandler:");
}

id objc_msgSend_seasonNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seasonNumber");
}

id objc_msgSend_seasonNumbers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seasonNumbers");
}

id objc_msgSend_seasonSortDescriptorsForSortOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seasonSortDescriptorsForSortOrder");
}

id objc_msgSend_seasonTrailerInSeason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seasonTrailerInSeason:");
}

id objc_msgSend_secItemFormatToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secItemFormatToDictionary:");
}

id objc_msgSend_secondAttribute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondAttribute");
}

id objc_msgSend_secondItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondItem");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondaryLabelColor");
}

id objc_msgSend_secondaryTextColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondaryTextColorForTheme:");
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "section");
}

id objc_msgSend_sectionDidChangeContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionDidChangeContent:");
}

id objc_msgSend_sectionFooterFloatingDisabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionFooterFloatingDisabled");
}

id objc_msgSend_sectionFooterFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionFooterFont");
}

id objc_msgSend_sectionHeaderIndexPathForItemIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionHeaderIndexPathForItemIndexPath:");
}

id objc_msgSend_sectionHeaderViewForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionHeaderViewForIndexPath:");
}

id objc_msgSend_sectionNameKeyPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionNameKeyPath");
}

id objc_msgSend_sectionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionType");
}

id objc_msgSend_sectionWillChangeContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionWillChangeContent:");
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sections");
}

id objc_msgSend_secureDownloadRenewalManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secureDownloadRenewalManager");
}

id objc_msgSend_secureKeyLoader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secureKeyLoader");
}

id objc_msgSend_segmentsDownloadedDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "segmentsDownloadedDuration");
}

id objc_msgSend_selectAppearancePathIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectAppearancePathIfNecessary");
}

id objc_msgSend_selectFeaturedTab(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectFeaturedTab");
}

id objc_msgSend_selectItemAtIndexPath_animated_scrollPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectItemAtIndexPath:animated:scrollPosition:");
}

id objc_msgSend_selectItemWithUuid_forceScroll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectItemWithUuid:forceScroll:");
}

id objc_msgSend_selectMyPodcastsTab(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectMyPodcastsTab");
}

id objc_msgSend_selectMyPodcastsTabAndPopToRoot_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectMyPodcastsTabAndPopToRoot:animated:completion:");
}

id objc_msgSend_selectRoute_operation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectRoute:operation:completion:");
}

id objc_msgSend_selectRowAtIndexPath_animated_scrollPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectRowAtIndexPath:animated:scrollPosition:");
}

id objc_msgSend_selectSearchTabAndFocusSearchField(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectSearchTabAndFocusSearchField");
}

id objc_msgSend_selectUnplayedTabAndPopToRoot_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectUnplayedTabAndPopToRoot:animated:completion:");
}

id objc_msgSend_selectedBackgroundColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedBackgroundColorForTheme:");
}

id objc_msgSend_selectedIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedIndex");
}

id objc_msgSend_selectedOptionIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedOptionIndex");
}

id objc_msgSend_selectedPlayerTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedPlayerTime");
}

id objc_msgSend_selectedReferenceTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedReferenceTime");
}

id objc_msgSend_selectedUuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedUuid");
}

id objc_msgSend_selectionFadeDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectionFadeDuration");
}

id objc_msgSend_selectorForRefreshControl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectorForRefreshControl");
}

id objc_msgSend_semanticContentAttribute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "semanticContentAttribute");
}

id objc_msgSend_sendCommand_toDestination_withOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCommand:toDestination:withOptions:completion:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendPlaybackQueue_toDestination_withOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendPlaybackQueue:toDestination:withOptions:completion:");
}

id objc_msgSend_sendStopRequestForStreamingLicenseIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendStopRequestForStreamingLicenseIfNecessary");
}

id objc_msgSend_sendSubviewToBack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSubviewToBack:");
}

id objc_msgSend_sentNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sentNotification");
}

id objc_msgSend_separator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "separator");
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "separatorColor");
}

id objc_msgSend_separatorColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "separatorColorForTheme:");
}

id objc_msgSend_separatorInset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "separatorInset");
}

id objc_msgSend_separatorInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "separatorInsets");
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialQueue");
}

id objc_msgSend_serializer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializer");
}

id objc_msgSend_seriesName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seriesName");
}

id objc_msgSend_serpentId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serpentId");
}

id objc_msgSend_serpentIdFromAdamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serpentIdFromAdamId:");
}

id objc_msgSend_serverAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverAddress");
}

id objc_msgSend_serverClampErrorWithTransaction_retrySeconds_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverClampErrorWithTransaction:retrySeconds:underlyingError:");
}

id objc_msgSend_serverResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverResponse");
}

id objc_msgSend_serverRevisionNewerThanClientKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverRevisionNewerThanClientKeys");
}

id objc_msgSend_sessionCompletionHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionCompletionHandler");
}

id objc_msgSend_sessionDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionDelegate");
}

id objc_msgSend_sessionForBackgroundDownloads(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionForBackgroundDownloads");
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionIdentifier");
}

id objc_msgSend_sessionIdentifierDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionIdentifierDidChange");
}

id objc_msgSend_sessionIdentifierOverride(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionIdentifierOverride");
}

id objc_msgSend_sessionTaskStateReloaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionTaskStateReloaded");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAccessLogEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessLogEvent:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryView:");
}

id objc_msgSend_setAccountAgreedTermsVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountAgreedTermsVersion:");
}

id objc_msgSend_setAccountIdentifierForLastSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountIdentifierForLastSync:");
}

id objc_msgSend_setAccountOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountOverride:");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setActionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionBlock:");
}

id objc_msgSend_setActionButtons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionButtons:");
}

id objc_msgSend_setActionObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionObject:");
}

id objc_msgSend_setActiveAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveAccount:");
}

id objc_msgSend_setActiveNotificationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveNotificationName:");
}

id objc_msgSend_setActivityIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityIndicator:");
}

id objc_msgSend_setAddPodcastsViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddPodcastsViewController:");
}

id objc_msgSend_setAdded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdded:");
}

id objc_msgSend_setAddedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddedDate:");
}

id objc_msgSend_setAddedPlaylists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddedPlaylists:");
}

id objc_msgSend_setAddedSubscriptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddedSubscriptions:");
}

id objc_msgSend_setAdjustContentOffsetForRefreshControlAsNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustContentOffsetForRefreshControlAsNeeded:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAdjustsImageWhenDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsImageWhenDisabled:");
}

id objc_msgSend_setAdjustsImageWhenHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsImageWhenHighlighted:");
}

id objc_msgSend_setAlbum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlbum:");
}

id objc_msgSend_setAlertController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlertController:");
}

id objc_msgSend_setAllPodcastsSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllPodcastsSelected:");
}

id objc_msgSend_setAllPropertyChangeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllPropertyChangeObserver:");
}

id objc_msgSend_setAllowKeyForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowKeyForValue:");
}

id objc_msgSend_setAllowServerDialogs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowServerDialogs:");
}

id objc_msgSend_setAllowedUnits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedUnits:");
}

id objc_msgSend_setAllowsGroupOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsGroupOpacity:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAlwaysBounceHorizontal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysBounceHorizontal:");
}

id objc_msgSend_setAlwaysBounceVertical_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysBounceVertical:");
}

id objc_msgSend_setAnalyticsChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnalyticsChannel:");
}

id objc_msgSend_setAnimationsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationsEnabled:");
}

id objc_msgSend_setAppController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppController:");
}

id objc_msgSend_setApplicationActivities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplicationActivities:");
}

id objc_msgSend_setArgument_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArgument:atIndex:");
}

id objc_msgSend_setArrayValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArrayValue:");
}

id objc_msgSend_setArtist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtist:");
}

id objc_msgSend_setArtwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtwork:");
}

id objc_msgSend_setArtworkBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkBackgroundColor:");
}

id objc_msgSend_setArtworkHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkHeight:");
}

id objc_msgSend_setArtworkKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkKey:");
}

id objc_msgSend_setArtworkPrimaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkPrimaryColor:");
}

id objc_msgSend_setArtworkProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkProvider:");
}

id objc_msgSend_setArtworkRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkRequests:");
}

id objc_msgSend_setArtworkTemplateURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkTemplateURL:");
}

id objc_msgSend_setArtworkTextPrimaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkTextPrimaryColor:");
}

id objc_msgSend_setArtworkTextQuaternaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkTextQuaternaryColor:");
}

id objc_msgSend_setArtworkTextSecondaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkTextSecondaryColor:");
}

id objc_msgSend_setArtworkTextTertiaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkTextTertiaryColor:");
}

id objc_msgSend_setArtworkUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkUrl:");
}

id objc_msgSend_setArtworkView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkView:");
}

id objc_msgSend_setArtworkWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtworkWidth:");
}

id objc_msgSend_setAssetStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetStatus:");
}

id objc_msgSend_setAssetURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetURL:");
}

id objc_msgSend_setAssetUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetUrl:");
}

id objc_msgSend_setAttachments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttachments:");
}

id objc_msgSend_setAttributeSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributeSet:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAttributedTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedTitle:");
}

id objc_msgSend_setAudio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudio:");
}

id objc_msgSend_setAuthenticatedDark_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticatedDark:");
}

id objc_msgSend_setAuthenticationNeededTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationNeededTimestamp:");
}

id objc_msgSend_setAuthenticationRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationRequest");
}

id objc_msgSend_setAuthenticationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationType:");
}

id objc_msgSend_setAuthor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthor:");
}

id objc_msgSend_setAuthorNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthorNames:");
}

id objc_msgSend_setAuthors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthors:");
}

id objc_msgSend_setAutoDownloadEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoDownloadEnabled:");
}

id objc_msgSend_setAutoDownloadType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoDownloadType:");
}

id objc_msgSend_setAutoDownloadsSettingsGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoDownloadsSettingsGroup:");
}

id objc_msgSend_setAutoResumePlaybackQueueAndStartPlayback_playerController_forceLocal_reason_interactive_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoResumePlaybackQueueAndStartPlayback:playerController:forceLocal:reason:interactive:completion:");
}

id objc_msgSend_setAutocapitalizationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocapitalizationType:");
}

id objc_msgSend_setAutomaticallySuggestsEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticallySuggestsEpisodes:");
}

id objc_msgSend_setAutorefreshRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutorefreshRate:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAvailableActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvailableActions:");
}

id objc_msgSend_setBackCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackCatalog:");
}

id objc_msgSend_setBackOffUntil_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackOffUntil:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundImage_forToolbarPosition_barMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundImage:forToolbarPosition:barMetrics:");
}

id objc_msgSend_setBackgroundTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundTask:");
}

id objc_msgSend_setBackgroundTaskAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundTaskAssertion:");
}

id objc_msgSend_setBackgroundTaskId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundTaskId:");
}

id objc_msgSend_setBackgroundTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundTaskIdentifier:");
}

id objc_msgSend_setBackgroundTaskScheduler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundTaskScheduler:");
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundView:");
}

id objc_msgSend_setBadgeNumber_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeNumber:withCompletionHandler:");
}

id objc_msgSend_setBadgeValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeValue:");
}

id objc_msgSend_setBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBag:");
}

id objc_msgSend_setBagContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBagContext:");
}

id objc_msgSend_setBagLookupEndTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBagLookupEndTime:");
}

id objc_msgSend_setBagLookupStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBagLookupStartTime:");
}

id objc_msgSend_setBagLookupTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBagLookupTask:");
}

id objc_msgSend_setBagSpecifiedPollingInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBagSpecifiedPollingInterval:");
}

id objc_msgSend_setBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBarButtonItem:");
}

id objc_msgSend_setBaseURLForGETAll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaseURLForGETAll:");
}

id objc_msgSend_setBaseURLForPUTAll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaseURLForPUTAll:");
}

id objc_msgSend_setBaselineAdjustment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaselineAdjustment:");
}

id objc_msgSend_setBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlock:");
}

id objc_msgSend_setBlurRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlurRadius:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setBookmarkTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBookmarkTime:");
}

id objc_msgSend_setBookmarksSyncVersion_syncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBookmarksSyncVersion:syncType:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setBounceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounceStyle:");
}

id objc_msgSend_setButtonBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonBlock:");
}

id objc_msgSend_setButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonItem:");
}

id objc_msgSend_setButtonItemBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonItemBlock:");
}

id objc_msgSend_setButtonLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonLabel:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObjectsFromArray:");
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObjectsFromSet:");
}

id objc_msgSend_setByteSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByteSize:");
}

id objc_msgSend_setCanDeletePlaylistUUIDBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanDeletePlaylistUUIDBlock:");
}

id objc_msgSend_setCanRequestStoreSignIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanRequestStoreSignIn:");
}

id objc_msgSend_setCancelType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelType:");
}

id objc_msgSend_setCanceled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanceled:");
}

id objc_msgSend_setCancelsTouchesInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelsTouchesInView:");
}

id objc_msgSend_setCategories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategories:");
}

id objc_msgSend_setCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategory:");
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategoryIdentifier:");
}

id objc_msgSend_setCausalityObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCausalityObserver:");
}

id objc_msgSend_setCell_enabled_withDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCell:enabled:withDescription:");
}

id objc_msgSend_setChangeGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChangeGenerator:");
}

id objc_msgSend_setChangeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChangeHandler:");
}

id objc_msgSend_setChangeIsUserDriven_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChangeIsUserDriven:");
}

id objc_msgSend_setChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChannel:");
}

id objc_msgSend_setChannelPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChannelPredicate:");
}

id objc_msgSend_setChannelResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChannelResults:");
}

id objc_msgSend_setChannelStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChannelStoreId:");
}

id objc_msgSend_setChapterMetadataMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChapterMetadataMode:");
}

id objc_msgSend_setChapters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChapters:");
}

id objc_msgSend_setCleanedTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCleanedTitle:");
}

id objc_msgSend_setClearButtonMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClearButtonMode:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCloudSyncBugReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudSyncBugReporter:");
}

id objc_msgSend_setCloudSyncController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudSyncController:");
}

id objc_msgSend_setCloudSyncIsDirty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudSyncIsDirty:");
}

id objc_msgSend_setCloudSyncVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudSyncVersion:");
}

id objc_msgSend_setCollectionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCollectionIdentifier:");
}

id objc_msgSend_setCollectionView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCollectionView:");
}

id objc_msgSend_setColorTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColorTheme:");
}

id objc_msgSend_setCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletion:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setCompletionDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionDate:");
}

id objc_msgSend_setCompletions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletions:");
}

id objc_msgSend_setCompositeManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompositeManifest:");
}

id objc_msgSend_setCompositingFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompositingFilter:");
}

id objc_msgSend_setConditionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConditionBlock:");
}

id objc_msgSend_setConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfig:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConsecutiveFeedFetchErrors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConsecutiveFeedFetchErrors:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainer:");
}

id objc_msgSend_setContainerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerIdentifier:");
}

id objc_msgSend_setContainerOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerOrder:");
}

id objc_msgSend_setContainerTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerTitle:");
}

id objc_msgSend_setContentAttributeSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentAttributeSet:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentCreationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentCreationDate:");
}

id objc_msgSend_setContentDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentDescription:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:");
}

id objc_msgSend_setContentOffset_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:animated:");
}

id objc_msgSend_setContentRating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentRating:");
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentSize:");
}

id objc_msgSend_setContentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentType:");
}

id objc_msgSend_setContentURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentURL:");
}

id objc_msgSend_setContentVerticalAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentVerticalAlignment:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setControlHitOutsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControlHitOutsets:");
}

id objc_msgSend_setController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setController:");
}

id objc_msgSend_setCornerCurve_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerCurve:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCorrupt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCorrupt:");
}

id objc_msgSend_setCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCount:");
}

id objc_msgSend_setCounterForGeneratingLibraryChangeNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCounterForGeneratingLibraryChangeNotifications:");
}

id objc_msgSend_setCurrentActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentActivity:");
}

id objc_msgSend_setCurrentDeserializer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentDeserializer:");
}

id objc_msgSend_setCurrentEpisodeDownloaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentEpisodeDownloaded:");
}

id objc_msgSend_setCurrentIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentIndex:");
}

id objc_msgSend_setCurrentItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentItem:");
}

id objc_msgSend_setCurrentKVSTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentKVSTransaction:");
}

id objc_msgSend_setCurrentManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentManifest:");
}

id objc_msgSend_setCurrentPlaybackSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPlaybackSessionIdentifier:");
}

id objc_msgSend_setCurrentPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPlayerItem:");
}

id objc_msgSend_setCurrentPodcastFeedURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPodcastFeedURL:");
}

id objc_msgSend_setCurrentShareMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentShareMode:");
}

id objc_msgSend_setCurrentTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTime:");
}

id objc_msgSend_setCurrentTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTransaction:");
}

id objc_msgSend_setCustomHeaderHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomHeaderHeight:");
}

id objc_msgSend_setDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDSID:");
}

id objc_msgSend_setDSIDCheckTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDSIDCheckTimestamp");
}

id objc_msgSend_setDark_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDark:");
}

id objc_msgSend_setDarkCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDarkCount:");
}

id objc_msgSend_setDarkCountLocal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDarkCountLocal:");
}

id objc_msgSend_setDataAccessQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataAccessQueue:");
}

id objc_msgSend_setDataDetectorTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataDetectorTypes:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDataSourceTransactionContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSourceTransactionContext:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDateToFireNextTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateToFireNextTimer:");
}

id objc_msgSend_setDebugReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDebugReason:");
}

id objc_msgSend_setDefaultInstance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultInstance:");
}

id objc_msgSend_setDefaultMetricsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultMetricsController:");
}

id objc_msgSend_setDefaultSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultSettings:");
}

id objc_msgSend_setDefaultsNotifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultsNotifier:");
}

id objc_msgSend_setDefaultsObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultsObserver:");
}

id objc_msgSend_setDeferredEpisodeUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeferredEpisodeUuids:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeleteButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeleteButton:");
}

id objc_msgSend_setDeleteButtonBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeleteButtonBlock:");
}

id objc_msgSend_setDeletePlayedEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeletePlayedEpisodes:");
}

id objc_msgSend_setDeleteStationAlertController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeleteStationAlertController:");
}

id objc_msgSend_setDeletedEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeletedEpisodes:");
}

id objc_msgSend_setDerivedPropertyValue_forKey_forPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDerivedPropertyValue:forKey:forPodcast:");
}

id objc_msgSend_setDeviceAgreedTermsVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceAgreedTermsVersion:");
}

id objc_msgSend_setDeviceCapacityObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceCapacityObserver:");
}

id objc_msgSend_setDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDictionary:");
}

id objc_msgSend_setDidBecomeActiveWhileMigrating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidBecomeActiveWhileMigrating:");
}

id objc_msgSend_setDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisabled:");
}

id objc_msgSend_setDisabledReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisabledReason:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setDisplayStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayStyle:");
}

id objc_msgSend_setDisplayType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayType:");
}

id objc_msgSend_setDomainIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDomainIdentifier:");
}

id objc_msgSend_setDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDouble:forKey:");
}

id objc_msgSend_setDownloadBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadBehavior:");
}

id objc_msgSend_setDownloadIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadIdentifier:");
}

id objc_msgSend_setDownloadManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadManager:");
}

id objc_msgSend_setDownloaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloaded:");
}

id objc_msgSend_setDownloadedCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadedCount:");
}

id objc_msgSend_setDownloadedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadedDate:");
}

id objc_msgSend_setDownloadedEpisodesCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadedEpisodesCount:");
}

id objc_msgSend_setDownloadedQueryObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadedQueryObserver:");
}

id objc_msgSend_setDownloadedUnplayedEpisodesCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadedUnplayedEpisodesCount:");
}

id objc_msgSend_setDownloadingCenterIconType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadingCenterIconType:");
}

id objc_msgSend_setDownloadsSettingsGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadsSettingsGroup:");
}

id objc_msgSend_setDryRun_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDryRun:");
}

id objc_msgSend_setDsidCheckTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDsidCheckTimestamp:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEarliestBeginDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEarliestBeginDate:");
}

id objc_msgSend_setEarliestEpisodeAvailabilityDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEarliestEpisodeAvailabilityDate:");
}

id objc_msgSend_setEditable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditable:");
}

id objc_msgSend_setEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditing:");
}

id objc_msgSend_setEditing_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditing:animated:");
}

id objc_msgSend_setEditingStyleFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditingStyleFlags:");
}

id objc_msgSend_setElapsedTime_playbackRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElapsedTime:playbackRate:");
}

id objc_msgSend_setEligibleForHandoff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEligibleForHandoff:");
}

id objc_msgSend_setEligibleForPublicIndexing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEligibleForPublicIndexing:");
}

id objc_msgSend_setEligibleForSearch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEligibleForSearch:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEnabledActionTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabledActionTypes:");
}

id objc_msgSend_setEnclosureURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnclosureURL:");
}

id objc_msgSend_setEndedEpisodeUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndedEpisodeUuids:");
}

id objc_msgSend_setEnqueuedByAnotherUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnqueuedByAnotherUser:");
}

id objc_msgSend_setEntitledDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntitledDuration:");
}

id objc_msgSend_setEntitledEnclosureURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntitledEnclosureURL:");
}

id objc_msgSend_setEntitledPriceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntitledPriceType:");
}

id objc_msgSend_setEntitledTranscriptIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntitledTranscriptIdentifier:");
}

id objc_msgSend_setEntitledTranscriptProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntitledTranscriptProvider:");
}

id objc_msgSend_setEntitledTranscriptSnippet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntitledTranscriptSnippet:");
}

id objc_msgSend_setEntity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntity:");
}

id objc_msgSend_setEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisode:");
}

id objc_msgSend_setEpisodeAdamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeAdamID:");
}

id objc_msgSend_setEpisodeAdamIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeAdamIds:");
}

id objc_msgSend_setEpisodeCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeCount:");
}

id objc_msgSend_setEpisodeDisplayGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeDisplayGroup:");
}

id objc_msgSend_setEpisodeGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeGUID:");
}

id objc_msgSend_setEpisodeGuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeGuid:");
}

id objc_msgSend_setEpisodeIntents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeIntents:");
}

id objc_msgSend_setEpisodeLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeLevel:");
}

id objc_msgSend_setEpisodeLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeLimit:");
}

id objc_msgSend_setEpisodeName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeName:");
}

id objc_msgSend_setEpisodeNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeNumber:");
}

id objc_msgSend_setEpisodeObservers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeObservers:");
}

id objc_msgSend_setEpisodeOrderSettingsGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeOrderSettingsGroup:");
}

id objc_msgSend_setEpisodePredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodePredicate:");
}

id objc_msgSend_setEpisodeResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeResults:");
}

id objc_msgSend_setEpisodeSerpentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeSerpentID:");
}

id objc_msgSend_setEpisodeShareUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeShareUrl:");
}

id objc_msgSend_setEpisodeSortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeSortDescriptors:");
}

id objc_msgSend_setEpisodeStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeStoreId:");
}

id objc_msgSend_setEpisodeTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeTitle:");
}

id objc_msgSend_setEpisodeType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeType:");
}

id objc_msgSend_setEpisodeUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeUUID:");
}

id objc_msgSend_setEpisodeUUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeUUIDs:");
}

id objc_msgSend_setEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeUuid:");
}

id objc_msgSend_setEpisodeUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodeUuids:");
}

id objc_msgSend_setEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodes:");
}

id objc_msgSend_setEpisodesToKeepSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodesToKeepSetting:");
}

id objc_msgSend_setEpisodesToShow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEpisodesToShow:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setErrorCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorCode:");
}

id objc_msgSend_setErrorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorDomain:");
}

id objc_msgSend_setEstimatedRowHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEstimatedRowHeight:");
}

id objc_msgSend_setEventType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventType:");
}

id objc_msgSend_setExcludeUnentitled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExcludeUnentitled:");
}

id objc_msgSend_setExcludedActivityTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExcludedActivityTypes:");
}

id objc_msgSend_setExclusionPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExclusionPaths:");
}

id objc_msgSend_setExclusiveTouch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExclusiveTouch:");
}

id objc_msgSend_setExistingDownloadedEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExistingDownloadedEpisodes:");
}

id objc_msgSend_setExpanded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpanded:");
}

id objc_msgSend_setExpirationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationBlock:");
}

id objc_msgSend_setExpirationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationDate:");
}

id objc_msgSend_setExpirationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationHandler:");
}

id objc_msgSend_setExplicit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExplicit:");
}

id objc_msgSend_setExplicitSortOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExplicitSortOrder:");
}

id objc_msgSend_setExportableSessionTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportableSessionTypes:");
}

id objc_msgSend_setExtendedLanguageTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExtendedLanguageTag:");
}

id objc_msgSend_setExternalFeedDownloader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExternalFeedDownloader:");
}

id objc_msgSend_setExternalType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExternalType:");
}

id objc_msgSend_setFairPlayInvalidationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFairPlayInvalidationManager:");
}

id objc_msgSend_setFairPlayKeyLoader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFairPlayKeyLoader:");
}

id objc_msgSend_setFairPlayKeySession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFairPlayKeySession:");
}

id objc_msgSend_setFairPlayMigrationBackgroundTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFairPlayMigrationBackgroundTask:");
}

id objc_msgSend_setFatalSyncError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFatalSyncError:");
}

id objc_msgSend_setFeedChangedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedChangedDate:");
}

id objc_msgSend_setFeedDeleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedDeleted:");
}

id objc_msgSend_setFeedProcessingQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedProcessingQueue:");
}

id objc_msgSend_setFeedURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedURL:");
}

id objc_msgSend_setFeedUpdateBeginTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedUpdateBeginTime:");
}

id objc_msgSend_setFeedUpdateNeedsRetry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedUpdateNeedsRetry:");
}

id objc_msgSend_setFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeedUrl:");
}

id objc_msgSend_setFetchBatchSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchBatchSize:");
}

id objc_msgSend_setFetchLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchLimit:");
}

id objc_msgSend_setFetchOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchOffset:");
}

id objc_msgSend_setFetchPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchPredicate:");
}

id objc_msgSend_setFetchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchRequest:");
}

id objc_msgSend_setFilteringDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilteringDisabled:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFinishedHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFinishedHandler:");
}

id objc_msgSend_setFirstTimeAvailableAsFree_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstTimeAvailableAsFree:");
}

id objc_msgSend_setFirstTimeAvailableAsPaid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstTimeAvailableAsPaid:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setFloat_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFloat:forKey:");
}

id objc_msgSend_setFloating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFloating:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFooterCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFooterCallback:");
}

id objc_msgSend_setFooterText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFooterText:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFrc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrc:");
}

id objc_msgSend_setFreeDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFreeDuration:");
}

id objc_msgSend_setFreeEnclosureURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFreeEnclosureURL:");
}

id objc_msgSend_setFreePriceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFreePriceType:");
}

id objc_msgSend_setFreeTranscriptIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFreeTranscriptIdentifier:");
}

id objc_msgSend_setFreeTranscriptProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFreeTranscriptProvider:");
}

id objc_msgSend_setFreeTranscriptSnippet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFreeTranscriptSnippet:");
}

id objc_msgSend_setGeneratedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGeneratedDate:");
}

id objc_msgSend_setGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGenerator:");
}

id objc_msgSend_setGlobalCellularEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGlobalCellularEnabled:");
}

id objc_msgSend_setGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroup:");
}

id objc_msgSend_setGroupFooter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupFooter:");
}

id objc_msgSend_setGroupIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupIdentifier:");
}

id objc_msgSend_setGroupSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupSettings:");
}

id objc_msgSend_setGroupTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupTitle:");
}

id objc_msgSend_setGroupingType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupingType:");
}

id objc_msgSend_setGroups_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroups:");
}

id objc_msgSend_setGuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGuid:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHasBeenPlayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasBeenPlayed:");
}

id objc_msgSend_setHasBeenSynced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasBeenSynced:");
}

id objc_msgSend_setHasCheckQueued_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasCheckQueued:");
}

id objc_msgSend_setHasDeferredIndexAll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasDeferredIndexAll:");
}

id objc_msgSend_setHasFRCChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasFRCChanges:");
}

id objc_msgSend_setHasFetchedInitialAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasFetchedInitialAccount:");
}

id objc_msgSend_setHasIndexingOperationInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasIndexingOperationInProgress:");
}

id objc_msgSend_setHasReportedThisEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasReportedThisEpisode:");
}

id objc_msgSend_setHasResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasResults:");
}

id objc_msgSend_setHeaderAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaderAction:");
}

id objc_msgSend_setHeaderCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaderCallback:");
}

id objc_msgSend_setHeaderTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaderTitle:");
}

id objc_msgSend_setHeightTracksTextView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeightTracksTextView:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHidesPlayedEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesPlayedEpisodes:");
}

id objc_msgSend_setHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlighted:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setITunesMatchEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setITunesMatchEnabled:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIgnoreServerTrustEvaluation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreServerTrustEvaluation:");
}

id objc_msgSend_setIgnoreSystemFilterPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreSystemFilterPredicates:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImage_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:forState:");
}

id objc_msgSend_setImageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageURL:");
}

id objc_msgSend_setImageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageView:");
}

id objc_msgSend_setImportDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImportDate:");
}

id objc_msgSend_setImportSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImportSource:");
}

id objc_msgSend_setImporting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImporting:");
}

id objc_msgSend_setIncludedResultKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludedResultKeys:");
}

id objc_msgSend_setIncludesAllPodcasts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludesAllPodcasts:");
}

id objc_msgSend_setIndex_forCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndex:forCount:");
}

id objc_msgSend_setIndexAllBatchGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndexAllBatchGenerator:");
}

id objc_msgSend_setIndexDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndexDelegate:");
}

id objc_msgSend_setIndexPathShifter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndexPathShifter:");
}

id objc_msgSend_setInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInformation:");
}

id objc_msgSend_setInitialEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialEpisodeUuid:");
}

id objc_msgSend_setInitialFeedUpdateCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialFeedUpdateCount:");
}

id objc_msgSend_setInitialIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialIndex:");
}

id objc_msgSend_setInitialIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialIndexPath:");
}

id objc_msgSend_setInitialPlayheadPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialPlayheadPosition:");
}

id objc_msgSend_setInitialSubscribedPodcastsCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialSubscribedPodcastsCount:");
}

id objc_msgSend_setInitiatedByAnotherUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitiatedByAnotherUser:");
}

id objc_msgSend_setInitiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitiator:");
}

id objc_msgSend_setInstanceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstanceIdentifier:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setIntents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntents:");
}

id objc_msgSend_setInterLevelSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterLevelSpacing:");
}

id objc_msgSend_setInteractive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractive:");
}

id objc_msgSend_setInterruptEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptEvent:");
}

id objc_msgSend_setInvalidationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationManager:");
}

id objc_msgSend_setIsActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsActive:");
}

id objc_msgSend_setIsBookmarked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBookmarked:");
}

id objc_msgSend_setIsBookmarksMigrationRecoveredEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBookmarksMigrationRecoveredEpisode:");
}

id objc_msgSend_setIsBuiltIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBuiltIn:");
}

id objc_msgSend_setIsComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsComplete:");
}

id objc_msgSend_setIsDeviceStorageSpaceAvailableForPersistence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsDeviceStorageSpaceAvailableForPersistence:");
}

id objc_msgSend_setIsDirty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsDirty:");
}

id objc_msgSend_setIsExplicit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsExplicit:");
}

id objc_msgSend_setIsFolder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFolder:");
}

id objc_msgSend_setIsFromITunesSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFromITunesSync:");
}

id objc_msgSend_setIsGenius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsGenius:");
}

id objc_msgSend_setIsHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsHidden:");
}

id objc_msgSend_setIsHiddenOrImplicitlyFollowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsHiddenOrImplicitlyFollowed:");
}

id objc_msgSend_setIsInitialPrepare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInitialPrepare:");
}

id objc_msgSend_setIsItunesPlaylist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsItunesPlaylist:");
}

id objc_msgSend_setIsItunesSmartPlaylist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsItunesSmartPlaylist:");
}

id objc_msgSend_setIsItunesU_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsItunesU:");
}

id objc_msgSend_setIsLoaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsLoaded:");
}

id objc_msgSend_setIsManifestRestorationOngoing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsManifestRestorationOngoing:");
}

id objc_msgSend_setIsMigrating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsMigrating:");
}

id objc_msgSend_setIsMissingAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsMissingAsset:");
}

id objc_msgSend_setIsNew_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsNew:");
}

id objc_msgSend_setIsNotSubscribeable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsNotSubscribeable:");
}

id objc_msgSend_setIsObserving_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsObserving:");
}

id objc_msgSend_setIsOnTheGo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsOnTheGo:");
}

id objc_msgSend_setIsPlayingFullScreenVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPlayingFullScreenVideo:");
}

id objc_msgSend_setIsPlaylistSyncDirty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPlaylistSyncDirty:");
}

id objc_msgSend_setIsRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRunning:");
}

id objc_msgSend_setIsSerialPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSerialPodcast:");
}

id objc_msgSend_setIsSleepingOnStartDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSleepingOnStartDelay:");
}

id objc_msgSend_setIsSmart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSmart:");
}

id objc_msgSend_setIsStopping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsStopping:");
}

id objc_msgSend_setIsUngroupedList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsUngroupedList:");
}

id objc_msgSend_setIsVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsVideo:");
}

id objc_msgSend_setItemDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemDescription:");
}

id objc_msgSend_setItemDescriptionHasHTML_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemDescriptionHasHTML:");
}

id objc_msgSend_setItemDescriptionWithoutHTML_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemDescriptionWithoutHTML:");
}

id objc_msgSend_setItemIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemIdentifier:");
}

id objc_msgSend_setItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItems:");
}

id objc_msgSend_setItunesSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItunesSubtitle:");
}

id objc_msgSend_setItunesTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItunesTitle:");
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKey:");
}

id objc_msgSend_setKeyStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyStorage:");
}

id objc_msgSend_setKeyValueStoreController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyValueStoreController:");
}

id objc_msgSend_setKeyValueStoreControllerForUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyValueStoreControllerForUrl:");
}

id objc_msgSend_setKeyboardType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardType:");
}

id objc_msgSend_setKeychainData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeychainData:");
}

id objc_msgSend_setKvsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKvsController:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLargeTitleDisplayMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLargeTitleDisplayMode:");
}

id objc_msgSend_setLastAppUseDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastAppUseDate:");
}

id objc_msgSend_setLastBookmarkedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastBookmarkedDate:");
}

id objc_msgSend_setLastBookmarksSyncTimestamp_syncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastBookmarksSyncTimestamp:syncType:");
}

id objc_msgSend_setLastCheckTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastCheckTime:");
}

id objc_msgSend_setLastDatePlayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastDatePlayed:");
}

id objc_msgSend_setLastFetchedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastFetchedDate:");
}

id objc_msgSend_setLastLaunchFromDatabase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastLaunchFromDatabase");
}

id objc_msgSend_setLastPlaybackPositionSaveTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastPlaybackPositionSaveTime:");
}

id objc_msgSend_setLastPlaybackSaveTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastPlaybackSaveTime:");
}

id objc_msgSend_setLastPlayedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastPlayedDate:");
}

id objc_msgSend_setLastRecordedItemURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastRecordedItemURL:");
}

id objc_msgSend_setLastRemovedFromUpNextDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastRemovedFromUpNextDate:");
}

id objc_msgSend_setLastStoreEpisodesInfoCheckDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastStoreEpisodesInfoCheckDate:");
}

id objc_msgSend_setLastStorePodcastInfoCheckDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastStorePodcastInfoCheckDate:");
}

id objc_msgSend_setLastSyncTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastSyncTimestamp:");
}

id objc_msgSend_setLastUnfollowedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastUnfollowedDate:");
}

id objc_msgSend_setLastUsedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastUsedDate:");
}

id objc_msgSend_setLastUserMarkedAsPlayedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastUserMarkedAsPlayedDate:");
}

id objc_msgSend_setLatestEpisodeAvailabilityDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestEpisodeAvailabilityDate:");
}

id objc_msgSend_setLatestEpisodeAvailabilityTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestEpisodeAvailabilityTime:");
}

id objc_msgSend_setLatestPersistentHistoryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestPersistentHistoryToken:");
}

id objc_msgSend_setLatestUPPSubtask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestUPPSubtask:");
}

id objc_msgSend_setLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutMargins:");
}

id objc_msgSend_setLayoutMarginsFollowReadableWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutMarginsFollowReadableWidth:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setLeftView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftView:");
}

id objc_msgSend_setLeftViewMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftViewMode:");
}

id objc_msgSend_setLevelCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLevelCornerRadius:");
}

id objc_msgSend_setLevelWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLevelWidth:");
}

id objc_msgSend_setLibraryActionControllerBridge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLibraryActionControllerBridge:");
}

id objc_msgSend_setLibraryDataProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLibraryDataProvider:");
}

id objc_msgSend_setLibraryDataVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLibraryDataVersion:");
}

id objc_msgSend_setLibraryEpisodesCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLibraryEpisodesCount:");
}

id objc_msgSend_setLibraryImageStoreType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLibraryImageStoreType:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLineFragmentPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineFragmentPadding:");
}

id objc_msgSend_setListenNowEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListenNowEpisode:");
}

id objc_msgSend_setListenNowQueryObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListenNowQueryObserver:");
}

id objc_msgSend_setLoadQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLoadQueue:");
}

id objc_msgSend_setLocal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocal:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocation:");
}

id objc_msgSend_setLongTitles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLongTitles:");
}

id objc_msgSend_setMagicMomentPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMagicMomentPlayerItem:");
}

id objc_msgSend_setMainBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMainBlock:");
}

id objc_msgSend_setManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifest:");
}

id objc_msgSend_setManifest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifest:completion:");
}

id objc_msgSend_setManifest_startPlayback_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifest:startPlayback:context:completion:");
}

id objc_msgSend_setManifest_startPlayback_forceLocal_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifest:startPlayback:forceLocal:context:completion:");
}

id objc_msgSend_setManifest_startPlayback_forceLocal_reason_interactive_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifest:startPlayback:forceLocal:reason:interactive:completion:");
}

id objc_msgSend_setManifest_startPlayback_reason_interactive_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifest:startPlayback:reason:interactive:completion:");
}

id objc_msgSend_setManifestAsDryRun_reason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifestAsDryRun:reason:completion:");
}

id objc_msgSend_setManifestIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifestIdentifier:");
}

id objc_msgSend_setManifestIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManifestIndex:");
}

id objc_msgSend_setMarketingPushHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMarketingPushHandler:");
}

id objc_msgSend_setMaskView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaskView:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMaxTitleWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxTitleWidth:");
}

id objc_msgSend_setMaximumFractionDigits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumFractionDigits:");
}

id objc_msgSend_setMaximumLevelHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumLevelHeight:");
}

id objc_msgSend_setMaximumNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumNumberOfLines:");
}

id objc_msgSend_setMediaItemDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaItemDictionary:");
}

id objc_msgSend_setMediaItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaItems:");
}

id objc_msgSend_setMediaLibraryId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaLibraryId:");
}

id objc_msgSend_setMediaRemoteController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaRemoteController:");
}

id objc_msgSend_setMediaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaType:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setMessageLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessageLabel:");
}

id objc_msgSend_setMetadataCommandCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataCommandCenter:");
}

id objc_msgSend_setMetadataFirstSyncEligible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataFirstSyncEligible:");
}

id objc_msgSend_setMetadataIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataIdentifier:");
}

id objc_msgSend_setMetadataInfoCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataInfoCenter:");
}

id objc_msgSend_setMetadataItemsFromDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataItemsFromDataSource:");
}

id objc_msgSend_setMetadataItemsFromKVSStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataItemsFromKVSStorage:");
}

id objc_msgSend_setMetadataItemsToCommitToDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataItemsToCommitToDataSource:");
}

id objc_msgSend_setMetadataItemsToCommitToKVSStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataItemsToCommitToKVSStorage:");
}

id objc_msgSend_setMetadataTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadataTimestamp:");
}

id objc_msgSend_setMetricDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetricDataSource:");
}

id objc_msgSend_setMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetrics:");
}

id objc_msgSend_setMetricsOverlay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetricsOverlay:");
}

id objc_msgSend_setMetricsPlayStartPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetricsPlayStartPosition:");
}

id objc_msgSend_setMetricsPlayStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetricsPlayStartTime:");
}

id objc_msgSend_setMigrationPresenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMigrationPresenter:");
}

id objc_msgSend_setMigrationToDeltaFeedUpdatesComplete(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMigrationToDeltaFeedUpdatesComplete");
}

id objc_msgSend_setMinimumInteritemSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumInteritemSpacing:");
}

id objc_msgSend_setMinimumLevelHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumLevelHeight:");
}

id objc_msgSend_setMinimumLineSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumLineSpacing:");
}

id objc_msgSend_setMinimumScaleFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumScaleFactor:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setModifiedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifiedDate:");
}

id objc_msgSend_setModifiedDateScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifiedDateScore:");
}

id objc_msgSend_setMultipleSelectionBackgroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMultipleSelectionBackgroundView:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNaturalRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNaturalRect:");
}

id objc_msgSend_setNeedsArtworkUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsArtworkUpdate:");
}

id objc_msgSend_setNeedsFrozenCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsFrozenCheck:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNeedsSyncing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsSyncing");
}

id objc_msgSend_setNeedsUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsUpdate");
}

id objc_msgSend_setNeedsUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsUpdate:");
}

id objc_msgSend_setNetworkStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkStatus:");
}

id objc_msgSend_setNetworkUPPEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkUPPEnabled:");
}

id objc_msgSend_setNetworkingBlocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkingBlocked");
}

id objc_msgSend_setNetworkingBlockedUntil_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkingBlockedUntil:");
}

id objc_msgSend_setNextEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNextEpisodeUuid:");
}

id objc_msgSend_setNoteObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNoteObserver:");
}

id objc_msgSend_setNotificationCategories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationCategories:");
}

id objc_msgSend_setNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotifications:");
}

id objc_msgSend_setNotificationsSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationsSetting:");
}

id objc_msgSend_setNowPlayingInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNowPlayingInfo:");
}

id objc_msgSend_setNumMetadataItemsFromDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumMetadataItemsFromDataSource:");
}

id objc_msgSend_setNumMetadataItemsFromKVSStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumMetadataItemsFromKVSStorage:");
}

id objc_msgSend_setNumMetadataItemsToCommitToDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumMetadataItemsToCommitToDataSource:");
}

id objc_msgSend_setNumMetadataItemsToCommitToKVSStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumMetadataItemsToCommitToKVSStorage:");
}

id objc_msgSend_setNumberOfColumns_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfColumns:");
}

id objc_msgSend_setNumberOfLevels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLevels:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberOfResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfResults:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setNumberValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberValue:");
}

id objc_msgSend_setObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObjectManipulationDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObjectManipulationDelegate:");
}

id objc_msgSend_setObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObjects:");
}

id objc_msgSend_setObserving_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObserving:");
}

id objc_msgSend_setOfferTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOfferTypes:");
}

id objc_msgSend_setOffers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOffers:");
}

id objc_msgSend_setOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOn:");
}

id objc_msgSend_setOn_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOn:animated:");
}

id objc_msgSend_setOnScreenForVolumeDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnScreenForVolumeDisplay:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setOpen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpen:");
}

id objc_msgSend_setOpen_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpen:animated:");
}

id objc_msgSend_setOperationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOperationType:");
}

id objc_msgSend_setOptionSelectedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptionSelectedBlock:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrder:");
}

id objc_msgSend_setOriginalPodcastFeedURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalPodcastFeedURL:");
}

id objc_msgSend_setPageType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPageType:");
}

id objc_msgSend_setParagraphSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParagraphSpacing:");
}

id objc_msgSend_setParagraphSpacingBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParagraphSpacingBefore:");
}

id objc_msgSend_setParentMediaLibraryId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParentMediaLibraryId:");
}

id objc_msgSend_setPartiallyOffTheTop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPartiallyOffTheTop:");
}

id objc_msgSend_setPassthroughViews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPassthroughViews:");
}

id objc_msgSend_setPausable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPausable:");
}

id objc_msgSend_setPaused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPaused:");
}

id objc_msgSend_setPendingCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingCompletion:");
}

id objc_msgSend_setPendingDeferredUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingDeferredUpdate:");
}

id objc_msgSend_setPendingDeserializations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingDeserializations:");
}

id objc_msgSend_setPendingRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingRequest:");
}

id objc_msgSend_setPendingUserDefaultArchivedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingUserDefaultArchivedData:");
}

id objc_msgSend_setPermittedArrowDirections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPermittedArrowDirections:");
}

id objc_msgSend_setPersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentID:");
}

id objc_msgSend_setPersistentId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentId:");
}

id objc_msgSend_setPersistentIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentIds:");
}

id objc_msgSend_setPersonalizeRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonalizeRequests:");
}

id objc_msgSend_setPidToUuidMapping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPidToUuidMapping:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setPlatformSyncPlayheadChangeObserverBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlatformSyncPlayheadChangeObserverBlock:");
}

id objc_msgSend_setPlayCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayCount:");
}

id objc_msgSend_setPlayReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayReason:");
}

id objc_msgSend_setPlayState_manually_forUserActionOnEpisode_saveChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayState:manually:forUserActionOnEpisode:saveChanges:");
}

id objc_msgSend_setPlayState_manually_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayState:manually:source:");
}

id objc_msgSend_setPlayStateManuallySet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayStateManuallySet:");
}

id objc_msgSend_setPlayable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayable:");
}

id objc_msgSend_setPlaybackDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackDestination:");
}

id objc_msgSend_setPlaybackOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackOrder:");
}

id objc_msgSend_setPlaybackPositionController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackPositionController:");
}

id objc_msgSend_setPlaybackQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackQueue:");
}

id objc_msgSend_setPlaybackQueueCommand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackQueueCommand");
}

id objc_msgSend_setPlaybackQueueController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackQueueController:");
}

id objc_msgSend_setPlaybackQueueDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackQueueDataSource:");
}

id objc_msgSend_setPlaybackQueueForRequest_playerController_siriAssetInfo_enqueuer_savePlayHistory_startPlayback_forceLocal_isMagicMoment_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackQueueForRequest:playerController:siriAssetInfo:enqueuer:savePlayHistory:startPlayback:forceLocal:isMagicMoment:completion:");
}

id objc_msgSend_setPlaybackSessionCommand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackSessionCommand");
}

id objc_msgSend_setPlaybackSpeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackSpeed:");
}

id objc_msgSend_setPlaybackState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackState:");
}

id objc_msgSend_setPlayed_manually_forUserActionOnEpisode_saveChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayed:manually:forUserActionOnEpisode:saveChanges:");
}

id objc_msgSend_setPlayed_manually_forUserActionOnEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayed:manually:forUserActionOnEpisodeUuid:");
}

id objc_msgSend_setPlayed_manually_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayed:manually:source:");
}

id objc_msgSend_setPlayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayer:");
}

id objc_msgSend_setPlayerController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerController:");
}

id objc_msgSend_setPlayerItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerItems:");
}

id objc_msgSend_setPlayerItemsNeedLoading_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerItemsNeedLoading:");
}

id objc_msgSend_setPlayerManifestRestored_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerManifestRestored:");
}

id objc_msgSend_setPlayerPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerPath:");
}

id objc_msgSend_setPlayerRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerRoute:");
}

id objc_msgSend_setPlayhead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayhead:");
}

id objc_msgSend_setPlayingItemProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayingItemProperties:");
}

id objc_msgSend_setPlaylist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaylist:");
}

id objc_msgSend_setPlaylistName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaylistName:");
}

id objc_msgSend_setPlaylistSyncDirtyFlag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaylistSyncDirtyFlag:");
}

id objc_msgSend_setPlaylistSyncVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaylistSyncVersion:");
}

id objc_msgSend_setPlaylistUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaylistUuid:");
}

id objc_msgSend_setPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcast:");
}

id objc_msgSend_setPodcastAdamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastAdamID:");
}

id objc_msgSend_setPodcastAdamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastAdamId:");
}

id objc_msgSend_setPodcastFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastFeedUrl:");
}

id objc_msgSend_setPodcastName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastName:");
}

id objc_msgSend_setPodcastPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastPID:");
}

id objc_msgSend_setPodcastPersistentId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastPersistentId:");
}

id objc_msgSend_setPodcastPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastPredicate:");
}

id objc_msgSend_setPodcastResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastResults:");
}

id objc_msgSend_setPodcastSortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastSortDescriptors:");
}

id objc_msgSend_setPodcastStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastStoreId:");
}

id objc_msgSend_setPodcastTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastTitle:");
}

id objc_msgSend_setPodcastUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastUUID:");
}

id objc_msgSend_setPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastUuid:");
}

id objc_msgSend_setPodcastUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastUuids:");
}

id objc_msgSend_setPodcasts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcasts:");
}

id objc_msgSend_setPodcastsDomainVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPodcastsDomainVersion:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPredictionMode_forType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredictionMode:forType:");
}

id objc_msgSend_setPreferredAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredAction:");
}

id objc_msgSend_setPreferredIntervals_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredIntervals:");
}

id objc_msgSend_setPreferredMaxLayoutWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredMaxLayoutWidth:");
}

id objc_msgSend_setPresentationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationType:");
}

id objc_msgSend_setPresentingButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingButton:");
}

id objc_msgSend_setPreservesSuperviewLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreservesSuperviewLayoutMargins:");
}

id objc_msgSend_setPreviousPlayingEpisodeUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousPlayingEpisodeUuid:");
}

id objc_msgSend_setPriceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriceType:");
}

id objc_msgSend_setPriceTypeChangedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriceTypeChangedDate:");
}

id objc_msgSend_setPrimaryButtonCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimaryButtonCallback:");
}

id objc_msgSend_setPrimitiveValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimitiveValue:forKey:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setProcessAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProcessAssertion:");
}

id objc_msgSend_setProcessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProcessor:");
}

id objc_msgSend_setProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProfile:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setProgressType_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgressType:animated:");
}

id objc_msgSend_setPromptTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPromptTitle:");
}

id objc_msgSend_setPropertiesToFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPropertiesToFetch:");
}

id objc_msgSend_setPropertiesToUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPropertiesToUpdate:");
}

id objc_msgSend_setPropertyKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPropertyKeys:");
}

id objc_msgSend_setProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProvider:");
}

id objc_msgSend_setPubDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPubDate:");
}

id objc_msgSend_setQuery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQuery:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setQueryObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryObserver:");
}

id objc_msgSend_setQueuePriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueuePriority:");
}

id objc_msgSend_setQueueWithPlaybackRequestIdentifier_mrCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueueWithPlaybackRequestIdentifier:mrCompletion:");
}

id objc_msgSend_setQueueWithPlaybackRequestIdentifier_startPlayback_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_mrCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueueWithPlaybackRequestIdentifier:startPlayback:assetInfo:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:mrCompletion:");
}

id objc_msgSend_setQueuedInvocations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueuedInvocations:");
}

id objc_msgSend_setRadioGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRadioGroup:");
}

id objc_msgSend_setReachable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReachable:");
}

id objc_msgSend_setRecorded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecorded:");
}

id objc_msgSend_setRecordedPlayEventsForCurrentItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordedPlayEventsForCurrentItem:");
}

id objc_msgSend_setRefreshControl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRefreshControl:");
}

id objc_msgSend_setRefreshing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRefreshing:");
}

id objc_msgSend_setRelatedUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelatedUniqueIdentifier:");
}

id objc_msgSend_setRelationshipKeyPathsForPrefetching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelationshipKeyPathsForPrefetching:");
}

id objc_msgSend_setReleaseDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReleaseDate:");
}

id objc_msgSend_setRelevantShortcuts_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelevantShortcuts:completionHandler:");
}

id objc_msgSend_setRemotePlaybackQueue_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemotePlaybackQueue:completion:");
}

id objc_msgSend_setRemovePlayedDownloadsSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemovePlayedDownloadsSetting:");
}

id objc_msgSend_setRemovePlayedDownloadsSetting_forPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemovePlayedDownloadsSetting:forPodcastUuid:");
}

id objc_msgSend_setReportMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReportMetrics:");
}

id objc_msgSend_setReportedItemVersionForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReportedItemVersionForIdentifier:");
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequest:");
}

id objc_msgSend_setRequestParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestParams:");
}

id objc_msgSend_setResettingToInitialState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResettingToInitialState:");
}

id objc_msgSend_setResolvingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResolvingError:");
}

id objc_msgSend_setResponseDomainVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponseDomainVersion:");
}

id objc_msgSend_setRestorationCompletions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRestorationCompletions:");
}

id objc_msgSend_setRestorationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRestorationIdentifier:");
}

id objc_msgSend_setRestorationQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRestorationQueue:");
}

id objc_msgSend_setResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResult:");
}

id objc_msgSend_setResultType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResultType:");
}

id objc_msgSend_setResyncWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResyncWhenDone:");
}

id objc_msgSend_setReturnKeyType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnKeyType:");
}

id objc_msgSend_setReturnsDistinctResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnsDistinctResults:");
}

id objc_msgSend_setReturnsObjectsAsFaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnsObjectsAsFaults:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRoute:");
}

id objc_msgSend_setRowHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRowHeight:");
}

id objc_msgSend_setRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRunning:");
}

id objc_msgSend_setSaveDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSaveDelegate:");
}

id objc_msgSend_setSaved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSaved:");
}

id objc_msgSend_setSavedEpisodesCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSavedEpisodesCount:");
}

id objc_msgSend_setSavedUnplayedEpisodesCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSavedUnplayedEpisodesCount:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setScrollsToTop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollsToTop:");
}

id objc_msgSend_setSeasonNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeasonNumber:");
}

id objc_msgSend_setSectionInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSectionInset:");
}

id objc_msgSend_setSectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSectionType:");
}

id objc_msgSend_setSecureDownloadRenewalManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecureDownloadRenewalManager:");
}

id objc_msgSend_setSecureKeyLoader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecureKeyLoader:");
}

id objc_msgSend_setSelectedBackgroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedBackgroundView:");
}

id objc_msgSend_setSelectedUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedUuid:");
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionStyle:");
}

id objc_msgSend_setSelectionTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionTintColor:");
}

id objc_msgSend_setSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelector:");
}

id objc_msgSend_setSentNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSentNotification:");
}

id objc_msgSend_setSeparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparator:");
}

id objc_msgSend_setSeparatorInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorInset:");
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorStyle:");
}

id objc_msgSend_setSerialQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSerialQueue:");
}

id objc_msgSend_setSerpentIdMigrationComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSerpentIdMigrationComplete:");
}

id objc_msgSend_setServerRevisionNewerThanClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerRevisionNewerThanClient:");
}

id objc_msgSend_setSessionCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionCompletionHandler:");
}

id objc_msgSend_setSessionDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionDelegate:");
}

id objc_msgSend_setSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionIdentifier:");
}

id objc_msgSend_setSessionTaskStateReloaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionTaskStateReloaded:");
}

id objc_msgSend_setSettingsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSettingsController:");
}

id objc_msgSend_setSettingsHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSettingsHandler:");
}

id objc_msgSend_setShadowColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowColor:");
}

id objc_msgSend_setShadowImage_forToolbarPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowImage:forToolbarPosition:");
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOffset:");
}

id objc_msgSend_setShadowOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOpacity:");
}

id objc_msgSend_setShadowRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowRadius:");
}

id objc_msgSend_setShared_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShared:");
}

id objc_msgSend_setSharingStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharingStyle:");
}

id objc_msgSend_setShiftedIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShiftedIndexPath:");
}

id objc_msgSend_setShortTitles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortTitles:");
}

id objc_msgSend_setShortcutItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortcutItems:");
}

id objc_msgSend_setShouldAuthenticate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldAuthenticate:");
}

id objc_msgSend_setShouldFindSomethingToPlay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldFindSomethingToPlay:");
}

id objc_msgSend_setShouldIgnoreDNU_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldIgnoreDNU:");
}

id objc_msgSend_setShouldShowNowPlaying_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldShowNowPlaying:");
}

id objc_msgSend_setShouldSuppressUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSuppressUserInfo:");
}

id objc_msgSend_setShowListShowsAllShows_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowListShowsAllShows:");
}

id objc_msgSend_setShowPlacardForRemovePlayedEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowPlacardForRemovePlayedEpisodes:");
}

id objc_msgSend_setShowPlacardForSavedEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowPlacardForSavedEpisodes:");
}

id objc_msgSend_setShowPlayedEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowPlayedEpisodes:");
}

id objc_msgSend_setShowSettingsGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowSettingsGroup:");
}

id objc_msgSend_setShowSpecificUpsellCopy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowSpecificUpsellCopy:");
}

id objc_msgSend_setShowTypeInFeed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowTypeInFeed:");
}

id objc_msgSend_setShowTypeRadioGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowTypeRadioGroup:");
}

id objc_msgSend_setShowTypeSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowTypeSetting:");
}

id objc_msgSend_setShowsArtwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsArtwork:");
}

id objc_msgSend_setShowsDescriptionButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsDescriptionButton:");
}

id objc_msgSend_setShowsExplicitIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsExplicitIcon:");
}

id objc_msgSend_setShowsFooterTextView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsFooterTextView:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setShowsMoreButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsMoreButton:");
}

id objc_msgSend_setShowsSeparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsSeparator:");
}

id objc_msgSend_setShowsSeperator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsSeperator:");
}

id objc_msgSend_setShowsTouchWhenHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsTouchWhenHighlighted:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setSideView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSideView:");
}

id objc_msgSend_setSinceDomainVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSinceDomainVersion:");
}

id objc_msgSend_setSingleGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSingleGroup:");
}

id objc_msgSend_setSiriAnalyticsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSiriAnalyticsController:");
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSize:");
}

id objc_msgSend_setSortAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortAscending:");
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortDescriptors:");
}

id objc_msgSend_setSortOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortOrder:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSource:");
}

id objc_msgSend_setSourceRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceRect:");
}

id objc_msgSend_setSourceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceView:");
}

id objc_msgSend_setSpecialization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecialization:");
}

id objc_msgSend_setSpinner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpinner:");
}

id objc_msgSend_setStartDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartDelay:");
}

id objc_msgSend_setStartPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartPlayback:");
}

id objc_msgSend_setStartedEpisodeUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartedEpisodeUuids:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStationIntents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStationIntents:");
}

id objc_msgSend_setStopReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStopReason:");
}

id objc_msgSend_setStorageProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStorageProvider:");
}

id objc_msgSend_setStoreBothFreeAndPaidUrlsPreviousBootup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreBothFreeAndPaidUrlsPreviousBootup");
}

id objc_msgSend_setStoreCleanURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreCleanURL:");
}

id objc_msgSend_setStoreCollectionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreCollectionId:");
}

id objc_msgSend_setStoreFrontIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreFrontIdentifier:");
}

id objc_msgSend_setStoreIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreIdentifier:");
}

id objc_msgSend_setStorePodcastDownloader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStorePodcastDownloader:");
}

id objc_msgSend_setStoreReportingParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreReportingParams:");
}

id objc_msgSend_setStoreResponseDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreResponseDelegate:");
}

id objc_msgSend_setStoreShortURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreShortURL:");
}

id objc_msgSend_setStoreTrackId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreTrackId:");
}

id objc_msgSend_setStreamCacheObserverToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStreamCacheObserverToken:");
}

id objc_msgSend_setStreamUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStreamUrl:");
}

id objc_msgSend_setStreamable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStreamable:");
}

id objc_msgSend_setStrongDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStrongDelegate:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSubscribedSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubscribedSetting:");
}

id objc_msgSend_setSubscriptionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubscriptionState:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitle:");
}

id objc_msgSend_setSuccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuccess:");
}

id objc_msgSend_setSuggestedEpisodeUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestedEpisodeUuids:");
}

id objc_msgSend_setSuggestedMediaIntents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestedMediaIntents:");
}

id objc_msgSend_setSuggestedStationUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestedStationUuids:");
}

id objc_msgSend_setSummaryArgument_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSummaryArgument:");
}

id objc_msgSend_setSummaryArgumentCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSummaryArgumentCount:");
}

id objc_msgSend_setSupportedPlaybackRates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportedPlaybackRates:");
}

id objc_msgSend_setSupportedSessionTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportedSessionTypes:");
}

id objc_msgSend_setSupportsContinuationStreams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsContinuationStreams:");
}

id objc_msgSend_setSupportsLocalMedia_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsLocalMedia:");
}

id objc_msgSend_setSupportsMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsMetrics:");
}

id objc_msgSend_setSupportsPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsPlayback:");
}

id objc_msgSend_setSuppressAutoDownload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuppressAutoDownload:");
}

id objc_msgSend_setSuppressMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuppressMetrics:");
}

id objc_msgSend_setSwipeEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwipeEnabled:");
}

id objc_msgSend_setSwipeGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwipeGesture:");
}

id objc_msgSend_setSwipeState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwipeState:");
}

id objc_msgSend_setSwipeToDeleteButtonColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwipeToDeleteButtonColor:");
}

id objc_msgSend_setSwipedCellIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwipedCellIndexPath:");
}

id objc_msgSend_setSyncDirtyFlag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncDirtyFlag:");
}

id objc_msgSend_setSyncHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncHandler:");
}

id objc_msgSend_setSyncStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncStartTime:");
}

id objc_msgSend_setSyncTaskEndTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncTaskEndTime:");
}

id objc_msgSend_setSyncTaskStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncTaskStartTime:");
}

id objc_msgSend_setSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncType:");
}

id objc_msgSend_setSyncVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncVersion:");
}

id objc_msgSend_setSyncVersionFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncVersionFlags:");
}

id objc_msgSend_setSynchronizeTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSynchronizeTask:");
}

id objc_msgSend_setTabBarHidden_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTabBarHidden:animated:");
}

id objc_msgSend_setTableFooterView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableFooterView:");
}

id objc_msgSend_setTableHeaderView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableHeaderView:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setTapGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTapGesture:");
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTask:");
}

id objc_msgSend_setTaskAssertion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskAssertion:");
}

id objc_msgSend_setTaskCompletedWithSuccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskCompletedWithSuccess:");
}

id objc_msgSend_setTaskDebugDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskDebugDescription:");
}

id objc_msgSend_setTaskInvalidationDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskInvalidationDisabled:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAttributes:");
}

id objc_msgSend_setTextChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextChanged:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTextContainerInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextContainerInset:");
}

id objc_msgSend_setTextView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextView:");
}

id objc_msgSend_setThreadIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThreadIdentifier:");
}

id objc_msgSend_setThumbnailURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThumbnailURL:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTimeoutIntervalForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForRequest:");
}

id objc_msgSend_setTimeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForResource:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimestamp:");
}

id objc_msgSend_setTimestampForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimestampForTransaction:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTitleBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleBlock:");
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleColor:forState:");
}

id objc_msgSend_setTitleHyphenationFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleHyphenationFactor:");
}

id objc_msgSend_setToggle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToggle:");
}

id objc_msgSend_setToggleChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToggleChanged:");
}

id objc_msgSend_setTouchInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouchInsets:");
}

id objc_msgSend_setTrackNum_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrackNum:");
}

id objc_msgSend_setTracksDefault_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTracksDefault:");
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransaction:");
}

id objc_msgSend_setTransactionAuthor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionAuthor:");
}

id objc_msgSend_setTransactionClamps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionClamps:");
}

id objc_msgSend_setTransactionDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionDescription:");
}

id objc_msgSend_setTransactionProcessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionProcessor:");
}

id objc_msgSend_setTranscriptIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranscriptIdentifier:");
}

id objc_msgSend_setTransitioningDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitioningDelegate:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUIApplicationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUIApplicationState:");
}

id objc_msgSend_setUPPDomainVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUPPDomainVersion:");
}

id objc_msgSend_setUPPStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUPPStore:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setUberArtworkTextPrimaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUberArtworkTextPrimaryColor:");
}

id objc_msgSend_setUberArtworkTextQuaternaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUberArtworkTextQuaternaryColor:");
}

id objc_msgSend_setUberArtworkTextSecondaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUberArtworkTextSecondaryColor:");
}

id objc_msgSend_setUberArtworkTextTertiaryColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUberArtworkTextTertiaryColor:");
}

id objc_msgSend_setUberBackgroundImageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUberBackgroundImageURL:");
}

id objc_msgSend_setUberBackgroundJoeColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUberBackgroundJoeColor:");
}

id objc_msgSend_setUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUniqueIdentifier:");
}

id objc_msgSend_setUnplayedCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnplayedCount:");
}

id objc_msgSend_setUnplayedTab_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnplayedTab:");
}

id objc_msgSend_setUpNextController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpNextController:");
}

id objc_msgSend_setUpNextManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpNextManifest:");
}

id objc_msgSend_setUpNextQueueIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpNextQueueIntent:");
}

id objc_msgSend_setUpNextResultsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpNextResultsController:");
}

id objc_msgSend_setUpNotificationStatusIsAuthorizedUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpNotificationStatusIsAuthorizedUpdates");
}

id objc_msgSend_setUpdateAvg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateAvg:");
}

id objc_msgSend_setUpdateCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateCount:");
}

id objc_msgSend_setUpdateInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateInterval:");
}

id objc_msgSend_setUpdateOperationQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateOperationQueue:");
}

id objc_msgSend_setUpdatePodcastSizeEstimationWorkController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdatePodcastSizeEstimationWorkController:");
}

id objc_msgSend_setUpdateStdDev_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateStdDev:");
}

id objc_msgSend_setUpdatedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdatedDate:");
}

id objc_msgSend_setUpdatedFeedURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdatedFeedURL:");
}

id objc_msgSend_setUppDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUppDataSource:");
}

id objc_msgSend_setUppLastSyncTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUppLastSyncTime:");
}

id objc_msgSend_setUppSyncDirtyFlag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUppSyncDirtyFlag:");
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrl:");
}

id objc_msgSend_setUrlSessionDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrlSessionDelegate:");
}

id objc_msgSend_setUserAcceptedSyncTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserAcceptedSyncTimestamp");
}

id objc_msgSend_setUserAcceptedSyncTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserAcceptedSyncTimestamp:");
}

id objc_msgSend_setUserCancelledSignIn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserCancelledSignIn");
}

id objc_msgSend_setUserCancelledSignInBackOffUntil_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserCancelledSignInBackOffUntil:");
}

id objc_msgSend_setUserDriven_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserDriven:");
}

id objc_msgSend_setUserEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserEpisode:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserInfoValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfoValue:forKey:");
}

id objc_msgSend_setUserInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInitiated:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setUserManifest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserManifest:");
}

id objc_msgSend_setUserNotificationExtensionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserNotificationExtensionId:");
}

id objc_msgSend_setUti_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUti:");
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUuid:");
}

id objc_msgSend_setUuidOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUuidOrder:");
}

id objc_msgSend_setUuidSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUuidSet:");
}

id objc_msgSend_setUuidToManagedObjectIDMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUuidToManagedObjectIDMap:");
}

id objc_msgSend_setUuidToPlayerItemMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUuidToPlayerItemMap:");
}

id objc_msgSend_setValidationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValidationManager:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_forKey_shareModes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:shareModes:");
}

id objc_msgSend_setValue_forProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forProperty:");
}

id objc_msgSend_setValue_forSettingWithIdentifier_inGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forSettingWithIdentifier:inGroup:");
}

id objc_msgSend_setValueSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValueSet:");
}

id objc_msgSend_setValuesForKeysWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValuesForKeysWithDictionary:");
}

id objc_msgSend_setVc_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVc:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setVersion_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVersion:forKey:");
}

id objc_msgSend_setVerticalLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerticalLayout:");
}

id objc_msgSend_setVideo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideo:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setViewControllers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewControllers:");
}

id objc_msgSend_setVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisible:");
}

id objc_msgSend_setVolumeController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVolumeController:");
}

id objc_msgSend_setWatchTemplate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWatchTemplate:");
}

id objc_msgSend_setWebpageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWebpageURL:");
}

id objc_msgSend_setWidthTracksTextView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidthTracksTextView:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_setWorkQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWorkQueue:");
}

id objc_msgSend_setZIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZIndex:");
}

id objc_msgSend_set_layoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_layoutMargins:");
}

id objc_msgSend_settingAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingAtIndexPath:");
}

id objc_msgSend_settingFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingFont");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settings");
}

id objc_msgSend_settingsController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsController");
}

id objc_msgSend_settingsController_addedGroup_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsController:addedGroup:atIndex:");
}

id objc_msgSend_settingsController_didChangeHeaderAction_inGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsController:didChangeHeaderAction:inGroupWithIdentifier:");
}

id objc_msgSend_settingsController_didChangeSettingValueAtIndex_inGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsController:didChangeSettingValueAtIndex:inGroupWithIdentifier:");
}

id objc_msgSend_settingsController_reloadedGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsController:reloadedGroupWithIdentifier:");
}

id objc_msgSend_settingsController_removedGroupAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsController:removedGroupAtIndex:");
}

id objc_msgSend_settingsController_removedSettingAtIndex_inGroupWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsController:removedSettingAtIndex:inGroupWithIdentifier:");
}

id objc_msgSend_settingsForDownloadsGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsForDownloadsGroup");
}

id objc_msgSend_settingsForPrivateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsForPrivateStyle:");
}

id objc_msgSend_settingsForShowGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsForShowGroup");
}

id objc_msgSend_settingsHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settingsHandler");
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setup");
}

id objc_msgSend_setupActions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupActions");
}

id objc_msgSend_setupAfterBecomingActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupAfterBecomingActive");
}

id objc_msgSend_setupCell(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupCell");
}

id objc_msgSend_setupPlayerNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPlayerNotifications");
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupView");
}

id objc_msgSend_shareAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareAction");
}

id objc_msgSend_shareActivityItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareActivityItems:");
}

id objc_msgSend_shareData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareData");
}

id objc_msgSend_shareDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareDescription");
}

id objc_msgSend_shareEpisodeTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareEpisodeTitle");
}

id objc_msgSend_shareFromModeForShareMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareFromModeForShareMode:");
}

id objc_msgSend_shareImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareImage");
}

id objc_msgSend_shareImageProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareImageProvider");
}

id objc_msgSend_shareModeForShareFromMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareModeForShareFromMode:");
}

id objc_msgSend_sharePodcastTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharePodcastTitle");
}

id objc_msgSend_shareProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareProvider");
}

id objc_msgSend_shareSupported(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareSupported");
}

id objc_msgSend_shareURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareURL");
}

id objc_msgSend_shareViewControllerWithDataSource_applicationActivities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareViewControllerWithDataSource:applicationActivities:");
}

id objc_msgSend_shareViewControllerWithEpisode_applicationActivities_selectedReferenceTime_selectedPlayerTime_currentPlayerTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareViewControllerWithEpisode:applicationActivities:selectedReferenceTime:selectedPlayerTime:currentPlayerTime:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedAnalytics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedAnalytics");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedDocumentsDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedDocumentsDirectory");
}

id objc_msgSend_sharedDownloaders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedDownloaders");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedLogger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedLogger");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedPlaybackController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedPlaybackController");
}

id objc_msgSend_sharedPlayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedPlayer");
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedScheduler");
}

id objc_msgSend_shiftedIndexPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shiftedIndexPath");
}

id objc_msgSend_shortTitles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortTitles");
}

id objc_msgSend_shortcutsKind(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortcutsKind");
}

id objc_msgSend_shouldAuthenticate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAuthenticate");
}

id objc_msgSend_shouldContinue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldContinue");
}

id objc_msgSend_shouldDisplayExplicitRestrictionAlert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldDisplayExplicitRestrictionAlert");
}

id objc_msgSend_shouldFindSomethingToPlay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldFindSomethingToPlay");
}

id objc_msgSend_shouldForceAuthenticationForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldForceAuthenticationForTransaction:");
}

id objc_msgSend_shouldHandleNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldHandleNotification:");
}

id objc_msgSend_shouldHandleNotificationResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldHandleNotificationResponse:");
}

id objc_msgSend_shouldNotContinueResult(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldNotContinueResult");
}

id objc_msgSend_shouldPresentNowPlayingForItem_presentationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldPresentNowPlayingForItem:presentationType:");
}

id objc_msgSend_shouldProcessNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldProcessNotification:");
}

id objc_msgSend_shouldShowAnnouncementNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowAnnouncementNotification:");
}

id objc_msgSend_shouldShowNowPlaying(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowNowPlaying");
}

id objc_msgSend_shouldShowPodcastsTermsScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowPodcastsTermsScreen");
}

id objc_msgSend_shouldShowWelcome(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowWelcome");
}

id objc_msgSend_shouldSuppressTranscriptsWhatsNewSheet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSuppressTranscriptsWhatsNewSheet");
}

id objc_msgSend_shouldSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSync:");
}

id objc_msgSend_shouldSyncFeedUpdateForNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSyncFeedUpdateForNotification:");
}

id objc_msgSend_shouldSyncInReadOnlyMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSyncInReadOnlyMode");
}

id objc_msgSend_shouldSyncSubscriptionsForNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSyncSubscriptionsForNotification:");
}

id objc_msgSend_shouldSyncUppForNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSyncUppForNotification:");
}

id objc_msgSend_showActionSheetWithActions_fromButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showActionSheetWithActions:fromButton:");
}

id objc_msgSend_showAddPodcastsSheet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showAddPodcastsSheet");
}

id objc_msgSend_showCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showCount");
}

id objc_msgSend_showDebugUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showDebugUI");
}

id objc_msgSend_showDialogForReason_podcastTitle_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showDialogForReason:podcastTitle:completion:");
}

id objc_msgSend_showInternetUnreachableDialog(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showInternetUnreachableDialog");
}

id objc_msgSend_showInternetUnreachableDialogWithAcknowledmentBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showInternetUnreachableDialogWithAcknowledmentBlock:");
}

id objc_msgSend_showListShowsAllShowsKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showListShowsAllShowsKey");
}

id objc_msgSend_showPlayedEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showPlayedEpisodes");
}

id objc_msgSend_showPodcastDetailForOneShowWithMultipleNotificationEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showPodcastDetailForOneShowWithMultipleNotificationEpisodes:");
}

id objc_msgSend_showPodcastDetailForOneShowWithOneNotificationEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showPodcastDetailForOneShowWithOneNotificationEpisode:");
}

id objc_msgSend_showSearchControllerWithSearchText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSearchControllerWithSearchText:");
}

id objc_msgSend_showSettings_changedEpisodeLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSettings:changedEpisodeLimit:");
}

id objc_msgSend_showSettings_changedNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSettings:changedNotifications:");
}

id objc_msgSend_showSettings_changedRemovePlayedDownloads_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSettings:changedRemovePlayedDownloads:");
}

id objc_msgSend_showSettings_changedShowType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSettings:changedShowType:");
}

id objc_msgSend_showSettings_changedSubscribed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSettings:changedSubscribed:");
}

id objc_msgSend_showSettingsGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSettingsGroup");
}

id objc_msgSend_showSpecificUpsellCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSpecificUpsellCopy");
}

id objc_msgSend_showSubscriptionFailureDialog_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSubscriptionFailureDialog:error:");
}

id objc_msgSend_showType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showType");
}

id objc_msgSend_showTypeFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showTypeFromString:");
}

id objc_msgSend_showTypeInFeed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showTypeInFeed");
}

id objc_msgSend_showTypeInFeedResolvedValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showTypeInFeedResolvedValue");
}

id objc_msgSend_showTypeRadioGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showTypeRadioGroup");
}

id objc_msgSend_showTypeSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showTypeSetting");
}

id objc_msgSend_showTypeUserSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showTypeUserSetting");
}

id objc_msgSend_showViewController_inPopoverFromButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showViewController:inPopoverFromButton:");
}

id objc_msgSend_showWithPresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showWithPresentingViewController:");
}

id objc_msgSend_showsArtwork(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsArtwork");
}

id objc_msgSend_showsArtworkForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsArtworkForStyle:");
}

id objc_msgSend_showsDescriptionButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsDescriptionButton");
}

id objc_msgSend_showsFooterTextView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsFooterTextView");
}

id objc_msgSend_showsMoreButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsMoreButton");
}

id objc_msgSend_showsPlayState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsPlayState");
}

id objc_msgSend_showsPubDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsPubDate");
}

id objc_msgSend_showsSeperator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsSeperator");
}

id objc_msgSend_sideView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sideView");
}

id objc_msgSend_sideViewFrameForContentViewSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sideViewFrameForContentViewSize:");
}

id objc_msgSend_simulateAnyTestNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simulateAnyTestNotification");
}

id objc_msgSend_simulateMemoryWarning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simulateMemoryWarning");
}

id objc_msgSend_sinceDomainVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinceDomainVersion");
}

id objc_msgSend_sinceDomainVersionForTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinceDomainVersionForTransaction:");
}

id objc_msgSend_siriAnalyticsController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriAnalyticsController");
}

id objc_msgSend_siriAssetInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriAssetInfo");
}

id objc_msgSend_siriDonator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriDonator");
}

id objc_msgSend_siriDumper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriDumper");
}

id objc_msgSend_siriMultiUserConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriMultiUserConnection");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "size");
}

id objc_msgSend_sizeCacheKeyForLabel_width_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeCacheKeyForLabel:width:");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_sizeWithAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeWithAttributes:");
}

id objc_msgSend_skipBackwardCommand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "skipBackwardCommand");
}

id objc_msgSend_skipForwardCommand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "skipForwardCommand");
}

id objc_msgSend_sortAscending(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortAscending");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:selector:");
}

id objc_msgSend_sortDescriptors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptors");
}

id objc_msgSend_sortDescriptorsForAllPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForAllPodcasts");
}

id objc_msgSend_sortDescriptorsForDateAddedAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForDateAddedAscending:");
}

id objc_msgSend_sortDescriptorsForDownloadedDateAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForDownloadedDateAscending:");
}

id objc_msgSend_sortDescriptorsForFirstTimeAvailableAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForFirstTimeAvailableAscending:");
}

id objc_msgSend_sortDescriptorsForLastBookmarkedDateAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForLastBookmarkedDateAscending:");
}

id objc_msgSend_sortDescriptorsForListenNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForListenNow");
}

id objc_msgSend_sortDescriptorsForManualOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForManualOrder");
}

id objc_msgSend_sortDescriptorsForPlayOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForPlayOrder");
}

id objc_msgSend_sortDescriptorsForPlayOrderByEpisodeNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForPlayOrderByEpisodeNumber");
}

id objc_msgSend_sortDescriptorsForPlayOrderByPubDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForPlayOrderByPubDate");
}

id objc_msgSend_sortDescriptorsForPodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForPodcastUuid:");
}

id objc_msgSend_sortDescriptorsForPubDateAscending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForPubDateAscending:");
}

id objc_msgSend_sortDescriptorsForRecentlyPlayed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForRecentlyPlayed");
}

id objc_msgSend_sortDescriptorsForRecentlyUnfollowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForRecentlyUnfollowed");
}

id objc_msgSend_sortDescriptorsForSortOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForSortOrder");
}

id objc_msgSend_sortDescriptorsForTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForTitle");
}

id objc_msgSend_sortDescriptorsForTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorsForTitle:");
}

id objc_msgSend_sortOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortOrder");
}

id objc_msgSend_sortOrderAscForShowType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortOrderAscForShowType:");
}

id objc_msgSend_sortPropertyValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortPropertyValues");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_sortedArrayWithOptions_usingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayWithOptions:usingComparator:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "source");
}

id objc_msgSend_sourceList_didSelectItemUuid_atIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceList:didSelectItemUuid:atIndexPath:");
}

id objc_msgSend_sourceList_didUpdateSelectedItemUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceList:didUpdateSelectedItemUuid:");
}

id objc_msgSend_spinner(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spinner");
}

id objc_msgSend_splitViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "splitViewController");
}

id objc_msgSend_standardDeviationForEpisodes_standardDeviation_average_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardDeviationForEpisodes:standardDeviation:average:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start");
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAccessingSecurityScopedResource");
}

id objc_msgSend_startAllProcessors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAllProcessors");
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAnimating");
}

id objc_msgSend_startBackgroundTask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startBackgroundTask");
}

id objc_msgSend_startDelay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDelay");
}

id objc_msgSend_startDonation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDonation");
}

id objc_msgSend_startDownloadForPodcastStoreId_triggerBy_feedUrl_useBackgroundFetch_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDownloadForPodcastStoreId:triggerBy:feedUrl:useBackgroundFetch:source:");
}

id objc_msgSend_startDownloadTaskForFeedURL_userInitiated_useBackgroundFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDownloadTaskForFeedURL:userInitiated:useBackgroundFetch:");
}

id objc_msgSend_startIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startIfNeeded");
}

id objc_msgSend_startKeyLoadingProcessWithKeyIdentifier_contentAdamId_isRenewal_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startKeyLoadingProcessWithKeyIdentifier:contentAdamId:isRenewal:completion:");
}

id objc_msgSend_startKeyRequestWithSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startKeyRequestWithSession:completion:");
}

id objc_msgSend_startLibraryUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startLibraryUpdate");
}

id objc_msgSend_startNotifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startNotifier");
}

id objc_msgSend_startObserving(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startObserving");
}

id objc_msgSend_startObservingChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startObservingChanges");
}

id objc_msgSend_startObservingDownloadedPodcastsChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startObservingDownloadedPodcastsChanges");
}

id objc_msgSend_startObservingLibraryIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startObservingLibraryIfNeeded");
}

id objc_msgSend_startObservingMediaLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startObservingMediaLibrary");
}

id objc_msgSend_startObservingPlaybackState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startObservingPlaybackState");
}

id objc_msgSend_startPlayback(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startPlayback");
}

id objc_msgSend_startProcessors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startProcessors:");
}

id objc_msgSend_startProcessorsForFeedUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startProcessorsForFeedUpdates");
}

id objc_msgSend_startTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTimer:");
}

id objc_msgSend_startUPPSyncTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startUPPSyncTimer");
}

id objc_msgSend_startedEpisodeUuids(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startedEpisodeUuids");
}

id objc_msgSend_startingIndexForDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startingIndexForDisplay");
}

id objc_msgSend_startupTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startupTime");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_stationIntents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stationIntents");
}

id objc_msgSend_stationUuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stationUuid");
}

id objc_msgSend_statsDownloadIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statsDownloadIdentifier");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusCode");
}

id objc_msgSend_statusCodeForTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusCodeForTask:");
}

id objc_msgSend_statusManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusManager");
}

id objc_msgSend_statusWithCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusWithCode:");
}

id objc_msgSend_statusWithCode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusWithCode:error:");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stop");
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAccessingSecurityScopedResource");
}

id objc_msgSend_stopContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopContext");
}

id objc_msgSend_stopKeyRequestWithSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopKeyRequestWithSession:completion:");
}

id objc_msgSend_stopNotifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopNotifier");
}

id objc_msgSend_stopObservingApplicationState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopObservingApplicationState");
}

id objc_msgSend_stopObservingChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopObservingChanges");
}

id objc_msgSend_stopObservingDownloadedPodcastsChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopObservingDownloadedPodcastsChanges");
}

id objc_msgSend_stopObservingMediaLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopObservingMediaLibrary");
}

id objc_msgSend_stopObservingPlaybackState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopObservingPlaybackState");
}

id objc_msgSend_stopType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopType");
}

id objc_msgSend_stopWithReason_initiator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopWithReason:initiator:");
}

id objc_msgSend_storageProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storageProvider");
}

id objc_msgSend_storeAccountMismatchErrorWithPreviousStoreAccountText_currentStoreAccontText_transaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeAccountMismatchErrorWithPreviousStoreAccountText:currentStoreAccontText:transaction:underlyingError:");
}

id objc_msgSend_storeAccountSessionExpiredWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeAccountSessionExpiredWithTransaction:underlyingError:");
}

id objc_msgSend_storeBookkeeperPreferences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeBookkeeperPreferences");
}

id objc_msgSend_storeCleanURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeCleanURL");
}

id objc_msgSend_storeCleanURLForAdamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeCleanURLForAdamID:");
}

id objc_msgSend_storeCollectionId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeCollectionId");
}

id objc_msgSend_storeCollectionIdForRedirectURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeCollectionIdForRedirectURL:");
}

id objc_msgSend_storeGenericErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeGenericErrorWithTransaction:underlyingError:");
}

id objc_msgSend_storeId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeId");
}

id objc_msgSend_storeIdFromFeedUpdateNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeIdFromFeedUpdateNotification:");
}

id objc_msgSend_storeIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeIdentifier");
}

id objc_msgSend_storeLoggedOutErrorWithPreviousStoreAccountText_transaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeLoggedOutErrorWithPreviousStoreAccountText:transaction:underlyingError:");
}

id objc_msgSend_storeMediaDictionariesToPlayerItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeMediaDictionariesToPlayerItems:");
}

id objc_msgSend_storeMediaDictionariesToPlayerItems_initiatedByAnotherUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeMediaDictionariesToPlayerItems:initiatedByAnotherUser:");
}

id objc_msgSend_storeMediaDictionaryFromStorePlatformDictionary_artworkSize_restricted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeMediaDictionaryFromStorePlatformDictionary:artworkSize:restricted:");
}

id objc_msgSend_storeMediaDictionaryFromStorePlatformDictionary_artworkSize_restricted_isNotSubscribeable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeMediaDictionaryFromStorePlatformDictionary:artworkSize:restricted:isNotSubscribeable:");
}

id objc_msgSend_storePlatformDictionaryHasChildren_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storePlatformDictionaryHasChildren:");
}

id objc_msgSend_storePodcastDownloader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storePodcastDownloader");
}

id objc_msgSend_storeReportingParams(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeReportingParams");
}

id objc_msgSend_storeResponseDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeResponseDelegate");
}

id objc_msgSend_storeShortURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeShortURL");
}

id objc_msgSend_storeTrackId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeTrackId");
}

id objc_msgSend_storeValidationErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeValidationErrorWithTransaction:underlyingError:");
}

id objc_msgSend_storedUuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storedUuid");
}

id objc_msgSend_storefrontIdentifierFromCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storefrontIdentifierFromCountryCode:");
}

id objc_msgSend_streamCacheObserverToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streamCacheObserverToken");
}

id objc_msgSend_streamCacheURLAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streamCacheURLAndReturnError:");
}

id objc_msgSend_streamURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streamURL");
}

id objc_msgSend_streamUrl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streamUrl");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAddingPercentEscapesUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAddingPercentEscapesUsingEncoding:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByRemovingInsignificantPrefix(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByRemovingInsignificantPrefix");
}

id objc_msgSend_stringByRemovingNewlineCharacters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByRemovingNewlineCharacters");
}

id objc_msgSend_stringByRemovingPercentEscapes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByRemovingPercentEscapes");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_stringBySmartlyStrippingHTML(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringBySmartlyStrippingHTML");
}

id objc_msgSend_stringByStrippingHTML(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByStrippingHTML");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringForContainerOrder_short_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForContainerOrder:short:");
}

id objc_msgSend_stringForEpisodes_short_defaultValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForEpisodes:short:defaultValue:");
}

id objc_msgSend_stringForGlobalDefaultLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForGlobalDefaultLimit");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringForMedia_short_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForMedia:short:");
}

id objc_msgSend_stringForNewEpisodeCount_titleCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForNewEpisodeCount:titleCase:");
}

id objc_msgSend_stringForUnplayedEpisodeCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForUnplayedEpisodeCount:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromDictionary_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDictionary:forKey:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringFromSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromSeconds:");
}

id objc_msgSend_stringFromTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromTimeInterval:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithBytesize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithBytesize:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithDuration_unitsStyle_includeTimeRemainingPhrase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithDuration:unitsStyle:includeTimeRemainingPhrase:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithValidatedFormat:validFormatSpecifiers:error:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "style");
}

id objc_msgSend_styleForWidth_showsArtwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "styleForWidth:showsArtwork:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_subjectForShareEmailFromDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subjectForShareEmailFromDataSource:");
}

id objc_msgSend_subjectForShareGenericFromDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subjectForShareGenericFromDataSource:");
}

id objc_msgSend_submitTaskRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitTaskRequest:error:");
}

id objc_msgSend_subscribeCommandStatusForErrorCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeCommandStatusForErrorCode:");
}

id objc_msgSend_subscribeFooterText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeFooterText:");
}

id objc_msgSend_subscribeFromCloudToPodcasts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeFromCloudToPodcasts:");
}

id objc_msgSend_subscribeToLifecycleEventNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToLifecycleEventNotifications");
}

id objc_msgSend_subscribeToPodcastWithFeedUrl_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToPodcastWithFeedUrl:completion:");
}

id objc_msgSend_subscribeToPodcastWithParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToPodcastWithParams:");
}

id objc_msgSend_subscribeToPodcastWithStorePlatformDictionary_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToPodcastWithStorePlatformDictionary:completion:");
}

id objc_msgSend_subscribeToShowWithPodcastStoreId_account_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToShowWithPodcastStoreId:account:completion:");
}

id objc_msgSend_subscribeWithCommandURL_siriAssetInfo_requester_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeWithCommandURL:siriAssetInfo:requester:completion:");
}

id objc_msgSend_subscribed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribed");
}

id objc_msgSend_subscribedSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribedSetting");
}

id objc_msgSend_subscriptionActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionActive");
}

id objc_msgSend_subscriptionControllerErrorDomain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionControllerErrorDomain");
}

id objc_msgSend_subscriptionKeyForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionKeyForSyncType:");
}

id objc_msgSend_subscriptionState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionState");
}

id objc_msgSend_subscriptionSyncProcessorSyncKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionSyncProcessorSyncKeys");
}

id objc_msgSend_subscriptionsLastSyncTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionsLastSyncTimestamp");
}

id objc_msgSend_subscriptionsLastSyncTimestampFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionsLastSyncTimestampFor:");
}

id objc_msgSend_subscriptionsSyncVersionFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionsSyncVersionFor:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitle");
}

id objc_msgSend_subtitleHeightForWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleHeightForWidth:");
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleLabel");
}

id objc_msgSend_subtitleMaxWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleMaxWidth");
}

id objc_msgSend_subtitleNumberOfLines(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleNumberOfLines");
}

id objc_msgSend_subtitleStringForArtist_album_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleStringForArtist:album:");
}

id objc_msgSend_subtitleTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleTextColor");
}

id objc_msgSend_subtitleTextStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subtitleTextStyle");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subviews");
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "success");
}

id objc_msgSend_successfulGetTransaction_withData_forKey_version_finishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "successfulGetTransaction:withData:forKey:version:finishedBlock:");
}

id objc_msgSend_successfulSetTransaction_withData_forKey_version_finishedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "successfulSetTransaction:withData:forKey:version:finishedBlock:");
}

id objc_msgSend_superLayoutAttributesForSupplementaryViewOfKind_atIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "superLayoutAttributesForSupplementaryViewOfKind:atIndexPath:");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "superview");
}

id objc_msgSend_supplementaryViewForElementKind_atIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supplementaryViewForElementKind:atIndexPath:");
}

id objc_msgSend_supportedActivityTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedActivityTypes");
}

id objc_msgSend_supportedInterfaceOrientationsForWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedInterfaceOrientationsForWindow:");
}

id objc_msgSend_supportedShareModes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedShareModes");
}

id objc_msgSend_supportsBatchInsertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsBatchInsertion");
}

id objc_msgSend_supportsChapterArtwork(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsChapterArtwork");
}

id objc_msgSend_supportsEpisodeArtwork(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsEpisodeArtwork");
}

id objc_msgSend_supportsImageStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsImageStore");
}

id objc_msgSend_supportsLocalMedia(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsLocalMedia");
}

id objc_msgSend_supportsMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsMetrics");
}

id objc_msgSend_supportsPlayback(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsPlayback");
}

id objc_msgSend_suppressAutomaticDownloadsIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suppressAutomaticDownloadsIfNeeded");
}

id objc_msgSend_suppressEpisodesWithBasisDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suppressEpisodesWithBasisDate:");
}

id objc_msgSend_suppressMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suppressMetrics");
}

id objc_msgSend_swipeBegan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "swipeBegan:");
}

id objc_msgSend_swipeEnded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "swipeEnded:");
}

id objc_msgSend_swipeState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "swipeState");
}

id objc_msgSend_swipedCellIndexPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "swipedCellIndexPath");
}

id objc_msgSend_switchBitrate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "switchBitrate");
}

id objc_msgSend_switchSettingChanged_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "switchSettingChanged:value:");
}

id objc_msgSend_switchSettingWithTitle_initialValue_identifier_changeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "switchSettingWithTitle:initialValue:identifier:changeHandler:");
}

id objc_msgSend_switchToLibraryIfNowHasContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "switchToLibraryIfNowHasContent");
}

id objc_msgSend_swizzleMethodsForMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "swizzleMethodsForMetrics");
}

id objc_msgSend_sync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sync");
}

id objc_msgSend_syncAllBookkeeperKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncAllBookkeeperKeys");
}

id objc_msgSend_syncCriticalBookkeeperKeysShouldSyncCleanKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncCriticalBookkeeperKeysShouldSyncCleanKeys:");
}

id objc_msgSend_syncDictionaryToMetricsDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncDictionaryToMetricsDictionary:");
}

id objc_msgSend_syncDirtyFlag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncDirtyFlag");
}

id objc_msgSend_syncEverything(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncEverything");
}

id objc_msgSend_syncEverythingIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncEverythingIfNeeded");
}

id objc_msgSend_syncFlagsForSyncType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncFlagsForSyncType:");
}

id objc_msgSend_syncInProgress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncInProgress");
}

id objc_msgSend_syncMergeIsFromCloud(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncMergeIsFromCloud");
}

id objc_msgSend_syncMultipleKeysAndProcessors_shouldSyncCleanKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncMultipleKeysAndProcessors:shouldSyncCleanKeys:");
}

id objc_msgSend_syncMusicSubscriptionInformation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncMusicSubscriptionInformation");
}

id objc_msgSend_syncNonFollowedShows(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncNonFollowedShows");
}

id objc_msgSend_syncNonFollowedShowsIfSyncDirty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncNonFollowedShowsIfSyncDirty");
}

id objc_msgSend_syncStartTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncStartTime");
}

id objc_msgSend_syncStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncStringForKey:");
}

id objc_msgSend_syncSubscriptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncSubscriptions");
}

id objc_msgSend_syncTaskEndTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncTaskEndTime");
}

id objc_msgSend_syncTaskStartTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncTaskStartTime");
}

id objc_msgSend_syncTermsVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncTermsVersion");
}

id objc_msgSend_syncType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncType");
}

id objc_msgSend_syncValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncValueForKey:");
}

id objc_msgSend_syncVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncVersion");
}

id objc_msgSend_syncVersionFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncVersionFlags");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronize");
}

id objc_msgSend_synchronizeImmediatelyWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeImmediatelyWithCompletionBlock:");
}

id objc_msgSend_synchronizeTask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeTask");
}

id objc_msgSend_synchronizeWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeWithCompletionHandler:");
}

id objc_msgSend_synchronouslyMarkAsHiddenAllPodcastsWithoutResettingSyncVersions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronouslyMarkAsHiddenAllPodcastsWithoutResettingSyncVersions");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemGrayColor");
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemRedColor");
}

id objc_msgSend_systemRoute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemRoute");
}

id objc_msgSend_tabBarItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarItem");
}

id objc_msgSend_tableFooterView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableFooterView");
}

id objc_msgSend_tableHeaderView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableHeaderView");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView");
}

id objc_msgSend_tableView_canFocusRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:canFocusRowAtIndexPath:");
}

id objc_msgSend_tableView_didSelectRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:didSelectRowAtIndexPath:");
}

id objc_msgSend_tableView_numberOfRowsInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:numberOfRowsInSection:");
}

id objc_msgSend_takeValuesFromDefaultSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "takeValuesFromDefaultSettings:");
}

id objc_msgSend_tapGesture(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tapGesture");
}

id objc_msgSend_targetForRefreshControl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetForRefreshControl");
}

id objc_msgSend_targetXOffsetForExposedActions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetXOffsetForExposedActions");
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "task");
}

id objc_msgSend_task_didFailWithError_orStatusCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "task:didFailWithError:orStatusCode:");
}

id objc_msgSend_taskAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskAssertion");
}

id objc_msgSend_taskDebugDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskDebugDescription");
}

id objc_msgSend_taskInvalidationDisabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskInvalidationDisabled");
}

id objc_msgSend_taskTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskTimeout");
}

id objc_msgSend_taskTimeoutTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskTimeoutTimer");
}

id objc_msgSend_tearDownPlayerNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tearDownPlayerNotifications");
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "temporaryDirectory");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "text");
}

id objc_msgSend_textAttributes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textAttributes");
}

id objc_msgSend_textChanged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textChanged");
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textColor");
}

id objc_msgSend_textContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textContainer");
}

id objc_msgSend_textContainerChangedGeometry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textContainerChangedGeometry:");
}

id objc_msgSend_textField(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textField");
}

id objc_msgSend_textField_shouldChangeCharactersInRange_replacementString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textField:shouldChangeCharactersInRange:replacementString:");
}

id objc_msgSend_textFieldDidBeginEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFieldDidBeginEditing:");
}

id objc_msgSend_textFieldDidEndEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFieldDidEndEditing:");
}

id objc_msgSend_textFieldShouldBeginEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFieldShouldBeginEditing:");
}

id objc_msgSend_textFieldShouldClear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFieldShouldClear:");
}

id objc_msgSend_textFieldShouldEndEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFieldShouldEndEditing:");
}

id objc_msgSend_textFieldShouldReturn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFieldShouldReturn:");
}

id objc_msgSend_textFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFont");
}

id objc_msgSend_textForShareToNotesFromDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textForShareToNotesFromDataSource:");
}

id objc_msgSend_textForUnplayedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textForUnplayedShort:");
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textLabel");
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textProperties");
}

id objc_msgSend_textRectForBounds_limitedToNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textRectForBounds:limitedToNumberOfLines:");
}

id objc_msgSend_textSettingChanged_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textSettingChanged:value:");
}

id objc_msgSend_textSettingWithInitialValue_placeholder_identifier_changeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textSettingWithInitialValue:placeholder:identifier:changeHandler:");
}

id objc_msgSend_textStackFrameForContentViewSize_artworkFrame_sideViewFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textStackFrameForContentViewSize:artworkFrame:sideViewFrame:");
}

id objc_msgSend_textStackView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textStackView");
}

id objc_msgSend_textStackViewClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textStackViewClass");
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textView");
}

id objc_msgSend_textViewMaxXForArtworkFrame_sideViewFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textViewMaxXForArtworkFrame:sideViewFrame:");
}

id objc_msgSend_textViewMinXForArtworkFrame_sideViewFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textViewMinXForArtworkFrame:sideViewFrame:");
}

id objc_msgSend_thenWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thenWithBlock:");
}

id objc_msgSend_threadDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "threadDictionary");
}

id objc_msgSend_thumbRectForOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thumbRectForOffset:");
}

id objc_msgSend_thumbRectForOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thumbRectForOn:");
}

id objc_msgSend_timeChapters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeChapters");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timeRemaining(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeRemaining");
}

id objc_msgSend_timeRemainingStringForEpisode_abbreviated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeRemainingStringForEpisode:abbreviated:");
}

id objc_msgSend_timeString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeString");
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeout");
}

id objc_msgSend_timeoutIntervalForResource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeoutIntervalForResource");
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timer");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timestamp");
}

id objc_msgSend_timestampBoundByNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timestampBoundByNow:");
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tintColor");
}

id objc_msgSend_tintColorForTheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tintColorForTheme:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "title");
}

id objc_msgSend_titleExclusionPathsForButtonViewFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleExclusionPathsForButtonViewFrame:");
}

id objc_msgSend_titleFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleFont");
}

id objc_msgSend_titleForAlertController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleForAlertController");
}

id objc_msgSend_titleForAlertControllerBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleForAlertControllerBlock");
}

id objc_msgSend_titleForCancelAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleForCancelAction");
}

id objc_msgSend_titleForCurrentPodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleForCurrentPodcasts");
}

id objc_msgSend_titleForShareFromMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleForShareFromMode:");
}

id objc_msgSend_titleHeightForWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleHeightForWidth:");
}

id objc_msgSend_titleImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleImage");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_titleNumberOfLines(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleNumberOfLines");
}

id objc_msgSend_titleNumberOfLinesForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleNumberOfLinesForStyle:");
}

id objc_msgSend_titleOriginXForViewWidth_artworkFrame_buttonFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleOriginXForViewWidth:artworkFrame:buttonFrame:style:");
}

id objc_msgSend_titleOriginYForArtworkFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleOriginYForArtworkFrame:style:");
}

id objc_msgSend_titleSizeForViewWidth_titleOrigin_artworkFrame_buttonViewFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleSizeForViewWidth:titleOrigin:artworkFrame:buttonViewFrame:style:");
}

id objc_msgSend_titleTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleTextColor");
}

id objc_msgSend_titleTextStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleTextStyle");
}

id objc_msgSend_titleTextView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleTextView");
}

id objc_msgSend_toJSONString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toJSONString:");
}

id objc_msgSend_toggle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggle");
}

id objc_msgSend_toggleDownloadForIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleDownloadForIndex:");
}

id objc_msgSend_toggleOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleOn:");
}

id objc_msgSend_toggleOn_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleOn:animated:");
}

id objc_msgSend_togglePodcastUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "togglePodcastUuid:");
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "token");
}

id objc_msgSend_tombstone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tombstone");
}

id objc_msgSend_topAlignLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topAlignLabel");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_topLevelPlaylistsExcludingFoldersPredicate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topLevelPlaylistsExcludingFoldersPredicate");
}

id objc_msgSend_topLevelPlaylistsPredicate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topLevelPlaylistsPredicate");
}

id objc_msgSend_topicScoresFromMediaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topicScoresFromMediaData:");
}

id objc_msgSend_totalDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalDuration");
}

id objc_msgSend_totalEpisodeCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalEpisodeCount");
}

id objc_msgSend_totalTimeMillis(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalTimeMillis");
}

id objc_msgSend_totalUnplayedCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalUnplayedCount");
}

id objc_msgSend_touchAllMigrationVersions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchAllMigrationVersions");
}

id objc_msgSend_touchCoreDataMigrationVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchCoreDataMigrationVersion");
}

id objc_msgSend_touchInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchInsets");
}

id objc_msgSend_touchLibraryMigrationVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchLibraryMigrationVersion");
}

id objc_msgSend_trackIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackIdentifiers");
}

id objc_msgSend_trackNum(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackNum");
}

id objc_msgSend_tracklist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tracklist");
}

id objc_msgSend_tracksDefault(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tracksDefault");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transaction");
}

id objc_msgSend_transaction_didProcessResponseWithDomainVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transaction:didProcessResponseWithDomainVersion:");
}

id objc_msgSend_transaction_willProcessResponseWithDomainVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transaction:willProcessResponseWithDomainVersion:");
}

id objc_msgSend_transactionCancelledErrorWithTransaction_code_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionCancelledErrorWithTransaction:code:underlyingError:");
}

id objc_msgSend_transactionCancelledErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionCancelledErrorWithTransaction:underlyingError:");
}

id objc_msgSend_transactionClamps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionClamps");
}

id objc_msgSend_transactionDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionDescription");
}

id objc_msgSend_transactionMissingDomainErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionMissingDomainErrorWithTransaction:underlyingError:");
}

id objc_msgSend_transactionMissingURLErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionMissingURLErrorWithTransaction:underlyingError:");
}

id objc_msgSend_transactionNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionNumber");
}

id objc_msgSend_transactionProcessor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionProcessor");
}

id objc_msgSend_transactionTimeoutErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionTimeoutErrorWithTransaction:underlyingError:");
}

id objc_msgSend_transcriptIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcriptIdentifier");
}

id objc_msgSend_transcriptProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcriptProvider");
}

id objc_msgSend_transferDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transferDuration");
}

id objc_msgSend_transitionCoordinator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionCoordinator");
}

id objc_msgSend_triggeredByFromFeedUpdateNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggeredByFromFeedUpdateNotification:");
}

id objc_msgSend_truePredicate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "truePredicate");
}

id objc_msgSend_tuckHeader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tuckHeader");
}

id objc_msgSend_twitterShareURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "twitterShareURL");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_uberArtworkTextPrimaryColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uberArtworkTextPrimaryColor");
}

id objc_msgSend_uberArtworkTextQuaternaryColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uberArtworkTextQuaternaryColor");
}

id objc_msgSend_uberArtworkTextSecondaryColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uberArtworkTextSecondaryColor");
}

id objc_msgSend_uberArtworkTextTertiaryColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uberArtworkTextTertiaryColor");
}

id objc_msgSend_uberBackgroundImageURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uberBackgroundImageURL");
}

id objc_msgSend_uberBackgroundJoeColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uberBackgroundJoeColor");
}

id objc_msgSend_uiShared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uiShared");
}

id objc_msgSend_unarchivedIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedIdentifiers");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unavailableReasonForEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unavailableReasonForEpisode:");
}

id objc_msgSend_unbox_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unbox:");
}

id objc_msgSend_uncalculatedLevel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uncalculatedLevel");
}

id objc_msgSend_unionOrderedSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionOrderedSet:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_uniqueIdentifierForEpisodeInPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueIdentifierForEpisodeInPlayerItem:");
}

id objc_msgSend_uniqueIdentifierForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueIdentifierForObject:");
}

id objc_msgSend_uniqueIdentifierForPodcastInPlayerItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueIdentifierForPodcastInPlayerItem:");
}

id objc_msgSend_uniquePodcastUuidCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniquePodcastUuidCount");
}

id objc_msgSend_universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:");
}

id objc_msgSend_universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_sampPlaybackOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:");
}

id objc_msgSend_universalPlaybackQueueIdentifierForStationUuid_episodeUuid_episodeGuid_episodeStoreId_podcastFeedUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "universalPlaybackQueueIdentifierForStationUuid:episodeUuid:episodeGuid:episodeStoreId:podcastFeedUrl:");
}

id objc_msgSend_universalStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "universalStore");
}

id objc_msgSend_unknownErrorWithTransaction_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unknownErrorWithTransaction:underlyingError:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlock");
}

id objc_msgSend_unlockWithCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlockWithCondition:");
}

id objc_msgSend_unplayedCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unplayedCount");
}

id objc_msgSend_unplayedIcon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unplayedIcon");
}

id objc_msgSend_unplayedSections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unplayedSections");
}

id objc_msgSend_unplayedTab(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unplayedTab");
}

id objc_msgSend_unregisterForRemoteNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterForRemoteNotifications");
}

id objc_msgSend_unregisterPushNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterPushNotifications");
}

id objc_msgSend_unsafeBookmarkEpisode_onTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeBookmarkEpisode:onTimestamp:");
}

id objc_msgSend_unsafeBookmarkEpisode_onTimestamp_shouldDownloadEpisode_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeBookmarkEpisode:onTimestamp:shouldDownloadEpisode:from:");
}

id objc_msgSend_unsafeCategoriesWithRelationshipToPodcastAdamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeCategoriesWithRelationshipToPodcastAdamID:");
}

id objc_msgSend_unsafeDidBumpLastDatePlayedFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeDidBumpLastDatePlayedFor:");
}

id objc_msgSend_unsafeEnableSubscriptionOnPodcastUUID_from_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeEnableSubscriptionOnPodcastUUID:from:context:");
}

id objc_msgSend_unsafeEpisodePlayedBeyondThresholdForFirstTime_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeEpisodePlayedBeyondThresholdForFirstTime:from:");
}

id objc_msgSend_unsafeIngestFeedCategory_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeIngestFeedCategory:ctx:");
}

id objc_msgSend_unsafeIngestPage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeIngestPage");
}

id objc_msgSend_unsafeRemoveEpisodeFromBookmarks_from_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeRemoveEpisodeFromBookmarks:from:");
}

id objc_msgSend_unsafeRemoveFromBookmarksEpisodes_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeRemoveFromBookmarksEpisodes:context:");
}

id objc_msgSend_unsafeUpdateEpisode_forRemoteEpisodeDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeUpdateEpisode:forRemoteEpisodeDictionary:");
}

id objc_msgSend_unsafeUpdateEpisodeLevelsWithShowUUID_on_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeUpdateEpisodeLevelsWithShowUUID:on:");
}

id objc_msgSend_unsafeUpdateEpisodeShowTypeSpecificLevelsWithShowUUID_on_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeUpdateEpisodeShowTypeSpecificLevelsWithShowUUID:on:");
}

id objc_msgSend_unsafeUpdateRelatedFieldsIfUpNextChangedForPodcast_upNextResult_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsafeUpdateRelatedFieldsIfUpNextChangedForPodcast:upNextResult:ctx:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsubscribeFromLifecycleEventNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsubscribeFromLifecycleEventNotifications");
}

id objc_msgSend_unsupportedClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsupportedClient");
}

id objc_msgSend_unsuppressAutomaticDownloadsIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsuppressAutomaticDownloadsIfNeeded");
}

id objc_msgSend_unvisitedEpisodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unvisitedEpisodes");
}

id objc_msgSend_unvisitedPodcastsToUnsubscribeIn_mismatch_version_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unvisitedPodcastsToUnsubscribeIn:mismatch:version:");
}

id objc_msgSend_upNextController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upNextController");
}

id objc_msgSend_upNextForPodcastUuid_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upNextForPodcastUuid:ctx:");
}

id objc_msgSend_upNextForPodcastUuid_excludeExplicit_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upNextForPodcastUuid:excludeExplicit:ctx:");
}

id objc_msgSend_upNextManifest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upNextManifest");
}

id objc_msgSend_upNextOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upNextOffset");
}

id objc_msgSend_upNextQueueIntent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upNextQueueIntent");
}

id objc_msgSend_upNextResultsController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upNextResultsController");
}

id objc_msgSend_update(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "update");
}

id objc_msgSend_updateAccountForLastSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAccountForLastSync");
}

id objc_msgSend_updateActionSheet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateActionSheet");
}

id objc_msgSend_updateActionSheetsAndPopovers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateActionSheetsAndPopovers");
}

id objc_msgSend_updateAdamId_forEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAdamId:forEpisode:");
}

id objc_msgSend_updateAdamIdForPodcast_withFeedURLs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAdamIdForPodcast:withFeedURLs:");
}

id objc_msgSend_updateAddingShowsWithStoreCollectionIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAddingShowsWithStoreCollectionIds:");
}

id objc_msgSend_updateAllPlaylistsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAllPlaylistsWithCompletion:");
}

id objc_msgSend_updateAllPodcastsInBackgroundWithSource_started_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAllPodcastsInBackgroundWithSource:started:");
}

id objc_msgSend_updateAllPodcastsTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAllPodcastsTo:");
}

id objc_msgSend_updateAllPodcastsUserInitiated_forced_source_started_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAllPodcastsUserInitiated:forced:source:started:");
}

id objc_msgSend_updateArtworkForShow_useBackgroundFetch_fetchUberImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateArtworkForShow:useBackgroundFetch:fetchUberImage:");
}

id objc_msgSend_updateAssetStatusIcons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAssetStatusIcons");
}

id objc_msgSend_updateAttributes_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAttributes:forIndexPath:");
}

id objc_msgSend_updateAttributes_withTopAlignmentGuide_andLastYOrigin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAttributes:withTopAlignmentGuide:andLastYOrigin:");
}

id objc_msgSend_updateAvg(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAvg");
}

id objc_msgSend_updateCacheForEpisode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCacheForEpisode:");
}

id objc_msgSend_updateCachedLayoutAttributesForElementsInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCachedLayoutAttributesForElementsInRect:");
}

id objc_msgSend_updateCellPresentationAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCellPresentationAttributes:");
}

id objc_msgSend_updateCellShadows_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCellShadows:animated:");
}

id objc_msgSend_updateColors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateColors");
}

id objc_msgSend_updateColorsForBarsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateColorsForBarsView:");
}

id objc_msgSend_updateContainerOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateContainerOrder:");
}

id objc_msgSend_updateCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCount");
}

id objc_msgSend_updateCursorPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCursorPosition:");
}

id objc_msgSend_updateDRMKeysForDownloadsWithUrlProtocolDelegate_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDRMKeysForDownloadsWithUrlProtocolDelegate:completionHandler:");
}

id objc_msgSend_updateDebugUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDebugUI");
}

id objc_msgSend_updateDescriptionText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDescriptionText");
}

id objc_msgSend_updateDisabledReason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDisabledReason");
}

id objc_msgSend_updateDownloadCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDownloadCount");
}

id objc_msgSend_updateEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEnabled");
}

id objc_msgSend_updateEntitlementState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEntitlementState");
}

id objc_msgSend_updateEpisode_andPlayerItem_withElapsedTime_andDuration_onMediaItemWillChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEpisode:andPlayerItem:withElapsedTime:andDuration:onMediaItemWillChange:");
}

id objc_msgSend_updateEpisode_withUPPMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEpisode:withUPPMetadata:");
}

id objc_msgSend_updateEpisodeForPlayerUpdateForceSave_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEpisodeForPlayerUpdateForceSave:");
}

id objc_msgSend_updateEpisodeObserverForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEpisodeObserverForPodcast:");
}

id objc_msgSend_updateEpisodesForSettings_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEpisodesForSettings:ctx:");
}

id objc_msgSend_updateEpisodesMetadataIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEpisodesMetadataIdentifiers");
}

id objc_msgSend_updateFeedForFeedUrl_cloudSyncFeedUrl_podcastStoreId_triggerBy_userInitiated_forceBootstrap_useBackgroundFetch_source_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFeedForFeedUrl:cloudSyncFeedUrl:podcastStoreId:triggerBy:userInitiated:forceBootstrap:useBackgroundFetch:source:completion:");
}

id objc_msgSend_updateFeedForFeedUrl_cloudSyncFeedUrl_podcastStoreId_triggerBy_userInitiated_forceBootstrap_useBackgroundFetch_source_isSubscribing_feedDownloadedHook_preProcessFeedHook_postProcessFeedHook_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFeedForFeedUrl:cloudSyncFeedUrl:podcastStoreId:triggerBy:userInitiated:forceBootstrap:useBackgroundFetch:source:isSubscribing:feedDownloadedHook:preProcessFeedHook:postProcessFeedHook:completion:");
}

id objc_msgSend_updateFlagsForPodcastUuid_predicateForUnplayedTab_predicateForUserEpisodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFlagsForPodcastUuid:predicateForUnplayedTab:predicateForUserEpisodes:");
}

id objc_msgSend_updateFonts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFonts");
}

id objc_msgSend_updateFooterText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFooterText");
}

id objc_msgSend_updateFooterTextViewVisbility(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFooterTextViewVisbility");
}

id objc_msgSend_updateGlobalDownloadPolicyIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateGlobalDownloadPolicyIfNecessary");
}

id objc_msgSend_updateIconView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIconView");
}

id objc_msgSend_updateIcons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIcons");
}

id objc_msgSend_updateIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIdentifiers");
}

id objc_msgSend_updateIndexRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIndexRequests");
}

id objc_msgSend_updateIsCurrentPlayerItemState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIsCurrentPlayerItemState");
}

id objc_msgSend_updateLastTouchDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLastTouchDate");
}

id objc_msgSend_updateLaunchCommandsWithConfigurationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLaunchCommandsWithConfigurationHandler:");
}

id objc_msgSend_updateLocalCacheIfNeededWithData_version_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLocalCacheIfNeededWithData:version:");
}

id objc_msgSend_updateMacPlaybackShortcutItemsForPlaybackState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMacPlaybackShortcutItemsForPlaybackState:");
}

id objc_msgSend_updateMediaLibraryFromNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMediaLibraryFromNotification:");
}

id objc_msgSend_updateMediaLibraryItem_playhead_playState_playCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMediaLibraryItem:playhead:playState:playCount:");
}

id objc_msgSend_updateMetadataText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMetadataText");
}

id objc_msgSend_updateMoreButtonVisibility(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMoreButtonVisibility");
}

id objc_msgSend_updateNotificationSettingsToMatchSubscription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateNotificationSettingsToMatchSubscription:");
}

id objc_msgSend_updateNowPlayingDurationSnapshot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateNowPlayingDurationSnapshot");
}

id objc_msgSend_updateOperationQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateOperationQueue");
}

id objc_msgSend_updateOverlayForIsNew(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateOverlayForIsNew");
}

id objc_msgSend_updatePlayStatusIcons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlayStatusIcons");
}

id objc_msgSend_updatePlaybackPositionWithEpisodeStoreId_completed_position_account_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlaybackPositionWithEpisodeStoreId:completed:position:account:completion:");
}

id objc_msgSend_updatePlaybackSettingIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlaybackSettingIfNeeded");
}

id objc_msgSend_updatePlaylist_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlaylist:inContext:");
}

id objc_msgSend_updatePlaylistWithUuid_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlaylistWithUuid:inContext:");
}

id objc_msgSend_updatePlaylistWithUuid_inContext_applyAdditionalChangesBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlaylistWithUuid:inContext:applyAdditionalChangesBlock:");
}

id objc_msgSend_updatePlaylistsWithUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlaylistsWithUuids:");
}

id objc_msgSend_updatePlaylistsWithUuids_context_applyAdditionalChangesBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePlaylistsWithUuids:context:applyAdditionalChangesBlock:");
}

id objc_msgSend_updatePodcastCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePodcastCount");
}

id objc_msgSend_updatePodcastSizeEstimation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePodcastSizeEstimation");
}

id objc_msgSend_updatePodcastSizeEstimationWorkController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePodcastSizeEstimationWorkController");
}

id objc_msgSend_updatePodcastWithEpisodeAdamId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePodcastWithEpisodeAdamId:completion:");
}

id objc_msgSend_updatePodcastWithStoreId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePodcastWithStoreId:completion:");
}

id objc_msgSend_updatePodcastWithStoreId_triggerBy_userInitiated_forced_source_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePodcastWithStoreId:triggerBy:userInitiated:forced:source:completion:");
}

id objc_msgSend_updatePodcastWithUUID_userInitiated_forced_forceBootstrap_source_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePodcastWithUUID:userInitiated:forced:forceBootstrap:source:completion:");
}

id objc_msgSend_updatePodcastWithUuid_withFeed_originalFeedUrl_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePodcastWithUuid:withFeed:originalFeedUrl:source:");
}

id objc_msgSend_updatePodcastsToAdd_addingPodcastIfNeeded_hasLocalPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePodcastsToAdd:addingPodcastIfNeeded:hasLocalPodcast:");
}

id objc_msgSend_updatePodcastsToUnsubscribe_remotePodcast_localPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePodcastsToUnsubscribe:remotePodcast:localPodcast:");
}

id objc_msgSend_updatePopover(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePopover");
}

id objc_msgSend_updatePredicate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePredicate");
}

id objc_msgSend_updatePredicateDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePredicateDuration");
}

id objc_msgSend_updatePreferredSkipDurationsFromUserDefaults_forCommandCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePreferredSkipDurationsFromUserDefaults:forCommandCenter:");
}

id objc_msgSend_updateQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateQueue");
}

id objc_msgSend_updateRefreshControlEnabledState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRefreshControlEnabledState");
}

id objc_msgSend_updateRefreshEnabledState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRefreshEnabledState");
}

id objc_msgSend_updateRemoteSkipPreferenceFromDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRemoteSkipPreferenceFromDefaults:");
}

id objc_msgSend_updateRowHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRowHeight");
}

id objc_msgSend_updateSearchableIndexWithReason_searchableIndex_entityLoadingBlock_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSearchableIndexWithReason:searchableIndex:entityLoadingBlock:completion:");
}

id objc_msgSend_updateSetting_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSetting:value:");
}

id objc_msgSend_updateSettingForSettingValueChangeByUpdatingCellAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSettingForSettingValueChangeByUpdatingCellAtIndexPath:");
}

id objc_msgSend_updateSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSettings:");
}

id objc_msgSend_updateSettingsForLocalPodcast_remotePodcast_ctx_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSettingsForLocalPodcast:remotePodcast:ctx:");
}

id objc_msgSend_updateSettingsIfNeededForLocalPodcast_remotePodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSettingsIfNeededForLocalPodcast:remotePodcast:");
}

id objc_msgSend_updateShortcutItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateShortcutItems");
}

id objc_msgSend_updateShowSetting_forSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateShowSetting:forSettings:");
}

id objc_msgSend_updateSizeIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSizeIfNeeded");
}

id objc_msgSend_updateStateForBarsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStateForBarsView:");
}

id objc_msgSend_updateStationsWithUUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStationsWithUUIDs:");
}

id objc_msgSend_updateStdDev(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStdDev");
}

id objc_msgSend_updateStoreInfoForEpisodesAndPodcast_skipPodcastLastCheckDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStoreInfoForEpisodesAndPodcast:skipPodcastLastCheckDate:");
}

id objc_msgSend_updateStoreInfoForEpisodesInPodcast_withEpisodeIds_andEpisodesWithGuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStoreInfoForEpisodesInPodcast:withEpisodeIds:andEpisodesWithGuid:");
}

id objc_msgSend_updateStoreInfoForPodcast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStoreInfoForPodcast:");
}

id objc_msgSend_updateSubscriptionsLastSyncTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSubscriptionsLastSyncTimestamp");
}

id objc_msgSend_updateSubscriptionsLastSyncTimestampFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSubscriptionsLastSyncTimestampFor:");
}

id objc_msgSend_updateSubscriptionsSyncVersionFor_newValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSubscriptionsSyncVersionFor:newValue:");
}

id objc_msgSend_updateTTMLIDFrom_toNewID_hasDownloadedContent_forEpisodeAdamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTTMLIDFrom:toNewID:hasDownloadedContent:forEpisodeAdamID:");
}

id objc_msgSend_updateTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTitle:");
}

id objc_msgSend_updateTitleFontIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTitleFontIfNeeded");
}

id objc_msgSend_updateTitleIncludingIcons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTitleIncludingIcons");
}

id objc_msgSend_updateTranscriptInformation_transcriptSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTranscriptInformation:transcriptSource:");
}

id objc_msgSend_updateUPPEpisodeUuid_bookmarkTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUPPEpisodeUuid:bookmarkTime:");
}

id objc_msgSend_updateUPPIdentifierIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUPPIdentifierIfNeeded");
}

id objc_msgSend_updateUPPMetadata_fromUPPRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUPPMetadata:fromUPPRecord:");
}

id objc_msgSend_updateUPPTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUPPTimestamp");
}

id objc_msgSend_updateUnplayedBadgeCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUnplayedBadgeCount");
}

id objc_msgSend_updateUnplayedCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUnplayedCount");
}

id objc_msgSend_updateWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithObject:");
}

id objc_msgSend_updatedEpisodeCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedEpisodeCount");
}

id objc_msgSend_updatedFeedURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedFeedURL");
}

id objc_msgSend_updatedObjectIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedObjectIDs");
}

id objc_msgSend_updatedProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedProperties");
}

id objc_msgSend_updaterType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updaterType");
}

id objc_msgSend_updatingCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatingCount");
}

id objc_msgSend_upgradeToAlternatePaidVersionIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upgradeToAlternatePaidVersionIfNeeded");
}

id objc_msgSend_upgradeToLocalEpisodeBackedItemWithEpisodeUUID_podcastUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upgradeToLocalEpisodeBackedItemWithEpisodeUUID:podcastUUID:");
}

id objc_msgSend_uppDataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppDataSource");
}

id objc_msgSend_uppLastSyncTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppLastSyncTime");
}

id objc_msgSend_uppMetadataForMetadataIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppMetadataForMetadataIdentifier:");
}

id objc_msgSend_uppSyncDirtyFlag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppSyncDirtyFlag");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_uppercaseStringWithLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppercaseStringWithLocale:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "url");
}

id objc_msgSend_urlRawString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlRawString");
}

id objc_msgSend_urlRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlRequest");
}

id objc_msgSend_urlString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlString");
}

id objc_msgSend_useBackgroundFetch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "useBackgroundFetch");
}

id objc_msgSend_useBackgroundFetchForFeedDownloads(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "useBackgroundFetchForFeedDownloads");
}

id objc_msgSend_useLayoutForSkinnyPhones(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "useLayoutForSkinnyPhones");
}

id objc_msgSend_useSelfSizingCells(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "useSelfSizingCells");
}

id objc_msgSend_userAcceptedSyncTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userAcceptedSyncTimestamp");
}

id objc_msgSend_userActivityContainsPlayhead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userActivityContainsPlayhead");
}

id objc_msgSend_userCanceledAuth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userCanceledAuth");
}

id objc_msgSend_userCancelledSignInBackOffUntil(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userCancelledSignInBackOffUntil");
}

id objc_msgSend_userClampErrorWithTransaction_retrySeconds_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userClampErrorWithTransaction:retrySeconds:underlyingError:");
}

id objc_msgSend_userDefaultPropertiesAffectingPredicates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDefaultPropertiesAffectingPredicates");
}

id objc_msgSend_userDeleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDeleted");
}

id objc_msgSend_userDriven(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDriven");
}

id objc_msgSend_userEpisode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userEpisode");
}

id objc_msgSend_userHasSomePodcasts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userHasSomePodcasts");
}

id objc_msgSend_userId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userId");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInfoValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfoValueForKey:");
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInitiated");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_userInterfaceLayoutDirectionForSemanticContentAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceLayoutDirectionForSemanticContentAttribute:");
}

id objc_msgSend_userManifest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userManifest");
}

id objc_msgSend_userNotificationCenter_openSettingsForNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userNotificationCenter:openSettingsForNotification:");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "username");
}

id objc_msgSend_usesCleanEpisodeTitles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "usesCleanEpisodeTitles");
}

id objc_msgSend_uti(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uti");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuid");
}

id objc_msgSend_uuidOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuidOrder");
}

id objc_msgSend_uuidSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuidSet");
}

id objc_msgSend_uuidToManagedObjectIDMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuidToManagedObjectIDMap");
}

id objc_msgSend_uuidToPlayerItemMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuidToPlayerItemMap");
}

id objc_msgSend_uuids(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuids");
}

id objc_msgSend_uuidsByRemovingDownloadCandidatesFromEpisodeUuids_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuidsByRemovingDownloadCandidatesFromEpisodeUuids:");
}

id objc_msgSend_validate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validate");
}

id objc_msgSend_validateDataFromSuccessfulSetTransaction_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateDataFromSuccessfulSetTransaction:forKey:");
}

id objc_msgSend_validateDownloadedEpisodesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateDownloadedEpisodesWithCompletion:");
}

id objc_msgSend_validatedIdNumberFromStoreId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validatedIdNumberFromStoreId:");
}

id objc_msgSend_validationError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validationError");
}

id objc_msgSend_validationManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validationManager");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "value");
}

id objc_msgSend_valueForIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForIndex:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKey_shareMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:shareMode:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_valueSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueSet");
}

id objc_msgSend_valueWithCGSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCGSize:");
}

id objc_msgSend_valueWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCompletion:");
}

id objc_msgSend_valueWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithError:");
}

id objc_msgSend_vc(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vc");
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vendorID");
}

id objc_msgSend_verboseDisplayString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verboseDisplayString");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "version");
}

id objc_msgSend_versionForGetTransaction_key_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "versionForGetTransaction:key:");
}

id objc_msgSend_versionForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "versionForKey:");
}

id objc_msgSend_versionMismatch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "versionMismatch");
}

id objc_msgSend_versionOfDictionaryRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "versionOfDictionaryRepresentation:");
}

id objc_msgSend_vibrantImageView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vibrantImageView");
}

id objc_msgSend_videoIcon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "videoIcon");
}

id objc_msgSend_videoViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "videoViewController");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_viewAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewAction");
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllers");
}

id objc_msgSend_visible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visible");
}

id objc_msgSend_visibleBounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleBounds");
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleCells");
}

id objc_msgSend_volumeAudioCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "volumeAudioCategory");
}

id objc_msgSend_volumeController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "volumeController");
}

id objc_msgSend_wasCanceled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wasCanceled");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weakObjectsHashTable");
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "webpageURL");
}

id objc_msgSend_welcomeControllerDidAppear(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcomeControllerDidAppear");
}

id objc_msgSend_welcomeControllerDidDisappear(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcomeControllerDidDisappear");
}

id objc_msgSend_welcomeControllerWillDisappear(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcomeControllerWillDisappear");
}

id objc_msgSend_welcomeViewControllerClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcomeViewControllerClass");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_whitelistedClasses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitelistedClasses");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitespaceCharacterSet");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_willConnectScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willConnectScene");
}

id objc_msgSend_willDeletePersistentId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willDeletePersistentId:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "window");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowScene");
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workQueue");
}

id objc_msgSend_workQueueConcurrent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workQueueConcurrent");
}

id objc_msgSend_wrapperRevision(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wrapperRevision");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToKeychain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToKeychain");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:atomically:");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:error:");
}
