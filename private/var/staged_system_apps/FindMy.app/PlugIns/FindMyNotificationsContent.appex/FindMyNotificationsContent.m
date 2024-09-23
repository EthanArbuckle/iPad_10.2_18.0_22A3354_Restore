uint64_t sub_100002868()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100007114(v0, qword_10001B028);
  sub_1000070B8(v0, (uint64_t)qword_10001B028);
  return Logger.init(subsystem:category:)(0xD000000000000024, 0x8000000100010160, 95, 0xE100000000000000);
}

void sub_1000028D0()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *Strong;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t ObjCClassFromMetadata;
  NSString v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSString v23;
  objc_super v24;

  v24.receiver = v0;
  v24.super_class = (Class)type metadata accessor for NotificationViewController();
  objc_msgSendSuper2(&v24, "viewDidLoad");
  v1 = objc_msgSend(objc_allocWithZone((Class)FMFSession), "initWithDelegate:", v0);
  v2 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fmfSession];
  *(_QWORD *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fmfSession] = v1;

  v3 = objc_msgSend(v0, "view");
  if (v3)
  {
    v4 = v3;
    v5 = type metadata accessor for NotificationView();
    v6 = swift_dynamicCastClass(v4, v5);
    if (!v6)
    {
LABEL_9:

      return;
    }
    v7 = v6 + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_mapView;
    Strong = (void *)swift_unknownObjectWeakLoadStrong(v6 + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_mapView);
    if (Strong)
    {
      v9 = Strong;
      objc_msgSend(Strong, "setScrollEnabled:", 1);

      v10 = (void *)swift_unknownObjectWeakLoadStrong(v7);
      if (v10)
      {
        v11 = v10;
        objc_msgSend(v10, "setZoomEnabled:", 1);

        v12 = (void *)swift_unknownObjectWeakLoadStrong(v7);
        if (v12)
        {
          v13 = v12;
          objc_msgSend(v12, "setDelegate:", v0);

          v14 = swift_unknownObjectWeakLoadStrong(v7);
          if (v14)
          {
            v15 = (void *)v14;
            v16 = sub_100007244(0, &qword_10001AA90, MKAnnotationView_ptr);
            ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v16);
            v18 = String._bridgeToObjectiveC()();
            objc_msgSend(v15, "registerClass:forAnnotationViewWithReuseIdentifier:", ObjCClassFromMetadata, v18);

            v19 = swift_unknownObjectWeakLoadStrong(v7);
            if (v19)
            {
              v20 = (void *)v19;
              v21 = type metadata accessor for FMPersonAnnotationView();
              v22 = swift_getObjCClassFromMetadata(v21);
              v23 = String._bridgeToObjectiveC()();
              objc_msgSend(v20, "registerClass:forAnnotationViewWithReuseIdentifier:", v22, v23);

              v4 = v23;
              goto LABEL_9;
            }
LABEL_15:
            __break(1u);
            return;
          }
LABEL_14:
          __break(1u);
          goto LABEL_15;
        }
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_13;
  }
}

void sub_100002B1C(char a1)
{
  char *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *Strong;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for NotificationViewController();
  objc_msgSendSuper2(&v12, "viewDidDisappear:", a1 & 1);
  v3 = objc_msgSend(v1, "view");
  if (v3)
  {
    v4 = v3;
    v5 = type metadata accessor for NotificationView();
    v6 = swift_dynamicCastClass(v4, v5);
    if (v6)
    {
      Strong = (void *)swift_unknownObjectWeakLoadStrong(v6 + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_mapView);
      if (!Strong)
      {
        __break(1u);
        return;
      }
      v8 = Strong;
      objc_msgSend(Strong, "removeFromSuperview");

      v4 = v8;
    }

  }
  v9 = OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fmfSession;
  v10 = *(void **)&v1[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fmfSession];
  if (v10)
  {
    objc_msgSend(v10, "setDelegate:", 0);
    v11 = *(void **)&v1[v9];
  }
  else
  {
    v11 = 0;
  }
  *(_QWORD *)&v1[v9] = 0;

}

void sub_100002C48(void *a1)
{
  char *v1;
  char *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  char *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  id v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  char *v64;
  uint64_t v65;
  os_log_type_t type;
  void *v67;
  void *v68;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72[4];

  v2 = v1;
  v3 = objc_msgSend(a1, "request");
  v4 = objc_msgSend(v3, "content");

  v5 = objc_msgSend(v4, "userInfo");
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v7 = sub_1000032AC(v6);
  swift_bridgeObjectRelease(v6);
  if (v7)
  {
    v8 = objc_msgSend(a1, "request");
    v9 = objc_msgSend(v8, "content");

    v10 = objc_msgSend(v9, "body");
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    v13 = v12;

    v14 = (uint64_t *)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_defaultNotificationText];
    v15 = *(_QWORD *)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_defaultNotificationText
                       + 8];
    *v14 = v11;
    v14[1] = v13;
    swift_bridgeObjectRelease(v15);
    if (*(_QWORD *)(v7 + 16)
      && (v16 = sub_100007C2C(0x6F4C796150666D66, 0xEA00000000006461), (v17 & 1) != 0)
      && (sub_100006FEC(*(_QWORD *)(v7 + 56) + 32 * v16, (uint64_t)v72),
          swift_dynamicCast(&v70, v72, (char *)&type metadata for Any + 8, &type metadata for String, 6)))
    {
      swift_bridgeObjectRelease(v71);
      v18 = 1;
    }
    else
    {
      v18 = 0;
    }
    v19 = (void *)sub_1000063A4(v7, v18);
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "coordinate");
    }
    else
    {
      v21 = 0;
      v22 = 0;
    }
    v27 = &v2[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fenceTriggerLocationCoordinates];
    *(_QWORD *)v27 = v21;
    *((_QWORD *)v27 + 1) = v22;
    v27[16] = v20 == 0;
    v28 = (void *)sub_1000036D0(v7, v18);
    v29 = (void *)sub_1000039B8(v7, v18, a1);
    if (qword_10001A7A0 != -1)
      swift_once(&qword_10001A7A0, sub_100002868);
    v30 = type metadata accessor for Logger(0);
    sub_1000070B8(v30, (uint64_t)qword_10001B028);
    v31 = v28;
    v32 = v20;
    v33 = v29;
    v34 = v31;
    v35 = v32;
    v36 = v33;
    v37 = Logger.logObject.getter();
    type = static os_log_type_t.default.getter();
    v65 = (uint64_t)v29;
    v68 = v34;
    if (os_log_type_enabled(v37, type))
    {
      v67 = v36;
      v38 = swift_slowAlloc(32, -1);
      v62 = swift_slowAlloc(96, -1);
      v72[0] = v62;
      *(_DWORD *)v38 = 136315650;
      v70 = (uint64_t)v20;
      v63 = v28;
      v39 = v35;
      v61 = sub_100006ED8(&qword_10001AA60);
      v64 = v2;
      v40 = String.init<A>(describing:)(&v70, v61);
      v41 = v34;
      v43 = v42;
      v70 = sub_100005D64(v40, v42, v72);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v38 + 4, v38 + 12);

      swift_bridgeObjectRelease(v43);
      *(_WORD *)(v38 + 12) = 2080;
      v70 = (uint64_t)v29;
      v44 = v67;
      v45 = sub_100006ED8(&qword_10001AA68);
      v46 = String.init<A>(describing:)(&v70, v45);
      v48 = v47;
      v70 = sub_100005D64(v46, v47, v72);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v38 + 14, v38 + 22);

      v49 = v48;
      v28 = v63;
      swift_bridgeObjectRelease(v49);
      *(_WORD *)(v38 + 22) = 2080;
      v70 = (uint64_t)v63;
      v50 = v41;
      v51 = String.init<A>(describing:)(&v70, v61);
      v53 = v52;
      v70 = sub_100005D64(v51, v52, v72);
      v2 = v64;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v38 + 24, v38 + 32);

      swift_bridgeObjectRelease(v53);
      _os_log_impl((void *)&_mh_execute_header, v37, type, "fence trigger location [%s], contact [%s], fence location [%s] for notification", (uint8_t *)v38, 0x20u);
      swift_arrayDestroy(v62, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v62, -1, -1);
      v54 = v38;
      v36 = v67;
      swift_slowDealloc(v54, -1, -1);

    }
    else
    {

    }
    v55 = v35;
    v56 = objc_msgSend(v2, "view");
    if (v56)
    {
      v57 = v56;
      v58 = type metadata accessor for NotificationView();
      v59 = (char *)swift_dynamicCastClass(v57, v58);
      if (v59)
      {
        v60 = v59;
        sub_100003D04(a1, v59, v7, v20 != 0);
        swift_bridgeObjectRelease(v7);
        sub_100006624(v28, (uint64_t)v60);
        sub_10000496C(v20, v65, (uint64_t)v60);
        sub_100006834(v28, v20, v60);

        return;
      }

    }
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    if (qword_10001A7A0 != -1)
      swift_once(&qword_10001A7A0, sub_100002868);
    v23 = type metadata accessor for Logger(0);
    sub_1000070B8(v23, (uint64_t)qword_10001B028);
    v24 = Logger.logObject.getter();
    v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "User info is not available in notification", v26, 2u);
      swift_slowDealloc(v26, -1, -1);
    }

    sub_100004C68();
  }
}

unint64_t sub_1000032AC(uint64_t a1)
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
    sub_100006ED8(&qword_10001AA80);
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
        sub_10000722C(a1);
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
    sub_1000071B4(*(_QWORD *)(a1 + 48) + 40 * v12, (uint64_t)v37);
    sub_100006FEC(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v38 + 8);
    v35[0] = v38[0];
    v35[1] = v38[1];
    v36 = v39;
    v34[0] = v37[0];
    v34[1] = v37[1];
    sub_1000071B4((uint64_t)v34, (uint64_t)v29);
    if (!swift_dynamicCast(&v27, v29, &type metadata for AnyHashable, &type metadata for String, 6))
    {
      v27 = 0;
      v28 = 0;
      sub_1000071F0((uint64_t)v34, &qword_10001AA88);
      swift_bridgeObjectRelease(v28);
      sub_10000722C(a1);
      swift_release(v3);
      return 0;
    }
    v17 = v27;
    v18 = v28;
    sub_100006FEC((uint64_t)v35 + 8, (uint64_t)v29);
    sub_1000071F0((uint64_t)v34, &qword_10001AA88);
    sub_100007234(v29, v30);
    *(_QWORD *)&v31 = v17;
    *((_QWORD *)&v31 + 1) = v18;
    sub_100007234(v30, v32);
    v19 = v31;
    sub_100007234(v32, v33);
    sub_100007234(v33, &v31);
    result = sub_100007C2C(v19, *((uint64_t *)&v19 + 1));
    v20 = result;
    if ((v21 & 1) != 0)
    {
      v9 = v3[6] + 16 * result;
      swift_bridgeObjectRelease(*(_QWORD *)(v9 + 8));
      *(_OWORD *)v9 = v19;
      v10 = (_QWORD *)(v3[7] + 32 * v20);
      sub_100007154(v10);
      result = (unint64_t)sub_100007234(&v31, v10);
      goto LABEL_8;
    }
    if (v3[2] >= v3[3])
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v3[6] + 16 * result) = v19;
    result = (unint64_t)sub_100007234(&v31, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_1000036D0(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD v21[2];
  __int128 v22;
  __int128 v23;

  if ((a2 & 1) != 0)
    v2 = 0xE800000000000000;
  else
    v2 = 0xED00006E6F697461;
  if (!*(_QWORD *)(a1 + 16)
    || ((a2 & 1) == 0 ? (v4 = 0x636F4C65636E6566) : (v4 = 0x6E6F697461636F6CLL),
        v5 = sub_100007C2C(v4, v2),
        (v6 & 1) == 0))
  {
    v22 = 0u;
    v23 = 0u;
    swift_bridgeObjectRelease(v2);
    goto LABEL_18;
  }
  sub_100006FEC(*(_QWORD *)(a1 + 56) + 32 * v5, (uint64_t)&v22);
  swift_bridgeObjectRelease(v2);
  if (!*((_QWORD *)&v23 + 1))
  {
LABEL_18:
    sub_1000071F0((uint64_t)&v22, &qword_10001AA48);
    goto LABEL_19;
  }
  if ((swift_dynamicCast(v21, &v22, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) == 0)
  {
LABEL_19:
    if (qword_10001A7A0 != -1)
      swift_once(&qword_10001A7A0, sub_100002868);
    v15 = type metadata accessor for Logger(0);
    sub_1000070B8(v15, (uint64_t)qword_10001B028);
    v16 = Logger.logObject.getter();
    v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Location is not available in notification", v18, 2u);
      swift_slowDealloc(v18, -1, -1);
    }

    sub_100004C68();
    return 0;
  }
  v7 = v21[0];
  v8 = v21[1];
  sub_100007244(0, &qword_10001AA50, NSKeyedUnarchiver_ptr);
  v9 = sub_100007244(0, &qword_10001AA58, CLLocation_ptr);
  v10 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)(v9, v7, v8, v9);
  v19 = v10;
  if (v10)
  {
    sub_1000070D0(v7, v8);
    return v19;
  }
  if (qword_10001A7A0 != -1)
    swift_once(&qword_10001A7A0, sub_100002868);
  v11 = type metadata accessor for Logger(0);
  sub_1000070B8(v11, (uint64_t)qword_10001B028);
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Error decoding fence locations data", v14, 2u);
    swift_slowDealloc(v14, -1, -1);
  }

  sub_100004C68();
  sub_1000070D0(v7, v8);
  return 0;
}

uint64_t sub_1000039B8(uint64_t a1, char a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v7;
  char v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];
  __int128 v31;
  __int128 v32;
  _OWORD v33[2];

  if ((a2 & 1) != 0)
    return 0;
  v4 = v3;
  if (*(_QWORD *)(a1 + 16) && (v7 = sub_100007C2C(0x6148646E65697266, 0xEC000000656C646ELL), (v8 & 1) != 0))
    sub_100006FEC(*(_QWORD *)(a1 + 56) + 32 * v7, (uint64_t)v33);
  else
    memset(v33, 0, sizeof(v33));
  v9 = objc_msgSend(a3, "request");
  v10 = objc_msgSend(v9, "content");

  v11 = objc_msgSend(v10, "categoryIdentifier");
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v14 = v13;

  if (v12 == 0xD000000000000010 && v14 == 0x8000000100010090)
  {
    swift_bridgeObjectRelease(0x8000000100010090);
  }
  else
  {
    v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v14, 0xD000000000000010, 0x8000000100010090, 0);
    swift_bridgeObjectRelease(v14);
    if ((v15 & 1) == 0)
      goto LABEL_15;
  }
  v16 = objc_msgSend(objc_allocWithZone((Class)ACAccountStore), "init");
  v17 = objc_msgSend(v16, "aa_primaryAppleAccount");

  if (v17 && (v18 = objc_msgSend(v17, "username"), v17, v18))
  {
    v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    v21 = v20;

    *((_QWORD *)&v32 + 1) = &type metadata for String;
    *(_QWORD *)&v31 = v19;
    *((_QWORD *)&v31 + 1) = v21;
    sub_1000071F0((uint64_t)v33, &qword_10001AA48);
  }
  else
  {
    sub_1000071F0((uint64_t)v33, &qword_10001AA48);
    v31 = 0u;
    v32 = 0u;
  }
  sub_100007070((uint64_t)&v31, (uint64_t)v33);
LABEL_15:
  sub_100007028((uint64_t)v33, (uint64_t)&v31);
  if (!*((_QWORD *)&v32 + 1))
  {
    sub_1000071F0((uint64_t)&v31, &qword_10001AA48);
    goto LABEL_26;
  }
  if ((swift_dynamicCast(v30, &v31, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
  {
LABEL_26:
    sub_1000071F0((uint64_t)v33, &qword_10001AA48);
    return 0;
  }
  v22 = v30[0];
  v23 = v30[1];
  v24 = *(_QWORD *)(v4 + OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_contactsDataController);
  swift_retain(v24);
  v25 = dispatch thunk of FMFContactsDataController.searchInStore(handle:keysToFetch:)(v22, v23, 0);
  swift_release(v24);
  result = swift_bridgeObjectRelease(v23);
  if (!v25)
  {
    v27 = 0;
    goto LABEL_30;
  }
  if ((unint64_t)v25 >> 62)
  {
    if (v25 >= 0)
      v29 = v25 & 0xFFFFFFFFFFFFFF8;
    else
      v29 = v25;
    swift_bridgeObjectRetain(v25);
    v27 = _CocoaArrayWrapper.endIndex.getter(v29);
    result = swift_bridgeObjectRelease(v25);
    if (!v27)
      goto LABEL_24;
  }
  else
  {
    v27 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v27)
    {
LABEL_24:
      swift_bridgeObjectRelease(v25);
LABEL_30:
      sub_1000071F0((uint64_t)v33, &qword_10001AA48);
      return v27;
    }
  }
  if ((v25 & 0xC000000000000001) != 0)
  {
    v28 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v25);
    goto LABEL_23;
  }
  if (*(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v28 = *(id *)(v25 + 32);
LABEL_23:
    v27 = (uint64_t)v28;
    goto LABEL_24;
  }
  __break(1u);
  return result;
}

void sub_100003D04(void *a1, char *a2, uint64_t a3, int a4)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  Class isa;
  void (*v21)(char *, uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  void (*v26)(char *, char *, uint64_t);
  id v27;
  char *v28;
  Class v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  void *v43;
  uint64_t Strong;
  void *v45;
  id v46;
  id v47;
  NSString v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  id v53;
  Swift::String v54;
  Swift::String_optional v55;
  Swift::String v56;
  Swift::String v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  char *v77;
  Class v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  Swift::String v85;
  Swift::String_optional v86;
  Swift::String v87;
  Swift::String v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  Swift::String v97;
  Swift::String_optional v98;
  Swift::String v99;
  Swift::String v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  int v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  char v113[8];
  uint64_t v114;
  _BYTE v115[32];
  Swift::String v116;
  Swift::String v117;
  Swift::String v118;

  v110 = a3;
  v108 = a4;
  v112 = a2;
  v109 = a1;
  v4 = type metadata accessor for PersonNameComponents(0);
  v105 = *(_QWORD *)(v4 - 8);
  v106 = v4;
  ((void (*)(void))__chkstk_darwin)();
  v107 = (char *)&v105 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006ED8(&qword_10001AA30);
  ((void (*)(void))__chkstk_darwin)();
  v7 = (char *)&v105 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  v12 = (char *)&v105 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v105 - v13;
  v15 = type metadata accessor for TimeZone(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v105 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = (char *)objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
  static TimeZone.autoupdatingCurrent.getter();
  isa = TimeZone._bridgeToObjectiveC()().super.isa;
  v21 = *(void (**)(char *, uint64_t))(v16 + 8);
  v22 = v109;
  v21(v18, v15);
  objc_msgSend(v19, "setTimeZone:", isa);

  objc_msgSend(v19, "setTimeStyle:", 1);
  v23 = objc_msgSend(v22, "request");
  v24 = objc_msgSend(v23, "content");

  v25 = objc_msgSend(v24, "date");
  if (!v25)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
    goto LABEL_5;
  }
  static Date._unconditionallyBridgeFromObjectiveC(_:)(v25);

  v26 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v26(v7, v12, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
LABEL_5:
    v27 = objc_msgSend(v22, "date");
    static Date._unconditionallyBridgeFromObjectiveC(_:)(v27);

    sub_1000071F0((uint64_t)v7, &qword_10001AA30);
    goto LABEL_6;
  }
  v26(v14, v7, v8);
LABEL_6:
  v28 = v112;
  v29 = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  v30 = objc_msgSend(v19, "stringFromDate:", v29);

  v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
  v33 = v32;

  v34 = objc_msgSend(v22, "request");
  v35 = objc_msgSend(v34, "content");

  v36 = objc_msgSend(v35, "categoryIdentifier");
  v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v36);
  v39 = v38;

  v40 = v110;
  if (*(_QWORD *)(v110 + 16))
  {
    v41 = sub_100007C2C(0x6F4C796150666D66, 0xEA00000000006461);
    if ((v42 & 1) != 0)
    {
      sub_100006FEC(*(_QWORD *)(v40 + 56) + 32 * v41, (uint64_t)v115);
      if ((swift_dynamicCast(v113, v115, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
      {
        swift_bridgeObjectRelease(v114);
        v43 = (void *)sub_1000039B8(v40, 1, v22);
LABEL_14:
        swift_bridgeObjectRelease(v39);
        swift_bridgeObjectRelease(v33);
        Strong = swift_unknownObjectWeakLoadStrong(&v28[OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_notificationBodyLabel]);
        if (!Strong)
        {
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
        v45 = (void *)Strong;
        v46 = objc_msgSend(v22, "request");
        v47 = objc_msgSend(v46, "content");

        v48 = objc_msgSend(v47, "body");
        if (v48)
          goto LABEL_21;
        static String._unconditionallyBridgeFromObjectiveC(_:)(0);
        v50 = v49;
LABEL_20:
        v48 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v50);
LABEL_21:
        objc_msgSend(v45, "setText:", v48);
LABEL_22:

        v61 = (void *)swift_unknownObjectWeakLoadStrong(&v28[OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_notificationBodyLabel]);
        if (v61)
        {
          v62 = v61;
          objc_msgSend(v61, "sizeToFit");

          return;
        }
        __break(1u);
        goto LABEL_36;
      }
    }
  }
  v43 = (void *)sub_1000039B8(v40, 0, v22);
  if ((v108 & 1) == 0)
    goto LABEL_14;
  if (v37 == 0xD000000000000010 && v39 == 0x8000000100010090)
  {
    swift_bridgeObjectRelease(0x8000000100010090);
LABEL_18:
    v52 = swift_unknownObjectWeakLoadStrong(&v28[OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_notificationBodyLabel]);
    if (!v52)
    {
LABEL_37:
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    v45 = (void *)v52;
    v53 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v54._countAndFlagsBits = 0xD00000000000002BLL;
    v116._object = (void *)0xE000000000000000;
    v54._object = (void *)0x8000000100010130;
    v55.value._object = (void *)0x80000001000100E0;
    v55.value._countAndFlagsBits = 0xD000000000000012;
    v56._countAndFlagsBits = 0;
    v56._object = (void *)0xE000000000000000;
    v116._countAndFlagsBits = 0;
    v57 = NSLocalizedString(_:tableName:bundle:value:comment:)(v54, v55, (NSBundle)v53, v56, v116);

    v58 = sub_100006ED8(&qword_10001AA38);
    v59 = swift_allocObject(v58, 72, 7);
    *(_OWORD *)(v59 + 16) = xmmword_10000F5B0;
    *(_QWORD *)(v59 + 56) = &type metadata for String;
    *(_QWORD *)(v59 + 64) = sub_100006FA8();
    *(_QWORD *)(v59 + 32) = v31;
    *(_QWORD *)(v59 + 40) = v33;
    String.init(format:_:)(v57._countAndFlagsBits, v57._object, v59);
    v50 = v60;
    swift_bridgeObjectRelease(v57._object);
    goto LABEL_20;
  }
  v51 = _stringCompareWithSmolCheck(_:_:expecting:)(v37, v39, 0xD000000000000010, 0x8000000100010090, 0);
  swift_bridgeObjectRelease(v39);
  if ((v51 & 1) != 0)
    goto LABEL_18;
  if (v43)
  {
    v111 = v31;
    v63 = v43;
    PersonNameComponents.init()();
    if (objc_msgSend(v63, "isKeyAvailable:", CNContactNicknameKey))
    {
      v64 = objc_msgSend(v63, "nickname");
      v65 = static String._unconditionallyBridgeFromObjectiveC(_:)(v64);
      v67 = v66;

      PersonNameComponents.nickname.setter(v65, v67);
    }
    if (objc_msgSend(v63, "isKeyAvailable:", CNContactGivenNameKey))
    {
      v68 = objc_msgSend(v63, "givenName");
      v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(v68);
      v71 = v70;

      PersonNameComponents.givenName.setter(v69, v71);
    }
    v112 = v19;
    if (objc_msgSend(v63, "isKeyAvailable:", CNContactFamilyNameKey))
    {
      v72 = objc_msgSend(v63, "familyName");
      v73 = static String._unconditionallyBridgeFromObjectiveC(_:)(v72);
      v75 = v74;

      PersonNameComponents.familyName.setter(v73, v75);
    }
    v76 = (void *)objc_opt_self(NSPersonNameComponentsFormatter);
    v77 = v107;
    v78 = PersonNameComponents._bridgeToObjectiveC()().super.isa;
    v79 = objc_msgSend(v76, "localizedStringFromPersonNameComponents:style:options:", v78, 1, 0);

    v80 = static String._unconditionallyBridgeFromObjectiveC(_:)(v79);
    v82 = v81;

    (*(void (**)(char *, uint64_t))(v105 + 8))(v77, v106);
    v83 = swift_unknownObjectWeakLoadStrong(&v28[OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_notificationBodyLabel]);
    if (!v83)
      goto LABEL_38;
    v45 = (void *)v83;
    v84 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v85._countAndFlagsBits = 0xD00000000000002DLL;
    v117._object = (void *)0xE000000000000000;
    v85._object = (void *)0x8000000100010100;
    v86.value._object = (void *)0x80000001000100E0;
    v86.value._countAndFlagsBits = 0xD000000000000012;
    v87._countAndFlagsBits = 0;
    v87._object = (void *)0xE000000000000000;
    v117._countAndFlagsBits = 0;
    v88 = NSLocalizedString(_:tableName:bundle:value:comment:)(v85, v86, (NSBundle)v84, v87, v117);

    v89 = sub_100006ED8(&qword_10001AA38);
    v90 = swift_allocObject(v89, 112, 7);
    *(_OWORD *)(v90 + 16) = xmmword_10000F5A0;
    *(_QWORD *)(v90 + 56) = &type metadata for String;
    v91 = sub_100006FA8();
    *(_QWORD *)(v90 + 32) = v80;
    *(_QWORD *)(v90 + 40) = v82;
    *(_QWORD *)(v90 + 96) = &type metadata for String;
    *(_QWORD *)(v90 + 104) = v91;
    v92 = v111;
    *(_QWORD *)(v90 + 64) = v91;
    *(_QWORD *)(v90 + 72) = v92;
    *(_QWORD *)(v90 + 80) = v33;
    String.init(format:_:)(v88._countAndFlagsBits, v88._object, v90);
    v94 = v93;
    swift_bridgeObjectRelease(v88._object);
    v48 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v94);
    objc_msgSend(v45, "setText:", v48);
    v19 = v112;
    goto LABEL_22;
  }
  v95 = swift_unknownObjectWeakLoadStrong(&v28[OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_notificationBodyLabel]);
  if (v95)
  {
    v45 = (void *)v95;
    v96 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v97._countAndFlagsBits = 0xD00000000000002ELL;
    v118._object = (void *)0xE000000000000000;
    v97._object = (void *)0x80000001000100B0;
    v98.value._object = (void *)0x80000001000100E0;
    v98.value._countAndFlagsBits = 0xD000000000000012;
    v99._countAndFlagsBits = 0;
    v99._object = (void *)0xE000000000000000;
    v118._countAndFlagsBits = 0;
    v100 = NSLocalizedString(_:tableName:bundle:value:comment:)(v97, v98, (NSBundle)v96, v99, v118);

    v101 = sub_100006ED8(&qword_10001AA38);
    v102 = swift_allocObject(v101, 72, 7);
    *(_OWORD *)(v102 + 16) = xmmword_10000F5B0;
    *(_QWORD *)(v102 + 56) = &type metadata for String;
    *(_QWORD *)(v102 + 64) = sub_100006FA8();
    *(_QWORD *)(v102 + 32) = v31;
    *(_QWORD *)(v102 + 40) = v33;
    String.init(format:_:)(v100._countAndFlagsBits, v100._object, v102);
    v104 = v103;
    swift_bridgeObjectRelease(v100._object);
    v48 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v104);
    objc_msgSend(v45, "setText:", v48);
    v43 = 0;
    goto LABEL_22;
  }
LABEL_39:
  __break(1u);
}

void sub_1000047A4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;
  uint64_t v12;
  NSString v13;
  id v14;

  if (a2)
    return;
  if (!a1)
    goto LABEL_15;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 >= 0)
      v12 = a1 & 0xFFFFFFFFFFFFFF8;
    else
      v12 = a1;
    swift_bridgeObjectRetain(a1);
    if (_CocoaArrayWrapper.endIndex.getter(v12))
      goto LABEL_5;
LABEL_14:
    swift_bridgeObjectRelease(a1);
    goto LABEL_15;
  }
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  if (!v5)
    goto LABEL_14;
LABEL_5:
  if ((a1 & 0xC000000000000001) != 0)
  {
    v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
LABEL_8:
    v7 = v6;
    swift_bridgeObjectRelease(a1);
    v8 = objc_msgSend(v7, "name");

    if (v8)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
      v10 = v9;

      v13 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v10);
      v11 = v13;
LABEL_16:
      v14 = v11;
      objc_msgSend(a3, "setTitle:");

      return;
    }
LABEL_15:
    v11 = 0;
    goto LABEL_16;
  }
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v6 = *(id *)(a1 + 32);
    goto LABEL_8;
  }
  __break(1u);
}

uint64_t sub_1000048E0(uint64_t a1, uint64_t a2, void *a3)
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
    v7 = sub_100007244(0, &qword_10001AA78, CLPlacemark_ptr);
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v7);
  }
  swift_retain(v5);
  v8 = a3;
  v6(v4, a3);
  swift_release(v5);

  return swift_bridgeObjectRelease(v4);
}

void sub_10000496C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *Strong;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;

  v7 = sub_100006ED8(&qword_10001AA28);
  __chkstk_darwin(v7);
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v10 = *(void **)(v3 + OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_monogrammer);
    if (a2)
    {
      if (!v10)
      {
        v15 = a1;
        v14 = 0;
LABEL_8:
        objc_msgSend(a1, "coordinate");
        v17 = v16;
        v19 = v18;
        objc_msgSend(a1, "horizontalAccuracy");
        v21 = v20;
        v22 = type metadata accessor for FMFFriend(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v9, 1, 1, v22);
        v23 = objc_allocWithZone((Class)type metadata accessor for FMPersonAnnotation(0));
        v24 = v14;
        v25 = (void *)sub_100008A60((uint64_t)v9, v14, 0, v17, v19, v21);

        v26 = a3 + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_mapView;
        Strong = (void *)swift_unknownObjectWeakLoadStrong(v26);
        if (Strong)
        {
          v28 = Strong;
          objc_msgSend(Strong, "addAnnotation:", v25);

          objc_msgSend(a1, "coordinate");
          v30 = v29;
          v32 = v31;
          objc_msgSend(a1, "horizontalAccuracy");
          v34 = objc_msgSend((id)objc_opt_self(MKCircle), "circleWithCenterCoordinate:radius:", v30, v32, v33);
          v35 = swift_unknownObjectWeakLoadStrong(v26);
          if (v35)
          {
            v36 = (void *)v35;
            v37 = v34;
            objc_msgSend(v36, "addOverlay:", v37);

            return;
          }
        }
        else
        {

          __break(1u);
        }

        __break(1u);
        return;
      }
      v11 = a1;
      v12 = objc_msgSend(v10, "monogramForContact:", a2);
    }
    else
    {
      v13 = a1;
      v12 = objc_msgSend(v10, "silhouetteMonogram");
    }
    v14 = v12;
    goto LABEL_8;
  }
}

void sub_100004BC0(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *Strong;
  id v10;

  Strong = (void *)swift_unknownObjectWeakLoadStrong(a1 + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_mapView);
  if (Strong)
  {
    v10 = Strong;
    objc_msgSend(Strong, "setRegion:animated:", 0, a2, a3, a4, a5);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100004C3C(uint64_t a1)
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

uint64_t sub_100004C68()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[5];
  uint64_t v22;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v20 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007244(0, &qword_10001A9F8, OS_dispatch_queue_ptr);
  v9 = (void *)static OS_dispatch_queue.main.getter();
  v10 = swift_allocObject(&unk_100014AA0, 24, 7);
  *(_QWORD *)(v10 + 16) = v0;
  aBlock[4] = sub_100006EB8;
  v22 = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100004C3C;
  aBlock[3] = &unk_100014AB8;
  v11 = _Block_copy(aBlock);
  v12 = v22;
  v13 = v1;
  v14 = swift_release(v12);
  static DispatchQoS.unspecified.getter(v14);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v15 = sub_100005A50(&qword_10001AA00, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v16 = sub_100006ED8(&qword_10001AA08);
  v17 = sub_100006F18();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v16, v17, v2, v15);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v4, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_100004E64(char *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *Strong;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  Class isa;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSString v25;
  void *v26;
  void *v27;
  id v28;
  id v29;

  v2 = objc_msgSend(a1, "view");
  if (v2)
  {
    v28 = v2;
    v3 = type metadata accessor for NotificationView();
    v4 = swift_dynamicCastClass(v28, v3);
    if (!v4)
    {

      return;
    }
    v5 = v4;
    v6 = v4 + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_mapView;
    Strong = (void *)swift_unknownObjectWeakLoadStrong(v4 + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_mapView);
    if (Strong)
    {
      v8 = Strong;
      objc_msgSend(Strong, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v9 = sub_100006ED8(&qword_10001AA18);
      v10 = swift_allocObject(v9, 48, 7);
      *(_OWORD *)(v10 + 16) = xmmword_10000F5C0;
      v11 = (void *)swift_unknownObjectWeakLoadStrong(v6);
      if (v11)
      {
        v12 = v11;
        v13 = objc_msgSend(v11, "widthAnchor");

        v14 = objc_msgSend(v13, "constraintEqualToConstant:", 0.0);
        *(_QWORD *)(v10 + 32) = v14;
        v15 = swift_unknownObjectWeakLoadStrong(v6);
        if (v15)
        {
          v16 = (void *)v15;
          v17 = (void *)objc_opt_self(NSLayoutConstraint);
          v18 = objc_msgSend(v16, "heightAnchor");

          v19 = objc_msgSend(v18, "constraintEqualToConstant:", 0.0);
          *(_QWORD *)(v10 + 40) = v19;
          specialized Array._endMutation()();
          sub_100007244(0, &qword_10001AA20, NSLayoutConstraint_ptr);
          isa = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease(v10);
          objc_msgSend(v17, "activateConstraints:", isa);

          v21 = v5 + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_notificationBodyLabel;
          v22 = swift_unknownObjectWeakLoadStrong(v5 + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_notificationBodyLabel);
          if (v22)
          {
            v23 = (void *)v22;
            v24 = *(_QWORD *)&a1[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_defaultNotificationText
                               + 8];
            if (v24)
            {
              swift_bridgeObjectRetain(v24);
              v25 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease(v24);
            }
            else
            {
              v25 = 0;
            }
            objc_msgSend(v23, "setText:", v25, v28);

            v26 = (void *)swift_unknownObjectWeakLoadStrong(v21);
            if (v26)
            {
              v27 = v26;
              objc_msgSend(v26, "sizeToFit");

              return;
            }
            goto LABEL_18;
          }
LABEL_17:
          __break(1u);
LABEL_18:
          __break(1u);
          return;
        }
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
}

id sub_100005120(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  id v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  NSString v13;
  id v14;
  objc_super v16;

  *(_QWORD *)&v3[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fmfSession] = 0;
  v6 = OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_monogrammer;
  v7 = objc_allocWithZone((Class)CNMonogrammer);
  v8 = v3;
  *(_QWORD *)&v3[v6] = objc_msgSend(v7, "initWithStyle:diameter:", 0, 128.0);
  v9 = OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_contactsDataController;
  v10 = type metadata accessor for FMFContactsDataController(0);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  *(_QWORD *)&v8[v9] = FMFContactsDataController.init(isSnapshotMode:)(0);
  v11 = &v8[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fenceTriggerLocationCoordinates];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  v11[16] = 1;
  v12 = &v8[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_defaultNotificationText];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;

  if (a2)
  {
    v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v13 = 0;
  }
  v16.receiver = v8;
  v16.super_class = (Class)type metadata accessor for NotificationViewController();
  v14 = objc_msgSendSuper2(&v16, "initWithNibName:bundle:", v13, a3);

  return v14;
}

id sub_1000052B8(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  id v10;
  objc_super v12;

  *(_QWORD *)&v1[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fmfSession] = 0;
  v3 = OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_monogrammer;
  v4 = objc_allocWithZone((Class)CNMonogrammer);
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, "initWithStyle:diameter:", 0, 128.0);
  v6 = OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_contactsDataController;
  v7 = type metadata accessor for FMFContactsDataController(0);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  *(_QWORD *)&v5[v6] = FMFContactsDataController.init(isSnapshotMode:)(0);
  v8 = &v5[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fenceTriggerLocationCoordinates];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = 1;
  v9 = &v5[OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_defaultNotificationText];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;

  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for NotificationViewController();
  v10 = objc_msgSendSuper2(&v12, "initWithCoder:", a1);

  return v10;
}

id sub_1000053DC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for NotificationViewController()
{
  return objc_opt_self(_TtC26FindMyNotificationsContent26NotificationViewController);
}

__n128 initializeWithTake for FMAnnotationClusterIdentifier(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1)
{
  sub_100007434(a1, &qword_10001A928, (uint64_t)&unk_100014A28);
}

void type metadata accessor for Weight(uint64_t a1)
{
  sub_100007434(a1, &qword_10001A930, (uint64_t)&unk_100014A50);
}

void type metadata accessor for TraitKey(uint64_t a1)
{
  sub_100007434(a1, &qword_10001A938, (uint64_t)&unk_100014A78);
}

uint64_t sub_100005598(uint64_t a1, uint64_t a2)
{
  return sub_1000057C4(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

NSNumber sub_1000055B0()
{
  return CGFloat._bridgeToObjectiveC()();
}

uint64_t sub_1000055B8(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v6 = 0;
  v7 = 1;
  result = static CGFloat._forceBridgeFromObjectiveC(_:result:)(a1, &v6);
  v4 = v7;
  v5 = v6;
  if (v7)
    v5 = 0;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v4;
  return result;
}

uint64_t sub_100005608(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v7;
  char v8;

  v7 = 0;
  v8 = 1;
  v3 = static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v7);
  v4 = v8;
  v5 = v7;
  if (v8)
    v5 = 0;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v4;
  return v3 & 1;
}

void sub_10000565C(double *a1@<X8>)
{
  *a1 = static CGFloat._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100005680(uint64_t a1, uint64_t a2)
{
  return sub_1000057C4(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100005694(uint64_t a1, id *a2)
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

uint64_t sub_100005708(uint64_t a1, id *a2)
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

uint64_t sub_100005784@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_1000057C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
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

uint64_t sub_100005800(uint64_t a1)
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

Swift::Int sub_100005840(uint64_t a1)
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

void sub_1000058B0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1000058C0(_QWORD *a1, uint64_t *a2)
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

uint64_t sub_10000594C@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100005974(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100005A50(&qword_10001A988, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_10000F74C);
  v3 = sub_100005A50(&qword_10001A990, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_10000F6EC);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000059F8()
{
  return sub_100005A50(&qword_10001A940, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_10000F6B0);
}

uint64_t sub_100005A24()
{
  return sub_100005A50(&qword_10001A948, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_10000F684);
}

uint64_t sub_100005A50(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100005A90()
{
  return sub_100005A50(&qword_10001A950, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_10000F720);
}

_QWORD *sub_100005ABC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

double sub_100005ACC@<D0>(_QWORD *a1@<X8>)
{
  double *v1;
  double result;

  result = *v1;
  *a1 = *(_QWORD *)v1;
  return result;
}

uint64_t sub_100005AD8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = sub_100005A50(&qword_10001A970, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_10000F8A4);
  v3 = sub_100005A50(&qword_10001A978, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_10000F844);
  v4 = sub_100005D20();
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, v4);
}

uint64_t sub_100005B78()
{
  return sub_100005A50(&qword_10001A958, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_10000F808);
}

uint64_t sub_100005BA4()
{
  return sub_100005A50(&qword_10001A960, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_10000F7DC);
}

uint64_t sub_100005BD0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_100005C14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100005A50((unint64_t *)&qword_10001AAD0, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_10000FAFC);
  v3 = sub_100005A50(&qword_10001AAD8, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_10000FA50);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005C98()
{
  double *v0;

  return Double.hashValue.getter(*v0);
}

void sub_100005CA0()
{
  Swift::UInt64 *v0;
  Swift::UInt64 v1;

  if ((*v0 & 0x7FFFFFFFFFFFFFFFLL) != 0)
    v1 = *v0;
  else
    v1 = 0;
  Hasher._combine(_:)(v1);
}

uint64_t sub_100005CD0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  if ((*v1 & 0x7FFFFFFFFFFFFFFFLL) != 0)
    v2 = *v1;
  else
    v2 = 0;
  return static Hasher._hash(seed:_:)(a1, v2);
}

BOOL sub_100005CE0(double *a1, double *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100005CF4()
{
  return sub_100005A50(&qword_10001A968, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_10000F878);
}

unint64_t sub_100005D20()
{
  unint64_t result;

  result = qword_10001A980;
  if (!qword_10001A980)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_10001A980);
  }
  return result;
}

uint64_t sub_100005D64(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100005E34(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100006FEC((uint64_t)v12, *a3);
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
      sub_100006FEC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100007154(v12);
  return v7;
}

uint64_t sub_100005E34(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100005FEC(a5, a6);
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

uint64_t sub_100005FEC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100006080(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100006258(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100006258(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100006080(uint64_t a1, unint64_t a2)
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
      v5 = sub_1000061F4(v4, 0);
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

_QWORD *sub_1000061F4(uint64_t a1, uint64_t a2)
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
  v4 = sub_100006ED8(&qword_10001AA70);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100006258(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100006ED8(&qword_10001AA70);
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

uint64_t sub_1000063A4(uint64_t a1, char a2)
{
  uint64_t v2;
  unint64_t v4;
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD v19[2];
  _BYTE v20[32];

  v2 = 0;
  if ((a2 & 1) == 0)
  {
    if (*(_QWORD *)(a1 + 16)
      && (v4 = sub_100007C2C(0xD000000000000014, 0x8000000100010400), (v5 & 1) != 0)
      && (sub_100006FEC(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)v20),
          (swift_dynamicCast(v19, v20, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) != 0))
    {
      v7 = v19[0];
      v6 = v19[1];
      sub_100007244(0, &qword_10001AA50, NSKeyedUnarchiver_ptr);
      v8 = sub_100007244(0, &qword_10001AA58, CLLocation_ptr);
      v9 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)(v8, v7, v6, v8);
      v2 = v9;
      if (v9)
      {
        sub_1000070D0(v7, v6);
        return v2;
      }
      if (qword_10001A7A0 != -1)
        swift_once(&qword_10001A7A0, sub_100002868);
      v10 = type metadata accessor for Logger(0);
      sub_1000070B8(v10, (uint64_t)qword_10001B028);
      v11 = Logger.logObject.getter();
      v12 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v11, v12))
      {
        v13 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Error decoding fence trigger location data", v13, 2u);
        swift_slowDealloc(v13, -1, -1);
      }
      sub_1000070D0(v7, v6);

    }
    else
    {
      if (qword_10001A7A0 != -1)
        swift_once(&qword_10001A7A0, sub_100002868);
      v14 = type metadata accessor for Logger(0);
      sub_1000070B8(v14, (uint64_t)qword_10001B028);
      v15 = Logger.logObject.getter();
      v16 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Trigger location is not available in notification", v17, 2u);
        swift_slowDealloc(v17, -1, -1);
      }

    }
    return 0;
  }
  return v2;
}

void sub_100006624(void *a1, uint64_t a2)
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *Strong;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  uint64_t v24;

  if (a1)
  {
    v4 = objc_allocWithZone((Class)MKPointAnnotation);
    v5 = a1;
    v6 = objc_msgSend(v4, "init");
    objc_msgSend(v5, "coordinate");
    objc_msgSend(v6, "setCoordinate:");
    v7 = objc_msgSend(objc_allocWithZone((Class)CLGeocoder), "init");
    v8 = swift_allocObject(&unk_100014B40, 24, 7);
    *(_QWORD *)(v8 + 16) = v6;
    v23[4] = sub_1000071AC;
    v24 = v8;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 1107296256;
    v23[2] = sub_1000048E0;
    v23[3] = &unk_100014B58;
    v9 = _Block_copy(v23);
    v10 = v24;
    v11 = v6;
    swift_release(v10);
    objc_msgSend(v7, "reverseGeocodeLocation:completionHandler:", v5, v9);
    _Block_release(v9);

    v12 = a2 + OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_mapView;
    Strong = (void *)swift_unknownObjectWeakLoadStrong(v12);
    if (Strong)
    {
      v14 = Strong;
      objc_msgSend(Strong, "addAnnotation:", v11);

      objc_msgSend(v5, "coordinate");
      v16 = v15;
      v18 = v17;
      objc_msgSend(v5, "horizontalAccuracy");
      v20 = objc_msgSend((id)objc_opt_self(MKCircle), "circleWithCenterCoordinate:radius:", v16, v18, v19);
      v21 = (void *)swift_unknownObjectWeakLoadStrong(v12);
      if (v21)
      {
        v22 = v21;
        objc_msgSend(v21, "addOverlay:", v20);

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void *sub_100006834(void *a1, void *a2, char *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  double v14;
  CLLocationDegrees latitude;
  double v16;
  CLLocationDegrees longitude;
  double v18;
  double v19;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CLLocationDegrees v28;
  double v29;
  double v30;
  double v31;
  CLLocationCoordinate2D v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double latitudeDelta;
  double longitudeDelta;
  void *result;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  _QWORD *v50;
  void *v51;
  _QWORD *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD aBlock[5];
  _QWORD *v61;
  CLLocationCoordinate2D v62;
  MKCoordinateRegion v63;

  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchQoS(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v59 = v7;
    objc_msgSend(a1, "coordinate");
    latitude = v14;
    longitude = v16;
    objc_msgSend(a1, "horizontalAccuracy");
    v19 = v18 * 5.0;
    if (a2)
    {
      v20 = a1;
      v21 = a2;
      objc_msgSend(v21, "distanceFromLocation:", v20);
      v23 = v22;
      objc_msgSend(v20, "horizontalAccuracy");
      if (v23 - v24 <= 0.0)
      {

      }
      else
      {
        objc_msgSend(v20, "coordinate");
        v26 = v25;
        objc_msgSend(v21, "coordinate");
        v28 = (v26 + v27) * 0.5;
        objc_msgSend(v20, "coordinate");
        v30 = v29;
        objc_msgSend(v21, "coordinate");
        v32 = CLLocationCoordinate2DMake(v28, (v30 + v31) * 0.5);
        latitude = v32.latitude;
        longitude = v32.longitude;
        objc_msgSend(v20, "distanceFromLocation:", v21);
        v34 = v33;

        v19 = v34 + v34;
      }
    }
    v7 = v59;
  }
  else
  {
    latitude = 0.0;
    v19 = 2000.0;
    longitude = 0.0;
  }
  v62.latitude = latitude;
  v62.longitude = longitude;
  v63 = MKCoordinateRegionMakeWithDistance(v62, v19, v19);
  v35 = v63.center.latitude;
  v36 = v63.center.longitude;
  latitudeDelta = v63.span.latitudeDelta;
  longitudeDelta = v63.span.longitudeDelta;
  result = (void *)swift_unknownObjectWeakLoadStrong(&a3[OBJC_IVAR____TtC26FindMyNotificationsContent16NotificationView_mapView]);
  if (result)
  {
    v40 = result;
    objc_msgSend(result, "regionThatFits:", v35, v36, latitudeDelta, longitudeDelta);
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;

    sub_100007244(0, &qword_10001A9F8, OS_dispatch_queue_ptr);
    v49 = (void *)static OS_dispatch_queue.main.getter();
    v50 = (_QWORD *)swift_allocObject(&unk_100014AF0, 56, 7);
    v50[2] = a3;
    v50[3] = v42;
    v50[4] = v44;
    v50[5] = v46;
    v50[6] = v48;
    aBlock[4] = sub_10000719C;
    v61 = v50;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100004C3C;
    aBlock[3] = &unk_100014B08;
    v51 = _Block_copy(aBlock);
    v52 = v61;
    v53 = a3;
    v54 = swift_release(v52);
    static DispatchQoS.unspecified.getter(v54);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v55 = sub_100005A50(&qword_10001AA00, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v56 = sub_100006ED8(&qword_10001AA08);
    v57 = sub_100006F18();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v56, v57, v6, v55);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v13, v9, v51);
    _Block_release(v51);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return (void *)(*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100006BD8(void *a1, uint64_t a2)
{
  uint64_t v4;
  NSString v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  NSString v11;

  v4 = type metadata accessor for FMPersonAnnotation(0);
  if (swift_dynamicCastClass(a2, v4))
  {
    v5 = String._bridgeToObjectiveC()();
    v6 = objc_msgSend(a1, "dequeueReusableAnnotationViewWithIdentifier:", v5);

    if (v6)
    {
      v7 = type metadata accessor for FMPersonAnnotationView();
      v8 = (void *)swift_dynamicCastClass(v6, v7);
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "setSelected:animated:", 1, 0);
      else

    }
    else
    {
      return 0;
    }
  }
  else
  {
    v10 = objc_allocWithZone((Class)MKMarkerAnnotationView);
    swift_unknownObjectRetain(a2);
    v11 = String._bridgeToObjectiveC()();
    v9 = objc_msgSend(v10, "initWithAnnotation:reuseIdentifier:", a2, v11);

    swift_unknownObjectRelease(a2);
  }
  return v9;
}

id sub_100006D10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  double v8;
  uint64_t v9;
  double v10;
  char **v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  v3 = objc_opt_self(MKCircle);
  v4 = swift_dynamicCastObjCClass(a1, v3);
  if (!v4)
    return objc_msgSend(objc_allocWithZone((Class)MKOverlayRenderer), "initWithOverlay:", a1);
  v5 = (void *)v4;
  v6 = objc_allocWithZone((Class)MKCircleRenderer);
  swift_unknownObjectRetain(a1);
  v7 = objc_msgSend(v6, "initWithCircle:", v5);
  objc_msgSend(v5, "coordinate");
  v9 = v1 + OBJC_IVAR____TtC26FindMyNotificationsContent26NotificationViewController_fenceTriggerLocationCoordinates;
  if ((*(_BYTE *)(v9 + 16) & 1) != 0
    || v8 != *(double *)v9
    || (objc_msgSend(v5, "coordinate"), (*(_BYTE *)(v9 + 16) & 1) != 0)
    || v10 != *(double *)(v9 + 8))
  {
    v11 = &selRef_systemRedColor;
  }
  else
  {
    v11 = &selRef_systemBlueColor;
  }
  v12 = (void *)objc_opt_self(UIColor);
  v13 = v7;
  v14 = objc_msgSend(v12, *v11);
  objc_msgSend(v13, "setFillColor:", v14);

  v15 = v13;
  objc_msgSend(v15, "setAlpha:", 0.2);

  swift_unknownObjectRelease(a1);
  return v15;
}

uint64_t sub_100006E94()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_100006EB8()
{
  uint64_t v0;

  sub_100004E64(*(char **)(v0 + 16));
}

uint64_t sub_100006EC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100006ED0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100006ED8(uint64_t *a1)
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

unint64_t sub_100006F18()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001AA10;
  if (!qword_10001AA10)
  {
    v1 = sub_100006F64(&qword_10001AA08);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001AA10);
  }
  return result;
}

uint64_t sub_100006F64(uint64_t *a1)
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

unint64_t sub_100006FA8()
{
  unint64_t result;

  result = qword_10001AA40;
  if (!qword_10001AA40)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001AA40);
  }
  return result;
}

uint64_t sub_100006FEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100007028(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006ED8(&qword_10001AA48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007070(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006ED8(&qword_10001AA48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000070B8(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1000070D0(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t *sub_100007114(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100007154(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100007178()
{
  uint64_t v0;

  return swift_deallocObject(v0, 56, 7);
}

void sub_10000719C()
{
  uint64_t v0;

  sub_100004BC0(*(_QWORD *)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
}

void sub_1000071AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1000047A4(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_1000071B4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1000071F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100006ED8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000722C(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

_OWORD *sub_100007234(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100007244(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

void type metadata accessor for SymbolicTraits(uint64_t a1)
{
  sub_100007434(a1, &qword_10001AA98, (uint64_t)&unk_100014B90);
}

void type metadata accessor for AttributeName(uint64_t a1)
{
  sub_100007434(a1, &qword_10001AAA0, (uint64_t)&unk_100014BB8);
}

uint64_t sub_1000072A4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_1000072D4(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000072E0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100007300(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for MKCoordinateRegion(uint64_t a1)
{
  sub_100007434(a1, &qword_10001AAA8, (uint64_t)&unk_100014C38);
}

void type metadata accessor for CGImage(uint64_t a1)
{
  sub_100007434(a1, &qword_10001AAB0, (uint64_t)&unk_100014C60);
}

uint64_t sub_100007354()
{
  return sub_100005A50(&qword_10001AAB8, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_10000FA14);
}

uint64_t sub_100007380()
{
  return sub_100005A50(&qword_10001AAC0, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_10000F9E8);
}

uint64_t sub_1000073AC()
{
  return sub_100005A50(&qword_10001AAC8, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_10000FA84);
}

uint64_t sub_1000073D8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1000073F8(uint64_t result, int a2, int a3)
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

void type metadata accessor for MKCoordinateSpan(uint64_t a1)
{
  sub_100007434(a1, (unint64_t *)&unk_10001AAE0, (uint64_t)&unk_100014CE8);
}

void sub_100007434(uint64_t a1, unint64_t *a2, uint64_t a3)
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

UIImage *sub_10000749C(void *a1)
{
  void *v1;
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  UIImage *result;
  UIImage *v13;
  CGSize v14;

  v3 = objc_msgSend(v1, "imageWithRenderingMode:", 2);
  objc_msgSend(v1, "size");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v1, "scale");
  v9 = v8;
  v14.width = v5;
  v14.height = v7;
  UIGraphicsBeginImageContextWithOptions(v14, 0, v9);
  objc_msgSend(a1, "set");
  objc_msgSend(v1, "size");
  objc_msgSend(v3, "drawInRect:", 0.0, 0.0, v10, v11);

  result = UIGraphicsGetImageFromCurrentImageContext();
  if (result)
  {
    v13 = result;

    UIGraphicsEndImageContext();
    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t UIFont.bold.getter()
{
  return sub_100007A1C(2);
}

id UIFont.light.getter()
{
  return sub_100007B98(&UIFontWeightLight);
}

unint64_t sub_1000075A0(uint64_t a1)
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
  sub_100006ED8(&qword_10001AB70);
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
    sub_100007E44(v7, (uint64_t)&v14);
    v8 = v14;
    result = sub_100007C90(v14);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v8;
    result = (unint64_t)sub_100007234(&v15, (_OWORD *)(v4[7] + 32 * result));
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

unint64_t sub_1000076B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006ED8(&qword_10001AB80);
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
  v6 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v7 = *v6;
    v8 = (id)*(v6 - 1);
    result = sub_100007C90((uint64_t)v8);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = 8 * result;
    *(_QWORD *)(v4[6] + v11) = v8;
    *(_QWORD *)(v4[7] + v11) = v7;
    v12 = v4[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v4[2] = v14;
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

unint64_t sub_1000077C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006ED8(&qword_10001AB58);
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
  v6 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v7 = *(v6 - 2);
    v8 = *(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_unknownObjectRetain(v9);
    result = sub_100007C2C(v7, v8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v9;
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
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

id sub_1000078D8(uint64_t a1)
{
  void *v1;
  id v3;
  uint64_t v4;
  uint64_t inited;
  NSString *v6;
  unint64_t v7;
  Class isa;
  id v9;
  id v10;
  _BYTE v12[72];

  v3 = objc_msgSend(v1, "fontDescriptor");
  v4 = sub_100006ED8(&qword_10001AB60);
  inited = swift_initStackObject(v4, v12);
  *(_OWORD *)(inited + 16) = xmmword_10000F5B0;
  *(_QWORD *)(inited + 32) = UIFontDescriptorTraitsAttribute;
  *(_QWORD *)(inited + 64) = sub_100006ED8(&qword_10001AB68);
  *(_QWORD *)(inited + 40) = a1;
  v6 = UIFontDescriptorTraitsAttribute;
  swift_bridgeObjectRetain(a1);
  v7 = sub_1000075A0(inited);
  type metadata accessor for AttributeName(0);
  sub_100007DFC();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  v9 = objc_msgSend(v3, "fontDescriptorByAddingAttributes:", isa);

  v10 = objc_msgSend((id)objc_opt_self(UIFont), "fontWithDescriptor:size:", v9, 0.0);
  return v10;
}

uint64_t UIFont.italic.getter()
{
  return sub_100007A1C(1);
}

uint64_t sub_100007A1C(uint64_t a1)
{
  void *v1;
  id v3;
  id v4;
  id v5;
  uint64_t result;
  Swift::String v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;

  v3 = objc_msgSend(v1, "fontDescriptor");
  v4 = objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", a1);

  if (v4)
  {
    v5 = objc_msgSend((id)objc_opt_self(UIFont), "fontWithDescriptor:size:", v4, 0.0);

    return (uint64_t)v5;
  }
  else
  {
    v10 = 0;
    v11 = 0xE000000000000000;
    _StringGuts.grow(_:)(61);
    v7._object = (void *)0x8000000100010450;
    v7._countAndFlagsBits = 0xD00000000000003BLL;
    String.append(_:)(v7);
    v9 = a1;
    type metadata accessor for SymbolicTraits(0);
    _print_unlocked<A, B>(_:_:)(&v9, &v10, v8, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v10, v11, "FindMyNotificationsContent/UIFont+Styles.swift", 46, 2, 63, 0);
    __break(1u);
  }
  return result;
}

id UIFont.regular.getter()
{
  return sub_100007B98(&UIFontWeightRegular);
}

id UIFont.medium.getter()
{
  return sub_100007B98(&UIFontWeightMedium);
}

id UIFont.semiBold.getter()
{
  return sub_100007B98(&UIFontWeightSemibold);
}

id UIFont.extraBold.getter()
{
  return sub_100007B98(&UIFontWeightHeavy);
}

id UIFont.titleBold.getter()
{
  return sub_100007B98(&UIFontWeightBold);
}

id sub_100007B98(_QWORD *a1)
{
  uint64_t v2;
  uint64_t inited;
  NSString *v4;
  unint64_t v5;
  id v6;
  uint64_t v8;

  v2 = sub_100006ED8(&qword_10001AB50);
  inited = swift_initStackObject(v2, &v8);
  *(_OWORD *)(inited + 16) = xmmword_10000F5B0;
  *(_QWORD *)(inited + 32) = UIFontWeightTrait;
  *(_QWORD *)(inited + 40) = *a1;
  v4 = UIFontWeightTrait;
  v5 = sub_1000076B8(inited);
  v6 = sub_1000078D8(v5);
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t UIFont.tightLeading.getter()
{
  return sub_100007A1C(0x8000);
}

unint64_t sub_100007C2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100007D1C(a1, a2, v5);
}

unint64_t sub_100007C90(uint64_t a1)
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
  return sub_100007E8C(a1, v7);
}

unint64_t sub_100007D1C(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_100007DFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001AAD0;
  if (!qword_10001AAD0)
  {
    type metadata accessor for AttributeName(255);
    result = swift_getWitnessTable(&unk_10000FAFC, v1);
    atomic_store(result, (unint64_t *)&qword_10001AAD0);
  }
  return result;
}

uint64_t sub_100007E44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006ED8(&qword_10001AB78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100007E8C(uint64_t a1, uint64_t a2)
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

id sub_100008000(double a1, double a2)
{
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;
  double v10;
  double v11;

  v4 = a2 / 6.0;
  v11 = a1 * 0.448;
  v10 = a1 * 0.385;
  v5 = a2 / 3.0;
  v6 = objc_msgSend(objc_allocWithZone((Class)UIBezierPath), "init");
  objc_msgSend(v6, "moveToPoint:", a1 + a1, a1);
  v7 = a2 * 0.5;
  objc_msgSend(v6, "addCurveToPoint:controlPoint1:controlPoint2:", v5 + a2 * 0.5 + a1, a1 + a1, a1 + a1);
  v8 = a1 + a1 + a2;
  objc_msgSend(v6, "addCurveToPoint:controlPoint1:controlPoint2:", a1, v8, v5 + a1, a1 + a1 + v5, v4 + a1, v8);
  objc_msgSend(v6, "addCurveToPoint:controlPoint1:controlPoint2:", a1 - (v7 + v5), a1 + a1, a1 - v4, v8, a1 - v5, a1 + a1 + v5);
  objc_msgSend(v6, "addCurveToPoint:controlPoint1:controlPoint2:", 0.0, a1, v10, a1 + a1 - v5, 0.0, a1 * 1.5);
  objc_msgSend(v6, "addCurveToPoint:controlPoint1:controlPoint2:", a1, 0.0, 0.0, v11, v11, 0.0);
  objc_msgSend(v6, "addCurveToPoint:controlPoint1:controlPoint2:", a1 + a1, a1, a1 + a1 - v11, 0.0, a1 + a1, v11);
  objc_msgSend(v6, "closePath");
  return v6;
}

void sub_1000081C0(uint64_t a1)
{
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  id v30;
  NSString v31;
  id v32;
  void *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v2 = sub_100006ED8(&qword_10001ABD8);
  __chkstk_darwin(v2);
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = type metadata accessor for FMFLocationSource(0);
  v5 = *(_QWORD *)(v36 - 8);
  v6 = __chkstk_darwin(v36);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v34 - v10;
  __chkstk_darwin(v9);
  v35 = (char *)&v34 - v12;
  v13 = sub_100006ED8(&qword_10001AA28);
  __chkstk_darwin(v13);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for FMFFriend(0);
  v17 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v19 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000094E4(a1, (uint64_t)v15, &qword_10001AA28);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_1000071F0((uint64_t)v15, &qword_10001AA28);
LABEL_5:
    v23 = *(void **)(v37 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage);
    *(_QWORD *)(v37 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage) = 0;

    return;
  }
  v20 = (*(uint64_t (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
  FMFFriend.location.getter(v20);
  v21 = type metadata accessor for FMFLocation(0);
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v4, 1, v21) == 1)
  {
    sub_1000071F0((uint64_t)v4, &qword_10001ABD8);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    goto LABEL_5;
  }
  FMFLocation.locationSource.getter();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v4, v21);
  v25 = v35;
  v24 = v36;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v35, v11, v36);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v8, enum case for FMFLocationSource.stewie(_:), v24);
  v26 = sub_100009570(&qword_10001ABE0, (uint64_t)&protocol conformance descriptor for FMFLocationSource);
  dispatch thunk of RawRepresentable.rawValue.getter(&v39, v24, v26);
  dispatch thunk of RawRepresentable.rawValue.getter(&v38, v24, v26);
  v28 = v38;
  v27 = v39;
  v29 = *(void (**)(char *, uint64_t))(v5 + 8);
  v29(v8, v24);
  if (v27 == v28)
  {
    v30 = objc_msgSend((id)objc_opt_self(UIImageSymbolConfiguration), "configurationWithTextStyle:scale:", UIFontTextStyleBody, 1);
    v31 = String._bridgeToObjectiveC()();
    v32 = objc_msgSend((id)objc_opt_self(UIImage), "_systemImageNamed:withConfiguration:", v31, v30);

    v33 = *(void **)(v37 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage);
    *(_QWORD *)(v37 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage) = v32;

  }
  else
  {
    v33 = *(void **)(v37 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage);
    *(_QWORD *)(v37 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage) = 0;
  }

  v29(v25, v24);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

uint64_t sub_100008588()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  v0 = sub_100007244(0, &qword_10001ABD0, UIImage_ptr);
  OS_dispatch_queue.sync<A>(execute:)(&v3, sub_100008A48, &v2, v0);
  return v3;
}

id sub_1000085FC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_personImage);
  if (v3)
  {
    v4 = *(id *)(a1 + OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_personImage);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)UIImage), "init");
    v3 = 0;
  }
  *a2 = v4;
  return v3;
}

_QWORD *sub_10000865C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v2 = type metadata accessor for FMAnnotationIdentifier(0);
  return OS_dispatch_queue.sync<A>(execute:)(a1, sub_100008A30, &v4, v2);
}

uint64_t sub_1000086C0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _BYTE v19[24];

  v4 = type metadata accessor for FMFFriend(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = sub_100006ED8(&qword_10001AA28);
  __chkstk_darwin(v8);
  v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v11 = a1 + OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_person;
  swift_beginAccess(v11, v19, 0, 0);
  sub_1000094E4(v11, (uint64_t)v10, &qword_10001AA28);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4))
  {
    sub_1000071F0((uint64_t)v10, &qword_10001AA28);
    v12 = 0;
    v13 = 0xE000000000000000;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
    v14 = sub_1000071F0((uint64_t)v10, &qword_10001AA28);
    v12 = FMFFriend.identifier.getter(v14);
    v13 = v15;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  *a2 = v12;
  a2[1] = v13;
  v16 = type metadata accessor for FMAnnotationIdentifier(0);
  return swift_storeEnumTagMultiPayload(a2, v16, 0);
}

uint64_t sub_10000883C()
{
  return 1;
}

void sub_100008844()
{
  uint64_t v0;

  sub_1000071F0(v0 + OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_person, &qword_10001AA28);

}

id sub_100008888()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMPersonAnnotation(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000890C()
{
  return type metadata accessor for FMPersonAnnotation(0);
}

uint64_t type metadata accessor for FMPersonAnnotation(uint64_t a1)
{
  uint64_t result;

  result = qword_10001ABB8;
  if (!qword_10001ABB8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FMPersonAnnotation);
  return result;
}

void sub_100008950(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[4];

  sub_1000089DC(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = "\b";
    v4[2] = &unk_10000FBD0;
    v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_updateClassMetadata2(a1, 256, 4, v4, a1 + 416);
  }
}

void sub_1000089DC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10001ABC8)
  {
    v2 = type metadata accessor for FMFFriend(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10001ABC8);
  }
}

uint64_t sub_100008A30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1000086C0(*(_QWORD *)(v1 + 16), a1);
}

id sub_100008A48@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1000085FC(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_100008A60(uint64_t a1, void *a2, int a3, double a4, double a5, double a6)
{
  char *v6;
  char *v7;
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
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t result;
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
  int v64;
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int (*v71)(uint64_t, uint64_t, uint64_t);
  uint64_t v72;
  char v73;
  char v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  char *v79;
  double *v80;
  id v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char v85;
  void (*v86)(char *, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  uint64_t v96;
  char *v97;
  char *v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t, uint64_t);
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  _QWORD v121[3];
  uint64_t v122;

  v7 = v6;
  LODWORD(v112) = a3;
  v118 = a2;
  v119 = a1;
  v105 = type metadata accessor for FMFLocationSource(0);
  v104 = *(_QWORD *)(v105 - 8);
  __chkstk_darwin(v105);
  v98 = (char *)&v96 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = sub_100006ED8(&qword_10001ABE8);
  __chkstk_darwin(v102);
  v120 = (uint64_t)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100006ED8(&qword_10001ABD8);
  v14 = __chkstk_darwin(v13);
  v97 = (char *)&v96 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v100 = (char *)&v96 - v16;
  v17 = sub_100006ED8(&qword_10001ABF0);
  v18 = __chkstk_darwin(v17);
  v103 = (char *)&v96 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __chkstk_darwin(v18);
  v109 = (uint64_t)&v96 - v21;
  __chkstk_darwin(v20);
  v110 = (uint64_t)&v96 - v22;
  v23 = sub_100006ED8(&qword_10001AA28);
  v24 = __chkstk_darwin(v23);
  v99 = (uint64_t)&v96 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __chkstk_darwin(v24);
  v106 = (uint64_t)&v96 - v27;
  v28 = __chkstk_darwin(v26);
  v101 = (uint64_t)&v96 - v29;
  __chkstk_darwin(v28);
  v115 = (uint64_t)&v96 - v30;
  v111 = type metadata accessor for FMFConfigValue(0);
  v31 = *(_QWORD *)(v111 - 8);
  __chkstk_darwin(v111);
  v33 = (char *)&v96 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v35 = *(_QWORD *)(v34 - 8);
  __chkstk_darwin(v34);
  v37 = (char *)&v96 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v38);
  v40 = (char *)&v96 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v41);
  v43 = (char *)&v96 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = &v6[OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_person];
  v45 = type metadata accessor for FMFFriend(0);
  v107 = *(_QWORD *)(v45 - 8);
  v46 = *(void (**)(char *, uint64_t, uint64_t))(v107 + 56);
  v116 = (uint64_t)v44;
  v108 = v45;
  v46(v44, 1, 1);
  v114 = OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_personImage;
  *(_QWORD *)&v7[OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_personImage] = 0;
  v47 = OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_updateQueue;
  sub_100007244(0, &qword_10001A9F8, OS_dispatch_queue_ptr);
  v117 = v7;
  v48 = static DispatchQoS.userInteractive.getter();
  static OS_dispatch_queue.Attributes.concurrent.getter(v48);
  (*(void (**)(char *, _QWORD, uint64_t))(v35 + 104))(v37, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v34);
  result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000021, 0x8000000100010520, v43, v40, v37, 0);
  *(_QWORD *)&v7[v47] = result;
  if ((~*(_QWORD *)&a6 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (a6 <= -9.22337204e18)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (a6 < 9.22337204e18)
  {
    v50 = v111;
    (*(void (**)(char *, _QWORD, uint64_t))(v31 + 104))(v33, enum case for FMFConfigValue.inaccuracyRadiusThreshold(_:), v111);
    v122 = 0x7FFFFFFFFFFFFFFFLL;
    FMFGlobalConfig<A>(_:fallback:)(v121, v33, &v122, &type metadata for Int);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v50);
    v111 = v121[0];
    v51 = v119;
    v52 = v115;
    sub_1000094E4(v119, v115, &qword_10001AA28);
    if ((v112 & 1) != 0)
    {
      v53 = v52;
LABEL_19:
      sub_1000071F0(v53, &qword_10001AA28);
      v73 = 0;
      goto LABEL_20;
    }
    v54 = v101;
    sub_1000094E4(v52, v101, &qword_10001AA28);
    v55 = v107;
    v56 = v108;
    v112 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v107 + 48);
    v57 = v112(v54, 1, v108);
    if ((_DWORD)v57 == 1)
    {
      sub_1000071F0(v54, &qword_10001AA28);
      v58 = v105;
      v59 = v104;
      v60 = (uint64_t)v103;
    }
    else
    {
      v61 = (uint64_t)v100;
      FMFFriend.location.getter(v57);
      (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v54, v56);
      v62 = type metadata accessor for FMFLocation(0);
      v63 = *(_QWORD *)(v62 - 8);
      v64 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v63 + 48))(v61, 1, v62);
      v58 = v105;
      v59 = v104;
      v60 = (uint64_t)v103;
      if (v64 != 1)
      {
        v65 = v110;
        FMFLocation.locationSource.getter();
        (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v61, v62);
        v66 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 56);
        v66(v65, 0, 1, v58);
LABEL_12:
        v67 = v120;
        v68 = v109;
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v59 + 104))(v109, enum case for FMFLocationSource.secureLive(_:), v58);
        v66(v68, 0, 1, v58);
        v69 = v67 + *(int *)(v102 + 48);
        sub_1000094E4(v65, v120, &qword_10001ABF0);
        v70 = v120;
        sub_1000094E4(v68, v69, &qword_10001ABF0);
        v71 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48);
        if (v71(v70, 1, v58) == 1)
        {
          sub_1000071F0(v68, &qword_10001ABF0);
          v70 = v120;
          sub_1000071F0(v65, &qword_10001ABF0);
          if (v71(v69, 1, v58) == 1)
          {
            sub_1000071F0(v70, &qword_10001ABF0);
            v72 = v106;
            sub_1000094E4(v52, v106, &qword_10001AA28);
LABEL_22:
            v87 = v99;
            sub_1000094E4(v72, v99, &qword_10001AA28);
            v88 = v108;
            v89 = v112(v87, 1, v108);
            if ((_DWORD)v89 == 1)
            {
              sub_1000071F0(v72, &qword_10001AA28);
              sub_1000071F0(v52, &qword_10001AA28);
              v90 = v87;
              v91 = &qword_10001AA28;
            }
            else
            {
              v92 = v97;
              FMFFriend.location.getter(v89);
              (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v87, v88);
              v93 = type metadata accessor for FMFLocation(0);
              v94 = *(_QWORD *)(v93 - 8);
              if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v94 + 48))(v92, 1, v93) != 1)
              {
                v95 = FMFLocation.isLivePaused.getter();
                sub_1000071F0(v72, &qword_10001AA28);
                sub_1000071F0(v52, &qword_10001AA28);
                (*(void (**)(char *, uint64_t))(v94 + 8))(v92, v93);
                v73 = v95 ^ 1;
                goto LABEL_20;
              }
              sub_1000071F0(v72, &qword_10001AA28);
              sub_1000071F0(v52, &qword_10001AA28);
              v91 = &qword_10001ABD8;
              v90 = (uint64_t)v92;
            }
            sub_1000071F0(v90, v91);
            v73 = 1;
LABEL_20:
            v74 = v111 < (uint64_t)a6;
            v75 = v116;
            swift_beginAccess(v116, v121, 33, 0);
            sub_100009528(v51, v75);
            swift_endAccess(v121);
            v76 = *(void **)(v113 + v114);
            v77 = v118;
            *(_QWORD *)(v113 + v114) = v118;
            v78 = v77;

            v79 = v117;
            v80 = (double *)&v117[OBJC_IVAR____TtC26FindMyNotificationsContent18FMPersonAnnotation_tempCoordinate];
            *v80 = a4;
            v80[1] = a5;

            v81 = sub_10000CABC(0, 0, v74, v73 & 1, a4, a5, a6);
            sub_1000081C0(v51);

            sub_1000071F0(v51, &qword_10001AA28);
            return (uint64_t)v81;
          }
        }
        else
        {
          sub_1000094E4(v70, v60, &qword_10001ABF0);
          if (v71(v69, 1, v58) != 1)
          {
            v82 = v60;
            v83 = v98;
            (*(void (**)(char *, uint64_t, uint64_t))(v59 + 32))(v98, v69, v58);
            v84 = sub_100009570(&qword_10001ABF8, (uint64_t)&protocol conformance descriptor for FMFLocationSource);
            v85 = dispatch thunk of static Equatable.== infix(_:_:)(v82, v83, v58, v84);
            v86 = *(void (**)(char *, uint64_t))(v59 + 8);
            v86(v83, v58);
            sub_1000071F0(v109, &qword_10001ABF0);
            sub_1000071F0(v110, &qword_10001ABF0);
            v86((char *)v82, v58);
            sub_1000071F0(v70, &qword_10001ABF0);
            v72 = v106;
            sub_1000094E4(v52, v106, &qword_10001AA28);
            if ((v85 & 1) != 0)
              goto LABEL_22;
LABEL_18:
            sub_1000071F0(v72, &qword_10001AA28);
            v53 = v52;
            goto LABEL_19;
          }
          sub_1000071F0(v109, &qword_10001ABF0);
          sub_1000071F0(v110, &qword_10001ABF0);
          (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v60, v58);
        }
        sub_1000071F0(v70, &qword_10001ABE8);
        v72 = v106;
        sub_1000094E4(v52, v106, &qword_10001AA28);
        goto LABEL_18;
      }
      sub_1000071F0(v61, &qword_10001ABD8);
    }
    v65 = v110;
    v66 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 56);
    v66(v110, 1, 1, v58);
    goto LABEL_12;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1000094E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100006ED8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100009528(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006ED8(&qword_10001AA28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009570(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for FMFLocationSource(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1000095B0()
{
  qword_10001B058 = 0x4010000000000000;
}

__n128 sub_1000095C0()
{
  double v0;
  double v1;
  id v2;
  id v3;
  id v4;
  __n128 result;

  if (qword_10001A7A8 != -1)
    swift_once(&qword_10001A7A8, sub_1000095B0);
  v0 = *(double *)&qword_10001B058;
  v1 = *(double *)&qword_10001B058 + 34.0 + 2.0;
  v2 = objc_msgSend((id)objc_opt_self(UIColor), "systemBlueColor");
  v3 = objc_msgSend(v2, "colorWithAlphaComponent:", 0.2);

  v4 = objc_msgSend(v3, "CGColor");
  *(double *)&xmmword_10001B060 = v0 + v0 + 44.0;
  *((double *)&xmmword_10001B060 + 1) = v0;
  qword_10001B070 = 0x4020000000000000;
  qword_10001B078 = *(_QWORD *)&v1;
  xmmword_10001B080 = xmmword_10000FC00;
  unk_10001B090 = xmmword_10000FC10;
  __asm
  {
    FMOV            V0.2D, #20.0
    FMOV            V1.2D, #15.0
  }
  xmmword_10001B0A0 = _Q0;
  unk_10001B0B0 = _Q1;
  xmmword_10001B0C0 = xmmword_10000FC20;
  *(int64x2_t *)&qword_10001B0D0 = vdupq_n_s64(0x3FD999999999999AuLL);
  __asm { FMOV            V0.2D, #30.0 }
  xmmword_10001B0E0 = (__int128)result;
  unk_10001B0F0 = xmmword_10000FC30;
  qword_10001B100 = (uint64_t)v4;
  byte_10001B108 = 1;
  return result;
}

id sub_100009714(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString v21;
  id v22;
  id v23;
  objc_super v25;

  v6 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle;
  v7 = objc_allocWithZone((Class)CALayer);
  v8 = v3;
  *(_QWORD *)&v3[v6] = objc_msgSend(v7, "init");
  v9 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder;
  *(_QWORD *)&v8[v9] = objc_msgSend(objc_allocWithZone((Class)CALayer), "init");
  v10 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage;
  *(_QWORD *)&v8[v10] = objc_msgSend(objc_allocWithZone((Class)CALayer), "init");
  v11 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer;
  *(_QWORD *)&v8[v11] = objc_msgSend(objc_allocWithZone((Class)CAShapeLayer), "init");
  v12 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage;
  *(_QWORD *)&v8[v12] = objc_msgSend(objc_allocWithZone((Class)CALayer), "init");
  v13 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeLayer;
  *(_QWORD *)&v8[v13] = objc_msgSend(objc_allocWithZone((Class)CALayer), "init");
  v14 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeBackground;
  *(_QWORD *)&v8[v14] = objc_msgSend(objc_allocWithZone((Class)CAShapeLayer), "init");
  v15 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeImageLayer;
  *(_QWORD *)&v8[v15] = objc_msgSend(objc_allocWithZone((Class)CALayer), "init");
  v16 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeLayer;
  *(_QWORD *)&v8[v16] = objc_msgSend(objc_allocWithZone((Class)CALayer), "init");
  v17 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeBackground;
  *(_QWORD *)&v8[v17] = objc_msgSend(objc_allocWithZone((Class)CAShapeLayer), "init");
  v18 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeCircleLayer;
  *(_QWORD *)&v8[v18] = objc_msgSend(objc_allocWithZone((Class)CAShapeLayer), "init");
  v19 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeImageLayer;
  *(_QWORD *)&v8[v19] = objc_msgSend(objc_allocWithZone((Class)CALayer), "init");
  v20 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_accuracyLayer;
  *(_QWORD *)&v8[v20] = objc_msgSend(objc_allocWithZone((Class)CAShapeLayer), "init");
  *(_QWORD *)&v8[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_pulseLayer] = 0;
  v8[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isShowingInaccurate] = 0;
  v8[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_shouldHideCallout] = 0;
  v8[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_shouldHideCenterCircle] = 0;
  v8[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_applyShadowToBalloonTail] = 0;
  v8[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated] = 0;
  v8[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_canShowBalloon] = 1;
  v8[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isPulsating] = 0;

  if (a3)
  {
    v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a3);
  }
  else
  {
    v21 = 0;
  }
  v25.receiver = v8;
  v25.super_class = (Class)type metadata accessor for FMMapAnnotationView();
  v22 = objc_msgSendSuper2(&v25, "initWithAnnotation:reuseIdentifier:", a1, v21);

  v23 = v22;
  sub_100009A3C();
  sub_10000B85C();

  swift_unknownObjectRelease(a1);
  return v23;
}

void sub_100009A3C()
{
  char *v0;
  void *v1;
  __int128 v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  double v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  double v42;
  double v43;
  double v44;
  double v45;
  id v46;
  id v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  id v53;
  double v54;
  double v55;
  double v56;
  id v57;
  id v58;
  CATransform3D v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[25];

  if (qword_10001A7B0 != -1)
    swift_once(&qword_10001A7B0, sub_1000095C0);
  v68 = xmmword_10001B0E0;
  *(_OWORD *)v69 = unk_10001B0F0;
  *(_OWORD *)&v69[9] = *(_OWORD *)((char *)&qword_10001B0F8 + 1);
  v64 = xmmword_10001B0A0;
  v65 = unk_10001B0B0;
  v66 = xmmword_10001B0C0;
  v67 = *(_OWORD *)&qword_10001B0D0;
  v60 = xmmword_10001B060;
  v61 = *(_OWORD *)&qword_10001B070;
  v62 = xmmword_10001B080;
  v63 = unk_10001B090;
  v1 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle];
  v2 = xmmword_10001B060;
  if ((byte_10001B108 & 1) != 0)
    v3 = *((double *)&xmmword_10001B060 + 1) + *((double *)&xmmword_10001B060 + 1);
  else
    v3 = 0.0;
  v4 = *(double *)&xmmword_10001B060 - v3;
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle], "setFrame:", *((double *)&xmmword_10001B060 + 1), *((double *)&xmmword_10001B060 + 1), *(double *)&xmmword_10001B060 - v3, *(double *)&xmmword_10001B060 - v3);
  objc_msgSend(v1, "setCornerRadius:", v4 * 0.5);
  objc_msgSend(v1, "setAnchorPoint:", 0.5, 0.5);
  v5 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder];
  objc_msgSend(v5, "setCornerRadius:", (v4 + -4.0) * 0.5);
  objc_msgSend(v1, "addSublayer:", v5);
  objc_msgSend(v1, "addSublayer:", *(_QWORD *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage]);
  v6 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_accuracyLayer];
  v7 = (void *)objc_opt_self(UIBezierPath);
  v8 = objc_msgSend(v7, "bezierPathWithOvalInRect:", 0.0, 0.0, 0.0, 0.0);
  v9 = objc_msgSend(v8, "CGPath");

  objc_msgSend(v6, "setPath:", v9);
  objc_msgSend(v6, "setFillColor:", *(_QWORD *)&v69[16]);
  v58 = sub_100008000(*(double *)&v62 * 0.5, *(double *)&v62 * 0.125);
  v10 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer];
  v11 = objc_msgSend(v58, "CGPath");
  objc_msgSend(v10, "setPath:", v11);

  objc_msgSend(v10, "setFrame:", *((double *)&v2 + 1) + *(double *)&v61 - (*(double *)&v2 - *(double *)&v61) * 0.5 + 1.0, (*(double *)&v62 - v3) * -0.25 - *(double *)&v62 * 0.125 + -2.0, *(double *)&v62, *(double *)&v62);
  objc_msgSend(v10, "setAnchorPoint:", 0.5, 1.0);
  v57 = *(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage];
  objc_msgSend(v10, "addSublayer:");
  objc_msgSend(v1, "bounds");
  sub_10000C3A0(v1, v12, v13, v14, v15);
  objc_msgSend(v10, "bounds");
  sub_10000C3A0(v10, v16, v17, v18, v19);
  v20 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeBackground];
  v21 = *((double *)&v66 + 1);
  v22 = objc_msgSend(v7, "bezierPathWithOvalInRect:", 0.0, 0.0, *(double *)&v65 + v21 + v21, *((double *)&v65 + 1) + v21 + v21);
  v23 = objc_msgSend(v22, "CGPath");

  objc_msgSend(v20, "setPath:", v23);
  v24 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeLayer];
  objc_msgSend(v24, "addSublayer:", v20);
  v25 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeImageLayer];
  objc_msgSend(v24, "addSublayer:", v25);
  objc_msgSend(v24, "setFrame:", *(double *)&v2 - *(double *)&v64, *(double *)&v2 - *((double *)&v64 + 1), v65);
  objc_msgSend(v20, "setFrame:", 0.0, 0.0, v65);
  objc_msgSend(v25, "setFrame:", v21, v21, v65);
  v26 = objc_msgSend(v0, "layer");
  objc_msgSend(v26, "setFrame:", 0.0, 0.0, *(double *)&v2, *(double *)&v2);

  v27 = objc_msgSend(v0, "layer");
  objc_msgSend(v27, "addSublayer:", v6);

  v28 = objc_msgSend(v0, "layer");
  objc_msgSend(v28, "addSublayer:", v1);

  v29 = objc_msgSend(v0, "layer");
  objc_msgSend(v29, "addSublayer:", v10);

  v30 = objc_msgSend(v0, "layer");
  objc_msgSend(v30, "addSublayer:", v24);

  v31 = *(double *)v69;
  v32 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeLayer];
  objc_msgSend(v32, "setFrame:", (*(double *)&v2 - *(double *)&v68) * 0.5 + *(double *)&v2 * *(double *)&v67, (*(double *)&v2 - *((double *)&v68 + 1)) * 0.5 + *(double *)&v2 * *((double *)&v67 + 1), v68);
  v33 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeBackground];
  v34 = objc_msgSend(v7, "bezierPathWithOvalInRect:", 0.0, 0.0, v68);
  v35 = objc_msgSend(v34, "CGPath");

  objc_msgSend(v33, "setPath:", v35);
  v36 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeCircleLayer];
  v37 = objc_msgSend(v7, "bezierPathWithOvalInRect:", 0.0, 0.0, *(double *)&v68 - (v31 + v31), *((double *)&v68 + 1) - (v31 + v31));
  v38 = objc_msgSend(v37, "CGPath");

  objc_msgSend(v36, "setPath:", v38);
  objc_msgSend(v33, "setFrame:", 0.0, 0.0, v68);
  v39 = (void *)objc_opt_self(UIColor);
  v40 = objc_msgSend(v39, "whiteColor");
  v41 = objc_msgSend(v40, "CGColor");

  objc_msgSend(v33, "setFillColor:", v41);
  objc_msgSend(v33, "frame");
  objc_msgSend(v36, "setFrame:", sub_10000C4F8(v42, v43, v44, v45, v31, v31));
  v46 = objc_msgSend(v39, "blackColor");
  v47 = objc_msgSend(v46, "CGColor");

  objc_msgSend(v36, "setFillColor:", v47);
  v48 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeImageLayer];
  objc_msgSend(v36, "frame");
  objc_msgSend(v48, "setFrame:", sub_10000C4F8(v49, v50, v51, v52, v31, v31));
  objc_msgSend(v48, "setContentsGravity:", kCAGravityResizeAspectFill);
  objc_msgSend(v32, "addSublayer:", v33);
  objc_msgSend(v32, "addSublayer:", v36);
  objc_msgSend(v32, "addSublayer:", v48);
  v53 = objc_msgSend(v0, "layer");
  objc_msgSend(v53, "addSublayer:", v32);

  sub_10000A294((uint64_t)&v60);
  CATransform3DMakeScale(&v59, 0.0, 0.0, 1.0);
  objc_msgSend(v10, "setTransform:", &v59);
  LODWORD(v54) = 0;
  objc_msgSend(v10, "setOpacity:", v54);
  LODWORD(v55) = 0;
  objc_msgSend(v57, "setOpacity:", v55);
  LODWORD(v56) = 0;
  objc_msgSend(v6, "setOpacity:", v56);

}

id sub_10000A294(uint64_t a1)
{
  uint64_t v1;
  char v3;
  double v4;
  double v5;

  v3 = *(_BYTE *)(a1 + 168);
  v4 = *(double *)a1;
  v5 = *(double *)a1;
  if ((v3 & 1) != 0)
    v5 = v4 - (*(double *)(a1 + 8) + *(double *)(a1 + 8));
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage), "setFrame:", (v5 - *(double *)(a1 + 24)) * 0.5, (v5 - *(double *)(a1 + 24)) * 0.5, *(double *)(a1 + 24), *(double *)(a1 + 24));
  if ((v3 & 1) != 0)
    v4 = v4 - (*(double *)(a1 + 8) + *(double *)(a1 + 8));
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder), "setFrame:", 2.0, 2.0, v4 + -4.0, v4 + -4.0);
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage), "setFrame:", (*(double *)(a1 + 32) - *(double *)(a1 + 40)) * 0.5, (*(double *)(a1 + 32) - *(double *)(a1 + 40)) * 0.5, *(double *)(a1 + 40), *(double *)(a1 + 40));
}

void sub_10000A368(_QWORD *a1)
{
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v4;
  void *v5;
  uint64_t (*v6)(void);
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  uint64_t v13;
  double v14;
  id v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  UIImage *v23;
  CGImage *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  UIImage *v31;
  CGImage *v32;
  uint64_t v33;
  int v34;
  int v35;
  char v36;
  CGImage *v37;
  _OWORD v38[9];
  _OWORD v39[2];

  v2 = v1;
  if (qword_10001A7B0 != -1)
    swift_once(&qword_10001A7B0, sub_1000095C0);
  v38[8] = xmmword_10001B0E0;
  v39[0] = unk_10001B0F0;
  *(_OWORD *)((char *)v39 + 9) = *(_OWORD *)((char *)&qword_10001B0F8 + 1);
  v38[4] = xmmword_10001B0A0;
  v38[5] = unk_10001B0B0;
  v38[6] = xmmword_10001B0C0;
  v38[7] = *(_OWORD *)&qword_10001B0D0;
  v38[0] = xmmword_10001B060;
  v38[1] = *(_OWORD *)&qword_10001B070;
  v38[2] = xmmword_10001B080;
  v38[3] = unk_10001B090;
  sub_10000C350((uint64_t)v38);
  sub_10000A294((uint64_t)v38);
  v4 = sub_10000C378((uint64_t)v38);
  v5 = *(void **)&v1[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage];
  v6 = *(uint64_t (**)(void))((swift_isaMask & *a1) + 0x188);
  v7 = (void *)((uint64_t (*)(uint64_t))v6)(v4);
  v8 = objc_msgSend(v7, "CGImage");

  objc_msgSend(v5, "setContents:", v8);
  v9 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage];
  v10 = (void *)v6();
  v11 = objc_msgSend(v10, "CGImage");

  objc_msgSend(v9, "setContents:", v11);
  v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_canShowBalloon] = 1;
  LODWORD(v12) = 1132068864;
  objc_msgSend(v2, "setDisplayPriority:", v12);
  objc_msgSend(v2, "setCollisionMode:", 1);
  v13 = OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isWithYou;
  if (*((_BYTE *)a1 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isWithYou) == 1
    && (objc_msgSend(v2, "isSelected") & 1) != 0)
  {
    v14 = 0.65;
  }
  else
  {
    v14 = 0.5;
  }
  v15 = objc_msgSend(v2, "layer");
  objc_msgSend(v15, "setAnchorPoint:", 0.5, v14);

  LODWORD(v16) = 0;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder], "setOpacity:", v16);
  v17 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle];
  objc_msgSend(v17, "setHidden:", *((unsigned __int8 *)a1 + v13));
  if (v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_shouldHideCenterCircle] == 1)
    objc_msgSend(v17, "setHidden:", 1);
  objc_msgSend(v2, "_updateFromMap");
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);
  v18 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeImageLayer];
  v19 = *(void **)((char *)a1 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_badgeImage);
  if (!v19)
    goto LABEL_13;
  v20 = (void *)objc_opt_self(UIColor);
  v21 = v19;
  v22 = objc_msgSend(v20, "systemGrayColor");
  v23 = sub_10000749C(v22);

  if (v23)
  {
    v24 = -[UIImage CGImage](v23, "CGImage");

    if (v24)
    {
      v37 = v24;
      type metadata accessor for CGImage(0);
      v23 = (UIImage *)_bridgeAnythingToObjectiveC<A>(_:)(&v37, v25);

      goto LABEL_14;
    }
LABEL_13:
    v23 = 0;
  }
LABEL_14:
  objc_msgSend(v18, "setContents:", v23);
  swift_unknownObjectRelease(v23);
  v26 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeImageLayer];
  v27 = *(void **)((char *)a1 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage);
  if (!v27)
    goto LABEL_18;
  v28 = (void *)objc_opt_self(UIColor);
  v29 = v27;
  v30 = objc_msgSend(v28, "whiteColor");
  v31 = sub_10000749C(v30);

  if (!v31)
    goto LABEL_19;
  v32 = -[UIImage CGImage](v31, "CGImage");

  if (v32)
  {
    v37 = v32;
    type metadata accessor for CGImage(0);
    v31 = (UIImage *)_bridgeAnythingToObjectiveC<A>(_:)(&v37, v33);

  }
  else
  {
LABEL_18:
    v31 = 0;
  }
LABEL_19:
  objc_msgSend(v26, "setContents:", v31);
  swift_unknownObjectRelease(v31);
  if ((*((_BYTE *)a1 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isLive) & 1) == 0)
  {
    v36 = v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated];
    v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated] = 0;
    if ((v36 & 1) == 0)
      return;
    goto LABEL_23;
  }
  v34 = v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated];
  v35 = (*((_BYTE *)a1 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isInaccurate) & 1) == 0;
  v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated] = v35;
  if (v34 != v35)
LABEL_23:
    sub_10000BC20();
}

id sub_10000A8B4()
{
  char *v0;
  id result;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  id v14;
  CGFloat v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  float v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CATransform3D v43;
  objc_super v44;

  v44.receiver = v0;
  v44.super_class = (Class)type metadata accessor for FMMapAnnotationView();
  objc_msgSendSuper2(&v44, "_updateFromMap");
  result = objc_msgSend(v0, "annotation");
  if (result)
  {
    v2 = result;
    v3 = type metadata accessor for FMAnnotation();
    v4 = swift_dynamicCastClass(v2, v3);
    if (!v4)
      return (id)swift_unknownObjectRelease(v2);
    v5 = v4;
    if (qword_10001A7B0 != -1)
      swift_once(&qword_10001A7B0, sub_1000095C0);
    v6 = xmmword_10001B060;
    v7 = *(double *)&qword_10001B078;
    v8 = *(double *)&qword_10001B0F8;
    objc_msgSend(v0, "_pointsForDistance:", *(double *)(v5 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_horizontalAccuracy));
    v10 = v9;
    v11 = v9 + v9;
    v12 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_accuracyLayer];
    v13 = objc_msgSend((id)objc_opt_self(UIBezierPath), "bezierPathWithOvalInRect:", 1.0, 1.0, v11, v11);
    v14 = objc_msgSend(v13, "CGPath");

    objc_msgSend(v12, "setPath:", v14);
    objc_msgSend(v12, "setFrame:", *(double *)&v6 * 0.5 - v10, *(double *)&v6 * 0.5 - v10, v11, v11);
    objc_msgSend(v0, "_mapPitchRadians");
    CATransform3DMakeRotation(&v43, v15, 1.0, 0.0, 0.0);
    objc_msgSend(v12, "setTransform:", &v43);
    objc_msgSend(v12, "setZPosition:", -100.0);
    v16 = OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isInaccurate;
    if (v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isShowingInaccurate] == *(_BYTE *)(v5 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isInaccurate))
    {
      if (!*(_BYTE *)(v5 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isInaccurate))
        goto LABEL_14;
    }
    else
    {
      objc_msgSend(v0, "setSelected:animated:", objc_msgSend(v0, "isSelected"), 0);
      if ((*(_BYTE *)(v5 + v16) & 1) == 0)
        goto LABEL_14;
    }
    if (objc_msgSend(v0, "isSelected"))
    {
      objc_msgSend(v12, "setLineWidth:", v8);
      v17 = objc_msgSend((id)objc_opt_self(UIColor), "whiteColor");
      v18 = objc_msgSend(v17, "CGColor");

      objc_msgSend(v12, "setStrokeColor:", v18);
      v19 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer];
      LODWORD(v20) = 0;
      objc_msgSend(v19, "setOpacity:", v20);
      v21 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage];
      LODWORD(v22) = 0;
      objc_msgSend(v21, "setOpacity:", v22);
      v23 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle];
      LODWORD(v24) = 0;
      objc_msgSend(v23, "setOpacity:", v24);
      if ((*(_BYTE *)(v5 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isWithYou) & 1) == 0)
      {
        LODWORD(v25) = 1.0;
        objc_msgSend(v12, "setOpacity:", v25);
      }
      if (v11 >= *((double *)&v6 + 1) + v7)
        goto LABEL_18;
      v26 = *(_OWORD *)&CATransform3DIdentity.m13;
      *(_OWORD *)&v43.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
      *(_OWORD *)&v43.m13 = v26;
      v27 = *(_OWORD *)&CATransform3DIdentity.m23;
      *(_OWORD *)&v43.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
      *(_OWORD *)&v43.m23 = v27;
      v28 = *(_OWORD *)&CATransform3DIdentity.m33;
      *(_OWORD *)&v43.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
      *(_OWORD *)&v43.m33 = v28;
      v29 = *(_OWORD *)&CATransform3DIdentity.m43;
      *(_OWORD *)&v43.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
      *(_OWORD *)&v43.m43 = v29;
      objc_msgSend(v23, "setTransform:", &v43);
      CATransform3DMakeScale(&v43, 0.0, 0.0, 1.0);
      objc_msgSend(v19, "setTransform:", &v43);
      v30 = 0.0;
      LODWORD(v31) = 0;
      objc_msgSend(v19, "setOpacity:", v31);
      LODWORD(v32) = 0;
      objc_msgSend(v21, "setOpacity:", v32);
      LODWORD(v33) = 1.0;
      objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage], "setOpacity:", v33);
      LODWORD(v34) = 1.0;
      objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder], "setOpacity:", v34);
      LODWORD(v35) = 1.0;
      objc_msgSend(v23, "setOpacity:", v35);
LABEL_17:
      *(float *)&v36 = v30;
      objc_msgSend(v12, "setOpacity:", v36);
LABEL_18:
      if (*(_QWORD *)(v5 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_badgeImage))
        *(float *)&v25 = 1.0;
      else
        *(float *)&v25 = 0.0;
      objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeLayer], "setOpacity:", v25);
      if (*(_QWORD *)(v5 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage))
        *(float *)&v42 = 1.0;
      else
        *(float *)&v42 = 0.0;
      objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeLayer], "setOpacity:", v42);
      return (id)swift_unknownObjectRelease(v2);
    }
LABEL_14:
    objc_msgSend(v12, "setLineWidth:", 0.0);
    v37 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
    v38 = objc_msgSend(v37, "CGColor");

    objc_msgSend(v12, "setStrokeColor:", v38);
    objc_msgSend(v12, "setLineWidth:", 0.0);
    v30 = 1.0;
    LODWORD(v39) = 1.0;
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer], "setOpacity:", v39);
    LODWORD(v40) = 1.0;
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage], "setOpacity:", v40);
    LODWORD(v41) = 1.0;
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle], "setOpacity:", v41);
    if (!objc_msgSend(v0, "isSelected")
      || *(_BYTE *)(v5 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isWithYou) == 1)
    {
      v30 = 0.0;
    }
    goto LABEL_17;
  }
  return result;
}

void sub_10000AEB4(char a1, char a2)
{
  char *v2;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  int v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  id v27;
  char v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  NSDictionary v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  CGFloat m12;
  CGFloat m13;
  CGFloat m14;
  CGFloat m21;
  CGFloat m22;
  CGFloat m23;
  CGFloat m31;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat m44;
  CGFloat m43;
  CGFloat m42;
  CGFloat m41;
  CGFloat m34;
  CGFloat m33;
  double v84;
  double v85;
  CGFloat m24;
  double v87;
  CGFloat m32;
  CATransform3D v89;
  CATransform3D v90;
  objc_super v91;

  v91.receiver = v2;
  v91.super_class = (Class)type metadata accessor for FMMapAnnotationView();
  objc_msgSendSuper2(&v91, "setSelected:animated:", a1 & 1, a2 & 1);
  if (qword_10001A7B0 != -1)
    swift_once(&qword_10001A7B0, sub_1000095C0);
  v6 = *((double *)&xmmword_10001B060 + 1);
  v5 = *(double *)&xmmword_10001B060;
  v87 = *(double *)&qword_10001B070;
  v7 = *(double *)&xmmword_10001B080;
  v9 = *((double *)&xmmword_10001B0A0 + 1);
  v8 = *(double *)&xmmword_10001B0A0;
  v10 = *(double *)&xmmword_10001B0C0;
  v11 = qword_10001B0D0;
  v12 = unk_10001B0D8;
  v13 = byte_10001B108;
  v14 = objc_msgSend(v2, "annotation");
  if (v14)
  {
    v15 = v14;
    v16 = type metadata accessor for FMAnnotation();
    v17 = swift_dynamicCastClass(v15, v16);
    if (v17)
    {
      v18 = v17;
      v84 = v6;
      v19 = v8;
      v20 = v10;
      v21 = v5;
      v22 = v7;
      v23 = v9;
      v24 = v12;
      v25 = v11;
      if (*(_BYTE *)(v17 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isWithYou) == 1
        && (objc_msgSend(v2, "isSelected") & 1) != 0)
      {
        v26 = 0.65;
      }
      else
      {
        v26 = 0.5;
      }
      v27 = objc_msgSend(v2, "layer");
      objc_msgSend(v27, "setAnchorPoint:", 0.5, v26);

      v28 = *(_BYTE *)(v18 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isInaccurate);
      swift_unknownObjectRelease(v15);
      v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isShowingInaccurate] = v28;
      v11 = v25;
      v12 = v24;
      v9 = v23;
      v7 = v22;
      v5 = v21;
      v10 = v20;
      v8 = v19;
      v6 = v84;
    }
    else
    {
      swift_unknownObjectRelease(v15);
    }
  }
  v29 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer];
  if ((a2 & 1) != 0)
  {
    v30 = sub_100006ED8(&qword_10001ACD8);
    v31 = swift_allocObject(v30, 56, 7);
    *(_OWORD *)(v31 + 16) = xmmword_10000F5B0;
    *(_QWORD *)(v31 + 32) = 0x726F66736E617274;
    *(_QWORD *)(v31 + 40) = 0xE90000000000006DLL;
    *(_QWORD *)(v31 + 48) = objc_msgSend((id)objc_opt_self(CALayer), "springAnimationWithDuration:dampingRatio:velocity:", 0.638, 0.7, 0.0);
    v32 = sub_1000077C0(v31);
    sub_100006ED8(&qword_10001ACE0);
    v33.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v32);
  }
  else
  {
    v33.super.isa = 0;
  }
  objc_msgSend(v29, "setActions:", v33.super.isa);

  if ((a1 & 1) != 0
    && (v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isShowingInaccurate] & 1) == 0
    && v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_canShowBalloon] == 1)
  {
    v34 = v6 + v6;
    if (!v13)
      v34 = 0.0;
    v35 = v5 - v34;
    v85 = *(double *)&v11;
    v36 = v87 / v35;
    v37 = (v35 - v87) * 0.5 + v6 * -4.0 + -1.0;
    CATransform3DMakeTranslation(&v90, v37, v37, 1.0);
    CATransform3DScale(&v89, &v90, v36, v36, 1.0);
    v38 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle];
    v90 = v89;
    objc_msgSend(v38, "setTransform:", &v90);
    v39 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)&v90.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
    *(_OWORD *)&v90.m13 = v39;
    v40 = *(_OWORD *)&CATransform3DIdentity.m23;
    *(_OWORD *)&v90.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
    *(_OWORD *)&v90.m23 = v40;
    v41 = *(_OWORD *)&CATransform3DIdentity.m33;
    *(_OWORD *)&v90.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
    *(_OWORD *)&v90.m33 = v41;
    v42 = *(_OWORD *)&CATransform3DIdentity.m43;
    *(_OWORD *)&v90.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
    *(_OWORD *)&v90.m43 = v42;
    objc_msgSend(v29, "setTransform:", &v90);
    LODWORD(v43) = 0;
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage], "setOpacity:", v43);
    LODWORD(v44) = 0;
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder], "setOpacity:", v44);
    CATransform3DMakeTranslation(&v90, (v5 - v8) * 0.25, -((v5 - v9) * v10), 1.0);
    v45 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeLayer];
    CATransform3DScale(&v89, &v90, v10, v10, 1.0);
    v90 = v89;
    objc_msgSend(v45, "setTransform:", &v90);
    LODWORD(v46) = 1.0;
    objc_msgSend(v45, "setOpacity:", v46);
    CATransform3DMakeTranslation(&v90, (v7 - v5) * 0.5 * v85, (v7 - v5) * 0.5 * v12 - (v7 * 0.5 + v7 * 0.125 + v7 * 0.125), 1.0);
    v47 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeLayer];
    objc_msgSend(v47, "setTransform:", &v90);
  }
  else
  {
    v47 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle];
    m12 = CATransform3DIdentity.m12;
    m13 = CATransform3DIdentity.m13;
    m14 = CATransform3DIdentity.m14;
    m21 = CATransform3DIdentity.m21;
    m22 = CATransform3DIdentity.m22;
    m23 = CATransform3DIdentity.m23;
    m31 = CATransform3DIdentity.m31;
    m24 = CATransform3DIdentity.m24;
    m32 = CATransform3DIdentity.m32;
    m34 = CATransform3DIdentity.m34;
    m33 = CATransform3DIdentity.m33;
    m42 = CATransform3DIdentity.m42;
    m41 = CATransform3DIdentity.m41;
    m44 = CATransform3DIdentity.m44;
    m43 = CATransform3DIdentity.m43;
    v90.m11 = CATransform3DIdentity.m11;
    v90.m12 = m12;
    v56 = m12;
    v90.m13 = m13;
    v90.m14 = m14;
    v57 = m13;
    v58 = m14;
    v90.m21 = m21;
    v90.m22 = m22;
    v59 = m21;
    v60 = m22;
    v90.m23 = m23;
    v90.m24 = m24;
    v61 = m23;
    v90.m31 = m31;
    v90.m32 = m32;
    v90.m33 = m33;
    v90.m34 = m34;
    v90.m41 = m41;
    v90.m42 = m42;
    v90.m43 = m43;
    v90.m44 = m44;
    objc_msgSend(v47, "setTransform:", &v90, *(_QWORD *)&m23, *(_QWORD *)&m22, *(_QWORD *)&m21, *(_QWORD *)&m14, *(_QWORD *)&m13, *(_QWORD *)&m12, *(_QWORD *)&CATransform3DIdentity.m11, *(_QWORD *)&m31);
    CATransform3DMakeScale(&v90, 0.0, 0.0, 1.0);
    objc_msgSend(v29, "setTransform:", &v90);
    LODWORD(v62) = 0;
    objc_msgSend(v29, "setOpacity:", v62);
    LODWORD(v63) = 0;
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage], "setOpacity:", v63);
    v64 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeLayer];
    v90.m11 = CATransform3DIdentity.m11;
    v90.m12 = v56;
    v90.m13 = v57;
    v90.m14 = v58;
    v90.m21 = v59;
    v90.m22 = v60;
    v90.m23 = v61;
    v90.m24 = m24;
    v90.m31 = m31;
    v90.m32 = m32;
    v90.m33 = m33;
    v90.m34 = m34;
    v90.m41 = m41;
    v90.m42 = m42;
    v90.m43 = m43;
    v90.m44 = m44;
    objc_msgSend(v64, "setTransform:", &v90);
    LODWORD(v65) = 1.0;
    objc_msgSend(v64, "setOpacity:", v65);
    v66 = *(void **)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeLayer];
    v90.m11 = v76;
    v90.m12 = v75;
    v90.m13 = v74;
    v90.m14 = v73;
    v90.m21 = v72;
    v90.m22 = v71;
    v90.m23 = v70;
    v90.m24 = m24;
    v90.m31 = v77;
    v90.m32 = m32;
    v90.m33 = m33;
    v90.m34 = m34;
    v90.m41 = m41;
    v90.m42 = m42;
    v90.m43 = m43;
    v90.m44 = m44;
    objc_msgSend(v66, "setTransform:", &v90);
    LODWORD(v67) = 1.0;
    objc_msgSend(v66, "setOpacity:", v67);
    LODWORD(v68) = 1.0;
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage], "setOpacity:", v68);
    LODWORD(v69) = 1.0;
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder], "setOpacity:", v69);
  }
  LODWORD(v48) = 1.0;
  objc_msgSend(v47, "setOpacity:", v48);
  sub_10000B85C();
}

char *sub_10000B67C(uint64_t a1, double a2, double a3)
{
  char *v3;
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char *v16;
  objc_super v18;

  v18.receiver = v3;
  v18.super_class = (Class)type metadata accessor for FMMapAnnotationView();
  v7 = objc_msgSendSuper2(&v18, "hitTest:withEvent:", a1, a2, a3);
  if (v7)
    return (char *)v7;
  v9 = objc_msgSend(v3, "rightCalloutAccessoryView");
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v3, "convertPoint:toCoordinateSpace:", v9, a2, a3);
    v8 = objc_msgSend(v10, "hitTest:withEvent:", a1);

  }
  else
  {
    if (qword_10001A7B0 != -1)
      swift_once(&qword_10001A7B0, sub_1000095C0);
    v11 = *(double *)&xmmword_10001B060;
    objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle], "frame");
    if (sqrt((a2 - (v13 + v12 * 0.5)) * (a2 - (v13 + v12 * 0.5)) + (a3 - (v15 + v14 * 0.5)) * (a3 - (v15 + v14 * 0.5))) >= v11 * 0.5)
    {
      return 0;
    }
    else
    {
      v16 = v3;
      return v3;
    }
  }
  return (char *)v8;
}

void sub_10000B85C()
{
  char *v0;
  id v1;
  id v2;
  unsigned int v3;
  void *v4;
  char **v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  char **v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v1 = objc_msgSend(v0, "traitCollection");
  v2 = objc_msgSend(v1, "userInterfaceStyle");

  v3 = objc_msgSend(v0, "isSelected");
  v4 = (void *)objc_opt_self(UIColor);
  if (v2 == (id)2)
  {
    v5 = &selRef_systemGray2Color;
    if (v3)
      v5 = &selRef_systemGray3Color;
    v6 = objc_msgSend(v4, *v5);
    v7 = objc_msgSend(v6, "CGColor");

    v8 = objc_msgSend((id)objc_opt_self(UIColor), "systemGray3Color");
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle], "setBackgroundColor:", v7);
    v9 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder];
    v10 = objc_msgSend(v8, "CGColor");
    objc_msgSend(v9, "setBackgroundColor:", v10);

    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer], "setFillColor:", v7);
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeBackground], "setFillColor:", v7);

  }
  else
  {
    v11 = &selRef_systemGray6Color;
    if (v3)
      v11 = &selRef_whiteColor;
    v12 = objc_msgSend(v4, *v11);
    v8 = objc_msgSend(v12, "CGColor");

    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle], "setBackgroundColor:", v8);
    v13 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder];
    v14 = objc_msgSend((id)objc_opt_self(UIColor), "whiteColor");
    v15 = objc_msgSend(v14, "CGColor");

    objc_msgSend(v13, "setBackgroundColor:", v15);
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer], "setFillColor:", v8);
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeBackground], "setFillColor:", v8);
  }

  sub_10000BC20();
}

void sub_10000BC20()
{
  char *v0;
  uint64_t v1;
  void *v2;

  if (objc_msgSend(v0, "isSelected")
    && v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated] == 1)
  {
    sub_10000BCA4();
  }
  else
  {
    v1 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_pulseLayer;
    v2 = *(void **)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_pulseLayer];
    if (v2)
    {
      objc_msgSend(v2, "removeAllAnimations");
      v2 = *(void **)&v0[v1];
      if (v2)
      {
        objc_msgSend(v2, "removeFromSuperlayer");
        v2 = *(void **)&v0[v1];
      }
    }
    *(_QWORD *)&v0[v1] = 0;

  }
}

void sub_10000BCA4()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  double v4;
  id v5;
  id v6;
  id v7;
  double v8;
  NSString v9;
  void *v10;
  id v11;
  Class isa;
  Class v13;
  NSString v14;
  id v15;
  Class v16;
  Class v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  Class v23;
  double v24;
  void *v25;
  id v26;
  id v27;
  double v28;
  id v29;
  NSString v30;
  id v31;
  uint64_t v32;
  uint64_t v33;

  if (!*(_QWORD *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_pulseLayer])
  {
    v1 = v0;
    v32 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_pulseLayer;
    v2 = objc_msgSend((id)objc_opt_self(UIColor), "systemGreenColor");
    v3 = objc_msgSend(v2, "CGColor");

    if (qword_10001A7B0 != -1)
      swift_once(&qword_10001A7B0, sub_1000095C0);
    v4 = *(double *)&xmmword_10001B060;
    v5 = objc_msgSend(objc_allocWithZone((Class)CAShapeLayer), "init");
    v6 = objc_msgSend((id)objc_opt_self(UIBezierPath), "bezierPathWithOvalInRect:", 0.0, 0.0, v4, v4);
    v7 = objc_msgSend(v6, "CGPath");

    objc_msgSend(v5, "setPath:", v7);
    objc_msgSend(v5, "setAnchorPoint:", 0.5, 0.5);
    objc_msgSend(v5, "setFrame:", 0.0, -v4, v4, v4);
    objc_msgSend(v5, "setFillColor:", v3);
    LODWORD(v8) = 0;
    objc_msgSend(v5, "setOpacity:", v8);
    v9 = String._bridgeToObjectiveC()();
    v10 = (void *)objc_opt_self(CABasicAnimation);
    v11 = objc_msgSend(v10, "animationWithKeyPath:", v9);

    isa = Int._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v11, "setFromValue:", isa);

    v13 = Double._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v11, "setToValue:", v13);

    objc_msgSend(v11, "setRemovedOnCompletion:", 0);
    objc_msgSend(v11, "setDuration:", 1.5);
    v14 = String._bridgeToObjectiveC()();
    v15 = objc_msgSend(v10, "animationWithKeyPath:", v14);

    v16 = Float._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v15, "setFromValue:", v16);

    v17 = Float._bridgeToObjectiveC()().super.super.isa;
    objc_msgSend(v15, "setToValue:", v17);

    objc_msgSend(v15, "setRemovedOnCompletion:", 0);
    objc_msgSend(v15, "setDuration:", 1.5);
    v18 = objc_msgSend(objc_allocWithZone((Class)CAAnimationGroup), "init");
    v19 = sub_100006ED8(&qword_10001AA18);
    v20 = swift_allocObject(v19, 48, 7);
    *(_OWORD *)(v20 + 16) = xmmword_10000F5C0;
    *(_QWORD *)(v20 + 32) = v11;
    *(_QWORD *)(v20 + 40) = v15;
    v33 = v20;
    specialized Array._endMutation()();
    sub_10000C314();
    v21 = v11;
    v22 = v15;
    v23 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v33);
    objc_msgSend(v18, "setAnimations:", v23);

    objc_msgSend(v18, "setDuration:", 1.5);
    LODWORD(v24) = 0;
    objc_msgSend(v18, "setRepeatCount:", v24);
    v25 = (void *)objc_opt_self(CAMediaTimingFunction);
    v26 = v18;
    v27 = objc_msgSend(v25, "functionWithName:", kCAMediaTimingFunctionEaseOut);
    objc_msgSend(v26, "setTimingFunction:", v27);

    objc_msgSend(v26, "setRemovedOnCompletion:", 0);
    LODWORD(v28) = 2139095040;
    objc_msgSend(v26, "setRepeatCount:", v28);
    v29 = objc_msgSend(v1, "layer");
    objc_msgSend(v29, "insertSublayer:atIndex:", v5, 0);

    v30 = String._bridgeToObjectiveC()();
    objc_msgSend(v5, "addAnimation:forKey:", v26, v30);

    v31 = *(id *)&v1[v32];
    *(_QWORD *)&v1[v32] = v5;

  }
}

id sub_10000C1CC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMMapAnnotationView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FMMapAnnotationView()
{
  return objc_opt_self(_TtC26FindMyNotificationsContent19FMMapAnnotationView);
}

unint64_t sub_10000C314()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001ACD0;
  if (!qword_10001ACD0)
  {
    v1 = objc_opt_self(CAAnimation);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001ACD0);
  }
  return result;
}

uint64_t sub_10000C350(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 160);
  return a1;
}

uint64_t sub_10000C378(uint64_t a1)
{

  return a1;
}

id sub_10000C3A0(void *a1, double a2, double a3, double a4, double a5)
{
  CGPathRef v6;
  id v7;
  id v8;
  double v9;
  CGAffineTransform transform;

  transform.a = 1.0;
  transform.b = 0.0;
  transform.c = 0.0;
  transform.d = 1.0;
  transform.tx = 0.0;
  transform.ty = 0.0;
  v6 = CGPathCreateWithEllipseInRect(*(CGRect *)&a2, &transform);
  objc_msgSend(a1, "setShadowPath:", v6);

  v7 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
  v8 = objc_msgSend(v7, "CGColor");

  objc_msgSend(a1, "setShadowColor:", v8);
  objc_msgSend(a1, "setShadowOffset:", 0.0, 0.0);
  LODWORD(v9) = 1045220557;
  objc_msgSend(a1, "setShadowOpacity:", v9);
  if (qword_10001A7B0 != -1)
    swift_once(&qword_10001A7B0, sub_1000095C0);
  return objc_msgSend(a1, "setShadowRadius:", *((double *)&xmmword_10001B060 + 1));
}

double sub_10000C4F8(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

void sub_10000C514()
{
  _BYTE *v0;
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

  v1 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone((Class)CALayer), "init");
  v2 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone((Class)CALayer), "init");
  v3 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage;
  *(_QWORD *)&v0[v3] = objc_msgSend(objc_allocWithZone((Class)CALayer), "init");
  v4 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer;
  *(_QWORD *)&v0[v4] = objc_msgSend(objc_allocWithZone((Class)CAShapeLayer), "init");
  v5 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage;
  *(_QWORD *)&v0[v5] = objc_msgSend(objc_allocWithZone((Class)CALayer), "init");
  v6 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeLayer;
  *(_QWORD *)&v0[v6] = objc_msgSend(objc_allocWithZone((Class)CALayer), "init");
  v7 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeBackground;
  *(_QWORD *)&v0[v7] = objc_msgSend(objc_allocWithZone((Class)CAShapeLayer), "init");
  v8 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeImageLayer;
  *(_QWORD *)&v0[v8] = objc_msgSend(objc_allocWithZone((Class)CALayer), "init");
  v9 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeLayer;
  *(_QWORD *)&v0[v9] = objc_msgSend(objc_allocWithZone((Class)CALayer), "init");
  v10 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeBackground;
  *(_QWORD *)&v0[v10] = objc_msgSend(objc_allocWithZone((Class)CAShapeLayer), "init");
  v11 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeCircleLayer;
  *(_QWORD *)&v0[v11] = objc_msgSend(objc_allocWithZone((Class)CAShapeLayer), "init");
  v12 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeImageLayer;
  *(_QWORD *)&v0[v12] = objc_msgSend(objc_allocWithZone((Class)CALayer), "init");
  v13 = OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_accuracyLayer;
  *(_QWORD *)&v0[v13] = objc_msgSend(objc_allocWithZone((Class)CAShapeLayer), "init");
  *(_QWORD *)&v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_pulseLayer] = 0;
  v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isShowingInaccurate] = 0;
  v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_shouldHideCallout] = 0;
  v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_shouldHideCenterCircle] = 0;
  v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_applyShadowToBalloonTail] = 0;
  v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated] = 0;
  v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_canShowBalloon] = 1;
  v0[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isPulsating] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000107F0, "FindMyNotificationsContent/FMAnnotationView.swift", 49, 2, 162, 0);
  __break(1u);
}

uint64_t sub_10000C758()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for FMLocalize()
{
  return objc_opt_self(_TtC26FindMyNotificationsContent10FMLocalize);
}

id sub_10000C8F0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for NotificationView()
{
  return objc_opt_self(_TtC26FindMyNotificationsContent16NotificationView);
}

id sub_10000CA68()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMPersonAnnotationView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FMPersonAnnotationView()
{
  return objc_opt_self(_TtC26FindMyNotificationsContent22FMPersonAnnotationView);
}

id sub_10000CABC(uint64_t a1, uint64_t a2, char a3, char a4, double a5, double a6, double a7)
{
  _BYTE *v7;
  _QWORD *v8;
  _QWORD *v9;
  double *v10;
  objc_super v12;

  v8 = &v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_title];
  *v8 = 0;
  v8[1] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_badgeImage] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage] = 0;
  v9 = &v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_fmClusterIdentifier];
  *v9 = a1;
  v9[1] = a2;
  v10 = (double *)&v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_coordinate];
  *v10 = a5;
  v10[1] = a6;
  *(double *)&v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_horizontalAccuracy] = a7;
  v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isWithYou] = a2 == 1;
  v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isInaccurate] = a3;
  v7[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isLive] = a4;
  v12.receiver = v7;
  v12.super_class = (Class)type metadata accessor for FMAnnotation();
  return objc_msgSendSuper2(&v12, "init");
}

Swift::Int sub_10000CB6C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  Swift::UInt v3;
  _QWORD v5[9];

  v2 = *v0;
  v1 = v0[1];
  Hasher.init(_seed:)(v5, 0);
  switch(v1)
  {
    case 0:
      v3 = 0;
      goto LABEL_7;
    case 1:
      v3 = 1;
      goto LABEL_7;
    case 2:
      v3 = 2;
      goto LABEL_7;
    case 3:
      v3 = 3;
LABEL_7:
      Hasher._combine(_:)(v3);
      break;
    default:
      Hasher._combine(_:)(4uLL);
      String.hash(into:)(v5, v2, v1);
      break;
  }
  return Hasher._finalize()();
}

void sub_10000CC1C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  Swift::UInt v4;
  uint64_t v5;

  v3 = v1[1];
  switch(v3)
  {
    case 0:
      v4 = 0;
      goto LABEL_7;
    case 1:
      v4 = 1;
      goto LABEL_7;
    case 2:
      v4 = 2;
      goto LABEL_7;
    case 3:
      v4 = 3;
LABEL_7:
      Hasher._combine(_:)(v4);
      break;
    default:
      v5 = *v1;
      Hasher._combine(_:)(4uLL);
      String.hash(into:)(a1, v5, v3);
      break;
  }
}

Swift::Int sub_10000CCB4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  Swift::UInt v4;
  _QWORD v6[9];

  v3 = *v1;
  v2 = v1[1];
  Hasher.init(_seed:)(v6, a1);
  switch(v2)
  {
    case 0:
      v4 = 0;
      goto LABEL_7;
    case 1:
      v4 = 1;
      goto LABEL_7;
    case 2:
      v4 = 2;
      goto LABEL_7;
    case 3:
      v4 = 3;
LABEL_7:
      Hasher._combine(_:)(v4);
      break;
    default:
      Hasher._combine(_:)(4uLL);
      String.hash(into:)(v6, v3, v2);
      break;
  }
  return Hasher._finalize()();
}

uint64_t sub_10000CD60(uint64_t *a1, uint64_t a2)
{
  return sub_10000E240(*a1, a1[1], *(_QWORD *)a2, *(_QWORD *)(a2 + 8));
}

void sub_10000CD74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v1 = v0;
  v2 = type metadata accessor for UUID(0);
  __chkstk_darwin(v2);
  v3 = type metadata accessor for FMAnnotationIdentifier(0);
  v4 = __chkstk_darwin(v3);
  __chkstk_darwin(v4);
  v6 = (char *)&v8 - v5;
  sub_10000E344(v1, (uint64_t)&v8 - v5);
  v7 = (char *)sub_10000CE58 + 4 * byte_10000FD4C[swift_getEnumCaseMultiPayload(v6, v3)];
  __asm { BR              X10 }
}

uint64_t sub_10000CE58()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  Hasher._combine(_:)(1uLL);
  String.hash(into:)(v0, v2, v3);
  return swift_bridgeObjectRelease(v3);
}

void sub_10000CEC4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  v3 = v1[1];
  v4 = v1[2];
  v5 = v1[3];
  Hasher._combine(_:)(5uLL);
  String.hash(into:)(v0, v2, v3);
  swift_bridgeObjectRelease(v3);
  String.hash(into:)(v0, v4, v5);
  JUMPOUT(0x10000CEA0);
}

void sub_10000CF08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v3, v1, v2);
  Hasher._combine(_:)(6uLL);
  v5 = sub_100005A50(&qword_10001AF88, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  dispatch thunk of Hashable.hash(into:)(v0, v2, v5);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v2);
  JUMPOUT(0x10000CEA4);
}

void sub_10000CF6C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Swift::UInt v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *v1;
  v6 = *(_QWORD *)(*v1 + 16);
  v5 = *(_QWORD *)(*v1 + 24);
  v7 = *(_QWORD *)(*v1 + 32);
  Hasher._combine(_:)(7uLL);
  switch(v5)
  {
    case 0:
      v8 = 0;
      goto LABEL_7;
    case 1:
      v8 = 1;
      goto LABEL_7;
    case 2:
      v8 = 2;
      goto LABEL_7;
    case 3:
      v8 = 3;
LABEL_7:
      Hasher._combine(_:)(v8);
      break;
    default:
      Hasher._combine(_:)(4uLL);
      String.hash(into:)(v0, v6, v5);
      break;
  }
  Hasher._combine(_:)(*(_QWORD *)(v7 + 16));
  v9 = *(_QWORD *)(v7 + 16);
  if (v9)
  {
    v10 = v7 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v11 = *(_QWORD *)(v3 + 72);
    do
    {
      sub_10000E344(v10, v2);
      sub_10000CD74();
      sub_10000E308(v2);
      v10 += v11;
      --v9;
    }
    while (v9);
  }
  swift_release(v4);
  JUMPOUT(0x10000CEA4);
}

Swift::Int sub_10000D05C()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  sub_10000CD74();
  return Hasher._finalize()();
}

Swift::Int sub_10000D09C(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  sub_10000CD74();
  return Hasher._finalize()();
}

void sub_10000D1A4()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000039, 0x8000000100010BD0, "FindMyNotificationsContent/FMAnnotation.swift", 45, 2, 123, 0);
  __break(1u);
}

void sub_10000D1FC()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000003ELL, 0x8000000100010B90, "FindMyNotificationsContent/FMAnnotation.swift", 45, 2, 127, 0);
  __break(1u);
}

void sub_10000D254()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000003ALL, 0x8000000100010B50, "FindMyNotificationsContent/FMAnnotation.swift", 45, 2, 131, 0);
  __break(1u);
}

uint64_t sub_10000D2AC(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  char v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  char v34;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  _QWORD *v47;
  _BYTE v48[24];
  uint64_t v49;

  v2 = v1;
  ObjectType = swift_getObjectType(v2);
  v5 = type metadata accessor for FMAnnotationIdentifier(0);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v46 - v9;
  sub_100007028(a1, (uint64_t)v48);
  if (v49)
  {
    if ((swift_dynamicCast(&v47, v48, (char *)&type metadata for Any + 8, ObjectType, 6) & 1) != 0)
    {
      v11 = v47;
      v12 = *(void **)((char *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage);
      v13 = *(void **)((char *)v47 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage);
      if (v12)
      {
        if (!v13)
          goto LABEL_31;
        sub_100007244(0, &qword_10001ABD0, UIImage_ptr);
        v14 = v13;
        v15 = v12;
        v16 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

        if ((v16 & 1) == 0)
          goto LABEL_31;
      }
      else if (v13)
      {
        goto LABEL_31;
      }
      v17 = (*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x190))();
      (*(void (**)(uint64_t))((swift_isaMask & *v11) + 0x190))(v17);
      sub_10000DC98((uint64_t)v10, (uint64_t)v8);
      v19 = v18;
      sub_10000E308((uint64_t)v8);
      sub_10000E308((uint64_t)v10);
      if ((v19 & 1) == 0)
        goto LABEL_31;
      sub_100007244(0, (unint64_t *)&unk_10001AEC0, NSObject_ptr);
      v20 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x188))();
      v21 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v11) + 0x188))();
      v22 = static NSObject.== infix(_:_:)(v20, v21);

      if ((v22 & 1) == 0)
        goto LABEL_31;
      v23 = (*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x198))();
      if (((v23 ^ (*(unsigned int (**)(void))((swift_isaMask & *v11) + 0x198))()) & 1) != 0)
        goto LABEL_31;
      objc_msgSend(v2, "coordinate");
      v25 = v24;
      objc_msgSend(v11, "coordinate");
      if (v25 != v26)
        goto LABEL_31;
      objc_msgSend(v2, "coordinate");
      v28 = v27;
      objc_msgSend(v11, "coordinate");
      if (v28 != v29
        || *(double *)((char *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_horizontalAccuracy) != *(double *)((char *)v11 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_horizontalAccuracy))
      {
        goto LABEL_31;
      }
      v30 = (_QWORD *)((char *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_fmClusterIdentifier);
      v31 = *(_QWORD *)((char *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_fmClusterIdentifier + 8);
      v32 = (_QWORD *)((char *)v11 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_fmClusterIdentifier);
      v33 = *(_QWORD *)((char *)v11 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_fmClusterIdentifier + 8);
      switch(v31)
      {
        case 0:
          if (v33)
            goto LABEL_31;
          break;
        case 1:
          if (v33 != 1)
            goto LABEL_31;
          break;
        case 2:
          if (v33 != 2)
            goto LABEL_31;
          break;
        case 3:
          if (v33 != 3)
            goto LABEL_31;
          break;
        default:
          if (v33 < 4
            || (*v30 != *v32 || v31 != v33)
            && (_stringCompareWithSmolCheck(_:_:expecting:)(*v30, v31, *v32, v33, 0) & 1) == 0)
          {
            goto LABEL_31;
          }
          break;
      }
      if (*((unsigned __int8 *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isInaccurate) != *((unsigned __int8 *)v11 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isInaccurate)
        || *((unsigned __int8 *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isLive) != *((unsigned __int8 *)v11 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isLive)
        || *((unsigned __int8 *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isWithYou) != *((unsigned __int8 *)v11 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_isWithYou))
      {
        goto LABEL_31;
      }
      v36 = (_QWORD *)((char *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_title);
      v37 = *(_QWORD *)((char *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_title + 8);
      v38 = (_QWORD *)((char *)v11 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_title);
      v39 = *(_QWORD *)((char *)v11 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_title + 8);
      if (v37)
      {
        if (!v39
          || (*v36 != *v38 || v37 != v39)
          && (_stringCompareWithSmolCheck(_:_:expecting:)(*v36, v37, *v38, v39, 0) & 1) == 0)
        {
          goto LABEL_31;
        }
LABEL_41:
        v40 = *(void **)((char *)v2 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_badgeImage);
        v41 = *(void **)((char *)v11 + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_badgeImage);
        if (!v40)
        {
          v45 = v41;

          if (!v41)
          {
            v34 = 1;
            return v34 & 1;
          }

          goto LABEL_32;
        }
        if (v41)
        {
          sub_100007244(0, &qword_10001ABD0, UIImage_ptr);
          v42 = v40;
          v43 = v41;
          v44 = v42;
          v34 = static NSObject.== infix(_:_:)(v44, v43);

          return v34 & 1;
        }
        goto LABEL_31;
      }
      if (!v39)
        goto LABEL_41;
LABEL_31:

    }
  }
  else
  {
    sub_1000071F0((uint64_t)v48, &qword_10001AA48);
  }
LABEL_32:
  v34 = 0;
  return v34 & 1;
}

id sub_10000D7E0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FMAnnotation();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FMAnnotation()
{
  return objc_opt_self(_TtC26FindMyNotificationsContent12FMAnnotation);
}

unint64_t destroy for FMAnnotationClusterIdentifier(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease(result);
  return result;
}

uint64_t _s26FindMyNotificationsContent29FMAnnotationClusterIdentifierOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain(v3);
  }
  return a1;
}

_QWORD *assignWithCopy for FMAnnotationClusterIdentifier(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a1[1];
  v5 = a2[1];
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      v7 = a2[1];
      a1[1] = v7;
      swift_bridgeObjectRetain(v7);
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease(a1[1]);
    goto LABEL_7;
  }
  *a1 = *a2;
  v6 = a2[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t assignWithTake for FMAnnotationClusterIdentifier(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)(a1 + 8);
  if (v4 < 0xFFFFFFFF)
    goto LABEL_5;
  v5 = *(_QWORD *)(a2 + 8);
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease(v4);
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for FMAnnotationClusterIdentifier(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFC && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483644);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 3;
  if (v4 >= 5)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for FMAnnotationClusterIdentifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFC)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 3;
  }
  return result;
}

uint64_t sub_10000DAA4(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_10000DABC(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for FMAnnotationClusterIdentifier()
{
  return &type metadata for FMAnnotationClusterIdentifier;
}

unint64_t sub_10000DAF0()
{
  unint64_t result;

  result = qword_10001AEB0;
  if (!qword_10001AEB0)
  {
    result = swift_getWitnessTable(&unk_10000FDE0, &type metadata for FMAnnotationClusterIdentifier);
    atomic_store(result, (unint64_t *)&qword_10001AEB0);
  }
  return result;
}

void *sub_10000DB34()
{
  return &protocol witness table for ObjectIdentifier;
}

uint64_t sub_10000DB40@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for FMAnnotation();
  result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000DB7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  BOOL v17;
  uint64_t v19;

  v4 = type metadata accessor for FMAnnotationIdentifier(0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v10 = (char *)&v19 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v15 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v13 = *(_QWORD *)(v8 + 72);
      v14 = v11 - 1;
      do
      {
        sub_10000E344(a1 + v12, (uint64_t)v10);
        sub_10000E344(a2 + v12, (uint64_t)v7);
        v15 = sub_10000DC98(v10, v7);
        sub_10000E308((uint64_t)v7);
        sub_10000E308((uint64_t)v10);
        v17 = v14-- != 0;
        if ((v15 & 1) == 0)
          break;
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

void sub_10000DC98(uint64_t a1, uint64_t a2)
{
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
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  _QWORD v19[3];
  uint64_t v20;

  v20 = a2;
  v3 = type metadata accessor for UUID(0);
  v19[1] = *(_QWORD *)(v3 - 8);
  v19[2] = v3;
  __chkstk_darwin(v3);
  v19[0] = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for FMAnnotationIdentifier(0);
  v6 = __chkstk_darwin(v5);
  v7 = __chkstk_darwin(v6);
  v8 = __chkstk_darwin(v7);
  v9 = __chkstk_darwin(v8);
  v10 = __chkstk_darwin(v9);
  v11 = __chkstk_darwin(v10);
  __chkstk_darwin(v11);
  v12 = sub_100006ED8(&qword_10001AED0);
  v13 = __chkstk_darwin(v12);
  v15 = (char *)v19 + *(int *)(v13 + 48) - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = a1;
  v17 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E344(v16, (uint64_t)v17);
  sub_10000E344(v20, (uint64_t)v15);
  v18 = (char *)sub_10000DE60 + 4 * byte_10000FD5C[swift_getEnumCaseMultiPayload(v17, v5)];
  __asm { BR              X10 }
}

uint64_t sub_10000DE60()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  char v9;

  sub_10000E344(v3, (uint64_t)v2);
  v5 = *v2;
  v4 = v2[1];
  if (swift_getEnumCaseMultiPayload(v1, v0))
  {
    swift_bridgeObjectRelease(v4);
    sub_1000071F0(v3, &qword_10001AED0);
    goto LABEL_9;
  }
  v6 = v1[1];
  if (v5 == *v1 && v4 == v6)
  {
    swift_bridgeObjectRelease_n(v4, 2);
    goto LABEL_11;
  }
  v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v4, *v1, v1[1], 0);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v4);
  if ((v8 & 1) != 0)
  {
LABEL_11:
    sub_10000E308(v3);
    v9 = 1;
    return v9 & 1;
  }
  sub_10000E308(v3);
LABEL_9:
  v9 = 0;
  return v9 & 1;
}

uint64_t sub_10000E240(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t result;

  switch(a2)
  {
    case 0:
      if (a4)
        goto LABEL_14;
      result = 1;
      break;
    case 1:
      if (a4 != 1)
        goto LABEL_14;
      result = 1;
      break;
    case 2:
      if (a4 != 2)
        goto LABEL_14;
      result = 1;
      break;
    case 3:
      if (a4 != 3)
        goto LABEL_14;
      result = 1;
      break;
    default:
      if (a4 < 4)
      {
LABEL_14:
        result = 0;
      }
      else if (a1 == a3 && a2 == a4)
      {
        result = 1;
      }
      else
      {
        result = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, a4, 0);
      }
      break;
  }
  return result;
}

uint64_t type metadata accessor for FMAnnotationIdentifier(uint64_t a1)
{
  uint64_t result;

  result = qword_10001AF48;
  if (!qword_10001AF48)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FMAnnotationIdentifier);
  return result;
}

uint64_t sub_10000E308(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FMAnnotationIdentifier(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000E344(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FMAnnotationIdentifier(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E388(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 4)
    return swift_bridgeObjectRelease(a2);
  return result;
}

uint64_t *sub_10000E39C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain(v9);
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload(a2, a3))
    {
      case 0u:
        v8 = a2[1];
        *a1 = *a2;
        a1[1] = v8;
        swift_bridgeObjectRetain(v8);
        swift_storeEnumTagMultiPayload(a1, a3, 0);
        break;
      case 1u:
        v11 = a2[1];
        *a1 = *a2;
        a1[1] = v11;
        swift_bridgeObjectRetain(v11);
        swift_storeEnumTagMultiPayload(a1, a3, 1);
        break;
      case 2u:
        v12 = a2[1];
        *a1 = *a2;
        a1[1] = v12;
        swift_bridgeObjectRetain(v12);
        swift_storeEnumTagMultiPayload(a1, a3, 2);
        break;
      case 3u:
        v13 = a2[1];
        *a1 = *a2;
        a1[1] = v13;
        swift_bridgeObjectRetain(v13);
        swift_storeEnumTagMultiPayload(a1, a3, 3);
        break;
      case 4u:
        v14 = a2[1];
        *a1 = *a2;
        a1[1] = v14;
        v15 = a2[2];
        v16 = a2[3];
        a1[2] = v15;
        a1[3] = v16;
        swift_bridgeObjectRetain(v14);
        swift_bridgeObjectRetain(v16);
        swift_storeEnumTagMultiPayload(a1, a3, 4);
        break;
      case 5u:
        v17 = type metadata accessor for UUID(0);
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(a1, a2, v17);
        swift_storeEnumTagMultiPayload(a1, a3, 5);
        break;
      case 6u:
        v18 = *a2;
        *a1 = *a2;
        swift_retain(v18);
        swift_storeEnumTagMultiPayload(a1, a3, 6);
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_10000E53C(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = swift_getEnumCaseMultiPayload(a1, a2);
  switch((int)result)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      v4 = a1[1];
      goto LABEL_4;
    case 4:
      swift_bridgeObjectRelease(a1[1]);
      v4 = a1[3];
LABEL_4:
      result = swift_bridgeObjectRelease(v4);
      break;
    case 5:
      v5 = type metadata accessor for UUID(0);
      result = (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
      break;
    case 6:
      result = swift_release(*a1);
      break;
    default:
      return result;
  }
  return result;
}

_QWORD *sub_10000E5D4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
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
  uint64_t v17;

  switch(swift_getEnumCaseMultiPayload(a2, a3))
  {
    case 0u:
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain(v6);
      v7 = a1;
      v8 = a3;
      v9 = 0;
      goto LABEL_10;
    case 1u:
      v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      swift_bridgeObjectRetain(v10);
      v7 = a1;
      v8 = a3;
      v9 = 1;
      goto LABEL_10;
    case 2u:
      v11 = a2[1];
      *a1 = *a2;
      a1[1] = v11;
      swift_bridgeObjectRetain(v11);
      v7 = a1;
      v8 = a3;
      v9 = 2;
      goto LABEL_10;
    case 3u:
      v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      swift_bridgeObjectRetain(v12);
      v7 = a1;
      v8 = a3;
      v9 = 3;
      goto LABEL_10;
    case 4u:
      v13 = a2[1];
      *a1 = *a2;
      a1[1] = v13;
      v14 = a2[2];
      v15 = a2[3];
      a1[2] = v14;
      a1[3] = v15;
      swift_bridgeObjectRetain(v13);
      swift_bridgeObjectRetain(v15);
      v7 = a1;
      v8 = a3;
      v9 = 4;
      goto LABEL_10;
    case 5u:
      v16 = type metadata accessor for UUID(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(a1, a2, v16);
      v7 = a1;
      v8 = a3;
      v9 = 5;
      goto LABEL_10;
    case 6u:
      v17 = *a2;
      *a1 = *a2;
      swift_retain(v17);
      v7 = a1;
      v8 = a3;
      v9 = 6;
LABEL_10:
      swift_storeEnumTagMultiPayload(v7, v8, v9);
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_QWORD *sub_10000E734(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
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

  if (a1 != a2)
  {
    sub_10000E308((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload(a2, a3))
    {
      case 0u:
        *a1 = *a2;
        v6 = a2[1];
        a1[1] = v6;
        swift_bridgeObjectRetain(v6);
        v7 = a1;
        v8 = a3;
        v9 = 0;
        goto LABEL_11;
      case 1u:
        *a1 = *a2;
        v10 = a2[1];
        a1[1] = v10;
        swift_bridgeObjectRetain(v10);
        v7 = a1;
        v8 = a3;
        v9 = 1;
        goto LABEL_11;
      case 2u:
        *a1 = *a2;
        v11 = a2[1];
        a1[1] = v11;
        swift_bridgeObjectRetain(v11);
        v7 = a1;
        v8 = a3;
        v9 = 2;
        goto LABEL_11;
      case 3u:
        *a1 = *a2;
        v12 = a2[1];
        a1[1] = v12;
        swift_bridgeObjectRetain(v12);
        v7 = a1;
        v8 = a3;
        v9 = 3;
        goto LABEL_11;
      case 4u:
        *a1 = *a2;
        v13 = a2[1];
        a1[1] = v13;
        a1[2] = a2[2];
        v14 = a2[3];
        a1[3] = v14;
        swift_bridgeObjectRetain(v13);
        swift_bridgeObjectRetain(v14);
        v7 = a1;
        v8 = a3;
        v9 = 4;
        goto LABEL_11;
      case 5u:
        v15 = type metadata accessor for UUID(0);
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(a1, a2, v15);
        v7 = a1;
        v8 = a3;
        v9 = 5;
        goto LABEL_11;
      case 6u:
        v16 = *a2;
        *a1 = *a2;
        swift_retain(v16);
        v7 = a1;
        v8 = a3;
        v9 = 6;
LABEL_11:
        swift_storeEnumTagMultiPayload(v7, v8, v9);
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

void *sub_10000E8D4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload(a2, a3) == 5)
  {
    v6 = type metadata accessor for UUID(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload(a1, a3, 5);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_10000E960(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_10000E308((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 5)
    {
      v6 = type metadata accessor for UUID(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload(a1, a3, 5);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10000E9FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_10000EA08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_10000EA18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

uint64_t sub_10000EA28(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[7];

  v4[0] = &unk_10000FE98;
  v4[1] = &unk_10000FE98;
  v4[2] = &unk_10000FE98;
  v4[3] = &unk_10000FE98;
  v4[4] = &unk_10000FEB0;
  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(result - 8) + 64;
    v4[6] = &unk_10000FEC8;
    swift_initEnumMetadataMultiPayload(a1, 256, 7, v4);
    return 0;
  }
  return result;
}

uint64_t sub_10000EAB0()
{
  return sub_100005A50(&qword_10001AF80, type metadata accessor for FMAnnotationIdentifier, (uint64_t)&unk_10000FEE0);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC26FindMyNotificationsContentP33_91158E0392547680BDBAAA0AFB96AE1019ResourceBundleClass);
}
