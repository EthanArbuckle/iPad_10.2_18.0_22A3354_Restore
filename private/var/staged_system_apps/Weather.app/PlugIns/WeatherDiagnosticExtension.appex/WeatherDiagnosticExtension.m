void sub_100004694(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.weather", "Diagnostics");
  v2 = (void *)qword_10000C490;
  qword_10000C490 = (uint64_t)v1;

}

unint64_t *DiagnosticFileProvider.files()()
{
  unint64_t *v0;
  char *v1;

  v0 = sub_100004760();
  v1 = sub_1000049A4();
  sub_100005A90((uint64_t)v1);
  return v0;
}

unint64_t *sub_100004760()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  void (*v8)(_BYTE *, uint64_t);
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t *v18;
  id v19;
  uint64_t v20;
  _BYTE v22[16];
  id v23;

  v0 = type metadata accessor for URL(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v4 = &v22[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  v6 = &v22[-v5];
  type metadata accessor for AppGroup(0);
  v7 = static AppGroup.weather.getter();
  AppGroup.containerURL.getter();
  swift_release(v7);
  URL.appendingPathComponent(_:)(0x74736F6E67616964, 0xEB00000000736369);
  v8 = *(void (**)(_BYTE *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v9 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  URL.path.getter(v9);
  v11 = v10;
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  v23 = 0;
  v13 = objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v12, &v23);

  v14 = v23;
  if (v13)
  {
    v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v13, &type metadata for String);
    v16 = v14;

    __chkstk_darwin(v17);
    *(_QWORD *)&v22[-16] = v6;
    v18 = sub_1000055F0((void (*)(_QWORD *__return_ptr, _QWORD *))sub_100005C44, (uint64_t)&v22[-32], v15);
    v8(v6, v0);
    swift_bridgeObjectRelease(v15);
  }
  else
  {
    v19 = v23;
    v20 = _convertNSErrorToError(_:)(v14);

    swift_willThrow();
    swift_errorRelease(v20);
    v8(v6, v0);
    return (unint64_t *)&_swiftEmptyArrayStorage;
  }
  return v18;
}

char *sub_1000049A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t inited;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_BYTE *, uint64_t);
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
  char *v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  char *v70;
  _BYTE v72[128];

  v0 = type metadata accessor for Database.Location(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = &v72[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = __chkstk_darwin(v2);
  v7 = &v72[-v6];
  v8 = __chkstk_darwin(v5);
  v10 = &v72[-v9];
  v11 = __chkstk_darwin(v8);
  v13 = &v72[-v12];
  __chkstk_darwin(v11);
  v15 = &v72[-v14];
  v16 = sub_100005B68(&qword_10000C448);
  inited = swift_initStackObject(v16, v72);
  *(_OWORD *)(inited + 16) = xmmword_100007510;
  type metadata accessor for NotificationStore(0);
  v18 = static NotificationStore.location.getter();
  v19 = Database.Location.path.getter(v18);
  v21 = v20;
  v22 = *(void (**)(_BYTE *, uint64_t))(v1 + 8);
  v22(v15, v0);
  *(_QWORD *)(inited + 32) = v19;
  *(_QWORD *)(inited + 40) = v21;
  type metadata accessor for GeocodeStore(0);
  v23 = static GeocodeStore.location.getter();
  v24 = Database.Location.path.getter(v23);
  v26 = v25;
  v22(v13, v0);
  *(_QWORD *)(inited + 48) = v24;
  *(_QWORD *)(inited + 56) = v26;
  type metadata accessor for WeatherDataStore(0);
  v27 = static WeatherDataStore.location.getter();
  v28 = Database.Location.path.getter(v27);
  v30 = v29;
  v22(v10, v0);
  *(_QWORD *)(inited + 64) = v28;
  *(_QWORD *)(inited + 72) = v30;
  type metadata accessor for AQIScaleStore(0);
  *(_QWORD *)(inited + 80) = static AQIScaleStore.locationPath.getter();
  *(_QWORD *)(inited + 88) = v31;
  type metadata accessor for LocationMetadataStore(0);
  v32 = static LocationMetadataStore.location.getter();
  v33 = Database.Location.path.getter(v32);
  v35 = v34;
  v22(v7, v0);
  *(_QWORD *)(inited + 96) = v33;
  *(_QWORD *)(inited + 104) = v35;
  type metadata accessor for WeatherStatisticsDataStore(0);
  v36 = static WeatherStatisticsDataStore.location.getter();
  v37 = Database.Location.path.getter(v36);
  v39 = v38;
  v22(v4, v0);
  *(_QWORD *)(inited + 112) = v37;
  *(_QWORD *)(inited + 120) = v39;
  v40 = *(_QWORD *)(inited + 40);
  if (v40)
  {
    v41 = *(_QWORD *)(inited + 32);
    swift_bridgeObjectRetain(*(_QWORD *)(inited + 40));
    v42 = sub_100005710(0, 1, 1, (uint64_t)&_swiftEmptyArrayStorage);
    v44 = *((_QWORD *)v42 + 2);
    v43 = *((_QWORD *)v42 + 3);
    if (v44 >= v43 >> 1)
      v42 = sub_100005710((char *)(v43 > 1), v44 + 1, 1, (uint64_t)v42);
    *((_QWORD *)v42 + 2) = v44 + 1;
    v45 = &v42[16 * v44];
    *((_QWORD *)v45 + 4) = v41;
    *((_QWORD *)v45 + 5) = v40;
  }
  else
  {
    v42 = (char *)&_swiftEmptyArrayStorage;
  }
  v46 = *(_QWORD *)(inited + 56);
  if (v46)
  {
    v47 = *(_QWORD *)(inited + 48);
    swift_bridgeObjectRetain(*(_QWORD *)(inited + 56));
    if ((swift_isUniquelyReferenced_nonNull_native(v42) & 1) == 0)
      v42 = sub_100005710(0, *((_QWORD *)v42 + 2) + 1, 1, (uint64_t)v42);
    v49 = *((_QWORD *)v42 + 2);
    v48 = *((_QWORD *)v42 + 3);
    if (v49 >= v48 >> 1)
      v42 = sub_100005710((char *)(v48 > 1), v49 + 1, 1, (uint64_t)v42);
    *((_QWORD *)v42 + 2) = v49 + 1;
    v50 = &v42[16 * v49];
    *((_QWORD *)v50 + 4) = v47;
    *((_QWORD *)v50 + 5) = v46;
  }
  v51 = *(_QWORD *)(inited + 72);
  if (v51)
  {
    v52 = *(_QWORD *)(inited + 64);
    swift_bridgeObjectRetain(*(_QWORD *)(inited + 72));
    if ((swift_isUniquelyReferenced_nonNull_native(v42) & 1) == 0)
      v42 = sub_100005710(0, *((_QWORD *)v42 + 2) + 1, 1, (uint64_t)v42);
    v54 = *((_QWORD *)v42 + 2);
    v53 = *((_QWORD *)v42 + 3);
    if (v54 >= v53 >> 1)
      v42 = sub_100005710((char *)(v53 > 1), v54 + 1, 1, (uint64_t)v42);
    *((_QWORD *)v42 + 2) = v54 + 1;
    v55 = &v42[16 * v54];
    *((_QWORD *)v55 + 4) = v52;
    *((_QWORD *)v55 + 5) = v51;
  }
  v56 = *(_QWORD *)(inited + 88);
  if (v56)
  {
    v57 = *(_QWORD *)(inited + 80);
    swift_bridgeObjectRetain(*(_QWORD *)(inited + 88));
    if ((swift_isUniquelyReferenced_nonNull_native(v42) & 1) == 0)
      v42 = sub_100005710(0, *((_QWORD *)v42 + 2) + 1, 1, (uint64_t)v42);
    v59 = *((_QWORD *)v42 + 2);
    v58 = *((_QWORD *)v42 + 3);
    if (v59 >= v58 >> 1)
      v42 = sub_100005710((char *)(v58 > 1), v59 + 1, 1, (uint64_t)v42);
    *((_QWORD *)v42 + 2) = v59 + 1;
    v60 = &v42[16 * v59];
    *((_QWORD *)v60 + 4) = v57;
    *((_QWORD *)v60 + 5) = v56;
  }
  v61 = *(_QWORD *)(inited + 104);
  if (v61)
  {
    v62 = *(_QWORD *)(inited + 96);
    swift_bridgeObjectRetain(*(_QWORD *)(inited + 104));
    if ((swift_isUniquelyReferenced_nonNull_native(v42) & 1) == 0)
      v42 = sub_100005710(0, *((_QWORD *)v42 + 2) + 1, 1, (uint64_t)v42);
    v64 = *((_QWORD *)v42 + 2);
    v63 = *((_QWORD *)v42 + 3);
    if (v64 >= v63 >> 1)
      v42 = sub_100005710((char *)(v63 > 1), v64 + 1, 1, (uint64_t)v42);
    *((_QWORD *)v42 + 2) = v64 + 1;
    v65 = &v42[16 * v64];
    *((_QWORD *)v65 + 4) = v62;
    *((_QWORD *)v65 + 5) = v61;
  }
  v66 = *(_QWORD *)(inited + 120);
  if (v66)
  {
    v67 = *(_QWORD *)(inited + 112);
    swift_bridgeObjectRetain(*(_QWORD *)(inited + 120));
    if ((swift_isUniquelyReferenced_nonNull_native(v42) & 1) == 0)
      v42 = sub_100005710(0, *((_QWORD *)v42 + 2) + 1, 1, (uint64_t)v42);
    v69 = *((_QWORD *)v42 + 2);
    v68 = *((_QWORD *)v42 + 3);
    if (v69 >= v68 >> 1)
      v42 = sub_100005710((char *)(v68 > 1), v69 + 1, 1, (uint64_t)v42);
    *((_QWORD *)v42 + 2) = v69 + 1;
    v70 = &v42[16 * v69];
    *((_QWORD *)v70 + 4) = v67;
    *((_QWORD *)v70 + 5) = v66;
  }
  swift_setDeallocating(inited);
  sub_100005974();
  return v42;
}

uint64_t DiagnosticFileProvider.exportDirectory()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t *v13;
  char *v14;
  NSString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, _QWORD *);
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  id v27;
  NSURL *v28;
  void *v29;
  void *v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t *v33;
  unint64_t *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  NSURL *v43;
  void *v44;
  void *v45;
  NSURL *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  unint64_t *v50;
  unint64_t *v51;
  unint64_t *v52;
  unint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void (*v65)(char *, uint64_t);
  uint64_t v66;
  unint64_t *v67;
  unint64_t *v69;
  uint64_t v70;
  unint64_t *v71;
  __int128 v72;
  uint64_t v73;
  void (*v74)(char *, uint64_t);
  _QWORD *v75;
  char *v76;
  unint64_t *v77;

  v70 = a1;
  v75 = (_QWORD *)type metadata accessor for UUID(0);
  v1 = *(v75 - 1);
  __chkstk_darwin(v75);
  v3 = (char *)&v70 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6);
  v76 = (char *)&v70 - v10;
  __chkstk_darwin(v9);
  v12 = (char *)&v70 - v11;
  v13 = sub_100004760();
  v14 = sub_1000049A4();
  v77 = v13;
  sub_100005A90((uint64_t)v14);
  v71 = v77;
  v15 = NSTemporaryDirectory();
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v18 = v17;

  URL.init(fileURLWithPath:isDirectory:)(v16, v18, 1);
  v19 = swift_bridgeObjectRelease(v18);
  v20 = UUID.init()(v19);
  v21 = UUID.uuidString.getter(v20);
  v23 = v22;
  v24 = *(void (**)(char *, _QWORD *))(v1 + 8);
  v25 = v70;
  v24(v3, v75);
  URL.appendingPathComponent(_:)(v21, v23);
  swift_bridgeObjectRelease(v23);
  v26 = *(void (**)(char *, uint64_t))(v5 + 8);
  v26(v12, v4);
  v75 = (_QWORD *)objc_opt_self(NSFileManager);
  v27 = objc_msgSend(v75, "defaultManager");
  URL._bridgeToObjectiveC()(v28);
  v30 = v29;
  v77 = 0;
  LODWORD(v16) = objc_msgSend(v27, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v29, 1, 0, &v77);

  v31 = v77;
  if ((_DWORD)v16)
  {
    v32 = v71[2];
    if (v32)
    {
      v33 = v71;
      v74 = v26;
      v34 = v77;
      v35 = v33 + 5;
      v72 = xmmword_100007520;
      do
      {
        v37 = *(v35 - 1);
        v36 = *v35;
        swift_bridgeObjectRetain(*v35);
        URL.init(fileURLWithPath:)(v37, v36);
        v38 = swift_bridgeObjectRelease(v36);
        v39 = URL.lastPathComponent.getter(v38);
        v41 = v40;
        URL.appendingPathComponent(_:)(v39, v40);
        swift_bridgeObjectRelease(v41);
        v42 = objc_msgSend(v75, "defaultManager");
        URL._bridgeToObjectiveC()(v43);
        v45 = v44;
        URL._bridgeToObjectiveC()(v46);
        v48 = v47;
        v77 = 0;
        v49 = objc_msgSend(v42, "copyItemAtURL:toURL:error:", v45, v47, &v77);

        v50 = v77;
        if (v49)
        {
          v51 = v77;
        }
        else
        {
          v52 = v77;
          v53 = (unint64_t *)_convertNSErrorToError(_:)(v50);

          v54 = swift_willThrow();
          LODWORD(v73) = static os_log_type_t.error.getter(v54);
          v55 = sub_100005B68(&qword_10000C3F8);
          v56 = swift_allocObject(v55, 72, 7);
          *(_OWORD *)(v56 + 16) = v72;
          v77 = v53;
          swift_errorRetain(v53);
          v57 = sub_100005B68(&qword_10000C400);
          v58 = String.init<A>(describing:)(&v77, v57);
          v59 = v8;
          v60 = v4;
          v61 = v25;
          v63 = v62;
          *(_QWORD *)(v56 + 56) = &type metadata for String;
          *(_QWORD *)(v56 + 64) = sub_100005BA8();
          *(_QWORD *)(v56 + 32) = v58;
          *(_QWORD *)(v56 + 40) = v63;
          sub_100005BE4();
          v64 = (void *)static OS_os_log.default.getter();
          os_log(_:dso:log:type:_:)("Failed to copy diagnostic file to temp directory with error: %@", 63, 2, &_mh_execute_header, v64, v73, v56);
          swift_bridgeObjectRelease(v56);

          v25 = v61;
          v4 = v60;
          v8 = v59;
          swift_errorRelease(v53);
          v73 = 0;
        }
        v35 += 2;
        v65 = v74;
        v74(v8, v4);
        v65(v76, v4);
        --v32;
      }
      while (v32);
    }
    else
    {
      v69 = v77;
    }
    return swift_bridgeObjectRelease(v71);
  }
  else
  {
    v66 = v4;
    v67 = v77;
    swift_bridgeObjectRelease(v71);
    _convertNSErrorToError(_:)(v31);

    swift_willThrow();
    return ((uint64_t (*)(uint64_t, uint64_t))v26)(v25, v66);
  }
}

id DatabaseManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id DatabaseManager.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "init");
}

id DatabaseManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100005540@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = URL.appendingPathComponent(_:)(*a1, a1[1]);
  v9 = URL.path.getter(v8);
  v11 = v10;
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *a2 = v9;
  a2[1] = v11;
  return result;
}

unint64_t *sub_1000055F0(void (*a1)(_QWORD *__return_ptr, _QWORD *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  unint64_t *v6;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t *v14;
  _QWORD v17[2];
  _QWORD v18[2];
  unint64_t *v19;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v5)
  {
    v19 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_100005C60(0, v5, 0);
    v6 = (unint64_t *)&_swiftEmptyArrayStorage;
    v8 = (uint64_t *)(a3 + 40);
    while (1)
    {
      v9 = *v8;
      v17[0] = *(v8 - 1);
      v17[1] = v9;
      swift_bridgeObjectRetain(v9);
      a1(v18, v17);
      if (v4)
        break;
      v4 = 0;
      swift_bridgeObjectRelease(v9);
      v11 = v18[0];
      v10 = v18[1];
      v19 = v6;
      v13 = v6[2];
      v12 = v6[3];
      if (v13 >= v12 >> 1)
      {
        sub_100005C60((char *)(v12 > 1), v13 + 1, 1);
        v6 = v19;
      }
      v8 += 2;
      v6[2] = v13 + 1;
      v14 = &v6[2 * v13];
      v14[4] = v11;
      v14[5] = v10;
      if (!--v5)
        return v6;
    }
    swift_release(v6);
    swift_bridgeObjectRelease(v9);
  }
  return v6;
}

char *sub_100005710(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100005B68(&qword_10000C440);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 16);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1000058F0((char *)(a4 + 32), v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease(a4);
  }
  else
  {
    sub_1000057FC(0, v8, (unint64_t)v13, a4);
  }
  return v11;
}

uint64_t sub_1000057FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
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
  v6 = a4 + 16 * a1 + 32;
  v7 = a3 + 16 * v4;
  if (v6 >= v7 || v6 + 16 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    swift_bridgeObjectRelease(a4);
    return v7;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

char *sub_1000058F0(char *__src, uint64_t a2, char *__dst)
{
  char v4;

  if (a2 < 0)
  {
    v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v4, 1046, 0);
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_100005974()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = sub_100005B68(&qword_10000C450);
  swift_arrayDestroy(v0 + 32, v1, v2);
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_1000059C4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    if (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3)
      return swift_arrayInitWithCopy(a3);
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

uint64_t sub_100005A90(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native(*v1);
  if (!(_DWORD)result || v5 > *(_QWORD *)(v3 + 24) >> 1)
  {
    if (v4 <= v5)
      v7 = v4 + v2;
    else
      v7 = v4;
    result = (uint64_t)sub_100005710((char *)result, v7, 1, v3);
    v3 = result;
  }
  if (!*(_QWORD *)(v6 + 16))
  {
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
  v8 = *(_QWORD *)(v3 + 16);
  if ((*(_QWORD *)(v3 + 24) >> 1) - v8 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = sub_1000059C4(v6 + 32, v2, v3 + 16 * v8 + 32);
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease(v6);
    *v1 = v3;
    return result;
  }
  v9 = *(_QWORD *)(v3 + 16);
  v10 = __OFADD__(v9, v2);
  v11 = v9 + v2;
  if (!v10)
  {
    *(_QWORD *)(v3 + 16) = v11;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_100005B68(uint64_t *a1)
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

unint64_t sub_100005BA8()
{
  unint64_t result;

  result = qword_10000C408;
  if (!qword_10000C408)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10000C408);
  }
  return result;
}

unint64_t sub_100005BE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C410;
  if (!qword_10000C410)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000C410);
  }
  return result;
}

uint64_t type metadata accessor for DiagnosticFileProvider()
{
  return objc_opt_self(WDEDiagnosticFileProvider);
}

uint64_t sub_100005C44@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100005540(a1, a2);
}

char *sub_100005C60(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_100005C7C(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_100005C7C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100005B68(&qword_10000C440);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 16);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1000058F0(v14, v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000059C4((unint64_t)v14, v8, (unint64_t)v13);
  }
  swift_release(a4);
  return v11;
}

Swift::Void __swiftcall DatabaseManager.checkpoint()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;

  v0 = type metadata accessor for Database.Location(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (uint64_t *)((char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = __chkstk_darwin(v2);
  v7 = (char *)&v24 - v6;
  v8 = __chkstk_darwin(v5);
  v10 = (char *)&v24 - v9;
  v11 = __chkstk_darwin(v8);
  v26 = (char *)&v24 - v12;
  __chkstk_darwin(v11);
  v14 = (char *)&v24 - v13;
  if (qword_10000C3F0 != -1)
    swift_once(&qword_10000C3F0, sub_100006C80);
  v15 = type metadata accessor for Logger(0);
  v16 = sub_10000644C(v15, (uint64_t)qword_10000C498);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)sub_100006C70(2);
    v25 = v10;
    v20 = (uint64_t)v19;
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Performing checkpoint operation on Weather databases", v19, 2u);
    v10 = v25;
    sub_100006C5C(v20);
  }

  type metadata accessor for NotificationStore(0);
  static NotificationStore.location.getter();
  sub_100006184((uint64_t)v14);
  v25 = *(char **)(v1 + 8);
  ((void (*)(char *, uint64_t))v25)(v14, v0);
  type metadata accessor for WeatherDataStore(0);
  v21 = (uint64_t)v26;
  static WeatherDataStore.location.getter();
  sub_100006C68(v21);
  sub_100006C48(v21);
  type metadata accessor for GeocodeStore(0);
  static GeocodeStore.location.getter();
  sub_100006C68((uint64_t)v10);
  sub_100006C48((uint64_t)v10);
  type metadata accessor for LocationMetadataStore(0);
  static LocationMetadataStore.location.getter();
  sub_100006C68((uint64_t)v7);
  sub_100006C48((uint64_t)v7);
  type metadata accessor for AQIScaleStore(0);
  v22 = static AQIScaleStore.locationPath.getter();
  if (v23)
  {
    *v4 = v22;
    v4[1] = v23;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v1 + 104))(v4, enum case for Database.Location.path(_:), v0);
    sub_100006C68((uint64_t)v4);
    sub_100006C48((uint64_t)v4);
  }
}

uint64_t sub_100006184(uint64_t a1)
{
  uint64_t v1;
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;

  v26 = a1;
  v1 = type metadata accessor for Database.VacuumMode(0);
  v30 = *(_QWORD *)(v1 - 8);
  v31 = v1;
  __chkstk_darwin();
  v29 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Database.CacheSize(0);
  v27 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  __chkstk_darwin();
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Database.RecoveryMode(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Database.JournalingMode(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin();
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AssertionOptions(0);
  __chkstk_darwin();
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Database.Location(0);
  __chkstk_darwin();
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = (*(uint64_t (**)(char *, uint64_t))(v18 + 16))(v17, v26);
  static AssertionOptions.weatherAssertions.getter(v19);
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, enum case for Database.JournalingMode.wal(_:), v10);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for Database.RecoveryMode.throw(_:), v6);
  (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v5, enum case for Database.CacheSize.default(_:), v28);
  v20 = v29;
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v29, enum case for Database.VacuumMode.none(_:), v31);
  v21 = type metadata accessor for Database(0);
  swift_allocObject(v21, *(unsigned int *)(v21 + 48), *(unsigned __int16 *)(v21 + 52));
  v33 = 0;
  v22 = v32;
  result = Database.init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:)(v17, v15, v13, v9, v5, v20, 1000);
  if (!v22)
  {
    v24 = result;
    Database.checkpoint()();
    return swift_release(v24);
  }
  return result;
}

uint64_t sub_10000644C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100006464(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  void *ObjectType;

  v6 = sub_100006534(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100006C0C((uint64_t)v12, *a3);
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
      sub_100006C0C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100006BEC(v12);
  return v7;
}

_QWORD *sub_100006534(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  _QWORD *result;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100006688((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_10000674C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = _StringObject.sharedUTF8.getter(a5, a6);
    if (!v8)
    {
      result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return (_QWORD *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

void *sub_100006688(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) != 0)
  {
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory with negative count", 60, 2, "Swift/UnsafeRawPointer.swift", 28, 2, 1170, 0);
  }
  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst)
      return memcpy(__dst, __src, __n);
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, 2, 1173, 0);
  }
  __break(1u);
  return result;
}

_QWORD *sub_10000674C(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1000067E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_1000069B4(0, v2[2] + 1, 1, (uint64_t)v2);
  v4 = v2[2];
  v3 = v2[3];
  if (v4 >= v3 >> 1)
    v2 = sub_1000069B4((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

_QWORD *sub_1000067E0(uint64_t a1, unint64_t a2)
{
  Swift::Int v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v4 = String.UTF8View._foreignCount()();
    if (v4)
      goto LABEL_6;
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    return &_swiftEmptyArrayStorage;
LABEL_6:
  v5 = sub_100006950(v4, 0);
  if (v4 < 0)
  {
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, 2, 71, 0);
    __break(1u);
    goto LABEL_14;
  }
  v6 = v5;
  v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
  if ((v8 & 1) != 0)
  {
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    goto LABEL_15;
  }
  if (v7 == v4)
    return v6;
  result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, 2, 1122, 0);
LABEL_15:
  __break(1u);
  return result;
}

_QWORD *sub_100006950(uint64_t a1, uint64_t a2)
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
  v4 = sub_100005B68(&qword_10000C480);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_1000069B4(char *result, int64_t a2, char a3, uint64_t a4)
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
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100005B68(&qword_10000C480);
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
  v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_100006B4C(v14, v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_100006A88(v14, v8, v13);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_100006A88(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) != 0)
  {
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst)
      return memcpy(__dst, __src, __n);
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

char *sub_100006B4C(char *__src, size_t __len, char *__dst)
{
  char v4;

  if ((__len & 0x8000000000000000) != 0)
  {
    v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v4, 1046, 0);
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t type metadata accessor for DatabaseManager()
{
  return objc_opt_self(WDEDatabaseManager);
}

uint64_t sub_100006BEC(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100006C0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006C48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 120))(a1, v1);
}

uint64_t sub_100006C54()
{
  uint64_t v0;

  return swift_errorRelease(v0);
}

uint64_t sub_100006C5C(uint64_t a1)
{
  return swift_slowDealloc(a1, -1, -1);
}

uint64_t sub_100006C68(uint64_t a1)
{
  return sub_100006184(a1);
}

uint64_t sub_100006C70(uint64_t a1)
{
  return swift_slowAlloc(a1, -1);
}

uint64_t sub_100006C78()
{
  uint64_t v0;

  return swift_errorRetain(v0);
}

uint64_t sub_100006C80()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100006CFC(v0, qword_10000C498);
  sub_10000644C(v0, (uint64_t)qword_10000C498);
  return Logger.init(subsystem:category:)(0xD000000000000011, 0x8000000100007C50, 0x74736F6E67616944, 0xEB00000000736369);
}

uint64_t *sub_100006CFC(uint64_t a1, uint64_t *a2)
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

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_attachmentWithPathURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentWithPathURL:");
}

id objc_msgSend_checkpoint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkpoint");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_databaseManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "databaseManager");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_exportDirectoryAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exportDirectoryAndReturnError:");
}

id objc_msgSend_fileProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileProvider");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "log");
}

id objc_msgSend_setDeleteOnAttach_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeleteOnAttach:");
}
