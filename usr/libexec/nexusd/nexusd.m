void sub_100002F3C(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (__cdecl *v16)(int);
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[5];

  v2 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin();
  v4 = (char *)&v26[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DispatchQoS(0);
  __chkstk_darwin();
  v6 = (char *)&v26[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v26[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for MainActor(0);
  v12 = static MainActor.shared.getter();
  v13 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
  v15 = v14;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("nexusd/nexusd.swift", 19, 1, 11, v13, v15);
  if (!sub_1000034DC())
    exit(1);
  v16 = (void (__cdecl *)(int))SIG_IGN.getter();
  signal(13, v16);
  sub_10000334C();
  v17 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v7);
  static DispatchQoS.unspecified.getter(v17);
  v26[0] = &_swiftEmptyArrayStorage;
  v18 = sub_100003388();
  v19 = sub_1000033D0(&qword_100008010);
  v20 = sub_100003410();
  dispatch thunk of SetAlgebra.init<A>(_:)(v26, v19, v20, v2, v18);
  v21 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0x6E6F6D656144584ELL, 0xE800000000000000, v6, v4, v10, 0);
  v26[3] = type metadata accessor for NXDaemonEnvironmentDarwin(0);
  v26[4] = &protocol witness table for NXDaemonEnvironmentDarwin;
  sub_1000034A0(v26);
  v22 = v21;
  NXDaemonEnvironmentDarwin.init()();
  v23 = type metadata accessor for NXDaemon(0);
  swift_allocObject(v23, *(unsigned int *)(v23 + 48), *(unsigned __int16 *)(v23 + 52));
  v24 = NXDaemon.init(dispatchQueue:environment:)(v22, v26);
  NXDaemon.activate()();
  swift_release(v12);

  *a1 = v24;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = type metadata accessor for MainActor(0);
  v4 = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v7 = v6;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("", 0, 1, 0, v5, v7);
  sub_100003258();
  swift_release(v4);
  return 0;
}

void sub_100003258()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = type metadata accessor for MainActor(0);
  static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  v4 = v3;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("nexusd/nexusd.swift", 19, 1, 10, v2, v4);
  v5 = objc_autoreleasePoolPush();
  sub_100002F3C(&v9);
  if (!v0)
  {
    objc_autoreleasePoolPop(v5);
    static MainActor.shared.getter();
    v6 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
    v8 = v7;
    if ((swift_task_isCurrentExecutor() & 1) == 0)
      swift_task_reportUnexpectedExecutor("nexusd/nexusd.swift", 19, 1, 25, v6, v8);
    dispatch_main();
  }
  objc_autoreleasePoolPop(v5);
  __break(1u);
}

ValueMetadata *type metadata accessor for Main()
{
  return &type metadata for Main;
}

unint64_t sub_10000334C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008000;
  if (!qword_100008000)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100008000);
  }
  return result;
}

unint64_t sub_100003388()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008008;
  if (!qword_100008008)
  {
    v1 = type metadata accessor for OS_dispatch_queue.Attributes(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue.Attributes, v1);
    atomic_store(result, (unint64_t *)&qword_100008008);
  }
  return result;
}

uint64_t sub_1000033D0(uint64_t *a1)
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

unint64_t sub_100003410()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008018;
  if (!qword_100008018)
  {
    v1 = sub_10000345C(&qword_100008010);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100008018);
  }
  return result;
}

uint64_t sub_10000345C(uint64_t *a1)
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

_QWORD *sub_1000034A0(_QWORD *a1)
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

BOOL sub_1000034DC()
{
  size_t v0;
  _BOOL8 v1;
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  int v7;
  int v8;
  _DWORD v9[4];
  uint8_t buf[4];
  int v11;

  if ((_set_user_dir_suffix("com.apple.nexusd") & 1) != 0)
  {
    bzero(buf, 0x400uLL);
    v0 = confstr(65537, (char *)buf, 0x400uLL);
    v1 = v0 != 0;
    if (!v0)
    {
      v2 = sub_10000362C();
      v3 = objc_claimAutoreleasedReturnValue(v2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v8 = *__error();
        v9[0] = 67109120;
        v9[1] = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "### confstr temp dir failed: %{darwin.errno}d", (uint8_t *)v9, 8u);
      }

    }
  }
  else
  {
    v4 = sub_10000362C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *__error();
      *(_DWORD *)buf = 67109120;
      v11 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "### _set_user_dir_suffix failed: %{darwin.errno}d", buf, 8u);
    }

    return 0;
  }
  return v1;
}

id sub_10000362C()
{
  if (qword_100008028 != -1)
    dispatch_once(&qword_100008028, &stru_100004290);
  return (id)qword_100008020;
}

void sub_10000366C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.nexus", "NXDaemon");
  v2 = (void *)qword_100008020;
  qword_100008020 = (uint64_t)v1;

}
