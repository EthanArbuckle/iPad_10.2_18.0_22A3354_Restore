int main(int argc, const char **argv, const char **envp)
{
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
  uint64_t v16;
  uint64_t v17;
  Swift::String v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;

  v3 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0, argv, envp);
  v36 = *(_QWORD *)(v3 - 8);
  v37 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  qword_10000C0C0 = 0xD00000000000001FLL;
  *(_QWORD *)algn_10000C0C8 = 0x80000001000075F0;
  qword_10000C0D0 = 0xD00000000000001ALL;
  *(_QWORD *)algn_10000C0D8 = 0x8000000100007610;
  qword_10000C0E0 = 0x7368637465667464;
  *(_QWORD *)algn_10000C0E8 = 0xEF64736C6F626D79;
  v12 = type metadata accessor for Logger(0);
  sub_100001C50(v12, qword_10000C0F0);
  sub_100001C90(v12, (uint64_t)qword_10000C0F0);
  v13 = qword_10000C0D0;
  v14 = *(_QWORD *)algn_10000C0D8;
  v16 = qword_10000C0E0;
  v15 = *(_QWORD *)algn_10000C0E8;
  swift_bridgeObjectRetain(*(_QWORD *)algn_10000C0D8);
  swift_bridgeObjectRetain(v15);
  Logger.init(subsystem:category:)(v13, v14, v16, v15);
  v17 = *(_QWORD *)algn_10000C0D8;
  v38 = (void *)qword_10000C0D0;
  v39 = *(_QWORD *)algn_10000C0D8;
  sub_100001CA8();
  swift_bridgeObjectRetain(v17);
  v18._countAndFlagsBits = 0x72656C646E61682ELL;
  v18._object = (void *)0xED00006575657551;
  String.append(_:)(v18);
  v19 = v38;
  v20 = v39;
  static DispatchQoS.unspecified.getter();
  v38 = &_swiftEmptyArrayStorage;
  v21 = sub_100006BA8(&qword_10000C008, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v22 = sub_100001CE4(&qword_10000C010);
  v23 = sub_100001D24();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v38, v22, v23, v6, v21);
  (*(void (**)(char *, _QWORD, uint64_t))(v36 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v37);
  qword_10000C108 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v19, v20, v11, v8, v5, 0);
  v24 = Logger.logObject.getter(qword_10000C108);
  v25 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Startup", v26, 2u);
    swift_slowDealloc(v26, -1, -1);
  }

  qword_10000C110 = 0;
  qword_10000C118 = 0;
  type metadata accessor for RemoteXPCListenerConnection(0);
  qword_10000C120 = static RemoteXPCConnection.remoteServiceListenerConnection(serviceName:targetQueue:)(qword_10000C0C0, *(_QWORD *)algn_10000C0C8, qword_10000C108);
  *(_QWORD *)algn_10000C128 = v27;
  v28 = Logger.logObject.getter(qword_10000C120);
  v29 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "Created listener", v30, 2u);
    swift_slowDealloc(v30, -1, -1);
  }

  v31 = dispatch thunk of XPCListenerConnection.setPeerConnectionHandler(_:)(sub_100001DB4, 0, *(_QWORD *)qword_10000C120, *(_QWORD *)algn_10000C128);
  v32 = Logger.logObject.getter(v31);
  v33 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Activate the listener and do dispatchMain", v34, 2u);
    swift_slowDealloc(v34, -1, -1);
  }

  dispatch thunk of XPCConnection.activate()(v35);
  dispatch_main();
}

uint64_t *sub_100001C50(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100001C90(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_100001CA8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C000;
  if (!qword_10000C000)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000C000);
  }
  return result;
}

uint64_t sub_100001CE4(uint64_t *a1)
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

unint64_t sub_100001D24()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C018;
  if (!qword_10000C018)
  {
    v1 = sub_100001D70(&qword_10000C010);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

uint64_t sub_100001D70(uint64_t *a1)
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

void sub_100001DB4(uint64_t a1)
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
  uint64_t **v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v2 = sub_100001CE4(&qword_10000C020);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v3);
  v8 = (char *)&v36 - v7;
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v36 - v10;
  __chkstk_darwin(v9);
  v13 = (uint64_t **)((char *)&v36 - v12);
  v14 = type metadata accessor for Logger(0);
  sub_100001C90(v14, (uint64_t)&unk_10000C0F0);
  sub_100006600(a1, (uint64_t)v13, &qword_10000C020);
  if (swift_getEnumCaseMultiPayload(v13, v2) == 1)
  {
    sub_100004758((uint64_t)v13, &qword_10000C020);
    v15 = sub_100006600(a1, (uint64_t)v11, &qword_10000C020);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(12, -1);
      v19 = swift_slowAlloc(32, -1);
      v39 = v19;
      *(_DWORD *)v18 = 136315138;
      sub_100006600((uint64_t)v11, (uint64_t)v5, &qword_10000C020);
      v20 = String.init<A>(describing:)(v5, v2);
      v22 = v21;
      v38 = sub_1000040EC(v20, v21, &v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v18 + 4, v18 + 12);
      swift_bridgeObjectRelease(v22);
      sub_100004758((uint64_t)v11, &qword_10000C020);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Unexpected peer connection %s, ignoring.", v18, 0xCu);
      swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v19, -1, -1);
      swift_slowDealloc(v18, -1, -1);
    }
    else
    {
      sub_100004758((uint64_t)v11, &qword_10000C020);
    }

  }
  else
  {
    v23 = *v13;
    v24 = v13[1];
    v25 = sub_100006600(a1, (uint64_t)v8, &qword_10000C020);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v37 = v24;
      v28 = (uint8_t *)swift_slowAlloc(12, -1);
      v29 = swift_slowAlloc(32, -1);
      v39 = v29;
      *(_DWORD *)v28 = 136315138;
      sub_100006600((uint64_t)v8, (uint64_t)v5, &qword_10000C020);
      v30 = String.init<A>(describing:)(v5, v2);
      v32 = v31;
      v38 = sub_1000040EC(v30, v31, &v39);
      v24 = v37;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v28 + 4, v28 + 12);
      swift_bridgeObjectRelease(v32);
      sub_100004758((uint64_t)v8, &qword_10000C020);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Received new connection: %s", v28, 0xCu);
      swift_arrayDestroy(v29, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1, -1);
      swift_slowDealloc(v28, -1, -1);

    }
    else
    {

      sub_100004758((uint64_t)v8, &qword_10000C020);
    }
    v33 = *v23;
    v34 = swift_allocObject(&unk_100008570, 32, 7);
    *(_QWORD *)(v34 + 16) = v23;
    *(_QWORD *)(v34 + 24) = v24;
    swift_retain(v23);
    dispatch thunk of XPCPeerConnection.setEventHandler(_:)(sub_100004750, v34, v33, v24);
    swift_release(v34);
    v35 = swift_retain(v23);
    dispatch thunk of XPCConnection.activate()(v35);
    swift_release_n(v23, 2);
  }
}

uint64_t sub_1000021E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
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
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  const char *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint32_t v57;
  uint64_t v58;
  os_log_type_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  uint8_t *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v68 = a2;
  v3 = sub_100001CE4(&qword_10000C028);
  v4 = __chkstk_darwin(v3);
  v67 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v64 - v7;
  __chkstk_darwin(v6);
  v10 = (char *)&v64 - v9;
  v11 = type metadata accessor for XPCDictionary(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v64 - v17;
  __chkstk_darwin(v16);
  v20 = (char *)&v64 - v19;
  v21 = type metadata accessor for Logger(0);
  v22 = sub_100001C90(v21, (uint64_t)&unk_10000C0F0);
  sub_100006600(a1, (uint64_t)v10, &qword_10000C028);
  if (swift_getEnumCaseMultiPayload(v10, v3) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v20, v10, v11);
    v32 = v11;
    v33 = *(uint64_t (**)(char *, char *, uint64_t))(v12 + 16);
    v34 = v33(v18, v20, v32);
    v35 = Logger.logObject.getter(v34);
    v36 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = swift_slowAlloc(12, -1);
      v66 = v22;
      v38 = (uint8_t *)v37;
      v39 = swift_slowAlloc(32, -1);
      v70 = v39;
      v67 = v20;
      *(_DWORD *)v38 = 136315138;
      v65 = v38 + 4;
      v33(v15, v18, v32);
      v40 = String.init<A>(describing:)(v15, v32);
      v42 = v41;
      v69 = sub_1000040EC(v40, v41, &v70);
      v20 = v67;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, &v70, v65, v38 + 12);
      swift_bridgeObjectRelease(v42);
      v43 = *(void (**)(char *, uint64_t))(v12 + 8);
      v43(v18, v32);
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Received new message: %s", v38, 0xCu);
      swift_arrayDestroy(v39, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v39, -1, -1);
      swift_slowDealloc(v38, -1, -1);

    }
    else
    {

      v43 = *(void (**)(char *, uint64_t))(v12 + 8);
      v43(v18, v32);
    }
    if (qword_10000C1A0 != -1)
      swift_once(&qword_10000C1A0, sub_100003244);
    if ((XPCDictionary.subscript.getter(static DTFetchSymbolsD.TransferDoneKey, *(_QWORD *)algn_10000C178) & 1) == 0)
    {
      if (qword_10000C188 != -1)
        swift_once(&qword_10000C188, sub_10000315C);
      if (XPCDictionary.subscript.getter(static DTFetchSymbolsD.DSCFilePathsKey, *(_QWORD *)algn_10000C148))
      {
        ((void (*)(void))swift_unknownObjectRelease)();
        if (!qword_10000C110)
        {
          v46 = os_transaction_create("DSCFilePaths");
          v47 = qword_10000C110;
          qword_10000C110 = v46;
          swift_unknownObjectRelease(v47);
        }
        if (!__OFADD__(qword_10000C118, 1))
        {
          ++qword_10000C118;
          sub_100002B20((uint64_t)v20, v68);
          return ((uint64_t (*)(char *, uint64_t))v43)(v20, v32);
        }
        __break(1u);
      }
      else if (qword_10000C190 == -1)
      {
LABEL_26:
        v58 = XPCDictionary.subscript.getter(static DTFetchSymbolsD.MachODylibsKey, *(_QWORD *)algn_10000C158);
        if (!v58)
        {
          if (qword_10000C198 != -1)
            swift_once(&qword_10000C198, sub_1000031F4);
          v58 = XPCDictionary.subscript.getter(static DTFetchSymbolsD.MachOSegmentsKey, *(_QWORD *)algn_10000C168);
        }
        swift_unknownObjectRelease(v58);
        return ((uint64_t (*)(char *, uint64_t))v43)(v20, v32);
      }
      swift_once(&qword_10000C190, sub_1000031A8);
      goto LABEL_26;
    }
    if (qword_10000C110)
    {
      v48 = qword_10000C118;
      v49 = qword_10000C118 - 1;
      if (qword_10000C118 >= 1)
      {
        --qword_10000C118;
        v48 = v49;
      }
      if (!v48)
      {
        qword_10000C110 = 0;
        v60 = ((uint64_t (*)(void))swift_unknownObjectRelease)();
        v61 = Logger.logObject.getter(v60);
        v62 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v61, v62))
        {
          v63 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v63 = 0;
          _os_log_impl((void *)&_mh_execute_header, v61, v62, "Doing fast exit, per OS reviewers.", v63, 2u);
          swift_slowDealloc(v63, -1, -1);
        }

        xpc_transaction_exit_clean();
        return ((uint64_t (*)(_QWORD, _QWORD))v43)(v20, v32);
      }
      v50 = Logger.logObject.getter(qword_10000C110);
      v51 = static os_log_type_t.info.getter();
      if (!os_log_type_enabled(v50, v51))
        goto LABEL_34;
      v52 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v52 = 134217984;
      v70 = qword_10000C118;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v52 + 4, v52 + 12);
      v53 = "Not exiting yet because of %ld outstanding transactions.";
      v54 = v50;
      v55 = v51;
      v56 = v52;
      v57 = 12;
    }
    else
    {
      v50 = Logger.logObject.getter(0);
      v59 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v50, v59))
      {
LABEL_34:

        return ((uint64_t (*)(_QWORD, _QWORD))v43)(v20, v32);
      }
      v52 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v52 = 0;
      v53 = "There is no ongoing transaction to cancel, ignoring";
      v54 = v50;
      v55 = v59;
      v56 = v52;
      v57 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v54, v55, v53, v56, v57);
    swift_slowDealloc(v52, -1, -1);
    goto LABEL_34;
  }
  sub_100004758((uint64_t)v10, &qword_10000C028);
  v23 = sub_100006600(a1, (uint64_t)v8, &qword_10000C028);
  v24 = Logger.logObject.getter(v23);
  v25 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc(12, -1);
    v27 = swift_slowAlloc(32, -1);
    v70 = v27;
    *(_DWORD *)v26 = 136315138;
    v28 = (uint64_t)v67;
    sub_100006600((uint64_t)v8, (uint64_t)v67, &qword_10000C028);
    v29 = String.init<A>(describing:)(v28, v3);
    v31 = v30;
    v69 = sub_1000040EC(v29, v30, &v70);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, &v70, v26 + 4, v26 + 12);
    swift_bridgeObjectRelease(v31);
    sub_100004758((uint64_t)v8, &qword_10000C028);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Received error message: %s, cancelling.", v26, 0xCu);
    swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v26, -1, -1);
  }
  else
  {
    sub_100004758((uint64_t)v8, &qword_10000C028);
  }

  return dispatch thunk of XPCConnection.cancel()(v44);
}

uint64_t *DTFetchSymbolsD.TransferDoneKey.unsafeMutableAddressor()
{
  if (qword_10000C1A0 != -1)
    swift_once(&qword_10000C1A0, sub_100003244);
  return &static DTFetchSymbolsD.TransferDoneKey;
}

uint64_t *DTFetchSymbolsD.DSCFilePathsKey.unsafeMutableAddressor()
{
  if (qword_10000C188 != -1)
    swift_once(&qword_10000C188, sub_10000315C);
  return &static DTFetchSymbolsD.DSCFilePathsKey;
}

uint64_t sub_100002B20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  _QWORD *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v57 = a2;
  v3 = sub_100001CE4(&qword_10000C030);
  __chkstk_darwin(v3);
  v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for XPCDictionary(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v49 - v11;
  v13 = type metadata accessor for Logger(0);
  sub_100001C90(v13, (uint64_t)&unk_10000C0F0);
  v14 = XPCDictionary.sideChannel.getter();
  if (v2)
  {
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Can't decode side channel, cancelling.", v17, 2u);
      swift_slowDealloc(v17, -1, -1);
    }

    dispatch thunk of XPCConnection.cancel()();
    return swift_errorRelease(v2);
  }
  else
  {
    v19 = v14;
    if (v14)
    {
      v20 = swift_retain(v14);
      XPCDictionary.createReply()(v20);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
      {
        sub_100004758((uint64_t)v5, &qword_10000C030);
        v21 = sub_100003E10((uint64_t)&_swiftEmptyArrayStorage);
        v22 = type metadata accessor for XPCError(0);
        v23 = sub_100006BA8(&qword_10000C038, (uint64_t (*)(uint64_t))&type metadata accessor for XPCError, (uint64_t)&protocol conformance descriptor for XPCError);
        swift_allocError(v22, v23, 0, 0);
        static XPCError.unknown(_:from:userInfo:)(0xD000000000000024, 0x8000000100007650, 0, v21);
        v24 = swift_bridgeObjectRelease(v21);
        swift_willThrow(v24);
        return swift_release_n(v19, 2);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
        v28 = sub_100003620();
        v52 = v19;
        v53 = 0;
        if (qword_10000C188 != -1)
          swift_once(&qword_10000C188, sub_10000315C);
        v51 = v7;
        v29 = static DTFetchSymbolsD.DSCFilePathsKey;
        v30 = *(_QWORD *)algn_10000C148;
        v54 = v28[2];
        LOBYTE(v55) = 0;
        v31 = sub_100004794();
        swift_bridgeObjectRetain(v30);
        XPCDictionary.subscript.setter(&v54, v29, v30, &type metadata for Int, v31);
        v50 = v12;
        v32 = v57;
        dispatch thunk of XPCConnection.send(message:)(v12);
        v33 = type metadata accessor for XPCObjectEncoder(0);
        swift_allocObject(v33, *(unsigned int *)(v33 + 48), *(unsigned __int16 *)(v33 + 52));
        v34 = swift_retain(v32);
        v57 = XPCObjectEncoder.init(underlyingConnection:)(v34);
        v35 = v28[2];
        v49 = v28;
        if (v35)
        {
          v36 = v28 + 6;
          while (1)
          {
            v37 = v6;
            v39 = *(v36 - 1);
            v38 = *v36;
            v40 = *(v36 - 2);
            swift_bridgeObjectRetain(v39);
            v41 = swift_retain(v38);
            XPCDictionary.init()(v41);
            v42 = static DTFetchSymbolsD.DSCFilePathsKey;
            v43 = *(_QWORD *)algn_10000C148;
            v54 = v40;
            v55 = v39;
            v56 = v38;
            v44 = sub_1000047D8();
            swift_bridgeObjectRetain(v43);
            v45 = v44;
            v46 = v53;
            v47 = XPCObjectEncoder.encode<A>(_:)(&v54, &type metadata for TransferResponseItem, v45);
            v53 = v46;
            if (v46)
              break;
            XPCDictionary.subscript.setter(v47, v42, v43);
            XPCSideChannel.send(message:)(v10);
            swift_release(v38);
            swift_bridgeObjectRelease(v39);
            v6 = v37;
            (*(void (**)(char *, uint64_t))(v51 + 8))(v10, v37);
            v36 += 3;
            if (!--v35)
              goto LABEL_17;
          }
          swift_bridgeObjectRelease(v43);
          swift_release(v57);
          swift_release_n(v52, 2);
          v48 = *(void (**)(char *, uint64_t))(v51 + 8);
          v48(v10, v37);
          swift_bridgeObjectRelease(v49);
          v48(v50, v37);
          swift_release(v38);
          return swift_bridgeObjectRelease(v39);
        }
        else
        {
LABEL_17:
          swift_release(v57);
          swift_release_n(v52, 2);
          swift_bridgeObjectRelease(v49);
          return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v50, v6);
        }
      }
    }
    else
    {
      v25 = ((uint64_t (*)(void))Logger.logObject.getter)();
      v26 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "Side channel is nil, cancelling.", v27, 2u);
        swift_slowDealloc(v27, -1, -1);
      }

      return dispatch thunk of XPCConnection.cancel()();
    }
  }
}

uint64_t *DTFetchSymbolsD.MachODylibsKey.unsafeMutableAddressor()
{
  if (qword_10000C190 != -1)
    swift_once(&qword_10000C190, sub_1000031A8);
  return &static DTFetchSymbolsD.MachODylibsKey;
}

uint64_t *DTFetchSymbolsD.MachOSegmentsKey.unsafeMutableAddressor()
{
  if (qword_10000C198 != -1)
    swift_once(&qword_10000C198, sub_1000031F4);
  return &static DTFetchSymbolsD.MachOSegmentsKey;
}

void sub_1000030D0()
{
  static DTFetchSymbolsD.CompressionKey = 0x73736572706D6F43;
  *(_QWORD *)algn_10000C138 = 0xEB000000006E6F69;
}

uint64_t *DTFetchSymbolsD.CompressionKey.unsafeMutableAddressor()
{
  if (qword_10000C180 != -1)
    swift_once(&qword_10000C180, sub_1000030D0);
  return &static DTFetchSymbolsD.CompressionKey;
}

uint64_t static DTFetchSymbolsD.CompressionKey.getter()
{
  return sub_100003290(&qword_10000C180, &static DTFetchSymbolsD.CompressionKey, algn_10000C138);
}

void sub_10000315C()
{
  strcpy((char *)&static DTFetchSymbolsD.DSCFilePathsKey, "DSCFilePaths");
  algn_10000C148[5] = 0;
  *(_WORD *)&algn_10000C148[6] = -5120;
}

uint64_t static DTFetchSymbolsD.DSCFilePathsKey.getter()
{
  return sub_100003290(&qword_10000C188, &static DTFetchSymbolsD.DSCFilePathsKey, algn_10000C148);
}

void sub_1000031A8()
{
  static DTFetchSymbolsD.MachODylibsKey = 0x6C79444F6863614DLL;
  *(_QWORD *)algn_10000C158 = 0xEB00000000736269;
}

uint64_t static DTFetchSymbolsD.MachODylibsKey.getter()
{
  return sub_100003290(&qword_10000C190, &static DTFetchSymbolsD.MachODylibsKey, algn_10000C158);
}

void sub_1000031F4()
{
  strcpy((char *)&static DTFetchSymbolsD.MachOSegmentsKey, "MachOSegments");
  *(_WORD *)&algn_10000C168[6] = -4864;
}

uint64_t static DTFetchSymbolsD.MachOSegmentsKey.getter()
{
  return sub_100003290(&qword_10000C198, &static DTFetchSymbolsD.MachOSegmentsKey, algn_10000C168);
}

void sub_100003244()
{
  strcpy((char *)&static DTFetchSymbolsD.TransferDoneKey, "TransferDone");
  algn_10000C178[5] = 0;
  *(_WORD *)&algn_10000C178[6] = -5120;
}

uint64_t static DTFetchSymbolsD.TransferDoneKey.getter()
{
  return sub_100003290(qword_10000C1A0, &static DTFetchSymbolsD.TransferDoneKey, algn_10000C178);
}

uint64_t sub_100003290(_QWORD *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v5;

  if (*a1 != -1)
    swift_once();
  v5 = *a2;
  swift_bridgeObjectRetain(*a3);
  return v5;
}

uint64_t sub_1000032E0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6E617254656C6966;
  else
    return 0x68746150656C6966;
}

BOOL sub_100003320(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100003338()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000337C()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_1000033A4(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_1000033E4()
{
  char *v0;

  return sub_1000032E0(*v0);
}

uint64_t sub_1000033EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1000068B4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100003410()
{
  return 0;
}

void sub_10000341C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100003428(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100006870();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100003450(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100006870();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100003478(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;

  v18 = a4;
  v8 = sub_100001CE4(&qword_10000C0A0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v13 = a1[4];
  sub_10000684C(a1, v12);
  v14 = sub_100006870();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for TransferResponseItem.CodingKeys, &type metadata for TransferResponseItem.CodingKeys, v14, v12, v13);
  v21 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(a2, a3, &v21, v8);
  if (!v4)
  {
    v19 = v18;
    v20 = 1;
    v15 = type metadata accessor for XPCFileTransfer(0);
    v16 = sub_100006BA8(&qword_10000C0A8, (uint64_t (*)(uint64_t))&type metadata accessor for XPCFileTransfer, (uint64_t)&protocol conformance descriptor for XPCFileTransfer);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v19, &v20, v8, v15, v16);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1000035D8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_1000069AC(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_100003604(_QWORD *a1)
{
  uint64_t *v1;

  return sub_100003478(a1, *v1, v1[1], v1[2]);
}

void *sub_100003620()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  Swift::Int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  void *result;
  uint64_t v16;
  int64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  _QWORD aBlock[5];
  uint64_t v42;
  char v43[48];
  void *v44;

  v1 = v0;
  v2 = type metadata accessor for URL(0);
  __chkstk_darwin(v2);
  v37 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100001CE4(&qword_10000C050);
  inited = swift_initStackObject(v4, v43);
  *(_OWORD *)(inited + 16) = xmmword_100007450;
  v6 = swift_allocObject(&unk_100008598, 24, 7);
  strcpy((char *)(inited + 32), "/usr/lib/dyld");
  *(_WORD *)(inited + 46) = -4864;
  v7 = sub_1000062F8(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 1, &type metadata for String);
  *(_QWORD *)(v6 + 16) = v7;
  v8 = swift_allocObject(&unk_1000085C0, 24, 7);
  *(_QWORD *)(v8 + 16) = &_swiftEmptySetSingleton;
  v9 = swift_allocObject(&unk_1000085E8, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = v6;
  aBlock[4] = sub_1000064C4;
  v42 = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003DC0;
  aBlock[3] = &unk_100008600;
  v10 = _Block_copy(aBlock);
  v11 = v42;
  swift_retain(v8);
  swift_retain(v6);
  swift_release(v11);
  dyld_for_each_installed_shared_cache(v10);
  _Block_release(v10);
  swift_beginAccess(v6 + 16, aBlock, 0, 0);
  v12 = *(_QWORD *)(v6 + 16);
  v13 = *(_QWORD *)(v12 + 16);
  if (v13)
  {
    v34 = v8;
    v35 = v6;
    v44 = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain(v12);
    sub_100005FD4(0, v13, 0);
    v14 = (uint64_t)v44;
    result = (void *)sub_100006174(v12);
    v17 = (int64_t)result;
    v19 = v18 & 1;
    v36 = v12 + 56;
    v20 = v1;
    while ((v17 & 0x8000000000000000) == 0 && v17 < 1 << *(_BYTE *)(v12 + 32))
    {
      if (((*(_QWORD *)(v36 + (((unint64_t)v17 >> 3) & 0xFFFFFFFFFFFFF8)) >> v17) & 1) == 0)
        goto LABEL_16;
      if (*(_DWORD *)(v12 + 36) != (_DWORD)v16)
        goto LABEL_17;
      v39 = v16;
      v40 = v13;
      v21 = (_QWORD *)v14;
      v22 = (uint64_t *)(*(_QWORD *)(v12 + 48) + 16 * v17);
      v23 = *v22;
      v24 = v22[1];
      swift_bridgeObjectRetain_n(v24, 2);
      v25 = v37;
      URL.init(fileURLWithPath:)(v23, v24);
      v26 = type metadata accessor for XPCFileTransfer(0);
      v14 = swift_allocObject(v26, *(unsigned int *)(v26 + 48), *(unsigned __int16 *)(v26 + 52));
      v27 = XPCFileTransfer.init(forFileAt:)(v25);
      if (v20)
      {
        swift_release(v35);
        swift_release(v34);
        swift_bridgeObjectRelease(v12);
        swift_release(v21);
        swift_bridgeObjectRelease_n(v24, 2);
        return (void *)v14;
      }
      v28 = v27;
      v38 = 0;
      swift_bridgeObjectRelease(v24);
      v14 = (uint64_t)v21;
      v44 = v21;
      v29 = v21[2];
      v30 = *(_QWORD *)(v14 + 24);
      if (v29 >= v30 >> 1)
      {
        sub_100005FD4(v30 > 1, v29 + 1, 1);
        v14 = (uint64_t)v44;
      }
      *(_QWORD *)(v14 + 16) = v29 + 1;
      v31 = (_QWORD *)(v14 + 24 * v29);
      v31[4] = v23;
      v31[5] = v24;
      v31[6] = v28;
      result = (void *)sub_100006214(v17, v39, v19 & 1, v12);
      v17 = (int64_t)result;
      v19 = v32 & 1;
      v13 = v40 - 1;
      v20 = v38;
      if (v40 == 1)
      {
        sub_1000064E4((uint64_t)result, v16, v32 & 1);
        swift_release(v35);
        swift_release(v34);
        swift_bridgeObjectRelease(v12);
        return (void *)v14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  else
  {
    swift_release(v6);
    swift_release(v8);
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_100003A0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unsigned __int8 *v16;
  uint64_t v17;
  char v18;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[5];
  uint64_t v26;
  _BYTE v27[24];

  v24 = a3;
  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&aBlock[-1] - v11;
  __chkstk_darwin(v10);
  v14 = (char *)&aBlock[-1] - v13;
  v15 = a2 + 16;
  v16 = (unsigned __int8 *)swift_slowAlloc(16, -1);
  dyld_shared_cache_copy_uuid(a1, v16);
  UUID.init(uuid:)(*v16, v16[1], v16[2], v16[3], v16[4], v16[5], v16[6], v16[7], *((_QWORD *)v16 + 1));
  swift_beginAccess(a2 + 16, v27, 0, 0);
  v17 = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain(v17);
  v18 = sub_100003C3C((uint64_t)v14, v17);
  swift_bridgeObjectRelease(v17);
  if ((v18 & 1) != 0)
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v14, v5);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v14, v5);
  swift_beginAccess(v15, aBlock, 33, 0);
  sub_100004840((uint64_t)v12, v9);
  swift_endAccess(aBlock);
  v20 = *(void (**)(char *, uint64_t))(v6 + 8);
  v20(v12, v5);
  swift_slowDealloc(v16, -1, -1);
  v21 = v24;
  aBlock[4] = sub_1000064F4;
  v26 = v24;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003DC0;
  aBlock[3] = &unk_100008628;
  v22 = _Block_copy(aBlock);
  v23 = v26;
  swift_retain(v21);
  swift_release(v23);
  dyld_shared_cache_for_each_file(a1, v22);
  _Block_release(v22);
  return ((uint64_t (*)(char *, uint64_t))v20)(v14, v5);
}

uint64_t sub_100003C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, unint64_t, uint64_t);
  uint64_t v15;
  char v16;
  uint64_t v18;
  uint64_t v19;

  v4 = type metadata accessor for UUID(0);
  v19 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16)
    && (v7 = *(_QWORD *)(a2 + 40),
        v8 = sub_100006BA8(&qword_10000C070, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID), v9 = dispatch thunk of Hashable._rawHashValue(seed:)(v7, v4, v8), v10 = -1 << *(_BYTE *)(a2 + 32), v11 = v9 & ~v10, ((*(_QWORD *)(a2 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0))
  {
    v12 = ~v10;
    v13 = *(_QWORD *)(v19 + 72);
    v14 = *(void (**)(char *, unint64_t, uint64_t))(v19 + 16);
    do
    {
      v14(v6, *(_QWORD *)(a2 + 48) + v13 * v11, v4);
      v15 = sub_100006BA8(&qword_10000C078, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      v16 = dispatch thunk of static Equatable.== infix(_:_:)(v6, a1, v4, v15);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v4);
      if ((v16 & 1) != 0)
        break;
      v11 = (v11 + 1) & v12;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  }
  else
  {
    v16 = 0;
  }
  return v16 & 1;
}

uint64_t sub_100003DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

ValueMetadata *type metadata accessor for DTFetchSymbolsD()
{
  return &type metadata for DTFetchSymbolsD;
}

unint64_t sub_100003E10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100001CE4(&qword_10000C088);
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
    sub_100006600(v7, (uint64_t)&v16, &qword_10000C090);
    v8 = v16;
    v9 = v17;
    result = sub_100003F44(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_100006644(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 48;
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

unint64_t sub_100003F44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100003FA8(a1, a2, v5);
}

unint64_t sub_100003FA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_1000040EC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000041BC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100006654((uint64_t)v12, *a3);
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
      sub_100006654((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100006B88(v12);
  return v7;
}

uint64_t sub_1000041BC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100004374(a5, a6);
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

uint64_t sub_100004374(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100004408(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000045E0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000045E0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100004408(uint64_t a1, unint64_t a2)
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
      v5 = sub_10000457C(v4, 0);
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

_QWORD *sub_10000457C(uint64_t a1, uint64_t a2)
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
  v4 = sub_100001CE4(&qword_10000C098);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000045E0(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100001CE4(&qword_10000C098);
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

uint64_t sub_10000472C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100004750(uint64_t a1)
{
  uint64_t v1;

  return sub_1000021E0(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_100004758(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100001CE4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100004794()
{
  unint64_t result;

  result = qword_10000C040;
  if (!qword_10000C040)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

unint64_t sub_1000047D8()
{
  unint64_t result;

  result = qword_10000C048;
  if (!qword_10000C048)
  {
    result = swift_getWitnessTable(&unk_1000074D0, &type metadata for TransferResponseItem);
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

uint64_t sub_10000481C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100004840(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  uint64_t v21;
  void (*v22)(_QWORD, _QWORD, _QWORD);
  uint64_t v23;
  char v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  char isUniquelyReferenced_nonNull_native;
  char *v28;
  uint64_t v29;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;

  v3 = v2;
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  v11 = *(_QWORD *)(*v3 + 40);
  v13 = sub_100006BA8(&qword_10000C070, v12, (uint64_t)&protocol conformance descriptor for UUID);
  swift_bridgeObjectRetain(v10);
  v35 = a2;
  v14 = dispatch thunk of Hashable._rawHashValue(seed:)(v11, v6, v13);
  v15 = -1 << *(_BYTE *)(v10 + 32);
  v16 = v14 & ~v15;
  v17 = v10;
  v18 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0)
  {
    v31 = v3;
    v32 = a1;
    v33 = ~v15;
    v34 = v7;
    v19 = *(_QWORD *)(v7 + 72);
    v20 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v21 = v17;
      v22 = v20;
      v20(v9, *(_QWORD *)(v17 + 48) + v19 * v16, v6);
      v23 = sub_100006BA8(&qword_10000C078, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      v24 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v35, v6, v23);
      v25 = *(void (**)(char *, uint64_t))(v34 + 8);
      v25(v9, v6);
      if ((v24 & 1) != 0)
        break;
      v16 = (v16 + 1) & v33;
      v17 = v21;
      v20 = v22;
      if (((*(_QWORD *)(v18 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
      {
        swift_bridgeObjectRelease(v21);
        v3 = v31;
        a1 = v32;
        v26 = v34;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease(v21);
    v25(v35, v6);
    v22(v32, *(_QWORD *)(*v31 + 48) + v19 * v16, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease(v10);
    v20 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v26 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v28 = v35;
    v20(v9, v35, v6);
    v36 = *v3;
    *v3 = 0x8000000000000000;
    sub_100005290((uint64_t)v9, v16, isUniquelyReferenced_nonNull_native);
    v29 = *v3;
    *v3 = v36;
    swift_bridgeObjectRelease(v29);
    (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(a1, v28, v6);
    return 1;
  }
}

uint64_t sub_100004A9C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  _QWORD v24[9];

  v7 = *v3;
  Hasher.init(_seed:)(v24, *(_QWORD *)(*v3 + 40));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v24, a2, a3);
  v8 = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = v12[1];
    v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      v15 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain(v16);
      return 0;
    }
    v18 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v18;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v19 = (_QWORD *)(v11 + 16 * v10);
      v20 = v19[1];
      v21 = *v19 == a2 && v20 == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, a2, a3, 0) & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease(v7);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v24[0] = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain(a3);
  sub_100005494(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v23 = *v3;
  *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100004C48(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, unint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t v40;

  v2 = v1;
  v4 = type metadata accessor for UUID(0);
  v40 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  sub_100001CE4(&qword_10000C080);
  v8 = static _SetStorage.resize(original:capacity:move:)(v7, a1, 1);
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
    goto LABEL_39;
  v10 = 1 << *(_BYTE *)(v7 + 32);
  v11 = *(_QWORD *)(v7 + 56);
  v39 = (_QWORD *)(v7 + 56);
  if (v10 < 64)
    v12 = ~(-1 << v10);
  else
    v12 = -1;
  v13 = v12 & v11;
  v37 = v2;
  v38 = (unint64_t)(v10 + 63) >> 6;
  v14 = v8 + 56;
  result = swift_retain(v7);
  v16 = 0;
  while (1)
  {
    if (v13)
    {
      v18 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v19 = v18 | (v16 << 6);
      goto LABEL_26;
    }
    v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      return result;
    }
    if (v20 >= v38)
      goto LABEL_35;
    v21 = v39[v20];
    ++v16;
    if (!v21)
    {
      v16 = v20 + 1;
      if (v20 + 1 >= v38)
        goto LABEL_35;
      v21 = v39[v16];
      if (!v21)
      {
        v16 = v20 + 2;
        if (v20 + 2 >= v38)
          goto LABEL_35;
        v21 = v39[v16];
        if (!v21)
          break;
      }
    }
LABEL_25:
    v13 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_26:
    v23 = v7;
    v24 = *(_QWORD *)(v7 + 48);
    v25 = *(_QWORD *)(v40 + 72);
    v26 = *(void (**)(char *, unint64_t, uint64_t))(v40 + 32);
    v26(v6, v24 + v25 * v19, v4);
    v27 = *(_QWORD *)(v9 + 40);
    v28 = sub_100006BA8(&qword_10000C070, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v27, v4, v28);
    v29 = -1 << *(_BYTE *)(v9 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v14 + 8 * (v30 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v14 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_40;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v14 + 8 * v31);
      }
      while (v35 == -1);
      v17 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(_QWORD *)(v9 + 48) + v17 * v25, v6, v4);
    ++*(_QWORD *)(v9 + 16);
    v7 = v23;
  }
  v22 = v20 + 3;
  if (v22 < v38)
  {
    v21 = v39[v22];
    if (!v21)
    {
      while (1)
      {
        v16 = v22 + 1;
        if (__OFADD__(v22, 1))
          goto LABEL_41;
        if (v16 >= v38)
          goto LABEL_35;
        v21 = v39[v16];
        ++v22;
        if (v21)
          goto LABEL_25;
      }
    }
    v16 = v22;
    goto LABEL_25;
  }
LABEL_35:
  swift_release(v7);
  v2 = v37;
  v36 = 1 << *(_BYTE *)(v7 + 32);
  if (v36 > 63)
    bzero(v39, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v39 = -1 << v36;
  *(_QWORD *)(v7 + 16) = 0;
LABEL_39:
  result = swift_release(v7);
  *v2 = v9;
  return result;
}

Swift::Int sub_100004FB4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  Swift::Int result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD v34[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100001CE4(&qword_10000C068);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v32 = v2;
    v33 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v3 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = v5 + 56;
    result = swift_retain(v3);
    v13 = 0;
    while (1)
    {
      if (v9)
      {
        v16 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v10)
          goto LABEL_36;
        v19 = v33[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v10)
            goto LABEL_36;
          v19 = v33[v13];
          if (!v19)
          {
            v13 = v18 + 2;
            if (v18 + 2 >= v10)
              goto LABEL_36;
            v19 = v33[v13];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v10)
              {
LABEL_36:
                swift_release(v3);
                v2 = v32;
                v31 = 1 << *(_BYTE *)(v3 + 32);
                if (v31 > 63)
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v31;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v33[v20];
              if (!v19)
              {
                while (1)
                {
                  v13 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v13 >= v10)
                    goto LABEL_36;
                  v19 = v33[v13];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v13 = v20;
            }
          }
        }
LABEL_26:
        v9 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
      v22 = *v21;
      v23 = v21[1];
      Hasher.init(_seed:)(v34, *(_QWORD *)(v6 + 40));
      String.hash(into:)(v34, v22, v23);
      result = Hasher._finalize()();
      v24 = -1 << *(_BYTE *)(v6 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v11 + 8 * v26);
        }
        while (v30 == -1);
        v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
      *v15 = v22;
      v15[1] = v23;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

uint64_t sub_100005290(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, unint64_t, uint64_t);
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = a1;
  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v29 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_100004C48(v12);
  }
  else
  {
    if (v11 > v10)
    {
      sub_10000562C();
      goto LABEL_12;
    }
    sub_100005A00(v12);
  }
  v13 = *v3;
  v14 = *(_QWORD *)(*v3 + 40);
  v15 = sub_100006BA8(&qword_10000C070, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v6, v15);
  v17 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v16 & ~v17;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v18 = ~v17;
    v19 = *(_QWORD *)(v7 + 72);
    v20 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v20(v9, *(_QWORD *)(v13 + 48) + v19 * a2, v6);
      v21 = sub_100006BA8(&qword_10000C078, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      v22 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v30, v6, v21);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v22 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v18;
    }
    while (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v23 = v30;
  v24 = *v29;
  *(_QWORD *)(*v29 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v24 + 48) + *(_QWORD *)(v7 + 72) * a2, v23, v6);
  v26 = *(_QWORD *)(v24 + 16);
  v27 = __OFADD__(v26, 1);
  v28 = v26 + 1;
  if (!v27)
  {
    *(_QWORD *)(v24 + 16) = v28;
    return result;
  }
  __break(1u);
LABEL_15:
  result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v6);
  __break(1u);
  return result;
}

uint64_t sub_100005494(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD v28[9];

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_100004FB4(v11);
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_100005850();
      goto LABEL_22;
    }
    sub_100005D28(v11);
  }
  v12 = *v4;
  Hasher.init(_seed:)(v28, *(_QWORD *)(*v4 + 40));
  String.hash(into:)(v28, v8, a2);
  result = Hasher._finalize()();
  v13 = -1 << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  v14 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v15 = *(_QWORD *)(v12 + 48);
    v16 = (_QWORD *)(v15 + 16 * a3);
    v17 = v16[1];
    v18 = *v16 == v8 && v17 == a2;
    if (v18 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, a2, 0), (result & 1) != 0))
    {
LABEL_21:
      result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }
    else
    {
      v19 = ~v13;
      while (1)
      {
        a3 = (a3 + 1) & v19;
        if (((*(_QWORD *)(v14 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v20 = (_QWORD *)(v15 + 16 * a3);
        v21 = v20[1];
        if (*v20 != v8 || v21 != a2)
        {
          result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, a2, 0);
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v23 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v24 = (uint64_t *)(*(_QWORD *)(v23 + 48) + 16 * a3);
  *v24 = v8;
  v24[1] = a2;
  v25 = *(_QWORD *)(v23 + 16);
  v26 = __OFADD__(v25, 1);
  v27 = v25 + 1;
  if (v26)
    __break(1u);
  else
    *(_QWORD *)(v23 + 16) = v27;
  return result;
}

void *sub_10000562C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = type metadata accessor for UUID(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100001CE4(&qword_10000C080);
  v6 = *v0;
  v7 = static _SetStorage.copy(original:)(*v0);
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release(v6);
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release(v6);
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_100005850()
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
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_100001CE4(&qword_10000C068);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain(v18);
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100005A00(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int64_t v37;

  v2 = v1;
  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  sub_100001CE4(&qword_10000C080);
  v9 = static _SetStorage.resize(original:capacity:move:)(v8, a1, 0);
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
  {
    result = swift_release(v8);
LABEL_37:
    *v2 = v10;
    return result;
  }
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 56);
  v35 = v2;
  v36 = v8 + 56;
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v37 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 56;
  result = swift_retain(v8);
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v20 = v19 | (v17 << 6);
      goto LABEL_26;
    }
    v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v21 >= v37)
      goto LABEL_35;
    v22 = *(_QWORD *)(v36 + 8 * v21);
    ++v17;
    if (!v22)
    {
      v17 = v21 + 1;
      if (v21 + 1 >= v37)
        goto LABEL_35;
      v22 = *(_QWORD *)(v36 + 8 * v17);
      if (!v22)
      {
        v17 = v21 + 2;
        if (v21 + 2 >= v37)
          goto LABEL_35;
        v22 = *(_QWORD *)(v36 + 8 * v17);
        if (!v22)
          break;
      }
    }
LABEL_25:
    v14 = (v22 - 1) & v22;
    v20 = __clz(__rbit64(v22)) + (v17 << 6);
LABEL_26:
    v24 = *(_QWORD *)(v5 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(_QWORD *)(v8 + 48) + v24 * v20, v4);
    v25 = *(_QWORD *)(v10 + 40);
    v26 = sub_100006BA8(&qword_10000C070, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v25, v4, v26);
    v27 = -1 << *(_BYTE *)(v10 + 32);
    v28 = result & ~v27;
    v29 = v28 >> 6;
    if (((-1 << v28) & ~*(_QWORD *)(v15 + 8 * (v28 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v15 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v32 = v29 == v31;
        if (v29 == v31)
          v29 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v15 + 8 * v29);
      }
      while (v33 == -1);
      v18 = __clz(__rbit64(~v33)) + (v29 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v10 + 48) + v18 * v24, v7, v4);
    ++*(_QWORD *)(v10 + 16);
  }
  v23 = v21 + 3;
  if (v23 >= v37)
  {
LABEL_35:
    result = swift_release_n(v8, 2);
    v2 = v35;
    goto LABEL_37;
  }
  v22 = *(_QWORD *)(v36 + 8 * v23);
  if (v22)
  {
    v17 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v17 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v17 >= v37)
      goto LABEL_35;
    v22 = *(_QWORD *)(v36 + 8 * v17);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_39:
  __break(1u);
  return result;
}

Swift::Int sub_100005D28(uint64_t a1)
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
  uint64_t v11;
  Swift::Int result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  int64_t v32;
  _QWORD v33[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100001CE4(&qword_10000C068);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v31 = v2;
  v32 = (unint64_t)(v7 + 63) >> 6;
  v11 = v5 + 56;
  result = swift_retain(v3);
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_27;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v13;
    if (!v19)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v32)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v13);
      if (!v19)
      {
        v13 = v18 + 2;
        if (v18 + 2 >= v32)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v13);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
    v22 = *v21;
    v23 = v21[1];
    Hasher.init(_seed:)(v33, *(_QWORD *)(v6 + 40));
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v33, v22, v23);
    result = Hasher._finalize()();
    v24 = -1 << *(_BYTE *)(v6 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v26);
      }
      while (v30 == -1);
      v14 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
    *v15 = v22;
    v15[1] = v23;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v31;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v13 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v13 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v13 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v13);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_100005FD4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100005FF0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100005FF0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    v10 = sub_100001CE4(&qword_10000C058);
    v11 = (char *)swift_allocObject(v10, 24 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 24);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[24 * v8])
      memmove(v13, v14, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[24 * v8] || v13 >= &v14[24 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100006174(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

int64_t sub_100006214(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

Swift::Int sub_1000062F8(uint64_t a1)
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
    sub_100001CE4(&qword_10000C068);
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

uint64_t sub_100006498()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000064C4(uint64_t a1)
{
  uint64_t v1;

  return sub_100003A0C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1000064CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000064DC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000064E4(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

uint64_t sub_1000064F4(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  uint64_t v8[2];

  if (result)
  {
    v2 = String.init(cString:)();
    v4 = v3;
    v7[0] = v2;
    v7[1] = v3;
    strcpy((char *)v8, ".development");
    BYTE5(v8[1]) = 0;
    HIWORD(v8[1]) = -5120;
    v5 = sub_1000065BC();
    if ((StringProtocol.contains<A>(_:)(v8, &type metadata for String, &type metadata for String, v5, v5) & 1) != 0)
    {
      v6 = v4;
    }
    else
    {
      swift_beginAccess(v1 + 16, v7, 33, 0);
      sub_100004A9C(v8, v2, v4);
      swift_endAccess(v7);
      v6 = v8[1];
    }
    return swift_bridgeObjectRelease(v6);
  }
  return result;
}

unint64_t sub_1000065BC()
{
  unint64_t result;

  result = qword_10000C060;
  if (!qword_10000C060)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

uint64_t sub_100006600(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100001CE4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_100006644(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100006654(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t destroy for TransferResponseItem(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_release(*(_QWORD *)(a1 + 16));
}

_QWORD *_s15dtfetchsymbolsd20TransferResponseItemVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain(v3);
  swift_retain(v4);
  return a1;
}

_QWORD *assignWithCopy for TransferResponseItem(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = a2[2];
  v7 = a1[2];
  a1[2] = v6;
  swift_retain(v6);
  swift_release(v7);
  return a1;
}

__n128 initializeWithTake for TransferResponseItem(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *assignWithTake for TransferResponseItem(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;

  *a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease(a1[1]);
  v4 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for TransferResponseItem(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TransferResponseItem(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TransferResponseItem()
{
  return &type metadata for TransferResponseItem;
}

_QWORD *sub_10000684C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100006870()
{
  unint64_t result;

  result = qword_10000C2B0[0];
  if (!qword_10000C2B0[0])
  {
    result = swift_getWitnessTable(&unk_1000075BC, &type metadata for TransferResponseItem.CodingKeys);
    atomic_store(result, qword_10000C2B0);
  }
  return result;
}

uint64_t sub_1000068B4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x68746150656C6966 && a2 == 0xE800000000000000;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x68746150656C6966, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0;
  }
  else if (a1 == 0x6E617254656C6966 && a2 == 0xEC00000072656673)
  {
    swift_bridgeObjectRelease(0xEC00000072656673);
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E617254656C6966, 0xEC00000072656673, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1000069AC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;

  v3 = sub_100001CE4(&qword_10000C0B0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  sub_10000684C(a1, v7);
  v9 = sub_100006870();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for TransferResponseItem.CodingKeys, &type metadata for TransferResponseItem.CodingKeys, v9, v7, v8);
  if (v1)
  {
    sub_100006B88(a1);
  }
  else
  {
    v19 = 0;
    v8 = KeyedDecodingContainer.decode(_:forKey:)(&v19, v3);
    v12 = v11;
    v13 = type metadata accessor for XPCFileTransfer(0);
    v17 = 1;
    v14 = sub_100006BA8(&qword_10000C0B8, (uint64_t (*)(uint64_t))&type metadata accessor for XPCFileTransfer, (uint64_t)&protocol conformance descriptor for XPCFileTransfer);
    swift_bridgeObjectRetain(v12);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v18, v13, &v17, v3, v13, v14);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v15 = v18;
    swift_retain(v18);
    sub_100006B88(a1);
    swift_release(v15);
    swift_bridgeObjectRelease(v12);
  }
  return v8;
}

uint64_t sub_100006B88(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100006BA8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

_BYTE *initializeBufferWithCopyOfBuffer for TransferResponseItem.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TransferResponseItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TransferResponseItem.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_100006CD4 + 4 * byte_100007465[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100006D08 + 4 * byte_100007460[v4]))();
}

uint64_t sub_100006D08(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006D10(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100006D18);
  return result;
}

uint64_t sub_100006D24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100006D2CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100006D30(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006D38(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006D44(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100006D50(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TransferResponseItem.CodingKeys()
{
  return &type metadata for TransferResponseItem.CodingKeys;
}

unint64_t sub_100006D70()
{
  unint64_t result;

  result = qword_10000C3C0[0];
  if (!qword_10000C3C0[0])
  {
    result = swift_getWitnessTable(&unk_100007594, &type metadata for TransferResponseItem.CodingKeys);
    atomic_store(result, qword_10000C3C0);
  }
  return result;
}

unint64_t sub_100006DB8()
{
  unint64_t result;

  result = qword_10000C4D0;
  if (!qword_10000C4D0)
  {
    result = swift_getWitnessTable(&unk_100007504, &type metadata for TransferResponseItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10000C4D0);
  }
  return result;
}

unint64_t sub_100006E00()
{
  unint64_t result;

  result = qword_10000C4D8[0];
  if (!qword_10000C4D8[0])
  {
    result = swift_getWitnessTable(&unk_10000752C, &type metadata for TransferResponseItem.CodingKeys);
    atomic_store(result, qword_10000C4D8);
  }
  return result;
}
