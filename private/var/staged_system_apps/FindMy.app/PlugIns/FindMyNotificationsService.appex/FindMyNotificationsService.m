uint64_t sub_10000420C()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;

  v1 = objc_msgSend(v0, "type");
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(SPBeaconTypeDurian);
  v4 = v3;
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  if (v2 == v5 && v4 == v6)
    goto LABEL_14;
  v8 = v6;
  v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v2, v4, v5, v6, 0);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v8);
  if ((v9 & 1) != 0)
  {
LABEL_15:

    return 1;
  }
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(SPBeaconTypeAccessory);
  v4 = v11;
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  if (v10 == v12 && v4 == v13)
  {
LABEL_14:
    swift_bridgeObjectRelease_n(v4, 2);
    goto LABEL_15;
  }
  v15 = v13;
  v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v4, v12, v13, 0);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v15);
  if ((v16 & 1) != 0)
    goto LABEL_15;
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(SPBeaconTypeHele);
  v19 = v18;
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  v22 = v20;
  if (v17 == v21 && v19 == v20)
  {

    swift_bridgeObjectRelease_n(v19, 2);
    return 1;
  }
  v24 = _stringCompareWithSmolCheck(_:_:expecting:)(v17, v19, v21, v20, 0);

  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v22);
  return v24 & 1;
}

uint64_t sub_10000439C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  int v8;
  __n128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD v23[4];

  v1 = v0;
  sub_10000A5A0(&qword_1000210D0);
  __chkstk_darwin();
  v3 = (char *)v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for TaskPriority(0);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  v6 = (_QWORD *)swift_allocObject(&unk_10001CC78, 40, 7);
  v6[2] = 0;
  v7 = v6 + 2;
  v6[3] = 0;
  v6[4] = v1;
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  v9 = swift_retain(v1);
  if (v8 == 1)
  {
    sub_10000B9A4((uint64_t)v3, &qword_1000210D0);
    v10 = 0;
    v11 = 0;
    v12 = 7168;
  }
  else
  {
    v13 = TaskPriority.rawValue.getter(v9);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    v12 = v13 | 0x1C00;
    v14 = *v7;
    if (*v7)
    {
      v15 = v6[3];
      ObjectType = swift_getObjectType(*v7);
      swift_unknownObjectRetain(v14, v17);
      v10 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v15);
      v11 = v18;
      swift_unknownObjectRelease(v14);
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
  }
  v19 = swift_allocObject(&unk_10001CCA0, 32, 7);
  *(_QWORD *)(v19 + 16) = &unk_1000210E0;
  *(_QWORD *)(v19 + 24) = v6;
  if (v11 | v10)
  {
    v23[0] = 0;
    v23[1] = 0;
    v20 = v23;
    v23[2] = v10;
    v23[3] = v11;
  }
  else
  {
    v20 = 0;
  }
  v21 = swift_task_create(v12, v20, (char *)&type metadata for () + 8, &unk_1000210E8, v19);
  return swift_release(v21);
}

uint64_t sub_100004570()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_100020ECC);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10000BA74;
  return sub_1000045B8();
}

uint64_t sub_1000045B8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v1[98] = v0;
  v2 = sub_10000A5A0(&qword_100021070);
  v1[99] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for UUID(0);
  v1[100] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v1[101] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[102] = swift_task_alloc(v5);
  v1[103] = swift_task_alloc(v5);
  v1[104] = swift_task_alloc(v5);
  v1[105] = swift_task_alloc(v5);
  return swift_task_switch(sub_100004664, 0, 0);
}

uint64_t sub_100004664()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint8_t *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  __objc2_class_ro *v17;
  uint8_t *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  id *v29;
  id v30;
  NSString v31;
  id *v32;
  id v33;
  uint64_t v34;
  __objc2_class_ro *v35;
  unint64_t v36;
  __objc2_class_ro *v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  id v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD *v55;
  void *object;
  uint64_t countAndFlagsBits;
  void (*v58)(void);
  void *v59;
  uint64_t v60;
  id v61;
  Swift::String v62;
  Swift::String_optional v63;
  Swift::String v64;
  Swift::String v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  Swift::String v71;
  Swift::String_optional v72;
  Swift::String v73;
  Swift::String v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSString v80;
  NSObject *v81;
  NSObject *v82;
  os_log_type_t v83;
  uint8_t *v84;
  NSObject *v85;
  uint64_t v86;
  id v87;
  NSObject *v88;
  uint64_t v89;
  uint8_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  os_log_type_t v98;
  uint8_t *v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  os_log_type_t v103;
  _BOOL4 v104;
  uint64_t v105;
  uint8_t *v106;
  uint64_t v107;
  id v108;
  id *v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void (*v115)(void);
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  _QWORD *v121;
  uint64_t v122;
  NSObject **v123;
  uint64_t *v124;
  uint64_t v125;
  void *v126;
  uint8_t *v127;
  uint8_t *v128;
  uint64_t v129;
  uint64_t v130;
  id v131;
  id *v132;
  NSObject *v133;
  uint64_t v134[2];
  Swift::String v135;
  Swift::String v136;

  if (qword_100020E98 != -1)
    swift_once(&qword_100020E98, sub_100012644);
  v1 = type metadata accessor for Logger(0);
  v2 = sub_10000A5E0(v1, (uint64_t)qword_100021FA8);
  *(_QWORD *)(v0 + 848) = v2;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "NotifyWhenFoundNotificationService: Handling new Notify When Found notification", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }
  v6 = (uint8_t *)(v0 + 784);
  v7 = *(_QWORD *)(v0 + 784);

  v8 = objc_msgSend(*(id *)(v7 + 104), "content");
  v9 = objc_msgSend(v8, "mutableCopy");

  _bridgeAnyObjectToAny(_:)(v9);
  swift_unknownObjectRelease(v9);
  v10 = sub_10000B734(0, (unint64_t *)&qword_100021078, UNMutableNotificationContent_ptr);
  v11 = swift_dynamicCast(v0 + 768, v0 + 536, (char *)&type metadata for Any + 8, v10, 6);
  if (!(_DWORD)v11)
  {
    v26 = Logger.logObject.getter(v11);
    v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "NotifyWhenFoundNotificationService: No UNMutableNotificationContent", v28, 2u);
      swift_slowDealloc(v28, -1, -1);
    }
    v29 = *(id **)v6;

    v30 = objc_msgSend(objc_allocWithZone((Class)UNMutableNotificationContent), "init");
    v31 = String._bridgeToObjectiveC()();
    objc_msgSend(v30, "setBody:", v31);

    ((void (*)(id))v29[14])(v30);
    goto LABEL_36;
  }
  v12 = v0 + 752;
  v13 = *(void **)(v0 + 768);
  *(_QWORD *)(v0 + 856) = v13;
  v14 = v13;
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter();
  v17 = &NotifyWhenFoundNotificationService;
  v124 = (uint64_t *)(v0 + 760);
  if (os_log_type_enabled(v15, v16))
  {
    v131 = v14;
    v18 = (uint8_t *)swift_slowAlloc(12, -1);
    v122 = swift_slowAlloc(32, -1);
    v134[0] = v122;
    *(_DWORD *)v18 = 136315138;
    v19 = objc_msgSend(v131, "userInfo");
    v20 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v19, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    v12 = v0 + 752;
    v21 = Dictionary.description.getter(v20, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
    v23 = v22;
    v24 = v20;
    v17 = &NotifyWhenFoundNotificationService;
    swift_bridgeObjectRelease(v24);
    *(_QWORD *)(v0 + 752) = sub_100015420(v21, v23, v134);
    v6 = (uint8_t *)(v0 + 784);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 752, v0 + 760);

    swift_bridgeObjectRelease(v23);
    v25 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "NotifyWhenFoundNotificationService: Extracting payload dictionary from: %s", v18, 0xCu);
    swift_arrayDestroy(v122, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v122, -1, -1);
    v14 = v131;
    swift_slowDealloc(v25, -1, -1);

  }
  else
  {

  }
  v32 = *(id **)v6;
  v33 = objc_msgSend(*(id *)(*(_QWORD *)v6 + 96), (SEL)v17[40].ivar_lyt);
  v34 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v33, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v35 = v17;
  v36 = sub_100006CE8(v34);
  swift_bridgeObjectRelease(v34);
  if (!v36)
  {
    v37 = v35;
    v38 = v14;
    v39 = Logger.logObject.getter(v38);
    v40 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc(12, -1);
      v129 = swift_slowAlloc(32, -1);
      v134[0] = v129;
      v127 = v41;
      *(_DWORD *)v41 = 136315138;
      v132 = v32;
      v42 = objc_msgSend(v38, (SEL)v37[40].ivar_lyt);
      v43 = v6;
      v44 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v42, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

      v45 = Dictionary.description.getter(v44, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
      v47 = v46;
      v48 = v44;
      v6 = v43;
      swift_bridgeObjectRelease(v48);
      *v124 = sub_100015420(v45, v47, v134);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v124, v0 + 768);

      v49 = v47;
      v32 = v132;
      swift_bridgeObjectRelease(v49);
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "NotifyWhenFoundNotificationService: Could not get payload dictionary from: %s", v127, 0xCu);
      swift_arrayDestroy(v129, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v129, -1, -1);
      swift_slowDealloc(v127, -1, -1);

    }
    else
    {

    }
    v58 = *(void (**)(void))(*(_QWORD *)v6 + 112);
    v30 = v32[12];
    v58();

LABEL_36:
    v116 = *(_QWORD *)(v0 + 832);
    v117 = *(_QWORD *)(v0 + 824);
    v118 = *(_QWORD *)(v0 + 816);
    v119 = *(_QWORD *)(v0 + 792);
    swift_task_dealloc(*(_QWORD *)(v0 + 840));
    swift_task_dealloc(v116);
    swift_task_dealloc(v117);
    swift_task_dealloc(v118);
    swift_task_dealloc(v119);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  sub_1000070B8(v0 + 80);
  v125 = v12;
  v128 = v6;
  swift_bridgeObjectRelease(v36);
  v50 = *(_OWORD *)(v0 + 160);
  *(_OWORD *)(v0 + 312) = *(_OWORD *)(v0 + 144);
  *(_OWORD *)(v0 + 328) = v50;
  v51 = *(_OWORD *)(v0 + 128);
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 112);
  *(_OWORD *)(v0 + 296) = v51;
  *(_QWORD *)(v0 + 408) = *(_QWORD *)(v0 + 240);
  v52 = *(_OWORD *)(v0 + 224);
  *(_OWORD *)(v0 + 376) = *(_OWORD *)(v0 + 208);
  *(_OWORD *)(v0 + 392) = v52;
  v53 = *(_OWORD *)(v0 + 192);
  *(_OWORD *)(v0 + 344) = *(_OWORD *)(v0 + 176);
  *(_OWORD *)(v0 + 360) = v53;
  v54 = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v0 + 248) = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v0 + 264) = v54;
  if (*(_QWORD *)(v0 + 304) && (v55 = *(_QWORD **)(v0 + 288)) != 0 && v55[2])
  {
    countAndFlagsBits = v55[4];
    object = (void *)v55[5];
    swift_bridgeObjectRetain(object);
  }
  else
  {
    v60 = *(_QWORD *)(*(_QWORD *)v6 + 64);
    v59 = *(void **)(*(_QWORD *)v6 + 72);
    v61 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v135._object = (void *)0x8000000100018730;
    v62._countAndFlagsBits = v60;
    v62._object = v59;
    v63.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v63.value._object = (void *)0xEB00000000656C62;
    v64._countAndFlagsBits = 0;
    v64._object = (void *)0xE000000000000000;
    v135._countAndFlagsBits = 0xD000000000000018;
    v65 = NSLocalizedString(_:tableName:bundle:value:comment:)(v62, v63, (NSBundle)v61, v64, v135);
    countAndFlagsBits = v65._countAndFlagsBits;
    object = v65._object;

  }
  *(_QWORD *)(v0 + 872) = object;
  *(_QWORD *)(v0 + 864) = countAndFlagsBits;
  v66 = *(_QWORD *)(v0 + 784);
  v67 = *(_QWORD *)(v66 + 48);
  *(_QWORD *)(v0 + 880) = v67;
  v68 = *(void **)(v66 + 56);
  *(_QWORD *)(v0 + 888) = v68;
  v69 = (void *)objc_opt_self(NSBundle);
  *(_QWORD *)(v0 + 896) = v69;
  v70 = objc_msgSend(v69, "mainBundle");
  v136._object = (void *)0x8000000100018730;
  v71._countAndFlagsBits = v67;
  v71._object = v68;
  v72.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v72.value._object = (void *)0xEB00000000656C62;
  v73._countAndFlagsBits = 0;
  v73._object = (void *)0xE000000000000000;
  v136._countAndFlagsBits = 0xD000000000000018;
  v74 = NSLocalizedString(_:tableName:bundle:value:comment:)(v71, v72, (NSBundle)v70, v73, v136);

  v75 = sub_10000A5A0(&qword_100021080);
  *(_QWORD *)(v0 + 904) = v75;
  v76 = swift_allocObject(v75, 72, 7);
  *(_OWORD *)(v76 + 16) = xmmword_100017C40;
  *(_QWORD *)(v76 + 56) = &type metadata for String;
  v77 = sub_10000A77C();
  *(_QWORD *)(v0 + 912) = v77;
  *(_QWORD *)(v76 + 64) = v77;
  *(_QWORD *)(v76 + 32) = countAndFlagsBits;
  *(_QWORD *)(v76 + 40) = object;
  v126 = object;
  swift_bridgeObjectRetain(object);
  String.init(format:_:)(v74._countAndFlagsBits, v74._object, v76);
  v79 = v78;
  swift_bridgeObjectRelease(v74._object);
  v80 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v79);
  objc_msgSend(v14, "setBody:", v80);

  v81 = v14;
  v82 = Logger.logObject.getter(v81);
  v83 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v82, v83))
  {
    v84 = (uint8_t *)swift_slowAlloc(12, -1);
    v123 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v84 = 138412290;
    *(_QWORD *)(v0 + 776) = v81;
    v85 = v81;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 776, v128);
    *v123 = v81;

    _os_log_impl((void *)&_mh_execute_header, v82, v83, "NotifyWhenFoundNotificationService: Content after updating with fallback data: %@.", v84, 0xCu);
    v86 = sub_10000A5A0(&qword_100021038);
    swift_arrayDestroy(v123, 1, v86);
    swift_slowDealloc(v123, -1, -1);
    swift_slowDealloc(v84, -1, -1);
  }
  else
  {

    v82 = v81;
  }

  v87 = v32[12];
  v32[12] = v81;
  v88 = v81;

  v89 = *(_QWORD *)(v0 + 408);
  v90 = v128;
  if (!v89)
  {
    swift_bridgeObjectRelease(v126);
    v96 = (uint64_t)sub_10000A7C0((uint64_t *)(v0 + 248));
    goto LABEL_30;
  }
  v91 = *(_QWORD *)(v0 + 808);
  v92 = *(_QWORD *)(v0 + 800);
  v93 = *(_QWORD *)(v0 + 792);
  v94 = *(_QWORD *)(v0 + 400);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 408));
  sub_10000A7C0((uint64_t *)(v0 + 248));
  UUID.init(uuidString:)(v94, v89);
  swift_bridgeObjectRelease(v89);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v91 + 48))(v93, 1, v92) == 1)
  {
    v95 = *(_QWORD *)(v0 + 792);
    swift_bridgeObjectRelease(v126);
    v96 = sub_10000B9A4(v95, &qword_100021070);
LABEL_30:
    v97 = Logger.logObject.getter(v96);
    v98 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v97, v98))
    {
      v99 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v99 = 0;
      _os_log_impl((void *)&_mh_execute_header, v97, v98, "NotifyWhenFoundNotificationService: No subscription identifier. Nothing else to do.", v99, 2u);
      swift_slowDealloc(v99, -1, -1);
    }
    v100 = *(_QWORD *)v128;

    v101 = swift_retain_n(v100, 2);
    v102 = Logger.logObject.getter(v101);
    v103 = static os_log_type_t.default.getter();
    v104 = os_log_type_enabled(v102, v103);
    v105 = *(_QWORD *)v128;
    if (v104)
    {
      v130 = *(_QWORD *)v128;
      v106 = (uint8_t *)swift_slowAlloc(12, -1);
      v133 = v88;
      v134[0] = swift_slowAlloc(32, -1);
      v107 = v134[0];
      *(_DWORD *)v106 = 136315138;
      v108 = objc_msgSend(v32[12], "body");
      v109 = v32;
      v110 = static String._unconditionallyBridgeFromObjectiveC(_:)(v108);
      v112 = v111;

      v113 = v110;
      v32 = v109;
      *(_QWORD *)(v0 + 744) = sub_100015420(v113, v112, v134);
      v90 = v128;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 744, v125);
      swift_release_n(v130, 2);
      swift_bridgeObjectRelease(v112);
      _os_log_impl((void *)&_mh_execute_header, v102, v103, "NotifyWhenFoundNotificationService: Completing with fallback data from server %s", v106, 0xCu);
      swift_arrayDestroy(v107, 1, (char *)&type metadata for Any + 8);
      v114 = v107;
      v88 = v133;
      swift_slowDealloc(v114, -1, -1);
      swift_slowDealloc(v106, -1, -1);

    }
    else
    {

      swift_release_n(v105, 2);
    }
    v115 = *(void (**)(void))(*(_QWORD *)v90 + 112);
    v30 = v32[12];
    v115();

    goto LABEL_36;
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 808) + 32))(*(_QWORD *)(v0 + 840), *(_QWORD *)(v0 + 792), *(_QWORD *)(v0 + 800));
  v121 = (_QWORD *)swift_task_alloc(dword_100020ED4);
  *(_QWORD *)(v0 + 920) = v121;
  *v121 = v0;
  v121[1] = sub_1000053F4;
  return sub_100007E08(*(_QWORD *)(v0 + 840));
}

uint64_t sub_1000053F4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 920);
  *(_QWORD *)(v3 + 928) = a1;
  *(_QWORD *)(v3 + 936) = a2;
  swift_task_dealloc(v4);
  return swift_task_switch(sub_100005454, 0, 0);
}

uint64_t sub_100005454()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  Class isa;
  void (*v11)(uint64_t, uint64_t);
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(void);
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  NSString v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  char isUniquelyReferenced_nonNull_native;
  Class v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  char v58;
  Class v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  NSString v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  id v71;
  Swift::String v72;
  Swift::String_optional v73;
  Swift::String v74;
  Swift::String v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSString v79;
  NSObject *v80;
  os_log_type_t v81;
  _BOOL4 v82;
  void *v83;
  uint8_t *v84;
  _QWORD *v85;
  id v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  NSObject *v92;
  _QWORD *v93;
  void (*v94)(uint64_t, uint64_t);
  uint64_t v95;
  Swift::String v96;

  v1 = *(void **)(v0 + 928);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 784);
    v3 = swift_allocObject(&unk_10001CBD0, 24, 7);
    *(_QWORD *)(v0 + 944) = v3;
    swift_weakInit(v3 + 16, v2);
    if ((sub_10000420C() & 1) != 0)
    {
      v4 = *(_QWORD *)(v0 + 832);
      v5 = *(_QWORD *)(v0 + 808);
      v6 = *(_QWORD *)(v0 + 800);
      v7 = *(void **)(*(_QWORD *)(v0 + 784) + 88);
      *(_QWORD *)(v0 + 952) = v7;
      v8 = v7;
      v9 = objc_msgSend(v1, "identifier");
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      isa = UUID._bridgeToObjectiveC()().super.isa;
      *(_QWORD *)(v0 + 960) = isa;
      v11 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
      *(_QWORD *)(v0 + 968) = v11;
      v11(v4, v6);
      *(_QWORD *)(v0 + 56) = v0 + 1032;
      *(_QWORD *)(v0 + 16) = v0;
      *(_QWORD *)(v0 + 24) = sub_100005D5C;
      *(_QWORD *)(v0 + 488) = swift_continuation_init(v0 + 16, 0);
      *(_QWORD *)(v0 + 456) = _NSConcreteStackBlock;
      *(_QWORD *)(v0 + 464) = 0x40000000;
      *(_QWORD *)(v0 + 472) = sub_100007DF4;
      *(_QWORD *)(v0 + 480) = &unk_10001CBE8;
      objc_msgSend(v8, "postedLocalNotifyWhenFoundNotificationForUUID:completion:", isa, v0 + 456);
      return swift_continuation_await(v0 + 16);
    }
    else
    {
      v95 = *(_QWORD *)(v0 + 936);
      v24 = *(void **)(v0 + 928);
      v25 = *(void **)(v0 + 856);
      v26 = *(_QWORD *)(v0 + 832);
      v27 = *(_QWORD *)(v0 + 824);
      v28 = *(_QWORD *)(v0 + 808);
      v29 = *(_QWORD *)(v0 + 800);
      v30 = objc_msgSend(v24, "identifier");
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      UUID.uuidString.getter();
      v32 = v31;
      v33 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
      *(_QWORD *)(v0 + 976) = v33;
      v33(v26, v29);
      v34 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v32);
      v35 = v25;
      objc_msgSend(v25, "setTargetContentIdentifier:", v34);

      *(_QWORD *)(v0 + 696) = 0xD000000000000010;
      *(_QWORD *)(v0 + 704) = 0x8000000100018430;
      AnyHashable.init<A>(_:)(v0 + 696, &type metadata for String, &protocol witness table for String);
      v36 = objc_msgSend(v24, "identifier");
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      v37 = UUID.uuidString.getter();
      v39 = v38;
      v94 = v33;
      v33(v27, v29);
      *(_QWORD *)(v0 + 592) = &type metadata for String;
      *(_QWORD *)(v0 + 568) = v37;
      *(_QWORD *)(v0 + 576) = v39;
      v40 = objc_msgSend(v35, "userInfo");
      v41 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v40, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

      sub_10000B724((_OWORD *)(v0 + 568), (_OWORD *)(v0 + 664));
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v41);
      sub_100011C00((_OWORD *)(v0 + 664), v0 + 416, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease(0x8000000000000000);
      sub_10000A8C4(v0 + 416);
      v43 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v41);
      objc_msgSend(v35, "setUserInfo:", v43);

      if (v95)
      {
        v44 = *(id *)(v0 + 936);
        v45 = objc_msgSend(v44, "beaconMap");
        v46 = sub_10000B734(0, &qword_100021098, SPPairingState_ptr);
        v47 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v45, &type metadata for String, v46, &protocol witness table for String);

        v48 = *(_QWORD *)(v47 + 16);
        swift_bridgeObjectRelease(v47);
        if (v48 >= 2)
        {
          v49 = *(void **)(v0 + 856);
          v50 = *(_QWORD *)(v0 + 816);
          v51 = *(_QWORD *)(v0 + 800);
          *(_QWORD *)(v0 + 712) = 0x65644970756F7267;
          *(_QWORD *)(v0 + 720) = 0xEF7265696669746ELL;
          AnyHashable.init<A>(_:)(v0 + 712, &type metadata for String, &protocol witness table for String);
          v52 = objc_msgSend(v44, "identifier");
          static UUID._unconditionallyBridgeFromObjectiveC(_:)();

          v53 = UUID.uuidString.getter();
          v55 = v54;
          v94(v50, v51);
          *(_QWORD *)(v0 + 656) = &type metadata for String;
          *(_QWORD *)(v0 + 632) = v53;
          *(_QWORD *)(v0 + 640) = v55;
          v56 = objc_msgSend(v49, "userInfo");
          v57 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v56, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

          sub_10000B724((_OWORD *)(v0 + 632), (_OWORD *)(v0 + 600));
          v58 = swift_isUniquelyReferenced_nonNull_native(v57);
          sub_100011C00((_OWORD *)(v0 + 600), v0 + 496, v58);
          swift_bridgeObjectRelease(0x8000000000000000);
          sub_10000A8C4(v0 + 496);
          v59 = Dictionary._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease(v57);
          objc_msgSend(v49, "setUserInfo:", v59);

        }
      }
      v60 = *(_QWORD *)(v0 + 872);
      v61 = sub_10000AA28(*(void **)(v0 + 928), *(void **)(v0 + 936), *(_QWORD *)(v0 + 864), v60);
      v63 = v62;
      swift_bridgeObjectRelease(v60);
      *(_QWORD *)(v0 + 984) = v61;
      *(_QWORD *)(v0 + 992) = v63;
      if ((sub_10000420C() & 1) != 0)
      {
        v64 = *(void **)(v0 + 856);
        v65 = String._bridgeToObjectiveC()();
        objc_msgSend(v64, "setTitle:", v65);

      }
      v66 = *(_QWORD *)(v0 + 912);
      v67 = *(_QWORD *)(v0 + 904);
      v68 = *(void **)(v0 + 888);
      v69 = *(_QWORD *)(v0 + 880);
      v70 = *(void **)(v0 + 856);
      v71 = objc_msgSend(*(id *)(v0 + 896), "mainBundle");
      v96._countAndFlagsBits = 0xD000000000000018;
      v96._object = (void *)0x8000000100018730;
      v72._countAndFlagsBits = v69;
      v72._object = v68;
      v73.value._countAndFlagsBits = 0x617A696C61636F4CLL;
      v73.value._object = (void *)0xEB00000000656C62;
      v74._countAndFlagsBits = 0;
      v74._object = (void *)0xE000000000000000;
      v75 = NSLocalizedString(_:tableName:bundle:value:comment:)(v72, v73, (NSBundle)v71, v74, v96);

      v76 = swift_allocObject(v67, 72, 7);
      *(_OWORD *)(v76 + 16) = xmmword_100017C40;
      *(_QWORD *)(v76 + 56) = &type metadata for String;
      *(_QWORD *)(v76 + 64) = v66;
      *(_QWORD *)(v76 + 32) = v61;
      *(_QWORD *)(v76 + 40) = v63;
      swift_bridgeObjectRetain(v63);
      String.init(format:_:)(v75._countAndFlagsBits, v75._object, v76);
      v78 = v77;
      swift_bridgeObjectRelease(v75._object);
      v79 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v78);
      objc_msgSend(v70, "setBody:", v79);

      v80 = Logger.logObject.getter(v70);
      v81 = static os_log_type_t.default.getter();
      v82 = os_log_type_enabled(v80, v81);
      v83 = *(void **)(v0 + 856);
      if (v82)
      {
        v84 = (uint8_t *)swift_slowAlloc(12, -1);
        v85 = (_QWORD *)swift_slowAlloc(8, -1);
        *(_DWORD *)v84 = 138412290;
        *(_QWORD *)(v0 + 728) = v83;
        v86 = v83;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 728, v0 + 736);
        *v85 = v83;

        _os_log_impl((void *)&_mh_execute_header, v80, v81, "NotifyWhenFoundNotificationService: Content after updating with beacon data: %@.", v84, 0xCu);
        v87 = sub_10000A5A0(&qword_100021038);
        swift_arrayDestroy(v85, 1, v87);
        swift_slowDealloc(v85, -1, -1);
        swift_slowDealloc(v84, -1, -1);
        v88 = *(NSObject **)(v0 + 856);
      }
      else
      {

        v88 = *(NSObject **)(v0 + 856);
        v80 = v88;
      }
      v89 = *(_QWORD *)(v0 + 928);
      v90 = *(_QWORD *)(v0 + 784);

      v91 = *(void **)(v90 + 96);
      *(_QWORD *)(v90 + 96) = v88;
      v92 = v88;

      v93 = (_QWORD *)swift_task_alloc(dword_100020EDC);
      *(_QWORD *)(v0 + 1000) = v93;
      *v93 = v0;
      v93[1] = sub_100006634;
      return sub_1000088CC(v89);
    }
  }
  else
  {
    v13 = *(void **)(v0 + 856);
    v14 = *(_QWORD *)(v0 + 840);
    v15 = *(_QWORD *)(v0 + 808);
    v16 = *(_QWORD *)(v0 + 800);
    v17 = *(_QWORD *)(v0 + 784);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 872));
    v18 = *(void (**)(void))(v17 + 112);
    v19 = *(id *)(v17 + 96);
    v18();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    v20 = *(_QWORD *)(v0 + 832);
    v21 = *(_QWORD *)(v0 + 824);
    v22 = *(_QWORD *)(v0 + 816);
    v23 = *(_QWORD *)(v0 + 792);
    swift_task_dealloc(*(_QWORD *)(v0 + 840));
    swift_task_dealloc(v20);
    swift_task_dealloc(v21);
    swift_task_dealloc(v22);
    swift_task_dealloc(v23);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_100005D5C()
{
  return swift_task_switch(sub_100005DA8, 0, 0);
}

uint64_t sub_100005DA8()
{
  uint64_t v0;
  void *v1;
  int v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  NSString v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  char isUniquelyReferenced_nonNull_native;
  Class isa;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  char v52;
  Class v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  NSString v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id v65;
  Swift::String v66;
  Swift::String_optional v67;
  Swift::String v68;
  Swift::String v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSString v73;
  NSObject *v74;
  os_log_type_t v75;
  _BOOL4 v76;
  void *v77;
  uint8_t *v78;
  _QWORD *v79;
  id v80;
  uint64_t v81;
  NSObject *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  NSObject *v86;
  _QWORD *v87;
  id v88;
  uint64_t v89;
  void (*v90)(uint64_t, uint64_t);
  uint64_t v91;
  Swift::String v92;

  v1 = *(void **)(v0 + 952);
  v2 = *(unsigned __int8 *)(v0 + 1032);

  if (v2 == 1)
  {
    v3 = swift_bridgeObjectRelease(*(_QWORD *)(v0 + 872));
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "NotifyWhenFoundNotificationService: Local notification was already posted, returning empty content.", v6, 2u);
      swift_slowDealloc(v6, -1, -1);
    }
    v7 = *(void (**)(uint64_t, uint64_t))(v0 + 968);
    v8 = *(_QWORD *)(v0 + 944);
    v9 = *(void **)(v0 + 936);
    v10 = *(void **)(v0 + 928);
    v11 = *(void **)(v0 + 856);
    v12 = *(_QWORD *)(v0 + 840);
    v13 = *(_QWORD *)(v0 + 800);

    v14 = objc_msgSend(objc_allocWithZone((Class)UNMutableNotificationContent), "init");
    sub_1000075B8(v14, v10, v8);

    swift_release(v8);
    v7(v12, v13);
    v15 = *(_QWORD *)(v0 + 832);
    v16 = *(_QWORD *)(v0 + 824);
    v17 = *(_QWORD *)(v0 + 816);
    v18 = *(_QWORD *)(v0 + 792);
    swift_task_dealloc(*(_QWORD *)(v0 + 840));
    swift_task_dealloc(v15);
    swift_task_dealloc(v16);
    swift_task_dealloc(v17);
    swift_task_dealloc(v18);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v91 = *(_QWORD *)(v0 + 936);
    v20 = *(void **)(v0 + 928);
    v21 = *(_QWORD *)(v0 + 832);
    v22 = *(_QWORD *)(v0 + 824);
    v23 = *(_QWORD *)(v0 + 808);
    v24 = *(_QWORD *)(v0 + 800);
    v88 = *(id *)(v0 + 856);
    v89 = v24;
    v25 = objc_msgSend(v20, "identifier");
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    UUID.uuidString.getter();
    v27 = v26;
    v28 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    *(_QWORD *)(v0 + 976) = v28;
    v28(v21, v24);
    v29 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v27);
    objc_msgSend(v88, "setTargetContentIdentifier:", v29);

    *(_QWORD *)(v0 + 696) = 0xD000000000000010;
    *(_QWORD *)(v0 + 704) = 0x8000000100018430;
    AnyHashable.init<A>(_:)(v0 + 696, &type metadata for String, &protocol witness table for String);
    v30 = objc_msgSend(v20, "identifier");
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    v31 = UUID.uuidString.getter();
    v33 = v32;
    v90 = v28;
    v28(v22, v89);
    *(_QWORD *)(v0 + 592) = &type metadata for String;
    *(_QWORD *)(v0 + 568) = v31;
    *(_QWORD *)(v0 + 576) = v33;
    v34 = objc_msgSend(v88, "userInfo");
    v35 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v34, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    sub_10000B724((_OWORD *)(v0 + 568), (_OWORD *)(v0 + 664));
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v35);
    sub_100011C00((_OWORD *)(v0 + 664), v0 + 416, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease(0x8000000000000000);
    sub_10000A8C4(v0 + 416);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v35);
    objc_msgSend(v88, "setUserInfo:", isa);

    if (v91)
    {
      v38 = *(id *)(v0 + 936);
      v39 = objc_msgSend(v38, "beaconMap");
      v40 = sub_10000B734(0, &qword_100021098, SPPairingState_ptr);
      v41 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v39, &type metadata for String, v40, &protocol witness table for String);

      v42 = *(_QWORD *)(v41 + 16);
      swift_bridgeObjectRelease(v41);
      if (v42 >= 2)
      {
        v43 = *(void **)(v0 + 856);
        v44 = *(_QWORD *)(v0 + 816);
        v45 = *(_QWORD *)(v0 + 800);
        *(_QWORD *)(v0 + 712) = 0x65644970756F7267;
        *(_QWORD *)(v0 + 720) = 0xEF7265696669746ELL;
        AnyHashable.init<A>(_:)(v0 + 712, &type metadata for String, &protocol witness table for String);
        v46 = objc_msgSend(v38, "identifier");
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();

        v47 = UUID.uuidString.getter();
        v49 = v48;
        v90(v44, v45);
        *(_QWORD *)(v0 + 656) = &type metadata for String;
        *(_QWORD *)(v0 + 632) = v47;
        *(_QWORD *)(v0 + 640) = v49;
        v50 = objc_msgSend(v43, "userInfo");
        v51 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v50, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

        sub_10000B724((_OWORD *)(v0 + 632), (_OWORD *)(v0 + 600));
        v52 = swift_isUniquelyReferenced_nonNull_native(v51);
        sub_100011C00((_OWORD *)(v0 + 600), v0 + 496, v52);
        swift_bridgeObjectRelease(0x8000000000000000);
        sub_10000A8C4(v0 + 496);
        v53 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v51);
        objc_msgSend(v43, "setUserInfo:", v53);

      }
    }
    v54 = *(_QWORD *)(v0 + 872);
    v55 = sub_10000AA28(*(void **)(v0 + 928), *(void **)(v0 + 936), *(_QWORD *)(v0 + 864), v54);
    v57 = v56;
    swift_bridgeObjectRelease(v54);
    *(_QWORD *)(v0 + 984) = v55;
    *(_QWORD *)(v0 + 992) = v57;
    if ((sub_10000420C() & 1) != 0)
    {
      v58 = *(void **)(v0 + 856);
      v59 = String._bridgeToObjectiveC()();
      objc_msgSend(v58, "setTitle:", v59);

    }
    v60 = *(_QWORD *)(v0 + 912);
    v61 = *(_QWORD *)(v0 + 904);
    v62 = *(void **)(v0 + 888);
    v63 = *(_QWORD *)(v0 + 880);
    v64 = *(void **)(v0 + 856);
    v65 = objc_msgSend(*(id *)(v0 + 896), "mainBundle");
    v92._countAndFlagsBits = 0xD000000000000018;
    v92._object = (void *)0x8000000100018730;
    v66._countAndFlagsBits = v63;
    v66._object = v62;
    v67.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v67.value._object = (void *)0xEB00000000656C62;
    v68._countAndFlagsBits = 0;
    v68._object = (void *)0xE000000000000000;
    v69 = NSLocalizedString(_:tableName:bundle:value:comment:)(v66, v67, (NSBundle)v65, v68, v92);

    v70 = swift_allocObject(v61, 72, 7);
    *(_OWORD *)(v70 + 16) = xmmword_100017C40;
    *(_QWORD *)(v70 + 56) = &type metadata for String;
    *(_QWORD *)(v70 + 64) = v60;
    *(_QWORD *)(v70 + 32) = v55;
    *(_QWORD *)(v70 + 40) = v57;
    swift_bridgeObjectRetain(v57);
    String.init(format:_:)(v69._countAndFlagsBits, v69._object, v70);
    v72 = v71;
    swift_bridgeObjectRelease(v69._object);
    v73 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v72);
    objc_msgSend(v64, "setBody:", v73);

    v74 = Logger.logObject.getter(v64);
    v75 = static os_log_type_t.default.getter();
    v76 = os_log_type_enabled(v74, v75);
    v77 = *(void **)(v0 + 856);
    if (v76)
    {
      v78 = (uint8_t *)swift_slowAlloc(12, -1);
      v79 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v78 = 138412290;
      *(_QWORD *)(v0 + 728) = v77;
      v80 = v77;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 728, v0 + 736);
      *v79 = v77;

      _os_log_impl((void *)&_mh_execute_header, v74, v75, "NotifyWhenFoundNotificationService: Content after updating with beacon data: %@.", v78, 0xCu);
      v81 = sub_10000A5A0(&qword_100021038);
      swift_arrayDestroy(v79, 1, v81);
      swift_slowDealloc(v79, -1, -1);
      swift_slowDealloc(v78, -1, -1);
      v82 = *(NSObject **)(v0 + 856);
    }
    else
    {

      v82 = *(NSObject **)(v0 + 856);
      v74 = v82;
    }
    v83 = *(_QWORD *)(v0 + 928);
    v84 = *(_QWORD *)(v0 + 784);

    v85 = *(void **)(v84 + 96);
    *(_QWORD *)(v84 + 96) = v82;
    v86 = v82;

    v87 = (_QWORD *)swift_task_alloc(dword_100020EDC);
    *(_QWORD *)(v0 + 1000) = v87;
    *v87 = v0;
    v87[1] = sub_100006634;
    return sub_1000088CC(v83);
  }
}

uint64_t sub_100006634(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 1000);
  *(_QWORD *)(*(_QWORD *)v1 + 1008) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100006690, 0, 0);
}

uint64_t sub_100006690()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 1008);
  if (v1)
  {
    v2 = (_QWORD *)swift_task_alloc(dword_100021094);
    *(_QWORD *)(v0 + 1016) = v2;
    *v2 = v0;
    v2[1] = sub_1000067C8;
    v2[16] = v1;
    return swift_task_switch(sub_10000AF54, 0, 0);
  }
  else
  {
    v4 = *(void (**)(uint64_t, uint64_t))(v0 + 976);
    v5 = *(_QWORD *)(v0 + 944);
    v6 = *(void **)(v0 + 936);
    v7 = *(void **)(v0 + 928);
    v8 = *(void **)(v0 + 856);
    v9 = *(_QWORD *)(v0 + 840);
    v10 = *(_QWORD *)(v0 + 800);
    v11 = *(_QWORD *)(v0 + 784);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 992));
    v12 = *(id *)(v11 + 96);
    sub_1000075B8(v12, v7, v5);

    swift_release(v5);
    v4(v9, v10);
    v13 = *(_QWORD *)(v0 + 832);
    v14 = *(_QWORD *)(v0 + 824);
    v15 = *(_QWORD *)(v0 + 816);
    v16 = *(_QWORD *)(v0 + 792);
    swift_task_dealloc(*(_QWORD *)(v0 + 840));
    swift_task_dealloc(v13);
    swift_task_dealloc(v14);
    swift_task_dealloc(v15);
    swift_task_dealloc(v16);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1000067C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 1016);
  *(_QWORD *)(*(_QWORD *)v1 + 1024) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100006824, 0, 0);
}

uint64_t sub_100006824()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  Swift::String v16;
  Swift::String_optional v17;
  Swift::String v18;
  Swift::String v19;
  void *object;
  uint64_t v21;
  uint64_t countAndFlagsBits;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  Swift::String v39;
  Swift::String_optional v40;
  Swift::String v41;
  Swift::String v42;
  uint64_t v43;
  uint64_t v44;
  NSString v45;
  void *v46;
  NSObject *v47;
  os_log_type_t v48;
  _BOOL4 v49;
  void *v50;
  uint8_t *v51;
  _QWORD *v52;
  id v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  NSObject *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v70;
  void (*v71)(uint64_t, uint64_t);
  void *v72;
  Swift::String v73;
  Swift::String v74;

  v1 = *(void **)(v0 + 1024);
  if (!v1)
  {
    v1 = *(void **)(v0 + 1008);
LABEL_7:

    v23 = *(void (**)(uint64_t, uint64_t))(v0 + 976);
    v24 = *(_QWORD *)(v0 + 944);
    v25 = *(void **)(v0 + 936);
    v26 = *(void **)(v0 + 928);
    v27 = *(void **)(v0 + 856);
    v28 = *(_QWORD *)(v0 + 840);
    v29 = *(_QWORD *)(v0 + 800);
    v30 = *(_QWORD *)(v0 + 784);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 992));
    v31 = *(id *)(v30 + 96);
    sub_1000075B8(v31, v26, v24);

    swift_release(v24);
    v23(v28, v29);
    goto LABEL_13;
  }
  v2 = objc_msgSend(*(id *)(v0 + 1024), "name");
  if (!v2)
  {

    goto LABEL_7;
  }
  v3 = v2;
  v72 = v1;
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  v6 = v5;

  v7 = sub_10000420C();
  v8 = *(_QWORD *)(v0 + 992);
  if ((v7 & 1) != 0)
  {
    v9 = *(_QWORD *)(v0 + 912);
    v10 = *(_QWORD *)(v0 + 904);
    v11 = *(void **)(v0 + 896);
    v12 = *(_QWORD *)(v0 + 784);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 992));
    v13 = *(_QWORD *)(v12 + 16);
    v14 = *(void **)(v12 + 24);
    v15 = objc_msgSend(v11, "mainBundle");
    v73._object = (void *)0x8000000100018730;
    v16._countAndFlagsBits = v13;
    v16._object = v14;
    v17.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v17.value._object = (void *)0xEB00000000656C62;
    v18._countAndFlagsBits = 0;
    v18._object = (void *)0xE000000000000000;
    v73._countAndFlagsBits = 0xD000000000000018;
    v19 = NSLocalizedString(_:tableName:bundle:value:comment:)(v16, v17, (NSBundle)v15, v18, v73);
    object = v19._object;

    v21 = swift_allocObject(v10, 72, 7);
    *(_OWORD *)(v21 + 16) = xmmword_100017C40;
    *(_QWORD *)(v21 + 56) = &type metadata for String;
    *(_QWORD *)(v21 + 64) = v9;
    *(_QWORD *)(v21 + 32) = v4;
    *(_QWORD *)(v21 + 40) = v6;
    countAndFlagsBits = v19._countAndFlagsBits;
  }
  else
  {
    v32 = *(_QWORD *)(v0 + 984);
    v33 = *(_QWORD *)(v0 + 912);
    v34 = *(_QWORD *)(v0 + 904);
    v35 = *(_QWORD *)(v0 + 784);
    v36 = *(_QWORD *)(v35 + 32);
    v37 = *(void **)(v35 + 40);
    v38 = objc_msgSend(*(id *)(v0 + 896), "mainBundle");
    v74._object = (void *)0x8000000100018730;
    v39._countAndFlagsBits = v36;
    v39._object = v37;
    v40.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v40.value._object = (void *)0xEB00000000656C62;
    v41._countAndFlagsBits = 0;
    v41._object = (void *)0xE000000000000000;
    v74._countAndFlagsBits = 0xD000000000000018;
    v42 = NSLocalizedString(_:tableName:bundle:value:comment:)(v39, v40, (NSBundle)v38, v41, v74);
    object = v42._object;

    v21 = swift_allocObject(v34, 112, 7);
    *(_OWORD *)(v21 + 16) = xmmword_100017C50;
    *(_QWORD *)(v21 + 56) = &type metadata for String;
    *(_QWORD *)(v21 + 64) = v33;
    *(_QWORD *)(v21 + 32) = v32;
    *(_QWORD *)(v21 + 40) = v8;
    *(_QWORD *)(v21 + 96) = &type metadata for String;
    *(_QWORD *)(v21 + 104) = v33;
    *(_QWORD *)(v21 + 72) = v4;
    *(_QWORD *)(v21 + 80) = v6;
    countAndFlagsBits = v42._countAndFlagsBits;
  }
  String.init(format:_:)(countAndFlagsBits, object, v21);
  v44 = v43;
  swift_bridgeObjectRelease(object);
  v45 = String._bridgeToObjectiveC()();
  v46 = *(void **)(v0 + 856);
  swift_bridgeObjectRelease(v44);
  objc_msgSend(v46, "setBody:", v45);

  v47 = Logger.logObject.getter(v46);
  v48 = static os_log_type_t.default.getter();
  v49 = os_log_type_enabled(v47, v48);
  v50 = *(void **)(v0 + 856);
  if (v49)
  {
    v51 = (uint8_t *)swift_slowAlloc(12, -1);
    v52 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v51 = 138412290;
    *(_QWORD *)(v0 + 736) = v50;
    v53 = v50;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 736, v0 + 744);
    *v52 = v50;

    _os_log_impl((void *)&_mh_execute_header, v47, v48, "NotifyWhenFoundNotificationService: Content after updating with location data: %@.", v51, 0xCu);
    v54 = sub_10000A5A0(&qword_100021038);
    swift_arrayDestroy(v52, 1, v54);
    swift_slowDealloc(v52, -1, -1);
    swift_slowDealloc(v51, -1, -1);
    v55 = *(NSObject **)(v0 + 856);
  }
  else
  {

    v55 = *(NSObject **)(v0 + 856);
    v47 = v55;
  }
  v56 = *(void **)(v0 + 1008);
  v57 = *(_QWORD *)(v0 + 944);
  v58 = *(void **)(v0 + 936);
  v59 = *(void **)(v0 + 928);
  v70 = *(_QWORD *)(v0 + 840);
  v71 = *(void (**)(uint64_t, uint64_t))(v0 + 976);
  v60 = *(_QWORD *)(v0 + 800);
  v61 = *(_QWORD *)(v0 + 784);

  v62 = *(void **)(v61 + 96);
  *(_QWORD *)(v61 + 96) = v55;
  v63 = v55;

  v64 = *(id *)(v61 + 96);
  sub_1000075B8(v64, v59, v57);

  swift_release(v57);
  v71(v70, v60);
LABEL_13:
  v65 = *(_QWORD *)(v0 + 832);
  v66 = *(_QWORD *)(v0 + 824);
  v67 = *(_QWORD *)(v0 + 816);
  v68 = *(_QWORD *)(v0 + 792);
  swift_task_dealloc(*(_QWORD *)(v0 + 840));
  swift_task_dealloc(v65);
  swift_task_dealloc(v66);
  swift_task_dealloc(v67);
  swift_task_dealloc(v68);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_100006CE8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t result;
  int64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD v29[2];
  _OWORD v30[2];
  __int128 v31;
  _OWORD v32[2];
  _OWORD v33[2];
  _OWORD v34[2];
  _OWORD v35[2];
  uint64_t v36;
  _OWORD v37[2];
  _OWORD v38[2];
  uint64_t v39;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_10000A5A0(&qword_1000210C0);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v26 = a1 + 64;
  v4 = -1;
  v5 = -1 << *(_BYTE *)(a1 + 32);
  if (-v5 < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & *(_QWORD *)(a1 + 64);
  v25 = (unint64_t)(63 - v5) >> 6;
  result = swift_bridgeObjectRetain(a1);
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v11 = (v6 - 1) & v6;
      v12 = __clz(__rbit64(v6)) | (v8 << 6);
      v13 = v8;
    }
    else
    {
      v14 = v8 + 1;
      if (__OFADD__(v8, 1))
        goto LABEL_37;
      if (v14 >= v25)
      {
LABEL_33:
        sub_10000B8A0(a1);
        return (unint64_t)v3;
      }
      v15 = *(_QWORD *)(v26 + 8 * v14);
      v13 = v8 + 1;
      if (!v15)
      {
        v13 = v8 + 2;
        if (v8 + 2 >= v25)
          goto LABEL_33;
        v15 = *(_QWORD *)(v26 + 8 * v13);
        if (!v15)
        {
          v13 = v8 + 3;
          if (v8 + 3 >= v25)
            goto LABEL_33;
          v15 = *(_QWORD *)(v26 + 8 * v13);
          if (!v15)
          {
            v13 = v8 + 4;
            if (v8 + 4 >= v25)
              goto LABEL_33;
            v15 = *(_QWORD *)(v26 + 8 * v13);
            if (!v15)
            {
              v16 = v8 + 5;
              if (v8 + 5 >= v25)
                goto LABEL_33;
              v15 = *(_QWORD *)(v26 + 8 * v16);
              if (!v15)
              {
                while (1)
                {
                  v13 = v16 + 1;
                  if (__OFADD__(v16, 1))
                    goto LABEL_38;
                  if (v13 >= v25)
                    goto LABEL_33;
                  v15 = *(_QWORD *)(v26 + 8 * v13);
                  ++v16;
                  if (v15)
                    goto LABEL_26;
                }
              }
              v13 = v8 + 5;
            }
          }
        }
      }
LABEL_26:
      v11 = (v15 - 1) & v15;
      v12 = __clz(__rbit64(v15)) + (v13 << 6);
    }
    sub_10000B828(*(_QWORD *)(a1 + 48) + 40 * v12, (uint64_t)v37);
    sub_10000B864(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v38 + 8);
    v35[0] = v38[0];
    v35[1] = v38[1];
    v36 = v39;
    v34[0] = v37[0];
    v34[1] = v37[1];
    sub_10000B828((uint64_t)v34, (uint64_t)v29);
    if (!swift_dynamicCast(&v27, v29, &type metadata for AnyHashable, &type metadata for String, 6))
    {
      v27 = 0;
      v28 = 0;
      sub_10000B9A4((uint64_t)v34, &qword_1000210C8);
      swift_bridgeObjectRelease(v28);
      sub_10000B8A0(a1);
      swift_release(v3);
      return 0;
    }
    v17 = v27;
    v18 = v28;
    sub_10000B864((uint64_t)v35 + 8, (uint64_t)v29);
    sub_10000B9A4((uint64_t)v34, &qword_1000210C8);
    sub_10000B724(v29, v30);
    *(_QWORD *)&v31 = v17;
    *((_QWORD *)&v31 + 1) = v18;
    sub_10000B724(v30, v32);
    v19 = v31;
    sub_10000B724(v32, v33);
    sub_10000B724(v33, &v31);
    result = sub_100015BBC(v19, *((uint64_t *)&v19 + 1));
    v20 = result;
    if ((v21 & 1) != 0)
    {
      v9 = v3[6] + 16 * result;
      swift_bridgeObjectRelease(*(_QWORD *)(v9 + 8));
      *(_OWORD *)v9 = v19;
      v10 = (_QWORD *)(v3[7] + 32 * v20);
      sub_10000B8A8(v10);
      result = (unint64_t)sub_10000B724(&v31, v10);
      goto LABEL_8;
    }
    if (v3[2] >= v3[3])
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v3[6] + 16 * result) = v19;
    result = (unint64_t)sub_10000B724(&v31, (_OWORD *)(v3[7] + 32 * result));
    v22 = v3[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_36;
    v3[2] = v24;
LABEL_8:
    v8 = v13;
    v6 = v11;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_1000070B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  Class isa;
  id v6;
  id v7;
  __objc2_class_ro *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  _OWORD v44[10];
  uint64_t v45;

  v2 = v1;
  v4 = (void *)objc_opt_self(NSJSONSerialization);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)&v44[0] = 0;
  v6 = objc_msgSend(v4, "dataWithJSONObject:options:error:", isa, 0, v44);

  v7 = *(id *)&v44[0];
  v8 = &NotifyWhenFoundNotificationService;
  if (v6)
  {
    v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v11 = v10;

    v12 = type metadata accessor for JSONDecoder(0);
    swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
    v13 = JSONDecoder.init()();
    v14 = sub_10000B7A0();
    dispatch thunk of JSONDecoder.decode<A>(_:from:)(v44, &type metadata for PushPayload, v9, v11, &type metadata for PushPayload, v14);
    if (!v1)
    {
      sub_10000B7E4(v9, v11);
      result = swift_release(v13);
      v28 = v44[9];
      *(_OWORD *)(a1 + 128) = v44[8];
      *(_OWORD *)(a1 + 144) = v28;
      *(_QWORD *)(a1 + 160) = v45;
      v29 = v44[5];
      *(_OWORD *)(a1 + 64) = v44[4];
      *(_OWORD *)(a1 + 80) = v29;
      v30 = v44[7];
      *(_OWORD *)(a1 + 96) = v44[6];
      *(_OWORD *)(a1 + 112) = v30;
      v31 = v44[1];
      *(_OWORD *)a1 = v44[0];
      *(_OWORD *)(a1 + 16) = v31;
      v32 = v44[3];
      *(_OWORD *)(a1 + 32) = v44[2];
      *(_OWORD *)(a1 + 48) = v32;
      return result;
    }
    swift_release(v13);
    if (qword_100020E98 != -1)
      swift_once(&qword_100020E98, sub_100012644);
    v15 = type metadata accessor for Logger(0);
    sub_10000A5E0(v15, (uint64_t)qword_100021FA8);
    swift_errorRetain(v1);
    v16 = swift_errorRetain(v1);
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(12, -1);
      v20 = swift_slowAlloc(32, -1);
      v43 = v1;
      *(_QWORD *)&v44[0] = v20;
      *(_DWORD *)v19 = 136315138;
      swift_errorRetain(v1);
      v21 = sub_10000A5A0(&qword_1000210A0);
      v22 = String.init<A>(describing:)(&v43, v21);
      v24 = v23;
      v43 = sub_100015420(v22, v23, (uint64_t *)v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, v44);
      swift_bridgeObjectRelease(v24);
      swift_errorRelease(v1);
      swift_errorRelease(v1);
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Excption decoding data - %s", v19, 0xCu);
      swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
      v25 = v20;
      v8 = &NotifyWhenFoundNotificationService;
      swift_slowDealloc(v25, -1, -1);
      swift_slowDealloc(v19, -1, -1);
    }
    else
    {
      swift_errorRelease(v1);
      swift_errorRelease(v1);
    }

    swift_willThrow();
    sub_10000B7E4(v9, v11);
  }
  else
  {
    v26 = v7;
    v2 = _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  swift_errorRetain(v2);
  if (v8[51].base_props != (__objc2_prop_list *)-1)
    swift_once(&qword_100020E98, sub_100012644);
  v33 = type metadata accessor for Logger(0);
  sub_10000A5E0(v33, (uint64_t)qword_100021FA8);
  swift_errorRetain(v2);
  v34 = swift_errorRetain(v2);
  v35 = Logger.logObject.getter(v34);
  v36 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc(12, -1);
    v38 = swift_slowAlloc(32, -1);
    v43 = v2;
    *(_QWORD *)&v44[0] = v38;
    *(_DWORD *)v37 = 136315138;
    swift_errorRetain(v2);
    v39 = sub_10000A5A0(&qword_1000210A0);
    v40 = String.init<A>(describing:)(&v43, v39);
    v42 = v41;
    v43 = sub_100015420(v40, v41, (uint64_t *)v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, v44);
    swift_bridgeObjectRelease(v42);
    swift_errorRelease(v2);
    swift_errorRelease(v2);
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "Excption serializing data - %s", v37, 0xCu);
    swift_arrayDestroy(v38, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v38, -1, -1);
    swift_slowDealloc(v37, -1, -1);
  }
  else
  {
    swift_errorRelease(v2);
    swift_errorRelease(v2);
  }

  swift_willThrow();
  return swift_errorRelease(v2);
}

void sub_1000075B8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  __objc2_class_ro *v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  void *v27;
  id v28;
  Class isa;
  id v30;
  uint64_t Strong;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  _QWORD v39[2];
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t aBlock[5];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v43 = a1;
  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3 + 16;
  if (qword_100020E98 != -1)
    swift_once(&qword_100020E98, sub_100012644);
  v44 = v6;
  v10 = type metadata accessor for Logger(0);
  sub_10000A5E0(v10, (uint64_t)qword_100021FA8);
  v11 = a2;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  v14 = &NotifyWhenFoundNotificationService;
  if (os_log_type_enabled(v12, v13))
  {
    v15 = (uint8_t *)swift_slowAlloc(12, -1);
    v41 = swift_slowAlloc(32, -1);
    aBlock[0] = v41;
    v42 = a3;
    *(_DWORD *)v15 = 136315138;
    v39[1] = v15 + 4;
    v40 = v15;
    v16 = objc_msgSend(v11, "identifier");
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    v17 = sub_10000A73C(&qword_100021068, (uint64_t)&protocol conformance descriptor for UUID);
    v18 = dispatch thunk of CustomStringConvertible.description.getter(v5, v17);
    v19 = a3 + 16;
    v21 = v20;
    v22 = v44;
    (*(void (**)(char *, uint64_t))(v44 + 8))(v8, v5);
    v47 = sub_100015420(v18, v21, aBlock);
    a3 = v42;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v47, &v48);
    v23 = v21;
    v9 = v19;
    v14 = &NotifyWhenFoundNotificationService;
    swift_bridgeObjectRelease(v23);

    v24 = v13;
    v25 = v40;
    _os_log_impl((void *)&_mh_execute_header, v12, v24, "NotifyWhenFoundNotificationService: Disabling NWF on beacon: %s", v40, 0xCu);
    v26 = v41;
    swift_arrayDestroy(v41, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1, -1);
    swift_slowDealloc(v25, -1, -1);

  }
  else
  {

    v22 = v44;
  }
  v27 = (void *)objc_opt_self(SPCommand);
  v28 = objc_msgSend(v11, *(SEL *)&v14[38].ivar_base_size);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v5);
  v30 = objc_msgSend(v27, "disableNotifyWhenFound:", isa);

  swift_beginAccess(v9, &v47, 0, 0);
  Strong = swift_weakLoadStrong(v9);
  if (Strong)
  {
    v32 = Strong;
    v33 = *(id *)(Strong + 80);
    swift_release(v32);
    v34 = swift_allocObject(&unk_10001CC28, 32, 7);
    v35 = v43;
    *(_QWORD *)(v34 + 16) = v43;
    *(_QWORD *)(v34 + 24) = a3;
    aBlock[4] = (uint64_t)sub_10000B798;
    v46 = v34;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100007DA0;
    aBlock[3] = (uint64_t)&unk_10001CC40;
    v36 = _Block_copy(aBlock);
    v37 = v46;
    v38 = v35;
    swift_retain(a3);
    swift_release(v37);
    objc_msgSend(v33, "executeCommand:completion:", v30, v36);

    _Block_release(v36);
    v30 = v33;
  }

}

uint64_t sub_100007974(uint64_t a1, void *a2, uint64_t a3)
{
  __objc2_class_ro *v5;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  NSObject **v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  void (*v33);
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;

  v5 = &NotifyWhenFoundNotificationService;
  if (a1)
  {
    ((void (*)(void))swift_errorRetain)();
    if (qword_100020E98 != -1)
      swift_once(&qword_100020E98, sub_100012644);
    v7 = type metadata accessor for Logger(0);
    sub_10000A5E0(v7, (uint64_t)qword_100021FA8);
    swift_errorRetain(a1);
    v8 = swift_errorRetain(a1);
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(12, -1);
      v12 = swift_slowAlloc(32, -1);
      v34 = a1;
      v35 = v12;
      *(_DWORD *)v11 = 136315138;
      swift_errorRetain(a1);
      v13 = sub_10000A5A0(&qword_1000210A0);
      v14 = String.init<A>(describing:)(&v34, v13);
      v16 = v15;
      v34 = sub_100015420(v14, v15, (uint64_t *)&v35);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35);
      swift_bridgeObjectRelease(v16);
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "NotifyWhenFoundNotificationService: Disabling NWF completed with error - %s", v11, 0xCu);
      swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
      v17 = v12;
      v5 = &NotifyWhenFoundNotificationService;
      swift_slowDealloc(v17, -1, -1);
      swift_slowDealloc(v11, -1, -1);

      swift_errorRelease(a1);
      goto LABEL_12;
    }
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }
  else
  {
    if (qword_100020E98 != -1)
      swift_once(&qword_100020E98, sub_100012644);
    v18 = type metadata accessor for Logger(0);
    sub_10000A5E0(v18, (uint64_t)qword_100021FA8);
    v9 = ((uint64_t (*)(void))Logger.logObject.getter)();
    v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v19, "NotifyWhenFoundNotificationService: Disabling NWF completed successfully", v20, 2u);
      swift_slowDealloc(v20, -1, -1);
    }
  }

LABEL_12:
  v21 = a3 + 16;
  if (v5[51].base_props != (__objc2_prop_list *)-1)
    swift_once(&qword_100020E98, sub_100012644);
  v22 = type metadata accessor for Logger(0);
  sub_10000A5E0(v22, (uint64_t)qword_100021FA8);
  v23 = a2;
  v24 = Logger.logObject.getter(v23);
  v25 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc(12, -1);
    v27 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v26 = 138412290;
    v35 = v23;
    v28 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36);
    *v27 = v23;

    _os_log_impl((void *)&_mh_execute_header, v24, v25, "NotifyWhenFoundNotificationService: Showing final alert: %@", v26, 0xCu);
    v29 = sub_10000A5A0(&qword_100021038);
    swift_arrayDestroy(v27, 1, v29);
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v26, -1, -1);
  }
  else
  {

    v24 = v23;
  }

  swift_beginAccess(v21, &v35, 0, 0);
  result = swift_weakLoadStrong(v21);
  if (result)
  {
    v31 = result;
    v33 = *(void (**))(result + 112);
    v32 = *(_QWORD *)(result + 120);
    swift_retain(v32);
    swift_release(v31);
    v33(v23);
    return swift_release(v32);
  }
  return result;
}

void sub_100007DA0(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void *);
  id v5;

  v4 = *(void (**)(void *))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4(a2);
  swift_release(v3);

}

uint64_t sub_100007DF4(uint64_t a1, char a2)
{
  **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t sub_100007E08(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2[24] = a1;
  v2[25] = v1;
  v3 = type metadata accessor for UUID(0);
  v2[26] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[27] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[28] = swift_task_alloc(v5);
  v2[29] = swift_task_alloc(v5);
  v2[30] = swift_task_alloc(v5);
  v2[31] = swift_task_alloc(v5);
  v2[32] = swift_task_alloc(v5);
  return swift_task_switch(sub_100007E9C, 0, 0);
}

uint64_t sub_100007E9C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  _QWORD *v20;
  void *v21;
  id v22;
  Class isa;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v27;
  uint64_t v28;

  if (qword_100020E98 != -1)
    swift_once(&qword_100020E98, sub_100012644);
  v1 = v0[24];
  v2 = v0[32];
  v3 = v0[26];
  v4 = v0[27];
  v5 = type metadata accessor for Logger(0);
  v0[33] = sub_10000A5E0(v5, (uint64_t)qword_100021FA8);
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[34] = v6;
  v7 = v6(v2, v1, v3);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  v10 = os_log_type_enabled(v8, v9);
  v11 = v0[32];
  v12 = v0[26];
  v13 = v0[27];
  if (v10)
  {
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v27 = swift_slowAlloc(32, -1);
    v28 = v27;
    *(_DWORD *)v14 = 136315138;
    v15 = sub_10000A73C(&qword_100021068, (uint64_t)&protocol conformance descriptor for UUID);
    v16 = dispatch thunk of CustomStringConvertible.description.getter(v12, v15);
    v18 = v17;
    v0[23] = sub_100015420(v16, v17, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 23, v0 + 24);
    swift_bridgeObjectRelease(v18);
    v19 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v19(v11, v12);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "NotifyWhenFoundNotificationService: Looking for beacon matching subscription: %s", v14, 0xCu);
    swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v14, -1, -1);
  }
  else
  {
    v19 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v19(v11, v12);
  }

  v20 = v0 + 2;
  v0[35] = v19;
  v21 = *(void **)(v0[25] + 88);
  v0[36] = v21;
  v22 = v21;
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v0[37] = isa;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_100008124;
  v24 = swift_continuation_init(v0 + 2, 0);
  v0[10] = _NSConcreteStackBlock;
  v25 = v0 + 10;
  v25[1] = 0x40000000;
  v25[2] = sub_100008894;
  v25[3] = &unk_10001CBA8;
  v25[4] = v24;
  objc_msgSend(v22, "notificationBeaconForSubscriptionId:completion:", isa, v25);
  return swift_continuation_await(v20);
}

uint64_t sub_100008124()
{
  return swift_task_switch(sub_100008170, 0, 0);
}

uint64_t sub_100008170()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void (*v4)(_QWORD, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  BOOL v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  _BOOL4 v51;
  void (*v52)(uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  os_log_t v75;
  NSObject *v76;
  NSObject *log;
  os_log_t loga;
  os_log_type_t type;
  os_log_type_t typea;
  void (*v81)(uint64_t, uint64_t);
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  os_log_t v87;

  v1 = *(void **)(v0 + 296);
  v2 = *(void **)(v0 + 120);
  v3 = *(void **)(v0 + 128);

  v4 = *(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 272);
  v5 = *(_QWORD *)(v0 + 208);
  v6 = *(_QWORD *)(v0 + 192);
  if (v2)
  {
    v4(*(_QWORD *)(v0 + 248), v6, v5);
    v7 = v2;
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.default.getter();
    v10 = os_log_type_enabled(v8, v9);
    v11 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v12 = *(_QWORD *)(v0 + 248);
    if (v10)
    {
      type = v9;
      v13 = *(_QWORD *)(v0 + 240);
      log = v8;
      v14 = *(_QWORD *)(v0 + 208);
      v85 = v2;
      v15 = swift_slowAlloc(32, -1);
      v75 = (os_log_t)swift_slowAlloc(96, -1);
      v87 = v75;
      *(_DWORD *)v15 = 136315650;
      v16 = v11;
      v17 = objc_msgSend(v7, "identifier");
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      v73 = sub_10000A73C(&qword_100021068, (uint64_t)&protocol conformance descriptor for UUID);
      v70 = v14;
      v71 = v12;
      v18 = dispatch thunk of CustomStringConvertible.description.getter(v14, v73);
      v82 = v3;
      v20 = v19;
      v16(v13, v14);
      *(_QWORD *)(v0 + 160) = sub_100015420(v18, v20, (uint64_t *)&v87);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 160, v0 + 168);
      swift_bridgeObjectRelease(v20);

      *(_WORD *)(v15 + 12) = 2080;
      v21 = objc_msgSend(v7, "type");
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
      v24 = v23;

      *(_QWORD *)(v0 + 168) = sub_100015420(v22, v24, (uint64_t *)&v87);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 168, v0 + 176);
      v25 = v24;
      v3 = v82;
      swift_bridgeObjectRelease(v25);

      *(_WORD *)(v15 + 22) = 2080;
      v26 = dispatch thunk of CustomStringConvertible.description.getter(v70, v73);
      v28 = v27;
      *(_QWORD *)(v0 + 176) = sub_100015420(v26, v27, (uint64_t *)&v87);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 176, v0 + 184);
      swift_bridgeObjectRelease(v28);
      v16(v71, v70);
      _os_log_impl((void *)&_mh_execute_header, log, type, "NotifyWhenFoundNotificationService: Found beacon %s of type %s for subscription: %s", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy(v75, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v75, -1, -1);
      v29 = v15;
      v2 = v85;
      swift_slowDealloc(v29, -1, -1);

      if (v82)
        goto LABEL_4;
    }
    else
    {
      v62 = *(_QWORD *)(v0 + 208);

      v11(v12, v62);
      if (v3)
      {
LABEL_4:
        (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 272))(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 208));
        v30 = v3;
        v31 = Logger.logObject.getter(v30);
        v32 = static os_log_type_t.default.getter();
        v33 = os_log_type_enabled(v31, v32);
        v34 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
        if (v33)
        {
          typea = v32;
          v35 = *(_QWORD *)(v0 + 240);
          v74 = *(_QWORD *)(v0 + 232);
          v83 = v3;
          v36 = v30;
          v72 = v30;
          v37 = *(_QWORD *)(v0 + 208);
          v76 = v31;
          v38 = swift_slowAlloc(22, -1);
          loga = (os_log_t)swift_slowAlloc(64, -1);
          v87 = loga;
          *(_DWORD *)v38 = 136315394;
          v86 = v2;
          v39 = objc_msgSend(v36, "identifier");
          static UUID._unconditionallyBridgeFromObjectiveC(_:)();

          v40 = sub_10000A73C(&qword_100021068, (uint64_t)&protocol conformance descriptor for UUID);
          v41 = dispatch thunk of CustomStringConvertible.description.getter(v37, v40);
          v43 = v42;
          v34(v35, v37);
          *(_QWORD *)(v0 + 144) = sub_100015420(v41, v43, (uint64_t *)&v87);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 144, v0 + 152);
          swift_bridgeObjectRelease(v43);

          *(_WORD *)(v38 + 12) = 2080;
          v44 = v40;
          v2 = v86;
          v45 = dispatch thunk of CustomStringConvertible.description.getter(v37, v44);
          v47 = v46;
          *(_QWORD *)(v0 + 152) = sub_100015420(v45, v46, (uint64_t *)&v87);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 152, v0 + 160);
          swift_bridgeObjectRelease(v47);
          v3 = v83;
          v34(v74, v37);
          _os_log_impl((void *)&_mh_execute_header, v76, typea, "NotifyWhenFoundNotificationService: Found beacon group %s for subscription: %s", (uint8_t *)v38, 0x16u);
          swift_arrayDestroy(loga, 2, (char *)&type metadata for Any + 8);
          swift_slowDealloc(loga, -1, -1);
          swift_slowDealloc(v38, -1, -1);

        }
        else
        {
          v63 = *(_QWORD *)(v0 + 232);
          v64 = *(_QWORD *)(v0 + 208);

          v34(v63, v64);
        }
        goto LABEL_13;
      }
    }

    goto LABEL_13;
  }
  v48 = ((uint64_t (*)(_QWORD, uint64_t, uint64_t))v4)(*(_QWORD *)(v0 + 224), v6, v5);
  v49 = Logger.logObject.getter(v48);
  v50 = static os_log_type_t.error.getter();
  v51 = os_log_type_enabled(v49, v50);
  v52 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
  v53 = *(_QWORD *)(v0 + 224);
  v54 = *(_QWORD *)(v0 + 208);
  if (v51)
  {
    v81 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v84 = v3;
    v55 = (uint8_t *)swift_slowAlloc(12, -1);
    v87 = (os_log_t)swift_slowAlloc(32, -1);
    v56 = (uint64_t)v87;
    *(_DWORD *)v55 = 136315138;
    v57 = sub_10000A73C(&qword_100021068, (uint64_t)&protocol conformance descriptor for UUID);
    v58 = dispatch thunk of CustomStringConvertible.description.getter(v54, v57);
    v60 = v59;
    *(_QWORD *)(v0 + 136) = sub_100015420(v58, v59, (uint64_t *)&v87);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 136, v0 + 144);
    swift_bridgeObjectRelease(v60);
    v81(v53, v54);
    _os_log_impl((void *)&_mh_execute_header, v49, v50, "NotifyWhenFoundNotificationService: No beacon found for subscription uuid - %s.", v55, 0xCu);
    swift_arrayDestroy(v56, 1, (char *)&type metadata for Any + 8);
    v61 = v56;
    v2 = 0;
    swift_slowDealloc(v61, -1, -1);
    swift_slowDealloc(v55, -1, -1);

  }
  else
  {

    v52(v53, v54);
  }
  v3 = 0;
LABEL_13:
  v65 = *(_QWORD *)(v0 + 248);
  v67 = *(_QWORD *)(v0 + 232);
  v66 = *(_QWORD *)(v0 + 240);
  v68 = *(_QWORD *)(v0 + 224);
  swift_task_dealloc(*(_QWORD *)(v0 + 256));
  swift_task_dealloc(v65);
  swift_task_dealloc(v66);
  swift_task_dealloc(v67);
  swift_task_dealloc(v68);
  return (*(uint64_t (**)(void *, void *))(v0 + 8))(v2, v3);
}

uint64_t sub_100008894(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  _QWORD *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD **)(*(_QWORD *)(v4 + 64) + 40);
  *v5 = a2;
  v5[1] = a3;
  v6 = a2;
  v7 = a3;
  return swift_continuation_resume(v4);
}

uint64_t sub_1000088CC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[22] = a1;
  v2[23] = v1;
  v3 = type metadata accessor for Date(0);
  v2[24] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[25] = v4;
  v2[26] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for UUID(0);
  v2[27] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[28] = v6;
  v2[29] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100008954, 0, 0);
}

uint64_t sub_100008954()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  Class isa;
  uint64_t v10;
  uint64_t v12;

  v1 = v0;
  v2 = v0 + 2;
  v3 = (void *)v1[22];
  v4 = *(void **)(v1[23] + 80);
  v1[30] = v4;
  v5 = sub_10000A5A0(&qword_100021020);
  v6 = swift_allocObject(v5, 40, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100017C60;
  *(_QWORD *)(v6 + 32) = v3;
  v12 = v6;
  specialized Array._endMutation()();
  sub_10000B734(0, &qword_100021028, SPBeacon_ptr);
  v7 = v4;
  v8 = v3;
  isa = Array._bridgeToObjectiveC()().super.isa;
  v1[31] = isa;
  swift_bridgeObjectRelease(v12);
  v1[7] = v1 + 15;
  v1[2] = v1;
  v1[3] = sub_100008A8C;
  v10 = swift_continuation_init(v2, 0);
  v1[10] = _NSConcreteStackBlock;
  v1 += 10;
  v1[1] = 0x40000000;
  v1[2] = sub_1000093C0;
  v1[3] = &unk_10001CAF0;
  v1[4] = v10;
  objc_msgSend(v7, "locationsForBeacons:completion:", isa, v1);
  return swift_continuation_await(v2);
}

uint64_t sub_100008A8C()
{
  return swift_task_switch(sub_100008AD8, 0, 0);
}

uint64_t sub_100008AD8()
{
  uint64_t v0;
  void **v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  id v24;
  Class isa;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  _BOOL4 v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  _BOOL4 v55;
  void *v56;
  uint8_t *v57;
  uint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  _QWORD *v66;
  os_log_type_t type;
  uint64_t v68;
  void *v69;
  uint64_t v70;

  v1 = (void **)(v0 + 176);
  v2 = *(void **)(v0 + 176);
  v3 = *(void **)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 120);

  v5 = objc_msgSend(v2, "identifier");
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  if (*(_QWORD *)(v4 + 16) && (v6 = sub_100015B20(*(_QWORD *)(v0 + 232)), (v7 & 1) != 0))
  {
    v9 = *(_QWORD *)(v0 + 224);
    v8 = *(_QWORD *)(v0 + 232);
    v10 = *(_QWORD *)(v0 + 208);
    v11 = *(_QWORD *)(v0 + 216);
    v12 = *(_QWORD *)(v0 + 192);
    v13 = *(_QWORD *)(v0 + 200);
    v14 = *(void **)(*(_QWORD *)(v4 + 56) + 8 * v6);
    *(_QWORD *)(v0 + 256) = v14;
    v15 = v14;
    swift_bridgeObjectRelease(v4);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v11);
    v16 = v15;
    objc_msgSend(v16, "latitude");
    v18 = v17;
    objc_msgSend(v16, "longitude");
    v20 = v19;
    v21 = objc_allocWithZone((Class)CLLocation);
    objc_msgSend(v16, "horizontalAccuracy");
    v23 = v22;
    v24 = objc_msgSend(v16, "timestamp");
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v10, v12);
    v26 = objc_msgSend(v21, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", isa, v18, v20, -1.0, v23, -1.0);
    *(_QWORD *)(v0 + 264) = v26;

    if (qword_100020E98 != -1)
      swift_once(&qword_100020E98, sub_100012644);
    v27 = *(void **)(v0 + 176);
    v28 = type metadata accessor for Logger(0);
    *(_QWORD *)(v0 + 272) = sub_10000A5E0(v28, (uint64_t)qword_100021FA8);
    v29 = v27;
    v30 = v26;
    v31 = v29;
    v32 = v30;
    v33 = Logger.logObject.getter(v32);
    v34 = static os_log_type_t.default.getter();
    v35 = os_log_type_enabled(v33, v34);
    v36 = *(void **)(v0 + 176);
    if (v35)
    {
      v37 = swift_slowAlloc(22, -1);
      v68 = swift_slowAlloc(64, -1);
      v70 = v68;
      *(_DWORD *)v37 = 136315394;
      v69 = v32;
      v38 = v36;
      v39 = objc_msgSend(v38, "description");
      v40 = static String._unconditionallyBridgeFromObjectiveC(_:)(v39);
      type = v34;
      v42 = v41;

      *(_QWORD *)(v0 + 160) = sub_100015420(v40, v42, &v70);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 160, v0 + 168);
      swift_bridgeObjectRelease(v42);

      v32 = v69;
      *(_WORD *)(v37 + 12) = 2080;
      v43 = v69;
      v44 = objc_msgSend(v43, "description");
      v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(v44);
      v47 = v46;

      *(_QWORD *)(v0 + 168) = sub_100015420(v45, v47, &v70);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 168, v0 + 176);
      swift_bridgeObjectRelease(v47);

      _os_log_impl((void *)&_mh_execute_header, v33, type, "NotifyWhenFoundNotificationService: Latest unshifted location for %s is %s.", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy(v68, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v68, -1, -1);
      swift_slowDealloc(v37, -1, -1);
    }
    else
    {

    }
    v66 = (_QWORD *)swift_task_alloc(dword_100021034);
    *(_QWORD *)(v0 + 280) = v66;
    *v66 = v0;
    v66[1] = sub_1000090EC;
    v66[6] = v32;
    return swift_task_switch(sub_100009460, 0, 0);
  }
  else
  {
    v49 = *(_QWORD *)(v0 + 224);
    v48 = *(_QWORD *)(v0 + 232);
    v50 = *(_QWORD *)(v0 + 216);
    swift_bridgeObjectRelease(v4);
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v50);
    if (qword_100020E98 != -1)
      swift_once(&qword_100020E98, sub_100012644);
    v51 = *v1;
    v52 = type metadata accessor for Logger(0);
    sub_10000A5E0(v52, (uint64_t)qword_100021FA8);
    v53 = Logger.logObject.getter(v51);
    v54 = static os_log_type_t.error.getter();
    v55 = os_log_type_enabled(v53, v54);
    v56 = *v1;
    if (v55)
    {
      v57 = (uint8_t *)swift_slowAlloc(12, -1);
      v58 = swift_slowAlloc(32, -1);
      v70 = v58;
      *(_DWORD *)v57 = 136315138;
      v59 = v56;
      v60 = objc_msgSend(v59, "description");
      v61 = static String._unconditionallyBridgeFromObjectiveC(_:)(v60);
      v63 = v62;

      *(_QWORD *)(v0 + 128) = sub_100015420(v61, v63, &v70);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 128, v0 + 136);
      swift_bridgeObjectRelease(v63);

      _os_log_impl((void *)&_mh_execute_header, v53, v54, "NotifyWhenFoundNotificationService: Unable to fetch latest location for %s.", v57, 0xCu);
      swift_arrayDestroy(v58, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v58, -1, -1);
      swift_slowDealloc(v57, -1, -1);
    }
    else
    {

    }
    v64 = *(_QWORD *)(v0 + 208);
    swift_task_dealloc(*(_QWORD *)(v0 + 232));
    swift_task_dealloc(v64);
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_1000090EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 280);
  *(_QWORD *)(*(_QWORD *)v1 + 288) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100009148, 0, 0);
}

uint64_t sub_100009148()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;

  v1 = *(void **)(v0 + 176);
  v2 = *(id *)(v0 + 288);
  v3 = v1;
  v4 = v2;
  v5 = Logger.logObject.getter(v3);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v24 = *(_QWORD *)(v0 + 288);
    v26 = *(void **)(v0 + 264);
    v27 = *(void **)(v0 + 256);
    v7 = *(void **)(v0 + 176);
    v8 = swift_slowAlloc(22, -1);
    v25 = swift_slowAlloc(64, -1);
    v28 = v25;
    *(_DWORD *)v8 = 136315394;
    v9 = v7;
    v10 = objc_msgSend(v9, "description");
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    v13 = v12;

    *(_QWORD *)(v0 + 136) = sub_100015420(v11, v13, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 136, v0 + 144);
    swift_bridgeObjectRelease(v13);

    *(_WORD *)(v8 + 12) = 2080;
    *(_QWORD *)(v0 + 144) = v24;
    v14 = v4;
    v15 = sub_10000A5A0((uint64_t *)&unk_100021330);
    v16 = String.init<A>(describing:)(v0 + 144, v15);
    v18 = v17;
    *(_QWORD *)(v0 + 152) = sub_100015420(v16, v17, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 152, v0 + 160);
    swift_bridgeObjectRelease(v18);

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "NotifyWhenFoundNotificationService: Latest shifted location for %s is %s.", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy(v25, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v25, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {
    v19 = *(void **)(v0 + 264);
    v20 = *(void **)(v0 + 176);

  }
  v21 = *(_QWORD *)(v0 + 288);
  v22 = *(_QWORD *)(v0 + 208);
  swift_task_dealloc(*(_QWORD *)(v0 + 232));
  swift_task_dealloc(v22);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v21);
}

uint64_t sub_1000093C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = type metadata accessor for UUID(0);
  v5 = sub_10000B734(0, &qword_100021058, SPBeaconLocation_ptr);
  v6 = sub_10000A73C(&qword_100021060, (uint64_t)&protocol conformance descriptor for UUID);
  **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a2, v4, v5, v6);
  return swift_continuation_resume(v3);
}

uint64_t sub_100009448()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = v0;
  return swift_task_switch(sub_100009460, 0, 0);
}

uint64_t sub_100009460()
{
  uint64_t v0;
  void *v1;
  id *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unsigned int v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  id v22;
  uint8_t *v23;
  _QWORD *v24;
  id v25;
  uint64_t v26;
  id v27;
  uint8_t *v28;
  _QWORD *v29;
  id v30;
  uint64_t v31;
  double *v32;
  _QWORD *v33;
  uint64_t v34;
  id v36;
  id *v37;
  uint64_t (*v38)(id);

  if (qword_100020E98 != -1)
    swift_once(&qword_100020E98, sub_100012644);
  v2 = (id *)(v0 + 48);
  v1 = *(void **)(v0 + 48);
  v3 = type metadata accessor for Logger(0);
  sub_10000A5E0(v3, (uint64_t)qword_100021FA8);
  v4 = Logger.logObject.getter(v1);
  v5 = static os_log_type_t.default.getter();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(void **)(v0 + 48);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    *(_QWORD *)(v0 + 40) = v7;
    v10 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48);
    *v9 = v7;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "NotifyWhenFoundNotificationService: Shifting Location: %@", v8, 0xCu);
    v11 = sub_10000A5A0(&qword_100021038);
    swift_arrayDestroy(v9, 1, v11);
    v12 = v9;
    v2 = (id *)(v0 + 48);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }
  else
  {

  }
  v13 = *v2;
  objc_msgSend(*v2, "coordinate");
  v15 = v14;
  objc_msgSend(v13, "coordinate");
  v17 = v16;
  v18 = objc_msgSend((id)objc_opt_self(GEOLocationShifter), "isLocationShiftRequiredForCoordinate:", v15, v16);
  v19 = Logger.logObject.getter(v13);
  v20 = static os_log_type_t.default.getter();
  v21 = os_log_type_enabled(v19, v20);
  v22 = *v2;
  if (v18)
  {
    if (v21)
    {
      v23 = (uint8_t *)swift_slowAlloc(12, -1);
      v24 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v23 = 138412290;
      *(_QWORD *)(v0 + 32) = v22;
      v37 = v2;
      v25 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40);
      *v24 = v22;

      _os_log_impl((void *)&_mh_execute_header, v19, v20, "NotifyWhenFoundNotificationService: Location shifting is required for %@.", v23, 0xCu);
      v26 = sub_10000A5A0(&qword_100021038);
      swift_arrayDestroy(v24, 1, v26);
      swift_slowDealloc(v24, -1, -1);
      swift_slowDealloc(v23, -1, -1);
      v27 = *v37;
    }
    else
    {

      v27 = *v2;
      v19 = *v2;
    }

    v32 = (double *)swift_task_alloc(48);
    *(_QWORD *)(v0 + 56) = v32;
    v32[2] = v15;
    v32[3] = v17;
    *((_QWORD *)v32 + 4) = v27;
    v33 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
    *(_QWORD *)(v0 + 64) = v33;
    v34 = sub_10000A5A0((uint64_t *)&unk_100021330);
    *v33 = v0;
    v33[1] = sub_10000991C;
    return withCheckedContinuation<A>(isolation:function:_:)(v0 + 24, 0, 0, 0xD000000000000014, 0x8000000100018660, sub_10000A5F8, v32, v34);
  }
  else
  {
    if (v21)
    {
      v28 = (uint8_t *)swift_slowAlloc(12, -1);
      v29 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v28 = 138412290;
      *(_QWORD *)(v0 + 16) = v22;
      v30 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24);
      *v29 = v22;

      _os_log_impl((void *)&_mh_execute_header, v19, v20, "NotifyWhenFoundNotificationService: Location shifting not required for %@.", v28, 0xCu);
      v31 = sub_10000A5A0(&qword_100021038);
      swift_arrayDestroy(v29, 1, v31);
      swift_slowDealloc(v29, -1, -1);
      swift_slowDealloc(v28, -1, -1);
    }
    else
    {

    }
    v38 = *(uint64_t (**)(id))(v0 + 8);
    v36 = *(id *)(v0 + 48);
    return v38(v22);
  }
}

uint64_t sub_10000991C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 56);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 64));
  swift_task_dealloc(v1);
  return swift_task_switch(sub_100009978, 0, 0);
}

uint64_t sub_100009978()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 24));
}

uint64_t sub_100009984(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v5 = sub_10000A5A0(&qword_1000210A0);
    v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0, 0);
    *v7 = a3;
    v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }
  else
  {
    v11 = sub_10000B734(0, &qword_1000210A8, CLPlacemark_ptr);
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v11);
    return swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_100009A2C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 72));

  swift_release(*(_QWORD *)(v0 + 120));
  return v0;
}

uint64_t sub_100009A88()
{
  uint64_t v0;

  sub_100009A2C();
  return swift_deallocClassInstance(v0, 128, 7);
}

uint64_t type metadata accessor for NotifyWhenFoundNotificationService()
{
  return objc_opt_self(_TtC26FindMyNotificationsService34NotifyWhenFoundNotificationService);
}

id sub_100009AC8()
{
  uint64_t v0;

  return *(id *)(*(_QWORD *)v0 + 96);
}

uint64_t sub_100009AD4()
{
  return sub_10000439C();
}

void sub_100009AF4(uint64_t a1, void *a2, double a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, char *, uint64_t);
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;
  id v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void **aBlock;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;

  v35 = a1;
  v8 = type metadata accessor for DispatchQoS.QoSClass(0);
  v38 = *(_QWORD *)(v8 - 8);
  v39 = v8;
  __chkstk_darwin();
  v37 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10000A5A0(&qword_100021040);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  __chkstk_darwin();
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = objc_msgSend(objc_allocWithZone((Class)GEOLocationShifter), "init");
  objc_msgSend(a2, "horizontalAccuracy");
  v15 = v14;
  v34 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v34(v13, a1, v10);
  v16 = *(unsigned __int8 *)(v11 + 80);
  v17 = (v16 + 24) & ~v16;
  v18 = v17 + v12;
  v19 = v16 | 7;
  v20 = swift_allocObject(&unk_10001CB18, v17 + v12, v16 | 7);
  *(_QWORD *)(v20 + 16) = a2;
  v21 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
  v21(v20 + v17, v13, v10);
  v44 = sub_10000A608;
  v45 = v20;
  aBlock = _NSConcreteStackBlock;
  v41 = 1107296256;
  v42 = sub_10000A194;
  v43 = &unk_10001CB30;
  v22 = _Block_copy(&aBlock);
  v23 = v45;
  v24 = a2;
  swift_release(v23);
  v34(v13, v35, v10);
  v25 = swift_allocObject(&unk_10001CB68, v18, v19);
  *(_QWORD *)(v25 + 16) = v24;
  v21(v25 + v17, v13, v10);
  v44 = sub_10000A6F8;
  v45 = v25;
  aBlock = _NSConcreteStackBlock;
  v41 = 1107296256;
  v42 = sub_100007DA0;
  v43 = &unk_10001CB80;
  v26 = _Block_copy(&aBlock);
  v27 = v45;
  v28 = v24;
  swift_release(v27);
  sub_10000B734(0, &qword_100021048, OS_dispatch_queue_ptr);
  v30 = v37;
  v29 = v38;
  v31 = v39;
  (*(void (**)(char *, _QWORD, uint64_t))(v38 + 104))(v37, enum case for DispatchQoS.QoSClass.default(_:), v39);
  v32 = (void *)static OS_dispatch_queue.global(qos:)(v30);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  v33 = v36;
  objc_msgSend(v36, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v22, 0, v26, v32, a3, a4, v15);

  _Block_release(v26);
  _Block_release(v22);

}

uint64_t sub_100009DE0(void *a1, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;
  Class isa;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  _QWORD v45[2];
  uint64_t v46;
  uint64_t v47;

  v10 = type metadata accessor for Date(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin();
  v13 = (char *)v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, "altitude");
  v15 = v14;
  objc_msgSend(a1, "verticalAccuracy");
  v17 = v16;
  objc_msgSend(a1, "course");
  v19 = v18;
  objc_msgSend(a1, "speed");
  v21 = v20;
  v22 = objc_msgSend(a1, "timestamp");
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v23 = objc_allocWithZone((Class)CLLocation);
  isa = Date._bridgeToObjectiveC()().super.isa;
  v25 = objc_msgSend(v23, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", isa, a3, a4, v15, a5, v17, v19, v21);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (qword_100020E98 != -1)
    swift_once(&qword_100020E98, sub_100012644);
  v26 = type metadata accessor for Logger(0);
  sub_10000A5E0(v26, (uint64_t)qword_100021FA8);
  v27 = a1;
  v28 = v25;
  v29 = v27;
  v30 = v28;
  v31 = Logger.logObject.getter(v30);
  v32 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = swift_slowAlloc(22, -1);
    v34 = swift_slowAlloc(64, -1);
    v47 = v34;
    *(_DWORD *)v33 = 136315394;
    v45[1] = a2;
    v35 = objc_msgSend(v29, "description");
    v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
    v38 = v37;

    v46 = sub_100015420(v36, v38, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47);

    swift_bridgeObjectRelease(v38);
    *(_WORD *)(v33 + 12) = 2080;
    v39 = objc_msgSend(v30, "description");
    v40 = static String._unconditionallyBridgeFromObjectiveC(_:)(v39);
    v42 = v41;

    v46 = sub_100015420(v40, v42, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47);

    swift_bridgeObjectRelease(v42);
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "NotifyWhenFoundNotificationService: Shifted Location from %s to %s", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy(v34, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1, -1);
    swift_slowDealloc(v33, -1, -1);

  }
  else
  {

  }
  v47 = (uint64_t)v30;
  v43 = sub_10000A5A0(&qword_100021040);
  return CheckedContinuation.resume(returning:)(&v47, v43);
}

uint64_t sub_10000A194(uint64_t a1, double a2, double a3, double a4)
{
  void (*v7)(double, double, double);
  uint64_t v8;

  v7 = *(void (**)(double, double, double))(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  swift_retain(v8);
  v7(a2, a3, a4);
  return swift_release(v8);
}

uint64_t sub_10000A1E8(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (qword_100020E98 != -1)
    swift_once(&qword_100020E98, sub_100012644);
  v4 = type metadata accessor for Logger(0);
  sub_10000A5E0(v4, (uint64_t)qword_100021FA8);
  v5 = a2;
  swift_errorRetain(a1);
  v6 = v5;
  v7 = swift_errorRetain(a1);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc(22, -1);
    v11 = (_QWORD *)swift_slowAlloc(8, -1);
    v20 = swift_slowAlloc(32, -1);
    v21 = (uint64_t)v6;
    v22 = v20;
    *(_DWORD *)v10 = 138412546;
    v12 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22);
    *v11 = v6;

    *(_WORD *)(v10 + 12) = 2080;
    v21 = a1;
    swift_errorRetain(a1);
    v13 = sub_10000A5A0(&qword_100021050);
    v14 = String.init<A>(describing:)(&v21, v13);
    v16 = v15;
    v21 = sub_100015420(v14, v15, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22);
    swift_bridgeObjectRelease(v16);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "NotifyWhenFoundNotificationService: Failed to shift location %@ - Error: %s", (uint8_t *)v10, 0x16u);
    v17 = sub_10000A5A0(&qword_100021038);
    swift_arrayDestroy(v11, 1, v17);
    swift_slowDealloc(v11, -1, -1);
    swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }
  else
  {

    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }

  v22 = 0;
  v18 = sub_10000A5A0(&qword_100021040);
  return CheckedContinuation.resume(returning:)(&v22, v18);
}

_QWORD *sub_10000A474@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_QWORD *sub_10000A480@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_10000A494(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_10000A4A8(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_10000A4BC(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[2] = 0xD000000000000016;
  v3[3] = 0x80000001000185A0;
  v3[4] = 0xD000000000000018;
  v3[5] = 0x80000001000185C0;
  v3[6] = 0xD000000000000021;
  v3[7] = 0x80000001000185E0;
  v3[8] = 0xD000000000000026;
  v3[9] = 0x8000000100018610;
  v3[14] = a2;
  v3[15] = a3;
  v3[13] = a1;
  swift_retain(a3);
  v3[12] = objc_msgSend(a1, "content");
  v3[11] = objc_msgSend(objc_allocWithZone((Class)SPBeaconManager), "init");
  v3[10] = objc_msgSend(objc_allocWithZone((Class)SPOwnerSession), "init");
  return v3;
}

uint64_t sub_10000A5A0(uint64_t *a1)
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

uint64_t sub_10000A5E0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_10000A5F8(uint64_t a1)
{
  uint64_t v1;

  sub_100009AF4(a1, *(void **)(v1 + 32), *(double *)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t sub_10000A608(double a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(sub_10000A5A0(&qword_100021040) - 8) + 80);
  return sub_100009DE0(*(void **)(v3 + 16), v3 + ((v7 + 24) & ~v7), a1, a2, a3);
}

double sub_10000A664(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  *(_QWORD *)&result = swift_retain(v2).n128_u64[0];
  return result;
}

uint64_t sub_10000A674(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000A680()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_10000A5A0(&qword_100021040);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000A6F8(uint64_t a1)
{
  uint64_t v1;

  sub_10000A5A0(&qword_100021040);
  return sub_10000A1E8(a1, *(void **)(v1 + 16));
}

uint64_t sub_10000A73C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for UUID(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000A77C()
{
  unint64_t result;

  result = qword_100021088;
  if (!qword_100021088)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, &qword_100021088);
  }
  return result;
}

uint64_t *sub_10000A7C0(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1[11];
  v3 = a1[13];
  v4 = a1[15];
  v5 = a1[18];
  v6 = a1[20];
  sub_10000A844(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7]);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v6);
  return a1;
}

uint64_t sub_10000A844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  if (a8)
  {
    swift_bridgeObjectRelease(a8);
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a5);
    return swift_bridgeObjectRelease(a6);
  }
  return result;
}

uint64_t sub_10000A8A0()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000A8C4(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

void *sub_10000A8F8(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  if ((unint64_t)a1 >> 62)
    goto LABEL_13;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v4; v4 = _CocoaArrayWrapper.endIndex.getter(v10))
  {
    v5 = 4;
    while (1)
    {
      v6 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5 - 4, a1)
         : *(id *)(a1 + 8 * v5);
      v7 = v6;
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      v9 = objc_msgSend(v6, "partIdentifier");
      if (objc_msgSend(a2, "partIdentifier") == (id)v9)
      {
        swift_bridgeObjectRelease(a1);
        return v7;
      }

      ++v5;
      if (v8 == v4)
        goto LABEL_17;
    }
    __break(1u);
LABEL_13:
    if (a1 < 0)
      v10 = a1;
    else
      v10 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
  }
LABEL_17:
  swift_bridgeObjectRelease(a1);
  return 0;
}

uint64_t sub_10000AA28(void *a1, void *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  Swift::String v37;
  Swift::String v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  _QWORD v54[2];
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v56 = a3;
  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
    v16 = objc_msgSend(a1, "name");
    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
    v19 = v20;
    goto LABEL_5;
  }
  v11 = a2;
  v12 = objc_msgSend(v11, "beaconMap");
  v13 = sub_10000B734(0, &qword_100021098, SPPairingState_ptr);
  v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v12, &type metadata for String, v13, &protocol witness table for String);

  v15 = *(_QWORD *)(v14 + 16);
  swift_bridgeObjectRelease(v14);
  if (v15 == 1)
  {
    v16 = objc_msgSend(v11, "name");
    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
    v19 = v18;

LABEL_5:
    goto LABEL_12;
  }
  v55 = v8;
  v21 = objc_msgSend(a1, "accessoryProductInfo");
  if (!v21)
    goto LABEL_10;
  v22 = v21;
  v23 = objc_msgSend(v21, "layoutTemplate");

  if (!v23)
    goto LABEL_10;
  v24 = sub_10000B734(0, &qword_1000210B0, SPAccessoryLayoutTemplate_ptr);
  v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v23, v24);

  v26 = a1;
  v27 = sub_10000A8F8(v25, v26);
  swift_bridgeObjectRelease(v25);

  if (v27)
  {
    v28 = objc_msgSend(v27, "partName");
    v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
    v31 = v30;

  }
  else
  {
LABEL_10:
    v28 = objc_msgSend(a1, "name");
    v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
    v31 = v32;
  }

  v33 = objc_msgSend(v11, "name");
  v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
  v36 = v35;

  v57 = v34;
  v58 = v36;
  v37._countAndFlagsBits = 2108704;
  v37._object = (void *)0xE300000000000000;
  String.append(_:)(v37);
  v38._countAndFlagsBits = v29;
  v38._object = v31;
  String.append(_:)(v38);

  swift_bridgeObjectRelease(v31);
  v17 = v57;
  v19 = v58;
  v8 = v55;
LABEL_12:
  v39 = HIBYTE(v19) & 0xF;
  if ((v19 & 0x2000000000000000) == 0)
    v39 = v17 & 0xFFFFFFFFFFFFLL;
  if (v39)
    return v17;
  swift_bridgeObjectRelease(v19);
  if (qword_100020E98 != -1)
    swift_once(&qword_100020E98, sub_100012644);
  v41 = type metadata accessor for Logger(0);
  sub_10000A5E0(v41, (uint64_t)qword_100021FA8);
  v42 = a1;
  swift_bridgeObjectRetain_n(a4, 2);
  v43 = v42;
  v44 = Logger.logObject.getter(v43);
  v45 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = swift_slowAlloc(22, -1);
    v55 = swift_slowAlloc(64, -1);
    v57 = v55;
    *(_DWORD *)v46 = 136315394;
    v54[1] = v46 + 4;
    v47 = objc_msgSend(v43, "identifier");
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    v48 = sub_10000A73C(&qword_100021068, (uint64_t)&protocol conformance descriptor for UUID);
    v49 = dispatch thunk of CustomStringConvertible.description.getter(v7, v48);
    v51 = v50;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v59 = sub_100015420(v49, v51, &v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60);

    swift_bridgeObjectRelease(v51);
    *(_WORD *)(v46 + 12) = 2080;
    swift_bridgeObjectRetain(a4);
    v40 = v56;
    v59 = sub_100015420(v56, a4, &v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60);
    swift_bridgeObjectRelease_n(a4, 3);
    _os_log_impl((void *)&_mh_execute_header, v44, v45, "NotifyWhenFoundNotificationService: Beacon name for %s is empty, using fallback name %s.", (uint8_t *)v46, 0x16u);
    v52 = v55;
    swift_arrayDestroy(v55, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v52, -1, -1);
    swift_slowDealloc(v46, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a4, 2);
    v40 = v56;
  }
  swift_bridgeObjectRetain(a4);
  return v40;
}

uint64_t sub_10000AF3C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 128) = a1;
  return swift_task_switch(sub_10000AF54, 0, 0);
}

uint64_t sub_10000AF54()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0 + 2;
  v2 = v0[16];
  v3 = objc_msgSend(objc_allocWithZone((Class)CLGeocoder), "init");
  v0[17] = v3;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_10000B014;
  v4 = swift_continuation_init(v0 + 2, 1);
  v0[10] = _NSConcreteStackBlock;
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = sub_100009984;
  v5[3] = &unk_10001CC00;
  v5[4] = v4;
  objc_msgSend(v3, "reverseGeocodeLocation:completionHandler:", v2, v5);
  return swift_continuation_await(v1);
}

uint64_t sub_10000B014()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 144) = v1;
  if (v1)
    v2 = sub_10000B51C;
  else
    v2 = sub_10000B074;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000B074()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  void *v29;
  uint8_t *v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  _QWORD *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;

  v1 = *(_QWORD *)(v0 + 120);
  if ((unint64_t)v1 >> 62)
  {
    if (v1 < 0)
      v23 = *(_QWORD *)(v0 + 120);
    else
      v23 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*(_QWORD *)(v0 + 120));
    v2 = (void *)_CocoaArrayWrapper.endIndex.getter(v23);
    swift_bridgeObjectRelease(v1);
    if (v2)
    {
LABEL_3:
      if ((v1 & 0xC000000000000001) != 0)
      {
        v3 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v1);
      }
      else
      {
        if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_23:
          swift_once(&qword_100020E98, sub_100012644);
LABEL_7:
          v4 = *(void **)(v0 + 128);
          v5 = type metadata accessor for Logger(0);
          sub_10000A5E0(v5, (uint64_t)qword_100021FA8);
          v6 = v4;
          v7 = v2;
          v8 = v6;
          v9 = v7;
          v10 = Logger.logObject.getter(v9);
          v11 = static os_log_type_t.default.getter();
          v12 = os_log_type_enabled(v10, v11);
          v13 = *(void **)(v0 + 128);
          v14 = *(void **)(v0 + 136);
          if (v12)
          {
            v40 = *(void **)(v0 + 136);
            v15 = swift_slowAlloc(22, -1);
            v38 = (_QWORD *)swift_slowAlloc(8, -1);
            v39 = swift_slowAlloc(32, -1);
            v42 = v39;
            *(_DWORD *)v15 = 136315394;
            v16 = v13;
            v17 = objc_msgSend(v16, "description");
            v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
            v20 = v19;

            *(_QWORD *)(v0 + 80) = sub_100015420(v18, v20, &v42);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88);
            swift_bridgeObjectRelease(v20);

            *(_WORD *)(v15 + 12) = 2112;
            *(_QWORD *)(v0 + 80) = v9;
            v21 = v9;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88);
            *v38 = v9;

            _os_log_impl((void *)&_mh_execute_header, v10, v11, "NotifyWhenFoundNotificationService: Reverse-geocoding result for %s is %@.", (uint8_t *)v15, 0x16u);
            v22 = sub_10000A5A0(&qword_100021038);
            swift_arrayDestroy(v38, 1, v22);
            swift_slowDealloc(v38, -1, -1);
            swift_arrayDestroy(v39, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v39, -1, -1);
            swift_slowDealloc(v15, -1, -1);

          }
          else
          {

          }
          return (*(uint64_t (**)(id))(v0 + 8))(v9);
        }
        v3 = *(id *)(v1 + 32);
      }
      v2 = v3;
      swift_bridgeObjectRelease(v1);
      if (qword_100020E98 == -1)
        goto LABEL_7;
      goto LABEL_23;
    }
  }
  else
  {
    v2 = *(void **)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v2)
      goto LABEL_3;
  }
  swift_bridgeObjectRelease(v1);
  if (qword_100020E98 != -1)
    swift_once(&qword_100020E98, sub_100012644);
  v24 = *(void **)(v0 + 128);
  v25 = type metadata accessor for Logger(0);
  sub_10000A5E0(v25, (uint64_t)qword_100021FA8);
  v26 = Logger.logObject.getter(v24);
  v27 = static os_log_type_t.error.getter();
  v28 = os_log_type_enabled(v26, v27);
  v29 = *(void **)(v0 + 128);
  if (v28)
  {
    v41 = *(void **)(v0 + 136);
    v30 = (uint8_t *)swift_slowAlloc(12, -1);
    v31 = swift_slowAlloc(32, -1);
    v42 = v31;
    *(_DWORD *)v30 = 136315138;
    v32 = v29;
    v33 = objc_msgSend(v32, "description");
    v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
    v36 = v35;

    *(_QWORD *)(v0 + 80) = sub_100015420(v34, v36, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88);
    swift_bridgeObjectRelease(v36);

    _os_log_impl((void *)&_mh_execute_header, v26, v27, "NotifyWhenFoundNotificationService: No reverse-geocoding results found for %s.", v30, 0xCu);
    swift_arrayDestroy(v31, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v31, -1, -1);
    swift_slowDealloc(v30, -1, -1);

  }
  else
  {

  }
  v9 = 0;
  return (*(uint64_t (**)(id))(v0 + 8))(v9);
}

uint64_t sub_10000B51C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v15;
  uint64_t v16;

  swift_willThrow();
  if (qword_100020E98 != -1)
    swift_once(&qword_100020E98, sub_100012644);
  v1 = *(_QWORD *)(v0 + 144);
  v2 = type metadata accessor for Logger(0);
  sub_10000A5E0(v2, (uint64_t)qword_100021FA8);
  swift_errorRetain(v1);
  v3 = swift_errorRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(_QWORD *)(v0 + 144);
  if (v6)
  {
    v15 = *(void **)(v0 + 136);
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v16 = v9;
    *(_DWORD *)v8 = 136315138;
    *(_QWORD *)(v0 + 80) = v7;
    swift_errorRetain(v7);
    v10 = sub_10000A5A0(&qword_1000210A0);
    v11 = String.init<A>(describing:)(v0 + 80, v10);
    v13 = v12;
    *(_QWORD *)(v0 + 80) = sub_100015420(v11, v12, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88);
    swift_bridgeObjectRelease(v13);
    swift_errorRelease(v7);
    swift_errorRelease(v7);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "NotifyWhenFoundNotificationService: Reverse-geocoding failed with error %s.", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

    swift_errorRelease(v7);
  }
  else
  {

    swift_errorRelease(v7);
    swift_errorRelease(v7);
    swift_errorRelease(v7);

  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

_OWORD *sub_10000B724(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000B734(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_10000B76C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000B798(uint64_t a1)
{
  uint64_t v1;

  return sub_100007974(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

unint64_t sub_10000B7A0()
{
  unint64_t result;

  result = qword_1000210B8;
  if (!qword_1000210B8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for PushPayload, &type metadata for PushPayload);
    atomic_store(result, (unint64_t *)&qword_1000210B8);
  }
  return result;
}

uint64_t sub_10000B7E4(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000B828(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_10000B864(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B8A0(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000B8A8(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000B8C8()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000B8F4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc(dword_1000210DC);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10000B95C;
  v2 = (_QWORD *)swift_task_alloc(dword_100020ECC);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_10000BA74;
  return sub_1000045B8();
}

uint64_t sub_10000B95C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v0;
  v1 = *(_QWORD *)(v4 + 16);
  v2 = *v0;
  v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000B9A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10000A5A0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000B9E0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000BA04(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100021514);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000B95C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100021510 + dword_100021510))(a1, v4);
}

uint64_t sub_10000BA88(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_10000BAC0 + 4 * byte_100017D14[a1]))(0xD000000000000010, 0x8000000100018430);
}

uint64_t sub_10000BAC0()
{
  return 7565409;
}

uint64_t sub_10000BAD0()
{
  return 0x7472656C61;
}

uint64_t sub_10000BAE4()
{
  return 0x736772612D636F6CLL;
}

uint64_t sub_10000BAFC()
{
  return 0x6469646E65697266;
}

uint64_t sub_10000BB14()
{
  return 0x6553646E65697266;
}

uint64_t sub_10000BB38()
{
  return 0x6E6F697461636F6CLL;
}

uint64_t sub_10000BB5C()
{
  return 0x6552646E65697266;
}

uint64_t sub_10000BB80()
{
  return 0x49555570756F7267;
}

uint64_t sub_10000BBB0()
{
  return 1684632949;
}

Swift::String *FMReplacedIdentifier.unsafeMutableAddressor()
{
  return &FMReplacedIdentifier;
}

Swift::String *FMReplacedGroupIdentifier.unsafeMutableAddressor()
{
  return &FMReplacedGroupIdentifier;
}

void sub_10000BBD8(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_10000BC18(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_10000BCA0 + 4 * byte_100017D25[a2]))(0x79656B2D636F6CLL);
}

uint64_t sub_10000BCA0(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x79656B2D636F6CLL && v1 == 0xE700000000000000)
    v2 = 1;
  else
    v2 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1, 0x79656B2D636F6CLL, 0xE700000000000000, 0);
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xE700000000000000);
  return v2 & 1;
}

void sub_10000BD70(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_10000BDB0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_10000BE38 + 4 * byte_100017D2F[a2]))(0x6F4C796150666D66);
}

uint64_t sub_10000BE38(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6F4C796150666D66 && v1 == 0xEA00000000006461)
    v2 = 1;
  else
    v2 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1, 0x6F4C796150666D66, 0xEA00000000006461, 0);
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xEA00000000006461);
  return v2 & 1;
}

void sub_10000BF08(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_10000BF50(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_10000BFA4 + 4 * byte_100017D38[a2]))(0x6567646162);
}

uint64_t sub_10000BFA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (a1 == 0x6567646162 && v1 == v2)
  {
    v3 = 1;
    v2 = v1;
  }
  else
  {
    v3 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1, 0x6567646162, v2, 0);
  }
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(v2);
  return v3 & 1;
}

void sub_10000C03C(char a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, 0);
  __asm { BR              X10 }
}

Swift::Int sub_10000C084()
{
  uint64_t v1;

  ((void (*)(uint64_t *, uint64_t, unint64_t))String.hash(into:))(&v1, 0x79656B2D636F6CLL, 0xE700000000000000);
  swift_bridgeObjectRelease(0xE700000000000000);
  return Hasher._finalize()();
}

void sub_10000C118(uint64_t a1, char a2)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, a1);
  __asm { BR              X10 }
}

Swift::Int sub_10000C15C()
{
  uint64_t v1;

  ((void (*)(uint64_t *, uint64_t, unint64_t))String.hash(into:))(&v1, 0x79656B2D636F6CLL, 0xE700000000000000);
  swift_bridgeObjectRelease(0xE700000000000000);
  return Hasher._finalize()();
}

Swift::String *FMLatitudeIdentifier.unsafeMutableAddressor()
{
  return &FMLatitudeIdentifier;
}

Swift::String *FMLongitudeIdentifier.unsafeMutableAddressor()
{
  return &FMLongitudeIdentifier;
}

Swift::String *FMAccuracyIdentifier.unsafeMutableAddressor()
{
  return &FMAccuracyIdentifier;
}

Swift::String *FMLocationIdentifier.unsafeMutableAddressor()
{
  return &FMLocationIdentifier;
}

uint64_t PushPayload.apsData.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000C22C(v1, a1);
}

uint64_t sub_10000C22C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for PushAPSData(a2, a1);
  return a2;
}

uint64_t PushPayload.payload.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 120));
  return v1;
}

uint64_t PushPayload.showInAppAlert.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 128);
}

uint64_t PushPayload.url.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 136);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 144));
  return v1;
}

uint64_t PushPayload.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 152);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 160));
  return v1;
}

void sub_10000C2EC(char *a1)
{
  sub_10000BD70(*a1);
}

void sub_10000C2F8()
{
  unsigned __int8 *v0;
  uint64_t v1;
  _QWORD v2[9];

  v1 = *v0;
  Hasher.init(_seed:)(v2, 0);
  __asm { BR              X9 }
}

Swift::Int sub_10000C33C()
{
  uint64_t v1;

  ((void (*)(uint64_t *, uint64_t, unint64_t))String.hash(into:))(&v1, 0x6F4C796150666D66, 0xEA00000000006461);
  swift_bridgeObjectRelease(0xEA00000000006461);
  return Hasher._finalize()();
}

void sub_10000C3D0()
{
  __asm { BR              X10 }
}

uint64_t sub_10000C404(uint64_t a1)
{
  ((void (*)(uint64_t, uint64_t, unint64_t))String.hash(into:))(a1, 0x6F4C796150666D66, 0xEA00000000006461);
  return swift_bridgeObjectRelease(0xEA00000000006461);
}

void sub_10000C484(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v2;
  _QWORD v3[9];

  v2 = *v1;
  Hasher.init(_seed:)(v3, a1);
  __asm { BR              X9 }
}

Swift::Int sub_10000C4C4()
{
  uint64_t v1;

  ((void (*)(uint64_t *, uint64_t, unint64_t))String.hash(into:))(&v1, 0x6F4C796150666D66, 0xEA00000000006461);
  swift_bridgeObjectRelease(0xEA00000000006461);
  return Hasher._finalize()();
}

unint64_t sub_10000C558@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  Swift::OpaquePointer v3;
  unint64_t result;

  v3._rawValue = &off_10001C888;
  result = sub_10000D9A8(*a1, v3);
  *a2 = result;
  return result;
}

uint64_t sub_10000C58C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_10000C5B4 + 4 * byte_100017D55[*v0]))();
}

void sub_10000C5B4(_QWORD *a1@<X8>)
{
  *a1 = 0x6F4C796150666D66;
  a1[1] = 0xEA00000000006461;
}

void sub_10000C5D4(char *a1@<X8>)
{
  strcpy(a1, "showInAppAlert");
  a1[15] = -18;
}

void sub_10000C5FC(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 7107189;
  a1[1] = v1;
}

void sub_10000C60C(_QWORD *a1@<X8>)
{
  *a1 = 0x696669746E656469;
  a1[1] = 0xEA00000000007265;
}

uint64_t sub_10000C630()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10000C658 + 4 * byte_100017D5A[*v0]))(7565409, 0xE300000000000000);
}

uint64_t sub_10000C658()
{
  return 0x6F4C796150666D66;
}

uint64_t sub_10000C674()
{
  return 0x70416E49776F6873;
}

uint64_t sub_10000C698()
{
  return 7107189;
}

uint64_t sub_10000C6A4()
{
  return 0x696669746E656469;
}

unint64_t sub_10000C6C4@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  Swift::OpaquePointer v3;
  unint64_t result;

  v3._rawValue = &off_10001C888;
  result = sub_10000D9A8(a1, v3);
  *a2 = result;
  return result;
}

uint64_t sub_10000C6F0()
{
  return 0;
}

void sub_10000C6FC(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_10000C708(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000ECFC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000C730(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000ECFC();
  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 PushPayload.init(from:)@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[10];
  uint64_t v10;

  sub_10000CF74(a1, (uint64_t)v9);
  if (!v2)
  {
    v5 = v9[9];
    *(_OWORD *)(a2 + 128) = v9[8];
    *(_OWORD *)(a2 + 144) = v5;
    *(_QWORD *)(a2 + 160) = v10;
    v6 = v9[5];
    *(_OWORD *)(a2 + 64) = v9[4];
    *(_OWORD *)(a2 + 80) = v6;
    v7 = v9[7];
    *(_OWORD *)(a2 + 96) = v9[6];
    *(_OWORD *)(a2 + 112) = v7;
    v8 = v9[1];
    *(_OWORD *)a2 = v9[0];
    *(_OWORD *)(a2 + 16) = v8;
    result = (__n128)v9[3];
    *(_OWORD *)(a2 + 32) = v9[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

uint64_t PushAPSData.alert.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000D518(v1, a1);
}

uint64_t PushAPSData.badge.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t PushAPSData.category.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 88));
  return v1;
}

uint64_t PushAPSData.sound.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 104));
  return v1;
}

void sub_10000C83C(char *a1)
{
  sub_10000BF08(*a1);
}

void sub_10000C848()
{
  unsigned __int8 *v0;
  uint64_t v1;
  _QWORD v2[9];

  v1 = *v0;
  Hasher.init(_seed:)(v2, 0);
  __asm { BR              X9 }
}

Swift::Int sub_10000C890()
{
  uint64_t v0;
  uint64_t v2;

  ((void (*)(uint64_t *, uint64_t, uint64_t))String.hash(into:))(&v2, 0x6567646162, v0);
  swift_bridgeObjectRelease(v0);
  return Hasher._finalize()();
}

void sub_10000C8F0()
{
  __asm { BR              X10 }
}

uint64_t sub_10000C928(uint64_t a1)
{
  uint64_t v1;

  ((void (*)(uint64_t, uint64_t, uint64_t))String.hash(into:))(a1, 0x6567646162, v1);
  return swift_bridgeObjectRelease(v1);
}

void sub_10000C974(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v2;
  _QWORD v3[9];

  v2 = *v1;
  Hasher.init(_seed:)(v3, a1);
  __asm { BR              X9 }
}

Swift::Int sub_10000C9B8()
{
  uint64_t v0;
  uint64_t v2;

  ((void (*)(uint64_t *, uint64_t, uint64_t))String.hash(into:))(&v2, 0x6567646162, v0);
  swift_bridgeObjectRelease(v0);
  return Hasher._finalize()();
}

unint64_t sub_10000CA18@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10000D560(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000CA44()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_10000CA70 + 4 * byte_100017D6B[*v0]))();
}

void sub_10000CA70(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x6567646162;
  a1[1] = v1;
}

void sub_10000CA84(_QWORD *a1@<X8>)
{
  *a1 = 0x79726F6765746163;
  a1[1] = 0xE800000000000000;
}

void sub_10000CAA0(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x646E756F73;
  a1[1] = v1;
}

uint64_t sub_10000CAB4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10000CAE0 + 4 * byte_100017D6F[*v0]))(0x7472656C61, 0xE500000000000000);
}

uint64_t sub_10000CAE0()
{
  return 0x6567646162;
}

uint64_t sub_10000CAF0()
{
  return 0x79726F6765746163;
}

uint64_t sub_10000CB08()
{
  return 0x646E756F73;
}

unint64_t sub_10000CB18@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10000D560(a1);
  *a2 = result;
  return result;
}

void sub_10000CB3C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_10000CB48(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000EC18();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000CB70(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000EC18();
  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 PushAPSData.init(from:)@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[7];

  sub_10000D5A8(a1, (uint64_t *)v7);
  if (!v2)
  {
    v5 = v7[5];
    *(_OWORD *)(a2 + 64) = v7[4];
    *(_OWORD *)(a2 + 80) = v5;
    *(_OWORD *)(a2 + 96) = v7[6];
    v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
    result = (__n128)v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(__n128 *)(a2 + 48) = result;
  }
  return result;
}

uint64_t PushAlert.body.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain(v0[1]);
  return v1;
}

uint64_t PushAlert.locKey.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t PushAlert.locArgs.getter()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 32));
}

uint64_t PushAlert.fallbackLocArgs.getter()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 40));
}

uint64_t PushAlert.summaryArg.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 56));
  return v1;
}

void sub_10000CC7C(char *a1)
{
  sub_10000BBD8(*a1);
}

void sub_10000CC88()
{
  char *v0;

  sub_10000C03C(*v0);
}

void sub_10000CC90()
{
  __asm { BR              X10 }
}

uint64_t sub_10000CCC4(uint64_t a1)
{
  ((void (*)(uint64_t, uint64_t, unint64_t))String.hash(into:))(a1, 0x79656B2D636F6CLL, 0xE700000000000000);
  return swift_bridgeObjectRelease(0xE700000000000000);
}

void sub_10000CD44(uint64_t a1)
{
  char *v1;

  sub_10000C118(a1, *v1);
}

unint64_t sub_10000CD4C@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  Swift::OpaquePointer v3;
  unint64_t result;

  v3._rawValue = &off_10001C9A0;
  result = sub_10000D9A8(*a1, v3);
  *a2 = result;
  return result;
}

uint64_t sub_10000CD80()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_10000CDA8 + 4 * byte_100017D78[*v0]))();
}

void sub_10000CDA8(_QWORD *a1@<X8>)
{
  *a1 = 0x79656B2D636F6CLL;
  a1[1] = 0xE700000000000000;
}

void sub_10000CDC4(_QWORD *a1@<X8>)
{
  *a1 = 0x736772612D636F6CLL;
  a1[1] = 0xE800000000000000;
}

void sub_10000CDE0(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x80000001000184A0;
}

void sub_10000CE00(_QWORD *a1@<X8>)
{
  *a1 = 0x2D7972616D6D7573;
  a1[1] = 0xEB00000000677261;
}

uint64_t sub_10000CE24()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10000CE4C + 4 * byte_100017D7D[*v0]))(2036625250, 0xE400000000000000);
}

uint64_t sub_10000CE4C()
{
  return 0x79656B2D636F6CLL;
}

uint64_t sub_10000CE64()
{
  return 0x736772612D636F6CLL;
}

unint64_t sub_10000CE7C()
{
  return 0xD000000000000011;
}

uint64_t sub_10000CE98()
{
  return 0x2D7972616D6D7573;
}

unint64_t sub_10000CEB8@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  Swift::OpaquePointer v3;
  unint64_t result;

  v3._rawValue = &off_10001C9A0;
  result = sub_10000D9A8(a1, v3);
  *a2 = result;
  return result;
}

uint64_t sub_10000CEE4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000EB34();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000CF0C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000EB34();
  return CodingKey.debugDescription.getter(a1, v2);
}

double PushAlert.init(from:)@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;

  sub_10000D9EC(a1, (uint64_t *)v7);
  if (!v2)
  {
    v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    result = *(double *)&v8;
    v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }
  return result;
}

uint64_t *sub_10000CF74@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
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
  uint64_t *result;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
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
  _QWORD *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
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
  unsigned __int8 v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unsigned __int8 v104;
  char v105;

  v5 = sub_10000A5A0(&qword_100021130);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  v71 = a1;
  sub_10000EB10(a1, v9);
  v11 = sub_10000ECFC();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for PushPayload.CodingKeys, &type metadata for PushPayload.CodingKeys, v11, v9, v10);
  if (v2)
    return (uint64_t *)sub_10000B8A8(v71);
  v70 = v6;
  v64 = a2;
  LOBYTE(v72) = 0;
  v12 = sub_10000ED40();
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v83, &type metadata for PushAPSData, &v72, v5, &type metadata for PushAPSData, v12);
  v13 = v83;
  v14 = v92;
  v15 = v94;
  v59 = v91;
  v60 = v93;
  v16 = v96;
  v58 = v95;
  v104 = v92;
  LOBYTE(v83) = 1;
  v62 = v85;
  v63 = v13;
  v17 = v84;
  v68 = v90;
  v69 = v86;
  v65 = v87;
  v66 = v89;
  v67 = v88;
  sub_10000ECA0(v13, v84, v85, v86, v87, v88, v89, v90);
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v15);
  v18 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v83, v5);
  v61 = v19;
  v52 = v14;
  v53 = v18;
  v56 = v15;
  v57 = v17;
  LOBYTE(v83) = 2;
  swift_bridgeObjectRetain(v19);
  v55 = 0;
  v20 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v83, v5);
  LOBYTE(v83) = 3;
  v21 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v83, v5);
  v105 = 4;
  v23 = v22;
  swift_bridgeObjectRetain(v22);
  v24 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v105, v5);
  v54 = v23;
  v25 = *(void (**)(char *, uint64_t))(v70 + 8);
  v26 = v24;
  v47 = v27;
  v48 = v24;
  v28 = v8;
  v29 = v27;
  v25(v28, v5);
  v30 = v62;
  *(_QWORD *)&v72 = v63;
  *((_QWORD *)&v72 + 1) = v57;
  v50 = v21;
  *(_QWORD *)&v73 = v62;
  *((_QWORD *)&v73 + 1) = v69;
  *(_QWORD *)&v74 = v65;
  v31 = v23;
  v32 = v65;
  *((_QWORD *)&v74 + 1) = v67;
  *(_QWORD *)&v75 = v66;
  *((_QWORD *)&v75 + 1) = v68;
  *(_QWORD *)&v76 = v59;
  BYTE8(v76) = v52;
  *(_QWORD *)&v77 = v60;
  *((_QWORD *)&v77 + 1) = v56;
  v49 = v20;
  *(_QWORD *)&v78 = v58;
  *((_QWORD *)&v78 + 1) = v16;
  v51 = v16;
  v33 = v61;
  *(_QWORD *)&v79 = v53;
  *((_QWORD *)&v79 + 1) = v61;
  LOBYTE(v80) = v20;
  *((_QWORD *)&v80 + 1) = v21;
  *(_QWORD *)&v81 = v31;
  v34 = v31;
  *((_QWORD *)&v81 + 1) = v26;
  v82 = v29;
  sub_10000ED84((uint64_t *)&v72);
  swift_bridgeObjectRelease(v33);
  swift_bridgeObjectRelease(v34);
  v35 = v63;
  v36 = v57;
  v38 = v66;
  v37 = v67;
  sub_10000A844(v63, v57, v30, v69, v32, v67, v66, v68);
  swift_bridgeObjectRelease(v51);
  v39 = v56;
  swift_bridgeObjectRelease(v56);
  sub_10000B8A8(v71);
  v83 = v35;
  v84 = v36;
  v85 = v30;
  v86 = v69;
  v87 = v32;
  v88 = v37;
  v89 = v38;
  v90 = v68;
  v91 = v59;
  v92 = v104;
  v93 = v60;
  v94 = v39;
  v95 = v58;
  v96 = v51;
  v97 = v53;
  v98 = v61;
  v99 = v49;
  v100 = v50;
  v101 = v54;
  v102 = v48;
  v103 = v47;
  result = sub_10000A7C0(&v83);
  v41 = v81;
  v42 = v64;
  *(_OWORD *)(v64 + 128) = v80;
  *(_OWORD *)(v42 + 144) = v41;
  *(_QWORD *)(v42 + 160) = v82;
  v43 = v77;
  *(_OWORD *)(v42 + 64) = v76;
  *(_OWORD *)(v42 + 80) = v43;
  v44 = v79;
  *(_OWORD *)(v42 + 96) = v78;
  *(_OWORD *)(v42 + 112) = v44;
  v45 = v73;
  *(_OWORD *)v42 = v72;
  *(_OWORD *)(v42 + 16) = v45;
  v46 = v75;
  *(_OWORD *)(v42 + 32) = v74;
  *(_OWORD *)(v42 + 48) = v46;
  return result;
}

uint64_t sub_10000D518(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000A5A0(&qword_1000210F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000D560(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10001C920, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 4)
    return 4;
  else
    return v3;
}

uint64_t sub_10000D5A8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
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
  uint64_t result;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
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
  int v69;
  char v70;

  v5 = sub_10000A5A0(&qword_100021118);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_10000EB10(a1, v9);
  v11 = sub_10000EC18();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for PushAPSData.CodingKeys, &type metadata for PushAPSData.CodingKeys, v11, v9, v10);
  if (v2)
    return sub_10000B8A8(a1);
  v70 = 0;
  v12 = sub_10000EC5C();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v61, &type metadata for PushAlert, &v70, v5, &type metadata for PushAlert, v12);
  v55 = a2;
  v13 = v61;
  v14 = v64;
  v16 = v65;
  v15 = v66;
  LOBYTE(v61) = 1;
  v56 = v13;
  v57 = v62;
  v58 = v63;
  v59 = v68;
  v60 = v67;
  sub_10000ECA0(v13, v62, v63, v64, v65, v66, v67, v68);
  v17 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v61, v5);
  v69 = v18;
  v50 = v17;
  v51 = v15;
  v52 = v16;
  v53 = v14;
  v20 = v57;
  v19 = v58;
  v21 = v56;
  LOBYTE(v61) = 2;
  v49 = KeyedDecodingContainer.decode(_:forKey:)(&v61, v5);
  LOBYTE(v61) = 3;
  v54 = v22;
  swift_bridgeObjectRetain(v22);
  v23 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v61, v5);
  v24 = *(void (**)(char *, uint64_t))(v6 + 8);
  v48 = v23;
  v26 = v25;
  v47 = v25;
  v24(v8, v5);
  v27 = v21;
  v28 = v21;
  v29 = v20;
  v30 = v20;
  v31 = v19;
  v33 = v52;
  v32 = v53;
  v34 = v51;
  v35 = v59;
  sub_10000ECA0(v28, v30, v31, v53, v52, v51, v60, v59);
  swift_bridgeObjectRetain(v26);
  v36 = v29;
  v37 = v58;
  v38 = v60;
  sub_10000A844(v27, v36, v58, v32, v33, v34, v60, v35);
  sub_10000B8A8(a1);
  v39 = v57;
  v40 = v38;
  v41 = v59;
  sub_10000A844(v27, v57, v37, v32, v33, v34, v40, v59);
  v42 = v47;
  swift_bridgeObjectRelease(v47);
  v43 = v54;
  result = swift_bridgeObjectRelease(v54);
  v45 = v55;
  *v55 = v27;
  v45[1] = v39;
  v45[2] = v58;
  v45[3] = v32;
  v45[4] = v33;
  v45[5] = v34;
  v45[6] = v60;
  v45[7] = v41;
  v45[8] = v50;
  *((_BYTE *)v45 + 72) = v69 & 1;
  v45[10] = v49;
  v45[11] = v43;
  v45[12] = v48;
  v45[13] = v42;
  return result;
}

unint64_t sub_10000D9A8(Swift::String string, Swift::OpaquePointer cases)
{
  void *object;
  Swift::String v3;
  unint64_t v5;

  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)(cases, v3);
  swift_bridgeObjectRelease(object);
  if (v5 >= 5)
    return 5;
  else
    return v5;
}

uint64_t sub_10000D9EC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
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
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  unint64_t v40;

  v5 = sub_10000A5A0(&qword_1000210F8);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_10000EB10(a1, v9);
  v11 = sub_10000EB34();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for PushAlert.CodingKeys, &type metadata for PushAlert.CodingKeys, v11, v9, v10);
  if (v2)
    return sub_10000B8A8(a1);
  LOBYTE(v40) = 0;
  v12 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v40, v5);
  v14 = v13;
  LOBYTE(v40) = 1;
  swift_bridgeObjectRetain(v13);
  v15 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v40, v5);
  v38 = v16;
  v17 = v16;
  v33 = v15;
  v34 = v12;
  v37 = v14;
  v18 = sub_10000A5A0(&qword_100021108);
  v39 = 2;
  v19 = sub_10000EB78();
  swift_bridgeObjectRetain(v17);
  v35 = v19;
  v36 = 0;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v40, v18, &v39, v5, v18, v19);
  v20 = v40;
  v39 = 3;
  swift_bridgeObjectRetain(v40);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v40, v18, &v39, v5, v18, v35);
  v21 = v20;
  v22 = v40;
  LOBYTE(v40) = 4;
  v35 = v22;
  swift_bridgeObjectRetain(v22);
  v23 = KeyedDecodingContainer.decode(_:forKey:)(&v40, v5);
  v24 = v37;
  v26 = v25;
  v27 = *(void (**)(char *, uint64_t))(v6 + 8);
  v36 = v23;
  v27(v8, v5);
  swift_bridgeObjectRetain(v24);
  v28 = v24;
  v29 = v38;
  swift_bridgeObjectRetain(v38);
  swift_bridgeObjectRetain(v21);
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease(v28);
  swift_bridgeObjectRelease(v29);
  swift_bridgeObjectRelease(v21);
  sub_10000B8A8(a1);
  swift_bridgeObjectRelease(v26);
  v30 = v35;
  swift_bridgeObjectRelease(v35);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v29);
  result = swift_bridgeObjectRelease(v28);
  *a2 = v34;
  a2[1] = v28;
  a2[2] = v33;
  a2[3] = v29;
  a2[4] = v21;
  a2[5] = v30;
  a2[6] = v36;
  a2[7] = v26;
  return result;
}

uint64_t destroy for PushPayload(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[7];
  if (v2)
  {
    swift_bridgeObjectRelease(a1[1]);
    swift_bridgeObjectRelease(a1[3]);
    swift_bridgeObjectRelease(a1[4]);
    v3 = a1[5];
    swift_bridgeObjectRelease(v2);
    swift_bridgeObjectRelease(v3);
  }
  swift_bridgeObjectRelease(a1[11]);
  swift_bridgeObjectRelease(a1[13]);
  swift_bridgeObjectRelease(a1[15]);
  swift_bridgeObjectRelease(a1[18]);
  return swift_bridgeObjectRelease(a1[20]);
}

uint64_t initializeWithCopy for PushPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = *(_QWORD *)(a2 + 56);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v5;
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v6;
    v7 = *(_QWORD *)(a2 + 32);
    v8 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = v7;
    *(_QWORD *)(a1 + 40) = v8;
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 56) = v4;
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v4);
  }
  else
  {
    v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v9;
    v10 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v10;
  }
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  v11 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v11;
  v12 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v12;
  v13 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v13;
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  v14 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v14;
  v15 = *(_QWORD *)(a2 + 152);
  v16 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = v15;
  *(_QWORD *)(a1 + 160) = v16;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v16);
  return a1;
}

uint64_t assignWithCopy for PushPayload(uint64_t a1, __int128 *a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
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

  v4 = *((_QWORD *)a2 + 7);
  if (*(_QWORD *)(a1 + 56))
  {
    if (v4)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v5 = *((_QWORD *)a2 + 1);
      v6 = *(_QWORD *)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v5;
      swift_bridgeObjectRetain(v5);
      swift_bridgeObjectRelease(v6);
      *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
      v7 = *((_QWORD *)a2 + 3);
      v8 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v7;
      swift_bridgeObjectRetain(v7);
      swift_bridgeObjectRelease(v8);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *((_QWORD *)a2 + 4);
      *(_QWORD *)(a1 + 32) = v10;
      swift_bridgeObjectRetain(v10);
      swift_bridgeObjectRelease(v9);
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *((_QWORD *)a2 + 5);
      *(_QWORD *)(a1 + 40) = v12;
      swift_bridgeObjectRetain(v12);
      swift_bridgeObjectRelease(v11);
      *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
      v13 = *((_QWORD *)a2 + 7);
      v14 = *(_QWORD *)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v13;
      swift_bridgeObjectRetain(v13);
      swift_bridgeObjectRelease(v14);
    }
    else
    {
      sub_10000E174((_QWORD *)a1);
      v20 = a2[3];
      v22 = *a2;
      v21 = a2[1];
      *(_OWORD *)(a1 + 32) = a2[2];
      *(_OWORD *)(a1 + 48) = v20;
      *(_OWORD *)a1 = v22;
      *(_OWORD *)(a1 + 16) = v21;
    }
  }
  else if (v4)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    v15 = *((_QWORD *)a2 + 1);
    *(_QWORD *)(a1 + 8) = v15;
    *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
    v16 = *((_QWORD *)a2 + 3);
    *(_QWORD *)(a1 + 24) = v16;
    v17 = *((_QWORD *)a2 + 4);
    *(_QWORD *)(a1 + 32) = v17;
    v18 = *((_QWORD *)a2 + 5);
    *(_QWORD *)(a1 + 40) = v18;
    *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
    v19 = *((_QWORD *)a2 + 7);
    *(_QWORD *)(a1 + 56) = v19;
    swift_bridgeObjectRetain(v15);
    swift_bridgeObjectRetain(v16);
    swift_bridgeObjectRetain(v17);
    swift_bridgeObjectRetain(v18);
    swift_bridgeObjectRetain(v19);
  }
  else
  {
    v23 = *a2;
    v24 = a2[1];
    v25 = a2[3];
    *(_OWORD *)(a1 + 32) = a2[2];
    *(_OWORD *)(a1 + 48) = v25;
    *(_OWORD *)a1 = v23;
    *(_OWORD *)(a1 + 16) = v24;
  }
  v26 = *((_QWORD *)a2 + 8);
  *(_BYTE *)(a1 + 72) = *((_BYTE *)a2 + 72);
  *(_QWORD *)(a1 + 64) = v26;
  *(_QWORD *)(a1 + 80) = *((_QWORD *)a2 + 10);
  v27 = *((_QWORD *)a2 + 11);
  v28 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = v27;
  swift_bridgeObjectRetain(v27);
  swift_bridgeObjectRelease(v28);
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  v29 = *((_QWORD *)a2 + 13);
  v30 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 104) = v29;
  swift_bridgeObjectRetain(v29);
  swift_bridgeObjectRelease(v30);
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  v31 = *((_QWORD *)a2 + 15);
  v32 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 120) = v31;
  swift_bridgeObjectRetain(v31);
  swift_bridgeObjectRelease(v32);
  *(_BYTE *)(a1 + 128) = *((_BYTE *)a2 + 128);
  *(_QWORD *)(a1 + 136) = *((_QWORD *)a2 + 17);
  v33 = *((_QWORD *)a2 + 18);
  v34 = *(_QWORD *)(a1 + 144);
  *(_QWORD *)(a1 + 144) = v33;
  swift_bridgeObjectRetain(v33);
  swift_bridgeObjectRelease(v34);
  *(_QWORD *)(a1 + 152) = *((_QWORD *)a2 + 19);
  v35 = *((_QWORD *)a2 + 20);
  v36 = *(_QWORD *)(a1 + 160);
  *(_QWORD *)(a1 + 160) = v35;
  swift_bridgeObjectRetain(v35);
  swift_bridgeObjectRelease(v36);
  return a1;
}

_QWORD *sub_10000E174(_QWORD *a1)
{
  destroy for PushAlert(a1);
  return a1;
}

__n128 initializeWithTake for PushPayload(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;
  __int128 v9;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  v4 = a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  result = (__n128)a2[7];
  v8 = a2[8];
  v9 = a2[9];
  *(_QWORD *)(a1 + 160) = *((_QWORD *)a2 + 20);
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

uint64_t assignWithTake for PushPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
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

  v4 = *(_QWORD *)(a1 + 56);
  if (!v4)
    goto LABEL_5;
  v5 = *(_QWORD *)(a2 + 56);
  if (!v5)
  {
    sub_10000E174((_QWORD *)a1);
LABEL_5:
    v12 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v12;
    v13 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v13;
    goto LABEL_6;
  }
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
  v10 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease(v10);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease(v11);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRelease(v4);
LABEL_6:
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  v14 = *(_QWORD *)(a2 + 88);
  v15 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v14;
  swift_bridgeObjectRelease(v15);
  v16 = *(_QWORD *)(a2 + 104);
  v17 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v16;
  swift_bridgeObjectRelease(v17);
  v18 = *(_QWORD *)(a2 + 120);
  v19 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v18;
  swift_bridgeObjectRelease(v19);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  v20 = *(_QWORD *)(a2 + 144);
  v21 = *(_QWORD *)(a1 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v20;
  swift_bridgeObjectRelease(v21);
  v22 = *(_QWORD *)(a2 + 160);
  v23 = *(_QWORD *)(a1 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v22;
  swift_bridgeObjectRelease(v23);
  return a1;
}

uint64_t getEnumTagSinglePayload for PushPayload(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 168))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 88);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PushPayload(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 168) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 88) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 168) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PushPayload()
{
  return &type metadata for PushPayload;
}

uint64_t initializeBufferWithCopyOfBuffer for PushAPSData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for PushAPSData(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[7];
  if (v2)
  {
    swift_bridgeObjectRelease(a1[1]);
    swift_bridgeObjectRelease(a1[3]);
    swift_bridgeObjectRelease(a1[4]);
    v3 = a1[5];
    swift_bridgeObjectRelease(v2);
    swift_bridgeObjectRelease(v3);
  }
  swift_bridgeObjectRelease(a1[11]);
  return swift_bridgeObjectRelease(a1[13]);
}

uint64_t initializeWithCopy for PushAPSData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *(_QWORD *)(a2 + 56);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v5;
    v6 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v6;
    v7 = *(_QWORD *)(a2 + 32);
    v8 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = v7;
    *(_QWORD *)(a1 + 40) = v8;
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 56) = v4;
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v4);
  }
  else
  {
    v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v9;
    v10 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v10;
  }
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  v11 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v11;
  v12 = *(_QWORD *)(a2 + 96);
  v13 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = v12;
  *(_QWORD *)(a1 + 104) = v13;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v13);
  return a1;
}

uint64_t assignWithCopy for PushAPSData(uint64_t a1, __int128 *a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = *((_QWORD *)a2 + 7);
  if (*(_QWORD *)(a1 + 56))
  {
    if (v4)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v5 = *((_QWORD *)a2 + 1);
      v6 = *(_QWORD *)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v5;
      swift_bridgeObjectRetain(v5);
      swift_bridgeObjectRelease(v6);
      *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
      v7 = *((_QWORD *)a2 + 3);
      v8 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v7;
      swift_bridgeObjectRetain(v7);
      swift_bridgeObjectRelease(v8);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *((_QWORD *)a2 + 4);
      *(_QWORD *)(a1 + 32) = v10;
      swift_bridgeObjectRetain(v10);
      swift_bridgeObjectRelease(v9);
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *((_QWORD *)a2 + 5);
      *(_QWORD *)(a1 + 40) = v12;
      swift_bridgeObjectRetain(v12);
      swift_bridgeObjectRelease(v11);
      *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
      v13 = *((_QWORD *)a2 + 7);
      v14 = *(_QWORD *)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v13;
      swift_bridgeObjectRetain(v13);
      swift_bridgeObjectRelease(v14);
    }
    else
    {
      sub_10000E174((_QWORD *)a1);
      v20 = a2[3];
      v22 = *a2;
      v21 = a2[1];
      *(_OWORD *)(a1 + 32) = a2[2];
      *(_OWORD *)(a1 + 48) = v20;
      *(_OWORD *)a1 = v22;
      *(_OWORD *)(a1 + 16) = v21;
    }
  }
  else if (v4)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    v15 = *((_QWORD *)a2 + 1);
    *(_QWORD *)(a1 + 8) = v15;
    *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
    v16 = *((_QWORD *)a2 + 3);
    *(_QWORD *)(a1 + 24) = v16;
    v17 = *((_QWORD *)a2 + 4);
    *(_QWORD *)(a1 + 32) = v17;
    v18 = *((_QWORD *)a2 + 5);
    *(_QWORD *)(a1 + 40) = v18;
    *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
    v19 = *((_QWORD *)a2 + 7);
    *(_QWORD *)(a1 + 56) = v19;
    swift_bridgeObjectRetain(v15);
    swift_bridgeObjectRetain(v16);
    swift_bridgeObjectRetain(v17);
    swift_bridgeObjectRetain(v18);
    swift_bridgeObjectRetain(v19);
  }
  else
  {
    v23 = *a2;
    v24 = a2[1];
    v25 = a2[3];
    *(_OWORD *)(a1 + 32) = a2[2];
    *(_OWORD *)(a1 + 48) = v25;
    *(_OWORD *)a1 = v23;
    *(_OWORD *)(a1 + 16) = v24;
  }
  v26 = *((_QWORD *)a2 + 8);
  *(_BYTE *)(a1 + 72) = *((_BYTE *)a2 + 72);
  *(_QWORD *)(a1 + 64) = v26;
  *(_QWORD *)(a1 + 80) = *((_QWORD *)a2 + 10);
  v27 = *((_QWORD *)a2 + 11);
  v28 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = v27;
  swift_bridgeObjectRetain(v27);
  swift_bridgeObjectRelease(v28);
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  v29 = *((_QWORD *)a2 + 13);
  v30 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 104) = v29;
  swift_bridgeObjectRetain(v29);
  swift_bridgeObjectRelease(v30);
  return a1;
}

__n128 initializeWithTake for PushAPSData(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for PushAPSData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 + 56);
  if (!v4)
    goto LABEL_5;
  v5 = *(_QWORD *)(a2 + 56);
  if (!v5)
  {
    sub_10000E174((_QWORD *)a1);
LABEL_5:
    v12 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v12;
    v13 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v13;
    goto LABEL_6;
  }
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
  v10 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease(v10);
  v11 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease(v11);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRelease(v4);
LABEL_6:
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  v14 = *(_QWORD *)(a2 + 88);
  v15 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v14;
  swift_bridgeObjectRelease(v15);
  v16 = *(_QWORD *)(a2 + 104);
  v17 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v16;
  swift_bridgeObjectRelease(v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for PushAPSData(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 112))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 88);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PushAPSData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 112) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 88) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PushAPSData()
{
  return &type metadata for PushAPSData;
}

uint64_t destroy for PushAlert(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[4]);
  swift_bridgeObjectRelease(a1[5]);
  return swift_bridgeObjectRelease(a1[7]);
}

_QWORD *initializeWithCopy for PushAlert(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[4];
  v6 = a2[5];
  a1[4] = v5;
  a1[5] = v6;
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

_QWORD *assignWithCopy for PushAlert(_QWORD *a1, _QWORD *a2)
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
  uint64_t v13;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  v6 = a2[3];
  v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = a1[4];
  v9 = a2[4];
  a1[4] = v9;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRelease(v8);
  v10 = a1[5];
  v11 = a2[5];
  a1[5] = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRelease(v10);
  a1[6] = a2[6];
  v12 = a2[7];
  v13 = a1[7];
  a1[7] = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  return a1;
}

__n128 initializeWithTake for PushAlert(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_QWORD *assignWithTake for PushAlert(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = a1[1];
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  a1[2] = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease(a1[3]);
  v6 = a1[4];
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease(v6);
  v7 = a1[5];
  a1[5] = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 56);
  v9 = a1[7];
  a1[6] = *(_QWORD *)(a2 + 48);
  a1[7] = v8;
  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for PushAlert(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PushAlert(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 56) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PushAlert()
{
  return &type metadata for PushAlert;
}

_QWORD *sub_10000EB10(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000EB34()
{
  unint64_t result;

  result = qword_100021100;
  if (!qword_100021100)
  {
    result = swift_getWitnessTable(&unk_100018228, &type metadata for PushAlert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021100);
  }
  return result;
}

unint64_t sub_10000EB78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021110;
  if (!qword_100021110)
  {
    v1 = sub_10000EBD4(&qword_100021108);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_100021110);
  }
  return result;
}

uint64_t sub_10000EBD4(uint64_t *a1)
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

unint64_t sub_10000EC18()
{
  unint64_t result;

  result = qword_100021120;
  if (!qword_100021120)
  {
    result = swift_getWitnessTable(&unk_1000181D8, &type metadata for PushAPSData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021120);
  }
  return result;
}

unint64_t sub_10000EC5C()
{
  unint64_t result;

  result = qword_100021128;
  if (!qword_100021128)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for PushAlert, &type metadata for PushAlert);
    atomic_store(result, (unint64_t *)&qword_100021128);
  }
  return result;
}

uint64_t sub_10000ECA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  if (a8)
  {
    swift_bridgeObjectRetain(a6);
    swift_bridgeObjectRetain(a8);
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a4);
    return swift_bridgeObjectRetain(a5);
  }
  return result;
}

unint64_t sub_10000ECFC()
{
  unint64_t result;

  result = qword_100021138;
  if (!qword_100021138)
  {
    result = swift_getWitnessTable(&unk_100018188, &type metadata for PushPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021138);
  }
  return result;
}

unint64_t sub_10000ED40()
{
  unint64_t result;

  result = qword_100021140;
  if (!qword_100021140)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for PushAPSData, &type metadata for PushAPSData);
    atomic_store(result, (unint64_t *)&qword_100021140);
  }
  return result;
}

uint64_t *sub_10000ED84(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1[11];
  v3 = a1[13];
  v4 = a1[15];
  v5 = a1[18];
  v6 = a1[20];
  sub_10000ECA0(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7]);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

_BYTE *initializeBufferWithCopyOfBuffer for PushPayload.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for PushPayload.CodingKeys()
{
  return &type metadata for PushPayload.CodingKeys;
}

uint64_t getEnumTagSinglePayload for PushAPSData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PushAPSData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000EF10 + 4 * byte_100017D87[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_10000EF44 + 4 * byte_100017D82[v4]))();
}

uint64_t sub_10000EF44(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000EF4C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000EF54);
  return result;
}

uint64_t sub_10000EF60(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000EF68);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_10000EF6C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000EF74(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000EF80(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000EF88(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PushAPSData.CodingKeys()
{
  return &type metadata for PushAPSData.CodingKeys;
}

uint64_t _s26FindMyNotificationsService11PushPayloadV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s26FindMyNotificationsService11PushPayloadV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000F07C + 4 * byte_100017D91[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10000F0B0 + 4 * byte_100017D8C[v4]))();
}

uint64_t sub_10000F0B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000F0B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000F0C0);
  return result;
}

uint64_t sub_10000F0CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000F0D4);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_10000F0D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000F0E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PushAlert.CodingKeys()
{
  return &type metadata for PushAlert.CodingKeys;
}

unint64_t sub_10000F100()
{
  unint64_t result;

  result = qword_100021148;
  if (!qword_100021148)
  {
    result = swift_getWitnessTable(&unk_100017F80, &type metadata for PushAlert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021148);
  }
  return result;
}

unint64_t sub_10000F148()
{
  unint64_t result;

  result = qword_100021150;
  if (!qword_100021150)
  {
    result = swift_getWitnessTable(&unk_100018070, &type metadata for PushAPSData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021150);
  }
  return result;
}

unint64_t sub_10000F190()
{
  unint64_t result;

  result = qword_100021158;
  if (!qword_100021158)
  {
    result = swift_getWitnessTable(&unk_100018160, &type metadata for PushPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021158);
  }
  return result;
}

unint64_t sub_10000F1D8()
{
  unint64_t result;

  result = qword_100021160;
  if (!qword_100021160)
  {
    result = swift_getWitnessTable(&unk_100018098, &type metadata for PushPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021160);
  }
  return result;
}

unint64_t sub_10000F220()
{
  unint64_t result;

  result = qword_100021168;
  if (!qword_100021168)
  {
    result = swift_getWitnessTable(&unk_1000180C0, &type metadata for PushPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021168);
  }
  return result;
}

unint64_t sub_10000F268()
{
  unint64_t result;

  result = qword_100021170;
  if (!qword_100021170)
  {
    result = swift_getWitnessTable(&unk_100017FA8, &type metadata for PushAPSData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021170);
  }
  return result;
}

unint64_t sub_10000F2B0()
{
  unint64_t result;

  result = qword_100021178;
  if (!qword_100021178)
  {
    result = swift_getWitnessTable(&unk_100017FD0, &type metadata for PushAPSData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021178);
  }
  return result;
}

unint64_t sub_10000F2F8()
{
  unint64_t result;

  result = qword_100021180;
  if (!qword_100021180)
  {
    result = swift_getWitnessTable(&unk_100017EB8, &type metadata for PushAlert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021180);
  }
  return result;
}

unint64_t sub_10000F340()
{
  unint64_t result;

  result = qword_100021188;
  if (!qword_100021188)
  {
    result = swift_getWitnessTable(&unk_100017EE0, &type metadata for PushAlert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021188);
  }
  return result;
}

uint64_t sub_10000F390()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  sub_10000FABC();
  v0 = sub_10000A5A0(&qword_100021080);
  v1 = swift_allocObject(v0, 72, 7);
  *(_OWORD *)(v1 + 16) = xmmword_100017C40;
  *(_QWORD *)(v1 + 56) = &type metadata for String;
  *(_QWORD *)(v1 + 64) = sub_10000A77C();
  *(_QWORD *)(v1 + 32) = 0xD000000000000029;
  *(_QWORD *)(v1 + 40) = 0x80000001000187A0;
  result = NSPredicate.init(format:_:)(0x54414D20464C4553, 0xEF40252053454843, v1);
  static String.emailPredicate = result;
  return result;
}

uint64_t *String.emailPredicate.unsafeMutableAddressor()
{
  if (qword_100020E90 != -1)
    swift_once(&qword_100020E90, sub_10000F390);
  return &static String.emailPredicate;
}

id static String.emailPredicate.getter()
{
  if (qword_100020E90 != -1)
    swift_once(&qword_100020E90, sub_10000F390);
  return (id)static String.emailPredicate;
}

BOOL String.isPhoneNumber.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(char *, uint64_t);
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  _QWORD v28[2];

  v4 = type metadata accessor for CharacterSet(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6);
  v11 = (char *)v28 - v10;
  __chkstk_darwin(v9);
  v13 = (char *)v28 - v12;
  v14 = CharacterSet.init(charactersIn:)(757671979, 0xE400000000000000);
  static CharacterSet.decimalDigits.getter(v14);
  v15 = CharacterSet.formUnion(_:)(v13);
  static CharacterSet.controlCharacters.getter(v15);
  CharacterSet.formUnion(_:)(v8);
  v16 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
  v17 = v16(v8, v4);
  static CharacterSet.whitespacesAndNewlines.getter(v17);
  CharacterSet.formUnion(_:)(v8);
  v16(v8, v4);
  v28[0] = a1;
  v28[1] = a2;
  v18 = sub_10000F66C();
  v19 = StringProtocol.components(separatedBy:)(v11, &type metadata for String, v18);
  v28[0] = v19;
  v20 = sub_10000A5A0(&qword_100021108);
  v21 = sub_10000F6B0();
  v22 = BidirectionalCollection<>.joined(separator:)(0, 0xE000000000000000, v20, v21);
  v24 = v23;
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v24);
  v25 = HIBYTE(v24) & 0xF;
  if ((v24 & 0x2000000000000000) == 0)
    v25 = v22 & 0xFFFFFFFFFFFFLL;
  v26 = v25 != 0;
  v16(v11, v4);
  v16(v13, v4);
  return v26;
}

unint64_t sub_10000F66C()
{
  unint64_t result;

  result = qword_100021190;
  if (!qword_100021190)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100021190);
  }
  return result;
}

unint64_t sub_10000F6B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021198;
  if (!qword_100021198)
  {
    v1 = sub_10000EBD4(&qword_100021108);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100021198);
  }
  return result;
}

id String.isEmail.getter()
{
  void *v0;
  NSString v1;
  id v2;

  if (qword_100020E90 != -1)
    swift_once(&qword_100020E90, sub_10000F390);
  v0 = (void *)static String.emailPredicate;
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "evaluateWithObject:", v1);

  return v2;
}

uint64_t String.sanitized.getter(uint64_t a1, unint64_t a2)
{
  Swift::String v4;
  Swift::Bool v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  Swift::String v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4._countAndFlagsBits = 0x3A6F746C69616DLL;
  v4._object = (void *)0xE700000000000000;
  v5 = String.hasPrefix(_:)(v4);
  swift_bridgeObjectRetain(a2);
  if (v5)
  {
    v6 = String.count.getter(0x3A6F746C69616DLL, 0xE700000000000000);
    v7 = sub_10000FA20(v6, a1, a2);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    swift_bridgeObjectRelease(a2);
    a1 = static String._fromSubstring(_:)(v7, v9, v11, v13);
    a2 = v14;
    swift_bridgeObjectRelease(v13);
  }
  v15._countAndFlagsBits = 980182388;
  v15._object = (void *)0xE400000000000000;
  if (String.hasPrefix(_:)(v15))
  {
    v16 = String.count.getter(980182388, 0xE400000000000000);
    v17 = sub_10000FA20(v16, a1, a2);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    swift_bridgeObjectRelease(a2);
    a1 = static String._fromSubstring(_:)(v17, v19, v21, v23);
    swift_bridgeObjectRelease(v23);
  }
  return a1;
}

uint64_t String.characterCount.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_bridgeObjectRetain(a2);
  v4 = String.UTF16View.count.getter(a1, a2);
  swift_bridgeObjectRelease(a2);
  return v4;
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
    v9 = sub_10000FA20(v8, v4, v3);
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
  v2 = sub_10000F66C();
  return ((uint64_t (*)(_QWORD *, _QWORD *, _QWORD, _QWORD, _QWORD, uint64_t, void *, void *, void *, unint64_t, unint64_t, unint64_t))StringProtocol.replacingOccurrences<A, B>(of:with:options:range:))(v5, v4, 0, 0, 0, 1, &type metadata for String, &type metadata for String, &type metadata for String, v2, v2, v2);
}

unint64_t sub_10000FA20(unint64_t result, uint64_t a2, unint64_t a3)
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

unint64_t sub_10000FABC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000211A0;
  if (!qword_1000211A0)
  {
    v1 = objc_opt_self(NSPredicate);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000211A0);
  }
  return result;
}

id sub_10000FB10(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  a4(v5);
  v9 = v8;
  swift_bridgeObjectRelease(v7);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return v10;
}

id FMPhoneNumberUtil.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id FMPhoneNumberUtil.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMPhoneNumberUtil();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for FMPhoneNumberUtil()
{
  return objc_opt_self(_TtC26FindMyNotificationsService17FMPhoneNumberUtil);
}

id FMPhoneNumberUtil.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMPhoneNumberUtil();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000FE10()
{
  uint64_t result;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;

  result = CPPhoneNumberCopyHomeCountryCode();
  if (!result)
  {
    __break(1u);
    goto LABEL_27;
  }
  v1 = (void *)result;
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
  v4 = v3;

  v5 = v4 & 0x2000000000000000;
  v6 = HIBYTE(v4) & 0xF;
  v7 = v2 & 0xFFFFFFFFFFFFLL;
  if ((v4 & 0x2000000000000000) != 0)
    v8 = HIBYTE(v4) & 0xF;
  else
    v8 = v2 & 0xFFFFFFFFFFFFLL;
  if (!v8)
  {
    v9 = swift_bridgeObjectRelease(v4);
    result = CPPhoneNumberCopyActiveCountryCode(v9);
    if (result)
    {
      v10 = (void *)result;
      v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
      v4 = v11;

      v5 = v4 & 0x2000000000000000;
      v6 = HIBYTE(v4) & 0xF;
      v7 = v2 & 0xFFFFFFFFFFFFLL;
      goto LABEL_8;
    }
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
LABEL_8:
  if (v5)
    v12 = v6;
  else
    v12 = v7;
  if (!v12)
  {
    v13 = swift_bridgeObjectRelease(v4);
    result = CPPhoneNumberCopyNetworkCountryCode(v13);
    if (result)
    {
      v14 = (void *)result;
      v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
      v4 = v15;

      v5 = v4 & 0x2000000000000000;
      v6 = HIBYTE(v4) & 0xF;
      v7 = v2 & 0xFFFFFFFFFFFFLL;
      goto LABEL_14;
    }
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
LABEL_14:
  if (v5)
    v16 = v6;
  else
    v16 = v7;
  if (v16)
    goto LABEL_20;
  v17 = swift_bridgeObjectRelease(v4);
  result = CPPhoneNumberCopyLastKnownNetworkCountryCode(v17);
  if (!result)
  {
LABEL_29:
    __break(1u);
    return result;
  }
  v18 = (void *)result;
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
  v4 = v19;

  v5 = v4 & 0x2000000000000000;
  v6 = HIBYTE(v4) & 0xF;
  v7 = v2 & 0xFFFFFFFFFFFFLL;
LABEL_20:
  if (v5)
    v20 = v6;
  else
    v20 = v7;
  if (!v20)
  {
    swift_bridgeObjectRelease(v4);
    return 29557;
  }
  return v2;
}

uint64_t sub_10000FF3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  NSString v7;
  void *v8;
  id v9;
  uint64_t String;
  void *v11;

  sub_10000FE10();
  v5 = v4;
  v6 = String._bridgeToObjectiveC()();
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  v8 = (void *)CFPhoneNumberCreate(kCFAllocatorDefault, v6, v7);

  if (!v8)
    goto LABEL_5;
  v9 = v8;
  String = CFPhoneNumberCreateString(kCFAllocatorDefault, v9, 1);
  if (!String)
  {

LABEL_5:
    swift_bridgeObjectRetain(a2);
    return a1;
  }
  v11 = (void *)String;
  a1 = static String._unconditionallyBridgeFromObjectiveC(_:)(String);

  return a1;
}

uint64_t sub_100010028(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSString v5;
  void *v6;
  void *v7;
  Swift::String v8;
  Swift::String v9;

  if (qword_100020E90 != -1)
    swift_once(&qword_100020E90, sub_10000F390);
  v4 = static String.emailPredicate;
  v5 = String._bridgeToObjectiveC()();
  LOBYTE(v4) = objc_msgSend((id)v4, "evaluateWithObject:", v5);

  if ((v4 & 1) != 0)
  {
    swift_bridgeObjectRetain(a2);
  }
  else
  {
    a1 = sub_10000FF3C(a1, a2);
    v7 = v6;
    swift_bridgeObjectRetain(v6);
    v8._countAndFlagsBits = 43;
    v8._object = (void *)0xE100000000000000;
    if (String.hasPrefix(_:)(v8) || String.count.getter(a1, v7) <= 1)
    {
      swift_bridgeObjectRelease(v7);
    }
    else
    {
      v9._countAndFlagsBits = a1;
      v9._object = v7;
      String.append(_:)(v9);
      swift_bridgeObjectRelease_n(v7, 2);
      return 43;
    }
  }
  return a1;
}

uint64_t sub_100010150(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;

  v25 = a3;
  v6 = type metadata accessor for CharacterSet(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = 0;
  v28 = 0xE000000000000000;
  v29 = a1;
  v23 = a1 & 0xFFFFFFFFFFFFLL;
  v24 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) != 0)
    v10 = HIBYTE(a2) & 0xF;
  else
    v10 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v10)
    return 0;
  v11 = 0;
  v22 = a2 & 0xFFFFFFFFFFFFFFLL;
  v20 = v3;
  v21 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
  do
  {
    if ((a2 & 0x1000000000000000) != 0)
    {
      v14 = _StringGuts.foreignErrorCorrectedScalar(startingAt:)(v11 << 16, v29, a2);
    }
    else
    {
      if ((a2 & 0x2000000000000000) != 0)
      {
        v26[0] = v29;
        v26[1] = v22;
        v12 = v26;
        v13 = v24;
      }
      else
      {
        v12 = (_QWORD *)v21;
        v13 = v23;
        if ((v29 & 0x1000000000000000) == 0)
          v12 = (_QWORD *)_StringObject.sharedUTF8.getter(v29, a2);
      }
      v14 = _decodeScalar(_:startingAt:)(v12, v13, v11);
    }
    v16 = v14;
    v17 = v15;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v25, v6);
    v18 = CharacterSet.contains(_:)(v16);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    if ((v18 & 1) != 0)
      String.UnicodeScalarView.append(_:)(v16);
    v11 += v17;
  }
  while (v11 < v10);
  return v27;
}

uint64_t sub_1000102E0(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v17;

  v4 = type metadata accessor for CharacterSet(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v9 = a1 & 0xFFFFFFFFFFFFLL;
  if (v9)
  {
    static CharacterSet.decimalDigits.getter(v6);
    CharacterSet.insert(_:)(43);
    swift_bridgeObjectRetain(a2);
    v10 = sub_100010150(a1, a2, (uint64_t)v8);
    v12 = v11;
    swift_bridgeObjectRelease(a2);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v13 = HIBYTE(v12) & 0xF;
    if ((v12 & 0x2000000000000000) == 0)
      v13 = v10 & 0xFFFFFFFFFFFFLL;
    if (!v13)
    {
      swift_bridgeObjectRelease(v12);
      return 1;
    }
    if (v10 == a1 && v12 == a2)
    {
      swift_bridgeObjectRelease(a2);
    }
    else
    {
      v15 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v10, v12, 0);
      swift_bridgeObjectRelease(v12);
      if ((v15 & 1) == 0)
        return 1;
    }
  }
  return 0;
}

uint64_t sub_100010424(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  Swift::String v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  NSString v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSString v27;
  NSString v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t String;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v6 = type metadata accessor for CharacterSet(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static CharacterSet.decimalDigits.getter(v8);
  v11._countAndFlagsBits = 0x2D232A29282BLL;
  v11._object = (void *)0xE600000000000000;
  CharacterSet.insert(charactersIn:)(v11);
  v36 = a1;
  v37 = a2;
  v12 = sub_10000F66C();
  v13 = StringProtocol.rangeOfCharacter(from:options:range:)(v10, 0, 0, 0, 1, &type metadata for String, v12);
  if ((v14 & 1) != 0)
  {
    swift_bridgeObjectRetain(a2);
    v20 = a1;
    v22 = a2;
LABEL_5:
    v23 = HIBYTE(v22) & 0xF;
    if ((v22 & 0x2000000000000000) == 0)
      v23 = v20 & 0xFFFFFFFFFFFFLL;
    if (v23)
    {
      v35 = v7;
      v24 = v6;
      sub_10000FE10();
      v26 = v25;
      v27 = String._bridgeToObjectiveC()();
      v28 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v26);
      v29 = (void *)CFPhoneNumberCreate(kCFAllocatorDefault, v27, v28);

      if (v29)
      {
        if ((a3 & 1) != 0)
          v30 = 7;
        else
          v30 = 2;
        v31 = v29;
        String = CFPhoneNumberCreateString(kCFAllocatorDefault, v31, v30);
        if (!String)
        {
          (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v24);

          return v20;
        }
        v33 = (void *)String;
        swift_bridgeObjectRelease(v22);
        v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);

      }
      (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v24);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
    return v20;
  }
  v36 = a1;
  v37 = a2;
  v15 = String.Index.utf16Offset<A>(in:)(&v36, v13, &type metadata for String, v12);
  result = String.count.getter(a1, a2);
  v17 = result - v15;
  if (!__OFSUB__(result, v15))
  {
    v18 = String._bridgeToObjectiveC()();
    v19 = objc_msgSend(v18, "substringWithRange:", v15, v17);

    v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
    v22 = v21;

    goto LABEL_5;
  }
  __break(1u);
  return result;
}

void sub_1000106B0()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  unint64_t v6;
  void *v7;
  NSString v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void (*v26)(void);
  void *v27;
  id v28;
  uint64_t v29[5];
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  __int128 v33;
  __int128 v34;

  v1 = v0;
  v2 = objc_msgSend(*(id *)(v0 + 16), "userInfo");
  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v2, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v31 = 0x6F4C796150666D66;
  v32 = 0xEA00000000006461;
  AnyHashable.init<A>(_:)(&v31, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v3 + 16) && (v4 = sub_100015B8C((uint64_t)v29), (v5 & 1) != 0))
  {
    sub_10000B864(*(_QWORD *)(v3 + 56) + 32 * v4, (uint64_t)&v33);
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
  }
  swift_bridgeObjectRelease(v3);
  sub_10000A8C4((uint64_t)v29);
  if (*((_QWORD *)&v34 + 1))
  {
    if ((swift_dynamicCast(&v31, &v33, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
    {
      v6 = v32;
      v7 = *(void **)(v1 + 24);
      if (v7)
      {
        v8 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v6);
        v29[4] = (uint64_t)sub_100011574;
        v30 = v1;
        v29[0] = (uint64_t)_NSConcreteStackBlock;
        v29[1] = 1107296256;
        v29[2] = (uint64_t)sub_10001137C;
        v29[3] = (uint64_t)&unk_10001D118;
        v9 = _Block_copy(v29);
        v10 = v30;
        swift_retain(v1);
        swift_release(v10);
        objc_msgSend(v7, "dataForPayload:completion:", v8, v9);
        _Block_release(v9);

      }
      else
      {
        swift_bridgeObjectRelease(v32);
      }
      return;
    }
  }
  else
  {
    sub_100011534((uint64_t)&v33);
  }
  if (qword_100020E98 != -1)
    swift_once(&qword_100020E98, sub_100012644);
  v11 = type metadata accessor for Logger(0);
  v12 = sub_10000A5E0(v11, (uint64_t)qword_100021FA8);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "FenceNotificationContentService: No subscription identifier. Nothing else to do.", v15, 2u);
    swift_slowDealloc(v15, -1, -1);
  }

  v16 = swift_retain_n(v1, 2);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc(12, -1);
    v20 = swift_slowAlloc(32, -1);
    *(_DWORD *)v19 = 136315138;
    v29[0] = v20;
    v21 = objc_msgSend(*(id *)(v1 + 16), "body", v20);
    v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
    v24 = v23;

    *(_QWORD *)&v33 = sub_100015420(v22, v24, v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, (char *)&v33 + 8);
    swift_release_n(v1, 2);
    swift_bridgeObjectRelease(v24);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "FenceNotificationContentService: Completing with best attempt %s", v19, 0xCu);
    swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1, -1);
    swift_slowDealloc(v19, -1, -1);

  }
  else
  {

    swift_release_n(v1, 2);
  }
  v26 = *(void (**)(void))(v1 + 32);
  v25 = *(_QWORD *)(v1 + 40);
  v27 = *(void **)(v1 + 16);
  swift_retain(v25);
  v28 = v27;
  v26();
  swift_release(v25);

}

void sub_100010AAC(void *a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  id v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void (*v43)(void);
  id v44;
  void *v45;
  uint64_t v46;
  id v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  void *v58;
  uint64_t v59;
  id v60;
  unint64_t v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  char isUniquelyReferenced_nonNull_native;
  Class isa;
  void *v68;
  void (*v69)(void);
  void *v70;
  void *v71;
  unint64_t v72;
  id v73;
  char v74[8];
  uint64_t v75;
  uint64_t v76;
  char v77[8];
  uint64_t v78;
  uint64_t v79;
  _OWORD v80[2];
  __int128 v81;
  __int128 v82;
  id v83[5];

  v9 = type metadata accessor for Logger(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
    goto LABEL_9;
  v13 = a1;
  if ((sub_100011F94() & 1) == 0)
  {

LABEL_9:
    if (a4)
    {
      swift_errorRetain(a4);
      if (qword_100020E98 != -1)
        swift_once(&qword_100020E98, sub_100012644);
      sub_10000A5E0(v9, (uint64_t)qword_100021FA8);
      swift_errorRetain(a4);
      v27 = swift_errorRetain(a4);
      v28 = Logger.logObject.getter(v27);
      v29 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc(12, -1);
        v31 = (void *)swift_slowAlloc(32, -1);
        v83[0] = v31;
        *(_DWORD *)v30 = 136315138;
        swift_getErrorValue(a4, v77, v74);
        v32 = Error.localizedDescription.getter(v75, v76);
        v34 = v33;
        *(_QWORD *)&v81 = sub_100015420(v32, v33, (uint64_t *)v83);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, (char *)&v81 + 8);
        swift_bridgeObjectRelease(v34);
        swift_errorRelease(a4);
        swift_errorRelease(a4);
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "FenceNotificationContentService: Failed to fetch data for payload, error: %s.", v30, 0xCu);
        swift_arrayDestroy(v31, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v31, -1, -1);
        swift_slowDealloc(v30, -1, -1);

        swift_errorRelease(a4);
      }
      else
      {
        swift_errorRelease(a4);
        swift_errorRelease(a4);
        swift_errorRelease(a4);

      }
    }
    else
    {
      v35 = (void *)objc_opt_self(NSKeyedArchiver);
      v83[0] = a3;
      v36 = sub_10000A5A0((uint64_t *)&unk_100021330);
      v37 = Optional._bridgeToObjectiveC()();
      v83[0] = 0;
      v38 = objc_msgSend(v35, "archivedDataWithRootObject:requiringSecureCoding:error:", v37, 1, v83);
      swift_unknownObjectRelease(v37);
      v39 = v83[0];
      if (v38)
      {
        v73 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v38);
        v41 = v40;

      }
      else
      {
        v45 = v39;
        v46 = _convertNSErrorToError(_:)();

        swift_willThrow();
        swift_errorRelease(v46);
        v73 = 0;
        v41 = 0xF000000000000000;
      }
      if (qword_100020E98 != -1)
        swift_once(&qword_100020E98, sub_100012644);
      sub_10000A5E0(v9, (uint64_t)qword_100021FA8);
      v47 = a3;
      v48 = Logger.logObject.getter(v47);
      v49 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v48, v49))
      {
        v50 = (uint8_t *)swift_slowAlloc(12, -1);
        v51 = (void *)swift_slowAlloc(32, -1);
        v72 = v41;
        v52 = a5;
        v53 = v51;
        v83[0] = v51;
        *(_DWORD *)v50 = 136315138;
        *(_QWORD *)&v81 = a3;
        v54 = v47;
        v55 = String.init<A>(describing:)(&v81, v36);
        v57 = v56;
        *(_QWORD *)&v81 = sub_100015420(v55, v56, (uint64_t *)v83);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, (char *)&v81 + 8);

        swift_bridgeObjectRelease(v57);
        _os_log_impl((void *)&_mh_execute_header, v48, v49, "FenceNotificationContentService: Successfully replaced payload with location: %s.", v50, 0xCu);
        swift_arrayDestroy(v53, 1, (char *)&type metadata for Any + 8);
        v58 = v53;
        a5 = v52;
        v41 = v72;
        swift_slowDealloc(v58, -1, -1);
        swift_slowDealloc(v50, -1, -1);

      }
      else
      {

      }
      v59 = (uint64_t)v73;
      v60 = objc_msgSend(*(id *)(a5 + 16), "mutableCopy");
      _bridgeAnyObjectToAny(_:)(v60);
      swift_unknownObjectRelease(v60);
      v61 = sub_100011594();
      if ((swift_dynamicCast(&v81, v83, (char *)&type metadata for Any + 8, v61, 6) & 1) != 0)
      {
        v62 = (void *)v81;
        *(_QWORD *)&v81 = 0x6E6F697461636F6CLL;
        *((_QWORD *)&v81 + 1) = 0xE800000000000000;
        AnyHashable.init<A>(_:)(&v81, &type metadata for String, &protocol witness table for String);
        if (v41 >> 60 == 15)
        {
          v81 = 0u;
          v82 = 0u;
        }
        else
        {
          *((_QWORD *)&v82 + 1) = &type metadata for Data;
          *(_QWORD *)&v81 = v59;
          *((_QWORD *)&v81 + 1) = v41;
        }
        v63 = objc_msgSend(v62, "userInfo", sub_1000115E4(v59, v41));
        v64 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v63, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

        v79 = v64;
        if (v41 >> 60 == 15)
        {
          sub_100011534((uint64_t)&v81);
          sub_10001163C((uint64_t)v83, v80);
          sub_10000A8C4((uint64_t)v83);
          sub_100011534((uint64_t)v80);
          v65 = v79;
        }
        else
        {
          sub_10000B724(&v81, v80);
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v64);
          v78 = v64;
          sub_100011C00(v80, (uint64_t)v83, isUniquelyReferenced_nonNull_native);
          v65 = v78;
          swift_bridgeObjectRelease(0x8000000000000000);
          sub_10000A8C4((uint64_t)v83);
        }
        isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v65);
        objc_msgSend(v62, "setUserInfo:", isa);
        sub_1000115D0(v59, v41);

        v68 = *(void **)(a5 + 16);
        *(_QWORD *)(a5 + 16) = v62;

      }
      else
      {
        sub_1000115D0(v59, v41);
      }
    }
    v69 = *(void (**)(void))(a5 + 32);
    v42 = *(_QWORD *)(a5 + 40);
    v70 = *(void **)(a5 + 16);
    swift_retain(v42);
    v44 = v70;
    v69();
    goto LABEL_35;
  }
  if (qword_100020E98 != -1)
    swift_once(&qword_100020E98, sub_100012644);
  v14 = sub_10000A5E0(v9, (uint64_t)qword_100021FA8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v14, v9);
  v15 = v13;
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v16, v17))
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    goto LABEL_18;
  }
  v72 = a5;
  v18 = (uint8_t *)swift_slowAlloc(12, -1);
  v71 = (void *)swift_slowAlloc(32, -1);
  v83[0] = v71;
  *(_DWORD *)v18 = 136315138;
  v73 = v15;
  v19 = objc_msgSend(v15, "identifier");
  if (v19)
  {
    v20 = v19;
    v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
    v23 = v22;

    *(_QWORD *)&v81 = sub_100015420(v21, v23, (uint64_t *)v83);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, (char *)&v81 + 8);
    v24 = v73;

    v25 = v23;
    v15 = v24;
    swift_bridgeObjectRelease(v25);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "FenceNotificationContentService: Handle %s is on block list, ignoring!", v18, 0xCu);
    v26 = v71;
    swift_arrayDestroy(v71, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1, -1);
    swift_slowDealloc(v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    a5 = v72;
LABEL_18:
    v43 = *(void (**)(void))(a5 + 32);
    v42 = *(_QWORD *)(a5 + 40);
    v44 = objc_msgSend(objc_allocWithZone((Class)UNNotificationContent), "init", swift_retain(v42).n128_f64[0]);
    v43();

LABEL_35:
    swift_release(v42);

    return;
  }

  __break(1u);
}

void sub_10001137C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v9;
  void (*v10)(void *, void *, void *, void *);
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = *(void (**)(void *, void *, void *, void *))(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  swift_retain(v9);
  v14 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v10(a2, a3, a4, a5);
  swift_release(v9);

}

uint64_t sub_100011428()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for FenceNotificationContentService()
{
  return objc_opt_self(_TtC26FindMyNotificationsService31FenceNotificationContentService);
}

id sub_10001147C()
{
  uint64_t v0;

  return *(id *)(*(_QWORD *)v0 + 16);
}

void sub_100011488()
{
  sub_1000106B0();
}

id sub_1000114E4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMFSessionDelegateTrampoline();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FMFSessionDelegateTrampoline()
{
  return objc_opt_self(_TtC26FindMyNotificationsService28FMFSessionDelegateTrampoline);
}

uint64_t sub_100011534(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000A5A0(&qword_100021328);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100011574(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  unint64_t v4;

  sub_100010AAC(a1, a2, a3, a4, v4);
}

double sub_10001157C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  *(_QWORD *)&result = swift_retain(v2).n128_u64[0];
  return result;
}

uint64_t sub_10001158C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100011594()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021078;
  if (!qword_100021078)
  {
    v1 = objc_opt_self(UNMutableNotificationContent);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100021078);
  }
  return result;
}

uint64_t sub_1000115D0(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_10000B7E4(result, a2);
  return result;
}

double sub_1000115E4(uint64_t a1, unint64_t a2)
{
  double result;

  if (a2 >> 60 != 15)
    return sub_1000115F8(a1, a2);
  return result;
}

double sub_1000115F8(uint64_t a1, unint64_t a2)
{
  double result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(a1);
  }
  *(_QWORD *)&result = swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL).n128_u64[0];
  return result;
}

double sub_10001163C@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  double result;
  uint64_t v13;

  v3 = v2;
  v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  v7 = sub_100015B8C(a1);
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v10 = *v3;
    v13 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100011DB0();
      v10 = v13;
    }
    sub_10000A8C4(*(_QWORD *)(v10 + 48) + 40 * v7);
    sub_10000B724((_OWORD *)(*(_QWORD *)(v10 + 56) + 32 * v7), a2);
    sub_100011A38(v7, v10);
    v11 = *v3;
    *v3 = v10;
    swift_bridgeObjectRelease(v11);
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

void sub_100011724(uint64_t a1, uint64_t a2)
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
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  Swift::Int v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _OWORD v38[2];
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_10000A5A0((uint64_t *)&unk_100021340);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_44;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v19 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_25;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      return;
    }
    if (v21 >= v12)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v12)
        goto LABEL_37;
      v23 = *(_QWORD *)(v37 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v12)
        {
LABEL_37:
          swift_release(v5);
          if ((a2 & 1) == 0)
            goto LABEL_44;
          goto LABEL_40;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_46;
            if (v14 >= v12)
              goto LABEL_37;
            v23 = *(_QWORD *)(v37 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_24;
          }
        }
        v14 = v24;
      }
    }
LABEL_24:
    v11 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_25:
    v25 = *(_QWORD *)(v5 + 48) + 40 * v20;
    if ((a2 & 1) != 0)
    {
      v26 = *(_OWORD *)v25;
      v27 = *(_OWORD *)(v25 + 16);
      v41 = *(_QWORD *)(v25 + 32);
      v39 = v26;
      v40 = v27;
      sub_10000B724((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v20), v38);
    }
    else
    {
      sub_10000B828(v25, (uint64_t)&v39);
      sub_10000B864(*(_QWORD *)(v5 + 56) + 32 * v20, (uint64_t)v38);
    }
    v28 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v8 + 40));
    v29 = -1 << *(_BYTE *)(v8 + 32);
    v30 = v28 & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v13 + 8 * (v30 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v13 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_45;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v13 + 8 * v31);
      }
      while (v35 == -1);
      v15 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v13 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v8 + 48) + 40 * v15;
    v17 = v39;
    v18 = v40;
    *(_QWORD *)(v16 + 32) = v41;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    sub_10000B724(v38, (_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v15));
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_44;
LABEL_40:
  v36 = 1 << *(_BYTE *)(v5 + 32);
  if (v36 >= 64)
    bzero(v22, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v36;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_44:
  swift_release(v5);
  *v3 = v8;
}

unint64_t sub_100011A38(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  Swift::Int v10;
  Swift::Int v11;
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _BYTE v28[40];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_10000B828(*(_QWORD *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        v10 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
        result = sub_10000A8C4((uint64_t)v28);
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= v11)
          {
LABEL_16:
            v14 = *(_QWORD *)(a2 + 48);
            v15 = v14 + 40 * v3;
            v16 = (__int128 *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              v17 = *v16;
              v18 = v16[1];
              *(_QWORD *)(v15 + 32) = *((_QWORD *)v16 + 4);
              *(_OWORD *)v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            v19 = *(_QWORD *)(a2 + 56);
            v20 = (_OWORD *)(v19 + 32 * v3);
            v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (v3 = v6, v20 >= v21 + 2))
            {
              v9 = v21[1];
              *v20 = *v21;
              v20[1] = v9;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= v11)
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
    v22 = (uint64_t *)(v4 + 8 * (result >> 6));
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

_OWORD *sub_100011C00(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_100015B8C(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = (_QWORD *)(v16[7] + 32 * v10);
        sub_10000B8A8(v17);
        return sub_10000B724(a1, v17);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_100011DB0();
      goto LABEL_7;
    }
    sub_100011724(v13, a3 & 1);
    v19 = sub_100015B8C(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_10000B828(a2, (uint64_t)v21);
      return sub_100011D38(v10, (uint64_t)v21, a1, v16);
    }
  }
  result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for AnyHashable);
  __break(1u);
  return result;
}

_OWORD *sub_100011D38(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  __int128 v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v5 = a4[6] + 40 * a1;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  result = sub_10000B724(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

void *sub_100011DB0()
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
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  sub_10000A5A0((uint64_t *)&unk_100021340);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    sub_10000B828(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_10000B864(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_10000B724(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100011F94()
{
  void *v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  void (**v4)(char *, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  __objc2_class_ro *v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  NSString v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSString v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (**v47)(char *, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  os_log_type_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  int IsItemBlocked;
  uint64_t result;
  uint64_t v66;
  uint64_t v67;
  id v68;
  id v69;
  void (**v70)(char *, uint64_t, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v2 = v0;
  v3 = type metadata accessor for Logger(0);
  v4 = *(void (***)(char *, uint64_t, uint64_t))(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v66 - v8;
  v10 = &NotifyWhenFoundNotificationService;
  v11 = objc_msgSend(v2, "identifier");
  if (!v11)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v12 = v11;
  static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v1 = v13;

  if (qword_100020E90 != -1)
    swift_once(&qword_100020E90, sub_10000F390);
  v14 = (void *)static String.emailPredicate;
  v15 = String._bridgeToObjectiveC()();
  LODWORD(v14) = objc_msgSend(v14, "evaluateWithObject:", v15);
  swift_bridgeObjectRelease(v1);

  v16 = objc_msgSend(v2, "identifier");
  v17 = v16;
  if ((_DWORD)v14)
  {
    v18 = CMFItemCreateWithEmailAddress(v16);
    if (v18)
    {
      v1 = v18;
      v20 = qword_100020E98;
      swift_unknownObjectRetain(v18, v19);
      if (v20 != -1)
        swift_once(&qword_100020E98, sub_100012644);
      v21 = sub_10000A5E0(v3, (uint64_t)qword_100021FA8);
      v4[2](v9, v21, v3);
      v22 = v2;
      swift_unknownObjectRetain(v1, v23);
      v10 = (__objc2_class_ro *)v22;
      v24 = Logger.logObject.getter(v10);
      v25 = static os_log_type_t.debug.getter();
      if (!os_log_type_enabled(v24, (os_log_type_t)v25))
      {

        swift_unknownObjectRelease_n(v1, 2);
        ((void (*)(char *, uint64_t))v4[1])(v9, v3);
        goto LABEL_20;
      }
      LODWORD(v69) = v25;
      v70 = v4;
      v71 = v3;
      v26 = swift_slowAlloc(22, -1);
      v68 = (id)swift_slowAlloc(64, -1);
      v73 = (uint64_t)v68;
      *(_DWORD *)v26 = 136315394;
      v27 = -[__objc2_class_ro identifier](v10, "identifier");
      if (v27)
      {
        v28 = v27;
        v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
        v31 = v30;

        v72 = sub_100015420(v29, v31, &v73);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73);

        swift_bridgeObjectRelease(v31);
        *(_WORD *)(v26 + 12) = 2080;
        v72 = v1;
        swift_unknownObjectRetain(v1, v32);
        v33 = String.init<A>(describing:)(&v72, (char *)&type metadata for Swift.AnyObject + 8);
        v35 = v34;
        v72 = sub_100015420(v33, v34, &v73);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73);
        swift_unknownObjectRelease_n(v1, 2);
        swift_bridgeObjectRelease(v35);
        _os_log_impl((void *)&_mh_execute_header, v24, (os_log_type_t)v69, "FMFHandle+Blocklist: Handle %s is an email: %s", (uint8_t *)v26, 0x16u);
        v36 = v68;
        swift_arrayDestroy(v68, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v36, -1, -1);
        swift_slowDealloc(v26, -1, -1);

        ((void (*)(char *, uint64_t))v70[1])(v9, v71);
LABEL_20:
        IsItemBlocked = CMFBlockListIsItemBlocked(v1);
        swift_unknownObjectRelease(v1);
        return IsItemBlocked != 0;
      }
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  if (!v16)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  v1 = v38;

  sub_100010424(v37, v1, 0);
  v40 = v39;
  swift_bridgeObjectRelease(v1);
  v41 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v40);
  v42 = (void *)CFPhoneNumberCreate(kCFAllocatorDefault, v41, 0);
  v43 = CMFItemCreateWithPhoneNumber();
  if (!v43)
  {
LABEL_24:
    __break(1u);
LABEL_25:

    swift_unknownObjectRelease(v1);
    __break(1u);
    goto LABEL_26;
  }
  v1 = v43;
  v45 = qword_100020E98;
  swift_unknownObjectRetain(v43, v44);
  if (v45 != -1)
    swift_once(&qword_100020E98, sub_100012644);
  v46 = sub_10000A5E0(v3, (uint64_t)qword_100021FA8);
  v4[2](v7, v46, v3);
  v47 = v4;
  v4 = v2;
  v49 = swift_unknownObjectRetain(v1, v48);
  v50 = Logger.logObject.getter(v49);
  v51 = v3;
  v52 = static os_log_type_t.debug.getter();
  if (!os_log_type_enabled(v50, v52))
  {

    swift_unknownObjectRelease_n(v1, 2);
    ((void (*)(char *, uint64_t))v47[1])(v7, v51);
    goto LABEL_20;
  }
  v68 = v42;
  v69 = v41;
  v70 = v47;
  v71 = v51;
  v53 = swift_slowAlloc(22, -1);
  v67 = swift_slowAlloc(64, -1);
  v73 = v67;
  *(_DWORD *)v53 = 136315394;
  v54 = objc_msgSend(v4, "identifier");
  if (v54)
  {
    v55 = v54;
    v56 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
    v58 = v57;

    v72 = sub_100015420(v56, v58, &v73);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73);

    swift_bridgeObjectRelease(v58);
    *(_WORD *)(v53 + 12) = 2080;
    v72 = v1;
    swift_unknownObjectRetain(v1, v59);
    v60 = String.init<A>(describing:)(&v72, (char *)&type metadata for Swift.AnyObject + 8);
    v62 = v61;
    v72 = sub_100015420(v60, v61, &v73);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73);
    swift_unknownObjectRelease_n(v1, 2);
    swift_bridgeObjectRelease(v62);
    _os_log_impl((void *)&_mh_execute_header, v50, v52, "FMFHandle+Blocklist: Handle %s is a phone number: %s", (uint8_t *)v53, 0x16u);
    v63 = v67;
    swift_arrayDestroy(v67, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v63, -1, -1);
    swift_slowDealloc(v53, -1, -1);

    ((void (*)(char *, uint64_t))v70[1])(v7, v71);
    goto LABEL_20;
  }
LABEL_26:

  result = swift_unknownObjectRelease(v1);
  __break(1u);
  return result;
}

uint64_t sub_100012644()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001268C(v0, qword_100021FA8);
  sub_10000A5E0(v0, (uint64_t)qword_100021FA8);
  return Logger.init()();
}

uint64_t *sub_10001268C(uint64_t a1, uint64_t *a2)
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

void sub_100012744()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  void (*v7)(void *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  void *v16;
  _BYTE v17[24];
  _BYTE v18[24];
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v1 = v0;
  if (qword_100020E98 != -1)
    swift_once(&qword_100020E98, sub_100012644);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_10000A5E0(v2, (uint64_t)qword_100021FA8);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "NotificationService: serviceExtensionTimeWillExpire", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v7 = *(void (**)(void *))(v1
                                     + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_contentHandler);
  if (v7)
  {
    v8 = *(_QWORD *)(v1 + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_contentHandler + 8);
    v9 = v1 + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_currentContentService;
    swift_beginAccess(v9, v18, 0, 0);
    sub_100012B98(v9, (uint64_t)&v19);
    v10 = *((_QWORD *)&v20 + 1);
    if (*((_QWORD *)&v20 + 1))
    {
      v11 = v21;
      v12 = sub_10000EB10(&v19, *((uint64_t *)&v20 + 1));
      v13 = *(_QWORD *)(v10 - 8);
      __chkstk_darwin(v12);
      v15 = &v17[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
      (*(void (**)(_BYTE *))(v13 + 16))(v15);
      swift_retain(v8);
      sub_100012BE0((uint64_t)&v19);
      v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v10, v11);
      (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v15, v10);
      v7(v16);
      v21 = 0;
      v19 = 0u;
      v20 = 0u;
      swift_beginAccess(v9, v17, 33, 0);
      sub_100012B50((uint64_t)&v19, v9);
      swift_endAccess(v17);
      sub_100012C20((uint64_t)v7, v8);

    }
    else
    {
      sub_100012BE0((uint64_t)&v19);
    }
  }
}

id sub_100012994()
{
  char *v0;
  uint64_t v1;
  objc_super v3;
  _BYTE v4[24];
  _OWORD v5[2];
  uint64_t v6;

  v6 = 0;
  memset(v5, 0, sizeof(v5));
  v1 = (uint64_t)&v0[OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_currentContentService];
  swift_beginAccess(&v0[OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_currentContentService], v4, 33, 0);
  sub_100012B50((uint64_t)v5, v1);
  swift_endAccess(v4);
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for NotificationService();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for NotificationService()
{
  return objc_opt_self(_TtC26FindMyNotificationsService19NotificationService);
}

uint64_t sub_100012B50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000A5A0(&qword_1000213E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012B98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000A5A0(&qword_1000213E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012BE0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000A5A0(&qword_1000213E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100012C20(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100012C30(uint64_t (*a1)(void))
{
  return a1();
}

void sub_100012C50(void *a1, uint64_t a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _UNKNOWN **v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _UNKNOWN **v36;
  uint64_t v37;
  unint64_t v39;
  uint64_t found;
  id v41;
  _QWORD *v42;
  unint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  char v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  id v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _BYTE v65[32];
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69[3];
  uint64_t v70;
  _UNKNOWN **v71;

  v6 = swift_allocObject(&unk_10001D180, 24, 7);
  *(_QWORD *)(v6 + 16) = a3;
  _Block_copy(a3);
  v7 = objc_msgSend(a1, "content");
  v8 = objc_msgSend(v7, "categoryIdentifier");

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v11 = v10;

  v12 = v9 == 0x45434E45464F4547 && v11 == 0xE800000000000000;
  v61 = a2;
  v63 = v6;
  if (v12)
  {
    v13 = 0xE800000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x45434E45464F4547, 0xE800000000000000, v9, v11, 0) & 1) != 0)
  {
    v13 = v11;
LABEL_8:
    swift_bridgeObjectRelease(v13);
    v14 = type metadata accessor for FenceNotificationContentService();
    v15 = (_QWORD *)swift_allocObject(v14, 48, 7);
    v16 = objc_allocWithZone((Class)type metadata accessor for FMFSessionDelegateTrampoline());
    v17 = a1;
    v18 = objc_msgSend(v16, "init", swift_retain(v6).n128_f64[0]);
    v19 = objc_msgSend(objc_allocWithZone((Class)FMFSession), "initWithDelegate:", v18);

    v15[3] = v19;
    v15[4] = sub_1000136D4;
    v15[5] = v6;
    v20 = objc_msgSend(v17, "content");

    v15[2] = v20;
    v21 = &off_10001D0F0;
LABEL_9:
    v70 = v14;
    v71 = v21;
    v69[0] = (uint64_t)v15;
LABEL_10:
    if (qword_100020E98 != -1)
      swift_once(&qword_100020E98, sub_100012644);
    v22 = type metadata accessor for Logger(0);
    sub_10000A5E0(v22, (uint64_t)qword_100021FA8);
    sub_10001368C((uint64_t)v69, (uint64_t)&v67);
    v23 = a1;
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = swift_slowAlloc(22, -1);
      v27 = (_QWORD *)swift_slowAlloc(8, -1);
      v28 = swift_slowAlloc(32, -1);
      v66 = v28;
      *(_DWORD *)v26 = 138412546;
      v64 = (uint64_t)v23;
      v29 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, v65);
      *v27 = v23;

      *(_WORD *)(v26 + 12) = 2080;
      sub_10001368C((uint64_t)&v67, (uint64_t)&v64);
      v30 = sub_10000A5A0(&qword_1000213F0);
      v31 = String.init<A>(describing:)(&v64, v30);
      v33 = v32;
      v64 = sub_100015420(v31, v32, &v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, v65);
      swift_bridgeObjectRelease(v33);
      sub_10000B8A8(&v67);
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "NotificationService: Handling request: %@ using %s", (uint8_t *)v26, 0x16u);
      v34 = sub_10000A5A0(&qword_100021038);
      swift_arrayDestroy(v27, 1, v34);
      swift_slowDealloc(v27, -1, -1);
      swift_arrayDestroy(v28, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v28, -1, -1);
      swift_slowDealloc(v26, -1, -1);
    }
    else
    {

      sub_10000B8A8(&v67);
    }

    v35 = v70;
    v36 = v71;
    sub_10000EB10(v69, v70);
    ((void (*)(uint64_t, _UNKNOWN **))v36[4])(v35, v36);
    sub_10001368C((uint64_t)v69, (uint64_t)&v67);
    v37 = v61 + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_currentContentService;
    swift_beginAccess(v61 + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_currentContentService, &v64, 33, 0);
    sub_100012B50((uint64_t)&v67, v37);
    swift_endAccess(&v64);
    sub_10000B8A8(v69);
    swift_release(v63);
    return;
  }
  if (v9 == 0x465F594649544F4ELL && v11 == 0xEC000000444E554FLL)
  {
    v39 = 0xEC000000444E554FLL;
    goto LABEL_23;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x465F594649544F4ELL, 0xEC000000444E554FLL, v9, v11, 0) & 1) != 0)
  {
    v39 = v11;
LABEL_23:
    swift_bridgeObjectRelease(v39);
    found = type metadata accessor for NotifyWhenFoundNotificationService();
    swift_allocObject(found, 128, 7);
    v41 = a1;
    swift_retain(v63);
    v42 = sub_10000A4BC(v41, (uint64_t)sub_1000136D4, v63);

    swift_release(v63);
    v70 = found;
    v71 = &off_10001CAC8;
    v69[0] = (uint64_t)v42;
    goto LABEL_10;
  }
  if (v9 == 0x4F4C5F524546464FLL && v11 == 0xEE004E4F49544143)
  {
    v43 = 0xEE004E4F49544143;
LABEL_32:
    swift_bridgeObjectRelease(v43);
LABEL_33:
    v14 = type metadata accessor for LocationSharingContentService();
    v15 = (_QWORD *)swift_allocObject(v14, 48, 7);
    v44 = objc_allocWithZone((Class)type metadata accessor for FMFSessionDelegateTrampoline());
    v45 = a1;
    v46 = objc_msgSend(v44, "init", swift_retain(v63).n128_f64[0]);
    v47 = objc_msgSend(objc_allocWithZone((Class)FMFSession), "initWithDelegate:", v46);

    v15[3] = v47;
    v15[4] = sub_1000136D4;
    v15[5] = v63;
    v48 = objc_msgSend(v45, "content");

    v15[2] = v48;
    v21 = &off_10001D198;
    goto LABEL_9;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4F4C5F524546464FLL, 0xEE004E4F49544143, v9, v11, 0) & 1) != 0)
  {
    v43 = v11;
    goto LABEL_32;
  }
  if (v9 == 0x525F455449564E49 && v11 == 0xEF45534E4F505345)
  {
    v43 = 0xEF45534E4F505345;
    goto LABEL_32;
  }
  v49 = _stringCompareWithSmolCheck(_:_:expecting:)(0x525F455449564E49, 0xEF45534E4F505345, v9, v11, 0);
  swift_bridgeObjectRelease(v11);
  if ((v49 & 1) != 0)
    goto LABEL_33;
  if (qword_100020E98 != -1)
    swift_once(&qword_100020E98, sub_100012644);
  v50 = type metadata accessor for Logger(0);
  sub_10000A5E0(v50, (uint64_t)qword_100021FA8);
  v51 = a1;
  v52 = Logger.logObject.getter(v51);
  v53 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = (uint8_t *)swift_slowAlloc(12, -1);
    v62 = swift_slowAlloc(32, -1);
    v69[0] = v62;
    *(_DWORD *)v54 = 136315138;
    v55 = objc_msgSend(v51, "content");
    v56 = objc_msgSend(v55, "categoryIdentifier");

    v57 = static String._unconditionallyBridgeFromObjectiveC(_:)(v56);
    v59 = v58;

    v67 = sub_100015420(v57, v59, v69);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68);

    swift_bridgeObjectRelease(v59);
    _os_log_impl((void *)&_mh_execute_header, v52, v53, "NotificationService: Unknown category: %s, using provided content.", v54, 0xCu);
    swift_arrayDestroy(v62, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v62, -1, -1);
    swift_slowDealloc(v54, -1, -1);

  }
  else
  {

  }
  v60 = objc_msgSend(v51, "content");
  ((void (**)(_QWORD, id))a3)[2](a3, v60);
  swift_release(v63);

}

uint64_t sub_1000134F8(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t (**v12)();
  uint64_t v13;
  uint64_t v14;

  v6 = swift_allocObject(&unk_10001D158, 24, 7);
  *(_QWORD *)(v6 + 16) = a3;
  _Block_copy(a3);
  if (qword_100020E98 != -1)
    swift_once(&qword_100020E98, sub_100012644);
  v7 = type metadata accessor for Logger(0);
  v8 = sub_10000A5E0(v7, (uint64_t)qword_100021FA8);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "NotificationService: didReceiveNotification", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  v12 = (uint64_t (**)())(a2 + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_contentHandler);
  v13 = *(_QWORD *)(a2 + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_contentHandler);
  v14 = *(_QWORD *)(a2 + OBJC_IVAR____TtC26FindMyNotificationsService19NotificationService_contentHandler + 8);
  *v12 = sub_10001367C;
  v12[1] = (uint64_t (*)())v6;
  swift_retain(v6);
  sub_100012C20(v13, v14);
  _Block_copy(a3);
  sub_100012C50(a1, a2, (void (**)(_QWORD, _QWORD))a3);
  _Block_release(a3);
  return swift_release(v6);
}

uint64_t sub_100013658()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001367C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_10001368C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000136D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  int v9;
  __n128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjectType;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD v24[4];

  v1 = v0;
  v2 = sub_10000A5A0(&qword_1000210D0);
  __chkstk_darwin(v2);
  v4 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for TaskPriority(0);
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  v7 = (_QWORD *)swift_allocObject(&unk_10001D1E8, 40, 7);
  v7[2] = 0;
  v8 = v7 + 2;
  v7[3] = 0;
  v7[4] = v1;
  v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  v10 = swift_retain(v1);
  if (v9 == 1)
  {
    sub_10000B9A4((uint64_t)v4, &qword_1000210D0);
    v11 = 0;
    v12 = 0;
    v13 = 7168;
  }
  else
  {
    v14 = TaskPriority.rawValue.getter(v10);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    v13 = v14 | 0x1C00;
    v15 = *v8;
    if (*v8)
    {
      v16 = v7[3];
      ObjectType = swift_getObjectType(*v8);
      swift_unknownObjectRetain(v15, v18);
      v11 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v16);
      v12 = v19;
      swift_unknownObjectRelease(v15);
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
  }
  v20 = swift_allocObject(&unk_10001D210, 32, 7);
  *(_QWORD *)(v20 + 16) = &unk_100021508;
  *(_QWORD *)(v20 + 24) = v7;
  if (v12 | v11)
  {
    v24[0] = 0;
    v24[1] = 0;
    v21 = v24;
    v24[2] = v11;
    v24[3] = v12;
  }
  else
  {
    v21 = 0;
  }
  v22 = swift_task_create(v13, v21, (char *)&type metadata for () + 8, &unk_1000210E8, v20);
  return swift_release(v22);
}

uint64_t sub_1000138AC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_100021424);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10000BA74;
  return sub_1000138F4();
}

uint64_t sub_1000138F4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v1[46] = v0;
  v2 = type metadata accessor for Logger(0);
  v1[47] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[48] = v3;
  v4 = (*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[49] = swift_task_alloc(v4);
  v1[50] = swift_task_alloc(v4);
  v1[51] = swift_task_alloc(v4);
  return swift_task_switch(sub_100013970, 0, 0);
}

uint64_t sub_100013970()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint8_t *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(void);
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint8_t *buf;
  uint64_t v33;
  uint64_t v34;

  v1 = *(_QWORD **)(v0 + 368);
  v2 = (void *)v1[3];
  *(_QWORD *)(v0 + 416) = v2;
  if (v2)
  {
    v3 = qword_100020E98;
    v4 = v2;
    if (v3 != -1)
    {
      swift_once(&qword_100020E98, sub_100012644);
      v1 = *(_QWORD **)(v0 + 368);
    }
    *(_QWORD *)(v0 + 424) = sub_10000A5E0(*(_QWORD *)(v0 + 376), (uint64_t)qword_100021FA8);
    v5 = swift_retain_n(v1, 2);
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.default.getter();
    v8 = os_log_type_enabled(v6, v7);
    v9 = *(_QWORD *)(v0 + 368);
    if (v8)
    {
      v10 = (uint8_t *)swift_slowAlloc(12, -1);
      v33 = swift_slowAlloc(32, -1);
      buf = v10;
      *(_DWORD *)v10 = 136315138;
      v34 = v33;
      v11 = objc_msgSend(*(id *)(v9 + 16), "userInfo");
      v12 = v4;
      v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v11, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

      v14 = Dictionary.description.getter(v13, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
      v16 = v15;
      v17 = v13;
      v4 = v12;
      swift_bridgeObjectRelease(v17);
      *(_QWORD *)(v0 + 360) = sub_100015420(v14, v16, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 360, v0 + 368);
      swift_bridgeObjectRelease(v16);
      swift_release_n(v9, 2);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "LocationSharingContentService: Handling: %s", buf, 0xCu);
      swift_arrayDestroy(v33, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v33, -1, -1);
      swift_slowDealloc(buf, -1, -1);
    }
    else
    {
      swift_release_n(*(_QWORD *)(v0 + 368), 2);
    }

    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "LocationSharingContentService: Requesting force refresh", v28, 2u);
      swift_slowDealloc(v28, -1, -1);
    }

    v29 = v0 + 16;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_100013CF8;
    v30 = swift_continuation_init(v0 + 16, 1);
    *(_QWORD *)(v0 + 80) = _NSConcreteStackBlock;
    v31 = (_QWORD *)(v0 + 80);
    v31[1] = 0x40000000;
    v31[2] = sub_100014C38;
    v31[3] = &unk_10001D1C0;
    v31[4] = v30;
    objc_msgSend(v4, "forceRefreshWithCompletion:", v31);
    return swift_continuation_await(v29);
  }
  else
  {
    v19 = (void (*)(void))v1[4];
    v18 = v1[5];
    v20 = (void *)v1[2];
    swift_retain(v18);
    v21 = v20;
    v19();

    swift_release(v18);
    v22 = *(_QWORD *)(v0 + 400);
    v23 = *(_QWORD *)(v0 + 392);
    swift_task_dealloc(*(_QWORD *)(v0 + 408));
    swift_task_dealloc(v22);
    swift_task_dealloc(v23);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_100013CF8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 432) = v1;
  if (v1)
    v2 = sub_100014A5C;
  else
    v2 = sub_100013D58;
  return swift_task_switch(v2, 0, 0);
}

void sub_100013D58(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(void);
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint8_t *v61;
  uint64_t v62;
  char v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  NSObject *v68;
  os_log_type_t v69;
  uint8_t *v70;
  uint64_t v71;
  id v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  id v81;
  void *v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  void (*v86)(os_log_t, uint8_t *);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(void);
  id v93;
  NSObject *v94;
  uint8_t *v95;
  uint64_t v96;
  NSObject *v97;
  os_log_type_t v98;
  uint64_t v99;
  id v100;
  void *v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  id v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t v110;
  NSObject *v111;
  uint8_t *v112;
  uint64_t v113;
  uint64_t v114;
  void (*v115)(void);
  void *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint8_t *buf;
  uint8_t *bufa;
  os_log_t v122;
  os_log_t v123;
  os_log_t v124;
  os_log_type_t typeb;
  os_log_type_t typec[8];
  uint64_t type;
  uint64_t typea;
  NSObject *logb;
  os_log_t logc;
  os_log_t log;
  os_log_type_t loga;
  uint64_t *v133;
  uint64_t v134;
  uint64_t v135;
  void (*v136)(uint64_t, uint64_t);
  uint64_t v137[2];

  v2 = Logger.logObject.getter(a1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "LocationSharingContentService: Force refresh completed", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }
  v5 = *(_QWORD *)(v1 + 368);

  v6 = objc_msgSend(*(id *)(v5 + 16), "userInfo");
  v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v6, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  *(_QWORD *)(v1 + 272) = 7565409;
  *(_QWORD *)(v1 + 280) = 0xE300000000000000;
  AnyHashable.init<A>(_:)(v1 + 272, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v7 + 16) && (v8 = sub_100015B8C(v1 + 120), (v9 & 1) != 0))
  {
    sub_10000B864(*(_QWORD *)(v7 + 56) + 32 * v8, v1 + 160);
  }
  else
  {
    *(_OWORD *)(v1 + 160) = 0u;
    *(_OWORD *)(v1 + 176) = 0u;
  }
  swift_bridgeObjectRelease(v7);
  sub_10000A8C4(v1 + 120);
  if (!*(_QWORD *)(v1 + 184))
  {
    v12 = sub_10000B9A4(v1 + 160, &qword_100021328);
    goto LABEL_18;
  }
  v10 = (uint64_t *)(v1 + 344);
  v11 = sub_10000A5A0(&qword_1000214D8);
  v12 = swift_dynamicCast(v1 + 344, v1 + 160, (char *)&type metadata for Any + 8, v11, 6);
  if ((v12 & 1) == 0)
  {
LABEL_18:
    v19 = Logger.logObject.getter(v12);
    v20 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v19, v20))
    {
LABEL_21:
      v23 = *(void **)(v1 + 416);
      v24 = *(_QWORD *)(v1 + 368);

      v26 = *(void (**)(void))(v24 + 32);
      v25 = *(_QWORD *)(v24 + 40);
LABEL_22:
      v27 = *(void **)(v5 + 16);
      swift_retain(v25);
      v28 = v27;
      v26();

      swift_release(v25);
LABEL_23:

      v29 = *(_QWORD *)(v1 + 400);
      v30 = *(_QWORD *)(v1 + 392);
      swift_task_dealloc(*(_QWORD *)(v1 + 408));
      swift_task_dealloc(v29);
      swift_task_dealloc(v30);
      (*(void (**)(void))(v1 + 8))();
      return;
    }
    v21 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v21 = 0;
    v22 = "LocationSharingContentService: No aps dict detected, returning default content.";
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v19, v20, v22, v21, 2u);
    swift_slowDealloc(v21, -1, -1);
    goto LABEL_21;
  }
  v13 = *v10;
  if (*(_QWORD *)(*v10 + 16) && (v14 = sub_100015BBC(0x6469646E65697266, 0xE800000000000000), (v15 & 1) != 0))
  {
    sub_10000B864(*(_QWORD *)(v13 + 56) + 32 * v14, v1 + 192);
    v16 = swift_dynamicCast(v1 + 256, v1 + 192, (char *)&type metadata for Any + 8, &type metadata for String, 6);
    if (v16)
      v17 = *(_QWORD *)(v1 + 256);
    else
      v17 = 0;
    if (v16)
      v18 = *(_QWORD *)(v1 + 264);
    else
      v18 = 0;
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  if (*(_QWORD *)(v13 + 16) && (v31 = sub_100015BBC(0x6552646E65697266, 0xEF64497473657571), (v32 & 1) != 0))
  {
    sub_10000B864(*(_QWORD *)(v13 + 56) + 32 * v31, v1 + 224);
  }
  else
  {
    *(_OWORD *)(v1 + 224) = 0u;
    *(_OWORD *)(v1 + 240) = 0u;
  }
  swift_bridgeObjectRelease(v13);
  if (*(_QWORD *)(v1 + 248))
  {
    v33 = swift_dynamicCast(v1 + 288, v1 + 224, (char *)&type metadata for Any + 8, &type metadata for String, 6);
    if ((_DWORD)v33)
      v34 = *(_QWORD *)(v1 + 288);
    else
      v34 = 0;
    if ((_DWORD)v33)
      v35 = *(_QWORD *)(v1 + 296);
    else
      v35 = 0;
    if (!(v18 | v35))
      goto LABEL_37;
  }
  else
  {
    v33 = sub_10000B9A4(v1 + 224, &qword_100021328);
    v34 = 0;
    v35 = 0;
    if (!v18)
    {
LABEL_37:
      v19 = Logger.logObject.getter(v33);
      v20 = static os_log_type_t.default.getter();
      if (!os_log_type_enabled(v19, v20))
        goto LABEL_21;
      v21 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v21 = 0;
      v22 = "LocationSharingContentService: No friend identifier detected, returning default content.";
      goto LABEL_20;
    }
  }
  v36 = objc_msgSend(*(id *)(v1 + 416), "getHandlesWithPendingOffers");
  if (!v36)
    goto LABEL_47;
  v37 = v36;
  v38 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v36, &type metadata for AnyHashable, &protocol witness table for AnyHashable);

  sub_100014CAC(v38);
  v40 = v39;
  swift_bridgeObjectRelease(v38);
  if (!v40)
    goto LABEL_47;
  v135 = v17;
  v41 = objc_msgSend(*(id *)(v1 + 416), "getHandlesSharingLocationsWithMe");
  if (!v41
    || (v42 = v41,
        v43 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v41, &type metadata for AnyHashable, &protocol witness table for AnyHashable), v42, sub_100014CAC(v43), v45 = v44, swift_bridgeObjectRelease(v43), !v45))
  {
    swift_bridgeObjectRelease(v40);
LABEL_47:
    swift_bridgeObjectRelease(v18);
    v58 = swift_bridgeObjectRelease(v35);
    v19 = Logger.logObject.getter(v58);
    v20 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v19, v20))
      goto LABEL_21;
    v21 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v21 = 0;
    v22 = "LocationSharingContentService: Unable to retrive handles from fmfd.";
    goto LABEL_20;
  }
  v133 = (uint64_t *)(v1 + 336);
  sub_100014FE8(v45, v40);
  v47 = v46;
  v48 = swift_bridgeObjectRetain_n(v46, 2);
  v49 = Logger.logObject.getter(v48);
  v50 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v49, v50))
  {
    logb = v49;
    typeb = v50;
    v51 = (uint8_t *)swift_slowAlloc(12, -1);
    v122 = (os_log_t)swift_slowAlloc(32, -1);
    v137[0] = (uint64_t)v122;
    *(_DWORD *)v51 = 136315138;
    buf = v51;
    v52 = sub_10001701C();
    v53 = sub_100017114(&qword_1000214E8, (uint64_t (*)(uint64_t))sub_10001701C, (uint64_t)&protocol conformance descriptor for NSObject);
    v54 = swift_bridgeObjectRetain(v47);
    v55 = Set.description.getter(v54, v52, v53);
    v57 = v56;
    swift_bridgeObjectRelease(v47);
    *v133 = sub_100015420(v55, v57, v137);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v133, v1 + 344);
    swift_bridgeObjectRelease(v57);
    swift_bridgeObjectRelease_n(v47, 2);
    v49 = logb;
    _os_log_impl((void *)&_mh_execute_header, logb, typeb, "LocationSharingContentService: Found handles: %s", buf, 0xCu);
    swift_arrayDestroy(v122, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v122, -1, -1);
    swift_slowDealloc(buf, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(v47, 2);
  }

  swift_bridgeObjectRetain(v35);
  swift_bridgeObjectRetain(v18);
  sub_100016C14(v47, v135, v18, v34, v35);
  v60 = v59;
  swift_bridgeObjectRelease_n(v35, 2);
  swift_bridgeObjectRelease_n(v18, 2);
  swift_bridgeObjectRelease(v47);
  if (!v60)
  {
    v23 = *(void **)(v1 + 416);
    v77 = *(_QWORD *)(v1 + 368);
    v26 = *(void (**)(void))(v77 + 32);
    v25 = *(_QWORD *)(v77 + 40);
    goto LABEL_22;
  }
  v61 = (uint8_t *)(v1 + 328);
  v62 = *(_QWORD *)(v1 + 384);
  v63 = sub_100011F94();
  v64 = *(NSObject **)(v62 + 16);
  v65 = *(_QWORD *)(v1 + 424);
  v66 = *(_QWORD *)(v1 + 376);
  if ((v63 & 1) != 0)
  {
    ((void (*)(_QWORD, uint64_t, uint64_t))v64)(*(_QWORD *)(v1 + 408), v65, v66);
    v67 = v60;
    v68 = Logger.logObject.getter(v67);
    v69 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v68, v69))
    {
      v87 = *(_QWORD *)(v1 + 408);
      v88 = *(_QWORD *)(v1 + 376);
      v89 = *(_QWORD *)(v1 + 384);

      (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v87, v88);
      goto LABEL_60;
    }
    v70 = (uint8_t *)swift_slowAlloc(12, -1);
    v71 = swift_slowAlloc(32, -1);
    v137[0] = v71;
    *(_DWORD *)v70 = 136315138;
    v72 = objc_msgSend(v67, "identifier");
    if (v72)
    {
      v73 = v72;
      v123 = *(os_log_t *)(v1 + 384);
      *(_QWORD *)typec = *(_QWORD *)(v1 + 376);
      logc = *(os_log_t *)(v1 + 408);
      v74 = static String._unconditionallyBridgeFromObjectiveC(_:)(v72);
      v76 = v75;

      *(_QWORD *)(v1 + 328) = sub_100015420(v74, v76, v137);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 328, v133);
      swift_bridgeObjectRelease(v76);

      _os_log_impl((void *)&_mh_execute_header, v68, v69, "LocationSharingContentService: Handle %s is on block list, ignoring!", v70, 0xCu);
      swift_arrayDestroy(v71, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v71, -1, -1);
      swift_slowDealloc(v70, -1, -1);

      ((void (*)(os_log_t, os_log_type_t *))v123[1].isa)(logc, *(os_log_type_t **)typec);
LABEL_60:
      v23 = *(void **)(v1 + 416);
      v90 = *(_QWORD *)(v1 + 368);
      v92 = *(void (**)(void))(v90 + 32);
      v91 = *(_QWORD *)(v90 + 40);
      v93 = objc_msgSend(objc_allocWithZone((Class)UNNotificationContent), "init", swift_retain(v91).n128_f64[0]);
      v92();

      swift_release(v91);
      goto LABEL_23;
    }

    __break(1u);
    goto LABEL_69;
  }
  ((void (*)(_QWORD, uint64_t, uint64_t))v64)(*(_QWORD *)(v1 + 400), v65, v66);
  v70 = v60;
  v78 = Logger.logObject.getter(v70);
  v79 = static os_log_type_t.default.getter();
  v134 = v1 + 320;
  if (os_log_type_enabled(v78, v79))
  {
    log = v64;
    v80 = (uint8_t *)swift_slowAlloc(12, -1);
    type = swift_slowAlloc(32, -1);
    v137[0] = type;
    *(_DWORD *)v80 = 136315138;
    v81 = -[uint8_t identifier](v70, "identifier");
    if (!v81)
    {
LABEL_69:

      __break(1u);
      goto LABEL_70;
    }
    v82 = v81;
    v118 = *(_QWORD *)(v1 + 384);
    bufa = *(uint8_t **)(v1 + 376);
    v124 = *(os_log_t *)(v1 + 400);
    v83 = static String._unconditionallyBridgeFromObjectiveC(_:)(v81);
    v85 = v84;

    *(_QWORD *)(v1 + 320) = sub_100015420(v83, v85, v137);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v134, v1 + 328);
    swift_bridgeObjectRelease(v85);

    _os_log_impl((void *)&_mh_execute_header, v78, v79, "LocationSharingContentService: Handle %s is **not** on block list, proceeding with alert.", v80, 0xCu);
    swift_arrayDestroy(type, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(type, -1, -1);
    swift_slowDealloc(v80, -1, -1);

    v86 = *(void (**)(os_log_t, uint8_t *))(v118 + 8);
    v86(v124, bufa);
    ((void (*)(_QWORD, _QWORD, _QWORD))log)(*(_QWORD *)(v1 + 392), *(_QWORD *)(v1 + 424), *(_QWORD *)(v1 + 376));
  }
  else
  {
    v94 = *(NSObject **)(v1 + 400);
    v95 = *(uint8_t **)(v1 + 376);
    v96 = *(_QWORD *)(v1 + 384);

    v86 = *(void (**)(os_log_t, uint8_t *))(v96 + 8);
    v86(v94, v95);
    ((void (*)(_QWORD, _QWORD, _QWORD))v64)(*(_QWORD *)(v1 + 392), *(_QWORD *)(v1 + 424), *(_QWORD *)(v1 + 376));
  }
  v61 = v70;
  v97 = Logger.logObject.getter(v61);
  v98 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v97, v98))
  {
    v111 = *(NSObject **)(v1 + 392);
    v112 = *(uint8_t **)(v1 + 376);

    v86(v111, v112);
    goto LABEL_67;
  }
  loga = v98;
  v136 = (void (*)(uint64_t, uint64_t))v86;
  v99 = swift_slowAlloc(22, -1);
  typea = swift_slowAlloc(64, -1);
  v137[0] = typea;
  *(_DWORD *)v99 = 136315394;
  v100 = -[uint8_t identifier](v61, "identifier");
  if (!v100)
  {
LABEL_70:

    __break(1u);
    goto LABEL_71;
  }
  v101 = v100;
  v102 = static String._unconditionallyBridgeFromObjectiveC(_:)(v100);
  v104 = v103;

  *(_QWORD *)(v1 + 304) = sub_100015420(v102, v104, v137);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 304, v1 + 312);
  swift_bridgeObjectRelease(v104);

  *(_WORD *)(v99 + 12) = 2080;
  v105 = -[uint8_t serverId](v61, "serverId");
  if (v105)
  {
    v106 = v105;
    v119 = *(_QWORD *)(v1 + 392);
    v107 = *(_QWORD *)(v1 + 376);
    v108 = static String._unconditionallyBridgeFromObjectiveC(_:)(v105);
    v110 = v109;

    *(_QWORD *)(v1 + 312) = sub_100015420(v108, v110, v137);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 312, v134);
    swift_bridgeObjectRelease(v110);

    _os_log_impl((void *)&_mh_execute_header, v97, loga, "LocationSharingContentService: Found friend with handle %s aka %s", (uint8_t *)v99, 0x16u);
    swift_arrayDestroy(typea, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(typea, -1, -1);
    swift_slowDealloc(v99, -1, -1);

    v136(v119, v107);
LABEL_67:
    v23 = *(void **)(v1 + 416);
    v113 = *(_QWORD *)(v1 + 368);
    v115 = *(void (**)(void))(v113 + 32);
    v114 = *(_QWORD *)(v113 + 40);
    v116 = *(void **)(v5 + 16);
    swift_retain(v114);
    v117 = v116;
    v115();

    swift_release(v114);
    goto LABEL_23;
  }
LABEL_71:

  __break(1u);
}

uint64_t sub_100014A5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  void (*v15)(void);
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + 432);
  swift_willThrow();
  swift_errorRetain(v1);
  v2 = swift_errorRetain(v1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_QWORD *)(v0 + 432);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    swift_errorRetain(v5);
    v8 = _swift_stdlib_bridgeErrorToNSError(v5);
    *(_QWORD *)(v0 + 352) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 352, v0 + 360);
    *v7 = v8;
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "LocationSharingContentService: Failed to force refresh FMF due to: %@ ", v6, 0xCu);
    v9 = sub_10000A5A0(&qword_100021038);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 432);
    swift_errorRelease(v10);
    swift_errorRelease(v10);
  }
  v11 = *(_QWORD *)(v0 + 432);
  v12 = *(void **)(v0 + 416);
  v13 = *(_QWORD **)(v0 + 368);

  v15 = (void (*)(void))v13[4];
  v14 = v13[5];
  v16 = (void *)v13[2];
  swift_retain(v14);
  v17 = v16;
  v15();

  swift_release(v14);
  swift_errorRelease(v11);
  v18 = *(_QWORD *)(v0 + 400);
  v19 = *(_QWORD *)(v0 + 392);
  swift_task_dealloc(*(_QWORD *)(v0 + 408));
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100014C38(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (!a2)
    return swift_continuation_throwingResume(*(_QWORD *)(a1 + 32));
  v4 = sub_10000A5A0(&qword_1000210A0);
  v5 = swift_allocError(v4, &protocol self-conformance witness table for Error, 0, 0);
  *v6 = a2;
  v7 = a2;
  return swift_continuation_throwingResumeWithError(v2, v5);
}

void sub_100014CAC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  NSObject v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  Swift::Int v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  _BYTE v30[40];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_10000A5A0(&qword_1000214F8);
    v3 = (_QWORD *)static _SetStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptySetSingleton;
  }
  v29 = a1 + 56;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 56);
  v28 = (unint64_t)(63 - v4) >> 6;
  v7 = (char *)(v3 + 7);
  swift_bridgeObjectRetain(a1);
  swift_retain(v3);
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v10 = (v6 - 1) & v6;
      v11 = __clz(__rbit64(v6)) | (v8 << 6);
      v12 = v8;
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    if (v13 >= v28)
      goto LABEL_39;
    v14 = *(_QWORD *)(v29 + 8 * v13);
    v12 = v8 + 1;
    if (!v14)
    {
      v12 = v8 + 2;
      if (v8 + 2 >= v28)
        goto LABEL_39;
      v14 = *(_QWORD *)(v29 + 8 * v12);
      if (!v14)
      {
        v12 = v8 + 3;
        if (v8 + 3 >= v28)
          goto LABEL_39;
        v14 = *(_QWORD *)(v29 + 8 * v12);
        if (!v14)
        {
          v12 = v8 + 4;
          if (v8 + 4 >= v28)
            goto LABEL_39;
          v14 = *(_QWORD *)(v29 + 8 * v12);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v10 = (v14 - 1) & v14;
    v11 = __clz(__rbit64(v14)) + (v12 << 6);
LABEL_28:
    sub_10000B828(*(_QWORD *)(a1 + 48) + 40 * v11, (uint64_t)v30);
    v16.isa = AnyHashable._bridgeToObjectiveC()().isa;
    sub_10000A8C4((uint64_t)v30);
    v17 = objc_opt_self(FMFHandle);
    v18 = swift_dynamicCastObjCClass(v16.isa, v17);
    if (!v18)
    {
      swift_release_n(v3, 2);

      sub_10000B8A0(a1);
      return;
    }
    v19 = v18;
    v20 = NSObject._rawHashValue(seed:)(v3[5]);
    v21 = -1 << *((_BYTE *)v3 + 32);
    v22 = v20 & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)]) != 0)
    {
      v9 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)])) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_40;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)&v7[8 * v23];
      }
      while (v27 == -1);
      v9 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)&v7[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    *(_QWORD *)(v3[6] + 8 * v9) = v19;
    ++v3[2];
    v8 = v12;
    v6 = v10;
  }
  v15 = v8 + 5;
  if (v8 + 5 >= v28)
  {
LABEL_39:
    swift_release(v3);
    sub_10000B8A0(a1);
    return;
  }
  v14 = *(_QWORD *)(v29 + 8 * v15);
  if (v14)
  {
    v12 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v12 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v12 >= v28)
      goto LABEL_39;
    v14 = *(_QWORD *)(v29 + 8 * v12);
    ++v15;
    if (v14)
      goto LABEL_27;
  }
LABEL_41:
  __break(1u);
}

void sub_100014FE8(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  int64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26[2];
  _QWORD v27[5];

  v2 = a1;
  v26[1] = a2;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 >= 0)
      a1 &= 0xFFFFFFFFFFFFFF8uLL;
    v3 = __CocoaSet.makeIterator()(a1);
    v4 = sub_10001701C();
    v5 = sub_100017114(&qword_1000214E8, (uint64_t (*)(uint64_t))sub_10001701C, (uint64_t)&protocol conformance descriptor for NSObject);
    a1 = (uint64_t)Set.Iterator.init(_cocoa:)(v27, v3, v4, v5);
    v2 = v27[0];
    v24 = v27[1];
    v6 = v27[2];
    v7 = v27[3];
    v8 = v27[4];
  }
  else
  {
    v7 = 0;
    v9 = -1 << *(_BYTE *)(a1 + 32);
    v24 = a1 + 56;
    v6 = ~v9;
    v10 = -v9;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v8 = v11 & *(_QWORD *)(a1 + 56);
  }
  v12 = (unint64_t)(v6 + 64) >> 6;
  if (v2 < 0)
    goto LABEL_12;
  while (1)
  {
    if (v8)
    {
      v13 = (v8 - 1) & v8;
      v14 = __clz(__rbit64(v8)) | (v7 << 6);
      v15 = v7;
      goto LABEL_31;
    }
    v21 = v7 + 1;
    if (__OFADD__(v7, 1))
      break;
    if (v21 >= v12)
      goto LABEL_34;
    v22 = *(_QWORD *)(v24 + 8 * v21);
    v15 = v7 + 1;
    if (!v22)
    {
      v15 = v7 + 2;
      if (v7 + 2 >= v12)
        goto LABEL_34;
      v22 = *(_QWORD *)(v24 + 8 * v15);
      if (!v22)
      {
        v15 = v7 + 3;
        if (v7 + 3 >= v12)
          goto LABEL_34;
        v22 = *(_QWORD *)(v24 + 8 * v15);
        if (!v22)
        {
          v15 = v7 + 4;
          if (v7 + 4 >= v12)
            goto LABEL_34;
          v22 = *(_QWORD *)(v24 + 8 * v15);
          if (!v22)
          {
            v15 = v7 + 5;
            if (v7 + 5 >= v12)
              goto LABEL_34;
            v22 = *(_QWORD *)(v24 + 8 * v15);
            if (!v22)
            {
              v23 = v7 + 6;
              while (v12 != v23)
              {
                v22 = *(_QWORD *)(v24 + 8 * v23++);
                if (v22)
                {
                  v15 = v23 - 1;
                  goto LABEL_30;
                }
              }
LABEL_34:
              sub_10000B8A0(v2);
              return;
            }
          }
        }
      }
    }
LABEL_30:
    v13 = (v22 - 1) & v22;
    v14 = __clz(__rbit64(v22)) + (v15 << 6);
LABEL_31:
    v20 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v14);
    if (!v20)
      goto LABEL_34;
    while (1)
    {
      sub_100015F84((Swift::Int *)v26, v20);

      v7 = v15;
      v8 = v13;
      if ((v2 & 0x8000000000000000) == 0)
        break;
LABEL_12:
      v16 = __CocoaSet.Iterator.next()(a1);
      if (v16)
      {
        v17 = v16;
        v25 = v16;
        v18 = sub_10001701C();
        swift_unknownObjectRetain(v17, v19);
        swift_dynamicCast(v26, &v25, (char *)&type metadata for Swift.AnyObject + 8, v18, 7);
        v20 = v26[0];
        swift_unknownObjectRelease(v17);
        v15 = v7;
        v13 = v8;
        if (v20)
          continue;
      }
      goto LABEL_34;
    }
  }
  __break(1u);
}

uint64_t type metadata accessor for LocationSharingContentService()
{
  return objc_opt_self(_TtC26FindMyNotificationsService29LocationSharingContentService);
}

uint64_t sub_10001529C()
{
  return sub_1000136D8();
}

uint64_t sub_1000152BC(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1000152CC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100015300(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100015364;
  return v6(a1);
}

uint64_t sub_100015364()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000153B0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v6 = a4();
  v8 = v7;
  v9 = sub_100015420(v6, v7, a3);
  v10 = *a1 + 8;
  v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_100015420(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000154F0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000B864((uint64_t)v12, *a3);
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
      sub_10000B864((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000B8A8(v12);
  return v7;
}

uint64_t sub_1000154F0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_1000156A8(a5, a6);
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

uint64_t sub_1000156A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10001573C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100015914(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100015914(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10001573C(uint64_t a1, unint64_t a2)
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
      v5 = sub_1000158B0(v4, 0);
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

_QWORD *sub_1000158B0(uint64_t a1, uint64_t a2)
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
  v4 = sub_10000A5A0(&qword_1000214F0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100015914(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000A5A0(&qword_1000214F0);
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

_BYTE **sub_100015A60(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_100015A70(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a4();
  v7 = (void *)v6;
  v8 = *a1 + 8;
  if (v6)
    v10 = v6;
  else
    v10 = 0;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11);
  *a1 = v8;
  v9 = *a2;
  if (*a2)
  {
    *v9 = v7;
    *a2 = v9 + 1;
  }
  else
  {

  }
}

unint64_t sub_100015B20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 40);
  v5 = type metadata accessor for UUID(0);
  v6 = sub_100017114(&qword_100021060, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_100015C20(a1, v7);
}

unint64_t sub_100015B8C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100015D60(a1, v4);
}

unint64_t sub_100015BBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100015E24(a1, a2, v5);
}

unint64_t sub_100015C20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  char v15;
  uint64_t v17;
  uint64_t v18;

  v3 = v2;
  v18 = a1;
  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      v14 = sub_100017114(&qword_100021518, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      v15 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v18, v5, v14);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v15 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_100015D60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_10000B828(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10000A8C4((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100015E24(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_100015F04(uint64_t a1, uint64_t a2)
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

uint64_t sub_100015F84(Swift::Int *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  Swift::Int v13;
  Swift::Int v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  void *v22;
  id v23;
  Swift::Int v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  Swift::Int v33;

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

      v32 = v9;
      v10 = sub_10001701C();
      swift_unknownObjectRetain(v9, v11);
      swift_dynamicCast(&v33, &v32, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
      *a1 = v33;
      swift_unknownObjectRelease(v9);
      return 0;
    }
    result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v24 = sub_100016200(v7, result + 1);
    v33 = v24;
    v25 = *(_QWORD *)(v24 + 16);
    if (*(_QWORD *)(v24 + 24) <= v25)
    {
      v30 = v25 + 1;
      v31 = v8;
      sub_1000163E4(v30);
      v26 = v33;
    }
    else
    {
      v26 = v24;
      v27 = v8;
    }
    sub_100015F04((uint64_t)v8, v26);
    v29 = *v3;
    *v3 = v26;
  }
  else
  {
    v13 = *(_QWORD *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    v14 = NSObject._rawHashValue(seed:)(v13);
    v15 = -1 << *(_BYTE *)(v6 + 32);
    v16 = v14 & ~v15;
    if (((*(_QWORD *)(v6 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0)
    {
      sub_10001701C();
      v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v16);
      v18 = static NSObject.== infix(_:_:)();

      if ((v18 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        v22 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v16);
        *a1 = (Swift::Int)v22;
        v23 = v22;
        return 0;
      }
      v19 = ~v15;
      while (1)
      {
        v16 = (v16 + 1) & v19;
        if (((*(_QWORD *)(v6 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
          break;
        v20 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v16);
        v21 = static NSObject.== infix(_:_:)();

        if ((v21 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v33 = *v3;
    *v3 = 0x8000000000000000;
    v8 = a2;
    sub_100016680((uint64_t)v8, v16, isUniquelyReferenced_nonNull_native);
    v29 = *v3;
    *v3 = v33;
  }
  swift_bridgeObjectRelease(v29);
  *a1 = (Swift::Int)v8;
  return 1;
}

Swift::Int sub_100016200(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
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
    sub_10000A5A0(&qword_1000214F8);
    v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    v23 = v4;
    v5 = __CocoaSet.makeIterator()(a1);
    v6 = __CocoaSet.Iterator.next()();
    if (v6)
    {
      v7 = v6;
      v8 = sub_10001701C();
      do
      {
        v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7);
        v4 = v23;
        v16 = *(_QWORD *)(v23 + 16);
        if (*(_QWORD *)(v23 + 24) <= v16)
        {
          sub_1000163E4(v16 + 1);
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

void sub_1000163E4(uint64_t a1)
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
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  Swift::Int v21;
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
  sub_10000A5A0(&qword_1000214F8);
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
    swift_retain(v3);
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v15 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v16 = v15 | (v13 << 6);
      }
      else
      {
        v17 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return;
        }
        if (v17 >= v11)
          goto LABEL_36;
        v18 = v8[v17];
        ++v13;
        if (!v18)
        {
          v13 = v17 + 1;
          if (v17 + 1 >= v11)
            goto LABEL_36;
          v18 = v8[v13];
          if (!v18)
          {
            v13 = v17 + 2;
            if (v17 + 2 >= v11)
              goto LABEL_36;
            v18 = v8[v13];
            if (!v18)
            {
              v19 = v17 + 3;
              if (v19 >= v11)
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
              v18 = v8[v19];
              if (!v18)
              {
                while (1)
                {
                  v13 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_42;
                  if (v13 >= v11)
                    goto LABEL_36;
                  v18 = v8[v13];
                  ++v19;
                  if (v18)
                    goto LABEL_26;
                }
              }
              v13 = v19;
            }
          }
        }
LABEL_26:
        v10 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v13 << 6);
      }
      v20 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v16);
      v21 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = v21 & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v14) = v20;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  swift_release(v3);
  *v2 = v6;
}

void sub_100016680(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  unint64_t v13;
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
    sub_1000163E4(v9);
  }
  else
  {
    if (v8 > v7)
    {
      sub_1000167F4();
      goto LABEL_14;
    }
    sub_10001699C(v9);
  }
  v10 = *v3;
  v11 = NSObject._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v12 = -1 << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v13 = sub_10001701C();
    v14 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
    v15 = static NSObject.== infix(_:_:)();

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
        v18 = static NSObject.== infix(_:_:)();

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

id sub_1000167F4()
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
  sub_10000A5A0(&qword_1000214F8);
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

void sub_10001699C(uint64_t a1)
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
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  Swift::Int v20;
  id v21;
  Swift::Int v22;
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
  sub_10000A5A0(&qword_1000214F8);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    swift_release(v3);
LABEL_38:
    *v2 = v6;
    return;
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
  swift_retain(v3);
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v16 = v15 | (v13 << 6);
      goto LABEL_27;
    }
    v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v11)
      goto LABEL_36;
    v18 = *(_QWORD *)(v8 + 8 * v17);
    ++v13;
    if (!v18)
    {
      v13 = v17 + 1;
      if (v17 + 1 >= v11)
        goto LABEL_36;
      v18 = *(_QWORD *)(v8 + 8 * v13);
      if (!v18)
      {
        v13 = v17 + 2;
        if (v17 + 2 >= v11)
          goto LABEL_36;
        v18 = *(_QWORD *)(v8 + 8 * v13);
        if (!v18)
          break;
      }
    }
LABEL_26:
    v10 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v13 << 6);
LABEL_27:
    v20 = *(_QWORD *)(v6 + 40);
    v21 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v16);
    v22 = NSObject._rawHashValue(seed:)(v20);
    v23 = -1 << *(_BYTE *)(v6 + 32);
    v24 = v22 & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
      v14 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v12 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v14) = v21;
    ++*(_QWORD *)(v6 + 16);
  }
  v19 = v17 + 3;
  if (v19 >= v11)
  {
LABEL_36:
    swift_release_n(v3, 2);
    v2 = v30;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v8 + 8 * v19);
  if (v18)
  {
    v13 = v19;
    goto LABEL_26;
  }
  while (1)
  {
    v13 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v13 >= v11)
      goto LABEL_36;
    v18 = *(_QWORD *)(v8 + 8 * v13);
    ++v19;
    if (v18)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
}

void sub_100016C14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  int64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  int64_t v26;
  int64_t v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v43;
  uint64_t v44;
  uint64_t v47;
  _QWORD v48[5];
  void *v49;

  v5 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v6 = a1;
    else
      v6 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v7 = __CocoaSet.makeIterator()(v6);
    v8 = sub_10001701C();
    v9 = sub_100017114(&qword_1000214E8, (uint64_t (*)(uint64_t))sub_10001701C, (uint64_t)&protocol conformance descriptor for NSObject);
    v10 = Set.Iterator.init(_cocoa:)(v48, v7, v8, v9);
    v5 = v48[0];
    v44 = v48[1];
    v11 = v48[2];
    v12 = v48[3];
    v13 = v48[4];
  }
  else
  {
    v14 = -1 << *(_BYTE *)(a1 + 32);
    v44 = a1 + 56;
    v15 = ~v14;
    v16 = -v14;
    if (v16 < 64)
      v17 = ~(-1 << v16);
    else
      v17 = -1;
    v13 = v17 & *(_QWORD *)(a1 + 56);
    v10 = (_QWORD *)swift_bridgeObjectRetain(a1);
    v11 = v15;
    v12 = 0;
  }
  v40 = v11;
  v43 = (unint64_t)(v11 + 64) >> 6;
  if ((v5 & 0x8000000000000000) == 0)
    goto LABEL_16;
LABEL_11:
  v18 = __CocoaSet.Iterator.next()(v10);
  if (!v18)
    goto LABEL_54;
  v19 = v18;
  v47 = v18;
  v20 = sub_10001701C();
  swift_unknownObjectRetain(v19, v21);
  swift_dynamicCast(&v49, &v47, (char *)&type metadata for Swift.AnyObject + 8, v20, 7);
  v22 = v49;
  swift_unknownObjectRelease(v19);
  v23 = v13;
  if (!v22)
    goto LABEL_54;
  while (1)
  {
    v30 = objc_msgSend(v22, "serverId", v40);
    if (v30)
    {
      v31 = v30;
      v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
      v34 = v33;

      if (a3)
      {
        if (v32 == a2 && v34 == a3)
        {
LABEL_53:
          swift_bridgeObjectRelease(v34);
          goto LABEL_54;
        }
        v35 = _stringCompareWithSmolCheck(_:_:expecting:)(v32, v34, a2, a3, 0);
        swift_bridgeObjectRelease(v34);
        if ((v35 & 1) != 0)
          goto LABEL_54;
      }
      else
      {
        swift_bridgeObjectRelease(v34);
      }
    }
    else if (!a3)
    {
      goto LABEL_54;
    }
    v36 = objc_msgSend(v22, "serverId");
    if (!v36)
    {
      if (!a5)
        goto LABEL_54;
LABEL_15:

      v13 = v23;
      if (v5 < 0)
        goto LABEL_11;
      goto LABEL_16;
    }
    v37 = v36;
    v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v36);
    v34 = v39;

    if (a5)
    {
      if (v38 == a4 && v34 == a5)
        goto LABEL_53;
      v24 = _stringCompareWithSmolCheck(_:_:expecting:)(v38, v34, a4, a5, 0);
      swift_bridgeObjectRelease(v34);
      if ((v24 & 1) != 0)
        goto LABEL_54;
      goto LABEL_15;
    }

    v10 = (_QWORD *)swift_bridgeObjectRelease(v34);
    v13 = v23;
    if (v5 < 0)
      goto LABEL_11;
LABEL_16:
    if (!v13)
      break;
    v23 = (v13 - 1) & v13;
    v25 = __clz(__rbit64(v13)) | (v12 << 6);
LABEL_34:
    v22 = *(id *)(*(_QWORD *)(v5 + 48) + 8 * v25);
    if (!v22)
      goto LABEL_54;
  }
  v26 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    return;
  }
  v27 = v12;
  if (v26 >= v43)
    goto LABEL_54;
  v28 = *(_QWORD *)(v44 + 8 * v26);
  ++v12;
  if (v28)
    goto LABEL_33;
  v12 = v26 + 1;
  if (v26 + 1 >= v43)
    goto LABEL_54;
  v28 = *(_QWORD *)(v44 + 8 * v12);
  if (v28)
    goto LABEL_33;
  v12 = v26 + 2;
  if (v26 + 2 >= v43)
    goto LABEL_54;
  v28 = *(_QWORD *)(v44 + 8 * v12);
  if (v28)
    goto LABEL_33;
  v12 = v26 + 3;
  if (v26 + 3 >= v43)
    goto LABEL_54;
  v28 = *(_QWORD *)(v44 + 8 * v12);
  if (v28)
    goto LABEL_33;
  v12 = v26 + 4;
  if (v26 + 4 >= v43)
    goto LABEL_54;
  v28 = *(_QWORD *)(v44 + 8 * v12);
  if (v28)
  {
LABEL_33:
    v23 = (v28 - 1) & v28;
    v25 = __clz(__rbit64(v28)) + (v12 << 6);
    goto LABEL_34;
  }
  v29 = v27 + 6;
  while (v43 != v29)
  {
    v28 = *(_QWORD *)(v44 + 8 * v29++);
    if (v28)
    {
      v12 = v29 - 1;
      goto LABEL_33;
    }
  }
LABEL_54:
  sub_10000B8A0(v5);
}

unint64_t sub_10001701C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000214E0;
  if (!qword_1000214E0)
  {
    v1 = objc_opt_self(FMFHandle);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000214E0);
  }
  return result;
}

uint64_t sub_10001705C()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100017088()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc(dword_100021504);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10000B95C;
  v2 = (_QWORD *)swift_task_alloc(dword_100021424);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_10000BA74;
  return sub_1000138F4();
}

uint64_t sub_1000170F0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100017114(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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
